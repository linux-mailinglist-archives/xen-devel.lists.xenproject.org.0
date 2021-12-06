Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 656974690CB
	for <lists+xen-devel@lfdr.de>; Mon,  6 Dec 2021 08:24:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.238652.413696 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mu8Lq-000210-5u; Mon, 06 Dec 2021 07:23:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 238652.413696; Mon, 06 Dec 2021 07:23:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mu8Lp-0001sz-Ey; Mon, 06 Dec 2021 07:23:53 +0000
Received: by outflank-mailman (input) for mailman id 238652;
 Mon, 06 Dec 2021 07:23:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=9VqD=QX=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1mu8Ll-0008Mk-PV
 for xen-devel@lists.xenproject.org; Mon, 06 Dec 2021 07:23:49 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 702d5e8a-5665-11ec-8a4d-196798b21f7b;
 Mon, 06 Dec 2021 08:23:41 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 67E9A21940;
 Mon,  6 Dec 2021 07:23:41 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 3F43413A9C;
 Mon,  6 Dec 2021 07:23:41 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id eKQ0Dn26rWHVdAAAMHmgww
 (envelope-from <jgross@suse.com>); Mon, 06 Dec 2021 07:23:41 +0000
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
X-Inumbo-ID: 702d5e8a-5665-11ec-8a4d-196798b21f7b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1638775421; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6ZwIQ/iqw4tJOJDbjhXNjxEyNK1FoP/fIru8GNLpj3E=;
	b=Dx4H9mkwe6zA3efQNNiTwU8kUNk9Ej8hkMBKut7osjyQ2cr7rnD6CpIA0Nj0RHtFNQgcyg
	TXfAw58DejxvNQ7ZkIyHrNSxZegZP9MrQRcqoeaTzRwkxZaq5qsws8rpYRbWhG91FY5ejP
	Q0+4ad5Lmp4I657Xw5k2xxfGMqbAuks=
From: Juergen Gross <jgross@suse.com>
To: minios-devel@lists.xenproject.org,
	xen-devel@lists.xenproject.org
Cc: samuel.thibault@ens-lyon.org,
	wl@xen.org,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH 09/10] mini-os: prepare grantmap entry interface for use by PVH mode
Date: Mon,  6 Dec 2021 08:23:36 +0100
Message-Id: <20211206072337.9517-10-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20211206072337.9517-1-jgross@suse.com>
References: <20211206072337.9517-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Instead of passing the pointer of a grantmap entry to the
_gntmap_[un]map_grant_ref() sub-functions use the map pointer and the
entry index instead. This will be needed for PVH mode usage.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 gntmap.c | 48 +++++++++++++++++++++++-------------------------
 1 file changed, 23 insertions(+), 25 deletions(-)

diff --git a/gntmap.c b/gntmap.c
index f6ab3ad..7ae8fe6 100644
--- a/gntmap.c
+++ b/gntmap.c
@@ -55,36 +55,34 @@ struct gntmap_entry {
 };
 
 static inline int
-gntmap_entry_used(struct gntmap_entry *entry)
+gntmap_entry_used(struct gntmap *map, int idx)
 {
-    return entry->host_addr != 0;
+    return map->entries[idx].host_addr != 0;
 }
 
-static struct gntmap_entry*
-gntmap_find_free_entry(struct gntmap *map)
+static int gntmap_find_free_entry(struct gntmap *map)
 {
     int i;
 
     for (i = 0; i < map->nentries; i++) {
-        if (!gntmap_entry_used(&map->entries[i]))
-            return &map->entries[i];
+        if (!gntmap_entry_used(map, i))
+            return i;
     }
 
     DEBUG("(map=%p): all %d entries full",
            map, map->nentries);
-    return NULL;
+    return -1;
 }
 
-static struct gntmap_entry*
-gntmap_find_entry(struct gntmap *map, unsigned long addr)
+static int gntmap_find_entry(struct gntmap *map, unsigned long addr)
 {
     int i;
 
     for (i = 0; i < map->nentries; i++) {
         if (map->entries[i].host_addr == addr)
-            return &map->entries[i];
+            return i;
     }
-    return NULL;
+    return -1;
 }
 
 int
@@ -105,12 +103,13 @@ gntmap_set_max_grants(struct gntmap *map, int count)
 }
 
 static int
-_gntmap_map_grant_ref(struct gntmap_entry *entry, 
+_gntmap_map_grant_ref(struct gntmap *map, int idx,
                       unsigned long host_addr,
                       uint32_t domid,
                       uint32_t ref,
                       int writable)
 {
+    struct gntmap_entry *entry = map->entries + idx;
     struct gnttab_map_grant_ref op;
     int rc;
 
@@ -135,8 +134,9 @@ _gntmap_map_grant_ref(struct gntmap_entry *entry,
 }
 
 static int
-_gntmap_unmap_grant_ref(struct gntmap_entry *entry)
+_gntmap_unmap_grant_ref(struct gntmap *map, int idx)
 {
+    struct gntmap_entry *entry = map->entries + idx;
     struct gnttab_unmap_grant_ref op;
     int rc;
 
@@ -160,19 +160,19 @@ int
 gntmap_munmap(struct gntmap *map, unsigned long start_address, int count)
 {
     int i, rc;
-    struct gntmap_entry *ent;
+    int idx;
 
     DEBUG("(map=%p, start_address=%lx, count=%d)",
            map, start_address, count);
 
     for (i = 0; i < count; i++) {
-        ent = gntmap_find_entry(map, start_address + PAGE_SIZE * i);
-        if (ent == NULL) {
+        idx = gntmap_find_entry(map, start_address + PAGE_SIZE * i);
+        if (idx < 0) {
             printk("gntmap: tried to munmap unknown page\n");
             return -EINVAL;
         }
 
-        rc = _gntmap_unmap_grant_ref(ent);
+        rc = _gntmap_unmap_grant_ref(map, idx);
         if (rc != 0)
             return rc;
     }
@@ -189,7 +189,7 @@ gntmap_map_grant_refs(struct gntmap *map,
                       int writable)
 {
     unsigned long addr;
-    struct gntmap_entry *ent;
+    int idx;
     int i;
 
     DEBUG("(map=%p, count=%" PRIu32 ", "
@@ -206,9 +206,9 @@ gntmap_map_grant_refs(struct gntmap *map,
         return NULL;
 
     for (i = 0; i < count; i++) {
-        ent = gntmap_find_free_entry(map);
-        if (ent == NULL ||
-            _gntmap_map_grant_ref(ent,
+        idx = gntmap_find_free_entry(map);
+        if (idx < 0 ||
+            _gntmap_map_grant_ref(map, idx,
                                   addr + PAGE_SIZE * i,
                                   domids[i * domids_stride],
                                   refs[i],
@@ -233,15 +233,13 @@ gntmap_init(struct gntmap *map)
 void
 gntmap_fini(struct gntmap *map)
 {
-    struct gntmap_entry *ent;
     int i;
 
     DEBUG("(map=%p)", map);
 
     for (i = 0; i < map->nentries; i++) {
-        ent = &map->entries[i];
-        if (gntmap_entry_used(ent))
-            (void) _gntmap_unmap_grant_ref(ent);
+        if (gntmap_entry_used(map, i))
+            (void) _gntmap_unmap_grant_ref(map, i);
     }
 
     xfree(map->entries);
-- 
2.26.2


