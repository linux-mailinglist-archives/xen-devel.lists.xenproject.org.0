Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 515DC4C55BA
	for <lists+xen-devel@lfdr.de>; Sat, 26 Feb 2022 12:55:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.279767.477603 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nNvfs-0008Vt-Jn; Sat, 26 Feb 2022 11:55:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 279767.477603; Sat, 26 Feb 2022 11:55:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nNvfs-0008T7-FS; Sat, 26 Feb 2022 11:55:44 +0000
Received: by outflank-mailman (input) for mailman id 279767;
 Sat, 26 Feb 2022 11:55:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=r031=TJ=gmail.com=akihiko.odaki@srs-se1.protection.inumbo.net>)
 id 1nNvfq-0007fi-UG
 for xen-devel@lists.xenproject.org; Sat, 26 Feb 2022 11:55:43 +0000
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com
 [2607:f8b0:4864:20::1034])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0514cd72-96fb-11ec-8eb9-a37418f5ba1a;
 Sat, 26 Feb 2022 12:55:41 +0100 (CET)
Received: by mail-pj1-x1034.google.com with SMTP id
 ge19-20020a17090b0e1300b001bcca16e2e7so6273477pjb.3
 for <xen-devel@lists.xenproject.org>; Sat, 26 Feb 2022 03:55:41 -0800 (PST)
Received: from localhost.localdomain
 ([2400:4050:c360:8200:4c8a:825a:fb9a:12f3])
 by smtp.gmail.com with ESMTPSA id
 pi16-20020a17090b1e5000b001bd1ffaf2basm1323761pjb.0.2022.02.26.03.55.38
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Sat, 26 Feb 2022 03:55:40 -0800 (PST)
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
X-Inumbo-ID: 0514cd72-96fb-11ec-8eb9-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ZiMwz4CLUHVQwB/T9EDfn/YLCqMyd2Smwt78yZWRpeo=;
        b=AQpKxolY+jmvrIAcwuW4Q5j87it2u7GvZ51eYOQWO5OZ0CAwny+tQHokxK/bwHV0qF
         gghMz3iM0K7MGDoy29eFn1Ji/t1qYxsz3HZvZ3ksCSM724gIAyLEz1MFcr1G1RQr9TLl
         V016pJBUCr2G3uh0wmWttf5Rtn1WLdAiNjVYpfeheiWs6M1AZO//qzyg3Fq9zJsi60Z6
         LTfKUtoqt4dV7Xxm3QciSv0uhF/cc3RsyouZZ3holFsa1xliqU5wQ8lufWa5nXRXt4YV
         fVZ/Bko53qzyLLxBoZ5cEceawnBQWXRkT2wVNXx22Sfet+hB2sLu1/GC1ANTZaJGzn25
         nkDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ZiMwz4CLUHVQwB/T9EDfn/YLCqMyd2Smwt78yZWRpeo=;
        b=0v0XkOmSTnDteAEUmwIuHE2/N55mG1BcREYu76zPGFBUR5+vqNjS4KXAHD0jmVQu3T
         aB6Q6HoXs6rz3E9rRfbrKy1eWFyX4p4vo9+TOf6YRHDjMV92g3zjN8mz/7kOTihzfh+o
         bqKWpNxFLISJ9FcAOBPQPCaeWD0hm36sBMASFOcHNyuSptXHAAHsS/xzA0dpRqrEo7U8
         h3a8wyQEd4PFbEBwmEjcvxiE1oO6NTFmSehIg6pPaDGO5IBnHtIB9uyBKEgq3pZwdY7l
         GgGNotzERWKPf5c/yUcSVlQPMMOvNb1JjkPv0BXYubbgNLxAbTskyZH/KD4LgJfm29nd
         xWxA==
X-Gm-Message-State: AOAM53310Cyr8Y3RFRcLARGkTTkPYglNGGReWCBhP9dqewp+nNUzo0GP
	v6Db2Mo/aIaFFnS572oKdyo=
