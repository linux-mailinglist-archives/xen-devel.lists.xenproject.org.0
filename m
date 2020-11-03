Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B8DA2A4A8C
	for <lists+xen-devel@lfdr.de>; Tue,  3 Nov 2020 17:00:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.18396.43444 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kZyjM-0008Qu-Re; Tue, 03 Nov 2020 16:00:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 18396.43444; Tue, 03 Nov 2020 16:00:20 +0000
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
	id 1kZyjM-0008Q3-L2; Tue, 03 Nov 2020 16:00:20 +0000
Received: by outflank-mailman (input) for mailman id 18396;
 Tue, 03 Nov 2020 16:00:18 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RC30=EJ=arm.com=rahul.singh@srs-us1.protection.inumbo.net>)
 id 1kZyjK-0008I1-Tc
 for xen-devel@lists.xenproject.org; Tue, 03 Nov 2020 16:00:18 +0000
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 8a62af32-53e9-42dd-8610-ff795a755265;
 Tue, 03 Nov 2020 16:00:17 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D5D2F139F;
 Tue,  3 Nov 2020 08:00:16 -0800 (PST)
Received: from scm-wfh-server-rahsin01.stack04.eu02.mi.arm.com (unknown
 [10.58.246.76])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 644413F66E;
 Tue,  3 Nov 2020 08:00:15 -0800 (PST)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=RC30=EJ=arm.com=rahul.singh@srs-us1.protection.inumbo.net>)
	id 1kZyjK-0008I1-Tc
	for xen-devel@lists.xenproject.org; Tue, 03 Nov 2020 16:00:18 +0000
X-Inumbo-ID: 8a62af32-53e9-42dd-8610-ff795a755265
Received: from foss.arm.com (unknown [217.140.110.172])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
	id 8a62af32-53e9-42dd-8610-ff795a755265;
	Tue, 03 Nov 2020 16:00:17 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D5D2F139F;
	Tue,  3 Nov 2020 08:00:16 -0800 (PST)
Received: from scm-wfh-server-rahsin01.stack04.eu02.mi.arm.com (unknown [10.58.246.76])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 644413F66E;
	Tue,  3 Nov 2020 08:00:15 -0800 (PST)
From: Rahul Singh <rahul.singh@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Bertrand.Marquis@arm.com,
	Jan Beulich <jbeulich@suse.com>,
	Paul Durrant <paul@xen.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Ian Jackson <iwj@xenproject.org>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v2 3/4] xen/pci: Move x86 specific code to x86 directory.
Date: Tue,  3 Nov 2020 15:59:14 +0000
Message-Id: <687101e7e0e6feb64dd8ea63c8cf1aacf1684049.1604417224.git.rahul.singh@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1604417224.git.rahul.singh@arm.com>
References: <cover.1604417224.git.rahul.singh@arm.com>
In-Reply-To: <cover.1604417224.git.rahul.singh@arm.com>
References: <cover.1604417224.git.rahul.singh@arm.com>

passthrough/pci.c file is common for all architecture, but there is x86
sepcific code in this file.

Move x86 specific code to the x86 directory to avoid compilation error
for other architecture.

No functional change.

Signed-off-by: Rahul Singh <rahul.singh@arm.com>
---

Changes is v2:
 - fixed comments.
 - rename pci_clean_dpci_irqs() to arch_pci_clean_pirqs().

---
 xen/drivers/passthrough/pci.c        | 76 +----------------------
 xen/drivers/passthrough/x86/Makefile |  1 +
 xen/drivers/passthrough/x86/iommu.c  |  7 +++
 xen/drivers/passthrough/x86/pci.c    | 91 ++++++++++++++++++++++++++++
 xen/include/xen/pci.h                |  2 +
 5 files changed, 102 insertions(+), 75 deletions(-)
 create mode 100644 xen/drivers/passthrough/x86/pci.c

diff --git a/xen/drivers/passthrough/pci.c b/xen/drivers/passthrough/pci.c
index 2a3bce1462..04d3e2c0f9 100644
--- a/xen/drivers/passthrough/pci.c
+++ b/xen/drivers/passthrough/pci.c
@@ -14,7 +14,6 @@
  * this program; If not, see <http://www.gnu.org/licenses/>.
  */
 
-#include <xen/sched.h>
 #include <xen/pci.h>
 #include <xen/pci_regs.h>
 #include <xen/pci_ids.h>
