Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 685E57010D5
	for <lists+xen-devel@lfdr.de>; Fri, 12 May 2023 23:17:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.533980.831174 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pxa95-00029n-Oo; Fri, 12 May 2023 21:17:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 533980.831174; Fri, 12 May 2023 21:17:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pxa95-00023H-IQ; Fri, 12 May 2023 21:17:47 +0000
Received: by outflank-mailman (input) for mailman id 533980;
 Fri, 12 May 2023 21:17:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5PQu=BB=linutronix.de=tglx@srs-se1.protection.inumbo.net>)
 id 1pxZzH-0004F7-OI
 for xen-devel@lists.xenproject.org; Fri, 12 May 2023 21:07:39 +0000
Received: from galois.linutronix.de (galois.linutronix.de [193.142.43.55])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 061b2b10-f109-11ed-8611-37d641c3527e;
 Fri, 12 May 2023 23:07:37 +0200 (CEST)
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
X-Inumbo-ID: 061b2b10-f109-11ed-8611-37d641c3527e
Message-ID: <20230512205256.803238859@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1683925657;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 references:references; bh=rAPxMfSCDqj/Bjl0E5i43Rztw8XcTG6Vczquydkj10k=;
	b=04qk/ZlFjsriOLCzUaO7G07gFfmf9cSDBVT9NtU+7tbOW/QWdBVDcKShT6npiFQr/WoEqd
	MWM0qCFWPxUFSHYUrnMv9aACc/F3hdH3zfjikD8cHjZGdvidCoMb/gZfrjULtp7/kLfW7o
	CJ3O88hhpiiQ/Ujm8sP+z35M3A8XzKzmV6u3fco0BDP/rCOeVluL2IgmeQrB1WxI+dCQ43
	38SrSq1kWMlzFo7HbfS1n+laBkEfc8Mx7KbtB2PLFCmjg/cgyNhU10VzWgLsswr/hyfi1r
	pEUYhkg8h2ej/QnNoIbv74MAldzPPnu0cIr7fw1oqsjpqV/mRP7E7ugEdZrzkg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1683925657;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 references:references; bh=rAPxMfSCDqj/Bjl0E5i43Rztw8XcTG6Vczquydkj10k=;
	b=r1jGn7arz7wULDV9xkDaSal93zGzOXolBlXuS8ZVTApcC3PxDcswB0dG43ZqLydHIXZmQH
	Dpdh36zUoxzN3dDg==
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
 [patch V4 25/37] MIPS: SMP_CPS: Switch to hotplug core state synchronization
References: <20230512203426.452963764@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Date: Fri, 12 May 2023 23:07:37 +0200 (CEST)

From: Thomas Gleixner <tglx@linutronix.de>

Switch to the CPU hotplug core state tracking and synchronization
mechanim. This unfortunately requires to add dead reporting to the non CPS
platforms as CPS is the only user, but it allows an overall consolidation
of this functionality.

No functional change intended.

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
Tested-by: Michael Kelley <mikelley@microsoft.com>
---
 arch/mips/Kconfig               |    1 +
 arch/mips/cavium-octeon/smp.c   |    1 +
 arch/mips/include/asm/smp-ops.h |    1 +
 arch/mips/kernel/smp-bmips.c    |    1 +
 arch/mips/kernel/smp-cps.c      |   14 +++++---------
 arch/mips/kernel/smp.c          |    8 ++++++++
 arch/mips/loongson64/smp.c      |    1 +
 7 files changed, 18 insertions(+), 9 deletions(-)


--- a/arch/mips/Kconfig
+++ b/arch/mips/Kconfig
@@ -2285,6 +2285,7 @@ config MIPS_CPS
 	select MIPS_CM
 	select MIPS_CPS_PM if HOTPLUG_CPU
 	select SMP
+	select HOTPLUG_CORE_SYNC_DEAD if HOTPLUG_CPU
 	select SYNC_R4K if (CEVT_R4K || CSRC_R4K)
 	select SYS_SUPPORTS_HOTPLUG_CPU
 	select SYS_SUPPORTS_SCHED_SMT if CPU_MIPSR6
--- a/arch/mips/cavium-octeon/smp.c
+++ b/arch/mips/cavium-octeon/smp.c
@@ -345,6 +345,7 @@ void play_dead(void)
 	int cpu = cpu_number_map(cvmx_get_core_num());
 
 	idle_task_exit();
