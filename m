Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 44CA489FBC6
	for <lists+xen-devel@lfdr.de>; Wed, 10 Apr 2024 17:37:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.703375.1099030 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rua0O-0007rg-B2; Wed, 10 Apr 2024 15:36:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 703375.1099030; Wed, 10 Apr 2024 15:36:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rua0O-0007pa-7V; Wed, 10 Apr 2024 15:36:56 +0000
Received: by outflank-mailman (input) for mailman id 703375;
 Wed, 10 Apr 2024 15:36:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=NRyK=LP=localhost=root@srs-se1.protection.inumbo.net>)
 id 1rua0M-0007oC-Sg
 for xen-devel@lists.xenproject.org; Wed, 10 Apr 2024 15:36:54 +0000
Received: from localhost (ip-201.net-81-220-136.rev.numericable.fr
 [81.220.136.201]) by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id 26cd26b8-f750-11ee-94a3-07e782e9044d;
 Wed, 10 Apr 2024 17:36:51 +0200 (CEST)
Received: by localhost (Postfix, from userid 0)
 id 57DEEE3202; Wed, 10 Apr 2024 17:36:51 +0200 (CEST)
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
X-Inumbo-ID: 26cd26b8-f750-11ee-94a3-07e782e9044d
From: Andrei Semenov <andrei.semenov@vates.fr>
To: xen-devel@lists.xenproject.org
Cc: Andrei Semenov <andrei.semenov@vates.fr>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v1 1/2] Implemented AMD SEV discovery and enabling.
Date: Wed, 10 Apr 2024 17:36:36 +0200
Message-Id: <27fce67472c97b2b2b7cc0412bf0edcaa67cc63f.1712759753.git.andrei.semenov@vates.fr>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <cover.1712759753.git.andrei.semenov@vates.fr>
References: <cover.1712759753.git.andrei.semenov@vates.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Andrei Semenov <andrei.semenov@vates.fr>
---
 xen/arch/x86/cpu/amd.c                 | 53 ++++++++++++++++++++++++++
 xen/arch/x86/hvm/svm/Makefile          |  1 +
 xen/arch/x86/hvm/svm/sev.c             |  4 ++
 xen/arch/x86/include/asm/cpufeature.h  |  3 ++
 xen/arch/x86/include/asm/cpufeatures.h |  2 +
 xen/arch/x86/include/asm/msr-index.h   |  1 +
 xen/arch/x86/include/asm/sev.h         | 11 ++++++
 7 files changed, 75 insertions(+)
 create mode 100644 xen/arch/x86/hvm/svm/sev.c
 create mode 100644 xen/arch/x86/include/asm/sev.h

diff --git a/xen/arch/x86/cpu/amd.c b/xen/arch/x86/cpu/amd.c
index ab92333673..a5903613f0 100644
--- a/xen/arch/x86/cpu/amd.c
+++ b/xen/arch/x86/cpu/amd.c
@@ -16,6 +16,7 @@
 #include <asm/acpi.h>
 #include <asm/apic.h>
 #include <asm/microcode.h>
+#include <asm/sev.h>
 
 #include "cpu.h"
 
@@ -1030,6 +1031,54 @@ static void amd_check_erratum_1485(void)
 	wrmsrl(MSR_AMD64_BP_CFG, val | chickenbit);
 }
 
