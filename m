Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B3BF815417A
	for <lists+xen-devel@lfdr.de>; Thu,  6 Feb 2020 11:00:16 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1izdv3-0000T9-UH; Thu, 06 Feb 2020 09:57:57 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=TqwH=32=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1izdv2-0000T4-Gu
 for xen-devel@lists.xen.org; Thu, 06 Feb 2020 09:57:56 +0000
X-Inumbo-ID: 24e1f706-48c7-11ea-af1e-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 24e1f706-48c7-11ea-af1e-12813bfff9fa;
 Thu, 06 Feb 2020 09:57:54 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id C8E4BAE79;
 Thu,  6 Feb 2020 09:57:53 +0000 (UTC)
To: Sergey Dyasli <sergey.dyasli@citrix.com>,
 Xen-devel <xen-devel@lists.xen.org>
References: <6722f058-61eb-30c9-f97d-def690ccd7b8@citrix.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <6a3aa771-927b-b3bd-dd05-1eea90b0a97f@suse.com>
Date: Thu, 6 Feb 2020 10:57:51 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.1
MIME-Version: 1.0
In-Reply-To: <6722f058-61eb-30c9-f97d-def690ccd7b8@citrix.com>
Content-Type: multipart/mixed; boundary="------------83939FB25A808964802FAFC7"
Content-Language: en-US
Subject: Re: [Xen-devel] Live-Patch application failure in core-scheduling
 mode
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
Cc: Ross Lagerwall <ross.lagerwall@citrix.com>,
 George Dunlap <George.Dunlap@citrix.com>, Jan Beulich <JBeulich@suse.com>,
 Dario Faggioli <dfaggioli@suse.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

This is a multi-part message in MIME format.
--------------83939FB25A808964802FAFC7
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

On 05.02.20 17:03, Sergey Dyasli wrote:
> Hello,
> 
> I'm currently investigating a Live-Patch application failure in core-
> scheduling mode and this is an example of what I usually get:
> (it's easily reproducible)
> 
>      (XEN) [  342.528305] livepatch: lp: CPU8 - IPIing the other 15 CPUs
>      (XEN) [  342.558340] livepatch: lp: Timed out on semaphore in CPU quiesce phase 13/15
>      (XEN) [  342.558343] bad cpus: 6 9
> 
>      (XEN) [  342.559293] CPU:    6
>      (XEN) [  342.559562] Xen call trace:
>      (XEN) [  342.559565]    [<ffff82d08023f304>] R common/schedule.c#sched_wait_rendezvous_in+0xa4/0x270
>      (XEN) [  342.559568]    [<ffff82d08023f8aa>] F common/schedule.c#schedule+0x17a/0x260
>      (XEN) [  342.559571]    [<ffff82d080240d5a>] F common/softirq.c#__do_softirq+0x5a/0x90
>      (XEN) [  342.559574]    [<ffff82d080278ec5>] F arch/x86/domain.c#guest_idle_loop+0x35/0x60
> 
>      (XEN) [  342.559761] CPU:    9
>      (XEN) [  342.560026] Xen call trace:
>      (XEN) [  342.560029]    [<ffff82d080241661>] R _spin_lock_irq+0x11/0x40
>      (XEN) [  342.560032]    [<ffff82d08023f323>] F common/schedule.c#sched_wait_rendezvous_in+0xc3/0x270
>      (XEN) [  342.560036]    [<ffff82d08023f8aa>] F common/schedule.c#schedule+0x17a/0x260
>      (XEN) [  342.560039]    [<ffff82d080240d5a>] F common/softirq.c#__do_softirq+0x5a/0x90
>      (XEN) [  342.560042]    [<ffff82d080279db5>] F arch/x86/domain.c#idle_loop+0x55/0xb0
> 
> The first HT sibling is waiting for the second in the LP-application
> context while the second waits for the first in the scheduler context.
> 
> Any suggestions on how to improve this situation are welcome.

Can you test the attached patch, please? It is only tested to boot, so
I did no livepatch tests with it.


Juergen

--------------83939FB25A808964802FAFC7
Content-Type: text/x-patch; charset=UTF-8;
 name="0001-xen-do-live-patching-only-from-main-idle-loop.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="0001-xen-do-live-patching-only-from-main-idle-loop.patch"

From c458aa88bf17b3ac885926de5204d8a23a2ca82d Mon Sep 17 00:00:00 2001
From: Juergen Gross <jgross@suse.com>
Date: Thu, 6 Feb 2020 08:18:06 +0100
Subject: [PATCH] xen: do live patching only from main idle loop

One of the main design goals of core scheduling is to avoid actions
which are not directly related to the domain currently running on a
given cpu or core. Live patching is one of those actions which are
allowed taking place on a cpu only when the the idle scheduling unit is
active on that cpu.

Unfortunately live patching tries to force the cpus into the idle loop
just by raising the schedule softirq, which will no longer be
guaranteed to work with core scheduling active. Additionally there are
still some places in the hypervisor calling check_for_livepatch_work()
without being in the idle loop.

It is easy to force a cpu into the main idle loop by scheduling a
tasklet on it. So switch live patching to use tasklets for switching to
idle and raising scheduling events. Additionally the calls of
check_for_livepatch_work() outside the main idle loop can be dropped.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 xen/arch/arm/domain.c       |  9 ++++-----
 xen/arch/arm/traps.c        |  6 ------
 xen/arch/x86/domain.c       |  9 ++++-----
 xen/arch/x86/hvm/svm/svm.c  |  2 +-
 xen/arch/x86/hvm/vmx/vmcs.c |  2 +-
 xen/arch/x86/pv/domain.c    |  2 +-
 xen/arch/x86/setup.c        |  2 +-
 xen/common/livepatch.c      | 39 ++++++++++++++++++++++++++++++++++-----
 8 files changed, 46 insertions(+), 25 deletions(-)

diff --git a/xen/arch/arm/domain.c b/xen/arch/arm/domain.c
index aa3df3b3ba..6627be2922 100644
--- a/xen/arch/arm/domain.c
+++ b/xen/arch/arm/domain.c
@@ -72,7 +72,11 @@ void idle_loop(void)
 
         /* Are we here for running vcpu context tasklets, or for idling? */
         if ( unlikely(tasklet_work_to_do(cpu)) )
+        {
             do_tasklet();
+            /* Livepatch work is always kicked off via a tasklet. */
+            check_for_livepatch_work();
+        }
         /*
          * Test softirqs twice --- first to see if should even try scrubbing
          * and then, after it is done, whether softirqs became pending
@@ -83,11 +87,6 @@ void idle_loop(void)
             do_idle();
 
         do_softirq();
-        /*
-         * We MUST be last (or before dsb, wfi). Otherwise after we get the
-         * softirq we would execute dsb,wfi (and sleep) and not patch.
-         */
-        check_for_livepatch_work();
     }
 }
 
