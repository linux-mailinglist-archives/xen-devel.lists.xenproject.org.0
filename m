Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DB83A36B6F8
	for <lists+xen-devel@lfdr.de>; Mon, 26 Apr 2021 18:38:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.117808.223711 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lb4Ex-0006Xs-WA; Mon, 26 Apr 2021 16:37:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 117808.223711; Mon, 26 Apr 2021 16:37:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lb4Ex-0006XT-Sp; Mon, 26 Apr 2021 16:37:43 +0000
Received: by outflank-mailman (input) for mailman id 117808;
 Mon, 26 Apr 2021 16:37:42 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MWrc=JX=chromium.org=tientzu@srs-us1.protection.inumbo.net>)
 id 1lb4Ew-0006XO-Oq
 for xen-devel@lists.xenproject.org; Mon, 26 Apr 2021 16:37:42 +0000
Received: from mail-pg1-x542.google.com (unknown [2607:f8b0:4864:20::542])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 73d06650-9487-44c1-b7b1-e35a3f33f142;
 Mon, 26 Apr 2021 16:37:41 +0000 (UTC)
Received: by mail-pg1-x542.google.com with SMTP id t22so5166323pgu.0
 for <xen-devel@lists.xenproject.org>; Mon, 26 Apr 2021 09:37:41 -0700 (PDT)
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com.
 [209.85.215.171])
 by smtp.gmail.com with ESMTPSA id m11sm15125710pjs.34.2021.04.26.09.37.40
 for <xen-devel@lists.xenproject.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 26 Apr 2021 09:37:40 -0700 (PDT)
Received: by mail-pg1-f171.google.com with SMTP id d10so2037861pgf.12
 for <xen-devel@lists.xenproject.org>; Mon, 26 Apr 2021 09:37:40 -0700 (PDT)
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
X-Inumbo-ID: 73d06650-9487-44c1-b7b1-e35a3f33f142
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=w+xLIOm1aUR+ojar7SxT7aE31iJaS6lTTL9NFfLTdqs=;
        b=ctSitjX8LR7O2ZMk4lsR8Irz6egx7wTYNYpP5lwZVohPuAIjgk70gq0rLgnAswDS5J
         OwrGL0fnjKjd/25GMaUPOEt1BY6NfF//O6cQPXnTolYLDRghV+Gs0xVvNzh51W3LGUxd
         u8ZH2pOBpUkLUeomCja6RAPBZaNGl3ag01nF0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=w+xLIOm1aUR+ojar7SxT7aE31iJaS6lTTL9NFfLTdqs=;
        b=HdAKrXbYjlEctQhOFdF3DTMuDbTfLgcUpRYRKMlvB7AN47nB0U5vVTRzpwqoyJ9flQ
         zIGPaRJEyLl4KU3pNIj49GL97YwAca3YhDnOcpyhwkJHZAA/AOUW5vsHI88g5y9mzAKD
         ZtbJN3VV9HK0Yi79KNs6b86hc4ElMjpqey8IY01Gvm2OGavGa30lLJYLnbwSLBnEXQ8j
         6xnu8yoxfXnPLrK63D8c1/oX+GCg+gC7mI1dJZe5oIQxyKl4xF7w0gCqMGS6SCQtFl4+
         TSNgLcukkeoYjYKmU1aJ+PTV76z+McCX/w8OPSyEh9bpW8ou4tfpFwM6h4lxDggG/2bl
         jTzw==
X-Gm-Message-State: AOAM530vI3wgmNWtv3YS5gWdU60+swNw33Ttu3Z47h4XW8RwXq5oS2Lu
	Y74ObPZ5WNi+7SP1/gvVMHeFU76aK3Nz+Q==
X-Google-Smtp-Source: ABdhPJwZTUJEiFbRvSi4tFMIQTz6mGt21dwc4Md7Gg3mCkvn0KF1QRxEwiFRVjICE/0FOuAdkcv6Ug==
X-Received: by 2002:a65:618c:: with SMTP id c12mr17832885pgv.296.1619455060939;
        Mon, 26 Apr 2021 09:37:40 -0700 (PDT)
X-Received: by 2002:a5d:8c82:: with SMTP id g2mr15143365ion.34.1619455049397;
 Mon, 26 Apr 2021 09:37:29 -0700 (PDT)
