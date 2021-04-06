Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 46CCA35527F
	for <lists+xen-devel@lfdr.de>; Tue,  6 Apr 2021 13:41:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.105909.202552 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lTk5J-0000vf-4b; Tue, 06 Apr 2021 11:41:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 105909.202552; Tue, 06 Apr 2021 11:41:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lTk5J-0000vI-0j; Tue, 06 Apr 2021 11:41:29 +0000
Received: by outflank-mailman (input) for mailman id 105909;
 Tue, 06 Apr 2021 11:41:28 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=D7nR=JD=arm.com=rahul.singh@srs-us1.protection.inumbo.net>)
 id 1lTk5I-0000v9-0N
 for xen-devel@lists.xenproject.org; Tue, 06 Apr 2021 11:41:28 +0000
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 88f0cd12-37fa-45cd-9643-7b06aea7f225;
 Tue, 06 Apr 2021 11:41:26 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 056AA113E;
 Tue,  6 Apr 2021 04:41:26 -0700 (PDT)
Received: from e109506.cambridge.arm.com (e109506.cambridge.arm.com
 [10.1.199.1])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 343D93F73D;
 Tue,  6 Apr 2021 04:41:24 -0700 (PDT)
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
X-Inumbo-ID: 88f0cd12-37fa-45cd-9643-7b06aea7f225
From: Rahul Singh <rahul.singh@arm.com>
To: xen-devel@lists.xenproject.org
Cc: bertrand.marquis@arm.com,
	rahul.singh@arm.com,
	Jan Beulich <jbeulich@suse.com>,
	Paul Durrant <paul@xen.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Ian Jackson <iwj@xenproject.org>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Daniel De Graaf <dgdegra@tycho.nsa.gov>
Subject: [PATCH 2/2] xen/pci: Gate all MSI code in common code with CONFIG_HAS_PCI_MSI
Date: Tue,  6 Apr 2021 12:39:11 +0100
Message-Id: <4471ba4fffc8a0cef24cc11314fc788334f85ccc.1617702520.git.rahul.singh@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1617702520.git.rahul.singh@arm.com>
References: <cover.1617702520.git.rahul.singh@arm.com>
In-Reply-To: <cover.1617702520.git.rahul.singh@arm.com>
References: <cover.1617702520.git.rahul.singh@arm.com>

MSI support is not implemented for ARM architecture but it is enabled
for x86 architecture and referenced in common passthrough/pci.c code.

Therefore introducing the new flag to gate the MSI code for ARM in
common code to avoid compilation error when HAS_PCI is enabled for ARM.

Signed-off-by: Rahul Singh <rahul.singh@arm.com>
---
 xen/drivers/passthrough/pci.c | 17 +++++++++++++++++
 xen/drivers/pci/Kconfig       |  4 ++++
 xen/drivers/vpci/Makefile     |  3 ++-
 xen/drivers/vpci/header.c     |  6 ++++++
 xen/drivers/vpci/vpci.c       |  2 ++
 xen/include/xen/vpci.h        |  4 ++++
 xen/xsm/flask/hooks.c         |  6 +++---
 7 files changed, 38 insertions(+), 4 deletions(-)

diff --git a/xen/drivers/passthrough/pci.c b/xen/drivers/passthrough/pci.c
index 705137f8be..390b960d83 100644
--- a/xen/drivers/passthrough/pci.c
+++ b/xen/drivers/passthrough/pci.c
@@ -33,7 +33,9 @@
 #include <xen/tasklet.h>
 #include <xen/vpci.h>
 #include <xsm/xsm.h>
+#ifdef CONFIG_HAS_PCI_MSI
 #include <asm/msi.h>
+#endif
 #include "ats.h"
 
 struct pci_seg {
@@ -327,6 +329,8 @@ static struct pci_dev *alloc_pdev(struct pci_seg *pseg, u8 bus, u8 devfn)
     *((u8*) &pdev->bus) = bus;
     *((u8*) &pdev->devfn) = devfn;
     pdev->domain = NULL;
+
+#ifdef CONFIG_HAS_PCI_MSI
     INIT_LIST_HEAD(&pdev->msi_list);
 
     pos = pci_find_cap_offset(pseg->nr, bus, PCI_SLOT(devfn), PCI_FUNC(devfn),
@@ -357,6 +361,7 @@ static struct pci_dev *alloc_pdev(struct pci_seg *pseg, u8 bus, u8 devfn)
 
         pdev->msix = msix;
     }
+#endif
 
     list_add(&pdev->alldevs_list, &pseg->alldevs_list);
 
@@ -449,7 +454,9 @@ static void free_pdev(struct pci_seg *pseg, struct pci_dev *pdev)
     }
 
     list_del(&pdev->alldevs_list);
