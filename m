Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cKCqDZvN8GnFYwEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 28 Apr 2026 17:09:15 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C2B7487923
	for <lists+xen-devel@lfdr.de>; Tue, 28 Apr 2026 17:09:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1296443.1572853 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wHk3I-0000i1-4n; Tue, 28 Apr 2026 15:08:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1296443.1572853; Tue, 28 Apr 2026 15:08:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wHk3I-0000eF-15; Tue, 28 Apr 2026 15:08:44 +0000
Received: by outflank-mailman (input) for mailman id 1296443;
 Tue, 28 Apr 2026 15:08:42 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <marcandre.lureau@redhat.com>) id 1wHk3F-0000dY-TA
 for xen-devel@lists.xenproject.org; Tue, 28 Apr 2026 15:08:42 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wHk3E-002A37-RW
 for xen-devel@lists.xenproject.org; Tue, 28 Apr 2026 17:08:40 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <marcandre.lureau@redhat.com>)
 id 69f0cd66-2eae-0a2a0a5409dd-0a2a4506b508-22
 for <xen-devel@lists.xenproject.org>; Tue, 28 Apr 2026 17:08:40 +0200
Received: from [170.10.133.124] (helo=us-smtp-delivery-124.mimecast.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <marcandre.lureau@redhat.com>)
 id 69f0cd77-7371-0a2a45060019-aa0a857cbd4f-3
 for <xen-devel@lists.xenproject.org>; Tue, 28 Apr 2026 17:08:40 +0200
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-104-r7s6JQv5MNe2Zdx2qkUipg-1; Tue,
 28 Apr 2026 11:08:34 -0400
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 133DF1955DBD; Tue, 28 Apr 2026 15:08:23 +0000 (UTC)
Received: from localhost (unknown [10.44.24.6])
 by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 6C10F19560AB; Tue, 28 Apr 2026 15:08:18 +0000 (UTC)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=mimecast20190719 header.d=redhat.com header.i="@redhat.com" header.h="From:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:In-Reply-To:References"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1777388919;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=twk5bN/c9zdW8WMPP3xJRHocmGhqop4Vir91q7y6U9w=;
	b=fZvNtB2/ILa3fu/JiTM+GKsKxPmZXj28jvoI8ohXMedbr1bkYdvq9ZjEVqtVppoo9UH18N
	aSkBEpfCV+FJljg54oByOfrUaMT0GNCYncjAXcYkAkKV+bc1LuQNFGRGt0g+jDU1DQNfgg
	HCYxfh1XAyu/rECa2wank6mfP6aqu4g=
X-MC-Unique: r7s6JQv5MNe2Zdx2qkUipg-1
X-Mimecast-MFC-AGG-ID: r7s6JQv5MNe2Zdx2qkUipg_1777388904
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Cc: stefanha@gmail.com,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	Jan Kiszka <jan.kiszka@web.de>,
	Peter Maydell <peter.maydell@linaro.org>,
	Phil Dennis-Jordan <phil@philjordan.eu>,
	Richard Henderson <richard.henderson@linaro.org>,
	Helge Deller <deller@gmx.de>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Gerd Hoffmann <kraxel@redhat.com>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	Samuel Tardieu <sam@rfc1149.net>,
	=?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
	Aleksandar Rikalo <arikalo@gmail.com>,
	Jean-Christophe Dubois <jcd@tribudubois.net>,
	Laurent Vivier <laurent@vivier.eu>,
	Thomas Huth <th.huth+qemu@posteo.eu>,
	BALATON Zoltan <balaton@eik.bme.hu>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>,
	Dmitry Osipenko <dmitry.osipenko@collabora.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Dmitry Fleytman <dmitry.fleytman@gmail.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Anthony PERARD <anthony@xenproject.org>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Alistair Francis <alistair@alistair23.me>,
	Alex Williamson <alex@shazbot.org>,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@redhat.com>,
	qemu-arm@nongnu.org (open list:Musicpal),
	qemu-ppc@nongnu.org (open list:sam460ex),
	xen-devel@lists.xenproject.org (open list:X86 Xen CPUs)
