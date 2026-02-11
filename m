Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2Di7AVd4jGktpAAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 11 Feb 2026 13:38:47 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 652BB124641
	for <lists+xen-devel@lfdr.de>; Wed, 11 Feb 2026 13:38:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1227525.1533926 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vq9UM-0006wK-8E; Wed, 11 Feb 2026 12:38:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1227525.1533926; Wed, 11 Feb 2026 12:38:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vq9UM-0006t2-4X; Wed, 11 Feb 2026 12:38:38 +0000
Received: by outflank-mailman (input) for mailman id 1227525;
 Wed, 11 Feb 2026 12:38:37 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UZeC=AP=redhat.com=marcandre.lureau@srs-se1.protection.inumbo.net>)
 id 1vq9NB-00016c-MI
 for xen-devel@lists.xenproject.org; Wed, 11 Feb 2026 12:31:13 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8c0fe2a3-0745-11f1-9ccf-f158ae23cfc8;
 Wed, 11 Feb 2026 13:31:11 +0100 (CET)
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-389-qiGiuxj6PlqMG7wbownoNg-1; Wed,
 11 Feb 2026 07:31:09 -0500
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id A8B1619560A2; Wed, 11 Feb 2026 12:31:07 +0000 (UTC)
Received: from localhost (unknown [10.45.242.6])
 by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 0EFB618004AD; Wed, 11 Feb 2026 12:31:05 +0000 (UTC)
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
X-Inumbo-ID: 8c0fe2a3-0745-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1770813070;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=F4BORkMGuDDVLyTEyiaLb3JWHa0y/2ix01bD3RCQTgw=;
	b=Urc/cFFSlS+0b7lP7P8P7QckX8MoYVAIjTfZ46RWompBfKMUUGKdINzC1obsE9S1nfMx2J
	8QaYKt/dERgVa/McKblivwk6SPDwYDLuMsFJ+9JgQeH+NMcV3z7uITMH9EywWPfGM8OpTM
	nlVTl48spywIkQn0xlxnbdaL3CNdxB0=
X-MC-Unique: qiGiuxj6PlqMG7wbownoNg-1
X-Mimecast-MFC-AGG-ID: qiGiuxj6PlqMG7wbownoNg_1770813067
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
Subject: [PULL 09/14] chardev: introduce .chr_get_pty_name() handler
Date: Wed, 11 Feb 2026 16:29:56 +0400
Message-ID: <20260211123007.3569932-10-marcandre.lureau@redhat.com>
In-Reply-To: <20260211123007.3569932-1-marcandre.lureau@redhat.com>
References: <20260211123007.3569932-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93
X-Mimecast-MFC-PROC-ID: 2wdgSEG2EszoSwDlsMDW-MhjCObKdsC2deyVHNLcFlU_1770813067
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
X-Rspamd-Queue-Id: 652BB124641
X-Rspamd-Action: no action

From: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>

Currently we do two wrong things:

1. Abuse s->filename to get pty_name from it

2. Violate layering with help of CHARDEV_IS_PTY()

Let's get rid of both, and introduce correct way to get pty name in
generic code, if available.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Message-Id: <20260115144606.233252-9-vsementsov@yandex-team.ru>
---
 include/chardev/char.h |  7 +++++--
 chardev/char-pty.c     |  7 +++++++
 chardev/char.c         | 19 +++++++++++++------
 hw/char/xen_console.c  |  7 ++++---
 4 files changed, 29 insertions(+), 11 deletions(-)

diff --git a/include/chardev/char.h b/include/chardev/char.h
index e1bf97222b8..ada5529fa6c 100644
--- a/include/chardev/char.h
+++ b/include/chardev/char.h
@@ -247,8 +247,6 @@ OBJECT_DECLARE_TYPE(Chardev, ChardevClass, CHARDEV)
 
 #define CHARDEV_IS_RINGBUF(chr) \
     object_dynamic_cast(OBJECT(chr), TYPE_CHARDEV_RINGBUF)
