Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F9E75AA0BE
	for <lists+xen-devel@lfdr.de>; Thu,  1 Sep 2022 22:15:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.396940.637346 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oTqaq-0002Dm-5o; Thu, 01 Sep 2022 20:15:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 396940.637346; Thu, 01 Sep 2022 20:15:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oTqaq-0002Ab-28; Thu, 01 Sep 2022 20:15:16 +0000
Received: by outflank-mailman (input) for mailman id 396940;
 Thu, 01 Sep 2022 20:15:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=j4CE=ZE=linux.dev=kent.overstreet@srs-se1.protection.inumbo.net>)
 id 1oTqao-0002AV-4V
 for xen-devel@lists.xenproject.org; Thu, 01 Sep 2022 20:15:14 +0000
Received: from out0.migadu.com (out0.migadu.com [2001:41d0:2:267::])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c864d6e2-2a32-11ed-934f-f50d60e1c1bd;
 Thu, 01 Sep 2022 22:15:12 +0200 (CEST)
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
X-Inumbo-ID: c864d6e2-2a32-11ed-934f-f50d60e1c1bd
Date: Thu, 1 Sep 2022 16:15:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1662063310;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=x2NMOlEzDduOKU3OG0hkVY/eZ9DnomVtYyGkujvYMfQ=;
	b=GZmX8EgKF+NWBO1K6a1hr+nxjuoF/PsDTSLqCo6JDft5Lp2ahwYTTK8b50dG3GDFiyI2oI
	2rQSd84i51aF5SiQopFwaT3nCD3wYRAGWS4l2yVMm4bl7qQbXzOmzbG62OdE7XVziv2OfP
	OhmtcTJVp1MskxwDjbZcipuL7iWFfaI=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Kent Overstreet <kent.overstreet@linux.dev>
To: Suren Baghdasaryan <surenb@google.com>
Cc: Michal Hocko <mhocko@suse.com>, Mel Gorman <mgorman@suse.de>,
	Peter Zijlstra <peterz@infradead.org>,
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
Message-ID: <20220901201502.sn6223bayzwferxv@moria.home.lan>
References: <20220830214919.53220-1-surenb@google.com>
 <Yw8P8xZ4zqu121xL@hirez.programming.kicks-ass.net>
 <20220831084230.3ti3vitrzhzsu3fs@moria.home.lan>
 <20220831101948.f3etturccmp5ovkl@suse.de>
 <Yw88RFuBgc7yFYxA@dhcp22.suse.cz>
 <20220831190154.qdlsxfamans3ya5j@moria.home.lan>
 <YxBc1xuGbB36f8zC@dhcp22.suse.cz>
 <CAJuCfpGhwPFYdkOLjwwD4ra9JxPqq1T5d1jd41Jy3LJnVnhNdg@mail.gmail.com>
 <YxEE1vOwRPdzKxoq@dhcp22.suse.cz>
 <CAJuCfpHuzJGTA_-m0Jfawc7LgJLt4GztUUY4K9N9-7bFqJuXnw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAJuCfpHuzJGTA_-m0Jfawc7LgJLt4GztUUY4K9N9-7bFqJuXnw@mail.gmail.com>
X-Migadu-Flow: FLOW_OUT
X-Migadu-Auth-User: linux.dev

On Thu, Sep 01, 2022 at 12:39:11PM -0700, Suren Baghdasaryan wrote:
> kmemleak is known to be slow and it's even documented [1], so I hope I
> can skip that part. For page_owner to provide the comparable
> information we would have to capture the call stacks for all page
> allocations unlike our proposal which allows to do that selectively
> for specific call sites. I'll post the overhead numbers of call stack
> capturing once I'm finished with profiling the latest code, hopefully
> sometime tomorrow, in the worst case after the long weekend.

To expand on this further: we're stashing a pointer to the alloc_tag, which is
defined at the allocation callsite. That's how we're able to decrement the
proper counter on free, and why this beats any tracing based approach - with
tracing you'd instead have to correlate allocate/free events. Ouch.

> > Yes, tracking back the call trace would be really needed. The question
> > is whether this is really prohibitively expensive. How much overhead are
> > we talking about? There is no free lunch here, really.  You either have
> > the overhead during runtime when the feature is used or on the source
> > code level for all the future development (with a maze of macros and
> > wrappers).

The full call stack is really not what you want in most applications - that's
what people think they want at first, and why page_owner works the way it does,
but it turns out that then combining all the different but related stack traces
_sucks_ (so why were you saving them in the first place?), and then you have to
do a separate memory allocate for each stack track, which destroys performance.

> 
> Will post the overhead numbers soon.
> What I hear loud and clear is that we need a kernel command-line kill
> switch that mitigates the overhead for having this feature. That seems
> to be the main concern.
> Thanks,

After looking at this more I don't think we should commit just yet - there's
some tradeoffs to be evaluated, and maybe the thing to do first will be to see
if we can cut down on the (huge!) number of allocation interfaces before adding
more complexity.

The ideal approach, from a performance POV, would be to pass a pointer to the
alloc tag to kmalloc() et. all, and then we'd have the actual accounting code in
one place and use a jump label to skip over it when this feature is disabled.

However, there are _many, many_ wrapper functions in our allocation code, and
this approach is going to make the plumbing for the hooks quite a bit bigger
than what we have now - and then, do we want to have this extra alloc_tag
parameter that's not used when CONFIG_ALLOC_TAGGING=n? It's a tiny cost for an
extra unused parameter, but it's a cost - or do we get rid of that with some
extra macro hackery (eww, gross)?

If we do the boot parameter before submission, I think we'll have something
that's maybe not strictly ideal from a performance POV when
CONFIG_ALLOC_TAGGING=y but boot parameter=n, but it'll introduce the minimum
amount of macro insanity.

What we should be able to do pretty easily is discard the alloc_tag structs when
the boot parameter is disabled, because they're in special elf sections and we
already do that (e.g. for .init).