Subject: [PULL v2 08/15] ui/console: return completion status from gfx_update callback
Date: Tue, 28 Apr 2026 19:07:18 +0400
Message-ID: <20260428150726.1659814-9-marcandre.lureau@redhat.com>
In-Reply-To: <20260428150726.1659814-1-marcandre.lureau@redhat.com>
References: <20260428150726.1659814-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
X-Mimecast-MFC-PROC-ID: sjUX8DwUVZCFWnYgRkqZ3gnYgstR0aReOnVkYYln-Zg_1777388904
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-16d1c6/1777388920-9087DD75-7BD5C48B/0/0
X-purgate-type: clean
X-purgate-size: 34166
X-Rspamd-Queue-Id: 6C2B7487923
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[redhat.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[redhat.com:s=mimecast20190719];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[gmail.com,redhat.com,web.de,linaro.org,philjordan.eu,gmx.de,ilande.co.uk,rfc1149.net,reactos.org,tribudubois.net,vivier.eu,posteo.eu,eik.bme.hu,rsg.ci.i.u-tokyo.ac.jp,collabora.com,kernel.org,xenproject.org,alistair23.me,shazbot.org,nongnu.org,lists.xenproject.org];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[marcandre.lureau@redhat.com,xen-devel-bounces@lists.xenproject.org];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[32];
	FORGED_RECIPIENTS(0.00)[m:qemu-devel@nongnu.org,m:stefanha@gmail.com,m:marcandre.lureau@redhat.com,m:jan.kiszka@web.de,m:peter.maydell@linaro.org,m:phil@philjordan.eu,m:richard.henderson@linaro.org,m:deller@gmx.de,m:philmd@linaro.org,m:kraxel@redhat.com,m:mark.cave-ayland@ilande.co.uk,m:sam@rfc1149.net,m:hpoussin@reactos.org,m:arikalo@gmail.com,m:jcd@tribudubois.net,m:laurent@vivier.eu,m:th.huth+qemu@posteo.eu,m:balaton@eik.bme.hu,m:alex.bennee@linaro.org,m:odaki@rsg.ci.i.u-tokyo.ac.jp,m:dmitry.osipenko@collabora.com,m:mst@redhat.com,m:dmitry.fleytman@gmail.com,m:sstabellini@kernel.org,m:anthony@xenproject.org,m:edgar.iglesias@gmail.com,m:alistair@alistair23.me,m:alex@shazbot.org,m:clg@redhat.com,m:qemu-arm@nongnu.org,m:qemu-ppc@nongnu.org,m:xen-devel@lists.xenproject.org,m:th.huth@posteo.eu,m:dmitryfleytman@gmail.com,m:edgariglesias@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[marcandre.lureau@redhat.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[redhat.com:+];
	NEURAL_HAM(-0.00)[-0.915];
	TAGGED_RCPT(0.00)[xen-devel,qemu];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FROM_NO_DN(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[11]

From: Marc-André Lureau <marcandre.lureau@redhat.com>

Replace the two-field design (gfx_update void callback + gfx_update_async
flag) with a single bool return value from gfx_update. Returning true
means the update completed synchronously and graphic_hw_update_done()
should be called by the console layer. Returning false means the update
is deferred and the device will call graphic_hw_update_done() itself
later (as done by QXL/SPICE and Apple GFX).

This simplifies the interface and makes the async contract explicit at
each call site rather than relying on a separate struct field.

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/display/qxl.h              |  2 +-
 include/ui/console.h          | 11 ++++++++---
 hw/arm/musicpal.c             |  3 ++-
 hw/display/artist.c           |  4 +++-
 hw/display/bcm2835_fb.c       |  7 ++++---
 hw/display/bochs-display.c    |  6 ++++--
 hw/display/cg3.c              |  5 +++--
 hw/display/dm163.c            |  4 +++-
 hw/display/exynos4210_fimd.c  |  6 ++++--
 hw/display/g364fb.c           |  9 ++++++---
 hw/display/imx6ul_lcdif.c     |  7 ++++---
 hw/display/jazz_led.c         |  6 ++++--
 hw/display/macfb.c            |  6 ++++--
 hw/display/next-fb.c          |  4 +++-
 hw/display/omap_lcdc.c        | 14 ++++++++------
 hw/display/pl110.c            |  5 +++--
 hw/display/qxl-render.c       |  6 +++---
 hw/display/qxl.c              |  7 +++----
 hw/display/ramfb-standalone.c |  4 +++-
 hw/display/sm501.c            |  8 +++++---
 hw/display/ssd0303.c          | 10 ++++++----
 hw/display/ssd0323.c          | 11 ++++++-----
 hw/display/tcx.c              |  6 ++++--
 hw/display/vga.c              |  4 +++-
 hw/display/virtio-gpu-base.c  |  3 ++-
 hw/display/virtio-vga.c       |  6 +++---
 hw/display/vmware_vga.c       |  7 ++++---
 hw/display/xenfb.c            |  6 ++++--
 hw/display/xlnx_dp.c          | 10 ++++++----
 hw/vfio/display.c             | 17 ++++++++++-------
 ui/console.c                  |  7 +------
 hw/display/apple-gfx.m        | 10 +++++-----
 32 files changed, 132 insertions(+), 89 deletions(-)

diff --git a/hw/display/qxl.h b/hw/display/qxl.h
index e0a85a5ca49..ad8a9128785 100644
--- a/hw/display/qxl.h
+++ b/hw/display/qxl.h
@@ -187,7 +187,7 @@ int qxl_log_command(PCIQXLDevice *qxl, const char *ring, QXLCommandExt *ext);
 
 /* qxl-render.c */
 void qxl_render_resize(PCIQXLDevice *qxl);
-void qxl_render_update(PCIQXLDevice *qxl);
+bool qxl_render_update(PCIQXLDevice *qxl);
 int qxl_render_cursor(PCIQXLDevice *qxl, QXLCommandExt *ext);
 void qxl_render_update_area_done(PCIQXLDevice *qxl, QXLCookie *cookie);
 void qxl_render_update_area_bh(void *opaque);
diff --git a/include/ui/console.h b/include/ui/console.h
index f04844263b9..0bc9e544fad 100644
--- a/include/ui/console.h
+++ b/include/ui/console.h
@@ -368,9 +368,14 @@ enum {
 typedef struct GraphicHwOps {
     int (*get_flags)(void *opaque); /* optional, default 0 */
     void (*invalidate)(void *opaque);
-    void (*gfx_update)(void *opaque);
-    bool gfx_update_async; /* if true, calls graphic_hw_update_done() */
-    void (*text_update)(void *opaque, console_ch_t *text);
+    /*
+     * Returns true if the update is handled synchronously, false if deferred
+     * and graphic_hw_update_done() will be called when ready (to resume waiting
+     * tasks/coroutines).
+     * Optional.
+     */
+    bool (*gfx_update)(void *opaque);
+    void (*text_update)(void *opaque, uint32_t *text);
     void (*ui_info)(void *opaque, uint32_t head, QemuUIInfo *info);
     void (*gl_block)(void *opaque, bool block);
 } GraphicHwOps;
diff --git a/hw/arm/musicpal.c b/hw/arm/musicpal.c
index 441a11100a3..ba88ed756e2 100644
--- a/hw/arm/musicpal.c
+++ b/hw/arm/musicpal.c
@@ -152,7 +152,7 @@ static inline void set_lcd_pixel32(musicpal_lcd_state *s,
     }
 }
 
-static void lcd_refresh(void *opaque)
+static bool lcd_refresh(void *opaque)
 {
     musicpal_lcd_state *s = opaque;
     int x, y, col;
@@ -171,6 +171,7 @@ static void lcd_refresh(void *opaque)
     }
 
     dpy_gfx_update(s->con, 0, 0, 128*3, 64*3);
+    return true;
 }
 
 static void lcd_invalidate(void *opaque)
diff --git a/hw/display/artist.c b/hw/display/artist.c
index 206f77afba1..a07508378c7 100644
--- a/hw/display/artist.c
+++ b/hw/display/artist.c
@@ -1311,7 +1311,7 @@ static void artist_draw_line(void *opaque, uint8_t *d, const uint8_t *src,
     }
 }
 
-static void artist_update_display(void *opaque)
+static bool artist_update_display(void *opaque)
 {
     ARTISTState *s = opaque;
     DisplaySurface *surface = qemu_console_surface(s->con);
@@ -1326,6 +1326,8 @@ static void artist_update_display(void *opaque)
     if (first >= 0) {
         dpy_gfx_update(s->con, 0, first, s->width, last - first + 1);
     }
+
+    return true;
 }
 
 static void artist_invalidate(void *opaque)
diff --git a/hw/display/bcm2835_fb.c b/hw/display/bcm2835_fb.c
index 75d7c0f8499..83c4c03c7ca 100644
--- a/hw/display/bcm2835_fb.c
+++ b/hw/display/bcm2835_fb.c
@@ -150,7 +150,7 @@ static bool fb_use_offsets(BCM2835FBConfig *config)
         config->yres_virtual > config->yres;
 }
 
-static void fb_update_display(void *opaque)
+static bool fb_update_display(void *opaque)
 {
     BCM2835FBState *s = opaque;
     DisplaySurface *surface = qemu_console_surface(s->con);
@@ -161,7 +161,7 @@ static void fb_update_display(void *opaque)
     uint32_t xoff = 0, yoff = 0;
 
     if (s->lock || !s->config.xres) {
-        return;
+        return true;
     }
 
     src_width = bcm2835_fb_get_pitch(&s->config);
@@ -174,7 +174,7 @@ static void fb_update_display(void *opaque)
 
     switch (surface_bits_per_pixel(surface)) {
     case 0:
-        return;
+        return true;
     case 8:
         break;
     case 15:
@@ -212,6 +212,7 @@ static void fb_update_display(void *opaque)
     }
 
     s->invalidate = false;
+    return true;
 }
 
 void bcm2835_fb_validate_config(BCM2835FBConfig *config)
diff --git a/hw/display/bochs-display.c b/hw/display/bochs-display.c
index 5fb6b733cb5..8ef9b76cf85 100644
--- a/hw/display/bochs-display.c
+++ b/hw/display/bochs-display.c
@@ -198,7 +198,7 @@ static int bochs_display_get_mode(BochsDisplayState *s,
     return 0;
 }
 
-static void bochs_display_update(void *opaque)
+static bool bochs_display_update(void *opaque)
 {
     BochsDisplayState *s = opaque;
     DirtyBitmapSnapshot *snap = NULL;
@@ -212,7 +212,7 @@ static void bochs_display_update(void *opaque)
     ret = bochs_display_get_mode(s, &mode);
     if (ret < 0) {
         /* no (valid) video mode */
-        return;
+        return true;
     }
 
     if (memcmp(&s->mode, &mode, sizeof(mode)) != 0) {
@@ -255,6 +255,8 @@ static void bochs_display_update(void *opaque)
 
         g_free(snap);
     }
+
+    return true;
 }
 
 static const GraphicHwOps bochs_display_gfx_ops = {
diff --git a/hw/display/cg3.c b/hw/display/cg3.c
index 0a413fbb7ec..963bb3427a6 100644
--- a/hw/display/cg3.c
+++ b/hw/display/cg3.c
@@ -85,7 +85,7 @@ struct CG3State {
     uint8_t dac_index, dac_state;
 };
 
-static void cg3_update_display(void *opaque)
+static bool cg3_update_display(void *opaque)
 {
     CG3State *s = opaque;
     DisplaySurface *surface = qemu_console_surface(s->con);
@@ -98,7 +98,7 @@ static void cg3_update_display(void *opaque)
     DirtyBitmapSnapshot *snap = NULL;
 
     if (surface_bits_per_pixel(surface) != 32) {
-        return;
+        return true;
     }
     width = s->width;
     height = s->height;
@@ -154,6 +154,7 @@ static void cg3_update_display(void *opaque)
         qemu_irq_raise(s->irq);
     }
     g_free(snap);
+    return true;
 }
 
 static void cg3_invalidate_display(void *opaque)
diff --git a/hw/display/dm163.c b/hw/display/dm163.c
index 4feae912945..9ea62cb4f76 100644
--- a/hw/display/dm163.c
+++ b/hw/display/dm163.c
@@ -285,7 +285,7 @@ static uint32_t *update_display_of_row(DM163State *s, uint32_t *dest,
     return dest;
 }
 
-static void dm163_update_display(void *opaque)
+static bool dm163_update_display(void *opaque)
 {
     DM163State *s = (DM163State *)opaque;
     DisplaySurface *surface = qemu_console_surface(s->console);
@@ -300,6 +300,8 @@ static void dm163_update_display(void *opaque)
         }
         dest = update_display_of_row(s, dest, row);
     }
