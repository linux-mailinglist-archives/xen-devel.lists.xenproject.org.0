Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wGKKFtzzjmk5GAEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 13 Feb 2026 10:50:20 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 08BE6134A81
	for <lists+xen-devel@lfdr.de>; Fri, 13 Feb 2026 10:50:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1230417.1535904 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vqpoT-0002yy-M4; Fri, 13 Feb 2026 09:50:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1230417.1535904; Fri, 13 Feb 2026 09:50:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vqpoT-0002wY-Ho; Fri, 13 Feb 2026 09:50:13 +0000
Received: by outflank-mailman (input) for mailman id 1230417;
 Fri, 13 Feb 2026 09:50:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Bqff=AR=redhat.com=marcandre.lureau@srs-se1.protection.inumbo.net>)
 id 1vqpoS-0001Ng-1N
 for xen-devel@lists.xenproject.org; Fri, 13 Feb 2026 09:50:12 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 60faf46a-08c1-11f1-9ccf-f158ae23cfc8;
 Fri, 13 Feb 2026 10:50:08 +0100 (CET)
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-335-spO-09MoPhGoxKEqBmvdqQ-1; Fri,
 13 Feb 2026 04:50:02 -0500
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 8C43D196C420; Fri, 13 Feb 2026 09:49:52 +0000 (UTC)
Received: from localhost (unknown [10.44.22.41])
 by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id DCA1418004AD; Fri, 13 Feb 2026 09:49:50 +0000 (UTC)
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
X-Inumbo-ID: 60faf46a-08c1-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1770976207;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=y3G7pz3JVMFqRvpJ05R+kBwpJ0ObSQg4ak0FyKLiTE8=;
	b=G+mQl2AUGuUBzR5vWxQqJhu/G71R6+jIPPPjTMvtsjLXFpGoxP8uiYEJd4ADqI5OC3I6W6
	Va1zjWvNeAOGppPGhPBiBrlzhXpI/D4cY6WyLDZYTraD819I5ziODGkzXVU7uMF4LB0wq1
	ZEMZAsVZ69baXYg7t/sPOWHQsVG0VYA=
X-MC-Unique: spO-09MoPhGoxKEqBmvdqQ-1
X-Mimecast-MFC-AGG-ID: spO-09MoPhGoxKEqBmvdqQ_1770976201
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
Subject: [PULL v2 03/15] ui/spice: drop SPICE_HAS_ATTACHED_WORKER macro
Date: Fri, 13 Feb 2026 10:49:22 +0100
Message-ID: <20260213094938.4074478-4-marcandre.lureau@redhat.com>
In-Reply-To: <20260213094938.4074478-1-marcandre.lureau@redhat.com>
References: <20260213094938.4074478-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93
X-Mimecast-MFC-PROC-ID: vLQEj4W-CvBrrGrZbfDdVQkLxQ7uBQ6Dz0OolyuNfps_1770976201
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[redhat.com,quarantine];
	R_DKIM_ALLOW(-0.20)[redhat.com:s=mimecast20190719];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:qemu-devel@nongnu.org,m:alex.bennee@linaro.org,m:edgar.iglesias@gmail.com,m:berrange@redhat.com,m:eblake@redhat.com,m:armbru@redhat.com,m:paul@xen.org,m:anthony@xenproject.org,m:philmd@linaro.org,m:eduardo@habkost.net,m:pbonzini@redhat.com,m:marcandre.lureau@redhat.com,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,m:samuel.thibault@ens-lyon.org,m:vsementsov@yandex-team.ru,m:edgariglesias@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[marcandre.lureau@redhat.com,xen-devel-bounces@lists.xenproject.org];
	ARC_NA(0.00)[];
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
X-Rspamd-Queue-Id: 08BE6134A81
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


