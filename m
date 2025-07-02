Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 32801AF0DC6
	for <lists+xen-devel@lfdr.de>; Wed,  2 Jul 2025 10:21:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1030555.1404300 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uWsij-0003lU-CD; Wed, 02 Jul 2025 08:21:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1030555.1404300; Wed, 02 Jul 2025 08:21:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uWsii-0003fj-UR; Wed, 02 Jul 2025 08:21:32 +0000
Received: by outflank-mailman (input) for mailman id 1030555;
 Wed, 02 Jul 2025 08:21:31 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=KFiP=ZP=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1uWsbL-00082X-Qp
 for xen-devel@lists.xenproject.org; Wed, 02 Jul 2025 08:13:55 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7e2e27b6-571c-11f0-b894-0df219b8e170;
 Wed, 02 Jul 2025 10:13:53 +0200 (CEST)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 70F181F452;
 Wed,  2 Jul 2025 08:13:53 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 46F0C13A24;
 Wed,  2 Jul 2025 08:13:53 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id Yj32D0HqZGhSSQAAD6G6ig
 (envelope-from <jgross@suse.com>); Wed, 02 Jul 2025 08:13:53 +0000
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
X-Inumbo-ID: 7e2e27b6-571c-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1751444033; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=s/i8n5z/NUez13m+U8EQbdRMUJ37I2u8cMr138p+cB8=;
	b=aioiIU2BAhP98zrkqlWpEjTluzk9qUbZo3IbIMGOa5Bjjzr3rN97rZdwC58T3r3cfSAxLq
	NynNOR6iugpm0TAYGCc9rsl9+DPsTX4Y4W/tylV5KE6I9Tq1RAE7UndgNU281iuRS1nmZw
	jY5fpRckGvmJwo+y+Z7hZtR42t41A/c=
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.com header.s=susede1 header.b=aioiIU2B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1751444033; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=s/i8n5z/NUez13m+U8EQbdRMUJ37I2u8cMr138p+cB8=;
	b=aioiIU2BAhP98zrkqlWpEjTluzk9qUbZo3IbIMGOa5Bjjzr3rN97rZdwC58T3r3cfSAxLq
	NynNOR6iugpm0TAYGCc9rsl9+DPsTX4Y4W/tylV5KE6I9Tq1RAE7UndgNU281iuRS1nmZw
	jY5fpRckGvmJwo+y+Z7hZtR42t41A/c=
From: Juergen Gross <jgross@suse.com>
To: minios-devel@lists.xenproject.org,
	xen-devel@lists.xenproject.org
Cc: samuel.thibault@ens-lyon.org,
	Juergen Gross <jgross@suse.com>
Subject: [MINI-OS PATCH 10/19] e820: use special type for software reserved memory
Date: Wed,  2 Jul 2025 10:12:45 +0200
Message-ID: <20250702081254.14383-11-jgross@suse.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250702081254.14383-1-jgross@suse.com>
References: <20250702081254.14383-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.com:dkim,suse.com:mid,suse.com:email];
	RCVD_TLS_ALL(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from,2a07:de40:b281:106:10:150:64:167:received];
	DKIM_SIGNED(0.00)[suse.com:s=susede1];
	RCPT_COUNT_THREE(0.00)[4];
	DKIM_TRACE(0.00)[suse.com:+]
X-Spam-Level: 
X-Spam-Flag: NO
X-Rspamd-Queue-Id: 70F181F452
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Score: -3.01

For memory areas used to map foreign domain memory Mini-OS is using
the type E820_RESERVED in the memory map today. This is causing
problems with kexec, as the new kernel should not see those areas in
the memory map. Unfortunately the sequence of actions for calculating
the size of the memory map and the removal of those reserved areas
can't easily be adjusted to do the removal first, so another way must
be used to avoid passing those reserved areas to the new kernel.

Instead of using the type E820_RESERVED, which might be used for other
pages as well, just use a new type. Areas with that new type can
easily be filtered out when building the memory map for the new
kernel.

Introduce the type E820_TYPE_SOFT_RESERVED with the same value as the
Linux kernel is using for the same purpose.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 arch/x86/kexec.c | 4 +++-
 e820.c           | 8 ++++----
 include/e820.h   | 2 ++
 3 files changed, 9 insertions(+), 5 deletions(-)

diff --git a/arch/x86/kexec.c b/arch/x86/kexec.c
index 3e3b64e2..804e7b6d 100644
--- a/arch/x86/kexec.c
+++ b/arch/x86/kexec.c
@@ -240,14 +240,16 @@ int kexec_get_entry(const char *cmdline)
 
     mmap = next;
     info->memmap_paddr = kexec_param_loc + (unsigned long)next - kexec_param_mem;
-    info->memmap_entries = e820_entries;
     for ( i = 0; i < e820_entries; i++ )
     {
+        if ( e820_map[i].type == E820_TYPE_SOFT_RESERVED )
+            continue;
         mmap->addr = e820_map[i].addr;
         mmap->size = e820_map[i].size;
         mmap->type = e820_map[i].type;
         mmap++;
     }
+    info->memmap_entries = mmap - (struct hvm_memmap_table_entry *)next;
     next = mmap;
 
     info->cmdline_paddr = kexec_param_loc + (unsigned long)next - kexec_param_mem;
diff --git a/e820.c b/e820.c
index 876d55b1..d8cfb1f4 100644
--- a/e820.c
+++ b/e820.c
@@ -367,8 +367,8 @@ unsigned long e820_get_reserved_pfns(int pages)
     for ( i = 0; i < e820_entries && e820_map[i].addr < last + needed; i++ )
         last = e820_map[i].addr + e820_map[i].size;
 
-    if ( i == 0 || e820_map[i - 1].type != E820_RESERVED )
-        e820_insert_entry_at(i, last, needed, E820_RESERVED);
+    if ( i == 0 || e820_map[i - 1].type != E820_TYPE_SOFT_RESERVED )
+        e820_insert_entry_at(i, last, needed, E820_TYPE_SOFT_RESERVED);
     else
         e820_map[i - 1].size += needed;
 
@@ -385,7 +385,7 @@ void e820_put_reserved_pfns(unsigned long start_pfn, int pages)
           i < e820_entries && addr >= e820_map[i].addr + e820_map[i].size;
           i++ );
 
-    BUG_ON(i == e820_entries || e820_map[i].type != E820_RESERVED ||
+    BUG_ON(i == e820_entries || e820_map[i].type != E820_TYPE_SOFT_RESERVED ||
            addr + size > e820_map[i].addr + e820_map[i].size);
 
     if ( addr == e820_map[i].addr )
@@ -405,7 +405,7 @@ void e820_put_reserved_pfns(unsigned long start_pfn, int pages)
 
     e820_insert_entry_at(i + 1, addr + size,
                          e820_map[i].addr + e820_map[i].size - addr - size,
-                         E820_RESERVED);
+                         E820_TYPE_SOFT_RESERVED);
     e820_map[i].size = addr - e820_map[i].addr;
 }
 #endif
diff --git a/include/e820.h b/include/e820.h
index ffa15aa9..ad5657ff 100644
--- a/include/e820.h
+++ b/include/e820.h
@@ -39,6 +39,8 @@
 #define E820_DISABLED     6
 #define E820_PMEM         7
 #define E820_TYPES        8
+/* Memory reserved for Mini-OS internal purpose. */
+#define E820_TYPE_SOFT_RESERVED   0xefffffff
 
 struct __packed e820entry {
     uint64_t addr;
-- 
2.43.0


