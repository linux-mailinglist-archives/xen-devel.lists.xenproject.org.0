Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BD26ADAB0F
	for <lists+xen-devel@lfdr.de>; Mon, 16 Jun 2025 10:47:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1016904.1393919 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uR5UU-0001Ec-Nb; Mon, 16 Jun 2025 08:46:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1016904.1393919; Mon, 16 Jun 2025 08:46:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uR5UU-00019c-J4; Mon, 16 Jun 2025 08:46:54 +0000
Received: by outflank-mailman (input) for mailman id 1016904;
 Mon, 16 Jun 2025 08:46:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=GKzt=Y7=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1uR5US-0007hV-FO
 for xen-devel@lists.xenproject.org; Mon, 16 Jun 2025 08:46:52 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de
 [2a07:de40:b251:101:10:150:64:1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 717beb00-4a8e-11f0-b894-0df219b8e170;
 Mon, 16 Jun 2025 10:46:50 +0200 (CEST)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id A853821203;
 Mon, 16 Jun 2025 08:46:49 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 6FD76139E2;
 Mon, 16 Jun 2025 08:46:49 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id Q1epGfnZT2gPQAAAD6G6ig
 (envelope-from <jgross@suse.com>); Mon, 16 Jun 2025 08:46:49 +0000
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
X-Inumbo-ID: 717beb00-4a8e-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1750063609; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Har4IwtPYyYJZu4D6gPZgpdZMuGaRz2PoPDisbs0FwU=;
	b=R83igbw1tj3VZ1xHwp86+zoOf0BMddI5D3JZHdZeQTL9irr1tyP2PmLv+pjUfRSF/FhnSE
	U1w7DJTaaiZJCk1CKBQYvYrzGDVxz/Ij32KRmJWHwvGtDa7lxZVHloBAatywys8KVMCzES
	hRF8oHhdtnxhXPX64tfCoFA/+9Ul5n0=
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1750063609; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Har4IwtPYyYJZu4D6gPZgpdZMuGaRz2PoPDisbs0FwU=;
	b=R83igbw1tj3VZ1xHwp86+zoOf0BMddI5D3JZHdZeQTL9irr1tyP2PmLv+pjUfRSF/FhnSE
	U1w7DJTaaiZJCk1CKBQYvYrzGDVxz/Ij32KRmJWHwvGtDa7lxZVHloBAatywys8KVMCzES
	hRF8oHhdtnxhXPX64tfCoFA/+9Ul5n0=
From: Juergen Gross <jgross@suse.com>
To: minios-devel@lists.xenproject.org,
	xen-devel@lists.xenproject.org
Cc: samuel.thibault@ens-lyon.org,
	Juergen Gross <jgross@suse.com>,
	Jason Andryuk <jason.andryuk@amd.com>
Subject: [MINI-OS PATCH v2 05/12] mini-os: kexec: finalize parameter location and size
Date: Mon, 16 Jun 2025 10:46:12 +0200
Message-ID: <20250616084619.11112-6-jgross@suse.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250616084619.11112-1-jgross@suse.com>
References: <20250616084619.11112-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-2.80 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-0.999];
	MIME_GOOD(-0.10)[text/plain];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	DKIM_SIGNED(0.00)[suse.com:s=susede1];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:email,imap1.dmz-prg2.suse.org:helo,suse.com:email,suse.com:mid];
	RCVD_TLS_ALL(0.00)[]
X-Spam-Level: 
X-Spam-Flag: NO
X-Spam-Score: -2.80

Finalize the location and the size of the parameters for the new
kernel. This is needed in order to avoid allocating new memory in the
area occupied by the new kernel and parameters.

Signed-off-by: Juergen Gross <jgross@suse.com>
Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>
---
 arch/x86/kexec.c | 15 +++++++++++++++
 include/kexec.h  |  3 +++
 kexec.c          |  2 ++
 3 files changed, 20 insertions(+)

diff --git a/arch/x86/kexec.c b/arch/x86/kexec.c
index 736ca1bf..47830905 100644
--- a/arch/x86/kexec.c
+++ b/arch/x86/kexec.c
@@ -196,4 +196,19 @@ bool kexec_arch_need_analyze_shdrs(void)
 {
     return kernel_phys_entry == ~0UL;
 }
+
+static unsigned long kexec_param_loc;
+static unsigned int kexec_param_size;
+
+void kexec_set_param_loc(const char *cmdline)
+{
+    kexec_param_size = sizeof(struct hvm_start_info);
+    kexec_param_size += e820_entries * sizeof(struct hvm_memmap_table_entry);
+    kexec_param_size += strlen(cmdline) + 1;
+
+    kexec_last_addr = (kexec_last_addr + 7) & ~7UL;
+    kexec_param_loc = kexec_last_addr;
+    kexec_last_addr += kexec_param_size;
+    kexec_last_addr = round_pgup(kexec_last_addr);
+}
 #endif /* CONFIG_KEXEC */
diff --git a/include/kexec.h b/include/kexec.h
index f54cbb90..8a2b552f 100644
--- a/include/kexec.h
+++ b/include/kexec.h
@@ -42,4 +42,7 @@ int kexec_arch_analyze_phdr(elf_ehdr *ehdr, elf_phdr *phdr);
 int kexec_arch_analyze_shdr(elf_ehdr *ehdr, elf_shdr *shdr);
 bool kexec_arch_need_analyze_shdrs(void);
 
+/* Finalize parameter location and size. */
+void kexec_set_param_loc(const char *cmdline);
+
 #endif /* _KEXEC_H */
diff --git a/kexec.c b/kexec.c
index 7c0e6377..31839382 100644
--- a/kexec.c
+++ b/kexec.c
@@ -172,6 +172,8 @@ int kexec(void *kernel, unsigned long kernel_size, const char *cmdline)
     if ( ret )
         return ret;
 
+    kexec_set_param_loc(cmdline);
+
     return ENOSYS;
 }
 EXPORT_SYMBOL(kexec);
-- 
2.43.0


