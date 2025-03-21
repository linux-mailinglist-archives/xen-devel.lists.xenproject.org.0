Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B307AA6B76E
	for <lists+xen-devel@lfdr.de>; Fri, 21 Mar 2025 10:31:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.923601.1327116 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tvYiu-0005rc-5j; Fri, 21 Mar 2025 09:31:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 923601.1327116; Fri, 21 Mar 2025 09:31:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tvYiu-0005oe-1k; Fri, 21 Mar 2025 09:31:28 +0000
Received: by outflank-mailman (input) for mailman id 923601;
 Fri, 21 Mar 2025 09:31:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=1wue=WI=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1tvYd6-0005O8-KR
 for xen-devel@lists.xenproject.org; Fri, 21 Mar 2025 09:25:28 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6d0ecaf8-0636-11f0-9ea1-5ba50f476ded;
 Fri, 21 Mar 2025 10:25:27 +0100 (CET)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 6B06B1FB6B;
 Fri, 21 Mar 2025 09:25:27 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 3F8B4139AA;
 Fri, 21 Mar 2025 09:25:27 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id /TMLDocw3WcrGQAAD6G6ig
 (envelope-from <jgross@suse.com>); Fri, 21 Mar 2025 09:25:27 +0000
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
X-Inumbo-ID: 6d0ecaf8-0636-11f0-9ea1-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1742549127; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nAlkrmGl4CD2FgQ6p1TiH9XT/Lw2GB/CTlhJ+Z/qIes=;
	b=ucu+XUwaJKwhDdvrXJ1uGJw2Z7/vvxmQpFIshVqrXsnV/u/CZfeo67OOHOmzUf1NJmFqjX
	1ZT7sxHhlAnimSgU6qt8yNML8QR15/piuNAQmO68+bpSWO9InahZWxr9MkELS4yWchdFcS
	RLkrJcegzN7Hu85iCPqhveVtE+rDaQU=
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.com header.s=susede1 header.b=ucu+XUwa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1742549127; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nAlkrmGl4CD2FgQ6p1TiH9XT/Lw2GB/CTlhJ+Z/qIes=;
	b=ucu+XUwaJKwhDdvrXJ1uGJw2Z7/vvxmQpFIshVqrXsnV/u/CZfeo67OOHOmzUf1NJmFqjX
	1ZT7sxHhlAnimSgU6qt8yNML8QR15/piuNAQmO68+bpSWO9InahZWxr9MkELS4yWchdFcS
	RLkrJcegzN7Hu85iCPqhveVtE+rDaQU=
From: Juergen Gross <jgross@suse.com>
To: minios-devel@lists.xenproject.org,
	xen-devel@lists.xenproject.org
Cc: samuel.thibault@ens-lyon.org,
	Juergen Gross <jgross@suse.com>
Subject: [MINI-OS PATCH 06/12] kexec: reserve memory below boundary
Date: Fri, 21 Mar 2025 10:24:45 +0100
Message-ID: <20250321092451.17309-7-jgross@suse.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250321092451.17309-1-jgross@suse.com>
References: <20250321092451.17309-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 6B06B1FB6B
X-Spam-Level: 
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
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	FROM_HAS_DN(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,suse.com:dkim,suse.com:mid,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns];
	RCVD_TLS_ALL(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	DKIM_SIGNED(0.00)[suse.com:s=susede1];
	DKIM_TRACE(0.00)[suse.com:+]
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -3.01
X-Spam-Flag: NO

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
index 7e559994..68457711 100644
--- a/kexec.c
+++ b/kexec.c
@@ -175,6 +175,11 @@ int kexec(void *kernel, unsigned long kernel_size, const char *cmdline)
 
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