+
+    return true;
 }
 
 static const GraphicHwOps dm163_ops = {
diff --git a/hw/display/exynos4210_fimd.c b/hw/display/exynos4210_fimd.c
index 2d8fa7ee944..a91f04aaf79 100644
--- a/hw/display/exynos4210_fimd.c
+++ b/hw/display/exynos4210_fimd.c
@@ -1270,7 +1270,7 @@ static void exynos4210_update_resolution(Exynos4210fimdState *s)
     }
 }
 
-static void exynos4210_fimd_update(void *opaque)
+static bool exynos4210_fimd_update(void *opaque)
 {
     Exynos4210fimdState *s = (Exynos4210fimdState *)opaque;
     DisplaySurface *surface;
@@ -1287,7 +1287,7 @@ static void exynos4210_fimd_update(void *opaque)
 
     if (!s || !s->console || !s->enabled ||
         surface_bits_per_pixel(qemu_console_surface(s->console)) == 0) {
-        return;
+        return true;
     }
 
     global_width = (s->vidtcon[2] & FIMD_VIDTCON2_SIZE_MASK) + 1;
@@ -1348,6 +1348,8 @@ static void exynos4210_fimd_update(void *opaque)
         exynos4210_fimd_enable(s, false);
     }
     exynos4210_fimd_update_irq(s);
