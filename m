Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 010CE5A8291
	for <lists+xen-devel@lfdr.de>; Wed, 31 Aug 2022 18:00:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.395838.635723 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oTQ8A-0008Kq-4q; Wed, 31 Aug 2022 15:59:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 395838.635723; Wed, 31 Aug 2022 15:59:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oTQ8A-0008Hz-1D; Wed, 31 Aug 2022 15:59:54 +0000
Received: by outflank-mailman (input) for mailman id 395838;
 Wed, 31 Aug 2022 15:59:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=E34P=ZD=linux.dev=kent.overstreet@srs-se1.protection.inumbo.net>)
 id 1oTQ88-0008Ht-6m
 for xen-devel@lists.xenproject.org; Wed, 31 Aug 2022 15:59:52 +0000
Received: from out1.migadu.com (out1.migadu.com [2001:41d0:2:863f::])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f16c278a-2945-11ed-82f2-63bd783d45fa;
 Wed, 31 Aug 2022 17:59:50 +0200 (CEST)
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
X-Inumbo-ID: f16c278a-2945-11ed-82f2-63bd783d45fa
Date: Wed, 31 Aug 2022 11:59:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1661961589;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=8eQR8jMOxB0pUJLRgI0y5+reUXpRdgSKiz76DZMbpZA=;
	b=GKQv6dESmRNVlYrhLKqHqAEupQL+NGWnc+q+XSzgFWGRhe0CnbyNV+7rNtWq5MTMG51R4C
	l0UYS35OVMaetPyb4bctosq1HXD3sGEB3YcTrl1fFrr7arsrOVKztpQ7iNKwwum1q08tZq
	71z4eskGeNO/LfuPYzvdz8RnP/XW/uU=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Kent Overstreet <kent.overstreet@linux.dev>
To: Mel Gorman <mgorman@suse.de>
Cc: Peter Zijlstra <peterz@infradead.org>,
	Suren Baghdasaryan <surenb@google.com>, akpm@linux-foundation.org,
	mhocko@suse.com, vbabka@suse.cz, hannes@cmpxchg.org,
	roman.gushchin@linux.dev, dave@stgolabs.net, willy@infradead.org,
	liam.howlett@oracle.com, void@manifault.com, juri.lelli@redhat.com,
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
Subject: Re: [RFC PATCH 00/30] Code tagging framework and applications
Message-ID: <20220831155941.q5umplytbx6offku@moria.home.lan>
References: <20220830214919.53220-1-surenb@google.com>
 <Yw8P8xZ4zqu121xL@hirez.programming.kicks-ass.net>
 <20220831084230.3ti3vitrzhzsu3fs@moria.home.lan>
 <20220831101948.f3etturccmp5ovkl@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220831101948.f3etturccmp5ovkl@suse.de>
X-Migadu-Flow: FLOW_OUT
X-Migadu-Auth-User: linux.dev

On Wed, Aug 31, 2022 at 11:19:48AM +0100, Mel Gorman wrote:
> On Wed, Aug 31, 2022 at 04:42:30AM -0400, Kent Overstreet wrote:
> > On Wed, Aug 31, 2022 at 09:38:27AM +0200, Peter Zijlstra wrote:
> > > On Tue, Aug 30, 2022 at 02:48:49PM -0700, Suren Baghdasaryan wrote:
> > > > ===========================
> > > > Code tagging framework
> > > > ===========================
> > > > Code tag is a structure identifying a specific location in the source code
> > > > which is generated at compile time and can be embedded in an application-
> > > > specific structure. Several applications of code tagging are included in
> > > > this RFC, such as memory allocation tracking, dynamic fault injection,
> > > > latency tracking and improved error code reporting.
> > > > Basically, it takes the old trick of "define a special elf section for
> > > > objects of a given type so that we can iterate over them at runtime" and
> > > > creates a proper library for it.
> > > 
> > > I might be super dense this morning, but what!? I've skimmed through the
> > > set and I don't think I get it.
> > > 
> > > What does this provide that ftrace/kprobes don't already allow?
> > 
> > You're kidding, right?
> 
> It's a valid question. From the description, it main addition that would
> be hard to do with ftrace or probes is catching where an error code is
> returned. A secondary addition would be catching all historical state and
> not just state since the tracing started.

Catching all historical state is pretty important in the case of memory
allocation accounting, don't you think?

Also, ftrace can drop events. Not really ideal if under system load your memory
accounting numbers start to drift.

> It's also unclear *who* would enable this. It looks like it would mostly
> have value during the development stage of an embedded platform to track
> kernel memory usage on a per-application basis in an environment where it
> may be difficult to setup tracing and tracking. Would it ever be enabled
> in production? Would a distribution ever enable this? If it's enabled, any
> overhead cannot be disabled/enabled at run or boot time so anyone enabling
> this would carry the cost without never necessarily consuming the data.

The whole point of this is to be cheap enough to enable in production -
especially the latency tracing infrastructure. There's a lot of value to
always-on system visibility infrastructure, so that when a live machine starts
to do something wonky the data is already there.

What we've built here this is _far_ cheaper than anything that could be done
with ftrace.

> It might be an ease-of-use thing. Gathering the information from traces
> is tricky and would need combining multiple different elements and that
> is development effort but not impossible.
> 
> Whatever asking for an explanation as to why equivalent functionality
> cannot not be created from ftrace/kprobe/eBPF/whatever is reasonable.

I think perhaps some of the expectation should be on the "ftrace for
everything!" people to explain a: how their alternative could be even built and
b: how it would compare in terms of performance and ease of use.

Look, I've been a tracing user for many years, and it has its uses, but some of
the claims I've been hearing from tracing/bpf people when any alternative
tooling is proposed sound like vaporware and bullshitting.

