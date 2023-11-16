Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AF4DE7EE3FD
	for <lists+xen-devel@lfdr.de>; Thu, 16 Nov 2023 16:14:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.634457.989904 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r3e4L-0005nH-DR; Thu, 16 Nov 2023 15:14:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 634457.989904; Thu, 16 Nov 2023 15:14:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r3e4L-0005km-AM; Thu, 16 Nov 2023 15:14:13 +0000
Received: by outflank-mailman (input) for mailman id 634457;
 Thu, 16 Nov 2023 15:14:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6/O6=G5=gmail.com=marietto2008@srs-se1.protection.inumbo.net>)
 id 1r3e4I-0005ke-TM
 for xen-devel@lists.xenproject.org; Thu, 16 Nov 2023 15:14:11 +0000
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [2a00:1450:4864:20::635])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ca569970-8492-11ee-98db-6d05b1d4d9a1;
 Thu, 16 Nov 2023 16:14:09 +0100 (CET)
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-9e5dd91b0acso131921266b.1
 for <xen-devel@lists.xenproject.org>; Thu, 16 Nov 2023 07:14:09 -0800 (PST)
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
X-Inumbo-ID: ca569970-8492-11ee-98db-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700147648; x=1700752448; darn=lists.xenproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=pRST7lLFO3fb4FSg9ppULNLtbSlRe/Jg/LvSC/zBjSc=;
        b=Xrb5jmO4k8C8k1IwYDpbTDhIZNmMUi/LafrJyEMkjOyiiBAtRwDwuK4w67D78pWq1f
         3/bVyXszsm1Jsy2J9ZpfKmn0Vt8JNmFR9AGLpIn8OGydSTdcfkYWaH7TCkM9zeHtlOMg
         ob0qAA+zwlGDPiE5cr+iQEe32zxknkshmCB6rrCM9JDHJ/QhQg3PpGKw0+mmbXrCmSIr
         CB98PD/btpjrMmw/1rvTXWG8KDP3aFruV1bFsY3yZYNWp4zlC6vFkvw721sL1lGTExV5
         j7M5xvAFzrV8Piu1emLtthQDNgLVZ8Q0aeSOIKllFJet35PoeyBH5FqUXTvB09vAGLXq
         F3JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700147648; x=1700752448;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pRST7lLFO3fb4FSg9ppULNLtbSlRe/Jg/LvSC/zBjSc=;
        b=oCe6x6IZ47FLH7qqX4uPKa2OyjYYt4j8x52vO4QRWxNfES7dWun85Bhbu+sQANZx+1
         Cz/iV/B74Qx0EFifbscULNZR4J7vDMPCzJ9gAKKvVBOyn1j0PULUYKvV3avLBU2w9Tx/
         nSDZ/bHmEYwm59TML1osbWnl2n4rU+6vUKmIFw40xKjvx50iGPB1ZtNDOaZrChvfvNpk
         g+q+EPppgRZ4oAmooDC+yOfK/wbfXgN7Dx4zGy0qzHxAyyIvUZPnq+e8UKAhUEGKSTTM
         3au4/Jugcjuzrh/Jo+00rIWbeneSvv2URXzzAZmmUkL23ogfzsYo+6IXJ0Dk+AwGHlGp
         R+3w==
X-Gm-Message-State: AOJu0YxocR3vP0L1U1Z/7PNqN8qtuIW88sPOqTFj51NqtWXshgb9L0lZ
	21I/CtpZ5dnP+b45V8qAxmWScWt57CWkKDnmlvg=
X-Google-Smtp-Source: AGHT+IGrQr3Bdz+X4PxRv4xamrARgXMjlvNm+ITqssgGDSRAjPFfB161KOz0TAJwRgU36a5Ui6rYFYsYXiTL8B3Rdto=
X-Received: by 2002:a17:907:171e:b0:9ba:2fe3:c97e with SMTP id
 le30-20020a170907171e00b009ba2fe3c97emr12037966ejc.11.1700147648083; Thu, 16
 Nov 2023 07:14:08 -0800 (PST)
