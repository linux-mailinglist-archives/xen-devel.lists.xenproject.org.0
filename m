Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D1A806F72FF
	for <lists+xen-devel@lfdr.de>; Thu,  4 May 2023 21:10:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.529972.825127 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pueL1-0002dt-4h; Thu, 04 May 2023 19:09:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 529972.825127; Thu, 04 May 2023 19:09:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pueL0-0002Yt-TB; Thu, 04 May 2023 19:09:58 +0000
Received: by outflank-mailman (input) for mailman id 529972;
 Thu, 04 May 2023 19:09:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=srgM=AZ=linutronix.de=tglx@srs-se1.protection.inumbo.net>)
 id 1pueDz-00042j-PH
 for xen-devel@lists.xenproject.org; Thu, 04 May 2023 19:02:43 +0000
Received: from galois.linutronix.de (galois.linutronix.de [193.142.43.55])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3f704063-eaae-11ed-b226-6b7b168915f2;
 Thu, 04 May 2023 21:02:42 +0200 (CEST)
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
X-Inumbo-ID: 3f704063-eaae-11ed-b226-6b7b168915f2
Message-ID: <20230504185937.806324260@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1683226962;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 references:references; bh=PIHn3pYsUJ8IshGaa3kU/Fr0bIJzVI5udpOrlPrYz+E=;
	b=QNGmIIt+/To56nrNKLo3wlp/uoA0S+O2aHLtwODYUDkrU8Guyvv03S4Uol8KKlrIgPdDLI
	qPjhMQNUAIZdRs2om4WUPJMT1jXnWhngn8GF42pSedv+mPXqPDg6dporcNAvFdzUw+egQ+
	Vqg53SlSVRiuRBZMIzV5FPs2l5GIv84C01a0Qxu+Mq65QbnphJFA5Ir3subA78ZM6E8kf2
	ZWThMRZ9iqmdUJfsdKFtkK4qDI92/cMPImPqXf9PZUVb/qwqechT+XgrR1ZcB+r0K7YQf/
	HeZhI+W/xkNZVJpDF4ppx/B//2tg7mVNz3rodO8pj9sfyrrX+kNXbJXXhJW8oA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1683226962;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 references:references; bh=PIHn3pYsUJ8IshGaa3kU/Fr0bIJzVI5udpOrlPrYz+E=;
	b=wXxqyLYYRXuQOss/+ZoLBYE+oLaf2tb90zR4AxAwAajqpA22CmYoLXhycZjVGB2N2Jkdnq
	PQRh0paL0Sj8j3Bw==
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
Subject: [patch V2 27/38] cpu/hotplug: Remove unused state functions
References: <20230504185733.126511787@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Date: Thu,  4 May 2023 21:02:42 +0200 (CEST)

From: Thomas Gleixner <tglx@linutronix.de>

All users converted to the hotplug core mechanism.

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>

---
 include/linux/cpu.h |    2 -
 kernel/smpboot.c    |   75 ----------------------------------------------------
 2 files changed, 77 deletions(-)
---
--- a/include/linux/cpu.h
+++ b/include/linux/cpu.h
@@ -193,8 +193,6 @@ static inline void play_idle(unsigned lo
 }
 
 #ifdef CONFIG_HOTPLUG_CPU
-bool cpu_wait_death(unsigned int cpu, int seconds);
-bool cpu_report_death(void);
 void cpuhp_report_idle_dead(void);
 #else
 static inline void cpuhp_report_idle_dead(void) { }
--- a/kernel/smpboot.c
+++ b/kernel/smpboot.c
@@ -325,78 +325,3 @@ void smpboot_unregister_percpu_thread(st
 	cpus_read_unlock();
 }
 EXPORT_SYMBOL_GPL(smpboot_unregister_percpu_thread);
-
-#ifndef CONFIG_HOTPLUG_CORE_SYNC
-static DEFINE_PER_CPU(atomic_t, cpu_hotplug_state) = ATOMIC_INIT(CPU_POST_DEAD);
-
-#ifdef CONFIG_HOTPLUG_CPU
-/*
- * Wait for the specified CPU to exit the idle loop and die.
- */
-bool cpu_wait_death(unsigned int cpu, int seconds)
-{
-	int jf_left = seconds * HZ;
-	int oldstate;
-	bool ret = true;
-	int sleep_jf = 1;
-
-	might_sleep();
-
-	/* The outgoing CPU will normally get done quite quickly. */
-	if (atomic_read(&per_cpu(cpu_hotplug_state, cpu)) == CPU_DEAD)
-		goto update_state_early;
-	udelay(5);
-
-	/* But if the outgoing CPU dawdles, wait increasingly long times. */
-	while (atomic_read(&per_cpu(cpu_hotplug_state, cpu)) != CPU_DEAD) {
-		schedule_timeout_uninterruptible(sleep_jf);
-		jf_left -= sleep_jf;
-		if (jf_left <= 0)
-			break;
-		sleep_jf = DIV_ROUND_UP(sleep_jf * 11, 10);
-	}
-update_state_early:
-	oldstate = atomic_read(&per_cpu(cpu_hotplug_state, cpu));
-update_state:
-	if (oldstate == CPU_DEAD) {
-		/* Outgoing CPU died normally, update state. */
-		smp_mb(); /* atomic_read() before update. */
-		atomic_set(&per_cpu(cpu_hotplug_state, cpu), CPU_POST_DEAD);
-	} else {
-		/* Outgoing CPU still hasn't died, set state accordingly. */
-		if (!atomic_try_cmpxchg(&per_cpu(cpu_hotplug_state, cpu),
-					&oldstate, CPU_BROKEN))
-			goto update_state;
-		ret = false;
-	}
-	return ret;
-}
-
-/*
- * Called by the outgoing CPU to report its successful death.  Return
- * false if this report follows the surviving CPU's timing out.
- *
- * A separate "CPU_DEAD_FROZEN" is used when the surviving CPU
- * timed out.  This approach allows architectures to omit calls to
- * cpu_check_up_prepare() and cpu_set_state_online() without defeating
- * the next cpu_wait_death()'s polling loop.
- */
-bool cpu_report_death(void)
-{
-	int oldstate;
-	int newstate;
-	int cpu = smp_processor_id();
-
-	oldstate = atomic_read(&per_cpu(cpu_hotplug_state, cpu));
-	do {
-		if (oldstate != CPU_BROKEN)
-			newstate = CPU_DEAD;
-		else
-			newstate = CPU_DEAD_FROZEN;
-	} while (!atomic_try_cmpxchg(&per_cpu(cpu_hotplug_state, cpu),
-				     &oldstate, newstate));
-	return newstate == CPU_DEAD;
-}
-
-#endif /* #ifdef CONFIG_HOTPLUG_CPU */
-#endif /* !CONFIG_HOTPLUG_CORE_SYNC */


