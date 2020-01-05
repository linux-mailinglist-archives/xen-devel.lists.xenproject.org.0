Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 895791306C9
	for <lists+xen-devel@lfdr.de>; Sun,  5 Jan 2020 09:33:18 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1io1HY-00021K-JT; Sun, 05 Jan 2020 08:29:08 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Ep8Y=22=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1io1HW-00021F-Vb
 for xen-devel@lists.xenproject.org; Sun, 05 Jan 2020 08:29:07 +0000
X-Inumbo-ID: f92095c8-2f94-11ea-a914-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f92095c8-2f94-11ea-a914-bc764e2007e4;
 Sun, 05 Jan 2020 08:28:55 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 6E736AD43;
 Sun,  5 Jan 2020 08:25:43 +0000 (UTC)
To: =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>, Andrew Cooper <andrew.cooper3@citrix.com>
References: <20200104153032.GA2995@mail-itl>
 <5fdae943-3cc7-6dcf-3a2d-33b7df83cec8@citrix.com>
 <20200105073945.GF1314@mail-itl>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <fe785b74-5e54-26e6-ffc6-6bc2741b35ee@suse.com>
Date: Sun, 5 Jan 2020 09:25:42 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.1
MIME-Version: 1.0
In-Reply-To: <20200105073945.GF1314@mail-itl>
Content-Type: multipart/mixed; boundary="------------93A2850125B2E8DF04F05CE7"
Content-Language: en-US
Subject: Re: [Xen-devel] Xen crash on S3 resume on 4.13 and unstable if any
 CPU is re-offlined
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: xen-devel <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Micha=c5=82_Kowalczyk?= <mkow@invisiblethingslab.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

This is a multi-part message in MIME format.
--------------93A2850125B2E8DF04F05CE7
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

