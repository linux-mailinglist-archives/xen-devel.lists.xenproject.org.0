Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F3406E2D20
	for <lists+xen-devel@lfdr.de>; Sat, 15 Apr 2023 01:44:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.521270.809817 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pnT5k-0003bq-A8; Fri, 14 Apr 2023 23:44:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 521270.809817; Fri, 14 Apr 2023 23:44:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pnT5k-0003VW-5Q; Fri, 14 Apr 2023 23:44:32 +0000
Received: by outflank-mailman (input) for mailman id 521270;
 Fri, 14 Apr 2023 23:44:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ZCOw=AF=linutronix.de=tglx@srs-se1.protection.inumbo.net>)
 id 1pnT5i-0000zb-Kd
 for xen-devel@lists.xenproject.org; Fri, 14 Apr 2023 23:44:30 +0000
Received: from galois.linutronix.de (galois.linutronix.de [193.142.43.55])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4c06e6cc-db1e-11ed-8611-37d641c3527e;
 Sat, 15 Apr 2023 01:44:29 +0200 (CEST)
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
X-Inumbo-ID: 4c06e6cc-db1e-11ed-8611-37d641c3527e
Message-ID: <20230414232309.760351424@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1681515868;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 references:references; bh=38vdbwHqBLIqPwRw5MqT+R7Ll28v39Ia/30h9IRZRBU=;
	b=yar8EeigYdFMdQYEGUNE3USYwkYHZzKxUot+Z73dH900LQv7+iVPCq5P8CJivgiAUZW2OK
	5b+Jgl5VWXA9zRjgQQpg9e2anhCtGANLrAGNoR9f6XmdTQzBRqsWpTTXFoZzvs8Un4b+Cd
	xQVtcABhcUTk8fKAr801BiQCOwMb7/BograiZPjfOPVUBCanspJXyCAKU5TMrWkY70q3Vf
	aRByfCqKTLqDcO3ENb28nyzgihvUsSGw62p4CXRy+qfa3By2TlFWN34HGdXMCTwJbS74gF
	n5JJnrI5zbLFVOG1tHdxNahBhTnqNGAQsLPfDS+q8FOpyMYAyy0JyNMiAMEw8w==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1681515868;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 references:references; bh=38vdbwHqBLIqPwRw5MqT+R7Ll28v39Ia/30h9IRZRBU=;
	b=MftkEADdginftZmZ+/cCkpBXX8KUjRl1mx3aoGgqqGTOVFHczgdVkY20eVN/Z+ePOHG5TU
	YFmw4iY8ytDodjDg==
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
Subject: [patch 09/37] x86/smpboot: Get rid of cpu_init_secondary()
References: <20230414225551.858160935@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Date: Sat, 15 Apr 2023 01:44:28 +0200 (CEST)

The synchronization of the AP with the control CPU is a SMP boot problem
and has nothing to do with cpu_init().

Open code cpu_init_secondary() in start_secondary() and move
wait_for_master_cpu() into the SMP boot code.

No functional change.

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
---
 arch/x86/include/asm/processor.h |    1 -
 arch/x86/kernel/cpu/common.c     |   27 ---------------------------
 arch/x86/kernel/smpboot.c        |   24 +++++++++++++++++++-----
 3 files changed, 19 insertions(+), 33 deletions(-)

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
@@ -2122,19 +2122,6 @@ static void dbg_restore_debug_regs(void)
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
@@ -2238,8 +2225,6 @@ void cpu_init(void)
 	struct task_struct *cur = current;
 	int cpu = raw_smp_processor_id();
 
-	wait_for_master_cpu(cpu);
-
 	ucode_cpu_init(cpu);
 
 #ifdef CONFIG_NUMA
@@ -2292,18 +2277,6 @@ void cpu_init(void)
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
 


