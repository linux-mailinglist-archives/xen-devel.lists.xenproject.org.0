Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 136FF6FB798
	for <lists+xen-devel@lfdr.de>; Mon,  8 May 2023 21:47:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.531785.827687 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pw6pc-0005gx-Uo; Mon, 08 May 2023 19:47:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 531785.827687; Mon, 08 May 2023 19:47:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pw6pc-0005Y7-MF; Mon, 08 May 2023 19:47:36 +0000
Received: by outflank-mailman (input) for mailman id 531785;
 Mon, 08 May 2023 19:47:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=49Re=A5=linutronix.de=tglx@srs-se1.protection.inumbo.net>)
 id 1pw6mE-0004Y5-Hm
 for xen-devel@lists.xenproject.org; Mon, 08 May 2023 19:44:06 +0000
Received: from galois.linutronix.de (galois.linutronix.de [193.142.43.55])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b0758392-edd8-11ed-8611-37d641c3527e;
 Mon, 08 May 2023 21:44:04 +0200 (CEST)
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
X-Inumbo-ID: b0758392-edd8-11ed-8611-37d641c3527e
Message-ID: <20230508185218.525901017@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1683575044;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 references:references; bh=p1bTZcu/tFFl7ZFXZHrWEevEsbPzi9oWCJbzAEjoRvU=;
	b=ro1G7PpJ83X6+w8xekc1Z+eWqsLGpjtOzo4PP6r5XIV4J/QSzXaoSgHSrgfE8UoFXJAtVZ
	ddPmGBBvhizIfL5MKQAHxiueGiD7SaKd8SVF5xoPIMD87HT7xLkes0Mcannkaqabpdim7S
	3JJn+0HsTPLVLlf7o4k4xojJ0ha9PM09J1xPq/22Ii89ON2+9r5obP9K+fx8VKe6+Ofd/g
	p7PvjLDXUy1B93tSth06IG3OPn/RKQSfM5HzHrKJn2PQ/N/AB81EoHej+RLOqJotuRy5u1
	RqZ9dU8p9XQKefuuGDTYHgGekuJbpsfN6iEzcsmbpxKC9VJxb72TeG+/ixZKCA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1683575044;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 references:references; bh=p1bTZcu/tFFl7ZFXZHrWEevEsbPzi9oWCJbzAEjoRvU=;
	b=+JfvJZKkBGEOkJ0Rz4Oc2ENXcMdWjC9X0M7zDLfKJYbzqf6/zAZPUYwnaqTXpxX83jhfM1
	Eek8gh5PJeZxIPBw==
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
Subject: [patch v3 23/36] [patch V2 23/38] csky/smp: Switch to hotplug core
 state synchronization
References: <20230508181633.089804905@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Date: Mon,  8 May 2023 21:44:04 +0200 (CEST)

From: Thomas Gleixner <tglx@linutronix.de>

Switch to the CPU hotplug core state tracking and synchronization
mechanim. No functional change intended.

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
Tested-by: Michael Kelley <mikelley@microsoft.com>


---
 arch/csky/Kconfig           |    1 +
 arch/csky/include/asm/smp.h |    2 +-
 arch/csky/kernel/smp.c      |    8 ++------
 3 files changed, 4 insertions(+), 7 deletions(-)
---

--- a/arch/csky/Kconfig
+++ b/arch/csky/Kconfig
@@ -96,6 +96,7 @@ config CSKY
 	select HAVE_REGS_AND_STACK_ACCESS_API
 	select HAVE_STACKPROTECTOR
 	select HAVE_SYSCALL_TRACEPOINTS
+	select HOTPLUG_CORE_SYNC_DEAD if HOTPLUG_CPU
 	select MAY_HAVE_SPARSE_IRQ
 	select MODULES_USE_ELF_RELA if MODULES
 	select OF
--- a/arch/csky/include/asm/smp.h
+++ b/arch/csky/include/asm/smp.h
@@ -23,7 +23,7 @@ void __init set_send_ipi(void (*func)(co
 
 int __cpu_disable(void);
 
-void __cpu_die(unsigned int cpu);
+static inline void __cpu_die(unsigned int cpu) { }
 
 #endif /* CONFIG_SMP */
 
--- a/arch/csky/kernel/smp.c
+++ b/arch/csky/kernel/smp.c
@@ -291,12 +291,8 @@ int __cpu_disable(void)
 	return 0;
 }
 
-void __cpu_die(unsigned int cpu)
+void arch_cpuhp_cleanup_dead_cpu(unsigned int cpu)
 {
-	if (!cpu_wait_death(cpu, 5)) {
-		pr_crit("CPU%u: shutdown failed\n", cpu);
-		return;
-	}
 	pr_notice("CPU%u: shutdown\n", cpu);
 }
 
@@ -304,7 +300,7 @@ void __noreturn arch_cpu_idle_dead(void)
 {
 	idle_task_exit();
 
-	cpu_report_death();
+	cpuhp_ap_report_dead();
 
 	while (!secondary_stack)
 		arch_cpu_idle();



