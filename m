Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CD0176E2D26
	for <lists+xen-devel@lfdr.de>; Sat, 15 Apr 2023 01:44:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.521274.809857 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pnT5s-0005Mv-GF; Fri, 14 Apr 2023 23:44:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 521274.809857; Fri, 14 Apr 2023 23:44:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pnT5r-00051G-OK; Fri, 14 Apr 2023 23:44:39 +0000
Received: by outflank-mailman (input) for mailman id 521274;
 Fri, 14 Apr 2023 23:44:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ZCOw=AF=linutronix.de=tglx@srs-se1.protection.inumbo.net>)
 id 1pnT5o-0001Th-1b
 for xen-devel@lists.xenproject.org; Fri, 14 Apr 2023 23:44:36 +0000
Received: from galois.linutronix.de (galois.linutronix.de [193.142.43.55])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4fdcf5be-db1e-11ed-b21e-6b7b168915f2;
 Sat, 15 Apr 2023 01:44:35 +0200 (CEST)
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
X-Inumbo-ID: 4fdcf5be-db1e-11ed-b21e-6b7b168915f2
Message-ID: <20230414232310.010585365@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1681515875;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 references:references; bh=o+IIZolWdFzFoKPnCYeSD1bdkqJKKR73ExqiLPCERDI=;
	b=YtXMog5VLahh+j7fmWogAvr6ObdCeMs2/pQmIXREKblleGoCtvJL4rCNiqdvWzbyjDcTRQ
	uiN2/aQVEAqhEyWPSPIkKx0AVkXmtnjjoHfjwT3/yh44khK5MSa6L7h2bJz7b22ZDlJ6sh
	00pAwnPCUJWCsn2Ejc57QMUUvq4xsRjx3LwBphTuReLzL6PmYvBpWBQh7nPpyk6UmRKfhO
	2Eee0WLf6JgST16c76h3RPniWFIj95CGMwloYJMAwCCsO+gfqOq1rnGnjyKNvGqHT1gYGv
	P1F3HkYh07cMCdG7gc3D1VPgXDTVfI3a8otMhGht4nwU8AdufkquSsBkf+sOZA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1681515875;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 references:references; bh=o+IIZolWdFzFoKPnCYeSD1bdkqJKKR73ExqiLPCERDI=;
	b=/GA3IGAqyXeZ0ie5H89dtUrqgSL/9oSjEmZXWUtsSX1UpgcGxjRjqmWWhXVPw2ws/g8YlI
	DVurnNfTpyXvJvDg==
From: Thomas Gleixner <tglx@linutronix.de>
To: LKML <linux-kernel@vger.kernel.org>
Cc: x86@kernel.org,
 David Woodhouse <dwmw@infradead.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Brian Gerst <brgerst@gmail.com>,
 "Arjan van de Veen" <arjan@linux.intel.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Paul McKenney <paulmck@kernel.org>,
 Tom Lendacky <thomas.lendacky@amd.com>,
 Sean Christopherson <seanjc@google.com>,
 Oleksandr Natalenko <oleksandr@natalenko.name>,
 Paul Menzel <pmenzel@molgen.mpg.de>,
 "Guilherme G. Piccoli" <gpiccoli@igalia.com>,
 Piotr Gorski <lucjan.lucjanov@gmail.com>,
 David Woodhouse <dwmw@amazon.co.uk>,
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
 Sabin Rapan <sabrapan@amazon.com>
Subject: [patch 13/37] x86/smpboot: Remove cpu_callin_mask
References: <20230414225551.858160935@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Date: Sat, 15 Apr 2023 01:44:34 +0200 (CEST)

Now that TSC synchronization is SMP function call based there is no reason
to wait for the AP to be set in smp_callin_mask. The control CPU waits for
the AP to set itself in the online mask anyway.

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
---
 arch/x86/kernel/smpboot.c |   61 +++++++---------------------------------------
 1 file changed, 10 insertions(+), 51 deletions(-)

--- a/arch/x86/kernel/smpboot.c
+++ b/arch/x86/kernel/smpboot.c
@@ -104,7 +104,6 @@ EXPORT_PER_CPU_SYMBOL(cpu_info);
 /* All of these masks are initialized in setup_cpu_local_masks() */
 static cpumask_var_t cpu_initialized_mask;
 static cpumask_var_t cpu_callout_mask;
-static cpumask_var_t cpu_callin_mask;
 /* Representing CPUs for which sibling maps can be computed */
 static cpumask_var_t cpu_sibling_setup_mask;
 
