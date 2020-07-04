Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A50372146A2
	for <lists+xen-devel@lfdr.de>; Sat,  4 Jul 2020 16:56:39 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jrjai-0004wt-Ts; Sat, 04 Jul 2020 14:56:32 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hHao=AP=gmail.com=philippe.mathieu.daude@srs-us1.protection.inumbo.net>)
 id 1jrjVu-0003ES-T0
 for xen-devel@lists.xenproject.org; Sat, 04 Jul 2020 14:51:34 +0000
X-Inumbo-ID: b54c7c68-be05-11ea-bca7-bc764e2007e4
Received: from mail-wm1-x343.google.com (unknown [2a00:1450:4864:20::343])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b54c7c68-be05-11ea-bca7-bc764e2007e4;
 Sat, 04 Jul 2020 14:50:31 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id q15so34722043wmj.2
 for <xen-devel@lists.xenproject.org>; Sat, 04 Jul 2020 07:50:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=BVN2tL6FsOSYOSZ1Rnc/AWNY9pAl08p/yTnmHBA4/lE=;
 b=pCckQw2fpxMWuUrRXy5Fj3fHnP1lNxTV/c5641pZ9JVVlE/7SDn5Q+r8sSpmGeHEtX
 DQ82DdmBJfjkp7u54KKO9Ay1CQm1OqoeBDjN4toemHPaBd5JcfQL3QaYsoKMSYnMcZ86
 cZkSflzpX4ea7A2bLQiMRirFJDw5g/vdSSr9sfwJoCmDfKl2BVC60kE20D3yzbnZa1ls
 bJh1WPioULkSM6b3/MugK1q0os9mcW2PgGSAqfRiQY3jHTvkj9TCGs9ygvVJCLAyMiEa
 nPCSpr4C+N0nVyXsOtCts8cDGKX+c88yfVcUQmPePkBlul0t7jTng4E9ABkXxABaOIFb
 KvpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=BVN2tL6FsOSYOSZ1Rnc/AWNY9pAl08p/yTnmHBA4/lE=;
 b=my7cNrqN+E9EYtMbSgLDkG+qhnBFTz+k0cP4b2wHNG1+2JHpqaWVya3UnTc0WLhIoR
 ZIn06Jo8tku9CBXdeT6f2F4k0AsxjG70wtXK2MZt/N4IHe1FRwaCMEZbinn/yp/WP3lo
 rFnpBfKDEiuJlPnJD4ry5tcxX4+IAVv5eRFYRod9uchjSUgSxZyOqiRuF/DCNnyGnCs5
 uTrjDIpfc8ArBLYXtbBxLSdWQKluwxRkvSd9Z/TVgP5fb287vSlKYHG7GcOE9a5/11sP
 W+hFgn56wK0BbXboFniKCa10ZIgEaJ5wuB2chGDwFX7tshV2JuCIB4MLfkYs9SL8zzVS
 n+cg==
X-Gm-Message-State: AOAM531GruCTHnBC0zIKqK2NFL4VCJQS9q0yw6YjX7ujkOTv/n5I2Fqu
 5Zgkc80tPlytl7z3G8wOrok=
X-Google-Smtp-Source: ABdhPJwaQwLIlLdyKxBkKPa8GBks7V8EDYQ/7hiL57HMX9nYvfh3kbH/YgCk6NdT+Qi4tqQqI6p6nw==
X-Received: by 2002:a7b:cc08:: with SMTP id f8mr43795677wmh.106.1593874230724; 
 Sat, 04 Jul 2020 07:50:30 -0700 (PDT)
Received: from localhost.localdomain (1.red-83-51-162.dynamicip.rima-tde.net.
 [83.51.162.1])
 by smtp.gmail.com with ESMTPSA id r10sm17135019wrm.17.2020.07.04.07.50.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Jul 2020 07:50:30 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org,
	BALATON Zoltan <balaton@eik.bme.hu>
Subject: [PATCH 21/26] hw/usb: Move internal API to local 'usb-internal.h'
 header
