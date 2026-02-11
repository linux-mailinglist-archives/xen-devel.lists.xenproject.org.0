Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YCitLmV4jGktpAAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 11 Feb 2026 13:39:01 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 367A0124658
	for <lists+xen-devel@lfdr.de>; Wed, 11 Feb 2026 13:39:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1227533.1533956 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vq9Uc-0007t8-1w; Wed, 11 Feb 2026 12:38:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1227533.1533956; Wed, 11 Feb 2026 12:38:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vq9Ub-0007pm-TM; Wed, 11 Feb 2026 12:38:53 +0000
Received: by outflank-mailman (input) for mailman id 1227533;
 Wed, 11 Feb 2026 12:38:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UZeC=AP=redhat.com=marcandre.lureau@srs-se1.protection.inumbo.net>)
 id 1vq9Nd-0001nh-NG
 for xen-devel@lists.xenproject.org; Wed, 11 Feb 2026 12:31:41 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9d4dced9-0745-11f1-b162-2bf370ae4941;
 Wed, 11 Feb 2026 13:31:41 +0100 (CET)
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-68-WIujemrANsyyw5L1QkdvYg-1; Wed,
 11 Feb 2026 07:31:36 -0500
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id C10951955F27; Wed, 11 Feb 2026 12:31:34 +0000 (UTC)
Received: from localhost (unknown [10.45.242.6])
 by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 7D7B130001BF; Wed, 11 Feb 2026 12:31:33 +0000 (UTC)
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
X-Inumbo-ID: 9d4dced9-0745-11f1-b162-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1770813099;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=oafPsMhhX2LYktt1mZytvPrd7reHuMI6cpisN3UVjHk=;
	b=aj445UeDgTtmkriiBG7dMmAJdELD6NkG3uNoUrYCkXLQeRhs/lu2oggiW//LVwmuDYX8yX
	s2uVXbaRM27ZmXdwLVlJWoxOBC+YZ2h2GJ3mTqXfwoQg/+fncAq2fneyq1de2EX0h0EVMQ
	B0L70j63ZFcaaIbKdoIWj0aQfzmc5iE=
X-MC-Unique: WIujemrANsyyw5L1QkdvYg-1
X-Mimecast-MFC-AGG-ID: WIujemrANsyyw5L1QkdvYg_1770813094
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
Subject: [PULL 14/14] chardev: add logtimestamp option
Date: Wed, 11 Feb 2026 16:30:01 +0400
Message-ID: <20260211123007.3569932-15-marcandre.lureau@redhat.com>
In-Reply-To: <20260211123007.3569932-1-marcandre.lureau@redhat.com>
References: <20260211123007.3569932-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
X-Mimecast-MFC-PROC-ID: dZjaz2DoEH78eRcqwCgXQ2BHDfDWB1jtulChYzIupms_1770813094
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
X-Rspamd-Queue-Id: 367A0124658
X-Rspamd-Action: no action

From: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>

Add an option to inject timestamps into serial log file.
That simplifies debugging a lot, when you can simply compare
QEMU logs with guest console logs.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
Acked-by: Markus Armbruster <armbru@redhat.com>
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Message-ID: <20260201173633.413934-4-vsementsov@yandex-team.ru>
---
 qapi/char.json         |  6 +++-
 include/chardev/char.h |  2 ++
 chardev/char.c         | 63 ++++++++++++++++++++++++++++++++++++++----
 3 files changed, 65 insertions(+), 6 deletions(-)

diff --git a/qapi/char.json b/qapi/char.json
index 140614f82c3..a4abafa6803 100644
--- a/qapi/char.json
+++ b/qapi/char.json
@@ -197,11 +197,15 @@
 # @logappend: true to append instead of truncate (default to false to
 #     truncate)
 #
+# @logtimestamp: true to insert timestamps into logfile
+#     (default false) (since 11.0)
+#
 # Since: 2.6
 ##
 { 'struct': 'ChardevCommon',
   'data': { '*logfile': 'str',
-            '*logappend': 'bool' } }
+            '*logappend': 'bool',
+            '*logtimestamp': 'bool' } }
 
 ##
 # @ChardevFile:
