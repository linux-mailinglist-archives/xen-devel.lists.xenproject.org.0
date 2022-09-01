Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 915555A9AB0
	for <lists+xen-devel@lfdr.de>; Thu,  1 Sep 2022 16:43:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.396710.636978 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oTlPe-0002sB-2q; Thu, 01 Sep 2022 14:43:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 396710.636978; Thu, 01 Sep 2022 14:43:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oTlPd-0002qN-WA; Thu, 01 Sep 2022 14:43:21 +0000
Received: by outflank-mailman (input) for mailman id 396710;
 Thu, 01 Sep 2022 14:43:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=j4CE=ZE=linux.dev=kent.overstreet@srs-se1.protection.inumbo.net>)
 id 1oTlPc-0002qH-Lc
 for xen-devel@lists.xenproject.org; Thu, 01 Sep 2022 14:43:20 +0000
Received: from out2.migadu.com (out2.migadu.com [2001:41d0:2:aacc::])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6b1a5855-2a04-11ed-934f-f50d60e1c1bd;
 Thu, 01 Sep 2022 16:43:19 +0200 (CEST)
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
X-Inumbo-ID: 6b1a5855-2a04-11ed-934f-f50d60e1c1bd
Date: Thu, 1 Sep 2022 10:43:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1662043398;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=nOHSW3FDpFxopIM9LbojW3h32sP5UuFpnfFE44cGJM8=;
	b=DYXiWVC0vy4teLKZQztFxvW1KXEKgsv/W8GLVht+MMEppphvXl1beWtjobZtBs7ufDfyf1
	/Az+HrU+UnzwRWndfnxlx9U/cWoea5qHWVDTW/7rGq5kcj9ODLnVIRzkPJn+RdzRKpoYMZ
	5Z1XsUa8iU3hq/D237KbAKpwZVrQllY=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Kent Overstreet <kent.overstreet@linux.dev>
To: Peter Zijlstra <peterz@infradead.org>
Cc: Suren Baghdasaryan <surenb@google.com>, akpm@linux-foundation.org,
	mhocko@suse.com, vbabka@suse.cz, hannes@cmpxchg.org,
	roman.gushchin@linux.dev, mgorman@suse.de, dave@stgolabs.net,
	willy@infradead.org, liam.howlett@oracle.com, void@manifault.com,
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
Subject: Re: [RFC PATCH 27/30] Code tagging based latency tracking
Message-ID: <20220901144311.ywhhdaigweyy7eo6@moria.home.lan>
References: <20220830214919.53220-1-surenb@google.com>
 <20220830214919.53220-28-surenb@google.com>
 <YxBbFUirdlbXDaZA@hirez.programming.kicks-ass.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YxBbFUirdlbXDaZA@hirez.programming.kicks-ass.net>
X-Migadu-Flow: FLOW_OUT
X-Migadu-Auth-User: linux.dev

On Thu, Sep 01, 2022 at 09:11:17AM +0200, Peter Zijlstra wrote:
> On Tue, Aug 30, 2022 at 02:49:16PM -0700, Suren Baghdasaryan wrote:
> > From: Kent Overstreet <kent.overstreet@linux.dev>
> > 
> > This adds the ability to easily instrument code for measuring latency.
> > To use, add the following to calls to your code, at the start and end of
> > the event you wish to measure:
> > 
> >   code_tag_time_stats_start(start_time);
> >   code_tag_time_stats_finish(start_time);
> > 
> > Stastistics will then show up in debugfs under
> > /sys/kernel/debug/time_stats, listed by file and line number.
> > 
> > Stastics measured include weighted averages of frequency, duration, max
> > duration, as well as quantiles.
> > 
> > This patch also instruments all calls to init_wait and finish_wait,
> > which includes all calls to wait_event. Example debugfs output:
> 
> How can't you do this with a simple eBPF script on top of
> trace_sched_stat_* and friends?

I know about those tracepoints, and I've never found them to be usable. I've
never succesfully used them for debugging latency issues, or known anyone who
has.

And an eBPF script to do everything this does wouldn't be simple at all.
Honesly, the time stats stuff looks _far_ simpler to me than anything involving
tracing - and with tracing you have to correlate the start and end events after
the fact.

