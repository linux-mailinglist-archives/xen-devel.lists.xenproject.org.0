Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A121371693
	for <lists+xen-devel@lfdr.de>; Mon,  3 May 2021 16:26:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.121649.229428 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ldZWk-0002rI-Dt; Mon, 03 May 2021 14:26:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 121649.229428; Mon, 03 May 2021 14:26:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ldZWk-0002qt-AY; Mon, 03 May 2021 14:26:26 +0000
Received: by outflank-mailman (input) for mailman id 121649;
 Mon, 03 May 2021 14:26:25 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ngRQ=J6=chromium.org=tientzu@srs-us1.protection.inumbo.net>)
 id 1ldZWj-0002qV-5H
 for xen-devel@lists.xenproject.org; Mon, 03 May 2021 14:26:25 +0000
Received: from mail-il1-x134.google.com (unknown [2607:f8b0:4864:20::134])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1b67027b-9310-414c-b710-5a85310b8e63;
 Mon, 03 May 2021 14:26:24 +0000 (UTC)
Received: by mail-il1-x134.google.com with SMTP id h6so3793967ila.7
 for <xen-devel@lists.xenproject.org>; Mon, 03 May 2021 07:26:24 -0700 (PDT)
Received: from mail-il1-f182.google.com (mail-il1-f182.google.com.
 [209.85.166.182])
 by smtp.gmail.com with ESMTPSA id z25sm5614971iob.26.2021.05.03.07.26.22
 for <xen-devel@lists.xenproject.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 03 May 2021 07:26:22 -0700 (PDT)
Received: by mail-il1-f182.google.com with SMTP id p15so3814262iln.3
 for <xen-devel@lists.xenproject.org>; Mon, 03 May 2021 07:26:22 -0700 (PDT)
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
X-Inumbo-ID: 1b67027b-9310-414c-b710-5a85310b8e63
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ELcNibbwxopbe4wnzShPTb7xRMLVvYpqQ8un28QQp9U=;
        b=nOyrfh2thpmQagEkzKEHJkMTgRy+3FJJdT9Oo6MZndwooAl8msGQ2IZHFMeS6aJ6Md
         +OeRGM111zl+0t7XmNgYC8WpP2ka9OwZM9VN//prTwlXpUXb+Muztthx/dt4YfUeTqwD
         ene0+k2RSvchnHpwNfAnGfkLV6l7GmkYIbRvE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ELcNibbwxopbe4wnzShPTb7xRMLVvYpqQ8un28QQp9U=;
        b=UOhNSxIFI4CPa00XUq803vxMg2VjRi+Js/VOcw0oJYonAWOV+fn4L4w6hvHxrDQsAc
         S3Z34MUbu29Jn5K8v4bp8zNOu8Q0WragyJDh8lsiX8MbAOl3IdwCbtF3DvGBeZeiX/7u
         qpR7iRRPNccGwypVjBrKD8RNGrSL6t4Z2Mcmw0/CyBuLH1E+myot/jookHgm/Fl6oJ5T
         bFVK7U6Jpy6MXOR7FspMw+iSlRdgahoMHACosBS+aaKWum2qoDPeCi+/N09lFcDPFNAT
         nXxTz7R8l9f+efoOenwTz2yeMJR81jmQROp+eJMrvNuiOG3aKAWpqi5kslxiFtG+QUXr
         LrvQ==
X-Gm-Message-State: AOAM532mb3um9NnV4hEVE7Mv8ZQSX/JPFDDeh+BMn+rG0yuX79WyRxwJ
	y5xzYYm0ehho+hZjgdmS4Jfo/zGz7E8ZSQ==
X-Google-Smtp-Source: ABdhPJyb25KahPJML9LRmuSA0bTQPqmpTuPaaB0/CjLKnl05wCrQa/ybeGSbW8ptyK9nLIhnzcHosQ==
X-Received: by 2002:a92:c0cf:: with SMTP id t15mr16572406ilf.117.1620051983158;
        Mon, 03 May 2021 07:26:23 -0700 (PDT)
X-Received: by 2002:a05:6e02:f4e:: with SMTP id y14mr3397094ilj.18.1620051971892;
 Mon, 03 May 2021 07:26:11 -0700 (PDT)
MIME-Version: 1.0
References: <20210422081508.3942748-1-tientzu@chromium.org>
 <20210422081508.3942748-15-tientzu@chromium.org> <70b895c2-4a39-bbbd-a719-5c8b6b922026@arm.com>
In-Reply-To: <70b895c2-4a39-bbbd-a719-5c8b6b922026@arm.com>
From: Claire Chang <tientzu@chromium.org>
Date: Mon, 3 May 2021 22:26:00 +0800
X-Gmail-Original-Message-ID: <CALiNf28cc5T-cMZxNPZnrTQvqu2Ge_MmZj-teN4mE_-E-6_6XQ@mail.gmail.com>
Message-ID: <CALiNf28cc5T-cMZxNPZnrTQvqu2Ge_MmZj-teN4mE_-E-6_6XQ@mail.gmail.com>
Subject: Re: [PATCH v5 14/16] dma-direct: Allocate memory from restricted DMA
 pool if available
