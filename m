Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D3B621469E
	for <lists+xen-devel@lfdr.de>; Sat,  4 Jul 2020 16:56:36 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jrjah-0004uv-8n; Sat, 04 Jul 2020 14:56:31 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hHao=AP=gmail.com=philippe.mathieu.daude@srs-us1.protection.inumbo.net>)
 id 1jrjVQ-0003ES-Rb
 for xen-devel@lists.xenproject.org; Sat, 04 Jul 2020 14:51:04 +0000
X-Inumbo-ID: ad8de00c-be05-11ea-bca7-bc764e2007e4
Received: from mail-wr1-x442.google.com (unknown [2a00:1450:4864:20::442])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ad8de00c-be05-11ea-bca7-bc764e2007e4;
 Sat, 04 Jul 2020 14:50:18 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id z2so13505031wrp.2
 for <xen-devel@lists.xenproject.org>; Sat, 04 Jul 2020 07:50:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=F2y1uml1RkFfNsOb+m2iyzdDwj1uXo3NnuLQTrqdA9s=;
 b=XuFU4CBE8JCcfpdI/mR5sE2jyMeyBckQOwPMTtzwJf8CjscRTofonY09HxmwJm00NE
 hgXaGKtjBGKgBEytwuJ+1LT1UMvcBupnCU5041RZtHT4vwcBWQo/M/+GghnU6sLvVTLF
 Y0OX5yURCQg13pYSivq8FFPYj7wg8wOD1j0jENHOgxaRTzOtllVlw7cjPNFn2IWH1BIq
 Sm6KuoljtLR0LbF6gX5rfDBtKX6CprkJZYeXQzCIGgZcLZdQ6vORkbiRnRe5hvsbF/uS
 OWFgKWrvnxxqFL1fM5rMPeqOvIkLQG0cFB/v/CHa/YpQquR2m9B6/D1fPzqQ7wWU0wd9
 8j+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=F2y1uml1RkFfNsOb+m2iyzdDwj1uXo3NnuLQTrqdA9s=;
 b=H/G7fkqj0E3OCviW9kEBbWZdxAr5nwASou7X2g/Hfk+J8LIjzErTqtdIR9EZ4w2sVv
 PAMOOmkMhcyJIzpJYqbsNNa1KdMY7mYkdxO8Jf22guUgkz/FprHaMOeHyHG/ovQ8QLVe
 RnUCnVPNRt6AFI9oYuBFiwWOWFlASNomhFdvxAG0GAcJQxKgQyW9PBmSwQBj4XWZj9mI
 zl1E30xKWdyn8qS9iJgM1KDv1YuGvmlKQqPBrDSrGZSRu7pAMhA0McdmHOUx64+615nT
 KQQw+N3pNDITS2CWIDXetMJD0eqm/wgC+UbrwlwDbt65k4gNZgm4nXSFyTCH1GAzgbim
 zPWw==
X-Gm-Message-State: AOAM532/JnBDwUIaUrD2E0p1JxILIccKHN+e5nbylYeSaXBGT0x9lxIO
 RnVVGipftxcsKshHnCYibSg=
X-Google-Smtp-Source: ABdhPJyq/7eRAGeHxJJ4O+Zutc0Mt3EntxvTem4i1yYIv/0yUmC2RdRBoUXQL+VySe0UhHY6Lv3gOQ==
X-Received: by 2002:a5d:6a01:: with SMTP id m1mr43778986wru.115.1593874218068; 
 Sat, 04 Jul 2020 07:50:18 -0700 (PDT)
Received: from localhost.localdomain (1.red-83-51-162.dynamicip.rima-tde.net.
 [83.51.162.1])
 by smtp.gmail.com with ESMTPSA id r10sm17135019wrm.17.2020.07.04.07.50.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Jul 2020 07:50:17 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org,
	BALATON Zoltan <balaton@eik.bme.hu>