-#define CHARDEV_IS_PTY(chr) \
-    object_dynamic_cast(OBJECT(chr), TYPE_CHARDEV_PTY)
 
 struct ChardevClass {
     ObjectClass parent_class;
@@ -308,6 +306,9 @@ struct ChardevClass {
     void (*chr_be_event)(Chardev *s, QEMUChrEvent event);
 
     void (*chr_listener_cleanup)(Chardev *chr);
+
+    /* return PTY name if available */
+    char *(*chr_get_pty_name)(Chardev *s);
 };
 
 Chardev *qemu_chardev_new(const char *id, const char *typename,
@@ -322,4 +323,6 @@ GSource *qemu_chr_timeout_add_ms(Chardev *chr, guint ms,
 void suspend_mux_open(void);
 void resume_mux_open(void);
 
+char *qemu_chr_get_pty_name(Chardev *chr);
+
 #endif
diff --git a/chardev/char-pty.c b/chardev/char-pty.c
index a582aa7bc73..047aade09e5 100644
--- a/chardev/char-pty.c
+++ b/chardev/char-pty.c
@@ -387,6 +387,12 @@ static void pty_chr_parse(QemuOpts *opts, ChardevBackend *backend, Error **errp)
     pty->path = g_strdup(path);
 }
 
+static char *pty_chr_get_pty_name(Chardev *chr)
+{
+    PtyChardev *s = PTY_CHARDEV(chr);
+    return g_strdup(s->pty_name);
+}
+
 static void char_pty_class_init(ObjectClass *oc, const void *data)
 {
     ChardevClass *cc = CHARDEV_CLASS(oc);
@@ -396,6 +402,7 @@ static void char_pty_class_init(ObjectClass *oc, const void *data)
     cc->chr_write = pty_chr_write;
     cc->chr_update_read_handler = pty_chr_update_read_handler;
     cc->chr_add_watch = pty_chr_add_watch;
+    cc->chr_get_pty_name = pty_chr_get_pty_name;
 }
 
 static const TypeInfo char_pty_type_info = {
diff --git a/chardev/char.c b/chardev/char.c
index 44bfed36272..0dc792b88f7 100644
--- a/chardev/char.c
+++ b/chardev/char.c
@@ -1090,9 +1090,7 @@ ChardevReturn *qmp_chardev_add(const char *id, ChardevBackend *backend,
     }
 
     ret = g_new0(ChardevReturn, 1);
-    if (CHARDEV_IS_PTY(chr)) {
-        ret->pty = g_strdup(chr->filename + 4);
-    }
+    ret->pty = qemu_chr_get_pty_name(chr);
 
     return ret;
 
@@ -1101,6 +1099,17 @@ err:
     return NULL;
 }
 
+char *qemu_chr_get_pty_name(Chardev *chr)
+{
+    ChardevClass *cc = CHARDEV_GET_CLASS(chr);
+
+    if (cc->chr_get_pty_name) {
+        return cc->chr_get_pty_name(chr);
+    }
+
+    return NULL;
+}
+
 ChardevReturn *qmp_chardev_change(const char *id, ChardevBackend *backend,
                                   Error **errp)
 {
@@ -1192,9 +1201,7 @@ ChardevReturn *qmp_chardev_change(const char *id, ChardevBackend *backend,
     object_unref(OBJECT(chr_new));
 
     ret = g_new0(ChardevReturn, 1);
-    if (CHARDEV_IS_PTY(chr_new)) {
-        ret->pty = g_strdup(chr_new->filename + 4);
-    }
+    ret->pty = qemu_chr_get_pty_name(chr_new);
 
     return ret;
 }
diff --git a/hw/char/xen_console.c b/hw/char/xen_console.c
index 8ee098d9ad4..bdeb76dc870 100644
--- a/hw/char/xen_console.c
+++ b/hw/char/xen_console.c
@@ -418,6 +418,7 @@ static void xen_console_realize(XenDevice *xendev, Error **errp)
     XenConsole *con = XEN_CONSOLE_DEVICE(xendev);
     Chardev *cs = qemu_chr_fe_get_driver(&con->chr);
     unsigned int u;
+    g_autofree char *pty_name = NULL;
 
     if (!cs) {
         error_setg(errp, "no backing character device");
@@ -450,9 +451,9 @@ static void xen_console_realize(XenDevice *xendev, Error **errp)
 
     trace_xen_console_realize(con->dev, object_get_typename(OBJECT(cs)));
 
-    if (CHARDEV_IS_PTY(cs)) {
-        /* Strip the leading 'pty:' */
-        xen_device_frontend_printf(xendev, "tty", "%s", cs->filename + 4);
+    pty_name = qemu_chr_get_pty_name(cs);
+    if (pty_name) {
+        xen_device_frontend_printf(xendev, "tty", "%s", pty_name);
     }
 
     /* No normal PV driver initialization for the primary console under Xen */
-- 
2.52.0


