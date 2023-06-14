Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B7CB5730329
	for <lists+xen-devel@lfdr.de>; Wed, 14 Jun 2023 17:13:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.548958.857224 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q9SBf-0000YX-Uj; Wed, 14 Jun 2023 15:13:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 548958.857224; Wed, 14 Jun 2023 15:13:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q9SBf-0000WI-Rl; Wed, 14 Jun 2023 15:13:31 +0000
Received: by outflank-mailman (input) for mailman id 548958;
 Wed, 14 Jun 2023 15:13:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=I5d0=CC=kernel.org=rppt@srs-se1.protection.inumbo.net>)
 id 1q9SBe-0000WC-Jq
 for xen-devel@lists.xenproject.org; Wed, 14 Jun 2023 15:13:30 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 041ef592-0ac6-11ee-b232-6b7b168915f2;
 Wed, 14 Jun 2023 17:13:29 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id E645264377;
 Wed, 14 Jun 2023 15:13:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 885D9C433C9;
 Wed, 14 Jun 2023 15:13:20 +0000 (UTC)
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
X-Inumbo-ID: 041ef592-0ac6-11ee-b232-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686755607;
	bh=ooRE0mc8pQQN1dMjaiJ0ZPb9SM8GwemdLsbs/3pu/eg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TTauCRLMXAYbj6DwvVWjuhRssYSwJe13c1K0NPkRhYsvxcSKWIMfQpBTkA2tGbp3z
	 wXGshvjRkgcrytc6evPpUtdgHR8HqKPrwA2eiiF0dgNsKrnmwmLzSshVKZlB1P8cTS
	 1oenGV1fb2arGY1is9AE0FxQeQghR16YOFW4XVbZjjboMrLsKjM23nvulwpmBSKL5g
	 XCIpZq4v8z2TEURhS+KKSdaFb4HvhJXDdh0Uq6ppiSEhUpLe+xv9Km5REWUDDHssXz
	 00eE0M0epXV6Kc4kORgUUReWrBkViB2MKr5QGGkLvEWV1DMa9XrwJnIr9NmfK9b/hN
	 wRs5qTVp2H96g==
Date: Wed, 14 Jun 2023 18:12:49 +0300
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
	Hugh Dickins <hughd@google.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH v4 25/34] m68k: Convert various functions to use ptdescs
Message-ID: <20230614151249.GX52412@kernel.org>
References: <20230612210423.18611-1-vishal.moola@gmail.com>
 <20230612210423.18611-26-vishal.moola@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230612210423.18611-26-vishal.moola@gmail.com>

On Mon, Jun 12, 2023 at 02:04:14PM -0700, Vishal Moola (Oracle) wrote:
> As part of the conversions to replace pgtable constructor/destructors with
> ptdesc equivalents, convert various page table functions to use ptdescs.
> 
> Some of the functions use the *get*page*() helper functions. Convert
> these to use pagetable_alloc() and ptdesc_address() instead to help
> standardize page tables further.
> 
> Signed-off-by: Vishal Moola (Oracle) <vishal.moola@gmail.com>

Acked-by: Mike Rapoport (IBM) <rppt@kernel.org>

