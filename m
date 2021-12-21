Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3619347BC14
	for <lists+xen-devel@lfdr.de>; Tue, 21 Dec 2021 09:47:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.250193.430950 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mzanZ-00056A-HK; Tue, 21 Dec 2021 08:47:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 250193.430950; Tue, 21 Dec 2021 08:47:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mzanY-0004v8-MB; Tue, 21 Dec 2021 08:47:04 +0000
Received: by outflank-mailman (input) for mailman id 250193;
 Tue, 21 Dec 2021 08:47:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=rEWG=RG=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1mzanV-0002yE-9F
 for xen-devel@lists.xenproject.org; Tue, 21 Dec 2021 08:47:01 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8b7a08f9-623a-11ec-9e60-abaf8a552007;
 Tue, 21 Dec 2021 09:46:53 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id D46A31F3A6;
 Tue, 21 Dec 2021 08:46:52 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id ABE9513BEC;
 Tue, 21 Dec 2021 08:46:52 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id SGmyKHyUwWFHMAAAMHmgww
 (envelope-from <jgross@suse.com>); Tue, 21 Dec 2021 08:46:52 +0000
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
X-Inumbo-ID: 8b7a08f9-623a-11ec-9e60-abaf8a552007
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1640076412; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Re/Y81QPVsmb4huxIK864YtWHyj0GbHOxxQ8cDq1GGE=;
	b=Mfrv1lJy+dqaaiGaP9d3hiugLOv7FGKQy3VpDcnzqICvE8JgzAtISoxngcE0mWGgL/Ds4T
	OnYA5ETKwVe//bIhMtXU6KJmmdvNlFNby+tVxCNiMMPfElPBj5XzlC0WbFbGEaODkDZjkR
	TxQ74K3Oq77dhzzrUKv+831L82dSIwg=
From: Juergen Gross <jgross@suse.com>
To: minios-devel@lists.xenproject.org,
	xen-devel@lists.xenproject.org
Cc: samuel.thibault@ens-lyon.org,
	wl@xen.org,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH v3 04/10] mini-os: respect memory map when ballooning up
Date: Tue, 21 Dec 2021 09:46:30 +0100
Message-Id: <20211221084636.6987-5-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20211221084636.6987-1-jgross@suse.com>
References: <20211221084636.6987-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Today Mini-OS won't look at the memory map when ballooning up. This can
result in problems for PVH domains with more than 4 GB of RAM, as
ballooning will happily run into the ACPI area.

Fix that by adding only pages being marked as RAM in the memory map and
by distinguishing between the current number of RAM pages and the first
unallocated page.

Signed-off-by: Juergen Gross <jgross@suse.com>
Reviewed-by: Samuel Thibault <samuel.thibault@ens-lyon.org>
---
V2:
- rename and fix e820_get_max_pages() (Samuel Thibault)
V3:
- fix loop condition
---
 arch/arm/mm.c      |  3 +++
 arch/x86/balloon.c |  4 ++--
 arch/x86/mm.c      |  2 ++
 balloon.c          | 33 ++++++++++++++++++++++++---------
 e820.c             | 21 ++++++++++++++++++++-
 include/balloon.h  |  5 +++--
 include/e820.h     |  1 +
 mm.c               |  7 ++-----
 8 files changed, 57 insertions(+), 19 deletions(-)

diff --git a/arch/arm/mm.c b/arch/arm/mm.c
index 9068166..11962f8 100644
--- a/arch/arm/mm.c
+++ b/arch/arm/mm.c
@@ -3,6 +3,7 @@
 #include <arch_mm.h>
 #include <mini-os/errno.h>
 #include <mini-os/hypervisor.h>
+#include <mini-os/balloon.h>
 #include <libfdt.h>
 #include <lib.h>
 
@@ -70,6 +71,8 @@ void arch_init_mm(unsigned long *start_pfn_p, unsigned long *max_pfn_p)
     }
     device_tree = new_device_tree;
     *max_pfn_p = to_phys(new_device_tree) >> PAGE_SHIFT;
+
+    balloon_set_nr_pages(*max_pfn_p, *max_pfn_p);
 }
 
 void arch_init_demand_mapping_area(void)
diff --git a/arch/x86/balloon.c b/arch/x86/balloon.c
index 10b440c..fe79644 100644
--- a/arch/x86/balloon.c
+++ b/arch/x86/balloon.c
@@ -61,10 +61,10 @@ void arch_remap_p2m(unsigned long max_pfn)
     p2m_invalidate(l2_list, L2_P2M_IDX(max_pfn - 1) + 1);
     p2m_invalidate(l1_list, L1_P2M_IDX(max_pfn - 1) + 1);
 
