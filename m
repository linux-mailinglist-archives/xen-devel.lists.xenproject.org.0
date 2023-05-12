Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 79DE1701034
	for <lists+xen-devel@lfdr.de>; Fri, 12 May 2023 23:07:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.533917.831018 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pxZyv-0007VC-UP; Fri, 12 May 2023 21:07:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 533917.831018; Fri, 12 May 2023 21:07:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pxZyv-0007RI-Gs; Fri, 12 May 2023 21:07:17 +0000
Received: by outflank-mailman (input) for mailman id 533917;
 Fri, 12 May 2023 21:07:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5PQu=BB=linutronix.de=tglx@srs-se1.protection.inumbo.net>)
 id 1pxZyt-0004FP-Pq
 for xen-devel@lists.xenproject.org; Fri, 12 May 2023 21:07:15 +0000
Received: from galois.linutronix.de (galois.linutronix.de [193.142.43.55])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f8a78f7c-f108-11ed-b229-6b7b168915f2;
 Fri, 12 May 2023 23:07:15 +0200 (CEST)
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
X-Inumbo-ID: f8a78f7c-f108-11ed-b229-6b7b168915f2
Message-ID: <20230512205256.035041005@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1683925635;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 references:references; bh=eF12ofNTJSRvTVUxVjnfh7vrXqrzAu3KwLqma5Svbqk=;
	b=UCtRDgTYjJ+kttYU7M2mEpsUrBis05axy9leXWtF3JfKsHzJdY7XDzWQPHnc/2SfbSgxN3
	8m5ad//4LAOnFAOL/Bgz84MaRBcO8q4cF80CAbsgBeiJOqNvHtlhaoNC/64M0YgHrD7WZF
	m7FV4aKz3m5h6Cp6yr8xhr2AsQLLE9oZWQrHYW7hmApYt9s+zdNMxCD8Sk8khgr3V7jlH9
	24gCCAqrup+dWEuJ3AbsClaZO7eYMsrW2hnkYlv3wZF2rR4sXKxZwEhr7++CGNWie8aJ7i
	WfiNAqAgMWsw6ewnu1bT4mVJ2qzYDEvD4Kt4UFMTRKFhnF6SyLakq+SftbvVqQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1683925635;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 references:references; bh=eF12ofNTJSRvTVUxVjnfh7vrXqrzAu3KwLqma5Svbqk=;
	b=JUU+NLGEbC5VmebxGTxNM/TRbUGPyU8jXOJXmTvwOZyX3Vb6ZSwKxKk/9v+Ol3pfmA4OJd
	pwHgp2Bl/LROYvCg==
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
Subject:
 [patch V4 11/37] x86/cpu/cacheinfo: Remove cpu_callout_mask dependency
References: <20230512203426.452963764@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Date: Fri, 12 May 2023 23:07:14 +0200 (CEST)

From: Thomas Gleixner <tglx@linutronix.de>

cpu_callout_mask is used for the stop machine based MTRR/PAT init.

In preparation of moving the BP/AP synchronization to the core hotplug
code, use a private CPU mask for cacheinfo and manage it in the
starting/dying hotplug state.

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
Tested-by: Michael Kelley <mikelley@microsoft.com>
---
 arch/x86/kernel/cpu/cacheinfo.c |   21 +++++++++++++++++----
 1 file changed, 17 insertions(+), 4 deletions(-)

--- a/arch/x86/kernel/cpu/cacheinfo.c
+++ b/arch/x86/kernel/cpu/cacheinfo.c
@@ -39,6 +39,8 @@ DEFINE_PER_CPU_READ_MOSTLY(cpumask_var_t
 /* Shared L2 cache maps */
 DEFINE_PER_CPU_READ_MOSTLY(cpumask_var_t, cpu_l2c_shared_map);
 
+static cpumask_var_t cpu_cacheinfo_mask;
+
 /* Kernel controls MTRR and/or PAT MSRs. */
 unsigned int memory_caching_control __ro_after_init;
 
@@ -1172,8 +1174,10 @@ void cache_bp_restore(void)
 		cache_cpu_init();
 }
 
-static int cache_ap_init(unsigned int cpu)
+static int cache_ap_online(unsigned int cpu)
 {
+	cpumask_set_cpu(cpu, cpu_cacheinfo_mask);
+
 	if (!memory_caching_control || get_cache_aps_delayed_init())
 		return 0;
 
@@ -1191,11 +1195,17 @@ static int cache_ap_init(unsigned int cp
 	 *      lock to prevent MTRR entry changes
 	 */
 	stop_machine_from_inactive_cpu(cache_rendezvous_handler, NULL,
-				       cpu_callout_mask);
+				       cpu_cacheinfo_mask);
 
 	return 0;
 }
 
+static int cache_ap_offline(unsigned int cpu)
+{
+	cpumask_clear_cpu(cpu, cpu_cacheinfo_mask);
+	return 0;
+}
+
 /*
  * Delayed cache initialization for all AP's
  */
@@ -1210,9 +1220,12 @@ void cache_aps_init(void)
 
 static int __init cache_ap_register(void)
 {
+	zalloc_cpumask_var(&cpu_cacheinfo_mask, GFP_KERNEL);
+	cpumask_set_cpu(smp_processor_id(), cpu_cacheinfo_mask);
+
 	cpuhp_setup_state_nocalls(CPUHP_AP_CACHECTRL_STARTING,
 				  "x86/cachectrl:starting",
-				  cache_ap_init, NULL);
+				  cache_ap_online, cache_ap_offline);
 	return 0;
 }
-core_initcall(cache_ap_register);
+early_initcall(cache_ap_register);