One comment below
> ---
>  arch/m68k/include/asm/mcf_pgalloc.h  | 41 ++++++++++++++--------------
>  arch/m68k/include/asm/sun3_pgalloc.h |  8 +++---
>  arch/m68k/mm/motorola.c              |  4 +--
>  3 files changed, 27 insertions(+), 26 deletions(-)
> 
> diff --git a/arch/m68k/include/asm/mcf_pgalloc.h b/arch/m68k/include/asm/mcf_pgalloc.h
> index 5c2c0a864524..857949ac9431 100644
> --- a/arch/m68k/include/asm/mcf_pgalloc.h
> +++ b/arch/m68k/include/asm/mcf_pgalloc.h
> @@ -7,20 +7,19 @@
>  
>  extern inline void pte_free_kernel(struct mm_struct *mm, pte_t *pte)
>  {
> -	free_page((unsigned long) pte);
> +	pagetable_free(virt_to_ptdesc(pte));
>  }
>  
>  extern const char bad_pmd_string[];
>  
>  extern inline pte_t *pte_alloc_one_kernel(struct mm_struct *mm)
>  {
> -	unsigned long page = __get_free_page(GFP_DMA);
> +	struct ptdesc *ptdesc = pagetable_alloc(GFP_DMA | __GFP_ZERO, 0);
>  
> -	if (!page)
> +	if (!ptdesc)
>  		return NULL;
>  
> -	memset((void *)page, 0, PAGE_SIZE);
> -	return (pte_t *) (page);
> +	return ptdesc_address(ptdesc);
>  }
>  
>  extern inline pmd_t *pmd_alloc_kernel(pgd_t *pgd, unsigned long address)
> @@ -35,36 +34,36 @@ extern inline pmd_t *pmd_alloc_kernel(pgd_t *pgd, unsigned long address)
>  static inline void __pte_free_tlb(struct mmu_gather *tlb, pgtable_t pgtable,
>  				  unsigned long address)
>  {
> -	struct page *page = virt_to_page(pgtable);
> +	struct ptdesc *ptdesc = virt_to_ptdesc(pgtable);
>  
> -	pgtable_pte_page_dtor(page);
> -	__free_page(page);
> +	pagetable_pte_dtor(ptdesc);
> +	pagetable_free(ptdesc);
>  }
>  
>  static inline pgtable_t pte_alloc_one(struct mm_struct *mm)
>  {
> -	struct page *page = alloc_pages(GFP_DMA, 0);
> +	struct ptdesc *ptdesc = pagetable_alloc(GFP_DMA, 0);

You can add __GFP_ZERO here and drop pagetable_clear() below

>  	pte_t *pte;
>  
> -	if (!page)
> +	if (!ptdesc)
>  		return NULL;
> -	if (!pgtable_pte_page_ctor(page)) {
> -		__free_page(page);
> +	if (!pagetable_pte_ctor(ptdesc)) {
> +		pagetable_free(ptdesc);
>  		return NULL;
>  	}
>  
> -	pte = page_address(page);
> -	clear_page(pte);
> +	pte = ptdesc_address(ptdesc);
> +	pagetable_clear(pte);
>  
>  	return pte;
>  }
>  
>  static inline void pte_free(struct mm_struct *mm, pgtable_t pgtable)
>  {
> -	struct page *page = virt_to_page(pgtable);
> +	struct ptdesc *ptdesc = virt_to_ptdesc(pgtable);
>  
> -	pgtable_pte_page_dtor(page);
> -	__free_page(page);
> +	pagetable_pte_dtor(ptdesc);
> +	pagetable_free(ptdesc);
>  }
>  
>  /*
> @@ -75,16 +74,18 @@ static inline void pte_free(struct mm_struct *mm, pgtable_t pgtable)
>  
>  static inline void pgd_free(struct mm_struct *mm, pgd_t *pgd)
>  {
> -	free_page((unsigned long) pgd);
> +	pagetable_free(virt_to_ptdesc(pgd));
>  }
>  
>  static inline pgd_t *pgd_alloc(struct mm_struct *mm)
>  {
>  	pgd_t *new_pgd;
> +	struct ptdesc *ptdesc = pagetable_alloc(GFP_DMA | GFP_NOWARN, 0);
>  
> -	new_pgd = (pgd_t *)__get_free_page(GFP_DMA | __GFP_NOWARN);
> -	if (!new_pgd)
> +	if (!ptdesc)
>  		return NULL;
> +	new_pgd = ptdesc_address(ptdesc);
> +
>  	memcpy(new_pgd, swapper_pg_dir, PTRS_PER_PGD * sizeof(pgd_t));
>  	memset(new_pgd, 0, PAGE_OFFSET >> PGDIR_SHIFT);
>  	return new_pgd;
> diff --git a/arch/m68k/include/asm/sun3_pgalloc.h b/arch/m68k/include/asm/sun3_pgalloc.h
> index 198036aff519..ff48573db2c0 100644
> --- a/arch/m68k/include/asm/sun3_pgalloc.h
> +++ b/arch/m68k/include/asm/sun3_pgalloc.h
> @@ -17,10 +17,10 @@
>  
>  extern const char bad_pmd_string[];
>  
> -#define __pte_free_tlb(tlb,pte,addr)			\
> -do {							\
> -	pgtable_pte_page_dtor(pte);			\
> -	tlb_remove_page((tlb), pte);			\
> +#define __pte_free_tlb(tlb, pte, addr)				\
> +do {								\
> +	pagetable_pte_dtor(page_ptdesc(pte));			\
> +	tlb_remove_page_ptdesc((tlb), page_ptdesc(pte));	\
>  } while (0)
>  
>  static inline void pmd_populate_kernel(struct mm_struct *mm, pmd_t *pmd, pte_t *pte)
> diff --git a/arch/m68k/mm/motorola.c b/arch/m68k/mm/motorola.c
> index c75984e2d86b..594575a0780c 100644
> --- a/arch/m68k/mm/motorola.c
> +++ b/arch/m68k/mm/motorola.c
> @@ -161,7 +161,7 @@ void *get_pointer_table(int type)
>  			 * m68k doesn't have SPLIT_PTE_PTLOCKS for not having
>  			 * SMP.
>  			 */
> -			pgtable_pte_page_ctor(virt_to_page(page));
> +			pagetable_pte_ctor(virt_to_ptdesc(page));
>  		}
>  
>  		mmu_page_ctor(page);
> @@ -201,7 +201,7 @@ int free_pointer_table(void *table, int type)
>  		list_del(dp);
>  		mmu_page_dtor((void *)page);
>  		if (type == TABLE_PTE)
> -			pgtable_pte_page_dtor(virt_to_page((void *)page));
> +			pagetable_pte_dtor(virt_to_ptdesc((void *)page));
>  		free_page (page);
>  		return 1;
>  	} else if (ptable_list[type].next != dp) {
> -- 
> 2.40.1
> 
> 

-- 
Sincerely yours,
Mike.