Date: Sat,  4 Jul 2020 16:49:38 +0200
Message-Id: <20200704144943.18292-22-f4bug@amsat.org>
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

Only the files under hw/usb/ require access to the USB internal
API. Move include/hw/usb.h to hw/usb/usb-internal.h to reduce
its scope.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/usb/desc.h                             | 2 +-
 hw/usb/hcd-dwc2.h                         | 2 +-
 hw/usb/hcd-ehci.h                         | 2 +-
 hw/usb/hcd-ohci.h                         | 2 +-
 hw/usb/hcd-xhci.h                         | 2 +-
 include/hw/usb.h => hw/usb/usb-internal.h | 7 +++----
 hw/usb/bus.c                              | 2 +-
 hw/usb/combined-packet.c                  | 2 +-
 hw/usb/core.c                             | 2 +-
 hw/usb/desc-msos.c                        | 2 +-
 hw/usb/desc.c                             | 3 +--
 hw/usb/dev-audio.c                        | 2 +-
 hw/usb/dev-hid.c                          | 2 +-
 hw/usb/dev-hub.c                          | 2 +-
 hw/usb/dev-mtp.c                          | 2 +-
 hw/usb/dev-network.c                      | 2 +-
 hw/usb/dev-serial.c                       | 2 +-
 hw/usb/dev-smartcard-reader.c             | 2 +-
 hw/usb/dev-storage.c                      | 2 +-
 hw/usb/dev-uas.c                          | 2 +-
 hw/usb/dev-wacom.c                        | 2 +-
 hw/usb/hcd-dwc2.c                         | 1 +
 hw/usb/hcd-musb.c                         | 2 +-
 hw/usb/hcd-ohci-pci.c                     | 2 +-
 hw/usb/hcd-ohci.c                         | 1 -
 hw/usb/hcd-uhci.c                         | 2 +-
 hw/usb/hcd-xhci-nec.c                     | 3 +--
 hw/usb/hcd-xhci.c                         | 2 +-
 hw/usb/host-libusb.c                      | 2 +-
 hw/usb/libhw.c                            | 2 +-
 hw/usb/quirks.c                           | 2 +-
 hw/usb/redirect.c                         | 2 +-
 hw/usb/tusb6010.c                         | 2 +-
 hw/usb/xen-usb.c                          | 2 +-
 MAINTAINERS                               | 1 -
 35 files changed, 35 insertions(+), 39 deletions(-)
 rename include/hw/usb.h => hw/usb/usb-internal.h (99%)

diff --git a/hw/usb/desc.h b/hw/usb/desc.h
index 4bf6966c4b..ee4f042602 100644
--- a/hw/usb/desc.h
+++ b/hw/usb/desc.h
@@ -2,7 +2,7 @@
 #define QEMU_HW_USB_DESC_H
 
 #include <wchar.h>
