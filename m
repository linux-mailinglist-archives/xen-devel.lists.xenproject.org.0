Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 983871BB85E
	for <lists+xen-devel@lfdr.de>; Tue, 28 Apr 2020 10:02:43 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jTLCM-00010s-Mz; Tue, 28 Apr 2020 08:02:34 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vdy4=6M=bombadil.srs.infradead.org=batv+04e88780fe354b781c6f+6092+infradead.org+hch@srs-us1.protection.inumbo.net>)
 id 1jTLCK-00010l-6Z
 for xen-devel@lists.xenproject.org; Tue, 28 Apr 2020 08:02:32 +0000
X-Inumbo-ID: 91d4795c-8926-11ea-b07b-bc764e2007e4
Received: from bombadil.infradead.org (unknown [2607:7c80:54:e::133])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 91d4795c-8926-11ea-b07b-bc764e2007e4;
 Tue, 28 Apr 2020 08:02:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=0Gc8wiZaH5vxzoL7Y4RD61mnokWImM3/OUm105M5x4Q=; b=AkRzSgUBS3spTGGb1FU2ZdnFp4
 7BKimlNU77GlBbuUM/8B5MPQQ/E6pQxNnqbGv+7iaZdB1yzXSBR4E6U5GIwvyG6VLpIOzmZt8b+Af
 FhXp4/msJvZ5wc9Q/RiSGYZjj5WugzIgMCgyvRtTHLiMoRI/isejvWR1rP9hHQqpa9qWD+mUpziT9
 uaVqa13Hhc/t59XAU11bOMVnUb4ynS0/3sHmfE672BTSnYmRzfdf+63SFCOFf2DKOM2/lg8NAzimF
 fD0PTuRTAIjTIr+c2X26hXxC4p/Xa5P+lwbVfvO9LSTlCL0fe8zEy86Odd6yWyhlALdnxCk28aydq
 KqW8hdGw==;
Received: from hch by bombadil.infradead.org with local (Exim 4.92.3 #3 (Red
 Hat Linux)) id 1jTLBy-0000XO-Ed; Tue, 28 Apr 2020 08:02:10 +0000
Date: Tue, 28 Apr 2020 01:02:10 -0700
From: Christoph Hellwig <hch@infradead.org>
To: peng.fan@nxp.com
Subject: Re: [PATCH] xen/swiotlb: correct the check for
 xen_destroy_contiguous_region
Message-ID: <20200428080210.GA25643@infradead.org>
References: <1588059225-11245-1-git-send-email-peng.fan@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1588059225-11245-1-git-send-email-peng.fan@nxp.com>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
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
Cc: jgross@suse.com, sstabellini@kernel.org, konrad.wilk@oracle.com,
 linux-kernel@vger.kernel.org, iommu@lists.linux-foundation.org,
 linux-imx@nxp.com, xen-devel@lists.xenproject.org, boris.ostrovsky@oracle.com
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Tue, Apr 28, 2020 at 03:33:45PM +0800, peng.fan@nxp.com wrote:
> 
> In xen_swiotlb_alloc_coherent, if !(dev_addr + size - 1 <= dma_mask) or
> range_straddles_page_boundary(phys, size) are true, it will
> create contiguous region. So when free, we need to free contiguous
> region use upper check condition.
> 
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
>  drivers/xen/swiotlb-xen.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/xen/swiotlb-xen.c b/drivers/xen/swiotlb-xen.c
> index b6d27762c6f8..ab96e468584f 100644
> --- a/drivers/xen/swiotlb-xen.c
> +++ b/drivers/xen/swiotlb-xen.c
> @@ -346,8 +346,8 @@ xen_swiotlb_free_coherent(struct device *hwdev, size_t size, void *vaddr,
>  	/* Convert the size to actually allocated. */
>  	size = 1UL << (order + XEN_PAGE_SHIFT);
>  
> -	if (!WARN_ON((dev_addr + size - 1 > dma_mask) ||
> -		     range_straddles_page_boundary(phys, size)) &&
> +	if (((dev_addr + size - 1 > dma_mask) ||
> +	    range_straddles_page_boundary(phys, size)) &&
>  	    TestClearPageXenRemapped(virt_to_page(vaddr)))

No need for the inner braces.

But more importantly please factor our a helper that can be used by
alloc and free to make sure that they always stay in sync.  Something
like:

static inline bool xen_swiotlb_need_contiguous_region(struct device *dev,
		phys_addr_t phys, size_t size)
{
	
	return xen_phys_to_bus(phys) + size - 1 > dev->coherent_dma_mask ||
		range_straddles_page_boundary(phys, size))
}


