Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 95564AA7897
	for <lists+xen-devel@lfdr.de>; Fri,  2 May 2025 19:20:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.974945.1362673 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uAu3o-00044O-Pj; Fri, 02 May 2025 17:20:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 974945.1362673; Fri, 02 May 2025 17:20:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uAu3o-00041y-NB; Fri, 02 May 2025 17:20:28 +0000
Received: by outflank-mailman (input) for mailman id 974945;
 Fri, 02 May 2025 17:20:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mfxJ=XS=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1uAu3m-00041c-KR
 for xen-devel@lists.xenproject.org; Fri, 02 May 2025 17:20:26 +0000
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bbb9edb0-2779-11f0-9eb4-5ba50f476ded;
 Fri, 02 May 2025 19:20:25 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 31D02434E4;
 Fri,  2 May 2025 17:20:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 16A99C4CEE4;
 Fri,  2 May 2025 17:20:21 +0000 (UTC)
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
X-Inumbo-ID: bbb9edb0-2779-11f0-9eb4-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746206423;
	bh=FzvJMEVywUV1H+jpiVirWxvGVxglVU9u9H1JW19xvuE=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=B3kmrDRxZRHtH/oLMWmCnAtpbx4Bc+gIdkj+KwlnvFzdXhFHvd2eY5tA47FG/q+V+
	 q6kWEkJuMFXpTB4MIkzNqQR2m8mHhOJWJSVQgHYXlfkGcD2qzXLm2SzhUHW1u7q6KC
	 bBoxGiuslOqmWxCKnbCN1ib37DliZQhM/FFx7RE4gMmTYsEIvQRNjaN/eiR8UlZq+Y
	 hyDu/Q77OGhDLBscBmyU+IrOW8kRIreKkrVGzcK3x/hr/MyoWL9Sf10+zEqbgXpciD
	 /GrF0ZpdsjWpw/EDHLVd2GWBgG/fJxVO+THrRGvDFSZehODCgfCQ+NLVqAxc/S43de
	 9lPQ4ZC2wGtnA==
Date: Fri, 2 May 2025 10:20:20 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: John Ernberg <john.ernberg@actia.se>
cc: Juergen Gross <jgross@suse.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, 
    Catalin Marinas <catalin.marinas@arm.com>, 
    Andrew Morton <akpm@linux-foundation.org>, 
    "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
    "iommu@lists.linux.dev" <iommu@lists.linux.dev>, 
    "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
    "imx@lists.linux.dev" <imx@lists.linux.dev>, 
    Christoph Hellwig <hch@infradead.org>
Subject: Re: [PATCH 2/2] xen: swiotlb: Implement map_resource callback
In-Reply-To: <20250502114043.1968976-3-john.ernberg@actia.se>
Message-ID: <alpine.DEB.2.22.394.2505021007460.3879245@ubuntu-linux-20-04-desktop>
References: <20250502114043.1968976-1-john.ernberg@actia.se> <20250502114043.1968976-3-john.ernberg@actia.se>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

+Christoph

On Fri, 2 May 2025, John Ernberg wrote:
> Needed by the eDMA v3 DMA engine found in iommu-less SoCs such as iMX8QXP
> to be able to perform DMA operations as a Xen Hardware Domain, which needs
> to be able to do DMA in MMIO space.
> 
> The callback implementation is basically the same as the one for direct
> mapping of resources, except this also takes into account Xen page
> mappings.
> 
> There is nothing to do for unmap, just like with direct, so the unmap
> callback is not needed.
> 
> Signed-off-by: John Ernberg <john.ernberg@actia.se>
> 
> ---
> 
> I originally exported dma_direct_map_resource() and used that which
> appeared to work, but it felt like not checking Xen page mappings wasn't
> fully correct and I went with this. But if dma_direct_map_resource() is
> the correct approach here then I can submit that isntead.
> ---
>  drivers/xen/swiotlb-xen.c | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
> 
> diff --git a/drivers/xen/swiotlb-xen.c b/drivers/xen/swiotlb-xen.c
> index ef56a2500ed6..0f02fdd9128d 100644
> --- a/drivers/xen/swiotlb-xen.c
> +++ b/drivers/xen/swiotlb-xen.c
> @@ -285,6 +285,20 @@ static void xen_swiotlb_unmap_page(struct device *hwdev, dma_addr_t dev_addr,
>  					   attrs, pool);
>  }
>  
> +static dma_addr_t xen_swiotlb_map_resource(struct device *dev, phys_addr_t phys,
> +					   size_t size, enum dma_data_direction dir,
> +					   unsigned long attrs)
> +{
> +	dma_addr_t dev_addr = xen_phys_to_dma(dev, phys);

Yes, we need the xen_phys_to_dma call here. This is one of the reasons I
don't think we can use dma_direct_map_resource() to implement
map_resource


> +	BUG_ON(dir == DMA_NONE);
> +
> +	if (!dma_capable(dev, dev_addr, size, false))
> +		return DMA_MAPPING_ERROR;

But here you also need to check that phys+size doesn't cross a page
boundary. You need to call range_straddles_page_boundary, like we do at
the beginning of xen_swiotlb_map_page.

If it is possible to cross a page boundary, then we need to basically to
do the same thing here as we do in xen_swiotlb_map_page where we check
for:

	if (dma_capable(dev, dev_addr, size, true) &&
	    !range_straddles_page_boundary(phys, size) &&
		!xen_arch_need_swiotlb(dev, phys, dev_addr) &&
		!is_swiotlb_force_bounce(dev))
		goto done;

if all is well, we go with the native path, otherwise we bounce on
swiotlb-xen.



> +	return dev_addr;
> +}
> +
>  static void
>  xen_swiotlb_sync_single_for_cpu(struct device *dev, dma_addr_t dma_addr,
>  		size_t size, enum dma_data_direction dir)
> @@ -426,4 +440,5 @@ const struct dma_map_ops xen_swiotlb_dma_ops = {
>  	.alloc_pages_op = dma_common_alloc_pages,
>  	.free_pages = dma_common_free_pages,
>  	.max_mapping_size = swiotlb_max_mapping_size,
> +	.map_resource = xen_swiotlb_map_resource,
>  };
> -- 
> 2.49.0
> 

