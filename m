Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 11A9C6FB79C
	for <lists+xen-devel@lfdr.de>; Mon,  8 May 2023 21:47:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.531791.827723 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pw6pg-0006ma-Bs; Mon, 08 May 2023 19:47:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 531791.827723; Mon, 08 May 2023 19:47:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pw6pg-0006hS-5E; Mon, 08 May 2023 19:47:40 +0000
Received: by outflank-mailman (input) for mailman id 531791;
 Mon, 08 May 2023 19:47:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=49Re=A5=linutronix.de=tglx@srs-se1.protection.inumbo.net>)
 id 1pw6mT-0004Y5-83
 for xen-devel@lists.xenproject.org; Mon, 08 May 2023 19:44:21 +0000
Received: from galois.linutronix.de (galois.linutronix.de [193.142.43.55])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b9373003-edd8-11ed-8611-37d641c3527e;
 Mon, 08 May 2023 21:44:19 +0200 (CEST)
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
X-Inumbo-ID: b9373003-edd8-11ed-8611-37d641c3527e
Message-ID: <20230508185219.016841363@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1683575059;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 references:references; bh=209TLBvRBeEafFURgM0Y1ht7eQ7Y0xFjxVmui7BNI1o=;
	b=n00hUXstsdyfUPFcrDAYr9qfqXyIIcwLYM+NMXKmbpRXuAwK6NgEAWLRBbou/zHFnXIEod
	8New7so5w76Tb6aP+ykkJPN+I2CJwBwHZMzePhRQEpwGX52DB5Z1gdG558koxONpDK5vHV
	Nw3vZn8ZYXWXENECHg8/+P4uLipUY5x32lSL0Ye9CYi84jhqQ0/1HAPCNaEXglJl15NFbz
	zfcfgBtb+CGqOrVf91xrpFIeSR0Cfa5oQ5LpNyu3yK2Hb8OUT10cao1Vz6GemRAHhna574
	D0JjHpAmGP3ofXOD9DehizPjgrf0doKL7iorp17NI6K6epm+KVwswpLQO+EHLA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1683575059;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 references:references; bh=209TLBvRBeEafFURgM0Y1ht7eQ7Y0xFjxVmui7BNI1o=;
	b=HZPvGLiAxw+6fgkpd1LobrgVgwanW2gWFTwlrLJ+Qy03Ucp5K4TQSj/S8iTBeqfZ2ooZAu
	VgXE2xAvT1s4U6AA==
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
 "Michael Kelley (LINUX)" <mikelley@microsoft.com>,
 David Woodhouse <dwmw@amazon.co.uk>
Subject: [patch v3 32/36] cpu/hotplug: Allow "parallel" bringup up to
 CPUHP_BP_KICK_AP_STATE
References: <20230508181633.089804905@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Date: Mon,  8 May 2023 21:44:18 +0200 (CEST)

From: Thomas Gleixner <tglx@linutronix.de>

There is often significant latency in the early stages of CPU bringup, and
time is wasted by waking each CPU (e.g. with SIPI/INIT/INIT on x86) and
then waiting for it to respond before moving on to the next.

Allow a platform to enable parallel setup which brings all to be onlined
CPUs up to the CPUHP_BP_KICK_AP state. While this state advancement on the
control CPU (BP) is single-threaded the important part is the last state
CPUHP_BP_KICK_AP which wakes the to be onlined CPUs up.

This allows the CPUs to run up to the first sychronization point
cpuhp_ap_sync_alive() where they wait for the control CPU to release them
one by one for the full onlining procedure.

This parallelism depends on the CPU hotplug core sync mechanism which
ensures that the parallel brought up CPUs wait for release before touching
any state which would make the CPU visible to anything outside the hotplug
control mechanism.

To handle the SMT constraints of X86 correctly the bringup happens in two
iterations when CONFIG_HOTPLUG_SMT is enabled. The control CPU brings up
the primary SMT threads of each core first, which can load the microcode
without the need to rendevouz with the thread siblings. Once that's
completed it brings up the secondary SMT threads.

Co-developed-by: David Woodhouse <dwmw@amazon.co.uk>
Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
Tested-by: Michael Kelley <mikelley@microsoft.com>


---
 Documentation/admin-guide/kernel-parameters.txt |    6 +
 arch/Kconfig                                    |    4 
 include/linux/cpuhotplug.h                      |    1 
 kernel/cpu.c                                    |  103 ++++++++++++++++++++++--
 4 files changed, 109 insertions(+), 5 deletions(-)
---

--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -838,6 +838,12 @@
 			on every CPU online, such as boot, and resume from suspend.
 			Default: 10000
 
+	cpuhp.parallel=
+			[SMP] Enable/disable parallel bringup of secondary CPUs
+			Format: <bool>
+			Default is enabled if CONFIG_HOTPLUG_PARALLEL=y. Otherwise
+			the parameter has no effect.
+
 	crash_kexec_post_notifiers
 			Run kdump after running panic-notifiers and dumping
 			kmsg. This only for the users who doubt kdump always
--- a/arch/Kconfig
+++ b/arch/Kconfig
@@ -53,6 +53,10 @@ config HOTPLUG_SPLIT_STARTUP
 	bool
 	select HOTPLUG_CORE_SYNC_FULL
 
+config HOTPLUG_PARALLEL
+	bool
+	select HOTPLUG_SPLIT_STARTUP
+
 config GENERIC_ENTRY
 	bool
 
