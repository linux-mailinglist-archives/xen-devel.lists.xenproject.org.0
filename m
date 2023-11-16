Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 12BE07ED85F
	for <lists+xen-devel@lfdr.de>; Thu, 16 Nov 2023 01:08:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.633875.989040 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r3PvA-0000vg-7x; Thu, 16 Nov 2023 00:07:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 633875.989040; Thu, 16 Nov 2023 00:07:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r3PvA-0000tY-5F; Thu, 16 Nov 2023 00:07:48 +0000
Received: by outflank-mailman (input) for mailman id 633875;
 Thu, 16 Nov 2023 00:07:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6/O6=G5=gmail.com=marietto2008@srs-se1.protection.inumbo.net>)
 id 1r3Pv9-0000tS-91
 for xen-devel@lists.xenproject.org; Thu, 16 Nov 2023 00:07:47 +0000
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [2a00:1450:4864:20::635])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2b096a29-8414-11ee-98db-6d05b1d4d9a1;
 Thu, 16 Nov 2023 01:07:45 +0100 (CET)
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-9bf86b77a2aso36438666b.0
 for <xen-devel@lists.xenproject.org>; Wed, 15 Nov 2023 16:07:45 -0800 (PST)
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
X-Inumbo-ID: 2b096a29-8414-11ee-98db-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700093265; x=1700698065; darn=lists.xenproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=saenhwRGINSUSrd9/DruMXsUo4E1QRCH3Eu95qyMTn4=;
        b=HSdPJ884IWhntCeWhg1R3ehCENPzjpq3bMqgwqm4w9Gaj04gGnkUB/Arw93SxQNCgo
         YjpaAF65lEwIkc1+kvhXxs5Z0HokagSuUrY4i4qdSM2KtowlLvkBh4ChQvXZWTCWZ5aQ
         EfGc8mYde8qEy+tchQmf2WmKaHB3YCFlsZ+LgUpuk8O++HEthVAt6xrK0KoDjBjNED6a
         KKdTXADNDuoiZe1TeKBF2giVh4OA6uLg1D1+KeAK1nMaGW7+4cEi2LKNFkj5WW22e2Td
         sNxcepWWtMSQadCpZHYgbcskzv5zj6GDRZdOoEd5AzM4IfXPu0p7QcHhmALmWYeqJDWc
         6ilQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700093265; x=1700698065;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=saenhwRGINSUSrd9/DruMXsUo4E1QRCH3Eu95qyMTn4=;
        b=BruFSfn32W7VkcIW+y+VNTurwCS2XhyVUYjKsBsByLGV+dpSEjCjW0lxhrxQCHPwt5
         0RjazxOkUbBeV3HUGeGoLhJUddOOzgJoNmAhYrnnf33gci/Se5iyMiJpCO7j36K3cTOG
         cvO0xXgb8XC4wXfDtdaywlaO3hVLqBreSouLof4DlxDjx76NI4BxOOl/D+yaAsCqg3UO
         nWUwL6T6iJa5yTZaVPRHamDLwF6fIoGRDm61zhCIfyxVGoh4LP0/LIyEAJdUlHmarh5d
         ErrewqglHinOWLcu5x63QufOC0U7nrvjPMe/r/KgoTIKdZwJ4fTeEyLlF8G70cmMVMV5
         O8GA==
X-Gm-Message-State: AOJu0Yw3jbE9VRUo7joTiRkn8WdmHqXWOJF1j7Vu4J4+vW3aqFj5JOdI
	+bmhkuY07dJXAgf5GhmCakJE5ngdyE6N0+jRAqLp3fIF2VJC3kKX
X-Google-Smtp-Source: AGHT+IFKtDNqfphvtCDpQkw/bzNd/L83VBv89yxiS++Xf8uzbOi/uxFhvygqx/fhGS8sZOC3YE5LjD/3z8sp/unzvh4=
X-Received: by 2002:a17:906:b20f:b0:9e5:2b2e:5b64 with SMTP id
 p15-20020a170906b20f00b009e52b2e5b64mr2780664ejz.12.1700093264545; Wed, 15
 Nov 2023 16:07:44 -0800 (PST)
MIME-Version: 1.0
References: <CA+1FSiiq9Z2sWq9R=7wEA0=LCavohupBedJOVnGrCHGiMZhR=A@mail.gmail.com>
 <alpine.DEB.2.22.394.2311141445120.160649@ubuntu-linux-20-04-desktop>
 <CA+1FSijk1gVZ2OZC=UCWQzUed2Ve5Nu5CagSTAnHPGf0hBRy-A@mail.gmail.com>
 <alpine.DEB.2.22.394.2311141513330.160649@ubuntu-linux-20-04-desktop>
 <CA+1FSijOYJneLxEfss2BoY0Q4vafa+gVdQeyOfy7A_bTAA6QLw@mail.gmail.com>
 <0aeaf3a8-096b-4ae2-be40-6d39914b28ea@netscape.net> <alpine.DEB.2.22.394.2311151542030.160649@ubuntu-linux-20-04-desktop>
In-Reply-To: <alpine.DEB.2.22.394.2311151542030.160649@ubuntu-linux-20-04-desktop>
From: Mario Marietto <marietto2008@gmail.com>
Date: Thu, 16 Nov 2023 01:07:08 +0100
Message-ID: <CA+1FSigcyYVosn1X_aoCoZVAtYunkmmrNq_h4Wggud4bmr9Mrg@mail.gmail.com>
Subject: Re: Values generated by the ViryaOS uboot-script-gen do not work
 correctly on the Chromebook Snow
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Chuck Zmudzinski <brchuckz@netscape.net>, 
	=?UTF-8?Q?Marek_Marczykowski=2DG=C3=B3recki?= <marmarek@invisiblethingslab.com>, 
	Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, 
	xen-devel <xen-devel@lists.xenproject.org>
Content-Type: multipart/alternative; boundary="0000000000001e4b72060a39cf20"