diff --git a/xen/arch/arm/traps.c b/xen/arch/arm/traps.c
index 6f9bec22d3..30c4c1830b 100644
--- a/xen/arch/arm/traps.c
+++ b/xen/arch/arm/traps.c
@@ -23,7 +23,6 @@
 #include <xen/iocap.h>
 #include <xen/irq.h>
 #include <xen/lib.h>
-#include <xen/livepatch.h>
 #include <xen/mem_access.h>
 #include <xen/mm.h>
 #include <xen/param.h>
@@ -2239,11 +2238,6 @@ static void check_for_pcpu_work(void)
     {
         local_irq_enable();
         do_softirq();
-        /*
-         * Must be the last one - as the IPI will trigger us to come here
-         * and we want to patch the hypervisor with almost no stack.
-         */
-        check_for_livepatch_work();
         local_irq_disable();
     }
 }
diff --git a/xen/arch/x86/domain.c b/xen/arch/x86/domain.c
index f53ae5ff86..2bc7c4fb2d 100644
--- a/xen/arch/x86/domain.c
+++ b/xen/arch/x86/domain.c
@@ -141,7 +141,11 @@ static void idle_loop(void)
 
         /* Are we here for running vcpu context tasklets, or for idling? */
         if ( unlikely(tasklet_work_to_do(cpu)) )
+        {
             do_tasklet();
+            /* Livepatch work is always kicked off via a tasklet. */
+            check_for_livepatch_work();
+        }
         /*
          * Test softirqs twice --- first to see if should even try scrubbing
          * and then, after it is done, whether softirqs became pending
@@ -151,11 +155,6 @@ static void idle_loop(void)
                     !softirq_pending(cpu) )
             pm_idle();
         do_softirq();
-        /*
-         * We MUST be last (or before pm_idle). Otherwise after we get the
-         * softirq we would execute pm_idle (and sleep) and not patch.
-         */
-        check_for_livepatch_work();
     }
 }
 
diff --git a/xen/arch/x86/hvm/svm/svm.c b/xen/arch/x86/hvm/svm/svm.c
index b7f67f9f03..32d8d847f2 100644
--- a/xen/arch/x86/hvm/svm/svm.c
+++ b/xen/arch/x86/hvm/svm/svm.c
@@ -1032,7 +1032,7 @@ static void noreturn svm_do_resume(struct vcpu *v)
 
     hvm_do_resume(v);
 
-    reset_stack_and_jump(svm_asm_do_resume);
+    reset_stack_and_jump_nolp(svm_asm_do_resume);
 }
 
 void svm_vmenter_helper(const struct cpu_user_regs *regs)
diff --git a/xen/arch/x86/hvm/vmx/vmcs.c b/xen/arch/x86/hvm/vmx/vmcs.c
index 65445afeb0..4c23645454 100644
--- a/xen/arch/x86/hvm/vmx/vmcs.c
+++ b/xen/arch/x86/hvm/vmx/vmcs.c
@@ -1890,7 +1890,7 @@ void vmx_do_resume(struct vcpu *v)
     if ( host_cr4 != read_cr4() )
         __vmwrite(HOST_CR4, read_cr4());
 
