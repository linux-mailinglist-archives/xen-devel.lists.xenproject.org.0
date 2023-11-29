Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F3A27FDD85
	for <lists+xen-devel@lfdr.de>; Wed, 29 Nov 2023 17:45:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.644122.1004715 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r8Nfy-0003DC-QJ; Wed, 29 Nov 2023 16:44:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 644122.1004715; Wed, 29 Nov 2023 16:44:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r8Nfy-0003An-NA; Wed, 29 Nov 2023 16:44:38 +0000
Received: by outflank-mailman (input) for mailman id 644122;
 Wed, 29 Nov 2023 16:44:37 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jm3Y=HK=gmail.com=marietto2008@srs-se1.protection.inumbo.net>)
 id 1r8Nfx-0003Ah-8w
 for xen-devel@lists.xenproject.org; Wed, 29 Nov 2023 16:44:37 +0000
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [2a00:1450:4864:20::636])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 93dec033-8ed6-11ee-9b0f-b553b5be7939;
 Wed, 29 Nov 2023 17:44:35 +0100 (CET)
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-a03a9009572so948441066b.3
 for <xen-devel@lists.xenproject.org>; Wed, 29 Nov 2023 08:44:35 -0800 (PST)
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
X-Inumbo-ID: 93dec033-8ed6-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701276274; x=1701881074; darn=lists.xenproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=2+cL+eCm5WeoI0pgf0QZURRprjfAcNdXcmpRF1/+2so=;
        b=diE6SxlYQQ4H+YZ6TdUJQKemLg2aoNDBAZnEVoTuFL6gbwth5B6O45nbClE33+j0NT
         VBAj41BXkJRfYHLdm4YingJlkjrkueewcdPb/6Hg1pDuUbF9HSPwb04MGScVpYGKGbqP
         U1wcsR7EuY5lyYrNNsUIn6SMkxp4b7PlO6UE31QTHuDM2BHM5rub12VGM1YDaKE0HamP
         cPXs96XXHHa3CUm392R0vWljr7ga78HHAU4bkzAvmYuq9xHgWNByw+ibWVQYIvrBdyfL
         AiOPI4CbZyTC34XeV1FOIcKSRZGic1KrIKFcug3ZoVlaM3euDbNa4jeQY7wyTthzLr5D
         qHEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701276274; x=1701881074;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2+cL+eCm5WeoI0pgf0QZURRprjfAcNdXcmpRF1/+2so=;
        b=ZUXTjKBPKZzLV09x/qzc6pB2NcxvIF/1a7nmizEMo6QwItns8sAgnT9hjA3QwBYk/x
         W+bGpYZOqzxvdkjTPqV2Fz8gUwxRLAcyQvfaY7nDf1Ljqv8HlV2f1p7q02q+PnsjYjHz
         nEGsXJaK54R/tsYsTDEZy4UJ5yN2wYhhBWA6ekrxPTKEB2BTZakFGnxbAQ9pn+Jpr2NK
         78pgGvNMA2KZzy0fw6xOLiZKOUXPM3aDF0yc6L8Hk1Ti8/kHSYS9OiIr/nNcYht/BG1Y
         ajwfdkCRV1zjPzXqfVefsF7dnCU4F+uwPj4gLv5T0jG1xAvdCn5dnogIlqWyrOxJMLB4
         vfdg==
X-Gm-Message-State: AOJu0YyhvXHUip5CWM4OquPJtd57pq/X00tbzvL6ikjxjOQMEWygO0+v
	5PSpVM2DVwOyYlDdHmeLDVHg8ud30078b8E/ag8=
X-Google-Smtp-Source: AGHT+IGF7siz7eBWhyoBvGVKEr0QVg28KItUD8c+zlMh28YN19E/nFP3KbgdKA3QGR2ZfDHUflCYr5zCIH4msYBwUkE=
X-Received: by 2002:a17:906:fa06:b0:a0d:ebfe:e404 with SMTP id
 lo6-20020a170906fa0600b00a0debfee404mr9574534ejb.22.1701276274194; Wed, 29
 Nov 2023 08:44:34 -0800 (PST)
