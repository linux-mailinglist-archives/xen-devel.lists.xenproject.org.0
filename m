Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CC2065E795
	for <lists+xen-devel@lfdr.de>; Thu,  5 Jan 2023 10:21:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.471763.731747 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pDMRP-0002lK-Cn; Thu, 05 Jan 2023 09:21:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 471763.731747; Thu, 05 Jan 2023 09:21:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pDMRP-0002ib-9h; Thu, 05 Jan 2023 09:21:39 +0000
Received: by outflank-mailman (input) for mailman id 471763;
 Thu, 05 Jan 2023 09:21:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=+8dv=5C=redhat.com=mst@srs-se1.protection.inumbo.net>)
 id 1pDMRM-0002iT-Uw
 for xen-devel@lists.xenproject.org; Thu, 05 Jan 2023 09:21:37 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 59059493-8cda-11ed-91b6-6bf2151ebd3b;
 Thu, 05 Jan 2023 10:21:35 +0100 (CET)
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-43-VgtQ5RWpOqOlpYBu-NTB8Q-1; Thu, 05 Jan 2023 04:21:32 -0500
Received: by mail-wm1-f70.google.com with SMTP id
 fm25-20020a05600c0c1900b003d9702a11e5so17818777wmb.0
 for <xen-devel@lists.xenproject.org>; Thu, 05 Jan 2023 01:21:32 -0800 (PST)
Received: from redhat.com ([2.52.151.85]) by smtp.gmail.com with ESMTPSA id
 p7-20020a05600c1d8700b003cf4eac8e80sm2044043wms.23.2023.01.05.01.21.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Jan 2023 01:21:30 -0800 (PST)
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
X-Inumbo-ID: 59059493-8cda-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1672910494;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=WvJnFbsqNB85Ex5Jy9JWOBFwO+5P6BtsVC31mbY8Jko=;
	b=hglsu2slg4MnTDYTUy47wghObtzBvyy0Sz0A7flJqHBc5WfEWYsRk65a/7aSGx6yL5k2Jt
	f0Grl/pHJ8YJl3NHF1vJTcRX3+W7BoGwMBbnY8EaLQTsRxOHt9MzTKX/vC09kXbZ2trMf1
	XGsLUKtVK/MOjjiUXdj3/abKlOSzkqU=
X-MC-Unique: VgtQ5RWpOqOlpYBu-NTB8Q-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WvJnFbsqNB85Ex5Jy9JWOBFwO+5P6BtsVC31mbY8Jko=;
        b=I3r1yIlneraGv1ZM1ZfhOo1nQI8KthQbM62LKQFt2ytgN44yEh30phFZMck7v1ZBwb
         uEQ7BKG6bCvhpxmxf+kEz+2kmlNm9YQO4xIZuK9RBCktTkgKpJfFpuz4aF0KJL0gQdF8
         x8eIfPTQhOeDX3r8Xlcx+1t2EVqblguIMBTCsy1aFgfvKxZxAZOUzyHhb0x6AoUZnCiK
         TjbBTnfXRlAoMh18ZqWN8SkP9E3WtvvdYRQYrsNJHKn3k+b3O36aErjNkvyiz0H5M8J4
         Qh8KttUDjvQcSt3I9SvnPK5moul3jYkzM/+CWFWi3o2KPxBrX1VtvTKc9ZDkaLxiH6vO
         tGAQ==
X-Gm-Message-State: AFqh2kpiEnk7eUxPF2EuCjn5tPULH35C9SjveQr63cEeX9W6+mjvTg27
	/z/R3O67Tkr3VqhLdkLRNqxeQNsAM4ER6g36AZNhzzhu4bIvX2RE/UyieCAqKDY3KOBrO0yy8dW
	lHdeKSPvVSRTU6s9cJdqQlC70UAQ=
X-Received: by 2002:a05:600c:1c21:b0:3d2:2043:9cb7 with SMTP id j33-20020a05600c1c2100b003d220439cb7mr34918982wms.5.1672910491475;
        Thu, 05 Jan 2023 01:21:31 -0800 (PST)
X-Google-Smtp-Source: AMrXdXtLDlc36VB/aXU7Q2yc/oSic44vXngqutQ8bJreyz+6azTWmcavTASW5ywJO485dZiUmBNxkw==
X-Received: by 2002:a05:600c:1c21:b0:3d2:2043:9cb7 with SMTP id j33-20020a05600c1c2100b003d220439cb7mr34918960wms.5.1672910491141;
        Thu, 05 Jan 2023 01:21:31 -0800 (PST)
