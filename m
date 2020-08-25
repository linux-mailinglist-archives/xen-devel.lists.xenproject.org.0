Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 015EC251FEB
	for <lists+xen-devel@lfdr.de>; Tue, 25 Aug 2020 21:25:36 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kAeZP-0005Js-EE; Tue, 25 Aug 2020 19:25:23 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=T2Dk=CD=redhat.com=ehabkost@srs-us1.protection.inumbo.net>)
 id 1kAeZN-0005Jm-MV
 for xen-devel@lists.xenproject.org; Tue, 25 Aug 2020 19:25:21 +0000
X-Inumbo-ID: 72248007-2cab-411d-9064-aa55ecb0362b
Received: from us-smtp-1.mimecast.com (unknown [207.211.31.81])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 72248007-2cab-411d-9064-aa55ecb0362b;
 Tue, 25 Aug 2020 19:25:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1598383518;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=F+lCnQQ1oZuxcKJGfbjuVxzwu5H9An84Sy/g0QGes+s=;
 b=Qf19/OFbyVTIBQwlXJt+KA9GNfv8rvzHL0xa218pnqQjycIw1l/oAk0ovI406/NcbJVJOj
 wchT0LLIo9vBboReAyuuYBRex00QSN9rsbLhEvcEssNLBv0BUzMAoQGLC/0q3WOvzgI7xL
 i2Ds6naWLviBfTSj9/GIawQ/EzKGHdg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-195-Jxh5sxEXOoiaev8EUmRtVQ-1; Tue, 25 Aug 2020 15:25:14 -0400
X-MC-Unique: Jxh5sxEXOoiaev8EUmRtVQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 257B210066FB;
 Tue, 25 Aug 2020 19:25:09 +0000 (UTC)
Received: from localhost (unknown [10.10.67.254])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 41C6574E0B;
 Tue, 25 Aug 2020 19:25:00 +0000 (UTC)
From: Eduardo Habkost <ehabkost@redhat.com>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 "Daniel P. Berrange" <berrange@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Corey Minyard <cminyard@mvista.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 David Gibson <david@gibson.dropbear.id.au>,
 Cornelia Huck <cohuck@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Alistair Francis <alistair@alistair23.me>,
 David Hildenbrand <david@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Amit Shah <amit@kernel.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Anthony Perard <anthony.perard@citrix.com>, Paul Durrant <paul@xen.org>,
 Fam Zheng <fam@euphon.net>, "Gonglei (Arei)" <arei.gonglei@huawei.com>,
 Igor Mammedov <imammedo@redhat.com>, Stefan Berger <stefanb@linux.ibm.com>,
 Richard Henderson <rth@twiddle.net>, Michael Rolnik <mrolnik@gmail.com>,
 Sarah Harris <S.E.Harris@kent.ac.uk>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Michael Walle <michael@walle.cc>,
 Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Anthony Green <green@moxielogic.com>, Chris Wulff <crwulff@gmail.com>,
 Marek Vasut <marex@denx.de>, Stafford Horne <shorne@gmail.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Artyom Tarasenko <atar4qemu@gmail.com>, Guan Xuetao <gxt@mprc.pku.edu.cn>,
 Max Filippov <jcmvbkbc@gmail.com>, qemu-arm@nongnu.org,
 qemu-ppc@nongnu.org, qemu-s390x@nongnu.org, qemu-block@nongnu.org,
 xen-devel@lists.xenproject.org, qemu-riscv@nongnu.org
Subject: [PATCH v3 69/74] [automated] Use OBJECT_DECLARE_TYPE where possible
Date: Tue, 25 Aug 2020 15:21:05 -0400
Message-Id: <20200825192110.3528606-70-ehabkost@redhat.com>
In-Reply-To: <20200825192110.3528606-1-ehabkost@redhat.com>
References: <20200825192110.3528606-1-ehabkost@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
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

Replace DECLARE_OBJ_CHECKERS with OBJECT_DECLARE_TYPE where the
typedefs can be safely removed.

Generated running:

$ ./scripts/codeconverter/converter.py -i \
  --pattern=DeclareObjCheckers $(git grep -l '' -- '*.[ch]')

Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
---
Changes v2 -> v3:
* Removed hunk due to rebase conflict: include/hw/ppc/xive.h
* Reviewed-by line from Daniel was kept, as no additional hunks
  are introduced in this version

Changes v1 -> v2:
* Script re-run after typedefs and macros were moved, and now the
  patch also touches:
  - TYPE_ARM_SSE
  - TYPE_SD_BUS

Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>

---
Cc: "Marc-André Lureau" <marcandre.lureau@redhat.com>
Cc: Gerd Hoffmann <kraxel@redhat.com>
Cc: "Michael S. Tsirkin" <mst@redhat.com>
Cc: "Daniel P. Berrangé" <berrange@redhat.com>
Cc: Peter Maydell <peter.maydell@linaro.org>
Cc: Corey Minyard <cminyard@mvista.com>
Cc: "Cédric Le Goater" <clg@kaod.org>
Cc: David Gibson <david@gibson.dropbear.id.au>
Cc: Cornelia Huck <cohuck@redhat.com>
Cc: Thomas Huth <thuth@redhat.com>
Cc: Halil Pasic <pasic@linux.ibm.com>
Cc: Christian Borntraeger <borntraeger@de.ibm.com>
Cc: "Philippe Mathieu-Daudé" <philmd@redhat.com>
Cc: Alistair Francis <alistair@alistair23.me>
Cc: David Hildenbrand <david@redhat.com>
Cc: Laurent Vivier <lvivier@redhat.com>
Cc: Amit Shah <amit@kernel.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>
Cc: Anthony Perard <anthony.perard@citrix.com>
Cc: Paul Durrant <paul@xen.org>
Cc: Paolo Bonzini <pbonzini@redhat.com>
Cc: Fam Zheng <fam@euphon.net>
Cc: "Gonglei (Arei)" <arei.gonglei@huawei.com>
Cc: Eduardo Habkost <ehabkost@redhat.com>
Cc: Igor Mammedov <imammedo@redhat.com>
Cc: Stefan Berger <stefanb@linux.ibm.com>
Cc: Richard Henderson <rth@twiddle.net>
Cc: Michael Rolnik <mrolnik@gmail.com>
Cc: Sarah Harris <S.E.Harris@kent.ac.uk>
Cc: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Cc: Michael Walle <michael@walle.cc>
Cc: Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>
Cc: Aurelien Jarno <aurelien@aurel32.net>
Cc: Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>
Cc: Anthony Green <green@moxielogic.com>
Cc: Chris Wulff <crwulff@gmail.com>
Cc: Marek Vasut <marex@denx.de>
Cc: Stafford Horne <shorne@gmail.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>
Cc: Sagar Karandikar <sagark@eecs.berkeley.edu>
Cc: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Cc: Yoshinori Sato <ysato@users.sourceforge.jp>
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Cc: Artyom Tarasenko <atar4qemu@gmail.com>
Cc: Guan Xuetao <gxt@mprc.pku.edu.cn>
Cc: Max Filippov <jcmvbkbc@gmail.com>
Cc: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Cc: qemu-ppc@nongnu.org
Cc: qemu-s390x@nongnu.org
Cc: qemu-block@nongnu.org
Cc: xen-devel@lists.xenproject.org
Cc: qemu-riscv@nongnu.org
---
 hw/audio/intel-hda.h                | 6 ++----
 hw/display/virtio-vga.h             | 6 ++----
 include/authz/base.h                | 6 ++----
 include/authz/list.h                | 6 ++----
 include/authz/listfile.h            | 6 ++----
 include/authz/pamacct.h             | 6 ++----
 include/authz/simple.h              | 6 ++----
 include/crypto/secret_common.h      | 6 ++----
 include/crypto/secret_keyring.h     | 6 ++----
 include/hw/arm/armsse.h             | 6 ++----
 include/hw/hyperv/vmbus.h           | 6 ++----
 include/hw/i2c/i2c.h                | 6 ++----
 include/hw/i2c/smbus_slave.h        | 6 ++----
 include/hw/ipack/ipack.h            | 6 ++----
 include/hw/ipmi/ipmi.h              | 6 ++----
 include/hw/mem/pc-dimm.h            | 6 ++----
 include/hw/ppc/pnv.h                | 6 ++----
 include/hw/ppc/pnv_core.h           | 6 ++----
 include/hw/ppc/pnv_homer.h          | 6 ++----
 include/hw/ppc/pnv_occ.h            | 6 ++----
 include/hw/ppc/pnv_psi.h            | 6 ++----
 include/hw/ppc/pnv_xive.h           | 6 ++----
 include/hw/ppc/spapr_cpu_core.h     | 6 ++----
 include/hw/ppc/spapr_drc.h          | 6 ++----
 include/hw/ppc/spapr_vio.h          | 6 ++----
 include/hw/ppc/spapr_xive.h         | 6 ++----
 include/hw/ppc/xics.h               | 6 ++----
 include/hw/s390x/event-facility.h   | 6 ++----
 include/hw/s390x/s390_flic.h        | 6 ++----
 include/hw/s390x/sclp.h             | 6 ++----
 include/hw/sd/sd.h                  | 6 ++----
 include/hw/ssi/ssi.h                | 6 ++----
 include/hw/sysbus.h                 | 6 ++----
 include/hw/virtio/virtio-gpu.h      | 6 ++----
 include/hw/virtio/virtio-input.h    | 6 ++----
 include/hw/virtio/virtio-mem.h      | 6 ++----
 include/hw/virtio/virtio-pmem.h     | 6 ++----
 include/hw/virtio/virtio-serial.h   | 6 ++----
 include/hw/xen/xen-bus.h            | 6 ++----
 include/io/channel.h                | 6 ++----
 include/io/dns-resolver.h           | 6 ++----
 include/io/net-listener.h           | 6 ++----
 include/scsi/pr-manager.h           | 6 ++----
 include/sysemu/cryptodev.h          | 6 ++----
 include/sysemu/hostmem.h            | 6 ++----
 include/sysemu/rng.h                | 6 ++----
 include/sysemu/tpm_backend.h        | 6 ++----
 include/sysemu/vhost-user-backend.h | 6 ++----
 target/alpha/cpu-qom.h              | 6 ++----
 target/arm/cpu-qom.h                | 6 ++----
 target/avr/cpu-qom.h                | 6 ++----
 target/cris/cpu-qom.h               | 6 ++----
 target/hppa/cpu-qom.h               | 6 ++----
 target/i386/cpu-qom.h               | 6 ++----
 target/lm32/cpu-qom.h               | 6 ++----
 target/m68k/cpu-qom.h               | 6 ++----
 target/microblaze/cpu-qom.h         | 6 ++----
 target/mips/cpu-qom.h               | 6 ++----
 target/moxie/cpu.h                  | 6 ++----
 target/nios2/cpu.h                  | 6 ++----
 target/openrisc/cpu.h               | 6 ++----
 target/ppc/cpu-qom.h                | 6 ++----
 target/riscv/cpu.h                  | 6 ++----
 target/s390x/cpu-qom.h              | 6 ++----
 target/sh4/cpu-qom.h                | 6 ++----
 target/sparc/cpu-qom.h              | 6 ++----
 target/tilegx/cpu.h                 | 6 ++----
 target/tricore/cpu-qom.h            | 6 ++----
 target/unicore32/cpu-qom.h          | 6 ++----
 target/xtensa/cpu-qom.h             | 6 ++----
 backends/dbus-vmstate.c             | 6 ++----
 ui/input-barrier.c                  | 6 ++----
 ui/input-linux.c                    | 6 ++----
 73 files changed, 146 insertions(+), 292 deletions(-)

