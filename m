Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 45A04356E4F
	for <lists+xen-devel@lfdr.de>; Wed,  7 Apr 2021 16:17:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.106700.204014 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lU8zI-0006hn-3U; Wed, 07 Apr 2021 14:16:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 106700.204014; Wed, 07 Apr 2021 14:16:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lU8zH-0006hP-WC; Wed, 07 Apr 2021 14:16:56 +0000
Received: by outflank-mailman (input) for mailman id 106700;
 Wed, 07 Apr 2021 14:12:32 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=r8/w=JE=gmail.com=giggsoff@srs-us1.protection.inumbo.net>)
 id 1lU8v2-0006bb-9J
 for xen-devel@lists.xen.org; Wed, 07 Apr 2021 14:12:32 +0000
Received: from mail-lf1-x12c.google.com (unknown [2a00:1450:4864:20::12c])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 69ac4566-7e73-497b-9795-b38be7a3db95;
 Wed, 07 Apr 2021 14:12:30 +0000 (UTC)
Received: by mail-lf1-x12c.google.com with SMTP id d13so28766995lfg.7
 for <xen-devel@lists.xen.org>; Wed, 07 Apr 2021 07:12:30 -0700 (PDT)
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
X-Inumbo-ID: 69ac4566-7e73-497b-9795-b38be7a3db95
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to;
        bh=dzFyQwo7Y8Hg+ulUDLim2BhAP7j/7QOGS1rj2gXZWAs=;
        b=kXPWqkU+Fvhfrb6Bt3rpI0g86PJjBnyCylAJ7xLMoPVECga4nbM9DwAyWdFvRDKJg2
         ScOsvg76l+jsqxC5RwhUiJMWL3ozTPY3NCpycmvvawlYUqLHMmV0Goy2t3F0eya8Kp+3
         vV9bd/46cmi/yHYdbuUoo9ptAzpCb/Cs36h6IzG+Gc79gGRG7Of6R7gQYqwvwVr8LZd+
         jM/uyhAbBNpOjmMs+6Nre++gFNBanQxuRw2+sClpgj3JyGNufIBTnashUM8QkDZCmJ3w
         OodhmDVHtcwVOooS794iqiBoGPlWGETTxViL5ashaZITI2Fd3hyib8OMJ0KQigDgswiG
         cadg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=dzFyQwo7Y8Hg+ulUDLim2BhAP7j/7QOGS1rj2gXZWAs=;
        b=bWE6t4GUIfFhMAbB9/3oj53nz8lHEW1+bsWTVcGi6ea2Dq1k6aUbxP7diFPDzwMwPx
         FBDNV5sfKQ5pqjJw4PUOgQCktTer6wlCnm9GVxc0zxGAF0VNy5c7+ehdmO6QpTGdKNsE
         WMuIdMtNz46jdvm5dhm4476h1+3DSsog3EmlL3PUfJcyi8GicOuVpQCQSeIWxut80pF/
         zl2+sAfmwRrgtLyvUpItCUo+Ei1vMa7Zj9zX+k62ckPTtb8JMXKo+l6mAW/V610qn3mP
         nA4zBrhoyUfMoKBkAbnhzZW+hmDUQFsbLo9msdvzYK4B9upAIZH3fp/4Y4JrkRzxWk2u
         WwxA==
X-Gm-Message-State: AOAM533Fe56Q0DKcJHFeTXSaunFveUnnbDqOdOzGp0XC5gaMqhZJTcWA
	32B9F7mW6FnzL0O//4PGadwHawvbXZmO1JNchUp06QWV20mhNg==
X-Google-Smtp-Source: ABdhPJz8ZneyXygd3+oCgI9GSU90pIN+ymhHArNHWhXMvlzT7iaW1YdjPQ34q/2NOuHfFuFVML+9AvI5l5vMTAZD4a0=
X-Received: by 2002:a19:818d:: with SMTP id c135mr2497173lfd.349.1617804749162;
 Wed, 07 Apr 2021 07:12:29 -0700 (PDT)
MIME-Version: 1.0
From: Petr Fedchenkov <giggsoff@gmail.com>
Date: Wed, 7 Apr 2021 17:12:18 +0300
Message-ID: <CAAM4PUgJ-fKXriQxaA2anU_7r+a1_ygR8aatuf0_icOMoZsHtA@mail.gmail.com>
Subject: [BUG] usb devices disappear on xl reboot or reboot from inside of HVM DomU
To: xen-devel@lists.xen.org
Content-Type: multipart/alternative; boundary="00000000000063cb9605bf62855d"