Date: Thu, 5 Jan 2023 04:21:26 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Markus Armbruster <armbru@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Igor Mammedov <imammedo@redhat.com>, Ani Sinha <ani@anisinha.ca>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Eduardo Habkost <eduardo@habkost.net>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Yuval Shaia <yuval.shaia.ml@gmail.com>, Fam Zheng <fam@euphon.net>,
	Gerd Hoffmann <kraxel@redhat.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Anthony Perard <anthony.perard@citrix.com>,
	Paul Durrant <paul@xen.org>, Ben Widawsky <ben.widawsky@intel.com>,
	Jonathan Cameron <jonathan.cameron@huawei.com>,
	Huacai Chen <chenhuacai@kernel.org>,
	Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Andrey Smirnov <andrew.smirnov@gmail.com>,
	Xiaojuan Yang <yangxiaojuan@loongson.cn>,
	Song Gao <gaosong@loongson.cn>,
	=?utf-8?Q?C=C3=A9dric?= Le Goater <clg@kaod.org>,
	Paul Burton <paulburton@kernel.org>,
	Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
	xen-devel@lists.xenproject.org, qemu-arm@nongnu.org,
	qemu-ppc@nongnu.org
Subject: [PULL 27/51] include/hw/pci: Break inclusion loop pci_bridge.h and
 cxl.h
Message-ID: <20230105091310.263867-28-mst@redhat.com>
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

hw/pci/pci_bridge.h and hw/cxl/cxl.h include each other.

Fortunately, breaking the loop is merely a matter of deleting
unnecessary includes from headers, and adding them back in places
where they are now missing.

Signed-off-by: Markus Armbruster <armbru@redhat.com>
Message-Id: <20221222100330.380143-2-armbru@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/alpha/alpha_sys.h              | 1 -
 hw/rdma/rdma_utils.h              | 1 -
 hw/rdma/vmw/pvrdma.h              | 1 -
 hw/usb/hcd-ehci.h                 | 1 -
 hw/xen/xen_pt.h                   | 1 -
 include/hw/cxl/cxl.h              | 1 -
 include/hw/cxl/cxl_cdat.h         | 1 +
 include/hw/cxl/cxl_device.h       | 1 +
 include/hw/cxl/cxl_pci.h          | 2 --
 include/hw/i386/ich9.h            | 4 ----
 include/hw/i386/x86-iommu.h       | 1 -
 include/hw/isa/vt82c686.h         | 1 -
 include/hw/pci-host/designware.h  | 3 ---
 include/hw/pci-host/i440fx.h      | 2 +-
 include/hw/pci-host/ls7a.h        | 2 --
 include/hw/pci-host/pnv_phb3.h    | 2 --
 include/hw/pci-host/pnv_phb4.h    | 3 +--
 include/hw/pci-host/xilinx-pcie.h | 1 -
 include/hw/pci/pcie.h             | 1 -
 include/hw/virtio/virtio-scsi.h   | 1 -
 hw/alpha/pci.c                    | 1 +
 hw/alpha/typhoon.c                | 2 +-
 hw/i386/acpi-build.c              | 2 +-
 hw/pci-bridge/i82801b11.c         | 2 +-
 hw/rdma/rdma_utils.c              | 1 +
 hw/scsi/virtio-scsi.c             | 1 +
 26 files changed, 10 insertions(+), 30 deletions(-)

diff --git a/hw/alpha/alpha_sys.h b/hw/alpha/alpha_sys.h
index 2263e821da..a303c58438 100644
--- a/hw/alpha/alpha_sys.h
+++ b/hw/alpha/alpha_sys.h
@@ -5,7 +5,6 @@
 
 #include "target/alpha/cpu-qom.h"
 #include "hw/pci/pci.h"
-#include "hw/pci/pci_host.h"
 #include "hw/boards.h"
 #include "hw/intc/i8259.h"
 
diff --git a/hw/rdma/rdma_utils.h b/hw/rdma/rdma_utils.h
index 0c6414e7e0..54e4f56edd 100644
--- a/hw/rdma/rdma_utils.h
+++ b/hw/rdma/rdma_utils.h
@@ -18,7 +18,6 @@
 #define RDMA_UTILS_H
 
 #include "qemu/error-report.h"
-#include "hw/pci/pci.h"
 #include "sysemu/dma.h"
 
 #define rdma_error_report(fmt, ...) \
