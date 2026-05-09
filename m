Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iLv/OSps/2kR6QAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Sat, 09 May 2026 19:17:30 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 01F9D500BE1
	for <lists+xen-devel@lfdr.de>; Sat, 09 May 2026 19:17:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1304899.1577581 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wLlIX-0004mx-23; Sat, 09 May 2026 17:17:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1304899.1577581; Sat, 09 May 2026 17:17:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wLlIW-0004k8-Ur; Sat, 09 May 2026 17:17:04 +0000
Received: by outflank-mailman (input) for mailman id 1304899;
 Sat, 09 May 2026 17:17:03 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <marcandre.lureau@redhat.com>) id 1wLlIU-0004k2-GJ
 for xen-devel@lists.xenproject.org; Sat, 09 May 2026 17:17:03 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wLlIT-0026KT-TV
 for xen-devel@lists.xenproject.org; Sat, 09 May 2026 19:17:01 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <marcandre.lureau@redhat.com>)
 id 69ff6bfe-5cb7-0a2a0a5109dd-0a2a4502e204-8
 for <xen-devel@lists.xenproject.org>; Sat, 09 May 2026 19:17:01 +0200
Received: from [170.10.133.124] (helo=us-smtp-delivery-124.mimecast.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <marcandre.lureau@redhat.com>)
 id 69ff6c0c-af86-0a2a45020019-aa0a857c766d-3
 for <xen-devel@lists.xenproject.org>; Sat, 09 May 2026 19:17:01 +0200
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-636-BfaoMpQBOwe2Oicoz6BwWg-1; Sat,
 09 May 2026 13:16:55 -0400
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 6AB3819560B4; Sat,  9 May 2026 17:16:50 +0000 (UTC)
Received: from localhost (unknown [10.44.24.4])
 by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 444FB3002D30; Sat,  9 May 2026 17:16:44 +0000 (UTC)
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
	s=mimecast20190719; t=1778347020;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=S55zZ457fOtWSDgpU0+d8V9m5MMTKNlkmEv79oOosxI=;
	b=C+TmSI3nIwTwD4oIrctDe9CWbo9P2q+dcej67Ab4ATrZPkE20KAHf35ntdpwWOVz0YQN94
	6WlFODnMCIPPg/WEWa8JdCVptM+ojhMTuYepz/WHVG13+ZCDh8BgfbWeQ+brjM+7yKXRYq
	WcWL1NzGNzlDeUROA94epJNehYQy2T0=
X-MC-Unique: BfaoMpQBOwe2Oicoz6BwWg-1
X-Mimecast-MFC-AGG-ID: BfaoMpQBOwe2Oicoz6BwWg_1778347011
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
	"Michael S. Tsirkin" <mst@redhat.com>,
	Stefano Garzarella <sgarzare@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>,
	Dmitry Osipenko <dmitry.osipenko@collabora.com>,
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
Subject: [PULL v2 28/33] ui/console: rename public API to use consistent qemu_console_ prefix
Date: Sat,  9 May 2026 21:13:49 +0400
Message-ID: <20260509171356.1157879-29-marcandre.lureau@redhat.com>
In-Reply-To: <20260509171356.1157879-1-marcandre.lureau@redhat.com>
References: <20260509171356.1157879-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
X-Mimecast-MFC-PROC-ID: D35fY0rVM-B65eHF4-ZLT2s8iET6TQw44jBDt0cMmao_1778347011
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-720697/1778347021-7BD672C1-286549E4/0/0
X-purgate-type: clean
X-purgate-size: 114193
X-Rspamd-Queue-Id: 01F9D500BE1
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
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[marcandre.lureau@redhat.com,xen-devel-bounces@lists.xenproject.org];
	RCPT_COUNT_TWELVE(0.00)[33];
	FORGED_RECIPIENTS(0.00)[m:qemu-devel@nongnu.org,m:stefanha@gmail.com,m:marcandre.lureau@redhat.com,m:jan.kiszka@web.de,m:peter.maydell@linaro.org,m:phil@philjordan.eu,m:richard.henderson@linaro.org,m:deller@gmx.de,m:philmd@linaro.org,m:kraxel@redhat.com,m:mark.cave-ayland@ilande.co.uk,m:sam@rfc1149.net,m:hpoussin@reactos.org,m:arikalo@gmail.com,m:jcd@tribudubois.net,m:laurent@vivier.eu,m:th.huth+qemu@posteo.eu,m:balaton@eik.bme.hu,m:mst@redhat.com,m:sgarzare@redhat.com,m:alex.bennee@linaro.org,m:odaki@rsg.ci.i.u-tokyo.ac.jp,m:dmitry.osipenko@collabora.com,m:dmitry.fleytman@gmail.com,m:sstabellini@kernel.org,m:anthony@xenproject.org,m:edgar.iglesias@gmail.com,m:alistair@alistair23.me,m:alex@shazbot.org,m:clg@redhat.com,m:qemu-arm@nongnu.org,m:qemu-ppc@nongnu.org,m:xen-devel@lists.xenproject.org,m:th.huth@posteo.eu,m:dmitryfleytman@gmail.com,m:edgariglesias@gmail.com,s:lists@lfdr.de];
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
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel,qemu];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FROM_NO_DN(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[11]
X-Rspamd-Action: no action

From: Marc-André Lureau <marcandre.lureau@redhat.com>

Rename the display and graphic console public functions to follow a
consistent qemu_console_ (or qemu_graphic_console_) naming convention.

The previous API used a mix of prefixes: dpy_, graphic_hw_,
graphic_console_, console_has_, and update_displaychangelistener().
Unify them under a common qemu_console_ namespace for better
discoverability and consistency.

The main renames are:
- dpy_gfx_*() / dpy_text_*() / dpy_gl_*() → qemu_console_*()
- dpy_{get,set}_ui_info() → qemu_console_{get,set}_ui_info()
- graphic_hw_*() → qemu_console_hw_*()
- graphic_console_*() → qemu_graphic_console_*()
- console_has_gl() → qemu_console_has_gl()
- update_displaychangelistener() → qemu_console_listener_set_refresh()

No functional changes.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 include/ui/console.h             | 108 ++++++++++++------------
 hw/arm/musicpal.c                |   4 +-
 hw/display/artist.c              |   4 +-
 hw/display/ati.c                 |  16 ++--
 hw/display/bcm2835_fb.c          |   5 +-
 hw/display/bochs-display.c       |  14 ++--
 hw/display/cg3.c                 |   6 +-
 hw/display/cirrus_vga.c          |   8 +-
 hw/display/cirrus_vga_isa.c      |   2 +-
 hw/display/dm163.c               |   6 +-
 hw/display/exynos4210_fimd.c     |   4 +-
 hw/display/g364fb.c              |  10 +--
 hw/display/imx6ul_lcdif.c        |  14 ++--
 hw/display/jazz_led.c            |   8 +-
 hw/display/macfb.c               |   6 +-
 hw/display/next-fb.c             |   4 +-
 hw/display/omap_lcdc.c           |   4 +-
 hw/display/pl110.c               |   4 +-
 hw/display/qxl-render.c          |  12 +--
 hw/display/qxl.c                 |  14 ++--
 hw/display/ramfb-standalone.c    |   2 +-
 hw/display/ramfb.c               |   4 +-
 hw/display/sm501.c               |   6 +-
 hw/display/ssd0303.c             |   4 +-
 hw/display/ssd0323.c             |   5 +-
 hw/display/tcx.c                 |  16 ++--
 hw/display/vga-isa.c             |   2 +-
 hw/display/vga-mmio.c            |   2 +-
 hw/display/vga-pci.c             |   6 +-
 hw/display/vga.c                 |  40 +++++----
 hw/display/vhost-user-gpu.c      |  22 ++---
 hw/display/virtio-gpu-base.c     |   2 +-
 hw/display/virtio-gpu-rutabaga.c |  10 +--
 hw/display/virtio-gpu-udmabuf.c  |   4 +-
 hw/display/virtio-gpu-virgl.c    |  20 ++---
 hw/display/virtio-gpu.c          |  26 +++---
 hw/display/virtio-vga.c          |   2 +-
 hw/display/vmware_vga.c          |  12 +--
 hw/display/xenfb.c               |   6 +-
 hw/display/xlnx_dp.c             |  10 +--
 hw/vfio/display.c                |  32 +++----
 ui/console-vc.c                  |  12 +--
 ui/console.c                     | 140 +++++++++++++++----------------
 ui/curses.c                      |   8 +-
 ui/dbus-console.c                |   4 +-
 ui/dbus-listener.c               |  10 +--
 ui/egl-headless.c                |   4 +-
 ui/gtk-egl.c                     |   6 +-
 ui/gtk-gl-area.c                 |   6 +-
 ui/gtk.c                         |  18 ++--
 ui/sdl2-2d.c                     |   2 +-
 ui/sdl2-gl.c                     |   2 +-
 ui/sdl2.c                        |   6 +-
 ui/spice-display.c               |  16 ++--
 ui/vnc.c                         |  22 ++---
 hw/display/apple-gfx.m           |  16 ++--
 ui/cocoa.m                       |  10 +--
 57 files changed, 379 insertions(+), 389 deletions(-)

diff --git a/include/ui/console.h b/include/ui/console.h
index 69ac7b01b33..cfa940d4c66 100644
--- a/include/ui/console.h
+++ b/include/ui/console.h
@@ -294,49 +294,49 @@ DisplayState *init_displaystate(void);
 void qemu_console_register_listener(QemuConsole *con,
                                     DisplayChangeListener *dcl,
                                     const DisplayChangeListenerOps *ops);
-void update_displaychangelistener(DisplayChangeListener *dcl,
-                                  uint64_t interval);
+void qemu_console_listener_set_refresh(DisplayChangeListener *dcl,
+                                       uint64_t interval);
 void qemu_console_unregister_listener(DisplayChangeListener *dcl);
 
-bool dpy_ui_info_supported(const QemuConsole *con);
-const QemuUIInfo *dpy_get_ui_info(const QemuConsole *con);
-int dpy_set_ui_info(QemuConsole *con, QemuUIInfo *info, bool delay);
-
-void dpy_gfx_update(QemuConsole *con, int x, int y, int w, int h);
-void dpy_gfx_update_full(QemuConsole *con);
-void dpy_gfx_replace_surface(QemuConsole *con,
-                             DisplaySurface *surface);
-void dpy_text_cursor(QemuConsole *con, int x, int y);
-void dpy_text_update(QemuConsole *con, int x, int y, int w, int h);
-void dpy_text_resize(QemuConsole *con, int w, int h);
-void dpy_mouse_set(QemuConsole *con, int x, int y, bool on);
-void dpy_cursor_define(QemuConsole *con, QEMUCursor *cursor);
-bool dpy_gfx_check_format(QemuConsole *con,
-                          pixman_format_code_t format);
-
-void dpy_gl_scanout_disable(QemuConsole *con);
-void dpy_gl_scanout_texture(QemuConsole *con,
-                            uint32_t backing_id, bool backing_y_0_top,
-                            uint32_t backing_width, uint32_t backing_height,
-                            uint32_t x, uint32_t y, uint32_t w, uint32_t h,
-                            void *d3d_tex2d);
-void dpy_gl_scanout_dmabuf(QemuConsole *con,
-                           QemuDmaBuf *dmabuf);
-void dpy_gl_cursor_dmabuf(QemuConsole *con, QemuDmaBuf *dmabuf,
-                          bool have_hot, uint32_t hot_x, uint32_t hot_y);
-void dpy_gl_cursor_position(QemuConsole *con,
-                            uint32_t pos_x, uint32_t pos_y);
-void dpy_gl_release_dmabuf(QemuConsole *con,
-                           QemuDmaBuf *dmabuf);
-void dpy_gl_update(QemuConsole *con,
-                   uint32_t x, uint32_t y, uint32_t w, uint32_t h);
-
-QEMUGLContext dpy_gl_ctx_create(QemuConsole *con,
-                                QEMUGLParams *params);
-void dpy_gl_ctx_destroy(QemuConsole *con, QEMUGLContext ctx);
-int dpy_gl_ctx_make_current(QemuConsole *con, QEMUGLContext ctx);
-
-bool console_has_gl(QemuConsole *con);
+bool qemu_console_ui_info_supported(const QemuConsole *con);
+const QemuUIInfo *qemu_console_get_ui_info(const QemuConsole *con);
+int qemu_console_set_ui_info(QemuConsole *con, QemuUIInfo *info, bool delay);
+
+void qemu_console_update(QemuConsole *con, int x, int y, int w, int h);
+void qemu_console_update_full(QemuConsole *con);
+void qemu_console_set_surface(QemuConsole *con,
+                              DisplaySurface *surface);
+void qemu_console_text_set_cursor(QemuConsole *con, int x, int y);
+void qemu_console_text_update(QemuConsole *con, int x, int y, int w, int h);
+void qemu_console_text_resize(QemuConsole *con, int w, int h);
+void qemu_console_set_mouse(QemuConsole *con, int x, int y, bool on);
+void qemu_console_set_cursor(QemuConsole *con, QEMUCursor *cursor);
+bool qemu_console_check_format(QemuConsole *con,
+                               pixman_format_code_t format);
+
+void qemu_console_gl_scanout_disable(QemuConsole *con);
+void qemu_console_gl_scanout_texture(QemuConsole *con,
+                                     uint32_t backing_id, bool backing_y_0_top,
+                                     uint32_t backing_width, uint32_t backing_height,
+                                     uint32_t x, uint32_t y, uint32_t w, uint32_t h,
+                                     void *d3d_tex2d);
+void qemu_console_gl_scanout_dmabuf(QemuConsole *con,
+                                    QemuDmaBuf *dmabuf);
+void qemu_console_gl_cursor_dmabuf(QemuConsole *con, QemuDmaBuf *dmabuf,
+                                   bool have_hot, uint32_t hot_x, uint32_t hot_y);
+void qemu_console_gl_cursor_position(QemuConsole *con,
+                                     uint32_t pos_x, uint32_t pos_y);
+void qemu_console_gl_release_dmabuf(QemuConsole *con,
+                                    QemuDmaBuf *dmabuf);
+void qemu_console_gl_update(QemuConsole *con,
+                            uint32_t x, uint32_t y, uint32_t w, uint32_t h);
+
+QEMUGLContext qemu_console_gl_ctx_create(QemuConsole *con,
+                                         QEMUGLParams *params);
+void qemu_console_gl_ctx_destroy(QemuConsole *con, QEMUGLContext ctx);
+int qemu_console_gl_ctx_make_current(QemuConsole *con, QEMUGLContext ctx);
+
+bool qemu_console_has_gl(QemuConsole *con);
 
 enum {
     GRAPHIC_FLAGS_NONE     = 0,
@@ -361,19 +361,19 @@ typedef struct GraphicHwOps {
     void (*gl_block)(void *opaque, bool block);
 } GraphicHwOps;
 
-QemuConsole *graphic_console_init(DeviceState *dev, uint32_t head,
-                                  const GraphicHwOps *ops,
-                                  void *opaque);
-void graphic_console_set_hwops(QemuConsole *con,
-                               const GraphicHwOps *hw_ops,
-                               void *opaque);
-void graphic_console_close(QemuConsole *con);
-
-void graphic_hw_update(QemuConsole *con);
-void graphic_hw_update_done(QemuConsole *con);
-void graphic_hw_invalidate(QemuConsole *con);
-void graphic_hw_text_update(QemuConsole *con, uint32_t *chardata);
-void graphic_hw_gl_block(QemuConsole *con, bool block);
+QemuConsole *qemu_graphic_console_create(DeviceState *dev, uint32_t head,
+                                         const GraphicHwOps *ops,
+                                         void *opaque);
+void qemu_graphic_console_set_hwops(QemuConsole *con,
+                                    const GraphicHwOps *hw_ops,
+                                    void *opaque);
+void qemu_graphic_console_close(QemuConsole *con);
+
+void qemu_console_hw_update(QemuConsole *con);
+void qemu_console_hw_update_done(QemuConsole *con);
+void qemu_console_hw_invalidate(QemuConsole *con);
+void qemu_console_hw_text_update(QemuConsole *con, uint32_t *chardata);
+void qemu_console_hw_gl_block(QemuConsole *con, bool block);
 
 void qemu_console_early_init(void);
 
diff --git a/hw/arm/musicpal.c b/hw/arm/musicpal.c
index ba88ed756e2..83676eb7fea 100644
--- a/hw/arm/musicpal.c
+++ b/hw/arm/musicpal.c
@@ -170,7 +170,7 @@ static bool lcd_refresh(void *opaque)
         }
     }
 
-    dpy_gfx_update(s->con, 0, 0, 128*3, 64*3);
+    qemu_console_update(s->con, 0, 0, 128*3, 64*3);
     return true;
 }
 
@@ -253,7 +253,7 @@ static const GraphicHwOps musicpal_gfx_ops = {
 static void musicpal_lcd_realize(DeviceState *dev, Error **errp)
 {
     musicpal_lcd_state *s = MUSICPAL_LCD(dev);
-    s->con = graphic_console_init(dev, 0, &musicpal_gfx_ops, s);
+    s->con = qemu_graphic_console_create(dev, 0, &musicpal_gfx_ops, s);
     qemu_console_resize(s->con, 128 * 3, 64 * 3);
 }
 
diff --git a/hw/display/artist.c b/hw/display/artist.c
index a07508378c7..288d466ec64 100644
--- a/hw/display/artist.c
+++ b/hw/display/artist.c
@@ -1324,7 +1324,7 @@ static bool artist_update_display(void *opaque)
     artist_draw_cursor(s);
 
     if (first >= 0) {
-        dpy_gfx_update(s->con, 0, first, s->width, last - first + 1);
+        qemu_console_update(s->con, 0, first, s->width, last - first + 1);
     }
 
     return true;
@@ -1424,7 +1424,7 @@ static void artist_realizefn(DeviceState *dev, Error **errp)
     s->misc_video |= 0x0A000000;
     s->misc_ctrl  |= 0x00800000;
 
-    s->con = graphic_console_init(dev, 0, &artist_ops, s);
+    s->con = qemu_graphic_console_create(dev, 0, &artist_ops, s);
     qemu_console_resize(s->con, s->width, s->height);
 }
 
