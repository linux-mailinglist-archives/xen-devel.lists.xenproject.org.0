Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D2FB56247CB
	for <lists+xen-devel@lfdr.de>; Thu, 10 Nov 2022 18:00:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.442033.696113 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1otAuM-0004KF-TL; Thu, 10 Nov 2022 17:00:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 442033.696113; Thu, 10 Nov 2022 17:00:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1otAuM-0004Fr-PW; Thu, 10 Nov 2022 17:00:06 +0000
Received: by outflank-mailman (input) for mailman id 442033;
 Thu, 10 Nov 2022 17:00:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=DqAE=3K=gmail.com=d.vrabel.98@srs-se1.protection.inumbo.net>)
 id 1otAuK-0002uf-TZ
 for xen-devel@lists.xenproject.org; Thu, 10 Nov 2022 17:00:05 +0000
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [2a00:1450:4864:20::332])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1ea114a4-6119-11ed-8fd2-01056ac49cbb;
 Thu, 10 Nov 2022 18:00:03 +0100 (CET)
Received: by mail-wm1-x332.google.com with SMTP id
 h133-20020a1c218b000000b003cf4d389c41so3893540wmh.3
 for <xen-devel@lists.xenproject.org>; Thu, 10 Nov 2022 09:00:03 -0800 (PST)
Received: from pear.davidvrabel.org.uk (pear.davidvrabel.org.uk.
 [82.70.146.41]) by smtp.googlemail.com with ESMTPSA id
 j5-20020a05600c1c0500b003cfbbd54178sm9403666wms.2.2022.11.10.09.00.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Nov 2022 09:00:02 -0800 (PST)
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
X-Inumbo-ID: 1ea114a4-6119-11ed-8fd2-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dhv0GF+4ldSl9zCEdd3fJE2z3jaTvmUFTFv68dRAO/4=;
        b=IRHDhysvNWJWMsqBjN/T1DE6hOaiVDieZCMNS0K82fU3npGmvQfhh2jR+bmXZy3lLW
         L4yCcXuLxxl8R1YGF58dI5Y50XUPGnXhdoMYyCNMJo0dfBaY4wmHMIrKjkuNcDggEbhg
         zTdgHcgGJZgmKsVpRgwO2O0JFKbeuPjzAE8cidqiA/qOpODgqhWumRrjCiBBiI5Kvlub
         bJg4CCaPWtv/Ewer0VfcGMMxB1LBvtdlhSCkigtRaFtuxYpIe+5/gsNjmwHmR7NmW9pR
         0Jq64EdHo7lU0Dc2JmX58nJTbDH8Tkwrtx8iZoGZP6u2nC955WZ9twM64aeS4svzyrrv
         aiwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=dhv0GF+4ldSl9zCEdd3fJE2z3jaTvmUFTFv68dRAO/4=;
        b=lEt8OCFO/S9DrHQ+0v2JR/Wrx+9Egm/R/ed68PwhC39jlmdENq/qWH+Pi1cLRm/ipu
         qNvhTOv8B2KtCR1JQyMEx7PbN/cHqgrOWKHzbvuGgknA8oHL/33NsvTuqI8ounwVi2Ib
         +60ltZYedXmk+wM6uNL/fFBFSrxAZXuQsXUUnwypIRKxcN8l0vEdfGq6RSdzMSlRgpmC
         O1/smy7+l76Gohom8fuvwsI1rknMLQUQmKZ8igok5ox6uZGTGJQCWJKOjYFVLekdVJ7l
         /qBNQR3Xu81WZ5F+k6ye060kciXT6CNlXudAXzsEr2IQHW+p0Ra7QhkS9m/UWd0hqV4D
         diOg==
X-Gm-Message-State: ACrzQf2Dda4MINtYxJCZumi3hoqyhhLmqSwbErNOZ8HD6AY61slwYwrY
	gq5RK2cDY/4O8X2ze6UUg6+cqfcJhZPMGg==
