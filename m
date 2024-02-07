Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 62A2784C8B1
	for <lists+xen-devel@lfdr.de>; Wed,  7 Feb 2024 11:32:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.677334.1053875 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rXfDV-00082L-5I; Wed, 07 Feb 2024 10:31:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 677334.1053875; Wed, 07 Feb 2024 10:31:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rXfDV-00080j-0o; Wed, 07 Feb 2024 10:31:45 +0000
Received: by outflank-mailman (input) for mailman id 677334;
 Wed, 07 Feb 2024 10:31:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=D7mL=JQ=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1rXfDT-00080F-LQ
 for xen-devel@lists.xenproject.org; Wed, 07 Feb 2024 10:31:43 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 153b89b5-c5a4-11ee-8a49-1f161083a0e0;
 Wed, 07 Feb 2024 11:31:42 +0100 (CET)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 46571221B0;
 Wed,  7 Feb 2024 10:31:41 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 14E2713931;
 Wed,  7 Feb 2024 10:31:41 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id L2aXAw1cw2UvYgAAD6G6ig
 (envelope-from <jgross@suse.com>); Wed, 07 Feb 2024 10:31:41 +0000
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
X-Inumbo-ID: 153b89b5-c5a4-11ee-8a49-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1707301901; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=ZgvFN9fVJULnhlM4tZSu8boApfM5Dt//TBSdSqybRdM=;
	b=CxfSExGkqXhwo/r8W57pEtsbznbIa/qSIvY81eSuXUNEMn1ZU3uc5RqII/HX8ifUJ0yB4D
	yF+bdRxpbRYgTlge0v44vIpf2xgyjb4yV57RYN2z5fa6MCDnsqerL3LVJgo/NNSr+etNY6
	U6MQsUeWDUNnuY2jsVFmxhhFy/Xfu/4=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1707301901; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=ZgvFN9fVJULnhlM4tZSu8boApfM5Dt//TBSdSqybRdM=;
	b=CxfSExGkqXhwo/r8W57pEtsbznbIa/qSIvY81eSuXUNEMn1ZU3uc5RqII/HX8ifUJ0yB4D
	yF+bdRxpbRYgTlge0v44vIpf2xgyjb4yV57RYN2z5fa6MCDnsqerL3LVJgo/NNSr+etNY6
	U6MQsUeWDUNnuY2jsVFmxhhFy/Xfu/4=
From: Juergen Gross <jgross@suse.com>
To: minios-devel@lists.xenproject.org,
	xen-devel@lists.xenproject.org
Cc: samuel.thibault@ens-lyon.org,
	wl@xen.org,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH] Mini-OS: x86: zero out .bss segment at boot
Date: Wed,  7 Feb 2024 11:31:38 +0100
Message-Id: <20240207103138.26901-1-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.com header.s=susede1 header.b=CxfSExGk
X-Spamd-Result: default: False [2.69 / 50.00];
	 ARC_NA(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 R_DKIM_ALLOW(-0.20)[suse.com:s=susede1];
	 SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	 FROM_HAS_DN(0.00)[];
	 TO_DN_SOME(0.00)[];
	 R_MISSING_CHARSET(2.50)[];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 MIME_GOOD(-0.10)[text/plain];
	 BROKEN_CONTENT_TYPE(1.50)[];
	 DWL_DNSWL_MED(-2.00)[suse.com:dkim];
	 RCPT_COUNT_FIVE(0.00)[5];
	 RCVD_COUNT_THREE(0.00)[3];
	 DKIM_SIGNED(0.00)[suse.com:s=susede1];
	 DKIM_TRACE(0.00)[suse.com:+];
	 MX_GOOD(-0.01)[];
	 MID_CONTAINS_FROM(1.00)[];
	 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim,suse.com:email];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 RCVD_TLS_ALL(0.00)[]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Score: 2.69
X-Rspamd-Queue-Id: 46571221B0
X-Spam-Level: **
X-Spam-Flag: NO
X-Spamd-Bar: ++

The .bss segment should be zeroed at very early boot.

While adding the extern declaration of __bss_start for x86, make it
together with the other linker table defined section boundaries
common for all architectures.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 arch/x86/setup.c      | 2 ++
 include/arm/arch_mm.h | 1 -
 include/mm.h          | 2 ++
 include/x86/arch_mm.h | 1 -
 4 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/arch/x86/setup.c b/arch/x86/setup.c
index b27bbed7..3dddf4ad 100644
--- a/arch/x86/setup.c
+++ b/arch/x86/setup.c
@@ -184,6 +184,8 @@ arch_init(void *par)
 {
 	static char hello[] = "Bootstrapping...\n";
 
+	memset(&__bss_start, 0, &_end - &__bss_start);
+
 	hpc_init();
 	(void)HYPERVISOR_console_io(CONSOLEIO_write, strlen(hello), hello);
 
diff --git a/include/arm/arch_mm.h b/include/arm/arch_mm.h
index 79d9e05b..335eb4ff 100644
--- a/include/arm/arch_mm.h
+++ b/include/arm/arch_mm.h
@@ -3,7 +3,6 @@
 
 typedef uint64_t paddr_t;
 
-extern char _text, _etext, _erodata, _edata, _end, __bss_start;
 extern int _boot_stack[];
 extern int _boot_stack_end[];
 extern uint32_t physical_address_offset;	/* Add this to a virtual address to get the physical address (wraps at 4GB) */
diff --git a/include/mm.h b/include/mm.h
index 4fc364ff..e02e080b 100644
--- a/include/mm.h
+++ b/include/mm.h
@@ -46,6 +46,8 @@
 #define round_pgdown(_p)  ((_p) & PAGE_MASK)
 #define round_pgup(_p)    (((_p) + (PAGE_SIZE - 1)) & PAGE_MASK)
 
+extern char _text, _etext, _erodata, _edata, _end, __bss_start;
+
 extern unsigned long nr_free_pages;
 
 extern unsigned long *mm_alloc_bitmap;
diff --git a/include/x86/arch_mm.h b/include/x86/arch_mm.h
index a1b975dc..6b398cef 100644
--- a/include/x86/arch_mm.h
+++ b/include/x86/arch_mm.h
@@ -225,7 +225,6 @@ extern unsigned long *phys_to_machine_mapping;
 #else
 extern pgentry_t page_table_base[];
 #endif
-extern char _text, _etext, _erodata, _edata, _end;
 extern unsigned long mfn_zero;
 static __inline__ maddr_t phys_to_machine(paddr_t phys)
 {
-- 
2.35.3


