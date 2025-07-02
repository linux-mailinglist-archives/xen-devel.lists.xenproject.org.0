Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CD01AF0DC2
	for <lists+xen-devel@lfdr.de>; Wed,  2 Jul 2025 10:21:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1030543.1404285 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uWsic-00034Z-JW; Wed, 02 Jul 2025 08:21:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1030543.1404285; Wed, 02 Jul 2025 08:21:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uWsic-000318-DT; Wed, 02 Jul 2025 08:21:26 +0000
Received: by outflank-mailman (input) for mailman id 1030543;
 Wed, 02 Jul 2025 08:21:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=KFiP=ZP=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1uWsaz-00082X-4Q
 for xen-devel@lists.xenproject.org; Wed, 02 Jul 2025 08:13:33 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7102907b-571c-11f0-b894-0df219b8e170;
 Wed, 02 Jul 2025 10:13:31 +0200 (CEST)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 3F6212117F;
 Wed,  2 Jul 2025 08:13:31 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 135DA13A24;
 Wed,  2 Jul 2025 08:13:31 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id FoE4AyvqZGgfSQAAD6G6ig
 (envelope-from <jgross@suse.com>); Wed, 02 Jul 2025 08:13:31 +0000
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
X-Inumbo-ID: 7102907b-571c-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1751444011; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PqeT9QtIJE1Ok+fqszezjXe9WOy8z56eRXWRpRN0vUQ=;
	b=QrGGKNYL/DWVxxTQCLDbMmIH7WiOgWMb7tx1iOXOjolTiAiQlzDJxRfPweerBktWwhi3Nj
	Ihh1pzYSvqqSlsaH28aA0oOTozW+Y3GOnU7FG14JRopCWE1kJJpZ9oFZD4P42d+47l0TRi
	AOKexml5tJYNEP1+Q06QyXLtOnirIiA=
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1751444011; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PqeT9QtIJE1Ok+fqszezjXe9WOy8z56eRXWRpRN0vUQ=;
	b=QrGGKNYL/DWVxxTQCLDbMmIH7WiOgWMb7tx1iOXOjolTiAiQlzDJxRfPweerBktWwhi3Nj
	Ihh1pzYSvqqSlsaH28aA0oOTozW+Y3GOnU7FG14JRopCWE1kJJpZ9oFZD4P42d+47l0TRi
	AOKexml5tJYNEP1+Q06QyXLtOnirIiA=
From: Juergen Gross <jgross@suse.com>
To: minios-devel@lists.xenproject.org,
	xen-devel@lists.xenproject.org
Cc: samuel.thibault@ens-lyon.org,
	Juergen Gross <jgross@suse.com>
Subject: [MINI-OS PATCH 06/19] mm: don't add module pages to free memory
Date: Wed,  2 Jul 2025 10:12:41 +0200
Message-ID: <20250702081254.14383-7-jgross@suse.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250702081254.14383-1-jgross@suse.com>
References: <20250702081254.14383-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Flag: NO
X-Spam-Score: -2.80
X-Spamd-Result: default: False [-2.80 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-0.999];
	MIME_GOOD(-0.10)[text/plain];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	DKIM_SIGNED(0.00)[suse.com:s=susede1];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:mid,suse.com:email,imap1.dmz-prg2.suse.org:helo];
	RCVD_TLS_ALL(0.00)[]
X-Spam-Level: 

When initializing the memory allocator, don't add memory pages of
modules and the initial boot info structure to the free memory.

This is relevant only when running in PVH mode, as in PV mode only
memory above the initial page tables is added to free memory, and the
module and start_info pages are below the page tables.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 arch/x86/mm.c | 80 +++++++++++++++++++++++++++++++++++++++++++++++++++
 include/mm.h  |  1 +
 mm.c          | 21 +++++++++++++-
 3 files changed, 101 insertions(+), 1 deletion(-)

diff --git a/arch/x86/mm.c b/arch/x86/mm.c
index 26ede6f4..7c3c83be 100644
--- a/arch/x86/mm.c
+++ b/arch/x86/mm.c
@@ -78,6 +78,10 @@ void arch_mm_preinit(void *p)
     last_free_pfn = si->nr_pages;
     balloon_set_nr_pages(last_free_pfn, last_free_pfn);
 }
+
+void check_memory_range(unsigned long *from, unsigned long *to)
+{
+}
 #else
 #include <mini-os/desc.h>
 user_desc gdt[NR_GDT_ENTRIES] =
@@ -125,6 +129,78 @@ void arch_mm_preinit(void *p)
     last_free_pfn = e820_get_maxpfn(pages);
     balloon_set_nr_pages(pages, last_free_pfn);
 }