+
+    return true;
 }
 
 static void exynos4210_fimd_reset(DeviceState *d)
diff --git a/hw/display/g364fb.c b/hw/display/g364fb.c
index 50952e9934b..bd15f6f0acc 100644
--- a/hw/display/g364fb.c
+++ b/hw/display/g364fb.c
@@ -238,15 +238,16 @@ static void g364fb_draw_blank(G364State *s)
     s->blanked = 1;
 }
 
-static void g364fb_update_display(void *opaque)
+static bool g364fb_update_display(void *opaque)
 {
     G364State *s = opaque;
     DisplaySurface *surface = qemu_console_surface(s->con);
 
     qemu_flush_coalesced_mmio_buffer();
 
-    if (s->width == 0 || s->height == 0)
-        return;
+    if (s->width == 0 || s->height == 0) {
+        return true;
+    }
 
     if (s->width != surface_width(surface) ||
         s->height != surface_height(surface)) {
@@ -262,6 +263,8 @@ static void g364fb_update_display(void *opaque)
     }
 
     qemu_irq_raise(s->irq);
+
+    return true;
 }
 
 static inline void g364fb_invalidate_display(void *opaque)
diff --git a/hw/display/imx6ul_lcdif.c b/hw/display/imx6ul_lcdif.c
index 33cd00fbe16..afcd0805ca4 100644
--- a/hw/display/imx6ul_lcdif.c
+++ b/hw/display/imx6ul_lcdif.c
@@ -152,7 +152,7 @@ static void imx6ul_lcdif_draw_line_xrgb8888(void *opaque, uint8_t *dst,
     }
 }
 
-static void imx6ul_lcdif_update_display(void *opaque)
+static bool imx6ul_lcdif_update_display(void *opaque)
 {
     IMX6ULLCDIFState *s = opaque;
     DisplaySurface *surface = qemu_console_surface(s->con);
@@ -167,7 +167,7 @@ static void imx6ul_lcdif_update_display(void *opaque)
     int src_width;
 
     if (!imx6ul_lcdif_is_running(s) || width == 0 || height == 0) {
-        return;
+        return true;
     }
 
     switch (FIELD_EX32(ctrl, CTRL, WORD_LENGTH)) {
@@ -180,7 +180,7 @@ static void imx6ul_lcdif_update_display(void *opaque)
         fn = imx6ul_lcdif_draw_line_xrgb8888;
         break;
     default:
-        return;
+        return true;
     }
 
     if (surface_width(surface) != width || surface_height(surface) != height) {
@@ -207,6 +207,7 @@ static void imx6ul_lcdif_update_display(void *opaque)
     }
 
     s->invalidate = false;
+    return true;
 }
 
 static void imx6ul_lcdif_invalidate_display(void *opaque)
diff --git a/hw/display/jazz_led.c b/hw/display/jazz_led.c
index 9d62e51bed9..7d1a020d4d9 100644
--- a/hw/display/jazz_led.c
+++ b/hw/display/jazz_led.c
@@ -144,7 +144,7 @@ static void draw_vertical_line(DisplaySurface *ds,
     }
 }
 
-static void jazz_led_update_display(void *opaque)
+static bool jazz_led_update_display(void *opaque)
 {
     LedState *s = opaque;
     DisplaySurface *surface = qemu_console_surface(s->con);
@@ -186,7 +186,7 @@ static void jazz_led_update_display(void *opaque)
             color_led = rgb_to_pixel32(0x00, 0xff, 0x00);
             break;
         default:
-            return;
+            return true;
         }
 
         /* display segments */
@@ -218,6 +218,8 @@ static void jazz_led_update_display(void *opaque)
 
     s->state = REDRAW_NONE;
     dpy_gfx_update_full(s->con);
+
+    return true;
 }
 
 static void jazz_led_invalidate_display(void *opaque)
diff --git a/hw/display/macfb.c b/hw/display/macfb.c
index b8115c2be13..848c3c282bd 100644
--- a/hw/display/macfb.c
+++ b/hw/display/macfb.c
@@ -454,7 +454,7 @@ static gchar *macfb_mode_list(void)
 }
 
 
-static void macfb_update_display(void *opaque)
+static bool macfb_update_display(void *opaque)
 {
     MacfbState *s = opaque;
     DisplaySurface *surface = qemu_console_surface(s->con);
@@ -462,7 +462,7 @@ static void macfb_update_display(void *opaque)
     qemu_flush_coalesced_mmio_buffer();
 
     if (s->width == 0 || s->height == 0) {
-        return;
+        return true;
     }
 
     if (s->width != surface_width(surface) ||
@@ -471,6 +471,8 @@ static void macfb_update_display(void *opaque)
     }
 
     macfb_draw_graphic(s);
+
+    return true;
 }
 
 static void macfb_update_irq(MacfbState *s)
diff --git a/hw/display/next-fb.c b/hw/display/next-fb.c
index 3d97702fce5..e758b223ef7 100644
--- a/hw/display/next-fb.c
+++ b/hw/display/next-fb.c
@@ -67,7 +67,7 @@ static void nextfb_draw_line(void *opaque, uint8_t *d, const uint8_t *s,
     }
 }
 
-static void nextfb_update(void *opaque)
+static bool nextfb_update(void *opaque)
 {
     NeXTFbState *s = NEXTFB(opaque);
     int dest_width = 4;
@@ -90,6 +90,8 @@ static void nextfb_update(void *opaque)
                                s, &first, &last);
 
     dpy_gfx_update(s->con, 0, 0, s->cols, s->rows);