diff --git a/hw/rdma/vmw/pvrdma.h b/hw/rdma/vmw/pvrdma.h
index d08965d3e2..0caf95ede8 100644
--- a/hw/rdma/vmw/pvrdma.h
+++ b/hw/rdma/vmw/pvrdma.h
@@ -18,7 +18,6 @@
 
 #include "qemu/units.h"
 #include "qemu/notify.h"
-#include "hw/pci/pci.h"
 #include "hw/pci/msix.h"
 #include "chardev/char-fe.h"
 #include "hw/net/vmxnet3_defs.h"
diff --git a/hw/usb/hcd-ehci.h b/hw/usb/hcd-ehci.h
index a173707d9b..4d4b2830b7 100644
--- a/hw/usb/hcd-ehci.h
+++ b/hw/usb/hcd-ehci.h
@@ -23,7 +23,6 @@
 #include "sysemu/dma.h"
 #include "hw/pci/pci.h"
 #include "hw/sysbus.h"
-#include "qom/object.h"
 
 #ifndef EHCI_DEBUG
 #define EHCI_DEBUG   0
diff --git a/hw/xen/xen_pt.h b/hw/xen/xen_pt.h
index e7c4316a7d..cf10fc7bbf 100644
--- a/hw/xen/xen_pt.h
+++ b/hw/xen/xen_pt.h
@@ -2,7 +2,6 @@
 #define XEN_PT_H
 
 #include "hw/xen/xen_common.h"
-#include "hw/pci/pci.h"
 #include "xen-host-pci-device.h"
 #include "qom/object.h"
 
diff --git a/include/hw/cxl/cxl.h b/include/hw/cxl/cxl.h
index 38e0e271d5..5129557bee 100644
--- a/include/hw/cxl/cxl.h
+++ b/include/hw/cxl/cxl.h
@@ -13,7 +13,6 @@
 
 #include "qapi/qapi-types-machine.h"
 #include "qapi/qapi-visit-machine.h"
-#include "hw/pci/pci_bridge.h"
 #include "hw/pci/pci_host.h"
 #include "cxl_pci.h"
 #include "cxl_component.h"
diff --git a/include/hw/cxl/cxl_cdat.h b/include/hw/cxl/cxl_cdat.h
index e9eda00142..7f67638685 100644
--- a/include/hw/cxl/cxl_cdat.h
+++ b/include/hw/cxl/cxl_cdat.h
@@ -11,6 +11,7 @@
 #define CXL_CDAT_H
 
 #include "hw/cxl/cxl_pci.h"
