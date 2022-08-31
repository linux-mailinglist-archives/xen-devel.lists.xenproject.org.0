Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AE285A8303
	for <lists+xen-devel@lfdr.de>; Wed, 31 Aug 2022 18:21:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.395863.635768 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oTQSG-0005PG-Nh; Wed, 31 Aug 2022 16:20:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 395863.635768; Wed, 31 Aug 2022 16:20:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oTQSG-0005Lx-KA; Wed, 31 Aug 2022 16:20:40 +0000
Received: by outflank-mailman (input) for mailman id 395863;
 Wed, 31 Aug 2022 16:20:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=E34P=ZD=linux.dev=kent.overstreet@srs-se1.protection.inumbo.net>)
 id 1oTQSF-0005Lr-9x
 for xen-devel@lists.xenproject.org; Wed, 31 Aug 2022 16:20:39 +0000
Received: from out1.migadu.com (out1.migadu.com [91.121.223.63])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d8ce5a3c-2948-11ed-82f2-63bd783d45fa;
 Wed, 31 Aug 2022 18:20:37 +0200 (CEST)
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
X-Inumbo-ID: d8ce5a3c-2948-11ed-82f2-63bd783d45fa
Date: Wed, 31 Aug 2022 12:20:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1661962837;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=iGyIm0136Cqvu8OauWzfpc3vydsg6hlY8VzCbW2wXJg=;
	b=KVP2c5IAZ3wBXb2/Ad6Xj43ljUfrIdr7gfO4yiBKC2RKOWHohtjtIXVhI3lUJiPDbu8s8A
	OgKnIfQQ9lSKVfDzWbpXF/ELpw+p0U2uveRKEHmnrSHDmx2oda782PoBDvM4b2hIeOKuns
	rKESeCwGcppKXEWhmK+nLoA/6gDDxY8=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Kent Overstreet <kent.overstreet@linux.dev>
To: Mel Gorman <mgorman@suse.de>
Cc: Suren Baghdasaryan <surenb@google.com>, akpm@linux-foundation.org,
	mhocko@suse.com, vbabka@suse.cz, hannes@cmpxchg.org,
	roman.gushchin@linux.dev, dave@stgolabs.net, willy@infradead.org,
	liam.howlett@oracle.com, void@manifault.com, peterz@infradead.org,
	juri.lelli@redhat.com, ldufour@linux.ibm.com, peterx@redhat.com,
	david@redhat.com, axboe@kernel.dk, mcgrof@kernel.org,
	masahiroy@kernel.org, nathan@kernel.org, changbin.du@intel.com,
	ytcoode@gmail.com, vincent.guittot@linaro.org,
	dietmar.eggemann@arm.com, rostedt@goodmis.org, bsegall@google.com,
	bristot@redhat.com, vschneid@redhat.com, cl@linux.com,
	penberg@kernel.org, iamjoonsoo.kim@lge.com, 42.hyeyoo@gmail.com,
	glider@google.com, elver@google.com, dvyukov@google.com,
	shakeelb@google.com, songmuchun@bytedance.com, arnd@arndb.de,
	jbaron@akamai.com, rientjes@google.com, minchan@google.com,
	kaleshsingh@google.com, kernel-team@android.com, linux-mm@kvack.org,
	iommu@lists.linux.dev, kasan-dev@googlegroups.com,
	io-uring@vger.kernel.org, linux-arch@vger.kernel.org,
	xen-devel@lists.xenproject.org, linux-bcache@vger.kernel.org,
	linux-modules@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH 03/30] Lazy percpu counters
Message-ID: <20220831162030.hzgzhxu3qn6g3k5r@moria.home.lan>
References: <20220830214919.53220-1-surenb@google.com>
 <20220830214919.53220-4-surenb@google.com>
 <20220831100249.f2o27ri7ho4ma3pe@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220831100249.f2o27ri7ho4ma3pe@suse.de>
X-Migadu-Flow: FLOW_OUT
X-Migadu-Auth-User: linux.dev

On Wed, Aug 31, 2022 at 11:02:49AM +0100, Mel Gorman wrote:
> On Tue, Aug 30, 2022 at 02:48:52PM -0700, Suren Baghdasaryan wrote:
> > From: Kent Overstreet <kent.overstreet@linux.dev>
> > 
> > This patch adds lib/lazy-percpu-counter.c, which implements counters
> > that start out as atomics, but lazily switch to percpu mode if the
> > update rate crosses some threshold (arbitrarily set at 256 per second).
> > 
> > Signed-off-by: Kent Overstreet <kent.overstreet@linux.dev>
> 
> Why not use percpu_counter? It has a per-cpu counter that is synchronised
> when a batch threshold (default 32) is exceeded and can explicitly sync
> the counters when required assuming the synchronised count is only needed
> when reading debugfs.

It doesn't switch from atomic mode to percpu mode when the update rate crosses a
threshold like lazy percpu counters does, it allocates all the percpu counters
up front - that makes it a non starter here.

Also, from my reading of the code... wtf is it even doing, and why would I use
it at all? This looks like old grotty code from ext3, it's not even using
this_cpu_add() - it does preempt_enable()/disable() just for adding to a local
percpu counter!

Noooooope.

