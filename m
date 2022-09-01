Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C393A5AA1CA
	for <lists+xen-devel@lfdr.de>; Thu,  1 Sep 2022 23:55:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.396965.637379 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oTs9D-0004a5-Ss; Thu, 01 Sep 2022 21:54:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 396965.637379; Thu, 01 Sep 2022 21:54:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oTs9D-0004YD-QE; Thu, 01 Sep 2022 21:54:51 +0000
Received: by outflank-mailman (input) for mailman id 396965;
 Thu, 01 Sep 2022 21:54:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=j4CE=ZE=linux.dev=kent.overstreet@srs-se1.protection.inumbo.net>)
 id 1oTs9B-0004Y7-Br
 for xen-devel@lists.xenproject.org; Thu, 01 Sep 2022 21:54:50 +0000
Received: from out0.migadu.com (out0.migadu.com [94.23.1.103])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b20260fb-2a40-11ed-82f2-63bd783d45fa;
 Thu, 01 Sep 2022 23:54:47 +0200 (CEST)
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
X-Inumbo-ID: b20260fb-2a40-11ed-82f2-63bd783d45fa
Date: Thu, 1 Sep 2022 17:54:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1662069286;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=cwEaHM2MLzWFSTyYX5D3U7h9xVWN0G5HRpYdRjufwn0=;
	b=Twh7nBps+XmX0981JwFQK7PMJW17CAHEz4A60UGJ6tfnVJLg6TZy5G0xn6V03JWw5jzP+B
	3RE93gZ+MZBUwxCNryz2EldJWBau/or+sfFVuw+2kP1flYXFxRkrg7pE3b74SSfBEB2oWB
	lummEMiyswsHuVB+uMrViWPiyxSgtyk=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Kent Overstreet <kent.overstreet@linux.dev>
To: Steven Rostedt <rostedt@goodmis.org>
Cc: Suren Baghdasaryan <surenb@google.com>, akpm@linux-foundation.org,
	mhocko@suse.com, vbabka@suse.cz, hannes@cmpxchg.org,
	roman.gushchin@linux.dev, mgorman@suse.de, dave@stgolabs.net,
	willy@infradead.org, liam.howlett@oracle.com, void@manifault.com,
	peterz@infradead.org, juri.lelli@redhat.com, ldufour@linux.ibm.com,
	peterx@redhat.com, david@redhat.com, axboe@kernel.dk,
	mcgrof@kernel.org, masahiroy@kernel.org, nathan@kernel.org,
	changbin.du@intel.com, ytcoode@gmail.com,
	vincent.guittot@linaro.org, dietmar.eggemann@arm.com,
	bsegall@google.com, bristot@redhat.com, vschneid@redhat.com,
	cl@linux.com, penberg@kernel.org, iamjoonsoo.kim@lge.com,
	42.hyeyoo@gmail.com, glider@google.com, elver@google.com,
	dvyukov@google.com, shakeelb@google.com, songmuchun@bytedance.com,
	arnd@arndb.de, jbaron@akamai.com, rientjes@google.com,
	minchan@google.com, kaleshsingh@google.com, kernel-team@android.com,
	linux-mm@kvack.org, iommu@lists.linux.dev,
	kasan-dev@googlegroups.com, io-uring@vger.kernel.org,
	linux-arch@vger.kernel.org, xen-devel@lists.xenproject.org,
	linux-bcache@vger.kernel.org, linux-modules@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH 27/30] Code tagging based latency tracking
Message-ID: <20220901215438.gy3bgqa4ghhm6ztm@moria.home.lan>
References: <20220830214919.53220-1-surenb@google.com>
 <20220830214919.53220-28-surenb@google.com>
 <20220901173844.36e1683c@gandalf.local.home>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220901173844.36e1683c@gandalf.local.home>
X-Migadu-Flow: FLOW_OUT
X-Migadu-Auth-User: linux.dev

On Thu, Sep 01, 2022 at 05:38:44PM -0400, Steven Rostedt wrote:
> On Tue, 30 Aug 2022 14:49:16 -0700
> Suren Baghdasaryan <surenb@google.com> wrote:
> 
> > From: Kent Overstreet <kent.overstreet@linux.dev>
> > 
> > This adds the ability to easily instrument code for measuring latency.
> > To use, add the following to calls to your code, at the start and end of
> > the event you wish to measure:
> > 
> >   code_tag_time_stats_start(start_time);
> >   code_tag_time_stats_finish(start_time);
> 
> So you need to modify the code to see what you want?

Figuring out the _correct_ place to measure is often a significant amount of the
total effort.

Having done so once, why not annotate that in the source code?

> For function length you could just do something like this:
> 
>  # cd /sys/kernel/tracing
>  # echo __skb_wait_for_more_packets > set_ftrace_filter
>  # echo 1 > function_profile_enabled
>  # cat trace_stat/function*
>   Function                               Hit    Time            Avg             s^2
>   --------                               ---    ----            ---             ---
>   __skb_wait_for_more_packets              1    0.000 us        0.000 us        0.000 us    
>   Function                               Hit    Time            Avg             s^2
>   --------                               ---    ----            ---             ---
>   __skb_wait_for_more_packets              1    74.813 us       74.813 us       0.000 us    
>   Function                               Hit    Time            Avg             s^2
>   --------                               ---    ----            ---             ---
>   Function                               Hit    Time            Avg             s^2
>   --------                               ---    ----            ---             ---
> 
> The above is for a 4 CPU machine. The s^2 is the square of the standard
> deviation (makes not having to do divisions while it runs).
> 
> But if you are looking for latency between two events (which can be kprobes
> too, where you do not need to rebuild your kernel):
> 
> From: https://man.archlinux.org/man/sqlhist.1.en
> which comes in: https://git.kernel.org/pub/scm/libs/libtrace/libtracefs.git/
>   if not already installed on your distro.
> 
>  # sqlhist -e -n wakeup_lat 'select end.next_comm as comm,start.pid,start.prio,(end.TIMESTAMP_USECS - start.TIMESTAMP_USECS) as delta from sched_waking as start join sched_switch as end on start.pid = end.next_pid where start.prio < 100'
> 
> The above creates a synthetic event called "wakeup_lat" that joins two
> events (sched_waking and sched_switch) when the pid field of sched_waking
> matches the next_pid field of sched_switch. When there is a match, it will
> trigger the wakeup_lat event only if the prio of the sched_waking event is
> less than 100 (which in the kernel means any real-time task). The
> wakeup_lat event will record the next_comm (as comm field), the pid of
> woken task and the time delta in microseconds between the two events.

So this looks like it's gotten better since I last looked, but it's still not
there yet.

Part of the problem is that the tracepoints themselves are in the wrong place:
your end event is when a task is woken up, but that means spurious wakeups will
cause one wait_event() call to be reported as multiple smaller waits, not one
long wait - oops, now I can't actually find the thing that's causing my
multi-second delay.

Also, in your example you don't have it broken out by callsite. That would be
the first thing I'd need for any real world debugging.

So, it looks like tracing has made some progress over the past 10 years, but
for debugging latency issues it's still not there yet in general. I will
definitely remember function latency tracing the next time I'm doing performance
work, but I expect that to be far too heavy to enable on a live server.

This thing is only a couple hundred lines of code though, so perhaps tracing
shouldn't be the only tool in our toolbox :)

