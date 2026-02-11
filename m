Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id APjnH352jGk6ogAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 11 Feb 2026 13:30:54 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EED2012434D
	for <lists+xen-devel@lfdr.de>; Wed, 11 Feb 2026 13:30:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1227458.1533874 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vq9Mk-0003Em-RC; Wed, 11 Feb 2026 12:30:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1227458.1533874; Wed, 11 Feb 2026 12:30:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vq9Mk-0003DI-Mb; Wed, 11 Feb 2026 12:30:46 +0000
Received: by outflank-mailman (input) for mailman id 1227458;
 Wed, 11 Feb 2026 12:30:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UZeC=AP=redhat.com=marcandre.lureau@srs-se1.protection.inumbo.net>)
 id 1vq9Mi-0001nh-N2
 for xen-devel@lists.xenproject.org; Wed, 11 Feb 2026 12:30:44 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7b48442a-0745-11f1-b162-2bf370ae4941;
 Wed, 11 Feb 2026 13:30:43 +0100 (CET)
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-152-9f3tISB3O9Sfw3hm94Ys_Q-1; Wed,
 11 Feb 2026 07:30:39 -0500
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 5F12018002EB; Wed, 11 Feb 2026 12:30:37 +0000 (UTC)
Received: from localhost (unknown [10.45.242.6])
 by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 5B8511800464; Wed, 11 Feb 2026 12:30:33 +0000 (UTC)
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
X-Inumbo-ID: 7b48442a-0745-11f1-b162-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1770813042;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=K/EYv/wOL3z8Ia2Topl38iZZVA139L2JWNE4O9fOHA4=;
	b=h1LkKvU6O5Dl6QgcxGWy36IBF0xZpwGByIcoRBQ1qNRyXAiYGndE0JJvr4MbPeQFN05slB
	95x/MKx7H9wK12ReGbgMoPiUVGoItgGPonq8jZAL+eyvIQiQV6TRWOsrQ0eUitr6UxPhl4
	4q4CxaIdpMdT+lg389Hl+BMM2fZ4iQk=
X-MC-Unique: 9f3tISB3O9Sfw3hm94Ys_Q-1
X-Mimecast-MFC-AGG-ID: 9f3tISB3O9Sfw3hm94Ys_Q_1770813037
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
Subject: [PULL 04/14] chardev: ChardevClass: consistent naming for handlers
Date: Wed, 11 Feb 2026 16:29:51 +0400
Message-ID: <20260211123007.3569932-5-marcandre.lureau@redhat.com>
In-Reply-To: <20260211123007.3569932-1-marcandre.lureau@redhat.com>
References: <20260211123007.3569932-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111
X-Mimecast-MFC-PROC-ID: y2z_rBTN_of1Yo9f7bEablhaXyvOchsCj89_W0_kFBo_1770813037
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
X-Rspamd-Queue-Id: EED2012434D
X-Rspamd-Action: no action

From: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>

Most handlers have name prefixed with "chr_". That's a good practice
which helps to grep them. Convert the rest: .parse, .open,
get/set_msgfds.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Message-Id: <20260115144606.233252-4-vsementsov@yandex-team.ru>
---
 include/chardev/char.h                              | 8 ++++----
 chardev/baum.c                                      | 2 +-
 chardev/char-console.c                              | 2 +-
 chardev/char-fe.c                                   | 8 ++++----
 chardev/char-file.c                                 | 4 ++--
 chardev/char-hub.c                                  | 4 ++--
 chardev/char-mux.c                                  | 4 ++--
 chardev/char-null.c                                 | 2 +-
 chardev/char-parallel.c                             | 4 ++--
 chardev/char-pipe.c                                 | 4 ++--
 chardev/char-pty.c                                  | 4 ++--
 chardev/char-ringbuf.c                              | 4 ++--
 chardev/char-serial.c                               | 4 ++--
 chardev/char-socket.c                               | 8 ++++----
 chardev/char-stdio.c                                | 4 ++--
 chardev/char-udp.c                                  | 4 ++--
 chardev/char-win-stdio.c                            | 2 +-
 chardev/char.c                                      | 8 ++++----
 chardev/msmouse.c                                   | 2 +-
 chardev/spice.c                                     | 8 ++++----
 chardev/wctablet.c                                  | 2 +-
 gdbstub/system.c                                    | 2 +-
 ui/console-vc.c                                     | 4 ++--
 ui/dbus-chardev.c                                   | 8 ++++----
 ui/dbus.c                                           | 4 ++--
 ui/gtk.c                                            | 2 +-
 ui/spice-app.c                                      | 6 +++---
 ui/vdagent.c                                        | 4 ++--
 scripts/codeconverter/codeconverter/test_regexps.py | 2 +-
 29 files changed, 62 insertions(+), 62 deletions(-)

