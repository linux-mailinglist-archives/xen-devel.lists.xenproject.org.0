Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B39B95461BA
	for <lists+xen-devel@lfdr.de>; Fri, 10 Jun 2022 11:21:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.346076.571801 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nzapL-00053O-EW; Fri, 10 Jun 2022 09:21:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 346076.571801; Fri, 10 Jun 2022 09:21:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nzapL-00050P-BC; Fri, 10 Jun 2022 09:21:11 +0000
Received: by outflank-mailman (input) for mailman id 346076;
 Fri, 10 Jun 2022 09:21:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=2HR3=WR=redhat.com=kraxel@srs-se1.protection.inumbo.net>)
 id 1nzapK-00050F-J2
 for xen-devel@lists.xenproject.org; Fri, 10 Jun 2022 09:21:10 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a8200d9a-e89e-11ec-8179-c7c2a468b362;
 Fri, 10 Jun 2022 11:21:07 +0200 (CEST)
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-617-nzXNfmnLMbOoxz3AGOvaGg-1; Fri, 10 Jun 2022 05:21:03 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 42C611C05AB3;
 Fri, 10 Jun 2022 09:21:02 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.192.40])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D13B42026D64;
 Fri, 10 Jun 2022 09:21:00 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id CC0541800395; Fri, 10 Jun 2022 11:20:43 +0200 (CEST)
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
X-Inumbo-ID: a8200d9a-e89e-11ec-8179-c7c2a468b362
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1654852866;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=h/Rq0T4qHdj5P4fsrjuVBaKf49W5WppINvxKA/pkbYI=;
	b=QvyYpERN/p0ov2jUXygGbS2X6GGDJaIh6HnnOVP2DnkcqqzU3kSyjASboULlUq/rZ6/szm
	Z8095fEqgAJ1NYI5MEvksbTZitOHFeu3zU3df7BbLkrs1xyGcUIosFdBnvdPImdE1X1BdO
	57ev0atq/XWWtjaZoPleX/ahy5nCKVo=
X-MC-Unique: nzXNfmnLMbOoxz3AGOvaGg-1
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Cc: "Canokeys.org" <contact@canokeys.org>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Anthony Perard <anthony.perard@citrix.com>,
	Paul Durrant <paul@xen.org>,
	Akihiko Odaki <akihiko.odaki@gmail.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	"Hongren (Zenithal) Zheng" <i@zenithal.me>,
	xen-devel@lists.xenproject.org,
	Alex Williamson <alex.williamson@redhat.com>,
	Gerd Hoffmann <kraxel@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	=?UTF-8?q?Volker=20R=C3=BCmelin?= <vr_qemu@t-online.de>
Subject: [PULL 01/17] ui/gtk-gl-area: implement GL context destruction
Date: Fri, 10 Jun 2022 11:20:27 +0200
Message-Id: <20220610092043.1874654-2-kraxel@redhat.com>
In-Reply-To: <20220610092043.1874654-1-kraxel@redhat.com>
References: <20220610092043.1874654-1-kraxel@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4

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


