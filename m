Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EBF693913D
	for <lists+xen-devel@lfdr.de>; Mon, 22 Jul 2024 17:02:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.762122.1172261 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sVuY3-0001K0-1G; Mon, 22 Jul 2024 15:01:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 762122.1172261; Mon, 22 Jul 2024 15:01:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sVuY2-0001HD-Tj; Mon, 22 Jul 2024 15:01:58 +0000
Received: by outflank-mailman (input) for mailman id 762122;
 Mon, 22 Jul 2024 15:01:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=JAiy=OW=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1sVuY1-0000sY-RX
 for xen-devel@lists.xenproject.org; Mon, 22 Jul 2024 15:01:57 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 56594ce2-483b-11ef-bbfe-fd08da9f4363;
 Mon, 22 Jul 2024 17:01:56 +0200 (CEST)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id DE9B521B50;
 Mon, 22 Jul 2024 15:01:55 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id AE64F136A9;
 Mon, 22 Jul 2024 15:01:55 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id L4IbKWN0nmabVgAAD6G6ig
 (envelope-from <jgross@suse.com>); Mon, 22 Jul 2024 15:01:55 +0000
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
X-Inumbo-ID: 56594ce2-483b-11ef-bbfe-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1721660515; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nksZ0M2mk6k6WRsqSkuDpYdF4fiT+vkR2yJNQYWtE/8=;
	b=YREmH+Mn5wP1P6us2hwl6Rp6fdztSzc10p1q2IUVtZY0LxLw2v08cEuVdkBjyHZbK1+0Xc
	htgyQbjr7A2Lcv9yZfZ+g3K7xk54yrMjFe3CSdJWwiz4X2uvssS83tqEwoMj8AvAU7Zj8y
	+1cCCf5dYaW2JtSSa7QMfhb5vkNvQLw=
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1721660515; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nksZ0M2mk6k6WRsqSkuDpYdF4fiT+vkR2yJNQYWtE/8=;
	b=YREmH+Mn5wP1P6us2hwl6Rp6fdztSzc10p1q2IUVtZY0LxLw2v08cEuVdkBjyHZbK1+0Xc
	htgyQbjr7A2Lcv9yZfZ+g3K7xk54yrMjFe3CSdJWwiz4X2uvssS83tqEwoMj8AvAU7Zj8y
	+1cCCf5dYaW2JtSSa7QMfhb5vkNvQLw=
From: Juergen Gross <jgross@suse.com>
To: minios-devel@lists.xenproject.org,
	xen-devel@lists.xenproject.org
Cc: samuel.thibault@ens-lyon.org,
	wl@xen.org,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH 2/4] mini-os: mm: remove not needed struct chunk_tail_st
Date: Mon, 22 Jul 2024 17:01:39 +0200
Message-ID: <20240722150141.31391-3-jgross@suse.com>
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

The struct chunk_tail_st isn't really used other than writing to it.

Remove it in order to simplify the code.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 mm.c | 20 --------------------
 1 file changed, 20 deletions(-)

diff --git a/mm.c b/mm.c
index 1dcd954c..2cc49e94 100644
--- a/mm.c
+++ b/mm.c
@@ -123,7 +123,6 @@ static void map_free(unsigned long first_page, unsigned long nr_pages)
 /* BINARY BUDDY ALLOCATOR */
 
 typedef struct chunk_head_st chunk_head_t;
-typedef struct chunk_tail_st chunk_tail_t;
 
 struct chunk_head_st {
     chunk_head_t  *next;
@@ -131,10 +130,6 @@ struct chunk_head_st {
     int            level;
 };
 
-struct chunk_tail_st {
-    int level;
-};
-
 /* Linked lists of free chunks of different powers-of-two in size. */
 #define FREELIST_SIZE ((sizeof(void *) << 3) - PAGE_SHIFT)
 static chunk_head_t *free_head[FREELIST_SIZE];
@@ -151,7 +146,6 @@ static void init_page_allocator(unsigned long min, unsigned long max)
     unsigned long range;
     unsigned long r_min, r_max;
     chunk_head_t *ch;
-    chunk_tail_t *ct;
 
     printk("MM: Initialise page allocator for %lx(%lx)-%lx(%lx)\n",
            (u_long)to_virt(min), min, (u_long)to_virt(max), max);
@@ -215,14 +209,12 @@ static void init_page_allocator(unsigned long min, unsigned long max)
             ch = (chunk_head_t *)r_min;
             r_min += 1UL << i;
             range -= 1UL << i;
-            ct = (chunk_tail_t *)r_min - 1;
             i -= PAGE_SHIFT;
             ch->level       = i;
             ch->next        = free_head[i];
             ch->pprev       = &free_head[i];
             ch->next->pprev = &ch->next;
             free_head[i]    = ch;
-            ct->level       = i;
         }
     }
 
@@ -234,7 +226,6 @@ unsigned long alloc_pages(int order)
 {
     int i;
     chunk_head_t *alloc_ch, *spare_ch;
-    chunk_tail_t            *spare_ct;
 
     if ( !chk_free_pages(1UL << order) )
         goto no_memory;
@@ -261,14 +252,11 @@ unsigned long alloc_pages(int order)
         i--;
         spare_ch = (chunk_head_t *)((char *)alloc_ch +
                                     (1UL << (i + PAGE_SHIFT)));
-        spare_ct = (chunk_tail_t *)((char *)spare_ch +
-                                    (1UL << (i + PAGE_SHIFT))) - 1;
 
         /* Create new header for spare chunk. */
         spare_ch->level = i;
         spare_ch->next  = free_head[i];
         spare_ch->pprev = &free_head[i];
-        spare_ct->level = i;
 
         /* Link in the spare chunk. */
         spare_ch->next->pprev = &spare_ch->next;
@@ -289,7 +277,6 @@ EXPORT_SYMBOL(alloc_pages);
 void free_pages(void *pointer, int order)
 {
     chunk_head_t *freed_ch, *to_merge_ch;
-    chunk_tail_t *freed_ct;
     unsigned long mask;
 
     /* First free the chunk */
@@ -297,8 +284,6 @@ void free_pages(void *pointer, int order)
 
     /* Create free chunk */
     freed_ch = (chunk_head_t *)pointer;
-    freed_ct = (chunk_tail_t *)((char *)pointer +
-                                (1UL << (order + PAGE_SHIFT))) - 1;
 
     /* Now, possibly we can conseal chunks together */
     while ( order < FREELIST_SIZE )
@@ -320,9 +305,6 @@ void free_pages(void *pointer, int order)
             if ( allocated_in_map(virt_to_pfn(to_merge_ch)) ||
                  to_merge_ch->level != order )
                 break;
-
-            /* Merge with successor */
-            freed_ct = (chunk_tail_t *)((char *)to_merge_ch + mask) - 1;
         }
 
         /* We are committed to merging, unlink the chunk */
@@ -336,8 +318,6 @@ void free_pages(void *pointer, int order)
     freed_ch->level = order;
     freed_ch->next  = free_head[order];
     freed_ch->pprev = &free_head[order];
-    freed_ct->level = order;
-
     freed_ch->next->pprev = &freed_ch->next;
     free_head[order] = freed_ch;
 
-- 
2.43.0


