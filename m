Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 251EF5AD8C5
	for <lists+xen-devel@lfdr.de>; Mon,  5 Sep 2022 20:05:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.399097.640146 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oVGRs-0001Md-MY; Mon, 05 Sep 2022 18:03:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 399097.640146; Mon, 05 Sep 2022 18:03:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oVGRs-0001Kn-Jk; Mon, 05 Sep 2022 18:03:52 +0000
Received: by outflank-mailman (input) for mailman id 399097;
 Mon, 05 Sep 2022 18:03:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=5Tfq=ZI=google.com=surenb@srs-se1.protection.inumbo.net>)
 id 1oVGRq-0001Kg-Fw
 for xen-devel@lists.xenproject.org; Mon, 05 Sep 2022 18:03:50 +0000
Received: from mail-il1-x12f.google.com (mail-il1-x12f.google.com
 [2607:f8b0:4864:20::12f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1671a71f-2d45-11ed-af93-0125da4c0113;
 Mon, 05 Sep 2022 20:03:47 +0200 (CEST)
Received: by mail-il1-x12f.google.com with SMTP id l6so4926801ilk.13
 for <xen-devel@lists.xenproject.org>; Mon, 05 Sep 2022 11:03:47 -0700 (PDT)
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
X-Inumbo-ID: 1671a71f-2d45-11ed-af93-0125da4c0113
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=T67TRgbvL4Ai6kaNg3fck6vcoHVKT+0s4pwJ/NSZTGA=;
        b=cPF8g7Tq5Xr7vWwWPXlAIGbvK841YSQ7JL9eISWcCc1GmuozWN4LmUfAHYFGsC3plp
         xbkMUOOnQhpFxa0XIBosBwjnD4RAr2Kl5FqcTcUiqI63BnVfEWkAAfAMPK2+2D9jC4rI
         SBcZs3gwdK8qGIp1MV9X/fGPGkKuR5qRQqaUNUEfXT08Tya/qRlmc89AlTJ5Ml7Xorrw
         xo1/RpLc8BQEQ206qriFaMJIssLZDxhxOljYpigcvkdlTlPx06einaUW7/uPd1dNz5in
         HXBRJcn7nXiV8BlMPqUAxSW6U9l+lE6gj/Oi85wJcyYJwIvqaZZYLOTvZP+kHnJ13k+5
         7W5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=T67TRgbvL4Ai6kaNg3fck6vcoHVKT+0s4pwJ/NSZTGA=;
        b=1AkJhyCAA7+7d+ru3m1VdSl7Zv4Ak40M1O5DbhNiqQdGa28PNv+T3NlEBHAnnU3gJv
         cU/IoKrCWeiMBtHqJHE4YBKG9DW9r3Dllr5LbJtqRMohwBZY9tR5Axrf+4RmFCJOUNPa
         URiRomlEhUH4LgsV03Y3DzRXq0O+SxPFZYiT3G24ABiMpNI+Sp3PH51bBgoVPL77vKzQ
         QBenRHes7qS0OWsB4YkNiAEG0QwFwuKGm55JWqq8fR6jyztOu1P8oSySOCqbHc9eutgv
         FHfWloPw+cqG6R62orul+HXgK7v0OkRmnbx9n65sjU0cbNA3JelDGGxmhEI3CTF7/uDD
         OMyg==
X-Gm-Message-State: ACgBeo1u3AMTJd+Y2xNSOjni/Ku44/jEwBiDnoQyGSnrDlx6LQgsbpuM
	U0VHJcwzQFgvipwqN1NOJeeGt/QOHnO7VqGOZEAkog==
X-Google-Smtp-Source: AA6agR4B7x+HXZFIStbcPiXGjinnhf/x5VSF8+h0pcx1isIR3eJmYhiMXqo5jfQScJCtZZmLuVhzCMYw0KB/RJ8mvlI=
X-Received: by 2002:a05:6e02:1ba8:b0:2eb:7d50:5fb8 with SMTP id
 n8-20020a056e021ba800b002eb7d505fb8mr14014798ili.296.1662401026346; Mon, 05
 Sep 2022 11:03:46 -0700 (PDT)
MIME-Version: 1.0
References: <20220830214919.53220-1-surenb@google.com> <Yw8P8xZ4zqu121xL@hirez.programming.kicks-ass.net>
 <20220831084230.3ti3vitrzhzsu3fs@moria.home.lan> <20220831101948.f3etturccmp5ovkl@suse.de>
 <Yw88RFuBgc7yFYxA@dhcp22.suse.cz> <20220831190154.qdlsxfamans3ya5j@moria.home.lan>
 <YxBc1xuGbB36f8zC@dhcp22.suse.cz> <CAJuCfpGhwPFYdkOLjwwD4ra9JxPqq1T5d1jd41Jy3LJnVnhNdg@mail.gmail.com>
 <YxEE1vOwRPdzKxoq@dhcp22.suse.cz> <CAJuCfpFrRwXXQ=wAvZ-oUNKXUJ=uUA=fiDrkhRu5VGXcM+=cuA@mail.gmail.com>
 <YxWvbMYLkPoJrQyr@dhcp22.suse.cz>
In-Reply-To: <YxWvbMYLkPoJrQyr@dhcp22.suse.cz>
From: Suren Baghdasaryan <surenb@google.com>
Date: Mon, 5 Sep 2022 11:03:35 -0700
Message-ID: <CAJuCfpHJsfe172YUQbOqkkpNEEF7B6pJZuWnMa2BsdZwwEGKmA@mail.gmail.com>
Subject: Re: [RFC PATCH 00/30] Code tagging framework and applications
To: Michal Hocko <mhocko@suse.com>
Cc: Kent Overstreet <kent.overstreet@linux.dev>, Mel Gorman <mgorman@suse.de>, 
	Peter Zijlstra <peterz@infradead.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Vlastimil Babka <vbabka@suse.cz>, Johannes Weiner <hannes@cmpxchg.org>, 
	Roman Gushchin <roman.gushchin@linux.dev>, Davidlohr Bueso <dave@stgolabs.net>, 
	Matthew Wilcox <willy@infradead.org>, "Liam R. Howlett" <liam.howlett@oracle.com>, 
	David Vernet <void@manifault.com>, Juri Lelli <juri.lelli@redhat.com>, 
	Laurent Dufour <ldufour@linux.ibm.com>, Peter Xu <peterx@redhat.com>, 
	David Hildenbrand <david@redhat.com>, Jens Axboe <axboe@kernel.dk>, mcgrof@kernel.org, 
	masahiroy@kernel.org, nathan@kernel.org, changbin.du@intel.com, 
	ytcoode@gmail.com, Vincent Guittot <vincent.guittot@linaro.org>, 
	Dietmar Eggemann <dietmar.eggemann@arm.com>, Steven Rostedt <rostedt@goodmis.org>, 
	Benjamin Segall <bsegall@google.com>, Daniel Bristot de Oliveira <bristot@redhat.com>, 
	Valentin Schneider <vschneid@redhat.com>, Christopher Lameter <cl@linux.com>, Pekka Enberg <penberg@kernel.org>, 
	Joonsoo Kim <iamjoonsoo.kim@lge.com>, 42.hyeyoo@gmail.com, 
	Alexander Potapenko <glider@google.com>, Marco Elver <elver@google.com>, Dmitry Vyukov <dvyukov@google.com>, 
	Shakeel Butt <shakeelb@google.com>, Muchun Song <songmuchun@bytedance.com>, arnd@arndb.de, 
	jbaron@akamai.com, David Rientjes <rientjes@google.com>, Minchan Kim <minchan@google.com>, 
	Kalesh Singh <kaleshsingh@google.com>, kernel-team <kernel-team@android.com>, 
	linux-mm <linux-mm@kvack.org>, iommu@lists.linux.dev, kasan-dev@googlegroups.com, 
	io-uring@vger.kernel.org, linux-arch@vger.kernel.org, 
	xen-devel@lists.xenproject.org, linux-bcache@vger.kernel.org, 
	linux-modules@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, Sep 5, 2022 at 1:12 AM Michal Hocko <mhocko@suse.com> wrote:
>
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

Correct, it's a comparison with the allocation fast path, so in a
sense represents the worst case scenario. However at the same time the
measurements are fair because they measure the overheads against the
same meaningful baseline, therefore can be used for comparison.

>
> Also what kind of stack unwinder is configured (I guess ORC)? This is
> not my area but from what I remember the unwinder overhead varies
> between ORC and FP.

I used whatever is default and didn't try other mechanisms. Don't
think the difference would be orders of magnitude better though.

>
> And just to make it clear. I do realize that an overhead from the stack
> unwinding is unavoidable. And code tagging would logically have lower
> overhead as it performs much less work. But the main point is whether
> our existing stack unwiding approach is really prohibitively expensive
> to be used for debugging purposes on production systems. I might
> misremember but I recall people having bigger concerns with page_owner
> memory footprint than the actual stack unwinder overhead.

That's one of those questions which are very difficult to answer (if
even possible) because that would depend on the use scenario. If the
workload allocates frequently then adding the overhead will likely
affect it, otherwise might not be even noticeable. In general, in
pre-production testing we try to minimize the difference in
performance and memory profiles between the software we are testing
and the production one. From that point of view, the smaller the
overhead, the better. I know it's kinda obvious but unfortunately I
have no better answer to that question.

For the memory overhead, in my early internal proposal with assumption
of 10000 instrumented allocation call sites, I've made some
calculations for an 8GB 8-core system (quite typical for Android) and
ended up with the following:

                                    per-cpu counters      atomic counters
page_ext references     16MB                      16MB
slab object references   10.5MB                   10.5MB
alloc_tags                      900KB                    312KB
Total memory overhead 27.4MB                  26.8MB

so, about 0.34% of the total memory. Our implementation has changed
since then and the number might not be completely correct but it
should be in the ballpark.
I just checked the number of instrumented calls that we currently have
in the 6.0-rc3 built with defconfig and it's 165 page allocation and
2684 slab allocation sites. I readily accept that we are probably
missing some allocations and additional modules can also contribute to
these numbers but my guess it's still less than 10000 that I used in
my calculations.
I don't claim that 0.34% overhead is low enough to be always
acceptable, just posting the numbers to provide some reference points.

> --
> Michal Hocko
> SUSE Labs

