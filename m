Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C0675B14BB
	for <lists+xen-devel@lfdr.de>; Thu,  8 Sep 2022 08:36:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.402689.644535 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oWB8r-00013t-LX; Thu, 08 Sep 2022 06:36:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 402689.644535; Thu, 08 Sep 2022 06:36:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oWB8r-00011E-Ht; Thu, 08 Sep 2022 06:36:01 +0000
Received: by outflank-mailman (input) for mailman id 402689;
 Thu, 08 Sep 2022 06:36:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=W5tW=ZL=linux.dev=kent.overstreet@srs-se1.protection.inumbo.net>)
 id 1oWB8p-000118-JT
 for xen-devel@lists.xenproject.org; Thu, 08 Sep 2022 06:36:00 +0000
Received: from out1.migadu.com (out1.migadu.com [91.121.223.63])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7f2f21a0-2f40-11ed-af93-0125da4c0113;
 Thu, 08 Sep 2022 08:35:58 +0200 (CEST)
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
X-Inumbo-ID: 7f2f21a0-2f40-11ed-af93-0125da4c0113
Date: Thu, 8 Sep 2022 02:35:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1662618957;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=jE7lXd8zCts/b8YEvdDXlJ5bev/XqPVvJNSIvscjpW4=;
	b=MwAw2Fh829Y+/YeGPA6cd+g09bbtapNU9zRq06d/HsaMRntRRP6MbOYfQljjG1XjFWCvOk
	g5bFgnPsu1HhGw2GHv2epjG5rpfLXTCK/UCnYQNU2I1noPA+19zOHe58qz47ue59dsiSE2
	9ELesyPyEojCr6xzzvxPIlQ1Kgt58y4=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Kent Overstreet <kent.overstreet@linux.dev>
To: Steven Rostedt <rostedt@goodmis.org>
Cc: Michal Hocko <mhocko@suse.com>, Suren Baghdasaryan <surenb@google.com>,
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
Message-ID: <20220908063548.u4lqkhquuvkwzvda@kmo-framework>
References: <YxEE1vOwRPdzKxoq@dhcp22.suse.cz>
 <CAJuCfpHuzJGTA_-m0Jfawc7LgJLt4GztUUY4K9N9-7bFqJuXnw@mail.gmail.com>
 <20220901201502.sn6223bayzwferxv@moria.home.lan>
 <YxW4Ig338d2vQAz3@dhcp22.suse.cz>
 <20220905234649.525vorzx27ybypsn@kmo-framework>
 <Yxb1cxDSyte1Ut/F@dhcp22.suse.cz>
 <20220906182058.iijmpzu4rtxowy37@kmo-framework>
 <Yxh5ueDTAOcwEmCQ@dhcp22.suse.cz>
 <20220907130323.rwycrntnckc6h43n@kmo-framework>
 <20220907094306.3383dac2@gandalf.local.home>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220907094306.3383dac2@gandalf.local.home>
X-Migadu-Flow: FLOW_OUT
X-Migadu-Auth-User: linux.dev

On Wed, Sep 07, 2022 at 09:45:18AM -0400, Steven Rostedt wrote:
> On Wed, 7 Sep 2022 09:04:28 -0400
> Kent Overstreet <kent.overstreet@linux.dev> wrote:
> 
> > On Wed, Sep 07, 2022 at 01:00:09PM +0200, Michal Hocko wrote:
> > > Hmm, it seems that further discussion doesn't really make much sense
> > > here. I know how to use my time better.  
> > 
> > Just a thought, but I generally find it more productive to propose ideas than to
> > just be disparaging.
> > 
> 
> But it's not Michal's job to do so. He's just telling you that the given
> feature is not worth the burden. He's telling you the issues that he has
> with the patch set. It's the submitter's job to address those concerns and
> not the maintainer's to tell you how to make it better.
> 
> When Linus tells us that a submission is crap, we don't ask him how to make
> it less crap, we listen to why he called it crap, and then rewrite to be
> not so crappy. If we cannot figure it out, it doesn't get in.

When Linus tells someone a submission is crap, he _always_ has a sound, and
_specific_ technical justification for doing so.

"This code is going to be a considerable maintenance burden" is vapid, and lazy.
It's the kind of feedback made by someone who has looked at the number of lines
of code a patch touches and not much more.