On 05.01.20 08:39, Marek Marczykowski-Górecki wrote:
> On Sun, Jan 05, 2020 at 12:42:30AM +0000, Andrew Cooper wrote:
>> On 04/01/2020 15:30, Marek Marczykowski-Górecki wrote:
>>> Hi,
>>>
>>> I have a reliable crash on resume from S3. I can reproduce it on both
>>> real hardware and nested within KVM, although call traces are different
>>> between those platforms. In any case, it happens only if some CPU is to
>>> be re-offlined after resume (smt=off and/or maxcpus=... options).
>>>
>>> I think the crash from the real hardware gives more clues, but the one
>>> from qemu may also be interesting, maybe it's even another bug?
>>>
>>> The crash message (full console log attached):
>>>
>>> (XEN) mce_intel.c:772: MCA Capability: firstbank 0, extended MCE MSR 0, BCAST, CMCI
>>> (XEN) CPU0 CMCI LVT vector (0xf2) already installed
>>> (XEN) Finishing wakeup from ACPI S3 state.
>>> (XEN) Enabling non-boot CPUs  ...
>>> (XEN) ----[ Xen-4.14-unstable  x86_64  debug=y   Not tainted ]----
>>> (XEN) CPU:    0
>>> (XEN) RIP:    e008:[<ffff82d08023beb7>] schedule.c#cpu_schedule_callback+0xea/0x1a1
>>> (XEN) RFLAGS: 0000000000010202   CONTEXT: hypervisor
>>> (XEN) rax: 0000000000000000   rbx: ffff82d080453348   rcx: ffff82d080584020
>>> (XEN) rdx: 000000339b66e000   rsi: 0000000000008005   rdi: ffff82d080453340
>>> (XEN) rbp: ffff8300ca45fd68   rsp: ffff8300ca45fd68   r8:  0000000000000004
>>> (XEN) r9:  0000000000000000   r10: 0000000000000000   r11: 8000000000000000
>>> (XEN) r12: ffff82d080453340   r13: ffff82d080453200   r14: 0000000000008005
>>> (XEN) r15: 0000000000008000   cr0: 000000008005003b   cr4: 00000000000426e0
>>> (XEN) cr3: 00000000ca44f000   cr2: 0000000000000008
>>> (XEN) fsb: 000079d5e4f9e740   gsb: ffff888135600000   gss: 0000000000000000
>>> (XEN) ds: 0018   es: 0010   fs: b800   gs: 0010   ss: 0000   cs: e008
>>> (XEN) Xen code around <ffff82d08023beb7> (schedule.c#cpu_schedule_callback+0xea/0x1a1):
>>> (XEN)  48 8b 14 d1 48 8b 04 02 <48> 8b 48 08 48 85 c9 74 64 48 8b 05 b9 c3 32 00
>>> (XEN) Xen stack trace from rsp=ffff8300ca45fd68:
>>> (XEN)    ffff8300ca45fdb0 ffff82d080221289 ffff8300ca45fdd8 0000000000000001
>>> (XEN)    0000000000000000 00000000ffffffef ffff8300ca45fe00 0000000000000001
>>> (XEN)    0000000000000200 ffff8300ca45fdc8 ffff82d080203476 0000000000000001
>>> (XEN)    ffff8300ca45fdf0 ffff82d080203550 0000000000000000 0000000000000001
>>> (XEN)    0000000000000000 ffff8300ca45fe20 ffff82d080203999 ffff8300ca45fef8
>>> (XEN)    0000000000000000 0000000000000003 00000000000426e0 ffff8300ca45fe58
>>> (XEN)    ffff82d0802e4240 ffff83042896c5f0 ffff83041bb4d000 0000000000000000
>>> (XEN)    0000000000000000 ffff83041bb73000 ffff8300ca45fe78 ffff82d08020828f
>>> (XEN)    ffff83041bb4d1b8 ffff82d080567210 ffff8300ca45fe90 ffff82d08023fd39
>>> (XEN)    ffff82d080567200 ffff8300ca45fec0 ffff82d08024001a 0000000000000000
>>> (XEN)    ffff82d080567210 ffff82d08056d980 ffff82d080584020 ffff8300ca45fef0
>>> (XEN)    ffff82d08027247a ffff83041bbb2000 ffff83041bb4d000 ffff83041bbb3000
>>> (XEN)    0000000000000000 ffff8300ca45fd98 0000000000000003 ffffffff820ae496
>>> (XEN)    0000000000000003 0000000000000000 0000000000002003 ffffffff822c6868
>>> (XEN)    0000000000000246 0000000000003403 00000000ffff0000 0000000000000000
>>> (XEN)    0000000000000000 ffffffff810010ea 0000000000002003 0000000000000010
>>> (XEN)    deadbeefdeadf00d 0000010000000000 ffffffff810010ea 000000000000e033
>>> (XEN)    0000000000000246 ffffc900011abbe8 000000000000e02b 003b4a890045ffe0
>>> (XEN)    003b4ddf00098fa8 003b4e0300000001 003b499d0045ffe0 0000e01000000000
>>> (XEN)    ffff83041bbb2000 0000000000000000 00000000000426e0 0000000000000000
>>> (XEN) Xen call trace:
>>> (XEN)    [<ffff82d08023beb7>] R schedule.c#cpu_schedule_callback+0xea/0x1a1
>>> (XEN)    [<ffff82d080221289>] F notifier_call_chain+0x6b/0x96
>>> (XEN)    [<ffff82d080203476>] F cpu.c#cpu_notifier_call_chain+0x1b/0x33
>>> (XEN)    [<ffff82d080203550>] F cpu_down+0x5e/0x15c
>>> (XEN)    [<ffff82d080203999>] F enable_nonboot_cpus+0x113/0x1fb
>>> (XEN)    [<ffff82d0802e4240>] F power.c#enter_state_helper+0x107/0x51b
>>> (XEN)    [<ffff82d08020828f>] F domain.c#continue_hypercall_tasklet_handler+0x8b/0xb7
>>> (XEN)    [<ffff82d08023fd39>] F tasklet.c#do_tasklet_work+0x76/0xa9
>>> (XEN)    [<ffff82d08024001a>] F do_tasklet+0x58/0x8a
>>> (XEN)    [<ffff82d08027247a>] F domain.c#idle_loop+0x40/0x96
>>> (XEN)
>>> (XEN) Pagetable walk from 0000000000000008:
>>> (XEN)  L4[0x000] = 000000041bbff063 ffffffffffffffff
>>> (XEN)  L3[0x000] = 000000041bbfe063 ffffffffffffffff
>>> (XEN)  L2[0x000] = 000000041bbfd063 ffffffffffffffff
>>> (XEN)  L1[0x000] = 0000000000000000 ffffffffffffffff
>>> (XEN)
>>> (XEN) ****************************************
>>> (XEN) Panic on CPU 0:
>>> (XEN) FATAL PAGE FAULT
>>> (XEN) [error_code=0000]
>>> (XEN) Faulting linear address: 0000000000000008
>>> (XEN) ****************************************
>>>
>>> And the one from qemu:
>>>
>>> (XEN) mce_intel.c:772: MCA Capability: firstbank 1, extended MCE MSR 0, SER
>>> (XEN) Finishing wakeup from ACPI S3 state.
>>> (XEN) Enabling non-boot CPUs  ...
>>> (XEN) Assertion 'c2rqd(ops, sched_unit_master(unit)) == svc->rqd' failed at sched_credit2.c:2137
>>> (XEN) ----[ Xen-4.14-unstable  x86_64  debug=y   Not tainted ]----
>>> (XEN) CPU:    1
>>> (XEN) RIP:    e008:[<ffff82d08022fe1a>] sched_credit2.c#csched2_unit_wake+0x174/0x176
>>> (XEN) RFLAGS: 0000000000010097   CONTEXT: hypervisor (d0v0)
>>> (XEN) rax: ffff83013a7313e8   rbx: ffff83013a6bdf40   rcx: 0000000000000051
>>> (XEN) rdx: ffff83013a731160   rsi: ffff83013a7310e0   rdi: 0000000000000003
>>> (XEN) rbp: ffff83013a6f7d98   rsp: ffff83013a6f7d78   r8:  deadbeefdeadf00d
>>> (XEN) r9:  deadbeefdeadf00d   r10: 0000000000000000   r11: 0000000000000000
>>> (XEN) r12: ffff83013a6bc7e0   r13: ffff82d08043e720   r14: 0000000000000003
>>> (XEN) r15: 00000003c5ffecac   cr0: 0000000080050033   cr4: 0000000000000660
>>> (XEN) cr3: 000000004b005000   cr2: 0000000000000000
>>> (XEN) fsb: 00007751649f4740   gsb: ffff888134a00000   gss: 0000000000000000
>>> (XEN) ds: 0000   es: 0000   fs: 0000   gs: 0000   ss: e010   cs: e008
>>> (XEN) Xen code around <ffff82d08022fe1a> (sched_credit2.c#csched2_unit_wake+0x174/0x176):
>>> (XEN)  ef e8 1e c1 ff ff eb a7 <0f> 0b 55 48 89 e5 41 57 41 56 41 55 41 54 53 48
>>> (XEN) Xen stack trace from rsp=ffff83013a6f7d78:
>>> (XEN)    ffff83013a6a3000 ffff83013a6bdf40 ffff83013a6bdf40 ffff83013a7313e8
>>> (XEN)    ffff83013a6f7de8 ffff82d0802391f8 0000000000000202 ffff83013a7313e8
>>> (XEN)    ffff83013a6c1018 0000000000000001 0000000000000000 0000000000000000
>>> (XEN)    ffff83013a6c1018 ffff83013a6a3000 ffff83013a6f7e58 ffff82d08020906c
>>> (XEN)    ffff82d08035d3d4 ffff82d08035d3c8 ffff82d08035d3d4 ffff82d08035d3c8
>>> (XEN)    ffff82d08035d3d4 ffff82d08035d3c8 ffff82d08035d3d4 ffff83013a6f7ef8
>>> (XEN)    0000000000000180 ffff83013a6aa000 deadbeefdeadf00d 0000000000000003
>>> (XEN)    ffff83013a6f7ee8 ffff82d0803570c7 0000000000000001 0000000000000001
>>> (XEN)    0000000000000000 deadbeefdeadf00d deadbeefdeadf00d ffff82d08035d3c8
>>> (XEN)    ffff82d08035d3d4 ffff82d08035d3c8 ffff82d08035d3d4 ffff82d08035d3c8
>>> (XEN)    ffff82d08035d3d4 ffff83013a6aa000 0000000000000000 0000000000000000
>>> (XEN)    0000000000000000 0000000000000000 00007cfec59080e7 ffff82d08035d432
>>> (XEN)    0000000000015120 0000000000000001 0000000000000000 ffff88813024a540
>>> (XEN)    0000000000000000 0000000000000001 0000000000000246 0000000000140000
>>> (XEN)    ffff8880bf7db000 ffffea0004be4508 0000000000000018 ffffffff8100130a
>>> (XEN)    0000000000000000 0000000000000001 0000000000000001 0000010000000000
>>> (XEN)    ffffffff8100130a 000000000000e033 0000000000000246 ffffc90000c97c98
>>> (XEN)    000000000000e02b 0000000000000000 0000000000000000 0000000000000000
>>> (XEN)    0000000000000000 0000e01000000001 ffff83013a6aa000 00000030ba196000
>>> (XEN)    0000000000000660 0000000000000000 000000013a6e2000 0000040000000000
>>> (XEN) Xen call trace:
>>> (XEN)    [<ffff82d08022fe1a>] R sched_credit2.c#csched2_unit_wake+0x174/0x176
>>> (XEN)    [<ffff82d0802391f8>] F vcpu_wake+0xea/0x4d8
>>> (XEN)    [<ffff82d08020906c>] F do_vcpu_op+0x36f/0x687
>>> (XEN)    [<ffff82d0803570c7>] F pv_hypercall+0x28f/0x57d
>>> (XEN)    [<ffff82d08035d432>] F lstar_enter+0x112/0x120
>>> (XEN)
>>> (XEN)
>>> (XEN) ****************************************
>>> (XEN) Panic on CPU 1:
>>> (XEN) Assertion 'c2rqd(ops, sched_unit_master(unit)) == svc->rqd' failed at sched_credit2.c:2137
>>> (XEN) ****************************************
>>
>> This looks very much like the core scheduling crash found on specific
>> machines in S5.  From my analysis, it was a use-after-free on a
>> schedulling resource.
>>
>> Does switching back to thread mode (as opposed to core mode) make the
>> crash go away?
> 
> It is the thread mode (unless default has changed).

Does the attached patch fix it for you?


Juergen

--------------93A2850125B2E8DF04F05CE7
Content-Type: text/x-patch; charset=UTF-8;
 name="0001-xen-sched-fix-resuming-from-S3-with-smt-0.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="0001-xen-sched-fix-resuming-from-S3-with-smt-0.patch"

From f53e105a9789b6d268e7fe4d05e4b989b9143338 Mon Sep 17 00:00:00 2001
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: George Dunlap <george.dunlap@eu.citrix.com>
Cc: Dario Faggioli <dfaggioli@suse.com>
Date: Sun, 5 Jan 2020 09:21:41 +0100
Subject: [PATCH] xen/sched: fix resuming from S3 with smt=0

When resuming from S3 and smt=0 or maxcpus= are specified we must not
do anything in cpu_schedule_callback(). This is not true today for
taking down a cpu during resume.

If anything goes wrong during resume all the scheduler related error
handling is in cpupool.c, so we can just bail out early from
cpu_schedule_callback() when suspending or resuming.

This fixes commit 0763cd2687897b55e7 ("xen/sched: don't disable
scheduler on cpus during suspend").

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 xen/common/schedule.c | 15 +++++++++------
 1 file changed, 9 insertions(+), 6 deletions(-)

diff --git a/xen/common/schedule.c b/xen/common/schedule.c
index e70cc70a65..54a07ff9e8 100644
--- a/xen/common/schedule.c
+++ b/xen/common/schedule.c
@@ -2562,6 +2562,13 @@ static int cpu_schedule_callback(
     unsigned int cpu = (unsigned long)hcpu;
     int rc = 0;
 
+    /*
+     * All scheduler related suspend/resume handling needed is done in
+     * cpupool.c.
+     */
+    if ( system_state > SYS_STATE_active )
+        return NOTIFY_DONE;
+
     rcu_read_lock(&sched_res_rculock);
 
     /*
@@ -2589,8 +2596,7 @@ static int cpu_schedule_callback(
     switch ( action )
     {
     case CPU_UP_PREPARE:
-        if ( system_state != SYS_STATE_resume )
-            rc = cpu_schedule_up(cpu);
+        rc = cpu_schedule_up(cpu);
         break;
     case CPU_DOWN_PREPARE:
         rcu_read_lock(&domlist_read_lock);
@@ -2598,13 +2604,10 @@ static int cpu_schedule_callback(
         rcu_read_unlock(&domlist_read_lock);
         break;
     case CPU_DEAD:
-        if ( system_state == SYS_STATE_suspend )
-            break;
         sched_rm_cpu(cpu);
         break;
     case CPU_UP_CANCELED:
-        if ( system_state != SYS_STATE_resume )
-            cpu_schedule_down(cpu);
+        cpu_schedule_down(cpu);
         break;
     default:
         break;
-- 
2.16.4


--------------93A2850125B2E8DF04F05CE7
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--------------93A2850125B2E8DF04F05CE7--

