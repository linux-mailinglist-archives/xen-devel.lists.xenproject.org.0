Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C3BDF4C55BB
	for <lists+xen-devel@lfdr.de>; Sat, 26 Feb 2022 12:55:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.279768.477614 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nNvfv-0000Pf-07; Sat, 26 Feb 2022 11:55:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 279768.477614; Sat, 26 Feb 2022 11:55:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nNvfu-0000MT-Py; Sat, 26 Feb 2022 11:55:46 +0000
Received: by outflank-mailman (input) for mailman id 279768;
 Sat, 26 Feb 2022 11:55:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=r031=TJ=gmail.com=akihiko.odaki@srs-se1.protection.inumbo.net>)
 id 1nNvft-0007Uo-0n
 for xen-devel@lists.xenproject.org; Sat, 26 Feb 2022 11:55:45 +0000
Received: from mail-pg1-x52e.google.com (mail-pg1-x52e.google.com
 [2607:f8b0:4864:20::52e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 069f38a2-96fb-11ec-8539-5f4723681683;
 Sat, 26 Feb 2022 12:55:44 +0100 (CET)
Received: by mail-pg1-x52e.google.com with SMTP id z4so7097706pgh.12
 for <xen-devel@lists.xenproject.org>; Sat, 26 Feb 2022 03:55:44 -0800 (PST)
Received: from localhost.localdomain
 ([2400:4050:c360:8200:4c8a:825a:fb9a:12f3])
 by smtp.gmail.com with ESMTPSA id
 pi16-20020a17090b1e5000b001bd1ffaf2basm1323761pjb.0.2022.02.26.03.55.40
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Sat, 26 Feb 2022 03:55:42 -0800 (PST)
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
X-Inumbo-ID: 069f38a2-96fb-11ec-8539-5f4723681683
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=PA+WCteHQO0lrRBLqQfQaqZn8q0hOOjrSckhEBEspgs=;
        b=a1g9gVxd2qro29ukrrigoEDwnnpi9zUsQ6NGUQw0EWmx88h1QRpnLxAQq8v9q+5LyL
         nrasmCejv4KpqaD93Mn2pF9UQuOIakgjqtPS3bjQzBwcSiV7GcEcl2FU1UTI25HtBdh3
         ceReknBXMSr3qWzYK4yqmC9jtJT9oaEigIojPRzsQYFIQ4pMhq5b2cGJAc4WUKZlPYnB
         h+6Da2fxzrk6+ssM3tQR+EW74qlJE7nwq+GykYolK3YiAH1/HIq95LjdoHI5zGlRTXdJ
         EDyDfFvKGToc8C7aeT8I9+1AUS9Lw3F3glHr5Ac701NZamZ34L72GpnW7VI/3b6WU+NN
         SOiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=PA+WCteHQO0lrRBLqQfQaqZn8q0hOOjrSckhEBEspgs=;
        b=VSlz1CJ2sPsk1aL4A8Sm4xl2De9JC//XJIln31DmMqVHAl5oBtMpE1O74vMX5ZTXTr
         qb3q2/8+GK5fcUP7b0BHieVhHmHEbNFW2Vetk3gHS6cguogb6DXcUBN+cYRj4+iMS+p9
         FUMCsHLEkSr6uURStySzrDWc3Yysau/IuQETZ6ffI5j8DIRfD6J2ZhiOTkDreLGDX0/P
         PpIClPHNwiH0XzSXxlV3e5xejY6HfD01tzjtEBQxVoQT7kln999m2HSt0tvCy3RTXzmG
         Dd1jNB4oIN6eY2qCDB1S92wWr3vFnP9jHSuzAfUvxmPYg6H9kvJ6l7sWL/YsY4TnOXbZ
         7ahQ==
X-Gm-Message-State: AOAM530txvxrpXsIoWNxpIT1pSG7CKQShqK4aNY30THJCvnMtSDNDCxL
	FQiPU26rU6MPUGa0S+BLvCM=
X-Google-Smtp-Source: ABdhPJyhtEwvZRT3/rGv5Q5kdFQg3/iO52gQvR2WGuc3llR8Ktgjshhnz8w9A2PJPg5VEwIxDnpkhw==
X-Received: by 2002:a05:6a00:1a56:b0:4c6:fe0c:2e27 with SMTP id h22-20020a056a001a5600b004c6fe0c2e27mr12200504pfv.65.1645876542871;
        Sat, 26 Feb 2022 03:55:42 -0800 (PST)
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
Subject: [PATCH v3 3/3] virtio-gpu: Respect UI refresh rate for EDID
Date: Sat, 26 Feb 2022 20:55:16 +0900
Message-Id: <20220226115516.59830-4-akihiko.odaki@gmail.com>
X-Mailer: git-send-email 2.32.0 (Apple Git-132)
In-Reply-To: <20220226115516.59830-1-akihiko.odaki@gmail.com>
References: <20220226115516.59830-1-akihiko.odaki@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Akihiko Odaki <akihiko.odaki@gmail.com>
---
 hw/display/virtio-gpu-base.c   | 1 +
 hw/display/virtio-gpu.c        | 1 +
 include/hw/virtio/virtio-gpu.h | 1 +
 3 files changed, 3 insertions(+)

diff --git a/hw/display/virtio-gpu-base.c b/hw/display/virtio-gpu-base.c
index c73b3aa06b8..ee2587a8c36 100644
--- a/hw/display/virtio-gpu-base.c
+++ b/hw/display/virtio-gpu-base.c
@@ -79,6 +79,7 @@ static void virtio_gpu_ui_info(void *opaque, uint32_t idx, QemuUIInfo *info)
 
     g->req_state[idx].x = info->xoff;
     g->req_state[idx].y = info->yoff;
+    g->req_state[idx].refresh_rate = info->refresh_rate;
     g->req_state[idx].width = info->width;
     g->req_state[idx].height = info->height;
     g->req_state[idx].width_mm = info->width_mm;
diff --git a/hw/display/virtio-gpu.c b/hw/display/virtio-gpu.c
index c6dc818988c..04fbbd1f8f3 100644
--- a/hw/display/virtio-gpu.c
+++ b/hw/display/virtio-gpu.c
@@ -217,6 +217,7 @@ virtio_gpu_generate_edid(VirtIOGPU *g, int scanout,
         .height_mm = b->req_state[scanout].height_mm,
         .prefx = b->req_state[scanout].width,
         .prefy = b->req_state[scanout].height,
+        .refresh_rate = b->req_state[scanout].refresh_rate,
     };
 
     edid->size = cpu_to_le32(sizeof(edid->edid));
diff --git a/include/hw/virtio/virtio-gpu.h b/include/hw/virtio/virtio-gpu.h
index 2179b757037..09a317e1a7a 100644
--- a/include/hw/virtio/virtio-gpu.h
+++ b/include/hw/virtio/virtio-gpu.h
@@ -81,6 +81,7 @@ struct virtio_gpu_scanout {
 struct virtio_gpu_requested_state {
     uint16_t width_mm, height_mm;
     uint32_t width, height;
+    uint32_t refresh_rate;
     int x, y;
 };
 
-- 
2.32.0 (Apple Git-132)