-    if ( p2m_pages(nr_max_pages) <= p2m_pages(max_pfn) )
+    if ( p2m_pages(nr_max_pfn) <= p2m_pages(max_pfn) )
         return;
 
-    new_p2m = alloc_virt_kernel(p2m_pages(nr_max_pages));
+    new_p2m = alloc_virt_kernel(p2m_pages(nr_max_pfn));
     for ( pfn = 0; pfn < max_pfn; pfn += P2M_ENTRIES )
     {
         map_frame_rw(new_p2m + PAGE_SIZE * (pfn / P2M_ENTRIES),
diff --git a/arch/x86/mm.c b/arch/x86/mm.c
index 3bf6170..c30d8bc 100644
--- a/arch/x86/mm.c
+++ b/arch/x86/mm.c
@@ -72,6 +72,7 @@ void arch_mm_preinit(void *p)
     pt_base = (pgentry_t *)si->pt_base;
     first_free_pfn = PFN_UP(to_phys(pt_base)) + si->nr_pt_frames;
     last_free_pfn = si->nr_pages;
+    balloon_set_nr_pages(last_free_pfn, last_free_pfn);
 }
 #else
 #include <mini-os/desc.h>
@@ -118,6 +119,7 @@ void arch_mm_preinit(void *p)
     }
 
     last_free_pfn = e820_get_maxpfn(ret);
+    balloon_set_nr_pages(ret, last_free_pfn);
 }
 #endif
 
diff --git a/balloon.c b/balloon.c
index 5676d3b..9dc77c5 100644
--- a/balloon.c
+++ b/balloon.c
@@ -23,14 +23,24 @@
 
 #include <mini-os/os.h>
 #include <mini-os/balloon.h>
+#include <mini-os/e820.h>
 #include <mini-os/errno.h>
 #include <mini-os/lib.h>
 #include <mini-os/paravirt.h>
 #include <xen/xen.h>
 #include <xen/memory.h>
 
