Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D97B5A8468
	for <lists+xen-devel@lfdr.de>; Wed, 31 Aug 2022 19:31:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.395980.635894 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oTRXp-0000cr-7f; Wed, 31 Aug 2022 17:30:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 395980.635894; Wed, 31 Aug 2022 17:30:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oTRXp-0000a1-3P; Wed, 31 Aug 2022 17:30:29 +0000
Received: by outflank-mailman (input) for mailman id 395980;
 Wed, 31 Aug 2022 17:30:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=E34P=ZD=linux.dev=kent.overstreet@srs-se1.protection.inumbo.net>)
 id 1oTRXm-0000Zv-FU
 for xen-devel@lists.xenproject.org; Wed, 31 Aug 2022 17:30:27 +0000
Received: from out1.migadu.com (out1.migadu.com [91.121.223.63])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 98989b7d-2952-11ed-82f2-63bd783d45fa;
 Wed, 31 Aug 2022 19:30:24 +0200 (CEST)
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
X-Inumbo-ID: 98989b7d-2952-11ed-82f2-63bd783d45fa
Date: Wed, 31 Aug 2022 13:30:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1661967023;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=akPUYJQ75fwIwMQFIb22LwWbtwnw5UTZVlPBgEDeTMs=;
	b=vE3CF/hYHXAE/K4932q4ajXNld0qKiFjAcWoi7fiBYp/VCovZl1Zx/Bw+pURhB6ZWUguOM
	yEECHfCMBhWuOS+8pPpB6WgHDKJe+QP39AFR9pm6A02T9tr9GTZUhFMtmSYMptto4Yr//a
	Edg/I2CSqagd7R1KnuqkPz3zjkZJkHU=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Kent Overstreet <kent.overstreet@linux.dev>
To: Dmitry Vyukov <dvyukov@google.com>
Cc: Suren Baghdasaryan <surenb@google.com>, akpm@linux-foundation.org,
	mhocko@suse.com, vbabka@suse.cz, hannes@cmpxchg.org,
	roman.gushchin@linux.dev, mgorman@suse.de, dave@stgolabs.net,
	willy@infradead.org, liam.howlett@oracle.com, void@manifault.com,
	peterz@infradead.org, juri.lelli@redhat.com, ldufour@linux.ibm.com,
	peterx@redhat.com, david@redhat.com, axboe@kernel.dk,
	mcgrof@kernel.org, masahiroy@kernel.org, nathan@kernel.org,
	changbin.du@intel.com, ytcoode@gmail.com,
	vincent.guittot@linaro.org, dietmar.eggemann@arm.com,
	rostedt@goodmis.org, bsegall@google.com, bristot@redhat.com,
	vschneid@redhat.com, cl@linux.com, penberg@kernel.org,
	iamjoonsoo.kim@lge.com, 42.hyeyoo@gmail.com, glider@google.com,
	elver@google.com, shakeelb@google.com, songmuchun@bytedance.com,
	arnd@arndb.de, jbaron@akamai.com, rientjes@google.com,
	minchan@google.com, kaleshsingh@google.com, kernel-team@android.com,
	linux-mm@kvack.org, iommu@lists.linux.dev,
	kasan-dev@googlegroups.com, io-uring@vger.kernel.org,
	linux-arch@vger.kernel.org, xen-devel@lists.xenproject.org,
	linux-bcache@vger.kernel.org, linux-modules@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH 22/30] Code tagging based fault injection
Message-ID: <20220831173010.wc5j3ycmfjx6ezfu@moria.home.lan>
References: <20220830214919.53220-1-surenb@google.com>
 <20220830214919.53220-23-surenb@google.com>
 <CACT4Y+ZX3U1=cAPXPhoOy6xrngSCfSmyFagXK-9fWtWWODfsew@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACT4Y+ZX3U1=cAPXPhoOy6xrngSCfSmyFagXK-9fWtWWODfsew@mail.gmail.com>
X-Migadu-Flow: FLOW_OUT
X-Migadu-Auth-User: linux.dev

On Wed, Aug 31, 2022 at 12:37:14PM +0200, Dmitry Vyukov wrote:
> On Tue, 30 Aug 2022 at 23:50, Suren Baghdasaryan <surenb@google.com> wrote:
> >
> > From: Kent Overstreet <kent.overstreet@linux.dev>
> >
> > This adds a new fault injection capability, based on code tagging.
> >
> > To use, simply insert somewhere in your code
> >
> >   dynamic_fault("fault_class_name")
> >
> > and check whether it returns true - if so, inject the error.
> > For example
> >
> >   if (dynamic_fault("init"))
> >       return -EINVAL;
> 
> Hi Suren,
> 
> If this is going to be used by mainline kernel, it would be good to
> integrate this with fail_nth systematic fault injection:
> https://elixir.bootlin.com/linux/latest/source/lib/fault-inject.c#L109
> 
> Otherwise these dynamic sites won't be tested by testing systems doing
> systematic fault injection testing.

That's a discussion we need to have, yeah. We don't want two distinct fault
injection frameworks, we'll have to have a discussion as to whether this is (or
can be) better enough to make a switch worthwhile, and whether a compatibility
interface is needed - or maybe there's enough distinct interesting bits in both
to make merging plausible?

The debugfs interface for this fault injection code is necessarily different
from our existing fault injection - this gives you a fault injection point _per
callsite_, which is huge - e.g. for filesystem testing what I need is to be able
to enable fault injection points within a given module. I can do that easily
with this, not with our current fault injection.

I think the per-callsite fault injection points would also be pretty valuable
for CONFIG_FAULT_INJECTION_USERCOPY, too.

OTOH, existing kernel fault injection can filter based on task - this fault
injection framework doesn't have that. Easy enough to add, though. Similar for
the interval/probability/ratelimit stuff.

fail_function is the odd one out, I'm not sure how that would fit into this
model. Everything else I've seen I think fits into this model.

Also, it sounds like you're more familiar with our existing fault injection than
I am, so if I've misunderstood anything about what it can do please do correct
me.

Interestingly: I just discovered from reading the code that
CONFIG_FAULT_INJECTION_STACKTRACE_FILTER is a thing (hadn't before because it
depends on !X86_64 - what?). That's cool, though.

