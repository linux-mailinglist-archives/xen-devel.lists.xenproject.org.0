Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FD6C52597D
	for <lists+xen-devel@lfdr.de>; Fri, 13 May 2022 03:44:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.328158.551104 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1npKM8-00060O-3A; Fri, 13 May 2022 01:44:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 328158.551104; Fri, 13 May 2022 01:44:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1npKM8-0005xW-0G; Fri, 13 May 2022 01:44:36 +0000
Received: by outflank-mailman (input) for mailman id 328158;
 Fri, 13 May 2022 01:44:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xcQv=VV=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1npKM6-0005xQ-VU
 for xen-devel@lists.xenproject.org; Fri, 13 May 2022 01:44:34 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3ca5f138-d25e-11ec-a406-831a346695d4;
 Fri, 13 May 2022 03:44:33 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 7E50B620EA;
 Fri, 13 May 2022 01:44:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 910EBC385B8;
 Fri, 13 May 2022 01:44:31 +0000 (UTC)
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
X-Inumbo-ID: 3ca5f138-d25e-11ec-a406-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1652406271;
	bh=ZS0DQzDVQRw+WyZX8h4DFNWCJCmiIgGiFZJt0lgwi0Q=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=HfYksHVbntV+wgGN0VNX9EmrK8S41HUKC7cNTFH1O/07u0e3kTAlwTatr1+Gyv6M8
	 /GmqcFTbKgB07jBYxiSlJcnHbgLjdNgTTk1GZVrIxxt3SNHehw+QVRKVTdfRZP8J2F
	 HEOm8R5uwSQI1EqLv1bT+NaX++rQJEIN3UrC8b3wpwMe29SUluH6LjfKTJzVMsQqUm
	 awkKp/NwkHraiUJ5vPWk898WNy2Jiujt3gOJXnKBJSth9leZJdqiBgBX3nwQRmFerO
	 nIGWazHqK0GsyQCdVwbhSGJgfRdK4ATT/erXQGSQDcKrJ1ZBKMAOCZ0YKGNe2Hv1z8
	 jsvo4HlZWqVDA==
Date: Thu, 12 May 2022 18:44:30 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Christoph Hellwig <hch@lst.de>
cc: iommu@lists.linux-foundation.org, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Boris Ostrovsky <boris.ostrovsky@oracle.com>, Conor.Dooley@microchip.com, 
    xen-devel@lists.xenproject.org
Subject: Re: [PATCH 3/3] swiotlb: use the right nslabs-derived sizes in
 swiotlb_init_late
In-Reply-To: <20220511125805.1377025-4-hch@lst.de>
Message-ID: <alpine.DEB.2.22.394.2205121844221.3842@ubuntu-linux-20-04-desktop>
References: <20220511125805.1377025-1-hch@lst.de> <20220511125805.1377025-4-hch@lst.de>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 11 May 2022, Christoph Hellwig wrote:
> nslabs can shrink when allocations or the remap don't succeed, so make
> sure to use it for all sizing.  For that remove the bytes value that
> can get stale and replace it with local calculations and a boolean to
> indicate if the originally requested size could not be allocated.
> 
> Fixes: 6424e31b1c05 ("swiotlb: remove swiotlb_init_with_tbl and swiotlb_init_late_with_tbl")
> Signed-off-by: Christoph Hellwig <hch@lst.de>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
>  kernel/dma/swiotlb.c | 19 +++++++++++--------
>  1 file changed, 11 insertions(+), 8 deletions(-)
> 
> diff --git a/kernel/dma/swiotlb.c b/kernel/dma/swiotlb.c
> index 113e1e8aaca37..d6e62a6a42ceb 100644
> --- a/kernel/dma/swiotlb.c
> +++ b/kernel/dma/swiotlb.c
> @@ -297,9 +297,9 @@ int swiotlb_init_late(size_t size, gfp_t gfp_mask,
>  {
>  	struct io_tlb_mem *mem = &io_tlb_default_mem;
>  	unsigned long nslabs = ALIGN(size >> IO_TLB_SHIFT, IO_TLB_SEGSIZE);
> -	unsigned long bytes;
>  	unsigned char *vstart = NULL;
>  	unsigned int order;
> +	bool retried = false;
>  	int rc = 0;
>  
>  	if (swiotlb_force_disable)
> @@ -308,7 +308,6 @@ int swiotlb_init_late(size_t size, gfp_t gfp_mask,
>  retry:
>  	order = get_order(nslabs << IO_TLB_SHIFT);
>  	nslabs = SLABS_PER_PAGE << order;
> -	bytes = nslabs << IO_TLB_SHIFT;
>  
>  	while ((SLABS_PER_PAGE << order) > IO_TLB_MIN_SLABS) {
>  		vstart = (void *)__get_free_pages(gfp_mask | __GFP_NOWARN,
> @@ -316,16 +315,13 @@ int swiotlb_init_late(size_t size, gfp_t gfp_mask,
>  		if (vstart)
>  			break;
>  		order--;
> +		nslabs = SLABS_PER_PAGE << order;
> +		retried = true;
>  	}
>  
>  	if (!vstart)
>  		return -ENOMEM;
>  
> -	if (order != get_order(bytes)) {
> -		pr_warn("only able to allocate %ld MB\n",
> -			(PAGE_SIZE << order) >> 20);
> -		nslabs = SLABS_PER_PAGE << order;
> -	}
>  	if (remap)
>  		rc = remap(vstart, nslabs);
>  	if (rc) {
> @@ -334,9 +330,15 @@ int swiotlb_init_late(size_t size, gfp_t gfp_mask,
>  		nslabs = ALIGN(nslabs >> 1, IO_TLB_SEGSIZE);
>  		if (nslabs < IO_TLB_MIN_SLABS)
>  			return rc;
> +		retried = true;
>  		goto retry;
>  	}
>  
> +	if (retried) {
> +		pr_warn("only able to allocate %ld MB\n",
> +			(PAGE_SIZE << order) >> 20);
> +	}
> +
>  	mem->slots = (void *)__get_free_pages(GFP_KERNEL | __GFP_ZERO,
>  		get_order(array_size(sizeof(*mem->slots), nslabs)));
>  	if (!mem->slots) {
> @@ -344,7 +346,8 @@ int swiotlb_init_late(size_t size, gfp_t gfp_mask,
>  		return -ENOMEM;
>  	}
>  
> -	set_memory_decrypted((unsigned long)vstart, bytes >> PAGE_SHIFT);
> +	set_memory_decrypted((unsigned long)vstart,
> +			     (nslabs << IO_TLB_SHIFT) >> PAGE_SHIFT);
>  	swiotlb_init_io_tlb_mem(mem, virt_to_phys(vstart), nslabs, true);
>  
>  	swiotlb_print_info();
> -- 
> 2.30.2
> 

