Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wJLCNWx4jGktpAAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 11 Feb 2026 13:39:08 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 75744124667
	for <lists+xen-devel@lfdr.de>; Wed, 11 Feb 2026 13:39:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1227541.1533964 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vq9Uj-0008Ny-Eg; Wed, 11 Feb 2026 12:39:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1227541.1533964; Wed, 11 Feb 2026 12:39:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vq9Uj-0008LN-BC; Wed, 11 Feb 2026 12:39:01 +0000
Received: by outflank-mailman (input) for mailman id 1227541;
 Wed, 11 Feb 2026 12:39:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UZeC=AP=redhat.com=marcandre.lureau@srs-se1.protection.inumbo.net>)
 id 1vq9NJ-0001nh-7Y
 for xen-devel@lists.xenproject.org; Wed, 11 Feb 2026 12:31:21 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 90f832f3-0745-11f1-b162-2bf370ae4941;
 Wed, 11 Feb 2026 13:31:20 +0100 (CET)
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-27-vuGe2ZcvOIGOm3x7YZ09mA-1; Wed,
 11 Feb 2026 07:31:15 -0500
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id CCC011800454; Wed, 11 Feb 2026 12:31:13 +0000 (UTC)
Received: from localhost (unknown [10.45.242.6])
 by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 738A330001A8; Wed, 11 Feb 2026 12:31:12 +0000 (UTC)
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
X-Inumbo-ID: 90f832f3-0745-11f1-b162-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1770813078;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NawPSV0+R7Z6iBTNYDG41PH3COFdnG/VW+iZ15ECL/g=;
	b=JZK+gZdIa7y5dr69Q073QF37R/hEdLi4fSXYoQcPO1Pc15qw3QNmqBjZCu7XufmwNLMsO2
	dRmvFtvEwU+FQJg8EnBYvCwGpxkMUn/KkTtg4gNjE0F7bbPF9QcPtWkSFs1L19PKwhN0QG
	grcnVbkQRyQcpqYvCAbcd1YXanuMRws=
X-MC-Unique: vuGe2ZcvOIGOm3x7YZ09mA-1
X-Mimecast-MFC-AGG-ID: vuGe2ZcvOIGOm3x7YZ09mA_1770813074
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
Subject: [PULL 10/14] chardev: rework filename handling
Date: Wed, 11 Feb 2026 16:29:57 +0400
Message-ID: <20260211123007.3569932-11-marcandre.lureau@redhat.com>
In-Reply-To: <20260211123007.3569932-1-marcandre.lureau@redhat.com>
References: <20260211123007.3569932-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
X-Mimecast-MFC-PROC-ID: c-_Sek1T2OdFJX7Kp4aPVImd5YgfiBwkExksSBCdhrc_1770813074
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
X-Rspamd-Queue-Id: 75744124667
X-Rspamd-Action: no action

From: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>

Instead of checking, did backend set the filename state or not, let's
be stateless: filename is needed rarely, so, let's just have a generic
function (with optional implementation by backends) to get it.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
[ Marc-André - fix leak in ivshmem-pci.c ]
Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Message-Id: <20260115144606.233252-10-vsementsov@yandex-team.ru>
---
 include/chardev/char.h |  5 ++++-
 chardev/char-pty.c     |  8 +++++++-
 chardev/char-socket.c  | 31 ++++++++++++-------------------
 chardev/char.c         | 21 +++++++++++++++------
 hw/misc/ivshmem-pci.c  |  7 ++++---
 5 files changed, 42 insertions(+), 30 deletions(-)

diff --git a/include/chardev/char.h b/include/chardev/char.h
index ada5529fa6c..81bc0cbdf2a 100644
--- a/include/chardev/char.h
+++ b/include/chardev/char.h
@@ -62,7 +62,6 @@ struct Chardev {
     QemuMutex chr_write_lock;
     CharFrontend *fe;
     char *label;
-    char *filename;
     int logfd;
     int be_open;
     /* used to coordinate the chardev-change special-case: */
@@ -309,6 +308,9 @@ struct ChardevClass {
 
     /* return PTY name if available */
     char *(*chr_get_pty_name)(Chardev *s);
+
+    /* get filename for reporting */
+    char *(*chr_get_filename)(Chardev *s);
 };
 
 Chardev *qemu_chardev_new(const char *id, const char *typename,
@@ -324,5 +326,6 @@ void suspend_mux_open(void);
 void resume_mux_open(void);
 
 char *qemu_chr_get_pty_name(Chardev *chr);
+char *qemu_chr_get_filename(Chardev *chr);
 
 #endif
diff --git a/chardev/char-pty.c b/chardev/char-pty.c
index 047aade09e5..7e95132cdbb 100644
--- a/chardev/char-pty.c
+++ b/chardev/char-pty.c
@@ -351,7 +351,6 @@ static bool pty_chr_open(Chardev *chr, ChardevBackend *backend, Error **errp)
         return false;
     }
 
-    chr->filename = g_strdup_printf("pty:%s", s->pty_name);
     qemu_printf("char device redirected to %s (label %s)\n",
                 s->pty_name, chr->label);
 
@@ -393,6 +392,12 @@ static char *pty_chr_get_pty_name(Chardev *chr)
     return g_strdup(s->pty_name);
 }
 
