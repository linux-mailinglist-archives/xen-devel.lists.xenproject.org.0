Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A48C5461CB
	for <lists+xen-devel@lfdr.de>; Fri, 10 Jun 2022 11:23:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.346156.571966 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nzarj-0004ky-L9; Fri, 10 Jun 2022 09:23:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 346156.571966; Fri, 10 Jun 2022 09:23:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nzarj-0004i1-HI; Fri, 10 Jun 2022 09:23:39 +0000
Received: by outflank-mailman (input) for mailman id 346156;
 Fri, 10 Jun 2022 09:23:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=2HR3=WR=redhat.com=kraxel@srs-se1.protection.inumbo.net>)
 id 1nzapx-0005HE-V4
 for xen-devel@lists.xenproject.org; Fri, 10 Jun 2022 09:21:49 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c0bd9420-e89e-11ec-bd2c-47488cf2e6aa;
 Fri, 10 Jun 2022 11:21:48 +0200 (CEST)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-353-U1-fgaTYNJC2qVYGl5-reA-1; Fri, 10 Jun 2022 05:21:44 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DCDE0800971;
 Fri, 10 Jun 2022 09:21:43 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.192.40])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9C9F22166B29;
 Fri, 10 Jun 2022 09:21:43 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id B26AF180091C; Fri, 10 Jun 2022 11:20:45 +0200 (CEST)
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
X-Inumbo-ID: c0bd9420-e89e-11ec-bd2c-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1654852907;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fjkT/ghvgIP+ASWCtRqN8cFZ3mDw+gAHZxFgoi4zHGM=;
	b=cG5Ik6AJ6C1McVqi6U77m0ezhnMX6gSZgJZoaWoceLI8BZYMTv+AVIOr9g3mF/F0qMvHJR
	eliTcOI2TOUFQl7j5YgdxkE14LAZkKdx4zml/5QwpJ6WP6Y7Vpvt/YY4n4LTGAY48pRZsq
	BgNrMrJicC6DKOoSvPK/kwS9gY50CsI=
X-MC-Unique: U1-fgaTYNJC2qVYGl5-reA-1
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Cc: "Canokeys.org" <contact@canokeys.org>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Anthony Perard <anthony.perard@citrix.com>,
	Paul Durrant <paul@xen.org>,
	Akihiko Odaki <akihiko.odaki@gmail.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	"Hongren (Zenithal) Zheng" <i@zenithal.me>,
	xen-devel@lists.xenproject.org,
	Alex Williamson <alex.williamson@redhat.com>,
	Gerd Hoffmann <kraxel@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PULL 17/17] virtio-gpu: Respect UI refresh rate for EDID
Date: Fri, 10 Jun 2022 11:20:43 +0200
Message-Id: <20220610092043.1874654-18-kraxel@redhat.com>
In-Reply-To: <20220610092043.1874654-1-kraxel@redhat.com>
References: <20220610092043.1874654-1-kraxel@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6

From: Akihiko Odaki <akihiko.odaki@gmail.com>

Signed-off-by: Akihiko Odaki <akihiko.odaki@gmail.com>
Message-Id: <20220226115516.59830-4-akihiko.odaki@gmail.com>
Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 include/hw/virtio/virtio-gpu.h | 1 +
 hw/display/virtio-gpu-base.c   | 1 +
 hw/display/virtio-gpu.c        | 1 +
 3 files changed, 3 insertions(+)

diff --git a/include/hw/virtio/virtio-gpu.h b/include/hw/virtio/virtio-gpu.h
index afff9e158e31..2e28507efe21 100644
--- a/include/hw/virtio/virtio-gpu.h
+++ b/include/hw/virtio/virtio-gpu.h
@@ -80,6 +80,7 @@ struct virtio_gpu_scanout {
 struct virtio_gpu_requested_state {
     uint16_t width_mm, height_mm;
     uint32_t width, height;
+    uint32_t refresh_rate;
     int x, y;
 };
 
diff --git a/hw/display/virtio-gpu-base.c b/hw/display/virtio-gpu-base.c
index b21d6e5b0be8..a29f191aa82e 100644
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
index 55c6dd576318..20cc703dcc6e 100644
--- a/hw/display/virtio-gpu.c
+++ b/hw/display/virtio-gpu.c
@@ -217,6 +217,7 @@ virtio_gpu_generate_edid(VirtIOGPU *g, int scanout,
         .height_mm = b->req_state[scanout].height_mm,
         .prefx = b->req_state[scanout].width,
         .prefy = b->req_state[scanout].height,
+        .refresh_rate = b->req_state[scanout].refresh_rate,
     };
 
     edid->size = cpu_to_le32(sizeof(edid->edid));
-- 
2.36.1


