Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 743C77108B1
	for <lists+xen-devel@lfdr.de>; Thu, 25 May 2023 11:19:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.539469.840371 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q2787-0003VB-F4; Thu, 25 May 2023 09:19:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 539469.840371; Thu, 25 May 2023 09:19:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q2787-0003T3-BZ; Thu, 25 May 2023 09:19:31 +0000
Received: by outflank-mailman (input) for mailman id 539469;
 Thu, 25 May 2023 09:19:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=JOix=BO=kernel.org=rppt@srs-se1.protection.inumbo.net>)
 id 1q2786-0003BH-C3
 for xen-devel@lists.xenproject.org; Thu, 25 May 2023 09:19:30 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3f561c39-fadd-11ed-8611-37d641c3527e;
 Thu, 25 May 2023 11:19:28 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 0FA426442A;
 Thu, 25 May 2023 09:19:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C3CF9C433EF;
 Thu, 25 May 2023 09:19:19 +0000 (UTC)
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
X-Inumbo-ID: 3f561c39-fadd-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1685006366;
	bh=wqsrR+VLdLpuPAmDdXqCVY2XwnsXyfpXvlaNwL8b95Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=foE41UqPH1HgRiXHDcvmNVSgga8+6+movhrIvHcP0lKkim5d2C0CveXiAkrsugwUY
	 mTMqHgjGefxYEA1DbMZBeEKmAQcDqRXgChs6yPJ6RFCubSjjaqUfXH5DibAVcYpUBA
	 aCcKgzmG5mhVSa4fQNmh2lbUtoTD+weF0ODUHN0azy9cnLxTNG6czawfKdDGiZ3h9+
	 eQhVfl9VDk2zYUu2V/zd6ljbuCqaKQw9PEhJG6TAu5DceAsH/0TRlb4M7Mib7O0vr6
	 Y2yg35as+E26Oh74LjFv8mXxr+pdJYlNpysggvOKmpyB8i+xjdzE7MqNjdH/FF5KDP
	 bMNE7SNyaBLAA==
Date: Thu, 25 May 2023 12:19:00 +0300
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
	xen-devel@lists.xenproject.org, kvm@vger.kernel.org
Subject: Re: [PATCH v2 13/34] mm: Create ptdesc equivalents for
 pgtable_{pte,pmd}_page_{ctor,dtor}
Message-ID: <20230525091900.GY4967@kernel.org>
References: <20230501192829.17086-1-vishal.moola@gmail.com>
 <20230501192829.17086-14-vishal.moola@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230501192829.17086-14-vishal.moola@gmail.com>

On Mon, May 01, 2023 at 12:28:08PM -0700, Vishal Moola (Oracle) wrote:
> Creates ptdesc_pte_ctor(), ptdesc_pmd_ctor(), ptdesc_pte_dtor(), and
> ptdesc_pmd_dtor() and make the original pgtable constructor/destructors
> wrappers.

I think pgtable_pXY_ctor/dtor names would be better.
 
> Signed-off-by: Vishal Moola (Oracle) <vishal.moola@gmail.com>
> ---
>  include/linux/mm.h | 56 ++++++++++++++++++++++++++++++++++------------
>  1 file changed, 42 insertions(+), 14 deletions(-)
> 
> diff --git a/include/linux/mm.h b/include/linux/mm.h
> index 58c911341a33..dc61aeca9077 100644
> --- a/include/linux/mm.h
> +++ b/include/linux/mm.h
> @@ -2847,20 +2847,34 @@ static inline bool ptlock_init(struct ptdesc *ptdesc) { return true; }
>  static inline void ptlock_free(struct ptdesc *ptdesc) {}
>  #endif /* USE_SPLIT_PTE_PTLOCKS */
>  
> -static inline bool pgtable_pte_page_ctor(struct page *page)
> +static inline bool ptdesc_pte_ctor(struct ptdesc *ptdesc)
>  {
> -	if (!ptlock_init(page_ptdesc(page)))
> +	struct folio *folio = ptdesc_folio(ptdesc);
> +
> +	if (!ptlock_init(ptdesc))
>  		return false;
> -	__SetPageTable(page);
> -	inc_lruvec_page_state(page, NR_PAGETABLE);
> +	__folio_set_table(folio);
> +	lruvec_stat_add_folio(folio, NR_PAGETABLE);
>  	return true;
>  }
>  
> +static inline bool pgtable_pte_page_ctor(struct page *page)
> +{
> +	return ptdesc_pte_ctor(page_ptdesc(page));
> +}
> +
> +static inline void ptdesc_pte_dtor(struct ptdesc *ptdesc)
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
> +	ptdesc_pte_dtor(page_ptdesc(page));
>  }
>  
>  #define pte_offset_map_lock(mm, pmd, address, ptlp)	\
> @@ -2942,20 +2956,34 @@ static inline spinlock_t *pmd_lock(struct mm_struct *mm, pmd_t *pmd)
>  	return ptl;
>  }
>  
> -static inline bool pgtable_pmd_page_ctor(struct page *page)
> +static inline bool ptdesc_pmd_ctor(struct ptdesc *ptdesc)
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
> +	return ptdesc_pmd_ctor(page_ptdesc(page));
> +}
> +
> +static inline void ptdesc_pmd_dtor(struct ptdesc *ptdesc)
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
> +	ptdesc_pmd_dtor(page_ptdesc(page));
>  }
>  
>  /*
> -- 
> 2.39.2
> 
> 

-- 
Sincerely yours,
Mike.

