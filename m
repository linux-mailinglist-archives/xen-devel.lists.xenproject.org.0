Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DC16265E77D
	for <lists+xen-devel@lfdr.de>; Thu,  5 Jan 2023 10:16:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.471749.731736 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pDMMC-00014C-Lj; Thu, 05 Jan 2023 09:16:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 471749.731736; Thu, 05 Jan 2023 09:16:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pDMMC-00011s-Hm; Thu, 05 Jan 2023 09:16:16 +0000
Received: by outflank-mailman (input) for mailman id 471749;
 Thu, 05 Jan 2023 09:16:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=+8dv=5C=redhat.com=mst@srs-se1.protection.inumbo.net>)
 id 1pDMMA-0000fR-OH
 for xen-devel@lists.xenproject.org; Thu, 05 Jan 2023 09:16:15 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 977c9566-8cd9-11ed-b8d0-410ff93cb8f0;
 Thu, 05 Jan 2023 10:16:10 +0100 (CET)
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-190-4sSTT-oqNt-XxeRmToRbUw-1; Thu, 05 Jan 2023 04:16:07 -0500
Received: by mail-wm1-f70.google.com with SMTP id
 c23-20020a7bc857000000b003d97c8d4935so15190818wml.8
 for <xen-devel@lists.xenproject.org>; Thu, 05 Jan 2023 01:16:07 -0800 (PST)
Received: from redhat.com ([2.52.151.85]) by smtp.gmail.com with ESMTPSA id
 g41-20020a05600c4ca900b003cfd0bd8c0asm1541324wmp.30.2023.01.05.01.15.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Jan 2023 01:16:04 -0800 (PST)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: 977c9566-8cd9-11ed-b8d0-410ff93cb8f0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1672910169;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=9E0uGbaHWSARDpwjIvxsxquPxCSk2QGI6Ma+Y/5MGDY=;
	b=OwnTmi68GSJuI4G7MsG6R8JuxBfwFMowpHaa+4inKJc3c05jbHtQw0UscNKWxSAVnCRS+0
	V+f1Srh9j0MvRE3gwVwlio4QGGTlst9ClHncIKhHutI1mmaAJXwyCK9pie5mvcwoRI9+PB
	AjtLQxp6goMwXOfVOzVxhFDCJeZdxrI=
X-MC-Unique: 4sSTT-oqNt-XxeRmToRbUw-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9E0uGbaHWSARDpwjIvxsxquPxCSk2QGI6Ma+Y/5MGDY=;
        b=7/nMtyW0wSGa2lhuXYUFgcmf1RWAaynhcA2V1IQfnfIR/2JGAMEdwQU6erXavZPyyy
         hCj1NQ0dFv5acKz7VNK2JFuEvYLsjYNreFOW4q92Y5gXbTXWGyjnnypEX5YXwotDjZjM
         Jj03V6u25GGJTPAOu5lEZNELrGavpEJbkUXxjQtzTzJbCB0aYy/VLAVLsI9CBCrvaXUC
         rTJJ219yjOAm4h5+ZxlV3XNe5rEfLda1xasYFebBMn1VHUYu1IeyeqEYCGuWct01t7pM
         52h92gbunLR5NyLLxSl0FnNFsXjwYaI4zjhjtQBlakJ3/BENWdCPTyr5WoZNWTNwY3VX
         z5WQ==
X-Gm-Message-State: AFqh2krhZusXrtSlmZAq5vcySSGhDJTvP17Rssd/GV69TN68X+pAFq9B
	VsJ/9GP6Twd0+K9CWl6tJ6Rb7QfDRbrDUFEbjSvul+r3fWMD02bsHy04QxkmAxXcvqO0KCv40/O
	QXe0NhHMhKy8HbbdTc6da3Nr+X0g=
X-Received: by 2002:a05:600c:44d4:b0:3cf:7925:7a3 with SMTP id f20-20020a05600c44d400b003cf792507a3mr35414326wmo.24.1672910165830;
        Thu, 05 Jan 2023 01:16:05 -0800 (PST)
X-Google-Smtp-Source: AMrXdXtomsIn8w+yG1vNX43EiWLehS044MzumjQUALNU2pfPKqSwYO6JSwdk86MB9u4hPAZrggu7uA==
X-Received: by 2002:a05:600c:44d4:b0:3cf:7925:7a3 with SMTP id f20-20020a05600c44d400b003cf792507a3mr35414200wmo.24.1672910164789;
        Thu, 05 Jan 2023 01:16:04 -0800 (PST)
Date: Thu, 5 Jan 2023 04:15:55 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Markus Armbruster <armbru@redhat.com>,
	Igor Mammedov <imammedo@redhat.com>, Ani Sinha <ani@anisinha.ca>,
	Gerd Hoffmann <kraxel@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
	Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>,
	Eduardo Habkost <eduardo@habkost.net>,
	BALATON Zoltan <balaton@eik.bme.hu>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Anthony Perard <anthony.perard@citrix.com>,
	Paul Durrant <paul@xen.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	John Snow <jsnow@redhat.com>, Alberto Garcia <berto@igalia.com>,
	Corey Minyard <minyard@acm.org>,
	=?utf-8?B?SGVydsOp?= Poussineau <hpoussin@reactos.org>,
	Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Aurelien Jarno <aurelien@aurel32.net>,
	Pavel Pisa <pisa@cmp.felk.cvut.cz>,
	Vikram Garhwal <fnu.vikram@xilinx.com>,
	Jason Wang <jasowang@redhat.com>,
	Dmitry Fleytman <dmitry.fleytman@gmail.com>,
	Stefan Weil <sw@weilnetz.de>, Jiri Pirko <jiri@resnulli.us>,
	Sven Schnelle <svens@stackframe.org>,
	Keith Busch <kbusch@kernel.org>, Klaus Jensen <its@irrelevant.dk>,
	Huacai Chen <chenhuacai@kernel.org>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>, Helge Deller <deller@gmx.de>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	Yoshinori Sato <ysato@users.sourceforge.jp>,
	Magnus Damm <magnus.damm@gmail.com>,
	Daniel Henrique Barboza <danielhb413@gmail.com>,
	=?utf-8?Q?C=C3=A9dric?= Le Goater <clg@kaod.org>,
	David Gibson <david@gibson.dropbear.id.au>,
	Greg Kurz <groug@kaod.org>, Yuval Shaia <yuval.shaia.ml@gmail.com>,
	Matthew Rosato <mjrosato@linux.ibm.com>,
	Eric Farman <farman@linux.ibm.com>,
	David Hildenbrand <david@redhat.com>,
	Ilya Leoshkevich <iii@linux.ibm.com>,
	Halil Pasic <pasic@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Thomas Huth <thuth@redhat.com>, Fam Zheng <fam@euphon.net>,
	Alex Williamson <alex.williamson@redhat.com>,
	Beniamino Galvani <b.galvani@gmail.com>,
	Ben Widawsky <ben.widawsky@intel.com>,
	Jonathan Cameron <jonathan.cameron@huawei.com>,
	Elena Ufimtseva <elena.ufimtseva@oracle.com>,
	Jagannathan Raman <jag.raman@oracle.com>,
	John G Johnson <john.g.johnson@oracle.com>,
	Bin Meng <bin.meng@windriver.com>,
	Alexander Bulekov <alxndr@bu.edu>, Bandan Das <bsd@redhat.com>,
	Stefan Hajnoczi <stefanha@redhat.com>,
	Darren Kenny <darren.kenny@oracle.com>,
	Qiuhao Li <Qiuhao.Li@outlook.com>,
	Laurent Vivier <lvivier@redhat.com>, qemu-ppc@nongnu.org,
	xen-devel@lists.xenproject.org, qemu-block@nongnu.org,
	qemu-arm@nongnu.org, qemu-s390x@nongnu.org
Subject: [PULL 31/51] include/hw/pci: Split pci_device.h off pci.h
Message-ID: <20230105091310.263867-32-mst@redhat.com>
References: <20230105091310.263867-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20230105091310.263867-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

From: Markus Armbruster <armbru@redhat.com>

PCIDeviceClass and PCIDevice are defined in pci.h.  Many users of the
header don't actually need them.  Similar structs live in their own
headers: PCIBusClass and PCIBus in pci_bus.h, PCIBridge in
pci_bridge.h, PCIHostBridgeClass and PCIHostState in pci_host.h,
PCIExpressHost in pcie_host.h, and PCIERootPortClass, PCIEPort, and
PCIESlot in pcie_port.h.

Move PCIDeviceClass and PCIDeviceClass to new pci_device.h, along with
the code that needs them.  Adjust include directives.

This also enables the next commit.

Signed-off-by: Markus Armbruster <armbru@redhat.com>
Message-Id: <20221222100330.380143-6-armbru@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/display/ati_int.h             |   2 +-
 hw/display/qxl.h                 |   3 +-
 hw/ide/ahci_internal.h           |   2 +-
 hw/net/vmxnet3_defs.h            |   2 +-
 hw/nvme/nvme.h                   |   2 +-
 hw/rdma/vmw/pvrdma.h             |   1 +
 hw/scsi/mptsas.h                 |   2 +-
 hw/usb/hcd-ehci.h                |   2 +-
 hw/usb/hcd-uhci.h                |   2 +-
 hw/usb/hcd-xhci-pci.h            |   1 +
 hw/vfio/pci.h                    |   2 +-
 include/hw/acpi/piix4.h          |   2 +-
 include/hw/arm/allwinner-a10.h   |   1 +
 include/hw/cxl/cxl_device.h      |   2 +-
 include/hw/ide/pci.h             |   2 +-
 include/hw/misc/macio/macio.h    |   2 +-
 include/hw/pci-host/gpex.h       |   2 +-
 include/hw/pci-host/i440fx.h     |   2 +-
 include/hw/pci-host/q35.h        |   2 +-
 include/hw/pci-host/sabre.h      |   2 +-
 include/hw/pci/msi.h             |   2 +-
 include/hw/pci/pci.h             | 344 ------------------------------
 include/hw/pci/pci_bridge.h      |   2 +-
 include/hw/pci/pci_device.h      | 350 +++++++++++++++++++++++++++++++
 include/hw/pci/pcie_port.h       |   1 +
 include/hw/pci/shpc.h            |   2 +-
 include/hw/remote/iohub.h        |   2 +-
 include/hw/remote/proxy.h        |   2 +-
 include/hw/sd/sdhci.h            |   2 +-
 include/hw/southbridge/piix.h    |   3 +-
 include/hw/xen/xen_common.h      |   2 +-
 hw/acpi/erst.c                   |   2 +-
 hw/audio/ac97.c                  |   2 +-
 hw/audio/es1370.c                |   2 +-
 hw/audio/via-ac97.c              |   2 +-
 hw/char/serial-pci-multi.c       |   2 +-
 hw/char/serial-pci.c             |   2 +-
 hw/core/qdev-properties-system.c |   1 +
 hw/display/bochs-display.c       |   2 +-
 hw/display/cirrus_vga.c          |   2 +-
 hw/display/sm501.c               |   2 +-
 hw/display/vga-pci.c             |   2 +-
 hw/display/vmware_vga.c          |   2 +-
 hw/i386/xen/xen_pvdevice.c       |   2 +-
 hw/ipack/tpci200.c               |   2 +-
 hw/ipmi/pci_ipmi_bt.c            |   2 +-
 hw/ipmi/pci_ipmi_kcs.c           |   2 +-
 hw/isa/i82378.c                  |   2 +-
 hw/mips/gt64xxx_pci.c            |   2 +-
 hw/misc/pci-testdev.c            |   2 +-
 hw/misc/pvpanic-pci.c            |   2 +-
 hw/net/can/can_kvaser_pci.c      |   2 +-
 hw/net/can/can_mioe3680_pci.c    |   2 +-
 hw/net/can/can_pcm3680_pci.c     |   2 +-
 hw/net/can/ctucan_pci.c          |   2 +-
 hw/net/e1000.c                   |   2 +-
 hw/net/e1000x_common.c           |   2 +-
 hw/net/eepro100.c                |   2 +-
 hw/net/ne2000-pci.c              |   2 +-
 hw/net/net_tx_pkt.c              |   2 +-
 hw/net/pcnet-pci.c               |   2 +-
 hw/net/rocker/rocker.c           |   2 +-
 hw/net/rocker/rocker_desc.c      |   2 +-
 hw/net/rtl8139.c                 |   2 +-
 hw/net/sungem.c                  |   2 +-
 hw/net/sunhme.c                  |   2 +-
 hw/net/tulip.c                   |   2 +-
 hw/net/virtio-net.c              |   2 +-
 hw/pci-host/bonito.c             |   2 +-
 hw/pci-host/dino.c               |   2 +-
 hw/pci-host/grackle.c            |   2 +-
 hw/pci-host/mv64361.c            |   2 +-
 hw/pci-host/ppce500.c            |   2 +-
 hw/pci-host/raven.c              |   2 +-
 hw/pci-host/sh_pci.c             |   2 +-
 hw/pci-host/uninorth.c           |   2 +-
 hw/pci-host/versatile.c          |   2 +-
 hw/pci/pci-hmp-cmds.c            |   1 +
 hw/pci/pcie_host.c               |   2 +-
 hw/pci/pcie_sriov.c              |   2 +-
 hw/pci/slotid_cap.c              |   2 +-
 hw/ppc/ppc440_pcix.c             |   2 +-
 hw/ppc/ppc4xx_pci.c              |   2 +-
 hw/ppc/spapr_pci_vfio.c          |   1 +
 hw/rdma/rdma_utils.c             |   2 +-
 hw/s390x/s390-pci-inst.c         |   1 +
 hw/scsi/esp-pci.c                |   2 +-
 hw/scsi/lsi53c895a.c             |   2 +-
 hw/smbios/smbios.c               |   1 +
 hw/usb/hcd-ohci-pci.c            |   2 +-
 hw/watchdog/wdt_i6300esb.c       |   2 +-
 tests/qtest/fuzz/generic_fuzz.c  |   1 +
 ui/util.c                        |   2 +-
 93 files changed, 441 insertions(+), 427 deletions(-)
 create mode 100644 include/hw/pci/pci_device.h

