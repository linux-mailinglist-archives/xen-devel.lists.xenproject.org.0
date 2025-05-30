Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D450AC8FB5
	for <lists+xen-devel@lfdr.de>; Fri, 30 May 2025 15:19:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1000931.1381128 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uKzd8-0000MU-N5; Fri, 30 May 2025 13:18:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1000931.1381128; Fri, 30 May 2025 13:18:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uKzd8-0000Ke-K2; Fri, 30 May 2025 13:18:38 +0000
Received: by outflank-mailman (input) for mailman id 1000931;
 Fri, 30 May 2025 13:18:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sDQw=YO=3mdeb.com=sergii.dmytruk@srs-se1.protection.inumbo.net>)
 id 1uKzd7-0008Jy-7W
 for xen-devel@lists.xenproject.org; Fri, 30 May 2025 13:18:37 +0000
Received: from 10.mo582.mail-out.ovh.net (10.mo582.mail-out.ovh.net
 [87.98.157.236]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 97d11f80-3d58-11f0-a2ff-13f23c93f187;
 Fri, 30 May 2025 15:18:36 +0200 (CEST)
Received: from director7.ghost.mail-out.ovh.net (unknown [10.109.148.22])
 by mo582.mail-out.ovh.net (Postfix) with ESMTP id 4b83hr09ljz1gVw
 for <xen-devel@lists.xenproject.org>; Fri, 30 May 2025 13:18:35 +0000 (UTC)
Received: from ghost-submission-5b5ff79f4f-595tn (unknown [10.110.101.93])
 by director7.ghost.mail-out.ovh.net (Postfix) with ESMTPS id 1A05CC01C6;
 Fri, 30 May 2025 13:18:34 +0000 (UTC)
Received: from 3mdeb.com ([37.59.142.106])
 by ghost-submission-5b5ff79f4f-595tn with ESMTPSA
 id 1uY5MCqwOWhrxwAAeVbzSg
 (envelope-from <sergii.dmytruk@3mdeb.com>); Fri, 30 May 2025 13:18:34 +0000
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
X-Inumbo-ID: 97d11f80-3d58-11f0-a2ff-13f23c93f187
Authentication-Results:garm.ovh; auth=pass (GARM-106R0066e9729c4-54b1-40e5-9241-747dee88eacc,
                    A4E380CC922F0B59227EC5DCC46884561651840B) smtp.auth=sergii.dmytruk@3mdeb.com
X-OVh-ClientIp:176.111.184.221
From: Sergii Dmytruk <sergii.dmytruk@3mdeb.com>
To: xen-devel@lists.xenproject.org
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	Ross Philipson <ross.philipson@oracle.com>,
	trenchboot-devel@googlegroups.com
Subject: [PATCH v3 02/22] include/xen/slr-table.h: Secure Launch Resource Table definitions
Date: Fri, 30 May 2025 16:17:44 +0300
Message-ID: <49517f41e112720bdd2b76e8eb3d9b1064671f60.1748611041.git.sergii.dmytruk@3mdeb.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <cover.1748611041.git.sergii.dmytruk@3mdeb.com>
References: <cover.1748611041.git.sergii.dmytruk@3mdeb.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 12694239977603183772
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeeffedrtddtgddvleduudculddtuddrgeefvddrtddtmdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefuvghrghhiihcuffhmhihtrhhukhcuoehsvghrghhiihdrughmhihtrhhukhesfehmuggvsgdrtghomheqnecuggftrfgrthhtvghrnhepjefgfeelteetueelfefgffehtdelkeegtddvtedukeduleelgfekgfetudegudelnecuffhomhgrihhnpehtrhgvnhgthhgsohhothdrohhrghenucfkphepuddvjedrtddrtddruddpudejiedrudduuddrudekgedrvddvuddpfeejrdehledrudegvddruddtieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeduvdejrddtrddtrddupdhmrghilhhfrhhomhepshgvrhhgihhirdgumhihthhruhhkseefmhguvggsrdgtohhmpdhnsggprhgtphhtthhopedupdhrtghpthhtohepgigvnhdquggvvhgvlheslhhishhtshdrgigvnhhprhhojhgvtghtrdhorhhgpdfovfetjfhoshhtpehmohehkedvmgdpmhhouggvpehsmhhtphhouhht
DKIM-Signature: a=rsa-sha256; bh=Jmq1hGKvknlCNJrEv6nB4vNlHz9UuOh2SDBrEluwy9Y=;
 c=relaxed/relaxed; d=3mdeb.com; h=From; s=ovhmo3617313-selector1;
 t=1748611116; v=1;
 b=e26ZF95PgWF4+7aMi7/mBgm4xjARf2OhwuiuZQCep1WSMldNSh+xSIBqxfk2vdCHeCwQdV5P
 q/pLTgmRuG2BkTjF1ulrtzKDc8yL753BSY9n++z3MPzUUo5wgZSy4D1ZiwcXl8ivnEQywFLZ3Un
 Tbe4rzfuefjPyu8B/7PeyF1RTpteEi0Rwiax39JsgzLo+3ENTXP6C4JSB//k6TNrXB4AX4eCotp
 6Jv3fBZSRvOAegMNEMKEYuI/Xqad+iv6IMK3NvMuEeCQIb1PIvhIHyU709eRa8NBIqeL1t+pxno
 4G4jOK3bN4pe145Y4XAVyag2V/ngZCyyffehrMU68Ctpw==

The file provides constants, structures and several helper functions for
parsing SLRT.

The data described by the structures is passed to Xen by a bootloader
which initiated DRTM.

Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
Signed-off-by: Ross Philipson <ross.philipson@oracle.com>
Signed-off-by: Sergii Dmytruk <sergii.dmytruk@3mdeb.com>
---
 xen/include/xen/slr-table.h | 276 ++++++++++++++++++++++++++++++++++++
 1 file changed, 276 insertions(+)
 create mode 100644 xen/include/xen/slr-table.h

diff --git a/xen/include/xen/slr-table.h b/xen/include/xen/slr-table.h
new file mode 100644
index 0000000000..fb36d06fa8
--- /dev/null
+++ b/xen/include/xen/slr-table.h
@@ -0,0 +1,276 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+
+/*
+ *  Copyright (c) 2025 Apertus Solutions, LLC
+ *  Copyright (c) 2025 Oracle and/or its affiliates.
+ *  Copyright (c) 2025 3mdeb Sp. z o.o
+ *
+ *  Secure Launch Resource Table definitions.  This table is passed to Xen by
+ *  a bootloader and contains information about pre-DRTM state necessary to
+ *  restore hardware configuration, where to find TPM event log, how to call
+ *  back into the bootloader (for EFI case) and what needs to be measured by
+ *  Xen.  In other words, this is similar to MBI in Multiboot Specification.
+ *
+ *  Specification:
+ *    https://trenchboot.org/specifications/Secure_Launch/
+ */
+
+#ifndef XEN_SLR_TABLE_H
+#define XEN_SLR_TABLE_H
+
+#include <xen/types.h>
+
+#define UEFI_SLR_TABLE_GUID \
+    { 0x877a9b2aU, 0x0385, 0x45d1, { 0xa0, 0x34, 0x9d, 0xac, 0x9c, 0x9e, 0x56, 0x5f } }
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
+static inline const void *
+slr_end_of_entries(const struct slr_table *table)
+{
+    return (const void *)table + table->size;
+}
+
+static inline const struct slr_entry_hdr *
+slr_next_entry(const struct slr_table *table, const struct slr_entry_hdr *curr)
+{
+    const struct slr_entry_hdr *next = (void *)curr + curr->size;
+
+    if ( (void *)next + sizeof(*next) > slr_end_of_entries(table) )
+        return NULL;
+    if ( next->tag == SLR_ENTRY_END )
+        return NULL;
+    if ( (void *)next + next->size > slr_end_of_entries(table) )
+        return NULL;
+
+    return next;
+}
+
+static inline const struct slr_entry_hdr *
+slr_next_entry_by_tag(const struct slr_table *table,
+                      const struct slr_entry_hdr *entry,
+                      uint16_t tag)
+{
+    if ( !entry ) /* Start from the beginning */
+        entry = (void *)table + sizeof(*table);
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
+#endif /* XEN_SLR_TABLE_H */
-- 
2.49.0


