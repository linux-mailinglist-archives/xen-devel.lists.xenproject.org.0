Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D7E82A31B22
	for <lists+xen-devel@lfdr.de>; Wed, 12 Feb 2025 02:24:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.886046.1295775 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ti1Tc-0007rP-SU; Wed, 12 Feb 2025 01:23:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 886046.1295775; Wed, 12 Feb 2025 01:23:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ti1Tc-0007pP-Ob; Wed, 12 Feb 2025 01:23:44 +0000
Received: by outflank-mailman (input) for mailman id 886046;
 Wed, 12 Feb 2025 01:23:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xJ3x=VD=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1ti1Ta-0007pJ-E2
 for xen-devel@lists.xenproject.org; Wed, 12 Feb 2025 01:23:42 +0000
Received: from nyc.source.kernel.org (nyc.source.kernel.org
 [2604:1380:45d1:ec00::3])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fd28b8fc-e8df-11ef-a075-877d107080fb;
 Wed, 12 Feb 2025 02:23:40 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 5FCFDA40C7A;
 Wed, 12 Feb 2025 01:21:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A1FD4C4CEDD;
 Wed, 12 Feb 2025 01:23:37 +0000 (UTC)
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
X-Inumbo-ID: fd28b8fc-e8df-11ef-a075-877d107080fb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739323418;
	bh=NxZg3s6KMEv9gnhHvHFUocnGM1b/XIp3StXzcFhH2Xo=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=oVWLqG08PSOIXVkoGpvBSiL9K4kGQ1GwdmXPtyeAygaJn0meND1EiB2qktwJ22JVf
	 go66AHTs0Cf3DuR6GsEFGt6bRYNSBNihzJP+6imQsIeJ8y+jU2ux129YLsrqJeegRJ
	 RVmCgUnBlcMePi+eTjrQoAcpuPanxmZHoJFoTk4RjKV9Lf9v7lqoH7puNadklMKJr5
	 eE+1NSuNulTWL95rJw8t2pmoJsp5RU/ZkWGjmj1ouBSSb1TujhysaTM2fFu38UHGgU
	 b/slIh2skJHM9AGoogbS0SBO79NplryENo8z6B8yjdmhnjczivKwoL2/TN9DkcYDSi
	 8LD8TglJLq9fg==
Date: Tue, 11 Feb 2025 17:23:36 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Juergen Gross <jgross@suse.com>
cc: linux-kernel@vger.kernel.org, iommu@lists.linux.dev, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, 
    xen-devel@lists.xenproject.org, 
    Jan Vejvalka <jan.vejvalka@lfmotol.cuni.cz>
Subject: Re: [PATCH 1/2] xen/swiotlb: relax alignment requirements
In-Reply-To: <20250211120432.29493-2-jgross@suse.com>
Message-ID: <alpine.DEB.2.22.394.2502111723280.619090@ubuntu-linux-20-04-desktop>
References: <20250211120432.29493-1-jgross@suse.com> <20250211120432.29493-2-jgross@suse.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 11 Feb 2025, Juergen Gross wrote:
> When mapping a buffer for DMA via .map_page or .map_sg DMA operations,
> there is no need to check the machine frames to be aligned according
> to the mapped areas size. All what is needed in these cases is that the
> buffer is contiguous at machine level.
> 
> So carve out the alignment check from range_straddles_page_boundary()
> and move it to a helper called by xen_swiotlb_alloc_coherent() and
> xen_swiotlb_free_coherent() directly.
> 
> Fixes: 9f40ec84a797 ("xen/swiotlb: add alignment check for dma buffers")
> Reported-by: Jan Vejvalka <jan.vejvalka@lfmotol.cuni.cz>
> Tested-by: Jan Vejvalka <jan.vejvalka@lfmotol.cuni.cz>
> Signed-off-by: Juergen Gross <jgross@suse.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
>  drivers/xen/swiotlb-xen.c | 20 ++++++++++++--------
>  1 file changed, 12 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/xen/swiotlb-xen.c b/drivers/xen/swiotlb-xen.c
> index a337edcf8faf..26c62e0d34e9 100644
> --- a/drivers/xen/swiotlb-xen.c
> +++ b/drivers/xen/swiotlb-xen.c
> @@ -74,19 +74,21 @@ static inline phys_addr_t xen_dma_to_phys(struct device *dev,
>  	return xen_bus_to_phys(dev, dma_to_phys(dev, dma_addr));
>  }
>  
> +static inline bool range_requires_alignment(phys_addr_t p, size_t size)
> +{
> +	phys_addr_t algn = 1ULL << (get_order(size) + PAGE_SHIFT);
> +	phys_addr_t bus_addr = pfn_to_bfn(XEN_PFN_DOWN(p)) << XEN_PAGE_SHIFT;
> +
> +	return IS_ALIGNED(p, algn) && !IS_ALIGNED(bus_addr, algn);
> +}
> +
>  static inline int range_straddles_page_boundary(phys_addr_t p, size_t size)
>  {
>  	unsigned long next_bfn, xen_pfn = XEN_PFN_DOWN(p);
>  	unsigned int i, nr_pages = XEN_PFN_UP(xen_offset_in_page(p) + size);
> -	phys_addr_t algn = 1ULL << (get_order(size) + PAGE_SHIFT);
>  
>  	next_bfn = pfn_to_bfn(xen_pfn);
>  
> -	/* If buffer is physically aligned, ensure DMA alignment. */
> -	if (IS_ALIGNED(p, algn) &&
> -	    !IS_ALIGNED((phys_addr_t)next_bfn << XEN_PAGE_SHIFT, algn))
> -		return 1;
> -
>  	for (i = 1; i < nr_pages; i++)
>  		if (pfn_to_bfn(++xen_pfn) != ++next_bfn)
>  			return 1;
> @@ -156,7 +158,8 @@ xen_swiotlb_alloc_coherent(struct device *dev, size_t size,
>  
>  	*dma_handle = xen_phys_to_dma(dev, phys);
>  	if (*dma_handle + size - 1 > dma_mask ||
> -	    range_straddles_page_boundary(phys, size)) {
> +	    range_straddles_page_boundary(phys, size) ||
> +	    range_requires_alignment(phys, size)) {
>  		if (xen_create_contiguous_region(phys, order, fls64(dma_mask),
>  				dma_handle) != 0)
>  			goto out_free_pages;
> @@ -182,7 +185,8 @@ xen_swiotlb_free_coherent(struct device *dev, size_t size, void *vaddr,
>  	size = ALIGN(size, XEN_PAGE_SIZE);
>  
>  	if (WARN_ON_ONCE(dma_handle + size - 1 > dev->coherent_dma_mask) ||
> -	    WARN_ON_ONCE(range_straddles_page_boundary(phys, size)))
> +	    WARN_ON_ONCE(range_straddles_page_boundary(phys, size) ||
> +			 range_requires_alignment(phys, size)))
>  	    	return;
>  
>  	if (TestClearPageXenRemapped(virt_to_page(vaddr)))
> -- 
> 2.43.0
> 