To: Robin Murphy <robin.murphy@arm.com>
Cc: Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>, 
	Frank Rowand <frowand.list@gmail.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, 
	boris.ostrovsky@oracle.com, jgross@suse.com, Christoph Hellwig <hch@lst.de>, 
	Marek Szyprowski <m.szyprowski@samsung.com>, benh@kernel.crashing.org, paulus@samba.org, 
	"list@263.net:IOMMU DRIVERS" <iommu@lists.linux-foundation.org>, sstabellini@kernel.org, 
	grant.likely@arm.com, xypron.glpk@gmx.de, Thierry Reding <treding@nvidia.com>, 
	mingo@kernel.org, bauerman@linux.ibm.com, peterz@infradead.org, 
	Greg KH <gregkh@linuxfoundation.org>, Saravana Kannan <saravanak@google.com>, 
	"Rafael J . Wysocki" <rafael.j.wysocki@intel.com>, heikki.krogerus@linux.intel.com, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Randy Dunlap <rdunlap@infradead.org>, 
	Dan Williams <dan.j.williams@intel.com>, Bartosz Golaszewski <bgolaszewski@baylibre.com>, 
	linux-devicetree <devicetree@vger.kernel.org>, lkml <linux-kernel@vger.kernel.org>, 
	linuxppc-dev@lists.ozlabs.org, xen-devel@lists.xenproject.org, 
	Nicolas Boichat <drinkcat@chromium.org>, Jim Quinlan <james.quinlan@broadcom.com>, 
	Tomasz Figa <tfiga@chromium.org>, bskeggs@redhat.com, 
	Bjorn Helgaas <bhelgaas@google.com>, chris@chris-wilson.co.uk, 
	Daniel Vetter <daniel@ffwll.ch>, airlied@linux.ie, dri-devel@lists.freedesktop.org, 
	intel-gfx@lists.freedesktop.org, jani.nikula@linux.intel.com, 
	Jianxiong Gao <jxgao@google.com>, joonas.lahtinen@linux.intel.com, 
	linux-pci@vger.kernel.org, maarten.lankhorst@linux.intel.com, 
	matthew.auld@intel.com, nouveau@lists.freedesktop.org, rodrigo.vivi@intel.com, 
	thomas.hellstrom@linux.intel.com
Content-Type: text/plain; charset="UTF-8"

