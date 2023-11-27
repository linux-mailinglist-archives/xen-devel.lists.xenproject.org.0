Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E7F17F9DA3
	for <lists+xen-devel@lfdr.de>; Mon, 27 Nov 2023 11:36:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.641785.1000683 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r7YyN-0001Fg-1j; Mon, 27 Nov 2023 10:36:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 641785.1000683; Mon, 27 Nov 2023 10:36:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r7YyM-0001Dg-TF; Mon, 27 Nov 2023 10:36:14 +0000
Received: by outflank-mailman (input) for mailman id 641785;
 Mon, 27 Nov 2023 10:36:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=gVlU=HI=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1r7Yp4-0000Co-JB
 for xen-devel@lists.xenproject.org; Mon, 27 Nov 2023 10:26:38 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de
 [2a07:de40:b251:101:10:150:64:1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 723e8f30-8d0f-11ee-98e2-6d05b1d4d9a1;
 Mon, 27 Nov 2023 11:26:37 +0100 (CET)
Received: from imap2.dmz-prg2.suse.org (imap2.dmz-prg2.suse.org [10.150.64.98])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 67E7321A5E;
 Mon, 27 Nov 2023 10:26:37 +0000 (UTC)
Received: from imap2.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap2.dmz-prg2.suse.org (Postfix) with ESMTPS id 3F819132A6;
 Mon, 27 Nov 2023 10:26:37 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap2.dmz-prg2.suse.org with ESMTPSA id TUghDt1uZGXRfgAAn2gu4w
 (envelope-from <jgross@suse.com>); Mon, 27 Nov 2023 10:26:37 +0000
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
X-Inumbo-ID: 723e8f30-8d0f-11ee-98e2-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1701080797; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YCGp9mQOcr8NzJb1ZHSNOf2u959zWvLhTh86LYUiIoU=;
	b=YcD7l7hAG6XaemMopOA8Bd26KS0kRqJBJaiQZdmKGF6ua4h0Z2HRyMlfJojEKuleToI863
	uxPRvoBry5Gnnd5sEbKR3h8e6BYYJIbiv0aVWmnqTv1VlxcB8jEfnx1sf53dA+dl04Ztd0
	31ZgnNFGOgVkwaKSUhd3Lu5uZphV6N4=
From: Juergen Gross <jgross@suse.com>
To: minios-devel@lists.xenproject.org,
	xen-devel@lists.xenproject.org
Cc: samuel.thibault@ens-lyon.org,
	wl@xen.org,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH v3 13/32] Mini-OS: add EXPORT_SYMBOL() instances to lib/xs.c
Date: Mon, 27 Nov 2023 11:25:04 +0100
Message-Id: <20231127102523.28003-14-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20231127102523.28003-1-jgross@suse.com>
References: <20231127102523.28003-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Authentication-Results: smtp-out1.suse.de;
	none
X-Spam-Level: ***********
X-Spam-Score: 11.40
X-Spamd-Result: default: False [11.40 / 50.00];
	 ARC_NA(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 FROM_HAS_DN(0.00)[];
	 TO_DN_SOME(0.00)[];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 R_MISSING_CHARSET(2.50)[];
	 MIME_GOOD(-0.10)[text/plain];
	 NEURAL_SPAM_SHORT(3.00)[1.000];
	 BROKEN_CONTENT_TYPE(1.50)[];
	 RCPT_COUNT_FIVE(0.00)[5];
	 RCVD_COUNT_THREE(0.00)[3];
	 DKIM_SIGNED(0.00)[suse.com:s=susede1];
	 NEURAL_SPAM_LONG(3.50)[1.000];
	 MID_CONTAINS_FROM(1.00)[];
	 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 RCVD_TLS_ALL(0.00)[]
X-Spam-Flag: NO

Add the needed instances of EXPORT_SYMBOL() to lib/xs.c.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
V3:
- new patch
---
 lib/xs.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/lib/xs.c b/lib/xs.c
index 7fe9b03e..ff0768c1 100644
--- a/lib/xs.c
+++ b/lib/xs.c
@@ -64,6 +64,7 @@ struct xs_handle *xs_daemon_open()
     printk("xs_daemon_open -> %d, %p\n", fd, &file->dev);
     return (void*)(intptr_t) fd;
 }
+EXPORT_SYMBOL(xs_daemon_open);
 
 void xs_daemon_close(struct xs_handle *h)
 {
@@ -74,6 +75,7 @@ int xs_fileno(struct xs_handle *h)
 {
     return _xs_fileno(h);
 }
+EXPORT_SYMBOL(xs_fileno);
 
 void *xs_read(struct xs_handle *h, xs_transaction_t t,
 	     const char *path, unsigned int *len)
@@ -92,6 +94,7 @@ void *xs_read(struct xs_handle *h, xs_transaction_t t,
 	*len = strlen(value);
     return value;
 }
+EXPORT_SYMBOL(xs_read);
 
 bool xs_write(struct xs_handle *h, xs_transaction_t t,
 	      const char *path, const void *data, unsigned int len)
@@ -110,6 +113,7 @@ bool xs_write(struct xs_handle *h, xs_transaction_t t,
     }
     return true;
 }
+EXPORT_SYMBOL(xs_write);
 
 static bool xs_bool(char *reply)
 {
@@ -123,6 +127,7 @@ bool xs_rm(struct xs_handle *h, xs_transaction_t t, const char *path)
 {
     return xs_bool(xenbus_rm(t, path));
 }
+EXPORT_SYMBOL(xs_rm);
 
 static void *xs_talkv(struct xs_handle *h, xs_transaction_t t,
 		enum xsd_sockmsg_type type,
@@ -163,6 +168,7 @@ char *xs_get_domain_path(struct xs_handle *h, unsigned int domid)
 
     return xs_single(h, XBT_NULL, XS_GET_DOMAIN_PATH, domid_str, NULL);
 }
+EXPORT_SYMBOL(xs_get_domain_path);
 
 char **xs_directory(struct xs_handle *h, xs_transaction_t t,
 		    const char *path, unsigned int *num)
@@ -199,6 +205,7 @@ char **xs_directory(struct xs_handle *h, xs_transaction_t t,
     free(res);
     return entries;
 }
+EXPORT_SYMBOL(xs_directory);
 
 bool xs_watch(struct xs_handle *h, const char *path, const char *token)
 {
@@ -208,6 +215,7 @@ bool xs_watch(struct xs_handle *h, const char *path, const char *token)
     return xs_bool(xenbus_watch_path_token(XBT_NULL, path, token,
                                            (xenbus_event_queue *)&file->dev));
 }
+EXPORT_SYMBOL(xs_watch);
 
 char **xs_read_watch(struct xs_handle *h, unsigned int *num)
 {
@@ -220,10 +228,12 @@ char **xs_read_watch(struct xs_handle *h, unsigned int *num)
     *num = 2;
     return (char **) &event->path;
 }
+EXPORT_SYMBOL(xs_read_watch);
 
 bool xs_unwatch(struct xs_handle *h, const char *path, const char *token)
 {
     printk("xs_unwatch(%s, %s)\n", path, token);
     return xs_bool(xenbus_unwatch_path_token(XBT_NULL, path, token));
 }
+EXPORT_SYMBOL(xs_unwatch);
 #endif
-- 
2.35.3


