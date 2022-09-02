Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 086F25AA529
	for <lists+xen-devel@lfdr.de>; Fri,  2 Sep 2022 03:36:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.397129.637593 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oTvax-0002a8-Q7; Fri, 02 Sep 2022 01:35:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 397129.637593; Fri, 02 Sep 2022 01:35:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oTvax-0002X6-Kr; Fri, 02 Sep 2022 01:35:43 +0000
Received: by outflank-mailman (input) for mailman id 397129;
 Fri, 02 Sep 2022 01:35:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hLnz=ZF=linux.dev=kent.overstreet@srs-se1.protection.inumbo.net>)
 id 1oTvav-0002Wh-HZ
 for xen-devel@lists.xenproject.org; Fri, 02 Sep 2022 01:35:42 +0000
Received: from out1.migadu.com (out1.migadu.com [91.121.223.63])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8c89147d-2a5f-11ed-934f-f50d60e1c1bd;
 Fri, 02 Sep 2022 03:35:39 +0200 (CEST)
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
X-Inumbo-ID: 8c89147d-2a5f-11ed-934f-f50d60e1c1bd
Date: Thu, 1 Sep 2022 21:35:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1662082539;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=DKbeuQ0KEVmGJmd1nxH6IkYl6hlcE8fBK782zCfa3dY=;
	b=djK/rzc16o2I5st6iLU+mmFycopk8nXeACxAiaLCYMzWJYltipsNT6kJ+bcD6p5dv0fhQK
	tsO6ER4nJ6etmNpcfsjSsEGbvTpJzvOlYT1SEGzRruYg/z2yOc4vkCLRQmY8hz09hO4/JQ
	EYL/angxfkhwhSI7Gv5opBj0F7OyMnA=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Kent Overstreet <kent.overstreet@linux.dev>
To: Steven Rostedt <rostedt@goodmis.org>
Cc: Suren Baghdasaryan <surenb@google.com>, akpm@linux-foundation.org,
	mhocko@suse.com, vbabka@suse.cz, hannes@cmpxchg.org,
	roman.gushchin@linux.dev, mgorman@suse.de, dave@stgolabs.net,
	willy@infradead.org, liam.howlett@oracle.com, void@manifault.com,
	peterz@infradead.org, juri.lelli@redhat.com, ldufour@linux.ibm.com,
	peterx@redhat.com, david@redhat.com, axboe@kernel.dk,
	mcgrof@kernel.org, masahiroy@kernel.org, nathan@kernel.org,
	changbin.du@intel.com, ytcoode@gmail.com,
	vincent.guittot@linaro.org, dietmar.eggemann@arm.com,
	bsegall@google.com, bristot@redhat.com, vschneid@redhat.com,
	cl@linux.com, penberg@kernel.org, iamjoonsoo.kim@lge.com,
	42.hyeyoo@gmail.com, glider@google.com, elver@google.com,
	dvyukov@google.com, shakeelb@google.com, songmuchun@bytedance.com,
	arnd@arndb.de, jbaron@akamai.com, rientjes@google.com,
	minchan@google.com, kaleshsingh@google.com, kernel-team@android.com,
	linux-mm@kvack.org, iommu@lists.linux.dev,
	kasan-dev@googlegroups.com, io-uring@vger.kernel.org,
	linux-arch@vger.kernel.org, xen-devel@lists.xenproject.org,
	linux-bcache@vger.kernel.org, linux-modules@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH 27/30] Code tagging based latency tracking
Message-ID: <20220902013532.6n5cyf3oofntljho@moria.home.lan>
References: <20220830214919.53220-1-surenb@google.com>
 <20220830214919.53220-28-surenb@google.com>
 <20220901173844.36e1683c@gandalf.local.home>
 <20220901215438.gy3bgqa4ghhm6ztm@moria.home.lan>
 <20220901183430.120311ce@gandalf.local.home>
 <20220901225515.ogg7pyljmfzezamr@moria.home.lan>
 <20220901202311.546a53b5@gandalf.local.home>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220901202311.546a53b5@gandalf.local.home>
X-Migadu-Flow: FLOW_OUT
X-Migadu-Auth-User: linux.dev

On Thu, Sep 01, 2022 at 08:23:11PM -0400, Steven Rostedt wrote:
> If ftrace, perf, bpf can't do what you want, take a harder look to see if
> you can modify them to do so.

Maybe we can use this exchange to make both of our tools better. I like your
histograms - the quantiles algorithm I've had for years is janky, I've been
meaning to rip that out, I'd love to take a look at your code for that. And
having an on/off switch is a good idea, I'll try to add that at some point.
Maybe you got some ideas from my stuff too.

I'd love to get better tracepoints for measuring latency - what I added to
init_wait() and finish_wait() was really only a starting point. Figuring out
the right places to measure is where I'd like to be investing my time in this
area, and there's no reason we couldn't both be making use of that.

e.g. with kernel waitqueues, I looked at hooking prepare_to_wait() first but not
all code uses that, init_wait() got me better coverage. But I've already seen
that that misses things, too, there's more work to be done.

random thought: might try adding a warning in schedule() any time it's called
and codetag_time_stats_start() hasn't been called, that'll be a starting
point...

