Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EAE536935E
	for <lists+xen-devel@lfdr.de>; Fri, 23 Apr 2021 15:31:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.116355.222094 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lZvuA-0006D0-BI; Fri, 23 Apr 2021 13:31:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 116355.222094; Fri, 23 Apr 2021 13:31:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lZvuA-0006Cb-7E; Fri, 23 Apr 2021 13:31:34 +0000
Received: by outflank-mailman (input) for mailman id 116355;
 Fri, 23 Apr 2021 13:31:32 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=eGXB=JU=arm.com=robin.murphy@srs-us1.protection.inumbo.net>)
 id 1lZvu8-0006CW-SJ
 for xen-devel@lists.xenproject.org; Fri, 23 Apr 2021 13:31:32 +0000
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id f6259c0a-b6fa-43bc-952d-2906afb4b9f6;
 Fri, 23 Apr 2021 13:31:31 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4DBFB1396;
 Fri, 23 Apr 2021 06:31:31 -0700 (PDT)
Received: from [10.57.62.63] (unknown [10.57.62.63])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3B58A3F73B;
 Fri, 23 Apr 2021 06:31:22 -0700 (PDT)
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
X-Inumbo-ID: f6259c0a-b6fa-43bc-952d-2906afb4b9f6
Subject: Re: [PATCH v5 08/16] swiotlb: Update is_swiotlb_active to add a
 struct device argument
To: Claire Chang <tientzu@chromium.org>, Joerg Roedel <joro@8bytes.org>,
 Will Deacon <will@kernel.org>, Frank Rowand <frowand.list@gmail.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, boris.ostrovsky@oracle.com,
 jgross@suse.com, Christoph Hellwig <hch@lst.de>,
 Marek Szyprowski <m.szyprowski@samsung.com>
Cc: benh@kernel.crashing.org, paulus@samba.org,
 "list@263.net:IOMMU DRIVERS" <iommu@lists.linux-foundation.org>,
 sstabellini@kernel.org, grant.likely@arm.com, xypron.glpk@gmx.de,
 Thierry Reding <treding@nvidia.com>, mingo@kernel.org,
 bauerman@linux.ibm.com, peterz@infradead.org,
 Greg KH <gregkh@linuxfoundation.org>, Saravana Kannan
 <saravanak@google.com>, "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>,
 heikki.krogerus@linux.intel.com,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Randy Dunlap <rdunlap@infradead.org>, Dan Williams
 <dan.j.williams@intel.com>, Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 linux-devicetree <devicetree@vger.kernel.org>,
 lkml <linux-kernel@vger.kernel.org>, linuxppc-dev@lists.ozlabs.org,
 xen-devel@lists.xenproject.org, Nicolas Boichat <drinkcat@chromium.org>,
 Jim Quinlan <james.quinlan@broadcom.com>, tfiga@chromium.org,
 bskeggs@redhat.com, bhelgaas@google.com, chris@chris-wilson.co.uk,
 daniel@ffwll.ch, airlied@linux.ie, dri-devel@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, jani.nikula@linux.intel.com,
 jxgao@google.com, joonas.lahtinen@linux.intel.com,
 linux-pci@vger.kernel.org, maarten.lankhorst@linux.intel.com,
 matthew.auld@intel.com, nouveau@lists.freedesktop.org,
 rodrigo.vivi@intel.com, thomas.hellstrom@linux.intel.com
References: <20210422081508.3942748-1-tientzu@chromium.org>
 <20210422081508.3942748-9-tientzu@chromium.org>
From: Robin Murphy <robin.murphy@arm.com>
Message-ID: <1f84aa4c-f966-0986-b5a4-eecbf3b454ec@arm.com>
Date: Fri, 23 Apr 2021 14:31:16 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <20210422081508.3942748-9-tientzu@chromium.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

