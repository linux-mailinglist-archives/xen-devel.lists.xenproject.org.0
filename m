Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F468264851
	for <lists+xen-devel@lfdr.de>; Thu, 10 Sep 2020 16:50:36 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kGNu9-0007SE-HN; Thu, 10 Sep 2020 14:50:29 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=S6nR=CT=xen.org=paul@srs-us1.protection.inumbo.net>)
 id 1kGNu8-0007KI-Px
 for xen-devel@lists.xenproject.org; Thu, 10 Sep 2020 14:50:28 +0000
X-Inumbo-ID: 6904f1bb-5beb-4449-9208-a9010ecda113
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 6904f1bb-5beb-4449-9208-a9010ecda113;
 Thu, 10 Sep 2020 14:50:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From;
 bh=6V76Q1js+MJI/MnngmySvDNGdA9OgOS346gnP058fqs=; b=B2Fvf0ct6XVBTxubaBcKVQ9UW5
 VrFz8/+TzGK+JN//5E8L+YlMByNrNNrOiy78Mz2lp2XXYLrx9mk2Ikfg2o+8pdj7mn8HFSNMei1fW
 mr8/muHMJyr9FD3NLJdPhIhC25H8bAfncN0yC3z5eggTme1DQiySICkUSmaGXGG1Yn00=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <paul@xen.org>)
 id 1kGNtx-0006vB-Qp; Thu, 10 Sep 2020 14:50:17 +0000
Received: from host86-176-94-160.range86-176.btcentralplus.com
 ([86.176.94.160] helo=u2f063a87eabd5f.home)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <paul@xen.org>)
 id 1kGNtx-0004ZM-IW; Thu, 10 Sep 2020 14:50:17 +0000
From: Paul Durrant <paul@xen.org>
To: xen-devel@lists.xenproject.org
Cc: Paul Durrant <pdurrant@amazon.com>, Jan Beulich <jbeulich@suse.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Subject: [PATCH v6 6/8] common/grant_table: batch flush I/O TLB
Date: Thu, 10 Sep 2020 15:50:05 +0100
Message-Id: <20200910145007.14107-7-paul@xen.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200910145007.14107-1-paul@xen.org>
References: <20200910145007.14107-1-paul@xen.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

From: Paul Durrant <pdurrant@amazon.com>

This patch avoids calling iommu_iotlb_flush() for each individual GNTTABOP and
instead calls iommu_iotlb_flush_all() at the end of a batch. This should mean
non-singleton map/unmap operations perform better.

NOTE: A batch is the number of operations done before a pre-emption check and,
      in the case of unmap, a TLB flush.

Suggested-by: Jan Beulich <jbeulich@suse.com>
Signed-off-by: Paul Durrant <pdurrant@amazon.com>
Reviewed-by: Jan Beulich <jbeulich@suse.com>
---
Cc: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: George Dunlap <george.dunlap@citrix.com>
Cc: Ian Jackson <ian.jackson@eu.citrix.com>
Cc: Julien Grall <julien@xen.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>
Cc: Wei Liu <wl@xen.org>

v6:
 - Fix spelling of 'preemption'
 - Drop unneeded 'currd' stack variable

v5:
 - Add batching to gnttab_map_grant_ref() to handle flushing before pre-
   emption check
 - Maintain per-op flushing in the case of singletons

v3:
 - New in v3
---
 xen/common/grant_table.c | 199 ++++++++++++++++++++++++++-------------
 1 file changed, 133 insertions(+), 66 deletions(-)

diff --git a/xen/common/grant_table.c b/xen/common/grant_table.c
index beb6b2d40d..1e3d7a2d33 100644
--- a/xen/common/grant_table.c
+++ b/xen/common/grant_table.c
@@ -241,7 +241,13 @@ struct gnttab_unmap_common {
     grant_ref_t ref;
 };
 
-/* Number of unmap operations that are done between each tlb flush */
+/* Number of map operations that are done between each preemption check */
+#define GNTTAB_MAP_BATCH_SIZE 32
+
+/*
+ * Number of unmap operations that are done between each tlb flush and
+ * preemption check.
+ */
 #define GNTTAB_UNMAP_BATCH_SIZE 32
 
 
