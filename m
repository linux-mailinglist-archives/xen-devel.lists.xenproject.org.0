Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A36406E2DAB
	for <lists+xen-devel@lfdr.de>; Sat, 15 Apr 2023 01:49:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.521358.810065 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pnTAi-0001Q7-Qu; Fri, 14 Apr 2023 23:49:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 521358.810065; Fri, 14 Apr 2023 23:49:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pnTAi-0001BO-Hr; Fri, 14 Apr 2023 23:49:40 +0000
Received: by outflank-mailman (input) for mailman id 521358;
 Fri, 14 Apr 2023 23:49:37 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ZCOw=AF=linutronix.de=tglx@srs-se1.protection.inumbo.net>)
 id 1pnT64-0000zb-7Z
 for xen-devel@lists.xenproject.org; Fri, 14 Apr 2023 23:44:52 +0000
Received: from galois.linutronix.de (galois.linutronix.de [193.142.43.55])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 56a62801-db1e-11ed-8611-37d641c3527e;
 Sat, 15 Apr 2023 01:44:46 +0200 (CEST)
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
X-Inumbo-ID: 56a62801-db1e-11ed-8611-37d641c3527e
Message-ID: <20230414232310.444204883@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1681515886;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 references:references; bh=OJmMK1DNsYZsN6fUmGwfeq4ERjaNgScwoVZRQqH8yUw=;
	b=GcFPtrg7k9VQxG3rMlumRMw5nuKtsJmdDMoJ6TSceXuK1zdHd+N9joDWuAZdo46YFNxZMP
	Bsg8W/+6nBYJRVuCztzAyHJQvPJSb23Tablj/SGjhsX/WUeCrmSA9nsuhw8G2JGX2NZ97t
	THjsQ+3MT5axiGFvQ/sUAHek0hFvHwgQKNG5VvKo8oZKr/4skgr04uS53dj+ol0BYWxhal
	5oIGYZdmtf3qGjw5V88nnPJqYy7bxEgNOIlxEv9+tW18PGEfux4IdshBI1Y1RLHv+TPNLz
	Ddqx3nRleBLOQcei7th1ojLHd0sg0KKVmzdvEaltZ8B7BxlHVYGVjXaqhkZyww==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1681515886;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 references:references; bh=OJmMK1DNsYZsN6fUmGwfeq4ERjaNgScwoVZRQqH8yUw=;
	b=l2/PUI4LfABzfYrIQxeqJjxovlQLjpZzH9GEF/bgX07OlI0hCc/156VAzkEe/0KLuss+2I
	g5EEfqF03SuN2wDg==
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
Subject:
 [patch 20/37] cpu/hotplug: Remove cpu_report_state() and related unused cruft
References: <20230414225551.858160935@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Date: Sat, 15 Apr 2023 01:44:46 +0200 (CEST)

No more users.

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
---
 include/linux/cpu.h |    2 -
 kernel/smpboot.c    |   90 ----------------------------------------------------
 2 files changed, 92 deletions(-)

--- a/include/linux/cpu.h
+++ b/include/linux/cpu.h
@@ -184,8 +184,6 @@ void arch_cpu_idle_enter(void);
 void arch_cpu_idle_exit(void);
 void arch_cpu_idle_dead(void);
 
-int cpu_report_state(int cpu);
-int cpu_check_up_prepare(int cpu);
 void cpu_set_state_online(int cpu);
 void play_idle_precise(u64 duration_ns, u64 latency_ns);
 
--- a/kernel/smpboot.c
+++ b/kernel/smpboot.c
@@ -329,97 +329,7 @@ EXPORT_SYMBOL_GPL(smpboot_unregister_per
 #ifndef CONFIG_HOTPLUG_CORE_SYNC
 static DEFINE_PER_CPU(atomic_t, cpu_hotplug_state) = ATOMIC_INIT(CPU_POST_DEAD);
 
-/*
- * Called to poll specified CPU's state, for example, when waiting for
- * a CPU to come online.
- */
-int cpu_report_state(int cpu)
-{
-	return atomic_read(&per_cpu(cpu_hotplug_state, cpu));
-}
-
-/*
- * If CPU has died properly, set its state to CPU_UP_PREPARE and
- * return success.  Otherwise, return -EBUSY if the CPU died after
- * cpu_wait_death() timed out.  And yet otherwise again, return -EAGAIN
- * if cpu_wait_death() timed out and the CPU still hasn't gotten around
- * to dying.  In the latter two cases, the CPU might not be set up
- * properly, but it is up to the arch-specific code to decide.
- * Finally, -EIO indicates an unanticipated problem.
- *
- * Note that it is permissible to omit this call entirely, as is
- * done in architectures that do no CPU-hotplug error checking.
- */
-int cpu_check_up_prepare(int cpu)
-{
-	if (!IS_ENABLED(CONFIG_HOTPLUG_CPU)) {
-		atomic_set(&per_cpu(cpu_hotplug_state, cpu), CPU_UP_PREPARE);
-		return 0;
-	}
-
-	switch (atomic_read(&per_cpu(cpu_hotplug_state, cpu))) {
-
-	case CPU_POST_DEAD:
-
-		/* The CPU died properly, so just start it up again. */
-		atomic_set(&per_cpu(cpu_hotplug_state, cpu), CPU_UP_PREPARE);
-		return 0;
-
-	case CPU_DEAD_FROZEN:
-
-		/*
-		 * Timeout during CPU death, so let caller know.
-		 * The outgoing CPU completed its processing, but after
-		 * cpu_wait_death() timed out and reported the error. The
-		 * caller is free to proceed, in which case the state
-		 * will be reset properly by cpu_set_state_online().
-		 * Proceeding despite this -EBUSY return makes sense
-		 * for systems where the outgoing CPUs take themselves
-		 * offline, with no post-death manipulation required from
-		 * a surviving CPU.
-		 */
-		return -EBUSY;
-
-	case CPU_BROKEN:
-
-		/*
-		 * The most likely reason we got here is that there was
-		 * a timeout during CPU death, and the outgoing CPU never
-		 * did complete its processing.  This could happen on
-		 * a virtualized system if the outgoing VCPU gets preempted
-		 * for more than five seconds, and the user attempts to
-		 * immediately online that same CPU.  Trying again later
-		 * might return -EBUSY above, hence -EAGAIN.
-		 */
-		return -EAGAIN;
-
-	case CPU_UP_PREPARE:
-		/*
-		 * Timeout while waiting for the CPU to show up. Allow to try
-		 * again later.
-		 */
-		return 0;
-
-	default:
-
-		/* Should not happen.  Famous last words. */
-		return -EIO;
-	}
-}
-
-/*
- * Mark the specified CPU online.
- *
- * Note that it is permissible to omit this call entirely, as is
- * done in architectures that do no CPU-hotplug error checking.
- */
-void cpu_set_state_online(int cpu)
-{
-	(void)atomic_xchg(&per_cpu(cpu_hotplug_state, cpu), CPU_ONLINE);
-}
-
 #ifdef CONFIG_HOTPLUG_CPU
-
 /*
  * Wait for the specified CPU to exit the idle loop and die.
  */


