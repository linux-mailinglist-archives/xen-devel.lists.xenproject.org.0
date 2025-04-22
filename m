Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F221A96FE6
	for <lists+xen-devel@lfdr.de>; Tue, 22 Apr 2025 17:07:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.962758.1353922 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u7FDM-0000YI-ID; Tue, 22 Apr 2025 15:07:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 962758.1353922; Tue, 22 Apr 2025 15:07:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u7FDM-0000W1-Dk; Tue, 22 Apr 2025 15:07:12 +0000
Received: by outflank-mailman (input) for mailman id 962758;
 Tue, 22 Apr 2025 15:07:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BiSK=XI=3mdeb.com=sergii.dmytruk@srs-se1.protection.inumbo.net>)
 id 1u7FDL-0008SP-C6
 for xen-devel@lists.xenproject.org; Tue, 22 Apr 2025 15:07:11 +0000
Received: from 8.mo581.mail-out.ovh.net (8.mo581.mail-out.ovh.net
 [46.105.77.114]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 76858b95-1f8b-11f0-9ffb-bf95429c2676;
 Tue, 22 Apr 2025 17:07:10 +0200 (CEST)
Received: from director11.ghost.mail-out.ovh.net (unknown [10.109.176.70])
 by mo581.mail-out.ovh.net (Postfix) with ESMTP id 4Zhlvd0QvTz12mP
 for <xen-devel@lists.xenproject.org>; Tue, 22 Apr 2025 15:07:08 +0000 (UTC)
Received: from ghost-submission-5b5ff79f4f-2t4kc (unknown [10.110.101.193])
 by director11.ghost.mail-out.ovh.net (Postfix) with ESMTPS id 0225F1FEF3;
 Tue, 22 Apr 2025 15:07:07 +0000 (UTC)
Received: from 3mdeb.com ([37.59.142.103])
 by ghost-submission-5b5ff79f4f-2t4kc with ESMTPSA
 id SGspLJuwB2j18gAAr3ZL9g
 (envelope-from <sergii.dmytruk@3mdeb.com>); Tue, 22 Apr 2025 15:07:07 +0000
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
X-Inumbo-ID: 76858b95-1f8b-11f0-9ffb-bf95429c2676
Authentication-Results:garm.ovh; auth=pass (GARM-103G005201491dd-ee8b-4e3d-a321-d1be40ce40d6,
                    7E508E014E7E7C169EB13C6E22C3C4EBF1F0FDD7) smtp.auth=sergii.dmytruk@3mdeb.com
X-OVh-ClientIp:176.111.181.178
From: Sergii Dmytruk <sergii.dmytruk@3mdeb.com>
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	trenchboot-devel@googlegroups.com
Subject: [PATCH 02/21] include/xen/slr_table.h: Secure Launch Resource Table definitions
Date: Tue, 22 Apr 2025 18:06:36 +0300
Message-ID: <1cf5d940e666b2b292fc84ed1fbb8a95cd57f027.1745172094.git.sergii.dmytruk@3mdeb.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <cover.1745172094.git.sergii.dmytruk@3mdeb.com>
References: <cover.1745172094.git.sergii.dmytruk@3mdeb.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 12726046651032122524
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvgeegtdehucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepufgvrhhgihhiucffmhihthhruhhkuceoshgvrhhgihhirdgumhihthhruhhkseefmhguvggsrdgtohhmqeenucggtffrrghtthgvrhhnpefhheefheduieelieekfffgfffgfedutdevleevvdfhfffgledvgfdtuddtheefieenucfkphepuddvjedrtddrtddruddpudejiedrudduuddrudekuddrudejkedpfeejrdehledrudegvddruddtfeenucevlhhushhtvghrufhiiigvpedvnecurfgrrhgrmhepihhnvghtpeduvdejrddtrddtrddupdhmrghilhhfrhhomhepshgvrhhgihhirdgumhihthhruhhkseefmhguvggsrdgtohhmpdhnsggprhgtphhtthhopedupdhrtghpthhtohepgigvnhdquggvvhgvlheslhhishhtshdrgigvnhhprhhojhgvtghtrdhorhhgpdfovfetjfhoshhtpehmohehkedumgdpmhhouggvpehsmhhtphhouhht
DKIM-Signature: a=rsa-sha256; bh=dDtdgcHnfkXCPp7L7iFTIH8st3ZVtYKD9N66kBM8l/c=;
 c=relaxed/relaxed; d=3mdeb.com; h=From; s=ovhmo3617313-selector1;
 t=1745334429; v=1;
 b=EhUXmcKxumCFWEJ1CUeQnxu95MelrizzdBQ4ELOzRuDJewvq9ZWy4neVL6dktTtlAUTnE2k+
 qEXes4XdhhGHhy3L4Mcblrfuu35Oig4QI1keHg1K7V319AFg+47nENfy55uGbQJCFz8W98ObHpR
 BG1I/LJmw5j6QNAvYeP3VA8ODpPP95bPWjFK7hlstWaMwTS1oRJ6vtoPxmdf93i+wdYRPg650UU
 11YyefrDrnVKicn+cEN4w6eIljcPOdh50Gmx/mURa0Tdq4GONKcRCzm2JKq2qwFPypHNuTGRHMr
 RchthE1jOhXUYKo9G56zNOKW1tCN+sH7meMmvKdDfFP3A==

The file provides constants, structures and several helper functions for
parsing SLRT.

Signed-off-by: Sergii Dmytruk <sergii.dmytruk@3mdeb.com>
---
 xen/include/xen/slr_table.h | 274 ++++++++++++++++++++++++++++++++++++
 1 file changed, 274 insertions(+)
 create mode 100644 xen/include/xen/slr_table.h

diff --git a/xen/include/xen/slr_table.h b/xen/include/xen/slr_table.h
new file mode 100644
index 0000000000..e9dbac5d0a
--- /dev/null
+++ b/xen/include/xen/slr_table.h
@@ -0,0 +1,274 @@
+/* SPDX-License-Identifier: GPL-3.0-or-later */
+
+/*
+ *  Copyright (C) 2023  Oracle and/or its affiliates.
+ *
+ *  Secure Launch Resource Table definitions
+ */
+
+#ifndef _SLR_TABLE_H
+#define _SLR_TABLE_H
+
+#include <xen/types.h>
+
+#define UEFI_SLR_TABLE_GUID \
+    { 0x877a9b2a, 0x0385, 0x45d1, { 0xa0, 0x34, 0x9d, 0xac, 0x9c, 0x9e, 0x56, 0x5f } }
+
+/* SLR table header values */
+#define SLR_TABLE_MAGIC         0x4452544d
+#define SLR_TABLE_REVISION      1
+
+/* Current revisions for the policy and UEFI config */
+#define SLR_POLICY_REVISION         1
+#define SLR_UEFI_CONFIG_REVISION    1
+
+/* SLR defined architectures */
+#define SLR_INTEL_TXT   1
+#define SLR_AMD_SKINIT  2
+
+/* SLR defined bootloaders */
+#define SLR_BOOTLOADER_INVALID  0
+#define SLR_BOOTLOADER_GRUB     1
+
+/* Log formats */
+#define SLR_DRTM_TPM12_LOG      1
+#define SLR_DRTM_TPM20_LOG      2
+
+/* DRTM Policy Entry Flags */
+#define SLR_POLICY_FLAG_MEASURED    0x1
+#define SLR_POLICY_IMPLICIT_SIZE    0x2
+
+/* Array Lengths */
+#define TPM_EVENT_INFO_LENGTH       32
+#define TXT_VARIABLE_MTRRS_LENGTH   32
+
+/* Tags */
+#define SLR_ENTRY_INVALID       0x0000
+#define SLR_ENTRY_DL_INFO       0x0001
+#define SLR_ENTRY_LOG_INFO      0x0002
+#define SLR_ENTRY_DRTM_POLICY   0x0003
+#define SLR_ENTRY_INTEL_INFO    0x0004
+#define SLR_ENTRY_AMD_INFO      0x0005
+#define SLR_ENTRY_ARM_INFO      0x0006
+#define SLR_ENTRY_UEFI_INFO     0x0007
+#define SLR_ENTRY_UEFI_CONFIG   0x0008
+#define SLR_ENTRY_END           0xffff
+
+/* Entity Types */
+#define SLR_ET_UNSPECIFIED        0x0000
+#define SLR_ET_SLRT               0x0001
+#define SLR_ET_BOOT_PARAMS        0x0002
+#define SLR_ET_SETUP_DATA         0x0003
+#define SLR_ET_CMDLINE            0x0004
+#define SLR_ET_UEFI_MEMMAP        0x0005
+#define SLR_ET_RAMDISK            0x0006
+#define SLR_ET_MULTIBOOT2_INFO    0x0007
+#define SLR_ET_MULTIBOOT2_MODULE  0x0008
+#define SLR_ET_TXT_OS2MLE         0x0010
+#define SLR_ET_UNUSED             0xffff
+
+/*
+ * Primary SLR Table Header
+ */
+struct slr_table
+{
+    uint32_t magic;
+    uint16_t revision;
+    uint16_t architecture;
+    uint32_t size;
+    uint32_t max_size;
+    /* entries[] */
+} __packed;
+
+/*
+ * Common SLRT Table Header
+ */
+struct slr_entry_hdr
+{
+    uint32_t tag;
+    uint32_t size;
+} __packed;
+
+/*
+ * Boot loader context
+ */
+struct slr_bl_context
+{
+    uint16_t bootloader;
+    uint16_t reserved[3];
+    uint64_t context;
+} __packed;
+
+/*
+ * Prototype of a function pointed to by slr_entry_dl_info::dl_handler.
+ */
+typedef void (*dl_handler_func)(struct slr_bl_context *bl_context);
+
+/*
+ * DRTM Dynamic Launch Configuration
+ */
+struct slr_entry_dl_info
+{
+    struct slr_entry_hdr hdr;
+    uint64_t dce_size;
+    uint64_t dce_base;
+    uint64_t dlme_size;
+    uint64_t dlme_base;
+    uint64_t dlme_entry;
+    struct slr_bl_context bl_context;
+    uint64_t dl_handler;
+} __packed;
+
+/*
+ * TPM Log Information
+ */
+struct slr_entry_log_info
+{
+    struct slr_entry_hdr hdr;
+    uint16_t format;
+    uint16_t reserved;
+    uint32_t size;
+    uint64_t addr;
+} __packed;
+
+/*
+ * DRTM Measurement Entry
+ */
+struct slr_policy_entry
+{
+    uint16_t pcr;
+    uint16_t entity_type;
+    uint16_t flags;
+    uint16_t reserved;
+    uint64_t size;
+    uint64_t entity;
+    char evt_info[TPM_EVENT_INFO_LENGTH];
+} __packed;
+
+/*
+ * DRTM Measurement Policy
+ */
+struct slr_entry_policy
+{
+    struct slr_entry_hdr hdr;
+    uint16_t reserved[2];
+    uint16_t revision;
+    uint16_t nr_entries;
+    struct slr_policy_entry policy_entries[];
+} __packed;
+
+/*
+ * Secure Launch defined MTRR saving structures
+ */
+struct slr_txt_mtrr_pair
+{
+    uint64_t mtrr_physbase;
+    uint64_t mtrr_physmask;
+} __packed;
+
+struct slr_txt_mtrr_state
+{
+    uint64_t default_mem_type;
+    uint64_t mtrr_vcnt;
+    struct slr_txt_mtrr_pair mtrr_pair[TXT_VARIABLE_MTRRS_LENGTH];
+} __packed;
+
+/*
+ * Intel TXT Info table
+ */
+struct slr_entry_intel_info
+{
+    struct slr_entry_hdr hdr;
+    uint64_t boot_params_base;
+    uint64_t txt_heap;
+    uint64_t saved_misc_enable_msr;
+    struct slr_txt_mtrr_state saved_bsp_mtrrs;
+} __packed;
+
+/*
+ * AMD SKINIT Info table
+ */
+struct slr_entry_amd_info
+{
+    struct slr_entry_hdr hdr;
+    uint64_t next;
+    uint32_t type;
+    uint32_t len;
+    uint64_t slrt_size;
+    uint64_t slrt_base;
+    uint64_t boot_params_base;
+    uint16_t psp_version;
+    uint16_t reserved[3];
+} __packed;
+
+/*
+ * ARM DRTM Info table
+ */
+struct slr_entry_arm_info
+{
+    struct slr_entry_hdr hdr;
+} __packed;
+
+/*
+ * UEFI config measurement entry
+ */
+struct slr_uefi_cfg_entry
+{
+    uint16_t pcr;
+    uint16_t reserved;
+    uint32_t size;
+    uint64_t cfg; /* address or value */
+    char evt_info[TPM_EVENT_INFO_LENGTH];
+} __packed;
+
+struct slr_entry_uefi_config
+{
+    struct slr_entry_hdr hdr;
+    uint16_t reserved[2];
+    uint16_t revision;
+    uint16_t nr_entries;
+    struct slr_uefi_cfg_entry uefi_cfg_entries[];
+} __packed;
+
+static inline void *
+slr_end_of_entries(struct slr_table *table)
+{
+    return (uint8_t *)table + table->size;
+}
+
+static inline struct slr_entry_hdr *
+slr_next_entry(struct slr_table *table, struct slr_entry_hdr *curr)
+{
+    struct slr_entry_hdr *next = (struct slr_entry_hdr *)
+                                 ((uint8_t *)curr + curr->size);
+
+    if ( (void *)next >= slr_end_of_entries(table) )
+        return NULL;
+    if ( next->tag == SLR_ENTRY_END )
+        return NULL;
+
+    return next;
+}
+
+static inline struct slr_entry_hdr *
+slr_next_entry_by_tag (struct slr_table *table,
+                       struct slr_entry_hdr *entry,
+                       uint16_t tag)
+{
+    if ( !entry ) /* Start from the beginning */
+        entry = (struct slr_entry_hdr *)((uint8_t *)table + sizeof(*table));
+
+    for ( ; ; )
+    {
+        if ( entry->tag == tag )
+            return entry;
+
+        entry = slr_next_entry(table, entry);
+        if ( !entry )
+            return NULL;
+    }
+
+    return NULL;
+}
+
+#endif /* _SLR_TABLE_H */
-- 
2.49.0


