Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 145E31F1CC9
	for <lists+xen-devel@lfdr.de>; Mon,  8 Jun 2020 18:03:58 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jiKFb-0005uj-Kt; Mon, 08 Jun 2020 16:03:51 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=8Blr=7V=redhat.com=philmd@srs-us1.protection.inumbo.net>)
 id 1jiKFa-0005tu-IH
 for xen-devel@lists.xenproject.org; Mon, 08 Jun 2020 16:03:50 +0000
X-Inumbo-ID: a4570be4-a9a1-11ea-b292-12813bfff9fa
Received: from us-smtp-1.mimecast.com (unknown [207.211.31.120])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id a4570be4-a9a1-11ea-b292-12813bfff9fa;
 Mon, 08 Jun 2020 16:03:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591632229;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+WkHvAzEi0wEkdKvuBuPydWDbkpdF7QxEn1l5oochA0=;
 b=N4p54fYmCXOpchXnz0ZN1/cwQxg11GtBAtIichPgSaIhepD7fvyuocQ5BEW9A2xBn5qmnR
 u7q//ZSbVc+0ypI6BlemWubZPd0cg/5D4tktzbM56JpIkJOk3OsNyHV83GqzjL/DjY5Xg/
 9mL5CyiLuPSSk5uZqwujWShVip99JAg=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-29-gHiAprgVOM-9B2uXODz0Lw-1; Mon, 08 Jun 2020 12:03:48 -0400
X-MC-Unique: gHiAprgVOM-9B2uXODz0Lw-1
Received: by mail-wm1-f69.google.com with SMTP id a7so12838wmf.1
 for <xen-devel@lists.xenproject.org>; Mon, 08 Jun 2020 09:03:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+WkHvAzEi0wEkdKvuBuPydWDbkpdF7QxEn1l5oochA0=;
 b=oax5GYL2o9ro/6xAlqGmureExpmqS8MZdSKqExdiPMX+w0L5KvproJJ3Usk0PZgKVc
 /+fVt5D/DO6Kcet6caDZmieQiA5VK7fGG2yh+ceeP64uUhXR2wvpqkeMmKER1qjMTbSx
 J0xO/A8zbiAY1nf4t7IOhMfQyPOBmQGxuB0VQFEa7qaWCIb0DAk95ELMlhMTFveo8VI6
 gGG953PSz3418aTcWwKmCzkcpjLwIMoVlPQK6Mt/yV82qYc/ZA4ywd0DVDX4wEc1nZRK
 9DFsDt/qywC5Op0BlEIa5sejV3eu3o78GmcBLoxmpO/ml+0Jsoqiya7Px261mYRJp0v/
 81cw==
X-Gm-Message-State: AOAM530QZLCVh83Iy/2SE05Ykv1w3lhMEZ8dSXFJDlX0FO968GffdLpx
 eZuL5z50C6H9uLMhO7HrIekGpcjsBcvVi6dTFkxnYN+zis1Aiq+nbRarx0ZxcsTJ29vdgwPE7Me
 0LE5/83FqXbslTCgvK2NpYN8rnHE=
X-Received: by 2002:a5d:49c5:: with SMTP id t5mr24893755wrs.18.1591632227121; 
 Mon, 08 Jun 2020 09:03:47 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzrpgU9KBovh6Bb8PslmNvBRv90nOw1Va1g7BnyPuxlNkUnSsxx5Z+mEp10XtU+59c/IEfXNQ==
X-Received: by 2002:a5d:49c5:: with SMTP id t5mr24893708wrs.18.1591632226912; 
 Mon, 08 Jun 2020 09:03:46 -0700 (PDT)
Received: from localhost.localdomain
 (181.red-88-10-103.dynamicip.rima-tde.net. [88.10.103.181])
 by smtp.gmail.com with ESMTPSA id s8sm181183wrg.50.2020.06.08.09.03.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Jun 2020 09:03:46 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 31/35] hw/sh4: Emit warning when old code is used
Date: Mon,  8 Jun 2020 18:00:40 +0200
Message-Id: <20200608160044.15531-32-philmd@redhat.com>
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
 hw/char/sh_serial.c | 3 +++
 hw/intc/sh_intc.c   | 3 +++
 hw/sh4/r2d.c        | 3 +++
 hw/sh4/sh7750.c     | 4 ++++
 hw/timer/sh_timer.c | 5 +++++
 5 files changed, 18 insertions(+)

diff --git a/hw/char/sh_serial.c b/hw/char/sh_serial.c
index 167f4d8cb9..9366a23dd2 100644
--- a/hw/char/sh_serial.c
+++ b/hw/char/sh_serial.c
@@ -31,6 +31,7 @@
 #include "chardev/char-fe.h"
 #include "qapi/error.h"
 #include "qemu/timer.h"
