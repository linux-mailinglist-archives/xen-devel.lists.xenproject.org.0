Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 454BF80CCC7
	for <lists+xen-devel@lfdr.de>; Mon, 11 Dec 2023 15:03:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.652122.1017774 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rCgsb-00039o-Aa; Mon, 11 Dec 2023 14:03:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 652122.1017774; Mon, 11 Dec 2023 14:03:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rCgsb-00036j-7h; Mon, 11 Dec 2023 14:03:29 +0000
Received: by outflank-mailman (input) for mailman id 652122;
 Mon, 11 Dec 2023 14:03:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=pUvq=HW=gmail.com=marietto2008@srs-se1.protection.inumbo.net>)
 id 1rCgsa-00036Y-5W
 for xen-devel@lists.xenproject.org; Mon, 11 Dec 2023 14:03:28 +0000
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [2a00:1450:4864:20::62e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0c2233b5-982e-11ee-9b0f-b553b5be7939;
 Mon, 11 Dec 2023 15:03:24 +0100 (CET)
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-a1d2f89ddabso548507266b.1; 
 Mon, 11 Dec 2023 06:03:23 -0800 (PST)
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
X-Inumbo-ID: 0c2233b5-982e-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702303403; x=1702908203; darn=lists.xenproject.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=1gJZa6piGzQ7dXvAGieW+iXJk6dCQghFB8Wpd4pq3AA=;
        b=G+fZby7m+tqs+o5yJ81zwokrsWVwKXUMxXQeOccsS+gzG8F/Pc/3reC/7wi2WLrr77
         2WP4CPfzO+wvudj+1fNoA0Ka9ZvR1vxVq0Mw+z//CT9pzHVNjKKewehZ4voL0B0FOrjB
         /HSMyEwX9Cu5uSdGLGTfp+uAZJzX6yc3aA1HEkdLk8BGxwS5he99f06SaXoUgMp6TfTK
         i8irvFe04L0UrHmgp3kuK/jfhVFucTrAgneO50D1lYw5OVS0BojiGDrv9Goma82yPCfB
         QuLnxPzOAop5ikZtv+RvXEbJjbpVw/DBD3sqBLt6s01ltyU6kfZ0VKnMNImCB2H4xkjj
         gDfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702303403; x=1702908203;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1gJZa6piGzQ7dXvAGieW+iXJk6dCQghFB8Wpd4pq3AA=;
        b=pceWS85snblLQr4NsETpbUDMTHAMnKYCf0XJphJ8wm/rKBApIO0JGyxkD4wvpjnmTp
         aj6gqcHQER10k1V0rTkQvDHYre0RPGFiqeKmVtHvF7tmIdV0SU5m7hTTue6Thjm850nS
         dLMj4z9ORNhdWGL2wOPLpKR1R6DCEUEhVCyA8tYMgWyhLM6u/pZHzk4kTh6hD4KKdCq0
         Bhroyt8xNxz8bXnYJp3W98FM4SzWrlNaNlFlhOU1xVkMEoHZwTq1tzYO1uR26VPxtChq
         qs6O47d0aZRIKbuArX1oLPnJBE2YkiD7EEQBNPZ5lkQ+0iZm43kQ+04LAuhZ97iQ9hJs
         cEjg==
X-Gm-Message-State: AOJu0YwNxztdtHEMz0oTb6MMcDZl7A8c4t14rNfO20xYZVv8gFxl31ta
	PSb3x0m9ntweUhNGAmpvLYOnFKz7XKID452BLTc=
X-Google-Smtp-Source: AGHT+IEwF+ny0pRx5cLbp2T+sxJJRf4fJix4EeaD/LaJe7FIiBCffM1MnCbatVyBih2v/0vPn5b4IEmsG4/ahPEecaQ=
X-Received: by 2002:a17:906:7c51:b0:a19:a19b:78c4 with SMTP id
 g17-20020a1709067c5100b00a19a19b78c4mr2024094ejp.135.1702303402565; Mon, 11
 Dec 2023 06:03:22 -0800 (PST)
MIME-Version: 1.0
From: Mario Marietto <marietto2008@gmail.com>
Date: Mon, 11 Dec 2023 15:02:45 +0100
Message-ID: <CA+1FSiii2etikw9LKdJ5Ebn+z-3-e5UXh3cJjBgYGJYtq3q=Ww@mail.gmail.com>
Subject: xc_dom_guest_type: image not capable of booting inside a HV M
 container: Invalid kernel
To: Elliott Mitchell <ehem+freebsd@m5p.com>, Julien Grall <julien@xen.org>, 
	Bertrand Marquis <bertrand.marquis@arm.com>, Chuck Zmudzinski <brchuckz@netscape.net>, 
	xen-devel <xen-devel@lists.xenproject.org>, xen-users-request@lists.xenproject.org, 
	Stefano Stabellini <sstabellini@kernel.org>, 
	=?UTF-8?Q?Marek_Marczykowski=2DG=C3=B3recki?= <marmarek@invisiblethingslab.com>
Content-Type: multipart/alternative; boundary="0000000000009c2744060c3c6561"

--0000000000009c2744060c3c6561
Content-Type: text/plain; charset="UTF-8"

Hello.

Finally I tried to recompile the FreeBSD kernel using the @Elliott Mitchell
<ehem+freebsd@m5p.com> code because I want to boot FreeBSD as domU with Xen
installed on my Arm 32 bit Chromebook. Unfortunately it didn't work at all.
Maybe I've missed something / I haven't understood well what to do. Please
give me some suggestions.

Basically this is what I did :

$ created a vm called FreeBSD-13.2-RELEASE-armv7.img with qemu / kvm /
libvirt / virt-manager

$ within the vm : mkdir /build-xen

$ cd /usr

$ git clone https://gitlab.com/ehem/freebsd-src.git
<https://gitlab.com/ehem/freebsd-src.git?fbclid=IwAR09ukOdBXCR3gJznvHWpnWM8VEZqnX1l4ZMza_7lhoAjfPYAGbvcqwjh94>

$ cd freebsd-src

$ make KERNCONF=GENERIC TARGET=arm TARGET_ARCH=armv7 buildkernel

$ make KERNCONF=GENERIC TARGET=arm TARGET_ARCH=armv7 DESTDIR=/build-xen
installkernel

$ echo "/dev/xbd0 / ufs rw 1 1" > /mnt/etc/fstab

$ nano /etc/ttys (add the line 'xc0 "/usr/libexec/getty Pc" xterm on
secure")

$ renamed the directories dtb to dtb_ and kernel to kernel_ that are inside
the /boot dir of the vm

$ copied the directory dtb and kernel from the directory /build-xen to the
directory /boot inside the vm

$ shut down the vm

$ copied the directory /build-xen outside of the vm using this method (in
this case I used Linux installed on the Host OS,because the kernel that I'm
using on the Chromebook has the kernel parameter related to the ufs2 fs set
to off) :

on my X64 workstation :

# modprobe ufs

# sudo losetup -fP FreeBSD-13.2-RELEASE-armv7.img

# ls /dev/loop0*

/dev/loop0 /dev/loop0p1 /dev/loop0p2 /dev/loop0p5

# mount -t ufs -o ufstype=ufs2 /dev/loop0p5 ./FreeBSD-xen

then :

# nano freebsd.cfg

kernel="/mnt/zroot2/zroot2/OS/Chromebook/domU/freebsd-xen/boot-xen/kernel/kernel"
memory=64
name="freebsd"
vcpus=1
autoballon="off"
disk=[ 'phy:/dev/loop0,xvda,w' ]
# nano start-freebsd
losetup -fP FreeBSD-13.2-RELEASE-armv7.img
xl create freebsd.cfg
xl console freebsd

# ./start-freebsd

Parsing config from freebsd.cfg
xc: error: panic: xg_dom_elfloader.c:63: xc_dom_guest_type: image not
capable of booting inside a HV
M container: Invalid kernel
libxl: error: libxl_dom.c:571:libxl__build_dom: xc_dom_parse_image failed
libxl: error: libxl_create.c:1640:domcreate_rebuild_done: Domain 1:cannot
(re-)build domain: -3
libxl: error: libxl_domain.c:1183:libxl__destroy_domid: Domain
1:Non-existent domain
libxl: error: libxl_domain.c:1137:domain_destroy_callback: Domain 1:Unable
to destroy guest
libxl: error: libxl_domain.c:1064:domain_destroy_cb: Domain 1:Destruction
of domain failed
freebsd is an invalid domain identifier (rc=-6)

I have also tried with kernel.bin :

# nano freebsd.cfg

kernel="/mnt/zroot2/zroot2/OS/Chromebook/domU/freebsd-xen/boot-xen/kernel/kernel.bin"
memory=64
name="freebsd"
vcpus=1
autoballon="off"
disk=[ 'phy:/dev/loop0,xvda,w' ]

# ./start-freebsd

Parsing config from freebsd.cfg
xc: error: panic: xg_dom_core.c:689: xc_dom_find_loader: no loader found:
Invalid kernel
libxl: error: libxl_dom.c:571:libxl__build_dom: xc_dom_parse_image failed
libxl: error: libxl_create.c:1640:domcreate_rebuild_done: Domain 2:cannot
(re-)build domain: -3
libxl: error: libxl_domain.c:1183:libxl__destroy_domid: Domain
2:Non-existent domain
libxl: error: libxl_domain.c:1137:domain_destroy_callback: Domain 2:Unable
to destroy guest
libxl: error: libxl_domain.c:1064:domain_destroy_cb: Domain 2:Destruction
of domain failed
freebsd is an invalid domain identifier (rc=-6)

-- 
Mario.

--0000000000009c2744060c3c6561
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail-" dir=3D"auto"><div class=3D"gmail-x1i=
orvi4 gmail-x1pi30zi gmail-x1l90r2v gmail-x1swvt13" id=3D"gmail-:r1df:"><di=
v class=3D"gmail-x78zum5 gmail-xdt5ytf gmail-xz62fqu gmail-x16ldp7u"><div c=
lass=3D"gmail-xu06os2 gmail-x1ok221b"><span class=3D"gmail-x193iq5w gmail-x=
euugli gmail-x13faqbe gmail-x1vvkbs gmail-x10flsy6 gmail-x1lliihq gmail-x1s=
928wv gmail-xhkezso gmail-x1gmr53x gmail-x1cpjm7i gmail-x1fgarty gmail-x194=
3h6x gmail-x4zkp8e gmail-x41vudc gmail-x6prxxf gmail-xvq8zen gmail-xo1l8bm =
gmail-xzsf02u gmail-x1yc453h" dir=3D"auto"><div class=3D"gmail-xdj266r gmai=
l-x11i5rnm gmail-xat24cr gmail-x1mh8g0r gmail-x1vvkbs gmail-x126k92a"><div =
style=3D"text-align:start">Hello.</div><div style=3D"text-align:start"><br>=
</div><div style=3D"text-align:start">Finally I tried to recompile the Free=
BSD kernel using the <a class=3D"gmail_plusreply" id=3D"plusReplyChip-0" hr=
ef=3D"mailto:ehem+freebsd@m5p.com" tabindex=3D"-1">@Elliott Mitchell</a> co=
de because I want to boot FreeBSD as domU with Xen installed on my Arm 32 b=
it Chromebook. Unfortunately it didn&#39;t work at all. Maybe I&#39;ve miss=
ed something / I haven&#39;t understood well what to do. Please give me som=
e suggestions.<br></div><div style=3D"text-align:start"><br></div><div dir=
=3D"auto" style=3D"text-align:start">Basically this is what I did :</div><d=
iv dir=3D"auto" style=3D"text-align:start"><br></div></div><div class=3D"gm=
ail-x11i5rnm gmail-xat24cr gmail-x1mh8g0r gmail-x1vvkbs gmail-xtlvy1s gmail=
-x126k92a"><div dir=3D"auto" style=3D"text-align:start">$ created a vm call=
ed FreeBSD-13.2-RELEASE-armv7.img with qemu / kvm / libvirt / virt-manager<=
/div><div dir=3D"auto" style=3D"text-align:start"><br></div><div dir=3D"aut=
o" style=3D"text-align:start">$ within the vm : mkdir /build-xen</div><div =
dir=3D"auto" style=3D"text-align:start"><br></div><div dir=3D"auto" style=
=3D"text-align:start">$ cd /usr</div><div dir=3D"auto" style=3D"text-align:=
start"><br></div><div dir=3D"auto" style=3D"text-align:start">$ <span><a ta=
bindex=3D"-1"></a></span>git clone <span><a class=3D"gmail-x1i10hfl gmail-x=
jbqb8w gmail-x6umtig gmail-x1b1mbwd gmail-xaqea5y gmail-xav7gou gmail-x9f61=
9 gmail-x1ypdohk gmail-xt0psk2 gmail-xe8uvvx gmail-xdj266r gmail-x11i5rnm g=
mail-xat24cr gmail-x1mh8g0r gmail-xexx8yu gmail-x4uap5 gmail-x18d9i69 gmail=
-xkhd6sd gmail-x16tdsg8 gmail-x1hl2dhg gmail-xggy1nq gmail-x1a2a7pz gmail-x=
t0b8zv gmail-x1fey0fg" href=3D"https://gitlab.com/ehem/freebsd-src.git?fbcl=
id=3DIwAR09ukOdBXCR3gJznvHWpnWM8VEZqnX1l4ZMza_7lhoAjfPYAGbvcqwjh94" rel=3D"=
nofollow noreferrer" role=3D"link" tabindex=3D"0" target=3D"_blank">https:/=
/gitlab.com/ehem/freebsd-src.git</a><br></span></div><div dir=3D"auto" styl=
e=3D"text-align:start"><span><br></span></div><div dir=3D"auto" style=3D"te=
xt-align:start">$ cd freebsd-src</div><div dir=3D"auto" style=3D"text-align=
:start"><br></div><div dir=3D"auto" style=3D"text-align:start">$ make KERNC=
ONF=3DGENERIC TARGET=3Darm TARGET_ARCH=3Darmv7 buildkernel</div><div dir=3D=
"auto" style=3D"text-align:start"><br></div><div dir=3D"auto" style=3D"text=
-align:start">$ make KERNCONF=3DGENERIC TARGET=3Darm TARGET_ARCH=3Darmv7 DE=
STDIR=3D/build-xen installkernel</div><div dir=3D"auto" style=3D"text-align=
:start"><br></div><div dir=3D"auto" style=3D"text-align:start">$ echo &quot=
;/dev/xbd0 / ufs rw 1 1&quot; &gt; /mnt/etc/fstab</div><div dir=3D"auto" st=
yle=3D"text-align:start"><br></div><div dir=3D"auto" style=3D"text-align:st=
art">$ nano /etc/ttys (add the line &#39;xc0 &quot;/usr/libexec/getty Pc&qu=
ot; xterm on secure&quot;)</div><div dir=3D"auto" style=3D"text-align:start=
"><br></div><div dir=3D"auto" style=3D"text-align:start">$ renamed the dire=
ctories dtb to dtb_ and kernel to kernel_ that are inside the /boot dir of =
the vm</div><div dir=3D"auto" style=3D"text-align:start"><br></div><div dir=
=3D"auto" style=3D"text-align:start">$ copied the directory dtb and kernel =
from the directory /build-xen to the directory /boot inside the vm</div><di=
v dir=3D"auto" style=3D"text-align:start"><br></div><div dir=3D"auto" style=
=3D"text-align:start">$ shut down the vm</div><div dir=3D"auto" style=3D"te=
xt-align:start"><br></div></div><div class=3D"gmail-x11i5rnm gmail-xat24cr =
gmail-x1mh8g0r gmail-x1vvkbs gmail-xtlvy1s gmail-x126k92a"><div dir=3D"auto=
" style=3D"text-align:start">$ copied the directory /build-xen outside of t=
he vm using this method (in this case I used Linux installed on the Host OS=
,because the kernel that I&#39;m using on the Chromebook has the kernel par=
ameter related to the ufs2 fs set to off) :</div><div dir=3D"auto" style=3D=
"text-align:start"><br></div></div><div class=3D"gmail-x11i5rnm gmail-xat24=
cr gmail-x1mh8g0r gmail-x1vvkbs gmail-xtlvy1s gmail-x126k92a"><div dir=3D"a=
uto" style=3D"text-align:start">on my X64 workstation :</div><div dir=3D"au=
to" style=3D"text-align:start"><br></div></div><div class=3D"gmail-x11i5rnm=
 gmail-xat24cr gmail-x1mh8g0r gmail-x1vvkbs gmail-xtlvy1s gmail-x126k92a"><=
div dir=3D"auto" style=3D"text-align:start"># modprobe ufs</div></div><div =
class=3D"gmail-x11i5rnm gmail-xat24cr gmail-x1mh8g0r gmail-x1vvkbs gmail-xt=
lvy1s gmail-x126k92a"><div dir=3D"auto" style=3D"text-align:start"><br></di=
v><div dir=3D"auto" style=3D"text-align:start"># sudo losetup -fP FreeBSD-1=
3.2-RELEASE-armv7.img</div><div dir=3D"auto" style=3D"text-align:start"><br=
></div></div><div class=3D"gmail-x11i5rnm gmail-xat24cr gmail-x1mh8g0r gmai=
l-x1vvkbs gmail-xtlvy1s gmail-x126k92a"><div dir=3D"auto" style=3D"text-ali=
gn:start"># ls /dev/loop0*</div></div><div class=3D"gmail-x11i5rnm gmail-xa=
t24cr gmail-x1mh8g0r gmail-x1vvkbs gmail-xtlvy1s gmail-x126k92a"><div dir=
=3D"auto" style=3D"text-align:start"><br></div><div dir=3D"auto" style=3D"t=
ext-align:start">/dev/loop0 /dev/loop0p1 /dev/loop0p2 /dev/loop0p5</div><di=
v dir=3D"auto" style=3D"text-align:start"><br></div></div><div class=3D"gma=
il-x11i5rnm gmail-xat24cr gmail-x1mh8g0r gmail-x1vvkbs gmail-xtlvy1s gmail-=
x126k92a"><div dir=3D"auto" style=3D"text-align:start"># mount -t ufs -o uf=
stype=3Dufs2 /dev/loop0p5 ./FreeBSD-xen</div></div><div class=3D"gmail-x11i=
5rnm gmail-xat24cr gmail-x1mh8g0r gmail-x1vvkbs gmail-xtlvy1s gmail-x126k92=
a"><div dir=3D"auto" style=3D"text-align:start"><br></div><div dir=3D"auto"=
 style=3D"text-align:start">then :</div><div dir=3D"auto" style=3D"text-ali=
gn:start"><br></div></div><div class=3D"gmail-x11i5rnm gmail-xat24cr gmail-=
x1mh8g0r gmail-x1vvkbs gmail-xtlvy1s gmail-x126k92a"><div dir=3D"auto" styl=
e=3D"text-align:start"># nano freebsd.cfg</div><div dir=3D"auto" style=3D"t=
ext-align:start"><br></div></div><div class=3D"gmail-x11i5rnm gmail-xat24cr=
 gmail-x1mh8g0r gmail-x1vvkbs gmail-xtlvy1s gmail-x126k92a"><div dir=3D"aut=
o" style=3D"text-align:start">kernel=3D&quot;/mnt/zroot2/zroot2/OS/Chromebo=
ok/domU/freebsd-xen/boot-xen/kernel/kernel&quot;</div><div dir=3D"auto" sty=
le=3D"text-align:start">memory=3D64</div><div dir=3D"auto" style=3D"text-al=
ign:start">name=3D&quot;freebsd&quot;</div><div dir=3D"auto" style=3D"text-=
align:start">vcpus=3D1</div><div dir=3D"auto" style=3D"text-align:start">au=
toballon=3D&quot;off&quot;</div><div dir=3D"auto" style=3D"text-align:start=
">disk=3D[ &#39;phy:/dev/loop0,xvda,w&#39; ]</div></div><div class=3D"gmail=
-x11i5rnm gmail-xat24cr gmail-x1mh8g0r gmail-x1vvkbs gmail-xtlvy1s gmail-x1=
26k92a"><div dir=3D"auto" style=3D"text-align:start"># nano start-freebsd</=
div></div><div class=3D"gmail-x11i5rnm gmail-xat24cr gmail-x1mh8g0r gmail-x=
1vvkbs gmail-xtlvy1s gmail-x126k92a"><div dir=3D"auto" style=3D"text-align:=
start">losetup -fP FreeBSD-13.2-RELEASE-armv7.img</div><div dir=3D"auto" st=
yle=3D"text-align:start">xl create freebsd.cfg</div><div dir=3D"auto" style=
=3D"text-align:start">xl console freebsd</div></div><div class=3D"gmail-x11=
i5rnm gmail-xat24cr gmail-x1mh8g0r gmail-x1vvkbs gmail-xtlvy1s gmail-x126k9=
2a"><div dir=3D"auto" style=3D"text-align:start"><br></div><div dir=3D"auto=
" style=3D"text-align:start"># ./start-freebsd</div></div><div class=3D"gma=
il-x11i5rnm gmail-xat24cr gmail-x1mh8g0r gmail-x1vvkbs gmail-xtlvy1s gmail-=
x126k92a"><div dir=3D"auto" style=3D"text-align:start"><br></div><div dir=
=3D"auto" style=3D"text-align:start">Parsing config from freebsd.cfg</div><=
div dir=3D"auto" style=3D"text-align:start">xc: error: panic: xg_dom_elfloa=
der.c:63: xc_dom_guest_type: image not capable of booting inside a HV</div>=
<div dir=3D"auto" style=3D"text-align:start">M container: Invalid kernel</d=
iv><div dir=3D"auto" style=3D"text-align:start">libxl: error: libxl_dom.c:5=
71:libxl__build_dom: xc_dom_parse_image failed</div><div dir=3D"auto" style=
=3D"text-align:start">libxl: error: libxl_create.c:1640:domcreate_rebuild_d=
one: Domain 1:cannot (re-)build domain: -3</div><div dir=3D"auto" style=3D"=
text-align:start">libxl: error: libxl_domain.c:1183:libxl__destroy_domid: D=
omain 1:Non-existent domain</div><div dir=3D"auto" style=3D"text-align:star=
t">libxl: error: libxl_domain.c:1137:domain_destroy_callback: Domain 1:Unab=
le to destroy guest</div><div dir=3D"auto" style=3D"text-align:start">libxl=
: error: libxl_domain.c:1064:domain_destroy_cb: Domain 1:Destruction of dom=
ain failed</div><div dir=3D"auto" style=3D"text-align:start">freebsd is an =
invalid domain identifier (rc=3D-6)</div></div><div class=3D"gmail-x11i5rnm=
 gmail-xat24cr gmail-x1mh8g0r gmail-x1vvkbs gmail-xtlvy1s gmail-x126k92a"><=
div dir=3D"auto" style=3D"text-align:start"><br></div><div dir=3D"auto" sty=
le=3D"text-align:start">I have also tried with kernel.bin :</div><div dir=
=3D"auto" style=3D"text-align:start"><br></div></div><div class=3D"gmail-x1=
1i5rnm gmail-xat24cr gmail-x1mh8g0r gmail-x1vvkbs gmail-xtlvy1s gmail-x126k=
92a"><div dir=3D"auto" style=3D"text-align:start"># nano freebsd.cfg</div><=
div dir=3D"auto" style=3D"text-align:start"><br></div></div><div class=3D"g=
mail-x11i5rnm gmail-xat24cr gmail-x1mh8g0r gmail-x1vvkbs gmail-xtlvy1s gmai=
l-x126k92a"><div dir=3D"auto" style=3D"text-align:start">kernel=3D&quot;/mn=
t/zroot2/zroot2/OS/Chromebook/domU/freebsd-xen/boot-xen/kernel/kernel.bin&q=
uot;</div><div dir=3D"auto" style=3D"text-align:start">memory=3D64</div><di=
v dir=3D"auto" style=3D"text-align:start">name=3D&quot;freebsd&quot;</div><=
div dir=3D"auto" style=3D"text-align:start">vcpus=3D1</div><div dir=3D"auto=
" style=3D"text-align:start">autoballon=3D&quot;off&quot;</div><div dir=3D"=
auto" style=3D"text-align:start">disk=3D[ &#39;phy:/dev/loop0,xvda,w&#39; ]=
</div><div dir=3D"auto" style=3D"text-align:start"><br></div></div><div cla=
ss=3D"gmail-x11i5rnm gmail-xat24cr gmail-x1mh8g0r gmail-x1vvkbs gmail-xtlvy=
1s gmail-x126k92a"><div dir=3D"auto" style=3D"text-align:start"># ./start-f=
reebsd</div><div dir=3D"auto" style=3D"text-align:start"><br></div></div><d=
iv class=3D"gmail-x11i5rnm gmail-xat24cr gmail-x1mh8g0r gmail-x1vvkbs gmail=
-xtlvy1s gmail-x126k92a"><div dir=3D"auto" style=3D"text-align:start">Parsi=
ng config from freebsd.cfg</div><div dir=3D"auto" style=3D"text-align:start=
">xc: error: panic: xg_dom_core.c:689: xc_dom_find_loader: no loader found:=
 Invalid kernel</div><div dir=3D"auto" style=3D"text-align:start">libxl: er=
ror: libxl_dom.c:571:libxl__build_dom: xc_dom_parse_image failed</div><div =
dir=3D"auto" style=3D"text-align:start">libxl: error: libxl_create.c:1640:d=
omcreate_rebuild_done: Domain 2:cannot (re-)build domain: -3</div><div dir=
=3D"auto" style=3D"text-align:start">libxl: error: libxl_domain.c:1183:libx=
l__destroy_domid: Domain 2:Non-existent domain</div><div dir=3D"auto" style=
=3D"text-align:start">libxl: error: libxl_domain.c:1137:domain_destroy_call=
back: Domain 2:Unable to destroy guest</div><div dir=3D"auto" style=3D"text=
-align:start">libxl: error: libxl_domain.c:1064:domain_destroy_cb: Domain 2=
:Destruction of domain failed</div><div dir=3D"auto" style=3D"text-align:st=
art">freebsd is an invalid domain identifier (rc=3D-6)</div></div></span></=
div></div></div></div><br><span class=3D"gmail_signature_prefix">-- </span>=
<br><div dir=3D"ltr" class=3D"gmail_signature" data-smartmail=3D"gmail_sign=
ature">Mario.<br></div></div>

--0000000000009c2744060c3c6561--

