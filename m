Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 65CDDADAB1C
	for <lists+xen-devel@lfdr.de>; Mon, 16 Jun 2025 10:51:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1016973.1393993 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uR5YK-0005UN-IR; Mon, 16 Jun 2025 08:50:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1016973.1393993; Mon, 16 Jun 2025 08:50:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uR5YK-0005P1-CI; Mon, 16 Jun 2025 08:50:52 +0000
Received: by outflank-mailman (input) for mailman id 1016973;
 Mon, 16 Jun 2025 08:50:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=GKzt=Y7=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1uR5Ub-0007jR-Qo
 for xen-devel@lists.xenproject.org; Mon, 16 Jun 2025 08:47:01 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de
 [2a07:de40:b251:101:10:150:64:1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 78390ead-4a8e-11f0-a309-13f23c93f187;
 Mon, 16 Jun 2025 10:47:01 +0200 (CEST)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id E98762118C;
 Mon, 16 Jun 2025 08:47:00 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id AFA83139E2;
 Mon, 16 Jun 2025 08:47:00 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id sb9uKQTaT2ghQAAAD6G6ig
 (envelope-from <jgross@suse.com>); Mon, 16 Jun 2025 08:47:00 +0000
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
X-Inumbo-ID: 78390ead-4a8e-11f0-a309-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1750063621; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fyowQBL0+KxczJ3QgQBuNM66VYPd6WBeOp+F4jmgKk4=;
	b=cNJEHyikb9mt/7zsAQCnic9WNs6aNvWlVAo7gh5Foz8ylwwofNgGRJQdVwjOub6o+3afV2
	cfGHzesavDEPiFkJ+yu4RECAegYAu34Qavlgc0B6rpoWQ8EO/SgPi2t/NY8pGVUDmacdaF
	H2v2SEOHo8FR17XTiSMsAvqz0hUIzDQ=
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1750063620; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fyowQBL0+KxczJ3QgQBuNM66VYPd6WBeOp+F4jmgKk4=;
	b=b8TE957bRIDX2dKj2D4qCqXjot6zF2lhHmjCjRiwyB9XpopFzubXSiXK8jpJthg5yFsgrA
	yHw/6RvRm5L75cgVyPPBpVKIpW/tNqKH6H/6o1Ct0d25D+ny7ImtKuSfGrDwA+OnZ6JyvK
	aJvjIyol4usendyS26lfrJa4TZf3ii0=
From: Juergen Gross <jgross@suse.com>
To: minios-devel@lists.xenproject.org,
	xen-devel@lists.xenproject.org
Cc: samuel.thibault@ens-lyon.org,
	Juergen Gross <jgross@suse.com>,
	Jason Andryuk <jason.andryuk@amd.com>
Subject: [MINI-OS PATCH v2 07/12] mini-os: kexec: build parameters for new kernel
Date: Mon, 16 Jun 2025 10:46:14 +0200
Message-ID: <20250616084619.11112-8-jgross@suse.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250616084619.11112-1-jgross@suse.com>
References: <20250616084619.11112-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
	DKIM_SIGNED(0.00)[suse.com:s=susede1];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,suse.com:mid,imap1.dmz-prg2.suse.org:helo,amd.com:email]
X-Spam-Level: 
X-Spam-Flag: NO
X-Spam-Score: -2.80

Build the parameters for the new kernel, consisting of the
hvm_start_info struct, the memory map and the command line.

Signed-off-by: Juergen Gross <jgross@suse.com>
Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>
---
 arch/x86/kexec.c | 58 ++++++++++++++++++++++++++++++++++++++++++++++++
 include/kexec.h  |  4 ++++
 kexec.c          | 13 ++++++++++-
 3 files changed, 74 insertions(+), 1 deletion(-)

diff --git a/arch/x86/kexec.c b/arch/x86/kexec.c
index 47830905..fc58473e 100644
--- a/arch/x86/kexec.c
+++ b/arch/x86/kexec.c
@@ -199,6 +199,7 @@ bool kexec_arch_need_analyze_shdrs(void)
 
 static unsigned long kexec_param_loc;
 static unsigned int kexec_param_size;
+static unsigned long kexec_param_mem;
 
 void kexec_set_param_loc(const char *cmdline)
 {
@@ -211,4 +212,61 @@ void kexec_set_param_loc(const char *cmdline)
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
+    if ( kernel_phys_entry == ~0UL )
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
+    if ( kexec_add_action(KEXEC_CALL, (void *)kernel_phys_entry,
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
index 1a90d8ab..e762fbeb 100644
--- a/kexec.c
+++ b/kexec.c
@@ -176,10 +176,21 @@ int kexec(void *kernel, unsigned long kernel_size, const char *cmdline)
 
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


