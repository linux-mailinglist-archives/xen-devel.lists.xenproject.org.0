Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A48EA6B734
	for <lists+xen-devel@lfdr.de>; Fri, 21 Mar 2025 10:25:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.923457.1327007 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tvYd2-0007PZ-T1; Fri, 21 Mar 2025 09:25:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 923457.1327007; Fri, 21 Mar 2025 09:25:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tvYd2-0007N8-OT; Fri, 21 Mar 2025 09:25:24 +0000
Received: by outflank-mailman (input) for mailman id 923457;
 Fri, 21 Mar 2025 09:25:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=1wue=WI=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1tvYd1-0005bg-Hv
 for xen-devel@lists.xenproject.org; Fri, 21 Mar 2025 09:25:23 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de
 [2a07:de40:b251:101:10:150:64:2])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 69b0fd85-0636-11f0-9ffa-bf95429c2676;
 Fri, 21 Mar 2025 10:25:22 +0100 (CET)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id CD99C1FB6B;
 Fri, 21 Mar 2025 09:25:21 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 9E025139AA;
 Fri, 21 Mar 2025 09:25:21 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id 3J3kJIEw3WcmGQAAD6G6ig
 (envelope-from <jgross@suse.com>); Fri, 21 Mar 2025 09:25:21 +0000
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
X-Inumbo-ID: 69b0fd85-0636-11f0-9ffa-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1742549121; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=az01uiRxZtSFbNJFwjD4ZM6qRoCac3SGJkFv8ewEX5o=;
	b=eTNNX0m1tYtAi5BKKmCwBN2rP24FpQKgSrmuEPgs6l5tTOSqsceo5LrQL2fOTHfRlM7Bu6
	3KTILh3e01B2TODpq+H7GMxFBTy5HuDzHFSRQ3VQ7EF1OwJ/uPCTmGQnwHEYSPUg4/f2UE
	uk5XR0ybcqN8VWHIK/FHFSWbx2JtP8c=
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1742549121; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=az01uiRxZtSFbNJFwjD4ZM6qRoCac3SGJkFv8ewEX5o=;
	b=eTNNX0m1tYtAi5BKKmCwBN2rP24FpQKgSrmuEPgs6l5tTOSqsceo5LrQL2fOTHfRlM7Bu6
	3KTILh3e01B2TODpq+H7GMxFBTy5HuDzHFSRQ3VQ7EF1OwJ/uPCTmGQnwHEYSPUg4/f2UE
	uk5XR0ybcqN8VWHIK/FHFSWbx2JtP8c=
From: Juergen Gross <jgross@suse.com>
To: minios-devel@lists.xenproject.org,
	xen-devel@lists.xenproject.org
Cc: samuel.thibault@ens-lyon.org,
	Juergen Gross <jgross@suse.com>
Subject: [MINI-OS PATCH 05/12] kexec: finalize parameter location and size
Date: Fri, 21 Mar 2025 10:24:44 +0100
Message-ID: <20250321092451.17309-6-jgross@suse.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250321092451.17309-1-jgross@suse.com>
References: <20250321092451.17309-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Score: -2.80
X-Spamd-Result: default: False [-2.80 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	DKIM_SIGNED(0.00)[suse.com:s=susede1];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.com:mid,suse.com:email];
	RCVD_TLS_ALL(0.00)[]
X-Spam-Flag: NO
X-Spam-Level: 

Finalize the location and the size of the parameters for the new
kernel. This is needed in order to avoid allocating new memory in the
area occupied by the new kernel and parameters.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 arch/x86/kexec.c | 15 +++++++++++++++
 include/kexec.h  |  3 +++
 kexec.c          |  2 ++
 3 files changed, 20 insertions(+)

diff --git a/arch/x86/kexec.c b/arch/x86/kexec.c
index 2069f3c6..98a478d3 100644
--- a/arch/x86/kexec.c
+++ b/arch/x86/kexec.c
@@ -197,4 +197,19 @@ bool kexec_arch_need_analyze_shdrs(void)
 {
     return kernel_entry == ~0UL;
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
index 3ff4ea07..7e559994 100644
--- a/kexec.c
+++ b/kexec.c
@@ -173,6 +173,8 @@ int kexec(void *kernel, unsigned long kernel_size, const char *cmdline)
     if ( ret )
         return ret;
 
+    kexec_set_param_loc(cmdline);
+
     return ENOSYS;
 }
 EXPORT_SYMBOL(kexec);
-- 
2.43.0


