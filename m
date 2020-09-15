Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 066FE26A0E4
	for <lists+xen-devel@lfdr.de>; Tue, 15 Sep 2020 10:30:01 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kI6LR-0005Yu-5g; Tue, 15 Sep 2020 08:29:45 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=2OlW=CY=xen.org=paul@srs-us1.protection.inumbo.net>)
 id 1kI6LQ-0005Yn-7G
 for xen-devel@lists.xenproject.org; Tue, 15 Sep 2020 08:29:44 +0000
X-Inumbo-ID: 1d3afe3d-c821-4ac7-bd43-b76b37e965c9
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 1d3afe3d-c821-4ac7-bd43-b76b37e965c9;
 Tue, 15 Sep 2020 08:29:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From;
 bh=22FRfQNCAkwAjlVmLY20OL+Ek6oQxsoYvI5RGmP29So=; b=znw9BdUtu119r1aSamjt6PZTO6
 jgr1YH5fkqCaFTPzuywuY9PrRpPRP2/zXSQp/f84cNW6SF32/Wy+JkHEK3gm4iU9MknJxk8wSVbXg
 mqcAcvJc0tZY4eDCreajpkKVp/M0ZqUbxdwZIoBPKm+3loPv+gXbW0Z5jvrdKlfP1i8g=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <paul@xen.org>)
 id 1kI6LO-0004ru-3k; Tue, 15 Sep 2020 08:29:42 +0000
Received: from host86-176-94-160.range86-176.btcentralplus.com
 ([86.176.94.160] helo=u2f063a87eabd5f.home)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <paul@xen.org>)
 id 1kI6LN-0007Pl-Rl; Tue, 15 Sep 2020 08:29:42 +0000
From: Paul Durrant <paul@xen.org>
To: xen-devel@lists.xenproject.org
Cc: Paul Durrant <pdurrant@amazon.com>,
	Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v9 3/8] iommu: flush I/O TLB if iommu_map() or iommu_unmap()
 fail
Date: Tue, 15 Sep 2020 09:29:31 +0100
Message-Id: <20200915082936.23663-4-paul@xen.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200915082936.23663-1-paul@xen.org>
References: <20200915082936.23663-1-paul@xen.org>
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
Reviewed-by: Jan Beulich <jbeulich@suse.com>
---

v6:
 - Remove stray blank

v5:
 - Avoid unnecessary flushing if 'page_order' is 0
 - Add missing indirection on 'flush_flags'

v2:
 - New in v2
---
 xen/drivers/passthrough/iommu.c | 34 +++++++++++++++++----------------
 1 file changed, 18 insertions(+), 16 deletions(-)

diff --git a/xen/drivers/passthrough/iommu.c b/xen/drivers/passthrough/iommu.c
index 660dc5deb2..eb65631d59 100644
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
+    if ( !this_cpu(iommu_dont_flush_iotlb) && !rc )
+        rc = iommu_iotlb_flush(d, dfn, (1u << page_order), flush_flags);
 
     return rc;
 }
-- 
2.20.1