MIME-Version: 1.0
References: <CA+1FSigM1PZc4WfZNUJSMsZbNPPTyThRJ7MMQwQ9TWn6VnSUTg@mail.gmail.com>
 <C0A0E9FA-5AAB-4324-BBBD-D07412CD7F32@arm.com> <ZWR1v5Y3EpRK817B@macbook>
 <CA+1FSij2Q9f9Vj0A06HUYeUxTddrEyF=Q8X5fbs96CRr83_BPg@mail.gmail.com>
 <4fc95518-7e46-4f82-b540-afdbc941508a@netscape.net> <f606be07-c4ff-43c6-acf9-42065a84b594@netscape.net>
 <ZWUgfkP4U5kOmQNj@mattapan.m5p.com> <ZWXvBMaRJ5Lbb5S9@macbook>
 <CA+1FSii4WeKQBuzW9TS_AkHD2nbm=Q+iL9j3wkfu+ZsC0V_=1w@mail.gmail.com>
 <ZWYC-omtTOxIHNwF@macbook> <ZWZyEtGMhjRba/Z2@mattapan.m5p.com>
In-Reply-To: <ZWZyEtGMhjRba/Z2@mattapan.m5p.com>
From: Mario Marietto <marietto2008@gmail.com>
Date: Wed, 29 Nov 2023 17:43:57 +0100
Message-ID: <CA+1FSiiPOJOWkqGm_yATWyiZCDFgHYkHT0CVBqdcvK78AdeFoA@mail.gmail.com>
Subject: Re: We are not able to virtualize FreeBSD using xen 4.17 on Arm 32 bit
To: Elliott Mitchell <ehem+freebsd@m5p.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	Chuck Zmudzinski <brchuckz@netscape.net>, Demi Marie Obenour <demi@invisiblethingslab.com>, 
	Anthony PERARD <anthony.perard@citrix.com>, Julien Grall <julien@xen.org>, 
	Xen-devel <xen-devel@lists.xenproject.org>, 
	Stefano Stabellini <sstabellini@kernel.org>, Bertrand Marquis <Bertrand.Marquis@arm.com>, 
	Michal Orzel <michal.orzel@amd.com>
Content-Type: multipart/alternative; boundary="000000000000fcfb70060b4d3f32"

--000000000000fcfb70060b4d3f32
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello to everyone.

I tried to use xen as a hypervisor instead of kvm + libvirt + virt-manager
to boot FreeBSD on my ARM Chromebook where I have installed Devuan 5,since
Stefano said :

"That might work. libvirt + virt-manager with the xen accelerator might
work on the ARM Chromebook. That's because as far as I know Xen integration
in libvirt is done via linking to libxl directly and libxl is supported and
working on ARM"

Unfortunately something is not working properly. What I did has been to
reboot the machine in xen,enable libvirtd & and virtlogd & and virt-manager
&,but this is what happened :

Traceback (most recent call last):
  File "/usr/lib/xen-4.17/bin/pygrub", line 884, in <module>
    raise RuntimeError("Unable to find partition containing kernel")
RuntimeError: Unable to find partition containing kernel

I think it does not recognize the FreeBSD file system structure and its
kernel. Libvirt seems to have been programmed to boot Linux,not FreeBSD.

In Fact,I did the counterproof and it seems to be like this :


According with this post :

https://blog.roberthallam.org/2020/05/solving-unable-to-find-partition-cont=
aining-kernel/

I've created a file called menu.lst inside the boot directory of the image
file called "debian.img",adding the following content inside :

default 0
timeout 10
title Debian
root (hd0,1)
kernel /boot/vmlinux-6.1.59-stb-xen-cbe+ root=3D/dev/xvda
initrd /boot/initrd.img-6.1.59-stb-xen-cbe+

and I tried again to boot the image using virt-manager. It gave this error
again :

root@devuan-bunsen:/mnt/zroot2/zroot2/OS/Chromebook/FreeBSD-guestOS/linux-x=
en/debian2/boot#
2023-11-29 15:21:09.266+0000: 2467: error : libxlDomainStartPerform:1256 :
internal error: libxenlight failed to create new domain 'debian12'

but giving a look inside the log file and I found this interesting
situation ;