X-Google-Smtp-Source: AMsMyM5uvX6gpkkiFwXXfo8XmYbzXmlGMvesWd1fEUHxGEBga/cz37onbiuekcmb+5yuh8J7lsAsvA==
X-Received: by 2002:a7b:c5d8:0:b0:3cf:9cd9:a889 with SMTP id n24-20020a7bc5d8000000b003cf9cd9a889mr20999323wmk.26.1668099603118;
        Thu, 10 Nov 2022 09:00:03 -0800 (PST)
Sender: David Vrabel <d.vrabel.98@gmail.com>
From: David Vrabel <dvrabel@cantab.net>
X-Google-Original-From: David Vrabel <dvrabel@amazon.co.uk>
To: xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>,
	David Vrabel <dvrabel@amazon.co.uk>
Subject: [PATCH 3/3] x86/pci: Fix racy accesses to MSI-X Control register
Date: Thu, 10 Nov 2022 16:59:35 +0000
Message-Id: <20221110165935.106376-4-dvrabel@amazon.co.uk>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221110165935.106376-1-dvrabel@amazon.co.uk>
References: <20221110165935.106376-1-dvrabel@amazon.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Concurrent access the the MSI-X control register are not serialized
with a suitable lock. For example, in msix_capability_init() access
use the pcidevs_lock() but some calls to msi_set_mask_bit() use the
interrupt descriptor lock.

This can lead to MSI-X being incorrectly disabled and subsequent
failures due to msix_memory_decoded() calls that check for MSI-X being
enabled.

This was seen with some non-compliant hardware that gated MSI-X
messages on the per-vector mask bit only (i.e., the MSI-X Enable bit
and Function Mask bits in the MSI-X Control register were ignored). An
interrupt (with a pending move) for vector 0 would occur while vector
1 was being initialized in msix_capability_init(). Updates the the
Control register would race and the vector 1 initialization would
intermittently fail with -ENXIO.

Typically a race between initializing a vector and another vector
being moved doesn't occur because:

1. Racy Control accesses only occur when MSI-X is (guest) disabled

2  Hardware should only raise interrupts when MSI-X is enabled and unmasked.

3. Xen always sets Function Mask when temporarily enabling MSI-X.

But there may be other race conditions depending on hardware and guest
driver behaviour (e.g., disabling MSI-X when a IRQ has a pending move
on another PCPU).

Fix this by:

1. Tracking the host and guest enable state in a similar way to the
   host and guest maskall state. Note that since multiple CPUs can be
   updating different vectors concurrently, a counter is needed for
   the host enable state.

2. Add a new lock for serialize the Control read/modify/write
   sequence.

3. Wrap the above in two helper functions (msix_update_lock(), and
   msix_update_unlock()), which bracket any MSI-X register updates
   that require MSI-X to be (temporarily) enabled.

Signed-off-by: David Vrabel <dvrabel@amazon.co.uk>
SIM: https://t.corp.amazon.com/P63914633

CR: https://code.amazon.com/reviews/CR-79020945
---
 xen/arch/x86/include/asm/msi.h |   3 +
 xen/arch/x86/msi.c             | 215 +++++++++++++++++----------------
 xen/drivers/passthrough/msi.c  |   1 +
 3 files changed, 114 insertions(+), 105 deletions(-)

diff --git a/xen/arch/x86/include/asm/msi.h b/xen/arch/x86/include/asm/msi.h
index fe670895ee..aa36e44f4e 100644
--- a/xen/arch/x86/include/asm/msi.h
+++ b/xen/arch/x86/include/asm/msi.h
@@ -237,7 +237,10 @@ struct arch_msix {
     int table_refcnt[MAX_MSIX_TABLE_PAGES];
     int table_idx[MAX_MSIX_TABLE_PAGES];
     spinlock_t table_lock;
+    spinlock_t control_lock;
     bool host_maskall, guest_maskall;
+    uint16_t host_enable;
+    bool guest_enable;
     domid_t warned;
 };
 
diff --git a/xen/arch/x86/msi.c b/xen/arch/x86/msi.c
index 6c675d11d1..8e394da07a 100644
--- a/xen/arch/x86/msi.c
+++ b/xen/arch/x86/msi.c
@@ -147,6 +147,57 @@ static bool msix_memory_decoded(const struct pci_dev *dev, unsigned int pos)
     return memory_decoded(dev);
 }
 
