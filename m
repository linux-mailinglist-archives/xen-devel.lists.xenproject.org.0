Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 474CF7010D4
	for <lists+xen-devel@lfdr.de>; Fri, 12 May 2023 23:17:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.533965.831139 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pxa8s-0000xs-Af; Fri, 12 May 2023 21:17:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 533965.831139; Fri, 12 May 2023 21:17:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pxa8s-0000rM-3O; Fri, 12 May 2023 21:17:34 +0000
Received: by outflank-mailman (input) for mailman id 533965;
 Fri, 12 May 2023 21:17:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5PQu=BB=linutronix.de=tglx@srs-se1.protection.inumbo.net>)
 id 1pxZzJ-0004FP-MU
 for xen-devel@lists.xenproject.org; Fri, 12 May 2023 21:07:41 +0000
Received: from galois.linutronix.de (galois.linutronix.de [193.142.43.55])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 08144d87-f109-11ed-b229-6b7b168915f2;
 Fri, 12 May 2023 23:07:41 +0200 (CEST)
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
X-Inumbo-ID: 08144d87-f109-11ed-b229-6b7b168915f2
Message-ID: <20230512205256.916055844@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1683925660;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 references:references; bh=3WyGAeXCoINo+ZjbtqDSmG4Uv4XxBoW1eRT13EQq0fk=;
	b=gCuo784jqFHJl8ajBn8394w4OmHWarWHua689soLfocU0hu6yonNTwuMrKteuZS5UiIuEV
	qrcv15f4Q6TokbWN0YfdK3MSd6z8xiHfnEZzev7CF61wRptMWuiL7c2cva2fdafmy4x44i
	QLCrGnHJHlwNB/wrQX3E9sCIWLmnibPYc8f6Fvn0Mhtkx8DzedCkReA25Zy2fK9LabrFWb
	x1UPFk0hgEJqdWWpnRwgFxJ1i3v5p9suQyaN5MHQM1jUq9DQq3rPXVvibiH0XDHv/RMwo0
	mWl2Aksb+Mjpq0yv8/Ii5IfUB3vzQQo6B2UpFf/trJXJtP52QvDOQWDArAV10Q==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1683925660;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 references:references; bh=3WyGAeXCoINo+ZjbtqDSmG4Uv4XxBoW1eRT13EQq0fk=;
	b=LWXqEciaP4I0I25ywyzxuHHtRRVAY1D7DccVqnOk2GJSZvUntz/BBxlff7vjipNfXjw8l7
	MDKU/BWHM78qyUDA==
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
 Ross Philipson <ross.philipson@oracle.com>,
 Palmer Dabbelt <palmer@rivosinc.com>
Subject: [patch V4 27/37] riscv: Switch to hotplug core state synchronization
References: <20230512203426.452963764@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Date: Fri, 12 May 2023 23:07:40 +0200 (CEST)

From: Thomas Gleixner <tglx@linutronix.de>

Switch to the CPU hotplug core state tracking and synchronization
mechanim. No functional change intended.

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
Tested-by: Michael Kelley <mikelley@microsoft.com>
Acked-by: Palmer Dabbelt <palmer@rivosinc.com>
---
 arch/riscv/Kconfig              |    1 +
 arch/riscv/include/asm/smp.h    |    2 +-
 arch/riscv/kernel/cpu-hotplug.c |   14 +++++++-------
 3 files changed, 9 insertions(+), 8 deletions(-)
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -122,6 +122,7 @@ config RISCV
 	select HAVE_RSEQ
 	select HAVE_STACKPROTECTOR
 	select HAVE_SYSCALL_TRACEPOINTS
+	select HOTPLUG_CORE_SYNC_DEAD if HOTPLUG_CPU
 	select IRQ_DOMAIN
 	select IRQ_FORCED_THREADING
 	select KASAN_VMALLOC if KASAN
--- a/arch/riscv/include/asm/smp.h
+++ b/arch/riscv/include/asm/smp.h
@@ -70,7 +70,7 @@ asmlinkage void smp_callin(void);
 
 #if defined CONFIG_HOTPLUG_CPU
 int __cpu_disable(void);
-void __cpu_die(unsigned int cpu);
+static inline void __cpu_die(unsigned int cpu) { }
 #endif /* CONFIG_HOTPLUG_CPU */
 
 #else
--- a/arch/riscv/kernel/cpu-hotplug.c
+++ b/arch/riscv/kernel/cpu-hotplug.c
@@ -8,6 +8,7 @@
 #include <linux/sched.h>
 #include <linux/err.h>
 #include <linux/irq.h>
+#include <linux/cpuhotplug.h>
 #include <linux/cpu.h>
 #include <linux/sched/hotplug.h>
 #include <asm/irq.h>
@@ -49,17 +50,15 @@ int __cpu_disable(void)
 	return ret;
 }
 
+#ifdef CONFIG_HOTPLUG_CPU
 /*
- * Called on the thread which is asking for a CPU to be shutdown.
+ * Called on the thread which is asking for a CPU to be shutdown, if the
+ * CPU reported dead to the hotplug core.
  */
-void __cpu_die(unsigned int cpu)
+void arch_cpuhp_cleanup_dead_cpu(unsigned int cpu)
 {
 	int ret = 0;
 
-	if (!cpu_wait_death(cpu, 5)) {
-		pr_err("CPU %u: didn't die\n", cpu);
-		return;
-	}
 	pr_notice("CPU%u: off\n", cpu);
 
 	/* Verify from the firmware if the cpu is really stopped*/
@@ -76,9 +75,10 @@ void __noreturn arch_cpu_idle_dead(void)
 {
 	idle_task_exit();
 
-	(void)cpu_report_death();
+	cpuhp_ap_report_dead();
 
 	cpu_ops[smp_processor_id()]->cpu_stop();
 	/* It should never reach here */
 	BUG();
 }
+#endif




