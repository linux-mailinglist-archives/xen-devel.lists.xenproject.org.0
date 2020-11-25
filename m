Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CC2A2C4762
	for <lists+xen-devel@lfdr.de>; Wed, 25 Nov 2020 19:17:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.37952.70568 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1khzLb-0001Uc-Bf; Wed, 25 Nov 2020 18:16:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 37952.70568; Wed, 25 Nov 2020 18:16:55 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1khzLb-0001U0-7o; Wed, 25 Nov 2020 18:16:55 +0000
Received: by outflank-mailman (input) for mailman id 37952;
 Wed, 25 Nov 2020 18:16:53 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MqAN=E7=arm.com=rahul.singh@srs-us1.protection.inumbo.net>)
 id 1khzLZ-0001Oz-9c
 for xen-devel@lists.xenproject.org; Wed, 25 Nov 2020 18:16:53 +0000
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id 617e2fad-6fc2-48fd-8ed6-856b402076a1;
 Wed, 25 Nov 2020 18:16:47 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 91E7E11D4;
 Wed, 25 Nov 2020 10:16:47 -0800 (PST)
Received: from scm-wfh-server-rahsin01.stack04.eu02.mi.arm.com (unknown
 [10.58.246.76])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C93D93F23F;
 Wed, 25 Nov 2020 10:16:46 -0800 (PST)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=MqAN=E7=arm.com=rahul.singh@srs-us1.protection.inumbo.net>)
	id 1khzLZ-0001Oz-9c
	for xen-devel@lists.xenproject.org; Wed, 25 Nov 2020 18:16:53 +0000
X-Inumbo-ID: 617e2fad-6fc2-48fd-8ed6-856b402076a1
Received: from foss.arm.com (unknown [217.140.110.172])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTP
	id 617e2fad-6fc2-48fd-8ed6-856b402076a1;
	Wed, 25 Nov 2020 18:16:47 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 91E7E11D4;
	Wed, 25 Nov 2020 10:16:47 -0800 (PST)
Received: from scm-wfh-server-rahsin01.stack04.eu02.mi.arm.com (unknown [10.58.246.76])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C93D93F23F;
	Wed, 25 Nov 2020 10:16:46 -0800 (PST)
From: Rahul Singh <rahul.singh@arm.com>
To: xen-devel@lists.xenproject.org
Cc: bertrand.marquis@arm.com,
	rahul.singh@arm.com,
	Jan Beulich <jbeulich@suse.com>,
	Paul Durrant <paul@xen.org>
Subject: [PATCH v4 2/3] xen/pci: solve compilation error on ARM with HAS_PCI enabled.
Date: Wed, 25 Nov 2020 18:16:03 +0000
Message-Id: <2ce402cfae6d90433626bcdc6314e5ee5dda103f.1606326929.git.rahul.singh@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1606326929.git.rahul.singh@arm.com>
References: <cover.1606326929.git.rahul.singh@arm.com>
In-Reply-To: <cover.1606326929.git.rahul.singh@arm.com>
References: <cover.1606326929.git.rahul.singh@arm.com>

If mem-sharing, mem-paging, or log-dirty functionality is not enabled
for architecture when HAS_PCI is enabled, the compiler will throw an
error.

Move code to x86 specific file to fix compilation error.

Also, modify the code to use likely() in place of unlikley() for each
condition to make code more optimized.

No functional change intended.

Signed-off-by: Rahul Singh <rahul.singh@arm.com>
---

Changes in v4:
- fixed minor comments

---
 xen/drivers/passthrough/pci.c       |  8 +-------
 xen/drivers/passthrough/x86/iommu.c | 13 +++++++++++++
 xen/include/xen/iommu.h             |  2 ++
 3 files changed, 16 insertions(+), 7 deletions(-)

diff --git a/xen/drivers/passthrough/pci.c b/xen/drivers/passthrough/pci.c
index 3c6ab1bcb6..4c21655b7d 100644
--- a/xen/drivers/passthrough/pci.c
+++ b/xen/drivers/passthrough/pci.c
@@ -20,7 +20,6 @@
 #include <xen/iommu.h>
 #include <xen/irq.h>
 #include <xen/param.h>
-#include <xen/vm_event.h>
 #include <xen/delay.h>
 #include <xen/keyhandler.h>
 #include <xen/event.h>
@@ -1418,12 +1417,7 @@ static int assign_device(struct domain *d, u16 seg, u8 bus, u8 devfn, u32 flag)
     if ( !is_iommu_enabled(d) )
         return 0;
 
-    /* Prevent device assign if mem paging or mem sharing have been 
-     * enabled for this domain */
-    if ( d != dom_io &&
-         unlikely(mem_sharing_enabled(d) ||
-                  vm_event_check_ring(d->vm_event_paging) ||
-                  p2m_get_hostp2m(d)->global_logdirty) )
+    if( !arch_iommu_use_permitted(d) )
         return -EXDEV;
 
     /* device_assigned() should already have cleared the device for assignment */
diff --git a/xen/drivers/passthrough/x86/iommu.c b/xen/drivers/passthrough/x86/iommu.c
index f17b1820f4..cea1032b3d 100644
--- a/xen/drivers/passthrough/x86/iommu.c
+++ b/xen/drivers/passthrough/x86/iommu.c
@@ -18,6 +18,7 @@
 #include <xen/guest_access.h>
 #include <xen/event.h>
 #include <xen/softirq.h>
+#include <xen/vm_event.h>
 #include <xsm/xsm.h>
 
 #include <asm/hvm/io.h>
@@ -308,6 +309,18 @@ struct page_info *iommu_alloc_pgtable(struct domain *d)
     return pg;
 }
 
+bool arch_iommu_use_permitted(const struct domain *d)
+{
+    /*
+     * Prevent device assign if mem paging, mem sharing or log-dirty
+     * have been enabled for this domain.
+     */
+    return d == dom_io ||
+           (likely(!mem_sharing_enabled(d)) &&
+            likely(!vm_event_check_ring(d->vm_event_paging)) &&
+            likely(!p2m_get_hostp2m(d)->global_logdirty));
+}
+
 /*
  * Local variables:
  * mode: C
diff --git a/xen/include/xen/iommu.h b/xen/include/xen/iommu.h
index 191021870f..056eaa09fc 100644
--- a/xen/include/xen/iommu.h
+++ b/xen/include/xen/iommu.h
@@ -381,6 +381,8 @@ DECLARE_PER_CPU(bool_t, iommu_dont_flush_iotlb);
 extern struct spinlock iommu_pt_cleanup_lock;
 extern struct page_list_head iommu_pt_cleanup_list;
 
+bool arch_iommu_use_permitted(const struct domain *d);
+
 #endif /* _IOMMU_H_ */
 
 /*
-- 
2.17.1