diff --git a/hw/audio/intel-hda.h b/hw/audio/intel-hda.h
index 813a7a357d..f5cce18fa3 100644
--- a/hw/audio/intel-hda.h
+++ b/hw/audio/intel-hda.h
@@ -8,10 +8,8 @@
 /* hda bus                                                               */
 
 #define TYPE_HDA_CODEC_DEVICE "hda-codec"
-typedef struct HDACodecDevice HDACodecDevice;
-typedef struct HDACodecDeviceClass HDACodecDeviceClass;
-DECLARE_OBJ_CHECKERS(HDACodecDevice, HDACodecDeviceClass,
-                     HDA_CODEC_DEVICE, TYPE_HDA_CODEC_DEVICE)
+OBJECT_DECLARE_TYPE(HDACodecDevice, HDACodecDeviceClass,
+                    hda_codec_device, HDA_CODEC_DEVICE)
 
 #define TYPE_HDA_BUS "HDA"
 typedef struct HDACodecBus HDACodecBus;
diff --git a/hw/display/virtio-vga.h b/hw/display/virtio-vga.h
index 19f8af7356..5c5671c9c1 100644
--- a/hw/display/virtio-vga.h
+++ b/hw/display/virtio-vga.h
@@ -9,10 +9,8 @@
  * virtio-vga-base: This extends VirtioPCIProxy.
  */
 #define TYPE_VIRTIO_VGA_BASE "virtio-vga-base"
-typedef struct VirtIOVGABase VirtIOVGABase;
-typedef struct VirtIOVGABaseClass VirtIOVGABaseClass;
-DECLARE_OBJ_CHECKERS(VirtIOVGABase, VirtIOVGABaseClass,
-                     VIRTIO_VGA_BASE, TYPE_VIRTIO_VGA_BASE)
+OBJECT_DECLARE_TYPE(VirtIOVGABase, VirtIOVGABaseClass,
+                    virtio_vga_base, VIRTIO_VGA_BASE)
 
 struct VirtIOVGABase {
     VirtIOPCIProxy parent_obj;
diff --git a/include/authz/base.h b/include/authz/base.h
index 8d8cf9fa5a..06b5e29f6f 100644
--- a/include/authz/base.h
+++ b/include/authz/base.h
@@ -27,10 +27,8 @@
 
 #define TYPE_QAUTHZ "authz"
 
-typedef struct QAuthZ QAuthZ;
-typedef struct QAuthZClass QAuthZClass;
-DECLARE_OBJ_CHECKERS(QAuthZ, QAuthZClass,
-                     QAUTHZ, TYPE_QAUTHZ)
+OBJECT_DECLARE_TYPE(QAuthZ, QAuthZClass,
+                    qauthz, QAUTHZ)
 
 
 /**
diff --git a/include/authz/list.h b/include/authz/list.h
index 93d16876bc..e4e1040472 100644
--- a/include/authz/list.h
+++ b/include/authz/list.h
@@ -27,10 +27,8 @@
 
 #define TYPE_QAUTHZ_LIST "authz-list"
 
-typedef struct QAuthZList QAuthZList;
-typedef struct QAuthZListClass QAuthZListClass;
-DECLARE_OBJ_CHECKERS(QAuthZList, QAuthZListClass,
-                     QAUTHZ_LIST, TYPE_QAUTHZ_LIST)
+OBJECT_DECLARE_TYPE(QAuthZList, QAuthZListClass,
+                    qauthz_list, QAUTHZ_LIST)
 
 
 
diff --git a/include/authz/listfile.h b/include/authz/listfile.h
index 2e4a629b6d..89c5eafbfa 100644
--- a/include/authz/listfile.h
+++ b/include/authz/listfile.h
@@ -27,10 +27,8 @@
 
 #define TYPE_QAUTHZ_LIST_FILE "authz-list-file"
 
-typedef struct QAuthZListFile QAuthZListFile;
-typedef struct QAuthZListFileClass QAuthZListFileClass;
-DECLARE_OBJ_CHECKERS(QAuthZListFile, QAuthZListFileClass,
-                     QAUTHZ_LIST_FILE, TYPE_QAUTHZ_LIST_FILE)
+OBJECT_DECLARE_TYPE(QAuthZListFile, QAuthZListFileClass,
+                    qauthz_list_file, QAUTHZ_LIST_FILE)
 
 
 
diff --git a/include/authz/pamacct.h b/include/authz/pamacct.h
index 98454ddc25..44bb5ff28d 100644
--- a/include/authz/pamacct.h
+++ b/include/authz/pamacct.h
@@ -27,10 +27,8 @@
 
 #define TYPE_QAUTHZ_PAM "authz-pam"
 
-typedef struct QAuthZPAM QAuthZPAM;
-typedef struct QAuthZPAMClass QAuthZPAMClass;
-DECLARE_OBJ_CHECKERS(QAuthZPAM, QAuthZPAMClass,
-                     QAUTHZ_PAM, TYPE_QAUTHZ_PAM)
+OBJECT_DECLARE_TYPE(QAuthZPAM, QAuthZPAMClass,
+                    qauthz_pam, QAUTHZ_PAM)
 
 
 
diff --git a/include/authz/simple.h b/include/authz/simple.h
index 7a896fb94b..ba4a5ec5ea 100644
--- a/include/authz/simple.h
+++ b/include/authz/simple.h
@@ -26,10 +26,8 @@
 
 #define TYPE_QAUTHZ_SIMPLE "authz-simple"
 
-typedef struct QAuthZSimple QAuthZSimple;
-typedef struct QAuthZSimpleClass QAuthZSimpleClass;
-DECLARE_OBJ_CHECKERS(QAuthZSimple, QAuthZSimpleClass,
-                     QAUTHZ_SIMPLE, TYPE_QAUTHZ_SIMPLE)
+OBJECT_DECLARE_TYPE(QAuthZSimple, QAuthZSimpleClass,
+                    qauthz_simple, QAUTHZ_SIMPLE)
 
 
 
diff --git a/include/crypto/secret_common.h b/include/crypto/secret_common.h
index dd3310ea5f..daf00c3b2a 100644
--- a/include/crypto/secret_common.h
+++ b/include/crypto/secret_common.h
@@ -25,10 +25,8 @@
 #include "qom/object.h"
 
 #define TYPE_QCRYPTO_SECRET_COMMON "secret_common"
-typedef struct QCryptoSecretCommon QCryptoSecretCommon;
-typedef struct QCryptoSecretCommonClass QCryptoSecretCommonClass;
-DECLARE_OBJ_CHECKERS(QCryptoSecretCommon, QCryptoSecretCommonClass,
-                     QCRYPTO_SECRET_COMMON, TYPE_QCRYPTO_SECRET_COMMON)
+OBJECT_DECLARE_TYPE(QCryptoSecretCommon, QCryptoSecretCommonClass,
+                    qcrypto_secret_common, QCRYPTO_SECRET_COMMON)
 
 
 struct QCryptoSecretCommon {
diff --git a/include/crypto/secret_keyring.h b/include/crypto/secret_keyring.h
index 9875f4cbf3..cc2c7397db 100644
--- a/include/crypto/secret_keyring.h
+++ b/include/crypto/secret_keyring.h
@@ -26,10 +26,8 @@
 #include "crypto/secret_common.h"
 
 #define TYPE_QCRYPTO_SECRET_KEYRING "secret_keyring"
-typedef struct QCryptoSecretKeyring QCryptoSecretKeyring;
-typedef struct QCryptoSecretKeyringClass QCryptoSecretKeyringClass;
-DECLARE_OBJ_CHECKERS(QCryptoSecretKeyring, QCryptoSecretKeyringClass,
-                     QCRYPTO_SECRET_KEYRING, TYPE_QCRYPTO_SECRET_KEYRING)
+OBJECT_DECLARE_TYPE(QCryptoSecretKeyring, QCryptoSecretKeyringClass,
+                    qcrypto_secret_keyring, QCRYPTO_SECRET_KEYRING)
 
 
 struct QCryptoSecretKeyring {
diff --git a/include/hw/arm/armsse.h b/include/hw/arm/armsse.h
index 2495b52335..f82f27001a 100644
--- a/include/hw/arm/armsse.h
+++ b/include/hw/arm/armsse.h
@@ -108,10 +108,8 @@
 #include "qom/object.h"
 
 #define TYPE_ARM_SSE "arm-sse"
-typedef struct ARMSSE ARMSSE;
-typedef struct ARMSSEClass ARMSSEClass;
-DECLARE_OBJ_CHECKERS(ARMSSE, ARMSSEClass,
-                     ARM_SSE, TYPE_ARM_SSE)
+OBJECT_DECLARE_TYPE(ARMSSE, ARMSSEClass,
+                    arm_sse, ARM_SSE)
 
 /*
  * These type names are for specific IoTKit subsystems; other than
diff --git a/include/hw/hyperv/vmbus.h b/include/hw/hyperv/vmbus.h
index 0fe3d3b47c..00ad8798c1 100644
--- a/include/hw/hyperv/vmbus.h
+++ b/include/hw/hyperv/vmbus.h
@@ -20,10 +20,8 @@
 
 #define TYPE_VMBUS_DEVICE "vmbus-dev"
 
-typedef struct VMBusDevice VMBusDevice;
-typedef struct VMBusDeviceClass VMBusDeviceClass;
-DECLARE_OBJ_CHECKERS(VMBusDevice, VMBusDeviceClass,
-                     VMBUS_DEVICE, TYPE_VMBUS_DEVICE)
+OBJECT_DECLARE_TYPE(VMBusDevice, VMBusDeviceClass,
+                    vmbus_device, VMBUS_DEVICE)
 
 #define TYPE_VMBUS "vmbus"
 typedef struct VMBus VMBus;
diff --git a/include/hw/i2c/i2c.h b/include/hw/i2c/i2c.h
index 8afa74f42e..770051db54 100644
--- a/include/hw/i2c/i2c.h
+++ b/include/hw/i2c/i2c.h
@@ -16,12 +16,10 @@ enum i2c_event {
     I2C_NACK /* Masker NACKed a receive byte.  */
 };
 
