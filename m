Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 29142772BDD
	for <lists+xen-devel@lfdr.de>; Mon,  7 Aug 2023 18:59:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.578743.906398 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qT3ZZ-0005q1-HT; Mon, 07 Aug 2023 16:59:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 578743.906398; Mon, 07 Aug 2023 16:59:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qT3ZZ-0005oK-Ej; Mon, 07 Aug 2023 16:59:13 +0000
Received: by outflank-mailman (input) for mailman id 578743;
 Mon, 07 Aug 2023 16:59:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ru+M=DY=citrix.com=prvs=57627f799=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1qT3ZX-0005oE-CO
 for xen-devel@lists.xenproject.org; Mon, 07 Aug 2023 16:59:11 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b7f502e2-3543-11ee-b280-6b7b168915f2;
 Mon, 07 Aug 2023 18:59:08 +0200 (CEST)
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
X-Inumbo-ID: b7f502e2-3543-11ee-b280-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1691427548;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=nm5R7soTv5fti98FGiCgyddGgN3CHcBysJb401uIthc=;
  b=VOR+NWkohaCBrSJ4voRDpYFedAdQm5CZFdE2OLFG5IJPlKHbyECV0rQy
   JCcKN6ZXt0slDrwIMG6PoOShAShVf2W2KMrmWnVJISIFLdrwlQoH1QABB
   8ogE7Habf7t9ORkDY2B9djjIWVVNJMmxup654LMjbFqxCNGTvc/KNtYt4
   Y=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 118766919
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:8n0036KPdBGWsLaXFE+Rx5UlxSXFcZb7ZxGr2PjKsXjdYENS0zcFz
 GIaDGHVaPnbYmfzfdh/Oom/oB8HupbRzN8xSQtlqX01Q3x08seUXt7xwmUcnc+xBpaaEB84t
 ZV2hv3odp1coqr0/0/1WlTZhSAgk/rOHvykU7Ss1hlZHWdMUD0mhQ9oh9k3i4tphcnRKw6Ws
 Jb5rta31GWNglaYCUpKrfrawP9TlK6q4mhA7gRhPakjUGL2zBH5MrpOfcldEFOgKmVkNrbSb
 /rOyri/4lTY838FYj9yuu+mGqGiaue60Tmm0hK6aYD76vRxjnVaPpIAHOgdcS9qZwChxLid/
 jnvWauYEm/FNoWU8AgUvoIx/ytWZcWq85efSZSzXFD6I+QrvBIAzt03ZHzaM7H09c50H29Pz
 fg1CgknYzK6mriQ+qugG/Rj05FLwMnDZOvzu1llxDDdS/0nXYrCU+PB4towMDUY354UW6yEP
 oxANGQpNU6bC/FMEg5/5JYWteGknHTgNRZfr0qYv/Ef6GnP1g1hlrPqNbI5f/TTHJUKwBjJ/
 zOuE2LRXEFDDI2+6ii5zWOnmqjhjQSndo4OC+jtnhJtqALKnTFCYPEMbnOrrP/8hkOgVtZ3L
 00P5jFovaU07FasTNT2Q1u/unHsljw2VsdUEuY6wBqQ0aeS6AGcbkAbShZRZdpgs9U5LQHGz
 XfQwYmvX2Y29uTIFzTErOz8QS6O1TY9LnEMZBcAYCk8ydTBmZxpqCjWVYd+H/vg5jHqIg3Yz
 zePpSk4orwci88Xyqm2lWz6byKQSovhFVBsuFiONo6xxkYgPdP+OdT0gbTOxawYRLt1WGVtq
 5TtdyK2yOkVRa+AmyWWKAnmNOH4vq3VWNEwbLMGInXAy9hP0yT4FWyzyGskTKuMDirjUWGBX
 aMrkVkNjKK/xVPzBUONX6q/Ct4x0Y/rHsn/W/bfY7JmO8YgLVTbonEyOxPJhQgBdXTAdollY
 /+mnTuEVy5GWcyLMhLpLwvi7VPb7n9nnj6CLXwK5x+mzaCfdBaopUQtaTOzghQCxPrc+m39q
 o8PX/ZmPj0DCIUSlAGLq99MRb3LRFBnba3LRzt/L7PafFA4Qjt9Wpc8A9oJIuRYokicrc+Ql
 lnVZ6OS4ACXaaHvQelSVk1eVQ==
