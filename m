Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D3E375461BD
	for <lists+xen-devel@lfdr.de>; Fri, 10 Jun 2022 11:21:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.346080.571839 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nzapV-00064X-VY; Fri, 10 Jun 2022 09:21:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 346080.571839; Fri, 10 Jun 2022 09:21:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nzapV-0005x6-Pu; Fri, 10 Jun 2022 09:21:21 +0000
Received: by outflank-mailman (input) for mailman id 346080;
 Fri, 10 Jun 2022 09:21:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=2HR3=WR=redhat.com=kraxel@srs-se1.protection.inumbo.net>)
 id 1nzapT-0005HE-Ht
 for xen-devel@lists.xenproject.org; Fri, 10 Jun 2022 09:21:19 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id aec5ad2e-e89e-11ec-bd2c-47488cf2e6aa;
 Fri, 10 Jun 2022 11:21:18 +0200 (CEST)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-422-L28HogynNE2lkWLrb52jaw-1; Fri, 10 Jun 2022 05:21:05 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BF36B85A583;
 Fri, 10 Jun 2022 09:21:04 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.192.40])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 47D442026D64;
 Fri, 10 Jun 2022 09:21:04 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id E61E518003A8; Fri, 10 Jun 2022 11:20:43 +0200 (CEST)
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
X-Inumbo-ID: aec5ad2e-e89e-11ec-bd2c-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1654852877;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wx3J1U/WRMVytLzUKnVNwgCHbbzsbHu+DjsV7mqclmI=;
	b=GAVWfEdkWHAjpcz0EjlFoBuvBbBkCQtb82r5ClL0gqZI+Fvr6RAA3clr1veUQ9/Kq7dWwm
	wzfrRxHF72Ty9oC0EiESB3kUs7EhT6SaA2bps+Z/xvtwxzqXT34hD8Z/FEW4JWn/lbpno4
	HjxAC0NPxlPuzfzzAM8nhig+1S15wo0=
X-MC-Unique: L28HogynNE2lkWLrb52jaw-1
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
Subject: [PULL 02/17] ui/gtk-gl-area: create the requested GL context version
Date: Fri, 10 Jun 2022 11:20:28 +0200
Message-Id: <20220610092043.1874654-3-kraxel@redhat.com>
In-Reply-To: <20220610092043.1874654-1-kraxel@redhat.com>
References: <20220610092043.1874654-1-kraxel@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4

From: Volker Rümelin <vr_qemu@t-online.de>

Since about 2018 virglrenderer (commit fa835b0f88 "vrend: don't
hardcode context version") tries to open the highest available GL
context version. This is done by creating the known GL context
versions from the highest to the lowest until (*create_gl_context)
returns a context != NULL.

This does not work properly with
the current QEMU gd_gl_area_create_context() function, because
gdk_gl_context_realize() on Wayland creates a version 3.0 legacy
context if the requested GL context version can't be created.

In order for virglrenderer to find the highest available GL
context version, return NULL if the created context version is
lower than the requested version.

This fixes the following error:
QEMU started with -device virtio-vga-gl -display gtk,gl=on.
Under Wayland, the guest window remains black and the following
information can be seen on the host.

gl_version 30 - compat profile
(qemu:5978): Gdk-WARNING **: 16:19:01.533:
  gdk_gl_context_set_required_version
  - GL context versions less than 3.2 are not supported.

(qemu:5978): Gdk-WARNING **: 16:19:01.537:
  gdk_gl_context_set_required_version -
  GL context versions less than 3.2 are not supported.

(qemu:5978): Gdk-WARNING **: 16:19:01.554:
  gdk_gl_context_set_required_version -
  GL context versions less than 3.2 are not supported.
vrend_renderer_fill_caps: Entering with stale GL error: 1282

To reproduce this error, an OpenGL driver is required on the host
that doesn't have the latest OpenGL extensions fully implemented.
An example for this is the Intel i965 driver on a Haswell processor.

Signed-off-by: Volker Rümelin <vr_qemu@t-online.de>
Message-Id: <20220605085131.7711-2-vr_qemu@t-online.de>
Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 ui/gtk-gl-area.c | 31 ++++++++++++++++++++++++++++++-
 ui/trace-events  |  1 +
 2 files changed, 31 insertions(+), 1 deletion(-)

diff --git a/ui/gtk-gl-area.c b/ui/gtk-gl-area.c
index 0e20ea031d34..2e0129c28cd4 100644
--- a/ui/gtk-gl-area.c
+++ b/ui/gtk-gl-area.c
@@ -170,6 +170,23 @@ void gd_gl_area_switch(DisplayChangeListener *dcl,
     }
 }
 
+static int gd_cmp_gl_context_version(int major, int minor, QEMUGLParams *params)
+{
+    if (major > params->major_ver) {
+        return 1;
+    }
+    if (major < params->major_ver) {
+        return -1;
+    }
+    if (minor > params->minor_ver) {
+        return 1;
+    }
+    if (minor < params->minor_ver) {
+        return -1;
+    }
+    return 0;
+}
+
 QEMUGLContext gd_gl_area_create_context(DisplayGLCtx *dgc,
                                         QEMUGLParams *params)
 {
@@ -177,8 +194,8 @@ QEMUGLContext gd_gl_area_create_context(DisplayGLCtx *dgc,
     GdkWindow *window;
     GdkGLContext *ctx;
     GError *err = NULL;
+    int major, minor;
 
-    gtk_gl_area_make_current(GTK_GL_AREA(vc->gfx.drawing_area));
     window = gtk_widget_get_window(vc->gfx.drawing_area);
     ctx = gdk_window_create_gl_context(window, &err);
     if (err) {
@@ -196,6 +213,18 @@ QEMUGLContext gd_gl_area_create_context(DisplayGLCtx *dgc,
         g_clear_object(&ctx);
         return NULL;
     }
+
+    gdk_gl_context_make_current(ctx);
+    gdk_gl_context_get_version(ctx, &major, &minor);
+    gdk_gl_context_clear_current();
+    gtk_gl_area_make_current(GTK_GL_AREA(vc->gfx.drawing_area));
+
+    if (gd_cmp_gl_context_version(major, minor, params) == -1) {
+        /* created ctx version < requested version */
+        g_clear_object(&ctx);
+    }
+
+    trace_gd_gl_area_create_context(ctx, params->major_ver, params->minor_ver);
     return ctx;
 }
 
diff --git a/ui/trace-events b/ui/trace-events
index 1040ba0f88c7..a922f00e10b4 100644
--- a/ui/trace-events
+++ b/ui/trace-events
@@ -26,6 +26,7 @@ gd_key_event(const char *tab, int gdk_keycode, int qkeycode, const char *action)
 gd_grab(const char *tab, const char *device, const char *reason) "tab=%s, dev=%s, reason=%s"
 gd_ungrab(const char *tab, const char *device) "tab=%s, dev=%s"
 gd_keymap_windowing(const char *name) "backend=%s"
+gd_gl_area_create_context(void *ctx, int major, int minor) "ctx=%p, major=%d, minor=%d"
 gd_gl_area_destroy_context(void *ctx, void *current_ctx) "ctx=%p, current_ctx=%p"
 
 # vnc-auth-sasl.c
-- 
2.36.1


