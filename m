Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 18E333AA844
	for <lists+xen-devel@lfdr.de>; Thu, 17 Jun 2021 02:47:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.143577.264534 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ltgBc-00068O-M6; Thu, 17 Jun 2021 00:47:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 143577.264534; Thu, 17 Jun 2021 00:47:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ltgBc-00065D-Ij; Thu, 17 Jun 2021 00:47:12 +0000
Received: by outflank-mailman (input) for mailman id 143577;
 Thu, 17 Jun 2021 00:47:11 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uYqS=LL=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1ltgBb-000657-B8
 for xen-devel@lists.xenproject.org; Thu, 17 Jun 2021 00:47:11 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 9f0d39f3-49fa-44d1-855f-fff67277c825;
 Thu, 17 Jun 2021 00:47:10 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id C7A2B613B9;
 Thu, 17 Jun 2021 00:47:07 +0000 (UTC)
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
X-Inumbo-ID: 9f0d39f3-49fa-44d1-855f-fff67277c825
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1623890829;
	bh=WCzGPQl/aym123sINb8QnvJYTwJNBRaVx2zLf3Bv1N8=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=rMohPe+tbKQa0AYXnI+IW3OaFUpO6B0eUu0gZForopqzfrCjPyFI1Ewjobgur6/dk
	 bLRtb8PIYvryWZweFMXTwAbMWtg0nctMUoV8kxk6uELmUKnBiVw5LeKCqL5SBhOByE
	 jiTek0nnewDrHmhCidXDSQ3WaahCsU5g4GDabRezUbSedVXgMEydAYEHuXFwzTS91g
	 cJMCyter7dx77I2E16IUKEfK8pcdYqTSbuwilDTS8T+uuTkXRJvXElaDgqvBEXf5YU
	 0wAWL6nOk87f0a1jJqezXJtxglL4nvT9peSjxOtxRa83ff4UqBDa3CGXSoXj4TqnFN
	 tHVw/jZbmu50w==
Date: Wed, 16 Jun 2021 17:47:07 -0700 (PDT)
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
Subject: Re: [PATCH v12 06/12] swiotlb: Use is_swiotlb_force_bounce for
 swiotlb data bouncing
In-Reply-To: <20210616062157.953777-7-tientzu@chromium.org>
Message-ID: <alpine.DEB.2.21.2106161711030.24906@sstabellini-ThinkPad-T480s>
References: <20210616062157.953777-1-tientzu@chromium.org> <20210616062157.953777-7-tientzu@chromium.org>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 16 Jun 2021, Claire Chang wrote:
> Propagate the swiotlb_force into io_tlb_default_mem->force_bounce and
> use it to determine whether to bounce the data or not. This will be
> useful later to allow for different pools.
> 
> Signed-off-by: Claire Chang <tientzu@chromium.org>
> ---
>  include/linux/swiotlb.h | 11 +++++++++++
>  kernel/dma/direct.c     |  2 +-
>  kernel/dma/direct.h     |  2 +-
>  kernel/dma/swiotlb.c    |  4 ++++
>  4 files changed, 17 insertions(+), 2 deletions(-)
> 
> diff --git a/include/linux/swiotlb.h b/include/linux/swiotlb.h
> index dd1c30a83058..8d8855c77d9a 100644
> --- a/include/linux/swiotlb.h
> +++ b/include/linux/swiotlb.h
> @@ -84,6 +84,7 @@ extern enum swiotlb_force swiotlb_force;
>   *		unmap calls.
>   * @debugfs:	The dentry to debugfs.
>   * @late_alloc:	%true if allocated using the page allocator
> + * @force_bounce: %true if swiotlb bouncing is forced
>   */
>  struct io_tlb_mem {
>  	phys_addr_t start;
> @@ -94,6 +95,7 @@ struct io_tlb_mem {
>  	spinlock_t lock;
>  	struct dentry *debugfs;
>  	bool late_alloc;
> +	bool force_bounce;
>  	struct io_tlb_slot {
>  		phys_addr_t orig_addr;
>  		size_t alloc_size;
> @@ -109,6 +111,11 @@ static inline bool is_swiotlb_buffer(struct device *dev, phys_addr_t paddr)
>  	return mem && paddr >= mem->start && paddr < mem->end;
>  }
>  
> +static inline bool is_swiotlb_force_bounce(struct device *dev)
> +{
> +	return dev->dma_io_tlb_mem->force_bounce;
> +}
>  void __init swiotlb_exit(void);
>  unsigned int swiotlb_max_segment(void);
>  size_t swiotlb_max_mapping_size(struct device *dev);
> @@ -120,6 +127,10 @@ static inline bool is_swiotlb_buffer(struct device *dev, phys_addr_t paddr)
>  {
>  	return false;
>  }
> +static inline bool is_swiotlb_force_bounce(struct device *dev)
> +{
> +	return false;
> +}
>  static inline void swiotlb_exit(void)
>  {
>  }
> diff --git a/kernel/dma/direct.c b/kernel/dma/direct.c
> index 7a88c34d0867..a92465b4eb12 100644
> --- a/kernel/dma/direct.c
> +++ b/kernel/dma/direct.c
> @@ -496,7 +496,7 @@ size_t dma_direct_max_mapping_size(struct device *dev)
>  {
>  	/* If SWIOTLB is active, use its maximum mapping size */
>  	if (is_swiotlb_active(dev) &&
> -	    (dma_addressing_limited(dev) || swiotlb_force == SWIOTLB_FORCE))
> +	    (dma_addressing_limited(dev) || is_swiotlb_force_bounce(dev)))
>  		return swiotlb_max_mapping_size(dev);
>  	return SIZE_MAX;
>  }
> diff --git a/kernel/dma/direct.h b/kernel/dma/direct.h
> index 13e9e7158d94..4632b0f4f72e 100644
> --- a/kernel/dma/direct.h
> +++ b/kernel/dma/direct.h
> @@ -87,7 +87,7 @@ static inline dma_addr_t dma_direct_map_page(struct device *dev,
>  	phys_addr_t phys = page_to_phys(page) + offset;
>  	dma_addr_t dma_addr = phys_to_dma(dev, phys);
>  
> -	if (unlikely(swiotlb_force == SWIOTLB_FORCE))
> +	if (is_swiotlb_force_bounce(dev))
>  		return swiotlb_map(dev, phys, size, dir, attrs);
>
>  	if (unlikely(!dma_capable(dev, dma_addr, size, true))) {

Should we also make the same change in
drivers/xen/swiotlb-xen.c:xen_swiotlb_map_page ?

If I make that change, I can see that everything is working as
expected for a restricted-dma device with Linux running as dom0 on Xen.
However, is_swiotlb_force_bounce returns non-zero even for normal
non-restricted-dma devices. That shouldn't happen, right?

It looks like struct io_tlb_slot is not zeroed on allocation.
Adding memset(mem, 0x0, struct_size) in swiotlb_late_init_with_tbl
solves the issue.

With those two changes, the series passes my tests and you can add my
tested-by.

