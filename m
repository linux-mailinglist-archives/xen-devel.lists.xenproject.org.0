Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A01AE73D66E
	for <lists+xen-devel@lfdr.de>; Mon, 26 Jun 2023 05:39:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.554999.866555 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qDd4p-0005hp-Mx; Mon, 26 Jun 2023 03:39:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 554999.866555; Mon, 26 Jun 2023 03:39:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qDd4p-0005fu-Cr; Mon, 26 Jun 2023 03:39:43 +0000
Received: by outflank-mailman (input) for mailman id 554999;
 Mon, 26 Jun 2023 03:39:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=24BZ=CO=arm.com=Penny.Zheng@srs-se1.protection.inumbo.net>)
 id 1qDd2Y-0000HH-2o
 for xen-devel@lists.xenproject.org; Mon, 26 Jun 2023 03:37:22 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id c12175c0-13d2-11ee-8611-37d641c3527e;
 Mon, 26 Jun 2023 05:37:20 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id ACEEE1FB;
 Sun, 25 Jun 2023 20:38:03 -0700 (PDT)
Received: from a011292.shanghai.arm.com (a011292.shanghai.arm.com
 [10.169.190.94])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 01B993F64C;
 Sun, 25 Jun 2023 20:37:16 -0700 (PDT)
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
X-Inumbo-ID: c12175c0-13d2-11ee-8611-37d641c3527e
From: Penny Zheng <Penny.Zheng@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Penny Zheng <Penny.Zheng@arm.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Penny Zheng <penny.zheng@arm.com>,
	Wei Chen <wei.chen@arm.com>
Subject: [PATCH v3 42/52] xen/mpu: implement setup_virt_paging for MPU system
Date: Mon, 26 Jun 2023 11:34:33 +0800
Message-Id: <20230626033443.2943270-43-Penny.Zheng@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230626033443.2943270-1-Penny.Zheng@arm.com>
References: <20230626033443.2943270-1-Penny.Zheng@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

For MMU system, setup_virt_paging is used to configure stage 2 address
translation regime, like IPA bits, VMID allocator set up, etc.
Some could be inherited in MPU system, like VMID allocator set up, etc.

For MPU system, we could have the following memory translation regime:
- PMSAv8-64 at both EL1/EL0 and EL2
- VMSAv8-64 at EL1/EL0 and PMSAv8-64 at EL2
The default option will be the second, unless the platform could not support,
which could be checked against MSA_frac bit in Memory Model Feature Register 0(
ID_AA64MMFR0_EL1).

Signed-off-by: Penny Zheng <penny.zheng@arm.com>
Signed-off-by: Wei Chen <wei.chen@arm.com>
---
v3:
- no change
---
 xen/arch/arm/Makefile                 |  1 +
 xen/arch/arm/include/asm/cpufeature.h |  7 ++
 xen/arch/arm/include/asm/p2m.h        |  8 +++
 xen/arch/arm/include/asm/processor.h  | 13 ++++
 xen/arch/arm/mpu/p2m.c                | 92 +++++++++++++++++++++++++++
 5 files changed, 121 insertions(+)
 create mode 100644 xen/arch/arm/mpu/p2m.c

diff --git a/xen/arch/arm/Makefile b/xen/arch/arm/Makefile
index feb49640a0..9f4b11b069 100644
--- a/xen/arch/arm/Makefile
+++ b/xen/arch/arm/Makefile
@@ -47,6 +47,7 @@ obj-y += mmu/p2m.o
 else
 obj-y += mpu/mm.o
 obj-y += mpu/setup.o
+obj-y += mpu/p2m.o
 endif
 obj-y += mm.o
 obj-y += monitor.o
