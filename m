Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A616701025
	for <lists+xen-devel@lfdr.de>; Fri, 12 May 2023 23:07:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.533909.830937 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pxZyj-0004rC-9S; Fri, 12 May 2023 21:07:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 533909.830937; Fri, 12 May 2023 21:07:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pxZyj-0004mq-3u; Fri, 12 May 2023 21:07:05 +0000
Received: by outflank-mailman (input) for mailman id 533909;
 Fri, 12 May 2023 21:07:03 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5PQu=BB=linutronix.de=tglx@srs-se1.protection.inumbo.net>)
 id 1pxZyh-0004FP-6g
 for xen-devel@lists.xenproject.org; Fri, 12 May 2023 21:07:03 +0000
Received: from galois.linutronix.de (galois.linutronix.de [193.142.43.55])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f0f55002-f108-11ed-b229-6b7b168915f2;
 Fri, 12 May 2023 23:07:02 +0200 (CEST)
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
X-Inumbo-ID: f0f55002-f108-11ed-b229-6b7b168915f2
Message-ID: <20230512205255.608773568@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1683925622;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 references:references; bh=r7mhuIr1UsffTwz/BZZT9WLBgbQp9Bjt9SYbqNDVnNo=;
	b=yfiqoUfo19pxfWqsqQNjGDRZah8o3a0ZerjqrGY5ai55QtwCUrIVOIn8alP1EE9LzZM7mi
	LPH8IwyPagJtgHY2f27LQ/LbPs0P4ko5todlsQYLwAgD7UCfloc08R4n7cM9Gt3+MVorMZ
	8MGTb5ruHSawih2o00yv0SEO+1JvnEAV/i4NFh7ghWWkK6lNXQJ/9EnCt4lw84NXftTo9P
	JcmKj1ni7f7obeT3ujrFyEcOECY66oLHfz5SlWUdoqP1oth/EWpvUCSzr8AOV4Shx8fhIg
	2DSis/F/UEQdEAn+yIXXpTQBwye68bk4hkn4J+KuIUIIIBTf7MxseOIWbQlN1Q==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1683925622;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 references:references; bh=r7mhuIr1UsffTwz/BZZT9WLBgbQp9Bjt9SYbqNDVnNo=;
	b=x/vrMLP5hYljsVenHMq+Kmd30/I3mC2dGQvZTtFyNimzI+gVbhM9ZYe9TwhsHyUY8Y99el
	8jpNFGjpIWrX03Cg==
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
Subject: [patch V4 03/37] x86/smpboot: Avoid pointless delay calibration if
 TSC is synchronized
References: <20230512203426.452963764@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Date: Fri, 12 May 2023 23:07:01 +0200 (CEST)

From: Thomas Gleixner <tglx@linutronix.de>

When TSC is synchronized across sockets then there is no reason to
calibrate the delay for the first CPU which comes up on a socket.

Just reuse the existing calibration value.

This removes 100ms pointlessly wasted time from CPU hotplug per socket.

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
Tested-by: Michael Kelley <mikelley@microsoft.com>
---
 arch/x86/kernel/smpboot.c |   40 +++++++++++++++++++++++++---------------
 arch/x86/kernel/tsc.c     |   20 ++++++++++++++++----
 2 files changed, 41 insertions(+), 19 deletions(-)


--- a/arch/x86/kernel/smpboot.c
+++ b/arch/x86/kernel/smpboot.c
@@ -178,28 +178,17 @@ static void smp_callin(void)
 	 */
 	apic_ap_setup();
 
-	/*
-	 * Save our processor parameters. Note: this information
-	 * is needed for clock calibration.
-	 */
+	/* Save our processor parameters. */
 	smp_store_cpu_info(cpuid);
 
 	/*
 	 * The topology information must be up to date before
-	 * calibrate_delay() and notify_cpu_starting().
+	 * notify_cpu_starting().
 	 */
 	set_cpu_sibling_map(raw_smp_processor_id());
 
 	ap_init_aperfmperf();
 
-	/*
-	 * Get our bogomips.
-	 * Update loops_per_jiffy in cpu_data. Previous call to
-	 * smp_store_cpu_info() stored a value that is close but not as
-	 * accurate as the value just calculated.
-	 */
-	calibrate_delay();
-	cpu_data(cpuid).loops_per_jiffy = loops_per_jiffy;
 	pr_debug("Stack at about %p\n", &cpuid);
 
 	wmb();
@@ -212,8 +201,24 @@ static void smp_callin(void)
 	cpumask_set_cpu(cpuid, cpu_callin_mask);
 }
 
+static void ap_calibrate_delay(void)
+{
+	/*
+	 * Calibrate the delay loop and update loops_per_jiffy in cpu_data.
+	 * smp_store_cpu_info() stored a value that is close but not as
+	 * accurate as the value just calculated.
+	 *
+	 * As this is invoked after the TSC synchronization check,
+	 * calibrate_delay_is_known() will skip the calibration routine
+	 * when TSC is synchronized across sockets.
+	 */
+	calibrate_delay();
+	cpu_data(smp_processor_id()).loops_per_jiffy = loops_per_jiffy;
+}
+
 static int cpu0_logical_apicid;
 static int enable_start_cpu0;
+
 /*
  * Activate a secondary processor.
  */
@@ -240,10 +245,15 @@ static void notrace start_secondary(void
 
 	/* otherwise gcc will move up smp_processor_id before the cpu_init */
 	barrier();
+	/* Check TSC synchronization with the control CPU: */
+	check_tsc_sync_target();
+
 	/*
-	 * Check TSC synchronization with the boot CPU:
+	 * Calibrate the delay loop after the TSC synchronization check.
+	 * This allows to skip the calibration when TSC is synchronized
+	 * across sockets.
 	 */
-	check_tsc_sync_target();
+	ap_calibrate_delay();
 
 	speculative_store_bypass_ht_init();
 
--- a/arch/x86/kernel/tsc.c
+++ b/arch/x86/kernel/tsc.c
@@ -1598,10 +1598,7 @@ void __init tsc_init(void)
 
 #ifdef CONFIG_SMP
 /*
- * If we have a constant TSC and are using the TSC for the delay loop,
- * we can skip clock calibration if another cpu in the same socket has already
- * been calibrated. This assumes that CONSTANT_TSC applies to all
- * cpus in the socket - this should be a safe assumption.
+ * Check whether existing calibration data can be reused.
  */
 unsigned long calibrate_delay_is_known(void)
 {
@@ -1609,6 +1606,21 @@ unsigned long calibrate_delay_is_known(v
 	int constant_tsc = cpu_has(&cpu_data(cpu), X86_FEATURE_CONSTANT_TSC);
 	const struct cpumask *mask = topology_core_cpumask(cpu);
 
+	/*
+	 * If TSC has constant frequency and TSC is synchronized across
+	 * sockets then reuse CPU0 calibration.
+	 */
+	if (constant_tsc && !tsc_unstable)
+		return cpu_data(0).loops_per_jiffy;
+
+	/*
+	 * If TSC has constant frequency and TSC is not synchronized across
+	 * sockets and this is not the first CPU in the socket, then reuse
+	 * the calibration value of an already online CPU on that socket.
+	 *
+	 * This assumes that CONSTANT_TSC is consistent for all CPUs in a
+	 * socket.
+	 */
 	if (!constant_tsc || !mask)
 		return 0;
 


