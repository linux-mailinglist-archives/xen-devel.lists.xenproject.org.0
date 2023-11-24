Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 781E57F75E7
	for <lists+xen-devel@lfdr.de>; Fri, 24 Nov 2023 15:05:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.640738.999437 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r6WnZ-00078S-Ox; Fri, 24 Nov 2023 14:04:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 640738.999437; Fri, 24 Nov 2023 14:04:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r6WnZ-0006zl-Gx; Fri, 24 Nov 2023 14:04:49 +0000
Received: by outflank-mailman (input) for mailman id 640738;
 Fri, 24 Nov 2023 14:04:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wuqv=HF=bugseng.com=federico.serafini@srs-se1.protection.inumbo.net>)
 id 1r6WnX-0005N1-S4
 for xen-devel@lists.xenproject.org; Fri, 24 Nov 2023 14:04:47 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6c72c5f2-8ad2-11ee-9b0e-b553b5be7939;
 Fri, 24 Nov 2023 15:04:46 +0100 (CET)
Received: from Dell.bugseng.com (unknown [37.161.237.167])
 by support.bugseng.com (Postfix) with ESMTPSA id 87C9C4EE0C92;
 Fri, 24 Nov 2023 15:04:45 +0100 (CET)
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
X-Inumbo-ID: 6c72c5f2-8ad2-11ee-9b0e-b553b5be7939
From: Federico Serafini <federico.serafini@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com,
	Federico Serafini <federico.serafini@bugseng.com>,
	Jan Beulich <jbeulich@suse.com>,
	Paul Durrant <paul@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [XEN PATCH 07/11] xen/iommu: address violations of MISRA C:2012 Rule 8.2
Date: Fri, 24 Nov 2023 15:03:22 +0100
Message-Id: <85581b19ffe10276639683aff56d04f3f74abd6f.1700832962.git.federico.serafini@bugseng.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1700832962.git.federico.serafini@bugseng.com>
References: <cover.1700832962.git.federico.serafini@bugseng.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add missing parameter names to address violations of MISRA C:2012
Rule 8.2 and remove uses of u{8,16,32} in favor of C standard types.
No functional change.

Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
---
 xen/include/xen/iommu.h | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/xen/include/xen/iommu.h b/xen/include/xen/iommu.h
index d5c2577091..69d572543c 100644
--- a/xen/include/xen/iommu.h
+++ b/xen/include/xen/iommu.h
@@ -262,14 +262,15 @@ struct iommu_ops {
     int (*init)(struct domain *d);
     void (*hwdom_init)(struct domain *d);
     int (*quarantine_init)(device_t *dev, bool scratch_page);
-    int (*add_device)(u8 devfn, device_t *dev);
+    int (*add_device)(uint8_t devfn, device_t *dev);
     int (*enable_device)(device_t *dev);
-    int (*remove_device)(u8 devfn, device_t *dev);
-    int (*assign_device)(struct domain *, u8 devfn, device_t *dev, u32 flag);
+    int (*remove_device)(uint8_t devfn, device_t *dev);
+    int (*assign_device)(struct domain *d, uint8_t devfn, device_t *dev,
+                         uint32_t flag);
     int (*reassign_device)(struct domain *s, struct domain *t,
-                           u8 devfn, device_t *dev);
+                           uint8_t devfn, device_t *dev);
 #ifdef CONFIG_HAS_PCI
-    int (*get_device_group_id)(u16 seg, u8 bus, u8 devfn);
+    int (*get_device_group_id)(uint16_t seg, uint8_t bus, uint8_t devfn);
 #endif /* HAS_PCI */
 
     void (*teardown)(struct domain *d);
@@ -308,7 +309,7 @@ struct iommu_ops {
     int __must_check (*iotlb_flush)(struct domain *d, dfn_t dfn,
                                     unsigned long page_count,
                                     unsigned int flush_flags);
-    int (*get_reserved_device_memory)(iommu_grdm_t *, void *);
+    int (*get_reserved_device_memory)(iommu_grdm_t *func, void *ctxt);
     void (*dump_page_tables)(struct domain *d);
 
 #ifdef CONFIG_HAS_DEVICE_TREE
-- 
2.34.1