On Fri, Apr 23, 2021 at 9:46 PM Robin Murphy <robin.murphy@arm.com> wrote:
>
> On 2021-04-22 09:15, Claire Chang wrote:
> > The restricted DMA pool is preferred if available.
> >
> > The restricted DMA pools provide a basic level of protection against the
> > DMA overwriting buffer contents at unexpected times. However, to protect
> > against general data leakage and system memory corruption, the system
> > needs to provide a way to lock down the memory access, e.g., MPU.
> >
> > Signed-off-by: Claire Chang <tientzu@chromium.org>
> > ---
> >   kernel/dma/direct.c | 35 ++++++++++++++++++++++++++---------
> >   1 file changed, 26 insertions(+), 9 deletions(-)
> >
> > diff --git a/kernel/dma/direct.c b/kernel/dma/direct.c
> > index 7a27f0510fcc..29523d2a9845 100644
> > --- a/kernel/dma/direct.c
> > +++ b/kernel/dma/direct.c
> > @@ -78,6 +78,10 @@ static bool dma_coherent_ok(struct device *dev, phys_addr_t phys, size_t size)
> >   static void __dma_direct_free_pages(struct device *dev, struct page *page,
> >                                   size_t size)
> >   {
> > +#ifdef CONFIG_DMA_RESTRICTED_POOL
> > +     if (swiotlb_free(dev, page, size))
> > +             return;
> > +#endif
> >       dma_free_contiguous(dev, page, size);
> >   }
> >
> > @@ -92,7 +96,17 @@ static struct page *__dma_direct_alloc_pages(struct device *dev, size_t size,
> >
> >       gfp |= dma_direct_optimal_gfp_mask(dev, dev->coherent_dma_mask,
> >                                          &phys_limit);
> > -     page = dma_alloc_contiguous(dev, size, gfp);
> > +
> > +#ifdef CONFIG_DMA_RESTRICTED_POOL
> > +     page = swiotlb_alloc(dev, size);
> > +     if (page && !dma_coherent_ok(dev, page_to_phys(page), size)) {
> > +             __dma_direct_free_pages(dev, page, size);
> > +             page = NULL;
> > +     }
> > +#endif
> > +
> > +     if (!page)
> > +             page = dma_alloc_contiguous(dev, size, gfp);
> >       if (page && !dma_coherent_ok(dev, page_to_phys(page), size)) {
> >               dma_free_contiguous(dev, page, size);
> >               page = NULL;
> > @@ -148,7 +162,7 @@ void *dma_direct_alloc(struct device *dev, size_t size,
> >               gfp |= __GFP_NOWARN;
> >
> >       if ((attrs & DMA_ATTR_NO_KERNEL_MAPPING) &&
> > -         !force_dma_unencrypted(dev)) {
> > +         !force_dma_unencrypted(dev) && !is_dev_swiotlb_force(dev)) {
> >               page = __dma_direct_alloc_pages(dev, size, gfp & ~__GFP_ZERO);
> >               if (!page)
> >                       return NULL;
> > @@ -161,8 +175,8 @@ void *dma_direct_alloc(struct device *dev, size_t size,
> >       }
> >
> >       if (!IS_ENABLED(CONFIG_ARCH_HAS_DMA_SET_UNCACHED) &&
> > -         !IS_ENABLED(CONFIG_DMA_DIRECT_REMAP) &&
> > -         !dev_is_dma_coherent(dev))
> > +         !IS_ENABLED(CONFIG_DMA_DIRECT_REMAP) && !dev_is_dma_coherent(dev) &&
> > +         !is_dev_swiotlb_force(dev))
> >               return arch_dma_alloc(dev, size, dma_handle, gfp, attrs);
> >
> >       /*
> > @@ -172,7 +186,9 @@ void *dma_direct_alloc(struct device *dev, size_t size,
> >       if (IS_ENABLED(CONFIG_DMA_COHERENT_POOL) &&
> >           !gfpflags_allow_blocking(gfp) &&
> >           (force_dma_unencrypted(dev) ||
> > -          (IS_ENABLED(CONFIG_DMA_DIRECT_REMAP) && !dev_is_dma_coherent(dev))))
> > +          (IS_ENABLED(CONFIG_DMA_DIRECT_REMAP) &&
> > +           !dev_is_dma_coherent(dev))) &&
> > +         !is_dev_swiotlb_force(dev))
> >               return dma_direct_alloc_from_pool(dev, size, dma_handle, gfp);
> >
> >       /* we always manually zero the memory once we are done */
> > @@ -253,15 +269,15 @@ void dma_direct_free(struct device *dev, size_t size,
> >       unsigned int page_order = get_order(size);
> >
> >       if ((attrs & DMA_ATTR_NO_KERNEL_MAPPING) &&
> > -         !force_dma_unencrypted(dev)) {
> > +         !force_dma_unencrypted(dev) && !is_dev_swiotlb_force(dev)) {
> >               /* cpu_addr is a struct page cookie, not a kernel address */
> >               dma_free_contiguous(dev, cpu_addr, size);
> >               return;
> >       }
> >
> >       if (!IS_ENABLED(CONFIG_ARCH_HAS_DMA_SET_UNCACHED) &&
> > -         !IS_ENABLED(CONFIG_DMA_DIRECT_REMAP) &&
> > -         !dev_is_dma_coherent(dev)) {
> > +         !IS_ENABLED(CONFIG_DMA_DIRECT_REMAP) && !dev_is_dma_coherent(dev) &&
> > +         !is_dev_swiotlb_force(dev)) {
> >               arch_dma_free(dev, size, cpu_addr, dma_addr, attrs);
> >               return;
> >       }
> > @@ -289,7 +305,8 @@ struct page *dma_direct_alloc_pages(struct device *dev, size_t size,
> >       void *ret;
> >
> >       if (IS_ENABLED(CONFIG_DMA_COHERENT_POOL) &&
> > -         force_dma_unencrypted(dev) && !gfpflags_allow_blocking(gfp))
> > +         force_dma_unencrypted(dev) && !gfpflags_allow_blocking(gfp) &&
> > +         !is_dev_swiotlb_force(dev))
> >               return dma_direct_alloc_from_pool(dev, size, dma_handle, gfp);
>
> Wait, this seems broken for non-coherent devices - in that case we need
> to return a non-cacheable address, but we can't simply fall through into
> the remapping path below in GFP_ATOMIC context. That's why we need the
> atomic pool concept in the first place :/

Sorry for the late reply. I'm not very familiar with this. I wonder if
the memory returned here must be coherent. If yes, could we say for
this case, one must set up another device coherent pool
(shared-dma-pool) and go with dma_alloc_from_dev_coherent()[1]?

[1] https://elixir.bootlin.com/linux/v5.12/source/kernel/dma/mapping.c#L435

>
> Unless I've overlooked something, we're still using the regular
> cacheable linear map address of the dma_io_tlb_mem buffer, no?
>
> Robin.
>
> >
> >       page = __dma_direct_alloc_pages(dev, size, gfp);
> >

