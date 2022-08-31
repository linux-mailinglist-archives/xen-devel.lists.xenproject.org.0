Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 690ED5A795A
	for <lists+xen-devel@lfdr.de>; Wed, 31 Aug 2022 10:49:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.395573.635325 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oTJNl-0007Br-Tr; Wed, 31 Aug 2022 08:47:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 395573.635325; Wed, 31 Aug 2022 08:47:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oTJNl-00079j-Qq; Wed, 31 Aug 2022 08:47:33 +0000
Received: by outflank-mailman (input) for mailman id 395573;
 Wed, 31 Aug 2022 08:42:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=E34P=ZD=linux.dev=kent.overstreet@srs-se1.protection.inumbo.net>)
 id 1oTJJ4-00074k-5p
 for xen-devel@lists.xenproject.org; Wed, 31 Aug 2022 08:42:42 +0000
Received: from out0.migadu.com (out0.migadu.com [94.23.1.103])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id df08ad30-2908-11ed-a60c-1f1ba7de4fb0;
 Wed, 31 Aug 2022 10:42:40 +0200 (CEST)
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
X-Inumbo-ID: df08ad30-2908-11ed-a60c-1f1ba7de4fb0
Date: Wed, 31 Aug 2022 04:42:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1661935359;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=mmxSzJIEbF0byhuM+VO8IRNgyEUbvUgCaJEiam4Pxpk=;
	b=n/WRdO6wsbcgzM9IZmiTOpoQilc55+w4Qjuqwl1Dpnv4eEgQ85RLBu7SGRYgk8JFEOmxmG
	9NkKta+Gf2utqPzv5rM3bIlfQN3qtDLursIA2MwCGrMNSc7KVtiJCfMkW0/8k5e3nZiAGS
	tjj529y20oHTMERlcuL/JelsPUM2hZU=
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
Subject: Re: [RFC PATCH 00/30] Code tagging framework and applications
Message-ID: <20220831084230.3ti3vitrzhzsu3fs@moria.home.lan>
References: <20220830214919.53220-1-surenb@google.com>
 <Yw8P8xZ4zqu121xL@hirez.programming.kicks-ass.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Yw8P8xZ4zqu121xL@hirez.programming.kicks-ass.net>
X-Migadu-Flow: FLOW_OUT
X-Migadu-Auth-User: linux.dev

On Wed, Aug 31, 2022 at 09:38:27AM +0200, Peter Zijlstra wrote:
> On Tue, Aug 30, 2022 at 02:48:49PM -0700, Suren Baghdasaryan wrote:
> > ===========================
> > Code tagging framework
> > ===========================
> > Code tag is a structure identifying a specific location in the source code
> > which is generated at compile time and can be embedded in an application-
> > specific structure. Several applications of code tagging are included in
> > this RFC, such as memory allocation tracking, dynamic fault injection,
> > latency tracking and improved error code reporting.
> > Basically, it takes the old trick of "define a special elf section for
> > objects of a given type so that we can iterate over them at runtime" and
> > creates a proper library for it.
> 
> I might be super dense this morning, but what!? I've skimmed through the
> set and I don't think I get it.
> 
> What does this provide that ftrace/kprobes don't already allow?

You're kidding, right?

