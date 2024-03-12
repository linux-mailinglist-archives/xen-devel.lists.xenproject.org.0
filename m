Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B341B8794BB
	for <lists+xen-devel@lfdr.de>; Tue, 12 Mar 2024 14:04:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.691819.1078296 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rk1na-00073W-2h; Tue, 12 Mar 2024 13:04:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 691819.1078296; Tue, 12 Mar 2024 13:04:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rk1nZ-0006yp-QR; Tue, 12 Mar 2024 13:04:05 +0000
Received: by outflank-mailman (input) for mailman id 691819;
 Tue, 12 Mar 2024 13:04:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=91vH=KS=arm.com=luca.fancellu@srs-se1.protection.inumbo.net>)
 id 1rk1nY-0004WU-VI
 for xen-devel@lists.xenproject.org; Tue, 12 Mar 2024 13:04:04 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id fff54792-e070-11ee-a1ee-f123f15fe8a2;
 Tue, 12 Mar 2024 14:04:03 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 095E41570;
 Tue, 12 Mar 2024 06:04:40 -0700 (PDT)
Received: from e125770.cambridge.arm.com (e125770.arm.com [10.1.199.43])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 79BFF3F762;
 Tue, 12 Mar 2024 06:04:01 -0700 (PDT)
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
X-Inumbo-ID: fff54792-e070-11ee-a1ee-f123f15fe8a2
From: Luca Fancellu <luca.fancellu@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Penny Zheng <Penny.Zheng@arm.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Penny Zheng <penny.zheng@arm.com>
Subject: [PATCH 10/11] xen/arm: fix duplicate /reserved-memory node in Dom0
Date: Tue, 12 Mar 2024 13:03:30 +0000
Message-Id: <20240312130331.78418-11-luca.fancellu@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240312130331.78418-1-luca.fancellu@arm.com>
References: <20240312130331.78418-1-luca.fancellu@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Penny Zheng <Penny.Zheng@arm.com>

In case there is a /reserved-memory node already present in the host dtb,
current Xen codes would create yet another /reserved-memory node when
the static shared memory feature is enabled and static shared memory
region are present, this would result in an incorrect device tree
generation and guest would not be able to detect the static shared memory
region.

Avoid this issue checking the presence of the /reserved-memory node and
appending the nodes instead of generating a duplicate /reserved-memory.

Signed-off-by: Penny Zheng <penny.zheng@arm.com>
Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
---
v1:
 - Rework of https://patchwork.kernel.org/project/xen-devel/patch/20231206090623.1932275-11-Penny.Zheng@arm.com/
---
 xen/arch/arm/domain_build.c             | 23 ++++++++++++++++++++---
 xen/arch/arm/include/asm/static-shmem.h | 11 +++++++++++
 xen/arch/arm/static-shmem.c             | 12 +++++++-----
 3 files changed, 38 insertions(+), 8 deletions(-)

diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
index 740c483ea2db..575e906d81a6 100644
--- a/xen/arch/arm/domain_build.c
+++ b/xen/arch/arm/domain_build.c
@@ -1620,6 +1620,7 @@ static int __init handle_node(struct domain *d, struct kernel_info *kinfo,
         DT_MATCH_PATH("/hypervisor"),
         { /* sentinel */ },
     };
+    static __initdata bool res_mem_node_found = false;
     struct dt_device_node *child;
     int res, i, nirq, irq_id;
     const char *name;
@@ -1714,6 +1715,19 @@ static int __init handle_node(struct domain *d, struct kernel_info *kinfo,
     if ( res )
         return res;
 
+    if ( dt_node_path_is_equal(node, "/reserved-memory") )
+    {
+        res_mem_node_found = true;
+        /*
+         * Avoid duplicate /reserved-memory nodes in Device Tree, so list the
+         * static shared memory nodes there.
+         */
+        res = make_shm_memory_node(d, kinfo, dt_n_addr_cells(node),
+                                   dt_n_size_cells(node));
+        if ( res )
+            return res;
+    }
+
     for ( child = node->child; child != NULL; child = child->sibling )
     {
         res = handle_node(d, kinfo, child, p2mt);
@@ -1766,9 +1780,12 @@ static int __init handle_node(struct domain *d, struct kernel_info *kinfo,
                 return res;
         }
 
-        res = make_resv_memory_node(d, kinfo, addrcells, sizecells);
-        if ( res )
-            return res;
+        if ( !res_mem_node_found )
+        {
+            res = make_resv_memory_node(d, kinfo, addrcells, sizecells);
+            if ( res )
+                return res;
+        }
     }
 
     res = fdt_end_node(kinfo->fdt);
diff --git a/xen/arch/arm/include/asm/static-shmem.h b/xen/arch/arm/include/asm/static-shmem.h
index 2f70aed53ac7..d28b9540d49b 100644
--- a/xen/arch/arm/include/asm/static-shmem.h
+++ b/xen/arch/arm/include/asm/static-shmem.h
@@ -35,6 +35,10 @@ int remove_shm_from_rangeset(const struct kernel_info *kinfo,
 int remove_shm_holes_for_domU(const struct kernel_info *kinfo,
                               struct membanks *ext_regions);
 
+int make_shm_memory_node(const struct domain *d,
+                         const struct kernel_info *kinfo, int addrcells,
+                         int sizecells);
+
 #else /* !CONFIG_STATIC_SHM */
 
 static inline int make_resv_memory_node(const struct domain *d,
@@ -79,6 +83,13 @@ static inline int remove_shm_holes_for_domU(const struct kernel_info *kinfo,
     return 0;
 }
 
+static inline int make_shm_memory_node(const struct domain *d,
+                                       const struct kernel_info *kinfo,
+                                       int addrcells, int sizecells)
+{
+    return 0;
+}
+
 #endif /* CONFIG_STATIC_SHM */
 
 #endif /* __ASM_STATIC_SHMEM_H_ */
diff --git a/xen/arch/arm/static-shmem.c b/xen/arch/arm/static-shmem.c
index b3e2105dd3f2..67d5fa3b5d25 100644
--- a/xen/arch/arm/static-shmem.c
+++ b/xen/arch/arm/static-shmem.c
@@ -287,15 +287,17 @@ int __init process_shm(struct domain *d, struct kernel_info *kinfo,
     return 0;
 }
 
-static int __init make_shm_memory_node(const struct domain *d, void *fdt,
-                                       int addrcells, int sizecells,
-                                       const struct membanks *mem)
+int __init make_shm_memory_node(const struct domain *d,
+                                const struct kernel_info *kinfo, int addrcells,
+                                int sizecells)
 {
+    const struct membanks *mem = &kinfo->shm_mem.common;
+    void *fdt = kinfo->fdt;
     unsigned int i = 0;
     int res = 0;
 
     if ( mem->nr_banks == 0 )
-        return -ENOENT;
+        return 0;
 
     /*
      * For each shared memory region, a range is exposed under
@@ -534,7 +536,7 @@ int __init make_resv_memory_node(const struct domain *d,
     if ( res )
         return res;
 
-    res = make_shm_memory_node(d, fdt, addrcells, sizecells, mem);
+    res = make_shm_memory_node(d, kinfo, addrcells, sizecells);
     if ( res )
         return res;
 
-- 
2.34.1


