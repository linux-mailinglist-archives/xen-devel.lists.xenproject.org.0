Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7020E25F42B
	for <lists+xen-devel@lfdr.de>; Mon,  7 Sep 2020 09:40:46 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kFBlQ-0003Bb-T9; Mon, 07 Sep 2020 07:40:32 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=9LpL=CQ=xen.org=paul@srs-us1.protection.inumbo.net>)
 id 1kFBlP-0003B9-1d
 for xen-devel@lists.xenproject.org; Mon, 07 Sep 2020 07:40:31 +0000
X-Inumbo-ID: 5a4bef6d-d5f6-45b0-aa12-87804f4abd64
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 5a4bef6d-d5f6-45b0-aa12-87804f4abd64;
 Mon, 07 Sep 2020 07:40:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From;
 bh=bcXYSziQEVYnJt2FcTKxwvzJvDf1bktnUlerxuTET0c=; b=S48bY3xNU86MaV7pOhWN2st8z+
 fuJ7YTU2yckWUNYkWjZfO761J3Sdz5u+hEQ7ziwjj/JQ826PvtZjdhuF6zJMH44o13ZLpk8VnDboW
 0TqCyo8UuoieGPrVZYKxGg4cBbUtPhjBJBqHx8XRhyGgQwl7t0ZP7kQh+VEnyGBm2qBY=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <paul@xen.org>)
 id 1kFBlN-0000ry-4c; Mon, 07 Sep 2020 07:40:29 +0000
Received: from host86-176-94-160.range86-176.btcentralplus.com
 ([86.176.94.160] helo=u2f063a87eabd5f.home)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <paul@xen.org>)
 id 1kFBlM-0008Cf-SD; Mon, 07 Sep 2020 07:40:29 +0000
From: Paul Durrant <paul@xen.org>
To: xen-devel@lists.xenproject.org
Cc: Paul Durrant <pdurrant@amazon.com>,
	Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v5 3/8] iommu: flush I/O TLB if iommu_map() or iommu_unmap()
 fail
Date: Mon,  7 Sep 2020 08:40:18 +0100
Message-Id: <20200907074023.1392-4-paul@xen.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200907074023.1392-1-paul@xen.org>
References: <20200907074023.1392-1-paul@xen.org>
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

This patch adds a full I/O TLB flush to the error paths of iommu_map() and
iommu_unmap().

Without this change callers need constructs such as:

rc = iommu_map/unmap(...)
err = iommu_flush(...)
if ( !rc )
  rc = err;

With this change, it can be simplified to:

rc = iommu_map/unmap(...)
if ( !rc )
  rc = iommu_flush(...)

because, if the map or unmap fails the flush will be unnecessary. This saves
a stack variable and generally makes the call sites tidier.

Signed-off-by: Paul Durrant <pdurrant@amazon.com>
---
Cc: Jan Beulich <jbeulich@suse.com>

v5:
 - Avoid unnecessary flushing if 'page_order' is 0
 - Add missing indirection on 'flush_flags'

v2:
 - New in v2
---
 xen/drivers/passthrough/iommu.c | 34 +++++++++++++++++----------------
 1 file changed, 18 insertions(+), 16 deletions(-)

diff --git a/xen/drivers/passthrough/iommu.c b/xen/drivers/passthrough/iommu.c
index 660dc5deb2..f27facd52d 100644
--- a/xen/drivers/passthrough/iommu.c
+++ b/xen/drivers/passthrough/iommu.c
@@ -274,6 +274,13 @@ int iommu_map(struct domain *d, dfn_t dfn, mfn_t mfn,
         break;
     }
 
+    /*
+     * Something went wrong so, if we were dealing with more than a single
+     * page, flush everything and clear flush flags.
+     */
+    if ( page_order && unlikely(rc) && !iommu_iotlb_flush_all(d, *flush_flags) )
+        *flush_flags = 0;
+
     return rc;
 }
 
@@ -283,14 +290,8 @@ int iommu_legacy_map(struct domain *d, dfn_t dfn, mfn_t mfn,
     unsigned int flush_flags = 0;
     int rc = iommu_map(d, dfn, mfn, page_order, flags, &flush_flags);
 
-    if ( !this_cpu(iommu_dont_flush_iotlb) )
-    {
-        int err = iommu_iotlb_flush(d, dfn, (1u << page_order),
-                                    flush_flags);
-
-        if ( !rc )
-            rc = err;
-    }
+    if ( !this_cpu(iommu_dont_flush_iotlb) && !rc )
+        rc = iommu_iotlb_flush(d, dfn, (1u << page_order), flush_flags);
 
     return rc;
 }
@@ -330,6 +331,13 @@ int iommu_unmap(struct domain *d, dfn_t dfn, unsigned int page_order,
         }
     }
 
+    /*
+     * Something went wrong so, if we were dealing with more than a single
+     * page, flush everything and clear flush flags.
+     */
+    if ( page_order && unlikely(rc) && !iommu_iotlb_flush_all(d, *flush_flags) )
+        *flush_flags = 0;
+
     return rc;
 }
 
@@ -338,14 +346,8 @@ int iommu_legacy_unmap(struct domain *d, dfn_t dfn, unsigned int page_order)
     unsigned int flush_flags = 0;
     int rc = iommu_unmap(d, dfn, page_order, &flush_flags);
 
-    if ( !this_cpu(iommu_dont_flush_iotlb) )
-    {
-        int err = iommu_iotlb_flush(d, dfn, (1u << page_order),
-                                    flush_flags);
-
-        if ( !rc )
-            rc = err;
-    }
+    if ( !this_cpu(iommu_dont_flush_iotlb) && ! rc )
+        rc = iommu_iotlb_flush(d, dfn, (1u << page_order), flush_flags);
 
     return rc;
 }
-- 
2.20.1


