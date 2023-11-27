Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 77EC17F9DA1
	for <lists+xen-devel@lfdr.de>; Mon, 27 Nov 2023 11:36:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.641781.1000670 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r7YyG-0000fL-Rv; Mon, 27 Nov 2023 10:36:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 641781.1000670; Mon, 27 Nov 2023 10:36:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r7YyG-0000aj-Lc; Mon, 27 Nov 2023 10:36:08 +0000
Received: by outflank-mailman (input) for mailman id 641781;
 Mon, 27 Nov 2023 10:36:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=gVlU=HI=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1r7YqA-0000Co-0Y
 for xen-devel@lists.xenproject.org; Mon, 27 Nov 2023 10:27:46 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 99cccf65-8d0f-11ee-98e2-6d05b1d4d9a1;
 Mon, 27 Nov 2023 11:27:44 +0100 (CET)
Received: from imap2.dmz-prg2.suse.org (imap2.dmz-prg2.suse.org [10.150.64.98])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id B2EE421B08;
 Mon, 27 Nov 2023 10:27:43 +0000 (UTC)
Received: from imap2.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap2.dmz-prg2.suse.org (Postfix) with ESMTPS id 8A4A1132A6;
 Mon, 27 Nov 2023 10:27:43 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap2.dmz-prg2.suse.org with ESMTPSA id hYaCIB9vZGUmfwAAn2gu4w
 (envelope-from <jgross@suse.com>); Mon, 27 Nov 2023 10:27:43 +0000
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
X-Inumbo-ID: 99cccf65-8d0f-11ee-98e2-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1701080863; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=A7Ph8EWiRNQhlaHcJX8OV0y/unaxE1ONICuU8ZiL5cc=;
	b=GclHgrD36WDf97KrAwi5GUh8+rXIDW/NWEeCTFfbEVlXi9uJPdb14UyOOY93daE0qnEgvA
	2s6hh+mVx8fKEMk5opg6E+wxo3N/C91GI3HGGjLz+M/i3LN6OENUOwIr4CR8hkdtDFxoHo
	+sDupZHiSMZCEGxNlcqH5nrrpy/Ku8E=
From: Juergen Gross <jgross@suse.com>
To: minios-devel@lists.xenproject.org,
	xen-devel@lists.xenproject.org
Cc: samuel.thibault@ens-lyon.org,
	wl@xen.org,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH v3 25/32] Mini-OS: add EXPORT_SYMBOL() instances to fbfront.c
Date: Mon, 27 Nov 2023 11:25:16 +0100
Message-Id: <20231127102523.28003-26-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20231127102523.28003-1-jgross@suse.com>
References: <20231127102523.28003-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Authentication-Results: smtp-out1.suse.de;
	none
X-Spam-Level: ************
X-Spam-Score: 12.14
X-Spamd-Result: default: False [12.14 / 50.00];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 BAYES_SPAM(0.74)[78.58%];
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

Add the needed instances of EXPORT_SYMBOL() to fbfront.c.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
V3:
- new patch
---
 fbfront.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/fbfront.c b/fbfront.c
index 1b67f527..d4e28d0c 100644
--- a/fbfront.c
+++ b/fbfront.c
@@ -201,6 +201,7 @@ error:
     free_kbdfront(dev);
     return NULL;
 }
+EXPORT_SYMBOL(init_kbdfront);
 
 int kbdfront_receive(struct kbdfront_dev *dev, union xenkbd_in_event *buf, int n)
 {
@@ -239,7 +240,7 @@ int kbdfront_receive(struct kbdfront_dev *dev, union xenkbd_in_event *buf, int n
 
     return i;
 }
-
+EXPORT_SYMBOL(kbdfront_receive);
 
 void shutdown_kbdfront(struct kbdfront_dev *dev)
 {
@@ -301,6 +302,7 @@ close_kbdfront:
     if (!err)
         free_kbdfront(dev);
 }
+EXPORT_SYMBOL(shutdown_kbdfront);
 
 #ifdef HAVE_LIBC
 static int kbd_read(struct file *file, void *buf, size_t nbytes)
@@ -351,6 +353,7 @@ int kbdfront_open(struct kbdfront_dev *dev)
 
     return dev->fd;
 }
+EXPORT_SYMBOL(kbdfront_open);
 #endif
 
 
@@ -451,6 +454,7 @@ int fbfront_receive(struct fbfront_dev *dev, union xenfb_in_event *buf, int n)
 
     return i;
 }
+EXPORT_SYMBOL(fbfront_receive);
 
 struct fbfront_dev *init_fbfront(char *_nodename, unsigned long *mfns, int width, int height, int depth, int stride, int n)
 {
@@ -617,6 +621,7 @@ error:
     free_fbfront(dev);
     return NULL;
 }
+EXPORT_SYMBOL(init_fbfront);
 
 static void fbfront_out_event(struct fbfront_dev *dev, union xenfb_out_event *event)
 {
@@ -668,6 +673,7 @@ void fbfront_update(struct fbfront_dev *dev, int x, int y, int width, int height
     update.height = height;
     fbfront_out_event(dev, (union xenfb_out_event *) &update);
 }
+EXPORT_SYMBOL(fbfront_update);
 
 void fbfront_resize(struct fbfront_dev *dev, int width, int height, int stride, int depth, int offset)
 {
@@ -681,6 +687,7 @@ void fbfront_resize(struct fbfront_dev *dev, int width, int height, int stride,
     dev->offset = resize.offset = offset;
     fbfront_out_event(dev, (union xenfb_out_event *) &resize);
 }
+EXPORT_SYMBOL(fbfront_resize);
 
 void shutdown_fbfront(struct fbfront_dev *dev)
 {
@@ -745,6 +752,7 @@ close_fbfront:
     if (!err)
         free_fbfront(dev);
 }
+EXPORT_SYMBOL(shutdown_fbfront);
 
 #ifdef HAVE_LIBC
 static int fbfront_read(struct file *file, void *buf, size_t nbytes)
@@ -794,5 +802,6 @@ int fbfront_open(struct fbfront_dev *dev)
     file->dev = dev;
     return dev->fd;
 }
+EXPORT_SYMBOL(fbfront_open);
 #endif
 
-- 
2.35.3


