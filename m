Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E65335AA326
	for <lists+xen-devel@lfdr.de>; Fri,  2 Sep 2022 00:34:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.396985.637401 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oTslH-00014f-Ci; Thu, 01 Sep 2022 22:34:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 396985.637401; Thu, 01 Sep 2022 22:34:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oTslH-00011P-9s; Thu, 01 Sep 2022 22:34:11 +0000
Received: by outflank-mailman (input) for mailman id 396985;
 Thu, 01 Sep 2022 22:34:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=hZ//=ZE=goodmis.org=rostedt@kernel.org>)
 id 1oTslF-00011I-Nl
 for xen-devel@lists.xenproject.org; Thu, 01 Sep 2022 22:34:09 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [2604:1380:4641:c500::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2fd40133-2a46-11ed-934f-f50d60e1c1bd;
 Fri, 02 Sep 2022 00:34:06 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 7F34562017;
 Thu,  1 Sep 2022 22:34:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A9A46C433C1;
 Thu,  1 Sep 2022 22:33:59 +0000 (UTC)
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
X-Inumbo-ID: 2fd40133-2a46-11ed-934f-f50d60e1c1bd
Date: Thu, 1 Sep 2022 18:34:30 -0400
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
Message-ID: <20220901183430.120311ce@gandalf.local.home>
In-Reply-To: <20220901215438.gy3bgqa4ghhm6ztm@moria.home.lan>
References: <20220830214919.53220-1-surenb@google.com>
	<20220830214919.53220-28-surenb@google.com>
	<20220901173844.36e1683c@gandalf.local.home>
	<20220901215438.gy3bgqa4ghhm6ztm@moria.home.lan>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 1 Sep 2022 17:54:38 -0400
Kent Overstreet <kent.overstreet@linux.dev> wrote:
> 
> So this looks like it's gotten better since I last looked, but it's still not
> there yet.
> 
> Part of the problem is that the tracepoints themselves are in the wrong place:
> your end event is when a task is woken up, but that means spurious wakeups will

The end event is when a task is scheduled onto the CPU. The start event is
the first time it is woken up.

> cause one wait_event() call to be reported as multiple smaller waits, not one
> long wait - oops, now I can't actually find the thing that's causing my
> multi-second delay.
> 
> Also, in your example you don't have it broken out by callsite. That would be
> the first thing I'd need for any real world debugging.

OK, how about this (currently we can only have 3 keys, but you can create
multiple histograms on the same event).

 # echo 'hist:keys=comm,stacktrace,delta.buckets=10:sort=delta' > /sys/kernel/tracing/events/synthetic/wakeup_lat/trigger

(notice the "stacktrace" in the keys)

# cat /sys/kernel/tracing/events/synthetic/wakeup_lat/hist
# event histogram
#
# trigger info: hist:keys=comm,stacktrace,delta.buckets=10:vals=hitcount:sort=delta.buckets=10:size=2048 [active]
#

{ comm: migration/2                                       , stacktrace:
         event_hist_trigger+0x290/0x2b0
         event_triggers_call+0x52/0xe0
         trace_event_buffer_commit+0x193/0x240
         trace_event_raw_event_sched_switch+0x120/0x180
         __traceiter_sched_switch+0x39/0x50
         __schedule+0x310/0x700
         schedule_idle+0x26/0x40
         do_idle+0xb4/0xd0
         cpu_startup_entry+0x19/0x20
         secondary_startup_64_no_verify+0xc2/0xcb
, delta: ~ 10-19} hitcount:          7
{ comm: migration/5                                       , stacktrace:
         event_hist_trigger+0x290/0x2b0
         event_triggers_call+0x52/0xe0
         trace_event_buffer_commit+0x193/0x240
         trace_event_raw_event_sched_switch+0x120/0x180
         __traceiter_sched_switch+0x39/0x50
         __schedule+0x310/0x700
         schedule_idle+0x26/0x40
         do_idle+0xb4/0xd0
         cpu_startup_entry+0x19/0x20
         secondary_startup_64_no_verify+0xc2/0xcb
, delta: ~ 10-19} hitcount:          7
{ comm: migration/1                                       , stacktrace:
         event_hist_trigger+0x290/0x2b0
         event_triggers_call+0x52/0xe0
         trace_event_buffer_commit+0x193/0x240
         trace_event_raw_event_sched_switch+0x120/0x180
         __traceiter_sched_switch+0x39/0x50
         __schedule+0x310/0x700
         schedule_idle+0x26/0x40
         do_idle+0xb4/0xd0
         cpu_startup_entry+0x19/0x20
         secondary_startup_64_no_verify+0xc2/0xcb
, delta: ~ 10-19} hitcount:          7
{ comm: migration/7                                       , stacktrace:
         event_hist_trigger+0x290/0x2b0
         event_triggers_call+0x52/0xe0
         trace_event_buffer_commit+0x193/0x240
         trace_event_raw_event_sched_switch+0x120/0x180
         __traceiter_sched_switch+0x39/0x50
         __schedule+0x310/0x700
         schedule_idle+0x26/0x40
         do_idle+0xb4/0xd0
         cpu_startup_entry+0x19/0x20
         secondary_startup_64_no_verify+0xc2/0xcb
, delta: ~ 10-19} hitcount:          7
{ comm: migration/0                                       , stacktrace:
         event_hist_trigger+0x290/0x2b0
         event_triggers_call+0x52/0xe0
         trace_event_buffer_commit+0x193/0x240
         trace_event_raw_event_sched_switch+0x120/0x180
         __traceiter_sched_switch+0x39/0x50
         __schedule+0x310/0x700
         schedule_idle+0x26/0x40
         do_idle+0xb4/0xd0
         cpu_startup_entry+0x19/0x20
         start_kernel+0x595/0x5be
         secondary_startup_64_no_verify+0xc2/0xcb
, delta: ~ 10-19} hitcount:          7
{ comm: migration/4                                       , stacktrace:
         event_hist_trigger+0x290/0x2b0
         event_triggers_call+0x52/0xe0
         trace_event_buffer_commit+0x193/0x240
         trace_event_raw_event_sched_switch+0x120/0x180
         __traceiter_sched_switch+0x39/0x50
         __schedule+0x310/0x700
         schedule_idle+0x26/0x40
         do_idle+0xb4/0xd0
         cpu_startup_entry+0x19/0x20
         secondary_startup_64_no_verify+0xc2/0xcb
, delta: ~ 10-19} hitcount:          7
{ comm: rtkit-daemon                                      , stacktrace:
         event_hist_trigger+0x290/0x2b0
         event_triggers_call+0x52/0xe0
         trace_event_buffer_commit+0x193/0x240
         trace_event_raw_event_sched_switch+0x120/0x180
         __traceiter_sched_switch+0x39/0x50
         __schedule+0x310/0x700
         preempt_schedule_common+0x2d/0x70
         preempt_schedule_thunk+0x16/0x18
         _raw_spin_unlock_irq+0x2e/0x40
         eventfd_write+0xc8/0x290
         vfs_write+0xc0/0x2a0
         ksys_write+0x5f/0xe0
         do_syscall_64+0x3b/0x90
         entry_SYSCALL_64_after_hwframe+0x61/0xcb
, delta: ~ 10-19} hitcount:          1
{ comm: migration/6                                       , stacktrace:
         event_hist_trigger+0x290/0x2b0
         event_triggers_call+0x52/0xe0
         trace_event_buffer_commit+0x193/0x240
         trace_event_raw_event_sched_switch+0x120/0x180
         __traceiter_sched_switch+0x39/0x50
         __schedule+0x310/0x700
         schedule_idle+0x26/0x40
         do_idle+0xb4/0xd0
         cpu_startup_entry+0x19/0x20
         secondary_startup_64_no_verify+0xc2/0xcb
, delta: ~ 10-19} hitcount:          7
{ comm: rtkit-daemon                                      , stacktrace:
         event_hist_trigger+0x290/0x2b0
         event_triggers_call+0x52/0xe0
         trace_event_buffer_commit+0x193/0x240
         trace_event_raw_event_sched_switch+0x120/0x180
         __traceiter_sched_switch+0x39/0x50
         __schedule+0x310/0x700
         schedule_idle+0x26/0x40
         do_idle+0xb4/0xd0
         cpu_startup_entry+0x19/0x20
         secondary_startup_64_no_verify+0xc2/0xcb
, delta: ~ 20-29} hitcount:          1
{ comm: rtkit-daemon                                      , stacktrace:
         event_hist_trigger+0x290/0x2b0
         event_triggers_call+0x52/0xe0
         trace_event_buffer_commit+0x193/0x240
         trace_event_raw_event_sched_switch+0x120/0x180
         __traceiter_sched_switch+0x39/0x50
         __schedule+0x310/0x700
         preempt_schedule_common+0x2d/0x70
         preempt_schedule_thunk+0x16/0x18
         _raw_spin_unlock_irq+0x2e/0x40
         eventfd_write+0xc8/0x290
         vfs_write+0xc0/0x2a0
         ksys_write+0x5f/0xe0
         do_syscall_64+0x3b/0x90
         entry_SYSCALL_64_after_hwframe+0x61/0xcb
, delta: ~ 30-39} hitcount:          1
{ comm: rtkit-daemon                                      , stacktrace:
         event_hist_trigger+0x290/0x2b0
         event_triggers_call+0x52/0xe0
         trace_event_buffer_commit+0x193/0x240
         trace_event_raw_event_sched_switch+0x120/0x180
         __traceiter_sched_switch+0x39/0x50
         __schedule+0x310/0x700
         schedule_idle+0x26/0x40
         do_idle+0xb4/0xd0
         cpu_startup_entry+0x19/0x20
         secondary_startup_64_no_verify+0xc2/0xcb
, delta: ~ 40-49} hitcount:          1

Totals:
    Hits: 53
    Entries: 11
    Dropped: 0


Not the prettiest thing to read. But hey, we got the full stack of where
these latencies happened!

Yes, it adds some overhead when the events are triggered due to the
stacktrace code, but it's extremely useful information.

> 
> So, it looks like tracing has made some progress over the past 10 years,
> but for debugging latency issues it's still not there yet in general. I

I call BS on that statement. Just because you do not know what has been
added to the kernel in the last 10 years (like you had no idea about
seq_buf and that was added in 2014) means to me that you are totally
clueless on what tracing can and can not do.

It appears to me that you are too focused on inventing your own wheel that
does exactly what you want before looking to see how things are today. Just
because something didn't fit your needs 10 years ago doesn't mean that it
can't fit your needs today.


> will definitely remember function latency tracing the next time I'm doing
> performance work, but I expect that to be far too heavy to enable on a
> live server.

I run it on production machines all the time. With the filtering in place
it has very little overhead. Mostly in the noise. The best part is that it
has practically zero overhead (but can add some cache pressure) when it's
off, and can be turned on at run time.

The tracing infrastructure is very modular, you can use parts of it that
you need, without the overhead of other parts. Like you found out this week
that tracepoints are not the same as trace events. Because tracepoints are
just a hook in the code that anything can attach to (that's what Daniel's
RV work does). Trace events provide the stored data to be recorded.

I will note that the current histogram code overhead has increased due to
retpolines, but I have code to convert them from indirect calls to direct
calls via a switch statement which drops the overhead by 20%!

  https://lore.kernel.org/all/20220823214606.344269352@goodmis.org/


> 
> This thing is only a couple hundred lines of code though, so perhaps
> tracing shouldn't be the only tool in our toolbox :)

I'm already getting complaints from customers/users that are saying there's
too many tools in the toolbox already. (Do we use ftrace/perf/bpf?). The
idea is to have the tools using mostly the same infrastructure, and not be
100% off on its own, unless there's a clear reason to invent a new wheel
that several people are asking for, not just one or two.

-- Steve