@@ -979,7 +985,7 @@ static unsigned int mapkind(
 
 static void
 map_grant_ref(
-    struct gnttab_map_grant_ref *op)
+    struct gnttab_map_grant_ref *op, bool do_flush, unsigned int *flush_flags)
 {
     struct domain *ld, *rd, *owner = NULL;
     struct grant_table *lgt, *rgt;
@@ -1229,12 +1235,11 @@ map_grant_ref(
         if ( kind )
         {
             dfn_t dfn = _dfn(mfn_x(mfn));
-            unsigned int flush_flags = 0;
             int err;
 
-            err = iommu_map(ld, dfn, mfn, 1, kind, &flush_flags);
-            if ( !err )
-                err = iommu_iotlb_flush(ld, dfn, 1, flush_flags);
+            err = iommu_map(ld, dfn, mfn, 1, kind, flush_flags);
+            if ( do_flush && !err )
+                err = iommu_iotlb_flush(ld, dfn, 1, *flush_flags);
             if ( err )
             {
                 double_gt_unlock(lgt, rgt);
@@ -1319,29 +1324,59 @@ static long
 gnttab_map_grant_ref(
     XEN_GUEST_HANDLE_PARAM(gnttab_map_grant_ref_t) uop, unsigned int count)
 {
-    int i;
-    struct gnttab_map_grant_ref op;
+    unsigned int done = 0;
+    int rc = 0;
 
-    for ( i = 0; i < count; i++ )
+    while ( count )
     {
-        if ( i && hypercall_preempt_check() )
-            return i;
+        unsigned int i, c = min_t(unsigned int, count, GNTTAB_MAP_BATCH_SIZE);
+        unsigned int flush_flags = 0;
 
-        if ( unlikely(__copy_from_guest_offset(&op, uop, i, 1)) )
-            return -EFAULT;
+        for ( i = 0; i < c; i++ )
+        {
+            struct gnttab_map_grant_ref op;
 
-        map_grant_ref(&op);
+            if ( unlikely(__copy_from_guest(&op, uop, 1)) )
+            {
+                rc = -EFAULT;
+                break;
+            }
 
-        if ( unlikely(__copy_to_guest_offset(uop, i, &op, 1)) )
-            return -EFAULT;
+            map_grant_ref(&op, c == 1, &flush_flags);
+
+            if ( unlikely(__copy_to_guest(uop, &op, 1)) )
+            {
+                rc = -EFAULT;
+                break;
+            }
+
+            guest_handle_add_offset(uop, 1);
+        }
+
+        if ( c > 1 )
+        {
+            int err = iommu_iotlb_flush_all(current->domain, flush_flags);
+
+            if ( !rc )
+                rc = err;
+        }
+
+        if ( rc )
+            break;
+
+        count -= c;
+        done += c;
+
+        if ( count && hypercall_preempt_check() )
+            return done;
     }
 
-    return 0;
+    return rc;
 }
 
 static void
 unmap_common(
-    struct gnttab_unmap_common *op)
+    struct gnttab_unmap_common *op, bool do_flush, unsigned int *flush_flags)
 {
     domid_t          dom;
     struct domain   *ld, *rd;
@@ -1485,22 +1520,20 @@ unmap_common(
     {
         unsigned int kind;
         dfn_t dfn = _dfn(mfn_x(op->mfn));
-        unsigned int flush_flags = 0;
         int err = 0;
 
         double_gt_lock(lgt, rgt);
 
         kind = mapkind(lgt, rd, op->mfn);
         if ( !kind )
-            err = iommu_unmap(ld, dfn, 1, &flush_flags);
+            err = iommu_unmap(ld, dfn, 1, flush_flags);
         else if ( !(kind & MAPKIND_WRITE) )
-            err = iommu_map(ld, dfn, op->mfn, 1, IOMMUF_readable,
-                            &flush_flags);
+            err = iommu_map(ld, dfn, op->mfn, 1, IOMMUF_readable, flush_flags);
 
         double_gt_unlock(lgt, rgt);
 
-        if ( !err )
-            err = iommu_iotlb_flush(ld, dfn, 1, flush_flags);
+        if ( do_flush && !err )
+            err = iommu_iotlb_flush(ld, dfn, 1, *flush_flags);
         if ( err )
             rc = GNTST_general_error;
     }
@@ -1599,8 +1632,8 @@ unmap_common_complete(struct gnttab_unmap_common *op)
 
 static void
 unmap_grant_ref(
-    struct gnttab_unmap_grant_ref *op,
-    struct gnttab_unmap_common *common)
+    struct gnttab_unmap_grant_ref *op, struct gnttab_unmap_common *common,
+    bool do_flush, unsigned int *flush_flags)
 {
     common->host_addr = op->host_addr;
     common->dev_bus_addr = op->dev_bus_addr;
@@ -1612,7 +1645,7 @@ unmap_grant_ref(
     common->rd = NULL;
     common->mfn = INVALID_MFN;
 
-    unmap_common(common);
+    unmap_common(common, do_flush, flush_flags);
     op->status = common->status;
 }
 
@@ -1621,31 +1654,55 @@ static long
 gnttab_unmap_grant_ref(
     XEN_GUEST_HANDLE_PARAM(gnttab_unmap_grant_ref_t) uop, unsigned int count)
 {
-    int i, c, partial_done, done = 0;
-    struct gnttab_unmap_grant_ref op;
-    struct gnttab_unmap_common common[GNTTAB_UNMAP_BATCH_SIZE];
+    struct domain *currd = current->domain;
+    unsigned int done = 0;
+    int rc = 0;
 
-    while ( count != 0 )
+    while ( count )
     {
-        c = min(count, (unsigned int)GNTTAB_UNMAP_BATCH_SIZE);
-        partial_done = 0;
+        struct gnttab_unmap_common common[GNTTAB_UNMAP_BATCH_SIZE];
+        unsigned int i, c, partial_done = 0;
+        unsigned int flush_flags = 0;
+
+        c = min_t(unsigned int, count, GNTTAB_UNMAP_BATCH_SIZE);
 
         for ( i = 0; i < c; i++ )
         {
+            struct gnttab_unmap_grant_ref op;
+
             if ( unlikely(__copy_from_guest(&op, uop, 1)) )
-                goto fault;
-            unmap_grant_ref(&op, &common[i]);
+            {
+                rc = -EFAULT;
+                break;
+            }
+
+            unmap_grant_ref(&op, &common[i], c == 1, &flush_flags);
             ++partial_done;
+
             if ( unlikely(__copy_field_to_guest(uop, &op, status)) )
-                goto fault;
+            {
+                rc = -EFAULT;
+                break;
+            }
+
             guest_handle_add_offset(uop, 1);
         }
 
-        gnttab_flush_tlb(current->domain);
+        gnttab_flush_tlb(currd);
+        if ( c > 1 )
+        {
+            int err = iommu_iotlb_flush_all(currd, flush_flags);
+
+            if ( !rc )
+                rc = err;
+        }
 
         for ( i = 0; i < partial_done; i++ )
             unmap_common_complete(&common[i]);
 
+        if ( rc )
+            break;
+
         count -= c;
         done += c;
 
@@ -1653,20 +1710,13 @@ gnttab_unmap_grant_ref(
             return done;
     }
 
-    return 0;
-
-fault:
-    gnttab_flush_tlb(current->domain);
-
-    for ( i = 0; i < partial_done; i++ )
-        unmap_common_complete(&common[i]);
-    return -EFAULT;
+    return rc;
 }
 
 static void
 unmap_and_replace(
-    struct gnttab_unmap_and_replace *op,
-    struct gnttab_unmap_common *common)
+    struct gnttab_unmap_and_replace *op, struct gnttab_unmap_common *common,
+    bool do_flush, unsigned int *flush_flags)
 {
     common->host_addr = op->host_addr;
     common->new_addr = op->new_addr;
@@ -1678,7 +1728,7 @@ unmap_and_replace(
     common->rd = NULL;
     common->mfn = INVALID_MFN;
 
-    unmap_common(common);
+    unmap_common(common, do_flush, flush_flags);
     op->status = common->status;
 }
 
@@ -1686,31 +1736,55 @@ static long
 gnttab_unmap_and_replace(
     XEN_GUEST_HANDLE_PARAM(gnttab_unmap_and_replace_t) uop, unsigned int count)
 {
-    int i, c, partial_done, done = 0;
-    struct gnttab_unmap_and_replace op;
-    struct gnttab_unmap_common common[GNTTAB_UNMAP_BATCH_SIZE];
+    struct domain *currd = current->domain;
+    unsigned int done = 0;
+    int rc = 0;
 
-    while ( count != 0 )
+    while ( count )
     {
-        c = min(count, (unsigned int)GNTTAB_UNMAP_BATCH_SIZE);
-        partial_done = 0;
+        struct gnttab_unmap_common common[GNTTAB_UNMAP_BATCH_SIZE];
+        unsigned int i, c, partial_done = 0;
+        unsigned int flush_flags = 0;
+
+        c = min_t(unsigned int, count, GNTTAB_UNMAP_BATCH_SIZE);
 
         for ( i = 0; i < c; i++ )
         {
+            struct gnttab_unmap_and_replace op;
+
             if ( unlikely(__copy_from_guest(&op, uop, 1)) )
-                goto fault;
-            unmap_and_replace(&op, &common[i]);
+            {
+                rc = -EFAULT;
+                break;
+            }
+
+            unmap_and_replace(&op, &common[i], c == 1, &flush_flags);
             ++partial_done;
+
             if ( unlikely(__copy_field_to_guest(uop, &op, status)) )
-                goto fault;
+            {
+                rc = -EFAULT;
+                break;
+            }
+
             guest_handle_add_offset(uop, 1);
         }
 
-        gnttab_flush_tlb(current->domain);
+        gnttab_flush_tlb(currd);
+        if ( c > 1 )
+        {
+            int err = iommu_iotlb_flush_all(currd, flush_flags);
+
+            if ( !rc )
+                rc = err;
+        }
 
         for ( i = 0; i < partial_done; i++ )
             unmap_common_complete(&common[i]);
 
+        if ( rc )
+            break;
+
         count -= c;
         done += c;
 
@@ -1718,14 +1792,7 @@ gnttab_unmap_and_replace(
             return done;
     }
 
-    return 0;
-
-fault:
-    gnttab_flush_tlb(current->domain);
-
-    for ( i = 0; i < partial_done; i++ )
-        unmap_common_complete(&common[i]);
-    return -EFAULT;
+    return rc;
 }
 
 static int
-- 
2.20.1


