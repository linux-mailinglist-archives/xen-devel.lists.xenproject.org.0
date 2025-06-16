Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E6C8FADAB21
	for <lists+xen-devel@lfdr.de>; Mon, 16 Jun 2025 10:51:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1016942.1393940 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uR5YB-00047m-Le; Mon, 16 Jun 2025 08:50:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1016942.1393940; Mon, 16 Jun 2025 08:50:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uR5YB-00044t-Hs; Mon, 16 Jun 2025 08:50:43 +0000
Received: by outflank-mailman (input) for mailman id 1016942;
 Mon, 16 Jun 2025 08:50:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=GKzt=Y7=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1uR5Uo-0007jR-GY
 for xen-devel@lists.xenproject.org; Mon, 16 Jun 2025 08:47:14 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7eedf500-4a8e-11f0-a309-13f23c93f187;
 Mon, 16 Jun 2025 10:47:12 +0200 (CEST)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 2B3FB1F387;
 Mon, 16 Jun 2025 08:47:12 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id E1D1D139E2;
 Mon, 16 Jun 2025 08:47:11 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id c91kNQ/aT2gzQAAAD6G6ig
 (envelope-from <jgross@suse.com>); Mon, 16 Jun 2025 08:47:11 +0000
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
X-Inumbo-ID: 7eedf500-4a8e-11f0-a309-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1750063632; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PH+wEmmUZQaMniHgWmRo2+UM2z0RSGbsNqftNFMeuQo=;
	b=F86He+TTVrGS+5vuLSTsGyJlyDfbSDa2RjExEiUHJJVgeHR/0gNLAlWNdO94q/vQdZu95C
	YUUKnoK5lVD5tj9tj5TztJtAVntuujCirxRsmCiRo/3mmgP66lVjufKJe+y0i7/Q9Tp9gW
	keaScFbi1Mvlij0y3jhG7E+beTdJjv0=
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.com header.s=susede1 header.b=F86He+TT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1750063632; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PH+wEmmUZQaMniHgWmRo2+UM2z0RSGbsNqftNFMeuQo=;
	b=F86He+TTVrGS+5vuLSTsGyJlyDfbSDa2RjExEiUHJJVgeHR/0gNLAlWNdO94q/vQdZu95C
	YUUKnoK5lVD5tj9tj5TztJtAVntuujCirxRsmCiRo/3mmgP66lVjufKJe+y0i7/Q9Tp9gW
	keaScFbi1Mvlij0y3jhG7E+beTdJjv0=
From: Juergen Gross <jgross@suse.com>
To: minios-devel@lists.xenproject.org,
	xen-devel@lists.xenproject.org
Cc: samuel.thibault@ens-lyon.org,
	Juergen Gross <jgross@suse.com>,
	Jason Andryuk <jason.andryuk@amd.com>
