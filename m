Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FEC793913E
	for <lists+xen-devel@lfdr.de>; Mon, 22 Jul 2024 17:02:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.762126.1172275 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sVuY9-0001jQ-Cq; Mon, 22 Jul 2024 15:02:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 762126.1172275; Mon, 22 Jul 2024 15:02:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sVuY9-0001ga-7t; Mon, 22 Jul 2024 15:02:05 +0000
Received: by outflank-mailman (input) for mailman id 762126;
 Mon, 22 Jul 2024 15:02:03 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=JAiy=OW=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1sVuY7-0000sY-GC
 for xen-devel@lists.xenproject.org; Mon, 22 Jul 2024 15:02:03 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 59b144a6-483b-11ef-bbfe-fd08da9f4363;
 Mon, 22 Jul 2024 17:02:01 +0200 (CEST)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 8016921B50;
 Mon, 22 Jul 2024 15:02:01 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 4DFA5136A9;
 Mon, 22 Jul 2024 15:02:01 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id l4l4EWl0nmajVgAAD6G6ig
 (envelope-from <jgross@suse.com>); Mon, 22 Jul 2024 15:02:01 +0000
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
X-Inumbo-ID: 59b144a6-483b-11ef-bbfe-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1721660521; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Cqa/twmVM9OR6b9NQWSPmCXSs3PkuPb764GnljYHV8Y=;
	b=OgKluMJAjn+x1h2p8rX38BpdneRC1u+uocS+PBb45If28Gmu2OgYySS68q9x/Xs8eipk/F
	RAUunhH3THxVgBjhRzZ+ncLfszj36N0Zq43lzmHZzJMeGyRy/13uIZtaGFm3/sOGebB5+V
	T+iUSFoPh6ek1YEuCskFxxpVY61Dh9o=
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1721660521; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Cqa/twmVM9OR6b9NQWSPmCXSs3PkuPb764GnljYHV8Y=;
	b=OgKluMJAjn+x1h2p8rX38BpdneRC1u+uocS+PBb45If28Gmu2OgYySS68q9x/Xs8eipk/F
	RAUunhH3THxVgBjhRzZ+ncLfszj36N0Zq43lzmHZzJMeGyRy/13uIZtaGFm3/sOGebB5+V
	T+iUSFoPh6ek1YEuCskFxxpVY61Dh9o=
From: Juergen Gross <jgross@suse.com>
To: minios-devel@lists.xenproject.org,
	xen-devel@lists.xenproject.org
Cc: samuel.thibault@ens-lyon.org,
	wl@xen.org,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH 3/4] mini-os: mm: reduce buddy allocator list administration data
