Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ICaJDa71jmnXGAEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 13 Feb 2026 10:58:06 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B6D64134C55
	for <lists+xen-devel@lfdr.de>; Fri, 13 Feb 2026 10:58:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1230509.1536014 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vqpvy-0000UZ-I4; Fri, 13 Feb 2026 09:57:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1230509.1536014; Fri, 13 Feb 2026 09:57:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vqpvy-0000SY-E2; Fri, 13 Feb 2026 09:57:58 +0000
Received: by outflank-mailman (input) for mailman id 1230509;
 Fri, 13 Feb 2026 09:57:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Bqff=AR=redhat.com=marcandre.lureau@srs-se1.protection.inumbo.net>)
 id 1vqpos-0001Ng-2q
 for xen-devel@lists.xenproject.org; Fri, 13 Feb 2026 09:50:38 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 716756db-08c1-11f1-9ccf-f158ae23cfc8;
 Fri, 13 Feb 2026 10:50:35 +0100 (CET)
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-245-_JVeCy1lOY-Y9S-Du_iKbw-1; Fri,
 13 Feb 2026 04:50:31 -0500
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 50B3318005B7; Fri, 13 Feb 2026 09:50:29 +0000 (UTC)
Received: from localhost (unknown [10.44.22.41])
 by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 9A67819560B9; Fri, 13 Feb 2026 09:50:28 +0000 (UTC)
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
X-Inumbo-ID: 716756db-08c1-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1770976234;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VbW6jTOEG9iYTux9Gled281r+tDrauM450W3fBHk0XQ=;
	b=LQUAgaWEVACgPTWW6ZrzeGB0CI0sE9XLv3E/JaHctbxq3Zu7ZpveyGVW6vx8SKLegoJsJN
	Y3+JaGwt1K1nYQ0FxlrStNyvSOK9T0jiJS1J64/mn0bXGcuHUcTUDohfmftHJXEu6mQ1an
	ASeU3K/SIQbRz2l8zI+bL5Bo07/rBZk=
X-MC-Unique: _JVeCy1lOY-Y9S-Du_iKbw-1
X-Mimecast-MFC-AGG-ID: _JVeCy1lOY-Y9S-Du_iKbw_1770976229
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
	Samuel Thibault <samuel.thibault@ens-lyon.org>
