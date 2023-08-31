Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1562778EE89
	for <lists+xen-devel@lfdr.de>; Thu, 31 Aug 2023 15:26:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.593901.927067 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qbhgO-000263-NG; Thu, 31 Aug 2023 13:26:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 593901.927067; Thu, 31 Aug 2023 13:26:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qbhgO-00023o-HB; Thu, 31 Aug 2023 13:26:00 +0000
Received: by outflank-mailman (input) for mailman id 593901;
 Thu, 31 Aug 2023 13:25:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=smM9=EQ=redhat.com=armbru@srs-se1.protection.inumbo.net>)
 id 1qbhgM-00011r-P4
 for xen-devel@lists.xenproject.org; Thu, 31 Aug 2023 13:25:58 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ea6a390e-4801-11ee-9b0d-b553b5be7939;
 Thu, 31 Aug 2023 15:25:56 +0200 (CEST)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-166-AMkiEJVzP9q12H4PY919rg-1; Thu, 31 Aug 2023 09:25:49 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B086D80CC5E;
 Thu, 31 Aug 2023 13:25:48 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.30])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id BC58240C2072;
 Thu, 31 Aug 2023 13:25:47 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id BBE4421E6930; Thu, 31 Aug 2023 15:25:46 +0200 (CEST)
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
X-Inumbo-ID: ea6a390e-4801-11ee-9b0d-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1693488355;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=J6v14ZSStXkdDjMaevSWEfLeuGs8oIU/1ND+Elarnrg=;
	b=dsTldv1lQKpc5w9dMH5RQoqhpPNG0XPonsXeQqvF2S6K2K7sIGW6N/fNb0sJfJ4u5DBCnV
	oBH322YsuKCii2SK5WcCAD0UX0pTiXXrQMcCaPCgmcgWzyhio2XgqQG/6o6RLQlO0GC/u+
	YHMIyuZ0CjO0VvkjZylV7N28b7I/bbk=
X-MC-Unique: AMkiEJVzP9q12H4PY919rg-1
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
Subject: [PATCH 3/7] ui: Clean up local variable shadowing
Date: Thu, 31 Aug 2023 15:25:42 +0200
Message-ID: <20230831132546.3525721-4-armbru@redhat.com>
In-Reply-To: <20230831132546.3525721-1-armbru@redhat.com>
References: <20230831132546.3525721-1-armbru@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1

Local variables shadowing other local variables or parameters make the
code needlessly hard to understand.  Tracked down with -Wshadow=local.
Clean up: delete inner declarations when they are actually redundant,
else rename variables.

Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 ui/gtk.c              | 14 +++++++-------
 ui/spice-display.c    |  9 +++++----
 ui/vnc-palette.c      |  2 --
 ui/vnc.c              | 12 ++++++------
 ui/vnc-enc-zrle.c.inc |  9 ++++-----
 5 files changed, 22 insertions(+), 24 deletions(-)

diff --git a/ui/gtk.c b/ui/gtk.c
index 8ba41c8f13..24c78df79e 100644
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
index 3f3f8013d8..cbaba3bbad 100644
--- a/ui/spice-display.c
+++ b/ui/spice-display.c
@@ -1080,15 +1080,16 @@ static void qemu_spice_gl_update(DisplayChangeListener *dcl,
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
index 92964dcc0c..3e1fccffa3 100644
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
index c107d8affc..edf42d4a6a 100644
--- a/ui/vnc-enc-zrle.c.inc
+++ b/ui/vnc-enc-zrle.c.inc
@@ -153,11 +153,12 @@ static void ZRLE_ENCODE_TILE(VncState *vs, ZRLE_PIXEL *data, int w, int h,
     }
 
     if (use_rle) {
-        ZRLE_PIXEL *ptr = data;
-        ZRLE_PIXEL *end = ptr + w * h;
         ZRLE_PIXEL *run_start;
         ZRLE_PIXEL pix;
 
+	ptr = data;
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


