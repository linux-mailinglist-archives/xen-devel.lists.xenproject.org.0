Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 625626E2DAD
	for <lists+xen-devel@lfdr.de>; Sat, 15 Apr 2023 01:49:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.521371.810092 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pnTAn-0002Wt-Kz; Fri, 14 Apr 2023 23:49:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 521371.810092; Fri, 14 Apr 2023 23:49:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pnTAn-0002QR-BZ; Fri, 14 Apr 2023 23:49:45 +0000
Received: by outflank-mailman (input) for mailman id 521371;
 Fri, 14 Apr 2023 23:49:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ZCOw=AF=linutronix.de=tglx@srs-se1.protection.inumbo.net>)
 id 1pnT6S-0000zb-CK
 for xen-devel@lists.xenproject.org; Fri, 14 Apr 2023 23:45:16 +0000
Received: from galois.linutronix.de (galois.linutronix.de [193.142.43.55])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 673e1bc9-db1e-11ed-8611-37d641c3527e;
 Sat, 15 Apr 2023 01:45:14 +0200 (CEST)
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
X-Inumbo-ID: 673e1bc9-db1e-11ed-8611-37d641c3527e
Message-ID: <20230414232311.505152290@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1681515914;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 references:references; bh=nUZSh5064m2aKoxr+KQn5JPMu6mMKtsaGAC9NSZVNms=;
	b=tXdZ+JNXwmoFAj/D4wiLzLK3B9Tdjf372IqdJt5Tv46gv42xMEL/Nl0g5kdyiZHT7x9AOz
	mlFylzsIhnrXORGzmbDeoOd0v4PWWxn8r5JfaFvKB5y4Myd0UBCMyCyRl33Zi088uSB2Ir
	SvONUInWoGIX09mANT0wqHnMa8plhV/+A02oVVT5ueBVnLW3psXBgZVX1wGuoSRuwDa/iV
	WCxZeGiReQ8KfEt87/havCjKqbuogL4jZdqFqdulIebLR5I3xNrYIQ3tyIgS/ypjvwLm3u
	ZY0rsKukGMk7diouGwNhACQ22cLpXT7hOtDVbk+HLvlFHbrtTgmHuHYua/2ZDA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1681515914;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 references:references; bh=nUZSh5064m2aKoxr+KQn5JPMu6mMKtsaGAC9NSZVNms=;
	b=pkIQhDhWjPpGLy6aH5XoCk5G1NoyA94urqDixfl4xi4JgoGh52mUmdlWbRdLMez3lvqnCR
	cNwc4JXhAqWj08Aw==
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
 Sabin Rapan <sabrapan@amazon.com>,
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
 Mark Rutland <mark.rutland@arm.com>
Subject: [patch 37/37] x86/smpboot: Allow parallel bringup for SEV-ES
References: <20230414225551.858160935@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Date: Sat, 15 Apr 2023 01:45:13 +0200 (CEST)

From: David Woodhouse <dwmw@amazon.co.uk>

Enable parallel bringup for SEV-ES guests. The APs can't actually execute
the CPUID instruction directly during early startup, but they can make the
GHCB call directly instead, just as the #VC trap handler would do.

Thanks to Sabin for talking me through the way this works.

Suggested-by: Sabin Rapan <sabrapan@amazon.com>
Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
Signed-off-by: Usama Arif <usama.arif@bytedance.com>
Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
Reviewed-by: Tom Lendacky <thomas.lendacky@amd.com>

---
 arch/x86/include/asm/sev-common.h |    3 +++
 arch/x86/include/asm/smp.h        |    1 +
 arch/x86/kernel/head_64.S         |   30 ++++++++++++++++++++++++++++++
 arch/x86/kernel/smpboot.c         |   14 ++++++++++++--
 4 files changed, 46 insertions(+), 2 deletions(-)

--- a/arch/x86/include/asm/sev-common.h
+++ b/arch/x86/include/asm/sev-common.h
@@ -70,6 +70,7 @@
 	/* GHCBData[63:12] */				\
 	(((u64)(v) & GENMASK_ULL(63, 12)) >> 12)
 
+#ifndef __ASSEMBLY__
 /*
  * SNP Page State Change Operation
  *
@@ -161,6 +162,8 @@ struct snp_psc_desc {
 
 #define GHCB_RESP_CODE(v)		((v) & GHCB_MSR_INFO_MASK)
 
+#endif /* __ASSEMBLY__ */
+
 /*
  * Error codes related to GHCB input that can be communicated back to the guest
  * by setting the lower 32-bits of the GHCB SW_EXITINFO1 field to 2.
--- a/arch/x86/include/asm/smp.h
+++ b/arch/x86/include/asm/smp.h
@@ -202,6 +202,7 @@ extern unsigned int smpboot_control;
 #define STARTUP_APICID_CPUID_1F 0x80000000
 #define STARTUP_APICID_CPUID_0B 0x40000000
 #define STARTUP_APICID_CPUID_01 0x20000000
+#define STARTUP_APICID_SEV_ES	0x10000000
 
 /* Top 8 bits are reserved for control */
 #define STARTUP_PARALLEL_MASK	0xFF000000
