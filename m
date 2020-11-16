Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1381A2B43A4
	for <lists+xen-devel@lfdr.de>; Mon, 16 Nov 2020 13:26:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.27885.56510 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1keda9-0001p9-JI; Mon, 16 Nov 2020 12:26:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 27885.56510; Mon, 16 Nov 2020 12:26:05 +0000
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
	id 1keda9-0001oS-Eb; Mon, 16 Nov 2020 12:26:05 +0000
Received: by outflank-mailman (input) for mailman id 27885;
 Mon, 16 Nov 2020 12:26:04 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3+iU=EW=arm.com=rahul.singh@srs-us1.protection.inumbo.net>)
 id 1keda7-0001ni-UL
 for xen-devel@lists.xenproject.org; Mon, 16 Nov 2020 12:26:03 +0000
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 16d0ef04-b0e7-4ebb-bc97-b44bf1880adf;
 Mon, 16 Nov 2020 12:26:02 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 14DF0101E;
 Mon, 16 Nov 2020 04:26:02 -0800 (PST)
Received: from scm-wfh-server-rahsin01.stack04.eu02.mi.arm.com (unknown
 [10.58.246.76])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 668DC3F70D;
 Mon, 16 Nov 2020 04:26:01 -0800 (PST)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=3+iU=EW=arm.com=rahul.singh@srs-us1.protection.inumbo.net>)
	id 1keda7-0001ni-UL
	for xen-devel@lists.xenproject.org; Mon, 16 Nov 2020 12:26:03 +0000
X-Inumbo-ID: 16d0ef04-b0e7-4ebb-bc97-b44bf1880adf
Received: from foss.arm.com (unknown [217.140.110.172])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
	id 16d0ef04-b0e7-4ebb-bc97-b44bf1880adf;
	Mon, 16 Nov 2020 12:26:02 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 14DF0101E;
	Mon, 16 Nov 2020 04:26:02 -0800 (PST)
Received: from scm-wfh-server-rahsin01.stack04.eu02.mi.arm.com (unknown [10.58.246.76])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 668DC3F70D;
	Mon, 16 Nov 2020 04:26:01 -0800 (PST)
From: Rahul Singh <rahul.singh@arm.com>
To: xen-devel@lists.xenproject.org
Cc: bertrand.marquis@arm.com,
	Jan Beulich <jbeulich@suse.com>,
	Paul Durrant <paul@xen.org>
Subject: [PATCH v3 3/3] xen/pci: solve compilation error on ARM with HAS_PCI enabled.
Date: Mon, 16 Nov 2020 12:25:18 +0000
Message-Id: <efa0c2578a6aabb642b8f38257cf96a983944301.1605527997.git.rahul.singh@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1605527997.git.rahul.singh@arm.com>
References: <cover.1605527997.git.rahul.singh@arm.com>
In-Reply-To: <cover.1605527997.git.rahul.singh@arm.com>
References: <cover.1605527997.git.rahul.singh@arm.com>

If mem-sharing, mem-paging, or log-dirty functionality is not enabled
for non-x86 architecture when HAS_PCI is enabled, the compiler will
throw an error.

Move code to x86 specific directory to fix compilation error.

Also, modify the code to use likely() in place of unlikley() for each
condition to make code more optimized.

No functional change.

Signed-off-by: Rahul Singh <rahul.singh@arm.com>
---

Changes in v3:
- rename arch_iommu_usable() to arch_iommu_use_permitted()
- fixed comments.

---
 xen/drivers/passthrough/pci.c       |  8 +-------
 xen/drivers/passthrough/x86/iommu.c | 12 ++++++++++++
 xen/include/xen/iommu.h             |  2 ++
 3 files changed, 15 insertions(+), 7 deletions(-)

diff --git a/xen/drivers/passthrough/pci.c b/xen/drivers/passthrough/pci.c
index e8a28df126..804b24a0e0 100644
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
@@ -1411,12 +1410,7 @@ static int assign_device(struct domain *d, u16 seg, u8 bus, u8 devfn, u32 flag)
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
index 875e67b53b..26f57b7e88 100644
--- a/xen/drivers/passthrough/x86/iommu.c
+++ b/xen/drivers/passthrough/x86/iommu.c
@@ -23,6 +23,7 @@
 #include <asm/hvm/io.h>
 #include <asm/io_apic.h>
 #include <asm/setup.h>
+#include <xen/vm_event.h>
 
 const struct iommu_init_ops *__initdata iommu_init_ops;
 struct iommu_ops __read_mostly iommu_ops;
@@ -315,6 +316,17 @@ int iommu_update_ire_from_msi(
            ? iommu_call(&iommu_ops, update_ire_from_msi, msi_desc, msg) : 0;
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


