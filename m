Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CC8795A8F3C
	for <lists+xen-devel@lfdr.de>; Thu,  1 Sep 2022 09:06:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.396245.636324 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oTeH6-0001nb-Hm; Thu, 01 Sep 2022 07:06:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 396245.636324; Thu, 01 Sep 2022 07:06:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oTeH6-0001lb-EX; Thu, 01 Sep 2022 07:06:04 +0000
Received: by outflank-mailman (input) for mailman id 396245;
 Thu, 01 Sep 2022 07:06:03 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nAYD=ZE=infradead.org=peterz@srs-se1.protection.inumbo.net>)
 id 1oTeH5-0001lV-NX
 for xen-devel@lists.xenproject.org; Thu, 01 Sep 2022 07:06:03 +0000
Received: from casper.infradead.org (casper.infradead.org
 [2001:8b0:10b:1236::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8a1b07e9-29c4-11ed-934f-f50d60e1c1bd;
 Thu, 01 Sep 2022 09:06:02 +0200 (CEST)
Received: from j130084.upc-j.chello.nl ([24.132.130.84]
 helo=noisy.programming.kicks-ass.net)
 by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1oTeGh-005oq6-Bs; Thu, 01 Sep 2022 07:05:39 +0000
Received: from hirez.programming.kicks-ass.net
 (hirez.programming.kicks-ass.net [192.168.1.225])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (Client did not present a certificate)
 by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id 417C030041D;
 Thu,  1 Sep 2022 09:05:36 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
 id 110AE20981381; Thu,  1 Sep 2022 09:05:36 +0200 (CEST)
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
X-Inumbo-ID: 8a1b07e9-29c4-11ed-934f-f50d60e1c1bd
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=PMcMlRof4aBmW9ZRc+eOO/2dgQwguo+jd6/zOIwkXz4=; b=CRTVAsmAK2cWYW898rb6ABFc5M
	uLACuGzlIMyaVe8YmnHdnMTCzaRgU/yORC/GoxdMYsKfSqUkdBcV9CHFquRDxtBp1mrHH1Ek8iUcr
	mn1JgrUbBdWhUq0dshggnSScCFSCXwzSSm1KuWPF7x5mOnsP+VDfpzlLoRknLlMRFYgTP9KQNHlgH
	CH7qbZF+ZmtxkOzs27I6vkqhMH23AuEUp5/xcLcIfVX3lpAkPrSHOObJikPLlUvDymQfq9PPQJW2d
	ahsXPS2phTb5F2Rtarg5EDnzM/T3m8B4GVcztEaB4FRglzTR7JDiDhZuuZYYAbZtb5/Iw4ZAPbP6X
	Wmout+LA==;
Date: Thu, 1 Sep 2022 09:05:35 +0200
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
Message-ID: <YxBZv1pZ6N2vwcP3@hirez.programming.kicks-ass.net>
References: <20220830214919.53220-1-surenb@google.com>
 <Yw8P8xZ4zqu121xL@hirez.programming.kicks-ass.net>
 <20220831084230.3ti3vitrzhzsu3fs@moria.home.lan>
 <20220831101948.f3etturccmp5ovkl@suse.de>
 <20220831155941.q5umplytbx6offku@moria.home.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220831155941.q5umplytbx6offku@moria.home.lan>

On Wed, Aug 31, 2022 at 11:59:41AM -0400, Kent Overstreet wrote:

> Also, ftrace can drop events. Not really ideal if under system load your memory
> accounting numbers start to drift.

You could attach custom handlers to tracepoints. If you were to replace
these unconditional code hooks of yours with tracepoints then you could
conditionally (say at boot) register custom handlers that do the
accounting you want.

Nobody is mandating you use the ftrace ringbuffer to consume tracepoints.
Many people these days attach eBPF scripts to them and do whatever they
want.

