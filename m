Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D76A36B6F9
	for <lists+xen-devel@lfdr.de>; Mon, 26 Apr 2021 18:38:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.117812.223722 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lb4FS-0006ch-9F; Mon, 26 Apr 2021 16:38:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 117812.223722; Mon, 26 Apr 2021 16:38:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lb4FS-0006cK-5e; Mon, 26 Apr 2021 16:38:14 +0000
Received: by outflank-mailman (input) for mailman id 117812;
 Mon, 26 Apr 2021 16:38:12 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MWrc=JX=chromium.org=tientzu@srs-us1.protection.inumbo.net>)
 id 1lb4FQ-0006c8-Oi
 for xen-devel@lists.xenproject.org; Mon, 26 Apr 2021 16:38:12 +0000
Received: from mail-pj1-x1035.google.com (unknown [2607:f8b0:4864:20::1035])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0cd4ae7c-88fe-4363-8a0a-01fcf29c9b9b;
 Mon, 26 Apr 2021 16:38:11 +0000 (UTC)
Received: by mail-pj1-x1035.google.com with SMTP id
 f11-20020a17090a638bb02901524d3a3d48so5521091pjj.3
 for <xen-devel@lists.xenproject.org>; Mon, 26 Apr 2021 09:38:11 -0700 (PDT)
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com.
 [209.85.210.176])
 by smtp.gmail.com with ESMTPSA id q26sm224567pfg.146.2021.04.26.09.38.08
 for <xen-devel@lists.xenproject.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 26 Apr 2021 09:38:08 -0700 (PDT)
Received: by mail-pf1-f176.google.com with SMTP id c3so20553592pfo.3
 for <xen-devel@lists.xenproject.org>; Mon, 26 Apr 2021 09:38:08 -0700 (PDT)
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
X-Inumbo-ID: 0cd4ae7c-88fe-4363-8a0a-01fcf29c9b9b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=cFKXKq/sKurvSVgvNvGkxgOiMlOZ5bG92GQyZxG6/Ow=;
        b=hQyrvIvY0OkwlUkO65L/o3TMJboyrA/EOLuUe0Pq7KgqeFtR8O9LJWrjeU2EQISYlu
         bJHPBsPqEo2jNERM7Qly7inrbryADiFPyU5whSnn5mfATXbgH1UnC4GjWrov7E7itgl/
         y/vmAUUGiGEmxu0IFynSQLccMWdifgG50rRhw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=cFKXKq/sKurvSVgvNvGkxgOiMlOZ5bG92GQyZxG6/Ow=;
        b=KE7ycAex85qFYZUnP7WuRfJ3KrCl49If8yODagciK9CGu0Yg15YePK6irj7zXKRoNY
         76qlrrx2/AUwiDSVlIqxIlxtyFMnTgIQXsfG6dxejPuFMnCtGo3AHAP4NfD79FSufy9a
         2qn9SFVRLDuaTFNlTS4/zOe4ag0LBVjMv7zxYXZdUXsABmB3pLMZBeYB2NvSz9cEWPdT
         vV0Y2mhRi05kafJg7fCveLXurzsGs9JkXVYyAJQoGCk32qDW3iaFZvR8iEm5ltLV3oov
         DcIvJKaDcJA5ocq8Zc8eOwvManxb8cUHHWw48DA8u5yk53JQj3NEBTBcy3NY2S1YKGT6
         jLww==
X-Gm-Message-State: AOAM533uOkvrnK69g4TBxCQhxAzgUc0GnxBN6HTb1crrJ+3vy8OEnIpr
	2lzcOQJg9P3tLyBSCIuhwAFXviMVewLzhQ==
X-Google-Smtp-Source: ABdhPJy2tmpQDEHs6da1EkE2NEPQIbqbfCMXRrHbmcxgdnBYNqEm9wruWum5ezMjDUYCLlveodSf2g==
X-Received: by 2002:a17:90a:303:: with SMTP id 3mr24147321pje.36.1619455090084;
        Mon, 26 Apr 2021 09:38:10 -0700 (PDT)
