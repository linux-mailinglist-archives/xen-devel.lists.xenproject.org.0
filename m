Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FAB85A7B11
	for <lists+xen-devel@lfdr.de>; Wed, 31 Aug 2022 12:11:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.395603.635375 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oTKgk-0000qo-1I; Wed, 31 Aug 2022 10:11:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 395603.635375; Wed, 31 Aug 2022 10:11:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oTKgj-0000na-UT; Wed, 31 Aug 2022 10:11:13 +0000
Received: by outflank-mailman (input) for mailman id 395603;
 Wed, 31 Aug 2022 10:11:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=kbIA=ZD=suse.de=mgorman@srs-se1.protection.inumbo.net>)
 id 1oTKgi-0000nO-6h
 for xen-devel@lists.xenproject.org; Wed, 31 Aug 2022 10:11:12 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3c86df9f-2915-11ed-bd2e-47488cf2e6aa;
 Wed, 31 Aug 2022 12:11:11 +0200 (CEST)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out1.suse.de (Postfix) with ESMTP id 279092226F;
 Wed, 31 Aug 2022 10:11:10 +0000 (UTC)
Received: from suse.de (unknown [10.163.43.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by relay2.suse.de (Postfix) with ESMTPS id C2D002C142;
 Wed, 31 Aug 2022 10:11:04 +0000 (UTC)
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
X-Inumbo-ID: 3c86df9f-2915-11ed-bd2e-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1661940670; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=9ZcqM4yN/Uj2veB6/peO+/NOESYU9wobXvQy0yQjV4o=;
	b=Yy6RUQdM9jmsAxglplkxXX5ltqNnErSYCX9NG/KP34nto93gbhP8A03TGq2nPa/LvHZzml
	btOJNLDHOI9hpuLsLjm09qtoqhoSAt44HVPsOPOvmrViCmO/bUFitzMEPHx5x2KSfVOCD4
	vfr1uon403pQHuoUNgbpFaM/H1r2Wf8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1661940670;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=9ZcqM4yN/Uj2veB6/peO+/NOESYU9wobXvQy0yQjV4o=;
	b=KUiIFlqbF9LwRuhv7UYrcQNDomt2Z2X+zy/MToMnTER4Y3BnTVv72LaVQ5k1u0/+kR20Pu
	NSrzG7KAdz5wpiBA==
Date: Wed, 31 Aug 2022 11:11:03 +0100
From: Mel Gorman <mgorman@suse.de>
To: Suren Baghdasaryan <surenb@google.com>
Cc: akpm@linux-foundation.org, kent.overstreet@linux.dev, mhocko@suse.com,
	vbabka@suse.cz, hannes@cmpxchg.org, roman.gushchin@linux.dev,
	dave@stgolabs.net, willy@infradead.org, liam.howlett@oracle.com,
	void@manifault.com, peterz@infradead.org, juri.lelli@redhat.com,
	ldufour@linux.ibm.com, peterx@redhat.com, david@redhat.com,
	axboe@kernel.dk, mcgrof@kernel.org, masahiroy@kernel.org,
	nathan@kernel.org, changbin.du@intel.com, ytcoode@gmail.com,
	vincent.guittot@linaro.org, dietmar.eggemann@arm.com,
	rostedt@goodmis.org, bsegall@google.com, bristot@redhat.com,
	vschneid@redhat.com, cl@linux.com, penberg@kernel.org,
	iamjoonsoo.kim@lge.com, 42.hyeyoo@gmail.com, glider@google.com,
	elver@google.com, dvyukov@google.com, shakeelb@google.com,
	songmuchun@bytedance.com, arnd@arndb.de, jbaron@akamai.com,
	rientjes@google.com, minchan@google.com, kaleshsingh@google.com,
	kernel-team@android.com, linux-mm@kvack.org, iommu@lists.linux.dev,
	kasan-dev@googlegroups.com, io-uring@vger.kernel.org,
	linux-arch@vger.kernel.org, xen-devel@lists.xenproject.org,
	linux-bcache@vger.kernel.org, linux-modules@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH 10/30] mm: enable page allocation tagging for
 __get_free_pages and alloc_pages
Message-ID: <20220831101103.fj5hjgy3dbb44fit@suse.de>
References: <20220830214919.53220-1-surenb@google.com>
 <20220830214919.53220-11-surenb@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-15
Content-Disposition: inline
In-Reply-To: <20220830214919.53220-11-surenb@google.com>

On Tue, Aug 30, 2022 at 02:48:59PM -0700, Suren Baghdasaryan wrote:
> Redefine alloc_pages, __get_free_pages to record allocations done by
> these functions. Instrument deallocation hooks to record object freeing.
> 
> Signed-off-by: Suren Baghdasaryan <surenb@google.com>
> +#ifdef CONFIG_PAGE_ALLOC_TAGGING
> +
>  #include <linux/alloc_tag.h>
>  #include <linux/page_ext.h>
>  
> @@ -25,4 +27,37 @@ static inline void pgalloc_tag_dec(struct page *page, unsigned int order)
>  		alloc_tag_sub(get_page_tag_ref(page), PAGE_SIZE << order);
>  }
>  
> +/*
> + * Redefinitions of the common page allocators/destructors
> + */
> +#define pgtag_alloc_pages(gfp, order)					\
> +({									\
> +	struct page *_page = _alloc_pages((gfp), (order));		\
> +									\
> +	if (_page)							\
> +		alloc_tag_add(get_page_tag_ref(_page), PAGE_SIZE << (order));\
> +	_page;								\
> +})
> +

