Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B5313ABF7F
	for <lists+xen-devel@lfdr.de>; Fri, 18 Jun 2021 01:31:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.144203.265501 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lu1TQ-0002wv-HF; Thu, 17 Jun 2021 23:31:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 144203.265501; Thu, 17 Jun 2021 23:31:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lu1TQ-0002tp-Cw; Thu, 17 Jun 2021 23:31:00 +0000
Received: by outflank-mailman (input) for mailman id 144203;
 Thu, 17 Jun 2021 23:30:58 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uYqS=LL=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1lu1TO-0002s9-Mw
 for xen-devel@lists.xenproject.org; Thu, 17 Jun 2021 23:30:58 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 9187af39-9335-4cea-8bb8-d2342f4342cb;
 Thu, 17 Jun 2021 23:30:58 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id C8E526120A;
 Thu, 17 Jun 2021 23:30:55 +0000 (UTC)
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
X-Inumbo-ID: 9187af39-9335-4cea-8bb8-d2342f4342cb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1623972657;
	bh=4/LSkdFzmkpBIqOs2lik6bFTOLfsE1vFp3pSPvsIAqo=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=KabHsUuSd3hUeQkH5QL2Sast+Pt6XMU4ZN9i3oUCsqYyVMK9whYkZKwQyJXODJVNc
	 TzO5tFR1BNLnZQ5KkIoC5rq/vVgcjDuaAF80/HtiNb1wOVxm3CppaxT2xY/I4dzpYB
	 M+Aev1dOzNNy3oC1+YCccgFClj9tP/zQxcmXw1XC5VbZG80dLVkb8zSynKXi4NVwyn
	 0SJkjSwb2Rhj6hcwYba0AuLzEBy00TQw8hBr3kM6sBHZR9h/6pIWY0zm3Vq8KbPM5Z
	 6BOc0hRZnL9tnUFnAutTcMrNXIzinS4Gk728uyb268u6n8vujkFE/QAFXn20IgjiLI
	 HE4nztpznGM9g==
Date: Thu, 17 Jun 2021 16:30:55 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Claire Chang <tientzu@chromium.org>
cc: Rob Herring <robh+dt@kernel.org>, mpe@ellerman.id.au, 
    Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>, 
    Frank Rowand <frowand.list@gmail.com>, 
    Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, boris.ostrovsky@oracle.com, 
    jgross@suse.com, Christoph Hellwig <hch@lst.de>, 
    Marek Szyprowski <m.szyprowski@samsung.com>, benh@kernel.crashing.org, 
    paulus@samba.org, 
    "list@263.net:IOMMU DRIVERS" <iommu@lists.linux-foundation.org>, 
    sstabellini@kernel.org, Robin Murphy <robin.murphy@arm.com>, 
    grant.likely@arm.com, xypron.glpk@gmx.de, 
    Thierry Reding <treding@nvidia.com>, mingo@kernel.org, 
    bauerman@linux.ibm.com, peterz@infradead.org, 
    Greg KH <gregkh@linuxfoundation.org>, 
    Saravana Kannan <saravanak@google.com>, 
    "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>, 
    heikki.krogerus@linux.intel.com, 
    Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
    Randy Dunlap <rdunlap@infradead.org>, 
    Dan Williams <dan.j.williams@intel.com>, 
    Bartosz Golaszewski <bgolaszewski@baylibre.com>, 
    linux-devicetree <devicetree@vger.kernel.org>, 
    lkml <linux-kernel@vger.kernel.org>, linuxppc-dev@lists.ozlabs.org, 
    xen-devel@lists.xenproject.org, Nicolas Boichat <drinkcat@chromium.org>, 
    Jim Quinlan <james.quinlan@broadcom.com>, tfiga@chromium.org, 
    bskeggs@redhat.com, bhelgaas@google.com, chris@chris-wilson.co.uk, 
    daniel@ffwll.ch, airlied@linux.ie, dri-devel@lists.freedesktop.org, 
    intel-gfx@lists.freedesktop.org, jani.nikula@linux.intel.com, 
    jxgao@google.com, joonas.lahtinen@linux.intel.com, 
    linux-pci@vger.kernel.org, maarten.lankhorst@linux.intel.com, 
    matthew.auld@intel.com, rodrigo.vivi@intel.com, 
    thomas.hellstrom@linux.intel.com
Subject: Re: [PATCH v13 04/12] swiotlb: Update is_swiotlb_buffer to add a
 struct device argument
In-Reply-To: <20210617062635.1660944-5-tientzu@chromium.org>
Message-ID: <alpine.DEB.2.21.2106171445110.24906@sstabellini-ThinkPad-T480s>
References: <20210617062635.1660944-1-tientzu@chromium.org> <20210617062635.1660944-5-tientzu@chromium.org>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 17 Jun 2021, Claire Chang wrote:
> Update is_swiotlb_buffer to add a struct device argument. This will be
> useful later to allow for different pools.
> 
> Signed-off-by: Claire Chang <tientzu@chromium.org>
> Reviewed-by: Christoph Hellwig <hch@lst.de>
> Tested-by: Stefano Stabellini <sstabellini@kernel.org>
> Tested-by: Will Deacon <will@kernel.org>

