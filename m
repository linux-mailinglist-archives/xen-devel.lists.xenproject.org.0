Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 34D3622EA15
	for <lists+xen-devel@lfdr.de>; Mon, 27 Jul 2020 12:32:33 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k00QD-0003Xv-6D; Mon, 27 Jul 2020 10:31:53 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1WzZ=BG=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1k00QB-0003Xq-Uk
 for xen-devel@lists.xenproject.org; Mon, 27 Jul 2020 10:31:52 +0000
X-Inumbo-ID: 5f8947b0-cff4-11ea-8a88-bc764e2007e4
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 5f8947b0-cff4-11ea-8a88-bc764e2007e4;
 Mon, 27 Jul 2020 10:31:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1595845907;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Inmii/NatYqHZDQtxUMZ5GZ4S7ACl637bjZeWDU2bH8=;
 b=HAZ9pa9tBG30Roshy1WNJ5RTExvShBe+iKXXKklgH4G3LVW/Lh1AHv5W
 +iTNZC509w20qRCDZ6VIa/iQRl3fDa1QmAfFZX312WNdjM1fzSVHkoD53
 j4tihpgfPeEcO3I1j/dYQvWbC+2WJDBAkM+8NLEvBFrW4rkQbHaOtA2+L U=;
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: p7b90YH02vB2RhiUob01tl/BXvU2E7+q5ftkRm2jwMa1kvSlxvtQyDgyhEkit7x0V9nhXhoj8Z
 13W9Mqel7MtnrRmITRZBhuGJ6+OEiZYv4xMKQMfBxX8wVq1nF78YEn+0avU1s+9yavkmDeM9WH
 mg+nF5IvIz+6wEKSJefERngJx/ZyTakaBgsPlqXcwk9UZweMOTJl0G7c+yudLApZdLAg34lhYP
 BlSs2kYx3dSgJ+KsxCqDqDXhPHErL6UiCn1PO6hTPLywawvLI0355kFPumxf9ilrKQNaB/yyQg
 +rA=
X-SBRS: 2.7
X-MesageID: 23432805
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.75,402,1589256000"; d="scan'208";a="23432805"
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
Subject: [PATCH v3] print: introduce a format specifier for pci_sbdf_t
Date: Mon, 27 Jul 2020 12:31:36 +0200
Message-ID: <20200727103136.53343-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
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
Cc: Kevin Tian <kevin.tian@intel.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Paul Durrant <paul@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Ian
 Jackson <ian.jackson@eu.citrix.com>, George Dunlap <george.dunlap@citrix.com>,
 Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>,
 Roger Pau Monne <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

The new format specifier is '%pp', and prints a pci_sbdf_t using the
seg:bus:dev.func format. Replace all SBDFs printed using
'%04x:%02x:%02x.%u' to use the new format specifier.

No functional change intended.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
Reviewed-by: Kevin Tian <kevin.tian@intel.com>
Acked-by: Julien Grall <julien.grall@arm.com>
For just the pieces where Jan is the only maintainer:
Acked-by: Jan Beulich <jbeulich@suse.com>
---
Changes since v2:
 - Rebase.

Changes since v1:
 - Use base 8 to print the function number.
 - Sort the addition in the pointer function alphabetically.
---
 docs/misc/printk-formats.txt                |  5 ++
 xen/arch/x86/hvm/vmsi.c                     | 10 +--
 xen/arch/x86/msi.c                          | 37 ++++-----
 xen/common/vsprintf.c                       | 18 ++++
 xen/drivers/passthrough/amd/iommu_acpi.c    | 22 +++--
 xen/drivers/passthrough/amd/iommu_cmd.c     |  5 +-
 xen/drivers/passthrough/amd/iommu_detect.c  |  5 +-
 xen/drivers/passthrough/amd/iommu_init.c    | 18 ++--
 xen/drivers/passthrough/amd/iommu_intr.c    |  9 +-
 xen/drivers/passthrough/amd/pci_amd_iommu.c | 25 ++----
 xen/drivers/passthrough/pci.c               | 91 +++++++++------------
 xen/drivers/passthrough/vtd/dmar.c          | 27 +++---
 xen/drivers/passthrough/vtd/intremap.c      | 11 +--
 xen/drivers/passthrough/vtd/iommu.c         | 80 ++++++++----------
 xen/drivers/passthrough/vtd/quirks.c        | 22 ++---
 xen/drivers/passthrough/vtd/utils.c         |  6 +-
 xen/drivers/passthrough/x86/ats.c           | 13 +--
 xen/drivers/vpci/header.c                   | 11 +--
 xen/drivers/vpci/msi.c                      |  6 +-
 xen/drivers/vpci/msix.c                     | 24 ++----
 20 files changed, 190 insertions(+), 255 deletions(-)

diff --git a/docs/misc/printk-formats.txt b/docs/misc/printk-formats.txt
index 080f498f65..8f666f696a 100644
--- a/docs/misc/printk-formats.txt
+++ b/docs/misc/printk-formats.txt
@@ -48,3 +48,8 @@ Domain and vCPU information:
                The domain part as above, with the vcpu_id printed in decimal.
                  e.g.  d0v1
                        d[IDLE]v0
+
+PCI:
+
+       %pp     PCI device address in S:B:D.F format from a pci_sbdf_t.
+                 e.g.  0004:02:00.0
diff --git a/xen/arch/x86/hvm/vmsi.c b/xen/arch/x86/hvm/vmsi.c
index 5d4eddebee..7ca19353ab 100644
--- a/xen/arch/x86/hvm/vmsi.c
+++ b/xen/arch/x86/hvm/vmsi.c
@@ -697,10 +697,8 @@ static int vpci_msi_update(const struct pci_dev *pdev, uint32_t data,
 
         if ( rc )
         {
-            gdprintk(XENLOG_ERR,
-                     "%04x:%02x:%02x.%u: failed to bind PIRQ %u: %d\n",
-                     pdev->seg, pdev->bus, PCI_SLOT(pdev->devfn),
-                     PCI_FUNC(pdev->devfn), pirq + i, rc);
+            gdprintk(XENLOG_ERR, "%pp: failed to bind PIRQ %u: %d\n",
+                     &pdev->sbdf, pirq + i, rc);
             while ( bind.machine_irq-- > pirq )
                 pt_irq_destroy_bind(pdev->domain, &bind);
             return rc;
@@ -754,9 +752,7 @@ static int vpci_msi_enable(const struct pci_dev *pdev, uint32_t data,
                                    &msi_info);
     if ( rc )
     {
-        gdprintk(XENLOG_ERR, "%04x:%02x:%02x.%u: failed to map PIRQ: %d\n",
-                 pdev->seg, pdev->bus, PCI_SLOT(pdev->devfn),
-                 PCI_FUNC(pdev->devfn), rc);
+        gdprintk(XENLOG_ERR, "%pp: failed to map PIRQ: %d\n", &pdev->sbdf, rc);
         return rc;
     }
 
diff --git a/xen/arch/x86/msi.c b/xen/arch/x86/msi.c
index 161ee60dbe..29e4351a49 100644
--- a/xen/arch/x86/msi.c
+++ b/xen/arch/x86/msi.c
@@ -430,8 +430,8 @@ static bool msi_set_mask_bit(struct irq_desc *desc, bool host, bool guest)
             {
                 pdev->msix->warned = domid;
                 printk(XENLOG_G_WARNING
-                       "cannot mask IRQ %d: masking MSI-X on Dom%d's %04x:%02x:%02x.%u\n",
-                       desc->irq, domid, seg, bus, slot, func);
+                       "cannot mask IRQ %d: masking MSI-X on Dom%d's %pp\n",
+                       desc->irq, domid, &pdev->sbdf);
             }
         }
         pdev->msix->host_maskall = maskall;