Subject: [MINI-OS PATCH v2 09/12] Mini-OS: mm: change set_readonly() to change_readonly()
Date: Mon, 16 Jun 2025 10:46:16 +0200
Message-ID: <20250616084619.11112-10-jgross@suse.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250616084619.11112-1-jgross@suse.com>
References: <20250616084619.11112-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.com:s=susede1];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	MIME_TRACE(0.00)[0:+];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	TO_DN_SOME(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	FROM_HAS_DN(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim,suse.com:mid,suse.com:email,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,amd.com:email];
	RCVD_TLS_ALL(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	DKIM_SIGNED(0.00)[suse.com:s=susede1];
	DKIM_TRACE(0.00)[suse.com:+]
X-Spam-Level: 
X-Spam-Flag: NO
X-Rspamd-Queue-Id: 2B3FB1F387
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Score: -3.01

Rename set_readonly() to change_readonly() and add a parameter
specifying whether it should set the kernel to readonly or to writable.
At the same time move the boundary setting from the only caller into
the function itself, avoiding the need to use the same boundaries in
future, when it will be called to set the kernel to writable again.
Make the function globally visible in order to allow calling it from
kexec coding later.

Merge clear_bootstrap() into change_readonly() and undo its setting of
page 0 to invalid when setting the kernel writable.

Signed-off-by: Juergen Gross <jgross@suse.com>
Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>
---
 arch/x86/mm.c | 111 +++++++++++++++++++++++++++-----------------------
 include/mm.h  |   3 ++
 2 files changed, 64 insertions(+), 50 deletions(-)

diff --git a/arch/x86/mm.c b/arch/x86/mm.c
index a71eb192..f4419d95 100644
--- a/arch/x86/mm.c
+++ b/arch/x86/mm.c
@@ -405,17 +405,19 @@ static void build_pagetable(unsigned long *start_pfn, unsigned long *max_pfn)
  */
 extern struct shared_info shared_info;
 
-struct set_readonly_par {
+struct change_readonly_par {
     unsigned long etext;
 #ifdef CONFIG_PARAVIRT
     unsigned int count;
 #endif
+    bool readonly;
 };
 
-static int set_readonly_func(unsigned long va, unsigned int lvl, bool is_leaf,
-                             pgentry_t *pte, void *par)
+static int change_readonly_func(unsigned long va, unsigned int lvl,
+                                bool is_leaf, pgentry_t *pte, void *par)
 {
-    struct set_readonly_par *ro = par;
+    struct change_readonly_par *ro = par;
+    pgentry_t newval;
 
     if ( !is_leaf )
         return 0;
@@ -429,9 +431,11 @@ static int set_readonly_func(unsigned long va, unsigned int lvl, bool is_leaf,
         return 0;
     }
 
+    newval = ro->readonly ? (*pte & ~_PAGE_RW) : (*pte | _PAGE_RW);
+
 #ifdef CONFIG_PARAVIRT
     mmu_updates[ro->count].ptr = virt_to_mach(pte);
-    mmu_updates[ro->count].val = *pte & ~_PAGE_RW;
+    mmu_updates[ro->count].val = newval;
     ro->count++;
 
     if ( ro->count == L1_PAGETABLE_ENTRIES )
@@ -442,7 +446,7 @@ static int set_readonly_func(unsigned long va, unsigned int lvl, bool is_leaf,
          ro->count = 0;
     }
 #else
-    *pte &= ~_PAGE_RW;
+    *pte = newval;
 #endif
 
     return 0;
@@ -463,23 +467,6 @@ static void tlb_flush(void)
 }
 #endif
 
-static void set_readonly(void *text, void *etext)
-{
-    struct set_readonly_par setro = { .etext = (unsigned long)etext };
-    unsigned long start_address = PAGE_ALIGN((unsigned long)text);
-
-    printk("setting %p-%p readonly\n", text, etext);
-    walk_pt(start_address, setro.etext, set_readonly_func, &setro);
-
-#ifdef CONFIG_PARAVIRT
-    if ( setro.count &&
-         HYPERVISOR_mmu_update(mmu_updates, setro.count, NULL, DOMID_SELF) < 0)
-        BUG();
-#endif
-
-    tlb_flush();
-}
-
 /*
  * get the PTE for virtual address va if it exists. Otherwise NULL.
  */
@@ -508,6 +495,51 @@ static pgentry_t *get_pgt(unsigned long va)
     return tab;
 }
 
+void change_readonly(bool readonly)
+{
+    struct change_readonly_par ro = {
+        .etext = (unsigned long)&_erodata,
+        .readonly = readonly,
+    };
+    unsigned long start_address = PAGE_ALIGN((unsigned long)&_text);
+#ifdef CONFIG_PARAVIRT
+    pte_t nullpte = { };
+    int rc;
+#else
+    pgentry_t *pgt = get_pgt((unsigned long)&_text);
+#endif
+
+    if ( readonly )
+    {
+#ifdef CONFIG_PARAVIRT
+        if ( (rc = HYPERVISOR_update_va_mapping(0, nullpte, UVMF_INVLPG)) )
+            printk("Unable to unmap NULL page. rc=%d\n", rc);
+#else
+        *pgt = 0;
+        invlpg((unsigned long)&_text);
+#endif
+    }
+    else
+    {
+#ifdef CONFIG_PARAVIRT
+        /* No kexec support with PARAVIRT. */
+        BUG();
+#else
+        *pgt = L1_PROT;
+#endif
+    }
+
+    printk("setting %p-%p readonly\n", &_text, &_erodata);
+    walk_pt(start_address, ro.etext, change_readonly_func, &ro);
+
+#ifdef CONFIG_PARAVIRT
+    if ( ro.count &&
+         HYPERVISOR_mmu_update(mmu_updates, ro.count, NULL, DOMID_SELF) < 0)
+        BUG();
+#endif
+
+    tlb_flush();
+}
 
 /*
  * return a valid PTE for a given virtual address. If PTE does not exist,
@@ -789,31 +821,6 @@ int unmap_frames(unsigned long va, unsigned long num_frames)
 }
 EXPORT_SYMBOL(unmap_frames);
 
-/*
- * Clear some of the bootstrap memory
- */
-static void clear_bootstrap(void)
-{
-#ifdef CONFIG_PARAVIRT
-    pte_t nullpte = { };
-    int rc;
-#else
-    pgentry_t *pgt;
-#endif
-
-    /* Use first page as the CoW zero page */
-    memset(&_text, 0, PAGE_SIZE);
-    mfn_zero = virt_to_mfn((unsigned long) &_text);
-#ifdef CONFIG_PARAVIRT
-    if ( (rc = HYPERVISOR_update_va_mapping(0, nullpte, UVMF_INVLPG)) )
-        printk("Unable to unmap NULL page. rc=%d\n", rc);
-#else
-    pgt = get_pgt((unsigned long)&_text);
-    *pgt = 0;
-    invlpg((unsigned long)&_text);
-#endif
-}
-
 #ifdef CONFIG_PARAVIRT
 void p2m_chk_pfn(unsigned long pfn)
 {
@@ -884,8 +891,12 @@ void arch_init_mm(unsigned long* start_pfn_p, unsigned long* max_pfn_p)
     printk("    max_pfn: %lx\n", max_pfn);
 
     build_pagetable(&start_pfn, &max_pfn);
-    clear_bootstrap();
-    set_readonly(&_text, &_erodata);
+
+    /* Prepare page 0 as CoW page. */
+    memset(&_text, 0, PAGE_SIZE);
+    mfn_zero = virt_to_mfn((unsigned long)&_text);
+
+    change_readonly(true);
 
     *start_pfn_p = start_pfn;
     *max_pfn_p = max_pfn;
diff --git a/include/mm.h b/include/mm.h
index 5775c3e1..0a16d56c 100644
--- a/include/mm.h
+++ b/include/mm.h
@@ -25,6 +25,7 @@
 #ifndef _MM_H_
 #define _MM_H_
 
+#include <stdbool.h>
 #if defined(__i386__)
 #include <xen/arch-x86_32.h>
 #elif defined(__x86_64__)
@@ -92,4 +93,6 @@ extern unsigned long heap, brk, heap_mapped, heap_end;
 int free_physical_pages(xen_pfn_t *mfns, int n);
 void fini_mm(void);
 
+void change_readonly(bool readonly);
+
 #endif /* _MM_H_ */
-- 
2.43.0