diff --git a/hw/display/ati.c b/hw/display/ati.c
index 3a7d45a8820..d77589df67a 100644
--- a/hw/display/ati.c
+++ b/hw/display/ati.c
@@ -161,7 +161,7 @@ static void ati_cursor_define(ATIVGAState *s)
     }
     cursor_set_mono(s->cursor, s->regs.cur_color1, s->regs.cur_color0,
                     (uint8_t *)&data[64], 1, (uint8_t *)&data[0]);
-    dpy_cursor_define(s->vga.con, s->cursor);
+    qemu_console_set_cursor(s->vga.con, s->cursor);
 }
 
 /* Alternatively support guest rendered hardware cursor */
@@ -626,9 +626,9 @@ static void ati_mm_write(void *opaque, hwaddr addr,
                 if (s->regs.crtc_gen_cntl & CRTC2_CUR_EN) {
                     ati_cursor_define(s);
                 }
-                dpy_mouse_set(s->vga.con, s->regs.cur_hv_pos >> 16,
-                              s->regs.cur_hv_pos & 0xffff,
-                              (s->regs.crtc_gen_cntl & CRTC2_CUR_EN) != 0);
+                qemu_console_set_mouse(s->vga.con, s->regs.cur_hv_pos >> 16,
+                                       s->regs.cur_hv_pos & 0xffff,
+                                       (s->regs.crtc_gen_cntl & CRTC2_CUR_EN) != 0);
             }
         }
         if ((val & (CRTC2_EXT_DISP_EN | CRTC2_EN)) !=
@@ -780,8 +780,8 @@ static void ati_mm_write(void *opaque, hwaddr addr,
         }
         if (!s->cursor_guest_mode &&
             (s->regs.crtc_gen_cntl & CRTC2_CUR_EN) && !(t & BIT(31))) {
-            dpy_mouse_set(s->vga.con, s->regs.cur_hv_pos >> 16,
-                          s->regs.cur_hv_pos & 0xffff, true);
+            qemu_console_set_mouse(s->vga.con, s->regs.cur_hv_pos >> 16,
+                                   s->regs.cur_hv_pos & 0xffff, true);
         }
         break;
     }
@@ -1094,7 +1094,7 @@ static void ati_vga_realize(PCIDevice *dev, Error **errp)
     }
     vga_init(vga, OBJECT(s), pci_address_space(dev),
              pci_address_space_io(dev), true);
-    vga->con = graphic_console_init(DEVICE(s), 0, s->vga.hw_ops, vga);
+    vga->con = qemu_graphic_console_create(DEVICE(s), 0, s->vga.hw_ops, vga);
     if (s->cursor_guest_mode) {
         vga->cursor_invalidate = ati_cursor_invalidate;
         vga->cursor_draw_line = ati_cursor_draw_line;
@@ -1167,7 +1167,7 @@ static void ati_vga_exit(PCIDevice *dev)
     ATIVGAState *s = ATI_VGA(dev);
 
     timer_del(&s->vblank_timer);
-    graphic_console_close(s->vga.con);
+    qemu_graphic_console_close(s->vga.con);
 }
 
 static const Property ati_vga_properties[] = {
diff --git a/hw/display/bcm2835_fb.c b/hw/display/bcm2835_fb.c
index 83c4c03c7ca..bd58f625fcd 100644
--- a/hw/display/bcm2835_fb.c
+++ b/hw/display/bcm2835_fb.c
@@ -207,8 +207,7 @@ static bool fb_update_display(void *opaque)
                                draw_line_src16, s, &first, &last);
 
     if (first >= 0) {
-        dpy_gfx_update(s->con, 0, first, s->config.xres,
-                       last - first + 1);
+        qemu_console_update(s->con, 0, first, s->config.xres, last - first + 1);
     }
 
     s->invalidate = false;
@@ -427,7 +426,7 @@ static void bcm2835_fb_realize(DeviceState *dev, Error **errp)
 
     bcm2835_fb_reset(dev);
 
-    s->con = graphic_console_init(dev, 0, &vgafb_ops, s);
+    s->con = qemu_graphic_console_create(dev, 0, &vgafb_ops, s);
     qemu_console_resize(s->con, s->config.xres, s->config.yres);
 }
 
diff --git a/hw/display/bochs-display.c b/hw/display/bochs-display.c
index 8ef9b76cf85..64e669429c4 100644
--- a/hw/display/bochs-display.c
+++ b/hw/display/bochs-display.c
@@ -224,12 +224,12 @@ static bool bochs_display_update(void *opaque)
                                              mode.format,
                                              mode.stride,
                                              ptr + mode.offset);
-        dpy_gfx_replace_surface(s->con, ds);
+        qemu_console_set_surface(s->con, ds);
         full_update = true;
     }
 
     if (full_update) {
-        dpy_gfx_update_full(s->con);
+        qemu_console_update_full(s->con);
     } else {
         snap = memory_region_snapshot_and_clear_dirty(&s->vram,
                                                       mode.offset, mode.size,
@@ -243,14 +243,12 @@ static bool bochs_display_update(void *opaque)
                 ys = y;
             }
             if (!dirty && ys >= 0) {
-                dpy_gfx_update(s->con, 0, ys,
-                               mode.width, y - ys);
+                qemu_console_update(s->con, 0, ys, mode.width, y - ys);
                 ys = -1;
             }
         }
         if (ys >= 0) {
-            dpy_gfx_update(s->con, 0, ys,
-                           mode.width, y - ys);
+            qemu_console_update(s->con, 0, ys, mode.width, y - ys);
         }
 
         g_free(snap);
@@ -279,7 +277,7 @@ static void bochs_display_realize(PCIDevice *dev, Error **errp)
     }
     s->vgamem = pow2ceil(s->vgamem);
 
-    s->con = graphic_console_init(DEVICE(dev), 0, &bochs_display_gfx_ops, s);
+    s->con = qemu_graphic_console_create(DEVICE(dev), 0, &bochs_display_gfx_ops, s);
 
     memory_region_init_ram(&s->vram, obj, "bochs-display-vram", s->vgamem,
                            &error_fatal);
@@ -344,7 +342,7 @@ static void bochs_display_exit(PCIDevice *dev)
 {
     BochsDisplayState *s = BOCHS_DISPLAY(dev);
 
-    graphic_console_close(s->con);
+    qemu_graphic_console_close(s->con);
 }
 
 static const Property bochs_display_properties[] = {
diff --git a/hw/display/cg3.c b/hw/display/cg3.c
index 963bb3427a6..f9dda1549dd 100644
--- a/hw/display/cg3.c
+++ b/hw/display/cg3.c
@@ -137,7 +137,7 @@ static bool cg3_update_display(void *opaque)
             }
         } else {
             if (y_start >= 0) {
-                dpy_gfx_update(s->con, 0, y_start, width, y - y_start);
+                qemu_console_update(s->con, 0, y_start, width, y - y_start);
                 y_start = -1;
             }
             pix += width;
@@ -146,7 +146,7 @@ static bool cg3_update_display(void *opaque)
     }
     s->full_update = 0;
     if (y_start >= 0) {
-        dpy_gfx_update(s->con, 0, y_start, width, y - y_start);
+        qemu_console_update(s->con, 0, y_start, width, y - y_start);
     }
     /* vsync interrupt? */
     if (s->regs[0] & CG3_CR_ENABLE_INTS) {
@@ -311,7 +311,7 @@ static void cg3_realizefn(DeviceState *dev, Error **errp)
 
     sysbus_init_irq(sbd, &s->irq);
 
-    s->con = graphic_console_init(dev, 0, &cg3_ops, s);
+    s->con = qemu_graphic_console_create(dev, 0, &cg3_ops, s);
     qemu_console_resize(s->con, s->width, s->height);
 }
 
diff --git a/hw/display/cirrus_vga.c b/hw/display/cirrus_vga.c
index 48be3c8a932..0a8c74e1374 100644
--- a/hw/display/cirrus_vga.c
+++ b/hw/display/cirrus_vga.c
@@ -779,9 +779,9 @@ static int cirrus_do_copy(CirrusVGAState *s, int dst, int src, int w, int h)
                       s->cirrus_blt_width, s->cirrus_blt_height);
 
     if (notify) {
-        dpy_gfx_update(s->vga.con, dx, dy,
-                       s->cirrus_blt_width / depth,
-                       s->cirrus_blt_height);
+        qemu_console_update(s->vga.con, dx, dy,
+                            s->cirrus_blt_width / depth,
+                            s->cirrus_blt_height);
     }
 
     /* we don't have to notify the display that this portion has
@@ -2964,7 +2964,7 @@ static void pci_cirrus_vga_realize(PCIDevice *dev, Error **errp)
     }
     cirrus_init_common(s, OBJECT(dev), device_id, 1, pci_address_space(dev),
                        pci_address_space_io(dev));
-    s->vga.con = graphic_console_init(DEVICE(dev), 0, s->vga.hw_ops, &s->vga);
+    s->vga.con = qemu_graphic_console_create(DEVICE(dev), 0, s->vga.hw_ops, &s->vga);
 
     /* setup PCI */
     memory_region_init(&s->pci_bar, OBJECT(dev), "cirrus-pci-bar0", 0x2000000);
diff --git a/hw/display/cirrus_vga_isa.c b/hw/display/cirrus_vga_isa.c
index 76034a88605..b8052d1d8ed 100644
--- a/hw/display/cirrus_vga_isa.c
+++ b/hw/display/cirrus_vga_isa.c
@@ -62,7 +62,7 @@ static void isa_cirrus_vga_realizefn(DeviceState *dev, Error **errp)
     cirrus_init_common(&d->cirrus_vga, OBJECT(dev), CIRRUS_ID_CLGD5430, 0,
                        isa_address_space(isadev),
                        isa_address_space_io(isadev));
-    s->con = graphic_console_init(dev, 0, s->hw_ops, s);
+    s->con = qemu_graphic_console_create(dev, 0, s->hw_ops, s);
     rom_add_vga(VGABIOS_CIRRUS_FILENAME);
     /* XXX ISA-LFB support */
     /* FIXME not qdev yet */
diff --git a/hw/display/dm163.c b/hw/display/dm163.c
index 9ea62cb4f76..afade0b98c3 100644
--- a/hw/display/dm163.c
+++ b/hw/display/dm163.c
@@ -277,8 +277,8 @@ static uint32_t *update_display_of_row(DM163State *s, uint32_t *dest,
         }
     }
 
-    dpy_gfx_update(s->console, 0, LED_SQUARE_SIZE * row,
-                    RGB_MATRIX_NUM_COLS * LED_SQUARE_SIZE, LED_SQUARE_SIZE);
+    qemu_console_update(s->console, 0, LED_SQUARE_SIZE * row,
+                        RGB_MATRIX_NUM_COLS * LED_SQUARE_SIZE, LED_SQUARE_SIZE);
     s->redraw &= ~(1 << row);
     trace_dm163_redraw(s->redraw);
 
@@ -322,7 +322,7 @@ static void dm163_realize(DeviceState *dev, Error **errp)
     qdev_init_gpio_in(dev, dm163_en_b_gpio_handler, 1);
     qdev_init_gpio_out_named(dev, &s->sout, "sout", 1);
 
-    s->console = graphic_console_init(dev, 0, &dm163_ops, s);
+    s->console = qemu_graphic_console_create(dev, 0, &dm163_ops, s);
     qemu_console_resize(s->console, RGB_MATRIX_NUM_COLS * LED_SQUARE_SIZE,
                         RGB_MATRIX_NUM_ROWS * LED_SQUARE_SIZE);
 }
diff --git a/hw/display/exynos4210_fimd.c b/hw/display/exynos4210_fimd.c
index a91f04aaf79..5133623ee2e 100644
--- a/hw/display/exynos4210_fimd.c
+++ b/hw/display/exynos4210_fimd.c
@@ -1340,7 +1340,7 @@ static bool exynos4210_fimd_update(void *opaque)
             fimd_copy_line_toqemu(global_width, s->ifb + global_width * line *
                     RGBA_SIZE, d + global_width * line * bpp);
         }
-        dpy_gfx_update_full(s->console);
+        qemu_console_update_full(s->console);
     }
     s->invalidate = false;
     s->vidintcon[1] |= FIMD_VIDINT_INTFRMPEND;
@@ -1964,7 +1964,7 @@ static void exynos4210_fimd_realize(DeviceState *dev, Error **errp)
         return;
     }
 
-    s->console = graphic_console_init(dev, 0, &exynos4210_fimd_ops, s);
+    s->console = qemu_graphic_console_create(dev, 0, &exynos4210_fimd_ops, s);
 }
 
 static void exynos4210_fimd_class_init(ObjectClass *klass, const void *data)
diff --git a/hw/display/g364fb.c b/hw/display/g364fb.c
index bd15f6f0acc..af54f1f9005 100644
--- a/hw/display/g364fb.c
+++ b/hw/display/g364fb.c
@@ -191,8 +191,8 @@ static void g364fb_draw_graphic8(G364State *s)
         } else {
             int dy;
             if (xmax || ymax) {
-                dpy_gfx_update(s->con, xmin, ymin,
-                               xmax - xmin + 1, ymax - ymin + 1);
+                qemu_console_update(s->con, xmin, ymin,
+                                   xmax - xmin + 1, ymax - ymin + 1);
                 xmin = s->width;
                 xmax = 0;
                 ymin = s->height;
@@ -211,7 +211,7 @@ static void g364fb_draw_graphic8(G364State *s)
 
 done:
     if (xmax || ymax) {
-        dpy_gfx_update(s->con, xmin, ymin, xmax - xmin + 1, ymax - ymin + 1);
+        qemu_console_update(s->con, xmin, ymin, xmax - xmin + 1, ymax - ymin + 1);
     }
     g_free(snap);
 }
@@ -234,7 +234,7 @@ static void g364fb_draw_blank(G364State *s)
         d += surface_stride(surface);
     }
 
-    dpy_gfx_update_full(s->con);
+    qemu_console_update_full(s->con);
     s->blanked = 1;
 }
 
@@ -478,7 +478,7 @@ static const GraphicHwOps g364fb_ops = {
 
 static void g364fb_init(DeviceState *dev, G364State *s)
 {
-    s->con = graphic_console_init(dev, 0, &g364fb_ops, s);
+    s->con = qemu_graphic_console_create(dev, 0, &g364fb_ops, s);
 
     memory_region_init_io(&s->mem_ctrl, OBJECT(dev), &g364fb_ctrl_ops, s,
                           "ctrl", 0x180000);
diff --git a/hw/display/imx6ul_lcdif.c b/hw/display/imx6ul_lcdif.c
index afcd0805ca4..7b5be2b5a75 100644
--- a/hw/display/imx6ul_lcdif.c
+++ b/hw/display/imx6ul_lcdif.c
@@ -203,7 +203,7 @@ static bool imx6ul_lcdif_update_display(void *opaque)
                                src_width, surface_stride(surface), 0,
                                s->invalidate, fn, s, &first, &last);
     if (first >= 0) {
-        dpy_gfx_update(s->con, 0, first, width, last - first + 1);
+        qemu_console_update(s->con, 0, first, width, last - first + 1);
     }
 
     s->invalidate = false;
@@ -301,7 +301,7 @@ static void imx6ul_lcdif_write(void *opaque, hwaddr offset,
         if (!FIELD_EX32(oldv, CTRL, RUN) &&
             FIELD_EX32(s->regs[idx], CTRL, RUN)) {
             s->invalidate = true;
-            graphic_hw_invalidate(s->con);
+            qemu_console_hw_invalidate(s->con);
             imx6ul_lcdif_maybe_schedule_frame(s);
             break;
         }
@@ -318,17 +318,17 @@ static void imx6ul_lcdif_write(void *opaque, hwaddr offset,
         break;
     case A_V4_TRANSFER_COUNT:
         s->invalidate = true;
-        graphic_hw_invalidate(s->con);
+        qemu_console_hw_invalidate(s->con);
         break;
     case A_V4_CUR_BUF:
         s->invalidate = true;
-        graphic_hw_invalidate(s->con);
+        qemu_console_hw_invalidate(s->con);
         break;
     case A_V4_NEXT_BUF:
         s->regs[IMX6UL_LCDIF_REG_V4_CUR_BUF] = s->regs[idx];
         imx6ul_lcdif_frame_done(s);
         s->invalidate = true;
-        graphic_hw_invalidate(s->con);
+        qemu_console_hw_invalidate(s->con);
         imx6ul_lcdif_maybe_schedule_frame(s);
         return;
     case A_AS_NEXT_BUF:
@@ -411,7 +411,7 @@ static void imx6ul_lcdif_realize(DeviceState *dev, Error **errp)
                           TYPE_IMX6UL_LCDIF, LCDIF_MMIO_SIZE);
     sysbus_init_mmio(SYS_BUS_DEVICE(dev), &s->iomem);
     sysbus_init_irq(SYS_BUS_DEVICE(dev), &s->irq);
-    s->con = graphic_console_init(dev, 0, &imx6ul_lcdif_graphic_ops, s);
+    s->con = qemu_graphic_console_create(dev, 0, &imx6ul_lcdif_graphic_ops, s);
 }
 
 static void imx6ul_lcdif_unrealize(DeviceState *dev)
@@ -423,7 +423,7 @@ static void imx6ul_lcdif_unrealize(DeviceState *dev)
     s->frame_timer = NULL;
 
     if (s->con) {
-        graphic_console_close(s->con);
+        qemu_graphic_console_close(s->con);
         s->con = NULL;
     }
 }