On 2021-04-22 09:15, Claire Chang wrote:
> Update is_swiotlb_active to add a struct device argument. This will be
> useful later to allow for restricted DMA pool.
> 
> Signed-off-by: Claire Chang <tientzu@chromium.org>
> ---
>   drivers/gpu/drm/i915/gem/i915_gem_internal.c | 2 +-
>   drivers/gpu/drm/nouveau/nouveau_ttm.c        | 2 +-
>   drivers/pci/xen-pcifront.c                   | 2 +-
>   include/linux/swiotlb.h                      | 4 ++--
>   kernel/dma/direct.c                          | 2 +-
>   kernel/dma/swiotlb.c                         | 4 ++--
>   6 files changed, 8 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_internal.c b/drivers/gpu/drm/i915/gem/i915_gem_internal.c
> index ce6b664b10aa..7d48c433446b 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_internal.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_internal.c
> @@ -42,7 +42,7 @@ static int i915_gem_object_get_pages_internal(struct drm_i915_gem_object *obj)
>   
>   	max_order = MAX_ORDER;
>   #ifdef CONFIG_SWIOTLB
> -	if (is_swiotlb_active()) {
> +	if (is_swiotlb_active(NULL)) {
>   		unsigned int max_segment;
>   
>   		max_segment = swiotlb_max_segment();
> diff --git a/drivers/gpu/drm/nouveau/nouveau_ttm.c b/drivers/gpu/drm/nouveau/nouveau_ttm.c
> index e8b506a6685b..2a2ae6d6cf6d 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_ttm.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_ttm.c
> @@ -321,7 +321,7 @@ nouveau_ttm_init(struct nouveau_drm *drm)
>   	}
>   
>   #if IS_ENABLED(CONFIG_SWIOTLB) && IS_ENABLED(CONFIG_X86)
> -	need_swiotlb = is_swiotlb_active();
> +	need_swiotlb = is_swiotlb_active(NULL);
>   #endif
>   
>   	ret = ttm_device_init(&drm->ttm.bdev, &nouveau_bo_driver, drm->dev->dev,
> diff --git a/drivers/pci/xen-pcifront.c b/drivers/pci/xen-pcifront.c
> index b7a8f3a1921f..6d548ce53ce7 100644
> --- a/drivers/pci/xen-pcifront.c
> +++ b/drivers/pci/xen-pcifront.c
> @@ -693,7 +693,7 @@ static int pcifront_connect_and_init_dma(struct pcifront_device *pdev)
>   
>   	spin_unlock(&pcifront_dev_lock);
>   
> -	if (!err && !is_swiotlb_active()) {
> +	if (!err && !is_swiotlb_active(NULL)) {
>   		err = pci_xen_swiotlb_init_late();
>   		if (err)
>   			dev_err(&pdev->xdev->dev, "Could not setup SWIOTLB!\n");
> diff --git a/include/linux/swiotlb.h b/include/linux/swiotlb.h
> index 2a6cca07540b..c530c976d18b 100644
> --- a/include/linux/swiotlb.h
> +++ b/include/linux/swiotlb.h
> @@ -123,7 +123,7 @@ static inline bool is_swiotlb_buffer(struct device *dev, phys_addr_t paddr)
>   void __init swiotlb_exit(void);
>   unsigned int swiotlb_max_segment(void);
>   size_t swiotlb_max_mapping_size(struct device *dev);
> -bool is_swiotlb_active(void);
> +bool is_swiotlb_active(struct device *dev);
>   void __init swiotlb_adjust_size(unsigned long size);
>   #else
>   #define swiotlb_force SWIOTLB_NO_FORCE
> @@ -143,7 +143,7 @@ static inline size_t swiotlb_max_mapping_size(struct device *dev)
>   	return SIZE_MAX;
>   }
>   
> -static inline bool is_swiotlb_active(void)
> +static inline bool is_swiotlb_active(struct device *dev)
>   {
>   	return false;
>   }
> diff --git a/kernel/dma/direct.c b/kernel/dma/direct.c
> index 84c9feb5474a..7a88c34d0867 100644
> --- a/kernel/dma/direct.c
> +++ b/kernel/dma/direct.c
> @@ -495,7 +495,7 @@ int dma_direct_supported(struct device *dev, u64 mask)
>   size_t dma_direct_max_mapping_size(struct device *dev)
>   {
>   	/* If SWIOTLB is active, use its maximum mapping size */
> -	if (is_swiotlb_active() &&
> +	if (is_swiotlb_active(dev) &&
>   	    (dma_addressing_limited(dev) || swiotlb_force == SWIOTLB_FORCE))

I wonder if it's worth trying to fold these other conditions into 
is_swiotlb_active() itself? I'm not entirely sure what matters for Xen, 
but for the other cases it seems like they probably only care about 
whether bouncing may occur for their particular device or not (possibly 
they want to be using dma_max_mapping_size() now anyway - TBH I'm 
struggling to make sense of what the swiotlb_max_segment business is 
supposed to mean).

Otherwise, patch #9 will need to touch here as well to make sure that 
per-device forced bouncing is reflected correctly.

Robin.

>   		return swiotlb_max_mapping_size(dev);
>   	return SIZE_MAX;
> diff --git a/kernel/dma/swiotlb.c b/kernel/dma/swiotlb.c
> index ffbb8724e06c..1d221343f1c8 100644
> --- a/kernel/dma/swiotlb.c
> +++ b/kernel/dma/swiotlb.c
> @@ -659,9 +659,9 @@ size_t swiotlb_max_mapping_size(struct device *dev)
>   	return ((size_t)IO_TLB_SIZE) * IO_TLB_SEGSIZE;
>   }
>   
> -bool is_swiotlb_active(void)
> +bool is_swiotlb_active(struct device *dev)
>   {
> -	return io_tlb_default_mem != NULL;
> +	return get_io_tlb_mem(dev) != NULL;
>   }
>   EXPORT_SYMBOL_GPL(is_swiotlb_active);
>   
> 