MIME-Version: 1.0
References: <20231111184538.2371-1-brchuckz.ref@aol.com> <20231111184538.2371-1-brchuckz@aol.com>
 <e5ebfde9-7a74-4908-b0b9-db47c4e76315@arm.com> <alpine.DEB.2.22.394.2311141407140.160649@ubuntu-linux-20-04-desktop>
 <edefba96-0a17-4b3d-992c-6bfe9e62bf97@netscape.net> <CA+1FSih45=vtpa+bfYGDFEXd6u=+V8wLsBoo8=2rmj7V0Lj_Ow@mail.gmail.com>
 <CA+1FSiiuFMvZAHHXFQHRF=gQSoZTxLEZSDYfCgw8j6HiGkkDXw@mail.gmail.com>
In-Reply-To: <CA+1FSiiuFMvZAHHXFQHRF=gQSoZTxLEZSDYfCgw8j6HiGkkDXw@mail.gmail.com>
From: Mario Marietto <marietto2008@gmail.com>
Date: Thu, 16 Nov 2023 16:13:31 +0100
Message-ID: <CA+1FSij82weDFfsfBQpnPjQJ9K6JVhHxF4JTOKPjwm-8SUrD=A@mail.gmail.com>
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
Content-Type: multipart/alternative; boundary="000000000000a13c62060a4678ae"

--000000000000a13c62060a4678ae
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I've found a similar error on this post,made on 2012 :

https://groups.google.com/g/qubes-devel/c/W1lM4ELuVVI


and according to what has been asked there,I want to post some further
relevant informations to help you to help me to debug
the problem :


root@devuan-bunsen:/Dati/xen# xl dmesg --->
https://pastebin.ubuntu.com/p/YvtdCPwMWW/

root@devuan-bunsen:/Dati/xen# dmesg --->
https://pastebin.ubuntu.com/p/9cNxCTXVrd/

root@devuan-bunsen:/var/log/xen# mousepad xenstored-access.log --->
https://pastebin.ubuntu.com/p/RTPBG9nS8R/

root@devuan-bunsen:/var/log/xen# mousepad xenstored.log --->
https://pastebin.ubuntu.com/p/T354ts33nP/

very thanks.


On Thu, Nov 16, 2023 at 10:51=E2=80=AFAM Mario Marietto <marietto2008@gmail=
.com>
wrote:

