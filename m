Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A9C992146A4
	for <lists+xen-devel@lfdr.de>; Sat,  4 Jul 2020 16:56:49 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jrjat-00053z-Bv; Sat, 04 Jul 2020 14:56:43 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hHao=AP=gmail.com=philippe.mathieu.daude@srs-us1.protection.inumbo.net>)
 id 1jrjWE-0003ES-TR
 for xen-devel@lists.xenproject.org; Sat, 04 Jul 2020 14:51:54 +0000
X-Inumbo-ID: b927570e-be05-11ea-8496-bc764e2007e4
Received: from mail-wm1-x343.google.com (unknown [2a00:1450:4864:20::343])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b927570e-be05-11ea-8496-bc764e2007e4;
 Sat, 04 Jul 2020 14:50:38 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id q15so34722183wmj.2
 for <xen-devel@lists.xenproject.org>; Sat, 04 Jul 2020 07:50:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ELz2xQrwO3as8Wxs/Kn8jW0b/kVDPOkqqjBqSxetIoY=;
 b=lEaSbT813203f5Q/sN2DPPZEN+/cTb3ulD0Tsc1K7UiiJmuIHRljgZA5E6zal6HQzd
 SJ1xW7NtSAKTID6CskQvsrLb7LQCq+tEKlaGrkyTbnWVNZv0iqk/rWKNzeml32LvPYt7
 wgIMupaZdxlJI/+kIl0Ql/RW5EIXIoUpP0EIn+bP7T+ouYR5fkNExvJnsPSciKAgerQW
 WrzFOrM8q18cFGilFsVCB9yObwLMcIHNnP0LEH05SNx5uCwKd2r1O7S/Hqo/VTdOad/w
 ZbUVITTYcFraCPIbBmWczqxqNUrrLd09DJk+rTPqpM+lJ6rRdSpbb8Vxn63LhDrjM5CZ
 kfxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=ELz2xQrwO3as8Wxs/Kn8jW0b/kVDPOkqqjBqSxetIoY=;
 b=ByzWdM8Doy738hoQVijAtSlJOmuZGqOyla+9JYJL7GSr2UiM1e0hHA/mBDQFYeMo7Y
 zkRHS/m0UQ8GR3/ZbEgFVa3fubx6qlxUj46XREacrmNtrdZktPMR7HtLoFgWhv12z3lN
 2CVqLied2slRty60CXAqGPwfQJY9jM39VjPUXoROJufmQteS2zSrkkVNyQMtp8ENNVEB
 +wGy/tyXlJT479B2sNmNbv3xyYdYdfdV2j8zRb2KLGLIl63l7x0Gor/Zlewa7SMyx552
 hXeOO854XoRDXeskVo/rLXq4ltfK3zXe7SCfwxeTmVGPz8VCo3HnSano0RdSL7rvoOex
 OV2w==
X-Gm-Message-State: AOAM530iiWjrdqygYS4rqUu9H2KYblqRa67bzYGT/6/gax+Qhx6j9gyB
 4Z1SkTlFNHDfCGiEiXV22Yk=
X-Google-Smtp-Source: ABdhPJxszZnIT3VKXO6NXhl+YZ/Tp7y4xXuOBdXFlI7NLcqcetxqVubOW7Z948642pU/bk7Dmf0M6w==
X-Received: by 2002:a1c:e355:: with SMTP id a82mr42855621wmh.165.1593874237478; 
 Sat, 04 Jul 2020 07:50:37 -0700 (PDT)
Received: from localhost.localdomain (1.red-83-51-162.dynamicip.rima-tde.net.
 [83.51.162.1])
 by smtp.gmail.com with ESMTPSA id r10sm17135019wrm.17.2020.07.04.07.50.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Jul 2020 07:50:36 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org,
	BALATON Zoltan <balaton@eik.bme.hu>
Subject: [PATCH 24/26] hw/usb/usb-hcd: Use UHCI type definitions
Date: Sat,  4 Jul 2020 16:49:41 +0200
Message-Id: <20200704144943.18292-25-f4bug@amsat.org>
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

