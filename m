Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 532F6987B23
	for <lists+xen-devel@lfdr.de>; Fri, 27 Sep 2024 00:25:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.805919.1217185 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1stwv4-0002ml-KC; Thu, 26 Sep 2024 22:25:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 805919.1217185; Thu, 26 Sep 2024 22:25:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1stwv4-0002fC-F1; Thu, 26 Sep 2024 22:25:06 +0000
Received: by outflank-mailman (input) for mailman id 805919;
 Thu, 26 Sep 2024 22:25:05 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Ruc3=QY=raptorengineering.com=sanastasio@srs-se1.protection.inumbo.net>)
 id 1stwv3-0002UO-GH
 for xen-devel@lists.xenproject.org; Thu, 26 Sep 2024 22:25:05 +0000
Received: from raptorengineering.com (mail.raptorengineering.com
 [23.155.224.40]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2b7f996d-7c56-11ef-a0ba-8be0dac302b0;
 Fri, 27 Sep 2024 00:25:02 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id C1729828533D;
 Thu, 26 Sep 2024 17:25:00 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id znw22mSfNoGb; Thu, 26 Sep 2024 17:25:00 -0500 (CDT)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id E85528287AD2;
 Thu, 26 Sep 2024 17:24:59 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id wgumsF1QtB_l; Thu, 26 Sep 2024 17:24:59 -0500 (CDT)
Received: from raptor-ewks-026.rptsys.com (5.edge.rptsys.com [23.155.224.38])
 by mail.rptsys.com (Postfix) with ESMTPSA id 6AF3E82875D8;
 Thu, 26 Sep 2024 17:24:59 -0500 (CDT)
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
X-Inumbo-ID: 2b7f996d-7c56-11ef-a0ba-8be0dac302b0
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.rptsys.com E85528287AD2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=raptorengineering.com; s=B8E824E6-0BE2-11E6-931D-288C65937AAD;
	t=1727389499; bh=THnizrM8WgaLaQIQIbJlVxO/Ss/IgUEmhuA4iY9zqi8=;
	h=From:To:Date:Message-Id:MIME-Version;
	b=qyjb8lNeEJVOA7DrNWsd4JqmTjBTN+OojreSI5ZnhchAAwBcOnu4rG2ZMZCMQ5Uuu
	 T4Zm7L2FnbipcTa4r01dynbuDKDPti3SZWM1x+t16JO36656wD46guRGg0D3adf13z
	 qbJ1LQdBjYZzNnfDKhDKPT4sS3QRiQpeOtd8o2GM=
X-Virus-Scanned: amavisd-new at rptsys.com
From: Shawn Anastasio <sanastasio@raptorengineering.com>
To: xen-devel@lists.xenproject.org
Cc: tpearson@raptorengineering.com,
	Jan Beulich <jbeulich@suse.com>,
	Shawn Anastasio <sanastasio@raptorengineering.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>
Subject: [PATCH v5 1/3] xen/device-tree: Let DT reserve map entries overlap reserved-memory
Date: Thu, 26 Sep 2024 17:24:42 -0500
Message-Id: <302647e409d91ea7ed39e568dadeedc572976c3b.1727388925.git.sanastasio@raptorengineering.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1727388925.git.sanastasio@raptorengineering.com>
References: <cover.1727388925.git.sanastasio@raptorengineering.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Commit 53dc37829c31 ("xen/arm: Add DT reserve map regions to
bootinfo.reserved_mem") changes the way reserve map regions are tracked,
and as a result broke bootfdt's ability to handle device trees in which
the reserve map and the `reserved-memory` node contain the same entries
as each other, as is the case on PPC when booted by skiboot.

Fix this behavior by moving the reserve map check to after the DT has
been parsed and by explicitly allowing overlap with entries created by
`reserved-memory` nodes.

Fixes: 53dc37829c31 ("xen/arm: Add DT reserve map regions to bootinfo.reserved_mem")
Signed-off-by: Shawn Anastasio <sanastasio@raptorengineering.com>
---
 xen/common/device-tree/bootfdt.c  | 28 +++++++++++++++++++++++-----
 xen/common/device-tree/bootinfo.c | 11 +++++++++--
 xen/include/xen/bootfdt.h         |  3 ++-
 3 files changed, 34 insertions(+), 8 deletions(-)

diff --git a/xen/common/device-tree/bootfdt.c b/xen/common/device-tree/bootfdt.c
index 911a630e7d..2a51ee44a3 100644
--- a/xen/common/device-tree/bootfdt.c
+++ b/xen/common/device-tree/bootfdt.c
@@ -177,7 +177,7 @@ static int __init device_tree_get_meminfo(const void *fdt, int node,
     {
         device_tree_get_reg(&cell, address_cells, size_cells, &start, &size);
         if ( mem == bootinfo_get_reserved_mem() &&
-             check_reserved_regions_overlap(start, size) )
+             check_reserved_regions_overlap(start, size, NULL) )
             return -EINVAL;
         /* Some DT may describe empty bank, ignore them */
         if ( !size )
@@ -590,14 +590,36 @@ size_t __init boot_fdt_info(const void *fdt, paddr_t paddr)
     if ( nr_rsvd < 0 )
         panic("Parsing FDT memory reserve map failed (%d)\n", nr_rsvd);
 
+    ret = device_tree_for_each_node(fdt, 0, early_scan_node, NULL);
+    if ( ret )
+        panic("Early FDT parsing failed (%d)\n", ret);
+
     for ( i = 0; i < nr_rsvd; i++ )
     {
+        const struct membanks *overlap = NULL;
         struct membank *bank;
         paddr_t s, sz;
 
         if ( fdt_get_mem_rsv_paddr(device_tree_flattened, i, &s, &sz) < 0 )
             continue;
 
+        if ( check_reserved_regions_overlap(s, sz, &overlap) )
+        {
+            if ( overlap == bootinfo_get_reserved_mem() )
+            {
+                /*
+                 * Some valid device trees, such as those generated by OpenPOWER
+                 * skiboot firmware, expose all reserved memory regions in the
+                 * FDT memory reservation block (here) AND in the
+                 * reserved-memory node which has already been parsed. Thus, any
+                 * overlaps in the mem_reserved banks should be ignored.
+                 */
+                 continue;
+            }
+            else
+                panic("FDT reserve map overlapped with membanks/modules\n");
+        }
+
         if ( reserved_mem->nr_banks < reserved_mem->max_banks )
         {
             bank = &reserved_mem->bank[reserved_mem->nr_banks];
@@ -610,10 +632,6 @@ size_t __init boot_fdt_info(const void *fdt, paddr_t paddr)
             panic("Cannot allocate reserved memory bank\n");
     }
 
-    ret = device_tree_for_each_node(fdt, 0, early_scan_node, NULL);
-    if ( ret )
-        panic("Early FDT parsing failed (%d)\n", ret);
-
     /*
      * On Arm64 setup_directmap_mappings() expects to be called with the lowest
      * bank in memory first. There is no requirement that the DT will provide
diff --git a/xen/common/device-tree/bootinfo.c b/xen/common/device-tree/bootinfo.c
index f2e6a1145b..c1752bfdc8 100644
--- a/xen/common/device-tree/bootinfo.c
+++ b/xen/common/device-tree/bootinfo.c
@@ -171,7 +171,8 @@ void __init fw_unreserved_regions(paddr_t s, paddr_t e,
  * existing reserved memory regions, otherwise false.
  */
 bool __init check_reserved_regions_overlap(paddr_t region_start,
-                                           paddr_t region_size)
+                                           paddr_t region_size,
+                                           const struct membanks **out_overlapping_membanks)
 {
     const struct membanks *mem_banks[] = {
         bootinfo_get_reserved_mem(),
@@ -190,8 +191,14 @@ bool __init check_reserved_regions_overlap(paddr_t region_start,
      * shared memory banks (when static shared memory feature is enabled)
      */
     for ( i = 0; i < ARRAY_SIZE(mem_banks); i++ )
+    {
         if ( meminfo_overlap_check(mem_banks[i], region_start, region_size) )
+        {
+            if ( out_overlapping_membanks )
+                *out_overlapping_membanks = mem_banks[i];
             return true;
+        }
+    }
 
     /* Check if input region is overlapping with bootmodules */
     if ( bootmodules_overlap_check(&bootinfo.modules,
@@ -216,7 +223,7 @@ struct bootmodule __init *add_boot_module(bootmodule_kind kind,
         return NULL;
     }
 
-    if ( check_reserved_regions_overlap(start, size) )
+    if ( check_reserved_regions_overlap(start, size, NULL) )
         return NULL;
 
     for ( i = 0 ; i < mods->nr_mods ; i++ )
diff --git a/xen/include/xen/bootfdt.h b/xen/include/xen/bootfdt.h
index 16fa05f38f..03e1d5fde8 100644
--- a/xen/include/xen/bootfdt.h
+++ b/xen/include/xen/bootfdt.h
@@ -158,7 +158,8 @@ struct bootinfo {
 extern struct bootinfo bootinfo;
 
 bool check_reserved_regions_overlap(paddr_t region_start,
-                                    paddr_t region_size);
+                                    paddr_t region_size,
+                                    const struct membanks **out_overlapping_membanks);
 
 struct bootmodule *add_boot_module(bootmodule_kind kind,
                                    paddr_t start, paddr_t size, bool domU);
-- 
2.30.2


