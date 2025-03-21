Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B085CA6B763
	for <lists+xen-devel@lfdr.de>; Fri, 21 Mar 2025 10:30:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.923511.1327046 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tvYi6-0002Jb-4O; Fri, 21 Mar 2025 09:30:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 923511.1327046; Fri, 21 Mar 2025 09:30:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tvYi5-0002EA-Ug; Fri, 21 Mar 2025 09:30:37 +0000
Received: by outflank-mailman (input) for mailman id 923511;
 Fri, 21 Mar 2025 09:30:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=1wue=WI=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1tvYdG-0005bg-87
 for xen-devel@lists.xenproject.org; Fri, 21 Mar 2025 09:25:38 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7064a262-0636-11f0-9ffa-bf95429c2676;
 Fri, 21 Mar 2025 10:25:33 +0100 (CET)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 0B6241FB6B;
 Fri, 21 Mar 2025 09:25:33 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id D09D6139AA;
 Fri, 21 Mar 2025 09:25:32 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id L3M3MYww3WcvGQAAD6G6ig
 (envelope-from <jgross@suse.com>); Fri, 21 Mar 2025 09:25:32 +0000
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
X-Inumbo-ID: 7064a262-0636-11f0-9ffa-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1742549133; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=s0cAXUGvY2JO8hs7cJ+YxtNj8pT0pZocSXr5L9ANRiA=;
	b=QtBribMyufGB5ILmwzr6caAIVoFJ8uifU4I8dk5hYcJ+b5HF1AbZ1gNeKOvmfgnXIVh+pi
	bi4Fv7jSzJ6L8BMTQIac01o9mZi9obMdQmEexOfhSNhW2DDWAwxat/q3wOsTyQ5HIGlZ/O
	c/NDQDexEZMk7sPqfRLAgcH/7ayr2PA=
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.com header.s=susede1 header.b=QtBribMy
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1742549133; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=s0cAXUGvY2JO8hs7cJ+YxtNj8pT0pZocSXr5L9ANRiA=;
	b=QtBribMyufGB5ILmwzr6caAIVoFJ8uifU4I8dk5hYcJ+b5HF1AbZ1gNeKOvmfgnXIVh+pi
	bi4Fv7jSzJ6L8BMTQIac01o9mZi9obMdQmEexOfhSNhW2DDWAwxat/q3wOsTyQ5HIGlZ/O
	c/NDQDexEZMk7sPqfRLAgcH/7ayr2PA=
From: Juergen Gross <jgross@suse.com>
To: minios-devel@lists.xenproject.org,
	xen-devel@lists.xenproject.org
Cc: samuel.thibault@ens-lyon.org,
	Juergen Gross <jgross@suse.com>
