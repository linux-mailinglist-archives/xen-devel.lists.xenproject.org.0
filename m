Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 65AA947B0E3
	for <lists+xen-devel@lfdr.de>; Mon, 20 Dec 2021 17:07:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.249861.430319 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mzLCD-0006a3-KR; Mon, 20 Dec 2021 16:07:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 249861.430319; Mon, 20 Dec 2021 16:07:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mzLCD-0006RZ-4x; Mon, 20 Dec 2021 16:07:29 +0000
Received: by outflank-mailman (input) for mailman id 249861;
 Mon, 20 Dec 2021 16:07:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=DqEV=RF=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1mzLCA-00055x-M5
 for xen-devel@lists.xenproject.org; Mon, 20 Dec 2021 16:07:26 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e882fae1-61ae-11ec-9e60-abaf8a552007;
 Mon, 20 Dec 2021 17:07:21 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 5C6E21F3A2;
 Mon, 20 Dec 2021 16:07:19 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 2EBAC13D6B;
 Mon, 20 Dec 2021 16:07:19 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id QLsnCjeqwGEUTAAAMHmgww
 (envelope-from <jgross@suse.com>); Mon, 20 Dec 2021 16:07:19 +0000
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
X-Inumbo-ID: e882fae1-61ae-11ec-9e60-abaf8a552007
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1640016439; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Cv003J0xi/p+K/xvrdTTejHNr9Au2kqIdVjkJGzcq9s=;
	b=CKeX6VviJeP816wpS1Rj6o9fD+i+6fsB3sa7bc+GY2FusiNziIREux6JNomUDXC3LDdwcw
	rtyjynefgFUAj3U4HLU/bwGrgKeBEX73nlrF1maMpRt/HxfAH43Um52sEUPxPGS50LoD/Z
	1crt9EVyXV1jnYG4mpdS7w9naF85M+E=
From: Juergen Gross <jgross@suse.com>
To: minios-devel@lists.xenproject.org,
	xen-devel@lists.xenproject.org
Cc: samuel.thibault@ens-lyon.org,
	wl@xen.org,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH v2 02/10] mini-os: sort and sanitize e820 memory map
Date: Mon, 20 Dec 2021 17:07:08 +0100
Message-Id: <20211220160716.4159-3-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20211220160716.4159-1-jgross@suse.com>
References: <20211220160716.4159-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Do some processing of the E820 memory map obtained from the hypervisor:

- align the entries to page boundaries
- sort the entries by their start address
- merge adjacent entries of same type

This is relevant for PVH mode only.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
V2:
- correct page boundary rounding
- handle overlaps after rounding (Samuel Thibault)
- improve sorting (Samuel Thibault)
---
 e820.c | 186 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 186 insertions(+)

diff --git a/e820.c b/e820.c
index 2165280..1770158 100644
--- a/e820.c
+++ b/e820.c
@@ -57,6 +57,190 @@ static char *e820_types[E820_TYPES] = {
     [E820_PMEM]     = "PMEM"
 };
 
