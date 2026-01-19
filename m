Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E31F9D3A5B3
	for <lists+xen-devel@lfdr.de>; Mon, 19 Jan 2026 11:50:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1208079.1520310 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vhmqD-0005ze-PW; Mon, 19 Jan 2026 10:50:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1208079.1520310; Mon, 19 Jan 2026 10:50:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vhmqD-0005yD-Mt; Mon, 19 Jan 2026 10:50:37 +0000
Received: by outflank-mailman (input) for mailman id 1208079;
 Mon, 19 Jan 2026 10:50:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cxiA=7Y=arm.com=harry.ramsey@srs-se1.protection.inumbo.net>)
 id 1vhmqC-0005y7-9Z
 for xen-devel@lists.xenproject.org; Mon, 19 Jan 2026 10:50:36 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id adef8295-f524-11f0-b15e-2bf370ae4941;
 Mon, 19 Jan 2026 11:50:33 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 396D91517;
 Mon, 19 Jan 2026 02:50:26 -0800 (PST)
Received: from e134099.cambridge.arm.com (e134099.arm.com [10.1.198.34])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4E8603F632;
 Mon, 19 Jan 2026 02:50:31 -0800 (PST)
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
X-Inumbo-ID: adef8295-f524-11f0-b15e-2bf370ae4941
From: Harry Ramsey <harry.ramsey@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Luca.Fancellu@arm.com,
	Penny Zheng <Penny.Zheng@arm.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Penny Zheng <penny.zheng@arm.com>,
	Wei Chen <wei.chen@arm.com>,
	Luca Fancellu <luca.fancellu@arm.com>,
	Hari Limaye <hari.limaye@arm.com>
Subject: [PATCH] arm/mpu: implement setup_virt_paging for MPU system
Date: Mon, 19 Jan 2026 10:50:22 +0000
Message-ID: <20260119105022.3616126-1-harry.ramsey@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Penny Zheng <Penny.Zheng@arm.com>

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
Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
Signed-off-by: Hari Limaye <hari.limaye@arm.com>
Signed-off-by: Harry Ramsey <harry.ramsey@arm.com>
---
 xen/arch/arm/arm64/mpu/p2m.c             | 90 +++++++++++++++++++++++-
 xen/arch/arm/include/asm/arm32/mpu.h     |  2 +
 xen/arch/arm/include/asm/arm64/mpu.h     |  2 +
 xen/arch/arm/include/asm/arm64/sysregs.h |  5 ++
 xen/arch/arm/include/asm/cpufeature.h    |  7 ++
 xen/arch/arm/include/asm/mpu.h           |  7 +-
 xen/arch/arm/include/asm/mpu/p2m.h       | 12 ++++
 xen/arch/arm/include/asm/p2m.h           |  5 ++
 xen/arch/arm/include/asm/processor.h     | 13 ++++
 xen/arch/arm/mpu/p2m.c                   | 71 ++++++++++++++++++-
 10 files changed, 209 insertions(+), 5 deletions(-)

diff --git a/xen/arch/arm/arm64/mpu/p2m.c b/xen/arch/arm/arm64/mpu/p2m.c
index b6d8b2777b..13b633d9fe 100644
--- a/xen/arch/arm/arm64/mpu/p2m.c
+++ b/xen/arch/arm/arm64/mpu/p2m.c
@@ -2,11 +2,99 @@
 
 #include <xen/bug.h>
 #include <xen/init.h>