MIME-Version: 1.0
References: <20210422081508.3942748-1-tientzu@chromium.org>
 <20210422081508.3942748-6-tientzu@chromium.org> <c9abca62-328d-d0d6-a8a6-a67475171f92@arm.com>
In-Reply-To: <c9abca62-328d-d0d6-a8a6-a67475171f92@arm.com>
From: Claire Chang <tientzu@chromium.org>
Date: Tue, 27 Apr 2021 00:37:18 +0800
X-Gmail-Original-Message-ID: <CALiNf2_tffc65PhLxCr3-+gmVYKGO2HjYiJVkBNa5U5HYdi9pg@mail.gmail.com>
Message-ID: <CALiNf2_tffc65PhLxCr3-+gmVYKGO2HjYiJVkBNa5U5HYdi9pg@mail.gmail.com>
Subject: Re: [PATCH v5 05/16] swiotlb: Add restricted DMA pool initialization
To: Steven Price <steven.price@arm.com>
Cc: Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>, 
	Frank Rowand <frowand.list@gmail.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, 
	boris.ostrovsky@oracle.com, jgross@suse.com, Christoph Hellwig <hch@lst.de>, 
	Marek Szyprowski <m.szyprowski@samsung.com>, benh@kernel.crashing.org, paulus@samba.org, 
	"list@263.net:IOMMU DRIVERS" <iommu@lists.linux-foundation.org>, sstabellini@kernel.org, 
	Robin Murphy <robin.murphy@arm.com>, grant.likely@arm.com, xypron.glpk@gmx.de, 
	Thierry Reding <treding@nvidia.com>, mingo@kernel.org, bauerman@linux.ibm.com, 
	peterz@infradead.org, Greg KH <gregkh@linuxfoundation.org>, 
	Saravana Kannan <saravanak@google.com>, "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>, 
	heikki.krogerus@linux.intel.com, 
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

