Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 418E95A8A49
	for <lists+xen-devel@lfdr.de>; Thu,  1 Sep 2022 03:08:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.396145.636171 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oTYgY-0002xb-S3; Thu, 01 Sep 2022 01:07:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 396145.636171; Thu, 01 Sep 2022 01:07:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oTYgY-0002uO-Ow; Thu, 01 Sep 2022 01:07:58 +0000
Received: by outflank-mailman (input) for mailman id 396145;
 Thu, 01 Sep 2022 01:07:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=86q5=ZE=google.com=surenb@srs-se1.protection.inumbo.net>)
 id 1oTYgX-0002uI-8V
 for xen-devel@lists.xenproject.org; Thu, 01 Sep 2022 01:07:57 +0000
Received: from mail-yb1-xb30.google.com (mail-yb1-xb30.google.com
 [2607:f8b0:4864:20::b30])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 826c974b-2992-11ed-934f-f50d60e1c1bd;
 Thu, 01 Sep 2022 03:07:55 +0200 (CEST)
Received: by mail-yb1-xb30.google.com with SMTP id p204so6579183yba.3
 for <xen-devel@lists.xenproject.org>; Wed, 31 Aug 2022 18:07:55 -0700 (PDT)
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
X-Inumbo-ID: 826c974b-2992-11ed-934f-f50d60e1c1bd
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=MRPzoJhQ6jRX3IlC8DX7IgvLpQbZlMnsgnvZKuuei8w=;
        b=FN6oNUdWK/epLWx1TsL9yA3judc8GEWbPUlFBZx3N+obm1zvmXwKLTgA0C+din1hae
         QL+aeoxudtTxFElhfOjbFrb5XsjBAilaB08Ldofl1XN7K/KLlXYDWHTq4s13vSXmuj5f
         DKOIAo7JDYtLr+88kw7IWfUfQEtwzvbREYO0F51ITJHJcS5BlsMkaJFVMWN04WfbWge0
         QaMLxE28PQcRoEcCdCRT5hYYcc5qJq1t6S50Lj3dBP+TXgyTlXN6pUj2nAiR7uqNJFnz
         LBjn/+WoYkZm8EFAaPai3sk01dRp3NFnU9eS/Pc/JsqSX+SuHO7G2QXvivbbuPpvEXP7
         8nRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=MRPzoJhQ6jRX3IlC8DX7IgvLpQbZlMnsgnvZKuuei8w=;
        b=u4ail2qdqQyUaKx+TELG+9hmzA6SZUdzd7w+sF/IihaU8XF8aH3zBn911K6jVerDx+
         Z8WmouBa9qWFATlqjvJCmsLTjlQJJI9ceDD03JCv4sN3GNxU1eIIczKfH80G/BavJ5Eq
         15acQgSzkh28UCJIKwAbQwclnJ6/wheyA9BV0G3H2X1BDHHRq3BbwOpULCAVLwfB7ISN
         AMO5BcBOskGZxkC/xscZcAoOnwwyVlMOsyg2HTlsI4jKr8QcRV5xb/iVuwVPbOyqSFBv
         1RjTEgfREm4bVCwB+88CZzDTG1caEkgwhHDgtNcUCWDbxe6wo5Jxxa6cSEQGSwP9lh/j
         MH7A==
X-Gm-Message-State: ACgBeo12YTUtayOVKgdYQerve9n1d7eQaEx3YXiOmVQvfy4H+WV5oy5G
	eMOqqbYGaeNby0IeLnYATsh6jxSR2HI2TW4eiZV+tQ==
X-Google-Smtp-Source: AA6agR7ANRZu1y3V5ec1pN1knn4GFpXcEWezad8yEa+jyRtwuxFDik/95LNfhWenWi2n9p8vw7Ebn9CJDR6Mcs4MSyE=
X-Received: by 2002:a05:6902:4c7:b0:69a:9e36:debe with SMTP id
 v7-20020a05690204c700b0069a9e36debemr14531815ybs.543.1661994474639; Wed, 31
 Aug 2022 18:07:54 -0700 (PDT)
