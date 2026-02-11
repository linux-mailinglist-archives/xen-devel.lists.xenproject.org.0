Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CBAnJV94jGktpAAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 11 Feb 2026 13:38:55 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 83129124651
	for <lists+xen-devel@lfdr.de>; Wed, 11 Feb 2026 13:38:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1227526.1533934 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vq9UT-0007F7-Fh; Wed, 11 Feb 2026 12:38:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1227526.1533934; Wed, 11 Feb 2026 12:38:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vq9UT-0007C0-Br; Wed, 11 Feb 2026 12:38:45 +0000
Received: by outflank-mailman (input) for mailman id 1227526;
 Wed, 11 Feb 2026 12:38:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UZeC=AP=redhat.com=marcandre.lureau@srs-se1.protection.inumbo.net>)
 id 1vq9N7-0001nh-F2
 for xen-devel@lists.xenproject.org; Wed, 11 Feb 2026 12:31:09 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8a39594c-0745-11f1-b162-2bf370ae4941;
 Wed, 11 Feb 2026 13:31:08 +0100 (CET)
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-45-pzo26kLgOTqOlnqtBd77Iw-1; Wed,
 11 Feb 2026 07:31:04 -0500
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id D4B261800282; Wed, 11 Feb 2026 12:31:01 +0000 (UTC)
Received: from localhost (unknown [10.45.242.6])
 by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 5A08C1956056; Wed, 11 Feb 2026 12:30:59 +0000 (UTC)
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
X-Inumbo-ID: 8a39594c-0745-11f1-b162-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1770813067;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=47+h7KsUk4pIeVRSrl5x3R/+mYPfTcUJPXIJdzZh/Nw=;
	b=MFaYlZbAwjD3Wk5zykf1DRFQ3U3spCBoJv+qMv9A7nwWIJR/q8TFqxVYtsbcOAn2giBMqN
	rRBtNIrO0yZEQ7qc/zukPoOZBAf+9MOHmn4Pa3pTK+DluZ2K2EPVxrwYHAa5y9U6j/GmCI
	995Z6fm+sOu6AYSz1HT8/3xjU/wJqjI=
X-MC-Unique: pzo26kLgOTqOlnqtBd77Iw-1
X-Mimecast-MFC-AGG-ID: pzo26kLgOTqOlnqtBd77Iw_1770813062
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Cc: Eduardo Habkost <eduardo@habkost.net>,
	xen-devel@lists.xenproject.org,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Markus Armbruster <armbru@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	Anthony PERARD <anthony@xenproject.org>,
	Eric Blake <eblake@redhat.com>,
	Samuel Thibault <samuel.thibault@ens-lyon.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Paul Durrant <paul@xen.org>,
	Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
