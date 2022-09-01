Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 015BA5A8D10
	for <lists+xen-devel@lfdr.de>; Thu,  1 Sep 2022 07:06:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.396205.636259 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oTcOd-0004Ck-R9; Thu, 01 Sep 2022 05:05:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 396205.636259; Thu, 01 Sep 2022 05:05:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oTcOd-0004Aw-N9; Thu, 01 Sep 2022 05:05:43 +0000
Received: by outflank-mailman (input) for mailman id 396205;
 Thu, 01 Sep 2022 05:05:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=86q5=ZE=google.com=surenb@srs-se1.protection.inumbo.net>)
 id 1oTcOb-0004Aq-Vo
 for xen-devel@lists.xenproject.org; Thu, 01 Sep 2022 05:05:42 +0000
Received: from mail-yw1-x1129.google.com (mail-yw1-x1129.google.com
 [2607:f8b0:4864:20::1129])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b920f14f-29b3-11ed-82f2-63bd783d45fa;
 Thu, 01 Sep 2022 07:05:40 +0200 (CEST)
Received: by mail-yw1-x1129.google.com with SMTP id
 00721157ae682-324ec5a9e97so325787997b3.7
 for <xen-devel@lists.xenproject.org>; Wed, 31 Aug 2022 22:05:40 -0700 (PDT)
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
X-Inumbo-ID: b920f14f-29b3-11ed-82f2-63bd783d45fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=ktZOhU9M+eiBxoPfSKrBwsk5VZxY64ML34Vei/rqz2s=;
        b=UnvyXVMIRiciK0rqi4Rla4SS9BjEhBuxvGCuhtbiGji3fDuHUeDlC2C4TbCLRZRSwR
         +328Kj0pV/r/xNPqU1581dA9M6WZOvrs39FcqOg6hNQT5ifEu0MLEP+Zz/2G+jRm7WMN
         7axpEQrwYULoaAc5UOWeK4pidUhWzYApn91X0NwQTEXfOOrYw3wXsfjb2f2S21BvY7t3
         Zg1V8M6rEvRQMEwY0dY+iYzvNIKUl0aPxff0C2lbwvD8YaEzrAOwphxkhABpA5cqFwfx
         wpTyALvpTmRkdUhm9RVjdaatnoaqYeLhUBKhA4+4MYeMDI/E+7MF6YajUpv+RJVJmtfD
         MOWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=ktZOhU9M+eiBxoPfSKrBwsk5VZxY64ML34Vei/rqz2s=;
        b=ok2Y1ZcBzssYxMgjRC9mDrLtVAu/eNbP37+GBW2rfaAVDeDYyBJU3kjfjZ4mHQjfX0
         dPKCsYtbSOqILMrWf/6QGKkCm4p/xohjV0zvKA3+pvzw5T+UAinLsU04zHTsrsl3E3qS
         G/g1qCjgrkq8X2z9mw6Ekc78TSMS0td44yrO5hnUiimNNB6+0stGgQXN4LsDb1nVJaYS
         5Jwp/VBisHI2zrzkUWj4bjNVbKo/VraoBNtlQ3JCPpfJDIFJ67QaPl9Hqnv1/D/GGK7G
         THcb3eyqgIHuvqLq8KYXab4YMzRiB1g8AMVRYQyvjtk7oiKuQbhxPkQxi6VjB/KKp6yr
         Ya6A==
X-Gm-Message-State: ACgBeo2mwTKHHMT1LTN9hQEDnNYP+rYFR5H1gi48fez4Xu+jCKn/UDpF
	mM9OOJvyn7uNsRpYEIVjSJO5MQZbuV/N7yHnPYNScA==
X-Google-Smtp-Source: AA6agR6X7FU4pvrjt5vMDUM/DC2IsE6vILG7I4DBJ25hoCu+6BelY82RpFQkl53Zm+EyPsuJsyRbi+nPLdvdkyesITk=
X-Received: by 2002:a81:a04c:0:b0:340:4c27:dfc6 with SMTP id
 x73-20020a81a04c000000b003404c27dfc6mr20996289ywg.507.1662008739346; Wed, 31
 Aug 2022 22:05:39 -0700 (PDT)