+	cpuhp_ap_report_dead();
 	octeon_processor_boot = 0xff;
 	per_cpu(cpu_state, cpu) = CPU_DEAD;
 
--- a/arch/mips/include/asm/smp-ops.h
+++ b/arch/mips/include/asm/smp-ops.h
@@ -33,6 +33,7 @@ struct plat_smp_ops {
 #ifdef CONFIG_HOTPLUG_CPU
 	int (*cpu_disable)(void);
 	void (*cpu_die)(unsigned int cpu);
+	void (*cleanup_dead_cpu)(unsigned cpu);
 #endif
 #ifdef CONFIG_KEXEC
 	void (*kexec_nonboot_cpu)(void);
--- a/arch/mips/kernel/smp-bmips.c
+++ b/arch/mips/kernel/smp-bmips.c
@@ -392,6 +392,7 @@ static void bmips_cpu_die(unsigned int c
 void __ref play_dead(void)
 {
 	idle_task_exit();
+	cpuhp_ap_report_dead();
 
 	/* flush data cache */
 	_dma_cache_wback_inv(0, ~0);
--- a/arch/mips/kernel/smp-cps.c
+++ b/arch/mips/kernel/smp-cps.c
@@ -503,8 +503,7 @@ void play_dead(void)
 		}
 	}
 
-	/* This CPU has chosen its way out */
-	(void)cpu_report_death();
+	cpuhp_ap_report_dead();
 
 	cps_shutdown_this_cpu(cpu_death);
 
@@ -527,7 +526,9 @@ static void wait_for_sibling_halt(void *
 	} while (!(halted & TCHALT_H));
 }
 
-static void cps_cpu_die(unsigned int cpu)
+static void cps_cpu_die(unsigned int cpu) { }
+
+static void cps_cleanup_dead_cpu(unsigned cpu)
 {
 	unsigned core = cpu_core(&cpu_data[cpu]);
 	unsigned int vpe_id = cpu_vpe_id(&cpu_data[cpu]);
@@ -535,12 +536,6 @@ static void cps_cpu_die(unsigned int cpu
 	unsigned stat;
 	int err;
 
-	/* Wait for the cpu to choose its way out */
-	if (!cpu_wait_death(cpu, 5)) {
-		pr_err("CPU%u: didn't offline\n", cpu);
-		return;
-	}
-
 	/*
 	 * Now wait for the CPU to actually offline. Without doing this that
 	 * offlining may race with one or more of:
@@ -624,6 +619,7 @@ static const struct plat_smp_ops cps_smp
 #ifdef CONFIG_HOTPLUG_CPU
 	.cpu_disable		= cps_cpu_disable,
 	.cpu_die		= cps_cpu_die,
+	.cleanup_dead_cpu	= cps_cleanup_dead_cpu,
 #endif
 #ifdef CONFIG_KEXEC
 	.kexec_nonboot_cpu	= cps_kexec_nonboot_cpu,
--- a/arch/mips/kernel/smp.c
+++ b/arch/mips/kernel/smp.c
@@ -690,6 +690,14 @@ void flush_tlb_one(unsigned long vaddr)
 EXPORT_SYMBOL(flush_tlb_page);
 EXPORT_SYMBOL(flush_tlb_one);
 
+#ifdef CONFIG_HOTPLUG_CORE_SYNC_DEAD
+void arch_cpuhp_cleanup_dead_cpu(unsigned int cpu)
+{
+	if (mp_ops->cleanup_dead_cpu)
+		mp_ops->cleanup_dead_cpu(cpu);
+}
+#endif
+
 #ifdef CONFIG_GENERIC_CLOCKEVENTS_BROADCAST
 
 static void tick_broadcast_callee(void *info)
--- a/arch/mips/loongson64/smp.c
+++ b/arch/mips/loongson64/smp.c
@@ -775,6 +775,7 @@ void play_dead(void)
 	void (*play_dead_at_ckseg1)(int *);
 
 	idle_task_exit();
+	cpuhp_ap_report_dead();
 
 	prid_imp = read_c0_prid() & PRID_IMP_MASK;
 	prid_rev = read_c0_prid() & PRID_REV_MASK;