diff --git a/hw/display/jazz_led.c b/hw/display/jazz_led.c
index ee9758a94b5..84fe1058406 100644
--- a/hw/display/jazz_led.c
+++ b/hw/display/jazz_led.c
@@ -217,7 +217,7 @@ static bool jazz_led_update_display(void *opaque)
     }
 
     s->state = REDRAW_NONE;
-    dpy_gfx_update_full(s->con);
+    qemu_console_update_full(s->con);
 
     return true;
 }
@@ -233,7 +233,7 @@ static void jazz_led_text_update(void *opaque, uint32_t *chardata)
     LedState *s = opaque;
     char buf[3];
 
-    dpy_text_cursor(s->con, -1, -1);
+    qemu_console_text_set_cursor(s->con, -1, -1);
     qemu_console_resize(s->con, 2, 1);
 
     /* TODO: draw the segments */
@@ -243,7 +243,7 @@ static void jazz_led_text_update(void *opaque, uint32_t *chardata)
     *chardata++ = ATTR2CHTYPE(buf[1], QEMU_COLOR_BLUE,
                               QEMU_COLOR_BLACK, 1);
 
-    dpy_text_update(s->con, 0, 0, 2, 1);
+    qemu_console_text_update(s->con, 0, 0, 2, 1);
 }
 
 static int jazz_led_post_load(void *opaque, int version_id)
@@ -284,7 +284,7 @@ static void jazz_led_realize(DeviceState *dev, Error **errp)
 {
     LedState *s = JAZZ_LED(dev);
 
-    s->con = graphic_console_init(dev, 0, &jazz_led_ops, s);
+    s->con = qemu_graphic_console_create(dev, 0, &jazz_led_ops, s);
 }
 
 static void jazz_led_reset(DeviceState *d)
diff --git a/hw/display/macfb.c b/hw/display/macfb.c
index 848c3c282bd..f40a7ed9f52 100644
--- a/hw/display/macfb.c
+++ b/hw/display/macfb.c
@@ -320,14 +320,14 @@ static void macfb_draw_graphic(MacfbState *s)
             }
         } else {
             if (ymin >= 0) {
-                dpy_gfx_update(s->con, 0, ymin, s->width, y - ymin);
+                qemu_console_update(s->con, 0, ymin, s->width, y - ymin);
                 ymin = -1;
             }
         }
     }
 
     if (ymin >= 0) {
-        dpy_gfx_update(s->con, 0, ymin, s->width, y - ymin);
+        qemu_console_update(s->con, 0, ymin, s->width, y - ymin);
     }
 
     g_free(snap);
@@ -671,7 +671,7 @@ static bool macfb_common_realize(DeviceState *dev, MacfbState *s, Error **errp)
     s->regs[DAFB_MODE_CTRL1 >> 2] = s->mode->mode_ctrl1;
     s->regs[DAFB_MODE_CTRL2 >> 2] = s->mode->mode_ctrl2;
 
-    s->con = graphic_console_init(dev, 0, &macfb_ops, s);
+    s->con = qemu_graphic_console_create(dev, 0, &macfb_ops, s);
     surface = qemu_console_surface(s->con);
 
     if (surface_bits_per_pixel(surface) != 32) {
diff --git a/hw/display/next-fb.c b/hw/display/next-fb.c
index e758b223ef7..fa2e0d0da80 100644
--- a/hw/display/next-fb.c
+++ b/hw/display/next-fb.c
@@ -89,7 +89,7 @@ static bool nextfb_update(void *opaque)
                                src_width, dest_width, 0, 1, nextfb_draw_line,
                                s, &first, &last);
 
-    dpy_gfx_update(s->con, 0, 0, s->cols, s->rows);
+    qemu_console_update(s->con, 0, 0, s->cols, s->rows);
 
     return true;
 }
@@ -117,7 +117,7 @@ static void nextfb_realize(DeviceState *dev, Error **errp)
     s->cols = 1120;
     s->rows = 832;
 
-    s->con = graphic_console_init(dev, 0, &nextfb_ops, s);
+    s->con = qemu_graphic_console_create(dev, 0, &nextfb_ops, s);
     qemu_console_resize(s->con, s->cols, s->rows);
 }
 
diff --git a/hw/display/omap_lcdc.c b/hw/display/omap_lcdc.c
index 1e8385ebffb..2a8d5ffdd57 100644
--- a/hw/display/omap_lcdc.c
+++ b/hw/display/omap_lcdc.c
@@ -320,7 +320,7 @@ static bool omap_update_display(void *opaque)
                                &first, &last);
 
     if (first >= 0) {
-        dpy_gfx_update(omap_lcd->con, 0, first, width, last - first + 1);
+        qemu_console_update(omap_lcd->con, 0, first, width, last - first + 1);
     }
     omap_lcd->invalidate = 0;
 
@@ -504,7 +504,7 @@ struct omap_lcd_panel_s *omap_lcdc_init(MemoryRegion *sysmem,
     memory_region_init_io(&s->iomem, NULL, &omap_lcdc_ops, s, "omap.lcdc", 0x100);
     memory_region_add_subregion(sysmem, base, &s->iomem);
 
-    s->con = graphic_console_init(NULL, 0, &omap_ops, s);
+    s->con = qemu_graphic_console_create(NULL, 0, &omap_ops, s);
 
     return s;
 }
diff --git a/hw/display/pl110.c b/hw/display/pl110.c
index e134ac28eb6..4a93cf4cda9 100644
--- a/hw/display/pl110.c
+++ b/hw/display/pl110.c
@@ -303,7 +303,7 @@ static bool pl110_update_display(void *opaque)
                                &first, &last);
 
     if (first >= 0) {
-        dpy_gfx_update(s->con, 0, first, s->cols, last - first + 1);
+        qemu_console_update(s->con, 0, first, s->cols, last - first + 1);
     }
     s->invalidate = 0;
     return true;
@@ -557,7 +557,7 @@ static void pl110_realize(DeviceState *dev, Error **errp)
     s->vblank_timer = timer_new_ns(QEMU_CLOCK_VIRTUAL,
                                    pl110_vblank_interrupt, s);
     qdev_init_gpio_in(dev, pl110_mux_ctrl_set, 1);
-    s->con = graphic_console_init(dev, 0, &pl110_gfx_ops, s);
+    s->con = qemu_graphic_console_create(dev, 0, &pl110_gfx_ops, s);
 }
 
 static void pl110_init(Object *obj)
diff --git a/hw/display/qxl-render.c b/hw/display/qxl-render.c
index 5b4f8842011..7b692d5a854 100644
--- a/hw/display/qxl-render.c
+++ b/hw/display/qxl-render.c
@@ -135,7 +135,7 @@ static void qxl_render_update_area_unlocked(PCIQXLDevice *qxl)
                 (width,
                  height);
         }
-        dpy_gfx_replace_surface(vga->con, surface);
+        qemu_console_set_surface(vga->con, surface);
     }
 
     if (!qxl->guest_primary.data) {
@@ -154,16 +154,16 @@ static void qxl_render_update_area_unlocked(PCIQXLDevice *qxl)
             continue;
         }
         qxl_blit(qxl, qxl->dirty+i);
-        dpy_gfx_update(vga->con,
-                       qxl->dirty[i].left, qxl->dirty[i].top,
-                       qxl->dirty[i].right - qxl->dirty[i].left,
-                       qxl->dirty[i].bottom - qxl->dirty[i].top);
+        qemu_console_update(vga->con,
+                            qxl->dirty[i].left, qxl->dirty[i].top,
+                            qxl->dirty[i].right - qxl->dirty[i].left,
+                            qxl->dirty[i].bottom - qxl->dirty[i].top);
     }
     qxl->num_dirty_rects = 0;
 
 end:
     if (qxl->render_update_cookie_num == 0) {
-        graphic_hw_update_done(qxl->ssd.dcl.con);
+        qemu_console_hw_update_done(qxl->ssd.dcl.con);
     }
 }
 
diff --git a/hw/display/qxl.c b/hw/display/qxl.c
index 4244ebe51d2..74258afa582 100644
--- a/hw/display/qxl.c
+++ b/hw/display/qxl.c
@@ -1153,13 +1153,13 @@ static void qxl_enter_vga_mode(PCIQXLDevice *d)
     }
     trace_qxl_enter_vga_mode(d->id);
     spice_qxl_driver_unload(&d->ssd.qxl);
-    graphic_console_set_hwops(d->ssd.dcl.con, d->vga.hw_ops, &d->vga);
-    update_displaychangelistener(&d->ssd.dcl, GUI_REFRESH_INTERVAL_DEFAULT);
+    qemu_graphic_console_set_hwops(d->ssd.dcl.con, d->vga.hw_ops, &d->vga);
+    qemu_console_listener_set_refresh(&d->ssd.dcl, GUI_REFRESH_INTERVAL_DEFAULT);
     qemu_spice_create_host_primary(&d->ssd);
     d->mode = QXL_MODE_VGA;
     qemu_spice_display_switch(&d->ssd, d->ssd.ds);
     vga_dirty_log_start(&d->vga);
-    graphic_hw_update(d->vga.con);
+    qemu_console_hw_update(d->vga.con);
 }
 
 static void qxl_exit_vga_mode(PCIQXLDevice *d)
@@ -1168,8 +1168,8 @@ static void qxl_exit_vga_mode(PCIQXLDevice *d)
         return;
     }
     trace_qxl_exit_vga_mode(d->id);
-    graphic_console_set_hwops(d->ssd.dcl.con, &qxl_ops, d);
-    update_displaychangelistener(&d->ssd.dcl, GUI_REFRESH_INTERVAL_IDLE);
+    qemu_graphic_console_set_hwops(d->ssd.dcl.con, &qxl_ops, d);
+    qemu_console_listener_set_refresh(&d->ssd.dcl, GUI_REFRESH_INTERVAL_IDLE);
     vga_dirty_log_stop(&d->vga);
     qxl_destroy_primary(d, QXL_SYNC);
 }
@@ -2237,7 +2237,7 @@ static void qxl_realize_primary(PCIDevice *dev, Error **errp)
     portio_list_add(&qxl->vga_port_list, pci_address_space_io(dev), 0x3b0);
     qxl->have_vga = true;
 
-    vga->con = graphic_console_init(DEVICE(dev), 0, &qxl_ops, qxl);
+    vga->con = qemu_graphic_console_create(DEVICE(dev), 0, &qxl_ops, qxl);
     qxl->id = qemu_console_get_index(vga->con); /* == channel_id */
     if (qxl->id != 0) {
         error_setg(errp, "primary qxl-vga device must be console 0 "
@@ -2262,7 +2262,7 @@ static void qxl_realize_secondary(PCIDevice *dev, Error **errp)
     memory_region_init_ram(&qxl->vga.vram, OBJECT(dev), "qxl.vgavram",
                            qxl->vga.vram_size, &error_fatal);
     qxl->vga.vram_ptr = memory_region_get_ram_ptr(&qxl->vga.vram);
-    qxl->vga.con = graphic_console_init(DEVICE(dev), 0, &qxl_ops, qxl);
+    qxl->vga.con = qemu_graphic_console_create(DEVICE(dev), 0, &qxl_ops, qxl);
     qxl->ssd.dcl.con = qxl->vga.con;
     qxl->id = qemu_console_get_index(qxl->vga.con); /* == channel_id */
 
diff --git a/hw/display/ramfb-standalone.c b/hw/display/ramfb-standalone.c
index 27f0ba19f90..8e8ba37514a 100644
--- a/hw/display/ramfb-standalone.c
+++ b/hw/display/ramfb-standalone.c
@@ -41,7 +41,7 @@ static void ramfb_realizefn(DeviceState *dev, Error **errp)
 {
     RAMFBStandaloneState *ramfb = RAMFB(dev);
 
-    ramfb->con = graphic_console_init(dev, 0, &wrapper_ops, dev);
+    ramfb->con = qemu_graphic_console_create(dev, 0, &wrapper_ops, dev);
     ramfb->state = ramfb_setup(ramfb->use_legacy_x86_rom, errp);
 }
 
diff --git a/hw/display/ramfb.c b/hw/display/ramfb.c
index 50c25706a52..7a88f934e11 100644
--- a/hw/display/ramfb.c
+++ b/hw/display/ramfb.c
@@ -111,12 +111,12 @@ void ramfb_display_update(QemuConsole *con, RAMFBState *s)
     }
 
     if (s->ds) {
-        dpy_gfx_replace_surface(con, s->ds);
+        qemu_console_set_surface(con, s->ds);
         s->ds = NULL;
     }
 
     /* simple full screen update */
-    dpy_gfx_update_full(con);
+    qemu_console_update_full(con);
 }
 
 static int ramfb_post_load(void *opaque, int version_id)
diff --git a/hw/display/sm501.c b/hw/display/sm501.c
index a3993ceba29..af870048372 100644
--- a/hw/display/sm501.c
+++ b/hw/display/sm501.c
@@ -1822,7 +1822,7 @@ static bool sm501_update_display(void *opaque)
         } else {
             if (y_start >= 0) {
                 /* flush to display */
-                dpy_gfx_update(s->con, 0, y_start, width, y - y_start);
+                qemu_console_update(s->con, 0, y_start, width, y - y_start);
                 y_start = -1;
             }
         }
@@ -1831,7 +1831,7 @@ static bool sm501_update_display(void *opaque)
 
     /* complete flush to display */
     if (y_start >= 0) {
-        dpy_gfx_update(s->con, 0, y_start, width, y - y_start);
+        qemu_console_update(s->con, 0, y_start, width, y - y_start);
     }
 
     return true;
@@ -1936,7 +1936,7 @@ static void sm501_init(SM501State *s, DeviceState *dev,
                                 &s->twoD_engine_region);
 
     /* create qemu graphic console */
-    s->con = graphic_console_init(dev, 0, &sm501_ops, s);
+    s->con = qemu_graphic_console_create(dev, 0, &sm501_ops, s);
 }
 
 static const VMStateDescription vmstate_sm501_state = {
diff --git a/hw/display/ssd0303.c b/hw/display/ssd0303.c
index 229856cc427..4e3dede33f1 100644
--- a/hw/display/ssd0303.c
+++ b/hw/display/ssd0303.c
@@ -268,7 +268,7 @@ static bool ssd0303_update_display(void *opaque)
         }
     }
     s->redraw = 0;
-    dpy_gfx_update(s->con, 0, 0, 96 * MAGNIFY, 16 * MAGNIFY);
+    qemu_console_update(s->con, 0, 0, 96 * MAGNIFY, 16 * MAGNIFY);
 
     return true;
 }
@@ -309,7 +309,7 @@ static void ssd0303_realize(DeviceState *dev, Error **errp)
 {
     ssd0303_state *s = SSD0303(dev);
 
-    s->con = graphic_console_init(dev, 0, &ssd0303_ops, s);
+    s->con = qemu_graphic_console_create(dev, 0, &ssd0303_ops, s);
     qemu_console_resize(s->con, 96 * MAGNIFY, 16 * MAGNIFY);
 }
 
diff --git a/hw/display/ssd0323.c b/hw/display/ssd0323.c
index 67db16086c8..9309d4d10c4 100644
--- a/hw/display/ssd0323.c
+++ b/hw/display/ssd0323.c
@@ -270,7 +270,8 @@ static bool ssd0323_update_display(void *opaque)
         }
     }
     s->redraw = 0;
-    dpy_gfx_update(s->con, 0, 0, 128 * MAGNIFY, 64 * MAGNIFY);
+    qemu_console_update(s->con, 0, 0, 128 * MAGNIFY, 64 * MAGNIFY);
+
     return true;
 }
 
@@ -356,7 +357,7 @@ static void ssd0323_realize(SSIPeripheral *d, Error **errp)
 
     s->col_end = 63;
     s->row_end = 79;
-    s->con = graphic_console_init(dev, 0, &ssd0323_ops, s);
+    s->con = qemu_graphic_console_create(dev, 0, &ssd0323_ops, s);
     qemu_console_resize(s->con, 128 * MAGNIFY, 64 * MAGNIFY);
 
     qdev_init_gpio_in(dev, ssd0323_cd, 1);
diff --git a/hw/display/tcx.c b/hw/display/tcx.c
index cedbf5c7acd..2c33a9c4a32 100644
--- a/hw/display/tcx.c
+++ b/hw/display/tcx.c
@@ -243,8 +243,7 @@ static bool tcx_update_display(void *opaque)
         } else {
             if (y_start >= 0) {
                 /* flush to display */
-                dpy_gfx_update(ts->con, 0, y_start,
-                               ts->width, y - y_start);
+                qemu_console_update(ts->con, 0, y_start, ts->width, y - y_start);
                 y_start = -1;
             }
         }
@@ -253,8 +252,7 @@ static bool tcx_update_display(void *opaque)
     }
     if (y_start >= 0) {
         /* flush to display */
-        dpy_gfx_update(ts->con, 0, y_start,
-                       ts->width, y - y_start);
+        qemu_console_update(ts->con, 0, y_start, ts->width, y - y_start);
     }
     g_free(snap);
     return true;
