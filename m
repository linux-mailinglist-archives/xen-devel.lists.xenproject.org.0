Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AD375A90A0
	for <lists+xen-devel@lfdr.de>; Thu,  1 Sep 2022 09:42:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.396282.636380 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oTepq-0008Ec-Gy; Thu, 01 Sep 2022 07:41:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 396282.636380; Thu, 01 Sep 2022 07:41:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oTepq-0008CZ-Dw; Thu, 01 Sep 2022 07:41:58 +0000
Received: by outflank-mailman (input) for mailman id 396282;
 Thu, 01 Sep 2022 07:41:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nAYD=ZE=infradead.org=peterz@srs-se1.protection.inumbo.net>)
 id 1oTepn-00089g-Q6
 for xen-devel@lists.xenproject.org; Thu, 01 Sep 2022 07:41:56 +0000
Received: from desiato.infradead.org (desiato.infradead.org
 [2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8b3ba9bb-29c9-11ed-82f2-63bd783d45fa;
 Thu, 01 Sep 2022 09:41:54 +0200 (CEST)
Received: from j130084.upc-j.chello.nl ([24.132.130.84]
 helo=noisy.programming.kicks-ass.net)
 by desiato.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1oTeoz-008LsS-Eb; Thu, 01 Sep 2022 07:41:05 +0000
Received: from hirez.programming.kicks-ass.net
 (hirez.programming.kicks-ass.net [192.168.1.225])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (Client did not present a certificate)
 by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id B9A783004C7;
 Thu,  1 Sep 2022 09:41:02 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
 id 925E52B871FC0; Thu,  1 Sep 2022 09:41:02 +0200 (CEST)
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
X-Inumbo-ID: 8b3ba9bb-29c9-11ed-82f2-63bd783d45fa
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=qqD5irythXcXnrZi3fFnP54DNBcaxZAOs7bCGWArgiE=; b=JPARXCy/ktCTNTsI4fBC7IcPd9
	h1Ve8e9JJlcq/HUSsnxiSLh1XoPZfbVU1rdEQodlDC9+02aj+Bcxsw6rWsIXY7oMM/OiD2IQxzNyg
	5Jk5Da6y/GziQxfBTbJ7IyXOAmmA32b8DVnPqmNQnhPUh1azIt9r45Z7iftJFNLGQ6Q6LYgo4Bm8P
	MTlFFtLHpqiwrd4d92yZiDd7Q7cVpMbZRSrW5DjTv+6lzgrYGDN59E5Rt+hh2/XVBaRSLgThHqCSy
	HseLcL993B/RKuvpE5FDbemPV2dWr+H5GBs5aHL9ajh2cHPNHxrOHPXrU/0MhKYPqqT/RQ18mwJzs
	J7A2D+Bw==;
Date: Thu, 1 Sep 2022 09:41:02 +0200
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
Subject: Re: [RFC PATCH 10/30] mm: enable page allocation tagging for
 __get_free_pages and alloc_pages
Message-ID: <YxBiDmmhn4wlwIHC@hirez.programming.kicks-ass.net>
References: <20220830214919.53220-1-surenb@google.com>
 <20220830214919.53220-11-surenb@google.com>
 <20220831101103.fj5hjgy3dbb44fit@suse.de>
 <20220831174629.zpa2pu6hpxmytqya@moria.home.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220831174629.zpa2pu6hpxmytqya@moria.home.lan>

On Wed, Aug 31, 2022 at 01:46:29PM -0400, Kent Overstreet wrote:

> Because all the counters are statically allocated, without even a pointer deref
> to get to them in the allocation path (one pointer deref to get to them in the
> deallocate path), that makes this _much, much_ cheaper than anything that could
> be done with tracing - cheap enough that I expect many users will want to enable
> it in production.

You're contributing to death-by-a-thousand-cuts here. By making all this
unconditional you're putting distros in a bind. Most of their users will
likely not care about this, but if they enable it, they'll still pay the
price for having it.

Even static counters will have cache misses etc..

So yes, for the few people that actually care about this stuff, this
might be a bit faster, but IMO it gets the econimics all backwards,
you're making everybody pay the price instead of only those that care.

Also note that you can have your tracepoint based handler have
statically allocated data just fine.


