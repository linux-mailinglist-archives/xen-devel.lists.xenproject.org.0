Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B3AAC73030B
	for <lists+xen-devel@lfdr.de>; Wed, 14 Jun 2023 17:10:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.548953.857214 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q9S8c-0008OU-HF; Wed, 14 Jun 2023 15:10:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 548953.857214; Wed, 14 Jun 2023 15:10:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q9S8c-0008Lv-EV; Wed, 14 Jun 2023 15:10:22 +0000
Received: by outflank-mailman (input) for mailman id 548953;
 Wed, 14 Jun 2023 15:10:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=I5d0=CC=kernel.org=rppt@srs-se1.protection.inumbo.net>)
 id 1q9S8a-0008Ln-Rm
 for xen-devel@lists.xenproject.org; Wed, 14 Jun 2023 15:10:20 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 928fdd9e-0ac5-11ee-8611-37d641c3527e;
 Wed, 14 Jun 2023 17:10:18 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 8A3FB63E86;
 Wed, 14 Jun 2023 15:10:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 16FDFC433C9;
 Wed, 14 Jun 2023 15:10:08 +0000 (UTC)
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
X-Inumbo-ID: 928fdd9e-0ac5-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686755416;
	bh=eEAbU7oQr9nMdD1HLeHjNBK19Ki+7NwrWH3cOyfSAFw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=u1QQyNDBdtCEWKCdwkI61E6ULyFIgzYYylF24CXModGq8eNzM+Z8HRxJ8NnKbPEF5
	 UNrt/K6ZH5RXrryPuSNoWGiuCh9vnPW8YLLGFCdMmvIvsn7goY4XYWaNAnF4AlaV9N
	 mfMLdsrym6F2G1al1nf4xNlH9qHN5OFMys6dbDrcrpZ1VYnPTPQnPkmwVp166H2/JK
	 U32Jf//4jTFsBKhLdt7fUkuWV7s3JXIXH4B66LpDynvbrZHamU0t4g4xIlyNwqP+5M
	 W4uLOM28xHt+KNxT29B1NyZJ2yMGSa3xxMl7M4zbMQTq/+ShWbaHrgSWCQ911pmwU9
	 nPWmBNYhBTiFw==
Date: Wed, 14 Jun 2023 18:09:37 +0300
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
	Huacai Chen <chenhuacai@kernel.org>
Subject: Re: [PATCH v4 24/34] loongarch: Convert various functions to use
 ptdescs
Message-ID: <20230614150937.GW52412@kernel.org>
References: <20230612210423.18611-1-vishal.moola@gmail.com>
 <20230612210423.18611-25-vishal.moola@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230612210423.18611-25-vishal.moola@gmail.com>

On Mon, Jun 12, 2023 at 02:04:13PM -0700, Vishal Moola (Oracle) wrote:
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
>  arch/loongarch/include/asm/pgalloc.h | 27 +++++++++++++++------------
>  arch/loongarch/mm/pgtable.c          |  7 ++++---
>  2 files changed, 19 insertions(+), 15 deletions(-)
> 
> diff --git a/arch/loongarch/include/asm/pgalloc.h b/arch/loongarch/include/asm/pgalloc.h
> index af1d1e4a6965..70bb3bdd201e 100644
> --- a/arch/loongarch/include/asm/pgalloc.h
> +++ b/arch/loongarch/include/asm/pgalloc.h
> @@ -45,9 +45,9 @@ extern void pagetable_init(void);
>  extern pgd_t *pgd_alloc(struct mm_struct *mm);
>  
>  #define __pte_free_tlb(tlb, pte, address)			\
> -do {							\
> -	pgtable_pte_page_dtor(pte);			\
> -	tlb_remove_page((tlb), pte);			\
> +do {								\
> +	pagetable_pte_dtor(page_ptdesc(pte));			\
> +	tlb_remove_page_ptdesc((tlb), page_ptdesc(pte));	\
>  } while (0)
>  
>  #ifndef __PAGETABLE_PMD_FOLDED
> @@ -55,18 +55,18 @@ do {							\
>  static inline pmd_t *pmd_alloc_one(struct mm_struct *mm, unsigned long address)
>  {
>  	pmd_t *pmd;
> -	struct page *pg;
> +	struct ptdesc *ptdesc;
>  
> -	pg = alloc_page(GFP_KERNEL_ACCOUNT);
> -	if (!pg)
> +	ptdesc = pagetable_alloc(GFP_KERNEL_ACCOUNT, 0);
> +	if (!ptdesc)
>  		return NULL;
>  
> -	if (!pgtable_pmd_page_ctor(pg)) {
> -		__free_page(pg);
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
> @@ -80,10 +80,13 @@ static inline pmd_t *pmd_alloc_one(struct mm_struct *mm, unsigned long address)
>  static inline pud_t *pud_alloc_one(struct mm_struct *mm, unsigned long address)
>  {
>  	pud_t *pud;
> +	struct ptdesc *ptdesc = pagetable_alloc(GFP_KERNEL, 0);
>  
> -	pud = (pud_t *) __get_free_page(GFP_KERNEL);
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
> diff --git a/arch/loongarch/mm/pgtable.c b/arch/loongarch/mm/pgtable.c
> index 36a6dc0148ae..cdba10ffc0df 100644
> --- a/arch/loongarch/mm/pgtable.c
> +++ b/arch/loongarch/mm/pgtable.c
> @@ -11,10 +11,11 @@
>  
>  pgd_t *pgd_alloc(struct mm_struct *mm)
>  {
> -	pgd_t *ret, *init;
> +	pgd_t *init, *ret = NULL;
> +	struct ptdesc *ptdesc = pagetable_alloc(GFP_KERNEL, 0);
>  
> -	ret = (pgd_t *) __get_free_page(GFP_KERNEL);
> -	if (ret) {
> +	if (ptdesc) {
> +		ret = (pgd_t *)ptdesc_address(ptdesc);
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

