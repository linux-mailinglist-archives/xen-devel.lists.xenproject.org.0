Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 56C792C6A09
	for <lists+xen-devel@lfdr.de>; Fri, 27 Nov 2020 17:46:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.39650.72610 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kigsf-00065Z-Sa; Fri, 27 Nov 2020 16:45:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 39650.72610; Fri, 27 Nov 2020 16:45:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kigsf-00065A-P4; Fri, 27 Nov 2020 16:45:57 +0000
Received: by outflank-mailman (input) for mailman id 39650;
 Fri, 27 Nov 2020 16:45:56 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=rmeX=FB=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kigse-000655-Ia
 for xen-devel@lists.xenproject.org; Fri, 27 Nov 2020 16:45:56 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 26455de0-733f-40f1-a73f-482feed4813a;
 Fri, 27 Nov 2020 16:45:54 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 8C2C2AE9A;
 Fri, 27 Nov 2020 16:45:53 +0000 (UTC)
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
X-Inumbo-ID: 26455de0-733f-40f1-a73f-482feed4813a
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1606495553; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=QhDNPqpolbcP9N01lFwbxNevKi4DbrqrkaefBn/SE7k=;
	b=uhOWtCRCYE3lgiUOYb1Ecvh0klVekRWIAb+BvQ2hyMpOY+tyZu4S+WTMWNPhMkdAdkTHLL
	A7gTaxAK53+QtaNw9PKQ6EAtBEoFjY9IX56zXe983tFUR9jDbt1yttrqFxv8G4GeooPAxB
	lbaQ3S3TMT8p2zFBxNtHeyqz2CnxDrw=
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v4] IOMMU: make DMA containment of quarantined devices
 optional
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <paul@xen.org>,
 Kevin Tian <kevin.tian@intel.com>
Message-ID: <c78e09fa-606c-c6c4-e9db-b57cb50ee5e2@suse.com>
Date: Fri, 27 Nov 2020 17:45:54 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Containing still in flight DMA was introduced to work around certain
devices / systems hanging hard upon hitting a "not-present" IOMMU fault.
Passing through (such) devices (on such systems) is inherently insecure
(as guests could easily arrange for IOMMU faults of any kind to occur).
Defaulting to a mode where admins may not even become aware of issues
with devices can be considered undesirable. Therefore convert this mode
of operation to an optional one, not one enabled by default.

This involves resurrecting code commit ea38867831da ("x86 / iommu: set
up a scratch page in the quarantine domain") did remove, in a slightly
extended and abstracted fashion. Here, instead of reintroducing a pretty
pointless use of "goto" in domain_context_unmap(), and instead of making
the function (at least temporarily) inconsistent, take the opportunity
and replace the other similarly pointless "goto" as well.

In order to key the re-instated bypasses off of there (not) being a root
page table this further requires moving the allocate_domain_resources()
invocation from reassign_device() to amd_iommu_setup_domain_device() (or
else reassign_device() would allocate a root page table anyway); this is
benign to the second caller of the latter function.

Take the opportunity and also limit the control to builds supporting
PCI.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
v4: "full" -> "scratch_page". Duplicate Kconfig help text into command
    line doc. Re-base.
v3: IOMMU_quarantine_basic -> IOMMU_quarantine_fault,
    IOMMU_quarantine_full -> IOMMU_quarantine_write_fault. Kconfig
    option (choice) to select default. Limit to HAS_PCI.
v2: Don't use true/false. Introduce QUARANTINE_SKIP() (albeit I'm not
    really convinced this is an improvement). Add comment.

--- a/docs/misc/xen-command-line.pandoc
+++ b/docs/misc/xen-command-line.pandoc
@@ -1278,7 +1278,7 @@ detection of systems known to misbehave
 > Default: `new` unless directed-EOI is supported
 
 ### iommu