+#include <xen/warning.h>
 #include <asm/p2m.h>
 
 void __init setup_virt_paging(void)
 {
-    BUG_ON("unimplemented");
+    uint64_t vtcr_el2 = 0, vstcr_el2 = 0;
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
+    /*
+     * Clear VTCR_EL2.NSA bit to configure non-secure stage 2 translation output
+     * address space to access the Secure PA space.
+     */
+    vtcr_el2 &= NSA_SEL2;
+
+    /*
+     * The MSA and MSA_frac fields in the ID_AA64MMFR0_EL1 register identify the
+     * memory system configurations supported at EL1. In Armv8-R AArch64, the
+     * only permitted value for ID_AA64MMFR0_EL1.MSA is 0b1111.
+     */
+    if ( system_cpuinfo.mm64.msa != MM64_MSA_PMSA_SUPPORT )
+        goto fault;
+
+    /* Permitted values for ID_AA64MMFR0_EL1.MSA_frac are 0b0001 and 0b0010. */
+    if ( system_cpuinfo.mm64.msa_frac == MM64_MSA_FRAC_NONE_SUPPORT )
+        goto fault;
+
+    /*
+     * When ID_AA64MMFR0_EL1.MSA_frac is 0b0010 the stage 1 EL1&0 translation
+     * regime supports both PMSAv8-64 and VMSAv8-64.
+     */
+    if ( system_cpuinfo.mm64.msa_frac != MM64_MSA_FRAC_VMSA_SUPPORT )
+    {
+        p2m_vmsa = false;
+        warning_add("Be aware of that there is no support for VMSAv8-64 at EL1 on this platform\n");
+    }
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
+        vtcr_el2 &= VTCR_MSA_PMSA;
+    else
+        vtcr_el2 |= VTCR_MSA_VMSA;
+
+    /*
+     * cpuinfo sanitization makes sure we support 16bits VMID only if all cores
+     * are supporting it.
+     */
+    if ( system_cpuinfo.mm64.vmid_bits == MM64_VMID_16_BITS_SUPPORT )
+        max_vmid = MAX_VMID_16_BIT;
+
+    /* Set the VS bit only if 16 bit VMID is supported. */
+    if ( MAX_VMID == MAX_VMID_16_BIT )
+        vtcr_el2 |= VTCR_VS;
+
+    p2m_vmid_allocator_init();
+
+    WRITE_SYSREG(vtcr_el2, VTCR_EL2);
+
+    /*
+     * VSTCR_EL2.SA defines secure stage 2 translation output address space.
+     * To make sure that all stage 2 translations for the Secure PA space access
+     * the Secure PA space, we keep SA bit as 0.
+     *
+     * VSTCR_EL2.SC is NS check enable bit. To make sure that Stage 2 NS
+     * configuration is checked against stage 1 NS configuration in EL1&0
+     * translation regime for the given address, and generates a fault if they
+     * are different, we set SC bit 1.
+     */
+    vstcr_el2 = 1 << VSTCR_EL2_RES1_SHIFT;
+    vstcr_el2 &= VSTCR_EL2_SA;
+    vstcr_el2 |= VSTCR_EL2_SC;
+    WRITE_SYSREG(vstcr_el2, VSTCR_EL2);
+
+    return;
+
+ fault:
+    panic("Hardware with no PMSAv8-64 support in any translation regime\n");
 }
 
 /*
diff --git a/xen/arch/arm/include/asm/arm32/mpu.h b/xen/arch/arm/include/asm/arm32/mpu.h
index 2cf0f8cbac..d565230f84 100644
--- a/xen/arch/arm/include/asm/arm32/mpu.h
+++ b/xen/arch/arm/include/asm/arm32/mpu.h
@@ -11,6 +11,8 @@
  */
 #define MPU_REGION_RES0       0x0
 