diff --git a/hw/display/ati_int.h b/hw/display/ati_int.h
index 8acb9c7466..e8d3c7af75 100644
--- a/hw/display/ati_int.h
+++ b/hw/display/ati_int.h
@@ -10,7 +10,7 @@
 #define ATI_INT_H
 
 #include "qemu/timer.h"
-#include "hw/pci/pci.h"
+#include "hw/pci/pci_device.h"
 #include "hw/i2c/bitbang_i2c.h"
 #include "vga_int.h"
 #include "qom/object.h"
diff --git a/hw/display/qxl.h b/hw/display/qxl.h
index 7894bd5134..cd82c7a6fe 100644
--- a/hw/display/qxl.h
+++ b/hw/display/qxl.h
@@ -1,8 +1,7 @@
 #ifndef HW_QXL_H
 #define HW_QXL_H
 
-
-#include "hw/pci/pci.h"
+#include "hw/pci/pci_device.h"
 #include "vga_int.h"
 #include "qemu/thread.h"
 
diff --git a/hw/ide/ahci_internal.h b/hw/ide/ahci_internal.h
index 109de9e2d1..303fcd7235 100644
--- a/hw/ide/ahci_internal.h
+++ b/hw/ide/ahci_internal.h
@@ -26,7 +26,7 @@
 
 #include "hw/ide/ahci.h"
 #include "hw/ide/internal.h"
-#include "hw/pci/pci.h"
+#include "hw/pci/pci_device.h"
 
 #define AHCI_MEM_BAR_SIZE         0x1000
 #define AHCI_MAX_PORTS            32
diff --git a/hw/net/vmxnet3_defs.h b/hw/net/vmxnet3_defs.h
index 71440509ca..64034af6d5 100644
--- a/hw/net/vmxnet3_defs.h
+++ b/hw/net/vmxnet3_defs.h
@@ -19,7 +19,7 @@
 
 #include "net/net.h"
 #include "hw/net/vmxnet3.h"
-#include "qom/object.h"
+#include "hw/pci/pci_device.h"
 
 #define TYPE_VMXNET3 "vmxnet3"
 typedef struct VMXNET3State VMXNET3State;
diff --git a/hw/nvme/nvme.h b/hw/nvme/nvme.h
index 7adf042ec3..16da27a69b 100644
--- a/hw/nvme/nvme.h
+++ b/hw/nvme/nvme.h
@@ -19,7 +19,7 @@
 #define HW_NVME_NVME_H
 
 #include "qemu/uuid.h"
-#include "hw/pci/pci.h"
+#include "hw/pci/pci_device.h"
 #include "hw/block/block.h"
 
 #include "block/nvme.h"
diff --git a/hw/rdma/vmw/pvrdma.h b/hw/rdma/vmw/pvrdma.h
index 0caf95ede8..4cbc10c980 100644
--- a/hw/rdma/vmw/pvrdma.h
+++ b/hw/rdma/vmw/pvrdma.h
@@ -19,6 +19,7 @@
 #include "qemu/units.h"
 #include "qemu/notify.h"
 #include "hw/pci/msix.h"
+#include "hw/pci/pci_device.h"
 #include "chardev/char-fe.h"
 #include "hw/net/vmxnet3_defs.h"
 
diff --git a/hw/scsi/mptsas.h b/hw/scsi/mptsas.h
index c046497db7..04e97ce3af 100644
--- a/hw/scsi/mptsas.h
+++ b/hw/scsi/mptsas.h
@@ -2,7 +2,7 @@
 #define MPTSAS_H
 
 #include "mpi.h"
-#include "qom/object.h"
+#include "hw/pci/pci_device.h"
 
 #define MPTSAS_NUM_PORTS 8
 #define MPTSAS_MAX_FRAMES 2048     /* Firmware limit at 65535 */
diff --git a/hw/usb/hcd-ehci.h b/hw/usb/hcd-ehci.h
index 4d4b2830b7..2cd821f49e 100644
--- a/hw/usb/hcd-ehci.h
+++ b/hw/usb/hcd-ehci.h
@@ -21,7 +21,7 @@
 #include "qemu/timer.h"
 #include "hw/usb.h"
 #include "sysemu/dma.h"
-#include "hw/pci/pci.h"
+#include "hw/pci/pci_device.h"
 #include "hw/sysbus.h"
 
 #ifndef EHCI_DEBUG
diff --git a/hw/usb/hcd-uhci.h b/hw/usb/hcd-uhci.h
index c85ab7868e..5843af504a 100644
--- a/hw/usb/hcd-uhci.h
+++ b/hw/usb/hcd-uhci.h
@@ -30,7 +30,7 @@
 
 #include "exec/memory.h"
 #include "qemu/timer.h"
-#include "hw/pci/pci.h"
+#include "hw/pci/pci_device.h"
 #include "hw/usb.h"
 
 typedef struct UHCIQueue UHCIQueue;
diff --git a/hw/usb/hcd-xhci-pci.h b/hw/usb/hcd-xhci-pci.h
index c193f79443..08f70ce97c 100644
--- a/hw/usb/hcd-xhci-pci.h
+++ b/hw/usb/hcd-xhci-pci.h
@@ -24,6 +24,7 @@
 #ifndef HW_USB_HCD_XHCI_PCI_H
 #define HW_USB_HCD_XHCI_PCI_H
 
+#include "hw/pci/pci_device.h"
 #include "hw/usb.h"
 #include "hcd-xhci.h"
 
diff --git a/hw/vfio/pci.h b/hw/vfio/pci.h
index 7c236a52f4..177abcc8fb 100644
--- a/hw/vfio/pci.h
+++ b/hw/vfio/pci.h
@@ -13,7 +13,7 @@
 #define HW_VFIO_VFIO_PCI_H
 
 #include "exec/memory.h"
-#include "hw/pci/pci.h"
+#include "hw/pci/pci_device.h"
 #include "hw/vfio/vfio-common.h"
 #include "qemu/event_notifier.h"
 #include "qemu/queue.h"
diff --git a/include/hw/acpi/piix4.h b/include/hw/acpi/piix4.h
index 32686a75c5..be1f8ea80e 100644
--- a/include/hw/acpi/piix4.h
+++ b/include/hw/acpi/piix4.h
@@ -22,7 +22,7 @@
 #ifndef HW_ACPI_PIIX4_H
 #define HW_ACPI_PIIX4_H
 
-#include "hw/pci/pci.h"
+#include "hw/pci/pci_device.h"
 #include "hw/acpi/acpi.h"
 #include "hw/acpi/cpu_hotplug.h"
 #include "hw/acpi/memory_hotplug.h"
diff --git a/include/hw/arm/allwinner-a10.h b/include/hw/arm/allwinner-a10.h
index a76dc7b84d..f9240ffa64 100644
--- a/include/hw/arm/allwinner-a10.h
+++ b/include/hw/arm/allwinner-a10.h
@@ -4,6 +4,7 @@
 #include "qemu/error-report.h"
 #include "hw/char/serial.h"
 #include "hw/arm/boot.h"
+#include "hw/pci/pci_device.h"
 #include "hw/timer/allwinner-a10-pit.h"
 #include "hw/intc/allwinner-a10-pic.h"
 #include "hw/net/allwinner_emac.h"
diff --git a/include/hw/cxl/cxl_device.h b/include/hw/cxl/cxl_device.h
index 3f91969db0..250adf18b2 100644
--- a/include/hw/cxl/cxl_device.h
+++ b/include/hw/cxl/cxl_device.h
@@ -11,7 +11,7 @@
 #define CXL_DEVICE_H
 
 #include "hw/cxl/cxl_component.h"
