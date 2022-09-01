Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 450DC5AA73C
	for <lists+xen-devel@lfdr.de>; Fri,  2 Sep 2022 07:29:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.397065.637858 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oTzEE-0003ZS-EN; Fri, 02 Sep 2022 05:28:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 397065.637858; Fri, 02 Sep 2022 05:28:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oTzEE-0003Uj-7b; Fri, 02 Sep 2022 05:28:30 +0000
Received: by outflank-mailman (input) for mailman id 397065;
 Thu, 01 Sep 2022 23:41:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=M97J=ZE=linux.dev=roman.gushchin@srs-se1.protection.inumbo.net>)
 id 1oTtnz-0003y2-6R
 for xen-devel@lists.xenproject.org; Thu, 01 Sep 2022 23:41:03 +0000
Received: from out2.migadu.com (out2.migadu.com [2001:41d0:2:aacc::])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 89926ecd-2a4f-11ed-82f2-63bd783d45fa;
 Fri, 02 Sep 2022 01:41:02 +0200 (CEST)
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
X-Inumbo-ID: 89926ecd-2a4f-11ed-82f2-63bd783d45fa
Date: Thu, 1 Sep 2022 16:40:36 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1662075661;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=VCjuzNKAQwi4WscZTTheCwWMDo51dWnYKGYDxlIvOxM=;
	b=B9gaPrqoM9PK1lD+hEX/op7qHNl+aw6jdPSVrB1+SupdzgrKuElns2pV73ErXthR33K4/r
	Csn8Bq+pn89vebEyMD7KRNTie0fIVFpBfkYpm+nAJ89w7k+b02t9MZ2ViDAd0K6/czkU7+
	8O6NPwDmFvimrwGJf/eHTnN/ekV1fK4=
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
Subject: Re: [RFC PATCH 14/30] mm: prevent slabobj_ext allocations for
 slabobj_ext and kmem_cache objects
Message-ID: <YxFC9NSQ7OADTEwp@P9FQF9L96D.corp.robot.car>
References: <20220830214919.53220-1-surenb@google.com>
 <20220830214919.53220-15-surenb@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220830214919.53220-15-surenb@google.com>
X-Migadu-Flow: FLOW_OUT
X-Migadu-Auth-User: linux.dev

On Tue, Aug 30, 2022 at 02:49:03PM -0700, Suren Baghdasaryan wrote:
> Use __GFP_NO_OBJ_EXT to prevent recursions when allocating slabobj_ext
> objects. Also prevent slabobj_ext allocations for kmem_cache objects.
> 
> Signed-off-by: Suren Baghdasaryan <surenb@google.com>

Patches 12-14 look good to me.
It's probably to early to ack anything, but otherwise I'd ack them.

Thanks!