IronPort-HdrOrdr: A9a23:nKV3vqxJwm67lWMa6hzWKrPwIL1zdoMgy1knxilNoRw8SKKlfq
 eV7ZMmPH7P+VIssR4b+exoVJPtfZq+z+8R3WByB8bAYOCOggLBR+sO0WKL+UyHJ8SUzI9gPM
 lbHJSWcOeAb2RHsQ==
X-Talos-CUID: 9a23:JzFMcW4lolG4XEZuodss91AaG/ghX1/k5nryGlLiL1xwU+yIRgrF
X-Talos-MUID: 9a23:3/UUJQp1yvgyl4Uq6IMez28ybf85woe8NH8cmolBldmjaQJ8JyjI2Q==
X-IronPort-AV: E=Sophos;i="6.01,262,1684814400"; 
   d="scan'208";a="118766919"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH] xen/IOMMU: Switch bool_t to bool
Date: Mon, 7 Aug 2023 17:58:30 +0100
Message-ID: <20230807165830.6719-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

... as part of cleaning up the types used.  Minor style cleanup on some
altered lines.

No functional change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>
---
 xen/drivers/passthrough/amd/iommu.h         |  4 ++--
 xen/drivers/passthrough/amd/iommu_acpi.c    |  6 +++---
 xen/drivers/passthrough/amd/iommu_init.c    |  6 +++---
 xen/drivers/passthrough/amd/pci_amd_iommu.c |  2 +-
 xen/drivers/passthrough/ats.c               |  2 +-
 xen/drivers/passthrough/ats.h               |  2 +-
 xen/drivers/passthrough/device_tree.c       |  4 ++--
 xen/drivers/passthrough/iommu.c             |  8 ++++----
 xen/drivers/passthrough/pci.c               | 16 ++++++++--------
 xen/drivers/passthrough/vtd/dmar.c          |  6 +++---
 xen/drivers/passthrough/vtd/extern.h        |  6 +++---
 xen/drivers/passthrough/vtd/iommu.c         | 18 +++++++++---------
 xen/drivers/passthrough/vtd/qinval.c        |  2 +-
 xen/drivers/passthrough/vtd/quirks.c        |  8 ++++----
 xen/drivers/passthrough/vtd/x86/ats.c       |  2 +-
 xen/include/xen/iommu.h                     |  6 +++---
 16 files changed, 49 insertions(+), 49 deletions(-)

