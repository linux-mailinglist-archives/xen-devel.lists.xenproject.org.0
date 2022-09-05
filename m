Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CEBF75ACE81
	for <lists+xen-devel@lfdr.de>; Mon,  5 Sep 2022 11:06:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.398608.639488 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oV83X-0008Vs-6L; Mon, 05 Sep 2022 09:06:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 398608.639488; Mon, 05 Sep 2022 09:06:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oV83X-0008T3-3E; Mon, 05 Sep 2022 09:06:11 +0000
Received: by outflank-mailman (input) for mailman id 398608;
 Mon, 05 Sep 2022 08:58:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=TdXK=ZI=google.com=elver@srs-se1.protection.inumbo.net>)
 id 1oV7wG-0007Xm-0V
 for xen-devel@lists.xenproject.org; Mon, 05 Sep 2022 08:58:40 +0000
Received: from mail-yw1-x112b.google.com (mail-yw1-x112b.google.com
 [2607:f8b0:4864:20::112b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ee84a329-2cf8-11ed-af93-0125da4c0113;
 Mon, 05 Sep 2022 10:58:39 +0200 (CEST)
Received: by mail-yw1-x112b.google.com with SMTP id
 00721157ae682-3454e58fe53so7705057b3.2
 for <xen-devel@lists.xenproject.org>; Mon, 05 Sep 2022 01:58:38 -0700 (PDT)
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
X-Inumbo-ID: ee84a329-2cf8-11ed-af93-0125da4c0113
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=Mcscb+4yg14w1rBiRtYpdW9I8YuY8tTeWXrlK9wFWrU=;
        b=Z8sZwX0UrQNHUyE15uUzUljN1G5+XUXWn7ozlWkNQaPS0v+13+PWoolzvMZEH/2/s6
         LYS6ZELiyvlMT62CZWUyH+h/p1jXfwfZLcOF83nbGfa1U5bzWw0uJywA1Nq6g4RggQN9
         M+azNg9wtAjIuHGBIaj/LBqqtGG4wC1BksRWLrapbeVhca09DWdw9aO+S7lkiOmT419k
         B7LBrz0EVZ5dFwwSikfSkFiCRf8G7DmN1ptEdy0ZLUUkT5MXom1MAu8JaMJrJbPX6xsQ
         z/gVg/ZkLNO66Ao9RVZbmyzaUupGI6+7kFaD3U0bHdpOYObc1T0hLgrkbVZFP/rVpApA
         /zsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=Mcscb+4yg14w1rBiRtYpdW9I8YuY8tTeWXrlK9wFWrU=;
        b=Iq+/5DXEZJcLcLXzKp1pt5J3gLvOfIjcoAPWU55djvQPgcZOoq6sTAQGcq464RAlVK
         pmvfkqFFLljZVqWISoayGBFE/fY7bVygUWwUdiCDn2eYjm/Uk3DFJ0uBLJKHBMelO3hU
         Tg80rVmTH71yeXtC9wmsX8fOf7EUAmaxZhH/Yh798rBXXMJLhxhygvhG1w+PS+ON8Dlr
         irL9uNUOJe54Cmt7B8Zdmovtz/tds46OEHeCHPU2kC8xSKflDpg3B8Aajt14Kq9A5B2v
         g/S5wjgcS9IRn6uTBY+r2yGTciE/EJOuaKu6wW7cuoLCf9nV/I8X6TwVNZvXG4ENC9py
         5lRg==
X-Gm-Message-State: ACgBeo3vsFq1pBNw0iiYIt40KSRSwkS9OJAIxonzvq0Np38dsB7MjcB/
	7rlRTI+K9gU6G/aXLR+ToHuggyAT1W5AkRTWWk4onw==
X-Google-Smtp-Source: AA6agR4vColk4VOoxJ3aA1AZBZ3YZkQTsja6zG5W+nyEUjeTUXHJb0eacFw2AD+E2b0jt8egp4/3QX6cb8SK35bLOpk=
X-Received: by 2002:a81:bb41:0:b0:328:fd1b:5713 with SMTP id
 a1-20020a81bb41000000b00328fd1b5713mr38838381ywl.238.1662368317652; Mon, 05
 Sep 2022 01:58:37 -0700 (PDT)
MIME-Version: 1.0
References: <20220830214919.53220-1-surenb@google.com> <Yw8P8xZ4zqu121xL@hirez.programming.kicks-ass.net>
 <20220831084230.3ti3vitrzhzsu3fs@moria.home.lan> <20220831101948.f3etturccmp5ovkl@suse.de>
 <Yw88RFuBgc7yFYxA@dhcp22.suse.cz> <20220831190154.qdlsxfamans3ya5j@moria.home.lan>
 <YxBc1xuGbB36f8zC@dhcp22.suse.cz> <CAJuCfpGhwPFYdkOLjwwD4ra9JxPqq1T5d1jd41Jy3LJnVnhNdg@mail.gmail.com>
 <YxEE1vOwRPdzKxoq@dhcp22.suse.cz> <CAJuCfpFrRwXXQ=wAvZ-oUNKXUJ=uUA=fiDrkhRu5VGXcM+=cuA@mail.gmail.com>
 <YxWvbMYLkPoJrQyr@dhcp22.suse.cz>
In-Reply-To: <YxWvbMYLkPoJrQyr@dhcp22.suse.cz>
From: Marco Elver <elver@google.com>
Date: Mon, 5 Sep 2022 10:58:01 +0200
Message-ID: <CANpmjNOYNWSSiV+VzvzBAeDJX+c1DRP+6jedKMt3gLNg8bgWKA@mail.gmail.com>
Subject: Re: [RFC PATCH 00/30] Code tagging framework and applications
To: Michal Hocko <mhocko@suse.com>
Cc: Suren Baghdasaryan <surenb@google.com>, Kent Overstreet <kent.overstreet@linux.dev>, 
	Mel Gorman <mgorman@suse.de>, Peter Zijlstra <peterz@infradead.org>, 
	Andrew Morton <akpm@linux-foundation.org>, Vlastimil Babka <vbabka@suse.cz>, 
	Johannes Weiner <hannes@cmpxchg.org>, Roman Gushchin <roman.gushchin@linux.dev>, 
	Davidlohr Bueso <dave@stgolabs.net>, Matthew Wilcox <willy@infradead.org>, 
	"Liam R. Howlett" <liam.howlett@oracle.com>, David Vernet <void@manifault.com>, 
	Juri Lelli <juri.lelli@redhat.com>, Laurent Dufour <ldufour@linux.ibm.com>, 
	Peter Xu <peterx@redhat.com>, David Hildenbrand <david@redhat.com>, Jens Axboe <axboe@kernel.dk>, 
	mcgrof@kernel.org, masahiroy@kernel.org, nathan@kernel.org, 
	changbin.du@intel.com, ytcoode@gmail.com, 
	Vincent Guittot <vincent.guittot@linaro.org>, Dietmar Eggemann <dietmar.eggemann@arm.com>, 
	Steven Rostedt <rostedt@goodmis.org>, Benjamin Segall <bsegall@google.com>, 
	Daniel Bristot de Oliveira <bristot@redhat.com>, Valentin Schneider <vschneid@redhat.com>, 
	Christopher Lameter <cl@linux.com>, Pekka Enberg <penberg@kernel.org>, Joonsoo Kim <iamjoonsoo.kim@lge.com>, 
	42.hyeyoo@gmail.com, Alexander Potapenko <glider@google.com>, Dmitry Vyukov <dvyukov@google.com>, 
	Shakeel Butt <shakeelb@google.com>, Muchun Song <songmuchun@bytedance.com>, arnd@arndb.de, 
	jbaron@akamai.com, David Rientjes <rientjes@google.com>, Minchan Kim <minchan@google.com>, 
	Kalesh Singh <kaleshsingh@google.com>, kernel-team <kernel-team@android.com>, 
	linux-mm <linux-mm@kvack.org>, iommu@lists.linux.dev, kasan-dev@googlegroups.com, 
	io-uring@vger.kernel.org, linux-arch@vger.kernel.org, 
	xen-devel@lists.xenproject.org, linux-bcache@vger.kernel.org, 
	linux-modules@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, 5 Sept 2022 at 10:12, Michal Hocko <mhocko@suse.com> wrote:
> On Sun 04-09-22 18:32:58, Suren Baghdasaryan wrote:
> > On Thu, Sep 1, 2022 at 12:15 PM Michal Hocko <mhocko@suse.com> wrote:
> [...]
> > > Yes, tracking back the call trace would be really needed. The question
> > > is whether this is really prohibitively expensive. How much overhead are
> > > we talking about? There is no free lunch here, really.  You either have
> > > the overhead during runtime when the feature is used or on the source
> > > code level for all the future development (with a maze of macros and
> > > wrappers).
> >
> > As promised, I profiled a simple code that repeatedly makes 10
> > allocations/frees in a loop and measured overheads of code tagging,
> > call stack capturing and tracing+BPF for page and slab allocations.
> > Summary:
> >
> > Page allocations (overheads are compared to get_free_pages() duration):
> > 6.8% Codetag counter manipulations (__lazy_percpu_counter_add + __alloc_tag_add)
> > 8.8% lookup_page_ext
> > 1237% call stack capture
> > 139% tracepoint with attached empty BPF program
>
> Yes, I am not surprised that the call stack capturing is really
> expensive comparing to the allocator fast path (which is really highly
> optimized and I suspect that with 10 allocation/free loop you mostly get
> your memory from the pcp lists). Is this overhead still _that_ visible
> for somehow less microoptimized workloads which have to take slow paths
> as well?
>
> Also what kind of stack unwinder is configured (I guess ORC)? This is
> not my area but from what I remember the unwinder overhead varies
> between ORC and FP.
>
> And just to make it clear. I do realize that an overhead from the stack
> unwinding is unavoidable. And code tagging would logically have lower
> overhead as it performs much less work. But the main point is whether
> our existing stack unwiding approach is really prohibitively expensive
> to be used for debugging purposes on production systems. I might
> misremember but I recall people having bigger concerns with page_owner
> memory footprint than the actual stack unwinder overhead.

This is just to point out that we've also been looking at cheaper
collection of the stack trace (for KASAN and other sanitizers). The
cheapest way to unwind the stack would be a system with "shadow call
stack" enabled. With compiler support it's available on arm64, see
CONFIG_SHADOW_CALL_STACK. For x86 the hope is that at one point the
kernel will support CET, which newer Intel and AMD CPUs support.
Collecting the call stack would then be a simple memcpy.