Various machine/board/soc models create UHCI device instances
with the generic QDEV API, and don't need to access USB internals.

Simplify header inclusions by moving the QOM type names into a
simple header, with no need to include other "hw/usb" headers.

Suggested-by: BALATON Zoltan <balaton@eik.bme.hu>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 include/hw/usb/usb-hcd.h |  6 ++++++
 hw/i386/pc_piix.c        |  3 ++-
 hw/i386/pc_q35.c         | 13 +++++++------
 hw/isa/piix4.c           |  3 ++-
 hw/mips/fuloong2e.c      |  5 +++--
 hw/usb/hcd-uhci.c        | 19 ++++++++++---------
 6 files changed, 30 insertions(+), 19 deletions(-)

diff --git a/include/hw/usb/usb-hcd.h b/include/hw/usb/usb-hcd.h
index 74af3a4533..c9d0a88984 100644
--- a/include/hw/usb/usb-hcd.h
+++ b/include/hw/usb/usb-hcd.h
@@ -24,4 +24,10 @@
 #define TYPE_FUSBH200_EHCI          "fusbh200-ehci-usb"
 #define TYPE_CHIPIDEA               "usb-chipidea"
 
+/* UHCI */
+#define TYPE_PIIX3_USB_UHCI         "piix3-usb-uhci"
+#define TYPE_PIIX4_USB_UHCI         "piix4-usb-uhci"
+#define TYPE_VT82C686B_USB_UHCI     "vt82c686b-usb-uhci"
+#define TYPE_ICH9_USB_UHCI(n)       "ich9-usb-uhci" #n
+
 #endif
diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
index 4d1de7cfab..0024c346c6 100644
--- a/hw/i386/pc_piix.c
+++ b/hw/i386/pc_piix.c
@@ -37,6 +37,7 @@
 #include "hw/pci/pci.h"
 #include "hw/pci/pci_ids.h"
 #include "hw/usb/usb.h"
+#include "hw/usb/usb-hcd.h"
 #include "net/net.h"
 #include "hw/ide/pci.h"
 #include "hw/irq.h"
