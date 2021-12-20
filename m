Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A230047B0E0
	for <lists+xen-devel@lfdr.de>; Mon, 20 Dec 2021 17:07:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.249855.430286 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mzLCA-0005xG-D9; Mon, 20 Dec 2021 16:07:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 249855.430286; Mon, 20 Dec 2021 16:07:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mzLCA-0005so-5l; Mon, 20 Dec 2021 16:07:26 +0000
Received: by outflank-mailman (input) for mailman id 249855;
 Mon, 20 Dec 2021 16:07:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=DqEV=RF=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1mzLC7-00055x-LQ
 for xen-devel@lists.xenproject.org; Mon, 20 Dec 2021 16:07:23 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e8f9097a-61ae-11ec-9e60-abaf8a552007;
 Mon, 20 Dec 2021 17:07:21 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 2F11D1F3B0;
 Mon, 20 Dec 2021 16:07:20 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 026CA13D6B;
 Mon, 20 Dec 2021 16:07:19 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id eIh+OjeqwGEUTAAAMHmgww
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
X-Inumbo-ID: e8f9097a-61ae-11ec-9e60-abaf8a552007
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1640016440; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0KigAZz9hYluMyaBKPARA/gJpt6ihPK6ZX8SoZiA/8c=;
	b=BGZCu+VhIL6E6RPcvOccUnBg36tJGuE8MKAUkblyrPPxIhFgMUC38Vgxam65yTOA/6etGK
	1FUXdp7oY5jJHkWxYtQhUDTxHM39/P+EDR++VaRNe4xOm49JXsEe9ojD4wWqCTrJmz3XsL
	+rS9zMb5p5OENE6OL0+w6RPfCDe3EvY=
From: Juergen Gross <jgross@suse.com>
To: minios-devel@lists.xenproject.org,
	xen-devel@lists.xenproject.org
Cc: samuel.thibault@ens-lyon.org,
	wl@xen.org,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH v2 06/10] mini-os: add memory map service functions
Date: Mon, 20 Dec 2021 17:07:12 +0100
Message-Id: <20211220160716.4159-7-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20211220160716.4159-1-jgross@suse.com>
References: <20211220160716.4159-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add two functions for adding reserved areas to the memory map and
for removing them again.

Those will be needed for proper grant table/mapping support in PVH
mode.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
V2:
- fix e820_put_reserved_pfns() (Samuel Thibault)
---
 e820.c         | 50 ++++++++++++++++++++++++++++++++++++++++++++++++++
 include/e820.h |  4 ++++
 2 files changed, 54 insertions(+)

diff --git a/e820.c b/e820.c
index 659f71c..25e2f9d 100644
--- a/e820.c
+++ b/e820.c
@@ -283,6 +283,56 @@ void arch_print_memmap(void)
         printk("%012lx-%012lx: %s\n", from, to, type);
     }
 }
+
+unsigned long e820_get_reserved_pfns(int pages)
+{
+    int i;
+    unsigned long last = 0, needed = (long)pages << PAGE_SHIFT;
+
+    for ( i = 0; i < e820_entries && e820_map[i].addr < last + needed; i++ )
+        last = e820_map[i].addr + e820_map[i].size;
+
+    if ( i == 0 || e820_map[i - 1].type != E820_RESERVED )
+        e820_insert_entry_at(i, last, needed, E820_RESERVED);
+    else
+        e820_map[i - 1].size += needed;
+
+    return last >> PAGE_SHIFT;
+}
+
+void e820_put_reserved_pfns(unsigned long start_pfn, int pages)
+{
+    int i;
+    unsigned long addr = start_pfn << PAGE_SHIFT;
+    unsigned long size = (long)pages << PAGE_SHIFT;
+
+    for ( i = 0;
+          i < e820_entries && addr >= e820_map[i].addr + e820_map[i].size;
+          i++ );
+
+    BUG_ON(i == e820_entries || e820_map[i].type != E820_RESERVED ||
+           addr + size > e820_map[i].addr + e820_map[i].size);
+
+    if ( addr == e820_map[i].addr )
+    {
+        e820_map[i].addr += size;
+        e820_map[i].size -= size;
+        if ( e820_map[i].size == 0 )
+            e820_remove_entry(i);
+        return;
+    }
+
+    if ( addr + size == e820_map[i].addr + e820_map[i].size )
+    {
+        e820_map[i].size -= size;
+        return;
+    }
+
+    e820_insert_entry_at(i + 1, addr + size,
+                         e820_map[i].addr + e820_map[i].size - addr - size,
+                         E820_RESERVED);
+    e820_map[i].size = addr - e820_map[i].addr;
+}
 #endif
 
 unsigned long e820_get_maxpfn(unsigned long pages)
diff --git a/include/e820.h b/include/e820.h
index 8d4d371..aaf2f2c 100644
--- a/include/e820.h
+++ b/include/e820.h
@@ -51,5 +51,9 @@ extern unsigned e820_entries;
 
 unsigned long e820_get_maxpfn(unsigned long pages);
 unsigned long e820_get_max_contig_pages(unsigned long pfn, unsigned long pages);
+#ifndef CONFIG_E820_TRIVIAL
+unsigned long e820_get_reserved_pfns(int pages);
+void e820_put_reserved_pfns(unsigned long start_pfn, int pages);
+#endif
 
 #endif /*__E820_HEADER*/
-- 
2.26.2


