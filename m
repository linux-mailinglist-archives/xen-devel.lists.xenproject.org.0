Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2324E93EF2F
	for <lists+xen-devel@lfdr.de>; Mon, 29 Jul 2024 09:57:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.766342.1176832 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sYLFk-0007AJ-Lh; Mon, 29 Jul 2024 07:57:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 766342.1176832; Mon, 29 Jul 2024 07:57:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sYLFk-00077U-It; Mon, 29 Jul 2024 07:57:08 +0000
Received: by outflank-mailman (input) for mailman id 766342;
 Mon, 29 Jul 2024 07:57:07 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=EQyq=O5=bytedance.com=zhengqi.arch@srs-se1.protection.inumbo.net>)
 id 1sYLFj-00077O-D1
 for xen-devel@lists.xenproject.org; Mon, 29 Jul 2024 07:57:07 +0000
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com
 [2607:f8b0:4864:20::432])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 23ff8aba-4d80-11ef-8776-851b0ebba9a2;
 Mon, 29 Jul 2024 09:57:03 +0200 (CEST)
Received: by mail-pf1-x432.google.com with SMTP id
 d2e1a72fcca58-70d39a836ccso71982b3a.0
 for <xen-devel@lists.xenproject.org>; Mon, 29 Jul 2024 00:57:03 -0700 (PDT)
Received: from [10.255.168.175] ([139.177.225.232])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-70ead72b7easm6309789b3a.89.2024.07.29.00.56.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 29 Jul 2024 00:57:01 -0700 (PDT)
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
X-Inumbo-ID: 23ff8aba-4d80-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1722239822; x=1722844622; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=c3wfki45IHznha7QobB3MdtHXTqchjTEez4Ly6yQ4WE=;
        b=BFT8Vl0To7vEZwRIr8Th1CPwQzv7P5O7kI702Jd3dEeIYPXFL7JedeA33wmiRfh1w4
         PXQDHL3d4jMqVjbcPyDUlpFi3fT+rOrm/uzWTazbADGKeXfbqDALSuVDkhj0Kn4WMcsJ
         f/i/YSFaUEnXGHjq/RMyF/DPF/9loP8gSnSzDQwLnkqXRaWaNhWuZ5AeIxn91Q3zwkuV
         wgYijB7+l75v9yQVSuMB70gh2h7/kuu6uhzxKtmj5vbtLc+fbN61nNEPBroeeuzguk6X
         fd4hxez/yq3VXrbhSpeoYSzTqW4iiyOKw08R55uQ9cuBtCrHl2MhHNibkYoS5W6skCMj
         Wzew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722239822; x=1722844622;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=c3wfki45IHznha7QobB3MdtHXTqchjTEez4Ly6yQ4WE=;
        b=O78XAG696+vSQHGY89qzOZNyB5ZcvbZWG8p4lhWn5CnUVfZKGrYyB48OnTzkx2D3s5
         LBNQdZoIXqENvmyVRgT3FiGxAGGb6GFs3Qa+lE3nlq3NZFuKYyaZk8BP6RJVzu8GI8ei
         fy3LY7q8pBm9np3BYQv+f3T2NN1HPqzMLfi7CMFugVdtNIxJNRJzSLpf7scSS58XhKE9
         LXk+CCxvFNE8tEo9hCm1wy6xJAQqr5FTptwo5DhexOVCl3VIR2J7BF0FENjv4Gy3aNud
         i5Q+QEfM02fwXDQYVc3A6qBJQPW201YhvYOHaEIbLGHBKlyYPRPvRB2dgqZel4XcGeeo
         Vyog==
X-Forwarded-Encrypted: i=1; AJvYcCWmk+7S1S51Zcz5CqG7lilIP4DMgnZYEyRniXnAgElHv5L4RmwLSOqFXePY9slBACsoiXnyzG+f/54=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzGjq308JGlMsYrCqYvZIpkZ1E6D7uJIe85ZGJJmT3zbNt1BO8n
	ZRMpqSHHojGfhVZ/YDFmv0Dbz/0ZkXVVgiPv806oLOdQ9wyFWgImZ0PR2A+FT8k=
X-Google-Smtp-Source: AGHT+IGe0lJSXq0Vh5OHsO4Tqomt8qIJFlqbE1F0RWa3l62BQCbxWuuvCVwPlATb9n6C8GSnyp3sLQ==
X-Received: by 2002:a05:6a00:6f4f:b0:70d:25f1:c086 with SMTP id d2e1a72fcca58-70eac7f5ff3mr8578118b3a.0.1722239821921;
        Mon, 29 Jul 2024 00:57:01 -0700 (PDT)
