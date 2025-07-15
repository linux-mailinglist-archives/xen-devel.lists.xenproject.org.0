Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D3DDBB05C64
	for <lists+xen-devel@lfdr.de>; Tue, 15 Jul 2025 15:30:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1044163.1414280 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ubfk5-0004fC-Am; Tue, 15 Jul 2025 13:30:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1044163.1414280; Tue, 15 Jul 2025 13:30:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ubfk5-0004dh-7S; Tue, 15 Jul 2025 13:30:45 +0000
Received: by outflank-mailman (input) for mailman id 1044163;
 Tue, 15 Jul 2025 13:30:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=7giJ=Z4=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1ubfjX-00013q-GY
 for xen-devel@lists.xenproject.org; Tue, 15 Jul 2025 13:30:11 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de
 [2a07:de40:b251:101:10:150:64:1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d4c7f3c8-617f-11f0-a319-13f23c93f187;
 Tue, 15 Jul 2025 15:30:10 +0200 (CEST)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 8F8BE21204;
 Tue, 15 Jul 2025 13:30:10 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 5510A13A68;
 Tue, 15 Jul 2025 13:30:10 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id q/lCE+JXdmhQNwAAD6G6ig
 (envelope-from <jgross@suse.com>); Tue, 15 Jul 2025 13:30:10 +0000
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
X-Inumbo-ID: d4c7f3c8-617f-11f0-a319-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1752586210; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=B6SWSOlBDneLonJNetlsBzYkrHEyPfegHVWVGLmwK3g=;
	b=HLelBBGxCaT0BsshA7lxY0tl3kEJvM1WhjX8uru6TwIkWutWG+CoCgnwqjAdOyGoYitGny
	Wznbo86UumQa9uiqZIaUsvfbfKeVMiJHCrCqnHHLSb5aCYPghnkxZtLhFcjEaCY2Q/A4t0
	4v9ekTZ5o0uUkhJXkH494RNIXgROmGI=
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1752586210; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=B6SWSOlBDneLonJNetlsBzYkrHEyPfegHVWVGLmwK3g=;
	b=HLelBBGxCaT0BsshA7lxY0tl3kEJvM1WhjX8uru6TwIkWutWG+CoCgnwqjAdOyGoYitGny
	Wznbo86UumQa9uiqZIaUsvfbfKeVMiJHCrCqnHHLSb5aCYPghnkxZtLhFcjEaCY2Q/A4t0
	4v9ekTZ5o0uUkhJXkH494RNIXgROmGI=
From: Juergen Gross <jgross@suse.com>
To: minios-devel@lists.xenproject.org,
	xen-devel@lists.xenproject.org
Cc: samuel.thibault@ens-lyon.org,
	Juergen Gross <jgross@suse.com>,
	Jason Andryuk <jason.andryuk@amd.com>
Subject: [MINI-OS PATCH v2 05/14] e820: use special type for software reserved memory
Date: Tue, 15 Jul 2025 15:29:27 +0200
Message-ID: <20250715132936.2798-6-jgross@suse.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250715132936.2798-1-jgross@suse.com>
References: <20250715132936.2798-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spamd-Result: default: False [-2.80 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-0.999];
	MIME_GOOD(-0.10)[text/plain];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_TWO(0.00)[2];
	TO_DN_SOME(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	DKIM_SIGNED(0.00)[suse.com:s=susede1];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,suse.com:mid,amd.com:email,imap1.dmz-prg2.suse.org:helo]
X-Spam-Flag: NO
X-Spam-Score: -2.80

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
Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>
---
 arch/x86/kexec.c | 4 +++-
 e820.c           | 8 ++++----
 include/e820.h   | 2 ++
 3 files changed, 9 insertions(+), 5 deletions(-)

diff --git a/arch/x86/kexec.c b/arch/x86/kexec.c
index 29f8aa81..b33fbfc1 100644
--- a/arch/x86/kexec.c
+++ b/arch/x86/kexec.c
@@ -240,14 +240,16 @@ int kexec_get_entry(const char *cmdline)
 
     mmap = next;
     info->memmap_paddr = kexec_param_pa + (unsigned long)next - kexec_param_mem;
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
 
     info->cmdline_paddr = kexec_param_pa + (unsigned long)next - kexec_param_mem;
diff --git a/e820.c b/e820.c
index 44cfac05..1ffeaf00 100644
--- a/e820.c
+++ b/e820.c
@@ -367,8 +367,8 @@ unsigned long e820_get_reserved_pfns(int pages)
     for ( i = 0; i < e820_entries && e820_map[i].addr < last + needed; i++ )
         last = round_pgup(e820_map[i].addr + e820_map[i].size);
 
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