@@ -167,21 +166,16 @@ static inline void smpboot_restore_warm_
  */
 static void smp_callin(void)
 {
-	int cpuid;
+	int cpuid = smp_processor_id();
 
 	/*
 	 * If waken up by an INIT in an 82489DX configuration
-	 * cpu_callout_mask guarantees we don't get here before
-	 * an INIT_deassert IPI reaches our local APIC, so it is
-	 * now safe to touch our local APIC.
-	 */
-	cpuid = smp_processor_id();
-
-	/*
-	 * the boot CPU has finished the init stage and is spinning
-	 * on callin_map until we finish. We are free to set up this
-	 * CPU, first the APIC. (this is probably redundant on most
-	 * boards)
+	 * cpu_callout_mask guarantees we don't get here before an
+	 * INIT_deassert IPI reaches our local APIC, so it is now safe to
+	 * touch our local APIC.
+	 *
+	 * Set up this CPU, first the APIC, which is probably redundant on
+	 * most boards.
 	 */
 	apic_ap_setup();
 
@@ -192,7 +186,7 @@ static void smp_callin(void)
 	 * The topology information must be up to date before
 	 * calibrate_delay() and notify_cpu_starting().
 	 */
-	set_cpu_sibling_map(raw_smp_processor_id());
+	set_cpu_sibling_map(cpuid);
 
 	ap_init_aperfmperf();
 
@@ -205,11 +199,6 @@ static void smp_callin(void)
 	 * state (CPUHP_ONLINE in the case of serial bringup).
 	 */
 	notify_cpu_starting(cpuid);
-
-	/*
-	 * Allow the master to continue.
-	 */
-	cpumask_set_cpu(cpuid, cpu_callin_mask);
 }
 
 static void ap_calibrate_delay(void)
@@ -268,11 +257,6 @@ static void notrace start_secondary(void
 	rcu_cpu_starting(raw_smp_processor_id());
 	x86_cpuinit.early_percpu_clock_init();
 
-	/*
-	 * Sync point with wait_cpu_callin(). The AP doesn't wait here
-	 * but just sets the bit to let the controlling CPU (BSP) know that
-	 * it's got this far.
-	 */
 	smp_callin();
 
 	/* Otherwise gcc will move up smp_processor_id() before cpu_init() */
@@ -1112,7 +1096,7 @@ static int wait_cpu_cpumask(unsigned int
  * and thus wait_for_master_cpu(), then set cpu_callout_mask to allow it
  * to proceed.  The AP will then proceed past setting its 'callin' bit
  * and end up waiting in check_tsc_sync_target() until we reach
- * do_wait_cpu_online() to tend to it.
+ * wait_cpu_online() to tend to it.
  */
 static int wait_cpu_initialized(unsigned int cpu)
 {
@@ -1127,20 +1111,7 @@ static int wait_cpu_initialized(unsigned
 }
 
 /*
- * Bringup step three: Wait for the target AP to reach smp_callin().
- * The AP is not waiting for us here so we don't need to parallelise
- * this step. Not entirely clear why we care about this, since we just
- * proceed directly to TSC synchronization which is the next sync
- * point with the AP anyway.
- */
-static void wait_cpu_callin(unsigned int cpu)
-{
-	while (!cpumask_test_cpu(cpu, cpu_callin_mask))
-		schedule();
-}
-
-/*
- * Bringup step four: Wait for the target AP to reach set_cpu_online() in
+ * Bringup step three: Wait for the target AP to reach set_cpu_online() in
  * start_secondary().
  */
 static void wait_cpu_online(unsigned int cpu)
@@ -1170,14 +1141,6 @@ static int native_kick_ap(unsigned int c
 	}
 
 	/*
-	 * Already booted CPU?
-	 */
-	if (cpumask_test_cpu(cpu, cpu_callin_mask)) {
-		pr_debug("do_boot_cpu %d Already started\n", cpu);
-		return -ENOSYS;
-	}
-
-	/*
 	 * Save current MTRR state in case it was changed since early boot
 	 * (e.g. by the ACPI SMI) to initialize new CPUs with MTRRs in sync:
 	 */
@@ -1214,7 +1177,6 @@ int native_cpu_up(unsigned int cpu, stru
 	if (ret)
 		goto out;
 
-	wait_cpu_callin(cpu);
 	wait_cpu_online(cpu);
 
 out:
@@ -1330,7 +1292,6 @@ void __init smp_prepare_cpus_common(void
 	 * Setup boot CPU information
 	 */
 	smp_store_boot_cpu_info(); /* Final full version of the data */
-	cpumask_copy(cpu_callin_mask, cpumask_of(0));
 	mb();
 
 	for_each_possible_cpu(i) {
@@ -1545,7 +1506,6 @@ early_param("possible_cpus", _setup_poss
 void __init setup_cpu_local_masks(void)
 {
 	alloc_bootmem_cpumask_var(&cpu_initialized_mask);
-	alloc_bootmem_cpumask_var(&cpu_callin_mask);
 	alloc_bootmem_cpumask_var(&cpu_callout_mask);
 	alloc_bootmem_cpumask_var(&cpu_sibling_setup_mask);
 }
@@ -1609,7 +1569,6 @@ static void remove_cpu_from_maps(int cpu
 {
 	set_cpu_online(cpu, false);
 	cpumask_clear_cpu(cpu, cpu_callout_mask);
-	cpumask_clear_cpu(cpu, cpu_callin_mask);
 	/* was set by cpu_init() */
 	cpumask_clear_cpu(cpu, cpu_initialized_mask);
 	numa_remove_cpu(cpu);