-#include "hw/pci/pci.h"
+#include "hw/pci/pci_device.h"
 #include "hw/register.h"
 
 /*
diff --git a/include/hw/ide/pci.h b/include/hw/ide/pci.h
index d8384e1c42..2a6284acac 100644
--- a/include/hw/ide/pci.h
+++ b/include/hw/ide/pci.h
@@ -2,7 +2,7 @@
 #define HW_IDE_PCI_H
 
 #include "hw/ide/internal.h"
-#include "hw/pci/pci.h"
+#include "hw/pci/pci_device.h"
 #include "qom/object.h"
 
 #define BM_STATUS_DMAING 0x01
diff --git a/include/hw/misc/macio/macio.h b/include/hw/misc/macio/macio.h
index 95d30a1745..86df2c2b60 100644
--- a/include/hw/misc/macio/macio.h
+++ b/include/hw/misc/macio/macio.h
@@ -27,7 +27,7 @@
 #define MACIO_H
 
 #include "hw/char/escc.h"
-#include "hw/pci/pci.h"
+#include "hw/pci/pci_device.h"
 #include "hw/ide/internal.h"
 #include "hw/intc/heathrow_pic.h"
 #include "hw/misc/macio/cuda.h"
diff --git a/include/hw/pci-host/gpex.h b/include/hw/pci-host/gpex.h
index fcf8b63820..b0240bd768 100644
--- a/include/hw/pci-host/gpex.h
+++ b/include/hw/pci-host/gpex.h
@@ -22,7 +22,7 @@
 
 #include "exec/hwaddr.h"
 #include "hw/sysbus.h"
-#include "hw/pci/pci.h"
+#include "hw/pci/pci_device.h"
 #include "hw/pci/pcie_host.h"
 #include "qom/object.h"
 
diff --git a/include/hw/pci-host/i440fx.h b/include/hw/pci-host/i440fx.h
index fc93e22732..bf57216c78 100644
--- a/include/hw/pci-host/i440fx.h
+++ b/include/hw/pci-host/i440fx.h
@@ -11,7 +11,7 @@
 #ifndef HW_PCI_I440FX_H
 #define HW_PCI_I440FX_H
 
-#include "hw/pci/pci.h"
+#include "hw/pci/pci_device.h"
 #include "hw/pci-host/pam.h"
 #include "qom/object.h"
 
diff --git a/include/hw/pci-host/q35.h b/include/hw/pci-host/q35.h
index ab989698ef..e89329c51e 100644
--- a/include/hw/pci-host/q35.h
+++ b/include/hw/pci-host/q35.h
@@ -22,7 +22,7 @@
 #ifndef HW_Q35_H
 #define HW_Q35_H
 
-#include "hw/pci/pci.h"
+#include "hw/pci/pci_device.h"
 #include "hw/pci/pcie_host.h"
 #include "hw/pci-host/pam.h"
 #include "qemu/units.h"
diff --git a/include/hw/pci-host/sabre.h b/include/hw/pci-host/sabre.h
index 01190241bb..d12de84ea2 100644
--- a/include/hw/pci-host/sabre.h
+++ b/include/hw/pci-host/sabre.h
@@ -1,7 +1,7 @@
 #ifndef HW_PCI_HOST_SABRE_H
 #define HW_PCI_HOST_SABRE_H
 
-#include "hw/pci/pci.h"
+#include "hw/pci/pci_device.h"
 #include "hw/pci/pci_host.h"
 #include "hw/sparc/sun4u_iommu.h"
 #include "qom/object.h"
diff --git a/include/hw/pci/msi.h b/include/hw/pci/msi.h
index 58aa576215..ee8ee469a6 100644
--- a/include/hw/pci/msi.h
+++ b/include/hw/pci/msi.h
@@ -21,7 +21,7 @@
 #ifndef QEMU_MSI_H
 #define QEMU_MSI_H
 
-#include "hw/pci/pci.h"
+#include "hw/pci/pci_device.h"
 
 struct MSIMessage {
     uint64_t address;
diff --git a/include/hw/pci/pci.h b/include/hw/pci/pci.h
index 5ca2a9df58..7048a373d1 100644
--- a/include/hw/pci/pci.h
+++ b/include/hw/pci/pci.h
@@ -166,7 +166,6 @@ enum {
 #define QEMU_PCI_VGA_IO_HI_SIZE 0x20
 
 #include "hw/pci/pci_regs.h"
-#include "hw/pci/pcie.h"
 
 /* PCI HEADER_TYPE */
 #define  PCI_HEADER_TYPE_MULTI_FUNCTION 0x80
@@ -210,23 +209,6 @@ enum {
     QEMU_PCIE_CAP_CXL = (1 << QEMU_PCIE_CXL_BITNR),
 };
 
-#define TYPE_PCI_DEVICE "pci-device"
-typedef struct PCIDeviceClass PCIDeviceClass;
-DECLARE_OBJ_CHECKERS(PCIDevice, PCIDeviceClass,
-                     PCI_DEVICE, TYPE_PCI_DEVICE)
-
-/*
- * Implemented by devices that can be plugged on CXL buses. In the spec, this is
- * actually a "CXL Component, but we name it device to match the PCI naming.
- */
-#define INTERFACE_CXL_DEVICE "cxl-device"
-
-/* Implemented by devices that can be plugged on PCI Express buses */
-#define INTERFACE_PCIE_DEVICE "pci-express-device"
-
-/* Implemented by devices that can be plugged on Conventional PCI buses */
-#define INTERFACE_CONVENTIONAL_PCI_DEVICE "conventional-pci-device"
-
 typedef struct PCIINTxRoute {
     enum {
         PCI_INTX_ENABLED,
@@ -236,24 +218,6 @@ typedef struct PCIINTxRoute {
     int irq;
 } PCIINTxRoute;
 
-struct PCIDeviceClass {
-    DeviceClass parent_class;
-
-    void (*realize)(PCIDevice *dev, Error **errp);
-    PCIUnregisterFunc *exit;
-    PCIConfigReadFunc *config_read;
-    PCIConfigWriteFunc *config_write;
-
-    uint16_t vendor_id;
-    uint16_t device_id;
-    uint8_t revision;
-    uint16_t class_id;
-    uint16_t subsystem_vendor_id;       /* only for header type = 0 */
-    uint16_t subsystem_id;              /* only for header type = 0 */
-
-    const char *romfile;                /* rom bar */
-};
-
 typedef void (*PCIINTxRoutingNotifier)(PCIDevice *dev);
 typedef int (*MSIVectorUseNotifier)(PCIDevice *dev, unsigned int vector,
                                       MSIMessage msg);
@@ -262,129 +226,6 @@ typedef void (*MSIVectorPollNotifier)(PCIDevice *dev,
                                       unsigned int vector_start,
                                       unsigned int vector_end);
 
-enum PCIReqIDType {
-    PCI_REQ_ID_INVALID = 0,
-    PCI_REQ_ID_BDF,
-    PCI_REQ_ID_SECONDARY_BUS,
-    PCI_REQ_ID_MAX,
-};
-typedef enum PCIReqIDType PCIReqIDType;
-
-struct PCIReqIDCache {
-    PCIDevice *dev;
-    PCIReqIDType type;
-};
-typedef struct PCIReqIDCache PCIReqIDCache;
-
-struct PCIDevice {
-    DeviceState qdev;
-    bool partially_hotplugged;
-    bool has_power;
-
-    /* PCI config space */
-    uint8_t *config;
-
-    /*
-     * Used to enable config checks on load. Note that writable bits are
-     * never checked even if set in cmask.
-     */
-    uint8_t *cmask;
-
-    /* Used to implement R/W bytes */
-    uint8_t *wmask;
-
-    /* Used to implement RW1C(Write 1 to Clear) bytes */
-    uint8_t *w1cmask;
-
-    /* Used to allocate config space for capabilities. */
-    uint8_t *used;
-
-    /* the following fields are read only */
-    int32_t devfn;
-    /*
-     * Cached device to fetch requester ID from, to avoid the PCI tree
-     * walking every time we invoke PCI request (e.g., MSI). For
-     * conventional PCI root complex, this field is meaningless.
-     */
-    PCIReqIDCache requester_id_cache;
-    char name[64];
-    PCIIORegion io_regions[PCI_NUM_REGIONS];
-    AddressSpace bus_master_as;
-    MemoryRegion bus_master_container_region;
-    MemoryRegion bus_master_enable_region;
-
-    /* do not access the following fields */
-    PCIConfigReadFunc *config_read;
-    PCIConfigWriteFunc *config_write;
-
-    /* Legacy PCI VGA regions */
-    MemoryRegion *vga_regions[QEMU_PCI_VGA_NUM_REGIONS];
-    bool has_vga;
-
-    /* Current IRQ levels.  Used internally by the generic PCI code.  */
-    uint8_t irq_state;
-
-    /* Capability bits */
-    uint32_t cap_present;
-
-    /* Offset of MSI-X capability in config space */
-    uint8_t msix_cap;
-
-    /* MSI-X entries */
-    int msix_entries_nr;
-
-    /* Space to store MSIX table & pending bit array */
-    uint8_t *msix_table;
-    uint8_t *msix_pba;
-
-    /* May be used by INTx or MSI during interrupt notification */
-    void *irq_opaque;
-
-    MSITriggerFunc *msi_trigger;
-    MSIPrepareMessageFunc *msi_prepare_message;
-    MSIxPrepareMessageFunc *msix_prepare_message;
-
-    /* MemoryRegion container for msix exclusive BAR setup */
-    MemoryRegion msix_exclusive_bar;
-    /* Memory Regions for MSIX table and pending bit entries. */
-    MemoryRegion msix_table_mmio;
-    MemoryRegion msix_pba_mmio;
-    /* Reference-count for entries actually in use by driver. */
-    unsigned *msix_entry_used;
-    /* MSIX function mask set or MSIX disabled */
-    bool msix_function_masked;
-    /* Version id needed for VMState */
-    int32_t version_id;
-
-    /* Offset of MSI capability in config space */
-    uint8_t msi_cap;
-
-    /* PCI Express */
-    PCIExpressDevice exp;
-
-    /* SHPC */
-    SHPCDevice *shpc;
-
-    /* Location of option rom */
-    char *romfile;
-    uint32_t romsize;
-    bool has_rom;
-    MemoryRegion rom;
-    uint32_t rom_bar;
-
-    /* INTx routing notifier */
-    PCIINTxRoutingNotifier intx_routing_notifier;
-
-    /* MSI-X notifiers */
-    MSIVectorUseNotifier msix_vector_use_notifier;
-    MSIVectorReleaseNotifier msix_vector_release_notifier;
-    MSIVectorPollNotifier msix_vector_poll_notifier;
-
-    /* ID of standby device in net_failover pair */
-    char *failover_pair_id;
-    uint32_t acpi_index;
-};
-
 void pci_register_bar(PCIDevice *pci_dev, int region_num,
                       uint8_t attr, MemoryRegion *memory);
 void pci_register_vga(PCIDevice *pci_dev, MemoryRegion *mem,
@@ -745,11 +586,6 @@ void lsi53c8xx_handle_legacy_cmdline(DeviceState *lsi_dev);
 qemu_irq pci_allocate_irq(PCIDevice *pci_dev);
 void pci_set_irq(PCIDevice *pci_dev, int level);
 
-static inline int pci_intx(PCIDevice *pci_dev)
-{
-    return pci_get_byte(pci_dev->config + PCI_INTERRUPT_PIN) - 1;
-}
-
 static inline void pci_irq_assert(PCIDevice *pci_dev)
 {
     pci_set_irq(pci_dev, 1);
@@ -770,186 +606,6 @@ static inline void pci_irq_pulse(PCIDevice *pci_dev)
     pci_irq_deassert(pci_dev);
 }
 
-static inline int pci_is_cxl(const PCIDevice *d)
-{
-    return d->cap_present & QEMU_PCIE_CAP_CXL;
-}
-
-static inline int pci_is_express(const PCIDevice *d)
-{
-    return d->cap_present & QEMU_PCI_CAP_EXPRESS;
-}
-
-static inline int pci_is_express_downstream_port(const PCIDevice *d)
-{
-    uint8_t type;
-
-    if (!pci_is_express(d) || !d->exp.exp_cap) {
-        return 0;
-    }
-
-    type = pcie_cap_get_type(d);
-
-    return type == PCI_EXP_TYPE_DOWNSTREAM || type == PCI_EXP_TYPE_ROOT_PORT;
-}
-
-static inline int pci_is_vf(const PCIDevice *d)
-{
-    return d->exp.sriov_vf.pf != NULL;
-}
-
-static inline uint32_t pci_config_size(const PCIDevice *d)
-{
-    return pci_is_express(d) ? PCIE_CONFIG_SPACE_SIZE : PCI_CONFIG_SPACE_SIZE;
-}
-
-static inline uint16_t pci_get_bdf(PCIDevice *dev)
-{
-    return PCI_BUILD_BDF(pci_bus_num(pci_get_bus(dev)), dev->devfn);
-}
-
-uint16_t pci_requester_id(PCIDevice *dev);
-
-/* DMA access functions */
-static inline AddressSpace *pci_get_address_space(PCIDevice *dev)
-{
-    return &dev->bus_master_as;
-}
-
-/**
- * pci_dma_rw: Read from or write to an address space from PCI device.
- *
- * Return a MemTxResult indicating whether the operation succeeded
- * or failed (eg unassigned memory, device rejected the transaction,
- * IOMMU fault).
- *
- * @dev: #PCIDevice doing the memory access
- * @addr: address within the #PCIDevice address space
- * @buf: buffer with the data transferred
- * @len: the number of bytes to read or write
- * @dir: indicates the transfer direction
- */
-static inline MemTxResult pci_dma_rw(PCIDevice *dev, dma_addr_t addr,
-                                     void *buf, dma_addr_t len,
-                                     DMADirection dir, MemTxAttrs attrs)
-{
-    return dma_memory_rw(pci_get_address_space(dev), addr, buf, len,
-                         dir, attrs);
-}
-
-/**
- * pci_dma_read: Read from an address space from PCI device.
- *
- * Return a MemTxResult indicating whether the operation succeeded
- * or failed (eg unassigned memory, device rejected the transaction,
- * IOMMU fault).  Called within RCU critical section.
- *
- * @dev: #PCIDevice doing the memory access
- * @addr: address within the #PCIDevice address space
- * @buf: buffer with the data transferred
- * @len: length of the data transferred
- */
-static inline MemTxResult pci_dma_read(PCIDevice *dev, dma_addr_t addr,
-                                       void *buf, dma_addr_t len)
-{
-    return pci_dma_rw(dev, addr, buf, len,
-                      DMA_DIRECTION_TO_DEVICE, MEMTXATTRS_UNSPECIFIED);
-}
-
-/**
- * pci_dma_write: Write to address space from PCI device.
- *
- * Return a MemTxResult indicating whether the operation succeeded
- * or failed (eg unassigned memory, device rejected the transaction,
- * IOMMU fault).
- *
- * @dev: #PCIDevice doing the memory access
- * @addr: address within the #PCIDevice address space
- * @buf: buffer with the data transferred
- * @len: the number of bytes to write
- */
-static inline MemTxResult pci_dma_write(PCIDevice *dev, dma_addr_t addr,
-                                        const void *buf, dma_addr_t len)
-{
-    return pci_dma_rw(dev, addr, (void *) buf, len,
-                      DMA_DIRECTION_FROM_DEVICE, MEMTXATTRS_UNSPECIFIED);
-}
-
-#define PCI_DMA_DEFINE_LDST(_l, _s, _bits) \
-    static inline MemTxResult ld##_l##_pci_dma(PCIDevice *dev, \
-                                               dma_addr_t addr, \
-                                               uint##_bits##_t *val, \
-                                               MemTxAttrs attrs) \
-    { \
-        return ld##_l##_dma(pci_get_address_space(dev), addr, val, attrs); \
-    } \
-    static inline MemTxResult st##_s##_pci_dma(PCIDevice *dev, \
-                                               dma_addr_t addr, \
-                                               uint##_bits##_t val, \
-                                               MemTxAttrs attrs) \
-    { \
-        return st##_s##_dma(pci_get_address_space(dev), addr, val, attrs); \
-    }
-
-PCI_DMA_DEFINE_LDST(ub, b, 8);
-PCI_DMA_DEFINE_LDST(uw_le, w_le, 16)
-PCI_DMA_DEFINE_LDST(l_le, l_le, 32);
-PCI_DMA_DEFINE_LDST(q_le, q_le, 64);
-PCI_DMA_DEFINE_LDST(uw_be, w_be, 16)
-PCI_DMA_DEFINE_LDST(l_be, l_be, 32);
-PCI_DMA_DEFINE_LDST(q_be, q_be, 64);
-
-#undef PCI_DMA_DEFINE_LDST
-
-/**
- * pci_dma_map: Map device PCI address space range into host virtual address
- * @dev: #PCIDevice to be accessed
- * @addr: address within that device's address space
- * @plen: pointer to length of buffer; updated on return to indicate
- *        if only a subset of the requested range has been mapped
- * @dir: indicates the transfer direction
- *
- * Return: A host pointer, or %NULL if the resources needed to
- *         perform the mapping are exhausted (in that case *@plen
- *         is set to zero).
- */
-static inline void *pci_dma_map(PCIDevice *dev, dma_addr_t addr,
-                                dma_addr_t *plen, DMADirection dir)
-{
-    return dma_memory_map(pci_get_address_space(dev), addr, plen, dir,
-                          MEMTXATTRS_UNSPECIFIED);
-}
-
-static inline void pci_dma_unmap(PCIDevice *dev, void *buffer, dma_addr_t len,
-                                 DMADirection dir, dma_addr_t access_len)
-{
-    dma_memory_unmap(pci_get_address_space(dev), buffer, len, dir, access_len);
-}
-
-static inline void pci_dma_sglist_init(QEMUSGList *qsg, PCIDevice *dev,
-                                       int alloc_hint)
-{
-    qemu_sglist_init(qsg, DEVICE(dev), alloc_hint, pci_get_address_space(dev));
-}
-
-extern const VMStateDescription vmstate_pci_device;
-
-#define VMSTATE_PCI_DEVICE(_field, _state) {                         \
-    .name       = (stringify(_field)),                               \
-    .size       = sizeof(PCIDevice),                                 \
-    .vmsd       = &vmstate_pci_device,                               \
-    .flags      = VMS_STRUCT,                                        \
-    .offset     = vmstate_offset_value(_state, _field, PCIDevice),   \
-}
-
-#define VMSTATE_PCI_DEVICE_POINTER(_field, _state) {                 \
-    .name       = (stringify(_field)),                               \
-    .size       = sizeof(PCIDevice),                                 \
-    .vmsd       = &vmstate_pci_device,                               \
-    .flags      = VMS_STRUCT | VMS_POINTER,                          \
-    .offset     = vmstate_offset_pointer(_state, _field, PCIDevice), \
-}
-
 MSIMessage pci_get_msi_message(PCIDevice *dev, int vector);
 void pci_set_power(PCIDevice *pci_dev, bool state);
 
