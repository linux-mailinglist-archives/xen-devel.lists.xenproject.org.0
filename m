Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 13B3893E51E
	for <lists+xen-devel@lfdr.de>; Sun, 28 Jul 2024 14:47:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.766116.1176650 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sY3ID-0005iy-B7; Sun, 28 Jul 2024 12:46:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 766116.1176650; Sun, 28 Jul 2024 12:46:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sY3ID-0005gV-88; Sun, 28 Jul 2024 12:46:29 +0000
Received: by outflank-mailman (input) for mailman id 766116;
 Sun, 28 Jul 2024 12:46:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=h+eR=O4=kernel.org=rppt@srs-se1.protection.inumbo.net>)
 id 1sY3IC-0005gJ-1W
 for xen-devel@lists.xenproject.org; Sun, 28 Jul 2024 12:46:28 +0000
Received: from sin.source.kernel.org (sin.source.kernel.org
 [2604:1380:40e1:4800::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6351a5db-4cdf-11ef-8776-851b0ebba9a2;
 Sun, 28 Jul 2024 14:46:21 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id C28A1CE0225;
 Sun, 28 Jul 2024 12:46:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DC8AAC116B1;
 Sun, 28 Jul 2024 12:46:08 +0000 (UTC)
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
X-Inumbo-ID: 6351a5db-4cdf-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722170777;
	bh=bPWnkShYzyS23RMpEdqVZDxd8gOdgkm8rn5MDKi64Wk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HRxaihC902l7wjlV17ey9HedBqpC8su5ukZaja6H29JbUmtNuU9hQXMTH8WAr2QzQ
	 ZzmfQGrmtefLPNZjzUUgCMMiA/ymps0JYfxTG+ry/DiXmjB0sl5qzkd/tE+ZFBvQM0
	 W9q2r80VFIdoz1ZX0OWN11lu0UBfKBlz3BW52Kqjkqo5yBlw7bQX88CwWy5XSpM0UD
	 QgFYpVz25Ad81W4Sa+NHu0U2WZeL9XZ8hXfL5xURD/H3i7GlDt5NY1YLBoYsWVgt11
	 yY/xOzl4Joi00MFX8OSm8OqUDtOeP9j6Y8wYqsbk2rgO4vBHdMxgpjMAK7QPSAgPXN
	 PnLr9yZcXV6Rw==
Date: Sun, 28 Jul 2024 15:45:53 +0300
From: Mike Rapoport <rppt@kernel.org>
To: David Hildenbrand <david@redhat.com>
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org,
	linux-arm-kernel@lists.infradead.org, x86@kernel.org,
	linuxppc-dev@lists.ozlabs.org, xen-devel@lists.xenproject.org,
	linux-fsdevel@vger.kernel.org,
	Andrew Morton <akpm@linux-foundation.org>,
	Oscar Salvador <osalvador@suse.de>, Peter Xu <peterx@redhat.com>,
	Muchun Song <muchun.song@linux.dev>,
	Russell King <linux@armlinux.org.uk>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	"Naveen N. Rao" <naveen.n.rao@linux.ibm.com>,
	Juergen Gross <jgross@suse.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Christian Brauner <brauner@kernel.org>
Subject: Re: [PATCH v1 1/3] mm: turn USE_SPLIT_PTE_PTLOCKS /
 USE_SPLIT_PTE_PTLOCKS into Kconfig options
Message-ID: <ZqY9gRujwqOGuvW1@kernel.org>
References: <20240726150728.3159964-1-david@redhat.com>
 <20240726150728.3159964-2-david@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240726150728.3159964-2-david@redhat.com>

On Fri, Jul 26, 2024 at 05:07:26PM +0200, David Hildenbrand wrote:
> Let's clean that up a bit and prepare for depending on
> CONFIG_SPLIT_PMD_PTLOCKS in other Kconfig options.
> 
> More cleanups would be reasonable (like the arch-specific "depends on"
> for CONFIG_SPLIT_PTE_PTLOCKS), but we'll leave that for another day.
> 
> Signed-off-by: David Hildenbrand <david@redhat.com>

Acked-by: Mike Rapoport (Microsoft) <rppt@kernel.org>

> ---
>  arch/arm/mm/fault-armv.c      |  6 +++---
>  arch/x86/xen/mmu_pv.c         |  7 ++++---
>  include/linux/mm.h            |  8 ++++----
>  include/linux/mm_types.h      |  2 +-
>  include/linux/mm_types_task.h |  3 ---
>  kernel/fork.c                 |  4 ++--
>  mm/Kconfig                    | 18 +++++++++++-------
>  mm/memory.c                   |  2 +-
>  8 files changed, 26 insertions(+), 24 deletions(-)
> 
> diff --git a/arch/arm/mm/fault-armv.c b/arch/arm/mm/fault-armv.c
> index 2286c2ea60ec4..831793cd6ff94 100644
> --- a/arch/arm/mm/fault-armv.c
> +++ b/arch/arm/mm/fault-armv.c
> @@ -61,7 +61,7 @@ static int do_adjust_pte(struct vm_area_struct *vma, unsigned long address,
>  	return ret;
>  }
>  
> -#if USE_SPLIT_PTE_PTLOCKS
> +#if defined(CONFIG_SPLIT_PTE_PTLOCKS)
>  /*
>   * If we are using split PTE locks, then we need to take the page
>   * lock here.  Otherwise we are using shared mm->page_table_lock
> @@ -80,10 +80,10 @@ static inline void do_pte_unlock(spinlock_t *ptl)
>  {
>  	spin_unlock(ptl);
>  }
> -#else /* !USE_SPLIT_PTE_PTLOCKS */
> +#else /* !defined(CONFIG_SPLIT_PTE_PTLOCKS) */
>  static inline void do_pte_lock(spinlock_t *ptl) {}
>  static inline void do_pte_unlock(spinlock_t *ptl) {}
> -#endif /* USE_SPLIT_PTE_PTLOCKS */
> +#endif /* defined(CONFIG_SPLIT_PTE_PTLOCKS) */
>  
>  static int adjust_pte(struct vm_area_struct *vma, unsigned long address,
>  	unsigned long pfn)
> diff --git a/arch/x86/xen/mmu_pv.c b/arch/x86/xen/mmu_pv.c
> index f1ce39d6d32cb..f4a316894bbb4 100644
> --- a/arch/x86/xen/mmu_pv.c
> +++ b/arch/x86/xen/mmu_pv.c
> @@ -665,7 +665,7 @@ static spinlock_t *xen_pte_lock(struct page *page, struct mm_struct *mm)
>  {
>  	spinlock_t *ptl = NULL;
>  
> -#if USE_SPLIT_PTE_PTLOCKS
> +#if defined(CONFIG_SPLIT_PTE_PTLOCKS)
>  	ptl = ptlock_ptr(page_ptdesc(page));
>  	spin_lock_nest_lock(ptl, &mm->page_table_lock);
>  #endif
> @@ -1553,7 +1553,8 @@ static inline void xen_alloc_ptpage(struct mm_struct *mm, unsigned long pfn,
>  
>  		__set_pfn_prot(pfn, PAGE_KERNEL_RO);
>  
> -		if (level == PT_PTE && USE_SPLIT_PTE_PTLOCKS && !pinned)
> +		if (level == PT_PTE && IS_ENABLED(CONFIG_SPLIT_PTE_PTLOCKS) &&
> +		    !pinned)
>  			__pin_pagetable_pfn(MMUEXT_PIN_L1_TABLE, pfn);
>  
>  		xen_mc_issue(XEN_LAZY_MMU);
> @@ -1581,7 +1582,7 @@ static inline void xen_release_ptpage(unsigned long pfn, unsigned level)
>  	if (pinned) {
>  		xen_mc_batch();
>  
> -		if (level == PT_PTE && USE_SPLIT_PTE_PTLOCKS)
> +		if (level == PT_PTE && IS_ENABLED(CONFIG_SPLIT_PTE_PTLOCKS))
>  			__pin_pagetable_pfn(MMUEXT_UNPIN_TABLE, pfn);
>  
>  		__set_pfn_prot(pfn, PAGE_KERNEL);
> diff --git a/include/linux/mm.h b/include/linux/mm.h
> index 0472a5090b180..dff43101572ec 100644
> --- a/include/linux/mm.h
> +++ b/include/linux/mm.h
> @@ -2843,7 +2843,7 @@ static inline void pagetable_free(struct ptdesc *pt)
>  	__free_pages(page, compound_order(page));
>  }
>  
> -#if USE_SPLIT_PTE_PTLOCKS
> +#if defined(CONFIG_SPLIT_PTE_PTLOCKS)
>  #if ALLOC_SPLIT_PTLOCKS
>  void __init ptlock_cache_init(void);
>  bool ptlock_alloc(struct ptdesc *ptdesc);
> @@ -2895,7 +2895,7 @@ static inline bool ptlock_init(struct ptdesc *ptdesc)
>  	return true;
>  }
>  
> -#else	/* !USE_SPLIT_PTE_PTLOCKS */
> +#else	/* !defined(CONFIG_SPLIT_PTE_PTLOCKS) */
>  /*
>   * We use mm->page_table_lock to guard all pagetable pages of the mm.
>   */
> @@ -2906,7 +2906,7 @@ static inline spinlock_t *pte_lockptr(struct mm_struct *mm, pte_t *pte)
>  static inline void ptlock_cache_init(void) {}
>  static inline bool ptlock_init(struct ptdesc *ptdesc) { return true; }
>  static inline void ptlock_free(struct ptdesc *ptdesc) {}
> -#endif /* USE_SPLIT_PTE_PTLOCKS */
> +#endif /* defined(CONFIG_SPLIT_PTE_PTLOCKS) */
>  
>  static inline bool pagetable_pte_ctor(struct ptdesc *ptdesc)
>  {
> @@ -2966,7 +2966,7 @@ pte_t *pte_offset_map_nolock(struct mm_struct *mm, pmd_t *pmd,
>  	((unlikely(pmd_none(*(pmd))) && __pte_alloc_kernel(pmd))? \
>  		NULL: pte_offset_kernel(pmd, address))
>  
> -#if USE_SPLIT_PMD_PTLOCKS
> +#if defined(CONFIG_SPLIT_PMD_PTLOCKS)
>  
>  static inline struct page *pmd_pgtable_page(pmd_t *pmd)
>  {
> diff --git a/include/linux/mm_types.h b/include/linux/mm_types.h
> index 4854249792545..165c58b12ccc9 100644
> --- a/include/linux/mm_types.h
> +++ b/include/linux/mm_types.h
> @@ -947,7 +947,7 @@ struct mm_struct {
>  #ifdef CONFIG_MMU_NOTIFIER
>  		struct mmu_notifier_subscriptions *notifier_subscriptions;
>  #endif
> -#if defined(CONFIG_TRANSPARENT_HUGEPAGE) && !USE_SPLIT_PMD_PTLOCKS
> +#if defined(CONFIG_TRANSPARENT_HUGEPAGE) && !defined(CONFIG_SPLIT_PMD_PTLOCKS)
>  		pgtable_t pmd_huge_pte; /* protected by page_table_lock */
>  #endif
>  #ifdef CONFIG_NUMA_BALANCING
> diff --git a/include/linux/mm_types_task.h b/include/linux/mm_types_task.h
> index a2f6179b672b8..bff5706b76e14 100644
> --- a/include/linux/mm_types_task.h
> +++ b/include/linux/mm_types_task.h
> @@ -16,9 +16,6 @@
>  #include <asm/tlbbatch.h>
>  #endif
>  
> -#define USE_SPLIT_PTE_PTLOCKS	(NR_CPUS >= CONFIG_SPLIT_PTLOCK_CPUS)
> -#define USE_SPLIT_PMD_PTLOCKS	(USE_SPLIT_PTE_PTLOCKS && \
> -		IS_ENABLED(CONFIG_ARCH_ENABLE_SPLIT_PMD_PTLOCK))
>  #define ALLOC_SPLIT_PTLOCKS	(SPINLOCK_SIZE > BITS_PER_LONG/8)
>  
>  /*
> diff --git a/kernel/fork.c b/kernel/fork.c
> index a8362c26ebcb0..216ce9ba4f4e6 100644
> --- a/kernel/fork.c
> +++ b/kernel/fork.c
> @@ -832,7 +832,7 @@ static void check_mm(struct mm_struct *mm)
>  		pr_alert("BUG: non-zero pgtables_bytes on freeing mm: %ld\n",
>  				mm_pgtables_bytes(mm));
>  
> -#if defined(CONFIG_TRANSPARENT_HUGEPAGE) && !USE_SPLIT_PMD_PTLOCKS
> +#if defined(CONFIG_TRANSPARENT_HUGEPAGE) && !defined(CONFIG_SPLIT_PMD_PTLOCKS)
>  	VM_BUG_ON_MM(mm->pmd_huge_pte, mm);
>  #endif
>  }
> @@ -1276,7 +1276,7 @@ static struct mm_struct *mm_init(struct mm_struct *mm, struct task_struct *p,
>  	RCU_INIT_POINTER(mm->exe_file, NULL);
>  	mmu_notifier_subscriptions_init(mm);
>  	init_tlb_flush_pending(mm);
> -#if defined(CONFIG_TRANSPARENT_HUGEPAGE) && !USE_SPLIT_PMD_PTLOCKS
> +#if defined(CONFIG_TRANSPARENT_HUGEPAGE) && !defined(CONFIG_SPLIT_PMD_PTLOCKS)
>  	mm->pmd_huge_pte = NULL;
>  #endif
>  	mm_init_uprobes_state(mm);
> diff --git a/mm/Kconfig b/mm/Kconfig
> index b72e7d040f789..7b716ac802726 100644
> --- a/mm/Kconfig
> +++ b/mm/Kconfig
> @@ -585,17 +585,21 @@ config ARCH_MHP_MEMMAP_ON_MEMORY_ENABLE
>  # at the same time (e.g. copy_page_range()).
>  # DEBUG_SPINLOCK and DEBUG_LOCK_ALLOC spinlock_t also enlarge struct page.
>  #
> -config SPLIT_PTLOCK_CPUS
> -	int
> -	default "999999" if !MMU
> -	default "999999" if ARM && !CPU_CACHE_VIPT
> -	default "999999" if PARISC && !PA20
> -	default "999999" if SPARC32
> -	default "4"
> +config SPLIT_PTE_PTLOCKS
> +	def_bool y
> +	depends on MMU
> +	depends on NR_CPUS >= 4
> +	depends on !ARM || CPU_CACHE_VIPT
> +	depends on !PARISC || PA20
> +	depends on !SPARC32
>  
>  config ARCH_ENABLE_SPLIT_PMD_PTLOCK
>  	bool
>  
> +config SPLIT_PMD_PTLOCKS
> +	def_bool y
> +	depends on SPLIT_PTE_PTLOCKS && ARCH_ENABLE_SPLIT_PMD_PTLOCK
> +
>  #
>  # support for memory balloon
>  config MEMORY_BALLOON
> diff --git a/mm/memory.c b/mm/memory.c
> index 833d2cad6eb29..714589582fe15 100644
> --- a/mm/memory.c
> +++ b/mm/memory.c
> @@ -6559,7 +6559,7 @@ long copy_folio_from_user(struct folio *dst_folio,
>  }
>  #endif /* CONFIG_TRANSPARENT_HUGEPAGE || CONFIG_HUGETLBFS */
>  
> -#if USE_SPLIT_PTE_PTLOCKS && ALLOC_SPLIT_PTLOCKS
> +#if defined(CONFIG_SPLIT_PTE_PTLOCKS) && ALLOC_SPLIT_PTLOCKS
>  
>  static struct kmem_cache *page_ptl_cachep;
>  
> -- 
> 2.45.2
> 
> 

-- 
Sincerely yours,
Mike.

