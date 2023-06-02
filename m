Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E16E71FDF7
	for <lists+xen-devel@lfdr.de>; Fri,  2 Jun 2023 11:35:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.543048.847630 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q51B9-0007sx-FZ; Fri, 02 Jun 2023 09:34:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 543048.847630; Fri, 02 Jun 2023 09:34:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q51B9-0007rA-Ck; Fri, 02 Jun 2023 09:34:39 +0000
Received: by outflank-mailman (input) for mailman id 543048;
 Fri, 02 Jun 2023 09:34:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gGRp=BW=gmail.com=christopher.w.clark@srs-se1.protection.inumbo.net>)
 id 1q51B7-0007r4-S8
 for xen-devel@lists.xenproject.org; Fri, 02 Jun 2023 09:34:38 +0000
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [2a00:1450:4864:20::52a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id afd03a63-0128-11ee-8611-37d641c3527e;
 Fri, 02 Jun 2023 11:34:35 +0200 (CEST)
Received: by mail-ed1-x52a.google.com with SMTP id
 4fb4d7f45d1cf-5149e65c244so2546890a12.3
 for <xen-devel@lists.xenproject.org>; Fri, 02 Jun 2023 02:34:35 -0700 (PDT)
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
X-Inumbo-ID: afd03a63-0128-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685698475; x=1688290475;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=0gV8tKQqPdP+WC2L0WNNsKygS57kJCpwieLJcSKpWqc=;
        b=K7iVbPrjPEob+MMl66vaUsIa9vnkG3HvwnLoeO6SvHXbA4lslLmQlzZTzxam7wOJy6
         y9a8DExWxZvSYgLlPzpC7LfMaT86V/VtkgPbiaRCK0Pu2UrC47Kml6OqaXikrUOU88Sy
         Hz82pvgHJhBew2Dmag6E+/cp9hCjEPAqxAO9DbER7XSJ1a/AmFXQUeGWiD7YqVgBKW4Z
         gcxeC3te1lxwrAlYQo9G1pfF+sfiNQeVDxi1sDVNxrHD4DHsdAurk87XJTTdXUFZ0F0z
         EIV2BX9AU+vYd5LVIislXcRYZCtQ0yqPNpykvSMsCUg2Hp8gXNO/negYa+e6mURvmUt4
         JyHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685698475; x=1688290475;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0gV8tKQqPdP+WC2L0WNNsKygS57kJCpwieLJcSKpWqc=;
        b=R+nEmlx72NixSf/SvaYdWNxIunTsdtaOiKEsyg9SXeJdtGVxfoChpvDt36O9kzaQfx
         3lmT7EnxCzYSUVrzhxm4oOmC2t0iv2CggCHIOmBwEOFtFvNS5wlt4brgcd+1cxWJ7jsP
         JfglJHKo7FEqGnxMlB678SoCNTngKLWYcA9pk4gtW7uFShUteoz8kkG8IWI28SGxQnQc
         mX3wBy0ZDHtKgLsFeq5I/ePVyH3Jti+N0sVLEbDAH7o4ISvu5z51YdromrXaJwwBlgb8
         pebthNf5bXvnseI5quyybbw3J1tALzUR47tYlqWc5AwvtVcdbTnuPveSoBjNx1b9qVt/
         2DTw==
X-Gm-Message-State: AC+VfDwGeejHdYmsEBVdCRvjEqIfshg6dXvrmTNzro/201IYLexlyZ7v
	dPAH9KMK2zeOMK5lWkSt8LRN1uQraUf4Itwm/bQ=
X-Google-Smtp-Source: ACHHUZ7cgKDjVMBTOz7GarhegDsrOIY5B/U84MCTp3A9uZBSdH1c8n3BGobq9QmNTmp/vpCGKx3AKMwoV9xEcbAB/IQ=
X-Received: by 2002:aa7:da08:0:b0:514:b1d6:d379 with SMTP id
 r8-20020aa7da08000000b00514b1d6d379mr1635151eds.30.1685698474662; Fri, 02 Jun
 2023 02:34:34 -0700 (PDT)
MIME-Version: 1.0
References: <baa9627c-51d3-1ef0-e125-f7803d72179c@amd.com>
In-Reply-To: <baa9627c-51d3-1ef0-e125-f7803d72179c@amd.com>
From: Christopher Clark <christopher.w.clark@gmail.com>
Date: Fri, 2 Jun 2023 02:34:22 -0700
Message-ID: <CACMJ4GYxTPpEgKksQwhi0F6R=PRKmGruf61B8OT-UuzfNxgvMw@mail.gmail.com>
Subject: Re: Listing the tools required for Xen development/testing on x86 and
 Arm by the community
To: Ayan Kumar Halder <ayankuma@amd.com>
Cc: "jbeulich@suse.com" <jbeulich@suse.com>, andrew.cooper3@citrix.com, 
	nathan.studer@dornerworks.com, Stewart Hildebrand <stewart@stew.dk>, 
	Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
	Bertrand Marquis <Bertrand.Marquis@arm.com>, 
	"Volodymyr_Babchuk@epam.com" <Volodymyr_Babchuk@epam.com>, Rahul Singh <rahul.singh@arm.com>, 
	Henry Wang <Henry.Wang@arm.com>, Doug Goldstein <cardoe@cardoe.com>, Juergen Gross <jgross@suse.com>, 
	dfaggioli@suse.com, elena.ufimtseva@oracle.com, anthony.perard@citrix.com, 
	george.dunlap@citrix.com, rosbrookn@gmail.com, lukasz@hawrylko.pl, 
	dpsmith@apertussolutions.com, mateusz.mowka@intel.com, kevin.tian@intel.com, 
	jun.nakajima@intel.com, paul@xen.org, 
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Wei Liu <wl@xen.org>, 
	konrad.wilk@oracle.com, ross.lagerwall@citrix.com, 
	samuel.thibault@ens-lyon.org, christian.lindig@citrix.com, 
	mengxu@cis.upenn.edu, tamas@tklengyel.com, aisaila@bitdefender.com, 
	ppircalabu@bitdefender.com, 
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Michal Orzel <michal.orzel@amd.com>, 
	"Stabellini, Stefano" <stefano.stabellini@amd.com>, "Garhwal, Vikram" <vikram.garhwal@amd.com>, 
	Xenia.Ragiadakou@amd.com, Stewart Hildebrand <stewart.hildebrand@amd.com>
Content-Type: multipart/alternative; boundary="000000000000c7ddb305fd224274"

--000000000000c7ddb305fd224274
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 2, 2023 at 1:49=E2=80=AFAM Ayan Kumar Halder <ayankuma@amd.com>=
 wrote:

> Hi Xen developers,
>
> We are trying to better document xen project development processes and
> related tools. At present, we are targeting **x86 and Arm** only.
>
> These tools range from bug/change request tracking means, compilers,
> infra, editors, code-review tools, etc which is connected in some way to
> the Xen development and is being currently used by xen-devel community.
>
> I appreciate if you can let me know anything I missed or mistaken and
> the version currently being used (for some of the tools).
>


The Xen git tree contains a README file with some of the information that
you are looking for. This link is to that file for the 4.17 release:
https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dblob;f=3DREADME;h=3Da947e8f=
3e35b78e2d5c935caa4c7ea71897f0f3c;hb=3D11560248ffda3f00f20bbdf3ae088af474f7=
f2a3

The README specifies specific minimum compiler versions for that Xen
release.


>
>
> 1. Code management portal - xenbits (https://xenbits.xenproject.org),
> gitlab (https://gitlab.com/xen-project/xen)
>

Also: patchew: https://patchew.org/Xen/


>
> 2. Project description - wiki.xenproject.org
>
> 3. Project management - gitlab
>
> 4. Code review - text based email clients (mutt, thunderbird), git-email,
> b4
>
> 5. Text Editors such as vim, emacs
>
> 6. Code review history - xen-devel mail archives
>
> 7. Code revision management - git
>
> 8. Xen coding language - C89, C99, Kconfig
>

The Xen community also has tools written in Python, OCaml, Go, and Rust.


>
> 9. Testing tools for Arm64 in gitlab CI
>
> compiler - gcc-9.3.0 (Alpine 3.12)) (most commonly used version)
>
> binutils - GNU Binutils for Debian) 2.38.9
>
> emulator/hw - qemu-system-aarch64-6.0.0, qemuarm64 6.2.0 (From yocto,
> poky disto - 4.0.5), zcu102 (**need the uboot, TF-A versions **)
>
> dom0/domU kernel - kernel-5.19.0
>
> rootfs - alpine-3.12-arm64-rootfs
>
> firmware - U-Boot 2022.10
>
> 10. Testing tools for Arm in gitlab CI
>
> compiler - arm-poky-linux-gnueabi-gcc (GCC) 11.3.0,
> arm-linux-gnueabihf-gcc (Debian 12.2.0-14) 12.2.0 (most commonly used
> versions)
>
> emulator/hw - qemu-system-arm 6.2.0 (From yocto, poky disto - 4.0.5)
>
> dom0/domU kernel - kernel-5.15.72 (from Yocto), Kernel-5.10.0-22 (from
> Debian)
>
> rootfs - alpine-minirootfs-3.15.1-armhf.tar.gz
>
> firmware - U-Boot 2022.10
>
> 11. Testing tools for x86
>
> compiler - gcc-9.3.0 (Alpine Linux 9.3.0), gcc (Debian 12.2.0-14)
> 12.2.0, clang (from Debian) (most commonly used version)
>
> binutils - GNU ld (GNU Binutils for Debian) 2.40)
>
> emulator/hardware - Qubes HW (**need details regarding machine,
> firmware, etc**) , qemu 6.2.0 (From yocto, poky distro - 4.0.5)
>
> dom0/domU kernel - kernel 6.1.19
>
> rootfs - alpine-3.12-rootfs
>
> firmware - BIOS Dasharo (coreboot+UEFI) v1.1.1 02/22/2023 , EFI v2.70 by
> EDK II , SMBIOS 3.3.0 , SeaBIOS (version rel-1.16.2-0-gea1b7a0-Xen),
> GRUB 2.06~rc1
>
> 12. Debugger - gdb
>

 There is a tools/debugger directory in the Xen git tree that contains:
 gdbsx, a gdb server for Xen, and kdd, a tool for debugging Xen with the
