Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8409731B58C
	for <lists+xen-devel@lfdr.de>; Mon, 15 Feb 2021 08:15:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.85064.159461 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lBY6I-0007Nz-UO; Mon, 15 Feb 2021 07:15:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 85064.159461; Mon, 15 Feb 2021 07:15:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lBY6I-0007Na-RI; Mon, 15 Feb 2021 07:15:18 +0000
Received: by outflank-mailman (input) for mailman id 85064;
 Mon, 15 Feb 2021 07:15:17 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Dghk=HR=codiax.se=anders.tornqvist@srs-us1.protection.inumbo.net>)
 id 1lBY6H-0007NU-2T
 for xen-devel@lists.xenproject.org; Mon, 15 Feb 2021 07:15:17 +0000
Received: from mailrelay3-3.pub.mailoutpod1-cph3.one.com (unknown
 [46.30.212.12]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 152e3318-9f6c-4f40-929c-121d5dce0464;
 Mon, 15 Feb 2021 07:15:13 +0000 (UTC)
Received: from [192.168.101.129] (h87-96-135-119.cust.a3fiber.se
 [87.96.135.119])
 by mailrelay3.pub.mailoutpod1-cph3.one.com (Halon) with ESMTPSA
 id 89951097-6f5d-11eb-8cc9-d0431ea8bb03;
 Mon, 15 Feb 2021 07:15:10 +0000 (UTC)
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
X-Inumbo-ID: 152e3318-9f6c-4f40-929c-121d5dce0464
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codiax.se; s=20191106;
	h=content-type:in-reply-to:mime-version:date:message-id:from:references:to:
	 subject:from;
	bh=GGrVJ0O+qbn+K0rIfUk9Hcbob+z2GH9MAHfGbQW0rMY=;
	b=dwzy3ejpx86V16s1/UQiLJPrB4nW5mQfMnYRWHhSoYWaozgZrpXoZDpVYMd/FDchIywtm/prge94q
	 UWxgM9Az7jRfy/19NRoV9BFQdaBoToWlRrK5DG6mIfcD3OUmF7XyOX/s885Pw5FTM7ukXK2xz2CmBp
	 m3ZQKYM1L5XZDDcXfk7ukmxYRG7nyM/BWNY1ciW8NumymhKMAuzIroumWZaH/8SkZA5egEXelWKdia
	 ST4TS5hIJXo5F3Y5ubjSWccj24mm18faKsAEZHdhvr/tT/EOxHIYE0SqkT9+1O2Y4LagYwAfTFwFuj
	 fmvACp6OyRiQks/iwa4TGgYlDFRKgpw==
X-HalOne-Cookie: 3116c411e6e7ae0bba8e5eaf972acbfd10e0b169
X-HalOne-ID: 89951097-6f5d-11eb-8cc9-d0431ea8bb03
Subject: Re: Null scheduler and vwfi native problem
To: Dario Faggioli <dfaggioli@suse.com>, Julien Grall <julien@xen.org>,
 xen-devel@lists.xenproject.org, Stefano Stabellini <sstabellini@kernel.org>
References: <fe3dd9f0-b035-01fe-3e01-ddf065f182ab@codiax.se>
 <207305e4e2998614767fdcc5ad83ced6de982820.camel@suse.com>
 <e85548f4-e03b-4717-3495-9ed472ed03c9@xen.org>
 <e18ba69efd0d12fc489144024305fd3c6102c330.camel@suse.com>
 <e37fe8a9-c633-3572-e273-2fd03b35b791@codiax.se>
 <744ddde6-a228-82fc-76b9-401926d7963b@xen.org>
 <d92c4191fb81e6d1de636f281c8624d68f8d14fc.camel@suse.com>
 <c9a4e132-5bca-aa76-ab8b-bfeee1cd5a9e@codiax.se>
 <f52baf12308d71b96d0d9be1c7c382a3c5efafbc.camel@suse.com>
 <18ef4619-19ae-90d2-459c-9b5282b49176@codiax.se>
 <a9d80e262760f6692f7086c9b6a0622caf19e795.camel@suse.com>
From: =?UTF-8?Q?Anders_T=c3=b6rnqvist?= <anders.tornqvist@codiax.se>
Message-ID: <1d86afab-691e-e362-627f-8524cb0494c2@codiax.se>
Date: Mon, 15 Feb 2021 08:15:09 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <a9d80e262760f6692f7086c9b6a0622caf19e795.camel@suse.com>
Content-Type: multipart/mixed;
 boundary="------------8DCEB5763D2D09BD74FF88B6"
Content-Language: en-GB

This is a multi-part message in MIME format.
--------------8DCEB5763D2D09BD74FF88B6
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

On 1/30/21 6:59 PM, Dario Faggioli wrote:
> On Fri, 2021-01-29 at 09:08 +0100, Anders Törnqvist wrote:
>> On 1/26/21 11:31 PM, Dario Faggioli wrote:
>>> Thanks again for letting us see these logs.
>> Thanks for the attention to this :-)
>>
>> Any ideas for how to solve it?
>>
> So, you're up for testing patches, right?
>
> How about applying these two, and letting me know what happens? :-D