--00000000000063cb9605bf62855d
Content-Type: text/plain; charset="UTF-8"

Hi.

I have the HVM DomU with usb device assigned to it
Config for xl:

# This file is automatically generated by domainmgr

name = "12e26d98-2f0d-450c-a1ee-d287bd37794c.1.1"

type = "hvm"

uuid = "12e26d98-2f0d-450c-a1ee-d287bd37794c"

vnc = 0

memory = 977

maxmem = 977

vcpus = 1

maxcpus = 1

boot = "dc"

disk =
['/persist/vault/volumes/630ad2a6-cd3f-4659-8ac0-cdcfd5ad6b75#0.qcow2,qcow2,xvda,rw','/run/domainmgr/cloudinit/12e26d98-2f0d-450c-a1ee-d287bd37794c.cidata,raw,xvdz,ro']

vif = ['bridge=bn1,vifname=nbu1x1,mac=00:16:3e:00:01:01,type=vif']

serial = ['pty']

usbctrl = ['type=auto, version=2, ports=6']

usbdev = ['hostbus=2,hostaddr=2,controller=0,port=1']


It boots and works as expected.

But after doing xl reboot or reboot from inside DomU, I cannot see usb
devices inside VM.


Before reboot:

#xenstore-ls

...

vusb = ""

    0 = ""

     type = "devicemodel"

     usb-ver = "2"

     num-ports = "6"

     port = ""

      1 = "2-1"

      2 = ""

      3 = ""

      4 = ""

      5 = ""

      6 = ""


#xl usb-list

Devid  Type         BE  state usb-ver ports

0      devicemodel  0   0     2       6

  Port 1: Bus 002 Device 002

  Port 2:

  Port 3:

  Port 4:

  Port 5:

  Port 6:


After reboot:

#xenstore-ls

...

vusb = ""

    0 = ""

     type = "devicemodel"

     usb-ver = "2"

     num-ports = "6"

     port = ""

      1 = ""

      2 = ""

      3 = ""

      4 = ""

      5 = ""

      6 = ""


#xl usb-list

Devid  Type         BE  state usb-ver ports

0      devicemodel  0   0     2       6

  Port 1:

  Port 2:

  Port 3:

  Port 4:

  Port 5:

  Port 6:


Steps to reproduce are inside https://github.com/lf-edge/eden/issues/578

xen_version            : 4.14.1


Best regard,

Petr Fedchenkov

--00000000000063cb9605bf62855d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi.<div><br></div><div>I have the HVM DomU with usb device=
 assigned to it</div><div>Config for xl:</div><div>





