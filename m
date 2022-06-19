Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CE45A550906
	for <lists+xen-devel@lfdr.de>; Sun, 19 Jun 2022 08:53:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.352040.578751 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o2onq-0004HO-RA; Sun, 19 Jun 2022 06:52:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 352040.578751; Sun, 19 Jun 2022 06:52:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o2onq-0004FJ-O9; Sun, 19 Jun 2022 06:52:58 +0000
Received: by outflank-mailman (input) for mailman id 352040;
 Sun, 19 Jun 2022 06:52:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Ii8P=W2=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1o2onp-0004F7-EF
 for xen-devel@lists.xenproject.org; Sun, 19 Jun 2022 06:52:57 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 728ce77f-ef9c-11ec-bd2d-47488cf2e6aa;
 Sun, 19 Jun 2022 08:52:56 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 811D61F97A;
 Sun, 19 Jun 2022 06:52:55 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 5661213A5D;
 Sun, 19 Jun 2022 06:52:55 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 0LDUE8fHrmJzXgAAMHmgww
 (envelope-from <jgross@suse.com>); Sun, 19 Jun 2022 06:52:55 +0000
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
X-Inumbo-ID: 728ce77f-ef9c-11ec-bd2d-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1655621575; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=sqQB2mee0jCv15NOcWCx6SVOgjnvvSzpgTYbgdXHN/4=;
	b=ie4i4WPFQ6OSeuhCBDRpD7dx5s2n3JIx76lUv+g0jwcY8mwvKpG8rLUm6Am95jytnv96e8
	6Uo4Sv8YMiI0TMsao5RTw7M+vEU7XdeD8fvmcpWra+lOqBUVZOoL2fpFbZfvR4PJVaPnqD
	ZCeZyyxWvVnQ6hGd1aMgySeYJDkhe70=
From: Juergen Gross <jgross@suse.com>
To: minios-devel@lists.xenproject.org,
	xen-devel@lists.xenproject.org
Cc: samuel.thibault@ens-lyon.org,
	wl@xen.org,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH v2 2/4] mini-os: prefer memory map via start_info for PVH
Date: Sun, 19 Jun 2022 08:52:51 +0200
Message-Id: <20220619065253.19503-3-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20220619065253.19503-1-jgross@suse.com>
References: <20220619065253.19503-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Since some time now a guest started in PVH mode will get the memory
map from Xen via the start_info structure.

Modify the PVH initialization to prefer this memory map over the one
obtained via hypercall, as this will allow to add information to the
memory map for a new kernel when supporting kexec.

In case the start_info structure doesn't contain memory map information
fall back to the hypercall.

Signed-off-by: Juergen Gross <jgross@suse.com>
Reviewed-by: Samuel Thibault <samuel.thibault@ens-lyon.org>
---
 arch/x86/mm.c  |  6 ++++++
 e820.c         | 25 +++++++++++++++++++++++++
 include/e820.h |  4 ++++
 3 files changed, 35 insertions(+)

diff --git a/arch/x86/mm.c b/arch/x86/mm.c
index 220c0b4d..41fcee67 100644
--- a/arch/x86/mm.c
+++ b/arch/x86/mm.c
@@ -45,6 +45,7 @@
 #include <mini-os/xmalloc.h>
 #include <mini-os/e820.h>
 #include <xen/memory.h>
+#include <xen/arch-x86/hvm/start_info.h>
 
 #ifdef MM_DEBUG
 #define DEBUG(_f, _a...) \
@@ -108,6 +109,11 @@ void arch_mm_preinit(void *p)
 {
     long ret;
     domid_t domid = DOMID_SELF;
+    struct hvm_start_info *hsi = p;
+
+    if ( hsi->version >= 1 && hsi->memmap_entries > 0 )
+        e820_init_memmap((struct hvm_memmap_table_entry *)(unsigned long)
+                         hsi->memmap_paddr, hsi->memmap_entries);
 
     pt_base = page_table_base;
     first_free_pfn = PFN_UP(to_phys(&_end));
diff --git a/e820.c b/e820.c
index 991ed382..ad91e00b 100644
--- a/e820.c
+++ b/e820.c
@@ -54,6 +54,7 @@ static char *e820_types[E820_TYPES] = {
     [E820_ACPI]     = "ACPI",
     [E820_NVS]      = "NVS",
     [E820_UNUSABLE] = "Unusable",
+    [E820_DISABLED] = "Disabled",
     [E820_PMEM]     = "PMEM"
 };
 
@@ -259,6 +260,30 @@ static void e820_get_memmap(void)
     e820_sanitize();
 }
 
+void e820_init_memmap(struct hvm_memmap_table_entry *entry, unsigned int num)
+{
+    unsigned int i;
+
+    BUILD_BUG_ON(XEN_HVM_MEMMAP_TYPE_RAM != E820_RAM);
+    BUILD_BUG_ON(XEN_HVM_MEMMAP_TYPE_RESERVED != E820_RESERVED);
+    BUILD_BUG_ON(XEN_HVM_MEMMAP_TYPE_ACPI != E820_ACPI);
+    BUILD_BUG_ON(XEN_HVM_MEMMAP_TYPE_NVS != E820_NVS);
+    BUILD_BUG_ON(XEN_HVM_MEMMAP_TYPE_UNUSABLE != E820_UNUSABLE);
+    BUILD_BUG_ON(XEN_HVM_MEMMAP_TYPE_DISABLED != E820_DISABLED);
+    BUILD_BUG_ON(XEN_HVM_MEMMAP_TYPE_PMEM != E820_PMEM);
+
+    for ( i = 0; i < num; i++ )
+    {
+        e820_map[i].addr = entry[i].addr;
+        e820_map[i].size = entry[i].size;
+        e820_map[i].type = entry[i].type;
+    }
+
+    e820_entries = num;
+
+    e820_sanitize();
+}
+
 void arch_print_memmap(void)
 {
     int i;
diff --git a/include/e820.h b/include/e820.h
index aaf2f2ca..5438a7c8 100644
--- a/include/e820.h
+++ b/include/e820.h
@@ -26,6 +26,8 @@
 
 #if defined(__arm__) || defined(__aarch64__) || defined(CONFIG_PARAVIRT)
 #define CONFIG_E820_TRIVIAL
+#else
+#include <xen/arch-x86/hvm/start_info.h>
 #endif
 
 /* PC BIOS standard E820 types and structure. */
@@ -34,6 +36,7 @@
 #define E820_ACPI         3
 #define E820_NVS          4
 #define E820_UNUSABLE     5
+#define E820_DISABLED     6
 #define E820_PMEM         7
 #define E820_TYPES        8
 
@@ -54,6 +57,7 @@ unsigned long e820_get_max_contig_pages(unsigned long pfn, unsigned long pages);
 #ifndef CONFIG_E820_TRIVIAL
 unsigned long e820_get_reserved_pfns(int pages);
 void e820_put_reserved_pfns(unsigned long start_pfn, int pages);
+void e820_init_memmap(struct hvm_memmap_table_entry *entry, unsigned int num);
 #endif
 
 #endif /*__E820_HEADER*/
-- 
2.35.3