+
+    return true;
 }
 
 static void nextfb_invalidate(void *opaque)
diff --git a/hw/display/omap_lcdc.c b/hw/display/omap_lcdc.c
index c41c65bb2e0..1e8385ebffb 100644
--- a/hw/display/omap_lcdc.c
+++ b/hw/display/omap_lcdc.c
@@ -197,7 +197,7 @@ static void draw_line16_32(void *opaque, uint8_t *d, const uint8_t *s,
     } while (-- width != 0);
 }
 
-static void omap_update_display(void *opaque)
+static bool omap_update_display(void *opaque)
 {
     struct omap_lcd_panel_s *omap_lcd = opaque;
     DisplaySurface *surface;
@@ -207,12 +207,12 @@ static void omap_update_display(void *opaque)
     hwaddr frame_base;
 
     if (!omap_lcd || omap_lcd->plm == 1 || !omap_lcd->enable) {
-        return;
+        return true;
     }
 
     surface = qemu_console_surface(omap_lcd->con);
     if (!surface_bits_per_pixel(surface)) {
-        return;
+        return true;
     }
 
     frame_offset = 0;
@@ -256,7 +256,7 @@ static void omap_update_display(void *opaque)
 
     default:
         /* Unsupported at the moment.  */
-        return;
+        return true;
     }
 
     /* Resolution */
@@ -278,7 +278,7 @@ static void omap_update_display(void *opaque)
         omap_lcd->sync_error = 1;
         omap_lcd_interrupts(omap_lcd);
         omap_lcd->enable = 0;
-        return;
+        return true;
     }
 
     /* Content */
@@ -291,7 +291,7 @@ static void omap_update_display(void *opaque)
         omap_lcd->dma->current_frame ^= 1;
 
     if (!surface_bits_per_pixel(surface)) {
-        return;
+        return true;
     }
 
     first = 0;
@@ -323,6 +323,8 @@ static void omap_update_display(void *opaque)
         dpy_gfx_update(omap_lcd->con, 0, first, width, last - first + 1);
     }
     omap_lcd->invalidate = 0;
+
+    return true;
 }
 
 static void omap_invalidate_display(void *opaque) {
diff --git a/hw/display/pl110.c b/hw/display/pl110.c
index 4cd62a98757..e134ac28eb6 100644
--- a/hw/display/pl110.c
+++ b/hw/display/pl110.c
@@ -210,7 +210,7 @@ static int pl110_enabled(PL110State *s)
   return (s->cr & PL110_CR_EN) && (s->cr & PL110_CR_PWR);
 }
 
-static void pl110_update_display(void *opaque)
+static bool pl110_update_display(void *opaque)
 {
     PL110State *s = (PL110State *)opaque;
     DisplaySurface *surface = qemu_console_surface(s->con);
@@ -221,7 +221,7 @@ static void pl110_update_display(void *opaque)
     int last;
 
     if (!pl110_enabled(s)) {
-        return;
+        return true;
     }
 
     if (s->cr & PL110_CR_BGR)
@@ -306,6 +306,7 @@ static void pl110_update_display(void *opaque)
         dpy_gfx_update(s->con, 0, first, s->cols, last - first + 1);
     }
     s->invalidate = 0;
+    return true;
 }
 
 static void pl110_invalidate_display(void * opaque)
diff --git a/hw/display/qxl-render.c b/hw/display/qxl-render.c
index c6a9ac1da10..5b4f8842011 100644
--- a/hw/display/qxl-render.c
+++ b/hw/display/qxl-render.c
@@ -173,7 +173,7 @@ end:
  * callbacks are called by spice_server thread, deferring to bh called from the
  * io thread.
  */
-void qxl_render_update(PCIQXLDevice *qxl)
+bool qxl_render_update(PCIQXLDevice *qxl)
 {
     QXLCookie *cookie;
 
@@ -183,8 +183,7 @@ void qxl_render_update(PCIQXLDevice *qxl)
         qxl->mode == QXL_MODE_UNDEFINED) {
         qxl_render_update_area_unlocked(qxl);
         qemu_mutex_unlock(&qxl->ssd.lock);
-        graphic_hw_update_done(qxl->ssd.dcl.con);
-        return;
+        return true;
     }
 
     qxl->guest_primary.commands = 0;
@@ -195,6 +194,7 @@ void qxl_render_update(PCIQXLDevice *qxl)
     qxl_set_rect_to_surface(qxl, &cookie->u.render.area);
     qxl_spice_update_area(qxl, 0, &cookie->u.render.area, NULL,
                           0, 1 /* clear_dirty_region */, QXL_ASYNC, cookie);
+    return false;
 }
 
 void qxl_render_update_area_bh(void *opaque)
diff --git a/hw/display/qxl.c b/hw/display/qxl.c
index f8fd7ee0698..0a3c42c8ec2 100644
--- a/hw/display/qxl.c
+++ b/hw/display/qxl.c
@@ -122,7 +122,7 @@ static void qxl_reset_memslots(PCIQXLDevice *d);
 static void qxl_reset_surfaces(PCIQXLDevice *d);
 static void qxl_ring_set_dirty(PCIQXLDevice *qxl);
 