Message-ID: <fe50cde6-dc9f-49b0-9a9a-0d07fb643617@bytedance.com>
Date: Mon, 29 Jul 2024 15:56:50 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/3] mm: turn USE_SPLIT_PTE_PTLOCKS /
 USE_SPLIT_PTE_PTLOCKS into Kconfig options
Content-Language: en-US
To: David Hildenbrand <david@redhat.com>
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 linux-arm-kernel@lists.infradead.org, x86@kernel.org,
 linuxppc-dev@lists.ozlabs.org, xen-devel@lists.xenproject.org,
 linux-fsdevel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 Oscar Salvador <osalvador@suse.de>, Peter Xu <peterx@redhat.com>,
 Muchun Song <muchun.song@linux.dev>, Russell King <linux@armlinux.org.uk>,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, Juergen Gross
 <jgross@suse.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 "H. Peter Anvin" <hpa@zytor.com>, Alexander Viro <viro@zeniv.linux.org.uk>,
 Christian Brauner <brauner@kernel.org>
References: <20240726150728.3159964-1-david@redhat.com>
 <20240726150728.3159964-2-david@redhat.com>
From: Qi Zheng <zhengqi.arch@bytedance.com>
In-Reply-To: <20240726150728.3159964-2-david@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 2024/7/26 23:07, David Hildenbrand wrote:
> Let's clean that up a bit and prepare for depending on
> CONFIG_SPLIT_PMD_PTLOCKS in other Kconfig options.
> 
> More cleanups would be reasonable (like the arch-specific "depends on"
> for CONFIG_SPLIT_PTE_PTLOCKS), but we'll leave that for another day.
> 
> Signed-off-by: David Hildenbrand <david@redhat.com>
> ---
>   arch/arm/mm/fault-armv.c      |  6 +++---
>   arch/x86/xen/mmu_pv.c         |  7 ++++---
>   include/linux/mm.h            |  8 ++++----
>   include/linux/mm_types.h      |  2 +-
>   include/linux/mm_types_task.h |  3 ---
>   kernel/fork.c                 |  4 ++--
>   mm/Kconfig                    | 18 +++++++++++-------
>   mm/memory.c                   |  2 +-
>   8 files changed, 26 insertions(+), 24 deletions(-)

That's great. Thanks!

Reviewed-by: Qi Zheng <zhengqi.arch@bytedance.com>

