Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DAE1BB05C82
	for <lists+xen-devel@lfdr.de>; Tue, 15 Jul 2025 15:32:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1044184.1414300 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ubflc-0006HI-3M; Tue, 15 Jul 2025 13:32:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1044184.1414300; Tue, 15 Jul 2025 13:32:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ubflb-0006F2-V2; Tue, 15 Jul 2025 13:32:19 +0000
Received: by outflank-mailman (input) for mailman id 1044184;
 Tue, 15 Jul 2025 13:32:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=7giJ=Z4=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1ubfjr-0000p6-B8
 for xen-devel@lists.xenproject.org; Tue, 15 Jul 2025 13:30:31 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id deddae55-617f-11f0-b894-0df219b8e170;
 Tue, 15 Jul 2025 15:30:27 +0200 (CEST)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 7753621204;
 Tue, 15 Jul 2025 13:30:27 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 3E4B413A68;
 Tue, 15 Jul 2025 13:30:27 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id CqNVDfNXdmhuNwAAD6G6ig
 (envelope-from <jgross@suse.com>); Tue, 15 Jul 2025 13:30:27 +0000
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
X-Inumbo-ID: deddae55-617f-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1752586227; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dQG0ZTeiRyc26Tqw3qcZ1Dj3k6IjcIiutErlineQVn4=;
	b=NZ2ORD1YgOxFUDEQktZudNsTB9rkqxzOvgAcbLZzEyNGLXQu53e+b6Je6NJdmPTVcCK1Fg
	xEcWFNL09prPaYlxoLmIDRUjOZxPZIJtYlSH332HGKkHrKg2eMatccnZku4uU/3i8sMEtA
	ZZ9CqEWjqDzOpjrpRhZAZtrKkxBO/l4=
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1752586227; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dQG0ZTeiRyc26Tqw3qcZ1Dj3k6IjcIiutErlineQVn4=;
	b=NZ2ORD1YgOxFUDEQktZudNsTB9rkqxzOvgAcbLZzEyNGLXQu53e+b6Je6NJdmPTVcCK1Fg
	xEcWFNL09prPaYlxoLmIDRUjOZxPZIJtYlSH332HGKkHrKg2eMatccnZku4uU/3i8sMEtA
	ZZ9CqEWjqDzOpjrpRhZAZtrKkxBO/l4=
From: Juergen Gross <jgross@suse.com>
To: minios-devel@lists.xenproject.org,
	xen-devel@lists.xenproject.org
Cc: samuel.thibault@ens-lyon.org,
	Juergen Gross <jgross@suse.com>,
	Jason Andryuk <jason.andryuk@amd.com>
Subject: [MINI-OS PATCH v2 08/14] kexec: add support for allocating pages from kexec module memory
Date: Tue, 15 Jul 2025 15:29:30 +0200
Message-ID: <20250715132936.2798-9-jgross@suse.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250715132936.2798-1-jgross@suse.com>
References: <20250715132936.2798-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spamd-Result: default: False [-2.80 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-0.999];
	MIME_GOOD(-0.10)[text/plain];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.com:email,suse.com:mid,amd.com:email];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	DKIM_SIGNED(0.00)[suse.com:s=susede1];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_TLS_ALL(0.00)[]
X-Spam-Flag: NO
X-Spam-Score: -2.80

Add the needed functions for allocating and freeing memory pages of
the kexec module.

As the pages are always related to a kexec module record, add the
related utility functions, too. For now only support adding records
and retrieving them.

Signed-off-by: Juergen Gross <jgross@suse.com>
Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>
---
 arch/x86/kexec.c |  16 +++++++
 include/kexec.h  |  52 +++++++++++++++++++++
 kexec.c          | 115 +++++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 183 insertions(+)

