Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E40673015D
	for <lists+xen-devel@lfdr.de>; Wed, 14 Jun 2023 16:12:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.548854.857045 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q9RDg-0001S0-60; Wed, 14 Jun 2023 14:11:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 548854.857045; Wed, 14 Jun 2023 14:11:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q9RDg-0001PR-3D; Wed, 14 Jun 2023 14:11:32 +0000
Received: by outflank-mailman (input) for mailman id 548854;
 Wed, 14 Jun 2023 14:11:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=I5d0=CC=kernel.org=rppt@srs-se1.protection.inumbo.net>)
 id 1q9RDe-0001PL-DJ
 for xen-devel@lists.xenproject.org; Wed, 14 Jun 2023 14:11:30 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5a851029-0abd-11ee-b232-6b7b168915f2;
 Wed, 14 Jun 2023 16:11:28 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 6CFA860E9E;
 Wed, 14 Jun 2023 14:11:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 10F7AC433C0;
 Wed, 14 Jun 2023 14:11:19 +0000 (UTC)
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
X-Inumbo-ID: 5a851029-0abd-11ee-b232-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686751886;
	bh=nq3f91/c6VdnG05wknAO7CzsIzeIwd55LMS9xhs7vLc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZhJtlj5I8piICZIev7qvB69N2MRkFrUNmM4AY9KOSxdltgl+qcVmK0w/AhUDKOYUE
	 C0naLvwDyTJX3vMjNC8e9+i7bgqJP3nnR+cfRN/EKtI25YOH2TSwU36LZazWsweF02
	 YGMNzwODmUGT8dkPREzGod/+rUbK65tLM4QfOSq3fgVX2NpImfyc5X1iBcneHw7wgS
	 aWE67OFlHHdjdwxPMfJUf27XkhoC98XnYJ++XQkAMrKDt/blZeMPDlGxeoaoTED8QE
	 EqDj0B92olx0FPba9u2ztMQCZcN18316sOzneqJzKqI8FGzRdybM2tuA29sFD9tYUy
	 7yV6zVzN7CwRA==
Date: Wed, 14 Jun 2023 17:10:49 +0300
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
Subject: Re: [PATCH v4 13/34] mm: Create ptdesc equivalents for
 pgtable_{pte,pmd}_page_{ctor,dtor}
Message-ID: <20230614141049.GL52412@kernel.org>
References: <20230612210423.18611-1-vishal.moola@gmail.com>
 <20230612210423.18611-14-vishal.moola@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230612210423.18611-14-vishal.moola@gmail.com>

On Mon, Jun 12, 2023 at 02:04:02PM -0700, Vishal Moola (Oracle) wrote:
> Creates pagetable_pte_ctor(), pagetable_pmd_ctor(), pagetable_pte_dtor(),
> and pagetable_pmd_dtor() and make the original pgtable
> constructor/destructors wrappers.

Nit: either "creates ... makes" or "create ... make"
I like the second form more.
 
> Signed-off-by: Vishal Moola (Oracle) <vishal.moola@gmail.com>

Acked-by: Mike Rapoport (IBM) <rppt@kernel.org>

> ---
>  include/linux/mm.h | 56 ++++++++++++++++++++++++++++++++++------------
>  1 file changed, 42 insertions(+), 14 deletions(-)
> 
> diff --git a/include/linux/mm.h b/include/linux/mm.h
> index a1af7983e1bd..dc211c43610b 100644
> --- a/include/linux/mm.h
> +++ b/include/linux/mm.h
> @@ -2886,20 +2886,34 @@ static inline bool ptlock_init(struct ptdesc *ptdesc) { return true; }
>  static inline void ptlock_free(struct ptdesc *ptdesc) {}
>  #endif /* USE_SPLIT_PTE_PTLOCKS */
>  
> -static inline bool pgtable_pte_page_ctor(struct page *page)
> +static inline bool pagetable_pte_ctor(struct ptdesc *ptdesc)
>  {
> -	if (!ptlock_init(page_ptdesc(page)))
> +	struct folio *folio = ptdesc_folio(ptdesc);
> +
> +	if (!ptlock_init(ptdesc))
>  		return false;
> -	__SetPageTable(page);
> -	inc_lruvec_page_state(page, NR_PAGETABLE);
> +	__folio_set_table(folio);

This comment is more to patch 1 ("mm: Add PAGE_TYPE_OP folio functions")

It would be better to have _pgtable here, as "table" does not necessary
mean page table.
With PageType SetPageTable was fine, but with folio I think it should be
more explicit.

I'd add a third parameter to PAGE_TYPE_OPS for that.

> +	lruvec_stat_add_folio(folio, NR_PAGETABLE);
>  	return true;
>  }
>  
> +static inline bool pgtable_pte_page_ctor(struct page *page)
> +{
> +	return pagetable_pte_ctor(page_ptdesc(page));
> +}
> +
> +static inline void pagetable_pte_dtor(struct ptdesc *ptdesc)
> +{
> +	struct folio *folio = ptdesc_folio(ptdesc);
> +
> +	ptlock_free(ptdesc);
> +	__folio_clear_table(folio);
> +	lruvec_stat_sub_folio(folio, NR_PAGETABLE);
> +}
> +
>  static inline void pgtable_pte_page_dtor(struct page *page)
>  {
> -	ptlock_free(page_ptdesc(page));
> -	__ClearPageTable(page);
> -	dec_lruvec_page_state(page, NR_PAGETABLE);
> +	pagetable_pte_dtor(page_ptdesc(page));
>  }
>  
>  #define pte_offset_map_lock(mm, pmd, address, ptlp)	\
> @@ -2981,20 +2995,34 @@ static inline spinlock_t *pmd_lock(struct mm_struct *mm, pmd_t *pmd)
>  	return ptl;
>  }
>  
> -static inline bool pgtable_pmd_page_ctor(struct page *page)
> +static inline bool pagetable_pmd_ctor(struct ptdesc *ptdesc)
>  {
> -	if (!pmd_ptlock_init(page_ptdesc(page)))
> +	struct folio *folio = ptdesc_folio(ptdesc);
> +
> +	if (!pmd_ptlock_init(ptdesc))
>  		return false;
> -	__SetPageTable(page);
> -	inc_lruvec_page_state(page, NR_PAGETABLE);
> +	__folio_set_table(folio);
> +	lruvec_stat_add_folio(folio, NR_PAGETABLE);
>  	return true;
>  }
>  
> +static inline bool pgtable_pmd_page_ctor(struct page *page)
> +{
> +	return pagetable_pmd_ctor(page_ptdesc(page));
> +}
> +
> +static inline void pagetable_pmd_dtor(struct ptdesc *ptdesc)
> +{
> +	struct folio *folio = ptdesc_folio(ptdesc);
> +
> +	pmd_ptlock_free(ptdesc);
> +	__folio_clear_table(folio);
> +	lruvec_stat_sub_folio(folio, NR_PAGETABLE);
> +}
> +
>  static inline void pgtable_pmd_page_dtor(struct page *page)
>  {
> -	pmd_ptlock_free(page_ptdesc(page));
> -	__ClearPageTable(page);
> -	dec_lruvec_page_state(page, NR_PAGETABLE);
> +	pagetable_pmd_dtor(page_ptdesc(page));
>  }
>  
>  /*
> -- 
> 2.40.1
> 
> 

-- 
Sincerely yours,
Mike.

