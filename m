Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 22DE85AC88F
	for <lists+xen-devel@lfdr.de>; Mon,  5 Sep 2022 03:34:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.398418.639243 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oV0zE-0002Zf-6X; Mon, 05 Sep 2022 01:33:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 398418.639243; Mon, 05 Sep 2022 01:33:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oV0zE-0002Xs-1K; Mon, 05 Sep 2022 01:33:16 +0000
Received: by outflank-mailman (input) for mailman id 398418;
 Mon, 05 Sep 2022 01:33:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=5Tfq=ZI=google.com=surenb@srs-se1.protection.inumbo.net>)
 id 1oV0zB-0002Xm-Hs
 for xen-devel@lists.xenproject.org; Mon, 05 Sep 2022 01:33:13 +0000
Received: from mail-io1-xd32.google.com (mail-io1-xd32.google.com
 [2607:f8b0:4864:20::d32])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b398b92a-2cba-11ed-a016-b9edf5238543;
 Mon, 05 Sep 2022 03:33:11 +0200 (CEST)
Received: by mail-io1-xd32.google.com with SMTP id i77so5875852ioa.7
 for <xen-devel@lists.xenproject.org>; Sun, 04 Sep 2022 18:33:11 -0700 (PDT)
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
X-Inumbo-ID: b398b92a-2cba-11ed-a016-b9edf5238543
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=2RluQjqzTIUHmUhPkFaAucreOiCVZIKJVjpKNDHkTVI=;
        b=Q2SFjmrk55zpV9cBG3THFMLDJmuoc/8nrQ9p1qSD4f3cKratTElhXWpwlJpzLyLGdB
         dUdJn77SvWYU1bP95CNfftS8y/vUZXmtUUk048r8ICfLieWVmDGDmUW5u9pFn0Wimb2+
         fjqU5NekUrHLRJIhO6WL/TlQwCGPS6j156hXfsaJx7lHdSgwEnbb8DWRFk8q7xjioT1t
         iG+0L8yNs39bpjd/CsZ4HREZ9tLgN3o/zOan5zEv/n3CDSIzOP4LnKLk4WpSk4BU0yEP
         4AYwp1478Pf1dFxHmYXmnh+61qZlMLJPPjkGYHj5zdiNAcoW1tZU++xE8S7Db8in70AK
         L7BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=2RluQjqzTIUHmUhPkFaAucreOiCVZIKJVjpKNDHkTVI=;
        b=4dqbQPaFRl47pqjtUFeR4HPnqRQtcLkqwra8ZaxXpEvaNFQ5ioLAVzVYiHLTb9D13D
         bws+e5DneTabKIAVvY0ylG9UepwGce0Eso9ORFm4upN5RtmTnKTMUQmN7lAy1cz4rbTs
         HFDQ5yU206tYmZFw+jjaAuQN5XlpEOkU1A1wtsyfnEoPBnTHc63WwWqYKLBx1LSixsjE
         zdJnleWlMxQMKa7alNe7jZ3zUNsiSzbLcffdmhpPqT0oUnxOLujM5N3xaLbV3GrYQDpW
         vdmPcfWDFCi8rQ5bxHxVHcQ1q0SV+hBU4c8ePlSIJxr0EFn51q1omeCqniwbusbXaVAj
         fJbg==
X-Gm-Message-State: ACgBeo1P/xhJQ9TfCA/Hy9k3t5tUYRwH30AvnaI3VHYXQdvPTVdo/TlW
	Xr7FOfRjeWnlW44CzNfasPtgrrAf5YscvDTXCEN8uw==
X-Google-Smtp-Source: AA6agR5tFRVsPv1w5HQVwvNXMwt9PQzl6OY2wrpjmNL5au6axj2vXUaHdVOAmgfDNm2JaHEXPkzVG4QoN+UeQErwqKQ=
X-Received: by 2002:a02:7b19:0:b0:34a:74d:118 with SMTP id q25-20020a027b19000000b0034a074d0118mr23960434jac.62.1662341590010;
 Sun, 04 Sep 2022 18:33:10 -0700 (PDT)
