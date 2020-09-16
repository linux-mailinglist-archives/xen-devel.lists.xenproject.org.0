Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A20626C776
	for <lists+xen-devel@lfdr.de>; Wed, 16 Sep 2020 20:26:49 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kIc8N-0007WH-3e; Wed, 16 Sep 2020 18:26:23 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=C/c7=CZ=redhat.com=ehabkost@srs-us1.protection.inumbo.net>)
 id 1kIc8L-0007W3-En
 for xen-devel@lists.xenproject.org; Wed, 16 Sep 2020 18:26:21 +0000
X-Inumbo-ID: ff2783be-5ae5-4b0b-8836-0ff055c80aa6
Received: from us-smtp-delivery-124.mimecast.com (unknown [63.128.21.124])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id ff2783be-5ae5-4b0b-8836-0ff055c80aa6;
 Wed, 16 Sep 2020 18:26:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1600280777;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OtlOxk4wxiQ7KWb/6EBmhRDNmPG/ZzyVq9i5rDVuZKA=;
 b=KYbHGUiBtIKTW+liCiHCvvTa9Vl1oJaRP5yC6rQ7hUBHhTItMUEEDVwTuGO+dVpXlt2leR
 kckaD4xqeRep0jIlmvc9SbvSoNUrXPUDn4dlFMP4pGjNXIj8jlWTSBcsrUVYDgapgINSqh
 WAOujK5aGG4PALQs+AZIabZfHuuI0uU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-120-xGMfrFtcM4KgG0d78t-SOw-1; Wed, 16 Sep 2020 14:26:15 -0400
X-MC-Unique: xGMfrFtcM4KgG0d78t-SOw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7B235100746B;
 Wed, 16 Sep 2020 18:26:11 +0000 (UTC)
Received: from localhost (ovpn-119-217.rdu2.redhat.com [10.10.119.217])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 43BC619D61;
 Wed, 16 Sep 2020 18:25:52 +0000 (UTC)
From: Eduardo Habkost <ehabkost@redhat.com>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 "Daniel P. Berrange" <berrange@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Andrzej Zaborowski <balrogg@gmail.com>,
 Alistair Francis <alistair@alistair23.me>, Kevin Wolf <kwolf@redhat.com>,
 Max Reitz <mreitz@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 David Gibson <david@gibson.dropbear.id.au>,
 Richard Henderson <rth@twiddle.net>, David Hildenbrand <david@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Fam Zheng <fam@euphon.net>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Andrew Jeffery <andrew@aj.id.au>, Joel Stanley <joel@jms.id.au>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Eric Auger <eric.auger@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Laurent Vivier <laurent@vivier.eu>, Sergio Lopez <slp@redhat.com>,
 John Snow <jsnow@redhat.com>,
 Xiao Guangrong <xiaoguangrong.eric@gmail.com>,
 Peter Chubb <peter.chubb@nicta.com.au>,
 Beniamino Galvani <b.galvani@gmail.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony Perard <anthony.perard@citrix.com>, Paul Durrant <paul@xen.org>,
 Jason Wang <jasowang@redhat.com>, qemu-arm@nongnu.org,
 qemu-block@nongnu.org, qemu-ppc@nongnu.org, qemu-s390x@nongnu.org,
 xen-devel@lists.xenproject.org
Subject: [PATCH 4/5] [automated] Use OBJECT_DECLARE_TYPE when possible
Date: Wed, 16 Sep 2020 14:25:18 -0400
Message-Id: <20200916182519.415636-5-ehabkost@redhat.com>
In-Reply-To: <20200916182519.415636-1-ehabkost@redhat.com>
References: <20200916182519.415636-1-ehabkost@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
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
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

This converts existing DECLARE_OBJ_CHECKERS usage to
OBJECT_DECLARE_TYPE when possible.

 $ ./scripts/codeconverter/converter.py -i \
   --pattern=AddObjectDeclareType $(git grep -l '' -- '*.[ch]')

Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
---
Cc: Peter Maydell <peter.maydell@linaro.org>
Cc: Andrzej Zaborowski <balrogg@gmail.com>
Cc: Alistair Francis <alistair@alistair23.me>
Cc: Kevin Wolf <kwolf@redhat.com>
Cc: Max Reitz <mreitz@redhat.com>
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Cc: David Gibson <david@gibson.dropbear.id.au>
Cc: Richard Henderson <rth@twiddle.net>
Cc: David Hildenbrand <david@redhat.com>
Cc: Cornelia Huck <cohuck@redhat.com>
Cc: Thomas Huth <thuth@redhat.com>
Cc: Halil Pasic <pasic@linux.ibm.com>
Cc: Christian Borntraeger <borntraeger@de.ibm.com>
Cc: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>
Cc: Fam Zheng <fam@euphon.net>
Cc: Dmitry Fleytman <dmitry.fleytman@gmail.com>
Cc: Gerd Hoffmann <kraxel@redhat.com>
Cc: "Marc-André Lureau" <marcandre.lureau@redhat.com>
Cc: "Cédric Le Goater" <clg@kaod.org>
Cc: Andrew Jeffery <andrew@aj.id.au>
Cc: Joel Stanley <joel@jms.id.au>
Cc: Andrew Baumann <Andrew.Baumann@microsoft.com>
Cc: "Philippe Mathieu-Daudé" <f4bug@amsat.org>
Cc: Eric Auger <eric.auger@redhat.com>
Cc: Eduardo Habkost <ehabkost@redhat.com>
Cc: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Cc: Laurent Vivier <laurent@vivier.eu>
Cc: Sergio Lopez <slp@redhat.com>
Cc: John Snow <jsnow@redhat.com>
Cc: Xiao Guangrong <xiaoguangrong.eric@gmail.com>
Cc: Peter Chubb <peter.chubb@nicta.com.au>
Cc: "Daniel P. Berrangé" <berrange@redhat.com>
Cc: Beniamino Galvani <b.galvani@gmail.com>
Cc: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>
Cc: Anthony Perard <anthony.perard@citrix.com>
Cc: Paul Durrant <paul@xen.org>
Cc: Jason Wang <jasowang@redhat.com>
Cc: qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org
Cc: qemu-ppc@nongnu.org
Cc: qemu-s390x@nongnu.org
Cc: xen-devel@lists.xenproject.org
---
 hw/ppc/e500.h                         | 5 +----
 hw/s390x/ccw-device.h                 | 4 +---
 hw/s390x/virtio-ccw.h                 | 5 +----
 hw/usb/ccid.h                         | 5 +----
 hw/usb/hcd-dwc2.h                     | 3 +--
 hw/usb/hcd-ehci.h                     | 5 +----
 hw/virtio/virtio-pci.h                | 5 +----
 include/chardev/char.h                | 4 +---
 include/hw/arm/aspeed_soc.h           | 5 +----
 include/hw/arm/bcm2836.h              | 5 +----
 include/hw/arm/smmu-common.h          | 5 +----
 include/hw/arm/smmuv3.h               | 5 +----
 include/hw/arm/virt.h                 | 5 +----
 include/hw/boards.h                   | 3 +--
 include/hw/display/macfb.h            | 5 +----
 include/hw/gpio/aspeed_gpio.h         | 5 +----
 include/hw/i2c/aspeed_i2c.h           | 5 +----
 include/hw/i386/ioapic_internal.h     | 5 +----
 include/hw/i386/microvm.h             | 5 +----
 include/hw/i386/pc.h                  | 4 +---
 include/hw/i386/x86-iommu.h           | 5 +----
 include/hw/i386/x86.h                 | 5 +----
 include/hw/ide/internal.h             | 4 +---
 include/hw/input/adb.h                | 4 +---
 include/hw/isa/i8259_internal.h       | 5 +----
 include/hw/isa/isa.h                  | 4 +---
 include/hw/mem/nvdimm.h               | 5 +----
 include/hw/misc/aspeed_scu.h          | 5 +----
 include/hw/misc/aspeed_sdmc.h         | 5 +----
 include/hw/misc/imx_ccm.h             | 5 +----
 include/hw/misc/mos6522.h             | 5 +----
 include/hw/pci-host/pnv_phb4.h        | 5 +----
 include/hw/pci/pci.h                  | 4 +---
 include/hw/pci/pci_host.h             | 4 +---
 include/hw/pcmcia.h                   | 5 +----
 include/hw/ppc/spapr.h                | 5 +----
 include/hw/qdev-core.h                | 4 +---
 include/hw/rtc/allwinner-rtc.h        | 5 +----
 include/hw/s390x/3270-ccw.h           | 5 +----
 include/hw/s390x/s390-virtio-ccw.h    | 5 +----
 include/hw/s390x/storage-attributes.h | 5 +----
 include/hw/s390x/storage-keys.h       | 5 +----
 include/hw/s390x/tod.h                | 5 +----
 include/hw/scsi/scsi.h                | 4 +---
 include/hw/sd/allwinner-sdhost.h      | 5 +----
 include/hw/sd/sd.h                    | 5 +----
 include/hw/ssi/aspeed_smc.h           | 5 +----
 include/hw/ssi/xilinx_spips.h         | 4 +---
 include/hw/timer/aspeed_timer.h       | 5 +----
 include/hw/timer/i8254.h              | 5 +----
 include/hw/usb.h                      | 4 +---
 include/hw/virtio/virtio.h            | 4 +---
 include/hw/watchdog/wdt_aspeed.h      | 5 +----
 include/hw/xen/xen-block.h            | 4 +---
 include/hw/xen/xen-bus.h              | 4 +---
 include/net/can_host.h                | 5 +----
 include/net/filter.h                  | 4 +---
 include/ui/console.h                  | 4 +---
 hw/arm/mps2-tz.c                      | 5 +----
 hw/arm/mps2.c                         | 5 +----
 hw/arm/musca.c                        | 5 +----
 hw/arm/spitz.c                        | 5 +----
 hw/arm/vexpress.c                     | 5 +----
 hw/block/m25p80.c                     | 5 +----
 hw/input/adb-kbd.c                    | 5 +----
 hw/input/adb-mouse.c                  | 5 +----
 hw/misc/tmp421.c                      | 5 +----
 hw/scsi/scsi-disk.c                   | 5 +----
 hw/scsi/vmw_pvscsi.c                  | 5 +----
 69 files changed, 69 insertions(+), 255 deletions(-)