diff --git a/include/hw/pci/pci_bridge.h b/include/hw/pci/pci_bridge.h
index 58a3fb0c2c..63a7521567 100644
--- a/include/hw/pci/pci_bridge.h
+++ b/include/hw/pci/pci_bridge.h
@@ -26,7 +26,7 @@
 #ifndef QEMU_PCI_BRIDGE_H
 #define QEMU_PCI_BRIDGE_H
 
-#include "hw/pci/pci.h"
+#include "hw/pci/pci_device.h"
 #include "hw/pci/pci_bus.h"
 #include "hw/cxl/cxl.h"
 #include "qom/object.h"
diff --git a/include/hw/pci/pci_device.h b/include/hw/pci/pci_device.h
new file mode 100644
index 0000000000..d3dd0f64b2
--- /dev/null
+++ b/include/hw/pci/pci_device.h
@@ -0,0 +1,350 @@
+#ifndef QEMU_PCI_DEVICE_H
+#define QEMU_PCI_DEVICE_H
+
+#include "hw/pci/pci.h"
+#include "hw/pci/pcie.h"
+
+#define TYPE_PCI_DEVICE "pci-device"
+typedef struct PCIDeviceClass PCIDeviceClass;
+DECLARE_OBJ_CHECKERS(PCIDevice, PCIDeviceClass,
+                     PCI_DEVICE, TYPE_PCI_DEVICE)
+
+/*
+ * Implemented by devices that can be plugged on CXL buses. In the spec, this is
+ * actually a "CXL Component, but we name it device to match the PCI naming.
+ */
+#define INTERFACE_CXL_DEVICE "cxl-device"
+
+/* Implemented by devices that can be plugged on PCI Express buses */
+#define INTERFACE_PCIE_DEVICE "pci-express-device"
+
+/* Implemented by devices that can be plugged on Conventional PCI buses */
+#define INTERFACE_CONVENTIONAL_PCI_DEVICE "conventional-pci-device"
+
+struct PCIDeviceClass {
+    DeviceClass parent_class;
+
+    void (*realize)(PCIDevice *dev, Error **errp);
+    PCIUnregisterFunc *exit;
+    PCIConfigReadFunc *config_read;
+    PCIConfigWriteFunc *config_write;
+
+    uint16_t vendor_id;
+    uint16_t device_id;
+    uint8_t revision;
+    uint16_t class_id;
+    uint16_t subsystem_vendor_id;       /* only for header type = 0 */
+    uint16_t subsystem_id;              /* only for header type = 0 */
+
+    const char *romfile;                /* rom bar */
+};
+
+enum PCIReqIDType {
+    PCI_REQ_ID_INVALID = 0,
+    PCI_REQ_ID_BDF,
+    PCI_REQ_ID_SECONDARY_BUS,
+    PCI_REQ_ID_MAX,
+};
+typedef enum PCIReqIDType PCIReqIDType;
+
+struct PCIReqIDCache {
+    PCIDevice *dev;
+    PCIReqIDType type;
+};
+typedef struct PCIReqIDCache PCIReqIDCache;
+
+struct PCIDevice {
+    DeviceState qdev;
+    bool partially_hotplugged;
+    bool has_power;
+
+    /* PCI config space */
+    uint8_t *config;
+
+    /*
+     * Used to enable config checks on load. Note that writable bits are
+     * never checked even if set in cmask.
+     */
+    uint8_t *cmask;
+
+    /* Used to implement R/W bytes */
+    uint8_t *wmask;
+
+    /* Used to implement RW1C(Write 1 to Clear) bytes */
+    uint8_t *w1cmask;
+
+    /* Used to allocate config space for capabilities. */
+    uint8_t *used;
+
+    /* the following fields are read only */
+    int32_t devfn;
+    /*
+     * Cached device to fetch requester ID from, to avoid the PCI tree
+     * walking every time we invoke PCI request (e.g., MSI). For
+     * conventional PCI root complex, this field is meaningless.
+     */
+    PCIReqIDCache requester_id_cache;
+    char name[64];
+    PCIIORegion io_regions[PCI_NUM_REGIONS];
+    AddressSpace bus_master_as;
+    MemoryRegion bus_master_container_region;
+    MemoryRegion bus_master_enable_region;
+
+    /* do not access the following fields */
+    PCIConfigReadFunc *config_read;
+    PCIConfigWriteFunc *config_write;
+
+    /* Legacy PCI VGA regions */
+    MemoryRegion *vga_regions[QEMU_PCI_VGA_NUM_REGIONS];
+    bool has_vga;
+
+    /* Current IRQ levels.  Used internally by the generic PCI code.  */
+    uint8_t irq_state;
+
+    /* Capability bits */
+    uint32_t cap_present;
+
+    /* Offset of MSI-X capability in config space */
+    uint8_t msix_cap;
+
+    /* MSI-X entries */
+    int msix_entries_nr;
+
+    /* Space to store MSIX table & pending bit array */
+    uint8_t *msix_table;
+    uint8_t *msix_pba;
+
+    /* May be used by INTx or MSI during interrupt notification */
+    void *irq_opaque;
+
+    MSITriggerFunc *msi_trigger;
+    MSIPrepareMessageFunc *msi_prepare_message;
+    MSIxPrepareMessageFunc *msix_prepare_message;
+
+    /* MemoryRegion container for msix exclusive BAR setup */
+    MemoryRegion msix_exclusive_bar;
+    /* Memory Regions for MSIX table and pending bit entries. */
+    MemoryRegion msix_table_mmio;
+    MemoryRegion msix_pba_mmio;
+    /* Reference-count for entries actually in use by driver. */
+    unsigned *msix_entry_used;
+    /* MSIX function mask set or MSIX disabled */
+    bool msix_function_masked;
+    /* Version id needed for VMState */
+    int32_t version_id;
+
+    /* Offset of MSI capability in config space */
+    uint8_t msi_cap;
+
+    /* PCI Express */
+    PCIExpressDevice exp;
+
+    /* SHPC */
+    SHPCDevice *shpc;
+
+    /* Location of option rom */
+    char *romfile;
+    uint32_t romsize;
+    bool has_rom;
+    MemoryRegion rom;
+    uint32_t rom_bar;
+
+    /* INTx routing notifier */
+    PCIINTxRoutingNotifier intx_routing_notifier;
+
+    /* MSI-X notifiers */
+    MSIVectorUseNotifier msix_vector_use_notifier;
+    MSIVectorReleaseNotifier msix_vector_release_notifier;
+    MSIVectorPollNotifier msix_vector_poll_notifier;
+
+    /* ID of standby device in net_failover pair */
+    char *failover_pair_id;
+    uint32_t acpi_index;
+};
+
+static inline int pci_intx(PCIDevice *pci_dev)
+{
+    return pci_get_byte(pci_dev->config + PCI_INTERRUPT_PIN) - 1;
+}
+
+static inline int pci_is_cxl(const PCIDevice *d)
+{
+    return d->cap_present & QEMU_PCIE_CAP_CXL;
+}
+
+static inline int pci_is_express(const PCIDevice *d)
+{
+    return d->cap_present & QEMU_PCI_CAP_EXPRESS;
+}
+
+static inline int pci_is_express_downstream_port(const PCIDevice *d)
+{
+    uint8_t type;
+
+    if (!pci_is_express(d) || !d->exp.exp_cap) {
+        return 0;
+    }
+
+    type = pcie_cap_get_type(d);
+
+    return type == PCI_EXP_TYPE_DOWNSTREAM || type == PCI_EXP_TYPE_ROOT_PORT;
+}
+
+static inline int pci_is_vf(const PCIDevice *d)
+{
+    return d->exp.sriov_vf.pf != NULL;
+}
+
+static inline uint32_t pci_config_size(const PCIDevice *d)
+{
+    return pci_is_express(d) ? PCIE_CONFIG_SPACE_SIZE : PCI_CONFIG_SPACE_SIZE;
+}
+
+static inline uint16_t pci_get_bdf(PCIDevice *dev)
+{
+    return PCI_BUILD_BDF(pci_bus_num(pci_get_bus(dev)), dev->devfn);
+}
+
+uint16_t pci_requester_id(PCIDevice *dev);
+
+/* DMA access functions */
+static inline AddressSpace *pci_get_address_space(PCIDevice *dev)
+{
+    return &dev->bus_master_as;
+}
+
+/**
+ * pci_dma_rw: Read from or write to an address space from PCI device.
+ *
+ * Return a MemTxResult indicating whether the operation succeeded
+ * or failed (eg unassigned memory, device rejected the transaction,
+ * IOMMU fault).
+ *
+ * @dev: #PCIDevice doing the memory access
+ * @addr: address within the #PCIDevice address space
+ * @buf: buffer with the data transferred
+ * @len: the number of bytes to read or write
+ * @dir: indicates the transfer direction
+ */
+static inline MemTxResult pci_dma_rw(PCIDevice *dev, dma_addr_t addr,
+                                     void *buf, dma_addr_t len,
+                                     DMADirection dir, MemTxAttrs attrs)
+{
+    return dma_memory_rw(pci_get_address_space(dev), addr, buf, len,
+                         dir, attrs);
+}
+
+/**
+ * pci_dma_read: Read from an address space from PCI device.
+ *
+ * Return a MemTxResult indicating whether the operation succeeded
+ * or failed (eg unassigned memory, device rejected the transaction,
+ * IOMMU fault).  Called within RCU critical section.
+ *
+ * @dev: #PCIDevice doing the memory access
+ * @addr: address within the #PCIDevice address space
+ * @buf: buffer with the data transferred
+ * @len: length of the data transferred
+ */
+static inline MemTxResult pci_dma_read(PCIDevice *dev, dma_addr_t addr,
+                                       void *buf, dma_addr_t len)
+{
+    return pci_dma_rw(dev, addr, buf, len,
+                      DMA_DIRECTION_TO_DEVICE, MEMTXATTRS_UNSPECIFIED);
+}
+
+/**
+ * pci_dma_write: Write to address space from PCI device.
+ *
+ * Return a MemTxResult indicating whether the operation succeeded
+ * or failed (eg unassigned memory, device rejected the transaction,
+ * IOMMU fault).
+ *
+ * @dev: #PCIDevice doing the memory access
+ * @addr: address within the #PCIDevice address space
+ * @buf: buffer with the data transferred
+ * @len: the number of bytes to write
+ */
+static inline MemTxResult pci_dma_write(PCIDevice *dev, dma_addr_t addr,
+                                        const void *buf, dma_addr_t len)
+{
+    return pci_dma_rw(dev, addr, (void *) buf, len,
+                      DMA_DIRECTION_FROM_DEVICE, MEMTXATTRS_UNSPECIFIED);
+}
+
+#define PCI_DMA_DEFINE_LDST(_l, _s, _bits) \
+    static inline MemTxResult ld##_l##_pci_dma(PCIDevice *dev, \
+                                               dma_addr_t addr, \
+                                               uint##_bits##_t *val, \
+                                               MemTxAttrs attrs) \
+    { \
+        return ld##_l##_dma(pci_get_address_space(dev), addr, val, attrs); \
+    } \
+    static inline MemTxResult st##_s##_pci_dma(PCIDevice *dev, \
+                                               dma_addr_t addr, \
+                                               uint##_bits##_t val, \
+                                               MemTxAttrs attrs) \
+    { \
+        return st##_s##_dma(pci_get_address_space(dev), addr, val, attrs); \
+    }
+
+PCI_DMA_DEFINE_LDST(ub, b, 8);
+PCI_DMA_DEFINE_LDST(uw_le, w_le, 16)
+PCI_DMA_DEFINE_LDST(l_le, l_le, 32);
+PCI_DMA_DEFINE_LDST(q_le, q_le, 64);
+PCI_DMA_DEFINE_LDST(uw_be, w_be, 16)
+PCI_DMA_DEFINE_LDST(l_be, l_be, 32);
+PCI_DMA_DEFINE_LDST(q_be, q_be, 64);
+
+#undef PCI_DMA_DEFINE_LDST
+
+/**
+ * pci_dma_map: Map device PCI address space range into host virtual address
+ * @dev: #PCIDevice to be accessed
+ * @addr: address within that device's address space
+ * @plen: pointer to length of buffer; updated on return to indicate
+ *        if only a subset of the requested range has been mapped
+ * @dir: indicates the transfer direction
+ *
+ * Return: A host pointer, or %NULL if the resources needed to
+ *         perform the mapping are exhausted (in that case *@plen
+ *         is set to zero).
+ */
+static inline void *pci_dma_map(PCIDevice *dev, dma_addr_t addr,
+                                dma_addr_t *plen, DMADirection dir)
+{
+    return dma_memory_map(pci_get_address_space(dev), addr, plen, dir,
+                          MEMTXATTRS_UNSPECIFIED);
+}
+
+static inline void pci_dma_unmap(PCIDevice *dev, void *buffer, dma_addr_t len,
+                                 DMADirection dir, dma_addr_t access_len)
+{
+    dma_memory_unmap(pci_get_address_space(dev), buffer, len, dir, access_len);
+}
+
+static inline void pci_dma_sglist_init(QEMUSGList *qsg, PCIDevice *dev,
+                                       int alloc_hint)
+{
+    qemu_sglist_init(qsg, DEVICE(dev), alloc_hint, pci_get_address_space(dev));
+}
+
+extern const VMStateDescription vmstate_pci_device;
+
+#define VMSTATE_PCI_DEVICE(_field, _state) {                         \
+    .name       = (stringify(_field)),                               \
+    .size       = sizeof(PCIDevice),                                 \
+    .vmsd       = &vmstate_pci_device,                               \
+    .flags      = VMS_STRUCT,                                        \
+    .offset     = vmstate_offset_value(_state, _field, PCIDevice),   \
+}
+
+#define VMSTATE_PCI_DEVICE_POINTER(_field, _state) {                 \
+    .name       = (stringify(_field)),                               \
+    .size       = sizeof(PCIDevice),                                 \
+    .vmsd       = &vmstate_pci_device,                               \
+    .flags      = VMS_STRUCT | VMS_POINTER,                          \
+    .offset     = vmstate_offset_pointer(_state, _field, PCIDevice), \
+}
+
+#endif
diff --git a/include/hw/pci/pcie_port.h b/include/hw/pci/pcie_port.h
index d9b5d07504..fd484afb30 100644
--- a/include/hw/pci/pcie_port.h
+++ b/include/hw/pci/pcie_port.h
@@ -23,6 +23,7 @@
 
 #include "hw/pci/pci_bridge.h"
 #include "hw/pci/pci_bus.h"