+
+/*
+ * Ensure MSI-X interrupts are masked during setup. Some devices require
+ * MSI-X to be enabled before we can touch the MSI-X registers. We need
+ * to mask all the vectors to prevent interrupts coming in before they're
+ * fully set up.
+ */
+static uint16_t msix_update_lock(struct pci_dev *dev, unsigned int pos)
+{
+    uint16_t control, new_control;
+    unsigned long flags;
+
+    spin_lock_irqsave(&dev->msix->control_lock, flags);
+
+    dev->msix->host_enable++;
+
+    control = pci_conf_read16(dev->sbdf, msix_control_reg(pos));
+    if ( !(control & PCI_MSIX_FLAGS_ENABLE) )
+    {
+        new_control = control | PCI_MSIX_FLAGS_ENABLE | PCI_MSIX_FLAGS_MASKALL;
+        pci_conf_write16(dev->sbdf, msix_control_reg(pos), new_control);
+    }
+    else
+        dev->msix->guest_enable = true;
+
+    spin_unlock_irqrestore(&dev->msix->control_lock, flags);
+
+    return control;
+}
+
+static void msix_update_unlock(struct pci_dev *dev, unsigned int pos, uint16_t control)
+{
+    uint16_t new_control;
+    unsigned long flags;
+
+    spin_lock_irqsave(&dev->msix->control_lock, flags);
+
+    dev->msix->host_enable--;
+
+    new_control = control & ~(PCI_MSIX_FLAGS_ENABLE | PCI_MSIX_FLAGS_MASKALL);
+
+    if ( dev->msix->host_enable || dev->msix->guest_enable )
+        new_control |= PCI_MSIX_FLAGS_ENABLE;
+    if ( dev->msix->host_maskall || dev->msix->guest_maskall || dev->msix->host_enable )
+        new_control |= PCI_MSIX_FLAGS_MASKALL;
+    if ( new_control != control )
+        pci_conf_write16(dev->sbdf, msix_control_reg(pos), control);
+
+    spin_unlock_irqrestore(&dev->msix->control_lock, flags);
+}
+
 /*
  * MSI message composition
  */
@@ -288,7 +339,7 @@ static void msi_set_enable(struct pci_dev *dev, int enable)
         __msi_set_enable(seg, bus, slot, func, pos, enable);
 }
 
-static void msix_set_enable(struct pci_dev *dev, int enable)
+static void msix_force_disable(struct pci_dev *dev)
 {
     int pos;
     u16 control, seg = dev->seg;
@@ -299,11 +350,16 @@ static void msix_set_enable(struct pci_dev *dev, int enable)
     pos = pci_find_cap_offset(seg, bus, slot, func, PCI_CAP_ID_MSIX);
     if ( pos )
     {
+        spin_lock_irq(&dev->msix->control_lock);
+
+        dev->msix->host_enable = false;
+        dev->msix->guest_enable = false;
+
         control = pci_conf_read16(dev->sbdf, msix_control_reg(pos));
         control &= ~PCI_MSIX_FLAGS_ENABLE;
-        if ( enable )
-            control |= PCI_MSIX_FLAGS_ENABLE;
         pci_conf_write16(dev->sbdf, msix_control_reg(pos), control);
+
+        spin_unlock_irq(&dev->msix->control_lock);
     }
 }
 
@@ -318,9 +374,10 @@ static void msi_set_mask_bit(struct irq_desc *desc, bool host, bool guest)
 {
     struct msi_desc *entry = desc->msi_desc;
     struct pci_dev *pdev;
-    u16 seg, control;
+    u16 seg;
     u8 bus, slot, func;
-    bool flag = host || guest, maskall;
+    bool flag = host || guest;
+    uint16_t control;
 
     ASSERT(spin_is_locked(&desc->lock));
     BUG_ON(!entry || !entry->dev);
@@ -343,30 +400,18 @@ static void msi_set_mask_bit(struct irq_desc *desc, bool host, bool guest)
         }
         break;
     case PCI_CAP_ID_MSIX:
-        maskall = pdev->msix->host_maskall;
-        control = pci_conf_read16(pdev->sbdf,
-                                  msix_control_reg(entry->msi_attrib.pos));
-        if ( unlikely(!(control & PCI_MSIX_FLAGS_ENABLE)) )
-        {
-            pdev->msix->host_maskall = 1;
-            pci_conf_write16(pdev->sbdf,
-                             msix_control_reg(entry->msi_attrib.pos),
-                             control | (PCI_MSIX_FLAGS_ENABLE |
-                                        PCI_MSIX_FLAGS_MASKALL));
-        }
+        control = msix_update_lock(pdev, entry->msi_attrib.pos);
+
         if ( likely(memory_decoded(pdev)) )
         {
             writel(flag, entry->mask_base + PCI_MSIX_ENTRY_VECTOR_CTRL_OFFSET);
             readl(entry->mask_base + PCI_MSIX_ENTRY_VECTOR_CTRL_OFFSET);
-
-            if ( likely(control & PCI_MSIX_FLAGS_ENABLE) )
-                break;
         }
-        else if ( flag && !(control & PCI_MSIX_FLAGS_MASKALL) )
+        else if ( !pdev->msix->host_maskall && !pdev->msix->guest_maskall )
         {
             domid_t domid = pdev->domain->domain_id;
 
-            maskall = true;
+            pdev->msix->host_maskall = true;
             if ( pdev->msix->warned != domid )
             {
                 pdev->msix->warned = domid;
@@ -375,11 +420,8 @@ static void msi_set_mask_bit(struct irq_desc *desc, bool host, bool guest)
                        desc->irq, domid, &pdev->sbdf);
             }
         }
-        pdev->msix->host_maskall = maskall;
-        if ( maskall || pdev->msix->guest_maskall )
-            control |= PCI_MSIX_FLAGS_MASKALL;
-        pci_conf_write16(pdev->sbdf,
-                         msix_control_reg(entry->msi_attrib.pos), control);
+
+        msix_update_unlock(pdev, entry->msi_attrib.pos, control);
         break;
     }
     entry->msi_attrib.host_masked = host;
@@ -494,26 +536,19 @@ static struct msi_desc *alloc_msi_entry(unsigned int nr)
 
 int setup_msi_irq(struct irq_desc *desc, struct msi_desc *msidesc)
 {
-    const struct pci_dev *pdev = msidesc->dev;
-    unsigned int cpos = msix_control_reg(msidesc->msi_attrib.pos);
-    u16 control = ~0;
+    struct pci_dev *pdev = msidesc->dev;
+    uint16_t control = 0;
     int rc;
 
     if ( msidesc->msi_attrib.type == PCI_CAP_ID_MSIX )
-    {
-        control = pci_conf_read16(pdev->sbdf, cpos);
-        if ( !(control & PCI_MSIX_FLAGS_ENABLE) )
-            pci_conf_write16(pdev->sbdf, cpos,
-                             control | (PCI_MSIX_FLAGS_ENABLE |
-                                        PCI_MSIX_FLAGS_MASKALL));
-    }
+        control = msix_update_lock(pdev, msidesc->msi_attrib.pos);
 
     rc = __setup_msi_irq(desc, msidesc,
                          msi_maskable_irq(msidesc) ? &pci_msi_maskable
                                                    : &pci_msi_nonmaskable);
 
-    if ( !(control & PCI_MSIX_FLAGS_ENABLE) )
-        pci_conf_write16(pdev->sbdf, cpos, control);
+    if ( control )
+        msix_update_unlock(pdev, msidesc->msi_attrib.pos, control);
 
     return rc;
 }
