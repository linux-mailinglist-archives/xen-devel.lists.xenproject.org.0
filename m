Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B18947EDDFF
	for <lists+xen-devel@lfdr.de>; Thu, 16 Nov 2023 10:52:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.634099.989323 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r3Z2S-0004n6-Fb; Thu, 16 Nov 2023 09:51:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 634099.989323; Thu, 16 Nov 2023 09:51:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r3Z2S-0004km-BC; Thu, 16 Nov 2023 09:51:56 +0000
Received: by outflank-mailman (input) for mailman id 634099;
 Thu, 16 Nov 2023 09:51:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6/O6=G5=gmail.com=marietto2008@srs-se1.protection.inumbo.net>)
 id 1r3Z2Q-0004kg-Km
 for xen-devel@lists.xenproject.org; Thu, 16 Nov 2023 09:51:54 +0000
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [2a00:1450:4864:20::634])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c5203cd1-8465-11ee-98db-6d05b1d4d9a1;
 Thu, 16 Nov 2023 10:51:53 +0100 (CET)
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-9bf86b77a2aso87720066b.0
 for <xen-devel@lists.xenproject.org>; Thu, 16 Nov 2023 01:51:53 -0800 (PST)
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
X-Inumbo-ID: c5203cd1-8465-11ee-98db-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700128312; x=1700733112; darn=lists.xenproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=HjZOU3ro6NXnMbgOS41PF3sr0xFljVGjGEeubeR7w3g=;
        b=aTwm9TTw7JOBTqeLwgJY3DjPpDfv2reqaZDJZbIzAc82wxO+3SdOYveC41NFiA2lfc
         wNwM61Gxr9kqPMMW1e7aBowh4rMnp+OQDwccV/a2fv3N3qR6WxTRnCT76XW5Y6Z8uyTB
         JVTt8qtNFBfkSKXNKVkshKQ7vtyg2pW58aknExhjuJM1DgEV1YbJlNaVFPzpKrOM3mkz
         JsS5r87PLU4qz6n/1syBzYSUCgZX2eup0GNZg9CaF5fT7TIsnxi8R1lBXuYSiPjW8PAD
         t8jvoOrD8w50ksqCPgRsH4C76ymKiXHj9ys1X5eTO0K2Pf4nsfouibUXReckVZKa0jhs
         r6jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700128312; x=1700733112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HjZOU3ro6NXnMbgOS41PF3sr0xFljVGjGEeubeR7w3g=;
        b=mk/2PyI3Tv6p5JMIc5FiL9lf65k0yCd6SnwR8JWZmU3Ehzl8WUpm3H8R2wgsoa41uz
         bTrds2gJods8g03HkOQPTdlKAvRwJvidS0Nfzdqs2IiIkPbekXaCB5Z4tlX+/qV6nCca
         QBp1dXy8iROJA+tzuw2D0EYggSw1P8sRTvlPl45+ijFQmyPT7iExYxqWUnd/YY6RA6yF
         0RQh3/+j1pq/Dbmu0qcVgMbZ2vv1tIuZI/G7qHW68al5lQGWePhF5ebFewH9CvbOwUSL
         eZX3oVCNmfJLuW4Fl5cSg+dEMUvYdIk4AVI31h7/hTUCRq2Qt9ZCP9xFpEzqIUyiC/EE
         dtKg==
X-Gm-Message-State: AOJu0YwX7bBZ8uyrbXHDYq0OYxpgbSjssQj2JydZPBNVtOHSSrojHXYE
	I7h8tGVsovZdkmXfF/GmTA3iDceUcPmgSGAqhWc=
X-Google-Smtp-Source: AGHT+IG9hl+/TzR6a8qzzi5Cqb2HgpG1/f7D1teEMt+kV6PF8hBkz+bDdAhd0jdskPT0b9X0q83HAK8nEou3HGhmS64=
X-Received: by 2002:a17:906:b20f:b0:9e5:2b2e:5b64 with SMTP id
 p15-20020a170906b20f00b009e52b2e5b64mr3600861ejz.12.1700128312188; Thu, 16
 Nov 2023 01:51:52 -0800 (PST)
MIME-Version: 1.0
References: <20231111184538.2371-1-brchuckz.ref@aol.com> <20231111184538.2371-1-brchuckz@aol.com>
 <e5ebfde9-7a74-4908-b0b9-db47c4e76315@arm.com> <alpine.DEB.2.22.394.2311141407140.160649@ubuntu-linux-20-04-desktop>
 <edefba96-0a17-4b3d-992c-6bfe9e62bf97@netscape.net> <CA+1FSih45=vtpa+bfYGDFEXd6u=+V8wLsBoo8=2rmj7V0Lj_Ow@mail.gmail.com>