--0000000000001e4b72060a39cf20
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

It didn't work. This is the scr file generated.

ext2load mmc 1:3 0x51000000 zImage-6.6.0-xen-iommu-dma-on-xen
ext2load mmc 1:3 0x60000000 xen-4.17-armhf.ub
ext2load mmc 1:3 0x61000000 exynos5250-snow.dtb
fdt addr 0x61000000
fdt resize 1024
fdt set /chosen \#address-cells <0x2>
fdt set /chosen \#size-cells <0x2>
fdt set /chosen xen,xen-bootargs "console=3Ddtuart dtuart=3Dserial0
dom0_mem=3D768 dom0_max_vcpus=3D2 bootscrub=3D0 vwfi=3Dnative sched=3Dnull"
fdt mknod /chosen dom0
fdt set /chosen/dom0 compatible  "xen,linux-zimage" "xen,multiboot-module"
"multiboot,module"
fdt set /chosen/dom0 reg <0x0 0x51000000 0x0 0x87C200 >
fdt set /chosen xen,dom0-bootargs "console=3Dtty earlycon=3Dxen earlyprintk=
=3Dxen
root=3D/dev/mmcblk1p4 rw rootwait clk_ignore_unused"
setenv fdt_high 0xffffffffffffffff
bootm 0x60000000 - 0x61000000

So,I ran :

bash /boot/./uboot-script-gen -c /boot/xen-config -d .

it says :

Image Name:
Created:      Wed Nov 15 23:55:40 2023
Image Type:   ARM Linux Kernel Image (uncompressed)
Data Size:    884744 Bytes =3D 864.01 KiB =3D 0.84 MiB
Load Address: 60000000
Entry Point:  60000000
Generated uboot script xen-stef.scr, to be loaded at address 0x42000000:
ext2load mmc 1:3 0x42000000 xen-stef.scr; source 0x42000000

ok,I've booted xen with the suggested address :

ext2load mmc 1:3 0x42000000 xen-stef.scr; source 0x42000000

but it rebooted to the verification screen.

NB : I have applied both your suggestions (offset + your new start and end
memory address. Maybe they auto exclude each other ?)

On Thu, Nov 16, 2023 at 12:49=E2=80=AFAM Stefano Stabellini <sstabellini@ke=
rnel.org>
wrote:

