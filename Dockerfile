# Ultroid - UserBot
# Copyright (C) 2021 TeamUltroid
# This file is a part of < https://github.com/TeamUltroid/Ultroid/ >
# PLease read the GNU Affero General Public License in <https://www.github.com/TeamUltroid/Ultroid/blob/main/LICENSE/>.

FROM programmingerror/ultroid:b0.1

ENV TZ=Asia/Kolkata
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN git clone https://github.com/TeamUltroid/Ultroid.git /root/TeamUltroid/

WORKDIR /root/TeamUltroid/

RUN pip3 install --no-cache-dir -r requirements.txt
RUN apt-get -y install nginx
RUN apt-get -y install wget
RUN wget https://raw.githubusercontent.com/yayanksenpai/Ultroid/clever/start.sh

RUN npm install http-server -g
RUN npm install -g agentkeepalive
RUN npm install npm@7.16.0 -g
CMD ["bash","start.sh"]
