Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 771968A945B
	for <lists+xen-devel@lfdr.de>; Thu, 18 Apr 2024 09:46:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.708080.1106678 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rxMTK-0006BG-Be; Thu, 18 Apr 2024 07:46:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 708080.1106678; Thu, 18 Apr 2024 07:46:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rxMTK-00068p-8c; Thu, 18 Apr 2024 07:46:18 +0000
Received: by outflank-mailman (input) for mailman id 708080;
 Thu, 18 Apr 2024 07:46:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=EyP4=LX=arm.com=luca.fancellu@srs-se1.protection.inumbo.net>)
 id 1rxMKd-00046V-JA
 for xen-devel@lists.xenproject.org; Thu, 18 Apr 2024 07:37:19 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id 7b01e855-fd56-11ee-94a3-07e782e9044d;
 Thu, 18 Apr 2024 09:37:17 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B11731576;
 Thu, 18 Apr 2024 00:37:44 -0700 (PDT)
Received: from e125770.cambridge.arm.com (e125770.arm.com [10.1.199.43])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C42B53F64C;
 Thu, 18 Apr 2024 00:37:15 -0700 (PDT)
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
X-Inumbo-ID: 7b01e855-fd56-11ee-94a3-07e782e9044d
From: Luca Fancellu <luca.fancellu@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Penny Zheng <Penny.Zheng@arm.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Penny Zheng <penny.zheng@arm.com>
Subject: [PATCH v3 11/12] xen/arm: fix duplicate /reserved-memory node in Dom0
Date: Thu, 18 Apr 2024 08:36:51 +0100
Message-Id: <20240418073652.3622828-12-luca.fancellu@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240418073652.3622828-1-luca.fancellu@arm.com>
References: <20240418073652.3622828-1-luca.fancellu@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Penny Zheng <Penny.Zheng@arm.com>

In case there is a /reserved-memory node already present in the host
dtb, current Xen codes would create yet another /reserved-memory node
when the static shared memory feature is enabled and static shared
memory regions are present.
This would result in an incorrect device tree generation and hwdom
would not be able to detect the static shared memory region.

Avoid this issue by checking the presence of the /reserved-memory
node and appending the nodes instead of generating a duplicate
/reserved-memory.

Make make_shm_memory_node externally visible and rename it to
make_shm_resv_memory_node to make clear it produces childs for
/reserved-memory.

Signed-off-by: Penny Zheng <penny.zheng@arm.com>
Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
Reviewed-by: Michal Orzel <michal.orzel@amd.com>
---
v2:
 - fix comment, remove function signature change, fixed commit msg
 - rename make_shm_memory_node to make_shm_resv_memory_node in order
   to make clear that it produces childs for /reserved-memory
 - Add Michal R-by
v1:
 - Rework of https://patchwork.kernel.org/project/xen-devel/patch/20231206090623.1932275-11-Penny.Zheng@arm.com/
---
 xen/arch/arm/domain_build.c             | 23 ++++++++++++++++++++---
 xen/arch/arm/include/asm/static-shmem.h |  9 +++++++++
 xen/arch/arm/static-shmem.c             |  8 ++++----
 3 files changed, 33 insertions(+), 7 deletions(-)

diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
index 0cc39b0bd7bb..68532ddc084c 100644
--- a/xen/arch/arm/domain_build.c
+++ b/xen/arch/arm/domain_build.c
@@ -1640,6 +1640,7 @@ static int __init handle_node(struct domain *d, struct kernel_info *kinfo,
         DT_MATCH_PATH("/hypervisor"),
         { /* sentinel */ },
     };
+    static __initdata bool res_mem_node_found = false;
     struct dt_device_node *child;
     int res, i, nirq, irq_id;
     const char *name;
@@ -1734,6 +1735,19 @@ static int __init handle_node(struct domain *d, struct kernel_info *kinfo,
     if ( res )
         return res;
 
+    if ( dt_node_path_is_equal(node, "/reserved-memory") )
+    {
+        res_mem_node_found = true;
+        /*
+         * Avoid duplicate /reserved-memory nodes in Device Tree, so add the
+         * static shared memory nodes there.
+         */
+        res = make_shm_resv_memory_node(kinfo, dt_n_addr_cells(node),
+                                        dt_n_size_cells(node));
+        if ( res )
+            return res;
+    }
+
     for ( child = node->child; child != NULL; child = child->sibling )
     {
         res = handle_node(d, kinfo, child, p2mt);
@@ -1786,9 +1800,12 @@ static int __init handle_node(struct domain *d, struct kernel_info *kinfo,
                 return res;
         }
 
-        res = make_resv_memory_node(kinfo, addrcells, sizecells);
-        if ( res )
-            return res;
+        if ( !res_mem_node_found )
+        {
+            res = make_resv_memory_node(kinfo, addrcells, sizecells);
+            if ( res )
+                return res;
+        }
     }
 
     res = fdt_end_node(kinfo->fdt);
diff --git a/xen/arch/arm/include/asm/static-shmem.h b/xen/arch/arm/include/asm/static-shmem.h
index 2e8b138eb989..7495a91e7a31 100644
--- a/xen/arch/arm/include/asm/static-shmem.h
+++ b/xen/arch/arm/include/asm/static-shmem.h
@@ -34,6 +34,9 @@ int remove_shm_from_rangeset(const struct kernel_info *kinfo,
 int remove_shm_holes_for_domU(const struct kernel_info *kinfo,
                               struct membanks *ext_regions);
 
+int make_shm_resv_memory_node(const struct kernel_info *kinfo, int addrcells,
+                              int sizecells);
+
 #else /* !CONFIG_STATIC_SHM */
 
 static inline int make_resv_memory_node(const struct kernel_info *kinfo,
@@ -77,6 +80,12 @@ static inline int remove_shm_holes_for_domU(const struct kernel_info *kinfo,
     return 0;
 }
 
+static inline int make_shm_resv_memory_node(const struct kernel_info *kinfo,
+                                            int addrcells, int sizecells)
+{
+    return 0;
+}
+
 #endif /* CONFIG_STATIC_SHM */
 
 #endif /* __ASM_STATIC_SHMEM_H_ */
diff --git a/xen/arch/arm/static-shmem.c b/xen/arch/arm/static-shmem.c
index 12e2df939915..c85f60dd1bf7 100644
--- a/xen/arch/arm/static-shmem.c
+++ b/xen/arch/arm/static-shmem.c
@@ -297,8 +297,8 @@ int __init process_shm(struct domain *d, struct kernel_info *kinfo,
     return 0;
 }
 
-static int __init make_shm_memory_node(const struct kernel_info *kinfo,
-                                       int addrcells, int sizecells)
+int __init make_shm_resv_memory_node(const struct kernel_info *kinfo,
+                                     int addrcells, int sizecells)
 {
     const struct membanks *mem = &kinfo->shm_mem.common;
     void *fdt = kinfo->fdt;
@@ -306,7 +306,7 @@ static int __init make_shm_memory_node(const struct kernel_info *kinfo,
     int res = 0;
 
     if ( mem->nr_banks == 0 )
-        return -ENOENT;
+        return 0;
 
     /*
      * For each shared memory region, a range is exposed under
@@ -544,7 +544,7 @@ int __init make_resv_memory_node(const struct kernel_info *kinfo, int addrcells,
     if ( res )
         return res;
 
-    res = make_shm_memory_node(kinfo, addrcells, sizecells);
+    res = make_shm_resv_memory_node(kinfo, addrcells, sizecells);
     if ( res )
         return res;
 
-- 
2.34.1


