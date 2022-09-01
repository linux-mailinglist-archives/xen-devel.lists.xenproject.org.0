Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3368A5AA738
	for <lists+xen-devel@lfdr.de>; Fri,  2 Sep 2022 07:29:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.397067.637865 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oTzEE-0003hh-TN; Fri, 02 Sep 2022 05:28:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 397067.637865; Fri, 02 Sep 2022 05:28:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oTzEE-0003YQ-Gv; Fri, 02 Sep 2022 05:28:30 +0000
Received: by outflank-mailman (input) for mailman id 397067;
 Thu, 01 Sep 2022 23:50:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=M97J=ZE=linux.dev=roman.gushchin@srs-se1.protection.inumbo.net>)
 id 1oTtxG-0004sM-75
 for xen-devel@lists.xenproject.org; Thu, 01 Sep 2022 23:50:38 +0000
Received: from out0.migadu.com (out0.migadu.com [2001:41d0:2:267::])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e0393616-2a50-11ed-82f2-63bd783d45fa;
 Fri, 02 Sep 2022 01:50:37 +0200 (CEST)
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
X-Inumbo-ID: e0393616-2a50-11ed-82f2-63bd783d45fa
Date: Thu, 1 Sep 2022 16:50:10 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1662076236;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=QeZ3ywOHO+ue61+bhlHhVrcPOQCnKvUeLhu9G4GOySc=;
	b=sadkhbMj3kQoxTU4Z0wL0RXHLY5y6xZiwOqubD8PoxvVg4LGYu+qUdek9jYhqs8dE5qisD
	cPrzl5F8o1AtoFcEb462CJ9ApSsv/yCMwGqAUCTFZ6Dxme6pBqRmTDZBKFxUtWhaf3KJSH
	DvKiilEWiSx7n4WVSBJXR8PEuxO/ReU=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Roman Gushchin <roman.gushchin@linux.dev>
To: Suren Baghdasaryan <surenb@google.com>
Cc: akpm@linux-foundation.org, kent.overstreet@linux.dev, mhocko@suse.com,
	vbabka@suse.cz, hannes@cmpxchg.org, mgorman@suse.de,
	dave@stgolabs.net, willy@infradead.org, liam.howlett@oracle.com,
	void@manifault.com, peterz@infradead.org, juri.lelli@redhat.com,
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
Subject: Re: [RFC PATCH 16/30] mm: enable slab allocation tagging for kmalloc
 and friends
Message-ID: <YxFFMtvI/J3VN3pl@P9FQF9L96D.corp.robot.car>
References: <20220830214919.53220-1-surenb@google.com>
 <20220830214919.53220-17-surenb@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220830214919.53220-17-surenb@google.com>
X-Migadu-Flow: FLOW_OUT
X-Migadu-Auth-User: linux.dev

On Tue, Aug 30, 2022 at 02:49:05PM -0700, Suren Baghdasaryan wrote:
> Redefine kmalloc, krealloc, kzalloc, kcalloc, etc. to record allocations
> and deallocations done by these functions.

One particular case when this functionality might be very useful:
in the past we've seen examples (at Fb) where it was hard to understand
the difference between slab memory sizes of two different kernel versions
due to slab caches merging. Once a slab cache is merged with another large
cache, this data is pretty much lost. So I definetely see value in stats which
are independent from kmem caches.

The performance overhead is a concern here, so more data would be useful.

Thanks!

