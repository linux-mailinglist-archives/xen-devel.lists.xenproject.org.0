Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A69D730070
	for <lists+xen-devel@lfdr.de>; Wed, 14 Jun 2023 15:49:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.548800.856945 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q9Qri-0001JL-7d; Wed, 14 Jun 2023 13:48:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 548800.856945; Wed, 14 Jun 2023 13:48:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q9Qri-0001Gk-4S; Wed, 14 Jun 2023 13:48:50 +0000
Received: by outflank-mailman (input) for mailman id 548800;
 Wed, 14 Jun 2023 13:48:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=I5d0=CC=kernel.org=rppt@srs-se1.protection.inumbo.net>)
 id 1q9Qrg-0001Ge-TE
 for xen-devel@lists.xenproject.org; Wed, 14 Jun 2023 13:48:48 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2e83dd5c-0aba-11ee-8611-37d641c3527e;
 Wed, 14 Jun 2023 15:48:46 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 14F9D64263;
 Wed, 14 Jun 2023 13:48:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9B707C433C0;
 Wed, 14 Jun 2023 13:48:38 +0000 (UTC)
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
X-Inumbo-ID: 2e83dd5c-0aba-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686750524;
	bh=gxU3ouGWBBmqmAiLv/xnL0DeuSWekXdjsP3njBIM/3U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=V0QZDgjJL3QgE9x8JUspdTbfMfs3pMGIVLLZECZJRsEFY8NLOU3FHa9eCro1DbTQG
	 /FeNyJHOZk4eWdOp9Qm7YkJcLLJo0ck5GXNz5h3cPjiltj6wJSpNYi/mUUybLAseJG
	 L8jXEpIhrSeK1arYk58jkb8ZY9oXqo8PxB0L2CeXKQzmY6lKQeLK4aPo3LbQYz+RlD
	 4VPsZDkobDvZkcDjfmrkEBjkp93jW2mXHfVUlKBD7ewu+WoTI6jTDRezExZmibSP75
	 rhMOAusVyZKPnHJ6/AZh/X/iBtHCxp2v/1z1wxzagOqeVMLIVnG7qjazCHaREz+Nj1
	 kDrhr4zp2JnYA==
Date: Wed, 14 Jun 2023 16:48:08 +0300
From: Mike Rapoport <rppt@kernel.org>
To: "Vishal Moola (Oracle)" <vishal.moola@gmail.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Matthew Wilcox <willy@infradead.org>, linux-mm@kvack.org,
	linux-arch@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-csky@vger.kernel.org, linux-hexagon@vger.kernel.org,
	loongarch@lists.linux.dev, linux-m68k@lists.linux-m68k.org,
	linux-mips@vger.kernel.org, linux-openrisc@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org, linux-sh@vger.kernel.org,
	sparclinux@vger.kernel.org, linux-um@lists.infradead.org,
	xen-devel@lists.xenproject.org, kvm@vger.kernel.org,
	Hugh Dickins <hughd@google.com>
Subject: Re: [PATCH v4 05/34] mm: add utility functions for ptdesc
Message-ID: <20230614134808.GD52412@kernel.org>
References: <20230612210423.18611-1-vishal.moola@gmail.com>
 <20230612210423.18611-6-vishal.moola@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230612210423.18611-6-vishal.moola@gmail.com>

