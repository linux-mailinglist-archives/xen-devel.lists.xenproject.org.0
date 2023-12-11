Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F4DB80D4D7
	for <lists+xen-devel@lfdr.de>; Mon, 11 Dec 2023 19:00:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.652469.1018332 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rCkZS-000212-Rx; Mon, 11 Dec 2023 17:59:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 652469.1018332; Mon, 11 Dec 2023 17:59:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rCkZS-0001zI-Oy; Mon, 11 Dec 2023 17:59:58 +0000
Received: by outflank-mailman (input) for mailman id 652469;
 Mon, 11 Dec 2023 17:59:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=pUvq=HW=gmail.com=marietto2008@srs-se1.protection.inumbo.net>)
 id 1rCkZR-0001z8-NU
 for xen-devel@lists.xenproject.org; Mon, 11 Dec 2023 17:59:57 +0000
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [2a00:1450:4864:20::534])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 167b9db4-984f-11ee-9b0f-b553b5be7939;
 Mon, 11 Dec 2023 18:59:54 +0100 (CET)
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-54dcfca54e0so6096350a12.1; 
 Mon, 11 Dec 2023 09:59:54 -0800 (PST)
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
X-Inumbo-ID: 167b9db4-984f-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702317594; x=1702922394; darn=lists.xenproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=EaeiZrAP5x1zVrU7NrtPyS+Q5VdpdTE30VvFBVrvv0Q=;
        b=VnKHkD3w8bs+QIdBimLE4z477xO1UzdbQY8ydV8BdHMSlsk5RLw0CB+uTKIj845P5C
         GtnWeM6JIlVqejGuHwEEOPo0dYAefYGlJFOjecYEpFSrcXGmEr67gRkKnznwqseefgMA
         nOt3XYXVQ7Z9bqeGIYoBjriJCDfngujIojQExNdE779RvDZv+lj6dCQcF/aM0ZnReNSt
         Ocm77C2JvCS3Vjq0jaPAwI+w5K+7LnXxqLqAmSb/hAH+6KX4mkgvrsfKI0At8iqNyw/4
         cUkobFcXskJOjb9/GSl+NYQiV7NpVd468n+SsrI1NwCUS0k5ioTjiaz/Da4ya+33/2Zx
         K3TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702317594; x=1702922394;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EaeiZrAP5x1zVrU7NrtPyS+Q5VdpdTE30VvFBVrvv0Q=;
        b=L+bxvaTUDNM4zU3vV4Oo6JauDcB3yELMW5lPRMxotVscz55Ux0wq1ZSnT1BtvvVY3H
         Kh99rt0UwbamsQ7umFMbgUUzbiQsgocQ0e2LevHsic3Px63ZIWb0LTMwpH4lXUaowRXe
         6zz6Yg9qUaZEThUSh3uPvzC9kntlQGr6SOcW/8Kci+ZbsElBGuAyNG/Iuz6KmjNZ2O/L
         gdALHraRvChOVcjFWaZWgSjVWsZEhfL3MW80GcqZiF3YJYF2hwMgnUsV4Y2fkT46VpQF
         9Tm+W523W8ldBroRTj2s95hu63S9ioZubyroZq9ahB429xjeg/rDHueTtrmUsaecjg4o
         Z9Jg==
X-Gm-Message-State: AOJu0YwU/GAdvZiYENFBhOoGE1jzMjQlbOlL9bHpfIGRtbFc5TAdTgHt
	xZFfPFkQe8KwvmrZtcpDjww5JtGDbP9AqizIimY=
X-Google-Smtp-Source: AGHT+IG47GRuEn+TVOCkETW5WMQ3NtxfPHEy9JW/2rZ2//i+1SOapH2Z2djBZnooOxvuDjjqxc0WFTiecf2HnfZj70A=
X-Received: by 2002:a17:906:10da:b0:a1f:8f42:ec66 with SMTP id
 v26-20020a17090610da00b00a1f8f42ec66mr1199262ejv.146.1702317593489; Mon, 11
 Dec 2023 09:59:53 -0800 (PST)
MIME-Version: 1.0
References: <CA+1FSiii2etikw9LKdJ5Ebn+z-3-e5UXh3cJjBgYGJYtq3q=Ww@mail.gmail.com>
 <300b7e2b-068a-4cac-a617-ae41caa6d3b9@netscape.net>