diff --git a/include/chardev/char.h b/include/chardev/char.h
index 192cad67d41..d33833b6c02 100644
--- a/include/chardev/char.h
+++ b/include/chardev/char.h
@@ -257,10 +257,10 @@ struct ChardevClass {
     bool supports_yank;
 
     /* parse command line options and populate QAPI @backend */
-    void (*parse)(QemuOpts *opts, ChardevBackend *backend, Error **errp);
+    void (*chr_parse)(QemuOpts *opts, ChardevBackend *backend, Error **errp);
 
     /* called after construction, open/starts the backend */
-    void (*open)(Chardev *chr, ChardevBackend *backend,
+    void (*chr_open)(Chardev *chr, ChardevBackend *backend,
                  bool *be_opened, Error **errp);
 
     /* write buf to the backend */
@@ -282,10 +282,10 @@ struct ChardevClass {
     int (*chr_ioctl)(Chardev *s, int cmd, void *arg);
 
     /* get ancillary-received fds during last read */
-    int (*get_msgfds)(Chardev *s, int* fds, int num);
+    int (*chr_get_msgfds)(Chardev *s, int* fds, int num);
 
     /* set ancillary fds to be sent with next write */
-    int (*set_msgfds)(Chardev *s, int *fds, int num);
+    int (*chr_set_msgfds)(Chardev *s, int *fds, int num);
 
     /* accept the given fd */
     int (*chr_add_client)(Chardev *chr, int fd);
diff --git a/chardev/baum.c b/chardev/baum.c
index 157f8b95195..75e41965c11 100644
--- a/chardev/baum.c
+++ b/chardev/baum.c
@@ -676,7 +676,7 @@ static void char_braille_class_init(ObjectClass *oc, const void *data)
 {
     ChardevClass *cc = CHARDEV_CLASS(oc);
 
-    cc->open = baum_chr_open;
+    cc->chr_open = baum_chr_open;
     cc->chr_write = baum_chr_write;
     cc->chr_accept_input = baum_chr_accept_input;
 }
diff --git a/chardev/char-console.c b/chardev/char-console.c
index 7e1bf642ebd..9a2e012d53f 100644
--- a/chardev/char-console.c
+++ b/chardev/char-console.c
@@ -38,7 +38,7 @@ static void char_console_class_init(ObjectClass *oc, const void *data)
 {
     ChardevClass *cc = CHARDEV_CLASS(oc);
 
-    cc->open = qemu_chr_open_win_con;
+    cc->chr_open = qemu_chr_open_win_con;
 }
 
 static const TypeInfo char_console_type_info = {
diff --git a/chardev/char-fe.c b/chardev/char-fe.c
index 34b83fc1c4a..a44f2673731 100644
--- a/chardev/char-fe.c
+++ b/chardev/char-fe.c
@@ -130,8 +130,8 @@ int qemu_chr_fe_get_msgfds(CharFrontend *c, int *fds, int len)
         return -1;
     }
 
-    return CHARDEV_GET_CLASS(s)->get_msgfds ?
-        CHARDEV_GET_CLASS(s)->get_msgfds(s, fds, len) : -1;
+    return CHARDEV_GET_CLASS(s)->chr_get_msgfds ?
+        CHARDEV_GET_CLASS(s)->chr_get_msgfds(s, fds, len) : -1;
 }
 
 int qemu_chr_fe_set_msgfds(CharFrontend *c, int *fds, int num)
@@ -142,8 +142,8 @@ int qemu_chr_fe_set_msgfds(CharFrontend *c, int *fds, int num)
         return -1;
     }
 
-    return CHARDEV_GET_CLASS(s)->set_msgfds ?
-        CHARDEV_GET_CLASS(s)->set_msgfds(s, fds, num) : -1;
+    return CHARDEV_GET_CLASS(s)->chr_set_msgfds ?
+        CHARDEV_GET_CLASS(s)->chr_set_msgfds(s, fds, num) : -1;
 }
 
 void qemu_chr_fe_accept_input(CharFrontend *c)
