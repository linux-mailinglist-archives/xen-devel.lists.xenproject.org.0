Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AE10280838B
	for <lists+xen-devel@lfdr.de>; Thu,  7 Dec 2023 09:48:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.649611.1014350 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rBA3J-0005nE-FW; Thu, 07 Dec 2023 08:48:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 649611.1014350; Thu, 07 Dec 2023 08:48:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rBA3J-0005ix-BV; Thu, 07 Dec 2023 08:48:13 +0000
Received: by outflank-mailman (input) for mailman id 649611;
 Thu, 07 Dec 2023 08:48:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ZB3o=HS=bugseng.com=federico.serafini@srs-se1.protection.inumbo.net>)
 id 1rBA3I-0004rG-5q
 for xen-devel@lists.xenproject.org; Thu, 07 Dec 2023 08:48:12 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 59f5b252-94dd-11ee-98e7-6d05b1d4d9a1;
 Thu, 07 Dec 2023 09:48:11 +0100 (CET)
Received: from Dell.bugseng.com (unknown [78.210.131.21])
 by support.bugseng.com (Postfix) with ESMTPSA id 7AF714EE073F;
 Thu,  7 Dec 2023 09:48:09 +0100 (CET)
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
X-Inumbo-ID: 59f5b252-94dd-11ee-98e7-6d05b1d4d9a1
From: Federico Serafini <federico.serafini@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com,
	Federico Serafini <federico.serafini@bugseng.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [XEN PATCH v2 5/5] AMD/IOMMU: address violations of MISRA C:2012 Rule 8.2
Date: Thu,  7 Dec 2023 09:47:54 +0100
Message-Id: <68a1922cce9a68a8b69661d564fccc012cf5f414.1701936906.git.federico.serafini@bugseng.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1701936906.git.federico.serafini@bugseng.com>
References: <cover.1701936906.git.federico.serafini@bugseng.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add missing parameter names to address violations of MISRA C:2012
Rule 8.2. Remove trailing spaces and use C standard types to comply
with XEN coding style. No functional change.

Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
---
Changes in v2:
  - use "enable" instead of "iommu_control" as parameter name.
---
 xen/drivers/passthrough/amd/iommu.h      | 17 ++++++++++-------
 xen/drivers/passthrough/amd/iommu_init.c | 24 ++++++++++++++----------
 2 files changed, 24 insertions(+), 17 deletions(-)

