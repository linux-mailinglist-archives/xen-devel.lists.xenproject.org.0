Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DB655B15AE
	for <lists+xen-devel@lfdr.de>; Thu,  8 Sep 2022 09:31:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.402751.644605 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oWBzl-0002Mr-4b; Thu, 08 Sep 2022 07:30:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 402751.644605; Thu, 08 Sep 2022 07:30:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oWBzl-0002Jh-1m; Thu, 08 Sep 2022 07:30:41 +0000
Received: by outflank-mailman (input) for mailman id 402751;
 Thu, 08 Sep 2022 07:30:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=W5tW=ZL=linux.dev=kent.overstreet@srs-se1.protection.inumbo.net>)
 id 1oWBzk-0002Jb-Di
 for xen-devel@lists.xenproject.org; Thu, 08 Sep 2022 07:30:40 +0000
Received: from out0.migadu.com (out0.migadu.com [2001:41d0:2:267::])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 21e20eaa-2f48-11ed-9760-273f2230c3a0;
 Thu, 08 Sep 2022 09:30:39 +0200 (CEST)
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
X-Inumbo-ID: 21e20eaa-2f48-11ed-9760-273f2230c3a0
Date: Thu, 8 Sep 2022 03:29:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1662622236;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=DqfWXb2eEuuOxMq6abU6PffruFzdNn4Aud1F5cFJAhI=;
	b=Fw8tAVGZj5GyiSqYxRkRmSk4x1RT2ZwVJU0JDfghWsKBfIGHKaRr04lhoKOVAsK9mBuLF+
	9iI0Zcp5Zlk1fasn3UZcG2E28IiTTnVsfmeKdAq1LMPY/5nchmAf+pI4zvkYYgOYnJoj7B
	58GfzCiu+o2KhFlYF9EH5IZegrVCLG0=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Kent Overstreet <kent.overstreet@linux.dev>
To: Michal Hocko <mhocko@suse.com>
Cc: Steven Rostedt <rostedt@goodmis.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Mel Gorman <mgorman@suse.de>, Peter Zijlstra <peterz@infradead.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Vlastimil Babka <vbabka@suse.cz>,
	Johannes Weiner <hannes@cmpxchg.org>,
	Roman Gushchin <roman.gushchin@linux.dev>,
	Davidlohr Bueso <dave@stgolabs.net>,
	Matthew Wilcox <willy@infradead.org>,
	"Liam R. Howlett" <liam.howlett@oracle.com>,
	David Vernet <void@manifault.com>,
	Juri Lelli <juri.lelli@redhat.com>,
	Laurent Dufour <ldufour@linux.ibm.com>,
	Peter Xu <peterx@redhat.com>, David Hildenbrand <david@redhat.com>,
	Jens Axboe <axboe@kernel.dk>, mcgrof@kernel.org,
	masahiroy@kernel.org, nathan@kernel.org, changbin.du@intel.com,
	ytcoode@gmail.com, Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Benjamin Segall <bsegall@google.com>,
	Daniel Bristot de Oliveira <bristot@redhat.com>,
	Valentin Schneider <vschneid@redhat.com>,
	Christopher Lameter <cl@linux.com>,
	Pekka Enberg <penberg@kernel.org>,
	Joonsoo Kim <iamjoonsoo.kim@lge.com>, 42.hyeyoo@gmail.com,
	Alexander Potapenko <glider@google.com>,
	Marco Elver <elver@google.com>, Dmitry Vyukov <dvyukov@google.com>,
	Shakeel Butt <shakeelb@google.com>,
	Muchun Song <songmuchun@bytedance.com>, arnd@arndb.de,
	jbaron@akamai.com, David Rientjes <rientjes@google.com>,
	Minchan Kim <minchan@google.com>,
	Kalesh Singh <kaleshsingh@google.com>,
	kernel-team <kernel-team@android.com>,
	linux-mm <linux-mm@kvack.org>, iommu@lists.linux.dev,
	kasan-dev@googlegroups.com, io-uring@vger.kernel.org,
	linux-arch@vger.kernel.org, xen-devel@lists.xenproject.org,
	linux-bcache@vger.kernel.org, linux-modules@vger.kernel.org,
	LKML <linux-kernel@vger.kernel.org>
Subject: Re: [RFC PATCH 00/30] Code tagging framework and applications
Message-ID: <20220908072950.yapakb5scocxezhy@kmo-framework>
References: <20220901201502.sn6223bayzwferxv@moria.home.lan>
 <YxW4Ig338d2vQAz3@dhcp22.suse.cz>
 <20220905234649.525vorzx27ybypsn@kmo-framework>
 <Yxb1cxDSyte1Ut/F@dhcp22.suse.cz>
 <20220906182058.iijmpzu4rtxowy37@kmo-framework>
 <Yxh5ueDTAOcwEmCQ@dhcp22.suse.cz>
 <20220907130323.rwycrntnckc6h43n@kmo-framework>
 <20220907094306.3383dac2@gandalf.local.home>
 <20220908063548.u4lqkhquuvkwzvda@kmo-framework>
 <YxmV7a2pnj1Kldzi@dhcp22.suse.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YxmV7a2pnj1Kldzi@dhcp22.suse.cz>
X-Migadu-Flow: FLOW_OUT
X-Migadu-Auth-User: linux.dev

On Thu, Sep 08, 2022 at 09:12:45AM +0200, Michal Hocko wrote:
> Then you have probably missed a huge part of my emails. Please
> re-read. If those arguments are not clear, feel free to ask for
> clarification. Reducing the whole my reasoning and objections to the
> sentence above and calling that vapid and lazy is not only unfair but
> also disrespectful.

What, where you complained about slab's page allocations showing up in the
profile instead of slab, and I pointed out to you that actually each and every
slab call is instrumented, and you're just seeing some double counting (that we
will no doubt fix?)

Or when you complained about allocation sites where it should actually be the
caller that should be instrumented, and I pointed out that it'd be quite easy to
simply change that code to use _kmalloc() and slab_tag_add() directly, if it
becomes an issue.

Of course, if we got that far, we'd have this code to thank for telling us where
to look!

Did I miss anything?

