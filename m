Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 39E856F7300
	for <lists+xen-devel@lfdr.de>; Thu,  4 May 2023 21:10:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.529975.825148 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pueL3-0003FU-Rk; Thu, 04 May 2023 19:10:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 529975.825148; Thu, 04 May 2023 19:10:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pueL3-0002uE-3K; Thu, 04 May 2023 19:10:01 +0000
Received: by outflank-mailman (input) for mailman id 529975;
 Thu, 04 May 2023 19:09:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=srgM=AZ=linutronix.de=tglx@srs-se1.protection.inumbo.net>)
 id 1pueDt-00042k-Hm
 for xen-devel@lists.xenproject.org; Thu, 04 May 2023 19:02:37 +0000
Received: from galois.linutronix.de (galois.linutronix.de [193.142.43.55])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3aa69c1d-eaae-11ed-8611-37d641c3527e;
 Thu, 04 May 2023 21:02:34 +0200 (CEST)
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
X-Inumbo-ID: 3aa69c1d-eaae-11ed-8611-37d641c3527e
Message-ID: <20230504185937.531087176@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1683226954;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 references:references; bh=Q8MXo4UxfGPWkYiCkH8SfFuLE8nd3MwYFSO4OPkEU0k=;
	b=bnUOgHwWBE9hQkfsy68hlWixo+U0yYAVZfCfMXKGJisrc20Q1Webu21cChSehhJQaLZl77
	aYcKQ8Ytt2r2NeJhvWxidSRTpvTvE+EspS4m5s+LoGulbB1pCU2KCiI4sYoDI+vWCSHJkY
	pLu+grBlA9n7NODW06zxUNEt82sbImz6W8Kz7FepCq/gr5/IfItCe6Dkdodt5Q+vNIzgkQ
	Xn7Gz8k6gfZophc27B+l6J4sJeUpLR0bJXlF4TZA5eQidQJCcWgls2wS0/Py/vTS1AsL0f
	As3W35eXgUx29dMadPvgrCRe8Y9FS7s6QYZrLEoJyk9bohOWQId+pyuCBRum1w==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1683226954;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 references:references; bh=Q8MXo4UxfGPWkYiCkH8SfFuLE8nd3MwYFSO4OPkEU0k=;
	b=HogNRfK+WKVbHXq0EreqUC5qHXGSg3L8ztEoy1FUGNc1//IkmnGiuVjwLox91YGFbTshES
	iAwGBolutbMvD0Cw==
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
 [patch V2 22/38] arm64: smp: Switch to hotplug core state synchronization
References: <20230504185733.126511787@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Date: Thu,  4 May 2023 21:02:34 +0200 (CEST)

From: Thomas Gleixner <tglx@linutronix.de>

Switch to the CPU hotplug core state tracking and synchronization
mechanim. No functional change intended.

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
Tested-by: Mark Rutland <mark.rutland@arm.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Will Deacon <will@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org
---
 arch/arm64/Kconfig           |    1 +
 arch/arm64/include/asm/smp.h |    2 +-
 arch/arm64/kernel/smp.c      |   14 +++++---------
 3 files changed, 7 insertions(+), 10 deletions(-)
---
--- a/arch/arm64/Kconfig
+++ b/arch/arm64/Kconfig
@@ -222,6 +222,7 @@ config ARM64
 	select HAVE_KPROBES
 	select HAVE_KRETPROBES
 	select HAVE_GENERIC_VDSO
+	select HOTPLUG_CORE_SYNC_DEAD if HOTPLUG_CPU
 	select IRQ_DOMAIN
 	select IRQ_FORCED_THREADING
 	select KASAN_VMALLOC if KASAN
--- a/arch/arm64/include/asm/smp.h
+++ b/arch/arm64/include/asm/smp.h
@@ -99,7 +99,7 @@ static inline void arch_send_wakeup_ipi_
 
 extern int __cpu_disable(void);
 
-extern void __cpu_die(unsigned int cpu);
+static inline void __cpu_die(unsigned int cpu) { }
 extern void __noreturn cpu_die(void);
 extern void __noreturn cpu_die_early(void);
 
--- a/arch/arm64/kernel/smp.c
+++ b/arch/arm64/kernel/smp.c
@@ -332,17 +332,13 @@ static int op_cpu_kill(unsigned int cpu)
 }
 
 /*
- * called on the thread which is asking for a CPU to be shutdown -
- * waits until shutdown has completed, or it is timed out.
+ * Called on the thread which is asking for a CPU to be shutdown after the
+ * shutdown completed.
  */
-void __cpu_die(unsigned int cpu)
+void arch_cpuhp_cleanup_dead_cpu(unsigned int cpu)
 {
 	int err;
 
-	if (!cpu_wait_death(cpu, 5)) {
-		pr_crit("CPU%u: cpu didn't die\n", cpu);
-		return;
-	}
 	pr_debug("CPU%u: shutdown\n", cpu);
 
 	/*
@@ -369,8 +365,8 @@ void __noreturn cpu_die(void)
 
 	local_daif_mask();
 
-	/* Tell __cpu_die() that this CPU is now safe to dispose of */
-	(void)cpu_report_death();
+	/* Tell cpuhp_bp_sync_dead() that this CPU is now safe to dispose of */
+	cpuhp_ap_report_dead();
 
 	/*
 	 * Actually shutdown the CPU. This must never fail. The specific hotplug


