Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BEAE18A9431
	for <lists+xen-devel@lfdr.de>; Thu, 18 Apr 2024 09:37:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.708013.1106557 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rxMKU-0004tQ-3b; Thu, 18 Apr 2024 07:37:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 708013.1106557; Thu, 18 Apr 2024 07:37:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rxMKU-0004qi-07; Thu, 18 Apr 2024 07:37:10 +0000
Received: by outflank-mailman (input) for mailman id 708013;
 Thu, 18 Apr 2024 07:37:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=EyP4=LX=arm.com=luca.fancellu@srs-se1.protection.inumbo.net>)
 id 1rxMKS-00046V-E9
 for xen-devel@lists.xenproject.org; Thu, 18 Apr 2024 07:37:08 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id 74634cd5-fd56-11ee-94a3-07e782e9044d;
 Thu, 18 Apr 2024 09:37:05 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 93C08339;
 Thu, 18 Apr 2024 00:37:33 -0700 (PDT)
Received: from e125770.cambridge.arm.com (e125770.arm.com [10.1.199.43])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E51DC3F64C;
 Thu, 18 Apr 2024 00:37:04 -0700 (PDT)
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
X-Inumbo-ID: 74634cd5-fd56-11ee-94a3-07e782e9044d
From: Luca Fancellu <luca.fancellu@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v3 03/12] xen/arm: Pass struct kernel_info parameter to make_{resv,shm}_memory_node
Date: Thu, 18 Apr 2024 08:36:43 +0100
Message-Id: <20240418073652.3622828-4-luca.fancellu@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240418073652.3622828-1-luca.fancellu@arm.com>
References: <20240418073652.3622828-1-luca.fancellu@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The struct domain parameter is not used in make_resv_memory_node and in
its called function make_shm_memory_node, so drop it from both functions,
also, take the occasion to pass directly struct kernel_info, from which
we can infer other parameters passed to the functions and drop them as
well.

Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
Reviewed-by: Michal Orzel <michal.orzel@amd.com>
---
v3:
 - Fix commit title/msg, add Michal R-by
v2:
 - new patch
---
---
 xen/arch/arm/dom0less-build.c           |  3 +--
 xen/arch/arm/domain_build.c             |  3 +--
 xen/arch/arm/include/asm/static-shmem.h |  9 ++++-----
 xen/arch/arm/static-shmem.c             | 16 +++++++++-------
 4 files changed, 15 insertions(+), 16 deletions(-)

diff --git a/xen/arch/arm/dom0less-build.c b/xen/arch/arm/dom0less-build.c
index fb63ec6fd111..0edc5357caef 100644
--- a/xen/arch/arm/dom0less-build.c
+++ b/xen/arch/arm/dom0less-build.c
@@ -645,8 +645,7 @@ static int __init prepare_dtb_domU(struct domain *d, struct kernel_info *kinfo)
     if ( ret )
         goto err;
 
-    ret = make_resv_memory_node(d, kinfo->fdt, addrcells, sizecells,
-                                &kinfo->shm_mem);
+    ret = make_resv_memory_node(kinfo, addrcells, sizecells);
     if ( ret )
         goto err;
 
diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
index 54232ed4cb9d..11d4e7d0b1ea 100644
--- a/xen/arch/arm/domain_build.c
+++ b/xen/arch/arm/domain_build.c
@@ -1769,8 +1769,7 @@ static int __init handle_node(struct domain *d, struct kernel_info *kinfo,
                 return res;
         }
 
-        res = make_resv_memory_node(d, kinfo->fdt, addrcells, sizecells,
-                                    &kinfo->shm_mem);
+        res = make_resv_memory_node(kinfo, addrcells, sizecells);
         if ( res )
             return res;
     }
diff --git a/xen/arch/arm/include/asm/static-shmem.h b/xen/arch/arm/include/asm/static-shmem.h
index 1536ff18b895..680594b6843d 100644
--- a/xen/arch/arm/include/asm/static-shmem.h
+++ b/xen/arch/arm/include/asm/static-shmem.h
@@ -7,8 +7,8 @@
 
 #ifdef CONFIG_STATIC_SHM
 
-int make_resv_memory_node(const struct domain *d, void *fdt, int addrcells,
-                          int sizecells, const struct meminfo *mem);
+int make_resv_memory_node(const struct kernel_info *kinfo, int addrcells,
+                          int sizecells);
 
 int process_shm(struct domain *d, struct kernel_info *kinfo,
                 const struct dt_device_node *node);
@@ -26,9 +26,8 @@ int process_shm_node(const void *fdt, int node, uint32_t address_cells,
 
 #else /* !CONFIG_STATIC_SHM */
 
-static inline int make_resv_memory_node(const struct domain *d, void *fdt,
-                                        int addrcells, int sizecells,
-                                        const struct meminfo *mem)
+static inline int make_resv_memory_node(const struct kernel_info *kinfo,
+                                        int addrcells, int sizecells)
 {
     return 0;
 }
diff --git a/xen/arch/arm/static-shmem.c b/xen/arch/arm/static-shmem.c
index 40a0e860c79d..349b85667684 100644
--- a/xen/arch/arm/static-shmem.c
+++ b/xen/arch/arm/static-shmem.c
@@ -277,10 +277,11 @@ int __init process_shm(struct domain *d, struct kernel_info *kinfo,
     return 0;
 }
 
-static int __init make_shm_memory_node(const struct domain *d, void *fdt,
-                                       int addrcells, int sizecells,
-                                       const struct meminfo *mem)
+static int __init make_shm_memory_node(const struct kernel_info *kinfo,
+                                       int addrcells, int sizecells)
 {
+    const struct meminfo *mem = &kinfo->shm_mem;
+    void *fdt = kinfo->fdt;
     unsigned int i = 0;
     int res = 0;
 
@@ -488,10 +489,11 @@ int __init process_shm_node(const void *fdt, int node, uint32_t address_cells,
     return 0;
 }
 
-int __init make_resv_memory_node(const struct domain *d, void *fdt,
-                                 int addrcells, int sizecells,
-                                 const struct meminfo *mem)
+int __init make_resv_memory_node(const struct kernel_info *kinfo, int addrcells,
+                                 int sizecells)
 {
+    const struct meminfo *mem = &kinfo->shm_mem;
+    void *fdt = kinfo->fdt;
     int res = 0;
     /* Placeholder for reserved-memory\0 */
     const char resvbuf[16] = "reserved-memory";
@@ -518,7 +520,7 @@ int __init make_resv_memory_node(const struct domain *d, void *fdt,
     if ( res )
         return res;
 
-    res = make_shm_memory_node(d, fdt, addrcells, sizecells, mem);
+    res = make_shm_memory_node(kinfo, addrcells, sizecells);
     if ( res )
         return res;
 
-- 
2.34.1


