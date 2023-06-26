Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D6B2473D68C
	for <lists+xen-devel@lfdr.de>; Mon, 26 Jun 2023 05:40:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.555087.866859 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qDd5m-0003hT-WE; Mon, 26 Jun 2023 03:40:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 555087.866859; Mon, 26 Jun 2023 03:40:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qDd5l-0003IV-Rg; Mon, 26 Jun 2023 03:40:41 +0000
Received: by outflank-mailman (input) for mailman id 555087;
 Mon, 26 Jun 2023 03:40:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=24BZ=CO=arm.com=Penny.Zheng@srs-se1.protection.inumbo.net>)
 id 1qDd2m-0007ej-M2
 for xen-devel@lists.xenproject.org; Mon, 26 Jun 2023 03:37:36 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id ca704925-13d2-11ee-b237-6b7b168915f2;
 Mon, 26 Jun 2023 05:37:35 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 485401FB;
 Sun, 25 Jun 2023 20:38:19 -0700 (PDT)
Received: from a011292.shanghai.arm.com (a011292.shanghai.arm.com
 [10.169.190.94])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 9FEE23F64C;
 Sun, 25 Jun 2023 20:37:32 -0700 (PDT)
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
X-Inumbo-ID: ca704925-13d2-11ee-b237-6b7b168915f2
From: Penny Zheng <Penny.Zheng@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Penny Zheng <Penny.Zheng@arm.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Penny Zheng <penny.zheng@arm.com>,
	Wei Chen <wei.chen@arm.com>
Subject: [PATCH v3 47/52] xen/mpu: support vcpu context switch in MPU system
Date: Mon, 26 Jun 2023 11:34:38 +0800
Message-Id: <20230626033443.2943270-48-Penny.Zheng@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230626033443.2943270-1-Penny.Zheng@arm.com>
References: <20230626033443.2943270-1-Penny.Zheng@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When vcpu switching into guest mode, in MMU system, we update VTTBR_EL2
with the incoming guest's P2M table, simple and fast.
While in MPU system, we have MPU register PRBAR_EL2/PRLAR_EL2 for
both stage 1 EL2 address translation and stage 2 EL1&EL0 address
translation. That is, MPU memory region mapping table(xen_mpumap) shall be
also updated with P2M regions during context switch.

In p2m_save_state(), we need to manually disable all P2M MPU memory regions
from last-running vcpu, and in p2m_restore_state(), we need to manually
enable incoming guest's P2M MPU memory regions.

Signed-off-by: Penny Zheng <penny.zheng@arm.com>
Signed-off-by: Wei Chen <wei.chen@arm.com>
---
v3:
- new commit
---
 xen/arch/arm/include/asm/arm64/sysregs.h |  3 ++
 xen/arch/arm/include/asm/page.h          |  4 ++
 xen/arch/arm/mpu/mm.c                    |  6 ++-
 xen/arch/arm/mpu/p2m.c                   | 61 ++++++++++++++++++++++++
 4 files changed, 73 insertions(+), 1 deletion(-)

diff --git a/xen/arch/arm/include/asm/arm64/sysregs.h b/xen/arch/arm/include/asm/arm64/sysregs.h
index 35d7da411d..aa6c07cd4f 100644
--- a/xen/arch/arm/include/asm/arm64/sysregs.h
+++ b/xen/arch/arm/include/asm/arm64/sysregs.h
@@ -512,6 +512,9 @@
 /* MPU Protection Region Enable Register encode */
 #define PRENR_EL2   S3_4_C6_C1_1
 
+/* Virtualization System Control Register */
+#define VSCTLR_EL2  S3_4_C2_C0_0
+
 /* Virtualization Secure Translation Control Register */
 #define VSTCR_EL2            S3_4_C2_C6_2
 #define VSTCR_EL2_RES1_SHIFT 31
diff --git a/xen/arch/arm/include/asm/page.h b/xen/arch/arm/include/asm/page.h
index a434e2205a..e28c3d59c5 100644
--- a/xen/arch/arm/include/asm/page.h
+++ b/xen/arch/arm/include/asm/page.h
@@ -99,22 +99,26 @@
  * [7]   Region Present
  * [8]   Transient Region, e.g. MPU memory region is temproraily
  *                              mapped for a short time
+ * [9]   P2M Region for stage 2 translation
  */
 #define _PAGE_AI_BIT            0
 #define _PAGE_XN_BIT            3
 #define _PAGE_AP_BIT            5
 #define _PAGE_PRESENT_BIT       7
 #define _PAGE_TRANSIENT_BIT     8
+#define _PAGE_P2M_BIT           9
 #define _PAGE_AI                (7U << _PAGE_AI_BIT)
 #define _PAGE_XN                (2U << _PAGE_XN_BIT)
 #define _PAGE_RO                (2U << _PAGE_AP_BIT)
 #define _PAGE_PRESENT           (1U << _PAGE_PRESENT_BIT)
 #define _PAGE_TRANSIENT         (1U << _PAGE_TRANSIENT_BIT)