+static char *pty_chr_get_filename(Chardev *chr)
+{
+    PtyChardev *s = PTY_CHARDEV(chr);
+    return g_strdup_printf("pty:%s", s->pty_name);
+}
+
 static void char_pty_class_init(ObjectClass *oc, const void *data)
 {
     ChardevClass *cc = CHARDEV_CLASS(oc);
@@ -403,6 +408,7 @@ static void char_pty_class_init(ObjectClass *oc, const void *data)
     cc->chr_update_read_handler = pty_chr_update_read_handler;
     cc->chr_add_watch = pty_chr_add_watch;
     cc->chr_get_pty_name = pty_chr_get_pty_name;
+    cc->chr_get_filename = pty_chr_get_filename;
 }
 
 static const TypeInfo char_pty_type_info = {
diff --git a/chardev/char-socket.c b/chardev/char-socket.c
index 908bbdbc124..5adeb908659 100644
--- a/chardev/char-socket.c
+++ b/chardev/char-socket.c
@@ -40,6 +40,7 @@
 
 static gboolean socket_reconnect_timeout(gpointer opaque);
 static void tcp_chr_telnet_init(Chardev *chr);
+static char *qemu_chr_compute_filename(SocketChardev *s);
 
 static void tcp_chr_change_state(SocketChardev *s, TCPChardevState state)
 {
@@ -384,8 +385,6 @@ static void tcp_chr_free_connection(Chardev *chr)
     s->sioc = NULL;
     object_unref(OBJECT(s->ioc));
     s->ioc = NULL;
-    g_free(chr->filename);
-    chr->filename = NULL;
     tcp_chr_change_state(s, TCP_CHARDEV_STATE_DISCONNECTED);
 }
 
@@ -439,16 +438,17 @@ static char *qemu_chr_socket_address(SocketChardev *s, const char *prefix)
     }
 }
 