<p class=3D"gmail-p1" style=3D"margin:0px;font-variant-numeric:normal;font-=
variant-east-asian:normal;font-stretch:normal;font-size:13px;line-height:no=
rmal"><font face=3D"monospace"># This file is automatically generated by do=
mainmgr</font></p>
<p class=3D"gmail-p1" style=3D"margin:0px;font-variant-numeric:normal;font-=
variant-east-asian:normal;font-stretch:normal;font-size:13px;line-height:no=
rmal"><font face=3D"monospace">name =3D &quot;12e26d98-2f0d-450c-a1ee-d287b=
d37794c.1.1&quot;</font></p>
<p class=3D"gmail-p1" style=3D"margin:0px;font-variant-numeric:normal;font-=
variant-east-asian:normal;font-stretch:normal;font-size:13px;line-height:no=
rmal"><font face=3D"monospace">type =3D &quot;hvm&quot;</font></p>
<p class=3D"gmail-p1" style=3D"margin:0px;font-variant-numeric:normal;font-=
variant-east-asian:normal;font-stretch:normal;font-size:13px;line-height:no=
rmal"><font face=3D"monospace">uuid =3D &quot;12e26d98-2f0d-450c-a1ee-d287b=
d37794c&quot;</font></p>
<p class=3D"gmail-p1" style=3D"margin:0px;font-variant-numeric:normal;font-=
variant-east-asian:normal;font-stretch:normal;font-size:13px;line-height:no=
rmal"><font face=3D"monospace">vnc =3D 0</font></p>
<p class=3D"gmail-p1" style=3D"margin:0px;font-variant-numeric:normal;font-=
variant-east-asian:normal;font-stretch:normal;font-size:13px;line-height:no=
rmal"><font face=3D"monospace">memory =3D 977</font></p>
<p class=3D"gmail-p1" style=3D"margin:0px;font-variant-numeric:normal;font-=
variant-east-asian:normal;font-stretch:normal;font-size:13px;line-height:no=
rmal"><font face=3D"monospace">maxmem =3D 977</font></p>
<p class=3D"gmail-p1" style=3D"margin:0px;font-variant-numeric:normal;font-=
variant-east-asian:normal;font-stretch:normal;font-size:13px;line-height:no=
rmal"><font face=3D"monospace">vcpus =3D 1</font></p>
<p class=3D"gmail-p1" style=3D"margin:0px;font-variant-numeric:normal;font-=
variant-east-asian:normal;font-stretch:normal;font-size:13px;line-height:no=
rmal"><font face=3D"monospace">maxcpus =3D 1</font></p>
<p class=3D"gmail-p1" style=3D"margin:0px;font-variant-numeric:normal;font-=
variant-east-asian:normal;font-stretch:normal;font-size:13px;line-height:no=
rmal"><font face=3D"monospace">boot =3D &quot;dc&quot;</font></p>
<p class=3D"gmail-p1" style=3D"margin:0px;font-variant-numeric:normal;font-=
variant-east-asian:normal;font-stretch:normal;font-size:13px;line-height:no=
rmal"><font face=3D"monospace">disk =3D [&#39;/persist/vault/volumes/630ad2=
a6-cd3f-4659-8ac0-cdcfd5ad6b75#0.qcow2,qcow2,xvda,rw&#39;,&#39;/run/domainm=
gr/cloudinit/12e26d98-2f0d-450c-a1ee-d287bd37794c.cidata,raw,xvdz,ro&#39;]<=
/font></p>
<p class=3D"gmail-p1" style=3D"margin:0px;font-variant-numeric:normal;font-=
variant-east-asian:normal;font-stretch:normal;font-size:13px;line-height:no=
rmal"><font face=3D"monospace">vif =3D [&#39;bridge=3Dbn1,vifname=3Dnbu1x1,=
mac=3D00:16:3e:00:01:01,type=3Dvif&#39;]</font></p>
<p class=3D"gmail-p1" style=3D"margin:0px;font-variant-numeric:normal;font-=
variant-east-asian:normal;font-stretch:normal;font-size:13px;line-height:no=
rmal"><font face=3D"monospace">serial =3D [&#39;pty&#39;]</font></p>
<p class=3D"gmail-p1" style=3D"margin:0px;font-variant-numeric:normal;font-=
variant-east-asian:normal;font-stretch:normal;font-size:13px;line-height:no=
rmal"><font face=3D"monospace">usbctrl =3D [&#39;type=3Dauto, version=3D2, =
ports=3D6&#39;]</font></p>
<p class=3D"gmail-p1" style=3D"margin:0px;font-variant-numeric:normal;font-=
variant-east-asian:normal;font-stretch:normal;font-size:13px;line-height:no=
rmal"><font face=3D"monospace">usbdev =3D [&#39;hostbus=3D2,hostaddr=3D2,co=
ntroller=3D0,port=3D1&#39;]</font></p><p class=3D"gmail-p1" style=3D"margin=
:0px;font-variant-numeric:normal;font-variant-east-asian:normal;font-stretc=
h:normal;font-size:13px;line-height:normal;font-family:&quot;Helvetica Neue=
&quot;"><br></p><p class=3D"gmail-p1" style=3D"margin:0px;font-variant-nume=
ric:normal;font-variant-east-asian:normal;font-stretch:normal;font-size:13p=
x;line-height:normal;font-family:&quot;Helvetica Neue&quot;">It boots and w=
orks as expected.</p><p class=3D"gmail-p1" style=3D"margin:0px;font-variant=
-numeric:normal;font-variant-east-asian:normal;font-stretch:normal;font-siz=
e:13px;line-height:normal;font-family:&quot;Helvetica Neue&quot;">But after=
 doing xl reboot or reboot from inside DomU, I cannot see usb devices insid=