windows kernel debugger.


> 13. Xen code building infra - make
>
> 14. Testing OS - CentOS 7, Ubuntu, OpenSuse, Arch Linux, Alpine 3.12.12,
> Debian 10 (Buster), Fedora
>
> ( **I could not get the version info for some of these ^^^**)
>

Yocto and OpenEmbedded releases contain support for building Xen guest OS
images suitable for testing.

Devuan, FreeBSD and OpenBSD.


>
> 15. Testing Infra - Gitlab runner, Docker
>
> 16. Testing tools common to all architectures - All the host OS packages
>
> dtc, build-essential, zlib1g-dev, libncurses5-dev, libssl-dev,
> python-dev, python3-dev, xorg-dev, uuid-dev, libyajl-dev, libaio-dev,
> libglib2.0-dev, libpixman-1-dev, pkg-config, flex, bison, gettext,
> acpica-tools, bin86, bcc, liblzma-dev, libc6-dev-i386, libnl-3-dev,
> ocaml-nox, libfindlib-ocaml-dev, markdown, transfig, pandoc,
> checkpolicy, wget, nasm, mkimage, uboot-tools
>
> 17. Documentation related tools - doxygen, rst.
>

Possibly: Sphinx


>
>
> Did I miss anything ?
>

I think you have a good start!