MIME-Version: 1.0
References: <20220830214919.53220-1-surenb@google.com> <Yw8P8xZ4zqu121xL@hirez.programming.kicks-ass.net>
 <20220831084230.3ti3vitrzhzsu3fs@moria.home.lan> <20220831101948.f3etturccmp5ovkl@suse.de>
 <Yw88RFuBgc7yFYxA@dhcp22.suse.cz> <20220831190154.qdlsxfamans3ya5j@moria.home.lan>
 <YxBc1xuGbB36f8zC@dhcp22.suse.cz> <CAJuCfpGhwPFYdkOLjwwD4ra9JxPqq1T5d1jd41Jy3LJnVnhNdg@mail.gmail.com>
 <YxEE1vOwRPdzKxoq@dhcp22.suse.cz>
In-Reply-To: <YxEE1vOwRPdzKxoq@dhcp22.suse.cz>
From: Suren Baghdasaryan <surenb@google.com>
Date: Sun, 4 Sep 2022 18:32:58 -0700
Message-ID: <CAJuCfpFrRwXXQ=wAvZ-oUNKXUJ=uUA=fiDrkhRu5VGXcM+=cuA@mail.gmail.com>
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

On Thu, Sep 1, 2022 at 12:15 PM Michal Hocko <mhocko@suse.com> wrote:
>
> On Thu 01-09-22 08:33:19, Suren Baghdasaryan wrote:
> > On Thu, Sep 1, 2022 at 12:18 AM Michal Hocko <mhocko@suse.com> wrote:
> [...]
> > > So I find Peter's question completely appropriate while your response to
> > > that not so much! Maybe ftrace is not the right tool for the intented
> > > job. Maybe there are other ways and it would be really great to show
> > > that those have been evaluated and they are not suitable for a), b) and
> > > c) reasons.
> >
> > That's fair.
> > For memory tracking I looked into using kmemleak and page_owner which
> > can't match the required functionality at an overhead acceptable for
> > production and pre-production testing environments.
>
> Being more specific would be really helpful. Especially when your cover
> letter suggests that you rely on page_owner/memcg metadata as well to
> match allocation and their freeing parts.
>
> > traces + BPF I
> > haven't evaluated myself but heard from other members of my team who
> > tried using that in production environment with poor results. I'll try
> > to get more specific information on that.
>
> That would be helpful as well.
>
> > > E.g. Oscar has been working on extending page_ext to track number of
> > > allocations for specific calltrace[1]. Is this 1:1 replacement? No! But
> > > it can help in environments where page_ext can be enabled and it is
> > > completely non-intrusive to the MM code.
> >
> > Thanks for pointing out this work. I'll need to review and maybe
> > profile it before making any claims.
> >
> > >
> > > If the page_ext overhead is not desirable/acceptable then I am sure
> > > there are other options. E.g. kprobes/LivePatching framework can hook
> > > into functions and alter their behavior. So why not use that for data
> > > collection? Has this been evaluated at all?
> >
> > I'm not sure how I can hook into say alloc_pages() to find out where
> > it was called from without capturing the call stack (which would
> > introduce an overhead at every allocation). Would love to discuss this
> > or other alternatives if they can be done with low enough overhead.
>
> Yes, tracking back the call trace would be really needed. The question
> is whether this is really prohibitively expensive. How much overhead are
> we talking about? There is no free lunch here, really.  You either have
> the overhead during runtime when the feature is used or on the source
> code level for all the future development (with a maze of macros and
> wrappers).

As promised, I profiled a simple code that repeatedly makes 10
allocations/frees in a loop and measured overheads of code tagging,
call stack capturing and tracing+BPF for page and slab allocations.
Summary:

