Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 19176AEA224
	for <lists+xen-devel@lfdr.de>; Thu, 26 Jun 2025 17:14:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1026652.1401846 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uUoIX-00049a-O2; Thu, 26 Jun 2025 15:13:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1026652.1401846; Thu, 26 Jun 2025 15:13:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uUoIX-00046p-KV; Thu, 26 Jun 2025 15:13:57 +0000
Received: by outflank-mailman (input) for mailman id 1026652;
 Thu, 26 Jun 2025 15:13:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=zZyX=ZJ=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1uUoIW-00046W-JX
 for xen-devel@lists.xenproject.org; Thu, 26 Jun 2025 15:13:56 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2d007de0-52a0-11f0-a30f-13f23c93f187;
 Thu, 26 Jun 2025 17:13:55 +0200 (CEST)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id DAEF421168;
 Thu, 26 Jun 2025 15:13:52 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id AC8EF13188;
 Thu, 26 Jun 2025 15:13:52 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id OZaZKLBjXWjuOgAAD6G6ig
 (envelope-from <jgross@suse.com>); Thu, 26 Jun 2025 15:13:52 +0000
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
X-Inumbo-ID: 2d007de0-52a0-11f0-a30f-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1750950833; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=AhGYBQwHApEqN1+5+tUHs1qBVwnk8aDK8vn7IKkZCtY=;
	b=GY15QzAa6URhOhe3Z3MZYdNM9+tp/jpv+lcT7sAgNinru9ScYhVxWUf9n8szNPzPLzrZK5
	hTzlDAsdh1+994zZLXj6+1tpbxh9vs8EXITx0/rKm6Bhf3cpVO+gdEbRcp71HLthuxhxrb
	TYa6MqsPcR1FLf55trk5AJtW5PU5wVU=
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1750950832; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=AhGYBQwHApEqN1+5+tUHs1qBVwnk8aDK8vn7IKkZCtY=;
	b=LSZ7UzjvXwUVDrUsyrzSGwkqxgS6G2SBUi2yw8zrbNZyprOH8uPwHdt8bN2CyxFa8zniFg
	DAZCcmV9+LXtb1iykQ/AtAfdP9bafl/XFSbDdfpTVnxjU4Z2VpO6Q0mx4SEna1Q6t4W+pH
	SP1J1znXcuxjhzj7v+cYqaDhSnL7GFA=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Samuel Thibault <samuel.thibault@ens-lyon.org>,
	Jason Andryuk <jason.andryuk@amd.com>
Subject: [PATCH v2 1/3] stubdom/grub: avoid relying on start_info definition
Date: Thu, 26 Jun 2025 17:13:42 +0200
Message-ID: <20250626151344.6971-2-jgross@suse.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250626151344.6971-1-jgross@suse.com>
References: <20250626151344.6971-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Flag: NO
X-Spam-Score: -2.80
X-Spamd-Result: default: False [-2.80 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	MIME_TRACE(0.00)[0:+];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	ARC_NA(0.00)[];
	DKIM_SIGNED(0.00)[suse.com:s=susede1];
	RCVD_TLS_ALL(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:email,imap1.dmz-prg2.suse.org:helo,suse.com:mid,suse.com:email]
X-Spam-Level: 

The kexec() function of grub-pv is relying on the exact definition of
start_info from Mini-OS by having an "#undef start_info" and a few
lines later a copy of the Mini-OS definition again.

This is bad practice by making all attempts of Mini-OS to change that
definition impossible.

Avoid that dependency by moving the code fragment in question to the
very end of the source file, allowing to drop the copy of the
definition.

Signed-off-by: Juergen Gross <jgross@suse.com>
Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>
---
V2:
- add comment (Jan Beulich)
---
 stubdom/grub/kexec.c | 15 +++++++++++----
 1 file changed, 11 insertions(+), 4 deletions(-)

diff --git a/stubdom/grub/kexec.c b/stubdom/grub/kexec.c
index 3da80b5b4a..b423e856a4 100644
--- a/stubdom/grub/kexec.c
+++ b/stubdom/grub/kexec.c
@@ -209,6 +209,8 @@ static void tpm_hash2pcr(struct xc_dom_image *dom, char *cmdline)
 	shutdown_tpmfront(tpm);
 }
 
+static void call_start_info_hook(struct xc_dom_image *dom);
+
 void kexec(void *kernel, long kernel_size, void *module, long module_size, char *cmdline, unsigned long flags)
 {
     struct xc_dom_image *dom;
@@ -330,10 +332,7 @@ void kexec(void *kernel, long kernel_size, void *module, long module_size, char
         }
 
     /* start info page */
-#undef start_info
-    if ( dom->arch_hooks->start_info )
-        dom->arch_hooks->start_info(dom);
-#define start_info (start_info_union.start_info)
+    call_start_info_hook(dom);
 
     xc_dom_log_memory_footprint(dom);
 
@@ -432,3 +431,11 @@ out:
     allocated = 0;
     xc_interface_close(xc_handle );
 }
+
+/* No references to start_info of Mini-OS after this function. */
+static void call_start_info_hook(struct xc_dom_image *dom)
+{
+#undef start_info
+    if ( dom->arch_hooks->start_info )
+        dom->arch_hooks->start_info(dom);
+}
-- 
2.43.0


