Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 34560251FEC
	for <lists+xen-devel@lfdr.de>; Tue, 25 Aug 2020 21:25:51 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kAeZk-0005Mi-TA; Tue, 25 Aug 2020 19:25:44 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=T2Dk=CD=redhat.com=ehabkost@srs-us1.protection.inumbo.net>)
 id 1kAeZi-0005MT-TZ
 for xen-devel@lists.xenproject.org; Tue, 25 Aug 2020 19:25:42 +0000
X-Inumbo-ID: b4fc2d38-78cd-4707-89a4-adef69f8e753
Received: from us-smtp-delivery-124.mimecast.com (unknown [216.205.24.124])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id b4fc2d38-78cd-4707-89a4-adef69f8e753;
 Tue, 25 Aug 2020 19:25:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1598383540;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yRJoHxP9Dh98gMngTye04pVRH8Tqq11Vq0H1fe3MFug=;
 b=RcYg0xHZ7ESbEslsQt/bojiLX5o2lxfupI/2NrX4rOMF1BucqIpEZKU+nIQ1BWrmN4xQ3k
 7SekWXnFnakexszHP/WeEi0EtMEY6G2SmYfawoKed8Bf/9+3TJ9LcJqx1ARqqfzMPmPhmg
 iW5FWTBTQyZZsdAvwix308eRylxiKrY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-199-Dg2T2WL7N-aX8mAXt2GmNg-1; Tue, 25 Aug 2020 15:25:38 -0400
X-MC-Unique: Dg2T2WL7N-aX8mAXt2GmNg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 66F801074640;
 Tue, 25 Aug 2020 19:25:34 +0000 (UTC)
Received: from localhost (unknown [10.10.67.254])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A288710013C2;
 Tue, 25 Aug 2020 19:25:20 +0000 (UTC)
From: Eduardo Habkost <ehabkost@redhat.com>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 "Daniel P. Berrange" <berrange@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Peter Maydell <peter.maydell@linaro.org>, Andrew Jeffery <andrew@aj.id.au>,
 Joel Stanley <joel@jms.id.au>, Jan Kiszka <jan.kiszka@web.de>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Richard Henderson <rth@twiddle.net>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony Perard <anthony.perard@citrix.com>, Paul Durrant <paul@xen.org>,
 Gerd Hoffmann <kraxel@redhat.com>,
 Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Laurent Vivier <laurent@vivier.eu>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 David Gibson <david@gibson.dropbear.id.au>,
 Cornelia Huck <cohuck@redhat.com>, Thomas Huth <thuth@redhat.com>,
 David Hildenbrand <david@redhat.com>, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, Fam Zheng <fam@euphon.net>,
 Beniamino Galvani <b.galvani@gmail.com>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>,
 Michael Walle <michael@walle.cc>, Andrzej Zaborowski <balrogg@gmail.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Alex Williamson <alex.williamson@redhat.com>, qemu-arm@nongnu.org,
 xen-devel@lists.xenproject.org, qemu-ppc@nongnu.org, qemu-s390x@nongnu.org,
 qemu-block@nongnu.org
Subject: [PATCH v3 72/74] [automated] Remove redundant
 instance_size/class_size fields
Date: Tue, 25 Aug 2020 15:21:08 -0400
Message-Id: <20200825192110.3528606-73-ehabkost@redhat.com>
In-Reply-To: <20200825192110.3528606-1-ehabkost@redhat.com>
References: <20200825192110.3528606-1-ehabkost@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0.002
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

This will remove instance_size/class_size fields from TypeInfo
variables when the value is exactly the same as the one in the
parent class.

Generated by:

 $ ./scripts/codeconverter/converter.py -i \
   --pattern=RedundantTypeSizes $(git grep -l TypeInfo -- '*.[ch]')

Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
---
Changes series v2 -> v3: this is a new patch in series v3

---
Cc: "Marc-André Lureau" <marcandre.lureau@redhat.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>
Cc: "Daniel P. Berrangé" <berrange@redhat.com>
Cc: "Cédric Le Goater" <clg@kaod.org>
Cc: Peter Maydell <peter.maydell@linaro.org>
Cc: Andrew Jeffery <andrew@aj.id.au>
Cc: Joel Stanley <joel@jms.id.au>
Cc: Jan Kiszka <jan.kiszka@web.de>
Cc: Eduardo Habkost <ehabkost@redhat.com>
Cc: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Cc: Richard Henderson <rth@twiddle.net>
Cc: Stefano Stabellini <sstabellini@kernel.org>
Cc: Anthony Perard <anthony.perard@citrix.com>
Cc: Paul Durrant <paul@xen.org>
Cc: Gerd Hoffmann <kraxel@redhat.com>
Cc: Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>
Cc: "Philippe Mathieu-Daudé" <philmd@redhat.com>
Cc: Aurelien Jarno <aurelien@aurel32.net>
Cc: Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>
Cc: Laurent Vivier <laurent@vivier.eu>
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Cc: David Gibson <david@gibson.dropbear.id.au>
Cc: Cornelia Huck <cohuck@redhat.com>
Cc: Thomas Huth <thuth@redhat.com>
Cc: David Hildenbrand <david@redhat.com>
Cc: Halil Pasic <pasic@linux.ibm.com>
Cc: Christian Borntraeger <borntraeger@de.ibm.com>
Cc: Fam Zheng <fam@euphon.net>
Cc: Beniamino Galvani <b.galvani@gmail.com>
Cc: Andrew Baumann <Andrew.Baumann@microsoft.com>
Cc: Michael Walle <michael@walle.cc>
Cc: Andrzej Zaborowski <balrogg@gmail.com>
Cc: Yoshinori Sato <ysato@users.sourceforge.jp>
Cc: Alex Williamson <alex.williamson@redhat.com>
Cc: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Cc: xen-devel@lists.xenproject.org
Cc: qemu-ppc@nongnu.org
Cc: qemu-s390x@nongnu.org
Cc: qemu-block@nongnu.org

