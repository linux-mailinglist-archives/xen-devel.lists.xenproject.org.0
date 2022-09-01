Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A11F5A9A54
	for <lists+xen-devel@lfdr.de>; Thu,  1 Sep 2022 16:30:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.396692.636946 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oTlCV-0007qT-F9; Thu, 01 Sep 2022 14:29:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 396692.636946; Thu, 01 Sep 2022 14:29:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oTlCV-0007ns-CA; Thu, 01 Sep 2022 14:29:47 +0000
Received: by outflank-mailman (input) for mailman id 396692;
 Thu, 01 Sep 2022 14:29:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=j4CE=ZE=linux.dev=kent.overstreet@srs-se1.protection.inumbo.net>)
 id 1oTlCT-0007nm-Si
 for xen-devel@lists.xenproject.org; Thu, 01 Sep 2022 14:29:45 +0000
Received: from out0.migadu.com (out0.migadu.com [94.23.1.103])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 862abccf-2a02-11ed-934f-f50d60e1c1bd;
 Thu, 01 Sep 2022 16:29:44 +0200 (CEST)
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
X-Inumbo-ID: 862abccf-2a02-11ed-934f-f50d60e1c1bd
Date: Thu, 1 Sep 2022 10:29:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1662042584;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=M1aDaZlKYEwz8CxoGUE2hJszPL7mnQtqrJRQw3RcAgQ=;
	b=IK9QhIOZDhvhIHgjJAvozZeyNVUxpRDuv2a80UYwf9PmUNDsSXvx244cHMitGbjR3T3iGp
	7sTtqClKi3PdI+46+oiLp/x5eTOLPULJGYd7PsGYsaj8KjDdrdJudl3cyWqngQc55MFiX/
	TzPtdYtHcCsYBcEyFw2g+cdlpMBvH8I=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Kent Overstreet <kent.overstreet@linux.dev>
To: Peter Zijlstra <peterz@infradead.org>
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
Message-ID: <20220901142937.vsnq62e6gqytyth2@moria.home.lan>
References: <20220830214919.53220-1-surenb@google.com>
 <Yw8P8xZ4zqu121xL@hirez.programming.kicks-ass.net>
 <20220831084230.3ti3vitrzhzsu3fs@moria.home.lan>
 <20220831101948.f3etturccmp5ovkl@suse.de>
 <YxBYgcyP7IvMLJwq@hirez.programming.kicks-ass.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YxBYgcyP7IvMLJwq@hirez.programming.kicks-ass.net>
X-Migadu-Flow: FLOW_OUT
X-Migadu-Auth-User: linux.dev

On Thu, Sep 01, 2022 at 09:00:17AM +0200, Peter Zijlstra wrote:
> On Wed, Aug 31, 2022 at 11:19:48AM +0100, Mel Gorman wrote:
> 
> > It's also unclear *who* would enable this. It looks like it would mostly
> > have value during the development stage of an embedded platform to track
> > kernel memory usage on a per-application basis in an environment where it
> > may be difficult to setup tracing and tracking. Would it ever be enabled
> > in production? 
> 
> Afaict this is developer only; it is all unconditional code.
> 
> > Would a distribution ever enable this? 
> 
> I would sincerely hope not. Because:
> 
> > If it's enabled, any overhead cannot be disabled/enabled at run or
> > boot time so anyone enabling this would carry the cost without never
> > necessarily consuming the data.
> 
> this.

We could make it a boot parameter, with the alternatives infrastructure - with a
bit of refactoring there'd be a single function call to nop out, and then we
could also drop the elf sections as well, so that when built in but disabled the
overhead would be practically nil.

