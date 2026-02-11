Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aHOHOId2jGk6ogAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 11 Feb 2026 13:31:03 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D126412435D
	for <lists+xen-devel@lfdr.de>; Wed, 11 Feb 2026 13:31:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1227468.1533885 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vq9Mp-0003f1-C0; Wed, 11 Feb 2026 12:30:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1227468.1533885; Wed, 11 Feb 2026 12:30:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vq9Mp-0003bz-68; Wed, 11 Feb 2026 12:30:51 +0000
Received: by outflank-mailman (input) for mailman id 1227468;
 Wed, 11 Feb 2026 12:30:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UZeC=AP=redhat.com=marcandre.lureau@srs-se1.protection.inumbo.net>)
 id 1vq9Mn-0001nh-Gb
 for xen-devel@lists.xenproject.org; Wed, 11 Feb 2026 12:30:49 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7e056fb0-0745-11f1-b162-2bf370ae4941;
 Wed, 11 Feb 2026 13:30:48 +0100 (CET)
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-696-zHKrClWFPBOizOCdyanCjA-1; Wed,
 11 Feb 2026 07:30:45 -0500
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 97CA3180034A; Wed, 11 Feb 2026 12:30:43 +0000 (UTC)
Received: from localhost (unknown [10.45.242.6])
 by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 0AAFE1800671; Wed, 11 Feb 2026 12:30:41 +0000 (UTC)
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
X-Inumbo-ID: 7e056fb0-0745-11f1-b162-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1770813047;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6UIUvqKAVHmKYMD5HBaon7fRgToMxwvi5ehZIc//TG8=;
	b=FzfoXfEnlO8opgcPShRvpqQ9Q2xMUOGOz8X3Me3sYIU4/128sQyAagN+gxiiYhZjB6ZsPD
	ALu6lmxxUbjQb5MF/Yuxzd4KnR+Ys87HP66bwcFWvuvFBAkNxgrn6FBv/HOhTL7slhplEH
	NvLg2T/VOHOj4SrPYG/KQRLckZ8hisg=
X-MC-Unique: zHKrClWFPBOizOCdyanCjA-1
X-Mimecast-MFC-AGG-ID: zHKrClWFPBOizOCdyanCjA_1770813044
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
Subject: [PULL 05/14] chardev: consistent naming for ChardevClass handlers implementations
Date: Wed, 11 Feb 2026 16:29:52 +0400
Message-ID: <20260211123007.3569932-6-marcandre.lureau@redhat.com>
In-Reply-To: <20260211123007.3569932-1-marcandre.lureau@redhat.com>
References: <20260211123007.3569932-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93
X-Mimecast-MFC-PROC-ID: 0BcZdT8t_rvHGJUwOwzpeb2gQKhqSJiEo8pQEgtOM00_1770813044
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
X-Rspamd-Queue-Id: D126412435D
X-Rspamd-Action: no action

From: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>

Most handlers implementations has name like {unit_name}_{handler_name},
which is usual and well-recognized pattern. Convert the rest (especially
with useless qemu_ prefixes and misleading qmp_ prefixes) to the common
pattern.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Message-Id: <20260115144606.233252-5-vsementsov@yandex-team.ru>
---
 chardev/char-console.c                        | 10 ++---
 chardev/char-file.c                           | 16 ++++----
 chardev/char-hub.c                            | 15 ++++---
 chardev/char-mux.c                            | 15 ++++---
 chardev/char-parallel.c                       | 28 ++++++-------
 chardev/char-pipe.c                           | 24 +++++------
 chardev/char-pty.c                            | 19 +++++----
 chardev/char-ringbuf.c                        | 16 ++++----
 chardev/char-serial.c                         | 28 ++++++-------
 chardev/char-socket.c                         | 25 ++++++------
 chardev/char-stdio.c                          | 22 +++++-----
 chardev/char-udp.c                            | 15 ++++---
 chardev/char-win-stdio.c                      | 20 +++++-----
 chardev/msmouse.c                             |  4 +-
 chardev/spice.c                               | 40 +++++++++----------
 gdbstub/system.c                              |  8 ++--
 ui/gtk.c                                      |  4 +-
 .../codeconverter/test_regexps.py             |  2 +-
 18 files changed, 153 insertions(+), 158 deletions(-)

diff --git a/chardev/char-console.c b/chardev/char-console.c
index 9a2e012d53f..f3ef1a7748c 100644
--- a/chardev/char-console.c
+++ b/chardev/char-console.c
@@ -26,10 +26,10 @@
 #include "chardev/char-win.h"
 #include "qemu/module.h"
 
-static void qemu_chr_open_win_con(Chardev *chr,
-                                  ChardevBackend *backend,
-                                  bool *be_opened,
-                                  Error **errp)
+static void console_chr_open(Chardev *chr,
+                             ChardevBackend *backend,
+                             bool *be_opened,
+                             Error **errp)
 {
     win_chr_set_file(chr, GetStdHandle(STD_OUTPUT_HANDLE), true);
 }
