Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E43741F1CCD
	for <lists+xen-devel@lfdr.de>; Mon,  8 Jun 2020 18:04:27 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jiKG3-0006OM-36; Mon, 08 Jun 2020 16:04:19 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=8Blr=7V=redhat.com=philmd@srs-us1.protection.inumbo.net>)
 id 1jiKG1-0006N7-Ff
 for xen-devel@lists.xenproject.org; Mon, 08 Jun 2020 16:04:17 +0000
X-Inumbo-ID: afc96422-a9a1-11ea-9ad7-bc764e2007e4
Received: from us-smtp-1.mimecast.com (unknown [205.139.110.61])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id afc96422-a9a1-11ea-9ad7-bc764e2007e4;
 Mon, 08 Jun 2020 16:04:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591632249;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1YHmjQuhKrVQhVboVAQhCqKWsJQjJvIRsihRuyQB5QA=;
 b=GufdAzPjl1+jPDg2Qwwmi6ZqFArTju1VskpGgEdBn/cxabWv3adMouQoBGyzqm8c0MFdX2
 8IxPJ1zDSYzhYYb/rVsY6wSLh84tCe253izJ6F7LT0bRstmuZKvctLqO8YcCtC/a6BSC6e
 D2/5uJHM/JCltZKdeJe18EczXbwphYI=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-410-TaZy7WysNWChcoZ0LPW4-Q-1; Mon, 08 Jun 2020 12:04:07 -0400
X-MC-Unique: TaZy7WysNWChcoZ0LPW4-Q-1
Received: by mail-wr1-f69.google.com with SMTP id n6so7364740wrv.6
 for <xen-devel@lists.xenproject.org>; Mon, 08 Jun 2020 09:04:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1YHmjQuhKrVQhVboVAQhCqKWsJQjJvIRsihRuyQB5QA=;
 b=ubjnkskv65DHGsfSxAS9wIcVT+u/4wWeCihqkfKpR8JbJinOa4Qzp/GXoBEa622sVP
 bCHqcWkNXIQzXTBhTmo5RRjdXLlvlzREx8dK2HDBG5c+xzECMFf+Et0ilfUUGKNt1sCf
 FbCN7NoSyfuJ9BwRLlmzZHC25B4JEyLsaj6Ge1m8bAjYesf4JM5zWIZra4+r/nrEBHLp
 TmLba4xEgHVVoWeNpNROpR1KECHHrjSm1beRUhH0B+HNETiGDMP2vsn3KBYqZZIhU7w0
 sH4vWkdC5zeP+3xjJs9wIT6OhE3Ysa1Spfi0ygcbRnxrZerGUAiX39CMWIqXRgExPlxO
 Nqvg==
X-Gm-Message-State: AOAM531s2dTQRLQ2i9f+MALEnPH5LCtonJgz8LHJYIZdhv2loSyiduwc
 Rox2k2Up7hG+COdqOIMs+XGktYO336V/NZO4P/XoMarbNtSFTNZmmhnBj7DCGSJ/xbBiKl9nwhw
 rwf4rZ1Opqb+hIfNmd7AxROAIF8Y=
X-Received: by 2002:adf:e68a:: with SMTP id r10mr23902487wrm.384.1591632244555; 
 Mon, 08 Jun 2020 09:04:04 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyU7/QCokRt2M0EtovQUdkQHNPZYj9jN1RqUTvUD0f6M2vtgvgHtmb2W1P0W/noN9Fx2nTHYQ==
X-Received: by 2002:adf:e68a:: with SMTP id r10mr23902460wrm.384.1591632244335; 
 Mon, 08 Jun 2020 09:04:04 -0700 (PDT)
Received: from localhost.localdomain
 (181.red-88-10-103.dynamicip.rima-tde.net. [88.10.103.181])
 by smtp.gmail.com with ESMTPSA id k17sm177411wrl.54.2020.06.08.09.04.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Jun 2020 09:04:03 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 34/35] hw/usb/hcd-musb: Emit warning when old code is used
Date: Mon,  8 Jun 2020 18:00:43 +0200
Message-Id: <20200608160044.15531-35-philmd@redhat.com>
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
 hw/usb/hcd-musb.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/hw/usb/hcd-musb.c b/hw/usb/hcd-musb.c
index c29fbef6fc..9b3cf1ca8f 100644
--- a/hw/usb/hcd-musb.c
+++ b/hw/usb/hcd-musb.c
@@ -25,6 +25,7 @@
 #include "hw/usb.h"
 #include "hw/irq.h"
 #include "hw/hw.h"
+#include "hw/qdev-deprecated.h"
 
 /* Common USB registers */
 #define MUSB_HDRC_FADDR		0x00	/* 8-bit */
@@ -377,6 +378,8 @@ struct MUSBState *musb_init(DeviceState *parent_device, int gpio_base)
     MUSBState *s = g_malloc0(sizeof(*s));
     int i;
 
+    qdev_warn_deprecated_function_used();
+
     for (i = 0; i < musb_irq_max; i++) {
         s->irqs[i] = qdev_get_gpio_in(parent_device, gpio_base + i);
     }
-- 
2.21.3


