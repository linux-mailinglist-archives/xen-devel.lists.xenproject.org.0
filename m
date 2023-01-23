Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D675678AAD
	for <lists+xen-devel@lfdr.de>; Mon, 23 Jan 2023 23:22:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.483292.749373 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pK5Bm-0005Oj-K5; Mon, 23 Jan 2023 22:21:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 483292.749373; Mon, 23 Jan 2023 22:21:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pK5Bm-0005LL-GT; Mon, 23 Jan 2023 22:21:18 +0000
Received: by outflank-mailman (input) for mailman id 483292;
 Mon, 23 Jan 2023 22:21:17 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QMpG=5U=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1pK5Bl-0005LF-26
 for xen-devel@lists.xenproject.org; Mon, 23 Jan 2023 22:21:17 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3f7a1077-9b6c-11ed-91b6-6bf2151ebd3b;
 Mon, 23 Jan 2023 23:21:15 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id AB40D610A3;
 Mon, 23 Jan 2023 22:21:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 40292C433D2;
 Mon, 23 Jan 2023 22:21:12 +0000 (UTC)
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
X-Inumbo-ID: 3f7a1077-9b6c-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1674512473;
	bh=6E1kig4bLlQfEGpHD5h5nVyVIcXW+v7GZ2dJW8zl9n4=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=n1A3PxzXcCyU4wYuPXy5uTC0ezDCjS6r8dW12biuG97Axp/s740gIL4g2Ffn+Gqtq
	 hb4dHX61MHs/RX6t+ODo06AX+c05ydk9VmDPLZ/LD+V4rnGTwMrt5tYu+EO4m8rkbL
	 td0Vx4xbVUr/1NEpxxFydYhqAt7KU9Bpfo6rJC3Fr4TLZ8qypY/kZbxxxM95pJ6TRY
	 fSf2JtQ5Uy7qOmJ42mkBoo6Wczx7fyNVIj78LwXnGHWnHL4LheoRLi3xvp2P8DSYft
	 HiDV4cX0GyObcFK/+CHUzS4VqizEHg7QJZLzj/DeiY8doeNlcvInZrjSkuCOS5J0A+
	 bxvrKw4CyuSEg==