best,
Christopher



>
> Kind regards,
>
> Ayan
>
>
>
>
>

--000000000000c7ddb305fd224274
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Fri, Jun 2, 2023 at 1:49=E2=80=AFA=
M Ayan Kumar Halder &lt;<a href=3D"mailto:ayankuma@amd.com">ayankuma@amd.co=
m</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin=
:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"=
>Hi Xen developers,<br>
<br>
We are trying to better document xen project development processes and <br>
related tools. At present, we are targeting **x86 and Arm** only.<br>
<br>
These tools range from bug/change request tracking means, compilers, <br>
infra, editors, code-review tools, etc which is connected in some way to <b=
r>
the Xen development and is being currently used by xen-devel community.<br>
<br>
I appreciate if you can let me know anything I missed or mistaken and <br>
the version currently being used (for some of the tools).<br></blockquote><=
div><br></div><div><br></div><div>The Xen git tree contains=C2=A0a README f=
ile with some of the information that you are looking for. This link is to =
that file for the=C2=A04.17 release:</div><div><a href=3D"https://xenbits.x=
en.org/gitweb/?p=3Dxen.git;a=3Dblob;f=3DREADME;h=3Da947e8f3e35b78e2d5c935ca=
a4c7ea71897f0f3c;hb=3D11560248ffda3f00f20bbdf3ae088af474f7f2a3">https://xen=
bits.xen.org/gitweb/?p=3Dxen.git;a=3Dblob;f=3DREADME;h=3Da947e8f3e35b78e2d5=
c935caa4c7ea71897f0f3c;hb=3D11560248ffda3f00f20bbdf3ae088af474f7f2a3</a></d=
iv><div><br></div><div>The README specifies specific minimum compiler versi=
ons for that Xen release.</div><div>=C2=A0</div><blockquote class=3D"gmail_=
quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,=
204);padding-left:1ex">
<br>
<br>
1. Code management portal - xenbits (<a href=3D"https://xenbits.xenproject.=
org" rel=3D"noreferrer" target=3D"_blank">https://xenbits.xenproject.org</a=
>), <br>
gitlab (<a href=3D"https://gitlab.com/xen-project/xen" rel=3D"noreferrer" t=
arget=3D"_blank">https://gitlab.com/xen-project/xen</a>)<br></blockquote><d=
iv><br></div><div>Also: patchew: <a href=3D"https://patchew.org/Xen/">https=
://patchew.org/Xen/</a></div><div>=C2=A0</div><blockquote class=3D"gmail_qu=
ote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,20=
4);padding-left:1ex">
<br>
2. Project description - <a href=3D"http://wiki.xenproject.org" rel=3D"nore=
ferrer" target=3D"_blank">wiki.xenproject.org</a><br>
<br>
3. Project management - gitlab<br>
<br>
4. Code review - text based email clients (mutt, thunderbird), git-email, b=
4<br>
<br>
5. Text Editors such as vim, emacs<br>
<br>
6. Code review history - xen-devel mail archives<br>
<br>
7. Code revision management - git<br>
<br>
8. Xen coding language - C89, C99, Kconfig<br></blockquote><div><br></div><=
div>The Xen community also has tools written in Python, OCaml, Go, and Rust=
.</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0=
px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
9. Testing tools for Arm64 in gitlab CI<br>
<br>
compiler - gcc-9.3.0 (Alpine 3.12)) (most commonly used version)<br>
<br>
binutils - GNU Binutils for Debian) 2.38.9<br>
<br>
emulator/hw - qemu-system-aarch64-6.0.0, qemuarm64 6.2.0 (From yocto, <br>
poky disto - 4.0.5), zcu102 (**need the uboot, TF-A versions **)<br>
<br>
dom0/domU kernel - kernel-5.19.0<br>
<br>
rootfs - alpine-3.12-arm64-rootfs<br>
<br>
firmware - U-Boot 2022.10<br>
<br>
10. Testing tools for Arm in gitlab CI<br>
<br>
compiler - arm-poky-linux-gnueabi-gcc (GCC) 11.3.0, <br>
arm-linux-gnueabihf-gcc (Debian 12.2.0-14) 12.2.0 (most commonly used <br>
versions)<br>
<br>
emulator/hw - qemu-system-arm 6.2.0 (From yocto, poky disto - 4.0.5)<br>
<br>
dom0/domU kernel - kernel-5.15.72 (from Yocto), Kernel-5.10.0-22 (from <br>
Debian)<br>
<br>
rootfs - alpine-minirootfs-3.15.1-armhf.tar.gz<br>
<br>
firmware - U-Boot 2022.10<br>
<br>
11. Testing tools for x86<br>
<br>
compiler - gcc-9.3.0 (Alpine Linux 9.3.0), gcc (Debian 12.2.0-14) <br>
12.2.0, clang (from Debian) (most commonly used version)<br>
<br>
binutils - GNU ld (GNU Binutils for Debian) 2.40)<br>
<br>
emulator/hardware - Qubes HW (**need details regarding machine, <br>
firmware, etc**) , qemu 6.2.0 (From yocto, poky distro - 4.0.5)<br>
<br>
dom0/domU kernel - kernel 6.1.19<br>
<br>
rootfs - alpine-3.12-rootfs<br>
<br>
firmware - BIOS Dasharo (coreboot+UEFI) v1.1.1 02/22/2023 , EFI v2.70 by <b=
r>
EDK II , SMBIOS 3.3.0 , SeaBIOS (version rel-1.16.2-0-gea1b7a0-Xen), <br>
GRUB 2.06~rc1<br>
<br>
12. Debugger - gdb<br></blockquote><div><br></div><div>=C2=A0There is a too=
ls/debugger directory in the Xen git tree that contains:</div><div>=C2=A0gd=
bsx, a gdb server for Xen, and kdd, a tool for debugging Xen with the windo=
ws kernel debugger.</div><div><br></div><blockquote class=3D"gmail_quote" s=
tyle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pad=
ding-left:1ex">
<br>
13. Xen code building infra - make<br>
<br>
14. Testing OS - CentOS 7, Ubuntu, OpenSuse, Arch Linux, Alpine 3.12.12, <b=
r>
Debian 10 (Buster), Fedora<br>
<br>
( **I could not get the version info for some of these ^^^**)<br></blockquo=
te><div><br></div><div>Yocto and OpenEmbedded releases contain support for =
building Xen guest OS images suitable for testing.</div><div><br></div><div=
>Devuan, FreeBSD and OpenBSD.</div><div>=C2=A0</div><blockquote class=3D"gm=
ail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,=
204,204);padding-left:1ex">
<br>
15. Testing Infra - Gitlab runner, Docker<br>
<br>
16. Testing tools common to all architectures - All the host OS packages<br=
>
<br>
dtc, build-essential, zlib1g-dev, libncurses5-dev, libssl-dev, <br>
python-dev, python3-dev, xorg-dev, uuid-dev, libyajl-dev, libaio-dev, <br>
libglib2.0-dev, libpixman-1-dev, pkg-config, flex, bison, gettext, <br>
acpica-tools, bin86, bcc, liblzma-dev, libc6-dev-i386, libnl-3-dev, <br>
ocaml-nox, libfindlib-ocaml-dev, markdown, transfig, pandoc, <br>
checkpolicy, wget, nasm, mkimage, uboot-tools<br>
<br>
17. Documentation related tools - doxygen, rst.<br></blockquote><div><br></=
div><div>Possibly: Sphinx</div><div>=C2=A0</div><blockquote class=3D"gmail_=
quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,=
204);padding-left:1ex">
<br>
<br>
Did I miss anything ?<br></blockquote><div><br></div><div>I think you have =
a good start!</div><div><br></div><div>best,</div><div>Christopher</div><di=
v><br></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"mar=
gin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1=
ex">
<br>
Kind regards,<br>
<br>
Ayan<br>
<br>
<br>
<br>
<br>
</blockquote></div></div>

--000000000000c7ddb305fd224274--

