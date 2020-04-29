Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A67441BD6DC
	for <lists+xen-devel@lfdr.de>; Wed, 29 Apr 2020 10:10:07 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jThn1-0000LG-Jp; Wed, 29 Apr 2020 08:09:55 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=fvgr=6N=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1jThn0-0000L6-Gv
 for xen-devel@lists.xenproject.org; Wed, 29 Apr 2020 08:09:54 +0000
X-Inumbo-ID: ce019890-89f0-11ea-9887-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ce019890-89f0-11ea-9887-bc764e2007e4;
 Wed, 29 Apr 2020 08:09:53 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id AFEB3ACC4;
 Wed, 29 Apr 2020 08:09:51 +0000 (UTC)
Subject: Re: Cpu on/offlining crash with core scheduling
To: Sergey Dyasli <sergey.dyasli@citrix.com>
References: <1587995374653.73805@citrix.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <103f3e30-a67e-77b7-9e92-572ee4b5d159@suse.com>
Date: Wed, 29 Apr 2020 10:09:51 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <1587995374653.73805@citrix.com>
Content-Type: multipart/mixed; boundary="------------CDE6B0D50FE84F03F4E32008"
Content-Language: en-US
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

This is a multi-part message in MIME format.
--------------CDE6B0D50FE84F03F4E32008
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

