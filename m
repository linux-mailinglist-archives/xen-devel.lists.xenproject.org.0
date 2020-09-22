Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 464E6274459
	for <lists+xen-devel@lfdr.de>; Tue, 22 Sep 2020 16:34:00 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kKjMf-0006iN-9W; Tue, 22 Sep 2020 14:33:53 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=oGvm=C7=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1kKjMd-0006gf-8x
 for xen-devel@lists.xenproject.org; Tue, 22 Sep 2020 14:33:51 +0000
X-Inumbo-ID: 9593be0d-b259-48c7-9a90-c922b15846c7
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 9593be0d-b259-48c7-9a90-c922b15846c7;
 Tue, 22 Sep 2020 14:33:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1600785226;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=nappqkPpbVIOyvnsXfykbtVtzXCvUjaJYTRecbidlRc=;
 b=WMzq2CSbBklF4oZ8aaGtNmG2itzNBs5g65rxSF8yJtK5r5yab4O8hiqn
 1RkvkVgEyQ7VsVRAfYNmQLbQn95yAr1Kt2YZC1n8J6oLu5+YPfPnGClHk
 Ua/wGKYzYhw2zs86/dClzGwFbz3NM6CCSfNsVlsiuQGS0cRtzcfl6Hgut g=;
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: WW8l+QAYff65mmhtE6/6JG88ebN/JvjBG8/8RpD7EipkSLrcn2bzH+y4ZloCXeE/BEv4jD+EGN
 Bccz9K2n/FBBBLjOVqf94kf+18NsGtzNz2Ig5vJXyq1ONSYmDWZYA+BUCjtdwBcVpSFjR2Tv5a
 EKpZAiw5Swn0GL2bclHZhOPkI+wM3Ao0+oELWWxzL/UBRHkAIX6x0flxcqpmAdTD9ZvggvDRxg
 a62JvggNn+XpAL3YitSDHe5KmG5y5J7VjxrCp5yPhrf6+RWQ25DjkAoo7YC3g1GZhWv3i5UbXv
 be8=
X-SBRS: 2.7
X-MesageID: 28258106
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.77,291,1596513600"; d="scan'208";a="28258106"
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Roger Pau Monne <roger.pau@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <paul@xen.org>,
 "Kevin Tian" <kevin.tian@intel.com>
Subject: [PATCH 2/2] x86/iommu: remove code to fetch MSI message from remap
 table
Date: Tue, 22 Sep 2020 16:32:45 +0200
Message-ID: <20200922143245.44595-3-roger.pau@citrix.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200922143245.44595-1-roger.pau@citrix.com>
References: <20200922143245.44595-1-roger.pau@citrix.com>
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
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Remove the code to compose a MSI message based on the information from
the MSI registers and the data in the interrupt remapping table.
Since the removal of read_msi_msg and its user there's no longer a
need for such code, as the last written (untranslated) MSI message is
cached internally by Xen.

Suggested-by: Jan Beulich <jbeulich@suse.com>
Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/drivers/passthrough/amd/iommu.h         |  2 -
 xen/drivers/passthrough/amd/iommu_intr.c    | 41 -----------
 xen/drivers/passthrough/amd/pci_amd_iommu.c |  1 -
 xen/drivers/passthrough/pci.c               |  7 --
 xen/drivers/passthrough/vtd/extern.h        |  1 -
 xen/drivers/passthrough/vtd/intremap.c      | 76 ---------------------
 xen/drivers/passthrough/vtd/iommu.c         |  1 -
 xen/include/xen/iommu.h                     |  1 -
 8 files changed, 130 deletions(-)

diff --git a/xen/drivers/passthrough/amd/iommu.h b/xen/drivers/passthrough/amd/iommu.h
index e2d174f3b4..2cd87a5230 100644
--- a/xen/drivers/passthrough/amd/iommu.h
+++ b/xen/drivers/passthrough/amd/iommu.h
@@ -277,8 +277,6 @@ unsigned int amd_iommu_read_ioapic_from_ire(
     unsigned int apic, unsigned int reg);
 int amd_iommu_msi_msg_update_ire(
     struct msi_desc *msi_desc, struct msi_msg *msg);
-void amd_iommu_read_msi_from_ire(
-    struct msi_desc *msi_desc, struct msi_msg *msg);
 int amd_setup_hpet_msi(struct msi_desc *msi_desc);
 void amd_iommu_dump_intremap_tables(unsigned char key);
 
diff --git a/xen/drivers/passthrough/amd/iommu_intr.c b/xen/drivers/passthrough/amd/iommu_intr.c
index 0adee53fb8..d78bb209bc 100644
--- a/xen/drivers/passthrough/amd/iommu_intr.c
+++ b/xen/drivers/passthrough/amd/iommu_intr.c
@@ -659,47 +659,6 @@ int amd_iommu_msi_msg_update_ire(
     return rc;
 }
 
