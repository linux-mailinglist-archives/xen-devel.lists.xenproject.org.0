Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B06D032B8F7
	for <lists+xen-devel@lfdr.de>; Wed,  3 Mar 2021 16:32:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.92873.175108 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lHTTc-0002fV-BA; Wed, 03 Mar 2021 15:31:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 92873.175108; Wed, 03 Mar 2021 15:31:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lHTTc-0002f1-7y; Wed, 03 Mar 2021 15:31:52 +0000
Received: by outflank-mailman (input) for mailman id 92873;
 Wed, 03 Mar 2021 15:31:51 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0XjP=IB=gmail.com=akihiko.odaki@srs-us1.protection.inumbo.net>)
 id 1lHTTa-0002d7-U3
 for xen-devel@lists.xenproject.org; Wed, 03 Mar 2021 15:31:50 +0000
Received: from mail-pj1-x1033.google.com (unknown [2607:f8b0:4864:20::1033])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 39a3335d-6d4d-4b61-a38f-0e7838884c2c;
 Wed, 03 Mar 2021 15:31:47 +0000 (UTC)
Received: by mail-pj1-x1033.google.com with SMTP id e9so4560668pjj.0
 for <xen-devel@lists.xenproject.org>; Wed, 03 Mar 2021 07:31:47 -0800 (PST)
Received: from localhost.localdomain
 ([2400:4050:c360:8200:5c52:1484:d5e9:8785])
 by smtp.gmail.com with ESMTPSA id j125sm26705574pfd.27.2021.03.03.07.31.44
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 03 Mar 2021 07:31:46 -0800 (PST)
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
X-Inumbo-ID: 39a3335d-6d4d-4b61-a38f-0e7838884c2c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=XZCD1gaPmOF4fzquo49Q5QPSu+gMDmYGiB+c2jR/sN0=;
        b=CtUmKjK1S+RM6N/iNxFStCDkvq12EIAiuobMiOj9wbSQkWHmAxGm/IRvAApX1eaZon
         xpVYpuA+S7C/WDK8U/5kmJJCHOKSGslTMnicLBOT/MaIN9IyrFt64tNDrAQjY4PiTgAU
         kdH3/0Cuv/WXbqE8zEnCDEzA05vmIPbu8u1CO1nDdgpTVNFQaeKVjnKCxA7wy0JzIrJc
         hb6/UmAqlidk7YUsdq5PPrcQPUoVvt6+rKMAAqnfS3DaHOvZiizvkVj5ZE7+PjYtnnZ/
         fHvwsr0U1Yreotf83fiy4OtlqJDqtUKpVJ+P1ZuvGHZWfpphMNCNDFxluxZJdL7u/Zcu
         nuzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=XZCD1gaPmOF4fzquo49Q5QPSu+gMDmYGiB+c2jR/sN0=;
        b=hsgUhXj9VliPvtIjliwCoii4MYAOpjY24kmYSJ3YStFGZ1wkfBJ+I//wJ+07lQ5Xox
         J5Ww+G6oIywlXjWhLQxv5M+Z7EqjQge9jqo70aEs7TfwqS9+HPTotN5einwWvtuhO/4N
         kutT2fm9g3OdyIajpx8mjwSTUJwb7FhIrwGfWt3M3uEGgoCQw3i1+jSOrxSpfkddGYe4
         eXDuzsssLYlwb8CzrzDXhkOl4+0ALZmGGmkKpMA9z/cQs3y/ABSQph2Emwh3S5XNFLpa
         h72YcfKbOhwsZGvnTLpgkgG3WsFrc+qxOK6+q16qj05tvNQrvnLQLZP+j3wd5sVfh9C9
         Ge7w==
X-Gm-Message-State: AOAM532JSJqJzVYXAgBCw4oYb0gRGWqejO/LpwLxx6M7QWwDW5P5jD2F
	Vb9ZxvIvwhkWGEOZJGfW1Ao=
X-Google-Smtp-Source: ABdhPJyn6dOKSQSF5oQeK4Oq3zDMfKyMb+LvXZkL2C7JkwipSshEm8XyxC3GXm/sPr/6CgfJsDnujw==
X-Received: by 2002:a17:90a:9303:: with SMTP id p3mr9575355pjo.201.1614785507070;
        Wed, 03 Mar 2021 07:31:47 -0800 (PST)
