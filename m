Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 002805A90C0
	for <lists+xen-devel@lfdr.de>; Thu,  1 Sep 2022 09:43:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.396294.636391 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oTeqw-0000Vr-Qf; Thu, 01 Sep 2022 07:43:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 396294.636391; Thu, 01 Sep 2022 07:43:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oTeqw-0000T6-Nv; Thu, 01 Sep 2022 07:43:06 +0000
Received: by outflank-mailman (input) for mailman id 396294;
 Thu, 01 Sep 2022 07:43:05 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nAYD=ZE=infradead.org=peterz@srs-se1.protection.inumbo.net>)
 id 1oTeqv-0000Ss-Ho
 for xen-devel@lists.xenproject.org; Thu, 01 Sep 2022 07:43:05 +0000
Received: from desiato.infradead.org (desiato.infradead.org
 [2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b467620a-29c9-11ed-934f-f50d60e1c1bd;
 Thu, 01 Sep 2022 09:43:04 +0200 (CEST)
Received: from j130084.upc-j.chello.nl ([24.132.130.84]
 helo=noisy.programming.kicks-ass.net)
 by desiato.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1oTeqK-008Lun-Me; Thu, 01 Sep 2022 07:42:29 +0000
Received: from hirez.programming.kicks-ass.net
 (hirez.programming.kicks-ass.net [192.168.1.225])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (Client did not present a certificate)
 by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id 42B7B3004C3;
 Thu,  1 Sep 2022 09:42:27 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
 id 344DD2B871FC3; Thu,  1 Sep 2022 09:42:27 +0200 (CEST)
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
X-Inumbo-ID: b467620a-29c9-11ed-934f-f50d60e1c1bd
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=3R95H7o4Ps0Xt8Fb2RGRK8ftexUpMSTfRccKzarlwv8=; b=cEnZuv0S8882sMY0V4idR0aM/6
	NqpoeC6HiiPZCRZB+q7pbcmjTYQVGKdLFuTqWdD9tmZbQHkl7gb/6TKBz1e8MgkX++zFc6yHPCNUW
	bF6DamNCBPgsv8c5UHXFsxGkgdo7kirLBRuOzs8d0ba612Y0O3wFEdbPjoyu0lGF3zXvBlqZddz+S
	SWvUETxD7iVku0Jt2FQC4wu6ha6Jn/Ir6zDNcVvdMDjBBsn19vlk5tNNqFTmcAHigv3R4+n+4+5j8
	xTOiNNQQ6LoUNOPzLwFnQUrP5b7WKw+VwsS5V6FUynhnpOpiazug3AhcURUgxPCTLrmgmxVUKs64W
	VGRwP+zg==;
Date: Thu, 1 Sep 2022 09:42:27 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: Mel Gorman <mgorman@suse.de>, Suren Baghdasaryan <surenb@google.com>,
	akpm@linux-foundation.org, mhocko@suse.com, vbabka@suse.cz,
	hannes@cmpxchg.org, roman.gushchin@linux.dev, dave@stgolabs.net,
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
Subject: Re: [RFC PATCH 00/30] Code tagging framework and applications
Message-ID: <YxBiY5hDUSE4ZqKM@hirez.programming.kicks-ass.net>
References: <20220830214919.53220-1-surenb@google.com>
 <Yw8P8xZ4zqu121xL@hirez.programming.kicks-ass.net>
 <20220831084230.3ti3vitrzhzsu3fs@moria.home.lan>
 <20220831101948.f3etturccmp5ovkl@suse.de>
 <20220831155941.q5umplytbx6offku@moria.home.lan>
 <YxBZv1pZ6N2vwcP3@hirez.programming.kicks-ass.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YxBZv1pZ6N2vwcP3@hirez.programming.kicks-ass.net>

On Thu, Sep 01, 2022 at 09:05:36AM +0200, Peter Zijlstra wrote:
> On Wed, Aug 31, 2022 at 11:59:41AM -0400, Kent Overstreet wrote:
> 
> > Also, ftrace can drop events. Not really ideal if under system load your memory
> > accounting numbers start to drift.
> 
> You could attach custom handlers to tracepoints. If you were to replace
> these unconditional code hooks of yours with tracepoints then you could
> conditionally (say at boot) register custom handlers that do the
> accounting you want.
> 
> Nobody is mandating you use the ftrace ringbuffer to consume tracepoints.
> Many people these days attach eBPF scripts to them and do whatever they
> want.

Look at kernel/trace/blktrace.c for a fine in-kernel !BFP example of this.