-#include "hw/usb.h"
+#include "usb-internal.h"
 
 /* binary representation */
 typedef struct USBDescriptor {
diff --git a/hw/usb/hcd-dwc2.h b/hw/usb/hcd-dwc2.h
index 2adf0f53c7..2dfb3f3bc5 100644
--- a/hw/usb/hcd-dwc2.h
+++ b/hw/usb/hcd-dwc2.h
@@ -20,7 +20,7 @@
 #define HW_USB_DWC2_H
 
 #include "hw/sysbus.h"
-#include "hw/usb.h"
+#include "usb-internal.h"
 
 #define DWC2_MMIO_SIZE      0x11000
 
diff --git a/hw/usb/hcd-ehci.h b/hw/usb/hcd-ehci.h
index 4577f5e31d..337b3ad05c 100644
--- a/hw/usb/hcd-ehci.h
+++ b/hw/usb/hcd-ehci.h
@@ -19,10 +19,10 @@
 #define HW_USB_HCD_EHCI_H
 
 #include "qemu/timer.h"
-#include "hw/usb.h"
 #include "sysemu/dma.h"
 #include "hw/pci/pci.h"
 #include "hw/sysbus.h"
+#include "usb-internal.h"
 
 #define CAPA_SIZE        0x10
 
diff --git a/hw/usb/hcd-ohci.h b/hw/usb/hcd-ohci.h
index 5c8819aedf..771927ea17 100644
--- a/hw/usb/hcd-ohci.h
+++ b/hw/usb/hcd-ohci.h
@@ -22,7 +22,7 @@
 #define HCD_OHCI_H
 
 #include "sysemu/dma.h"
-#include "hw/usb.h"
+#include "usb-internal.h"
 
 /* Number of Downstream Ports on the root hub: */
 #define OHCI_MAX_PORTS 15
diff --git a/hw/usb/hcd-xhci.h b/hw/usb/hcd-xhci.h
index 8edbdc2c3e..f9a3aaceec 100644
--- a/hw/usb/hcd-xhci.h
+++ b/hw/usb/hcd-xhci.h
@@ -22,7 +22,7 @@
 #ifndef HW_USB_HCD_XHCI_H
 #define HW_USB_HCD_XHCI_H
 
-#include "hw/usb.h"
+#include "usb-internal.h"
 
 #define TYPE_XHCI "base-xhci"
 #define TYPE_NEC_XHCI "nec-usb-xhci"
diff --git a/include/hw/usb.h b/hw/usb/usb-internal.h
similarity index 99%
rename from include/hw/usb.h
rename to hw/usb/usb-internal.h
index 2ea5186ea5..ceafb65936 100644
--- a/include/hw/usb.h
+++ b/hw/usb/usb-internal.h
@@ -1,8 +1,5 @@
-#ifndef QEMU_USB_H
-#define QEMU_USB_H
-
 /*
- * QEMU USB API
+ * QEMU USB internal API
  *
  * Copyright (c) 2005 Fabrice Bellard
  *
@@ -24,6 +21,8 @@
  * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
  * THE SOFTWARE.
  */
+#ifndef QEMU_USB_INTERNAL_H
+#define QEMU_USB_INTERNAL_H
 
 #include "hw/qdev-core.h"
 #include "hw/usb/usb.h"
diff --git a/hw/usb/bus.c b/hw/usb/bus.c
index 518e5b94ed..ba6c48e800 100644
--- a/hw/usb/bus.c
+++ b/hw/usb/bus.c
@@ -1,6 +1,5 @@
 #include "qemu/osdep.h"
 #include "hw/qdev-properties.h"
-#include "hw/usb.h"
 #include "qapi/error.h"
 #include "qemu/error-report.h"
 #include "qemu/module.h"
@@ -9,6 +8,7 @@
 #include "monitor/monitor.h"
 #include "trace.h"
 #include "qemu/cutils.h"
+#include "usb-internal.h"
 #include "desc.h"
 
 static void usb_bus_dev_print(Monitor *mon, DeviceState *qdev, int indent);
diff --git a/hw/usb/combined-packet.c b/hw/usb/combined-packet.c
index 5d57e883dc..28e19aad12 100644
--- a/hw/usb/combined-packet.c
+++ b/hw/usb/combined-packet.c
@@ -21,9 +21,9 @@
  */
 #include "qemu/osdep.h"
 #include "qemu/units.h"
-#include "hw/usb.h"
 #include "qemu/iov.h"
 #include "trace.h"
+#include "usb-internal.h"
 
 static void usb_combined_packet_add(USBCombinedPacket *combined, USBPacket *p)
 {
diff --git a/hw/usb/core.c b/hw/usb/core.c
index 5abd128b6b..6fed698d20 100644
--- a/hw/usb/core.c
+++ b/hw/usb/core.c
@@ -24,9 +24,9 @@
  * THE SOFTWARE.
  */
 #include "qemu/osdep.h"
-#include "hw/usb.h"
 #include "qemu/iov.h"
 #include "trace.h"
+#include "usb-internal.h"
 
 void usb_pick_speed(USBPort *port)
 {
diff --git a/hw/usb/desc-msos.c b/hw/usb/desc-msos.c
index 3a5ad7c8d0..79a8093f3f 100644
--- a/hw/usb/desc-msos.c
+++ b/hw/usb/desc-msos.c
@@ -1,6 +1,6 @@
 #include "qemu/osdep.h"
-#include "hw/usb.h"
 #include "desc.h"
+#include "usb-internal.h"
 
 /*
  * Microsoft OS Descriptors
diff --git a/hw/usb/desc.c b/hw/usb/desc.c
index 8b6eaea407..defb344014 100644
--- a/hw/usb/desc.c
+++ b/hw/usb/desc.c
@@ -1,8 +1,7 @@
 #include "qemu/osdep.h"
-
-#include "hw/usb.h"
 #include "desc.h"
 #include "trace.h"
+#include "usb-internal.h"
 
 /* ------------------------------------------------------------------ */
 
diff --git a/hw/usb/dev-audio.c b/hw/usb/dev-audio.c
index 1371c44f48..1e4d1051f3 100644
--- a/hw/usb/dev-audio.c
+++ b/hw/usb/dev-audio.c
@@ -32,10 +32,10 @@
 #include "qemu/osdep.h"
 #include "qemu/module.h"
 #include "hw/qdev-properties.h"
-#include "hw/usb.h"
 #include "migration/vmstate.h"
 #include "desc.h"
 #include "audio/audio.h"
+#include "usb-internal.h"
 
 static void usb_audio_reinit(USBDevice *dev, unsigned channels);
 
diff --git a/hw/usb/dev-hid.c b/hw/usb/dev-hid.c
index 89f63b698b..59b47272ba 100644
--- a/hw/usb/dev-hid.c
+++ b/hw/usb/dev-hid.c
@@ -25,7 +25,6 @@
 
 #include "qemu/osdep.h"
 #include "ui/console.h"
-#include "hw/usb.h"
 #include "migration/vmstate.h"
 #include "desc.h"
 #include "qapi/error.h"
@@ -33,6 +32,7 @@
 #include "qemu/timer.h"
 #include "hw/input/hid.h"
 #include "hw/qdev-properties.h"
+#include "usb-internal.h"
 
 /* HID interface requests */
 #define GET_REPORT   0xa101
diff --git a/hw/usb/dev-hub.c b/hw/usb/dev-hub.c
index 5f19dd9fb5..b394ae9983 100644
--- a/hw/usb/dev-hub.c
+++ b/hw/usb/dev-hub.c
@@ -27,11 +27,11 @@
 #include "qemu/timer.h"
 #include "trace.h"
 #include "hw/qdev-properties.h"
-#include "hw/usb.h"
 #include "migration/vmstate.h"
 #include "desc.h"
 #include "qemu/error-report.h"
 #include "qemu/module.h"
+#include "usb-internal.h"
 
 #define MAX_PORTS 8
 
diff --git a/hw/usb/dev-mtp.c b/hw/usb/dev-mtp.c
index 15a2243101..147e564bea 100644
--- a/hw/usb/dev-mtp.c
+++ b/hw/usb/dev-mtp.c
@@ -24,10 +24,10 @@
 #include "qemu/filemonitor.h"
 #include "trace.h"
 #include "hw/qdev-properties.h"
-#include "hw/usb.h"
 #include "migration/vmstate.h"
 #include "desc.h"
 #include "qemu/units.h"
+#include "usb-internal.h"
 
 /* ----------------------------------------------------------------------- */
 
diff --git a/hw/usb/dev-network.c b/hw/usb/dev-network.c
index c69756709b..2e06d74f69 100644
--- a/hw/usb/dev-network.c
+++ b/hw/usb/dev-network.c
@@ -26,7 +26,6 @@
 #include "qemu/osdep.h"
 #include "qapi/error.h"
 #include "hw/qdev-properties.h"
-#include "hw/usb.h"
 #include "migration/vmstate.h"
 #include "desc.h"
 #include "net/net.h"
@@ -37,6 +36,7 @@
 #include "qemu/iov.h"
 #include "qemu/module.h"
 #include "qemu/cutils.h"
+#include "usb-internal.h"
 
 /*#define TRAFFIC_DEBUG*/
 /* Thanks to NetChip Technologies for donating this product ID.
diff --git a/hw/usb/dev-serial.c b/hw/usb/dev-serial.c
index 7e50e3ba47..4d3f91a85a 100644
--- a/hw/usb/dev-serial.c
+++ b/hw/usb/dev-serial.c
@@ -14,11 +14,11 @@
 #include "qemu/error-report.h"
 #include "qemu/module.h"
 #include "hw/qdev-properties.h"
-#include "hw/usb.h"
 #include "migration/vmstate.h"
 #include "desc.h"
 #include "chardev/char-serial.h"
 #include "chardev/char-fe.h"
+#include "usb-internal.h"
 
 //#define DEBUG_Serial
 
diff --git a/hw/usb/dev-smartcard-reader.c b/hw/usb/dev-smartcard-reader.c
index fcfe216594..9602b25a10 100644
--- a/hw/usb/dev-smartcard-reader.c
+++ b/hw/usb/dev-smartcard-reader.c
@@ -41,9 +41,9 @@
 #include "qemu/error-report.h"
 #include "qemu/module.h"
 #include "hw/qdev-properties.h"
-#include "hw/usb.h"
 #include "migration/vmstate.h"
 #include "desc.h"
+#include "usb-internal.h"
 
 #include "ccid.h"
 
diff --git a/hw/usb/dev-storage.c b/hw/usb/dev-storage.c
index f5977eb72e..a58c84dffa 100644
--- a/hw/usb/dev-storage.c
+++ b/hw/usb/dev-storage.c
@@ -13,7 +13,6 @@
 #include "qemu/module.h"
 #include "qemu/option.h"
 #include "qemu/config-file.h"
-#include "hw/usb.h"
 #include "desc.h"
 #include "hw/qdev-properties.h"
 #include "hw/scsi/scsi.h"
@@ -22,6 +21,7 @@
 #include "sysemu/block-backend.h"
 #include "qapi/visitor.h"
 #include "qemu/cutils.h"
+#include "usb-internal.h"
 
 //#define DEBUG_MSD
 
diff --git a/hw/usb/dev-uas.c b/hw/usb/dev-uas.c
index a3a4d41c07..9dc39f98a2 100644
--- a/hw/usb/dev-uas.c
+++ b/hw/usb/dev-uas.c
@@ -17,12 +17,12 @@
 #include "qemu/main-loop.h"
 #include "qemu/module.h"
 
-#include "hw/usb.h"
 #include "migration/vmstate.h"
 #include "desc.h"
 #include "hw/qdev-properties.h"
 #include "hw/scsi/scsi.h"
 #include "scsi/constants.h"
+#include "usb-internal.h"
 
 /* --------------------------------------------------------------------- */
 
diff --git a/hw/usb/dev-wacom.c b/hw/usb/dev-wacom.c
index 8aba44b8bc..7c162b7f85 100644
--- a/hw/usb/dev-wacom.c
+++ b/hw/usb/dev-wacom.c
@@ -28,10 +28,10 @@
 
 #include "qemu/osdep.h"
 #include "ui/console.h"
-#include "hw/usb.h"
 #include "migration/vmstate.h"
 #include "qemu/module.h"
 #include "desc.h"
+#include "usb-internal.h"
 
 /* Interface requests */
 #define WACOM_GET_REPORT	0x2101
diff --git a/hw/usb/hcd-dwc2.c b/hw/usb/hcd-dwc2.c
index 252b60ef65..47ae18d510 100644
--- a/hw/usb/hcd-dwc2.c
+++ b/hw/usb/hcd-dwc2.c
@@ -43,6 +43,7 @@
 #include "qemu/log.h"
 #include "hw/qdev-properties.h"
 #include "dwc2-regs.h"
+#include "usb-internal.h"
 
 #define USB_HZ_FS       12000000
 #define USB_HZ_HS       96000000
diff --git a/hw/usb/hcd-musb.c b/hw/usb/hcd-musb.c
index b8d8766a4a..bc3efcce65 100644
--- a/hw/usb/hcd-musb.c
+++ b/hw/usb/hcd-musb.c
@@ -22,10 +22,10 @@
  */
 #include "qemu/osdep.h"
 #include "qemu/timer.h"
-#include "hw/usb.h"
 #include "hw/irq.h"
 #include "hw/hw.h"
 #include "hcd-musb.h"
+#include "usb-internal.h"
 
 /* Common USB registers */
 #define MUSB_HDRC_FADDR		0x00	/* 8-bit */
diff --git a/hw/usb/hcd-ohci-pci.c b/hw/usb/hcd-ohci-pci.c
index a7fb1666af..cb6bc55f59 100644
--- a/hw/usb/hcd-ohci-pci.c
+++ b/hw/usb/hcd-ohci-pci.c
@@ -21,7 +21,6 @@
 #include "qemu/osdep.h"
 #include "qapi/error.h"
 #include "qemu/timer.h"
-#include "hw/usb.h"
 #include "migration/vmstate.h"
 #include "hw/pci/pci.h"
 #include "hw/sysbus.h"
@@ -29,6 +28,7 @@
 #include "hw/qdev-properties.h"
 #include "trace.h"
 #include "hcd-ohci.h"
+#include "usb-internal.h"
 
 #define TYPE_PCI_OHCI "pci-ohci"
 #define PCI_OHCI(obj) OBJECT_CHECK(OHCIPCIState, (obj), TYPE_PCI_OHCI)
diff --git a/hw/usb/hcd-ohci.c b/hw/usb/hcd-ohci.c
index 1e6e85e86a..f4a85a8774 100644
--- a/hw/usb/hcd-ohci.c
+++ b/hw/usb/hcd-ohci.c
@@ -30,7 +30,6 @@
 #include "qapi/error.h"
 #include "qemu/module.h"
 #include "qemu/timer.h"
-#include "hw/usb.h"
 #include "migration/vmstate.h"
 #include "hw/sysbus.h"
 #include "hw/qdev-dma.h"
diff --git a/hw/usb/hcd-uhci.c b/hw/usb/hcd-uhci.c
index 37f7beb3fa..1d4dd33b6c 100644
--- a/hw/usb/hcd-uhci.c
+++ b/hw/usb/hcd-uhci.c
@@ -27,7 +27,6 @@
  */
 
 #include "qemu/osdep.h"
-#include "hw/usb.h"
 #include "hw/usb/uhci-regs.h"
 #include "migration/vmstate.h"
 #include "hw/pci/pci.h"
@@ -39,6 +38,7 @@
 #include "trace.h"
 #include "qemu/main-loop.h"
 #include "qemu/module.h"
+#include "usb-internal.h"
 
 #define FRAME_TIMER_FREQ 1000
 
diff --git a/hw/usb/hcd-xhci-nec.c b/hw/usb/hcd-xhci-nec.c
index e6a5a22b6d..24c59fa4b0 100644
--- a/hw/usb/hcd-xhci-nec.c
+++ b/hw/usb/hcd-xhci-nec.c
@@ -20,11 +20,10 @@
  */
 
 #include "qemu/osdep.h"
-#include "hw/usb.h"
 #include "qemu/module.h"
 #include "hw/pci/pci.h"
 #include "hw/qdev-properties.h"
-
+#include "usb-internal.h"
 #include "hcd-xhci.h"
 
 static Property nec_xhci_properties[] = {
diff --git a/hw/usb/hcd-xhci.c b/hw/usb/hcd-xhci.c
index b330e36fe6..a3f6b14681 100644
--- a/hw/usb/hcd-xhci.c
+++ b/hw/usb/hcd-xhci.c
@@ -23,7 +23,6 @@
 #include "qemu/timer.h"
 #include "qemu/module.h"
 #include "qemu/queue.h"
-#include "hw/usb.h"
 #include "migration/vmstate.h"
 #include "hw/pci/pci.h"
 #include "hw/qdev-properties.h"
@@ -33,6 +32,7 @@
 #include "qapi/error.h"
 
 #include "hcd-xhci.h"
+#include "usb-internal.h"
 
 //#define DEBUG_XHCI
 //#define DEBUG_DATA
diff --git a/hw/usb/host-libusb.c b/hw/usb/host-libusb.c
index ad7ed8fb0c..615655f2f5 100644
--- a/hw/usb/host-libusb.c
+++ b/hw/usb/host-libusb.c
@@ -50,7 +50,7 @@
 #include "trace.h"
 
 #include "hw/qdev-properties.h"
-#include "hw/usb.h"
+#include "usb-internal.h"
 
 /* ------------------------------------------------------------------------ */
 
diff --git a/hw/usb/libhw.c b/hw/usb/libhw.c
index 9c33a1640f..a8d7f994df 100644
--- a/hw/usb/libhw.c
+++ b/hw/usb/libhw.c
@@ -20,8 +20,8 @@
  * THE SOFTWARE.
  */
 #include "qemu/osdep.h"
-#include "hw/usb.h"
 #include "sysemu/dma.h"
+#include "usb-internal.h"
 
 int usb_packet_map(USBPacket *p, QEMUSGList *sgl)
 {
diff --git a/hw/usb/quirks.c b/hw/usb/quirks.c
index b0d0f87e35..c427d45f1e 100644
--- a/hw/usb/quirks.c
+++ b/hw/usb/quirks.c
@@ -14,7 +14,7 @@
 
 #include "qemu/osdep.h"
 #include "quirks.inc.c"
-#include "hw/usb.h"
+#include "usb-internal.h"
 #include "usb-quirks.h"
 
 static bool usb_id_match(const struct usb_device_id *ids,
diff --git a/hw/usb/redirect.c b/hw/usb/redirect.c
index 4c5925a039..a0c55de7f8 100644
--- a/hw/usb/redirect.c
+++ b/hw/usb/redirect.c
@@ -42,9 +42,9 @@
 #include <usbredirfilter.h>
 
 #include "hw/qdev-properties.h"
-#include "hw/usb.h"
 #include "migration/qemu-file-types.h"
 #include "migration/vmstate.h"
+#include "usb-internal.h"
 #include "usb-quirks.h"
 
 /* ERROR is defined below. Remove any previous definition. */
diff --git a/hw/usb/tusb6010.c b/hw/usb/tusb6010.c
index 9f9b81b09d..191df38356 100644
--- a/hw/usb/tusb6010.c
+++ b/hw/usb/tusb6010.c
@@ -22,12 +22,12 @@
 #include "qemu/osdep.h"
 #include "qemu/module.h"
 #include "qemu/timer.h"
-#include "hw/usb.h"
 #include "hw/arm/omap.h"
 #include "hw/hw.h"
 #include "hw/irq.h"
 #include "hw/sysbus.h"
 #include "hcd-musb.h"
+#include "usb-internal.h"
 
 #define TYPE_TUSB6010 "tusb6010"
 #define TUSB(obj) OBJECT_CHECK(TUSBState, (obj), TYPE_TUSB6010)
diff --git a/hw/usb/xen-usb.c b/hw/usb/xen-usb.c
index 4d266d7bb4..a6a0b466f9 100644
--- a/hw/usb/xen-usb.c
+++ b/hw/usb/xen-usb.c
@@ -27,12 +27,12 @@
 #include "qemu/main-loop.h"
 #include "qemu/option.h"
 #include "hw/sysbus.h"
-#include "hw/usb.h"
 #include "hw/xen/xen-legacy-backend.h"
 #include "monitor/qdev.h"
 #include "qapi/error.h"
 #include "qapi/qmp/qdict.h"
 #include "qapi/qmp/qstring.h"
+#include "usb-internal.h"
 
 #include "hw/xen/interface/io/usbif.h"
 
diff --git a/MAINTAINERS b/MAINTAINERS
index dec252f38b..2566566d72 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1642,7 +1642,6 @@ F: hw/usb/*
 F: tests/qtest/usb-*-test.c
 F: docs/usb2.txt
 F: docs/usb-storage.txt
-F: include/hw/usb.h
 F: include/hw/usb/
 F: default-configs/usb.mak
 
-- 
2.21.3


