Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A4730701035
	for <lists+xen-devel@lfdr.de>; Fri, 12 May 2023 23:07:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.533920.831040 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pxZz0-0000Et-1m; Fri, 12 May 2023 21:07:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 533920.831040; Fri, 12 May 2023 21:07:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pxZyz-00007K-Q1; Fri, 12 May 2023 21:07:21 +0000
Received: by outflank-mailman (input) for mailman id 533920;
 Fri, 12 May 2023 21:07:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5PQu=BB=linutronix.de=tglx@srs-se1.protection.inumbo.net>)
 id 1pxZyx-0004FP-Ad
 for xen-devel@lists.xenproject.org; Fri, 12 May 2023 21:07:19 +0000
Received: from galois.linutronix.de (galois.linutronix.de [193.142.43.55])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id faab64fd-f108-11ed-b229-6b7b168915f2;
 Fri, 12 May 2023 23:07:18 +0200 (CEST)
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
X-Inumbo-ID: faab64fd-f108-11ed-b229-6b7b168915f2
Message-ID: <20230512205256.148255496@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1683925638;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 references:references; bh=InZPVVmeEePOxGmqWQGUV6XuxxQh3/m9otIbiRiszwU=;
	b=uFfds7mph6cSiXSh6HRHOhxz3QiI1I/G0oy4nU6wsamawNsp4y33wqQj2P2/ZZZq5TzErm
	P87k2m6ViGcmmyQjFqg5ZdG0v1+yc1F5oiwojzlLt2nBOxzNdmBLhT1vTcDTtEXKonfGXr
	bYpsNXmQl1MSuCdbaM9TtiuEz77gYzdG98tHSIcLcmERpaTowK6K4gPRU+YYaJVv9v5LiL
	v8epnr0nAY01obW4WKRBIziEyjsoX5x9wxUQ9rvuVeF34k+67u/mdE64pmL1vHsRQ73lvC
	VrYHgd1WIw63x42ClwSD5+jVlRXy0HbeNAyi4ur5Lncniu66hjKh4gNUmpYBvQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1683925638;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 references:references; bh=InZPVVmeEePOxGmqWQGUV6XuxxQh3/m9otIbiRiszwU=;
	b=WGrbLbvy26+fMWG16p8ngiAMfUOAs6HPlstKKf3BN4q4Sg+vviA7h7o2vQ7SLWzvkmFDzQ
	MTBm5QuQ57VULiAg==
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
Subject:
 [patch V4 13/37] x86/smpboot: Make TSC synchronization function call based
References: <20230512203426.452963764@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Date: Fri, 12 May 2023 23:07:17 +0200 (CEST)

From: Thomas Gleixner <tglx@linutronix.de>

Spin-waiting on the control CPU until the AP reaches the TSC
synchronization is just a waste especially in the case that there is no
synchronization required.

As the synchronization has to run with interrupts disabled the control CPU
part can just be done from a SMP function call. The upcoming AP issues that
call async only in the case that synchronization is required.

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
Tested-by: Michael Kelley <mikelley@microsoft.com>
---
 arch/x86/include/asm/tsc.h |    2 --
 arch/x86/kernel/smpboot.c  |   20 +++-----------------
 arch/x86/kernel/tsc_sync.c |   36 +++++++++++-------------------------
 3 files changed, 14 insertions(+), 44 deletions(-)

--- a/arch/x86/include/asm/tsc.h
+++ b/arch/x86/include/asm/tsc.h
@@ -55,12 +55,10 @@ extern bool tsc_async_resets;
 #ifdef CONFIG_X86_TSC
 extern bool tsc_store_and_check_tsc_adjust(bool bootcpu);
 extern void tsc_verify_tsc_adjust(bool resume);
-extern void check_tsc_sync_source(int cpu);
 extern void check_tsc_sync_target(void);
 #else
 static inline bool tsc_store_and_check_tsc_adjust(bool bootcpu) { return false; }
 static inline void tsc_verify_tsc_adjust(bool resume) { }
-static inline void check_tsc_sync_source(int cpu) { }
 static inline void check_tsc_sync_target(void) { }
 #endif
 
