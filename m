Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E1D44690C2
	for <lists+xen-devel@lfdr.de>; Mon,  6 Dec 2021 08:24:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.238646.413651 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mu8Ll-00011g-4C; Mon, 06 Dec 2021 07:23:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 238646.413651; Mon, 06 Dec 2021 07:23:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mu8Lk-0000rp-NM; Mon, 06 Dec 2021 07:23:48 +0000
Received: by outflank-mailman (input) for mailman id 238646;
 Mon, 06 Dec 2021 07:23:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=9VqD=QX=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1mu8Li-0008Mk-PL
 for xen-devel@lists.xenproject.org; Mon, 06 Dec 2021 07:23:46 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6f610693-5665-11ec-8a4d-196798b21f7b;
 Mon, 06 Dec 2021 08:23:41 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 08A651FD5F;
 Mon,  6 Dec 2021 07:23:40 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id D17051330B;
 Mon,  6 Dec 2021 07:23:39 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id +KHPMXu6rWHVdAAAMHmgww
 (envelope-from <jgross@suse.com>); Mon, 06 Dec 2021 07:23:39 +0000
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
X-Inumbo-ID: 6f610693-5665-11ec-8a4d-196798b21f7b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1638775420; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9EBgP/t2UoDrCarm09EUmFu2+s1qFBTeUbKK/KiO/DY=;
	b=BRqj6916g8tEUhYg2upskhF6cz1U43E+S8kWYjh4/UANTdYbnyxixtQ0HloMJ9ZR7FWFOz
	DXxLfY9F/iyeWYFWKluw1kbLFenMDocBRk0rG0hYDlJ3571vIMJADFgot0qLlVzrDxLijz
	Itl0wPxaH91UsJn7gYh4bdUmNigV4iI=
From: Juergen Gross <jgross@suse.com>
To: minios-devel@lists.xenproject.org,
	xen-devel@lists.xenproject.org
Cc: samuel.thibault@ens-lyon.org,
	wl@xen.org,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH 02/10] mini-os: sort and sanitize e820 memory map
Date: Mon,  6 Dec 2021 08:23:29 +0100
Message-Id: <20211206072337.9517-3-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20211206072337.9517-1-jgross@suse.com>
References: <20211206072337.9517-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Do some processing of the E820 memory map obtained from the hypervisor:

- align the entries to page boundaries
- sort the entries by their start address
- merge adjacent entries of same type

This is relevant for PVH mode only.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 e820.c | 56 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 56 insertions(+)

diff --git a/e820.c b/e820.c
index 2165280..336a8b8 100644
--- a/e820.c
+++ b/e820.c
@@ -57,6 +57,60 @@ static char *e820_types[E820_TYPES] = {
     [E820_PMEM]     = "PMEM"
 };
 
+static void e820_remove_entry(int idx)
+{
+    int i;
+
+    e820_entries--;
+    for ( i = idx; i < e820_entries; i++ )
+        e820_map[i] = e820_map[i + 1];
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
+static void e820_sanitize(void)
+{
+    int i;
+    unsigned long end;
+
+    /* Adjust map entries to page boundaries. */
+    for ( i = 0; i < e820_entries; i++ )
+    {
+        end = (e820_map[i].addr + e820_map[i].size + PAGE_SIZE - 1) & PAGE_MASK;
+        e820_map[i].addr &= PAGE_MASK;
+        e820_map[i].size = end - e820_map[i].addr;
+    }
+
+    /* Sort entries by start address. */
+    for ( i = 0; i < e820_entries - 1; i++ )
+    {
+        if ( e820_map[i].addr > e820_map[i + 1].addr )
+        {
+            e820_swap_entries(i, i + 1);
+            i = -1;
+        }
+    }
+
+    /* Merge adjacent entries of same type. */
+    for ( i = 0; i < e820_entries - 1; i++ )
+    {
+        if ( e820_map[i].type == e820_map[i + 1].type &&
+             e820_map[i].addr + e820_map[i].size == e820_map[i + 1].addr )
+        {
+            e820_map[i].size += e820_map[i + 1].size;
+            e820_remove_entry(i + 1);
+            i--;
+        }
+    }
+}
+
 static void e820_get_memmap(void)
 {
     long ret;
@@ -71,6 +125,8 @@ static void e820_get_memmap(void)
         do_exit();
     }
     e820_entries = memmap.nr_entries;
+
+    e820_sanitize();
 }
 
 void arch_print_memmap(void)
-- 
2.26.2


