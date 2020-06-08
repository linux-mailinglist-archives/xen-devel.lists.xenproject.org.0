Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 92DA01F1C9C
	for <lists+xen-devel@lfdr.de>; Mon,  8 Jun 2020 18:01:27 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jiKD3-0003gW-SQ; Mon, 08 Jun 2020 16:01:13 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=8Blr=7V=redhat.com=philmd@srs-us1.protection.inumbo.net>)
 id 1jiKD2-0003gA-OD
 for xen-devel@lists.xenproject.org; Mon, 08 Jun 2020 16:01:12 +0000
X-Inumbo-ID: 45b12e76-a9a1-11ea-b292-12813bfff9fa
Received: from us-smtp-delivery-1.mimecast.com (unknown [207.211.31.120])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 45b12e76-a9a1-11ea-b292-12813bfff9fa;
 Mon, 08 Jun 2020 16:01:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591632071;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zOI5VHRwzcrGr66pZ7m4z1ZrN3YJ34eLW3YDU+fnGv0=;
 b=DFM5n/zytoapvV9Ld+QkjOPRkm6cym/Dk94dkgN+QQ4qOeT7vdDb7IcTBH+tkALWM0LVoh
 rYfQRO5fFr+W/QRUDDaJQ/C9f+rykFLx+q4z6MekwkIx8PCfSldIYga2jxjESp/1I3WNBq
 Mflj3kUaz8ZzQXjidTj7UNwWb1Rad9o=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-489-1fD6y-RINF-qYnRlHl51Kw-1; Mon, 08 Jun 2020 12:01:06 -0400
X-MC-Unique: 1fD6y-RINF-qYnRlHl51Kw-1
Received: by mail-wr1-f72.google.com with SMTP id o1so7297569wrm.17
 for <xen-devel@lists.xenproject.org>; Mon, 08 Jun 2020 09:01:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=zOI5VHRwzcrGr66pZ7m4z1ZrN3YJ34eLW3YDU+fnGv0=;
 b=TaFrHTFkMQWTOBRk+w2KCBinMqddkWUAg9avHTkO+ptzMd+bX3i4DjezF8Acvm4IO/
 T40bxDH2e+IVyFZFDI+Ncy88RzyFnO9OvWkAT1ATtN1yjzXWDOZf4ojwdQ6r+lG/qN2m
 aJq0QKf56hLaTaTLmZXvZ2sHIKUXZ1t5f1gQRkRlfmWlJ+ejL8xAjEAToheibejSp3LA
 gILSbYQbeckmaGZKf6iaqgMcSpqJEGo8aKgVg/gap4rpVB6NXi+n4K/qPPoS4olU5zUN
 UNyhdZZD4321dt45N2+muaBA0l1WPW3DOQoZB7ZsmrjXYa5mjA3jl150tenFutaqNNC4
 xbBQ==
X-Gm-Message-State: AOAM531aTS+13gylr4VzHBdJM3LagyoiSo1MjZq1xTPPPifIyKw+eqUG
 iCSm8fgQpRv2SYIpZKcRSpa0Y35UpG6Fhauip70iIb+da6jGOy2hZqDtOydvJOEe1WmSesRArt5
 iSjUj1qo+0/FGCvP2hWZ+7iXi4Ks=
X-Received: by 2002:a1c:c3d7:: with SMTP id t206mr32544wmf.69.1591632065211;
 Mon, 08 Jun 2020 09:01:05 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJziXMXpu2PAmMIx7aoFkuYgVgPaKI7cmN6JuMa+/KlQ6vvO4eQND3agEj8WsVM887NYLfsrYQ==
X-Received: by 2002:a1c:c3d7:: with SMTP id t206mr32465wmf.69.1591632064493;
 Mon, 08 Jun 2020 09:01:04 -0700 (PDT)
Received: from localhost.localdomain
 (181.red-88-10-103.dynamicip.rima-tde.net. [88.10.103.181])
 by smtp.gmail.com with ESMTPSA id y5sm160041wrs.63.2020.06.08.09.01.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Jun 2020 09:01:03 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 03/35] hw/arm/omap: Emit warning when old code is used
Date: Mon,  8 Jun 2020 18:00:12 +0200
Message-Id: <20200608160044.15531-4-philmd@redhat.com>
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
 hw/arm/omap1.c            | 6 ++++++
 hw/char/omap_uart.c       | 5 +++++
 hw/misc/omap_gpmc.c       | 3 +++
 hw/misc/omap_l4.c         | 3 +++
 hw/misc/omap_sdrc.c       | 3 +++
 hw/sd/omap_mmc.c          | 5 +++++
 hw/ssi/omap_spi.c         | 3 +++
 hw/timer/omap_synctimer.c | 4 ++++
 8 files changed, 32 insertions(+)

