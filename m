Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8342623A4C2
	for <lists+xen-devel@lfdr.de>; Mon,  3 Aug 2020 14:30:03 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k2Zb6-0007X2-9y; Mon, 03 Aug 2020 12:29:44 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=rQjY=BN=xen.org=paul@srs-us1.protection.inumbo.net>)
 id 1k2Zb5-0007NV-1A
 for xen-devel@lists.xenproject.org; Mon, 03 Aug 2020 12:29:43 +0000
X-Inumbo-ID: f8ddcd10-d584-11ea-af26-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f8ddcd10-d584-11ea-af26-12813bfff9fa;
 Mon, 03 Aug 2020 12:29:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=9CNNemKJGP8SuVWzacpv68au3entEv5YFODLnV2d/u0=; b=sUVmnpcNrI10qLi84QPnqnAnP8
 jU5qzZCRv+AQwxe0RbaGxXqpffhJXuIH3x+R2W2LI2ZFcGAakxhT7jnXj7Qi+p28XKlLZLQg/UGju
 pHWuh425o6RLot6mjQ3nYuQY5ZVgeazKHsD7xHsfbfDQB2ORbgQ//DsYWr8go7a8JLrk=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <paul@xen.org>)
 id 1k2Zap-0000TA-A7; Mon, 03 Aug 2020 12:29:27 +0000
Received: from host86-143-223-30.range86-143.btcentralplus.com
 ([86.143.223.30] helo=u2f063a87eabd5f.home)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <paul@xen.org>)
 id 1k2Zap-0000zk-33; Mon, 03 Aug 2020 12:29:27 +0000
From: Paul Durrant <paul@xen.org>
To: xen-devel@lists.xenproject.org
Subject: [PATCH v3 09/11] common/grant_table: batch flush I/O TLB
Date: Mon,  3 Aug 2020 13:29:12 +0100
Message-Id: <20200803122914.2259-10-paul@xen.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200803122914.2259-1-paul@xen.org>
References: <20200803122914.2259-1-paul@xen.org>
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Paul Durrant <pdurrant@amazon.com>, Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

From: Paul Durrant <pdurrant@amazon.com>

This patch avoids calling iommu_iotlb_flush() for each individual GNTTABOP and
insteads calls iommu_iotlb_flush_all() at the end of the hypercall. This
should mean batched map/unmap operations perform better but may be slightly
detrimental to singleton performance.

Suggested-by: Jan Beulich <jbeulich@suse.com>
Signed-off-by: Paul Durrant <pdurrant@amazon.com>
---
Cc: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: George Dunlap <george.dunlap@citrix.com>
Cc: Ian Jackson <ian.jackson@eu.citrix.com>
Cc: Jan Beulich <jbeulich@suse.com>
Cc: Julien Grall <julien@xen.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>
Cc: Wei Liu <wl@xen.org>

v3:
 - New in v3
---
 xen/common/grant_table.c | 132 ++++++++++++++++++++++++---------------
 1 file changed, 80 insertions(+), 52 deletions(-)