@@ -275,7 +276,7 @@ static void pc_init1(MachineState *machine,
 #endif
 
     if (pcmc->pci_enabled && machine_usb(machine)) {
-        pci_create_simple(pci_bus, piix3_devfn + 2, "piix3-usb-uhci");
+        pci_create_simple(pci_bus, piix3_devfn + 2, TYPE_PIIX3_USB_UHCI);
     }
 
     if (pcmc->pci_enabled && x86_machine_is_acpi_enabled(X86_MACHINE(pcms))) {
diff --git a/hw/i386/pc_q35.c b/hw/i386/pc_q35.c
index b985f5bea1..a80527e6ed 100644
--- a/hw/i386/pc_q35.c
+++ b/hw/i386/pc_q35.c
@@ -51,6 +51,7 @@
 #include "hw/ide/pci.h"
 #include "hw/ide/ahci.h"
 #include "hw/usb/usb.h"
+#include "hw/usb/usb-hcd.h"
 #include "qapi/error.h"
 #include "qemu/error-report.h"
 #include "sysemu/numa.h"
@@ -68,15 +69,15 @@ struct ehci_companions {
 };
 
 static const struct ehci_companions ich9_1d[] = {
-    { .name = "ich9-usb-uhci1", .func = 0, .port = 0 },
-    { .name = "ich9-usb-uhci2", .func = 1, .port = 2 },
-    { .name = "ich9-usb-uhci3", .func = 2, .port = 4 },
+    { .name = TYPE_ICH9_USB_UHCI(1), .func = 0, .port = 0 },
+    { .name = TYPE_ICH9_USB_UHCI(2), .func = 1, .port = 2 },
+    { .name = TYPE_ICH9_USB_UHCI(3), .func = 2, .port = 4 },
 };
 
 static const struct ehci_companions ich9_1a[] = {
-    { .name = "ich9-usb-uhci4", .func = 0, .port = 0 },
-    { .name = "ich9-usb-uhci5", .func = 1, .port = 2 },
-    { .name = "ich9-usb-uhci6", .func = 2, .port = 4 },
+    { .name = TYPE_ICH9_USB_UHCI(4), .func = 0, .port = 0 },
+    { .name = TYPE_ICH9_USB_UHCI(5), .func = 1, .port = 2 },
+    { .name = TYPE_ICH9_USB_UHCI(6), .func = 2, .port = 4 },
 };
 
 static int ehci_create_ich9_with_companions(PCIBus *bus, int slot)
diff --git a/hw/isa/piix4.c b/hw/isa/piix4.c
index f634bcb2d1..e11e5fae21 100644
--- a/hw/isa/piix4.c
+++ b/hw/isa/piix4.c
@@ -29,6 +29,7 @@
 #include "hw/southbridge/piix.h"
 #include "hw/pci/pci.h"
 #include "hw/isa/isa.h"
+#include "hw/usb/usb-hcd.h"
 #include "hw/sysbus.h"
 #include "hw/intc/i8259.h"
 #include "hw/dma/i8257.h"
@@ -255,7 +256,7 @@ DeviceState *piix4_create(PCIBus *pci_bus, ISABus **isa_bus, I2CBus **smbus)
     pci = pci_create_simple(pci_bus, devfn + 1, "piix4-ide");
     pci_ide_create_devs(pci);
 
-    pci_create_simple(pci_bus, devfn + 2, "piix4-usb-uhci");
+    pci_create_simple(pci_bus, devfn + 2, TYPE_PIIX4_USB_UHCI);
     if (smbus) {
         *smbus = piix4_pm_init(pci_bus, devfn + 3, 0x1100,
                                isa_get_irq(NULL, 9), NULL, 0, NULL);
diff --git a/hw/mips/fuloong2e.c b/hw/mips/fuloong2e.c
index 8ca31e5162..b6d33dd2cd 100644
--- a/hw/mips/fuloong2e.c
+++ b/hw/mips/fuloong2e.c
@@ -33,6 +33,7 @@
 #include "hw/mips/mips.h"
 #include "hw/mips/cpudevs.h"
 #include "hw/pci/pci.h"
+#include "hw/usb/usb-hcd.h"
 #include "qemu/log.h"
 #include "hw/loader.h"
 #include "hw/ide/pci.h"
@@ -258,8 +259,8 @@ static void vt82c686b_southbridge_init(PCIBus *pci_bus, int slot, qemu_irq intc,
     dev = pci_create_simple(pci_bus, PCI_DEVFN(slot, 1), "via-ide");
     pci_ide_create_devs(dev);
 
-    pci_create_simple(pci_bus, PCI_DEVFN(slot, 2), "vt82c686b-usb-uhci");
-    pci_create_simple(pci_bus, PCI_DEVFN(slot, 3), "vt82c686b-usb-uhci");
+    pci_create_simple(pci_bus, PCI_DEVFN(slot, 2), TYPE_VT82C686B_USB_UHCI);
+    pci_create_simple(pci_bus, PCI_DEVFN(slot, 3), TYPE_VT82C686B_USB_UHCI);
 
     *i2c_bus = vt82c686b_pm_init(pci_bus, PCI_DEVFN(slot, 4), 0xeee1, NULL);
 
diff --git a/hw/usb/hcd-uhci.c b/hw/usb/hcd-uhci.c
index 1d4dd33b6c..da078dc3fa 100644
--- a/hw/usb/hcd-uhci.c
+++ b/hw/usb/hcd-uhci.c
@@ -39,6 +39,7 @@
 #include "qemu/main-loop.h"
 #include "qemu/module.h"
 #include "usb-internal.h"
+#include "hw/usb/usb-hcd.h"
 
 #define FRAME_TIMER_FREQ 1000
 
@@ -1358,21 +1359,21 @@ static void uhci_data_class_init(ObjectClass *klass, void *data)
 
 static UHCIInfo uhci_info[] = {
     {
-        .name       = "piix3-usb-uhci",
+        .name      = TYPE_PIIX3_USB_UHCI,
         .vendor_id = PCI_VENDOR_ID_INTEL,
         .device_id = PCI_DEVICE_ID_INTEL_82371SB_2,
         .revision  = 0x01,
         .irq_pin   = 3,
         .unplug    = true,
     },{
-        .name      = "piix4-usb-uhci",
+        .name      = TYPE_PIIX4_USB_UHCI,
         .vendor_id = PCI_VENDOR_ID_INTEL,
         .device_id = PCI_DEVICE_ID_INTEL_82371AB_2,
         .revision  = 0x01,
         .irq_pin   = 3,
         .unplug    = true,
     },{
-        .name      = "vt82c686b-usb-uhci",
+        .name      = TYPE_VT82C686B_USB_UHCI,
         .vendor_id = PCI_VENDOR_ID_VIA,
         .device_id = PCI_DEVICE_ID_VIA_UHCI,
         .revision  = 0x01,
@@ -1380,42 +1381,42 @@ static UHCIInfo uhci_info[] = {
         .realize   = usb_uhci_vt82c686b_realize,
         .unplug    = true,
     },{
-        .name      = "ich9-usb-uhci1", /* 00:1d.0 */
+        .name      = TYPE_ICH9_USB_UHCI(1), /* 00:1d.0 */
         .vendor_id = PCI_VENDOR_ID_INTEL,
         .device_id = PCI_DEVICE_ID_INTEL_82801I_UHCI1,
         .revision  = 0x03,
         .irq_pin   = 0,
         .unplug    = false,
     },{
-        .name      = "ich9-usb-uhci2", /* 00:1d.1 */
+        .name      = TYPE_ICH9_USB_UHCI(2), /* 00:1d.1 */
         .vendor_id = PCI_VENDOR_ID_INTEL,
         .device_id = PCI_DEVICE_ID_INTEL_82801I_UHCI2,
         .revision  = 0x03,
         .irq_pin   = 1,
         .unplug    = false,
     },{
-        .name      = "ich9-usb-uhci3", /* 00:1d.2 */
+        .name      = TYPE_ICH9_USB_UHCI(3), /* 00:1d.2 */
         .vendor_id = PCI_VENDOR_ID_INTEL,
         .device_id = PCI_DEVICE_ID_INTEL_82801I_UHCI3,
         .revision  = 0x03,
         .irq_pin   = 2,
         .unplug    = false,
     },{
-        .name      = "ich9-usb-uhci4", /* 00:1a.0 */
+        .name      = TYPE_ICH9_USB_UHCI(4), /* 00:1a.0 */
         .vendor_id = PCI_VENDOR_ID_INTEL,
         .device_id = PCI_DEVICE_ID_INTEL_82801I_UHCI4,
         .revision  = 0x03,
         .irq_pin   = 0,
         .unplug    = false,
     },{
-        .name      = "ich9-usb-uhci5", /* 00:1a.1 */
+        .name      = TYPE_ICH9_USB_UHCI(5), /* 00:1a.1 */
         .vendor_id = PCI_VENDOR_ID_INTEL,
         .device_id = PCI_DEVICE_ID_INTEL_82801I_UHCI5,
         .revision  = 0x03,
         .irq_pin   = 1,
         .unplug    = false,
     },{
-        .name      = "ich9-usb-uhci6", /* 00:1a.2 */
+        .name      = TYPE_ICH9_USB_UHCI(6), /* 00:1a.2 */
         .vendor_id = PCI_VENDOR_ID_INTEL,
         .device_id = PCI_DEVICE_ID_INTEL_82801I_UHCI6,
         .revision  = 0x03,
-- 
2.21.3


