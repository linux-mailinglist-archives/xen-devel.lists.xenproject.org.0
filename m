Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 11D125A9A2A
	for <lists+xen-devel@lfdr.de>; Thu,  1 Sep 2022 16:24:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.396684.636935 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oTl6s-00076O-Re; Thu, 01 Sep 2022 14:23:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 396684.636935; Thu, 01 Sep 2022 14:23:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oTl6s-00073k-Oi; Thu, 01 Sep 2022 14:23:58 +0000
Received: by outflank-mailman (input) for mailman id 396684;
 Thu, 01 Sep 2022 14:23:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=j4CE=ZE=linux.dev=kent.overstreet@srs-se1.protection.inumbo.net>)
 id 1oTl6p-0006VQ-Ue
 for xen-devel@lists.xenproject.org; Thu, 01 Sep 2022 14:23:57 +0000
Received: from out0.migadu.com (out0.migadu.com [94.23.1.103])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b52fe8d0-2a01-11ed-934f-f50d60e1c1bd;
 Thu, 01 Sep 2022 16:23:54 +0200 (CEST)
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
X-Inumbo-ID: b52fe8d0-2a01-11ed-934f-f50d60e1c1bd
Date: Thu, 1 Sep 2022 10:23:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1662042233;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=JsB2G8WqLnYprEF0GcA9GFFIGkQht/MFH67dN0NC9t0=;
	b=P+qdlVJWY093c1JvjMpoBsAhuM3mvnI3jUKrYjXhcXjA7JDkTxBBu4A2hC17CCO8ZZ5R3D
	rLH5U4BLaxZ5HSxD5hP6U1jUXGFLfAJiihxtZ+Hfa0QaSzmc2WzHuvOvPKzjVyoQ9DuTBc
	CcLrAriFlVtUQ4Ne/7Ga0hI19yi31Mw=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Kent Overstreet <kent.overstreet@linux.dev>
To: David Hildenbrand <david@redhat.com>
Cc: Michal Hocko <mhocko@suse.com>, Mel Gorman <mgorman@suse.de>,
	Peter Zijlstra <peterz@infradead.org>,
	Suren Baghdasaryan <surenb@google.com>, akpm@linux-foundation.org,
	vbabka@suse.cz, hannes@cmpxchg.org, roman.gushchin@linux.dev,
	dave@stgolabs.net, willy@infradead.org, liam.howlett@oracle.com,
	void@manifault.com, juri.lelli@redhat.com, ldufour@linux.ibm.com,
	peterx@redhat.com, axboe@kernel.dk, mcgrof@kernel.org,
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
Message-ID: <20220901142345.agkfp2d5lijdp6pt@moria.home.lan>
References: <20220830214919.53220-1-surenb@google.com>
 <Yw8P8xZ4zqu121xL@hirez.programming.kicks-ass.net>
 <20220831084230.3ti3vitrzhzsu3fs@moria.home.lan>
 <20220831101948.f3etturccmp5ovkl@suse.de>
 <Yw88RFuBgc7yFYxA@dhcp22.suse.cz>
 <20220831190154.qdlsxfamans3ya5j@moria.home.lan>
 <404e947a-e1b2-0fae-8b4f-6f2e3ba6328d@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <404e947a-e1b2-0fae-8b4f-6f2e3ba6328d@redhat.com>
X-Migadu-Flow: FLOW_OUT
X-Migadu-Auth-User: linux.dev

On Thu, Sep 01, 2022 at 10:05:03AM +0200, David Hildenbrand wrote:
> On 31.08.22 21:01, Kent Overstreet wrote:
> > On Wed, Aug 31, 2022 at 12:47:32PM +0200, Michal Hocko wrote:
> >> On Wed 31-08-22 11:19:48, Mel Gorman wrote:
> >>> Whatever asking for an explanation as to why equivalent functionality
> >>> cannot not be created from ftrace/kprobe/eBPF/whatever is reasonable.
> >>
> >> Fully agreed and this is especially true for a change this size
> >> 77 files changed, 3406 insertions(+), 703 deletions(-)
> > 
> > In the case of memory allocation accounting, you flat cannot do this with ftrace
> > - you could maybe do a janky version that isn't fully accurate, much slower,
> > more complicated for the developer to understand and debug and more complicated
> > for the end user.
> > 
> > But please, I invite anyone who's actually been doing this with ftrace to
> > demonstrate otherwise.
> > 
> > Ftrace just isn't the right tool for the job here - we're talking about adding
> > per callsite accounting to some of the fastest fast paths in the kernel.
> > 
> > And the size of the changes for memory allocation accounting are much more
> > reasonable:
> >  33 files changed, 623 insertions(+), 99 deletions(-)
> > 
> > The code tagging library should exist anyways, it's been open coded half a dozen
> > times in the kernel already.
> 
> Hi Kent,
> 
> independent of the other discussions, if it's open coded already, does
> it make sense to factor that already-open-coded part out independently
> of the remainder of the full series here?

It's discussed in the cover letter, that is exactly how the patch series is
structured.
 
> [I didn't immediately spot if this series also attempts already to
> replace that open-coded part]

Uh huh.

Honestly, some days it feels like lkml is just as bad as slashdot, with people
wanting to get in their two cents without actually reading...

