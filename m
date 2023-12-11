Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C983580DC35
	for <lists+xen-devel@lfdr.de>; Mon, 11 Dec 2023 21:59:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.652528.1018423 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rCnM8-0000V0-IO; Mon, 11 Dec 2023 20:58:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 652528.1018423; Mon, 11 Dec 2023 20:58:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rCnM8-0000Su-E6; Mon, 11 Dec 2023 20:58:24 +0000
Received: by outflank-mailman (input) for mailman id 652528;
 Mon, 11 Dec 2023 20:58:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=pUvq=HW=gmail.com=marietto2008@srs-se1.protection.inumbo.net>)
 id 1rCnM6-0000Sj-BJ
 for xen-devel@lists.xenproject.org; Mon, 11 Dec 2023 20:58:22 +0000
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [2a00:1450:4864:20::329])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 01db781c-9868-11ee-9b0f-b553b5be7939;
 Mon, 11 Dec 2023 21:58:17 +0100 (CET)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-40c32df9174so41131565e9.3; 
 Mon, 11 Dec 2023 12:58:17 -0800 (PST)
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
X-Inumbo-ID: 01db781c-9868-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702328296; x=1702933096; darn=lists.xenproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=HdKbXI4KpZzT7VO/YsItHnQsOZeeu+/nhg7sv9FOd5E=;
        b=BY4GPA1twDKQjYhXzxGvfL8U63CciJHxPHYljNxu0Yl818UpX5bjrZfXvHBX/AkuF8
         Gp6sU+fyTzN446n+gZbBF7RHEP1X/baQW42e3Tg6CXrWcvH5D8SuWup5LQ8E1nGGpmHx
         pFBsmHZKkZ/JyMX9/tddiOmG6TBud+VXeAIxJNWwN2kvUnMHqVBJP9mBRi+ProaJeqcK
         hoe4O2SL286gezEzSXw5Likhni0+hKrj6BX8PdXhjldikX/eKW1z3L+DN1CRqscpToSD
         saTd1z2U2ztjnxVkGd83c7/ejckTeXPsucvsbpft7/qkvZirmVqbLiBgMfDVkyoDHR5t
         Hn/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702328296; x=1702933096;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HdKbXI4KpZzT7VO/YsItHnQsOZeeu+/nhg7sv9FOd5E=;
        b=rJyfgHyEZizzsETambzI6KIrLRnY5TxmxI+aMhrbgcvFyA9m/zWtt69UmBeV4eiaty
         qWAQjnH6387sZxgwGD/VbkcsxamFWkDoHw6DqOQ0Wxj8alEFy0kjEiz6vPut0KmuX9N9
         4WO8LZQNsdT8l0uuFO/7fCZGRqFFBOJxxbI8oHh+mr8/dLR9ToJzO7c92Xg+RUB2TlNL
         QY4xCUpOpbBFLDhlx6DrHKKpFMWlSmK3v9Dp5R8hBNW6ceXNUqbSEpSMeM7RYt0p3shF
         mzxVCRTNkdXv0jTdygfqzD5c6vZxut/hH4o8OiTtRaXgx3A6ckX4NQSF7ynDnOjn4b8S
         9iGg==
X-Gm-Message-State: AOJu0YzV7+LLuhOk8yreblG05NyNuLeRKRb/vrzIhJQI+9GzhQa6P8Pb
	oJ1tKkli/NkjTsVZjc17TcmvYpAX4q/Y9xwy0ds=
X-Google-Smtp-Source: AGHT+IFax57u2Hhmu+AfPw3LzfEXpEKs4CSDRaUJj8T3qrviAOnZlzz64njYbbmzxKAX4BjB+IzUE6v0/o/jX3sxN3Y=
X-Received: by 2002:a05:600c:c1b:b0:40b:3fc7:c88a with SMTP id
 fm27-20020a05600c0c1b00b0040b3fc7c88amr1671882wmb.39.1702328296321; Mon, 11
 Dec 2023 12:58:16 -0800 (PST)
MIME-Version: 1.0
References: <CA+1FSiii2etikw9LKdJ5Ebn+z-3-e5UXh3cJjBgYGJYtq3q=Ww@mail.gmail.com>
 <300b7e2b-068a-4cac-a617-ae41caa6d3b9@netscape.net> <CA+1FSiiuWz_91Wg3Az440nFKaLY_raoUy=3nGj4Zca8viKAT=Q@mail.gmail.com>
 <0bf311bb-435a-4c5d-a36c-8cfe95f92f98@netscape.net>