MIME-Version: 1.0
References: <20220830214919.53220-1-surenb@google.com> <YxA6pCu0YNIiXkHf@localhost.localdomain>
In-Reply-To: <YxA6pCu0YNIiXkHf@localhost.localdomain>
From: Suren Baghdasaryan <surenb@google.com>
Date: Wed, 31 Aug 2022 22:05:28 -0700
Message-ID: <CAJuCfpGxB0z1V1Vau3bXF9eHZVHnANdA7keMzCLUK+_gN6+HeA@mail.gmail.com>
Subject: Re: [RFC PATCH 00/30] Code tagging framework and applications
To: Oscar Salvador <osalvador@suse.de>
Cc: Andrew Morton <akpm@linux-foundation.org>, Kent Overstreet <kent.overstreet@linux.dev>, 
	Michal Hocko <mhocko@suse.com>, Vlastimil Babka <vbabka@suse.cz>, Johannes Weiner <hannes@cmpxchg.org>, 
	Roman Gushchin <roman.gushchin@linux.dev>, Mel Gorman <mgorman@suse.de>, 
	Davidlohr Bueso <dave@stgolabs.net>, Matthew Wilcox <willy@infradead.org>, 
	"Liam R. Howlett" <liam.howlett@oracle.com>, David Vernet <void@manifault.com>, 
	Peter Zijlstra <peterz@infradead.org>, Juri Lelli <juri.lelli@redhat.com>, 
	Laurent Dufour <ldufour@linux.ibm.com>, Peter Xu <peterx@redhat.com>, 
	David Hildenbrand <david@redhat.com>, Jens Axboe <axboe@kernel.dk>, mcgrof@kernel.org, 
	masahiroy@kernel.org, nathan@kernel.org, ytcoode@gmail.com, 
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

On Wed, Aug 31, 2022 at 9:52 PM Oscar Salvador <osalvador@suse.de> wrote:
>
> On Tue, Aug 30, 2022 at 02:48:49PM -0700, Suren Baghdasaryan wrote:
> > ===========================
> > Code tagging framework
> > ===========================
> > Code tag is a structure identifying a specific location in the source code
> > which is generated at compile time and can be embedded in an application-
> > specific structure. Several applications of code tagging are included in
> > this RFC, such as memory allocation tracking, dynamic fault injection,
> > latency tracking and improved error code reporting.
> > Basically, it takes the old trick of "define a special elf section for
> > objects of a given type so that we can iterate over them at runtime" and
> > creates a proper library for it.
> >
> > ===========================
> > Memory allocation tracking
> > ===========================
> > The goal for using codetags for memory allocation tracking is to minimize
> > performance and memory overhead. By recording only the call count and
> > allocation size, the required operations are kept at the minimum while
> > collecting statistics for every allocation in the codebase. With that
> > information, if users are interested in mode detailed context for a
> > specific allocation, they can enable more in-depth context tracking,
> > which includes capturing the pid, tgid, task name, allocation size,
> > timestamp and call stack for every allocation at the specified code
> > location.
> > Memory allocation tracking is implemented in two parts:
> >
> > part1: instruments page and slab allocators to record call count and total
> > memory allocated at every allocation in the source code. Every time an
> > allocation is performed by an instrumented allocator, the codetag at that
> > location increments its call and size counters. Every time the memory is
> > freed these counters are decremented. To decrement the counters upon free,
> > allocated object needs a reference to its codetag. Page allocators use
> > page_ext to record this reference while slab allocators use memcg_data of
> > the slab page.
> > The data is exposed to the user space via a read-only debugfs file called
> > alloc_tags.
>
> Hi Suren,
>
> I just posted a patch [1] and reading through your changelog and seeing your PoC,
> I think we have some kind of overlap.
> My patchset aims to give you the stacktrace <-> relationship information and it is
> achieved by a little amount of extra code mostly in page_owner.c/ and lib/stackdepot.
>
> Of course, your works seems to be more complete wrt. the information you get.
>
> I CCed you in case you want to have a look
>
> [1] https://lkml.org/lkml/2022/9/1/36

Hi Oscar,
Thanks for the note. I'll take a look most likely on Friday and will
follow up with you.
Thanks,
Suren.

>
> Thanks
>
>
> --
> Oscar Salvador
> SUSE Labs

