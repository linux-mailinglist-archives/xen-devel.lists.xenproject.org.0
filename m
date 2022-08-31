Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A97215A8213
	for <lists+xen-devel@lfdr.de>; Wed, 31 Aug 2022 17:45:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.395788.635645 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oTPuF-0003AP-3C; Wed, 31 Aug 2022 15:45:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 395788.635645; Wed, 31 Aug 2022 15:45:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oTPuF-00037u-0J; Wed, 31 Aug 2022 15:45:31 +0000
Received: by outflank-mailman (input) for mailman id 395788;
 Wed, 31 Aug 2022 15:45:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=q2E5=ZD=google.com=surenb@srs-se1.protection.inumbo.net>)
 id 1oTPuD-00037o-OX
 for xen-devel@lists.xenproject.org; Wed, 31 Aug 2022 15:45:29 +0000
Received: from mail-yb1-xb2b.google.com (mail-yb1-xb2b.google.com
 [2607:f8b0:4864:20::b2b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ef9ad90f-2943-11ed-82f2-63bd783d45fa;
 Wed, 31 Aug 2022 17:45:28 +0200 (CEST)
Received: by mail-yb1-xb2b.google.com with SMTP id t184so4739990yba.4
 for <xen-devel@lists.xenproject.org>; Wed, 31 Aug 2022 08:45:28 -0700 (PDT)
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
X-Inumbo-ID: ef9ad90f-2943-11ed-82f2-63bd783d45fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=Yg5lEIxwkC8L9g2KyGsqswRBhk4gAo50nJ7nWIpcdXc=;
        b=f3+0Eh/W8OX4KuooBQ0WgBNbVwjJbAXBKTWgD/1rnSxw8Or+o0OJFGSWtlhyJfP9gD
         QCFEtC0rc3uk17x5AtGX0ukxT/fwVuDehIBS7C3A9pMG33oU0ZJGMmly+vrXS5p4by0+
         jDT69+FR9RtMW6e1SjrFZnroYNBot0xZKZX0R51jheU+mrpvrFLrGntTcPsTHaijk6mV
         iKPavpo7jboK8+tsNQ9Az/YAZSJr40a0Ai7H69DS5U2PS7wmYchRHvmW2/w/UajBDN7Y
         I8Esb137FVo77guaGTuDVZBl6klQw58Xua4rWyO6cGYeV+DdQ1NJpxEpQh+0pcY1wICS
         8E3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=Yg5lEIxwkC8L9g2KyGsqswRBhk4gAo50nJ7nWIpcdXc=;
        b=ZNkhcjE/OhJid9CE+wSNkeEV+8oh1SJ5IjPKcpwsaL5pKFdcz/GC3b+pxMqcE0t9IZ
         p8qKsglXl8MBO/omo0zAbiavWGn+0a19vJscdJ5umCmRGJrrtu8oHHOe+SqPWLb4hYde
         dclLLqoRfv5YXBBjw5MaxhO5C88O6d7ivdaqe/x0Vok+C1o5mqbb0o3lZXXxKvjRXJj5
         QTW1EUYBpmSa6JAdqgAm7cRAbBNujumMnKFHA15nRDEW28q6IC8BIZS76flKJ0YdcEc8
         eNJ1PJMlZnefd1LyoDJPoQB18ZdCtW5WWstb1LHSS9iIQcbtqC4M6ZYiJ4JW/AAfjT7I
         sZbg==
X-Gm-Message-State: ACgBeo2obFn3tPjiStQsocV5W+6GlJauaubqrXc0CwESeGb4fJlaRZyN
	5EkxLPcTC0rRJb8FIG6IXppr8uVCw1BVymOOFVle9g==
X-Google-Smtp-Source: AA6agR7eJQcze4oyVJ5u+oBz3mWkBzYq0MHuMfNSxceWOgOVlxBCkZ6NIfrADtyTqEPi+FGZK0IDnHN5ZKC4stom7pQ=
X-Received: by 2002:a05:6902:705:b0:695:b3b9:41bc with SMTP id
 k5-20020a056902070500b00695b3b941bcmr16070987ybt.426.1661960727041; Wed, 31
 Aug 2022 08:45:27 -0700 (PDT)
MIME-Version: 1.0
References: <20220830214919.53220-1-surenb@google.com> <20220830214919.53220-11-surenb@google.com>
 <20220831101103.fj5hjgy3dbb44fit@suse.de>
In-Reply-To: <20220831101103.fj5hjgy3dbb44fit@suse.de>
From: Suren Baghdasaryan <surenb@google.com>
Date: Wed, 31 Aug 2022 08:45:16 -0700
Message-ID: <CAJuCfpHwUUc_VphqBY9KmWvZJDrsBG6Za+kG_MW=J-abjuM4Lw@mail.gmail.com>
Subject: Re: [RFC PATCH 10/30] mm: enable page allocation tagging for
 __get_free_pages and alloc_pages
To: Mel Gorman <mgorman@suse.de>
Cc: Andrew Morton <akpm@linux-foundation.org>, Kent Overstreet <kent.overstreet@linux.dev>, 
	Michal Hocko <mhocko@suse.com>, Vlastimil Babka <vbabka@suse.cz>, Johannes Weiner <hannes@cmpxchg.org>, 
	Roman Gushchin <roman.gushchin@linux.dev>, Davidlohr Bueso <dave@stgolabs.net>, 
	Matthew Wilcox <willy@infradead.org>, "Liam R. Howlett" <liam.howlett@oracle.com>, 
	David Vernet <void@manifault.com>, Peter Zijlstra <peterz@infradead.org>, 
	Juri Lelli <juri.lelli@redhat.com>, Laurent Dufour <ldufour@linux.ibm.com>, 
	Peter Xu <peterx@redhat.com>, David Hildenbrand <david@redhat.com>, Jens Axboe <axboe@kernel.dk>, 
	mcgrof@kernel.org, masahiroy@kernel.org, nathan@kernel.org, 
	changbin.du@intel.com, ytcoode@gmail.com, 
	Vincent Guittot <vincent.guittot@linaro.org>, Dietmar Eggemann <dietmar.eggemann@arm.com>, 
	Steven Rostedt <rostedt@goodmis.org>, Benjamin Segall <bsegall@google.com>, 
	Daniel Bristot de Oliveira <bristot@redhat.com>, Valentin Schneider <vschneid@redhat.com>, 
	Christopher Lameter <cl@linux.com>, Pekka Enberg <penberg@kernel.org>, Joonsoo Kim <iamjoonsoo.kim@lge.com>, 
	42.hyeyoo@gmail.com, Alexander Potapenko <glider@google.com>, Marco Elver <elver@google.com>, 
	dvyukov@google.com, Shakeel Butt <shakeelb@google.com>, 
	Muchun Song <songmuchun@bytedance.com>, arnd@arndb.de, jbaron@akamai.com, 
	David Rientjes <rientjes@google.com>, Minchan Kim <minchan@google.com>, 
	Kalesh Singh <kaleshsingh@google.com>, kernel-team <kernel-team@android.com>, 
	linux-mm <linux-mm@kvack.org>, iommu@lists.linux.dev, kasan-dev@googlegroups.com, 
	io-uring@vger.kernel.org, linux-arch@vger.kernel.org, 
	xen-devel@lists.xenproject.org, linux-bcache@vger.kernel.org, 
	linux-modules@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, Aug 31, 2022 at 3:11 AM Mel Gorman <mgorman@suse.de> wrote:
>
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
> >               alloc_tag_sub(get_page_tag_ref(page), PAGE_SIZE << order);
> >  }
> >
> > +/*
> > + * Redefinitions of the common page allocators/destructors
> > + */
> > +#define pgtag_alloc_pages(gfp, order)                                        \
> > +({                                                                   \
> > +     struct page *_page = _alloc_pages((gfp), (order));              \
> > +                                                                     \
> > +     if (_page)                                                      \
> > +             alloc_tag_add(get_page_tag_ref(_page), PAGE_SIZE << (order));\
> > +     _page;                                                          \
> > +})
> > +
>
> Instead of renaming alloc_pages, why is the tagging not done in
> __alloc_pages()? At least __alloc_pages_bulk() is also missed. The branch
> can be guarded with IS_ENABLED.

Hmm. Assuming all the other allocators using __alloc_pages are inlined, that
should work. I'll try that and if that works will incorporate in the
next respin.
Thanks!

I don't think IS_ENABLED is required because the tagging functions are already
defined as empty if the appropriate configs are not enabled. Unless I
misunderstood
your node.

>
> > +#define pgtag_get_free_pages(gfp_mask, order)                                \
> > +({                                                                   \
> > +     struct page *_page;                                             \
> > +     unsigned long _res = _get_free_pages((gfp_mask), (order), &_page);\
> > +                                                                     \
> > +     if (_res)                                                       \
> > +             alloc_tag_add(get_page_tag_ref(_page), PAGE_SIZE << (order));\
> > +     _res;                                                           \
> > +})
> > +
>
> Similar, the tagging could happen in a core function instead of a wrapper.
>
> > +#else /* CONFIG_PAGE_ALLOC_TAGGING */
> > +
> > +#define pgtag_alloc_pages(gfp, order) _alloc_pages(gfp, order)
> > +
> > +#define pgtag_get_free_pages(gfp_mask, order) \
> > +     _get_free_pages((gfp_mask), (order), NULL)
> > +
> > +#define pgalloc_tag_dec(__page, __size)              do {} while (0)
> > +
> > +#endif /* CONFIG_PAGE_ALLOC_TAGGING */
> > +
> >  #endif /* _LINUX_PGALLOC_TAG_H */
> > diff --git a/mm/mempolicy.c b/mm/mempolicy.c
> > index b73d3248d976..f7e6d9564a49 100644
> > --- a/mm/mempolicy.c
> > +++ b/mm/mempolicy.c
> > @@ -2249,7 +2249,7 @@ EXPORT_SYMBOL(vma_alloc_folio);
> >   * flags are used.
> >   * Return: The page on success or NULL if allocation fails.
> >   */
> > -struct page *alloc_pages(gfp_t gfp, unsigned order)
> > +struct page *_alloc_pages(gfp_t gfp, unsigned int order)
> >  {
> >       struct mempolicy *pol = &default_policy;
> >       struct page *page;
> > @@ -2273,7 +2273,7 @@ struct page *alloc_pages(gfp_t gfp, unsigned order)
> >
> >       return page;
> >  }
> > -EXPORT_SYMBOL(alloc_pages);
> > +EXPORT_SYMBOL(_alloc_pages);
> >
> >  struct folio *folio_alloc(gfp_t gfp, unsigned order)
> >  {
> > diff --git a/mm/page_alloc.c b/mm/page_alloc.c
> > index e5486d47406e..165daba19e2a 100644
> > --- a/mm/page_alloc.c
> > +++ b/mm/page_alloc.c
> > @@ -763,6 +763,7 @@ static inline bool pcp_allowed_order(unsigned int order)
> >
> >  static inline void free_the_page(struct page *page, unsigned int order)
> >  {
> > +
> >       if (pcp_allowed_order(order))           /* Via pcp? */
> >               free_unref_page(page, order);
> >       else
>
> Spurious wide-space change.
>
> --
> Mel Gorman
> SUSE Labs