diff --git a/hw/ppc/e500.h b/hw/ppc/e500.h
index 63870751ff..1e5853b032 100644
--- a/hw/ppc/e500.h
+++ b/hw/ppc/e500.h
@@ -14,7 +14,6 @@ struct PPCE500MachineState {
      */
     PlatformBusDevice *pbus_dev;
 };
-typedef struct PPCE500MachineState PPCE500MachineState;
 
 struct PPCE500MachineClass {
     /*< private >*/
@@ -39,14 +38,12 @@ struct PPCE500MachineClass {
     hwaddr pci_mmio_bus_base;
     hwaddr spin_base;
 };
-typedef struct PPCE500MachineClass PPCE500MachineClass;
 
 void ppce500_init(MachineState *machine);
 
 hwaddr booke206_page_size_to_tlb(uint64_t size);
 
 #define TYPE_PPCE500_MACHINE      "ppce500-base-machine"
-DECLARE_OBJ_CHECKERS(PPCE500MachineState, PPCE500MachineClass,
-                     PPCE500_MACHINE, TYPE_PPCE500_MACHINE)
+OBJECT_DECLARE_TYPE(PPCE500MachineState, PPCE500MachineClass, PPCE500_MACHINE)
 
 #endif
diff --git a/hw/s390x/ccw-device.h b/hw/s390x/ccw-device.h
index cf7d492084..832c78cd42 100644
--- a/hw/s390x/ccw-device.h
+++ b/hw/s390x/ccw-device.h
@@ -38,7 +38,6 @@ struct CCWDeviceClass {
     void (*realize)(CcwDevice *, Error **);
     void (*refill_ids)(CcwDevice *);
 };
-typedef struct CCWDeviceClass CCWDeviceClass;
 
 static inline CcwDevice *to_ccw_dev_fast(DeviceState *d)
 {
@@ -47,7 +46,6 @@ static inline CcwDevice *to_ccw_dev_fast(DeviceState *d)
 
 #define TYPE_CCW_DEVICE "ccw-device"
 
-DECLARE_OBJ_CHECKERS(CcwDevice, CCWDeviceClass,
-                     CCW_DEVICE, TYPE_CCW_DEVICE)
+OBJECT_DECLARE_TYPE(CcwDevice, CCWDeviceClass, CCW_DEVICE)
 
 #endif
diff --git a/hw/s390x/virtio-ccw.h b/hw/s390x/virtio-ccw.h
index cea259685d..21790608b4 100644
--- a/hw/s390x/virtio-ccw.h
+++ b/hw/s390x/virtio-ccw.h
@@ -54,10 +54,7 @@
 #define CCW_CMD_SET_VIRTIO_REV 0x83
 
 #define TYPE_VIRTIO_CCW_DEVICE "virtio-ccw-device"
-typedef struct VirtIOCCWDeviceClass VirtIOCCWDeviceClass;
-typedef struct VirtioCcwDevice VirtioCcwDevice;
-DECLARE_OBJ_CHECKERS(VirtioCcwDevice, VirtIOCCWDeviceClass,
-                     VIRTIO_CCW_DEVICE, TYPE_VIRTIO_CCW_DEVICE)
+OBJECT_DECLARE_TYPE(VirtioCcwDevice, VirtIOCCWDeviceClass, VIRTIO_CCW_DEVICE)
 
 typedef struct VirtioBusState VirtioCcwBusState;
 typedef struct VirtioBusClass VirtioCcwBusClass;
diff --git a/hw/usb/ccid.h b/hw/usb/ccid.h
index ef2bb3462d..6b82a55bd4 100644
--- a/hw/usb/ccid.h
+++ b/hw/usb/ccid.h
@@ -13,13 +13,10 @@
 #include "hw/qdev-core.h"
 #include "qom/object.h"
 
-typedef struct CCIDCardState CCIDCardState;
 typedef struct CCIDCardInfo CCIDCardInfo;
 
 #define TYPE_CCID_CARD "ccid-card"
-typedef struct CCIDCardClass CCIDCardClass;
-DECLARE_OBJ_CHECKERS(CCIDCardState, CCIDCardClass,
-                     CCID_CARD, TYPE_CCID_CARD)
+OBJECT_DECLARE_TYPE(CCIDCardState, CCIDCardClass, CCID_CARD)
 
 /*
  * callbacks to be used by the CCID device (hw/usb-ccid.c) to call
diff --git a/hw/usb/hcd-dwc2.h b/hw/usb/hcd-dwc2.h
index 919e3e43b1..6998b04706 100644
--- a/hw/usb/hcd-dwc2.h
+++ b/hw/usb/hcd-dwc2.h
@@ -181,7 +181,6 @@ struct DWC2Class {
 };
 
 #define TYPE_DWC2_USB   "dwc2-usb"
-DECLARE_OBJ_CHECKERS(DWC2State, DWC2Class,
-                     DWC2_USB, TYPE_DWC2_USB)
+OBJECT_DECLARE_TYPE(DWC2State, DWC2Class, DWC2_USB)
 
 #endif
diff --git a/hw/usb/hcd-ehci.h b/hw/usb/hcd-ehci.h
index 1301ce0be7..199913bca5 100644
--- a/hw/usb/hcd-ehci.h
+++ b/hw/usb/hcd-ehci.h
@@ -350,10 +350,7 @@ struct EHCIPCIState {
 #define TYPE_PPC4xx_EHCI "ppc4xx-ehci-usb"
 #define TYPE_FUSBH200_EHCI "fusbh200-ehci-usb"
 
-typedef struct EHCISysBusState EHCISysBusState;
-typedef struct SysBusEHCIClass SysBusEHCIClass;
-DECLARE_OBJ_CHECKERS(EHCISysBusState, SysBusEHCIClass,
-                     SYS_BUS_EHCI, TYPE_SYS_BUS_EHCI)
+OBJECT_DECLARE_TYPE(EHCISysBusState, SysBusEHCIClass, SYS_BUS_EHCI)
 
 struct EHCISysBusState {
     /*< private >*/
diff --git a/hw/virtio/virtio-pci.h b/hw/virtio/virtio-pci.h
index 47b6bb4e26..06e2af12de 100644
--- a/hw/virtio/virtio-pci.h
+++ b/hw/virtio/virtio-pci.h
@@ -19,7 +19,6 @@
 #include "hw/virtio/virtio-bus.h"
 #include "qom/object.h"
 
-typedef struct VirtIOPCIProxy VirtIOPCIProxy;
 
 /* virtio-pci-bus */
 
@@ -91,9 +90,7 @@ typedef struct {
  * virtio-pci: This is the PCIDevice which has a virtio-pci-bus.
  */
 #define TYPE_VIRTIO_PCI "virtio-pci"
-typedef struct VirtioPCIClass VirtioPCIClass;
-DECLARE_OBJ_CHECKERS(VirtIOPCIProxy, VirtioPCIClass,
-                     VIRTIO_PCI, TYPE_VIRTIO_PCI)
+OBJECT_DECLARE_TYPE(VirtIOPCIProxy, VirtioPCIClass, VIRTIO_PCI)
 
 struct VirtioPCIClass {
     PCIDeviceClass parent_class;
diff --git a/include/chardev/char.h b/include/chardev/char.h
index 5874de57ea..db42f0a8c6 100644
--- a/include/chardev/char.h
+++ b/include/chardev/char.h
@@ -226,9 +226,7 @@ int qemu_chr_write(Chardev *s, const uint8_t *buf, int len, bool write_all);
 int qemu_chr_wait_connected(Chardev *chr, Error **errp);
 
 #define TYPE_CHARDEV "chardev"
-typedef struct ChardevClass ChardevClass;
-DECLARE_OBJ_CHECKERS(Chardev, ChardevClass,
-                     CHARDEV, TYPE_CHARDEV)
+OBJECT_DECLARE_TYPE(Chardev, ChardevClass, CHARDEV)
 
 #define TYPE_CHARDEV_NULL "chardev-null"
 #define TYPE_CHARDEV_MUX "chardev-mux"
diff --git a/include/hw/arm/aspeed_soc.h b/include/hw/arm/aspeed_soc.h
index 05c7d53df3..11cfe6e358 100644
--- a/include/hw/arm/aspeed_soc.h
+++ b/include/hw/arm/aspeed_soc.h
@@ -62,12 +62,9 @@ struct AspeedSoCState {
     AspeedSDHCIState sdhci;
     AspeedSDHCIState emmc;
 };
-typedef struct AspeedSoCState AspeedSoCState;
 
 #define TYPE_ASPEED_SOC "aspeed-soc"
-typedef struct AspeedSoCClass AspeedSoCClass;
-DECLARE_OBJ_CHECKERS(AspeedSoCState, AspeedSoCClass,
-                     ASPEED_SOC, TYPE_ASPEED_SOC)
+OBJECT_DECLARE_TYPE(AspeedSoCState, AspeedSoCClass, ASPEED_SOC)
 
 struct AspeedSoCClass {
     DeviceClass parent_class;
diff --git a/include/hw/arm/bcm2836.h b/include/hw/arm/bcm2836.h
index 181d9563d0..428c15d316 100644
--- a/include/hw/arm/bcm2836.h
+++ b/include/hw/arm/bcm2836.h
@@ -18,10 +18,7 @@
 #include "qom/object.h"
 
 #define TYPE_BCM283X "bcm283x"
-typedef struct BCM283XClass BCM283XClass;
-typedef struct BCM283XState BCM283XState;
-DECLARE_OBJ_CHECKERS(BCM283XState, BCM283XClass,
-                     BCM283X, TYPE_BCM283X)
+OBJECT_DECLARE_TYPE(BCM283XState, BCM283XClass, BCM283X)
 
 #define BCM283X_NCPUS 4
 
diff --git a/include/hw/arm/smmu-common.h b/include/hw/arm/smmu-common.h
index 54d0872fd8..706be3c6d0 100644
--- a/include/hw/arm/smmu-common.h
+++ b/include/hw/arm/smmu-common.h
@@ -118,7 +118,6 @@ struct SMMUState {
     uint8_t bus_num;
     PCIBus *primary_bus;
 };
-typedef struct SMMUState SMMUState;
 
 struct SMMUBaseClass {
     /* <private> */
@@ -129,11 +128,9 @@ struct SMMUBaseClass {
     DeviceRealize parent_realize;
 
 };
-typedef struct SMMUBaseClass SMMUBaseClass;
 
 #define TYPE_ARM_SMMU "arm-smmu"
-DECLARE_OBJ_CHECKERS(SMMUState, SMMUBaseClass,
-                     ARM_SMMU, TYPE_ARM_SMMU)
+OBJECT_DECLARE_TYPE(SMMUState, SMMUBaseClass, ARM_SMMU)
 
 /* Return the SMMUPciBus handle associated to a PCI bus number */
 SMMUPciBus *smmu_find_smmu_pcibus(SMMUState *s, uint8_t bus_num);
diff --git a/include/hw/arm/smmuv3.h b/include/hw/arm/smmuv3.h
index 2a3f6dd197..c641e60735 100644
--- a/include/hw/arm/smmuv3.h
+++ b/include/hw/arm/smmuv3.h
@@ -63,7 +63,6 @@ struct SMMUv3State {
     qemu_irq     irq[4];
     QemuMutex mutex;
 };
-typedef struct SMMUv3State SMMUv3State;
 
 typedef enum {
     SMMU_IRQ_EVTQ,
@@ -80,10 +79,8 @@ struct SMMUv3Class {
     DeviceRealize parent_realize;
     DeviceReset   parent_reset;
 };
-typedef struct SMMUv3Class SMMUv3Class;
 
 #define TYPE_ARM_SMMUV3   "arm-smmuv3"
-DECLARE_OBJ_CHECKERS(SMMUv3State, SMMUv3Class,
-                     ARM_SMMUV3, TYPE_ARM_SMMUV3)
+OBJECT_DECLARE_TYPE(SMMUv3State, SMMUv3Class, ARM_SMMUV3)
 
 #endif
diff --git a/include/hw/arm/virt.h b/include/hw/arm/virt.h
index 392b0bd571..d018a4f297 100644
--- a/include/hw/arm/virt.h
+++ b/include/hw/arm/virt.h
@@ -128,7 +128,6 @@ struct VirtMachineClass {
     bool kvm_no_adjvtime;
     bool acpi_expose_flash;
 };
-typedef struct VirtMachineClass VirtMachineClass;
 
 struct VirtMachineState {
     MachineState parent;
@@ -165,13 +164,11 @@ struct VirtMachineState {
     DeviceState *acpi_dev;
     Notifier powerdown_notifier;
 };
-typedef struct VirtMachineState VirtMachineState;
 
 #define VIRT_ECAM_ID(high) (high ? VIRT_HIGH_PCIE_ECAM : VIRT_PCIE_ECAM)
 
 #define TYPE_VIRT_MACHINE   MACHINE_TYPE_NAME("virt")
-DECLARE_OBJ_CHECKERS(VirtMachineState, VirtMachineClass,
-                     VIRT_MACHINE, TYPE_VIRT_MACHINE)
+OBJECT_DECLARE_TYPE(VirtMachineState, VirtMachineClass, VIRT_MACHINE)
 
 void virt_acpi_setup(VirtMachineState *vms);
 bool virt_is_acpi_enabled(VirtMachineState *vms);
diff --git a/include/hw/boards.h b/include/hw/boards.h
index 795910d01b..56aa1ca335 100644
--- a/include/hw/boards.h
+++ b/include/hw/boards.h
@@ -21,8 +21,7 @@
 
 #define TYPE_MACHINE "machine"
 #undef MACHINE  /* BSD defines it and QEMU does not use it */
-DECLARE_OBJ_CHECKERS(MachineState, MachineClass,
-                     MACHINE, TYPE_MACHINE)
+OBJECT_DECLARE_TYPE(MachineState, MachineClass, MACHINE)
 
 extern MachineState *current_machine;
 
diff --git a/include/hw/display/macfb.h b/include/hw/display/macfb.h
index 0960480b75..4adfaa725a 100644
--- a/include/hw/display/macfb.h
+++ b/include/hw/display/macfb.h
@@ -43,10 +43,7 @@ struct MacfbSysBusState {
 };
 
 #define TYPE_NUBUS_MACFB "nubus-macfb"
-typedef struct MacfbNubusDeviceClass MacfbNubusDeviceClass;
-typedef struct MacfbNubusState MacfbNubusState;
-DECLARE_OBJ_CHECKERS(MacfbNubusState, MacfbNubusDeviceClass,
-                     NUBUS_MACFB, TYPE_NUBUS_MACFB)
+OBJECT_DECLARE_TYPE(MacfbNubusState, MacfbNubusDeviceClass, NUBUS_MACFB)
 
 struct MacfbNubusDeviceClass {
     DeviceClass parent_class;
diff --git a/include/hw/gpio/aspeed_gpio.h b/include/hw/gpio/aspeed_gpio.h
index 2582e6e0dc..e1636ce7fe 100644
--- a/include/hw/gpio/aspeed_gpio.h
+++ b/include/hw/gpio/aspeed_gpio.h
@@ -14,10 +14,7 @@
 #include "qom/object.h"
 
 #define TYPE_ASPEED_GPIO "aspeed.gpio"
-typedef struct AspeedGPIOClass AspeedGPIOClass;
-typedef struct AspeedGPIOState AspeedGPIOState;
-DECLARE_OBJ_CHECKERS(AspeedGPIOState, AspeedGPIOClass,
-                     ASPEED_GPIO, TYPE_ASPEED_GPIO)
+OBJECT_DECLARE_TYPE(AspeedGPIOState, AspeedGPIOClass, ASPEED_GPIO)
 
 #define ASPEED_GPIO_MAX_NR_SETS 8
 #define ASPEED_REGS_PER_BANK 14
diff --git a/include/hw/i2c/aspeed_i2c.h b/include/hw/i2c/aspeed_i2c.h
index 695e1c0928..565f833066 100644
--- a/include/hw/i2c/aspeed_i2c.h
+++ b/include/hw/i2c/aspeed_i2c.h
@@ -29,10 +29,7 @@
 #define TYPE_ASPEED_2400_I2C TYPE_ASPEED_I2C "-ast2400"
 #define TYPE_ASPEED_2500_I2C TYPE_ASPEED_I2C "-ast2500"
 #define TYPE_ASPEED_2600_I2C TYPE_ASPEED_I2C "-ast2600"
-typedef struct AspeedI2CClass AspeedI2CClass;
-typedef struct AspeedI2CState AspeedI2CState;
-DECLARE_OBJ_CHECKERS(AspeedI2CState, AspeedI2CClass,
-                     ASPEED_I2C, TYPE_ASPEED_I2C)
+OBJECT_DECLARE_TYPE(AspeedI2CState, AspeedI2CClass, ASPEED_I2C)
 
 #define ASPEED_I2C_NR_BUSSES 16
 #define ASPEED_I2C_MAX_POOL_SIZE 0x800
diff --git a/include/hw/i386/ioapic_internal.h b/include/hw/i386/ioapic_internal.h
index e9cc2eaf54..0ac9e2400d 100644
--- a/include/hw/i386/ioapic_internal.h
+++ b/include/hw/i386/ioapic_internal.h
@@ -82,12 +82,9 @@
 
 #define IOAPIC_VER_ENTRIES_SHIFT        16
 
-typedef struct IOAPICCommonState IOAPICCommonState;
 
 #define TYPE_IOAPIC_COMMON "ioapic-common"
-typedef struct IOAPICCommonClass IOAPICCommonClass;
-DECLARE_OBJ_CHECKERS(IOAPICCommonState, IOAPICCommonClass,
-                     IOAPIC_COMMON, TYPE_IOAPIC_COMMON)
+OBJECT_DECLARE_TYPE(IOAPICCommonState, IOAPICCommonClass, IOAPIC_COMMON)
 
 struct IOAPICCommonClass {
     SysBusDeviceClass parent_class;
diff --git a/include/hw/i386/microvm.h b/include/hw/i386/microvm.h
index 36dbcdd123..7aab509fbf 100644
--- a/include/hw/i386/microvm.h
+++ b/include/hw/i386/microvm.h
@@ -45,7 +45,6 @@ struct MicrovmMachineClass {
     HotplugHandler *(*orig_hotplug_handler)(MachineState *machine,
                                            DeviceState *dev);
 };
-typedef struct MicrovmMachineClass MicrovmMachineClass;
 
 struct MicrovmMachineState {
     X86MachineState parent;
@@ -61,10 +60,8 @@ struct MicrovmMachineState {
     /* Machine state */
     bool kernel_cmdline_fixed;
 };
-typedef struct MicrovmMachineState MicrovmMachineState;
 
 #define TYPE_MICROVM_MACHINE   MACHINE_TYPE_NAME("microvm")
-DECLARE_OBJ_CHECKERS(MicrovmMachineState, MicrovmMachineClass,
-                     MICROVM_MACHINE, TYPE_MICROVM_MACHINE)
+OBJECT_DECLARE_TYPE(MicrovmMachineState, MicrovmMachineClass, MICROVM_MACHINE)
 
 #endif
diff --git a/include/hw/i386/pc.h b/include/hw/i386/pc.h
index 421a77acc2..533658e9a9 100644
--- a/include/hw/i386/pc.h
+++ b/include/hw/i386/pc.h
@@ -120,11 +120,9 @@ struct PCMachineClass {
     /* use PVH to load kernels that support this feature */
     bool pvh_enabled;
 };
-typedef struct PCMachineClass PCMachineClass;
 
 #define TYPE_PC_MACHINE "generic-pc-machine"
-DECLARE_OBJ_CHECKERS(PCMachineState, PCMachineClass,
-                     PC_MACHINE, TYPE_PC_MACHINE)
+OBJECT_DECLARE_TYPE(PCMachineState, PCMachineClass, PC_MACHINE)
 
 /* ioapic.c */
 
diff --git a/include/hw/i386/x86-iommu.h b/include/hw/i386/x86-iommu.h
index bbfaf44e79..9de92d33a1 100644
--- a/include/hw/i386/x86-iommu.h
+++ b/include/hw/i386/x86-iommu.h
@@ -26,10 +26,7 @@
 #include "qom/object.h"
 
 #define  TYPE_X86_IOMMU_DEVICE  ("x86-iommu")
-typedef struct X86IOMMUClass X86IOMMUClass;
-typedef struct X86IOMMUState X86IOMMUState;
-DECLARE_OBJ_CHECKERS(X86IOMMUState, X86IOMMUClass,
-                     X86_IOMMU_DEVICE, TYPE_X86_IOMMU_DEVICE)
+OBJECT_DECLARE_TYPE(X86IOMMUState, X86IOMMUClass, X86_IOMMU_DEVICE)
 
 #define X86_IOMMU_SID_INVALID             (0xffff)
 
diff --git a/include/hw/i386/x86.h b/include/hw/i386/x86.h
index 1a188a7dea..68b0193e89 100644
--- a/include/hw/i386/x86.h
+++ b/include/hw/i386/x86.h
@@ -39,7 +39,6 @@ struct X86MachineClass {
     /* Enables contiguous-apic-ID mode */
     bool compat_apic_id_mode;
 };
-typedef struct X86MachineClass X86MachineClass;
 
 struct X86MachineState {
     /*< private >*/
@@ -71,14 +70,12 @@ struct X86MachineState {
      */
     AddressSpace *ioapic_as;
 };
-typedef struct X86MachineState X86MachineState;
 
 #define X86_MACHINE_SMM              "smm"
 #define X86_MACHINE_ACPI             "acpi"
 
 #define TYPE_X86_MACHINE   MACHINE_TYPE_NAME("x86")
-DECLARE_OBJ_CHECKERS(X86MachineState, X86MachineClass,
-                     X86_MACHINE, TYPE_X86_MACHINE)
+OBJECT_DECLARE_TYPE(X86MachineState, X86MachineClass, X86_MACHINE)
 
 void init_topo_info(X86CPUTopoInfo *topo_info, const X86MachineState *x86ms);
 
diff --git a/include/hw/ide/internal.h b/include/hw/ide/internal.h
index eb9eb4e0ae..77c9372c27 100644
--- a/include/hw/ide/internal.h
+++ b/include/hw/ide/internal.h
@@ -488,9 +488,7 @@ struct IDEBus {
 };
 
 #define TYPE_IDE_DEVICE "ide-device"
-typedef struct IDEDeviceClass IDEDeviceClass;
-DECLARE_OBJ_CHECKERS(IDEDevice, IDEDeviceClass,
-                     IDE_DEVICE, TYPE_IDE_DEVICE)
+OBJECT_DECLARE_TYPE(IDEDevice, IDEDeviceClass, IDE_DEVICE)
 
 struct IDEDeviceClass {
     DeviceClass parent_class;
diff --git a/include/hw/input/adb.h b/include/hw/input/adb.h
index 285f70db55..3d1c2f4b10 100644
--- a/include/hw/input/adb.h
+++ b/include/hw/input/adb.h
@@ -43,9 +43,7 @@ typedef int ADBDeviceRequest(ADBDevice *d, uint8_t *buf_out,
 typedef bool ADBDeviceHasData(ADBDevice *d);
 
 #define TYPE_ADB_DEVICE "adb-device"
-typedef struct ADBDeviceClass ADBDeviceClass;
-DECLARE_OBJ_CHECKERS(ADBDevice, ADBDeviceClass,
-                     ADB_DEVICE, TYPE_ADB_DEVICE)
+OBJECT_DECLARE_TYPE(ADBDevice, ADBDeviceClass, ADB_DEVICE)
 
 struct ADBDevice {
     /*< private >*/
diff --git a/include/hw/isa/i8259_internal.h b/include/hw/isa/i8259_internal.h
index cd050bb9f2..a6ae8a583f 100644
--- a/include/hw/isa/i8259_internal.h
+++ b/include/hw/isa/i8259_internal.h
@@ -30,12 +30,9 @@
 #include "hw/intc/i8259.h"
 #include "qom/object.h"
 
-typedef struct PICCommonState PICCommonState;
 
 #define TYPE_PIC_COMMON "pic-common"
-typedef struct PICCommonClass PICCommonClass;
-DECLARE_OBJ_CHECKERS(PICCommonState, PICCommonClass,
-                     PIC_COMMON, TYPE_PIC_COMMON)
+OBJECT_DECLARE_TYPE(PICCommonState, PICCommonClass, PIC_COMMON)
 
 struct PICCommonClass {
     ISADeviceClass parent_class;
diff --git a/include/hw/isa/isa.h b/include/hw/isa/isa.h
index ddb6a2d168..5f7943fa67 100644
--- a/include/hw/isa/isa.h
+++ b/include/hw/isa/isa.h
@@ -11,9 +11,7 @@
 #define ISA_NUM_IRQS 16
 
 #define TYPE_ISA_DEVICE "isa-device"
-typedef struct ISADeviceClass ISADeviceClass;
-DECLARE_OBJ_CHECKERS(ISADevice, ISADeviceClass,
-                     ISA_DEVICE, TYPE_ISA_DEVICE)
+OBJECT_DECLARE_TYPE(ISADevice, ISADeviceClass, ISA_DEVICE)
 
 #define TYPE_ISA_BUS "ISA"
 DECLARE_INSTANCE_CHECKER(ISABus, ISA_BUS,
diff --git a/include/hw/mem/nvdimm.h b/include/hw/mem/nvdimm.h
index 19e3d3092d..c699842dd0 100644
--- a/include/hw/mem/nvdimm.h
+++ b/include/hw/mem/nvdimm.h
@@ -46,10 +46,7 @@
 #define MIN_NAMESPACE_LABEL_SIZE      (128UL << 10)
 
 #define TYPE_NVDIMM      "nvdimm"
-typedef struct NVDIMMClass NVDIMMClass;
-typedef struct NVDIMMDevice NVDIMMDevice;
-DECLARE_OBJ_CHECKERS(NVDIMMDevice, NVDIMMClass,
-                     NVDIMM, TYPE_NVDIMM)
+OBJECT_DECLARE_TYPE(NVDIMMDevice, NVDIMMClass, NVDIMM)
 
 #define NVDIMM_LABEL_SIZE_PROP "label-size"
 #define NVDIMM_UUID_PROP       "uuid"
diff --git a/include/hw/misc/aspeed_scu.h b/include/hw/misc/aspeed_scu.h
index 8d3b14acd4..d49bfb02fb 100644
--- a/include/hw/misc/aspeed_scu.h
+++ b/include/hw/misc/aspeed_scu.h
@@ -15,10 +15,7 @@
 #include "qom/object.h"
 
 #define TYPE_ASPEED_SCU "aspeed.scu"
-typedef struct AspeedSCUClass AspeedSCUClass;
-typedef struct AspeedSCUState AspeedSCUState;
-DECLARE_OBJ_CHECKERS(AspeedSCUState, AspeedSCUClass,
-                     ASPEED_SCU, TYPE_ASPEED_SCU)
+OBJECT_DECLARE_TYPE(AspeedSCUState, AspeedSCUClass, ASPEED_SCU)
 #define TYPE_ASPEED_2400_SCU TYPE_ASPEED_SCU "-ast2400"
 #define TYPE_ASPEED_2500_SCU TYPE_ASPEED_SCU "-ast2500"
 #define TYPE_ASPEED_2600_SCU TYPE_ASPEED_SCU "-ast2600"
diff --git a/include/hw/misc/aspeed_sdmc.h b/include/hw/misc/aspeed_sdmc.h
index 3375afc89b..ec2d59a14f 100644
--- a/include/hw/misc/aspeed_sdmc.h
+++ b/include/hw/misc/aspeed_sdmc.h
@@ -13,10 +13,7 @@
 #include "qom/object.h"
 
 #define TYPE_ASPEED_SDMC "aspeed.sdmc"
-typedef struct AspeedSDMCClass AspeedSDMCClass;
-typedef struct AspeedSDMCState AspeedSDMCState;
-DECLARE_OBJ_CHECKERS(AspeedSDMCState, AspeedSDMCClass,
-                     ASPEED_SDMC, TYPE_ASPEED_SDMC)
+OBJECT_DECLARE_TYPE(AspeedSDMCState, AspeedSDMCClass, ASPEED_SDMC)
 #define TYPE_ASPEED_2400_SDMC TYPE_ASPEED_SDMC "-ast2400"
 #define TYPE_ASPEED_2500_SDMC TYPE_ASPEED_SDMC "-ast2500"
 #define TYPE_ASPEED_2600_SDMC TYPE_ASPEED_SDMC "-ast2600"
diff --git a/include/hw/misc/imx_ccm.h b/include/hw/misc/imx_ccm.h
index e9d82a2a50..7e5678e972 100644
--- a/include/hw/misc/imx_ccm.h
+++ b/include/hw/misc/imx_ccm.h
@@ -28,10 +28,7 @@
 #define PLL_MFN(x)              (((x) & 0x3ff) << 0)
 
 #define TYPE_IMX_CCM "imx.ccm"
-typedef struct IMXCCMClass IMXCCMClass;
-typedef struct IMXCCMState IMXCCMState;
-DECLARE_OBJ_CHECKERS(IMXCCMState, IMXCCMClass,
-                     IMX_CCM, TYPE_IMX_CCM)
+OBJECT_DECLARE_TYPE(IMXCCMState, IMXCCMClass, IMX_CCM)
 
 struct IMXCCMState {
     /* <private> */
diff --git a/include/hw/misc/mos6522.h b/include/hw/misc/mos6522.h
index f73271ba67..fc95d22b0f 100644
--- a/include/hw/misc/mos6522.h
+++ b/include/hw/misc/mos6522.h
@@ -122,12 +122,9 @@ struct MOS6522State {
 
     qemu_irq irq;
 };
-typedef struct MOS6522State MOS6522State;
 
 #define TYPE_MOS6522 "mos6522"
-typedef struct MOS6522DeviceClass MOS6522DeviceClass;
-DECLARE_OBJ_CHECKERS(MOS6522State, MOS6522DeviceClass,
-                     MOS6522, TYPE_MOS6522)
+OBJECT_DECLARE_TYPE(MOS6522State, MOS6522DeviceClass, MOS6522)
 
 struct MOS6522DeviceClass {
     DeviceClass parent_class;
diff --git a/include/hw/pci-host/pnv_phb4.h b/include/hw/pci-host/pnv_phb4.h
index 15a4633178..05efb4e6b9 100644
--- a/include/hw/pci-host/pnv_phb4.h
+++ b/include/hw/pci-host/pnv_phb4.h
@@ -15,7 +15,6 @@
 #include "hw/ppc/xive.h"
 #include "qom/object.h"
 
-typedef struct PnvPhb4PecState PnvPhb4PecState;
 typedef struct PnvPhb4PecStack PnvPhb4PecStack;
 typedef struct PnvPHB4 PnvPHB4;
 typedef struct PnvChip PnvChip;
@@ -142,9 +141,7 @@ extern const MemoryRegionOps pnv_phb4_xscom_ops;
  * PHB4 PEC (PCI Express Controller)
  */
 #define TYPE_PNV_PHB4_PEC "pnv-phb4-pec"
-typedef struct PnvPhb4PecClass PnvPhb4PecClass;
-DECLARE_OBJ_CHECKERS(PnvPhb4PecState, PnvPhb4PecClass,
-                     PNV_PHB4_PEC, TYPE_PNV_PHB4_PEC)
+OBJECT_DECLARE_TYPE(PnvPhb4PecState, PnvPhb4PecClass, PNV_PHB4_PEC)
 
 #define TYPE_PNV_PHB4_PEC_STACK "pnv-phb4-pec-stack"
 DECLARE_INSTANCE_CHECKER(PnvPhb4PecStack, PNV_PHB4_PEC_STACK,
diff --git a/include/hw/pci/pci.h b/include/hw/pci/pci.h
index c13ae1f858..0a59a06b14 100644
--- a/include/hw/pci/pci.h
+++ b/include/hw/pci/pci.h
@@ -394,9 +394,7 @@ typedef int (*pci_map_irq_fn)(PCIDevice *pci_dev, int irq_num);
 typedef PCIINTxRoute (*pci_route_irq_fn)(void *opaque, int pin);
 
 #define TYPE_PCI_BUS "PCI"
-typedef struct PCIBusClass PCIBusClass;
-DECLARE_OBJ_CHECKERS(PCIBus, PCIBusClass,
-                     PCI_BUS, TYPE_PCI_BUS)
+OBJECT_DECLARE_TYPE(PCIBus, PCIBusClass, PCI_BUS)
 #define TYPE_PCIE_BUS "PCIE"
 
 bool pci_bus_is_express(PCIBus *bus);
diff --git a/include/hw/pci/pci_host.h b/include/hw/pci/pci_host.h
index d1fc1c3604..52e038c019 100644
--- a/include/hw/pci/pci_host.h
+++ b/include/hw/pci/pci_host.h
@@ -32,9 +32,7 @@
 #include "qom/object.h"
 
 #define TYPE_PCI_HOST_BRIDGE "pci-host-bridge"
-typedef struct PCIHostBridgeClass PCIHostBridgeClass;
-DECLARE_OBJ_CHECKERS(PCIHostState, PCIHostBridgeClass,
-                     PCI_HOST_BRIDGE, TYPE_PCI_HOST_BRIDGE)
+OBJECT_DECLARE_TYPE(PCIHostState, PCIHostBridgeClass, PCI_HOST_BRIDGE)
 
 struct PCIHostState {
     SysBusDevice busdev;
diff --git a/include/hw/pcmcia.h b/include/hw/pcmcia.h
index fb40ae7e09..e3ba44e0bf 100644
--- a/include/hw/pcmcia.h
+++ b/include/hw/pcmcia.h
@@ -12,10 +12,7 @@ typedef struct PCMCIASocket {
 } PCMCIASocket;
 
 #define TYPE_PCMCIA_CARD "pcmcia-card"
-typedef struct PCMCIACardClass PCMCIACardClass;
-typedef struct PCMCIACardState PCMCIACardState;
-DECLARE_OBJ_CHECKERS(PCMCIACardState, PCMCIACardClass,
-                     PCMCIA_CARD, TYPE_PCMCIA_CARD)
+OBJECT_DECLARE_TYPE(PCMCIACardState, PCMCIACardClass, PCMCIA_CARD)
 
 struct PCMCIACardState {
     /*< private >*/
diff --git a/include/hw/ppc/spapr.h b/include/hw/ppc/spapr.h
index c8cd63bc06..eea7ac8624 100644
--- a/include/hw/ppc/spapr.h
+++ b/include/hw/ppc/spapr.h
@@ -39,12 +39,9 @@ struct SpaprRtcState {
 };
 
 typedef struct SpaprDimmState SpaprDimmState;
-typedef struct SpaprMachineClass SpaprMachineClass;
 
 #define TYPE_SPAPR_MACHINE      "spapr-machine"
-typedef struct SpaprMachineState SpaprMachineState;
-DECLARE_OBJ_CHECKERS(SpaprMachineState, SpaprMachineClass,
-                     SPAPR_MACHINE, TYPE_SPAPR_MACHINE)
+OBJECT_DECLARE_TYPE(SpaprMachineState, SpaprMachineClass, SPAPR_MACHINE)
 
 typedef enum {
     SPAPR_RESIZE_HPT_DEFAULT = 0,
diff --git a/include/hw/qdev-core.h b/include/hw/qdev-core.h
index e025ba9653..72064f4dd4 100644
--- a/include/hw/qdev-core.h
+++ b/include/hw/qdev-core.h
@@ -12,9 +12,7 @@ enum {
 };
 
 #define TYPE_DEVICE "device"
-typedef struct DeviceClass DeviceClass;
-DECLARE_OBJ_CHECKERS(DeviceState, DeviceClass,
-                     DEVICE, TYPE_DEVICE)
+OBJECT_DECLARE_TYPE(DeviceState, DeviceClass, DEVICE)
 
 typedef enum DeviceCategory {
     DEVICE_CATEGORY_BRIDGE,
diff --git a/include/hw/rtc/allwinner-rtc.h b/include/hw/rtc/allwinner-rtc.h
index 5a6e9fff32..bf415431cd 100644
--- a/include/hw/rtc/allwinner-rtc.h
+++ b/include/hw/rtc/allwinner-rtc.h
@@ -60,10 +60,7 @@
  * @{
  */
 
-typedef struct AwRtcClass AwRtcClass;
-typedef struct AwRtcState AwRtcState;
-DECLARE_OBJ_CHECKERS(AwRtcState, AwRtcClass,
-                     AW_RTC, TYPE_AW_RTC)
+OBJECT_DECLARE_TYPE(AwRtcState, AwRtcClass, AW_RTC)
 
 /** @} */
 
diff --git a/include/hw/s390x/3270-ccw.h b/include/hw/s390x/3270-ccw.h
index 9a11093192..1439882294 100644
--- a/include/hw/s390x/3270-ccw.h
+++ b/include/hw/s390x/3270-ccw.h
@@ -31,10 +31,7 @@
 #define TC_EWRITEA 0x0d         /* Erase write alternate */
 #define TC_WRITESF 0x11         /* Write structured field */
 
-typedef struct EmulatedCcw3270Class EmulatedCcw3270Class;
-typedef struct EmulatedCcw3270Device EmulatedCcw3270Device;
-DECLARE_OBJ_CHECKERS(EmulatedCcw3270Device, EmulatedCcw3270Class,
-                     EMULATED_CCW_3270, TYPE_EMULATED_CCW_3270)
+OBJECT_DECLARE_TYPE(EmulatedCcw3270Device, EmulatedCcw3270Class, EMULATED_CCW_3270)
 
 struct EmulatedCcw3270Device {
     CcwDevice parent_obj;
diff --git a/include/hw/s390x/s390-virtio-ccw.h b/include/hw/s390x/s390-virtio-ccw.h
index 54d14da0a6..3331990e02 100644
--- a/include/hw/s390x/s390-virtio-ccw.h
+++ b/include/hw/s390x/s390-virtio-ccw.h
@@ -16,10 +16,7 @@
 
 #define TYPE_S390_CCW_MACHINE               "s390-ccw-machine"
 
-typedef struct S390CcwMachineClass S390CcwMachineClass;
-typedef struct S390CcwMachineState S390CcwMachineState;
-DECLARE_OBJ_CHECKERS(S390CcwMachineState, S390CcwMachineClass,
-                     S390_CCW_MACHINE, TYPE_S390_CCW_MACHINE)
+OBJECT_DECLARE_TYPE(S390CcwMachineState, S390CcwMachineClass, S390_CCW_MACHINE)
 
 
 struct S390CcwMachineState {
diff --git a/include/hw/s390x/storage-attributes.h b/include/hw/s390x/storage-attributes.h
index efb28c48be..5239eb538c 100644
--- a/include/hw/s390x/storage-attributes.h
+++ b/include/hw/s390x/storage-attributes.h
@@ -20,10 +20,7 @@
 #define TYPE_QEMU_S390_STATTRIB "s390-storage_attributes-qemu"
 #define TYPE_KVM_S390_STATTRIB "s390-storage_attributes-kvm"
 
-typedef struct S390StAttribClass S390StAttribClass;
-typedef struct S390StAttribState S390StAttribState;
-DECLARE_OBJ_CHECKERS(S390StAttribState, S390StAttribClass,
-                     S390_STATTRIB, TYPE_S390_STATTRIB)
+OBJECT_DECLARE_TYPE(S390StAttribState, S390StAttribClass, S390_STATTRIB)
 
 struct S390StAttribState {
     DeviceState parent_obj;
diff --git a/include/hw/s390x/storage-keys.h b/include/hw/s390x/storage-keys.h
index 40f042f54e..2888d42d0b 100644
--- a/include/hw/s390x/storage-keys.h
+++ b/include/hw/s390x/storage-keys.h
@@ -17,10 +17,7 @@
 #include "qom/object.h"
 
 #define TYPE_S390_SKEYS "s390-skeys"
-typedef struct S390SKeysClass S390SKeysClass;
-typedef struct S390SKeysState S390SKeysState;
-DECLARE_OBJ_CHECKERS(S390SKeysState, S390SKeysClass,
-                     S390_SKEYS, TYPE_S390_SKEYS)
+OBJECT_DECLARE_TYPE(S390SKeysState, S390SKeysClass, S390_SKEYS)
 
 struct S390SKeysState {
     DeviceState parent_obj;
diff --git a/include/hw/s390x/tod.h b/include/hw/s390x/tod.h
index c02498f65e..ff3195a4bf 100644
--- a/include/hw/s390x/tod.h
+++ b/include/hw/s390x/tod.h
@@ -21,10 +21,7 @@ typedef struct S390TOD {
 } S390TOD;
 
 #define TYPE_S390_TOD "s390-tod"
-typedef struct S390TODClass S390TODClass;
-typedef struct S390TODState S390TODState;
-DECLARE_OBJ_CHECKERS(S390TODState, S390TODClass,
-                     S390_TOD, TYPE_S390_TOD)
+OBJECT_DECLARE_TYPE(S390TODState, S390TODClass, S390_TOD)
 #define TYPE_KVM_S390_TOD TYPE_S390_TOD "-kvm"
 #define TYPE_QEMU_S390_TOD TYPE_S390_TOD "-qemu"
 
diff --git a/include/hw/scsi/scsi.h b/include/hw/scsi/scsi.h
index 3818e3fa46..b1e2ed7c35 100644
--- a/include/hw/scsi/scsi.h
+++ b/include/hw/scsi/scsi.h
@@ -50,9 +50,7 @@ struct SCSIRequest {
 };
 
 #define TYPE_SCSI_DEVICE "scsi-device"
-typedef struct SCSIDeviceClass SCSIDeviceClass;
-DECLARE_OBJ_CHECKERS(SCSIDevice, SCSIDeviceClass,
-                     SCSI_DEVICE, TYPE_SCSI_DEVICE)
+OBJECT_DECLARE_TYPE(SCSIDevice, SCSIDeviceClass, SCSI_DEVICE)
 
 struct SCSIDeviceClass {
     DeviceClass parent_class;
diff --git a/include/hw/sd/allwinner-sdhost.h b/include/hw/sd/allwinner-sdhost.h
index 7bccc06d1c..bfe08ff4ef 100644
--- a/include/hw/sd/allwinner-sdhost.h
+++ b/include/hw/sd/allwinner-sdhost.h
@@ -45,10 +45,7 @@
  * @{
  */
 
-typedef struct AwSdHostClass AwSdHostClass;
-typedef struct AwSdHostState AwSdHostState;
-DECLARE_OBJ_CHECKERS(AwSdHostState, AwSdHostClass,
-                     AW_SDHOST, TYPE_AW_SDHOST)
+OBJECT_DECLARE_TYPE(AwSdHostState, AwSdHostClass, AW_SDHOST)
 
 /** @} */
 
diff --git a/include/hw/sd/sd.h b/include/hw/sd/sd.h
index 8dd4c363f5..59d108d453 100644
--- a/include/hw/sd/sd.h
+++ b/include/hw/sd/sd.h
@@ -89,12 +89,9 @@ typedef struct {
     uint8_t crc;
 } SDRequest;
 
-typedef struct SDState SDState;
 
 #define TYPE_SD_CARD "sd-card"
-typedef struct SDCardClass SDCardClass;
-DECLARE_OBJ_CHECKERS(SDState, SDCardClass,
-                     SD_CARD, TYPE_SD_CARD)
+OBJECT_DECLARE_TYPE(SDState, SDCardClass, SD_CARD)
 
 struct SDCardClass {
     /*< private >*/
diff --git a/include/hw/ssi/aspeed_smc.h b/include/hw/ssi/aspeed_smc.h
index 8e023d8ff6..3dd354b52e 100644
--- a/include/hw/ssi/aspeed_smc.h
+++ b/include/hw/ssi/aspeed_smc.h
@@ -68,10 +68,7 @@ typedef struct AspeedSMCFlash {
 } AspeedSMCFlash;
 
 #define TYPE_ASPEED_SMC "aspeed.smc"
-typedef struct AspeedSMCClass AspeedSMCClass;
-typedef struct AspeedSMCState AspeedSMCState;
-DECLARE_OBJ_CHECKERS(AspeedSMCState, AspeedSMCClass,
-                     ASPEED_SMC, TYPE_ASPEED_SMC)
+OBJECT_DECLARE_TYPE(AspeedSMCState, AspeedSMCClass, ASPEED_SMC)
 
 struct AspeedSMCClass {
     SysBusDevice parent_obj;
diff --git a/include/hw/ssi/xilinx_spips.h b/include/hw/ssi/xilinx_spips.h
index b1ab347617..a2bf2cf3c7 100644
--- a/include/hw/ssi/xilinx_spips.h
+++ b/include/hw/ssi/xilinx_spips.h
@@ -130,14 +130,12 @@ struct XilinxSPIPSClass {
     uint32_t rx_fifo_size;
     uint32_t tx_fifo_size;
 };
-typedef struct XilinxSPIPSClass XilinxSPIPSClass;
 
 #define TYPE_XILINX_SPIPS "xlnx.ps7-spi"
 #define TYPE_XILINX_QSPIPS "xlnx.ps7-qspi"
 #define TYPE_XLNX_ZYNQMP_QSPIPS "xlnx.usmp-gqspi"
 
-DECLARE_OBJ_CHECKERS(XilinxSPIPS, XilinxSPIPSClass,
-                     XILINX_SPIPS, TYPE_XILINX_SPIPS)
+OBJECT_DECLARE_TYPE(XilinxSPIPS, XilinxSPIPSClass, XILINX_SPIPS)
 
 DECLARE_INSTANCE_CHECKER(XilinxQSPIPS, XILINX_QSPIPS,
                          TYPE_XILINX_QSPIPS)
diff --git a/include/hw/timer/aspeed_timer.h b/include/hw/timer/aspeed_timer.h
index 4c76f955c9..d36034a10c 100644
--- a/include/hw/timer/aspeed_timer.h
+++ b/include/hw/timer/aspeed_timer.h
@@ -27,10 +27,7 @@
 #include "qom/object.h"
 
 #define TYPE_ASPEED_TIMER "aspeed.timer"
-typedef struct AspeedTimerClass AspeedTimerClass;
-typedef struct AspeedTimerCtrlState AspeedTimerCtrlState;
-DECLARE_OBJ_CHECKERS(AspeedTimerCtrlState, AspeedTimerClass,
-                     ASPEED_TIMER, TYPE_ASPEED_TIMER)
+OBJECT_DECLARE_TYPE(AspeedTimerCtrlState, AspeedTimerClass, ASPEED_TIMER)
 #define TYPE_ASPEED_2400_TIMER TYPE_ASPEED_TIMER "-ast2400"
 #define TYPE_ASPEED_2500_TIMER TYPE_ASPEED_TIMER "-ast2500"
 #define TYPE_ASPEED_2600_TIMER TYPE_ASPEED_TIMER "-ast2600"
diff --git a/include/hw/timer/i8254.h b/include/hw/timer/i8254.h
index 1a522a2457..3e569f42b6 100644
--- a/include/hw/timer/i8254.h
+++ b/include/hw/timer/i8254.h
@@ -40,10 +40,7 @@ typedef struct PITChannelInfo {
 } PITChannelInfo;
 
 #define TYPE_PIT_COMMON "pit-common"
-typedef struct PITCommonState PITCommonState;
-typedef struct PITCommonClass PITCommonClass;
-DECLARE_OBJ_CHECKERS(PITCommonState, PITCommonClass,
-                     PIT_COMMON, TYPE_PIT_COMMON)
+OBJECT_DECLARE_TYPE(PITCommonState, PITCommonClass, PIT_COMMON)
 
 #define TYPE_I8254 "isa-pit"
 #define TYPE_KVM_I8254 "kvm-pit"
diff --git a/include/hw/usb.h b/include/hw/usb.h
index 5783635491..355745c23a 100644
--- a/include/hw/usb.h
+++ b/include/hw/usb.h
@@ -265,9 +265,7 @@ struct USBDevice {
 };
 
 #define TYPE_USB_DEVICE "usb-device"
-typedef struct USBDeviceClass USBDeviceClass;
-DECLARE_OBJ_CHECKERS(USBDevice, USBDeviceClass,
-                     USB_DEVICE, TYPE_USB_DEVICE)
+OBJECT_DECLARE_TYPE(USBDevice, USBDeviceClass, USB_DEVICE)
 
 typedef void (*USBDeviceRealize)(USBDevice *dev, Error **errp);
 typedef void (*USBDeviceUnrealize)(USBDevice *dev);
diff --git a/include/hw/virtio/virtio.h b/include/hw/virtio/virtio.h
index 807280451b..28cf3b9120 100644
--- a/include/hw/virtio/virtio.h
+++ b/include/hw/virtio/virtio.h
@@ -68,9 +68,7 @@ typedef struct VirtQueueElement
 #define VIRTIO_NO_VECTOR 0xffff
 
 #define TYPE_VIRTIO_DEVICE "virtio-device"
-typedef struct VirtioDeviceClass VirtioDeviceClass;
-DECLARE_OBJ_CHECKERS(VirtIODevice, VirtioDeviceClass,
-                     VIRTIO_DEVICE, TYPE_VIRTIO_DEVICE)
+OBJECT_DECLARE_TYPE(VirtIODevice, VirtioDeviceClass, VIRTIO_DEVICE)
 
 enum virtio_device_endian {
     VIRTIO_DEVICE_ENDIAN_UNKNOWN,
diff --git a/include/hw/watchdog/wdt_aspeed.h b/include/hw/watchdog/wdt_aspeed.h
index 2ca1eb5432..80b03661e3 100644
--- a/include/hw/watchdog/wdt_aspeed.h
+++ b/include/hw/watchdog/wdt_aspeed.h
@@ -15,10 +15,7 @@
 #include "qom/object.h"
 
 #define TYPE_ASPEED_WDT "aspeed.wdt"
-typedef struct AspeedWDTClass AspeedWDTClass;
-typedef struct AspeedWDTState AspeedWDTState;
-DECLARE_OBJ_CHECKERS(AspeedWDTState, AspeedWDTClass,
-                     ASPEED_WDT, TYPE_ASPEED_WDT)
+OBJECT_DECLARE_TYPE(AspeedWDTState, AspeedWDTClass, ASPEED_WDT)
 #define TYPE_ASPEED_2400_WDT TYPE_ASPEED_WDT "-ast2400"
 #define TYPE_ASPEED_2500_WDT TYPE_ASPEED_WDT "-ast2500"
 #define TYPE_ASPEED_2600_WDT TYPE_ASPEED_WDT "-ast2600"
diff --git a/include/hw/xen/xen-block.h b/include/hw/xen/xen-block.h
index 8ff5421dc3..a74fd9384f 100644
--- a/include/hw/xen/xen-block.h
+++ b/include/hw/xen/xen-block.h
@@ -68,11 +68,9 @@ struct XenBlockDeviceClass {
     XenBlockDeviceRealize realize;
     XenBlockDeviceUnrealize unrealize;
 };
-typedef struct XenBlockDeviceClass XenBlockDeviceClass;
 
 #define TYPE_XEN_BLOCK_DEVICE  "xen-block"
-DECLARE_OBJ_CHECKERS(XenBlockDevice, XenBlockDeviceClass,
-                     XEN_BLOCK_DEVICE, TYPE_XEN_BLOCK_DEVICE)
+OBJECT_DECLARE_TYPE(XenBlockDevice, XenBlockDeviceClass, XEN_BLOCK_DEVICE)
 
 struct XenDiskDevice {
     XenBlockDevice blockdev;
diff --git a/include/hw/xen/xen-bus.h b/include/hw/xen/xen-bus.h
index 1924d93c6c..3df696136f 100644
--- a/include/hw/xen/xen-bus.h
+++ b/include/hw/xen/xen-bus.h
@@ -57,11 +57,9 @@ struct XenDeviceClass {
     XenDeviceFrontendChanged frontend_changed;
     XenDeviceUnrealize unrealize;
 };
-typedef struct XenDeviceClass XenDeviceClass;
 
 #define TYPE_XEN_DEVICE "xen-device"
-DECLARE_OBJ_CHECKERS(XenDevice, XenDeviceClass,
-                     XEN_DEVICE, TYPE_XEN_DEVICE)
+OBJECT_DECLARE_TYPE(XenDevice, XenDeviceClass, XEN_DEVICE)
 
 struct XenBus {
     BusState qbus;
diff --git a/include/net/can_host.h b/include/net/can_host.h
index 18979c2e2d..4e3ce3f954 100644
--- a/include/net/can_host.h
+++ b/include/net/can_host.h
@@ -32,10 +32,7 @@
 #include "qom/object.h"
 
 #define TYPE_CAN_HOST "can-host"
-typedef struct CanHostClass CanHostClass;
-typedef struct CanHostState CanHostState;
-DECLARE_OBJ_CHECKERS(CanHostState, CanHostClass,
-                     CAN_HOST, TYPE_CAN_HOST)
+OBJECT_DECLARE_TYPE(CanHostState, CanHostClass, CAN_HOST)
 
 struct CanHostState {
     ObjectClass oc;
diff --git a/include/net/filter.h b/include/net/filter.h
index e7e593128a..27ffc630df 100644
--- a/include/net/filter.h
+++ b/include/net/filter.h
@@ -15,9 +15,7 @@
 #include "net/queue.h"
 
 #define TYPE_NETFILTER "netfilter"
-typedef struct NetFilterClass NetFilterClass;
-DECLARE_OBJ_CHECKERS(NetFilterState, NetFilterClass,
-                     NETFILTER, TYPE_NETFILTER)
+OBJECT_DECLARE_TYPE(NetFilterState, NetFilterClass, NETFILTER)
 
 typedef void (FilterSetup) (NetFilterState *nf, Error **errp);
 typedef void (FilterCleanup) (NetFilterState *nf);
diff --git a/include/ui/console.h b/include/ui/console.h
index 8602203523..d091c2e1e2 100644
--- a/include/ui/console.h
+++ b/include/ui/console.h
@@ -106,9 +106,7 @@ void kbd_put_keysym(int keysym);
 /* consoles */
 
 #define TYPE_QEMU_CONSOLE "qemu-console"
-typedef struct QemuConsoleClass QemuConsoleClass;
-DECLARE_OBJ_CHECKERS(QemuConsole, QemuConsoleClass,
-                     QEMU_CONSOLE, TYPE_QEMU_CONSOLE)
+OBJECT_DECLARE_TYPE(QemuConsole, QemuConsoleClass, QEMU_CONSOLE)
 
 
 struct QemuConsoleClass {
diff --git a/hw/arm/mps2-tz.c b/hw/arm/mps2-tz.c
index dbf7d63dc8..3707876d6d 100644
--- a/hw/arm/mps2-tz.c
+++ b/hw/arm/mps2-tz.c
@@ -77,7 +77,6 @@ struct MPS2TZMachineClass {
     uint32_t scc_id;
     const char *armsse_type;
 };
-typedef struct MPS2TZMachineClass MPS2TZMachineClass;
 
 struct MPS2TZMachineState {
     MachineState parent;
@@ -102,14 +101,12 @@ struct MPS2TZMachineState {
     DeviceState *lan9118;
     SplitIRQ cpu_irq_splitter[MPS2TZ_NUMIRQ];
 };
-typedef struct MPS2TZMachineState MPS2TZMachineState;
 
 #define TYPE_MPS2TZ_MACHINE "mps2tz"
 #define TYPE_MPS2TZ_AN505_MACHINE MACHINE_TYPE_NAME("mps2-an505")
 #define TYPE_MPS2TZ_AN521_MACHINE MACHINE_TYPE_NAME("mps2-an521")
 
-DECLARE_OBJ_CHECKERS(MPS2TZMachineState, MPS2TZMachineClass,
-                     MPS2TZ_MACHINE, TYPE_MPS2TZ_MACHINE)
+OBJECT_DECLARE_TYPE(MPS2TZMachineState, MPS2TZMachineClass, MPS2TZ_MACHINE)
 
 /* Main SYSCLK frequency in Hz */
 #define SYSCLK_FRQ 20000000
diff --git a/hw/arm/mps2.c b/hw/arm/mps2.c
index 5d47160850..9a8b23c64c 100644
--- a/hw/arm/mps2.c
+++ b/hw/arm/mps2.c
@@ -63,7 +63,6 @@ struct MPS2MachineClass {
     hwaddr ethernet_base;
     hwaddr psram_base;
 };
-typedef struct MPS2MachineClass MPS2MachineClass;
 
 struct MPS2MachineState {
     MachineState parent;
@@ -85,7 +84,6 @@ struct MPS2MachineState {
     CMSDKAPBDualTimer dualtimer;
     CMSDKAPBWatchdog watchdog;
 };
-typedef struct MPS2MachineState MPS2MachineState;
 
 #define TYPE_MPS2_MACHINE "mps2"
 #define TYPE_MPS2_AN385_MACHINE MACHINE_TYPE_NAME("mps2-an385")
@@ -93,8 +91,7 @@ typedef struct MPS2MachineState MPS2MachineState;
 #define TYPE_MPS2_AN500_MACHINE MACHINE_TYPE_NAME("mps2-an500")
 #define TYPE_MPS2_AN511_MACHINE MACHINE_TYPE_NAME("mps2-an511")
 
-DECLARE_OBJ_CHECKERS(MPS2MachineState, MPS2MachineClass,
-                     MPS2_MACHINE, TYPE_MPS2_MACHINE)
+OBJECT_DECLARE_TYPE(MPS2MachineState, MPS2MachineClass, MPS2_MACHINE)
 
 /* Main SYSCLK frequency in Hz */
 #define SYSCLK_FRQ 25000000
diff --git a/hw/arm/musca.c b/hw/arm/musca.c
index 16015255c8..b50157f63a 100644
--- a/hw/arm/musca.c
+++ b/hw/arm/musca.c
@@ -55,7 +55,6 @@ struct MuscaMachineClass {
     const MPCInfo *mpc_info;
     int num_mpcs;
 };
-typedef struct MuscaMachineClass MuscaMachineClass;
 
 struct MuscaMachineState {
     MachineState parent;
@@ -84,14 +83,12 @@ struct MuscaMachineState {
     UnimplementedDeviceState gpio;
     UnimplementedDeviceState cryptoisland;
 };
-typedef struct MuscaMachineState MuscaMachineState;
 
 #define TYPE_MUSCA_MACHINE "musca"
 #define TYPE_MUSCA_A_MACHINE MACHINE_TYPE_NAME("musca-a")
 #define TYPE_MUSCA_B1_MACHINE MACHINE_TYPE_NAME("musca-b1")
 
-DECLARE_OBJ_CHECKERS(MuscaMachineState, MuscaMachineClass,
-                     MUSCA_MACHINE, TYPE_MUSCA_MACHINE)
+OBJECT_DECLARE_TYPE(MuscaMachineState, MuscaMachineClass, MUSCA_MACHINE)
 
 /*
  * Main SYSCLK frequency in Hz
diff --git a/hw/arm/spitz.c b/hw/arm/spitz.c
index a7ad667f06..b5b867e6ed 100644
--- a/hw/arm/spitz.c
+++ b/hw/arm/spitz.c
@@ -43,7 +43,6 @@ struct SpitzMachineClass {
     enum spitz_model_e model;
     int arm_id;
 };
-typedef struct SpitzMachineClass SpitzMachineClass;
 
 struct SpitzMachineState {
     MachineState parent;
@@ -56,11 +55,9 @@ struct SpitzMachineState {
     DeviceState *scp1;
     DeviceState *misc_gpio;
 };
-typedef struct SpitzMachineState SpitzMachineState;
 
 #define TYPE_SPITZ_MACHINE "spitz-common"
-DECLARE_OBJ_CHECKERS(SpitzMachineState, SpitzMachineClass,
-                     SPITZ_MACHINE, TYPE_SPITZ_MACHINE)
+OBJECT_DECLARE_TYPE(SpitzMachineState, SpitzMachineClass, SPITZ_MACHINE)
 
 #define zaurus_printf(format, ...)                              \
     fprintf(stderr, "%s: " format, __func__, ##__VA_ARGS__)
diff --git a/hw/arm/vexpress.c b/hw/arm/vexpress.c
index 01bb4bba1e..94ff094ab3 100644
--- a/hw/arm/vexpress.c
+++ b/hw/arm/vexpress.c
@@ -171,20 +171,17 @@ struct VexpressMachineClass {
     MachineClass parent;
     VEDBoardInfo *daughterboard;
 };
-typedef struct VexpressMachineClass VexpressMachineClass;
 
 struct VexpressMachineState {
     MachineState parent;
     bool secure;
     bool virt;
 };
-typedef struct VexpressMachineState VexpressMachineState;
 
 #define TYPE_VEXPRESS_MACHINE   "vexpress"
 #define TYPE_VEXPRESS_A9_MACHINE   MACHINE_TYPE_NAME("vexpress-a9")
 #define TYPE_VEXPRESS_A15_MACHINE   MACHINE_TYPE_NAME("vexpress-a15")
-DECLARE_OBJ_CHECKERS(VexpressMachineState, VexpressMachineClass,
-                     VEXPRESS_MACHINE, TYPE_VEXPRESS_MACHINE)
+OBJECT_DECLARE_TYPE(VexpressMachineState, VexpressMachineClass, VEXPRESS_MACHINE)
 
 typedef void DBoardInitFn(const VexpressMachineState *machine,
                           ram_addr_t ram_size,
diff --git a/hw/block/m25p80.c b/hw/block/m25p80.c
index 8dae779c76..483925f57a 100644
--- a/hw/block/m25p80.c
+++ b/hw/block/m25p80.c
@@ -456,17 +456,14 @@ struct Flash {
     const FlashPartInfo *pi;
 
 };
-typedef struct Flash Flash;
 
 struct M25P80Class {
     SSISlaveClass parent_class;
     FlashPartInfo *pi;
 };
-typedef struct M25P80Class M25P80Class;
 
 #define TYPE_M25P80 "m25p80-generic"
-DECLARE_OBJ_CHECKERS(Flash, M25P80Class,
-                     M25P80, TYPE_M25P80)
+OBJECT_DECLARE_TYPE(Flash, M25P80Class, M25P80)
 
 static inline Manufacturer get_man(Flash *s)
 {
diff --git a/hw/input/adb-kbd.c b/hw/input/adb-kbd.c
index fe0c363d64..a9088c910c 100644
--- a/hw/input/adb-kbd.c
+++ b/hw/input/adb-kbd.c
@@ -32,10 +32,7 @@
 #include "trace.h"
 #include "qom/object.h"
 
-typedef struct ADBKeyboardClass ADBKeyboardClass;
-typedef struct KBDState KBDState;
-DECLARE_OBJ_CHECKERS(KBDState, ADBKeyboardClass,
-                     ADB_KEYBOARD, TYPE_ADB_KEYBOARD)
+OBJECT_DECLARE_TYPE(KBDState, ADBKeyboardClass, ADB_KEYBOARD)
 
 struct KBDState {
     /*< private >*/
diff --git a/hw/input/adb-mouse.c b/hw/input/adb-mouse.c
index f5750909b4..e6b341f028 100644
--- a/hw/input/adb-mouse.c
+++ b/hw/input/adb-mouse.c
@@ -31,10 +31,7 @@
 #include "trace.h"
 #include "qom/object.h"
 
-typedef struct ADBMouseClass ADBMouseClass;
-typedef struct MouseState MouseState;
-DECLARE_OBJ_CHECKERS(MouseState, ADBMouseClass,
-                     ADB_MOUSE, TYPE_ADB_MOUSE)
+OBJECT_DECLARE_TYPE(MouseState, ADBMouseClass, ADB_MOUSE)
 
 struct MouseState {
     /*< public >*/
diff --git a/hw/misc/tmp421.c b/hw/misc/tmp421.c
index 212d6e0e83..ef3c682e32 100644
--- a/hw/misc/tmp421.c
+++ b/hw/misc/tmp421.c
@@ -65,17 +65,14 @@ struct TMP421State {
     uint8_t pointer;
 
 };
-typedef struct TMP421State TMP421State;
 
 struct TMP421Class {
     I2CSlaveClass parent_class;
     DeviceInfo *dev;
 };
-typedef struct TMP421Class TMP421Class;
 
 #define TYPE_TMP421 "tmp421-generic"
-DECLARE_OBJ_CHECKERS(TMP421State, TMP421Class,
-                     TMP421, TYPE_TMP421)
+OBJECT_DECLARE_TYPE(TMP421State, TMP421Class, TMP421)
 
 
 /* the TMP421 registers */
diff --git a/hw/scsi/scsi-disk.c b/hw/scsi/scsi-disk.c
index 1f0388a755..e859534eaf 100644
--- a/hw/scsi/scsi-disk.c
+++ b/hw/scsi/scsi-disk.c
@@ -55,10 +55,7 @@
 
 #define TYPE_SCSI_DISK_BASE         "scsi-disk-base"
 
-typedef struct SCSIDiskClass SCSIDiskClass;
-typedef struct SCSIDiskState SCSIDiskState;
-DECLARE_OBJ_CHECKERS(SCSIDiskState, SCSIDiskClass,
-                     SCSI_DISK_BASE, TYPE_SCSI_DISK_BASE)
+OBJECT_DECLARE_TYPE(SCSIDiskState, SCSIDiskClass, SCSI_DISK_BASE)
 
 struct SCSIDiskClass {
     SCSIDeviceClass parent_class;
diff --git a/hw/scsi/vmw_pvscsi.c b/hw/scsi/vmw_pvscsi.c
index 40095bed09..a63d25de48 100644
--- a/hw/scsi/vmw_pvscsi.c
+++ b/hw/scsi/vmw_pvscsi.c
@@ -61,12 +61,9 @@ struct PVSCSIClass {
     PCIDeviceClass parent_class;
     DeviceRealize parent_dc_realize;
 };
-typedef struct PVSCSIClass PVSCSIClass;
 
 #define TYPE_PVSCSI "pvscsi"
-typedef struct PVSCSIState PVSCSIState;
-DECLARE_OBJ_CHECKERS(PVSCSIState, PVSCSIClass,
-                     PVSCSI, TYPE_PVSCSI)
+OBJECT_DECLARE_TYPE(PVSCSIState, PVSCSIClass, PVSCSI)
 
 
 /* Compatibility flags for migration */
-- 
2.26.2


