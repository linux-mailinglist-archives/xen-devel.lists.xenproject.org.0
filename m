Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BEB067EFAAC
	for <lists+xen-devel@lfdr.de>; Fri, 17 Nov 2023 22:27:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.635424.991291 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r46LZ-0008Am-J6; Fri, 17 Nov 2023 21:25:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 635424.991291; Fri, 17 Nov 2023 21:25:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r46LZ-00088z-GT; Fri, 17 Nov 2023 21:25:53 +0000
Received: by outflank-mailman (input) for mailman id 635424;
 Fri, 17 Nov 2023 21:25:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5d38=G6=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1r46LY-00088d-4M
 for xen-devel@lists.xenproject.org; Fri, 17 Nov 2023 21:25:52 +0000
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e038b299-858f-11ee-98dc-6d05b1d4d9a1;
 Fri, 17 Nov 2023 22:25:50 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 34605CE2537;
 Fri, 17 Nov 2023 21:25:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E6703C433C7;
 Fri, 17 Nov 2023 21:25:41 +0000 (UTC)
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
X-Inumbo-ID: e038b299-858f-11ee-98dc-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700256344;
	bh=7onMPhswGTDVotjWqSfp24WuNeYcsPIL2S0ahjIdo50=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=WKBdJIspKPjDyPkjI3Ve55j8EiTKk4psLd4VHPlzNArKDrTUhK4ZvRz5CyNT25DMJ
	 1g3v5bpa7BzgAK9+U8NDNf16M9hmgX+cVPzy608qmUEWQ41yWnpovYSwrYkCofPGqt
	 LZEWlf6txs+eMWuNtw9PR0UhTb0UvBQhrt9hQgrgHUGzKFToS2E6ePTahdaBXw2iCm
	 zhN6Bq3Y2qt5vMkBj2DA+bJ90b81zGJIltJRBFnyWih8tJKijJtyDK5Rg909FBZf05
	 hQD9GQEfwlXEwOVM9bP9kFe7VKZ4jRBx0pn75rPRFgZQTNKsx8zov8JNLVoPLu0n9d
	 nIi2QZ7KeZ6tg==
Date: Fri, 17 Nov 2023 13:25:40 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: "Fr. Chuck Zmudzinski, C.P.M." <brchuck@hotmail.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    Robin Murphy <robin.murphy@arm.com>, Chuck Zmudzinski <brchuckz@aol.com>, 
    linux-arm-kernel@lists.infradead.org, Russell King <linux@armlinux.org.uk>, 
    Juergen Gross <jgross@suse.com>, 
    Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, 
    linux-kernel@vger.kernel.org, xen-devel@lists.xenproject.org, 
    Marek Szyprowski <m.szyprowski@samsung.com>, 
    Andrew Morton <akpm@linux-foundation.org>, 
    Mathieu Poirier <mathieu.poirier@linaro.org>, 
    Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
    "Matthew Wilcox (Oracle)" <willy@infradead.org>, 
    Linus Walleij <linus.walleij@linaro.org>, Jason Gunthorpe <jgg@ziepe.ca>, 
    Arnd Bergmann <arnd@arndb.de>, Julien Grall <julien@xen.org>, 
    Mario Marietto <marietto2008@gmail.com>, 
    Bertrand Marquis <bertrand.marquis@arm.com>
Subject: Re: [PATCH] arm/mm: add option to prefer IOMMU ops for DMA on Xen
In-Reply-To: <CH0P221MB050571AF779EFDE97B7E780AA9B7A@CH0P221MB0505.NAMP221.PROD.OUTLOOK.COM>
Message-ID: <alpine.DEB.2.22.394.2311171324300.773207@ubuntu-linux-20-04-desktop>
References: <20231111184538.2371-1-brchuckz.ref@aol.com> <20231111184538.2371-1-brchuckz@aol.com> <e5ebfde9-7a74-4908-b0b9-db47c4e76315@arm.com> <alpine.DEB.2.22.394.2311141407140.160649@ubuntu-linux-20-04-desktop>
 <CH0P221MB050571AF779EFDE97B7E780AA9B7A@CH0P221MB0505.NAMP221.PROD.OUTLOOK.COM>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 17 Nov 2023, Fr. Chuck Zmudzinski, C.P.M. wrote:
> On 11/14/2023 5:20 PM, Stefano Stabellini wrote:
> > On Tue, 14 Nov 2023, Robin Murphy wrote:
> >> On 11/11/2023 6:45 pm, Chuck Zmudzinski wrote:
> >> > Enabling the new option, ARM_DMA_USE_IOMMU_XEN, fixes this error when
> >> > attaching the Exynos mixer in Linux dom0 on Xen on the Chromebook Snow
> >> > (and probably on other devices that use the Exynos mixer):
> >> > 
> >> > [drm] Exynos DRM: using 14400000.fimd device for DMA mapping operations
> >> > exynos-drm exynos-drm: bound 14400000.fimd (ops 0xc0d96354)
> >> > exynos-mixer 14450000.mixer: [drm:exynos_drm_register_dma] *ERROR* Device
> >> >                               14450000.mixer lacks support for IOMMU
> >> > exynos-drm exynos-drm: failed to bind 14450000.mixer (ops 0xc0d97554): -22
> >> > exynos-drm exynos-drm: adev bind failed: -22
> >> > exynos-dp: probe of 145b0000.dp-controller failed with error -22
> >> > 
> >> > Linux normally uses xen_swiotlb_dma_ops for DMA for all devices when
> >> > xen_swiotlb is detected even when Xen exposes an IOMMU to Linux. Enabling
> >> > the new config option allows devices such as the Exynos mixer to use the
> >> > IOMMU instead of xen_swiotlb_dma_ops for DMA and this fixes the error.
> >> > 
> >> > The new config option is not set by default because it is likely some
> >> > devices that use IOMMU for DMA on Xen will cause DMA errors and memory
> >> > corruption when Xen PV block and network drivers are in use on the system.
> >> > 
> >> > Link:
> >> > https://lore.kernel.org/xen-devel/acfab1c5-eed1-4930-8c70-8681e256c820@netscape.net/
> >> > 
> >> > Signed-off-by: Chuck Zmudzinski <brchuckz@aol.com>
> >> > ---
> >> > The reported error with the Exynos mixer is not fixed by default by adding
> >> > a second patch to select the new option in the Kconfig definition for the
> >> > Exynos mixer if EXYNOS_IOMMU and SWIOTLB_XEN are enabled because it is
> >> > not certain setting the config option is suitable for all cases. So it is
> >> > necessary to explicitly select the new config option during the config
> >> > stage of the Linux kernel build to fix the reported error or similar
> >> > errors that have the same cause of lack of support for IOMMU on Xen. This
> >> > is necessary to avoid any regressions that might be caused by enabling the
> >> > new option by default for the Exynos mixer.
> >> >   arch/arm/mm/dma-mapping.c |  6 ++++++
> >> >   drivers/xen/Kconfig       | 16 ++++++++++++++++
> >> >   2 files changed, 22 insertions(+)
> >> > 
> >> > diff --git a/arch/arm/mm/dma-mapping.c b/arch/arm/mm/dma-mapping.c
> >> > index 5409225b4abc..ca04fdf01be3 100644
> >> > --- a/arch/arm/mm/dma-mapping.c
> >> > +++ b/arch/arm/mm/dma-mapping.c
> >> > @@ -1779,6 +1779,12 @@ void arch_setup_dma_ops(struct device *dev, u64
> >> > dma_base, u64 size,
> >> >   	if (iommu)
> >> >   		arm_setup_iommu_dma_ops(dev, dma_base, size, iommu, coherent);
> >> >   +#ifdef CONFIG_ARM_DMA_USE_IOMMU_XEN
> >> 
> >> FWIW I don't think this really needs a config option - if Xen *has* made an
> >> IOMMU available, then there isn't really much reason not to use it, and if for
> >> some reason someone really didn't want to then they could simply disable the
> >> IOMMU driver anyway.
> > 
> > The fact that the Exynos IOMMU is exposed to Linux is a mistake. Xen
> > doesn't recognize the Exynos IOMMU (it is not one of the IOMMUs Xen has
> > a driver for) so it assigns the IOMMU to Dom0. It doesn't happen on
> > purpose, it happens by accident. Certain things are going to break,
> > specifically I am fairly certain PV drivers are going to break.
> > 
> > If Xen recognized the Exynos IOMMU as an IOMMU it would probably hide it
> > from Dom0. (Today Xen doesn't have a list of IOMMUs Xen recognizes but
> > doesn't have a driver for.)
> > 
> > I think it is OK for Chuck and others to play around with this
> > configuration but I wouldn't add a new kconfig option to Linux to
> > support it.
> > 
> > If we do want a kconfig option, I would add a kconfig option or Linux
> > command line option to enable/disable swiotlb-xen. Basically a way to
> > force-enable or force-disable xen_swiotlb_detect().That could be
> 
> I am trying to understand what you are proposing.
> 
> I tried disabling the CONFIG_SWIOTLB_XEN option that already
> exists and it does not seem possible to disable that option without
> also totally removing Xen dom0 support from Linux on arm. So do you
> suggest keeping that option as is and adding a Linux command line
> switch or new Linux Kconfig option that is ignored unless
> CONFIG_SWIOTLB_XEN is enabled and would make xen_swiotlb_detect()
> always return false or always return true, depending on the setting
> of the new option?

Yes. I suggest adding a Linux kernel command line option to force-enable
or force-diable swiotlb-xen and that can easily be implemented by
changing xen_swiotlb_detect() to return true/false if the command line
option is set by the user.