e VM.</p><p class=3D"gmail-p1" style=3D"margin:0px;font-variant-numeric:nor=
mal;font-variant-east-asian:normal;font-stretch:normal;font-size:13px;line-=
height:normal;font-family:&quot;Helvetica Neue&quot;"><br></p><p class=3D"g=
mail-p1" style=3D"margin:0px;font-variant-numeric:normal;font-variant-east-=
asian:normal;font-stretch:normal;font-size:13px;line-height:normal;font-fam=
ily:&quot;Helvetica Neue&quot;">Before reboot:</p><p class=3D"gmail-p1" sty=
le=3D"margin:0px;font-variant-numeric:normal;font-variant-east-asian:normal=
;font-stretch:normal;font-size:13px;line-height:normal"><font face=3D"monos=
pace">#xenstore-ls</font></p><p class=3D"gmail-p1" style=3D"margin:0px;font=
-variant-numeric:normal;font-variant-east-asian:normal;font-stretch:normal;=
font-size:13px;line-height:normal"><font face=3D"monospace">...</font></p><=
p class=3D"gmail-p1" style=3D"margin:0px;font-style:normal;font-variant:nor=
mal;font-weight:normal;font-stretch:normal;font-size:13px;line-height:norma=
l"><font face=3D"monospace">vusb =3D &quot;&quot;</font></p><p class=3D"gma=
il-p1" style=3D"margin:0px;font-style:normal;font-variant:normal;font-weigh=
t:normal;font-stretch:normal;font-size:13px;line-height:normal"><font face=
=3D"monospace"><span class=3D"gmail-Apple-converted-space">=C2=A0 =C2=A0 </=
span>0 =3D &quot;&quot;</font></p><p class=3D"gmail-p1" style=3D"margin:0px=
;font-style:normal;font-variant:normal;font-weight:normal;font-stretch:norm=
al;font-size:13px;line-height:normal"><font face=3D"monospace"><span class=
=3D"gmail-Apple-converted-space">=C2=A0=C2=A0 =C2=A0 </span>type =3D &quot;=
devicemodel&quot;</font></p><p class=3D"gmail-p1" style=3D"margin:0px;font-=
style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;fon=
t-size:13px;line-height:normal"><font face=3D"monospace"><span class=3D"gma=
il-Apple-converted-space">=C2=A0=C2=A0 =C2=A0 </span>usb-ver =3D &quot;2&qu=
ot;</font></p><p class=3D"gmail-p1" style=3D"margin:0px;font-style:normal;f=
ont-variant:normal;font-weight:normal;font-stretch:normal;font-size:13px;li=
ne-height:normal"><font face=3D"monospace"><span class=3D"gmail-Apple-conve=
rted-space">=C2=A0=C2=A0 =C2=A0 </span>num-ports =3D &quot;6&quot;</font></=
p><p class=3D"gmail-p1" style=3D"margin:0px;font-style:normal;font-variant:=
normal;font-weight:normal;font-stretch:normal;font-size:13px;line-height:no=
rmal"><font face=3D"monospace"><span class=3D"gmail-Apple-converted-space">=
=C2=A0=C2=A0 =C2=A0 </span>port =3D &quot;&quot;</font></p><p class=3D"gmai=
l-p1" style=3D"margin:0px;font-style:normal;font-variant:normal;font-weight=
:normal;font-stretch:normal;font-size:13px;line-height:normal"><font face=
=3D"monospace"><span class=3D"gmail-Apple-converted-space">=C2=A0 =C2=A0 =
=C2=A0 </span>1 =3D &quot;2-1&quot;</font></p><p class=3D"gmail-p1" style=
=3D"margin:0px;font-style:normal;font-variant:normal;font-weight:normal;fon=
t-stretch:normal;font-size:13px;line-height:normal"><font face=3D"monospace=
"><span class=3D"gmail-Apple-converted-space">=C2=A0 =C2=A0 =C2=A0 </span>2=
 =3D &quot;&quot;</font></p><p class=3D"gmail-p1" style=3D"margin:0px;font-=