Page allocations (overheads are compared to get_free_pages() duration):
6.8% Codetag counter manipulations (__lazy_percpu_counter_add + __alloc_tag_add)
8.8% lookup_page_ext
1237% call stack capture
139% tracepoint with attached empty BPF program

Slab allocations (overheads are compared to __kmalloc() duration):
With CONFIG_MEMCG_KMEM=y
39% Codetag counter manipulations(__lazy_percpu_counter_add + __alloc_tag_add)
55% get_slab_tag_ref
3.9% __ksize
3027% call stack capture
397% tracepoint with attached empty BPF program

With CONFIG_MEMCG_KMEM=n
26% Codetag counter manipulation(__lazy_percpu_counter_add + __alloc_tag_add)
72% get_slab_tag_ref
7.4% __ksize
2789% call stack capture
345% tracepoint with attached empty BPF program

Details:
_get_free_pages is used as page allocation duration baseline
__kmalloc is used as slab allocation duration baseline

1. Profile with instrumented page allocator
|--50.13%--my__get_free_page
|          |
|          |--38.99%--_get_free_pages
|          |          |
|          |          |--34.75%--__alloc_pages
|          |          |          |
|          |          |          |--27.59%--get_page_from_freelist
|          |          |
|          |           --3.98%--_alloc_pages
|          |                     |
|          |                      --0.53%--policy_node
|          |
|          |--3.45%--lookup_page_ext
|          |
|          |--1.59%--__lazy_percpu_counter_add
|          |          |
|          |           --0.80%--pcpu_alloc
|          |                     memset_orig
|          |
|           --1.06%--__alloc_tag_add
|                     |
|                      --0.80%--__lazy_percpu_counter_add
|
|--35.28%--free_unref_page
|          |
|          |--23.08%--_raw_spin_unlock_irqrestore
|          |
|          |--2.39%--preempt_count_add
|          |          |
|          |           --0.80%--in_lock_functions
|          |
|          |--1.59%--free_pcp_prepare
|          |
|          |--1.33%--preempt_count_sub
|          |
|           --0.80%--check_preemption_disabled
|
|--4.24%--__free_pages
|
 --1.59%--free_pages


2. Profile with non-instrumented page allocator and call stack capturing
|--84.18%--my__get_free_page
|          |
|           --83.91%--stack_depot_capture_stack
|                     |
|                     |--77.99%--stack_trace_save
|                     |          |
|                     |           --77.53%--arch_stack_walk
|                     |                     |
|                     |                     |--37.17%--unwind_next_frame
|                     |                     |          |
|                     |                     |          |--8.44%--__orc_find
|                     |                     |          |
|                     |                     |--10.57%-stack_trace_consume_entry
|                     |                     |
|                     |                      --9.64%--unwind_get_return_address
|                     |
|                      --5.78%--__stack_depot_save
|
|--6.78%--__get_free_pages
|          |
|          |--5.85%--__alloc_pages
|          |          |
|          |           --3.86%--get_page_from_freelist
|          |                     |
|          |                      --1.33%--_raw_spin_unlock_irqrestore
|          |
|           --0.80%--alloc_pages
|
|--5.19%--free_unref_page
|          |
|          |--2.73%--_raw_spin_unlock_irqrestore
|          |
|           --0.60%--free_pcp_prepare
|
 --0.73%--__free_pages