Subject: [MINI-OS PATCH 07/12] kexec: build parameters for new kernel
Date: Fri, 21 Mar 2025 10:24:46 +0100
Message-ID: <20250321092451.17309-8-jgross@suse.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250321092451.17309-1-jgross@suse.com>
References: <20250321092451.17309-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 0B6241FB6B
X-Spam-Score: -3.01
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.com:s=susede1];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	MIME_TRACE(0.00)[0:+];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	TO_DN_SOME(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	FROM_HAS_DN(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.com:dkim,suse.com:mid,suse.com:email];
	RCVD_TLS_ALL(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	DKIM_SIGNED(0.00)[suse.com:s=susede1];
	DKIM_TRACE(0.00)[suse.com:+]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Flag: NO
X-Spam-Level: 

Build the parameters for the new kernel, consisting of the
hvm_start_info struct, the memory map and the command line.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 arch/x86/kexec.c | 58 ++++++++++++++++++++++++++++++++++++++++++++++++
 include/kexec.h  |  4 ++++
 kexec.c          | 13 ++++++++++-
 3 files changed, 74 insertions(+), 1 deletion(-)

diff --git a/arch/x86/kexec.c b/arch/x86/kexec.c
index 98a478d3..6fc7d02d 100644
--- a/arch/x86/kexec.c
+++ b/arch/x86/kexec.c
@@ -200,6 +200,7 @@ bool kexec_arch_need_analyze_shdrs(void)
 
 static unsigned long kexec_param_loc;
 static unsigned int kexec_param_size;
+static unsigned long kexec_param_mem;
 
 void kexec_set_param_loc(const char *cmdline)
 {
@@ -212,4 +213,61 @@ void kexec_set_param_loc(const char *cmdline)
     kexec_last_addr += kexec_param_size;
     kexec_last_addr = round_pgup(kexec_last_addr);
 }
+
+int kexec_get_entry(const char *cmdline)
+{
+    struct hvm_start_info *info;
+    struct hvm_memmap_table_entry *mmap;
+    unsigned int order;
+    unsigned int i;
+
+    if ( kernel_entry == ~0UL )
+        return ENOEXEC;
+
+    order = get_order(kexec_param_size);
+
+    kexec_param_mem = alloc_pages(order);
+    if ( !kexec_param_mem )
+        return ENOMEM;
+
+    info = (struct hvm_start_info *)kexec_param_mem;
+    memset(info, 0, sizeof(*info));
+    info->magic = XEN_HVM_START_MAGIC_VALUE;
+    info->version = 1;
+    info->cmdline_paddr = kexec_param_mem + sizeof(*info) +
+                          e820_entries * sizeof(struct hvm_memmap_table_entry);
+    info->memmap_paddr = kexec_param_mem + sizeof(*info);
+    info->memmap_entries = e820_entries;
+
+    mmap = (struct hvm_memmap_table_entry *)(info + 1);
+    for ( i = 0; i < e820_entries; i++ )
+    {
+        mmap->addr = e820_map[i].addr;
+        mmap->size = e820_map[i].size;
+        mmap->type = e820_map[i].type;
+        mmap++;
+    }
+
+    strcpy((char *)mmap, cmdline);
+
+    if ( kexec_add_action(KEXEC_COPY, to_virt(kexec_param_loc), info,
+                          kexec_param_size) )
+        return ENOSPC;
+
+    /* The call of the new kernel happens via the physical address! */
+    if ( kexec_add_action(KEXEC_CALL, (void *)kernel_entry,
+                          (void *)kexec_param_loc, 0) )
+        return ENOSPC;
+
+    return 0;
+}
+
+void kexec_get_entry_undo(void)
+{
+    if ( kexec_param_mem )
+    {
+        free_pages((void *)kexec_param_mem, get_order(kexec_param_size));
+        kexec_param_mem = 0;
+    }
+}
 #endif /* CONFIG_KEXEC */
diff --git a/include/kexec.h b/include/kexec.h
index 8a2b552f..7b103dea 100644
--- a/include/kexec.h
+++ b/include/kexec.h
@@ -45,4 +45,8 @@ bool kexec_arch_need_analyze_shdrs(void);
 /* Finalize parameter location and size. */
 void kexec_set_param_loc(const char *cmdline);
 
+/* Get entry point and parameter of new kernel. */
+int kexec_get_entry(const char *cmdline);
+void kexec_get_entry_undo(void);
+
 #endif /* _KEXEC_H */
diff --git a/kexec.c b/kexec.c
index 68457711..0ef8eb35 100644
--- a/kexec.c
+++ b/kexec.c
@@ -177,10 +177,21 @@ int kexec(void *kernel, unsigned long kernel_size, const char *cmdline)
 
     reserve_memory_below(kexec_last_addr);
 
+    ret = kexec_get_entry(cmdline);
+    if ( ret )
+    {
+        printk("kexec: ELF file of new kernel has no valid entry point\n");
+        goto err;
+    }
+
     /* Error exit. */
+    ret = ENOSYS;
+
+ err:
     unreserve_memory_below();
+    kexec_get_entry_undo();
 
-    return ENOSYS;
+    return ret;
 }
 EXPORT_SYMBOL(kexec);
 
-- 
2.43.0