@@ -297,8 +295,7 @@ static bool tcx24_update_display(void *opaque)
         } else {
             if (y_start >= 0) {
                 /* flush to display */
-                dpy_gfx_update(ts->con, 0, y_start,
-                               ts->width, y - y_start);
+                qemu_console_update(ts->con, 0, y_start, ts->width, y - y_start);
                 y_start = -1;
             }
         }
@@ -309,8 +306,7 @@ static bool tcx24_update_display(void *opaque)
     }
     if (y_start >= 0) {
         /* flush to display */
-        dpy_gfx_update(ts->con, 0, y_start,
-                       ts->width, y - y_start);
+        qemu_console_update(ts->con, 0, y_start, ts->width, y - y_start);
     }
     g_free(snap);
     return true;
@@ -864,9 +860,9 @@ static void tcx_realize(DeviceState *dev, Error **errp)
     sysbus_init_irq(sbd, &s->irq);
 
     if (s->depth == 8) {
-        s->con = graphic_console_init(dev, 0, &tcx_ops, s);
+        s->con = qemu_graphic_console_create(dev, 0, &tcx_ops, s);
     } else {
-        s->con = graphic_console_init(dev, 0, &tcx24_ops, s);
+        s->con = qemu_graphic_console_create(dev, 0, &tcx24_ops, s);
     }
     s->thcmisc = 0;
 
diff --git a/hw/display/vga-isa.c b/hw/display/vga-isa.c
index 5f55c884a1b..2cccb0ef12e 100644
--- a/hw/display/vga-isa.c
+++ b/hw/display/vga-isa.c
@@ -79,7 +79,7 @@ static void vga_isa_realizefn(DeviceState *dev, Error **errp)
                                         0x000a0000,
                                         vga_io_memory, 1);
     memory_region_set_coalescing(vga_io_memory);
-    s->con = graphic_console_init(dev, 0, s->hw_ops, s);
+    s->con = qemu_graphic_console_create(dev, 0, s->hw_ops, s);
 
     memory_region_add_subregion(isa_address_space(isadev),
                                 VBE_DISPI_LFB_PHYSICAL_ADDRESS,
diff --git a/hw/display/vga-mmio.c b/hw/display/vga-mmio.c
index 1a9608d865f..3cd64951c09 100644
--- a/hw/display/vga-mmio.c
+++ b/hw/display/vga-mmio.c
@@ -108,7 +108,7 @@ static void vga_mmio_realizefn(DeviceState *dev, Error **errp)
     }
 
     sysbus_init_mmio(sbd, &s->vga.vram);
-    s->vga.con = graphic_console_init(dev, 0, s->vga.hw_ops, &s->vga);
+    s->vga.con = qemu_graphic_console_create(dev, 0, s->vga.hw_ops, &s->vga);
 }
 
 static const Property vga_mmio_properties[] = {
diff --git a/hw/display/vga-pci.c b/hw/display/vga-pci.c
index 4e68dd57a17..d089847bdae 100644
--- a/hw/display/vga-pci.c
+++ b/hw/display/vga-pci.c
@@ -247,7 +247,7 @@ static void pci_std_vga_realize(PCIDevice *dev, Error **errp)
     vga_init(s, OBJECT(dev), pci_address_space(dev), pci_address_space_io(dev),
              true);
 
-    s->con = graphic_console_init(DEVICE(dev), 0, s->hw_ops, s);
+    s->con = qemu_graphic_console_create(DEVICE(dev), 0, s->hw_ops, s);
 
     /* XXX: VGA_RAM_SIZE must be a power of two */
     pci_register_bar(&d->dev, 0, PCI_BASE_ADDRESS_MEM_PREFETCH, &s->vram);
@@ -282,7 +282,7 @@ static void pci_secondary_vga_realize(PCIDevice *dev, Error **errp)
     if (!vga_common_init(s, OBJECT(dev), errp)) {
         return;
     }
-    s->con = graphic_console_init(DEVICE(dev), 0, s->hw_ops, s);
+    s->con = qemu_graphic_console_create(DEVICE(dev), 0, s->hw_ops, s);
 
     /* mmio bar */
     memory_region_init_io(&d->mmio, OBJECT(dev), &unassigned_io_ops, NULL,
@@ -306,7 +306,7 @@ static void pci_secondary_vga_exit(PCIDevice *dev)
     PCIVGAState *d = PCI_VGA(dev);
     VGACommonState *s = &d->vga;
 
-    graphic_console_close(s->con);
+    qemu_graphic_console_close(s->con);
     memory_region_del_subregion(&d->mmio, &d->mrs[0]);
     memory_region_del_subregion(&d->mmio, &d->mrs[1]);
     if (d->flags & (1 << PCI_VGA_FLAG_ENABLE_QEXT)) {
diff --git a/hw/display/vga.c b/hw/display/vga.c
index 2f266f47a39..0ac4bf37310 100644
--- a/hw/display/vga.c
+++ b/hw/display/vga.c
@@ -1246,7 +1246,7 @@ static void vga_draw_text(VGACommonState *s, int full_update)
         s->last_scr_height = height * cheight;
         qemu_console_resize(s->con, s->last_scr_width, s->last_scr_height);
         surface = qemu_console_surface(s->con);
-        dpy_text_resize(s->con, width, height);
+        qemu_console_text_resize(s->con, width, height);
         s->last_depth = 0;
         s->last_width = width;
         s->last_height = height;
@@ -1365,8 +1365,8 @@ static void vga_draw_text(VGACommonState *s, int full_update)
             ch_attr_ptr++;
         }
         if (cx_max != -1) {
-            dpy_gfx_update(s->con, cx_min * cw, cy * cheight,
-                           (cx_max - cx_min + 1) * cw, cheight);
+            qemu_console_update(s->con, cx_min * cw, cy * cheight,
+                                (cx_max - cx_min + 1) * cw, cheight);
         }
         dest += linesize * cheight;
         line1 = line + cheight;
@@ -1610,7 +1610,7 @@ static void vga_draw_graphic(VGACommonState *s, int full_update)
      */
     format = qemu_default_pixman_format(depth, !byteswap);
     if (format) {
-        allocate_surface = !dpy_gfx_check_format(s->con, format)
+        allocate_surface = !qemu_console_check_format(s->con, format)
             || s->force_shadow || force_shadow;
     } else {
         allocate_surface = true;
@@ -1647,7 +1647,7 @@ static void vga_draw_graphic(VGACommonState *s, int full_update)
             surface = qemu_create_displaysurface_from(disp_width,
                     height, format, s->params.line_offset,
                     s->vram_ptr + (s->params.start_addr * 4));
-            dpy_gfx_replace_surface(s->con, surface);
+            qemu_console_set_surface(s->con, surface);
         } else {
             qemu_console_resize(s->con, disp_width, height);
             surface = qemu_console_surface(s->con);
@@ -1720,8 +1720,7 @@ static void vga_draw_graphic(VGACommonState *s, int full_update)
         } else {
             if (y_start >= 0) {
                 /* flush to display */
-                dpy_gfx_update(s->con, 0, y_start,
-                               disp_width, y - y_start);
+                qemu_console_update(s->con, 0, y_start, disp_width, y - y_start);
                 y_start = -1;
             }
         }
@@ -1745,8 +1744,7 @@ static void vga_draw_graphic(VGACommonState *s, int full_update)
     }
     if (y_start >= 0) {
         /* flush to display */
-        dpy_gfx_update(s->con, 0, y_start,
-                       disp_width, y - y_start);
+        qemu_console_update(s->con, 0, y_start, disp_width, y - y_start);
     }
     g_free(snap);
     memset(s->invalidated_y_table, 0, sizeof(s->invalidated_y_table));
@@ -1767,7 +1765,7 @@ static void vga_draw_blank(VGACommonState *s, int full_update)
         /* unshare buffer, otherwise the blanking corrupts vga vram */
         surface = qemu_create_displaysurface(s->last_scr_width,
                                              s->last_scr_height);
-        dpy_gfx_replace_surface(s->con, surface);
+        qemu_console_set_surface(s->con, surface);
     }
 
     w = s->last_scr_width * surface_bytes_per_pixel(surface);
@@ -1776,7 +1774,7 @@ static void vga_draw_blank(VGACommonState *s, int full_update)
         memset(d, 0, w);
         d += surface_stride(surface);
     }
-    dpy_gfx_update_full(s->con);
+    qemu_console_update_full(s->con);
 }
 
 #define GMODE_TEXT     0
@@ -1967,7 +1965,7 @@ static void vga_update_text(void *opaque, uint32_t *chardata)
             s->last_scr_width = width * cw;
             s->last_scr_height = height * cheight;
             qemu_console_resize(s->con, s->last_scr_width, s->last_scr_height);
-            dpy_text_resize(s->con, width, height);
+            qemu_console_text_resize(s->con, width, height);
             s->last_depth = 0;
             s->last_width = width;
             s->last_height = height;
@@ -1992,11 +1990,11 @@ static void vga_update_text(void *opaque, uint32_t *chardata)
             s->cr[VGA_CRTC_CURSOR_END] != s->cursor_end || full_update) {
             cursor_visible = !(s->cr[VGA_CRTC_CURSOR_START] & 0x20);
             if (cursor_visible && cursor_offset < size && cursor_offset >= 0)
-                dpy_text_cursor(s->con,
-                                TEXTMODE_X(cursor_offset),
-                                TEXTMODE_Y(cursor_offset));
+                qemu_console_text_set_cursor(s->con,
+                                             TEXTMODE_X(cursor_offset),
+                                             TEXTMODE_Y(cursor_offset));
             else
-                dpy_text_cursor(s->con, -1, -1);
+                qemu_console_text_set_cursor(s->con, -1, -1);
             s->cursor_offset = cursor_offset;
             s->cursor_start = s->cr[VGA_CRTC_CURSOR_START];
             s->cursor_end = s->cr[VGA_CRTC_CURSOR_END];
@@ -2009,7 +2007,7 @@ static void vga_update_text(void *opaque, uint32_t *chardata)
             for (i = 0; i < size; src ++, dst ++, i ++)
                 *dst = VMEM2CHTYPE(le32_to_cpu(*src));
 
-            dpy_text_update(s->con, 0, 0, width, height);
+            qemu_console_text_update(s->con, 0, 0, width, height);
         } else {
             c_max = 0;
 
@@ -2032,7 +2030,7 @@ static void vga_update_text(void *opaque, uint32_t *chardata)
 
             if (c_min <= c_max) {
                 i = TEXTMODE_Y(c_min);
-                dpy_text_update(s->con, 0, i, width, TEXTMODE_Y(c_max) - i + 1);
+                qemu_console_text_update(s->con, 0, i, width, TEXTMODE_Y(c_max) - i + 1);
             }
         }
 
@@ -2057,8 +2055,8 @@ static void vga_update_text(void *opaque, uint32_t *chardata)
     /* Display a message */
     s->last_width = 60;
     s->last_height = height = 3;
-    dpy_text_cursor(s->con, -1, -1);
-    dpy_text_resize(s->con, s->last_width, height);
+    qemu_console_text_set_cursor(s->con, -1, -1);
+    qemu_console_text_resize(s->con, s->last_width, height);
 
     for (dst = chardata, i = 0; i < s->last_width * height; i ++)
         *dst++ = ' ';
@@ -2070,7 +2068,7 @@ static void vga_update_text(void *opaque, uint32_t *chardata)
         *dst++ = ATTR2CHTYPE(msg_buffer[i], QEMU_COLOR_BLUE,
                              QEMU_COLOR_BLACK, 1);
 
-    dpy_text_update(s->con, 0, 0, s->last_width, height);
+    qemu_console_text_update(s->con, 0, 0, s->last_width, height);
 }
 
 static uint64_t vga_mem_read(void *opaque, hwaddr addr,
diff --git a/hw/display/vhost-user-gpu.c b/hw/display/vhost-user-gpu.c
index 3f6fb7a8033..6e5e6540a46 100644
--- a/hw/display/vhost-user-gpu.c
+++ b/hw/display/vhost-user-gpu.c
@@ -142,11 +142,11 @@ vhost_user_gpu_handle_cursor(VhostUserGPU *g, VhostUserGpuMsg *msg)
         memcpy(s->current_cursor->data, up->data,
                64 * 64 * sizeof(uint32_t));
 
-        dpy_cursor_define(s->con, s->current_cursor);
+        qemu_console_set_cursor(s->con, s->current_cursor);
     }
 
-    dpy_mouse_set(s->con, pos->x, pos->y,
-                  msg->request != VHOST_USER_GPU_CURSOR_POS_HIDE);
+    qemu_console_set_mouse(s->con, pos->x, pos->y,
+                           msg->request != VHOST_USER_GPU_CURSOR_POS_HIDE);
 }
 
 static void
@@ -238,7 +238,7 @@ vhost_user_gpu_handle_display(VhostUserGPU *g, VhostUserGpuMsg *msg)
         con = s->con;
 
         if (m->width == 0) {
-            dpy_gfx_replace_surface(con, NULL);
+            qemu_console_set_surface(con, NULL);
         } else {
             s->ds = qemu_create_displaysurface(m->width, m->height);
             /* replace surface on next update */
@@ -269,12 +269,12 @@ vhost_user_gpu_handle_display(VhostUserGPU *g, VhostUserGpuMsg *msg)
 
         if (dmabuf) {
             qemu_dmabuf_close(dmabuf);
-            dpy_gl_release_dmabuf(con, dmabuf);
+            qemu_console_gl_release_dmabuf(con, dmabuf);
             g_clear_pointer(&dmabuf, qemu_dmabuf_free);
         }
 
         if (fd == -1) {
-            dpy_gl_scanout_disable(con);
+            qemu_console_gl_scanout_disable(con);
             g->dmabuf[m->scanout_id] = NULL;
             break;
         }
@@ -291,7 +291,7 @@ vhost_user_gpu_handle_display(VhostUserGPU *g, VhostUserGpuMsg *msg)
                                  &fd, 1, false, m->fd_flags &
                                  VIRTIO_GPU_RESOURCE_FLAG_Y_0_TOP);
 
-        dpy_gl_scanout_dmabuf(con, dmabuf);
+        qemu_console_gl_scanout_dmabuf(con, dmabuf);
         g->dmabuf[m->scanout_id] = dmabuf;
         break;
     }
@@ -306,13 +306,13 @@ vhost_user_gpu_handle_display(VhostUserGPU *g, VhostUserGpuMsg *msg)
         }
 
         con = g->parent_obj.scanout[m->scanout_id].con;
-        if (!console_has_gl(con)) {
+        if (!qemu_console_has_gl(con)) {
             error_report("console doesn't support GL!");
             vhost_user_gpu_unblock(g);
             break;
         }
         g->backend_blocked = true;
-        dpy_gl_update(con, m->x, m->y, m->width, m->height);
+        qemu_console_gl_update(con, m->x, m->y, m->width, m->height);
         break;
     }
 #ifdef CONFIG_PIXMAN
@@ -337,9 +337,9 @@ vhost_user_gpu_handle_display(VhostUserGPU *g, VhostUserGpuMsg *msg)
 
         pixman_image_unref(image);
         if (qemu_console_surface(con) != s->ds) {
-            dpy_gfx_replace_surface(con, s->ds);
+            qemu_console_set_surface(con, s->ds);
         } else {
-            dpy_gfx_update(con, m->x, m->y, m->width, m->height);
+            qemu_console_update(con, m->x, m->y, m->width, m->height);
         }
         break;
     }
diff --git a/hw/display/virtio-gpu-base.c b/hw/display/virtio-gpu-base.c
index bdc24492850..a68b1848295 100644
--- a/hw/display/virtio-gpu-base.c
+++ b/hw/display/virtio-gpu-base.c
@@ -253,7 +253,7 @@ virtio_gpu_base_device_realize(DeviceState *qdev,
     g->hw_ops = &virtio_gpu_ops;
     for (i = 0; i < g->conf.max_outputs; i++) {
         g->scanout[i].con =
-            graphic_console_init(DEVICE(g), i, &virtio_gpu_ops, g);
+            qemu_graphic_console_create(DEVICE(g), i, &virtio_gpu_ops, g);
     }
 
     return true;
diff --git a/hw/display/virtio-gpu-rutabaga.c b/hw/display/virtio-gpu-rutabaga.c
index ebb6c783fb0..6ff12639012 100644
--- a/hw/display/virtio-gpu-rutabaga.c
+++ b/hw/display/virtio-gpu-rutabaga.c
@@ -282,7 +282,7 @@ rutabaga_cmd_resource_flush(VirtIOGPU *g, struct virtio_gpu_ctrl_command *cmd)
                                              rf.resource_id, &transfer,
                                              &transfer_iovec);
     CHECK(!result, cmd);
-    dpy_gfx_update_full(scanout->con);
+    qemu_console_update_full(scanout->con);
 }
 
 static void
@@ -306,8 +306,8 @@ rutabaga_cmd_set_scanout(VirtIOGPU *g, struct virtio_gpu_ctrl_command *cmd)
     scanout = &vb->scanout[ss.scanout_id];
 
     if (ss.resource_id == 0) {
-        dpy_gfx_replace_surface(scanout->con, NULL);
-        dpy_gl_scanout_disable(scanout->con);
+        qemu_console_set_surface(scanout->con, NULL);
+        qemu_console_gl_scanout_disable(scanout->con);
         return;
     }
 