+#ifdef CONFIG_HVM
+static void amd_enable_mem_encrypt(const struct cpuinfo_x86 *c)
+{
+	unsigned int  eax, ebx, ecx, edx;
+	uint64_t syscfg;
+
+	if (!smp_processor_id()) {
+
+		cpuid_count(0x80000000,0,&eax, &ebx, &ecx, &edx);
+
+		if (eax <  0x8000001f)
+			return;
+
+		cpuid_count(0x8000001f,0,&eax, &ebx, &ecx, &edx);
+
+		if (eax & 0x1)
+			setup_force_cpu_cap(X86_FEATURE_SME);
+
+		if (eax & 0x2) {
+			setup_force_cpu_cap(X86_FEATURE_SEV);
+			max_sev_asid = ecx;
+			min_sev_asid = edx;
+		}
+
+		if (eax & 0x3)
+			pte_c_bit_mask = 1UL << (ebx & 0x3f);
+	}
+
+	if (!(cpu_has_sme || cpu_has_sev))
+		return;
+
+	if (!smp_processor_id()) {
+		if (cpu_has_sev)
+			printk(XENLOG_INFO "SEV: ASID range [0x%x - 0x%x]\n",
+			min_sev_asid, max_sev_asid);
+	}
+
+	rdmsrl(MSR_K8_SYSCFG, syscfg);
+
+	if (syscfg & SYSCFG_MEM_ENCRYPT) {
+		return;
+	}
+
+	syscfg |= SYSCFG_MEM_ENCRYPT;
+	wrmsrl(MSR_K8_SYSCFG, syscfg);
+}
+#endif
+
 static void cf_check init_amd(struct cpuinfo_x86 *c)
 {
 	u32 l, h;
@@ -1305,6 +1354,10 @@ static void cf_check init_amd(struct cpuinfo_x86 *c)
 	check_syscfg_dram_mod_en();
 
 	amd_log_freq(c);
+
+#ifdef CONFIG_HVM
+	amd_enable_mem_encrypt(c);
+#endif
 }
 
 const struct cpu_dev __initconst_cf_clobber amd_cpu_dev = {
diff --git a/xen/arch/x86/hvm/svm/Makefile b/xen/arch/x86/hvm/svm/Makefile
index 760d2954da..9773d539ef 100644
--- a/xen/arch/x86/hvm/svm/Makefile
+++ b/xen/arch/x86/hvm/svm/Makefile
@@ -6,3 +6,4 @@ obj-y += nestedsvm.o
 obj-y += svm.o
 obj-y += svmdebug.o
 obj-y += vmcb.o
+obj-y += sev.o
diff --git a/xen/arch/x86/hvm/svm/sev.c b/xen/arch/x86/hvm/svm/sev.c
new file mode 100644
index 0000000000..336fad25f5
--- /dev/null
+++ b/xen/arch/x86/hvm/svm/sev.c
@@ -0,0 +1,4 @@
+#include <asm/sev.h>
+uint64_t __read_mostly pte_c_bit_mask;
+unsigned int __read_mostly min_sev_asid;
+unsigned int __read_mostly max_sev_asid;
diff --git a/xen/arch/x86/include/asm/cpufeature.h b/xen/arch/x86/include/asm/cpufeature.h
index 743f11f989..a41374d0b7 100644
--- a/xen/arch/x86/include/asm/cpufeature.h
+++ b/xen/arch/x86/include/asm/cpufeature.h
@@ -231,6 +231,9 @@ static inline bool boot_cpu_has(unsigned int feat)
 
 #define cpu_has_msr_tsc_aux     (cpu_has_rdtscp || cpu_has_rdpid)
 
+#define cpu_has_sme             boot_cpu_has(X86_FEATURE_SME)
+#define cpu_has_sev             boot_cpu_has(X86_FEATURE_SEV)
+
 /* Bugs. */
 #define cpu_bug_fpu_ptrs        boot_cpu_has(X86_BUG_FPU_PTRS)
 #define cpu_bug_null_seg        boot_cpu_has(X86_BUG_NULL_SEG)
diff --git a/xen/arch/x86/include/asm/cpufeatures.h b/xen/arch/x86/include/asm/cpufeatures.h
index ba3df174b7..9b67ea2427 100644
--- a/xen/arch/x86/include/asm/cpufeatures.h
+++ b/xen/arch/x86/include/asm/cpufeatures.h
@@ -42,6 +42,8 @@ XEN_CPUFEATURE(XEN_SHSTK,         X86_SYNTH(26)) /* Xen uses CET Shadow Stacks *
 XEN_CPUFEATURE(XEN_IBT,           X86_SYNTH(27)) /* Xen uses CET Indirect Branch Tracking */
 XEN_CPUFEATURE(IBPB_ENTRY_PV,     X86_SYNTH(28)) /* MSR_PRED_CMD used by Xen for PV */
 XEN_CPUFEATURE(IBPB_ENTRY_HVM,    X86_SYNTH(29)) /* MSR_PRED_CMD used by Xen for HVM */
+XEN_CPUFEATURE(SME,               X86_SYNTH(30)) /* AMD Secure Memory Encrypion */
+XEN_CPUFEATURE(SEV,               X86_SYNTH(31)) /* AMD Secure Encryption Virtualization */
 
 /* Bug words follow the synthetic words. */
 #define X86_NR_BUG 1
diff --git a/xen/arch/x86/include/asm/msr-index.h b/xen/arch/x86/include/asm/msr-index.h
index 92dd9fa496..318e8ca0c0 100644
--- a/xen/arch/x86/include/asm/msr-index.h
+++ b/xen/arch/x86/include/asm/msr-index.h
@@ -221,6 +221,7 @@
 #define  SYSCFG_MTRR_VAR_DRAM_EN            (_AC(1, ULL) << 20)
 #define  SYSCFG_MTRR_TOM2_EN                (_AC(1, ULL) << 21)
 #define  SYSCFG_TOM2_FORCE_WB               (_AC(1, ULL) << 22)
+#define  SYSCFG_MEM_ENCRYPT                 (_AC(1, ULL) << 23)
 
 #define MSR_K8_IORR_BASE0                   _AC(0xc0010016, U)
 #define MSR_K8_IORR_MASK0                   _AC(0xc0010017, U)
diff --git a/xen/arch/x86/include/asm/sev.h b/xen/arch/x86/include/asm/sev.h
new file mode 100644
index 0000000000..7bec230c7b
--- /dev/null
+++ b/xen/arch/x86/include/asm/sev.h
@@ -0,0 +1,11 @@
+#ifndef __XEN_SEV_H__
+#define __XEN_SEV_H__
+
+#include <xen/types.h>
+#include <asm/cache.h>
+
+extern uint64_t __read_mostly pte_c_bit_mask;
+extern unsigned int __read_mostly min_sev_asid;
+extern unsigned int __read_mostly max_sev_asid;
+
+#endif
-- 
2.35.3


