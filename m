Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F78D6F72F7
	for <lists+xen-devel@lfdr.de>; Thu,  4 May 2023 21:09:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.529935.825022 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pueKa-0006T0-92; Thu, 04 May 2023 19:09:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 529935.825022; Thu, 04 May 2023 19:09:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pueKa-0006PM-0P; Thu, 04 May 2023 19:09:32 +0000
Received: by outflank-mailman (input) for mailman id 529935;
 Thu, 04 May 2023 19:09:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=srgM=AZ=linutronix.de=tglx@srs-se1.protection.inumbo.net>)
 id 1pueE2-00042j-Qd
 for xen-devel@lists.xenproject.org; Thu, 04 May 2023 19:02:46 +0000
Received: from galois.linutronix.de (galois.linutronix.de [193.142.43.55])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 415bc34c-eaae-11ed-b226-6b7b168915f2;
 Thu, 04 May 2023 21:02:46 +0200 (CEST)
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
X-Inumbo-ID: 415bc34c-eaae-11ed-b226-6b7b168915f2
Message-ID: <20230504185937.912510359@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1683226965;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 references:references; bh=F8kXoaR1nBQ6o9VxPp8Uz6U2V5tkVIrZOYAD+Uqf6yU=;
	b=FHHwtM3MehcvxyTD3IIJz8sgSlPXUlchZh7xJFV6jf2jNACHHUSgTO098Ser6A+TKYqwby
	MlO+QBW9B7CBztPuD5tg+w+tvkSrJZeyBsoOwfT3EBQQwdnjzUEH5V/q7RLkoQV5ifNNa+
	at9KsHlVkTZ1F4ajKTdjiM9iHVozExltMcmveGrXQs/fOlHDH8HgFUnTWmeo5rouQexRZ4
	Xry4XkxaL7TCkZzvLR+YbuqgPQqwNW1A3kMmXVynnWeMARwsSVesHKDo20gZt3Skv9srif
	0A1QbnYXe4Tj6Hfs/b/c+uuWIPdrOvy2KufgGEj/6EkbPvsEiWUj1xzdM/2/FQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1683226965;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 references:references; bh=F8kXoaR1nBQ6o9VxPp8Uz6U2V5tkVIrZOYAD+Uqf6yU=;
	b=eKOKrA/+YsiD2CsaRIq67Pl+6fGbLOp23MnHr4M6jOIgCJwCHmPsKgxoXghxnT8I2GMUKL
	U9rUX94YG+zIxfDw==
From: Thomas Gleixner <tglx@linutronix.de>
To: LKML <linux-kernel@vger.kernel.org>
Cc: x86@kernel.org,
 David Woodhouse <dwmw2@infradead.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Brian Gerst <brgerst@gmail.com>,
 Arjan van de Veen <arjan@linux.intel.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Paul McKenney <paulmck@kernel.org>,
 Tom Lendacky <thomas.lendacky@amd.com>,
 Sean Christopherson <seanjc@google.com>,
 Oleksandr Natalenko <oleksandr@natalenko.name>,
 Paul Menzel <pmenzel@molgen.mpg.de>,
 "Guilherme G. Piccoli" <gpiccoli@igalia.com>,
 Piotr Gorski <lucjan.lucjanov@gmail.com>,
 Usama Arif <usama.arif@bytedance.com>,
 Juergen Gross <jgross@suse.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 xen-devel@lists.xenproject.org,
 Russell King <linux@armlinux.org.uk>,
 Arnd Bergmann <arnd@arndb.de>,
 linux-arm-kernel@lists.infradead.org,
 Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will@kernel.org>,
 Guo Ren <guoren@kernel.org>,
 linux-csky@vger.kernel.org,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 linux-mips@vger.kernel.org,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 Helge Deller <deller@gmx.de>,
 linux-parisc@vger.kernel.org,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 linux-riscv@lists.infradead.org,
 Mark Rutland <mark.rutland@arm.com>,
 Sabin Rapan <sabrapan@amazon.com>,
 "Michael Kelley (LINUX)" <mikelley@microsoft.com>
