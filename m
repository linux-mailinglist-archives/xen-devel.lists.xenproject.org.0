Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 15E015A8FD1
	for <lists+xen-devel@lfdr.de>; Thu,  1 Sep 2022 09:19:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.396264.636347 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oTeTU-0003wv-03; Thu, 01 Sep 2022 07:18:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 396264.636347; Thu, 01 Sep 2022 07:18:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oTeTT-0003v7-TC; Thu, 01 Sep 2022 07:18:51 +0000
Received: by outflank-mailman (input) for mailman id 396264;
 Thu, 01 Sep 2022 07:18:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=KN2J=ZE=suse.com=mhocko@srs-se1.protection.inumbo.net>)
 id 1oTeTR-0003v0-RF
 for xen-devel@lists.xenproject.org; Thu, 01 Sep 2022 07:18:49 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 517743ad-29c6-11ed-82f2-63bd783d45fa;
 Thu, 01 Sep 2022 09:18:46 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 43E1B1FB16;
 Thu,  1 Sep 2022 07:18:48 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 098CC13A89;
 Thu,  1 Sep 2022 07:18:48 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id HuA6ANhcEGMwCAAAMHmgww
 (envelope-from <mhocko@suse.com>); Thu, 01 Sep 2022 07:18:47 +0000
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
X-Inumbo-ID: 517743ad-29c6-11ed-82f2-63bd783d45fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1662016728; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=syKqR2otOp+SJa2emYsY57+bVX7vmPgl46yq0SOCcY4=;
	b=XxPpqvq/CprurzzyArGBkJW5SqAQWQkVT69xczpmMcnZD1oRn53SBe3Vor5qXAepnNw6HZ
	eJdNzUUUyBCLltPNTrvvxdfpcBBHT8aPch+MIclCvWmw3ouoq0E0fd3IBYzv+2TVw5SAGP
	eKsPIajcu9OwC55K4pFTrVjv2HlxcBc=
Date: Thu, 1 Sep 2022 09:18:47 +0200
From: Michal Hocko <mhocko@suse.com>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: Mel Gorman <mgorman@suse.de>, Peter Zijlstra <peterz@infradead.org>,
	Suren Baghdasaryan <surenb@google.com>, akpm@linux-foundation.org,
	vbabka@suse.cz, hannes@cmpxchg.org, roman.gushchin@linux.dev,
	dave@stgolabs.net, willy@infradead.org, liam.howlett@oracle.com,
	void@manifault.com, juri.lelli@redhat.com, ldufour@linux.ibm.com,
	peterx@redhat.com, david@redhat.com, axboe@kernel.dk,
	mcgrof@kernel.org, masahiroy@kernel.org, nathan@kernel.org,
	changbin.du@intel.com, ytcoode@gmail.com,
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
Message-ID: <YxBc1xuGbB36f8zC@dhcp22.suse.cz>
References: <20220830214919.53220-1-surenb@google.com>
 <Yw8P8xZ4zqu121xL@hirez.programming.kicks-ass.net>
 <20220831084230.3ti3vitrzhzsu3fs@moria.home.lan>
 <20220831101948.f3etturccmp5ovkl@suse.de>
 <Yw88RFuBgc7yFYxA@dhcp22.suse.cz>
 <20220831190154.qdlsxfamans3ya5j@moria.home.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220831190154.qdlsxfamans3ya5j@moria.home.lan>

On Wed 31-08-22 15:01:54, Kent Overstreet wrote:
> On Wed, Aug 31, 2022 at 12:47:32PM +0200, Michal Hocko wrote:
> > On Wed 31-08-22 11:19:48, Mel Gorman wrote:
> > > Whatever asking for an explanation as to why equivalent functionality
> > > cannot not be created from ftrace/kprobe/eBPF/whatever is reasonable.
> > 
> > Fully agreed and this is especially true for a change this size
> > 77 files changed, 3406 insertions(+), 703 deletions(-)
> 
> In the case of memory allocation accounting, you flat cannot do this with ftrace
> - you could maybe do a janky version that isn't fully accurate, much slower,
> more complicated for the developer to understand and debug and more complicated
> for the end user.
> 
> But please, I invite anyone who's actually been doing this with ftrace to
> demonstrate otherwise.
> 
> Ftrace just isn't the right tool for the job here - we're talking about adding
> per callsite accounting to some of the fastest fast paths in the kernel.
> 
> And the size of the changes for memory allocation accounting are much more
> reasonable:
>  33 files changed, 623 insertions(+), 99 deletions(-)
> 
> The code tagging library should exist anyways, it's been open coded half a dozen
> times in the kernel already.
> 
> And once we've got that, the time stats code is _also_ far simpler than doing it
> with ftrace would be. If anyone here has successfully debugged latency issues
> with ftrace, I'd really like to hear it. Again, for debugging latency issues you
> want something that can always be on, and that's not cheap with ftrace - and
> never mind the hassle of correlating start and end wait trace events, builting
> up histograms, etc. - that's all handled here.
> 
> Cheap, simple, easy to use. What more could you want?

A big ad on a banner. But more seriously.

This patchset is _huge_ and touching a lot of different areas. It will
be not only hard to review but even harder to maintain longterm. So
it is completely reasonable to ask for potential alternatives with a
smaller code footprint. I am pretty sure you are aware of that workflow.

So I find Peter's question completely appropriate while your response to
that not so much! Maybe ftrace is not the right tool for the intented
job. Maybe there are other ways and it would be really great to show
that those have been evaluated and they are not suitable for a), b) and
c) reasons.

E.g. Oscar has been working on extending page_ext to track number of
allocations for specific calltrace[1]. Is this 1:1 replacement? No! But
it can help in environments where page_ext can be enabled and it is
completely non-intrusive to the MM code.

If the page_ext overhead is not desirable/acceptable then I am sure
there are other options. E.g. kprobes/LivePatching framework can hook
into functions and alter their behavior. So why not use that for data
collection? Has this been evaluated at all?

And please note that I am not claiming the presented work is approaching
the problem from a wrong direction. It might very well solve multiple
problems in a single go _but_ the long term code maintenance burden
really has to to be carefully evaluated and if we can achieve a
reasonable subset of the functionality with an existing infrastructure
then I would be inclined to sacrifice some portions with a considerably
smaller code footprint.

[1] http://lkml.kernel.org/r/20220901044249.4624-1-osalvador@suse.de

-- 
Michal Hocko
SUSE Labs

