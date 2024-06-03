Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F2A48D85DF
	for <lists+xen-devel@lfdr.de>; Mon,  3 Jun 2024 17:19:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.734955.1141106 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sE9SH-0003N7-AL; Mon, 03 Jun 2024 15:18:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 734955.1141106; Mon, 03 Jun 2024 15:18:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sE9SH-0003FU-6I; Mon, 03 Jun 2024 15:18:37 +0000
Received: by outflank-mailman (input) for mailman id 734955;
 Mon, 03 Jun 2024 15:18:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=3DZA=NF=redhat.com=kraxel@srs-se1.protection.inumbo.net>)
 id 1sE9SF-00030f-Uq
 for xen-devel@lists.xenproject.org; Mon, 03 Jun 2024 15:18:35 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8ad6c8c0-21bc-11ef-90a1-e314d9c70b13;
 Mon, 03 Jun 2024 17:18:35 +0200 (CEST)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-391-On8TU32lNrWFK8D0XWJUxg-1; Mon, 03 Jun 2024 11:18:30 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id EDB9D85A58C;
 Mon,  3 Jun 2024 15:18:29 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.192.239])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9BC29C15C05;
 Mon,  3 Jun 2024 15:18:28 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 2456C1801F28; Mon,  3 Jun 2024 17:18:26 +0200 (CEST)
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
X-Inumbo-ID: 8ad6c8c0-21bc-11ef-90a1-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1717427913;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=i8kzX9DrYOhcqIvJMNJmWCuMKiFj8etOtZj3EnRy0I8=;
	b=KXPNlJd0dPNGAyLTTPnQJdbWxIZg0IVS5BACVvB7Et5xtwkDB2JLk6+aAlgNVJ0AKgps2W
	6vI0SrYd6fqGqggHovJbyZIRWiifwasDBsbJb7ofLw5Q0S+cf17vKW1qdIJr59HHui23jd
	DfoOgNvzkTdervHZe+fij4wUFD2QLvw=
X-MC-Unique: On8TU32lNrWFK8D0XWJUxg-1
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Cc: Anthony PERARD <anthony@xenproject.org>,
	Gerd Hoffmann <kraxel@redhat.com>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	Paul Durrant <paul@xen.org>,
	xen-devel@lists.xenproject.org,
	Stefano Stabellini <sstabellini@kernel.org>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@gmail.com>
Subject: [PATCH v2 2/3] ui+display: rename is_buffer_shared() -> surface_is_borrowed()
Date: Mon,  3 Jun 2024 17:18:24 +0200
Message-ID: <20240603151825.188353-3-kraxel@redhat.com>
In-Reply-To: <20240603151825.188353-1-kraxel@redhat.com>
References: <20240603151825.188353-1-kraxel@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.8

No functional change.

Suggested-by: Marc-André Lureau <marcandre.lureau@gmail.com>
Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 include/ui/surface.h    |  2 +-
 hw/display/qxl-render.c |  2 +-
 hw/display/vga.c        | 10 +++++-----
 hw/display/xenfb.c      |  4 ++--
 ui/console.c            |  2 +-
 5 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/include/ui/surface.h b/include/ui/surface.h
