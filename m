Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5747F73D676
	for <lists+xen-devel@lfdr.de>; Mon, 26 Jun 2023 05:40:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.555035.866662 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qDd55-00014c-Qk; Mon, 26 Jun 2023 03:39:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 555035.866662; Mon, 26 Jun 2023 03:39:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qDd54-0000lk-Tz; Mon, 26 Jun 2023 03:39:58 +0000
Received: by outflank-mailman (input) for mailman id 555035;
 Mon, 26 Jun 2023 03:39:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=24BZ=CO=arm.com=Penny.Zheng@srs-se1.protection.inumbo.net>)
 id 1qDd29-0000HH-1W
 for xen-devel@lists.xenproject.org; Mon, 26 Jun 2023 03:36:57 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id b2367ec0-13d2-11ee-8611-37d641c3527e;
 Mon, 26 Jun 2023 05:36:55 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AE1181FB;
 Sun, 25 Jun 2023 20:37:38 -0700 (PDT)
Received: from a011292.shanghai.arm.com (a011292.shanghai.arm.com
 [10.169.190.94])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 12A833F64C;
 Sun, 25 Jun 2023 20:36:51 -0700 (PDT)
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
X-Inumbo-ID: b2367ec0-13d2-11ee-8611-37d641c3527e
From: Penny Zheng <Penny.Zheng@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Penny Zheng <Penny.Zheng@arm.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Penny Zheng <penny.zheng@arm.com>,
	Wei Chen <wei.chen@arm.com>
Subject: [PATCH v3 34/52] xen/mpu: destroy an existing entry in Xen MPU memory mapping table
Date: Mon, 26 Jun 2023 11:34:25 +0800
Message-Id: <20230626033443.2943270-35-Penny.Zheng@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230626033443.2943270-1-Penny.Zheng@arm.com>
References: <20230626033443.2943270-1-Penny.Zheng@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This commit expands xen_mpumap_update/xen_mpumap_update_entry to include
destroying an existing entry.

We define a new helper "control_xen_mpumap_region_from_index" to enable/disable
the MPU region based on index. If region is within [0, 31], we could quickly
disable the MPU region through PRENR_EL2 which provides direct access to the
PRLAR_EL2.EN bits of EL2 MPU regions.

Rignt now, we only support destroying a *WHOLE* MPU memory region,
part-region removing is not supported, as in worst case, it will
leave two fragments behind.

Signed-off-by: Penny Zheng <penny.zheng@arm.com>
Signed-off-by: Wei Chen <wei.chen@arm.com>
---
v3:
- make pr_get_base()/pr_get_limit() static inline
- need an isb to ensure register write visible before zeroing the entry
---
 xen/arch/arm/include/asm/arm64/mpu.h     |  2 +
 xen/arch/arm/include/asm/arm64/sysregs.h |  3 +
 xen/arch/arm/mm.c                        |  5 ++
 xen/arch/arm/mpu/mm.c                    | 74 ++++++++++++++++++++++++
 4 files changed, 84 insertions(+)

diff --git a/xen/arch/arm/include/asm/arm64/mpu.h b/xen/arch/arm/include/asm/arm64/mpu.h
index 715ea69884..aee7947223 100644
--- a/xen/arch/arm/include/asm/arm64/mpu.h
+++ b/xen/arch/arm/include/asm/arm64/mpu.h
@@ -25,6 +25,8 @@
 #define REGION_UART_SEL            0x07
 #define MPUIR_REGION_MASK          ((_AC(1, UL) << 8) - 1)
 
+#define MPU_PRENR_BITS             32
+
 /* Access permission attributes. */
 /* Read/Write at EL2, No Access at EL1/EL0. */
 #define AP_RW_EL2 0x0
diff --git a/xen/arch/arm/include/asm/arm64/sysregs.h b/xen/arch/arm/include/asm/arm64/sysregs.h
index c8a679afdd..96c025053b 100644
--- a/xen/arch/arm/include/asm/arm64/sysregs.h
+++ b/xen/arch/arm/include/asm/arm64/sysregs.h
@@ -509,6 +509,9 @@
 /* MPU Type registers encode */
 #define MPUIR_EL2   S3_4_C0_C0_4
 