In-Reply-To: <CA+1FSih45=vtpa+bfYGDFEXd6u=+V8wLsBoo8=2rmj7V0Lj_Ow@mail.gmail.com>
From: Mario Marietto <marietto2008@gmail.com>
Date: Thu, 16 Nov 2023 10:51:15 +0100
Message-ID: <CA+1FSiiuFMvZAHHXFQHRF=gQSoZTxLEZSDYfCgw8j6HiGkkDXw@mail.gmail.com>
Subject: Re: [PATCH] arm/mm: add option to prefer IOMMU ops for DMA on Xen
To: Chuck Zmudzinski <brchuckz@netscape.net>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Robin Murphy <robin.murphy@arm.com>, 
	Chuck Zmudzinski <brchuckz@aol.com>, linux-arm-kernel@lists.infradead.org, 
	Russell King <linux@armlinux.org.uk>, Juergen Gross <jgross@suse.com>, 
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, linux-kernel@vger.kernel.org, 
	xen-devel@lists.xenproject.org, Marek Szyprowski <m.szyprowski@samsung.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Mathieu Poirier <mathieu.poirier@linaro.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"Matthew Wilcox (Oracle)" <willy@infradead.org>, Linus Walleij <linus.walleij@linaro.org>, 
	Jason Gunthorpe <jgg@ziepe.ca>, Arnd Bergmann <arnd@arndb.de>, Julien Grall <julien@xen.org>, 
	Bertrand Marquis <bertrand.marquis@arm.com>
Content-Type: multipart/alternative; boundary="0000000000001ee4a3060a41f85f"

--0000000000001ee4a3060a41f85f
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello to everyone.

I'm trying to boot Linux 6.1.y as Xen dom0 on the Chromebook xe303c12, aka
Snow and configure and start a very basic domU guest,following the Chuck's
tutorial,located here :
https://github.com/mobile-virt/u-boot-chromebook-xe303c12/tree/chromebook/x=
en#starting-a-domu-guest

What I did has been to carefully follow his instructions,but I haven't
found a solution to fix this problem,yet :

# sudo xl create devuan.cfg -c

Parsing config from devuan.cfg
libxl: error: libxl_create.c:720:libxl__domain_make: domain creation fail:
Permission denied
libxl: error: libxl_create.c:1309:initiate_domain_create: cannot make
domain: -3

This is my devuan.cfg file :

kernel =3D '/Dati/xen/kernels/zImage-6.1.59-stb-xen-cbe+'
memory =3D '512'
name =3D 'Devuan'
vcpus =3D '1'
disk =3D [ '/Dati/xen/devuan.img,,xvda,w' ]
extra =3D 'console=3Dhvc0 root=3D/dev/xvda rw init=3D/sbin/init
xen-fbfront.video=3D24,1024,768'

(I have tried also with root=3D/dev/xvda1 and root=3D/dev/xvda2,but leaving
disk =3D [ '/Dati/xen/devuan.img,,xvda,w' ] and not xvda1 or 2)

I have no  idea about the reason(s) I always get that error,but I don't
think it is caused by a wrong creation of the devuan.img file. Can someone
point me in the right direction to understand what could be wrong ? I
haven't found any useful information on the internet.

This is bootxen.scr file where I have configured dom0_mem=3D768 :

mmc dev 1
ext2load mmc 1:3 0x42000000 zImage-6.6.0-xen-iommu-dma-on-xen
ext2load mmc 1:3 0x51000000 xen-4.17-armhf-armmp-0x51004000.ub
ext2load mmc 1:3 0x5ffec000 exynos5250-snow.dtb
fdt addr 0x5ffec000
fdt resize 1024
fdt set /chosen \#address-cells <0x2>
fdt set /chosen \#size-cells <0x2>
fdt set /chosen xen,xen-bootargs "console=3Ddtuart dtuart=3Dserial0
dom0_mem=3D768M dom0_max_vcpus=3D2 bootscrub=3D0 vwfi=3Dnative sched=3Dnull=
"
fdt mknod /chosen dom0
fdt set /chosen/dom0 compatible  "xen,linux-zimage" "xen,multiboot-module"
"multiboot,module"
fdt set /chosen/dom0 reg <0x0 0x42000000 0x0 0x87C200 >
fdt set /chosen xen,dom0-bootargs "console=3Dtty1 root=3D/dev/mmcblk1p4 rw
rootwait clk_ignore_unused --no-log"
bootm 0x51000000 - 0x5ffec000

and I've rebooted the Chromebook using this command :

SMDK5250 # mmc dev 1
SMDK5250 # ext2load mmc 1:3 0x50000000 bootxen.scr; source 0x50000000


This is the memory available on the machine after having booted the
machine ready for xen :

# free -m
              total        used        free      shared  buff/cache
  available