+#ifdef CONFIG_HAS_PCI_MSI
     xfree(pdev->msix);
+#endif
     xfree(pdev);
 }
 
@@ -827,7 +834,9 @@ int pci_remove_device(u16 seg, u8 bus, u8 devfn)
     list_for_each_entry ( pdev, &pseg->alldevs_list, alldevs_list )
         if ( pdev->bus == bus && pdev->devfn == devfn )
         {
+#ifdef CONFIG_HAS_PCI_MSI
             pci_cleanup_msi(pdev);
+#endif
             ret = iommu_remove_device(pdev);
             if ( pdev->domain )
                 list_del(&pdev->domain_list);
@@ -1271,7 +1280,9 @@ bool_t pcie_aer_get_firmware_first(const struct pci_dev *pdev)
 static int _dump_pci_devices(struct pci_seg *pseg, void *arg)
 {
     struct pci_dev *pdev;
+#ifdef CONFIG_HAS_PCI_MSI
     struct msi_desc *msi;
+#endif
 
     printk("==== segment %04x ====\n", pseg->nr);
 
@@ -1280,8 +1291,10 @@ static int _dump_pci_devices(struct pci_seg *pseg, void *arg)
         printk("%pp - %pd - node %-3d - MSIs < ",
                &pdev->sbdf, pdev->domain,
                (pdev->node != NUMA_NO_NODE) ? pdev->node : -1);
+#ifdef CONFIG_HAS_PCI_MSI
         list_for_each_entry ( msi, &pdev->msi_list, list )
                printk("%d ", msi->irq);
+#endif
         printk(">\n");
     }
 
@@ -1303,12 +1316,14 @@ static int __init setup_dump_pcidevs(void)
 }
 __initcall(setup_dump_pcidevs);
 
+#ifdef CONFIG_HAS_PCI_MSI
 int iommu_update_ire_from_msi(
     struct msi_desc *msi_desc, struct msi_msg *msg)
 {
     return iommu_intremap
            ? iommu_call(&iommu_ops, update_ire_from_msi, msi_desc, msg) : 0;
 }
+#endif
 
 static int iommu_add_device(struct pci_dev *pdev)
 {
@@ -1429,6 +1444,7 @@ static int assign_device(struct domain *d, u16 seg, u8 bus, u8 devfn, u32 flag)
     ASSERT(pdev && (pdev->domain == hardware_domain ||
                     pdev->domain == dom_io));
 
+#ifdef CONFIG_HAS_PCI_MSI
     if ( pdev->msix )
     {
         rc = pci_reset_msix_state(pdev);
@@ -1436,6 +1452,7 @@ static int assign_device(struct domain *d, u16 seg, u8 bus, u8 devfn, u32 flag)
             goto done;
         msixtbl_init(d);
     }
+#endif
 
     pdev->fault.count = 0;
 
diff --git a/xen/drivers/pci/Kconfig b/xen/drivers/pci/Kconfig
index 7da03fa13b..695781ce3a 100644
--- a/xen/drivers/pci/Kconfig
+++ b/xen/drivers/pci/Kconfig
@@ -1,3 +1,7 @@
 
 config HAS_PCI
 	bool
+
+config HAS_PCI_MSI
+	def_bool y
+	depends on X86 && HAS_PCI
diff --git a/xen/drivers/vpci/Makefile b/xen/drivers/vpci/Makefile
index 55d1bdfda0..1a1413b93e 100644
--- a/xen/drivers/vpci/Makefile
+++ b/xen/drivers/vpci/Makefile
@@ -1 +1,2 @@
-obj-y += vpci.o header.o msi.o msix.o
+obj-y += vpci.o header.o
+obj-$(CONFIG_HAS_PCI_MSI) += msi.o msix.o
diff --git a/xen/drivers/vpci/header.c b/xen/drivers/vpci/header.c
index ba9a036202..b90c345612 100644
--- a/xen/drivers/vpci/header.c
+++ b/xen/drivers/vpci/header.c
@@ -96,8 +96,10 @@ static void modify_decoding(const struct pci_dev *pdev, uint16_t cmd,
      * FIXME: punching holes after the p2m has been set up might be racy for
      * DomU usage, needs to be revisited.
      */
+#ifdef CONFIG_HAS_PCI_MSI
     if ( map && !rom_only && vpci_make_msix_hole(pdev) )
         return;
+#endif
 
     for ( i = 0; i < ARRAY_SIZE(header->bars); i++ )
     {
@@ -206,7 +208,9 @@ static int modify_bars(const struct pci_dev *pdev, uint16_t cmd, bool rom_only)
     struct vpci_header *header = &pdev->vpci->header;
     struct rangeset *mem = rangeset_new(NULL, NULL, 0);
     struct pci_dev *tmp, *dev = NULL;
+#ifdef CONFIG_HAS_PCI_MSI
     const struct vpci_msix *msix = pdev->vpci->msix;
+#endif
     unsigned int i;
     int rc;
 
@@ -243,6 +247,7 @@ static int modify_bars(const struct pci_dev *pdev, uint16_t cmd, bool rom_only)
         }
     }
 
+#ifdef CONFIG_HAS_PCI_MSI
     /* Remove any MSIX regions if present. */
     for ( i = 0; msix && i < ARRAY_SIZE(msix->tables); i++ )
     {
@@ -260,6 +265,7 @@ static int modify_bars(const struct pci_dev *pdev, uint16_t cmd, bool rom_only)
             return rc;
         }
     }
