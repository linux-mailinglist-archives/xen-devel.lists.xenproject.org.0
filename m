Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 114784C55B9
	for <lists+xen-devel@lfdr.de>; Sat, 26 Feb 2022 12:55:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.279765.477591 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nNvfp-0008AS-Ag; Sat, 26 Feb 2022 11:55:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 279765.477591; Sat, 26 Feb 2022 11:55:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nNvfp-000883-7X; Sat, 26 Feb 2022 11:55:41 +0000
Received: by outflank-mailman (input) for mailman id 279765;
 Sat, 26 Feb 2022 11:55:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=r031=TJ=gmail.com=akihiko.odaki@srs-se1.protection.inumbo.net>)
 id 1nNvfo-0007Uo-7o
 for xen-devel@lists.xenproject.org; Sat, 26 Feb 2022 11:55:40 +0000
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com
 [2607:f8b0:4864:20::1029])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 03bfce9f-96fb-11ec-8539-5f4723681683;
 Sat, 26 Feb 2022 12:55:39 +0100 (CET)
Received: by mail-pj1-x1029.google.com with SMTP id
 h17-20020a17090acf1100b001bc68ecce4aso10685190pju.4
 for <xen-devel@lists.xenproject.org>; Sat, 26 Feb 2022 03:55:39 -0800 (PST)
Received: from localhost.localdomain
 ([2400:4050:c360:8200:4c8a:825a:fb9a:12f3])
 by smtp.gmail.com with ESMTPSA id
 pi16-20020a17090b1e5000b001bd1ffaf2basm1323761pjb.0.2022.02.26.03.55.35
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Sat, 26 Feb 2022 03:55:37 -0800 (PST)
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
X-Inumbo-ID: 03bfce9f-96fb-11ec-8539-5f4723681683
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=1vVq5QSmFweuWNBdaYFtPRKPL3G9SHsp3hf2KVemRVo=;
        b=Y2+1zlnn4e2aOoUS/40z8+sK0+GHbu2IDCJKBrw6ym7cvsqogLskQzaDpI+4NzPStq
         fCbnbPNjpS36ByBqAxPA3Gf8FAnZmhZ2W0GtHN1NTpBTd7WVcEuZaenGC0xNiRH4IFJv
         0BRaqXxTI1LUCWMjoDXvUKnRRWslB1bWM2VTUWrUhKoHbU6y3XaXjZ4dsKOVWE8cMm/p
         5/GLFLpLWK4kefelCJte5v93tlm9W76ZeWNXM7jrEjfpcteMxKi9CugiZKrMycPZKTIh
         FHMnpOSu2GQtwB9yhO2uIrLa+UpcqUTPBKJ52O8Twk/GCCeAzB1u+OyouiJWxDXvQ521
         sXbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=1vVq5QSmFweuWNBdaYFtPRKPL3G9SHsp3hf2KVemRVo=;
        b=J30iP38p/W8p4f2YVvlTCG6OA4KyrPNQWlzDVqAzdzTv0lL9HKhUfyuFqrZDGKghN6
         gECmC25cHTBVOpiQBT+8mWAzrdA9DUpegrx3NU62TDqJXm5Vo/D0E3YWo0vUUOrjM2tC
         ZmLUb87AdUhGrRPvx5/JCgP2mWrwAV3wiEiOn3pU3HGwh0CfMOP6o8ejNivoMYHw/0hD
         BL31HGrxjWZjE0sgWc5LltWqEhOp3rVPPhsS1jBpVBogd9iZ+EKzAP08GvTEl1oLVkMc
         dMnUAOiqzY6tqzH3fvFzihZbdas+z4ZmPoIxBgcnSHEe07l0LKmw9McLvFQ4b2Uo4keg
         Vm4w==
X-Gm-Message-State: AOAM531KvGxlljJf00TZsTifB8lEvXJByEfF/dyLUo+Zc8+jwkBeQd5E
	fGy5/uMrHl2uyizXx69kqyM=
X-Google-Smtp-Source: ABdhPJzv9vpq6EwhjOpHjxz1l51nFl8tdgYInJJ4xyQ8eyJ/15tOXY5qM2/17GCtdoEvEc2qD2VD8g==
X-Received: by 2002:a17:902:9045:b0:14f:14e7:f3aa with SMTP id w5-20020a170902904500b0014f14e7f3aamr11257393plz.69.1645876538010;
        Sat, 26 Feb 2022 03:55:38 -0800 (PST)
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
Subject: [PATCH v3 1/3] ui/console: Do not return a value with ui_info
Date: Sat, 26 Feb 2022 20:55:14 +0900
Message-Id: <20220226115516.59830-2-akihiko.odaki@gmail.com>
X-Mailer: git-send-email 2.32.0 (Apple Git-132)
In-Reply-To: <20220226115516.59830-1-akihiko.odaki@gmail.com>
References: <20220226115516.59830-1-akihiko.odaki@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The returned value is not used and misleading.

Signed-off-by: Akihiko Odaki <akihiko.odaki@gmail.com>
---
 hw/display/virtio-gpu-base.c | 6 +++---
 hw/display/virtio-vga.c      | 5 ++---
 hw/vfio/display.c            | 8 +++-----
 include/ui/console.h         | 2 +-
 4 files changed, 9 insertions(+), 12 deletions(-)

diff --git a/hw/display/virtio-gpu-base.c b/hw/display/virtio-gpu-base.c
index fff0fb4a828..c73b3aa06b8 100644
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
index 5a2f7a45408..84433d3557e 100644
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
index 89bc90508fb..78f4d82c1c3 100644
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
diff --git a/include/ui/console.h b/include/ui/console.h
index f590819880b..7f5374380f0 100644
--- a/include/ui/console.h
+++ b/include/ui/console.h
@@ -427,7 +427,7 @@ typedef struct GraphicHwOps {
     bool gfx_update_async; /* if true, calls graphic_hw_update_done() */
     void (*text_update)(void *opaque, console_ch_t *text);
     void (*update_interval)(void *opaque, uint64_t interval);
-    int (*ui_info)(void *opaque, uint32_t head, QemuUIInfo *info);
+    void (*ui_info)(void *opaque, uint32_t head, QemuUIInfo *info);
     void (*gl_block)(void *opaque, bool block);
 } GraphicHwOps;
 
-- 
2.32.0 (Apple Git-132)