Acked-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
>  drivers/iommu/dma-iommu.c | 12 ++++++------
>  drivers/xen/swiotlb-xen.c |  2 +-
>  include/linux/swiotlb.h   |  7 ++++---
>  kernel/dma/direct.c       |  6 +++---
>  kernel/dma/direct.h       |  6 +++---
>  5 files changed, 17 insertions(+), 16 deletions(-)
> 
> diff --git a/drivers/iommu/dma-iommu.c b/drivers/iommu/dma-iommu.c
> index 3087d9fa6065..10997ef541f8 100644
> --- a/drivers/iommu/dma-iommu.c
> +++ b/drivers/iommu/dma-iommu.c
> @@ -507,7 +507,7 @@ static void __iommu_dma_unmap_swiotlb(struct device *dev, dma_addr_t dma_addr,
>  
>  	__iommu_dma_unmap(dev, dma_addr, size);
>  
> -	if (unlikely(is_swiotlb_buffer(phys)))
> +	if (unlikely(is_swiotlb_buffer(dev, phys)))
>  		swiotlb_tbl_unmap_single(dev, phys, size, dir, attrs);
>  }
>  
> @@ -578,7 +578,7 @@ static dma_addr_t __iommu_dma_map_swiotlb(struct device *dev, phys_addr_t phys,
>  	}
>  
>  	iova = __iommu_dma_map(dev, phys, aligned_size, prot, dma_mask);
> -	if (iova == DMA_MAPPING_ERROR && is_swiotlb_buffer(phys))
> +	if (iova == DMA_MAPPING_ERROR && is_swiotlb_buffer(dev, phys))
>  		swiotlb_tbl_unmap_single(dev, phys, org_size, dir, attrs);
>  	return iova;
>  }
> @@ -749,7 +749,7 @@ static void iommu_dma_sync_single_for_cpu(struct device *dev,
>  	if (!dev_is_dma_coherent(dev))
>  		arch_sync_dma_for_cpu(phys, size, dir);
>  
> -	if (is_swiotlb_buffer(phys))
> +	if (is_swiotlb_buffer(dev, phys))
>  		swiotlb_sync_single_for_cpu(dev, phys, size, dir);
>  }
>  
> @@ -762,7 +762,7 @@ static void iommu_dma_sync_single_for_device(struct device *dev,
>  		return;
>  
>  	phys = iommu_iova_to_phys(iommu_get_dma_domain(dev), dma_handle);
> -	if (is_swiotlb_buffer(phys))
> +	if (is_swiotlb_buffer(dev, phys))
>  		swiotlb_sync_single_for_device(dev, phys, size, dir);
>  
>  	if (!dev_is_dma_coherent(dev))
> @@ -783,7 +783,7 @@ static void iommu_dma_sync_sg_for_cpu(struct device *dev,
>  		if (!dev_is_dma_coherent(dev))
>  			arch_sync_dma_for_cpu(sg_phys(sg), sg->length, dir);
>  
> -		if (is_swiotlb_buffer(sg_phys(sg)))
> +		if (is_swiotlb_buffer(dev, sg_phys(sg)))
>  			swiotlb_sync_single_for_cpu(dev, sg_phys(sg),
>  						    sg->length, dir);
>  	}
> @@ -800,7 +800,7 @@ static void iommu_dma_sync_sg_for_device(struct device *dev,
>  		return;
>  
>  	for_each_sg(sgl, sg, nelems, i) {
> -		if (is_swiotlb_buffer(sg_phys(sg)))
> +		if (is_swiotlb_buffer(dev, sg_phys(sg)))
>  			swiotlb_sync_single_for_device(dev, sg_phys(sg),
>  						       sg->length, dir);
>  
> diff --git a/drivers/xen/swiotlb-xen.c b/drivers/xen/swiotlb-xen.c
> index 4c89afc0df62..0c6ed09f8513 100644
> --- a/drivers/xen/swiotlb-xen.c
> +++ b/drivers/xen/swiotlb-xen.c
> @@ -100,7 +100,7 @@ static int is_xen_swiotlb_buffer(struct device *dev, dma_addr_t dma_addr)
>  	 * in our domain. Therefore _only_ check address within our domain.
>  	 */
>  	if (pfn_valid(PFN_DOWN(paddr)))
> -		return is_swiotlb_buffer(paddr);
> +		return is_swiotlb_buffer(dev, paddr);
>  	return 0;
>  }
>  
> diff --git a/include/linux/swiotlb.h b/include/linux/swiotlb.h
> index 216854a5e513..d1f3d95881cd 100644
> --- a/include/linux/swiotlb.h
> +++ b/include/linux/swiotlb.h
> @@ -2,6 +2,7 @@
>  #ifndef __LINUX_SWIOTLB_H
>  #define __LINUX_SWIOTLB_H
>  
> +#include <linux/device.h>
>  #include <linux/dma-direction.h>
>  #include <linux/init.h>
>  #include <linux/types.h>
> @@ -101,9 +102,9 @@ struct io_tlb_mem {
>  };
>  extern struct io_tlb_mem *io_tlb_default_mem;
>  
> -static inline bool is_swiotlb_buffer(phys_addr_t paddr)
> +static inline bool is_swiotlb_buffer(struct device *dev, phys_addr_t paddr)
>  {
> -	struct io_tlb_mem *mem = io_tlb_default_mem;
> +	struct io_tlb_mem *mem = dev->dma_io_tlb_mem;
>  
>  	return mem && paddr >= mem->start && paddr < mem->end;
>  }
> @@ -115,7 +116,7 @@ bool is_swiotlb_active(void);
>  void __init swiotlb_adjust_size(unsigned long size);
>  #else
>  #define swiotlb_force SWIOTLB_NO_FORCE
> -static inline bool is_swiotlb_buffer(phys_addr_t paddr)
> +static inline bool is_swiotlb_buffer(struct device *dev, phys_addr_t paddr)
>  {
>  	return false;
>  }
> diff --git a/kernel/dma/direct.c b/kernel/dma/direct.c
> index f737e3347059..84c9feb5474a 100644
> --- a/kernel/dma/direct.c
> +++ b/kernel/dma/direct.c
> @@ -343,7 +343,7 @@ void dma_direct_sync_sg_for_device(struct device *dev,
>  	for_each_sg(sgl, sg, nents, i) {
>  		phys_addr_t paddr = dma_to_phys(dev, sg_dma_address(sg));
>  
> -		if (unlikely(is_swiotlb_buffer(paddr)))
> +		if (unlikely(is_swiotlb_buffer(dev, paddr)))
>  			swiotlb_sync_single_for_device(dev, paddr, sg->length,
>  						       dir);
>  
> @@ -369,7 +369,7 @@ void dma_direct_sync_sg_for_cpu(struct device *dev,
>  		if (!dev_is_dma_coherent(dev))
>  			arch_sync_dma_for_cpu(paddr, sg->length, dir);
>  
> -		if (unlikely(is_swiotlb_buffer(paddr)))
> +		if (unlikely(is_swiotlb_buffer(dev, paddr)))
>  			swiotlb_sync_single_for_cpu(dev, paddr, sg->length,
>  						    dir);
>  
> @@ -504,7 +504,7 @@ size_t dma_direct_max_mapping_size(struct device *dev)
>  bool dma_direct_need_sync(struct device *dev, dma_addr_t dma_addr)
>  {
>  	return !dev_is_dma_coherent(dev) ||
> -		is_swiotlb_buffer(dma_to_phys(dev, dma_addr));
> +	       is_swiotlb_buffer(dev, dma_to_phys(dev, dma_addr));
>  }
>  
>  /**
> diff --git a/kernel/dma/direct.h b/kernel/dma/direct.h
> index 50afc05b6f1d..13e9e7158d94 100644
> --- a/kernel/dma/direct.h
> +++ b/kernel/dma/direct.h
> @@ -56,7 +56,7 @@ static inline void dma_direct_sync_single_for_device(struct device *dev,
>  {
>  	phys_addr_t paddr = dma_to_phys(dev, addr);
>  
> -	if (unlikely(is_swiotlb_buffer(paddr)))
> +	if (unlikely(is_swiotlb_buffer(dev, paddr)))
>  		swiotlb_sync_single_for_device(dev, paddr, size, dir);
>  
>  	if (!dev_is_dma_coherent(dev))
> @@ -73,7 +73,7 @@ static inline void dma_direct_sync_single_for_cpu(struct device *dev,
>  		arch_sync_dma_for_cpu_all();
>  	}
>  
> -	if (unlikely(is_swiotlb_buffer(paddr)))
> +	if (unlikely(is_swiotlb_buffer(dev, paddr)))
>  		swiotlb_sync_single_for_cpu(dev, paddr, size, dir);
>  
>  	if (dir == DMA_FROM_DEVICE)
> @@ -113,7 +113,7 @@ static inline void dma_direct_unmap_page(struct device *dev, dma_addr_t addr,
>  	if (!(attrs & DMA_ATTR_SKIP_CPU_SYNC))
>  		dma_direct_sync_single_for_cpu(dev, addr, size, dir);
>  
> -	if (unlikely(is_swiotlb_buffer(phys)))
> +	if (unlikely(is_swiotlb_buffer(dev, phys)))
>  		swiotlb_tbl_unmap_single(dev, phys, size, dir, attrs);
>  }
>  #endif /* _KERNEL_DMA_DIRECT_H */
> -- 
> 2.32.0.288.g62a8d224e6-goog
> 

