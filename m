Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FD5CAF0DC0
	for <lists+xen-devel@lfdr.de>; Wed,  2 Jul 2025 10:21:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1030535.1404271 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uWsiZ-0002UH-5t; Wed, 02 Jul 2025 08:21:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1030535.1404271; Wed, 02 Jul 2025 08:21:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uWsiY-0002N3-Vy; Wed, 02 Jul 2025 08:21:22 +0000
Received: by outflank-mailman (input) for mailman id 1030535;
 Wed, 02 Jul 2025 08:21:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=KFiP=ZP=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1uWsay-00082Y-0n
 for xen-devel@lists.xenproject.org; Wed, 02 Jul 2025 08:13:32 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6fe6f4b7-571c-11f0-a313-13f23c93f187;
 Wed, 02 Jul 2025 10:13:29 +0200 (CEST)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 92FC91F455;
 Wed,  2 Jul 2025 08:13:25 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 69C9113A24;
 Wed,  2 Jul 2025 08:13:25 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id LYdUGCXqZGgXSQAAD6G6ig
 (envelope-from <jgross@suse.com>); Wed, 02 Jul 2025 08:13:25 +0000
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
X-Inumbo-ID: 6fe6f4b7-571c-11f0-a313-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1751444005; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=iaDK/56bpA9CrTIegS7gZq6xQHIKshW7HV6CJUhUJck=;
	b=tR91GiVHHAu6qqBoWTtImiOznLtrDZYh8j3vk+SCrlAHTtoR/OLC6w84DHKi++8OIePwru
	D2uhZdHJLyRfYxGhKYYFL03+ie4Ztd3WGYT/L33XA1y6jl3odQAU57R3PrRHrTfuawt5y4
	qeUgiaP1qq+hbkgA1rE4rkoZaGvjmrM=
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.com header.s=susede1 header.b=tR91GiVH
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1751444005; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=iaDK/56bpA9CrTIegS7gZq6xQHIKshW7HV6CJUhUJck=;
	b=tR91GiVHHAu6qqBoWTtImiOznLtrDZYh8j3vk+SCrlAHTtoR/OLC6w84DHKi++8OIePwru
	D2uhZdHJLyRfYxGhKYYFL03+ie4Ztd3WGYT/L33XA1y6jl3odQAU57R3PrRHrTfuawt5y4
	qeUgiaP1qq+hbkgA1rE4rkoZaGvjmrM=
From: Juergen Gross <jgross@suse.com>
To: minios-devel@lists.xenproject.org,
	xen-devel@lists.xenproject.org
Cc: samuel.thibault@ens-lyon.org,
	Juergen Gross <jgross@suse.com>
Subject: [MINI-OS PATCH 05/19] mm: refactor init_page_allocator()
Date: Wed,  2 Jul 2025 10:12:40 +0200
Message-ID: <20250702081254.14383-6-jgross@suse.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250702081254.14383-1-jgross@suse.com>
References: <20250702081254.14383-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Queue-Id: 92FC91F455
X-Rspamd-Action: no action
X-Spam-Flag: NO
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.com:s=susede1];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCVD_COUNT_TWO(0.00)[2];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	FROM_HAS_DN(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:mid,suse.com:dkim,suse.com:email,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo];
	RCVD_TLS_ALL(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received,2a07:de40:b281:104:10:150:64:97:from];
	DKIM_SIGNED(0.00)[suse.com:s=susede1];
	RCPT_COUNT_THREE(0.00)[4];
	DKIM_TRACE(0.00)[suse.com:+]
X-Spam-Score: -3.01
X-Spam-Level: 

Split init_page_allocator() into three functions in order to prepare
for sparing some memory from being added to the buddy allocator.

Use a function pointer for selecting the function used for handling a
memory range, as this will be needed by a future patch. For the same
reason make iterate_memory_range() globally visible.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 include/mm.h |   3 ++
 mm.c         | 111 +++++++++++++++++++++++++++++----------------------
 2 files changed, 66 insertions(+), 48 deletions(-)

diff --git a/include/mm.h b/include/mm.h
index 0a16d56c..1dc89ddb 100644
--- a/include/mm.h
+++ b/include/mm.h
@@ -95,4 +95,7 @@ void fini_mm(void);
 
 void change_readonly(bool readonly);
 
+void iterate_memory_range(unsigned long min, unsigned long max,
+                          void (*func)(unsigned long, unsigned long));
+
 #endif /* _MM_H_ */