diff --git a/xen/drivers/passthrough/amd/iommu.h b/xen/drivers/passthrough/amd/iommu.h
index d4416ebc43..1b62c083ba 100644
--- a/xen/drivers/passthrough/amd/iommu.h
+++ b/xen/drivers/passthrough/amd/iommu.h
@@ -138,10 +138,12 @@ struct ivrs_mappings {
 extern unsigned int ivrs_bdf_entries;
 extern u8 ivhd_type;
 
-struct ivrs_mappings *get_ivrs_mappings(u16 seg);
-int iterate_ivrs_mappings(int (*)(u16 seg, struct ivrs_mappings *));
-int iterate_ivrs_entries(int (*)(const struct amd_iommu *,
-                                 struct ivrs_mappings *, uint16_t));
+struct ivrs_mappings *get_ivrs_mappings(uint16_t seg);
+int iterate_ivrs_mappings(int (*handler)(uint16_t seg,
+                                         struct ivrs_mappings *map));
+int iterate_ivrs_entries(int (*handler)(const struct amd_iommu *iommu,
+                                        struct ivrs_mappings *map,
+                                        uint16_t bdf));
 
 /* iommu tables in guest space */
 struct mmio_reg {
@@ -226,7 +228,7 @@ struct acpi_ivrs_hardware;
 /* amd-iommu-detect functions */
 int amd_iommu_get_ivrs_dev_entries(void);
 int amd_iommu_get_supported_ivhd_type(void);
-int amd_iommu_detect_one_acpi(const struct acpi_ivrs_hardware *);
+int amd_iommu_detect_one_acpi(const struct acpi_ivrs_hardware *ivhd_block);
 int amd_iommu_detect_acpi(void);
 void get_iommu_features(struct amd_iommu *iommu);
 
@@ -295,9 +297,10 @@ struct amd_iommu *find_iommu_for_device(int seg, int bdf);
 bool cf_check iov_supports_xt(void);
 int amd_iommu_setup_ioapic_remapping(void);
 void *amd_iommu_alloc_intremap_table(
-    const struct amd_iommu *, unsigned long **, unsigned int nr);
+    const struct amd_iommu *iommu, unsigned long **inuse_map, unsigned int nr);
 int cf_check amd_iommu_free_intremap_table(
-    const struct amd_iommu *, struct ivrs_mappings *, uint16_t);
+    const struct amd_iommu *iommu, struct ivrs_mappings *ivrs_mapping,
+    uint16_t bdf);
 unsigned int amd_iommu_intremap_table_order(
     const void *irt, const struct amd_iommu *iommu);
 void cf_check amd_iommu_ioapic_update_ire(
diff --git a/xen/drivers/passthrough/amd/iommu_init.c b/xen/drivers/passthrough/amd/iommu_init.c
index 5515cb70fd..25e62f20ae 100644
--- a/xen/drivers/passthrough/amd/iommu_init.c
+++ b/xen/drivers/passthrough/amd/iommu_init.c
@@ -300,12 +300,13 @@ static void cf_check set_iommu_ppr_log_control(
 static int iommu_read_log(struct amd_iommu *iommu,
                           struct ring_buffer *log,
                           unsigned int entry_size,
-                          void (*parse_func)(struct amd_iommu *, u32 *))
+                          void (*parse_func)(struct amd_iommu *iommu,
+                                             uint32_t *entry))
 {
     unsigned int tail, tail_offest, head_offset;
 
     BUG_ON(!iommu || ((log != &iommu->event_log) && (log != &iommu->ppr_log)));
-    
+
     spin_lock(&log->lock);
 
     /* make sure there's an entry in the log */
@@ -361,14 +362,15 @@ static int iommu_read_log(struct amd_iommu *iommu,
 
  out:
     spin_unlock(&log->lock);
-   
+
     return 0;
 }
 
 /* reset event log or ppr log when overflow */
 static void iommu_reset_log(struct amd_iommu *iommu,
                             struct ring_buffer *log,
-                            void (*ctrl_func)(struct amd_iommu *iommu, bool))
+                            void (*ctrl_func)(struct amd_iommu *iommu,
+                                              bool enable))
 {
     unsigned int entry, run_bit, loop_count = 1000;
     bool log_run;
@@ -1158,14 +1160,15 @@ static void __init amd_iommu_init_cleanup(void)
     iommuv2_enabled = 0;
 }
 
-struct ivrs_mappings *get_ivrs_mappings(u16 seg)
+struct ivrs_mappings *get_ivrs_mappings(uint16_t seg)
 {
     return radix_tree_lookup(&ivrs_maps, seg);
 }
 
-int iterate_ivrs_mappings(int (*handler)(u16 seg, struct ivrs_mappings *))
+int iterate_ivrs_mappings(int (*handler)(uint16_t seg,
+                                         struct ivrs_mappings *map))
 {
-    u16 seg = 0;
+    uint16_t seg = 0;
     int rc = 0;
 
     do {
@@ -1180,10 +1183,11 @@ int iterate_ivrs_mappings(int (*handler)(u16 seg, struct ivrs_mappings *))
     return rc;
 }
 
-int iterate_ivrs_entries(int (*handler)(const struct amd_iommu *,
-                                        struct ivrs_mappings *, uint16_t bdf))
+int iterate_ivrs_entries(int (*handler)(const struct amd_iommu *iommu,
+                                        struct ivrs_mappings *map,
+                                        uint16_t bdf))
 {
-    u16 seg = 0;
+    uint16_t seg = 0;
     int rc = 0;
 
     do {
-- 
2.34.1


