Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BB45ADAB22
	for <lists+xen-devel@lfdr.de>; Mon, 16 Jun 2025 10:51:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1016954.1393967 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uR5YF-0004mo-DZ; Mon, 16 Jun 2025 08:50:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1016954.1393967; Mon, 16 Jun 2025 08:50:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uR5YF-0004jU-8f; Mon, 16 Jun 2025 08:50:47 +0000
Received: by outflank-mailman (input) for mailman id 1016954;
 Mon, 16 Jun 2025 08:50:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=GKzt=Y7=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1uR5UX-0007jR-8c
 for xen-devel@lists.xenproject.org; Mon, 16 Jun 2025 08:46:57 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de
 [2a07:de40:b251:101:10:150:64:2])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 74d926bb-4a8e-11f0-a309-13f23c93f187;
 Mon, 16 Jun 2025 10:46:55 +0200 (CEST)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 44EB41F387;
 Mon, 16 Jun 2025 08:46:55 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 16AD3139E2;
 Mon, 16 Jun 2025 08:46:55 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id yj0oBP/ZT2gXQAAAD6G6ig
 (envelope-from <jgross@suse.com>); Mon, 16 Jun 2025 08:46:55 +0000
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
X-Inumbo-ID: 74d926bb-4a8e-11f0-a309-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1750063615; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=t6vErAErnWD/FpLTzRhfE8JqNkLUXRMZRtPqHFEP1P8=;
	b=PHX2IwrcZ/YS5hTfN4yhU5/SXV3c3swS8eEhIhSMQZqnhRtqk9mZy8zfw2KirRigVGNjG+
	8wFtDb/QDlCghYPtOOd9KgwCx1CoXsPR214SgBevfEnowA9fHu+tVL2of+br5uMXGjlWTa
	H3aP2zAp1uGsrnSpfq0FFBfNApMf4Fo=
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1750063615; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=t6vErAErnWD/FpLTzRhfE8JqNkLUXRMZRtPqHFEP1P8=;
	b=PHX2IwrcZ/YS5hTfN4yhU5/SXV3c3swS8eEhIhSMQZqnhRtqk9mZy8zfw2KirRigVGNjG+
	8wFtDb/QDlCghYPtOOd9KgwCx1CoXsPR214SgBevfEnowA9fHu+tVL2of+br5uMXGjlWTa
	H3aP2zAp1uGsrnSpfq0FFBfNApMf4Fo=
From: Juergen Gross <jgross@suse.com>
To: minios-devel@lists.xenproject.org,
	xen-devel@lists.xenproject.org
Cc: samuel.thibault@ens-lyon.org,
	Juergen Gross <jgross@suse.com>,
	Jason Andryuk <jason.andryuk@amd.com>
Subject: [MINI-OS PATCH v2 06/12] mini-os: reserve memory below boundary
Date: Mon, 16 Jun 2025 10:46:13 +0200
Message-ID: <20250616084619.11112-7-jgross@suse.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250616084619.11112-1-jgross@suse.com>
References: <20250616084619.11112-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-2.80 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-0.999];
	MIME_GOOD(-0.10)[text/plain];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_TWO(0.00)[2];
	TO_DN_SOME(0.00)[];
	DKIM_SIGNED(0.00)[suse.com:s=susede1];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,suse.com:mid,amd.com:email,imap1.dmz-prg2.suse.org:helo]
X-Spam-Level: 
X-Spam-Flag: NO
X-Spam-Score: -2.80

In order to support kexec any memory used during copying the new
kernel to its final destination must not overlap with the destination
area.

In order to achieve that add a new interface allowing to mark all
allocatable memory below a specific physical address as not available.

This is done by walking through all chunks of the buddy allocator and
removing the chunks (or chunk parts) below the boundary. The removed
chunks are put into a list in order to be able to undo the operation
in case kexec is failing before doing any unrecoverable system
modifications.

Any pages freed located below the boundary need to go directly into
the list of reserved pages instead of the free pool.

Call the new function from kexec code.

Signed-off-by: Juergen Gross <jgross@suse.com>
Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>
---
 include/mm.h |  5 +++
 kexec.c      |  5 +++
 mm.c         | 89 +++++++++++++++++++++++++++++++++++++++++++++++++++-
 3 files changed, 98 insertions(+), 1 deletion(-)

diff --git a/include/mm.h b/include/mm.h
index 4fc364ff..5775c3e1 100644
--- a/include/mm.h
+++ b/include/mm.h
@@ -57,6 +57,11 @@ unsigned long alloc_pages(int order);
 void free_pages(void *pointer, int order);
 #define free_page(p)    free_pages(p, 0)
 
