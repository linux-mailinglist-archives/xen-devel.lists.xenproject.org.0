Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 773365484EC
	for <lists+xen-devel@lfdr.de>; Mon, 13 Jun 2022 13:37:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.347984.574413 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o0iNo-0007SK-Vd; Mon, 13 Jun 2022 11:37:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 347984.574413; Mon, 13 Jun 2022 11:37:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o0iNn-0007AS-V1; Mon, 13 Jun 2022 11:37:23 +0000
Received: by outflank-mailman (input) for mailman id 347984;
 Mon, 13 Jun 2022 11:37:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=SJWo=WU=redhat.com=kraxel@srs-se1.protection.inumbo.net>)
 id 1o0iNg-0003eY-72
 for xen-devel@lists.xenproject.org; Mon, 13 Jun 2022 11:37:16 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2b4ec38a-eb0d-11ec-bd2c-47488cf2e6aa;
 Mon, 13 Jun 2022 13:37:14 +0200 (CEST)
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-538-4jw5iIGhO3-Xtypzh9OvfQ-1; Mon, 13 Jun 2022 07:37:10 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DC26B3C10221;
 Mon, 13 Jun 2022 11:37:09 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.192.40])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 82CD718EA1;
 Mon, 13 Jun 2022 11:37:09 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id B578C1800996; Mon, 13 Jun 2022 13:36:56 +0200 (CEST)
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
X-Inumbo-ID: 2b4ec38a-eb0d-11ec-bd2c-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1655120233;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ebiRccH2awWxGwAppvEzoFJ/M1x++CURc9+zFzjg06Y=;
	b=ULmjhGTFSRW37t2Ny9X73SCFOf/8UX60iYuYYH3LmLQSgiYfEv/gO01wYueT4GZXh16mLU
	Ko+C2VvzAjSHEe0L8YNnPUtirAZCSh+WvSPs0j4HK5LkO65OvvU5Wv6EOBfo+BRsGHR4fN
	Yy5HWliroLuWhHShg09cHghbCD6wHfQ=
X-MC-Unique: 4jw5iIGhO3-Xtypzh9OvfQ-1
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
	Gerd Hoffmann <kraxel@redhat.com>
Subject: [PULL 14/16] ui: Deliver refresh rate via QemuUIInfo
Date: Mon, 13 Jun 2022 13:36:53 +0200
Message-Id: <20220613113655.3693872-15-kraxel@redhat.com>
In-Reply-To: <20220613113655.3693872-1-kraxel@redhat.com>
References: <20220613113655.3693872-1-kraxel@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5

From: Akihiko Odaki <akihiko.odaki@gmail.com>

This change adds a new member, refresh_rate to QemuUIInfo in
include/ui/console.h. It represents the refresh rate of the
physical display backend, and it is more appropriate than
GUI update interval as the refresh rate which the emulated device
reports:
- sdl may set GUI update interval shorter than the refresh rate
  of the physical display to respond to user-generated events.
- sdl and vnc aggressively changes GUI update interval, but
  a guests is typically not designed to respond to frequent
  refresh rate changes, or frequent "display mode" changes in
  general. The frequency of refresh rate changes of the physical
  display backend matches better to the guest's expectation.

QemuUIInfo also has other members representing "display mode",
which makes it suitable for refresh rate representation. It has
a throttling of update notifications, and prevents frequent changes
of the display mode.

Signed-off-by: Akihiko Odaki <akihiko.odaki@gmail.com>
Message-Id: <20220226115516.59830-3-akihiko.odaki@gmail.com>
Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 include/ui/console.h |  2 +-
 include/ui/gtk.h     |  2 +-
 hw/display/xenfb.c   | 14 +++++++++++---
 ui/console.c         |  6 ------
 ui/gtk-egl.c         |  4 ++--
 ui/gtk-gl-area.c     |  3 +--
 ui/gtk.c             | 45 +++++++++++++++++++++++++-------------------
 7 files changed, 42 insertions(+), 34 deletions(-)

diff --git a/include/ui/console.h b/include/ui/console.h
index 642d6f5248cf..b64d82436097 100644
--- a/include/ui/console.h
+++ b/include/ui/console.h
@@ -139,6 +139,7 @@ typedef struct QemuUIInfo {
     int       yoff;
     uint32_t  width;
     uint32_t  height;
+    uint32_t  refresh_rate;
 } QemuUIInfo;
 
 /* cursor data format is 32bit RGBA */