index 4244e0ca4a32..96f9b1611c1c 100644
--- a/include/ui/surface.h
+++ b/include/ui/surface.h
@@ -45,7 +45,7 @@ void qemu_displaysurface_win32_set_handle(DisplaySurface *surface,
 DisplaySurface *qemu_create_displaysurface(int width, int height);
 void qemu_free_displaysurface(DisplaySurface *surface);
 
-static inline int is_buffer_shared(DisplaySurface *surface)
+static inline int surface_is_borrowed(DisplaySurface *surface)
 {
     return !(surface->flags & QEMU_ALLOCATED_FLAG);
 }
diff --git a/hw/display/qxl-render.c b/hw/display/qxl-render.c
index ec99ec887a6e..bfdf2c59bdbe 100644
--- a/hw/display/qxl-render.c
+++ b/hw/display/qxl-render.c
@@ -31,7 +31,7 @@ static void qxl_blit(PCIQXLDevice *qxl, QXLRect *rect)
     uint8_t *src;
     int len, i;
 
-    if (is_buffer_shared(surface)) {
+    if (surface_is_borrowed(surface)) {
         return;
     }
     trace_qxl_render_blit(qxl->guest_primary.qxl_stride,
diff --git a/hw/display/vga.c b/hw/display/vga.c
index 474b6b14c327..bd800a683e45 100644
--- a/hw/display/vga.c
+++ b/hw/display/vga.c
@@ -1620,7 +1620,7 @@ static void vga_draw_graphic(VGACommonState *s, int full_update)
         height != s->last_height ||
         s->last_depth != depth ||
         s->last_byteswap != byteswap ||
-        share_surface != is_buffer_shared(surface)) {
+        share_surface != surface_is_borrowed(surface)) {
         /* display parameters changed -> need new display surface */
         s->last_scr_width = disp_width;
         s->last_scr_height = height;
@@ -1635,7 +1635,7 @@ static void vga_draw_graphic(VGACommonState *s, int full_update)
         full_update = 1;
     }
     if (surface_data(surface) != s->vram_ptr + (s->params.start_addr * 4)
-        && is_buffer_shared(surface)) {
+        && surface_is_borrowed(surface)) {
         /* base address changed (page flip) -> shared display surfaces
          * must be updated with the new base address */
         full_update = 1;
@@ -1655,7 +1655,7 @@ static void vga_draw_graphic(VGACommonState *s, int full_update)
 
     vga_draw_line = vga_draw_line_table[v];
 
-    if (!is_buffer_shared(surface) && s->cursor_invalidate) {
+    if (!surface_is_borrowed(surface) && s->cursor_invalidate) {
         s->cursor_invalidate(s);
     }
 
@@ -1707,7 +1707,7 @@ static void vga_draw_graphic(VGACommonState *s, int full_update)
         if (update) {
             if (y_start < 0)
                 y_start = y;
-            if (!(is_buffer_shared(surface))) {
+            if (!(surface_is_borrowed(surface))) {
                 uint8_t *p;
                 p = vga_draw_line(s, d, addr, width, hpel);
                 if (p) {
@@ -1762,7 +1762,7 @@ static void vga_draw_blank(VGACommonState *s, int full_update)
     if (s->last_scr_width <= 0 || s->last_scr_height <= 0)
         return;
 
-    if (is_buffer_shared(surface)) {
+    if (surface_is_borrowed(surface)) {
         /* unshare buffer, otherwise the blanking corrupts vga vram */
         surface = qemu_create_displaysurface(s->last_scr_width, s->last_scr_height);
         dpy_gfx_replace_surface(s->con, surface);
diff --git a/hw/display/xenfb.c b/hw/display/xenfb.c
index 27536bfce0cb..a9bc5a08cdc2 100644
--- a/hw/display/xenfb.c
+++ b/hw/display/xenfb.c
@@ -637,7 +637,7 @@ static void xenfb_guest_copy(struct XenFB *xenfb, int x, int y, int w, int h)
     int linesize = surface_stride(surface);
     uint8_t *data = surface_data(surface);
 
-    if (!is_buffer_shared(surface)) {
+    if (!surface_is_borrowed(surface)) {
         switch (xenfb->depth) {
         case 8:
             if (bpp == 16) {
@@ -755,7 +755,7 @@ static void xenfb_update(void *opaque)
         xen_pv_printf(&xenfb->c.xendev, 1,
                       "update: resizing: %dx%d @ %d bpp%s\n",
                       xenfb->width, xenfb->height, xenfb->depth,
-                      is_buffer_shared(surface) ? " (shared)" : "");
+                      surface_is_borrowed(surface) ? " (borrowed)" : "");
         xenfb->up_fullscreen = 1;
     }
 
diff --git a/ui/console.c b/ui/console.c
index 1b2cd0c7365d..d7967ddb0d1a 100644
--- a/ui/console.c
+++ b/ui/console.c
@@ -1510,7 +1510,7 @@ void qemu_console_resize(QemuConsole *s, int width, int height)
     assert(QEMU_IS_GRAPHIC_CONSOLE(s));
 
     if ((s->scanout.kind != SCANOUT_SURFACE ||
-         (surface && !is_buffer_shared(surface) && !is_placeholder(surface))) &&
+         (surface && !surface_is_borrowed(surface) && !is_placeholder(surface))) &&
         qemu_console_get_width(s, -1) == width &&
         qemu_console_get_height(s, -1) == height) {
         return;
-- 
2.45.1