@@ -331,8 +331,8 @@ rutabaga_cmd_set_scanout(VirtIOGPU *g, struct virtio_gpu_ctrl_command *cmd)
 
     /* realloc the surface ptr */
     scanout->ds = qemu_create_displaysurface_pixman(res->image);
-    dpy_gfx_replace_surface(scanout->con, NULL);
-    dpy_gfx_replace_surface(scanout->con, scanout->ds);
+    qemu_console_set_surface(scanout->con, NULL);
+    qemu_console_set_surface(scanout->con, scanout->ds);
     res->scanout_bitmask = ss.scanout_id;
 }
 
diff --git a/hw/display/virtio-gpu-udmabuf.c b/hw/display/virtio-gpu-udmabuf.c
index 74b6a7766af..d5ac1cfca0e 100644
--- a/hw/display/virtio-gpu-udmabuf.c
+++ b/hw/display/virtio-gpu-udmabuf.c
@@ -156,7 +156,7 @@ static void virtio_gpu_free_dmabuf(VirtIOGPU *g, VGPUDMABuf *dmabuf)
     struct virtio_gpu_scanout *scanout;
 
     scanout = &g->parent_obj.scanout[dmabuf->scanout_id];
-    dpy_gl_release_dmabuf(scanout->con, dmabuf->buf);
+    qemu_console_gl_release_dmabuf(scanout->con, dmabuf->buf);
     g_clear_pointer(&dmabuf->buf, qemu_dmabuf_free);
     QTAILQ_REMOVE(&g->dmabuf.bufs, dmabuf, next);
     g_free(dmabuf);
@@ -232,7 +232,7 @@ int virtio_gpu_update_dmabuf(VirtIOGPU *g,
     height = qemu_dmabuf_get_height(new_primary->buf);
     g->dmabuf.primary[scanout_id] = new_primary;
     qemu_console_resize(scanout->con, width, height);
-    dpy_gl_scanout_dmabuf(scanout->con, new_primary->buf);
+    qemu_console_gl_scanout_dmabuf(scanout->con, new_primary->buf);
 
     if (old_primary) {
         virtio_gpu_free_dmabuf(g, old_primary);
diff --git a/hw/display/virtio-gpu-virgl.c b/hw/display/virtio-gpu-virgl.c
index add85bd4e61..60c78af06a4 100644
--- a/hw/display/virtio-gpu-virgl.c
+++ b/hw/display/virtio-gpu-virgl.c
@@ -521,7 +521,7 @@ static void virtio_gpu_rect_update(VirtIOGPU *g, int idx, int x, int y,
         return;
     }
 
-    dpy_gl_update(g->parent_obj.scanout[idx].con, x, y, width, height);
+    qemu_console_gl_update(g->parent_obj.scanout[idx].con, x, y, width, height);
 }
 
 static void virgl_cmd_resource_flush(VirtIOGPU *g,
@@ -584,16 +584,15 @@ static void virgl_cmd_set_scanout(VirtIOGPU *g,
         qemu_console_resize(g->parent_obj.scanout[ss.scanout_id].con,
                             ss.r.width, ss.r.height);
         virgl_renderer_force_ctx_0();
-        dpy_gl_scanout_texture(
+        qemu_console_gl_scanout_texture(
             g->parent_obj.scanout[ss.scanout_id].con, info.tex_id,
             info.flags & VIRTIO_GPU_RESOURCE_FLAG_Y_0_TOP,
             info.width, info.height,
             ss.r.x, ss.r.y, ss.r.width, ss.r.height,
             d3d_tex2d);
     } else {
-        dpy_gfx_replace_surface(
-            g->parent_obj.scanout[ss.scanout_id].con, NULL);
-        dpy_gl_scanout_disable(g->parent_obj.scanout[ss.scanout_id].con);
+        qemu_console_set_surface(g->parent_obj.scanout[ss.scanout_id].con, NULL);
+        qemu_console_gl_scanout_disable(g->parent_obj.scanout[ss.scanout_id].con);
     }
     g->parent_obj.scanout[ss.scanout_id].resource_id = ss.resource_id;
 }
@@ -1315,7 +1314,7 @@ virgl_create_context(void *opaque, int scanout_idx,
     qparams.major_ver = params->major_ver;
     qparams.minor_ver = params->minor_ver;
 
-    ctx = dpy_gl_ctx_create(g->parent_obj.scanout[scanout_idx].con, &qparams);
+    ctx = qemu_console_gl_ctx_create(g->parent_obj.scanout[scanout_idx].con, &qparams);
     return (virgl_renderer_gl_context)ctx;
 }
 
@@ -1324,7 +1323,7 @@ static void virgl_destroy_context(void *opaque, virgl_renderer_gl_context ctx)
     VirtIOGPU *g = opaque;
     QEMUGLContext qctx = (QEMUGLContext)ctx;
 
-    dpy_gl_ctx_destroy(g->parent_obj.scanout[0].con, qctx);
+    qemu_console_gl_ctx_destroy(g->parent_obj.scanout[0].con, qctx);
 }
 
 static int virgl_make_context_current(void *opaque, int scanout_idx,
@@ -1333,8 +1332,7 @@ static int virgl_make_context_current(void *opaque, int scanout_idx,
     VirtIOGPU *g = opaque;
     QEMUGLContext qctx = (QEMUGLContext)ctx;
 
-    return dpy_gl_ctx_make_current(g->parent_obj.scanout[scanout_idx].con,
-                                   qctx);
+    return qemu_console_gl_ctx_make_current(g->parent_obj.scanout[scanout_idx].con, qctx);
 }
 
 static struct virgl_renderer_callbacks virtio_gpu_3d_cbs = {
@@ -1399,8 +1397,8 @@ void virtio_gpu_virgl_reset_scanout(VirtIOGPU *g)
     int i;
 
     for (i = 0; i < g->parent_obj.conf.max_outputs; i++) {
-        dpy_gfx_replace_surface(g->parent_obj.scanout[i].con, NULL);
-        dpy_gl_scanout_disable(g->parent_obj.scanout[i].con);
+        qemu_console_set_surface(g->parent_obj.scanout[i].con, NULL);
+        qemu_console_gl_scanout_disable(g->parent_obj.scanout[i].con);
     }
 }
 
diff --git a/hw/display/virtio-gpu.c b/hw/display/virtio-gpu.c
index dbb72bbb22d..88526051a99 100644
--- a/hw/display/virtio-gpu.c
+++ b/hw/display/virtio-gpu.c
@@ -103,14 +103,14 @@ static void update_cursor(VirtIOGPU *g, struct virtio_gpu_update_cursor *cursor)
         if (cursor->resource_id > 0) {
             vgc->update_cursor_data(g, s, cursor->resource_id);
         }
-        dpy_cursor_define(s->con, s->current_cursor);
+        qemu_console_set_cursor(s->con, s->current_cursor);
 
         s->cursor = *cursor;
     } else {
         s->cursor.pos.x = cursor->pos.x;
         s->cursor.pos.y = cursor->pos.y;
     }
-    dpy_mouse_set(s->con, cursor->pos.x, cursor->pos.y, cursor->resource_id);
+    qemu_console_set_mouse(s->con, cursor->pos.x, cursor->pos.y, cursor->resource_id);
 }
 
 struct virtio_gpu_simple_resource *
@@ -390,7 +390,7 @@ void virtio_gpu_disable_scanout(VirtIOGPU *g, int scanout_id)
         res->scanout_bitmask &= ~(1 << scanout_id);
     }
 
-    dpy_gfx_replace_surface(scanout->con, NULL);
+    qemu_console_set_surface(scanout->con, NULL);
     scanout->resource_id = 0;
     scanout->ds = NULL;
     scanout->width = 0;
@@ -531,8 +531,8 @@ static void virtio_gpu_resource_flush(VirtIOGPU *g,
                 rf.r.y + rf.r.height >= scanout->y) {
                 within_bounds = true;
 
-                if (console_has_gl(scanout->con)) {
-                    dpy_gl_update(scanout->con, 0, 0, scanout->width,
+                if (qemu_console_has_gl(scanout->con)) {
+                    qemu_console_gl_update(scanout->con, 0, 0, scanout->width,
                                   scanout->height);
                     update_submitted = true;
                 }
@@ -582,8 +582,8 @@ static void virtio_gpu_resource_flush(VirtIOGPU *g,
         /* work out the area we need to update for each console */
         if (qemu_rect_intersect(&flush_rect, &rect, &rect)) {
             qemu_rect_translate(&rect, -scanout->x, -scanout->y);
-            dpy_gfx_update(g->parent_obj.scanout[i].con,
-                           rect.x, rect.y, rect.width, rect.height);
+            qemu_console_update(g->parent_obj.scanout[i].con,
+                                rect.x, rect.y, rect.width, rect.height);
         }
     }
 }
@@ -649,7 +649,7 @@ static bool virtio_gpu_do_set_scanout(VirtIOGPU *g,
     g->parent_obj.enable = 1;
 
     if (res->blob) {
-        if (console_has_gl(scanout->con)) {
+        if (qemu_console_has_gl(scanout->con)) {
             if (!virtio_gpu_update_dmabuf(g, scanout_id, res, fb, r)) {
                 virtio_gpu_update_scanout(g, scanout_id, res, fb, r);
             } else {
@@ -665,7 +665,7 @@ static bool virtio_gpu_do_set_scanout(VirtIOGPU *g,
     }
 
     /* create a surface for this scanout */
-    if ((res->blob && !console_has_gl(scanout->con)) ||
+    if ((res->blob && !qemu_console_has_gl(scanout->con)) ||
         !scanout->ds ||
         surface_data(scanout->ds) != data + fb->offset ||
         scanout->width != r->width ||
@@ -686,7 +686,7 @@ static bool virtio_gpu_do_set_scanout(VirtIOGPU *g,
         qemu_displaysurface_set_share_handle(scanout->ds, res->share_handle, fb->offset);
 
         pixman_image_unref(rect);
-        dpy_gfx_replace_surface(g->parent_obj.scanout[scanout_id].con,
+        qemu_console_set_surface(g->parent_obj.scanout[scanout_id].con,
                                 scanout->ds);
     }
 
@@ -1483,10 +1483,10 @@ static int virtio_gpu_post_load(void *opaque, int version_id)
             }
             scanout->ds = qemu_create_displaysurface_pixman(res->image);
             qemu_displaysurface_set_share_handle(scanout->ds, res->share_handle, 0);
-            dpy_gfx_replace_surface(scanout->con, scanout->ds);
+            qemu_console_set_surface(scanout->con, scanout->ds);
         }
 
-        dpy_gfx_update_full(scanout->con);
+        qemu_console_update_full(scanout->con);
         if (scanout->cursor.resource_id) {
             update_cursor(g, &scanout->cursor);
         }
@@ -1602,7 +1602,7 @@ static void virtio_gpu_reset_bh(void *opaque)
     }
 
     for (i = 0; i < g->parent_obj.conf.max_outputs; i++) {
-        dpy_gfx_replace_surface(g->parent_obj.scanout[i].con, NULL);
+        qemu_console_set_surface(g->parent_obj.scanout[i].con, NULL);
     }
 
     g->reset_finished = true;
diff --git a/hw/display/virtio-vga.c b/hw/display/virtio-vga.c
index efd4858f3d0..2ae649c91ae 100644
--- a/hw/display/virtio-vga.c
+++ b/hw/display/virtio-vga.c
@@ -172,7 +172,7 @@ static void virtio_vga_base_realize(VirtIOPCIProxy *vpci_dev, Error **errp)
                                  vvga->vga_mrs, true, false);
 
     vga->con = g->scanout[0].con;
-    graphic_console_set_hwops(vga->con, &virtio_vga_base_ops, vvga);
+    qemu_graphic_console_set_hwops(vga->con, &virtio_vga_base_ops, vvga);
 
     for (i = 0; i < g->conf.max_outputs; i++) {
         object_property_set_link(OBJECT(g->scanout[i].con), "device",
diff --git a/hw/display/vmware_vga.c b/hw/display/vmware_vga.c
index 11f13c98d7a..f6f9edfd1d9 100644
--- a/hw/display/vmware_vga.c
+++ b/hw/display/vmware_vga.c
@@ -378,7 +378,7 @@ static inline void vmsvga_update_rect(struct vmsvga_state_s *s,
     for (line = h; line > 0; line--, src += bypl, dst += bypl) {
         memcpy(dst, src, width);
     }
-    dpy_gfx_update(s->vga.con, x, y, w, h);
+    qemu_console_update(s->vga.con, x, y, w, h);
 }
 
 static inline void vmsvga_update_rect_flush(struct vmsvga_state_s *s)
@@ -554,7 +554,7 @@ static inline void vmsvga_cursor_define(struct vmsvga_state_s *s,
         qc = cursor_builtin_left_ptr();
     }
 
-    dpy_cursor_define(s->vga.con, qc);
+    qemu_console_set_cursor(s->vga.con, qc);
     cursor_unref(qc);
 }
 #endif
@@ -1082,7 +1082,7 @@ static void vmsvga_value_write(void *opaque, uint32_t address, uint32_t value)
         s->cursor.on &= (value != SVGA_CURSOR_ON_HIDE);
 #ifdef HW_MOUSE_ACCEL
         if (value <= SVGA_CURSOR_ON_SHOW) {
-            dpy_mouse_set(s->vga.con, s->cursor.x, s->cursor.y, s->cursor.on);
+            qemu_console_set_mouse(s->vga.con, s->cursor.x, s->cursor.y, s->cursor.on);
         }
 #endif
         break;
@@ -1130,7 +1130,7 @@ static inline void vmsvga_check_size(struct vmsvga_state_s *s)
         surface = qemu_create_displaysurface_from(s->new_width, s->new_height,
                                                   format, stride,
                                                   s->vga.vram_ptr);
-        dpy_gfx_replace_surface(s->vga.con, surface);
+        qemu_console_set_surface(s->vga.con, surface);
         s->invalidated = 1;
     }
 }
@@ -1151,7 +1151,7 @@ static bool vmsvga_update_display(void *opaque)
 
     if (s->invalidated) {
         s->invalidated = 0;
-        dpy_gfx_update_full(s->vga.con);
+        qemu_console_update_full(s->vga.con);
     }
 
     return true;
@@ -1254,7 +1254,7 @@ static void vmsvga_init(DeviceState *dev, struct vmsvga_state_s *s,
     s->scratch_size = SVGA_SCRATCH_SIZE;
     s->scratch = g_malloc(s->scratch_size * 4);
 
-    s->vga.con = graphic_console_init(dev, 0, &vmsvga_ops, s);
+    s->vga.con = qemu_graphic_console_create(dev, 0, &vmsvga_ops, s);
 
     s->fifo_size = SVGA_FIFO_SIZE;
     memory_region_init_ram(&s->fifo_ram, NULL, "vmsvga.fifo", s->fifo_size,
diff --git a/hw/display/xenfb.c b/hw/display/xenfb.c
index 2e431e27be6..8e9953bda43 100644
--- a/hw/display/xenfb.c
+++ b/hw/display/xenfb.c
@@ -657,7 +657,7 @@ static void xenfb_guest_copy(struct XenFB *xenfb, int x, int y, int w, int h)
         xen_pv_printf(&xenfb->c.xendev, 0, "%s: oops: convert %d -> %d bpp?\n",
                       __func__, xenfb->depth, bpp);
 
-    dpy_gfx_update(xenfb->con, x, y, w, h);
+    qemu_console_update(xenfb->con, x, y, w, h);
 }
 
 #ifdef XENFB_TYPE_REFRESH_PERIOD
@@ -743,7 +743,7 @@ static bool xenfb_update(void *opaque)
             surface = qemu_create_displaysurface(xenfb->width, xenfb->height);
             break;
         }
-        dpy_gfx_replace_surface(xenfb->con, surface);
+        qemu_console_set_surface(xenfb->con, surface);
         xen_pv_printf(&xenfb->c.xendev, 1,
                       "update: resizing: %dx%d @ %d bpp%s\n",
                       xenfb->width, xenfb->height, xenfb->depth,
@@ -903,7 +903,7 @@ static int fb_initialise(struct XenLegacyDevice *xendev)
     if (rc != 0)
         return rc;
 
-    fb->con = graphic_console_init(NULL, 0, &xenfb_ops, fb);
+    fb->con = qemu_graphic_console_create(NULL, 0, &xenfb_ops, fb);
 
     if (xenstore_read_fe_int(xendev, "feature-update", &fb->feature_update) == -1)
         fb->feature_update = 0;
diff --git a/hw/display/xlnx_dp.c b/hw/display/xlnx_dp.c
index 50e6ef10984..2486d9e5825 100644
--- a/hw/display/xlnx_dp.c
+++ b/hw/display/xlnx_dp.c
@@ -605,7 +605,7 @@ static void xlnx_dp_recreate_surface(XlnxDPState *s)
 
     if ((width != 0) && (height != 0)) {
         /*
-         * As dpy_gfx_replace_surface calls qemu_free_displaysurface on the
+         * As qemu_console_replace_surface calls qemu_free_displaysurface on the
          * surface we need to be careful and don't free the surface associated
          * to the console or double free will happen.
          */
@@ -631,10 +631,10 @@ static void xlnx_dp_recreate_surface(XlnxDPState *s)
                                                             height,
                                                             s->g_plane.format,
                                                             0, NULL);
-            dpy_gfx_replace_surface(s->console, s->bout_plane.surface);
+            qemu_console_set_surface(s->console, s->bout_plane.surface);
         } else {
             s->bout_plane.surface = NULL;
-            dpy_gfx_replace_surface(s->console, s->g_plane.surface);
+            qemu_console_set_surface(s->console, s->g_plane.surface);
         }
 
         xlnx_dpdma_set_host_data_location(s->dpdma, DP_GRAPHIC_DMA_CHANNEL,
@@ -1287,7 +1287,7 @@ static bool xlnx_dp_update_display(void *opaque)
     /*
      * XXX: We might want to update only what changed.
      */
-    dpy_gfx_update_full(s->console);
+    qemu_console_update_full(s->console);
 
     return true;
 }
@@ -1387,7 +1387,7 @@ static void xlnx_dp_realize(DeviceState *dev, Error **errp)
     qdev_realize(DEVICE(s->edid), BUS(aux_get_i2c_bus(s->aux_bus)),
                  &error_fatal);
 
-    s->console = graphic_console_init(dev, 0, &xlnx_dp_gfx_ops, s);
+    s->console = qemu_graphic_console_create(dev, 0, &xlnx_dp_gfx_ops, s);
     surface = qemu_console_surface(s->console);
     xlnx_dpdma_set_host_data_location(s->dpdma, DP_GRAPHIC_DMA_CHANNEL,
                                       surface_data(surface));
diff --git a/hw/vfio/display.c b/hw/vfio/display.c
index 4a9a58036e3..8f91e83da88 100644
--- a/hw/vfio/display.c
+++ b/hw/vfio/display.c
@@ -264,7 +264,7 @@ static void vfio_display_free_one_dmabuf(VFIODisplay *dpy, VFIODMABuf *dmabuf)
     QTAILQ_REMOVE(&dpy->dmabuf.bufs, dmabuf, next);
 
     qemu_dmabuf_close(dmabuf->buf);
-    dpy_gl_release_dmabuf(dpy->con, dmabuf->buf);
+    qemu_console_gl_release_dmabuf(dpy->con, dmabuf->buf);
     g_clear_pointer(&dmabuf->buf, qemu_dmabuf_free);
     g_free(dmabuf);
 }
@@ -307,7 +307,7 @@ static bool vfio_display_dmabuf_update(void *opaque)
     if (dpy->dmabuf.primary != primary) {
         dpy->dmabuf.primary = primary;
         qemu_console_resize(dpy->con, width, height);
-        dpy_gl_scanout_dmabuf(dpy->con, primary->buf);
+        qemu_console_gl_scanout_dmabuf(dpy->con, primary->buf);
         free_bufs = true;
     }
 
@@ -321,21 +321,21 @@ static bool vfio_display_dmabuf_update(void *opaque)
     if (cursor && (new_cursor || cursor->hot_updates)) {
         bool have_hot = (cursor->hot_x != 0xffffffff &&
                          cursor->hot_y != 0xffffffff);
-        dpy_gl_cursor_dmabuf(dpy->con, cursor->buf, have_hot,
-                             cursor->hot_x, cursor->hot_y);
+        qemu_console_gl_cursor_dmabuf(dpy->con, cursor->buf, have_hot,
+                                      cursor->hot_x, cursor->hot_y);
         cursor->hot_updates = 0;
     } else if (!cursor && new_cursor) {
-        dpy_gl_cursor_dmabuf(dpy->con, NULL, false, 0, 0);
+        qemu_console_gl_cursor_dmabuf(dpy->con, NULL, false, 0, 0);
     }
 
     if (cursor && cursor->pos_updates) {
-        dpy_gl_cursor_position(dpy->con,
+        qemu_console_gl_cursor_position(dpy->con,
                                cursor->pos_x,
                                cursor->pos_y);
         cursor->pos_updates = 0;
     }
 
-    dpy_gl_update(dpy->con, 0, 0, width, height);
+    qemu_console_gl_update(dpy->con, 0, 0, width, height);
 
     if (free_bufs) {
         vfio_display_free_dmabufs(vdev);
@@ -363,7 +363,7 @@ static bool vfio_display_dmabuf_init(VFIOPCIDevice *vdev, Error **errp)
     }
 
     vdev->dpy = g_new0(VFIODisplay, 1);
-    vdev->dpy->con = graphic_console_init(DEVICE(vdev), 0,
+    vdev->dpy->con = qemu_graphic_console_create(DEVICE(vdev), 0,
                                           &vfio_display_dmabuf_ops,
                                           vdev);
     if (vdev->enable_ramfb) {
@@ -396,9 +396,9 @@ void vfio_display_reset(VFIOPCIDevice *vdev)
         return;
     }
 
-    dpy_gl_scanout_disable(vdev->dpy->con);
+    qemu_console_gl_scanout_disable(vdev->dpy->con);
     vfio_display_dmabuf_exit(vdev->dpy);
-    dpy_gfx_update_full(vdev->dpy->con);
+    qemu_console_update_full(vdev->dpy->con);
 }
 
 static bool vfio_display_region_update(void *opaque)
@@ -471,13 +471,13 @@ static bool vfio_display_region_update(void *opaque)
         dpy->region.surface = qemu_create_displaysurface_from
             (plane.width, plane.height, format,
              plane.stride, dpy->region.buffer.mmaps[0].mmap);
-        dpy_gfx_replace_surface(dpy->con, dpy->region.surface);
+        qemu_console_set_surface(dpy->con, dpy->region.surface);
     }
 
     /* full screen update */
-    dpy_gfx_update(dpy->con, 0, 0,
-                   surface_width(dpy->region.surface),
-                   surface_height(dpy->region.surface));
+    qemu_console_update(dpy->con, 0, 0,
+                        surface_width(dpy->region.surface),
+                        surface_height(dpy->region.surface));
     return true;
 
 err:
@@ -493,7 +493,7 @@ static const GraphicHwOps vfio_display_region_ops = {
 static bool vfio_display_region_init(VFIOPCIDevice *vdev, Error **errp)
 {
     vdev->dpy = g_new0(VFIODisplay, 1);
-    vdev->dpy->con = graphic_console_init(DEVICE(vdev), 0,
+    vdev->dpy->con = qemu_graphic_console_create(DEVICE(vdev), 0,
                                           &vfio_display_region_ops,
                                           vdev);
     if (vdev->enable_ramfb) {
@@ -553,7 +553,7 @@ void vfio_display_finalize(VFIOPCIDevice *vdev)
         return;
     }
 
-    graphic_console_close(vdev->dpy->con);
+    qemu_graphic_console_close(vdev->dpy->con);
     vfio_display_dmabuf_exit(vdev->dpy);
     vfio_display_region_exit(vdev->dpy);
     vfio_display_edid_exit(vdev->dpy);
diff --git a/ui/console-vc.c b/ui/console-vc.c
index 99ad6d079df..828e78c41ea 100644
--- a/ui/console-vc.c
+++ b/ui/console-vc.c
@@ -90,15 +90,15 @@ static void text_console_update(void *opaque, uint32_t *chardata)
                                           s->vt.cells[src].t_attrib.bgcol,
                                           s->vt.cells[src].t_attrib.bold);
             }
-        dpy_text_update(QEMU_CONSOLE(s), s->vt.text_x[0], s->vt.text_y[0],
-                        s->vt.text_x[1] - s->vt.text_x[0], i - s->vt.text_y[0]);
+        qemu_console_text_update(QEMU_CONSOLE(s), s->vt.text_x[0], s->vt.text_y[0],
+                                 s->vt.text_x[1] - s->vt.text_x[0], i - s->vt.text_y[0]);
         s->vt.text_x[0] = s->vt.width;
         s->vt.text_y[0] = s->vt.height;
         s->vt.text_x[1] = 0;
         s->vt.text_y[1] = 0;
     }
     if (s->vt.cursor_invalidate) {
-        dpy_text_cursor(QEMU_CONSOLE(s), s->vt.x, s->vt.y);
+        qemu_console_text_set_cursor(QEMU_CONSOLE(s), s->vt.x, s->vt.y);
         s->vt.cursor_invalidate = 0;
     }
 }
@@ -186,14 +186,14 @@ static void vc_chr_set_echo(Chardev *chr, bool echo)
 
 void qemu_text_console_update_size(QemuTextConsole *c)
 {
-    dpy_text_resize(QEMU_CONSOLE(c), c->vt.width, c->vt.height);
+    qemu_console_text_resize(QEMU_CONSOLE(c), c->vt.width, c->vt.height);
 }
 
 static void text_console_image_update(QemuVT100 *vt, int x, int y, int width, int height)
 {
     QemuTextConsole *console = container_of(vt, QemuTextConsole, vt);
 
-    dpy_gfx_update(QEMU_CONSOLE(console), x, y, width, height);
+    qemu_console_update(QEMU_CONSOLE(console), x, y, width, height);
 }
 
 static void text_console_out_flush(QemuVT100 *vt)
@@ -232,7 +232,7 @@ static bool vc_chr_open(Chardev *chr, ChardevBackend *backend, Error **errp)
         s = QEMU_TEXT_CONSOLE(object_new(TYPE_QEMU_FIXED_TEXT_CONSOLE));
     }
 
-    dpy_gfx_replace_surface(QEMU_CONSOLE(s), qemu_create_displaysurface(width, height));
+    qemu_console_set_surface(QEMU_CONSOLE(s), qemu_create_displaysurface(width, height));
     if (vc->has_encoding) {
         drv->encoding = vc->encoding;
     }
diff --git a/ui/console.c b/ui/console.c
index 22ca1c35db3..6f6330d61f1 100644
--- a/ui/console.c
+++ b/ui/console.c
@@ -129,26 +129,26 @@ static void gui_setup_refresh(DisplayState *ds)
     }
 }
 
