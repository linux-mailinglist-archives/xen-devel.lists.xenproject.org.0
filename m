Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 39BCD2146A7
	for <lists+xen-devel@lfdr.de>; Sat,  4 Jul 2020 16:56:51 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jrjau-00056G-OO; Sat, 04 Jul 2020 14:56:44 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hHao=AP=gmail.com=philippe.mathieu.daude@srs-us1.protection.inumbo.net>)
 id 1jrjVp-0003ES-T1
 for xen-devel@lists.xenproject.org; Sat, 04 Jul 2020 14:51:29 +0000
X-Inumbo-ID: b3c731bc-be05-11ea-8496-bc764e2007e4
Received: from mail-wm1-x341.google.com (unknown [2a00:1450:4864:20::341])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b3c731bc-be05-11ea-8496-bc764e2007e4;
 Sat, 04 Jul 2020 14:50:29 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id q15so34721985wmj.2
 for <xen-devel@lists.xenproject.org>; Sat, 04 Jul 2020 07:50:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=fJVcVH4doVw6Km6BSM1MV1lDhvP8r9rvGpMs+kFykbo=;
 b=K2lwgSpyWnjq/h8TiOfPsKpInIWHa5+dz+1p8VTR4XavTCAi4oZM+nXkVl8WOqLewb
 ozsFFf2OwYpYbdZ3eiEwdCdNFB8xk060HSlm2pDLSmkmpqjw2t8zgC7WWS6Rtc2pYFI6
 pVhqULi6RzwvieAFZ+T/B0GoMZz0xSebo4MS/liGeIh0HixD4qcgipHRgT3GteBbaP3O
 NfDFlBiaubRh22WagrqyVHDevz3RsDYDG2zHsljANg3QGj+roWzdwYDe+wIiXCkn/EDo
 Tg6k/KyVg3AsKT99KsfBndK/TZAZVe77NfLq7pdi2mAnr6zr2XQ1x/QBBG4elYDZy0FK
 QunQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=fJVcVH4doVw6Km6BSM1MV1lDhvP8r9rvGpMs+kFykbo=;
 b=WT8ixSKz5EaUKPqUvBcyTOwMcxBkrUcOsfmalOsMmUT3a0El1RGA/IrSYMMRfTuqK2
 ObV18I01To2rGO+Y/hdkcFsuz/Ysw76Fhom84NqnrI9ycTD8qVJ9q3I+O15gyo++fZsd
 onXtwTRfQyPHZNH0HpWUTnYGteP4c8YJYuSRR12JKbM0YRJNvTh32RUCL6DsVbGWRP2i
 oihQlqYUzTu6mQXUO9/hdDvXOPjzf2pxsk6r+85xRRk3gEAx9NHIVKApEQkuAO23pSN7
 J+2iirE09vK0XQMuBv3YYhf+dZliXBQ84uMlrtDPwW6FoKfB9kqXtGNIo4dNhaI+UxOj
 HJiQ==
X-Gm-Message-State: AOAM530OTNXxatzadq/X3+8y2w16swIEi/FTcl2WN2sFGILrz5UqjxQ1
 KBvlB76CL8sTqFuBw536IfQ=
X-Google-Smtp-Source: ABdhPJwBkQVEoJtyk9IO8+500AN1sxUzaC/kjPlQwjEVcQTj3r8o+ql1zItIAXJmSwL9GUWTiy5ETg==
X-Received: by 2002:a1c:5986:: with SMTP id
 n128mr28975302wmb.112.1593874228406; 
 Sat, 04 Jul 2020 07:50:28 -0700 (PDT)
Received: from localhost.localdomain (1.red-83-51-162.dynamicip.rima-tde.net.
 [83.51.162.1])
 by smtp.gmail.com with ESMTPSA id r10sm17135019wrm.17.2020.07.04.07.50.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Jul 2020 07:50:27 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org,
	BALATON Zoltan <balaton@eik.bme.hu>
Subject: [PATCH 20/26] hw/usb: Introduce "hw/usb/usb.h" public API
Date: Sat,  4 Jul 2020 16:49:37 +0200
Message-Id: <20200704144943.18292-21-f4bug@amsat.org>
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