> On Wed, 15 Nov 2023, Chuck Zmudzinski wrote:
> > On 11/14/2023 6:43 PM, Mario Marietto wrote:
> > > I hope that the informations below are correct :
> >
> > I don't know that they are correct. I have not spent the necessary time
> to
> > determine what the correct values for MEMORY_START and MEMORY_END are f=
or
> > the Chromebook we are using. I just presumed, probably incorrectly, tha=
t
> > the entire 2 GB memory is safe, but obviously that is not the case with
> > this Chromebook. Most likely, it requires a good understanding of the
> > particular way booting is done on a Chromebook, which seems to be
> different
> > from other devices.
> >
> > I plan to eventually look into finding values for MEMORY_START and
> MEMORY_END
> > sothe uboot-script-gen script computes usable values for loading Xen an=
d
> dom0
> > on this Chromebook in the script, but I might not get to that task
> immediately.
> > I plan to look at it within the next week or so.
>
> A couple of suggestions. I noticed that the addresses you chose have a
> higher alignment compared to the one chosen by Imagebuilder.
> Imagebuilder uses 2MB:
>
> offset=3D$((2*1024*1024))
>
> I would think that a 2MB alignment should be sufficient, but you can
> increase the alignment chosen by Imagebuilder simply by changing
> "offset" at the top of uboot-script-gen. You seem to be used a 240MB
> offset:
>
> offset=3D$((240*1024*1024))
>
> The other suggestion is about MEMORY_START and MEMORY_END. Looking at
> the addresses you picked by hand, the following you should give you very
> similar results:
>
> MEMORY_START=3D0x33000000
> MEMORY_END=3D0x80000000
>
>
> > > - the imagebuilder config file :
> > >
> > > MEMORY_START=3D"0x0"
> > > MEMORY_END=3D"0x80000000"
> > > LOAD_CMD=3D"ext2load mmc 1:3"
> > > BOOT_CMD=3D"bootm"
> > > DEVICE_TREE=3D"exynos5250-snow.dtb"
> > > XEN=3D"xen-4.17-armhf"
> > > XEN_CMD=3D"console=3Ddtuart dtuart=3Dserial0 dom0_mem=3D1152M dom0_ma=
x_vcpus=3D2
> bootscrub=3D0 vwfi=3Dnative sched=3Dnull"
> > > DOM0_KERNEL=3D"zImage-6.6.0-xen-iommu-dma-on-xen"
> > > DOM0_CMD=3D"console=3Dtty earlycon=3Dxen earlyprintk=3Dxen root=3D/de=
v/mmcblk1p4
> rw rootwait clk_ignore_unused"
> > > UBOOT_SOURCE=3D"xen.source"
> > > UBOOT_SCRIPT=3D"xen.scr"
> > >
> > > xen.source : (that does not work)
> > >
> > > mmc dev 1
> > > ext2load mmc 1:3 0xE00000 zImage-6.6.0-xen-iommu-dma-on-xen
> > > ext2load mmc 1:3 0x1800000 xen-4.17-armhf.ub
> > > ext2load mmc 1:3 0x1A00000 exynos5250-snow.dtb
> > > fdt addr 0x1A00000
> > > fdt resize 1024
> > > fdt set /chosen \#address-cells <0x2>
> > > fdt set /chosen \#size-cells <0x2>
> > > fdt set /chosen xen,xen-bootargs "console=3Ddtuart dtuart=3Dserial0
> dom0_mem=3D1152M dom0_max_vcpus=3D2 bootscrub=3D0 vwfi=3Dnative sched=3Dn=
ull"
> > > fdt mknod /chosen dom0
> > > fdt set /chosen/dom0 compatible  "xen,linux-zimage"
> "xen,multiboot-module" "multiboot,module"
> > > fdt set /chosen/dom0 reg <0x0 0xE00000 0x0 0x87C200 >
> > > fdt set /chosen xen,dom0-bootargs "console=3Dtty earlycon=3Dxen
> earlyprintk=3Dxen root=3D/dev/mmcblk1p4 rw rootwait clk_ignore_unused"
> > > setenv fdt_high 0xffffffffffffffff
> > > bootm 0x1800000 - 0x1A00000
> > >
> > > xen.source : (created by chuck and that works)
> > >
> > > mmc dev 1
> > > ext2load mmc 1:3 0x42000000 zImage-6.6.0-xen-iommu-dma-on-xen
> > > ext2load mmc 1:3 0x51000000 xen-4.17-armhf-armmp-0x51004000.ub
> > > ext2load mmc 1:3 0x5ffec000 exynos5250-snow.dtb
> > > fdt addr 0x5ffec000
> > > fdt resize 1024
> > > fdt set /chosen \#address-cells <0x2>
> > > fdt set /chosen \#size-cells <0x2>
> > > fdt set /chosen xen,xen-bootargs "console=3Ddtuart dtuart=3Dserial0
> dom0_mem=3D1152M dom0_max_vcpus=3D2 bootscrub=3D0 vwfi=3Dnative sched=3Dn=
ull"
> > > fdt mknod /chosen dom0
> > > fdt set /chosen/dom0 compatible  "xen,linux-zimage"
> "xen,multiboot-module" "multiboot,module"
> > > fdt set /chosen/dom0 reg <0x0 0x42000000 0x0 0x87C200 >
> > > fdt set /chosen xen,dom0-bootargs "console=3Dtty1 root=3D/dev/mmcblk1=
p4 rw
> rootwait clk_ignore_unused --no-log"
> > > bootm 0x51000000 - 0x5ffec000
> > >
> > > all the values that you see in this conf. files have been calculated
> by chuck by hand,because the values generated by the imagebuilder are
> wrong. The only value that's well calculated by the imagebuilder is 0x87C=
200
> > >
> > > - the size of all the binaries specified in the imagebuilder config
> file :
> > >
> > > exynos5250-snow.dtb =3D 46.6 KiB (47,769 byte)
> > > zImage-6.6.0-xen-iommu-dma-on-xen =3D 8.5 MiB (8,897,024 byte)
> > >
> > >
> > >
> > > On Wed, Nov 15, 2023 at 12:17=E2=80=AFAM Stefano Stabellini <
> sstabellini@kernel.org <mailto:sstabellini@kernel.org>> wrote:
> > >
> > >     Hi Mario,
> > >
> > >     I think we misunderstood each other :-)
> > >
> > >     MEMORY_START-MEMORY_END is not supposed to be computed: it is
> supposed
> > >     to come from the memory node in device tree tree (/memory) of the
> > >     platform. The idea is that you should not have to do any
> computations,
> > >     but only reuse the same address range specified there.
> > >
> > >     Similarly in regards to "please post the size of all the binaries=
",
> > >     this is just for debugging, so that I can see if there are any
> bugs with
> > >     uboot-script-gen. I cannot debug the script unless I figure out
> what the
> > >     problem is and the only way I can do that is with the binary size=
s
> and
> > >     redoing all the steps by hand.
> > >
> > >     The expected outcome is that once we resolve the problem you
> should be
> > >     able to use uboot-script-gen without any additional computation
> needed.
> > >
> > >     Of course using static values is also OK.
> > >
> > >
> > >     On Wed, 15 Nov 2023, Mario Marietto wrote:
> > >     > ---> uboot-script-gen assumes that the memory range specified b=
y
> MEMORY_START-MEMORY_END is valid and correct.
> > >     >
> > >     > Actually Chuck chose 0 as MEMORY_START and 0x800000 as
> MEMORY_END and these are stable values,they don't change. If you ask me t=
o
> calculate
> > >     > those values,it means that we need to compute these values. I
> imagine that to calculate these values is not easy.
> > >     >
> > >     > ---> To debug this kind of issues please post the size of all
> the binaries specified in the imagebuilder config file
> > >     >
> > >     > I imagine that I should also calculate those values. And again,=
I
> see a complication.
> > >     >
> > >     > I'm realizing that the method used by Chuck is easier because h=
e
> uses stable values. In the end,there aren't any calculations to do and
> > >     > since I'm looking for an easier method,not a more complicated
> one,I think that Chuck's method is good as is.
> > >     >
> > >     > On Tue, Nov 14, 2023 at 11:51=E2=80=AFPM Stefano Stabellini <
> sstabellini@kernel.org <mailto:sstabellini@kernel.org>> wrote:
> > >     >       Hi Mario,
> > >     >
> > >     >       It is difficult to know how to change uboot-script-gen if
> we don't know
> > >     >       why it is currently going wrong.
> > >     >
> > >     >       uboot-script-gen assumes that the memory range specified =
by
> > >     >       MEMORY_START-MEMORY_END is valid and correct.
> > >     >
> > >     >       So if you specified a valid and correct memory range in
> your config file
> > >     >       (0x41e00000-0x60000000) why is it failing?
> > >     >
> > >     >       The only thing uboot-script-gen does is choosing aligned
> addresses
> > >     >       within the MEMORY_START-MEMORY_END range. The addresses
> are supposed not
> > >     >       to overlap (meaning the initrd will not overwrite part of
> the kernel
> > >     >       when loaded). If the issue is a bug in uboot-script-gen,
> such as the
> > >     >       generated addresses overlap or they are not aligned, then
> we can fix the
> > >     >       alignment or overlap bug. To debug this kind of issues
> please post:
> > >     >       - the imagebuilder config file
> > >     >       - the generate boot.source script
> > >     >       - the size of all the binaries specified in the
> imagebuilder config file
> > >     >
> > >     >       On the other hand if 0x41e00000-0x60000000 is not a safe
> memory range to
> > >     >       use, then you need to specify a different memory range.
> > >     >
> > >     >       Cheers,
> > >     >
> > >     >       Stefano
> > >     >
> > >     >
> > >     >
> > >     >       On Mon, 13 Nov 2023, Mario Marietto wrote:
> > >     >       > Hello.
> > >     >       >
> > >     >       > I'm trying to find an easier way to the problem that yo=
u
> can read here :
> > >     >       >
> > >     >       >
> https://github.com/mobile-virt/u-boot-chromebook-xe303c12/tree/chromebook=
/xen#starting-a-domu-guest
> <
> https://github.com/mobile-virt/u-boot-chromebook-xe303c12/tree/chromebook=
/xen#starting-a-domu-guest
> >
> > >     >       >
> > >     >       > where Chuck says :
> > >     >       >
> > >     >       >  6. Create the u-boot shell commands that will be used
> to boot Xen and dom0.
> > >     >       >
> > >     >       > Create a file in /home/user (or any other directory)
> named bootxen.source with these contents :
> > >     >       >
> > >     >       >
> > >     >       > mmc dev 1 && mmc rescan 1
> > >     >       > ext2load mmc 1:3 0x42000000 zImage-6.1.61-stb-xen-cbe+
> > >     >       > ext2load mmc 1:3 0x51000000
> xen-4.17-armhf-armmp-0x51004000.ub
> > >     >       > ext2load mmc 1:3 0x5ffec000
> exynos5250-snow-6.1.61-stb-xen-cbe+.dtb
> > >     >       > fdt addr 0x5ffec000
> > >     >       > fdt resize 1024
> > >     >       > fdt set /chosen \#address-cells <0x2>
> > >     >       > fdt set /chosen \#size-cells <0x2>
> > >     >       > fdt set /chosen xen,xen-bootargs "console=3Ddtuart
> dtuart=3Dserial0 dom0_mem=3D1G dom0_max_vcpus=3D2 bootscrub=3D0 vwfi=3Dna=
tive"
> > >     >       > fdt mknod /chosen dom0
> > >     >       > fdt set /chosen/dom0 compatible  "xen,linux-zimage"
> "xen,multiboot-module" "multiboot,module"
> > >     >       > fdt set /chosen/dom0 reg <0x0 0x42000000 0x0 0x7D7200 >
> > >     >       > fdt set /chosen xen,dom0-bootargs "console=3Dtty1
> root=3D/dev/mmcblk1p4 rw rootwait clk_ignore_unused"
> > >     >       > bootm 0x51000000 - 0x5ffec000
> > >     >       >
> > >     >       > The hex value 0x7D7200 is the size of the
> zImage-6.1.61-stb-xen-cbe+ file, and that value is computed from the
> > >     >       uboot-script-gen script
> > >     >       > available from here :
> > >     >       >
> > >     >       >
> > >     >       > https://gitlab.com/ViryaOS/imagebuilder <
> https://gitlab.com/ViryaOS/imagebuilder>
> > >     >       >
> > >     >       >
> > >     >       > This is the interesting point :
> > >     >       >
> > >     >       >
> > >     >       > Please note that most of the other values in the script
> generated by the ViryaOS uboot-script-gen do not work correctly with
> > >     >       the Chromebook
> > >     >       > Snow, but the script does correctly calculate the size
> of the dom0 Linux kernel image.
> > >     >       >
> > >     >       >
> > >     >       > Some time ago Stefano suggested to put the values below
> for MEMORY_START and MEMORY_END inside the xen-config file :
> > >     >       >
> > >     >       >
> > >     >       > nano xen-config file :
> > >     >       >
> > >     >       >
> > >     >       > MEMORY_START=3D"0x41e00000"
> > >     >       > MEMORY_END=3D"0x60000000"
> > >     >       > LOAD_CMD=3D"ext2load mmc 1:3"
> > >     >       > BOOT_CMD=3D"bootm"
> > >     >       > DEVICE_TREE=3D"exynos5250-snow.dtb"
> > >     >       > XEN=3D"xen-4.17-armhf"
> > >     >       > XEN_CMD=3D"console=3Ddtuart dtuart=3Dserial0 dom0_mem=
=3D768M
> dom0_max_vcpus=3D2 bootscrub=3D0 vwfi=3Dnative sched=3Dnull"
> > >     >       > DOM0_KERNEL=3D"zImage-6.6.0-xen-dma-mapping"
> > >     >       > DOM0_CMD=3D"console=3Dtty earlycon=3Dxen earlyprintk=3D=
xen
> root=3D/dev/mmcblk1p4 rw rootwait clk_ignore_unused"
> > >     >       > UBOOT_SOURCE=3D"xen.source"
> > >     >       >
> > >     >       >
> > >     >       > bash ./uboot-script-gen -c xen-config -d .
> > >     >       >
> > >     >       >
> > >     >       > Image Name:
> > >     >       > Created:      Thu Nov  2 20:59:24 2023
> > >     >       > Image Type:   ARM Linux Kernel Image (uncompressed)
> > >     >       > Data Size:    884744 Bytes =3D 864.01 KiB =3D 0.84 MiB
> > >     >       > Load Address: 42c00000
> > >     >       > Entry Point:  42c00000
> > >     >       >
> > >     >       >
> > >     >       > Generated uboot script xen.scr, to be loaded at address
> 0x42000000:
> > >     >       > ext2load mmc 1:3 0x42000000 xen.scr; source 0x42000000
> > >     >       >
> > >     >       >
> > >     >       > and I tried to boot Xen and Linux 6.6 as dom0 :
> > >     >       >
> > >     >       > SMDK5250 # mmc dev 1
> > >     >       > SMDK5250 # ext2load mmc 1:3 0x42000000 xen.scr; source
> 0x42000000
> > >     >       > but it did not work : it reboots on the verification
> screen.
> > >     >       >
> > >     >       > --
> > >     >       > Mario.
> > >     >       >
> > >     >       >
> > >     >
> > >     >
> > >     >
> > >     > --
> > >     > Mario.
> > >     >
> > >     >
> > >
> > >
> > >
> > > --
> > > Mario.
> >