-void graphic_hw_update_done(QemuConsole *con)
+void qemu_console_hw_update_done(QemuConsole *con)
 {
     if (con) {
         qemu_co_enter_all(&con->dump_queue, NULL);
     }
 }
 
-void graphic_hw_update(QemuConsole *con)
+void qemu_console_hw_update(QemuConsole *con)
 {
     if (!con) {
         return;
     }
     if (!con->hw_ops->gfx_update || con->hw_ops->gfx_update(con->hw)) {
-        graphic_hw_update_done(con);
+        qemu_console_hw_update_done(con);
     }
 }
 
-static void graphic_hw_update_bh(void *con)
+static void console_hw_update_bh(void *con)
 {
-    graphic_hw_update(con);
+    qemu_console_hw_update(con);
 }
 
 void qemu_console_co_wait_update(QemuConsole *con)
@@ -156,18 +156,18 @@ void qemu_console_co_wait_update(QemuConsole *con)
     if (qemu_co_queue_empty(&con->dump_queue)) {
         /* Defer the update, it will restart the pending coroutines */
         aio_bh_schedule_oneshot(qemu_get_aio_context(),
-                                graphic_hw_update_bh, con);
+                                console_hw_update_bh, con);
     }
     qemu_co_queue_wait(&con->dump_queue, NULL);
 
 }
 
-static void graphic_hw_gl_unblock_timer(void *opaque)
+static void console_hw_gl_unblock_timer(void *opaque)
 {
     warn_report("console: no gl-unblock within one second");
 }
 
-void graphic_hw_gl_block(QemuConsole *con, bool block)
+void qemu_console_hw_gl_block(QemuConsole *con, bool block)
 {
     uint64_t timeout;
     assert(con != NULL);
@@ -205,14 +205,14 @@ void qemu_console_set_window_id(QemuConsole *con, int window_id)
     con->window_id = window_id;
 }
 
-void graphic_hw_invalidate(QemuConsole *con)
+void qemu_console_hw_invalidate(QemuConsole *con)
 {
     if (con && con->hw_ops->invalidate) {
         con->hw_ops->invalidate(con->hw);
     }
 }
 