diff --git a/xen/arch/arm/include/asm/cpufeature.h b/xen/arch/arm/include/asm/cpufeature.h
index 894f278a4a..cbaf41881b 100644
--- a/xen/arch/arm/include/asm/cpufeature.h
+++ b/xen/arch/arm/include/asm/cpufeature.h
@@ -250,6 +250,12 @@ struct cpuinfo_arm {
             unsigned long tgranule_16K:4;
             unsigned long tgranule_64K:4;
             unsigned long tgranule_4K:4;
+#ifdef CONFIG_HAS_MPU
+            unsigned long __res:16;
+            unsigned long msa:4;
+            unsigned long msa_frac:4;
+            unsigned long __res0:8;
+#else
             unsigned long tgranule_16k_2:4;
             unsigned long tgranule_64k_2:4;
             unsigned long tgranule_4k_2:4;
@@ -257,6 +263,7 @@ struct cpuinfo_arm {
             unsigned long __res0:8;
             unsigned long fgt:4;
             unsigned long ecv:4;
+#endif
 
             /* MMFR1 */
             unsigned long hafdbs:4;
diff --git a/xen/arch/arm/include/asm/p2m.h b/xen/arch/arm/include/asm/p2m.h
index f62d632830..d9c91d4a98 100644
--- a/xen/arch/arm/include/asm/p2m.h
+++ b/xen/arch/arm/include/asm/p2m.h
@@ -16,8 +16,16 @@ extern unsigned int p2m_ipa_bits;
 
 extern unsigned int p2m_root_order;
 extern unsigned int p2m_root_level;
+#ifdef CONFIG_HAS_MPU
+/*
+ * A 4KB Page is enough for stage 2 translation in MPU system, which could
+ * store at most 255 EL2 MPU memory regions.
+ */
+#define P2M_ROOT_ORDER 0
+#else
 #define P2M_ROOT_ORDER    p2m_root_order
 #define P2M_ROOT_LEVEL p2m_root_level
+#endif
 
 #define MAX_VMID_8_BIT  (1UL << 8)
 #define MAX_VMID_16_BIT (1UL << 16)
diff --git a/xen/arch/arm/include/asm/processor.h b/xen/arch/arm/include/asm/processor.h
index 685f9b18fd..fe761ce50f 100644
--- a/xen/arch/arm/include/asm/processor.h
+++ b/xen/arch/arm/include/asm/processor.h
@@ -389,6 +389,12 @@
 
 #define VTCR_RES1       (_AC(1,UL)<<31)
 
+#ifdef CONFIG_HAS_MPU
+#define VTCR_MSA_VMSA   (_AC(0x1,UL)<<31)
+#define VTCR_MSA_PMSA   ~(_AC(0x1,UL)<<31)
+#define NSA_SEL2        ~(_AC(0x1,UL)<<30)
+#endif
+
 /* HCPTR Hyp. Coprocessor Trap Register */
 #define HCPTR_TAM       ((_AC(1,U)<<30))
 #define HCPTR_TTA       ((_AC(1,U)<<20))        /* Trap trace registers */
@@ -449,6 +455,13 @@
 #define MM64_VMID_16_BITS_SUPPORT   0x2
 #endif
 
+#ifdef CONFIG_HAS_MPU
+#define MM64_MSA_PMSA_SUPPORT       0xf
+#define MM64_MSA_FRAC_NONE_SUPPORT  0x0
+#define MM64_MSA_FRAC_PMSA_SUPPORT  0x1
+#define MM64_MSA_FRAC_VMSA_SUPPORT  0x2
+#endif
+
 #ifndef __ASSEMBLY__
 
 extern register_t __cpu_logical_map[];
diff --git a/xen/arch/arm/mpu/p2m.c b/xen/arch/arm/mpu/p2m.c
new file mode 100644
index 0000000000..04c44825cb
--- /dev/null
+++ b/xen/arch/arm/mpu/p2m.c
@@ -0,0 +1,92 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#include <xen/lib.h>
+#include <xen/mm-frame.h>
+#include <xen/sched.h>
+#include <xen/warning.h>
+
+#include <asm/p2m.h>
+#include <asm/processor.h>
+#include <asm/sysregs.h>
+
+void __init setup_virt_paging(void)
+{
+    uint64_t val = 0;
+    bool p2m_vmsa = true;
+
+    /* PA size */
+    const unsigned int pa_range_info[] = { 32, 36, 40, 42, 44, 48, 52, 0, /* Invalid */ };
+
+    /*
+     * Restrict "p2m_ipa_bits" if needed. As P2M table is always configured
+     * with IPA bits == PA bits, compare against "pabits".
+     */
+    if ( pa_range_info[system_cpuinfo.mm64.pa_range] < p2m_ipa_bits )
+        p2m_ipa_bits = pa_range_info[system_cpuinfo.mm64.pa_range];
+
+    /* In ARMV8R, hypervisor in secure EL2. */
+    val &= NSA_SEL2;
+
+    /*
+     * The MSA and MSA_frac fields in the ID_AA64MMFR0_EL1 register
+     * identify the memory system configurations supported at EL1.
+     * In Armv8-R AArch64, the only permitted value for ID_AA64MMFR0_EL1.MSA is
+     * 0b1111. When ID_AA64MMFR0_EL1.MSA_frac is 0b0010, the stage 1 of the
+     * Secure EL1&0 translation regime can enable PMSAv8-64 or VMSAv8-64
+     * architecture.
+     */
+    if ( system_cpuinfo.mm64.msa == MM64_MSA_PMSA_SUPPORT )
+    {
+        if ( system_cpuinfo.mm64.msa_frac == MM64_MSA_FRAC_NONE_SUPPORT )
+            goto fault;
+
+        if ( system_cpuinfo.mm64.msa_frac != MM64_MSA_FRAC_VMSA_SUPPORT )
+        {
+            p2m_vmsa = false;
+            warning_add("Be aware of that there is no support for VMSAv8-64 at EL1 on this platform.\n");
+        }
+    }
+    else
+        goto fault;
+
+    /*
+     * If PE supports both PMSAv8-64 and VMSAv8-64 at EL1, then VTCR_EL2.MSA
+     * determines the memory system architecture enabled at stage 1 of the
+     * Secure EL1&0 translation regime.
+     *
+     * Normally, we set the initial VTCR_EL2.MSA value VMSAv8-64 support,
+     * unless this platform only supports PMSAv8-64.
+     */
+    if ( !p2m_vmsa )
+        val &= VTCR_MSA_PMSA;
+    else
+        val |= VTCR_MSA_VMSA;
+
+    /*
+     * cpuinfo sanitization makes sure we support 16bits VMID only if
+     * all cores are supporting it.
+     */
+    if ( system_cpuinfo.mm64.vmid_bits == MM64_VMID_16_BITS_SUPPORT )
+        max_vmid = MAX_VMID_16_BIT;
+
+    /* Set the VS bit only if 16 bit VMID is supported. */
+    if ( MAX_VMID == MAX_VMID_16_BIT )
+        val |= VTCR_VS;
+
+    p2m_vmid_allocator_init();
+
+    WRITE_SYSREG(val, VTCR_EL2);
+
+    return;
+
+fault:
+    panic("Hardware with no PMSAv8-64 support in any translation regime.\n");
+}
+
+/*
+ * Local variables:
+ * mode: C
+ * c-file-style: "BSD"
+ * c-basic-offset: 4
+ * indent-tabs-mode: nil
+ * End:
+ */
-- 
2.25.1