--- a/include/linux/cpuhotplug.h
+++ b/include/linux/cpuhotplug.h
@@ -524,6 +524,7 @@ void cpuhp_ap_sync_alive(void);
 void arch_cpuhp_sync_state_poll(void);
 void arch_cpuhp_cleanup_kick_cpu(unsigned int cpu);
 int arch_cpuhp_kick_ap_alive(unsigned int cpu, struct task_struct *tidle);
+bool arch_cpuhp_init_parallel_bringup(void);
 
 #ifdef CONFIG_HOTPLUG_CORE_SYNC_DEAD
 void cpuhp_ap_report_dead(void);
--- a/kernel/cpu.c
+++ b/kernel/cpu.c
@@ -649,8 +649,23 @@ bool cpu_smt_possible(void)
 		cpu_smt_control != CPU_SMT_NOT_SUPPORTED;
 }
 EXPORT_SYMBOL_GPL(cpu_smt_possible);
+
+static inline bool cpuhp_smt_aware(void)
+{
+	return topology_smt_supported();
+}
+
+static inline const struct cpumask *cpuhp_get_primary_thread_mask(void)
+{
+	return cpu_primary_thread_mask;
+}
 #else
 static inline bool cpu_smt_allowed(unsigned int cpu) { return true; }
+static inline bool cpuhp_smt_aware(void) { return false; }
+static inline const struct cpumask *cpuhp_get_primary_thread_mask(void)
+{
+	return cpu_present_mask;
+}
 #endif
 
 static inline enum cpuhp_state
@@ -1743,16 +1758,94 @@ int bringup_hibernate_cpu(unsigned int s
 	return 0;
 }
 
-void __init bringup_nonboot_cpus(unsigned int setup_max_cpus)
+static void __init cpuhp_bringup_mask(const struct cpumask *mask, unsigned int ncpus,
+				      enum cpuhp_state target)
 {
 	unsigned int cpu;
 
-	for_each_present_cpu(cpu) {
-		if (num_online_cpus() >= setup_max_cpus)
+	for_each_cpu(cpu, mask) {
+		struct cpuhp_cpu_state *st = per_cpu_ptr(&cpuhp_state, cpu);
+
+		if (!--ncpus)
 			break;
-		if (!cpu_online(cpu))
-			cpu_up(cpu, CPUHP_ONLINE);
+
+		if (cpu_up(cpu, target) && can_rollback_cpu(st)) {
+			/*
+			 * If this failed then cpu_up() might have only
+			 * rolled back to CPUHP_BP_KICK_AP for the final
+			 * online. Clean it up. NOOP if already rolled back.
+			 */
+			WARN_ON(cpuhp_invoke_callback_range(false, cpu, st, CPUHP_OFFLINE));
+		}
+	}
+}
+
+#ifdef CONFIG_HOTPLUG_PARALLEL
+static bool __cpuhp_parallel_bringup __ro_after_init = true;
+
+static int __init parallel_bringup_parse_param(char *arg)
+{
+	return kstrtobool(arg, &__cpuhp_parallel_bringup);
+}
+early_param("cpuhp.parallel", parallel_bringup_parse_param);
+
+/*
+ * On architectures which have enabled parallel bringup this invokes all BP
+ * prepare states for each of the to be onlined APs first. The last state
+ * sends the startup IPI to the APs. The APs proceed through the low level
+ * bringup code in parallel and then wait for the control CPU to release
+ * them one by one for the final onlining procedure.
+ *
+ * This avoids waiting for each AP to respond to the startup IPI in
+ * CPUHP_BRINGUP_CPU.
+ */
+static bool __init cpuhp_bringup_cpus_parallel(unsigned int ncpus)
+{
+	const struct cpumask *mask = cpu_present_mask;
+
+	if (__cpuhp_parallel_bringup)
+		__cpuhp_parallel_bringup = arch_cpuhp_init_parallel_bringup();
+	if (!__cpuhp_parallel_bringup)
+		return false;
+
+	if (cpuhp_smt_aware()) {
+		const struct cpumask *pmask = cpuhp_get_primary_thread_mask();
+		static struct cpumask tmp_mask __initdata;
+
+		/*
+		 * X86 requires to prevent that SMT siblings stopped while
+		 * the primary thread does a microcode update for various
+		 * reasons. Bring the primary threads up first.
+		 */
+		cpumask_and(&tmp_mask, mask, pmask);
+		cpuhp_bringup_mask(&tmp_mask, ncpus, CPUHP_BP_KICK_AP);
+		cpuhp_bringup_mask(&tmp_mask, ncpus, CPUHP_ONLINE);
+		/* Account for the online CPUs */
+		ncpus -= num_online_cpus();
+		if (!ncpus)
+			return true;
+		/* Create the mask for secondary CPUs */
+		cpumask_andnot(&tmp_mask, mask, pmask);
+		mask = &tmp_mask;
 	}
+
+	/* Bring the not-yet started CPUs up */
+	cpuhp_bringup_mask(mask, ncpus, CPUHP_BP_KICK_AP);
+	cpuhp_bringup_mask(mask, ncpus, CPUHP_ONLINE);
+	return true;
+}
+#else
+static inline bool cpuhp_bringup_cpus_parallel(unsigned int ncpus) { return false; }
+#endif /* CONFIG_HOTPLUG_PARALLEL */
+
+void __init bringup_nonboot_cpus(unsigned int setup_max_cpus)
+{
+	/* Try parallel bringup optimization if enabled */
+	if (cpuhp_bringup_cpus_parallel(setup_max_cpus))
+		return;
+
+	/* Full per CPU serialized bringup */
+	cpuhp_bringup_mask(cpu_present_mask, setup_max_cpus, CPUHP_ONLINE);
 }
 
 #ifdef CONFIG_PM_SLEEP_SMP



