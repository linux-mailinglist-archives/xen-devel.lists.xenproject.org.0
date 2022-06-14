Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DE1454B060
	for <lists+xen-devel@lfdr.de>; Tue, 14 Jun 2022 14:18:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.348902.575173 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o15V6-0005xT-6e; Tue, 14 Jun 2022 12:18:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 348902.575173; Tue, 14 Jun 2022 12:18:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o15V6-0005vN-2b; Tue, 14 Jun 2022 12:18:28 +0000
Received: by outflank-mailman (input) for mailman id 348902;
 Tue, 14 Jun 2022 12:18:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Hf0K=WV=redhat.com=kraxel@srs-se1.protection.inumbo.net>)
 id 1o15TE-0008Ek-0O
 for xen-devel@lists.xenproject.org; Tue, 14 Jun 2022 12:16:32 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d1a756ad-ebdb-11ec-bd2c-47488cf2e6aa;
 Tue, 14 Jun 2022 14:16:29 +0200 (CEST)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-638-SPez3mJKOCOnjtiYtyhytA-1; Tue, 14 Jun 2022 08:16:23 -0400
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C031F811E75;
 Tue, 14 Jun 2022 12:16:22 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.192.40])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 87A64492CA2;
 Tue, 14 Jun 2022 12:16:22 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id A63A51800795; Tue, 14 Jun 2022 14:16:11 +0200 (CEST)
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
X-Inumbo-ID: d1a756ad-ebdb-11ec-bd2c-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1655208988;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hTTJvnegxxvfJsWseZ7+SmUjba5GRnY9ME/e3uOvaP0=;
	b=fM0UcOn3HF8EuPfT/s9sr9Cy2VW8NGbn3nnyQMVRu0zkJ/xs3WY01nkNh5ZEOvng9YPeHy
	O+3ry2BTSPrfRkdfnV76RPVl+66eXydPINuOucAw13NtKxcwPhXbgCA+0GH4FdJTgu417+
	DP8T0sXmlxEjh/dcHpmOM33rCe+9qhI=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1655208988;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hTTJvnegxxvfJsWseZ7+SmUjba5GRnY9ME/e3uOvaP0=;
	b=fM0UcOn3HF8EuPfT/s9sr9Cy2VW8NGbn3nnyQMVRu0zkJ/xs3WY01nkNh5ZEOvng9YPeHy
	O+3ry2BTSPrfRkdfnV76RPVl+66eXydPINuOucAw13NtKxcwPhXbgCA+0GH4FdJTgu417+
	DP8T0sXmlxEjh/dcHpmOM33rCe+9qhI=
X-MC-Unique: SPez3mJKOCOnjtiYtyhytA-1
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Cc: Akihiko Odaki <akihiko.odaki@gmail.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Alex Williamson <alex.williamson@redhat.com>,
	xen-devel@lists.xenproject.org,
	Paul Durrant <paul@xen.org>,
	Anthony Perard <anthony.perard@citrix.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	"Hongren (Zenithal) Zheng" <i@zenithal.me>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	"Canokeys.org" <contact@canokeys.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Gerd Hoffmann <kraxel@redhat.com>
Subject: [PULL 13/15] ui/console: Do not return a value with ui_info
Date: Tue, 14 Jun 2022 14:16:08 +0200
Message-Id: <20220614121610.508356-14-kraxel@redhat.com>
In-Reply-To: <20220614121610.508356-1-kraxel@redhat.com>
References: <20220614121610.508356-1-kraxel@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9

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


