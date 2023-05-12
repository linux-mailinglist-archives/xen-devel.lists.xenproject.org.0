Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 110F0701103
	for <lists+xen-devel@lfdr.de>; Fri, 12 May 2023 23:18:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.534042.831283 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pxa9f-00082m-DM; Fri, 12 May 2023 21:18:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 534042.831283; Fri, 12 May 2023 21:18:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pxa9f-0007z6-0s; Fri, 12 May 2023 21:18:23 +0000
Received: by outflank-mailman (input) for mailman id 534042;
 Fri, 12 May 2023 21:18:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5PQu=BB=linutronix.de=tglx@srs-se1.protection.inumbo.net>)
 id 1pxZzT-0004F7-H9
 for xen-devel@lists.xenproject.org; Fri, 12 May 2023 21:07:51 +0000
Received: from galois.linutronix.de (galois.linutronix.de [193.142.43.55])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0bf74c58-f109-11ed-8611-37d641c3527e;
 Fri, 12 May 2023 23:07:47 +0200 (CEST)
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
X-Inumbo-ID: 0bf74c58-f109-11ed-8611-37d641c3527e
Message-ID: <20230512205257.133453992@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1683925667;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 references:references; bh=s6m9J4c1JvP70cnTGmFjRaHjxV+T4Hc55BQMBWx1oPc=;
	b=y2DUc1fXfsXkDW8K6WaMiHDe6gR4IEKxgaOddkKmSwSv+DqEsvnjWzXgPjyq32d1wpWK5Z
	DhULLjmoSJ6Twf97uZUUSDmOErh5HW4b2tsf6z1y+M36Y3f2xB7zi4wFgw7y4DDIduarbz
	yeLsAcWQsBCl07tIF0QqY/Jj/avRssPe2AvWtNVRytlleptjLfnchKkKtZCHOE5wyaDkBF
	6X8iVUK0NIWo0to7bK0cANrtWwlUAJ9ihLJH1D1NrqOK2ldq23z0J7UlmUsOUeID7o25Cf
	4F7tlHyUzLkqHXoKB/QYb/4diEkgPLMMdkcjx5AD44P4tw9zfHRvswMyp4a7FQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1683925667;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 references:references; bh=s6m9J4c1JvP70cnTGmFjRaHjxV+T4Hc55BQMBWx1oPc=;
	b=yCQezV+nLz69U6F8kXkQMvva3l/BtuBu7i4swHXcyBl7X7TgPYqW8jXLbGqot3jpiZi7IT
	CU7Sn35pJ28UiwBg==
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
Subject: [patch V4 31/37] x86/smpboot: Enable split CPU startup
References: <20230512203426.452963764@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Date: Fri, 12 May 2023 23:07:46 +0200 (CEST)

From: Thomas Gleixner <tglx@linutronix.de>

The x86 CPU bringup state currently does AP wake-up, wait for AP to
respond and then release it for full bringup.

It is safe to be split into a wake-up and and a separate wait+release
state.

Provide the required functions and enable the split CPU bringup, which
prepares for parallel bringup, where the bringup of the non-boot CPUs takes
two iterations: One to prepare and wake all APs and the second to wait and
release them. Depending on timing this can eliminate the wait time
completely.

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
Tested-by: Michael Kelley <mikelley@microsoft.com>
---
 arch/x86/Kconfig           |    2 +-
 arch/x86/include/asm/smp.h |    9 ++-------
 arch/x86/kernel/smp.c      |    2 +-
 arch/x86/kernel/smpboot.c  |    8 ++++----
 arch/x86/xen/smp_pv.c      |    4 ++--
 5 files changed, 10 insertions(+), 15 deletions(-)
--- a/arch/x86/Kconfig
+++ b/arch/x86/Kconfig
@@ -274,8 +274,8 @@ config X86
 	select HAVE_UNSTABLE_SCHED_CLOCK
 	select HAVE_USER_RETURN_NOTIFIER
 	select HAVE_GENERIC_VDSO
-	select HOTPLUG_CORE_SYNC_FULL		if SMP
 	select HOTPLUG_SMT			if SMP
+	select HOTPLUG_SPLIT_STARTUP		if SMP
 	select IRQ_FORCED_THREADING
 	select NEED_PER_CPU_EMBED_FIRST_CHUNK
 	select NEED_PER_CPU_PAGE_FIRST_CHUNK