3. Profile with non-instrumented page allocator and BPF attached to tracepoint
|--42.42%--my__get_free_page
|          |
|           --38.53%--perf_trace_kmem_alloc
|                     |
|                     |--25.76%--perf_trace_run_bpf_submit
|                     |          |
|                     |          |--21.86%--trace_call_bpf
|                     |          |          |
|                     |          |          |--4.76%--migrate_enable
|                     |          |          |
|                     |          |          |--4.55%--migrate_disable
|                     |          |          |
|                     |          |          |--3.03%--check_preemption_disabled
|                     |          |          |
|                     |          |          |--0.65%--__this_cpu_preempt_check
|                     |          |          |
|                     |          |           --0.65%--__rcu_read_unlock
|                     |          |
|                     |           --0.87%--check_preemption_disabled
|                     |
|                     |--8.01%--perf_trace_buf_alloc
|                     |          |
|                     |          |--3.68%--perf_swevent_get_recursion_context
|                     |          |          |
|                     |          |           --0.87%--check_preemption_disabled
|                     |          |
|                     |           --1.30%--check_preemption_disabled
|                     |
|                      --0.87%--check_preemption_disabled
|
|--27.71%--__get_free_pages
|          |
|          |--23.38%--__alloc_pages
|          |          |
|          |           --17.75%--get_page_from_freelist
|          |                     |
|          |                     |--8.66%--_raw_spin_unlock_irqrestore
|          |                     |          |
|          |                     |           --1.95%--preempt_count_sub
|          |                     |
|          |                      --1.08%--preempt_count_add
|          |
|           --4.33%--alloc_pages
|                     |
|                     |--0.87%--policy_node
|                     |
|                      --0.65%--policy_nodemask
|
|--15.37%--free_unref_page
|          |
|          |--6.71%--_raw_spin_unlock_irqrestore
|          |
|          |--1.52%--check_preemption_disabled
|          |
|          |--0.65%--free_pcp_prepare
|          |
|           --0.65%--preempt_count_add
|--4.98%--__free_pages


4. Profile with instrumented slab allocator CONFIG_MEMCG_KMEM=y
|--51.28%--my__get_free_page
|          |
|          |--21.79%--__kmalloc
|          |          |
|          |          |--3.42%--memcg_slab_post_alloc_hook
|          |          |
|          |          |--1.71%--kmalloc_slab
|          |          |
|          |           --0.85%--should_failslab
|          |
|          |--11.97%--get_slab_tag_ref
|          |
|          |--5.56%--__alloc_tag_add
|          |          |
|          |           --2.56%--__lazy_percpu_counter_add
|          |
|          |--2.99%--__lazy_percpu_counter_add
|          |
|           --0.85%--__ksize
|
 --35.90%--kfree
           |
           |--13.68%--get_slab_tag_ref
           |
           |--6.41%--__alloc_tag_sub
           |          |
           |           --4.70%--__lazy_percpu_counter_add
           |
            --2.14%--__ksize


5. Profile with non-instrumented slab allocator and call stack
capturing CONFIG_MEMCG_KMEM=y
|--91.50%--my__get_free_page
|          |
|           --91.13%--stack_depot_capture_stack
|                     |
|                     |--85.48%--stack_trace_save
|                     |          |
|                     |           --85.12%--arch_stack_walk
|                     |                     |
|                     |                     |--40.54%--unwind_next_frame
|                     |                     |
|                     |                     |--14.30%--__unwind_start
|                     |                     |
|                     |                     |--11.95%-unwind_get_return_address
|                     |                     |
|                     |                      --10.48%-stack_trace_consume_entry
|                     |
|                      --4.99%--__stack_depot_save
|                                |
|                                 --0.66%--filter_irq_stacks
|
|--3.01%--__kmalloc
|
|--2.05%--kfree

