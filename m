Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2692D7A941B
	for <lists+xen-devel@lfdr.de>; Thu, 21 Sep 2023 14:13:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.606343.944196 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qjIYc-00062M-UL; Thu, 21 Sep 2023 12:13:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 606343.944196; Thu, 21 Sep 2023 12:13:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qjIYc-0005zw-RL; Thu, 21 Sep 2023 12:13:22 +0000
Received: by outflank-mailman (input) for mailman id 606343;
 Thu, 21 Sep 2023 12:13:20 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=x4Y2=FF=redhat.com=armbru@srs-se1.protection.inumbo.net>)
 id 1qjIYa-0005zb-Nu
 for xen-devel@lists.xenproject.org; Thu, 21 Sep 2023 12:13:20 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3febeacc-5878-11ee-878a-cb3800f73035;
 Thu, 21 Sep 2023 14:13:19 +0200 (CEST)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-450-IeFTCVl4MGS6yFAGtgTaNg-1; Thu, 21 Sep 2023 08:13:15 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 15619811E96;
 Thu, 21 Sep 2023 12:13:14 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.25])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 793E62156702;
 Thu, 21 Sep 2023 12:13:13 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 73C8021E6905; Thu, 21 Sep 2023 14:13:12 +0200 (CEST)
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
X-Inumbo-ID: 3febeacc-5878-11ee-878a-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1695298398;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=eRiwxpdA+MVBek+OK2IN4IV4BhmaUPfwd9cfv4fQ8qc=;
	b=QFVqLC7P3ziyBpRZnnsJmrgXV/+v65qShZxXpIFuKsyuXEbiggV6XKL+Xf/PSNJwuwSNpC
	w147qQ35IpSrVRzxInYsXf2c2Bq5I8oOv0E5T4v0yuqduHvOjo98UeGKw0fsjGggOh91gi
	1h30D+xMVNzqLPqLl37pCK7uYM1yICA=
X-MC-Unique: IeFTCVl4MGS6yFAGtgTaNg-1
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Cc: kwolf@redhat.com,
	hreitz@redhat.com,
	eblake@redhat.com,
	vsementsov@yandex-team.ru,
	jsnow@redhat.com,
	idryomov@gmail.com,
	pl@kamp.de,
	sw@weilnetz.de,
	sstabellini@kernel.org,
	anthony.perard@citrix.com,
	paul@xen.org,
	pbonzini@redhat.com,
	marcandre.lureau@redhat.com,
	berrange@redhat.com,
	thuth@redhat.com,
	philmd@linaro.org,
	stefanha@redhat.com,
	fam@euphon.net,
	quintela@redhat.com,
	peterx@redhat.com,
	leobras@redhat.com,
	kraxel@redhat.com,
	qemu-block@nongnu.org,
	xen-devel@lists.xenproject.org,
	alex.bennee@linaro.org,
	peter.maydell@linaro.org
Subject: [PATCH v3 3/7] ui: Clean up local variable shadowing
Date: Thu, 21 Sep 2023 14:13:08 +0200
Message-ID: <20230921121312.1301864-4-armbru@redhat.com>
In-Reply-To: <20230921121312.1301864-1-armbru@redhat.com>
References: <20230921121312.1301864-1-armbru@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6

Local variables shadowing other local variables or parameters make the
code needlessly hard to understand.  Tracked down with -Wshadow=local.
Clean up: delete inner declarations when they are actually redundant,
else rename variables.

Signed-off-by: Markus Armbruster <armbru@redhat.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
---
 ui/gtk.c              | 14 +++++++-------
 ui/spice-display.c    |  9 +++++----
 ui/vnc-palette.c      |  2 --
 ui/vnc.c              | 12 ++++++------
 ui/vnc-enc-zrle.c.inc |  9 ++++-----
 5 files changed, 22 insertions(+), 24 deletions(-)