In-Reply-To: <0bf311bb-435a-4c5d-a36c-8cfe95f92f98@netscape.net>
From: Mario Marietto <marietto2008@gmail.com>
Date: Mon, 11 Dec 2023 21:57:39 +0100
Message-ID: <CA+1FSii0OcXw2QqkYmr372Dvv4MHPWHK=TduMVjJ3+f9BPuX6g@mail.gmail.com>
Subject: Re: xc_dom_guest_type: image not capable of booting inside a HV M
 container: Invalid kernel
To: Chuck Zmudzinski <brchuckz@netscape.net>
Cc: Elliott Mitchell <ehem+freebsd@m5p.com>, Julien Grall <julien@xen.org>, 
	Bertrand Marquis <bertrand.marquis@arm.com>, xen-devel <xen-devel@lists.xenproject.org>, 
	xen-users-request@lists.xenproject.org, 
	Stefano Stabellini <sstabellini@kernel.org>, 
	=?UTF-8?Q?Marek_Marczykowski=2DG=C3=B3recki?= <marmarek@invisiblethingslab.com>
Content-Type: multipart/alternative; boundary="00000000000064b8fb060c4231a2"

--00000000000064b8fb060c4231a2
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Experiment n. 2 :
Below I have applied the zImage patch of Julien to the Elliott Mitchell
code :

https://xenbits.xen.org/gitweb/?p=3Dpeople/julieng/freebsd.git;a=3Dcommit;h=
=3D12a7cb346b88c6d3f52a20b98f361dc62797fbcd

and I've used the kernel generated by the Elliott MItchell code :

root@marietto:/mnt/zroot2/zroot2/OS/Chromebook/domU/freebsd-xen #
./start-freebsd

xencall: error: Could not obtain handle on privileged command interface
/dev/xen/privcmd: No such file or directory
libxl: error: libxl.c:102:libxl_ctx_alloc: cannot open libxc handle: No
such file or directory
cannot init xl context
xencall: error: Could not obtain handle on privileged command interface
/dev/xen/privcmd: No such file or directory
libxl: error: libxl.c:102:libxl_ctx_alloc: cannot open libxc handle: No
such file or directory
cannot init xl context

Here I have used the kernel.bin :

# ./start-freebsd

xencall: error: Could not obtain handle on privileged command interface
/dev/xen/privcmd: No such file or directory
libxl: error: libxl.c:102:libxl_ctx_alloc: cannot open libxc handle: No
such file or directory
cannot init xl context
xencall: error: Could not obtain handle on privileged command interface
/dev/xen/privcmd: No such file or directory
libxl: error: libxl.c:102:libxl_ctx_alloc: cannot open libxc handle: No
such file or directory
cannot init xl context

(same error)

Anyway I think that I made some progress...


This is the freebsd.cfg file :


kernel=3D"/mnt/zroot2/zroot2/OS/Chromebook/domU/freebsd-xen/boot-xen/kernel=
.bin"

memory=3D64
name=3D"freebsd"
vcpus=3D1
autoballon=3D"off"
#disk=3D[ 'phy:/dev/loop0,xvda,w' ]
disk=3D[ 'phy:/dev/md0s2a,xvda,w' ]


And this is the start-freebsd.sh script that I've used :


mdconfig -a -t vnode -f FreeBSD-13.2-RELEASE-armv7.img -u 0
xl create freebsd.cfg
xl console freebsd






On Mon, Dec 11, 2023 at 7:41=E2=80=AFPM Chuck Zmudzinski <brchuckz@netscape=
.net>
wrote:

