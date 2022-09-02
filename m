Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 34CE85AA569
	for <lists+xen-devel@lfdr.de>; Fri,  2 Sep 2022 03:59:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.397143.637616 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oTvxa-0005ZG-Pq; Fri, 02 Sep 2022 01:59:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 397143.637616; Fri, 02 Sep 2022 01:59:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oTvxa-0005WI-MA; Fri, 02 Sep 2022 01:59:06 +0000
Received: by outflank-mailman (input) for mailman id 397143;
 Fri, 02 Sep 2022 01:59:04 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=n35v=ZF=goodmis.org=rostedt@kernel.org>)
 id 1oTvxY-0005WC-Md
 for xen-devel@lists.xenproject.org; Fri, 02 Sep 2022 01:59:04 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d07333ee-2a62-11ed-934f-f50d60e1c1bd;
 Fri, 02 Sep 2022 03:59:01 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id BE59C60DE9;
 Fri,  2 Sep 2022 01:59:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 171BAC433C1;
 Fri,  2 Sep 2022 01:58:53 +0000 (UTC)
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
X-Inumbo-ID: d07333ee-2a62-11ed-934f-f50d60e1c1bd
Date: Thu, 1 Sep 2022 21:59:25 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: Suren Baghdasaryan <surenb@google.com>, akpm@linux-foundation.org,
 mhocko@suse.com, vbabka@suse.cz, hannes@cmpxchg.org,
 roman.gushchin@linux.dev, mgorman@suse.de, dave@stgolabs.net,
 willy@infradead.org, liam.howlett@oracle.com, void@manifault.com,
 peterz@infradead.org, juri.lelli@redhat.com, ldufour@linux.ibm.com,
 peterx@redhat.com, david@redhat.com, axboe@kernel.dk, mcgrof@kernel.org,
 masahiroy@kernel.org, nathan@kernel.org, changbin.du@intel.com,
 ytcoode@gmail.com, vincent.guittot@linaro.org, dietmar.eggemann@arm.com,
 bsegall@google.com, bristot@redhat.com, vschneid@redhat.com, cl@linux.com,
 penberg@kernel.org, iamjoonsoo.kim@lge.com, 42.hyeyoo@gmail.com,
 glider@google.com, elver@google.com, dvyukov@google.com,
 shakeelb@google.com, songmuchun@bytedance.com, arnd@arndb.de,
 jbaron@akamai.com, rientjes@google.com, minchan@google.com,
 kaleshsingh@google.com, kernel-team@android.com, linux-mm@kvack.org,
 iommu@lists.linux.dev, kasan-dev@googlegroups.com,
 io-uring@vger.kernel.org, linux-arch@vger.kernel.org,
 xen-devel@lists.xenproject.org, linux-bcache@vger.kernel.org,
 linux-modules@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH 27/30] Code tagging based latency tracking
Message-ID: <20220901215925.59ae5cb0@gandalf.local.home>
In-Reply-To: <20220902013532.6n5cyf3oofntljho@moria.home.lan>
References: <20220830214919.53220-1-surenb@google.com>
	<20220830214919.53220-28-surenb@google.com>
	<20220901173844.36e1683c@gandalf.local.home>
	<20220901215438.gy3bgqa4ghhm6ztm@moria.home.lan>
	<20220901183430.120311ce@gandalf.local.home>
	<20220901225515.ogg7pyljmfzezamr@moria.home.lan>
	<20220901202311.546a53b5@gandalf.local.home>
	<20220902013532.6n5cyf3oofntljho@moria.home.lan>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 1 Sep 2022 21:35:32 -0400
Kent Overstreet <kent.overstreet@linux.dev> wrote:

> On Thu, Sep 01, 2022 at 08:23:11PM -0400, Steven Rostedt wrote:
> > If ftrace, perf, bpf can't do what you want, take a harder look to see if
> > you can modify them to do so.  
> 
> Maybe we can use this exchange to make both of our tools better. I like your
> histograms - the quantiles algorithm I've had for years is janky, I've been
> meaning to rip that out, I'd love to take a look at your code for that. And
> having an on/off switch is a good idea, I'll try to add that at some point.
> Maybe you got some ideas from my stuff too.
> 
> I'd love to get better tracepoints for measuring latency - what I added to
> init_wait() and finish_wait() was really only a starting point. Figuring out
> the right places to measure is where I'd like to be investing my time in this
> area, and there's no reason we couldn't both be making use of that.

Yes, this is exactly what I'm talking about. I'm not against your work, I
just want you to work more with everyone to come up with ideas that can
help everyone as a whole. That's how "open source communities" is suppose
to work ;-)

The histogram and synthetic events can use some more clean ups. There's a
lot of places that can be improved in that code. But I feel the ideas
behind that code is sound. It's just getting the implementation to be a bit
more efficient.

> 
> e.g. with kernel waitqueues, I looked at hooking prepare_to_wait() first but not
> all code uses that, init_wait() got me better coverage. But I've already seen
> that that misses things, too, there's more work to be done.

I picked prepare_to_wait() just because I was hacking up something quick
and thought that was "close enough" ;-)

-- Steve