diff --git a/xen/common/grant_table.c b/xen/common/grant_table.c
index d6526bca12..f382e0be52 100644
--- a/xen/common/grant_table.c
+++ b/xen/common/grant_table.c
@@ -979,7 +979,7 @@ static unsigned int mapkind(
 
 static void
 map_grant_ref(
-    struct gnttab_map_grant_ref *op)
+    struct gnttab_map_grant_ref *op, unsigned int *flush_flags)
 {
     struct domain *ld, *rd, *owner = NULL;
     struct grant_table *lgt, *rgt;
@@ -1228,17 +1228,12 @@ map_grant_ref(
         if ( kind )
         {
             dfn_t dfn = _dfn(mfn_x(mfn));
-            unsigned int flush_flags = 0;
             int err;
 
-            err = iommu_map(ld, dfn, mfn, 0, 1, kind, &flush_flags);
-            if ( !err )
-                err = iommu_iotlb_flush(ld, dfn, 0, 1, flush_flags);
+            err = iommu_map(ld, dfn, mfn, 0, 1, kind, flush_flags);
             if ( err )
-                rc = GNTST_general_error;
-
-            if ( rc != GNTST_okay )
             {
+                rc = GNTST_general_error;
                 double_gt_unlock(lgt, rgt);
                 goto undo_out;
             }
@@ -1322,6 +1317,8 @@ gnttab_map_grant_ref(
 {
     int i;
     struct gnttab_map_grant_ref op;
+    unsigned int flush_flags = 0;
+    int err, rc = 0;
 
     for ( i = 0; i < count; i++ )
     {
@@ -1329,20 +1326,30 @@ gnttab_map_grant_ref(
             return i;
 
         if ( unlikely(__copy_from_guest_offset(&op, uop, i, 1)) )
-            return -EFAULT;
+        {
+            rc = -EFAULT;
+            break;
+        }
 
-        map_grant_ref(&op);
+        map_grant_ref(&op, &flush_flags);
 
         if ( unlikely(__copy_to_guest_offset(uop, i, &op, 1)) )
-            return -EFAULT;
+        {
+            rc = -EFAULT;
+            break;
+        }
     }
 
-    return 0;
+    err = iommu_iotlb_flush_all(current->domain, flush_flags);
+    if ( !rc )
+        rc = err;
+
+    return rc;
 }
 
 static void
 unmap_common(
-    struct gnttab_unmap_common *op)
+    struct gnttab_unmap_common *op, unsigned int *flush_flags)
 {
     domid_t          dom;
     struct domain   *ld, *rd;
@@ -1486,20 +1493,16 @@ unmap_common(
     {
         unsigned int kind;
         dfn_t dfn = _dfn(mfn_x(op->mfn));
-        unsigned int flush_flags = 0;
         int err = 0;
 
         double_gt_lock(lgt, rgt);
 
         kind = mapkind(lgt, rd, op->mfn);
         if ( !kind )
-            err = iommu_unmap(ld, dfn, 0, 1, &flush_flags);
+            err = iommu_unmap(ld, dfn, 0, 1, flush_flags);
         else if ( !(kind & MAPKIND_WRITE) )
             err = iommu_map(ld, dfn, op->mfn, 0, 1, IOMMUF_readable,
-                            &flush_flags);
-
-        if ( !err )
-            err = iommu_iotlb_flush(ld, dfn, 0, 1, flush_flags);
+                            flush_flags);
         if ( err )
             rc = GNTST_general_error;
 
@@ -1600,8 +1603,8 @@ unmap_common_complete(struct gnttab_unmap_common *op)
 
 static void
 unmap_grant_ref(
-    struct gnttab_unmap_grant_ref *op,
-    struct gnttab_unmap_common *common)
+    struct gnttab_unmap_grant_ref *op, struct gnttab_unmap_common *common,
+    unsigned int *flush_flags)
 {
     common->host_addr = op->host_addr;
     common->dev_bus_addr = op->dev_bus_addr;
@@ -1613,7 +1616,7 @@ unmap_grant_ref(
     common->rd = NULL;
     common->mfn = INVALID_MFN;
 
-    unmap_common(common);
+    unmap_common(common, flush_flags);
     op->status = common->status;
 }
 
@@ -1622,31 +1625,50 @@ static long
 gnttab_unmap_grant_ref(
     XEN_GUEST_HANDLE_PARAM(gnttab_unmap_grant_ref_t) uop, unsigned int count)
 {
-    int i, c, partial_done, done = 0;
+    struct domain *currd = current->domain;
     struct gnttab_unmap_grant_ref op;
     struct gnttab_unmap_common common[GNTTAB_UNMAP_BATCH_SIZE];
+    int rc = 0;
 
     while ( count != 0 )
     {
+        unsigned int i, c, partial_done = 0, done = 0;
+        unsigned int flush_flags = 0;
+        int err;
+
         c = min(count, (unsigned int)GNTTAB_UNMAP_BATCH_SIZE);
-        partial_done = 0;
 
         for ( i = 0; i < c; i++ )
         {
             if ( unlikely(__copy_from_guest(&op, uop, 1)) )
-                goto fault;
-            unmap_grant_ref(&op, &common[i]);
+            {
+                rc = -EFAULT;
+                break;
+            }
+
+            unmap_grant_ref(&op, &common[i], &flush_flags);
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
+        err = iommu_iotlb_flush_all(currd, flush_flags);
+        if ( !rc )
+            rc = err;
 
         for ( i = 0; i < partial_done; i++ )
             unmap_common_complete(&common[i]);
 
+        if ( rc )
+            break;
+
         count -= c;
         done += c;
 
@@ -1654,20 +1676,14 @@ gnttab_unmap_grant_ref(
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
     struct gnttab_unmap_and_replace *op,
-    struct gnttab_unmap_common *common)
+    struct gnttab_unmap_common *common,
+    unsigned int *flush_flags)
 {
     common->host_addr = op->host_addr;
     common->new_addr = op->new_addr;
@@ -1679,7 +1695,7 @@ unmap_and_replace(
     common->rd = NULL;
     common->mfn = INVALID_MFN;
 
-    unmap_common(common);
+    unmap_common(common, flush_flags);
     op->status = common->status;
 }
 
@@ -1687,31 +1703,50 @@ static long
 gnttab_unmap_and_replace(
     XEN_GUEST_HANDLE_PARAM(gnttab_unmap_and_replace_t) uop, unsigned int count)
 {
-    int i, c, partial_done, done = 0;
+    struct domain *currd = current->domain;
     struct gnttab_unmap_and_replace op;
     struct gnttab_unmap_common common[GNTTAB_UNMAP_BATCH_SIZE];
+    int rc = 0;
 
     while ( count != 0 )
     {
+        unsigned int i, c, partial_done = 0, done = 0;
+        unsigned int flush_flags = 0;
+        int err;
+
         c = min(count, (unsigned int)GNTTAB_UNMAP_BATCH_SIZE);
-        partial_done = 0;
 
         for ( i = 0; i < c; i++ )
         {
             if ( unlikely(__copy_from_guest(&op, uop, 1)) )
-                goto fault;
-            unmap_and_replace(&op, &common[i]);
+            {
+                rc = -EFAULT;
+                break;
+            }
+
+            unmap_and_replace(&op, &common[i], &flush_flags);
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
+        err = iommu_iotlb_flush_all(currd, flush_flags);
+        if ( !rc )
+            rc = err;
 
         for ( i = 0; i < partial_done; i++ )
             unmap_common_complete(&common[i]);
 
+        if ( rc )
+            break;
+
         count -= c;
         done += c;
 
@@ -1719,14 +1754,7 @@ gnttab_unmap_and_replace(
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