diff --git a/hw/arm/omap1.c b/hw/arm/omap1.c
index 761cc17ea9..d7d6253be0 100644
--- a/hw/arm/omap1.c
+++ b/hw/arm/omap1.c
@@ -40,6 +40,7 @@
 #include "hw/sysbus.h"
 #include "qemu/cutils.h"
 #include "qemu/bcd.h"
+#include "hw/qdev-deprecated.h"
 
 static inline void omap_log_badwidth(const char *funcname, hwaddr addr, int sz)
 {
@@ -1451,6 +1452,7 @@ static struct dpll_ctl_s  *omap_dpll_init(MemoryRegion *memory,
                            hwaddr base, omap_clk clk)
 {
     struct dpll_ctl_s *s = g_malloc0(sizeof(*s));
+    qdev_warn_deprecated_function_used();
     memory_region_init_io(&s->iomem, NULL, &omap_dpll_ops, s, "omap-dpll", 0x100);
 
     s->dpll = clk;
@@ -2427,6 +2429,8 @@ static struct omap_pwl_s *omap_pwl_init(MemoryRegion *system_memory,
 {
     struct omap_pwl_s *s = g_malloc0(sizeof(*s));
 
+    qdev_warn_deprecated_function_used();
+
     omap_pwl_reset(s);
 
     memory_region_init_io(&s->iomem, NULL, &omap_pwl_ops, s,
@@ -2534,6 +2538,8 @@ static struct omap_pwt_s *omap_pwt_init(MemoryRegion *system_memory,
                                         omap_clk clk)
 {
     struct omap_pwt_s *s = g_malloc0(sizeof(*s));
+
+    qdev_warn_deprecated_function_used();
     s->clk = clk;
     omap_pwt_reset(s);
 
diff --git a/hw/char/omap_uart.c b/hw/char/omap_uart.c
index e8da933378..7e106772ce 100644
--- a/hw/char/omap_uart.c
+++ b/hw/char/omap_uart.c
@@ -22,6 +22,7 @@
 #include "hw/arm/omap.h"
 #include "hw/char/serial.h"
 #include "exec/address-spaces.h"
+#include "hw/qdev-deprecated.h"
 
 /* UARTs */
 struct omap_uart_s {
@@ -57,6 +58,8 @@ struct omap_uart_s *omap_uart_init(hwaddr base,
 {
     struct omap_uart_s *s = g_new0(struct omap_uart_s, 1);
 
+    qdev_warn_deprecated_function_used();
+
     s->base = base;
     s->fclk = fclk;
     s->irq = irq;
@@ -168,6 +171,8 @@ struct omap_uart_s *omap2_uart_init(MemoryRegion *sysmem,
     struct omap_uart_s *s = omap_uart_init(base, irq,
                     fclk, iclk, txdma, rxdma, label, chr);
 
+    qdev_warn_deprecated_function_used();
+
     memory_region_init_io(&s->iomem, NULL, &omap_uart_ops, s, "omap.uart", 0x100);
 
     s->ta = ta;
diff --git a/hw/misc/omap_gpmc.c b/hw/misc/omap_gpmc.c
index 10de7a5523..9e29d7a8bd 100644
--- a/hw/misc/omap_gpmc.c
+++ b/hw/misc/omap_gpmc.c
@@ -25,6 +25,7 @@
 #include "hw/arm/omap.h"
 #include "exec/memory.h"
 #include "exec/address-spaces.h"
+#include "hw/qdev-deprecated.h"
 
 /* General-Purpose Memory Controller */
 struct omap_gpmc_s {
@@ -830,6 +831,8 @@ struct omap_gpmc_s *omap_gpmc_init(struct omap_mpu_state_s *mpu,
     int cs;
     struct omap_gpmc_s *s = g_new0(struct omap_gpmc_s, 1);
 
+    qdev_warn_deprecated_function_used();
+
     memory_region_init_io(&s->iomem, NULL, &omap_gpmc_ops, s, "omap-gpmc", 0x1000);
     memory_region_add_subregion(get_system_memory(), base, &s->iomem);
 
diff --git a/hw/misc/omap_l4.c b/hw/misc/omap_l4.c
index 54aeaecd69..b412790c19 100644
--- a/hw/misc/omap_l4.c
+++ b/hw/misc/omap_l4.c
@@ -19,6 +19,7 @@
  */
 #include "qemu/osdep.h"
 #include "hw/arm/omap.h"
+#include "hw/qdev-deprecated.h"
 
 struct omap_l4_s {
     MemoryRegion *address_space;
@@ -33,6 +34,8 @@ struct omap_l4_s *omap_l4_init(MemoryRegion *address_space,
     struct omap_l4_s *bus = g_malloc0(
                     sizeof(*bus) + ta_num * sizeof(*bus->ta));
 
+    qdev_warn_deprecated_function_used();
+
     bus->address_space = address_space;
     bus->ta_num = ta_num;
     bus->base = base;
diff --git a/hw/misc/omap_sdrc.c b/hw/misc/omap_sdrc.c
index f2f72f6810..4f8440ea56 100644
--- a/hw/misc/omap_sdrc.c
+++ b/hw/misc/omap_sdrc.c
@@ -19,6 +19,7 @@
  */
 #include "qemu/osdep.h"
 #include "hw/arm/omap.h"
+#include "hw/qdev-deprecated.h"
 
 /* SDRAM Controller Subsystem */
 struct omap_sdrc_s {
@@ -159,6 +160,8 @@ struct omap_sdrc_s *omap_sdrc_init(MemoryRegion *sysmem,
 {
     struct omap_sdrc_s *s = g_new0(struct omap_sdrc_s, 1);
 
+    qdev_warn_deprecated_function_used();
+
     omap_sdrc_reset(s);
 
     memory_region_init_io(&s->iomem, NULL, &omap_sdrc_ops, s, "omap.sdrc", 0x1000);
diff --git a/hw/sd/omap_mmc.c b/hw/sd/omap_mmc.c
index 4088a8a80b..88fd20e17a 100644
--- a/hw/sd/omap_mmc.c
+++ b/hw/sd/omap_mmc.c
@@ -24,6 +24,7 @@
 #include "hw/irq.h"
 #include "hw/arm/omap.h"
 #include "hw/sd/sd.h"
+#include "hw/qdev-deprecated.h"
 
 struct omap_mmc_s {
     qemu_irq irq;
@@ -599,6 +600,8 @@ struct omap_mmc_s *omap_mmc_init(hwaddr base,
 {
     struct omap_mmc_s *s = g_new0(struct omap_mmc_s, 1);
 
+    qdev_warn_deprecated_function_used();
+
     s->irq = irq;
     s->dma = dma;
     s->clk = clk;
@@ -625,6 +628,8 @@ struct omap_mmc_s *omap2_mmc_init(struct omap_target_agent_s *ta,
 {
     struct omap_mmc_s *s = g_new0(struct omap_mmc_s, 1);
 
+    qdev_warn_deprecated_function_used();
+
     s->irq = irq;
     s->dma = dma;
     s->clk = fclk;
diff --git a/hw/ssi/omap_spi.c b/hw/ssi/omap_spi.c
index 7c7e689707..276f963ae2 100644
--- a/hw/ssi/omap_spi.c
+++ b/hw/ssi/omap_spi.c
@@ -25,6 +25,7 @@
 #include "hw/hw.h"
 #include "hw/irq.h"
 #include "hw/arm/omap.h"
+#include "hw/qdev-deprecated.h"
 
 /* Multichannel SPI */
 struct omap_mcspi_s {
@@ -353,6 +354,8 @@ struct omap_mcspi_s *omap_mcspi_init(struct omap_target_agent_s *ta, int chnum,
     struct omap_mcspi_s *s = g_new0(struct omap_mcspi_s, 1);
     struct omap_mcspi_ch_s *ch = s->ch;
 
+    qdev_warn_deprecated_function_used();
+
     s->irq = irq;
     s->chnum = chnum;
     while (chnum --) {
diff --git a/hw/timer/omap_synctimer.c b/hw/timer/omap_synctimer.c
index 72b997939b..4be24e970e 100644
--- a/hw/timer/omap_synctimer.c
+++ b/hw/timer/omap_synctimer.c
@@ -20,6 +20,8 @@
 #include "qemu/osdep.h"
 #include "qemu/timer.h"
 #include "hw/arm/omap.h"
+#include "hw/qdev-deprecated.h"
+
 struct omap_synctimer_s {
     MemoryRegion iomem;
     uint32_t val;
@@ -101,6 +103,8 @@ struct omap_synctimer_s *omap_synctimer_init(struct omap_target_agent_s *ta,
 {
     struct omap_synctimer_s *s = g_malloc0(sizeof(*s));
 
+    qdev_warn_deprecated_function_used();
+
     omap_synctimer_reset(s);
     memory_region_init_io(&s->iomem, NULL, &omap_synctimer_ops, s, "omap.synctimer",
                           omap_l4_region_size(ta, 0));
-- 
2.21.3


