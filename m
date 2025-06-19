Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B664AE0417
	for <lists+xen-devel@lfdr.de>; Thu, 19 Jun 2025 13:41:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1020034.1396479 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uSDe0-0006WR-S1; Thu, 19 Jun 2025 11:41:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1020034.1396479; Thu, 19 Jun 2025 11:41:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uSDe0-0006U6-PK; Thu, 19 Jun 2025 11:41:24 +0000
Received: by outflank-mailman (input) for mailman id 1020034;
 Thu, 19 Jun 2025 11:41:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=rg/r=ZC=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1uSDbP-0001ot-W6
 for xen-devel@lists.xenproject.org; Thu, 19 Jun 2025 11:38:43 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f2dcd4a2-4d01-11f0-b894-0df219b8e170;
 Thu, 19 Jun 2025 13:38:41 +0200 (CEST)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 3E47121167;
 Thu, 19 Jun 2025 11:38:41 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 05CCA136CC;
 Thu, 19 Jun 2025 11:38:40 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id 8Sf2OsD2U2iIbgAAD6G6ig
 (envelope-from <jgross@suse.com>); Thu, 19 Jun 2025 11:38:40 +0000
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
X-Inumbo-ID: f2dcd4a2-4d01-11f0-b894-0df219b8e170
Authentication-Results: smtp-out1.suse.de;
	none
From: Juergen Gross <jgross@suse.com>
To: minios-devel@lists.xenproject.org,
	xen-devel@lists.xenproject.org
Cc: samuel.thibault@ens-lyon.org,
	Juergen Gross <jgross@suse.com>
Subject: [MINI-OS PATCH 6/6] x86/pv: make start_info_ptr PV-only
Date: Thu, 19 Jun 2025 13:38:04 +0200
Message-ID: <20250619113804.32694-7-jgross@suse.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250619113804.32694-1-jgross@suse.com>
References: <20250619113804.32694-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Pre-Result: action=no action;
	module=replies;
	Message is reply to one we originated
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spam-Level: 
X-Spamd-Result: default: False [-4.00 / 50.00];
	REPLY(-4.00)[]
X-Spam-Flag: NO
X-Rspamd-Queue-Id: 3E47121167
X-Rspamd-Pre-Result: action=no action;
	module=replies;
	Message is reply to one we originated
X-Rspamd-Action: no action
X-Spam-Score: -4.00

Hide start_info_ptr via CONFIG_PARAVIRT in order to avoid accesses to
it form not PV specific code.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 arch/x86/setup.c | 16 +++++++++++-----
 1 file changed, 11 insertions(+), 5 deletions(-)

diff --git a/arch/x86/setup.c b/arch/x86/setup.c
index 590f51a8..b3fc835a 100644
--- a/arch/x86/setup.c
+++ b/arch/x86/setup.c
@@ -35,11 +35,6 @@
 #include <xen/arch-x86/hvm/start_info.h>
 #include <xen/hvm/params.h>
 
-/*
- * This pointer holds a reference to the start_info struct.
- */
-start_info_t *start_info_ptr;
-
 /*
  * Shared page for communicating with the hypervisor.
  * Events flags go here, for example.
@@ -68,6 +63,11 @@ static inline void sse_init(void) {
 #endif
 
 #ifdef CONFIG_PARAVIRT
+/*
+ * This pointer holds a reference to the start_info struct.
+ */
+start_info_t *start_info_ptr;
+
 #define hpc_init()
 
 shared_info_t *map_shared_info(void)
@@ -175,7 +175,9 @@ arch_init(void *par)
 {
 	static char hello[] = "Bootstrapping...\n";
 
+#ifdef CONFIG_PARAVIRT
 	start_info_ptr = par;
+#endif
 
 	hpc_init();
 	(void)HYPERVISOR_console_io(CONSOLEIO_write, strlen(hello), hello);
@@ -226,7 +228,11 @@ int arch_suspend(void)
      * This hypercall returns 1 if the suspend
      * was cancelled and 0 if resuming in a new domain
      */
+#ifdef CONFIG_PARAVIRT
     return HYPERVISOR_suspend(virt_to_mfn(start_info_ptr));
+#else
+    return HYPERVISOR_suspend(0);
+#endif
 }
 
 void arch_post_suspend(int canceled)
-- 
2.43.0