@@ -985,11 +985,11 @@ static int msix_capability_init(struct pci_dev *dev,
             struct domain *d = dev->domain ?: currd;
 
             if ( !is_hardware_domain(currd) || d != currd )
-                printk("%s use of MSI-X on %04x:%02x:%02x.%u by Dom%d\n",
+                printk("%s use of MSI-X on %pp by %pd\n",
                        is_hardware_domain(currd)
                        ? XENLOG_WARNING "Potentially insecure"
                        : XENLOG_ERR "Insecure",
-                       seg, bus, slot, func, d->domain_id);
+                       &dev->sbdf, d);
             if ( !is_hardware_domain(d) &&
                  /* Assume a domain without memory has no mappings yet. */
                  (!is_hardware_domain(currd) || domain_tot_pages(d)) )
@@ -1043,18 +1043,15 @@ static int __pci_enable_msi(struct msi_info *msi, struct msi_desc **desc)
     old_desc = find_msi_entry(pdev, msi->irq, PCI_CAP_ID_MSI);
     if ( old_desc )
     {
-        printk(XENLOG_ERR "irq %d already mapped to MSI on %04x:%02x:%02x.%u\n",
-               msi->irq, msi->seg, msi->bus,
-               PCI_SLOT(msi->devfn), PCI_FUNC(msi->devfn));
+        printk(XENLOG_ERR "irq %d already mapped to MSI on %pp\n",
+               msi->irq, &pdev->sbdf);
         return -EEXIST;
     }
 
     old_desc = find_msi_entry(pdev, -1, PCI_CAP_ID_MSIX);
     if ( old_desc )
     {
-        printk(XENLOG_WARNING "MSI-X already in use on %04x:%02x:%02x.%u\n",
-               msi->seg, msi->bus,
-               PCI_SLOT(msi->devfn), PCI_FUNC(msi->devfn));
+        printk(XENLOG_WARNING "MSI-X already in use on %pp\n", &pdev->sbdf);
         __pci_disable_msix(old_desc);
     }
 
@@ -1091,8 +1088,6 @@ static void __pci_disable_msi(struct msi_desc *entry)
 static int __pci_enable_msix(struct msi_info *msi, struct msi_desc **desc)
 {
     struct pci_dev *pdev;
-    u8 slot = PCI_SLOT(msi->devfn);
-    u8 func = PCI_FUNC(msi->devfn);
     struct msi_desc *old_desc;
 
     ASSERT(pcidevs_locked());
@@ -1106,16 +1101,15 @@ static int __pci_enable_msix(struct msi_info *msi, struct msi_desc **desc)
     old_desc = find_msi_entry(pdev, msi->irq, PCI_CAP_ID_MSIX);
     if ( old_desc )
     {
-        printk(XENLOG_ERR "irq %d already mapped to MSI-X on %04x:%02x:%02x.%u\n",
-               msi->irq, msi->seg, msi->bus, slot, func);
+        printk(XENLOG_ERR "irq %d already mapped to MSI-X on %pp\n",
+               msi->irq, &pdev->sbdf);
         return -EEXIST;
     }
 
     old_desc = find_msi_entry(pdev, -1, PCI_CAP_ID_MSI);
     if ( old_desc )
     {
-        printk(XENLOG_WARNING "MSI already in use on %04x:%02x:%02x.%u\n",
-               msi->seg, msi->bus, slot, func);
+        printk(XENLOG_WARNING "MSI already in use on %pp\n", &pdev->sbdf);
         __pci_disable_msi(old_desc);
     }
 
@@ -1162,9 +1156,8 @@ static void __pci_disable_msix(struct msi_desc *entry)
         writel(1, entry->mask_base + PCI_MSIX_ENTRY_VECTOR_CTRL_OFFSET);
     else if ( !(control & PCI_MSIX_FLAGS_MASKALL) )
     {
-        printk(XENLOG_WARNING
-               "cannot disable IRQ %d: masking MSI-X on %04x:%02x:%02x.%u\n",
-               entry->irq, seg, bus, slot, func);
+        printk(XENLOG_WARNING "cannot disable IRQ %d: masking MSI-X on %pp\n",
+               entry->irq, &dev->sbdf);
         maskall = true;
     }
     dev->msix->host_maskall = maskall;
@@ -1340,7 +1333,6 @@ int pci_restore_msi_state(struct pci_dev *pdev)
     struct msi_desc *entry, *tmp;
     struct irq_desc *desc;
     struct msi_msg msg;
-    u8 slot = PCI_SLOT(pdev->devfn), func = PCI_FUNC(pdev->devfn);
     unsigned int type = 0, pos = 0;
     u16 control = 0;
 
@@ -1369,9 +1361,8 @@ int pci_restore_msi_state(struct pci_dev *pdev)
         if (desc->msi_desc != entry)
         {
     bogus:
-            dprintk(XENLOG_ERR,
-                    "Restore MSI for %04x:%02x:%02x:%u entry %u not set?\n",
-                    pdev->seg, pdev->bus, slot, func, i);
+            dprintk(XENLOG_ERR, "Restore MSI for %pp entry %u not set?\n",
+                    &pdev->sbdf, i);
             spin_unlock_irqrestore(&desc->lock, flags);
             if ( type == PCI_CAP_ID_MSIX )
                 pci_conf_write16(pdev->sbdf, msix_control_reg(pos),
diff --git a/xen/common/vsprintf.c b/xen/common/vsprintf.c
index 183d3ed4bb..185a4bd561 100644
--- a/xen/common/vsprintf.c
+++ b/xen/common/vsprintf.c
@@ -394,6 +394,20 @@ static char *print_vcpu(char *str, const char *end, const struct vcpu *v)
     return number(str + 1, end, v->vcpu_id, 10, -1, -1, 0);
 }
 
+static char *print_pci_addr(char *str, const char *end, const pci_sbdf_t *sbdf)
+{
+    str = number(str, end, sbdf->seg, 16, 4, -1, ZEROPAD);
+    if ( str < end )
+        *str = ':';
+    str = number(str + 1, end, sbdf->bus, 16, 2, -1, ZEROPAD);
+    if ( str < end )
+        *str = ':';
+    str = number(str + 1, end, sbdf->dev, 16, 2, -1, ZEROPAD);
+    if ( str < end )
+        *str = '.';
+    return number(str + 1, end, sbdf->fn, 8, -1, -1, 0);
+}
+
 static char *pointer(char *str, const char *end, const char **fmt_ptr,
                      const void *arg, int field_width, int precision,
                      int flags)
@@ -476,6 +490,10 @@ static char *pointer(char *str, const char *end, const char **fmt_ptr,
         }
     }
 
+    case 'p': /* PCI SBDF. */
+        ++*fmt_ptr;
+        return print_pci_addr(str, end, arg);
+
     case 's': /* Symbol name with offset and size (iff offset != 0) */
     case 'S': /* Symbol name unconditionally with offset and size */
     {
diff --git a/xen/drivers/passthrough/amd/iommu_acpi.c b/xen/drivers/passthrough/amd/iommu_acpi.c
index f4abbfd9dc..1f6b004260 100644
--- a/xen/drivers/passthrough/amd/iommu_acpi.c
+++ b/xen/drivers/passthrough/amd/iommu_acpi.c
@@ -92,9 +92,8 @@ static void __init add_ivrs_mapping_entry(
                     iommu, &ivrs_mappings[alias_id].intremap_inuse, 0);
 
             if ( !ivrs_mappings[alias_id].intremap_table )
-                panic("No memory for %04x:%02x:%02x.%u's IRT\n",
-                      iommu->seg, PCI_BUS(alias_id), PCI_SLOT(alias_id),
-                      PCI_FUNC(alias_id));
+                panic("No memory for %pp's IRT\n",
+                      &PCI_SBDF2(iommu->seg, alias_id));
         }
     }
 
@@ -738,9 +737,8 @@ static u16 __init parse_ivhd_device_special(
         return 0;
     }
 
-    AMD_IOMMU_DEBUG("IVHD Special: %04x:%02x:%02x.%u variety %#x handle %#x\n",
-                    seg, PCI_BUS(bdf), PCI_SLOT(bdf), PCI_FUNC(bdf),
-                    special->variety, special->handle);
+    AMD_IOMMU_DEBUG("IVHD Special: %pp variety %#x handle %#x\n",
+                    &PCI_SBDF2(seg, bdf), special->variety, special->handle);
     add_ivrs_mapping_entry(bdf, bdf, special->header.data_setting, true,
                            iommu);
 
@@ -764,9 +762,9 @@ static u16 __init parse_ivhd_device_special(
         if ( idx < nr_ioapic_sbdf )
         {
             AMD_IOMMU_DEBUG("IVHD: Command line override present for IO-APIC %#x"
-                            "(IVRS: %#x devID %04x:%02x:%02x.%u)\n",
-                            ioapic_sbdf[idx].id, special->handle, seg,
-                            PCI_BUS(bdf), PCI_SLOT(bdf), PCI_FUNC(bdf));
+                            "(IVRS: %#x devID %pp)\n",
+                            ioapic_sbdf[idx].id, special->handle,
+                            &PCI_SBDF2(seg, bdf));
             break;
         }
 
@@ -836,9 +834,9 @@ static u16 __init parse_ivhd_device_special(
             break;
         case HPET_CMDL:
             AMD_IOMMU_DEBUG("IVHD: Command line override present for HPET %#x "
-                            "(IVRS: %#x devID %04x:%02x:%02x.%u)\n",
-                            hpet_sbdf.id, special->handle, seg, PCI_BUS(bdf),
-                            PCI_SLOT(bdf), PCI_FUNC(bdf));
+                            "(IVRS: %#x devID %pp)\n",
+                            hpet_sbdf.id, special->handle,
+                            &PCI_SBDF2(seg, bdf));
             break;
         case HPET_NONE:
             /* set device id of hpet */
diff --git a/xen/drivers/passthrough/amd/iommu_cmd.c b/xen/drivers/passthrough/amd/iommu_cmd.c
index 249ed345a0..6c0647c524 100644
--- a/xen/drivers/passthrough/amd/iommu_cmd.c
+++ b/xen/drivers/passthrough/amd/iommu_cmd.c
@@ -289,9 +289,8 @@ void amd_iommu_flush_iotlb(u8 devfn, const struct pci_dev *pdev,
 
     if ( !iommu )
     {
-        AMD_IOMMU_DEBUG("%s: Can't find iommu for %04x:%02x:%02x.%u\n",
-                        __func__, pdev->seg, pdev->bus,
-                        PCI_SLOT(pdev->devfn), PCI_FUNC(pdev->devfn));
+        AMD_IOMMU_DEBUG("%s: Can't find iommu for %pp\n",
+                        __func__, &pdev->sbdf);
         return;
     }
 
diff --git a/xen/drivers/passthrough/amd/iommu_detect.c b/xen/drivers/passthrough/amd/iommu_detect.c
index 8312bb4b6f..d05bc6a5bb 100644
--- a/xen/drivers/passthrough/amd/iommu_detect.c
+++ b/xen/drivers/passthrough/amd/iommu_detect.c
@@ -182,9 +182,8 @@ int __init amd_iommu_detect_one_acpi(
 
     rt = pci_ro_device(iommu->seg, bus, PCI_DEVFN(dev, func));
     if ( rt )
-        printk(XENLOG_ERR
-               "Could not mark config space of %04x:%02x:%02x.%u read-only (%d)\n",
-               iommu->seg, bus, dev, func, rt);
+        printk(XENLOG_ERR "Could not mark config space of %pp read-only (%d)\n",
+               &PCI_SBDF2(iommu->seg, iommu->bdf), rt);
 
     list_add_tail(&iommu->list, &amd_iommu_head);
     rt = 0;
diff --git a/xen/drivers/passthrough/amd/iommu_init.c b/xen/drivers/passthrough/amd/iommu_init.c
index 034f3b9c2c..24d1dfec40 100644
--- a/xen/drivers/passthrough/amd/iommu_init.c
+++ b/xen/drivers/passthrough/amd/iommu_init.c
@@ -558,10 +558,10 @@ static void parse_event_log_entry(struct amd_iommu *iommu, u32 entry[])
         unsigned int flags = MASK_EXTR(entry[1], IOMMU_EVENT_FLAGS_MASK);
         uint64_t addr = *(uint64_t *)(entry + 2);
 
-        printk(XENLOG_ERR "AMD-Vi: %s: %04x:%02x:%02x.%u d%d addr %016"PRIx64
+        printk(XENLOG_ERR "AMD-Vi: %s: %pp d%u addr %016"PRIx64
                " flags %#x%s%s%s%s%s%s%s%s%s%s\n",
-               code_str, iommu->seg, PCI_BUS(device_id), PCI_SLOT(device_id),
-               PCI_FUNC(device_id), domain_id, addr, flags,
+               code_str, &PCI_SBDF2(iommu->seg, device_id),
+               domain_id, addr, flags,
                (flags & 0xe00) ? " ??" : "",
                (flags & 0x100) ? " TR" : "",
                (flags & 0x080) ? " RZ" : "",
@@ -753,9 +753,8 @@ static bool_t __init set_iommu_interrupt_handler(struct amd_iommu *iommu)
     pcidevs_unlock();
     if ( !iommu->msi.dev )
     {
-        AMD_IOMMU_DEBUG("IOMMU: no pdev for %04x:%02x:%02x.%u\n",
-                        iommu->seg, PCI_BUS(iommu->bdf),
-                        PCI_SLOT(iommu->bdf), PCI_FUNC(iommu->bdf));
+        AMD_IOMMU_DEBUG("IOMMU: no pdev for %pp\n",
+                        &PCI_SBDF2(iommu->seg, iommu->bdf));
         return 0;
     }
 
@@ -841,9 +840,6 @@ __initcall(iov_adjust_irq_affinities);
 static void amd_iommu_erratum_746_workaround(struct amd_iommu *iommu)
 {
     u32 value;
-    u8 bus = PCI_BUS(iommu->bdf);
-    u8 dev = PCI_SLOT(iommu->bdf);
-    u8 func = PCI_FUNC(iommu->bdf);
 
     if ( (boot_cpu_data.x86 != 0x15) ||
          (boot_cpu_data.x86_model < 0x10) ||
@@ -861,8 +857,8 @@ static void amd_iommu_erratum_746_workaround(struct amd_iommu *iommu)
 
     pci_conf_write32(PCI_SBDF2(iommu->seg, iommu->bdf), 0xf4, value | (1 << 2));
     printk(XENLOG_INFO
-           "AMD-Vi: Applying erratum 746 workaround for IOMMU at %04x:%02x:%02x.%u\n",
-           iommu->seg, bus, dev, func);
+           "AMD-Vi: Applying erratum 746 workaround for IOMMU at %pp\n",
+           &PCI_SBDF2(iommu->seg, iommu->bdf));
 
     /* Clear the enable writing bit */
     pci_conf_write32(PCI_SBDF2(iommu->seg, iommu->bdf), 0xf0, 0x90);
diff --git a/xen/drivers/passthrough/amd/iommu_intr.c b/xen/drivers/passthrough/amd/iommu_intr.c
index cec575071d..0adee53fb8 100644
--- a/xen/drivers/passthrough/amd/iommu_intr.c
+++ b/xen/drivers/passthrough/amd/iommu_intr.c
@@ -610,8 +610,7 @@ static struct amd_iommu *_find_iommu_for_device(int seg, int bdf)
     if ( iommu )
         return iommu;
 
-    AMD_IOMMU_DEBUG("No IOMMU for MSI dev = %04x:%02x:%02x.%u\n",
-                    seg, PCI_BUS(bdf), PCI_SLOT(bdf), PCI_FUNC(bdf));
+    AMD_IOMMU_DEBUG("No IOMMU for MSI dev = %pp\n", &PCI_SBDF2(seg, bdf));
     return ERR_PTR(-EINVAL);
 }
 
@@ -863,10 +862,8 @@ static void dump_intremap_table(const struct amd_iommu *iommu,
 
         if ( ivrs_mapping )
         {
-            printk("  %04x:%02x:%02x:%u:\n", iommu->seg,
-                   PCI_BUS(ivrs_mapping->dte_requestor_id),
-                   PCI_SLOT(ivrs_mapping->dte_requestor_id),
-                   PCI_FUNC(ivrs_mapping->dte_requestor_id));
+            printk("  %pp:\n",
+                   &PCI_SBDF2(iommu->seg, ivrs_mapping->dte_requestor_id));
             ivrs_mapping = NULL;
         }
 
diff --git a/xen/drivers/passthrough/amd/pci_amd_iommu.c b/xen/drivers/passthrough/amd/pci_amd_iommu.c
index 8d6309cc8c..5f5f4a2eac 100644
--- a/xen/drivers/passthrough/amd/pci_amd_iommu.c
+++ b/xen/drivers/passthrough/amd/pci_amd_iommu.c
@@ -49,9 +49,8 @@ struct amd_iommu *find_iommu_for_device(int seg, int bdf)
                 tmp.dte_requestor_id = bdf;
             ivrs_mappings[bdf] = tmp;
 
-            printk(XENLOG_WARNING "%04x:%02x:%02x.%u not found in ACPI tables;"
-                   " using same IOMMU as function 0\n",
-                   seg, PCI_BUS(bdf), PCI_SLOT(bdf), PCI_FUNC(bdf));
+            printk(XENLOG_WARNING "%pp not found in ACPI tables;"
+                   " using same IOMMU as function 0\n", &PCI_SBDF2(seg, bdf));
 
             /* write iommu field last */
             ivrs_mappings[bdf].iommu = ivrs_mappings[bd0].iommu;
@@ -349,9 +348,8 @@ static int reassign_device(struct domain *source, struct domain *target,
         return rc;
 
     amd_iommu_setup_domain_device(target, iommu, devfn, pdev);
-    AMD_IOMMU_DEBUG("Re-assign %04x:%02x:%02x.%u from dom%d to dom%d\n",
-                    pdev->seg, pdev->bus, PCI_SLOT(devfn), PCI_FUNC(devfn),
-                    source->domain_id, target->domain_id);
+    AMD_IOMMU_DEBUG("Re-assign %pp from dom%d to dom%d\n",
+                    &pdev->sbdf, source->domain_id, target->domain_id);
 
     return 0;
 }
@@ -459,15 +457,12 @@ static int amd_iommu_add_device(u8 devfn, struct pci_dev *pdev)
         if ( pdev->type == DEV_TYPE_PCI_HOST_BRIDGE &&
              is_hardware_domain(pdev->domain) )
         {
-            AMD_IOMMU_DEBUG("Skipping host bridge %04x:%02x:%02x.%u\n",
-                            pdev->seg, pdev->bus, PCI_SLOT(devfn),
-                            PCI_FUNC(devfn));
+            AMD_IOMMU_DEBUG("Skipping host bridge %pp\n", &pdev->sbdf);
             return 0;
         }
 
-        AMD_IOMMU_DEBUG("No iommu for %04x:%02x:%02x.%u; cannot be handed to d%d\n",
-                        pdev->seg, pdev->bus, PCI_SLOT(devfn), PCI_FUNC(devfn),
-                        pdev->domain->domain_id);
+        AMD_IOMMU_DEBUG("No iommu for %pp; cannot be handed to d%d\n",
+                        &pdev->sbdf, pdev->domain->domain_id);
         return -ENODEV;
     }
 
@@ -522,10 +517,8 @@ static int amd_iommu_remove_device(u8 devfn, struct pci_dev *pdev)
     iommu = find_iommu_for_device(pdev->seg, bdf);
     if ( !iommu )
     {
-        AMD_IOMMU_DEBUG("Fail to find iommu."
-                        " %04x:%02x:%02x.%u cannot be removed from dom%d\n",
-                        pdev->seg, pdev->bus, PCI_SLOT(devfn), PCI_FUNC(devfn),
-                        pdev->domain->domain_id);
+        AMD_IOMMU_DEBUG("Fail to find iommu. %pp cannot be removed from %pd\n",
+                        &pdev->sbdf, pdev->domain);
         return -ENODEV;
     }
 
diff --git a/xen/drivers/passthrough/pci.c b/xen/drivers/passthrough/pci.c
index 5846978890..561344d35f 100644
--- a/xen/drivers/passthrough/pci.c
+++ b/xen/drivers/passthrough/pci.c
@@ -239,11 +239,7 @@ static void check_pdev(const struct pci_dev *pdev)
     (PCI_STATUS_PARITY | PCI_STATUS_SIG_TARGET_ABORT | \
      PCI_STATUS_REC_TARGET_ABORT | PCI_STATUS_REC_MASTER_ABORT | \
      PCI_STATUS_SIG_SYSTEM_ERROR | PCI_STATUS_DETECTED_PARITY)
-    u16 seg = pdev->seg;
-    u8 bus = pdev->bus;
-    u8 dev = PCI_SLOT(pdev->devfn);
-    u8 func = PCI_FUNC(pdev->devfn);
-    u16 val;
+     u16 val;
 
     if ( command_mask )
     {
@@ -253,8 +249,8 @@ static void check_pdev(const struct pci_dev *pdev)
         val = pci_conf_read16(pdev->sbdf, PCI_STATUS);
         if ( val & PCI_STATUS_CHECK )
         {
-            printk(XENLOG_INFO "%04x:%02x:%02x.%u status %04x -> %04x\n",
-                   seg, bus, dev, func, val, val & ~PCI_STATUS_CHECK);
+            printk(XENLOG_INFO "%pp status %04x -> %04x\n",
+                   &pdev->sbdf, val, val & ~PCI_STATUS_CHECK);
             pci_conf_write16(pdev->sbdf, PCI_STATUS, val & PCI_STATUS_CHECK);
         }
     }
@@ -271,9 +267,8 @@ static void check_pdev(const struct pci_dev *pdev)
         val = pci_conf_read16(pdev->sbdf, PCI_SEC_STATUS);
         if ( val & PCI_STATUS_CHECK )
         {
-            printk(XENLOG_INFO
-                   "%04x:%02x:%02x.%u secondary status %04x -> %04x\n",
-                   seg, bus, dev, func, val, val & ~PCI_STATUS_CHECK);
+            printk(XENLOG_INFO "%pp secondary status %04x -> %04x\n",
+                   &pdev->sbdf, val, val & ~PCI_STATUS_CHECK);
             pci_conf_write16(pdev->sbdf, PCI_SEC_STATUS,
                              val & PCI_STATUS_CHECK);
         }
@@ -427,8 +422,8 @@ static struct pci_dev *alloc_pdev(struct pci_seg *pseg, u8 bus, u8 devfn)
             break;
 
         default:
-            printk(XENLOG_WARNING "%04x:%02x:%02x.%u: unknown type %d\n",
-                   pseg->nr, bus, PCI_SLOT(devfn), PCI_FUNC(devfn), pdev->type);
+            printk(XENLOG_WARNING "%pp: unknown type %d\n",
+                   &pdev->sbdf, pdev->type);
             break;
     }
 
@@ -660,9 +655,9 @@ unsigned int pci_size_mem_bar(pci_sbdf_t sbdf, unsigned int pos,
         if ( flags & PCI_BAR_LAST )
         {
             printk(XENLOG_WARNING
-                   "%sdevice %04x:%02x:%02x.%u with 64-bit %sBAR in last slot\n",
-                   (flags & PCI_BAR_VF) ? "SR-IOV " : "", sbdf.seg, sbdf.bus,
-                   sbdf.dev, sbdf.fn, (flags & PCI_BAR_VF) ? "vf " : "");
+                   "%sdevice %pp with 64-bit %sBAR in last slot\n",
+                   (flags & PCI_BAR_VF) ? "SR-IOV " : "", &sbdf,
+                   (flags & PCI_BAR_VF) ? "vf " : "");
             *psize = 0;
             return 1;
         }
@@ -765,9 +760,8 @@ int pci_add_device(u16 seg, u8 bus, u8 devfn,
                      PCI_BASE_ADDRESS_SPACE_IO )
                 {
                     printk(XENLOG_WARNING
-                           "SR-IOV device %04x:%02x:%02x.%u with vf BAR%u"
-                           " in IO space\n",
-                           seg, bus, slot, func, i);
+                           "SR-IOV device %pp with vf BAR%u in IO space\n",
+                           &pdev->sbdf, i);
                     continue;
                 }
                 ret = pci_size_mem_bar(pdev->sbdf, idx, NULL,
@@ -780,10 +774,8 @@ int pci_add_device(u16 seg, u8 bus, u8 devfn,
             }
         }
         else
-            printk(XENLOG_WARNING
-                   "SR-IOV device %04x:%02x:%02x.%u has its virtual"
-                   " functions already enabled (%04x)\n",
-                   seg, bus, slot, func, ctrl);
+            printk(XENLOG_WARNING "SR-IOV device %pp has its virtual"
+                   " functions already enabled (%04x)\n", &pdev->sbdf, ctrl);
     }
 
     check_pdev(pdev);
@@ -810,15 +802,14 @@ out:
     pcidevs_unlock();
     if ( !ret )
     {
-        printk(XENLOG_DEBUG "PCI add %s %04x:%02x:%02x.%u\n", pdev_type,
-               seg, bus, slot, func);
+        printk(XENLOG_DEBUG "PCI add %s %pp\n", pdev_type,  &pdev->sbdf);
         while ( pdev->phantom_stride )
         {
             func += pdev->phantom_stride;
             if ( PCI_SLOT(func) )
                 break;
-            printk(XENLOG_DEBUG "PCI phantom %04x:%02x:%02x.%u\n",
-                   seg, bus, slot, func);
+            printk(XENLOG_DEBUG "PCI phantom %pp\n",
+                   &PCI_SBDF(seg, bus, slot, func));
         }
     }
     return ret;
@@ -847,9 +838,8 @@ int pci_remove_device(u16 seg, u8 bus, u8 devfn)
             if ( pdev->domain )
                 list_del(&pdev->domain_list);
             pci_cleanup_msi(pdev);
+            printk(XENLOG_DEBUG "PCI remove device %pp\n", &pdev->sbdf);
             free_pdev(pseg, pdev);
-            printk(XENLOG_DEBUG "PCI remove device %04x:%02x:%02x.%u\n",
-                   seg, bus, PCI_SLOT(devfn), PCI_FUNC(devfn));
             break;
         }
 
@@ -968,8 +958,8 @@ static int deassign_device(struct domain *d, uint16_t seg, uint8_t bus,
 
  out:
     if ( ret )
-        printk(XENLOG_G_ERR "%pd: deassign (%04x:%02x:%02x.%u) failed (%d)\n",
-               d, seg, bus, PCI_SLOT(devfn), PCI_FUNC(devfn), ret);
+        printk(XENLOG_G_ERR "%pd: deassign (%pp) failed (%d)\n",
+               d, &PCI_SBDF3(seg, bus, devfn), ret);
 
     return ret;
 }
@@ -1138,8 +1128,8 @@ static int __init _scan_pci_devices(struct pci_seg *pseg, void *arg)
                 pdev = alloc_pdev(pseg, bus, PCI_DEVFN(dev, func));
                 if ( !pdev )
                 {
-                    printk(XENLOG_WARNING "%04x:%02x:%02x.%u: alloc_pdev failed\n",
-                           pseg->nr, bus, dev, func);
+                    printk(XENLOG_WARNING "%pp: alloc_pdev failed\n",
+                           &PCI_SBDF(pseg->nr, bus, dev, func));
                     return -ENOMEM;
                 }
 
@@ -1180,9 +1170,8 @@ static void __hwdom_init setup_one_hwdom_device(const struct setup_hwdom *ctxt,
         err = ctxt->handler(devfn, pdev);
         if ( err )
         {
-            printk(XENLOG_ERR "setup %04x:%02x:%02x.%u for d%d failed (%d)\n",
-                   pdev->seg, pdev->bus, PCI_SLOT(devfn), PCI_FUNC(devfn),
-                   ctxt->d->domain_id, err);
+            printk(XENLOG_ERR "setup %pp for d%d failed (%d)\n",
+                   &pdev->sbdf, ctxt->d->domain_id, err);
             if ( devfn == pdev->devfn )
                 return;
         }
@@ -1223,9 +1212,8 @@ static int __hwdom_init _setup_hwdom_pci_devices(struct pci_seg *pseg, void *arg
                 pdev->domain = dom_xen;
             }
             else if ( pdev->domain != ctxt->d )
-                printk(XENLOG_WARNING "Dom%d owning %04x:%02x:%02x.%u?\n",
-                       pdev->domain->domain_id, pseg->nr, bus,
-                       PCI_SLOT(devfn), PCI_FUNC(devfn));
+                printk(XENLOG_WARNING "Dom%d owning %pp?\n",
+                       pdev->domain->domain_id, &pdev->sbdf);
 
             if ( iommu_verbose )
             {
@@ -1361,9 +1349,8 @@ static int _dump_pci_devices(struct pci_seg *pseg, void *arg)
 
     list_for_each_entry ( pdev, &pseg->alldevs_list, alldevs_list )
     {
-        printk("%04x:%02x:%02x.%u - %pd - node %-3d - MSIs < ",
-               pseg->nr, pdev->bus,
-               PCI_SLOT(pdev->devfn), PCI_FUNC(pdev->devfn), pdev->domain,
+        printk("%pp - %pd - node %-3d - MSIs < ",
+               &pdev->sbdf, pdev->domain,
                (pdev->node != NUMA_NO_NODE) ? pdev->node : -1);
         list_for_each_entry ( msi, &pdev->msi_list, list )
                printk("%d ", msi->irq);
@@ -1428,8 +1415,8 @@ static int iommu_add_device(struct pci_dev *pdev)
             return 0;
         rc = hd->platform_ops->add_device(devfn, pci_to_dev(pdev));
         if ( rc )
-            printk(XENLOG_WARNING "IOMMU: add %04x:%02x:%02x.%u failed (%d)\n",
-                   pdev->seg, pdev->bus, PCI_SLOT(devfn), PCI_FUNC(devfn), rc);
+            printk(XENLOG_WARNING "IOMMU: add %pp failed (%d)\n",
+                   &pdev->sbdf, rc);
     }
 }
 
@@ -1473,8 +1460,7 @@ static int iommu_remove_device(struct pci_dev *pdev)
         if ( !rc )
             continue;
 
-        printk(XENLOG_ERR "IOMMU: remove %04x:%02x:%02x.%u failed (%d)\n",
-               pdev->seg, pdev->bus, PCI_SLOT(devfn), PCI_FUNC(devfn), rc);
+        printk(XENLOG_ERR "IOMMU: remove %pp failed (%d)\n", &pdev->sbdf, rc);
         return rc;
     }
 
@@ -1550,8 +1536,8 @@ static int assign_device(struct domain *d, u16 seg, u8 bus, u8 devfn, u32 flag)
 
  done:
     if ( rc )
-        printk(XENLOG_G_WARNING "%pd: assign (%04x:%02x:%02x.%u) failed (%d)\n",
-               d, seg, bus, PCI_SLOT(devfn), PCI_FUNC(devfn), rc);
+        printk(XENLOG_G_WARNING "%pd: assign (%pp) failed (%d)\n",
+               d, &PCI_SBDF3(seg, bus, devfn), rc);
     /* The device is assigned to dom_io so mark it as quarantined */
     else if ( d == dom_io )
         pdev->quarantine = true;
@@ -1624,10 +1610,8 @@ void iommu_dev_iotlb_flush_timeout(struct domain *d, struct pci_dev *pdev)
     _pci_hide_device(pdev);
 
     if ( !d->is_shutting_down && printk_ratelimit() )
-        printk(XENLOG_ERR
-               "dom%d: ATS device %04x:%02x:%02x.%u flush failed\n",
-               d->domain_id, pdev->seg, pdev->bus, PCI_SLOT(pdev->devfn),
-               PCI_FUNC(pdev->devfn));
+        printk(XENLOG_ERR "dom%d: ATS device %pp flush failed\n",
+               d->domain_id, &pdev->sbdf);
     if ( !is_hardware_domain(d) )
         domain_crash(d);
 
@@ -1717,9 +1701,8 @@ int iommu_do_pci_domctl(
         {
             if ( ret )
             {
-                printk(XENLOG_G_INFO
-                       "%04x:%02x:%02x.%u already assigned, or non-existent\n",
-                       seg, bus, PCI_SLOT(devfn), PCI_FUNC(devfn));
+                printk(XENLOG_G_INFO "%pp already assigned, or non-existent\n",
+                       &PCI_SBDF3(seg, bus, devfn));
                 ret = -EINVAL;
             }
         }
diff --git a/xen/drivers/passthrough/vtd/dmar.c b/xen/drivers/passthrough/vtd/dmar.c
index 29cd5c5d70..36d909b06d 100644
--- a/xen/drivers/passthrough/vtd/dmar.c
+++ b/xen/drivers/passthrough/vtd/dmar.c
@@ -349,9 +349,8 @@ static int __init acpi_parse_dev_scope(
             sub_bus = pci_conf_read8(PCI_SBDF(seg, bus, path->dev, path->fn),
                                      PCI_SUBORDINATE_BUS);
             if ( iommu_verbose )
-                printk(VTDPREFIX
-                       " bridge: %04x:%02x:%02x.%u start=%x sec=%x sub=%x\n",
-                       seg, bus, path->dev, path->fn,
+                printk(VTDPREFIX " bridge: %pp start=%x sec=%x sub=%x\n",
+                       &PCI_SBDF(seg, bus, path->dev, path->fn),
                        acpi_scope->bus, sec_bus, sub_bus);
 
             dmar_scope_add_buses(scope, sec_bus, sub_bus);
@@ -359,8 +358,8 @@ static int __init acpi_parse_dev_scope(
 
         case ACPI_DMAR_SCOPE_TYPE_HPET:
             if ( iommu_verbose )
-                printk(VTDPREFIX " MSI HPET: %04x:%02x:%02x.%u\n",
-                       seg, bus, path->dev, path->fn);
+                printk(VTDPREFIX " MSI HPET: %pp\n",
+                       &PCI_SBDF(seg, bus, path->dev, path->fn));
 
             if ( drhd )
             {
@@ -381,8 +380,8 @@ static int __init acpi_parse_dev_scope(
 
         case ACPI_DMAR_SCOPE_TYPE_ENDPOINT:
             if ( iommu_verbose )
-                printk(VTDPREFIX " endpoint: %04x:%02x:%02x.%u\n",
-                       seg, bus, path->dev, path->fn);
+                printk(VTDPREFIX " endpoint: %pp\n",
+                       &PCI_SBDF(seg, bus, path->dev, path->fn));
 
             if ( drhd )
             {
@@ -395,8 +394,8 @@ static int __init acpi_parse_dev_scope(
 
         case ACPI_DMAR_SCOPE_TYPE_IOAPIC:
             if ( iommu_verbose )
-                printk(VTDPREFIX " IOAPIC: %04x:%02x:%02x.%u\n",
-                       seg, bus, path->dev, path->fn);
+                printk(VTDPREFIX " IOAPIC: %pp\n",
+                       &PCI_SBDF(seg, bus, path->dev, path->fn));
 
             if ( drhd )
             {
@@ -525,8 +524,8 @@ acpi_parse_one_drhd(struct acpi_dmar_header *header)
 
             if ( !pci_device_detect(drhd->segment, b, d, f) )
                 printk(XENLOG_WARNING VTDPREFIX
-                       " Non-existent device (%04x:%02x:%02x.%u) in this DRHD's scope!\n",
-                       drhd->segment, b, d, f);
+                       " Non-existent device (%pp) in this DRHD's scope!\n",
+                       &PCI_SBDF(drhd->segment, b, d, f));
         }
 
         acpi_register_drhd_unit(dmaru);
@@ -562,9 +561,9 @@ static int register_one_rmrr(struct acpi_rmrr_unit *rmrru)
         if ( pci_device_detect(rmrru->segment, b, d, f) == 0 )
         {
             dprintk(XENLOG_WARNING VTDPREFIX,
-                    " Non-existent device (%04x:%02x:%02x.%u) is reported"
-                    " in RMRR [%"PRIx64",%"PRIx64"]'s scope!\n",
-                    rmrru->segment, b, d, f,
+                    " Non-existent device (%pp) is reported"
+                    " in RMRR [%"PRIx64", %"PRIx64"]'s scope!\n",
+                    &PCI_SBDF(rmrru->segment, b, d, f),
                     rmrru->base_address, rmrru->end_address);
             ignore = true;
         }
diff --git a/xen/drivers/passthrough/vtd/intremap.c b/xen/drivers/passthrough/vtd/intremap.c
index a2f02c1bea..0d2a9d78de 100644
--- a/xen/drivers/passthrough/vtd/intremap.c
+++ b/xen/drivers/passthrough/vtd/intremap.c
@@ -521,16 +521,13 @@ static void set_msi_source_id(struct pci_dev *pdev, struct iremap_entry *ire)
         }
         else
             dprintk(XENLOG_WARNING VTDPREFIX,
-                    "d%d: no upstream bridge for %04x:%02x:%02x.%u\n",
-                    pdev->domain->domain_id,
-                    seg, bus, PCI_SLOT(devfn), PCI_FUNC(devfn));
+                    "d%d: no upstream bridge for %pp\n",
+                    pdev->domain->domain_id, &pdev->sbdf);
         break;
 
     default:
-        dprintk(XENLOG_WARNING VTDPREFIX,
-                "d%d: unknown(%u): %04x:%02x:%02x.%u\n",
-                pdev->domain->domain_id, pdev->type,
-                seg, bus, PCI_SLOT(devfn), PCI_FUNC(devfn));
+        dprintk(XENLOG_WARNING VTDPREFIX, "d%d: unknown(%u): %pp\n",
+                pdev->domain->domain_id, pdev->type, &pdev->sbdf);
         break;
    }
 }
diff --git a/xen/drivers/passthrough/vtd/iommu.c b/xen/drivers/passthrough/vtd/iommu.c
index 2a99cd208f..8921e011a3 100644
--- a/xen/drivers/passthrough/vtd/iommu.c
+++ b/xen/drivers/passthrough/vtd/iommu.c
@@ -873,27 +873,24 @@ static int iommu_page_fault_do_one(struct vtd_iommu *iommu, int type,
     {
     case DMA_REMAP:
         printk(XENLOG_G_WARNING VTDPREFIX
-               "DMAR:[%s] Request device [%04x:%02x:%02x.%u] "
+               "DMAR:[%s] Request device [%pp] "
                "fault addr %"PRIx64"\n",
                (type ? "DMA Read" : "DMA Write"),
-               seg, PCI_BUS(source_id), PCI_SLOT(source_id),
-               PCI_FUNC(source_id), addr);
+               &PCI_SBDF2(seg, source_id), addr);
         kind = "DMAR";
         break;
     case INTR_REMAP:
         printk(XENLOG_G_WARNING VTDPREFIX
-               "INTR-REMAP: Request device [%04x:%02x:%02x.%u] "
+               "INTR-REMAP: Request device [%pp] "
                "fault index %"PRIx64"\n",
-               seg, PCI_BUS(source_id), PCI_SLOT(source_id),
-               PCI_FUNC(source_id), addr >> 48);
+               &PCI_SBDF2(seg, source_id), addr >> 48);
         kind = "INTR-REMAP";
         break;
     default:
         printk(XENLOG_G_WARNING VTDPREFIX
-               "UNKNOWN: Request device [%04x:%02x:%02x.%u] "
+               "UNKNOWN: Request device [%pp] "
                "fault addr %"PRIx64"\n",
-               seg, PCI_BUS(source_id), PCI_SLOT(source_id),
-               PCI_FUNC(source_id), addr);
+               &PCI_SBDF2(seg, source_id), addr);
         kind = "UNKNOWN";
         break;
     }
@@ -1339,9 +1336,8 @@ int domain_context_mapping_one(
         {
             if ( pdev->domain != domain )
             {
-                printk(XENLOG_G_INFO VTDPREFIX
-                       "%pd: %04x:%02x:%02x.%u owned by %pd\n",
-                       domain, seg, bus, PCI_SLOT(devfn), PCI_FUNC(devfn),
+                printk(XENLOG_G_INFO VTDPREFIX "%pd: %pp owned by %pd",
+                       domain, &PCI_SBDF3(seg, bus, devfn),
                        pdev->domain);
                 res = -EINVAL;
             }
@@ -1354,17 +1350,15 @@ int domain_context_mapping_one(
             if ( cdomain < 0 )
             {
                 printk(XENLOG_G_WARNING VTDPREFIX
-                       "%pd: %04x:%02x:%02x.%u mapped, but can't find owner\n",
-                       domain, seg, bus, PCI_SLOT(devfn), PCI_FUNC(devfn));
+                       "%pd: %pp mapped, but can't find owner\n",
+                       domain, &PCI_SBDF3(seg, bus, devfn));
                 res = -EINVAL;
             }
             else if ( cdomain != domain->domain_id )
             {
                 printk(XENLOG_G_INFO VTDPREFIX
-                       "%pd: %04x:%02x:%02x.%u already mapped to d%d\n",
-                       domain,
-                       seg, bus, PCI_SLOT(devfn), PCI_FUNC(devfn),
-                       cdomain);
+                       "%pd: %pp already mapped to d%d",
+                       domain, &PCI_SBDF3(seg, bus, devfn), cdomain);
                 res = -EINVAL;
             }
         }
@@ -1490,9 +1484,8 @@ static int domain_context_mapping(struct domain *domain, u8 devfn,
     {
     case DEV_TYPE_PCI_HOST_BRIDGE:
         if ( iommu_debug )
-            printk(VTDPREFIX "d%d:Hostbridge: skip %04x:%02x:%02x.%u map\n",
-                   domain->domain_id, seg, bus,
-                   PCI_SLOT(devfn), PCI_FUNC(devfn));
+            printk(VTDPREFIX "%pd:Hostbridge: skip %pp map\n",
+                   domain, &PCI_SBDF3(seg, bus, devfn));
         if ( !is_hardware_domain(domain) )
             return -EPERM;
         break;
@@ -1504,9 +1497,8 @@ static int domain_context_mapping(struct domain *domain, u8 devfn,
 
     case DEV_TYPE_PCIe_ENDPOINT:
         if ( iommu_debug )
-            printk(VTDPREFIX "d%d:PCIe: map %04x:%02x:%02x.%u\n",
-                   domain->domain_id, seg, bus,
-                   PCI_SLOT(devfn), PCI_FUNC(devfn));
+            printk(VTDPREFIX "%pd:PCIe: map %pp\n",
+                   domain, &PCI_SBDF3(seg, bus, devfn));
         ret = domain_context_mapping_one(domain, drhd->iommu, bus, devfn,
                                          pdev);
         if ( !ret && devfn == pdev->devfn && ats_device(pdev, drhd) > 0 )
@@ -1516,9 +1508,8 @@ static int domain_context_mapping(struct domain *domain, u8 devfn,
 
     case DEV_TYPE_PCI:
         if ( iommu_debug )
-            printk(VTDPREFIX "d%d:PCI: map %04x:%02x:%02x.%u\n",
-                   domain->domain_id, seg, bus,
-                   PCI_SLOT(devfn), PCI_FUNC(devfn));
+            printk(VTDPREFIX "%pd:PCI: map %pp\n",
+                   domain, &PCI_SBDF3(seg, bus, devfn));
 
         ret = domain_context_mapping_one(domain, drhd->iommu, bus, devfn,
                                          pdev);
@@ -1554,9 +1545,8 @@ static int domain_context_mapping(struct domain *domain, u8 devfn,
         break;
 
     default:
-        dprintk(XENLOG_ERR VTDPREFIX, "d%d:unknown(%u): %04x:%02x:%02x.%u\n",
-                domain->domain_id, pdev->type,
-                seg, bus, PCI_SLOT(devfn), PCI_FUNC(devfn));
+        dprintk(XENLOG_ERR VTDPREFIX, "%pd:unknown(%u): %pp\n",
+                domain, pdev->type, &PCI_SBDF3(seg, bus, devfn));
         ret = -EINVAL;
         break;
     }
@@ -1651,9 +1641,8 @@ static int domain_context_unmap(struct domain *domain, u8 devfn,
     {
     case DEV_TYPE_PCI_HOST_BRIDGE:
         if ( iommu_debug )
-            printk(VTDPREFIX "d%d:Hostbridge: skip %04x:%02x:%02x.%u unmap\n",
-                   domain->domain_id, seg, bus,
-                   PCI_SLOT(devfn), PCI_FUNC(devfn));
+            printk(VTDPREFIX "%pd:Hostbridge: skip %pp unmap\n",
+                   domain, &PCI_SBDF3(seg, bus, devfn));
         if ( !is_hardware_domain(domain) )
             return -EPERM;
         goto out;
@@ -1665,9 +1654,8 @@ static int domain_context_unmap(struct domain *domain, u8 devfn,
 
     case DEV_TYPE_PCIe_ENDPOINT:
         if ( iommu_debug )
-            printk(VTDPREFIX "d%d:PCIe: unmap %04x:%02x:%02x.%u\n",
-                   domain->domain_id, seg, bus,
-                   PCI_SLOT(devfn), PCI_FUNC(devfn));
+            printk(VTDPREFIX "%pd:PCIe: unmap %pp\n",
+                   domain, &PCI_SBDF3(seg, bus, devfn));
         ret = domain_context_unmap_one(domain, iommu, bus, devfn);
         if ( !ret && devfn == pdev->devfn && ats_device(pdev, drhd) > 0 )
             disable_ats_device(pdev);
@@ -1676,8 +1664,8 @@ static int domain_context_unmap(struct domain *domain, u8 devfn,
 
     case DEV_TYPE_PCI:
         if ( iommu_debug )
-            printk(VTDPREFIX "d%d:PCI: unmap %04x:%02x:%02x.%u\n",
-                   domain->domain_id, seg, bus, PCI_SLOT(devfn), PCI_FUNC(devfn));
+            printk(VTDPREFIX "%pd:PCI: unmap %pp\n",
+                   domain, &PCI_SBDF3(seg, bus, devfn));
         ret = domain_context_unmap_one(domain, iommu, bus, devfn);
         if ( ret )
             break;
@@ -1702,9 +1690,8 @@ static int domain_context_unmap(struct domain *domain, u8 devfn,
         break;
 
     default:
-        dprintk(XENLOG_ERR VTDPREFIX, "d%d:unknown(%u): %04x:%02x:%02x.%u\n",
-                domain->domain_id, pdev->type,
-                seg, bus, PCI_SLOT(devfn), PCI_FUNC(devfn));
+        dprintk(XENLOG_ERR VTDPREFIX, "%pd:unknown(%u): %pp\n",
+                domain, pdev->type, &PCI_SBDF3(seg, bus, devfn));
         ret = -EINVAL;
         goto out;
     }
@@ -2462,12 +2449,11 @@ static int intel_iommu_assign_device(
             bool_t relaxed = !!(flag & XEN_DOMCTL_DEV_RDM_RELAXED);
 
             printk(XENLOG_GUEST "%s" VTDPREFIX
-                   " It's %s to assign %04x:%02x:%02x.%u"
-                   " with shared RMRR at %"PRIx64" for Dom%d.\n",
+                   " It's %s to assign %pp"
+                   " with shared RMRR at %"PRIx64" for %pd.\n",
                    relaxed ? XENLOG_WARNING : XENLOG_ERR,
                    relaxed ? "risky" : "disallowed",
-                   seg, bus, PCI_SLOT(devfn), PCI_FUNC(devfn),
-                   rmrr->base_address, d->domain_id);
+                   &PCI_SBDF3(seg, bus, devfn), rmrr->base_address, d);
             if ( !relaxed )
                 return -EPERM;
         }
@@ -2497,8 +2483,8 @@ static int intel_iommu_assign_device(
                 if ( rc )
                 {
                     printk(XENLOG_ERR VTDPREFIX
-                           " failed to reclaim %04x:%02x:%02x.%u from %pd (%d)\n",
-                           seg, bus, PCI_SLOT(devfn), PCI_FUNC(devfn), d, rc);
+                           " failed to reclaim %pp from %pd (%d)\n",
+                           &PCI_SBDF3(seg, bus, devfn), d, rc);
                     domain_crash(d);
                 }
                 break;
diff --git a/xen/drivers/passthrough/vtd/quirks.c b/xen/drivers/passthrough/vtd/quirks.c
index 5594270678..a8330f17bc 100644
--- a/xen/drivers/passthrough/vtd/quirks.c
+++ b/xen/drivers/passthrough/vtd/quirks.c
@@ -413,8 +413,6 @@ void pci_vtd_quirk(const struct pci_dev *pdev)
 {
     int seg = pdev->seg;
     int bus = pdev->bus;
-    int dev = PCI_SLOT(pdev->devfn);
-    int func = PCI_FUNC(pdev->devfn);
     int pos;
     bool_t ff;
     u32 val, val2;
@@ -438,8 +436,7 @@ void pci_vtd_quirk(const struct pci_dev *pdev)
     case 0x3c28: /* Sandybridge */
         val = pci_conf_read32(pdev->sbdf, 0x1AC);
         pci_conf_write32(pdev->sbdf, 0x1AC, val | (1 << 31));
-        printk(XENLOG_INFO "Masked VT-d error signaling on %04x:%02x:%02x.%u\n",
-               seg, bus, dev, func);
+        printk(XENLOG_INFO "Masked VT-d error signaling on %pp\n", &pdev->sbdf);
         break;
 
     /* Tylersburg (EP)/Boxboro (MP) chipsets (NHM-EP/EX, WSM-EP/EX) */
@@ -474,8 +471,7 @@ void pci_vtd_quirk(const struct pci_dev *pdev)
             ff = pcie_aer_get_firmware_first(pdev);
         if ( !pos )
         {
-            printk(XENLOG_WARNING "%04x:%02x:%02x.%u without AER capability?\n",
-                   seg, bus, dev, func);
+            printk(XENLOG_WARNING "%pp without AER capability?\n", &pdev->sbdf);
             break;
         }
 
@@ -498,8 +494,7 @@ void pci_vtd_quirk(const struct pci_dev *pdev)
         val = pci_conf_read32(pdev->sbdf, 0x20c);
         pci_conf_write32(pdev->sbdf, 0x20c, val | (1 << 4));
 
-        printk(XENLOG_INFO "%s UR signaling on %04x:%02x:%02x.%u\n",
-               action, seg, bus, dev, func);
+        printk(XENLOG_INFO "%s UR signaling on %pp\n", action, &pdev->sbdf);
         break;
 
     case 0x0040: case 0x0044: case 0x0048: /* Nehalem/Westmere */
@@ -524,16 +519,15 @@ void pci_vtd_quirk(const struct pci_dev *pdev)
             {
                 __set_bit(0x1c8 * 8 + 20, va);
                 iounmap(va);
-                printk(XENLOG_INFO "Masked UR signaling on %04x:%02x:%02x.%u\n",
-                       seg, bus, dev, func);
+                printk(XENLOG_INFO "Masked UR signaling on %pp\n", &pdev->sbdf);
             }
             else
-                printk(XENLOG_ERR "Could not map %"PRIpaddr" for %04x:%02x:%02x.%u\n",
-                       pa, seg, bus, dev, func);
+                printk(XENLOG_ERR "Could not map %"PRIpaddr" for %pp\n",
+                       pa, &pdev->sbdf);
         }
         else
-            printk(XENLOG_WARNING "Bogus DMIBAR %#"PRIx64" on %04x:%02x:%02x.%u\n",
-                   bar, seg, bus, dev, func);
+            printk(XENLOG_WARNING "Bogus DMIBAR %#"PRIx64" on %pp\n",
+                   bar, &pdev->sbdf);
         break;
     }
 }
diff --git a/xen/drivers/passthrough/vtd/utils.c b/xen/drivers/passthrough/vtd/utils.c
index 7552dd8e0c..4febcf506d 100644
--- a/xen/drivers/passthrough/vtd/utils.c
+++ b/xen/drivers/passthrough/vtd/utils.c
@@ -95,9 +95,9 @@ void print_vtd_entries(struct vtd_iommu *iommu, int bus, int devfn, u64 gmfn)
     u64 *l, val;
     u32 l_index, level;
 
-    printk("print_vtd_entries: iommu #%u dev %04x:%02x:%02x.%u gmfn %"PRI_gfn"\n",
-           iommu->index, iommu->drhd->segment, bus,
-           PCI_SLOT(devfn), PCI_FUNC(devfn), gmfn);
+    printk("print_vtd_entries: iommu #%u dev %pp gmfn %"PRI_gfn"\n",
+           iommu->index, &PCI_SBDF3(iommu->drhd->segment, bus, devfn),
+           gmfn);
 
     if ( iommu->root_maddr == 0 )
     {
diff --git a/xen/drivers/passthrough/x86/ats.c b/xen/drivers/passthrough/x86/ats.c
index 8ae0eae4a2..4628ffde45 100644
--- a/xen/drivers/passthrough/x86/ats.c
+++ b/xen/drivers/passthrough/x86/ats.c
@@ -32,8 +32,7 @@ int enable_ats_device(struct pci_dev *pdev, struct list_head *ats_list)
     BUG_ON(!pos);
 
     if ( iommu_verbose )
-        dprintk(XENLOG_INFO, "%04x:%02x:%02x.%u: ATS capability found\n",
-                seg, bus, PCI_SLOT(devfn), PCI_FUNC(devfn));
+        dprintk(XENLOG_INFO, "%pp: ATS capability found\n", &pdev->sbdf);
 
     value = pci_conf_read16(pdev->sbdf, pos + ATS_REG_CTL);
     if ( value & ATS_ENABLE )
@@ -64,9 +63,8 @@ int enable_ats_device(struct pci_dev *pdev, struct list_head *ats_list)
     }
 
     if ( iommu_verbose )
-        dprintk(XENLOG_INFO, "%04x:%02x:%02x.%u: ATS %s enabled\n",
-                seg, bus, PCI_SLOT(devfn), PCI_FUNC(devfn),
-                pos ? "is" : "was");
+        dprintk(XENLOG_INFO, "%pp: ATS %s enabled\n",
+                &pdev->sbdf, pos ? "is" : "was");
 
     return pos;
 }
@@ -74,8 +72,6 @@ int enable_ats_device(struct pci_dev *pdev, struct list_head *ats_list)
 void disable_ats_device(struct pci_dev *pdev)
 {
     u32 value;
-    u16 seg = pdev->seg;
-    u8 bus = pdev->bus, devfn = pdev->devfn;
 
     BUG_ON(!pdev->ats.cap_pos);
 
@@ -86,6 +82,5 @@ void disable_ats_device(struct pci_dev *pdev)
     list_del(&pdev->ats.list);
 
     if ( iommu_verbose )
-        dprintk(XENLOG_INFO, "%04x:%02x:%02x.%u: ATS is disabled\n",
-                seg, bus, PCI_SLOT(devfn), PCI_FUNC(devfn));
+        dprintk(XENLOG_INFO, "%pp: ATS is disabled\n", &pdev->sbdf);
 }
diff --git a/xen/drivers/vpci/header.c b/xen/drivers/vpci/header.c
index 3c794f486d..ba9a036202 100644
--- a/xen/drivers/vpci/header.c
+++ b/xen/drivers/vpci/header.c
@@ -355,7 +355,6 @@ static void bar_write(const struct pci_dev *pdev, unsigned int reg,
                       uint32_t val, void *data)
 {
     struct vpci_bar *bar = data;
-    uint8_t slot = PCI_SLOT(pdev->devfn), func = PCI_FUNC(pdev->devfn);
     bool hi = false;
 
     if ( bar->type == VPCI_BAR_MEM64_HI )
@@ -372,9 +371,8 @@ static void bar_write(const struct pci_dev *pdev, unsigned int reg,
         /* If the value written is the current one avoid printing a warning. */
         if ( val != (uint32_t)(bar->addr >> (hi ? 32 : 0)) )
             gprintk(XENLOG_WARNING,
-                    "%04x:%02x:%02x.%u: ignored BAR %lu write with memory decoding enabled\n",
-                    pdev->seg, pdev->bus, slot, func,
-                    bar - pdev->vpci->header.bars + hi);
+                    "%pp: ignored BAR %lu write with memory decoding enabled\n",
+                    &pdev->sbdf, bar - pdev->vpci->header.bars + hi);
         return;
     }
 
@@ -402,15 +400,14 @@ static void rom_write(const struct pci_dev *pdev, unsigned int reg,
 {
     struct vpci_header *header = &pdev->vpci->header;
     struct vpci_bar *rom = data;
-    uint8_t slot = PCI_SLOT(pdev->devfn), func = PCI_FUNC(pdev->devfn);
     uint16_t cmd = pci_conf_read16(pdev->sbdf, PCI_COMMAND);
     bool new_enabled = val & PCI_ROM_ADDRESS_ENABLE;
 
     if ( (cmd & PCI_COMMAND_MEMORY) && header->rom_enabled && new_enabled )
     {
         gprintk(XENLOG_WARNING,
-                "%04x:%02x:%02x.%u: ignored ROM BAR write with memory decoding enabled\n",
-                pdev->seg, pdev->bus, slot, func);
+                "%pp: ignored ROM BAR write with memory decoding enabled\n",
+                &pdev->sbdf);
         return;
     }
 
diff --git a/xen/drivers/vpci/msi.c b/xen/drivers/vpci/msi.c
index 75010762ed..65db438d24 100644
--- a/xen/drivers/vpci/msi.c
+++ b/xen/drivers/vpci/msi.c
@@ -289,8 +289,7 @@ void vpci_dump_msi(void)
             msi = pdev->vpci->msi;
             if ( msi && msi->enabled )
             {
-                printk("%04x:%02x:%02x.%u MSI\n", pdev->seg, pdev->bus,
-                       PCI_SLOT(pdev->devfn), PCI_FUNC(pdev->devfn));
+                printk("%pp MSI\n", &pdev->sbdf);
 
                 printk("  enabled: %d 64-bit: %d",
                        msi->enabled, msi->address64);
@@ -307,8 +306,7 @@ void vpci_dump_msi(void)
             {
                 int rc;
 
-                printk("%04x:%02x:%02x.%u MSI-X\n", pdev->seg, pdev->bus,
-                       PCI_SLOT(pdev->devfn), PCI_FUNC(pdev->devfn));
+                printk("%pp MSI-X\n", &pdev->sbdf);
 
                 printk("  entries: %u maskall: %d enabled: %d\n",
                        msix->max_entries, msix->masked, msix->enabled);
diff --git a/xen/drivers/vpci/msix.c b/xen/drivers/vpci/msix.c
index 38c1e7e5dd..64dd0a929c 100644
--- a/xen/drivers/vpci/msix.c
+++ b/xen/drivers/vpci/msix.c
@@ -42,15 +42,14 @@ static uint32_t control_read(const struct pci_dev *pdev, unsigned int reg,
 static int update_entry(struct vpci_msix_entry *entry,
                         const struct pci_dev *pdev, unsigned int nr)
 {
-    uint8_t slot = PCI_SLOT(pdev->devfn), func = PCI_FUNC(pdev->devfn);
     int rc = vpci_msix_arch_disable_entry(entry, pdev);
 
     /* Ignore ENOENT, it means the entry wasn't setup. */
     if ( rc && rc != -ENOENT )
     {
         gprintk(XENLOG_WARNING,
-                "%04x:%02x:%02x.%u: unable to disable entry %u for update: %d\n",
-                pdev->seg, pdev->bus, slot, func, nr, rc);
+                "%pp: unable to disable entry %u for update: %d\n",
+                &pdev->sbdf, nr, rc);
         return rc;
     }
 
@@ -59,9 +58,8 @@ static int update_entry(struct vpci_msix_entry *entry,
                                                       VPCI_MSIX_TABLE));
     if ( rc )
     {
-        gprintk(XENLOG_WARNING,
-                "%04x:%02x:%02x.%u: unable to enable entry %u: %d\n",
-                pdev->seg, pdev->bus, slot, func, nr, rc);
+        gprintk(XENLOG_WARNING, "%pp: unable to enable entry %u: %d\n",
+                &pdev->sbdf, nr, rc);
         /* Entry is likely not properly configured. */
         return rc;
     }
@@ -72,7 +70,6 @@ static int update_entry(struct vpci_msix_entry *entry,
 static void control_write(const struct pci_dev *pdev, unsigned int reg,
                           uint32_t val, void *data)
 {
-    uint8_t slot = PCI_SLOT(pdev->devfn), func = PCI_FUNC(pdev->devfn);
     struct vpci_msix *msix = data;
     bool new_masked = val & PCI_MSIX_FLAGS_MASKALL;
     bool new_enabled = val & PCI_MSIX_FLAGS_ENABLE;
@@ -133,9 +130,8 @@ static void control_write(const struct pci_dev *pdev, unsigned int reg,
                 /* Ignore non-present entry. */
                 break;
             default:
-                gprintk(XENLOG_WARNING,
-                        "%04x:%02x:%02x.%u: unable to disable entry %u: %d\n",
-                        pdev->seg, pdev->bus, slot, func, i, rc);
+                gprintk(XENLOG_WARNING, "%pp: unable to disable entry %u: %d\n",
+                        &pdev->sbdf, i, rc);
                 return;
             }
         }
@@ -180,8 +176,7 @@ static bool access_allowed(const struct pci_dev *pdev, unsigned long addr,
         return true;
 
     gprintk(XENLOG_WARNING,
-            "%04x:%02x:%02x.%u: unaligned or invalid size MSI-X table access\n",
-            pdev->seg, pdev->bus, PCI_SLOT(pdev->devfn), PCI_FUNC(pdev->devfn));
+            "%pp: unaligned or invalid size MSI-X table access\n", &pdev->sbdf);
 
     return false;
 }
@@ -431,10 +426,9 @@ int vpci_make_msix_hole(const struct pci_dev *pdev)
             default:
                 put_gfn(d, start);
                 gprintk(XENLOG_WARNING,
-                        "%04x:%02x:%02x.%u: existing mapping (mfn: %" PRI_mfn
+                        "%pp: existing mapping (mfn: %" PRI_mfn
                         "type: %d) at %#lx clobbers MSIX MMIO area\n",
-                        pdev->seg, pdev->bus, PCI_SLOT(pdev->devfn),
-                        PCI_FUNC(pdev->devfn), mfn_x(mfn), t, start);
+                        &pdev->sbdf, mfn_x(mfn), t, start);
                 return -EEXIST;
             }
             put_gfn(d, start);
-- 
2.27.0


