Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F11FADAB1B
	for <lists+xen-devel@lfdr.de>; Mon, 16 Jun 2025 10:51:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1016944.1393945 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uR5YB-0004DD-Tx; Mon, 16 Jun 2025 08:50:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1016944.1393945; Mon, 16 Jun 2025 08:50:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uR5YB-00047I-Qu; Mon, 16 Jun 2025 08:50:43 +0000
Received: by outflank-mailman (input) for mailman id 1016944;
 Mon, 16 Jun 2025 08:50:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=GKzt=Y7=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1uR5V4-0007hV-SQ
 for xen-devel@lists.xenproject.org; Mon, 16 Jun 2025 08:47:30 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 88f20ac5-4a8e-11f0-b894-0df219b8e170;
 Mon, 16 Jun 2025 10:47:29 +0200 (CEST)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id DD17221203;
 Mon, 16 Jun 2025 08:47:28 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id A87E4139E2;
 Mon, 16 Jun 2025 08:47:28 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id oGyWJyDaT2hFQAAAD6G6ig
 (envelope-from <jgross@suse.com>); Mon, 16 Jun 2025 08:47:28 +0000
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
X-Inumbo-ID: 88f20ac5-4a8e-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1750063649; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=IMg43rEyz8CpFoVtq3k2oUri4d2hHuQbI9tlZdtJd1M=;
	b=RBycZqlgyhvjGURyBTEl+DgB6nQGhh31WKaVV+yTp1sAXttmg+yIRZ9ukSzGsZKHBoj0ij
	REk5qSbSMn7B/V/WkDfZJFZwpnGhvZxP0e6Vbm47m2+M3bB7WOMiJsEb42h7Vi8uUtIAfe
	XGe7W1XKAgxDD1/uhmOBMfx6dd+ohfU=
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.com header.s=susede1 header.b=dYaRylJK
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1750063648; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=IMg43rEyz8CpFoVtq3k2oUri4d2hHuQbI9tlZdtJd1M=;
	b=dYaRylJK0V/t4bUa7GTifIuxYGsBu9t85xuZtG1CaUoZoxuvd5an6xk4mHpO7Mnz3VLPp3
	lyGpE1QHPLGkpJK7gIO0bQMrQee+GDMqR2JZL5rY7NJNs4DjFes4i3UVl51VExF0k8KaBk
	b9hndnRcm56g6Zm+Zo6APRP/RHPKP4k=
From: Juergen Gross <jgross@suse.com>
To: minios-devel@lists.xenproject.org,
	xen-devel@lists.xenproject.org
Cc: samuel.thibault@ens-lyon.org,
	Juergen Gross <jgross@suse.com>
Subject: [MINI-OS PATCH v2 12/12] mini-os: kexec: do the final kexec step
Date: Mon, 16 Jun 2025 10:46:19 +0200
Message-ID: <20250616084619.11112-13-jgross@suse.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250616084619.11112-1-jgross@suse.com>
References: <20250616084619.11112-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim,suse.com:mid,suse.com:email,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns];
	RCVD_TLS_ALL(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	DKIM_SIGNED(0.00)[suse.com:s=susede1];
	DKIM_TRACE(0.00)[suse.com:+]
X-Spam-Level: 
X-Spam-Flag: NO
X-Rspamd-Queue-Id: DD17221203
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Score: -3.01

With all kexec preparations done, activate the new kernel.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 kexec.c | 17 +++++++++++++++--
 1 file changed, 15 insertions(+), 2 deletions(-)

diff --git a/kexec.c b/kexec.c
index f42aa8ad..2607c819 100644
--- a/kexec.c
+++ b/kexec.c
@@ -168,6 +168,7 @@ int kexec(void *kernel, unsigned long kernel_size, const char *cmdline)
 {
     int ret;
     unsigned long *func;
+    void *kexec_page;
 
     ret = analyze_kernel(kernel, kernel_size);
     if ( ret )
@@ -191,6 +192,13 @@ int kexec(void *kernel, unsigned long kernel_size, const char *cmdline)
     if ( ret )
         goto err;
 
+    kexec_page = (void *)alloc_page();
+    if ( !kexec_page )
+    {
+        ret = ENOMEM;
+        goto err;
+    }
+
     for ( func = __kexec_array_start; func < __kexec_array_end; func++ )
     {
         ret = ((kexeccall_t)(*func))(false);
@@ -203,10 +211,15 @@ int kexec(void *kernel, unsigned long kernel_size, const char *cmdline)
         }
     }
 
-    /* Error exit. */
-    ret = ENOSYS;
+    /* Activate the new kernel. */
+    do_kexec(kexec_page);
+
+    /* do_kexec() shouldn't return, crash. */
+    BUG();
 
  err:
+    if ( kexec_page )
+        free_page(kexec_page);
     change_readonly(true);
     unreserve_memory_below();
     kexec_move_used_pages_undo();
-- 
2.43.0


