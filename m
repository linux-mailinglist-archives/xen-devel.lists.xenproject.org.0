Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 80A132146A1
	for <lists+xen-devel@lfdr.de>; Sat,  4 Jul 2020 16:56:38 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jrjai-0004wQ-IY; Sat, 04 Jul 2020 14:56:32 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hHao=AP=gmail.com=philippe.mathieu.daude@srs-us1.protection.inumbo.net>)
 id 1jrjVa-0003ES-S7
 for xen-devel@lists.xenproject.org; Sat, 04 Jul 2020 14:51:14 +0000
X-Inumbo-ID: aff8b4ca-be05-11ea-bca7-bc764e2007e4
Received: from mail-wr1-x442.google.com (unknown [2a00:1450:4864:20::442])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id aff8b4ca-be05-11ea-bca7-bc764e2007e4;
 Sat, 04 Jul 2020 14:50:22 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id f2so7792991wrp.7
 for <xen-devel@lists.xenproject.org>; Sat, 04 Jul 2020 07:50:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=bNYiPy+H907R6GvRggaZDEAvq/yJ89RNH5vqYDziYiQ=;
 b=Zzt2Ao+qbpw+PyTf0gj3H8RK9KRIom4jWcvpaKOt4s1hW0V1FcCCbKJ+J1H1BoamQa
 X7yQWbLBOiWHDKwtYXNcSlpsadQlqloNBTBk3OoIeHNh7YjvW7yMB0amtIHW7A3uKNrF
 KIuBad86H5R6+A+garcJYO5R0cc0W1dnCsIKjrMacUlgm36Fhjt7sIWGaJjruzORr6Mw
 tCeATKmk7k/LQ9OiBic3Z6q8k1mV35zARhSfEfSLPMbQtj1CaWLLBsqEXHNhY7FCgnTB
 UPsPUgFVXy+a2LKVM7IwIcL6sBQUgKI3uk0ZNyDH/kMyxLLse6a/v9qA5iUjYWAwTnNg
 EH5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=bNYiPy+H907R6GvRggaZDEAvq/yJ89RNH5vqYDziYiQ=;
 b=nfd2Pk/6tEDbYMMHxEt7/NsMuLcrXGhJnR/JpWW6Z5ScctMIIxOFZDxtrHui9+JWzF
 nTIlq0/IOquvgABI5lLp2aW1j5vSus+nOjjR1ypuUH/lp1m0Jt9G9Dc1BJ673eSPINas
 Ixlo+k5Qa+Jcwwlvy6/RC0tWAU0rZWut9LPMw7+Xeork7lCeAt9rC0vYZBHZtWBEovwk
 g3zrZe7T/QvzJFAXtvIDdL5qnapCTBreM1QFRJ9JBXQ+7HMgw6OhUwEZOjL+chB4PVf+
 edmHFGV8Vd1wPd1k4ql2BQvX5aJb0qnHj1t/9jcjur5R5+3pWLTdJtc5U0OaKTLKnMp5
 HSMQ==
X-Gm-Message-State: AOAM531O6vL9VGk/Q0+yx3zW7UnUo4AY7M/S6h5UaJfje7VWhElZgPZs
 7lLemYFpTd1+ttDFhFC6d68=
X-Google-Smtp-Source: ABdhPJx8cXLO5EiX1MZNGYDXemombuB+cpvmJcqKanQIPyybTeiASdt/aAvkPNB3j02DjAjdPJizlA==
X-Received: by 2002:adf:e74e:: with SMTP id c14mr43510389wrn.143.1593874222155; 
 Sat, 04 Jul 2020 07:50:22 -0700 (PDT)
Received: from localhost.localdomain (1.red-83-51-162.dynamicip.rima-tde.net.
 [83.51.162.1])
 by smtp.gmail.com with ESMTPSA id r10sm17135019wrm.17.2020.07.04.07.50.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Jul 2020 07:50:21 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org,
	BALATON Zoltan <balaton@eik.bme.hu>
Subject: [PATCH 17/26] hw/usb/bus: Rename usb_get_dev_path() as
 usb_get_full_dev_path()
Date: Sat,  4 Jul 2020 16:49:34 +0200
Message-Id: <20200704144943.18292-18-f4bug@amsat.org>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20200704144943.18292-1-f4bug@amsat.org>
References: <20200704144943.18292-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain; charset="utf-8"
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
 "Michael S. Tsirkin" <mst@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Huacai Chen <chenhc@lemote.com>, Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org, Yoshinori Sato <ysato@users.sourceforge.jp>,
 Paul Durrant <paul@xen.org>, Magnus Damm <magnus.damm@gmail.com>,
 Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Anthony Perard <anthony.perard@citrix.com>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>,
 Leif Lindholm <leif@nuviainc.com>, Andrzej Zaborowski <balrogg@gmail.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Alistair Francis <alistair@alistair23.me>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Beniamino Galvani <b.galvani@gmail.com>,
 Niek Linnenbank <nieklinnenbank@gmail.com>, qemu-arm@nongnu.org,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Richard Henderson <rth@twiddle.net>,
 Radoslaw Biernacki <radoslaw.biernacki@linaro.org>,
 Igor Mitsyanko <i.mitsyanko@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Paul Zimmerman <pauldzim@gmail.com>, qemu-ppc@nongnu.org,
 David Gibson <david@gibson.dropbear.id.au>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

If the device has USB_DEV_FLAG_FULL_PATH set, usb_get_dev_path()
returns the full port path. Rename the function accordingly.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/usb/bus.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/hw/usb/bus.c b/hw/usb/bus.c
index f8901e822c..fad8194bf5 100644
--- a/hw/usb/bus.c
+++ b/hw/usb/bus.c
@@ -13,7 +13,7 @@
 
 static void usb_bus_dev_print(Monitor *mon, DeviceState *qdev, int indent);
 
-static char *usb_get_dev_path(DeviceState *dev);
+static char *usb_get_full_dev_path(DeviceState *dev);
 static char *usb_get_fw_dev_path(DeviceState *qdev);
 static void usb_qdev_unrealize(DeviceState *qdev);
 
@@ -33,7 +33,7 @@ static void usb_bus_class_init(ObjectClass *klass, void *data)
     HotplugHandlerClass *hc = HOTPLUG_HANDLER_CLASS(klass);
 
     k->print_dev = usb_bus_dev_print;
-    k->get_dev_path = usb_get_dev_path;
+    k->get_dev_path = usb_get_full_dev_path;
     k->get_fw_dev_path = usb_get_fw_dev_path;
     hc->unplug = qdev_simple_device_unplug_cb;
 }
@@ -577,7 +577,7 @@ static void usb_bus_dev_print(Monitor *mon, DeviceState *qdev, int indent)
                    dev->attached ? ", attached" : "");
 }
 
-static char *usb_get_dev_path(DeviceState *qdev)
+static char *usb_get_full_dev_path(DeviceState *qdev)
 {
     USBDevice *dev = USB_DEVICE(qdev);
 
-- 
2.21.3