On Fri, Apr 23, 2021 at 7:34 PM Steven Price <steven.price@arm.com> wrote:
>
> On 22/04/2021 09:14, Claire Chang wrote:
> > Add the initialization function to create restricted DMA pools from
> > matching reserved-memory nodes.
> >
> > Signed-off-by: Claire Chang <tientzu@chromium.org>
> > ---
> >   include/linux/device.h  |  4 +++
> >   include/linux/swiotlb.h |  3 +-
> >   kernel/dma/swiotlb.c    | 80 +++++++++++++++++++++++++++++++++++++++++
> >   3 files changed, 86 insertions(+), 1 deletion(-)
> >
> > diff --git a/include/linux/device.h b/include/linux/device.h
> > index 38a2071cf776..4987608ea4ff 100644
> > --- a/include/linux/device.h
> > +++ b/include/linux/device.h
> > @@ -416,6 +416,7 @@ struct dev_links_info {
> >    * @dma_pools:      Dma pools (if dma'ble device).
> >    * @dma_mem:        Internal for coherent mem override.
> >    * @cma_area:       Contiguous memory area for dma allocations
> > + * @dma_io_tlb_mem: Internal for swiotlb io_tlb_mem override.
> >    * @archdata:       For arch-specific additions.
> >    * @of_node:        Associated device tree node.
> >    * @fwnode: Associated device node supplied by platform firmware.
> > @@ -521,6 +522,9 @@ struct device {
> >   #ifdef CONFIG_DMA_CMA
> >       struct cma *cma_area;           /* contiguous memory area for dma
> >                                          allocations */
> > +#endif
> > +#ifdef CONFIG_DMA_RESTRICTED_POOL
> > +     struct io_tlb_mem *dma_io_tlb_mem;
> >   #endif
> >       /* arch specific additions */
> >       struct dev_archdata     archdata;
> > diff --git a/include/linux/swiotlb.h b/include/linux/swiotlb.h
> > index 216854a5e513..03ad6e3b4056 100644
> > --- a/include/linux/swiotlb.h
> > +++ b/include/linux/swiotlb.h
> > @@ -72,7 +72,8 @@ extern enum swiotlb_force swiotlb_force;
> >    *          range check to see if the memory was in fact allocated by this
> >    *          API.
> >    * @nslabs: The number of IO TLB blocks (in groups of 64) between @start and
> > - *           @end. This is command line adjustable via setup_io_tlb_npages.
> > + *           @end. For default swiotlb, this is command line adjustable via
> > + *           setup_io_tlb_npages.
> >    * @used:   The number of used IO TLB block.
> >    * @list:   The free list describing the number of free entries available
> >    *          from each index.
> > diff --git a/kernel/dma/swiotlb.c b/kernel/dma/swiotlb.c
> > index 57a9adb920bf..ffbb8724e06c 100644
> > --- a/kernel/dma/swiotlb.c
> > +++ b/kernel/dma/swiotlb.c
> > @@ -39,6 +39,13 @@
> >   #ifdef CONFIG_DEBUG_FS
> >   #include <linux/debugfs.h>
> >   #endif
> > +#ifdef CONFIG_DMA_RESTRICTED_POOL
> > +#include <linux/io.h>
> > +#include <linux/of.h>
> > +#include <linux/of_fdt.h>
> > +#include <linux/of_reserved_mem.h>
> > +#include <linux/slab.h>
> > +#endif
> >
> >   #include <asm/io.h>
> >   #include <asm/dma.h>
> > @@ -681,3 +688,76 @@ static int __init swiotlb_create_default_debugfs(void)
> >   late_initcall(swiotlb_create_default_debugfs);
> >
> >   #endif
> > +
> > +#ifdef CONFIG_DMA_RESTRICTED_POOL
> > +static int rmem_swiotlb_device_init(struct reserved_mem *rmem,
> > +                                 struct device *dev)
> > +{
> > +     struct io_tlb_mem *mem = rmem->priv;
> > +     unsigned long nslabs = rmem->size >> IO_TLB_SHIFT;
> > +
> > +     if (dev->dma_io_tlb_mem)
> > +             return 0;
> > +
> > +     /* Since multiple devices can share the same pool, the private data,
> > +      * io_tlb_mem struct, will be initialized by the first device attached
> > +      * to it.
> > +      */
> > +     if (!mem) {
> > +             mem = kzalloc(struct_size(mem, slots, nslabs), GFP_KERNEL);
> > +             if (!mem)
> > +                     return -ENOMEM;
> > +#ifdef CONFIG_ARM
> > +             if (!PageHighMem(pfn_to_page(PHYS_PFN(rmem->base)))) {
> > +                     kfree(mem);
> > +                     return -EINVAL;
> > +             }
> > +#endif /* CONFIG_ARM */
> > +             swiotlb_init_io_tlb_mem(mem, rmem->base, nslabs, false);
> > +
> > +             rmem->priv = mem;
> > +     }
> > +
> > +#ifdef CONFIG_DEBUG_FS
> > +     if (!io_tlb_default_mem->debugfs)
> > +             io_tlb_default_mem->debugfs =
> > +                     debugfs_create_dir("swiotlb", NULL);
>
> At this point it's possible for io_tlb_default_mem to be NULL, leading
> to a splat.

Thanks for pointing this out.

>
> But even then if it's not and we have the situation where debugfs==NULL
> then the debugfs_create_dir() here will cause a subsequent attempt in
> swiotlb_create_debugfs() to fail (directory already exists) leading to
> mem->debugfs being assigned an error value. I suspect the creation of
> the debugfs directory needs to be separated from io_tlb_default_mem
> being set.

debugfs creation should move into the if (!mem) {...} above to avoid
duplication.
I think having a separated struct dentry pointer for the default
debugfs should be enough?

if (!debugfs)
    debugfs = debugfs_create_dir("swiotlb", NULL);
swiotlb_create_debugfs(mem, rmem->name, debugfs);

>
> Other than that I gave this series a go with our prototype of Arm's
> Confidential Computer Architecture[1] - since the majority of the
> guest's memory is protected from the host the restricted DMA pool allows
> (only) a small area to be shared with the host.
>
> After fixing (well hacking round) the above it all seems to be working
> fine with virtio drivers.
>
> Thanks,
>
> Steve
>
> [1]
> https://www.arm.com/why-arm/architecture/security-features/arm-confidential-compute-architecture

