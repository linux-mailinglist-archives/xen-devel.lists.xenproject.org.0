Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D11DB6F7305
	for <lists+xen-devel@lfdr.de>; Thu,  4 May 2023 21:10:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.529986.825190 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pueLD-0005m4-Mo; Thu, 04 May 2023 19:10:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 529986.825190; Thu, 04 May 2023 19:10:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pueLD-0005VT-2b; Thu, 04 May 2023 19:10:11 +0000
Received: by outflank-mailman (input) for mailman id 529986;
 Thu, 04 May 2023 19:10:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=srgM=AZ=linutronix.de=tglx@srs-se1.protection.inumbo.net>)
 id 1pueDv-00042k-Hl
 for xen-devel@lists.xenproject.org; Thu, 04 May 2023 19:02:39 +0000
Received: from galois.linutronix.de (galois.linutronix.de [193.142.43.55])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3b9b06d7-eaae-11ed-8611-37d641c3527e;
 Thu, 04 May 2023 21:02:36 +0200 (CEST)
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
X-Inumbo-ID: 3b9b06d7-eaae-11ed-8611-37d641c3527e
Message-ID: <20230504185937.584277566@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1683226956;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 references:references; bh=wTNocxrIkrZERW1CgHrOxDfBd1NuTsgJS4AJ8mYPyyQ=;
	b=Mi46V8eHgoltNQxPJmnbu9i1N0WqNbjlBS5gXzUQdYuzDGSlRAwFIn42Fl4qTDQ9tpMOpi
	9pMD9eqFIhnqecwmKQOcPdssVAfxr98Ufnj8kPfEnna6Jg1FJPiFDXjB5qyYPeKOEBzagH
	d9bGKI26ZnIO1dmzo62pzKDwF621ZdxsTsNqH8faar1/6RQwLMfz9EzVFpDrERESz08UzT
	RKiX6TWVgbEvDpDMLz5ptMwZldZAxWrvz613h9Whj+rnlmmRseJTa9scp2XVHyZRgXYYx9
	W9B8x3jWUGKujnEYbsdrx7KzjQ+swT2YMyT9UZUBAmo9KzwEdkHLM2GZWs0XOQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1683226956;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 references:references; bh=wTNocxrIkrZERW1CgHrOxDfBd1NuTsgJS4AJ8mYPyyQ=;
	b=4wN87waBqOWq8wTSM62nHwIaB3nHKF5Odvy83jhqjVG4mxeKOSh6qxwJk2zaru4HlpMduu
	ieIS3XjNdw5x/MBw==
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
Subject:
 [patch V2 23/38] csky/smp: Switch to hotplug core state synchronization
References: <20230504185733.126511787@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Date: Thu,  4 May 2023 21:02:35 +0200 (CEST)

From: Thomas Gleixner <tglx@linutronix.de>

Switch to the CPU hotplug core state tracking and synchronization
mechanim. No functional change intended.

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
Cc: Guo Ren <guoren@kernel.org>
Cc: linux-csky@vger.kernel.org

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


