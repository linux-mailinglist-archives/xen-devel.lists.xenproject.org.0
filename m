Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8315647BC19
	for <lists+xen-devel@lfdr.de>; Tue, 21 Dec 2021 09:47:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.250192.430940 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mzanY-0004vw-FG; Tue, 21 Dec 2021 08:47:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 250192.430940; Tue, 21 Dec 2021 08:47:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mzanX-0004id-W7; Tue, 21 Dec 2021 08:47:03 +0000
Received: by outflank-mailman (input) for mailman id 250192;
 Tue, 21 Dec 2021 08:47:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=rEWG=RG=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1mzanV-0002z5-5i
 for xen-devel@lists.xenproject.org; Tue, 21 Dec 2021 08:47:01 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8c2aae34-623a-11ec-8d39-b1a4ed000e3e;
 Tue, 21 Dec 2021 09:46:54 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 1143521106;
 Tue, 21 Dec 2021 08:46:54 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id CFBDF13BEC;
 Tue, 21 Dec 2021 08:46:53 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id wAh0MX2UwWFHMAAAMHmgww
 (envelope-from <jgross@suse.com>); Tue, 21 Dec 2021 08:46:53 +0000
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
X-Inumbo-ID: 8c2aae34-623a-11ec-8d39-b1a4ed000e3e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1640076414; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2zdQgzlV0Lz7UQXRFdnEwu37UxJwIePFbmpJgrcmrrs=;
	b=km1hd/hcAwn5S/3yJHlr/WcnHQ4YQD+O7shAA5ihsxw4YOGkaPUqTnFZ+crwtIwm/pa0a+
	wZwgjA2zKOf8MpBk9VB+H26114WblOoZrvPI2Bo7fc5+B0xU5hQHNpjYxzeSXnBlMqMlAh
	PVCkjUpQN5ip2Bc6vGMUabWVz7ESYXk=
From: Juergen Gross <jgross@suse.com>
To: minios-devel@lists.xenproject.org,
	xen-devel@lists.xenproject.org
Cc: samuel.thibault@ens-lyon.org,
	wl@xen.org,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH v3 10/10] mini-os: modify grant mappings to work in PVH mode
Date: Tue, 21 Dec 2021 09:46:36 +0100
Message-Id: <20211221084636.6987-11-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20211221084636.6987-1-jgross@suse.com>
References: <20211221084636.6987-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

For being able to use the grant mapping interface in PVH mode some
changes are required, as the guest needs to specify a physical address
in the hypercall interface.

Signed-off-by: Juergen Gross <jgross@suse.com>
Reviewed-by: Samuel Thibault <samuel.thibault@ens-lyon.org>
---
 gntmap.c         | 81 ++++++++++++++++++++++++++++++++++--------------
 include/gntmap.h |  1 +
 2 files changed, 59 insertions(+), 23 deletions(-)

diff --git a/gntmap.c b/gntmap.c
index 7ae8fe6..126b04f 100644
--- a/gntmap.c
+++ b/gntmap.c
@@ -32,6 +32,7 @@
 
 #include <mini-os/os.h>
 #include <mini-os/lib.h>
+#include <mini-os/e820.h>
 #include <mini-os/xmalloc.h>
 #include <errno.h>
 #include <xen/grant_table.h>
@@ -97,11 +98,42 @@ gntmap_set_max_grants(struct gntmap *map, int count)
     if (map->entries == NULL)
         return -ENOMEM;
 
+#ifndef CONFIG_PARAVIRT
+    map->start_pfn = e820_get_reserved_pfns(count);
+#endif
+
     memset(map->entries, 0, sizeof(struct gntmap_entry) * count);
     map->nentries = count;
     return 0;
 }
 
