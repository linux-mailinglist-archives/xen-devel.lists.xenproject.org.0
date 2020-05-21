Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EC451DC828
	for <lists+xen-devel@lfdr.de>; Thu, 21 May 2020 10:02:09 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jbg92-0004La-D3; Thu, 21 May 2020 08:01:36 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=VGGW=7D=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1jbg90-0004LV-Mh
 for xen-devel@lists.xenproject.org; Thu, 21 May 2020 08:01:34 +0000
X-Inumbo-ID: 49c1ef76-9b39-11ea-ae69-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 49c1ef76-9b39-11ea-ae69-bc764e2007e4;
 Thu, 21 May 2020 08:01:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=LzQcau/CTPhcsq7cGzAcVt098Z2d/I8LKnftpNJpgSo=; b=M5yzdliQtL6ecGvEyiMqU8gcmm
 VZCqgzHHR+lWgFbOO+SHL+yg3mG+eAAvKtIgwwZ4Sp5OsroQvTtvRs3AoSF4Rh9rom3+W0BAxUp4z
 uod9wfTjCWD0T8VM8sHHqldWI8WUDt/bDkzv1Iqct/fHvpGlM6u9pAfLNEoF7eTsDxYw=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1jbg8z-0004CT-E1; Thu, 21 May 2020 08:01:33 +0000
Received: from 54-240-197-225.amazon.com ([54.240.197.225]
 helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.89)
 (envelope-from <julien@xen.org>)
 id 1jbg8z-0006PQ-6i; Thu, 21 May 2020 08:01:33 +0000
Subject: Re: [PATCH 01/10] swiotlb-xen: use vmalloc_to_page on vmalloc virt
 addresses
To: Stefano Stabellini <sstabellini@kernel.org>, jgross@suse.com,
 boris.ostrovsky@oracle.com, konrad.wilk@oracle.com
References: <alpine.DEB.2.21.2005201628330.27502@sstabellini-ThinkPad-T480s>
 <20200520234520.22563-1-sstabellini@kernel.org>
From: Julien Grall <julien@xen.org>
Message-ID: <23e5b6d8-c5d9-b43f-41cd-9d02d8ec0a7f@xen.org>
Date: Thu, 21 May 2020 09:01:31 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200520234520.22563-1-sstabellini@kernel.org>
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
> From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
> 
> Don't just assume that virt_to_page works on all virtual addresses.
> Instead add a is_vmalloc_addr check and use vmalloc_to_page on vmalloc
> virt addresses.

Can you provide an example where swiotlb is used with vmalloc()?

> Signed-off-by: Boris Ostrovsky <boris.ostrovsky@oracle.com>
> Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>
> ---
>   drivers/xen/swiotlb-xen.c | 5 ++++-
>   1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/xen/swiotlb-xen.c b/drivers/xen/swiotlb-xen.c
> index b6d27762c6f8..a42129cba36e 100644
> --- a/drivers/xen/swiotlb-xen.c
> +++ b/drivers/xen/swiotlb-xen.c
> @@ -335,6 +335,7 @@ xen_swiotlb_free_coherent(struct device *hwdev, size_t size, void *vaddr,
>   	int order = get_order(size);
>   	phys_addr_t phys;
>   	u64 dma_mask = DMA_BIT_MASK(32);
> +	struct page *pg;
>   
>   	if (hwdev && hwdev->coherent_dma_mask)
>   		dma_mask = hwdev->coherent_dma_mask;
> @@ -346,9 +347,11 @@ xen_swiotlb_free_coherent(struct device *hwdev, size_t size, void *vaddr,
>   	/* Convert the size to actually allocated. */
>   	size = 1UL << (order + XEN_PAGE_SHIFT);
>   
> +	pg = is_vmalloc_addr(vaddr) ? vmalloc_to_page(vaddr) :
> +				      virt_to_page(vaddr);

Common DMA code seems to protect this check with CONFIG_DMA_REMAP. Is it 
something we want to do it here as well? Or is there any other condition 
where vmalloc can happen?

>   	if (!WARN_ON((dev_addr + size - 1 > dma_mask) ||
>   		     range_straddles_page_boundary(phys, size)) &&
> -	    TestClearPageXenRemapped(virt_to_page(vaddr)))
> +	    TestClearPageXenRemapped(pg))
>   		xen_destroy_contiguous_region(phys, order);
>   
>   	xen_free_coherent_pages(hwdev, size, vaddr, (dma_addr_t)phys, attrs);
> 

Cheers,

-- 
Julien Grall