-void graphic_hw_text_update(QemuConsole *con, uint32_t *chardata)
+void qemu_console_hw_text_update(QemuConsole *con, uint32_t *chardata)
 {
     if (con && con->hw_ops->text_update) {
         con->hw_ops->text_update(con->hw, chardata);
@@ -502,7 +502,7 @@ qemu_graphic_console_init(Object *obj)
 {
 }
 
-bool console_has_gl(QemuConsole *con)
+bool qemu_console_has_gl(QemuConsole *con)
 {
     return con->gl != NULL;
 }
@@ -527,7 +527,7 @@ static bool console_compatible_with(QemuConsole *con,
 
     flags = con->hw_ops->get_flags ? con->hw_ops->get_flags(con->hw) : 0;
 
-    if (console_has_gl(con) &&
+    if (qemu_console_has_gl(con) &&
         !con->gl->ops->dpy_gl_ctx_is_compatible_dcl(con->gl, dcl)) {
         error_setg(errp, "Display %s is incompatible with the GL context",
                    dcl->ops->dpy_name);
@@ -535,7 +535,7 @@ static bool console_compatible_with(QemuConsole *con,
     }
 
     if (flags & GRAPHIC_FLAGS_GL &&
-        !console_has_gl(con)) {
+        !qemu_console_has_gl(con)) {
         error_setg(errp, "The console requires a GL context.");
         return false;
 
@@ -605,8 +605,8 @@ void qemu_console_register_listener(QemuConsole *con,
     vt100_update_cursor();
 }
 
-void update_displaychangelistener(DisplayChangeListener *dcl,
-                                  uint64_t interval)
+void qemu_console_listener_set_refresh(DisplayChangeListener *dcl,
+                                       uint64_t interval)
 {
     DisplayState *ds = dcl->ds;
 
@@ -645,7 +645,7 @@ static void dpy_set_ui_info_timer(void *opaque)
     con->hw_ops->ui_info(con->hw, head, &con->ui_info);
 }
 
-bool dpy_ui_info_supported(const QemuConsole *con)
+bool qemu_console_ui_info_supported(const QemuConsole *con)
 {
     if (con == NULL) {
         return false;
@@ -654,16 +654,16 @@ bool dpy_ui_info_supported(const QemuConsole *con)
     return con->hw_ops->ui_info != NULL;
 }
 
-const QemuUIInfo *dpy_get_ui_info(const QemuConsole *con)
+const QemuUIInfo *qemu_console_get_ui_info(const QemuConsole *con)
 {
-    assert(dpy_ui_info_supported(con));
+    assert(qemu_console_ui_info_supported(con));
 
     return &con->ui_info;
 }
 
-int dpy_set_ui_info(QemuConsole *con, QemuUIInfo *info, bool delay)
+int qemu_console_set_ui_info(QemuConsole *con, QemuUIInfo *info, bool delay)
 {
-    if (!dpy_ui_info_supported(con)) {
+    if (!qemu_console_ui_info_supported(con)) {
         return -1;
     }
     if (memcmp(&con->ui_info, info, sizeof(con->ui_info)) == 0) {
@@ -682,7 +682,7 @@ int dpy_set_ui_info(QemuConsole *con, QemuUIInfo *info, bool delay)
     return 0;
 }
 
-void dpy_gfx_update(QemuConsole *con, int x, int y, int w, int h)
+void qemu_console_update(QemuConsole *con, int x, int y, int w, int h)
 {
     DisplayState *s = con->ds;
     DisplayChangeListener *dcl;
@@ -707,15 +707,15 @@ void dpy_gfx_update(QemuConsole *con, int x, int y, int w, int h)
     }
 }
 
-void dpy_gfx_update_full(QemuConsole *con)
+void qemu_console_update_full(QemuConsole *con)
 {
     int w = qemu_console_get_width(con, 0);
     int h = qemu_console_get_height(con, 0);
 
-    dpy_gfx_update(con, 0, 0, w, h);
+    qemu_console_update(con, 0, 0, w, h);
 }
 
-void dpy_gfx_replace_surface(QemuConsole *con,
+void qemu_console_set_surface(QemuConsole *con,
                              DisplaySurface *surface)
 {
     static const char placeholder_msg[] = "Display output is not active.";
@@ -753,8 +753,8 @@ void dpy_gfx_replace_surface(QemuConsole *con,
     qemu_free_displaysurface(old_surface);
 }
 
-bool dpy_gfx_check_format(QemuConsole *con,
-                          pixman_format_code_t format)
+bool qemu_console_check_format(QemuConsole *con,
+                               pixman_format_code_t format)
 {
     DisplayChangeListener *dcl;
     DisplayState *s = con->ds;
@@ -789,7 +789,7 @@ static void dpy_refresh(DisplayState *s)
     }
 }
 
-void dpy_text_cursor(QemuConsole *con, int x, int y)
+void qemu_console_text_set_cursor(QemuConsole *con, int x, int y)
 {
     DisplayState *s = con->ds;
     DisplayChangeListener *dcl;
@@ -804,7 +804,7 @@ void dpy_text_cursor(QemuConsole *con, int x, int y)
     }
 }
 
-void dpy_text_update(QemuConsole *con, int x, int y, int w, int h)
+void qemu_console_text_update(QemuConsole *con, int x, int y, int w, int h)
 {
     DisplayState *s = con->ds;
     DisplayChangeListener *dcl;
@@ -819,7 +819,7 @@ void dpy_text_update(QemuConsole *con, int x, int y, int w, int h)
     }
 }
 
-void dpy_text_resize(QemuConsole *con, int w, int h)
+void qemu_console_text_resize(QemuConsole *con, int w, int h)
 {
     DisplayState *s = con->ds;
     DisplayChangeListener *dcl;
@@ -834,7 +834,7 @@ void dpy_text_resize(QemuConsole *con, int w, int h)
     }
 }
 
-void dpy_mouse_set(QemuConsole *c, int x, int y, bool on)
+void qemu_console_set_mouse(QemuConsole *c, int x, int y, bool on)
 {
     QemuGraphicConsole *con = QEMU_GRAPHIC_CONSOLE(c);
     DisplayState *s = c->ds;
@@ -853,7 +853,7 @@ void dpy_mouse_set(QemuConsole *c, int x, int y, bool on)
     }
 }
 
-void dpy_cursor_define(QemuConsole *c, QEMUCursor *cursor)
+void qemu_console_set_cursor(QemuConsole *c, QEMUCursor *cursor)
 {
     QemuGraphicConsole *con = QEMU_GRAPHIC_CONSOLE(c);
     DisplayState *s = c->ds;
@@ -871,26 +871,26 @@ void dpy_cursor_define(QemuConsole *c, QEMUCursor *cursor)
     }
 }
 
-QEMUGLContext dpy_gl_ctx_create(QemuConsole *con,
-                                struct QEMUGLParams *qparams)
+QEMUGLContext qemu_console_gl_ctx_create(QemuConsole *con,
+                                         QEMUGLParams *qparams)
 {
     assert(con->gl);
     return con->gl->ops->dpy_gl_ctx_create(con->gl, qparams);
 }
 
-void dpy_gl_ctx_destroy(QemuConsole *con, QEMUGLContext ctx)
+void qemu_console_gl_ctx_destroy(QemuConsole *con, QEMUGLContext ctx)
 {
     assert(con->gl);
     con->gl->ops->dpy_gl_ctx_destroy(con->gl, ctx);
 }
 
-int dpy_gl_ctx_make_current(QemuConsole *con, QEMUGLContext ctx)
+int qemu_console_gl_ctx_make_current(QemuConsole *con, QEMUGLContext ctx)
 {
     assert(con->gl);
     return con->gl->ops->dpy_gl_ctx_make_current(con->gl, ctx);
 }
 
-void dpy_gl_scanout_disable(QemuConsole *con)
+void qemu_console_gl_scanout_disable(QemuConsole *con)
 {
     DisplayState *s = con->ds;
     DisplayChangeListener *dcl;
@@ -908,14 +908,14 @@ void dpy_gl_scanout_disable(QemuConsole *con)
     }
 }
 
-void dpy_gl_scanout_texture(QemuConsole *con,
-                            uint32_t backing_id,
-                            bool backing_y_0_top,
-                            uint32_t backing_width,
-                            uint32_t backing_height,
-                            uint32_t x, uint32_t y,
-                            uint32_t width, uint32_t height,
-                            void *d3d_tex2d)
+void qemu_console_gl_scanout_texture(QemuConsole *con,
+                                     uint32_t backing_id,
+                                     bool backing_y_0_top,
+                                     uint32_t backing_width,
+                                     uint32_t backing_height,
+                                     uint32_t x, uint32_t y,
+                                     uint32_t width, uint32_t height,
+                                     void *d3d_tex2d)
 {
     DisplayState *s = con->ds;
     DisplayChangeListener *dcl;
@@ -939,8 +939,8 @@ void dpy_gl_scanout_texture(QemuConsole *con,
     }
 }
 
-void dpy_gl_scanout_dmabuf(QemuConsole *con,
-                           QemuDmaBuf *dmabuf)
+void qemu_console_gl_scanout_dmabuf(QemuConsole *con,
+                                    QemuDmaBuf *dmabuf)
 {
     DisplayState *s = con->ds;
     DisplayChangeListener *dcl;
@@ -957,8 +957,8 @@ void dpy_gl_scanout_dmabuf(QemuConsole *con,
     }
 }
 
-void dpy_gl_cursor_dmabuf(QemuConsole *con, QemuDmaBuf *dmabuf,
-                          bool have_hot, uint32_t hot_x, uint32_t hot_y)
+void qemu_console_gl_cursor_dmabuf(QemuConsole *con, QemuDmaBuf *dmabuf,
+                                   bool have_hot, uint32_t hot_x, uint32_t hot_y)
 {
     DisplayState *s = con->ds;
     DisplayChangeListener *dcl;
@@ -974,8 +974,8 @@ void dpy_gl_cursor_dmabuf(QemuConsole *con, QemuDmaBuf *dmabuf,
     }
 }
 
-void dpy_gl_cursor_position(QemuConsole *con,
-                            uint32_t pos_x, uint32_t pos_y)
+void qemu_console_gl_cursor_position(QemuConsole *con,
+                                     uint32_t pos_x, uint32_t pos_y)
 {
     DisplayState *s = con->ds;
     DisplayChangeListener *dcl;
@@ -990,8 +990,8 @@ void dpy_gl_cursor_position(QemuConsole *con,
     }
 }
 
-void dpy_gl_release_dmabuf(QemuConsole *con,
-                          QemuDmaBuf *dmabuf)
+void qemu_console_gl_release_dmabuf(QemuConsole *con,
+                                    QemuDmaBuf *dmabuf)
 {
     DisplayState *s = con->ds;
     DisplayChangeListener *dcl;
@@ -1006,15 +1006,15 @@ void dpy_gl_release_dmabuf(QemuConsole *con,
     }
 }
 
-void dpy_gl_update(QemuConsole *con,
-                   uint32_t x, uint32_t y, uint32_t w, uint32_t h)
+void qemu_console_gl_update(QemuConsole *con,
+                            uint32_t x, uint32_t y, uint32_t w, uint32_t h)
 {
     DisplayState *s = con->ds;
     DisplayChangeListener *dcl;
 
     assert(con->gl);
 
-    graphic_hw_gl_block(con, true);
+    qemu_console_hw_gl_block(con, true);
     QLIST_FOREACH(dcl, &s->listeners, next) {
         if (con != dcl->con) {
             continue;
@@ -1023,7 +1023,7 @@ void dpy_gl_update(QemuConsole *con,
             dcl->ops->dpy_gl_update(dcl, x, y, w, h);
         }
     }
-    graphic_hw_gl_block(con, false);
+    qemu_console_hw_gl_block(con, false);
 }
 
 /***********************************************************/
@@ -1060,17 +1060,17 @@ DisplayState *init_displaystate(void)
     return display_state;
 }
 
-void graphic_console_set_hwops(QemuConsole *con,
-                               const GraphicHwOps *hw_ops,
-                               void *opaque)
+void qemu_graphic_console_set_hwops(QemuConsole *con,
+                                    const GraphicHwOps *hw_ops,
+                                    void *opaque)
 {
     con->hw_ops = hw_ops;
     con->hw = opaque;
 }
 
-QemuConsole *graphic_console_init(DeviceState *dev, uint32_t head,
-                                  const GraphicHwOps *hw_ops,
-                                  void *opaque)
+QemuConsole *qemu_graphic_console_create(DeviceState *dev, uint32_t head,
+                                         const GraphicHwOps *hw_ops,
+                                         void *opaque)
 {
     static const char noinit[] =
         "Guest has not initialized the display (yet).";
@@ -1089,16 +1089,16 @@ QemuConsole *graphic_console_init(DeviceState *dev, uint32_t head,
         s = (QemuConsole *)object_new(TYPE_QEMU_GRAPHIC_CONSOLE);
     }
     QEMU_GRAPHIC_CONSOLE(s)->head = head;
-    graphic_console_set_hwops(s, hw_ops, opaque);
+    qemu_graphic_console_set_hwops(s, hw_ops, opaque);
     if (dev) {
         object_property_set_link(OBJECT(s), "device", OBJECT(dev),
                                  &error_abort);
     }
 
     surface = qemu_create_placeholder_surface(width, height, noinit);
-    dpy_gfx_replace_surface(s, surface);
+    qemu_console_set_surface(s, surface);
     s->gl_unblock_timer = timer_new_ms(QEMU_CLOCK_REALTIME,
-                                       graphic_hw_gl_unblock_timer, s);
+                                       console_hw_gl_unblock_timer, s);
     return s;
 }
 
@@ -1106,7 +1106,7 @@ static const GraphicHwOps unused_ops = {
     /* no callbacks */
 };
 
-void graphic_console_close(QemuConsole *con)
+void qemu_graphic_console_close(QemuConsole *con)
 {
     static const char unplugged[] =
         "Guest display has been unplugged";
@@ -1116,13 +1116,13 @@ void graphic_console_close(QemuConsole *con)
 
     trace_console_gfx_close(con->index);
     object_property_set_link(OBJECT(con), "device", NULL, &error_abort);
-    graphic_console_set_hwops(con, &unused_ops, NULL);
+    qemu_graphic_console_set_hwops(con, &unused_ops, NULL);
 
     if (con->gl) {
-        dpy_gl_scanout_disable(con);
+        qemu_console_gl_scanout_disable(con);
     }
     surface = qemu_create_placeholder_surface(width, height, unplugged);
-    dpy_gfx_replace_surface(con, surface);
+    qemu_console_set_surface(con, surface);
 }
 
 QemuConsole *qemu_console_lookup_default(void)
@@ -1308,7 +1308,7 @@ void qemu_console_resize(QemuConsole *s, int width, int height)
     }
 
     surface = qemu_create_displaysurface(width, height);
-    dpy_gfx_replace_surface(s, surface);
+    qemu_console_set_surface(s, surface);
 }
 
 DisplaySurface *qemu_console_surface(QemuConsole *console)
diff --git a/ui/curses.c b/ui/curses.c
index dbb5992981c..24d3713e57d 100644
--- a/ui/curses.c
+++ b/ui/curses.c
@@ -1,8 +1,8 @@
 /*
  * QEMU curses/ncurses display driver
- * 
+ *
  * Copyright (c) 2005 Andrzej Zaborowski  <balrog@zabor.org>
- * 
+ *
  * Permission is hereby granted, free of charge, to any person obtaining a copy
  * of this software and associated documentation files (the "Software"), to deal
  * in the Software without restriction, including without limitation the rights
@@ -275,11 +275,11 @@ static void curses_refresh(DisplayChangeListener *dcl)
         clear();
         refresh();
         curses_calc_pad();
-        graphic_hw_invalidate(dcl->con);
+        qemu_console_hw_invalidate(dcl->con);
         invalidate = 0;
     }
 
-    graphic_hw_text_update(dcl->con, screen);
+    qemu_console_hw_text_update(dcl->con, screen);
 
     while (1) {
         /* while there are any pending key strokes to process */
diff --git a/ui/dbus-console.c b/ui/dbus-console.c
index 23f547a673d..b8e5c57b148 100644
--- a/ui/dbus-console.c
+++ b/ui/dbus-console.c
@@ -200,7 +200,7 @@ dbus_console_set_ui_info(DBusDisplayConsole *ddc,
         .height = arg_height,
     };
 