+#include "hw/pci/pcie_doe.h"
 
 /*
  * Reference:
diff --git a/include/hw/cxl/cxl_device.h b/include/hw/cxl/cxl_device.h
index 449b0edfe9..fd475b947b 100644
--- a/include/hw/cxl/cxl_device.h
+++ b/include/hw/cxl/cxl_device.h
@@ -10,6 +10,7 @@
 #ifndef CXL_DEVICE_H
 #define CXL_DEVICE_H
 
+#include "hw/pci/pci.h"
 #include "hw/register.h"
 
 /*
diff --git a/include/hw/cxl/cxl_pci.h b/include/hw/cxl/cxl_pci.h
index 3cb79eca1e..aca14845ab 100644
--- a/include/hw/cxl/cxl_pci.h
+++ b/include/hw/cxl/cxl_pci.h
@@ -11,8 +11,6 @@
 #define CXL_PCI_H
 
 #include "qemu/compiler.h"
-#include "hw/pci/pci.h"
-#include "hw/pci/pcie.h"
 #include "hw/cxl/cxl_cdat.h"
 
 #define CXL_VENDOR_ID 0x1e98
diff --git a/include/hw/i386/ich9.h b/include/hw/i386/ich9.h
index 23ee8e371b..222781e8b9 100644
--- a/include/hw/i386/ich9.h
+++ b/include/hw/i386/ich9.h
@@ -5,12 +5,8 @@
 #include "hw/sysbus.h"
 #include "hw/i386/pc.h"
 #include "hw/isa/apm.h"
-#include "hw/pci/pci.h"
-#include "hw/pci/pcie_host.h"
-#include "hw/pci/pci_bridge.h"
 #include "hw/acpi/acpi.h"
 #include "hw/acpi/ich9.h"
-#include "hw/pci/pci_bus.h"
 #include "qom/object.h"
 
 void ich9_lpc_set_irq(void *opaque, int irq_num, int level);
diff --git a/include/hw/i386/x86-iommu.h b/include/hw/i386/x86-iommu.h
index 7637edb430..8d8d53b18b 100644
--- a/include/hw/i386/x86-iommu.h
+++ b/include/hw/i386/x86-iommu.h
@@ -21,7 +21,6 @@
 #define HW_I386_X86_IOMMU_H
 
 #include "hw/sysbus.h"
-#include "hw/pci/pci.h"
 #include "hw/pci/msi.h"
 #include "qom/object.h"
 
diff --git a/include/hw/isa/vt82c686.h b/include/hw/isa/vt82c686.h
index eaa07881c5..e273cd38dc 100644
--- a/include/hw/isa/vt82c686.h
+++ b/include/hw/isa/vt82c686.h
@@ -1,7 +1,6 @@
 #ifndef HW_VT82C686_H
 #define HW_VT82C686_H
 
-#include "hw/pci/pci.h"
 
 #define TYPE_VT82C686B_ISA "vt82c686b-isa"
 #define TYPE_VT82C686B_USB_UHCI "vt82c686b-usb-uhci"
diff --git a/include/hw/pci-host/designware.h b/include/hw/pci-host/designware.h
index 6d9b51ae67..908f3d946b 100644
--- a/include/hw/pci-host/designware.h
+++ b/include/hw/pci-host/designware.h
@@ -22,9 +22,6 @@
 #define DESIGNWARE_H
 
 #include "hw/sysbus.h"
-#include "hw/pci/pci.h"
-#include "hw/pci/pci_bus.h"
-#include "hw/pci/pcie_host.h"
 #include "hw/pci/pci_bridge.h"
 #include "qom/object.h"
 
diff --git a/include/hw/pci-host/i440fx.h b/include/hw/pci-host/i440fx.h
index d02bf1ed6b..fc93e22732 100644
--- a/include/hw/pci-host/i440fx.h
+++ b/include/hw/pci-host/i440fx.h
@@ -11,7 +11,7 @@
 #ifndef HW_PCI_I440FX_H
 #define HW_PCI_I440FX_H
 
-#include "hw/pci/pci_bus.h"
+#include "hw/pci/pci.h"
 #include "hw/pci-host/pam.h"
 #include "qom/object.h"
 
diff --git a/include/hw/pci-host/ls7a.h b/include/hw/pci-host/ls7a.h
index df7fa55a30..b27db8e2ca 100644
--- a/include/hw/pci-host/ls7a.h
+++ b/include/hw/pci-host/ls7a.h
@@ -8,8 +8,6 @@
 #ifndef HW_LS7A_H
 #define HW_LS7A_H
 
-#include "hw/pci/pci.h"
-#include "hw/pci/pcie_host.h"
 #include "hw/pci-host/pam.h"
 #include "qemu/units.h"
 #include "qemu/range.h"
diff --git a/include/hw/pci-host/pnv_phb3.h b/include/hw/pci-host/pnv_phb3.h
index 4854f6d2f6..f791ebda9b 100644
--- a/include/hw/pci-host/pnv_phb3.h
+++ b/include/hw/pci-host/pnv_phb3.h
@@ -10,8 +10,6 @@
 #ifndef PCI_HOST_PNV_PHB3_H
 #define PCI_HOST_PNV_PHB3_H
 
-#include "hw/pci/pcie_host.h"
-#include "hw/pci/pcie_port.h"
 #include "hw/ppc/xics.h"
 #include "qom/object.h"
 #include "hw/pci-host/pnv_phb.h"
diff --git a/include/hw/pci-host/pnv_phb4.h b/include/hw/pci-host/pnv_phb4.h
index 50d4faa001..d9cea3f952 100644
--- a/include/hw/pci-host/pnv_phb4.h
+++ b/include/hw/pci-host/pnv_phb4.h
@@ -10,8 +10,7 @@
 #ifndef PCI_HOST_PNV_PHB4_H
 #define PCI_HOST_PNV_PHB4_H
 
-#include "hw/pci/pcie_host.h"
-#include "hw/pci/pcie_port.h"
+#include "hw/pci/pci_bus.h"
 #include "hw/ppc/xive.h"
 #include "qom/object.h"
 
diff --git a/include/hw/pci-host/xilinx-pcie.h b/include/hw/pci-host/xilinx-pcie.h
index 89be88d87f..e1b3c1c280 100644
--- a/include/hw/pci-host/xilinx-pcie.h
+++ b/include/hw/pci-host/xilinx-pcie.h
@@ -21,7 +21,6 @@
 #define HW_XILINX_PCIE_H
 
 #include "hw/sysbus.h"
-#include "hw/pci/pci.h"
 #include "hw/pci/pci_bridge.h"
 #include "hw/pci/pcie_host.h"
 #include "qom/object.h"
diff --git a/include/hw/pci/pcie.h b/include/hw/pci/pcie.h
index 698d3de851..798a262a0a 100644
--- a/include/hw/pci/pcie.h
+++ b/include/hw/pci/pcie.h
@@ -26,7 +26,6 @@
 #include "hw/pci/pcie_aer.h"
 #include "hw/pci/pcie_sriov.h"
 #include "hw/hotplug.h"
-#include "hw/pci/pcie_doe.h"
 
 typedef enum {
     /* for attention and power indicator */