---
Cc: "Marc-André Lureau" <marcandre.lureau@redhat.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>
Cc: "Daniel P. Berrangé" <berrange@redhat.com>
Cc: "Cédric Le Goater" <clg@kaod.org>
Cc: Peter Maydell <peter.maydell@linaro.org>
Cc: Andrew Jeffery <andrew@aj.id.au>
Cc: Joel Stanley <joel@jms.id.au>
Cc: Jan Kiszka <jan.kiszka@web.de>
Cc: Eduardo Habkost <ehabkost@redhat.com>
Cc: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Cc: Richard Henderson <rth@twiddle.net>
Cc: Stefano Stabellini <sstabellini@kernel.org>
Cc: Anthony Perard <anthony.perard@citrix.com>
Cc: Paul Durrant <paul@xen.org>
Cc: Gerd Hoffmann <kraxel@redhat.com>
Cc: Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>
Cc: "Philippe Mathieu-Daudé" <philmd@redhat.com>
Cc: Aurelien Jarno <aurelien@aurel32.net>
Cc: Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>
Cc: Laurent Vivier <laurent@vivier.eu>
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Cc: David Gibson <david@gibson.dropbear.id.au>
Cc: Cornelia Huck <cohuck@redhat.com>
Cc: Halil Pasic <pasic@linux.ibm.com>
Cc: Christian Borntraeger <borntraeger@de.ibm.com>
Cc: Thomas Huth <thuth@redhat.com>
Cc: David Hildenbrand <david@redhat.com>
Cc: Fam Zheng <fam@euphon.net>
Cc: Beniamino Galvani <b.galvani@gmail.com>
Cc: Andrew Baumann <Andrew.Baumann@microsoft.com>
Cc: Michael Walle <michael@walle.cc>
Cc: Andrzej Zaborowski <balrogg@gmail.com>
Cc: Yoshinori Sato <ysato@users.sourceforge.jp>
Cc: Alex Williamson <alex.williamson@redhat.com>
Cc: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Cc: xen-devel@lists.xenproject.org
Cc: qemu-ppc@nongnu.org
Cc: qemu-s390x@nongnu.org
Cc: qemu-block@nongnu.org
---
 chardev/char-null.c            | 1 -
 crypto/tls-cipher-suites.c     | 2 --
 hw/arm/aspeed_ast2600.c        | 2 --
 hw/arm/aspeed_soc.c            | 2 --
 hw/arm/musicpal.c              | 1 -
 hw/core/sysbus.c               | 1 -
 hw/i386/kvm/apic.c             | 1 -
 hw/i386/pc_piix.c              | 1 -
 hw/i386/xen/xen_apic.c         | 1 -
 hw/input/virtio-input-hid.c    | 3 ---
 hw/intc/apic.c                 | 1 -
 hw/intc/ioapic.c               | 1 -
 hw/isa/isa-bus.c               | 1 -
 hw/mips/gt64xxx_pci.c          | 1 -
 hw/misc/aspeed_scu.c           | 3 ---
 hw/misc/ivshmem.c              | 2 --
 hw/nubus/nubus-bridge.c        | 1 -
 hw/pci-bridge/dec.c            | 2 --
 hw/pci-bridge/pci_bridge_dev.c | 1 -
 hw/pci-host/grackle.c          | 1 -
 hw/pci-host/uninorth.c         | 4 ----
 hw/pci-host/versatile.c        | 1 -
 hw/pci-host/xen_igd_pt.c       | 1 -
 hw/ppc/pnv_homer.c             | 2 --
 hw/ppc/pnv_occ.c               | 2 --
 hw/ppc/ppc4xx_pci.c            | 1 -
 hw/s390x/s390-skeys-kvm.c      | 2 --
 hw/s390x/sclpcpu.c             | 2 --
 hw/s390x/sclpquiesce.c         | 2 --
 hw/s390x/tod-kvm.c             | 2 --
 hw/s390x/tod-qemu.c            | 2 --
 hw/s390x/virtio-ccw-input.c    | 3 ---
 hw/scsi/scsi-generic.c         | 1 -
 hw/sd/allwinner-sdhost.c       | 1 -
 hw/sd/bcm2835_sdhost.c         | 1 -
 hw/sd/milkymist-memcard.c      | 1 -
 hw/sd/pl181.c                  | 1 -
 hw/sd/pxa2xx_mmci.c            | 1 -
 hw/sd/sdhci.c                  | 1 -
 hw/sh4/sh_pci.c                | 1 -
 hw/timer/pxa2xx_timer.c        | 2 --
 hw/vfio/pci.c                  | 1 -
 hw/virtio/virtio-mmio.c        | 1 -
 hw/watchdog/wdt_aspeed.c       | 3 ---
 hw/xen/xen-legacy-backend.c    | 1 -
 45 files changed, 69 deletions(-)

diff --git a/chardev/char-null.c b/chardev/char-null.c
index ce43ccdda6..2736b2ff2b 100644
--- a/chardev/char-null.c
+++ b/chardev/char-null.c
@@ -44,7 +44,6 @@ static void char_null_class_init(ObjectClass *oc, void *data)
 static const TypeInfo char_null_type_info = {
     .name = TYPE_CHARDEV_NULL,
     .parent = TYPE_CHARDEV,
-    .instance_size = sizeof(Chardev),
     .class_init = char_null_class_init,
 };
 TYPE_INFO(char_null_type_info)