+#define _PAGE_P2M               (1U << _PAGE_P2M_BIT)
 #define PAGE_AI_MASK(x)         (((x) >> _PAGE_AI_BIT) & 0x7U)
 #define PAGE_XN_MASK(x)         (((x) >> _PAGE_XN_BIT) & 0x3U)
 #define PAGE_AP_MASK(x)         (((x) >> _PAGE_AP_BIT) & 0x3U)
 #define PAGE_RO_MASK(x)         (((x) >> _PAGE_AP_BIT) & 0x2U)
 #define PAGE_TRANSIENT_MASK(x)  (((x) >> _PAGE_TRANSIENT_BIT) & 0x1U)
+#define PAGE_P2M_MASK(x)        (((x) >> _PAGE_P2M_BIT) & 0x1U)
 #endif /* CONFIG_HAS_MPU */
 
 /*
diff --git a/xen/arch/arm/mpu/mm.c b/xen/arch/arm/mpu/mm.c
index 8cdb7d7219..c6b287b3aa 100644
--- a/xen/arch/arm/mpu/mm.c
+++ b/xen/arch/arm/mpu/mm.c
@@ -580,7 +580,11 @@ int xen_mpumap_update(paddr_t base, paddr_t limit, unsigned int flags)
 {
     int rc;
 
-    if ( flags_has_rwx(flags) )
+    /*
+     * Mappings should not be both Writeable and Executable, unless
+     * it is for guest P2M mapping.
+     */
+    if ( flags_has_rwx(flags) && !PAGE_P2M_MASK(flags) )
     {
         region_printk("Mappings should not be both Writeable and Executable\n");
         return -EINVAL;
diff --git a/xen/arch/arm/mpu/p2m.c b/xen/arch/arm/mpu/p2m.c
index d403479229..e21b76813d 100644
--- a/xen/arch/arm/mpu/p2m.c
+++ b/xen/arch/arm/mpu/p2m.c
@@ -411,6 +411,67 @@ mfn_t p2m_get_entry(struct p2m_domain *p2m, gfn_t gfn,
     return p2m_get_mpu_region(p2m, gfn, 1, t, valid);
 }
 
+static unsigned int build_p2m_memory_region_flags(pr_t *p2m_region)
+{
+    return (p2m_region->prlar.reg.ai << _PAGE_AI_BIT |
+            p2m_region->prbar.reg.ap << _PAGE_AP_BIT |
+            p2m_region->prbar.reg.xn << _PAGE_XN_BIT);
+}
+
+static int p2m_xenmpu_update(struct p2m_domain *p2m, bool online)
+{
+    pr_t *p2m_table;
+    unsigned int i = 0;
+    unsigned int flags = online ? (_PAGE_PRESENT | _PAGE_P2M) : 0;
+
+    p2m_table = (pr_t *)page_to_virt(p2m->root);
+    if ( !p2m_table )
+        return -EINVAL;
+
+    for ( ; i < p2m->nr_regions; i++ )
+    {
+        paddr_t base = pr_get_base(&p2m_table[i]);
+        paddr_t limit = pr_get_limit(&p2m_table[i]);
+        unsigned int region_flags;
+
+        region_flags = build_p2m_memory_region_flags(&p2m_table[i]) | flags;
+        if ( xen_mpumap_update(base, limit + 1, region_flags) )
+        {
+            printk(XENLOG_G_ERR "p2m: unable to update MPU memory mapping with P2M region 0x%"PRIpaddr"-0x%"PRIpaddr"\n",
+                   base, limit + 1);
+            return -EINVAL;
+        }
+    }
+
+    return 0;
+}
+
+/* p2m_save_state and p2m_restore_state work in pair. */
+void p2m_save_state(struct vcpu *p)
+{
+    struct p2m_domain *p2m = p2m_get_hostp2m(p->domain);
+
+    p->arch.sctlr = READ_SYSREG(SCTLR_EL1);
+
+    if ( p2m_xenmpu_update(p2m, false) )
+        panic("Failed to offline P2M MPU memory mapping\n");
+}
+
+void p2m_restore_state(struct vcpu *n)
+{
+    struct p2m_domain *p2m = p2m_get_hostp2m(n->domain);
+    uint8_t *last_vcpu_ran = &p2m->last_vcpu_ran[smp_processor_id()];
+
+    WRITE_SYSREG(n->arch.sctlr, SCTLR_EL1);
+    WRITE_SYSREG(n->arch.hcr_el2, HCR_EL2);
+
+    WRITE_SYSREG64(p2m->vsctlr, VSCTLR_EL2);
+    if ( p2m_xenmpu_update(p2m, true) )
+        panic("Failed to online P2M MPU memory mapping\n");
+
+    *last_vcpu_ran = n->vcpu_id;
+}
+
 /*
  * Local variables:
  * mode: C
-- 
2.25.1


