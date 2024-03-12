Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 605098794C1
	for <lists+xen-devel@lfdr.de>; Tue, 12 Mar 2024 14:04:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.691820.1078311 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rk1nc-0007cJ-8f; Tue, 12 Mar 2024 13:04:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 691820.1078311; Tue, 12 Mar 2024 13:04:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rk1nc-0007ad-2g; Tue, 12 Mar 2024 13:04:08 +0000
Received: by outflank-mailman (input) for mailman id 691820;
 Tue, 12 Mar 2024 13:04:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=91vH=KS=arm.com=luca.fancellu@srs-se1.protection.inumbo.net>)
 id 1rk1na-0004WU-6H
 for xen-devel@lists.xenproject.org; Tue, 12 Mar 2024 13:04:06 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id 00a9ea6d-e071-11ee-a1ee-f123f15fe8a2;
 Tue, 12 Mar 2024 14:04:04 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5327215A1;
 Tue, 12 Mar 2024 06:04:41 -0700 (PDT)
Received: from e125770.cambridge.arm.com (e125770.arm.com [10.1.199.43])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0EB153F762;
 Tue, 12 Mar 2024 06:04:02 -0700 (PDT)
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
X-Inumbo-ID: 00a9ea6d-e071-11ee-a1ee-f123f15fe8a2
From: Luca Fancellu <luca.fancellu@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH 11/11] xen/arm: List static shared memory regions as /memory nodes
Date: Tue, 12 Mar 2024 13:03:31 +0000
Message-Id: <20240312130331.78418-12-luca.fancellu@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240312130331.78418-1-luca.fancellu@arm.com>
References: <20240312130331.78418-1-luca.fancellu@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Currently Xen is not exporting the static shared memory regions
to the device tree as /memory node, this commit is fixing this
issue.

Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
---
 xen/arch/arm/dom0less-build.c           |  5 +++
 xen/arch/arm/domain_build.c             |  7 +++-
 xen/arch/arm/include/asm/static-shmem.h |  5 ++-
 xen/arch/arm/static-shmem.c             | 54 +++++++++++++++----------
 4 files changed, 47 insertions(+), 24 deletions(-)

diff --git a/xen/arch/arm/dom0less-build.c b/xen/arch/arm/dom0less-build.c
index fe2a771d4984..0892020f21a0 100644
--- a/xen/arch/arm/dom0less-build.c
+++ b/xen/arch/arm/dom0less-build.c
@@ -647,6 +647,11 @@ static int __init prepare_dtb_domU(struct domain *d, struct kernel_info *kinfo)
     if ( ret )
         goto err;
 
+    /* List static shared memory regions as /memory@<address> nodes */
+    ret = make_shm_memory_node(d, kinfo, addrcells, sizecells, false);
+    if ( ret )
+        return ret;
+
     ret = make_resv_memory_node(d, kinfo, addrcells, sizecells);
     if ( ret )
         goto err;
diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
index 575e906d81a6..bd7716cd5829 100644
--- a/xen/arch/arm/domain_build.c
+++ b/xen/arch/arm/domain_build.c
@@ -1723,7 +1723,7 @@ static int __init handle_node(struct domain *d, struct kernel_info *kinfo,
          * static shared memory nodes there.
          */
         res = make_shm_memory_node(d, kinfo, dt_n_addr_cells(node),
-                                   dt_n_size_cells(node));
+                                   dt_n_size_cells(node), true);
         if ( res )
             return res;
     }
@@ -1780,6 +1780,11 @@ static int __init handle_node(struct domain *d, struct kernel_info *kinfo,
                 return res;
         }
 