--=20
Mario.

--0000000000001e4b72060a39cf20
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><span style=3D"font-family:monospace"><span style=3D"=
color:rgb(0,0,0);background-color:rgb(255,255,255)"></span></span></div><di=
v><span style=3D"font-family:monospace"><span style=3D"color:rgb(0,0,0);bac=
kground-color:rgb(255,255,255)">It didn&#39;t work. This is the scr file ge=
nerated. <br></span></span></div><div><br></div><div>ext2load mmc 1:3 0x510=
00000 zImage-6.6.0-xen-iommu-dma-on-xen<br>ext2load mmc 1:3 0x60000000 xen-=
4.17-armhf.ub<br>ext2load mmc 1:3 0x61000000 exynos5250-snow.dtb<br>fdt add=
r 0x61000000<br>fdt resize 1024<br>fdt set /chosen \#address-cells &lt;0x2&=
gt;<br>fdt set /chosen \#size-cells &lt;0x2&gt;<br>fdt set /chosen xen,xen-=
bootargs &quot;console=3Ddtuart dtuart=3Dserial0 dom0_mem=3D768 dom0_max_vc=
pus=3D2 bootscrub=3D0 vwfi=3Dnative sched=3Dnull&quot;<br>fdt mknod /chosen=
 dom0<br>fdt set /chosen/dom0 compatible =C2=A0&quot;xen,linux-zimage&quot;=
 &quot;xen,multiboot-module&quot; &quot;multiboot,module&quot;<br>fdt set /=