Great work guys!

Hi. Now I got the time to test the patches.

They was not possible to apply without fail on the code version I am 
using which is commit b64b8df622963accf85b227e468fe12b2d56c128 from 
https://source.codeaurora.org/external/imx/imx-xen.

I did some editing to get them into my code. I think I should have 
removed some sched_tick_suspend/sched_tick_resume calls also.
See the attached patches for what I have applied on the code.

Anyway, after applying the patches including the original 
rcu-quiesc-patch.patch the destroy of the domu seems to work.
I have rebooted, only destroyed-created and used Xen watchdog to reboot 
the domu in total about 20 times and so far it has nicely destroyed and 
the been able to start a new instance of the domu.

So it looks promising although my edited patches probably need some fixing.


>
> They are on top of current staging. I can try to rebase on something
> else, if it's easier for you to test.
>
> Besides being attached, they're also available here:
>
> https://gitlab.com/xen-project/people/dfaggioli/xen/-/tree/rcu-quiet-fix
>
> I could not test them properly on ARM, as I don't have an ARM system
> handy, so everything is possible really... just let me know.
>
> It should at least build fine, AFAICT from here:
>
> https://gitlab.com/xen-project/people/dfaggioli/xen/-/pipelines/249101213
>
> Julien, back in:
>
>   https://lore.kernel.org/xen-devel/315740e1-3591-0e11-923a-718e06c36445@arm.com/
>
>
> you said I should hook in enter_hypervisor_head(),
> leave_hypervisor_tail(). Those functions are gone now and looking at
> how the code changed, this is where I figured I should put the calls
> (see the second patch). But feel free to educate me otherwise.
>
> For x86 people that are listening... Do we have, in our beloved arch,
> equally handy places (i.e., right before leaving Xen for a guest and
> right after entering Xen from one), preferrably in a C file, and for
> all guests... like it seems to be the case on ARM?
>
> Regards



--------------8DCEB5763D2D09BD74FF88B6
Content-Type: text/x-patch; charset=UTF-8;
 name="1_1-xen-rcu-rename-idle-ignore.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="1_1-xen-rcu-rename-idle-ignore.patch"

diff --git a/xen/common/rcupdate.c b/xen/common/rcupdate.c
index d6dc4b48db..42ab9dbbd6 100644
--- a/xen/common/rcupdate.c
+++ b/xen/common/rcupdate.c
@@ -52,8 +52,8 @@ static struct rcu_ctrlblk {
     int  next_pending;  /* Is the next batch already waiting?         */
 
     spinlock_t  lock __cacheline_aligned;
-    cpumask_t   cpumask; /* CPUs that need to switch in order ... */
-    cpumask_t   idle_cpumask; /* ... unless they are already idle */
+    cpumask_t   cpumask; /* CPUs that need to switch in order ...   */
+    cpumask_t   ignore_cpumask; /* ... unless they are already idle */
     /* for current batch to proceed.        */
 } __cacheline_aligned rcu_ctrlblk = {
     .cur = -300,
@@ -86,8 +86,8 @@ struct rcu_data {
     long            last_rs_qlen;     /* qlen during the last resched */
 
     /* 3) idle CPUs handling */
-    struct timer idle_timer;
-    bool idle_timer_active;
+    struct timer cb_timer;
+    bool cb_timer_active;
 };
 
 /*
@@ -116,22 +116,22 @@ struct rcu_data {
  * CPU that is going idle. The user can change this, via a boot time
  * parameter, but only up to 100ms.
  */
-#define IDLE_TIMER_PERIOD_MAX     MILLISECS(100)
-#define IDLE_TIMER_PERIOD_DEFAULT MILLISECS(10)
-#define IDLE_TIMER_PERIOD_MIN     MICROSECS(100)
+#define CB_TIMER_PERIOD_MAX     MILLISECS(100)
+#define CB_TIMER_PERIOD_DEFAULT MILLISECS(10)
+#define CB_TIMER_PERIOD_MIN     MICROSECS(100)
 
-static s_time_t __read_mostly idle_timer_period;
+static s_time_t __read_mostly cb_timer_period;
 
 /*
- * Increment and decrement values for the idle timer handler. The algorithm
+ * Increment and decrement values for the callback timer handler. The algorithm
  * works as follows:
  * - if the timer actually fires, and it finds out that the grace period isn't
- *   over yet, we add IDLE_TIMER_PERIOD_INCR to the timer's period;
+ *   over yet, we add CB_TIMER_PERIOD_INCR to the timer's period;
  * - if the timer actually fires and it finds the grace period over, we
  *   subtract IDLE_TIMER_PERIOD_DECR from the timer's period.
  */
-#define IDLE_TIMER_PERIOD_INCR    MILLISECS(10)
-#define IDLE_TIMER_PERIOD_DECR    MICROSECS(100)
+#define CB_TIMER_PERIOD_INCR    MILLISECS(10)
+#define CB_TIMER_PERIOD_DECR    MICROSECS(100)
 
 static DEFINE_PER_CPU(struct rcu_data, rcu_data);
 
@@ -309,7 +309,7 @@ static void rcu_start_batch(struct rcu_ctrlblk *rcp)
         * This barrier is paired with the one in rcu_idle_enter().
         */
         smp_mb();
-        cpumask_andnot(&rcp->cpumask, &cpu_online_map, &rcp->idle_cpumask);
+        cpumask_andnot(&rcp->cpumask, &cpu_online_map, &rcp->ignore_cpumask);
     }
 }
 
