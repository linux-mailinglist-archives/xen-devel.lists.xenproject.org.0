Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BF88E233465
	for <lists+xen-devel@lfdr.de>; Thu, 30 Jul 2020 16:29:58 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k19Z3-0005Tz-V2; Thu, 30 Jul 2020 14:29:45 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=B5Vg=BJ=xen.org=paul@srs-us1.protection.inumbo.net>)
 id 1k19Z2-0005Q0-Fc
 for xen-devel@lists.xenproject.org; Thu, 30 Jul 2020 14:29:44 +0000
X-Inumbo-ID: 179a6d60-d271-11ea-aad0-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 179a6d60-d271-11ea-aad0-12813bfff9fa;
 Thu, 30 Jul 2020 14:29:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=tvDh3hWaZXavS9k/pMM3gTVqpPl5TsT49cdKXt8Ayaw=; b=TPxxcTmDcrEWA8lS2KVk27EsIQ
 PHUWpSkLsK3Iw5/NIZ/B9fTn2lUE3sTUyBWUhH8TKR9vXdLRDLRKe3raFs5Uv9XECTKVx2JDZnm+0
 r16dFmrE5oJbNWGnGNYipezq4uYuE3K6ylz0/k10m87AtovMl0KFFMZD++1oesVX14Vo=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <paul@xen.org>)
 id 1k19Yt-0002Oe-H8; Thu, 30 Jul 2020 14:29:35 +0000
Received: from host86-143-223-30.range86-143.btcentralplus.com
 ([86.143.223.30] helo=u2f063a87eabd5f.home)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <paul@xen.org>)
 id 1k19Yt-0005aN-AO; Thu, 30 Jul 2020 14:29:35 +0000
From: Paul Durrant <paul@xen.org>
To: xen-devel@lists.xenproject.org
Subject: [PATCH v2 06/10] iommu: flush I/O TLB if iommu_map() or iommu_unmap()
 fail
Date: Thu, 30 Jul 2020 15:29:22 +0100
Message-Id: <20200730142926.6051-7-paul@xen.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200730142926.6051-1-paul@xen.org>
References: <20200730142926.6051-1-paul@xen.org>
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


