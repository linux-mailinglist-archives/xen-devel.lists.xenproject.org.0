Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DDFCA8A9433
	for <lists+xen-devel@lfdr.de>; Thu, 18 Apr 2024 09:37:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.708015.1106574 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rxMKW-0005GZ-Pt; Thu, 18 Apr 2024 07:37:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 708015.1106574; Thu, 18 Apr 2024 07:37:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rxMKW-0005B7-J1; Thu, 18 Apr 2024 07:37:12 +0000
Received: by outflank-mailman (input) for mailman id 708015;
 Thu, 18 Apr 2024 07:37:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=EyP4=LX=arm.com=luca.fancellu@srs-se1.protection.inumbo.net>)
 id 1rxMKV-00057l-Gq
 for xen-devel@lists.xenproject.org; Thu, 18 Apr 2024 07:37:11 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id 7723327f-fd56-11ee-b909-491648fe20b8;
 Thu, 18 Apr 2024 09:37:10 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B6A791576;
 Thu, 18 Apr 2024 00:37:37 -0700 (PDT)
Received: from e125770.cambridge.arm.com (e125770.arm.com [10.1.199.43])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 141503F64C;
 Thu, 18 Apr 2024 00:37:08 -0700 (PDT)
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
X-Inumbo-ID: 7723327f-fd56-11ee-b909-491648fe20b8
From: Luca Fancellu <luca.fancellu@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v3 06/12] xen/arm: Avoid code duplication in find_unallocated_memory
Date: Thu, 18 Apr 2024 08:36:46 +0100
Message-Id: <20240418073652.3622828-7-luca.fancellu@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240418073652.3622828-1-luca.fancellu@arm.com>
References: <20240418073652.3622828-1-luca.fancellu@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The function find_unallocated_memory is using the same code to
loop through 2 structure of the same type, in order to avoid
code duplication, rework the code to have only one loop that
goes through all the structures, this will be used to avoid
duplication when the static shared memory banks will be introduced
as a separate structure from reserved memory.

Take the occasion to add the error code to the error message in
case 'rangeset_remove_range' fails.

Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
---
v3:
 - Fixed the wrong logic, now the function correctly adds the
   available ram to the rangeset and afterwards removes the
   Dom0 memory and reserved memory from it.
 - take the occasion to print the error code in the error
   message as explained in the commit msg.
v2:
 - Add comment in the loop inside find_unallocated_memory to
   improve readability
v1:
 - new patch
---
---
 xen/arch/arm/domain_build.c | 53 ++++++++++++++++---------------------
 1 file changed, 23 insertions(+), 30 deletions(-)

diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
index 02e4dcafe78f..7c7038254473 100644
--- a/xen/arch/arm/domain_build.c
+++ b/xen/arch/arm/domain_build.c
@@ -868,12 +868,14 @@ static int __init add_ext_regions(unsigned long s_gfn, unsigned long e_gfn,
 static int __init find_unallocated_memory(const struct kernel_info *kinfo,
                                           struct membanks *ext_regions)
 {
-    const struct membanks *kinfo_mem = kernel_info_get_mem(kinfo);
     const struct membanks *mem = bootinfo_get_mem();
-    const struct membanks *reserved_mem = bootinfo_get_reserved_mem();
+    const struct membanks *mem_banks[] = {
+        kernel_info_get_mem(kinfo),
+        bootinfo_get_reserved_mem(),
+    };
     struct rangeset *unalloc_mem;
     paddr_t start, end;
-    unsigned int i;
+    unsigned int i, j;
     int res;
 
     dt_dprintk("Find unallocated memory for extended regions\n");
@@ -897,35 +899,26 @@ static int __init find_unallocated_memory(const struct kernel_info *kinfo,
         }
     }
 
-    /* Remove RAM assigned to Dom0 */
-    for ( i = 0; i < kinfo_mem->nr_banks; i++ )
-    {
-        start = kinfo_mem->bank[i].start;
-        end = kinfo_mem->bank[i].start + kinfo_mem->bank[i].size;
-        res = rangeset_remove_range(unalloc_mem, PFN_DOWN(start),
-                                    PFN_DOWN(end - 1));
-        if ( res )
-        {
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
-                                    PFN_DOWN(end - 1));
-        if ( res )
+    /*
+     * Exclude the following regions:
+     * 1) Remove RAM assigned to Dom0
+     * 2) Remove reserved memory
+     */
+    for ( i = 0; i < ARRAY_SIZE(mem_banks); i++ )
+        for ( j = 0; j < mem_banks[i]->nr_banks; j++ )
         {
-            printk(XENLOG_ERR "Failed to remove: %#"PRIpaddr"->%#"PRIpaddr"\n",
-                   start, end);
-            goto out;
+            start = mem_banks[i]->bank[j].start;
+            end = mem_banks[i]->bank[j].start + mem_banks[i]->bank[j].size;
+            res = rangeset_remove_range(unalloc_mem, PFN_DOWN(start),
+                                        PFN_DOWN(end - 1));
+            if ( res )
+            {
+                printk(XENLOG_ERR
+                       "Failed to add: %#"PRIpaddr"->%#"PRIpaddr", error %d\n",
+                       start, end, res);
+                goto out;
+            }
         }
-    }
 
     /* Remove grant table region */
     if ( kinfo->gnttab_size )
-- 
2.34.1