Subject:
 [patch V2 29/38] cpu/hotplug: Provide a split up CPUHP_BRINGUP mechanism
References: <20230504185733.126511787@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Date: Thu,  4 May 2023 21:02:45 +0200 (CEST)

From: Thomas Gleixner <tglx@linutronix.de>

The bring up logic of a to be onlined CPU consists of several parts, which
are considered to be a single hotplug state:

  1) Control CPU issues the wake-up

  2) To be onlined CPU starts up, does the minimal initialization,
     reports to be alive and waits for release into the complete bring-up.

  3) Control CPU waits for the alive report and releases the upcoming CPU
     for the complete bring-up.

Allow to split this into two states:

  1) Control CPU issues the wake-up

     After that the to be onlined CPU starts up, does the minimal
     initialization, reports to be alive and waits for release into the
     full bring-up. As this can run after the control CPU dropped the
     hotplug locks the code which is executed on the AP before it reports
     alive has to be carefully audited to not violate any of the hotplug
     constraints, especially not modifying any of the various cpumasks.

     This is really only meant to avoid waiting for the AP to react on the
     wake-up. Of course an architecture can move strict CPU related setup
     functionality, e.g. microcode loading, with care before the
     synchronization point to save further pointless waiting time.

  2) Control CPU waits for the alive report and releases the upcoming CPU
     for the complete bring-up.

This allows that the two states can be split up to run all to be onlined
CPUs up to state #1 on the control CPU and then at a later point run state
#2. This spares some of the latencies of the full serialized per CPU
bringup by avoiding the per CPU wakeup/wait serialization. The assumption
is that the first AP already waits when the last AP has been woken up. This
obvioulsy depends on the hardware latencies and depending on the timings
this might still not completely eliminate all wait scenarios.

This split is just a preparatory step for enabling the parallel bringup
later. The boot time bringup is still fully serialized. It has a separate
config switch so that architectures which want to support parallel bringup
can test the split of the CPUHP_BRINGUG step separately.

To enable this the architecture must support the CPU hotplug core sync
mechanism and has to be audited that there are no implicit hotplug state
dependencies which require a fully serialized bringup.

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>

---
 arch/Kconfig               |    4 ++
 include/linux/cpuhotplug.h |    4 ++
 kernel/cpu.c               |   70 +++++++++++++++++++++++++++++++++++++++++++--
 3 files changed, 76 insertions(+), 2 deletions(-)
---
--- a/arch/Kconfig
+++ b/arch/Kconfig
@@ -49,6 +49,10 @@ config HOTPLUG_CORE_SYNC_FULL
 	select HOTPLUG_CORE_SYNC_DEAD if HOTPLUG_CPU
 	select HOTPLUG_CORE_SYNC
 
+config HOTPLUG_SPLIT_STARTUP
+	bool
+	select HOTPLUG_CORE_SYNC_FULL
+
 config GENERIC_ENTRY
 	bool
 