@@ -455,7 +455,7 @@ int rcu_needs_cpu(int cpu)
 {
     struct rcu_data *rdp = &per_cpu(rcu_data, cpu);
 
-    return (rdp->curlist && !rdp->idle_timer_active) || rcu_pending(cpu);
+    return (rdp->curlist && !rdp->cb_timer_active) || rcu_pending(cpu);
 }
 
 /*
@@ -463,7 +463,7 @@ int rcu_needs_cpu(int cpu)
  * periodically poke rcu_pedning(), so that it will invoke the callback
  * not too late after the end of the grace period.
  */
-void rcu_idle_timer_start()
+static void cb_timer_start(void)
 {
     struct rcu_data *rdp = &this_cpu(rcu_data);
 
@@ -475,48 +475,48 @@ void rcu_idle_timer_start()
     if (likely(!rdp->curlist))
         return;
 
-    set_timer(&rdp->idle_timer, NOW() + idle_timer_period);
-    rdp->idle_timer_active = true;
+    set_timer(&rdp->cb_timer, NOW() + cb_timer_period);
+    rdp->cb_timer_active = true;
 }
 
-void rcu_idle_timer_stop()
+static void cb_timer_stop(void)
 {
     struct rcu_data *rdp = &this_cpu(rcu_data);
 
-    if (likely(!rdp->idle_timer_active))
+    if (likely(!rdp->cb_timer_active))
         return;
 
-    rdp->idle_timer_active = false;
+    rdp->cb_timer_active = false;
 
     /*
      * In general, as the CPU is becoming active again, we don't need the
-     * idle timer, and so we want to stop it.
+     * callback timer, and so we want to stop it.
      *
-     * However, in case we are here because idle_timer has (just) fired and
+     * However, in case we are here because cb_timer has (just) fired and
      * has woken up the CPU, we skip stop_timer() now. In fact, when a CPU
      * wakes up from idle, this code always runs before do_softirq() has the
      * chance to check and deal with TIMER_SOFTIRQ. And if we stop the timer
      * now, the TIMER_SOFTIRQ handler will see it as inactive, and will not
-     * call rcu_idle_timer_handler().
+     * call cb_timer_handler().
      *
      * Therefore, if we see that the timer is expired already, we leave it
      * alone. The TIMER_SOFTIRQ handler will then run the timer routine, and
      * deactivate it.
      */
-    if ( !timer_is_expired(&rdp->idle_timer) )
-        stop_timer(&rdp->idle_timer);
+    if ( !timer_is_expired(&rdp->cb_timer) )
+        stop_timer(&rdp->cb_timer);
 }
 
