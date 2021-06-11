Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 01DFB3A457F
	for <lists+xen-devel@lfdr.de>; Fri, 11 Jun 2021 17:33:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.140490.259618 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lrjAD-0008BD-1F; Fri, 11 Jun 2021 15:33:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 140490.259618; Fri, 11 Jun 2021 15:33:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lrjAC-000886-TA; Fri, 11 Jun 2021 15:33:40 +0000
Received: by outflank-mailman (input) for mailman id 140490;
 Fri, 11 Jun 2021 15:33:39 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9xgm=LF=chromium.org=tientzu@srs-us1.protection.inumbo.net>)
 id 1lrjAB-00084A-Iq
 for xen-devel@lists.xenproject.org; Fri, 11 Jun 2021 15:33:39 +0000
Received: from mail-qt1-x82e.google.com (unknown [2607:f8b0:4864:20::82e])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id df2190ff-d6eb-4a4e-869d-71111195f6b3;
 Fri, 11 Jun 2021 15:33:38 +0000 (UTC)
Received: by mail-qt1-x82e.google.com with SMTP id o20so2859200qtr.8
 for <xen-devel@lists.xenproject.org>; Fri, 11 Jun 2021 08:33:38 -0700 (PDT)
Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com.
 [209.85.222.175])
 by smtp.gmail.com with ESMTPSA id p13sm4604412qkg.80.2021.06.11.08.33.36
 for <xen-devel@lists.xenproject.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 11 Jun 2021 08:33:37 -0700 (PDT)
Received: by mail-qk1-f175.google.com with SMTP id c138so18483830qkg.5
 for <xen-devel@lists.xenproject.org>; Fri, 11 Jun 2021 08:33:36 -0700 (PDT)
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
X-Inumbo-ID: df2190ff-d6eb-4a4e-869d-71111195f6b3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=fBuYG3h4tzknol76ldpkR8y5ZC6wvonHUnBR2HL9Wtc=;
        b=M4+LxFlHhc172xr0wDyY3Eu6l5zAWJucjpWrnMkz6xoYVmzJVmf2sjGSgMe9ycmELY
         m5ZJiAX1In+iQOKRwQmSpbPtym+qFrQOUCVwhjVtCNr+j5I7ahondcOGDBRXfde7p3O6
         sP5HLhecC4zQN5hX5jVm8CbTc59EB916NxMBc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=fBuYG3h4tzknol76ldpkR8y5ZC6wvonHUnBR2HL9Wtc=;
        b=mjJZHyXANG7nA/sOEpdGJQVXpq3GK2tGGrGyh5OEI6Lp6IBYTCxsKOnBUowI70eCKa
         waxUQPxrCWcKV7E39yKyl/ShYrg09FK++v3jDgH0i1qfLfKHL7NLpONd3gQv25Z3NcvZ
         X0v5I3DBObPFmZ7lJAj936ofxPB/MfzrzM7Gd2PkHfCpIGKt4B2iK621JRXCeyk9LzaZ
         aaYoT1JuT1ZlhH7OhnXGztGtIMacPEbAkdqOw2HWyFX6nPKx0EJrYsDQmrQ7L7WUISO0
         u29bqWPweGeSF40vLq+/ZbfI66JhARfQ3DUN5ynYFSE3WyA0adcIXISfmUiMIM0WBT7z
         7s+A==
X-Gm-Message-State: AOAM533xeQ2eCU62aL4QFsBnk92c7jCmyjlLhEid0vraXbOZE+L0n8eC
	4CWzPGqrDz6Y4A+PzScDz2KDvl5wu7DCpQ==
X-Google-Smtp-Source: ABdhPJwsV6MSU1nr7Fqavxr1GQQUCPAhqskMUJ6QNXHvsRNSmrnUeIXrqDMF/YsRE5TUzcUkpD48Qw==
X-Received: by 2002:ac8:71d9:: with SMTP id i25mr4376046qtp.385.1623425618082;
        Fri, 11 Jun 2021 08:33:38 -0700 (PDT)