@@ -38,7 +38,7 @@ static void char_console_class_init(ObjectClass *oc, const void *data)
 {
     ChardevClass *cc = CHARDEV_CLASS(oc);
 
-    cc->chr_open = qemu_chr_open_win_con;
+    cc->chr_open = console_chr_open;
 }
 
 static const TypeInfo char_console_type_info = {
diff --git a/chardev/char-file.c b/chardev/char-file.c
index 1e293e7054a..568600bb7c4 100644
--- a/chardev/char-file.c
+++ b/chardev/char-file.c
@@ -34,10 +34,10 @@
 #include "chardev/char-fd.h"
 #endif
 
-static void qmp_chardev_open_file(Chardev *chr,
-                                  ChardevBackend *backend,
-                                  bool *be_opened,
-                                  Error **errp)
+static void file_chr_open(Chardev *chr,
+                          ChardevBackend *backend,
+                          bool *be_opened,
+                          Error **errp)
 {
     ChardevFile *file = backend->u.file.data;
 #ifdef _WIN32
@@ -102,8 +102,8 @@ static void qmp_chardev_open_file(Chardev *chr,
 #endif
 }
 
-static void qemu_chr_parse_file_out(QemuOpts *opts, ChardevBackend *backend,
-                                    Error **errp)
+static void file_chr_parse(QemuOpts *opts, ChardevBackend *backend,
+                           Error **errp)
 {
     const char *path = qemu_opt_get(opts, "path");
     const char *inpath = qemu_opt_get(opts, "input-path");
@@ -133,8 +133,8 @@ static void char_file_class_init(ObjectClass *oc, const void *data)
 {
     ChardevClass *cc = CHARDEV_CLASS(oc);
 
-    cc->chr_parse = qemu_chr_parse_file_out;
-    cc->chr_open = qmp_chardev_open_file;
+    cc->chr_parse = file_chr_parse;
+    cc->chr_open = file_chr_open;
 }
 
 static const TypeInfo char_file_type_info = {
diff --git a/chardev/char-hub.c b/chardev/char-hub.c
index 082baa84ab8..11556dfa72b 100644
--- a/chardev/char-hub.c
+++ b/chardev/char-hub.c
@@ -203,10 +203,10 @@ static void hub_chr_update_read_handlers(Chardev *chr)
     }
 }
 
-static void qemu_chr_open_hub(Chardev *chr,
-                                 ChardevBackend *backend,
-                                 bool *be_opened,
-                                 Error **errp)
+static void hub_chr_open(Chardev *chr,
+                         ChardevBackend *backend,
+                         bool *be_opened,
+                         Error **errp)
 {
     ChardevHub *hub = backend->u.hub.data;
     HubChardev *d = HUB_CHARDEV(chr);
@@ -245,8 +245,7 @@ static void qemu_chr_open_hub(Chardev *chr,
     *be_opened = false;
 }
 
-static void qemu_chr_parse_hub(QemuOpts *opts, ChardevBackend *backend,
-                                  Error **errp)
+static void hub_chr_parse(QemuOpts *opts, ChardevBackend *backend, Error **errp)
 {
     ChardevHub *hub;
     strList **tail;
@@ -276,8 +275,8 @@ static void char_hub_class_init(ObjectClass *oc, const void *data)
 {
     ChardevClass *cc = CHARDEV_CLASS(oc);
 
-    cc->chr_parse = qemu_chr_parse_hub;
-    cc->chr_open = qemu_chr_open_hub;
+    cc->chr_parse = hub_chr_parse;
+    cc->chr_open = hub_chr_open;
     cc->chr_write = hub_chr_write;
     cc->chr_add_watch = hub_chr_add_watch;
     /* We handle events from backends only */
diff --git a/chardev/char-mux.c b/chardev/char-mux.c
index c82c2da56dd..f38d66b21f1 100644
--- a/chardev/char-mux.c
+++ b/chardev/char-mux.c
@@ -361,10 +361,10 @@ void mux_set_focus(Chardev *chr, unsigned int focus)
     mux_chr_send_event(d, d->focus, CHR_EVENT_MUX_IN);
 }
 
-static void qemu_chr_open_mux(Chardev *chr,
-                              ChardevBackend *backend,
-                              bool *be_opened,
-                              Error **errp)
+static void mux_chr_open(Chardev *chr,
+                         ChardevBackend *backend,
+                         bool *be_opened,
+                         Error **errp)
 {
     ChardevMux *mux = backend->u.mux.data;
     Chardev *drv;
@@ -384,8 +384,7 @@ static void qemu_chr_open_mux(Chardev *chr,
     qemu_chr_fe_init(&d->chr, drv, errp);
 }
 
-static void qemu_chr_parse_mux(QemuOpts *opts, ChardevBackend *backend,
-                               Error **errp)
+static void mux_chr_parse(QemuOpts *opts, ChardevBackend *backend, Error **errp)
 {
     const char *chardev = qemu_opt_get(opts, "chardev");
     ChardevMux *mux;
@@ -451,8 +450,8 @@ static void char_mux_class_init(ObjectClass *oc, const void *data)
 {
     ChardevClass *cc = CHARDEV_CLASS(oc);
 
-    cc->chr_parse = qemu_chr_parse_mux;
-    cc->chr_open = qemu_chr_open_mux;
+    cc->chr_parse = mux_chr_parse;
+    cc->chr_open = mux_chr_open;
     cc->chr_write = mux_chr_write;
     cc->chr_accept_input = mux_chr_accept_input;
     cc->chr_add_watch = mux_chr_add_watch;
diff --git a/chardev/char-parallel.c b/chardev/char-parallel.c
index a0839b784b8..1be1ef46292 100644
--- a/chardev/char-parallel.c
+++ b/chardev/char-parallel.c
@@ -70,7 +70,7 @@ static int pp_hw_mode(ParallelChardev *s, uint16_t mode)
     return 1;
 }
 
-static int pp_ioctl(Chardev *chr, int cmd, void *arg)
+static int parallel_chr_ioctl(Chardev *chr, int cmd, void *arg)
 {
     ParallelChardev *drv = PARALLEL_CHARDEV(chr);
     int fd = drv->fd;
@@ -157,7 +157,7 @@ static int pp_ioctl(Chardev *chr, int cmd, void *arg)
     return 0;
 }
 
-static void qemu_chr_open_pp_fd(Chardev *chr,
+static void parallel_chr_open_fd(Chardev *chr,
                                 int fd,
                                 bool *be_opened,
                                 Error **errp)
@@ -185,7 +185,7 @@ typedef struct {
 #define PARALLEL_CHARDEV(obj)                                   \
     OBJECT_CHECK(ParallelChardev, (obj), TYPE_CHARDEV_PARALLEL)
 
-static int pp_ioctl(Chardev *chr, int cmd, void *arg)
+static int parallel_chr_ioctl(Chardev *chr, int cmd, void *arg)
 {
     ParallelChardev *drv = PARALLEL_CHARDEV(chr);
     uint8_t b;
@@ -227,7 +227,7 @@ static int pp_ioctl(Chardev *chr, int cmd, void *arg)
     return 0;
 }
 
-static void qemu_chr_open_pp_fd(Chardev *chr,
+static void parallel_chr_open_fd(Chardev *chr,
                                 int fd,
                                 bool *be_opened,
                                 Error **errp)
@@ -239,10 +239,10 @@ static void qemu_chr_open_pp_fd(Chardev *chr,
 #endif
 
 #ifdef HAVE_CHARDEV_PARALLEL
-static void qmp_chardev_open_parallel(Chardev *chr,
-                                      ChardevBackend *backend,
-                                      bool *be_opened,
-                                      Error **errp)
+static void parallel_chr_open(Chardev *chr,
+                              ChardevBackend *backend,
+                              bool *be_opened,
+                              Error **errp)
 {
     ChardevHostdev *parallel = backend->u.parallel.data;
     int fd;
@@ -251,11 +251,11 @@ static void qmp_chardev_open_parallel(Chardev *chr,
     if (fd < 0) {
         return;
     }
-    qemu_chr_open_pp_fd(chr, fd, be_opened, errp);
+    parallel_chr_open_fd(chr, fd, be_opened, errp);
 }
 
-static void qemu_chr_parse_parallel(QemuOpts *opts, ChardevBackend *backend,
-                                    Error **errp)
+static void parallel_chr_parse(QemuOpts *opts, ChardevBackend *backend,
+                               Error **errp)
 {
     const char *device = qemu_opt_get(opts, "path");
     ChardevHostdev *parallel;
@@ -274,9 +274,9 @@ static void char_parallel_class_init(ObjectClass *oc, const void *data)
 {
     ChardevClass *cc = CHARDEV_CLASS(oc);
 
-    cc->chr_parse = qemu_chr_parse_parallel;
-    cc->chr_open = qmp_chardev_open_parallel;
-    cc->chr_ioctl = pp_ioctl;
+    cc->chr_parse = parallel_chr_parse;
+    cc->chr_open = parallel_chr_open;
+    cc->chr_ioctl = parallel_chr_ioctl;
 }
 
 static void char_parallel_finalize(Object *obj)
diff --git a/chardev/char-pipe.c b/chardev/char-pipe.c
index a2cd322efe6..e84492d42b6 100644
--- a/chardev/char-pipe.c
+++ b/chardev/char-pipe.c
@@ -103,10 +103,10 @@ static int win_chr_pipe_init(Chardev *chr, const char *filename,
     return -1;
 }
 
-static void qemu_chr_open_pipe(Chardev *chr,
-                               ChardevBackend *backend,
-                               bool *be_opened,
-                               Error **errp)
+static void pipe_chr_open(Chardev *chr,
+                          ChardevBackend *backend,
+                          bool *be_opened,
+                          Error **errp)
 {
     ChardevHostdev *opts = backend->u.pipe.data;
     const char *filename = opts->device;
@@ -118,10 +118,10 @@ static void qemu_chr_open_pipe(Chardev *chr,
 
 #else
 
-static void qemu_chr_open_pipe(Chardev *chr,
-                               ChardevBackend *backend,
-                               bool *be_opened,
-                               Error **errp)
+static void pipe_chr_open(Chardev *chr,
+                          ChardevBackend *backend,
+                          bool *be_opened,
+                          Error **errp)
 {
     ChardevHostdev *opts = backend->u.pipe.data;
     int fd_in, fd_out;
@@ -162,8 +162,8 @@ static void qemu_chr_open_pipe(Chardev *chr,
 
 #endif /* !_WIN32 */
 
-static void qemu_chr_parse_pipe(QemuOpts *opts, ChardevBackend *backend,
-                                Error **errp)
+static void pipe_chr_parse(QemuOpts *opts, ChardevBackend *backend,
+                           Error **errp)
 {
     const char *device = qemu_opt_get(opts, "path");
     ChardevHostdev *dev;
@@ -182,8 +182,8 @@ static void char_pipe_class_init(ObjectClass *oc, const void *data)
 {
     ChardevClass *cc = CHARDEV_CLASS(oc);
 
-    cc->chr_parse = qemu_chr_parse_pipe;
-    cc->chr_open = qemu_chr_open_pipe;
+    cc->chr_parse = pipe_chr_parse;
+    cc->chr_open = pipe_chr_open;
 }
 
 static const TypeInfo char_pipe_type_info = {
diff --git a/chardev/char-pty.c b/chardev/char-pty.c
index 1a15082b025..909ab01f5f2 100644
--- a/chardev/char-pty.c
+++ b/chardev/char-pty.c
@@ -105,7 +105,7 @@ static void pty_chr_update_read_handler(Chardev *chr)
     }
 }
 
-static int char_pty_chr_write(Chardev *chr, const uint8_t *buf, int len)
+static int pty_chr_write(Chardev *chr, const uint8_t *buf, int len)
 {
     PtyChardev *s = PTY_CHARDEV(chr);
     GPollFD pfd;
@@ -331,10 +331,10 @@ static int qemu_openpty_raw(int *aslave, char *pty_name)
     return amaster;
 }
 
-static void char_pty_open(Chardev *chr,
-                          ChardevBackend *backend,
-                          bool *be_opened,
-                          Error **errp)
+static void pty_chr_open(Chardev *chr,
+                         ChardevBackend *backend,
+                         bool *be_opened,
+                         Error **errp)
 {
     PtyChardev *s;
     int master_fd, slave_fd;
@@ -378,8 +378,7 @@ static void char_pty_open(Chardev *chr,
     }
 }
 
-static void char_pty_parse(QemuOpts *opts, ChardevBackend *backend,
-                           Error **errp)
+static void pty_chr_parse(QemuOpts *opts, ChardevBackend *backend, Error **errp)
 {
     const char *path = qemu_opt_get(opts, "path");
     ChardevPty *pty;
@@ -394,9 +393,9 @@ static void char_pty_class_init(ObjectClass *oc, const void *data)
 {
     ChardevClass *cc = CHARDEV_CLASS(oc);
 
-    cc->chr_parse = char_pty_parse;
-    cc->chr_open = char_pty_open;
-    cc->chr_write = char_pty_chr_write;
+    cc->chr_parse = pty_chr_parse;
+    cc->chr_open = pty_chr_open;
+    cc->chr_write = pty_chr_write;
     cc->chr_update_read_handler = pty_chr_update_read_handler;
     cc->chr_add_watch = pty_chr_add_watch;
 }
diff --git a/chardev/char-ringbuf.c b/chardev/char-ringbuf.c
index 6d5ba667bb4..19652fe2b3a 100644
--- a/chardev/char-ringbuf.c
+++ b/chardev/char-ringbuf.c
@@ -92,10 +92,10 @@ static void char_ringbuf_finalize(Object *obj)
     g_free(d->cbuf);
 }
 
-static void qemu_chr_open_ringbuf(Chardev *chr,
-                                  ChardevBackend *backend,
-                                  bool *be_opened,
-                                  Error **errp)
+static void ringbuf_chr_open(Chardev *chr,
+                             ChardevBackend *backend,
+                             bool *be_opened,
+                             Error **errp)
 {
     ChardevRingbuf *opts = backend->u.ringbuf.data;
     RingBufChardev *d = RINGBUF_CHARDEV(chr);
@@ -206,8 +206,8 @@ char *qmp_ringbuf_read(const char *device, int64_t size,
     return data;
 }
 
-static void qemu_chr_parse_ringbuf(QemuOpts *opts, ChardevBackend *backend,
-                                   Error **errp)
+static void ringbuf_chr_parse(QemuOpts *opts, ChardevBackend *backend,
+                              Error **errp)
 {
     int val;
     ChardevRingbuf *ringbuf;
@@ -227,8 +227,8 @@ static void char_ringbuf_class_init(ObjectClass *oc, const void *data)
 {
     ChardevClass *cc = CHARDEV_CLASS(oc);
 
-    cc->chr_parse = qemu_chr_parse_ringbuf;
-    cc->chr_open = qemu_chr_open_ringbuf;
+    cc->chr_parse = ringbuf_chr_parse;
+    cc->chr_open = ringbuf_chr_open;
     cc->chr_write = ringbuf_chr_write;
 }
 
diff --git a/chardev/char-serial.c b/chardev/char-serial.c
index 97ed7adf736..54c2b3935cf 100644
--- a/chardev/char-serial.c
+++ b/chardev/char-serial.c
@@ -41,10 +41,10 @@
 
 #ifdef _WIN32
 
-static void qmp_chardev_open_serial(Chardev *chr,
-                                    ChardevBackend *backend,
-                                    bool *be_opened,
-                                    Error **errp)
+static void serial_chr_open(Chardev *chr,
+                            ChardevBackend *backend,
+                            bool *be_opened,
+                            Error **errp)
 {
     ChardevHostdev *serial = backend->u.serial.data;
 
@@ -176,7 +176,7 @@ static void tty_serial_init(int fd, int speed,
     tcsetattr(fd, TCSANOW, &tty);
 }
 
-static int tty_serial_ioctl(Chardev *chr, int cmd, void *arg)
+static int serial_chr_ioctl(Chardev *chr, int cmd, void *arg)
 {
     FDChardev *s = FD_CHARDEV(chr);
     QIOChannelFile *fioc = QIO_CHANNEL_FILE(s->ioc_in);
@@ -258,10 +258,10 @@ static int tty_serial_ioctl(Chardev *chr, int cmd, void *arg)
     return 0;
 }
 
-static void qmp_chardev_open_serial(Chardev *chr,
-                                    ChardevBackend *backend,
-                                    bool *be_opened,
-                                    Error **errp)
+static void serial_chr_open(Chardev *chr,
+                            ChardevBackend *backend,
+                            bool *be_opened,
+                            Error **errp)
 {
     ChardevHostdev *serial = backend->u.serial.data;
     int fd;
@@ -285,8 +285,8 @@ static void qmp_chardev_open_serial(Chardev *chr,
 #endif /* __linux__ || __sun__ */
 
 #ifdef HAVE_CHARDEV_SERIAL
-static void qemu_chr_parse_serial(QemuOpts *opts, ChardevBackend *backend,
-                                  Error **errp)
+static void serial_chr_parse(QemuOpts *opts, ChardevBackend *backend,
+                             Error **errp)
 {
     const char *device = qemu_opt_get(opts, "path");
     ChardevHostdev *serial;
@@ -305,10 +305,10 @@ static void char_serial_class_init(ObjectClass *oc, const void *data)
 {
     ChardevClass *cc = CHARDEV_CLASS(oc);
 
-    cc->chr_parse = qemu_chr_parse_serial;
-    cc->chr_open = qmp_chardev_open_serial;
+    cc->chr_parse = serial_chr_parse;
+    cc->chr_open = serial_chr_open;
 #ifndef _WIN32
-    cc->chr_ioctl = tty_serial_ioctl;
+    cc->chr_ioctl = serial_chr_ioctl;
 #endif
 }
 
diff --git a/chardev/char-socket.c b/chardev/char-socket.c
index 149a6d8cc15..a3203f2f97b 100644
--- a/chardev/char-socket.c
+++ b/chardev/char-socket.c
@@ -222,7 +222,7 @@ static void tcp_chr_process_IAC_bytes(Chardev *chr,
     *size = j;
 }
 
-static int tcp_get_msgfds(Chardev *chr, int *fds, int num)
+static int tcp_chr_get_msgfds(Chardev *chr, int *fds, int num)
 {
     SocketChardev *s = SOCKET_CHARDEV(chr);
 
@@ -248,7 +248,7 @@ static int tcp_get_msgfds(Chardev *chr, int *fds, int num)
     return to_copy;
 }
 
-static int tcp_set_msgfds(Chardev *chr, int *fds, int num)
+static int tcp_chr_set_msgfds(Chardev *chr, int *fds, int num)
 {
     SocketChardev *s = SOCKET_CHARDEV(chr);
 
@@ -367,7 +367,7 @@ static void tcp_chr_free_connection(Chardev *chr)
 
     remove_hup_source(s);
 
-    tcp_set_msgfds(chr, NULL, 0);
+    tcp_chr_set_msgfds(chr, NULL, 0);
     remove_fd_in_watch(chr);
     if (s->registered_yank &&
         (s->state == TCP_CHARDEV_STATE_CONNECTING
@@ -1365,10 +1365,10 @@ static bool qmp_chardev_validate_socket(ChardevSocket *sock,
 }
 
 
-static void qmp_chardev_open_socket(Chardev *chr,
-                                    ChardevBackend *backend,
-                                    bool *be_opened,
-                                    Error **errp)
+static void tcp_chr_open(Chardev *chr,
+                         ChardevBackend *backend,
+                         bool *be_opened,
+                         Error **errp)
 {
     SocketChardev *s = SOCKET_CHARDEV(chr);
     ChardevSocket *sock = backend->u.socket.data;
@@ -1456,8 +1456,7 @@ static void qmp_chardev_open_socket(Chardev *chr,
     }
 }
 
-static void qemu_chr_parse_socket(QemuOpts *opts, ChardevBackend *backend,
-                                  Error **errp)
+static void tcp_chr_parse(QemuOpts *opts, ChardevBackend *backend, Error **errp)
 {
     const char *path = qemu_opt_get(opts, "path");
     const char *host = qemu_opt_get(opts, "host");
@@ -1585,14 +1584,14 @@ static void char_socket_class_init(ObjectClass *oc, const void *data)
 
     cc->supports_yank = true;
 
-    cc->chr_parse = qemu_chr_parse_socket;
-    cc->chr_open = qmp_chardev_open_socket;
+    cc->chr_parse = tcp_chr_parse;
+    cc->chr_open = tcp_chr_open;
     cc->chr_wait_connected = tcp_chr_wait_connected;
     cc->chr_write = tcp_chr_write;
     cc->chr_sync_read = tcp_chr_sync_read;
     cc->chr_disconnect = tcp_chr_disconnect;
-    cc->chr_get_msgfds = tcp_get_msgfds;
-    cc->chr_set_msgfds = tcp_set_msgfds;
+    cc->chr_get_msgfds = tcp_chr_get_msgfds;
+    cc->chr_set_msgfds = tcp_chr_set_msgfds;
     cc->chr_add_client = tcp_chr_add_client;
     cc->chr_add_watch = tcp_chr_add_watch;
     cc->chr_update_read_handler = tcp_chr_update_read_handler;
diff --git a/chardev/char-stdio.c b/chardev/char-stdio.c
index b7e9af1388f..f0920a23faa 100644
--- a/chardev/char-stdio.c
+++ b/chardev/char-stdio.c
@@ -56,7 +56,7 @@ static void term_exit(void)
     }
 }
 
-static void qemu_chr_set_echo_stdio(Chardev *chr, bool echo)
+static void stdio_chr_set_echo(Chardev *chr, bool echo)
 {
     struct termios tty;
 
@@ -82,13 +82,13 @@ static void qemu_chr_set_echo_stdio(Chardev *chr, bool echo)
 static void term_stdio_handler(int sig)
 {
     /* restore echo after resume from suspend. */
-    qemu_chr_set_echo_stdio(NULL, stdio_echo_state);
+    stdio_chr_set_echo(NULL, stdio_echo_state);
 }
 
-static void qemu_chr_open_stdio(Chardev *chr,
-                                ChardevBackend *backend,
-                                bool *be_opened,
-                                Error **errp)
+static void stdio_chr_open(Chardev *chr,
+                           ChardevBackend *backend,
+                           bool *be_opened,
+                           Error **errp)
 {
     ChardevStdio *opts = backend->u.stdio.data;
     struct sigaction act;
@@ -122,11 +122,11 @@ static void qemu_chr_open_stdio(Chardev *chr,
     sigaction(SIGCONT, &act, NULL);
 
     stdio_allow_signal = !opts->has_signal || opts->signal;
-    qemu_chr_set_echo_stdio(chr, false);
+    stdio_chr_set_echo(chr, false);
 }
 #endif
 
-static void qemu_chr_parse_stdio(QemuOpts *opts, ChardevBackend *backend,
+static void stdio_chr_parse(QemuOpts *opts, ChardevBackend *backend,
                                  Error **errp)
 {
     ChardevStdio *stdio;
@@ -142,10 +142,10 @@ static void char_stdio_class_init(ObjectClass *oc, const void *data)
 {
     ChardevClass *cc = CHARDEV_CLASS(oc);
 
-    cc->chr_parse = qemu_chr_parse_stdio;
+    cc->chr_parse = stdio_chr_parse;
 #ifndef _WIN32
-    cc->chr_open = qemu_chr_open_stdio;
-    cc->chr_set_echo = qemu_chr_set_echo_stdio;
+    cc->chr_open = stdio_chr_open;
+    cc->chr_set_echo = stdio_chr_set_echo;
 #endif
 }
 
diff --git a/chardev/char-udp.c b/chardev/char-udp.c
index 71b8d8b37df..18f4322408a 100644
--- a/chardev/char-udp.c
+++ b/chardev/char-udp.c
@@ -131,8 +131,7 @@ static void char_udp_finalize(Object *obj)
     qemu_chr_be_event(chr, CHR_EVENT_CLOSED);
 }
 
-static void qemu_chr_parse_udp(QemuOpts *opts, ChardevBackend *backend,
-                               Error **errp)
+static void udp_chr_parse(QemuOpts *opts, ChardevBackend *backend, Error **errp)
 {
     const char *host = qemu_opt_get(opts, "host");
     const char *port = qemu_opt_get(opts, "port");
@@ -189,10 +188,10 @@ static void qemu_chr_parse_udp(QemuOpts *opts, ChardevBackend *backend,
     }
 }
 
-static void qmp_chardev_open_udp(Chardev *chr,
-                                 ChardevBackend *backend,
-                                 bool *be_opened,
-                                 Error **errp)
+static void upd_chr_open(Chardev *chr,
+                         ChardevBackend *backend,
+                         bool *be_opened,
+                         Error **errp)
 {
     ChardevUdp *udp = backend->u.udp.data;
     SocketAddress *local_addr = socket_address_flatten(udp->local);
@@ -221,8 +220,8 @@ static void char_udp_class_init(ObjectClass *oc, const void *data)
 {
     ChardevClass *cc = CHARDEV_CLASS(oc);
 
-    cc->chr_parse = qemu_chr_parse_udp;
-    cc->chr_open = qmp_chardev_open_udp;
+    cc->chr_parse = udp_chr_parse;
+    cc->chr_open = upd_chr_open;
     cc->chr_write = udp_chr_write;
     cc->chr_update_read_handler = udp_chr_update_read_handler;
 }
diff --git a/chardev/char-win-stdio.c b/chardev/char-win-stdio.c
index 26e67aef1ca..866f3a20398 100644
--- a/chardev/char-win-stdio.c
+++ b/chardev/char-win-stdio.c
@@ -128,7 +128,7 @@ static void win_stdio_thread_wait_func(void *opaque)
     SetEvent(stdio->hInputDoneEvent);
 }
 
-static void qemu_chr_set_echo_win_stdio(Chardev *chr, bool echo)
+static void win_stiod_chr_set_echo(Chardev *chr, bool echo)
 {
     WinStdioChardev *stdio = WIN_STDIO_CHARDEV(chr);
     DWORD              dwMode = 0;
@@ -142,10 +142,10 @@ static void qemu_chr_set_echo_win_stdio(Chardev *chr, bool echo)
     }
 }
 
-static void qemu_chr_open_stdio(Chardev *chr,
-                                ChardevBackend *backend,
-                                bool *be_opened,
-                                Error **errp)
+static void win_stdio_chr_open(Chardev *chr,
+                               ChardevBackend *backend,
+                               bool *be_opened,
+                               Error **errp)
 {
     ChardevStdio *opts = backend->u.stdio.data;
     bool stdio_allow_signal = !opts->has_signal || opts->signal;
@@ -206,7 +206,7 @@ static void qemu_chr_open_stdio(Chardev *chr,
 
     SetConsoleMode(stdio->hStdIn, dwMode);
 
-    qemu_chr_set_echo_win_stdio(chr, false);
+    win_stiod_chr_set_echo(chr, false);
 
     return;
 
@@ -237,7 +237,7 @@ static void char_win_stdio_finalize(Object *obj)
     }
 }
 
-static int win_stdio_write(Chardev *chr, const uint8_t *buf, int len)
+static int win_stdio_chr_write(Chardev *chr, const uint8_t *buf, int len)
 {
     HANDLE  hStdOut = GetStdHandle(STD_OUTPUT_HANDLE);
     DWORD   dwSize;
@@ -260,9 +260,9 @@ static void char_win_stdio_class_init(ObjectClass *oc, const void *data)
 {
     ChardevClass *cc = CHARDEV_CLASS(oc);
 
-    cc->chr_open = qemu_chr_open_stdio;
-    cc->chr_write = win_stdio_write;
-    cc->chr_set_echo = qemu_chr_set_echo_win_stdio;
+    cc->chr_open = win_stdio_chr_open;
+    cc->chr_write = win_stdio_chr_write;
+    cc->chr_set_echo = win_stiod_chr_set_echo;
 }
 
 static const TypeInfo char_win_stdio_type_info = {
diff --git a/chardev/msmouse.c b/chardev/msmouse.c
index 84050164893..d07cd998cb5 100644
--- a/chardev/msmouse.c
+++ b/chardev/msmouse.c
@@ -178,7 +178,7 @@ static const QemuInputHandler msmouse_handler = {
     .sync  = msmouse_input_sync,
 };
 
-static int msmouse_ioctl(Chardev *chr, int cmd, void *arg)
+static int msmouse_chr_ioctl(Chardev *chr, int cmd, void *arg)
 {
     MouseChardev *mouse = MOUSE_CHARDEV(chr);
     int c, i, j;
@@ -274,7 +274,7 @@ static void char_msmouse_class_init(ObjectClass *oc, const void *data)
     cc->chr_open = msmouse_chr_open;
     cc->chr_write = msmouse_chr_write;
     cc->chr_accept_input = msmouse_chr_accept_input;
-    cc->chr_ioctl = msmouse_ioctl;
+    cc->chr_ioctl = msmouse_chr_ioctl;
 }
 
 static const TypeInfo char_msmouse_type_info = {
diff --git a/chardev/spice.c b/chardev/spice.c
index 61caa6d0efe..3ea25706653 100644
--- a/chardev/spice.c
+++ b/chardev/spice.c
@@ -215,7 +215,7 @@ static void char_spice_finalize(Object *obj)
     g_free((char *)s->sin.portname);
 }
 
-static void spice_vmc_set_fe_open(struct Chardev *chr, int fe_open)
+static void spice_vmc_chr_set_fe_open(struct Chardev *chr, int fe_open)
 {
     SpiceChardev *s = SPICE_CHARDEV(chr);
     if (fe_open) {
@@ -225,7 +225,7 @@ static void spice_vmc_set_fe_open(struct Chardev *chr, int fe_open)
     }
 }
 
-static void spice_port_set_fe_open(struct Chardev *chr, int fe_open)
+static void spice_port_chr_set_fe_open(struct Chardev *chr, int fe_open)
 {
     SpiceChardev *s = SPICE_CHARDEV(chr);
 
@@ -251,10 +251,10 @@ static void chr_open(Chardev *chr, const char *subtype)
     s->sin.subtype = g_strdup(subtype);
 }
 
-static void qemu_chr_open_spice_vmc(Chardev *chr,
-                                    ChardevBackend *backend,
-                                    bool *be_opened,
-                                    Error **errp)
+static void spice_vmc_chr_open(Chardev *chr,
+                               ChardevBackend *backend,
+                               bool *be_opened,
+                               Error **errp)
 {
     ChardevSpiceChannel *spicevmc = backend->u.spicevmc.data;
     const char *type = spicevmc->type;
@@ -281,10 +281,10 @@ static void qemu_chr_open_spice_vmc(Chardev *chr,
     chr_open(chr, type);
 }
 
-static void qemu_chr_open_spice_port(Chardev *chr,
-                                     ChardevBackend *backend,
-                                     bool *be_opened,
-                                     Error **errp)
+static void spice_port_chr_open(Chardev *chr,
+                                ChardevBackend *backend,
+                                bool *be_opened,
+                                Error **errp)
 {
     ChardevSpicePort *spiceport = backend->u.spiceport.data;
     const char *name = spiceport->fqdn;
@@ -309,8 +309,8 @@ static void qemu_chr_open_spice_port(Chardev *chr,
     vmc_register_interface(s);
 }
 
-static void qemu_chr_parse_spice_vmc(QemuOpts *opts, ChardevBackend *backend,
-                                     Error **errp)
+static void spice_vmc_chr_parse(QemuOpts *opts, ChardevBackend *backend,
+                                Error **errp)
 {
     const char *name = qemu_opt_get(opts, "name");
     ChardevSpiceChannel *spicevmc;
@@ -325,8 +325,8 @@ static void qemu_chr_parse_spice_vmc(QemuOpts *opts, ChardevBackend *backend,
     spicevmc->type = g_strdup(name);
 }
 
-static void qemu_chr_parse_spice_port(QemuOpts *opts, ChardevBackend *backend,
-                                      Error **errp)
+static void spice_port_chr_parse(QemuOpts *opts, ChardevBackend *backend,
+                                 Error **errp)
 {
     const char *name = qemu_opt_get(opts, "name");
     ChardevSpicePort *spiceport;
@@ -364,9 +364,9 @@ static void char_spicevmc_class_init(ObjectClass *oc, const void *data)
 {
     ChardevClass *cc = CHARDEV_CLASS(oc);
 
-    cc->chr_parse = qemu_chr_parse_spice_vmc;
-    cc->chr_open = qemu_chr_open_spice_vmc;
-    cc->chr_set_fe_open = spice_vmc_set_fe_open;
+    cc->chr_parse = spice_vmc_chr_parse;
+    cc->chr_open = spice_vmc_chr_open;
+    cc->chr_set_fe_open = spice_vmc_chr_set_fe_open;
 }
 
 static const TypeInfo char_spicevmc_type_info = {
@@ -380,9 +380,9 @@ static void char_spiceport_class_init(ObjectClass *oc, const void *data)
 {
     ChardevClass *cc = CHARDEV_CLASS(oc);
 
-    cc->chr_parse = qemu_chr_parse_spice_port;
-    cc->chr_open = qemu_chr_open_spice_port;
-    cc->chr_set_fe_open = spice_port_set_fe_open;
+    cc->chr_parse = spice_port_chr_parse;
+    cc->chr_open = spice_port_chr_open;
+    cc->chr_set_fe_open = spice_port_chr_set_fe_open;
 }
 
 static const TypeInfo char_spiceport_type_info = {
diff --git a/gdbstub/system.c b/gdbstub/system.c
index 29b9e16a908..e161b14485b 100644
--- a/gdbstub/system.c
+++ b/gdbstub/system.c
@@ -225,7 +225,7 @@ static void gdb_sigterm_handler(int signal)
 }
 #endif
 
-static int gdb_monitor_write(Chardev *chr, const uint8_t *buf, int len)
+static int gdb_chr_write(Chardev *chr, const uint8_t *buf, int len)
 {
     g_autoptr(GString) hex_buf = g_string_new("O");
     gdb_memtohex(hex_buf, buf, len);
@@ -233,7 +233,7 @@ static int gdb_monitor_write(Chardev *chr, const uint8_t *buf, int len)
     return len;
 }
 
-static void gdb_monitor_open(Chardev *chr, ChardevBackend *backend,
+static void gdb_chr_open(Chardev *chr, ChardevBackend *backend,
                              bool *be_opened, Error **errp)
 {
     *be_opened = false;
@@ -244,8 +244,8 @@ static void char_gdb_class_init(ObjectClass *oc, const void *data)
     ChardevClass *cc = CHARDEV_CLASS(oc);
 
     cc->internal = true;
-    cc->chr_open = gdb_monitor_open;
-    cc->chr_write = gdb_monitor_write;
+    cc->chr_open = gdb_chr_open;
+    cc->chr_write = gdb_chr_write;
 }
 
 #define TYPE_CHARDEV_GDB "chardev-gdb"
diff --git a/ui/gtk.c b/ui/gtk.c
index 6217e9552e3..acf55cdfce2 100644
--- a/ui/gtk.c
+++ b/ui/gtk.c
@@ -1963,7 +1963,7 @@ static void gd_vc_chr_set_echo(Chardev *chr, bool echo)
 
 static int nb_vcs;
 static Chardev *vcs[MAX_VCS];
-static void gd_vc_open(Chardev *chr,
+static void gd_vc_chr_open(Chardev *chr,
                        ChardevBackend *backend,
                        bool *be_opened,
                        Error **errp)
@@ -1985,7 +1985,7 @@ static void char_gd_vc_class_init(ObjectClass *oc, const void *data)
 {
     ChardevClass *cc = CHARDEV_CLASS(oc);
 
-    cc->chr_open = gd_vc_open;
+    cc->chr_open = gd_vc_chr_open;
     cc->chr_write = gd_vc_chr_write;
     cc->chr_accept_input = gd_vc_chr_accept_input;
     cc->chr_set_echo = gd_vc_chr_set_echo;
diff --git a/scripts/codeconverter/codeconverter/test_regexps.py b/scripts/codeconverter/codeconverter/test_regexps.py
index d3a5cc3ad38..2b9f5b80111 100644
--- a/scripts/codeconverter/codeconverter/test_regexps.py
+++ b/scripts/codeconverter/codeconverter/test_regexps.py
@@ -57,7 +57,7 @@ def fullmatch(regexp, s):
 
     print(RE_TYPEINFO_START)
     assert re.search(RE_TYPEINFO_START, r'''
-    cc->chr_open = qmp_chardev_open_file;
+    cc->chr_open = file_chr_open;
 }
 
 static const TypeInfo char_file_type_info = {
-- 
2.52.0


