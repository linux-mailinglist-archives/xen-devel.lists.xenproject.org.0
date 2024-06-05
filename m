Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 00A288FCEB9
	for <lists+xen-devel@lfdr.de>; Wed,  5 Jun 2024 15:15:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.735757.1141886 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sEqTm-0003zi-Lr; Wed, 05 Jun 2024 13:15:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 735757.1141886; Wed, 05 Jun 2024 13:15:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sEqTm-0003wK-J2; Wed, 05 Jun 2024 13:15:02 +0000
Received: by outflank-mailman (input) for mailman id 735757;
 Wed, 05 Jun 2024 13:15:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=oDqB=NH=redhat.com=kraxel@srs-se1.protection.inumbo.net>)
 id 1sEqTl-0003De-By
 for xen-devel@lists.xenproject.org; Wed, 05 Jun 2024 13:15:01 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9a716cea-233d-11ef-b4bb-af5377834399;
 Wed, 05 Jun 2024 15:14:59 +0200 (CEST)
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-97-vsGxsQoUPgaw-ZwqovnG_w-1; Wed,
 05 Jun 2024 09:14:50 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CB7CB29ABA03;
 Wed,  5 Jun 2024 13:14:49 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.192.217])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 01A992166AF7;
 Wed,  5 Jun 2024 13:14:48 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 58C141800DD4; Wed,  5 Jun 2024 15:14:44 +0200 (CEST)
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
X-Inumbo-ID: 9a716cea-233d-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1717593295;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZzhPwfoH1SErdzaNq4zX0FAoHyesUw7dSQsAWnH09DA=;
	b=enCejUn8OEUZUGWIzELPlQlH/M/hYzpbb+qxF3h31YUJ4vNEW9ED1pLfjGFvkJTC4oxH37
	uR1u8gGA6RzouRJNdmZbPt3ouPBL87nh7nZbQdaRPHVIwbPRVoY2w1uJN9MNogDlmwjNfY
	CUQuJn1oMs/cQYn/aMe27C+VEJiZVFM=
X-MC-Unique: vsGxsQoUPgaw-ZwqovnG_w-1
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	Paul Durrant <paul@xen.org>,
	xen-devel@lists.xenproject.org,
	Gerd Hoffmann <kraxel@redhat.com>,
	Anthony PERARD <anthony@xenproject.org>
Subject: [PATCH v3 2/3] ui+display: rename is_placeholder() -> surface_is_placeholder()
Date: Wed,  5 Jun 2024 15:14:42 +0200
Message-ID: <20240605131444.797896-3-kraxel@redhat.com>
In-Reply-To: <20240605131444.797896-1-kraxel@redhat.com>
References: <20240605131444.797896-1-kraxel@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.6

No functional change.

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 include/ui/surface.h | 2 +-
 ui/console.c         | 2 +-
 ui/sdl2-2d.c         | 2 +-
 ui/sdl2-gl.c         | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/include/ui/surface.h b/include/ui/surface.h
index 4244e0ca4a32..273bb4769a02 100644
--- a/include/ui/surface.h
+++ b/include/ui/surface.h
@@ -50,7 +50,7 @@ static inline int is_buffer_shared(DisplaySurface *surface)
     return !(surface->flags & QEMU_ALLOCATED_FLAG);
 }
 
-static inline int is_placeholder(DisplaySurface *surface)
+static inline int surface_is_placeholder(DisplaySurface *surface)
 {
     return surface->flags & QEMU_PLACEHOLDER_FLAG;
 }
diff --git a/ui/console.c b/ui/console.c
index 1b2cd0c7365d..c2173fc0b1e5 100644
--- a/ui/console.c
+++ b/ui/console.c
@@ -1510,7 +1510,7 @@ void qemu_console_resize(QemuConsole *s, int width, int height)
     assert(QEMU_IS_GRAPHIC_CONSOLE(s));
 
     if ((s->scanout.kind != SCANOUT_SURFACE ||
-         (surface && !is_buffer_shared(surface) && !is_placeholder(surface))) &&
+         (surface && !is_buffer_shared(surface) && !surface_is_placeholder(surface))) &&
         qemu_console_get_width(s, -1) == width &&
         qemu_console_get_height(s, -1) == height) {
         return;
diff --git a/ui/sdl2-2d.c b/ui/sdl2-2d.c
index 06468cd493ea..73052383c2e0 100644
--- a/ui/sdl2-2d.c
+++ b/ui/sdl2-2d.c
@@ -72,7 +72,7 @@ void sdl2_2d_switch(DisplayChangeListener *dcl,
         scon->texture = NULL;
     }
 
-    if (is_placeholder(new_surface) && qemu_console_get_index(dcl->con)) {
+    if (surface_is_placeholder(new_surface) && qemu_console_get_index(dcl->con)) {
         sdl2_window_destroy(scon);
         return;
     }
diff --git a/ui/sdl2-gl.c b/ui/sdl2-gl.c
index 28d796607c08..91b7ee2419b7 100644
--- a/ui/sdl2-gl.c
+++ b/ui/sdl2-gl.c
@@ -89,7 +89,7 @@ void sdl2_gl_switch(DisplayChangeListener *dcl,
 
     scon->surface = new_surface;
 
-    if (is_placeholder(new_surface) && qemu_console_get_index(dcl->con)) {
+    if (surface_is_placeholder(new_surface) && qemu_console_get_index(dcl->con)) {
         qemu_gl_fini_shader(scon->gls);
         scon->gls = NULL;
         sdl2_window_destroy(scon);
-- 
2.45.1


