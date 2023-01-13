Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 27769668B82
	for <lists+xen-devel@lfdr.de>; Fri, 13 Jan 2023 06:36:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.476613.739016 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pGCjf-0004le-VV; Fri, 13 Jan 2023 05:36:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 476613.739016; Fri, 13 Jan 2023 05:36:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pGCjf-0004fj-O5; Fri, 13 Jan 2023 05:36:15 +0000
Received: by outflank-mailman (input) for mailman id 476613;
 Fri, 13 Jan 2023 05:36:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=f25I=5K=arm.com=Penny.Zheng@srs-se1.protection.inumbo.net>)
 id 1pGCfF-0005sP-7Y
 for xen-devel@lists.xenproject.org; Fri, 13 Jan 2023 05:31:41 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id 8d74ef45-9303-11ed-b8d0-410ff93cb8f0;
 Fri, 13 Jan 2023 06:31:38 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 838A813D5;
 Thu, 12 Jan 2023 21:32:20 -0800 (PST)
Received: from a011292.shanghai.arm.com (a011292.shanghai.arm.com
 [10.169.190.94])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id C55C63F587;
 Thu, 12 Jan 2023 21:31:35 -0800 (PST)
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
X-Inumbo-ID: 8d74ef45-9303-11ed-b8d0-410ff93cb8f0
From: Penny Zheng <Penny.Zheng@arm.com>
To: xen-devel@lists.xenproject.org
Cc: wei.chen@arm.com,
	Penny Zheng <Penny.Zheng@arm.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Penny Zheng <penny.zheng@arm.com>
Subject: [PATCH v2 38/40] xen/mpu: implement setup_virt_paging for MPU system
Date: Fri, 13 Jan 2023 13:29:11 +0800
Message-Id: <20230113052914.3845596-39-Penny.Zheng@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230113052914.3845596-1-Penny.Zheng@arm.com>
References: <20230113052914.3845596-1-Penny.Zheng@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

For MMU system setup_virt_paging is used to configure stage 2 address
translation, like IPA bits, VMID bits, etc. And this function is also doing the
VMID allocator initializtion for later VM creation.

Except for IPA bits and VMID bits, the setup_virt_paging function in MPU
system should be also responsible for determining the default EL1/EL0
translation regime.
ARMv8-R AArch64 could have the following memory translation regime:
- PMSAv8-64 at both EL1/EL0 and EL2
- PMSAv8-64 or VMSAv8-64 at EL1/EL0 and PMSAv8-64 at EL2
The default value will be VMSAv8-64, unless the platform could not support,
which could be checked against MSA_frac bit in Memory Model Feature Register 0(
ID_AA64MMFR0_EL1)

Signed-off-by: Penny Zheng <penny.zheng@arm.com>
Signed-off-by: Wei Chen <wei.chen@arm.com>
---
 xen/arch/arm/include/asm/arm64/sysregs.h |  6 ++
 xen/arch/arm/include/asm/cpufeature.h    |  7 ++
 xen/arch/arm/include/asm/p2m.h           | 18 +++++
 xen/arch/arm/include/asm/processor.h     | 13 ++++
 xen/arch/arm/p2m.c                       | 28 ++++++++
 xen/arch/arm/p2m_mmu.c                   | 38 ----------
 xen/arch/arm/p2m_mpu.c                   | 91 ++++++++++++++++++++++--
 7 files changed, 159 insertions(+), 42 deletions(-)

diff --git a/xen/arch/arm/include/asm/arm64/sysregs.h b/xen/arch/arm/include/asm/arm64/sysregs.h
index 9546e8e3d0..7d4f959dae 100644
--- a/xen/arch/arm/include/asm/arm64/sysregs.h
+++ b/xen/arch/arm/include/asm/arm64/sysregs.h
@@ -507,6 +507,12 @@
 /* MPU Protection Region Enable Register encode */
 #define PRENR_EL2 S3_4_C6_C1_1
 
+/* Virtualization Secure Translation Control Register */
+#define VSTCR_EL2  S3_4_C2_C6_2
+#define VSTCR_EL2_RES1_SHIFT 31
+#define VSTCR_EL2_SA_SHIFT   30
+#define VSTCR_EL2_SC_SHIFT   20
+
 #endif
 
 #ifdef CONFIG_ARM_SECURE_STATE
