Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DE8B525978
	for <lists+xen-devel@lfdr.de>; Fri, 13 May 2022 03:40:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.328151.551093 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1npKHM-0004aN-GG; Fri, 13 May 2022 01:39:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 328151.551093; Fri, 13 May 2022 01:39:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1npKHM-0004Ye-D0; Fri, 13 May 2022 01:39:40 +0000
Received: by outflank-mailman (input) for mailman id 328151;
 Fri, 13 May 2022 01:39:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xcQv=VV=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1npKHL-0004YY-GX
 for xen-devel@lists.xenproject.org; Fri, 13 May 2022 01:39:39 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8c2a5e7b-d25d-11ec-a406-831a346695d4;
 Fri, 13 May 2022 03:39:37 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 11DBE62107;
 Fri, 13 May 2022 01:39:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1FE77C385B8;
 Fri, 13 May 2022 01:39:35 +0000 (UTC)
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
X-Inumbo-ID: 8c2a5e7b-d25d-11ec-a406-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1652405975;
	bh=W35uWjUG1O6fXtH+TbvlRcplXMfTEbaTeezWYwjpnhs=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=KwdIFkm2hPKErCfdMH4zzYXGuY6RR5jAi7812KnaR64+duu+Ce0s4TnHr47O36AR6
	 Gyqmg3FhN1VegdSdqWGTjEnJ/4wK7qThd8rn84t9CgNr9XCOC2tpkfqNMdCal27YyX
	 qf2mRxlkgXIIW1MeOE0aYtS1jbkeHoSlgGzMwNgQmlmA9n2Ohp5Bijmosmr6AJZy4Z
	 fGMujrI1cf+U4SjFHP9IIGzypnnrqGCdXnh5Q5gGdYdIWb5LqkwlfcGMObWHJyEost
	 bg7dWgaHij98vhwCua2itu4joEKubsQ7H1gumkfbcmi7OqT22eYgl2M+38h6VsbY9V
	 KMHFAkS5roIJg==
Date: Thu, 12 May 2022 18:39:34 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Christoph Hellwig <hch@lst.de>
cc: iommu@lists.linux-foundation.org, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Boris Ostrovsky <boris.ostrovsky@oracle.com>, Conor.Dooley@microchip.com, 
    xen-devel@lists.xenproject.org
Subject: Re: [PATCH 2/3] swiotlb: use the right nslabs value in
 swiotlb_init_remap
In-Reply-To: <20220511125805.1377025-3-hch@lst.de>
Message-ID: <alpine.DEB.2.22.394.2205121839220.3842@ubuntu-linux-20-04-desktop>
References: <20220511125805.1377025-1-hch@lst.de> <20220511125805.1377025-3-hch@lst.de>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 11 May 2022, Christoph Hellwig wrote:
> default_nslabs should only be used to initialize nslabs, after that we
> need to use the local variable that can shrink when allocations or the
> remap don't succeed.
> 
> Fixes: 6424e31b1c05 ("swiotlb: remove swiotlb_init_with_tbl and swiotlb_init_late_with_tbl")
> Signed-off-by: Christoph Hellwig <hch@lst.de>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
>  kernel/dma/swiotlb.c | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/kernel/dma/swiotlb.c b/kernel/dma/swiotlb.c
> index 3e992a308c8a1..113e1e8aaca37 100644
> --- a/kernel/dma/swiotlb.c
> +++ b/kernel/dma/swiotlb.c
> @@ -234,7 +234,7 @@ void __init swiotlb_init_remap(bool addressing_limit, unsigned int flags,
>  {
>  	struct io_tlb_mem *mem = &io_tlb_default_mem;
>  	unsigned long nslabs = default_nslabs;
> -	size_t alloc_size = PAGE_ALIGN(array_size(sizeof(*mem->slots), nslabs));
> +	size_t alloc_size;
>  	size_t bytes;
>  	void *tlb;
>  
> @@ -249,7 +249,7 @@ void __init swiotlb_init_remap(bool addressing_limit, unsigned int flags,
>  	 * memory encryption.
>  	 */
>  retry:
> -	bytes = PAGE_ALIGN(default_nslabs << IO_TLB_SHIFT);
> +	bytes = PAGE_ALIGN(nslabs << IO_TLB_SHIFT);
>  	if (flags & SWIOTLB_ANY)
>  		tlb = memblock_alloc(bytes, PAGE_SIZE);
>  	else
> @@ -269,12 +269,13 @@ void __init swiotlb_init_remap(bool addressing_limit, unsigned int flags,
>  		goto retry;
>  	}
>  
> +	alloc_size = PAGE_ALIGN(array_size(sizeof(*mem->slots), nslabs));
>  	mem->slots = memblock_alloc(alloc_size, PAGE_SIZE);
>  	if (!mem->slots)
>  		panic("%s: Failed to allocate %zu bytes align=0x%lx\n",
>  		      __func__, alloc_size, PAGE_SIZE);
>  
> -	swiotlb_init_io_tlb_mem(mem, __pa(tlb), default_nslabs, false);
> +	swiotlb_init_io_tlb_mem(mem, __pa(tlb), nslabs, false);
>  	mem->force_bounce = flags & SWIOTLB_FORCE;
>  
>  	if (flags & SWIOTLB_VERBOSE)
> -- 
> 2.30.2
> 