--- a/include/linux/cpuhotplug.h
+++ b/include/linux/cpuhotplug.h
@@ -133,6 +133,7 @@ enum cpuhp_state {
 	CPUHP_MIPS_SOC_PREPARE,
 	CPUHP_BP_PREPARE_DYN,
 	CPUHP_BP_PREPARE_DYN_END		= CPUHP_BP_PREPARE_DYN + 20,
+	CPUHP_BP_KICK_AP,
 	CPUHP_BRINGUP_CPU,
 
 	/*
@@ -517,9 +518,12 @@ void cpuhp_online_idle(enum cpuhp_state
 static inline void cpuhp_online_idle(enum cpuhp_state state) { }
 #endif
 
+struct task_struct;
+
 void cpuhp_ap_sync_alive(void);
 void arch_cpuhp_sync_state_poll(void);
 void arch_cpuhp_cleanup_kick_cpu(unsigned int cpu);
+int arch_cpuhp_kick_ap_alive(unsigned int cpu, struct task_struct *tidle);
 
 #ifdef CONFIG_HOTPLUG_CORE_SYNC_DEAD
 void cpuhp_ap_report_dead(void);
--- a/kernel/cpu.c
+++ b/kernel/cpu.c
@@ -761,6 +761,47 @@ static int bringup_wait_for_ap_online(un
 	return 0;
 }
 
+#ifdef CONFIG_HOTPLUG_SPLIT_STARTUP
+static int cpuhp_kick_ap_alive(unsigned int cpu)
+{
+	if (!cpuhp_can_boot_ap(cpu))
+		return -EAGAIN;
+
+	return arch_cpuhp_kick_ap_alive(cpu, idle_thread_get(cpu));
+}
+
+static int cpuhp_bringup_ap(unsigned int cpu)
+{
+	struct cpuhp_cpu_state *st = per_cpu_ptr(&cpuhp_state, cpu);
+	int ret;
+
+	/*
+	 * Some architectures have to walk the irq descriptors to
+	 * setup the vector space for the cpu which comes online.
+	 * Prevent irq alloc/free across the bringup.
+	 */
+	irq_lock_sparse();
+
+	ret = cpuhp_bp_sync_alive(cpu);
+	if (ret)
+		goto out_unlock;
+
+	ret = bringup_wait_for_ap_online(cpu);
+	if (ret)
+		goto out_unlock;
+
+	irq_unlock_sparse();
+
+	if (st->target <= CPUHP_AP_ONLINE_IDLE)
+		return 0;
+
+	return cpuhp_kick_ap(cpu, st, st->target);
+
+out_unlock:
+	irq_unlock_sparse();
+	return ret;
+}
+#else
 static int bringup_cpu(unsigned int cpu)
 {
 	struct cpuhp_cpu_state *st = per_cpu_ptr(&cpuhp_state, cpu);
@@ -777,7 +818,6 @@ static int bringup_cpu(unsigned int cpu)
 	 */
 	irq_lock_sparse();
 
-	/* Arch-specific enabling code. */
 	ret = __cpu_up(cpu, idle);
 	if (ret)
 		goto out_unlock;
@@ -801,6 +841,7 @@ static int bringup_cpu(unsigned int cpu)
 	irq_unlock_sparse();
 	return ret;
 }
+#endif
 
 static int finish_cpu(unsigned int cpu)
 {
@@ -1940,13 +1981,38 @@ static struct cpuhp_step cpuhp_hp_states
 		.startup.single		= timers_prepare_cpu,
 		.teardown.single	= timers_dead_cpu,
 	},
-	/* Kicks the plugged cpu into life */
+
+#ifdef CONFIG_HOTPLUG_SPLIT_STARTUP
+	/*
+	 * Kicks the AP alive. AP will wait in cpuhp_ap_sync_alive() until
+	 * the next step will release it.
+	 */
+	[CPUHP_BP_KICK_AP] = {
+		.name			= "cpu:kick_ap",
+		.startup.single		= cpuhp_kick_ap_alive,
+	},
+
+	/*
+	 * Waits for the AP to reach cpuhp_ap_sync_alive() and then
+	 * releases it for the complete bringup.
+	 */
+	[CPUHP_BRINGUP_CPU] = {
+		.name			= "cpu:bringup",
+		.startup.single		= cpuhp_bringup_ap,
+		.teardown.single	= finish_cpu,
+		.cant_stop		= true,
+	},
+#else
+	/*
+	 * All-in-one CPU bringup state which includes the kick alive.
+	 */
 	[CPUHP_BRINGUP_CPU] = {
 		.name			= "cpu:bringup",
 		.startup.single		= bringup_cpu,
 		.teardown.single	= finish_cpu,
 		.cant_stop		= true,
 	},
+#endif
 	/* Final state before CPU kills itself */
 	[CPUHP_AP_IDLE_DEAD] = {
 		.name			= "idle:dead",