chosen/dom0 reg &lt;0x0 0x51000000 0x0 0x87C200 &gt;<br>fdt set /chosen xen=
,dom0-bootargs &quot;console=3Dtty earlycon=3Dxen earlyprintk=3Dxen root=3D=
/dev/mmcblk1p4 rw rootwait clk_ignore_unused&quot;<br>setenv fdt_high 0xfff=
fffffffffffff<br>bootm 0x60000000 - 0x61000000</div><div><span style=3D"fon=
t-family:monospace"><span style=3D"color:rgb(0,0,0);background-color:rgb(25=
5,255,255)"><br></span></span></div><div><span style=3D"font-family:monospa=
ce"><span style=3D"color:rgb(0,0,0);background-color:rgb(255,255,255)">So,I=
 ran :</span></span></div><div><span style=3D"font-family:monospace"><span =
style=3D"color:rgb(0,0,0);background-color:rgb(255,255,255)"><br></span></s=
pan></div><div><span style=3D"font-family:monospace"><span style=3D"color:r=
gb(0,0,0);background-color:rgb(255,255,255)">bash /boot/./uboot-script-gen =
-c /boot/xen-config -d .</span><br></span></div><div><span style=3D"font-fa=
mily:monospace"><span style=3D"color:rgb(0,0,0);background-color:rgb(255,25=
5,255)"><br></span></span></div><div><span style=3D"font-family:monospace">=
<span style=3D"color:rgb(0,0,0);background-color:rgb(255,255,255)">it says =
: <br></span></span></div><div><span style=3D"font-family:monospace"></span=
></div><div><span style=3D"font-family:monospace"><br></span></div><div><sp=
an style=3D"font-family:monospace">Image Name: =C2=A0=C2=A0=C2=A0</span></d=
iv><div><span style=3D"font-family:monospace"></span></div><span style=3D"f=
ont-family:monospace">Created: =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0Wed Nov 15 23:=
55:40 2023
<br>Image Type: =C2=A0=C2=A0ARM Linux Kernel Image (uncompressed)
<br>Data Size: =C2=A0=C2=A0=C2=A0884744 Bytes =3D 864.01 KiB =3D 0.84 MiB
<br>Load Address: 60000000
<br>Entry Point: =C2=A060000000
<br>Generated uboot script xen-stef.scr, to be loaded at address 0x42000000=
:
<br></span><div><span style=3D"font-family:monospace">ext2load mmc 1:3 0x42=
000000 xen-stef.scr; source 0x42000000</span></div><div><span style=3D"font=
-family:monospace"><br></span></div><div><span style=3D"font-family:monospa=
ce">ok,I&#39;ve booted xen with the suggested address :</span></div><div><s=
pan style=3D"font-family:monospace"><br></span></div><div><div><span style=
=3D"font-family:monospace">ext2load mmc 1:3 0x42000000 xen-stef.scr; source=
 0x42000000</span></div><div><span style=3D"font-family:monospace"><br></sp=
an></div><div><span style=3D"font-family:monospace">but it rebooted to the =
verification screen. <br></span></div><div><span style=3D"font-family:monos=
pace"><br></span></div><div><span style=3D"font-family:monospace">NB : I ha=
ve applied both your suggestions (offset + your new start and end memory ad=
dress. Maybe they auto exclude each other ?)<br></span></div></div><div><sp=
an style=3D"font-family:monospace"></span></div></div><br><div class=3D"gma=
il_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Nov 16, 2023 at 12:=
49=E2=80=AFAM Stefano Stabellini &lt;<a href=3D"mailto:sstabellini@kernel.o=
rg">sstabellini@kernel.org</a>&gt; wrote:<br></div><blockquote class=3D"gma=
il_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,2=
04,204);padding-left:1ex">On Wed, 15 Nov 2023, Chuck Zmudzinski wrote:<br>
&gt; On 11/14/2023 6:43 PM, Mario Marietto wrote:<br>
&gt; &gt; I hope that the informations below are correct :<br>
&gt; <br>
&gt; I don&#39;t know that they are correct. I have not spent the necessary=
 time to<br>
