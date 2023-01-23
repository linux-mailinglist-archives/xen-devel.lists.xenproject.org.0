Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FC12678AD0
	for <lists+xen-devel@lfdr.de>; Mon, 23 Jan 2023 23:35:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.483309.749402 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pK5Op-00086L-9K; Mon, 23 Jan 2023 22:34:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 483309.749402; Mon, 23 Jan 2023 22:34:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pK5Op-00084V-6P; Mon, 23 Jan 2023 22:34:47 +0000
Received: by outflank-mailman (input) for mailman id 483309;
 Mon, 23 Jan 2023 22:34:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QMpG=5U=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1pK5Oo-00084P-0x
 for xen-devel@lists.xenproject.org; Mon, 23 Jan 2023 22:34:46 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 21c34c2f-9b6e-11ed-b8d1-410ff93cb8f0;
 Mon, 23 Jan 2023 23:34:43 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id EE66FB80E9E;
 Mon, 23 Jan 2023 22:34:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C278FC433D2;
 Mon, 23 Jan 2023 22:34:40 +0000 (UTC)
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
X-Inumbo-ID: 21c34c2f-9b6e-11ed-b8d1-410ff93cb8f0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1674513281;
	bh=q18xf4QwE+7KjO3nG4LFzzF0G8fT8Xi8a6GR5JKY6lA=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=jAl8JSEpnLP6T7nq9hl9ZIb/21LpExpmH8Fga+3tfPxFgrPV2ODknirHFtzn6yUeI
	 HTT8K4xI+3iQvGVT0sP+RWcLiDkJjyZUl9+fpvt90aWBtF4ZVmP3O0uXH2PxMudh7A
	 GkLz6ZpcO72MzvQ7FecCwTY7cZqZsgHefgqJvY+LUJNUrGbAEiowkNKw/UL8cnU675
	 llhTrDE5RCsqC6oEHXGe+1pk81VKHujReeOGy2VH7yQNUc4W+mXRyABmUm6viDRaKT
	 QJD/u51HHBssZUx1I1CKim/f0kYSzQfBpWbcv7aOUyIzMX2/o0td+eSN+S/xTwbkZq
	 4zhBaWXsSLR2g==