Subject: [PATCH 15/26] hw/usb: Add new 'usb-quirks.h' local header
Date: Sat,  4 Jul 2020 16:49:32 +0200
Message-Id: <20200704144943.18292-16-f4bug@amsat.org>
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

Only redirect.c consumes the quirks API. Reduce the big "hw/usb.h"
header by moving the quirks related declaration into their own
header. As nothing out of hw/usb/ requires it, keep it local.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/usb/usb-quirks.h | 27 +++++++++++++++++++++++++++
 include/hw/usb.h    | 11 -----------
 hw/usb/quirks.c     |  1 +
 hw/usb/redirect.c   |  1 +
 4 files changed, 29 insertions(+), 11 deletions(-)
 create mode 100644 hw/usb/usb-quirks.h

diff --git a/hw/usb/usb-quirks.h b/hw/usb/usb-quirks.h
new file mode 100644
index 0000000000..542889efc4
--- /dev/null
+++ b/hw/usb/usb-quirks.h
@@ -0,0 +1,27 @@
+/*
+ * USB quirk handling
+ *
+ * Copyright (c) 2012 Red Hat, Inc.
+ *
+ * Red Hat Authors:
+ * Hans de Goede <hdegoede@redhat.com>
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License as published by
+ * the Free Software Foundation; either version 2 of the License, or
+ * (at your option) any later version.
+ */
+
+#ifndef HW_USB_QUIRKS_H
+#define HW_USB_QUIRKS_H
+
+/* In bulk endpoints are streaming data sources (iow behave like isoc eps) */
+#define USB_QUIRK_BUFFER_BULK_IN        0x01
+/* Bulk pkts in FTDI format, need special handling when combining packets */
+#define USB_QUIRK_IS_FTDI               0x02
+
+int usb_get_quirks(uint16_t vendor_id, uint16_t product_id,
+                   uint8_t interface_class, uint8_t interface_subclass,
+                   uint8_t interface_protocol);
+
+#endif
diff --git a/include/hw/usb.h b/include/hw/usb.h
index 18f1349bdc..8c3bc920ff 100644
--- a/include/hw/usb.h
+++ b/include/hw/usb.h
@@ -549,15 +549,4 @@ int usb_device_alloc_streams(USBDevice *dev, USBEndpoint **eps, int nr_eps,
                              int streams);
 void usb_device_free_streams(USBDevice *dev, USBEndpoint **eps, int nr_eps);
 
-/* quirks.c */
-
-/* In bulk endpoints are streaming data sources (iow behave like isoc eps) */
-#define USB_QUIRK_BUFFER_BULK_IN	0x01
-/* Bulk pkts in FTDI format, need special handling when combining packets */
-#define USB_QUIRK_IS_FTDI		0x02
-
-int usb_get_quirks(uint16_t vendor_id, uint16_t product_id,
-                   uint8_t interface_class, uint8_t interface_subclass,
-                   uint8_t interface_protocol);
-
 #endif
diff --git a/hw/usb/quirks.c b/hw/usb/quirks.c
index 655b36f2d5..b0d0f87e35 100644
--- a/hw/usb/quirks.c
+++ b/hw/usb/quirks.c
@@ -15,6 +15,7 @@
 #include "qemu/osdep.h"
 #include "quirks.inc.c"
 #include "hw/usb.h"
+#include "usb-quirks.h"
 
 static bool usb_id_match(const struct usb_device_id *ids,
                          uint16_t vendor_id, uint16_t product_id,
diff --git a/hw/usb/redirect.c b/hw/usb/redirect.c
index 417a60a2e6..4c5925a039 100644
--- a/hw/usb/redirect.c
+++ b/hw/usb/redirect.c
@@ -45,6 +45,7 @@
 #include "hw/usb.h"
 #include "migration/qemu-file-types.h"
 #include "migration/vmstate.h"
+#include "usb-quirks.h"
 
 /* ERROR is defined below. Remove any previous definition. */
 #undef ERROR
-- 
2.21.3


