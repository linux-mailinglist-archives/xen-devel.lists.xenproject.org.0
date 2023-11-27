Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 455817F9DBB
	for <lists+xen-devel@lfdr.de>; Mon, 27 Nov 2023 11:38:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.641845.1000810 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r7Z0Z-0007lx-7e; Mon, 27 Nov 2023 10:38:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 641845.1000810; Mon, 27 Nov 2023 10:38:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r7Z0Z-0007je-42; Mon, 27 Nov 2023 10:38:31 +0000
Received: by outflank-mailman (input) for mailman id 641845;
 Mon, 27 Nov 2023 10:38:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=gVlU=HI=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1r7YpF-0000Co-L5
 for xen-devel@lists.xenproject.org; Mon, 27 Nov 2023 10:26:49 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 78dd2f6e-8d0f-11ee-98e2-6d05b1d4d9a1;
 Mon, 27 Nov 2023 11:26:49 +0100 (CET)
Received: from imap2.dmz-prg2.suse.org (imap2.dmz-prg2.suse.org [10.150.64.98])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 75B2B21A5E;
 Mon, 27 Nov 2023 10:26:48 +0000 (UTC)
Received: from imap2.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap2.dmz-prg2.suse.org (Postfix) with ESMTPS id 4CBA9132A6;
 Mon, 27 Nov 2023 10:26:48 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap2.dmz-prg2.suse.org with ESMTPSA id Q69iEehuZGXdfgAAn2gu4w
 (envelope-from <jgross@suse.com>); Mon, 27 Nov 2023 10:26:48 +0000
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
X-Inumbo-ID: 78dd2f6e-8d0f-11ee-98e2-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1701080808; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6A+RhPrAAMc0jcGa19Yq756hCQ6xoflSogusd8hsADA=;
	b=dNH1K448IJdl4+akYaWlEmCY2doQEIYjPj9X8PGJ62TFdVgPIuauGEjZCzNMf0jXp1l6iO
	BWtBGbqsZxIeXWMlXnemN5An9Mw0NMqRa/BIDdD3c7vGVIgHh5ugXTkwTPnPyMZHXdpb53
	1IhGwyYIXMG2hICTs8CzZR4JzON3/xA=
From: Juergen Gross <jgross@suse.com>
To: minios-devel@lists.xenproject.org,
	xen-devel@lists.xenproject.org
Cc: samuel.thibault@ens-lyon.org,
	wl@xen.org,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH v3 15/32] Mini-OS: add EXPORT_SYMBOL() instances to console.c
Date: Mon, 27 Nov 2023 11:25:06 +0100
Message-Id: <20231127102523.28003-16-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20231127102523.28003-1-jgross@suse.com>
References: <20231127102523.28003-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Authentication-Results: smtp-out1.suse.de;
	none
X-Spam-Level: ***********
X-Spam-Score: 11.83
X-Spamd-Result: default: False [11.83 / 50.00];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 BAYES_SPAM(0.43)[73.32%];
	 TO_DN_SOME(0.00)[];
	 R_MISSING_CHARSET(2.50)[];
	 BROKEN_CONTENT_TYPE(1.50)[];
	 RCPT_COUNT_FIVE(0.00)[5];
	 RCVD_COUNT_THREE(0.00)[3];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 ARC_NA(0.00)[];
	 FROM_HAS_DN(0.00)[];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 NEURAL_SPAM_SHORT(3.00)[1.000];
	 MIME_GOOD(-0.10)[text/plain];
	 DKIM_SIGNED(0.00)[suse.com:s=susede1];
	 NEURAL_SPAM_LONG(3.50)[1.000];
	 MID_CONTAINS_FROM(1.00)[];
	 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 RCVD_TLS_ALL(0.00)[]
X-Spam-Flag: NO

Add the needed instances of EXPORT_SYMBOL() to console.c.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
V3:
- new patch
---
 console.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/console.c b/console.c
index 5d205c7d..0107b685 100644
--- a/console.c
+++ b/console.c
@@ -125,6 +125,7 @@ void console_print(struct consfront_dev *dev, const char *data, int length)
 
     ring_send_fn(dev, copied_ptr, length);
 }
+EXPORT_SYMBOL(console_print);
 
 void print(int direct, const char *fmt, va_list args)
 {
@@ -155,6 +156,7 @@ void printk(const char *fmt, ...)
     print(0, fmt, args);
     va_end(args);
 }
+EXPORT_SYMBOL(printk);
 
 void xprintk(const char *fmt, ...)
 {
@@ -164,6 +166,8 @@ void xprintk(const char *fmt, ...)
     print(1, fmt, args);
     va_end(args);
 }
+EXPORT_SYMBOL(xprintk);
+
 void init_console(void)
 {
     printk("Initialising console ... ");
@@ -320,6 +324,7 @@ int xencons_ring_avail(struct consfront_dev *dev)
 
     return prod - cons;
 }
+EXPORT_SYMBOL(xencons_ring_avail);
 
 int xencons_ring_recv(struct consfront_dev *dev, char *data, unsigned int len)
 {
-- 
2.35.3