In-Reply-To: <300b7e2b-068a-4cac-a617-ae41caa6d3b9@netscape.net>
From: Mario Marietto <marietto2008@gmail.com>
Date: Mon, 11 Dec 2023 18:59:17 +0100
Message-ID: <CA+1FSiiuWz_91Wg3Az440nFKaLY_raoUy=3nGj4Zca8viKAT=Q@mail.gmail.com>
Subject: Re: xc_dom_guest_type: image not capable of booting inside a HV M
 container: Invalid kernel
To: Chuck Zmudzinski <brchuckz@netscape.net>
Cc: Elliott Mitchell <ehem+freebsd@m5p.com>, Julien Grall <julien@xen.org>, 
	Bertrand Marquis <bertrand.marquis@arm.com>, xen-devel <xen-devel@lists.xenproject.org>, 
	xen-users-request@lists.xenproject.org, 
	Stefano Stabellini <sstabellini@kernel.org>, 
	=?UTF-8?Q?Marek_Marczykowski=2DG=C3=B3recki?= <marmarek@invisiblethingslab.com>
Content-Type: multipart/alternative; boundary="0000000000007475d4060c3fb3d7"

--0000000000007475d4060c3fb3d7
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

root@marietto:/mnt/zroot2/zroot2/OS/Chromebook/domU/freebsd-xen/boot-xen/ke=
rnel
# file /mnt/zroot2/zroot2/OS/Chromebook/domU/freebsd-xen/boot-xen/kernel/ke=
rnel


ELF 32-bit LSB executable,ARM, EABI5 version 1 (FreeBSD), dynamically
linked, interpreter /red/herring,
BuildID[sha1]=3D5e6982c9cb67d9c94571b76419142a8c495388d0,
for FreeBSD 13.2, not stripped

root@marietto:/mnt/zroot2/zroot2/OS/Chromebook/domU/freebsd-xen/boot-xen/ke=
rnel
# file
/mnt/zroot2/zroot2/OS/Chromebook/domU/freebsd-xen/boot-xen/kernel/kernel.bi=
n

kernel.bin: data

It does not boot from the kernel.bin file.


On Mon, Dec 11, 2023 at 6:23=E2=80=AFPM Chuck Zmudzinski <brchuckz@netscape=
.net>
wrote:

