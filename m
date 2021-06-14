Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C85293A5D16
	for <lists+xen-devel@lfdr.de>; Mon, 14 Jun 2021 08:26:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.141186.260892 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lsg38-0008Fa-Uc; Mon, 14 Jun 2021 06:26:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 141186.260892; Mon, 14 Jun 2021 06:26:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lsg38-0008C3-Qp; Mon, 14 Jun 2021 06:26:18 +0000
Received: by outflank-mailman (input) for mailman id 141186;
 Mon, 14 Jun 2021 06:26:17 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=aFdS=LI=lst.de=hch@srs-us1.protection.inumbo.net>)
 id 1lsg37-0008BU-4L
 for xen-devel@lists.xenproject.org; Mon, 14 Jun 2021 06:26:17 +0000
Received: from verein.lst.de (unknown [213.95.11.211])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1fde41bb-1bd4-475b-add9-be85f15a8019;
 Mon, 14 Jun 2021 06:26:16 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id 1F6F967373; Mon, 14 Jun 2021 08:26:14 +0200 (CEST)
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
X-Inumbo-ID: 1fde41bb-1bd4-475b-add9-be85f15a8019
Date: Mon, 14 Jun 2021 08:26:13 +0200
From: Christoph Hellwig <hch@lst.de>
To: Claire Chang <tientzu@chromium.org>
Cc: Rob Herring <robh+dt@kernel.org>, mpe@ellerman.id.au,
	Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
	Frank Rowand <frowand.list@gmail.com>,
	Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
	boris.ostrovsky@oracle.com, jgross@suse.com,
	Christoph Hellwig <hch@lst.de>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	benh@kernel.crashing.org, paulus@samba.org,
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
	xen-devel@lists.xenproject.org,
	Nicolas Boichat <drinkcat@chromium.org>,
	Jim Quinlan <james.quinlan@broadcom.com>, tfiga@chromium.org,
	bskeggs@redhat.com, bhelgaas@google.com, chris@chris-wilson.co.uk,
	daniel@ffwll.ch, airlied@linux.ie, dri-devel@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org, jani.nikula@linux.intel.com,
	jxgao@google.com, joonas.lahtinen@linux.intel.com,
	linux-pci@vger.kernel.org, maarten.lankhorst@linux.intel.com,
	matthew.auld@intel.com, rodrigo.vivi@intel.com,
	thomas.hellstrom@linux.intel.com
Subject: Re: [PATCH v9 09/14] swiotlb: Refactor swiotlb_tbl_unmap_single
Message-ID: <20210614062613.GI28343@lst.de>
References: <20210611152659.2142983-1-tientzu@chromium.org> <20210611152659.2142983-10-tientzu@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210611152659.2142983-10-tientzu@chromium.org>
User-Agent: Mutt/1.5.17 (2007-11-01)

On Fri, Jun 11, 2021 at 11:26:54PM +0800, Claire Chang wrote:
> Add a new function, release_slots, to make the code reusable for supporting
> different bounce buffer pools, e.g. restricted DMA pool.
> 
> Signed-off-by: Claire Chang <tientzu@chromium.org>
> ---
>  kernel/dma/swiotlb.c | 35 ++++++++++++++++++++---------------
>  1 file changed, 20 insertions(+), 15 deletions(-)
> 
> diff --git a/kernel/dma/swiotlb.c b/kernel/dma/swiotlb.c
> index 364c6c822063..a6562573f090 100644
> --- a/kernel/dma/swiotlb.c
> +++ b/kernel/dma/swiotlb.c
> @@ -554,27 +554,15 @@ phys_addr_t swiotlb_tbl_map_single(struct device *dev, phys_addr_t orig_addr,
>  	return tlb_addr;
>  }
>  
> -/*
> - * tlb_addr is the physical address of the bounce buffer to unmap.
> - */
> -void swiotlb_tbl_unmap_single(struct device *hwdev, phys_addr_t tlb_addr,
> -			      size_t mapping_size, enum dma_data_direction dir,
> -			      unsigned long attrs)
> +static void release_slots(struct device *dev, phys_addr_t tlb_addr)
>  {
> -	struct io_tlb_mem *mem = hwdev->dma_io_tlb_mem;
> +	struct io_tlb_mem *mem = dev->dma_io_tlb_mem;
>  	unsigned long flags;
> -	unsigned int offset = swiotlb_align_offset(hwdev, tlb_addr);
> +	unsigned int offset = swiotlb_align_offset(dev, tlb_addr);
>  	int index = (tlb_addr - offset - mem->start) >> IO_TLB_SHIFT;
>  	int nslots = nr_slots(mem->slots[index].alloc_size + offset);
>  	int count, i;
>  
> -	/*
> -	 * First, sync the memory before unmapping the entry
> -	 */
> -	if (!(attrs & DMA_ATTR_SKIP_CPU_SYNC) &&
> -	    (dir == DMA_FROM_DEVICE || dir == DMA_BIDIRECTIONAL))
> -		swiotlb_bounce(hwdev, tlb_addr, mapping_size, DMA_FROM_DEVICE);
> -
>  	/*
>  	 * Return the buffer to the free list by setting the corresponding
>  	 * entries to indicate the number of contiguous entries available.
> @@ -609,6 +597,23 @@ void swiotlb_tbl_unmap_single(struct device *hwdev, phys_addr_t tlb_addr,
>  	spin_unlock_irqrestore(&mem->lock, flags);
>  }
>  
> +/*
> + * tlb_addr is the physical address of the bounce buffer to unmap.
> + */
> +void swiotlb_tbl_unmap_single(struct device *dev, phys_addr_t tlb_addr,
> +			      size_t mapping_size, enum dma_data_direction dir,
> +			      unsigned long attrs)
> +{
> +	/*
> +	 * First, sync the memory before unmapping the entry
> +	 */
> +	if (!(attrs & DMA_ATTR_SKIP_CPU_SYNC) &&
> +	    (dir == DMA_FROM_DEVICE || dir == DMA_BIDIRECTIONAL))
> +		swiotlb_bounce(dev, tlb_addr, mapping_size, DMA_FROM_DEVICE);
> +
> +	release_slots(dev, tlb_addr);

Can you give this a swiotlb_ prefix?

Otherwise looks good:

Reviewed-by: Christoph Hellwig <hch@lst.de>