X-Received: by 2002:a02:cc2f:: with SMTP id o15mr4521234jap.3.1623425606067;
 Fri, 11 Jun 2021 08:33:26 -0700 (PDT)
MIME-Version: 1.0
References: <20210611152659.2142983-1-tientzu@chromium.org> <20210611152659.2142983-4-tientzu@chromium.org>
In-Reply-To: <20210611152659.2142983-4-tientzu@chromium.org>
From: Claire Chang <tientzu@chromium.org>
Date: Fri, 11 Jun 2021 23:33:15 +0800
X-Gmail-Original-Message-ID: <CALiNf2_nzP=qLg5Fqvn3kiaMiaR9r+QJhE3pqypW4FPrgo23DQ@mail.gmail.com>
Message-ID: <CALiNf2_nzP=qLg5Fqvn3kiaMiaR9r+QJhE3pqypW4FPrgo23DQ@mail.gmail.com>
Subject: Re: [PATCH v9 03/14] swiotlb: Set dev->dma_io_tlb_mem to the swiotlb
 pool used
To: Rob Herring <robh+dt@kernel.org>, mpe@ellerman.id.au, Joerg Roedel <joro@8bytes.org>, 
	Will Deacon <will@kernel.org>, Frank Rowand <frowand.list@gmail.com>, 
	Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, boris.ostrovsky@oracle.com, jgross@suse.com, 
	Christoph Hellwig <hch@lst.de>, Marek Szyprowski <m.szyprowski@samsung.com>
Cc: benh@kernel.crashing.org, paulus@samba.org, 
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
	matthew.auld@intel.com, rodrigo.vivi@intel.com, 
	thomas.hellstrom@linux.intel.com
Content-Type: text/plain; charset="UTF-8"

I'm not sure if this would break arch/x86/pci/sta2x11-fixup.c
swiotlb_late_init_with_default_size is called here
https://elixir.bootlin.com/linux/v5.13-rc5/source/arch/x86/pci/sta2x11-fixup.c#L60