+#define VSCTLR_VMID_SHIFT     16
+
 /* Hypervisor Protection Region Base Address Register */
 typedef union {
     struct {
diff --git a/xen/arch/arm/include/asm/arm64/mpu.h b/xen/arch/arm/include/asm/arm64/mpu.h
index 4f694190a8..8b86a03fee 100644
--- a/xen/arch/arm/include/asm/arm64/mpu.h
+++ b/xen/arch/arm/include/asm/arm64/mpu.h
@@ -7,6 +7,8 @@
 
 #define MPU_REGION_RES0        (0xFFFFULL << 48)
 
+#define VSCTLR_VMID_SHIFT      48
+
 /* Protection Region Base Address Register */
 typedef union {
     struct __packed {
diff --git a/xen/arch/arm/include/asm/arm64/sysregs.h b/xen/arch/arm/include/asm/arm64/sysregs.h
index 19d409d3eb..4ed8ac0440 100644
--- a/xen/arch/arm/include/asm/arm64/sysregs.h
+++ b/xen/arch/arm/include/asm/arm64/sysregs.h
@@ -462,6 +462,11 @@
 #define ZCR_ELx_LEN_SIZE             9
 #define ZCR_ELx_LEN_MASK             0x1ff
 
+/* Virtualization Secure Translation Control Register */
+#define VSTCR_EL2_RES1_SHIFT         31
+#define VSTCR_EL2_SA                 ~(_AC(0x1,UL)<<30)
+#define VSTCR_EL2_SC                 (_AC(0x1,UL)<<20)
+
 #ifdef CONFIG_MPU
 /*
  * The Armv8-R AArch64 architecture always executes code in Secure
diff --git a/xen/arch/arm/include/asm/cpufeature.h b/xen/arch/arm/include/asm/cpufeature.h
index 13353c8e1a..677cb2b96d 100644
--- a/xen/arch/arm/include/asm/cpufeature.h
+++ b/xen/arch/arm/include/asm/cpufeature.h
@@ -248,6 +248,12 @@ struct cpuinfo_arm {
             unsigned long tgranule_16K:4;
             unsigned long tgranule_64K:4;
             unsigned long tgranule_4K:4;
+#if !defined(CONFIG_MMU)
+            unsigned long __res:16;
+            unsigned long msa:4;
+            unsigned long msa_frac:4;
+            unsigned long __res0:8;
+#else
             unsigned long tgranule_16k_2:4;
             unsigned long tgranule_64k_2:4;
             unsigned long tgranule_4k_2:4;
@@ -255,6 +261,7 @@ struct cpuinfo_arm {
             unsigned long __res0:8;
             unsigned long fgt:4;
             unsigned long ecv:4;
+#endif
 
             /* MMFR1 */
             unsigned long hafdbs:4;
diff --git a/xen/arch/arm/include/asm/mpu.h b/xen/arch/arm/include/asm/mpu.h
index 72fa5b00b8..55011e3d96 100644
--- a/xen/arch/arm/include/asm/mpu.h
+++ b/xen/arch/arm/include/asm/mpu.h
@@ -87,7 +87,12 @@ static inline bool region_is_valid(const pr_t *pr)
     return pr->prlar.reg.en;
 }
 
-#endif /* __ASSEMBLER__ */
+static inline register_t generate_vsctlr(uint16_t vmid)
+{
+    return ((register_t)vmid << VSCTLR_VMID_SHIFT);
+}
+
+#endif /* __ASSEMBLY__ */
 
 #endif /* __ARM_MPU_H__ */
 
diff --git a/xen/arch/arm/include/asm/mpu/p2m.h b/xen/arch/arm/include/asm/mpu/p2m.h
index e46d9e757a..d165585d4e 100644
--- a/xen/arch/arm/include/asm/mpu/p2m.h
+++ b/xen/arch/arm/include/asm/mpu/p2m.h
@@ -5,6 +5,18 @@
 
 struct p2m_domain;
 
+/*
+ * The architecture allows at most 255 EL2 MPU memory regions. The size of the
+ * MPU structure entry (pr_t) is 32 Bytes on AArch64 (requiring two 4KB pages)
+ * and 16 bytes on AArch32 (requiring one 4KB page).
+ */
+#ifdef CONFIG_ARM_64
+#define P2M_ROOT_ORDER 1
+#else
+#define P2M_ROOT_ORDER 0
+#endif
+
+/* Not used on MPU system */
 static inline void p2m_clear_root_pages(struct p2m_domain *p2m) {}
 
 static inline void p2m_tlb_flush_sync(struct p2m_domain *p2m) {}
diff --git a/xen/arch/arm/include/asm/p2m.h b/xen/arch/arm/include/asm/p2m.h
index 010ce8c9eb..3dd0a5887e 100644
--- a/xen/arch/arm/include/asm/p2m.h
+++ b/xen/arch/arm/include/asm/p2m.h
@@ -48,8 +48,13 @@ struct p2m_domain {
     /* Current VMID in use */
     uint16_t vmid;
 
+#if defined(CONFIG_MMU)
     /* Current Translation Table Base Register for the p2m */
     uint64_t vttbr;
+#else
+    /* Current Virtualization System Control Register for the p2m */
+    register_t vsctlr;
+#endif
 
     /* Highest guest frame that's ever been mapped in the p2m */
     gfn_t max_mapped_gfn;
diff --git a/xen/arch/arm/include/asm/processor.h b/xen/arch/arm/include/asm/processor.h
index 1a48c9ff3b..0a47ca8294 100644
--- a/xen/arch/arm/include/asm/processor.h
+++ b/xen/arch/arm/include/asm/processor.h
@@ -403,6 +403,12 @@
 
 #define VTCR_RES1       (_AC(1,UL)<<31)
 
+#if !defined(CONFIG_MMU) && defined(CONFIG_ARM_64)
+#define VTCR_MSA_VMSA   (_AC(0x1,UL)<<31)
+#define VTCR_MSA_PMSA   ~(_AC(0x1,UL)<<31)
+#define NSA_SEL2        ~(_AC(0x1,UL)<<30)
+#endif
+
 /* HCPTR Hyp. Coprocessor Trap Register */
 #define HCPTR_TAM       ((_AC(1,U)<<30))
 #define HCPTR_TTA       ((_AC(1,U)<<20))        /* Trap trace registers */
@@ -464,6 +470,13 @@
 #define MM64_VMID_16_BITS_SUPPORT   0x2
 #endif
 
+#if !defined(CONFIG_MMU) && defined(CONFIG_ARM_64)
+#define MM64_MSA_PMSA_SUPPORT       0xf
+#define MM64_MSA_FRAC_NONE_SUPPORT  0x0
+#define MM64_MSA_FRAC_PMSA_SUPPORT  0x1
+#define MM64_MSA_FRAC_VMSA_SUPPORT  0x2
+#endif
+
 #ifndef __ASSEMBLER__
 
 extern register_t __cpu_logical_map[];
diff --git a/xen/arch/arm/mpu/p2m.c b/xen/arch/arm/mpu/p2m.c
index f7fb58ab6a..1598f9ab64 100644
--- a/xen/arch/arm/mpu/p2m.c
+++ b/xen/arch/arm/mpu/p2m.c
@@ -28,10 +28,62 @@ void p2m_dump_info(struct domain *d)
     BUG_ON("unimplemented");
 }
 
+static int __init p2m_alloc_table(struct domain *d)
+{
+    struct p2m_domain *p2m = p2m_get_hostp2m(d);
+    pr_t* p2m_map;
+
+    p2m_map = alloc_xenheap_pages(P2M_ROOT_ORDER, 0);
+    if ( !p2m_map )
+    {
+        printk(XENLOG_G_ERR "DOM%pd: p2m: unable to allocate P2M MPU mapping table\n", d);
+        return -ENOMEM;
+    }
+    clear_page(p2m_map);
+
+    p2m->root = virt_to_page((const void *)p2m_map);
+
+    return 0;
+}
+
 int p2m_init(struct domain *d)
 {
-    BUG_ON("unimplemented");
-    return -EINVAL;
+    struct p2m_domain *p2m = p2m_get_hostp2m(d);
+    int rc = 0;
+    unsigned int cpu;
+
+    rwlock_init(&p2m->lock);
+
+    p2m->vmid = INVALID_VMID;
+    p2m->max_mapped_gfn = _gfn(0);
+    p2m->lowest_mapped_gfn = _gfn(ULONG_MAX);
+
+    p2m->default_access = p2m_access_rwx;
+    /* mem_access is NOT supported in MPU system. */
+    p2m->mem_access_enabled = false;
+
+    /* Ensure that the type chosen is large enough for MAX_VIRT_CPUS. */
+    BUILD_BUG_ON((1 << (sizeof(p2m->last_vcpu_ran[0]) * 8)) < MAX_VIRT_CPUS);
+
+    for_each_possible_cpu(cpu)
+       p2m->last_vcpu_ran[cpu] = INVALID_VCPU_ID;
+
+    /*
+     * "Trivial" initialization is now complete. Set the backpointer so that
+     * p2m_teardown() and related functions know to do something.
+     */
+    p2m->domain = d;
+
+    rc = p2m_alloc_vmid(d);
+    if ( rc )
+        return rc;
+    p2m->vsctlr = generate_vsctlr(p2m->vmid);
+
+    rc = p2m_alloc_table(d);
+    if ( rc )
+        return rc;
+
+    return rc;
 }
 
 void p2m_save_state(struct vcpu *p)
@@ -46,7 +98,20 @@ void p2m_restore_state(struct vcpu *n)
 
 void p2m_final_teardown(struct domain *d)
 {
-    BUG_ON("unimplemented");
+    struct p2m_domain *p2m = p2m_get_hostp2m(d);
+
+    /* p2m not actually initialized */
+    if ( !p2m->domain )
+        return;
+
+    if ( p2m->root )
+        free_xenheap_pages(p2m->root, P2M_ROOT_ORDER);
+
+    p2m->root = NULL;
+
+    p2m_free_vmid(d);
+
+    p2m->domain = NULL;
 }
 
 bool p2m_resolve_translation_fault(struct domain *d, gfn_t gfn)
-- 
2.43.0


