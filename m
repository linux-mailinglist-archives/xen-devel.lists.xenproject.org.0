Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 991DE6E2DA4
	for <lists+xen-devel@lfdr.de>; Sat, 15 Apr 2023 01:49:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.521323.809997 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pnTAQ-00062H-0z; Fri, 14 Apr 2023 23:49:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 521323.809997; Fri, 14 Apr 2023 23:49:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pnTAP-0005wb-Pu; Fri, 14 Apr 2023 23:49:21 +0000
Received: by outflank-mailman (input) for mailman id 521323;
 Fri, 14 Apr 2023 23:49:20 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ZCOw=AF=linutronix.de=tglx@srs-se1.protection.inumbo.net>)
 id 1pnT6B-0001Th-2o
 for xen-devel@lists.xenproject.org; Fri, 14 Apr 2023 23:44:59 +0000
Received: from galois.linutronix.de (galois.linutronix.de [193.142.43.55])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5d9b13d7-db1e-11ed-b21e-6b7b168915f2;
 Sat, 15 Apr 2023 01:44:58 +0200 (CEST)
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
X-Inumbo-ID: 5d9b13d7-db1e-11ed-b21e-6b7b168915f2
Message-ID: <20230414232310.880220709@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1681515898;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 references:references; bh=auQqEwsU9PrP6dmLhZ2HNf+yKNnP8AcVm6NVRhQvyDs=;
	b=UQ9zo5ANA3bXro6uBe1FOBxXvcfoSQEiD24Xrn7vh8KjSNUhNMcqLW1wljHJEJ+e8j4GDJ
	N1EWMYIroPUN4YgTfbVjru09sBWEDKR5SQth1/0kGQgcTNZpj5XjpFfxTvJhJa1qZtvmXw
	wJMkqQYqdVRSHK1GBFiS97ApX5A77MdAt+hpRt1LADSzZH/uFNSbjXsbu3HZBSvh8G0y2P
	EK0CnndcvpELSRQBHbYZKRgcaUhr6Z8TtUOgSj+l3dKGuu0eZBB3TQY8X7TLCDbAdL4JaV
	dJXPejZzrfw0jpwXNhC/giE+cyNnTnS/yF70lli9Oe14OjMbSX5LRocaBNalvA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1681515898;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 references:references; bh=auQqEwsU9PrP6dmLhZ2HNf+yKNnP8AcVm6NVRhQvyDs=;
	b=3UjUp0tk+qEdheiIONrPumzFg6y/RDymanoMKy3WCuwS6WRIh+kUkt2pm7bfL23mY4jSCI
	ishR5iLfVIQKiiCw==
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
Subject: [patch 27/37] cpu/hotplug: Remove unused state functions
References: <20230414225551.858160935@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Date: Sat, 15 Apr 2023 01:44:57 +0200 (CEST)

All users converted to the hotplug core mechanism.

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
---
 include/linux/cpu.h |    2 -
 kernel/smpboot.c    |   75 ----------------------------------------------------
 2 files changed, 77 deletions(-)

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


