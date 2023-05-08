Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4826A6FB7AA
	for <lists+xen-devel@lfdr.de>; Mon,  8 May 2023 21:48:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.531846.827835 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pw6q2-0003iH-U6; Mon, 08 May 2023 19:48:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 531846.827835; Mon, 08 May 2023 19:48:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pw6q2-0003d7-LI; Mon, 08 May 2023 19:48:02 +0000
Received: by outflank-mailman (input) for mailman id 531846;
 Mon, 08 May 2023 19:48:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=49Re=A5=linutronix.de=tglx@srs-se1.protection.inumbo.net>)
 id 1pw6mG-0004GB-SD
 for xen-devel@lists.xenproject.org; Mon, 08 May 2023 19:44:08 +0000
Received: from galois.linutronix.de (galois.linutronix.de
 [2a0a:51c0:0:12e:550::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b266ad52-edd8-11ed-b226-6b7b168915f2;
 Mon, 08 May 2023 21:44:08 +0200 (CEST)
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
X-Inumbo-ID: b266ad52-edd8-11ed-b226-6b7b168915f2
Message-ID: <20230508185218.643400362@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1683575047;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 references:references; bh=hx5fWQqpBJqFhc3VD4cFl0lkC1fEFtezXeQ/kkMDuYM=;
	b=dMSiYiyMCD3/kfD6ycKkp08Cs2yGyR46ibmTbUZ4EPuuwnERkLqo1DPunwf9Bd+Lh282Kk
	iyz5crAqn34/Z1DU1FdeHq8w2ICxkwvwPupWSapQM5bKWcd06oqKMF65CPiBv3i5Jdq5GK
	No9UCLkO9a75FWDWNjS5cUfUlOLyZkVKjYuIut6Mde17+klVjF/vsV/x/8XZgC94CcLGgL
	esCNz6eRqlPWNCIMyIyPzBMIvNBVYenPTUQOWaJr4izZS/Q4K0oHTNZvGzzHj78cMSROKA
	7adYzjGge8G4Bi2MTD6vyk5VOcXBsF4npN+FHo+bMYD6KtCMSa31T9g3imKuVQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1683575047;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 references:references; bh=hx5fWQqpBJqFhc3VD4cFl0lkC1fEFtezXeQ/kkMDuYM=;
	b=5H4Y1AwaHO6MuLieAAEsSuc7IElwyyxQTr8AXtmBcHORWW1C5BYTyvmgYBKAcPiBa35CdM
	lrZnB79si3SXI4BQ==
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
Subject: [patch v3 25/36] parisc: Switch to hotplug core state synchronization
References: <20230508181633.089804905@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Date: Mon,  8 May 2023 21:44:07 +0200 (CEST)

From: Thomas Gleixner <tglx@linutronix.de>

Switch to the CPU hotplug core state tracking and synchronization
mechanim. No functional change intended.

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
Tested-by: Michael Kelley <mikelley@microsoft.com>


---
 arch/parisc/Kconfig          |    1 +
 arch/parisc/kernel/process.c |    4 ++--
 arch/parisc/kernel/smp.c     |    7 +++----
 3 files changed, 6 insertions(+), 6 deletions(-)
---

--- a/arch/parisc/Kconfig
+++ b/arch/parisc/Kconfig
@@ -57,6 +57,7 @@ config PARISC
 	select HAVE_ARCH_SECCOMP_FILTER
 	select HAVE_ARCH_TRACEHOOK
 	select HAVE_REGS_AND_STACK_ACCESS_API
+	select HOTPLUG_CORE_SYNC_DEAD if HOTPLUG_CPU
 	select GENERIC_SCHED_CLOCK
 	select GENERIC_IRQ_MIGRATION if SMP
 	select HAVE_UNSTABLE_SCHED_CLOCK if SMP
--- a/arch/parisc/kernel/process.c
+++ b/arch/parisc/kernel/process.c
@@ -166,8 +166,8 @@ void __noreturn arch_cpu_idle_dead(void)
 
 	local_irq_disable();
 
-	/* Tell __cpu_die() that this CPU is now safe to dispose of. */
-	(void)cpu_report_death();
+	/* Tell the core that this CPU is now safe to dispose of. */
+	cpuhp_ap_report_dead();
 
 	/* Ensure that the cache lines are written out. */
 	flush_cache_all_local();
--- a/arch/parisc/kernel/smp.c
+++ b/arch/parisc/kernel/smp.c
@@ -500,11 +500,10 @@ int __cpu_disable(void)
 void __cpu_die(unsigned int cpu)
 {
 	pdc_cpu_rendezvous_lock();
+}
 
-	if (!cpu_wait_death(cpu, 5)) {
-		pr_crit("CPU%u: cpu didn't die\n", cpu);
-		return;
-	}
+void arch_cpuhp_cleanup_dead_cpu(unsigned int cpu)
+{
 	pr_info("CPU%u: is shutting down\n", cpu);
 
 	/* set task's state to interruptible sleep */



