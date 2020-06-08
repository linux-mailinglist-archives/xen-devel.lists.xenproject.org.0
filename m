Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C929A1F1CA4
	for <lists+xen-devel@lfdr.de>; Mon,  8 Jun 2020 18:02:04 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jiKDl-00044q-4O; Mon, 08 Jun 2020 16:01:57 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=8Blr=7V=redhat.com=philmd@srs-us1.protection.inumbo.net>)
 id 1jiKDk-00044a-Jv
 for xen-devel@lists.xenproject.org; Mon, 08 Jun 2020 16:01:56 +0000
X-Inumbo-ID: 5f66f1f2-a9a1-11ea-96fb-bc764e2007e4
Received: from us-smtp-delivery-1.mimecast.com (unknown [207.211.31.120])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id 5f66f1f2-a9a1-11ea-96fb-bc764e2007e4;
 Mon, 08 Jun 2020 16:01:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591632114;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=faJPKsgnKj1MSj1B3bxzpLa01+W3HhU/7Hynie77jqI=;
 b=Vk7EC4A/3O2/cwwWEVAqrHluyPPdf7NPqzGdX1AQm83e3FvG/csEVW9zrd09gPsbYc8LuZ
 4YE8uaQsGXMsdAEm510pLC7bJf0kjk8RKvwCwVYzgPh3VEa71A4fj3drAaVgeZ2VIcgM99
 I9GtVCFrL9PbR4GnrKrlqqNk4EKHyLY=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-121-hCDpPhwJNySWu5jbvoflJA-1; Mon, 08 Jun 2020 12:01:50 -0400
X-MC-Unique: hCDpPhwJNySWu5jbvoflJA-1
Received: by mail-wr1-f69.google.com with SMTP id w4so7364563wrl.13
 for <xen-devel@lists.xenproject.org>; Mon, 08 Jun 2020 09:01:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=faJPKsgnKj1MSj1B3bxzpLa01+W3HhU/7Hynie77jqI=;
 b=as4X6sWS5XTQQVRyv/w90tbWPZ21O8rsIygk77b2RWzbArcJKVY762Z5Wc5kflsCOI
 IkwSzJ58hSciyvlilHFYGEONlyqMWdDo4Dp5fD5NJCOmRTT0QaPo742uCcWW7pr/62Ts
 TBJW1dEShsWDwtrdqY+ZXNUa0NgsisiwubVBuwXHnrvTxUS1dpewl6VEJtCqBYpkSZOf
 4eKS1PGxq7SAALkxVXF7ZunTFrrZSZrYmgh3/Rt73cbt9+D5TAhbzllQ8Fj+ZgHz8UE1
 Mc511J+1BL4X3xOFtDPx2D4GLqR/wHBbsJ1ie0qURBPDsc7A8QkGfZuWvIYUS1XLO2/H
 3M6g==
X-Gm-Message-State: AOAM5331B2UA5/hKZfZzezTcZ31I3VdvUtBKmfPpAgs1hqkMwf1Of03n
 45eUM/oJ2c//MvIm6UeFji7JN8QzndyojL6TiZZshnWGBwWj6+N43h8R2JWlIeydYbFIBXnCNb2
 3V0xVJE7OPlTRFm/VyyGMV4phE0k=
X-Received: by 2002:adf:9304:: with SMTP id 4mr25264189wro.280.1591632109661; 
 Mon, 08 Jun 2020 09:01:49 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx9mBFO0YH5teWKyWXjB3IP6YUG1XRf7/NfjmoGjY1J2DcXSECmfNz6g9nRc2AB3mdjKgV/Zg==
X-Received: by 2002:adf:9304:: with SMTP id 4mr25264164wro.280.1591632109513; 
 Mon, 08 Jun 2020 09:01:49 -0700 (PDT)
Received: from localhost.localdomain
 (181.red-88-10-103.dynamicip.rima-tde.net. [88.10.103.181])
 by smtp.gmail.com with ESMTPSA id l1sm220993wrb.31.2020.06.08.09.01.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Jun 2020 09:01:48 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 11/35] hw/display/vga-isa-mm: Emit warning when old code
 is used
Date: Mon,  8 Jun 2020 18:00:20 +0200
Message-Id: <20200608160044.15531-12-philmd@redhat.com>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20200608160044.15531-1-philmd@redhat.com>
References: <20200608160044.15531-1-philmd@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8;
	text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Max Filippov <jcmvbkbc@gmail.com>, Alistair Francis <Alistair.Francis@wdc.com>,
 Gerd Hoffmann <kraxel@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Paul Durrant <paul@xen.org>,
 Magnus Damm <magnus.damm@gmail.com>, Markus Armbruster <armbru@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Anthony Perard <anthony.perard@citrix.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 Andrzej Zaborowski <balrogg@gmail.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Alistair Francis <alistair@alistair23.me>, qemu-arm@nongnu.org,
 xen-devel@lists.xenproject.org, qemu-riscv@nongnu.org,
 Stafford Horne <shorne@gmail.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Richard Henderson <rth@twiddle.net>,
 "Daniel P . Berrange" <berrange@redhat.com>, Thomas Huth <huth@tuxfamily.org>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Michael Walle <michael@walle.cc>, qemu-ppc@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

This code hasn't been QOM'ified yet. Warn the user.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 hw/display/vga-isa-mm.c | 5 +++++
 hw/display/vga.c        | 3 +++
 2 files changed, 8 insertions(+)

diff --git a/hw/display/vga-isa-mm.c b/hw/display/vga-isa-mm.c
index 7321b7a06d..3e62389b63 100644
--- a/hw/display/vga-isa-mm.c
+++ b/hw/display/vga-isa-mm.c
@@ -29,6 +29,7 @@
 #include "hw/display/vga.h"
 #include "vga_int.h"
 #include "ui/pixel_ops.h"
+#include "hw/qdev-deprecated.h"
 
 #define VGA_RAM_SIZE (8 * MiB)
 
@@ -71,6 +72,8 @@ static void vga_mm_init(ISAVGAMMState *s, hwaddr vram_base,
 {
     MemoryRegion *s_ioport_ctrl, *vga_io_memory;
 
+    qdev_warn_deprecated_function_used();
+
     s->it_shift = it_shift;
     s_ioport_ctrl = g_malloc(sizeof(*s_ioport_ctrl));
     memory_region_init_io(s_ioport_ctrl, NULL, &vga_mm_ctrl_ops, s,
@@ -99,6 +102,8 @@ int isa_vga_mm_init(hwaddr vram_base,
 
     s = g_malloc0(sizeof(*s));
 
+    qdev_warn_deprecated_function_used();
+
     s->vga.vram_size_mb = VGA_RAM_SIZE / MiB;
     s->vga.global_vmstate = true;
     vga_common_init(&s->vga, NULL);
diff --git a/hw/display/vga.c b/hw/display/vga.c
index 061fd9ab8f..d59a9c896b 100644
--- a/hw/display/vga.c
+++ b/hw/display/vga.c
@@ -35,6 +35,7 @@
 #include "hw/xen/xen.h"
 #include "migration/vmstate.h"
 #include "trace.h"
+#include "hw/qdev-deprecated.h"
 
 //#define DEBUG_VGA_MEM
 //#define DEBUG_VGA_REG
@@ -2262,6 +2263,8 @@ MemoryRegion *vga_init_io(VGACommonState *s, Object *obj,
 {
     MemoryRegion *vga_mem;
 
+    qdev_warn_deprecated_function_used();
+
     *vga_ports = vga_portio_list;
     *vbe_ports = vbe_portio_list;
 
-- 
2.21.3


