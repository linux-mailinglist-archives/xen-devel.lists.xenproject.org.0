Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C39E5A84AC
	for <lists+xen-devel@lfdr.de>; Wed, 31 Aug 2022 19:47:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.395988.635905 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oTRnU-0002Dv-KE; Wed, 31 Aug 2022 17:46:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 395988.635905; Wed, 31 Aug 2022 17:46:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oTRnU-0002Ar-HJ; Wed, 31 Aug 2022 17:46:40 +0000
Received: by outflank-mailman (input) for mailman id 395988;
 Wed, 31 Aug 2022 17:46:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=E34P=ZD=linux.dev=kent.overstreet@srs-se1.protection.inumbo.net>)
 id 1oTRnT-0002Al-Hr
 for xen-devel@lists.xenproject.org; Wed, 31 Aug 2022 17:46:39 +0000
Received: from out2.migadu.com (out2.migadu.com [2001:41d0:2:aacc::])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id dc9b3835-2954-11ed-82f2-63bd783d45fa;
 Wed, 31 Aug 2022 19:46:37 +0200 (CEST)
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
X-Inumbo-ID: dc9b3835-2954-11ed-82f2-63bd783d45fa
Date: Wed, 31 Aug 2022 13:46:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1661967996;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=cNGQu2INYppvwn/vrI+H9fLNjZAQ9LEc2ZMlyG9+b7I=;
	b=UvGgvRFFFCjI/MJ+R56HoYOSRVpisoRSFrlM+Tnr28bYpzjswOUst1RZvoLN2iOla1UOYk
	AhrqjPYHyPNC9OtSTSv8bCcogGpeWso0AVnHwUd3AWn+b9IVre9e619KvqRphXZ15fsktW
	AqO9MlFcMAgNkcSNSSA7HGEzQFUhYiE=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Kent Overstreet <kent.overstreet@linux.dev>
To: Mel Gorman <mgorman@suse.de>
Cc: Suren Baghdasaryan <surenb@google.com>, akpm@linux-foundation.org,
	mhocko@suse.com, vbabka@suse.cz, hannes@cmpxchg.org,
	roman.gushchin@linux.dev, dave@stgolabs.net, willy@infradead.org,
	liam.howlett@oracle.com, void@manifault.com, peterz@infradead.org,
	juri.lelli@redhat.com, ldufour@linux.ibm.com, peterx@redhat.com,
	david@redhat.com, axboe@kernel.dk, mcgrof@kernel.org,
	masahiroy@kernel.org, nathan@kernel.org, changbin.du@intel.com,
	ytcoode@gmail.com, vincent.guittot@linaro.org,
	dietmar.eggemann@arm.com, rostedt@goodmis.org, bsegall@google.com,
	bristot@redhat.com, vschneid@redhat.com, cl@linux.com,
	penberg@kernel.org, iamjoonsoo.kim@lge.com, 42.hyeyoo@gmail.com,
	glider@google.com, elver@google.com, dvyukov@google.com,
	shakeelb@google.com, songmuchun@bytedance.com, arnd@arndb.de,
	jbaron@akamai.com, rientjes@google.com, minchan@google.com,
	kaleshsingh@google.com, kernel-team@android.com, linux-mm@kvack.org,
	iommu@lists.linux.dev, kasan-dev@googlegroups.com,
	io-uring@vger.kernel.org, linux-arch@vger.kernel.org,
	xen-devel@lists.xenproject.org, linux-bcache@vger.kernel.org,
	linux-modules@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH 10/30] mm: enable page allocation tagging for
 __get_free_pages and alloc_pages
Message-ID: <20220831174629.zpa2pu6hpxmytqya@moria.home.lan>
References: <20220830214919.53220-1-surenb@google.com>
 <20220830214919.53220-11-surenb@google.com>
 <20220831101103.fj5hjgy3dbb44fit@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220831101103.fj5hjgy3dbb44fit@suse.de>
X-Migadu-Flow: FLOW_OUT
X-Migadu-Auth-User: linux.dev

On Wed, Aug 31, 2022 at 11:11:03AM +0100, Mel Gorman wrote:
> On Tue, Aug 30, 2022 at 02:48:59PM -0700, Suren Baghdasaryan wrote:
> > Redefine alloc_pages, __get_free_pages to record allocations done by
> > these functions. Instrument deallocation hooks to record object freeing.
> > 
> > Signed-off-by: Suren Baghdasaryan <surenb@google.com>
> > +#ifdef CONFIG_PAGE_ALLOC_TAGGING
> > +
> >  #include <linux/alloc_tag.h>
> >  #include <linux/page_ext.h>
> >  
> > @@ -25,4 +27,37 @@ static inline void pgalloc_tag_dec(struct page *page, unsigned int order)
> >  		alloc_tag_sub(get_page_tag_ref(page), PAGE_SIZE << order);
> >  }
> >  
> > +/*
> > + * Redefinitions of the common page allocators/destructors
> > + */
> > +#define pgtag_alloc_pages(gfp, order)					\
> > +({									\
> > +	struct page *_page = _alloc_pages((gfp), (order));		\
> > +									\
> > +	if (_page)							\
> > +		alloc_tag_add(get_page_tag_ref(_page), PAGE_SIZE << (order));\
> > +	_page;								\
> > +})
> > +
> 
> Instead of renaming alloc_pages, why is the tagging not done in
> __alloc_pages()? At least __alloc_pages_bulk() is also missed. The branch
> can be guarded with IS_ENABLED.

It can't be in a function, it has to be in a wrapper macro.

alloc_tag_add() is a macro that defines a static struct in a special elf
section. That struct holds the allocation counters, and putting it in a special
elf section is how the code to list it in debugfs finds it.

Look at the dynamic debug code for prior precedence for this trick in the kernel
- that's how it makes pr_debug() calls dynamically controllable at runtime, from
debugfs. We're taking that method and turning it into a proper library.

Because all the counters are statically allocated, without even a pointer deref
to get to them in the allocation path (one pointer deref to get to them in the
deallocate path), that makes this _much, much_ cheaper than anything that could
be done with tracing - cheap enough that I expect many users will want to enable
it in production.

