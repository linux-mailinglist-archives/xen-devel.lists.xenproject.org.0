Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2547D23A4BE
	for <lists+xen-devel@lfdr.de>; Mon,  3 Aug 2020 14:30:02 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k2Zb0-0007Rq-67; Mon, 03 Aug 2020 12:29:38 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=rQjY=BN=xen.org=paul@srs-us1.protection.inumbo.net>)
 id 1k2Zay-0007NQ-WD
 for xen-devel@lists.xenproject.org; Mon, 03 Aug 2020 12:29:37 +0000
X-Inumbo-ID: f64d0c28-d584-11ea-908e-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f64d0c28-d584-11ea-908e-bc764e2007e4;
 Mon, 03 Aug 2020 12:29:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=tvDh3hWaZXavS9k/pMM3gTVqpPl5TsT49cdKXt8Ayaw=; b=HvotJXgou3QFoAnBLa3W3QilbN
 Tkb+aZJvYDftm5g9OqfYQQwqupLc+wcIYHwMqN+95qRsVRDssUjqS5X0zjiV6Ngl7T0jDX3JF/mhb
 s21IVvF5pcx/wlz4jLcJ/+anUQvzMk5lgtqWjG5rNqnQHHxLAZk8mC66wDKPBltG9j14=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <paul@xen.org>)
 id 1k2Zal-0000Sj-3y; Mon, 03 Aug 2020 12:29:23 +0000
Received: from host86-143-223-30.range86-143.btcentralplus.com
 ([86.143.223.30] helo=u2f063a87eabd5f.home)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <paul@xen.org>)
 id 1k2Zak-0000zk-SX; Mon, 03 Aug 2020 12:29:23 +0000
From: Paul Durrant <paul@xen.org>
To: xen-devel@lists.xenproject.org
Subject: [PATCH v3 06/11] iommu: flush I/O TLB if iommu_map() or iommu_unmap()
 fail
Date: Mon,  3 Aug 2020 13:29:09 +0100
Message-Id: <20200803122914.2259-7-paul@xen.org>
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
Cc: Paul Durrant <pdurrant@amazon.com>, Jan Beulich <jbeulich@suse.com>
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

v2:
 - New in v2
---
 xen/drivers/passthrough/iommu.c | 28 ++++++++++++----------------
 1 file changed, 12 insertions(+), 16 deletions(-)

diff --git a/xen/drivers/passthrough/iommu.c b/xen/drivers/passthrough/iommu.c
index 660dc5deb2..e2c0193a09 100644
--- a/xen/drivers/passthrough/iommu.c
+++ b/xen/drivers/passthrough/iommu.c
@@ -274,6 +274,10 @@ int iommu_map(struct domain *d, dfn_t dfn, mfn_t mfn,
         break;
     }
 
+    /* Something went wrong so flush everything and clear flush flags */
+    if ( unlikely(rc) && iommu_iotlb_flush_all(d, *flush_flags) )
+        flush_flags = 0;
+
     return rc;
 }
 
@@ -283,14 +287,8 @@ int iommu_legacy_map(struct domain *d, dfn_t dfn, mfn_t mfn,
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
@@ -330,6 +328,10 @@ int iommu_unmap(struct domain *d, dfn_t dfn, unsigned int page_order,
         }
     }
 
+    /* Something went wrong so flush everything and clear flush flags */
+    if ( unlikely(rc) && iommu_iotlb_flush_all(d, *flush_flags) )
+        flush_flags = 0;
+
     return rc;
 }
 
@@ -338,14 +340,8 @@ int iommu_legacy_unmap(struct domain *d, dfn_t dfn, unsigned int page_order)
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


