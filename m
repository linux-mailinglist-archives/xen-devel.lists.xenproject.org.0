Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A0B153D3A8
	for <lists+xen-devel@lfdr.de>; Sat,  4 Jun 2022 00:34:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.341697.566935 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nxFrj-0005Fg-P3; Fri, 03 Jun 2022 22:33:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 341697.566935; Fri, 03 Jun 2022 22:33:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nxFrj-0005Cl-Lw; Fri, 03 Jun 2022 22:33:59 +0000
Received: by outflank-mailman (input) for mailman id 341697;
 Fri, 03 Jun 2022 22:33:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Fj01=WK=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1nxFri-0005Cd-EF
 for xen-devel@lists.xenproject.org; Fri, 03 Jun 2022 22:33:58 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4196a916-e38d-11ec-bd2c-47488cf2e6aa;
 Sat, 04 Jun 2022 00:33:57 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id D46BCB82482;
 Fri,  3 Jun 2022 22:33:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 366E8C385A9;
 Fri,  3 Jun 2022 22:33:55 +0000 (UTC)
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
X-Inumbo-ID: 4196a916-e38d-11ec-bd2c-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1654295635;
	bh=+9JHCtA9BLmi35HrS9NgwTtn0qiew72TgVW99JpUGjU=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=QPz2+32AZnI21aFRJBEFN4IJXJQezGNMT3ZyDrkMGppvH9hPdgt4btwORr4kkc1ar
	 rKdi5RLbnn+cG9hxkXq9CO1YRIUS4k+27gfG1avKKSlYsz/6FeY62u5piBkTXEpESx
	 wNQ2v4jcHid1KLvum6yTibtdnbNyMtEs1XVCUIsH6ext/kAbH4BERpdzsp8kdqep2d
	 MtKknYhTEPv0p+ksMrSXhfxJorGXHwRRR/pbBmDx6yN/bP4sBvJ+ca04ZZPPLAR+zm
	 grOJ7CBm663S85SU876ywJMxlwibgAMpa6VwYD01zAsBuq5uk3X/exxoV/kFImf3HR
	 cGUl3OUNB4PVg==
Date: Fri, 3 Jun 2022 15:33:54 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Julien Grall <julien@xen.org>
cc: xen-devel@lists.xenproject.org, Julien Grall <julien.grall@arm.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
    Julien Grall <jgrall@amazon.com>, Hongda Deng <Hongda.Heng@arm.com>
Subject: Re: [PATCH 05/16] xen/arm: mm: Re-implement early_fdt_map() using
 map_pages_to_xen()
In-Reply-To: <20220520120937.28925-6-julien@xen.org>
Message-ID: <alpine.DEB.2.22.394.2206031533400.2783803@ubuntu-linux-20-04-desktop>
References: <20220520120937.28925-1-julien@xen.org> <20220520120937.28925-6-julien@xen.org>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 20 May 2022, Julien Grall wrote:
> From: Julien Grall <julien.grall@arm.com>
> 
> Now that map_pages_to_xen() has been extended to support 2MB mappings,
> we can replace the create_mappings() calls by map_pages_to_xen() calls.
> 
> The mapping can also be marked read-only as Xen should not modify
> the host Device Tree during boot.
> 
> Signed-off-by: Julien Grall <julien.grall@arm.com>
> Signed-off-by: Julien Grall <jgrall@amazon.com>
> Reviewed-by: Hongda Deng <Hongda.Heng@arm.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
>     Changes in v4:
>         - Fix typo in the commit message
>         - Add Hongda's reviewed-by
> 
>     Changes in v2:
>         - Add my AWS signed-off-by
>         - Fix typo in the commit message
> ---
>  xen/arch/arm/mm.c | 18 +++++++++++++-----
>  1 file changed, 13 insertions(+), 5 deletions(-)
> 
> diff --git a/xen/arch/arm/mm.c b/xen/arch/arm/mm.c
> index 64a79d45b38c..03f970e4d10b 100644
> --- a/xen/arch/arm/mm.c
> +++ b/xen/arch/arm/mm.c
> @@ -574,6 +574,7 @@ void * __init early_fdt_map(paddr_t fdt_paddr)
>      paddr_t offset;
>      void *fdt_virt;
>      uint32_t size;
> +    int rc;
>  
>      /*
>       * Check whether the physical FDT address is set and meets the minimum
> @@ -589,8 +590,12 @@ void * __init early_fdt_map(paddr_t fdt_paddr)
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
> @@ -604,9 +609,12 @@ void * __init early_fdt_map(paddr_t fdt_paddr)
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
> 2.32.0
> 