diff --git a/mm.c b/mm.c
index 9236db58..858dc108 100644
--- a/mm.c
+++ b/mm.c
@@ -150,16 +150,74 @@ static void dequeue_elem(chunk_head_t *elem)
     elem->next->prev = elem->prev;
 }
 
+static void add_memory_range(unsigned long r_min, unsigned long r_max)
+{
+    unsigned int i;
+    unsigned long range;
+    chunk_head_t *ch;
+
+    printk("    Adding memory range %lx-%lx\n", r_min, r_max);
+
+    /* The buddy lists are addressed in high memory. */
+    r_min = (unsigned long)to_virt(r_min);
+    r_max = (unsigned long)to_virt(r_max);
+    range = r_max - r_min;
+
+    /* Free up the memory we've been given to play with. */
+    map_free(PHYS_PFN(r_min), range >> PAGE_SHIFT);
+
+    while ( range != 0 )
+    {
+        /*
+         * Next chunk is limited by alignment of min, but also
+         * must not be bigger than remaining range.
+         */
+        for ( i = PAGE_SHIFT; (1UL << (i + 1)) <= range; i++ )
+        {
+            if ( r_min & (1UL << i) )
+                break;
+        }
+
+        ch = (chunk_head_t *)r_min;
+        r_min += 1UL << i;
+        range -= 1UL << i;
+        enqueue_elem(ch, i - PAGE_SHIFT);
+    }
+}
+
+void iterate_memory_range(unsigned long min, unsigned long max,
+                          void (*func)(unsigned long, unsigned long))
+{
+    unsigned int m;
+    unsigned long r_min, r_max;
+
+    for ( m = 0; m < e820_entries; m++ )
+    {
+        if ( e820_map[m].type != E820_RAM )
+            continue;
+        if ( e820_map[m].addr + e820_map[m].size >= ULONG_MAX )
+            BUG();
+
+        r_min = e820_map[m].addr;
+        r_max = r_min + e820_map[m].size;
+        if ( r_max <= min || r_min >= max )
+            continue;
+        if ( r_min < min )
+            r_min = min;
+        if ( r_max > max )
+            r_max = max;
+
+        func(r_min, r_max);
+    }
+}
+
 /*
  * Initialise allocator, placing addresses [@min,@max] in free pool.
  * @min and @max are PHYSICAL addresses.
  */
 static void init_page_allocator(unsigned long min, unsigned long max)
 {
-    int i, m;
-    unsigned long range;
-    unsigned long r_min, r_max;
-    chunk_head_t *ch;
+    int i;
 
     printk("MM: Initialise page allocator for %lx(%lx)-%lx(%lx)\n",
            (u_long)to_virt(min), min, (u_long)to_virt(max), max);
@@ -182,50 +240,7 @@ static void init_page_allocator(unsigned long min, unsigned long max)
     /* All allocated by default. */
     memset(mm_alloc_bitmap, ~0, mm_alloc_bitmap_size);
 
-    for ( m = 0; m < e820_entries; m++ )
-    {
-        if ( e820_map[m].type != E820_RAM )
-            continue;
-        if ( e820_map[m].addr + e820_map[m].size >= ULONG_MAX )
-            BUG();
-
-        r_min = e820_map[m].addr;
-        r_max = r_min + e820_map[m].size;
-        if ( r_max <= min || r_min >= max )
-            continue;
-        if ( r_min < min )
-            r_min = min;
-        if ( r_max > max )
-            r_max = max;
-
-        printk("    Adding memory range %lx-%lx\n", r_min, r_max);
-
-        /* The buddy lists are addressed in high memory. */
-        r_min = (unsigned long)to_virt(r_min);
-        r_max = (unsigned long)to_virt(r_max);
-        range = r_max - r_min;
-
-        /* Free up the memory we've been given to play with. */
-        map_free(PHYS_PFN(r_min), range >> PAGE_SHIFT);
-
-        while ( range != 0 )
-        {
-            /*
-             * Next chunk is limited by alignment of min, but also
-             * must not be bigger than remaining range.
-             */
-            for ( i = PAGE_SHIFT; (1UL << (i + 1)) <= range; i++ )
-            {
-                if ( r_min & (1UL << i) )
-                    break;
-            }
-
-            ch = (chunk_head_t *)r_min;
-            r_min += 1UL << i;
-            range -= 1UL << i;
-            enqueue_elem(ch, i - PAGE_SHIFT);
-        }
-    }
+    iterate_memory_range(min, max, add_memory_range);
 
     mm_alloc_bitmap_remap();
 }
-- 
2.43.0


