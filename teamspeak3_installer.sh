sed -i -e 's/\r$//' teamspeak3_installer.sh
#!/bin/bash



function magentaMessage() {
echo -e "\\033[35;1m${@}\033[0m"
}

function greenMessage() {
	echo -e "\\033[32;1m${@}\033[0m"
}


function kekMessage() {
	echo -e "\\033[36;1m${@}\033[0m"
}

function yellowMessage() {
	echo -e "\\033[33;1m${@}\033[0m"
}

function whiteMessage() {
	echo -e "\033[0;37m${@}\033[0m"
}

function grayMessage() {
  echo -e "\033[0;30m${@}\033[0m"
}

clear
sleep 2.0
kekMessage "#######################################################"
whiteMessage "                   .xyz Scripts                      "
whiteMessage "        Webseite: https://www.leonhuber.de/          "
kekMessage "#######################################################"
whiteMessage "      TeamSpeak3 Server Installer by .xyz Scripts       "
whiteMessage "        Version 1.1.2 - Beta - for Debian 8/9/10        "
kekMessage "#######################################################"
sleep 5.0

clear
clear
clear

greenMessage "Dein Server wird geupdated. Bitte Warten!"
sleep 2
apt-get update
magentaMessage "Der Server wurde erfolgreich geupdated!"
sleep 2
clear
greenMessage "Dein Server wird geupgradet. Bitte Warten!"
sleep 2
apt-get upgrade -y
magentaMessage "Der Server wurde erfolgreich geupgradet!"
sleep 2
clear

clear
echo ""
magentaMessage "Soll ein neuer User angelegt werden?"
echo ""
whiteMessage "1) Ja"
whiteMessage "2) Nein"
echo ""
read -p "-> " user

if [ "$user" = "1" ]; then
clear
greenMessage "Es wird ein neuer User angelegt. Bitte geben sie gleich ihr Passwort für denn User ein!"
sleep 5
adduser ts3
su - ts3
clear
magentaMessage "Der User wurde erfolgreich angelegt."
clear

greenMessage "TeamSpeak3 Server wird installiert!"
sleep 2
wget https://package.leonhuber.de/teamspeak3-server_linux_amd64-3.12.1.tar.bz2
tar xfvj teamspeak3-server_linux_amd64-3.12.1.tar.bz2
rm teamspeak3-server_linux_amd64-3.12.1.tar.bz2
cd teamspeak3-server_linux_amd64

clear
echo ""
magentaMessage "Sind sie mit den TeamSpeak3 Lizenzbedingungen einverstanden?"
echo ""
whiteMessage "1) Ja"
whiteMessage "2) Nein"
echo ""
read -p "-> " ts3server

if [ "$ts3server" = "1" ]; then
touch .ts3server_license_accepted
magentaMessage "Der TeamSpeak3 Server wurde erfolgreich installiert"
sleep 2
fi

if [ "$ts3server" = "2" ]; then
greenMessage "Um das Script nutzen zu können must du denn TeamSpeak3 Lizenzbedingungen von TeamSpeak zustimmen!"
cd /home/
rm -r teamspeak3-server_linux_amd64
exit 0
fi

fi

if [ "$user" = "2" ]; then
greenMessage "TeamSpeak3 Server wird installiert!"
sleep 2
cd /home/
wget https://package.leonhuber.de/teamspeak3-server_linux_amd64-3.12.1.tar.bz2
tar xfvj teamspeak3-server_linux_amd64-3.12.1.tar.bz2
rm teamspeak3-server_linux_amd64-3.12.1.tar.bz2
cd teamspeak3-server_linux_amd64
clear
fi

greenMessage "Der TeamSpeak3 Server wird nun gestartet. Bitte warten!"
sleep 2
./ts3server_startscript.sh start
magentaMessage "Der TeamSpeak3 Server wurde erfolgreich gestartet."
greenMessage   "Der Berechtigungsschlüssel und die Querydaten werden abgerufen..."
sleep 3
echo ""
echo ""
echo ""
echo ""

greenMessage "Vielen Dank für das Nutzen meines Scriptes!"
sleep 2.5
exit
