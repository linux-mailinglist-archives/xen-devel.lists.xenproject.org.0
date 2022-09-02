Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B5DB35AA73A
	for <lists+xen-devel@lfdr.de>; Fri,  2 Sep 2022 07:29:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.397100.637873 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oTzEF-0003uv-Af; Fri, 02 Sep 2022 05:28:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 397100.637873; Fri, 02 Sep 2022 05:28:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oTzEF-0003gb-35; Fri, 02 Sep 2022 05:28:31 +0000
Received: by outflank-mailman (input) for mailman id 397100;
 Fri, 02 Sep 2022 01:05:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=DrtX=ZF=linux.dev=roman.gushchin@srs-se1.protection.inumbo.net>)
 id 1oTv7E-0006MX-F5
 for xen-devel@lists.xenproject.org; Fri, 02 Sep 2022 01:05:01 +0000
Received: from out1.migadu.com (out1.migadu.com [91.121.223.63])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 439feea4-2a5b-11ed-934f-f50d60e1c1bd;
 Fri, 02 Sep 2022 03:04:58 +0200 (CEST)
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
X-Inumbo-ID: 439feea4-2a5b-11ed-934f-f50d60e1c1bd
Date: Thu, 1 Sep 2022 18:04:46 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1662080697;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=oRI44dmgZNXvCbxbx0ytBb5MNkpf1qBSJsTY6pAYXVg=;
	b=tb82WN7ukOq58edHhF7JOoDon3b2L1v/3IY97PsYRx6OPp66Trpvsx1rbRyhlh12fOiUwG
	EZmYoO3fSDUB2lu8gxsuWxZiVkHfm4qLeJxKDdrjL94MRoA3GDg6F5I9+Uj2cx14iFfbdO
	He+0U/hKqYLU04r4PhzKId0lgLZpOKY=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Roman Gushchin <roman.gushchin@linux.dev>
To: Kent Overstreet <kent.overstreet@linux.dev>
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
Message-ID: <YxFWrka+Wx0FfLXU@P9FQF9L96D.lan>
References: <Yw8P8xZ4zqu121xL@hirez.programming.kicks-ass.net>
 <20220831084230.3ti3vitrzhzsu3fs@moria.home.lan>
 <20220831101948.f3etturccmp5ovkl@suse.de>
 <Yw88RFuBgc7yFYxA@dhcp22.suse.cz>
 <20220831190154.qdlsxfamans3ya5j@moria.home.lan>
 <CAJD7tkaev9B=UDYj2RL6pz-1454J8tv4gEr9y-2dnCksoLK0bw@mail.gmail.com>
 <YxExz+c1k3nbQMh4@P9FQF9L96D.corp.robot.car>
 <20220901223720.e4gudprscjtwltif@moria.home.lan>
 <YxE4BXw5i+BkxxD8@P9FQF9L96D.corp.robot.car>
 <20220902001747.qqsv2lzkuycffuqe@moria.home.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220902001747.qqsv2lzkuycffuqe@moria.home.lan>
X-Migadu-Flow: FLOW_OUT
X-Migadu-Auth-User: linux.dev

On Thu, Sep 01, 2022 at 08:17:47PM -0400, Kent Overstreet wrote:
> On Thu, Sep 01, 2022 at 03:53:57PM -0700, Roman Gushchin wrote:
> > I'd suggest to run something like iperf on a fast hardware. And maybe some
> > io_uring stuff too. These are two places which were historically most sensitive
> > to the (kernel) memory accounting speed.
> 
> I'm getting wildly inconsistent results with iperf.
> 
> io_uring-echo-server and rust_echo_bench gets me:
> Benchmarking: 127.0.0.1:12345
> 50 clients, running 512 bytes, 60 sec.
> 
> Without alloc tagging:	120547 request/sec
> With:			116748 request/sec
> 
> https://github.com/frevib/io_uring-echo-server
> https://github.com/haraldh/rust_echo_bench
> 
> How's that look to you? Close enough? :)

Yes, this looks good (a bit too good).

I'm not that familiar with io_uring, Jens and Pavel should have a better idea
what and how to run (I know they've workarounded the kernel memory accounting
because of the performance in the past, this is why I suspect it might be an
issue here as well).

This is a recent optimization on the networking side:
https://lore.kernel.org/linux-mm/20220825000506.239406-1-shakeelb@google.com/

Maybe you can try to repeat this experiment.

Thanks!

