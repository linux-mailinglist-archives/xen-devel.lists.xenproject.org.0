Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MK1lOt7zjmk5GAEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 13 Feb 2026 10:50:22 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A7B6B134A8F
	for <lists+xen-devel@lfdr.de>; Fri, 13 Feb 2026 10:50:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1230419.1535910 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vqpoT-00031P-V8; Fri, 13 Feb 2026 09:50:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1230419.1535910; Fri, 13 Feb 2026 09:50:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vqpoT-0002yn-Qq; Fri, 13 Feb 2026 09:50:13 +0000
Received: by outflank-mailman (input) for mailman id 1230419;
 Fri, 13 Feb 2026 09:50:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Bqff=AR=redhat.com=marcandre.lureau@srs-se1.protection.inumbo.net>)
 id 1vqpoT-0001Ng-2N
 for xen-devel@lists.xenproject.org; Fri, 13 Feb 2026 09:50:13 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5a4ec232-08c1-11f1-9ccf-f158ae23cfc8;
 Fri, 13 Feb 2026 10:49:57 +0100 (CET)
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-550-qdD6mjHEOhySnGIcF1UXMg-1; Fri,
 13 Feb 2026 04:49:52 -0500
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 564761800BD2; Fri, 13 Feb 2026 09:49:45 +0000 (UTC)
Received: from localhost (unknown [10.44.22.41])
 by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id DC1BD1800678; Fri, 13 Feb 2026 09:49:43 +0000 (UTC)
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
X-Inumbo-ID: 5a4ec232-08c1-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1770976195;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LGj9xk/Pm83KB03G6LVj5ElLZzoxkSGN+CQtNgApbDQ=;
	b=iCbKUNEFIbstVJGW8rrDn1zDuLlcsZLSLnR4GLsh4DsKfrEFjYwYLeLbe6a+wS3uZ1V1JI
	c5TFoziv0o0+Uo4hjEEUyIE4SewPZt50Q2zGUdrqu7RPbnl9DTSwgEMyhXZW5oQ5T2U5GK
	cc/6dC+Py2egf2PVJ+samBWotQFUKFs=
X-MC-Unique: qdD6mjHEOhySnGIcF1UXMg-1
X-Mimecast-MFC-AGG-ID: qdD6mjHEOhySnGIcF1UXMg_1770976189
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
	Eric K <erickra@cs.utexas.edu>
Subject: [PULL v2 01/15] char-udp: Fix initial backend open status
Date: Fri, 13 Feb 2026 10:49:20 +0100
Message-ID: <20260213094938.4074478-2-marcandre.lureau@redhat.com>
In-Reply-To: <20260213094938.4074478-1-marcandre.lureau@redhat.com>
References: <20260213094938.4074478-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93
X-Mimecast-MFC-PROC-ID: HHKQAw6KNaeTwwnxzeeCCq3ZF3rMm1DGWMyjTY3iz8w_1770976189
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
	FORGED_RECIPIENTS(0.00)[m:qemu-devel@nongnu.org,m:alex.bennee@linaro.org,m:edgar.iglesias@gmail.com,m:berrange@redhat.com,m:eblake@redhat.com,m:armbru@redhat.com,m:paul@xen.org,m:anthony@xenproject.org,m:philmd@linaro.org,m:eduardo@habkost.net,m:pbonzini@redhat.com,m:marcandre.lureau@redhat.com,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,m:samuel.thibault@ens-lyon.org,m:erickra@cs.utexas.edu,m:edgariglesias@gmail.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[marcandre.lureau@redhat.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	FREEMAIL_CC(0.00)[linaro.org,gmail.com,redhat.com,xen.org,xenproject.org,habkost.net,kernel.org,lists.xenproject.org,ens-lyon.org,cs.utexas.edu];
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
X-Rspamd-Queue-Id: A7B6B134A8F
X-Rspamd-Action: no action

From: Eric K <erickra@cs.utexas.edu>

This patch removes the `*be_opened = false` override for the UDP chardev
backend. Since UDP is connectionless it never sends a `CHR_EVENT_OPENED`
so it is never marked open. This causes some frontends (e.g. virtio-serial)
to never perform any operations on the socket.

Resolves: https://gitlab.com/qemu-project/qemu/-/issues/2993
Signed-off-by: Eric K <erickra@cs.utexas.edu>
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Message-Id: <20251208225849.705554-1-erickra@cs.utexas.edu>
---
 chardev/char-udp.c     | 2 --
 tests/unit/test-char.c | 2 ++
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/chardev/char-udp.c b/chardev/char-udp.c
index 572fab0ad13..1025f577a0d 100644
--- a/chardev/char-udp.c
+++ b/chardev/char-udp.c
@@ -215,8 +215,6 @@ static void qmp_chardev_open_udp(Chardev *chr,
     g_free(name);
 
     s->ioc = QIO_CHANNEL(sioc);
-    /* be isn't opened until we get a connection */
-    *be_opened = false;
 }
 
 static void char_udp_class_init(ObjectClass *oc, const void *data)
diff --git a/tests/unit/test-char.c b/tests/unit/test-char.c
index 8a98e42cad0..2869c4e09df 100644
--- a/tests/unit/test-char.c
+++ b/tests/unit/test-char.c
@@ -1012,6 +1012,8 @@ static void char_udp_test_internal(Chardev *reuse_chr, int sock)
         qemu_chr_fe_init(fe, chr, &error_abort);
     }
 
+    g_assert(chr->be_open);
+
     d.chr = chr;
     qemu_chr_fe_set_handlers(fe, socket_can_read_hello, socket_read_hello,
                              NULL, NULL, &d, NULL, true);
-- 
2.52.0