diff --git a/ui/gtk.c b/ui/gtk.c
index e09f97a86b..3373427c9b 100644
--- a/ui/gtk.c
+++ b/ui/gtk.c
@@ -930,8 +930,8 @@ static gboolean gd_motion_event(GtkWidget *widget, GdkEventMotion *motion,
         GdkMonitor *monitor = gdk_display_get_monitor_at_window(dpy, win);
         GdkRectangle geometry;
 
-        int x = (int)motion->x_root;
-        int y = (int)motion->y_root;
+        int xr = (int)motion->x_root;
+        int yr = (int)motion->y_root;
 
         gdk_monitor_get_geometry(monitor, &geometry);
 
@@ -942,13 +942,13 @@ static gboolean gd_motion_event(GtkWidget *widget, GdkEventMotion *motion,
          * may still be only half way across the screen. Without
          * this warp, the server pointer would thus appear to hit
          * an invisible wall */
-        if (x <= geometry.x || x - geometry.x >= geometry.width - 1 ||
-            y <= geometry.y || y - geometry.y >= geometry.height - 1) {
+        if (xr <= geometry.x || xr - geometry.x >= geometry.width - 1 ||
+            yr <= geometry.y || yr - geometry.y >= geometry.height - 1) {
             GdkDevice *dev = gdk_event_get_device((GdkEvent *)motion);
-            x = geometry.x + geometry.width / 2;
-            y = geometry.y + geometry.height / 2;
+            xr = geometry.x + geometry.width / 2;
+            yr = geometry.y + geometry.height / 2;
 
-            gdk_device_warp(dev, screen, x, y);
+            gdk_device_warp(dev, screen, xr, yr);
             s->last_set = FALSE;
             return FALSE;
         }
diff --git a/ui/spice-display.c b/ui/spice-display.c
index 5cc47bd668..6eb98a5a5c 100644
--- a/ui/spice-display.c
+++ b/ui/spice-display.c
@@ -1081,15 +1081,16 @@ static void qemu_spice_gl_update(DisplayChangeListener *dcl,
     }
 
     if (render_cursor) {
-        int x, y;
+        int ptr_x, ptr_y;
+
         qemu_mutex_lock(&ssd->lock);
-        x = ssd->ptr_x;
-        y = ssd->ptr_y;
+        ptr_x = ssd->ptr_x;
+        ptr_y = ssd->ptr_y;
         qemu_mutex_unlock(&ssd->lock);
         egl_texture_blit(ssd->gls, &ssd->blit_fb, &ssd->guest_fb,
                          !y_0_top);
         egl_texture_blend(ssd->gls, &ssd->blit_fb, &ssd->cursor_fb,
-                          !y_0_top, x, y, 1.0, 1.0);
+                          !y_0_top, ptr_x, ptr_y, 1.0, 1.0);
         glFlush();
     }
 
diff --git a/ui/vnc-palette.c b/ui/vnc-palette.c
index dc7c0ba997..4e88c412f0 100644
--- a/ui/vnc-palette.c
+++ b/ui/vnc-palette.c
@@ -86,8 +86,6 @@ int palette_put(VncPalette *palette, uint32_t color)
         return 0;
     }
     if (!entry) {
-        VncPaletteEntry *entry;
-
         entry = &palette->pool[palette->size];
         entry->color = color;
         entry->idx = idx;
diff --git a/ui/vnc.c b/ui/vnc.c
index 6fd86996a5..ecb75ff8c8 100644
--- a/ui/vnc.c
+++ b/ui/vnc.c
@@ -1584,15 +1584,15 @@ static void vnc_jobs_bh(void *opaque)
  */
 static int vnc_client_read(VncState *vs)
 {
-    size_t ret;
+    size_t sz;
 
 #ifdef CONFIG_VNC_SASL
     if (vs->sasl.conn && vs->sasl.runSSF)
-        ret = vnc_client_read_sasl(vs);
+        sz = vnc_client_read_sasl(vs);
     else
 #endif /* CONFIG_VNC_SASL */
-        ret = vnc_client_read_plain(vs);
-    if (!ret) {
+        sz = vnc_client_read_plain(vs);
+    if (!sz) {
         if (vs->disconnecting) {
             vnc_disconnect_finish(vs);
             return -1;
@@ -3118,8 +3118,8 @@ static int vnc_refresh_server_surface(VncDisplay *vd)
     cmp_bytes = MIN(VNC_DIRTY_PIXELS_PER_BIT * VNC_SERVER_FB_BYTES,
                     server_stride);
     if (vd->guest.format != VNC_SERVER_FB_FORMAT) {
-        int width = pixman_image_get_width(vd->server);
-        tmpbuf = qemu_pixman_linebuf_create(VNC_SERVER_FB_FORMAT, width);
+        int w = pixman_image_get_width(vd->server);
+        tmpbuf = qemu_pixman_linebuf_create(VNC_SERVER_FB_FORMAT, w);
     } else {
         int guest_bpp =
             PIXMAN_FORMAT_BPP(pixman_image_get_format(vd->guest.fb));
diff --git a/ui/vnc-enc-zrle.c.inc b/ui/vnc-enc-zrle.c.inc
index a8ca37d05e..2ef7501d52 100644
--- a/ui/vnc-enc-zrle.c.inc
+++ b/ui/vnc-enc-zrle.c.inc
@@ -153,11 +153,12 @@ static void ZRLE_ENCODE_TILE(VncState *vs, ZRLE_PIXEL *data, int w, int h,
     }
 
     if (use_rle) {
-        ZRLE_PIXEL *ptr = data;
-        ZRLE_PIXEL *end = ptr + w * h;
         ZRLE_PIXEL *run_start;
         ZRLE_PIXEL pix;
 
+        ptr = data;
+        end = ptr + w * h;
+
         while (ptr < end) {
             int len;
             int index = 0;
@@ -198,7 +199,7 @@ static void ZRLE_ENCODE_TILE(VncState *vs, ZRLE_PIXEL *data, int w, int h,
         }
     } else if (use_palette) { /* no RLE */
         int bppp;
-        ZRLE_PIXEL *ptr = data;
+        ptr = data;
 
         /* packed pixels */
 
@@ -241,8 +242,6 @@ static void ZRLE_ENCODE_TILE(VncState *vs, ZRLE_PIXEL *data, int w, int h,
 #endif
         {
 #ifdef ZRLE_COMPACT_PIXEL
-            ZRLE_PIXEL *ptr;
-
             for (ptr = data; ptr < data + w * h; ptr++) {
                 ZRLE_WRITE_PIXEL(vs, *ptr);
             }
-- 
2.41.0