-static void update_disconnected_filename(SocketChardev *s)
+static char *tcp_chr_get_filename(Chardev *chr)
 {
-    Chardev *chr = CHARDEV(s);
+    SocketChardev *s = SOCKET_CHARDEV(chr);
 
-    g_free(chr->filename);
-    if (s->addr) {
-        chr->filename = qemu_chr_socket_address(s, "disconnected:");
-    } else {
-        chr->filename = g_strdup("disconnected:socket");
+    if (s->state == TCP_CHARDEV_STATE_CONNECTED) {
+        return qemu_chr_compute_filename(s);
+    } else if (s->addr) {
+        return qemu_chr_socket_address(s, "disconnected:");
     }
+
+    return g_strdup("disconnected:socket");
 }
 
 /* NB may be called even if tcp_chr_connect has not been
@@ -468,7 +468,6 @@ static void tcp_chr_disconnect_locked(Chardev *chr)
         qio_net_listener_set_client_func_full(s->listener, tcp_chr_accept,
                                               chr, NULL, chr->gcontext);
     }
-    update_disconnected_filename(s);
     if (emit_close) {
         qemu_chr_be_event(chr, CHR_EVENT_CLOSED);
     }
@@ -639,9 +638,6 @@ static void tcp_chr_connect(void *opaque)
     Chardev *chr = CHARDEV(opaque);
     SocketChardev *s = SOCKET_CHARDEV(opaque);
 
-    g_free(chr->filename);
-    chr->filename = qemu_chr_compute_filename(s);
-
     tcp_chr_change_state(s, TCP_CHARDEV_STATE_CONNECTED);
     update_ioc_handlers(s);
     qemu_chr_be_event(chr, CHR_EVENT_OPENED);
@@ -1000,8 +996,8 @@ static void tcp_chr_accept_server_sync(Chardev *chr)
 {
     SocketChardev *s = SOCKET_CHARDEV(chr);
     QIOChannelSocket *sioc;
-    info_report("QEMU waiting for connection on: %s",
-                chr->filename);
+    g_autofree char *filename = qemu_chr_get_filename(chr);
+    info_report("QEMU waiting for connection on: %s", filename);
     tcp_chr_change_state(s, TCP_CHARDEV_STATE_CONNECTING);
     sioc = qio_net_listener_wait_client(s->listener);
     tcp_chr_set_client_ioc_name(chr, sioc);
@@ -1258,8 +1254,6 @@ static int qmp_chardev_open_socket_server(Chardev *chr,
     s->addr = qio_net_listener_get_local_address(s->listener, 0, errp);
 
 skip_listen:
-    update_disconnected_filename(s);
-
     if (is_waitconnect) {
         tcp_chr_accept_server_sync(chr);
     } else {
@@ -1436,8 +1430,6 @@ static bool tcp_chr_open(Chardev *chr, ChardevBackend *backend, Error **errp)
     }
     s->registered_yank = true;
 
-    update_disconnected_filename(s);
-
     if (s->is_listen) {
         if (qmp_chardev_open_socket_server(chr, is_telnet || is_tn3270,
                                            is_waitconnect, errp) < 0) {
@@ -1593,6 +1585,7 @@ static void char_socket_class_init(ObjectClass *oc, const void *data)
     cc->chr_add_watch = tcp_chr_add_watch;
     cc->chr_update_read_handler = tcp_chr_update_read_handler;
     cc->chr_listener_cleanup = tcp_chr_listener_cleanup;
+    cc->chr_get_filename = tcp_chr_get_filename;
 
     object_class_property_add(oc, "addr", "SocketAddress",
                               char_socket_get_addr, NULL,
diff --git a/chardev/char.c b/chardev/char.c
index 0dc792b88f7..3373c9b61f8 100644
--- a/chardev/char.c
+++ b/chardev/char.c
@@ -309,7 +309,6 @@ static void char_finalize(Object *obj)
     if (chr->fe) {
         chr->fe->chr = NULL;
     }
-    g_free(chr->filename);
     g_free(chr->label);
     if (chr->logfd != -1) {
         close(chr->logfd);
@@ -796,7 +795,7 @@ static int qmp_query_chardev_foreach(Object *obj, void *data)
     ChardevInfo *value = g_malloc0(sizeof(*value));
 
     value->label = g_strdup(chr->label);
-    value->filename = g_strdup(chr->filename);
+    value->filename = qemu_chr_get_filename(chr);
     value->frontend_open = chr->fe && chr->fe->fe_is_open;
 
     QAPI_LIST_PREPEND(*list, value);
@@ -1025,10 +1024,6 @@ static Chardev *chardev_new(const char *id, const char *typename,
         return NULL;
     }
 
-    if (!chr->filename) {
-        chr->filename = g_strdup(typename + 8);
-    }
-
     return chr;
 }
 
@@ -1110,6 +1105,20 @@ char *qemu_chr_get_pty_name(Chardev *chr)
     return NULL;
 }
 
+char *qemu_chr_get_filename(Chardev *chr)
+{
+    ChardevClass *cc = CHARDEV_GET_CLASS(chr);
+    const char *typename;
+
+    if (cc->chr_get_filename) {
+        return cc->chr_get_filename(chr);
+    }
+
+    typename = object_get_typename(OBJECT(chr));
+    assert(g_str_has_prefix(typename, "chardev-"));
+    return g_strdup(typename + 8);
+}
+
 ChardevReturn *qmp_chardev_change(const char *id, ChardevBackend *backend,
                                   Error **errp)
 {
diff --git a/hw/misc/ivshmem-pci.c b/hw/misc/ivshmem-pci.c
index b9162589a02..a3a43f53bd1 100644
--- a/hw/misc/ivshmem-pci.c
+++ b/hw/misc/ivshmem-pci.c
@@ -873,10 +873,11 @@ static void ivshmem_common_realize(PCIDevice *dev, Error **errp)
         host_memory_backend_set_mapped(s->hostmem, true);
     } else {
         Chardev *chr = qemu_chr_fe_get_driver(&s->server_chr);
-        assert(chr);
+        g_autofree char *filename = NULL;
 
-        IVSHMEM_DPRINTF("using shared memory server (socket = %s)\n",
-                        chr->filename);
+        assert(chr);
+        filename = qemu_chr_get_filename(chr);
+        IVSHMEM_DPRINTF("using shared memory server (socket = %s)\n", filename);
 
         /* we allocate enough space for 16 peers and grow as needed */
         resize_peers(s, 16);
-- 
2.52.0