> On 12/11/2023 12:59 PM, Mario Marietto wrote:
> > root@marietto:/mnt/zroot2/zroot2/OS/Chromebook/domU/freebsd-xen/boot-xe=
n/kernel
> # file
> /mnt/zroot2/zroot2/OS/Chromebook/domU/freebsd-xen/boot-xen/kernel/kernel
> >
> > ELF 32-bit LSB executable,ARM, EABI5 version 1 (FreeBSD), dynamically
> linked, interpreter /red/herring,
> BuildID[sha1]=3D5e6982c9cb67d9c94571b76419142a8c495388d0, for FreeBSD 13.=
2,
> not stripped
> >
> > root@marietto:/mnt/zroot2/zroot2/OS/Chromebook/domU/freebsd-xen/boot-xe=
n/kernel
> # file
> /mnt/zroot2/zroot2/OS/Chromebook/domU/freebsd-xen/boot-xen/kernel/kernel.=
bin
> >
> > kernel.bin: data
>
> This needs to be :
>
> kernel.bin: Linux kernel ARM boot executable zImage (little-endian)
>
> >
> > It does not boot from the kernel.bin file.
>
> I suggest not trying to direct boot a kernel in Xen on arm unless the fil=
e
> command reports the kernel image is a Linux kernel ARM boot executable
> zImage (little endian).
>
> Did you try applying Julien's patch (link is in my earlier message) to ad=
d
> zImage support to FreeBSD? Maybe after applying the patch the kernel.bin
> file will be in the correct zImage format.
>
> The patch I linked in the earlier
>
> >
> >
> > On Mon, Dec 11, 2023 at 6:23=E2=80=AFPM Chuck Zmudzinski <brchuckz@nets=
cape.net
> <mailto:brchuckz@netscape.net>> wrote:
> >
> >     On 12/11/2023 9:02 AM, Mario Marietto wrote:
> >     > Hello.
> >     >
> >     > Finally I tried to recompile the FreeBSD kernel using the @Elliot=
t
> Mitchell <mailto:ehem+freebsd@m5p.com <mailto:ehem%2Bfreebsd@m5p.com>>
> code because I want to boot FreeBSD as domU with Xen installed on my Arm =
32
> bit Chromebook. Unfortunately it didn't work at all. Maybe I've missed
> something / I haven't understood well what to do. Please give me some
> suggestions.
> >     >
> >     > Basically this is what I did :
> >     >
> >     > $ created a vm called FreeBSD-13.2-RELEASE-armv7.img with qemu /
> kvm / libvirt / virt-manager
> >     >
> >     > $ within the vm : mkdir /build-xen
> >     >
> >     > $ cd /usr
> >     >
> >     > $ git clone https://gitlab.com/ehem/freebsd-src.git
> >     >
> >     > $ cd freebsd-src
> >     >
> >     > $ make KERNCONF=3DGENERIC TARGET=3Darm TARGET_ARCH=3Darmv7 buildk=
ernel
> >     >
> >     > $ make KERNCONF=3DGENERIC TARGET=3Darm TARGET_ARCH=3Darmv7
> DESTDIR=3D/build-xen installkernel
> >     >
> >     > $ echo "/dev/xbd0 / ufs rw 1 1" > /mnt/etc/fstab
> >     >
> >     > $ nano /etc/ttys (add the line 'xc0 "/usr/libexec/getty Pc" xterm
> on secure")
> >     >
> >     > $ renamed the directories dtb to dtb_ and kernel to kernel_ that
> are inside the /boot dir of the vm
> >     >
> >     > $ copied the directory dtb and kernel from the directory
> /build-xen to the directory /boot inside the vm
> >     >
> >     > $ shut down the vm
> >     >
> >     > $ copied the directory /build-xen outside of the vm using this
> method (in this case I used Linux installed on the Host OS,because the
> kernel that I'm using on the Chromebook has the kernel parameter related =
to
> the ufs2 fs set to off) :
> >     >
> >     > on my X64 workstation :
> >     >
> >     > # modprobe ufs
> >     >
> >     > # sudo losetup -fP FreeBSD-13.2-RELEASE-armv7.img
> >     >
> >     > # ls /dev/loop0*
> >     >
> >     > /dev/loop0 /dev/loop0p1 /dev/loop0p2 /dev/loop0p5
> >     >
> >     > # mount -t ufs -o ufstype=3Dufs2 /dev/loop0p5 ./FreeBSD-xen
> >     >
> >     > then :
> >     >
> >     > # nano freebsd.cfg
> >     >
> >     >
> kernel=3D"/mnt/zroot2/zroot2/OS/Chromebook/domU/freebsd-xen/boot-xen/kern=
el/kernel"
> >     > memory=3D64
> >     > name=3D"freebsd"
> >     > vcpus=3D1
> >     > autoballon=3D"off"
> >     > disk=3D[ 'phy:/dev/loop0,xvda,w' ]
> >     > # nano start-freebsd
> >     > losetup -fP FreeBSD-13.2-RELEASE-armv7.img
> >     > xl create freebsd.cfg
> >     > xl console freebsd
> >     >
> >     > # ./start-freebsd
> >     >
> >     > Parsing config from freebsd.cfg
> >     > xc: error: panic: xg_dom_elfloader.c:63: xc_dom_guest_type: image
> not capable of booting inside a HV
> >     > M container: Invalid kernel
> >
> >     It is detecting the kernel as an elf binary. IIUC, Xen on arm guest=
s
> should have zImage kernels, not elf.
> >
> >     > libxl: error: libxl_dom.c:571:libxl__build_dom: xc_dom_parse_imag=
e
> failed
> >     > libxl: error: libxl_create.c:1640:domcreate_rebuild_done: Domain
> 1:cannot (re-)build domain: -3
> >     > libxl: error: libxl_domain.c:1183:libxl__destroy_domid: Domain
> 1:Non-existent domain
> >     > libxl: error: libxl_domain.c:1137:domain_destroy_callback: Domain
> 1:Unable to destroy guest
> >     > libxl: error: libxl_domain.c:1064:domain_destroy_cb: Domain
> 1:Destruction of domain failed
> >     > freebsd is an invalid domain identifier (rc=3D-6)
> >     >
> >     > I have also tried with kernel.bin :
> >     >
> >     > # nano freebsd.cfg
> >     >
> >     >
> kernel=3D"/mnt/zroot2/zroot2/OS/Chromebook/domU/freebsd-xen/boot-xen/kern=
el/kernel.bin"
> >     > memory=3D64
> >     > name=3D"freebsd"
> >     > vcpus=3D1
> >     > autoballon=3D"off"
> >     > disk=3D[ 'phy:/dev/loop0,xvda,w' ]
> >     >
> >     > # ./start-freebsd
> >     >
> >     > Parsing config from freebsd.cfg
> >     > xc: error: panic: xg_dom_core.c:689: xc_dom_find_loader: no loade=
r
> found: Invalid kernel
> >     > libxl: error: libxl_dom.c:571:libxl__build_dom: xc_dom_parse_imag=
e
> failed
> >     > libxl: error: libxl_create.c:1640:domcreate_rebuild_done: Domain
> 2:cannot (re-)build domain: -3
> >     > libxl: error: libxl_domain.c:1183:libxl__destroy_domid: Domain
> 2:Non-existent domain
> >     > libxl: error: libxl_domain.c:1137:domain_destroy_callback: Domain
> 2:Unable to destroy guest
> >     > libxl: error: libxl_domain.c:1064:domain_destroy_cb: Domain
> 2:Destruction of domain failed
> >     > freebsd is an invalid domain identifier (rc=3D-6)
> >     >
> >     > --
> >     > Mario.
> >
> >     I would be interested to see the output of :
> >
> >     $ file
> /mnt/zroot2/zroot2/OS/Chromebook/domU/freebsd-xen/boot-xen/kernel/kernel
> >
> >     and
> >
> >     $ file
> /mnt/zroot2/zroot2/OS/Chromebook/domU/freebsd-xen/boot-xen/kernel/kernel.=
bin
> >
> >     I have been trying out Julien's old patch set from 2014, and in
> there was this patch :
> >
> >     > arm: Add zImage support
> >     >
> >     > Currently Xen on ARM is only supported zImage for guest kernel.
> Adding support
> >     > for ARM ELF in the toolstack looks a bit complicate for ARM
> (though there is
> >     > an x86 support).
> >
> >     Link to Julien's 2014 patch to provide zImage support for FreeBSD :
> >
> >
> https://xenbits.xen.org/gitweb/?p=3Dpeople/julieng/freebsd.git;a=3Dcommit=
;h=3D12a7cb346b88c6d3f52a20b98f361dc62797fbcd
> <
> https://xenbits.xen.org/gitweb/?p=3Dpeople/julieng/freebsd.git;a=3Dcommit=
;h=3D12a7cb346b88c6d3f52a20b98f361dc62797fbcd
> >
> >
> >     When using Julien's patches, from 'file' I find that the kernel fil=
e
> is in
> >     the elf format, and the kernel.bin file is in the zImage format, so
> I have
> >     been trying to boot the kernel.bin file.
> >
> >
> >
> > --
> > Mario.
>
>

--=20
Mario.

--00000000000064b8fb060c4231a2
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><font size=3D"6"><span style=3D"font-family:monospace=
"><span style=3D"color:rgb(0,0,0);background-color:rgb(255,255,255)">Experi=
ment n. 2 : <br></span></span></font></div><div><font size=3D"6"><span styl=
e=3D"font-family:monospace"><span style=3D"color:rgb(0,0,0);background-colo=
r:rgb(255,255,255)">Below I have applied the zImage patch of Julien to the =
Elliott Mitchell code :</span></span></font></div><div><font size=3D"6"><sp=
an style=3D"font-family:monospace"><span style=3D"color:rgb(0,0,0);backgrou=
nd-color:rgb(255,255,255)"><br></span></span></font></div><div><a href=3D"h=
ttps://xenbits.xen.org/gitweb/?p=3Dpeople/julieng/freebsd.git;a=3Dcommit;h=
=3D12a7cb346b88c6d3f52a20b98f361dc62797fbcd">https://xenbits.xen.org/gitweb=
/?p=3Dpeople/julieng/freebsd.git;a=3Dcommit;h=3D12a7cb346b88c6d3f52a20b98f3=
61dc62797fbcd</a></div><div><font size=3D"6"><span style=3D"font-family:mon=
ospace"><span style=3D"color:rgb(0,0,0);background-color:rgb(255,255,255)">=
</span></span></font></div><div><font size=3D"6"><span style=3D"font-family=
:monospace"><span style=3D"color:rgb(0,0,0);background-color:rgb(255,255,25=
5)"><br></span></span></font></div><div><font size=3D"6"><span style=3D"fon=
t-family:monospace"><span style=3D"color:rgb(0,0,0);background-color:rgb(25=
5,255,255)">and I&#39;ve used the kernel generated by the Elliott MItchell =
code :</span></span></font></div><div><font size=3D"6"><span style=3D"font-=
family:monospace"><span style=3D"color:rgb(0,0,0);background-color:rgb(255,=
255,255)"></span></span></font></div><div><font size=3D"6"><span style=3D"f=
ont-family:monospace"><span style=3D"color:rgb(0,0,0);background-color:rgb(=
255,255,255)"></span></span></font></div><div><font size=3D"6"><span style=
=3D"font-family:monospace"><span style=3D"color:rgb(0,0,0);background-color=
:rgb(255,255,255)"><br></span></span></font></div><div><font size=3D"6"><sp=
an style=3D"font-family:monospace"><span style=3D"color:rgb(0,0,0);backgrou=
nd-color:rgb(255,255,255)">root@marietto:/mnt/zroot2/zroot2/OS/Chromebook/d=
omU/freebsd-xen # ./start-freebsd
</span></span></font></div><div><font size=3D"6"><span style=3D"font-family=
:monospace"></span></font></div><div><font size=3D"6"><span style=3D"font-f=
amily:monospace"></span></font></div><div><br></div><div><font size=3D"6"><=
span style=3D"font-family:monospace">xencall: error: Could not obtain handl=
e on privileged command interface /dev/xen/privcmd: No such fi</span><span =
style=3D"font-family:monospace">le or directory
</span></font></div><div><span style=3D"font-family:monospace"><font size=
=3D"6">libxl: error: libxl.c:102:libxl_ctx_alloc: cannot open libxc handle:=
 No such file or directory=C2=A0</font></span></div><div><span style=3D"fon=
t-family:monospace"><font size=3D"6">cannot init xl context
</font></span></div><div><span style=3D"font-family:monospace"></span></div=
><span style=3D"font-family:monospace"><font size=3D"6">xencall: error: Cou=
ld not obtain handle on privileged command interface /dev/xen/privcmd: No s=
uch file or directory
<br></font></span><div><span style=3D"font-family:monospace"><font size=3D"=
6">libxl: error: libxl.c:102:libxl_ctx_alloc: cannot open libxc handle: No =
such file or directory
<br></font></span></div><div><span style=3D"font-family:monospace"><font si=
ze=3D"6">cannot init xl context</font></span></div><div><span style=3D"font=
-family:monospace"><font size=3D"6"><br></font></span></div><div><span styl=
e=3D"font-family:monospace"><font size=3D"6">Here I have used the kernel.bi=
n :</font></span></div><div><font size=3D"6"><span style=3D"font-family:mon=
ospace"><br></span></font></div><div><span style=3D"font-family:monospace">=
<font size=3D"6"><span style=3D"color:rgb(0,0,0);background-color:rgb(255,2=
55,255)"># ./start-freebsd</span></font></span></div><div><span style=3D"fo=
nt-family:monospace"><font size=3D"6"><span style=3D"color:rgb(0,0,0);backg=
round-color:rgb(255,255,255)">=C2=A0</span><br>xencall: error: Could not ob=
tain handle on privileged command interface /dev/xen/privcmd: No such file =
or directory
<br>libxl: error: libxl.c:102:libxl_ctx_alloc: cannot open libxc handle: No=
 such file or directory
