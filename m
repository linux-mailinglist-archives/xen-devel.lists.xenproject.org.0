Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 15C41AF0DBB
	for <lists+xen-devel@lfdr.de>; Wed,  2 Jul 2025 10:21:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1030480.1404214 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uWsiD-0007r6-7I; Wed, 02 Jul 2025 08:21:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1030480.1404214; Wed, 02 Jul 2025 08:21:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uWsiC-0007nv-Uk; Wed, 02 Jul 2025 08:21:00 +0000
Received: by outflank-mailman (input) for mailman id 1030480;
 Wed, 02 Jul 2025 08:20:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=KFiP=ZP=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1uWsbK-00082X-QZ
 for xen-devel@lists.xenproject.org; Wed, 02 Jul 2025 08:13:54 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de
 [2a07:de40:b251:101:10:150:64:1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7dded57e-571c-11f0-b894-0df219b8e170;
 Wed, 02 Jul 2025 10:13:53 +0200 (CEST)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id DF39421182;
 Wed,  2 Jul 2025 08:13:47 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id B3D4113A54;
 Wed,  2 Jul 2025 08:13:47 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id BItmKjvqZGhJSQAAD6G6ig
 (envelope-from <jgross@suse.com>); Wed, 02 Jul 2025 08:13:47 +0000
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
X-Inumbo-ID: 7dded57e-571c-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1751444027; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=uwLSYgMVcboUpduICczAWr7hs1RsmqCqfe1jLSr8ytE=;
	b=r7oc77bfmJHkkSzUx4K3TRfIU50j9Jj7KAhiDiExMV+qTsjZIb6ZBdKjecTxEBC5V4fRFa
	ppqgKf36/Ya7m2NvY9rUe5fPaQ5RI892qfK78i4iQvgyq5sFCO3J/bhRll9izfEGLFHxfO
	4R1OjJGloBjUZhJ4X4LDsxo5vpuFnhc=
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1751444027; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=uwLSYgMVcboUpduICczAWr7hs1RsmqCqfe1jLSr8ytE=;
	b=r7oc77bfmJHkkSzUx4K3TRfIU50j9Jj7KAhiDiExMV+qTsjZIb6ZBdKjecTxEBC5V4fRFa
	ppqgKf36/Ya7m2NvY9rUe5fPaQ5RI892qfK78i4iQvgyq5sFCO3J/bhRll9izfEGLFHxfO
	4R1OjJGloBjUZhJ4X4LDsxo5vpuFnhc=
From: Juergen Gross <jgross@suse.com>
To: minios-devel@lists.xenproject.org,
	xen-devel@lists.xenproject.org
Cc: samuel.thibault@ens-lyon.org,
	Juergen Gross <jgross@suse.com>
Subject: [MINI-OS PATCH 09/19] kexec: restructure building the start info data
Date: Wed,  2 Jul 2025 10:12:44 +0200
Message-ID: <20250702081254.14383-10-jgross@suse.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250702081254.14383-1-jgross@suse.com>
References: <20250702081254.14383-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Flag: NO
X-Spam-Score: -2.80
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
	RCPT_COUNT_THREE(0.00)[4];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:mid,suse.com:email,imap1.dmz-prg2.suse.org:helo];
	RCVD_TLS_ALL(0.00)[]
X-Spam-Level: 

Instead of setting most of the struct hvm_start_info fields first and
then building the leaf data, restructure kexec_get_entry() by
using an opaque "next" pointer where the next leaf data will be stored
and handle that leaf data together with the associated hvm_start_info
fields.

This will make it easier to add new data items without having to
rewrite large portions of the function.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 arch/x86/kexec.c | 18 +++++++++++-------
 1 file changed, 11 insertions(+), 7 deletions(-)

diff --git a/arch/x86/kexec.c b/arch/x86/kexec.c
index d84df42c..3e3b64e2 100644
--- a/arch/x86/kexec.c
+++ b/arch/x86/kexec.c
@@ -215,6 +215,7 @@ void kexec_set_param_loc(const char *cmdline)
 
 int kexec_get_entry(const char *cmdline)
 {
+    void *next;
     struct hvm_start_info *info;
     struct hvm_memmap_table_entry *mmap;
     unsigned int order;
@@ -229,16 +230,17 @@ int kexec_get_entry(const char *cmdline)
     if ( !kexec_param_mem )
         return ENOMEM;
 
-    info = (struct hvm_start_info *)kexec_param_mem;
+    next = (void *)kexec_param_mem;
+
+    info = next;
     memset(info, 0, sizeof(*info));
     info->magic = XEN_HVM_START_MAGIC_VALUE;
     info->version = 1;
-    info->cmdline_paddr = kexec_param_loc + sizeof(*info) +
-                          e820_entries * sizeof(struct hvm_memmap_table_entry);
-    info->memmap_paddr = kexec_param_loc + sizeof(*info);
-    info->memmap_entries = e820_entries;
+    next = info + 1;
 
-    mmap = (struct hvm_memmap_table_entry *)(info + 1);
+    mmap = next;
+    info->memmap_paddr = kexec_param_loc + (unsigned long)next - kexec_param_mem;
+    info->memmap_entries = e820_entries;
     for ( i = 0; i < e820_entries; i++ )
     {
         mmap->addr = e820_map[i].addr;
@@ -246,8 +248,10 @@ int kexec_get_entry(const char *cmdline)
         mmap->type = e820_map[i].type;
         mmap++;
     }
+    next = mmap;
 
-    strcpy((char *)mmap, cmdline);
+    info->cmdline_paddr = kexec_param_loc + (unsigned long)next - kexec_param_mem;
+    strcpy(next, cmdline);
 
     if ( kexec_add_action(KEXEC_COPY, to_virt(kexec_param_loc), info,
                           kexec_param_size) )
-- 
2.43.0