diff --git a/arch/x86/kexec.c b/arch/x86/kexec.c
index 8c9f8a3c..e48df3f5 100644
--- a/arch/x86/kexec.c
+++ b/arch/x86/kexec.c
@@ -240,6 +240,9 @@ static void get_mod_addr(unsigned long from, unsigned long to)
 #define min(a, b) ((a) < (b) ? (a) : (b))
 void kexec_module(unsigned long start_pfn, unsigned long max_pfn)
 {
+    unsigned int i;
+    char *rec_end;
+
     /* Reuse already existing kexec module. */
     mod_ptr = kexec_check_module();
     if ( !mod_ptr && CONFIG_KEXEC_MODULE_PAGES )
@@ -257,11 +260,24 @@ void kexec_module(unsigned long start_pfn, unsigned long max_pfn)
                sizeof(mod_ptr->eye_catcher));
         mod_ptr->n_pages = CONFIG_KEXEC_MODULE_PAGES - 1;
         memset(mod_ptr->pg2rec, KEXECMOD_PG_FREE, mod_ptr->n_pages);
+        mod_ptr->n_records = 16;
         mod_ptr->recs_off = sizeof(struct kexec_module) +
                             mod_ptr->n_pages + (mod_ptr->n_pages & 1);
 
         set_reserved_range(kexec_mod_start, (unsigned long)mod_ptr + PAGE_SIZE);
     }
+
+    mod_recs = (void *)((unsigned long)mod_ptr + mod_ptr->recs_off);
+    mod_rec_start = (char *)(mod_recs + mod_ptr->n_records);
+    mod_rec_end = mod_rec_start;
+    for ( i = 0; i < mod_ptr->n_records; i++ )
+    {
+        if ( mod_recs[i].type == KEXECMOD_REC_NONE )
+            continue;
+        rec_end = (char *)mod_ptr + mod_recs[i].offset + mod_recs[i].size;
+        if ( mod_rec_end < rec_end )
+            mod_rec_end = rec_end;
+    }
 }
 
 void kexec_set_param_loc(const char *cmdline)
