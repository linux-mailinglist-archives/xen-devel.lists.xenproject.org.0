Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 12F515AA333
	for <lists+xen-devel@lfdr.de>; Fri,  2 Sep 2022 00:37:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.396993.637413 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oTsoV-0001gF-TZ; Thu, 01 Sep 2022 22:37:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 396993.637413; Thu, 01 Sep 2022 22:37:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oTsoV-0001cz-Q9; Thu, 01 Sep 2022 22:37:31 +0000
Received: by outflank-mailman (input) for mailman id 396993;
 Thu, 01 Sep 2022 22:37:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=j4CE=ZE=linux.dev=kent.overstreet@srs-se1.protection.inumbo.net>)
 id 1oTsoV-0001ct-99
 for xen-devel@lists.xenproject.org; Thu, 01 Sep 2022 22:37:31 +0000
Received: from out1.migadu.com (out1.migadu.com [91.121.223.63])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a8d027da-2a46-11ed-934f-f50d60e1c1bd;
 Fri, 02 Sep 2022 00:37:28 +0200 (CEST)
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
X-Inumbo-ID: a8d027da-2a46-11ed-934f-f50d60e1c1bd
Date: Thu, 1 Sep 2022 18:37:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1662071848;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=V/P7j4Y+xJUBAt6fEYfNoKfACstBZQ8E1OFd7bHElGY=;
	b=RyUvH2zz81kL6tcYdp2BW6QKmetndFvVS3i7VcCPOcaijLcz0TfOGgBaq909SL/Y1jdlP0
	/Retvz17eFHQUiP5AcXQOlPHDOkvuT6UrIyhDdDGO5y36J1883WvsJluGTqXU9etuyqcdH
	dSwrFVK7mCUuYhH+U9EIxQUe3RmbsW8=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Kent Overstreet <kent.overstreet@linux.dev>
To: Roman Gushchin <roman.gushchin@linux.dev>
Cc: Yosry Ahmed <yosryahmed@google.com>, Michal Hocko <mhocko@suse.com>,
	Mel Gorman <mgorman@suse.de>, Peter Zijlstra <peterz@infradead.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Vlastimil Babka <vbabka@suse.cz>,
	Johannes Weiner <hannes@cmpxchg.org>, dave@stgolabs.net,
	Matthew Wilcox <willy@infradead.org>, liam.howlett@oracle.com,
	void@manifault.com, juri.lelli@redhat.com, ldufour@linux.ibm.com,
	Peter Xu <peterx@redhat.com>, David Hildenbrand <david@redhat.com>,
	axboe@kernel.dk, mcgrof@kernel.org, masahiroy@kernel.org,
	nathan@kernel.org, changbin.du@intel.com, ytcoode@gmail.com,
	vincent.guittot@linaro.org, dietmar.eggemann@arm.com,
	Steven Rostedt <rostedt@goodmis.org>, bsegall@google.com,
	bristot@redhat.com, vschneid@redhat.com,
	Christoph Lameter <cl@linux.com>, Pekka Enberg <penberg@kernel.org>,
	Joonsoo Kim <iamjoonsoo.kim@lge.com>, 42.hyeyoo@gmail.com,
	glider@google.com, elver@google.com, dvyukov@google.com,
	Shakeel Butt <shakeelb@google.com>,
	Muchun Song <songmuchun@bytedance.com>, arnd@arndb.de,
	jbaron@akamai.com, David Rientjes <rientjes@google.com>,
	minchan@google.com, kaleshsingh@google.com, kernel-team@android.com,
	Linux-MM <linux-mm@kvack.org>, iommu@lists.linux.dev,
	kasan-dev@googlegroups.com, io-uring@vger.kernel.org,
	linux-arch@vger.kernel.org, xen-devel@lists.xenproject.org,
	linux-bcache@vger.kernel.org, linux-modules@vger.kernel.org,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [RFC PATCH 00/30] Code tagging framework and applications
Message-ID: <20220901223720.e4gudprscjtwltif@moria.home.lan>
References: <20220830214919.53220-1-surenb@google.com>
 <Yw8P8xZ4zqu121xL@hirez.programming.kicks-ass.net>
 <20220831084230.3ti3vitrzhzsu3fs@moria.home.lan>
 <20220831101948.f3etturccmp5ovkl@suse.de>
 <Yw88RFuBgc7yFYxA@dhcp22.suse.cz>
 <20220831190154.qdlsxfamans3ya5j@moria.home.lan>
 <CAJD7tkaev9B=UDYj2RL6pz-1454J8tv4gEr9y-2dnCksoLK0bw@mail.gmail.com>
 <YxExz+c1k3nbQMh4@P9FQF9L96D.corp.robot.car>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YxExz+c1k3nbQMh4@P9FQF9L96D.corp.robot.car>
X-Migadu-Flow: FLOW_OUT
X-Migadu-Auth-User: linux.dev

On Thu, Sep 01, 2022 at 03:27:27PM -0700, Roman Gushchin wrote:
> On Wed, Aug 31, 2022 at 01:56:08PM -0700, Yosry Ahmed wrote:
> > This is very interesting work! Do you have any data about the overhead
> > this introduces, especially in a production environment? I am
> > especially interested in memory allocations tracking and detecting
> > leaks.
> 
> +1
> 
> I think the question whether it indeed can be always turned on in the production
> or not is the main one. If not, the advantage over ftrace/bpf/... is not that
> obvious. Otherwise it will be indeed a VERY useful thing.

Low enough overhead to run in production was my primary design goal.

Stats are kept in a struct that's defined at the callsite. So this adds _no_
pointer chasing to the allocation path, unless we've switch to percpu counters
at that callsite (see the lazy percpu counters patch), where we need to deref
one percpu pointer to save an atomic.

Then we need to stash a pointer to the alloc_tag, so that kfree() can find it.
For slab allocations this uses the same storage area as memcg, so for
allocations that are using that we won't be touching any additional cachelines.
(I wanted the pointer to the alloc_tag to be stored inline with the allocation,
but that would've caused alignment difficulties).

Then there's a pointer deref introduced to the kfree() path, to get back to the
original alloc_tag and subtract the allocation from that callsite. That one
won't be free, and with percpu counters we've got another dependent load too -
hmm, it might be worth benchmarking with just atomics, skipping the percpu
counters.

So the overhead won't be zero, I expect it'll show up in some synthetic
benchmarks, but yes I do definitely expect this to be worth enabling in
production in many scenarios.