&gt; determine what the correct values for MEMORY_START and MEMORY_END are =
for<br>
&gt; the Chromebook we are using. I just presumed, probably incorrectly, th=
at<br>
&gt; the entire 2 GB memory is safe, but obviously that is not the case wit=
h<br>
&gt; this Chromebook. Most likely, it requires a good understanding of the<=
br>
&gt; particular way booting is done on a Chromebook, which seems to be diff=
erent<br>
&gt; from other devices.<br>
&gt; <br>
&gt; I plan to eventually look into finding values for MEMORY_START and MEM=
ORY_END<br>
&gt; sothe uboot-script-gen script computes usable values for loading Xen a=
nd dom0<br>
&gt; on this Chromebook in the script, but I might not get to that task imm=
ediately.<br>
&gt; I plan to look at it within the next week or so.<br>
<br>
A couple of suggestions. I noticed that the addresses you chose have a<br>
higher alignment compared to the one chosen by Imagebuilder.<br>
Imagebuilder uses 2MB:<br>
<br>
offset=3D$((2*1024*1024))<br>
<br>
I would think that a 2MB alignment should be sufficient, but you can<br>
increase the alignment chosen by Imagebuilder simply by changing<br>
&quot;offset&quot; at the top of uboot-script-gen. You seem to be used a 24=
0MB<br>
offset:<br>
<br>
offset=3D$((240*1024*1024))<br>
<br>
The other suggestion is about MEMORY_START and MEMORY_END. Looking at<br>
the addresses you picked by hand, the following you should give you very<br=
>
similar results:<br>
<br>
MEMORY_START=3D0x33000000<br>
MEMORY_END=3D0x80000000<br>
<br>
<br>
&gt; &gt; - the imagebuilder config file :<br>
&gt; &gt; <br>
&gt; &gt; MEMORY_START=3D&quot;0x0&quot;<br>
&gt; &gt; MEMORY_END=3D&quot;0x80000000&quot;<br>
&gt; &gt; LOAD_CMD=3D&quot;ext2load mmc 1:3&quot;<br>
&gt; &gt; BOOT_CMD=3D&quot;bootm&quot;<br>
&gt; &gt; DEVICE_TREE=3D&quot;exynos5250-snow.dtb&quot;<br>
&gt; &gt; XEN=3D&quot;xen-4.17-armhf&quot;<br>
&gt; &gt; XEN_CMD=3D&quot;console=3Ddtuart dtuart=3Dserial0 dom0_mem=3D1152=
M dom0_max_vcpus=3D2 bootscrub=3D0 vwfi=3Dnative sched=3Dnull&quot;<br>
&gt; &gt; DOM0_KERNEL=3D&quot;zImage-6.6.0-xen-iommu-dma-on-xen&quot;<br>
&gt; &gt; DOM0_CMD=3D&quot;console=3Dtty earlycon=3Dxen earlyprintk=3Dxen r=
oot=3D/dev/mmcblk1p4 rw rootwait clk_ignore_unused&quot;<br>
&gt; &gt; UBOOT_SOURCE=3D&quot;xen.source&quot;<br>
&gt; &gt; UBOOT_SCRIPT=3D&quot;xen.scr&quot;<br>
&gt; &gt; <br>
&gt; &gt; xen.source : (that does not work)<br>
&gt; &gt; <br>
&gt; &gt; mmc dev 1<br>
&gt; &gt; ext2load mmc 1:3 0xE00000 zImage-6.6.0-xen-iommu-dma-on-xen<br>
&gt; &gt; ext2load mmc 1:3 0x1800000 xen-4.17-armhf.ub<br>
&gt; &gt; ext2load mmc 1:3 0x1A00000 exynos5250-snow.dtb<br>
&gt; &gt; fdt addr 0x1A00000<br>
&gt; &gt; fdt resize 1024<br>
&gt; &gt; fdt set /chosen \#address-cells &lt;0x2&gt;<br>
&gt; &gt; fdt set /chosen \#size-cells &lt;0x2&gt;<br>
&gt; &gt; fdt set /chosen xen,xen-bootargs &quot;console=3Ddtuart dtuart=3D=
serial0 dom0_mem=3D1152M dom0_max_vcpus=3D2 bootscrub=3D0 vwfi=3Dnative sch=
ed=3Dnull&quot;<br>
&gt; &gt; fdt mknod /chosen dom0<br>
&gt; &gt; fdt set /chosen/dom0 compatible =C2=A0&quot;xen,linux-zimage&quot=
; &quot;xen,multiboot-module&quot; &quot;multiboot,module&quot;<br>
&gt; &gt; fdt set /chosen/dom0 reg &lt;0x0 0xE00000 0x0 0x87C200 &gt;<br>
&gt; &gt; fdt set /chosen xen,dom0-bootargs &quot;console=3Dtty earlycon=3D=
xen earlyprintk=3Dxen root=3D/dev/mmcblk1p4 rw rootwait clk_ignore_unused&q=
uot;<br>
&gt; &gt; setenv fdt_high 0xffffffffffffffff<br>
&gt; &gt; bootm 0x1800000 - 0x1A00000<br>
&gt; &gt; <br>
&gt; &gt; xen.source : (created by chuck and that works)<br>
&gt; &gt; <br>
&gt; &gt; mmc dev 1<br>
&gt; &gt; ext2load mmc 1:3 0x42000000 zImage-6.6.0-xen-iommu-dma-on-xen<br>
&gt; &gt; ext2load mmc 1:3 0x51000000 xen-4.17-armhf-armmp-0x51004000.ub<br=
>
&gt; &gt; ext2load mmc 1:3 0x5ffec000 exynos5250-snow.dtb<br>
&gt; &gt; fdt addr 0x5ffec000<br>
&gt; &gt; fdt resize 1024<br>
&gt; &gt; fdt set /chosen \#address-cells &lt;0x2&gt;<br>
&gt; &gt; fdt set /chosen \#size-cells &lt;0x2&gt;<br>
&gt; &gt; fdt set /chosen xen,xen-bootargs &quot;console=3Ddtuart dtuart=3D=
serial0 dom0_mem=3D1152M dom0_max_vcpus=3D2 bootscrub=3D0 vwfi=3Dnative sch=
ed=3Dnull&quot;<br>
&gt; &gt; fdt mknod /chosen dom0<br>
&gt; &gt; fdt set /chosen/dom0 compatible =C2=A0&quot;xen,linux-zimage&quot=
; &quot;xen,multiboot-module&quot; &quot;multiboot,module&quot;<br>
&gt; &gt; fdt set /chosen/dom0 reg &lt;0x0 0x42000000 0x0 0x87C200 &gt;<br>
&gt; &gt; fdt set /chosen xen,dom0-bootargs &quot;console=3Dtty1 root=3D/de=
v/mmcblk1p4 rw rootwait clk_ignore_unused --no-log&quot;<br>
&gt; &gt; bootm 0x51000000 - 0x5ffec000<br>
&gt; &gt; <br>
&gt; &gt; all the values that you see in this conf. files have been calcula=
ted by chuck by hand,because the values generated by the imagebuilder are w=
rong. The only value that&#39;s well calculated by the imagebuilder is 0x87=
C200<br>
&gt; &gt; <br>
&gt; &gt; - the size of all the binaries specified in the imagebuilder conf=
ig file :<br>
&gt; &gt; <br>
&gt; &gt; exynos5250-snow.dtb =3D 46.6=C2=A0KiB (47,769 byte)<br>
&gt; &gt; zImage-6.6.0-xen-iommu-dma-on-xen =3D 8.5=C2=A0MiB (8,897,024 byt=
e)<br>
&gt; &gt; <br>
&gt; &gt; <br>
&gt; &gt; <br>
&gt; &gt; On Wed, Nov 15, 2023 at 12:17=E2=80=AFAM Stefano Stabellini &lt;<=
a href=3D"mailto:sstabellini@kernel.org" target=3D"_blank">sstabellini@kern=
el.org</a> &lt;mailto:<a href=3D"mailto:sstabellini@kernel.org" target=3D"_=
blank">sstabellini@kernel.org</a>&gt;&gt; wrote:<br>
&gt; &gt; <br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0Hi Mario,<br>
&gt; &gt; <br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0I think we misunderstood each other :-)<br>
&gt; &gt; <br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0MEMORY_START-MEMORY_END is not supposed to be =
computed: it is supposed<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0to come from the memory node in device tree tr=
ee (/memory) of the<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0platform. The idea is that you should not have=
 to do any computations,<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0but only reuse the same address range specifie=
