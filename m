Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id asHZEIx2jGktpAAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 11 Feb 2026 13:31:08 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CEA8B124373
	for <lists+xen-devel@lfdr.de>; Wed, 11 Feb 2026 13:31:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1227474.1533895 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vq9Mx-00047w-Qw; Wed, 11 Feb 2026 12:30:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1227474.1533895; Wed, 11 Feb 2026 12:30:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vq9Mx-00045o-LN; Wed, 11 Feb 2026 12:30:59 +0000
Received: by outflank-mailman (input) for mailman id 1227474;
 Wed, 11 Feb 2026 12:30:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UZeC=AP=redhat.com=marcandre.lureau@srs-se1.protection.inumbo.net>)
 id 1vq9Mw-0001nh-8g
 for xen-devel@lists.xenproject.org; Wed, 11 Feb 2026 12:30:58 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 83363f0b-0745-11f1-b162-2bf370ae4941;
 Wed, 11 Feb 2026 13:30:57 +0100 (CET)
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-210-8dzO44fAOkO8hgNBHIWcLA-1; Wed,
 11 Feb 2026 07:30:51 -0500
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id D574E18005BC; Wed, 11 Feb 2026 12:30:49 +0000 (UTC)
Received: from localhost (unknown [10.45.242.6])
 by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 4E1B21800465; Wed, 11 Feb 2026 12:30:47 +0000 (UTC)
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
X-Inumbo-ID: 83363f0b-0745-11f1-b162-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1770813055;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ARe11uBwUQtZK+r/LyMwdLX8qnRbouC5icUkGH7AqSA=;
	b=CTbha19rja44F9ru+Y6n2Oiyosw09I7YcgzswvgrKlE2AuVm405d25tB7PrisxL33/zLJA
	lqSDHSe7RQfhW9iMmbj9kbMgsl3cnZrLEmA3QBZjyqajB4Yd+fnBLYbKrclJEmqbUSNC+t
	EnQ9ieyn0ZWPnTf8eRbIfymOJEX1Tuw=
X-MC-Unique: 8dzO44fAOkO8hgNBHIWcLA-1
X-Mimecast-MFC-AGG-ID: 8dzO44fAOkO8hgNBHIWcLA_1770813050
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
Subject: [PULL 06/14] chardev: .chr_open(): drop be_opened parameter
Date: Wed, 11 Feb 2026 16:29:53 +0400
Message-ID: <20260211123007.3569932-7-marcandre.lureau@redhat.com>
In-Reply-To: <20260211123007.3569932-1-marcandre.lureau@redhat.com>
References: <20260211123007.3569932-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111
X-Mimecast-MFC-PROC-ID: t0wGx4rLtFIMFGMXuZWD0ARFACVZCwh6a53Wk7oPHEc_1770813050
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,yandex-team.ru:email];
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
X-Rspamd-Queue-Id: CEA8B124373
X-Rspamd-Action: no action

From: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>

The logic around the parameter is rather tricky. Let's instead
explicitly send CHR_EVENT_OPENED in all backends where needed.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
[ Marc-André - add CHR_EVENT_OPENED in udp_chr_open() ]
Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Message-Id: <20260115144606.233252-6-vsementsov@yandex-team.ru>
---
 include/chardev/char.h   |  3 +--
 chardev/baum.c           |  7 +++----
 chardev/char-console.c   |  5 ++---
 chardev/char-file.c      |  7 +++----
 chardev/char-hub.c       | 11 +++++------
 chardev/char-mux.c       | 19 +++++++++++--------
 chardev/char-null.c      |  7 ++-----
 chardev/char-parallel.c  | 15 ++++-----------
 chardev/char-pipe.c      | 14 ++++++--------
 chardev/char-pty.c       |  6 +-----
 chardev/char-ringbuf.c   |  3 ++-
 chardev/char-serial.c    | 18 +++++++++---------
 chardev/char-socket.c    | 10 +++-------
 chardev/char-stdio.c     |  7 +++----
 chardev/char-udp.c       |  6 ++----
 chardev/char-win-stdio.c |  2 +-
 chardev/char.c           | 11 +++--------
 chardev/msmouse.c        |  4 ++--
 chardev/spice.c          | 10 ++--------
 chardev/wctablet.c       |  5 ++---
 gdbstub/system.c         |  5 ++---
 ui/console-vc.c          |  7 ++-----
 ui/dbus-chardev.c        |  6 ++----
 ui/gtk.c                 |  9 +++------
 ui/spice-app.c           | 10 +++-------
 ui/vdagent.c             |  3 +--
 26 files changed, 80 insertions(+), 130 deletions(-)