-    reset_stack_and_jump(vmx_asm_do_vmentry);
+    reset_stack_and_jump_nolp(vmx_asm_do_vmentry);
 }
 
 static inline unsigned long vmr(unsigned long field)
diff --git a/xen/arch/x86/pv/domain.c b/xen/arch/x86/pv/domain.c
index c3473b9a47..7dbd8dbfa2 100644
--- a/xen/arch/x86/pv/domain.c
+++ b/xen/arch/x86/pv/domain.c
@@ -62,7 +62,7 @@ custom_runtime_param("pcid", parse_pcid);
 static void noreturn continue_nonidle_domain(struct vcpu *v)
 {
     check_wakeup_from_wait();
-    reset_stack_and_jump(ret_from_intr);
+    reset_stack_and_jump_nolp(ret_from_intr);
 }
 
 static int setup_compat_l4(struct vcpu *v)
diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
index e50e1f86b3..3bed0a9492 100644
--- a/xen/arch/x86/setup.c
+++ b/xen/arch/x86/setup.c
@@ -632,7 +632,7 @@ static void __init noreturn reinit_bsp_stack(void)
     stack_base[0] = stack;
     memguard_guard_stack(stack);
 
-    reset_stack_and_jump(init_done);
+    reset_stack_and_jump_nolp(init_done);
 }
 
 /*
diff --git a/xen/common/livepatch.c b/xen/common/livepatch.c
index 5e09dc990b..861a227dbd 100644
--- a/xen/common/livepatch.c
+++ b/xen/common/livepatch.c
@@ -17,6 +17,7 @@
 #include <xen/spinlock.h>
 #include <xen/string.h>
 #include <xen/symbols.h>
+#include <xen/tasklet.h>
 #include <xen/version.h>
 #include <xen/virtual_region.h>
 #include <xen/vmap.h>
@@ -69,6 +70,7 @@ static struct livepatch_work livepatch_work;
  * Having an per-cpu lessens the load.
  */
 static DEFINE_PER_CPU(bool_t, work_to_do);
+static DEFINE_PER_CPU(struct tasklet, livepatch_tasklet);
 
 static int get_name(const struct xen_livepatch_name *name, char *n)
 {
@@ -1582,17 +1584,16 @@ static int schedule_work(struct payload *data, uint32_t cmd, uint32_t timeout)
     smp_wmb();
 
     livepatch_work.do_work = 1;
-    this_cpu(work_to_do) = 1;
+    tasklet_schedule_on_cpu(&this_cpu(livepatch_tasklet), smp_processor_id());
 
     put_cpu_maps();
 
     return 0;
 }
 
-static void reschedule_fn(void *unused)
+static void tasklet_fn(void *unused)
 {
     this_cpu(work_to_do) = 1;
-    raise_softirq(SCHEDULE_SOFTIRQ);
 }
 
 static int livepatch_spin(atomic_t *counter, s_time_t timeout,
@@ -1652,7 +1653,7 @@ void check_for_livepatch_work(void)
     if ( atomic_inc_and_test(&livepatch_work.semaphore) )
     {
         struct payload *p;
-        unsigned int cpus;
+        unsigned int cpus, i;
         bool action_done = false;
 
         p = livepatch_work.data;
@@ -1682,7 +1683,9 @@ void check_for_livepatch_work(void)
         {
             dprintk(XENLOG_DEBUG, LIVEPATCH "%s: CPU%u - IPIing the other %u CPUs\n",
                     p->name, cpu, cpus);
-            smp_call_function(reschedule_fn, NULL, 0);
+            for_each_online_cpu ( i )
+                if ( i != cpu )
+                    tasklet_schedule_on_cpu(&per_cpu(livepatch_tasklet, i), i);
         }
 
         timeout = livepatch_work.timeout + NOW();
@@ -2116,8 +2119,34 @@ static void livepatch_printall(unsigned char key)
     spin_unlock(&payload_lock);
 }
 
+static int cpu_callback(
+    struct notifier_block *nfb, unsigned long action, void *hcpu)
+{
+    unsigned int cpu = (unsigned long)hcpu;
+
+    if ( action == CPU_UP_PREPARE )
+        tasklet_init(&per_cpu(livepatch_tasklet, cpu), tasklet_fn, NULL);
+
+    return NOTIFY_DONE;
+}
+
+static struct notifier_block cpu_nfb = {
+    .notifier_call = cpu_callback
+};
+
 static int __init livepatch_init(void)
 {
+    unsigned int cpu;
+
+    for_each_online_cpu ( cpu )
+    {
+        void *hcpu = (void *)(long)cpu;
+
+        cpu_callback(&cpu_nfb, CPU_UP_PREPARE, hcpu);
+    }
+
+    register_cpu_notifier(&cpu_nfb);
+
     register_keyhandler('x', livepatch_printall, "print livepatch info", 1);
 
     arch_livepatch_init();
-- 
2.16.4


--------------83939FB25A808964802FAFC7
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--------------83939FB25A808964802FAFC7--