-typedef struct I2CSlave I2CSlave;
 
 #define TYPE_I2C_SLAVE "i2c-slave"
-typedef struct I2CSlaveClass I2CSlaveClass;
-DECLARE_OBJ_CHECKERS(I2CSlave, I2CSlaveClass,
-                     I2C_SLAVE, TYPE_I2C_SLAVE)
+OBJECT_DECLARE_TYPE(I2CSlave, I2CSlaveClass,
+                    i2c_slave, I2C_SLAVE)
 
 struct I2CSlaveClass {
     DeviceClass parent_class;
diff --git a/include/hw/i2c/smbus_slave.h b/include/hw/i2c/smbus_slave.h
index 8d16e4bcd9..cb9cb372f9 100644
--- a/include/hw/i2c/smbus_slave.h
+++ b/include/hw/i2c/smbus_slave.h
@@ -29,10 +29,8 @@
 #include "qom/object.h"
 
 #define TYPE_SMBUS_DEVICE "smbus-device"
-typedef struct SMBusDevice SMBusDevice;
-typedef struct SMBusDeviceClass SMBusDeviceClass;
-DECLARE_OBJ_CHECKERS(SMBusDevice, SMBusDeviceClass,
-                     SMBUS_DEVICE, TYPE_SMBUS_DEVICE)
+OBJECT_DECLARE_TYPE(SMBusDevice, SMBusDeviceClass,
+                    smbus_device, SMBUS_DEVICE)
 
 
 struct SMBusDeviceClass {
diff --git a/include/hw/ipack/ipack.h b/include/hw/ipack/ipack.h
index a2304c1b3e..a59a487853 100644
--- a/include/hw/ipack/ipack.h
+++ b/include/hw/ipack/ipack.h
@@ -30,12 +30,10 @@ struct IPackBus {
     qemu_irq_handler set_irq;
 };
 
-typedef struct IPackDevice IPackDevice;
-typedef struct IPackDeviceClass IPackDeviceClass;
 
 #define TYPE_IPACK_DEVICE "ipack-device"
-DECLARE_OBJ_CHECKERS(IPackDevice, IPackDeviceClass,
-                     IPACK_DEVICE, TYPE_IPACK_DEVICE)
+OBJECT_DECLARE_TYPE(IPackDevice, IPackDeviceClass,
+                    ipack_device, IPACK_DEVICE)
 
 struct IPackDeviceClass {
     /*< private >*/
diff --git a/include/hw/ipmi/ipmi.h b/include/hw/ipmi/ipmi.h
index d2ed0a9fc4..9915b146f7 100644
--- a/include/hw/ipmi/ipmi.h
+++ b/include/hw/ipmi/ipmi.h
@@ -175,10 +175,8 @@ struct IPMIInterfaceClass {
  * Define a BMC simulator (or perhaps a connection to a real BMC)
  */
 #define TYPE_IPMI_BMC "ipmi-bmc"
-typedef struct IPMIBmc IPMIBmc;
-typedef struct IPMIBmcClass IPMIBmcClass;
-DECLARE_OBJ_CHECKERS(IPMIBmc, IPMIBmcClass,
-                     IPMI_BMC, TYPE_IPMI_BMC)
+OBJECT_DECLARE_TYPE(IPMIBmc, IPMIBmcClass,
+                    ipmi_bmc, IPMI_BMC)
 
 struct IPMIBmc {
     DeviceState parent;
diff --git a/include/hw/mem/pc-dimm.h b/include/hw/mem/pc-dimm.h
index 86e3010243..1d570defc9 100644
--- a/include/hw/mem/pc-dimm.h
+++ b/include/hw/mem/pc-dimm.h
@@ -21,10 +21,8 @@
 #include "qom/object.h"
 
 #define TYPE_PC_DIMM "pc-dimm"
-typedef struct PCDIMMDevice PCDIMMDevice;
-typedef struct PCDIMMDeviceClass PCDIMMDeviceClass;
-DECLARE_OBJ_CHECKERS(PCDIMMDevice, PCDIMMDeviceClass,
-                     PC_DIMM, TYPE_PC_DIMM)
+OBJECT_DECLARE_TYPE(PCDIMMDevice, PCDIMMDeviceClass,
+                    pc_dimm, PC_DIMM)
 
 #define PC_DIMM_ADDR_PROP "addr"
 #define PC_DIMM_SLOT_PROP "slot"
diff --git a/include/hw/ppc/pnv.h b/include/hw/ppc/pnv.h
index f3bacb6a5c..b4b2b24d80 100644
--- a/include/hw/ppc/pnv.h
+++ b/include/hw/ppc/pnv.h
@@ -35,10 +35,8 @@
 #include "qom/object.h"
 
 #define TYPE_PNV_CHIP "pnv-chip"
-typedef struct PnvChip PnvChip;
-typedef struct PnvChipClass PnvChipClass;
-DECLARE_OBJ_CHECKERS(PnvChip, PnvChipClass,
-                     PNV_CHIP, TYPE_PNV_CHIP)
+OBJECT_DECLARE_TYPE(PnvChip, PnvChipClass,
+                    pnv_chip, PNV_CHIP)
 
 struct PnvChip {
     /*< private >*/
diff --git a/include/hw/ppc/pnv_core.h b/include/hw/ppc/pnv_core.h
index fd17a236e3..5cb22c2fa9 100644
--- a/include/hw/ppc/pnv_core.h
+++ b/include/hw/ppc/pnv_core.h
@@ -25,10 +25,8 @@
 #include "qom/object.h"
 
 #define TYPE_PNV_CORE "powernv-cpu-core"
-typedef struct PnvCore PnvCore;
-typedef struct PnvCoreClass PnvCoreClass;
-DECLARE_OBJ_CHECKERS(PnvCore, PnvCoreClass,
-                     PNV_CORE, TYPE_PNV_CORE)
+OBJECT_DECLARE_TYPE(PnvCore, PnvCoreClass,
+                    pnv_core, PNV_CORE)
 
 typedef struct PnvChip PnvChip;
 
diff --git a/include/hw/ppc/pnv_homer.h b/include/hw/ppc/pnv_homer.h
index 7aadcab03c..0978812713 100644
--- a/include/hw/ppc/pnv_homer.h
+++ b/include/hw/ppc/pnv_homer.h
@@ -24,10 +24,8 @@
 #include "qom/object.h"
 
 #define TYPE_PNV_HOMER "pnv-homer"
-typedef struct PnvHomer PnvHomer;
-typedef struct PnvHomerClass PnvHomerClass;
-DECLARE_OBJ_CHECKERS(PnvHomer, PnvHomerClass,
-                     PNV_HOMER, TYPE_PNV_HOMER)
+OBJECT_DECLARE_TYPE(PnvHomer, PnvHomerClass,
+                    pnv_homer, PNV_HOMER)
 #define TYPE_PNV8_HOMER TYPE_PNV_HOMER "-POWER8"
 DECLARE_INSTANCE_CHECKER(PnvHomer, PNV8_HOMER,
                          TYPE_PNV8_HOMER)
diff --git a/include/hw/ppc/pnv_occ.h b/include/hw/ppc/pnv_occ.h
index 4fcfb32417..b79e3440be 100644
--- a/include/hw/ppc/pnv_occ.h
+++ b/include/hw/ppc/pnv_occ.h
@@ -24,10 +24,8 @@
 #include "qom/object.h"
 
 #define TYPE_PNV_OCC "pnv-occ"
-typedef struct PnvOCC PnvOCC;
-typedef struct PnvOCCClass PnvOCCClass;
-DECLARE_OBJ_CHECKERS(PnvOCC, PnvOCCClass,
-                     PNV_OCC, TYPE_PNV_OCC)
+OBJECT_DECLARE_TYPE(PnvOCC, PnvOCCClass,
+                    pnv_occ, PNV_OCC)
 #define TYPE_PNV8_OCC TYPE_PNV_OCC "-POWER8"
 DECLARE_INSTANCE_CHECKER(PnvOCC, PNV8_OCC,
                          TYPE_PNV8_OCC)
diff --git a/include/hw/ppc/pnv_psi.h b/include/hw/ppc/pnv_psi.h
index a33195df17..0034db44c3 100644
--- a/include/hw/ppc/pnv_psi.h
+++ b/include/hw/ppc/pnv_psi.h
@@ -26,10 +26,8 @@
 #include "qom/object.h"
 
 #define TYPE_PNV_PSI "pnv-psi"
-typedef struct PnvPsi PnvPsi;
-typedef struct PnvPsiClass PnvPsiClass;
-DECLARE_OBJ_CHECKERS(PnvPsi, PnvPsiClass,
-                     PNV_PSI, TYPE_PNV_PSI)
+OBJECT_DECLARE_TYPE(PnvPsi, PnvPsiClass,
+                    pnv_psi, PNV_PSI)
 
 #define PSIHB_XSCOM_MAX         0x20
 
diff --git a/include/hw/ppc/pnv_xive.h b/include/hw/ppc/pnv_xive.h
index a014e2a726..29d5debd1c 100644
--- a/include/hw/ppc/pnv_xive.h
+++ b/include/hw/ppc/pnv_xive.h
@@ -16,10 +16,8 @@
 struct PnvChip;
 
 #define TYPE_PNV_XIVE "pnv-xive"
-typedef struct PnvXive PnvXive;
-typedef struct PnvXiveClass PnvXiveClass;
-DECLARE_OBJ_CHECKERS(PnvXive, PnvXiveClass,
-                     PNV_XIVE, TYPE_PNV_XIVE)
+OBJECT_DECLARE_TYPE(PnvXive, PnvXiveClass,
+                    pnv_xive, PNV_XIVE)
 
 #define XIVE_BLOCK_MAX      16
 
diff --git a/include/hw/ppc/spapr_cpu_core.h b/include/hw/ppc/spapr_cpu_core.h
index fba6a01050..4022917168 100644
--- a/include/hw/ppc/spapr_cpu_core.h
+++ b/include/hw/ppc/spapr_cpu_core.h
@@ -16,10 +16,8 @@
 #include "qom/object.h"
 
 #define TYPE_SPAPR_CPU_CORE "spapr-cpu-core"
-typedef struct SpaprCpuCore SpaprCpuCore;
-typedef struct SpaprCpuCoreClass SpaprCpuCoreClass;
-DECLARE_OBJ_CHECKERS(SpaprCpuCore, SpaprCpuCoreClass,
-                     SPAPR_CPU_CORE, TYPE_SPAPR_CPU_CORE)
+OBJECT_DECLARE_TYPE(SpaprCpuCore, SpaprCpuCoreClass,
+                    spapr_cpu_core, SPAPR_CPU_CORE)
 
 #define SPAPR_CPU_CORE_TYPE_NAME(model) model "-" TYPE_SPAPR_CPU_CORE
 
diff --git a/include/hw/ppc/spapr_drc.h b/include/hw/ppc/spapr_drc.h
index 2236aea66a..6daafa8106 100644
--- a/include/hw/ppc/spapr_drc.h
+++ b/include/hw/ppc/spapr_drc.h
@@ -20,10 +20,8 @@
 #include "qapi/error.h"
 
 #define TYPE_SPAPR_DR_CONNECTOR "spapr-dr-connector"
-typedef struct SpaprDrc SpaprDrc;
-typedef struct SpaprDrcClass SpaprDrcClass;
-DECLARE_OBJ_CHECKERS(SpaprDrc, SpaprDrcClass,
-                     SPAPR_DR_CONNECTOR, TYPE_SPAPR_DR_CONNECTOR)
+OBJECT_DECLARE_TYPE(SpaprDrc, SpaprDrcClass,
+                    spapr_dr_connector, SPAPR_DR_CONNECTOR)
 
 #define TYPE_SPAPR_DRC_PHYSICAL "spapr-drc-physical"
 typedef struct SpaprDrcPhysical SpaprDrcPhysical;
diff --git a/include/hw/ppc/spapr_vio.h b/include/hw/ppc/spapr_vio.h
index e289028634..6c40da72ff 100644
--- a/include/hw/ppc/spapr_vio.h
+++ b/include/hw/ppc/spapr_vio.h
@@ -28,10 +28,8 @@
 #include "qom/object.h"
 
 #define TYPE_VIO_SPAPR_DEVICE "vio-spapr-device"
-typedef struct SpaprVioDevice SpaprVioDevice;
-typedef struct SpaprVioDeviceClass SpaprVioDeviceClass;
-DECLARE_OBJ_CHECKERS(SpaprVioDevice, SpaprVioDeviceClass,
-                     VIO_SPAPR_DEVICE, TYPE_VIO_SPAPR_DEVICE)
+OBJECT_DECLARE_TYPE(SpaprVioDevice, SpaprVioDeviceClass,
+                    vio_spapr_device, VIO_SPAPR_DEVICE)
 
 #define TYPE_SPAPR_VIO_BUS "spapr-vio-bus"
 typedef struct SpaprVioBus SpaprVioBus;
diff --git a/include/hw/ppc/spapr_xive.h b/include/hw/ppc/spapr_xive.h
index feb6630783..afe8ec7197 100644
--- a/include/hw/ppc/spapr_xive.h
+++ b/include/hw/ppc/spapr_xive.h
@@ -15,10 +15,8 @@
 #include "qom/object.h"
 
 #define TYPE_SPAPR_XIVE "spapr-xive"
-typedef struct SpaprXive SpaprXive;
-typedef struct SpaprXiveClass SpaprXiveClass;
-DECLARE_OBJ_CHECKERS(SpaprXive, SpaprXiveClass,
-                     SPAPR_XIVE, TYPE_SPAPR_XIVE)
+OBJECT_DECLARE_TYPE(SpaprXive, SpaprXiveClass,
+                    spapr_xive, SPAPR_XIVE)
 
 struct SpaprXive {
     XiveRouter    parent;
diff --git a/include/hw/ppc/xics.h b/include/hw/ppc/xics.h
index bcb584b90d..c5a3cdcadc 100644
--- a/include/hw/ppc/xics.h
+++ b/include/hw/ppc/xics.h
@@ -41,8 +41,6 @@
  * (the kernel implementation supports more but we don't exploit
  *  that yet)
  */
-typedef struct ICPStateClass ICPStateClass;
-typedef struct ICPState ICPState;
 typedef struct PnvICPState PnvICPState;
 typedef struct ICSStateClass ICSStateClass;
 typedef struct ICSState ICSState;
@@ -50,8 +48,8 @@ typedef struct ICSIRQState ICSIRQState;
 typedef struct XICSFabric XICSFabric;
 
 #define TYPE_ICP "icp"
-DECLARE_OBJ_CHECKERS(ICPState, ICPStateClass,
-                     ICP, TYPE_ICP)
+OBJECT_DECLARE_TYPE(ICPState, ICPStateClass,
+                    icp, ICP)
 
 #define TYPE_PNV_ICP "pnv-icp"
 DECLARE_INSTANCE_CHECKER(PnvICPState, PNV_ICP,
diff --git a/include/hw/s390x/event-facility.h b/include/hw/s390x/event-facility.h
index eccf6e924b..051c1c6576 100644
--- a/include/hw/s390x/event-facility.h
+++ b/include/hw/s390x/event-facility.h
@@ -42,10 +42,8 @@
 #define SCLP_SELECTIVE_READ                     0x01
 
 #define TYPE_SCLP_EVENT "s390-sclp-event-type"
-typedef struct SCLPEvent SCLPEvent;
-typedef struct SCLPEventClass SCLPEventClass;
-DECLARE_OBJ_CHECKERS(SCLPEvent, SCLPEventClass,
-                     SCLP_EVENT, TYPE_SCLP_EVENT)
+OBJECT_DECLARE_TYPE(SCLPEvent, SCLPEventClass,
+                    sclp_event, SCLP_EVENT)
 
 #define TYPE_SCLP_CPU_HOTPLUG "sclp-cpu-hotplug"
 #define TYPE_SCLP_QUIESCE "sclpquiesce"
diff --git a/include/hw/s390x/s390_flic.h b/include/hw/s390x/s390_flic.h
index a6a123598d..4b718c8ebf 100644
--- a/include/hw/s390x/s390_flic.h
+++ b/include/hw/s390x/s390_flic.h
@@ -39,10 +39,8 @@ extern const VMStateDescription vmstate_adapter_routes;
     VMSTATE_STRUCT(_f, _s, 1, vmstate_adapter_routes, AdapterRoutes)
 
 #define TYPE_S390_FLIC_COMMON "s390-flic"
-typedef struct S390FLICState S390FLICState;
-typedef struct S390FLICStateClass S390FLICStateClass;
-DECLARE_OBJ_CHECKERS(S390FLICState, S390FLICStateClass,
-                     S390_FLIC_COMMON, TYPE_S390_FLIC_COMMON)
+OBJECT_DECLARE_TYPE(S390FLICState, S390FLICStateClass,
+                    s390_flic_common, S390_FLIC_COMMON)
 
 struct S390FLICState {
     SysBusDevice parent_obj;
diff --git a/include/hw/s390x/sclp.h b/include/hw/s390x/sclp.h
index 5038a45612..e9f0f7e67c 100644
--- a/include/hw/s390x/sclp.h
+++ b/include/hw/s390x/sclp.h
@@ -182,10 +182,8 @@ typedef struct SCCB {
  } QEMU_PACKED SCCB;
 
 #define TYPE_SCLP "sclp"
-typedef struct SCLPDevice SCLPDevice;
-typedef struct SCLPDeviceClass SCLPDeviceClass;
-DECLARE_OBJ_CHECKERS(SCLPDevice, SCLPDeviceClass,
-                     SCLP, TYPE_SCLP)
+OBJECT_DECLARE_TYPE(SCLPDevice, SCLPDeviceClass,
+                    sclp, SCLP)
 
 struct SCLPEventFacility;
 
diff --git a/include/hw/sd/sd.h b/include/hw/sd/sd.h
index 31ccbeab0e..54f97a07cd 100644
--- a/include/hw/sd/sd.h
+++ b/include/hw/sd/sd.h
@@ -90,7 +90,6 @@ typedef struct {
 } SDRequest;
 
 typedef struct SDState SDState;
-typedef struct SDBus SDBus;
 
 #define TYPE_SD_CARD "sd-card"
 typedef struct SDCardClass SDCardClass;
@@ -130,9 +129,8 @@ struct SDCardClass {
 };
 
 #define TYPE_SD_BUS "sd-bus"
-typedef struct SDBusClass SDBusClass;
-DECLARE_OBJ_CHECKERS(SDBus, SDBusClass,
-                     SD_BUS, TYPE_SD_BUS)
+OBJECT_DECLARE_TYPE(SDBus, SDBusClass,
+                    sd_bus, SD_BUS)
 
 struct SDBus {
     BusState qbus;
diff --git a/include/hw/ssi/ssi.h b/include/hw/ssi/ssi.h
index b9286989fc..4fe1d85136 100644
--- a/include/hw/ssi/ssi.h
+++ b/include/hw/ssi/ssi.h
@@ -14,13 +14,11 @@
 #include "hw/qdev-core.h"
 #include "qom/object.h"
 
-typedef struct SSISlave SSISlave;
-typedef struct SSISlaveClass SSISlaveClass;
 typedef enum SSICSMode SSICSMode;
 
 #define TYPE_SSI_SLAVE "ssi-slave"
-DECLARE_OBJ_CHECKERS(SSISlave, SSISlaveClass,
-                     SSI_SLAVE, TYPE_SSI_SLAVE)
+OBJECT_DECLARE_TYPE(SSISlave, SSISlaveClass,
+                    ssi_slave, SSI_SLAVE)
 
 #define SSI_GPIO_CS "ssi-gpio-cs"
 
diff --git a/include/hw/sysbus.h b/include/hw/sysbus.h
index 77e21bba18..28a9b0f634 100644
--- a/include/hw/sysbus.h
+++ b/include/hw/sysbus.h
@@ -14,12 +14,10 @@
 DECLARE_INSTANCE_CHECKER(BusState, SYSTEM_BUS,
                          TYPE_SYSTEM_BUS)
 
-typedef struct SysBusDevice SysBusDevice;
 
 #define TYPE_SYS_BUS_DEVICE "sys-bus-device"
-typedef struct SysBusDeviceClass SysBusDeviceClass;
-DECLARE_OBJ_CHECKERS(SysBusDevice, SysBusDeviceClass,
-                     SYS_BUS_DEVICE, TYPE_SYS_BUS_DEVICE)
+OBJECT_DECLARE_TYPE(SysBusDevice, SysBusDeviceClass,
+                    sys_bus_device, SYS_BUS_DEVICE)
 
 /**
  * SysBusDeviceClass:
diff --git a/include/hw/virtio/virtio-gpu.h b/include/hw/virtio/virtio-gpu.h
index 72f8689e2e..f334b78085 100644
--- a/include/hw/virtio/virtio-gpu.h
+++ b/include/hw/virtio/virtio-gpu.h
@@ -25,10 +25,8 @@
 #include "qom/object.h"
 
 #define TYPE_VIRTIO_GPU_BASE "virtio-gpu-base"
-typedef struct VirtIOGPUBase VirtIOGPUBase;
-typedef struct VirtIOGPUBaseClass VirtIOGPUBaseClass;
-DECLARE_OBJ_CHECKERS(VirtIOGPUBase, VirtIOGPUBaseClass,
-                     VIRTIO_GPU_BASE, TYPE_VIRTIO_GPU_BASE)
+OBJECT_DECLARE_TYPE(VirtIOGPUBase, VirtIOGPUBaseClass,
+                    virtio_gpu_base, VIRTIO_GPU_BASE)
 
 #define TYPE_VIRTIO_GPU "virtio-gpu-device"
 typedef struct VirtIOGPU VirtIOGPU;
diff --git a/include/hw/virtio/virtio-input.h b/include/hw/virtio/virtio-input.h
index c54aa6aa72..5eb9e7745e 100644
--- a/include/hw/virtio/virtio-input.h
+++ b/include/hw/virtio/virtio-input.h
@@ -19,10 +19,8 @@ typedef struct virtio_input_event virtio_input_event;
 /* qemu internals                                                    */
 
 #define TYPE_VIRTIO_INPUT "virtio-input-device"
-typedef struct VirtIOInput VirtIOInput;
-typedef struct VirtIOInputClass VirtIOInputClass;
-DECLARE_OBJ_CHECKERS(VirtIOInput, VirtIOInputClass,
-                     VIRTIO_INPUT, TYPE_VIRTIO_INPUT)
+OBJECT_DECLARE_TYPE(VirtIOInput, VirtIOInputClass,
+                    virtio_input, VIRTIO_INPUT)
 #define VIRTIO_INPUT_GET_PARENT_CLASS(obj) \
         OBJECT_GET_PARENT_CLASS(obj, TYPE_VIRTIO_INPUT)
 
diff --git a/include/hw/virtio/virtio-mem.h b/include/hw/virtio/virtio-mem.h
index 5f0b81a967..dfc72e14b1 100644
--- a/include/hw/virtio/virtio-mem.h
+++ b/include/hw/virtio/virtio-mem.h
@@ -21,10 +21,8 @@
 
 #define TYPE_VIRTIO_MEM "virtio-mem"
 
-typedef struct VirtIOMEM VirtIOMEM;
-typedef struct VirtIOMEMClass VirtIOMEMClass;
-DECLARE_OBJ_CHECKERS(VirtIOMEM, VirtIOMEMClass,
-                     VIRTIO_MEM, TYPE_VIRTIO_MEM)
+OBJECT_DECLARE_TYPE(VirtIOMEM, VirtIOMEMClass,
+                    virtio_mem, VIRTIO_MEM)
 
 #define VIRTIO_MEM_MEMDEV_PROP "memdev"
 #define VIRTIO_MEM_NODE_PROP "node"
diff --git a/include/hw/virtio/virtio-pmem.h b/include/hw/virtio/virtio-pmem.h
index 6c15abad70..56df9a03ce 100644
--- a/include/hw/virtio/virtio-pmem.h
+++ b/include/hw/virtio/virtio-pmem.h
@@ -20,10 +20,8 @@
 
 #define TYPE_VIRTIO_PMEM "virtio-pmem"
 
-typedef struct VirtIOPMEM VirtIOPMEM;
-typedef struct VirtIOPMEMClass VirtIOPMEMClass;
-DECLARE_OBJ_CHECKERS(VirtIOPMEM, VirtIOPMEMClass,
-                     VIRTIO_PMEM, TYPE_VIRTIO_PMEM)
+OBJECT_DECLARE_TYPE(VirtIOPMEM, VirtIOPMEMClass,
+                    virtio_pmem, VIRTIO_PMEM)
 
 #define VIRTIO_PMEM_ADDR_PROP "memaddr"
 #define VIRTIO_PMEM_MEMDEV_PROP "memdev"
diff --git a/include/hw/virtio/virtio-serial.h b/include/hw/virtio/virtio-serial.h
index bbc76d5032..0b7f963611 100644
--- a/include/hw/virtio/virtio-serial.h
+++ b/include/hw/virtio/virtio-serial.h
@@ -26,10 +26,8 @@ struct virtio_serial_conf {
 };
 
 #define TYPE_VIRTIO_SERIAL_PORT "virtio-serial-port"
-typedef struct VirtIOSerialPort VirtIOSerialPort;
-typedef struct VirtIOSerialPortClass VirtIOSerialPortClass;
-DECLARE_OBJ_CHECKERS(VirtIOSerialPort, VirtIOSerialPortClass,
-                     VIRTIO_SERIAL_PORT, TYPE_VIRTIO_SERIAL_PORT)
+OBJECT_DECLARE_TYPE(VirtIOSerialPort, VirtIOSerialPortClass,
+                    virtio_serial_port, VIRTIO_SERIAL_PORT)
 
 typedef struct VirtIOSerial VirtIOSerial;
 
diff --git a/include/hw/xen/xen-bus.h b/include/hw/xen/xen-bus.h
index 35fec7c905..e0e67505b8 100644
--- a/include/hw/xen/xen-bus.h
+++ b/include/hw/xen/xen-bus.h
@@ -71,17 +71,15 @@ struct XenBus {
     XenWatch *backend_watch;
     QLIST_HEAD(, XenDevice) inactive_devices;
 };
-typedef struct XenBus XenBus;
 
 struct XenBusClass {
     /*< private >*/
     BusClass parent_class;
 };
-typedef struct XenBusClass XenBusClass;
 
 #define TYPE_XEN_BUS "xen-bus"
-DECLARE_OBJ_CHECKERS(XenBus, XenBusClass,
-                     XEN_BUS, TYPE_XEN_BUS)
+OBJECT_DECLARE_TYPE(XenBus, XenBusClass,
+                    xen_bus, XEN_BUS)
 
 void xen_bus_init(void);
 
diff --git a/include/io/channel.h b/include/io/channel.h
index 3ebdc7954f..245479548a 100644
--- a/include/io/channel.h
+++ b/include/io/channel.h
@@ -26,10 +26,8 @@
 #include "block/aio.h"
 
 #define TYPE_QIO_CHANNEL "qio-channel"
-typedef struct QIOChannel QIOChannel;
-typedef struct QIOChannelClass QIOChannelClass;
-DECLARE_OBJ_CHECKERS(QIOChannel, QIOChannelClass,
-                     QIO_CHANNEL, TYPE_QIO_CHANNEL)
+OBJECT_DECLARE_TYPE(QIOChannel, QIOChannelClass,
+                    qio_channel, QIO_CHANNEL)
 
 
 #define QIO_CHANNEL_ERR_BLOCK -2
diff --git a/include/io/dns-resolver.h b/include/io/dns-resolver.h
index 96a3186b6b..8ae4857e05 100644
--- a/include/io/dns-resolver.h
+++ b/include/io/dns-resolver.h
@@ -26,10 +26,8 @@
 #include "io/task.h"
 
 #define TYPE_QIO_DNS_RESOLVER "qio-dns-resolver"
-typedef struct QIODNSResolver QIODNSResolver;
-typedef struct QIODNSResolverClass QIODNSResolverClass;
-DECLARE_OBJ_CHECKERS(QIODNSResolver, QIODNSResolverClass,
-                     QIO_DNS_RESOLVER, TYPE_QIO_DNS_RESOLVER)
+OBJECT_DECLARE_TYPE(QIODNSResolver, QIODNSResolverClass,
+                    qio_dns_resolver, QIO_DNS_RESOLVER)
 
 
 /**
diff --git a/include/io/net-listener.h b/include/io/net-listener.h
index 93367db291..4f0847ff19 100644
--- a/include/io/net-listener.h
+++ b/include/io/net-listener.h
@@ -25,10 +25,8 @@
 #include "qom/object.h"
 
 #define TYPE_QIO_NET_LISTENER "qio-net-listener"
-typedef struct QIONetListener QIONetListener;
-typedef struct QIONetListenerClass QIONetListenerClass;
-DECLARE_OBJ_CHECKERS(QIONetListener, QIONetListenerClass,
-                     QIO_NET_LISTENER, TYPE_QIO_NET_LISTENER)
+OBJECT_DECLARE_TYPE(QIONetListener, QIONetListenerClass,
+                    qio_net_listener, QIO_NET_LISTENER)
 
 
 typedef void (*QIONetListenerClientFunc)(QIONetListener *listener,
diff --git a/include/scsi/pr-manager.h b/include/scsi/pr-manager.h
index f801fe9533..26bd134531 100644
--- a/include/scsi/pr-manager.h
+++ b/include/scsi/pr-manager.h
@@ -9,10 +9,8 @@
 
 #define TYPE_PR_MANAGER "pr-manager"
 
-typedef struct PRManager PRManager;
-typedef struct PRManagerClass PRManagerClass;
-DECLARE_OBJ_CHECKERS(PRManager, PRManagerClass,
-                     PR_MANAGER, TYPE_PR_MANAGER)
+OBJECT_DECLARE_TYPE(PRManager, PRManagerClass,
+                    pr_manager, PR_MANAGER)
 
 struct sg_io_hdr;
 
diff --git a/include/sysemu/cryptodev.h b/include/sysemu/cryptodev.h
index 65c017cf81..06726f7014 100644
--- a/include/sysemu/cryptodev.h
+++ b/include/sysemu/cryptodev.h
@@ -37,10 +37,8 @@
 
 #define TYPE_CRYPTODEV_BACKEND "cryptodev-backend"
 
-typedef struct CryptoDevBackend CryptoDevBackend;
-typedef struct CryptoDevBackendClass CryptoDevBackendClass;
-DECLARE_OBJ_CHECKERS(CryptoDevBackend, CryptoDevBackendClass,
-                     CRYPTODEV_BACKEND, TYPE_CRYPTODEV_BACKEND)
+OBJECT_DECLARE_TYPE(CryptoDevBackend, CryptoDevBackendClass,
+                    cryptodev_backend, CRYPTODEV_BACKEND)
 
 
 #define MAX_CRYPTO_QUEUE_NUM  64
diff --git a/include/sysemu/hostmem.h b/include/sysemu/hostmem.h
index 1e6078f872..e5b7a152d3 100644
--- a/include/sysemu/hostmem.h
+++ b/include/sysemu/hostmem.h
@@ -20,10 +20,8 @@
 #include "qemu/bitmap.h"
 
 #define TYPE_MEMORY_BACKEND "memory-backend"
-typedef struct HostMemoryBackend HostMemoryBackend;
-typedef struct HostMemoryBackendClass HostMemoryBackendClass;
-DECLARE_OBJ_CHECKERS(HostMemoryBackend, HostMemoryBackendClass,
-                     MEMORY_BACKEND, TYPE_MEMORY_BACKEND)
+OBJECT_DECLARE_TYPE(HostMemoryBackend, HostMemoryBackendClass,
+                    memory_backend, MEMORY_BACKEND)
 
 /* hostmem-ram.c */
 /**
diff --git a/include/sysemu/rng.h b/include/sysemu/rng.h
index f8fc948109..cee45a4787 100644
--- a/include/sysemu/rng.h
+++ b/include/sysemu/rng.h
@@ -17,10 +17,8 @@
 #include "qom/object.h"
 
 #define TYPE_RNG_BACKEND "rng-backend"
-typedef struct RngBackend RngBackend;
-typedef struct RngBackendClass RngBackendClass;
-DECLARE_OBJ_CHECKERS(RngBackend, RngBackendClass,
-                     RNG_BACKEND, TYPE_RNG_BACKEND)
+OBJECT_DECLARE_TYPE(RngBackend, RngBackendClass,
+                    rng_backend, RNG_BACKEND)
 
 #define TYPE_RNG_BUILTIN "rng-builtin"
 
diff --git a/include/sysemu/tpm_backend.h b/include/sysemu/tpm_backend.h
index e038b79d34..7e8a014031 100644
--- a/include/sysemu/tpm_backend.h
+++ b/include/sysemu/tpm_backend.h
@@ -19,10 +19,8 @@
 #include "qapi/error.h"
 
 #define TYPE_TPM_BACKEND "tpm-backend"
-typedef struct TPMBackend TPMBackend;
-typedef struct TPMBackendClass TPMBackendClass;
-DECLARE_OBJ_CHECKERS(TPMBackend, TPMBackendClass,
-                     TPM_BACKEND, TYPE_TPM_BACKEND)
+OBJECT_DECLARE_TYPE(TPMBackend, TPMBackendClass,
+                    tpm_backend, TPM_BACKEND)
 
 
 typedef struct TPMBackendCmd {
diff --git a/include/sysemu/vhost-user-backend.h b/include/sysemu/vhost-user-backend.h
index e4c85e33c0..76ca06cf40 100644
--- a/include/sysemu/vhost-user-backend.h
+++ b/include/sysemu/vhost-user-backend.h
@@ -22,10 +22,8 @@
 #include "io/channel.h"
 
 #define TYPE_VHOST_USER_BACKEND "vhost-user-backend"
-typedef struct VhostUserBackend VhostUserBackend;
-typedef struct VhostUserBackendClass VhostUserBackendClass;
-DECLARE_OBJ_CHECKERS(VhostUserBackend, VhostUserBackendClass,
-                     VHOST_USER_BACKEND, TYPE_VHOST_USER_BACKEND)
+OBJECT_DECLARE_TYPE(VhostUserBackend, VhostUserBackendClass,
+                    vhost_user_backend, VHOST_USER_BACKEND)
 
 
 struct VhostUserBackendClass {
diff --git a/target/alpha/cpu-qom.h b/target/alpha/cpu-qom.h
index 45350318c9..568fe3fb77 100644
--- a/target/alpha/cpu-qom.h
+++ b/target/alpha/cpu-qom.h
@@ -25,10 +25,8 @@
 
 #define TYPE_ALPHA_CPU "alpha-cpu"
 
-typedef struct AlphaCPU AlphaCPU;
-typedef struct AlphaCPUClass AlphaCPUClass;
-DECLARE_OBJ_CHECKERS(AlphaCPU, AlphaCPUClass,
-                     ALPHA_CPU, TYPE_ALPHA_CPU)
+OBJECT_DECLARE_TYPE(AlphaCPU, AlphaCPUClass,
+                    alpha_cpu, ALPHA_CPU)
 
 /**
  * AlphaCPUClass:
diff --git a/target/arm/cpu-qom.h b/target/arm/cpu-qom.h
index 92d58f84fe..94bbbd4473 100644
--- a/target/arm/cpu-qom.h
+++ b/target/arm/cpu-qom.h
@@ -27,10 +27,8 @@ struct arm_boot_info;
 
 #define TYPE_ARM_CPU "arm-cpu"
 
-typedef struct ARMCPU ARMCPU;
-typedef struct ARMCPUClass ARMCPUClass;
-DECLARE_OBJ_CHECKERS(ARMCPU, ARMCPUClass,
-                     ARM_CPU, TYPE_ARM_CPU)
+OBJECT_DECLARE_TYPE(ARMCPU, ARMCPUClass,
+                    arm_cpu, ARM_CPU)
 
 #define TYPE_ARM_MAX_CPU "max-" TYPE_ARM_CPU
 
diff --git a/target/avr/cpu-qom.h b/target/avr/cpu-qom.h
index 1bbfbb2087..49d63faad2 100644
--- a/target/avr/cpu-qom.h
+++ b/target/avr/cpu-qom.h
@@ -26,10 +26,8 @@
 
 #define TYPE_AVR_CPU "avr-cpu"
 
-typedef struct AVRCPU AVRCPU;
-typedef struct AVRCPUClass AVRCPUClass;
-DECLARE_OBJ_CHECKERS(AVRCPU, AVRCPUClass,
-                     AVR_CPU, TYPE_AVR_CPU)
+OBJECT_DECLARE_TYPE(AVRCPU, AVRCPUClass,
+                    avr_cpu, AVR_CPU)
 
 /**
  *  AVRCPUClass:
diff --git a/target/cris/cpu-qom.h b/target/cris/cpu-qom.h
index eced6ef7c9..2b0328113c 100644
--- a/target/cris/cpu-qom.h
+++ b/target/cris/cpu-qom.h
@@ -25,10 +25,8 @@
 
 #define TYPE_CRIS_CPU "cris-cpu"
 
-typedef struct CRISCPU CRISCPU;
-typedef struct CRISCPUClass CRISCPUClass;
-DECLARE_OBJ_CHECKERS(CRISCPU, CRISCPUClass,
-                     CRIS_CPU, TYPE_CRIS_CPU)
+OBJECT_DECLARE_TYPE(CRISCPU, CRISCPUClass,
+                    cris_cpu, CRIS_CPU)
 
 /**
  * CRISCPUClass:
diff --git a/target/hppa/cpu-qom.h b/target/hppa/cpu-qom.h
index 5c5aa0c053..58158f374b 100644
--- a/target/hppa/cpu-qom.h
+++ b/target/hppa/cpu-qom.h
@@ -25,10 +25,8 @@
 
 #define TYPE_HPPA_CPU "hppa-cpu"
 
-typedef struct HPPACPU HPPACPU;
-typedef struct HPPACPUClass HPPACPUClass;
-DECLARE_OBJ_CHECKERS(HPPACPU, HPPACPUClass,
-                     HPPA_CPU, TYPE_HPPA_CPU)
+OBJECT_DECLARE_TYPE(HPPACPU, HPPACPUClass,
+                    hppa_cpu, HPPA_CPU)
 
 /**
  * HPPACPUClass:
diff --git a/target/i386/cpu-qom.h b/target/i386/cpu-qom.h
index 05b52ba74c..0505472e86 100644
--- a/target/i386/cpu-qom.h
+++ b/target/i386/cpu-qom.h
@@ -30,10 +30,8 @@
 #define TYPE_X86_CPU "i386-cpu"
 #endif
 
-typedef struct X86CPU X86CPU;
-typedef struct X86CPUClass X86CPUClass;
-DECLARE_OBJ_CHECKERS(X86CPU, X86CPUClass,
-                     X86_CPU, TYPE_X86_CPU)
+OBJECT_DECLARE_TYPE(X86CPU, X86CPUClass,
+                    x86_cpu, X86_CPU)
 
 typedef struct X86CPUModel X86CPUModel;
 
diff --git a/target/lm32/cpu-qom.h b/target/lm32/cpu-qom.h
index 9bf2f82ffe..e9eb495bf0 100644
--- a/target/lm32/cpu-qom.h
+++ b/target/lm32/cpu-qom.h
@@ -25,10 +25,8 @@
 
 #define TYPE_LM32_CPU "lm32-cpu"
 
-typedef struct LM32CPU LM32CPU;
-typedef struct LM32CPUClass LM32CPUClass;
-DECLARE_OBJ_CHECKERS(LM32CPU, LM32CPUClass,
-                     LM32_CPU, TYPE_LM32_CPU)
+OBJECT_DECLARE_TYPE(LM32CPU, LM32CPUClass,
+                    lm32_cpu, LM32_CPU)
 
 /**
  * LM32CPUClass:
diff --git a/target/m68k/cpu-qom.h b/target/m68k/cpu-qom.h
index 241a3b19af..a10429cf67 100644
--- a/target/m68k/cpu-qom.h
+++ b/target/m68k/cpu-qom.h
@@ -25,10 +25,8 @@
 
 #define TYPE_M68K_CPU "m68k-cpu"
 
-typedef struct M68kCPU M68kCPU;
-typedef struct M68kCPUClass M68kCPUClass;
-DECLARE_OBJ_CHECKERS(M68kCPU, M68kCPUClass,
-                     M68K_CPU, TYPE_M68K_CPU)
+OBJECT_DECLARE_TYPE(M68kCPU, M68kCPUClass,
+                    m68k_cpu, M68K_CPU)
 
 /*
  * M68kCPUClass:
diff --git a/target/microblaze/cpu-qom.h b/target/microblaze/cpu-qom.h
index 73c2237f98..82734b9b2b 100644
--- a/target/microblaze/cpu-qom.h
+++ b/target/microblaze/cpu-qom.h
@@ -25,10 +25,8 @@
 
 #define TYPE_MICROBLAZE_CPU "microblaze-cpu"
 
-typedef struct MicroBlazeCPU MicroBlazeCPU;
-typedef struct MicroBlazeCPUClass MicroBlazeCPUClass;
-DECLARE_OBJ_CHECKERS(MicroBlazeCPU, MicroBlazeCPUClass,
-                     MICROBLAZE_CPU, TYPE_MICROBLAZE_CPU)
+OBJECT_DECLARE_TYPE(MicroBlazeCPU, MicroBlazeCPUClass,
+                    microblaze_cpu, MICROBLAZE_CPU)
 
 /**
  * MicroBlazeCPUClass:
diff --git a/target/mips/cpu-qom.h b/target/mips/cpu-qom.h
index 82f45a828c..93fbbdca1b 100644
--- a/target/mips/cpu-qom.h
+++ b/target/mips/cpu-qom.h
@@ -29,10 +29,8 @@
 #define TYPE_MIPS_CPU "mips-cpu"
 #endif
 
-typedef struct MIPSCPU MIPSCPU;
-typedef struct MIPSCPUClass MIPSCPUClass;
-DECLARE_OBJ_CHECKERS(MIPSCPU, MIPSCPUClass,
-                     MIPS_CPU, TYPE_MIPS_CPU)
+OBJECT_DECLARE_TYPE(MIPSCPU, MIPSCPUClass,
+                    mips_cpu, MIPS_CPU)
 
 /**
  * MIPSCPUClass:
diff --git a/target/moxie/cpu.h b/target/moxie/cpu.h
index a9832a2d85..d58761ccb1 100644
--- a/target/moxie/cpu.h
+++ b/target/moxie/cpu.h
@@ -51,10 +51,8 @@ typedef struct CPUMoxieState {
 
 #define TYPE_MOXIE_CPU "moxie-cpu"
 
-typedef struct MoxieCPU MoxieCPU;
-typedef struct MoxieCPUClass MoxieCPUClass;
-DECLARE_OBJ_CHECKERS(MoxieCPU, MoxieCPUClass,
-                     MOXIE_CPU, TYPE_MOXIE_CPU)
+OBJECT_DECLARE_TYPE(MoxieCPU, MoxieCPUClass,
+                    moxie_cpu, MOXIE_CPU)
 
 /**
  * MoxieCPUClass:
diff --git a/target/nios2/cpu.h b/target/nios2/cpu.h
index 0b91a3634b..1fa0fdaa35 100644
--- a/target/nios2/cpu.h
+++ b/target/nios2/cpu.h
@@ -32,10 +32,8 @@ typedef struct CPUNios2State CPUNios2State;
 
 #define TYPE_NIOS2_CPU "nios2-cpu"
 
-typedef struct Nios2CPU Nios2CPU;
-typedef struct Nios2CPUClass Nios2CPUClass;
-DECLARE_OBJ_CHECKERS(Nios2CPU, Nios2CPUClass,
-                     NIOS2_CPU, TYPE_NIOS2_CPU)
+OBJECT_DECLARE_TYPE(Nios2CPU, Nios2CPUClass,
+                    nios2_cpu, NIOS2_CPU)
 
 /**
  * Nios2CPUClass:
diff --git a/target/openrisc/cpu.h b/target/openrisc/cpu.h
index 5e6d8a40d6..d0a8ee657a 100644
--- a/target/openrisc/cpu.h
+++ b/target/openrisc/cpu.h
@@ -29,10 +29,8 @@ struct OpenRISCCPU;
 
 #define TYPE_OPENRISC_CPU "or1k-cpu"
 
-typedef struct OpenRISCCPU OpenRISCCPU;
-typedef struct OpenRISCCPUClass OpenRISCCPUClass;
-DECLARE_OBJ_CHECKERS(OpenRISCCPU, OpenRISCCPUClass,
-                     OPENRISC_CPU, TYPE_OPENRISC_CPU)
+OBJECT_DECLARE_TYPE(OpenRISCCPU, OpenRISCCPUClass,
+                    openrisc_cpu, OPENRISC_CPU)
 
 /**
  * OpenRISCCPUClass:
diff --git a/target/ppc/cpu-qom.h b/target/ppc/cpu-qom.h
index f7e600c7b3..5cf806a3a6 100644
--- a/target/ppc/cpu-qom.h
+++ b/target/ppc/cpu-qom.h
@@ -29,10 +29,8 @@
 #define TYPE_POWERPC_CPU "powerpc-cpu"
 #endif
 
-typedef struct PowerPCCPU PowerPCCPU;
-typedef struct PowerPCCPUClass PowerPCCPUClass;
-DECLARE_OBJ_CHECKERS(PowerPCCPU, PowerPCCPUClass,
-                     POWERPC_CPU, TYPE_POWERPC_CPU)
+OBJECT_DECLARE_TYPE(PowerPCCPU, PowerPCCPUClass,
+                    powerpc_cpu, POWERPC_CPU)
 
 typedef struct CPUPPCState CPUPPCState;
 typedef struct ppc_tb_t ppc_tb_t;
diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 07807a8f20..48484653c9 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -232,10 +232,8 @@ struct CPURISCVState {
     QEMUTimer *timer; /* Internal timer */
 };
 
-typedef struct RISCVCPU RISCVCPU;
-typedef struct RISCVCPUClass RISCVCPUClass;
-DECLARE_OBJ_CHECKERS(RISCVCPU, RISCVCPUClass,
-                     RISCV_CPU, TYPE_RISCV_CPU)
+OBJECT_DECLARE_TYPE(RISCVCPU, RISCVCPUClass,
+                    riscv_cpu, RISCV_CPU)
 
 /**
  * RISCVCPUClass:
diff --git a/target/s390x/cpu-qom.h b/target/s390x/cpu-qom.h
index 5f0dccdac1..e2b2513711 100644
--- a/target/s390x/cpu-qom.h
+++ b/target/s390x/cpu-qom.h
@@ -25,10 +25,8 @@
 
 #define TYPE_S390_CPU "s390x-cpu"
 
-typedef struct S390CPU S390CPU;
-typedef struct S390CPUClass S390CPUClass;
-DECLARE_OBJ_CHECKERS(S390CPU, S390CPUClass,
-                     S390_CPU, TYPE_S390_CPU)
+OBJECT_DECLARE_TYPE(S390CPU, S390CPUClass,
+                    s390_cpu, S390_CPU)
 
 typedef struct S390CPUModel S390CPUModel;
 typedef struct S390CPUDef S390CPUDef;
diff --git a/target/sh4/cpu-qom.h b/target/sh4/cpu-qom.h
index b04b2bb4bf..595814b8cb 100644
--- a/target/sh4/cpu-qom.h
+++ b/target/sh4/cpu-qom.h
@@ -29,10 +29,8 @@
 #define TYPE_SH7751R_CPU SUPERH_CPU_TYPE_NAME("sh7751r")
 #define TYPE_SH7785_CPU  SUPERH_CPU_TYPE_NAME("sh7785")
 
-typedef struct SuperHCPU SuperHCPU;
-typedef struct SuperHCPUClass SuperHCPUClass;
-DECLARE_OBJ_CHECKERS(SuperHCPU, SuperHCPUClass,
-                     SUPERH_CPU, TYPE_SUPERH_CPU)
+OBJECT_DECLARE_TYPE(SuperHCPU, SuperHCPUClass,
+                    superh_cpu, SUPERH_CPU)
 
 /**
  * SuperHCPUClass:
diff --git a/target/sparc/cpu-qom.h b/target/sparc/cpu-qom.h
index 42cb631d45..5d7fb727bc 100644
--- a/target/sparc/cpu-qom.h
+++ b/target/sparc/cpu-qom.h
@@ -29,10 +29,8 @@
 #define TYPE_SPARC_CPU "sparc-cpu"
 #endif
 
-typedef struct SPARCCPU SPARCCPU;
-typedef struct SPARCCPUClass SPARCCPUClass;
-DECLARE_OBJ_CHECKERS(SPARCCPU, SPARCCPUClass,
-                     SPARC_CPU, TYPE_SPARC_CPU)
+OBJECT_DECLARE_TYPE(SPARCCPU, SPARCCPUClass,
+                    sparc_cpu, SPARC_CPU)
 
 typedef struct sparc_def_t sparc_def_t;
 /**
diff --git a/target/tilegx/cpu.h b/target/tilegx/cpu.h
index d4cf70dc15..d251ff80b8 100644
--- a/target/tilegx/cpu.h
+++ b/target/tilegx/cpu.h
@@ -99,10 +99,8 @@ typedef struct CPUTLGState {
 
 #define TYPE_TILEGX_CPU "tilegx-cpu"
 
-typedef struct TileGXCPU TileGXCPU;
-typedef struct TileGXCPUClass TileGXCPUClass;
-DECLARE_OBJ_CHECKERS(TileGXCPU, TileGXCPUClass,
-                     TILEGX_CPU, TYPE_TILEGX_CPU)
+OBJECT_DECLARE_TYPE(TileGXCPU, TileGXCPUClass,
+                    tilegx_cpu, TILEGX_CPU)
 
 /**
  * TileGXCPUClass:
diff --git a/target/tricore/cpu-qom.h b/target/tricore/cpu-qom.h
index 1988c26093..9e588c4c34 100644
--- a/target/tricore/cpu-qom.h
+++ b/target/tricore/cpu-qom.h
@@ -24,10 +24,8 @@
 
 #define TYPE_TRICORE_CPU "tricore-cpu"
 
-typedef struct TriCoreCPU TriCoreCPU;
-typedef struct TriCoreCPUClass TriCoreCPUClass;
-DECLARE_OBJ_CHECKERS(TriCoreCPU, TriCoreCPUClass,
-                     TRICORE_CPU, TYPE_TRICORE_CPU)
+OBJECT_DECLARE_TYPE(TriCoreCPU, TriCoreCPUClass,
+                    tricore_cpu, TRICORE_CPU)
 
 struct TriCoreCPUClass {
     /*< private >*/
diff --git a/target/unicore32/cpu-qom.h b/target/unicore32/cpu-qom.h
index 5b67ac532d..c914273058 100644
--- a/target/unicore32/cpu-qom.h
+++ b/target/unicore32/cpu-qom.h
@@ -16,10 +16,8 @@
 
 #define TYPE_UNICORE32_CPU "unicore32-cpu"
 
-typedef struct UniCore32CPU UniCore32CPU;
-typedef struct UniCore32CPUClass UniCore32CPUClass;
-DECLARE_OBJ_CHECKERS(UniCore32CPU, UniCore32CPUClass,
-                     UNICORE32_CPU, TYPE_UNICORE32_CPU)
+OBJECT_DECLARE_TYPE(UniCore32CPU, UniCore32CPUClass,
+                    unicore32_cpu, UNICORE32_CPU)
 
 /**
  * UniCore32CPUClass:
diff --git a/target/xtensa/cpu-qom.h b/target/xtensa/cpu-qom.h
index ef13262b42..299ce3e63c 100644
--- a/target/xtensa/cpu-qom.h
+++ b/target/xtensa/cpu-qom.h
@@ -34,10 +34,8 @@
 
 #define TYPE_XTENSA_CPU "xtensa-cpu"
 
-typedef struct XtensaCPU XtensaCPU;
-typedef struct XtensaCPUClass XtensaCPUClass;
-DECLARE_OBJ_CHECKERS(XtensaCPU, XtensaCPUClass,
-                     XTENSA_CPU, TYPE_XTENSA_CPU)
+OBJECT_DECLARE_TYPE(XtensaCPU, XtensaCPUClass,
+                    xtensa_cpu, XTENSA_CPU)
 
 typedef struct XtensaConfig XtensaConfig;
 
diff --git a/backends/dbus-vmstate.c b/backends/dbus-vmstate.c
index 790bc9d728..55aea64af5 100644
--- a/backends/dbus-vmstate.c
+++ b/backends/dbus-vmstate.c
@@ -21,12 +21,10 @@
 #include "trace.h"
 #include "qom/object.h"
 
-typedef struct DBusVMState DBusVMState;
-typedef struct DBusVMStateClass DBusVMStateClass;
 
 #define TYPE_DBUS_VMSTATE "dbus-vmstate"
-DECLARE_OBJ_CHECKERS(DBusVMState, DBusVMStateClass,
-                     DBUS_VMSTATE, TYPE_DBUS_VMSTATE)
+OBJECT_DECLARE_TYPE(DBusVMState, DBusVMStateClass,
+                    dbus_vmstate, DBUS_VMSTATE)
 
 struct DBusVMStateClass {
     ObjectClass parent_class;
diff --git a/ui/input-barrier.c b/ui/input-barrier.c
index ece32a56e6..6ff0a23ddb 100644
--- a/ui/input-barrier.c
+++ b/ui/input-barrier.c
@@ -20,10 +20,8 @@
 #include "input-barrier.h"
 
 #define TYPE_INPUT_BARRIER "input-barrier"
-typedef struct InputBarrier InputBarrier;
-typedef struct InputBarrierClass InputBarrierClass;
-DECLARE_OBJ_CHECKERS(InputBarrier, InputBarrierClass,
-                     INPUT_BARRIER, TYPE_INPUT_BARRIER)
+OBJECT_DECLARE_TYPE(InputBarrier, InputBarrierClass,
+                    input_barrier, INPUT_BARRIER)
 
 
 #define MAX_HELLO_LENGTH 1024
diff --git a/ui/input-linux.c b/ui/input-linux.c
index 77988e8c71..d916c1eec1 100644
--- a/ui/input-linux.c
+++ b/ui/input-linux.c
@@ -31,10 +31,8 @@ static bool linux_is_button(unsigned int lnx)
 }
 
 #define TYPE_INPUT_LINUX "input-linux"
-typedef struct InputLinux InputLinux;
-typedef struct InputLinuxClass InputLinuxClass;
-DECLARE_OBJ_CHECKERS(InputLinux, InputLinuxClass,
-                     INPUT_LINUX, TYPE_INPUT_LINUX)
+OBJECT_DECLARE_TYPE(InputLinux, InputLinuxClass,
+                    input_linux, INPUT_LINUX)
 
 
 struct InputLinux {
-- 
2.26.2