> On 12/11/2023 9:02 AM, Mario Marietto wrote:
> > Hello.
> >
> > Finally I tried to recompile the FreeBSD kernel using the @Elliott
> Mitchell <mailto:ehem+freebsd@m5p.com> code because I want to boot
> FreeBSD as domU with Xen installed on my Arm 32 bit Chromebook.
> Unfortunately it didn't work at all. Maybe I've missed something / I
> haven't understood well what to do. Please give me some suggestions.
> >
> > Basically this is what I did :
> >
> > $ created a vm called FreeBSD-13.2-RELEASE-armv7.img with qemu / kvm /
> libvirt / virt-manager
> >
> > $ within the vm : mkdir /build-xen
> >
> > $ cd /usr
> >
> > $ git clone https://gitlab.com/ehem/freebsd-src.git <
> https://gitlab.com/ehem/freebsd-src.git?fbclid=3DIwAR09ukOdBXCR3gJznvHWpn=
WM8VEZqnX1l4ZMza_7lhoAjfPYAGbvcqwjh94
> >
> >
> > $ cd freebsd-src
> >
> > $ make KERNCONF=3DGENERIC TARGET=3Darm TARGET_ARCH=3Darmv7 buildkernel
> >
> > $ make KERNCONF=3DGENERIC TARGET=3Darm TARGET_ARCH=3Darmv7 DESTDIR=3D/b=
uild-xen
> installkernel
> >
> > $ echo "/dev/xbd0 / ufs rw 1 1" > /mnt/etc/fstab
> >
> > $ nano /etc/ttys (add the line 'xc0 "/usr/libexec/getty Pc" xterm on
> secure")
> >
> > $ renamed the directories dtb to dtb_ and kernel to kernel_ that are
> inside the /boot dir of the vm
> >
> > $ copied the directory dtb and kernel from the directory /build-xen to
> the directory /boot inside the vm
> >
> > $ shut down the vm
> >
> > $ copied the directory /build-xen outside of the vm using this method
> (in this case I used Linux installed on the Host OS,because the kernel th=
at
> I'm using on the Chromebook has the kernel parameter related to the ufs2 =
fs
> set to off) :
> >
> > on my X64 workstation :
> >
> > # modprobe ufs
> >
> > # sudo losetup -fP FreeBSD-13.2-RELEASE-armv7.img
> >
> > # ls /dev/loop0*
> >
> > /dev/loop0 /dev/loop0p1 /dev/loop0p2 /dev/loop0p5
> >
> > # mount -t ufs -o ufstype=3Dufs2 /dev/loop0p5 ./FreeBSD-xen
> >
> > then :
> >
> > # nano freebsd.cfg
> >
> >
> kernel=3D"/mnt/zroot2/zroot2/OS/Chromebook/domU/freebsd-xen/boot-xen/kern=
el/kernel"
> > memory=3D64
> > name=3D"freebsd"
> > vcpus=3D1
> > autoballon=3D"off"
> > disk=3D[ 'phy:/dev/loop0,xvda,w' ]
> > # nano start-freebsd
> > losetup -fP FreeBSD-13.2-RELEASE-armv7.img
> > xl create freebsd.cfg
> > xl console freebsd
> >
> > # ./start-freebsd
> >
> > Parsing config from freebsd.cfg
> > xc: error: panic: xg_dom_elfloader.c:63: xc_dom_guest_type: image not
> capable of booting inside a HV
> > M container: Invalid kernel
>
> It is detecting the kernel as an elf binary. IIUC, Xen on arm guests
> should have zImage kernels, not elf.
>
> > libxl: error: libxl_dom.c:571:libxl__build_dom: xc_dom_parse_image fail=
ed
> > libxl: error: libxl_create.c:1640:domcreate_rebuild_done: Domain
> 1:cannot (re-)build domain: -3
> > libxl: error: libxl_domain.c:1183:libxl__destroy_domid: Domain
> 1:Non-existent domain
> > libxl: error: libxl_domain.c:1137:domain_destroy_callback: Domain
> 1:Unable to destroy guest
> > libxl: error: libxl_domain.c:1064:domain_destroy_cb: Domain
> 1:Destruction of domain failed
> > freebsd is an invalid domain identifier (rc=3D-6)
> >
> > I have also tried with kernel.bin :
> >
> > # nano freebsd.cfg
> >
> >
> kernel=3D"/mnt/zroot2/zroot2/OS/Chromebook/domU/freebsd-xen/boot-xen/kern=
el/kernel.bin"
> > memory=3D64
> > name=3D"freebsd"
> > vcpus=3D1
> > autoballon=3D"off"
> > disk=3D[ 'phy:/dev/loop0,xvda,w' ]
> >
> > # ./start-freebsd
> >
> > Parsing config from freebsd.cfg
> > xc: error: panic: xg_dom_core.c:689: xc_dom_find_loader: no loader
> found: Invalid kernel
> > libxl: error: libxl_dom.c:571:libxl__build_dom: xc_dom_parse_image fail=
ed
> > libxl: error: libxl_create.c:1640:domcreate_rebuild_done: Domain
> 2:cannot (re-)build domain: -3
> > libxl: error: libxl_domain.c:1183:libxl__destroy_domid: Domain
> 2:Non-existent domain
> > libxl: error: libxl_domain.c:1137:domain_destroy_callback: Domain
> 2:Unable to destroy guest
> > libxl: error: libxl_domain.c:1064:domain_destroy_cb: Domain
> 2:Destruction of domain failed
> > freebsd is an invalid domain identifier (rc=3D-6)
> >
> > --
> > Mario.
>
> I would be interested to see the output of :
>
> $ file
> /mnt/zroot2/zroot2/OS/Chromebook/domU/freebsd-xen/boot-xen/kernel/kernel
>
> and
>
> $ file
> /mnt/zroot2/zroot2/OS/Chromebook/domU/freebsd-xen/boot-xen/kernel/kernel.=
bin
>
> I have been trying out Julien's old patch set from 2014, and in there was
> this patch :
>
> > arm: Add zImage support
> >
> > Currently Xen on ARM is only supported zImage for guest kernel. Adding
> support
> > for ARM ELF in the toolstack looks a bit complicate for ARM (though
> there is
> > an x86 support).
>
> Link to Julien's 2014 patch to provide zImage support for FreeBSD :
>
>
> https://xenbits.xen.org/gitweb/?p=3Dpeople/julieng/freebsd.git;a=3Dcommit=
;h=3D12a7cb346b88c6d3f52a20b98f361dc62797fbcd
>
> When using Julien's patches, from 'file' I find that the kernel file is i=
n
> the elf format, and the kernel.bin file is in the zImage format, so I hav=
e
> been trying to boot the kernel.bin file.
>


--=20
Mario.

--0000000000007475d4060c3fb3d7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><span style=3D"font-family:monospace"><font size=3D"6"><sp=
an style=3D"color:rgb(0,0,0);background-color:rgb(255,255,255)">root@mariet=
to:/mnt/zroot2/zroot2/OS/Chromebook/domU/freebsd-xen/boot-xen/kernel # file=
 /mnt/zroot2/z</span>root2/OS/Chromebook/domU/freebsd-xen/boot-xen/kernel/k=
ernel
<br></font></span><div><span style=3D"font-family:monospace"><font size=3D"=
6"><br></font></span></div><div><span style=3D"font-family:monospace"><font=
 size=3D"6">ELF 32-bit LSB executable,</font></span><span style=3D"font-fam=
ily:monospace"><font size=3D"6">ARM, EABI5 version 1 (FreeBSD), dynamically=
 linked, interpreter /red/herring, BuildID[sha1]=3D5e6982c</font></span><sp=
an style=3D"font-family:monospace"><font size=3D"6">9cb67d9c94571b76419142a=
8c495388d0, for FreeBSD 13.2, not stripped</font></span></div><div><span st=
yle=3D"font-family:monospace"><font size=3D"6"><br>
</font></span></div><div><span style=3D"font-family:monospace"><font size=
=3D"6">root@marietto:/mnt/zroot2/zroot2/OS/Chromebook/domU/freebsd-xen/boot=
-xen/kernel # file /mnt/zroot2/zroot2/OS/Chromebook/domU/freebsd-xen/boot-x=
en/kernel/kernel.bin</font></span></div><div><span style=3D"font-family:mon=
ospace"><font size=3D"6"><br>
</font></span></div><div><span style=3D"font-family:monospace"></span></div=
><div><span style=3D"font-family:monospace"><font size=3D"6">kernel.bin: da=
ta=C2=A0</font></span></div><div><span style=3D"font-family:monospace"><fon=
t size=3D"6"><br></font></span></div><div><span style=3D"font-family:monosp=
ace"><font size=3D"6">It does not boot from the kernel.bin file.</font></sp=
an></div><div><br></div><div><span style=3D"font-family:monospace"></span><=
/div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_a=
ttr">On Mon, Dec 11, 2023 at 6:23=E2=80=AFPM Chuck Zmudzinski &lt;<a href=
=3D"mailto:brchuckz@netscape.net">brchuckz@netscape.net</a>&gt; wrote:<br><=
/div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bo=
rder-left:1px solid rgb(204,204,204);padding-left:1ex">On 12/11/2023 9:02 A=
M, Mario Marietto wrote:<br>
&gt; Hello.<br>
&gt; <br>
&gt; Finally I tried to recompile the FreeBSD kernel using the @Elliott Mit=
chell &lt;mailto:<a href=3D"mailto:ehem%2Bfreebsd@m5p.com" target=3D"_blank=
">ehem+freebsd@m5p.com</a>&gt; code because I want to boot FreeBSD as domU =
with Xen installed on my Arm 32 bit Chromebook. Unfortunately it didn&#39;t=
 work at all. Maybe I&#39;ve missed something / I haven&#39;t understood we=
ll what to do. Please give me some suggestions.<br>
&gt; <br>
&gt; Basically this is what I did :<br>
&gt; <br>
&gt; $ created a vm called FreeBSD-13.2-RELEASE-armv7.img with qemu / kvm /=
 libvirt / virt-manager<br>
&gt; <br>
&gt; $ within the vm : mkdir /build-xen<br>
&gt; <br>
&gt; $ cd /usr<br>
&gt; <br>
&gt; $ git clone <a href=3D"https://gitlab.com/ehem/freebsd-src.git" rel=3D=
"noreferrer" target=3D"_blank">https://gitlab.com/ehem/freebsd-src.git</a> =
&lt;<a href=3D"https://gitlab.com/ehem/freebsd-src.git?fbclid=3DIwAR09ukOdB=
XCR3gJznvHWpnWM8VEZqnX1l4ZMza_7lhoAjfPYAGbvcqwjh94" rel=3D"noreferrer" targ=
et=3D"_blank">https://gitlab.com/ehem/freebsd-src.git?fbclid=3DIwAR09ukOdBX=
CR3gJznvHWpnWM8VEZqnX1l4ZMza_7lhoAjfPYAGbvcqwjh94</a>&gt;<br>
&gt; <br>
&gt; $ cd freebsd-src<br>
&gt; <br>
&gt; $ make KERNCONF=3DGENERIC TARGET=3Darm TARGET_ARCH=3Darmv7 buildkernel=
<br>
&gt; <br>
&gt; $ make KERNCONF=3DGENERIC TARGET=3Darm TARGET_ARCH=3Darmv7 DESTDIR=3D/=
build-xen installkernel<br>
&gt; <br>
&gt; $ echo &quot;/dev/xbd0 / ufs rw 1 1&quot; &gt; /mnt/etc/fstab<br>
&gt; <br>
&gt; $ nano /etc/ttys (add the line &#39;xc0 &quot;/usr/libexec/getty Pc&qu=
ot; xterm on secure&quot;)<br>
&gt; <br>
&gt; $ renamed the directories dtb to dtb_ and kernel to kernel_ that are i=
nside the /boot dir of the vm<br>
&gt; <br>
&gt; $ copied the directory dtb and kernel from the directory /build-xen to=
 the directory /boot inside the vm<br>
&gt; <br>
&gt; $ shut down the vm<br>
&gt; <br>
&gt; $ copied the directory /build-xen outside of the vm using this method =
(in this case I used Linux installed on the Host OS,because the kernel that=
 I&#39;m using on the Chromebook has the kernel parameter related to the uf=
s2 fs set to off) :<br>
&gt; <br>
&gt; on my X64 workstation :<br>
&gt; <br>
&gt; # modprobe ufs<br>
&gt; <br>
&gt; # sudo losetup -fP FreeBSD-13.2-RELEASE-armv7.img<br>
&gt; <br>
&gt; # ls /dev/loop0*<br>
&gt; <br>
&gt; /dev/loop0 /dev/loop0p1 /dev/loop0p2 /dev/loop0p5<br>
&gt; <br>
&gt; # mount -t ufs -o ufstype=3Dufs2 /dev/loop0p5 ./FreeBSD-xen<br>
&gt; <br>
&gt; then :<br>
&gt; <br>
&gt; # nano freebsd.cfg<br>
&gt; <br>
&gt; kernel=3D&quot;/mnt/zroot2/zroot2/OS/Chromebook/domU/freebsd-xen/boot-=
xen/kernel/kernel&quot;<br>
&gt; memory=3D64<br>
&gt; name=3D&quot;freebsd&quot;<br>
&gt; vcpus=3D1<br>
&gt; autoballon=3D&quot;off&quot;<br>
&gt; disk=3D[ &#39;phy:/dev/loop0,xvda,w&#39; ]<br>
&gt; # nano start-freebsd<br>
&gt; losetup -fP FreeBSD-13.2-RELEASE-armv7.img<br>
&gt; xl create freebsd.cfg<br>
&gt; xl console freebsd<br>
&gt; <br>
&gt; # ./start-freebsd<br>
&gt; <br>
&gt; Parsing config from freebsd.cfg<br>
&gt; xc: error: panic: xg_dom_elfloader.c:63: xc_dom_guest_type: image not =
capable of booting inside a HV<br>
&gt; M container: Invalid kernel<br>
<br>
It is detecting the kernel as an elf binary. IIUC, Xen on arm guests should=
 have zImage kernels, not elf.<br>
<br>
&gt; libxl: error: libxl_dom.c:571:libxl__build_dom: xc_dom_parse_image fai=
led<br>
&gt; libxl: error: libxl_create.c:1640:domcreate_rebuild_done: Domain 1:can=
not (re-)build domain: -3<br>
&gt; libxl: error: libxl_domain.c:1183:libxl__destroy_domid: Domain 1:Non-e=
xistent domain<br>
&gt; libxl: error: libxl_domain.c:1137:domain_destroy_callback: Domain 1:Un=
able to destroy guest<br>
&gt; libxl: error: libxl_domain.c:1064:domain_destroy_cb: Domain 1:Destruct=
ion of domain failed<br>
&gt; freebsd is an invalid domain identifier (rc=3D-6)<br>
&gt; <br>
&gt; I have also tried with kernel.bin :<br>
&gt; <br>
&gt; # nano freebsd.cfg<br>
&gt; <br>
&gt; kernel=3D&quot;/mnt/zroot2/zroot2/OS/Chromebook/domU/freebsd-xen/boot-=
xen/kernel/kernel.bin&quot;<br>
&gt; memory=3D64<br>
&gt; name=3D&quot;freebsd&quot;<br>
&gt; vcpus=3D1<br>
&gt; autoballon=3D&quot;off&quot;<br>
&gt; disk=3D[ &#39;phy:/dev/loop0,xvda,w&#39; ]<br>
&gt; <br>
&gt; # ./start-freebsd<br>
&gt; <br>
&gt; Parsing config from freebsd.cfg<br>
&gt; xc: error: panic: xg_dom_core.c:689: xc_dom_find_loader: no loader fou=
nd: Invalid kernel<br>
&gt; libxl: error: libxl_dom.c:571:libxl__build_dom: xc_dom_parse_image fai=
led<br>
&gt; libxl: error: libxl_create.c:1640:domcreate_rebuild_done: Domain 2:can=
not (re-)build domain: -3<br>
&gt; libxl: error: libxl_domain.c:1183:libxl__destroy_domid: Domain 2:Non-e=
xistent domain<br>
&gt; libxl: error: libxl_domain.c:1137:domain_destroy_callback: Domain 2:Un=
able to destroy guest<br>
&gt; libxl: error: libxl_domain.c:1064:domain_destroy_cb: Domain 2:Destruct=
ion of domain failed<br>
&gt; freebsd is an invalid domain identifier (rc=3D-6)<br>
&gt; <br>
&gt; -- <br>
&gt; Mario.<br>
<br>
I would be interested to see the output of :<br>
<br>
$ file /mnt/zroot2/zroot2/OS/Chromebook/domU/freebsd-xen/boot-xen/kernel/ke=
rnel<br>
<br>
and<br>
<br>
$ file /mnt/zroot2/zroot2/OS/Chromebook/domU/freebsd-xen/boot-xen/kernel/ke=
rnel.bin<br>
<br>
I have been trying out Julien&#39;s old patch set from 2014, and in there w=
as this patch :<br>
<br>
&gt; arm: Add zImage support<br>
&gt; <br>
&gt; Currently Xen on ARM is only supported zImage for guest kernel. Adding=
 support<br>
&gt; for ARM ELF in the toolstack looks a bit complicate for ARM (though th=
ere is<br>
&gt; an x86 support).<br>
<br>
Link to Julien&#39;s 2014 patch to provide zImage support for FreeBSD :<br>
<br>
<a href=3D"https://xenbits.xen.org/gitweb/?p=3Dpeople/julieng/freebsd.git;a=
=3Dcommit;h=3D12a7cb346b88c6d3f52a20b98f361dc62797fbcd" rel=3D"noreferrer" =
target=3D"_blank">https://xenbits.xen.org/gitweb/?p=3Dpeople/julieng/freebs=
d.git;a=3Dcommit;h=3D12a7cb346b88c6d3f52a20b98f361dc62797fbcd</a><br>
<br>
When using Julien&#39;s patches, from &#39;file&#39; I find that the kernel=
 file is in<br>
the elf format, and the kernel.bin file is in the zImage format, so I have<=
br>
been trying to boot the kernel.bin file.<br>
</blockquote></div><br clear=3D"all"><br><span class=3D"gmail_signature_pre=
fix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature">Mario.<br></d=
iv>

--0000000000007475d4060c3fb3d7--

