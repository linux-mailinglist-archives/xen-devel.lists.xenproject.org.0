Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 783BC7EB93E
	for <lists+xen-devel@lfdr.de>; Tue, 14 Nov 2023 23:20:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.633346.988054 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r31le-0002eO-Ix; Tue, 14 Nov 2023 22:20:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 633346.988054; Tue, 14 Nov 2023 22:20:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r31le-0002cG-Fm; Tue, 14 Nov 2023 22:20:22 +0000
Received: by outflank-mailman (input) for mailman id 633346;
 Tue, 14 Nov 2023 22:20:20 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wE9C=G3=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1r31lc-0002ay-Ln
 for xen-devel@lists.xenproject.org; Tue, 14 Nov 2023 22:20:20 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id feb18743-833b-11ee-98db-6d05b1d4d9a1;
 Tue, 14 Nov 2023 23:20:19 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id D0DA8B8164E;
 Tue, 14 Nov 2023 22:20:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 283E7C433C7;
 Tue, 14 Nov 2023 22:20:15 +0000 (UTC)
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
X-Inumbo-ID: feb18743-833b-11ee-98db-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700000418;
	bh=NGBA853ibDxtMnFW3f0ECDX3vjWUoc4l/aGPK2xj0xE=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=WxPo15IekiIHvcukxAOI6bojhiJlsmyN8g+Jk7W39lYoYQsbtuaCMI5bxAQ3WYo3E
	 2XHr5lk7sgQB/FKh+dUjFhncFSnBYa3jEJspKebjHmKlRRqYV1yfE+npuMLwvAZHX8
	 zfKdg50NlAqQy0vsnDrKlLghFLyexEBYXFOHJ89Is1tuvGXrRKA9gSq2xgQF5wRxmj
	 vj09MT3Ul2U+u4eX/LrCKgDD9IMkHyqazStM5XKv++RBxWosWfEwFLHHlC3S/Vsag/
	 X5HeTxgEXZfiKToV92v33KOYkNSeLLPagUssP85DUAxFRANCyVVyz/iLsE3f6GsgbT
	 kR3k+9rNAUN6g==
