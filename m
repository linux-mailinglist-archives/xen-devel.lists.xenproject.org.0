Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3370F1DC876
	for <lists+xen-devel@lfdr.de>; Thu, 21 May 2020 10:26:23 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jbgWh-0006Xn-Iq; Thu, 21 May 2020 08:26:03 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=VGGW=7D=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1jbgWg-0006Xi-0b
 for xen-devel@lists.xenproject.org; Thu, 21 May 2020 08:26:02 +0000
X-Inumbo-ID: b4083ba8-9b3c-11ea-aae2-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b4083ba8-9b3c-11ea-aae2-12813bfff9fa;
 Thu, 21 May 2020 08:26:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=hXHVUCa/FWiIinv37wJMJKlq+4q06rxlpbzT5I9rDrE=; b=dgiAhbOin/mrdQK1tmYjd7ud82
 lc7lhmM+8uyQKk7hTF/rU7sIE1Xhhve5VCs8P2pGzLw9ZorI1DRN8EFZGtxH/8jbwk5j43SfvZeh7
 bSGiG1z6ZsxO3vHAhqC0tkGl5CHnhfA94ecvzTrAjWTliiIhdjonP+Rl4AyCDxER7Bvo=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1jbgWd-0004iC-Jl; Thu, 21 May 2020 08:25:59 +0000
Received: from 54-240-197-225.amazon.com ([54.240.197.225]
 helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.89)
 (envelope-from <julien@xen.org>)
 id 1jbgWd-0007d5-Bc; Thu, 21 May 2020 08:25:59 +0000
Subject: Re: [PATCH 10/10] xen/arm: call dma_to_phys on the dma_addr_t
 parameter of dma_cache_maint
To: Stefano Stabellini <sstabellini@kernel.org>, jgross@suse.com,
 boris.ostrovsky@oracle.com, konrad.wilk@oracle.com
References: <alpine.DEB.2.21.2005201628330.27502@sstabellini-ThinkPad-T480s>
 <20200520234520.22563-10-sstabellini@kernel.org>
From: Julien Grall <julien@xen.org>
Message-ID: <c8f54c6b-d59e-2e67-1647-32c730b0a124@xen.org>
Date: Thu, 21 May 2020 09:25:57 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200520234520.22563-10-sstabellini@kernel.org>
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



On 21/05/2020 00:45, Stefano Stabellini wrote:
> From: Stefano Stabellini <stefano.stabellini@xilinx.com>
> 
> Add a struct device* parameter to dma_cache_maint.
> 
> Translate the dma_addr_t parameter of dma_cache_maint by calling
> dma_to_phys. Do it for the first page and all the following pages, in
> case of multipage handling.

The term 'page' is confusing here. Are we referring to Xen page or Linux 
page?

Also, same as patch #8 and #9 regarding the commit message.

> 
> Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>
> ---
>   arch/arm/xen/mm.c | 15 +++++++++------
>   1 file changed, 9 insertions(+), 6 deletions(-)
> 
> diff --git a/arch/arm/xen/mm.c b/arch/arm/xen/mm.c
> index 7639251bcc79..6ddf3b3c1ab5 100644
> --- a/arch/arm/xen/mm.c
> +++ b/arch/arm/xen/mm.c
> @@ -43,15 +43,18 @@ unsigned long xen_get_swiotlb_free_pages(unsigned int order)
>   static bool hypercall_cflush = false;
>   
>   /* buffers in highmem or foreign pages cannot cross page boundaries */
> -static void dma_cache_maint(dma_addr_t handle, size_t size, u32 op)
> +static void dma_cache_maint(struct device *dev, dma_addr_t handle,
> +			    size_t size, u32 op)
>   {
>   	struct gnttab_cache_flush cflush;
>   
> -	cflush.a.dev_bus_addr = handle & XEN_PAGE_MASK;
>   	cflush.offset = xen_offset_in_page(handle);
>   	cflush.op = op;
> +	handle &= XEN_PAGE_MASK;
>   
>   	do {
> +		cflush.a.dev_bus_addr = dma_to_phys(dev, handle);
> +
>   		if (size + cflush.offset > XEN_PAGE_SIZE)
>   			cflush.length = XEN_PAGE_SIZE - cflush.offset;
>   		else
> @@ -60,7 +63,7 @@ static void dma_cache_maint(dma_addr_t handle, size_t size, u32 op)
>   		HYPERVISOR_grant_table_op(GNTTABOP_cache_flush, &cflush, 1);
>   
>   		cflush.offset = 0;
> -		cflush.a.dev_bus_addr += cflush.length;
> +		handle += cflush.length;
>   		size -= cflush.length;
>   	} while (size);
>   }
> @@ -79,7 +82,7 @@ void xen_dma_sync_for_cpu(struct device *dev, dma_addr_t handle,
>   	if (pfn_valid(PFN_DOWN(dma_to_phys(dev, handle))))
>   		arch_sync_dma_for_cpu(paddr, size, dir);
>   	else if (dir != DMA_TO_DEVICE)
> -		dma_cache_maint(handle, size, GNTTAB_CACHE_INVAL);
> +		dma_cache_maint(dev, handle, size, GNTTAB_CACHE_INVAL);
>   }
>   
>   void xen_dma_sync_for_device(struct device *dev, dma_addr_t handle,
> @@ -89,9 +92,9 @@ void xen_dma_sync_for_device(struct device *dev, dma_addr_t handle,
>   	if (pfn_valid(PFN_DOWN(dma_to_phys(dev, handle))))
>   		arch_sync_dma_for_device(paddr, size, dir);
>   	else if (dir == DMA_FROM_DEVICE)
> -		dma_cache_maint(handle, size, GNTTAB_CACHE_INVAL);
> +		dma_cache_maint(dev, handle, size, GNTTAB_CACHE_INVAL);
>   	else
> -		dma_cache_maint(handle, size, GNTTAB_CACHE_CLEAN);
> +		dma_cache_maint(dev, handle, size, GNTTAB_CACHE_CLEAN);
>   }
>   
>   bool xen_arch_need_swiotlb(struct device *dev,
> 

Cheers,

-- 
Julien Grall