+#include "hw/qdev-deprecated.h"
 
 //#define DEBUG_SERIAL
 
@@ -382,6 +383,8 @@ void sh_serial_init(MemoryRegion *sysmem,
 {
     sh_serial_state *s;
 
+    qdev_warn_deprecated_function_used();
+
     s = g_malloc0(sizeof(sh_serial_state));
 
     s->feat = feat;
diff --git a/hw/intc/sh_intc.c b/hw/intc/sh_intc.c
index 72a55e32dd..c90fbf47bb 100644
--- a/hw/intc/sh_intc.c
+++ b/hw/intc/sh_intc.c
@@ -13,6 +13,7 @@
 #include "hw/sh4/sh_intc.h"
 #include "hw/irq.h"
 #include "hw/sh4/sh.h"
+#include "hw/qdev-deprecated.h"
 
 //#define DEBUG_INTC
 //#define DEBUG_INTC_SOURCES
@@ -444,6 +445,8 @@ int sh_intc_init(MemoryRegion *sysmem,
 {
     unsigned int i, j;
 
+    qdev_warn_deprecated_function_used();
+
     desc->pending = 0;
     desc->nr_sources = nr_sources;
     desc->mask_regs = mask_regs;
diff --git a/hw/sh4/r2d.c b/hw/sh4/r2d.c
index 72bb5285cc..22bbbe7d3c 100644
--- a/hw/sh4/r2d.c
+++ b/hw/sh4/r2d.c
@@ -43,6 +43,7 @@
 #include "hw/usb.h"
 #include "hw/block/flash.h"
 #include "exec/address-spaces.h"
+#include "hw/qdev-deprecated.h"
 
 #define FLASH_BASE 0x00000000
 #define FLASH_SIZE (16 * MiB)
@@ -187,6 +188,8 @@ static qemu_irq *r2d_fpga_init(MemoryRegion *sysmem,
 {
     r2d_fpga_t *s;
 
+    qdev_warn_deprecated_function_used();
+
     s = g_malloc0(sizeof(r2d_fpga_t));
 
     s->irl = irl;
diff --git a/hw/sh4/sh7750.c b/hw/sh4/sh7750.c
index d660714443..379822e0c2 100644
--- a/hw/sh4/sh7750.c
+++ b/hw/sh4/sh7750.c
@@ -32,6 +32,7 @@
 #include "hw/sh4/sh_intc.h"
 #include "cpu.h"
 #include "exec/exec-all.h"
+#include "hw/qdev-deprecated.h"
 
 #define NB_DEVICES 4
 
@@ -756,6 +757,8 @@ SH7750State *sh7750_init(SuperHCPU *cpu, MemoryRegion *sysmem)
 {
     SH7750State *s;
 
+    qdev_warn_deprecated_function_used();
+
     s = g_malloc0(sizeof(SH7750State));
     s->cpu = cpu;
     s->periph_freq = 60000000;	/* 60MHz */
@@ -866,6 +869,7 @@ SH7750State *sh7750_init(SuperHCPU *cpu, MemoryRegion *sysmem)
 
 qemu_irq sh7750_irl(SH7750State *s)
 {
+    qdev_warn_deprecated_function_used();
     sh_intc_toggle_source(sh_intc_source(&s->intc, IRL), 1, 0); /* enable */
     return qemu_allocate_irq(sh_intc_set_irl, sh_intc_source(&s->intc, IRL), 0);
 }
diff --git a/hw/timer/sh_timer.c b/hw/timer/sh_timer.c
index 13c4051808..d5e33507b0 100644
--- a/hw/timer/sh_timer.c
+++ b/hw/timer/sh_timer.c
@@ -14,6 +14,7 @@
 #include "hw/sh4/sh.h"
 #include "qemu/timer.h"
 #include "hw/ptimer.h"
+#include "hw/qdev-deprecated.h"
 
 //#define DEBUG_TIMER
 
@@ -199,6 +200,8 @@ static void *sh_timer_init(uint32_t freq, int feat, qemu_irq irq)
 {
     sh_timer_state *s;
 
+    qdev_warn_deprecated_function_used();
+
     s = (sh_timer_state *)g_malloc0(sizeof(sh_timer_state));
     s->freq = freq;
     s->feat = feat;
@@ -319,6 +322,8 @@ void tmu012_init(MemoryRegion *sysmem, hwaddr base,
     tmu012_state *s;
     int timer_feat = (feat & TMU012_FEAT_EXTCLK) ? TIMER_FEAT_EXTCLK : 0;
 
+    qdev_warn_deprecated_function_used();
+
     s = (tmu012_state *)g_malloc0(sizeof(tmu012_state));
     s->feat = feat;
     s->timer[0] = sh_timer_init(freq, timer_feat, ch0_irq);
-- 
2.21.3