> Hello to everyone.
>
> I'm trying to boot Linux 6.1.y as Xen dom0 on the Chromebook xe303c12, ak=
a
> Snow and configure and start a very basic domU guest,following the Chuck'=
s
> tutorial,located here :
>
> https://github.com/mobile-virt/u-boot-chromebook-xe303c12/tree/chromebook=
/xen#starting-a-domu-guest
>
> What I did has been to carefully follow his instructions,but I haven't
> found a solution to fix this problem,yet :
>
> # sudo xl create devuan.cfg -c
>
> Parsing config from devuan.cfg
> libxl: error: libxl_create.c:720:libxl__domain_make: domain creation fail=
:
> Permission denied
> libxl: error: libxl_create.c:1309:initiate_domain_create: cannot make
> domain: -3
>
> This is my devuan.cfg file :
>
> kernel =3D '/Dati/xen/kernels/zImage-6.1.59-stb-xen-cbe+'
> memory =3D '512'
> name =3D 'Devuan'
> vcpus =3D '1'
> disk =3D [ '/Dati/xen/devuan.img,,xvda,w' ]
> extra =3D 'console=3Dhvc0 root=3D/dev/xvda rw init=3D/sbin/init
> xen-fbfront.video=3D24,1024,768'
>
> (I have tried also with root=3D/dev/xvda1 and root=3D/dev/xvda2,but leavi=
ng
> disk =3D [ '/Dati/xen/devuan.img,,xvda,w' ] and not xvda1 or 2)
>
> I have no  idea about the reason(s) I always get that error,but I don't
> think it is caused by a wrong creation of the devuan.img file. Can someon=
e
> point me in the right direction to understand what could be wrong ? I
> haven't found any useful information on the internet.
>
> This is bootxen.scr file where I have configured dom0_mem=3D768 :
>
> mmc dev 1
> ext2load mmc 1:3 0x42000000 zImage-6.6.0-xen-iommu-dma-on-xen
> ext2load mmc 1:3 0x51000000 xen-4.17-armhf-armmp-0x51004000.ub
> ext2load mmc 1:3 0x5ffec000 exynos5250-snow.dtb
> fdt addr 0x5ffec000
> fdt resize 1024
> fdt set /chosen \#address-cells <0x2>
> fdt set /chosen \#size-cells <0x2>
> fdt set /chosen xen,xen-bootargs "console=3Ddtuart dtuart=3Dserial0
> dom0_mem=3D768M dom0_max_vcpus=3D2 bootscrub=3D0 vwfi=3Dnative sched=3Dnu=
ll"
> fdt mknod /chosen dom0
> fdt set /chosen/dom0 compatible  "xen,linux-zimage" "xen,multiboot-module=
"
> "multiboot,module"
> fdt set /chosen/dom0 reg <0x0 0x42000000 0x0 0x87C200 >
> fdt set /chosen xen,dom0-bootargs "console=3Dtty1 root=3D/dev/mmcblk1p4 r=
w
> rootwait clk_ignore_unused --no-log"
> bootm 0x51000000 - 0x5ffec000
>
> and I've rebooted the Chromebook using this command :
>
> SMDK5250 # mmc dev 1
> SMDK5250 # ext2load mmc 1:3 0x50000000 bootxen.scr; source 0x50000000
>
>
> This is the memory available on the machine after having booted the machi=
ne ready for xen :
>
> # free -m
>               total        used        free      shared  buff/cache
>   available
> Mem:             741         329         108           7         332
>         412
> Swap:              0           0           0
>
> Thanks in advance for any support.
>
> On Wed, Nov 15, 2023 at 8:41=E2=80=AFPM Mario Marietto <marietto2008@gmai=
l.com>
> wrote:
>
>> ---> So I plan to do some tests and see what DMA ops the other devices
>> use if swiotlb-xen is disabled and also what DMA ops the other devices u=
se
>> when Linux runs on the Chromebook on bare metal without Xen. If these te=
sts
>> show the problem can be fixed by disabling swiotlb-xen with a Kconfig  o=
r
>> command line option, I will propose v2 to implement that as a solution.
>>
>> and this could bring you to the next level of our project. Try to instal=
l
>> xen on different devices. At least it is my next project. I've already
>> bought two arm64 phones where xen can be installed because there is a ha=
ck
>> to overcome the bootloader / hypervisor protection mechanism. For sure I
>> hope that you also want to buy them to work on this together. And don't
>> worry about how much money they will cost you. I've bought them used and
>> refurbished. Or you could buy only one,that I suggest could be the SM-A6=
00G
>> (Samsung Galaxy A6) with Exynos7870. Please start looking for it at a go=
od
>> price.
>>
>> On Wed, Nov 15, 2023 at 6:57=E2=80=AFPM Chuck Zmudzinski <brchuckz@netsc=
ape.net>
>> wrote:
>>
>>> On 11/14/2023 5:20 PM, Stefano Stabellini wrote:
>>> > On Tue, 14 Nov 2023, Robin Murphy wrote:
>>> >> On 11/11/2023 6:45 pm, Chuck Zmudzinski wrote:
>>> >> > Enabling the new option, ARM_DMA_USE_IOMMU_XEN, fixes this error
>>> when
>>> >> > attaching the Exynos mixer in Linux dom0 on Xen on the Chromebook
>>> Snow
>>> >> > (and probably on other devices that use the Exynos mixer):
>>> >> >
>>> >> > [drm] Exynos DRM: using 14400000.fimd device for DMA mapping
>>> operations
>>> >> > exynos-drm exynos-drm: bound 14400000.fimd (ops 0xc0d96354)
>>> >> > exynos-mixer 14450000.mixer: [drm:exynos_drm_register_dma] *ERROR*
>>> Device
>>> >> >                               14450000.mixer lacks support for IOM=
MU
>>> >> > exynos-drm exynos-drm: failed to bind 14450000.mixer (ops
>>> 0xc0d97554): -22
>>> >> > exynos-drm exynos-drm: adev bind failed: -22
>>> >> > exynos-dp: probe of 145b0000.dp-controller failed with error -22
>>> >> >
>>> >> > Linux normally uses xen_swiotlb_dma_ops for DMA for all devices wh=
en
>>> >> > xen_swiotlb is detected even when Xen exposes an IOMMU to Linux.
>>> Enabling
>>> >> > the new config option allows devices such as the Exynos mixer to
>>> use the
>>> >> > IOMMU instead of xen_swiotlb_dma_ops for DMA and this fixes the
>>> error.
>>> >> >
>>> >> > The new config option is not set by default because it is likely
>>> some
>>> >> > devices that use IOMMU for DMA on Xen will cause DMA errors and
>>> memory
>>> >> > corruption when Xen PV block and network drivers are in use on the
>>> system.
>>> >> >
>>> >> > Link:
>>> >> >
>>> https://lore.kernel.org/xen-devel/acfab1c5-eed1-4930-8c70-8681e256c820@=
netscape.net/
>>> >> >
>>> >> > Signed-off-by: Chuck Zmudzinski <brchuckz@aol.com>
>>> >> > ---
>>> >> > The reported error with the Exynos mixer is not fixed by default b=
y
>>> adding
>>> >> > a second patch to select the new option in the Kconfig definition
>>> for the
>>> >> > Exynos mixer if EXYNOS_IOMMU and SWIOTLB_XEN are enabled because i=
t
>>> is
>>> >> > not certain setting the config option is suitable for all cases. S=
o
>>> it is
>>> >> > necessary to explicitly select the new config option during the
>>> config
>>> >> > stage of the Linux kernel build to fix the reported error or simil=
ar
>>> >> > errors that have the same cause of lack of support for IOMMU on
>>> Xen. This
>>> >> > is necessary to avoid any regressions that might be caused by
>>> enabling the
>>> >> > new option by default for the Exynos mixer.
>>> >> >   arch/arm/mm/dma-mapping.c |  6 ++++++
>>> >> >   drivers/xen/Kconfig       | 16 ++++++++++++++++
>>> >> >   2 files changed, 22 insertions(+)
>>> >> >
>>> >> > diff --git a/arch/arm/mm/dma-mapping.c b/arch/arm/mm/dma-mapping.c
>>> >> > index 5409225b4abc..ca04fdf01be3 100644
>>> >> > --- a/arch/arm/mm/dma-mapping.c
>>> >> > +++ b/arch/arm/mm/dma-mapping.c
>>> >> > @@ -1779,6 +1779,12 @@ void arch_setup_dma_ops(struct device *dev,
>>> u64
>>> >> > dma_base, u64 size,
>>> >> >    if (iommu)
>>> >> >            arm_setup_iommu_dma_ops(dev, dma_base, size, iommu,
>>> coherent);
>>> >> >   +#ifdef CONFIG_ARM_DMA_USE_IOMMU_XEN
>>> >>
>>> >> FWIW I don't think this really needs a config option - if Xen *has*
>>> made an
>>> >> IOMMU available, then there isn't really much reason not to use it,
>>> and if for
>>> >> some reason someone really didn't want to then they could simply
>>> disable the
>>> >> IOMMU driver anyway.
>>> >
>>> > The fact that the Exynos IOMMU is exposed to Linux is a mistake. Xen
>>> > doesn't recognize the Exynos IOMMU (it is not one of the IOMMUs Xen h=
as
>>> > a driver for) so it assigns the IOMMU to Dom0. It doesn't happen on
>>> > purpose, it happens by accident. Certain things are going to break,
>>> > specifically I am fairly certain PV drivers are going to break.
>>> >
>>> > If Xen recognized the Exynos IOMMU as an IOMMU it would probably hide
>>> it
>>> > from Dom0. (Today Xen doesn't have a list of IOMMUs Xen recognizes bu=
t
>>> > doesn't have a driver for.)
>>> >
>>> > I think it is OK for Chuck and others to play around with this
>>> > configuration but I wouldn't add a new kconfig option to Linux to
>>> > support it.
>>> >
>>> > If we do want a kconfig option, I would add a kconfig option or Linux
>>> > command line option to enable/disable swiotlb-xen. Basically a way to
>>> > force-enable or force-disable xen_swiotlb_detect(). That could be
>>> > generally useful for debugging and would also solve the problem here =
as
>>> > it could be used to force-disable swiotlb-xen. I would imagine that t=
he
>>> > end result is the same: the default ops (iommu_ops) are used.
>>>
>>> I will try this. It isn't exactly what I have tested until now because
>>> in all my tests so far all the DMA capable devices on the Chromebook us=
e
>>> swioltlb-xen except for the two devices that need to use the Exynos IOM=
MU
>>> to fix the error with the Exynos mixer.
>>>
>>> >
>>> >
>>> >
>>> >> > +  if (dev->dma_ops =3D=3D &iommu_ops) {
>>> >> > +          dev->archdata.dma_ops_setup =3D true;
>>> >>
>>> >> The existing assignment is effectively unconditional by this point
>>> anyway, so
>>> >> could probably just be moved earlier to save duplicating it (or
>>> perhaps just
>>> >> make the xen_setup_dma_ops() call conditional instead to save the
>>> early return
>>> >> as well).
>>> >>
>>> >> However, are the IOMMU DMA ops really compatible with Xen? The
>>> comments about
>>> >> hypercalls and foreign memory in xen_arch_need_swiotlb() leave me
>>> concerned
>>> >> that assuming non-coherent DMA to any old Dom0 page is OK might not
>>> actually
>>> >> work in general :/
>>> >
>>> > Xen has (not yet upstreaming) support for nested IOMMU (Xen uses the
>>> > IOMMU while also it exposes a virtual IOMMU to guests.) In those case=
s
>>> > the iommu_ops should be compatible with Xen.
>>> >
>>> > swiotlb-xen is useful in cases where there is no IOMMU on the platfor=
m
>>> > (or the IOMMU doesn't cover all DMA-capable devices) and Dom0 is 1:1
>>> > mapped. See include/xen/arm/swiotlb-xen.h:xen_swiotlb_detect. If Dom0
>>> is
>>> > not 1:1 mapped swiotlb-xen doesn't work. If an IOMMU is present and
>>> > covers all DMA-capable devices, then swiotlb-xen is superfluous.
>>>
>>> It seems that swiotlb-xen works on this Chromebook since all but two
>>> of the DMA capable devices use it when configured with the Kconfig opti=
on
>>> added here and it seems to work fine so I presume Dom0 is 1:1 mapped as
>>> expected. It is possible that on this device, the IOMMU is only coverin=
g
>>> the two devices that need to use the Exynos IOMMU in the tests I have
>>> done.
>>> There are many other DMA capable devices that use swiotlb-xen DMA ops
>>> on Xen, but I have not checked what DMA ops the other devices use when
>>> Linux runs on the Chromebook on bare metal without Xen.
>>>
>>> So I plan to do some tests and see what DMA ops the other devices use i=
f
>>> swiotlb-xen is disabled and also what DMA ops the other devices use whe=
n
>>> Linux runs on the Chromebook on bare metal without Xen. If these tests
>>> show the problem can be fixed by disabling swiotlb-xen with a Kconfig  =
or
>>> command line option, I will propose v2 to implement that as a solution.
>>>
>>> > This last case is the interesting case for virtual IOMMU and Linux
>>> usage of
>>> > iommu_ops.
>>>
>>
>>
>> --
>> Mario.
>>
>
>
> --
> Mario.
>


--=20
Mario.

--000000000000a13c62060a4678ae
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><pre><span></span><span id=3D"gmail-line-number-1">I&=
#39;ve found a similar error on this post,made on 2012 :<br><br></span><a h=
ref=3D"https://groups.google.com/g/qubes-devel/c/W1lM4ELuVVI">https://group=
s.google.com/g/qubes-devel/c/W1lM4ELuVVI</a><br><br><br>and according to wh=
at has been asked there,I want to post some further relevant informations t=
o help you to help me to debug <br>the problem :<br><br><br><span id=3D"gma=
il-line-number-1">root@devuan-bunsen:/Dati/xen# xl dmesg ---&gt; h</span>tt=
ps://<a href=3D"http://pastebin.ubuntu.com/p/YvtdCPwMWW/">pastebin.ubuntu.c=
om/p/YvtdCPwMWW/</a></pre></div><div><pre><span id=3D"gmail-line-number-1">=
root@devuan-bunsen:/Dati/xen# dmesg ---&gt; h</span>ttps://<a href=3D"http:=
//pastebin.ubuntu.com/p/9cNxCTXVrd/">pastebin.ubuntu.com/p/9cNxCTXVrd/</a><=
br><br>r<span style=3D"font-family:monospace"><span style=3D"color:rgb(0,0,=
0);background-color:rgb(255,255,255)">oot@devuan-bunsen:/var/log/xen# mouse=
pad xenstored-access.log ---&gt; </span></span><a href=3D"https://pastebin.=
ubuntu.com/p/RTPBG9nS8R/">https://pastebin.ubuntu.com/p/RTPBG9nS8R/</a><br>=
<br><span style=3D"font-family:monospace"><span style=3D"color:rgb(0,0,0);b=
ackground-color:rgb(255,255,255)">root@devuan-bunsen:/var/log/xen# mousepad=
 xenstored.log ---&gt; </span></span><a href=3D"https://pastebin.ubuntu.com=
/p/T354ts33nP/">https://pastebin.ubuntu.com/p/T354ts33nP/</a><span style=3D=
"font-family:monospace"><span style=3D"color:rgb(0,0,0);background-color:rg=
b(255,255,255)"></span><br>
<br></span></pre><pre><span style=3D"font-family:monospace"><span style=3D"=
color:rgb(0,0,0);background-color:rgb(255,255,255)"></span>very thanks.<br>=
</span></pre></div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" cl=
ass=3D"gmail_attr">On Thu, Nov 16, 2023 at 10:51=E2=80=AFAM Mario Marietto =
&lt;<a href=3D"mailto:marietto2008@gmail.com">marietto2008@gmail.com</a>&gt=
; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px=
 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div di=
r=3D"ltr"><div>Hello to everyone.</div><div><p dir=3D"auto">I&#39;m trying =
to boot Linux 6.1.y as Xen dom0 on
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
space"></span></div></div><div><div><div id=3D"m_5481790246302540883gmail-q=
_129"><div>I have no=C2=A0 idea about the reason(s) I always get that error=
,but I don&#39;t think it is caused by a wrong creation of the devuan.img f=
ile. Can someone point me in the right direction to understand what could b=
e wrong ? I haven&#39;t found any useful information on the internet.</div>=
<div><br></div><div>This is bootxen.scr file where I have configured dom0_m=
em=3D768 :<br></div><div><br></div><div>mmc dev 1<br>ext2load mmc 1:3 0x420=
00000 zImage-6.6.0-xen-iommu-dma-on-xen<br>ext2load mmc 1:3 0x51000000 xen-=
4.17-armhf-armmp-0x51004000.ub<br>ext2load mmc 1:3 0x5ffec000 exynos5250-sn=
ow.dtb<br>fdt addr 0x5ffec000<br>fdt resize 1024<br>fdt set /chosen \#addre=
ss-cells &lt;0x2&gt;<br>fdt set /chosen \#size-cells &lt;0x2&gt;<br>fdt set=
 /chosen xen,xen-bootargs &quot;console=3Ddtuart dtuart=3Dserial0 dom0_mem=
=3D768M dom0_max_vcpus=3D2 bootscrub=3D0 vwfi=3Dnative sched=3Dnull&quot;<b=
r>fdt mknod /chosen dom0<br>fdt set /chosen/dom0 compatible =C2=A0&quot;xen=
,linux-zimage&quot; &quot;xen,multiboot-module&quot; &quot;multiboot,module=
&quot;<br>fdt set /chosen/dom0 reg &lt;0x0 0x42000000 0x0 0x87C200 &gt;<br>=
fdt set /chosen xen,dom0-bootargs &quot;console=3Dtty1 root=3D/dev/mmcblk1p=
4 rw rootwait clk_ignore_unused --no-log&quot;<br>bootm 0x51000000 - 0x5ffe=
c000</div><div><br></div><div>and I&#39;ve rebooted the Chromebook using th=
is command :</div><div><br></div><div><pre><code>SMDK5250 # mmc dev 1
SMDK5250 # ext2load mmc 1:3 0x50000000 bootxen.scr; source 0x50000000<br><b=
r></code></pre><pre><code><br>This is the memory available on the machine a=
fter having booted the machine ready for xen :<br><br></code></pre></div><d=
iv><span style=3D"font-family:monospace"><span style=3D"color:rgb(0,0,0);ba=
ckground-color:rgb(255,255,255)"># free -m
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
div><div><span style=3D"font-family:monospace"><br></span></div><div><span =
style=3D"font-family:monospace">Thanks in advance for any support. <br></sp=
an></div></div></div></div></div></div><br><div class=3D"gmail_quote"><div =
dir=3D"ltr" class=3D"gmail_attr">On Wed, Nov 15, 2023 at 8:41=E2=80=AFPM Ma=
rio Marietto &lt;<a href=3D"mailto:marietto2008@gmail.com" target=3D"_blank=
">marietto2008@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail=
_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204=
,204);padding-left:1ex"><div dir=3D"ltr"><div>---&gt; So I plan to do some =
tests and see what DMA ops the other devices use if swiotlb-xen is disabled=
 and also what DMA ops the other devices use when
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
</blockquote></div><br clear=3D"all"><br><span class=3D"gmail_signature_pre=
fix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature">Mario.<br></d=
iv>

--000000000000a13c62060a4678ae--