On Mon, Jun 12, 2023 at 02:03:54PM -0700, Vishal Moola (Oracle) wrote:
> Introduce utility functions setting the foundation for ptdescs. These
> will also assist in the splitting out of ptdesc from struct page.
> 
> Functions that focus on the descriptor are prefixed with ptdesc_* while
> functions that focus on the pagetable are prefixed with pagetable_*.
> 
> pagetable_alloc() is defined to allocate new ptdesc pages as compound
> pages. This is to standardize ptdescs by allowing for one allocation
> and one free function, in contrast to 2 allocation and 2 free functions.
> 
> Signed-off-by: Vishal Moola (Oracle) <vishal.moola@gmail.com>
> ---
>  include/asm-generic/tlb.h | 11 +++++++
>  include/linux/mm.h        | 61 +++++++++++++++++++++++++++++++++++++++
>  include/linux/pgtable.h   | 12 ++++++++
>  3 files changed, 84 insertions(+)
> 
> diff --git a/include/asm-generic/tlb.h b/include/asm-generic/tlb.h
> index b46617207c93..6bade9e0e799 100644
> --- a/include/asm-generic/tlb.h
> +++ b/include/asm-generic/tlb.h
> @@ -481,6 +481,17 @@ static inline void tlb_remove_page(struct mmu_gather *tlb, struct page *page)
>  	return tlb_remove_page_size(tlb, page, PAGE_SIZE);
>  }
>  
> +static inline void tlb_remove_ptdesc(struct mmu_gather *tlb, void *pt)
> +{
> +	tlb_remove_table(tlb, pt);
> +}
> +
> +/* Like tlb_remove_ptdesc, but for page-like page directories. */
> +static inline void tlb_remove_page_ptdesc(struct mmu_gather *tlb, struct ptdesc *pt)
> +{
> +	tlb_remove_page(tlb, ptdesc_page(pt));
> +}
> +
>  static inline void tlb_change_page_size(struct mmu_gather *tlb,
>  						     unsigned int page_size)
>  {
> diff --git a/include/linux/mm.h b/include/linux/mm.h
> index 0db09639dd2d..f184f1eba85d 100644
> --- a/include/linux/mm.h
> +++ b/include/linux/mm.h
> @@ -2766,6 +2766,62 @@ static inline pmd_t *pmd_alloc(struct mm_struct *mm, pud_t *pud, unsigned long a
>  }
>  #endif /* CONFIG_MMU */
>  
> +static inline struct ptdesc *virt_to_ptdesc(const void *x)
> +{
> +	return page_ptdesc(virt_to_page(x));
> +}
> +
> +static inline void *ptdesc_to_virt(const struct ptdesc *pt)
> +{
> +	return page_to_virt(ptdesc_page(pt));
> +}
> +
> +static inline void *ptdesc_address(const struct ptdesc *pt)
> +{
> +	return folio_address(ptdesc_folio(pt));
> +}
> +
> +static inline bool pagetable_is_reserved(struct ptdesc *pt)
> +{
> +	return folio_test_reserved(ptdesc_folio(pt));
> +}
> +
> +/**
> + * pagetable_alloc - Allocate pagetables
> + * @gfp:    GFP flags
> + * @order:  desired pagetable order
> + *
> + * pagetable_alloc allocates a page table descriptor as well as all pages
> + * described by it.

I think the order should be switched here to emphasize that primarily this
method allocates memory for page tables. How about

 pagetable_alloc allocates memory for the page tables as well as a page
 table descriptor that describes the allocated memory

> + *
> + * Return: The ptdesc describing the allocated page tables.
> + */
> +static inline struct ptdesc *pagetable_alloc(gfp_t gfp, unsigned int order)
> +{
> +	struct page *page = alloc_pages(gfp | __GFP_COMP, order);
> +
> +	return page_ptdesc(page);
> +}
> +
> +/**
> + * pagetable_free - Free pagetables
> + * @pt:	The page table descriptor
> + *
> + * pagetable_free frees a page table descriptor as well as all page
> + * tables described by said ptdesc.

Similarly here.

> + */
> +static inline void pagetable_free(struct ptdesc *pt)
> +{
> +	struct page *page = ptdesc_page(pt);
> +
> +	__free_pages(page, compound_order(page));
> +}
> +
> +static inline void pagetable_clear(void *x)
> +{
> +	clear_page(x);
> +}
> +
>  #if USE_SPLIT_PTE_PTLOCKS
>  #if ALLOC_SPLIT_PTLOCKS
>  void __init ptlock_cache_init(void);
> @@ -2992,6 +3048,11 @@ static inline void mark_page_reserved(struct page *page)
>  	adjust_managed_page_count(page, -1);
>  }
>  
> +static inline void free_reserved_ptdesc(struct ptdesc *pt)
> +{
> +	free_reserved_page(ptdesc_page(pt));
> +}
> +
>  /*
>   * Default method to free all the __init memory into the buddy system.
>   * The freed pages will be poisoned with pattern "poison" if it's within
> diff --git a/include/linux/pgtable.h b/include/linux/pgtable.h
> index 330de96ebfd6..c405f74d3875 100644
> --- a/include/linux/pgtable.h
> +++ b/include/linux/pgtable.h
> @@ -1026,6 +1026,18 @@ TABLE_MATCH(ptl, ptl);
>  #undef TABLE_MATCH
>  static_assert(sizeof(struct ptdesc) <= sizeof(struct page));
>  
> +#define ptdesc_page(pt)			(_Generic((pt),			\
> +	const struct ptdesc *:		(const struct page *)(pt),	\
> +	struct ptdesc *:		(struct page *)(pt)))
> +
> +#define ptdesc_folio(pt)		(_Generic((pt),			\
> +	const struct ptdesc *:		(const struct folio *)(pt),	\
> +	struct ptdesc *:		(struct folio *)(pt)))
> +
> +#define page_ptdesc(p)			(_Generic((p),			\
> +	const struct page *:		(const struct ptdesc *)(p),	\
> +	struct page *:			(struct ptdesc *)(p)))
> +
>  /*
>   * No-op macros that just return the current protection value. Defined here
>   * because these macros can be used even if CONFIG_MMU is not defined.
> -- 
> 2.40.1
> 
> 

-- 
Sincerely yours,
Mike.

