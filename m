Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AED3701021
	for <lists+xen-devel@lfdr.de>; Fri, 12 May 2023 23:07:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.533906.830911 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pxZyg-0004I3-ES; Fri, 12 May 2023 21:07:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 533906.830911; Fri, 12 May 2023 21:07:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pxZyg-0004FI-Bj; Fri, 12 May 2023 21:07:02 +0000
Received: by outflank-mailman (input) for mailman id 533906;
 Fri, 12 May 2023 21:07:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5PQu=BB=linutronix.de=tglx@srs-se1.protection.inumbo.net>)
 id 1pxZye-0004F7-OB
 for xen-devel@lists.xenproject.org; Fri, 12 May 2023 21:07:01 +0000
Received: from galois.linutronix.de (galois.linutronix.de [193.142.43.55])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ee9a52b6-f108-11ed-8611-37d641c3527e;
 Fri, 12 May 2023 23:06:58 +0200 (CEST)
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
X-Inumbo-ID: ee9a52b6-f108-11ed-8611-37d641c3527e
Message-ID: <20230512203426.452963764@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1683925617;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc; bh=gnTvflJCY17ngq7v3t1VaZ+udg1fVO8xaD7NmVGfdtM=;
	b=hpItgE596OZsCHwd4RZltNwkaoUY+M4nxaNk5aijZSoKnJnX+Z1ftHJzFxXeLlwiR7CBVO
	kAeU5V6ipd8kuvNmo2jUYlgeJQZcAoQ/B2gtcPpMbKBJ5Hdb19cpdNKmIFAdiRriVPQFBq
	TB+mebv9nD57p/zwHVWvLj1xYW2llen6ecBlhNLpiB4mMX8ISxfhUt0cg8NuDkltKRGqwv
	kwkihKVbLzgwH4zA3a4gu5TjBLy8knJzdeBq4mfGSlsG3QssoI+I+YLWMjEKtJyMnCZYCb
	q0UpvbfNJvV5gxrJ96IhSco7wHR/BgKJzA+FPEk8wMxiA3axwjVqCn3rrplQeA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1683925617;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc; bh=gnTvflJCY17ngq7v3t1VaZ+udg1fVO8xaD7NmVGfdtM=;
	b=MX4k3gwiR3uPG3aHdqZkMbzsCUhWKscxACmgEvdnthaN7mX9Y50PkiqEAK2jw11B2rBJ5s
	0yIwakfLrEZSxWCw==
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
 Ross Philipson <ross.philipson@oracle.com>
Subject: [patch V4 00/37] cpu/hotplug, x86: Reworked parallel CPU bringup
Date: Fri, 12 May 2023 23:06:56 +0200 (CEST)

Hi!

This is version 4 of the reworked parallel bringup series. Version 3 can be
found here:

   https://lore.kernel.org/lkml/20230508181633.089804905@linutronix.de

This is just a reiteration to address the following details:

  1) Address review feedback (Peter Zijlstra)

  2) Fix a MIPS related build problem (0day)

Other than that there are no changes and the other details are all the same
as in V3 and V2.

It's also available from git:

    git://git.kernel.org/pub/scm/linux/kernel/git/tglx/devel.git hotplug

Diff to V3 below.

Thanks,

	tglx
---
diff --git a/arch/mips/kernel/smp.c b/arch/mips/kernel/smp.c
index f5e0f4235746..90c71d800b59 100644
--- a/arch/mips/kernel/smp.c
+++ b/arch/mips/kernel/smp.c
@@ -690,7 +690,7 @@ void flush_tlb_one(unsigned long vaddr)
 EXPORT_SYMBOL(flush_tlb_page);
 EXPORT_SYMBOL(flush_tlb_one);
 