@@ -431,7 +432,6 @@ typedef struct GraphicHwOps {
     void (*gfx_update)(void *opaque);
     bool gfx_update_async; /* if true, calls graphic_hw_update_done() */
     void (*text_update)(void *opaque, console_ch_t *text);
-    void (*update_interval)(void *opaque, uint64_t interval);
     void (*ui_info)(void *opaque, uint32_t head, QemuUIInfo *info);
     void (*gl_block)(void *opaque, bool block);
 } GraphicHwOps;
diff --git a/include/ui/gtk.h b/include/ui/gtk.h
index 101b147d1b98..ae0f53740d19 100644
--- a/include/ui/gtk.h
+++ b/include/ui/gtk.h
@@ -155,7 +155,7 @@ extern bool gtk_use_gl_area;
 
 /* ui/gtk.c */
 void gd_update_windowsize(VirtualConsole *vc);
-int gd_monitor_update_interval(GtkWidget *widget);
+void gd_update_monitor_refresh_rate(VirtualConsole *vc, GtkWidget *widget);
 void gd_hw_gl_flushed(void *vc);
 
 /* ui/gtk-egl.c */
diff --git a/hw/display/xenfb.c b/hw/display/xenfb.c
index cea10fe3c780..50857cd97a0b 100644
--- a/hw/display/xenfb.c
+++ b/hw/display/xenfb.c
@@ -777,16 +777,24 @@ static void xenfb_update(void *opaque)
     xenfb->up_fullscreen = 0;
 }
 
-static void xenfb_update_interval(void *opaque, uint64_t interval)
+static void xenfb_ui_info(void *opaque, uint32_t idx, QemuUIInfo *info)
 {
     struct XenFB *xenfb = opaque;
+    uint32_t refresh_rate;
 
     if (xenfb->feature_update) {
 #ifdef XENFB_TYPE_REFRESH_PERIOD
         if (xenfb_queue_full(xenfb)) {
             return;
         }
-        xenfb_send_refresh_period(xenfb, interval);
+
+        refresh_rate = info->refresh_rate;
+        if (!refresh_rate) {
+            refresh_rate = 75;
+        }
+
+        /* T = 1 / f = 1 [s*Hz] / f = 1000*1000 [ms*mHz] / f */
+        xenfb_send_refresh_period(xenfb, 1000 * 1000 / refresh_rate);
 #endif
     }
 }
@@ -983,5 +991,5 @@ struct XenDevOps xen_framebuffer_ops = {
 static const GraphicHwOps xenfb_ops = {
     .invalidate  = xenfb_invalidate,
     .gfx_update  = xenfb_update,
-    .update_interval = xenfb_update_interval,
+    .ui_info     = xenfb_ui_info,
 };
diff --git a/ui/console.c b/ui/console.c
index 36c80cd1de85..9331b85203a0 100644
--- a/ui/console.c
+++ b/ui/console.c
@@ -160,7 +160,6 @@ static void gui_update(void *opaque)
     uint64_t dcl_interval;
     DisplayState *ds = opaque;
     DisplayChangeListener *dcl;
-    QemuConsole *con;
 
     ds->refreshing = true;
     dpy_refresh(ds);
@@ -175,11 +174,6 @@ static void gui_update(void *opaque)
     }
     if (ds->update_interval != interval) {
         ds->update_interval = interval;
-        QTAILQ_FOREACH(con, &consoles, next) {
-            if (con->hw_ops->update_interval) {
-                con->hw_ops->update_interval(con->hw, interval);
-            }
-        }
         trace_console_refresh(interval);
     }
     ds->last_update = qemu_clock_get_ms(QEMU_CLOCK_REALTIME);
