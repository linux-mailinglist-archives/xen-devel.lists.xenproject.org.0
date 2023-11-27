Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D9EBC7F9D6E
	for <lists+xen-devel@lfdr.de>; Mon, 27 Nov 2023 11:27:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.641748.1000593 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r7Ypk-0004io-A1; Mon, 27 Nov 2023 10:27:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 641748.1000593; Mon, 27 Nov 2023 10:27:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r7Ypk-0004gr-74; Mon, 27 Nov 2023 10:27:20 +0000
Received: by outflank-mailman (input) for mailman id 641748;
 Mon, 27 Nov 2023 10:27:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=gVlU=HI=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1r7Ypj-0004NR-B9
 for xen-devel@lists.xenproject.org; Mon, 27 Nov 2023 10:27:19 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 89606ddc-8d0f-11ee-9b0e-b553b5be7939;
 Mon, 27 Nov 2023 11:27:16 +0100 (CET)
Received: from imap2.dmz-prg2.suse.org (imap2.dmz-prg2.suse.org [10.150.64.98])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 1EE59202A5;
 Mon, 27 Nov 2023 10:27:16 +0000 (UTC)
Received: from imap2.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap2.dmz-prg2.suse.org (Postfix) with ESMTPS id EAB10132A6;
 Mon, 27 Nov 2023 10:27:15 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap2.dmz-prg2.suse.org with ESMTPSA id YFcWOANvZGUDfwAAn2gu4w
 (envelope-from <jgross@suse.com>); Mon, 27 Nov 2023 10:27:15 +0000
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
X-Inumbo-ID: 89606ddc-8d0f-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1701080836; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vsQt5sczdEkDLsGfMhKbpXQdiEi3uQZXsLLDtTgbDTg=;
	b=H/K2ZeNdRRhpty2LMEcJiw14lt/9n5XrASb2s1HaK1yR/9x6aF/crZAm1V5A0Z2S4UHr6b
	1CZs6jozc3Qw+WG9+eTWj15xdl+9J5VPDgNs9PYzXvvc4zE+7AmeFqK2I9v3qA9KJSejjn
	3Hx/MkKyTTPTt/eER/6Wjp4mds8bo+M=
From: Juergen Gross <jgross@suse.com>
To: minios-devel@lists.xenproject.org,
	xen-devel@lists.xenproject.org
Cc: samuel.thibault@ens-lyon.org,
	wl@xen.org,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH v3 20/32] Mini-OS: add EXPORT_SYMBOL() instances to lock.c
Date: Mon, 27 Nov 2023 11:25:11 +0100
Message-Id: <20231127102523.28003-21-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20231127102523.28003-1-jgross@suse.com>
References: <20231127102523.28003-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Authentication-Results: smtp-out2.suse.de;
	none
X-Spam-Level: ***
X-Spam-Flag: NO
X-Spam-Score: 3.80
X-Spamd-Result: default: False [3.80 / 50.00];
	 ARC_NA(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 BAYES_SPAM(0.10)[61.14%];
	 FROM_HAS_DN(0.00)[];
	 TO_DN_SOME(0.00)[];
	 R_MISSING_CHARSET(2.50)[];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 MIME_GOOD(-0.10)[text/plain];
	 BROKEN_CONTENT_TYPE(1.50)[];
	 RCPT_COUNT_FIVE(0.00)[5];
	 NEURAL_HAM_LONG(-1.00)[-1.000];
	 RCVD_COUNT_THREE(0.00)[3];
	 DKIM_SIGNED(0.00)[suse.com:s=susede1];
	 NEURAL_HAM_SHORT(-0.20)[-0.999];
	 MID_CONTAINS_FROM(1.00)[];
	 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 RCVD_TLS_ALL(0.00)[]

Add the needed instances of EXPORT_SYMBOL() to lock.c.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
V3:
- new patch
---
 lock.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/lock.c b/lock.c
index 61194e5d..8f58344f 100644
--- a/lock.c
+++ b/lock.c
@@ -17,6 +17,7 @@ int ___lock_init(_LOCK_T *lock)
     init_waitqueue_head(&lock->wait);
     return 0;
 }
+EXPORT_SYMBOL(___lock_init);
 
 int ___lock_acquire(_LOCK_T *lock)
 {
@@ -32,6 +33,7 @@ int ___lock_acquire(_LOCK_T *lock)
     local_irq_restore(flags);
     return 0;
 }
+EXPORT_SYMBOL(___lock_acquire);
 
 int ___lock_try_acquire(_LOCK_T *lock)
 {
@@ -45,6 +47,7 @@ int ___lock_try_acquire(_LOCK_T *lock)
     local_irq_restore(flags);
     return ret;
 }
+EXPORT_SYMBOL(___lock_try_acquire);
 
 int ___lock_release(_LOCK_T *lock)
 {
@@ -55,7 +58,7 @@ int ___lock_release(_LOCK_T *lock)
     local_irq_restore(flags);
     return 0;
 }
-
+EXPORT_SYMBOL(___lock_release);
 
 int ___lock_init_recursive(_LOCK_RECURSIVE_T *lock)
 {
@@ -63,6 +66,7 @@ int ___lock_init_recursive(_LOCK_RECURSIVE_T *lock)
     init_waitqueue_head(&lock->wait);
     return 0;
 }
+EXPORT_SYMBOL(___lock_init_recursive);
 
 int ___lock_acquire_recursive(_LOCK_RECURSIVE_T *lock)
 {
@@ -81,6 +85,7 @@ int ___lock_acquire_recursive(_LOCK_RECURSIVE_T *lock)
     lock->count++;
     return 0;
 }
+EXPORT_SYMBOL(___lock_acquire_recursive);
 
 int ___lock_try_acquire_recursive(_LOCK_RECURSIVE_T *lock)
 {
@@ -95,6 +100,7 @@ int ___lock_try_acquire_recursive(_LOCK_RECURSIVE_T *lock)
     local_irq_restore(flags);
     return ret;
 }
+EXPORT_SYMBOL(___lock_try_acquire_recursive);
 
 int ___lock_release_recursive(_LOCK_RECURSIVE_T *lock)
 {
@@ -108,5 +114,6 @@ int ___lock_release_recursive(_LOCK_RECURSIVE_T *lock)
     local_irq_restore(flags);
     return 0;
 }
+EXPORT_SYMBOL(___lock_release_recursive);
 
 #endif
-- 
2.35.3


