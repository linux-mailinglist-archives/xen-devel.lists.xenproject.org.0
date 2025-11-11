Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2807DC4CF5E
	for <lists+xen-devel@lfdr.de>; Tue, 11 Nov 2025 11:16:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1158923.1487296 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vIlQC-00047I-4B; Tue, 11 Nov 2025 10:16:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1158923.1487296; Tue, 11 Nov 2025 10:16:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vIlQC-00045K-1T; Tue, 11 Nov 2025 10:16:20 +0000
Received: by outflank-mailman (input) for mailman id 1158923;
 Tue, 11 Nov 2025 10:16:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zKkU=5T=arm.com=harry.ramsey@srs-se1.protection.inumbo.net>)
 id 1vIlQA-000452-NQ
 for xen-devel@lists.xenproject.org; Tue, 11 Nov 2025 10:16:18 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id 7593c4b0-bee7-11f0-9d18-b5c5bf9af7f9;
 Tue, 11 Nov 2025 11:16:17 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A41B81713;
 Tue, 11 Nov 2025 02:16:08 -0800 (PST)
Received: from e134099.cambridge.arm.com (e134099.arm.com [10.1.198.34])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 69A293F63F;
 Tue, 11 Nov 2025 02:16:15 -0800 (PST)
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
X-Inumbo-ID: 7593c4b0-bee7-11f0-9d18-b5c5bf9af7f9
From: Harry Ramsey <harry.ramsey@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Luca.Fancellu@arm.com,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v2 2/3] arm/mpu: Implement reference counting for inclusive regions
Date: Tue, 11 Nov 2025 10:16:00 +0000
Message-ID: <20251111101601.4171120-3-harry.ramsey@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251111101601.4171120-1-harry.ramsey@arm.com>
References: <20251111101601.4171120-1-harry.ramsey@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Implement reference counting to enable inclusive MPU regions. An
inclusive region is defined as a region encapsulated inside a
previously allocated region sharing the same permissions.

References are incremented and decremented in xen_mpumap_update_entry. A
region will be destroyed if the reference count is 0 upon calling
destroy_xen_mappings and if the full region range is specified.

Additionally XEN_MPUMAP_ENTRY_SHIFT and XEN_MPUMAP_ENTRY_SHIFT_ZERO are
no longer hardcoded and defined inside asm-offsets.c.

Signed-off-by: Harry Ramsey <harry.ramsey@arm.com>
---
Changes in v2:
- Improve clarity with regards to MPU inclusive regions
- Fix code format issues
---
 xen/arch/arm/arm32/asm-offsets.c         |  2 +
 xen/arch/arm/arm64/asm-offsets.c         |  2 +
 xen/arch/arm/include/asm/arm32/mpu.h     |  2 +
 xen/arch/arm/include/asm/arm64/mpu.h     |  2 +
 xen/arch/arm/include/asm/mpu/regions.inc | 11 +++-
 xen/arch/arm/mpu/mm.c                    | 75 +++++++++++++++++++-----
 6 files changed, 78 insertions(+), 16 deletions(-)

diff --git a/xen/arch/arm/arm32/asm-offsets.c b/xen/arch/arm/arm32/asm-offsets.c
index c203ce269d..951f8d03f3 100644
--- a/xen/arch/arm/arm32/asm-offsets.c
+++ b/xen/arch/arm/arm32/asm-offsets.c
@@ -79,6 +79,8 @@ void __dummy__(void)
 #ifdef CONFIG_MPU
    DEFINE(XEN_MPUMAP_MASK_sizeof, sizeof(xen_mpumap_mask));
    DEFINE(XEN_MPUMAP_sizeof, sizeof(xen_mpumap));
+   DEFINE(XEN_MPUMAP_ENTRY_SHIFT, ilog2(sizeof(pr_t)));
+   DEFINE(XEN_MPUMAP_ENTRY_ZERO_OFFSET, sizeof(prbar_t) + sizeof(prlar_t));
    BLANK();
 #endif
 }
