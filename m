Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aNH1Ku7zjmk5GAEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 13 Feb 2026 10:50:38 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D393134AC0
	for <lists+xen-devel@lfdr.de>; Fri, 13 Feb 2026 10:50:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1230437.1535951 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vqpoj-0004mR-K3; Fri, 13 Feb 2026 09:50:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1230437.1535951; Fri, 13 Feb 2026 09:50:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vqpoj-0004eq-AP; Fri, 13 Feb 2026 09:50:29 +0000
Received: by outflank-mailman (input) for mailman id 1230437;
 Fri, 13 Feb 2026 09:50:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Bqff=AR=redhat.com=marcandre.lureau@srs-se1.protection.inumbo.net>)
 id 1vqpoi-0001Na-EU
 for xen-devel@lists.xenproject.org; Fri, 13 Feb 2026 09:50:28 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6c54edcd-08c1-11f1-b163-2bf370ae4941;
 Fri, 13 Feb 2026 10:50:27 +0100 (CET)
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-524-qJo4xogmOe6TKqmwW-010Q-1; Fri,
 13 Feb 2026 04:50:23 -0500
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 230C2196C402; Fri, 13 Feb 2026 09:50:21 +0000 (UTC)
Received: from localhost (unknown [10.44.22.41])
 by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 4F8FC180067C; Fri, 13 Feb 2026 09:50:20 +0000 (UTC)
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
X-Inumbo-ID: 6c54edcd-08c1-11f1-b163-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1770976226;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tpYjeot8p53E9hbudpSJPO+xYO8RwO13MoSHQweyb84=;
	b=YsvJpCaydBJzkf+9rxNZdtmIwLukSZCSHwvi7kmGLLS5TvmtdJOAfvxDsN7+x/SHtJcefi
	hAwqlxiiyD3pidiGFV3EliNnKpduRvEhSa3+PEiZc64xJWf5c1/T9TsXZOlD64uRLiGSGv
	0K3nSG042/Cbb6R1+kapqPQ2fuCWU+o=
X-MC-Unique: qJo4xogmOe6TKqmwW-010Q-1
X-Mimecast-MFC-AGG-ID: qJo4xogmOe6TKqmwW-010Q_1770976221
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
Subject: [PULL v2 12/15] char: qemu_chr_write_log() use qemu_write_full()
Date: Fri, 13 Feb 2026 10:49:31 +0100
Message-ID: <20260213094938.4074478-13-marcandre.lureau@redhat.com>
In-Reply-To: <20260213094938.4074478-1-marcandre.lureau@redhat.com>
References: <20260213094938.4074478-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93
X-Mimecast-MFC-PROC-ID: 8c7XE562pWIRUZ4y5wlRy4cWwJO6hBNaO7ItS3QihEU_1770976221
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.32 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[redhat.com,quarantine];
	R_DKIM_ALLOW(-0.20)[redhat.com:s=mimecast20190719];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:qemu-devel@nongnu.org,m:alex.bennee@linaro.org,m:edgar.iglesias@gmail.com,m:berrange@redhat.com,m:eblake@redhat.com,m:armbru@redhat.com,m:paul@xen.org,m:anthony@xenproject.org,m:philmd@linaro.org,m:eduardo@habkost.net,m:pbonzini@redhat.com,m:marcandre.lureau@redhat.com,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,m:samuel.thibault@ens-lyon.org,m:vsementsov@yandex-team.ru,m:edgariglesias@gmail.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[marcandre.lureau@redhat.com,xen-devel-bounces@lists.xenproject.org];
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
X-Rspamd-Queue-Id: 9D393134AC0
X-Rspamd-Action: no action

From: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>

logfd is blocking, so we don't need to care about EAGAIN.
Let's simply use qemu_write_full().

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Message-ID: <20260201173633.413934-2-vsementsov@yandex-team.ru>
---
 chardev/char.c | 22 +++++-----------------
 1 file changed, 5 insertions(+), 17 deletions(-)

diff --git a/chardev/char.c b/chardev/char.c
index 5d00cac2f31..4b285baf029 100644
--- a/chardev/char.c
+++ b/chardev/char.c
@@ -82,29 +82,17 @@ void qemu_chr_be_event(Chardev *s, QEMUChrEvent event)
     CHARDEV_GET_CLASS(s)->chr_be_event(s, event);
 }
 
-/* Not reporting errors from writing to logfile, as logs are
- * defined to be "best effort" only */
 static void qemu_chr_write_log(Chardev *s, const uint8_t *buf, size_t len)
 {
-    size_t done = 0;
-    ssize_t ret;
-
     if (s->logfd < 0) {
         return;
     }
 
-    while (done < len) {
-    retry:
-        ret = write(s->logfd, buf + done, len - done);
-        if (ret == -1 && errno == EAGAIN) {
-            g_usleep(100);
-            goto retry;
-        }
-
-        if (ret <= 0) {
-            return;
-        }
-        done += ret;
+    if (qemu_write_full(s->logfd, buf, len) < len) {
+        /*
+         * qemu_write_full() is defined with G_GNUC_WARN_UNUSED_RESULT,
+         * but logging is best‑effort, we do ignore errors.
+         */
     }
 }
 
-- 
2.52.0


