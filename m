Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EA2A3693B6
	for <lists+xen-devel@lfdr.de>; Fri, 23 Apr 2021 15:36:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.116360.222105 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lZvyD-0006ZK-Sr; Fri, 23 Apr 2021 13:35:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 116360.222105; Fri, 23 Apr 2021 13:35:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lZvyD-0006Yv-Pd; Fri, 23 Apr 2021 13:35:45 +0000
Received: by outflank-mailman (input) for mailman id 116360;
 Fri, 23 Apr 2021 13:35:44 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=eGXB=JU=arm.com=robin.murphy@srs-us1.protection.inumbo.net>)
 id 1lZvyC-0006Yq-TC
 for xen-devel@lists.xenproject.org; Fri, 23 Apr 2021 13:35:44 +0000
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id a659579d-9935-4d80-ae19-2841cd014e33;
 Fri, 23 Apr 2021 13:35:43 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7FD1113A1;
 Fri, 23 Apr 2021 06:35:42 -0700 (PDT)
Received: from [10.57.62.63] (unknown [10.57.62.63])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 492D03F73B;
 Fri, 23 Apr 2021 06:35:34 -0700 (PDT)
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
X-Inumbo-ID: a659579d-9935-4d80-ae19-2841cd014e33
Subject: Re: [PATCH v5 16/16] of: Add plumbing for restricted DMA pool
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
 <20210422081508.3942748-17-tientzu@chromium.org>
From: Robin Murphy <robin.murphy@arm.com>
Message-ID: <03c5bc8a-3965-bf1d-01a4-97d074dfbe2b@arm.com>
Date: Fri, 23 Apr 2021 14:35:32 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <20210422081508.3942748-17-tientzu@chromium.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

On 2021-04-22 09:15, Claire Chang wrote:
> If a device is not behind an IOMMU, we look up the device node and set
> up the restricted DMA when the restricted-dma-pool is presented.
> 
> Signed-off-by: Claire Chang <tientzu@chromium.org>
> ---
>   drivers/of/address.c    | 25 +++++++++++++++++++++++++
>   drivers/of/device.c     |  3 +++
>   drivers/of/of_private.h |  5 +++++
>   3 files changed, 33 insertions(+)
> 
> diff --git a/drivers/of/address.c b/drivers/of/address.c
> index 54f221dde267..fff3adfe4986 100644
> --- a/drivers/of/address.c
> +++ b/drivers/of/address.c
> @@ -8,6 +8,7 @@
>   #include <linux/logic_pio.h>
>   #include <linux/module.h>
>   #include <linux/of_address.h>
> +#include <linux/of_reserved_mem.h>
>   #include <linux/pci.h>
>   #include <linux/pci_regs.h>
>   #include <linux/sizes.h>
> @@ -1109,6 +1110,30 @@ bool of_dma_is_coherent(struct device_node *np)
>   }
>   EXPORT_SYMBOL_GPL(of_dma_is_coherent);
>   
> +int of_dma_set_restricted_buffer(struct device *dev)
> +{
> +	struct device_node *node;
> +	int count, i;
> +
> +	if (!dev->of_node)
> +		return 0;
> +
> +	count = of_property_count_elems_of_size(dev->of_node, "memory-region",
> +						sizeof(phandle));
> +	for (i = 0; i < count; i++) {
> +		node = of_parse_phandle(dev->of_node, "memory-region", i);
> +		/* There might be multiple memory regions, but only one
> +		 * restriced-dma-pool region is allowed.
> +		 */

What's the use-case for having multiple regions if the restricted pool 
is by definition the only one accessible?

Robin.

> +		if (of_device_is_compatible(node, "restricted-dma-pool") &&
> +		    of_device_is_available(node))
> +			return of_reserved_mem_device_init_by_idx(
> +				dev, dev->of_node, i);
> +	}
> +
> +	return 0;
> +}
> +
>   /**
>    * of_mmio_is_nonposted - Check if device uses non-posted MMIO
>    * @np:	device node
> diff --git a/drivers/of/device.c b/drivers/of/device.c
> index c5a9473a5fb1..d8d865223e51 100644
> --- a/drivers/of/device.c
> +++ b/drivers/of/device.c
> @@ -165,6 +165,9 @@ int of_dma_configure_id(struct device *dev, struct device_node *np,
>   
>   	arch_setup_dma_ops(dev, dma_start, size, iommu, coherent);
>   
> +	if (!iommu)
> +		return of_dma_set_restricted_buffer(dev);
> +
>   	return 0;
>   }
>   EXPORT_SYMBOL_GPL(of_dma_configure_id);
> diff --git a/drivers/of/of_private.h b/drivers/of/of_private.h
> index d717efbd637d..e9237f5eff48 100644
> --- a/drivers/of/of_private.h
> +++ b/drivers/of/of_private.h
> @@ -163,12 +163,17 @@ struct bus_dma_region;
>   #if defined(CONFIG_OF_ADDRESS) && defined(CONFIG_HAS_DMA)
>   int of_dma_get_range(struct device_node *np,
>   		const struct bus_dma_region **map);
> +int of_dma_set_restricted_buffer(struct device *dev);
>   #else
>   static inline int of_dma_get_range(struct device_node *np,
>   		const struct bus_dma_region **map)
>   {
>   	return -ENODEV;
>   }
> +static inline int of_dma_get_restricted_buffer(struct device *dev)
> +{
> +	return -ENODEV;
> +}
>   #endif
>   
>   #endif /* _LINUX_OF_PRIVATE_H */
> 

