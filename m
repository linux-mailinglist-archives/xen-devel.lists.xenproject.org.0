Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B0F7237D477
	for <lists+xen-devel@lfdr.de>; Wed, 12 May 2021 23:42:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.126406.237974 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lgwbw-0000Zd-Fh; Wed, 12 May 2021 21:41:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 126406.237974; Wed, 12 May 2021 21:41:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lgwbw-0000XI-CS; Wed, 12 May 2021 21:41:44 +0000
Received: by outflank-mailman (input) for mailman id 126406;
 Wed, 12 May 2021 21:41:43 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=codm=KH=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1lgwbv-0000XC-B6
 for xen-devel@lists.xenproject.org; Wed, 12 May 2021 21:41:43 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 6c411ff8-8018-4bdb-8405-01f5c808961d;
 Wed, 12 May 2021 21:41:42 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 30AA161352;
 Wed, 12 May 2021 21:41:41 +0000 (UTC)
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
X-Inumbo-ID: 6c411ff8-8018-4bdb-8405-01f5c808961d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1620855701;
	bh=Asqt57QtsFlKxqfIvSBVd659UPg481sw4PcabZfvJkM=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=ECDd2Z3/uSrQ9clQvdlHt+tDsl2I0A3ri60a40SAhzOZTMRfOxJZuRUBnu0UyomTg
	 btBhFibLAFeleOtREuS16+0E3DfG0uwfvO4hGfqFfww8DDll8CS6RYcFx9r7LouaMl
	 611Oj85HYyFz2ykZxT+h9GbwX6YtTtFp4qeqC0W8aVyUt3fvmematGFljXyioxY3m1
	 qZRVgXKcPrBHWeh5GPCddKeayRrVL6rXEf1XAQbqx4WGiwF/DUmuQ9KLKiD/CiQsZx
	 d061mGZN4FBnkE6ct3Ym9ICXnv4+3wXm9h/wDJK0eEaSPfjQrtuHFXk9LAFDxCQKdm
	 ZJ+FYZV2smtCQ==
Date: Wed, 12 May 2021 14:41:40 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Julien Grall <julien@xen.org>
cc: xen-devel@lists.xenproject.org, Wei.Chen@arm.com, Henry.Wang@arm.com, 
    Penny.Zheng@arm.com, Bertrand.Marquis@arm.com, 
    Julien Grall <julien.grall@arm.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
    Julien Grall <jgrall@amazon.com>
Subject: Re: [PATCH RFCv2 07/15] xen/arm: mm: Re-implement early_fdt_map()
 using map_pages_to_xen()
In-Reply-To: <20210425201318.15447-8-julien@xen.org>
Message-ID: <alpine.DEB.2.21.2105121437501.5018@sstabellini-ThinkPad-T480s>
References: <20210425201318.15447-1-julien@xen.org> <20210425201318.15447-8-julien@xen.org>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Sun, 25 Apr 2021, Julien Grall wrote:
> From: Julien Grall <julien.grall@arm.com>
> 
> Now that map_pages_to_xen() has been extended to support 2MB mappings,
> we can replace the create_mappings() calls by map_pages_to_xen() calls.
> 
> The mapping can also be marked read-only has Xen as no business to
> modify the host Device Tree.

I think that's good. Just FYI there is some work at Xilinx to make
changes to the device tree at runtime but we'll cross that bridge when
we come to it.

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> Signed-off-by: Julien Grall <julien.grall@arm.com>
> Signed-off-by: Julien Grall <jgrall@amazon.com>
> 
> ---
>     Changes in v2:
>         - Add my AWS signed-off-by
>         - Fix typo in the commit message
> ---
>  xen/arch/arm/mm.c | 18 +++++++++++++-----
>  1 file changed, 13 insertions(+), 5 deletions(-)
> 
> diff --git a/xen/arch/arm/mm.c b/xen/arch/arm/mm.c
> index 2cbfbe25240e..8fac24d80086 100644
> --- a/xen/arch/arm/mm.c
> +++ b/xen/arch/arm/mm.c
> @@ -558,6 +558,7 @@ void * __init early_fdt_map(paddr_t fdt_paddr)
>      paddr_t offset;
>      void *fdt_virt;
>      uint32_t size;
> +    int rc;
>  
>      /*
>       * Check whether the physical FDT address is set and meets the minimum
> @@ -573,8 +574,12 @@ void * __init early_fdt_map(paddr_t fdt_paddr)
>      /* The FDT is mapped using 2MB superpage */
>      BUILD_BUG_ON(BOOT_FDT_VIRT_START % SZ_2M);
>  
> -    create_mappings(xen_second, BOOT_FDT_VIRT_START, paddr_to_pfn(base_paddr),
> -                    SZ_2M >> PAGE_SHIFT, SZ_2M);
> +    rc = map_pages_to_xen(BOOT_FDT_VIRT_START, maddr_to_mfn(base_paddr),
> +                          SZ_2M >> PAGE_SHIFT,
> +                          PAGE_HYPERVISOR_RO | _PAGE_BLOCK);
> +    if ( rc )
> +        panic("Unable to map the device-tree.\n");
> +
>  
>      offset = fdt_paddr % SECOND_SIZE;
>      fdt_virt = (void *)BOOT_FDT_VIRT_START + offset;
> @@ -588,9 +593,12 @@ void * __init early_fdt_map(paddr_t fdt_paddr)
>  
>      if ( (offset + size) > SZ_2M )
>      {
> -        create_mappings(xen_second, BOOT_FDT_VIRT_START + SZ_2M,
> -                        paddr_to_pfn(base_paddr + SZ_2M),
> -                        SZ_2M >> PAGE_SHIFT, SZ_2M);
> +        rc = map_pages_to_xen(BOOT_FDT_VIRT_START + SZ_2M,
> +                              maddr_to_mfn(base_paddr + SZ_2M),
> +                              SZ_2M >> PAGE_SHIFT,
> +                              PAGE_HYPERVISOR_RO | _PAGE_BLOCK);
> +        if ( rc )
> +            panic("Unable to map the device-tree\n");
>      }
>  
>      return fdt_virt;
> -- 
> 2.17.1
> 

