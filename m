Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 01EF82146A5
	for <lists+xen-devel@lfdr.de>; Sat,  4 Jul 2020 16:56:50 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jrjau-00054s-0x; Sat, 04 Jul 2020 14:56:44 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hHao=AP=gmail.com=philippe.mathieu.daude@srs-us1.protection.inumbo.net>)
 id 1jrjVG-0003ES-R1
 for xen-devel@lists.xenproject.org; Sat, 04 Jul 2020 14:50:54 +0000
X-Inumbo-ID: ab2286ec-be05-11ea-8496-bc764e2007e4
Received: from mail-wm1-x342.google.com (unknown [2a00:1450:4864:20::342])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ab2286ec-be05-11ea-8496-bc764e2007e4;
 Sat, 04 Jul 2020 14:50:14 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id o2so37044911wmh.2
 for <xen-devel@lists.xenproject.org>; Sat, 04 Jul 2020 07:50:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=k+8FH1LHVyWY5lxn8kaV6RhN5WT6vNL6Csn+tWtGqIU=;
 b=IB9L+DJ6fMSlRh6JnfVIyjRfs3r2+cKnkCMh6AOc0lm/+BaC+pa5gw3hPPcon8hyCC
 TQRh9Dsuy4N9iNSa+sDAo59Wb9OBUTJhWrGiQYUiHaJcD2YjCqcZFlX3q6wvN0kzv12y
 zjRWD0O+C14SgaG835wapqV4fOHwaoE+lia4hfdbd5Zyk+XJzdC2t6DGiCxQ8vTcnZgX
 354/5VYBjRfY9uD1tT+MK47AGBcB3P1p8J9RpLbDsqF2ri9rbyNs8LgFGF8k/fGIcKWy
 wmxNBkxWFAH/E/5EdZfvMLkUm0kbfAlZiV+UjR0G1MRggb5dB2nI2Req9hTae4hUmE3t
 glLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=k+8FH1LHVyWY5lxn8kaV6RhN5WT6vNL6Csn+tWtGqIU=;
 b=MZIH5rHd4EJdp9pxTlRTLiGYMdF3qeb5auU+xu5I6gTmaLxMaIEjrabPIdqwTpwNOS
 n5c3ZVqsoKeeg4NjxLypxvRUUvroOna4ee6yGyTjfCqAgz60lcScih58bnyDg/uTJJWw
 +HSE9RnO57qHwLE0pwexr6X7Pu/aWNU5kxPHMKiYHmkiHRVwKjAM/aoon3dpPFFc0/5w
 VfnDhnU3feWr3NCp5TifbjFf+g7oQq8tyIKcX3d38t3Yf7Q7fpmA4+kXhbOfwbMTQX9a
 v1BTBaJ4Ba+Cuzn+eY8rfVH4jeYOtrBpMAicDkgsbWqX3h4j2LfWK1+TMJQr7HKQOQ21
 X4Fw==
X-Gm-Message-State: AOAM533F+nZPJraafRbz67xt8oPF8p9kdUiBrVwg9P83EopqRWezICiC
 USWTu41fj7QqNHwoW0Kpf6c=
X-Google-Smtp-Source: ABdhPJzNTGufYfLMeOUgBhGaylb5O5upKi84ytezyRjwfpHgpubMO2vfpa3tyGQAl3MlqZSVzS+XTQ==
X-Received: by 2002:a1c:48:: with SMTP id 69mr43033872wma.32.1593874214066;
 Sat, 04 Jul 2020 07:50:14 -0700 (PDT)
Received: from localhost.localdomain (1.red-83-51-162.dynamicip.rima-tde.net.
 [83.51.162.1])
 by smtp.gmail.com with ESMTPSA id r10sm17135019wrm.17.2020.07.04.07.50.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Jul 2020 07:50:13 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org,
	BALATON Zoltan <balaton@eik.bme.hu>
Subject: [PATCH 13/26] hw/usb/desc: Reduce some declarations scope
Date: Sat,  4 Jul 2020 16:49:30 +0200
Message-Id: <20200704144943.18292-14-f4bug@amsat.org>
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

USBDescString is forward-declared. Only bus.c uses the
usb_device_get_product_desc() and usb_device_get_usb_desc()
function. Move all that to the "desc.h" header to reduce
the big "hw/usb.h" header a bit.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/usb/desc.h    | 10 ++++++++++
 include/hw/usb.h | 10 ----------
 hw/usb/bus.c     |  1 +
 3 files changed, 11 insertions(+), 10 deletions(-)

diff --git a/hw/usb/desc.h b/hw/usb/desc.h
index 92594fbe29..4bf6966c4b 100644
--- a/hw/usb/desc.h
+++ b/hw/usb/desc.h
@@ -242,4 +242,14 @@ int usb_desc_get_descriptor(USBDevice *dev, USBPacket *p,
 int usb_desc_handle_control(USBDevice *dev, USBPacket *p,
         int request, int value, int index, int length, uint8_t *data);
 
+const char *usb_device_get_product_desc(USBDevice *dev);
+
+const USBDesc *usb_device_get_usb_desc(USBDevice *dev);
+
+struct USBDescString {
+    uint8_t index;
+    char *str;
+    QLIST_ENTRY(USBDescString) next;
+};
+
 #endif /* QEMU_HW_USB_DESC_H */
diff --git a/include/hw/usb.h b/include/hw/usb.h
index 15b2ef300a..18f1349bdc 100644
--- a/include/hw/usb.h
+++ b/include/hw/usb.h
@@ -192,12 +192,6 @@ typedef struct USBDescOther USBDescOther;
 typedef struct USBDescString USBDescString;
 typedef struct USBDescMSOS USBDescMSOS;
 
-struct USBDescString {
-    uint8_t index;
-    char *str;
-    QLIST_ENTRY(USBDescString) next;
-};
-
 #define USB_MAX_ENDPOINTS  15
 #define USB_MAX_INTERFACES 16
 
@@ -555,10 +549,6 @@ int usb_device_alloc_streams(USBDevice *dev, USBEndpoint **eps, int nr_eps,
                              int streams);
 void usb_device_free_streams(USBDevice *dev, USBEndpoint **eps, int nr_eps);
 
-const char *usb_device_get_product_desc(USBDevice *dev);
-
-const USBDesc *usb_device_get_usb_desc(USBDevice *dev);
-
 /* quirks.c */
 
 /* In bulk endpoints are streaming data sources (iow behave like isoc eps) */
diff --git a/hw/usb/bus.c b/hw/usb/bus.c
index 957559b18d..111c3af7c1 100644
--- a/hw/usb/bus.c
+++ b/hw/usb/bus.c
@@ -9,6 +9,7 @@
 #include "monitor/monitor.h"
 #include "trace.h"
 #include "qemu/cutils.h"
+#include "desc.h"
 
 static void usb_bus_dev_print(Monitor *mon, DeviceState *qdev, int indent);
 
-- 
2.21.3


