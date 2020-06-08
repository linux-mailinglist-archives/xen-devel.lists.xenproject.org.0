Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 310011F1334
	for <lists+xen-devel@lfdr.de>; Mon,  8 Jun 2020 09:09:22 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jiBtu-0008Pf-Tp; Mon, 08 Jun 2020 07:08:54 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Ohtu=7V=bombadil.srs.infradead.org=batv+c8e86b2099343dd9fc1e+6133+infradead.org+hch@srs-us1.protection.inumbo.net>)
 id 1jiBtt-0008PZ-Rn
 for xen-devel@lists.xenproject.org; Mon, 08 Jun 2020 07:08:53 +0000
X-Inumbo-ID: e8e10648-a956-11ea-9b55-bc764e2007e4
Received: from bombadil.infradead.org (unknown [2607:7c80:54:e::133])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e8e10648-a956-11ea-9b55-bc764e2007e4;
 Mon, 08 Jun 2020 07:08:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=GNcfAufzhmcZvITdjn5d4FK3irCQ3OWSgr/t5h/uSsM=; b=J02CvmxjrAcCbEc9Whcw7Qcvop
 VGY6Kx1ZJ43S5swYCuSo6bi3FcOwvKtkrC6CKxzaYQh41SWGb3hv0VaveFZyta/wB/6YAU7BrXBq5
 B2egWBkq1tEH2dD7ZEULwRZ1nEDgwLv4tYTcyXuT859vDNGAXGCG3yYzoSGFFgu+bqlCB76t5tGnz
 BHbVcDrQUYrQ0n7rk2/3eIOzABLOenvBfBj7aKcNyzpfnmKddPQx2KKNEKfeP2zPYJsTuwQNHqAUM
 PlO8owPfU5BhcG6lNO519+O06CuPdLOAv8AntxWaunTGGsIaewGh3wx7SeMCSuUQjci9l8r5qiOyO
 Vo8h0lvw==;
Received: from hch by bombadil.infradead.org with local (Exim 4.92.3 #3 (Red
 Hat Linux)) id 1jiBtq-0003QO-AY; Mon, 08 Jun 2020 07:08:50 +0000
Date: Mon, 8 Jun 2020 00:08:50 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v2 08/11] swiotlb-xen: introduce phys_to_dma/dma_to_phys
 translations
Message-ID: <20200608070850.GD15742@infradead.org>
References: <alpine.DEB.2.21.2006031506590.6774@sstabellini-ThinkPad-T480s>
 <20200603222247.11681-8-sstabellini@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200603222247.11681-8-sstabellini@kernel.org>
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
Cc: jgross@suse.com, tamas@tklengyel.com, konrad.wilk@oracle.com,
 roman@zededa.com, linux-kernel@vger.kernel.org, xen-devel@lists.xenproject.org,
 boris.ostrovsky@oracle.com, Stefano Stabellini <stefano.stabellini@xilinx.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Wed, Jun 03, 2020 at 03:22:44PM -0700, Stefano Stabellini wrote:
> From: Stefano Stabellini <stefano.stabellini@xilinx.com>
> 
> With some devices physical addresses are different than dma addresses.
> To be able to deal with these cases, we need to call phys_to_dma on
> physical addresses (including machine addresses in Xen terminology)
> before returning them from xen_swiotlb_alloc_coherent and
> xen_swiotlb_map_page.
> 
> We also need to convert dma addresses back to physical addresses using
> dma_to_phys in xen_swiotlb_free_coherent and xen_swiotlb_unmap_page if
> we want to do any operations on them.
> 
> Call dma_to_phys in is_xen_swiotlb_buffer.
> Call phys_to_dma in xen_phys_to_bus.
> Call dma_to_phys in xen_bus_to_phys.
> 
> Everything is taken care of by these changes except for
> xen_swiotlb_alloc_coherent and xen_swiotlb_free_coherent, which need a
> few explicit phys_to_dma/dma_to_phys calls.
> 
> Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>
> Tested-by: Corey Minyard <cminyard@mvista.com>
> Tested-by: Roman Shaposhnik <roman@zededa.com>
> ---
> Changes in v2:
> - improve commit message
> ---
>  drivers/xen/swiotlb-xen.c | 22 ++++++++++++----------
>  1 file changed, 12 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/xen/swiotlb-xen.c b/drivers/xen/swiotlb-xen.c
> index 0a6cb67f0fc4..60ef07440905 100644
> --- a/drivers/xen/swiotlb-xen.c
> +++ b/drivers/xen/swiotlb-xen.c
> @@ -64,16 +64,16 @@ static inline dma_addr_t xen_phys_to_bus(struct device *dev, phys_addr_t paddr)
>  
>  	dma |= paddr & ~XEN_PAGE_MASK;
>  
> -	return dma;
> +	return phys_to_dma(dev, dma);

So looking at this function:

The dma name for something passed to phys_to_dma is really
weird.  The fact that the comments says don't use XEN_PFN_PHYS
beause of the type mismatch while nothing but swiotlb-xen is the only
user of XEN_PFN_PHYS is also weird.  I think XEN_PFN_PHYS needs to move
to swiotlb-xen first, then use a hardcoded u64 for the size, and the
split the function into a phys_to_xen_phys (or so) function where
the result gets passed to phys_to_dma.

Similar for the reverse direction.

