Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 121346F72F5
	for <lists+xen-devel@lfdr.de>; Thu,  4 May 2023 21:09:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.529928.824996 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pueKS-0005h5-6g; Thu, 04 May 2023 19:09:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 529928.824996; Thu, 04 May 2023 19:09:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pueKS-0005eT-37; Thu, 04 May 2023 19:09:24 +0000
Received: by outflank-mailman (input) for mailman id 529928;
 Thu, 04 May 2023 19:09:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=srgM=AZ=linutronix.de=tglx@srs-se1.protection.inumbo.net>)
 id 1pueEI-00042k-O1
 for xen-devel@lists.xenproject.org; Thu, 04 May 2023 19:03:02 +0000
Received: from galois.linutronix.de (galois.linutronix.de
 [2a0a:51c0:0:12e:550::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4a29c51a-eaae-11ed-8611-37d641c3527e;
 Thu, 04 May 2023 21:03:00 +0200 (CEST)
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
X-Inumbo-ID: 4a29c51a-eaae-11ed-8611-37d641c3527e
Message-ID: <20230504185938.393373946@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1683226980;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 references:references; bh=DnnEFfJ8qHS51cV93bPVxAhJn4egJudPWNxPdxHp+6I=;
	b=3Ex1oay3deKBQTCKUX4Ih8IGgIbgjtd18ImqJ1vJckFzp4vqpeCRciYL26XaBXwtGetEt9
	jQYdqvvfPpYi34oU2dU7fjuiZ3WyUQcsrd4BPREXrzjkH9groi0TU6YGHBW08cmpwip9QC
	vnXlEPucLe8Pxu/DAQZhHSJgvAG1br+71W5AkzFErVTB5fdbrjcZJ7I/PMvvfD3nV+Fpt+
	Y9+eS6OIW46jTxBhE1zoqPIcGpnWyrhDXCq+doarlLORorIO2HSYQo2DibMTzYhsGwQ8ko
	wng2jKhRiMwK0oOD7H54yErcCMVtMuv2wW3qjiAj1OaBH6NB6N7JtXkq+JhyKQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1683226980;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 references:references; bh=DnnEFfJ8qHS51cV93bPVxAhJn4egJudPWNxPdxHp+6I=;
	b=6kDZyW5GTa+KS1pHyq0SY7syfYnd6TB6StPbtFwCKnOC1peAStPMetQpfCSqmue8lUL4Wc
	NQ0I2S6hl8MhwzDA==
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
Subject: [patch V2 38/38] x86/smpboot/64: Implement
 arch_cpuhp_init_parallel_bringup() and enable it
References: <20230504185733.126511787@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Date: Thu,  4 May 2023 21:03:00 +0200 (CEST)

From: Thomas Gleixner <tglx@linutronix.de>

Implement the validation function which tells the core code whether
parallel bringup is possible.

The only condition for now is that the kernel does not run in an encrypted
guest as these will trap the RDMSR via #VC, which cannot be handled at that
point in early startup.

There was an earlier variant for AMD-SEV which used the GHBC protocol for
retrieving the APIC ID via CPUID, but there is no guarantee that the
initial APIC ID in CPUID is the same as the real APIC ID. There is no
enforcement from the secure firmware and the hypervisor can assign APIC IDs
as it sees fit as long as the ACPI/MADT table is consistent with that
assignment.

Unfortunately there is no RDMSR GHCB protocol at the moment, so enabling
AMD-SEV guests for parallel startup needs some more thought.

Intel-TDX provides a secure RDMSR hypercall, but supporting that is outside
the scope of this change.

Fixup announce_cpu() as e.g. on Hyper-V CPU1 is the secondary sibling of
CPU0, which makes the @cpu == 1 logic in announce_cpu() fall apart.

[ mikelley: Reported the announce_cpu() fallout

Originally-by: David Woodhouse <dwmw@amazon.co.uk>
Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
---
V2: Fixup announce_cpu() - Michael Kelley
---
 arch/x86/Kconfig             |    3 +
 arch/x86/kernel/cpu/common.c |    6 ---
 arch/x86/kernel/smpboot.c    |   83 ++++++++++++++++++++++++++++++++++++-------
 3 files changed, 73 insertions(+), 19 deletions(-)
---
--- a/arch/x86/Kconfig
+++ b/arch/x86/Kconfig
@@ -274,8 +274,9 @@ config X86
 	select HAVE_UNSTABLE_SCHED_CLOCK
 	select HAVE_USER_RETURN_NOTIFIER
 	select HAVE_GENERIC_VDSO
+	select HOTPLUG_PARALLEL			if SMP && X86_64
 	select HOTPLUG_SMT			if SMP
-	select HOTPLUG_SPLIT_STARTUP		if SMP
+	select HOTPLUG_SPLIT_STARTUP		if SMP && X86_32
 	select IRQ_FORCED_THREADING
 	select NEED_PER_CPU_EMBED_FIRST_CHUNK
 	select NEED_PER_CPU_PAGE_FIRST_CHUNK
--- a/arch/x86/kernel/cpu/common.c
+++ b/arch/x86/kernel/cpu/common.c
@@ -2128,11 +2128,7 @@ static inline void setup_getcpu(int cpu)
 }
 
 #ifdef CONFIG_X86_64
-static inline void ucode_cpu_init(int cpu)
-{
-	if (cpu)
-		load_ucode_ap();
-}
+static inline void ucode_cpu_init(int cpu) { }
 
 static inline void tss_setup_ist(struct tss_struct *tss)
 {
--- a/arch/x86/kernel/smpboot.c
+++ b/arch/x86/kernel/smpboot.c
@@ -58,6 +58,7 @@
 #include <linux/overflow.h>
 #include <linux/stackprotector.h>
 #include <linux/cpuhotplug.h>
+#include <linux/mc146818rtc.h>
 
 #include <asm/acpi.h>
 #include <asm/cacheinfo.h>
@@ -75,7 +76,7 @@
 #include <asm/fpu/api.h>
 #include <asm/setup.h>
 #include <asm/uv/uv.h>
-#include <linux/mc146818rtc.h>
+#include <asm/microcode.h>
 #include <asm/i8259.h>
 #include <asm/misc.h>
 #include <asm/qspinlock.h>
@@ -128,7 +129,6 @@ int arch_update_cpu_topology(void)
 	return retval;
 }
 
-
 static unsigned int smpboot_warm_reset_vector_count;
 
 static inline void smpboot_setup_warm_reset_vector(unsigned long start_eip)
@@ -229,16 +229,43 @@ static void notrace start_secondary(void
 	 */
 	cr4_init();
 
-#ifdef CONFIG_X86_32
-	/* switch away from the initial page table */
-	load_cr3(swapper_pg_dir);
-	__flush_tlb_all();
-#endif
+	/*
+	 * 32-bit specific. 64-bit reaches this code with the correct page
+	 * table established. Yet another historical divergence.
+	 */
+	if (IS_ENABLED(CONFIG_X86_32)) {
+		/* switch away from the initial page table */
+		load_cr3(swapper_pg_dir);
+		__flush_tlb_all();
+	}
+
 	cpu_init_exception_handling();
 
 	/*
-	 * Synchronization point with the hotplug core. Sets the
-	 * synchronization state to ALIVE and waits for the control CPU to
+	 * 32-bit systems load the microcode from the ASM startup code for
+	 * historical reasons.
+	 *
+	 * On 64-bit systems load it before reaching the AP alive
+	 * synchronization point below so it is not part of the full per
+	 * CPU serialized bringup part when "parallel" bringup is enabled.
+	 *
+	 * That's even safe when hyperthreading is enabled in the CPU as
+	 * the core code starts the primary threads first and leaves the
+	 * secondary threads waiting for SIPI. Loading microcode on
+	 * physical cores concurrently is a safe operation.
+	 *
+	 * This covers both the Intel specific issue that concurrent
+	 * microcode loading on SMT siblings must be prohibited and the
+	 * vendor independent issue`that microcode loading which changes
+	 * CPUID, MSRs etc. must be strictly serialized to maintain
+	 * software state correctness.
+	 */
+	if (IS_ENABLED(CONFIG_X86_64))
+		load_ucode_ap();
+
+	/*
+	 * Synchronization point with the hotplug core. Sets this CPUs
+	 * synchronization state to ALIVE and spin-waits for the control CPU to
 	 * release this CPU for further bringup.
 	 */
 	cpuhp_ap_sync_alive();
@@ -934,10 +961,10 @@ static void announce_cpu(int cpu, int ap
 	if (!node_width)
 		node_width = num_digits(num_possible_nodes()) + 1; /* + '#' */
 
-	if (cpu == 1)
-		printk(KERN_INFO "x86: Booting SMP configuration:\n");
-
 	if (system_state < SYSTEM_RUNNING) {
+		if (num_online_cpus() == 1)
+			pr_info("x86: Booting SMP configuration:\n");
+
 		if (node != current_node) {
 			if (current_node > (-1))
 				pr_cont("\n");
@@ -948,7 +975,7 @@ static void announce_cpu(int cpu, int ap
 		}
 
 		/* Add padding for the BSP */
-		if (cpu == 1)
+		if (num_online_cpus() == 1)
 			pr_cont("%*s", width + 1, " ");
 
 		pr_cont("%*s#%d", width - num_digits(cpu), " ", cpu);
@@ -1242,6 +1269,36 @@ void __init smp_prepare_cpus_common(void
 	set_cpu_sibling_map(0);
 }
 
+#ifdef CONFIG_X86_64
+/* Establish whether parallel bringup can be supported. */
+bool __init arch_cpuhp_init_parallel_bringup(void)
+{
+	/*
+	 * Encrypted guests require special handling. They enforce X2APIC
+	 * mode but the RDMSR to read the APIC ID is intercepted and raises
+	 * #VC or #VE which cannot be handled in the early startup code.
+	 *
+	 * AMD-SEV does not provide a RDMSR GHCB protocol so the early
+	 * startup code cannot directly communicate with the secure
+	 * firmware. The alternative solution to retrieve the APIC ID via
+	 * CPUID(0xb), which is covered by the GHCB protocol, is not viable
+	 * either because there is no enforcement of the CPUID(0xb)
+	 * provided "initial" APIC ID to be the same as the real APIC ID.
+	 *
+	 * Intel-TDX has a secure RDMSR hypercall, but that needs to be
+	 * implemented seperately in the low level startup ASM code.
+	 */
+	if (cc_platform_has(CC_ATTR_GUEST_STATE_ENCRYPT)) {
+		pr_info("Parallel CPU startup disabled due to guest state encryption\n");
+		return false;
+	}
+
+	smpboot_control = STARTUP_READ_APICID;
+	pr_debug("Parallel CPU startup enabled: 0x%08x\n", smpboot_control);
+	return true;
+}
+#endif
+
 /*
  * Prepare for SMP bootup.
  * @max_cpus: configured maximum number of CPUs, It is a legacy parameter