From: Akihiko Odaki <akihiko.odaki@gmail.com>
To: 
Cc: qemu Developers <qemu-devel@nongnu.org>,
	xen-devel@lists.xenproject.org,
	Gerd Hoffmann <kraxel@redhat.com>,
	"Michael S . Tsirkin" <mst@redhat.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Anthony Perard <anthony.perard@citrix.com>,
	Paul Durrant <paul@xen.org>,
	Akihiko Odaki <akihiko.odaki@gmail.com>
Subject: [PATCH v2 2/2] virtio-gpu: Respect UI refresh rate for EDID
Date: Thu,  4 Mar 2021 00:29:48 +0900
Message-Id: <20210303152948.59943-2-akihiko.odaki@gmail.com>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
In-Reply-To: <20210303152948.59943-1-akihiko.odaki@gmail.com>
References: <20210303152948.59943-1-akihiko.odaki@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

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
---
 hw/display/virtio-gpu-base.c   |  1 +
 hw/display/virtio-gpu.c        |  1 +
 hw/display/xenfb.c             | 14 ++++++++---
 include/hw/virtio/virtio-gpu.h |  1 +
 include/ui/console.h           |  2 +-
 include/ui/gtk.h               |  2 +-
 ui/console.c                   |  6 -----
 ui/gtk-egl.c                   |  4 +--
 ui/gtk.c                       | 45 ++++++++++++++++++++--------------
 9 files changed, 44 insertions(+), 32 deletions(-)

diff --git a/hw/display/virtio-gpu-base.c b/hw/display/virtio-gpu-base.c
index 4a57350917c..86ed208d031 100644
--- a/hw/display/virtio-gpu-base.c
+++ b/hw/display/virtio-gpu-base.c
@@ -80,6 +80,7 @@ static int virtio_gpu_ui_info(void *opaque, uint32_t idx, QemuUIInfo *info)
 
     g->req_state[idx].x = info->xoff;
     g->req_state[idx].y = info->yoff;
+    g->req_state[idx].refresh_rate = info->refresh_rate;
     g->req_state[idx].width = info->width;
     g->req_state[idx].height = info->height;
     g->req_state[idx].width_mm = info->width_mm;
diff --git a/hw/display/virtio-gpu.c b/hw/display/virtio-gpu.c
index 2e4a9822b6a..eee22b18e8a 100644
--- a/hw/display/virtio-gpu.c
+++ b/hw/display/virtio-gpu.c
@@ -216,6 +216,7 @@ virtio_gpu_generate_edid(VirtIOGPU *g, int scanout,
         .height_mm = b->req_state[scanout].height_mm,
         .prefx = b->req_state[scanout].width,
         .prefy = b->req_state[scanout].height,
+        .refresh_rate = b->req_state[scanout].refresh_rate,
     };
 
     edid->size = cpu_to_le32(sizeof(edid->edid));
