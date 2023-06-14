Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EC197300C7
	for <lists+xen-devel@lfdr.de>; Wed, 14 Jun 2023 15:53:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.548821.856984 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q9QvY-0004Fs-Gw; Wed, 14 Jun 2023 13:52:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 548821.856984; Wed, 14 Jun 2023 13:52:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q9QvY-0004Dg-E6; Wed, 14 Jun 2023 13:52:48 +0000
Received: by outflank-mailman (input) for mailman id 548821;
 Wed, 14 Jun 2023 13:52:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=I5d0=CC=kernel.org=rppt@srs-se1.protection.inumbo.net>)
 id 1q9QvW-0002zG-Vi
 for xen-devel@lists.xenproject.org; Wed, 14 Jun 2023 13:52:46 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bcd7eadd-0aba-11ee-8611-37d641c3527e;
 Wed, 14 Jun 2023 15:52:45 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 0070864287;
 Wed, 14 Jun 2023 13:52:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AA10DC433C0;
 Wed, 14 Jun 2023 13:52:36 +0000 (UTC)
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
X-Inumbo-ID: bcd7eadd-0aba-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686750763;
	bh=Jr1CjE7x6zZhqlD+PrxSeOCGxWprISw499VNjITcty4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WTLFY5L6mnlqfGDyFTiH9jqq2FKHmRtqRnjsTj1RSarSSy3AxLfMgUgjr8wGlmHBW
	 ZIyTwYSaSC1laCUlNWdYFX2P0Vpo5Cygx+gCIcavFIbmFA7gdFkAZSMhEGMMgWmRbu
	 2PIwOB+Zm2qIyVb3o5W9j04IHSX7uWkmLNNjNW4pTo0Uj3+m7MBHT7TUhTgbQveuQG
	 8Y13PY2/OBFLWcieHZ12iDoM6RLDamAU84EbiDa/rEeH2lt3RpONvk9+fHWXJncK7b
	 7pIkWK95aM9sq+JHpbXwyxHzzP/N7RDgJmdalD7vC2ycKfkQ6ox4Zo04K9yfj/x21h
	 HrE7P9YKzVHGQ==
Date: Wed, 14 Jun 2023 16:52:05 +0300
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
Subject: Re: [PATCH v4 08/34] mm: Convert ptlock_ptr() to use ptdescs
Message-ID: <20230614135205.GG52412@kernel.org>
References: <20230612210423.18611-1-vishal.moola@gmail.com>
 <20230612210423.18611-9-vishal.moola@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230612210423.18611-9-vishal.moola@gmail.com>

On Mon, Jun 12, 2023 at 02:03:57PM -0700, Vishal Moola (Oracle) wrote:
> This removes some direct accesses to struct page, working towards
> splitting out struct ptdesc from struct page.
> 
> Signed-off-by: Vishal Moola (Oracle) <vishal.moola@gmail.com>

Acked-by: Mike Rapoport (IBM) <rppt@kernel.org>

> ---
>  arch/x86/xen/mmu_pv.c |  2 +-
>  include/linux/mm.h    | 14 +++++++-------
>  2 files changed, 8 insertions(+), 8 deletions(-)
> 
> diff --git a/arch/x86/xen/mmu_pv.c b/arch/x86/xen/mmu_pv.c
> index b3b8d289b9ab..f469862e3ef4 100644
> --- a/arch/x86/xen/mmu_pv.c
> +++ b/arch/x86/xen/mmu_pv.c
> @@ -651,7 +651,7 @@ static spinlock_t *xen_pte_lock(struct page *page, struct mm_struct *mm)
>  	spinlock_t *ptl = NULL;
>  
>  #if USE_SPLIT_PTE_PTLOCKS
> -	ptl = ptlock_ptr(page);
> +	ptl = ptlock_ptr(page_ptdesc(page));
>  	spin_lock_nest_lock(ptl, &mm->page_table_lock);
>  #endif
>  
> diff --git a/include/linux/mm.h b/include/linux/mm.h
> index e6f1be2a405e..bb934d51390f 100644
> --- a/include/linux/mm.h
> +++ b/include/linux/mm.h
> @@ -2828,9 +2828,9 @@ void __init ptlock_cache_init(void);
>  bool ptlock_alloc(struct ptdesc *ptdesc);
>  extern void ptlock_free(struct page *page);
>  
> -static inline spinlock_t *ptlock_ptr(struct page *page)
> +static inline spinlock_t *ptlock_ptr(struct ptdesc *ptdesc)
>  {
> -	return page->ptl;
> +	return ptdesc->ptl;
>  }
>  #else /* ALLOC_SPLIT_PTLOCKS */
>  static inline void ptlock_cache_init(void)
> @@ -2846,15 +2846,15 @@ static inline void ptlock_free(struct page *page)
>  {
>  }
>  
> -static inline spinlock_t *ptlock_ptr(struct page *page)
> +static inline spinlock_t *ptlock_ptr(struct ptdesc *ptdesc)
>  {
> -	return &page->ptl;
> +	return &ptdesc->ptl;
>  }
>  #endif /* ALLOC_SPLIT_PTLOCKS */
>  
>  static inline spinlock_t *pte_lockptr(struct mm_struct *mm, pmd_t *pmd)
>  {
> -	return ptlock_ptr(pmd_page(*pmd));
> +	return ptlock_ptr(page_ptdesc(pmd_page(*pmd)));
>  }
>  
>  static inline bool ptlock_init(struct page *page)
> @@ -2869,7 +2869,7 @@ static inline bool ptlock_init(struct page *page)
>  	VM_BUG_ON_PAGE(*(unsigned long *)&page->ptl, page);
>  	if (!ptlock_alloc(page_ptdesc(page)))
>  		return false;
> -	spin_lock_init(ptlock_ptr(page));
> +	spin_lock_init(ptlock_ptr(page_ptdesc(page)));
>  	return true;
>  }
>  
> @@ -2939,7 +2939,7 @@ static inline struct ptdesc *pmd_ptdesc(pmd_t *pmd)
>  
>  static inline spinlock_t *pmd_lockptr(struct mm_struct *mm, pmd_t *pmd)
>  {
> -	return ptlock_ptr(ptdesc_page(pmd_ptdesc(pmd)));
> +	return ptlock_ptr(pmd_ptdesc(pmd));
>  }
>  
>  static inline bool pmd_ptlock_init(struct page *page)
> -- 
> 2.40.1
> 
> 

-- 
Sincerely yours,
Mike.