style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;fon=
t-size:13px;line-height:normal"><font face=3D"monospace"><span class=3D"gma=
il-Apple-converted-space">=C2=A0 =C2=A0 =C2=A0 </span>3 =3D &quot;&quot;</f=
ont></p><p class=3D"gmail-p1" style=3D"margin:0px;font-style:normal;font-va=
riant:normal;font-weight:normal;font-stretch:normal;font-size:13px;line-hei=
ght:normal"><font face=3D"monospace"><span class=3D"gmail-Apple-converted-s=
pace">=C2=A0 =C2=A0 =C2=A0 </span>4 =3D &quot;&quot;</font></p><p class=3D"=
gmail-p1" style=3D"margin:0px;font-style:normal;font-variant:normal;font-we=
ight:normal;font-stretch:normal;font-size:13px;line-height:normal"><font fa=
ce=3D"monospace"><span class=3D"gmail-Apple-converted-space">=C2=A0 =C2=A0 =
=C2=A0 </span>5 =3D &quot;&quot;</font></p><p class=3D"gmail-p1" style=3D"m=
argin:0px;font-variant-numeric:normal;font-variant-east-asian:normal;font-s=
tretch:normal;font-size:13px;line-height:normal">
















</p><p class=3D"gmail-p1" style=3D"margin:0px;font-variant-numeric:normal;f=
ont-variant-east-asian:normal;font-stretch:normal;font-size:13px;line-heigh=
t:normal"><font face=3D"monospace"><span class=3D"gmail-Apple-converted-spa=
ce">=C2=A0 =C2=A0 =C2=A0=C2=A0</span>6 =3D &quot;&quot;</font></p><p class=
=3D"gmail-p1" style=3D"margin:0px;font-variant-numeric:normal;font-variant-=
east-asian:normal;font-stretch:normal;font-size:13px;line-height:normal"><f=
ont face=3D"monospace"><br></font></p><p class=3D"gmail-p1" style=3D"margin=
:0px;font-variant-numeric:normal;font-variant-east-asian:normal;font-stretc=
h:normal;font-size:13px;line-height:normal"><font face=3D"monospace">#xl us=
b-list</font></p><p class=3D"gmail-p1" style=3D"margin:0px;font-style:norma=
l;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:13px=
;line-height:normal"><font face=3D"monospace">Devid<span class=3D"gmail-App=
le-converted-space">=C2=A0 </span>Type <span class=3D"gmail-Apple-converted=
-space">=C2=A0 =C2=A0 =C2=A0 =C2=A0 </span>BE<span class=3D"gmail-Apple-con=
verted-space">=C2=A0 </span>state usb-ver ports</font></p><p class=3D"gmail=
-p1" style=3D"margin:0px;font-style:normal;font-variant:normal;font-weight:=
normal;font-stretch:normal;font-size:13px;line-height:normal"><font face=3D=
"monospace">0<span class=3D"gmail-Apple-converted-space">=C2=A0 =C2=A0 =C2=
=A0 </span>devicemodel<span class=3D"gmail-Apple-converted-space">=C2=A0 </=
span>0 <span class=3D"gmail-Apple-converted-space">=C2=A0 </span>0 <span cl=
ass=3D"gmail-Apple-converted-space">=C2=A0 =C2=A0 </span>2 <span class=3D"g=
mail-Apple-converted-space">=C2=A0 =C2=A0 =C2=A0 </span>6 <span class=3D"gm=
ail-Apple-converted-space">=C2=A0 =C2=A0</span></font></p><p class=3D"gmail=
-p1" style=3D"margin:0px;font-style:normal;font-variant:normal;font-weight:=
normal;font-stretch:normal;font-size:13px;line-height:normal"><font face=3D=
"monospace"><span class=3D"gmail-Apple-converted-space">=C2=A0 </span>Port =
1: Bus 002 Device 002</font></p><p class=3D"gmail-p1" style=3D"margin:0px;f=
ont-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal=
;font-size:13px;line-height:normal"><font face=3D"monospace"><span class=3D=
"gmail-Apple-converted-space">=C2=A0 </span>Port 2:</font></p><p class=3D"g=
mail-p1" style=3D"margin:0px;font-style:normal;font-variant:normal;font-wei=
ght:normal;font-stretch:normal;font-size:13px;line-height:normal"><font fac=
e=3D"monospace"><span class=3D"gmail-Apple-converted-space">=C2=A0 </span>P=
ort 3:</font></p><p class=3D"gmail-p1" style=3D"margin:0px;font-style:norma=
l;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:13px=
;line-height:normal"><font face=3D"monospace"><span class=3D"gmail-Apple-co=
nverted-space">=C2=A0 </span>Port 4:</font></p><p class=3D"gmail-p1" style=
=3D"margin:0px;font-style:normal;font-variant:normal;font-weight:normal;fon=
t-stretch:normal;font-size:13px;line-height:normal"><font face=3D"monospace=
"><span class=3D"gmail-Apple-converted-space">=C2=A0 </span>Port 5:</font><=
/p><p class=3D"gmail-p1" style=3D"margin:0px;font-variant-numeric:normal;fo=
nt-variant-east-asian:normal;font-stretch:normal;font-size:13px;line-height=
:normal">












