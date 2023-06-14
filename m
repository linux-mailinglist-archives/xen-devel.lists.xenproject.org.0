Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D5C5872FF64
	for <lists+xen-devel@lfdr.de>; Wed, 14 Jun 2023 15:03:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.548746.856864 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q9Q9C-0001ES-W2; Wed, 14 Jun 2023 13:02:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 548746.856864; Wed, 14 Jun 2023 13:02:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q9Q9C-0001C5-SY; Wed, 14 Jun 2023 13:02:50 +0000
Received: by outflank-mailman (input) for mailman id 548746;
 Wed, 14 Jun 2023 13:02:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=I5d0=CC=kernel.org=rppt@srs-se1.protection.inumbo.net>)
 id 1q9Q9B-0001Bz-Cd
 for xen-devel@lists.xenproject.org; Wed, 14 Jun 2023 13:02:49 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c19d6d09-0ab3-11ee-8611-37d641c3527e;
 Wed, 14 Jun 2023 15:02:46 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 4E2AB639FF;
 Wed, 14 Jun 2023 13:02:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C8321C433CB;
 Wed, 14 Jun 2023 13:02:37 +0000 (UTC)
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
X-Inumbo-ID: c19d6d09-0ab3-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686747764;
	bh=Z0S2d/Eru6a8jIIub+wJj2QGnnAEIe7xODp5r4XEjY4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Ij1kaX2f2DmI7HK85FkEb/euMvHbhk1Yl6Bfkym5Y/V3n55SCcwdtHPiMl/Uaznfq
	 /JPBcReV4N5cCfLGrjl0lmP3t1/xIRQ0sNu8SuNRKfJvFTG3ehEI7XrnyZzzj/mq5Z
	 LIzsfSZJkFEA+VFk5od8SUJmz7a2MZahKi7y83tUViVFyHKqtoU7QmKJKuQUMruG+3
	 ZBcXEtH/BdXI8p8nle54zxP2rJXEAQvrH6UElVJeso6ar3qrgbKRU7tK7ulw5ExB7M
	 3MJes9iMWx7TD3tX2qF3/3jOSJV75iRXzB8fjYUsip9RPr0GERlktBmW7yBKguUpKQ
	 +EDy1u2Ox8vrA==
Date: Wed, 14 Jun 2023 16:02:07 +0300
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
Subject: Re: [PATCH v4 01/34] mm: Add PAGE_TYPE_OP folio functions
Message-ID: <20230614130207.GZ52412@kernel.org>
References: <20230612210423.18611-1-vishal.moola@gmail.com>
 <20230612210423.18611-2-vishal.moola@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230612210423.18611-2-vishal.moola@gmail.com>

On Mon, Jun 12, 2023 at 02:03:50PM -0700, Vishal Moola (Oracle) wrote:
> No folio equivalents for page type operations have been defined, so
> define them for later folio conversions.
> 
> Also changes the Page##uname macros to take in const struct page* since
> we only read the memory here.
> 
> Signed-off-by: Vishal Moola (Oracle) <vishal.moola@gmail.com>

Acked-by: Mike Rapoport (IBM) <rppt@kernel.org>

> ---
>  include/linux/page-flags.h | 20 ++++++++++++++++++--
>  1 file changed, 18 insertions(+), 2 deletions(-)
> 
> diff --git a/include/linux/page-flags.h b/include/linux/page-flags.h
> index 92a2063a0a23..e99a616b9bcd 100644
> --- a/include/linux/page-flags.h
> +++ b/include/linux/page-flags.h
> @@ -908,6 +908,8 @@ static inline bool is_page_hwpoison(struct page *page)
>  
>  #define PageType(page, flag)						\
>  	((page->page_type & (PAGE_TYPE_BASE | flag)) == PAGE_TYPE_BASE)
> +#define folio_test_type(folio, flag)					\
> +	((folio->page.page_type & (PAGE_TYPE_BASE | flag)) == PAGE_TYPE_BASE)
>  
>  static inline int page_type_has_type(unsigned int page_type)
>  {
> @@ -920,20 +922,34 @@ static inline int page_has_type(struct page *page)
>  }
>  
>  #define PAGE_TYPE_OPS(uname, lname)					\
> -static __always_inline int Page##uname(struct page *page)		\
> +static __always_inline int Page##uname(const struct page *page)		\
>  {									\
>  	return PageType(page, PG_##lname);				\
>  }									\
> +static __always_inline int folio_test_##lname(const struct folio *folio)\
> +{									\
> +	return folio_test_type(folio, PG_##lname);			\
> +}									\
>  static __always_inline void __SetPage##uname(struct page *page)		\
>  {									\
>  	VM_BUG_ON_PAGE(!PageType(page, 0), page);			\
>  	page->page_type &= ~PG_##lname;					\
>  }									\
> +static __always_inline void __folio_set_##lname(struct folio *folio)	\
> +{									\
> +	VM_BUG_ON_FOLIO(!folio_test_type(folio, 0), folio);		\
> +	folio->page.page_type &= ~PG_##lname;				\
> +}									\
>  static __always_inline void __ClearPage##uname(struct page *page)	\
>  {									\
>  	VM_BUG_ON_PAGE(!Page##uname(page), page);			\
>  	page->page_type |= PG_##lname;					\
> -}
> +}									\
> +static __always_inline void __folio_clear_##lname(struct folio *folio)	\
> +{									\
> +	VM_BUG_ON_FOLIO(!folio_test_##lname(folio), folio);		\
> +	folio->page.page_type |= PG_##lname;				\
> +}									\
>  
>  /*
>   * PageBuddy() indicates that the page is free and in the buddy system
> -- 
> 2.40.1
> 
> 

-- 
Sincerely yours,
Mike.