X-Google-Smtp-Source: ABdhPJz/YbHQ3xbVnebcpB1Qyc25RMYaC59gB9DTVe0ZA/Fb3d5S0sNzZFhaZSt7b+KC/nesUruCaA==
X-Received: by 2002:a17:902:7e4b:b0:151:57d6:670f with SMTP id a11-20020a1709027e4b00b0015157d6670fmr129391pln.144.1645876540447;
        Sat, 26 Feb 2022 03:55:40 -0800 (PST)
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
Subject: [PATCH v3 2/3] ui: Deliver refresh rate via QemuUIInfo
Date: Sat, 26 Feb 2022 20:55:15 +0900
Message-Id: <20220226115516.59830-3-akihiko.odaki@gmail.com>
X-Mailer: git-send-email 2.32.0 (Apple Git-132)
In-Reply-To: <20220226115516.59830-1-akihiko.odaki@gmail.com>
References: <20220226115516.59830-1-akihiko.odaki@gmail.com>
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
 hw/display/xenfb.c   | 14 +++++++++++---
 include/ui/console.h |  2 +-
 include/ui/gtk.h     |  2 +-
 ui/console.c         |  6 ------
 ui/gtk-egl.c         |  4 ++--
 ui/gtk-gl-area.c     |  3 +--
 ui/gtk.c             | 45 +++++++++++++++++++++++++-------------------
 7 files changed, 42 insertions(+), 34 deletions(-)

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
diff --git a/include/ui/console.h b/include/ui/console.h
index 7f5374380f0..24f1dbec038 100644
--- a/include/ui/console.h
+++ b/include/ui/console.h
@@ -139,6 +139,7 @@ typedef struct QemuUIInfo {
     int       yoff;
     uint32_t  width;
     uint32_t  height;
+    uint32_t  refresh_rate;
 } QemuUIInfo;
 
 /* cursor data format is 32bit RGBA */
@@ -426,7 +427,6 @@ typedef struct GraphicHwOps {
     void (*gfx_update)(void *opaque);
     bool gfx_update_async; /* if true, calls graphic_hw_update_done() */
     void (*text_update)(void *opaque, console_ch_t *text);
-    void (*update_interval)(void *opaque, uint64_t interval);
     void (*ui_info)(void *opaque, uint32_t head, QemuUIInfo *info);
     void (*gl_block)(void *opaque, bool block);
 } GraphicHwOps;
diff --git a/include/ui/gtk.h b/include/ui/gtk.h
index 101b147d1b9..ae0f53740d1 100644
--- a/include/ui/gtk.h
+++ b/include/ui/gtk.h
@@ -155,7 +155,7 @@ extern bool gtk_use_gl_area;
 
 /* ui/gtk.c */
 void gd_update_windowsize(VirtualConsole *vc);
-int gd_monitor_update_interval(GtkWidget *widget);
+void gd_update_monitor_refresh_rate(VirtualConsole *vc, GtkWidget *widget);
 void gd_hw_gl_flushed(void *vc);
 
 /* ui/gtk-egl.c */
diff --git a/ui/console.c b/ui/console.c
index 40eebb6d2cc..63c5c207f0c 100644
--- a/ui/console.c
+++ b/ui/console.c
@@ -155,7 +155,6 @@ static void gui_update(void *opaque)
     uint64_t dcl_interval;
     DisplayState *ds = opaque;
     DisplayChangeListener *dcl;
-    QemuConsole *con;
 
     ds->refreshing = true;
     dpy_refresh(ds);
@@ -170,11 +169,6 @@ static void gui_update(void *opaque)
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
index e3bd4bc2743..b5bffbab252 100644
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
index fc5a082eb84..0113474ef5f 100644
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
index a8567b9ddc8..7d904141af0 100644
--- a/ui/gtk.c
+++ b/ui/gtk.c
@@ -696,11 +696,20 @@ static gboolean gd_window_close(GtkWidget *widget, GdkEvent *event,
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
@@ -724,33 +733,32 @@ static void gd_resize_event(GtkGLArea *area,
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
@@ -787,8 +795,7 @@ static gboolean gd_draw_event(GtkWidget *widget, cairo_t *cr, void *opaque)
         return FALSE;
     }
 
-    vc->gfx.dcl.update_interval =
-        gd_monitor_update_interval(vc->window ? vc->window : s->window);
+    gd_update_monitor_refresh_rate(vc, vc->window ? vc->window : s->window);
 
     fbw = surface_width(vc->gfx.ds);
     fbh = surface_height(vc->gfx.ds);
@@ -1673,7 +1680,7 @@ static gboolean gd_configure(GtkWidget *widget,
 {
     VirtualConsole *vc = opaque;
 
-    gd_set_ui_info(vc, cfg->width, cfg->height);
+    gd_set_ui_size(vc, cfg->width, cfg->height);
     return FALSE;
 }
 
-- 
2.32.0 (Apple Git-132)