diff --git a/crypto/tls-cipher-suites.c b/crypto/tls-cipher-suites.c
index e92a380a24..0c9713d301 100644
--- a/crypto/tls-cipher-suites.c
+++ b/crypto/tls-cipher-suites.c
@@ -108,8 +108,6 @@ static void qcrypto_tls_cipher_suites_class_init(ObjectClass *oc, void *data)
 static const TypeInfo qcrypto_tls_cipher_suites_info = {
     .parent = TYPE_QCRYPTO_TLS_CREDS,
     .name = TYPE_QCRYPTO_TLS_CIPHER_SUITES,
-    .instance_size = sizeof(QCryptoTLSCreds),
-    .class_size = sizeof(QCryptoTLSCredsClass),
     .class_init = qcrypto_tls_cipher_suites_class_init,
     .interfaces = (InterfaceInfo[]) {
         { TYPE_USER_CREATABLE },
diff --git a/hw/arm/aspeed_ast2600.c b/hw/arm/aspeed_ast2600.c
index 9d95e42143..365e02c89f 100644
--- a/hw/arm/aspeed_ast2600.c
+++ b/hw/arm/aspeed_ast2600.c
@@ -496,10 +496,8 @@ static void aspeed_soc_ast2600_class_init(ObjectClass *oc, void *data)
 static const TypeInfo aspeed_soc_ast2600_type_info = {
     .name           = "ast2600-a1",
     .parent         = TYPE_ASPEED_SOC,
-    .instance_size  = sizeof(AspeedSoCState),
     .instance_init  = aspeed_soc_ast2600_init,
     .class_init     = aspeed_soc_ast2600_class_init,
-    .class_size     = sizeof(AspeedSoCClass),
 };
 
 static void aspeed_soc_register_types(void)
diff --git a/hw/arm/aspeed_soc.c b/hw/arm/aspeed_soc.c
index 35be126db6..4a0743b865 100644
--- a/hw/arm/aspeed_soc.c
+++ b/hw/arm/aspeed_soc.c
@@ -442,7 +442,6 @@ static const TypeInfo aspeed_soc_ast2400_type_info = {
     .name           = "ast2400-a1",
     .parent         = TYPE_ASPEED_SOC,
     .instance_init  = aspeed_soc_init,
-    .instance_size  = sizeof(AspeedSoCState),
     .class_init     = aspeed_soc_ast2400_class_init,
 };
 
@@ -467,7 +466,6 @@ static const TypeInfo aspeed_soc_ast2500_type_info = {
     .name           = "ast2500-a1",
     .parent         = TYPE_ASPEED_SOC,
     .instance_init  = aspeed_soc_init,
-    .instance_size  = sizeof(AspeedSoCState),
     .class_init     = aspeed_soc_ast2500_class_init,
 };
 static void aspeed_soc_register_types(void)
diff --git a/hw/arm/musicpal.c b/hw/arm/musicpal.c
index 8b545e857d..7aa158b5eb 100644
--- a/hw/arm/musicpal.c
+++ b/hw/arm/musicpal.c
@@ -1739,7 +1739,6 @@ static void mv88w8618_wlan_class_init(ObjectClass *klass, void *data)
 static const TypeInfo mv88w8618_wlan_info = {
     .name          = "mv88w8618_wlan",
     .parent        = TYPE_SYS_BUS_DEVICE,
-    .instance_size = sizeof(SysBusDevice),
     .class_init    = mv88w8618_wlan_class_init,
 };
 TYPE_INFO(mv88w8618_wlan_info)
diff --git a/hw/core/sysbus.c b/hw/core/sysbus.c
index 9e89bfd8d4..706acc807c 100644
--- a/hw/core/sysbus.c
+++ b/hw/core/sysbus.c
@@ -83,7 +83,6 @@ static void system_bus_class_init(ObjectClass *klass, void *data)
 static const TypeInfo system_bus_info = {
     .name = TYPE_SYSTEM_BUS,
     .parent = TYPE_BUS,
-    .instance_size = sizeof(BusState),
     .class_init = system_bus_class_init,
 };
 TYPE_INFO(system_bus_info)
diff --git a/hw/i386/kvm/apic.c b/hw/i386/kvm/apic.c
index 06dd7f8c9a..0e20721156 100644
--- a/hw/i386/kvm/apic.c
+++ b/hw/i386/kvm/apic.c
@@ -254,7 +254,6 @@ static void kvm_apic_class_init(ObjectClass *klass, void *data)
 static const TypeInfo kvm_apic_info = {
     .name = "kvm-apic",
     .parent = TYPE_APIC_COMMON,
-    .instance_size = sizeof(APICCommonState),
     .class_init = kvm_apic_class_init,
 };
 TYPE_INFO(kvm_apic_info)
diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
index 93740d1e87..9fb06162b0 100644
--- a/hw/i386/pc_piix.c
+++ b/hw/i386/pc_piix.c
@@ -911,7 +911,6 @@ static void isa_bridge_class_init(ObjectClass *klass, void *data)
 static TypeInfo isa_bridge_info = {
     .name          = "igd-passthrough-isa-bridge",
     .parent        = TYPE_PCI_DEVICE,
-    .instance_size = sizeof(PCIDevice),
     .class_init = isa_bridge_class_init,
     .interfaces = (InterfaceInfo[]) {
         { INTERFACE_CONVENTIONAL_PCI_DEVICE },
diff --git a/hw/i386/xen/xen_apic.c b/hw/i386/xen/xen_apic.c
index 9578463a48..cd5db3a01a 100644
--- a/hw/i386/xen/xen_apic.c
+++ b/hw/i386/xen/xen_apic.c
@@ -91,7 +91,6 @@ static void xen_apic_class_init(ObjectClass *klass, void *data)
 static const TypeInfo xen_apic_info = {
     .name = "xen-apic",
     .parent = TYPE_APIC_COMMON,
-    .instance_size = sizeof(APICCommonState),
     .class_init = xen_apic_class_init,
 };
 TYPE_INFO(xen_apic_info)
diff --git a/hw/input/virtio-input-hid.c b/hw/input/virtio-input-hid.c
index 70e27e2c64..23d5eb9abb 100644
--- a/hw/input/virtio-input-hid.c
+++ b/hw/input/virtio-input-hid.c
@@ -289,7 +289,6 @@ static void virtio_keyboard_init(Object *obj)
 static const TypeInfo virtio_keyboard_info = {
     .name          = TYPE_VIRTIO_KEYBOARD,
     .parent        = TYPE_VIRTIO_INPUT_HID,
-    .instance_size = sizeof(VirtIOInputHID),
     .instance_init = virtio_keyboard_init,
 };
 TYPE_INFO(virtio_keyboard_info)
@@ -382,7 +381,6 @@ static void virtio_mouse_init(Object *obj)
 static const TypeInfo virtio_mouse_info = {
     .name          = TYPE_VIRTIO_MOUSE,
     .parent        = TYPE_VIRTIO_INPUT_HID,
-    .instance_size = sizeof(VirtIOInputHID),
     .instance_init = virtio_mouse_init,
     .class_init    = virtio_mouse_class_init,
 };
@@ -507,7 +505,6 @@ static void virtio_tablet_init(Object *obj)
 static const TypeInfo virtio_tablet_info = {
     .name          = TYPE_VIRTIO_TABLET,
     .parent        = TYPE_VIRTIO_INPUT_HID,
-    .instance_size = sizeof(VirtIOInputHID),
     .instance_init = virtio_tablet_init,
     .class_init    = virtio_tablet_class_init,
 };
diff --git a/hw/intc/apic.c b/hw/intc/apic.c
index dadbfd9a75..5afc2e7164 100644
--- a/hw/intc/apic.c
+++ b/hw/intc/apic.c
@@ -911,7 +911,6 @@ static void apic_class_init(ObjectClass *klass, void *data)
 
 static const TypeInfo apic_info = {
     .name          = TYPE_APIC,
-    .instance_size = sizeof(APICCommonState),
     .parent        = TYPE_APIC_COMMON,
     .class_init    = apic_class_init,
 };
diff --git a/hw/intc/ioapic.c b/hw/intc/ioapic.c
index 4e865aac74..694c305c1b 100644
--- a/hw/intc/ioapic.c
+++ b/hw/intc/ioapic.c
@@ -502,7 +502,6 @@ static void ioapic_class_init(ObjectClass *klass, void *data)
 static const TypeInfo ioapic_info = {
     .name          = TYPE_IOAPIC,
     .parent        = TYPE_IOAPIC_COMMON,
-    .instance_size = sizeof(IOAPICCommonState),
     .class_init    = ioapic_class_init,
 };
 TYPE_INFO(ioapic_info)
diff --git a/hw/isa/isa-bus.c b/hw/isa/isa-bus.c
index 6a52f350a5..0bfd49ddd8 100644
--- a/hw/isa/isa-bus.c
+++ b/hw/isa/isa-bus.c
@@ -247,7 +247,6 @@ static void isabus_bridge_class_init(ObjectClass *klass, void *data)
 static const TypeInfo isabus_bridge_info = {
     .name          = "isabus-bridge",
     .parent        = TYPE_SYS_BUS_DEVICE,
-    .instance_size = sizeof(SysBusDevice),
     .class_init    = isabus_bridge_class_init,
 };
 TYPE_INFO(isabus_bridge_info)
diff --git a/hw/mips/gt64xxx_pci.c b/hw/mips/gt64xxx_pci.c
index 676fc6dec8..733b84887c 100644
--- a/hw/mips/gt64xxx_pci.c
+++ b/hw/mips/gt64xxx_pci.c
@@ -1259,7 +1259,6 @@ static void gt64120_pci_class_init(ObjectClass *klass, void *data)
 static const TypeInfo gt64120_pci_info = {
     .name          = "gt64120_pci",
     .parent        = TYPE_PCI_DEVICE,
-    .instance_size = sizeof(PCIDevice),
     .class_init    = gt64120_pci_class_init,
     .interfaces = (InterfaceInfo[]) {
         { INTERFACE_CONVENTIONAL_PCI_DEVICE },
diff --git a/hw/misc/aspeed_scu.c b/hw/misc/aspeed_scu.c
index 4dfc480e46..360432ff0a 100644
--- a/hw/misc/aspeed_scu.c
+++ b/hw/misc/aspeed_scu.c
@@ -519,7 +519,6 @@ static void aspeed_2400_scu_class_init(ObjectClass *klass, void *data)
 static const TypeInfo aspeed_2400_scu_info = {
     .name = TYPE_ASPEED_2400_SCU,
     .parent = TYPE_ASPEED_SCU,
-    .instance_size = sizeof(AspeedSCUState),
     .class_init = aspeed_2400_scu_class_init,
 };
 TYPE_INFO(aspeed_2400_scu_info)
@@ -540,7 +539,6 @@ static void aspeed_2500_scu_class_init(ObjectClass *klass, void *data)
 static const TypeInfo aspeed_2500_scu_info = {
     .name = TYPE_ASPEED_2500_SCU,
     .parent = TYPE_ASPEED_SCU,
-    .instance_size = sizeof(AspeedSCUState),
     .class_init = aspeed_2500_scu_class_init,
 };
 TYPE_INFO(aspeed_2500_scu_info)
@@ -696,7 +694,6 @@ static void aspeed_2600_scu_class_init(ObjectClass *klass, void *data)
 static const TypeInfo aspeed_2600_scu_info = {
     .name = TYPE_ASPEED_2600_SCU,
     .parent = TYPE_ASPEED_SCU,
-    .instance_size = sizeof(AspeedSCUState),
     .class_init = aspeed_2600_scu_class_init,
 };
 TYPE_INFO(aspeed_2600_scu_info)
diff --git a/hw/misc/ivshmem.c b/hw/misc/ivshmem.c
index 89db397061..62e305aba7 100644
--- a/hw/misc/ivshmem.c
+++ b/hw/misc/ivshmem.c
@@ -1061,7 +1061,6 @@ static void ivshmem_plain_class_init(ObjectClass *klass, void *data)
 static const TypeInfo ivshmem_plain_info = {
     .name          = TYPE_IVSHMEM_PLAIN,
     .parent        = TYPE_IVSHMEM_COMMON,
-    .instance_size = sizeof(IVShmemState),
     .class_init    = ivshmem_plain_class_init,
 };
 TYPE_INFO(ivshmem_plain_info)
@@ -1122,7 +1121,6 @@ static void ivshmem_doorbell_class_init(ObjectClass *klass, void *data)
 static const TypeInfo ivshmem_doorbell_info = {
     .name          = TYPE_IVSHMEM_DOORBELL,
     .parent        = TYPE_IVSHMEM_COMMON,
-    .instance_size = sizeof(IVShmemState),
     .instance_init = ivshmem_doorbell_init,
     .class_init    = ivshmem_doorbell_class_init,
 };
diff --git a/hw/nubus/nubus-bridge.c b/hw/nubus/nubus-bridge.c
index 678da60ddd..4231cbbfbe 100644
--- a/hw/nubus/nubus-bridge.c
+++ b/hw/nubus/nubus-bridge.c
@@ -22,7 +22,6 @@ static void nubus_bridge_class_init(ObjectClass *klass, void *data)
 static const TypeInfo nubus_bridge_info = {
     .name          = TYPE_NUBUS_BRIDGE,
     .parent        = TYPE_SYS_BUS_DEVICE,
-    .instance_size = sizeof(SysBusDevice),
     .class_init    = nubus_bridge_class_init,
 };
 TYPE_INFO(nubus_bridge_info)
diff --git a/hw/pci-bridge/dec.c b/hw/pci-bridge/dec.c
index d6db5bf9dc..2bd6ba5a2b 100644
--- a/hw/pci-bridge/dec.c
+++ b/hw/pci-bridge/dec.c
@@ -72,7 +72,6 @@ static void dec_21154_pci_bridge_class_init(ObjectClass *klass, void *data)
 static const TypeInfo dec_21154_pci_bridge_info = {
     .name          = "dec-21154-p2p-bridge",
     .parent        = TYPE_PCI_BRIDGE,
-    .instance_size = sizeof(PCIBridge),
     .class_init    = dec_21154_pci_bridge_class_init,
     .interfaces = (InterfaceInfo[]) {
         { INTERFACE_CONVENTIONAL_PCI_DEVICE },
@@ -135,7 +134,6 @@ static void dec_21154_pci_host_class_init(ObjectClass *klass, void *data)
 static const TypeInfo dec_21154_pci_host_info = {
     .name          = "dec-21154",
     .parent        = TYPE_PCI_DEVICE,
-    .instance_size = sizeof(PCIDevice),
     .class_init    = dec_21154_pci_host_class_init,
     .interfaces = (InterfaceInfo[]) {
         { INTERFACE_CONVENTIONAL_PCI_DEVICE },
diff --git a/hw/pci-bridge/pci_bridge_dev.c b/hw/pci-bridge/pci_bridge_dev.c
index 279c1e0b6d..3ae08a1abc 100644
--- a/hw/pci-bridge/pci_bridge_dev.c
+++ b/hw/pci-bridge/pci_bridge_dev.c
@@ -298,7 +298,6 @@ static void pci_bridge_dev_seat_class_init(ObjectClass *klass, void *data)
 static const TypeInfo pci_bridge_dev_seat_info = {
     .name              = TYPE_PCI_BRIDGE_SEAT_DEV,
     .parent            = TYPE_PCI_BRIDGE_DEV,
-    .instance_size     = sizeof(PCIBridgeDev),
     .class_init        = pci_bridge_dev_seat_class_init,
 };
 TYPE_INFO(pci_bridge_dev_seat_info)
diff --git a/hw/pci-host/grackle.c b/hw/pci-host/grackle.c
index 8fd4913921..0a5959ddb4 100644
--- a/hw/pci-host/grackle.c
+++ b/hw/pci-host/grackle.c
@@ -144,7 +144,6 @@ static void grackle_pci_class_init(ObjectClass *klass, void *data)
 static const TypeInfo grackle_pci_info = {
     .name          = "grackle",
     .parent        = TYPE_PCI_DEVICE,
-    .instance_size = sizeof(PCIDevice),
     .class_init = grackle_pci_class_init,
     .interfaces = (InterfaceInfo[]) {
         { INTERFACE_CONVENTIONAL_PCI_DEVICE },
diff --git a/hw/pci-host/uninorth.c b/hw/pci-host/uninorth.c
index b1aa37101b..57b76bb31c 100644
--- a/hw/pci-host/uninorth.c
+++ b/hw/pci-host/uninorth.c
@@ -373,7 +373,6 @@ static void unin_main_pci_host_class_init(ObjectClass *klass, void *data)
 static const TypeInfo unin_main_pci_host_info = {
     .name = "uni-north-pci",
     .parent = TYPE_PCI_DEVICE,
-    .instance_size = sizeof(PCIDevice),
     .class_init = unin_main_pci_host_class_init,
     .interfaces = (InterfaceInfo[]) {
         { INTERFACE_CONVENTIONAL_PCI_DEVICE },
@@ -402,7 +401,6 @@ static void u3_agp_pci_host_class_init(ObjectClass *klass, void *data)
 static const TypeInfo u3_agp_pci_host_info = {
     .name = "u3-agp",
     .parent = TYPE_PCI_DEVICE,
-    .instance_size = sizeof(PCIDevice),
     .class_init = u3_agp_pci_host_class_init,
     .interfaces = (InterfaceInfo[]) {
         { INTERFACE_CONVENTIONAL_PCI_DEVICE },
@@ -431,7 +429,6 @@ static void unin_agp_pci_host_class_init(ObjectClass *klass, void *data)
 static const TypeInfo unin_agp_pci_host_info = {
     .name = "uni-north-agp",
     .parent = TYPE_PCI_DEVICE,
-    .instance_size = sizeof(PCIDevice),
     .class_init = unin_agp_pci_host_class_init,
     .interfaces = (InterfaceInfo[]) {
         { INTERFACE_CONVENTIONAL_PCI_DEVICE },
@@ -460,7 +457,6 @@ static void unin_internal_pci_host_class_init(ObjectClass *klass, void *data)
 static const TypeInfo unin_internal_pci_host_info = {
     .name = "uni-north-internal-pci",
     .parent = TYPE_PCI_DEVICE,
-    .instance_size = sizeof(PCIDevice),
     .class_init = unin_internal_pci_host_class_init,
     .interfaces = (InterfaceInfo[]) {
         { INTERFACE_CONVENTIONAL_PCI_DEVICE },
diff --git a/hw/pci-host/versatile.c b/hw/pci-host/versatile.c
index 5eeff10164..e6986790d3 100644
--- a/hw/pci-host/versatile.c
+++ b/hw/pci-host/versatile.c
@@ -489,7 +489,6 @@ static void versatile_pci_host_class_init(ObjectClass *klass, void *data)
 static const TypeInfo versatile_pci_host_info = {
     .name          = TYPE_VERSATILE_PCI_HOST,
     .parent        = TYPE_PCI_DEVICE,
-    .instance_size = sizeof(PCIDevice),
     .class_init    = versatile_pci_host_class_init,
     .interfaces = (InterfaceInfo[]) {
         { INTERFACE_CONVENTIONAL_PCI_DEVICE },
diff --git a/hw/pci-host/xen_igd_pt.c b/hw/pci-host/xen_igd_pt.c
index 27e2e475c6..a09d62f0ab 100644
--- a/hw/pci-host/xen_igd_pt.c
+++ b/hw/pci-host/xen_igd_pt.c
@@ -107,7 +107,6 @@ static void igd_passthrough_i440fx_class_init(ObjectClass *klass, void *data)
 static const TypeInfo igd_passthrough_i440fx_info = {
     .name          = TYPE_IGD_PASSTHROUGH_I440FX_PCI_DEVICE,
     .parent        = TYPE_I440FX_PCI_DEVICE,
-    .instance_size = sizeof(PCII440FXState),
     .class_init    = igd_passthrough_i440fx_class_init,
 };
 TYPE_INFO(igd_passthrough_i440fx_info)
diff --git a/hw/ppc/pnv_homer.c b/hw/ppc/pnv_homer.c
index 08d2d36722..02f17f01fe 100644
--- a/hw/ppc/pnv_homer.c
+++ b/hw/ppc/pnv_homer.c
@@ -185,7 +185,6 @@ static void pnv_homer_power8_class_init(ObjectClass *klass, void *data)
 static const TypeInfo pnv_homer_power8_type_info = {
     .name          = TYPE_PNV8_HOMER,
     .parent        = TYPE_PNV_HOMER,
-    .instance_size = sizeof(PnvHomer),
     .class_init    = pnv_homer_power8_class_init,
 };
 TYPE_INFO(pnv_homer_power8_type_info)
@@ -329,7 +328,6 @@ static void pnv_homer_power9_class_init(ObjectClass *klass, void *data)
 static const TypeInfo pnv_homer_power9_type_info = {
     .name          = TYPE_PNV9_HOMER,
     .parent        = TYPE_PNV_HOMER,
-    .instance_size = sizeof(PnvHomer),
     .class_init    = pnv_homer_power9_class_init,
 };
 TYPE_INFO(pnv_homer_power9_type_info)
diff --git a/hw/ppc/pnv_occ.c b/hw/ppc/pnv_occ.c
index 9fde6cde7d..5693d7c889 100644
--- a/hw/ppc/pnv_occ.c
+++ b/hw/ppc/pnv_occ.c
@@ -174,7 +174,6 @@ static void pnv_occ_power8_class_init(ObjectClass *klass, void *data)
 static const TypeInfo pnv_occ_power8_type_info = {
     .name          = TYPE_PNV8_OCC,
     .parent        = TYPE_PNV_OCC,
-    .instance_size = sizeof(PnvOCC),
     .class_init    = pnv_occ_power8_class_init,
 };
 TYPE_INFO(pnv_occ_power8_type_info)
@@ -246,7 +245,6 @@ static void pnv_occ_power9_class_init(ObjectClass *klass, void *data)
 static const TypeInfo pnv_occ_power9_type_info = {
     .name          = TYPE_PNV9_OCC,
     .parent        = TYPE_PNV_OCC,
-    .instance_size = sizeof(PnvOCC),
     .class_init    = pnv_occ_power9_class_init,
 };
 TYPE_INFO(pnv_occ_power9_type_info)
diff --git a/hw/ppc/ppc4xx_pci.c b/hw/ppc/ppc4xx_pci.c
index e6888fff9d..5cc11def7d 100644
--- a/hw/ppc/ppc4xx_pci.c
+++ b/hw/ppc/ppc4xx_pci.c
@@ -360,7 +360,6 @@ static void ppc4xx_host_bridge_class_init(ObjectClass *klass, void *data)
 static const TypeInfo ppc4xx_host_bridge_info = {
     .name          = "ppc4xx-host-bridge",
     .parent        = TYPE_PCI_DEVICE,
-    .instance_size = sizeof(PCIDevice),
     .class_init    = ppc4xx_host_bridge_class_init,
     .interfaces = (InterfaceInfo[]) {
         { INTERFACE_CONVENTIONAL_PCI_DEVICE },
diff --git a/hw/s390x/s390-skeys-kvm.c b/hw/s390x/s390-skeys-kvm.c
index eed05d265e..1f741bebfa 100644
--- a/hw/s390x/s390-skeys-kvm.c
+++ b/hw/s390x/s390-skeys-kvm.c
@@ -68,9 +68,7 @@ static void kvm_s390_skeys_class_init(ObjectClass *oc, void *data)
 static const TypeInfo kvm_s390_skeys_info = {
     .name          = TYPE_KVM_S390_SKEYS,
     .parent        = TYPE_S390_SKEYS,
-    .instance_size = sizeof(S390SKeysState),
     .class_init    = kvm_s390_skeys_class_init,
-    .class_size    = sizeof(S390SKeysClass),
 };
 TYPE_INFO(kvm_s390_skeys_info)
 
diff --git a/hw/s390x/sclpcpu.c b/hw/s390x/sclpcpu.c
index dd38d7ea4f..d5c16bc38d 100644
--- a/hw/s390x/sclpcpu.c
+++ b/hw/s390x/sclpcpu.c
@@ -94,9 +94,7 @@ static void cpu_class_init(ObjectClass *oc, void *data)
 static const TypeInfo sclp_cpu_info = {
     .name          = TYPE_SCLP_CPU_HOTPLUG,
     .parent        = TYPE_SCLP_EVENT,
-    .instance_size = sizeof(SCLPEvent),
     .class_init    = cpu_class_init,
-    .class_size    = sizeof(SCLPEventClass),
 };
 TYPE_INFO(sclp_cpu_info)
 
diff --git a/hw/s390x/sclpquiesce.c b/hw/s390x/sclpquiesce.c
index 5ec767f5bc..e6cf7914e1 100644
--- a/hw/s390x/sclpquiesce.c
+++ b/hw/s390x/sclpquiesce.c
@@ -137,9 +137,7 @@ static void quiesce_class_init(ObjectClass *klass, void *data)
 static const TypeInfo sclp_quiesce_info = {
     .name          = TYPE_SCLP_QUIESCE,
     .parent        = TYPE_SCLP_EVENT,
-    .instance_size = sizeof(SCLPEvent),
     .class_init    = quiesce_class_init,
-    .class_size    = sizeof(SCLPEventClass),
 };
 TYPE_INFO(sclp_quiesce_info)
 
diff --git a/hw/s390x/tod-kvm.c b/hw/s390x/tod-kvm.c
index ce17950f2f..0d5c73aa55 100644
--- a/hw/s390x/tod-kvm.c
+++ b/hw/s390x/tod-kvm.c
@@ -150,10 +150,8 @@ static void kvm_s390_tod_init(Object *obj)
 static TypeInfo kvm_s390_tod_info = {
     .name = TYPE_KVM_S390_TOD,
     .parent = TYPE_S390_TOD,
-    .instance_size = sizeof(S390TODState),
     .instance_init = kvm_s390_tod_init,
     .class_init = kvm_s390_tod_class_init,
-    .class_size = sizeof(S390TODClass),
 };
 TYPE_INFO(kvm_s390_tod_info)
 
diff --git a/hw/s390x/tod-qemu.c b/hw/s390x/tod-qemu.c
index bdc900be3c..0de92906d2 100644
--- a/hw/s390x/tod-qemu.c
+++ b/hw/s390x/tod-qemu.c
@@ -76,10 +76,8 @@ static void qemu_s390_tod_init(Object *obj)
 static TypeInfo qemu_s390_tod_info = {
     .name = TYPE_QEMU_S390_TOD,
     .parent = TYPE_S390_TOD,
-    .instance_size = sizeof(S390TODState),
     .instance_init = qemu_s390_tod_init,
     .class_init = qemu_s390_tod_class_init,
-    .class_size = sizeof(S390TODClass),
 };
 TYPE_INFO(qemu_s390_tod_info)
 
diff --git a/hw/s390x/virtio-ccw-input.c b/hw/s390x/virtio-ccw-input.c
index 42528ebd8a..527da84164 100644
--- a/hw/s390x/virtio-ccw-input.c
+++ b/hw/s390x/virtio-ccw-input.c
@@ -91,7 +91,6 @@ TYPE_INFO(virtio_ccw_input_hid)
 static const TypeInfo virtio_ccw_keyboard = {
     .name          = TYPE_VIRTIO_KEYBOARD_CCW,
     .parent        = TYPE_VIRTIO_INPUT_HID_CCW,
-    .instance_size = sizeof(VirtIOInputHIDCcw),
     .instance_init = virtio_ccw_keyboard_instance_init,
 };
 TYPE_INFO(virtio_ccw_keyboard)
@@ -99,7 +98,6 @@ TYPE_INFO(virtio_ccw_keyboard)
 static const TypeInfo virtio_ccw_mouse = {
     .name          = TYPE_VIRTIO_MOUSE_CCW,
     .parent        = TYPE_VIRTIO_INPUT_HID_CCW,
-    .instance_size = sizeof(VirtIOInputHIDCcw),
     .instance_init = virtio_ccw_mouse_instance_init,
 };
 TYPE_INFO(virtio_ccw_mouse)
@@ -107,7 +105,6 @@ TYPE_INFO(virtio_ccw_mouse)
 static const TypeInfo virtio_ccw_tablet = {
     .name          = TYPE_VIRTIO_TABLET_CCW,
     .parent        = TYPE_VIRTIO_INPUT_HID_CCW,
-    .instance_size = sizeof(VirtIOInputHIDCcw),
     .instance_init = virtio_ccw_tablet_instance_init,
 };
 TYPE_INFO(virtio_ccw_tablet)
diff --git a/hw/scsi/scsi-generic.c b/hw/scsi/scsi-generic.c
index dc7ca649de..b5cffe00f6 100644
--- a/hw/scsi/scsi-generic.c
+++ b/hw/scsi/scsi-generic.c
@@ -775,7 +775,6 @@ static void scsi_generic_class_initfn(ObjectClass *klass, void *data)
 static const TypeInfo scsi_generic_info = {
     .name          = "scsi-generic",
     .parent        = TYPE_SCSI_DEVICE,
-    .instance_size = sizeof(SCSIDevice),
     .class_init    = scsi_generic_class_initfn,
 };
 TYPE_INFO(scsi_generic_info)
diff --git a/hw/sd/allwinner-sdhost.c b/hw/sd/allwinner-sdhost.c
index 795e7e89eb..ee2952ac8e 100644
--- a/hw/sd/allwinner-sdhost.c
+++ b/hw/sd/allwinner-sdhost.c
@@ -836,7 +836,6 @@ TYPE_INFO(allwinner_sdhost_sun5i_info)
 static const TypeInfo allwinner_sdhost_bus_info = {
     .name = TYPE_AW_SDHOST_BUS,
     .parent = TYPE_SD_BUS,
-    .instance_size = sizeof(SDBus),
     .class_init = allwinner_sdhost_bus_class_init,
 };
 TYPE_INFO(allwinner_sdhost_bus_info)
diff --git a/hw/sd/bcm2835_sdhost.c b/hw/sd/bcm2835_sdhost.c
index 1e9f6ddfa0..09ac2b1593 100644
--- a/hw/sd/bcm2835_sdhost.c
+++ b/hw/sd/bcm2835_sdhost.c
@@ -448,7 +448,6 @@ TYPE_INFO(bcm2835_sdhost_info)
 static const TypeInfo bcm2835_sdhost_bus_info = {
     .name = TYPE_BCM2835_SDHOST_BUS,
     .parent = TYPE_SD_BUS,
-    .instance_size = sizeof(SDBus),
 };
 TYPE_INFO(bcm2835_sdhost_bus_info)
 
diff --git a/hw/sd/milkymist-memcard.c b/hw/sd/milkymist-memcard.c
index 5567e1a01a..f56981f59a 100644
--- a/hw/sd/milkymist-memcard.c
+++ b/hw/sd/milkymist-memcard.c
@@ -325,7 +325,6 @@ static void milkymist_sdbus_class_init(ObjectClass *klass, void *data)
 static const TypeInfo milkymist_sdbus_info = {
     .name = TYPE_MILKYMIST_SDBUS,
     .parent = TYPE_SD_BUS,
-    .instance_size = sizeof(SDBus),
     .class_init = milkymist_sdbus_class_init,
 };
 TYPE_INFO(milkymist_sdbus_info)
diff --git a/hw/sd/pl181.c b/hw/sd/pl181.c
index f58b947e89..7920e5a7a1 100644
--- a/hw/sd/pl181.c
+++ b/hw/sd/pl181.c
@@ -542,7 +542,6 @@ static void pl181_bus_class_init(ObjectClass *klass, void *data)
 static const TypeInfo pl181_bus_info = {
     .name = TYPE_PL181_BUS,
     .parent = TYPE_SD_BUS,
-    .instance_size = sizeof(SDBus),
     .class_init = pl181_bus_class_init,
 };
 TYPE_INFO(pl181_bus_info)
diff --git a/hw/sd/pxa2xx_mmci.c b/hw/sd/pxa2xx_mmci.c
index 0a9d8a72d7..f0a8c89e5d 100644
--- a/hw/sd/pxa2xx_mmci.c
+++ b/hw/sd/pxa2xx_mmci.c
@@ -592,7 +592,6 @@ TYPE_INFO(pxa2xx_mmci_info)
 static const TypeInfo pxa2xx_mmci_bus_info = {
     .name = TYPE_PXA2XX_MMCI_BUS,
     .parent = TYPE_SD_BUS,
-    .instance_size = sizeof(SDBus),
     .class_init = pxa2xx_mmci_bus_class_init,
 };
 TYPE_INFO(pxa2xx_mmci_bus_info)
diff --git a/hw/sd/sdhci.c b/hw/sd/sdhci.c
index 118e7533df..9fbe6f7bba 100644
--- a/hw/sd/sdhci.c
+++ b/hw/sd/sdhci.c
@@ -1502,7 +1502,6 @@ static void sdhci_bus_class_init(ObjectClass *klass, void *data)
 static const TypeInfo sdhci_bus_info = {
     .name = TYPE_SDHCI_BUS,
     .parent = TYPE_SD_BUS,
-    .instance_size = sizeof(SDBus),
     .class_init = sdhci_bus_class_init,
 };
 TYPE_INFO(sdhci_bus_info)
diff --git a/hw/sh4/sh_pci.c b/hw/sh4/sh_pci.c
index 09e0e6d0dd..67d2267549 100644
--- a/hw/sh4/sh_pci.c
+++ b/hw/sh4/sh_pci.c
@@ -175,7 +175,6 @@ static void sh_pci_host_class_init(ObjectClass *klass, void *data)
 static const TypeInfo sh_pci_host_info = {
     .name          = "sh_pci_host",
     .parent        = TYPE_PCI_DEVICE,
-    .instance_size = sizeof(PCIDevice),
     .class_init    = sh_pci_host_class_init,
     .interfaces = (InterfaceInfo[]) {
         { INTERFACE_CONVENTIONAL_PCI_DEVICE },
diff --git a/hw/timer/pxa2xx_timer.c b/hw/timer/pxa2xx_timer.c
index 2d783de4dd..da4d4a443f 100644
--- a/hw/timer/pxa2xx_timer.c
+++ b/hw/timer/pxa2xx_timer.c
@@ -570,7 +570,6 @@ static void pxa25x_timer_dev_class_init(ObjectClass *klass, void *data)
 static const TypeInfo pxa25x_timer_dev_info = {
     .name          = "pxa25x-timer",
     .parent        = TYPE_PXA2XX_TIMER,
-    .instance_size = sizeof(PXA2xxTimerInfo),
     .class_init    = pxa25x_timer_dev_class_init,
 };
 TYPE_INFO(pxa25x_timer_dev_info)
@@ -593,7 +592,6 @@ static void pxa27x_timer_dev_class_init(ObjectClass *klass, void *data)
 static const TypeInfo pxa27x_timer_dev_info = {
     .name          = "pxa27x-timer",
     .parent        = TYPE_PXA2XX_TIMER,
-    .instance_size = sizeof(PXA2xxTimerInfo),
     .class_init    = pxa27x_timer_dev_class_init,
 };
 TYPE_INFO(pxa27x_timer_dev_info)
diff --git a/hw/vfio/pci.c b/hw/vfio/pci.c
index a96821c86d..7d7585af34 100644
--- a/hw/vfio/pci.c
+++ b/hw/vfio/pci.c
@@ -3225,7 +3225,6 @@ static void vfio_pci_nohotplug_dev_class_init(ObjectClass *klass, void *data)
 static const TypeInfo vfio_pci_nohotplug_dev_info = {
     .name = TYPE_VFIO_PCI_NOHOTPLUG,
     .parent = TYPE_VFIO_PCI,
-    .instance_size = sizeof(VFIOPCIDevice),
     .class_init = vfio_pci_nohotplug_dev_class_init,
 };
 TYPE_INFO(vfio_pci_nohotplug_dev_info)
diff --git a/hw/virtio/virtio-mmio.c b/hw/virtio/virtio-mmio.c
index fddb3d8d15..fa2a81dccb 100644
--- a/hw/virtio/virtio-mmio.c
+++ b/hw/virtio/virtio-mmio.c
@@ -788,7 +788,6 @@ static void virtio_mmio_bus_class_init(ObjectClass *klass, void *data)
 static const TypeInfo virtio_mmio_bus_info = {
     .name          = TYPE_VIRTIO_MMIO_BUS,
     .parent        = TYPE_VIRTIO_BUS,
-    .instance_size = sizeof(VirtioBusState),
     .class_init    = virtio_mmio_bus_class_init,
 };
 TYPE_INFO(virtio_mmio_bus_info)
diff --git a/hw/watchdog/wdt_aspeed.c b/hw/watchdog/wdt_aspeed.c
index b8a5cb8a55..5bb08e0780 100644
--- a/hw/watchdog/wdt_aspeed.c
+++ b/hw/watchdog/wdt_aspeed.c
@@ -299,7 +299,6 @@ static void aspeed_2400_wdt_class_init(ObjectClass *klass, void *data)
 static const TypeInfo aspeed_2400_wdt_info = {
     .name = TYPE_ASPEED_2400_WDT,
     .parent = TYPE_ASPEED_WDT,
-    .instance_size = sizeof(AspeedWDTState),
     .class_init = aspeed_2400_wdt_class_init,
 };
 TYPE_INFO(aspeed_2400_wdt_info)
@@ -335,7 +334,6 @@ static void aspeed_2500_wdt_class_init(ObjectClass *klass, void *data)
 static const TypeInfo aspeed_2500_wdt_info = {
     .name = TYPE_ASPEED_2500_WDT,
     .parent = TYPE_ASPEED_WDT,
-    .instance_size = sizeof(AspeedWDTState),
     .class_init = aspeed_2500_wdt_class_init,
 };
 TYPE_INFO(aspeed_2500_wdt_info)
@@ -356,7 +354,6 @@ static void aspeed_2600_wdt_class_init(ObjectClass *klass, void *data)
 static const TypeInfo aspeed_2600_wdt_info = {
     .name = TYPE_ASPEED_2600_WDT,
     .parent = TYPE_ASPEED_WDT,
-    .instance_size = sizeof(AspeedWDTState),
     .class_init = aspeed_2600_wdt_class_init,
 };
 TYPE_INFO(aspeed_2600_wdt_info)
diff --git a/hw/xen/xen-legacy-backend.c b/hw/xen/xen-legacy-backend.c
index 2fdac398e1..d387a67d6d 100644
--- a/hw/xen/xen-legacy-backend.c
+++ b/hw/xen/xen-legacy-backend.c
@@ -831,7 +831,6 @@ static void xen_sysdev_class_init(ObjectClass *klass, void *data)
 static const TypeInfo xensysdev_info = {
     .name          = TYPE_XENSYSDEV,
     .parent        = TYPE_SYS_BUS_DEVICE,
-    .instance_size = sizeof(SysBusDevice),
     .class_init    = xen_sysdev_class_init,
 };
 TYPE_INFO(xensysdev_info)
-- 
2.26.2