</p><p class=3D"gmail-p1" style=3D"margin:0px;font-variant-numeric:normal;f=
ont-variant-east-asian:normal;font-stretch:normal;font-size:13px;line-heigh=
t:normal"><font face=3D"monospace"><span class=3D"gmail-Apple-converted-spa=
ce" style=3D"">=C2=A0=C2=A0</span>Port 6:</font></p><p class=3D"gmail-p1" s=
tyle=3D"margin:0px;font-variant-numeric:normal;font-variant-east-asian:norm=
al;font-stretch:normal;font-size:13px;line-height:normal;font-family:&quot;=
Helvetica Neue&quot;"><br></p><p class=3D"gmail-p1" style=3D"margin:0px;fon=
t-variant-numeric:normal;font-variant-east-asian:normal;font-stretch:normal=
;font-size:13px;line-height:normal;font-family:&quot;Helvetica Neue&quot;">=
After reboot:</p><p class=3D"gmail-p1" style=3D"margin:0px;font-variant-num=
eric:normal;font-variant-east-asian:normal;font-stretch:normal;font-size:13=
px;line-height:normal"><font face=3D"monospace">#xenstore-ls</font></p><p c=
lass=3D"gmail-p1" style=3D"margin:0px;font-variant-numeric:normal;font-vari=
ant-east-asian:normal;font-stretch:normal;font-size:13px;line-height:normal=
"><font face=3D"monospace">...</font></p><p class=3D"gmail-p1" style=3D"mar=
gin:0px;font-style:normal;font-variant:normal;font-weight:normal;font-stret=
ch:normal;font-size:13px;line-height:normal"><font face=3D"monospace">vusb =
=3D &quot;&quot;</font></p><p class=3D"gmail-p1" style=3D"margin:0px;font-s=
tyle:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font=
-size:13px;line-height:normal"><font face=3D"monospace"><span class=3D"gmai=
l-Apple-converted-space">=C2=A0 =C2=A0 </span>0 =3D &quot;&quot;</font></p>=
<p class=3D"gmail-p1" style=3D"margin:0px;font-style:normal;font-variant:no=
rmal;font-weight:normal;font-stretch:normal;font-size:13px;line-height:norm=
al"><font face=3D"monospace"><span class=3D"gmail-Apple-converted-space">=
=C2=A0=C2=A0 =C2=A0 </span>type =3D &quot;devicemodel&quot;</font></p><p cl=
ass=3D"gmail-p1" style=3D"margin:0px;font-style:normal;font-variant:normal;=
font-weight:normal;font-stretch:normal;font-size:13px;line-height:normal"><=
font face=3D"monospace"><span class=3D"gmail-Apple-converted-space">=C2=A0=
=C2=A0 =C2=A0 </span>usb-ver =3D &quot;2&quot;</font></p><p class=3D"gmail-=
p1" style=3D"margin:0px;font-style:normal;font-variant:normal;font-weight:n=
ormal;font-stretch:normal;font-size:13px;line-height:normal"><font face=3D"=
monospace"><span class=3D"gmail-Apple-converted-space">=C2=A0=C2=A0 =C2=A0 =
</span>num-ports =3D &quot;6&quot;</font></p><p class=3D"gmail-p1" style=3D=
"margin:0px;font-style:normal;font-variant:normal;font-weight:normal;font-s=
tretch:normal;font-size:13px;line-height:normal"><font face=3D"monospace"><=
span class=3D"gmail-Apple-converted-space">=C2=A0=C2=A0 =C2=A0 </span>port =
=3D &quot;&quot;</font></p><p class=3D"gmail-p1" style=3D"margin:0px;font-s=
tyle:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font=
-size:13px;line-height:normal"><font face=3D"monospace"><span class=3D"gmai=
l-Apple-converted-space">=C2=A0 =C2=A0 =C2=A0 </span>1 =3D &quot;&quot;</fo=
nt></p><p class=3D"gmail-p1" style=3D"margin:0px;font-style:normal;font-var=
iant:normal;font-weight:normal;font-stretch:normal;font-size:13px;line-heig=
ht:normal"><font face=3D"monospace"><span class=3D"gmail-Apple-converted-sp=
ace">=C2=A0 =C2=A0 =C2=A0 </span>2 =3D &quot;&quot;</font></p><p class=3D"g=
mail-p1" style=3D"margin:0px;font-style:normal;font-variant:normal;font-wei=
ght:normal;font-stretch:normal;font-size:13px;line-height:normal"><font fac=
e=3D"monospace"><span class=3D"gmail-Apple-converted-space">=C2=A0 =C2=A0 =
=C2=A0 </span>3 =3D &quot;&quot;</font></p><p class=3D"gmail-p1" style=3D"m=
argin:0px;font-style:normal;font-variant:normal;font-weight:normal;font-str=
etch:normal;font-size:13px;line-height:normal"><font face=3D"monospace"><sp=
an class=3D"gmail-Apple-converted-space">=C2=A0 =C2=A0 =C2=A0 </span>4 =3D =
&quot;&quot;</font></p><p class=3D"gmail-p1" style=3D"margin:0px;font-style=
:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-siz=
e:13px;line-height:normal"><font face=3D"monospace"><span class=3D"gmail-Ap=
ple-converted-space">=C2=A0 =C2=A0 =C2=A0 </span>5 =3D &quot;&quot;</font><=
/p><p class=3D"gmail-p1" style=3D"margin:0px;font-variant-numeric:normal;fo=
nt-variant-east-asian:normal;font-stretch:normal;font-size:13px;line-height=
:normal">
















