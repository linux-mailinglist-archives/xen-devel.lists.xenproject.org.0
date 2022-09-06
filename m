Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 19F9C5AE1CF
	for <lists+xen-devel@lfdr.de>; Tue,  6 Sep 2022 10:01:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.399624.640846 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oVTW7-000848-Cj; Tue, 06 Sep 2022 08:01:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 399624.640846; Tue, 06 Sep 2022 08:01:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oVTW7-00081u-8i; Tue, 06 Sep 2022 08:01:07 +0000
Received: by outflank-mailman (input) for mailman id 399624;
 Tue, 06 Sep 2022 08:01:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=+GEY=ZJ=suse.com=mhocko@srs-se1.protection.inumbo.net>)
 id 1oVTW5-00081o-Ul
 for xen-devel@lists.xenproject.org; Tue, 06 Sep 2022 08:01:05 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [2001:67c:2178:6::1d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0c078073-2dba-11ed-af93-0125da4c0113;
 Tue, 06 Sep 2022 10:01:02 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 933D21F969;
 Tue,  6 Sep 2022 08:01:02 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 631BD13A7A;
 Tue,  6 Sep 2022 08:01:02 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id WQy1Fz7+FmM9RAAAMHmgww
 (envelope-from <mhocko@suse.com>); Tue, 06 Sep 2022 08:01:02 +0000
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
X-Inumbo-ID: 0c078073-2dba-11ed-af93-0125da4c0113
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1662451262; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=LykPbpb5bX1WhruUNGP1sKPZqUQwdvS2N9veeSktZmY=;
	b=pD+ASQHSAYfnCXP/CzGZe0KiKy1C4ke5t5GY78Rxgp3BIdsYedHxXqMF10g3+09ns2HSTq
	9RHvnwu5+vfbyZL2m55Mbsk/4FRQIQhrEl/I1BdLKTaRnN9pB4NAkyq9Brps3pS2hykup0
	Nljpw9VHKbxVOnYLRZSymJIj4CedzPA=
Date: Tue, 6 Sep 2022 10:01:01 +0200
From: Michal Hocko <mhocko@suse.com>
To: Suren Baghdasaryan <surenb@google.com>
Cc: Kent Overstreet <kent.overstreet@linux.dev>,
	Mel Gorman <mgorman@suse.de>, Peter Zijlstra <peterz@infradead.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Vlastimil Babka <vbabka@suse.cz>,
	Johannes Weiner <hannes@cmpxchg.org>,
	Roman Gushchin <roman.gushchin@linux.dev>,
	Davidlohr Bueso <dave@stgolabs.net>,
	Matthew Wilcox <willy@infradead.org>,
	"Liam R. Howlett" <liam.howlett@oracle.com>,
	David Vernet <void@manifault.com>,
	Juri Lelli <juri.lelli@redhat.com>,
	Laurent Dufour <ldufour@linux.ibm.com>,
	Peter Xu <peterx@redhat.com>, David Hildenbrand <david@redhat.com>,
	Jens Axboe <axboe@kernel.dk>, mcgrof@kernel.org,
	masahiroy@kernel.org, nathan@kernel.org, changbin.du@intel.com,
	ytcoode@gmail.com, Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Benjamin Segall <bsegall@google.com>,
	Daniel Bristot de Oliveira <bristot@redhat.com>,
	Valentin Schneider <vschneid@redhat.com>,
	Christopher Lameter <cl@linux.com>,
	Pekka Enberg <penberg@kernel.org>,
	Joonsoo Kim <iamjoonsoo.kim@lge.com>, 42.hyeyoo@gmail.com,
	Alexander Potapenko <glider@google.com>,
	Marco Elver <elver@google.com>, Dmitry Vyukov <dvyukov@google.com>,
	Shakeel Butt <shakeelb@google.com>,
	Muchun Song <songmuchun@bytedance.com>, arnd@arndb.de,
	jbaron@akamai.com, David Rientjes <rientjes@google.com>,
	Minchan Kim <minchan@google.com>,
	Kalesh Singh <kaleshsingh@google.com>,
	kernel-team <kernel-team@android.com>,
	linux-mm <linux-mm@kvack.org>, iommu@lists.linux.dev,
	kasan-dev@googlegroups.com, io-uring@vger.kernel.org,
	linux-arch@vger.kernel.org, xen-devel@lists.xenproject.org,
	linux-bcache@vger.kernel.org, linux-modules@vger.kernel.org,
	LKML <linux-kernel@vger.kernel.org>
Subject: Re: [RFC PATCH 00/30] Code tagging framework and applications
Message-ID: <Yxb+PWN9kbfHSN8T@dhcp22.suse.cz>
References: <20220831084230.3ti3vitrzhzsu3fs@moria.home.lan>
 <20220831101948.f3etturccmp5ovkl@suse.de>
 <Yw88RFuBgc7yFYxA@dhcp22.suse.cz>
 <20220831190154.qdlsxfamans3ya5j@moria.home.lan>
 <YxBc1xuGbB36f8zC@dhcp22.suse.cz>
 <CAJuCfpGhwPFYdkOLjwwD4ra9JxPqq1T5d1jd41Jy3LJnVnhNdg@mail.gmail.com>
 <YxEE1vOwRPdzKxoq@dhcp22.suse.cz>
 <CAJuCfpFrRwXXQ=wAvZ-oUNKXUJ=uUA=fiDrkhRu5VGXcM+=cuA@mail.gmail.com>
 <YxWvbMYLkPoJrQyr@dhcp22.suse.cz>
 <CAJuCfpHJsfe172YUQbOqkkpNEEF7B6pJZuWnMa2BsdZwwEGKmA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAJuCfpHJsfe172YUQbOqkkpNEEF7B6pJZuWnMa2BsdZwwEGKmA@mail.gmail.com>

On Mon 05-09-22 11:03:35, Suren Baghdasaryan wrote:
> On Mon, Sep 5, 2022 at 1:12 AM Michal Hocko <mhocko@suse.com> wrote:
> >
> > On Sun 04-09-22 18:32:58, Suren Baghdasaryan wrote:
> > > On Thu, Sep 1, 2022 at 12:15 PM Michal Hocko <mhocko@suse.com> wrote:
> > [...]
> > > > Yes, tracking back the call trace would be really needed. The question
> > > > is whether this is really prohibitively expensive. How much overhead are
> > > > we talking about? There is no free lunch here, really.  You either have
> > > > the overhead during runtime when the feature is used or on the source
> > > > code level for all the future development (with a maze of macros and
> > > > wrappers).
> > >
> > > As promised, I profiled a simple code that repeatedly makes 10
> > > allocations/frees in a loop and measured overheads of code tagging,
> > > call stack capturing and tracing+BPF for page and slab allocations.
> > > Summary:
> > >
> > > Page allocations (overheads are compared to get_free_pages() duration):
> > > 6.8% Codetag counter manipulations (__lazy_percpu_counter_add + __alloc_tag_add)
> > > 8.8% lookup_page_ext
> > > 1237% call stack capture
> > > 139% tracepoint with attached empty BPF program
> >
> > Yes, I am not surprised that the call stack capturing is really
> > expensive comparing to the allocator fast path (which is really highly
> > optimized and I suspect that with 10 allocation/free loop you mostly get
> > your memory from the pcp lists). Is this overhead still _that_ visible
> > for somehow less microoptimized workloads which have to take slow paths
> > as well?
> 
> Correct, it's a comparison with the allocation fast path, so in a
> sense represents the worst case scenario. However at the same time the
> measurements are fair because they measure the overheads against the
> same meaningful baseline, therefore can be used for comparison.

Yes, I am not saying it is an unfair comparision. It is just not a
particularly practical one for real life situations. So I am not sure
you can draw many conclusions from that. Or let me put it differently.
There is not real point comparing the code tagging and stack unwiding
approaches because the later is simply more complex because it collects
more state. The main question is whether that additional state
collection is too expensive to be practically used.
 
> > Also what kind of stack unwinder is configured (I guess ORC)? This is
> > not my area but from what I remember the unwinder overhead varies
> > between ORC and FP.
> 
> I used whatever is default and didn't try other mechanisms. Don't
> think the difference would be orders of magnitude better though.
> 
> >
> > And just to make it clear. I do realize that an overhead from the stack
> > unwinding is unavoidable. And code tagging would logically have lower
> > overhead as it performs much less work. But the main point is whether
> > our existing stack unwiding approach is really prohibitively expensive
> > to be used for debugging purposes on production systems. I might
> > misremember but I recall people having bigger concerns with page_owner
> > memory footprint than the actual stack unwinder overhead.
> 
> That's one of those questions which are very difficult to answer (if
> even possible) because that would depend on the use scenario. If the
> workload allocates frequently then adding the overhead will likely
> affect it, otherwise might not be even noticeable. In general, in
> pre-production testing we try to minimize the difference in
> performance and memory profiles between the software we are testing
> and the production one. From that point of view, the smaller the
> overhead, the better. I know it's kinda obvious but unfortunately I
> have no better answer to that question.