-    = List of [ <bool>, verbose, debug, force, required, quarantine,
+    = List of [ <bool>, verbose, debug, force, required, quarantine[=scratch-page],
                 sharept, intremap, intpost, crash-disable,
                 snoop, qinval, igfx, amd-iommu-perdev-intremap,
                 dom0-{passthrough,strict} ]
@@ -1316,11 +1316,32 @@ boolean (e.g. `iommu=no`) can override t
     will prevent Xen from booting if IOMMUs aren't discovered and enabled
     successfully.
 
-*   The `quarantine` boolean can be used to control Xen's behavior when
-    de-assigning devices from guests.  If enabled (the default), Xen always
+*   The `quarantine` option can be used to control Xen's behavior when
+    de-assigning devices from guests.
+
+    When a PCI device is assigned to an untrusted domain, it is possible
+    for that domain to program the device to DMA to an arbitrary address.
+    The IOMMU is used to protect the host from malicious DMA by making
+    sure that the device addresses can only target memory assigned to the
+    guest.  However, when the guest domain is torn down, assigning the
+    device back to the hardware domain would allow any in-flight DMA to
+    potentially target critical host data.  To avoid this, quarantining
+    should be enabled.  Quarantining can be done in two ways: In its basic
+    form, all in-flight DMA will simply be forced to encounter IOMMU
+    faults.  Since there are systems where doing so can cause host lockup,
+    an alternative form is available where writes to memory will be made
+    fault, but reads will be directed to a dummy page.  The implication
+    here is that such reads will go unnoticed, i.e. an admin may not
+    become aware of the underlying problem.
+
+    Therefore, if this option is set to true (the default), Xen always
     quarantines such devices; they must be explicitly assigned back to Dom0
-    before they can be used there again.  If disabled, Xen will only
-    quarantine devices the toolstack hass arranged for getting quarantined.
+    before they can be used there again.  If set to "scratch-page", still
+    active DMA reads will additionally be directed to a "scratch" page.  If
+    set to false, Xen will only quarantine devices the toolstack has arranged
+    for getting quarantined.
+
+    This option is only valid on builds supporting PCI.
 
 *   The `sharept` boolean controls whether the IOMMU pagetables are shared
     with the CPU-side HAP pagetables, or allocated separately.  Sharing
--- a/xen/drivers/passthrough/Kconfig
+++ b/xen/drivers/passthrough/Kconfig
@@ -28,3 +28,31 @@ endif
 
 config IOMMU_FORCE_PT_SHARE
 	bool
+
+choice
+	prompt "IOMMU device quarantining default behavior"
+	depends on HAS_PCI
+	default IOMMU_QUARANTINE_BASIC
+	---help---
+	  When a PCI device is assigned to an untrusted domain, it is possible
+	  for that domain to program the device to DMA to an arbitrary address.
+	  The IOMMU is used to protect the host from malicious DMA by making
+	  sure that the device addresses can only target memory assigned to the
+	  guest.  However, when the guest domain is torn down, assigning the
+	  device back to the hardware domain would allow any in-flight DMA to
+	  potentially target critical host data.  To avoid this, quarantining
+	  should be enabled.  Quarantining can be done in two ways: In its basic
+	  form, all in-flight DMA will simply be forced to encounter IOMMU
+	  faults.  Since there are systems where doing so can cause host lockup,
+	  an alternative form is available where writes to memory will be made
+	  fault, but reads will be directed to a dummy page.  The implication
+	  here is that such reads will go unnoticed, i.e. an admin may not
+	  become aware of the underlying problem.
+
+	config IOMMU_QUARANTINE_NONE
+		bool "none"
+	config IOMMU_QUARANTINE_BASIC
+		bool "basic"
+	config IOMMU_QUARANTINE_SCRATCH_PAGE
+		bool "scratch page"
+endchoice
--- a/xen/drivers/passthrough/amd/pci_amd_iommu.c
+++ b/xen/drivers/passthrough/amd/pci_amd_iommu.c
@@ -25,6 +25,9 @@
 #include "iommu.h"
 #include "../ats.h"
 
+/* dom_io is used as a sentinel for quarantined devices */
+#define QUARANTINE_SKIP(d) ((d) == dom_io && !dom_iommu(d)->arch.amd.root_table)
+
 static bool_t __read_mostly init_done;
 
 static const struct iommu_init_ops _iommu_init_ops;
@@ -81,19 +84,36 @@ int get_dma_requestor_id(uint16_t seg, u
     return req_id;
 }
 
-static void amd_iommu_setup_domain_device(
+static int __must_check allocate_domain_resources(struct domain *d)
+{
+    struct domain_iommu *hd = dom_iommu(d);
+    int rc;
+
+    spin_lock(&hd->arch.mapping_lock);
+    rc = amd_iommu_alloc_root(d);
+    spin_unlock(&hd->arch.mapping_lock);
+
+    return rc;
+}
+
+static int __must_check amd_iommu_setup_domain_device(
     struct domain *domain, struct amd_iommu *iommu,
     uint8_t devfn, struct pci_dev *pdev)
 {
     struct amd_iommu_dte *table, *dte;
     unsigned long flags;
-    int req_id, valid = 1;
+    int req_id, valid = 1, rc;
     u8 bus = pdev->bus;
-    const struct domain_iommu *hd = dom_iommu(domain);
+    struct domain_iommu *hd = dom_iommu(domain);
 
-    BUG_ON( !hd->arch.amd.root_table ||
-            !hd->arch.amd.paging_mode ||
-            !iommu->dev_table.buffer );
+    if ( QUARANTINE_SKIP(domain) )
+        return 0;
+
+    BUG_ON(!hd->arch.amd.paging_mode || !iommu->dev_table.buffer);
+
+    rc = allocate_domain_resources(domain);
+    if ( rc )
+        return rc;
 
     if ( iommu_hwdom_passthrough && is_hardware_domain(domain) )
         valid = 0;
@@ -151,6 +171,8 @@ static void amd_iommu_setup_domain_devic
 
         amd_iommu_flush_iotlb(devfn, pdev, INV_IOMMU_ALL_PAGES_ADDRESS, 0);
     }
+
+    return 0;
 }
 
 int __init acpi_ivrs_init(void)
@@ -222,18 +244,6 @@ int amd_iommu_alloc_root(struct domain *
     return 0;
 }
 
-static int __must_check allocate_domain_resources(struct domain *d)
-{
-    struct domain_iommu *hd = dom_iommu(d);
-    int rc;
-
-    spin_lock(&hd->arch.mapping_lock);
-    rc = amd_iommu_alloc_root(d);
-    spin_unlock(&hd->arch.mapping_lock);
-
-    return rc;
-}
-
 static int amd_iommu_domain_init(struct domain *d)
 {
     struct domain_iommu *hd = dom_iommu(d);
@@ -283,6 +293,9 @@ static void amd_iommu_disable_domain_dev
     int req_id;
     u8 bus = pdev->bus;
 
+    if ( QUARANTINE_SKIP(domain) )
+        return;
+
     BUG_ON ( iommu->dev_table.buffer == NULL );
     req_id = get_dma_requestor_id(iommu->seg, PCI_BDF2(bus, devfn));
     table = iommu->dev_table.buffer;
@@ -349,11 +362,10 @@ static int reassign_device(struct domain
         pdev->domain = target;
     }
 
-    rc = allocate_domain_resources(target);
+    rc = amd_iommu_setup_domain_device(target, iommu, devfn, pdev);
     if ( rc )
         return rc;
 
-    amd_iommu_setup_domain_device(target, iommu, devfn, pdev);
     AMD_IOMMU_DEBUG("Re-assign %pp from dom%d to dom%d\n",
                     &pdev->sbdf, source->domain_id, target->domain_id);
 
@@ -451,8 +463,7 @@ static int amd_iommu_add_device(u8 devfn
         spin_unlock_irqrestore(&iommu->lock, flags);
     }
 
-    amd_iommu_setup_domain_device(pdev->domain, iommu, devfn, pdev);
-    return 0;
+    return amd_iommu_setup_domain_device(pdev->domain, iommu, devfn, pdev);
 }
 
 static int amd_iommu_remove_device(u8 devfn, struct pci_dev *pdev)
--- a/xen/drivers/passthrough/iommu.c
+++ b/xen/drivers/passthrough/iommu.c
@@ -31,9 +31,24 @@ bool_t __initdata iommu_enable = 1;
 bool_t __read_mostly iommu_enabled;
 bool_t __read_mostly force_iommu;
 bool_t __read_mostly iommu_verbose;
-bool __read_mostly iommu_quarantine = true;
 bool_t __read_mostly iommu_crash_disable;
 
+#define IOMMU_quarantine_none        0 /* aka false */
+#define IOMMU_quarantine_fault       1 /* aka true */
+#define IOMMU_quarantine_write_fault 2
+#ifdef CONFIG_HAS_PCI
+uint8_t __read_mostly iommu_quarantine =
+# if defined(CONFIG_IOMMU_QUARANTINE_NONE)
+    IOMMU_quarantine_none;
+# elif defined(CONFIG_IOMMU_QUARANTINE_BASIC)
+    IOMMU_quarantine_fault;
+# elif defined(CONFIG_IOMMU_QUARANTINE_SCRATCH_PAGE)
+    IOMMU_quarantine_write_fault;
+# endif
+#else
+# define iommu_quarantine IOMMU_quarantine_none
+#endif /* CONFIG_HAS_PCI */
+
 static bool __hwdom_initdata iommu_hwdom_none;
 bool __hwdom_initdata iommu_hwdom_strict;
 bool __read_mostly iommu_hwdom_passthrough;
@@ -64,8 +79,12 @@ static int __init parse_iommu_param(cons
         else if ( (val = parse_boolean("force", s, ss)) >= 0 ||
                   (val = parse_boolean("required", s, ss)) >= 0 )
             force_iommu = val;
+#ifdef CONFIG_HAS_PCI
         else if ( (val = parse_boolean("quarantine", s, ss)) >= 0 )
             iommu_quarantine = val;
+        else if ( ss == s + 15 && !strncmp(s, "quarantine=scratch-page", 23) )
+            iommu_quarantine = IOMMU_quarantine_write_fault;
+#endif
 #ifdef CONFIG_X86
         else if ( (val = parse_boolean("igfx", s, ss)) >= 0 )
             iommu_igfx = val;
@@ -425,7 +444,7 @@ static int __init iommu_quarantine_init(
     dom_io->options |= XEN_DOMCTL_CDF_iommu;
 
     rc = iommu_domain_init(dom_io, 0);
-    if ( rc )
+    if ( rc || iommu_quarantine < IOMMU_quarantine_write_fault )
         return rc;
 
     if ( !hd->platform_ops->quarantine_init )
--- a/xen/drivers/passthrough/vtd/iommu.c
+++ b/xen/drivers/passthrough/vtd/iommu.c
@@ -42,6 +42,9 @@
 #include "vtd.h"
 #include "../ats.h"
 
+/* dom_io is used as a sentinel for quarantined devices */
+#define QUARANTINE_SKIP(d) ((d) == dom_io && !dom_iommu(d)->arch.vtd.pgd_maddr)
+
 struct mapped_rmrr {
     struct list_head list;
     u64 base, end;
@@ -1289,6 +1292,9 @@ int domain_context_mapping_one(
     int agaw, rc, ret;
     bool_t flush_dev_iotlb;
 
+    if ( QUARANTINE_SKIP(domain) )
+        return 0;
+
     ASSERT(pcidevs_locked());
     spin_lock(&iommu->lock);
     maddr = bus_to_context_maddr(iommu, bus);
@@ -1536,6 +1542,9 @@ int domain_context_unmap_one(
     int iommu_domid, rc, ret;
     bool_t flush_dev_iotlb;
 
+    if ( QUARANTINE_SKIP(domain) )
+        return 0;
+
     ASSERT(pcidevs_locked());
     spin_lock(&iommu->lock);
 
@@ -1597,7 +1606,7 @@ static int domain_context_unmap(struct d
 {
     struct acpi_drhd_unit *drhd;
     struct vtd_iommu *iommu;
-    int ret = 0;
+    int ret;
     u8 seg = pdev->seg, bus = pdev->bus, tmp_bus, tmp_devfn, secbus;
     int found = 0;
 
@@ -1612,14 +1621,12 @@ static int domain_context_unmap(struct d
         if ( iommu_debug )
             printk(VTDPREFIX "%pd:Hostbridge: skip %pp unmap\n",
                    domain, &PCI_SBDF3(seg, bus, devfn));
-        if ( !is_hardware_domain(domain) )
-            return -EPERM;
-        goto out;
+        return is_hardware_domain(domain) ? 0 : -EPERM;
 
     case DEV_TYPE_PCIe_BRIDGE:
     case DEV_TYPE_PCIe2PCI_BRIDGE:
     case DEV_TYPE_LEGACY_PCI_BRIDGE:
-        goto out;
+        return 0;
 
     case DEV_TYPE_PCIe_ENDPOINT:
         if ( iommu_debug )
@@ -1661,10 +1668,12 @@ static int domain_context_unmap(struct d
     default:
         dprintk(XENLOG_ERR VTDPREFIX, "%pd:unknown(%u): %pp\n",
                 domain, pdev->type, &PCI_SBDF3(seg, bus, devfn));
-        ret = -EINVAL;
-        goto out;
+        return -EINVAL;
     }
 
+    if ( ret || QUARANTINE_SKIP(domain) )
+        return ret;
+
     /*
      * if no other devices under the same iommu owned by this domain,
      * clear iommu in iommu_bitmap and clear domain_id in domid_bitmp
@@ -1699,8 +1708,7 @@ static int domain_context_unmap(struct d
         iommu->domid_map[iommu_domid] = 0;
     }
 
-out:
-    return ret;
+    return 0;
 }
 
 static void iommu_domain_teardown(struct domain *d)
--- a/xen/include/xen/iommu.h
+++ b/xen/include/xen/iommu.h
@@ -53,7 +53,9 @@ static inline bool_t dfn_eq(dfn_t x, dfn
 }
 
 extern bool_t iommu_enable, iommu_enabled;
-extern bool force_iommu, iommu_quarantine, iommu_verbose;
+extern bool force_iommu, iommu_verbose;
+/* Boolean except for the specific purposes of drivers/passthrough/iommu.c. */
+extern uint8_t iommu_quarantine;
 
 #ifdef CONFIG_X86
 extern enum __packed iommu_intremap {