> 
> diff --git a/arch/arm/mm/fault-armv.c b/arch/arm/mm/fault-armv.c
> index 2286c2ea60ec4..831793cd6ff94 100644
> --- a/arch/arm/mm/fault-armv.c
> +++ b/arch/arm/mm/fault-armv.c
> @@ -61,7 +61,7 @@ static int do_adjust_pte(struct vm_area_struct *vma, unsigned long address,
>   	return ret;
>   }
>   
> -#if USE_SPLIT_PTE_PTLOCKS
> +#if defined(CONFIG_SPLIT_PTE_PTLOCKS)
>   /*
>    * If we are using split PTE locks, then we need to take the page
>    * lock here.  Otherwise we are using shared mm->page_table_lock
> @@ -80,10 +80,10 @@ static inline void do_pte_unlock(spinlock_t *ptl)
>   {
>   	spin_unlock(ptl);
>   }
> -#else /* !USE_SPLIT_PTE_PTLOCKS */
> +#else /* !defined(CONFIG_SPLIT_PTE_PTLOCKS) */
>   static inline void do_pte_lock(spinlock_t *ptl) {}
>   static inline void do_pte_unlock(spinlock_t *ptl) {}
> -#endif /* USE_SPLIT_PTE_PTLOCKS */
> +#endif /* defined(CONFIG_SPLIT_PTE_PTLOCKS) */
>   
>   static int adjust_pte(struct vm_area_struct *vma, unsigned long address,
>   	unsigned long pfn)
> diff --git a/arch/x86/xen/mmu_pv.c b/arch/x86/xen/mmu_pv.c
> index f1ce39d6d32cb..f4a316894bbb4 100644
> --- a/arch/x86/xen/mmu_pv.c
> +++ b/arch/x86/xen/mmu_pv.c
> @@ -665,7 +665,7 @@ static spinlock_t *xen_pte_lock(struct page *page, struct mm_struct *mm)
>   {
>   	spinlock_t *ptl = NULL;
>   
> -#if USE_SPLIT_PTE_PTLOCKS
> +#if defined(CONFIG_SPLIT_PTE_PTLOCKS)
>   	ptl = ptlock_ptr(page_ptdesc(page));
>   	spin_lock_nest_lock(ptl, &mm->page_table_lock);
>   #endif
> @@ -1553,7 +1553,8 @@ static inline void xen_alloc_ptpage(struct mm_struct *mm, unsigned long pfn,
>   
>   		__set_pfn_prot(pfn, PAGE_KERNEL_RO);
>   
> -		if (level == PT_PTE && USE_SPLIT_PTE_PTLOCKS && !pinned)
> +		if (level == PT_PTE && IS_ENABLED(CONFIG_SPLIT_PTE_PTLOCKS) &&
> +		    !pinned)
>   			__pin_pagetable_pfn(MMUEXT_PIN_L1_TABLE, pfn);
>   
>   		xen_mc_issue(XEN_LAZY_MMU);
> @@ -1581,7 +1582,7 @@ static inline void xen_release_ptpage(unsigned long pfn, unsigned level)
>   	if (pinned) {
>   		xen_mc_batch();
>   
> -		if (level == PT_PTE && USE_SPLIT_PTE_PTLOCKS)
> +		if (level == PT_PTE && IS_ENABLED(CONFIG_SPLIT_PTE_PTLOCKS))
>   			__pin_pagetable_pfn(MMUEXT_UNPIN_TABLE, pfn);
>   
>   		__set_pfn_prot(pfn, PAGE_KERNEL);
> diff --git a/include/linux/mm.h b/include/linux/mm.h
> index 0472a5090b180..dff43101572ec 100644
> --- a/include/linux/mm.h
> +++ b/include/linux/mm.h
> @@ -2843,7 +2843,7 @@ static inline void pagetable_free(struct ptdesc *pt)
>   	__free_pages(page, compound_order(page));
>   }
>   
> -#if USE_SPLIT_PTE_PTLOCKS
> +#if defined(CONFIG_SPLIT_PTE_PTLOCKS)
>   #if ALLOC_SPLIT_PTLOCKS
>   void __init ptlock_cache_init(void);
>   bool ptlock_alloc(struct ptdesc *ptdesc);
> @@ -2895,7 +2895,7 @@ static inline bool ptlock_init(struct ptdesc *ptdesc)
>   	return true;
>   }
>   
> -#else	/* !USE_SPLIT_PTE_PTLOCKS */
> +#else	/* !defined(CONFIG_SPLIT_PTE_PTLOCKS) */
>   /*
>    * We use mm->page_table_lock to guard all pagetable pages of the mm.
>    */
> @@ -2906,7 +2906,7 @@ static inline spinlock_t *pte_lockptr(struct mm_struct *mm, pte_t *pte)
>   static inline void ptlock_cache_init(void) {}
>   static inline bool ptlock_init(struct ptdesc *ptdesc) { return true; }
>   static inline void ptlock_free(struct ptdesc *ptdesc) {}
> -#endif /* USE_SPLIT_PTE_PTLOCKS */
> +#endif /* defined(CONFIG_SPLIT_PTE_PTLOCKS) */
>   
>   static inline bool pagetable_pte_ctor(struct ptdesc *ptdesc)
>   {
> @@ -2966,7 +2966,7 @@ pte_t *pte_offset_map_nolock(struct mm_struct *mm, pmd_t *pmd,
>   	((unlikely(pmd_none(*(pmd))) && __pte_alloc_kernel(pmd))? \
>   		NULL: pte_offset_kernel(pmd, address))
>   
> -#if USE_SPLIT_PMD_PTLOCKS
> +#if defined(CONFIG_SPLIT_PMD_PTLOCKS)
>   
>   static inline struct page *pmd_pgtable_page(pmd_t *pmd)
>   {
> diff --git a/include/linux/mm_types.h b/include/linux/mm_types.h
> index 4854249792545..165c58b12ccc9 100644
> --- a/include/linux/mm_types.h
> +++ b/include/linux/mm_types.h
> @@ -947,7 +947,7 @@ struct mm_struct {
>   #ifdef CONFIG_MMU_NOTIFIER
>   		struct mmu_notifier_subscriptions *notifier_subscriptions;
>   #endif
> -#if defined(CONFIG_TRANSPARENT_HUGEPAGE) && !USE_SPLIT_PMD_PTLOCKS
> +#if defined(CONFIG_TRANSPARENT_HUGEPAGE) && !defined(CONFIG_SPLIT_PMD_PTLOCKS)
>   		pgtable_t pmd_huge_pte; /* protected by page_table_lock */
>   #endif
>   #ifdef CONFIG_NUMA_BALANCING
> diff --git a/include/linux/mm_types_task.h b/include/linux/mm_types_task.h
> index a2f6179b672b8..bff5706b76e14 100644
> --- a/include/linux/mm_types_task.h
> +++ b/include/linux/mm_types_task.h
> @@ -16,9 +16,6 @@
>   #include <asm/tlbbatch.h>
>   #endif
>   
> -#define USE_SPLIT_PTE_PTLOCKS	(NR_CPUS >= CONFIG_SPLIT_PTLOCK_CPUS)
> -#define USE_SPLIT_PMD_PTLOCKS	(USE_SPLIT_PTE_PTLOCKS && \
> -		IS_ENABLED(CONFIG_ARCH_ENABLE_SPLIT_PMD_PTLOCK))
>   #define ALLOC_SPLIT_PTLOCKS	(SPINLOCK_SIZE > BITS_PER_LONG/8)
>   
>   /*
> diff --git a/kernel/fork.c b/kernel/fork.c
> index a8362c26ebcb0..216ce9ba4f4e6 100644
> --- a/kernel/fork.c
> +++ b/kernel/fork.c
> @@ -832,7 +832,7 @@ static void check_mm(struct mm_struct *mm)
>   		pr_alert("BUG: non-zero pgtables_bytes on freeing mm: %ld\n",
>   				mm_pgtables_bytes(mm));
>   
> -#if defined(CONFIG_TRANSPARENT_HUGEPAGE) && !USE_SPLIT_PMD_PTLOCKS
> +#if defined(CONFIG_TRANSPARENT_HUGEPAGE) && !defined(CONFIG_SPLIT_PMD_PTLOCKS)
>   	VM_BUG_ON_MM(mm->pmd_huge_pte, mm);
>   #endif
>   }
> @@ -1276,7 +1276,7 @@ static struct mm_struct *mm_init(struct mm_struct *mm, struct task_struct *p,
>   	RCU_INIT_POINTER(mm->exe_file, NULL);
>   	mmu_notifier_subscriptions_init(mm);
>   	init_tlb_flush_pending(mm);
> -#if defined(CONFIG_TRANSPARENT_HUGEPAGE) && !USE_SPLIT_PMD_PTLOCKS
> +#if defined(CONFIG_TRANSPARENT_HUGEPAGE) && !defined(CONFIG_SPLIT_PMD_PTLOCKS)
>   	mm->pmd_huge_pte = NULL;
>   #endif
>   	mm_init_uprobes_state(mm);
> diff --git a/mm/Kconfig b/mm/Kconfig
> index b72e7d040f789..7b716ac802726 100644
> --- a/mm/Kconfig
> +++ b/mm/Kconfig
> @@ -585,17 +585,21 @@ config ARCH_MHP_MEMMAP_ON_MEMORY_ENABLE
>   # at the same time (e.g. copy_page_range()).
>   # DEBUG_SPINLOCK and DEBUG_LOCK_ALLOC spinlock_t also enlarge struct page.
>   #
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
>   config ARCH_ENABLE_SPLIT_PMD_PTLOCK
>   	bool
>   
> +config SPLIT_PMD_PTLOCKS
> +	def_bool y
> +	depends on SPLIT_PTE_PTLOCKS && ARCH_ENABLE_SPLIT_PMD_PTLOCK
> +
>   #
>   # support for memory balloon
>   config MEMORY_BALLOON
> diff --git a/mm/memory.c b/mm/memory.c
> index 833d2cad6eb29..714589582fe15 100644
> --- a/mm/memory.c
> +++ b/mm/memory.c
> @@ -6559,7 +6559,7 @@ long copy_folio_from_user(struct folio *dst_folio,
>   }
>   #endif /* CONFIG_TRANSPARENT_HUGEPAGE || CONFIG_HUGETLBFS */
>   
> -#if USE_SPLIT_PTE_PTLOCKS && ALLOC_SPLIT_PTLOCKS
> +#if defined(CONFIG_SPLIT_PTE_PTLOCKS) && ALLOC_SPLIT_PTLOCKS
>   
>   static struct kmem_cache *page_ptl_cachep;
>   