@@ -24,7 +23,6 @@
 #include <xen/irq.h>
 #include <xen/param.h>
 #include <xen/vm_event.h>
-#include <asm/hvm/irq.h>
 #include <xen/delay.h>
 #include <xen/keyhandler.h>
 #include <xen/event.h>
@@ -847,71 +845,6 @@ int pci_remove_device(u16 seg, u8 bus, u8 devfn)
     return ret;
 }
 
-static int pci_clean_dpci_irq(struct domain *d,
-                              struct hvm_pirq_dpci *pirq_dpci, void *arg)
-{
-    struct dev_intx_gsi_link *digl, *tmp;
-
-    pirq_guest_unbind(d, dpci_pirq(pirq_dpci));
-
-    if ( pt_irq_need_timer(pirq_dpci->flags) )
-        kill_timer(&pirq_dpci->timer);
-
-    list_for_each_entry_safe ( digl, tmp, &pirq_dpci->digl_list, list )
-    {
-        list_del(&digl->list);
-        xfree(digl);
-    }
-
-    radix_tree_delete(&d->pirq_tree, dpci_pirq(pirq_dpci)->pirq);
-
-    if ( !pt_pirq_softirq_active(pirq_dpci) )
-        return 0;
-
-    domain_get_irq_dpci(d)->pending_pirq_dpci = pirq_dpci;
-
-    return -ERESTART;
-}
-
-static int pci_clean_dpci_irqs(struct domain *d)
-{
-    struct hvm_irq_dpci *hvm_irq_dpci = NULL;
-
-    if ( !is_iommu_enabled(d) )
-        return 0;
-
-    if ( !is_hvm_domain(d) )
-        return 0;
-
-    spin_lock(&d->event_lock);
-    hvm_irq_dpci = domain_get_irq_dpci(d);
-    if ( hvm_irq_dpci != NULL )
-    {
-        int ret = 0;
-
-        if ( hvm_irq_dpci->pending_pirq_dpci )
-        {
-            if ( pt_pirq_softirq_active(hvm_irq_dpci->pending_pirq_dpci) )
-                 ret = -ERESTART;
-            else
-                 hvm_irq_dpci->pending_pirq_dpci = NULL;
-        }
-
-        if ( !ret )
-            ret = pt_pirq_iterate(d, pci_clean_dpci_irq, NULL);
-        if ( ret )
-        {
-            spin_unlock(&d->event_lock);
-            return ret;
-        }
-
-        hvm_domain_irq(d)->dpci = NULL;
-        free_hvm_irq_dpci(hvm_irq_dpci);
-    }
-    spin_unlock(&d->event_lock);
-    return 0;
-}
-
 /* Caller should hold the pcidevs_lock */
 static int deassign_device(struct domain *d, uint16_t seg, uint8_t bus,
                            uint8_t devfn)
@@ -971,7 +904,7 @@ int pci_release_devices(struct domain *d)
     int ret;
 
     pcidevs_lock();
-    ret = pci_clean_dpci_irqs(d);
+    ret = arch_pci_clean_pirqs(d);
     if ( ret )
     {
         pcidevs_unlock();
@@ -1375,13 +1308,6 @@ static int __init setup_dump_pcidevs(void)
 }
 __initcall(setup_dump_pcidevs);
 
-int iommu_update_ire_from_msi(
-    struct msi_desc *msi_desc, struct msi_msg *msg)
-{
-    return iommu_intremap
-           ? iommu_call(&iommu_ops, update_ire_from_msi, msi_desc, msg) : 0;
-}
-
 static int iommu_add_device(struct pci_dev *pdev)
 {
     const struct domain_iommu *hd;
diff --git a/xen/drivers/passthrough/x86/Makefile b/xen/drivers/passthrough/x86/Makefile
index aa515c680d..d02ff75de5 100644
--- a/xen/drivers/passthrough/x86/Makefile
+++ b/xen/drivers/passthrough/x86/Makefile
@@ -1,2 +1,3 @@
 obj-$(CONFIG_PCI_ATS) += ats.o
 obj-y += iommu.o
+obj-y += pci.o
diff --git a/xen/drivers/passthrough/x86/iommu.c b/xen/drivers/passthrough/x86/iommu.c
index f17b1820f4..875e67b53b 100644
--- a/xen/drivers/passthrough/x86/iommu.c
+++ b/xen/drivers/passthrough/x86/iommu.c
@@ -308,6 +308,13 @@ struct page_info *iommu_alloc_pgtable(struct domain *d)
     return pg;
 }
 
