Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 33C2B2146A0
	for <lists+xen-devel@lfdr.de>; Sat,  4 Jul 2020 16:56:38 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jrjah-0004tr-1E; Sat, 04 Jul 2020 14:56:31 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hHao=AP=gmail.com=philippe.mathieu.daude@srs-us1.protection.inumbo.net>)
 id 1jrjVf-0003ES-SR
 for xen-devel@lists.xenproject.org; Sat, 04 Jul 2020 14:51:19 +0000
X-Inumbo-ID: b13882c0-be05-11ea-8496-bc764e2007e4
Received: from mail-wm1-x344.google.com (unknown [2a00:1450:4864:20::344])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b13882c0-be05-11ea-8496-bc764e2007e4;
 Sat, 04 Jul 2020 14:50:25 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id o2so37045098wmh.2
 for <xen-devel@lists.xenproject.org>; Sat, 04 Jul 2020 07:50:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=dSp90TZcMkhYVN1myg6NdGD6Nbq0gZQK2ClNXRKzwCU=;
 b=mKjsT3NYlThJ+LvUmtlSMZy5vL935vqJl78XXQCOfn95V8qATFdthcq6p9KJZvenD6
 DffdeGJvs+v064CCp2bsGhza6HQ140vH4JRai4A3w+oS3o1wIspj2Cju5MMVDflqztas
 XqxwrLwqtwKNKEg6aekNLR2FAcywQVHY/ZPzG6wsvXMQx0+h11VfEUR7kqHBPv3peOBX
 gfriguM3HSKDBd5gYz5iWvxaoezeQw/GUCx443CDTct4IA4h1LI8tVQdQU/ugz11KIv+
 BiB3KOhE8U5/19gm2x+V5J/zs6cl0vA9D1NhrqwmqhZr47fh9n3rf96aJTJhrioPyh+C
 odGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=dSp90TZcMkhYVN1myg6NdGD6Nbq0gZQK2ClNXRKzwCU=;
 b=TjEoeeww3uHlTl4SqPgds9lkfPdr9lA99tKeTbKV1xd7kTKos/CR6V6QPImASTalgP
 mUVrvpoxQZ1tbAt7AfuOhsNQtYQSSMEbVyG1daSbOMrQJgcuUuborwuhlJCQUGYFFLJ+
 ee8he9ruVrtEagavUesNFujBBbFEvZM8Q00iTmyXSIPOF6j5ZZ3GBXqHuY1t8sdunFWh
 nINCntwptk8+RC+CT3KvHLSHATXYWo1F9yjZWQ1hVHEueJX5cy2dM3t012D+TlW6YgLx
 p98NDjZCKKlmx4H4IVFllIk+N8hfpPjUI1BvNrr243NdkZ2Eoz7xwg3nLglNY4wtLcCH
 qZMA==
X-Gm-Message-State: AOAM530//WZ5nEDIk2F6F5xrdTLW7GWTZoPxU4QnUOdZ9roSjflskDyE
 AA4sqFjUmTD0lrKqeq2DPrQ=
X-Google-Smtp-Source: ABdhPJzvKUoOtrkVjzZQp6DwlQyiHYdZ94BKN5ozpyFIsmy9iEQycoO+prQidokC2C86DctB5wk5ig==
X-Received: by 2002:a1c:18e:: with SMTP id 136mr10977710wmb.93.1593874224206; 
 Sat, 04 Jul 2020 07:50:24 -0700 (PDT)
Received: from localhost.localdomain (1.red-83-51-162.dynamicip.rima-tde.net.
 [83.51.162.1])
 by smtp.gmail.com with ESMTPSA id r10sm17135019wrm.17.2020.07.04.07.50.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Jul 2020 07:50:23 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org,
	BALATON Zoltan <balaton@eik.bme.hu>
Subject: [PATCH 18/26] hw/usb/bus: Add usb_get_port_path()
Date: Sat,  4 Jul 2020 16:49:35 +0200
Message-Id: <20200704144943.18292-19-f4bug@amsat.org>
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

Refactor usb_get_full_dev_path() to take a 'want_full_path'
argument, and add usb_get_port_path() which returns a short
path.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 include/hw/usb.h | 10 ++++++++++
 hw/usb/bus.c     | 18 +++++++++++++-----
 2 files changed, 23 insertions(+), 5 deletions(-)

diff --git a/include/hw/usb.h b/include/hw/usb.h
index 8c3bc920ff..7ea502d421 100644
--- a/include/hw/usb.h
+++ b/include/hw/usb.h
@@ -506,6 +506,16 @@ void usb_port_location(USBPort *downstream, USBPort *upstream, int portnr);
 void usb_unregister_port(USBBus *bus, USBPort *port);
 void usb_claim_port(USBDevice *dev, Error **errp);
 void usb_release_port(USBDevice *dev);
+/**
+ * usb_get_port_path:
+ * @dev: the USB device
+ *
+ * The returned data must be released with g_free()
+ * when no longer required.
+ *
+ * Returns: a dynamically allocated pathname.
+ */
+char *usb_get_port_path(USBDevice *dev);
 void usb_device_attach(USBDevice *dev, Error **errp);
 int usb_device_detach(USBDevice *dev);
 void usb_check_attach(USBDevice *dev, Error **errp);
diff --git a/hw/usb/bus.c b/hw/usb/bus.c
index fad8194bf5..518e5b94ed 100644
--- a/hw/usb/bus.c
+++ b/hw/usb/bus.c
@@ -577,12 +577,10 @@ static void usb_bus_dev_print(Monitor *mon, DeviceState *qdev, int indent)
                    dev->attached ? ", attached" : "");
 }
 
-static char *usb_get_full_dev_path(DeviceState *qdev)
+static char *usb_get_dev_path(USBDevice *dev, bool want_full_path)
 {
-    USBDevice *dev = USB_DEVICE(qdev);
-
-    if (dev->flags & (1 << USB_DEV_FLAG_FULL_PATH)) {
-        DeviceState *hcd = qdev->parent_bus->parent;
+    if (want_full_path && (dev->flags & (1 << USB_DEV_FLAG_FULL_PATH))) {
+        DeviceState *hcd = DEVICE(dev)->parent_bus->parent;
         char *id = qdev_get_dev_path(hcd);
 
         if (id) {
@@ -594,6 +592,16 @@ static char *usb_get_full_dev_path(DeviceState *qdev)
     return g_strdup(dev->port->path);
 }
 
+static char *usb_get_full_dev_path(DeviceState *qdev)
+{
+    return usb_get_dev_path(USB_DEVICE(qdev), true);
+}
+
+char *usb_get_port_path(USBDevice *dev)
+{
+    return usb_get_dev_path(dev, false);
+}
+
 static char *usb_get_fw_dev_path(DeviceState *qdev)
 {
     USBDevice *dev = USB_DEVICE(qdev);
-- 
2.21.3


