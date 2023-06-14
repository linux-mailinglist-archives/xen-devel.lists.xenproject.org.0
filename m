Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 922277300A7
	for <lists+xen-devel@lfdr.de>; Wed, 14 Jun 2023 15:52:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.548805.856955 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q9Qug-0002kQ-Kf; Wed, 14 Jun 2023 13:51:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 548805.856955; Wed, 14 Jun 2023 13:51:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q9Qug-0002hw-Hy; Wed, 14 Jun 2023 13:51:54 +0000
Received: by outflank-mailman (input) for mailman id 548805;
 Wed, 14 Jun 2023 13:51:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=I5d0=CC=kernel.org=rppt@srs-se1.protection.inumbo.net>)
 id 1q9Quf-0002hX-BZ
 for xen-devel@lists.xenproject.org; Wed, 14 Jun 2023 13:51:53 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9d4122eb-0aba-11ee-b232-6b7b168915f2;
 Wed, 14 Jun 2023 15:51:52 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 0D0F86371D;
 Wed, 14 Jun 2023 13:51:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7653EC433C0;
 Wed, 14 Jun 2023 13:51:43 +0000 (UTC)
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
X-Inumbo-ID: 9d4122eb-0aba-11ee-b232-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686750710;
	bh=MAYhMoo3f8WL6wMqKE5pm7ocfhsiks+frK6iH2blioo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UEIirlFbT/jXJvHUAqdydA59j1RgDZUUfgyOKgwNndXqGOEHUHhZfOzL8/NQgVHWq
	 /q8XC8zbUoWUdbEY52nA6n3QMoY+5uT3nVSo46hX3ckloa8Tsk20nvsFk+nFyI69rq
	 kqHKU2qNg4cLDxDKYqW/CF0jwV3eWOULQ1qERJP4E28CBFcj6QUn7snwpsx+9K+Qu2
	 POIbcaK1ERRHtrayBYsdhpVVMqCnIj3U/FswN9W3HiA4Vsg6KhJEbi7yWjCVgy7Bim
	 qkQ5e6uOUhmZCAZAp2Mldqm52UMAWsfOcJWE7Vw1mqKjcEoYqpl1pq42H9ff1U9Ztz
	 NxXUpOfWIJH1g==
Date: Wed, 14 Jun 2023 16:51:12 +0300
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
Subject: Re: [PATCH v4 06/34] mm: Convert pmd_pgtable_page() to pmd_ptdesc()
Message-ID: <20230614135112.GE52412@kernel.org>
References: <20230612210423.18611-1-vishal.moola@gmail.com>
 <20230612210423.18611-7-vishal.moola@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230612210423.18611-7-vishal.moola@gmail.com>

On Mon, Jun 12, 2023 at 02:03:55PM -0700, Vishal Moola (Oracle) wrote:
> Converts pmd_pgtable_page() to pmd_ptdesc() and all its callers. This
> removes some direct accesses to struct page, working towards splitting
> out struct ptdesc from struct page.
> 
> Signed-off-by: Vishal Moola (Oracle) <vishal.moola@gmail.com>

Acked-by: Mike Rapoport (IBM) <rppt@kernel.org>

> ---
>  include/linux/mm.h | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/include/linux/mm.h b/include/linux/mm.h
> index f184f1eba85d..088b7664f897 100644
> --- a/include/linux/mm.h
> +++ b/include/linux/mm.h
> @@ -2931,15 +2931,15 @@ static inline void pgtable_pte_page_dtor(struct page *page)
>  
>  #if USE_SPLIT_PMD_PTLOCKS
>  
> -static inline struct page *pmd_pgtable_page(pmd_t *pmd)
> +static inline struct ptdesc *pmd_ptdesc(pmd_t *pmd)
>  {
>  	unsigned long mask = ~(PTRS_PER_PMD * sizeof(pmd_t) - 1);
> -	return virt_to_page((void *)((unsigned long) pmd & mask));
> +	return virt_to_ptdesc((void *)((unsigned long) pmd & mask));
>  }
>  
>  static inline spinlock_t *pmd_lockptr(struct mm_struct *mm, pmd_t *pmd)
>  {
> -	return ptlock_ptr(pmd_pgtable_page(pmd));
> +	return ptlock_ptr(ptdesc_page(pmd_ptdesc(pmd)));
>  }
>  
>  static inline bool pmd_ptlock_init(struct page *page)
> @@ -2958,7 +2958,7 @@ static inline void pmd_ptlock_free(struct page *page)
>  	ptlock_free(page);
>  }
>  
> -#define pmd_huge_pte(mm, pmd) (pmd_pgtable_page(pmd)->pmd_huge_pte)
> +#define pmd_huge_pte(mm, pmd) (pmd_ptdesc(pmd)->pmd_huge_pte)
>  
>  #else
>  
> -- 
> 2.40.1
> 
> 

-- 
Sincerely yours,
Mike.

