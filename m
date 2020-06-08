Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F04951F1C9B
	for <lists+xen-devel@lfdr.de>; Mon,  8 Jun 2020 18:01:26 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jiKD5-0003hR-5T; Mon, 08 Jun 2020 16:01:15 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=8Blr=7V=redhat.com=philmd@srs-us1.protection.inumbo.net>)
 id 1jiKD4-0003h2-6w
 for xen-devel@lists.xenproject.org; Mon, 08 Jun 2020 16:01:14 +0000
X-Inumbo-ID: 46eafbaa-a9a1-11ea-96fb-bc764e2007e4
Received: from us-smtp-delivery-1.mimecast.com (unknown [207.211.31.81])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id 46eafbaa-a9a1-11ea-96fb-bc764e2007e4;
 Mon, 08 Jun 2020 16:01:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591632073;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=O7Ly94SWL+SMdJ3uuRJWrIP/iOhgME/DwBVu03IUalo=;
 b=XMVNPDP+pwORdzbIBc7g/MDKo1KzzqHVDxTrWAO/+n/C3cNnvWDiRULUhkcM0RmtWv6/fF
 aJXJH75uEqSv2idrGZXb4Hx1eB4HRWReQ4Yk45AsZdg9uPUimYivqHzYtcsZVV4wmLDaMX
 nubEISQNHbruLjAuWhMVsTrilAwVXgM=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-231-vSu2zWhsOSmHhzMJ7I1Hkg-1; Mon, 08 Jun 2020 12:01:11 -0400
X-MC-Unique: vSu2zWhsOSmHhzMJ7I1Hkg-1
Received: by mail-wm1-f69.google.com with SMTP id p24so11166wmc.1
 for <xen-devel@lists.xenproject.org>; Mon, 08 Jun 2020 09:01:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=O7Ly94SWL+SMdJ3uuRJWrIP/iOhgME/DwBVu03IUalo=;
 b=fAB/rMZxqiXWk1IisYOMRE21fZKko0S95HVwIS0pCcVAwByXaAp0pSWybgoe5JulbT
 mFE9oqxCV/MEz9jxMNZUXCItq6/vMs5OkpWQNRRRxdk4ZqmUC4remXNv5cxfy2/eSDdX
 oMQrQ0dUPwaR/x4PrN8i+VudpFgQR8WGkTbmVNOp/7F7hhKL6Jzo3QMD6gYlPh1uPE65
 JYggDG45xg9tuCic72VAbIWnVPNSirucvGVPRJlwuZOyhjPNvz+w2x6YokGrUD7cBCJU
 iMq5YqiA04ET4pWIJGPpSwI2s98//y2/YVtcY5gxzs1ON0xylg5/GLBsO+LaXFoRjjke
 imiw==
X-Gm-Message-State: AOAM533LbWRu/2p1Z9YW+Ehzzdm2djfznLmdyVz/jdh7kEeCo99TAa+q
 G/ttdOq8NXlZuJI5jsm6lfFJdzmJ4iQEdasRj5F4YJ48ywh9feWklOOpUP/POpKAcVzKBylzlFd
 OQ28Lt+R1lFr+WEsx7WKxx4txTVA=
X-Received: by 2002:a5d:6acf:: with SMTP id u15mr25749793wrw.277.1591632070227; 
 Mon, 08 Jun 2020 09:01:10 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzcPzEmUfH07HRp9H1Y3tf4BoKsOaXn7cpLkhpXaJ1S6O0iNu0DeeV5KKJL41RODtirsARieQ==
X-Received: by 2002:a5d:6acf:: with SMTP id u15mr25749771wrw.277.1591632069976; 
 Mon, 08 Jun 2020 09:01:09 -0700 (PDT)
Received: from localhost.localdomain
 (181.red-88-10-103.dynamicip.rima-tde.net. [88.10.103.181])
 by smtp.gmail.com with ESMTPSA id e12sm163622wro.52.2020.06.08.09.01.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Jun 2020 09:01:09 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 04/35] hw/arm/pxa2xx: Emit warning when old code is used
Date: Mon,  8 Jun 2020 18:00:13 +0200
Message-Id: <20200608160044.15531-5-philmd@redhat.com>
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
 hw/arm/pxa2xx.c          | 3 +++
 hw/display/pxa2xx_lcd.c  | 3 +++
 hw/input/pxa2xx_keypad.c | 3 +++
 3 files changed, 9 insertions(+)

diff --git a/hw/arm/pxa2xx.c b/hw/arm/pxa2xx.c
index e649f8930c..483003d161 100644
--- a/hw/arm/pxa2xx.c
+++ b/hw/arm/pxa2xx.c
@@ -27,6 +27,7 @@
 #include "sysemu/qtest.h"
 #include "qemu/cutils.h"
 #include "qemu/log.h"
+#include "hw/qdev-deprecated.h"
 
 static struct {
     hwaddr io_base;
@@ -1768,6 +1769,8 @@ static PXA2xxI2SState *pxa2xx_i2s_init(MemoryRegion *sysmem,
 {
     PXA2xxI2SState *s = g_new0(PXA2xxI2SState, 1);
 
+    qdev_warn_deprecated_function_used();
+
     s->irq = irq;
     s->rx_dma = rx_dma;
     s->tx_dma = tx_dma;
diff --git a/hw/display/pxa2xx_lcd.c b/hw/display/pxa2xx_lcd.c
index ff90104b80..cf6241ff21 100644
--- a/hw/display/pxa2xx_lcd.c
+++ b/hw/display/pxa2xx_lcd.c
@@ -20,6 +20,7 @@
 /* FIXME: For graphic_rotate. Should probably be done in common code.  */
 #include "sysemu/sysemu.h"
 #include "framebuffer.h"
+#include "hw/qdev-deprecated.h"
 
 struct DMAChannel {
     uint32_t branch;
@@ -1011,6 +1012,8 @@ PXA2xxLCDState *pxa2xx_lcdc_init(MemoryRegion *sysmem,
     PXA2xxLCDState *s;
     DisplaySurface *surface;
 
+    qdev_warn_deprecated_function_used();
+
     s = (PXA2xxLCDState *) g_malloc0(sizeof(PXA2xxLCDState));
     s->invalidated = 1;
     s->irq = irq;
diff --git a/hw/input/pxa2xx_keypad.c b/hw/input/pxa2xx_keypad.c
index 62aa6f6b15..6de1e9e4bb 100644
--- a/hw/input/pxa2xx_keypad.c
+++ b/hw/input/pxa2xx_keypad.c
@@ -17,6 +17,7 @@
 #include "migration/vmstate.h"
 #include "hw/arm/pxa.h"
 #include "ui/console.h"
+#include "hw/qdev-deprecated.h"
 
 /*
  * Keypad
@@ -316,6 +317,8 @@ PXA2xxKeyPadState *pxa27x_keypad_init(MemoryRegion *sysmem,
 {
     PXA2xxKeyPadState *s;
 
+    qdev_warn_deprecated_function_used();
+
     s = (PXA2xxKeyPadState *) g_malloc0(sizeof(PXA2xxKeyPadState));
     s->irq = irq;
 
-- 
2.21.3