-static void qxl_hw_update(void *opaque);
+static bool qxl_hw_update(void *opaque);
 
 void qxl_set_guest_bug(PCIQXLDevice *qxl, const char *msg, ...)
 {
@@ -1144,7 +1144,6 @@ static const QXLInterface qxl_interface = {
 
 static const GraphicHwOps qxl_ops = {
     .gfx_update  = qxl_hw_update,
-    .gfx_update_async = true,
 };
 
 static void qxl_enter_vga_mode(PCIQXLDevice *d)
@@ -1928,11 +1927,11 @@ static void qxl_send_events(PCIQXLDevice *d, uint32_t events)
 
 /* graphics console */
 
-static void qxl_hw_update(void *opaque)
+static bool qxl_hw_update(void *opaque)
 {
     PCIQXLDevice *qxl = opaque;
 
-    qxl_render_update(qxl);
+    return qxl_render_update(qxl);
 }
 
 static void qxl_dirty_one_surface(PCIQXLDevice *qxl, QXLPHYSICAL pqxl,
diff --git a/hw/display/ramfb-standalone.c b/hw/display/ramfb-standalone.c
index f1958be32ad..27f0ba19f90 100644
--- a/hw/display/ramfb-standalone.c
+++ b/hw/display/ramfb-standalone.c
@@ -20,7 +20,7 @@ struct RAMFBStandaloneState {
     bool use_legacy_x86_rom;
 };
 
-static void display_update_wrapper(void *dev)
+static bool display_update_wrapper(void *dev)
 {
     RAMFBStandaloneState *ramfb = RAMFB(dev);
 
@@ -29,6 +29,8 @@ static void display_update_wrapper(void *dev)
     } else {
         ramfb_display_update(ramfb->con, ramfb->state);
     }
+
+    return true;
 }
 
 static const GraphicHwOps wrapper_ops = {
diff --git a/hw/display/sm501.c b/hw/display/sm501.c
index a07aa9886f9..a3993ceba29 100644
--- a/hw/display/sm501.c
+++ b/hw/display/sm501.c
@@ -1716,7 +1716,7 @@ static void draw_hwc_line_32(uint8_t *d, const uint8_t *s, int width,
     }
 }
 
-static void sm501_update_display(void *opaque)
+static bool sm501_update_display(void *opaque)
 {
     SM501State *s = opaque;
     DisplaySurface *surface = qemu_console_surface(s->con);
@@ -1740,7 +1740,7 @@ static void sm501_update_display(void *opaque)
 
     if (!((crt ? s->dc_crt_control : s->dc_panel_control)
           & SM501_DC_CRT_CONTROL_ENABLE)) {
-        return;
+        return true;
     }
 
     palette = (uint32_t *)(crt ? &s->dc_palette[SM501_DC_CRT_PALETTE -
@@ -1761,7 +1761,7 @@ static void sm501_update_display(void *opaque)
     default:
         qemu_log_mask(LOG_GUEST_ERROR, "sm501: update display"
                       "invalid control register value.\n");
-        return;
+        return true;
     }
 
     /* set up to draw hardware cursor */
@@ -1833,6 +1833,8 @@ static void sm501_update_display(void *opaque)
     if (y_start >= 0) {
         dpy_gfx_update(s->con, 0, y_start, width, y - y_start);
     }
+
+    return true;
 }
 
 static const GraphicHwOps sm501_ops = {
diff --git a/hw/display/ssd0303.c b/hw/display/ssd0303.c
index 87781438cd5..229856cc427 100644
--- a/hw/display/ssd0303.c
+++ b/hw/display/ssd0303.c
@@ -203,7 +203,7 @@ static int ssd0303_event(I2CSlave *i2c, enum i2c_event event)
     return 0;
 }
 
-static void ssd0303_update_display(void *opaque)
+static bool ssd0303_update_display(void *opaque)
 {
     ssd0303_state *s = (ssd0303_state *)opaque;
     DisplaySurface *surface = qemu_console_surface(s->con);
@@ -218,11 +218,11 @@ static void ssd0303_update_display(void *opaque)
     uint8_t mask;
 
     if (!s->redraw)
-        return;
+        return true;
 
     switch (surface_bits_per_pixel(surface)) {
     case 0:
-        return;
+        return true;
     case 15:
         dest_width = 2;
         break;
@@ -237,7 +237,7 @@ static void ssd0303_update_display(void *opaque)
         break;
     default:
         BADF("Bad color depth\n");
-        return;
+        return true;
     }
     dest_width *= MAGNIFY;
     memset(colortab, 0xff, dest_width);
@@ -269,6 +269,8 @@ static void ssd0303_update_display(void *opaque)
     }
     s->redraw = 0;
     dpy_gfx_update(s->con, 0, 0, 96 * MAGNIFY, 16 * MAGNIFY);
+
+    return true;
 }
 
 static void ssd0303_invalidate_display(void * opaque)
diff --git a/hw/display/ssd0323.c b/hw/display/ssd0323.c
index af5ff4fecdc..67db16086c8 100644
--- a/hw/display/ssd0323.c
+++ b/hw/display/ssd0323.c
@@ -181,7 +181,7 @@ static uint32_t ssd0323_transfer(SSIPeripheral *dev, uint32_t data)
     return 0;
 }
 
-static void ssd0323_update_display(void *opaque)
+static bool ssd0323_update_display(void *opaque)
 {
     ssd0323_state *s = (ssd0323_state *)opaque;
     DisplaySurface *surface = qemu_console_surface(s->con);
@@ -197,11 +197,11 @@ static void ssd0323_update_display(void *opaque)
     int dest_width;
 
     if (!s->redraw)
-        return;
+        return true;
 
     switch (surface_bits_per_pixel(surface)) {
     case 0:
-        return;
+        return true;
     case 15:
         dest_width = 2;
         break;
@@ -216,7 +216,7 @@ static void ssd0323_update_display(void *opaque)
         break;
     default:
         BADF("Bad color depth\n");
-        return;
+        return true;
     }
     p = colortab;
     for (i = 0; i < 16; i++) {
@@ -240,7 +240,7 @@ static void ssd0323_update_display(void *opaque)
             break;
         default:
             BADF("Bad color depth\n");
-            return;
+            return true;
         }
         p += dest_width;
     }
@@ -271,6 +271,7 @@ static void ssd0323_update_display(void *opaque)
     }
     s->redraw = 0;
     dpy_gfx_update(s->con, 0, 0, 128 * MAGNIFY, 64 * MAGNIFY);
+    return true;
 }
 
 static void ssd0323_invalidate_display(void * opaque)
