Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5962EAE03F8
	for <lists+xen-devel@lfdr.de>; Thu, 19 Jun 2025 13:38:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1019967.1396443 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uSDbA-0002yw-Ue; Thu, 19 Jun 2025 11:38:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1019967.1396443; Thu, 19 Jun 2025 11:38:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uSDbA-0002uD-Q1; Thu, 19 Jun 2025 11:38:28 +0000
Received: by outflank-mailman (input) for mailman id 1019967;
 Thu, 19 Jun 2025 11:38:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=rg/r=ZC=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1uSDb8-0001ot-UR
 for xen-devel@lists.xenproject.org; Thu, 19 Jun 2025 11:38:26 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de
 [2a07:de40:b251:101:10:150:64:1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e8ad46f0-4d01-11f0-b894-0df219b8e170;
 Thu, 19 Jun 2025 13:38:24 +0200 (CEST)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 2242D21167;
 Thu, 19 Jun 2025 11:38:24 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id E34FC136CC;
 Thu, 19 Jun 2025 11:38:23 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id GWO6Na/2U2hobgAAD6G6ig
 (envelope-from <jgross@suse.com>); Thu, 19 Jun 2025 11:38:23 +0000
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
X-Inumbo-ID: e8ad46f0-4d01-11f0-b894-0df219b8e170
Authentication-Results: smtp-out1.suse.de;
	none
From: Juergen Gross <jgross@suse.com>
To: minios-devel@lists.xenproject.org,
	xen-devel@lists.xenproject.org
Cc: samuel.thibault@ens-lyon.org,
	Juergen Gross <jgross@suse.com>
Subject: [MINI-OS PATCH 3/6] x86/pv: remove global start_info
Date: Thu, 19 Jun 2025 13:38:01 +0200
Message-ID: <20250619113804.32694-4-jgross@suse.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250619113804.32694-1-jgross@suse.com>
References: <20250619113804.32694-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Pre-Result: action=no action;
	module=replies;
	Message is reply to one we originated
X-Spamd-Result: default: False [-4.00 / 50.00];
	REPLY(-4.00)[]
X-Rspamd-Queue-Id: 2242D21167
X-Rspamd-Pre-Result: action=no action;
	module=replies;
	Message is reply to one we originated
X-Rspamd-Action: no action
X-Spam-Level: 
X-Spam-Flag: NO
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Score: -4.00

Add an extern declaration for start_info_ptr when running in PV mode
and use that instead of the copy held in start_info. This allows to
drop start_info.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 arch/x86/setup.c     | 17 +----------------
 console.c            |  2 +-
 include/hypervisor.h | 12 ++----------
 xenbus.c             |  2 +-
 4 files changed, 5 insertions(+), 28 deletions(-)

diff --git a/arch/x86/setup.c b/arch/x86/setup.c
index 1bdf9509..4e2f0749 100644
--- a/arch/x86/setup.c
+++ b/arch/x86/setup.c
@@ -35,17 +35,8 @@
 #include <xen/arch-x86/hvm/start_info.h>
 #include <xen/hvm/params.h>
 
-#ifdef CONFIG_PARAVIRT
-/*
- * This structure contains start-of-day info, such as pagetable base pointer,
- * address of the shared_info structure, and things like that.
- */
-union start_info_union start_info_union;
-EXPORT_SYMBOL(start_info_union);
-#endif
-
 /*
- * This pointer holds a reference to the copy of the start_info struct.
+ * This pointer holds a reference to the start_info struct.
  */
 start_info_t *start_info_ptr;
 
@@ -212,10 +203,6 @@ arch_init(void *par)
 	/* print out some useful information  */
 	print_start_of_day(par);
 
-#ifdef CONFIG_PARAVIRT
-	memcpy(&start_info, par, sizeof(start_info));
-#endif
-
 	start_kernel();
 }
 
@@ -248,8 +235,6 @@ void arch_post_suspend(int canceled)
     if (canceled) {
         start_info_ptr->store_mfn = pfn_to_mfn(start_info_ptr->store_mfn);
         start_info_ptr->console.domU.mfn = pfn_to_mfn(start_info_ptr->console.domU.mfn);
-    } else {
-        memcpy(&start_info, start_info_ptr, sizeof(start_info_t));
     }
 #endif
 
diff --git a/console.c b/console.c
index 0107b685..a4c50371 100644
--- a/console.c
+++ b/console.c
@@ -411,7 +411,7 @@ void xencons_ring_resume(struct consfront_dev *dev)
     if ( dev )
     {
 #if CONFIG_PARAVIRT
-        get_console(&start_info);
+        get_console(start_info_ptr);
 #else
         get_console(0);
 #endif
diff --git a/include/hypervisor.h b/include/hypervisor.h
index aef142d1..f40bc8c3 100644
--- a/include/hypervisor.h
+++ b/include/hypervisor.h
@@ -28,16 +28,8 @@
 
 /* hypervisor.c */
 #ifdef CONFIG_PARAVIRT
-/*
- * a placeholder for the start of day information passed up from the hypervisor
- */
-union start_info_union
-{
-    start_info_t start_info;
-    char padding[512];
-};
-extern union start_info_union start_info_union;
-#define start_info (start_info_union.start_info)
+/* A pointer to the start of day information passed up from the hypervisor. */
+extern start_info_t *start_info_ptr;
 #else
 int hvm_get_parameter(int idx, uint64_t *value);
 int hvm_set_parameter(int idx, uint64_t value);
diff --git a/xenbus.c b/xenbus.c
index 686428a4..43fdebd7 100644
--- a/xenbus.c
+++ b/xenbus.c
@@ -469,7 +469,7 @@ void resume_xenbus(int canceled)
     struct xsd_sockmsg *rep;
 
 #ifdef CONFIG_PARAVIRT
-    get_xenbus(&start_info);
+    get_xenbus(start_info_ptr);
 #else
     get_xenbus(0);
 #endif
-- 
2.43.0