-    if (!dpy_ui_info_supported(ddc->dcl.con)) {
+    if (!qemu_console_ui_info_supported(ddc->dcl.con)) {
         g_dbus_method_invocation_return_error(invocation,
                                               DBUS_DISPLAY_ERROR,
                                               DBUS_DISPLAY_ERROR_UNSUPPORTED,
@@ -208,7 +208,7 @@ dbus_console_set_ui_info(DBusDisplayConsole *ddc,
         return DBUS_METHOD_INVOCATION_HANDLED;
     }
 
-    dpy_set_ui_info(ddc->dcl.con, &info, false);
+    qemu_console_set_ui_info(ddc->dcl.con, &info, false);
     qemu_dbus_display1_console_complete_set_uiinfo(ddc->iface, invocation);
     return DBUS_METHOD_INVOCATION_HANDLED;
 }
diff --git a/ui/dbus-listener.c b/ui/dbus-listener.c
index cc2c969686e..2e2f6ba4183 100644
--- a/ui/dbus-listener.c
+++ b/ui/dbus-listener.c
@@ -241,7 +241,7 @@ static void dbus_update_gl_cb(GObject *source_object,
     }
 #endif
 
-    graphic_hw_gl_block(ddl->dcl.con, false);
+    qemu_console_hw_gl_block(ddl->dcl.con, false);
     g_object_unref(ddl);
 }
 #endif
@@ -257,7 +257,7 @@ static void dbus_call_update_gl(DisplayChangeListener *dcl,
 
     glFlush();
 #ifdef CONFIG_GBM
-    graphic_hw_gl_block(ddl->dcl.con, true);
+    qemu_console_hw_gl_block(ddl->dcl.con, true);
     qemu_dbus_display1_listener_call_update_dmabuf(ddl->proxy,
         x, y, w, h,
         G_DBUS_CALL_FLAGS_NONE,
@@ -276,7 +276,7 @@ static void dbus_call_update_gl(DisplayChangeListener *dcl,
         Error *err = NULL;
         assert(ddl->d3d_texture);
 
-        graphic_hw_gl_block(ddl->dcl.con, true);
+        qemu_console_hw_gl_block(ddl->dcl.con, true);
         if (!d3d_texture2d_release0(ddl->d3d_texture, &err)) {
             error_report_err(err);
             return;
@@ -711,7 +711,7 @@ static void dbus_gl_refresh(DisplayChangeListener *dcl)
 {
     DBusDisplayListener *ddl = container_of(dcl, DBusDisplayListener, dcl);
 
-    graphic_hw_update(dcl->con);
+    qemu_console_hw_update(dcl->con);
 
     if (!ddl->ds || qemu_console_is_gl_blocked(ddl->dcl.con)) {
         return;
@@ -740,7 +740,7 @@ static void dbus_gl_refresh(DisplayChangeListener *dcl)
 
 static void dbus_refresh(DisplayChangeListener *dcl)
 {
-    graphic_hw_update(dcl->con);
+    qemu_console_hw_update(dcl->con);
 }
 
 #ifdef CONFIG_OPENGL
diff --git a/ui/egl-headless.c b/ui/egl-headless.c
index 4f046c975a9..878bfebb40c 100644
--- a/ui/egl-headless.c
+++ b/ui/egl-headless.c
@@ -23,7 +23,7 @@ typedef struct egl_dpy {
 
 static void egl_refresh(DisplayChangeListener *dcl)
 {
-    graphic_hw_update(dcl->con);
+    qemu_console_hw_update(dcl->con);
 }
 
 static void egl_gfx_update(DisplayChangeListener *dcl,
@@ -161,7 +161,7 @@ static void egl_scanout_flush(DisplayChangeListener *dcl,
     }
 
     egl_fb_read(edpy->ds, &edpy->blit_fb);
-    dpy_gfx_update(edpy->dcl.con, x, y, w, h);
+    qemu_console_update(edpy->dcl.con, x, y, w, h);
 }
 
 static const DisplayChangeListenerOps egl_ops = {
diff --git a/ui/gtk-egl.c b/ui/gtk-egl.c
index fa8fe8970c1..7c5c9b2428c 100644
--- a/ui/gtk-egl.c
+++ b/ui/gtk-egl.c
@@ -108,7 +108,7 @@ void gd_egl_draw(VirtualConsole *vc)
                 qemu_set_fd_handler(fence_fd, gd_hw_gl_flushed, NULL, vc);
                 return;
             }
-            graphic_hw_gl_block(vc->gfx.dcl.con, false);
+            qemu_console_hw_gl_block(vc->gfx.dcl.con, false);
         }
 #endif
     } else {
@@ -176,7 +176,7 @@ void gd_egl_refresh(DisplayChangeListener *dcl)
         return;
     }
 
-    graphic_hw_update(dcl->con);
+    qemu_console_hw_update(dcl->con);
 
     if (vc->gfx.glupdates) {
         vc->gfx.glupdates = 0;
@@ -405,7 +405,7 @@ void gd_egl_flush(DisplayChangeListener *dcl,
 
     if (vc->gfx.guest_fb.dmabuf &&
         !qemu_dmabuf_get_draw_submitted(vc->gfx.guest_fb.dmabuf)) {
-        graphic_hw_gl_block(vc->gfx.dcl.con, true);
+        qemu_console_hw_gl_block(vc->gfx.dcl.con, true);
         qemu_dmabuf_set_draw_submitted(vc->gfx.guest_fb.dmabuf, true);
         gtk_egl_set_scanout_mode(vc, true);
         gtk_widget_queue_draw_area(area, x, y, w, h);
diff --git a/ui/gtk-gl-area.c b/ui/gtk-gl-area.c
index ce49000d3f1..23806b9d01b 100644
--- a/ui/gtk-gl-area.c
+++ b/ui/gtk-gl-area.c
@@ -131,7 +131,7 @@ void gd_gl_area_draw(VirtualConsole *vc)
                 qemu_set_fd_handler(fence_fd, gd_hw_gl_flushed, NULL, vc);
                 return;
             }
-            graphic_hw_gl_block(vc->gfx.dcl.con, false);
+            qemu_console_hw_gl_block(vc->gfx.dcl.con, false);
         }
 #endif
     } else {
@@ -195,7 +195,7 @@ void gd_gl_area_refresh(DisplayChangeListener *dcl)
         }
     }
 
-    graphic_hw_update(dcl->con);
+    qemu_console_hw_update(dcl->con);
 
     if (vc->gfx.glupdates) {
         vc->gfx.glupdates = 0;
@@ -347,7 +347,7 @@ void gd_gl_area_scanout_flush(DisplayChangeListener *dcl,
 
     if (vc->gfx.guest_fb.dmabuf &&
         !qemu_dmabuf_get_draw_submitted(vc->gfx.guest_fb.dmabuf)) {
-        graphic_hw_gl_block(vc->gfx.dcl.con, true);
+        qemu_console_hw_gl_block(vc->gfx.dcl.con, true);
         qemu_dmabuf_set_draw_submitted(vc->gfx.guest_fb.dmabuf, true);
         gtk_gl_area_set_scanout_mode(vc, true);
     }
diff --git a/ui/gtk.c b/ui/gtk.c
index ef3707b3634..2c61b601f78 100644
--- a/ui/gtk.c
+++ b/ui/gtk.c
@@ -436,7 +436,7 @@ static void gd_update(DisplayChangeListener *dcl,
 
 static void gd_refresh(DisplayChangeListener *dcl)
 {
-    graphic_hw_update(dcl->con);
+    qemu_console_hw_update(dcl->con);
 }
 
 static GdkDevice *gd_get_pointer(GdkDisplay *dpy)
@@ -602,7 +602,7 @@ void gd_hw_gl_flushed(void *vcon)
         qemu_set_fd_handler(fence_fd, NULL, NULL, NULL);
         close(fence_fd);
         qemu_dmabuf_set_fence_fd(dmabuf, -1);
-        graphic_hw_gl_block(vc->gfx.dcl.con, false);
+        qemu_console_hw_gl_block(vc->gfx.dcl.con, false);
     }
 }
 
@@ -729,27 +729,27 @@ static void gd_set_ui_refresh_rate(VirtualConsole *vc, int refresh_rate)
 {
     QemuUIInfo info;
 
-    if (!dpy_ui_info_supported(vc->gfx.dcl.con)) {
+    if (!qemu_console_ui_info_supported(vc->gfx.dcl.con)) {
         return;
     }
 
-    info = *dpy_get_ui_info(vc->gfx.dcl.con);
+    info = *qemu_console_get_ui_info(vc->gfx.dcl.con);
     info.refresh_rate = refresh_rate;
-    dpy_set_ui_info(vc->gfx.dcl.con, &info, true);
+    qemu_console_set_ui_info(vc->gfx.dcl.con, &info, true);
 }
 
 static void gd_set_ui_size(VirtualConsole *vc, gint width, gint height)
 {
     QemuUIInfo info;
 
-    if (!dpy_ui_info_supported(vc->gfx.dcl.con)) {
+    if (!qemu_console_ui_info_supported(vc->gfx.dcl.con)) {
         return;
     }
 
-    info = *dpy_get_ui_info(vc->gfx.dcl.con);
+    info = *qemu_console_get_ui_info(vc->gfx.dcl.con);
     info.width = width;
     info.height = height;
-    dpy_set_ui_info(vc->gfx.dcl.con, &info, true);
+    qemu_console_set_ui_info(vc->gfx.dcl.con, &info, true);
 }
 
 #if defined(CONFIG_OPENGL)
@@ -2333,7 +2333,7 @@ static GSList *gd_vc_gfx_init(GtkDisplayState *s, VirtualConsole *vc,
     gd_connect_vc_gfx_signals(vc);
     group = gd_vc_menu_init(s, vc, idx, group, view_menu);
 
-    if (dpy_ui_info_supported(vc->gfx.dcl.con)) {
+    if (qemu_console_ui_info_supported(vc->gfx.dcl.con)) {
         zoom_to_fit = true;
     }
     if (s->opts->u.gtk.has_zoom_to_fit) {
diff --git a/ui/sdl2-2d.c b/ui/sdl2-2d.c
index 73052383c2e..68a3aff7151 100644
--- a/ui/sdl2-2d.c
+++ b/ui/sdl2-2d.c
@@ -129,7 +129,7 @@ void sdl2_2d_refresh(DisplayChangeListener *dcl)
     struct sdl2_console *scon = container_of(dcl, struct sdl2_console, dcl);
 
     assert(!scon->opengl);
-    graphic_hw_update(dcl->con);
+    qemu_console_hw_update(dcl->con);
     sdl2_poll_events(scon);
 }
 
diff --git a/ui/sdl2-gl.c b/ui/sdl2-gl.c
index bb066cdd885..1547ad2f6f8 100644
--- a/ui/sdl2-gl.c
+++ b/ui/sdl2-gl.c
@@ -115,7 +115,7 @@ void sdl2_gl_refresh(DisplayChangeListener *dcl)
 
     assert(scon->opengl);
 
-    graphic_hw_update(dcl->con);
+    qemu_console_hw_update(dcl->con);
     if (scon->updates && scon->real_window) {
         scon->updates = 0;
         sdl2_gl_render_surface(scon);
diff --git a/ui/sdl2.c b/ui/sdl2.c
index 89516f95c41..4fcdbd79d3c 100644
--- a/ui/sdl2.c
+++ b/ui/sdl2.c
@@ -604,7 +604,7 @@ static void handle_windowevent(SDL_Event *ev)
                 .width = ev->window.data1,
                 .height = ev->window.data2,
             };
-            dpy_set_ui_info(scon->dcl.con, &info, true);
+            qemu_console_set_ui_info(scon->dcl.con, &info, true);
         }
         sdl2_redraw(scon);
         break;
@@ -632,10 +632,10 @@ static void handle_windowevent(SDL_Event *ev)
         }
         break;
     case SDL_WINDOWEVENT_RESTORED:
-        update_displaychangelistener(&scon->dcl, GUI_REFRESH_INTERVAL_DEFAULT);
+        qemu_console_listener_set_refresh(&scon->dcl, GUI_REFRESH_INTERVAL_DEFAULT);
         break;
     case SDL_WINDOWEVENT_MINIMIZED:
-        update_displaychangelistener(&scon->dcl, 500);
+        qemu_console_listener_set_refresh(&scon->dcl, 500);
         break;
     case SDL_WINDOWEVENT_CLOSE:
         if (qemu_console_is_graphic(scon->dcl.con)) {
diff --git a/ui/spice-display.c b/ui/spice-display.c
index 56d8140fad8..e3716127203 100644
--- a/ui/spice-display.c
+++ b/ui/spice-display.c
@@ -468,7 +468,7 @@ void qemu_spice_cursor_refresh_bh(void *opaque)
         assert(ssd->dcl.con);
         cursor_ref(c);
         qemu_mutex_unlock(&ssd->lock);
-        dpy_cursor_define(ssd->dcl.con, c);
+        qemu_console_set_cursor(ssd->dcl.con, c);
         qemu_mutex_lock(&ssd->lock);
         cursor_unref(c);
     }
@@ -481,7 +481,7 @@ void qemu_spice_cursor_refresh_bh(void *opaque)
         ssd->mouse_x = -1;
         ssd->mouse_y = -1;
         qemu_mutex_unlock(&ssd->lock);
-        dpy_mouse_set(ssd->dcl.con, x, y, true);
+        qemu_console_set_mouse(ssd->dcl.con, x, y, true);
     } else {
         qemu_mutex_unlock(&ssd->lock);
     }
@@ -489,7 +489,7 @@ void qemu_spice_cursor_refresh_bh(void *opaque)
 
 void qemu_spice_display_refresh(SimpleSpiceDisplay *ssd)
 {
-    graphic_hw_update(ssd->dcl.con);
+    qemu_console_hw_update(ssd->dcl.con);
 
     WITH_QEMU_LOCK_GUARD(&ssd->lock) {
         if (QTAILQ_EMPTY(&ssd->updates) && ssd->ds) {
@@ -668,7 +668,7 @@ static int interface_client_monitors_config(QXLInstance *sin,
     QemuUIInfo info;
     int head;
 
-    if (!dpy_ui_info_supported(ssd->dcl.con)) {
+    if (!qemu_console_ui_info_supported(ssd->dcl.con)) {
         return 0; /* == not supported by guest */
     }
 
@@ -676,7 +676,7 @@ static int interface_client_monitors_config(QXLInstance *sin,
         return 1;
     }
 
-    info = *dpy_get_ui_info(ssd->dcl.con);
+    info = *qemu_console_get_ui_info(ssd->dcl.con);
 
     head = qemu_console_get_index(ssd->dcl.con);
     if (mc->num_of_monitors > head) {
@@ -690,7 +690,7 @@ static int interface_client_monitors_config(QXLInstance *sin,
     }
 
     trace_qemu_spice_ui_info(ssd->qxl.id, info.width, info.height);
-    dpy_set_ui_info(ssd->dcl.con, &info, false);
+    qemu_console_set_ui_info(ssd->dcl.con, &info, false);
     return 1;
 }
 
@@ -817,7 +817,7 @@ static void qemu_spice_gl_block(SimpleSpiceDisplay *ssd, bool block)
     } else {
         timer_del(ssd->gl_unblock_timer);
     }
-    graphic_hw_gl_block(ssd->dcl.con, block);
+    qemu_console_hw_gl_block(ssd->dcl.con, block);
 }
 
 static void qemu_spice_gl_unblock_bh(void *opaque)
@@ -861,7 +861,7 @@ static void spice_gl_refresh(DisplayChangeListener *dcl)
         return;
     }
 
-    graphic_hw_update(dcl->con);
+    qemu_console_hw_update(dcl->con);
     if (ssd->gl_updates && ssd->have_surface) {
         qemu_spice_gl_block(ssd, true);
         glFlush();
diff --git a/ui/vnc.c b/ui/vnc.c
index e8c8773a36e..d3dfabede03 100644
--- a/ui/vnc.c
+++ b/ui/vnc.c
@@ -2325,8 +2325,8 @@ static void set_pixel_format(VncState *vs, int bits_per_pixel,
 
     set_pixel_conversion(vs);
 
-    graphic_hw_invalidate(vs->vd->dcl.con);
-    graphic_hw_update(vs->vd->dcl.con);
+    qemu_console_hw_invalidate(vs->vd->dcl.con);
+    qemu_console_hw_update(vs->vd->dcl.con);
 }
 
 static void pixel_format_message (VncState *vs) {
@@ -2384,7 +2384,7 @@ static int protocol_client_msg(VncState *vs, uint8_t *data, size_t len)
     VncDisplay *vd = vs->vd;
 
     if (data[0] > 3) {
-        update_displaychangelistener(&vd->dcl, VNC_REFRESH_INTERVAL_BASE);
+        qemu_console_listener_set_refresh(&vd->dcl, VNC_REFRESH_INTERVAL_BASE);
     }
 
     switch (data[0]) {
@@ -2638,9 +2638,9 @@ static int protocol_client_msg(VncState *vs, uint8_t *data, size_t len)
         h = read_u16(data, 4);
 
         trace_vnc_msg_client_set_desktop_size(vs, vs->ioc, w, h, screens);
-        if (dpy_ui_info_supported(vs->vd->dcl.con)) {
+        if (qemu_console_ui_info_supported(vs->vd->dcl.con)) {
             QemuUIInfo info = { .width = w, .height = h };
-            dpy_set_ui_info(vs->vd->dcl.con, &info, false);
+            qemu_console_set_ui_info(vs->vd->dcl.con, &info, false);
             vnc_desktop_resize_ext(vs, 4 /* Request forwarded */);
         } else {
             vnc_desktop_resize_ext(vs, 3 /* Invalid screen layout */);
@@ -3242,14 +3242,14 @@ static void vnc_refresh(DisplayChangeListener *dcl)
     int has_dirty, rects = 0;
 
     if (QTAILQ_EMPTY(&vd->clients)) {
-        update_displaychangelistener(&vd->dcl, VNC_REFRESH_INTERVAL_MAX);
+        qemu_console_listener_set_refresh(&vd->dcl, VNC_REFRESH_INTERVAL_MAX);
         return;
     }
 
-    graphic_hw_update(vd->dcl.con);
+    qemu_console_hw_update(vd->dcl.con);
 
     if (vnc_trylock_display(vd)) {
-        update_displaychangelistener(&vd->dcl, VNC_REFRESH_INTERVAL_BASE);
+        qemu_console_listener_set_refresh(&vd->dcl, VNC_REFRESH_INTERVAL_BASE);
         return;
     }
 
@@ -3323,7 +3323,7 @@ static void vnc_connect(VncDisplay *vd, QIOChannelSocket *sioc,
               sioc, websocket, vs->auth, vs->subauth);
 
     VNC_DEBUG("New client on socket %p\n", vs->sioc);
-    update_displaychangelistener(&vd->dcl, VNC_REFRESH_INTERVAL_BASE);
+    qemu_console_listener_set_refresh(&vd->dcl, VNC_REFRESH_INTERVAL_BASE);
     qio_channel_set_blocking(vs->ioc, false, &error_abort);
     g_clear_handle_id(&vs->ioc_tag, g_source_remove);
     if (websocket) {
@@ -3363,7 +3363,7 @@ static void vnc_connect(VncDisplay *vd, QIOChannelSocket *sioc,
         vnc_update_server_surface(vd);
     }
 
-    graphic_hw_update(vd->dcl.con);
+    qemu_console_hw_update(vd->dcl.con);
 
     if (!vs->websocket) {
         vnc_start_protocol(vs);
@@ -3419,7 +3419,7 @@ static void vmstate_change_handler(void *opaque, bool running, RunState state)
     if (state != RUN_STATE_RUNNING) {
         return;
     }
-    update_displaychangelistener(&vd->dcl, VNC_REFRESH_INTERVAL_BASE);
+    qemu_console_listener_set_refresh(&vd->dcl, VNC_REFRESH_INTERVAL_BASE);
 }
 
 static bool vnc_display_open(VncDisplay *vd, Error **errp);
diff --git a/hw/display/apple-gfx.m b/hw/display/apple-gfx.m
index 77d80fb7cef..be0061b9db2 100644
--- a/hw/display/apple-gfx.m
+++ b/hw/display/apple-gfx.m
@@ -317,8 +317,8 @@ static void apple_gfx_render_frame_completed_bh(void *opaque)
             copy_mtl_texture_to_surface_mem(s->texture, surface_data(s->surface));
             if (s->gfx_update_requested) {
                 s->gfx_update_requested = false;
-                dpy_gfx_update_full(s->con);
-                graphic_hw_update_done(s->con);
+                qemu_console_update_full(s->con);
+                qemu_console_hw_update_done(s->con);
                 s->new_frame_ready = false;
             } else {
                 s->new_frame_ready = true;
@@ -337,7 +337,7 @@ static bool apple_gfx_fb_update_display(void *opaque)
 
     assert(bql_locked());
     if (s->new_frame_ready) {
-        dpy_gfx_update_full(s->con);
+        qemu_console_update_full(s->con);
         s->new_frame_ready = false;
     } else if (s->pending_frames > 0) {
         s->gfx_update_requested = true;
@@ -380,14 +380,14 @@ static void set_mode(AppleGFXState *s, uint32_t width, uint32_t height)
             (s->texture.storageMode == MTLStorageModeManaged);
     }
 
-    dpy_gfx_replace_surface(s->con, s->surface);
+    qemu_console_set_surface(s->con, s->surface);
 }
 
 static void update_cursor(AppleGFXState *s)
 {
     assert(bql_locked());
-    dpy_mouse_set(s->con, s->pgdisp.cursorPosition.x,
-                  s->pgdisp.cursorPosition.y, qatomic_read(&s->cursor_show));
+    qemu_console_set_mouse(s->con, s->pgdisp.cursorPosition.x,
+                           s->pgdisp.cursorPosition.y, qatomic_read(&s->cursor_show));
 }
 
 static void update_cursor_bh(void *opaque)
@@ -443,7 +443,7 @@ static void set_cursor_glyph(void *opaque)
             }
             px_data += padding_bytes_per_row;
         }
-        dpy_cursor_define(s->con, s->cursor);
+        qemu_console_set_cursor(s->con, s->cursor);
         update_cursor(s);
     }
     [glyph release];
@@ -792,7 +792,7 @@ bool apple_gfx_common_realize(AppleGFXState *s, DeviceState *dev,
         apple_gfx_create_display_mode_array(display_modes, num_display_modes);
     [mode_array release];
 
-    s->con = graphic_console_init(dev, 0, &apple_gfx_fb_ops, s);
+    s->con = qemu_graphic_console_create(dev, 0, &apple_gfx_fb_ops, s);
     return true;
 }
 
diff --git a/ui/cocoa.m b/ui/cocoa.m
index aaf82421589..98394cdc507 100644
--- a/ui/cocoa.m
+++ b/ui/cocoa.m
@@ -421,7 +421,7 @@ - (void) selectConsoleLocked:(unsigned int)index
         return;
     }
 
-    unregister_displaychangelistener(&dcl);
+    qemu_console_unregister_listener(&dcl);
     qkbd_state_switch_console(kbd, con);
     qemu_console_register_listener(con, &dcl, &dcl_ops);
     [self notifyMouseModeChange];
@@ -669,8 +669,8 @@ - (void) updateUIInfoLocked
             CVTime period = CVDisplayLinkGetNominalOutputVideoRefreshPeriod(displayLink);
             CVDisplayLinkRelease(displayLink);
             if (!(period.flags & kCVTimeIsIndefinite)) {
-                update_displaychangelistener(&dcl,
-                                             1000 * period.timeValue / period.timeScale);
+                qemu_console_listener_set_refresh(&dcl,
+                                                  1000 * period.timeValue / period.timeScale);
                 info.refresh_rate = (int64_t)1000 * period.timeScale / period.timeValue;
             }
         }
@@ -688,7 +688,7 @@ - (void) updateUIInfoLocked
     info.width = frameSize.width * [[self window] backingScaleFactor];
     info.height = frameSize.height * [[self window] backingScaleFactor];
 
-    dpy_set_ui_info(dcl.con, &info, TRUE);
+    qemu_console_set_ui_info(dcl.con, &info, TRUE);
 }
 
 #pragma clang diagnostic pop
@@ -2056,7 +2056,7 @@ static void cocoa_refresh(DisplayChangeListener *dcl)
     NSAutoreleasePool * pool = [[NSAutoreleasePool alloc] init];
 
     COCOA_DEBUG("qemu_cocoa: cocoa_refresh\n");
-    graphic_hw_update(dcl->con);
+    qemu_console_hw_update(dcl->con);
 
     if (cbchangecount != [[NSPasteboard generalPasteboard] changeCount]) {
         qemu_clipboard_info_unref(cbinfo);
-- 
2.54.0


