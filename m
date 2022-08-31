Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3778F5A7BA5
	for <lists+xen-devel@lfdr.de>; Wed, 31 Aug 2022 12:47:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.395633.635423 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oTLFx-0005yS-Qg; Wed, 31 Aug 2022 10:47:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 395633.635423; Wed, 31 Aug 2022 10:47:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oTLFx-0005wf-NS; Wed, 31 Aug 2022 10:47:37 +0000
Received: by outflank-mailman (input) for mailman id 395633;
 Wed, 31 Aug 2022 10:47:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Wxxh=ZD=suse.com=mhocko@srs-se1.protection.inumbo.net>)
 id 1oTLFw-0005wZ-1w
 for xen-devel@lists.xenproject.org; Wed, 31 Aug 2022 10:47:36 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 526568fa-291a-11ed-a60c-1f1ba7de4fb0;
 Wed, 31 Aug 2022 12:47:34 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 136B61F9EB;
 Wed, 31 Aug 2022 10:47:34 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id DA44113A7C;
 Wed, 31 Aug 2022 10:47:33 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 3HtANUU8D2PVawAAMHmgww
 (envelope-from <mhocko@suse.com>); Wed, 31 Aug 2022 10:47:33 +0000
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
X-Inumbo-ID: 526568fa-291a-11ed-a60c-1f1ba7de4fb0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1661942854; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=aUzDVspS6J0BJDe/V//gF5+N5LyMdFoI/5xdVcYfQNM=;
	b=hx3jXnZOgBCn3O0WO5J/LlyY4IiYG5gqZXnpoO+NYEqMohd/U77AF74Flu0p9pljpDRGno
	sMp8XYRkBw5hCVEmHJBlQYPVx0BIUes6WerAjPMj8ahTkMIBlfO+J5Y3xm3LewxX5zGMbB
	lhArCO8EcmvjMet8opjkPdqbWHMxN8I=
Date: Wed, 31 Aug 2022 12:47:32 +0200
From: Michal Hocko <mhocko@suse.com>
To: Mel Gorman <mgorman@suse.de>
Cc: Kent Overstreet <kent.overstreet@linux.dev>,
	Peter Zijlstra <peterz@infradead.org>,
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
Message-ID: <Yw88RFuBgc7yFYxA@dhcp22.suse.cz>
References: <20220830214919.53220-1-surenb@google.com>
 <Yw8P8xZ4zqu121xL@hirez.programming.kicks-ass.net>
 <20220831084230.3ti3vitrzhzsu3fs@moria.home.lan>
 <20220831101948.f3etturccmp5ovkl@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220831101948.f3etturccmp5ovkl@suse.de>

On Wed 31-08-22 11:19:48, Mel Gorman wrote:
> On Wed, Aug 31, 2022 at 04:42:30AM -0400, Kent Overstreet wrote:
> > On Wed, Aug 31, 2022 at 09:38:27AM +0200, Peter Zijlstra wrote:
> > > On Tue, Aug 30, 2022 at 02:48:49PM -0700, Suren Baghdasaryan wrote:
> > > > ===========================
> > > > Code tagging framework
> > > > ===========================
> > > > Code tag is a structure identifying a specific location in the source code
> > > > which is generated at compile time and can be embedded in an application-
> > > > specific structure. Several applications of code tagging are included in
> > > > this RFC, such as memory allocation tracking, dynamic fault injection,
> > > > latency tracking and improved error code reporting.
> > > > Basically, it takes the old trick of "define a special elf section for
> > > > objects of a given type so that we can iterate over them at runtime" and
> > > > creates a proper library for it.
> > > 
> > > I might be super dense this morning, but what!? I've skimmed through the
> > > set and I don't think I get it.
> > > 
> > > What does this provide that ftrace/kprobes don't already allow?
> > 
> > You're kidding, right?
> 
> It's a valid question. From the description, it main addition that would
> be hard to do with ftrace or probes is catching where an error code is
> returned. A secondary addition would be catching all historical state and
> not just state since the tracing started.
> 
> It's also unclear *who* would enable this. It looks like it would mostly
> have value during the development stage of an embedded platform to track
> kernel memory usage on a per-application basis in an environment where it
> may be difficult to setup tracing and tracking. Would it ever be enabled
> in production? Would a distribution ever enable this? If it's enabled, any
> overhead cannot be disabled/enabled at run or boot time so anyone enabling
> this would carry the cost without never necessarily consuming the data.
> 
> It might be an ease-of-use thing. Gathering the information from traces
> is tricky and would need combining multiple different elements and that
> is development effort but not impossible.
> 
> Whatever asking for an explanation as to why equivalent functionality
> cannot not be created from ftrace/kprobe/eBPF/whatever is reasonable.

Fully agreed and this is especially true for a change this size
77 files changed, 3406 insertions(+), 703 deletions(-)

-- 
Michal Hocko
SUSE Labs