Subject: [PULL 08/14] chardev/char-pty: store pty_name into PtyChardev state
Date: Wed, 11 Feb 2026 16:29:55 +0400
Message-ID: <20260211123007.3569932-9-marcandre.lureau@redhat.com>
In-Reply-To: <20260211123007.3569932-1-marcandre.lureau@redhat.com>
References: <20260211123007.3569932-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17
X-Mimecast-MFC-PROC-ID: vuGF1DX707vTfxUNMgM81DAZPeUC5vI5eVuXPjFZLEo_1770813062
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.32 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[redhat.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[redhat.com:s=mimecast20190719];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[yandex-team.ru:email,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[marcandre.lureau@redhat.com,xen-devel-bounces@lists.xenproject.org];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORGED_RECIPIENTS(0.00)[m:qemu-devel@nongnu.org,m:eduardo@habkost.net,m:xen-devel@lists.xenproject.org,m:berrange@redhat.com,m:edgar.iglesias@gmail.com,m:armbru@redhat.com,m:pbonzini@redhat.com,m:marcandre.lureau@redhat.com,m:anthony@xenproject.org,m:eblake@redhat.com,m:samuel.thibault@ens-lyon.org,m:alex.bennee@linaro.org,m:philmd@linaro.org,m:sstabellini@kernel.org,m:paul@xen.org,m:vsementsov@yandex-team.ru,m:edgariglesias@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	FREEMAIL_CC(0.00)[habkost.net,lists.xenproject.org,redhat.com,gmail.com,xenproject.org,ens-lyon.org,linaro.org,kernel.org,xen.org,yandex-team.ru];
	DKIM_TRACE(0.00)[redhat.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[marcandre.lureau@redhat.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	MISSING_XM_UA(0.00)[];
	FROM_NO_DN(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Queue-Id: 83129124651
X-Rspamd-Action: no action

From: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>

We'll use it in following commit.

Note the bonus: stop use blind strcpy().

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Message-Id: <20260115144606.233252-8-vsementsov@yandex-team.ru>
---
 chardev/char-pty.c | 19 +++++++++----------
 1 file changed, 9 insertions(+), 10 deletions(-)

diff --git a/chardev/char-pty.c b/chardev/char-pty.c
index 9e26e97baf5..a582aa7bc73 100644
--- a/chardev/char-pty.c
+++ b/chardev/char-pty.c
@@ -43,6 +43,7 @@ struct PtyChardev {
     int connected;
     GSource *timer_src;
     char *path;
+    char *pty_name;
 };
 typedef struct PtyChardev PtyChardev;
 
@@ -303,7 +304,7 @@ static void cfmakeraw (struct termios *termios_p)
 #endif
 
 /* like openpty() but also makes it raw; return master fd */
-static int qemu_openpty_raw(int *aslave, char *pty_name)
+static int qemu_openpty_raw(int *aslave, char **pty_name)
 {
     int amaster;
     struct termios tty;
@@ -324,9 +325,7 @@ static int qemu_openpty_raw(int *aslave, char *pty_name)
     cfmakeraw(&tty);
     tcsetattr(*aslave, TCSAFLUSH, &tty);
 
-    if (pty_name) {
-        strcpy(pty_name, q_ptsname(amaster));
-    }
+    *pty_name = g_strdup(q_ptsname(amaster));
 
     return amaster;
 }
@@ -335,11 +334,12 @@ static bool pty_chr_open(Chardev *chr, ChardevBackend *backend, Error **errp)
 {
     PtyChardev *s;
     int master_fd, slave_fd;
-    char pty_name[PATH_MAX];
     char *name;
     char *path = backend->u.pty.data->path;
 
-    master_fd = qemu_openpty_raw(&slave_fd, pty_name);
+    s = PTY_CHARDEV(chr);
+
+    master_fd = qemu_openpty_raw(&slave_fd, &s->pty_name);
     if (master_fd < 0) {
         error_setg_errno(errp, errno, "Failed to create PTY");
         return false;
@@ -351,11 +351,10 @@ static bool pty_chr_open(Chardev *chr, ChardevBackend *backend, Error **errp)
         return false;
     }
 
-    chr->filename = g_strdup_printf("pty:%s", pty_name);
+    chr->filename = g_strdup_printf("pty:%s", s->pty_name);
     qemu_printf("char device redirected to %s (label %s)\n",
-                pty_name, chr->label);
+                s->pty_name, chr->label);
 
-    s = PTY_CHARDEV(chr);
     s->ioc = QIO_CHANNEL(qio_channel_file_new_fd(master_fd));
     name = g_strdup_printf("chardev-pty-%s", chr->label);
     qio_channel_set_name(s->ioc, name);
@@ -364,7 +363,7 @@ static bool pty_chr_open(Chardev *chr, ChardevBackend *backend, Error **errp)
 
     /* create symbolic link */
     if (path) {
-        int res = symlink(pty_name, path);
+        int res = symlink(s->pty_name, path);
 
         if (res != 0) {
             error_setg_errno(errp, errno, "Failed to create PTY symlink");
-- 
2.52.0