+int iommu_update_ire_from_msi(
+    struct msi_desc *msi_desc, struct msi_msg *msg)
+{
+    return iommu_intremap
+           ? iommu_call(&iommu_ops, update_ire_from_msi, msi_desc, msg) : 0;
+}
+
 /*
  * Local variables:
  * mode: C
diff --git a/xen/drivers/passthrough/x86/pci.c b/xen/drivers/passthrough/x86/pci.c
new file mode 100644
index 0000000000..59588aa8d4
--- /dev/null
+++ b/xen/drivers/passthrough/x86/pci.c
@@ -0,0 +1,91 @@
+/*
+ * This program is free software; you can redistribute it and/or modify it
+ * under the terms and conditions of the GNU General Public License,
+ * version 2, as published by the Free Software Foundation.
+ *
+ * This program is distributed in the hope it will be useful, but WITHOUT
+ * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
+ * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
+ * more details.
+ *
+ * You should have received a copy of the GNU General Public License along with
+ * this program; If not, see <http://www.gnu.org/licenses/>.
+ */
+
+#include <xen/sched.h>
+#include <xen/pci.h>
+
+static int pci_clean_dpci_irq(struct domain *d,
+                              struct hvm_pirq_dpci *pirq_dpci, void *arg)
+{
+    struct dev_intx_gsi_link *digl, *tmp;
+
+    pirq_guest_unbind(d, dpci_pirq(pirq_dpci));
+
+    if ( pt_irq_need_timer(pirq_dpci->flags) )
+        kill_timer(&pirq_dpci->timer);
+
+    list_for_each_entry_safe ( digl, tmp, &pirq_dpci->digl_list, list )
+    {
+        list_del(&digl->list);
+        xfree(digl);
+    }
+
+    radix_tree_delete(&d->pirq_tree, dpci_pirq(pirq_dpci)->pirq);
+
+    if ( !pt_pirq_softirq_active(pirq_dpci) )
+        return 0;
+
+    domain_get_irq_dpci(d)->pending_pirq_dpci = pirq_dpci;
+
+    return -ERESTART;
+}
+
+int arch_pci_clean_pirqs(struct domain *d)
+{
+    struct hvm_irq_dpci *hvm_irq_dpci = NULL;
+
+    if ( !is_iommu_enabled(d) )
+        return 0;
+
+    if ( !is_hvm_domain(d) )
+        return 0;
+
+    spin_lock(&d->event_lock);
+    hvm_irq_dpci = domain_get_irq_dpci(d);
+    if ( hvm_irq_dpci != NULL )
+    {
+        int ret = 0;
+
+        if ( hvm_irq_dpci->pending_pirq_dpci )
+        {
+            if ( pt_pirq_softirq_active(hvm_irq_dpci->pending_pirq_dpci) )
+                 ret = -ERESTART;
+            else
+                 hvm_irq_dpci->pending_pirq_dpci = NULL;
+        }
+
+        if ( !ret )
+            ret = pt_pirq_iterate(d, pci_clean_dpci_irq, NULL);
+        if ( ret )
+        {
+            spin_unlock(&d->event_lock);
+            return ret;
+        }
+
+        hvm_domain_irq(d)->dpci = NULL;
+        free_hvm_irq_dpci(hvm_irq_dpci);
+    }
+    spin_unlock(&d->event_lock);
+
+    return 0;
+}
+
+/*
+ * Local variables:
+ * mode: C
+ * c-file-style: "BSD"
+ * c-basic-offset: 4
+ * indent-tabs-mode: nil
+ * End:
+ */
diff --git a/xen/include/xen/pci.h b/xen/include/xen/pci.h
index c4d3879761..fd28d11f6e 100644
--- a/xen/include/xen/pci.h
+++ b/xen/include/xen/pci.h
@@ -209,4 +209,6 @@ int msixtbl_pt_register(struct domain *, struct pirq *, uint64_t gtable);
 void msixtbl_pt_unregister(struct domain *, struct pirq *);
 void msixtbl_pt_cleanup(struct domain *d);
 
+int arch_pci_clean_pirqs(struct domain *d);
+
 #endif /* __XEN_PCI_H__ */
-- 
2.17.1