diff --git a/ui/gtk-egl.c b/ui/gtk-egl.c
index e3bd4bc27431..b5bffbab2522 100644
--- a/ui/gtk-egl.c
+++ b/ui/gtk-egl.c
@@ -140,8 +140,8 @@ void gd_egl_refresh(DisplayChangeListener *dcl)
 {
     VirtualConsole *vc = container_of(dcl, VirtualConsole, gfx.dcl);
 
-    vc->gfx.dcl.update_interval = gd_monitor_update_interval(
-            vc->window ? vc->window : vc->gfx.drawing_area);
+    gd_update_monitor_refresh_rate(
+            vc, vc->window ? vc->window : vc->gfx.drawing_area);
 
     if (!vc->gfx.esurface) {
         gd_egl_init(vc);
diff --git a/ui/gtk-gl-area.c b/ui/gtk-gl-area.c
index 2e0129c28cd4..682638a197d2 100644
--- a/ui/gtk-gl-area.c
+++ b/ui/gtk-gl-area.c
@@ -121,8 +121,7 @@ void gd_gl_area_refresh(DisplayChangeListener *dcl)
 {
     VirtualConsole *vc = container_of(dcl, VirtualConsole, gfx.dcl);
 
-    vc->gfx.dcl.update_interval = gd_monitor_update_interval(
-            vc->window ? vc->window : vc->gfx.drawing_area);
+    gd_update_monitor_refresh_rate(vc, vc->window ? vc->window : vc->gfx.drawing_area);
 
     if (!vc->gfx.gls) {
         if (!gtk_widget_get_realized(vc->gfx.drawing_area)) {
diff --git a/ui/gtk.c b/ui/gtk.c
index c57c36749e0e..2a791dd2aa04 100644
--- a/ui/gtk.c
+++ b/ui/gtk.c
@@ -710,11 +710,20 @@ static gboolean gd_window_close(GtkWidget *widget, GdkEvent *event,
     return TRUE;
 }
 
-static void gd_set_ui_info(VirtualConsole *vc, gint width, gint height)
+static void gd_set_ui_refresh_rate(VirtualConsole *vc, int refresh_rate)
 {
     QemuUIInfo info;
 
-    memset(&info, 0, sizeof(info));
+    info = *dpy_get_ui_info(vc->gfx.dcl.con);
+    info.refresh_rate = refresh_rate;
+    dpy_set_ui_info(vc->gfx.dcl.con, &info, true);
+}
+
+static void gd_set_ui_size(VirtualConsole *vc, gint width, gint height)
+{
+    QemuUIInfo info;
+
+    info = *dpy_get_ui_info(vc->gfx.dcl.con);
     info.width = width;
     info.height = height;
     dpy_set_ui_info(vc->gfx.dcl.con, &info, true);
@@ -738,33 +747,32 @@ static void gd_resize_event(GtkGLArea *area,
 {
     VirtualConsole *vc = (void *)opaque;
 
-    gd_set_ui_info(vc, width, height);
+    gd_set_ui_size(vc, width, height);
 }
 
 #endif
 
-/*
- * If available, return the update interval of the monitor in ms,
- * else return 0 (the default update interval).
- */
-int gd_monitor_update_interval(GtkWidget *widget)
+void gd_update_monitor_refresh_rate(VirtualConsole *vc, GtkWidget *widget)
 {
 #ifdef GDK_VERSION_3_22
     GdkWindow *win = gtk_widget_get_window(widget);
+    int refresh_rate;
 
     if (win) {
         GdkDisplay *dpy = gtk_widget_get_display(widget);
         GdkMonitor *monitor = gdk_display_get_monitor_at_window(dpy, win);
-        int refresh_rate = gdk_monitor_get_refresh_rate(monitor); /* [mHz] */
-
-        if (refresh_rate) {
-            /* T = 1 / f = 1 [s*Hz] / f = 1000*1000 [ms*mHz] / f */
-            return MIN(1000 * 1000 / refresh_rate,
-                       GUI_REFRESH_INTERVAL_DEFAULT);
-        }
+        refresh_rate = gdk_monitor_get_refresh_rate(monitor); /* [mHz] */
+    } else {
+        refresh_rate = 0;
     }
+
+    gd_set_ui_refresh_rate(vc, refresh_rate);
+
+    /* T = 1 / f = 1 [s*Hz] / f = 1000*1000 [ms*mHz] / f */
+    vc->gfx.dcl.update_interval = refresh_rate ?
+        MIN(1000 * 1000 / refresh_rate, GUI_REFRESH_INTERVAL_DEFAULT) :
+        GUI_REFRESH_INTERVAL_DEFAULT;
 #endif
-    return 0;
 }
 
 static gboolean gd_draw_event(GtkWidget *widget, cairo_t *cr, void *opaque)
@@ -801,8 +809,7 @@ static gboolean gd_draw_event(GtkWidget *widget, cairo_t *cr, void *opaque)
         return FALSE;
     }
 
-    vc->gfx.dcl.update_interval =
-        gd_monitor_update_interval(vc->window ? vc->window : s->window);
+    gd_update_monitor_refresh_rate(vc, vc->window ? vc->window : s->window);
 
     fbw = surface_width(vc->gfx.ds);
     fbh = surface_height(vc->gfx.ds);
@@ -1691,7 +1698,7 @@ static gboolean gd_configure(GtkWidget *widget,
 {
     VirtualConsole *vc = opaque;
 
-    gd_set_ui_info(vc, cfg->width, cfg->height);
+    gd_set_ui_size(vc, cfg->width, cfg->height);
     return FALSE;
 }
 
-- 
2.36.1


