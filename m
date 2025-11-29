Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C709AC93EAB
	for <lists+xen-devel@lfdr.de>; Sat, 29 Nov 2025 14:45:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1175230.1500079 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vPLFb-0003ob-64; Sat, 29 Nov 2025 13:44:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1175230.1500079; Sat, 29 Nov 2025 13:44:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vPLFb-0003m2-1N; Sat, 29 Nov 2025 13:44:35 +0000
Received: by outflank-mailman (input) for mailman id 1175230;
 Sat, 29 Nov 2025 13:44:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=66PA=6F=yandex-team.ru=vsementsov@srs-se1.protection.inumbo.net>)
 id 1vPLFY-0003lw-In
 for xen-devel@lists.xenproject.org; Sat, 29 Nov 2025 13:44:33 +0000
Received: from forwardcorp1d.mail.yandex.net (forwardcorp1d.mail.yandex.net
 [178.154.239.200]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 879beefc-cd29-11f0-9d18-b5c5bf9af7f9;
 Sat, 29 Nov 2025 14:44:30 +0100 (CET)
Received: from mail-nwsmtp-smtp-corp-main-56.klg.yp-c.yandex.net
 (mail-nwsmtp-smtp-corp-main-56.klg.yp-c.yandex.net
 [IPv6:2a02:6b8:c42:65a0:0:640:e1de:0])
 by forwardcorp1d.mail.yandex.net (Yandex) with ESMTPS id 7BD36807C8;
 Sat, 29 Nov 2025 16:44:28 +0300 (MSK)
Received: from vsementsov-lin.. (unknown [2a02:6bf:8080:891::1:b])
 by mail-nwsmtp-smtp-corp-main-56.klg.yp-c.yandex.net (smtpcorp/Yandex) with
 ESMTPSA id Iigm2k0FK8c0-ulXpjbz3; Sat, 29 Nov 2025 16:44:27 +0300
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
X-Inumbo-ID: 879beefc-cd29-11f0-9d18-b5c5bf9af7f9
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
	s=default; t=1764423867;
	bh=LUCSxr52Pv2huLa0fLn9hz38EO3fAzK11cfvmV1Zx1o=;
	h=Message-ID:Date:In-Reply-To:Cc:Subject:References:To:From;
	b=fnN1kUpbAUIbmVpr8z4hs3eb95QPfQMSIrmtOiUfZcBCqWBA53ree1f+qm7BDIGff
	 GMBZkItq/iHyjYMaL7UtmTwwYoW8yuJUp3W2DRqd8uy9x/L4gaQqJ6+Zf7xVuAm7rA
	 gBJeWp/iea8yhHtgJbTB0ze8yFT+wdli48WJX+qo=
Authentication-Results: mail-nwsmtp-smtp-corp-main-56.klg.yp-c.yandex.net; dkim=pass header.i=@yandex-team.ru
From: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
To: marcandre.lureau@redhat.com
Cc: pbonzini@redhat.com,
	qemu-devel@nongnu.org,
	vsementsov@yandex-team.ru,
	d-tatianin@yandex-team.ru,
	Stefano Stabellini <sstabellini@kernel.org>,
	Anthony PERARD <anthony@xenproject.org>,
	Paul Durrant <paul@xen.org>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	xen-devel@lists.xenproject.org (open list:X86 Xen CPUs)
Subject: [PATCH 6/8] chardev: introduce .chr_get_pty_name() handler
Date: Sat, 29 Nov 2025 16:43:46 +0300
Message-ID: <20251129134350.487839-7-vsementsov@yandex-team.ru>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20251129134350.487839-1-vsementsov@yandex-team.ru>
References: <20251129134350.487839-1-vsementsov@yandex-team.ru>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Currently we do two wrong things:

1. Abuse s->filename to get pty_name from it

2. Violate layering with help of CHARDEV_IS_PTY()

Let's get rid of both, and introduce correct way to get pty name in
generic code, if available.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
---
 chardev/char-pty.c     |  7 +++++++
 chardev/char.c         | 19 +++++++++++++------
 hw/char/xen_console.c  |  7 ++++---
 include/chardev/char.h |  7 +++++--
 4 files changed, 29 insertions(+), 11 deletions(-)

diff --git a/chardev/char-pty.c b/chardev/char-pty.c
index a582aa7bc7..047aade09e 100644
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
index 44bfed3627..0dc792b88f 100644
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
index a639fb0b11..7502de46e4 100644
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
diff --git a/include/chardev/char.h b/include/chardev/char.h
index 23a227dca9..d36e50b99e 100644
--- a/include/chardev/char.h
+++ b/include/chardev/char.h
@@ -247,8 +247,6 @@ OBJECT_DECLARE_TYPE(Chardev, ChardevClass, CHARDEV)
 
 #define CHARDEV_IS_RINGBUF(chr) \
     object_dynamic_cast(OBJECT(chr), TYPE_CHARDEV_RINGBUF)
-#define CHARDEV_IS_PTY(chr) \
-    object_dynamic_cast(OBJECT(chr), TYPE_CHARDEV_PTY)
 
 struct ChardevClass {
     ObjectClass parent_class;
@@ -306,6 +304,9 @@ struct ChardevClass {
 
     /* handle various events */
     void (*chr_be_event)(Chardev *s, QEMUChrEvent event);
+
+    /* return PTY name if available */
+    char *(*chr_get_pty_name)(Chardev *s);
 };
 
 Chardev *qemu_chardev_new(const char *id, const char *typename,
@@ -320,4 +321,6 @@ GSource *qemu_chr_timeout_add_ms(Chardev *chr, guint ms,
 void suspend_mux_open(void);
 void resume_mux_open(void);
 
+char *qemu_chr_get_pty_name(Chardev *chr);
+
 #endif
-- 
2.48.1


