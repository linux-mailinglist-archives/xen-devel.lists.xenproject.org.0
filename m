Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 7LrfJqj1jmnbGAEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 13 Feb 2026 10:58:00 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EEAD134C39
	for <lists+xen-devel@lfdr.de>; Fri, 13 Feb 2026 10:58:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1230483.1535985 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vqpvY-0007BC-Ox; Fri, 13 Feb 2026 09:57:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1230483.1535985; Fri, 13 Feb 2026 09:57:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vqpvY-00078N-L1; Fri, 13 Feb 2026 09:57:32 +0000
Received: by outflank-mailman (input) for mailman id 1230483;
 Fri, 13 Feb 2026 09:57:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Bqff=AR=redhat.com=marcandre.lureau@srs-se1.protection.inumbo.net>)
 id 1vqpog-0001Ng-Bm
 for xen-devel@lists.xenproject.org; Fri, 13 Feb 2026 09:50:26 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 68947748-08c1-11f1-9ccf-f158ae23cfc8;
 Fri, 13 Feb 2026 10:50:21 +0100 (CET)
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-36-txG-vcI2NLC0ek1FXKCV6A-1; Fri,
 13 Feb 2026 04:50:15 -0500
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 4D33B18ADBC0; Fri, 13 Feb 2026 09:50:10 +0000 (UTC)
Received: from localhost (unknown [10.44.22.41])
 by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 51E2419560B9; Fri, 13 Feb 2026 09:50:09 +0000 (UTC)
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
X-Inumbo-ID: 68947748-08c1-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1770976219;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=47+h7KsUk4pIeVRSrl5x3R/+mYPfTcUJPXIJdzZh/Nw=;
	b=Gmrwr6LovzbEz24zQ/+0phBuxED7DWZGdMryrf7D1jFzzdc4hvv0mE7KBkYXzKAsp99n/S
	OIDFYqABl09F6bB3UlMCdiEX1hQ2KGLzyk3KxgBBiMcDrXcx2gXzxsGYlmi+ncRd8FLDVT
	aMYVOQTWSzlagpUOHt7TbjW0ITpSxvk=
X-MC-Unique: txG-vcI2NLC0ek1FXKCV6A-1
X-Mimecast-MFC-AGG-ID: txG-vcI2NLC0ek1FXKCV6A_1770976213
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	Eric Blake <eblake@redhat.com>,
	Markus Armbruster <armbru@redhat.com>,
	Paul Durrant <paul@xen.org>,
	Anthony PERARD <anthony@xenproject.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Eduardo Habkost <eduardo@habkost.net>,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	xen-devel@lists.xenproject.org,
	Samuel Thibault <samuel.thibault@ens-lyon.org>,
	Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
Subject: [PULL v2 08/15] chardev/char-pty: store pty_name into PtyChardev state
Date: Fri, 13 Feb 2026 10:49:27 +0100
Message-ID: <20260213094938.4074478-9-marcandre.lureau@redhat.com>
In-Reply-To: <20260213094938.4074478-1-marcandre.lureau@redhat.com>
References: <20260213094938.4074478-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
X-Mimecast-MFC-PROC-ID: Y8-80kxtKYmgd9d1QoiaeAHp1_MGiqZ_VzPITehyhrQ_1770976213
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[redhat.com,quarantine];
	R_DKIM_ALLOW(-0.20)[redhat.com:s=mimecast20190719];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:qemu-devel@nongnu.org,m:alex.bennee@linaro.org,m:edgar.iglesias@gmail.com,m:berrange@redhat.com,m:eblake@redhat.com,m:armbru@redhat.com,m:paul@xen.org,m:anthony@xenproject.org,m:philmd@linaro.org,m:eduardo@habkost.net,m:pbonzini@redhat.com,m:marcandre.lureau@redhat.com,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,m:samuel.thibault@ens-lyon.org,m:vsementsov@yandex-team.ru,m:edgariglesias@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[marcandre.lureau@redhat.com,xen-devel-bounces@lists.xenproject.org];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[mailman];
	FREEMAIL_CC(0.00)[linaro.org,gmail.com,redhat.com,xen.org,xenproject.org,habkost.net,kernel.org,lists.xenproject.org,ens-lyon.org,yandex-team.ru];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[redhat.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[marcandre.lureau@redhat.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FROM_NO_DN(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Queue-Id: 3EEAD134C39
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