--- a/arch/x86/kernel/smpboot.c
+++ b/arch/x86/kernel/smpboot.c
@@ -275,11 +275,7 @@ static void notrace start_secondary(void
 	 */
 	smp_callin();
 
-	/*
-	 * Check TSC synchronization with the control CPU, which will do
-	 * its part of this from wait_cpu_online(), making it an implicit
-	 * synchronization point.
-	 */
+	/* Check TSC synchronization with the control CPU. */
 	check_tsc_sync_target();
 
 	/*
@@ -1141,21 +1137,11 @@ static void wait_cpu_callin(unsigned int
 }
 
 /*
- * Bringup step four: Synchronize the TSC and wait for the target AP
- * to reach set_cpu_online() in start_secondary().
+ * Bringup step four: Wait for the target AP to reach set_cpu_online() in
+ * start_secondary().
  */
 static void wait_cpu_online(unsigned int cpu)
 {
-	unsigned long flags;
-
-	/*
-	 * Check TSC synchronization with the AP (keep irqs disabled
-	 * while doing so):
-	 */
-	local_irq_save(flags);
-	check_tsc_sync_source(cpu);
-	local_irq_restore(flags);
-
 	/*
 	 * Wait for the AP to mark itself online, so the core caller
 	 * can drop sparse_irq_lock.
--- a/arch/x86/kernel/tsc_sync.c
+++ b/arch/x86/kernel/tsc_sync.c
@@ -245,7 +245,6 @@ bool tsc_store_and_check_tsc_adjust(bool
  */
 static atomic_t start_count;
 static atomic_t stop_count;
-static atomic_t skip_test;
 static atomic_t test_runs;
 
 /*
@@ -344,21 +343,14 @@ static inline unsigned int loop_timeout(
 }
 
 /*
- * Source CPU calls into this - it waits for the freshly booted
- * target CPU to arrive and then starts the measurement:
+ * The freshly booted CPU initiates this via an async SMP function call.
  */
-void check_tsc_sync_source(int cpu)
+static void check_tsc_sync_source(void *__cpu)
 {
+	unsigned int cpu = (unsigned long)__cpu;
 	int cpus = 2;
 
 	/*
-	 * No need to check if we already know that the TSC is not
-	 * synchronized or if we have no TSC.
-	 */
-	if (unsynchronized_tsc())
-		return;
-
-	/*
 	 * Set the maximum number of test runs to
 	 *  1 if the CPU does not provide the TSC_ADJUST MSR
 	 *  3 if the MSR is available, so the target can try to adjust
@@ -368,16 +360,9 @@ void check_tsc_sync_source(int cpu)
 	else
 		atomic_set(&test_runs, 3);
 retry:
-	/*
-	 * Wait for the target to start or to skip the test:
-	 */
-	while (atomic_read(&start_count) != cpus - 1) {
-		if (atomic_read(&skip_test) > 0) {
-			atomic_set(&skip_test, 0);
-			return;
-		}
+	/* Wait for the target to start. */
+	while (atomic_read(&start_count) != cpus - 1)
 		cpu_relax();
-	}
 
 	/*
 	 * Trigger the target to continue into the measurement too:
@@ -397,14 +382,14 @@ void check_tsc_sync_source(int cpu)
 	if (!nr_warps) {
 		atomic_set(&test_runs, 0);
 
-		pr_debug("TSC synchronization [CPU#%d -> CPU#%d]: passed\n",
+		pr_debug("TSC synchronization [CPU#%d -> CPU#%u]: passed\n",
 			smp_processor_id(), cpu);
 
 	} else if (atomic_dec_and_test(&test_runs) || random_warps) {
 		/* Force it to 0 if random warps brought us here */
 		atomic_set(&test_runs, 0);
 
-		pr_warn("TSC synchronization [CPU#%d -> CPU#%d]:\n",
+		pr_warn("TSC synchronization [CPU#%d -> CPU#%u]:\n",
 			smp_processor_id(), cpu);
 		pr_warn("Measured %Ld cycles TSC warp between CPUs, "
 			"turning off TSC clock.\n", max_warp);
@@ -457,11 +442,12 @@ void check_tsc_sync_target(void)
 	 * SoCs the TSC is frequency synchronized, but still the TSC ADJUST
 	 * register might have been wreckaged by the BIOS..
 	 */
-	if (tsc_store_and_check_tsc_adjust(false) || tsc_clocksource_reliable) {
-		atomic_inc(&skip_test);
+	if (tsc_store_and_check_tsc_adjust(false) || tsc_clocksource_reliable)
 		return;
-	}
 
+	/* Kick the control CPU into the TSC synchronization function */
+	smp_call_function_single(cpumask_first(cpu_online_mask), check_tsc_sync_source,
+				 (unsigned long *)(unsigned long)cpu, 0);
 retry:
 	/*
 	 * Register this CPU's participation and wait for the


