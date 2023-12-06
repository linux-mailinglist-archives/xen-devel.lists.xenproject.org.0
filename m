Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7189D806A95
	for <lists+xen-devel@lfdr.de>; Wed,  6 Dec 2023 10:22:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.649052.1013336 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rAo6V-0005SD-VO; Wed, 06 Dec 2023 09:22:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 649052.1013336; Wed, 06 Dec 2023 09:22:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rAo6V-0005Pr-Rv; Wed, 06 Dec 2023 09:22:03 +0000
Received: by outflank-mailman (input) for mailman id 649052;
 Wed, 06 Dec 2023 09:22:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=B4rn=HR=arm.com=Penny.Zheng@srs-se1.protection.inumbo.net>)
 id 1rAns8-00022d-Ac
 for xen-devel@lists.xenproject.org; Wed, 06 Dec 2023 09:07:12 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id d6660baf-9416-11ee-9b0f-b553b5be7939;
 Wed, 06 Dec 2023 10:07:10 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0A835139F;
 Wed,  6 Dec 2023 01:07:56 -0800 (PST)
Received: from a011292.shanghai.arm.com (a011292.shanghai.arm.com
 [10.169.190.94])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 129A73F762;
 Wed,  6 Dec 2023 01:07:06 -0800 (PST)
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
X-Inumbo-ID: d6660baf-9416-11ee-9b0f-b553b5be7939
From: Penny Zheng <Penny.Zheng@arm.com>
To: xen-devel@lists.xenproject.org,
	michal.orzel@amd.com
Cc: wei.chen@arm.com,
	Penny Zheng <Penny.Zheng@arm.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Penny Zheng <penny.zheng@arm.com>
Subject: [PATCH v5 10/11] xen/arm: fix duplicate /reserved-memory node in Dom0
Date: Wed,  6 Dec 2023 17:06:22 +0800
Message-Id: <20231206090623.1932275-11-Penny.Zheng@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231206090623.1932275-1-Penny.Zheng@arm.com>
References: <20231206090623.1932275-1-Penny.Zheng@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In case there is a /reserved-memory node already present in the host dtb,
current Xen codes would create yet another /reserved-memory node specially
for the static shm in Dom0 Device Tree.

Xen will use write_properties() to copy the reserved memory nodes from host dtb
to Dom0 FDT, so we want to insert the shm node along with the copying.
And avoiding duplication, we add a checking before make_resv_memory_node().

Signed-off-by: Penny Zheng <penny.zheng@arm.com>

---
v3 -> v4:
new commit
---
v4 -> v5:
rebase and no change
---
 xen/arch/arm/domain_build.c             | 27 ++++++++++++++++++++++---
 xen/arch/arm/include/asm/kernel.h       |  2 ++
 xen/arch/arm/include/asm/static-shmem.h | 14 +++++++++++++
 xen/arch/arm/static-shmem.c             |  6 +++---
 4 files changed, 43 insertions(+), 6 deletions(-)

diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
index e040f8a6d9..f098678ea3 100644
--- a/xen/arch/arm/domain_build.c
+++ b/xen/arch/arm/domain_build.c
@@ -752,6 +752,23 @@ static int __init write_properties(struct domain *d, struct kernel_info *kinfo,
         }
     }
 
+    if ( dt_node_path_is_equal(node, "/reserved-memory") )
+    {
+        kinfo->resv_mem = true;
+
+        /* shared memory provided. */
+        if ( kinfo->shminfo.nr_banks != 0 )
+        {
+            uint32_t addrcells = dt_n_addr_cells(node),
+                     sizecells = dt_n_size_cells(node);
+
+            res = make_shm_memory_node(d, kinfo->fdt,
+                                       addrcells, sizecells, kinfo);
+            if ( res )
+                return res;
+        }
+    }
+
     return 0;
 }
 
@@ -1856,9 +1873,13 @@ static int __init handle_node(struct domain *d, struct kernel_info *kinfo,
                 return res;
         }
 
-        res = make_resv_memory_node(d, kinfo->fdt, addrcells, sizecells, kinfo);
-        if ( res )
-            return res;
+        /* Avoid duplicate /reserved-memory nodes in Device Tree */
+        if ( !kinfo->resv_mem )
+        {
+            res = make_resv_memory_node(d, kinfo->fdt, addrcells, sizecells, kinfo);
+            if ( res )
+                return res;
+        }
     }
 
     res = fdt_end_node(kinfo->fdt);
diff --git a/xen/arch/arm/include/asm/kernel.h b/xen/arch/arm/include/asm/kernel.h
index db3d8232fa..8fe2105a91 100644
--- a/xen/arch/arm/include/asm/kernel.h
+++ b/xen/arch/arm/include/asm/kernel.h
@@ -39,6 +39,8 @@ struct kernel_info {
     void *fdt; /* flat device tree */
     paddr_t unassigned_mem; /* RAM not (yet) assigned to a bank */
     struct meminfo mem;
+    /* Whether we have /reserved-memory node in host Device Tree */
+    bool resv_mem;
     /* Static shared memory banks */
     struct {
         unsigned int nr_banks;
diff --git a/xen/arch/arm/include/asm/static-shmem.h b/xen/arch/arm/include/asm/static-shmem.h
index d149985291..6cb4ef9646 100644
--- a/xen/arch/arm/include/asm/static-shmem.h
+++ b/xen/arch/arm/include/asm/static-shmem.h
@@ -33,6 +33,11 @@ int remove_shm_from_rangeset(const struct kernel_info *kinfo,
 
 int remove_shm_holes_for_domU(const struct kernel_info *kinfo,
                               struct meminfo *orig_ext);
+
+int make_shm_memory_node(const struct domain *d,
+                         void *fdt,
+                         int addrcells, int sizecells,
+                         const struct kernel_info *kinfo);
 #else /* !CONFIG_STATIC_SHM */
 
 static inline int make_resv_memory_node(const struct domain *d, void *fdt,
@@ -72,6 +77,15 @@ static inline int remove_shm_holes_for_domU(const struct kernel_info *kinfo,
 {
     return 0;
 }
+
+static inline int make_shm_memory_node(const struct domain *d,
+                                       void *fdt,
+                                       int addrcells, int sizecells,
+                                       const struct kernel_info *kinfo)
+{
+    return 0;
+}
+
 #endif /* CONFIG_STATIC_SHM */
 
 #endif /* __ASM_STATIC_SHMEM_H_ */
diff --git a/xen/arch/arm/static-shmem.c b/xen/arch/arm/static-shmem.c
index a06949abaf..bfce5bbad0 100644
--- a/xen/arch/arm/static-shmem.c
+++ b/xen/arch/arm/static-shmem.c
@@ -505,9 +505,9 @@ int __init process_shm(struct domain *d, struct kernel_info *kinfo,
     return 0;
 }
 
-static int __init make_shm_memory_node(const struct domain *d, void *fdt,
-                                       int addrcells, int sizecells,
-                                       const struct kernel_info *kinfo)
+int __init make_shm_memory_node(const struct domain *d, void *fdt,
+                                int addrcells, int sizecells,
+                                const struct kernel_info *kinfo)
 {
     unsigned int i = 0;
     int res = 0;
-- 
2.25.1


