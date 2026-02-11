Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0CwfIHZ2jGk6ogAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 11 Feb 2026 13:30:46 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D933124346
	for <lists+xen-devel@lfdr.de>; Wed, 11 Feb 2026 13:30:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1227451.1533865 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vq9Md-0002js-Ia; Wed, 11 Feb 2026 12:30:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1227451.1533865; Wed, 11 Feb 2026 12:30:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vq9Md-0002gX-FA; Wed, 11 Feb 2026 12:30:39 +0000
Received: by outflank-mailman (input) for mailman id 1227451;
 Wed, 11 Feb 2026 12:30:37 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UZeC=AP=redhat.com=marcandre.lureau@srs-se1.protection.inumbo.net>)
 id 1vq9Mb-00016c-U3
 for xen-devel@lists.xenproject.org; Wed, 11 Feb 2026 12:30:37 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 76b4253e-0745-11f1-9ccf-f158ae23cfc8;
 Wed, 11 Feb 2026 13:30:36 +0100 (CET)
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-480-CFV2PrjpPRWNUIY43HdbbQ-1; Wed,
 11 Feb 2026 07:30:31 -0500
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id A5ECE1800613; Wed, 11 Feb 2026 12:30:29 +0000 (UTC)
Received: from localhost (unknown [10.45.242.6])
 by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id B359B19560A3; Wed, 11 Feb 2026 12:30:27 +0000 (UTC)
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
X-Inumbo-ID: 76b4253e-0745-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1770813034;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=y3G7pz3JVMFqRvpJ05R+kBwpJ0ObSQg4ak0FyKLiTE8=;
	b=VvDhOnybq1ZVO7LCm/vinOPqPmTxt6NdMM58lr/hzBR8YzbXk1ikiUKtkbYGS7A09Deo66
	gkzek2z33VU0y1uKu9+a+8Jj//hNylZxdB1V4KnxCBNMnLBNG3n4Vn1yADBSK0hx7rS2RC
	JqgpBUniIz8QCcaLM7Z7M0FZPQ8Iju4=
X-MC-Unique: CFV2PrjpPRWNUIY43HdbbQ-1
X-Mimecast-MFC-AGG-ID: CFV2PrjpPRWNUIY43HdbbQ_1770813030
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
Subject: [PULL 03/14] ui/spice: drop SPICE_HAS_ATTACHED_WORKER macro
Date: Wed, 11 Feb 2026 16:29:50 +0400
Message-ID: <20260211123007.3569932-4-marcandre.lureau@redhat.com>
In-Reply-To: <20260211123007.3569932-1-marcandre.lureau@redhat.com>
References: <20260211123007.3569932-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
X-Mimecast-MFC-PROC-ID: -q37x9RyfgxChA-RHDLxik9_cW0YOs0SZRY4Sl8UhGs_1770813030
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
X-Rspamd-Queue-Id: 5D933124346
X-Rspamd-Action: no action

From: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>

Since previous commit it is always 1. Let's just drop it.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Message-Id: <20260115144606.233252-3-vsementsov@yandex-team.ru>
---
 include/ui/qemu-spice.h |  2 --
 hw/display/qxl.c        | 12 ------------
 ui/spice-display.c      | 11 -----------
 3 files changed, 25 deletions(-)

diff --git a/include/ui/qemu-spice.h b/include/ui/qemu-spice.h
index 8e5e6b2a744..111a09ceca3 100644
--- a/include/ui/qemu-spice.h
+++ b/include/ui/qemu-spice.h
@@ -34,8 +34,6 @@ int qemu_spice_add_display_interface(QXLInstance *qxlin, QemuConsole *con);
 int qemu_spice_migrate_info(const char *hostname, int port, int tls_port,
                             const char *subject);
 
-#define SPICE_HAS_ATTACHED_WORKER 1
-
 #else  /* CONFIG_SPICE */
 
 #include "qemu/error-report.h"
diff --git a/hw/display/qxl.c b/hw/display/qxl.c
index fbba02113f7..0551b38230b 100644
--- a/hw/display/qxl.c
+++ b/hw/display/qxl.c
@@ -530,13 +530,6 @@ static void interface_attached_worker(QXLInstance *sin)
     trace_qxl_interface_attach_worker(qxl->id);
 }
 
-#if !(SPICE_HAS_ATTACHED_WORKER)
-static void interface_attach_worker(QXLInstance *sin, QXLWorker *qxl_worker)
-{
-    interface_attached_worker(sin);
-}
-#endif
-
 static void interface_set_compression_level(QXLInstance *sin, int level)
 {
     PCIQXLDevice *qxl = container_of(sin, PCIQXLDevice, ssd.qxl);
@@ -1131,12 +1124,7 @@ static const QXLInterface qxl_interface = {
     .base.major_version      = SPICE_INTERFACE_QXL_MAJOR,
     .base.minor_version      = SPICE_INTERFACE_QXL_MINOR,
 
-#if SPICE_HAS_ATTACHED_WORKER
     .attached_worker         = interface_attached_worker,
-#else
-    .attache_worker          = interface_attach_worker,
-#endif
-
     .set_compression_level   = interface_set_compression_level,
     .get_init_info           = interface_get_init_info,
 
diff --git a/ui/spice-display.c b/ui/spice-display.c
index f2304bb0ce2..28399f8a817 100644
--- a/ui/spice-display.c
+++ b/ui/spice-display.c
@@ -507,17 +507,10 @@ void qemu_spice_display_refresh(SimpleSpiceDisplay *ssd)
 
 /* spice display interface callbacks */
 
-#if SPICE_HAS_ATTACHED_WORKER
 static void interface_attached_worker(QXLInstance *sin)
 {
     /* nothing to do */
 }
-#else
-static void interface_attach_worker(QXLInstance *sin, QXLWorker *qxl_worker)
-{
-    /* nothing to do */
-}
-#endif
 
 static void interface_set_compression_level(QXLInstance *sin, int level)
 {
@@ -707,11 +700,7 @@ static const QXLInterface dpy_interface = {
     .base.major_version      = SPICE_INTERFACE_QXL_MAJOR,
     .base.minor_version      = SPICE_INTERFACE_QXL_MINOR,
 
-#if SPICE_HAS_ATTACHED_WORKER
     .attached_worker         = interface_attached_worker,
-#else
-    .attache_worker          = interface_attach_worker,
-#endif
     .set_compression_level   = interface_set_compression_level,
     .get_init_info           = interface_get_init_info,
 
-- 
2.52.0


