Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 270054BFC84
	for <lists+xen-devel@lfdr.de>; Tue, 22 Feb 2022 16:27:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.276856.473204 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nMX4W-0006re-3k; Tue, 22 Feb 2022 15:27:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 276856.473204; Tue, 22 Feb 2022 15:27:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nMX4V-0006ml-QE; Tue, 22 Feb 2022 15:27:23 +0000
Received: by outflank-mailman (input) for mailman id 276856;
 Tue, 22 Feb 2022 15:27:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Woib=TF=citrix.com=prvs=045a4fa17=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1nMX4T-0006OK-LG
 for xen-devel@lists.xenproject.org; Tue, 22 Feb 2022 15:27:21 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ea50ebba-93f3-11ec-8eb8-a37418f5ba1a;
 Tue, 22 Feb 2022 16:27:18 +0100 (CET)
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
X-Inumbo-ID: ea50ebba-93f3-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1645543638;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version;
  bh=IDsziahYm5StEtLmipmAEeioRRBnvamhI9MkBfhV+eM=;
  b=GQxV541FBpaHBjI1J1eNLT5mo69+HK18P1aAXj/tqpruHXy/tpTAt4eE
   yuIWkJtEzKUCE47CzI9ldZI4RNs0qoUhnraJMIejOuf7+TYx384/m7HII
   Ekp563F1tjUjgD+duGcZH8xmVblEGKkU8oW2X4fRDDbmxXFUHtPF2yV8k
   c=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 5.1
X-MesageID: 66981777
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:lLhWxq5Q6TTlNTBcSNaFxgxRtFzHchMFZxGqfqrLsTDasY5as4F+v
 mAdXWDUMqyJZjb3c9Fzb9uxoU1X7cDTztQ1GQM5rXpgHi5G8cbLO4+Ufxz6V8+wwmwvb67FA
 +E2MISowBUcFyeEzvuVGuG96yE6j8lkf5KkYAL+EnkZqTRMFWFx2XqPp8Zj2tQy2YLjWVvX0
 T/Pi5a31GGNimYc3l08s8pvmDs31BglkGpF1rCWTakjUG72zxH5PrpGTU2CByKQrr1vNvy7X
 47+IISRpQs1yfuP5uSNyd4XemVSKlLb0JPnZnB+A8BOiTAazsA+PzpS2FPxpi67hh3Q9+2dx
 umhurSrUCF5M/P2ld4mCRB2DGZOF4JF+/zudC3XXcy7lyUqclPpyvRqSko3IZcZ6qB8BmQmG
 f4wcW5XKErZ3qTvnez9GrIEascLdaEHOKs2vH16wC6fJvEhWZ3ZGI3B5MNC3Sd2jcdLdRrbT
 5RHOGo2M0ufC/FJEl4nCsgksNuGuiL+VGVnhVePvfsy+2eGmWSd15CyaYGIK7RmX/59jkue4
 27L4Wn9KhUbL8CEjyqI9Gq2ge3Clj+9X5gdfIBU7dYz3gfVnDZKTkRLCx3r+pFVl3JSRfpEM
 mpE93QUoJIJrkWFUZ7NdTK7oz2t60t0t8VrL8U27wSEy6zx6gmfB3QZQjMpVOHKpPPaVhRxi
 AbXwoqB6ShH9eTMFCnDruv8QSaaZHBNRVLucxPoWufsDzPLhIgoxizCQd94eEJepo2kQGqgq
 9xmQcVXulnysSLp//jjlbwkq2j1znQscuLTzl+MNo5CxlkkDLNJn6TytTDmAQ9ode51tGWps
 nkegNS55+sTF5yLnyHlaLxTQOz1uafYbWeA2AYH83wdG9KFoSXLkWd4umwWGauUGpxcJW+Bj
 LH742u9G6O/zFP1NPQqMupd+uwhzLT6FMSNaxwnRoEmX3SFTyfepHsGTRfJhwjFyRFw+Ylia
 cbzWZv9Vh4yVPU4pAdass9AiNfHMAhlnjiNLX06pjz6uYejiIm9E+ldawLWNrhjhE5GyS2Mm
 +ti2wKx4003eIXDjuP/reb/8XhiwaAHOK3L
IronPort-HdrOrdr: A9a23:7qg4O6szDQ7rUJnHbE3Uy68D7skDjNV00zEX/kB9WHVpm6yj+v
 xGUs566faUskd0ZJhEo7q90ca7Lk80maQa3WBzB8bGYOCFghrKEGgK1+KLrwEIcxeUygc379
 YDT0ERMrzN5VgRt7eG3OG7eexQvOVuJsqT9JjjJ3QGd3AVV0l5hT0JbTpyiidNNXJ77ZxSLu
 v72uN34wCOVF4wdcqBCnwMT4H41qf2fMKPW29+O/Y/gjP+9Q+V1A==
X-IronPort-AV: E=Sophos;i="5.88,387,1635220800"; 
   d="scan'208";a="66981777"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [PATCH v3 26/70] xen/iommu: CFI hardening
Date: Tue, 22 Feb 2022 15:26:37 +0000
Message-ID: <20220222152645.8844-8-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20220222152645.8844-1-andrew.cooper3@citrix.com>
References: <20220222152645.8844-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain

Control Flow Integrity schemes use toolchain and optionally hardware support
to help protect against call/jump/return oriented programming attacks.

Use cf_check to annotate function pointer targets for the toolchain.

AMD's parse_ppr_log_entry() has no external callers, so becomes static.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
Acked-by: Jan Beulich <jbeulich@suse.com>
---
v3:
 * Rebase over recent commits
---
 xen/common/compat/memory.c                  |  4 +-
 xen/drivers/passthrough/amd/iommu.h         | 41 ++++++++--------
 xen/drivers/passthrough/amd/iommu_init.c    | 22 ++++-----
 xen/drivers/passthrough/amd/iommu_intr.c    | 18 +++----
 xen/drivers/passthrough/amd/iommu_map.c     | 22 +++++----
 xen/drivers/passthrough/amd/pci_amd_iommu.c | 32 ++++++-------
 xen/drivers/passthrough/pci.c               |  7 +--
 xen/drivers/passthrough/vtd/dmar.c          |  3 +-
 xen/drivers/passthrough/vtd/extern.h        | 36 +++++++-------
 xen/drivers/passthrough/vtd/intremap.c      | 14 +++---
 xen/drivers/passthrough/vtd/iommu.c         | 73 +++++++++++++++--------------
 xen/drivers/passthrough/vtd/qinval.c        | 28 +++++------
 12 files changed, 152 insertions(+), 148 deletions(-)