-void amd_iommu_read_msi_from_ire(
-    struct msi_desc *msi_desc, struct msi_msg *msg)
-{
-    unsigned int offset = msg->data & (INTREMAP_MAX_ENTRIES - 1);
-    const struct pci_dev *pdev = msi_desc->dev;
-    u16 bdf = pdev ? PCI_BDF2(pdev->bus, pdev->devfn) : hpet_sbdf.bdf;
-    u16 seg = pdev ? pdev->seg : hpet_sbdf.seg;
-    const struct amd_iommu *iommu = _find_iommu_for_device(seg, bdf);
-    union irte_ptr entry;
-
-    if ( IS_ERR_OR_NULL(iommu) )
-        return;
-
-    entry = get_intremap_entry(iommu, get_dma_requestor_id(seg, bdf), offset);
-
-    if ( msi_desc->msi_attrib.type == PCI_CAP_ID_MSI )
-    {
-        int nr = msi_desc->msi_attrib.entry_nr;
-
-        ASSERT(!(offset & (msi_desc[-nr].msi.nvec - 1)));
-        offset |= nr;
-    }
-
-    msg->data &= ~(INTREMAP_MAX_ENTRIES - 1);
-    /* The IntType fields match for both formats. */
-    msg->data |= MASK_INSR(entry.ptr32->flds.int_type,
-                           MSI_DATA_DELIVERY_MODE_MASK);
-    if ( iommu->ctrl.ga_en )
-    {
-        msg->data |= MASK_INSR(entry.ptr128->full.vector,
-                               MSI_DATA_VECTOR_MASK);
-        msg->dest32 = get_full_dest(entry.ptr128);
-    }
-    else
-    {
-        msg->data |= MASK_INSR(entry.ptr32->flds.vector,
-                               MSI_DATA_VECTOR_MASK);
-        msg->dest32 = entry.ptr32->flds.dest;
-    }
-}
-
 int amd_iommu_free_intremap_table(
     const struct amd_iommu *iommu, struct ivrs_mappings *ivrs_mapping,
     uint16_t bdf)
