Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F59255040D
	for <lists+xen-devel@lfdr.de>; Sat, 18 Jun 2022 12:49:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.351765.578519 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o2W0B-0004ag-Jg; Sat, 18 Jun 2022 10:48:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 351765.578519; Sat, 18 Jun 2022 10:48:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o2W0B-0004Vu-Cp; Sat, 18 Jun 2022 10:48:27 +0000
Received: by outflank-mailman (input) for mailman id 351765;
 Sat, 18 Jun 2022 10:48:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=c8TN=WZ=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1o2W09-000499-65
 for xen-devel@lists.xenproject.org; Sat, 18 Jun 2022 10:48:25 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2aa1b67a-eef4-11ec-bd2d-47488cf2e6aa;
 Sat, 18 Jun 2022 12:48:22 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 887A61FA72;
 Sat, 18 Jun 2022 10:48:19 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 5AB461348B;
 Sat, 18 Jun 2022 10:48:19 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id iJjUFHOtrWIXKAAAMHmgww
 (envelope-from <jgross@suse.com>); Sat, 18 Jun 2022 10:48:19 +0000
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
X-Inumbo-ID: 2aa1b67a-eef4-11ec-bd2d-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1655549299; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=O7Ezlwl1sJwrsR+Lshf/i9Q310DW+uMi1RBHydn95TE=;
	b=ppXAcJl8tx1RGIqamUFhG9gpMhtvj6ECxnAMPfg+AW78PChXgHICCgKWoVNCW1yULseeny
	9tT2dAtdH600cuoxTX+s/pFLeEyO2F9xHSedyG/cwkOxkRB16oCMtk/+naorezL3W5cNuY
	tslEcxEQOHT7jMTS20aYMqiY04HM2A0=
From: Juergen Gross <jgross@suse.com>
To: minios-devel@lists.xenproject.org,
	xen-devel@lists.xenproject.org
Cc: samuel.thibault@ens-lyon.org,
	wl@xen.org,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH 3/3] mini-os: fix number of pages for PVH
Date: Sat, 18 Jun 2022 12:48:16 +0200
Message-Id: <20220618104816.11527-4-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20220618104816.11527-1-jgross@suse.com>
References: <20220618104816.11527-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When getting the current allocation from Xen, this value includes the
pages allocated in the MMIO area. Fix the highest available RAM page
by subtracting the size of that area.

This requires to read the E820 map before needing this value.

At the same time add the LAPIC page to the memory map in order to
avoid reusing that PFN for internal purposes.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 arch/x86/mm.c         |  4 +++-
 balloon.c             |  2 +-
 e820.c                | 28 +++++++++++++++++++++-------
 include/e820.h        |  1 +
 include/x86/arch_mm.h |  2 ++
 5 files changed, 28 insertions(+), 9 deletions(-)

diff --git a/arch/x86/mm.c b/arch/x86/mm.c
index 41fcee67..37089978 100644
--- a/arch/x86/mm.c
+++ b/arch/x86/mm.c
@@ -114,6 +114,8 @@ void arch_mm_preinit(void *p)
     if ( hsi->version >= 1 && hsi->memmap_entries > 0 )
         e820_init_memmap((struct hvm_memmap_table_entry *)(unsigned long)
                          hsi->memmap_paddr, hsi->memmap_entries);
+    else
+        e820_init_memmap(NULL, 0);
 
     pt_base = page_table_base;
     first_free_pfn = PFN_UP(to_phys(&_end));
@@ -124,7 +126,7 @@ void arch_mm_preinit(void *p)
         do_exit();
     }
 
-    last_free_pfn = e820_get_maxpfn(ret);
+    last_free_pfn = e820_get_maxpfn(ret - e820_initial_reserved_pfns);
     balloon_set_nr_pages(ret, last_free_pfn);
 }
 #endif
diff --git a/balloon.c b/balloon.c
index 9dc77c54..779223de 100644
--- a/balloon.c
+++ b/balloon.c
@@ -54,7 +54,7 @@ void get_max_pages(void)
         return;
     }
 