diff --git a/include/kexec.h b/include/kexec.h
index b38a9f54..0e0b1a4d 100644
--- a/include/kexec.h
+++ b/include/kexec.h
@@ -67,6 +67,9 @@ struct kexec_module_rec {
 
 extern unsigned long kexec_mod_start;
 extern struct kexec_module *mod_ptr;
+extern struct kexec_module_rec *mod_recs;
+extern char *mod_rec_start;
+extern char *mod_rec_end;
 
 /* One element of kexec actions (last element must have action KEXEC_CALL): */
 struct kexec_action {
@@ -80,6 +83,17 @@ struct kexec_action {
     void *src;
 };
 
+#ifdef CONFIG_KEXEC
+unsigned long kexec_alloc_mod_pages(unsigned int recid, unsigned int n);
+void kexec_free_mod_pages(unsigned int recid, unsigned long addr,
+                          unsigned int n);
+int kexec_find_mod_record(unsigned int start_idx, unsigned int type,
+                          unsigned int *size);
+int kexec_add_mod_record(unsigned int type, void *addr, unsigned int size);
+int kexec_upd_mod_record(unsigned int idx, unsigned int type,
+                         void *addr, unsigned int size);
+int kexec_read_mod_record(unsigned int idx, void *addr, unsigned int size);
+
 #define KEXEC_MAX_ACTIONS  16
 
 extern char _kexec_start[], _kexec_end[];
@@ -129,4 +143,42 @@ void kexec_move_used_pages_undo(void);
 /* Check for kexec module and create kexec memory if needed. */
 void kexec_module(unsigned long start_pfn, unsigned long max_pfn);
 
+#else /* CONFIG_KEXEC */
+static inline unsigned long kexec_alloc_mod_pages(unsigned int recid,
+                                                  unsigned int n)
+{
+    return 0;
+}
+
+static inline void kexec_free_mod_pages(unsigned int recid, unsigned long addr,
+                                        unsigned int n)
+{
+}
+
+static inline int kexec_find_mod_record(unsigned int start_idx,
+                                        unsigned int type, unsigned int *size)
+{
+    return 0;
+}
+
+static inline int kexec_add_mod_record(unsigned int type, void *addr,
+                                       unsigned int size)
+{
+    return 0;
+}
+
+static inline int kexec_upd_mod_record(unsigned int idx, unsigned int type,
+                                       void *addr, unsigned int size)
+{
+    return 0;
+}
+
+static inline int kexec_read_mod_record(unsigned int idx, void *addr,
+                                        unsigned int size)
+{
+    return 0;
+}
+
+#endif
+
 #endif /* _KEXEC_H */
diff --git a/kexec.c b/kexec.c
index ded29882..f17ed13d 100644
--- a/kexec.c
+++ b/kexec.c
@@ -253,3 +253,118 @@ int kexec_add_action(int action, void *dest, void *src, unsigned int len)
 
 unsigned long kexec_mod_start;
 struct kexec_module *mod_ptr;
+struct kexec_module_rec *mod_recs;
+char *mod_rec_start;
+char *mod_rec_end;
+
+unsigned long kexec_alloc_mod_pages(unsigned int recid, unsigned int n)
+{
+    unsigned int first = 0, i;
+
+    for ( i = 0; i < mod_ptr->n_pages; i++ )
+    {
+        if ( i - first == n - 1 )
+        {
+            for ( i = 0; i < n; i++ )
+                mod_ptr->pg2rec[first + i] = recid;
+
+            return kexec_mod_start + PFN_PHYS(first);
+        }
+
+        if ( mod_ptr->pg2rec[i] != KEXECMOD_PG_FREE )
+            first = i + 1;
+    }
+
+    printk("Kexec module out of memory\n");
+    BUG();
+}
+
+void kexec_free_mod_pages(unsigned int recid, unsigned long addr,
+                          unsigned int n)
+{
+    unsigned int s = PHYS_PFN(addr - kexec_mod_start);
+    unsigned int i;
+
+    BUG_ON(addr < kexec_mod_start ||
+           addr + PFN_PHYS(n) > (unsigned long)mod_ptr);
+
+    for ( i = 0; i < n; i++ )
+    {
+        BUG_ON(mod_ptr->pg2rec[s + i] != recid);
+        mod_ptr->pg2rec[s + i] = KEXECMOD_PG_FREE;
+    }
+}
+
+int kexec_find_mod_record(unsigned int start_idx, unsigned int type,
+                          unsigned int *size)
+{
+    unsigned int i;
+
+    for ( i = start_idx; i < mod_ptr->n_records; i++ )
+    {
+        if ( mod_recs[i].type == type )
+        {
+            *size = mod_recs[i].size;
+            return i;
+        }
+    }
+
+    return -ENOENT;
+}
+
+int kexec_add_mod_record(unsigned int type, void *addr, unsigned int size)
+{
+    unsigned int i;
+
+    if ( mod_rec_end + size > (char *)mod_ptr + PAGE_SIZE )
+    {
+        /* TODO: support compressing record space. */
+        printk("Kexec module record space exhausted\n");
+        BUG();
+    }
+
+    for ( i = 0; i < mod_ptr->n_records; i++ )
+    {
+        if ( mod_recs[i].type == KEXECMOD_REC_NONE )
+        {
+            mod_recs[i].offset = mod_rec_end - (char *)mod_ptr;
+            mod_recs[i].type = type;
+            mod_recs[i].size = size;
+            memcpy(mod_rec_end, addr, size);
+            mod_rec_end = mod_rec_end + size;
+
+            return i;
+        }
+    }
+
+    /* TODO: support extending the mod_recs[] table. */
+    printk("Kexec module record table exhausted\n");
+    BUG();
+}
+
+int kexec_upd_mod_record(unsigned int idx, unsigned int type,
+                         void *addr, unsigned int size)
+{
+    if ( idx >= mod_ptr->n_records )
+        return -ENOENT;
+
+    if ( mod_recs[idx].type != type || mod_recs[idx].size != size )
+        return -EINVAL;
+
+    memcpy((char *)mod_ptr + mod_recs[idx].offset, addr, size);
+
+    return 0;
+}
+
+int kexec_read_mod_record(unsigned int idx, void *addr, unsigned int size)
+{
+    if ( idx >= mod_ptr->n_records )
+        return -ENOENT;
+
+    if ( mod_recs[idx].size != size )
+        return -EINVAL;
+
+    memcpy(addr, (char *)mod_ptr + mod_recs[idx].offset, size);
+
+    return 0;
+}
-- 
2.43.0