<br>cannot init xl context
<br>xencall: error: Could not obtain handle on privileged command interface=
 /dev/xen/privcmd: No such file or directory
<br>libxl: error: libxl.c:102:libxl_ctx_alloc: cannot open libxc handle: No=
 such file or directory
<br>cannot init xl context=C2=A0</font></span></div><div><span style=3D"fon=
t-family:monospace"><font size=3D"6"><br></font></span></div><div><span sty=
le=3D"font-family:monospace"><font size=3D"6">(same error)=C2=A0</font></sp=
an></div><div><span style=3D"font-family:monospace"><font size=3D"6"><br></=
font></span></div><div><span style=3D"font-family:monospace"><font size=3D"=
6">Anyway I think that I made some progress...</font></span></div><div><spa=
n style=3D"font-family:monospace"><font size=3D"6"><br></font></span></div>=
<div><span style=3D"font-family:monospace"><font size=3D"6"><br></font></sp=
an></div><div><span style=3D"font-family:monospace"><font size=3D"6">This i=
s the freebsd.cfg file :<br></font></span></div><div><span style=3D"font-fa=
mily:monospace"><font size=3D"6"><br></font></span></div><div><span style=
=3D"font-family:monospace"><font size=3D"6"><br></font></span></div><div><s=
pan style=3D"font-family:monospace"><font size=3D"6"><span style=3D"color:r=
gb(0,0,0);background-color:rgb(255,255,255)">kernel=3D&quot;/mnt/zroot2/zro=
ot2/OS/Chromebook/domU/freebsd-xen/boot-xen/kernel.bin&quot;
</span><br>memory=3D64
<br>name=3D&quot;freebsd&quot;
<br>vcpus=3D1
<br>autoballon=3D&quot;off&quot;
<br>#disk=3D[ &#39;phy:/dev/loop0,xvda,w&#39; ]
<br>disk=3D[ &#39;phy:/dev/md0s2a,xvda,w&#39; ]</font></span></div><div><sp=
an style=3D"font-family:monospace"><font size=3D"6"><br></font></span></div=
><div><span style=3D"font-family:monospace"><font size=3D"6"><br></font></s=
pan></div><div><span style=3D"font-family:monospace"><font size=3D"6">And t=
his is the start-freebsd.sh script that I&#39;ve used :</font></span></div>=
<div><br></div><div><br><span style=3D"font-family:monospace"></span></div>=
<div><span style=3D"font-family:monospace"><font size=3D"6">mdconfig -a -t =
vnode -f FreeBSD-13.2-RELEASE-armv7.img -u 0
<br>xl create freebsd.cfg
<br>xl console freebsd</font><br>
<br></span><span style=3D"font-family:monospace"> <br><br></span></div><div=
><span style=3D"font-family:monospace"></span></div><span style=3D"font-fam=
ily:monospace">
<br><br></span></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Mon, Dec 11, 2023 at 7:41=E2=80=AFPM Chuck Zmudzinski &l=
t;<a href=3D"mailto:brchuckz@netscape.net">brchuckz@netscape.net</a>&gt; wr=
ote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px=
 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On 12/11/20=
23 12:59 PM, Mario Marietto wrote:<br>
&gt; root@marietto:/mnt/zroot2/zroot2/OS/Chromebook/domU/freebsd-xen/boot-x=
en/kernel # file /mnt/zroot2/zroot2/OS/Chromebook/domU/freebsd-xen/boot-xen=
/kernel/kernel<br>
&gt; <br>
&gt; ELF 32-bit LSB executable,ARM, EABI5 version 1 (FreeBSD), dynamically =
linked, interpreter /red/herring, BuildID[sha1]=3D5e6982c9cb67d9c94571b7641=
9142a8c495388d0, for FreeBSD 13.2, not stripped<br>
&gt; <br>
&gt; root@marietto:/mnt/zroot2/zroot2/OS/Chromebook/domU/freebsd-xen/boot-x=
en/kernel # file /mnt/zroot2/zroot2/OS/Chromebook/domU/freebsd-xen/boot-xen=
/kernel/kernel.bin<br>
&gt; <br>
&gt; kernel.bin: data=C2=A0<br>
<br>
This needs to be :<br>
<br>
kernel.bin: Linux kernel ARM boot executable zImage (little-endian)<br>
<br>
&gt; <br>
&gt; It does not boot from the kernel.bin file.<br>
<br>
I suggest not trying to direct boot a kernel in Xen on arm unless the file =
command reports the kernel image is a Linux kernel ARM boot executable zIma=
ge (little endian).<br>
<br>
Did you try applying Julien&#39;s patch (link is in my earlier message) to =
add zImage support to FreeBSD? Maybe after applying the patch the kernel.bi=
n file will be in the correct zImage format.<br>
<br>
The patch I linked in the earlier <br>
<br>
&gt; <br>
&gt; <br>
&gt; On Mon, Dec 11, 2023 at 6:23=E2=80=AFPM Chuck Zmudzinski &lt;<a href=
=3D"mailto:brchuckz@netscape.net" target=3D"_blank">brchuckz@netscape.net</=
a> &lt;mailto:<a href=3D"mailto:brchuckz@netscape.net" target=3D"_blank">br=
chuckz@netscape.net</a>&gt;&gt; wrote:<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0On 12/11/2023 9:02 AM, Mario Marietto wrote:<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; Hello.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; Finally I tried to recompile the FreeBSD kerne=
l using the @Elliott Mitchell &lt;mailto:<a href=3D"mailto:ehem%2Bfreebsd@m=
5p.com" target=3D"_blank">ehem+freebsd@m5p.com</a> &lt;mailto:<a href=3D"ma=
ilto:ehem%252Bfreebsd@m5p.com" target=3D"_blank">ehem%2Bfreebsd@m5p.com</a>=
&gt;&gt; code because I want to boot FreeBSD as domU with Xen installed on =
my Arm 32 bit Chromebook. Unfortunately it didn&#39;t work at all. Maybe I&=
#39;ve missed something / I haven&#39;t understood well what to do. Please =
give me some suggestions.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; Basically this is what I did :<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; $ created a vm called FreeBSD-13.2-RELEASE-arm=
v7.img with qemu / kvm / libvirt / virt-manager<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; $ within the vm : mkdir /build-xen<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; $ cd /usr<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; $ git clone <a href=3D"https://gitlab.com/ehem=
/freebsd-src.git" rel=3D"noreferrer" target=3D"_blank">https://gitlab.com/e=
hem/freebsd-src.git</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; $ cd freebsd-src<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; $ make KERNCONF=3DGENERIC TARGET=3Darm TARGET_=
ARCH=3Darmv7 buildkernel<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; $ make KERNCONF=3DGENERIC TARGET=3Darm TARGET_=
ARCH=3Darmv7 DESTDIR=3D/build-xen installkernel<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; $ echo &quot;/dev/xbd0 / ufs rw 1 1&quot; &gt;=
 /mnt/etc/fstab<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; $ nano /etc/ttys (add the line &#39;xc0 &quot;=
/usr/libexec/getty Pc&quot; xterm on secure&quot;)<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; $ renamed the directories dtb to dtb_ and kern=
el to kernel_ that are inside the /boot dir of the vm<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; $ copied the directory dtb and kernel from the=
 directory /build-xen to the directory /boot inside the vm<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; $ shut down the vm<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; $ copied the directory /build-xen outside of t=
he vm using this method (in this case I used Linux installed on the Host OS=
,because the kernel that I&#39;m using on the Chromebook has the kernel par=
ameter related to the ufs2 fs set to off) :<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; on my X64 workstation :<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; # modprobe ufs<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; # sudo losetup -fP FreeBSD-13.2-RELEASE-armv7.=
img<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; # ls /dev/loop0*<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; /dev/loop0 /dev/loop0p1 /dev/loop0p2 /dev/loop=
0p5<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; # mount -t ufs -o ufstype=3Dufs2 /dev/loop0p5 =
./FreeBSD-xen<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; then :<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; # nano freebsd.cfg<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; kernel=3D&quot;/mnt/zroot2/zroot2/OS/Chromeboo=
k/domU/freebsd-xen/boot-xen/kernel/kernel&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; memory=3D64<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; name=3D&quot;freebsd&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; vcpus=3D1<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; autoballon=3D&quot;off&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; disk=3D[ &#39;phy:/dev/loop0,xvda,w&#39; ]<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; # nano start-freebsd<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; losetup -fP FreeBSD-13.2-RELEASE-armv7.img<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; xl create freebsd.cfg<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; xl console freebsd<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; # ./start-freebsd<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; Parsing config from freebsd.cfg<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; xc: error: panic: xg_dom_elfloader.c:63: xc_do=
m_guest_type: image not capable of booting inside a HV<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; M container: Invalid kernel<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0It is detecting the kernel as an elf binary. IIUC, =
Xen on arm guests should have zImage kernels, not elf.<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; libxl: error: libxl_dom.c:571:libxl__build_dom=
: xc_dom_parse_image failed<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; libxl: error: libxl_create.c:1640:domcreate_re=
build_done: Domain 1:cannot (re-)build domain: -3<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; libxl: error: libxl_domain.c:1183:libxl__destr=
oy_domid: Domain 1:Non-existent domain<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; libxl: error: libxl_domain.c:1137:domain_destr=
oy_callback: Domain 1:Unable to destroy guest<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; libxl: error: libxl_domain.c:1064:domain_destr=
oy_cb: Domain 1:Destruction of domain failed<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; freebsd is an invalid domain identifier (rc=3D=
-6)<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; I have also tried with kernel.bin :<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; # nano freebsd.cfg<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; kernel=3D&quot;/mnt/zroot2/zroot2/OS/Chromeboo=
k/domU/freebsd-xen/boot-xen/kernel/kernel.bin&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; memory=3D64<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; name=3D&quot;freebsd&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; vcpus=3D1<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; autoballon=3D&quot;off&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; disk=3D[ &#39;phy:/dev/loop0,xvda,w&#39; ]<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; # ./start-freebsd<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; Parsing config from freebsd.cfg<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; xc: error: panic: xg_dom_core.c:689: xc_dom_fi=
nd_loader: no loader found: Invalid kernel<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; libxl: error: libxl_dom.c:571:libxl__build_dom=
: xc_dom_parse_image failed<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; libxl: error: libxl_create.c:1640:domcreate_re=
build_done: Domain 2:cannot (re-)build domain: -3<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; libxl: error: libxl_domain.c:1183:libxl__destr=
oy_domid: Domain 2:Non-existent domain<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; libxl: error: libxl_domain.c:1137:domain_destr=
oy_callback: Domain 2:Unable to destroy guest<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; libxl: error: libxl_domain.c:1064:domain_destr=
oy_cb: Domain 2:Destruction of domain failed<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; freebsd is an invalid domain identifier (rc=3D=
-6)<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; --<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; Mario.<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0I would be interested to see the output of :<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0$ file /mnt/zroot2/zroot2/OS/Chromebook/domU/freebs=
d-xen/boot-xen/kernel/kernel<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0and<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0$ file /mnt/zroot2/zroot2/OS/Chromebook/domU/freebs=
d-xen/boot-xen/kernel/kernel.bin<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0I have been trying out Julien&#39;s old patch set f=
rom 2014, and in there was this patch :<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; arm: Add zImage support<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; Currently Xen on ARM is only supported zImage =
for guest kernel. Adding support<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; for ARM ELF in the toolstack looks a bit compl=
icate for ARM (though there is<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; an x86 support).<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0Link to Julien&#39;s 2014 patch to provide zImage s=
upport for FreeBSD :<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0<a href=3D"https://xenbits.xen.org/gitweb/?p=3Dpeop=
le/julieng/freebsd.git;a=3Dcommit;h=3D12a7cb346b88c6d3f52a20b98f361dc62797f=
bcd" rel=3D"noreferrer" target=3D"_blank">https://xenbits.xen.org/gitweb/?p=
=3Dpeople/julieng/freebsd.git;a=3Dcommit;h=3D12a7cb346b88c6d3f52a20b98f361d=
c62797fbcd</a> &lt;<a href=3D"https://xenbits.xen.org/gitweb/?p=3Dpeople/ju=
lieng/freebsd.git;a=3Dcommit;h=3D12a7cb346b88c6d3f52a20b98f361dc62797fbcd" =
rel=3D"noreferrer" target=3D"_blank">https://xenbits.xen.org/gitweb/?p=3Dpe=
ople/julieng/freebsd.git;a=3Dcommit;h=3D12a7cb346b88c6d3f52a20b98f361dc6279=
7fbcd</a>&gt;<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0When using Julien&#39;s patches, from &#39;file&#39=
; I find that the kernel file is in<br>
&gt;=C2=A0 =C2=A0 =C2=A0the elf format, and the kernel.bin file is in the z=
Image format, so I have<br>
&gt;=C2=A0 =C2=A0 =C2=A0been trying to boot the kernel.bin file.<br>
&gt; <br>
&gt; <br>
&gt; <br>
&gt; -- <br>
&gt; Mario.<br>
<br>
</blockquote></div><br clear=3D"all"><br><span class=3D"gmail_signature_pre=
fix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature">Mario.<br></d=
iv>

--00000000000064b8fb060c4231a2--

