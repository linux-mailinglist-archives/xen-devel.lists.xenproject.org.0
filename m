Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 447B05ADC00
	for <lists+xen-devel@lfdr.de>; Tue,  6 Sep 2022 01:51:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.399266.640381 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oVLs2-00047o-VF; Mon, 05 Sep 2022 23:51:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 399266.640381; Mon, 05 Sep 2022 23:51:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oVLs2-000443-Rx; Mon, 05 Sep 2022 23:51:14 +0000
Received: by outflank-mailman (input) for mailman id 399266;
 Mon, 05 Sep 2022 23:51:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=312l=ZI=linux.dev=kent.overstreet@srs-se1.protection.inumbo.net>)
 id 1oVLs1-00043x-DZ
 for xen-devel@lists.xenproject.org; Mon, 05 Sep 2022 23:51:13 +0000
Received: from out1.migadu.com (out1.migadu.com [91.121.223.63])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9ec23c99-2d75-11ed-af93-0125da4c0113;
 Tue, 06 Sep 2022 01:51:12 +0200 (CEST)
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
X-Inumbo-ID: 9ec23c99-2d75-11ed-af93-0125da4c0113
Date: Mon, 5 Sep 2022 19:50:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1662421870;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=L/QtR7clKwa18sm3kCbVwFkkFjR319r9zDLdSKgBl/k=;
	b=K0AUlJQwh12ArX3Ivo5AajZFTOnj8fptPh9b/mWIPD8nscGPgO8kw0SNz+Kn/2nIaB9e9i
	7R3FAk1ULpUqZb/f26WREIzq78CmF0IzVffZPJjJ7RbMsrYAMZ8f5FwzvnmygEisggBmw5
	5Icx4XHaZKC0M/ASUBy2hcvuJroZdmk=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Kent Overstreet <kent.overstreet@linux.dev>
To: Steven Rostedt <rostedt@goodmis.org>
Cc: Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>,
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
Message-ID: <20220905235007.sc4uk6illlog62fl@kmo-framework>
References: <Yw88RFuBgc7yFYxA@dhcp22.suse.cz>
 <20220831190154.qdlsxfamans3ya5j@moria.home.lan>
 <YxBc1xuGbB36f8zC@dhcp22.suse.cz>
 <CAJuCfpGhwPFYdkOLjwwD4ra9JxPqq1T5d1jd41Jy3LJnVnhNdg@mail.gmail.com>
 <YxEE1vOwRPdzKxoq@dhcp22.suse.cz>
 <CAJuCfpFrRwXXQ=wAvZ-oUNKXUJ=uUA=fiDrkhRu5VGXcM+=cuA@mail.gmail.com>
 <20220905110713.27304149@gandalf.local.home>
 <CAJuCfpF-O6Gz2o7YqCgFHV+KEFuzC-PTUoBHj25DNRkkSmhbUg@mail.gmail.com>
 <20220905204229.xqrqxmaax37n3ody@moria.home.lan>
 <20220905181650.71e9d02c@gandalf.local.home>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220905181650.71e9d02c@gandalf.local.home>
X-Migadu-Flow: FLOW_OUT
X-Migadu-Auth-User: linux.dev

On Mon, Sep 05, 2022 at 06:16:50PM -0400, Steven Rostedt wrote:
> On Mon, 5 Sep 2022 16:42:29 -0400
> Kent Overstreet <kent.overstreet@linux.dev> wrote:
> 
> > > Haven't tried that yet but will do. Thanks for the reference code!  
> > 
> > Is it really worth the effort of benchmarking tracing API overhead here?
> > 
> > The main cost of a tracing based approach is going to to be the data structure
> > for remembering outstanding allocations so that free events can be matched to
> > the appropriate callsite. Regardless of whether it's done with BFP or by
> > attaching to the tracepoints directly, that's going to be the main overhead.
> 
> The point I was making here is that you do not need your own hooking
> mechanism. You can get the information directly by attaching to the
> tracepoint.
> 
> > > static void my_callback(void *data, unsigned long call_site,
> > >                         const void *ptr, struct kmem_cache *s,
> > >                         size_t bytes_req, size_t bytes_alloc,
> > >                         gfp_t gfp_flags)
> > > {
> > >         struct my_data_struct *my_data = data;
> > >
> > >         { do whatever }
> > > }
> 
> The "do whatever" is anything you want to do.
> 
> Or is the data structure you create with this approach going to be too much
> overhead? How hard is it for a hash or binary search lookup?

If you don't think it's hard, go ahead and show us.

