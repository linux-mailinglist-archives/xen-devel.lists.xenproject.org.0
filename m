Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B4298D85E1
	for <lists+xen-devel@lfdr.de>; Mon,  3 Jun 2024 17:19:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.734954.1141100 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sE9SH-0003Fc-00; Mon, 03 Jun 2024 15:18:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 734954.1141100; Mon, 03 Jun 2024 15:18:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sE9SG-0003Dy-Ry; Mon, 03 Jun 2024 15:18:36 +0000
Received: by outflank-mailman (input) for mailman id 734954;
 Mon, 03 Jun 2024 15:18:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=3DZA=NF=redhat.com=kraxel@srs-se1.protection.inumbo.net>)
 id 1sE9SE-0002zU-U7
 for xen-devel@lists.xenproject.org; Mon, 03 Jun 2024 15:18:34 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 89ebe9ba-21bc-11ef-b4bb-af5377834399;
 Mon, 03 Jun 2024 17:18:33 +0200 (CEST)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-126-Iy7WdosbNt6_HMy2-StTTQ-1; Mon, 03 Jun 2024 11:18:28 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B2E04185AD2C;
 Mon,  3 Jun 2024 15:18:27 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.192.239])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id DC73F1050176;
 Mon,  3 Jun 2024 15:18:26 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 0C05718009AD; Mon,  3 Jun 2024 17:18:26 +0200 (CEST)
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
X-Inumbo-ID: 89ebe9ba-21bc-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1717427912;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vkSiq4a30KX/BtKlzALhqQstMUl79qOxtGFoh3xybvE=;
	b=ZaHkqAfY0prOxd9IsvYxn3cjrCzTyehr8LM8V/cUr8u9y8nC/gDT5zr1ezo0VbF63ReQG+
	CBYhNOd6hphyBpYhd13PoMbmI+ht2ARPhFcgQ3GGJWR00thyODBbGPvDYo+LDKiipCYas2
	ADA1VUyxfjUmHRSDEFClWjtIl46k7HI=
X-MC-Unique: Iy7WdosbNt6_HMy2-StTTQ-1
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Cc: Anthony PERARD <anthony@xenproject.org>,
	Gerd Hoffmann <kraxel@redhat.com>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	Paul Durrant <paul@xen.org>,
	xen-devel@lists.xenproject.org,
	Stefano Stabellini <sstabellini@kernel.org>,
	qemu-stable@nongnu.org
Subject: [PATCH v2 1/3] stdvga: fix screen blanking
Date: Mon,  3 Jun 2024 17:18:23 +0200
Message-ID: <20240603151825.188353-2-kraxel@redhat.com>
In-Reply-To: <20240603151825.188353-1-kraxel@redhat.com>
References: <20240603151825.188353-1-kraxel@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.3

In case the display surface uses a shared buffer (i.e. uses vga vram
directly instead of a shadow) go unshare the buffer before clearing it.

This avoids vga memory corruption, which in turn fixes unblanking not
working properly with X11.

Cc: qemu-stable@nongnu.org
Resolves: https://gitlab.com/qemu-project/qemu/-/issues/2067
Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 hw/display/vga.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/hw/display/vga.c b/hw/display/vga.c
index 30facc6c8e33..474b6b14c327 100644
--- a/hw/display/vga.c
+++ b/hw/display/vga.c
@@ -1762,6 +1762,12 @@ static void vga_draw_blank(VGACommonState *s, int full_update)
     if (s->last_scr_width <= 0 || s->last_scr_height <= 0)
         return;
 
+    if (is_buffer_shared(surface)) {
+        /* unshare buffer, otherwise the blanking corrupts vga vram */
+        surface = qemu_create_displaysurface(s->last_scr_width, s->last_scr_height);
+        dpy_gfx_replace_surface(s->con, surface);
+    }
+
     w = s->last_scr_width * surface_bytes_per_pixel(surface);
     d = surface_data(surface);
     for(i = 0; i < s->last_scr_height; i++) {
-- 
2.45.1


