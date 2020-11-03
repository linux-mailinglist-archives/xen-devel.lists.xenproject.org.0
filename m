Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D93042A4A8D
	for <lists+xen-devel@lfdr.de>; Tue,  3 Nov 2020 17:00:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.18397.43455 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kZyjR-0008VB-Aa; Tue, 03 Nov 2020 16:00:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 18397.43455; Tue, 03 Nov 2020 16:00:25 +0000
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
	id 1kZyjR-0008UR-5u; Tue, 03 Nov 2020 16:00:25 +0000
Received: by outflank-mailman (input) for mailman id 18397;
 Tue, 03 Nov 2020 16:00:23 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RC30=EJ=arm.com=rahul.singh@srs-us1.protection.inumbo.net>)
 id 1kZyjP-0008I1-RI
 for xen-devel@lists.xenproject.org; Tue, 03 Nov 2020 16:00:23 +0000
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 1dae1f68-0d34-4a5d-86ae-4e8e5e1977e4;
 Tue, 03 Nov 2020 16:00:19 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 97EC413A1;
 Tue,  3 Nov 2020 08:00:19 -0800 (PST)
Received: from scm-wfh-server-rahsin01.stack04.eu02.mi.arm.com (unknown
 [10.58.246.76])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E8F123F66E;
 Tue,  3 Nov 2020 08:00:18 -0800 (PST)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=RC30=EJ=arm.com=rahul.singh@srs-us1.protection.inumbo.net>)
	id 1kZyjP-0008I1-RI
	for xen-devel@lists.xenproject.org; Tue, 03 Nov 2020 16:00:23 +0000
X-Inumbo-ID: 1dae1f68-0d34-4a5d-86ae-4e8e5e1977e4
Received: from foss.arm.com (unknown [217.140.110.172])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
	id 1dae1f68-0d34-4a5d-86ae-4e8e5e1977e4;
	Tue, 03 Nov 2020 16:00:19 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 97EC413A1;
	Tue,  3 Nov 2020 08:00:19 -0800 (PST)
Received: from scm-wfh-server-rahsin01.stack04.eu02.mi.arm.com (unknown [10.58.246.76])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E8F123F66E;
	Tue,  3 Nov 2020 08:00:18 -0800 (PST)
From: Rahul Singh <rahul.singh@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Bertrand.Marquis@arm.com,
	Jan Beulich <jbeulich@suse.com>,
	Paul Durrant <paul@xen.org>
Subject: [PATCH v2 4/4] xen/pci: solve compilation error on ARM with HAS_PCI enabled.
Date: Tue,  3 Nov 2020 15:59:15 +0000
Message-Id: <7b60501fa689a4f2795ea6c34a7475d288f154a9.1604417224.git.rahul.singh@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1604417224.git.rahul.singh@arm.com>
References: <cover.1604417224.git.rahul.singh@arm.com>
In-Reply-To: <cover.1604417224.git.rahul.singh@arm.com>
References: <cover.1604417224.git.rahul.singh@arm.com>

If mem-sharing, mem-paging and log-dirty functionality is not enabled
for architecture when HAS_PCI is enabled, compiler will throw an error.

Move code to x86 specific directory to fix compilation error.

No functional change.

Signed-off-by: Rahul Singh <rahul.singh@arm.com>
---

Changes in v2:
 - Move mem-sharing , men-paging and log-dirty specific code to x86 directory. 

---
 xen/drivers/passthrough/pci.c       |  8 +-------
 xen/drivers/passthrough/x86/iommu.c | 13 +++++++++++++
 xen/include/xen/iommu.h             |  2 ++
 3 files changed, 16 insertions(+), 7 deletions(-)

diff --git a/xen/drivers/passthrough/pci.c b/xen/drivers/passthrough/pci.c
index 04d3e2c0f9..433989e654 100644
--- a/xen/drivers/passthrough/pci.c
+++ b/xen/drivers/passthrough/pci.c
@@ -22,7 +22,6 @@
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
+    if( !arch_iommu_usable(d) )
         return -EXDEV;
 
     /* device_assigned() should already have cleared the device for assignment */
diff --git a/xen/drivers/passthrough/x86/iommu.c b/xen/drivers/passthrough/x86/iommu.c
index 875e67b53b..b3d151a14c 100644
--- a/xen/drivers/passthrough/x86/iommu.c
+++ b/xen/drivers/passthrough/x86/iommu.c
@@ -23,6 +23,7 @@
 #include <asm/hvm/io.h>
 #include <asm/io_apic.h>
 #include <asm/setup.h>
+#include <xen/vm_event.h>
 
 const struct iommu_init_ops *__initdata iommu_init_ops;
 struct iommu_ops __read_mostly iommu_ops;
@@ -315,6 +316,18 @@ int iommu_update_ire_from_msi(
            ? iommu_call(&iommu_ops, update_ire_from_msi, msi_desc, msg) : 0;
 }
 
+bool_t arch_iommu_usable(struct domain *d)
+{
+
+    /* Prevent device assign if mem paging or mem sharing have been
+     * enabled for this domain */
+    if ( d != dom_io && unlikely(mem_sharing_enabled(d) ||
+                        vm_event_check_ring(d->vm_event_paging) ||
+                        p2m_get_hostp2m(d)->global_logdirty) )
+        return false;
+    else
+        return true;
+}
 /*
  * Local variables:
  * mode: C
diff --git a/xen/include/xen/iommu.h b/xen/include/xen/iommu.h
index 191021870f..493528cee3 100644
--- a/xen/include/xen/iommu.h
+++ b/xen/include/xen/iommu.h
@@ -381,6 +381,8 @@ DECLARE_PER_CPU(bool_t, iommu_dont_flush_iotlb);
 extern struct spinlock iommu_pt_cleanup_lock;
 extern struct page_list_head iommu_pt_cleanup_list;
 
+bool_t arch_iommu_usable(struct domain *d);
+
 #endif /* _IOMMU_H_ */
 
 /*
-- 
2.17.1