+static int
+_gntmap_unmap_grant_ref(struct gntmap *map, int idx)
+{
+    struct gntmap_entry *entry = map->entries + idx;
+    struct gnttab_unmap_grant_ref op;
+    int rc;
+
+#ifdef CONFIG_PARAVIRT
+    op.host_addr    = (uint64_t) entry->host_addr;
+#else
+    op.host_addr    = (uint64_t)(map->start_pfn + idx) << PAGE_SHIFT;
+#endif
+    op.dev_bus_addr = 0;
+    op.handle       = entry->handle;
+
+    rc = HYPERVISOR_grant_table_op(GNTTABOP_unmap_grant_ref, &op, 1);
+    if (rc != 0 || op.status != GNTST_okay) {
+        printk("GNTTABOP_unmap_grant_ref failed: "
+               "returned %d, status %" PRId16 "\n",
+               rc, op.status);
+        return rc != 0 ? rc : op.status;
+    }
+
+    entry->host_addr = 0;
+    return 0;
+}
+
 static int
 _gntmap_map_grant_ref(struct gntmap *map, int idx,
                       unsigned long host_addr,
@@ -112,10 +144,17 @@ _gntmap_map_grant_ref(struct gntmap *map, int idx,
     struct gntmap_entry *entry = map->entries + idx;
     struct gnttab_map_grant_ref op;
     int rc;
+#ifndef CONFIG_PARAVIRT
+    unsigned long pfn = map->start_pfn + idx;
+#endif
 
     op.ref = (grant_ref_t) ref;
     op.dom = (domid_t) domid;
+#ifdef CONFIG_PARAVIRT
     op.host_addr = (uint64_t) host_addr;
+#else
+    op.host_addr = (uint64_t)pfn << PAGE_SHIFT; 
+#endif
     op.flags = GNTMAP_host_map;
     if (!writable)
         op.flags |= GNTMAP_readonly;
@@ -128,31 +167,18 @@ _gntmap_map_grant_ref(struct gntmap *map, int idx,
         return rc != 0 ? rc : op.status;
     }
 
-    entry->host_addr = host_addr;
-    entry->handle = op.handle;
-    return 0;
-}
-
-static int
-_gntmap_unmap_grant_ref(struct gntmap *map, int idx)
-{
-    struct gntmap_entry *entry = map->entries + idx;
-    struct gnttab_unmap_grant_ref op;
-    int rc;
-
-    op.host_addr    = (uint64_t) entry->host_addr;
-    op.dev_bus_addr = 0;
-    op.handle       = entry->handle;
-
-    rc = HYPERVISOR_grant_table_op(GNTTABOP_unmap_grant_ref, &op, 1);
-    if (rc != 0 || op.status != GNTST_okay) {
-        printk("GNTTABOP_unmap_grant_ref failed: "
-               "returned %d, status %" PRId16 "\n",
-               rc, op.status);
-        return rc != 0 ? rc : op.status;
+#ifndef CONFIG_PARAVIRT
+    rc = do_map_frames(host_addr, &pfn, 1, 0, 0, DOMID_SELF, NULL,
+                       writable ? L1_PROT : L1_PROT_RO);
+    if ( rc )
+    {
+        _gntmap_unmap_grant_ref(map, idx);
+        return rc;
     }
+#endif
 
-    entry->host_addr = 0;
+    entry->host_addr = host_addr;
+    entry->handle = op.handle;
     return 0;
 }
 
@@ -165,6 +191,10 @@ gntmap_munmap(struct gntmap *map, unsigned long start_address, int count)
     DEBUG("(map=%p, start_address=%lx, count=%d)",
            map, start_address, count);
 
+#ifndef CONFIG_PARAVIRT
+    unmap_frames(start_address, count);
+#endif
+
     for (i = 0; i < count; i++) {
         idx = gntmap_find_entry(map, start_address + PAGE_SIZE * i);
         if (idx < 0) {
@@ -242,6 +272,11 @@ gntmap_fini(struct gntmap *map)
             (void) _gntmap_unmap_grant_ref(map, i);
     }
 
+#ifndef CONFIG_PARAVIRT
+    e820_put_reserved_pfns(map->start_pfn, map->nentries);
+    map->start_pfn = 0;
+#endif
+
     xfree(map->entries);
     map->entries = NULL;
     map->nentries = 0;
diff --git a/include/gntmap.h b/include/gntmap.h
index fde53f3..d3d7e88 100644
--- a/include/gntmap.h
+++ b/include/gntmap.h
@@ -10,6 +10,7 @@
 struct gntmap {
     int nentries;
     struct gntmap_entry *entries;
+    unsigned long start_pfn;
 };
 
 int
-- 
2.26.2