Instead of renaming alloc_pages, why is the tagging not done in
__alloc_pages()? At least __alloc_pages_bulk() is also missed. The branch
can be guarded with IS_ENABLED.

> +#define pgtag_get_free_pages(gfp_mask, order)				\
> +({									\
> +	struct page *_page;						\
> +	unsigned long _res = _get_free_pages((gfp_mask), (order), &_page);\
> +									\
> +	if (_res)							\
> +		alloc_tag_add(get_page_tag_ref(_page), PAGE_SIZE << (order));\
> +	_res;								\
> +})
> +

Similar, the tagging could happen in a core function instead of a wrapper.

> +#else /* CONFIG_PAGE_ALLOC_TAGGING */
> +
> +#define pgtag_alloc_pages(gfp, order) _alloc_pages(gfp, order)
> +
> +#define pgtag_get_free_pages(gfp_mask, order) \
> +	_get_free_pages((gfp_mask), (order), NULL)
> +
> +#define pgalloc_tag_dec(__page, __size)		do {} while (0)
> +
> +#endif /* CONFIG_PAGE_ALLOC_TAGGING */
> +
>  #endif /* _LINUX_PGALLOC_TAG_H */
> diff --git a/mm/mempolicy.c b/mm/mempolicy.c
> index b73d3248d976..f7e6d9564a49 100644
> --- a/mm/mempolicy.c
> +++ b/mm/mempolicy.c
> @@ -2249,7 +2249,7 @@ EXPORT_SYMBOL(vma_alloc_folio);
>   * flags are used.
>   * Return: The page on success or NULL if allocation fails.
>   */
> -struct page *alloc_pages(gfp_t gfp, unsigned order)
> +struct page *_alloc_pages(gfp_t gfp, unsigned int order)
>  {
>  	struct mempolicy *pol = &default_policy;
>  	struct page *page;
> @@ -2273,7 +2273,7 @@ struct page *alloc_pages(gfp_t gfp, unsigned order)
>  
>  	return page;
>  }
> -EXPORT_SYMBOL(alloc_pages);
> +EXPORT_SYMBOL(_alloc_pages);
>  
>  struct folio *folio_alloc(gfp_t gfp, unsigned order)
>  {
> diff --git a/mm/page_alloc.c b/mm/page_alloc.c
> index e5486d47406e..165daba19e2a 100644
> --- a/mm/page_alloc.c
> +++ b/mm/page_alloc.c
> @@ -763,6 +763,7 @@ static inline bool pcp_allowed_order(unsigned int order)
>  
>  static inline void free_the_page(struct page *page, unsigned int order)
>  {
> +
>  	if (pcp_allowed_order(order))		/* Via pcp? */
>  		free_unref_page(page, order);
>  	else

Spurious wide-space change.

-- 
Mel Gorman
SUSE Labs

