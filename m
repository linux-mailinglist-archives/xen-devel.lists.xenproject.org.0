Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 920D529CB95
	for <lists+xen-devel@lfdr.de>; Tue, 27 Oct 2020 22:54:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.13106.33681 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kXWuo-00056S-68; Tue, 27 Oct 2020 21:54:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 13106.33681; Tue, 27 Oct 2020 21:54:02 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kXWuo-000560-36; Tue, 27 Oct 2020 21:54:02 +0000
Received: by outflank-mailman (input) for mailman id 13106;
 Tue, 27 Oct 2020 21:54:01 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=C1L6=EC=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1kXWun-00055v-2q
 for xen-devel@lists.xenproject.org; Tue, 27 Oct 2020 21:54:01 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 31a66316-1548-49c9-9f3c-2e37b361648d;
 Tue, 27 Oct 2020 21:54:00 +0000 (UTC)
Received: from sstabellini-ThinkPad-T480s (c-24-130-65-46.hsd1.ca.comcast.net
 [24.130.65.46])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 7224220759;
 Tue, 27 Oct 2020 21:53:59 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=C1L6=EC=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
	id 1kXWun-00055v-2q
	for xen-devel@lists.xenproject.org; Tue, 27 Oct 2020 21:54:01 +0000
X-Inumbo-ID: 31a66316-1548-49c9-9f3c-2e37b361648d
Received: from mail.kernel.org (unknown [198.145.29.99])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 31a66316-1548-49c9-9f3c-2e37b361648d;
	Tue, 27 Oct 2020 21:54:00 +0000 (UTC)
Received: from sstabellini-ThinkPad-T480s (c-24-130-65-46.hsd1.ca.comcast.net [24.130.65.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 7224220759;
	Tue, 27 Oct 2020 21:53:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1603835639;
	bh=hLuBGmvknLJruJYQUNZGkX4EVqyzQJamlMv7F6lFoho=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=vOuhydjw9vlxiSuYbstg3MW2oGhlejZ8GriRzNfLn4RdkjVwbV2wc643qtmaqkPBj
	 fxNpyuRws07osa8Ikr3w7OWn6YN3ZIzLEsVSiqxn0xhx/2Ll93BusC3uRUEkjfDNRi
	 Ln94Z4m4p0cL6QbfhDQL50xIrZkIz0HWmJIOUVkM=
Date: Tue, 27 Oct 2020 14:53:58 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
cc: Elliott Mitchell <ehem+undef@m5p.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    iommu@lists.linux-foundation.org, linux-kernel@vger.kernel.org, 
    xen-devel@lists.xenproject.org, hch@lst.de
Subject: Re: [PATCH] fix swiotlb panic on Xen
In-Reply-To: <20201027192726.GA13396@char.us.oracle.com>
Message-ID: <alpine.DEB.2.21.2010271453480.12247@sstabellini-ThinkPad-T480s>
References: <alpine.DEB.2.21.2010261653320.12247@sstabellini-ThinkPad-T480s> <20201027175114.GA32110@mattapan.m5p.com> <20201027192726.GA13396@char.us.oracle.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 27 Oct 2020, Konrad Rzeszutek Wilk wrote:
> > As the person who first found this and then confirmed this fixes a bug:
> > 
> > Tested-by: Elliott Mitchell <ehem+xen@m5p.com>
> 
> Thank you!!
> 
> I changed the title and added the various tags and will put it in
> linux-next later this week.

Looks fine, thank you


> >From a1eb2768bf5954d25aa0f0136b38f0aa5d92d984 Mon Sep 17 00:00:00 2001
> From: Stefano Stabellini <stefano.stabellini@xilinx.com>
> Date: Mon, 26 Oct 2020 17:02:14 -0700
> Subject: [PATCH] swiotlb: fix "x86: Don't panic if can not alloc buffer for
>  swiotlb"
> 
> kernel/dma/swiotlb.c:swiotlb_init gets called first and tries to
> allocate a buffer for the swiotlb. It does so by calling
> 
>   memblock_alloc_low(PAGE_ALIGN(bytes), PAGE_SIZE);
> 
> If the allocation must fail, no_iotlb_memory is set.
> 
> Later during initialization swiotlb-xen comes in
> (drivers/xen/swiotlb-xen.c:xen_swiotlb_init) and given that io_tlb_start
> is != 0, it thinks the memory is ready to use when actually it is not.
> 
> When the swiotlb is actually needed, swiotlb_tbl_map_single gets called
> and since no_iotlb_memory is set the kernel panics.
> 
> Instead, if swiotlb-xen.c:xen_swiotlb_init knew the swiotlb hadn't been
> initialized, it would do the initialization itself, which might still
> succeed.
> 
> Fix the panic by setting io_tlb_start to 0 on swiotlb initialization
> failure, and also by setting no_iotlb_memory to false on swiotlb
> initialization success.
> 
> Fixes: ac2cbab21f31 ("x86: Don't panic if can not alloc buffer for swiotlb")
> 
> Reported-by: Elliott Mitchell <ehem+xen@m5p.com>
> Tested-by: Elliott Mitchell <ehem+xen@m5p.com>
> Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>
> Reviewed-by: Christoph Hellwig <hch@lst.de>
> CC: stable@vger.kernel.org
> Signed-off-by: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
> ---
>  kernel/dma/swiotlb.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/kernel/dma/swiotlb.c b/kernel/dma/swiotlb.c
> index 465a567678d9..e08cac39c0ba 100644
> --- a/kernel/dma/swiotlb.c
> +++ b/kernel/dma/swiotlb.c
> @@ -229,6 +229,7 @@ int __init swiotlb_init_with_tbl(char *tlb, unsigned long nslabs, int verbose)
>  		io_tlb_orig_addr[i] = INVALID_PHYS_ADDR;
>  	}
>  	io_tlb_index = 0;
> +	no_iotlb_memory = false;
>  
>  	if (verbose)
>  		swiotlb_print_info();
> @@ -260,9 +261,11 @@ swiotlb_init(int verbose)
>  	if (vstart && !swiotlb_init_with_tbl(vstart, io_tlb_nslabs, verbose))
>  		return;
>  
> -	if (io_tlb_start)
> +	if (io_tlb_start) {
>  		memblock_free_early(io_tlb_start,
>  				    PAGE_ALIGN(io_tlb_nslabs << IO_TLB_SHIFT));
> +		io_tlb_start = 0;
> +	}
>  	pr_warn("Cannot allocate buffer");
>  	no_iotlb_memory = true;
>  }
> @@ -360,6 +363,7 @@ swiotlb_late_init_with_tbl(char *tlb, unsigned long nslabs)
>  		io_tlb_orig_addr[i] = INVALID_PHYS_ADDR;
>  	}
>  	io_tlb_index = 0;
> +	no_iotlb_memory = false;
>  
>  	swiotlb_print_info();
>  
> -- 
> 2.13.6
> 