diff --git a/include/chardev/char.h b/include/chardev/char.h
index d33833b6c02..aa42e01b8a3 100644
--- a/include/chardev/char.h
+++ b/include/chardev/char.h
@@ -260,8 +260,7 @@ struct ChardevClass {
     void (*chr_parse)(QemuOpts *opts, ChardevBackend *backend, Error **errp);
 
     /* called after construction, open/starts the backend */
-    void (*chr_open)(Chardev *chr, ChardevBackend *backend,
-                 bool *be_opened, Error **errp);
+    void (*chr_open)(Chardev *chr, ChardevBackend *backend, Error **errp);
 
     /* write buf to the backend */
     int (*chr_write)(Chardev *s, const uint8_t *buf, int len);
diff --git a/chardev/baum.c b/chardev/baum.c
index 75e41965c11..4b97d630ffb 100644
--- a/chardev/baum.c
+++ b/chardev/baum.c
@@ -642,10 +642,7 @@ static void char_braille_finalize(Object *obj)
     }
 }
 
-static void baum_chr_open(Chardev *chr,
-                          ChardevBackend *backend,
-                          bool *be_opened,
-                          Error **errp)
+static void baum_chr_open(Chardev *chr, ChardevBackend *backend, Error **errp)
 {
     BaumChardev *baum = BAUM_CHARDEV(chr);
     brlapi_handle_t *handle;
@@ -670,6 +667,8 @@ static void baum_chr_open(Chardev *chr,
      * as an integer, but in practice it seems to work
      */
     qemu_set_fd_handler(baum->brlapi_fd, baum_chr_read, NULL, baum);
+
+    qemu_chr_be_event(chr, CHR_EVENT_OPENED);
 }
 
 static void char_braille_class_init(ObjectClass *oc, const void *data)
diff --git a/chardev/char-console.c b/chardev/char-console.c
index f3ef1a7748c..423f0f4cc4e 100644
--- a/chardev/char-console.c
+++ b/chardev/char-console.c
@@ -26,12 +26,11 @@
 #include "chardev/char-win.h"
 #include "qemu/module.h"
 
-static void console_chr_open(Chardev *chr,
-                             ChardevBackend *backend,
-                             bool *be_opened,
+static void console_chr_open(Chardev *chr, ChardevBackend *backend,
                              Error **errp)
 {
     win_chr_set_file(chr, GetStdHandle(STD_OUTPUT_HANDLE), true);
+    qemu_chr_be_event(chr, CHR_EVENT_OPENED);
 }
 
 static void char_console_class_init(ObjectClass *oc, const void *data)
diff --git a/chardev/char-file.c b/chardev/char-file.c
index 568600bb7c4..34ef386abc5 100644
--- a/chardev/char-file.c
+++ b/chardev/char-file.c
@@ -34,10 +34,7 @@
 #include "chardev/char-fd.h"
 #endif
 
-static void file_chr_open(Chardev *chr,
-                          ChardevBackend *backend,
-                          bool *be_opened,
-                          Error **errp)
+static void file_chr_open(Chardev *chr, ChardevBackend *backend, Error **errp)
 {
     ChardevFile *file = backend->u.file.data;
 #ifdef _WIN32
@@ -100,6 +97,8 @@ static void file_chr_open(Chardev *chr,
         return;
     }
 #endif
+
+    qemu_chr_be_event(chr, CHR_EVENT_OPENED);
 }
 
 static void file_chr_parse(QemuOpts *opts, ChardevBackend *backend,
diff --git a/chardev/char-hub.c b/chardev/char-hub.c
index 11556dfa72b..aa6058c2f6f 100644
--- a/chardev/char-hub.c
+++ b/chardev/char-hub.c
@@ -203,10 +203,7 @@ static void hub_chr_update_read_handlers(Chardev *chr)
     }
 }
 
-static void hub_chr_open(Chardev *chr,
-                         ChardevBackend *backend,
-                         bool *be_opened,
-                         Error **errp)
+static void hub_chr_open(Chardev *chr, ChardevBackend *backend, Error **errp)
 {
     ChardevHub *hub = backend->u.hub.data;
     HubChardev *d = HUB_CHARDEV(chr);
@@ -241,8 +238,10 @@ static void hub_chr_open(Chardev *chr,
         list = list->next;
     }
 
-    /* Closed until an explicit event from backend */
-    *be_opened = false;
+    /*
+     * Closed until an explicit event from backend, so we don't
+     * send CHR_EVENT_OPENED now.
+     */
 }
 
 static void hub_chr_parse(QemuOpts *opts, ChardevBackend *backend, Error **errp)
diff --git a/chardev/char-mux.c b/chardev/char-mux.c
index f38d66b21f1..7210df431fc 100644
--- a/chardev/char-mux.c
+++ b/chardev/char-mux.c
@@ -361,10 +361,7 @@ void mux_set_focus(Chardev *chr, unsigned int focus)
     mux_chr_send_event(d, d->focus, CHR_EVENT_MUX_IN);
 }
 