diff --git a/hw/display/tcx.c b/hw/display/tcx.c
index ea92a48400c..cedbf5c7acd 100644
--- a/hw/display/tcx.c
+++ b/hw/display/tcx.c
@@ -209,7 +209,7 @@ static inline void tcx24_draw_line32(TCXState *s1, uint8_t *d,
 /* Fixed line length 1024 allows us to do nice tricks not possible on
    VGA... */
 
-static void tcx_update_display(void *opaque)
+static bool tcx_update_display(void *opaque)
 {
     TCXState *ts = opaque;
     DisplaySurface *surface = qemu_console_surface(ts->con);
@@ -257,9 +257,10 @@ static void tcx_update_display(void *opaque)
                        ts->width, y - y_start);
     }
     g_free(snap);
+    return true;
 }
 
-static void tcx24_update_display(void *opaque)
+static bool tcx24_update_display(void *opaque)
 {
     TCXState *ts = opaque;
     DisplaySurface *surface = qemu_console_surface(ts->con);
@@ -312,6 +313,7 @@ static void tcx24_update_display(void *opaque)
                        ts->width, y - y_start);
     }
     g_free(snap);
+    return true;
 }
 
 static void tcx_invalidate_display(void *opaque)
diff --git a/hw/display/vga.c b/hw/display/vga.c
index 0d69a53f27a..776aa443246 100644
--- a/hw/display/vga.c
+++ b/hw/display/vga.c
@@ -1783,7 +1783,7 @@ static void vga_draw_blank(VGACommonState *s, int full_update)
 #define GMODE_GRAPH    1
 #define GMODE_BLANK 2
 
-static void vga_update_display(void *opaque)
+static bool vga_update_display(void *opaque)
 {
     VGACommonState *s = opaque;
     DisplaySurface *surface = qemu_console_surface(s->con);
@@ -1818,6 +1818,8 @@ static void vga_update_display(void *opaque)
             break;
         }
     }
+
+    return true;
 }
 
 /* force a full display refresh */
diff --git a/hw/display/virtio-gpu-base.c b/hw/display/virtio-gpu-base.c
index cb76302e2d8..94cf362d152 100644
--- a/hw/display/virtio-gpu-base.c
+++ b/hw/display/virtio-gpu-base.c
@@ -83,8 +83,9 @@ static void virtio_gpu_invalidate_display(void *opaque)
 {
 }
 
-static void virtio_gpu_update_display(void *opaque)
+static bool virtio_gpu_update_display(void *opaque)
 {
+    return true;
 }
 
 static void virtio_gpu_text_update(void *opaque, console_ch_t *chardata)
diff --git a/hw/display/virtio-vga.c b/hw/display/virtio-vga.c
index 5e087169f2f..f4713b91a66 100644
--- a/hw/display/virtio-vga.c
+++ b/hw/display/virtio-vga.c
@@ -19,15 +19,15 @@ static void virtio_vga_base_invalidate_display(void *opaque)
     }
 }
 
-static void virtio_vga_base_update_display(void *opaque)
+static bool virtio_vga_base_update_display(void *opaque)
 {
     VirtIOVGABase *vvga = opaque;
     VirtIOGPUBase *g = vvga->vgpu;
 
     if (g->enable) {
-        g->hw_ops->gfx_update(g);
+        return g->hw_ops->gfx_update(g);
     } else {
-        vvga->vga.hw_ops->gfx_update(&vvga->vga);
+        return vvga->vga.hw_ops->gfx_update(&vvga->vga);
     }
 }
 
diff --git a/hw/display/vmware_vga.c b/hw/display/vmware_vga.c
index 2b95787ddfd..c84c84a445e 100644
--- a/hw/display/vmware_vga.c
+++ b/hw/display/vmware_vga.c
@@ -1135,14 +1135,13 @@ static inline void vmsvga_check_size(struct vmsvga_state_s *s)
     }
 }
 
-static void vmsvga_update_display(void *opaque)
+static bool vmsvga_update_display(void *opaque)
 {
     struct vmsvga_state_s *s = opaque;
 
     if (!s->enable || !s->config) {
         /* in standard vga mode */
-        s->vga.hw_ops->gfx_update(&s->vga);
-        return;
+        return s->vga.hw_ops->gfx_update(&s->vga);
     }
 
     vmsvga_check_size(s);
@@ -1154,6 +1153,8 @@ static void vmsvga_update_display(void *opaque)
         s->invalidated = 0;
         dpy_gfx_update_full(s->vga.con);
     }
+
+    return true;
 }
 
 static void vmsvga_reset(DeviceState *dev)
diff --git a/hw/display/xenfb.c b/hw/display/xenfb.c
index ba886a940ee..2e431e27be6 100644
--- a/hw/display/xenfb.c
+++ b/hw/display/xenfb.c
@@ -709,14 +709,14 @@ static void xenfb_send_refresh_period(struct XenFB *xenfb, int period)
  * Our screen might be inactive.  When asked for
  * an update we know it is active.
  */
