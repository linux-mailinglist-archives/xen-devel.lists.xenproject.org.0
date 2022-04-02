Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A4424EFD5D
	for <lists+xen-devel@lfdr.de>; Sat,  2 Apr 2022 02:11:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.297669.507139 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1naRLh-0004i5-1O; Sat, 02 Apr 2022 00:10:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 297669.507139; Sat, 02 Apr 2022 00:10:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1naRLg-0004gF-UM; Sat, 02 Apr 2022 00:10:36 +0000
Received: by outflank-mailman (input) for mailman id 297669;
 Sat, 02 Apr 2022 00:10:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fP4x=UM=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1naRLf-0004g9-9b
 for xen-devel@lists.xenproject.org; Sat, 02 Apr 2022 00:10:35 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 509a62a7-b219-11ec-a405-831a346695d4;
 Sat, 02 Apr 2022 02:10:33 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 730D9B82571;
 Sat,  2 Apr 2022 00:10:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B8300C2BBE4;
 Sat,  2 Apr 2022 00:10:31 +0000 (UTC)
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
X-Inumbo-ID: 509a62a7-b219-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1648858232;
	bh=RX90IpVuGlGf+To2nZdQnBDTdysiH26Vn1hg4pdsYlc=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=KzA/XevVq27sdAgpzAlJjUbMBB8TaEQjC/6b/H1LaOjmjgVFsuk2ftNXtEmvgQofA
	 YAsxQpT4iR0sl4H3KCcm4PKiHO8gT+amwgywXEiAuOA65R0SiMTP1zprYbJqq338yP
	 jWbD0qTvxb3QHfk1TfffxEJX2wDjkwncaS5boccwwwdVnLooqzciA653YfsHhENtBG
	 NIWBLfzZQWQZAoyqytl1FryzzqeVC3bLrLH0XJ4SWla2aIH3FgdjKZKUIpCzFwnchI
	 uBgRdQLfy4K0aCWLmM6eCI3xZr/sZtwRLJE8VWBQ6dAhs9TMhy68Mx5h/30o8bhO+o
	 1e69W9SpH1C0Q==
Date: Fri, 1 Apr 2022 17:10:30 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Julien Grall <julien@xen.org>
cc: xen-devel@lists.xenproject.org, Julien Grall <julien.grall@arm.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
    Julien Grall <jgrall@amazon.com>
Subject: Re: [PATCH v3 08/19] xen/arm: mm: Re-implement early_fdt_map() using
 map_pages_to_xen()
In-Reply-To: <20220221102218.33785-9-julien@xen.org>
Message-ID: <alpine.DEB.2.22.394.2204011709140.2910984@ubuntu-linux-20-04-desktop>
References: <20220221102218.33785-1-julien@xen.org> <20220221102218.33785-9-julien@xen.org>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 21 Feb 2022, Julien Grall wrote:
> From: Julien Grall <julien.grall@arm.com>
> 
> Now that map_pages_to_xen() has been extended to support 2MB mappings,
> we can replace the create_mappings() calls by map_pages_to_xen() calls.
> 
> The mapping can also be marked read-only has Xen as no business to
> modify the host Device Tree.
> 
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
> index f088a4b2de96..24de8dcb9042 100644
> --- a/xen/arch/arm/mm.c
> +++ b/xen/arch/arm/mm.c
> @@ -559,6 +559,7 @@ void * __init early_fdt_map(paddr_t fdt_paddr)
>      paddr_t offset;
>      void *fdt_virt;
>      uint32_t size;
> +    int rc;
>  
>      /*
>       * Check whether the physical FDT address is set and meets the minimum
> @@ -574,8 +575,12 @@ void * __init early_fdt_map(paddr_t fdt_paddr)
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
> @@ -589,9 +594,12 @@ void * __init early_fdt_map(paddr_t fdt_paddr)
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

Very good! :-)

I have a small preference for making the change to PAGE_HYPERVISOR_RO in
a separate patch because it would make it easier to revert in the
future if we need so (e.g. overlays...). But it is OK either way.

