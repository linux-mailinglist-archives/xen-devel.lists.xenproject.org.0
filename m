Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 694FA730348
	for <lists+xen-devel@lfdr.de>; Wed, 14 Jun 2023 17:17:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.548965.857235 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q9SF4-0001EQ-HQ; Wed, 14 Jun 2023 15:17:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 548965.857235; Wed, 14 Jun 2023 15:17:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q9SF4-0001Bl-E6; Wed, 14 Jun 2023 15:17:02 +0000
Received: by outflank-mailman (input) for mailman id 548965;
 Wed, 14 Jun 2023 15:17:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=I5d0=CC=kernel.org=rppt@srs-se1.protection.inumbo.net>)
 id 1q9SF2-0001Bf-IA
 for xen-devel@lists.xenproject.org; Wed, 14 Jun 2023 15:17:00 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 81652f1b-0ac6-11ee-b232-6b7b168915f2;
 Wed, 14 Jun 2023 17:16:59 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 4C48063E20;
 Wed, 14 Jun 2023 15:16:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5C0C6C433C8;
 Wed, 14 Jun 2023 15:16:50 +0000 (UTC)
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
X-Inumbo-ID: 81652f1b-0ac6-11ee-b232-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686755817;
	bh=YWehRl3xWKEbQP9tq7ePmQYYbNy3P9MQRqza8pSXoQc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=a5HfETjkviYZmB3yycxaStNQCcDjQ92r6U1dHXLCQYNXXuG0AAUSq7jKrB+2l21WE
	 GypEoOApF1rLNsDZqptGPcxmCr0wOSIRfpVC7vWwoWHblSH2+PhDM7ZW5oWZFVA9ML
	 0FHsMp89h7dErkEWSqM9r5MLgxZuAZm5NLE0GbwBvKGpFqgzoxM2AhuVGiRnrVxHpJ
	 +MEb2WN6DRbMDDPEuOzeya9BK86TjWF0eG9IOlempn4j36CfKy0Jiz99cVNmFKgRnt
	 JUCMMz1gmGbQUt/P8bZ99XYy/Rxm4p9/4bFRzL62I+G/NVscu1YUh+MWxgzqPj29/v
	 2pSk7JFRzXlsw==
Date: Wed, 14 Jun 2023 18:16:19 +0300
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
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Subject: Re: [PATCH v4 26/34] mips: Convert various functions to use ptdescs
Message-ID: <20230614151619.GY52412@kernel.org>
References: <20230612210423.18611-1-vishal.moola@gmail.com>
 <20230612210423.18611-27-vishal.moola@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230612210423.18611-27-vishal.moola@gmail.com>

On Mon, Jun 12, 2023 at 02:04:15PM -0700, Vishal Moola (Oracle) wrote:
> As part of the conversions to replace pgtable constructor/destructors with
> ptdesc equivalents, convert various page table functions to use ptdescs.
> 
> Some of the functions use the *get*page*() helper functions. Convert
> these to use pagetable_alloc() and ptdesc_address() instead to help
> standardize page tables further.
> 
> Signed-off-by: Vishal Moola (Oracle) <vishal.moola@gmail.com>

Acked-by: Mike Rapoport (IBM) <rppt@kernel.org>

> ---
>  arch/mips/include/asm/pgalloc.h | 31 +++++++++++++++++--------------
>  arch/mips/mm/pgtable.c          |  7 ++++---
>  2 files changed, 21 insertions(+), 17 deletions(-)
> 
> diff --git a/arch/mips/include/asm/pgalloc.h b/arch/mips/include/asm/pgalloc.h
> index f72e737dda21..6940e5536664 100644
> --- a/arch/mips/include/asm/pgalloc.h
> +++ b/arch/mips/include/asm/pgalloc.h
> @@ -51,13 +51,13 @@ extern pgd_t *pgd_alloc(struct mm_struct *mm);
>  
>  static inline void pgd_free(struct mm_struct *mm, pgd_t *pgd)
>  {
> -	free_pages((unsigned long)pgd, PGD_TABLE_ORDER);
> +	pagetable_free(virt_to_ptdesc(pgd));
>  }
>  
> -#define __pte_free_tlb(tlb,pte,address)			\
> -do {							\
> -	pgtable_pte_page_dtor(pte);			\
> -	tlb_remove_page((tlb), pte);			\
> +#define __pte_free_tlb(tlb, pte, address)			\
> +do {								\
> +	pagetable_pte_dtor(page_ptdesc(pte));			\
> +	tlb_remove_page_ptdesc((tlb), page_ptdesc(pte));	\
>  } while (0)
>  
>  #ifndef __PAGETABLE_PMD_FOLDED
> @@ -65,18 +65,18 @@ do {							\
>  static inline pmd_t *pmd_alloc_one(struct mm_struct *mm, unsigned long address)
>  {
>  	pmd_t *pmd;
> -	struct page *pg;
> +	struct ptdesc *ptdesc;
>  
> -	pg = alloc_pages(GFP_KERNEL_ACCOUNT, PMD_TABLE_ORDER);
> -	if (!pg)
> +	ptdesc = pagetable_alloc(GFP_KERNEL_ACCOUNT, PMD_TABLE_ORDER);
> +	if (!ptdesc)
>  		return NULL;
>  
> -	if (!pgtable_pmd_page_ctor(pg)) {
> -		__free_pages(pg, PMD_TABLE_ORDER);
> +	if (!pagetable_pmd_ctor(ptdesc)) {
> +		pagetable_free(ptdesc);
>  		return NULL;
>  	}
>  
> -	pmd = (pmd_t *)page_address(pg);
> +	pmd = ptdesc_address(ptdesc);
>  	pmd_init(pmd);
>  	return pmd;
>  }
> @@ -90,10 +90,13 @@ static inline pmd_t *pmd_alloc_one(struct mm_struct *mm, unsigned long address)
>  static inline pud_t *pud_alloc_one(struct mm_struct *mm, unsigned long address)
>  {
>  	pud_t *pud;
> +	struct ptdesc *ptdesc = pagetable_alloc(GFP_KERNEL, PUD_TABLE_ORDER);
>  
> -	pud = (pud_t *) __get_free_pages(GFP_KERNEL, PUD_TABLE_ORDER);
> -	if (pud)
> -		pud_init(pud);
> +	if (!ptdesc)
> +		return NULL;
> +	pud = ptdesc_address(ptdesc);
> +
> +	pud_init(pud);
>  	return pud;
>  }
>  
> diff --git a/arch/mips/mm/pgtable.c b/arch/mips/mm/pgtable.c
> index b13314be5d0e..729258ff4e3b 100644
> --- a/arch/mips/mm/pgtable.c
> +++ b/arch/mips/mm/pgtable.c
> @@ -10,10 +10,11 @@
>  
>  pgd_t *pgd_alloc(struct mm_struct *mm)
>  {
> -	pgd_t *ret, *init;
> +	pgd_t *init, *ret = NULL;
> +	struct ptdesc *ptdesc = pagetable_alloc(GFP_KERNEL, PGD_TABLE_ORDER);
>  
> -	ret = (pgd_t *) __get_free_pages(GFP_KERNEL, PGD_TABLE_ORDER);
> -	if (ret) {
> +	if (ptdesc) {
> +		ret = ptdesc_address(ptdesc);
>  		init = pgd_offset(&init_mm, 0UL);
>  		pgd_init(ret);
>  		memcpy(ret + USER_PTRS_PER_PGD, init + USER_PTRS_PER_PGD,
> -- 
> 2.40.1
> 
> 

-- 
Sincerely yours,
Mike.

