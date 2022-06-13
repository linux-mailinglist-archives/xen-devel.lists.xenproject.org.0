Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F6905484E7
	for <lists+xen-devel@lfdr.de>; Mon, 13 Jun 2022 13:37:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.347970.574279 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o0iNa-0003wy-2Y; Mon, 13 Jun 2022 11:37:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 347970.574279; Mon, 13 Jun 2022 11:37:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o0iNZ-0003uc-UM; Mon, 13 Jun 2022 11:37:09 +0000
Received: by outflank-mailman (input) for mailman id 347970;
 Mon, 13 Jun 2022 11:37:07 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=SJWo=WU=redhat.com=kraxel@srs-se1.protection.inumbo.net>)
 id 1o0iNX-0003eX-MF
 for xen-devel@lists.xenproject.org; Mon, 13 Jun 2022 11:37:07 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 267835d0-eb0d-11ec-8901-93a377f238d6;
 Mon, 13 Jun 2022 13:37:06 +0200 (CEST)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-617-fRcmcX6VO6ac2iBNsirumA-1; Mon, 13 Jun 2022 07:36:59 -0400
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CA5A7100BAC0;
 Mon, 13 Jun 2022 11:36:58 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.192.40])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 42140492C3B;
 Mon, 13 Jun 2022 11:36:58 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id DCEDF18007B8; Mon, 13 Jun 2022 13:36:55 +0200 (CEST)
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
X-Inumbo-ID: 267835d0-eb0d-11ec-8901-93a377f238d6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1655120225;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=h/Rq0T4qHdj5P4fsrjuVBaKf49W5WppINvxKA/pkbYI=;
	b=AjtSITVHGveVtwQ83/na/jnjS+JNhAN/KOBxdJC2iMyNPVeBkKffB+jdeIDxeCCt/Os3cZ
	RIMlW7i+q+TuIJI8xwovoJ6LMUUPVZm3zIW7kXF5D3k8uSLBr3LnD4f+ob1TeC7JGGE0iz
	FvD1f3jEy3MZwObx+Vq8u/+v238I6Ho=
X-MC-Unique: fRcmcX6VO6ac2iBNsirumA-1
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
	xen-devel@lists.xenproject.org,
	Akihiko Odaki <akihiko.odaki@gmail.com>,
	"Hongren (Zenithal) Zheng" <i@zenithal.me>,
	Peter Maydell <peter.maydell@linaro.org>,
	Alex Williamson <alex.williamson@redhat.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	"Canokeys.org" <contact@canokeys.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	Paul Durrant <paul@xen.org>,
	Anthony Perard <anthony.perard@citrix.com>,
	Gerd Hoffmann <kraxel@redhat.com>,
	=?UTF-8?q?Volker=20R=C3=BCmelin?= <vr_qemu@t-online.de>
Subject: [PULL 01/16] ui/gtk-gl-area: implement GL context destruction
Date: Mon, 13 Jun 2022 13:36:40 +0200
Message-Id: <20220613113655.3693872-2-kraxel@redhat.com>
In-Reply-To: <20220613113655.3693872-1-kraxel@redhat.com>
References: <20220613113655.3693872-1-kraxel@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10

From: Volker Rümelin <vr_qemu@t-online.de>

The counterpart function for gd_gl_area_create_context() is
currently empty. Implement the gd_gl_area_destroy_context()
function to avoid GL context leaks.

Signed-off-by: Volker Rümelin <vr_qemu@t-online.de>
Message-Id: <20220605085131.7711-1-vr_qemu@t-online.de>
Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 ui/gtk-gl-area.c | 8 +++++++-
 ui/trace-events  | 1 +
 2 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/ui/gtk-gl-area.c b/ui/gtk-gl-area.c
index fc5a082eb846..0e20ea031d34 100644
--- a/ui/gtk-gl-area.c
+++ b/ui/gtk-gl-area.c
@@ -201,7 +201,13 @@ QEMUGLContext gd_gl_area_create_context(DisplayGLCtx *dgc,
 
 void gd_gl_area_destroy_context(DisplayGLCtx *dgc, QEMUGLContext ctx)
 {
-    /* FIXME */
+    GdkGLContext *current_ctx = gdk_gl_context_get_current();
+
+    trace_gd_gl_area_destroy_context(ctx, current_ctx);
+    if (ctx == current_ctx) {
+        gdk_gl_context_clear_current();
+    }
+    g_clear_object(&ctx);
 }
 
 void gd_gl_area_scanout_texture(DisplayChangeListener *dcl,
diff --git a/ui/trace-events b/ui/trace-events
index f78b5e66061f..1040ba0f88c7 100644
--- a/ui/trace-events
+++ b/ui/trace-events
@@ -26,6 +26,7 @@ gd_key_event(const char *tab, int gdk_keycode, int qkeycode, const char *action)
 gd_grab(const char *tab, const char *device, const char *reason) "tab=%s, dev=%s, reason=%s"
 gd_ungrab(const char *tab, const char *device) "tab=%s, dev=%s"
 gd_keymap_windowing(const char *name) "backend=%s"
+gd_gl_area_destroy_context(void *ctx, void *current_ctx) "ctx=%p, current_ctx=%p"
 
 # vnc-auth-sasl.c
 # vnc-auth-vencrypt.c
-- 
2.36.1


