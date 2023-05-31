Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CF39717885
	for <lists+xen-devel@lfdr.de>; Wed, 31 May 2023 09:45:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.541625.844573 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q4GVT-00077x-BI; Wed, 31 May 2023 07:44:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 541625.844573; Wed, 31 May 2023 07:44:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q4GVT-00075X-89; Wed, 31 May 2023 07:44:31 +0000
Received: by outflank-mailman (input) for mailman id 541625;
 Wed, 31 May 2023 07:44:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qQHT=BU=linutronix.de=tglx@srs-se1.protection.inumbo.net>)
 id 1q4GVR-00075B-TQ
 for xen-devel@lists.xenproject.org; Wed, 31 May 2023 07:44:29 +0000
Received: from galois.linutronix.de (galois.linutronix.de
 [2a0a:51c0:0:12e:550::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f8822e8d-ff86-11ed-b231-6b7b168915f2;
 Wed, 31 May 2023 09:44:28 +0200 (CEST)
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
X-Inumbo-ID: f8822e8d-ff86-11ed-b231-6b7b168915f2
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1685519067;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=w+JYerxWJSKupTV1uEaRy4HAvltDS00WO6xGerR48rM=;
	b=a5vi7FP4K2/0WepNfGqeR/1wGpNma9maeRFF/S+Ow1vyJUxlrhPjlqpp0Gt/tzTbtGb9+h
	l3LwhAd8UbuY25f1yxIvmEJg9IiycQoNmE2Jw46Svp/LlN0TDRsCc1rPrDCmSd7QhGP+2X
	bpOZCtZBEicRixezH5KsGlLKe9iAgpeZd8Acr1epWp4OHRKWxl6sahQA7Ect0KPEWRsl8P
	Y5mx+YIQEij+GUPZWZZnXzdfGCoGo0Dylkir7fmS/sA84o97ZsT75+6BgHuS4kekwgCwF2
	0PAfMiN4GOmyR3diQuwLhVAfANGV+kugCPs4bHz8Idk3MexeM+liZaUuTG2wZA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1685519067;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=w+JYerxWJSKupTV1uEaRy4HAvltDS00WO6xGerR48rM=;
	b=hiUajp6HjMrpej9Plw6pV1er+5xqm8AlaocdPjp6g94On4ClItoSp7WWjhUGtjQr4KH1MY
	2ShCuAlv5qPs3qDQ==
To: Tom Lendacky <thomas.lendacky@amd.com>, Sean Christopherson
 <seanjc@google.com>
Cc: "Kirill A. Shutemov" <kirill@shutemov.name>, LKML
 <linux-kernel@vger.kernel.org>, x86@kernel.org, David Woodhouse
 <dwmw2@infradead.org>, Andrew Cooper <andrew.cooper3@citrix.com>, Brian
 Gerst <brgerst@gmail.com>, Arjan van de Veen <arjan@linux.intel.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Paul McKenney <paulmck@kernel.org>,
 Oleksandr Natalenko <oleksandr@natalenko.name>, Paul Menzel
 <pmenzel@molgen.mpg.de>, "Guilherme G. Piccoli" <gpiccoli@igalia.com>,
 Piotr Gorski <lucjan.lucjanov@gmail.com>, Usama Arif
 <usama.arif@bytedance.com>, Juergen Gross <jgross@suse.com>, Boris
 Ostrovsky <boris.ostrovsky@oracle.com>, xen-devel@lists.xenproject.org,
 Russell King <linux@armlinux.org.uk>, Arnd Bergmann <arnd@arndb.de>,
 linux-arm-kernel@lists.infradead.org, Catalin Marinas
 <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Guo Ren
 <guoren@kernel.org>, linux-csky@vger.kernel.org, Thomas Bogendoerfer
 <tsbogend@alpha.franken.de>, linux-mips@vger.kernel.org, "James E.J.
 Bottomley" <James.Bottomley@hansenpartnership.com>, Helge Deller
 <deller@gmx.de>, linux-parisc@vger.kernel.org, Paul Walmsley
 <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 linux-riscv@lists.infradead.org, Mark Rutland <mark.rutland@arm.com>,
 Sabin Rapan <sabrapan@amazon.com>, "Michael Kelley (LINUX)"
 <mikelley@microsoft.com>, Dave Hansen <dave.hansen@linux.intel.com>
Subject: [patch] x86/smpboot: Fix the parallel bringup decision
In-Reply-To: <b6323987-059e-5396-20b9-8b6a1687e289@amd.com>
References: <87sfbhlwp9.ffs@tglx>
 <20230529023939.mc2akptpxcg3eh2f@box.shutemov.name> <87bki3kkfi.ffs@tglx>
 <20230529203129.sthnhzgds7ynddxd@box.shutemov.name>
 <20230530005428.jyrc2ezx5raohlrt@box.shutemov.name> <87mt1mjhk3.ffs@tglx>
 <87jzwqjeey.ffs@tglx> <87cz2ija1e.ffs@tglx>
 <20230530122951.2wu5rwcu26ofov6f@box.shutemov.name> <87wn0pizbl.ffs@tglx>
 <ZHYqwsCURnrFdsVm@google.com> <87leh5iom8.ffs@tglx>
 <8751e955-e975-c6d4-630c-02912b9ef9da@amd.com> <871qiximen.ffs@tglx>
 <b6323987-059e-5396-20b9-8b6a1687e289@amd.com>
Date: Wed, 31 May 2023 09:44:26 +0200
Message-ID: <87ilc9gd2d.ffs@tglx>
MIME-Version: 1.0
Content-Type: text/plain

The decision to allow parallel bringup of secondary CPUs checks
CC_ATTR_GUEST_STATE_ENCRYPT to detect encrypted guests. Those cannot use
parallel bootup because accessing the local APIC is intercepted and raises
a #VC or #VE, which cannot be handled at that point.

The check works correctly, but only for AMD encrypted guests. TDX does not
set that flag.

As there is no real connection between CC attributes and the inability to
support parallel bringup, replace this with a generic control flag in
x86_cpuinit and let SEV-ES and TDX init code disable it.

Fixes: 0c7ffa32dbd6 ("x86/smpboot/64: Implement arch_cpuhp_init_parallel_bringup() and enable it")
Reported-by: Kirill A. Shutemov <kirill.shutemov@linux.intel.com>
Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
---
 arch/x86/coco/tdx/tdx.c         |   11 +++++++++++
 arch/x86/include/asm/x86_init.h |    3 +++
 arch/x86/kernel/smpboot.c       |   19 ++-----------------
 arch/x86/kernel/x86_init.c      |    1 +
 arch/x86/mm/mem_encrypt_amd.c   |   15 +++++++++++++++
 5 files changed, 32 insertions(+), 17 deletions(-)

--- a/arch/x86/coco/tdx/tdx.c
+++ b/arch/x86/coco/tdx/tdx.c
@@ -871,5 +871,16 @@ void __init tdx_early_init(void)
 	x86_platform.guest.enc_tlb_flush_required   = tdx_tlb_flush_required;
 	x86_platform.guest.enc_status_change_finish = tdx_enc_status_changed;
 
+	/*
+	 * TDX intercepts the RDMSR to read the X2APIC ID in the parallel
+	 * bringup low level code. That raises #VE which cannot be handled
+	 * there.
+	 *
+	 * Intel-TDX has a secure RDMSR hypercall, but that needs to be
+	 * implemented seperately in the low level startup ASM code.
+	 * Until that is in place, disable parallel bringup for TDX.
+	 */
+	x86_cpuinit.parallel_bringup = false;
+
 	pr_info("Guest detected\n");
 }
--- a/arch/x86/include/asm/x86_init.h
+++ b/arch/x86/include/asm/x86_init.h
@@ -177,11 +177,14 @@ struct x86_init_ops {
  * struct x86_cpuinit_ops - platform specific cpu hotplug setups
  * @setup_percpu_clockev:	set up the per cpu clock event device
  * @early_percpu_clock_init:	early init of the per cpu clock event device
+ * @fixup_cpu_id:		fixup function for cpuinfo_x86::phys_proc_id
+ * @parallel_bringup:		Parallel bringup control
  */
 struct x86_cpuinit_ops {
 	void (*setup_percpu_clockev)(void);
 	void (*early_percpu_clock_init)(void);
 	void (*fixup_cpu_id)(struct cpuinfo_x86 *c, int node);
+	bool parallel_bringup;
 };
 
 struct timespec64;
--- a/arch/x86/kernel/smpboot.c
+++ b/arch/x86/kernel/smpboot.c
@@ -1267,23 +1267,8 @@ void __init smp_prepare_cpus_common(void
 /* Establish whether parallel bringup can be supported. */
 bool __init arch_cpuhp_init_parallel_bringup(void)
 {
-	/*
-	 * Encrypted guests require special handling. They enforce X2APIC
-	 * mode but the RDMSR to read the APIC ID is intercepted and raises
-	 * #VC or #VE which cannot be handled in the early startup code.
-	 *
-	 * AMD-SEV does not provide a RDMSR GHCB protocol so the early
-	 * startup code cannot directly communicate with the secure
-	 * firmware. The alternative solution to retrieve the APIC ID via
-	 * CPUID(0xb), which is covered by the GHCB protocol, is not viable
-	 * either because there is no enforcement of the CPUID(0xb)
-	 * provided "initial" APIC ID to be the same as the real APIC ID.
-	 *
-	 * Intel-TDX has a secure RDMSR hypercall, but that needs to be
-	 * implemented seperately in the low level startup ASM code.
-	 */
-	if (cc_platform_has(CC_ATTR_GUEST_STATE_ENCRYPT)) {
-		pr_info("Parallel CPU startup disabled due to guest state encryption\n");
+	if (!x86_cpuinit.parallel_bringup) {
+		pr_info("Parallel CPU startup disabled by the platform\n");
 		return false;
 	}
 
--- a/arch/x86/kernel/x86_init.c
+++ b/arch/x86/kernel/x86_init.c
@@ -126,6 +126,7 @@ struct x86_init_ops x86_init __initdata
 struct x86_cpuinit_ops x86_cpuinit = {
 	.early_percpu_clock_init	= x86_init_noop,
 	.setup_percpu_clockev		= setup_secondary_APIC_clock,
+	.parallel_bringup		= true,
 };
 
 static void default_nmi_init(void) { };
--- a/arch/x86/mm/mem_encrypt_amd.c
+++ b/arch/x86/mm/mem_encrypt_amd.c
@@ -501,6 +501,21 @@ void __init sme_early_init(void)
 	x86_platform.guest.enc_status_change_finish  = amd_enc_status_change_finish;
 	x86_platform.guest.enc_tlb_flush_required    = amd_enc_tlb_flush_required;
 	x86_platform.guest.enc_cache_flush_required  = amd_enc_cache_flush_required;
+
+	/*
+	 * AMD-SEV-ES intercepts the RDMSR to read the X2APIC ID in the
+	 * parallel bringup low level code. That raises #VC which cannot be
+	 * handled there.
+	 * It does not provide a RDMSR GHCB protocol so the early startup
+	 * code cannot directly communicate with the secure firmware. The
+	 * alternative solution to retrieve the APIC ID via CPUID(0xb),
+	 * which is covered by the GHCB protocol, is not viable either
+	 * because there is no enforcement of the CPUID(0xb) provided
+	 * "initial" APIC ID to be the same as the real APIC ID.
+	 * Disable parallel bootup.
+	 */
+	if (sev_status & MSR_AMD64_SEV_ES_ENABLED)
+		x86_cpuinit.parallel_bringup = false;
 }
 
 void __init mem_encrypt_free_decrypted_mem(void)