diff --git a/xen/arch/arm/arm64/asm-offsets.c b/xen/arch/arm/arm64/asm-offsets.c
index 320289b281..38a3894a3b 100644
--- a/xen/arch/arm/arm64/asm-offsets.c
+++ b/xen/arch/arm/arm64/asm-offsets.c
@@ -73,6 +73,8 @@ void __dummy__(void)
 #ifdef CONFIG_MPU
    DEFINE(XEN_MPUMAP_MASK_sizeof, sizeof(xen_mpumap_mask));
    DEFINE(XEN_MPUMAP_sizeof, sizeof(xen_mpumap));
+   DEFINE(XEN_MPUMAP_ENTRY_SHIFT, ilog2(sizeof(pr_t)));
+   DEFINE(XEN_MPUMAP_ENTRY_ZERO_OFFSET, sizeof(prbar_t) + sizeof(prlar_t));
    BLANK();
 #endif
 }
diff --git a/xen/arch/arm/include/asm/arm32/mpu.h b/xen/arch/arm/include/asm/arm32/mpu.h
index 0a6930b3a0..137022d922 100644
--- a/xen/arch/arm/include/asm/arm32/mpu.h
+++ b/xen/arch/arm/include/asm/arm32/mpu.h
@@ -39,6 +39,8 @@ typedef union {
 typedef struct {
     prbar_t prbar;
     prlar_t prlar;
+    uint8_t refcount;
+    uint8_t pad[7];     /* Pad structure to 16 Bytes */
 } pr_t;

 #endif /* __ASSEMBLY__ */
diff --git a/xen/arch/arm/include/asm/arm64/mpu.h b/xen/arch/arm/include/asm/arm64/mpu.h
index f0ce344e78..17f62ccaf6 100644
--- a/xen/arch/arm/include/asm/arm64/mpu.h
+++ b/xen/arch/arm/include/asm/arm64/mpu.h
@@ -38,6 +38,8 @@ typedef union {
 typedef struct {
     prbar_t prbar;
     prlar_t prlar;
+    uint8_t refcount;
+    uint8_t pad[15];    /* Pad structure to 32 Bytes */
 } pr_t;

 #endif /* __ASSEMBLY__ */
diff --git a/xen/arch/arm/include/asm/mpu/regions.inc b/xen/arch/arm/include/asm/mpu/regions.inc
index 23fead3b21..0cdbb17bc3 100644
--- a/xen/arch/arm/include/asm/mpu/regions.inc
+++ b/xen/arch/arm/include/asm/mpu/regions.inc
@@ -14,14 +14,12 @@
 #define PRLAR_ELx_EN            0x1

 #ifdef CONFIG_ARM_64
-#define XEN_MPUMAP_ENTRY_SHIFT  0x4     /* 16 byte structure */

 .macro store_pair reg1, reg2, dst
     stp \reg1, \reg2, [\dst]
 .endm

 #else
-#define XEN_MPUMAP_ENTRY_SHIFT  0x3     /* 8 byte structure */

 .macro store_pair reg1, reg2, dst
     strd  \reg1, \reg2, [\dst]
@@ -97,6 +95,15 @@

 3:

+    /* Clear the rest of the xen_mpumap entry. */
+#ifdef CONFIG_ARM_64
+    stp xzr, xzr, [\base, #XEN_MPUMAP_ENTRY_ZERO_OFFSET]
+#else
+    mov \prbar, #0
+    mov \prlar, #0
+    strd \prbar, \prlar, [\base, #XEN_MPUMAP_ENTRY_ZERO_OFFSET]
+#endif
+
     add   \sel, \sel, #1

 1:
diff --git a/xen/arch/arm/mpu/mm.c b/xen/arch/arm/mpu/mm.c
index b80edcf1ca..cd84f9e3c6 100644
--- a/xen/arch/arm/mpu/mm.c
+++ b/xen/arch/arm/mpu/mm.c
@@ -106,6 +106,7 @@ pr_t pr_of_addr(paddr_t base, paddr_t limit, unsigned int flags)
     region = (pr_t) {
         .prbar = prbar,
         .prlar = prlar,
+        .refcount = 0,
     };

     /* Set base address and limit address. */
@@ -170,6 +171,37 @@ int mpumap_contains_region(pr_t *table, uint8_t nr_regions, paddr_t base,
     return MPUMAP_REGION_NOTFOUND;
 }

+static bool is_mm_attr_match(pr_t *region, unsigned int attributes)
+{
+    bool ret = true;
+
+    if ( region->prbar.reg.ro != PAGE_RO_MASK(attributes) )
+    {
+        printk(XENLOG_WARNING
+               "Mismatched Access Permission attributes (%#x instead of %#x)\n",
+               region->prbar.reg.ro, PAGE_RO_MASK(attributes));
+        ret = false;
+    }
+
+    if ( region->prbar.reg.xn != PAGE_XN_MASK(attributes) )
+    {
+        printk(XENLOG_WARNING
+               "Mismatched Execute Never attributes (%#x instead of %#x)\n",
+               region->prbar.reg.xn, PAGE_XN_MASK(attributes));
+        ret = false;
+    }
+
+    if ( region->prlar.reg.ai != PAGE_AI_MASK(attributes) )
+    {
+        printk(XENLOG_WARNING
+               "Mismatched Memory Attribute Index (%#x instead of %#x)\n",
+               region->prlar.reg.ai, PAGE_AI_MASK(attributes));
+        ret = false;
+    }
+
+    return ret;
+}
+
 /* Map a frame table to cover physical addresses ps through pe */
 void __init setup_frametable_mappings(paddr_t ps, paddr_t pe)
 {
@@ -284,22 +316,26 @@ static int xen_mpumap_update_entry(paddr_t base, paddr_t limit,

     flags_has_page_present = flags & _PAGE_PRESENT;

-    /* Currently we don't support modifying an existing entry. */
+    /*
+    * Currently, we only support removing/modifying a *WHOLE* MPU memory
+    * region. Part-region removal/modification is not supported as in the worst
+    * case it will leave two/three fragments behind.
+    */
     if ( flags_has_page_present && (rc >= MPUMAP_REGION_FOUND) )
     {
-        printk("Modifying an existing entry is not supported\n");
-        return -EINVAL;
-    }
+        if ( !is_mm_attr_match(&xen_mpumap[idx], flags) )
+        {
+            printk("Modifying an existing entry is not supported\n");
+            return -EINVAL;
+        }

-    /*
-     * Currently, we only support removing/modifying a *WHOLE* MPU memory
-     * region. Part-region removal/modification is not supported as in the worst
-     * case it will leave two/three fragments behind.
-     */
-    if ( rc == MPUMAP_REGION_INCLUSIVE )
-    {
-        printk("Part-region removal/modification is not supported\n");
-        return -EINVAL;
+        /* Check for overflow of refcount before incrementing.  */
+        if ( xen_mpumap[idx].refcount == 0xFF )
+        {
+            printk("Cannot allocate region as it would cause reference overflow\n");
+            return -ENOENT;
+        }
+        xen_mpumap[idx].refcount += 1;
     }

     /* We are inserting a mapping => Create new region. */
@@ -323,7 +359,18 @@ static int xen_mpumap_update_entry(paddr_t base, paddr_t limit,
             return -EINVAL;
         }

-        disable_mpu_region_from_index(idx);
+        if ( xen_mpumap[idx].refcount == 0 )
+        {
+            if ( MPUMAP_REGION_FOUND == rc )
+                disable_mpu_region_from_index(idx);
+            else
+            {
+                printk("Cannot remove a partial region\n");
+                return -EINVAL;
+            }
+        }
+        else
+            xen_mpumap[idx].refcount -= 1;
     }

     return 0;
--
2.43.0


