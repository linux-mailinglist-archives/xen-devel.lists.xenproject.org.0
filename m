Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C0CFC1DC83C
	for <lists+xen-devel@lfdr.de>; Thu, 21 May 2020 10:08:17 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jbgFD-0004cJ-BK; Thu, 21 May 2020 08:07:59 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=VGGW=7D=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1jbgFB-0004cD-EJ
 for xen-devel@lists.xenproject.org; Thu, 21 May 2020 08:07:57 +0000
X-Inumbo-ID: 2de0b50c-9b3a-11ea-ae69-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2de0b50c-9b3a-11ea-ae69-bc764e2007e4;
 Thu, 21 May 2020 08:07:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=fEdjHgy2pW+qAk723zdONWpbwhNqZU38m8VUziTh9HQ=; b=3jJo4wVB2f+53csNBCp9OUP961
 Zhep1hQOPo0cH+8+vjV/gg7OJhAXxImfCTpQBnCoXPYnRI2R/y8JPNqEDGv8S6YZY3jhEYHbNvKxx
 /tWfa9kJJ9INeovj6kgHusqsAPXabjfIbe7pdURU47UWlOnizXDfxG5KihbIqCbGH3u0=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1jbgF9-0004Lo-Fe; Thu, 21 May 2020 08:07:55 +0000
Received: from 54-240-197-225.amazon.com ([54.240.197.225]
 helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.89)
 (envelope-from <julien@xen.org>)
 id 1jbgF9-0006h0-8O; Thu, 21 May 2020 08:07:55 +0000
Subject: Re: [PATCH 08/10] swiotlb-xen: introduce phys_to_dma/dma_to_phys
 translations
To: Stefano Stabellini <sstabellini@kernel.org>, jgross@suse.com,
 boris.ostrovsky@oracle.com, konrad.wilk@oracle.com
References: <alpine.DEB.2.21.2005201628330.27502@sstabellini-ThinkPad-T480s>
 <20200520234520.22563-8-sstabellini@kernel.org>
From: Julien Grall <julien@xen.org>
Message-ID: <0fa24e23-ee7a-3ff0-cee0-8734bcda5f6a@xen.org>
Date: Thu, 21 May 2020 09:07:53 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200520234520.22563-8-sstabellini@kernel.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: xen-devel@lists.xenproject.org,
 Stefano Stabellini <stefano.stabellini@xilinx.com>,
 linux-kernel@vger.kernel.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Hi,

On 21/05/2020 00:45, Stefano Stabellini wrote:
> From: Stefano Stabellini <stefano.stabellini@xilinx.com>
> 
> Call dma_to_phys in is_xen_swiotlb_buffer.
> Call phys_to_dma in xen_phys_to_bus.
> Call dma_to_phys in xen_bus_to_phys.
> 
> Everything is taken care of by these changes except for
> xen_swiotlb_alloc_coherent and xen_swiotlb_free_coherent, which need a
> few explicit phys_to_dma/dma_to_phys calls.

The commit message explains what the code is doing but doesn't explain 
why this is needed.

> 
> Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>
> ---
>   drivers/xen/swiotlb-xen.c | 20 ++++++++++++--------
>   1 file changed, 12 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/xen/swiotlb-xen.c b/drivers/xen/swiotlb-xen.c
> index c50448fd9b75..d011c4c7aa72 100644
> --- a/drivers/xen/swiotlb-xen.c
> +++ b/drivers/xen/swiotlb-xen.c
> @@ -64,14 +64,16 @@ static inline dma_addr_t xen_phys_to_bus(struct device *dev, phys_addr_t paddr)
>   
>   	dma |= paddr & ~XEN_PAGE_MASK;
>   
> -	return dma;
> +	return phys_to_dma(dev, dma);
>   }
>   
> -static inline phys_addr_t xen_bus_to_phys(struct device *dev, dma_addr_t baddr)
> +static inline phys_addr_t xen_bus_to_phys(struct device *dev,
> +					  dma_addr_t dma_addr)
>   {
> +	phys_addr_t baddr = dma_to_phys(dev, dma_addr);
>   	unsigned long xen_pfn = bfn_to_pfn(XEN_PFN_DOWN(baddr));
> -	dma_addr_t dma = (dma_addr_t)xen_pfn << XEN_PAGE_SHIFT;
> -	phys_addr_t paddr = dma;
> +	phys_addr_t paddr = (xen_pfn << XEN_PAGE_SHIFT) |
> +			    (baddr & ~XEN_PAGE_MASK);
>   
>   	paddr |= baddr & ~XEN_PAGE_MASK;
>   
> @@ -99,7 +101,7 @@ static inline int range_straddles_page_boundary(phys_addr_t p, size_t size)
>   
>   static int is_xen_swiotlb_buffer(struct device *dev, dma_addr_t dma_addr)
>   {
> -	unsigned long bfn = XEN_PFN_DOWN(dma_addr);
> +	unsigned long bfn = XEN_PFN_DOWN(dma_to_phys(dev, dma_addr));
>   	unsigned long xen_pfn = bfn_to_local_pfn(bfn);
>   	phys_addr_t paddr = XEN_PFN_PHYS(xen_pfn);
>   
> @@ -304,11 +306,11 @@ xen_swiotlb_alloc_coherent(struct device *hwdev, size_t size,
>   	if (hwdev && hwdev->coherent_dma_mask)
>   		dma_mask = hwdev->coherent_dma_mask;
>   
> -	/* At this point dma_handle is the physical address, next we are
> +	/* At this point dma_handle is the dma address, next we are
>   	 * going to set it to the machine address.
>   	 * Do not use virt_to_phys(ret) because on ARM it doesn't correspond
>   	 * to *dma_handle. */
> -	phys = *dma_handle;
> +	phys = dma_to_phys(hwdev, *dma_handle);
>   	dev_addr = xen_phys_to_bus(hwdev, phys);
>   	if (((dev_addr + size - 1 <= dma_mask)) &&
>   	    !range_straddles_page_boundary(phys, size))
> @@ -319,6 +321,7 @@ xen_swiotlb_alloc_coherent(struct device *hwdev, size_t size,
>   			xen_free_coherent_pages(hwdev, size, ret, (dma_addr_t)phys, attrs);
>   			return NULL;
>   		}
> +		*dma_handle = phys_to_dma(hwdev, *dma_handle);
>   		SetPageXenRemapped(virt_to_page(ret));
>   	}
>   	memset(ret, 0, size);
> @@ -351,7 +354,8 @@ xen_swiotlb_free_coherent(struct device *hwdev, size_t size, void *vaddr,
>   	    TestClearPageXenRemapped(pg))
>   		xen_destroy_contiguous_region(phys, order);
>   
> -	xen_free_coherent_pages(hwdev, size, vaddr, (dma_addr_t)phys, attrs);
> +	xen_free_coherent_pages(hwdev, size, vaddr, phys_to_dma(hwdev, phys),
> +				attrs);
>   }
>   
>   /*
> 

Cheers,

-- 
Julien Grall

