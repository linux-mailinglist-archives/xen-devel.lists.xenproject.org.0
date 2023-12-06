Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 57A02806A52
	for <lists+xen-devel@lfdr.de>; Wed,  6 Dec 2023 10:06:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.649007.1013246 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rAnrh-0003J6-SJ; Wed, 06 Dec 2023 09:06:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 649007.1013246; Wed, 06 Dec 2023 09:06:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rAnrh-0003Gr-NF; Wed, 06 Dec 2023 09:06:45 +0000
Received: by outflank-mailman (input) for mailman id 649007;
 Wed, 06 Dec 2023 09:06:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=B4rn=HR=arm.com=Penny.Zheng@srs-se1.protection.inumbo.net>)
 id 1rAnrg-00022d-UY
 for xen-devel@lists.xenproject.org; Wed, 06 Dec 2023 09:06:44 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id c61497b2-9416-11ee-9b0f-b553b5be7939;
 Wed, 06 Dec 2023 10:06:43 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 78086139F;
 Wed,  6 Dec 2023 01:07:28 -0800 (PST)
Received: from a011292.shanghai.arm.com (a011292.shanghai.arm.com
 [10.169.190.94])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 7FDA13F762;
 Wed,  6 Dec 2023 01:06:39 -0800 (PST)
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
X-Inumbo-ID: c61497b2-9416-11ee-9b0f-b553b5be7939
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
Subject: [PATCH v5 02/11] xen/arm: avoid repetitive checking in process_shm_node
Date: Wed,  6 Dec 2023 17:06:14 +0800
Message-Id: <20231206090623.1932275-3-Penny.Zheng@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231206090623.1932275-1-Penny.Zheng@arm.com>
References: <20231206090623.1932275-1-Penny.Zheng@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Putting overlap and overflow checking in the loop is causing repetitive
operation, so this commit extracts both checking outside the loop.

Signed-off-by: Penny Zheng <penny.zheng@arm.com>
---
v6:
new commit
---
 xen/arch/arm/static-shmem.c | 39 +++++++++++++++----------------------
 1 file changed, 16 insertions(+), 23 deletions(-)

diff --git a/xen/arch/arm/static-shmem.c b/xen/arch/arm/static-shmem.c
index cb268cd2ed..1a1a9386e4 100644
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
+        else if ( strcmp(shm_id, mem->bank[i].shm_id) != 0 )
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
2.25.1


