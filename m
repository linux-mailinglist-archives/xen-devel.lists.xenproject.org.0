Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B1EE5AF712
	for <lists+xen-devel@lfdr.de>; Tue,  6 Sep 2022 23:40:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.400242.641960 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oVgIR-0007td-SR; Tue, 06 Sep 2022 21:39:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 400242.641960; Tue, 06 Sep 2022 21:39:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oVgIR-0007aj-4S; Tue, 06 Sep 2022 21:39:51 +0000
Received: by outflank-mailman (input) for mailman id 400242;
 Tue, 06 Sep 2022 21:39:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2Xei=ZJ=linux.dev=kent.overstreet@srs-se1.protection.inumbo.net>)
 id 1oVgH0-0000Cs-2n
 for xen-devel@lists.xenproject.org; Tue, 06 Sep 2022 21:38:22 +0000
Received: from out1.migadu.com (out1.migadu.com [91.121.223.63])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c744202b-2e10-11ed-af93-0125da4c0113;
 Tue, 06 Sep 2022 20:21:52 +0200 (CEST)
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
X-Inumbo-ID: c744202b-2e10-11ed-af93-0125da4c0113
Date: Tue, 6 Sep 2022 14:20:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1662488510;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=/bRlcVcrWdQKJLJipKk17c91ZfuMwNoEsJqygzANM10=;
	b=e2VD/HcikFLJhe0V11ErS/Oin4ybn/TXkbGiMkiUOxLxKEWpdcoX4otQ2quaeh2xN9tkEz
	gJSSZJlOcx5MH/FwRLBQM+nMzvd03D3L1jInmtTiFs1YUwF1FG/7tFAS2gRVdaASeb5tb9
	7SVVXyTQbLTanYnVJHubYmXd6a/lpqA=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Kent Overstreet <kent.overstreet@linux.dev>
To: Michal Hocko <mhocko@suse.com>
Cc: Suren Baghdasaryan <surenb@google.com>, Mel Gorman <mgorman@suse.de>,
	Peter Zijlstra <peterz@infradead.org>,
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
	Steven Rostedt <rostedt@goodmis.org>,
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
Message-ID: <20220906182058.iijmpzu4rtxowy37@kmo-framework>
References: <Yw88RFuBgc7yFYxA@dhcp22.suse.cz>
 <20220831190154.qdlsxfamans3ya5j@moria.home.lan>
 <YxBc1xuGbB36f8zC@dhcp22.suse.cz>
 <CAJuCfpGhwPFYdkOLjwwD4ra9JxPqq1T5d1jd41Jy3LJnVnhNdg@mail.gmail.com>
 <YxEE1vOwRPdzKxoq@dhcp22.suse.cz>
 <CAJuCfpHuzJGTA_-m0Jfawc7LgJLt4GztUUY4K9N9-7bFqJuXnw@mail.gmail.com>
 <20220901201502.sn6223bayzwferxv@moria.home.lan>
 <YxW4Ig338d2vQAz3@dhcp22.suse.cz>
 <20220905234649.525vorzx27ybypsn@kmo-framework>
 <Yxb1cxDSyte1Ut/F@dhcp22.suse.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Yxb1cxDSyte1Ut/F@dhcp22.suse.cz>
X-Migadu-Flow: FLOW_OUT
X-Migadu-Auth-User: linux.dev

On Tue, Sep 06, 2022 at 09:23:31AM +0200, Michal Hocko wrote:
> On Mon 05-09-22 19:46:49, Kent Overstreet wrote:
> > On Mon, Sep 05, 2022 at 10:49:38AM +0200, Michal Hocko wrote:
> > > This is really my main concern about this whole work. Not only it adds a
> > > considerable maintenance burden to the core MM because
> > 
> > [citation needed]
> 
> I thought this was clear from the email content (the part you haven't
> quoted here). But let me be explicit one more time for you.
> 
> I hope we can agree that in order for this kind of tracking to be useful
> you need to cover _callers_ of the allocator or in the ideal world
> the users/owner of the tracked memory (the later is sometimes much
> harder/impossible to track when the memory is handed over from one peer
> to another).
> 
> It is not particularly useful IMO to see that a large portion of the
> memory has been allocated by say vmalloc or kvmalloc, right?  How
> much does it really tell you that a lot of memory has been allocated
> by kvmalloc or vmalloc? Yet, neither of the two is handled by the
> proposed tracking and it would require additional code to be added and
> _maintained_ to cover them. But that would be still far from complete,
> we have bulk allocator, mempools etc.

Of course - and even a light skimming of the patch set would see it does indeed
address this. We still have to do vmalloc and percpu memory allocations, but
slab is certainly handled and that's the big one.

> As pointed above this just scales poorly and adds to the API space. Not
> to mention that direct use of alloc_tag_add can just confuse layers
> below which rely on the same thing.

It might help you make your case if you'd say something about what you'd like
better.

Otherwise, saying "code has to be maintained" is a little bit like saying water
is wet, and we're all engineers here, I think we know that :)