diff --git a/hw/display/xenfb.c b/hw/display/xenfb.c
index 838260b6ad1..a53341ef673 100644
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
diff --git a/include/hw/virtio/virtio-gpu.h b/include/hw/virtio/virtio-gpu.h
index fae149235c5..876c4a51a67 100644
--- a/include/hw/virtio/virtio-gpu.h
+++ b/include/hw/virtio/virtio-gpu.h
@@ -64,6 +64,7 @@ struct virtio_gpu_scanout {
 struct virtio_gpu_requested_state {
     uint16_t width_mm, height_mm;
     uint32_t width, height;
+    uint32_t refresh_rate;
     int x, y;
 };
 
diff --git a/include/ui/console.h b/include/ui/console.h
index d30e972d0b5..6c4eb4df718 100644
--- a/include/ui/console.h
+++ b/include/ui/console.h
@@ -127,6 +127,7 @@ typedef struct QemuUIInfo {
     int       yoff;
     uint32_t  width;
     uint32_t  height;
+    uint32_t  refresh_rate;
 } QemuUIInfo;
 
 /* cursor data format is 32bit RGBA */
@@ -384,7 +385,6 @@ typedef struct GraphicHwOps {
     void (*gfx_update)(void *opaque);
     bool gfx_update_async; /* if true, calls graphic_hw_update_done() */
     void (*text_update)(void *opaque, console_ch_t *text);
-    void (*update_interval)(void *opaque, uint64_t interval);
     int (*ui_info)(void *opaque, uint32_t head, QemuUIInfo *info);
     void (*gl_block)(void *opaque, bool block);
     void (*gl_flushed)(void *opaque);
diff --git a/include/ui/gtk.h b/include/ui/gtk.h
index 3c1cd98db8b..1fde553c0f0 100644
--- a/include/ui/gtk.h
+++ b/include/ui/gtk.h
@@ -87,7 +87,7 @@ extern bool gtk_use_gl_area;
 
 /* ui/gtk.c */
 void gd_update_windowsize(VirtualConsole *vc);
-int gd_monitor_update_interval(GtkWidget *widget);
+void gd_update_monitor_refresh_rate(VirtualConsole *vc, GtkWidget *widget);
 
 /* ui/gtk-egl.c */
 void gd_egl_init(VirtualConsole *vc);
diff --git a/ui/console.c b/ui/console.c
index c5d11bc7017..3f5a0c113e2 100644
--- a/ui/console.c
+++ b/ui/console.c
@@ -203,7 +203,6 @@ static void gui_update(void *opaque)
     uint64_t dcl_interval;
     DisplayState *ds = opaque;
     DisplayChangeListener *dcl;
-    QemuConsole *con;
 
     ds->refreshing = true;
     dpy_refresh(ds);
@@ -218,11 +217,6 @@ static void gui_update(void *opaque)
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
index 588e7b1bb19..1a32888e08b 100644
--- a/ui/gtk-egl.c
+++ b/ui/gtk-egl.c
@@ -116,8 +116,8 @@ void gd_egl_refresh(DisplayChangeListener *dcl)
 {
     VirtualConsole *vc = container_of(dcl, VirtualConsole, gfx.dcl);
 
-    vc->gfx.dcl.update_interval = gd_monitor_update_interval(
-            vc->window ? vc->window : vc->gfx.drawing_area);
+    gd_update_monitor_refresh_rate(
+            vc, vc->window ? vc->window : vc->gfx.drawing_area);
 
     if (!vc->gfx.esurface) {
         gd_egl_init(vc);
diff --git a/ui/gtk.c b/ui/gtk.c
index 79dc2401203..c3e20806877 100644
--- a/ui/gtk.c
+++ b/ui/gtk.c
@@ -726,11 +726,20 @@ static gboolean gd_window_close(GtkWidget *widget, GdkEvent *event,
     return TRUE;
 }
 
-static void gd_set_ui_info(VirtualConsole *vc, gint width, gint height)
+static void gd_set_ui_refresh_rate(VirtualConsole *vc, int refresh_rate)
 {
     QemuUIInfo info;
 
-    memset(&info, 0, sizeof(info));
+    info = *dpy_get_ui_info(vc->gfx.dcl.con);
+    info.refresh_rate = refresh_rate;
+    dpy_set_ui_info(vc->gfx.dcl.con, &info);
+}
+
+static void gd_set_ui_size(VirtualConsole *vc, gint width, gint height)
+{
+    QemuUIInfo info;
+
+    info = *dpy_get_ui_info(vc->gfx.dcl.con);
     info.width = width;
     info.height = height;
     dpy_set_ui_info(vc->gfx.dcl.con, &info);
@@ -754,33 +763,32 @@ static void gd_resize_event(GtkGLArea *area,
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
@@ -810,8 +818,7 @@ static gboolean gd_draw_event(GtkWidget *widget, cairo_t *cr, void *opaque)
         return FALSE;
     }
 
-    vc->gfx.dcl.update_interval =
-        gd_monitor_update_interval(vc->window ? vc->window : s->window);
+    gd_update_monitor_refresh_rate(vc, vc->window ? vc->window : s->window);
 
     fbw = surface_width(vc->gfx.ds);
     fbh = surface_height(vc->gfx.ds);
@@ -1655,7 +1662,7 @@ static gboolean gd_configure(GtkWidget *widget,
 {
     VirtualConsole *vc = opaque;
 
-    gd_set_ui_info(vc, cfg->width, cfg->height);
+    gd_set_ui_size(vc, cfg->width, cfg->height);
     return FALSE;
 }
 
-- 
2.24.3 (Apple Git-128)