+#endif /* CONFIG_HAS_PCI_MSI */
 
     /*
      * Check for overlaps with other BARs. Note that only BARs that are
diff --git a/xen/drivers/vpci/vpci.c b/xen/drivers/vpci/vpci.c
index cbd1bac7fc..474eb2f0ac 100644
--- a/xen/drivers/vpci/vpci.c
+++ b/xen/drivers/vpci/vpci.c
@@ -48,8 +48,10 @@ void vpci_remove_device(struct pci_dev *pdev)
         xfree(r);
     }
     spin_unlock(&pdev->vpci->lock);
+#ifdef CONFIG_HAS_PCI_MSI
     xfree(pdev->vpci->msix);
     xfree(pdev->vpci->msi);
+#endif
     xfree(pdev->vpci);
     pdev->vpci = NULL;
 }
diff --git a/xen/include/xen/vpci.h b/xen/include/xen/vpci.h
index 9f5b5d52e1..d81588ba64 100644
--- a/xen/include/xen/vpci.h
+++ b/xen/include/xen/vpci.h
@@ -91,6 +91,7 @@ struct vpci {
         /* FIXME: currently there's no support for SR-IOV. */
     } header;
 
+#ifdef CONFIG_HAS_PCI_MSI
     /* MSI data. */
     struct vpci_msi {
       /* Address. */
@@ -136,6 +137,7 @@ struct vpci {
             struct vpci_arch_msix_entry arch;
         } entries[];
     } *msix;
+#endif /* CONFIG_HAS_PCI_MSI */
 #endif
 };
 
@@ -148,6 +150,7 @@ struct vpci_vcpu {
 };
 
 #ifdef __XEN__
+#ifdef CONFIG_HAS_PCI_MSI
 void vpci_dump_msi(void);
 
 /* Make sure there's a hole in the p2m for the MSIX mmio areas. */
@@ -208,6 +211,7 @@ static inline unsigned int vmsix_entry_nr(const struct vpci_msix *msix,
 {
     return entry - msix->entries;
 }
+#endif /* CONFIG_HAS_PCI_MSI */
 #endif /* __XEN__ */
 
 #else /* !CONFIG_HAS_VPCI */
diff --git a/xen/xsm/flask/hooks.c b/xen/xsm/flask/hooks.c
index 3b7313b949..df594c80a9 100644
--- a/xen/xsm/flask/hooks.c
+++ b/xen/xsm/flask/hooks.c
@@ -21,7 +21,7 @@
 #include <xen/guest_access.h>
 #include <xen/xenoprof.h>
 #include <xen/iommu.h>
-#ifdef CONFIG_HAS_PCI
+#ifdef CONFIG_HAS_PCI_MSI
 #include <asm/msi.h>
 #endif
 #include <public/xen.h>
@@ -114,7 +114,7 @@ static int get_irq_sid(int irq, u32 *sid, struct avc_audit_data *ad)
         }
         return security_irq_sid(irq, sid);
     }
-#ifdef CONFIG_HAS_PCI
+#ifdef CONFIG_HAS_PCI_MSI
     {
         struct irq_desc *desc = irq_to_desc(irq);
         if ( desc->msi_desc && desc->msi_desc->dev ) {
@@ -868,7 +868,7 @@ static int flask_map_domain_pirq (struct domain *d)
 static int flask_map_domain_msi (struct domain *d, int irq, const void *data,
                                  u32 *sid, struct avc_audit_data *ad)
 {
-#ifdef CONFIG_HAS_PCI
+#ifdef CONFIG_HAS_PCI_MSI
     const struct msi_info *msi = data;
     u32 machine_bdf = (msi->seg << 16) | (msi->bus << 8) | msi->devfn;
 
-- 
2.17.1