Date: Mon, 23 Jan 2023 14:21:10 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Julien Grall <julien@xen.org>
cc: xen-devel@lists.xenproject.org, Julien Grall <jgrall@amazon.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH 20/22] xen/arm64: mm: Use per-pCPU page-tables
In-Reply-To: <20221216114853.8227-21-julien@xen.org>
Message-ID: <alpine.DEB.2.22.394.2301231421000.1978264@ubuntu-linux-20-04-desktop>
References: <20221216114853.8227-1-julien@xen.org> <20221216114853.8227-21-julien@xen.org>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 16 Dec 2022, Julien Grall wrote:
> From: Julien Grall <jgrall@amazon.com>
> 
> At the moment, on Arm64, every pCPU are sharing the same page-tables.
> 
> In a follow-up patch, we will allow the possibility to remove the
> direct map and therefore it will be necessary to have a mapcache.
> 
> While we have plenty of spare virtual address space to have
> to reserve part for each pCPU, it means that temporary mappings
> (e.g. guest memory) could be accessible by every pCPU.
> 
> In order to increase our security posture, it would be better if
> those mappings are only accessible by the pCPU doing the temporary
> mapping.
> 
> In addition to that, a per-pCPU page-tables opens the way to have
> per-domain mapping area.
> 
> Arm32 is already using per-pCPU page-tables so most of the code
> can be re-used. Arm64 doesn't yet have support for the mapcache,
> so a stub is provided (moved to its own header asm/domain_page.h).
> 
> Take the opportunity to fix a typo in a comment that is modified.
> 
> Signed-off-by: Julien Grall <jgrall@amazon.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
>  xen/arch/arm/domain_page.c             |  2 ++
>  xen/arch/arm/include/asm/arm32/mm.h    |  8 -----
>  xen/arch/arm/include/asm/domain_page.h | 13 ++++++++
>  xen/arch/arm/include/asm/mm.h          |  5 +++
>  xen/arch/arm/mm.c                      | 42 +++++++-------------------
>  xen/arch/arm/setup.c                   |  1 +
>  6 files changed, 32 insertions(+), 39 deletions(-)
>  create mode 100644 xen/arch/arm/include/asm/domain_page.h
> 
> diff --git a/xen/arch/arm/domain_page.c b/xen/arch/arm/domain_page.c
> index b7c02c919064..4540b3c5f24c 100644
> --- a/xen/arch/arm/domain_page.c
> +++ b/xen/arch/arm/domain_page.c
> @@ -3,6 +3,8 @@
>  #include <xen/pmap.h>
>  #include <xen/vmap.h>
>  
> +#include <asm/domain_page.h>
> +
>  /* Override macros from asm/page.h to make them work with mfn_t */
>  #undef virt_to_mfn
>  #define virt_to_mfn(va) _mfn(__virt_to_mfn(va))
> diff --git a/xen/arch/arm/include/asm/arm32/mm.h b/xen/arch/arm/include/asm/arm32/mm.h
> index 8bfc906e7178..6b039d9ceaa2 100644
> --- a/xen/arch/arm/include/asm/arm32/mm.h
> +++ b/xen/arch/arm/include/asm/arm32/mm.h
> @@ -1,12 +1,6 @@
>  #ifndef __ARM_ARM32_MM_H__
>  #define __ARM_ARM32_MM_H__
>  
> -#include <xen/percpu.h>
> -
> -#include <asm/lpae.h>
> -
> -DECLARE_PER_CPU(lpae_t *, xen_pgtable);
> -
>  /*
>   * Only a limited amount of RAM, called xenheap, is always mapped on ARM32.
>   * For convenience always return false.
> @@ -16,8 +10,6 @@ static inline bool arch_mfns_in_directmap(unsigned long mfn, unsigned long nr)
>      return false;
>  }
>  
> -bool init_domheap_mappings(unsigned int cpu);
> -
>  #endif /* __ARM_ARM32_MM_H__ */
>  
>  /*
> diff --git a/xen/arch/arm/include/asm/domain_page.h b/xen/arch/arm/include/asm/domain_page.h
> new file mode 100644
> index 000000000000..e9f52685e2ec
> --- /dev/null
> +++ b/xen/arch/arm/include/asm/domain_page.h
> @@ -0,0 +1,13 @@
> +#ifndef __ASM_ARM_DOMAIN_PAGE_H__
> +#define __ASM_ARM_DOMAIN_PAGE_H__
> +
> +#ifdef CONFIG_ARCH_MAP_DOMAIN_PAGE
> +bool init_domheap_mappings(unsigned int cpu);
> +#else
> +static inline bool init_domheap_mappings(unsigned int cpu)
> +{
> +    return true;
> +}
> +#endif
> +
> +#endif /* __ASM_ARM_DOMAIN_PAGE_H__ */
> diff --git a/xen/arch/arm/include/asm/mm.h b/xen/arch/arm/include/asm/mm.h
> index 2366928d71aa..7a2c775f9562 100644
> --- a/xen/arch/arm/include/asm/mm.h
> +++ b/xen/arch/arm/include/asm/mm.h
> @@ -2,6 +2,9 @@
>  #define __ARCH_ARM_MM__
>  
>  #include <xen/kernel.h>
> +#include <xen/percpu.h>
> +
> +#include <asm/lpae.h>
>  #include <asm/page.h>
>  #include <public/xen.h>
>  #include <xen/pdx.h>
> @@ -14,6 +17,8 @@
>  # error "unknown ARM variant"
>  #endif
>  
> +DECLARE_PER_CPU(lpae_t *, xen_pgtable);
> +
>  /* Align Xen to a 2 MiB boundary. */
>  #define XEN_PADDR_ALIGN (1 << 21)
>  
> diff --git a/xen/arch/arm/mm.c b/xen/arch/arm/mm.c
> index 4e208f7d20c8..2af751af9003 100644
> --- a/xen/arch/arm/mm.c
> +++ b/xen/arch/arm/mm.c
> @@ -24,6 +24,7 @@
>  
>  #include <xsm/xsm.h>
>  
> +#include <asm/domain_page.h>
>  #include <asm/fixmap.h>
>  #include <asm/setup.h>
>  
> @@ -90,20 +91,19 @@ DEFINE_BOOT_PAGE_TABLE(boot_third);
>   * xen_second, xen_fixmap and xen_xenmap are always shared between all
>   * PCPUs.
>   */
> +/* Per-CPU pagetable pages */
> +/* xen_pgtable == root of the trie (zeroeth level on 64-bit, first on 32-bit) */
> +DEFINE_PER_CPU(lpae_t *, xen_pgtable);
> +
> +/* Root of the trie for cpu0, other CPU's PTs are dynamically allocated */
> +static DEFINE_PAGE_TABLE(cpu0_pgtable);
> +#define THIS_CPU_PGTABLE this_cpu(xen_pgtable)
>  
>  #ifdef CONFIG_ARM_64
>  #define HYP_PT_ROOT_LEVEL 0
> -static DEFINE_PAGE_TABLE(xen_pgtable);
>  static DEFINE_PAGE_TABLE(xen_first);
> -#define THIS_CPU_PGTABLE xen_pgtable
>  #else
>  #define HYP_PT_ROOT_LEVEL 1
> -/* Per-CPU pagetable pages */
> -/* xen_pgtable == root of the trie (zeroeth level on 64-bit, first on 32-bit) */
> -DEFINE_PER_CPU(lpae_t *, xen_pgtable);
> -#define THIS_CPU_PGTABLE this_cpu(xen_pgtable)
> -/* Root of the trie for cpu0, other CPU's PTs are dynamically allocated */
> -static DEFINE_PAGE_TABLE(cpu0_pgtable);
>  #endif
>  
>  /* Common pagetable leaves */
> @@ -481,14 +481,13 @@ void __init setup_pagetables(unsigned long boot_phys_offset)
>  
>      phys_offset = boot_phys_offset;
>  
> +    p = cpu0_pgtable;
> +
>  #ifdef CONFIG_ARM_64
> -    p = (void *) xen_pgtable;
>      p[0] = pte_of_xenaddr((uintptr_t)xen_first);
>      p[0].pt.table = 1;
>      p[0].pt.xn = 0;
>      p = (void *) xen_first;
> -#else
> -    p = (void *) cpu0_pgtable;
>  #endif
>  
>      /* Map xen second level page-table */
> @@ -527,19 +526,13 @@ void __init setup_pagetables(unsigned long boot_phys_offset)
>      pte.pt.table = 1;
>      xen_second[second_table_offset(FIXMAP_ADDR(0))] = pte;
>  
> -#ifdef CONFIG_ARM_64
> -    ttbr = (uintptr_t) xen_pgtable + phys_offset;
> -#else
>      ttbr = (uintptr_t) cpu0_pgtable + phys_offset;
> -#endif
>  
>      switch_ttbr(ttbr);
>  
>      xen_pt_enforce_wnx();
>  
> -#ifdef CONFIG_ARM_32
>      per_cpu(xen_pgtable, 0) = cpu0_pgtable;
> -#endif
>  }
>  
>  static void clear_boot_pagetables(void)
> @@ -557,18 +550,6 @@ static void clear_boot_pagetables(void)
>      clear_table(boot_third);
>  }
>  
> -#ifdef CONFIG_ARM_64
> -int init_secondary_pagetables(int cpu)
> -{
> -    clear_boot_pagetables();
> -
> -    /* Set init_ttbr for this CPU coming up. All CPus share a single setof
> -     * pagetables, but rewrite it each time for consistency with 32 bit. */
> -    init_ttbr = (uintptr_t) xen_pgtable + phys_offset;
> -    clean_dcache(init_ttbr);
> -    return 0;
> -}
> -#else
>  int init_secondary_pagetables(int cpu)
>  {
>      lpae_t *root = alloc_xenheap_page();
> @@ -599,7 +580,6 @@ int init_secondary_pagetables(int cpu)
>  
>      return 0;
>  }
> -#endif
>  
>  /* MMU setup for secondary CPUS (which already have paging enabled) */
>  void mmu_init_secondary_cpu(void)
> @@ -1089,7 +1069,7 @@ static int xen_pt_update(unsigned long virt,
>      unsigned long left = nr_mfns;
>  
>      /*
> -     * For arm32, page-tables are different on each CPUs. Yet, they share
> +     * Page-tables are different on each CPU. Yet, they share
>       * some common mappings. It is assumed that only common mappings
>       * will be modified with this function.
>       *
> diff --git a/xen/arch/arm/setup.c b/xen/arch/arm/setup.c
> index 2311726f5ddd..88d9d90fb5ad 100644
> --- a/xen/arch/arm/setup.c
> +++ b/xen/arch/arm/setup.c
> @@ -39,6 +39,7 @@
>  #include <asm/gic.h>
>  #include <asm/cpuerrata.h>
>  #include <asm/cpufeature.h>
> +#include <asm/domain_page.h>
>  #include <asm/platform.h>
>  #include <asm/procinfo.h>
>  #include <asm/setup.h>
> -- 
> 2.38.1
> 