d there.<br>
&gt; &gt; <br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0Similarly in regards to &quot;please post the =
size of all the binaries&quot;,<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0this is just for debugging, so that I can see =
if there are any bugs with<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0uboot-script-gen. I cannot debug the script un=
less I figure out what the<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0problem is and the only way I can do that is w=
ith the binary sizes and<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0redoing all the steps by hand.<br>
&gt; &gt; <br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0The expected outcome is that once we resolve t=
he problem you should be<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0able to use uboot-script-gen without any addit=
ional computation needed.<br>
&gt; &gt; <br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0Of course using static values is also OK.<br>
&gt; &gt; <br>
&gt; &gt; <br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0On Wed, 15 Nov 2023, Mario Marietto wrote:<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt; ---&gt; uboot-script-gen assumes that the=
 memory range specified by MEMORY_START-MEMORY_END is valid and correct.<br=
>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt; Actually Chuck chose 0 as MEMORY_START an=
d 0x800000 as MEMORY_END and these are stable values,they don&#39;t change.=
 If you ask me to calculate<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt; those values,it means that we need to com=
pute these values. I imagine that to calculate these values is not easy.<br=
>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt; ---&gt; To debug this kind of issues plea=
se post the size of all the binaries specified in the imagebuilder config f=
ile<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt; I imagine that I should also calculate th=
ose values. And again,I see a complication.<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt; I&#39;m realizing that the method used by=
 Chuck is easier because he uses stable values. In the end,there aren&#39;t=
 any calculations to do and<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt; since I&#39;m looking for an easier metho=
d,not a more complicated one,I think that Chuck&#39;s method is good as is.=
=C2=A0<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt; On Tue, Nov 14, 2023 at 11:51=E2=80=AFPM =
Stefano Stabellini &lt;<a href=3D"mailto:sstabellini@kernel.org" target=3D"=
_blank">sstabellini@kernel.org</a> &lt;mailto:<a href=3D"mailto:sstabellini=
@kernel.org" target=3D"_blank">sstabellini@kernel.org</a>&gt;&gt; wrote:<br=
>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0Hi Mario,<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0It is difficult=
 to know how to change uboot-script-gen if we don&#39;t know<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0why it is curre=
ntly going wrong.<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0uboot-script-ge=
n assumes that the memory range specified by<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0MEMORY_START-ME=
MORY_END is valid and correct.<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0So if you speci=
fied a valid and correct memory range in your config file<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0(0x41e00000-0x6=
0000000) why is it failing?<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0The only thing =
uboot-script-gen does is choosing aligned addresses<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0within the MEMO=
RY_START-MEMORY_END range. The addresses are supposed not<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0to overlap (mea=
ning the initrd will not overwrite part of the kernel<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0when loaded). I=
f the issue is a bug in uboot-script-gen, such as the<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0generated addre=
sses overlap or they are not aligned, then we can fix the<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0alignment or ov=
erlap bug. To debug this kind of issues please post:<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0- the imagebuil=
der config file<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0- the generate =
boot.source script<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0- the size of a=
ll the binaries specified in the imagebuilder config file<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0On the other ha=
nd if 0x41e00000-0x60000000 is not a safe memory range to<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0use, then you n=
eed to specify a different memory range.<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0Cheers,<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0Stefano<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0On Mon, 13 Nov =
2023, Mario Marietto wrote:<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; Hello.<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; I&#39;m tr=
ying to find an easier way to the problem that you can read here :<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; <a href=3D=
"https://github.com/mobile-virt/u-boot-chromebook-xe303c12/tree/chromebook/=
xen#starting-a-domu-guest" rel=3D"noreferrer" target=3D"_blank">https://git=
hub.com/mobile-virt/u-boot-chromebook-xe303c12/tree/chromebook/xen#starting=
-a-domu-guest</a> &lt;<a href=3D"https://github.com/mobile-virt/u-boot-chro=
mebook-xe303c12/tree/chromebook/xen#starting-a-domu-guest" rel=3D"noreferre=
r" target=3D"_blank">https://github.com/mobile-virt/u-boot-chromebook-xe303=
c12/tree/chromebook/xen#starting-a-domu-guest</a>&gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; where Chuc=
k says :<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 6. C=
reate the u-boot shell commands that will be used to boot Xen and dom0.<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; Create a f=
ile in /home/user (or any other directory) named bootxen.source with these =
contents :<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; mmc dev 1 =
&amp;&amp; mmc rescan 1<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; ext2load m=
mc 1:3 0x42000000 zImage-6.1.61-stb-xen-cbe+<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; ext2load m=
mc 1:3 0x51000000 xen-4.17-armhf-armmp-0x51004000.ub<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; ext2load m=
mc 1:3 0x5ffec000 exynos5250-snow-6.1.61-stb-xen-cbe+.dtb<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; fdt addr 0=
x5ffec000<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; fdt resize=
 1024<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; fdt set /c=