Using <class 'grub.GrubConf.GrubConfigFile'> to parse /boot/grub/menu.lst
(B )0 [1;24r [m [?7h [?1h =3D [H [J [?1h =3D [1B    pyGRUB  version 0.6
[1B [0m
lqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqk
[1B [0m x [0;7m Debian 12
          [m [0m x
[1B [0m x [72C [0m x
[1B [0m x [72C [0m x
[1B [0m x [72C [0m x
[1B [0m x [72C [0m x
[1B [0m x [72C [0m x
[1B [0m x [72C [0m x
[1B [0m x [72C [0m x
[1B [0m
mqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqj
[1B [70D [0m Use the =E2=86=91 and =E2=86=93 keys to select which entry is =
highlighted. [1B
[58DPress enter to boot the selected OS, 'e' to edit the [1B [52Dcommands
before booting, 'a' to modify the kernel arguments [1B [59Dbefore booting,
or 'c' for a command line. [12A [26C [17B [68DWill boot selected entry in
10 seconds [?1h =3D
[J [17A [73C [17B [68DWill boot selected entry in  9 seconds [?1h =3D
[J [17A [73C [17B [68DWill boot selected entry in  8 seconds [?1h =3D
[J [17A [73C [17B [68DWill boot selected entry in  7 seconds [?1h =3D
[J [17A [73C [17B [68DWill boot selected entry in  6 seconds [?1h =3D
[J [17A [73C [17B [68DWill boot selected entry in  5 seconds [?1h =3D
[J [17A [73C [17B [68DWill boot selected entry in  4 seconds [?1h =3D
[J [17A [73C [17B [68DWill boot selected entry in  3 seconds [?1h =3D
[J [17A [73C [17B [68DWill boot selected entry in  2 seconds [?1h =3D
[J [17A [73C [17B [68DWill boot selected entry in  1 seconds [?1l > [24;1H
[?1l >

so,it seems that it tried to boot,but for an unknown reason,it still gives
the error.

Anyway : My xen setup is not broken anymore ; Using Libvirt Linux seems to
be able to boot,FreeBSD does not. Using the "raw" method of booting FreeBSD
as domU could be another story that I will try soon.

But before trying to compile the correct freebsd kernel that's recognized
by xen using the Elliott Michell code,I need to understand well what's the
procedure that will work. So below you can read what I will try to do :

$ truncate -s 100G xenvm.img
$ mdconfig -f xenvm.img -u 0
$ newfs /dev/md0
$ mount /dev/md0 /mnt
$ git clone https://gitlab.com/ehem/freebsd-src.git
$ cd freebsd-src

$ make  -DNO_MODULES   KERNCONF=3DGENERIC TARGET=3Darm TARGET_ARCH=3Darmv7
DESTDIR=3D/build buildkernel

$ echo "/dev/xbd0       /       ufs     rw      1
1" > /mnt/etc/fstab

$ nano /build/etc/ttys (add the line 'xc0 "/usr/libexec/getty Pc"
xterm on secure")
$ umount /build
$ mdconfig -d -u 0

Do you see errors ? some missing ?


---> I've only ever tried arm64, but since arm32 didn't appear to need
much to be operational I tried to
make it possible.  In theory it /should/ work on arm32, but I've never
tried it.  What was missing was
I had never added it to the configuration and one link was needed.
Updated "submit" branch has a tiny
adjustment.

I didn't understand how to apply the patch that's inside the "submit" branc=
h.



On Wed, Nov 29, 2023 at 12:05=E2=80=AFAM Elliott Mitchell <ehem+freebsd@m5p=
.com>
wrote:

> On Tue, Nov 28, 2023 at 04:10:50PM +0100, Roger Pau Monn=C3=A9 wrote:
> > On Tue, Nov 28, 2023 at 03:09:14PM +0100, Mario Marietto wrote:
> > > For booting a FreeBSD kernel as a guest OS on XEN,should we install x=
en
> > > 4.18 from source ?
>
> > I don't think so, I'm not aware of the FreeBSD port requiring a
> > specific version of Xen.  I do think the work is limited to aarch64
> > however, so there's no support in sight for arm32 FreeBSD guests as
> > far as I'm aware.
>
> I've only ever tried arm64, but since arm32 didn't appear to need much
> to have operational I tried to make it possible.  In theory it /should/
> work on arm32, but I've never tried it.  What was missing was I had never
> added it to the configuration and one link was needed.  Updated "submit"
> branch has the tiny adjustment.
>
> (the only difference is the hypercall wrappers, register naming and where
> the op code goes, very simple compatibility)
>
>
> On Tue, Nov 28, 2023 at 02:45:40PM +0100, Roger Pau Monn=C3=A9 wrote:
> > On Mon, Nov 27, 2023 at 03:04:30PM -0800, Elliott Mitchell wrote:
> > > BTW Roger Pau Monn=C3=A9, now that Xen 4.18 is out, take a look at th=
e
> > > "royger" branch?
> >
> > I've pushed a bunch of those, there are still some, I've made comments
> > on the branch.
> >
> > I think there isn't much left after the swept I've done.
> >
> > If you can rebase and reply to the comments I will take a look at
> > what's remaining.
>
> Done.  I'm unsure you'll like the xs_attach_children() approach.  Thing
> is that really is appropriate given the situation.  #2 is the urgent one
> as that is the handy approach to the hypercall declarations.
>
>
> --
> (\___(\___(\______          --=3D> 8-) EHM <=3D--          ______/)___/)_=
__/)
>  \BS (    |         ehem+sigmsg@m5p.com  PGP 87145445         |    )   /
>   \_CS\   |  _____  -O #include <stddisclaimer.h> O-   _____  |   /  _/
> 8A19\___\_|_/58D2 7E3D DDF4 7BA6 <-PGP-> 41D1 B375 37D0 8714\_|_/___/5445
>
>
>

--=20
Mario.

--000000000000fcfb70060b4d3f32
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div>Hello to everyone.</div><div><br></d=
iv><div>I tried to use xen as a hypervisor instead of kvm + libvirt + virt-=
manager to boot FreeBSD on my ARM
Chromebook where I have installed Devuan 5,since Stefano said :=C2=A0</div>=
<div><br></div><div>&quot;That might work. libvirt + virt-manager with the =
xen accelerator might work on the
ARM Chromebook. That&#39;s because as far as I know Xen integration in libv=
irt is done via
linking to libxl directly and libxl is supported and working on ARM&quot;=
=C2=A0</div><div><br></div><div>Unfortunately something is not working prop=
erly. What I did has been to reboot the machine
in xen,enable libvirtd &amp; and virtlogd &amp; and virt-manager &amp;,but =
this is what
happened :</div><div><br></div><div><div class=3D"gmail-adn gmail-ads"><div=
 class=3D"gmail-gs"><div class=3D"gmail-"><div id=3D"gmail-:13g" class=3D"g=
mail-ii gmail-gt"><div id=3D"gmail-:13f" class=3D"gmail-a3s gmail-aiL"><div=
 dir=3D"ltr"><div dir=3D"ltr"><div role=3D"listitem" aria-expanded=3D"true"=
><div><div><div><div id=3D"m_-8811732187760819894m_-6478800134031961150m_-1=
139880684127294261gmail-:1u1"><div><div><div><div><div id=3D"m_-88117321877=
60819894m_-6478800134031961150m_-1139880684127294261gmail-:1f3"><div id=3D"=
m_-8811732187760819894m_-6478800134031961150m_-1139880684127294261gmail-:1k=
p"><div dir=3D"ltr"><div><span class=3D"gmail-im"><span>Traceback (most rec=
ent call last):<br></span></span>=C2=A0 File &quot;/usr/lib/xen-4.17/bin/py=
grub&quot;, line 884, in &lt;module&gt;<br>=C2=A0 =C2=A0 raise RuntimeError=
(&quot;Unable to find partition containing kernel&quot;)<br>RuntimeError: U=
nable to find partition containing kernel</div><div><br></div><div>I
 think it does not recognize the FreeBSD file system structure and its=20
kernel. Libvirt seems to have been programmed to boot Linux,not=20
FreeBSD.=C2=A0</div><div><br></div><div>In Fact,I did the counterproof and =
it seems to be like this :</div></div></div></div></div></div></div></div><=
/div></div></div></div></div><div role=3D"listitem" aria-expanded=3D"true">=
<div><div><div><div id=3D"m_-8811732187760819894m_-6478800134031961150m_-11=
39880684127294261gmail-:1oa"><div><div><div><table cellpadding=3D"0"><tbody=
><tr><td><table cellpadding=3D"0"><tbody><tr><td><br></td></tr></tbody></ta=
ble></td><td><div><br></div><div>According with this post :</div><div><br><=
/div><div><a href=3D"https://blog.roberthallam.org/2020/05/solving-unable-t=
o-find-partition-containing-kernel/" target=3D"_blank">https://blog.roberth=
allam.org/2020/05/solving-unable-to-find-partition-containing-kernel/</a></=
div><div><br></div><div>I&#39;ve
 created a file called menu.lst inside the boot directory of the image=20
file called &quot;debian.img&quot;,adding the following content inside :</d=
iv><div><br></div><div><div><div><div><span>default </span><span>0</span><s=
pan></span></div></div><div><div><span>timeout </span><span>10</span><span>=
</span></div></div><div><div><span>title Debian</span></div></div><div><div=
><span>    root (hd0,</span><span>1</span><span>)</span></div></div><div><d=
iv><span>    kernel /boot/</span><span style=3D"font-family:monospace"><spa=
n style=3D"color:rgb(0,0,0);background-color:rgb(255,255,255)">vmlinux-6.1.=
59-stb-xen-cbe+</span></span><span> root=3D/dev/xvda</span></div></div><div=
><div><span>    initrd /boot/</span><span style=3D"font-family:monospace"><=
span style=3D"color:rgb(0,0,0);background-color:rgb(255,255,255)">initrd.im=
g-6.1.59-stb-xen-cbe+</span></span></div><div><span style=3D"font-family:mo=
nospace"><span style=3D"color:rgb(0,0,0);background-color:rgb(255,255,255)"=
><br></span></span></div><div><span style=3D"font-family:monospace"><span s=
tyle=3D"color:rgb(0,0,0);background-color:rgb(255,255,255)">and I tried aga=
in to boot the image using virt-manager. It gave this error again :</span><=
/span></div><div><span style=3D"font-family:monospace"><span style=3D"color=
:rgb(0,0,0);background-color:rgb(255,255,255)"><br></span></span></div><div=
><span style=3D"font-family:monospace"><span style=3D"color:rgb(0,0,0);back=
ground-color:rgb(255,255,255)">root@devuan-bunsen:/mnt/zroot2/zroot2/OS/Chr=
omebook/FreeBSD-guestOS/linux-xen/debian2/boot# 2023-11-29 15:21:09.266+000=
0: 2467: error :</span> libxlDomainStartPerform:1256 : internal error: libx=
enlight failed to create new domain &#39;debian12&#39;<br></span></div><div=
><span style=3D"font-family:monospace"><br></span></div><div><span style=3D=
"font-family:monospace">but giving a look inside the log file and I found t=
his interesting situation ;</span></div><div><span style=3D"font-family:mon=
ospace"></span></div><div><span style=3D"font-family:monospace"><br></span>=
</div><div>Using &lt;class &#39;grub.GrubConf.GrubConfigFile&#39;&gt; to pa=
rse /boot/grub/menu.lst<br> (B )0 [1;24r [m  [?7h [?1h =3D [H [J [?1h =3D [=
1B =C2=A0 =C2=A0pyGRUB =C2=A0version 0.6<br> [1B  [0m lqqqqqqqqqqqqqqqqqqqq=
qqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqk <br> [1B  [0m x   [0;=
7m Debian 12 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0  =
[m   [0m x <br> [1B  [0m x  [72C [0m x <br> [1B  [0m x  [72C [0m x <br> [1B=
  [0m x  [72C [0m x <br> [1B  [0m x  [72C [0m x <br> [1B  [0m x  [72C [0m x=
 <br> [1B  [0m x  [72C [0m x <br> [1B  [0m x  [72C [0m x <br> [1B  [0m mqqq=
qqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqj
  [1B [70D [0m  Use the =E2=86=91 and =E2=86=93 keys to select which entry =
is=20
highlighted. [1B [58DPress enter to boot the selected OS, &#39;e&#39; to ed=
it=20
the [1B [52Dcommands before booting, &#39;a&#39; to modify the kernel argum=
ents=20
[1B [59Dbefore booting, or &#39;c&#39; for a command line. [12A [26C [17B=
=20
[68DWill boot selected entry in 10 seconds [?1h =3D<br> [J [17A [73C [17B [=
68DWill boot selected entry in =C2=A09 seconds [?1h =3D<br> [J [17A [73C [1=
7B [68DWill boot selected entry in =C2=A08 seconds [?1h =3D<br> [J [17A [73=
C [17B [68DWill boot selected entry in =C2=A07 seconds [?1h =3D<br> [J [17A=
 [73C [17B [68DWill boot selected entry in =C2=A06 seconds [?1h =3D<br> [J =
[17A [73C [17B [68DWill boot selected entry in =C2=A05 seconds [?1h =3D<br>=
 [J [17A [73C [17B [68DWill boot selected entry in =C2=A04 seconds [?1h =3D=
<br> [J [17A [73C [17B [68DWill boot selected entry in =C2=A03 seconds [?1h=
 =3D<br> [J [17A [73C [17B [68DWill boot selected entry in =C2=A02 seconds =
[?1h =3D<br> [J [17A [73C [17B [68DWill boot selected entry in =C2=A01 seco=
nds [?1l &gt; [24;1H<br> [?1l &gt;</div><div><br></div><div>so,it seems tha=
t it tried to boot,but for an unknown reason,it still gives the error.</div=
><div>=C2=A0<br></div><div>Anyway
 : My xen setup is not broken anymore ; Using Libvirt Linux seems to be=20
able to boot,FreeBSD does not. Using the &quot;raw&quot; method of booting =
FreeBSD
 as domU could be another story that I will try soon. <br></div></div></div=
></div></td></tr></tbody></table></div></div></div></div></div></div></div>=
</div></div></div></div></div></div></div></div><div class=3D"gmail-gA gmai=
l-gt gmail-acV"><div class=3D"gmail-gB gmail-xu"><div class=3D"gmail-ip gma=
il-iq"><div id=3D"gmail-:2f8"><table class=3D"gmail-cf gmail-wS" role=3D"pr=
esentation"><tbody><tr><td class=3D"gmail-amq"><br></td><td class=3D"gmail-=
amr"></td></tr></tbody></table></div></div></div></div></div><div>But befor=
e trying to compile=20
the correct freebsd kernel that&#39;s recognized by xen using the Elliott=
=20
Michell code,I need to understand well what&#39;s the procedure that will w=
ork. So below you can read what I will try to do :<br></div><div><br></div>=
<div><pre><code>$ truncate -s 100G xenvm.img<br>$ mdconfig -f xenvm.img -u =
0=20
$ newfs /dev/md0=20
$ mount /dev/md0 /mnt<br>$</code><span style=3D"font-family:monospace"><spa=
n style=3D"color:rgb(0,0,0);background-color:rgb(255,255,255)"> git clone <=
a href=3D"https://gitlab.com/ehem/freebsd-src.git" target=3D"_blank">https:=
//gitlab.com/ehem/freebsd-src.git</a><br>$ </span></span>cd freebsd-src<br>=
<br>$ make  -DNO_MODULES   KERNCONF=3DGENERIC TARGET=3Darm TARGET_ARCH=3Dar=
mv7 <code>DESTDIR=3D/build </code>buildkernel<code><br></code><code><br>$ e=
cho &quot;/dev/xbd0       /       ufs     rw      1=20
1&quot; &gt; /mnt/etc/fstab =20

$ nano /build/etc/ttys (add the line &#39;xc0 &quot;/usr/libexec/getty Pc&q=
uot; xterm on secure&quot;)
$ umount /build<br>$ mdconfig -d -u 0<br><br></code></pre><pre><code>Do you=
 see errors ? some missing ?<br><br></code><br>---&gt; I&#39;ve only ever t=
ried arm64, but since arm32 didn&#39;t appear to need much to be operationa=
l I tried to<br>make it possible.=C2=A0 In theory it /should/ work on arm32=
, but I&#39;ve never tried it.=C2=A0 What was missing was <br>I had never a=
dded it to the configuration and one link was needed. Updated &quot;submit&=
quot; branch has a tiny <br>adjustment.<br><br></pre><pre>I didn&#39;t unde=
rstand how to apply the patch that&#39;s inside the &quot;submit&quot; bran=
ch. <br></pre><pre><br></pre></div></div></div><br><div class=3D"gmail_quot=
e"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Nov 29, 2023 at 12:05=E2=
=80=AFAM Elliott Mitchell &lt;<a href=3D"mailto:ehem%2Bfreebsd@m5p.com" tar=
get=3D"_blank">ehem+freebsd@m5p.com</a>&gt; wrote:<br></div><blockquote cla=
ss=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid =
rgb(204,204,204);padding-left:1ex">On Tue, Nov 28, 2023 at 04:10:50PM +0100=
, Roger Pau Monn=C3=A9 wrote:<br>
&gt; On Tue, Nov 28, 2023 at 03:09:14PM +0100, Mario Marietto wrote:<br>
&gt; &gt; For booting a FreeBSD kernel as a guest OS on XEN,should we insta=
ll xen<br>
&gt; &gt; 4.18 from source ?<br>
<br>
&gt; I don&#39;t think so, I&#39;m not aware of the FreeBSD port requiring =
a<br>
&gt; specific version of Xen.=C2=A0 I do think the work is limited to aarch=
64<br>
&gt; however, so there&#39;s no support in sight for arm32 FreeBSD guests a=
s<br>
&gt; far as I&#39;m aware.<br>
<br>
I&#39;ve only ever tried arm64, but since arm32 didn&#39;t appear to need m=
uch<br>
to have operational I tried to make it possible.=C2=A0 In theory it /should=
/<br>
work on arm32, but I&#39;ve never tried it.=C2=A0 What was missing was I ha=
d never<br>
added it to the configuration and one link was needed.=C2=A0 Updated &quot;=
submit&quot;<br>
branch has the tiny adjustment.<br>
<br>
(the only difference is the hypercall wrappers, register naming and where<b=
r>
the op code goes, very simple compatibility)<br>
<br>
<br>
On Tue, Nov 28, 2023 at 02:45:40PM +0100, Roger Pau Monn=C3=A9 wrote:<br>
&gt; On Mon, Nov 27, 2023 at 03:04:30PM -0800, Elliott Mitchell wrote:<br>
&gt; &gt; BTW Roger Pau Monn=C3=A9, now that Xen 4.18 is out, take a look a=
t the<br>
&gt; &gt; &quot;royger&quot; branch?<br>
&gt; <br>
&gt; I&#39;ve pushed a bunch of those, there are still some, I&#39;ve made =
comments<br>
&gt; on the branch.<br>
&gt; <br>
&gt; I think there isn&#39;t much left after the swept I&#39;ve done.<br>
&gt; <br>
&gt; If you can rebase and reply to the comments I will take a look at<br>
&gt; what&#39;s remaining.<br>
<br>
Done.=C2=A0 I&#39;m unsure you&#39;ll like the xs_attach_children() approac=
h.=C2=A0 Thing<br>
is that really is appropriate given the situation.=C2=A0 #2 is the urgent o=
ne<br>
as that is the handy approach to the hypercall declarations.<br>
<br>
<br>
-- <br>
(\___(\___(\______=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 --=3D&gt; 8-) EHM &lt;=
=3D--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ______/)___/)___/)<br>
=C2=A0\BS (=C2=A0 =C2=A0 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"mail=
to:ehem%2Bsigmsg@m5p.com" target=3D"_blank">ehem+sigmsg@m5p.com</a>=C2=A0 P=
GP 87145445=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0 )=C2=A0 =C2=A0/=
<br>
=C2=A0 \_CS\=C2=A0 =C2=A0|=C2=A0 _____=C2=A0 -O #include &lt;stddisclaimer.=
h&gt; O-=C2=A0 =C2=A0_____=C2=A0 |=C2=A0 =C2=A0/=C2=A0 _/<br>
8A19\___\_|_/58D2 7E3D DDF4 7BA6 &lt;-PGP-&gt; 41D1 B375 37D0 8714\_|_/___/=
5445<br>
<br>
<br>
</blockquote></div><br clear=3D"all"><br><span class=3D"gmail_signature_pre=
fix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature">Mario.<br></d=
iv>

--000000000000fcfb70060b4d3f32--

