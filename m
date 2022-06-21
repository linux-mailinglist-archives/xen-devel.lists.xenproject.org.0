Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 634F6552BC4
	for <lists+xen-devel@lfdr.de>; Tue, 21 Jun 2022 09:23:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.353004.579938 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o3YEO-0002pj-RQ; Tue, 21 Jun 2022 07:23:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 353004.579938; Tue, 21 Jun 2022 07:23:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o3YEO-0002lw-Nu; Tue, 21 Jun 2022 07:23:24 +0000
Received: by outflank-mailman (input) for mailman id 353004;
 Tue, 21 Jun 2022 07:23:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=VA9I=W4=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1o3YEM-0001Tw-EV
 for xen-devel@lists.xenproject.org; Tue, 21 Jun 2022 07:23:22 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 04c46c7d-f133-11ec-bd2d-47488cf2e6aa;
 Tue, 21 Jun 2022 09:23:16 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id A5F851FDEA;
 Tue, 21 Jun 2022 07:23:16 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 7AE9E13638;
 Tue, 21 Jun 2022 07:23:16 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id oPOpHORxsWLDYwAAMHmgww
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
X-Inumbo-ID: 04c46c7d-f133-11ec-bd2d-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1655796196; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CgVNbVQGUCTaIYP+BHs4gAn3b+qv8h822SUhzQAjGoI=;
	b=gKyS74dTKyHkB9YN22Xr6mm5x9q1uigRxKb8vhOFbIlWet23p//Z/HjjJq2HSZvQBVPUL7
	Z/kfIrftMU9eVVZu249TT9mQ8NGohdfgpu/o2bDRNcCUzgkQ/x7CfbdPxz5TYZQgb4bEZA
	off+3BIq4riF5pNLFLzaK8KEPk3RzlU=
From: Juergen Gross <jgross@suse.com>
To: minios-devel@lists.xenproject.org,
	xen-devel@lists.xenproject.org
Cc: samuel.thibault@ens-lyon.org,
	wl@xen.org,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH v3 3/4] mini-os: fix number of pages for PVH
Date: Tue, 21 Jun 2022 09:23:13 +0200
Message-Id: <20220621072314.16382-4-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20220621072314.16382-1-jgross@suse.com>
References: <20220621072314.16382-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When getting the current allocation from Xen, this value includes the
pages allocated in the MMIO area. Fix the highest available RAM page
by subtracting the size of that area.

This requires to read the E820 map before needing this value. Add two
functions returning the current and the maximum number of RAM pages
taking this correction into account.

At the same time add the LAPIC page to the memory map in order to
avoid reusing that PFN for internal purposes.

Signed-off-by: Juergen Gross <jgross@suse.com>
Reviewed-by: Samuel Thibault <samuel.thibault@ens-lyon.org>
---
V2:
- make e820_initial_reserved_pfns static (Samuel Thibault)
- add e820_get_current_pages() and e820_get_max_pages()
V3:
- change return type of e820_get_current_pages() and e820_get_max_pages()
  to unsigned long (Samuel Thibault)
---
 arch/x86/mm.c         | 17 +++++--------
 balloon.c             | 16 +++---------
 e820.c                | 58 +++++++++++++++++++++++++++++++++++++------
 include/e820.h        |  2 ++
 include/x86/arch_mm.h |  2 ++
 5 files changed, 65 insertions(+), 30 deletions(-)

diff --git a/arch/x86/mm.c b/arch/x86/mm.c
index 41fcee67..cfc978f6 100644
--- a/arch/x86/mm.c
+++ b/arch/x86/mm.c
@@ -107,25 +107,20 @@ desc_ptr idt_ptr =
 
 void arch_mm_preinit(void *p)
 {
-    long ret;
-    domid_t domid = DOMID_SELF;
+    unsigned int pages;
     struct hvm_start_info *hsi = p;
 
     if ( hsi->version >= 1 && hsi->memmap_entries > 0 )
         e820_init_memmap((struct hvm_memmap_table_entry *)(unsigned long)
                          hsi->memmap_paddr, hsi->memmap_entries);
+    else
+        e820_init_memmap(NULL, 0);
 
     pt_base = page_table_base;
     first_free_pfn = PFN_UP(to_phys(&_end));
-    ret = HYPERVISOR_memory_op(XENMEM_current_reservation, &domid);
-    if ( ret < 0 )
-    {
-        xprintk("could not get memory size\n");
-        do_exit();
-    }
-
-    last_free_pfn = e820_get_maxpfn(ret);
-    balloon_set_nr_pages(ret, last_free_pfn);
+    pages = e820_get_current_pages();
+    last_free_pfn = e820_get_maxpfn(pages);
+    balloon_set_nr_pages(pages, last_free_pfn);
 }
 #endif
 
