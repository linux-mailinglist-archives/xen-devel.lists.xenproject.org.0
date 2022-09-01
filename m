Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 591995A9F84
	for <lists+xen-devel@lfdr.de>; Thu,  1 Sep 2022 21:01:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.396907.637299 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oTpQ4-0001X5-VY; Thu, 01 Sep 2022 19:00:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 396907.637299; Thu, 01 Sep 2022 19:00:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oTpQ4-0001TX-S9; Thu, 01 Sep 2022 19:00:04 +0000
Received: by outflank-mailman (input) for mailman id 396907;
 Thu, 01 Sep 2022 19:00:04 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nAYD=ZE=infradead.org=peterz@srs-se1.protection.inumbo.net>)
 id 1oTpQ3-0001A8-Ap
 for xen-devel@lists.xenproject.org; Thu, 01 Sep 2022 19:00:03 +0000
Received: from desiato.infradead.org (desiato.infradead.org
 [2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 47c71bfb-2a28-11ed-82f2-63bd783d45fa;
 Thu, 01 Sep 2022 21:00:01 +0200 (CEST)
Received: from j130084.upc-j.chello.nl ([24.132.130.84]
 helo=noisy.programming.kicks-ass.net)
 by desiato.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1oTpPP-008Swy-VE; Thu, 01 Sep 2022 18:59:24 +0000
Received: from hirez.programming.kicks-ass.net
 (hirez.programming.kicks-ass.net [192.168.1.225])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (Client did not present a certificate)
 by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id 8F5993002C7;
 Thu,  1 Sep 2022 20:59:20 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
 id 729172B8B840F; Thu,  1 Sep 2022 20:59:20 +0200 (CEST)
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
X-Inumbo-ID: 47c71bfb-2a28-11ed-82f2-63bd783d45fa
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=qo1Y7wjVRM1IPrvgDfwSP6kiSpx5CHm6THH/U/nXDvQ=; b=Cn40tdhd1E1TwjC2GqnrK/VMBS
	bok5IW5dPqC9b0Puyc5kB0GIPwBvnyb6nAzkLqRz8cvGe+hZxxiWfH5MRjXqCuiD8wRV3vAuxJP+J
	rBin1pHHm0PdKxLBfMtFhMb+NWLGsCy4r7eBzhOiR3RJwsipcHoCKo1LbfkIAxXUeO3hEsfIiXhrq
	k8QoRcUNeRFsus+I7Ba6wWsVhV63eeopBg9ahpU9S/Ox/FDoVHSGM37kZ29behPJVXZzWay4XLu5T
	q0+gdXxrW0zeerMoRET2yGibvMP6RcQg1rpJRDmnkL9WKUV+AjGLfBnI/ialwweB0bUk0PRwtZdkh
	fjN9qgsg==;
Date: Thu, 1 Sep 2022 20:59:20 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Kent Overstreet <kent.overstreet@linux.dev>
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
Subject: Re: [RFC PATCH 03/30] Lazy percpu counters
Message-ID: <YxEBCCA4qaMbbKYA@hirez.programming.kicks-ass.net>
References: <20220830214919.53220-1-surenb@google.com>
 <20220830214919.53220-4-surenb@google.com>
 <YxBWczNCbZbj+reQ@hirez.programming.kicks-ass.net>
 <20220901143219.n7jg7cbp47agqnwn@moria.home.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220901143219.n7jg7cbp47agqnwn@moria.home.lan>

On Thu, Sep 01, 2022 at 10:32:19AM -0400, Kent Overstreet wrote:
> On Thu, Sep 01, 2022 at 08:51:31AM +0200, Peter Zijlstra wrote:
> > On Tue, Aug 30, 2022 at 02:48:52PM -0700, Suren Baghdasaryan wrote:
> > > +static void lazy_percpu_counter_switch_to_pcpu(struct raw_lazy_percpu_counter *c)
> > > +{
> > > +	u64 __percpu *pcpu_v = alloc_percpu_gfp(u64, GFP_ATOMIC|__GFP_NOWARN);
> > 
> > Realize that this is incorrect when used under a raw_spinlock_t.
> 
> Can you elaborate?

required lock order: raw_spinlock_t < spinlock_t < mutex

allocators lives at spinlock_t.

Also see CONFIG_PROVE_RAW_LOCK_NESTING and there might be a document
mentioning all this somewhere.

Additionally, this (obviously) also isn't NMI safe.

