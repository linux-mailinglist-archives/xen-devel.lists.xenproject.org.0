Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B5EC8794C0
	for <lists+xen-devel@lfdr.de>; Tue, 12 Mar 2024 14:04:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.691815.1078262 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rk1nV-00066y-7I; Tue, 12 Mar 2024 13:04:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 691815.1078262; Tue, 12 Mar 2024 13:04:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rk1nV-00063V-2m; Tue, 12 Mar 2024 13:04:01 +0000
Received: by outflank-mailman (input) for mailman id 691815;
 Tue, 12 Mar 2024 13:03:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=91vH=KS=arm.com=luca.fancellu@srs-se1.protection.inumbo.net>)
 id 1rk1nT-0004WU-6j
 for xen-devel@lists.xenproject.org; Tue, 12 Mar 2024 13:03:59 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id fc860517-e070-11ee-a1ee-f123f15fe8a2;
 Tue, 12 Mar 2024 14:03:57 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4B2821570;
 Tue, 12 Mar 2024 06:04:34 -0700 (PDT)
Received: from e125770.cambridge.arm.com (e125770.arm.com [10.1.199.43])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 06C973F762;
 Tue, 12 Mar 2024 06:03:55 -0700 (PDT)
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
X-Inumbo-ID: fc860517-e070-11ee-a1ee-f123f15fe8a2
From: Luca Fancellu <luca.fancellu@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH 06/11] xen/arm: Avoid code duplication in find_unallocated_memory
Date: Tue, 12 Mar 2024 13:03:26 +0000
Message-Id: <20240312130331.78418-7-luca.fancellu@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240312130331.78418-1-luca.fancellu@arm.com>
References: <20240312130331.78418-1-luca.fancellu@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The function find_unallocated_memory is using the same code to
loop through 3 structure of the same type, in order to avoid
code duplication, rework the code to have only one loop that
goes through all the structures.

Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
---
 xen/arch/arm/domain_build.c | 62 ++++++++++---------------------------
 1 file changed, 17 insertions(+), 45 deletions(-)

diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
index b254f252e7cb..d0f2ac6060eb 100644
--- a/xen/arch/arm/domain_build.c
+++ b/xen/arch/arm/domain_build.c
@@ -869,12 +869,14 @@ static int __init add_ext_regions(unsigned long s_gfn, unsigned long e_gfn,
 static int __init find_unallocated_memory(const struct kernel_info *kinfo,
                                           struct membanks *ext_regions)
 {
-    const struct membanks *kinfo_mem = kernel_info_get_mem(kinfo);
-    const struct membanks *mem = bootinfo_get_mem();
-    const struct membanks *reserved_mem = bootinfo_get_reserved_mem();
+    const struct membanks *mem_banks[] = {
+        bootinfo_get_mem(),
+        kernel_info_get_mem(kinfo),
+        bootinfo_get_reserved_mem(),
+    };
     struct rangeset *unalloc_mem;
     paddr_t start, end;
-    unsigned int i;
+    unsigned int i, j;
     int res;
 
     dt_dprintk("Find unallocated memory for extended regions\n");
@@ -883,50 +885,20 @@ static int __init find_unallocated_memory(const struct kernel_info *kinfo,
     if ( !unalloc_mem )
         return -ENOMEM;
 
-    /* Start with all available RAM */
-    for ( i = 0; i < mem->nr_banks; i++ )
-    {
-        start = mem->bank[i].start;
-        end = mem->bank[i].start + mem->bank[i].size;
-        res = rangeset_add_range(unalloc_mem, PFN_DOWN(start),
-                                 PFN_DOWN(end - 1));
-        if ( res )
-        {
-            printk(XENLOG_ERR "Failed to add: %#"PRIpaddr"->%#"PRIpaddr"\n",
-                   start, end);
-            goto out;
-        }
-    }
-
-    /* Remove RAM assigned to Dom0 */
-    for ( i = 0; i < kinfo_mem->nr_banks; i++ )
-    {
-        start = kinfo_mem->bank[i].start;
-        end = kinfo_mem->bank[i].start + kinfo_mem->bank[i].size;
-        res = rangeset_remove_range(unalloc_mem, PFN_DOWN(start),
-                                    PFN_DOWN(end - 1));
-        if ( res )
+    for ( i = 0; i < ARRAY_SIZE(mem_banks); i++ )
+        for ( j = 0; j < mem_banks[i]->nr_banks; j++ )
         {
-            printk(XENLOG_ERR "Failed to remove: %#"PRIpaddr"->%#"PRIpaddr"\n",
-                   start, end);
-            goto out;
-        }
-    }
-
-    /* Remove reserved-memory regions */
-    for ( i = 0; i < reserved_mem->nr_banks; i++ )
-    {
-        start = reserved_mem->bank[i].start;
-        end = reserved_mem->bank[i].start + reserved_mem->bank[i].size;
-        res = rangeset_remove_range(unalloc_mem, PFN_DOWN(start),
+            start = mem_banks[i]->bank[j].start;
+            end = mem_banks[i]->bank[j].start + mem_banks[i]->bank[j].size;
+            res = rangeset_add_range(unalloc_mem, PFN_DOWN(start),
                                     PFN_DOWN(end - 1));
-        if ( res )
-        {
-            printk(XENLOG_ERR "Failed to remove: %#"PRIpaddr"->%#"PRIpaddr"\n",
-                   start, end);
-            goto out;
+            if ( res )
+            {
+                printk(XENLOG_ERR "Failed to add: %#"PRIpaddr"->%#"PRIpaddr"\n",
+                    start, end);
+                goto out;
+            }
         }
-    }
 
     /* Remove grant table region */
     if ( kinfo->gnttab_size )
-- 
2.34.1


