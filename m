Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 52DB496E387
	for <lists+xen-devel@lfdr.de>; Thu,  5 Sep 2024 21:52:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.791338.1201204 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1smIW1-0005W8-It; Thu, 05 Sep 2024 19:51:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 791338.1201204; Thu, 05 Sep 2024 19:51:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1smIW1-0005Tr-Fq; Thu, 05 Sep 2024 19:51:37 +0000
Received: by outflank-mailman (input) for mailman id 791338;
 Thu, 05 Sep 2024 19:41:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ww8K=QD=gmail.com=nareshkumar.ravulapalli@srs-se1.protection.inumbo.net>)
 id 1smIM2-0003iS-8w
 for xen-devel@lists.xenproject.org; Thu, 05 Sep 2024 19:41:18 +0000
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [2a00:1450:4864:20::42f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d0977b78-6bbe-11ef-99a1-01e77a169b0f;
 Thu, 05 Sep 2024 21:41:16 +0200 (CEST)
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-374c6187b6eso748664f8f.0
 for <xen-devel@lists.xenproject.org>; Thu, 05 Sep 2024 12:41:16 -0700 (PDT)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: d0977b78-6bbe-11ef-99a1-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725565275; x=1726170075; darn=lists.xenproject.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=xRsPKlSux/42RpQuwUukr3i1F579OKn8tOaKkB1I/QI=;
        b=i/PChvqWgHtDPQhOLHenl5+4iLLMvJBVwks7s2gOeOkdlDVKVLAsnMtO/k+h56QkO4
         qGNlReLB34ISy/e7W5x7fG3wE6ou9WtOHW9uVe4JKntrdLA3q3ikZMsHD7qTc9/npmCy
         3Ytzyuyrnc5NhQPGV7tlnd6MdYf8EmILCJ8DX+O0as7DPdS/TUsgE4qDcf5+aM3ExNxn
         EaJ3bnWmExnsuNxtZ2re0NRnHInIGDknryagsMgiHujhCeyLEEw1w/GdqaiVuVGIIJUd
         GD5td2lRXu3QW1PyrEOmf8iSFNFyTZxGM/hbPm5NfL0JIttPy09hCK5FL66TSf82bIJN
         Z4HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725565275; x=1726170075;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xRsPKlSux/42RpQuwUukr3i1F579OKn8tOaKkB1I/QI=;
        b=BEBVPI1FeCZvP3BT2FLcd6+O1EFmd1mlVkppo1Y4DYyN8RleQFy4ls1Jk+6iVRYYv0
         baHfQ9kfjrPllvh2ohQhH+sEP/WBtTfQjB0y6w6SCh3mz8U5nrS1ike6r8fpiiqOXXSL
         rwJKrDf7ZDCbRykcT+hSrj4QlQQ3f9w58i/PoWFgz0L7jVVlZ+ZJ1mi8CJfekyUAclzD
         pXp5x101hvbzi0+Tkiz88HZ3GRU2lJXnT3fA0Qtlh1SIh7L5y+pz3bOtvEREZnJ7tT2a
         DdJWl+RsRNeBHnRj9rLohqkMB2JS17Wszr5kK6HAaLehRgSfuUeJRKAHxUpqp4GU8OLb
         6siw==
X-Gm-Message-State: AOJu0YxxQyCtlhS7eRo7NuXLDtJrBuaq+7LrX6OSCsaIfXbreyC0IZum
	PmQV5Whd1C1Hmitxc19t3Yw3nJFTxEEv5UmtNDL+2XXHfX3q/8BZzbimbaYp1wluDKAFdCu/mdD
	Z0PKjH9q70BFMglD7GarUTZA1/TBNlp/Y
X-Google-Smtp-Source: AGHT+IGYrONR/yd+7xIKKqHFMi044V64mWc1gMa1onWlndcDk2xeKqtSfqk7z12FTRu9aBiNraQfj0Pg3daai8fei4M=
X-Received: by 2002:a05:6000:25c:b0:374:c10c:83b3 with SMTP id
 ffacd0b85a97d-3788969fcd7mr79248f8f.54.1725565274903; Thu, 05 Sep 2024
 12:41:14 -0700 (PDT)
MIME-Version: 1.0
From: Naresh Ravulapalli <nareshkumar.ravulapalli@gmail.com>
Date: Fri, 6 Sep 2024 01:11:03 +0530
Message-ID: <CAFWXJ4Tb5mhWzyKtxiL3+tvM=QGuSVfbEnuPFt+U9gmNdAXcrQ@mail.gmail.com>
Subject: Need help to support Xen on Zephyr
To: xen-devel@lists.xenproject.org
Content-Type: multipart/alternative; boundary="0000000000003f5a65062164796d"

--0000000000003f5a65062164796d
Content-Type: text/plain; charset="UTF-8"

Hi Team

I am trying to bring-up Zephyr as a domU guest with Linux as dom0. My
devkit has an ARM-A55 core and currently, Xen support in Zephyr (
https://github.com/zephyrproject-rtos/zephyr) is limited with only timer
and GIC virtualized with support to a HVC console.

I am trying to add more device support for Xen in Zephyr. So, I started
with enabling QSPI node in passthrough mode as I believe it is the simplest
way of quickly starting things as I am also new to Xen.

*Code/configuration changes done:*

   1. Disabled QSPI node in Linux (dom0) and enabled it in xen, passthrough
   mode

status = "disabled";
> xen,passthrough;
>

        2. Enabled QSPI node in Zephyr dts
        3. Created partial dts file which is used to create a dtb file to
pass in Zephyr's Xen configuration file (more information of Xen support in
Zephyr can be found here:
https://docs.zephyrproject.org/latest/boards/xen/xenvm/doc/index.html)


But I am running into issues where, during the first boot of Zephyr as domU
guest, I am able to read and write to the QSPI device but the first byte of
every page isn't written for some reason. Strangely, after I destroy the
Zephyr guest and create a new VM with the same config, binary and dtb, I am
unable to write any bytes; there are no errors printed on the HVC console
from Zephyr.

Note that the QSPI driver is working flawlessly in a standalone non-virtualized
Zephyr environment. Also, at the beginning of QSPI driver boot in Zephyr,
we query the size of the QSPI flash device by communicating with it, during
every boot this query is printing correct size; so the QSPI communication
seems to work but apparently anything to do with data transfers is failing.

Can someone help with the above issue, am I missing something obvious?

Thanks
Naresh

--0000000000003f5a65062164796d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_default" style=3D"font-family:arial,he=
lvetica,sans-serif;font-size:small">Hi Team</div><div class=3D"gmail_defaul=
t" style=3D"font-family:arial,helvetica,sans-serif;font-size:small"><br></d=
iv><div class=3D"gmail_default" style=3D"font-family:arial,helvetica,sans-s=
erif;font-size:small">I am trying to bring-up Zephyr as a domU guest with L=
inux as dom0. My devkit has an ARM-A55 core and currently, Xen support in Z=
ephyr (<a href=3D"https://github.com/zephyrproject-rtos/zephyr">https://git=
hub.com/zephyrproject-rtos/zephyr</a>) is limited with only timer and GIC v=
irtualized with support to a HVC console.</div><div class=3D"gmail_default"=
 style=3D"font-family:arial,helvetica,sans-serif;font-size:small"><br></div=
><div class=3D"gmail_default" style=3D"font-family:arial,helvetica,sans-ser=
if;font-size:small">I am trying to add more device support=C2=A0for Xen in =
Zephyr. So, I started with enabling QSPI node in passthrough mode as I beli=
eve it is the simplest way of quickly starting=C2=A0things as I am also new=
 to Xen.</div><div class=3D"gmail_default" style=3D"font-family:arial,helve=
tica,sans-serif;font-size:small"><br></div><div class=3D"gmail_default" sty=
le=3D"font-family:arial,helvetica,sans-serif;font-size:small"><b>Code/confi=
guration changes done:</b></div><div class=3D"gmail_default" style=3D"font-=
family:arial,helvetica,sans-serif;font-size:small"><ol><li>Disabled QSPI no=
de in Linux (dom0) and enabled it in xen, passthrough mode</li></ol><blockq=
uote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1p=
x solid rgb(204,204,204);padding-left:1ex">status =3D &quot;disabled&quot;;=
<br>	xen,passthrough;<br></blockquote><div>=C2=A0</div><div>=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 2. Enabled QSPI node in Zephyr dts=C2=A0</div><div>=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 3. Created partial dts file which is used to create a dtb=
 file to pass in Zephyr&#39;s Xen configuration file (more information of X=
en support in Zephyr can be found here:=C2=A0<a href=3D"https://docs.zephyr=
project.org/latest/boards/xen/xenvm/doc/index.html">https://docs.zephyrproj=
ect.org/latest/boards/xen/xenvm/doc/index.html</a>)</div><div>=C2=A0</div><=
/div><div class=3D"gmail_default" style=3D"font-family:arial,helvetica,sans=
-serif;font-size:small"><br></div><div class=3D"gmail_default" style=3D"fon=
t-family:arial,helvetica,sans-serif;font-size:small">But I am running into =
issues where,=C2=A0<font face=3D"arial, sans-serif"><span style=3D"margin:0=
px;padding:0px;border:0px;vertical-align:baseline;outline:0px">during the f=
irst boot of Zephyr as domU guest</span><span style=3D"margin:0px;padding:0=
px;border:0px;vertical-align:baseline;outline:0px">, I am able to read and =
write to the QSPI device but the first byte of every page isn</span><span s=
tyle=3D"margin:0px;padding:0px;border:0px;vertical-align:baseline;outline:0=
px">&#39;t written for some reason</span><span style=3D"margin:0px;padding:=
0px;border:0px;vertical-align:baseline;outline:0px">. Strangely</span><span=
 style=3D"margin:0px;padding:0px;border:0px;vertical-align:baseline;outline=
:0px">, after I destroy the Zephyr guest and create a new VM with the same =
config</span><span style=3D"margin:0px;padding:0px;border:0px;vertical-alig=
n:baseline;outline:0px">, binary and dtb</span><span style=3D"margin:0px;pa=
dding:0px;border:0px;vertical-align:baseline;outline:0px">, I am unable to =
write any bytes</span><span style=3D"margin:0px;padding:0px;border:0px;vert=
ical-align:baseline;outline:0px">; there are no errors printed on the HVC c=
onsole from Zephyr</span><span style=3D"margin:0px;padding:0px;border:0px;v=
ertical-align:baseline;outline:0px">. </span></font></div><div class=3D"gma=
il_default" style=3D"font-family:arial,helvetica,sans-serif;font-size:small=
"><font face=3D"arial, sans-serif"><span style=3D"margin:0px;padding:0px;bo=
rder:0px;vertical-align:baseline;outline:0px"><br></span></font></div><div =
class=3D"gmail_default" style=3D"font-family:arial,helvetica,sans-serif;fon=
t-size:small"><font face=3D"arial, sans-serif"><span style=3D"margin:0px;pa=
dding:0px;border:0px;vertical-align:baseline;outline:0px">Note that the QSP=
I driver is working flawlessly in a standalone non</span><span style=3D"mar=
gin:0px;padding:0px;border:0px;vertical-align:baseline;outline:0px">-virtua=
lized Zephyr environment</span><span style=3D"margin:0px;padding:0px;border=
:0px;vertical-align:baseline;outline:0px">. Also, at the beginning of QSPI =
driver boot in Zephyr, we query the size of the QSPI flash device by commun=
icating with it, during every boot this query is printing correct size; so =
the QSPI communication seems to work but apparently anything to do with dat=
a transfers is failing.</span></font></div><div class=3D"gmail_default" sty=
le=3D"font-family:arial,helvetica,sans-serif;font-size:small"><span style=
=3D"font-size:16px;font-family:&quot;gg sans&quot;,&quot;Noto Sans&quot;,&q=
uot;Helvetica Neue&quot;,Helvetica,Arial,sans-serif,&quot;Apple Symbols&quo=
t;;margin:0px;padding:0px;border:0px;vertical-align:baseline;outline:0px"><=
br></span></div><div class=3D"gmail_default" style=3D"font-family:arial,hel=
vetica,sans-serif"><span style=3D"font-family:&quot;gg sans&quot;,&quot;Not=
o Sans&quot;,&quot;Helvetica Neue&quot;,Helvetica,Arial,sans-serif,&quot;Ap=
ple Symbols&quot;;margin:0px;padding:0px;border:0px;vertical-align:baseline=
;outline:0px">Can someone help with the above issue, am I missing something=
 obvious?</span></div><div class=3D"gmail_default" style=3D"font-family:ari=
al,helvetica,sans-serif;font-size:small"><br></div><div><div dir=3D"ltr" cl=
ass=3D"gmail_signature" data-smartmail=3D"gmail_signature"><div dir=3D"ltr"=
><div><div dir=3D"ltr"><span class=3D"gmail_default" style=3D"font-family:a=
rial,helvetica,sans-serif;font-size:small"></span>T<span class=3D"gmail_def=
ault" style=3D"font-family:arial,helvetica,sans-serif;font-size:small">hank=
s</span><div>Naresh<div><br></div></div></div></div></div></div></div></div=
>

--0000000000003f5a65062164796d--