diff --git a/include/chardev/char.h b/include/chardev/char.h
index 81bc0cbdf2a..c2c42e4b7a3 100644
--- a/include/chardev/char.h
+++ b/include/chardev/char.h
@@ -63,6 +63,8 @@ struct Chardev {
     CharFrontend *fe;
     char *label;
     int logfd;
+    bool logtimestamp;
+    bool log_line_start;
     int be_open;
     /* used to coordinate the chardev-change special-case: */
     bool handover_yank_instance;
diff --git a/chardev/char.c b/chardev/char.c
index 4b285baf029..48b326d57b9 100644
--- a/chardev/char.c
+++ b/chardev/char.c
@@ -82,12 +82,8 @@ void qemu_chr_be_event(Chardev *s, QEMUChrEvent event)
     CHARDEV_GET_CLASS(s)->chr_be_event(s, event);
 }
 
-static void qemu_chr_write_log(Chardev *s, const uint8_t *buf, size_t len)
+static void do_write_log(Chardev *s, const uint8_t *buf, size_t len)
 {
-    if (s->logfd < 0) {
-        return;
-    }
-
     if (qemu_write_full(s->logfd, buf, len) < len) {
         /*
          * qemu_write_full() is defined with G_GNUC_WARN_UNUSED_RESULT,
@@ -96,6 +92,55 @@ static void qemu_chr_write_log(Chardev *s, const uint8_t *buf, size_t len)
     }
 }
 
+static void do_write_log_timestamps(Chardev *s, const uint8_t *buf, size_t len)
+{
+    g_autofree char *timestr = NULL;
+
+    while (len) {
+        size_t i;
+
+        if (s->log_line_start) {
+            if (!timestr) {
+                timestr = real_time_iso8601();
+            }
+            do_write_log(s, (const uint8_t *)timestr, strlen(timestr));
+            do_write_log(s, (const uint8_t *)" ", 1);
+            s->log_line_start = false;
+        }
+
+        for (i = 0; i < len; i++) {
+            if (buf[i] == '\n') {
+                break;
+            }
+        }
+
+        if (i == len) {
+            /* not found \n */
+            do_write_log(s, buf, len);
+            return;
+        }
+
+        i += 1;
+        do_write_log(s, buf, i);
+        buf += i;
+        len -= i;
+        s->log_line_start = true;
+    }
+}
+
+static void qemu_chr_write_log(Chardev *s, const uint8_t *buf, size_t len)
+{
+    if (s->logfd < 0) {
+        return;
+    }
+
+    if (s->logtimestamp) {
+        do_write_log_timestamps(s, buf, len);
+    } else {
+        do_write_log(s, buf, len);
+    }
+}
+
 static int qemu_chr_write_buffer(Chardev *s,
                                  const uint8_t *buf, int len,
                                  int *offset, bool write_all)
@@ -248,6 +293,7 @@ static bool qemu_char_open(Chardev *chr, ChardevBackend *backend, Error **errp)
         } else {
             flags |= O_TRUNC;
         }
+        chr->logtimestamp = common->has_logtimestamp && common->logtimestamp;
         chr->logfd = qemu_create(common->logfile, flags, 0666, errp);
         if (chr->logfd < 0) {
             return false;
@@ -267,6 +313,7 @@ static void char_init(Object *obj)
 
     chr->handover_yank_instance = false;
     chr->logfd = -1;
+    chr->log_line_start = true;
     qemu_mutex_init(&chr->chr_write_lock);
 
     /*
@@ -505,6 +552,9 @@ void qemu_chr_parse_common(QemuOpts *opts, ChardevCommon *backend)
     backend->logfile = g_strdup(logfile);
     backend->has_logappend = true;
     backend->logappend = qemu_opt_get_bool(opts, "logappend", false);
+
+    backend->has_logtimestamp = true;
+    backend->logtimestamp = qemu_opt_get_bool(opts, "logtimestamp", false);
 }
 
 static const ChardevClass *char_get_class(const char *driver, Error **errp)
@@ -956,6 +1006,9 @@ QemuOptsList qemu_chardev_opts = {
         },{
             .name = "logappend",
             .type = QEMU_OPT_BOOL,
+        },{
+            .name = "logtimestamp",
+            .type = QEMU_OPT_BOOL,
         },{
             .name = "mouse",
             .type = QEMU_OPT_BOOL,
-- 
2.52.0