X-Received: by 2002:a92:7307:: with SMTP id o7mr14655769ilc.5.1619455077553;
 Mon, 26 Apr 2021 09:37:57 -0700 (PDT)
MIME-Version: 1.0
References: <20210422081508.3942748-1-tientzu@chromium.org>
 <20210422081508.3942748-9-tientzu@chromium.org> <1f84aa4c-f966-0986-b5a4-eecbf3b454ec@arm.com>
In-Reply-To: <1f84aa4c-f966-0986-b5a4-eecbf3b454ec@arm.com>
From: Claire Chang <tientzu@chromium.org>
Date: Tue, 27 Apr 2021 00:37:46 +0800
X-Gmail-Original-Message-ID: <CALiNf29N3U5GZKNN90NzjSeQ0WG4dxyRzU97fJ-r9OuChzLWKA@mail.gmail.com>
Message-ID: <CALiNf29N3U5GZKNN90NzjSeQ0WG4dxyRzU97fJ-r9OuChzLWKA@mail.gmail.com>
Subject: Re: [PATCH v5 08/16] swiotlb: Update is_swiotlb_active to add a
 struct device argument
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

On Fri, Apr 23, 2021 at 9:31 PM Robin Murphy <robin.murphy@arm.com> wrote:
>
> On 2021-04-22 09:15, Claire Chang wrote:
> > Update is_swiotlb_active to add a struct device argument. This will be
> > useful later to allow for restricted DMA pool.
> >
> > Signed-off-by: Claire Chang <tientzu@chromium.org>
> > ---
> >   drivers/gpu/drm/i915/gem/i915_gem_internal.c | 2 +-
> >   drivers/gpu/drm/nouveau/nouveau_ttm.c        | 2 +-
> >   drivers/pci/xen-pcifront.c                   | 2 +-
> >   include/linux/swiotlb.h                      | 4 ++--
> >   kernel/dma/direct.c                          | 2 +-
> >   kernel/dma/swiotlb.c                         | 4 ++--
> >   6 files changed, 8 insertions(+), 8 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/i915/gem/i915_gem_internal.c b/drivers/gpu/drm/i915/gem/i915_gem_internal.c
> > index ce6b664b10aa..7d48c433446b 100644
> > --- a/drivers/gpu/drm/i915/gem/i915_gem_internal.c
> > +++ b/drivers/gpu/drm/i915/gem/i915_gem_internal.c
> > @@ -42,7 +42,7 @@ static int i915_gem_object_get_pages_internal(struct drm_i915_gem_object *obj)
> >
> >       max_order = MAX_ORDER;
> >   #ifdef CONFIG_SWIOTLB
> > -     if (is_swiotlb_active()) {
> > +     if (is_swiotlb_active(NULL)) {
> >               unsigned int max_segment;
> >
> >               max_segment = swiotlb_max_segment();
> > diff --git a/drivers/gpu/drm/nouveau/nouveau_ttm.c b/drivers/gpu/drm/nouveau/nouveau_ttm.c
> > index e8b506a6685b..2a2ae6d6cf6d 100644
> > --- a/drivers/gpu/drm/nouveau/nouveau_ttm.c
> > +++ b/drivers/gpu/drm/nouveau/nouveau_ttm.c
> > @@ -321,7 +321,7 @@ nouveau_ttm_init(struct nouveau_drm *drm)
> >       }
> >
> >   #if IS_ENABLED(CONFIG_SWIOTLB) && IS_ENABLED(CONFIG_X86)
> > -     need_swiotlb = is_swiotlb_active();
> > +     need_swiotlb = is_swiotlb_active(NULL);
> >   #endif
> >
> >       ret = ttm_device_init(&drm->ttm.bdev, &nouveau_bo_driver, drm->dev->dev,
> > diff --git a/drivers/pci/xen-pcifront.c b/drivers/pci/xen-pcifront.c
> > index b7a8f3a1921f..6d548ce53ce7 100644
> > --- a/drivers/pci/xen-pcifront.c
> > +++ b/drivers/pci/xen-pcifront.c
> > @@ -693,7 +693,7 @@ static int pcifront_connect_and_init_dma(struct pcifront_device *pdev)
> >
> >       spin_unlock(&pcifront_dev_lock);
> >
> > -     if (!err && !is_swiotlb_active()) {
> > +     if (!err && !is_swiotlb_active(NULL)) {
> >               err = pci_xen_swiotlb_init_late();
> >               if (err)
> >                       dev_err(&pdev->xdev->dev, "Could not setup SWIOTLB!\n");
> > diff --git a/include/linux/swiotlb.h b/include/linux/swiotlb.h
> > index 2a6cca07540b..c530c976d18b 100644
> > --- a/include/linux/swiotlb.h
> > +++ b/include/linux/swiotlb.h
> > @@ -123,7 +123,7 @@ static inline bool is_swiotlb_buffer(struct device *dev, phys_addr_t paddr)
> >   void __init swiotlb_exit(void);
> >   unsigned int swiotlb_max_segment(void);
> >   size_t swiotlb_max_mapping_size(struct device *dev);
> > -bool is_swiotlb_active(void);
> > +bool is_swiotlb_active(struct device *dev);
> >   void __init swiotlb_adjust_size(unsigned long size);
> >   #else
> >   #define swiotlb_force SWIOTLB_NO_FORCE
> > @@ -143,7 +143,7 @@ static inline size_t swiotlb_max_mapping_size(struct device *dev)
> >       return SIZE_MAX;
> >   }
> >
> > -static inline bool is_swiotlb_active(void)
> > +static inline bool is_swiotlb_active(struct device *dev)
> >   {
> >       return false;
> >   }
> > diff --git a/kernel/dma/direct.c b/kernel/dma/direct.c
> > index 84c9feb5474a..7a88c34d0867 100644
> > --- a/kernel/dma/direct.c
> > +++ b/kernel/dma/direct.c
> > @@ -495,7 +495,7 @@ int dma_direct_supported(struct device *dev, u64 mask)
> >   size_t dma_direct_max_mapping_size(struct device *dev)
> >   {
> >       /* If SWIOTLB is active, use its maximum mapping size */
> > -     if (is_swiotlb_active() &&
> > +     if (is_swiotlb_active(dev) &&
> >           (dma_addressing_limited(dev) || swiotlb_force == SWIOTLB_FORCE))
>
> I wonder if it's worth trying to fold these other conditions into
> is_swiotlb_active() itself? I'm not entirely sure what matters for Xen,
> but for the other cases it seems like they probably only care about
> whether bouncing may occur for their particular device or not (possibly
> they want to be using dma_max_mapping_size() now anyway - TBH I'm
> struggling to make sense of what the swiotlb_max_segment business is
> supposed to mean).

I think leaving those conditions outside of is_swiotlb_active() might
help avoid confusion with is_dev_swiotlb_force() in patch #9? We need
is_dev_swiotlb_force() only because the restricted DMA pool supports
memory allocation, but the default swiotlb doesn't.

>
> Otherwise, patch #9 will need to touch here as well to make sure that
> per-device forced bouncing is reflected correctly.

You're right. Otherwise, is_dev_swiotlb_force is needed here.


>
> Robin.
>
> >               return swiotlb_max_mapping_size(dev);
> >       return SIZE_MAX;
> > diff --git a/kernel/dma/swiotlb.c b/kernel/dma/swiotlb.c
> > index ffbb8724e06c..1d221343f1c8 100644
> > --- a/kernel/dma/swiotlb.c
> > +++ b/kernel/dma/swiotlb.c
> > @@ -659,9 +659,9 @@ size_t swiotlb_max_mapping_size(struct device *dev)
> >       return ((size_t)IO_TLB_SIZE) * IO_TLB_SEGSIZE;
> >   }
> >
> > -bool is_swiotlb_active(void)
> > +bool is_swiotlb_active(struct device *dev)
> >   {
> > -     return io_tlb_default_mem != NULL;
> > +     return get_io_tlb_mem(dev) != NULL;
> >   }
> >   EXPORT_SYMBOL_GPL(is_swiotlb_active);
> >
> >