-unsigned long nr_max_pages;
-unsigned long nr_mem_pages;
+unsigned long nr_max_pfn;
+
+static unsigned long nr_max_pages;
+static unsigned long nr_mem_pfn;
+static unsigned long nr_mem_pages;
+
+void balloon_set_nr_pages(unsigned long pages, unsigned long pfn)
+{
+    nr_mem_pages = pages;
+    nr_mem_pfn = pfn;
+}
 
 void get_max_pages(void)
 {
@@ -46,16 +56,18 @@ void get_max_pages(void)
 
     nr_max_pages = ret;
     printk("Maximum memory size: %ld pages\n", nr_max_pages);
+
+    nr_max_pfn = e820_get_maxpfn(nr_max_pages);
 }
 
 void mm_alloc_bitmap_remap(void)
 {
     unsigned long i, new_bitmap;
 
-    if ( mm_alloc_bitmap_size >= ((nr_max_pages + 1) >> 3) )
+    if ( mm_alloc_bitmap_size >= ((nr_max_pfn + 1) >> 3) )
         return;
 
-    new_bitmap = alloc_virt_kernel(PFN_UP((nr_max_pages + 1) >> 3));
+    new_bitmap = alloc_virt_kernel(PFN_UP((nr_max_pfn + 1) >> 3));
     for ( i = 0; i < mm_alloc_bitmap_size; i += PAGE_SIZE )
     {
         map_frame_rw(new_bitmap + i,
@@ -70,7 +82,7 @@ static unsigned long balloon_frames[N_BALLOON_FRAMES];
 
 int balloon_up(unsigned long n_pages)
 {
-    unsigned long page, pfn;
+    unsigned long page, pfn, start_pfn;
     int rc;
     struct xen_memory_reservation reservation = {
         .domid        = DOMID_SELF
@@ -81,8 +93,11 @@ int balloon_up(unsigned long n_pages)
     if ( n_pages > N_BALLOON_FRAMES )
         n_pages = N_BALLOON_FRAMES;
 
+    start_pfn = e820_get_maxpfn(nr_mem_pages + 1) - 1;
+    n_pages = e820_get_max_contig_pages(start_pfn, n_pages);
+
     /* Resize alloc_bitmap if necessary. */
-    while ( mm_alloc_bitmap_size * 8 < nr_mem_pages + n_pages )
+    while ( mm_alloc_bitmap_size * 8 < start_pfn + n_pages )
     {
         page = alloc_page();
         if ( !page )
@@ -99,14 +114,14 @@ int balloon_up(unsigned long n_pages)
         mm_alloc_bitmap_size += PAGE_SIZE;
     }
 
-    rc = arch_expand_p2m(nr_mem_pages + n_pages);
+    rc = arch_expand_p2m(start_pfn + n_pages);
     if ( rc )
         return rc;
 
     /* Get new memory from hypervisor. */
     for ( pfn = 0; pfn < n_pages; pfn++ )
     {
-        balloon_frames[pfn] = nr_mem_pages + pfn;
+        balloon_frames[pfn] = start_pfn + pfn;
     }
     set_xen_guest_handle(reservation.extent_start, balloon_frames);
     reservation.nr_extents = n_pages;
@@ -116,7 +131,7 @@ int balloon_up(unsigned long n_pages)
 
     for ( pfn = 0; pfn < rc; pfn++ )
     {
-        arch_pfn_add(nr_mem_pages + pfn, balloon_frames[pfn]);
+        arch_pfn_add(start_pfn + pfn, balloon_frames[pfn]);
         free_page(pfn_to_virt(nr_mem_pages + pfn));
     }
 
diff --git a/e820.c b/e820.c
index 8030f43..2a371c7 100644
--- a/e820.c
+++ b/e820.c
@@ -290,7 +290,8 @@ unsigned long e820_get_maxpfn(unsigned long pages)
     int i;
     unsigned long pfns, start = 0;
 
-    e820_get_memmap();
+    if ( !e820_entries )
+        e820_get_memmap();
 
     for ( i = 0; i < e820_entries; i++ )
     {
@@ -305,3 +306,21 @@ unsigned long e820_get_maxpfn(unsigned long pages)
 
     return start + pfns;
 }
+
+unsigned long e820_get_max_contig_pages(unsigned long pfn, unsigned long pages)
+{
+    int i;
+    unsigned long end;
+
+    for ( i = 0; i < e820_entries && e820_map[i].addr <= (pfn << PAGE_SHIFT);
+          i++ )
+    {
+        end = (e820_map[i].addr + e820_map[i].size) >> PAGE_SHIFT;
+        if ( e820_map[i].type != E820_RAM || end <= pfn )
+            continue;
+
+        return ((end - pfn) > pages) ? pages : end - pfn;
+    }
+
+    return 0;
+}
diff --git a/include/balloon.h b/include/balloon.h
index 6cfec4f..8f7c8bd 100644
--- a/include/balloon.h
+++ b/include/balloon.h
@@ -32,11 +32,11 @@
  */
 #define BALLOON_EMERGENCY_PAGES   64
 
-extern unsigned long nr_max_pages;
-extern unsigned long nr_mem_pages;
+extern unsigned long nr_max_pfn;
 
 void get_max_pages(void);
 int balloon_up(unsigned long n_pages);
+void balloon_set_nr_pages(unsigned long pages, unsigned long pfn);
 
 void mm_alloc_bitmap_remap(void);
 void arch_pfn_add(unsigned long pfn, unsigned long mfn);
@@ -50,6 +50,7 @@ static inline int chk_free_pages(unsigned long needed)
 {
     return needed <= nr_free_pages;
 }
+static inline balloon_set_nr_pages(unsigned long pages, unsigned long pfn) { }
 
 #endif /* CONFIG_BALLOON */
 #endif /* _BALLOON_H_ */
diff --git a/include/e820.h b/include/e820.h
index 6a57f05..8d4d371 100644
--- a/include/e820.h
+++ b/include/e820.h
@@ -50,5 +50,6 @@ extern struct e820entry e820_map[];
 extern unsigned e820_entries;
 
 unsigned long e820_get_maxpfn(unsigned long pages);
+unsigned long e820_get_max_contig_pages(unsigned long pfn, unsigned long pages);
 
 #endif /*__E820_HEADER*/
diff --git a/mm.c b/mm.c
index 932ceeb..6493bdd 100644
--- a/mm.c
+++ b/mm.c
@@ -396,8 +396,9 @@ void init_mm(void)
 
     printk("MM: Init\n");
 
-    get_max_pages();
     arch_init_mm(&start_pfn, &max_pfn);
+    get_max_pages();
+
     /*
      * now we can initialise the page allocator
      */
@@ -407,10 +408,6 @@ void init_mm(void)
     arch_init_p2m(max_pfn);
     
     arch_init_demand_mapping_area();
-
-#ifdef CONFIG_BALLOON
-    nr_mem_pages = max_pfn;
-#endif
 }
 
 void fini_mm(void)
-- 
2.26.2


