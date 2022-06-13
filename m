Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BB815484DE
	for <lists+xen-devel@lfdr.de>; Mon, 13 Jun 2022 13:37:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.347981.574378 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o0iNj-0006Kb-IH; Mon, 13 Jun 2022 11:37:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 347981.574378; Mon, 13 Jun 2022 11:37:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o0iNi-00063G-Lx; Mon, 13 Jun 2022 11:37:18 +0000
Received: by outflank-mailman (input) for mailman id 347981;
 Mon, 13 Jun 2022 11:37:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=SJWo=WU=redhat.com=kraxel@srs-se1.protection.inumbo.net>)
 id 1o0iNe-0003eY-8x
 for xen-devel@lists.xenproject.org; Mon, 13 Jun 2022 11:37:14 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2a964cce-eb0d-11ec-bd2c-47488cf2e6aa;
 Mon, 13 Jun 2022 13:37:13 +0200 (CEST)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-382-FkGXzRJ0PEWejaqlg6YRjg-1; Mon, 13 Jun 2022 07:37:09 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D7C5685A580;
 Mon, 13 Jun 2022 11:37:08 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.192.40])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9D66940CF8EB;
 Mon, 13 Jun 2022 11:37:08 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 9C5BB1800995; Mon, 13 Jun 2022 13:36:56 +0200 (CEST)
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
X-Inumbo-ID: 2a964cce-eb0d-11ec-bd2c-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1655120232;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hTTJvnegxxvfJsWseZ7+SmUjba5GRnY9ME/e3uOvaP0=;
	b=BrBYKwRauwgZI0QtOUWV3bf9up6SdDUFYcu6ACMNpqH0sxvYuYXeDfcat53CMkSb6evpcE
	Ii1xzDZVNPAlJckIr0cdg1pcD2fzbyEWasenRbKOrDGYJVkE+G2z0i/F8uBJvO7Ky9RvKG
	gYTy+PA9UOGi+yZuLybZKuW7W0D6GH4=
X-MC-Unique: FkGXzRJ0PEWejaqlg6YRjg-1
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
Subject: [PULL 13/16] ui/console: Do not return a value with ui_info
Date: Mon, 13 Jun 2022 13:36:52 +0200
Message-Id: <20220613113655.3693872-14-kraxel@redhat.com>
In-Reply-To: <20220613113655.3693872-1-kraxel@redhat.com>
References: <20220613113655.3693872-1-kraxel@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1

From: Akihiko Odaki <akihiko.odaki@gmail.com>

The returned value is not used and misleading.

Signed-off-by: Akihiko Odaki <akihiko.odaki@gmail.com>
Message-Id: <20220226115516.59830-2-akihiko.odaki@gmail.com>
Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 include/ui/console.h         | 2 +-
 hw/display/virtio-gpu-base.c | 6 +++---
 hw/display/virtio-vga.c      | 5 ++---
 hw/vfio/display.c            | 8 +++-----
 4 files changed, 9 insertions(+), 12 deletions(-)

diff --git a/include/ui/console.h b/include/ui/console.h
index c44b28a972ca..642d6f5248cf 100644
--- a/include/ui/console.h
+++ b/include/ui/console.h
@@ -432,7 +432,7 @@ typedef struct GraphicHwOps {
     bool gfx_update_async; /* if true, calls graphic_hw_update_done() */
     void (*text_update)(void *opaque, console_ch_t *text);
     void (*update_interval)(void *opaque, uint64_t interval);
-    int (*ui_info)(void *opaque, uint32_t head, QemuUIInfo *info);
+    void (*ui_info)(void *opaque, uint32_t head, QemuUIInfo *info);
     void (*gl_block)(void *opaque, bool block);
 } GraphicHwOps;
 
diff --git a/hw/display/virtio-gpu-base.c b/hw/display/virtio-gpu-base.c
index 790cec333c8c..b21d6e5b0be8 100644
--- a/hw/display/virtio-gpu-base.c
+++ b/hw/display/virtio-gpu-base.c
@@ -69,12 +69,12 @@ static void virtio_gpu_notify_event(VirtIOGPUBase *g, uint32_t event_type)
     virtio_notify_config(&g->parent_obj);
 }
 
-static int virtio_gpu_ui_info(void *opaque, uint32_t idx, QemuUIInfo *info)
+static void virtio_gpu_ui_info(void *opaque, uint32_t idx, QemuUIInfo *info)
 {
     VirtIOGPUBase *g = opaque;
 
     if (idx >= g->conf.max_outputs) {
-        return -1;
+        return;
     }
 
     g->req_state[idx].x = info->xoff;
@@ -92,7 +92,7 @@ static int virtio_gpu_ui_info(void *opaque, uint32_t idx, QemuUIInfo *info)
 
     /* send event to guest */
     virtio_gpu_notify_event(g, VIRTIO_GPU_EVENT_DISPLAY);
-    return 0;
+    return;
 }
 
 static void
diff --git a/hw/display/virtio-vga.c b/hw/display/virtio-vga.c
index c206b5da384b..4dcb34c4a740 100644
--- a/hw/display/virtio-vga.c
+++ b/hw/display/virtio-vga.c
@@ -47,15 +47,14 @@ static void virtio_vga_base_text_update(void *opaque, console_ch_t *chardata)
     }
 }
 
-static int virtio_vga_base_ui_info(void *opaque, uint32_t idx, QemuUIInfo *info)
+static void virtio_vga_base_ui_info(void *opaque, uint32_t idx, QemuUIInfo *info)
 {
     VirtIOVGABase *vvga = opaque;
     VirtIOGPUBase *g = vvga->vgpu;
 
     if (g->hw_ops->ui_info) {
-        return g->hw_ops->ui_info(g, idx, info);
+        g->hw_ops->ui_info(g, idx, info);
     }
-    return -1;
 }
 
 static void virtio_vga_base_gl_block(void *opaque, bool block)
diff --git a/hw/vfio/display.c b/hw/vfio/display.c
index 89bc90508fb8..78f4d82c1c35 100644
--- a/hw/vfio/display.c
+++ b/hw/vfio/display.c
@@ -106,14 +106,14 @@ err:
     return;
 }
 
-static int vfio_display_edid_ui_info(void *opaque, uint32_t idx,
-                                     QemuUIInfo *info)
+static void vfio_display_edid_ui_info(void *opaque, uint32_t idx,
+                                      QemuUIInfo *info)
 {
     VFIOPCIDevice *vdev = opaque;
     VFIODisplay *dpy = vdev->dpy;
 
     if (!dpy->edid_regs) {
-        return 0;
+        return;
     }
 
     if (info->width && info->height) {
@@ -121,8 +121,6 @@ static int vfio_display_edid_ui_info(void *opaque, uint32_t idx,
     } else {
         vfio_display_edid_update(vdev, false, 0, 0);
     }
-
-    return 0;
 }
 
 static void vfio_display_edid_init(VFIOPCIDevice *vdev)
-- 
2.36.1