Only the USB devices require to access the USB internal APIs.

The rest of the code base only wants to consume USB devices
with a generic API. Move the generic declarations to the new
"hw/usb/usb.h" header.

Reported-by: BALATON Zoltan <balaton@eik.bme.hu>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 include/hw/usb.h      | 27 +-------------------
 include/hw/usb/usb.h  | 58 +++++++++++++++++++++++++++++++++++++++++++
 chardev/baum.c        |  2 +-
 hw/i386/pc.c          |  2 +-
 hw/i386/pc_piix.c     |  2 +-
 hw/i386/pc_q35.c      |  2 +-
 hw/ppc/mac_newworld.c |  2 +-
 hw/ppc/sam460ex.c     |  1 +
 hw/ppc/spapr.c        |  2 +-
 hw/sh4/r2d.c          |  2 +-
 hw/usb/host-stub.c    |  2 +-
 monitor/misc.c        |  2 +-
 softmmu/vl.c          |  2 +-
 13 files changed, 70 insertions(+), 36 deletions(-)
 create mode 100644 include/hw/usb/usb.h

diff --git a/include/hw/usb.h b/include/hw/usb.h
index 7ea502d421..2ea5186ea5 100644
--- a/include/hw/usb.h
+++ b/include/hw/usb.h
@@ -26,6 +26,7 @@
  */
 
 #include "hw/qdev-core.h"
+#include "hw/usb/usb.h"
 #include "qemu/iov.h"
 #include "qemu/queue.h"
 
@@ -176,7 +177,6 @@
 typedef struct USBBus USBBus;
 typedef struct USBBusOps USBBusOps;
 typedef struct USBPort USBPort;
-typedef struct USBDevice USBDevice;
 typedef struct USBPacket USBPacket;
 typedef struct USBCombinedPacket USBCombinedPacket;
 typedef struct USBEndpoint USBEndpoint;
@@ -256,9 +256,6 @@ struct USBDevice {
     const USBDescIface  *ifaces[USB_MAX_INTERFACES];
 };
 
-#define TYPE_USB_DEVICE "usb-device"
-#define USB_DEVICE(obj) \
-     OBJECT_CHECK(USBDevice, (obj), TYPE_USB_DEVICE)
 #define USB_DEVICE_CLASS(klass) \
      OBJECT_CLASS_CHECK(USBDeviceClass, (klass), TYPE_USB_DEVICE)
 #define USB_DEVICE_GET_CLASS(obj) \
@@ -459,15 +456,8 @@ void usb_device_reset(USBDevice *dev);
 void usb_wakeup(USBEndpoint *ep, unsigned int stream);
 void usb_generic_async_ctrl_complete(USBDevice *s, USBPacket *p);
 
-/* usb-linux.c */
-void hmp_info_usbhost(Monitor *mon, const QDict *qdict);
-bool usb_host_dev_is_scsi_storage(USBDevice *usbdev);
-
 /* usb-bus.c */
 
