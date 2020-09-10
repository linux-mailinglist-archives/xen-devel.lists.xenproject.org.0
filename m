Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D7C1926484A
	for <lists+xen-devel@lfdr.de>; Thu, 10 Sep 2020 16:50:25 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kGNtz-0007Mb-VI; Thu, 10 Sep 2020 14:50:19 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=S6nR=CT=xen.org=paul@srs-us1.protection.inumbo.net>)
 id 1kGNty-0007KI-Pr
 for xen-devel@lists.xenproject.org; Thu, 10 Sep 2020 14:50:18 +0000
X-Inumbo-ID: c9ca3fb4-8149-4b7d-8e3d-fb59f5456b0f
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c9ca3fb4-8149-4b7d-8e3d-fb59f5456b0f;
 Thu, 10 Sep 2020 14:50:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From;
 bh=22FRfQNCAkwAjlVmLY20OL+Ek6oQxsoYvI5RGmP29So=; b=rCxYUq/zzp6fTfRKfCCYIP64/l
 9t1mJw4d8zvILMyYyMJMhqV6c56LVQSSB9tJ6C5WhqJfO3f7b0msx1NWSgt2G5Zxi2s76Bwq6Vi0J
 I7LZqj6JfJlWj2+7aNwoFUzBKbA65f0HoWu5JG/5cFLFf01N56UOb5D8pZFFGoiYlYu8=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <paul@xen.org>)
 id 1kGNtt-0006un-11; Thu, 10 Sep 2020 14:50:13 +0000
Received: from host86-176-94-160.range86-176.btcentralplus.com
 ([86.176.94.160] helo=u2f063a87eabd5f.home)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <paul@xen.org>)
 id 1kGNts-0004ZM-Of; Thu, 10 Sep 2020 14:50:12 +0000
From: Paul Durrant <paul@xen.org>
To: xen-devel@lists.xenproject.org
Cc: Paul Durrant <pdurrant@amazon.com>,
	Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v6 3/8] iommu: flush I/O TLB if iommu_map() or iommu_unmap()
 fail
Date: Thu, 10 Sep 2020 15:50:02 +0100
Message-Id: <20200910145007.14107-4-paul@xen.org>
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