+/* MPU Protection Region Enable Register encode */
+#define PRENR_EL2   S3_4_C6_C1_1
+
 #endif
 
 /* Access to system registers */
diff --git a/xen/arch/arm/mm.c b/xen/arch/arm/mm.c
index 8625066256..247d17cfa1 100644
--- a/xen/arch/arm/mm.c
+++ b/xen/arch/arm/mm.c
@@ -164,7 +164,12 @@ int destroy_xen_mappings(unsigned long s, unsigned long e)
     ASSERT(IS_ALIGNED(s, PAGE_SIZE));
     ASSERT(IS_ALIGNED(e, PAGE_SIZE));
     ASSERT(s <= e);
+#ifndef CONFIG_HAS_MPU
     return xen_pt_update(s, INVALID_MFN, (e - s) >> PAGE_SHIFT, 0);
+#else
+    return xen_mpumap_update(virt_to_maddr((void *)s),
+                             virt_to_maddr((void *)e), 0);
+#endif
 }
 
 int modify_xen_mappings(unsigned long s, unsigned long e, unsigned int flags)
diff --git a/xen/arch/arm/mpu/mm.c b/xen/arch/arm/mpu/mm.c
index 0a65b58dc4..a40055ae5e 100644
--- a/xen/arch/arm/mpu/mm.c
+++ b/xen/arch/arm/mpu/mm.c
@@ -425,6 +425,59 @@ static int mpumap_contain_region(pr_t *table, uint8_t nr_regions,
     return MPUMAP_REGION_FAILED;
 }
 
+/* Disable or enable EL2 MPU memory region at index #index */
+static void control_mpu_region_from_index(uint8_t index, bool enable)
+{
+    pr_t region;
+
+    read_protection_region(&region, index);
+    if ( !region_is_valid(&region) ^ enable )
+    {
+        printk(XENLOG_WARNING
+               "mpu: MPU memory region[%u] is already %s\n", index,
+               enable ? "enabled" : "disabled");
+        return;
+    }
+
+    /*
+     * ARM64v8R provides PRENR_EL2 to have direct access to the
+     * PRLAR_EL2.EN bits of EL2 MPU regions from 0 to 31.
+     */
+    if ( index < MPU_PRENR_BITS )
+    {
+        uint64_t orig, after;
+
+        orig = READ_SYSREG(PRENR_EL2);
+        if ( enable )
+            /* Set respective bit */
+            after = orig | (1UL << index);
+        else
+            /* Clear respective bit */
+            after = orig & (~(1UL << index));
+        WRITE_SYSREG(after, PRENR_EL2);
+    }
+    else
+    {
+        region.prlar.reg.en = enable ? 1 : 0;
+        write_protection_region((const pr_t*)&region, index);
+    }
+    /* Ensure the write before zeroing the entry */
+    isb();
+
+    /* Update according bitfield in xen_mpumap_mask */
+    spin_lock(&xen_mpumap_alloc_lock);
+
+    if ( enable )
+        set_bit(index, xen_mpumap_mask);
+    else
+    {
+        clear_bit(index, xen_mpumap_mask);
+        memset(&xen_mpumap[index], 0, sizeof(pr_t));
+    }
+
+    spin_unlock(&xen_mpumap_alloc_lock);
+}
+
 /*
  * Update an entry in Xen MPU memory region mapping table(xen_mpumap) at
  * the index @idx.
@@ -461,6 +514,27 @@ static int xen_mpumap_update_entry(paddr_t base, paddr_t limit,
 
         write_protection_region((const pr_t*)(&xen_mpumap[idx]), idx);
     }
+    else
+    {
+        /*
+         * Currently, we only support destroying a *WHOLE* MPU memory region,
+         * part-region removing is not supported, as in worst case, it will
+         * leave two fragments behind.
+         * part-region removing will be introduced only when actual usage
+         * comes.
+         */
+        if ( rc == MPUMAP_REGION_INCLUSIVE )
+        {
+            region_printk("mpu: part-region removing is not supported\n");
+            return -EINVAL;
+        }
+
+        /* We are removing the region */
+        if ( rc != MPUMAP_REGION_FOUND )
+            return -EINVAL;
+
+        control_mpu_region_from_index(idx, false);
+    }
 
     return 0;
 }
-- 
2.25.1