</p><p class=3D"gmail-p1" style=3D"margin:0px;font-variant-numeric:normal;f=
ont-variant-east-asian:normal;font-stretch:normal;font-size:13px;line-heigh=
t:normal"><font face=3D"monospace"><span class=3D"gmail-Apple-converted-spa=
ce">=C2=A0 =C2=A0 =C2=A0=C2=A0</span>6 =3D &quot;&quot;</font></p><p class=
=3D"gmail-p1" style=3D"margin:0px;font-variant-numeric:normal;font-variant-=
east-asian:normal;font-stretch:normal;font-size:13px;line-height:normal"><f=
ont face=3D"monospace"><br></font></p><p class=3D"gmail-p1" style=3D"margin=
:0px;font-variant-numeric:normal;font-variant-east-asian:normal;font-stretc=
h:normal;font-size:13px;line-height:normal"><font face=3D"monospace">#xl us=
b-list</font></p><p class=3D"gmail-p1" style=3D"margin:0px;font-style:norma=
l;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:13px=
;line-height:normal"><font face=3D"monospace">Devid<span class=3D"gmail-App=
le-converted-space">=C2=A0 </span>Type <span class=3D"gmail-Apple-converted=
-space">=C2=A0 =C2=A0 =C2=A0 =C2=A0 </span>BE<span class=3D"gmail-Apple-con=
verted-space">=C2=A0 </span>state usb-ver ports</font></p><p class=3D"gmail=
-p1" style=3D"margin:0px;font-style:normal;font-variant:normal;font-weight:=
normal;font-stretch:normal;font-size:13px;line-height:normal"><font face=3D=
"monospace">0<span class=3D"gmail-Apple-converted-space">=C2=A0 =C2=A0 =C2=
=A0 </span>devicemodel<span class=3D"gmail-Apple-converted-space">=C2=A0 </=
span>0 <span class=3D"gmail-Apple-converted-space">=C2=A0 </span>0 <span cl=
ass=3D"gmail-Apple-converted-space">=C2=A0 =C2=A0 </span>2 <span class=3D"g=
mail-Apple-converted-space">=C2=A0 =C2=A0 =C2=A0 </span>6 <span class=3D"gm=
ail-Apple-converted-space">=C2=A0 =C2=A0</span></font></p><p class=3D"gmail=
-p1" style=3D"margin:0px;font-style:normal;font-variant:normal;font-weight:=
normal;font-stretch:normal;font-size:13px;line-height:normal"><font face=3D=
"monospace"><span class=3D"gmail-Apple-converted-space">=C2=A0 </span>Port =
1:</font></p><p class=3D"gmail-p1" style=3D"margin:0px;font-style:normal;fo=
nt-variant:normal;font-weight:normal;font-stretch:normal;font-size:13px;lin=
e-height:normal"><font face=3D"monospace"><span class=3D"gmail-Apple-conver=
ted-space">=C2=A0 </span>Port 2:</font></p><p class=3D"gmail-p1" style=3D"m=
argin:0px;font-style:normal;font-variant:normal;font-weight:normal;font-str=
etch:normal;font-size:13px;line-height:normal"><font face=3D"monospace"><sp=
an class=3D"gmail-Apple-converted-space">=C2=A0 </span>Port 3:</font></p><p=
 class=3D"gmail-p1" style=3D"margin:0px;font-style:normal;font-variant:norm=
