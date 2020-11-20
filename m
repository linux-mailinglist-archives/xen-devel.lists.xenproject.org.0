Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E3D342BA00D
	for <lists+xen-devel@lfdr.de>; Fri, 20 Nov 2020 02:54:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.31529.61968 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kfvcz-0006Ss-9K; Fri, 20 Nov 2020 01:54:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 31529.61968; Fri, 20 Nov 2020 01:54:21 +0000
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
	id 1kfvcz-0006ST-6C; Fri, 20 Nov 2020 01:54:21 +0000
Received: by outflank-mailman (input) for mailman id 31529;
 Fri, 20 Nov 2020 01:54:19 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9Wlp=E2=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1kfvcx-0006SO-6Z
 for xen-devel@lists.xenproject.org; Fri, 20 Nov 2020 01:54:19 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0342dc4c-752a-4641-9da8-b36e3d1b47f2;
 Fri, 20 Nov 2020 01:54:18 +0000 (UTC)
Received: from sstabellini-ThinkPad-T480s (c-24-130-65-46.hsd1.ca.comcast.net
 [24.130.65.46])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 6F93C2145D;
 Fri, 20 Nov 2020 01:54:17 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=9Wlp=E2=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
	id 1kfvcx-0006SO-6Z
	for xen-devel@lists.xenproject.org; Fri, 20 Nov 2020 01:54:19 +0000
X-Inumbo-ID: 0342dc4c-752a-4641-9da8-b36e3d1b47f2
Received: from mail.kernel.org (unknown [198.145.29.99])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 0342dc4c-752a-4641-9da8-b36e3d1b47f2;
	Fri, 20 Nov 2020 01:54:18 +0000 (UTC)
Received: from sstabellini-ThinkPad-T480s (c-24-130-65-46.hsd1.ca.comcast.net [24.130.65.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 6F93C2145D;
	Fri, 20 Nov 2020 01:54:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1605837257;
	bh=xcLh2ZPbmsnC9fqokKIepZfAR6Zn/zyJxtNaUi4gDGw=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=IOJiijPv248B4xGBapnoVYc7KgY2xi9G+SamDRMrD+DTqTZFMnb7jbYE83RL6zxAz
	 7P8qnP9Bi/uq93G67AOvR2Zhkhy6l7zMK2c9wPcCLre1F4aXrgosHRBKjsJjrI1ntt
	 u1isR+H6LPgZQ12QVbYG2ykFehAGocGU8g+f00bU=
Date: Thu, 19 Nov 2020 17:54:16 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Julien Grall <julien@xen.org>
cc: xen-devel@lists.xenproject.org, bertrand.marquis@arm.com, 
    Julien Grall <julien.grall@arm.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH RFC 6/6] xen/arm: mm: Re-implement early_fdt_map() using
 map_pages_to_xen()
In-Reply-To: <20201119190751.22345-7-julien@xen.org>
Message-ID: <alpine.DEB.2.21.2011191754010.7979@sstabellini-ThinkPad-T480s>
References: <20201119190751.22345-1-julien@xen.org> <20201119190751.22345-7-julien@xen.org>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 19 Nov 2020, Julien Grall wrote:
> From: Julien Grall <julien.grall@arm.com>
> 
> Now that map_pages_to_xen() has been extended to support 2MB mappings,
> we can replace the create_mappings() calls by map_pages_to_xen() calls.
> 
> The mapping can also be marked read-only as Xen as no business to modify
> the host Device Tree.
> 
> Signed-off-by: Julien Grall <julien.grall@arm.com>

Acked-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
>  xen/arch/arm/mm.c | 18 +++++++++++++-----
>  1 file changed, 13 insertions(+), 5 deletions(-)
> 
> diff --git a/xen/arch/arm/mm.c b/xen/arch/arm/mm.c
> index aee6d410ac4f..37ea9d5ce20a 100644
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

