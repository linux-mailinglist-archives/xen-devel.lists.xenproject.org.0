Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B2E46650C56
	for <lists+xen-devel@lfdr.de>; Mon, 19 Dec 2022 14:02:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.466033.724869 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p7Fmg-0006rG-VV; Mon, 19 Dec 2022 13:02:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 466033.724869; Mon, 19 Dec 2022 13:02:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p7Fmg-0006nm-Re; Mon, 19 Dec 2022 13:02:22 +0000
Received: by outflank-mailman (input) for mailman id 466033;
 Mon, 19 Dec 2022 13:02:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Fa7U=4R=redhat.com=berrange@srs-se1.protection.inumbo.net>)
 id 1p7Fmf-0006YQ-Vy
 for xen-devel@lists.xenproject.org; Mon, 19 Dec 2022 13:02:22 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 59d2a6ce-7f9d-11ed-8fd4-01056ac49cbb;
 Mon, 19 Dec 2022 14:02:12 +0100 (CET)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-481-EAFyuzouPl60pgDLpips4g-1; Mon, 19 Dec 2022 08:02:16 -0500
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5B72588742F;
 Mon, 19 Dec 2022 13:02:08 +0000 (UTC)
Received: from virtlab420.virt.lab.eng.bos.redhat.com
 (virtlab420.virt.lab.eng.bos.redhat.com [10.19.152.148])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B2A8C14171C5;
 Mon, 19 Dec 2022 13:02:07 +0000 (UTC)
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
X-Inumbo-ID: 59d2a6ce-7f9d-11ed-8fd4-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1671454940;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4JFb6QDUDH0Iblrn1PZyR6v+EegDDw+5LlL9IfN5m+I=;
	b=g07AC4bxBgWA4MylYKSc3U70lOg0oO/xIPEd+OKBtRNUFA1t7R1GBETeImK1dT0P1gBsXp
	Fr9CjIdC+rUi8RPyh3CSR+M8a7aABj4I/yhE83gXcrA/lNhblGn+kR0B9HM5XGNnT668/S
	bGKrseeDFGrd11x4Tn2au3RwNpexXkY=
X-MC-Unique: EAFyuzouPl60pgDLpips4g-1
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Cc: "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
	qemu-ppc@nongnu.org,
	xen-devel@lists.xenproject.org,
	Laurent Vivier <lvivier@redhat.com>,
	Markus Armbruster <armbru@redhat.com>,
	Daniel Henrique Barboza <danielhb413@gmail.com>,
	virtio-fs@redhat.com,
	Michael Roth <michael.roth@amd.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	qemu-block@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>,
	qemu-arm@nongnu.org,
	Paul Durrant <paul@xen.org>,
	Anthony Perard <anthony.perard@citrix.com>,
	David Gibson <david@gibson.dropbear.id.au>,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
	John Snow <jsnow@redhat.com>,
	Stefan Hajnoczi <stefanha@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Gerd Hoffmann <kraxel@redhat.com>,
	Greg Kurz <groug@kaod.org>,
	Thomas Huth <thuth@redhat.com>,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Subject: [PATCH 2/6] hw/xen: use G_GNUC_PRINTF/SCANF for various functions
Date: Mon, 19 Dec 2022 08:02:01 -0500
Message-Id: <20221219130205.687815-3-berrange@redhat.com>
In-Reply-To: <20221219130205.687815-1-berrange@redhat.com>
References: <20221219130205.687815-1-berrange@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 hw/xen/xen-bus.c                | 1 +
 hw/xen/xen_pvdev.c              | 1 +
 include/hw/xen/xen-bus-helper.h | 6 ++++--
 include/hw/xen/xen-bus.h        | 3 ++-
 4 files changed, 8 insertions(+), 3 deletions(-)

diff --git a/hw/xen/xen-bus.c b/hw/xen/xen-bus.c
index 645a29a5a0..df3f6b9ae0 100644
--- a/hw/xen/xen-bus.c
+++ b/hw/xen/xen-bus.c
@@ -561,6 +561,7 @@ void xen_device_backend_printf(XenDevice *xendev, const char *key,
     }
 }
 
+G_GNUC_SCANF(3, 4)
 static int xen_device_backend_scanf(XenDevice *xendev, const char *key,
                                     const char *fmt, ...)
 {
diff --git a/hw/xen/xen_pvdev.c b/hw/xen/xen_pvdev.c
index 037152f063..1a5177b354 100644
--- a/hw/xen/xen_pvdev.c
+++ b/hw/xen/xen_pvdev.c
@@ -196,6 +196,7 @@ const char *xenbus_strstate(enum xenbus_state state)
  *  2 == noisy debug messages (logfile only).
  *  3 == will flood your log (logfile only).
  */
+G_GNUC_PRINTF(3, 0)
 static void xen_pv_output_msg(struct XenLegacyDevice *xendev,
                               FILE *f, const char *fmt, va_list args)
 {
diff --git a/include/hw/xen/xen-bus-helper.h b/include/hw/xen/xen-bus-helper.h
index 629a904d1a..8782f30550 100644
--- a/include/hw/xen/xen-bus-helper.h
+++ b/include/hw/xen/xen-bus-helper.h
@@ -31,10 +31,12 @@ void xs_node_printf(struct xs_handle *xsh,  xs_transaction_t tid,
 /* Read from node/key unless node is empty, in which case read from key */
 int xs_node_vscanf(struct xs_handle *xsh,  xs_transaction_t tid,
                    const char *node, const char *key, Error **errp,
-                   const char *fmt, va_list ap);
+                   const char *fmt, va_list ap)
+    G_GNUC_SCANF(6, 0);
 int xs_node_scanf(struct xs_handle *xsh,  xs_transaction_t tid,
                   const char *node, const char *key, Error **errp,
-                  const char *fmt, ...);
+                  const char *fmt, ...)
+    G_GNUC_SCANF(6, 7);
 
 /* Watch node/key unless node is empty, in which case watch key */
 void xs_node_watch(struct xs_handle *xsh, const char *node, const char *key,
diff --git a/include/hw/xen/xen-bus.h b/include/hw/xen/xen-bus.h
index 713e763348..4d966a2dbb 100644
--- a/include/hw/xen/xen-bus.h
+++ b/include/hw/xen/xen-bus.h
@@ -94,7 +94,8 @@ void xen_device_frontend_printf(XenDevice *xendev, const char *key,
     G_GNUC_PRINTF(3, 4);
 
 int xen_device_frontend_scanf(XenDevice *xendev, const char *key,
-                              const char *fmt, ...);
+                              const char *fmt, ...)
+    G_GNUC_SCANF(3, 4);
 
 void xen_device_set_max_grant_refs(XenDevice *xendev, unsigned int nr_refs,
                                    Error **errp);
-- 
2.38.1