al;font-weight:normal;font-stretch:normal;font-size:13px;line-height:normal=
"><font face=3D"monospace"><span class=3D"gmail-Apple-converted-space">=C2=
=A0 </span>Port 4:</font></p><p class=3D"gmail-p1" style=3D"margin:0px;font=
-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;fo=
nt-size:13px;line-height:normal"><font face=3D"monospace"><span class=3D"gm=
ail-Apple-converted-space">=C2=A0 </span>Port 5:</font></p><p class=3D"gmai=
l-p1" style=3D"margin:0px;font-variant-numeric:normal;font-variant-east-asi=
an:normal;font-stretch:normal;font-size:13px;line-height:normal">












</p><p class=3D"gmail-p1" style=3D"margin:0px;font-variant-numeric:normal;f=
ont-variant-east-asian:normal;font-stretch:normal;font-size:13px;line-heigh=
t:normal"><font face=3D"monospace"><span class=3D"gmail-Apple-converted-spa=
ce" style=3D"">=C2=A0=C2=A0</span>Port 6:</font></p><p class=3D"gmail-p1" s=
tyle=3D"margin:0px;font-variant-numeric:normal;font-variant-east-asian:norm=
al;font-stretch:normal;font-size:13px;line-height:normal;font-family:&quot;=
Helvetica Neue&quot;"><br></p><p class=3D"gmail-p1" style=3D"margin:0px;fon=
t-variant-numeric:normal;font-variant-east-asian:normal;font-stretch:normal=
;font-size:13px;line-height:normal;font-family:&quot;Helvetica Neue&quot;">=
Steps to reproduce are inside=C2=A0<a href=3D"https://github.com/lf-edge/ed=
en/issues/578">https://github.com/lf-edge/eden/issues/578</a></p><p class=
=3D"gmail-p1" style=3D"margin:0px;font-variant-numeric:normal;font-variant-=
east-asian:normal;font-stretch:normal;font-size:13px;line-height:normal;fon=
t-family:&quot;Helvetica Neue&quot;">





</p><p class=3D"gmail-p1" style=3D"margin:0px;font-variant-numeric:normal;f=
ont-variant-east-asian:normal;font-stretch:normal;font-size:13px;line-heigh=
t:normal;font-family:&quot;Helvetica Neue&quot;">xen_version<span class=3D"=
gmail-Apple-converted-space">=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 </sp=
an>: 4.14.1</p><p class=3D"gmail-p1" style=3D"margin:0px;font-variant-numer=
ic:normal;font-variant-east-asian:normal;font-stretch:normal;font-size:13px=
;line-height:normal;font-family:&quot;Helvetica Neue&quot;"><br></p><p clas=
s=3D"gmail-p1" style=3D"margin:0px;font-variant-numeric:normal;font-variant=
-east-asian:normal;font-stretch:normal;font-size:13px;line-height:normal;fo=
nt-family:&quot;Helvetica Neue&quot;">Best regard,</p><p class=3D"gmail-p1"=
 style=3D"margin:0px;font-variant-numeric:normal;font-variant-east-asian:no=
rmal;font-stretch:normal;font-size:13px;line-height:normal;font-family:&quo=
t;Helvetica Neue&quot;">Petr Fedchenkov</p><p class=3D"gmail-p1" style=3D"m=
argin:0px;font-variant-numeric:normal;font-variant-east-asian:normal;font-s=
tretch:normal;font-size:13px;line-height:normal;font-family:&quot;Helvetica=
 Neue&quot;"><br></p></div></div>

--00000000000063cb9605bf62855d--