diff --git a/xen/arch/arm/include/asm/cpufeature.h b/xen/arch/arm/include/asm/cpufeature.h
index c62cf6293f..513e5b9918 100644
--- a/xen/arch/arm/include/asm/cpufeature.h
+++ b/xen/arch/arm/include/asm/cpufeature.h
@@ -244,6 +244,12 @@ struct cpuinfo_arm {
             unsigned long tgranule_16K:4;
             unsigned long tgranule_64K:4;
             unsigned long tgranule_4K:4;
+#ifdef CONFIG_ARM_V8R
+            unsigned long __res:16;
+            unsigned long msa:4;
+            unsigned long msa_frac:4;
+            unsigned long __res0:8;
+#else
             unsigned long tgranule_16k_2:4;
             unsigned long tgranule_64k_2:4;
             unsigned long tgranule_4k_2:4;
@@ -251,6 +257,7 @@ struct cpuinfo_arm {
             unsigned long __res0:8;
             unsigned long fgt:4;
             unsigned long ecv:4;
+#endif
 
             /* MMFR1 */
             unsigned long hafdbs:4;
diff --git a/xen/arch/arm/include/asm/p2m.h b/xen/arch/arm/include/asm/p2m.h
index a430aca232..cd28a9091a 100644
--- a/xen/arch/arm/include/asm/p2m.h
+++ b/xen/arch/arm/include/asm/p2m.h
@@ -14,9 +14,27 @@
 /* Holds the bit size of IPAs in p2m tables.  */
 extern unsigned int p2m_ipa_bits;
 
+#define MAX_VMID_8_BIT  (1UL << 8)
+#define MAX_VMID_16_BIT (1UL << 16)
+
+#define INVALID_VMID 0 /* VMID 0 is reserved */
+
+#ifdef CONFIG_ARM_64
+extern unsigned int max_vmid;
+/* VMID is by default 8 bit width on AArch64 */
+#define MAX_VMID       max_vmid
+#else
+/* VMID is always 8 bit width on AArch32 */
+#define MAX_VMID        MAX_VMID_8_BIT
+#endif
+
+extern spinlock_t vmid_alloc_lock;
+extern unsigned long *vmid_mask;
+
 struct domain;
 
 extern void memory_type_changed(struct domain *);
+extern void p2m_vmid_allocator_init(void);
 
 /* Per-p2m-table state */
 struct p2m_domain {
diff --git a/xen/arch/arm/include/asm/processor.h b/xen/arch/arm/include/asm/processor.h
index 1dd81d7d52..d866421d88 100644
--- a/xen/arch/arm/include/asm/processor.h
+++ b/xen/arch/arm/include/asm/processor.h
@@ -388,6 +388,12 @@
 
 #define VTCR_RES1       (_AC(1,UL)<<31)
 
+#ifdef CONFIG_ARM_V8R
+#define VTCR_MSA_VMSA   (_AC(0x1,UL)<<31)
+#define VTCR_MSA_PMSA   ~(_AC(0x1,UL)<<31)
+#define NSA_SEL2        ~(_AC(0x1,UL)<<30)
+#endif
+
 /* HCPTR Hyp. Coprocessor Trap Register */
 #define HCPTR_TAM       ((_AC(1,U)<<30))
 #define HCPTR_TTA       ((_AC(1,U)<<20))        /* Trap trace registers */
@@ -447,6 +453,13 @@
 #define MM64_VMID_16_BITS_SUPPORT   0x2
 #endif
 
+#ifdef CONFIG_ARM_V8R
+#define MM64_MSA_PMSA_SUPPORT       0xf
+#define MM64_MSA_FRAC_NONE_SUPPORT  0x0
+#define MM64_MSA_FRAC_PMSA_SUPPORT  0x1
+#define MM64_MSA_FRAC_VMSA_SUPPORT  0x2
+#endif
+
 #ifndef __ASSEMBLY__
 
 extern register_t __cpu_logical_map[];
diff --git a/xen/arch/arm/p2m.c b/xen/arch/arm/p2m.c
index 42f51051e0..0d0063aa2e 100644
--- a/xen/arch/arm/p2m.c
+++ b/xen/arch/arm/p2m.c
@@ -4,6 +4,21 @@
 
 #include <asm/event.h>
 #include <asm/page.h>
+#include <asm/p2m.h>
+
+#ifdef CONFIG_ARM_64
+unsigned int __read_mostly max_vmid = MAX_VMID_8_BIT;
+#endif
+
+spinlock_t vmid_alloc_lock = SPIN_LOCK_UNLOCKED;
+
+/*
+ * VTTBR_EL2 VMID field is 8 or 16 bits. AArch64 may support 16-bit VMID.
+ * Using a bitmap here limits us to 256 or 65536 (for AArch64) concurrent
+ * domains. The bitmap space will be allocated dynamically based on
+ * whether 8 or 16 bit VMIDs are supported.
+ */
+unsigned long *vmid_mask;
 
 /*
  * Set to the maximum configured support for IPA bits, so the number of IPA bits can be
@@ -142,6 +157,19 @@ void __init p2m_restrict_ipa_bits(unsigned int ipa_bits)
         p2m_ipa_bits = ipa_bits;
 }
 
+void p2m_vmid_allocator_init(void)
+{
+    /*
+     * allocate space for vmid_mask based on MAX_VMID
+     */
+    vmid_mask = xzalloc_array(unsigned long, BITS_TO_LONGS(MAX_VMID));
+
+    if ( !vmid_mask )
+        panic("Could not allocate VMID bitmap space\n");
+
+    set_bit(INVALID_VMID, vmid_mask);
+}
+
 /*
  * Local variables:
  * mode: C
diff --git a/xen/arch/arm/p2m_mmu.c b/xen/arch/arm/p2m_mmu.c
index 88a9d8f392..7e1afd0bb3 100644
--- a/xen/arch/arm/p2m_mmu.c
+++ b/xen/arch/arm/p2m_mmu.c
@@ -14,20 +14,6 @@
 #include <asm/page.h>
 #include <asm/traps.h>
 
-#define MAX_VMID_8_BIT  (1UL << 8)
-#define MAX_VMID_16_BIT (1UL << 16)
-
-#define INVALID_VMID 0 /* VMID 0 is reserved */
-
-#ifdef CONFIG_ARM_64
-static unsigned int __read_mostly max_vmid = MAX_VMID_8_BIT;
-/* VMID is by default 8 bit width on AArch64 */
-#define MAX_VMID       max_vmid
-#else
-/* VMID is always 8 bit width on AArch32 */
-#define MAX_VMID        MAX_VMID_8_BIT
-#endif
-
 #ifdef CONFIG_ARM_64
 unsigned int __read_mostly p2m_root_order;
 unsigned int __read_mostly p2m_root_level;
@@ -1516,30 +1502,6 @@ static int p2m_alloc_table(struct domain *d)
     return 0;
 }
 
-
-static spinlock_t vmid_alloc_lock = SPIN_LOCK_UNLOCKED;
-
-/*
- * VTTBR_EL2 VMID field is 8 or 16 bits. AArch64 may support 16-bit VMID.
- * Using a bitmap here limits us to 256 or 65536 (for AArch64) concurrent
- * domains. The bitmap space will be allocated dynamically based on
- * whether 8 or 16 bit VMIDs are supported.
- */
-static unsigned long *vmid_mask;
-
-static void p2m_vmid_allocator_init(void)
-{
-    /*
-     * allocate space for vmid_mask based on MAX_VMID
-     */
-    vmid_mask = xzalloc_array(unsigned long, BITS_TO_LONGS(MAX_VMID));
-
-    if ( !vmid_mask )
-        panic("Could not allocate VMID bitmap space\n");
-
-    set_bit(INVALID_VMID, vmid_mask);
-}
-
 static int p2m_alloc_vmid(struct domain *d)
 {
     struct p2m_domain *p2m = p2m_get_hostp2m(d);
diff --git a/xen/arch/arm/p2m_mpu.c b/xen/arch/arm/p2m_mpu.c
index 0a95d58111..77b4bc9221 100644
--- a/xen/arch/arm/p2m_mpu.c
+++ b/xen/arch/arm/p2m_mpu.c
@@ -2,8 +2,95 @@
 #include <xen/lib.h>
 #include <xen/mm-frame.h>
 #include <xen/sched.h>
+#include <xen/warning.h>
 
 #include <asm/p2m.h>
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
+     * ARMv8-R AArch64 could have the following memory system
+     * configurations:
+     * - PMSAv8-64 at EL1 and EL2
+     * - PMSAv8-64 or VMSAv8-64 at EL1 and PMSAv8-64 at EL2
+     *
+     * In ARMv8-R, the only permitted value is
+     * 0b1111(MM64_MSA_PMSA_SUPPORT).
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
+     * If the platform supports both PMSAv8-64 or VMSAv8-64 at EL1,
+     * then it's VTCR_EL2.MSA that determines the EL1 memory system
+     * architecture.
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
+    /*
+     * All stage 2 translations for the Secure PA space access the
+     * Secure PA space, so we keep SA bit as 0.
+     *
+     * Stage 2 NS configuration is checked against stage 1 NS configuration
+     * in EL1&0 translation regime for the given address, and generate a
+     * fault if they are different. So we set SC bit as 1.
+     */
+    WRITE_SYSREG(1 << VSTCR_EL2_RES1_SHIFT | 1 << VSTCR_EL2_SC_SHIFT, VTCR_EL2);
+
+    return;
+
+fault:
+    panic("Hardware with no PMSAv8-64 support in any translation regime.\n");
+}
 
 /* TODO: Implement on the first usage */
 void p2m_write_unlock(struct p2m_domain *p2m)
@@ -177,10 +264,6 @@ struct page_info *get_page_from_gva(struct vcpu *v, vaddr_t va,
     return NULL;
 }
 
-void __init setup_virt_paging(void)
-{
-}
-
 /*
  * Local variables:
  * mode: C
-- 
2.25.1