On Fri, Jun 11, 2021 at 11:27 PM Claire Chang <tientzu@chromium.org> wrote:
>
> Always have the pointer to the swiotlb pool used in struct device. This
> could help simplify the code for other pools.
>
> Signed-off-by: Claire Chang <tientzu@chromium.org>
> ---
>  drivers/of/device.c     | 3 +++
>  include/linux/device.h  | 4 ++++
>  include/linux/swiotlb.h | 8 ++++++++
>  kernel/dma/swiotlb.c    | 8 ++++----
>  4 files changed, 19 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/of/device.c b/drivers/of/device.c
> index c5a9473a5fb1..1defdf15ba95 100644
> --- a/drivers/of/device.c
> +++ b/drivers/of/device.c
> @@ -165,6 +165,9 @@ int of_dma_configure_id(struct device *dev, struct device_node *np,
>
>         arch_setup_dma_ops(dev, dma_start, size, iommu, coherent);
>
> +       if (IS_ENABLED(CONFIG_SWIOTLB))
> +               swiotlb_set_io_tlb_default_mem(dev);
> +
>         return 0;
>  }
>  EXPORT_SYMBOL_GPL(of_dma_configure_id);
> diff --git a/include/linux/device.h b/include/linux/device.h
> index 4443e12238a0..2e9a378c9100 100644
> --- a/include/linux/device.h
> +++ b/include/linux/device.h
> @@ -432,6 +432,7 @@ struct dev_links_info {
>   * @dma_pools: Dma pools (if dma'ble device).
>   * @dma_mem:   Internal for coherent mem override.
>   * @cma_area:  Contiguous memory area for dma allocations
> + * @dma_io_tlb_mem: Pointer to the swiotlb pool used.  Not for driver use.
>   * @archdata:  For arch-specific additions.
>   * @of_node:   Associated device tree node.
>   * @fwnode:    Associated device node supplied by platform firmware.
> @@ -540,6 +541,9 @@ struct device {
>  #ifdef CONFIG_DMA_CMA
>         struct cma *cma_area;           /* contiguous memory area for dma
>                                            allocations */
> +#endif
> +#ifdef CONFIG_SWIOTLB
> +       struct io_tlb_mem *dma_io_tlb_mem;
>  #endif
>         /* arch specific additions */
>         struct dev_archdata     archdata;
> diff --git a/include/linux/swiotlb.h b/include/linux/swiotlb.h
> index 216854a5e513..008125ccd509 100644
> --- a/include/linux/swiotlb.h
> +++ b/include/linux/swiotlb.h
> @@ -108,6 +108,11 @@ static inline bool is_swiotlb_buffer(phys_addr_t paddr)
>         return mem && paddr >= mem->start && paddr < mem->end;
>  }
>
> +static inline void swiotlb_set_io_tlb_default_mem(struct device *dev)
> +{
> +       dev->dma_io_tlb_mem = io_tlb_default_mem;
> +}
> +
>  void __init swiotlb_exit(void);
>  unsigned int swiotlb_max_segment(void);
>  size_t swiotlb_max_mapping_size(struct device *dev);
> @@ -119,6 +124,9 @@ static inline bool is_swiotlb_buffer(phys_addr_t paddr)
>  {
>         return false;
>  }
> +static inline void swiotlb_set_io_tlb_default_mem(struct device *dev)
> +{
> +}
>  static inline void swiotlb_exit(void)
>  {
>  }
> diff --git a/kernel/dma/swiotlb.c b/kernel/dma/swiotlb.c
> index 8a3e2b3b246d..29b950ab1351 100644
> --- a/kernel/dma/swiotlb.c
> +++ b/kernel/dma/swiotlb.c
> @@ -344,7 +344,7 @@ void __init swiotlb_exit(void)
>  static void swiotlb_bounce(struct device *dev, phys_addr_t tlb_addr, size_t size,
>                            enum dma_data_direction dir)
>  {
> -       struct io_tlb_mem *mem = io_tlb_default_mem;
> +       struct io_tlb_mem *mem = dev->dma_io_tlb_mem;
>         int index = (tlb_addr - mem->start) >> IO_TLB_SHIFT;
>         phys_addr_t orig_addr = mem->slots[index].orig_addr;
>         size_t alloc_size = mem->slots[index].alloc_size;
> @@ -426,7 +426,7 @@ static unsigned int wrap_index(struct io_tlb_mem *mem, unsigned int index)
>  static int find_slots(struct device *dev, phys_addr_t orig_addr,
>                 size_t alloc_size)
>  {
> -       struct io_tlb_mem *mem = io_tlb_default_mem;
> +       struct io_tlb_mem *mem = dev->dma_io_tlb_mem;
>         unsigned long boundary_mask = dma_get_seg_boundary(dev);
>         dma_addr_t tbl_dma_addr =
>                 phys_to_dma_unencrypted(dev, mem->start) & boundary_mask;
> @@ -503,7 +503,7 @@ phys_addr_t swiotlb_tbl_map_single(struct device *dev, phys_addr_t orig_addr,
>                 size_t mapping_size, size_t alloc_size,
>                 enum dma_data_direction dir, unsigned long attrs)
>  {
> -       struct io_tlb_mem *mem = io_tlb_default_mem;
> +       struct io_tlb_mem *mem = dev->dma_io_tlb_mem;
>         unsigned int offset = swiotlb_align_offset(dev, orig_addr);
>         unsigned int i;
>         int index;
> @@ -554,7 +554,7 @@ void swiotlb_tbl_unmap_single(struct device *hwdev, phys_addr_t tlb_addr,
>                               size_t mapping_size, enum dma_data_direction dir,
>                               unsigned long attrs)
>  {
> -       struct io_tlb_mem *mem = io_tlb_default_mem;
> +       struct io_tlb_mem *mem = hwdev->dma_io_tlb_mem;
>         unsigned long flags;
>         unsigned int offset = swiotlb_align_offset(hwdev, tlb_addr);
>         int index = (tlb_addr - offset - mem->start) >> IO_TLB_SHIFT;
> --
> 2.32.0.272.g935e593368-goog
>

