Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 81A9D4690C3
	for <lists+xen-devel@lfdr.de>; Mon,  6 Dec 2021 08:24:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.238650.413684 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mu8Lo-0001f6-E5; Mon, 06 Dec 2021 07:23:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 238650.413684; Mon, 06 Dec 2021 07:23:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mu8Ln-0001UJ-L9; Mon, 06 Dec 2021 07:23:51 +0000
Received: by outflank-mailman (input) for mailman id 238650;
 Mon, 06 Dec 2021 07:23:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=9VqD=QX=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1mu8Lk-0008Mk-PU
 for xen-devel@lists.xenproject.org; Mon, 06 Dec 2021 07:23:48 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6fd34f57-5665-11ec-8a4d-196798b21f7b;
 Mon, 06 Dec 2021 08:23:41 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id CC5DD1FE02;
 Mon,  6 Dec 2021 07:23:40 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id A1AF01330B;
 Mon,  6 Dec 2021 07:23:40 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id KBYtJny6rWHVdAAAMHmgww
 (envelope-from <jgross@suse.com>); Mon, 06 Dec 2021 07:23:40 +0000
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
X-Inumbo-ID: 6fd34f57-5665-11ec-8a4d-196798b21f7b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1638775420; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vd3HZ1Ub/A6C0NepRB2jPIIL8ubajSRfG+DMd9e6lrQ=;
	b=qHWwtj7KcAOcPH8k3zOeliWh+e0spXwxDmmr1q/QVVhN62V4tJBjwiMqJKYRJ1lO6Gi1Ut
	lEgK3mDVN36vJTDIAFV81d5ILR18qUCN5ynObSV6aGi66CVhknpVzLO26jSWGfS0fwO+R+
	06lm+HKOUvMveLFJKNI3h2wtEFwxu/w=
From: Juergen Gross <jgross@suse.com>
To: minios-devel@lists.xenproject.org,
	xen-devel@lists.xenproject.org
Cc: samuel.thibault@ens-lyon.org,
	wl@xen.org,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH 06/10] mini-os: add memory map service functions
Date: Mon,  6 Dec 2021 08:23:33 +0100
Message-Id: <20211206072337.9517-7-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20211206072337.9517-1-jgross@suse.com>
References: <20211206072337.9517-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add two functions for adding reserved areas to the memory map and
for removing them again.

Those will be needed for proper grant table/mapping support in PVH
mode.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 e820.c         | 72 ++++++++++++++++++++++++++++++++++++++++++++++++++
 include/e820.h |  4 +++
 2 files changed, 76 insertions(+)

diff --git a/e820.c b/e820.c
index 50029bb..2888932 100644
--- a/e820.c
+++ b/e820.c
@@ -66,6 +66,21 @@ static void e820_remove_entry(int idx)
         e820_map[i] = e820_map[i + 1];
 }
 
+static void e820_insert_entry(int idx)
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
+}
+
 static void e820_swap_entries(int idx1, int idx2)
 {
     struct e820entry entry;
@@ -153,6 +168,63 @@ void arch_print_memmap(void)
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
+    {
+        e820_insert_entry(i);
+        e820_map[i].addr = last;
+        e820_map[i].size = needed;
+        e820_map[i].type = E820_RESERVED;
+    }
+    else
+    {
+        e820_map[i - 1].size += needed;
+    }
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
+    for ( i = 0; i < e820_entries && addr < e820_map[i].addr; i++ );
+
+    BUG_ON(i == e820_entries || e820_map[i].type != E820_RESERVED);
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
+        e820_map[i].addr = addr;
+        e820_map[i].size = size;
+        return;
+    }
+
+    e820_insert_entry(i + 1);
+    e820_map[i + 1].addr = addr + size;
+    e820_map[i + 1].size = e820_map[i].addr + e820_map[i].size -
+                           e820_map[i + 1].addr;
+    e820_map[i + 1].type = E820_RESERVED;
+    e820_map[i].size = addr - e820_map[i].addr;
+}
 #endif
 
 unsigned long e820_get_maxpfn(unsigned long pages)
diff --git a/include/e820.h b/include/e820.h
index 49daefa..694ce3b 100644
--- a/include/e820.h
+++ b/include/e820.h
@@ -51,5 +51,9 @@ extern unsigned e820_entries;
 
 unsigned long e820_get_maxpfn(unsigned long pages);
 unsigned long e820_get_max_pages(unsigned long pfn, unsigned long pages);
+#ifndef CONFIG_E820_TRIVIAL
+unsigned long e820_get_reserved_pfns(int pages);
+void e820_put_reserved_pfns(unsigned long start_pfn, int pages);
+#endif
 
 #endif /*__E820_HEADER*/
-- 
2.26.2


