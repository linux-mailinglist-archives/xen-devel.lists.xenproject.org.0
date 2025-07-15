Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 389FFB05C50
	for <lists+xen-devel@lfdr.de>; Tue, 15 Jul 2025 15:30:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1044115.1414227 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ubfjH-0001BX-14; Tue, 15 Jul 2025 13:29:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1044115.1414227; Tue, 15 Jul 2025 13:29:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ubfjG-00019y-TZ; Tue, 15 Jul 2025 13:29:54 +0000
Received: by outflank-mailman (input) for mailman id 1044115;
 Tue, 15 Jul 2025 13:29:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=7giJ=Z4=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1ubfjF-0000p6-4k
 for xen-devel@lists.xenproject.org; Tue, 15 Jul 2025 13:29:53 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de
 [2a07:de40:b251:101:10:150:64:2])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c8dfc851-617f-11f0-b894-0df219b8e170;
 Tue, 15 Jul 2025 15:29:50 +0200 (CEST)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 2FB2E1F44F;
 Tue, 15 Jul 2025 13:29:48 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 0673113A68;
 Tue, 15 Jul 2025 13:29:48 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id MCIYAMxXdmgJNwAAD6G6ig
 (envelope-from <jgross@suse.com>); Tue, 15 Jul 2025 13:29:48 +0000
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
X-Inumbo-ID: c8dfc851-617f-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1752586188; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NTu0grqsD74PNEs9r+9EO+DwJ5Ex1gjWiVPjU6SdJuY=;
	b=Kpm3VYPWOiYkSIDCJjnnLl0TXzWygPeSylUcOeQomU9E9SHa/mLH6jns/yA0tJs1XGybGH
	SL039sf3W0Q6hW2KJQL2Siv0NRHvsHpmoy5mKaC55udeWi04Z0mu+HjxjI99t24xbMULdI
	5BirFR1rEF0xmVrTJivjkJTTnQ2nFKM=
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.com header.s=susede1 header.b=Kpm3VYPW
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1752586188; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NTu0grqsD74PNEs9r+9EO+DwJ5Ex1gjWiVPjU6SdJuY=;
	b=Kpm3VYPWOiYkSIDCJjnnLl0TXzWygPeSylUcOeQomU9E9SHa/mLH6jns/yA0tJs1XGybGH
	SL039sf3W0Q6hW2KJQL2Siv0NRHvsHpmoy5mKaC55udeWi04Z0mu+HjxjI99t24xbMULdI
	5BirFR1rEF0xmVrTJivjkJTTnQ2nFKM=
From: Juergen Gross <jgross@suse.com>
To: minios-devel@lists.xenproject.org,
	xen-devel@lists.xenproject.org
Cc: samuel.thibault@ens-lyon.org,
	Juergen Gross <jgross@suse.com>
Subject: [MINI-OS PATCH v2 01/14] mm: don't add module pages to free memory
Date: Tue, 15 Jul 2025 15:29:23 +0200
Message-ID: <20250715132936.2798-2-jgross@suse.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250715132936.2798-1-jgross@suse.com>
References: <20250715132936.2798-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spam-Flag: NO
X-Rspamd-Queue-Id: 2FB2E1F44F
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.com:s=susede1];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_SIGNED(0.00)[suse.com:s=susede1];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCVD_TLS_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCPT_COUNT_THREE(0.00)[4];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim,suse.com:mid,suse.com:email,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo]
X-Spam-Score: -3.01

When initializing the memory allocator, don't add memory pages of
modules and the initial boot info structure to the free memory.

This is relevant only when running in PVH mode, as in PV mode only
memory above the initial page tables is added to free memory, and the
module and start_info pages are below the page tables.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
V2:
- call pvh_reserve_start_info() from arch_mm_preinit() (Jason Andryuk)
---
 arch/x86/mm.c | 77 +++++++++++++++++++++++++++++++++++++++++++++++++++
 include/mm.h  |  1 +
 mm.c          | 21 +++++++++++++-
 3 files changed, 98 insertions(+), 1 deletion(-)

diff --git a/arch/x86/mm.c b/arch/x86/mm.c
index 26ede6f4..f60e7d58 100644
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
@@ -108,6 +112,42 @@ desc_ptr idt_ptr =
     .base = (unsigned long)&idt,
 };
 
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
+
 void arch_mm_preinit(void *p)
 {
     unsigned int pages;
@@ -124,6 +164,43 @@ void arch_mm_preinit(void *p)
     pages = e820_get_current_pages();
     last_free_pfn = e820_get_maxpfn(pages);
     balloon_set_nr_pages(pages, last_free_pfn);
+    pvh_reserve_start_info(&first_free_pfn);
+}
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
 }
 #endif
 
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