+/*
+ * E820 type based bitmask for deciding how to round entries to page
+ * boundaries: A set bit means the type relates to a resource managed by
+ * Mini-OS (e.g. RAM), so rounding needs to be done to only include pages
+ * completely of the related type (narrowing). All other types need to be
+ * rounded to include all pages with parts of that type (widening).
+ */
+#define E820_NARROW ((1U << E820_RAM) | (1U << E820_NVS) | (1 << E820_PMEM))
+
+/* Private type used to mark a range temporarily as reserved (lowest prio). */
+#define E820_TMP_RESERVED    0
+
+static void e820_remove_entry(int idx)
+{
+    int i;
+
+    e820_entries--;
+    for ( i = idx; i < e820_entries; i++ )
+        e820_map[i] = e820_map[i + 1];
+}
+
+static void e820_insert_entry_at(int idx, unsigned long addr,
+                                 unsigned long size, unsigned int type)
+{
+    int i;
+
+    if ( e820_entries == E820_MAX )
+    {
+        xprintk("E820 memory map overflow\n");
+        do_exit();
+    }
+
+    e820_entries++;
+    for ( i = e820_entries - 1; i > idx; i-- )
+        e820_map[i] = e820_map[i - 1];
+
+    e820_map[idx].addr = addr;
+    e820_map[idx].size = size;
+    e820_map[idx].type = type;
+}
+
+static void e820_insert_entry(unsigned long addr, unsigned long size,
+                              unsigned int type)
+{
+    int i;
+
+    for ( i = 0; i < e820_entries && addr > e820_map[i].addr; i++ );
+
+    e820_insert_entry_at(i, addr, size, type);
+}
+
+static void e820_swap_entries(int idx1, int idx2)
+{
+    struct e820entry entry;
+
+    entry = e820_map[idx1];
+    e820_map[idx1] = e820_map[idx2];
+    e820_map[idx2] = entry;
+}
+
+/*
+ * Do a memory map sanitizing sweep:
+ * - sort the entries by start address
+ * - remove overlaps of entries (higher type value wins)
+ * - merge adjacent entries of same type
+ */
+static void e820_process_entries(void)
+{
+    int i, j;
+    unsigned long end, start;
+    unsigned int type;
+
+    /* Sort entries. */
+    for ( i = 1; i < e820_entries; i++ )
+        for ( j = i; j > 0 && e820_map[j - 1].addr > e820_map[j].addr; j-- )
+            e820_swap_entries(j - 1, j);
+
+    /* Handle overlapping entries (higher type values win). */
+    for ( i = 1; i < e820_entries; i++ )
+    {
+        if ( e820_map[i - 1].addr + e820_map[i - 1].size <= e820_map[i].addr )
+            continue;
+        if ( e820_map[i - 1].addr < e820_map[i].addr )
+        {
+            e820_insert_entry_at(i - 1, e820_map[i - 1].addr,
+                                 e820_map[i].addr - e820_map[i - 1].addr,
+                                 e820_map[i - 1].type);
+            e820_map[i].addr += e820_map[i - 1].size;
+            e820_map[i].size -= e820_map[i - 1].size;
+            i++;
+        }
+        if ( e820_map[i - 1].type < e820_map[i].type )
+            e820_swap_entries(i - 1, i);
+        if ( e820_map[i - 1].size >= e820_map[i].size )
+        {
+            e820_remove_entry(i);
+            i--;
+        }
+        else
+        {
+            start = e820_map[i].addr + e820_map[i - 1].size;
+            end = e820_map[i].addr + e820_map[i].size;
+            type = e820_map[i].type;
+            e820_remove_entry(i);
+            e820_insert_entry(start, end - start, type);
+        }
+    }
+
+    /* Merge adjacent entries. */
+    for ( i = 0; i < e820_entries - 1; i++ )
+    {
+        if ( e820_map[i].type == e820_map[i + 1].type &&
+             e820_map[i].addr + e820_map[i].size >= e820_map[i + 1].addr )
+        {
+            if ( e820_map[i].addr + e820_map[i].size <
+                 e820_map[i + 1].addr + e820_map[i + 1].size )
+            {
+                e820_map[i].size = e820_map[i + 1].addr - e820_map[i].addr +
+                                   e820_map[i + 1].size;
+            }
+            e820_remove_entry(i + 1);
+            i--;
+        }
+    }
+}
+
+/*
+ * Transform memory map into a well sorted map without any overlaps.
+ * - sort map entries by start address
+ * - handle overlaps
+ * - merge adjacent entries of same type (possibly removing boundary in the
+ *   middle of a page)
+ * - trim entries to page boundaries (depending on type either expanding
+ *   the entry or narrowing it down)
+ * - repeat first 3 sanitizing steps
+ * - make remaining temporarily reserved entries permanently reserved
+ */
+static void e820_sanitize(void)
+{
+    int i;
+    unsigned long end, start;
+
+    /* Sanitize memory map in current form. */
+    e820_process_entries();
+
+    /* Adjust map entries to page boundaries. */
+    for ( i = 0; i < e820_entries; i++ )
+    {
+        start = e820_map[i].addr;
+        end = start + e820_map[i].size;
+        if ( (1U << e820_map[i].type) & E820_NARROW )
+        {
+            if ( start & (PAGE_SIZE - 1) )
+            {
+                start = round_pgup(start);
+                e820_insert_entry_at(i, start - PAGE_SIZE, PAGE_SIZE,
+                                     E820_TMP_RESERVED);
+                i++;
+            }
+            if ( end & (PAGE_SIZE - 1) )
+            {
+                end = round_pgdown(end);
+                e820_insert_entry_at(i, end, PAGE_SIZE, E820_TMP_RESERVED);
+                i++;
+            }
+        }
+        else
+        {
+            start = round_pgdown(start);
+            end = round_pgup(end);
+        }
+        e820_map[i].addr = start;
+        e820_map[i].size = end - start;
+    }
+
+    /* Sanitize memory map (again). */
+    e820_process_entries();
+
+    /* Make remaining temporarily reserved entries permanently reserved. */
+    for ( i = 0; i < e820_entries; i++ )
+        if ( e820_map[i].type == E820_TMP_RESERVED )
+            e820_map[i].type = E820_RESERVED;
+}
+
 static void e820_get_memmap(void)
 {
     long ret;
@@ -71,6 +255,8 @@ static void e820_get_memmap(void)
         do_exit();
     }
     e820_entries = memmap.nr_entries;
+
+    e820_sanitize();
 }
 
 void arch_print_memmap(void)
-- 
2.26.2


