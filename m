Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A18A96FB70A
	for <lists+xen-devel@lfdr.de>; Mon,  8 May 2023 21:44:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.531751.827585 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pw6lr-0006XY-OZ; Mon, 08 May 2023 19:43:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 531751.827585; Mon, 08 May 2023 19:43:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pw6lr-0006Uv-IY; Mon, 08 May 2023 19:43:43 +0000
Received: by outflank-mailman (input) for mailman id 531751;
 Mon, 08 May 2023 19:43:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=49Re=A5=linutronix.de=tglx@srs-se1.protection.inumbo.net>)
 id 1pw6lq-0004GB-Gf
 for xen-devel@lists.xenproject.org; Mon, 08 May 2023 19:43:42 +0000
Received: from galois.linutronix.de (galois.linutronix.de [193.142.43.55])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a2c93318-edd8-11ed-b226-6b7b168915f2;
 Mon, 08 May 2023 21:43:41 +0200 (CEST)
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
X-Inumbo-ID: a2c93318-edd8-11ed-b226-6b7b168915f2
Message-ID: <20230508185217.725507622@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1683575021;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 references:references; bh=l2ZAdiTSxc4Ph8TyhAnDuEUhjcNUoY+vPQjmK9rgSOw=;
	b=gaT1OuAZ/GfjuakxTEJ2KYFHHzuQGSX55lDDjTfN7H14JbYbNLMM4m5KEMtJmbQjf5dGd8
	u6xaJZJ4RDdDY8AEhdNSWuCFNXk+TTJsi8/yzR94kBccocw9u25EGL8O6o4TOYanqr+EXt
	NhIFRD+lDCv3rQ1zF9CsAlmwrDH3WUd0arfpWQUXnSr9BmI2oikrsACB3KufetuUHeTXx6
	Dfmr70iicTai9wWJcUCYXfrT+e3fQNAy7f7bAiHZh1hN8Pw4PKOZApdT4wEEG7OYby4pO/
	J0L7EIGZ0mmjG5HI8U9pfnUs9mQdXGK6TXfo6ya7SFw/bbUl1OddNzvQqalhdg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1683575021;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 references:references; bh=l2ZAdiTSxc4Ph8TyhAnDuEUhjcNUoY+vPQjmK9rgSOw=;
	b=DHa8pWb6DR3SZOX4vG2QWSchsl3pME0lzD5CYQrhDWXg/TvCY5mWEc+2tWrjc+r9aOnyjo
	ukEASnIuuQDnS6AQ==
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
Subject: [patch v3 09/36] x86/smpboot: Get rid of cpu_init_secondary()
References: <20230508181633.089804905@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Date: Mon,  8 May 2023 21:43:41 +0200 (CEST)

From: Thomas Gleixner <tglx@linutronix.de>

The synchronization of the AP with the control CPU is a SMP boot problem
and has nothing to do with cpu_init().

Open code cpu_init_secondary() in start_secondary() and move
wait_for_master_cpu() into the SMP boot code.

No functional change.

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
Tested-by: Michael Kelley <mikelley@microsoft.com>


---
 arch/x86/include/asm/processor.h |    1 -
 arch/x86/kernel/cpu/common.c     |   27 ---------------------------
 arch/x86/kernel/smpboot.c        |   24 +++++++++++++++++++-----
 3 files changed, 19 insertions(+), 33 deletions(-)
---

--- a/arch/x86/include/asm/processor.h
+++ b/arch/x86/include/asm/processor.h
@@ -551,7 +551,6 @@ extern void switch_gdt_and_percpu_base(i
 extern void load_direct_gdt(int);
 extern void load_fixmap_gdt(int);
 extern void cpu_init(void);
-extern void cpu_init_secondary(void);
 extern void cpu_init_exception_handling(void);
 extern void cr4_init(void);
 
--- a/arch/x86/kernel/cpu/common.c
+++ b/arch/x86/kernel/cpu/common.c
@@ -2123,19 +2123,6 @@ static void dbg_restore_debug_regs(void)
 #define dbg_restore_debug_regs()
 #endif /* ! CONFIG_KGDB */
 
-static void wait_for_master_cpu(int cpu)
-{
-#ifdef CONFIG_SMP
-	/*
-	 * wait for ACK from master CPU before continuing
-	 * with AP initialization
-	 */
-	WARN_ON(cpumask_test_and_set_cpu(cpu, cpu_initialized_mask));
-	while (!cpumask_test_cpu(cpu, cpu_callout_mask))
-		cpu_relax();
-#endif
-}
-
 static inline void setup_getcpu(int cpu)
 {
 	unsigned long cpudata = vdso_encode_cpunode(cpu, early_cpu_to_node(cpu));
@@ -2239,8 +2226,6 @@ void cpu_init(void)
 	struct task_struct *cur = current;
 	int cpu = raw_smp_processor_id();
 
-	wait_for_master_cpu(cpu);
-
 	ucode_cpu_init(cpu);
 
 #ifdef CONFIG_NUMA
@@ -2293,18 +2278,6 @@ void cpu_init(void)
 	load_fixmap_gdt(cpu);
 }
 
-#ifdef CONFIG_SMP
-void cpu_init_secondary(void)
-{
-	/*
-	 * Relies on the BP having set-up the IDT tables, which are loaded
-	 * on this CPU in cpu_init_exception_handling().
-	 */
-	cpu_init_exception_handling();
-	cpu_init();
-}
-#endif
-
 #ifdef CONFIG_MICROCODE_LATE_LOADING
 /**
  * store_cpu_caps() - Store a snapshot of CPU capabilities
--- a/arch/x86/kernel/smpboot.c
+++ b/arch/x86/kernel/smpboot.c
@@ -220,6 +220,17 @@ static void ap_calibrate_delay(void)
 	cpu_data(smp_processor_id()).loops_per_jiffy = loops_per_jiffy;
 }
 
+static void wait_for_master_cpu(int cpu)
+{
+	/*
+	 * Wait for release by control CPU before continuing with AP
+	 * initialization.
+	 */
+	WARN_ON(cpumask_test_and_set_cpu(cpu, cpu_initialized_mask));
+	while (!cpumask_test_cpu(cpu, cpu_callout_mask))
+		cpu_relax();
+}
+
 /*
  * Activate a secondary processor.
  */
@@ -237,13 +248,16 @@ static void notrace start_secondary(void
 	load_cr3(swapper_pg_dir);
 	__flush_tlb_all();
 #endif
+	cpu_init_exception_handling();
+
 	/*
-	 * Sync point with wait_cpu_initialized(). Before proceeding through
-	 * cpu_init(), the AP will call wait_for_master_cpu() which sets its
-	 * own bit in cpu_initialized_mask and then waits for the BSP to set
-	 * its bit in cpu_callout_mask to release it.
+	 * Sync point with wait_cpu_initialized(). Sets AP in
+	 * cpu_initialized_mask and then waits for the control CPU
+	 * to release it.
 	 */
-	cpu_init_secondary();
+	wait_for_master_cpu(raw_smp_processor_id());
+
+	cpu_init();
 	rcu_cpu_starting(raw_smp_processor_id());
 	x86_cpuinit.early_percpu_clock_init();
 