Date: Mon, 23 Jan 2023 14:34:39 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Julien Grall <julien@xen.org>
cc: xen-devel@lists.xenproject.org, Julien Grall <jgrall@amazon.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH 21/22] xen/arm64: Implement a mapcache for arm64
In-Reply-To: <20221216114853.8227-22-julien@xen.org>
Message-ID: <alpine.DEB.2.22.394.2301231434260.1978264@ubuntu-linux-20-04-desktop>
References: <20221216114853.8227-1-julien@xen.org> <20221216114853.8227-22-julien@xen.org>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 16 Dec 2022, Julien Grall wrote:
> From: Julien Grall <jgrall@amazon.com>
> 
> At the moment, on arm64, map_domain_page() is implemented using
> virt_to_mfn(). Therefore it is relying on the directmap.
> 
> In a follow-up patch, we will allow the admin to remove the directmap.
> Therefore we want to implement a mapcache.
> 
> Thanksfully there is already one for arm32. So select ARCH_ARM_DOMAIN_PAGE
> and add the necessary boiler plate to support 64-bit:
>     - The page-table start at level 0, so we need to allocate the level
>       1 page-table
>     - map_domain_page() should check if the page is in the directmap. If
>       yes, then use virt_to_mfn() to limit the performance impact
>       when the directmap is still enabled (this will be selectable
>       on the command line).
> 
> Take the opportunity to replace first_table_offset(...) with offsets[...].
> 
> Note that, so far, arch_mfns_in_directmap() always return true on
> arm64. So the mapcache is not yet used. This will change in a
> follow-up patch.
> 
> Signed-off-by: Julien Grall <jgrall@amazon.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ----
> 
>     There are a few TODOs:
>         - It is becoming more critical to fix the mapcache
>           implementation (this is not compliant with the Arm Arm)
>         - Evaluate the performance
> ---
>  xen/arch/arm/Kconfig              |  1 +
>  xen/arch/arm/domain_page.c        | 47 +++++++++++++++++++++++++++----
>  xen/arch/arm/include/asm/config.h |  7 +++++
>  xen/arch/arm/include/asm/mm.h     |  5 ++++
>  xen/arch/arm/mm.c                 |  6 ++--
>  xen/arch/arm/setup.c              |  4 +++
>  6 files changed, 62 insertions(+), 8 deletions(-)
> 
> diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
> index 239d3aed3c7f..9c58b2d5c3aa 100644
> --- a/xen/arch/arm/Kconfig
> +++ b/xen/arch/arm/Kconfig
> @@ -9,6 +9,7 @@ config ARM_64
>  	select 64BIT
>  	select ARM_EFI
>  	select HAS_FAST_MULTIPLY
> +	select ARCH_MAP_DOMAIN_PAGE
>  
>  config ARM
>  	def_bool y
> diff --git a/xen/arch/arm/domain_page.c b/xen/arch/arm/domain_page.c
> index 4540b3c5f24c..f3547dc853ef 100644
> --- a/xen/arch/arm/domain_page.c
> +++ b/xen/arch/arm/domain_page.c
> @@ -1,4 +1,5 @@
>  /* SPDX-License-Identifier: GPL-2.0-or-later */
> +#include <xen/domain_page.h>
>  #include <xen/mm.h>
>  #include <xen/pmap.h>
>  #include <xen/vmap.h>
> @@ -8,6 +9,8 @@
>  /* Override macros from asm/page.h to make them work with mfn_t */
>  #undef virt_to_mfn
>  #define virt_to_mfn(va) _mfn(__virt_to_mfn(va))
> +#undef mfn_to_virt
> +#define mfn_to_virt(va) __mfn_to_virt(mfn_x(mfn))
>  
>  /* cpu0's domheap page tables */
>  static DEFINE_PAGE_TABLES(cpu0_dommap, DOMHEAP_SECOND_PAGES);
> @@ -31,13 +34,30 @@ bool init_domheap_mappings(unsigned int cpu)
>  {
>      unsigned int order = get_order_from_pages(DOMHEAP_SECOND_PAGES);
>      lpae_t *root = per_cpu(xen_pgtable, cpu);
> +    lpae_t *first;
>      unsigned int i, first_idx;
>      lpae_t *domheap;
>      mfn_t mfn;
>  
> +    /* Convenience aliases */
> +    DECLARE_OFFSETS(offsets, DOMHEAP_VIRT_START);
> +
>      ASSERT(root);
>      ASSERT(!per_cpu(xen_dommap, cpu));
>  
> +    /*
> +     * On Arm64, the root is at level 0. Therefore we need an extra step
> +     * to allocate the first level page-table.
> +     */
> +#ifdef CONFIG_ARM_64
> +    if ( create_xen_table(&root[offsets[0]]) )
> +        return false;
> +
> +    first = xen_map_table(lpae_get_mfn(root[offsets[0]]));
> +#else
> +    first = root;
> +#endif
> +
>      /*
>       * The domheap for cpu0 is initialized before the heap is initialized.
>       * So we need to use pre-allocated pages.
> @@ -58,16 +78,20 @@ bool init_domheap_mappings(unsigned int cpu)
>       * domheap mapping pages.
>       */
>      mfn = virt_to_mfn(domheap);
> -    first_idx = first_table_offset(DOMHEAP_VIRT_START);
> +    first_idx = offsets[1];
>      for ( i = 0; i < DOMHEAP_SECOND_PAGES; i++ )
>      {
>          lpae_t pte = mfn_to_xen_entry(mfn_add(mfn, i), MT_NORMAL);
>          pte.pt.table = 1;
> -        write_pte(&root[first_idx + i], pte);
> +        write_pte(&first[first_idx + i], pte);
>      }
>  
>      per_cpu(xen_dommap, cpu) = domheap;
>  
> +#ifdef CONFIG_ARM_64
> +    xen_unmap_table(first);
> +#endif
> +
>      return true;
>  }
>  
> @@ -91,6 +115,10 @@ void *map_domain_page(mfn_t mfn)
>      lpae_t pte;
>      int i, slot;
>  
> +    /* Bypass the mapcache if the page is in the directmap */
> +    if ( arch_mfns_in_directmap(mfn_x(mfn), 1) )
> +        return mfn_to_virt(mfn);
> +
>      local_irq_save(flags);
>  
>      /* The map is laid out as an open-addressed hash table where each
> @@ -151,15 +179,24 @@ void *map_domain_page(mfn_t mfn)
>  }
>  
>  /* Release a mapping taken with map_domain_page() */
> -void unmap_domain_page(const void *va)
> +void unmap_domain_page(const void *ptr)
>  {
> +    unsigned long va = (unsigned long)ptr;
>      unsigned long flags;
>      lpae_t *map = this_cpu(xen_dommap);
> -    int slot = ((unsigned long) va - DOMHEAP_VIRT_START) >> SECOND_SHIFT;
> +    unsigned int slot;
>  
> -    if ( !va )
> +    /*
> +     * map_domain_page() may not have mapped anything if the address
> +     * is part of the directmap. So ignore anything outside of the
> +     * domheap.
> +     */
> +    if ( (va < DOMHEAP_VIRT_START) ||
> +         ((va - DOMHEAP_VIRT_START) >= DOMHEAP_VIRT_SIZE) )
>          return;
>  
> +    slot = (va - DOMHEAP_VIRT_START) >> SECOND_SHIFT;
> +
>      local_irq_save(flags);
>  
>      ASSERT(slot >= 0 && slot < DOMHEAP_ENTRIES);
> diff --git a/xen/arch/arm/include/asm/config.h b/xen/arch/arm/include/asm/config.h
> index 0fefed1b8aa9..12b7f1f1b9ea 100644
> --- a/xen/arch/arm/include/asm/config.h
> +++ b/xen/arch/arm/include/asm/config.h
> @@ -156,6 +156,13 @@
>  #define FRAMETABLE_SIZE        GB(32)
>  #define FRAMETABLE_NR          (FRAMETABLE_SIZE / sizeof(*frame_table))
>  
> +#define DOMHEAP_VIRT_START     SLOT0(255)
> +#define DOMHEAP_VIRT_SIZE      GB(2)
> +
> +#define DOMHEAP_ENTRIES        1024 /* 1024 2MB mapping slots */
> +/* Number of domheap pagetable pages required at the second level (2MB mappings) */
> +#define DOMHEAP_SECOND_PAGES (DOMHEAP_VIRT_SIZE >> FIRST_SHIFT)
> +
>  #define DIRECTMAP_VIRT_START   SLOT0(256)
>  #define DIRECTMAP_SIZE         (SLOT0_ENTRY_SIZE * (265-256))
>  #define DIRECTMAP_VIRT_END     (DIRECTMAP_VIRT_START + DIRECTMAP_SIZE - 1)
> diff --git a/xen/arch/arm/include/asm/mm.h b/xen/arch/arm/include/asm/mm.h
> index 7a2c775f9562..d73abf1bf763 100644
> --- a/xen/arch/arm/include/asm/mm.h
> +++ b/xen/arch/arm/include/asm/mm.h
> @@ -416,6 +416,11 @@ static inline bool arch_has_directmap(void)
>      return true;
>  }
>  
> +/* Helpers to allocate, map and unmap a Xen page-table */
> +int create_xen_table(lpae_t *entry);
> +lpae_t *xen_map_table(mfn_t mfn);
> +void xen_unmap_table(const lpae_t *table);
> +
>  #endif /*  __ARCH_ARM_MM__ */
>  /*
>   * Local variables:
> diff --git a/xen/arch/arm/mm.c b/xen/arch/arm/mm.c
> index 2af751af9003..f5fb957554a5 100644
> --- a/xen/arch/arm/mm.c
> +++ b/xen/arch/arm/mm.c
> @@ -177,7 +177,7 @@ static void __init __maybe_unused build_assertions(void)
>  #undef CHECK_SAME_SLOT
>  }
>  
> -static lpae_t *xen_map_table(mfn_t mfn)
> +lpae_t *xen_map_table(mfn_t mfn)
>  {
>      /*
>       * During early boot, map_domain_page() may be unusable. Use the
> @@ -189,7 +189,7 @@ static lpae_t *xen_map_table(mfn_t mfn)
>      return map_domain_page(mfn);
>  }
>  
> -static void xen_unmap_table(const lpae_t *table)
> +void xen_unmap_table(const lpae_t *table)
>  {
>      /*
>       * During early boot, xen_map_table() will not use map_domain_page()
> @@ -699,7 +699,7 @@ void *ioremap(paddr_t pa, size_t len)
>      return ioremap_attr(pa, len, PAGE_HYPERVISOR_NOCACHE);
>  }
>  
> -static int create_xen_table(lpae_t *entry)
> +int create_xen_table(lpae_t *entry)
>  {
>      mfn_t mfn;
>      void *p;
> diff --git a/xen/arch/arm/setup.c b/xen/arch/arm/setup.c
> index 88d9d90fb5ad..b1a8f91bb385 100644
> --- a/xen/arch/arm/setup.c
> +++ b/xen/arch/arm/setup.c
> @@ -923,6 +923,10 @@ static void __init setup_mm(void)
>       */
>      populate_boot_allocator();
>  
> +    if ( !init_domheap_mappings(smp_processor_id()) )
> +        panic("CPU%u: Unable to prepare the domheap page-tables\n",
> +              smp_processor_id());
> +
>      total_pages = 0;
>  
>      for ( i = 0; i < banks->nr_banks; i++ )
> -- 
> 2.38.1
> 

