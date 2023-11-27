Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EB7B07F9DC1
	for <lists+xen-devel@lfdr.de>; Mon, 27 Nov 2023 11:39:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.641863.1000846 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r7Z10-0000lM-Vo; Mon, 27 Nov 2023 10:38:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 641863.1000846; Mon, 27 Nov 2023 10:38:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r7Z10-0000iK-Se; Mon, 27 Nov 2023 10:38:58 +0000
Received: by outflank-mailman (input) for mailman id 641863;
 Mon, 27 Nov 2023 10:38:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=gVlU=HI=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1r7YqX-0004NR-TR
 for xen-devel@lists.xenproject.org; Mon, 27 Nov 2023 10:28:09 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a6fb56be-8d0f-11ee-9b0e-b553b5be7939;
 Mon, 27 Nov 2023 11:28:06 +0100 (CET)
Received: from imap2.dmz-prg2.suse.org (imap2.dmz-prg2.suse.org [10.150.64.98])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id CC569202A8;
 Mon, 27 Nov 2023 10:28:05 +0000 (UTC)
Received: from imap2.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap2.dmz-prg2.suse.org (Postfix) with ESMTPS id A3661132A6;
 Mon, 27 Nov 2023 10:28:05 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap2.dmz-prg2.suse.org with ESMTPSA id Ui6jJjVvZGVEfwAAn2gu4w
 (envelope-from <jgross@suse.com>); Mon, 27 Nov 2023 10:28:05 +0000
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
X-Inumbo-ID: a6fb56be-8d0f-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1701080885; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3OavG29JmnpyUi3SYYO0kR9XpCfsrefzwj7xVlfdRZw=;
	b=jsKbaDSg7iI0hkJ0JnsT2e+XZMwrO6az3BvsxsrC8+UbWN6lNKl88tSCDJcPXI3scLe4eH
	9JOIdASO3HAh6AGHPD/Uk7LqApT5To243QiyYafYDyvD6gsjfoSFH7RsQj5HeikyPalGFL
	eUKiyVIR0iNMjgMqOgaSFP5vqx0vl6Q=
From: Juergen Gross <jgross@suse.com>
To: minios-devel@lists.xenproject.org,
	xen-devel@lists.xenproject.org
Cc: samuel.thibault@ens-lyon.org,
	wl@xen.org,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH v3 29/32] Mini-OS: add EXPORT_SYMBOL() instances to tpmfront.c
Date: Mon, 27 Nov 2023 11:25:20 +0100
Message-Id: <20231127102523.28003-30-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20231127102523.28003-1-jgross@suse.com>
References: <20231127102523.28003-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Authentication-Results: smtp-out2.suse.de;
	none
X-Spam-Level: ****
X-Spam-Flag: NO
X-Spam-Score: 4.69
X-Spamd-Result: default: False [4.69 / 50.00];
	 ARC_NA(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 BAYES_SPAM(0.99)[81.49%];
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

Add the needed instances of EXPORT_SYMBOL() to tpmfront.c.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
V3:
- new patch
---
 tpmfront.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/tpmfront.c b/tpmfront.c
index f4864d61..83768d07 100644
--- a/tpmfront.c
+++ b/tpmfront.c
@@ -338,6 +338,8 @@ error:
    shutdown_tpmfront(dev);
    return NULL;
 }
+EXPORT_SYMBOL(init_tpmfront);
+
 void shutdown_tpmfront(struct tpmfront_dev* dev)
 {
    char* err;
@@ -402,6 +404,7 @@ void shutdown_tpmfront(struct tpmfront_dev* dev)
    }
    free(dev);
 }
+EXPORT_SYMBOL(shutdown_tpmfront);
 
 int tpmfront_send(struct tpmfront_dev* dev, const uint8_t* msg, size_t length)
 {
@@ -528,6 +531,7 @@ int tpmfront_cmd(struct tpmfront_dev* dev, uint8_t* req, size_t reqlen, uint8_t*
 
    return 0;
 }
+EXPORT_SYMBOL(tpmfront_cmd);
 
 int tpmfront_set_locality(struct tpmfront_dev* dev, int locality)
 {
@@ -536,6 +540,7 @@ int tpmfront_set_locality(struct tpmfront_dev* dev, int locality)
    dev->page->locality = locality;
    return 0;
 }
+EXPORT_SYMBOL(tpmfront_set_locality);
 
 #ifdef HAVE_LIBC
 #include <errno.h>
@@ -663,5 +668,6 @@ int tpmfront_open(struct tpmfront_dev *dev)
 
     return dev->fd;
 }
+EXPORT_SYMBOL(tpmfront_open);
 
 #endif
-- 
2.35.3


