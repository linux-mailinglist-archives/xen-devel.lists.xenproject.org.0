Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FFAF73037A
	for <lists+xen-devel@lfdr.de>; Wed, 14 Jun 2023 17:20:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.548981.857264 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q9SHV-0002tA-Ay; Wed, 14 Jun 2023 15:19:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 548981.857264; Wed, 14 Jun 2023 15:19:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q9SHV-0002qo-86; Wed, 14 Jun 2023 15:19:33 +0000
Received: by outflank-mailman (input) for mailman id 548981;
 Wed, 14 Jun 2023 15:19:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=I5d0=CC=kernel.org=rppt@srs-se1.protection.inumbo.net>)
 id 1q9SHT-0002qa-Ca
 for xen-devel@lists.xenproject.org; Wed, 14 Jun 2023 15:19:31 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id db4ae7cb-0ac6-11ee-b232-6b7b168915f2;
 Wed, 14 Jun 2023 17:19:30 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 1176663EB4;
 Wed, 14 Jun 2023 15:19:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5818AC433C8;
 Wed, 14 Jun 2023 15:19:19 +0000 (UTC)
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
X-Inumbo-ID: db4ae7cb-0ac6-11ee-b232-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686755966;
	bh=c6X3BgGu/EnO13cv7axj+v9K19tCICftWYw//M95Fnc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mukQSaSzdQR3OwjUS8vlwj1DHxIFmnMmoNoVkKPQxFhB5yNNsmSGfOiEGD8e6JtXN
	 VZrzNf4q5GRrRBOrFQak3/eBTJY3kdciGuz9dfIz0ogQBeAxF+PTcvQ/gdSnr6B6Ya
	 C9HPAVz2+QHGDvMOZCaBKr/tY2qJeGKCeVCDx4TNXrt2yXr+HZedFR/l+9aCOtZIfW
	 p20G2U+/kfUbEadTA1MzcZsMIBLzRi+uWub7RgdqmiPZpQJB5MtxjDgSgPYQUK2ycp
	 Y3HwjPWpr3Oy82TQpASrv+jsR0EnwOAILsyUfuVeolmVBSHpN9tcvEMjDpzLifkGiY
	 BbULUmkygaTkA==
Date: Wed, 14 Jun 2023 18:18:48 +0300
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
	Palmer Dabbelt <palmer@rivosinc.com>
Subject: Re: [PATCH v4 29/34] riscv: Convert alloc_{pmd, pte}_late() to use
 ptdescs
Message-ID: <20230614151848.GB52412@kernel.org>
References: <20230612210423.18611-1-vishal.moola@gmail.com>
 <20230612210423.18611-30-vishal.moola@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230612210423.18611-30-vishal.moola@gmail.com>

On Mon, Jun 12, 2023 at 02:04:18PM -0700, Vishal Moola (Oracle) wrote:
> As part of the conversions to replace pgtable constructor/destructors with
> ptdesc equivalents, convert various page table functions to use ptdescs.
> 
> Some of the functions use the *get*page*() helper functions. Convert
> these to use pagetable_alloc() and ptdesc_address() instead to help
> standardize page tables further.
> 
> Signed-off-by: Vishal Moola (Oracle) <vishal.moola@gmail.com>
> Acked-by: Palmer Dabbelt <palmer@rivosinc.com>

Acked-by: Mike Rapoport (IBM) <rppt@kernel.org>

> ---
>  arch/riscv/include/asm/pgalloc.h |  8 ++++----
>  arch/riscv/mm/init.c             | 16 ++++++----------
>  2 files changed, 10 insertions(+), 14 deletions(-)
> 
> diff --git a/arch/riscv/include/asm/pgalloc.h b/arch/riscv/include/asm/pgalloc.h
> index 59dc12b5b7e8..d169a4f41a2e 100644
> --- a/arch/riscv/include/asm/pgalloc.h
> +++ b/arch/riscv/include/asm/pgalloc.h
> @@ -153,10 +153,10 @@ static inline pgd_t *pgd_alloc(struct mm_struct *mm)
>  
>  #endif /* __PAGETABLE_PMD_FOLDED */
>  
> -#define __pte_free_tlb(tlb, pte, buf)   \
> -do {                                    \
> -	pgtable_pte_page_dtor(pte);     \
> -	tlb_remove_page((tlb), pte);    \
> +#define __pte_free_tlb(tlb, pte, buf)			\
> +do {							\
> +	pagetable_pte_dtor(page_ptdesc(pte));		\
> +	tlb_remove_page_ptdesc((tlb), page_ptdesc(pte));\
>  } while (0)
>  #endif /* CONFIG_MMU */
>  
> diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
> index 3d689ffb2072..6bfeec80bf4e 100644
> --- a/arch/riscv/mm/init.c
> +++ b/arch/riscv/mm/init.c
> @@ -354,12 +354,10 @@ static inline phys_addr_t __init alloc_pte_fixmap(uintptr_t va)
>  
>  static phys_addr_t __init alloc_pte_late(uintptr_t va)
>  {
> -	unsigned long vaddr;
> -
> -	vaddr = __get_free_page(GFP_KERNEL);
> -	BUG_ON(!vaddr || !pgtable_pte_page_ctor(virt_to_page((void *)vaddr)));
> +	struct ptdesc *ptdesc = pagetable_alloc(GFP_KERNEL, 0);
>  
> -	return __pa(vaddr);
> +	BUG_ON(!ptdesc || !pagetable_pte_ctor(ptdesc));
> +	return __pa((pte_t *)ptdesc_address(ptdesc));
>  }
>  
>  static void __init create_pte_mapping(pte_t *ptep,
> @@ -437,12 +435,10 @@ static phys_addr_t __init alloc_pmd_fixmap(uintptr_t va)
>  
>  static phys_addr_t __init alloc_pmd_late(uintptr_t va)
>  {
> -	unsigned long vaddr;
> -
> -	vaddr = __get_free_page(GFP_KERNEL);
> -	BUG_ON(!vaddr || !pgtable_pmd_page_ctor(virt_to_page((void *)vaddr)));
> +	struct ptdesc *ptdesc = pagetable_alloc(GFP_KERNEL, 0);
>  
> -	return __pa(vaddr);
> +	BUG_ON(!ptdesc || !pagetable_pmd_ctor(ptdesc));
> +	return __pa((pmd_t *)ptdesc_address(ptdesc));
>  }
>  
>  static void __init create_pmd_mapping(pmd_t *pmdp,
> -- 
> 2.40.1
> 
> 

-- 
Sincerely yours,
Mike.