+        /* List static shared memory regions as /memory@<address> nodes */
+        res = make_shm_memory_node(d, kinfo, addrcells, sizecells, false);
+        if ( res )
+            return res;
+
         if ( !res_mem_node_found )
         {
             res = make_resv_memory_node(d, kinfo, addrcells, sizecells);
diff --git a/xen/arch/arm/include/asm/static-shmem.h b/xen/arch/arm/include/asm/static-shmem.h
index d28b9540d49b..c118bbb1c43b 100644
--- a/xen/arch/arm/include/asm/static-shmem.h
+++ b/xen/arch/arm/include/asm/static-shmem.h
@@ -37,7 +37,7 @@ int remove_shm_holes_for_domU(const struct kernel_info *kinfo,
 
 int make_shm_memory_node(const struct domain *d,
                          const struct kernel_info *kinfo, int addrcells,
-                         int sizecells);
+                         int sizecells, bool is_resv_mem_node);
 
 #else /* !CONFIG_STATIC_SHM */
 
@@ -85,7 +85,8 @@ static inline int remove_shm_holes_for_domU(const struct kernel_info *kinfo,
 
 static inline int make_shm_memory_node(const struct domain *d,
                                        const struct kernel_info *kinfo,
-                                       int addrcells, int sizecells)
+                                       int addrcells, int sizecells,
+                                       bool is_resv_mem_node)
 {
     return 0;
 }
diff --git a/xen/arch/arm/static-shmem.c b/xen/arch/arm/static-shmem.c
index 67d5fa3b5d25..cdaf4485c934 100644
--- a/xen/arch/arm/static-shmem.c
+++ b/xen/arch/arm/static-shmem.c
@@ -289,7 +289,7 @@ int __init process_shm(struct domain *d, struct kernel_info *kinfo,
 
 int __init make_shm_memory_node(const struct domain *d,
                                 const struct kernel_info *kinfo, int addrcells,
-                                int sizecells)
+                                int sizecells, bool is_resv_mem_node)
 {
     const struct membanks *mem = &kinfo->shm_mem.common;
     void *fdt = kinfo->fdt;
@@ -300,11 +300,15 @@ int __init make_shm_memory_node(const struct domain *d,
         return 0;
 
     /*
-     * For each shared memory region, a range is exposed under
-     * the /reserved-memory node as a child node. Each range sub-node is
-     * named xen-shmem@<address>.
+     * When is_resv_mem_node is true, it means this function is called to
+     * create nodes under /reserved-memory, so for each shared memory region, a
+     * range is exposed under the /reserved-memory node as a child node. Each
+     * range sub-node is named xen-shmem@<address>.
+     * Otherwise the function is called under / and will create
+     * /memory@<address> nodes for each static shared memory region.
      */
-    dt_dprintk("Create xen-shmem node\n");
+    dt_dprintk("Create static shared memory %s nodes\n",
+               is_resv_mem_node ? "/reserved-memory/xen-shmem" : "/memory");
 
     for ( ; i < mem->nr_banks; i++ )
     {
@@ -316,11 +320,16 @@ int __init make_shm_memory_node(const struct domain *d,
         __be32 *cells;
         unsigned int len = (addrcells + sizecells) * sizeof(__be32);
 
-        res = domain_fdt_begin_node(fdt, "xen-shmem", mem->bank[i].start);
+        res = domain_fdt_begin_node(fdt,
+                                    is_resv_mem_node ? "xen-shmem" : "memory",
+                                    mem->bank[i].start);
         if ( res )
             return res;
 
-        res = fdt_property(fdt, "compatible", compat, sizeof(compat));
+        if ( is_resv_mem_node )
+            res = fdt_property(fdt, "compatible", compat, sizeof(compat));
+        else
+            res = fdt_property_string(fdt, "device_type", "memory");
         if ( res )
             return res;
 
@@ -334,20 +343,23 @@ int __init make_shm_memory_node(const struct domain *d,
         dt_dprintk("Shared memory bank %u: %#"PRIx64"->%#"PRIx64"\n",
                    i, start, start + size);
 
-        res = fdt_property_string(fdt, "xen,id",
-                                  mem->bank[i].shmem_extra->shm_id);
-        if ( res )
-            return res;
+        if ( is_resv_mem_node )
+        {
+            res = fdt_property_string(fdt, "xen,id",
+                                      mem->bank[i].shmem_extra->shm_id);
+            if ( res )
+                return res;
 
-        /*
-         * TODO:
-         * - xen,offset: (borrower VMs only)
-         *   64 bit integer offset within the owner virtual machine's shared
-         *   memory region used for the mapping in the borrower VM
-         */
-        res = fdt_property_u64(fdt, "xen,offset", 0);
-        if ( res )
-            return res;
+            /*
+            * TODO:
+            * - xen,offset: (borrower VMs only)
+            *   64 bit integer offset within the owner virtual machine's shared
+            *   memory region used for the mapping in the borrower VM
+            */
+            res = fdt_property_u64(fdt, "xen,offset", 0);
+            if ( res )
+                return res;
+        }
 
         res = fdt_end_node(fdt);
         if ( res )
@@ -536,7 +548,7 @@ int __init make_resv_memory_node(const struct domain *d,
     if ( res )
         return res;
 
-    res = make_shm_memory_node(d, kinfo, addrcells, sizecells);
+    res = make_shm_memory_node(d, kinfo, addrcells, sizecells, true);
     if ( res )
         return res;
 
-- 
2.34.1