-static void rcu_idle_timer_handler(void* data)
+static void cb_timer_handler(void* data)
 {
-    perfc_incr(rcu_idle_timer);
+    perfc_incr(rcu_callback_timer);
 
     if ( !cpumask_empty(&rcu_ctrlblk.cpumask) )
-        idle_timer_period = min(idle_timer_period + IDLE_TIMER_PERIOD_INCR,
-                                IDLE_TIMER_PERIOD_MAX);
+        cb_timer_period = min(cb_timer_period + CB_TIMER_PERIOD_INCR,
+                                CB_TIMER_PERIOD_MAX);
     else
-        idle_timer_period = max(idle_timer_period - IDLE_TIMER_PERIOD_DECR,
-                                IDLE_TIMER_PERIOD_MIN);
+        cb_timer_period = max(cb_timer_period - CB_TIMER_PERIOD_DECR,
+                                CB_TIMER_PERIOD_MIN);
 }
 
 void rcu_check_callbacks(int cpu)
@@ -537,7 +537,7 @@ static void rcu_move_batch(struct rcu_data *this_rdp, struct rcu_head *list,
 static void rcu_offline_cpu(struct rcu_data *this_rdp,
                             struct rcu_ctrlblk *rcp, struct rcu_data *rdp)
 {
-    kill_timer(&rdp->idle_timer);
+    kill_timer(&rdp->cb_timer);
 
     /* If the cpu going offline owns the grace period we can block
      * indefinitely waiting for it, so flush it here.
@@ -567,7 +567,7 @@ static void rcu_init_percpu_data(int cpu, struct rcu_ctrlblk *rcp,
     rdp->qs_pending = 0;
     rdp->cpu = cpu;
     rdp->blimit = blimit;
-    init_timer(&rdp->idle_timer, rcu_idle_timer_handler, rdp, cpu);
+    init_timer(&rdp->cb_timer, cb_timer_handler, rdp, cpu);
 }
 
 static int cpu_callback(
@@ -596,25 +596,39 @@ static struct notifier_block cpu_nfb = {
     .notifier_call = cpu_callback
 };
 
+/*
+ * We're changing the name of the parameter, to better reflect the fact that
+ * the timer is used for callbacks in general, when the CPU is either idle
+ * or executing guest code. We still accept the old parameter but, if both
+ * are specified, the new one ("rcu-callback-timer-period-ms") has priority.
+ */
+#define CB_TIMER_PERIOD_DEFAULT_MS ( CB_TIMER_PERIOD_DEFAULT / MILLISECS(1) )
+static unsigned int __initdata cb_timer_period_ms = CB_TIMER_PERIOD_DEFAULT_MS;
+integer_param("rcu-callback-timer-period-ms", cb_timer_period_ms);
+
+static unsigned int __initdata idle_timer_period_ms = CB_TIMER_PERIOD_DEFAULT_MS;
+integer_param("rcu-idle-timer-period-ms", idle_timer_period_ms);
+
 void __init rcu_init(void)
 {
     void *cpu = (void *)(long)smp_processor_id();
-    static unsigned int __initdata idle_timer_period_ms =
-                                    IDLE_TIMER_PERIOD_DEFAULT / MILLISECS(1);
-    integer_param("rcu-idle-timer-period-ms", idle_timer_period_ms);
+
+    if (idle_timer_period_ms != CB_TIMER_PERIOD_DEFAULT_MS &&
+        cb_timer_period_ms == CB_TIMER_PERIOD_DEFAULT_MS)
+        cb_timer_period_ms = idle_timer_period_ms;
 
     /* We don't allow 0, or anything higher than IDLE_TIMER_PERIOD_MAX */
-    if ( idle_timer_period_ms == 0 ||
-         idle_timer_period_ms > IDLE_TIMER_PERIOD_MAX / MILLISECS(1) )
+    if ( cb_timer_period_ms == 0 ||
+         cb_timer_period_ms > CB_TIMER_PERIOD_MAX / MILLISECS(1) )
     {
-        idle_timer_period_ms = IDLE_TIMER_PERIOD_DEFAULT / MILLISECS(1);
-        printk("WARNING: rcu-idle-timer-period-ms outside of "
+        cb_timer_period_ms = CB_TIMER_PERIOD_DEFAULT / MILLISECS(1);
+        printk("WARNING: rcu-callback-timer-period-ms outside of "
                "(0,%"PRI_stime"]. Resetting it to %u.\n",
-               IDLE_TIMER_PERIOD_MAX / MILLISECS(1), idle_timer_period_ms);
+               CB_TIMER_PERIOD_MAX / MILLISECS(1), cb_timer_period_ms);
     }
-    idle_timer_period = MILLISECS(idle_timer_period_ms);
+    cb_timer_period = MILLISECS(cb_timer_period_ms);
 
-    cpumask_clear(&rcu_ctrlblk.idle_cpumask);
+    cpumask_clear(&rcu_ctrlblk.ignore_cpumask);
     cpu_callback(&cpu_nfb, CPU_UP_PREPARE, cpu);
     register_cpu_notifier(&cpu_nfb);
     open_softirq(RCU_SOFTIRQ, rcu_process_callbacks);
@@ -626,8 +640,8 @@ void __init rcu_init(void)
  */
 void rcu_idle_enter(unsigned int cpu)
 {
-    ASSERT(!cpumask_test_cpu(cpu, &rcu_ctrlblk.idle_cpumask));
-    cpumask_set_cpu(cpu, &rcu_ctrlblk.idle_cpumask);
+    ASSERT(!cpumask_test_cpu(cpu, &rcu_ctrlblk.ignore_cpumask));
+    cpumask_set_cpu(cpu, &rcu_ctrlblk.ignore_cpumask);
     /*
      * If some other CPU is starting a new grace period, we'll notice that
      * by seeing a new value in rcp->cur (different than our quiescbatch).
@@ -637,10 +651,12 @@ void rcu_idle_enter(unsigned int cpu)
      * Se the comment before cpumask_andnot() in  rcu_start_batch().
      */
     smp_mb();
+    cb_timer_start();
 }
 
 void rcu_idle_exit(unsigned int cpu)
 {
-    ASSERT(cpumask_test_cpu(cpu, &rcu_ctrlblk.idle_cpumask));
-    cpumask_clear_cpu(cpu, &rcu_ctrlblk.idle_cpumask);
+    cb_timer_stop();
+    ASSERT(cpumask_test_cpu(cpu, &rcu_ctrlblk.ignore_cpumask));
+    cpumask_clear_cpu(cpu, &rcu_ctrlblk.ignore_cpumask);
 }
diff --git a/xen/include/xen/perfc_defn.h b/xen/include/xen/perfc_defn.h
index 08b182ccd9..d142534383 100644
--- a/xen/include/xen/perfc_defn.h
+++ b/xen/include/xen/perfc_defn.h
@@ -12,7 +12,7 @@ PERFCOUNTER(calls_from_multicall,       "calls from multicall")
 PERFCOUNTER(irqs,                   "#interrupts")
 PERFCOUNTER(ipis,                   "#IPIs")
 
-PERFCOUNTER(rcu_idle_timer,         "RCU: idle_timer")
+PERFCOUNTER(rcu_callback_timer,     "RCU: callback_timer")
 
 /* Generic scheduler counters (applicable to all schedulers) */
 PERFCOUNTER(sched_irq,              "sched: timer")

--------------8DCEB5763D2D09BD74FF88B6
Content-Type: text/x-patch; charset=UTF-8;
 name="2_1-rcu-idle-guest.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="2_1-rcu-idle-guest.patch"

diff --git a/xen/arch/arm/domain.c b/xen/arch/arm/domain.c
index a9ca09acb2..e4439b2397 100644
--- a/xen/arch/arm/domain.c
+++ b/xen/arch/arm/domain.c
@@ -46,6 +46,8 @@ static void do_idle(void)
 {
     unsigned int cpu = smp_processor_id();
 
+    rcu_quiet_enter();
+
     sched_tick_suspend();
     /* sched_tick_suspend() can raise TIMER_SOFTIRQ. Process it now. */
     process_pending_softirqs();
@@ -59,6 +61,8 @@ static void do_idle(void)
     local_irq_enable();
 
     sched_tick_resume();
+
+    rcu_quiet_exit();
 }
 
 void idle_loop(void)
diff --git a/xen/arch/arm/traps.c b/xen/arch/arm/traps.c
index 1d2b762e22..5158a03746 100644
--- a/xen/arch/arm/traps.c
+++ b/xen/arch/arm/traps.c
@@ -2007,6 +2007,8 @@ void enter_hypervisor_from_guest(void)
 {
     struct vcpu *v = current;
 
+    rcu_quiet_exit();
+
     /*
      * If we pended a virtual abort, preserve it until it gets cleared.
      * See ARM ARM DDI 0487A.j D1.14.3 (Virtual Interrupts) for details,
@@ -2264,6 +2266,8 @@ static void check_for_vcpu_work(void)
  */
 void leave_hypervisor_to_guest(void)
 {
+    rcu_quiet_enter();
+
     local_irq_disable();
 
     check_for_vcpu_work();
diff --git a/xen/arch/x86/acpi/cpu_idle.c b/xen/arch/x86/acpi/cpu_idle.c
index 836f524ef4..3d8dcec143 100644
--- a/xen/arch/x86/acpi/cpu_idle.c
+++ b/xen/arch/x86/acpi/cpu_idle.c
@@ -647,7 +647,8 @@ static void acpi_processor_idle(void)
     cpufreq_dbs_timer_suspend();
 
     sched_tick_suspend();
-    /* sched_tick_suspend() can raise TIMER_SOFTIRQ. Process it now. */
+    rcu_quiet_enter();
+    /* rcu_quiet_enter() can raise TIMER_SOFTIRQ. Process it now. */
     process_pending_softirqs();
 
     /*
@@ -660,6 +661,7 @@ static void acpi_processor_idle(void)
     {
         local_irq_enable();
         sched_tick_resume();
+        rcu_quiet_exit();
         cpufreq_dbs_timer_resume();
         return;
     }
@@ -785,6 +787,7 @@ static void acpi_processor_idle(void)
         power->last_state = &power->states[0];
         local_irq_enable();
         sched_tick_resume();
+        rcu_quiet_exit();
         cpufreq_dbs_timer_resume();
         return;
     }
@@ -793,6 +796,7 @@ static void acpi_processor_idle(void)
     power->last_state = &power->states[0];
 
     sched_tick_resume();
+    rcu_quiet_exit();
     cpufreq_dbs_timer_resume();
 
     if ( cpuidle_current_governor->reflect )
diff --git a/xen/arch/x86/cpu/mwait-idle.c b/xen/arch/x86/cpu/mwait-idle.c
index 52413e6da1..2657ec76f4 100644
--- a/xen/arch/x86/cpu/mwait-idle.c
+++ b/xen/arch/x86/cpu/mwait-idle.c
@@ -756,7 +756,8 @@ static void mwait_idle(void)
 	cpufreq_dbs_timer_suspend();
 
 	sched_tick_suspend();
-	/* sched_tick_suspend() can raise TIMER_SOFTIRQ. Process it now. */
+	rcu_quiet_enter();
+	/* rcu_quiet_enter() can raise TIMER_SOFTIRQ. Process it now. */
 	process_pending_softirqs();
 
 	/* Interrupts must be disabled for C2 and higher transitions. */
@@ -765,6 +766,7 @@ static void mwait_idle(void)
 	if (!cpu_is_haltable(cpu)) {
 		local_irq_enable();
 		sched_tick_resume();
+		rcu_quiet_exit();
 		cpufreq_dbs_timer_resume();
 		return;
 	}
@@ -807,6 +809,7 @@ static void mwait_idle(void)
 		lapic_timer_on();
 
 	sched_tick_resume();
+	rcu_quiet_exit();
 	cpufreq_dbs_timer_resume();
 
 	if ( cpuidle_current_governor->reflect )
diff --git a/xen/common/rcupdate.c b/xen/common/rcupdate.c
index 42ab9dbbd6..a9c24b5889 100644
--- a/xen/common/rcupdate.c
+++ b/xen/common/rcupdate.c
@@ -52,8 +52,8 @@ static struct rcu_ctrlblk {
     int  next_pending;  /* Is the next batch already waiting?         */
 
     spinlock_t  lock __cacheline_aligned;
-    cpumask_t   cpumask; /* CPUs that need to switch in order ...   */
-    cpumask_t   ignore_cpumask; /* ... unless they are already idle */
+    cpumask_t   cpumask; /* CPUs that need to switch in order...      */
+    cpumask_t   ignore_cpumask; /* ...unless already idle or in guest */
     /* for current batch to proceed.        */
 } __cacheline_aligned rcu_ctrlblk = {
     .cur = -300,
@@ -85,7 +85,7 @@ struct rcu_data {
     struct rcu_head barrier;
     long            last_rs_qlen;     /* qlen during the last resched */
 
-    /* 3) idle CPUs handling */
+    /* 3) idle (or in guest mode) CPUs handling */
     struct timer cb_timer;
     bool cb_timer_active;
 };
@@ -107,6 +107,12 @@ struct rcu_data {
  * 3) it is stopped immediately, if the CPU wakes up from idle and
  *    resumes 'normal' execution.
  *
+ * Note also that the same happens if a CPU starts executing a guest that
+ * (almost) never comes back into the hypervisor. This may be the case if
+ * the guest uses "idle=poll" / "vwfi=native". Therefore, we need to handle
+ * guest entry events in the same way as the CPU going idle, i.e., consider
+ * it quiesced and arm the timer.
+ *
  * About how far in the future the timer should be programmed each time,
  * it's hard to tell (guess!!). Since this mimics Linux's periodic timer
  * tick, take values used there as an indication. In Linux 2.6.21, tick
@@ -304,9 +310,10 @@ static void rcu_start_batch(struct rcu_ctrlblk *rcp)
         * Make sure the increment of rcp->cur is visible so, even if a
         * CPU that is about to go idle, is captured inside rcp->cpumask,
         * rcu_pending() will return false, which then means cpu_quiet()
-        * will be invoked, before the CPU would actually enter idle.
+        * will be invoked, before the CPU would actually go idle (or
+	* enter a guest).
         *
-        * This barrier is paired with the one in rcu_idle_enter().
+        * This barrier is paired with the one in rcu_quiet_enter().
         */
         smp_mb();
         cpumask_andnot(&rcp->cpumask, &cpu_online_map, &rcp->ignore_cpumask);
@@ -463,14 +470,15 @@ int rcu_needs_cpu(int cpu)
  * periodically poke rcu_pedning(), so that it will invoke the callback
  * not too late after the end of the grace period.
  */
-static void cb_timer_start(void)
+static void cb_timer_start(unsigned int cpu)
 {
-    struct rcu_data *rdp = &this_cpu(rcu_data);
+    struct rcu_data *rdp = &per_cpu(rcu_data, cpu);
 
     /*
      * Note that we don't check rcu_pending() here. In fact, we don't want
      * the timer armed on CPUs that are in the process of quiescing while
-     * going idle, unless they really are the ones with a queued callback.
+     * going idle or entering guest mode, unless they really have queued
+     * callbacks.
      */
     if (likely(!rdp->curlist))
         return;
@@ -479,9 +487,9 @@ static void cb_timer_start(void)
     rdp->cb_timer_active = true;
 }
 
-static void cb_timer_stop(void)
+static void cb_timer_stop(unsigned int cpu)
 {
-    struct rcu_data *rdp = &this_cpu(rcu_data);
+    struct rcu_data *rdp = &per_cpu(rcu_data, cpu);
 
     if (likely(!rdp->cb_timer_active))
         return;
@@ -635,11 +643,14 @@ void __init rcu_init(void)
 }
 
 /*
- * The CPU is becoming idle, so no more read side critical
- * sections, and one more step toward grace period.
+ * The CPU is becoming about to either idle or enter the guest. In any of
+ * these cases, it can't have any outstanding read side critical sections
+ * so this is one step toward the end of the grace period.
  */
-void rcu_idle_enter(unsigned int cpu)
+void rcu_quiet_enter()
 {
+    unsigned int cpu = smp_processor_id();
+
     ASSERT(!cpumask_test_cpu(cpu, &rcu_ctrlblk.ignore_cpumask));
     cpumask_set_cpu(cpu, &rcu_ctrlblk.ignore_cpumask);
     /*
@@ -652,11 +663,15 @@ void rcu_idle_enter(unsigned int cpu)
      */
     smp_mb();
     cb_timer_start();
+    cb_timer_start(cpu);
 }
 
-void rcu_idle_exit(unsigned int cpu)
+
+void rcu_quiet_exit()
 {
-    cb_timer_stop();
+    unsigned int cpu = smp_processor_id();
+
+    cb_timer_stop(cpu);
     ASSERT(cpumask_test_cpu(cpu, &rcu_ctrlblk.ignore_cpumask));
     cpumask_clear_cpu(cpu, &rcu_ctrlblk.ignore_cpumask);
 }
diff --git a/xen/include/xen/rcupdate.h b/xen/include/xen/rcupdate.h
index 13850865ed..63db0f9887 100644
--- a/xen/include/xen/rcupdate.h
+++ b/xen/include/xen/rcupdate.h
@@ -145,8 +145,8 @@ void call_rcu(struct rcu_head *head,
 
 int rcu_barrier(void);
 
-void rcu_idle_enter(unsigned int cpu);
-void rcu_idle_exit(unsigned int cpu);
+void rcu_quiet_enter(void);
+void rcu_quiet_exit(void);
 
 void rcu_idle_timer_start(void);
 void rcu_idle_timer_stop(void);

--------------8DCEB5763D2D09BD74FF88B6
Content-Type: text/x-patch; charset=UTF-8;
 name="3_1-rcu-adaptations.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="3_1-rcu-adaptations.patch"

diff --git a/xen/common/domain.c b/xen/common/domain.c
index 0902a15e8d..a8e203a1c1 100644
--- a/xen/common/domain.c
+++ b/xen/common/domain.c
@@ -935,7 +935,7 @@ static void complete_domain_destroy(struct rcu_head *head)
     struct domain *d = container_of(head, struct domain, rcu);
     struct vcpu *v;
     int i;
-
+    printk("complete_domain_destroy BEGIN\n");
     /*
      * Flush all state for the vCPU previously having run on the current CPU.
      * This is in particular relevant for x86 HVM ones on VMX, so that this
@@ -991,6 +991,7 @@ static void complete_domain_destroy(struct rcu_head *head)
     _domain_destroy(d);
 
     send_global_virq(VIRQ_DOM_EXC);
+    printk("complete_domain_destroy END\n");
 }
 
 /* Release resources belonging to task @p. */
diff --git a/xen/common/rcupdate.c b/xen/common/rcupdate.c
index a9c24b5889..1bdf4ecc53 100644
--- a/xen/common/rcupdate.c
+++ b/xen/common/rcupdate.c
@@ -662,7 +662,6 @@ void rcu_quiet_enter()
      * Se the comment before cpumask_andnot() in  rcu_start_batch().
      */
     smp_mb();
-    cb_timer_start();
     cb_timer_start(cpu);
 }
 
diff --git a/xen/common/schedule.c b/xen/common/schedule.c
index 6d24a3a135..4a63c11ed1 100644
--- a/xen/common/schedule.c
+++ b/xen/common/schedule.c
@@ -3111,14 +3111,12 @@ void schedule_dump(struct cpupool *c)
 
 void sched_tick_suspend(void)
 {
-    rcu_idle_enter(smp_processor_id());
-    rcu_idle_timer_start();
+    rcu_quiet_enter();
 }
 
 void sched_tick_resume(void)
 {
-    rcu_idle_timer_stop();
-    rcu_idle_exit(smp_processor_id());
+    rcu_quiet_exit();
 }
 
 void wait(void)

--------------8DCEB5763D2D09BD74FF88B6
Content-Type: text/x-patch; charset=UTF-8;
 name="rcu-quiesc-patch.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="rcu-quiesc-patch.patch"

commit 0d2beb3d4125d65c415860d66974db9a5532ac84
Author: Dario Faggioli <dfaggioli@suse.com>
Date:   Wed Sep 26 11:47:06 2018 +0200

    xen: RCU: bootparam to force quiescence at every call.
    
    Signed-off-by: Dario Faggioli <dfaggioli@suse.com>

diff --git a/xen/arch/arm/traps.c b/xen/arch/arm/traps.c
index 0f4b1f2a5d..536eb17017 100644
--- a/xen/arch/arm/traps.c
+++ b/xen/arch/arm/traps.c
@@ -110,7 +110,10 @@ static enum {
 static int __init parse_vwfi(const char *s)
 {
 	if ( !strcmp(s, "native") )
+	{
+		rcu_always_quiesc = true;
 		vwfi = NATIVE;
+	}
 	else
 		vwfi = TRAP;
 
diff --git a/xen/common/rcupdate.c b/xen/common/rcupdate.c
index 3517790913..219dd2884f 100644
--- a/xen/common/rcupdate.c
+++ b/xen/common/rcupdate.c
@@ -140,6 +140,9 @@ static int qhimark = 10000;
 static int qlowmark = 100;
 static int rsinterval = 1000;
 
+bool rcu_always_quiesc = false;
+boolean_param("rcu_force_quiesc", rcu_always_quiesc);
+
 struct rcu_barrier_data {
     struct rcu_head head;
     atomic_t *cpu_count;
@@ -562,6 +565,13 @@ static void rcu_init_percpu_data(int cpu, struct rcu_ctrlblk *rcp,
     rdp->quiescbatch = rcp->completed;
     rdp->qs_pending = 0;
     rdp->cpu = cpu;
+    if ( rcu_always_quiesc )
+    {
+        blimit = INT_MAX;
+        qhimark = 0;
+        qlowmark = 0;
+        //rsinterval = 0;
+    }
     rdp->blimit = blimit;
     init_timer(&rdp->idle_timer, rcu_idle_timer_handler, rdp, cpu);
 }
diff --git a/xen/include/xen/rcupdate.h b/xen/include/xen/rcupdate.h
index 3402eb5caf..274a01acf6 100644
--- a/xen/include/xen/rcupdate.h
+++ b/xen/include/xen/rcupdate.h
@@ -56,6 +56,8 @@ struct rcu_head {
 } while (0)
 
 
+extern bool rcu_always_quiesc;
+
 int rcu_pending(int cpu);
 int rcu_needs_cpu(int cpu);
 

--------------8DCEB5763D2D09BD74FF88B6--

