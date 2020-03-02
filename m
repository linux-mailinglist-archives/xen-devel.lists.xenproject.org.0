Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 08AEB175C8F
	for <lists+xen-devel@lfdr.de>; Mon,  2 Mar 2020 15:08:05 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j8lhl-00032R-G8; Mon, 02 Mar 2020 14:05:57 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=xlOq=4T=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1j8lhk-00032M-Hn
 for xen-devel@lists.xenproject.org; Mon, 02 Mar 2020 14:05:56 +0000
X-Inumbo-ID: eef3276a-5c8e-11ea-8616-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id eef3276a-5c8e-11ea-8616-bc764e2007e4;
 Mon, 02 Mar 2020 14:05:55 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id EEE3FAB8F;
 Mon,  2 Mar 2020 14:05:54 +0000 (UTC)
To: Igor Druzhinin <igor.druzhinin@citrix.com>
References: <c9adeb2c-b580-f3d3-fba7-dd703b1efdfa@suse.com>
 <dc3ba72b-ae33-d5ae-f0b0-ad57985ab92f@citrix.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <37ca6d18-4f21-0a00-cedf-69a1b8f2114c@suse.com>
Date: Mon, 2 Mar 2020 15:05:54 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <dc3ba72b-ae33-d5ae-f0b0-ad57985ab92f@citrix.com>
Content-Type: multipart/mixed; boundary="------------5C14BC05B94B158AEE5C282A"
Content-Language: en-US
Subject: Re: [Xen-devel] Core scheduling and cpu offlining
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Sergey Dyasli <sergey.dyasli@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

This is a multi-part message in MIME format.
--------------5C14BC05B94B158AEE5C282A
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

On 02.03.20 14:51, Igor Druzhinin wrote:
> On 02/03/2020 08:39, Jürgen Groß wrote:
>> Hi Igor,
>>
>> could you please test the attached patch whether it fixes your problem
>> with cpu offlining?
> 
> It's certainly better and doesn't cause watchdog hit as before but I ran
> the following script to verify:
> 
> while true
> do
>      for i in `seq 1 63`; do xen-hptool cpu-offline $i; done
>      for i in `seq 1 63`; do xen-hptool cpu-online $i; done
> done
> 
> ... and got this a little bit later (note the same script works fine in thread mode):
> 
> (XEN) [  282.199134] Assertion '!preempt_count()' failed at preempt.c:36
> (XEN) [  282.199142] ----[ Xen-4.13.0  x86_64  debug=y   Not tainted ]----
> (XEN) [  282.199147] CPU:    0
> (XEN) [  282.199150] RIP:    e008:[<ffff82d080228817>] ASSERT_NOT_IN_ATOMIC+0x1f/0x58
> (XEN) [  282.199159] RFLAGS: 0000000000010202   CONTEXT: hypervisor
> (XEN) [  282.199165] rax: ffff82d0805c7024   rbx: 0000000000000000   rcx: 0000000000000000
> (XEN) [  282.199170] rdx: 0000000000000000   rsi: 00000000000026cd   rdi: ffff82d0804b3aac
> (XEN) [  282.199175] rbp: ffff8300920bfe90   rsp: ffff8300920bfe90   r8:  ffff83042f21ffe0
> (XEN) [  282.199180] r9:  0000000000000001   r10: 3333333333333333   r11: 0000000000000001
> (XEN) [  282.199185] r12: ffff82d0805cdb00   r13: 0000000000000000   r14: ffff82d0805c7250
> (XEN) [  282.199192] r15: 0000000000000000   cr0: 000000008005003b   cr4: 00000000003506e0
> (XEN) [  282.199252] cr3: 00000000920b0000   cr2: 00007f0fff967000
> (XEN) [  282.199256] fsb: 00007f0fff957740   gsb: ffff88821e000000   gss: 0000000000000000
> (XEN) [  282.199261] ds: 0000   es: 0000   fs: 0000   gs: 0000   ss: e010   cs: e008
> (XEN) [  282.199268] Xen code around <ffff82d080228817> (ASSERT_NOT_IN_ATOMIC+0x1f/0x58):
> (XEN) [  282.199272]  52 d1 83 3c 10 00 74 02 <0f> 0b 48 89 e0 48 0d ff 7f 00 00 8b 40 c1 48 c1
> (XEN) [  282.199287] Xen stack trace from rsp=ffff8300920bfe90:
> (XEN) [  282.199290]    ffff8300920bfea0 ffff82d080242680 ffff8300920bfef0 ffff82d08027a171
> (XEN) [  282.199297]    ffff82d080242635 000000002b3bf000 ffff83042bb1f000 ffff83042bb1f000
> (XEN) [  282.199304]    ffff83042bb1f000 0000000000000000 ffff82d0805ec620 0000000000000000
> (XEN) [  282.199311]    ffff8300920bfd60 0000000000000000 00007ffc633001b0 0000000000305000
> (XEN) [  282.199317]    ffff888212bd28a8 00007ffc633001b0 fffffffffffffff2 0000000000000286
> (XEN) [  282.199324]    0000000000000000 0000000000000000 0000000000000000 0000000000000000
> (XEN) [  282.199329]    ffffffff8100146a 0000000000000000 0000000000000000 deadbeefdeadf00d
> (XEN) [  282.199335]    0000010000000000 ffffffff8100146a 000000000000e033 0000000000000286
> (XEN) [  282.199342]    ffffc90042977d70 000000000000e02b 0000000000000000 0000000000000000
> (XEN) [  282.199347]    0000000000000000 0000000000000000 0000e01000000000 ffff83042bb1f000
> (XEN) [  282.199353]    0000000000000000 00000000003506e0 0000000000000000 0000000000000000
> (XEN) [  282.199359]    0000040000000000 0000000000000000
> (XEN) [  282.199364] Xen call trace:
> (XEN) [  282.199368]    [<ffff82d080228817>] R ASSERT_NOT_IN_ATOMIC+0x1f/0x58
> (XEN) [  282.199375]    [<ffff82d080242680>] F do_softirq+0x9/0x15
> (XEN) [  282.199381]    [<ffff82d08027a171>] F arch/x86/domain.c#idle_loop+0xb4/0xcb
> (XEN) [  282.199384]
> (XEN) [  282.438998]
> (XEN) [  282.440991] ****************************************
> (XEN) [  282.446459] Panic on CPU 0:
> (XEN) [  282.449745] Assertion '!preempt_count()' failed at preempt.c:36
> (XEN) [  282.456156] ****************************************
> (XEN) [  282.461621]