On 27.04.20 15:49, Sergey Dyasli wrote:
> Hi Juergen,
> 
> When I'm testing vcpu pinning with something like:
> 
>       # xl vcpu-pin 0 0 2
>       # xen-hptool cpu-offline 3
> 
>       (offline / online CPUs {2,3} if the above is successful)
> 
> I'm reliably seeing the following crash on the latest staging:
> 
> (XEN) Watchdog timer detects that CPU1 is stuck!
> (XEN) ----[ Xen-4.14-unstable  x86_64  debug=y   Not tainted ]----
> (XEN) CPU:    1
> (XEN) RIP:    e008:[<ffff82d08025266d>] common/sched/core.c#sched_wait_rendezvous_in+0x16c/0x385
> (XEN) RFLAGS: 0000000000000002   CONTEXT: hypervisor
> (XEN) rax: 000000000000f001   rbx: ffff82d0805c9118   rcx: ffff83085e750301
> (XEN) rdx: 0000000000000001   rsi: ffff83086499b972   rdi: ffff83085e7503a6
> (XEN) rbp: ffff83085e7dfe28   rsp: ffff83085e7dfdd8   r8:  ffff830864985440
> (XEN) r9:  ffff83085e714068   r10: 0000000000000014   r11: 00000056b6a1aab2
> (XEN) r12: ffff83086499e490   r13: ffff82d0805f26e0   r14: ffff83085e7503a0
> (XEN) r15: 0000000000000001   cr0: 0000000080050033   cr4: 0000000000362660
> (XEN) cr3: 0000000823a8e000   cr2: 00006026000f6fc0
> (XEN) fsb: 0000000000000000   gsb: ffff888138dc0000   gss: 0000000000000000
> (XEN) ds: 002b   es: 002b   fs: 0000   gs: 0000   ss: e010   cs: e008
> (XEN) Xen code around <ffff82d08025266d> (common/sched/core.c#sched_wait_rendezvous_in+0x16c/0x385):
> (XEN)  4c 89 f7 e8 dc a5 fd ff <4b> 8b 44 fd 00 48 8b 04 18 4c 3b 70 10 0f 85 3f
> (XEN) Xen stack trace from rsp=ffff83085e7dfdd8:
> (XEN)    00000056b42128a6 ffff83086499ff30 ffff83086498a000 ffff83085e7dfe48
> (XEN)    0000000100000001 00000056b42128a6 ffff83086499e490 0000000000000000
> (XEN)    0000000000000001 0000000000000001 ffff83085e7dfe78 ffff82d080252ae8
> (XEN)    ffff83086498a000 0000000180230434 ffff83085e7503a0 ffff82d0805ceb00
> (XEN)    ffffffffffffffff ffff82d0805cea80 0000000000000000 ffff82d0805dea80
> (XEN)    ffff83085e7dfeb0 ffff82d08022c232 0000000000000001 ffff82d0805ceb00
> (XEN)    0000000000000001 0000000000000001 0000000000000001 ffff83085e7dfec0
> (XEN)    ffff82d08022c2cd ffff83085e7dfef0 ffff82d08031cae9 ffff83086498a000
> (XEN)    ffff83086498a000 0000000000000001 0000000000000001 ffff83085e7dfde8
> (XEN)    ffff88813021d700 ffff88813021d700 0000000000000000 0000000000000000
> (XEN)    0000000000000007 ffff88813021d700 0000000000000246 0000000000007ff0
> (XEN)    0000000000000000 000000000001ca00 0000000000000000 ffffffff810013aa
> (XEN)    ffffffff8203d210 deadbeefdeadf00d deadbeefdeadf00d 0000010000000000
> (XEN)    ffffffff810013aa 000000000000e033 0000000000000246 ffffc900400dfeb0
> (XEN)    000000000000e02b 0000000000000000 0000000000000000 0000000000000000
> (XEN)    0000000000000000 0000e01000000001 ffff83086498a000 00000037e43bd000
> (XEN)    0000000000362660 0000000000000000 8000000864980002 0000060100000000
> (XEN)    0000000000000000
> (XEN) Xen call trace:
> (XEN)    [<ffff82d08025266d>] R common/sched/core.c#sched_wait_rendezvous_in+0x16c/0x385
> (XEN)    [<ffff82d080252ae8>] F common/sched/core.c#sched_slave+0x262/0x31e
> (XEN)    [<ffff82d08022c232>] F common/softirq.c#__do_softirq+0x8a/0xbc
> (XEN)    [<ffff82d08022c2cd>] F do_softirq+0x13/0x15
> (XEN)    [<ffff82d08031cae9>] F arch/x86/domain.c#idle_loop+0x57/0xa7
> (XEN)
> (XEN) CPU0 @ e008:ffff82d08022c2b7 (process_pending_softirqs+0x53/0x56)
> (XEN) CPU4 @ e008:ffff82d08022bc40 (common/rcupdate.c#rcu_process_callbacks+0x22e/0x24b)
> (XEN) CPU2 @ e008:ffff82d08022c26f (process_pending_softirqs+0xb/0x56)
> (XEN) CPU7 @ e008:ffff82d08022bc40 (common/rcupdate.c#rcu_process_callbacks+0x22e/0x24b)
> (XEN) CPU3 @ e008:ffff82d08022bc40 (common/rcupdate.c#rcu_process_callbacks+0x22e/0x24b)
> (XEN) CPU5 @ e008:ffff82d08022cc34 (_spin_lock+0x4d/0x62)
> (XEN) CPU6 @ e008:ffff82d08022c264 (process_pending_softirqs+0/0x56)
> (XEN)
> (XEN) ****************************************
> (XEN) Panic on CPU 1:
> (XEN) FATAL TRAP: vector = 2 (nmi)
> (XEN) [error_code=0000] , IN INTERRUPT CONTEXT
> (XEN) ****************************************
> (XEN)
> (XEN) Reboot in five seconds...
> (XEN) Executing kexec image on cpu1
> (XEN) Shot down all CPUs
> 
> 
> Is this something you can reproduce?

Yes, I was able to hit this.

Attached patch is fixing it for me. Could you give it a try?


Juergen

--------------CDE6B0D50FE84F03F4E32008
Content-Type: text/x-patch; charset=UTF-8;
 name="0001-xen-sched-allow-rcu-work-to-happen-when-syncing-cpus.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename*0="0001-xen-sched-allow-rcu-work-to-happen-when-syncing-cpus.pa";
 filename*1="tch"

From 44b530f4bb9c94ae4e429b83d730237f11410a5f Mon Sep 17 00:00:00 2001
From: Juergen Gross <jgross@suse.com>
Date: Wed, 29 Apr 2020 09:40:46 +0200
Subject: [PATCH] xen/sched: allow rcu work to happen when syncing cpus in core
 scheduling

With RCU barriers moved from tasklets to normal RCU processing cpu
offlining in core scheduling might deadlock due to cpu synchronization
required by RCU processing and core scheduling concurrently.

Fix that by bailing out from core scheduling synchronization in case
of pending RCU work. Additionally the RCU softirq is now required to
be of higher priority than the scheduling softirqs in order to do
RCU processing before entering the scheduler again, as bailing out from
the core scheduling synchronization requires to raise another softirq
SCHED_SLAVE, which would bypass RCU processing again.

Reported-by: Sergey Dyasli <sergey.dyasli@citrix.com>
Signed-off-by: Juergen Gross <jgross@suse.com>
---
 xen/common/sched/core.c   | 10 +++++++---
 xen/include/xen/softirq.h |  2 +-
 2 files changed, 8 insertions(+), 4 deletions(-)

diff --git a/xen/common/sched/core.c b/xen/common/sched/core.c
index d94b95285f..a099e37b0f 100644
--- a/xen/common/sched/core.c
+++ b/xen/common/sched/core.c
@@ -2457,13 +2457,17 @@ static struct sched_unit *sched_wait_rendezvous_in(struct sched_unit *prev,
             v = unit2vcpu_cpu(prev, cpu);
         }
         /*
-         * Coming from idle might need to do tasklet work.
+         * Check for any work to be done which might need cpu synchronization.
+         * This is either pending RCU work, or tasklet work when coming from
+         * idle.
          * In order to avoid deadlocks we can't do that here, but have to
-         * continue the idle loop.
+         * schedule the previous vcpu again, which will lead to the desired
+         * processing to be done.
          * Undo the rendezvous_in_cnt decrement and schedule another call of
          * sched_slave().
          */
-        if ( is_idle_unit(prev) && sched_tasklet_check_cpu(cpu) )
+        if ( rcu_pending(cpu) ||
+             (is_idle_unit(prev) && sched_tasklet_check_cpu(cpu)) )
         {
             struct vcpu *vprev = current;
 
diff --git a/xen/include/xen/softirq.h b/xen/include/xen/softirq.h
index b4724f5c8b..1f6c4783da 100644
--- a/xen/include/xen/softirq.h
+++ b/xen/include/xen/softirq.h
@@ -4,10 +4,10 @@
 /* Low-latency softirqs come first in the following list. */
 enum {
     TIMER_SOFTIRQ = 0,
+    RCU_SOFTIRQ,
     SCHED_SLAVE_SOFTIRQ,
     SCHEDULE_SOFTIRQ,
     NEW_TLBFLUSH_CLOCK_PERIOD_SOFTIRQ,
-    RCU_SOFTIRQ,
     TASKLET_SOFTIRQ,
     NR_COMMON_SOFTIRQS
 };
-- 
2.16.4


--------------CDE6B0D50FE84F03F4E32008--