+#include "hw/pci/pci_device.h"
 #include "qom/object.h"
 
 #define TYPE_PCIE_PORT "pcie-port"
diff --git a/include/hw/pci/shpc.h b/include/hw/pci/shpc.h
index d5683b7399..89c7a3b7fa 100644
--- a/include/hw/pci/shpc.h
+++ b/include/hw/pci/shpc.h
@@ -3,7 +3,7 @@
 
 #include "exec/memory.h"
 #include "hw/hotplug.h"
-#include "hw/pci/pci.h"
+#include "hw/pci/pci_device.h"
 #include "migration/vmstate.h"
 
 struct SHPCDevice {
diff --git a/include/hw/remote/iohub.h b/include/hw/remote/iohub.h
index 0bf98e0d78..6a8444f9a9 100644
--- a/include/hw/remote/iohub.h
+++ b/include/hw/remote/iohub.h
@@ -11,7 +11,7 @@
 #ifndef REMOTE_IOHUB_H
 #define REMOTE_IOHUB_H
 
-#include "hw/pci/pci.h"
+#include "hw/pci/pci_device.h"
 #include "qemu/event_notifier.h"
 #include "qemu/thread-posix.h"
 #include "hw/remote/mpqemu-link.h"
diff --git a/include/hw/remote/proxy.h b/include/hw/remote/proxy.h
index 741def71f1..0cfd9665be 100644
--- a/include/hw/remote/proxy.h
+++ b/include/hw/remote/proxy.h
@@ -9,7 +9,7 @@
 #ifndef PROXY_H
 #define PROXY_H
 
-#include "hw/pci/pci.h"
+#include "hw/pci/pci_device.h"
 #include "io/channel.h"
 #include "hw/remote/proxy-memory-listener.h"
 #include "qemu/event_notifier.h"
diff --git a/include/hw/sd/sdhci.h b/include/hw/sd/sdhci.h
index a989fca3b2..6cd2822f1d 100644
--- a/include/hw/sd/sdhci.h
+++ b/include/hw/sd/sdhci.h
@@ -25,7 +25,7 @@
 #ifndef SDHCI_H
 #define SDHCI_H
 
-#include "hw/pci/pci.h"
+#include "hw/pci/pci_device.h"
 #include "hw/sysbus.h"
 #include "hw/sd/sd.h"
 #include "qom/object.h"
diff --git a/include/hw/southbridge/piix.h b/include/hw/southbridge/piix.h
index 2693778b23..0bf48e936d 100644
--- a/include/hw/southbridge/piix.h
+++ b/include/hw/southbridge/piix.h
@@ -12,8 +12,7 @@
 #ifndef HW_SOUTHBRIDGE_PIIX_H
 #define HW_SOUTHBRIDGE_PIIX_H
 
-#include "hw/pci/pci.h"
-#include "qom/object.h"
+#include "hw/pci/pci_device.h"
 
 /* PIRQRC[A:D]: PIRQx Route Control Registers */
 #define PIIX_PIRQCA 0x60
diff --git a/include/hw/xen/xen_common.h b/include/hw/xen/xen_common.h
index 77ce17d8a4..9a13a756ae 100644
--- a/include/hw/xen/xen_common.h
+++ b/include/hw/xen/xen_common.h
@@ -15,7 +15,7 @@
 #include "hw/xen/interface/io/xenbus.h"
 
 #include "hw/xen/xen.h"
-#include "hw/pci/pci.h"
+#include "hw/pci/pci_device.h"
 #include "hw/xen/trace.h"
 
 extern xc_interface *xen_xc;
diff --git a/hw/acpi/erst.c b/hw/acpi/erst.c
index aefcc03ad6..35007d8017 100644
--- a/hw/acpi/erst.c
+++ b/hw/acpi/erst.c
@@ -14,7 +14,7 @@
 #include "hw/qdev-core.h"
 #include "exec/memory.h"
 #include "qom/object.h"
-#include "hw/pci/pci.h"
+#include "hw/pci/pci_device.h"
 #include "qom/object_interfaces.h"
 #include "qemu/error-report.h"
 #include "migration/vmstate.h"
diff --git a/hw/audio/ac97.c b/hw/audio/ac97.c
index be2dd701a4..364cdfa733 100644
--- a/hw/audio/ac97.c
+++ b/hw/audio/ac97.c
@@ -20,7 +20,7 @@
 #include "qemu/osdep.h"
 #include "hw/audio/soundhw.h"
 #include "audio/audio.h"
-#include "hw/pci/pci.h"
+#include "hw/pci/pci_device.h"
 #include "hw/qdev-properties.h"
 #include "migration/vmstate.h"
 #include "qemu/module.h"
diff --git a/hw/audio/es1370.c b/hw/audio/es1370.c
index 6904589814..54cc19a637 100644
--- a/hw/audio/es1370.c
+++ b/hw/audio/es1370.c
@@ -29,7 +29,7 @@
 #include "qemu/osdep.h"
 #include "hw/audio/soundhw.h"
 #include "audio/audio.h"
-#include "hw/pci/pci.h"
+#include "hw/pci/pci_device.h"
 #include "migration/vmstate.h"
 #include "qemu/module.h"
 #include "sysemu/dma.h"
diff --git a/hw/audio/via-ac97.c b/hw/audio/via-ac97.c
index 6d556f74fc..d1a856f63d 100644
--- a/hw/audio/via-ac97.c
+++ b/hw/audio/via-ac97.c
@@ -11,7 +11,7 @@
 
 #include "qemu/osdep.h"
 #include "hw/isa/vt82c686.h"
-#include "hw/pci/pci.h"
+#include "hw/pci/pci_device.h"
 
 static void via_ac97_realize(PCIDevice *pci_dev, Error **errp)
 {
diff --git a/hw/char/serial-pci-multi.c b/hw/char/serial-pci-multi.c
index 3a9f96c2d1..f18b8dcce5 100644
--- a/hw/char/serial-pci-multi.c
+++ b/hw/char/serial-pci-multi.c
@@ -31,7 +31,7 @@
 #include "qapi/error.h"
 #include "hw/char/serial.h"
 #include "hw/irq.h"
-#include "hw/pci/pci.h"
+#include "hw/pci/pci_device.h"
 #include "hw/qdev-properties.h"
 #include "hw/qdev-properties-system.h"
 #include "migration/vmstate.h"
diff --git a/hw/char/serial-pci.c b/hw/char/serial-pci.c
index 93d6f99244..801b769aba 100644
--- a/hw/char/serial-pci.c
+++ b/hw/char/serial-pci.c
@@ -30,7 +30,7 @@
 #include "qemu/module.h"
 #include "hw/char/serial.h"
 #include "hw/irq.h"
-#include "hw/pci/pci.h"
+#include "hw/pci/pci_device.h"
 #include "hw/qdev-properties.h"
 #include "migration/vmstate.h"
 #include "qom/object.h"
diff --git a/hw/core/qdev-properties-system.c b/hw/core/qdev-properties-system.c
index 97a968f477..54a09fa9ac 100644
--- a/hw/core/qdev-properties-system.c
+++ b/hw/core/qdev-properties-system.c
@@ -32,6 +32,7 @@
 #include "sysemu/blockdev.h"
 #include "net/net.h"
 #include "hw/pci/pci.h"
+#include "hw/pci/pcie.h"
 #include "util/block-helpers.h"
 
 static bool check_prop_still_unset(Object *obj, const char *name,
diff --git a/hw/display/bochs-display.c b/hw/display/bochs-display.c
index 8ed734b195..e7ec268184 100644
--- a/hw/display/bochs-display.c
+++ b/hw/display/bochs-display.c
@@ -8,7 +8,7 @@
 #include "qemu/osdep.h"
 #include "qemu/module.h"
 #include "qemu/units.h"
-#include "hw/pci/pci.h"
+#include "hw/pci/pci_device.h"
 #include "hw/qdev-properties.h"
 #include "migration/vmstate.h"
 #include "hw/display/bochs-vbe.h"
diff --git a/hw/display/cirrus_vga.c b/hw/display/cirrus_vga.c
index 6e8c747c46..55c32e3e40 100644
--- a/hw/display/cirrus_vga.c
+++ b/hw/display/cirrus_vga.c
@@ -39,7 +39,7 @@
 #include "sysemu/reset.h"
 #include "qapi/error.h"
 #include "trace.h"
-#include "hw/pci/pci.h"
+#include "hw/pci/pci_device.h"
 #include "hw/qdev-properties.h"
 #include "migration/vmstate.h"
 #include "ui/pixel_ops.h"
diff --git a/hw/display/sm501.c b/hw/display/sm501.c
index 663c37e7f2..52e42585af 100644
--- a/hw/display/sm501.c
+++ b/hw/display/sm501.c
@@ -32,7 +32,7 @@
 #include "ui/console.h"
 #include "hw/sysbus.h"
 #include "migration/vmstate.h"
-#include "hw/pci/pci.h"
+#include "hw/pci/pci_device.h"
 #include "hw/qdev-properties.h"
 #include "hw/i2c/i2c.h"
 #include "hw/display/i2c-ddc.h"
diff --git a/hw/display/vga-pci.c b/hw/display/vga-pci.c
index df23dbf3a0..b351b8f299 100644
--- a/hw/display/vga-pci.c
+++ b/hw/display/vga-pci.c
@@ -25,7 +25,7 @@
  */
 
 #include "qemu/osdep.h"
-#include "hw/pci/pci.h"
+#include "hw/pci/pci_device.h"
 #include "hw/qdev-properties.h"
 #include "migration/vmstate.h"
 #include "vga_int.h"
diff --git a/hw/display/vmware_vga.c b/hw/display/vmware_vga.c
index 53949d2539..59ae7f74b8 100644
--- a/hw/display/vmware_vga.c
+++ b/hw/display/vmware_vga.c
@@ -29,7 +29,7 @@
 #include "qemu/log.h"
 #include "hw/loader.h"
 #include "trace.h"
-#include "hw/pci/pci.h"
+#include "hw/pci/pci_device.h"
 #include "hw/qdev-properties.h"
 #include "migration/vmstate.h"
 #include "qom/object.h"
diff --git a/hw/i386/xen/xen_pvdevice.c b/hw/i386/xen/xen_pvdevice.c
index 1ea95fa601..e62e06622b 100644
--- a/hw/i386/xen/xen_pvdevice.c
+++ b/hw/i386/xen/xen_pvdevice.c
@@ -32,7 +32,7 @@
 #include "qemu/osdep.h"
 #include "qapi/error.h"
 #include "qemu/module.h"
-#include "hw/pci/pci.h"
+#include "hw/pci/pci_device.h"
 #include "hw/qdev-properties.h"
 #include "migration/vmstate.h"
 #include "trace.h"
diff --git a/hw/ipack/tpci200.c b/hw/ipack/tpci200.c
index 1f764fc85b..6b3edbf017 100644
--- a/hw/ipack/tpci200.c
+++ b/hw/ipack/tpci200.c
@@ -12,7 +12,7 @@
 #include "qemu/units.h"
 #include "hw/ipack/ipack.h"
 #include "hw/irq.h"
-#include "hw/pci/pci.h"
+#include "hw/pci/pci_device.h"
 #include "migration/vmstate.h"
 #include "qemu/bitops.h"
 #include "qemu/module.h"
diff --git a/hw/ipmi/pci_ipmi_bt.c b/hw/ipmi/pci_ipmi_bt.c
index b6e52730d3..633931b825 100644
--- a/hw/ipmi/pci_ipmi_bt.c
+++ b/hw/ipmi/pci_ipmi_bt.c
@@ -25,7 +25,7 @@
 #include "migration/vmstate.h"
 #include "qapi/error.h"
 #include "hw/ipmi/ipmi_bt.h"
-#include "hw/pci/pci.h"
+#include "hw/pci/pci_device.h"
 #include "qom/object.h"
 
 #define TYPE_PCI_IPMI_BT "pci-ipmi-bt"
diff --git a/hw/ipmi/pci_ipmi_kcs.c b/hw/ipmi/pci_ipmi_kcs.c
index de13418862..1a581413c2 100644
--- a/hw/ipmi/pci_ipmi_kcs.c
+++ b/hw/ipmi/pci_ipmi_kcs.c
@@ -25,7 +25,7 @@
 #include "migration/vmstate.h"
 #include "qapi/error.h"
 #include "hw/ipmi/ipmi_kcs.h"
-#include "hw/pci/pci.h"
+#include "hw/pci/pci_device.h"
 #include "qom/object.h"
 
 #define TYPE_PCI_IPMI_KCS "pci-ipmi-kcs"
diff --git a/hw/isa/i82378.c b/hw/isa/i82378.c
index 2a2ff05b93..e3322e03bf 100644
--- a/hw/isa/i82378.c
+++ b/hw/isa/i82378.c
@@ -18,7 +18,7 @@
  */
 
 #include "qemu/osdep.h"
-#include "hw/pci/pci.h"
+#include "hw/pci/pci_device.h"
 #include "hw/irq.h"
 #include "hw/intc/i8259.h"
 #include "hw/timer/i8254.h"
diff --git a/hw/mips/gt64xxx_pci.c b/hw/mips/gt64xxx_pci.c
index 19d0d9889f..164866cf3e 100644
--- a/hw/mips/gt64xxx_pci.c
+++ b/hw/mips/gt64xxx_pci.c
@@ -26,7 +26,7 @@
 #include "qapi/error.h"
 #include "qemu/units.h"
 #include "qemu/log.h"
-#include "hw/pci/pci.h"
+#include "hw/pci/pci_device.h"
 #include "hw/pci/pci_host.h"
 #include "migration/vmstate.h"
 #include "hw/intc/i8259.h"
diff --git a/hw/misc/pci-testdev.c b/hw/misc/pci-testdev.c
index 03845c8de3..49303134e4 100644
--- a/hw/misc/pci-testdev.c
+++ b/hw/misc/pci-testdev.c
@@ -19,7 +19,7 @@
  */
 
 #include "qemu/osdep.h"
-#include "hw/pci/pci.h"
+#include "hw/pci/pci_device.h"
 #include "hw/qdev-properties.h"
 #include "qemu/event_notifier.h"
 #include "qemu/module.h"
diff --git a/hw/misc/pvpanic-pci.c b/hw/misc/pvpanic-pci.c
index 99cf7e2041..fbcaa50731 100644
--- a/hw/misc/pvpanic-pci.c
+++ b/hw/misc/pvpanic-pci.c
@@ -20,7 +20,7 @@
 #include "migration/vmstate.h"
 #include "hw/misc/pvpanic.h"
 #include "qom/object.h"
-#include "hw/pci/pci.h"
+#include "hw/pci/pci_device.h"
 #include "standard-headers/linux/pvpanic.h"
 
 OBJECT_DECLARE_SIMPLE_TYPE(PVPanicPCIState, PVPANIC_PCI_DEVICE)
diff --git a/hw/net/can/can_kvaser_pci.c b/hw/net/can/can_kvaser_pci.c
index 94b3a534f8..2cd90cef1e 100644
--- a/hw/net/can/can_kvaser_pci.c
+++ b/hw/net/can/can_kvaser_pci.c
@@ -37,7 +37,7 @@
 #include "qapi/error.h"
 #include "chardev/char.h"
 #include "hw/irq.h"
-#include "hw/pci/pci.h"
+#include "hw/pci/pci_device.h"
 #include "hw/qdev-properties.h"
 #include "migration/vmstate.h"
 #include "net/can_emu.h"
diff --git a/hw/net/can/can_mioe3680_pci.c b/hw/net/can/can_mioe3680_pci.c
index 29dc696f7c..b9918773b3 100644
--- a/hw/net/can/can_mioe3680_pci.c
+++ b/hw/net/can/can_mioe3680_pci.c
@@ -33,7 +33,7 @@
 #include "qapi/error.h"
 #include "chardev/char.h"
 #include "hw/irq.h"
-#include "hw/pci/pci.h"
+#include "hw/pci/pci_device.h"
 #include "hw/qdev-properties.h"
 #include "migration/vmstate.h"
 #include "net/can_emu.h"
diff --git a/hw/net/can/can_pcm3680_pci.c b/hw/net/can/can_pcm3680_pci.c
index e8e57f4f33..8ef3e4659c 100644
--- a/hw/net/can/can_pcm3680_pci.c
+++ b/hw/net/can/can_pcm3680_pci.c
@@ -33,7 +33,7 @@
 #include "qapi/error.h"
 #include "chardev/char.h"
 #include "hw/irq.h"
-#include "hw/pci/pci.h"
+#include "hw/pci/pci_device.h"
 #include "hw/qdev-properties.h"
 #include "migration/vmstate.h"
 #include "net/can_emu.h"
diff --git a/hw/net/can/ctucan_pci.c b/hw/net/can/ctucan_pci.c
index 50f4ea6cd6..ea079e2af5 100644
--- a/hw/net/can/ctucan_pci.c
+++ b/hw/net/can/ctucan_pci.c
@@ -34,7 +34,7 @@
 #include "qapi/error.h"
 #include "chardev/char.h"
 #include "hw/irq.h"
-#include "hw/pci/pci.h"
+#include "hw/pci/pci_device.h"
 #include "hw/qdev-properties.h"
 #include "migration/vmstate.h"
 #include "net/can_emu.h"
diff --git a/hw/net/e1000.c b/hw/net/e1000.c
index e26e0a64c1..7efb8a4c52 100644
--- a/hw/net/e1000.c
+++ b/hw/net/e1000.c
@@ -26,7 +26,7 @@
 
 
 #include "qemu/osdep.h"
-#include "hw/pci/pci.h"
+#include "hw/pci/pci_device.h"
 #include "hw/qdev-properties.h"
 #include "migration/vmstate.h"
 #include "net/eth.h"
diff --git a/hw/net/e1000x_common.c b/hw/net/e1000x_common.c
index a8d93870b5..2f43e8cd13 100644
--- a/hw/net/e1000x_common.c
+++ b/hw/net/e1000x_common.c
@@ -24,7 +24,7 @@
 
 #include "qemu/osdep.h"
 #include "qemu/units.h"
-#include "hw/pci/pci.h"
+#include "hw/pci/pci_device.h"
 #include "net/net.h"
 
 #include "e1000x_common.h"
diff --git a/hw/net/eepro100.c b/hw/net/eepro100.c
index 679f52f80f..dc07984ae9 100644
--- a/hw/net/eepro100.c
+++ b/hw/net/eepro100.c
@@ -42,7 +42,7 @@
 
 #include "qemu/osdep.h"
 #include "qemu/units.h"
-#include "hw/pci/pci.h"
+#include "hw/pci/pci_device.h"
 #include "hw/qdev-properties.h"
 #include "migration/vmstate.h"
 #include "net/net.h"
diff --git a/hw/net/ne2000-pci.c b/hw/net/ne2000-pci.c
index 9e5d10859a..edc6689d33 100644
--- a/hw/net/ne2000-pci.c
+++ b/hw/net/ne2000-pci.c
@@ -24,7 +24,7 @@
 
 #include "qemu/osdep.h"
 #include "hw/irq.h"
-#include "hw/pci/pci.h"
+#include "hw/pci/pci_device.h"
 #include "hw/qdev-properties.h"
 #include "migration/vmstate.h"
 #include "ne2000.h"
diff --git a/hw/net/net_tx_pkt.c b/hw/net/net_tx_pkt.c
index 1cb1125d9f..2533ea2700 100644
--- a/hw/net/net_tx_pkt.c
+++ b/hw/net/net_tx_pkt.c
@@ -21,7 +21,7 @@
 #include "net/checksum.h"
 #include "net/tap.h"
 #include "net/net.h"
-#include "hw/pci/pci.h"
+#include "hw/pci/pci_device.h"
 
 enum {
     NET_TX_PKT_VHDR_FRAG = 0,
diff --git a/hw/net/pcnet-pci.c b/hw/net/pcnet-pci.c
index 95d27102aa..96a302c141 100644
--- a/hw/net/pcnet-pci.c
+++ b/hw/net/pcnet-pci.c
@@ -29,7 +29,7 @@
 
 #include "qemu/osdep.h"
 #include "hw/irq.h"
-#include "hw/pci/pci.h"
+#include "hw/pci/pci_device.h"
 #include "hw/qdev-properties.h"
 #include "migration/vmstate.h"
 #include "net/net.h"
diff --git a/hw/net/rocker/rocker.c b/hw/net/rocker/rocker.c
index 281d43e6cf..cf54ddf49d 100644
--- a/hw/net/rocker/rocker.c
+++ b/hw/net/rocker/rocker.c
@@ -16,7 +16,7 @@
  */
 
 #include "qemu/osdep.h"
-#include "hw/pci/pci.h"
+#include "hw/pci/pci_device.h"
 #include "hw/qdev-properties.h"
 #include "hw/qdev-properties-system.h"
 #include "migration/vmstate.h"
diff --git a/hw/net/rocker/rocker_desc.c b/hw/net/rocker/rocker_desc.c
index 01845f1157..f3068c9250 100644
--- a/hw/net/rocker/rocker_desc.c
+++ b/hw/net/rocker/rocker_desc.c
@@ -16,7 +16,7 @@
 
 #include "qemu/osdep.h"
 #include "net/net.h"
-#include "hw/pci/pci.h"
+#include "hw/pci/pci_device.h"
 
 #include "rocker.h"
 #include "rocker_hw.h"
diff --git a/hw/net/rtl8139.c b/hw/net/rtl8139.c
index 700b1b66b6..5a5aaf868d 100644
--- a/hw/net/rtl8139.c
+++ b/hw/net/rtl8139.c
@@ -53,7 +53,7 @@
 #include "qemu/osdep.h"
 #include <zlib.h>
 
-#include "hw/pci/pci.h"
+#include "hw/pci/pci_device.h"
 #include "hw/qdev-properties.h"
 #include "migration/vmstate.h"
 #include "sysemu/dma.h"
diff --git a/hw/net/sungem.c b/hw/net/sungem.c
index 3684a4d733..eb01520790 100644
--- a/hw/net/sungem.c
+++ b/hw/net/sungem.c
@@ -8,7 +8,7 @@
  */
 
 #include "qemu/osdep.h"
-#include "hw/pci/pci.h"
+#include "hw/pci/pci_device.h"
 #include "hw/qdev-properties.h"
 #include "migration/vmstate.h"
 #include "qemu/log.h"
diff --git a/hw/net/sunhme.c b/hw/net/sunhme.c
index fc34905f87..1f3d8011ae 100644
--- a/hw/net/sunhme.c
+++ b/hw/net/sunhme.c
@@ -23,7 +23,7 @@
  */
 
 #include "qemu/osdep.h"
-#include "hw/pci/pci.h"
+#include "hw/pci/pci_device.h"
 #include "hw/qdev-properties.h"
 #include "migration/vmstate.h"
 #include "hw/net/mii.h"
diff --git a/hw/net/tulip.c b/hw/net/tulip.c
index c2b3b1bdfa..915e5fb595 100644
--- a/hw/net/tulip.c
+++ b/hw/net/tulip.c
@@ -9,7 +9,7 @@
 #include "qemu/osdep.h"
 #include "qemu/log.h"
 #include "hw/irq.h"
-#include "hw/pci/pci.h"
+#include "hw/pci/pci_device.h"
 #include "hw/qdev-properties.h"
 #include "hw/nvram/eeprom93xx.h"
 #include "migration/vmstate.h"
diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
index f191e3037f..3ae909041a 100644
--- a/hw/net/virtio-net.c
+++ b/hw/net/virtio-net.c
@@ -42,7 +42,7 @@
 #include "sysemu/sysemu.h"
 #include "trace.h"
 #include "monitor/qdev.h"
-#include "hw/pci/pci.h"
+#include "hw/pci/pci_device.h"
 #include "net_rx_pkt.h"
 #include "hw/virtio/vhost.h"
 #include "sysemu/qtest.h"
diff --git a/hw/pci-host/bonito.c b/hw/pci-host/bonito.c
index a57e81e3a9..f04f3ad668 100644
--- a/hw/pci-host/bonito.c
+++ b/hw/pci-host/bonito.c
@@ -42,7 +42,7 @@
 #include "qemu/units.h"
 #include "qapi/error.h"
 #include "qemu/error-report.h"
-#include "hw/pci/pci.h"
+#include "hw/pci/pci_device.h"
 #include "hw/irq.h"
 #include "hw/mips/mips.h"
 #include "hw/pci/pci_host.h"
diff --git a/hw/pci-host/dino.c b/hw/pci-host/dino.c
index f257c24e64..e8eaebca54 100644
--- a/hw/pci-host/dino.c
+++ b/hw/pci-host/dino.c
@@ -15,7 +15,7 @@
 #include "qemu/units.h"
 #include "qapi/error.h"
 #include "hw/irq.h"
-#include "hw/pci/pci.h"
+#include "hw/pci/pci_device.h"
 #include "hw/pci/pci_bus.h"
 #include "hw/qdev-properties.h"
 #include "hw/pci-host/dino.h"
diff --git a/hw/pci-host/grackle.c b/hw/pci-host/grackle.c
index 95945ac0f4..8cf318cb80 100644
--- a/hw/pci-host/grackle.c
+++ b/hw/pci-host/grackle.c
@@ -25,7 +25,7 @@
 
 #include "qemu/osdep.h"
 #include "hw/qdev-properties.h"
-#include "hw/pci/pci.h"
+#include "hw/pci/pci_device.h"
 #include "hw/irq.h"
 #include "qapi/error.h"
 #include "qemu/module.h"
diff --git a/hw/pci-host/mv64361.c b/hw/pci-host/mv64361.c
index cc9c4d6d3b..015b92bd5f 100644
--- a/hw/pci-host/mv64361.c
+++ b/hw/pci-host/mv64361.c
@@ -13,7 +13,7 @@
 #include "qapi/error.h"
 #include "hw/hw.h"
 #include "hw/sysbus.h"
-#include "hw/pci/pci.h"
+#include "hw/pci/pci_device.h"
 #include "hw/pci/pci_host.h"
 #include "hw/irq.h"
 #include "hw/intc/i8259.h"
diff --git a/hw/pci-host/ppce500.c b/hw/pci-host/ppce500.c
index 89c1b53dd7..568849e930 100644
--- a/hw/pci-host/ppce500.c
+++ b/hw/pci-host/ppce500.c
@@ -19,7 +19,7 @@
 #include "hw/ppc/e500-ccsr.h"
 #include "hw/qdev-properties.h"
 #include "migration/vmstate.h"
-#include "hw/pci/pci.h"
+#include "hw/pci/pci_device.h"
 #include "hw/pci/pci_host.h"
 #include "qemu/bswap.h"
 #include "qemu/module.h"
diff --git a/hw/pci-host/raven.c b/hw/pci-host/raven.c
index 7a105e4a63..2c96ddf8fe 100644
--- a/hw/pci-host/raven.c
+++ b/hw/pci-host/raven.c
@@ -28,7 +28,7 @@
 #include "qemu/units.h"
 #include "qemu/log.h"
 #include "qapi/error.h"
-#include "hw/pci/pci.h"
+#include "hw/pci/pci_device.h"
 #include "hw/pci/pci_bus.h"
 #include "hw/pci/pci_host.h"
 #include "hw/qdev-properties.h"
diff --git a/hw/pci-host/sh_pci.c b/hw/pci-host/sh_pci.c
index 719d6ca2a6..77e7bbc65f 100644
--- a/hw/pci-host/sh_pci.c
+++ b/hw/pci-host/sh_pci.c
@@ -26,7 +26,7 @@
 #include "hw/sysbus.h"
 #include "hw/sh4/sh.h"
 #include "hw/irq.h"
-#include "hw/pci/pci.h"
+#include "hw/pci/pci_device.h"
 #include "hw/pci/pci_host.h"
 #include "qemu/bswap.h"
 #include "qemu/module.h"
diff --git a/hw/pci-host/uninorth.c b/hw/pci-host/uninorth.c
index 8396c91d59..e3abe3c0f9 100644
--- a/hw/pci-host/uninorth.c
+++ b/hw/pci-host/uninorth.c
@@ -26,7 +26,7 @@
 #include "hw/irq.h"
 #include "hw/qdev-properties.h"
 #include "qemu/module.h"
-#include "hw/pci/pci.h"
+#include "hw/pci/pci_device.h"
 #include "hw/pci/pci_host.h"
 #include "hw/pci-host/uninorth.h"
 #include "trace.h"
diff --git a/hw/pci-host/versatile.c b/hw/pci-host/versatile.c
index f66384fa02..0d50ea4cc0 100644
--- a/hw/pci-host/versatile.c
+++ b/hw/pci-host/versatile.c
@@ -12,7 +12,7 @@
 #include "hw/sysbus.h"
 #include "migration/vmstate.h"
 #include "hw/irq.h"
-#include "hw/pci/pci.h"
+#include "hw/pci/pci_device.h"
 #include "hw/pci/pci_bus.h"
 #include "hw/pci/pci_host.h"
 #include "hw/qdev-properties.h"
diff --git a/hw/pci/pci-hmp-cmds.c b/hw/pci/pci-hmp-cmds.c
index fb7591d6ab..b09fce9377 100644
--- a/hw/pci/pci-hmp-cmds.c
+++ b/hw/pci/pci-hmp-cmds.c
@@ -15,6 +15,7 @@
 
 #include "qemu/osdep.h"
 #include "hw/pci/pci.h"
+#include "hw/pci/pci_device.h"
 #include "monitor/hmp.h"
 #include "monitor/monitor.h"
 #include "pci-internal.h"
diff --git a/hw/pci/pcie_host.c b/hw/pci/pcie_host.c
index 5abbe83220..3717e1a086 100644
--- a/hw/pci/pcie_host.c
+++ b/hw/pci/pcie_host.c
@@ -20,7 +20,7 @@
  */
 
 #include "qemu/osdep.h"
-#include "hw/pci/pci.h"
+#include "hw/pci/pci_device.h"
 #include "hw/pci/pcie_host.h"
 #include "qemu/module.h"
 
diff --git a/hw/pci/pcie_sriov.c b/hw/pci/pcie_sriov.c
index 8e3faf1f59..f0bd72e069 100644
--- a/hw/pci/pcie_sriov.c
+++ b/hw/pci/pcie_sriov.c
@@ -11,7 +11,7 @@
  */
 
 #include "qemu/osdep.h"
-#include "hw/pci/pci.h"
+#include "hw/pci/pci_device.h"
 #include "hw/pci/pcie.h"
 #include "hw/pci/pci_bus.h"
 #include "hw/qdev-properties.h"
diff --git a/hw/pci/slotid_cap.c b/hw/pci/slotid_cap.c
index 36d021b4a6..8372d05d9e 100644
--- a/hw/pci/slotid_cap.c
+++ b/hw/pci/slotid_cap.c
@@ -1,6 +1,6 @@
 #include "qemu/osdep.h"
 #include "hw/pci/slotid_cap.h"
-#include "hw/pci/pci.h"
+#include "hw/pci/pci_device.h"
 #include "qemu/error-report.h"
 #include "qapi/error.h"
 
diff --git a/hw/ppc/ppc440_pcix.c b/hw/ppc/ppc440_pcix.c
index 788d25514a..f10f93c533 100644
--- a/hw/ppc/ppc440_pcix.c
+++ b/hw/ppc/ppc440_pcix.c
@@ -26,7 +26,7 @@
 #include "hw/irq.h"
 #include "hw/ppc/ppc.h"
 #include "hw/ppc/ppc4xx.h"
-#include "hw/pci/pci.h"
+#include "hw/pci/pci_device.h"
 #include "hw/pci/pci_host.h"
 #include "trace.h"
 #include "qom/object.h"
diff --git a/hw/ppc/ppc4xx_pci.c b/hw/ppc/ppc4xx_pci.c
index 8642b96455..1d4a50fa7c 100644
--- a/hw/ppc/ppc4xx_pci.c
+++ b/hw/ppc/ppc4xx_pci.c
@@ -29,7 +29,7 @@
 #include "migration/vmstate.h"
 #include "qemu/module.h"
 #include "sysemu/reset.h"
-#include "hw/pci/pci.h"
+#include "hw/pci/pci_device.h"
 #include "hw/pci/pci_host.h"
 #include "trace.h"
 #include "qom/object.h"
diff --git a/hw/ppc/spapr_pci_vfio.c b/hw/ppc/spapr_pci_vfio.c
index 2a76b4e0b5..d8aeee0b7e 100644
--- a/hw/ppc/spapr_pci_vfio.c
+++ b/hw/ppc/spapr_pci_vfio.c
@@ -22,6 +22,7 @@
 #include "hw/ppc/spapr.h"
 #include "hw/pci-host/spapr.h"
 #include "hw/pci/msix.h"
+#include "hw/pci/pci_device.h"
 #include "hw/vfio/vfio.h"
 #include "qemu/error-report.h"
 
diff --git a/hw/rdma/rdma_utils.c b/hw/rdma/rdma_utils.c
index 77008552f4..c948baf052 100644
--- a/hw/rdma/rdma_utils.c
+++ b/hw/rdma/rdma_utils.c
@@ -14,7 +14,7 @@
  */
 
 #include "qemu/osdep.h"
-#include "hw/pci/pci.h"
+#include "hw/pci/pci_device.h"
 #include "trace.h"
 #include "rdma_utils.h"
 
diff --git a/hw/s390x/s390-pci-inst.c b/hw/s390x/s390-pci-inst.c
index 9abe95130c..69137e0757 100644
--- a/hw/s390x/s390-pci-inst.c
+++ b/hw/s390x/s390-pci-inst.c
@@ -16,6 +16,7 @@
 #include "exec/memory-internal.h"
 #include "qemu/error-report.h"
 #include "sysemu/hw_accel.h"
+#include "hw/pci/pci_device.h"
 #include "hw/s390x/s390-pci-inst.h"
 #include "hw/s390x/s390-pci-bus.h"
 #include "hw/s390x/s390-pci-kvm.h"
diff --git a/hw/scsi/esp-pci.c b/hw/scsi/esp-pci.c
index 1792f84cea..2f7f11e70b 100644
--- a/hw/scsi/esp-pci.c
+++ b/hw/scsi/esp-pci.c
@@ -24,7 +24,7 @@
  */
 
 #include "qemu/osdep.h"
-#include "hw/pci/pci.h"
+#include "hw/pci/pci_device.h"
 #include "hw/irq.h"
 #include "hw/nvram/eeprom93xx.h"
 #include "hw/scsi/esp.h"
diff --git a/hw/scsi/lsi53c895a.c b/hw/scsi/lsi53c895a.c
index 50979640c3..af93557a9a 100644
--- a/hw/scsi/lsi53c895a.c
+++ b/hw/scsi/lsi53c895a.c
@@ -16,7 +16,7 @@
 #include "qemu/osdep.h"
 
 #include "hw/irq.h"
-#include "hw/pci/pci.h"
+#include "hw/pci/pci_device.h"
 #include "hw/scsi/scsi.h"
 #include "migration/vmstate.h"
 #include "sysemu/dma.h"
diff --git a/hw/smbios/smbios.c b/hw/smbios/smbios.c
index b4243de735..4869566cf5 100644
--- a/hw/smbios/smbios.c
+++ b/hw/smbios/smbios.c
@@ -28,6 +28,7 @@
 #include "hw/loader.h"
 #include "hw/boards.h"
 #include "hw/pci/pci_bus.h"
+#include "hw/pci/pci_device.h"
 #include "smbios_build.h"
 
 /* legacy structures and constants for <= 2.0 machines */
diff --git a/hw/usb/hcd-ohci-pci.c b/hw/usb/hcd-ohci-pci.c
index 8e1146b862..6b630d35a7 100644
--- a/hw/usb/hcd-ohci-pci.c
+++ b/hw/usb/hcd-ohci-pci.c
@@ -23,7 +23,7 @@
 #include "qemu/timer.h"
 #include "hw/usb.h"
 #include "migration/vmstate.h"
-#include "hw/pci/pci.h"
+#include "hw/pci/pci_device.h"
 #include "hw/sysbus.h"
 #include "hw/qdev-dma.h"
 #include "hw/qdev-properties.h"
diff --git a/hw/watchdog/wdt_i6300esb.c b/hw/watchdog/wdt_i6300esb.c
index 5693ec6a09..54c167cd35 100644
--- a/hw/watchdog/wdt_i6300esb.c
+++ b/hw/watchdog/wdt_i6300esb.c
@@ -24,7 +24,7 @@
 #include "qemu/module.h"
 #include "qemu/timer.h"
 #include "sysemu/watchdog.h"
-#include "hw/pci/pci.h"
+#include "hw/pci/pci_device.h"
 #include "migration/vmstate.h"
 #include "qom/object.h"
 
diff --git a/tests/qtest/fuzz/generic_fuzz.c b/tests/qtest/fuzz/generic_fuzz.c
index afc1d20355..7326f6840b 100644
--- a/tests/qtest/fuzz/generic_fuzz.c
+++ b/tests/qtest/fuzz/generic_fuzz.c
@@ -24,6 +24,7 @@
 #include "exec/ramblock.h"
 #include "hw/qdev-core.h"
 #include "hw/pci/pci.h"
+#include "hw/pci/pci_device.h"
 #include "hw/boards.h"
 #include "generic_fuzz_configs.h"
 #include "hw/mem/sparse-mem.h"
diff --git a/ui/util.c b/ui/util.c
index 907d60e032..d54bbb74fb 100644
--- a/ui/util.c
+++ b/ui/util.c
@@ -17,7 +17,7 @@
 
 #include "qemu/osdep.h"
 
-#include "hw/pci/pci.h"
+#include "hw/pci/pci_device.h"
 #include "hw/pci/pci_bus.h"
 #include "qapi/error.h"
 #include "ui/console.h"
-- 
MST