Oh, indeed, there are rcu_read_unlock() calls missing (up to now
for ARM relevant only).

Is this one better?


Juergen

--------------5C14BC05B94B158AEE5C282A
Content-Type: text/x-patch; charset=UTF-8;
 name="0001-xen-sched-fix-cpu-offlining-with-core-scheduling.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename*0="0001-xen-sched-fix-cpu-offlining-with-core-scheduling.patch"

From 5c2fb98c470102e4828e88080e64f8040c360d7c Mon Sep 17 00:00:00 2001
From: Juergen Gross <jgross@suse.com>
Date: Mon, 2 Mar 2020 09:16:13 +0100
Subject: [PATCH] xen/sched: fix cpu offlining with core scheduling

Offlining a cpu with core scheduling active can result in a hanging
system. Reason is the scheduling resource and unit of the to be removed
cpus needs to be split in order to remove the cpu from its cpupool and
move it to the idle scheduler. In case one of the involved cpus happens
to have received a sched slave event due to a vcpu former having been
running on that cpu being woken up again, it can happen that this cpu
will enter sched_wait_rendezvous_in() while its scheduling resource is
just about to be split. It might wait for ever for the other sibling
to join, which will never happen due to the resources already being
modified.

This can easily be avoided by:
- resetting the rendezvous counters of the idle unit which is kept
- checking for a new scheduling resource in sched_wait_rendezvous_in()
  after reacquiring the scheduling lock and resetting the counters in
  that case without scheduling another vcpu

Reported-by: Igor Druzhinin <igor.druzhinin@citrix.com>
Signed-off-by: Juergen Gross <jgross@suse.com>
---
 xen/common/sched/core.c | 27 +++++++++++++++++++++++++--
 1 file changed, 25 insertions(+), 2 deletions(-)

diff --git a/xen/common/sched/core.c b/xen/common/sched/core.c
index 7e8e7d2c39..11a9589945 100644
--- a/xen/common/sched/core.c
+++ b/xen/common/sched/core.c
@@ -2415,7 +2415,8 @@ static struct sched_unit *sched_wait_rendezvous_in(struct sched_unit *prev,
 {
     struct sched_unit *next;
     struct vcpu *v;
-    unsigned int gran = get_sched_res(cpu)->granularity;
+    struct sched_resource *sr = get_sched_res(cpu);
+    unsigned int gran = sr->granularity;
 
     if ( !--prev->rendezvous_in_cnt )
     {
@@ -2482,6 +2483,19 @@ static struct sched_unit *sched_wait_rendezvous_in(struct sched_unit *prev,
             atomic_set(&prev->next_task->rendezvous_out_cnt, 0);
             prev->rendezvous_in_cnt = 0;
         }
+
+        /*
+         * Check for scheduling resourced switched. This happens when we are
+         * moved away from our cpupool and cpus are subject of the idle
+         * scheduler now.
+         */
+        if ( unlikely(sr != get_sched_res(cpu)) )
+        {
+            ASSERT(is_idle_unit(prev));
+            atomic_set(&prev->next_task->rendezvous_out_cnt, 0);
+            prev->rendezvous_in_cnt = 0;
+            return NULL;
+        }
     }
 
     return prev->next_task;
@@ -2538,7 +2552,10 @@ static void sched_slave(void)
 
     next = sched_wait_rendezvous_in(prev, &lock, cpu, now);
     if ( !next )
+    {
+        rcu_read_unlock(&sched_res_rculock);
         return;
+    }
 
     pcpu_schedule_unlock_irq(lock, cpu);
 
@@ -2599,7 +2616,10 @@ static void schedule(void)
         cpumask_raise_softirq(mask, SCHED_SLAVE_SOFTIRQ);
         next = sched_wait_rendezvous_in(prev, &lock, cpu, now);
         if ( !next )
+        {
+            rcu_read_unlock(&sched_res_rculock);
             return;
+        }
     }
     else
     {
@@ -3151,7 +3171,10 @@ int schedule_cpu_rm(unsigned int cpu)
         per_cpu(sched_res_idx, cpu_iter) = 0;
         if ( cpu_iter == cpu )
         {
-            idle_vcpu[cpu_iter]->sched_unit->priv = NULL;
+            unit = idle_vcpu[cpu_iter]->sched_unit;
+            unit->priv = NULL;
+            atomic_set(&unit->next_task->rendezvous_out_cnt, 0);
+            unit->rendezvous_in_cnt = 0;
         }
         else
         {
-- 
2.16.4


--------------5C14BC05B94B158AEE5C282A
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--------------5C14BC05B94B158AEE5C282A--

