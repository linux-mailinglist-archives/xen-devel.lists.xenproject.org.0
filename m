Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 255525A77AA
	for <lists+xen-devel@lfdr.de>; Wed, 31 Aug 2022 09:39:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.395561.635316 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oTIJh-0008F2-IP; Wed, 31 Aug 2022 07:39:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 395561.635316; Wed, 31 Aug 2022 07:39:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oTIJh-0008BZ-FN; Wed, 31 Aug 2022 07:39:17 +0000
Received: by outflank-mailman (input) for mailman id 395561;
 Wed, 31 Aug 2022 07:39:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=IsIN=ZD=infradead.org=peterz@srs-se1.protection.inumbo.net>)
 id 1oTIJd-0008B8-Tn
 for xen-devel@lists.xenproject.org; Wed, 31 Aug 2022 07:39:16 +0000
Received: from casper.infradead.org (casper.infradead.org
 [2001:8b0:10b:1236::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 00620d2b-2900-11ed-a60c-1f1ba7de4fb0;
 Wed, 31 Aug 2022 09:39:12 +0200 (CEST)
Received: from j130084.upc-j.chello.nl ([24.132.130.84]
 helo=noisy.programming.kicks-ass.net)
 by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1oTIIy-004tbB-R2; Wed, 31 Aug 2022 07:38:32 +0000
Received: from hirez.programming.kicks-ass.net
 (hirez.programming.kicks-ass.net [192.168.1.225])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (Client did not present a certificate)
 by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id 8A485300413;
 Wed, 31 Aug 2022 09:38:27 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
 id 66CD32B843CC0; Wed, 31 Aug 2022 09:38:27 +0200 (CEST)
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
X-Inumbo-ID: 00620d2b-2900-11ed-a60c-1f1ba7de4fb0
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=gDCNZ3f2D6OuuyZZIQqudj53nBzwis7zfrQMn3P2Fjk=; b=OachOLS7idp6QEAC9Bgd5uCF23
	hl591O6qTT1++ASIQ0jtEsU2U22Fqkp8/gT688a10sVOPn0b1B0K87YRtHEsHGKllnCuhLNOgoZP8
	EgWAHDDtAKvBBWUOYy7OK41nFC+B/fq+AOd7gTZOcltIfVfrJCh8O6K1uFTFVZ0SwfXMuKRmaKWOL
	ojN73jHdMPQ9pvggdnSOTXXMi80LyjIx8VWkdBPwFZZOSem1ynyMgY445fFQ9RK/iwsuFZWroGwJK
	hhYhQLnauy4chEbybXECBTey2J5Ko878YkEbrMyqB6qvXYFDRjS3MK18ghZ6wM226iEenHBUDgYzz
	hddw/x0Q==;
Date: Wed, 31 Aug 2022 09:38:27 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Suren Baghdasaryan <surenb@google.com>
Cc: akpm@linux-foundation.org, kent.overstreet@linux.dev, mhocko@suse.com,
	vbabka@suse.cz, hannes@cmpxchg.org, roman.gushchin@linux.dev,
	mgorman@suse.de, dave@stgolabs.net, willy@infradead.org,
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
Message-ID: <Yw8P8xZ4zqu121xL@hirez.programming.kicks-ass.net>
References: <20220830214919.53220-1-surenb@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220830214919.53220-1-surenb@google.com>

On Tue, Aug 30, 2022 at 02:48:49PM -0700, Suren Baghdasaryan wrote:
> ===========================
> Code tagging framework
> ===========================
> Code tag is a structure identifying a specific location in the source code
> which is generated at compile time and can be embedded in an application-
> specific structure. Several applications of code tagging are included in
> this RFC, such as memory allocation tracking, dynamic fault injection,
> latency tracking and improved error code reporting.
> Basically, it takes the old trick of "define a special elf section for
> objects of a given type so that we can iterate over them at runtime" and
> creates a proper library for it.

I might be super dense this morning, but what!? I've skimmed through the
set and I don't think I get it.

What does this provide that ftrace/kprobes don't already allow?