This is clear but it doesn't really tell whether the existing tooling is
unusable for _your_ or any specific scenarios. Because when we are
talking about adding quite a lot of code and make our allocators APIs
more complicated to track the state then we should carefully weigh the
benefit and the cost. As replied to other email I am really skeptical
this patchset is at the final stage and the more allocators get covered
the more code we have to maintain. So there must be a very strong reason
to add it.

> For the memory overhead, in my early internal proposal with assumption
> of 10000 instrumented allocation call sites, I've made some
> calculations for an 8GB 8-core system (quite typical for Android) and
> ended up with the following:
> 
>                                     per-cpu counters      atomic counters
> page_ext references     16MB                      16MB
> slab object references   10.5MB                   10.5MB
> alloc_tags                      900KB                    312KB
> Total memory overhead 27.4MB                  26.8MB

I do not really think this is all that interesting because the major
memory overhead contributors (page_ext and objcg are going to be there
with other approaches that want to match alloc and free as that clearly
requires to store the allocator objects somewhere).

> so, about 0.34% of the total memory. Our implementation has changed
> since then and the number might not be completely correct but it
> should be in the ballpark.
> I just checked the number of instrumented calls that we currently have
> in the 6.0-rc3 built with defconfig and it's 165 page allocation and
> 2684 slab allocation sites. I readily accept that we are probably
> missing some allocations and additional modules can also contribute to
> these numbers but my guess it's still less than 10000 that I used in
> my calculations.

yes, in the current implementation you are missing most indirect users
of the page allocator as stated elsewhere so the usefulness can be
really limited. A better coverege will not increase the memory
consumption much but it will add an additional maintenance burden that
will scale with different usecases.
-- 
Michal Hocko
SUSE Labs