Subject: [PULL v2 15/15] baum: Add copy/paste bindings
Date: Fri, 13 Feb 2026 10:49:34 +0100
Message-ID: <20260213094938.4074478-16-marcandre.lureau@redhat.com>
In-Reply-To: <20260213094938.4074478-1-marcandre.lureau@redhat.com>
References: <20260213094938.4074478-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
X-Mimecast-MFC-PROC-ID: tvSfgGXtg1qXtVBXDKvuIhJHVaF6d_cPunGplMYsK7s_1770976229
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
	RCPT_COUNT_TWELVE(0.00)[15];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:qemu-devel@nongnu.org,m:alex.bennee@linaro.org,m:edgar.iglesias@gmail.com,m:berrange@redhat.com,m:eblake@redhat.com,m:armbru@redhat.com,m:paul@xen.org,m:anthony@xenproject.org,m:philmd@linaro.org,m:eduardo@habkost.net,m:pbonzini@redhat.com,m:marcandre.lureau@redhat.com,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,m:samuel.thibault@ens-lyon.org,m:edgariglesias@gmail.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[marcandre.lureau@redhat.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	FREEMAIL_CC(0.00)[linaro.org,gmail.com,redhat.com,xen.org,xenproject.org,habkost.net,kernel.org,lists.xenproject.org,ens-lyon.org];
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
X-Rspamd-Queue-Id: B6D64134C55
X-Rspamd-Action: no action

From: Samuel Thibault <samuel.thibault@ens-lyon.org>

Brltty interprets

- TL1 (i.e. Display1) + routing as clip new
- TL2 (i.e. Display2) + routing as clip add
- TR1 (i.e. Display4) + routing as copy line
- TR2 (i.e. Display5) + routing as copy rect

https://github.com/brltty/brltty/blob/master/Tables/Input/bm/routing6.kti

- BAUM_TL1+BAUM_TL2+BAUM_TL3+BAUM_TR1 (i.e.
Display1+Display2+Display3+Display4) as paste

https://github.com/brltty/brltty/blob/master/Tables/Input/bm/d6.kti

Signed-off-by: Samuel Thibault <samuel.thibault@ens-lyon.org>
[ Marc-André - style fixes ]
Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Message-ID: <20260213000551.2446777-1-samuel.thibault@ens-lyon.org>
---
 chardev/baum.c | 38 ++++++++++++++++++++++++++++++++++++--
 1 file changed, 36 insertions(+), 2 deletions(-)

diff --git a/chardev/baum.c b/chardev/baum.c
index 1219963656b..ac1e535ba8e 100644
--- a/chardev/baum.c
+++ b/chardev/baum.c
@@ -1,7 +1,7 @@
 /*
  * QEMU Baum Braille Device
  *
- * Copyright (c) 2008, 2010-2011, 2016-2017 Samuel Thibault
+ * Copyright (c) 2008, 2010-2011, 2016-2017, 2026 Samuel Thibault
  *
  * Permission is hereby granted, free of charge, to any person obtaining a copy
  * of this software and associated documentation files (the "Software"), to deal
@@ -561,9 +561,38 @@ static void baum_chr_read(void *opaque)
         case BRLAPI_KEY_TYPE_CMD:
             switch (code & BRLAPI_KEY_CMD_BLK_MASK) {
             case BRLAPI_KEY_CMD_ROUTE:
-                baum_send_key(baum, BAUM_RSP_RoutingKey, (code & BRLAPI_KEY_CMD_ARG_MASK)+1);
+                baum_send_key(baum, BAUM_RSP_RoutingKey,
+                              (code & BRLAPI_KEY_CMD_ARG_MASK) + 1);
                 baum_send_key(baum, BAUM_RSP_RoutingKey, 0);
                 break;
+            case BRLAPI_KEY_CMD_CLIP_NEW:
+                baum_send_key(baum, BAUM_RSP_TopKeys, BAUM_TL1);
+                baum_send_key(baum, BAUM_RSP_RoutingKey,
+                              (code & BRLAPI_KEY_CMD_ARG_MASK) + 1);
+                baum_send_key(baum, BAUM_RSP_RoutingKey, 0);
+                baum_send_key(baum, BAUM_RSP_TopKeys, 0);
+                break;
+            case BRLAPI_KEY_CMD_CLIP_ADD:
+                baum_send_key(baum, BAUM_RSP_TopKeys, BAUM_TL2);
+                baum_send_key(baum, BAUM_RSP_RoutingKey,
+                              (code & BRLAPI_KEY_CMD_ARG_MASK) + 1);
+                baum_send_key(baum, BAUM_RSP_RoutingKey, 0);
+                baum_send_key(baum, BAUM_RSP_TopKeys, 0);
+                break;
+            case BRLAPI_KEY_CMD_COPY_LINE:
+                baum_send_key(baum, BAUM_RSP_TopKeys, BAUM_TR1);
+                baum_send_key(baum, BAUM_RSP_RoutingKey,
+                              (code & BRLAPI_KEY_CMD_ARG_MASK) + 1);
+                baum_send_key(baum, BAUM_RSP_RoutingKey, 0);
+                baum_send_key(baum, BAUM_RSP_TopKeys, 0);
+                break;
+            case BRLAPI_KEY_CMD_COPY_RECT:
+                baum_send_key(baum, BAUM_RSP_TopKeys, BAUM_TR2);
+                baum_send_key(baum, BAUM_RSP_RoutingKey,
+                              (code & BRLAPI_KEY_CMD_ARG_MASK) + 1);
+                baum_send_key(baum, BAUM_RSP_RoutingKey, 0);
+                baum_send_key(baum, BAUM_RSP_TopKeys, 0);
+                break;
             case 0:
                 switch (code & BRLAPI_KEY_CMD_ARG_MASK) {
                 case BRLAPI_KEY_CMD_FWINLT:
@@ -606,6 +635,11 @@ static void baum_chr_read(void *opaque)
                     baum_send_key(baum, BAUM_RSP_TopKeys, BAUM_TL1|BAUM_TL3|BAUM_TR1);
                     baum_send_key(baum, BAUM_RSP_TopKeys, 0);
                     break;
+                case BRLAPI_KEY_CMD_PASTE:
+                    baum_send_key(baum, BAUM_RSP_TopKeys,
+                                  BAUM_TL1 | BAUM_TL2 | BAUM_TL3 | BAUM_TR1);
+                    baum_send_key(baum, BAUM_RSP_TopKeys, 0);
+                    break;
                 }
             }
             break;
-- 
2.52.0