diff --git a/include/hw/virtio/virtio-scsi.h b/include/hw/virtio/virtio-scsi.h
index a36aad9c86..37b75e15e3 100644
--- a/include/hw/virtio/virtio-scsi.h
+++ b/include/hw/virtio/virtio-scsi.h
@@ -20,7 +20,6 @@
 #define VIRTIO_SCSI_SENSE_SIZE 0
 #include "standard-headers/linux/virtio_scsi.h"
 #include "hw/virtio/virtio.h"
-#include "hw/pci/pci.h"
 #include "hw/scsi/scsi.h"
 #include "chardev/char-fe.h"
 #include "sysemu/iothread.h"
diff --git a/hw/alpha/pci.c b/hw/alpha/pci.c
index 72251fcdf0..7c18297177 100644
--- a/hw/alpha/pci.c
+++ b/hw/alpha/pci.c
@@ -7,6 +7,7 @@
  */
 
 #include "qemu/osdep.h"
+#include "hw/pci/pci_host.h"
 #include "alpha_sys.h"
 #include "qemu/log.h"
 #include "trace.h"
diff --git a/hw/alpha/typhoon.c b/hw/alpha/typhoon.c
index bd39c8ca86..49a80550c5 100644
--- a/hw/alpha/typhoon.c
+++ b/hw/alpha/typhoon.c
@@ -10,10 +10,10 @@
 #include "qemu/module.h"
 #include "qemu/units.h"
 #include "qapi/error.h"
+#include "hw/pci/pci_host.h"
 #include "cpu.h"
 #include "hw/irq.h"
 #include "alpha_sys.h"
-#include "qom/object.h"
 
 
 #define TYPE_TYPHOON_PCI_HOST_BRIDGE "typhoon-pcihost"
diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
index aa15b11cde..127c4e2d50 100644
--- a/hw/i386/acpi-build.c
+++ b/hw/i386/acpi-build.c
@@ -27,7 +27,7 @@
 #include "acpi-common.h"
 #include "qemu/bitmap.h"
 #include "qemu/error-report.h"
-#include "hw/pci/pci.h"
+#include "hw/pci/pci_bridge.h"
 #include "hw/cxl/cxl.h"
 #include "hw/core/cpu.h"
 #include "target/i386/cpu.h"
diff --git a/hw/pci-bridge/i82801b11.c b/hw/pci-bridge/i82801b11.c
index d9f224818b..f3b4a14611 100644
--- a/hw/pci-bridge/i82801b11.c
+++ b/hw/pci-bridge/i82801b11.c
@@ -42,7 +42,7 @@
  */
 
 #include "qemu/osdep.h"
-#include "hw/pci/pci.h"
+#include "hw/pci/pci_bridge.h"
 #include "migration/vmstate.h"
 #include "qemu/module.h"
 #include "hw/i386/ich9.h"
diff --git a/hw/rdma/rdma_utils.c b/hw/rdma/rdma_utils.c
index 5a7ef63ad2..77008552f4 100644
--- a/hw/rdma/rdma_utils.c
+++ b/hw/rdma/rdma_utils.c
@@ -14,6 +14,7 @@
  */
 
 #include "qemu/osdep.h"
+#include "hw/pci/pci.h"
 #include "trace.h"
 #include "rdma_utils.h"
 
diff --git a/hw/scsi/virtio-scsi.c b/hw/scsi/virtio-scsi.c
index 6f6e2e32ba..2b649ca976 100644
--- a/hw/scsi/virtio-scsi.c
+++ b/hw/scsi/virtio-scsi.c
@@ -22,6 +22,7 @@
 #include "qemu/iov.h"
 #include "qemu/module.h"
 #include "sysemu/block-backend.h"
+#include "sysemu/dma.h"
 #include "hw/qdev-properties.h"
 #include "hw/scsi/scsi.h"
 #include "scsi/constants.h"
-- 
MST