6. Profile with non-instrumented slab allocator and BPF attached to a
tracepoint CONFIG_MEMCG_KMEM=y
|--72.39%--__kmalloc
|          |
|          |--57.84%--perf_trace_kmem_alloc
|          |          |
|          |          |--38.06%--perf_trace_run_bpf_submit
|          |          |          |
|          |          |           --33.96%--trace_call_bpf
|          |          |                     |
|          |          |                     |--10.07%--migrate_disable
|          |          |                     |
|          |          |                     |--4.85%--migrate_enable
|          |          |                     |
|          |          |                     |--4.10%--check_preemption_disabled
|          |          |                     |
|          |          |                     |--1.87%--__rcu_read_unlock
|          |          |                     |
|          |          |                      --0.75%--__rcu_read_lock
|          |          |
|          |           --9.70%--perf_trace_buf_alloc
|          |                     |
|          |                     |--2.99%--perf_swevent_get_recursion_context
|          |                     |
|          |                     |--1.12%--check_preemption_disabled
|          |                     |
|          |                      --0.75%--debug_smp_processor_id
|          |
|          |--2.24%--kmalloc_slab
|          |
|          |--1.49%--memcg_slab_post_alloc_hook
|          |
|           --1.12%--__cond_resched
|
|--7.84%--kfree


7. Profile with instrumented slab allocator CONFIG_MEMCG_KMEM=n
|--49.39%--my__get_free_page
|          |
|          |--22.04%--__kmalloc
|          |          |
|          |          |--3.27%--kmalloc_slab
|          |          |
|          |           --0.82%--asm_sysvec_apic_timer_interrupt
|          |                     sysvec_apic_timer_interrupt
|          |                     __irq_exit_rcu
|          |                     __softirqentry_text_start
|          |
|          |--15.92%--get_slab_tag_ref
|          |
|          |--3.27%--__alloc_tag_add
|          |          |
|          |           --2.04%--__lazy_percpu_counter_add
|          |
|           --2.45%--__lazy_percpu_counter_add
|
|--35.51%--kfree
|          |
|          |--13.88%--get_slab_tag_ref
|          |
|          |--11.84%--__alloc_tag_sub
|          |          |
|          |           --5.31%--__lazy_percpu_counter_add
|          |
|           --1.63%--__ksize

8. Profile with non-instrumented slab allocator and call stack
capturing CONFIG_MEMCG_KMEM=n
|--91.70%--my__get_free_page
|          |
|           --91.48%--stack_depot_capture_stack
|                     |
|                     |--85.29%--stack_trace_save
|                     |          |
|                     |           --85.07%--arch_stack_walk
|                     |                     |
|                     |                     |--45.23%--unwind_next_frame
|                     |                     |
|                     |                     |--12.89%--__unwind_start
|                     |                     |
|                     |                     |--10.20%-unwind_get_return_address
|                     |                     |
|                     |                      --10.12%-stack_trace_consume_entry
|                     |
|                      --5.75%--__stack_depot_save
|                                |
|                                 --0.87%--filter_irq_stacks
|
|--3.28%--__kmalloc
|
 --1.89%--kfree

9. Profile with non-instrumented slab allocator and BPF attached to a
tracepoint CONFIG_MEMCG_KMEM=n
|--71.65%--__kmalloc
|          |
|          |--55.56%--perf_trace_kmem_alloc
|          |          |
|          |          |--38.31%--perf_trace_run_bpf_submit
|          |          |          |
|          |          |          |--31.80%--trace_call_bpf
|          |          |          |          |
|          |          |          |          |--9.96%--migrate_enable
|          |          |          |          |
|          |          |          |          |--4.98%--migrate_disable
|          |          |          |          |
|          |          |          |          |--1.92%--check_preemption_disabled
|          |          |          |          |
|          |          |          |          |--1.92%--__rcu_read_unlock
|          |          |          |          |
|          |          |          |           --1.15%--__rcu_read_lock
|          |          |          |
|          |          |           --0.77%--check_preemption_disabled
|          |          |
|          |           --11.11%--perf_trace_buf_alloc
|          |                     |
|          |                      --4.98%--perf_swevent_get_recursion_context
|          |                                |
|          |                                 --1.53%--check_preemption_disabled
|          |
|          |--2.68%--kmalloc_slab
|          |
|           --1.15%--__cond_resched
|
 --9.58%--kfree


>
> Thanks!
> --
> Michal Hocko
> SUSE Labs

