Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EA108552BC6
	for <lists+xen-devel@lfdr.de>; Tue, 21 Jun 2022 09:23:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.353001.579914 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o3YEM-0002Fj-6J; Tue, 21 Jun 2022 07:23:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 353001.579914; Tue, 21 Jun 2022 07:23:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o3YEM-00029t-00; Tue, 21 Jun 2022 07:23:22 +0000
Received: by outflank-mailman (input) for mailman id 353001;
 Tue, 21 Jun 2022 07:23:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=VA9I=W4=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1o3YEK-0001Tv-0z
 for xen-devel@lists.xenproject.org; Tue, 21 Jun 2022 07:23:20 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 045eec7a-f133-11ec-b725-ed86ccbb4733;
 Tue, 21 Jun 2022 09:23:16 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 4CA7B1FA5D;
 Tue, 21 Jun 2022 07:23:16 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 134A113638;
 Tue, 21 Jun 2022 07:23:16 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 4LFqA+RxsWLDYwAAMHmgww
 (envelope-from <jgross@suse.com>); Tue, 21 Jun 2022 07:23:16 +0000
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
X-Inumbo-ID: 045eec7a-f133-11ec-b725-ed86ccbb4733
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1655796196; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5vH2NqyFMDYKMsu2Ud2YN8B9pnuLSEdOQPWCQhYC+kA=;
	b=Ji4OgDXCs3g7pOm0MGuTzpDGx1npbuTC62kRMt6Gxvr7skYlXuuXUJh/Cm1qLDKrwktTHq
	01x+eS3hEqQc0AymmVZ96+E6bH8EPmy65pIK/8s9A347lkN4ri9T+Lk34VllN6b4xoDtHF
	xOeISvMnLfIO1emAV7Qy7f9FezSFd/s=
From: Juergen Gross <jgross@suse.com>
To: minios-devel@lists.xenproject.org,
	xen-devel@lists.xenproject.org
Cc: samuel.thibault@ens-lyon.org,
	wl@xen.org,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH v3 1/4] mini-os: take newest version of arch-x86/hvm/start_info.h
Date: Tue, 21 Jun 2022 09:23:11 +0200
Message-Id: <20220621072314.16382-2-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20220621072314.16382-1-jgross@suse.com>
References: <20220621072314.16382-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Update include/xen/arch-x86/hvm/start_info.h to the newest version
from the Xen tree.

Signed-off-by: Juergen Gross <jgross@suse.com>
Reviewed-by: Samuel Thibault <samuel.thibault@ens-lyon.org>
---
 include/xen/arch-x86/hvm/start_info.h | 63 ++++++++++++++++++++++++++-
 1 file changed, 62 insertions(+), 1 deletion(-)

diff --git a/include/xen/arch-x86/hvm/start_info.h b/include/xen/arch-x86/hvm/start_info.h
index 64841597..50af9ea2 100644
--- a/include/xen/arch-x86/hvm/start_info.h
+++ b/include/xen/arch-x86/hvm/start_info.h
@@ -33,7 +33,7 @@
  *    | magic          | Contains the magic value XEN_HVM_START_MAGIC_VALUE
  *    |                | ("xEn3" with the 0x80 bit of the "E" set).
  *  4 +----------------+
- *    | version        | Version of this structure. Current version is 0. New
+ *    | version        | Version of this structure. Current version is 1. New
  *    |                | versions are guaranteed to be backwards-compatible.
  *  8 +----------------+
  *    | flags          | SIF_xxx flags.
@@ -48,6 +48,15 @@
  * 32 +----------------+
  *    | rsdp_paddr     | Physical address of the RSDP ACPI data structure.
  * 40 +----------------+
+ *    | memmap_paddr   | Physical address of the (optional) memory map. Only
+ *    |                | present in version 1 and newer of the structure.
+ * 48 +----------------+
+ *    | memmap_entries | Number of entries in the memory map table. Zero
+ *    |                | if there is no memory map being provided. Only
+ *    |                | present in version 1 and newer of the structure.
+ * 52 +----------------+
+ *    | reserved       | Version 1 and newer only.
+ * 56 +----------------+
  *
  * The layout of each entry in the module structure is the following:
  *
@@ -62,13 +71,51 @@
  *    | reserved       |
  * 32 +----------------+
  *
+ * The layout of each entry in the memory map table is as follows:
+ *
+ *  0 +----------------+
+ *    | addr           | Base address
+ *  8 +----------------+
+ *    | size           | Size of mapping in bytes
+ * 16 +----------------+
+ *    | type           | Type of mapping as defined between the hypervisor
+ *    |                | and guest. See XEN_HVM_MEMMAP_TYPE_* values below.
+ * 20 +----------------|
+ *    | reserved       |
+ * 24 +----------------+
+ *
  * The address and sizes are always a 64bit little endian unsigned integer.
  *
  * NB: Xen on x86 will always try to place all the data below the 4GiB
  * boundary.
+ *
+ * Version numbers of the hvm_start_info structure have evolved like this:
+ *
+ * Version 0:  Initial implementation.
+ *
+ * Version 1:  Added the memmap_paddr/memmap_entries fields (plus 4 bytes of
+ *             padding) to the end of the hvm_start_info struct. These new
+ *             fields can be used to pass a memory map to the guest. The
+ *             memory map is optional and so guests that understand version 1
+ *             of the structure must check that memmap_entries is non-zero
+ *             before trying to read the memory map.
  */
 #define XEN_HVM_START_MAGIC_VALUE 0x336ec578
 
+/*
+ * The values used in the type field of the memory map table entries are
+ * defined below and match the Address Range Types as defined in the "System
+ * Address Map Interfaces" section of the ACPI Specification. Please refer to
+ * section 15 in version 6.2 of the ACPI spec: http://uefi.org/specifications
+ */
+#define XEN_HVM_MEMMAP_TYPE_RAM       1
+#define XEN_HVM_MEMMAP_TYPE_RESERVED  2
+#define XEN_HVM_MEMMAP_TYPE_ACPI      3
+#define XEN_HVM_MEMMAP_TYPE_NVS       4
+#define XEN_HVM_MEMMAP_TYPE_UNUSABLE  5
+#define XEN_HVM_MEMMAP_TYPE_DISABLED  6
+#define XEN_HVM_MEMMAP_TYPE_PMEM      7
+
 /*
  * C representation of the x86/HVM start info layout.
  *
@@ -86,6 +133,13 @@ struct hvm_start_info {
     uint64_t cmdline_paddr;     /* Physical address of the command line.     */
     uint64_t rsdp_paddr;        /* Physical address of the RSDP ACPI data    */
                                 /* structure.                                */
+    /* All following fields only present in version 1 and newer */
+    uint64_t memmap_paddr;      /* Physical address of an array of           */
+                                /* hvm_memmap_table_entry.                   */
+    uint32_t memmap_entries;    /* Number of entries in the memmap table.    */
+                                /* Value will be zero if there is no memory  */
+                                /* map being provided.                       */
+    uint32_t reserved;          /* Must be zero.                             */
 };
 
 struct hvm_modlist_entry {
@@ -95,4 +149,11 @@ struct hvm_modlist_entry {
     uint64_t reserved;
 };
 
+struct hvm_memmap_table_entry {
+    uint64_t addr;              /* Base address of the memory region         */
+    uint64_t size;              /* Size of the memory region in bytes        */
+    uint32_t type;              /* Mapping type                              */
+    uint32_t reserved;          /* Must be zero for Version 1.               */
+};
+
 #endif /* __XEN_PUBLIC_ARCH_X86_HVM_START_INFO_H__ */
-- 
2.35.3


