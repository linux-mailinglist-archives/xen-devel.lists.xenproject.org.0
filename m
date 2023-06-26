Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C78EF73D668
	for <lists+xen-devel@lfdr.de>; Mon, 26 Jun 2023 05:39:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.554991.866530 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qDd4k-0004mv-Py; Mon, 26 Jun 2023 03:39:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 554991.866530; Mon, 26 Jun 2023 03:39:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qDd4k-0004jz-HV; Mon, 26 Jun 2023 03:39:38 +0000
Received: by outflank-mailman (input) for mailman id 554991;
 Mon, 26 Jun 2023 03:39:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=24BZ=CO=arm.com=Penny.Zheng@srs-se1.protection.inumbo.net>)
 id 1qDd2j-0007ej-IC
 for xen-devel@lists.xenproject.org; Mon, 26 Jun 2023 03:37:33 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id c8960fe6-13d2-11ee-b237-6b7b168915f2;
 Mon, 26 Jun 2023 05:37:32 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2DE512F4;
 Sun, 25 Jun 2023 20:38:16 -0700 (PDT)
Received: from a011292.shanghai.arm.com (a011292.shanghai.arm.com
 [10.169.190.94])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 7996F3F64C;
 Sun, 25 Jun 2023 20:37:29 -0700 (PDT)
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
X-Inumbo-ID: c8960fe6-13d2-11ee-b237-6b7b168915f2
From: Penny Zheng <Penny.Zheng@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Penny Zheng <Penny.Zheng@arm.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Penny Zheng <penny.zheng@arm.com>,
	Wei Chen <wei.chen@arm.com>
Subject: [PATCH v3 46/52] xen/mpu: look up entry in p2m table
Date: Mon, 26 Jun 2023 11:34:37 +0800
Message-Id: <20230626033443.2943270-47-Penny.Zheng@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230626033443.2943270-1-Penny.Zheng@arm.com>
References: <20230626033443.2943270-1-Penny.Zheng@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Function p2m_lookup() is responsible for looking up an entry in p2m
table. In MPU system, We check whether mapping exists. If it does, we
get the details of the guest MPU memory region in domain P2M table(p2m->root)
through p2m_get_mpu_region()

Signed-off-by: Penny Zheng <penny.zheng@arm.com>
Signed-off-by: Wei Chen <wei.chen@arm.com>
---
v3:
- new commit
---
 xen/arch/arm/include/asm/mpu/p2m.h | 18 ++++++++
 xen/arch/arm/include/asm/p2m.h     |  2 +
 xen/arch/arm/mpu/p2m.c             | 73 ++++++++++++++++++++++++++++++
 3 files changed, 93 insertions(+)
 create mode 100644 xen/arch/arm/include/asm/mpu/p2m.h

diff --git a/xen/arch/arm/include/asm/mpu/p2m.h b/xen/arch/arm/include/asm/mpu/p2m.h
new file mode 100644
index 0000000000..bdb33148e3
--- /dev/null
+++ b/xen/arch/arm/include/asm/mpu/p2m.h
@@ -0,0 +1,18 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+#ifndef _XEN_P2M_MPU_H
+#define _XEN_P2M_MPU_H
+
+static inline bool region_is_p2m_valid(pr_t *pr)
+{
+    return (pr->prbar.reg.p2m_type != p2m_invalid);
+}
+
+#endif /* _XEN_P2M_MPU_H */
+/*
+ * Local variables:
+ * mode: C
+ * c-file-style: "BSD"
+ * c-basic-offset: 4
+ * indent-tabs-mode: nil
+ * End:
+ */
diff --git a/xen/arch/arm/include/asm/p2m.h b/xen/arch/arm/include/asm/p2m.h
index 68837b6df7..395bfd4f69 100644
--- a/xen/arch/arm/include/asm/p2m.h
+++ b/xen/arch/arm/include/asm/p2m.h
@@ -188,6 +188,8 @@ typedef enum {
 
 #ifdef CONFIG_HAS_MMU
 #include <asm/mmu/p2m.h>
+#else
+#include <asm/mpu/p2m.h>
 #endif
 
 static inline bool arch_acquire_resource_check(struct domain *d)
diff --git a/xen/arch/arm/mpu/p2m.c b/xen/arch/arm/mpu/p2m.c
index 4838d5b625..d403479229 100644
--- a/xen/arch/arm/mpu/p2m.c
+++ b/xen/arch/arm/mpu/p2m.c
@@ -338,6 +338,79 @@ int p2m_set_entry(struct p2m_domain *p2m, gfn_t sgfn, unsigned long nr,
     return __p2m_set_entry(p2m, sgfn, nr, smfn, t, a);
 }
 
+/*
+ * Get the details of guest MPU memory region [gfn, gfn + nr_gfns).
+ *
+ * If it is mapped, the starting MFN will be returned and according
+ * p2m type will get filled up.
+ * If it is not mapped, INVALID_MFN will be returned.
+ */
+static mfn_t p2m_get_mpu_region(struct p2m_domain *p2m, gfn_t gfn,
+                                unsigned long nr_gfns, p2m_type_t *t,
+                                bool *valid)
+{
+    pr_t *table, *region = NULL;
+    p2m_type_t _t;
+    uint8_t idx = INVALID_REGION_IDX;
+    gfn_t egfn = gfn_add(gfn, nr_gfns);
+
+    ASSERT(p2m_is_locked(p2m));
+
+    /* Allow t to be NULL. */
+    t = t ? : &_t;
+
+    *t = p2m_invalid;
+
+    if ( valid )
+        *valid = false;
+
+    /*
+     * Check if the ending gfn is higher than the highest the p2m map
+     * currently holds, or the starting gfn lower than the lowest it holds
+     */
+    if ( (gfn_x(egfn) > gfn_x(p2m->max_mapped_gfn)) ||
+         (gfn_x(gfn) < gfn_x(p2m->lowest_mapped_gfn)) )
+        return INVALID_MFN;
+
+    table = (pr_t *)page_to_virt(p2m->root);
+    /* The table should always be non-NULL and is always present. */
+    if ( !table )
+        ASSERT_UNREACHABLE();
+
+    if ( is_gfns_mapped(p2m, gfn, nr_gfns, &idx) )
+        return INVALID_MFN;
+
+    region = &table[idx];
+    if ( region_is_p2m_valid(region) )
+    {
+        *t = region->prbar.reg.p2m_type;
+
+        if ( valid )
+            *valid = region_is_valid(region);
+    }
+
+    /* Always GFN == MFN in MPU system. */
+    return _mfn(gfn_x(gfn));
+}
+
+/*
+ * Get the details of a given gfn.
+ *
+ * If the entry is present, the associated MFN will be returned and the
+ * p2m type gets filled up.
+ * If the entry is not present, INVALID_MFN will be returned
+ *
+ * The page_order is meaningless in MPU system, and we keep it here
+ * to be compatible with MMU system.
+ */
+mfn_t p2m_get_entry(struct p2m_domain *p2m, gfn_t gfn,
+                    p2m_type_t *t, p2m_access_t *a,
+                    unsigned int *page_order,
+                    bool *valid)
+{
+    return p2m_get_mpu_region(p2m, gfn, 1, t, valid);
+}
+
 /*
  * Local variables:
  * mode: C
-- 
2.25.1