MIME-Version: 1.0
References: <20220830214919.53220-1-surenb@google.com> <20220830214919.53220-11-surenb@google.com>
 <20220831101103.fj5hjgy3dbb44fit@suse.de> <20220831174629.zpa2pu6hpxmytqya@moria.home.lan>
In-Reply-To: <20220831174629.zpa2pu6hpxmytqya@moria.home.lan>
From: Suren Baghdasaryan <surenb@google.com>
Date: Wed, 31 Aug 2022 18:07:43 -0700
Message-ID: <CAJuCfpGxxzHT7X+q2zzu+WRrmyjLsT+RMJ7+LFOECtFuXvt3gA@mail.gmail.com>
Subject: Re: [RFC PATCH 10/30] mm: enable page allocation tagging for
 __get_free_pages and alloc_pages
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: Mel Gorman <mgorman@suse.de>, Andrew Morton <akpm@linux-foundation.org>, 
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

On Wed, Aug 31, 2022 at 10:46 AM Kent Overstreet
<kent.overstreet@linux.dev> wrote:
>
> On Wed, Aug 31, 2022 at 11:11:03AM +0100, Mel Gorman wrote:
> > On Tue, Aug 30, 2022 at 02:48:59PM -0700, Suren Baghdasaryan wrote:
> > > Redefine alloc_pages, __get_free_pages to record allocations done by
> > > these functions. Instrument deallocation hooks to record object freeing.
> > >
> > > Signed-off-by: Suren Baghdasaryan <surenb@google.com>
> > > +#ifdef CONFIG_PAGE_ALLOC_TAGGING
> > > +
> > >  #include <linux/alloc_tag.h>
> > >  #include <linux/page_ext.h>
> > >
> > > @@ -25,4 +27,37 @@ static inline void pgalloc_tag_dec(struct page *page, unsigned int order)
> > >             alloc_tag_sub(get_page_tag_ref(page), PAGE_SIZE << order);
> > >  }
> > >
> > > +/*
> > > + * Redefinitions of the common page allocators/destructors
> > > + */
> > > +#define pgtag_alloc_pages(gfp, order)                                      \
> > > +({                                                                 \
> > > +   struct page *_page = _alloc_pages((gfp), (order));              \
> > > +                                                                   \
> > > +   if (_page)                                                      \
> > > +           alloc_tag_add(get_page_tag_ref(_page), PAGE_SIZE << (order));\
> > > +   _page;                                                          \
> > > +})
> > > +
> >
> > Instead of renaming alloc_pages, why is the tagging not done in
> > __alloc_pages()? At least __alloc_pages_bulk() is also missed. The branch
> > can be guarded with IS_ENABLED.
>
> It can't be in a function, it has to be in a wrapper macro.

Ah, right. __FILE__, __LINE__ and others we use to record the call
location would point to include/linux/gfp.h instead of the location
allocation is performed at.

>
> alloc_tag_add() is a macro that defines a static struct in a special elf
> section. That struct holds the allocation counters, and putting it in a special
> elf section is how the code to list it in debugfs finds it.
>
> Look at the dynamic debug code for prior precedence for this trick in the kernel
> - that's how it makes pr_debug() calls dynamically controllable at runtime, from
> debugfs. We're taking that method and turning it into a proper library.
>
> Because all the counters are statically allocated, without even a pointer deref
> to get to them in the allocation path (one pointer deref to get to them in the
> deallocate path), that makes this _much, much_ cheaper than anything that could
> be done with tracing - cheap enough that I expect many users will want to enable
> it in production.
>
> --
> To unsubscribe from this group and stop receiving emails from it, send an email to kernel-team+unsubscribe@android.com.
>