@@ -754,14 +789,14 @@ static int msix_capability_init(struct pci_dev *dev,
 {
     struct arch_msix *msix = dev->msix;
     struct msi_desc *entry = NULL;
-    u16 control;
     u64 table_paddr;
     u32 table_offset;
     u16 seg = dev->seg;
     u8 bus = dev->bus;
     u8 slot = PCI_SLOT(dev->devfn);
     u8 func = PCI_FUNC(dev->devfn);
-    bool maskall = msix->host_maskall;
+    uint16_t control;
+    int ret = 0;
     unsigned int pos = pci_find_cap_offset(seg, bus, slot, func,
                                            PCI_CAP_ID_MSIX);
 
@@ -770,37 +805,22 @@ static int msix_capability_init(struct pci_dev *dev,
 
     ASSERT(pcidevs_locked());
 
-    control = pci_conf_read16(dev->sbdf, msix_control_reg(pos));
-    /*
-     * Ensure MSI-X interrupts are masked during setup. Some devices require
-     * MSI-X to be enabled before we can touch the MSI-X registers. We need
-     * to mask all the vectors to prevent interrupts coming in before they're
-     * fully set up.
-     */
-    msix->host_maskall = 1;
-    pci_conf_write16(dev->sbdf, msix_control_reg(pos),
-                     control | (PCI_MSIX_FLAGS_ENABLE |
-                                PCI_MSIX_FLAGS_MASKALL));
-
-    if ( unlikely(!memory_decoded(dev)) )
-    {
-        pci_conf_write16(dev->sbdf, msix_control_reg(pos),
-                         control & ~PCI_MSIX_FLAGS_ENABLE);
-        return -ENXIO;
-    }
-
     if ( desc )
     {
         entry = alloc_msi_entry(1);
         if ( !entry )
-        {
-            pci_conf_write16(dev->sbdf, msix_control_reg(pos),
-                             control & ~PCI_MSIX_FLAGS_ENABLE);
             return -ENOMEM;
-        }
         ASSERT(msi);
     }
 
+    control = msix_update_lock(dev, pos);
+
+    if ( unlikely(!memory_decoded(dev)) )
+    {
+        ret = -ENXIO;
+        goto out;
+    }
+
     /* Locate MSI-X table region */
     table_offset = pci_conf_read32(dev->sbdf, msix_table_offset_reg(pos));
     if ( !msix->used_entries &&
@@ -834,10 +854,8 @@ static int msix_capability_init(struct pci_dev *dev,
         {
             if ( !msi || !msi->table_base )
             {
-                pci_conf_write16(dev->sbdf, msix_control_reg(pos),
-                                 control & ~PCI_MSIX_FLAGS_ENABLE);
-                xfree(entry);
-                return -ENXIO;
+                ret = -ENXIO;
+                goto out;
             }
             table_paddr = msi->table_base;
         }
@@ -863,9 +881,8 @@ static int msix_capability_init(struct pci_dev *dev,
     }
     else if ( !msix->table.first )
     {
-        pci_conf_write16(dev->sbdf, msix_control_reg(pos), control);
-        xfree(entry);
-        return -ENODATA;
+        ret = -ENODATA;
+        goto out;
     }
     else
         table_paddr = (msix->table.first << PAGE_SHIFT) +
@@ -880,9 +897,8 @@ static int msix_capability_init(struct pci_dev *dev,
 
         if ( idx < 0 )
         {
-            pci_conf_write16(dev->sbdf, msix_control_reg(pos), control);
-            xfree(entry);
-            return idx;
+            ret = idx;
+            goto out;
         }
         base = fix_to_virt(idx) + (entry_paddr & (PAGE_SIZE - 1));
 
@@ -906,12 +922,6 @@ static int msix_capability_init(struct pci_dev *dev,
 
     if ( !msix->used_entries )
     {
-        maskall = false;
-        if ( !msix->guest_maskall )
-            control &= ~PCI_MSIX_FLAGS_MASKALL;
-        else
-            control |= PCI_MSIX_FLAGS_MASKALL;
-
         if ( rangeset_add_range(mmio_ro_ranges, msix->table.first,
                                 msix->table.last) )
             WARN();
@@ -940,23 +950,13 @@ static int msix_capability_init(struct pci_dev *dev,
     WARN_ON(msix->table.first != (table_paddr >> PAGE_SHIFT));
     ++msix->used_entries;
 
-    /* Restore MSI-X enabled bits */
-    if ( !hardware_domain )
-    {
-        /*
-         * ..., except for internal requests (before Dom0 starts), in which
-         * case we rather need to behave "normally", i.e. not follow the split
-         * brain model where Dom0 actually enables MSI (and disables INTx).
-         */
-        pci_intx(dev, false);
-        control |= PCI_MSIX_FLAGS_ENABLE;
-        control &= ~PCI_MSIX_FLAGS_MASKALL;
-        maskall = 0;
-    }
-    msix->host_maskall = maskall;
-    pci_conf_write16(dev->sbdf, msix_control_reg(pos), control);
+  out:
+    if ( ret < 0 )
+        xfree(entry);
 
-    return 0;
+    msix_update_unlock(dev, pos, control);
+
+    return ret;
 }
 
 /**
@@ -1180,7 +1180,7 @@ void pci_cleanup_msi(struct pci_dev *pdev)
 {
     /* Disable MSI and/or MSI-X */
     msi_set_enable(pdev, 0);
-    msix_set_enable(pdev, 0);
+    msix_force_disable(pdev);
     msi_free_irqs(pdev);
 }
 
@@ -1229,11 +1229,20 @@ int pci_msi_conf_write_intercept(struct pci_dev *pdev, unsigned int reg,
             if ( reg != msix_control_reg(pos) || size != 2 )
                 return -EACCES;
 
+            spin_lock_irq(&pdev->msix->control_lock);
+
+            pdev->msix->guest_enable = !!(*data & PCI_MSIX_FLAGS_ENABLE);
+            if ( pdev->msix->host_enable )
+                *data |= PCI_MSIX_FLAGS_ENABLE;
             pdev->msix->guest_maskall = !!(*data & PCI_MSIX_FLAGS_MASKALL);
             if ( pdev->msix->host_maskall )
                 *data |= PCI_MSIX_FLAGS_MASKALL;
 
-            return 1;
+            pci_conf_write16(pdev->sbdf, reg, *data);
+
+            spin_unlock_irq(&pdev->msix->control_lock);
+
+            return -EPERM; /* Already done the write. */
         }
     }
 
@@ -1324,15 +1333,12 @@ int pci_restore_msi_state(struct pci_dev *pdev)
         }
         else if ( !type && entry->msi_attrib.type == PCI_CAP_ID_MSIX )
         {
-            control = pci_conf_read16(pdev->sbdf, msix_control_reg(pos));
-            pci_conf_write16(pdev->sbdf, msix_control_reg(pos),
-                             control | (PCI_MSIX_FLAGS_ENABLE |
-                                        PCI_MSIX_FLAGS_MASKALL));
+            control = msix_update_lock(pdev, pos);
+
             if ( unlikely(!memory_decoded(pdev)) )
             {
+                msix_update_unlock(pdev, pos, control);
                 spin_unlock_irqrestore(&desc->lock, flags);
-                pci_conf_write16(pdev->sbdf, msix_control_reg(pos),
-                                 control & ~PCI_MSIX_FLAGS_ENABLE);
                 return -ENXIO;
             }
         }
@@ -1372,8 +1378,7 @@ int pci_restore_msi_state(struct pci_dev *pdev)
     }
 
     if ( type == PCI_CAP_ID_MSIX )
-        pci_conf_write16(pdev->sbdf, msix_control_reg(pos),
-                         control | PCI_MSIX_FLAGS_ENABLE);
+        msix_update_unlock(pdev, pos, control);
 
     return 0;
 }
diff --git a/xen/drivers/passthrough/msi.c b/xen/drivers/passthrough/msi.c
index ce1a450f6f..436c78b7aa 100644
--- a/xen/drivers/passthrough/msi.c
+++ b/xen/drivers/passthrough/msi.c
@@ -44,6 +44,7 @@ int pdev_msi_init(struct pci_dev *pdev)
             return -ENOMEM;
 
         spin_lock_init(&msix->table_lock);
+        spin_lock_init(&msix->control_lock);
 
         ctrl = pci_conf_read16(pdev->sbdf, msix_control_reg(pos));
         msix->nr_entries = msix_table_size(ctrl);
-- 
2.30.2