Mem:             741         329         108           7         332
        412
Swap:              0           0           0

Thanks in advance for any support.

On Wed, Nov 15, 2023 at 8:41=E2=80=AFPM Mario Marietto <marietto2008@gmail.=
com>
wrote:

> ---> So I plan to do some tests and see what DMA ops the other devices us=
e
> if swiotlb-xen is disabled and also what DMA ops the other devices use wh=
en
> Linux runs on the Chromebook on bare metal without Xen. If these tests sh=
ow
> the problem can be fixed by disabling swiotlb-xen with a Kconfig  or
> command line option, I will propose v2 to implement that as a solution.
>
> and this could bring you to the next level of our project. Try to install
> xen on different devices. At least it is my next project. I've already
> bought two arm64 phones where xen can be installed because there is a hac=
k
> to overcome the bootloader / hypervisor protection mechanism. For sure I
> hope that you also want to buy them to work on this together. And don't
> worry about how much money they will cost you. I've bought them used and
> refurbished. Or you could buy only one,that I suggest could be the SM-A60=
0G
> (Samsung Galaxy A6) with Exynos7870. Please start looking for it at a goo=
d
> price.
>
> On Wed, Nov 15, 2023 at 6:57=E2=80=AFPM Chuck Zmudzinski <brchuckz@netsca=
pe.net>
> wrote:
>
>> On 11/14/2023 5:20 PM, Stefano Stabellini wrote:
>> > On Tue, 14 Nov 2023, Robin Murphy wrote:
>> >> On 11/11/2023 6:45 pm, Chuck Zmudzinski wrote:
>> >> > Enabling the new option, ARM_DMA_USE_IOMMU_XEN, fixes this error wh=
en
>> >> > attaching the Exynos mixer in Linux dom0 on Xen on the Chromebook
>> Snow
>> >> > (and probably on other devices that use the Exynos mixer):
>> >> >
>> >> > [drm] Exynos DRM: using 14400000.fimd device for DMA mapping
>> operations
>> >> > exynos-drm exynos-drm: bound 14400000.fimd (ops 0xc0d96354)
>> >> > exynos-mixer 14450000.mixer: [drm:exynos_drm_register_dma] *ERROR*
>> Device
>> >> >                               14450000.mixer lacks support for IOMM=
U
>> >> > exynos-drm exynos-drm: failed to bind 14450000.mixer (ops
>> 0xc0d97554): -22
>> >> > exynos-drm exynos-drm: adev bind failed: -22
>> >> > exynos-dp: probe of 145b0000.dp-controller failed with error -22
>> >> >
>> >> > Linux normally uses xen_swiotlb_dma_ops for DMA for all devices whe=
n
>> >> > xen_swiotlb is detected even when Xen exposes an IOMMU to Linux.
>> Enabling
>> >> > the new config option allows devices such as the Exynos mixer to us=
e
>> the
>> >> > IOMMU instead of xen_swiotlb_dma_ops for DMA and this fixes the
>> error.
>> >> >
>> >> > The new config option is not set by default because it is likely so=
me
>> >> > devices that use IOMMU for DMA on Xen will cause DMA errors and
>> memory
>> >> > corruption when Xen PV block and network drivers are in use on the
>> system.
>> >> >
>> >> > Link:
>> >> >
>> https://lore.kernel.org/xen-devel/acfab1c5-eed1-4930-8c70-8681e256c820@n=
etscape.net/
>> >> >
>> >> > Signed-off-by: Chuck Zmudzinski <brchuckz@aol.com>
>> >> > ---
>> >> > The reported error with the Exynos mixer is not fixed by default by
>> adding
>> >> > a second patch to select the new option in the Kconfig definition
>> for the
>> >> > Exynos mixer if EXYNOS_IOMMU and SWIOTLB_XEN are enabled because it
>> is
>> >> > not certain setting the config option is suitable for all cases. So
>> it is
>> >> > necessary to explicitly select the new config option during the
>> config
>> >> > stage of the Linux kernel build to fix the reported error or simila=
r
>> >> > errors that have the same cause of lack of support for IOMMU on Xen=
.
>> This
>> >> > is necessary to avoid any regressions that might be caused by
>> enabling the
>> >> > new option by default for the Exynos mixer.
>> >> >   arch/arm/mm/dma-mapping.c |  6 ++++++
>> >> >   drivers/xen/Kconfig       | 16 ++++++++++++++++
>> >> >   2 files changed, 22 insertions(+)
>> >> >
>> >> > diff --git a/arch/arm/mm/dma-mapping.c b/arch/arm/mm/dma-mapping.c
>> >> > index 5409225b4abc..ca04fdf01be3 100644
>> >> > --- a/arch/arm/mm/dma-mapping.c
>> >> > +++ b/arch/arm/mm/dma-mapping.c
>> >> > @@ -1779,6 +1779,12 @@ void arch_setup_dma_ops(struct device *dev,
>> u64
>> >> > dma_base, u64 size,
>> >> >    if (iommu)
>> >> >            arm_setup_iommu_dma_ops(dev, dma_base, size, iommu,
>> coherent);
>> >> >   +#ifdef CONFIG_ARM_DMA_USE_IOMMU_XEN
>> >>
>> >> FWIW I don't think this really needs a config option - if Xen *has*
>> made an
>> >> IOMMU available, then there isn't really much reason not to use it,
>> and if for
>> >> some reason someone really didn't want to then they could simply
>> disable the
>> >> IOMMU driver anyway.
>> >
>> > The fact that the Exynos IOMMU is exposed to Linux is a mistake. Xen
>> > doesn't recognize the Exynos IOMMU (it is not one of the IOMMUs Xen ha=
s
>> > a driver for) so it assigns the IOMMU to Dom0. It doesn't happen on
>> > purpose, it happens by accident. Certain things are going to break,
>> > specifically I am fairly certain PV drivers are going to break.
>> >
>> > If Xen recognized the Exynos IOMMU as an IOMMU it would probably hide =
it
>> > from Dom0. (Today Xen doesn't have a list of IOMMUs Xen recognizes but
>> > doesn't have a driver for.)
>> >
>> > I think it is OK for Chuck and others to play around with this
>> > configuration but I wouldn't add a new kconfig option to Linux to
>> > support it.
>> >
>> > If we do want a kconfig option, I would add a kconfig option or Linux
>> > command line option to enable/disable swiotlb-xen. Basically a way to
>> > force-enable or force-disable xen_swiotlb_detect(). That could be
>> > generally useful for debugging and would also solve the problem here a=
s
>> > it could be used to force-disable swiotlb-xen. I would imagine that th=
e
>> > end result is the same: the default ops (iommu_ops) are used.
>>
>> I will try this. It isn't exactly what I have tested until now because
>> in all my tests so far all the DMA capable devices on the Chromebook use
>> swioltlb-xen except for the two devices that need to use the Exynos IOMM=
U
>> to fix the error with the Exynos mixer.
>>
>> >
>> >
>> >
>> >> > +  if (dev->dma_ops =3D=3D &iommu_ops) {
>> >> > +          dev->archdata.dma_ops_setup =3D true;
>> >>
>> >> The existing assignment is effectively unconditional by this point
>> anyway, so
>> >> could probably just be moved earlier to save duplicating it (or
>> perhaps just
>> >> make the xen_setup_dma_ops() call conditional instead to save the
>> early return
>> >> as well).
>> >>
>> >> However, are the IOMMU DMA ops really compatible with Xen? The
>> comments about
>> >> hypercalls and foreign memory in xen_arch_need_swiotlb() leave me
>> concerned
>> >> that assuming non-coherent DMA to any old Dom0 page is OK might not
>> actually
>> >> work in general :/
>> >
>> > Xen has (not yet upstreaming) support for nested IOMMU (Xen uses the
>> > IOMMU while also it exposes a virtual IOMMU to guests.) In those cases
>> > the iommu_ops should be compatible with Xen.
>> >
>> > swiotlb-xen is useful in cases where there is no IOMMU on the platform
>> > (or the IOMMU doesn't cover all DMA-capable devices) and Dom0 is 1:1
>> > mapped. See include/xen/arm/swiotlb-xen.h:xen_swiotlb_detect. If Dom0 =
is
>> > not 1:1 mapped swiotlb-xen doesn't work. If an IOMMU is present and
>> > covers all DMA-capable devices, then swiotlb-xen is superfluous.
>>
>> It seems that swiotlb-xen works on this Chromebook since all but two
>> of the DMA capable devices use it when configured with the Kconfig optio=
n
>> added here and it seems to work fine so I presume Dom0 is 1:1 mapped as
>> expected. It is possible that on this device, the IOMMU is only covering
>> the two devices that need to use the Exynos IOMMU in the tests I have
>> done.
>> There are many other DMA capable devices that use swiotlb-xen DMA ops
>> on Xen, but I have not checked what DMA ops the other devices use when
>> Linux runs on the Chromebook on bare metal without Xen.
>>
>> So I plan to do some tests and see what DMA ops the other devices use if
>> swiotlb-xen is disabled and also what DMA ops the other devices use when
>> Linux runs on the Chromebook on bare metal without Xen. If these tests
>> show the problem can be fixed by disabling swiotlb-xen with a Kconfig  o=
r
>> command line option, I will propose v2 to implement that as a solution.
>>
>> > This last case is the interesting case for virtual IOMMU and Linux
>> usage of
>> > iommu_ops.
>>
>
>
> --
> Mario.
>


--=20
Mario.

--0000000000001ee4a3060a41f85f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hello to everyone.</div><div><p dir=3D"auto">I&#39;m =
trying to boot Linux 6.1.y as Xen dom0 on
 the Chromebook xe303c12, aka Snow and configure and start a very basic=20
domU guest,following the Chuck&#39;s tutorial,located here : <br></p></div>=
<div><a href=3D"https://github.com/mobile-virt/u-boot-chromebook-xe303c12/t=
ree/chromebook/xen#starting-a-domu-guest" target=3D"_blank">https://github.=
com/mobile-virt/u-boot-chromebook-xe303c12/tree/chromebook/xen#starting-a-d=
omu-guest</a></div><div><br></div><div>What I did has been to carefully fol=
low his instructions,but I haven&#39;t found a solution to fix this problem=
,yet :</div><div><br></div><div><div dir=3D"ltr"><div><span style=3D"font-f=
amily:monospace"><span style=3D"color:rgb(0,0,0);background-color:rgb(255,2=
55,255)"># sudo xl create devuan.cfg -c
</span><br></span></div><div><span style=3D"font-family:monospace"><br></sp=
an></div><div><span style=3D"font-family:monospace">Parsing config from dev=
uan.cfg
<br>libxl: error: libxl_create.c:720:libxl__domain_make: domain creation fa=
il: Permission denied
<br>libxl: error: libxl_create.c:1309:initiate_domain_create: cannot make d=
omain: -3<br></span></div><div><span style=3D"font-family:monospace"><br></=
span></div><div><div>This is my devuan.cfg file :</div><div><br></div><div>=
<span style=3D"font-family:monospace"><span style=3D"color:rgb(0,0,0);backg=
round-color:rgb(255,255,255)">kernel =3D &#39;/Dati/xen/kernels/zImage-6.1.=
59-stb-xen-cbe+&#39;
</span><br>memory =3D &#39;512&#39;
<br>name =3D &#39;Devuan&#39;
<br>vcpus =3D &#39;1&#39;
<br>disk =3D [ &#39;/Dati/xen/devuan.img,,xvda,w&#39; ]
<br>extra =3D &#39;console=3Dhvc0 root=3D/dev/xvda rw init=3D/sbin/init xen=
-fbfront.video=3D24,1024,768&#39;<br></span></div><div><br></div><div>(I ha=
ve tried also with root=3D/dev/xvda1 and root=3D/dev/xvda2,but leaving disk=
 =3D [ &#39;/Dati/xen/devuan.img,,xvda,w&#39; ]
and not xvda1 or 2)<br></div><div><br></div><span style=3D"font-family:mono=
space"></span></div></div><div><div class=3D"gmail-adm"><div id=3D"gmail-q_=
129" class=3D"gmail-ajR gmail-h4"><div class=3D"gmail-ajT">I have no=C2=A0 =
idea about the reason(s) I always get that error,but I don&#39;t think it i=
s caused by a wrong creation of the devuan.img file. Can someone point me i=
n the right direction to understand what could be wrong ? I haven&#39;t fou=
nd any useful information on the internet.</div><div class=3D"gmail-ajT"><b=
r></div><div class=3D"gmail-ajT">This is bootxen.scr file where I have conf=
igured dom0_mem=3D768 :<br></div><div class=3D"gmail-ajT"><br></div><div cl=
ass=3D"gmail-ajT">mmc dev 1<br>ext2load mmc 1:3 0x42000000 zImage-6.6.0-xen=
-iommu-dma-on-xen<br>ext2load mmc 1:3 0x51000000 xen-4.17-armhf-armmp-0x510=
04000.ub<br>ext2load mmc 1:3 0x5ffec000 exynos5250-snow.dtb<br>fdt addr 0x5=
ffec000<br>fdt resize 1024<br>fdt set /chosen \#address-cells &lt;0x2&gt;<b=
r>fdt set /chosen \#size-cells &lt;0x2&gt;<br>fdt set /chosen xen,xen-boota=
rgs &quot;console=3Ddtuart dtuart=3Dserial0 dom0_mem=3D768M dom0_max_vcpus=
=3D2 bootscrub=3D0 vwfi=3Dnative sched=3Dnull&quot;<br>fdt mknod /chosen do=
m0<br>fdt set /chosen/dom0 compatible =C2=A0&quot;xen,linux-zimage&quot; &q=
uot;xen,multiboot-module&quot; &quot;multiboot,module&quot;<br>fdt set /cho=
sen/dom0 reg &lt;0x0 0x42000000 0x0 0x87C200 &gt;<br>fdt set /chosen xen,do=
m0-bootargs &quot;console=3Dtty1 root=3D/dev/mmcblk1p4 rw rootwait clk_igno=
re_unused --no-log&quot;<br>bootm 0x51000000 - 0x5ffec000</div><div class=
=3D"gmail-ajT"><br></div><div class=3D"gmail-ajT">and I&#39;ve rebooted the=
 Chromebook using this command :</div><div class=3D"gmail-ajT"><br></div><d=
iv class=3D"gmail-ajT"><pre class=3D"gmail-notranslate"><code>SMDK5250 # mm=
c dev 1
SMDK5250 # ext2load mmc 1:3 0x50000000 bootxen.scr; source 0x50000000<br><b=
r></code></pre><pre class=3D"gmail-notranslate"><code><br>This is the memor=
y available on the machine after having booted the machine ready for xen :<=
br><br></code></pre></div><div class=3D"gmail-ajT"><span style=3D"font-fami=
ly:monospace"><span style=3D"color:rgb(0,0,0);background-color:rgb(255,255,=
255)"># free -m
</span><br> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0total =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0used =
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0free =C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0shared =C2=A0buff/cache =C2=A0=C2=A0available
<br>Mem: =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0741 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0329 =C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0108 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A07 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0332 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0412
<br>Swap: =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A00 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A00 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A00</span></=
div><div class=3D"gmail-ajT"><span style=3D"font-family:monospace"><br></sp=
an></div><div class=3D"gmail-ajT"><span style=3D"font-family:monospace">Tha=
nks in advance for any support. <br></span></div></div></div></div></div></=
div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On=
 Wed, Nov 15, 2023 at 8:41=E2=80=AFPM Mario Marietto &lt;<a href=3D"mailto:=
marietto2008@gmail.com" target=3D"_blank">marietto2008@gmail.com</a>&gt; wr=
ote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px=
 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D=
"ltr"><div>---&gt; So I plan to do some tests and see what DMA ops the othe=
r devices use if swiotlb-xen is disabled and also what DMA ops the other de=
vices use when
Linux runs on the Chromebook on bare metal without Xen. If these tests show=
 the problem can be fixed by disabling swiotlb-xen with a Kconfig=C2=A0 or
command line option, I will propose v2 to implement that as a solution.</di=
v><div><br></div><div>and this could bring you to the next level of our pro=
ject. Try to install xen on different devices. At least it is my next proje=
ct. I&#39;ve already bought two arm64 phones where xen can be installed bec=
ause there is a hack to overcome the bootloader / hypervisor protection mec=
hanism. For sure I hope that you also want to buy them to work on this toge=
ther. And don&#39;t worry about how much money they will cost you. I&#39;ve=
 bought them used and refurbished. Or you could buy only one,that I suggest=
 could be the SM-A600G (Samsung Galaxy A6) with Exynos7870. Please start lo=
oking for it at a good price.=C2=A0 </div></div><br><div class=3D"gmail_quo=
te"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Nov 15, 2023 at 6:57=E2=
=80=AFPM Chuck Zmudzinski &lt;<a href=3D"mailto:brchuckz@netscape.net" targ=
et=3D"_blank">brchuckz@netscape.net</a>&gt; wrote:<br></div><blockquote cla=
ss=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid =
rgb(204,204,204);padding-left:1ex">On 11/14/2023 5:20 PM, Stefano Stabellin=
i wrote:<br>
&gt; On Tue, 14 Nov 2023, Robin Murphy wrote:<br>
&gt;&gt; On 11/11/2023 6:45 pm, Chuck Zmudzinski wrote:<br>
&gt;&gt; &gt; Enabling the new option, ARM_DMA_USE_IOMMU_XEN, fixes this er=
ror when<br>
&gt;&gt; &gt; attaching the Exynos mixer in Linux dom0 on Xen on the Chrome=
book Snow<br>
&gt;&gt; &gt; (and probably on other devices that use the Exynos mixer):<br=
>
&gt;&gt; &gt; <br>
&gt;&gt; &gt; [drm] Exynos DRM: using 14400000.fimd device for DMA mapping =
operations<br>
&gt;&gt; &gt; exynos-drm exynos-drm: bound 14400000.fimd (ops 0xc0d96354)<b=
r>
&gt;&gt; &gt; exynos-mixer 14450000.mixer: [drm:exynos_drm_register_dma] *E=
RROR* Device<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A014450000.mixer lacks suppo=
rt for IOMMU<br>
&gt;&gt; &gt; exynos-drm exynos-drm: failed to bind 14450000.mixer (ops 0xc=
0d97554): -22<br>
&gt;&gt; &gt; exynos-drm exynos-drm: adev bind failed: -22<br>
&gt;&gt; &gt; exynos-dp: probe of 145b0000.dp-controller failed with error =
-22<br>
&gt;&gt; &gt; <br>
&gt;&gt; &gt; Linux normally uses xen_swiotlb_dma_ops for DMA for all devic=
es when<br>
&gt;&gt; &gt; xen_swiotlb is detected even when Xen exposes an IOMMU to Lin=
ux. Enabling<br>
&gt;&gt; &gt; the new config option allows devices such as the Exynos mixer=
 to use the<br>
&gt;&gt; &gt; IOMMU instead of xen_swiotlb_dma_ops for DMA and this fixes t=
he error.<br>
&gt;&gt; &gt; <br>
&gt;&gt; &gt; The new config option is not set by default because it is lik=
ely some<br>
&gt;&gt; &gt; devices that use IOMMU for DMA on Xen will cause DMA errors a=
nd memory<br>
&gt;&gt; &gt; corruption when Xen PV block and network drivers are in use o=
n the system.<br>
&gt;&gt; &gt; <br>
&gt;&gt; &gt; Link:<br>
&gt;&gt; &gt; <a href=3D"https://lore.kernel.org/xen-devel/acfab1c5-eed1-49=
30-8c70-8681e256c820@netscape.net/" rel=3D"noreferrer" target=3D"_blank">ht=
tps://lore.kernel.org/xen-devel/acfab1c5-eed1-4930-8c70-8681e256c820@netsca=
pe.net/</a><br>
&gt;&gt; &gt; <br>
&gt;&gt; &gt; Signed-off-by: Chuck Zmudzinski &lt;<a href=3D"mailto:brchuck=
z@aol.com" target=3D"_blank">brchuckz@aol.com</a>&gt;<br>
&gt;&gt; &gt; ---<br>
&gt;&gt; &gt; The reported error with the Exynos mixer is not fixed by defa=
ult by adding<br>
&gt;&gt; &gt; a second patch to select the new option in the Kconfig defini=
tion for the<br>
&gt;&gt; &gt; Exynos mixer if EXYNOS_IOMMU and SWIOTLB_XEN are enabled beca=
use it is<br>
&gt;&gt; &gt; not certain setting the config option is suitable for all cas=
es. So it is<br>
&gt;&gt; &gt; necessary to explicitly select the new config option during t=
he config<br>
&gt;&gt; &gt; stage of the Linux kernel build to fix the reported error or =
similar<br>
&gt;&gt; &gt; errors that have the same cause of lack of support for IOMMU =
on Xen. This<br>
&gt;&gt; &gt; is necessary to avoid any regressions that might be caused by=
 enabling the<br>
&gt;&gt; &gt; new option by default for the Exynos mixer.<br>
&gt;&gt; &gt;=C2=A0 =C2=A0arch/arm/mm/dma-mapping.c |=C2=A0 6 ++++++<br>
&gt;&gt; &gt;=C2=A0 =C2=A0drivers/xen/Kconfig=C2=A0 =C2=A0 =C2=A0 =C2=A0| 1=
6 ++++++++++++++++<br>
&gt;&gt; &gt;=C2=A0 =C2=A02 files changed, 22 insertions(+)<br>
&gt;&gt; &gt; <br>
&gt;&gt; &gt; diff --git a/arch/arm/mm/dma-mapping.c b/arch/arm/mm/dma-mapp=
ing.c<br>
&gt;&gt; &gt; index 5409225b4abc..ca04fdf01be3 100644<br>
&gt;&gt; &gt; --- a/arch/arm/mm/dma-mapping.c<br>
&gt;&gt; &gt; +++ b/arch/arm/mm/dma-mapping.c<br>
&gt;&gt; &gt; @@ -1779,6 +1779,12 @@ void arch_setup_dma_ops(struct device =
*dev, u64<br>
&gt;&gt; &gt; dma_base, u64 size,<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 if (iommu)<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 arm_setup_iommu_dma_=
ops(dev, dma_base, size, iommu, coherent);<br>
&gt;&gt; &gt;=C2=A0 =C2=A0+#ifdef CONFIG_ARM_DMA_USE_IOMMU_XEN<br>
&gt;&gt; <br>
&gt;&gt; FWIW I don&#39;t think this really needs a config option - if Xen =
*has* made an<br>
&gt;&gt; IOMMU available, then there isn&#39;t really much reason not to us=
e it, and if for<br>
&gt;&gt; some reason someone really didn&#39;t want to then they could simp=
ly disable the<br>
&gt;&gt; IOMMU driver anyway.<br>
&gt; <br>
&gt; The fact that the Exynos IOMMU is exposed to Linux is a mistake. Xen<b=
r>
&gt; doesn&#39;t recognize the Exynos IOMMU (it is not one of the IOMMUs Xe=
n has<br>
&gt; a driver for) so it assigns the IOMMU to Dom0. It doesn&#39;t happen o=
n<br>
&gt; purpose, it happens by accident. Certain things are going to break,<br=
>
&gt; specifically I am fairly certain PV drivers are going to break.<br>
&gt; <br>
&gt; If Xen recognized the Exynos IOMMU as an IOMMU it would probably hide =
it<br>
&gt; from Dom0. (Today Xen doesn&#39;t have a list of IOMMUs Xen recognizes=
 but<br>
&gt; doesn&#39;t have a driver for.)<br>
&gt; <br>
&gt; I think it is OK for Chuck and others to play around with this<br>
&gt; configuration but I wouldn&#39;t add a new kconfig option to Linux to<=
br>
&gt; support it.<br>
&gt; <br>
&gt; If we do want a kconfig option, I would add a kconfig option or Linux<=
br>
&gt; command line option to enable/disable swiotlb-xen. Basically a way to<=
br>
&gt; force-enable or force-disable xen_swiotlb_detect(). That could be<br>
&gt; generally useful for debugging and would also solve the problem here a=
s<br>
&gt; it could be used to force-disable swiotlb-xen. I would imagine that th=
e<br>
&gt; end result is the same: the default ops (iommu_ops) are used.<br>
<br>
I will try this. It isn&#39;t exactly what I have tested until now because<=
br>
in all my tests so far all the DMA capable devices on the Chromebook use<br=
>
swioltlb-xen except for the two devices that need to use the Exynos IOMMU<b=
r>
to fix the error with the Exynos mixer.<br>
<br>
&gt; <br>
&gt; <br>
&gt; <br>
&gt;&gt; &gt; +=C2=A0 if (dev-&gt;dma_ops =3D=3D &amp;iommu_ops) {<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dev-&gt;archdata.dma_ops_=
setup =3D true;<br>
&gt;&gt; <br>
&gt;&gt; The existing assignment is effectively unconditional by this point=
 anyway, so<br>
&gt;&gt; could probably just be moved earlier to save duplicating it (or pe=
rhaps just<br>
&gt;&gt; make the xen_setup_dma_ops() call conditional instead to save the =
early return<br>
&gt;&gt; as well).<br>
&gt;&gt; <br>
&gt;&gt; However, are the IOMMU DMA ops really compatible with Xen? The com=
ments about<br>
&gt;&gt; hypercalls and foreign memory in xen_arch_need_swiotlb() leave me =
concerned<br>
&gt;&gt; that assuming non-coherent DMA to any old Dom0 page is OK might no=
t actually<br>
&gt;&gt; work in general :/<br>
&gt; <br>
&gt; Xen has (not yet upstreaming) support for nested IOMMU (Xen uses the<b=
r>
&gt; IOMMU while also it exposes a virtual IOMMU to guests.) In those cases=
<br>
&gt; the iommu_ops should be compatible with Xen.<br>
&gt; <br>
&gt; swiotlb-xen is useful in cases where there is no IOMMU on the platform=
<br>
&gt; (or the IOMMU doesn&#39;t cover all DMA-capable devices) and Dom0 is 1=
:1<br>
&gt; mapped. See include/xen/arm/swiotlb-xen.h:xen_swiotlb_detect. If Dom0 =
is<br>
&gt; not 1:1 mapped swiotlb-xen doesn&#39;t work. If an IOMMU is present an=
d<br>
&gt; covers all DMA-capable devices, then swiotlb-xen is superfluous.<br>
<br>
It seems that swiotlb-xen works on this Chromebook since all but two<br>
of the DMA capable devices use it when configured with the Kconfig option<b=
r>
added here and it seems to work fine so I presume Dom0 is 1:1 mapped as<br>
expected. It is possible that on this device, the IOMMU is only covering<br=
>
the two devices that need to use the Exynos IOMMU in the tests I have done.=
<br>
There are many other DMA capable devices that use swiotlb-xen DMA ops<br>
on Xen, but I have not checked what DMA ops the other devices use when<br>
Linux runs on the Chromebook on bare metal without Xen.<br>
<br>
So I plan to do some tests and see what DMA ops the other devices use if<br=
>
swiotlb-xen is disabled and also what DMA ops the other devices use when<br=
>
Linux runs on the Chromebook on bare metal without Xen. If these tests<br>
show the problem can be fixed by disabling swiotlb-xen with a Kconfig=C2=A0=
 or<br>
command line option, I will propose v2 to implement that as a solution.<br>
<br>
&gt; This last case is the interesting case for virtual IOMMU and Linux usa=
ge of<br>
&gt; iommu_ops.<br>
</blockquote></div><br clear=3D"all"><br><span class=3D"gmail_signature_pre=
fix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature">Mario.<br></d=
iv>
</blockquote></div><br clear=3D"all"><br><span class=3D"gmail_signature_pre=
fix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature">Mario.<br></d=
iv>

--0000000000001ee4a3060a41f85f--