--- a/arch/x86/kernel/head_64.S
+++ b/arch/x86/kernel/head_64.S
@@ -26,6 +26,7 @@
 #include <asm/nospec-branch.h>
 #include <asm/fixmap.h>
 #include <asm/smp.h>
+#include <asm/sev-common.h>
 
 /*
  * We are not able to switch in one step to the final KERNEL ADDRESS SPACE
@@ -243,9 +244,14 @@ SYM_INNER_LABEL(secondary_startup_64_no_
 	 * Bit 31	STARTUP_APICID_CPUID_1F flag (use CPUID 0x1f)
 	 * Bit 30	STARTUP_APICID_CPUID_0B flag (use CPUID 0x0b)
 	 * Bit 29	STARTUP_APICID_CPUID_01 flag (use CPUID 0x01)
+	 * Bit 28	STARTUP_APICID_SEV_ES flag (CPUID 0x0b via GHCB MSR)
 	 * Bit 0-23	CPU# if STARTUP_APICID_CPUID_xx flags are not set
 	 */
 	movl	smpboot_control(%rip), %ecx
+#ifdef CONFIG_AMD_MEM_ENCRYPT
+	testl	$STARTUP_APICID_SEV_ES, %ecx
+	jnz	.Luse_sev_cpuid_0b
+#endif
 	testl	$STARTUP_APICID_CPUID_1F, %ecx
 	jnz	.Luse_cpuid_1f
 	testl	$STARTUP_APICID_CPUID_0B, %ecx
@@ -262,6 +268,30 @@ SYM_INNER_LABEL(secondary_startup_64_no_
 	shr	$24, %edx
 	jmp	.Lsetup_AP
 
+#ifdef CONFIG_AMD_MEM_ENCRYPT
+.Luse_sev_cpuid_0b:
+	/* Set the GHCB MSR to request CPUID 0x0B_EDX */
+	movl	$MSR_AMD64_SEV_ES_GHCB, %ecx
+	movl	$(GHCB_CPUID_REQ_EDX << 30) | GHCB_MSR_CPUID_REQ, %eax
+	movl	$0x0b, %edx
+	wrmsr
+
+	/* Perform GHCB MSR protocol */
+	rep; vmmcall		/* vmgexit */
+
+	/*
+	 * Get the result. After the RDMSR:
+	 *   EAX should be 0xc0000005
+	 *   EDX should have the CPUID register value and since EDX
+	 *   is the target register, no need to move the result.
+	 */
+	rdmsr
+	andl	$GHCB_MSR_INFO_MASK, %eax
+	cmpl	$GHCB_MSR_CPUID_RESP, %eax
+	jne	1f
+	jmp	.Lsetup_AP
+#endif
+
 .Luse_cpuid_0b:
 	mov	$0x0B, %eax
 	xorl	%ecx, %ecx
--- a/arch/x86/kernel/smpboot.c
+++ b/arch/x86/kernel/smpboot.c
@@ -86,6 +86,7 @@
 #include <asm/hw_irq.h>
 #include <asm/stackprotector.h>
 #include <asm/sev.h>
+#include <asm/coco.h>
 
 /* representing HT siblings of each logical CPU */
 DEFINE_PER_CPU_READ_MOSTLY(cpumask_var_t, cpu_sibling_map);
@@ -1266,8 +1267,16 @@ bool __init arch_cpuhp_init_parallel_bri
 
 	/* Encrypted guests require special CPUID handling. */
 	if (cc_platform_has(CC_ATTR_GUEST_STATE_ENCRYPT)) {
-		pr_info("Parallel CPU startup disabled due to guest state encryption\n");
-		return false;
+		switch (cc_get_vendor()) {
+		case CC_VENDOR_AMD:
+			ctrl = STARTUP_APICID_SEV_ES;
+			if (topology_extended_leaf == 0x0b)
+				goto setup;
+			fallthrough;
+		default:
+			pr_info("Parallel CPU startup disabled due to guest state encryption\n");
+			return false;
+		}
 	}
 
 	switch (topology_extended_leaf) {
@@ -1290,6 +1299,7 @@ bool __init arch_cpuhp_init_parallel_bri
 		return false;
 	}
 
+setup:
 	pr_debug("Parallel CPU startup enabled: 0x%08x\n", ctrl);
 	smpboot_control = ctrl;
 	return true;