-#define TYPE_USB_BUS "usb-bus"
-#define USB_BUS(obj) OBJECT_CHECK(USBBus, (obj), TYPE_USB_BUS)
-
 struct USBBus {
     BusState qbus;
     USBBusOps *ops;
@@ -489,13 +479,8 @@ struct USBBusOps {
 void usb_bus_new(USBBus *bus, size_t bus_size,
                  USBBusOps *ops, DeviceState *host);
 void usb_bus_release(USBBus *bus);
-USBBus *usb_bus_find(int busnr);
 void usb_legacy_register(const char *typename, const char *usbdevice_name,
                          USBDevice *(*usbdevice_init)(const char *params));
-USBDevice *usb_new(const char *name);
-bool usb_realize_and_unref(USBDevice *dev, USBBus *bus, Error **errp);
-USBDevice *usb_create_simple(USBBus *bus, const char *name);
-USBDevice *usbdevice_create(const char *cmdline);
 void usb_register_port(USBBus *bus, USBPort *port, void *opaque, int index,
                        USBPortOps *ops, int speedmask);
 void usb_register_companion(const char *masterbus, USBPort *ports[],
@@ -506,16 +491,6 @@ void usb_port_location(USBPort *downstream, USBPort *upstream, int portnr);
 void usb_unregister_port(USBBus *bus, USBPort *port);
 void usb_claim_port(USBDevice *dev, Error **errp);
 void usb_release_port(USBDevice *dev);
-/**
- * usb_get_port_path:
- * @dev: the USB device
- *
- * The returned data must be released with g_free()
- * when no longer required.
- *
- * Returns: a dynamically allocated pathname.
- */
-char *usb_get_port_path(USBDevice *dev);
 void usb_device_attach(USBDevice *dev, Error **errp);
 int usb_device_detach(USBDevice *dev);
 void usb_check_attach(USBDevice *dev, Error **errp);
diff --git a/include/hw/usb/usb.h b/include/hw/usb/usb.h
new file mode 100644
index 0000000000..9a13b08503
--- /dev/null
+++ b/include/hw/usb/usb.h
@@ -0,0 +1,58 @@
+/*
+ * QEMU USB API
+ *
+ * Copyright (c) 2005 Fabrice Bellard
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a copy
+ * of this software and associated documentation files (the "Software"), to deal
+ * in the Software without restriction, including without limitation the rights
+ * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
+ * copies of the Software, and to permit persons to whom the Software is
+ * furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice shall be included in
+ * all copies or substantial portions of the Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
+ * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
+ * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
+ * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
+ * THE SOFTWARE.
+ */
+#ifndef QEMU_HW_USB_H
+#define QEMU_HW_USB_H
+
+typedef struct USBDevice USBDevice;
+
+#define TYPE_USB_DEVICE "usb-device"
+#define USB_DEVICE(obj) \
+     OBJECT_CHECK(USBDevice, (obj), TYPE_USB_DEVICE)
+
+typedef struct USBBus USBBus;
+
+#define TYPE_USB_BUS "usb-bus"
+#define USB_BUS(obj) OBJECT_CHECK(USBBus, (obj), TYPE_USB_BUS)
+
+USBBus *usb_bus_find(int busnr);
+USBDevice *usb_new(const char *name);
+bool usb_realize_and_unref(USBDevice *dev, USBBus *bus, Error **errp);
+USBDevice *usb_create_simple(USBBus *bus, const char *name);
+USBDevice *usbdevice_create(const char *cmdline);
+
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
+
+void hmp_info_usbhost(Monitor *mon, const QDict *qdict);
+bool usb_host_dev_is_scsi_storage(USBDevice *usbdev);
+
+#endif
diff --git a/chardev/baum.c b/chardev/baum.c
index 9c95e7bc79..fc04bf2e2f 100644
--- a/chardev/baum.c
+++ b/chardev/baum.c
@@ -28,7 +28,7 @@
 #include "qemu/main-loop.h"
 #include "qemu/module.h"
 #include "qemu/timer.h"
-#include "hw/usb.h"
+#include "hw/usb/usb.h"
 #include "ui/console.h"
 #include <brlapi.h>
 #include <brlapi_constants.h>
diff --git a/hw/i386/pc.c b/hw/i386/pc.c
index 4af9679d03..a890f57ac2 100644
--- a/hw/i386/pc.c
+++ b/hw/i386/pc.c
@@ -83,7 +83,7 @@
 #include "qapi/qapi-visit-common.h"
 #include "qapi/visitor.h"
 #include "hw/core/cpu.h"
-#include "hw/usb.h"
+#include "hw/usb/usb.h"
 #include "hw/i386/intel_iommu.h"
 #include "hw/net/ne2000-isa.h"
 #include "standard-headers/asm-x86/bootparam.h"
diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
index 1d832b2878..4d1de7cfab 100644
--- a/hw/i386/pc_piix.c
+++ b/hw/i386/pc_piix.c
@@ -36,7 +36,7 @@
 #include "hw/firmware/smbios.h"
 #include "hw/pci/pci.h"
 #include "hw/pci/pci_ids.h"
-#include "hw/usb.h"
+#include "hw/usb/usb.h"
 #include "net/net.h"
 #include "hw/ide/pci.h"
 #include "hw/irq.h"
diff --git a/hw/i386/pc_q35.c b/hw/i386/pc_q35.c
index 047ea8db28..b985f5bea1 100644
--- a/hw/i386/pc_q35.c
+++ b/hw/i386/pc_q35.c
@@ -50,7 +50,7 @@
 #include "hw/firmware/smbios.h"
 #include "hw/ide/pci.h"
 #include "hw/ide/ahci.h"
-#include "hw/usb.h"
+#include "hw/usb/usb.h"
 #include "qapi/error.h"
 #include "qemu/error-report.h"
 #include "sysemu/numa.h"
diff --git a/hw/ppc/mac_newworld.c b/hw/ppc/mac_newworld.c
index 828c5992ae..7bf69f4a1f 100644
--- a/hw/ppc/mac_newworld.c
+++ b/hw/ppc/mac_newworld.c
@@ -69,7 +69,7 @@
 #include "sysemu/kvm.h"
 #include "sysemu/reset.h"
 #include "kvm_ppc.h"
-#include "hw/usb.h"
+#include "hw/usb/usb.h"
 #include "exec/address-spaces.h"
 #include "hw/sysbus.h"
 #include "trace.h"
diff --git a/hw/ppc/sam460ex.c b/hw/ppc/sam460ex.c
index fae970b142..781b45e14b 100644
--- a/hw/ppc/sam460ex.c
+++ b/hw/ppc/sam460ex.c
@@ -35,6 +35,7 @@
 #include "hw/char/serial.h"
 #include "hw/i2c/ppc4xx_i2c.h"
 #include "hw/i2c/smbus_eeprom.h"
+#include "hw/usb/usb.h"
 #include "hw/usb/hcd-ehci.h"
 #include "hw/ppc/fdt.h"
 #include "hw/qdev-properties.h"
diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
index 221d3e7a8c..0c0409077f 100644
--- a/hw/ppc/spapr.c
+++ b/hw/ppc/spapr.c
@@ -70,7 +70,7 @@
 
 #include "exec/address-spaces.h"
 #include "exec/ram_addr.h"
-#include "hw/usb.h"
+#include "hw/usb/usb.h"
 #include "qemu/config-file.h"
 #include "qemu/error-report.h"
 #include "trace.h"
diff --git a/hw/sh4/r2d.c b/hw/sh4/r2d.c
index 443820901d..a39c378855 100644
--- a/hw/sh4/r2d.c
+++ b/hw/sh4/r2d.c
@@ -40,7 +40,7 @@
 #include "hw/ide.h"
 #include "hw/irq.h"
 #include "hw/loader.h"
-#include "hw/usb.h"
+#include "hw/usb/usb.h"
 #include "hw/block/flash.h"
 #include "exec/address-spaces.h"
 
diff --git a/hw/usb/host-stub.c b/hw/usb/host-stub.c
index 538ed29684..11b754892d 100644
--- a/hw/usb/host-stub.c
+++ b/hw/usb/host-stub.c
@@ -32,7 +32,7 @@
 
 #include "qemu/osdep.h"
 #include "ui/console.h"
-#include "hw/usb.h"
+#include "hw/usb/usb.h"
 #include "monitor/monitor.h"
 
 void hmp_info_usbhost(Monitor *mon, const QDict *qdict)
diff --git a/monitor/misc.c b/monitor/misc.c
index 89bb970b00..65c0f887dd 100644
--- a/monitor/misc.c
+++ b/monitor/misc.c
@@ -26,7 +26,7 @@
 #include "monitor-internal.h"
 #include "cpu.h"
 #include "monitor/qdev.h"
-#include "hw/usb.h"
+#include "hw/usb/usb.h"
 #include "hw/pci/pci.h"
 #include "sysemu/watchdog.h"
 #include "hw/loader.h"
diff --git a/softmmu/vl.c b/softmmu/vl.c
index 3e15ee2435..25a13e913e 100644
--- a/softmmu/vl.c
+++ b/softmmu/vl.c
@@ -41,7 +41,7 @@
 #include "qemu/error-report.h"
 #include "qemu/sockets.h"
 #include "sysemu/accel.h"
-#include "hw/usb.h"
+#include "hw/usb/usb.h"
 #include "hw/isa/isa.h"
 #include "hw/scsi/scsi.h"
 #include "hw/display/vga.h"
-- 
2.21.3