-static void mux_chr_open(Chardev *chr,
-                         ChardevBackend *backend,
-                         bool *be_opened,
-                         Error **errp)
+static void mux_chr_open(Chardev *chr, ChardevBackend *backend, Error **errp)
 {
     ChardevMux *mux = backend->u.mux.data;
     Chardev *drv;
@@ -377,11 +374,17 @@ static void mux_chr_open(Chardev *chr,
     }
 
     d->focus = -1;
-    /* only default to opened state if we've realized the initial
-     * set of muxes
+    if (!qemu_chr_fe_init(&d->chr, drv, errp)) {
+        return;
+    }
+
+    /*
+     * Only move to opened state if we've realized
+     * the initial set of muxes:
      */
-    *be_opened = muxes_opened;
-    qemu_chr_fe_init(&d->chr, drv, errp);
+    if (muxes_opened) {
+        qemu_chr_be_event(chr, CHR_EVENT_OPENED);
+    }
 }
 
 static void mux_chr_parse(QemuOpts *opts, ChardevBackend *backend, Error **errp)
diff --git a/chardev/char-null.c b/chardev/char-null.c
index 674603b3807..900b5febb6c 100644
--- a/chardev/char-null.c
+++ b/chardev/char-null.c
@@ -26,12 +26,9 @@
 #include "chardev/char.h"
 #include "qemu/module.h"
 
-static void null_chr_open(Chardev *chr,
-                          ChardevBackend *backend,
-                          bool *be_opened,
-                          Error **errp)
+static void null_chr_open(Chardev *chr, ChardevBackend *backend, Error **errp)
 {
-    *be_opened = false;
+    /* do not send CHR_EVENT_OPENED */
 }
 
 static void char_null_class_init(ObjectClass *oc, const void *data)
diff --git a/chardev/char-parallel.c b/chardev/char-parallel.c
index 1be1ef46292..359efa3c9c8 100644
--- a/chardev/char-parallel.c
+++ b/chardev/char-parallel.c
@@ -157,10 +157,7 @@ static int parallel_chr_ioctl(Chardev *chr, int cmd, void *arg)
     return 0;
 }
 
-static void parallel_chr_open_fd(Chardev *chr,
-                                int fd,
-                                bool *be_opened,
-                                Error **errp)
+static void parallel_chr_open_fd(Chardev *chr, int fd, Error **errp)
 {
     ParallelChardev *drv = PARALLEL_CHARDEV(chr);
 
@@ -172,6 +169,7 @@ static void parallel_chr_open_fd(Chardev *chr,
     }
 
     drv->mode = IEEE1284_MODE_COMPAT;
+    qemu_chr_be_event(chr, CHR_EVENT_OPENED);
 }
 #endif /* __linux__ */
 
@@ -227,21 +225,16 @@ static int parallel_chr_ioctl(Chardev *chr, int cmd, void *arg)
     return 0;
 }
 