+
+static void check_memory_range_conflict(unsigned long *from, unsigned long *to,
+                                        unsigned long chk, unsigned long sz)
+{
+    unsigned long chk_end = chk + sz;
+
+    if ( *to <= chk || *from >= chk_end )
+        return;
+
+    if ( chk <= *from )
+        *from = (chk_end >= *to) ? *to : chk_end;
+    else
+        *to = chk;
+}
+
+/* Reserved memory ranges not added to free memory. */
+#define MAX_RSV_RANGES  1
+static struct {
+    unsigned long start;
+    unsigned long size;
+} reserved_range[MAX_RSV_RANGES];
+
+void check_memory_range(unsigned long *from, unsigned long *to)
+{
+    unsigned int m;
+    struct hvm_modlist_entry *mod;
+
+    for ( m = 0; m < MAX_RSV_RANGES && reserved_range[m].size; m++ )
+        check_memory_range_conflict(from, to, reserved_range[m].start,
+                                    reserved_range[m].size);
+
+    mod = (struct hvm_modlist_entry *)(unsigned long)
+          hvm_start_info_ptr->modlist_paddr;
+    for ( m = 0; m < hvm_start_info_ptr->nr_modules; m++ )
+        check_memory_range_conflict(from, to, mod[m].paddr, mod[m].size);
+}
+
+#define max(a, b) ((a) < (b) ? (b) : (a))
+
+static void pvh_reserve_start_info(unsigned long *start_pfn)
+{
+    unsigned long end = 0;
+    unsigned long start = (unsigned long)hvm_start_info_ptr;
+    unsigned long end_pfn;
+    unsigned int m;
+    struct hvm_modlist_entry *mod;
+    char *cmdline;
+
+    mod = (void *)(unsigned long)hvm_start_info_ptr->modlist_paddr;
+
+    end = max(end, start + sizeof(struct hvm_start_info));
+    end = max(end, hvm_start_info_ptr->modlist_paddr +
+              hvm_start_info_ptr->nr_modules *
+              sizeof(struct hvm_modlist_entry));
+    for ( m = 0; m < hvm_start_info_ptr->nr_modules; m++ )
+    {
+        cmdline = (char *)(unsigned long)mod[m].cmdline_paddr;
+        if ( cmdline )
+            end = max(end, (unsigned long)cmdline + strlen(cmdline) + 1);
+    }
+    cmdline = (char *)(unsigned long)hvm_start_info_ptr->cmdline_paddr;
+    if ( cmdline )
+        end = max(end, (unsigned long)cmdline + strlen(cmdline) + 1);
+    if ( hvm_start_info_ptr->version >= 1 )
+        end = max(end, hvm_start_info_ptr->memmap_paddr +
+                  hvm_start_info_ptr->memmap_entries *
+                  sizeof(struct hvm_memmap_table_entry));
+
+    end_pfn = PFN_UP(end);
+    if ( end_pfn > *start_pfn )
+        *start_pfn = end_pfn;
+}
 #endif
 
 static const struct {
@@ -888,6 +964,10 @@ void arch_init_mm(unsigned long* start_pfn_p, unsigned long* max_pfn_p)
     if ( max_pfn >= MAX_MEM_SIZE / PAGE_SIZE )
         max_pfn = MAX_MEM_SIZE / PAGE_SIZE - 1;
 
+#ifndef CONFIG_PARAVIRT
+    pvh_reserve_start_info(&start_pfn);
+#endif
+
     printk("  start_pfn: %lx\n", start_pfn);
     printk("    max_pfn: %lx\n", max_pfn);
 
diff --git a/include/mm.h b/include/mm.h
index 1dc89ddb..995e9862 100644
--- a/include/mm.h
+++ b/include/mm.h
@@ -74,6 +74,7 @@ static __inline__ int get_order(unsigned long size)
 
 void arch_init_demand_mapping_area(void);
 void arch_init_mm(unsigned long* start_pfn_p, unsigned long* max_pfn_p);
+void check_memory_range(unsigned long *from, unsigned long *to);
 
 unsigned long allocate_ondemand(unsigned long n, unsigned long alignment);
 /* map f[i*stride]+i*increment for i in 0..n-1, aligned on alignment pages */
diff --git a/mm.c b/mm.c
index 858dc108..8c41d2f2 100644
--- a/mm.c
+++ b/mm.c
@@ -185,6 +185,25 @@ static void add_memory_range(unsigned long r_min, unsigned long r_max)
     }
 }
 
+static void consider_memory_range(unsigned long r_min, unsigned long r_max,
+                                  void (*func)(unsigned long, unsigned long))
+{
+    unsigned long from = r_min;
+    unsigned long to = r_max;
+
+    while ( true )
+    {
+        check_memory_range(&from, &to);
+        if ( from == to )
+            return;
+
+        func(from, to);
+
+        from = to;
+        to = r_max;
+    }
+}
+
 void iterate_memory_range(unsigned long min, unsigned long max,
                           void (*func)(unsigned long, unsigned long))
 {
@@ -207,7 +226,7 @@ void iterate_memory_range(unsigned long min, unsigned long max,
         if ( r_max > max )
             r_max = max;
 
-        func(r_min, r_max);
+        consider_memory_range(r_min, r_max, func);
     }
 }
 
-- 
2.43.0