-static void xenfb_update(void *opaque)
+static bool xenfb_update(void *opaque)
 {
     struct XenFB *xenfb = opaque;
     DisplaySurface *surface;
     int i;
 
     if (xenfb->c.xendev.be_state != XenbusStateConnected)
-        return;
+        return true;
 
     if (!xenfb->feature_update) {
         /* we don't get update notifications, thus use the
@@ -770,6 +770,8 @@ static void xenfb_update(void *opaque)
     }
     xenfb->up_count = 0;
     xenfb->up_fullscreen = 0;
+
+    return true;
 }
 
 static void xenfb_ui_info(void *opaque, uint32_t idx, QemuUIInfo *info)
diff --git a/hw/display/xlnx_dp.c b/hw/display/xlnx_dp.c
index 7d037b46a35..50e6ef10984 100644
--- a/hw/display/xlnx_dp.c
+++ b/hw/display/xlnx_dp.c
@@ -1252,12 +1252,12 @@ static inline void xlnx_dp_blend_surface(XlnxDPState *s)
                            surface_height(s->g_plane.surface));
 }
 
-static void xlnx_dp_update_display(void *opaque)
+static bool xlnx_dp_update_display(void *opaque)
 {
     XlnxDPState *s = XLNX_DP(opaque);
 
     if ((s->core_registers[DP_TRANSMITTER_ENABLE] & 0x01) == 0) {
-        return;
+        return true;
     }
 
     xlnx_dpdma_trigger_vsync_irq(s->dpdma);
@@ -1272,14 +1272,14 @@ static void xlnx_dp_update_display(void *opaque)
          */
         s->core_registers[DP_INT_STATUS] |= (1 << 21);
         xlnx_dp_update_irq(s);
-        return;
+        return true;
     }
 
     if (xlnx_dp_global_alpha_enabled(s)) {
         if (!xlnx_dpdma_start_operation(s->dpdma, 0, false)) {
             s->core_registers[DP_INT_STATUS] |= (1 << 21);
             xlnx_dp_update_irq(s);
-            return;
+            return true;
         }
         xlnx_dp_blend_surface(s);
     }
@@ -1288,6 +1288,8 @@ static void xlnx_dp_update_display(void *opaque)
      * XXX: We might want to update only what changed.
      */
     dpy_gfx_update_full(s->console);
+
+    return true;
 }
 
 static const GraphicHwOps xlnx_dp_gfx_ops = {
diff --git a/hw/vfio/display.c b/hw/vfio/display.c
index 5a42a6f7a29..4a9a58036e3 100644
--- a/hw/vfio/display.c
+++ b/hw/vfio/display.c
@@ -285,7 +285,7 @@ static void vfio_display_free_dmabufs(VFIOPCIDevice *vdev)
     }
 }
 
-static void vfio_display_dmabuf_update(void *opaque)
+static bool vfio_display_dmabuf_update(void *opaque)
 {
     VFIOPCIDevice *vdev = opaque;
     VFIODisplay *dpy = vdev->dpy;
@@ -298,7 +298,7 @@ static void vfio_display_dmabuf_update(void *opaque)
         if (dpy->ramfb) {
             ramfb_display_update(dpy->con, dpy->ramfb);
         }
-        return;
+        return true;
     }
 
     width = qemu_dmabuf_get_width(primary->buf);
@@ -340,6 +340,8 @@ static void vfio_display_dmabuf_update(void *opaque)
     if (free_bufs) {
         vfio_display_free_dmabufs(vdev);
     }
+
+    return true;
 }
 
 static int vfio_display_get_flags(void *opaque)
@@ -399,7 +401,7 @@ void vfio_display_reset(VFIOPCIDevice *vdev)
     dpy_gfx_update_full(vdev->dpy->con);
 }
 
-static void vfio_display_region_update(void *opaque)
+static bool vfio_display_region_update(void *opaque)
 {
     VFIOPCIDevice *vdev = opaque;
     VFIODisplay *dpy = vdev->dpy;
@@ -414,18 +416,18 @@ static void vfio_display_region_update(void *opaque)
     if (ret < 0) {
         error_report("ioctl VFIO_DEVICE_QUERY_GFX_PLANE: %s",
                      strerror(errno));
-        return;
+        return true;
     }
     if (!plane.drm_format || !plane.size) {
         if (dpy->ramfb) {
             ramfb_display_update(dpy->con, dpy->ramfb);
             dpy->region.surface = NULL;
         }
-        return;
+        return true;
     }
     format = qemu_drm_format_to_pixman(plane.drm_format);
     if (!format) {
-        return;
+        return true;
     }
 
     if (dpy->region.buffer.size &&
@@ -476,11 +478,12 @@ static void vfio_display_region_update(void *opaque)
     dpy_gfx_update(dpy->con, 0, 0,
                    surface_width(dpy->region.surface),
                    surface_height(dpy->region.surface));
-    return;
+    return true;
 
 err:
     vfio_region_exit(&dpy->region.buffer);
     vfio_region_finalize(&dpy->region.buffer);
+    return true;
 }
 
 static const GraphicHwOps vfio_display_region_ops = {
diff --git a/ui/console.c b/ui/console.c
index abb6cba2826..a608c29b843 100644
--- a/ui/console.c
+++ b/ui/console.c
@@ -136,15 +136,10 @@ void graphic_hw_update_done(QemuConsole *con)
 
 void graphic_hw_update(QemuConsole *con)
 {
-    bool async = false;
     if (!con) {
         return;
     }
-    if (con->hw_ops->gfx_update) {
-        con->hw_ops->gfx_update(con->hw);
-        async = con->hw_ops->gfx_update_async;
-    }
-    if (!async) {
+    if (!con->hw_ops->gfx_update || con->hw_ops->gfx_update(con->hw)) {
         graphic_hw_update_done(con);
     }
 }
diff --git a/hw/display/apple-gfx.m b/hw/display/apple-gfx.m
index e0a765fcb1f..77d80fb7cef 100644
--- a/hw/display/apple-gfx.m
+++ b/hw/display/apple-gfx.m
@@ -330,25 +330,25 @@ static void apple_gfx_render_frame_completed_bh(void *opaque)
     }
 }
 
-static void apple_gfx_fb_update_display(void *opaque)
+static bool apple_gfx_fb_update_display(void *opaque)
 {
     AppleGFXState *s = opaque;
+    bool done = true;
 
     assert(bql_locked());
     if (s->new_frame_ready) {
         dpy_gfx_update_full(s->con);
         s->new_frame_ready = false;
-        graphic_hw_update_done(s->con);
     } else if (s->pending_frames > 0) {
         s->gfx_update_requested = true;
-    } else {
-        graphic_hw_update_done(s->con);
+        done = false;
     }
+
+    return done;
 }
 
 static const GraphicHwOps apple_gfx_fb_ops = {
     .gfx_update = apple_gfx_fb_update_display,
-    .gfx_update_async = true,
 };
 
 /* ------ Mouse cursor and display mode setting ------ */
-- 
2.54.0