--- a/arch/x86/include/asm/smp.h
+++ b/arch/x86/include/asm/smp.h
@@ -40,7 +40,7 @@ struct smp_ops {
 
 	void (*cleanup_dead_cpu)(unsigned cpu);
 	void (*poll_sync_state)(void);
-	int (*cpu_up)(unsigned cpu, struct task_struct *tidle);
+	int (*kick_ap_alive)(unsigned cpu, struct task_struct *tidle);
 	int (*cpu_disable)(void);
 	void (*cpu_die)(unsigned int cpu);
 	void (*play_dead)(void);
@@ -80,11 +80,6 @@ static inline void smp_cpus_done(unsigne
 	smp_ops.smp_cpus_done(max_cpus);
 }
 
-static inline int __cpu_up(unsigned int cpu, struct task_struct *tidle)
-{
-	return smp_ops.cpu_up(cpu, tidle);
-}
-
 static inline int __cpu_disable(void)
 {
 	return smp_ops.cpu_disable();
@@ -124,7 +119,7 @@ void native_smp_prepare_cpus(unsigned in
 void calculate_max_logical_packages(void);
 void native_smp_cpus_done(unsigned int max_cpus);
 int common_cpu_up(unsigned int cpunum, struct task_struct *tidle);
-int native_cpu_up(unsigned int cpunum, struct task_struct *tidle);
+int native_kick_ap(unsigned int cpu, struct task_struct *tidle);
 int native_cpu_disable(void);
 void __noreturn hlt_play_dead(void);
 void native_play_dead(void);
--- a/arch/x86/kernel/smp.c
+++ b/arch/x86/kernel/smp.c
@@ -268,7 +268,7 @@ struct smp_ops smp_ops = {
 #endif
 	.smp_send_reschedule	= native_smp_send_reschedule,
 
-	.cpu_up			= native_cpu_up,
+	.kick_ap_alive		= native_kick_ap,
 	.cpu_disable		= native_cpu_disable,
 	.play_dead		= native_play_dead,
 
--- a/arch/x86/kernel/smpboot.c
+++ b/arch/x86/kernel/smpboot.c
@@ -1052,7 +1052,7 @@ static int do_boot_cpu(int apicid, int c
 	return ret;
 }
 
-static int native_kick_ap(unsigned int cpu, struct task_struct *tidle)
+int native_kick_ap(unsigned int cpu, struct task_struct *tidle)
 {
 	int apicid = apic->cpu_present_to_apicid(cpu);
 	int err;
@@ -1088,15 +1088,15 @@ static int native_kick_ap(unsigned int c
 	return err;
 }
 
-int native_cpu_up(unsigned int cpu, struct task_struct *tidle)
+int arch_cpuhp_kick_ap_alive(unsigned int cpu, struct task_struct *tidle)
 {
-	return native_kick_ap(cpu, tidle);
+	return smp_ops.kick_ap_alive(cpu, tidle);
 }
 
 void arch_cpuhp_cleanup_kick_cpu(unsigned int cpu)
 {
 	/* Cleanup possible dangling ends... */
-	if (smp_ops.cpu_up == native_cpu_up && x86_platform.legacy.warm_reset)
+	if (smp_ops.kick_ap_alive == native_kick_ap && x86_platform.legacy.warm_reset)
 		smpboot_restore_warm_reset_vector();
 }
 
--- a/arch/x86/xen/smp_pv.c
+++ b/arch/x86/xen/smp_pv.c
@@ -314,7 +314,7 @@ cpu_initialize_context(unsigned int cpu,
 	return 0;
 }
 
-static int xen_pv_cpu_up(unsigned int cpu, struct task_struct *idle)
+static int xen_pv_kick_ap(unsigned int cpu, struct task_struct *idle)
 {
 	int rc;
 
@@ -438,7 +438,7 @@ static const struct smp_ops xen_smp_ops
 	.smp_prepare_cpus = xen_pv_smp_prepare_cpus,
 	.smp_cpus_done = xen_smp_cpus_done,
 
-	.cpu_up = xen_pv_cpu_up,
+	.kick_ap_alive = xen_pv_kick_ap,
 	.cpu_die = xen_pv_cpu_die,
 	.cleanup_dead_cpu = xen_pv_cleanup_dead_cpu,
 	.poll_sync_state = xen_pv_poll_sync_state,