-    nr_max_pages = ret;
+    nr_max_pages = ret - e820_initial_reserved_pfns;
     printk("Maximum memory size: %ld pages\n", nr_max_pages);
 
     nr_max_pfn = e820_get_maxpfn(nr_max_pages);
diff --git a/e820.c b/e820.c
index ad91e00b..c3047336 100644
--- a/e820.c
+++ b/e820.c
@@ -29,6 +29,8 @@
 #include <mini-os/e820.h>
 #include <xen/memory.h>
 
+unsigned int e820_initial_reserved_pfns;
+
 #ifdef CONFIG_E820_TRIVIAL
 struct e820entry e820_map[1] = {
     {
@@ -40,10 +42,6 @@ struct e820entry e820_map[1] = {
 
 unsigned e820_entries = 1;
 
-static void e820_get_memmap(void)
-{
-}
-
 #else
 struct e820entry e820_map[E820_MAX];
 unsigned e820_entries;
@@ -199,6 +197,7 @@ static void e820_sanitize(void)
 {
     int i;
     unsigned long end, start;
+    bool found_lapic = false;
 
     /* Sanitize memory map in current form. */
     e820_process_entries();
@@ -238,8 +237,20 @@ static void e820_sanitize(void)
 
     /* Make remaining temporarily reserved entries permanently reserved. */
     for ( i = 0; i < e820_entries; i++ )
+    {
         if ( e820_map[i].type == E820_TMP_RESERVED )
             e820_map[i].type = E820_RESERVED;
+        if ( e820_map[i].type == E820_RESERVED )
+        {
+            e820_initial_reserved_pfns += e820_map[i].size / PAGE_SIZE;
+            if ( e820_map[i].addr <= LAPIC_ADDRESS &&
+                 e820_map[i].addr + e820_map[i].size > LAPIC_ADDRESS )
+                found_lapic = true;
+        }
+    }
+
+    if ( !found_lapic )
+        e820_insert_entry(LAPIC_ADDRESS, PAGE_SIZE, E820_RESERVED);
 }
 
 static void e820_get_memmap(void)
@@ -264,6 +275,12 @@ void e820_init_memmap(struct hvm_memmap_table_entry *entry, unsigned int num)
 {
     unsigned int i;
 
+    if ( !entry )
+    {
+        e820_get_memmap();
+        return;
+    }
+
     BUILD_BUG_ON(XEN_HVM_MEMMAP_TYPE_RAM != E820_RAM);
     BUILD_BUG_ON(XEN_HVM_MEMMAP_TYPE_RESERVED != E820_RESERVED);
     BUILD_BUG_ON(XEN_HVM_MEMMAP_TYPE_ACPI != E820_ACPI);
@@ -365,9 +382,6 @@ unsigned long e820_get_maxpfn(unsigned long pages)
     int i;
     unsigned long pfns = 0, start = 0;
 
-    if ( !e820_entries )
-        e820_get_memmap();
-
     for ( i = 0; i < e820_entries; i++ )
     {
         if ( e820_map[i].type != E820_RAM )
diff --git a/include/e820.h b/include/e820.h
index 5438a7c8..5533894e 100644
--- a/include/e820.h
+++ b/include/e820.h
@@ -51,6 +51,7 @@ struct __packed e820entry {
 
 extern struct e820entry e820_map[];
 extern unsigned e820_entries;
+extern unsigned int e820_initial_reserved_pfns;
 
 unsigned long e820_get_maxpfn(unsigned long pages);
 unsigned long e820_get_max_contig_pages(unsigned long pfn, unsigned long pages);
diff --git a/include/x86/arch_mm.h b/include/x86/arch_mm.h
index ffbec5a8..a1b975dc 100644
--- a/include/x86/arch_mm.h
+++ b/include/x86/arch_mm.h
@@ -207,6 +207,8 @@ typedef unsigned long pgentry_t;
 /* to align the pointer to the (next) page boundary */
 #define PAGE_ALIGN(addr)        (((addr)+PAGE_SIZE-1)&PAGE_MASK)
 
+#define LAPIC_ADDRESS	CONST(0xfee00000)
+
 #ifndef __ASSEMBLY__
 /* Definitions for machine and pseudophysical addresses. */
 #ifdef __i386__
-- 
2.35.3