diff --git a/xen/drivers/passthrough/amd/iommu.h b/xen/drivers/passthrough/amd/iommu.h
index 5429ada58ef5..acbaad30d564 100644
--- a/xen/drivers/passthrough/amd/iommu.h
+++ b/xen/drivers/passthrough/amd/iommu.h
@@ -174,7 +174,7 @@ struct guest_iommu {
 
     struct domain          *domain;
     spinlock_t              lock;
-    bool_t                  enabled;
+    bool                    enabled;
 
     struct guest_dev_table  dev_table;
     struct guest_buffer     cmd_buffer;
@@ -194,7 +194,7 @@ struct guest_iommu {
     struct guest_iommu_msi  msi;
 };
 
-extern bool_t iommuv2_enabled;
+extern bool iommuv2_enabled;
 
 struct acpi_ivrs_hardware;
 
diff --git a/xen/drivers/passthrough/amd/iommu_acpi.c b/xen/drivers/passthrough/amd/iommu_acpi.c
index 3b577c9b390c..891c6c6ddde2 100644
--- a/xen/drivers/passthrough/amd/iommu_acpi.c
+++ b/xen/drivers/passthrough/amd/iommu_acpi.c
@@ -1063,14 +1063,14 @@ static unsigned int __initdata nr_ivmd;
 #define to_ivmd_block(hdr) \
     container_of(hdr, const struct acpi_ivrs_memory, header)
 
-static inline bool_t is_ivhd_block(u8 type)
+static inline bool is_ivhd_block(u8 type)
 {
     return (type == ACPI_IVRS_TYPE_HARDWARE ||
             ((amd_iommu_acpi_info & ACPI_IVRS_EFR_SUP) &&
              type == ACPI_IVRS_TYPE_HARDWARE_11H));
 }
 
-static inline bool_t is_ivmd_block(u8 type)
+static inline bool is_ivmd_block(u8 type)
 {
     return (type == ACPI_IVRS_TYPE_MEMORY_ALL ||
             type == ACPI_IVRS_TYPE_MEMORY_ONE ||
@@ -1102,7 +1102,7 @@ static int __init cf_check parse_ivrs_table(struct acpi_table_header *table)
     const struct acpi_ivrs_header *ivrs_block;
     unsigned long length;
     unsigned int apic, i;
-    bool_t sb_ioapic = !iommu_intremap;
+    bool sb_ioapic = !iommu_intremap;
     int error = 0;
 
     BUG_ON(!table);
diff --git a/xen/drivers/passthrough/amd/iommu_init.c b/xen/drivers/passthrough/amd/iommu_init.c
index af6713d2fc02..41ec38bb72eb 100644
--- a/xen/drivers/passthrough/amd/iommu_init.c
+++ b/xen/drivers/passthrough/amd/iommu_init.c
@@ -34,7 +34,7 @@ unsigned int __read_mostly ivrs_bdf_entries;
 u8 __read_mostly ivhd_type;
 static struct radix_tree_root ivrs_maps;
 LIST_HEAD_READ_MOSTLY(amd_iommu_head);
-bool_t iommuv2_enabled;
+bool iommuv2_enabled;
 
 bool __ro_after_init amd_iommu_perdev_intremap = true;
 
@@ -737,7 +737,7 @@ static void cf_check iommu_interrupt_handler(
     tasklet_schedule(&amd_iommu_irq_tasklet);
 }
 
-static bool_t __init set_iommu_interrupt_handler(struct amd_iommu *iommu)
+static bool __init set_iommu_interrupt_handler(struct amd_iommu *iommu)
 {
     int irq, ret;
 
@@ -1329,7 +1329,7 @@ static int __init cf_check amd_iommu_setup_device_table(
 }
 
 /* Check whether SP5100 SATA Combined mode is on */
-static bool_t __init amd_sp5100_erratum28(void)
+static bool __init amd_sp5100_erratum28(void)
 {
     u32 bus, id;
     u16 vendor_id, dev_id;
diff --git a/xen/drivers/passthrough/amd/pci_amd_iommu.c b/xen/drivers/passthrough/amd/pci_amd_iommu.c
index 94e37755064b..f7f9f4e5423a 100644
--- a/xen/drivers/passthrough/amd/pci_amd_iommu.c
+++ b/xen/drivers/passthrough/amd/pci_amd_iommu.c
@@ -28,7 +28,7 @@
 /* dom_io is used as a sentinel for quarantined devices */
 #define QUARANTINE_SKIP(d, p) ((d) == dom_io && !(p)->arch.amd.root_table)
 
-static bool_t __read_mostly init_done;
+static bool __read_mostly init_done;
 
 static const struct iommu_init_ops _iommu_init_ops;
 
diff --git a/xen/drivers/passthrough/ats.c b/xen/drivers/passthrough/ats.c
index 7f7b16dc490c..253f5c2e1042 100644
--- a/xen/drivers/passthrough/ats.c
+++ b/xen/drivers/passthrough/ats.c
@@ -18,7 +18,7 @@
 #include <xen/pci_regs.h>
 #include "ats.h"
 
-bool_t __read_mostly ats_enabled = 0;
+bool __read_mostly ats_enabled;
 boolean_param("ats", ats_enabled);
 
 int enable_ats_device(struct pci_dev *pdev, struct list_head *ats_list)
diff --git a/xen/drivers/passthrough/ats.h b/xen/drivers/passthrough/ats.h
index c202f4ecdd67..baa5f6a6dc04 100644
--- a/xen/drivers/passthrough/ats.h
+++ b/xen/drivers/passthrough/ats.h
@@ -22,7 +22,7 @@
 #define ATS_QUEUE_DEPTH_MASK     0x1f
 #define ATS_ENABLE               (1<<15)
 
-extern bool_t ats_enabled;
+extern bool ats_enabled;
 
 int enable_ats_device(struct pci_dev *pdev, struct list_head *ats_list);
 void disable_ats_device(struct pci_dev *pdev);
diff --git a/xen/drivers/passthrough/device_tree.c b/xen/drivers/passthrough/device_tree.c
index 1c32d7b50cce..3c0322c7973d 100644
--- a/xen/drivers/passthrough/device_tree.c
+++ b/xen/drivers/passthrough/device_tree.c
@@ -83,9 +83,9 @@ int iommu_deassign_dt_device(struct domain *d, struct dt_device_node *dev)
     return rc;
 }
 
-static bool_t iommu_dt_device_is_assigned(const struct dt_device_node *dev)
+static bool iommu_dt_device_is_assigned(const struct dt_device_node *dev)
 {
-    bool_t assigned = 0;
+    bool assigned = false;
 
     if ( !dt_device_is_protected(dev) )
         return 0;
diff --git a/xen/drivers/passthrough/iommu.c b/xen/drivers/passthrough/iommu.c
index 7bbe3889a214..f9a9f53dbd44 100644
--- a/xen/drivers/passthrough/iommu.c
+++ b/xen/drivers/passthrough/iommu.c
@@ -29,7 +29,7 @@ bool __initdata iommu_enable = 1;
 bool __read_mostly iommu_enabled;
 bool __read_mostly force_iommu;
 bool __read_mostly iommu_verbose;
-static bool_t __read_mostly iommu_crash_disable;
+static bool __read_mostly iommu_crash_disable;
 
 #define IOMMU_quarantine_none         0 /* aka false */
 #define IOMMU_quarantine_basic        1 /* aka true */
@@ -59,7 +59,7 @@ bool __read_mostly iommu_hap_pt_share = true;
 
 bool __read_mostly iommu_debug;
 
-DEFINE_PER_CPU(bool_t, iommu_dont_flush_iotlb);
+DEFINE_PER_CPU(bool, iommu_dont_flush_iotlb);
 
 static int __init cf_check parse_iommu_param(const char *s)
 {
@@ -548,7 +548,7 @@ static int __init iommu_quarantine_init(void)
 int __init iommu_setup(void)
 {
     int rc = -ENODEV;
-    bool_t force_intremap = force_iommu && iommu_intremap;
+    bool force_intremap = force_iommu && iommu_intremap;
 
     if ( iommu_hwdom_strict )
         iommu_hwdom_passthrough = false;
@@ -672,7 +672,7 @@ int iommu_get_reserved_device_memory(iommu_grdm_t *func, void *ctxt)
     return iommu_call(ops, get_reserved_device_memory, func, ctxt);
 }
 
-bool_t iommu_has_feature(struct domain *d, enum iommu_feature feature)
+bool iommu_has_feature(struct domain *d, enum iommu_feature feature)
 {
     return is_iommu_enabled(d) && test_bit(feature, dom_iommu(d)->features);
 }
diff --git a/xen/drivers/passthrough/pci.c b/xen/drivers/passthrough/pci.c
index 33452791a8e0..ed1f689227fa 100644
--- a/xen/drivers/passthrough/pci.c
+++ b/xen/drivers/passthrough/pci.c
@@ -62,7 +62,7 @@ void pcidevs_unlock(void)
     spin_unlock_recursive(&_pcidevs_lock);
 }
 
-bool_t pcidevs_locked(void)
+bool pcidevs_locked(void)
 {
     return !!spin_is_locked(&_pcidevs_lock);
 }
@@ -74,7 +74,7 @@ static inline struct pci_seg *get_pseg(u16 seg)
     return radix_tree_lookup(&pci_segments, seg);
 }
 
-bool_t pci_known_segment(u16 seg)
+bool pci_known_segment(u16 seg)
 {
     return get_pseg(seg) != NULL;
 }
@@ -984,7 +984,7 @@ int find_upstream_bridge(u16 seg, u8 *bus, u8 *devfn, u8 *secbus)
     return ret;
 }
 
-bool_t __init pci_device_detect(u16 seg, u8 bus, u8 dev, u8 func)
+bool __init pci_device_detect(u16 seg, u8 bus, u8 dev, u8 func)
 {
     u32 vendor;
 
@@ -1181,7 +1181,7 @@ static int hest_match_pci(const struct acpi_hest_aer_common *p,
            p->function               == PCI_FUNC(pdev->devfn);
 }
 
-static bool_t hest_match_type(const struct acpi_hest_header *hest_hdr,
+static bool hest_match_type(const struct acpi_hest_header *hest_hdr,
                               const struct pci_dev *pdev)
 {
     unsigned int pos = pci_find_cap_offset(pdev->seg, pdev->bus,
@@ -1207,10 +1207,10 @@ static bool_t hest_match_type(const struct acpi_hest_header *hest_hdr,
 
 struct aer_hest_parse_info {
     const struct pci_dev *pdev;
-    bool_t firmware_first;
+    bool firmware_first;
 };
 
-static bool_t hest_source_is_pcie_aer(const struct acpi_hest_header *hest_hdr)
+static bool hest_source_is_pcie_aer(const struct acpi_hest_header *hest_hdr)
 {
     if ( hest_hdr->type == ACPI_HEST_TYPE_AER_ROOT_PORT ||
          hest_hdr->type == ACPI_HEST_TYPE_AER_ENDPOINT ||
@@ -1224,7 +1224,7 @@ static int cf_check aer_hest_parse(
 {
     struct aer_hest_parse_info *info = data;
     const struct acpi_hest_aer_common *p;
-    bool_t ff;
+    bool ff;
 
     if ( !hest_source_is_pcie_aer(hest_hdr) )
         return 0;
@@ -1254,7 +1254,7 @@ static int cf_check aer_hest_parse(
     return 0;
 }
 
-bool_t pcie_aer_get_firmware_first(const struct pci_dev *pdev)
+bool pcie_aer_get_firmware_first(const struct pci_dev *pdev)
 {
     struct aer_hest_parse_info info = { .pdev = pdev };
 
diff --git a/xen/drivers/passthrough/vtd/dmar.c b/xen/drivers/passthrough/vtd/dmar.c
index 4936c20952ec..07772f178fe6 100644
--- a/xen/drivers/passthrough/vtd/dmar.c
+++ b/xen/drivers/passthrough/vtd/dmar.c
@@ -149,7 +149,7 @@ struct vtd_iommu *ioapic_to_iommu(unsigned int apic_id)
     return NULL;
 }
 
-static bool_t acpi_hpet_device_match(
+static bool acpi_hpet_device_match(
     struct list_head *list, unsigned int hpet_id)
 {
     struct acpi_hpet_unit *hpet;
@@ -1052,14 +1052,14 @@ void acpi_dmar_zap(void)
         write_atomic((uint32_t*)&dmar_table->signature[0], sig);
 }
 
-bool_t platform_supports_intremap(void)
+bool platform_supports_intremap(void)
 {
     const unsigned int mask = ACPI_DMAR_INTR_REMAP;
 
     return (dmar_flags & mask) == ACPI_DMAR_INTR_REMAP;
 }
 
-bool_t __init platform_supports_x2apic(void)
+bool __init platform_supports_x2apic(void)
 {
     const unsigned int mask = ACPI_DMAR_INTR_REMAP | ACPI_DMAR_X2APIC_OPT_OUT;
 
diff --git a/xen/drivers/passthrough/vtd/extern.h b/xen/drivers/passthrough/vtd/extern.h
index d49e40c5ce7d..667590ee52df 100644
--- a/xen/drivers/passthrough/vtd/extern.h
+++ b/xen/drivers/passthrough/vtd/extern.h
@@ -26,7 +26,7 @@
 #define VTDPREFIX "[VT-D]"
 
 struct pci_ats_dev;
-extern bool_t rwbf_quirk;
+extern bool rwbf_quirk;
 extern const struct iommu_init_ops intel_iommu_init_ops;
 
 void print_iommu_regs(struct acpi_drhd_unit *drhd);
@@ -111,7 +111,7 @@ int __must_check me_wifi_quirk(struct domain *domain, uint8_t bus,
 void pci_vtd_quirk(const struct pci_dev *);
 void quirk_iommu_caps(struct vtd_iommu *iommu);
 
-bool_t platform_supports_intremap(void);
-bool_t platform_supports_x2apic(void);
+bool platform_supports_intremap(void);
+bool platform_supports_x2apic(void);
 
 #endif // _VTD_EXTERN_H_
diff --git a/xen/drivers/passthrough/vtd/iommu.c b/xen/drivers/passthrough/vtd/iommu.c
index 0e3062c820f9..d34c98d9c773 100644
--- a/xen/drivers/passthrough/vtd/iommu.c
+++ b/xen/drivers/passthrough/vtd/iommu.c
@@ -644,8 +644,8 @@ static int __must_check iommu_flush_iotlb_global(struct vtd_iommu *iommu,
 }
 
 static int __must_check iommu_flush_iotlb_dsi(struct vtd_iommu *iommu, u16 did,
-                                              bool_t flush_non_present_entry,
-                                              bool_t flush_dev_iotlb)
+                                              bool flush_non_present_entry,
+                                              bool flush_dev_iotlb)
 {
     int status;
 
@@ -663,8 +663,8 @@ static int __must_check iommu_flush_iotlb_dsi(struct vtd_iommu *iommu, u16 did,
 
 static int __must_check iommu_flush_iotlb_psi(struct vtd_iommu *iommu, u16 did,
                                               u64 addr, unsigned int order,
-                                              bool_t flush_non_present_entry,
-                                              bool_t flush_dev_iotlb)
+                                              bool flush_non_present_entry,
+                                              bool flush_dev_iotlb)
 {
     int status;
 
@@ -694,7 +694,7 @@ static int __must_check iommu_flush_all(void)
 {
     struct acpi_drhd_unit *drhd;
     struct vtd_iommu *iommu;
-    bool_t flush_dev_iotlb;
+    bool flush_dev_iotlb;
     int rc = 0;
 
     flush_local(FLUSH_CACHE);
@@ -736,7 +736,7 @@ static int __must_check cf_check iommu_flush_iotlb(struct domain *d, dfn_t dfn,
     struct domain_iommu *hd = dom_iommu(d);
     struct acpi_drhd_unit *drhd;
     struct vtd_iommu *iommu;
-    bool_t flush_dev_iotlb;
+    bool flush_dev_iotlb;
     int iommu_domid;
     int ret = 0;
 
@@ -1480,7 +1480,7 @@ int domain_context_mapping_one(
     uint16_t seg = iommu->drhd->segment, prev_did = 0;
     struct domain *prev_dom = NULL;
     int rc, ret;
-    bool_t flush_dev_iotlb;
+    bool flush_dev_iotlb;
 
     if ( QUARANTINE_SKIP(domain, pgd_maddr) )
         return 0;
@@ -1874,7 +1874,7 @@ int domain_context_unmap_one(
     struct context_entry *context, *context_entries;
     u64 maddr;
     int iommu_domid, rc, ret;
-    bool_t flush_dev_iotlb;
+    bool flush_dev_iotlb;
 
     ASSERT(pcidevs_locked());
     spin_lock(&iommu->lock);
@@ -2873,7 +2873,7 @@ static int cf_check intel_iommu_assign_device(
         if ( rmrr->segment == seg && bdf == PCI_BDF(bus, devfn) &&
              rmrr->scope.devices_cnt > 1 )
         {
-            bool_t relaxed = !!(flag & XEN_DOMCTL_DEV_RDM_RELAXED);
+            bool relaxed = flag & XEN_DOMCTL_DEV_RDM_RELAXED;
 
             printk(XENLOG_GUEST "%s" VTDPREFIX
                    " It's %s to assign %pp"
diff --git a/xen/drivers/passthrough/vtd/qinval.c b/xen/drivers/passthrough/vtd/qinval.c
index 4f9ad136b9c5..036f3e850544 100644
--- a/xen/drivers/passthrough/vtd/qinval.c
+++ b/xen/drivers/passthrough/vtd/qinval.c
@@ -152,7 +152,7 @@ static int __must_check queue_invalidate_iotlb_sync(struct vtd_iommu *iommu,
 
 static int __must_check queue_invalidate_wait(struct vtd_iommu *iommu,
                                               u8 iflag, u8 sw, u8 fn,
-                                              bool_t flush_dev_iotlb)
+                                              bool flush_dev_iotlb)
 {
     static DEFINE_PER_CPU(uint32_t, poll_slot);
     unsigned int index;
diff --git a/xen/drivers/passthrough/vtd/quirks.c b/xen/drivers/passthrough/vtd/quirks.c
index fcc8f73e8b90..5d706a539788 100644
--- a/xen/drivers/passthrough/vtd/quirks.c
+++ b/xen/drivers/passthrough/vtd/quirks.c
@@ -56,9 +56,9 @@ static unsigned int snb_igd_timeout;
 
 static u32 __read_mostly ioh_id;
 static u32 __initdata igd_id;
-bool_t __read_mostly rwbf_quirk;
-static bool_t __read_mostly is_cantiga_b3;
-static bool_t __read_mostly is_snb_gfx;
+bool __read_mostly rwbf_quirk;
+static bool __read_mostly is_cantiga_b3;
+static bool __read_mostly is_snb_gfx;
 static u8 *__read_mostly igd_reg_va;
 static spinlock_t igd_lock;
 
@@ -498,7 +498,7 @@ void pci_vtd_quirk(const struct pci_dev *pdev)
     int seg = pdev->seg;
     int bus = pdev->bus;
     int pos;
-    bool_t ff;
+    bool ff;
     u32 val, val2;
     u64 bar;
     paddr_t pa;
diff --git a/xen/drivers/passthrough/vtd/x86/ats.c b/xen/drivers/passthrough/vtd/x86/ats.c
index 04d702b1d6b1..9de419775f90 100644
--- a/xen/drivers/passthrough/vtd/x86/ats.c
+++ b/xen/drivers/passthrough/vtd/x86/ats.c
@@ -119,7 +119,7 @@ int dev_invalidate_iotlb(struct vtd_iommu *iommu, u16 did,
 
     list_for_each_entry_safe( pdev, temp, &iommu->ats_devices, ats.list )
     {
-        bool_t sbit;
+        bool sbit;
         int rc = 0;
 
         switch ( type )
diff --git a/xen/include/xen/iommu.h b/xen/include/xen/iommu.h
index 110693c59fe8..0e33ff79684b 100644
--- a/xen/include/xen/iommu.h
+++ b/xen/include/xen/iommu.h
@@ -46,7 +46,7 @@ static inline dfn_t dfn_add(dfn_t dfn, unsigned long i)
     return _dfn(dfn_x(dfn) + i);
 }
 
-static inline bool_t dfn_eq(dfn_t x, dfn_t y)
+static inline bool dfn_eq(dfn_t x, dfn_t y)
 {
     return dfn_x(x) == dfn_x(y);
 }
@@ -193,7 +193,7 @@ enum iommu_feature
     IOMMU_FEAT_count
 };
 
-bool_t iommu_has_feature(struct domain *d, enum iommu_feature feature);
+bool iommu_has_feature(struct domain *d, enum iommu_feature feature);
 
 #ifdef CONFIG_HAS_PCI
 struct pirq;
@@ -409,7 +409,7 @@ void iommu_dev_iotlb_flush_timeout(struct domain *d, struct pci_dev *pdev);
  * iommu_iotlb_flush/iommu_iotlb_flush_all will be explicitly called by
  * the caller.
  */
-DECLARE_PER_CPU(bool_t, iommu_dont_flush_iotlb);
+DECLARE_PER_CPU(bool, iommu_dont_flush_iotlb);
 
 extern struct spinlock iommu_pt_cleanup_lock;
 extern struct page_list_head iommu_pt_cleanup_list;
-- 
2.30.2