diff --git a/balloon.c b/balloon.c
index 9dc77c54..6ad07644 100644
--- a/balloon.c
+++ b/balloon.c
@@ -44,20 +44,12 @@ void balloon_set_nr_pages(unsigned long pages, unsigned long pfn)
 
 void get_max_pages(void)
 {
-    long ret;
-    domid_t domid = DOMID_SELF;
-
-    ret = HYPERVISOR_memory_op(XENMEM_maximum_reservation, &domid);
-    if ( ret < 0 )
+    nr_max_pages = e820_get_max_pages();
+    if ( nr_max_pages )
     {
-        printk("Could not get maximum pfn\n");
-        return;
+        printk("Maximum memory size: %ld pages\n", nr_max_pages);
+        nr_max_pfn = e820_get_maxpfn(nr_max_pages);
     }
-
-    nr_max_pages = ret;
-    printk("Maximum memory size: %ld pages\n", nr_max_pages);
-
-    nr_max_pfn = e820_get_maxpfn(nr_max_pages);
 }
 
 void mm_alloc_bitmap_remap(void)
diff --git a/e820.c b/e820.c
index ad91e00b..49b16878 100644
--- a/e820.c
+++ b/e820.c
@@ -29,6 +29,38 @@
 #include <mini-os/e820.h>
 #include <xen/memory.h>
 
+static unsigned long e820_initial_reserved_pfns;
+
+unsigned long e820_get_current_pages(void)
+{
+    domid_t domid = DOMID_SELF;
+    long ret;
+
+    ret = HYPERVISOR_memory_op(XENMEM_current_reservation, &domid);
+    if ( ret < 0 )
+    {
+        xprintk("could not get memory size\n");
+        do_exit();
+    }
+
+    return ret - e820_initial_reserved_pfns;
+}
+
+unsigned long e820_get_max_pages(void)
+{
+    domid_t domid = DOMID_SELF;
+    long ret;
+
+    ret = HYPERVISOR_memory_op(XENMEM_maximum_reservation, &domid);
+    if ( ret < 0 )
+    {
+        printk("Could not get maximum pfn\n");
+        return 0;
+    }
+
+    return ret - e820_initial_reserved_pfns;
+}
+
 #ifdef CONFIG_E820_TRIVIAL
 struct e820entry e820_map[1] = {
     {
@@ -40,10 +72,6 @@ struct e820entry e820_map[1] = {
 
 unsigned e820_entries = 1;
 
-static void e820_get_memmap(void)
-{
-}
-
 #else
 struct e820entry e820_map[E820_MAX];
 unsigned e820_entries;
@@ -199,6 +227,7 @@ static void e820_sanitize(void)
 {
     int i;
     unsigned long end, start;
+    bool found_lapic = false;
 
     /* Sanitize memory map in current form. */
     e820_process_entries();
@@ -238,8 +267,20 @@ static void e820_sanitize(void)
 
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
@@ -264,6 +305,12 @@ void e820_init_memmap(struct hvm_memmap_table_entry *entry, unsigned int num)
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
@@ -365,9 +412,6 @@ unsigned long e820_get_maxpfn(unsigned long pages)
     int i;
     unsigned long pfns = 0, start = 0;
 
-    if ( !e820_entries )
-        e820_get_memmap();
-
     for ( i = 0; i < e820_entries; i++ )
     {
         if ( e820_map[i].type != E820_RAM )
diff --git a/include/e820.h b/include/e820.h
index 5438a7c8..ffa15aa9 100644
--- a/include/e820.h
+++ b/include/e820.h
@@ -52,6 +52,8 @@ struct __packed e820entry {
 extern struct e820entry e820_map[];
 extern unsigned e820_entries;
 
+unsigned long e820_get_current_pages(void);
+unsigned long e820_get_max_pages(void);
 unsigned long e820_get_maxpfn(unsigned long pages);
 unsigned long e820_get_max_contig_pages(unsigned long pfn, unsigned long pages);
 #ifndef CONFIG_E820_TRIVIAL
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