Date: Mon, 22 Jul 2024 17:01:40 +0200
Message-ID: <20240722150141.31391-4-jgross@suse.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240722150141.31391-1-jgross@suse.com>
References: <20240722150141.31391-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Score: -2.60
X-Spamd-Result: default: False [-2.60 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_SIGNED(0.00)[suse.com:s=susede1];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FROM_EQ_ENVFROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_TLS_ALL(0.00)[]
X-Spam-Level: 
X-Spam-Flag: NO

Today the administration data for the buddy allocator's lists consists
of 2 arrays: one pointer array and one list element array for easier
handling of the lists' tails.

Those arrays can be combined into one by dropping the pointer array and
using a different list end indicator.

Add enqueue and dequeue helpers for better readability.

Change the level member type to unsigned int.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 mm.c | 73 ++++++++++++++++++++++++++++--------------------------------
 1 file changed, 34 insertions(+), 39 deletions(-)

diff --git a/mm.c b/mm.c
index 2cc49e94..96686a5c 100644
--- a/mm.c
+++ b/mm.c
@@ -125,16 +125,30 @@ static void map_free(unsigned long first_page, unsigned long nr_pages)
 typedef struct chunk_head_st chunk_head_t;
 
 struct chunk_head_st {
-    chunk_head_t  *next;
-    chunk_head_t **pprev;
-    int            level;
+    chunk_head_t *next;
+    chunk_head_t *prev;
+    unsigned int  level;
 };
 
 /* Linked lists of free chunks of different powers-of-two in size. */
 #define FREELIST_SIZE ((sizeof(void *) << 3) - PAGE_SHIFT)
-static chunk_head_t *free_head[FREELIST_SIZE];
-static chunk_head_t  free_tail[FREELIST_SIZE];
-#define FREELIST_EMPTY(_l) ((_l)->next == NULL)
+static chunk_head_t  free_list[FREELIST_SIZE];
+#define FREELIST_EMPTY(_l) ((_l)->level == FREELIST_SIZE)
+
+static void enqueue_elem(chunk_head_t *elem, unsigned int level)
+{
+    elem->level = level;
+    elem->next = free_list[level].next;
+    elem->prev = &free_list[level];
+    elem->next->prev = elem;
+    free_list[level].next = elem;
+}
+
+static void dequeue_elem(chunk_head_t *elem)
+{
+    elem->prev->next = elem->next;
+    elem->next->prev = elem->prev;
+}
 
 /*
  * Initialise allocator, placing addresses [@min,@max] in free pool.
@@ -151,9 +165,9 @@ static void init_page_allocator(unsigned long min, unsigned long max)
            (u_long)to_virt(min), min, (u_long)to_virt(max), max);
     for ( i = 0; i < FREELIST_SIZE; i++ )
     {
-        free_head[i]       = &free_tail[i];
-        free_tail[i].pprev = &free_head[i];
-        free_tail[i].next  = NULL;
+        free_list[i].next  = &free_list[i];
+        free_list[i].prev  = &free_list[i];
+        free_list[i].level = FREELIST_SIZE;
     }
 
     min = round_pgup(min);
@@ -209,12 +223,7 @@ static void init_page_allocator(unsigned long min, unsigned long max)
             ch = (chunk_head_t *)r_min;
             r_min += 1UL << i;
             range -= 1UL << i;
-            i -= PAGE_SHIFT;
-            ch->level       = i;
-            ch->next        = free_head[i];
-            ch->pprev       = &free_head[i];
-            ch->next->pprev = &ch->next;
-            free_head[i]    = ch;
+            enqueue_elem(ch, i - PAGE_SHIFT);
         }
     }
 
@@ -233,17 +242,16 @@ unsigned long alloc_pages(int order)
     /* Find smallest order which can satisfy the request. */
     for ( i = order; i < FREELIST_SIZE; i++ )
     {
-        if ( !FREELIST_EMPTY(free_head[i]) )
+        if ( !FREELIST_EMPTY(free_list[i].next) )
             break;
     }
 
-    if ( i == FREELIST_SIZE )
+    if ( i >= FREELIST_SIZE )
         goto no_memory;
 
     /* Unlink a chunk. */
-    alloc_ch = free_head[i];
-    free_head[i] = alloc_ch->next;
-    alloc_ch->next->pprev = alloc_ch->pprev;
+    alloc_ch = free_list[i].next;
+    dequeue_elem(alloc_ch);
 
     /* We may have to break the chunk a number of times. */
     while ( i != order )
@@ -254,13 +262,7 @@ unsigned long alloc_pages(int order)
                                     (1UL << (i + PAGE_SHIFT)));
 
         /* Create new header for spare chunk. */
-        spare_ch->level = i;
-        spare_ch->next  = free_head[i];
-        spare_ch->pprev = &free_head[i];
-
-        /* Link in the spare chunk. */
-        spare_ch->next->pprev = &spare_ch->next;
-        free_head[i] = spare_ch;
+        enqueue_elem(spare_ch, i);
     }
 
     map_alloc(PHYS_PFN(to_phys(alloc_ch)), 1UL << order);
@@ -308,18 +310,13 @@ void free_pages(void *pointer, int order)
         }
 
         /* We are committed to merging, unlink the chunk */
-        *(to_merge_ch->pprev) = to_merge_ch->next;
-        to_merge_ch->next->pprev = to_merge_ch->pprev;
+        dequeue_elem(to_merge_ch);
 
         order++;
     }
 
     /* Link the new chunk */
-    freed_ch->level = order;
-    freed_ch->next  = free_head[order];
-    freed_ch->pprev = &free_head[order];
-    freed_ch->next->pprev = &freed_ch->next;
-    free_head[order] = freed_ch;
+    enqueue_elem(freed_ch, order);
 
 }
 EXPORT_SYMBOL(free_pages);
@@ -405,13 +402,11 @@ void sanity_check(void)
 
     for ( x = 0; x < FREELIST_SIZE; x++ )
     {
-        for ( head = free_head[x]; !FREELIST_EMPTY(head); head = head->next )
+        for ( head = free_list[x].next; !FREELIST_EMPTY(head);
+              head = head->next )
         {
             ASSERT(!allocated_in_map(virt_to_pfn(head)));
-            if ( head->next )
-                ASSERT(head->next->pprev == &head->next);
+            ASSERT(head->next->prev == head);
         }
-        if ( free_head[x] )
-            ASSERT(free_head[x]->pprev == &free_head[x]);
     }
 }
-- 
2.43.0