diff --git a/chardev/char-file.c b/chardev/char-file.c
index 1f7adf592ff..1e293e7054a 100644
--- a/chardev/char-file.c
+++ b/chardev/char-file.c
@@ -133,8 +133,8 @@ static void char_file_class_init(ObjectClass *oc, const void *data)
 {
     ChardevClass *cc = CHARDEV_CLASS(oc);
 
-    cc->parse = qemu_chr_parse_file_out;
-    cc->open = qmp_chardev_open_file;
+    cc->chr_parse = qemu_chr_parse_file_out;
+    cc->chr_open = qmp_chardev_open_file;
 }
 
 static const TypeInfo char_file_type_info = {
diff --git a/chardev/char-hub.c b/chardev/char-hub.c
index d0967c22336..082baa84ab8 100644
--- a/chardev/char-hub.c
+++ b/chardev/char-hub.c
@@ -276,8 +276,8 @@ static void char_hub_class_init(ObjectClass *oc, const void *data)
 {
     ChardevClass *cc = CHARDEV_CLASS(oc);
 
-    cc->parse = qemu_chr_parse_hub;
-    cc->open = qemu_chr_open_hub;
+    cc->chr_parse = qemu_chr_parse_hub;
+    cc->chr_open = qemu_chr_open_hub;
     cc->chr_write = hub_chr_write;
     cc->chr_add_watch = hub_chr_add_watch;
     /* We handle events from backends only */
diff --git a/chardev/char-mux.c b/chardev/char-mux.c
index db9e89f441d..c82c2da56dd 100644
--- a/chardev/char-mux.c
+++ b/chardev/char-mux.c
@@ -451,8 +451,8 @@ static void char_mux_class_init(ObjectClass *oc, const void *data)
 {
     ChardevClass *cc = CHARDEV_CLASS(oc);
 
-    cc->parse = qemu_chr_parse_mux;
-    cc->open = qemu_chr_open_mux;
+    cc->chr_parse = qemu_chr_parse_mux;
+    cc->chr_open = qemu_chr_open_mux;
     cc->chr_write = mux_chr_write;
     cc->chr_accept_input = mux_chr_accept_input;
     cc->chr_add_watch = mux_chr_add_watch;
diff --git a/chardev/char-null.c b/chardev/char-null.c
index 89cb85da792..674603b3807 100644
--- a/chardev/char-null.c
+++ b/chardev/char-null.c
@@ -38,7 +38,7 @@ static void char_null_class_init(ObjectClass *oc, const void *data)
 {
     ChardevClass *cc = CHARDEV_CLASS(oc);
 
-    cc->open = null_chr_open;
+    cc->chr_open = null_chr_open;
 }
 
 static const TypeInfo char_null_type_info = {
diff --git a/chardev/char-parallel.c b/chardev/char-parallel.c
index 62a44b2f969..a0839b784b8 100644
--- a/chardev/char-parallel.c
+++ b/chardev/char-parallel.c
@@ -274,8 +274,8 @@ static void char_parallel_class_init(ObjectClass *oc, const void *data)
 {
     ChardevClass *cc = CHARDEV_CLASS(oc);
 
-    cc->parse = qemu_chr_parse_parallel;
-    cc->open = qmp_chardev_open_parallel;
+    cc->chr_parse = qemu_chr_parse_parallel;
+    cc->chr_open = qmp_chardev_open_parallel;
     cc->chr_ioctl = pp_ioctl;
 }
 
diff --git a/chardev/char-pipe.c b/chardev/char-pipe.c
index e9f3bb82904..a2cd322efe6 100644
--- a/chardev/char-pipe.c
+++ b/chardev/char-pipe.c
@@ -182,8 +182,8 @@ static void char_pipe_class_init(ObjectClass *oc, const void *data)
 {
     ChardevClass *cc = CHARDEV_CLASS(oc);
 
-    cc->parse = qemu_chr_parse_pipe;
-    cc->open = qemu_chr_open_pipe;
+    cc->chr_parse = qemu_chr_parse_pipe;
+    cc->chr_open = qemu_chr_open_pipe;
 }
 
 static const TypeInfo char_pipe_type_info = {
diff --git a/chardev/char-pty.c b/chardev/char-pty.c
index 652b0bd9e73..1a15082b025 100644
--- a/chardev/char-pty.c
+++ b/chardev/char-pty.c
@@ -394,8 +394,8 @@ static void char_pty_class_init(ObjectClass *oc, const void *data)
 {
     ChardevClass *cc = CHARDEV_CLASS(oc);
 
-    cc->parse = char_pty_parse;
-    cc->open = char_pty_open;
+    cc->chr_parse = char_pty_parse;
+    cc->chr_open = char_pty_open;
     cc->chr_write = char_pty_chr_write;
     cc->chr_update_read_handler = pty_chr_update_read_handler;
     cc->chr_add_watch = pty_chr_add_watch;
diff --git a/chardev/char-ringbuf.c b/chardev/char-ringbuf.c
index 98aadb6acfb..6d5ba667bb4 100644
--- a/chardev/char-ringbuf.c
+++ b/chardev/char-ringbuf.c
@@ -227,8 +227,8 @@ static void char_ringbuf_class_init(ObjectClass *oc, const void *data)
 {
     ChardevClass *cc = CHARDEV_CLASS(oc);
 
-    cc->parse = qemu_chr_parse_ringbuf;
-    cc->open = qemu_chr_open_ringbuf;
+    cc->chr_parse = qemu_chr_parse_ringbuf;
+    cc->chr_open = qemu_chr_open_ringbuf;
     cc->chr_write = ringbuf_chr_write;
 }
 
diff --git a/chardev/char-serial.c b/chardev/char-serial.c
index 4c6ca713eb1..97ed7adf736 100644
--- a/chardev/char-serial.c
+++ b/chardev/char-serial.c
@@ -305,8 +305,8 @@ static void char_serial_class_init(ObjectClass *oc, const void *data)
 {
     ChardevClass *cc = CHARDEV_CLASS(oc);
 
-    cc->parse = qemu_chr_parse_serial;
-    cc->open = qmp_chardev_open_serial;
+    cc->chr_parse = qemu_chr_parse_serial;
+    cc->chr_open = qmp_chardev_open_serial;
 #ifndef _WIN32
     cc->chr_ioctl = tty_serial_ioctl;
 #endif
diff --git a/chardev/char-socket.c b/chardev/char-socket.c
index 3f45dd2ecdc..149a6d8cc15 100644
--- a/chardev/char-socket.c
+++ b/chardev/char-socket.c
@@ -1585,14 +1585,14 @@ static void char_socket_class_init(ObjectClass *oc, const void *data)
 
     cc->supports_yank = true;
 
-    cc->parse = qemu_chr_parse_socket;
-    cc->open = qmp_chardev_open_socket;
+    cc->chr_parse = qemu_chr_parse_socket;
+    cc->chr_open = qmp_chardev_open_socket;
     cc->chr_wait_connected = tcp_chr_wait_connected;
     cc->chr_write = tcp_chr_write;
     cc->chr_sync_read = tcp_chr_sync_read;
     cc->chr_disconnect = tcp_chr_disconnect;
-    cc->get_msgfds = tcp_get_msgfds;
-    cc->set_msgfds = tcp_set_msgfds;
+    cc->chr_get_msgfds = tcp_get_msgfds;
+    cc->chr_set_msgfds = tcp_set_msgfds;
     cc->chr_add_client = tcp_chr_add_client;
     cc->chr_add_watch = tcp_chr_add_watch;
     cc->chr_update_read_handler = tcp_chr_update_read_handler;
diff --git a/chardev/char-stdio.c b/chardev/char-stdio.c
index 2568164a108..b7e9af1388f 100644
--- a/chardev/char-stdio.c
+++ b/chardev/char-stdio.c
@@ -142,9 +142,9 @@ static void char_stdio_class_init(ObjectClass *oc, const void *data)
 {
     ChardevClass *cc = CHARDEV_CLASS(oc);
 
-    cc->parse = qemu_chr_parse_stdio;
+    cc->chr_parse = qemu_chr_parse_stdio;
 #ifndef _WIN32
-    cc->open = qemu_chr_open_stdio;
+    cc->chr_open = qemu_chr_open_stdio;
     cc->chr_set_echo = qemu_chr_set_echo_stdio;
 #endif
 }
diff --git a/chardev/char-udp.c b/chardev/char-udp.c
index 1025f577a0d..71b8d8b37df 100644
--- a/chardev/char-udp.c
+++ b/chardev/char-udp.c
@@ -221,8 +221,8 @@ static void char_udp_class_init(ObjectClass *oc, const void *data)
 {
     ChardevClass *cc = CHARDEV_CLASS(oc);
 
-    cc->parse = qemu_chr_parse_udp;
-    cc->open = qmp_chardev_open_udp;
+    cc->chr_parse = qemu_chr_parse_udp;
+    cc->chr_open = qmp_chardev_open_udp;
     cc->chr_write = udp_chr_write;
     cc->chr_update_read_handler = udp_chr_update_read_handler;
 }
diff --git a/chardev/char-win-stdio.c b/chardev/char-win-stdio.c
index fb802a00b13..26e67aef1ca 100644
--- a/chardev/char-win-stdio.c
+++ b/chardev/char-win-stdio.c
@@ -260,7 +260,7 @@ static void char_win_stdio_class_init(ObjectClass *oc, const void *data)
 {
     ChardevClass *cc = CHARDEV_CLASS(oc);
 
-    cc->open = qemu_chr_open_stdio;
+    cc->chr_open = qemu_chr_open_stdio;
     cc->chr_write = win_stdio_write;
     cc->chr_set_echo = qemu_chr_set_echo_win_stdio;
 }
diff --git a/chardev/char.c b/chardev/char.c
index 3e432195a5a..df37d1df161 100644
--- a/chardev/char.c
+++ b/chardev/char.c
@@ -267,8 +267,8 @@ static void qemu_char_open(Chardev *chr, ChardevBackend *backend,
         }
     }
 
-    if (cc->open) {
-        cc->open(chr, backend, be_opened, errp);
+    if (cc->chr_open) {
+        cc->chr_open(chr, backend, be_opened, errp);
     }
 }
 
@@ -604,8 +604,8 @@ ChardevBackend *qemu_chr_parse_opts(QemuOpts *opts, Error **errp)
     backend = g_new0(ChardevBackend, 1);
     backend->type = CHARDEV_BACKEND_KIND_NULL;
 
-    if (cc->parse) {
-        cc->parse(opts, backend, &local_err);
+    if (cc->chr_parse) {
+        cc->chr_parse(opts, backend, &local_err);
         if (local_err) {
             error_propagate(errp, local_err);
             qapi_free_ChardevBackend(backend);
diff --git a/chardev/msmouse.c b/chardev/msmouse.c
index 1a55755d397..84050164893 100644
--- a/chardev/msmouse.c
+++ b/chardev/msmouse.c
@@ -271,7 +271,7 @@ static void char_msmouse_class_init(ObjectClass *oc, const void *data)
 {
     ChardevClass *cc = CHARDEV_CLASS(oc);
 
-    cc->open = msmouse_chr_open;
+    cc->chr_open = msmouse_chr_open;
     cc->chr_write = msmouse_chr_write;
     cc->chr_accept_input = msmouse_chr_accept_input;
     cc->chr_ioctl = msmouse_ioctl;
diff --git a/chardev/spice.c b/chardev/spice.c
index 39b79d60fb4..61caa6d0efe 100644
--- a/chardev/spice.c
+++ b/chardev/spice.c
@@ -364,8 +364,8 @@ static void char_spicevmc_class_init(ObjectClass *oc, const void *data)
 {
     ChardevClass *cc = CHARDEV_CLASS(oc);
 
-    cc->parse = qemu_chr_parse_spice_vmc;
-    cc->open = qemu_chr_open_spice_vmc;
+    cc->chr_parse = qemu_chr_parse_spice_vmc;
+    cc->chr_open = qemu_chr_open_spice_vmc;
     cc->chr_set_fe_open = spice_vmc_set_fe_open;
 }
 
@@ -380,8 +380,8 @@ static void char_spiceport_class_init(ObjectClass *oc, const void *data)
 {
     ChardevClass *cc = CHARDEV_CLASS(oc);
 
-    cc->parse = qemu_chr_parse_spice_port;
-    cc->open = qemu_chr_open_spice_port;
+    cc->chr_parse = qemu_chr_parse_spice_port;
+    cc->chr_open = qemu_chr_open_spice_port;
     cc->chr_set_fe_open = spice_port_set_fe_open;
 }
 
diff --git a/chardev/wctablet.c b/chardev/wctablet.c
index 0dc6ef08f59..8285a56e7bc 100644
--- a/chardev/wctablet.c
+++ b/chardev/wctablet.c
@@ -346,7 +346,7 @@ static void wctablet_chr_class_init(ObjectClass *oc, const void *data)
 {
     ChardevClass *cc = CHARDEV_CLASS(oc);
 
-    cc->open = wctablet_chr_open;
+    cc->chr_open = wctablet_chr_open;
     cc->chr_write = wctablet_chr_write;
     cc->chr_ioctl = wctablet_chr_ioctl;
     cc->chr_accept_input = wctablet_chr_accept_input;
diff --git a/gdbstub/system.c b/gdbstub/system.c
index 8ec8b7ea336..29b9e16a908 100644
--- a/gdbstub/system.c
+++ b/gdbstub/system.c
@@ -244,7 +244,7 @@ static void char_gdb_class_init(ObjectClass *oc, const void *data)
     ChardevClass *cc = CHARDEV_CLASS(oc);
 
     cc->internal = true;
-    cc->open = gdb_monitor_open;
+    cc->chr_open = gdb_monitor_open;
     cc->chr_write = gdb_monitor_write;
 }
 
diff --git a/ui/console-vc.c b/ui/console-vc.c
index 830842064d6..931068d43ab 100644
--- a/ui/console-vc.c
+++ b/ui/console-vc.c
@@ -1185,8 +1185,8 @@ static void char_vc_class_init(ObjectClass *oc, const void *data)
 {
     ChardevClass *cc = CHARDEV_CLASS(oc);
 
-    cc->parse = vc_chr_parse;
-    cc->open = vc_chr_open;
+    cc->chr_parse = vc_chr_parse;
+    cc->chr_open = vc_chr_open;
     cc->chr_write = vc_chr_write;
     cc->chr_accept_input = vc_chr_accept_input;
     cc->chr_set_echo = vc_chr_set_echo;
diff --git a/ui/dbus-chardev.c b/ui/dbus-chardev.c
index d05dddaf81b..f6c426e2209 100644
--- a/ui/dbus-chardev.c
+++ b/ui/dbus-chardev.c
@@ -205,12 +205,12 @@ dbus_chr_open(Chardev *chr, ChardevBackend *backend,
     opts = qemu_opts_create(qemu_find_opts("chardev"), NULL, 0, &error_abort);
     qemu_opt_set(opts, "server", "on", &error_abort);
     qemu_opt_set(opts, "wait", "off", &error_abort);
-    CHARDEV_CLASS(object_class_by_name(TYPE_CHARDEV_SOCKET))->parse(
+    CHARDEV_CLASS(object_class_by_name(TYPE_CHARDEV_SOCKET))->chr_parse(
         opts, be, errp);
     if (*errp) {
         return;
     }
-    CHARDEV_CLASS(object_class_by_name(TYPE_CHARDEV_SOCKET))->open(
+    CHARDEV_CLASS(object_class_by_name(TYPE_CHARDEV_SOCKET))->chr_open(
         chr, be, be_opened, errp);
 }
 
@@ -274,8 +274,8 @@ char_dbus_class_init(ObjectClass *oc, const void *data)
     DBusChardevClass *klass = DBUS_CHARDEV_CLASS(oc);
     ChardevClass *cc = CHARDEV_CLASS(oc);
 
-    cc->parse = dbus_chr_parse;
-    cc->open = dbus_chr_open;
+    cc->chr_parse = dbus_chr_parse;
+    cc->chr_open = dbus_chr_open;
     cc->chr_set_fe_open = dbus_chr_set_fe_open;
     cc->chr_set_echo = dbus_chr_set_echo;
     klass->parent_chr_be_event = cc->chr_be_event;
diff --git a/ui/dbus.c b/ui/dbus.c
index d2dff332585..31f6eb1189f 100644
--- a/ui/dbus.c
+++ b/ui/dbus.c
@@ -451,8 +451,8 @@ dbus_vc_class_init(ObjectClass *oc, const void *data)
     DBusVCClass *klass = DBUS_VC_CLASS(oc);
     ChardevClass *cc = CHARDEV_CLASS(oc);
 
-    klass->parent_parse = cc->parse;
-    cc->parse = dbus_vc_parse;
+    klass->parent_parse = cc->chr_parse;
+    cc->chr_parse = dbus_vc_parse;
 }
 
 static const TypeInfo dbus_vc_type_info = {
diff --git a/ui/gtk.c b/ui/gtk.c
index e83a3666258..6217e9552e3 100644
--- a/ui/gtk.c
+++ b/ui/gtk.c
@@ -1985,7 +1985,7 @@ static void char_gd_vc_class_init(ObjectClass *oc, const void *data)
 {
     ChardevClass *cc = CHARDEV_CLASS(oc);
 
-    cc->open = gd_vc_open;
+    cc->chr_open = gd_vc_open;
     cc->chr_write = gd_vc_chr_write;
     cc->chr_accept_input = gd_vc_chr_accept_input;
     cc->chr_set_echo = gd_vc_chr_set_echo;
diff --git a/ui/spice-app.c b/ui/spice-app.c
index 24f78f305c4..ea0b62a22b7 100644
--- a/ui/spice-app.c
+++ b/ui/spice-app.c
@@ -106,10 +106,10 @@ static void char_vc_class_init(ObjectClass *oc, const void *data)
     VCChardevClass *vc = CHARDEV_VC_CLASS(oc);
     ChardevClass *cc = CHARDEV_CLASS(oc);
 
-    vc->parent_open = cc->open;
+    vc->parent_open = cc->chr_open;
 
-    cc->parse = vc_chr_parse;
-    cc->open = vc_chr_open;
+    cc->chr_parse = vc_chr_parse;
+    cc->chr_open = vc_chr_open;
     cc->chr_set_echo = vc_chr_set_echo;
 }
 
diff --git a/ui/vdagent.c b/ui/vdagent.c
index 142a3691ac9..090771ab171 100644
--- a/ui/vdagent.c
+++ b/ui/vdagent.c
@@ -924,8 +924,8 @@ static void vdagent_chr_class_init(ObjectClass *oc, const void *data)
 {
     ChardevClass *cc = CHARDEV_CLASS(oc);
 
-    cc->parse            = vdagent_chr_parse;
-    cc->open             = vdagent_chr_open;
+    cc->chr_parse        = vdagent_chr_parse;
+    cc->chr_open         = vdagent_chr_open;
     cc->chr_write        = vdagent_chr_write;
     cc->chr_set_fe_open  = vdagent_chr_set_fe_open;
     cc->chr_accept_input = vdagent_chr_accept_input;
diff --git a/scripts/codeconverter/codeconverter/test_regexps.py b/scripts/codeconverter/codeconverter/test_regexps.py
index b00e9ef15b2..d3a5cc3ad38 100644
--- a/scripts/codeconverter/codeconverter/test_regexps.py
+++ b/scripts/codeconverter/codeconverter/test_regexps.py
@@ -57,7 +57,7 @@ def fullmatch(regexp, s):
 
     print(RE_TYPEINFO_START)
     assert re.search(RE_TYPEINFO_START, r'''
-    cc->open = qmp_chardev_open_file;
+    cc->chr_open = qmp_chardev_open_file;
 }
 
 static const TypeInfo char_file_type_info = {
-- 
2.52.0


