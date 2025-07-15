Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 18016B05C4F
	for <lists+xen-devel@lfdr.de>; Tue, 15 Jul 2025 15:30:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1044117.1414242 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ubfjK-0001VT-ES; Tue, 15 Jul 2025 13:29:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1044117.1414242; Tue, 15 Jul 2025 13:29:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ubfjK-0001TR-AP; Tue, 15 Jul 2025 13:29:58 +0000
Received: by outflank-mailman (input) for mailman id 1044117;
 Tue, 15 Jul 2025 13:29:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=7giJ=Z4=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1ubfjI-00013q-A2
 for xen-devel@lists.xenproject.org; Tue, 15 Jul 2025 13:29:56 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cbb70347-617f-11f0-a319-13f23c93f187;
 Tue, 15 Jul 2025 15:29:55 +0200 (CEST)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id BAD741F397;
 Tue, 15 Jul 2025 13:29:53 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 8C37713A68;
 Tue, 15 Jul 2025 13:29:53 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id aVuzINFXdmgRNwAAD6G6ig
 (envelope-from <jgross@suse.com>); Tue, 15 Jul 2025 13:29:53 +0000
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
X-Inumbo-ID: cbb70347-617f-11f0-a319-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1752586193; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lDLoaippG53vLOL0sHnqy7SiZBuEGT4wELxw+HEbbmQ=;
	b=GOF8XqOvO8HKoiA+Kyj4jDiygj8+3WXWB/54GkpnMysYqD0JjxROPKpnWoShEGaddF7mCF
	uxSbnbxiP6Ulde4qejlA8lkDaK2hP4iXqHePy5XzRgou1uzyRWeOrvyCyliuZlxOIh5iOQ
	dEYCLnHS8j5fd6a+NHpyGKIE6aroAgI=
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1752586193; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lDLoaippG53vLOL0sHnqy7SiZBuEGT4wELxw+HEbbmQ=;
	b=GOF8XqOvO8HKoiA+Kyj4jDiygj8+3WXWB/54GkpnMysYqD0JjxROPKpnWoShEGaddF7mCF
	uxSbnbxiP6Ulde4qejlA8lkDaK2hP4iXqHePy5XzRgou1uzyRWeOrvyCyliuZlxOIh5iOQ
	dEYCLnHS8j5fd6a+NHpyGKIE6aroAgI=
From: Juergen Gross <jgross@suse.com>
To: minios-devel@lists.xenproject.org,
	xen-devel@lists.xenproject.org
Cc: samuel.thibault@ens-lyon.org,
	Juergen Gross <jgross@suse.com>,
	Jason Andryuk <jason.andryuk@amd.com>
Subject: [MINI-OS PATCH v2 02/14] kexec: fix physical addresses in start info data
Date: Tue, 15 Jul 2025 15:29:24 +0200
Message-ID: <20250715132936.2798-3-jgross@suse.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250715132936.2798-1-jgross@suse.com>
References: <20250715132936.2798-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spamd-Result: default: False [-2.80 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-0.999];
	MIME_GOOD(-0.10)[text/plain];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.com:email,suse.com:mid,amd.com:email];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	DKIM_SIGNED(0.00)[suse.com:s=susede1];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_TLS_ALL(0.00)[]
X-Spam-Flag: NO
X-Spam-Score: -2.80

The physical addresses in struct hvm_start_info are pointing to the
memory where the data is being built instead of the location where it
will finally be moved to.

Fix that. Additionally rename kexec_param_loc to kexec_param_pa to
better reflect the semantics of the variable.

Fixes: b7994b6409a4 ("mini-os: kexec: build parameters for new kernel")
Signed-off-by: Juergen Gross <jgross@suse.com>
Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>
---
V2:
- rename kexec_param_loc to kexec_param_pa (Jason Andryuk)
---
 arch/x86/kexec.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/x86/kexec.c b/arch/x86/kexec.c
index fc58473e..d0af460d 100644
--- a/arch/x86/kexec.c
+++ b/arch/x86/kexec.c
@@ -197,7 +197,7 @@ bool kexec_arch_need_analyze_shdrs(void)
     return kernel_phys_entry == ~0UL;
 }
 
-static unsigned long kexec_param_loc;
+static unsigned long kexec_param_pa;
 static unsigned int kexec_param_size;
 static unsigned long kexec_param_mem;
 
@@ -208,7 +208,7 @@ void kexec_set_param_loc(const char *cmdline)
     kexec_param_size += strlen(cmdline) + 1;
 
     kexec_last_addr = (kexec_last_addr + 7) & ~7UL;
-    kexec_param_loc = kexec_last_addr;
+    kexec_param_pa = kexec_last_addr;
     kexec_last_addr += kexec_param_size;
     kexec_last_addr = round_pgup(kexec_last_addr);
 }
@@ -233,9 +233,9 @@ int kexec_get_entry(const char *cmdline)
     memset(info, 0, sizeof(*info));
     info->magic = XEN_HVM_START_MAGIC_VALUE;
     info->version = 1;
-    info->cmdline_paddr = kexec_param_mem + sizeof(*info) +
+    info->cmdline_paddr = kexec_param_pa + sizeof(*info) +
                           e820_entries * sizeof(struct hvm_memmap_table_entry);
-    info->memmap_paddr = kexec_param_mem + sizeof(*info);
+    info->memmap_paddr = kexec_param_pa + sizeof(*info);
     info->memmap_entries = e820_entries;
 
     mmap = (struct hvm_memmap_table_entry *)(info + 1);
@@ -249,13 +249,13 @@ int kexec_get_entry(const char *cmdline)
 
     strcpy((char *)mmap, cmdline);
 
-    if ( kexec_add_action(KEXEC_COPY, to_virt(kexec_param_loc), info,
+    if ( kexec_add_action(KEXEC_COPY, to_virt(kexec_param_pa), info,
                           kexec_param_size) )
         return ENOSPC;
 
     /* The call of the new kernel happens via the physical address! */
     if ( kexec_add_action(KEXEC_CALL, (void *)kernel_phys_entry,
-                          (void *)kexec_param_loc, 0) )
+                          (void *)kexec_param_pa, 0) )
         return ENOSPC;
 
     return 0;
-- 
2.43.0