-static void parallel_chr_open_fd(Chardev *chr,
-                                int fd,
-                                bool *be_opened,
-                                Error **errp)
+static void parallel_chr_open_fd(Chardev *chr, int fd, Error **errp)
 {
     ParallelChardev *drv = PARALLEL_CHARDEV(chr);
     drv->fd = fd;
-    *be_opened = false;
 }
 #endif
 
 #ifdef HAVE_CHARDEV_PARALLEL
 static void parallel_chr_open(Chardev *chr,
                               ChardevBackend *backend,
-                              bool *be_opened,
                               Error **errp)
 {
     ChardevHostdev *parallel = backend->u.parallel.data;
@@ -251,7 +244,7 @@ static void parallel_chr_open(Chardev *chr,
     if (fd < 0) {
         return;
     }
-    parallel_chr_open_fd(chr, fd, be_opened, errp);
+    parallel_chr_open_fd(chr, fd, errp);
 }
 
 static void parallel_chr_parse(QemuOpts *opts, ChardevBackend *backend,
diff --git a/chardev/char-pipe.c b/chardev/char-pipe.c
index e84492d42b6..2f26372dfc9 100644
--- a/chardev/char-pipe.c
+++ b/chardev/char-pipe.c
@@ -103,10 +103,7 @@ static int win_chr_pipe_init(Chardev *chr, const char *filename,
     return -1;
 }
 
-static void pipe_chr_open(Chardev *chr,
-                          ChardevBackend *backend,
-                          bool *be_opened,
-                          Error **errp)
+static void pipe_chr_open(Chardev *chr, ChardevBackend *backend, Error **errp)
 {
     ChardevHostdev *opts = backend->u.pipe.data;
     const char *filename = opts->device;
@@ -114,14 +111,13 @@ static void pipe_chr_open(Chardev *chr,
     if (win_chr_pipe_init(chr, filename, errp) < 0) {
         return;
     }
+
+    qemu_chr_be_event(chr, CHR_EVENT_OPENED);
 }
 
 #else
 
-static void pipe_chr_open(Chardev *chr,
-                          ChardevBackend *backend,
-                          bool *be_opened,
-                          Error **errp)
+static void pipe_chr_open(Chardev *chr, ChardevBackend *backend, Error **errp)
 {
     ChardevHostdev *opts = backend->u.pipe.data;
     int fd_in, fd_out;
@@ -158,6 +154,8 @@ static void pipe_chr_open(Chardev *chr,
         }
         return;
     }
+
+    qemu_chr_be_event(chr, CHR_EVENT_OPENED);
 }
 
 #endif /* !_WIN32 */
diff --git a/chardev/char-pty.c b/chardev/char-pty.c
index 909ab01f5f2..d4d69a29a95 100644
--- a/chardev/char-pty.c
+++ b/chardev/char-pty.c
@@ -331,10 +331,7 @@ static int qemu_openpty_raw(int *aslave, char *pty_name)
     return amaster;
 }
 
-static void pty_chr_open(Chardev *chr,
-                         ChardevBackend *backend,
-                         bool *be_opened,
-                         Error **errp)
+static void pty_chr_open(Chardev *chr, ChardevBackend *backend, Error **errp)
 {
     PtyChardev *s;
     int master_fd, slave_fd;
@@ -364,7 +361,6 @@ static void pty_chr_open(Chardev *chr,
     qio_channel_set_name(s->ioc, name);
     g_free(name);
     s->timer_src = NULL;
-    *be_opened = false;
 
     /* create symbolic link */
     if (path) {
diff --git a/chardev/char-ringbuf.c b/chardev/char-ringbuf.c
index 19652fe2b3a..30b17a96d3a 100644
--- a/chardev/char-ringbuf.c
+++ b/chardev/char-ringbuf.c
@@ -94,7 +94,6 @@ static void char_ringbuf_finalize(Object *obj)
 
 static void ringbuf_chr_open(Chardev *chr,
                              ChardevBackend *backend,
-                             bool *be_opened,
                              Error **errp)
 {
     ChardevRingbuf *opts = backend->u.ringbuf.data;
@@ -111,6 +110,8 @@ static void ringbuf_chr_open(Chardev *chr,
     d->prod = 0;
     d->cons = 0;
     d->cbuf = g_malloc0(d->size);
+
+    qemu_chr_be_event(chr, CHR_EVENT_OPENED);
 }
 
 void qmp_ringbuf_write(const char *device, const char *data,
diff --git a/chardev/char-serial.c b/chardev/char-serial.c
index 54c2b3935cf..9995f184258 100644
--- a/chardev/char-serial.c
+++ b/chardev/char-serial.c
@@ -41,14 +41,15 @@
 
 #ifdef _WIN32
 
-static void serial_chr_open(Chardev *chr,
-                            ChardevBackend *backend,
-                            bool *be_opened,
-                            Error **errp)
+static void serial_chr_open(Chardev *chr, ChardevBackend *backend, Error **errp)
 {
     ChardevHostdev *serial = backend->u.serial.data;
+    int ret = win_chr_serial_init(chr, serial->device, errp);
+    if (ret < 0) {
+        return;
+    }
 
-    win_chr_serial_init(chr, serial->device, errp);
+    qemu_chr_be_event(chr, CHR_EVENT_OPENED);
 }
 
 #elif defined(__linux__) || defined(__sun__) || defined(__FreeBSD__)      \
@@ -258,10 +259,7 @@ static int serial_chr_ioctl(Chardev *chr, int cmd, void *arg)
     return 0;
 }
 
-static void serial_chr_open(Chardev *chr,
-                            ChardevBackend *backend,
-                            bool *be_opened,
-                            Error **errp)
+static void serial_chr_open(Chardev *chr, ChardevBackend *backend, Error **errp)
 {
     ChardevHostdev *serial = backend->u.serial.data;
     int fd;
@@ -281,6 +279,8 @@ static void serial_chr_open(Chardev *chr,
         close(fd);
         return;
     }
+
+    qemu_chr_be_event(chr, CHR_EVENT_OPENED);
 }
 #endif /* __linux__ || __sun__ */
 
diff --git a/chardev/char-socket.c b/chardev/char-socket.c
index a3203f2f97b..2951b2ec9be 100644
--- a/chardev/char-socket.c
+++ b/chardev/char-socket.c
@@ -1365,10 +1365,7 @@ static bool qmp_chardev_validate_socket(ChardevSocket *sock,
 }
 
 
-static void tcp_chr_open(Chardev *chr,
-                         ChardevBackend *backend,
-                         bool *be_opened,
-                         Error **errp)
+static void tcp_chr_open(Chardev *chr, ChardevBackend *backend, Error **errp)
 {
     SocketChardev *s = SOCKET_CHARDEV(chr);
     ChardevSocket *sock = backend->u.socket.data;
@@ -1439,9 +1436,6 @@ static void tcp_chr_open(Chardev *chr,
     }
     s->registered_yank = true;
 
-    /* be isn't opened until we get a connection */
-    *be_opened = false;
-
     update_disconnected_filename(s);
 
     if (s->is_listen) {
@@ -1454,6 +1448,8 @@ static void tcp_chr_open(Chardev *chr,
             return;
         }
     }
+
+    /* be isn't opened until we get a connection */
 }
 
 static void tcp_chr_parse(QemuOpts *opts, ChardevBackend *backend, Error **errp)
diff --git a/chardev/char-stdio.c b/chardev/char-stdio.c
index f0920a23faa..534f6ed5658 100644
--- a/chardev/char-stdio.c
+++ b/chardev/char-stdio.c
@@ -85,10 +85,7 @@ static void term_stdio_handler(int sig)
     stdio_chr_set_echo(NULL, stdio_echo_state);
 }
 
-static void stdio_chr_open(Chardev *chr,
-                           ChardevBackend *backend,
-                           bool *be_opened,
-                           Error **errp)
+static void stdio_chr_open(Chardev *chr, ChardevBackend *backend, Error **errp)
 {
     ChardevStdio *opts = backend->u.stdio.data;
     struct sigaction act;
@@ -123,6 +120,8 @@ static void stdio_chr_open(Chardev *chr,
 
     stdio_allow_signal = !opts->has_signal || opts->signal;
     stdio_chr_set_echo(chr, false);
+
+    qemu_chr_be_event(chr, CHR_EVENT_OPENED);
 }
 #endif
 
diff --git a/chardev/char-udp.c b/chardev/char-udp.c
index 18f4322408a..4c81c95e656 100644
--- a/chardev/char-udp.c
+++ b/chardev/char-udp.c
@@ -188,10 +188,7 @@ static void udp_chr_parse(QemuOpts *opts, ChardevBackend *backend, Error **errp)
     }
 }
 
-static void upd_chr_open(Chardev *chr,
-                         ChardevBackend *backend,
-                         bool *be_opened,
-                         Error **errp)
+static void upd_chr_open(Chardev *chr, ChardevBackend *backend, Error **errp)
 {
     ChardevUdp *udp = backend->u.udp.data;
     SocketAddress *local_addr = socket_address_flatten(udp->local);
@@ -214,6 +211,7 @@ static void upd_chr_open(Chardev *chr,
     g_free(name);
 
     s->ioc = QIO_CHANNEL(sioc);
+    qemu_chr_be_event(chr, CHR_EVENT_OPENED);
 }
 
 static void char_udp_class_init(ObjectClass *oc, const void *data)
diff --git a/chardev/char-win-stdio.c b/chardev/char-win-stdio.c
index 866f3a20398..0535960ff1b 100644
--- a/chardev/char-win-stdio.c
+++ b/chardev/char-win-stdio.c
@@ -144,7 +144,6 @@ static void win_stiod_chr_set_echo(Chardev *chr, bool echo)
 
 static void win_stdio_chr_open(Chardev *chr,
                                ChardevBackend *backend,
-                               bool *be_opened,
                                Error **errp)
 {
     ChardevStdio *opts = backend->u.stdio.data;
@@ -208,6 +207,7 @@ static void win_stdio_chr_open(Chardev *chr,
 
     win_stiod_chr_set_echo(chr, false);
 
+    qemu_chr_be_event(chr, CHR_EVENT_OPENED);
     return;
 
 err3:
diff --git a/chardev/char.c b/chardev/char.c
index df37d1df161..44bfed36272 100644
--- a/chardev/char.c
+++ b/chardev/char.c
@@ -246,8 +246,7 @@ int qemu_chr_add_client(Chardev *s, int fd)
         CHARDEV_GET_CLASS(s)->chr_add_client(s, fd) : -1;
 }
 
-static void qemu_char_open(Chardev *chr, ChardevBackend *backend,
-                           bool *be_opened, Error **errp)
+static void qemu_char_open(Chardev *chr, ChardevBackend *backend, Error **errp)
 {
     ChardevClass *cc = CHARDEV_GET_CLASS(chr);
     /* Any ChardevCommon member would work */
@@ -268,7 +267,7 @@ static void qemu_char_open(Chardev *chr, ChardevBackend *backend,
     }
 
     if (cc->chr_open) {
-        cc->chr_open(chr, backend, be_opened, errp);
+        cc->chr_open(chr, backend, errp);
     }
 }
 
@@ -1009,7 +1008,6 @@ static Chardev *chardev_new(const char *id, const char *typename,
     Object *obj;
     Chardev *chr = NULL;
     Error *local_err = NULL;
-    bool be_opened = true;
 
     assert(g_str_has_prefix(typename, "chardev-"));
     assert(id);
@@ -1020,7 +1018,7 @@ static Chardev *chardev_new(const char *id, const char *typename,
     chr->label = g_strdup(id);
     chr->gcontext = gcontext;
 
-    qemu_char_open(chr, backend, &be_opened, &local_err);
+    qemu_char_open(chr, backend, &local_err);
     if (local_err) {
         error_propagate(errp, local_err);
         object_unref(obj);
@@ -1030,9 +1028,6 @@ static Chardev *chardev_new(const char *id, const char *typename,
     if (!chr->filename) {
         chr->filename = g_strdup(typename + 8);
     }
-    if (be_opened) {
-        qemu_chr_be_event(chr, CHR_EVENT_OPENED);
-    }
 
     return chr;
 }
diff --git a/chardev/msmouse.c b/chardev/msmouse.c
index d07cd998cb5..9dc04e3b3ec 100644
--- a/chardev/msmouse.c
+++ b/chardev/msmouse.c
@@ -255,16 +255,16 @@ static void char_msmouse_finalize(Object *obj)
 
 static void msmouse_chr_open(Chardev *chr,
                              ChardevBackend *backend,
-                             bool *be_opened,
                              Error **errp)
 {
     MouseChardev *mouse = MOUSE_CHARDEV(chr);
 
-    *be_opened = false;
     mouse->hs = qemu_input_handler_register((DeviceState *)mouse,
                                             &msmouse_handler);
     mouse->tiocm = 0;
     fifo8_create(&mouse->outbuf, MSMOUSE_BUF_SZ);
+
+    /* Never send CHR_EVENT_OPENED */
 }
 
 static void char_msmouse_class_init(ObjectClass *oc, const void *data)
diff --git a/chardev/spice.c b/chardev/spice.c
index 3ea25706653..f5b1f585eb1 100644
--- a/chardev/spice.c
+++ b/chardev/spice.c
@@ -251,9 +251,7 @@ static void chr_open(Chardev *chr, const char *subtype)
     s->sin.subtype = g_strdup(subtype);
 }
 
-static void spice_vmc_chr_open(Chardev *chr,
-                               ChardevBackend *backend,
-                               bool *be_opened,
+static void spice_vmc_chr_open(Chardev *chr, ChardevBackend *backend,
                                Error **errp)
 {
     ChardevSpiceChannel *spicevmc = backend->u.spicevmc.data;
@@ -277,13 +275,10 @@ static void spice_vmc_chr_open(Chardev *chr,
         return;
     }
 
-    *be_opened = false;
     chr_open(chr, type);
 }
 
-static void spice_port_chr_open(Chardev *chr,
-                                ChardevBackend *backend,
-                                bool *be_opened,
+static void spice_port_chr_open(Chardev *chr, ChardevBackend *backend,
                                 Error **errp)
 {
     ChardevSpicePort *spiceport = backend->u.spiceport.data;
@@ -302,7 +297,6 @@ static void spice_port_chr_open(Chardev *chr,
 
     chr_open(chr, "port");
 
-    *be_opened = false;
     s = SPICE_CHARDEV(chr);
     s->sin.portname = g_strdup(name);
 
diff --git a/chardev/wctablet.c b/chardev/wctablet.c
index 8285a56e7bc..65b2ceb58c9 100644
--- a/chardev/wctablet.c
+++ b/chardev/wctablet.c
@@ -326,13 +326,10 @@ static void wctablet_chr_finalize(Object *obj)
 
 static void wctablet_chr_open(Chardev *chr,
                               ChardevBackend *backend,
-                              bool *be_opened,
                               Error **errp)
 {
     TabletChardev *tablet = WCTABLET_CHARDEV(chr);
 
-    *be_opened = true;
-
     /* init state machine */
     memcpy(tablet->outbuf, WC_FULL_CONFIG_STRING, WC_FULL_CONFIG_STRING_LENGTH);
     tablet->outlen = WC_FULL_CONFIG_STRING_LENGTH;
@@ -340,6 +337,8 @@ static void wctablet_chr_open(Chardev *chr,
 
     tablet->hs = qemu_input_handler_register((DeviceState *)tablet,
                                              &wctablet_handler);
+
+    qemu_chr_be_event(chr, CHR_EVENT_OPENED);
 }
 
 static void wctablet_chr_class_init(ObjectClass *oc, const void *data)
diff --git a/gdbstub/system.c b/gdbstub/system.c
index e161b14485b..982857f314a 100644
--- a/gdbstub/system.c
+++ b/gdbstub/system.c
@@ -233,10 +233,9 @@ static int gdb_chr_write(Chardev *chr, const uint8_t *buf, int len)
     return len;
 }
 
-static void gdb_chr_open(Chardev *chr, ChardevBackend *backend,
-                             bool *be_opened, Error **errp)
+static void gdb_chr_open(Chardev *chr, ChardevBackend *backend, Error **errp)
 {
-    *be_opened = false;
+    /* Never send CHR_EVENT_OPENED */
 }
 
 static void char_gdb_class_init(ObjectClass *oc, const void *data)
diff --git a/ui/console-vc.c b/ui/console-vc.c
index 931068d43ab..4c8ea4c1485 100644
--- a/ui/console-vc.c
+++ b/ui/console-vc.c
@@ -1093,10 +1093,7 @@ void qemu_text_console_update_size(QemuTextConsole *c)
     dpy_text_resize(QEMU_CONSOLE(c), c->width, c->height);
 }
 
-static void vc_chr_open(Chardev *chr,
-                        ChardevBackend *backend,
-                        bool *be_opened,
-                        Error **errp)
+static void vc_chr_open(Chardev *chr, ChardevBackend *backend, Error **errp)
 {
     ChardevVC *vc = backend->u.vc.data;
     VCChardev *drv = VC_CHARDEV(chr);
@@ -1144,7 +1141,7 @@ static void vc_chr_open(Chardev *chr,
         drv->t_attrib = TEXT_ATTRIBUTES_DEFAULT;
     }
 
-    *be_opened = true;
+    qemu_chr_be_event(chr, CHR_EVENT_OPENED);
 }
 
 static void vc_chr_parse(QemuOpts *opts, ChardevBackend *backend, Error **errp)
diff --git a/ui/dbus-chardev.c b/ui/dbus-chardev.c
index f6c426e2209..3e471f84cd8 100644
--- a/ui/dbus-chardev.c
+++ b/ui/dbus-chardev.c
@@ -176,9 +176,7 @@ dbus_chr_send_break(
     return DBUS_METHOD_INVOCATION_HANDLED;
 }
 
-static void
-dbus_chr_open(Chardev *chr, ChardevBackend *backend,
-              bool *be_opened, Error **errp)
+static void dbus_chr_open(Chardev *chr, ChardevBackend *backend, Error **errp)
 {
     ERRP_GUARD();
 
@@ -211,7 +209,7 @@ dbus_chr_open(Chardev *chr, ChardevBackend *backend,
         return;
     }
     CHARDEV_CLASS(object_class_by_name(TYPE_CHARDEV_SOCKET))->chr_open(
-        chr, be, be_opened, errp);
+        chr, be, errp);
 }
 
 static void
diff --git a/ui/gtk.c b/ui/gtk.c
index acf55cdfce2..44b2b868ec9 100644
--- a/ui/gtk.c
+++ b/ui/gtk.c
@@ -1963,10 +1963,7 @@ static void gd_vc_chr_set_echo(Chardev *chr, bool echo)
 
 static int nb_vcs;
 static Chardev *vcs[MAX_VCS];
-static void gd_vc_chr_open(Chardev *chr,
-                       ChardevBackend *backend,
-                       bool *be_opened,
-                       Error **errp)
+static void gd_vc_chr_open(Chardev *chr, ChardevBackend *backend, Error **errp)
 {
     if (nb_vcs == MAX_VCS) {
         error_setg(errp, "Maximum number of consoles reached");
@@ -1975,10 +1972,10 @@ static void gd_vc_chr_open(Chardev *chr,
 
     vcs[nb_vcs++] = chr;
 
-    /* console/chardev init sometimes completes elsewhere in a 2nd
+    /*
+     * console/chardev init sometimes completes elsewhere in a 2nd
      * stage, so defer OPENED events until they are fully initialized
      */
-    *be_opened = false;
 }
 
 static void char_gd_vc_class_init(ObjectClass *oc, const void *data)
diff --git a/ui/spice-app.c b/ui/spice-app.c
index ea0b62a22b7..7ac9ae4e78d 100644
--- a/ui/spice-app.c
+++ b/ui/spice-app.c
@@ -49,8 +49,7 @@ struct VCChardev {
 
 struct VCChardevClass {
     ChardevClass parent;
-    void (*parent_open)(Chardev *chr, ChardevBackend *backend,
-                        bool *be_opened, Error **errp);
+    void (*parent_open)(Chardev *chr, ChardevBackend *backend, Error **errp);
 };
 
 #define TYPE_CHARDEV_VC "chardev-vc"
@@ -67,10 +66,7 @@ chr_spice_backend_new(void)
     return be;
 }
 
-static void vc_chr_open(Chardev *chr,
-                        ChardevBackend *backend,
-                        bool *be_opened,
-                        Error **errp)
+static void vc_chr_open(Chardev *chr, ChardevBackend *backend, Error **errp)
 {
     VCChardevClass *vc = CHARDEV_VC_GET_CLASS(chr);
     ChardevBackend *be;
@@ -87,7 +83,7 @@ static void vc_chr_open(Chardev *chr,
     be = chr_spice_backend_new();
     be->u.spiceport.data->fqdn = fqdn ?
         g_strdup(fqdn) : g_strdup_printf("org.qemu.console.%s", chr->label);
-    vc->parent_open(chr, be, be_opened, errp);
+    vc->parent_open(chr, be, errp);
     qapi_free_ChardevBackend(be);
 }
 
diff --git a/ui/vdagent.c b/ui/vdagent.c
index 090771ab171..644e9acaaeb 100644
--- a/ui/vdagent.c
+++ b/ui/vdagent.c
@@ -662,7 +662,6 @@ static void vdagent_chr_recv_clipboard(VDAgentChardev *vd, VDAgentMessage *msg)
 
 static void vdagent_chr_open(Chardev *chr,
                              ChardevBackend *backend,
-                             bool *be_opened,
                              Error **errp)
 {
     VDAgentChardev *vd = QEMU_VDAGENT_CHARDEV(chr);
@@ -692,7 +691,7 @@ static void vdagent_chr_open(Chardev *chr,
                                                    &vdagent_mouse_handler);
     }
 
-    *be_opened = true;
+    qemu_chr_be_event(chr, CHR_EVENT_OPENED);
 }
 
 static void vdagent_clipboard_peer_register(VDAgentChardev *vd)
-- 
2.52.0