-#ifdef CONFIG_HOTPLUG_CPU
+#ifdef CONFIG_HOTPLUG_CORE_SYNC_DEAD
 void arch_cpuhp_cleanup_dead_cpu(unsigned int cpu)
 {
 	if (mp_ops->cleanup_dead_cpu)
diff --git a/arch/x86/kernel/head_64.S b/arch/x86/kernel/head_64.S
index 0438802031c3..9cd77d319555 100644
--- a/arch/x86/kernel/head_64.S
+++ b/arch/x86/kernel/head_64.S
@@ -290,8 +290,7 @@ SYM_INNER_LABEL(secondary_startup_64_no_verify, SYM_L_GLOBAL)
 
 	/*  APIC ID not found in the table. Drop the trampoline lock and bail. */
 	movq	trampoline_lock(%rip), %rax
-	lock
-	btrl	$0, (%rax)
+	movl	$0, (%rax)
 
 1:	cli
 	hlt
@@ -320,8 +319,7 @@ SYM_INNER_LABEL(secondary_startup_64_no_verify, SYM_L_GLOBAL)
 	movq	trampoline_lock(%rip), %rax
 	testq	%rax, %rax
 	jz	.Lsetup_gdt
-	lock
-	btrl	$0, (%rax)
+	movl	$0, (%rax)
 
 .Lsetup_gdt:
 	/*
diff --git a/arch/x86/kernel/smpboot.c b/arch/x86/kernel/smpboot.c
index 5caf4897b507..660709e94823 100644
--- a/arch/x86/kernel/smpboot.c
+++ b/arch/x86/kernel/smpboot.c
@@ -161,31 +161,28 @@ static inline void smpboot_restore_warm_reset_vector(void)
 
 }
 
-/*
- * Report back to the Boot Processor during boot time or to the caller processor
- * during CPU online.
- */
-static void smp_callin(void)
+/* Run the next set of setup steps for the upcoming CPU */
+static void ap_starting(void)
 {
 	int cpuid = smp_processor_id();
 
 	/*
-	 * If waken up by an INIT in an 82489DX configuration the alive
-	 * synchronization guarantees we don't get here before an
-	 * INIT_deassert IPI reaches our local APIC, so it is now safe to
-	 * touch our local APIC.
+	 * If woken up by an INIT in an 82489DX configuration the alive
+	 * synchronization guarantees that the CPU does not reach this
+	 * point before an INIT_deassert IPI reaches the local APIC, so it
+	 * is now safe to touch the local APIC.
 	 *
 	 * Set up this CPU, first the APIC, which is probably redundant on
 	 * most boards.
 	 */
 	apic_ap_setup();
 
-	/* Save our processor parameters. */
+	/* Save the processor parameters. */
 	smp_store_cpu_info(cpuid);
 
 	/*
 	 * The topology information must be up to date before
-	 * calibrate_delay() and notify_cpu_starting().
+	 * notify_cpu_starting().
 	 */
 	set_cpu_sibling_map(cpuid);
 
@@ -197,7 +194,7 @@ static void smp_callin(void)
 
 	/*
 	 * This runs the AP through all the cpuhp states to its target
-	 * state (CPUHP_ONLINE in the case of serial bringup).
+	 * state CPUHP_ONLINE.
 	 */
 	notify_cpu_starting(cpuid);
 }
@@ -274,10 +271,7 @@ static void notrace start_secondary(void *unused)
 	rcu_cpu_starting(raw_smp_processor_id());
 	x86_cpuinit.early_percpu_clock_init();
 
-	smp_callin();
-
-	/* Otherwise gcc will move up smp_processor_id() before cpu_init() */
-	barrier();
+	ap_starting();
 
 	/* Check TSC synchronization with the control CPU. */
 	check_tsc_sync_target();
diff --git a/arch/x86/realmode/rm/trampoline_64.S b/arch/x86/realmode/rm/trampoline_64.S
index 2dfb1c400167..c6de4deec746 100644
--- a/arch/x86/realmode/rm/trampoline_64.S
+++ b/arch/x86/realmode/rm/trampoline_64.S
@@ -40,17 +40,13 @@
 .macro LOAD_REALMODE_ESP
 	/*
 	 * Make sure only one CPU fiddles with the realmode stack
-	 */
+	*/
 .Llock_rm\@:
-	btl	$0, tr_lock
-	jnc	2f
-	pause
-	jmp	.Llock_rm\@
+        lock btsl       $0, tr_lock
+        jnc             2f
+        pause
+        jmp             .Llock_rm\@
 2:
-	lock
-	btsl	$0, tr_lock
-	jc	.Llock_rm\@
-
 	# Setup stack
 	movl	$rm_stack_end, %esp
 .endm
diff --git a/kernel/cpu.c b/kernel/cpu.c
index 60b4093fae9e..005f863a3d2b 100644
--- a/kernel/cpu.c
+++ b/kernel/cpu.c
@@ -294,14 +294,14 @@ enum cpuhp_sync_state {
  * cpuhp_ap_update_sync_state - Update synchronization state during bringup/teardown
  * @state:	The synchronization state to set
  *
- * No synchronization point. Just update of the synchronization state.
+ * No synchronization point. Just update of the synchronization state, but implies
+ * a full barrier so that the AP changes are visible before the control CPU proceeds.
  */
 static inline void cpuhp_ap_update_sync_state(enum cpuhp_sync_state state)
 {
 	atomic_t *st = this_cpu_ptr(&cpuhp_state.ap_sync_state);
-	int sync = atomic_read(st);
 
-	while (!atomic_try_cmpxchg(st, &sync, state));
+	(void)atomic_xchg(st, state);
 }
 
 void __weak arch_cpuhp_sync_state_poll(void) { cpu_relax(); }
@@ -829,7 +829,11 @@ static int bringup_cpu(unsigned int cpu)
 	/*
 	 * Some architectures have to walk the irq descriptors to
 	 * setup the vector space for the cpu which comes online.
-	 * Prevent irq alloc/free across the bringup.
+	 *
+	 * Prevent irq alloc/free across the bringup by acquiring the
+	 * sparse irq lock. Hold it until the upcoming CPU completes the
+	 * startup in cpuhp_online_idle() which allows to avoid
+	 * intermediate synchronization points in the architecture code.
 	 */
 	irq_lock_sparse();
 



