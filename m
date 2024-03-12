Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 67D638794BA
	for <lists+xen-devel@lfdr.de>; Tue, 12 Mar 2024 14:04:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.691811.1078221 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rk1nP-00051q-Vk; Tue, 12 Mar 2024 13:03:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 691811.1078221; Tue, 12 Mar 2024 13:03:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rk1nP-00050E-Rv; Tue, 12 Mar 2024 13:03:55 +0000
Received: by outflank-mailman (input) for mailman id 691811;
 Tue, 12 Mar 2024 13:03:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=91vH=KS=arm.com=luca.fancellu@srs-se1.protection.inumbo.net>)
 id 1rk1nN-0004WU-Un
 for xen-devel@lists.xenproject.org; Tue, 12 Mar 2024 13:03:53 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id f94e0066-e070-11ee-a1ee-f123f15fe8a2;
 Tue, 12 Mar 2024 14:03:52 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AD98115A1;
 Tue, 12 Mar 2024 06:04:28 -0700 (PDT)
Received: from e125770.cambridge.arm.com (e125770.arm.com [10.1.199.43])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 27FC83F762;
 Tue, 12 Mar 2024 06:03:50 -0700 (PDT)
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
X-Inumbo-ID: f94e0066-e070-11ee-a1ee-f123f15fe8a2
From: Luca Fancellu <luca.fancellu@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Penny Zheng <Penny.Zheng@arm.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Penny Zheng <penny.zheng@arm.com>
Subject: [PATCH 02/11] xen/arm: avoid repetitive checking in process_shm_node
Date: Tue, 12 Mar 2024 13:03:22 +0000
Message-Id: <20240312130331.78418-3-luca.fancellu@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240312130331.78418-1-luca.fancellu@arm.com>
References: <20240312130331.78418-1-luca.fancellu@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Penny Zheng <Penny.Zheng@arm.com>

Putting overlap and overflow checking in the loop is causing repetitive
operation, so this commit extracts both checking outside the loop.

Signed-off-by: Penny Zheng <penny.zheng@arm.com>
Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
---
v1:
 - Rework of https://patchwork.kernel.org/project/xen-devel/patch/20231206090623.1932275-3-Penny.Zheng@arm.com/
 - use strncmp to match the branch above
 - drop Michal R-by given the change
---
 xen/arch/arm/static-shmem.c | 39 +++++++++++++++----------------------
 1 file changed, 16 insertions(+), 23 deletions(-)

diff --git a/xen/arch/arm/static-shmem.c b/xen/arch/arm/static-shmem.c
index cb268cd2edf1..40a0e860c79d 100644
--- a/xen/arch/arm/static-shmem.c
+++ b/xen/arch/arm/static-shmem.c
@@ -349,7 +349,7 @@ int __init process_shm_node(const void *fdt, int node, uint32_t address_cells,
 {
     const struct fdt_property *prop, *prop_id, *prop_role;
     const __be32 *cell;
-    paddr_t paddr, gaddr, size;
+    paddr_t paddr, gaddr, size, end;
     struct meminfo *mem = &bootinfo.reserved_mem;
     unsigned int i;
     int len;
@@ -422,6 +422,13 @@ int __init process_shm_node(const void *fdt, int node, uint32_t address_cells,
         return -EINVAL;
     }
 
+    end = paddr + size;
+    if ( end <= paddr )
+    {
+        printk("fdt: static shared memory region %s overflow\n", shm_id);
+        return -EINVAL;
+    }
+
     for ( i = 0; i < mem->nr_banks; i++ )
     {
         /*
@@ -441,30 +448,13 @@ int __init process_shm_node(const void *fdt, int node, uint32_t address_cells,
                 return -EINVAL;
             }
         }
+        else if ( strncmp(shm_id, mem->bank[i].shm_id, MAX_SHM_ID_LENGTH) != 0 )
+            continue;
         else
         {
-            paddr_t end = paddr + size;
-            paddr_t bank_end = mem->bank[i].start + mem->bank[i].size;
-
-            if ( (end <= paddr) || (bank_end <= mem->bank[i].start) )
-            {
-                printk("fdt: static shared memory region %s overflow\n", shm_id);
-                return -EINVAL;
-            }
-
-            if ( check_reserved_regions_overlap(paddr, size) )
-                return -EINVAL;
-            else
-            {
-                if ( strcmp(shm_id, mem->bank[i].shm_id) != 0 )
-                    continue;
-                else
-                {
-                    printk("fdt: different shared memory region could not share the same shm ID %s\n",
-                           shm_id);
-                    return -EINVAL;
-                }
-            }
+            printk("fdt: different shared memory region could not share the same shm ID %s\n",
+                   shm_id);
+            return -EINVAL;
         }
     }
 
@@ -472,6 +462,9 @@ int __init process_shm_node(const void *fdt, int node, uint32_t address_cells,
     {
         if ( i < NR_MEM_BANKS )
         {
+            if ( check_reserved_regions_overlap(paddr, size) )
+                return -EINVAL;
+
             /* Static shared memory shall be reserved from any other use. */
             safe_strcpy(mem->bank[mem->nr_banks].shm_id, shm_id);
             mem->bank[mem->nr_banks].start = paddr;
-- 
2.34.1


