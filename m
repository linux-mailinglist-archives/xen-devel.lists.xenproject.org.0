Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 70EA3AFBCCA
	for <lists+xen-devel@lfdr.de>; Mon,  7 Jul 2025 22:49:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1035773.1408142 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uYslQ-0007X4-Cu; Mon, 07 Jul 2025 20:48:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1035773.1408142; Mon, 07 Jul 2025 20:48:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uYslQ-0007Ud-9F; Mon, 07 Jul 2025 20:48:36 +0000
Received: by outflank-mailman (input) for mailman id 1035773;
 Mon, 07 Jul 2025 20:48:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=S3ai=ZU=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1uYslP-00070y-04
 for xen-devel@lists.xenproject.org; Mon, 07 Jul 2025 20:48:35 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id be7ab453-5b73-11f0-b894-0df219b8e170;
 Mon, 07 Jul 2025 22:48:33 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 159A15C5707;
 Mon,  7 Jul 2025 20:48:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 02402C4CEE3;
 Mon,  7 Jul 2025 20:48:30 +0000 (UTC)
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
X-Inumbo-ID: be7ab453-5b73-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751921311;
	bh=hnHFnioScnLKh/OzZlEMykpWaidYWyrtR+zhi4FIs90=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=SJVDcyYYJiODK14Jw+dQO02agBuFMWF6EtpELYbpbg5qNmVbaEDKgj0unyLOGg/Vw
	 83g+6z312X4LI4n7gWiVA1Rw/euyQl7ckfVxuiMaEVxHxt+WJ27ZZfzItg4pWX5p/L
	 uP9nf3IVNylS7dSSaLd6FSObLs49rn2KzGuVkCfPOWaJY7ZIvP+lcKL40u8n1468aq
	 MTf83kiXTkBcsfjprxqXUUgSIYnK60hHxxjfE178YcfUFdqeWEb3weO9gv0LqMGS/M
	 MHy6EuynPJWKJSOF0+Fy1oV35j6g+62epDxjd6GcGHMaP4Ef395JyYhtH/6F06HlAC
	 It5Dsj0l0VTFQ==
Date: Mon, 7 Jul 2025 13:48:29 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Michal Orzel <michal.orzel@amd.com>
cc: xen-devel@lists.xenproject.org, 
    Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH] xen/arm32: Tidy up setup_mm()
In-Reply-To: <20250704090831.45804-1-michal.orzel@amd.com>
Message-ID: <alpine.DEB.2.22.394.2507071347510.605088@ubuntu-linux-20-04-desktop>
References: <20250704090831.45804-1-michal.orzel@amd.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 4 Jul 2025, Michal Orzel wrote:
> The current look and feel of setup_mm() leaves a lot to be desired. The
> scope of variables is not the best, many variables are not really needed
> while some others are set but not used. The first iteration of membanks
> is split from the loop for no reason. Tidy up this function for better
> readability.
> 
> No functional change.
> 
> Signed-off-by: Michal Orzel <michal.orzel@amd.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

> ---
>  xen/arch/arm/arm32/mmu/mm.c | 28 +++++++++-------------------
>  1 file changed, 9 insertions(+), 19 deletions(-)
> 
> diff --git a/xen/arch/arm/arm32/mmu/mm.c b/xen/arch/arm/arm32/mmu/mm.c
> index e6d9b49acd3c..5e4766ddcf65 100644
> --- a/xen/arch/arm/arm32/mmu/mm.c
> +++ b/xen/arch/arm/arm32/mmu/mm.c
> @@ -74,8 +74,7 @@ static paddr_t __init fit_xenheap_in_static_heap(uint32_t size, paddr_t align)
>  void __init setup_mm(void)
>  {
>      const struct membanks *mem = bootinfo_get_mem();
> -    paddr_t ram_start, ram_end, ram_size, e, bank_start, bank_end, bank_size;
> -    paddr_t static_heap_end = 0, static_heap_size = 0;
> +    paddr_t ram_start = INVALID_PADDR, ram_end = 0, ram_size = 0, e;
>      unsigned long heap_pages, xenheap_pages, domheap_pages;
>      unsigned int i;
>      const uint32_t ctr = READ_CP32(CTR);
> @@ -89,19 +88,14 @@ void __init setup_mm(void)
>  
>      init_pdx();
>  
> -    ram_start = mem->bank[0].start;
> -    ram_size  = mem->bank[0].size;
> -    ram_end   = ram_start + ram_size;
> -
> -    for ( i = 1; i < mem->nr_banks; i++ )
> +    for ( i = 0; i < mem->nr_banks; i++ )
>      {
> -        bank_start = mem->bank[i].start;
> -        bank_size = mem->bank[i].size;
> -        bank_end = bank_start + bank_size;
> +        const struct membank *bank = &mem->bank[i];
> +        paddr_t bank_end = bank->start + bank->size;
>  
> -        ram_size  = ram_size + bank_size;
> -        ram_start = min(ram_start,bank_start);
> -        ram_end   = max(ram_end,bank_end);
> +        ram_size = ram_size + bank->size;
> +        ram_start = min(ram_start, bank->start);
> +        ram_end = max(ram_end, bank_end);
>      }
>  
>      total_pages = ram_size >> PAGE_SHIFT;
> @@ -109,18 +103,14 @@ void __init setup_mm(void)
>      if ( using_static_heap )
>      {
>          const struct membanks *reserved_mem = bootinfo_get_reserved_mem();
> +        paddr_t static_heap_size = 0;
>  
>          for ( i = 0 ; i < reserved_mem->nr_banks; i++ )
>          {
>              if ( reserved_mem->bank[i].type != MEMBANK_STATIC_HEAP )
>                  continue;
>  
> -            bank_start = reserved_mem->bank[i].start;
> -            bank_size = reserved_mem->bank[i].size;
> -            bank_end = bank_start + bank_size;
> -
> -            static_heap_size += bank_size;
> -            static_heap_end = max(static_heap_end, bank_end);
> +            static_heap_size += reserved_mem->bank[i].size;
>          }
>  
>          heap_pages = static_heap_size >> PAGE_SHIFT;
> -- 
> 2.25.1
> 

