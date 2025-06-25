Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DEAE8AE8099
	for <lists+xen-devel@lfdr.de>; Wed, 25 Jun 2025 13:09:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1024727.1400561 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uUNzn-0006V5-J9; Wed, 25 Jun 2025 11:08:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1024727.1400561; Wed, 25 Jun 2025 11:08:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uUNzn-0006TF-FX; Wed, 25 Jun 2025 11:08:51 +0000
Received: by outflank-mailman (input) for mailman id 1024727;
 Wed, 25 Jun 2025 11:08:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=XgUS=ZI=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1uUNzm-0006T9-Uj
 for xen-devel@lists.xenproject.org; Wed, 25 Jun 2025 11:08:50 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c4053f60-51b4-11f0-b894-0df219b8e170;
 Wed, 25 Jun 2025 13:08:47 +0200 (CEST)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id D7ACE2119B;
 Wed, 25 Jun 2025 11:08:45 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id B4E1313485;
 Wed, 25 Jun 2025 11:08:45 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id Gk+0Kr3YW2jxUwAAD6G6ig
 (envelope-from <jgross@suse.com>); Wed, 25 Jun 2025 11:08:45 +0000
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
X-Inumbo-ID: c4053f60-51b4-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1750849725; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=EJnYB4I7T81pzp3oR2TiURRb56pVwU4EOA7kExk3Rfc=;
	b=dVwGoS1LTzDjZP57yLKxu/dDEQIZft4ixJH74JQ2wka5MyjHX0LZ9G/b4a0WwF04vUetrb
	lQBvKi4rAFfh2AlRzdCZuzPqMY30qH9ZvJ74/8qVJ8z2bb1voZ6xw0rkYtETcj/sYEB4GN
	sa+I9dQ+Z7syy47BqNd2ooEDVD9HRaQ=
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1750849725; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=EJnYB4I7T81pzp3oR2TiURRb56pVwU4EOA7kExk3Rfc=;
	b=dVwGoS1LTzDjZP57yLKxu/dDEQIZft4ixJH74JQ2wka5MyjHX0LZ9G/b4a0WwF04vUetrb
	lQBvKi4rAFfh2AlRzdCZuzPqMY30qH9ZvJ74/8qVJ8z2bb1voZ6xw0rkYtETcj/sYEB4GN
	sa+I9dQ+Z7syy47BqNd2ooEDVD9HRaQ=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Samuel Thibault <samuel.thibault@ens-lyon.org>
Subject: [PATCH] stubdom/grub: avoid relying on start_info definition
Date: Wed, 25 Jun 2025 13:08:43 +0200
Message-ID: <20250625110843.24840-1-jgross@suse.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
	RCPT_COUNT_THREE(0.00)[3];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,suse.com:mid,imap1.dmz-prg2.suse.org:helo];
	RCVD_TLS_ALL(0.00)[]
X-Spam-Level: 
X-Spam-Flag: NO
X-Spam-Score: -2.80

The kexec() function of grub-pv is relying on the exact definition of
start_info from Mini-OS by having an "#undef start_info" and a few
lines later a copy of the Mini-OS definition again.

This is bad practice by making all attempts of Mini-OS to change that
definition impossible.

Avoid that dependency by moving the code fragment in question to the
very end of the source file, allowing to drop the copy of the
definition.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 stubdom/grub/kexec.c | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/stubdom/grub/kexec.c b/stubdom/grub/kexec.c
index 3da80b5b4a..2c426cc378 100644
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
 
@@ -432,3 +431,10 @@ out:
     allocated = 0;
     xc_interface_close(xc_handle );
 }
+
+static void call_start_info_hook(struct xc_dom_image *dom)
+{
+#undef start_info
+    if ( dom->arch_hooks->start_info )
+        dom->arch_hooks->start_info(dom);
+}
-- 
2.43.0