Date: Tue, 14 Nov 2023 14:20:13 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Robin Murphy <robin.murphy@arm.com>
cc: Chuck Zmudzinski <brchuckz@aol.com>, linux-arm-kernel@lists.infradead.org, 
    Russell King <linux@armlinux.org.uk>, Juergen Gross <jgross@suse.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
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
In-Reply-To: <e5ebfde9-7a74-4908-b0b9-db47c4e76315@arm.com>
Message-ID: <alpine.DEB.2.22.394.2311141407140.160649@ubuntu-linux-20-04-desktop>
References: <20231111184538.2371-1-brchuckz.ref@aol.com> <20231111184538.2371-1-brchuckz@aol.com> <e5ebfde9-7a74-4908-b0b9-db47c4e76315@arm.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 14 Nov 2023, Robin Murphy wrote:
> On 11/11/2023 6:45 pm, Chuck Zmudzinski wrote:
> > Enabling the new option, ARM_DMA_USE_IOMMU_XEN, fixes this error when
> > attaching the Exynos mixer in Linux dom0 on Xen on the Chromebook Snow
> > (and probably on other devices that use the Exynos mixer):
> > 
> > [drm] Exynos DRM: using 14400000.fimd device for DMA mapping operations
> > exynos-drm exynos-drm: bound 14400000.fimd (ops 0xc0d96354)
> > exynos-mixer 14450000.mixer: [drm:exynos_drm_register_dma] *ERROR* Device
> >                               14450000.mixer lacks support for IOMMU
> > exynos-drm exynos-drm: failed to bind 14450000.mixer (ops 0xc0d97554): -22
> > exynos-drm exynos-drm: adev bind failed: -22
> > exynos-dp: probe of 145b0000.dp-controller failed with error -22
> > 
> > Linux normally uses xen_swiotlb_dma_ops for DMA for all devices when
> > xen_swiotlb is detected even when Xen exposes an IOMMU to Linux. Enabling
> > the new config option allows devices such as the Exynos mixer to use the
> > IOMMU instead of xen_swiotlb_dma_ops for DMA and this fixes the error.
> > 
> > The new config option is not set by default because it is likely some
> > devices that use IOMMU for DMA on Xen will cause DMA errors and memory
> > corruption when Xen PV block and network drivers are in use on the system.
> > 
> > Link:
> > https://lore.kernel.org/xen-devel/acfab1c5-eed1-4930-8c70-8681e256c820@netscape.net/
> > 
> > Signed-off-by: Chuck Zmudzinski <brchuckz@aol.com>
> > ---
> > The reported error with the Exynos mixer is not fixed by default by adding
> > a second patch to select the new option in the Kconfig definition for the
> > Exynos mixer if EXYNOS_IOMMU and SWIOTLB_XEN are enabled because it is
> > not certain setting the config option is suitable for all cases. So it is
> > necessary to explicitly select the new config option during the config
> > stage of the Linux kernel build to fix the reported error or similar
> > errors that have the same cause of lack of support for IOMMU on Xen. This
> > is necessary to avoid any regressions that might be caused by enabling the
> > new option by default for the Exynos mixer.
> >   arch/arm/mm/dma-mapping.c |  6 ++++++
> >   drivers/xen/Kconfig       | 16 ++++++++++++++++
> >   2 files changed, 22 insertions(+)
> > 
> > diff --git a/arch/arm/mm/dma-mapping.c b/arch/arm/mm/dma-mapping.c
> > index 5409225b4abc..ca04fdf01be3 100644
> > --- a/arch/arm/mm/dma-mapping.c
> > +++ b/arch/arm/mm/dma-mapping.c
> > @@ -1779,6 +1779,12 @@ void arch_setup_dma_ops(struct device *dev, u64
> > dma_base, u64 size,
> >   	if (iommu)
> >   		arm_setup_iommu_dma_ops(dev, dma_base, size, iommu, coherent);
> >   +#ifdef CONFIG_ARM_DMA_USE_IOMMU_XEN
> 
> FWIW I don't think this really needs a config option - if Xen *has* made an
> IOMMU available, then there isn't really much reason not to use it, and if for
> some reason someone really didn't want to then they could simply disable the
> IOMMU driver anyway.

The fact that the Exynos IOMMU is exposed to Linux is a mistake. Xen
doesn't recognize the Exynos IOMMU (it is not one of the IOMMUs Xen has
a driver for) so it assigns the IOMMU to Dom0. It doesn't happen on
purpose, it happens by accident. Certain things are going to break,
specifically I am fairly certain PV drivers are going to break.

If Xen recognized the Exynos IOMMU as an IOMMU it would probably hide it
from Dom0. (Today Xen doesn't have a list of IOMMUs Xen recognizes but
doesn't have a driver for.)

I think it is OK for Chuck and others to play around with this
configuration but I wouldn't add a new kconfig option to Linux to
support it.

If we do want a kconfig option, I would add a kconfig option or Linux
command line option to enable/disable swiotlb-xen. Basically a way to
force-enable or force-disable xen_swiotlb_detect(). That could be
generally useful for debugging and would also solve the problem here as
it could be used to force-disable swiotlb-xen. I would imagine that the
end result is the same: the default ops (iommu_ops) are used.



> > +	if (dev->dma_ops == &iommu_ops) {
> > +		dev->archdata.dma_ops_setup = true;
> 
> The existing assignment is effectively unconditional by this point anyway, so
> could probably just be moved earlier to save duplicating it (or perhaps just
> make the xen_setup_dma_ops() call conditional instead to save the early return
> as well).
> 
> However, are the IOMMU DMA ops really compatible with Xen? The comments about
> hypercalls and foreign memory in xen_arch_need_swiotlb() leave me concerned
> that assuming non-coherent DMA to any old Dom0 page is OK might not actually
> work in general :/

Xen has (not yet upstreaming) support for nested IOMMU (Xen uses the
IOMMU while also it exposes a virtual IOMMU to guests.) In those cases
the iommu_ops should be compatible with Xen.

swiotlb-xen is useful in cases where there is no IOMMU on the platform
(or the IOMMU doesn't cover all DMA-capable devices) and Dom0 is 1:1
mapped. See include/xen/arm/swiotlb-xen.h:xen_swiotlb_detect. If Dom0 is
not 1:1 mapped swiotlb-xen doesn't work. If an IOMMU is present and
covers all DMA-capable devices, then swiotlb-xen is superfluous. This
last case is the interesting case for virtual IOMMU and Linux usage of
iommu_ops.