hosen \#address-cells &lt;0x2&gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; fdt set /c=
hosen \#size-cells &lt;0x2&gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; fdt set /c=
hosen xen,xen-bootargs &quot;console=3Ddtuart dtuart=3Dserial0 dom0_mem=3D1=
G dom0_max_vcpus=3D2 bootscrub=3D0 vwfi=3Dnative&quot;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; fdt mknod =
/chosen dom0<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; fdt set /c=
hosen/dom0 compatible=C2=A0 &quot;xen,linux-zimage&quot; &quot;xen,multiboo=
t-module&quot; &quot;multiboot,module&quot;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; fdt set /c=
hosen/dom0 reg &lt;0x0 0x42000000 0x0 0x7D7200 &gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; fdt set /c=
hosen xen,dom0-bootargs &quot;console=3Dtty1 root=3D/dev/mmcblk1p4 rw rootw=
ait clk_ignore_unused&quot;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; bootm 0x51=
000000 - 0x5ffec000<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; The hex va=
lue 0x7D7200 is the size of the zImage-6.1.61-stb-xen-cbe+ file, and that v=
alue is computed from the<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0uboot-script-ge=
n script<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; available =
from here :<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; <a href=3D=
"https://gitlab.com/ViryaOS/imagebuilder" rel=3D"noreferrer" target=3D"_bla=
nk">https://gitlab.com/ViryaOS/imagebuilder</a> &lt;<a href=3D"https://gitl=
ab.com/ViryaOS/imagebuilder" rel=3D"noreferrer" target=3D"_blank">https://g=
itlab.com/ViryaOS/imagebuilder</a>&gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; This is th=
e interesting point :<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; Please not=
e that most of the other values in the script generated by the ViryaOS uboo=
t-script-gen do not work correctly with<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0the Chromebook<=
br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; Snow, but =
the script does correctly calculate the size of the dom0 Linux kernel image=
.<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; Some time =
ago Stefano suggested to put the values below for MEMORY_START and MEMORY_E=
ND inside the xen-config file :<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; nano xen-c=
onfig file :<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; MEMORY_STA=
RT=3D&quot;0x41e00000&quot;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; MEMORY_END=
=3D&quot;0x60000000&quot;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; LOAD_CMD=
=3D&quot;ext2load mmc 1:3&quot;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; BOOT_CMD=
=3D&quot;bootm&quot;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; DEVICE_TRE=
E=3D&quot;exynos5250-snow.dtb&quot;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; XEN=3D&quo=
t;xen-4.17-armhf&quot;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; XEN_CMD=3D=
&quot;console=3Ddtuart dtuart=3Dserial0 dom0_mem=3D768M dom0_max_vcpus=3D2 =
bootscrub=3D0 vwfi=3Dnative sched=3Dnull&quot;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; DOM0_KERNE=
L=3D&quot;zImage-6.6.0-xen-dma-mapping&quot;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; DOM0_CMD=
=3D&quot;console=3Dtty earlycon=3Dxen earlyprintk=3Dxen root=3D/dev/mmcblk1=
p4 rw rootwait clk_ignore_unused&quot;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; UBOOT_SOUR=
CE=3D&quot;xen.source&quot;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; bash ./ubo=
ot-script-gen -c xen-config -d .<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; Image Name=
: =C2=A0=C2=A0=C2=A0<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; Created: =
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0Thu Nov =C2=A02 20:59:24 2023<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; Image Type=
: =C2=A0=C2=A0ARM Linux Kernel Image (uncompressed)<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; Data Size:=
 =C2=A0=C2=A0=C2=A0884744 Bytes =3D 864.01 KiB =3D 0.84 MiB<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; Load Addre=
ss: 42c00000<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; Entry Poin=
t: =C2=A042c00000<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; Generated =
uboot script xen.scr, to be loaded at address 0x42000000:<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; ext2load m=
mc 1:3 0x42000000 xen.scr; source 0x42000000<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; and I trie=
d to boot Xen and Linux 6.6 as dom0 :<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; SMDK5250 #=
 mmc dev 1<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; SMDK5250 #=
 ext2load mmc 1:3 0x42000000 xen.scr; source 0x42000000<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; but it did=
 not work : it reboots on the verification screen.<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; --<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; Mario.<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt; --<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt; Mario.<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt; <br>
&gt; &gt; <br>
&gt; &gt; <br>
&gt; &gt; <br>
&gt; &gt; -- <br>
&gt; &gt; Mario.<br>
&gt; </blockquote></div><br clear=3D"all"><br><span class=3D"gmail_signatur=
e_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature">Mario.<b=
r></div>

--0000000000001e4b72060a39cf20--

