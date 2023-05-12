Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 90B99701101
	for <lists+xen-devel@lfdr.de>; Fri, 12 May 2023 23:18:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.534028.831261 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pxa9U-0006Yo-30; Fri, 12 May 2023 21:18:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 534028.831261; Fri, 12 May 2023 21:18:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pxa9T-0006S8-Sd; Fri, 12 May 2023 21:18:11 +0000
Received: by outflank-mailman (input) for mailman id 534028;
 Fri, 12 May 2023 21:18:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5PQu=BB=linutronix.de=tglx@srs-se1.protection.inumbo.net>)
 id 1pxZzJ-0004F7-FO
 for xen-devel@lists.xenproject.org; Fri, 12 May 2023 21:07:41 +0000
Received: from galois.linutronix.de (galois.linutronix.de [193.142.43.55])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 071160ff-f109-11ed-8611-37d641c3527e;
 Fri, 12 May 2023 23:07:39 +0200 (CEST)
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
X-Inumbo-ID: 071160ff-f109-11ed-8611-37d641c3527e
Message-ID: <20230512205256.859920443@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1683925659;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 references:references; bh=4KTNmmFPJXZljDpOFQFSwkn0vJx9v7UbMNIhdACke4E=;
	b=LDLOAD2i8A3n7wKvyw/OHjYjE9g2++H+Ra6znb14aQBES5w+tCFjEYDcf9R4VTOZvx9n/u
	aJPKVhpjaAwY/9/gG5nbXzIELvXFhBTj6ik9OFCKp0sTKTUqsxOkjkPU5EOD3pLZJZ4Q08
	mBjq2r7Ehgaq64GBwCCWKc9urhnQ2OFs9Pi8ZnDO+A9Gy5HJGaINPnYSxBdC6tTcGbRZFa
	FZhkykTgFM2zztGv9fUkORf1CGPgc7ibQGmtESQXEt7iMvWTsEjR7OCpRCp0F7VavIl+3g
	BX/UupJRv8rSiDtBIxr6kkKrNs6sYKYM7ptmqJMF/1rd4KRE6ZPzMWlA9jlybw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1683925659;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 references:references; bh=4KTNmmFPJXZljDpOFQFSwkn0vJx9v7UbMNIhdACke4E=;
	b=Gt2zwUCq7iu8dnyaeJHibD3RPnYUHsIc76G4Lbvo/gsvpFIWUZKRoyxcLE+Vi7t38Qh+jZ
	on551572+Ltc/RBA==
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
Subject: [patch V4 26/37] parisc: Switch to hotplug core state synchronization
References: <20230512203426.452963764@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Date: Fri, 12 May 2023 23:07:38 +0200 (CEST)

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