diff --git a/xen/common/compat/memory.c b/xen/common/compat/memory.c
index ec8ba54bb66e..077ded4a754c 100644
--- a/xen/common/compat/memory.c
+++ b/xen/common/compat/memory.c
@@ -23,8 +23,8 @@ struct get_reserved_device_memory {
     unsigned int used_entries;
 };
 
-static int get_reserved_device_memory(xen_pfn_t start, xen_ulong_t nr,
-                                      u32 id, void *ctxt)
+static int cf_check get_reserved_device_memory(
+    xen_pfn_t start, xen_ulong_t nr, u32 id, void *ctxt)
 {
     struct get_reserved_device_memory *grdm = ctxt;
     uint32_t sbdf = PCI_SBDF3(grdm->map.dev.pci.seg, grdm->map.dev.pci.bus,
diff --git a/xen/drivers/passthrough/amd/iommu.h b/xen/drivers/passthrough/amd/iommu.h
index 99be9aafcc53..03811fedea57 100644
--- a/xen/drivers/passthrough/amd/iommu.h
+++ b/xen/drivers/passthrough/amd/iommu.h
@@ -236,25 +236,26 @@ int amd_iommu_init_late(void);
 int amd_iommu_update_ivrs_mapping_acpi(void);
 int cf_check iov_adjust_irq_affinities(void);
 
-int amd_iommu_quarantine_init(struct domain *d);
+int cf_check amd_iommu_quarantine_init(struct domain *d);
 
 /* mapping functions */
-int __must_check amd_iommu_map_page(struct domain *d, dfn_t dfn,
-                                    mfn_t mfn, unsigned int flags,
-                                    unsigned int *flush_flags);
-int __must_check amd_iommu_unmap_page(struct domain *d, dfn_t dfn,
-                                      unsigned int *flush_flags);
+int __must_check cf_check amd_iommu_map_page(
+    struct domain *d, dfn_t dfn, mfn_t mfn, unsigned int flags,
+    unsigned int *flush_flags);
+int __must_check cf_check amd_iommu_unmap_page(
+    struct domain *d, dfn_t dfn, unsigned int *flush_flags);
 int __must_check amd_iommu_alloc_root(struct domain *d);
 int amd_iommu_reserve_domain_unity_map(struct domain *domain,
                                        const struct ivrs_unity_map *map,
                                        unsigned int flag);
 int amd_iommu_reserve_domain_unity_unmap(struct domain *d,
                                          const struct ivrs_unity_map *map);
-int amd_iommu_get_reserved_device_memory(iommu_grdm_t *func, void *ctxt);
-int __must_check amd_iommu_flush_iotlb_pages(struct domain *d, dfn_t dfn,
-                                             unsigned long page_count,
-                                             unsigned int flush_flags);
-int __must_check amd_iommu_flush_iotlb_all(struct domain *d);
+int cf_check amd_iommu_get_reserved_device_memory(
+    iommu_grdm_t *func, void *ctxt);
+int __must_check cf_check amd_iommu_flush_iotlb_pages(
+    struct domain *d, dfn_t dfn, unsigned long page_count,
+    unsigned int flush_flags);
+int __must_check cf_check amd_iommu_flush_iotlb_all(struct domain *d);
 
 /* device table functions */
 int get_dma_requestor_id(uint16_t seg, uint16_t bdf);
@@ -282,21 +283,21 @@ void amd_iommu_flush_all_caches(struct amd_iommu *iommu);
 struct amd_iommu *find_iommu_for_device(int seg, int bdf);
 
 /* interrupt remapping */
-bool iov_supports_xt(void);
+bool cf_check iov_supports_xt(void);
 int amd_iommu_setup_ioapic_remapping(void);
 void *amd_iommu_alloc_intremap_table(
     const struct amd_iommu *, unsigned long **, unsigned int nr);
-int amd_iommu_free_intremap_table(
+int cf_check amd_iommu_free_intremap_table(
     const struct amd_iommu *, struct ivrs_mappings *, uint16_t);
 unsigned int amd_iommu_intremap_table_order(
     const void *irt, const struct amd_iommu *iommu);
-void amd_iommu_ioapic_update_ire(
+void cf_check amd_iommu_ioapic_update_ire(
     unsigned int apic, unsigned int reg, unsigned int value);
-unsigned int amd_iommu_read_ioapic_from_ire(
+unsigned int cf_check amd_iommu_read_ioapic_from_ire(
     unsigned int apic, unsigned int reg);
-int amd_iommu_msi_msg_update_ire(
+int cf_check amd_iommu_msi_msg_update_ire(
     struct msi_desc *msi_desc, struct msi_msg *msg);
-int amd_setup_hpet_msi(struct msi_desc *msi_desc);
+int cf_check amd_setup_hpet_msi(struct msi_desc *msi_desc);
 void cf_check amd_iommu_dump_intremap_tables(unsigned char key);
 
 extern struct ioapic_sbdf {
@@ -327,9 +328,9 @@ extern void *shared_intremap_table;
 extern unsigned long *shared_intremap_inuse;
 
 /* power management support */
-void amd_iommu_resume(void);
-int __must_check amd_iommu_suspend(void);
-void amd_iommu_crash_shutdown(void);
+void cf_check amd_iommu_resume(void);
+int __must_check cf_check amd_iommu_suspend(void);
+void cf_check amd_iommu_crash_shutdown(void);
 
 /* guest iommu support */
 #ifdef CONFIG_HVM
diff --git a/xen/drivers/passthrough/amd/iommu_init.c b/xen/drivers/passthrough/amd/iommu_init.c
index 34a9e49f1c5a..06b4d2b1fea0 100644
--- a/xen/drivers/passthrough/amd/iommu_init.c
+++ b/xen/drivers/passthrough/amd/iommu_init.c
@@ -258,8 +258,8 @@ static void register_iommu_exclusion_range(struct amd_iommu *iommu)
     writel(entry, iommu->mmio_base+IOMMU_EXCLUSION_BASE_LOW_OFFSET);
 }
 
-static void set_iommu_event_log_control(struct amd_iommu *iommu,
-                                        bool enable)
+static void cf_check set_iommu_event_log_control(
+    struct amd_iommu *iommu, bool enable)
 {
     /* Reset head and tail pointer manually before enablement */
     if ( enable )
@@ -275,8 +275,8 @@ static void set_iommu_event_log_control(struct amd_iommu *iommu,
     writeq(iommu->ctrl.raw, iommu->mmio_base + IOMMU_CONTROL_MMIO_OFFSET);
 }
 
-static void set_iommu_ppr_log_control(struct amd_iommu *iommu,
-                                      bool enable)
+static void cf_check set_iommu_ppr_log_control(
+    struct amd_iommu *iommu, bool enable)
 {
     /* Reset head and tail pointer manually before enablement */
     if ( enable )
@@ -527,7 +527,7 @@ static hw_irq_controller iommu_x2apic_type = {
     .set_affinity = set_x2apic_affinity,
 };
 
-static void parse_event_log_entry(struct amd_iommu *iommu, u32 entry[])
+static void cf_check parse_event_log_entry(struct amd_iommu *iommu, u32 entry[])
 {
     u32 code;
     static const char *const event_str[] = {
@@ -628,7 +628,7 @@ static void iommu_check_event_log(struct amd_iommu *iommu)
     spin_unlock_irqrestore(&iommu->lock, flags);
 }
 
-void parse_ppr_log_entry(struct amd_iommu *iommu, u32 entry[])
+static void cf_check parse_ppr_log_entry(struct amd_iommu *iommu, u32 entry[])
 {
 
     u16 device_id;
@@ -1243,7 +1243,7 @@ static int __init alloc_ivrs_mappings(u16 seg)
     return 0;
 }
 
-static int __init amd_iommu_setup_device_table(
+static int __init cf_check amd_iommu_setup_device_table(
     u16 seg, struct ivrs_mappings *ivrs_mappings)
 {
     struct amd_iommu_dte *dt = IVRS_MAPPINGS_DEVTAB(ivrs_mappings);
@@ -1543,7 +1543,7 @@ static void invalidate_all_domain_pages(void)
         amd_iommu_flush_all_pages(d);
 }
 
-static int _invalidate_all_devices(
+static int cf_check _invalidate_all_devices(
     u16 seg, struct ivrs_mappings *ivrs_mappings)
 {
     unsigned int bdf; 
@@ -1569,14 +1569,14 @@ static void invalidate_all_devices(void)
     iterate_ivrs_mappings(_invalidate_all_devices);
 }
 
-int amd_iommu_suspend(void)
+int cf_check amd_iommu_suspend(void)
 {
     amd_iommu_crash_shutdown();
 
     return 0;
 }
 
-void amd_iommu_crash_shutdown(void)
+void cf_check amd_iommu_crash_shutdown(void)
 {
     struct amd_iommu *iommu;
 
@@ -1584,7 +1584,7 @@ void amd_iommu_crash_shutdown(void)
         disable_iommu(iommu);
 }
 
-void amd_iommu_resume(void)
+void cf_check amd_iommu_resume(void)
 {
     struct amd_iommu *iommu;
 
diff --git a/xen/drivers/passthrough/amd/iommu_intr.c b/xen/drivers/passthrough/amd/iommu_intr.c
index e7804413c7f4..cebf9ceca74e 100644
--- a/xen/drivers/passthrough/amd/iommu_intr.c
+++ b/xen/drivers/passthrough/amd/iommu_intr.c
@@ -349,7 +349,7 @@ static int update_intremap_entry_from_ioapic(
     return 0;
 }
 
-void amd_iommu_ioapic_update_ire(
+void cf_check amd_iommu_ioapic_update_ire(
     unsigned int apic, unsigned int reg, unsigned int value)
 {
     struct IO_APIC_route_entry old_rte = { 0 };
@@ -455,7 +455,7 @@ void amd_iommu_ioapic_update_ire(
     }
 }
 
-unsigned int amd_iommu_read_ioapic_from_ire(
+unsigned int cf_check amd_iommu_read_ioapic_from_ire(
     unsigned int apic, unsigned int reg)
 {
     unsigned int idx;
@@ -608,7 +608,7 @@ static struct amd_iommu *_find_iommu_for_device(int seg, int bdf)
     return ERR_PTR(-EINVAL);
 }
 
-int amd_iommu_msi_msg_update_ire(
+int cf_check amd_iommu_msi_msg_update_ire(
     struct msi_desc *msi_desc, struct msi_msg *msg)
 {
     struct pci_dev *pdev = msi_desc->dev;
@@ -653,7 +653,7 @@ int amd_iommu_msi_msg_update_ire(
     return rc;
 }
 
-int amd_iommu_free_intremap_table(
+int cf_check amd_iommu_free_intremap_table(
     const struct amd_iommu *iommu, struct ivrs_mappings *ivrs_mapping,
     uint16_t bdf)
 {
@@ -727,7 +727,7 @@ void *amd_iommu_alloc_intremap_table(
     return tb;
 }
 
-bool __init iov_supports_xt(void)
+bool __init cf_check iov_supports_xt(void)
 {
     unsigned int apic;
 
@@ -756,7 +756,7 @@ bool __init iov_supports_xt(void)
     return true;
 }
 
-int __init amd_setup_hpet_msi(struct msi_desc *msi_desc)
+int __init cf_check amd_setup_hpet_msi(struct msi_desc *msi_desc)
 {
     const struct amd_iommu *iommu;
     spinlock_t *lock;
@@ -826,9 +826,9 @@ static void dump_intremap_table(const struct amd_iommu *iommu,
     }
 }
 
-static int dump_intremap_mapping(const struct amd_iommu *iommu,
-                                 struct ivrs_mappings *ivrs_mapping,
-                                 uint16_t unused)
+static int cf_check dump_intremap_mapping(
+    const struct amd_iommu *iommu, struct ivrs_mappings *ivrs_mapping,
+    uint16_t unused)
 {
     unsigned long flags;
 
diff --git a/xen/drivers/passthrough/amd/iommu_map.c b/xen/drivers/passthrough/amd/iommu_map.c
index b0330157eab5..bf5df5fe5d9a 100644
--- a/xen/drivers/passthrough/amd/iommu_map.c
+++ b/xen/drivers/passthrough/amd/iommu_map.c
@@ -276,8 +276,9 @@ static int iommu_pde_from_dfn(struct domain *d, unsigned long dfn,
     return 0;
 }
 
-int amd_iommu_map_page(struct domain *d, dfn_t dfn, mfn_t mfn,
-                       unsigned int flags, unsigned int *flush_flags)
+int cf_check amd_iommu_map_page(
+    struct domain *d, dfn_t dfn, mfn_t mfn, unsigned int flags,
+    unsigned int *flush_flags)
 {
     struct domain_iommu *hd = dom_iommu(d);
     int rc;
@@ -326,8 +327,8 @@ int amd_iommu_map_page(struct domain *d, dfn_t dfn, mfn_t mfn,
     return 0;
 }
 
-int amd_iommu_unmap_page(struct domain *d, dfn_t dfn,
-                         unsigned int *flush_flags)
+int cf_check amd_iommu_unmap_page(
+    struct domain *d, dfn_t dfn, unsigned int *flush_flags)
 {
     unsigned long pt_mfn = 0;
     struct domain_iommu *hd = dom_iommu(d);
@@ -370,9 +371,9 @@ static unsigned long flush_count(unsigned long dfn, unsigned long page_count,
     return end - start;
 }
 
-int amd_iommu_flush_iotlb_pages(struct domain *d, dfn_t dfn,
-                                unsigned long page_count,
-                                unsigned int flush_flags)
+int cf_check amd_iommu_flush_iotlb_pages(
+    struct domain *d, dfn_t dfn, unsigned long page_count,
+    unsigned int flush_flags)
 {
     unsigned long dfn_l = dfn_x(dfn);
 
@@ -410,7 +411,7 @@ int amd_iommu_flush_iotlb_pages(struct domain *d, dfn_t dfn,
     return 0;
 }
 
-int amd_iommu_flush_iotlb_all(struct domain *d)
+int cf_check amd_iommu_flush_iotlb_all(struct domain *d)
 {
     amd_iommu_flush_all_pages(d);
 
@@ -462,7 +463,8 @@ int amd_iommu_reserve_domain_unity_unmap(struct domain *d,
     return rc;
 }
 
-int amd_iommu_get_reserved_device_memory(iommu_grdm_t *func, void *ctxt)
+int cf_check amd_iommu_get_reserved_device_memory(
+    iommu_grdm_t *func, void *ctxt)
 {
     unsigned int seg = 0 /* XXX */, bdf;
     const struct ivrs_mappings *ivrs_mappings = get_ivrs_mappings(seg);
@@ -537,7 +539,7 @@ int amd_iommu_get_reserved_device_memory(iommu_grdm_t *func, void *ctxt)
     return 0;
 }
 
-int __init amd_iommu_quarantine_init(struct domain *d)
+int __init cf_check amd_iommu_quarantine_init(struct domain *d)
 {
     struct domain_iommu *hd = dom_iommu(d);
     unsigned long end_gfn =
diff --git a/xen/drivers/passthrough/amd/pci_amd_iommu.c b/xen/drivers/passthrough/amd/pci_amd_iommu.c
index 9642bba43a26..e57f555d00d1 100644
--- a/xen/drivers/passthrough/amd/pci_amd_iommu.c
+++ b/xen/drivers/passthrough/amd/pci_amd_iommu.c
@@ -197,7 +197,7 @@ int __init acpi_ivrs_init(void)
     return 0;
 }
 
-static int __init iov_detect(void)
+static int __init cf_check iov_detect(void)
 {
     if ( !iommu_enable && !iommu_intremap )
         return 0;
@@ -217,7 +217,7 @@ static int __init iov_detect(void)
     return 0;
 }
 
-static int iov_enable_xt(void)
+static int cf_check iov_enable_xt(void)
 {
     int rc;
 
@@ -253,7 +253,7 @@ int amd_iommu_alloc_root(struct domain *d)
 unsigned int __read_mostly amd_iommu_max_paging_mode = 6;
 int __read_mostly amd_iommu_min_paging_mode = 1;
 
-static int amd_iommu_domain_init(struct domain *d)
+static int cf_check amd_iommu_domain_init(struct domain *d)
 {
     struct domain_iommu *hd = dom_iommu(d);
 
@@ -275,9 +275,9 @@ static int amd_iommu_domain_init(struct domain *d)
     return 0;
 }
 
-static int amd_iommu_add_device(u8 devfn, struct pci_dev *pdev);
+static int cf_check amd_iommu_add_device(u8 devfn, struct pci_dev *pdev);
 
-static void __hwdom_init amd_iommu_hwdom_init(struct domain *d)
+static void __hwdom_init cf_check amd_iommu_hwdom_init(struct domain *d)
 {
     const struct amd_iommu *iommu;
 
@@ -350,8 +350,9 @@ static void amd_iommu_disable_domain_device(const struct domain *domain,
         spin_unlock_irqrestore(&iommu->lock, flags);
 }
 
-static int reassign_device(struct domain *source, struct domain *target,
-                           u8 devfn, struct pci_dev *pdev)
+static int cf_check reassign_device(
+    struct domain *source, struct domain *target, u8 devfn,
+    struct pci_dev *pdev)
 {
     struct amd_iommu *iommu;
     int bdf, rc;
@@ -404,9 +405,8 @@ static int reassign_device(struct domain *source, struct domain *target,
     return 0;
 }
 
-static int amd_iommu_assign_device(struct domain *d, u8 devfn,
-                                   struct pci_dev *pdev,
-                                   u32 flag)
+static int cf_check amd_iommu_assign_device(
+    struct domain *d, u8 devfn, struct pci_dev *pdev, u32 flag)
 {
     struct ivrs_mappings *ivrs_mappings = get_ivrs_mappings(pdev->seg);
     int bdf = PCI_BDF2(pdev->bus, devfn);
@@ -435,7 +435,7 @@ static int amd_iommu_assign_device(struct domain *d, u8 devfn,
     return rc;
 }
 
-static void amd_iommu_clear_root_pgtable(struct domain *d)
+static void cf_check amd_iommu_clear_root_pgtable(struct domain *d)
 {
     struct domain_iommu *hd = dom_iommu(d);
 
@@ -444,13 +444,13 @@ static void amd_iommu_clear_root_pgtable(struct domain *d)
     spin_unlock(&hd->arch.mapping_lock);
 }
 
-static void amd_iommu_domain_destroy(struct domain *d)
+static void cf_check amd_iommu_domain_destroy(struct domain *d)
 {
     iommu_identity_map_teardown(d);
     ASSERT(!dom_iommu(d)->arch.amd.root_table);
 }
 
-static int amd_iommu_add_device(u8 devfn, struct pci_dev *pdev)
+static int cf_check amd_iommu_add_device(u8 devfn, struct pci_dev *pdev)
 {
     struct amd_iommu *iommu;
     u16 bdf;
@@ -525,7 +525,7 @@ static int amd_iommu_add_device(u8 devfn, struct pci_dev *pdev)
     return amd_iommu_setup_domain_device(pdev->domain, iommu, devfn, pdev);
 }
 
-static int amd_iommu_remove_device(u8 devfn, struct pci_dev *pdev)
+static int cf_check amd_iommu_remove_device(u8 devfn, struct pci_dev *pdev)
 {
     struct amd_iommu *iommu;
     u16 bdf;
@@ -562,7 +562,7 @@ static int amd_iommu_remove_device(u8 devfn, struct pci_dev *pdev)
     return 0;
 }
 
-static int amd_iommu_group_id(u16 seg, u8 bus, u8 devfn)
+static int cf_check amd_iommu_group_id(u16 seg, u8 bus, u8 devfn)
 {
     int bdf = PCI_BDF2(bus, devfn);
 
@@ -616,7 +616,7 @@ static void amd_dump_page_table_level(struct page_info *pg, int level,
     unmap_domain_page(table_vaddr);
 }
 
-static void amd_dump_page_tables(struct domain *d)
+static void cf_check amd_dump_page_tables(struct domain *d)
 {
     const struct domain_iommu *hd = dom_iommu(d);
 
diff --git a/xen/drivers/passthrough/pci.c b/xen/drivers/passthrough/pci.c
index 18af4e5088a0..22cb3872c22c 100644
--- a/xen/drivers/passthrough/pci.c
+++ b/xen/drivers/passthrough/pci.c
@@ -1098,7 +1098,7 @@ void pci_check_disable_device(u16 seg, u8 bus, u8 devfn)
  * scan pci devices to add all existed PCI devices to alldevs_list,
  * and setup pci hierarchy in array bus2bridge.
  */
-static int __init _scan_pci_devices(struct pci_seg *pseg, void *arg)
+static int __init cf_check _scan_pci_devices(struct pci_seg *pseg, void *arg)
 {
     struct pci_dev *pdev;
     int bus, dev, func;
@@ -1176,7 +1176,8 @@ static void __hwdom_init setup_one_hwdom_device(const struct setup_hwdom *ctxt,
                ctxt->d->domain_id, err);
 }
 
-static int __hwdom_init _setup_hwdom_pci_devices(struct pci_seg *pseg, void *arg)
+static int __hwdom_init cf_check _setup_hwdom_pci_devices(
+    struct pci_seg *pseg, void *arg)
 {
     struct setup_hwdom *ctxt = arg;
     int bus, devfn;
@@ -1333,7 +1334,7 @@ bool_t pcie_aer_get_firmware_first(const struct pci_dev *pdev)
 }
 #endif
 
-static int _dump_pci_devices(struct pci_seg *pseg, void *arg)
+static int cf_check _dump_pci_devices(struct pci_seg *pseg, void *arg)
 {
     struct pci_dev *pdev;
 
diff --git a/xen/drivers/passthrough/vtd/dmar.c b/xen/drivers/passthrough/vtd/dmar.c
index b8e91f5be1ae..63f8642e126a 100644
--- a/xen/drivers/passthrough/vtd/dmar.c
+++ b/xen/drivers/passthrough/vtd/dmar.c
@@ -1046,7 +1046,8 @@ bool_t __init platform_supports_x2apic(void)
     return cpu_has_x2apic && ((dmar_flags & mask) == ACPI_DMAR_INTR_REMAP);
 }
 
-int intel_iommu_get_reserved_device_memory(iommu_grdm_t *func, void *ctxt)
+int cf_check intel_iommu_get_reserved_device_memory(
+    iommu_grdm_t *func, void *ctxt)
 {
     struct acpi_rmrr_unit *rmrr, *rmrr_cur = NULL;
     unsigned int i;
diff --git a/xen/drivers/passthrough/vtd/extern.h b/xen/drivers/passthrough/vtd/extern.h
index ccf8df7be4f6..e6535548e1c1 100644
--- a/xen/drivers/passthrough/vtd/extern.h
+++ b/xen/drivers/passthrough/vtd/extern.h
@@ -33,9 +33,9 @@ void print_iommu_regs(struct acpi_drhd_unit *drhd);
 void print_vtd_entries(struct vtd_iommu *iommu, int bus, int devfn, u64 gmfn);
 keyhandler_fn_t cf_check vtd_dump_iommu_info;
 
-bool intel_iommu_supports_eim(void);
-int intel_iommu_enable_eim(void);
-void intel_iommu_disable_eim(void);
+bool cf_check intel_iommu_supports_eim(void);
+int cf_check intel_iommu_enable_eim(void);
+void cf_check intel_iommu_disable_eim(void);
 
 int enable_qinval(struct vtd_iommu *iommu);
 void disable_qinval(struct vtd_iommu *iommu);
@@ -51,15 +51,13 @@ int iommu_flush_iec_global(struct vtd_iommu *iommu);
 int iommu_flush_iec_index(struct vtd_iommu *iommu, u8 im, u16 iidx);
 void clear_fault_bits(struct vtd_iommu *iommu);
 
-int __must_check vtd_flush_context_reg(struct vtd_iommu *iommu, uint16_t did,
-                                       uint16_t source_id,
-                                       uint8_t function_mask, uint64_t type,
-                                       bool flush_non_present_entry);
-int __must_check vtd_flush_iotlb_reg(struct vtd_iommu *iommu, uint16_t did,
-                                     uint64_t addr, unsigned int size_order,
-                                     uint64_t type,
-                                     bool flush_non_present_entry,
-                                     bool flush_dev_iotlb);
+int __must_check cf_check vtd_flush_context_reg(
+    struct vtd_iommu *iommu, uint16_t did, uint16_t source_id,
+    uint8_t function_mask, uint64_t type, bool flush_non_present_entry);
+int __must_check cf_check vtd_flush_iotlb_reg(
+    struct vtd_iommu *iommu, uint16_t did, uint64_t addr,
+    unsigned int size_order, uint64_t type, bool flush_non_present_entry,
+    bool flush_dev_iotlb);
 
 struct vtd_iommu *ioapic_to_iommu(unsigned int apic_id);
 struct vtd_iommu *hpet_to_iommu(unsigned int hpet_id);
@@ -86,17 +84,19 @@ int domain_context_mapping_one(struct domain *domain, struct vtd_iommu *iommu,
                                u8 bus, u8 devfn, const struct pci_dev *);
 int domain_context_unmap_one(struct domain *domain, struct vtd_iommu *iommu,
                              u8 bus, u8 devfn);
-int intel_iommu_get_reserved_device_memory(iommu_grdm_t *func, void *ctxt);
+int cf_check intel_iommu_get_reserved_device_memory(
+    iommu_grdm_t *func, void *ctxt);
 
-unsigned int io_apic_read_remap_rte(unsigned int apic, unsigned int reg);
-void io_apic_write_remap_rte(unsigned int apic,
-                             unsigned int reg, unsigned int value);
+unsigned int cf_check io_apic_read_remap_rte(
+    unsigned int apic, unsigned int reg);
+void cf_check io_apic_write_remap_rte(
+    unsigned int apic, unsigned int reg, unsigned int value);
 
 struct msi_desc;
 struct msi_msg;
-int msi_msg_write_remap_rte(struct msi_desc *, struct msi_msg *);
+int cf_check msi_msg_write_remap_rte(struct msi_desc *, struct msi_msg *);
 
-int intel_setup_hpet_msi(struct msi_desc *);
+int cf_check intel_setup_hpet_msi(struct msi_desc *);
 
 int is_igd_vt_enabled_quirk(void);
 bool is_azalia_tlb_enabled(const struct acpi_drhd_unit *);
diff --git a/xen/drivers/passthrough/vtd/intremap.c b/xen/drivers/passthrough/vtd/intremap.c
index 01152f200664..e6ba89591b6f 100644
--- a/xen/drivers/passthrough/vtd/intremap.c
+++ b/xen/drivers/passthrough/vtd/intremap.c
@@ -142,7 +142,7 @@ static void set_hpet_source_id(unsigned int id, struct iremap_entry *ire)
     set_ire_sid(ire, SVT_VERIFY_SID_SQ, SQ_13_IGNORE_3, hpetid_to_bdf(id));
 }
 
-bool __init intel_iommu_supports_eim(void)
+bool __init cf_check intel_iommu_supports_eim(void)
 {
     struct acpi_drhd_unit *drhd;
     unsigned int apic;
@@ -414,7 +414,7 @@ static int ioapic_rte_to_remap_entry(struct vtd_iommu *iommu,
     return 0;
 }
 
-unsigned int io_apic_read_remap_rte(
+unsigned int cf_check io_apic_read_remap_rte(
     unsigned int apic, unsigned int reg)
 {
     unsigned int ioapic_pin = (reg - 0x10) / 2;
@@ -438,7 +438,7 @@ unsigned int io_apic_read_remap_rte(
         return (*(((u32 *)&old_rte) + 0));
 }
 
-void io_apic_write_remap_rte(
+void cf_check io_apic_write_remap_rte(
     unsigned int apic, unsigned int reg, unsigned int value)
 {
     unsigned int ioapic_pin = (reg - 0x10) / 2;
@@ -639,7 +639,7 @@ static int msi_msg_to_remap_entry(
     return 0;
 }
 
-int msi_msg_write_remap_rte(
+int cf_check msi_msg_write_remap_rte(
     struct msi_desc *msi_desc, struct msi_msg *msg)
 {
     struct pci_dev *pdev = msi_desc->dev;
@@ -651,7 +651,7 @@ int msi_msg_write_remap_rte(
                 : -EINVAL;
 }
 
-int __init intel_setup_hpet_msi(struct msi_desc *msi_desc)
+int __init cf_check intel_setup_hpet_msi(struct msi_desc *msi_desc)
 {
     struct vtd_iommu *iommu = hpet_to_iommu(msi_desc->hpet_id);
     unsigned long flags;
@@ -802,7 +802,7 @@ void disable_intremap(struct vtd_iommu *iommu)
  * This function is used to enable Interrupt remapping when
  * enable x2apic
  */
-int intel_iommu_enable_eim(void)
+int cf_check intel_iommu_enable_eim(void)
 {
     struct acpi_drhd_unit *drhd;
     struct vtd_iommu *iommu;
@@ -856,7 +856,7 @@ int intel_iommu_enable_eim(void)
  * This function is used to disable Interrupt remapping when
  * suspend local apic
  */
-void intel_iommu_disable_eim(void)
+void cf_check intel_iommu_disable_eim(void)
 {
     struct acpi_drhd_unit *drhd;
 
diff --git a/xen/drivers/passthrough/vtd/iommu.c b/xen/drivers/passthrough/vtd/iommu.c
index 42181e12be5a..1a1cf14785cb 100644
--- a/xen/drivers/passthrough/vtd/iommu.c
+++ b/xen/drivers/passthrough/vtd/iommu.c
@@ -59,7 +59,7 @@ static unsigned int __read_mostly nr_iommus;
 static struct iommu_ops vtd_ops;
 static struct tasklet vtd_fault_tasklet;
 
-static int setup_hwdom_device(u8 devfn, struct pci_dev *);
+static int cf_check setup_hwdom_device(u8 devfn, struct pci_dev *);
 static void setup_hwdom_rmrr(struct domain *d);
 
 static bool domid_mapping(const struct vtd_iommu *iommu)
@@ -426,9 +426,9 @@ static void iommu_flush_write_buffer(struct vtd_iommu *iommu)
 }
 
 /* return value determine if we need a write buffer flush */
-int vtd_flush_context_reg(struct vtd_iommu *iommu, uint16_t did,
-                          uint16_t source_id, uint8_t function_mask,
-                          uint64_t type, bool flush_non_present_entry)
+int cf_check vtd_flush_context_reg(
+    struct vtd_iommu *iommu, uint16_t did, uint16_t source_id,
+    uint8_t function_mask, uint64_t type, bool flush_non_present_entry)
 {
     unsigned long flags;
 
@@ -493,9 +493,10 @@ static int __must_check iommu_flush_context_device(struct vtd_iommu *iommu,
 }
 
 /* return value determine if we need a write buffer flush */
-int vtd_flush_iotlb_reg(struct vtd_iommu *iommu, uint16_t did, uint64_t addr,
-                        unsigned int size_order, uint64_t type,
-                        bool flush_non_present_entry, bool flush_dev_iotlb)
+int cf_check vtd_flush_iotlb_reg(
+    struct vtd_iommu *iommu, uint16_t did, uint64_t addr,
+    unsigned int size_order, uint64_t type, bool flush_non_present_entry,
+    bool flush_dev_iotlb)
 {
     int tlb_offset = ecap_iotlb_offset(iommu->ecap);
     uint64_t val = type | DMA_TLB_IVT;
@@ -704,10 +705,9 @@ static int __must_check iommu_flush_iotlb(struct domain *d, dfn_t dfn,
     return ret;
 }
 
-static int __must_check iommu_flush_iotlb_pages(struct domain *d,
-                                                dfn_t dfn,
-                                                unsigned long page_count,
-                                                unsigned int flush_flags)
+static int __must_check cf_check iommu_flush_iotlb_pages(
+    struct domain *d, dfn_t dfn, unsigned long page_count,
+    unsigned int flush_flags)
 {
     ASSERT(page_count && !dfn_eq(dfn, INVALID_DFN));
     ASSERT(flush_flags);
@@ -716,7 +716,7 @@ static int __must_check iommu_flush_iotlb_pages(struct domain *d,
                              page_count);
 }
 
-static int __must_check iommu_flush_iotlb_all(struct domain *d)
+static int __must_check cf_check iommu_flush_iotlb_all(struct domain *d)
 {
     return iommu_flush_iotlb(d, INVALID_DFN, 0, 0);
 }
@@ -1345,7 +1345,7 @@ void __init iommu_free(struct acpi_drhd_unit *drhd)
         agaw = 64;                              \
     agaw; })
 
-static int intel_iommu_domain_init(struct domain *d)
+static int cf_check intel_iommu_domain_init(struct domain *d)
 {
     struct domain_iommu *hd = dom_iommu(d);
 
@@ -1359,7 +1359,7 @@ static int intel_iommu_domain_init(struct domain *d)
     return 0;
 }
 
-static void __hwdom_init intel_iommu_hwdom_init(struct domain *d)
+static void __hwdom_init cf_check intel_iommu_hwdom_init(struct domain *d)
 {
     struct acpi_drhd_unit *drhd;
 
@@ -1808,7 +1808,7 @@ static int domain_context_unmap(struct domain *domain, u8 devfn,
     return ret;
 }
 
-static void iommu_clear_root_pgtable(struct domain *d)
+static void cf_check iommu_clear_root_pgtable(struct domain *d)
 {
     struct domain_iommu *hd = dom_iommu(d);
 
@@ -1817,7 +1817,7 @@ static void iommu_clear_root_pgtable(struct domain *d)
     spin_unlock(&hd->arch.mapping_lock);
 }
 
-static void iommu_domain_teardown(struct domain *d)
+static void cf_check iommu_domain_teardown(struct domain *d)
 {
     struct domain_iommu *hd = dom_iommu(d);
     const struct acpi_drhd_unit *drhd;
@@ -1835,9 +1835,9 @@ static void iommu_domain_teardown(struct domain *d)
     XFREE(hd->arch.vtd.iommu_bitmap);
 }
 
-static int __must_check intel_iommu_map_page(struct domain *d, dfn_t dfn,
-                                             mfn_t mfn, unsigned int flags,
-                                             unsigned int *flush_flags)
+static int __must_check cf_check intel_iommu_map_page(
+    struct domain *d, dfn_t dfn, mfn_t mfn, unsigned int flags,
+    unsigned int *flush_flags)
 {
     struct domain_iommu *hd = dom_iommu(d);
     struct dma_pte *page, *pte, old, new = {};
@@ -1906,8 +1906,8 @@ static int __must_check intel_iommu_map_page(struct domain *d, dfn_t dfn,
     return rc;
 }
 
-static int __must_check intel_iommu_unmap_page(struct domain *d, dfn_t dfn,
-                                               unsigned int *flush_flags)
+static int __must_check cf_check intel_iommu_unmap_page(
+    struct domain *d, dfn_t dfn, unsigned int *flush_flags)
 {
     /* Do nothing if VT-d shares EPT page table */
     if ( iommu_use_hap_pt(d) )
@@ -1922,8 +1922,8 @@ static int __must_check intel_iommu_unmap_page(struct domain *d, dfn_t dfn,
     return 0;
 }
 
-static int intel_iommu_lookup_page(struct domain *d, dfn_t dfn, mfn_t *mfn,
-                                   unsigned int *flags)
+static int cf_check intel_iommu_lookup_page(
+    struct domain *d, dfn_t dfn, mfn_t *mfn, unsigned int *flags)
 {
     struct domain_iommu *hd = dom_iommu(d);
     struct dma_pte *page, val;
@@ -1975,7 +1975,7 @@ static int __init vtd_ept_page_compatible(struct vtd_iommu *iommu)
            (ept_has_1gb(ept_cap) && opt_hap_1gb) <= cap_sps_1gb(vtd_cap);
 }
 
-static int intel_iommu_add_device(u8 devfn, struct pci_dev *pdev)
+static int cf_check intel_iommu_add_device(u8 devfn, struct pci_dev *pdev)
 {
     struct acpi_rmrr_unit *rmrr;
     u16 bdf;
@@ -2018,7 +2018,7 @@ static int intel_iommu_add_device(u8 devfn, struct pci_dev *pdev)
     return 0;
 }
 
-static int intel_iommu_enable_device(struct pci_dev *pdev)
+static int cf_check intel_iommu_enable_device(struct pci_dev *pdev)
 {
     struct acpi_drhd_unit *drhd = acpi_find_matched_drhd_unit(pdev);
     int ret = drhd ? ats_device(pdev, drhd) : -ENODEV;
@@ -2033,7 +2033,7 @@ static int intel_iommu_enable_device(struct pci_dev *pdev)
     return ret >= 0 ? 0 : ret;
 }
 
-static int intel_iommu_remove_device(u8 devfn, struct pci_dev *pdev)
+static int cf_check intel_iommu_remove_device(u8 devfn, struct pci_dev *pdev)
 {
     struct acpi_rmrr_unit *rmrr;
     u16 bdf;
@@ -2060,7 +2060,8 @@ static int intel_iommu_remove_device(u8 devfn, struct pci_dev *pdev)
     return domain_context_unmap(pdev->domain, devfn, pdev);
 }
 
-static int __hwdom_init setup_hwdom_device(u8 devfn, struct pci_dev *pdev)
+static int __hwdom_init cf_check setup_hwdom_device(
+    u8 devfn, struct pci_dev *pdev)
 {
     return domain_context_mapping(pdev->domain, devfn, pdev);
 }
@@ -2266,7 +2267,7 @@ static struct iommu_state {
     uint32_t fectl;
 } *__read_mostly iommu_state;
 
-static int __init vtd_setup(void)
+static int __init cf_check vtd_setup(void)
 {
     struct acpi_drhd_unit *drhd;
     struct vtd_iommu *iommu;
@@ -2401,7 +2402,7 @@ static int __init vtd_setup(void)
     return ret;
 }
 
-static int reassign_device_ownership(
+static int cf_check reassign_device_ownership(
     struct domain *source,
     struct domain *target,
     u8 devfn, struct pci_dev *pdev)
@@ -2479,7 +2480,7 @@ static int reassign_device_ownership(
     return ret;
 }
 
-static int intel_iommu_assign_device(
+static int cf_check intel_iommu_assign_device(
     struct domain *d, u8 devfn, struct pci_dev *pdev, u32 flag)
 {
     struct domain *s = pdev->domain;
@@ -2561,7 +2562,7 @@ static int intel_iommu_assign_device(
     return ret;
 }
 
-static int intel_iommu_group_id(u16 seg, u8 bus, u8 devfn)
+static int cf_check intel_iommu_group_id(u16 seg, u8 bus, u8 devfn)
 {
     u8 secbus;
 
@@ -2571,7 +2572,7 @@ static int intel_iommu_group_id(u16 seg, u8 bus, u8 devfn)
     return PCI_BDF2(bus, devfn);
 }
 
-static int __must_check vtd_suspend(void)
+static int __must_check cf_check vtd_suspend(void)
 {
     struct acpi_drhd_unit *drhd;
     struct vtd_iommu *iommu;
@@ -2614,7 +2615,7 @@ static int __must_check vtd_suspend(void)
     return 0;
 }
 
-static void vtd_crash_shutdown(void)
+static void cf_check vtd_crash_shutdown(void)
 {
     struct acpi_drhd_unit *drhd;
     struct vtd_iommu *iommu;
@@ -2635,7 +2636,7 @@ static void vtd_crash_shutdown(void)
     }
 }
 
-static void vtd_resume(void)
+static void cf_check vtd_resume(void)
 {
     struct acpi_drhd_unit *drhd;
     struct vtd_iommu *iommu;
@@ -2713,7 +2714,7 @@ static void vtd_dump_page_table_level(paddr_t pt_maddr, int level, paddr_t gpa,
     unmap_vtd_domain_page(pt_vaddr);
 }
 
-static void vtd_dump_page_tables(struct domain *d)
+static void cf_check vtd_dump_page_tables(struct domain *d)
 {
     const struct domain_iommu *hd = dom_iommu(d);
 
@@ -2723,7 +2724,7 @@ static void vtd_dump_page_tables(struct domain *d)
                               agaw_to_level(hd->arch.vtd.agaw), 0, 0);
 }
 
-static int __init intel_iommu_quarantine_init(struct domain *d)
+static int __init cf_check intel_iommu_quarantine_init(struct domain *d)
 {
     struct domain_iommu *hd = dom_iommu(d);
     struct page_info *pg;
diff --git a/xen/drivers/passthrough/vtd/qinval.c b/xen/drivers/passthrough/vtd/qinval.c
index 9f291f47e518..beeb65f0deec 100644
--- a/xen/drivers/passthrough/vtd/qinval.c
+++ b/xen/drivers/passthrough/vtd/qinval.c
@@ -322,9 +322,9 @@ int iommu_flush_iec_index(struct vtd_iommu *iommu, u8 im, u16 iidx)
     return queue_invalidate_iec_sync(iommu, IEC_INDEX_INVL, im, iidx);
 }
 
-static int __must_check flush_context_qi(struct vtd_iommu *iommu, u16 did,
-                                         u16 sid, u8 fm, u64 type,
-                                         bool flush_non_present_entry)
+static int __must_check cf_check flush_context_qi(
+    struct vtd_iommu *iommu, u16 did, u16 sid, u8 fm, u64 type,
+    bool flush_non_present_entry)
 {
     ASSERT(iommu->qinval_maddr);
 
@@ -346,11 +346,9 @@ static int __must_check flush_context_qi(struct vtd_iommu *iommu, u16 did,
                                          type >> DMA_CCMD_INVL_GRANU_OFFSET);
 }
 
-static int __must_check flush_iotlb_qi(struct vtd_iommu *iommu, u16 did,
-                                       u64 addr,
-                                       unsigned int size_order, u64 type,
-                                       bool flush_non_present_entry,
-                                       bool flush_dev_iotlb)
+static int __must_check cf_check flush_iotlb_qi(
+    struct vtd_iommu *iommu, u16 did, u64 addr, unsigned int size_order,
+    u64 type, bool flush_non_present_entry, bool flush_dev_iotlb)
 {
     u8 dr = 0, dw = 0;
     int ret = 0, rc;
@@ -461,18 +459,18 @@ int enable_qinval(struct vtd_iommu *iommu)
     return 0;
 }
 
-static int vtd_flush_context_noop(struct vtd_iommu *iommu, uint16_t did,
-                                  uint16_t source_id, uint8_t function_mask,
-                                  uint64_t type, bool flush_non_present_entry)
+static int cf_check vtd_flush_context_noop(
+    struct vtd_iommu *iommu, uint16_t did, uint16_t source_id,
+    uint8_t function_mask, uint64_t type, bool flush_non_present_entry)
 {
     WARN();
     return -EIO;
 }
 
-static int vtd_flush_iotlb_noop(struct vtd_iommu *iommu, uint16_t did,
-                                uint64_t addr, unsigned int size_order,
-                                uint64_t type, bool flush_non_present_entry,
-                                bool flush_dev_iotlb)
+static int cf_check vtd_flush_iotlb_noop(
+    struct vtd_iommu *iommu, uint16_t did, uint64_t addr,
+    unsigned int size_order, uint64_t type, bool flush_non_present_entry,
+    bool flush_dev_iotlb)
 {
     WARN();
     return -EIO;
-- 
2.11.0