+#ifdef CONFIG_KEXEC
+void reserve_memory_below(unsigned long boundary);
+void unreserve_memory_below(void);
+#endif
+
 static __inline__ int get_order(unsigned long size)
 {
     int order;
diff --git a/kexec.c b/kexec.c
index 31839382..1a90d8ab 100644
--- a/kexec.c
+++ b/kexec.c
@@ -174,6 +174,11 @@ int kexec(void *kernel, unsigned long kernel_size, const char *cmdline)
 
     kexec_set_param_loc(cmdline);
 
+    reserve_memory_below(kexec_last_addr);
+
+    /* Error exit. */
+    unreserve_memory_below();
+
     return ENOSYS;
 }
 EXPORT_SYMBOL(kexec);
diff --git a/mm.c b/mm.c
index a5d3f5e5..9236db58 100644
--- a/mm.c
+++ b/mm.c
@@ -230,6 +230,84 @@ static void init_page_allocator(unsigned long min, unsigned long max)
     mm_alloc_bitmap_remap();
 }
 
+#ifdef CONFIG_KEXEC
+static chunk_head_t *reserved_chunks;
+static unsigned long boundary_pfn;
+
+static void free_pages_below(void *pointer, unsigned int order)
+{
+    unsigned long pfn_s, pfn;
+    chunk_head_t *ch = pointer;
+
+    pfn_s = virt_to_pfn(ch);
+
+    if ( pfn_s + (1UL << order) <= boundary_pfn )
+    {
+        /* Put complete chunk into reserved list. */
+        ch->level = order;
+        ch->next = reserved_chunks;
+        reserved_chunks = ch;
+    }
+    else
+    {
+        /* Put pages below boundary into reserved list. */
+        for ( pfn = pfn_s; pfn < boundary_pfn; pfn++ )
+        {
+            chunk_head_t *ch_res = pfn_to_virt(pfn);
+
+            ch_res->level = 0;
+            ch_res->next = reserved_chunks;
+            reserved_chunks = ch_res;
+        }
+
+        /* Return pages above boundary to free pool again. */
+        for ( ; pfn < pfn_s + (1UL << order); pfn++ )
+            free_pages(pfn_to_virt(pfn), 0);
+    }
+}
+
+void reserve_memory_below(unsigned long boundary)
+{
+    unsigned long pfn;
+    unsigned int order;
+    chunk_head_t *ch;
+
+    ASSERT(!boundary_pfn);
+    boundary_pfn = PHYS_PFN(boundary);
+
+    for ( order = 0; order < FREELIST_SIZE; order++ )
+    {
+        for ( ch = free_list[order].next; !FREELIST_EMPTY(ch); ch = ch->next )
+        {
+            pfn = virt_to_pfn(ch);
+            if ( pfn >= boundary_pfn )
+                continue;
+
+            /* Dequeue from this level, at least parts will be reserved. */
+            dequeue_elem(ch);
+            /* Mark all as allocated, pieces above boundary will be returned. */
+            map_alloc(pfn, 1UL << ch->level);
+
+            free_pages_below(ch, ch->level);
+        }
+    }
+}
+
+void unreserve_memory_below(void)
+{
+    chunk_head_t *ch;
+
+    boundary_pfn = 0;
+
+    while ( reserved_chunks )
+    {
+        ch = reserved_chunks;
+        reserved_chunks = ch->next;
+        free_pages(ch, ch->level);
+    }
+}
+#endif /* CONFIG_KEXEC */
+
 /* Allocate 2^@order contiguous pages. Returns a VIRTUAL address. */
 unsigned long alloc_pages(int order)
 {
@@ -279,10 +357,19 @@ EXPORT_SYMBOL(alloc_pages);
 void free_pages(void *pointer, int order)
 {
     chunk_head_t *freed_ch, *to_merge_ch;
+    unsigned long pfn = virt_to_pfn(pointer);
     unsigned long mask;
 
+#ifdef CONFIG_KEXEC
+    if ( pfn < boundary_pfn )
+    {
+        free_pages_below(pointer, order);
+        return;
+    }
+#endif
+
     /* First free the chunk */
-    map_free(virt_to_pfn(pointer), 1UL << order);
+    map_free(pfn, 1UL << order);
 
     /* Create free chunk */
     freed_ch = (chunk_head_t *)pointer;
-- 
2.43.0