diff --git a/xen/drivers/passthrough/amd/pci_amd_iommu.c b/xen/drivers/passthrough/amd/pci_amd_iommu.c
index 3390c22cf3..304363f5d2 100644
--- a/xen/drivers/passthrough/amd/pci_amd_iommu.c
+++ b/xen/drivers/passthrough/amd/pci_amd_iommu.c
@@ -572,7 +572,6 @@ static const struct iommu_ops __initconstrel _iommu_ops = {
     .update_ire_from_apic = amd_iommu_ioapic_update_ire,
     .update_ire_from_msi = amd_iommu_msi_msg_update_ire,
     .read_apic_from_ire = amd_iommu_read_ioapic_from_ire,
-    .read_msi_from_ire = amd_iommu_read_msi_from_ire,
     .setup_hpet_msi = amd_setup_hpet_msi,
     .adjust_irq_affinities = iov_adjust_irq_affinities,
     .suspend = amd_iommu_suspend,
diff --git a/xen/drivers/passthrough/pci.c b/xen/drivers/passthrough/pci.c
index e54974bcb0..b035067975 100644
--- a/xen/drivers/passthrough/pci.c
+++ b/xen/drivers/passthrough/pci.c
@@ -1382,13 +1382,6 @@ int iommu_update_ire_from_msi(
            ? iommu_call(&iommu_ops, update_ire_from_msi, msi_desc, msg) : 0;
 }
 
-void iommu_read_msi_from_ire(
-    struct msi_desc *msi_desc, struct msi_msg *msg)
-{
-    if ( iommu_intremap )
-        iommu_vcall(&iommu_ops, read_msi_from_ire, msi_desc, msg);
-}
-
 static int iommu_add_device(struct pci_dev *pdev)
 {
     const struct domain_iommu *hd;
diff --git a/xen/drivers/passthrough/vtd/extern.h b/xen/drivers/passthrough/vtd/extern.h
index ada3c3098c..ad6c5f907b 100644
--- a/xen/drivers/passthrough/vtd/extern.h
+++ b/xen/drivers/passthrough/vtd/extern.h
@@ -85,7 +85,6 @@ void io_apic_write_remap_rte(unsigned int apic,
 
 struct msi_desc;
 struct msi_msg;
-void msi_msg_read_remap_rte(struct msi_desc *, struct msi_msg *);
 int msi_msg_write_remap_rte(struct msi_desc *, struct msi_msg *);
 
 int intel_setup_hpet_msi(struct msi_desc *);
diff --git a/xen/drivers/passthrough/vtd/intremap.c b/xen/drivers/passthrough/vtd/intremap.c
index 0d2a9d78de..d0f70d90eb 100644
--- a/xen/drivers/passthrough/vtd/intremap.c
+++ b/xen/drivers/passthrough/vtd/intremap.c
@@ -532,68 +532,6 @@ static void set_msi_source_id(struct pci_dev *pdev, struct iremap_entry *ire)
    }
 }
 
-static int remap_entry_to_msi_msg(
-    struct vtd_iommu *iommu, struct msi_msg *msg, unsigned int index)
-{
-    struct iremap_entry *iremap_entry = NULL, *iremap_entries;
-    struct msi_msg_remap_entry *remap_rte;
-    unsigned long flags;
-
-    remap_rte = (struct msi_msg_remap_entry *) msg;
-    index += (remap_rte->address_lo.index_15 << 15) |
-             remap_rte->address_lo.index_0_14;
-
-    if ( index >= IREMAP_ENTRY_NR )
-    {
-        dprintk(XENLOG_ERR VTDPREFIX,
-                "MSI index (%d) for remap table is invalid\n",
-                index);
-        return -EFAULT;
-    }
-
-    spin_lock_irqsave(&iommu->intremap.lock, flags);
-
-    GET_IREMAP_ENTRY(iommu->intremap.maddr, index,
-                     iremap_entries, iremap_entry);
-
-    if ( iremap_entry->val == 0 )
-    {
-        dprintk(XENLOG_ERR VTDPREFIX,
-                "MSI index (%d) has an empty entry\n",
-                index);
-        unmap_vtd_domain_page(iremap_entries);
-        spin_unlock_irqrestore(&iommu->intremap.lock, flags);
-        return -EFAULT;
-    }
-
-    msg->address_hi = MSI_ADDR_BASE_HI;
-    msg->address_lo =
-        MSI_ADDR_BASE_LO |
-        ((iremap_entry->remap.dm == 0) ?
-            MSI_ADDR_DESTMODE_PHYS:
-            MSI_ADDR_DESTMODE_LOGIC) |
-        ((iremap_entry->remap.dlm != dest_LowestPrio) ?
-            MSI_ADDR_REDIRECTION_CPU:
-            MSI_ADDR_REDIRECTION_LOWPRI);
-    if ( x2apic_enabled )
-        msg->dest32 = iremap_entry->remap.dst;
-    else
-        msg->dest32 = (iremap_entry->remap.dst >> 8) & 0xff;
-    msg->address_lo |= MSI_ADDR_DEST_ID(msg->dest32);
-
-    msg->data =
-        MSI_DATA_TRIGGER_EDGE |
-        MSI_DATA_LEVEL_ASSERT |
-        ((iremap_entry->remap.dlm != dest_LowestPrio) ?
-            MSI_DATA_DELIVERY_FIXED:
-            MSI_DATA_DELIVERY_LOWPRI) |
-        iremap_entry->remap.vector;
-
-    unmap_vtd_domain_page(iremap_entries);
-    spin_unlock_irqrestore(&iommu->intremap.lock, flags);
-    return 0;
-}
-
 static int msi_msg_to_remap_entry(
     struct vtd_iommu *iommu, struct pci_dev *pdev,
     struct msi_desc *msi_desc, struct msi_msg *msg)
@@ -701,20 +639,6 @@ static int msi_msg_to_remap_entry(
     return 0;
 }
 
-void msi_msg_read_remap_rte(
-    struct msi_desc *msi_desc, struct msi_msg *msg)
-{
-    struct pci_dev *pdev = msi_desc->dev;
-    struct acpi_drhd_unit *drhd = NULL;
-
-    drhd = pdev ? acpi_find_matched_drhd_unit(pdev)
-                : hpet_to_drhd(msi_desc->hpet_id);
-    if ( drhd )
-        remap_entry_to_msi_msg(drhd->iommu, msg,
-                               msi_desc->msi_attrib.type == PCI_CAP_ID_MSI
-                               ? msi_desc->msi_attrib.entry_nr : 0);
-}
-
 int msi_msg_write_remap_rte(
     struct msi_desc *msi_desc, struct msi_msg *msg)
 {
diff --git a/xen/drivers/passthrough/vtd/iommu.c b/xen/drivers/passthrough/vtd/iommu.c
index 94e0455a4d..1ee4baff36 100644
--- a/xen/drivers/passthrough/vtd/iommu.c
+++ b/xen/drivers/passthrough/vtd/iommu.c
@@ -2745,7 +2745,6 @@ static struct iommu_ops __initdata vtd_ops = {
     .update_ire_from_apic = io_apic_write_remap_rte,
     .update_ire_from_msi = msi_msg_write_remap_rte,
     .read_apic_from_ire = io_apic_read_remap_rte,
-    .read_msi_from_ire = msi_msg_read_remap_rte,
     .setup_hpet_msi = intel_setup_hpet_msi,
     .adjust_irq_affinities = adjust_vtd_irq_affinities,
     .suspend = vtd_suspend,
diff --git a/xen/include/xen/iommu.h b/xen/include/xen/iommu.h
index 3272874958..fde5fdc415 100644
--- a/xen/include/xen/iommu.h
+++ b/xen/include/xen/iommu.h
@@ -194,7 +194,6 @@ struct msi_desc;
 struct msi_msg;
 
 int iommu_update_ire_from_msi(struct msi_desc *msi_desc, struct msi_msg *msg);
-void iommu_read_msi_from_ire(struct msi_desc *msi_desc, struct msi_msg *msg);
 
 #define PT_IRQ_TIME_OUT MILLISECS(8)
 #endif /* HAS_PCI */
-- 
2.28.0


