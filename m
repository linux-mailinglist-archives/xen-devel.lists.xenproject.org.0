Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E6A06EDCFC
	for <lists+xen-devel@lfdr.de>; Tue, 25 Apr 2023 09:46:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.525746.817131 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1prDN4-0003ZW-0W; Tue, 25 Apr 2023 07:45:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 525746.817131; Tue, 25 Apr 2023 07:45:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1prDN3-0003XW-T0; Tue, 25 Apr 2023 07:45:53 +0000
Received: by outflank-mailman (input) for mailman id 525746;
 Tue, 25 Apr 2023 07:45:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=bwpa=AQ=redhat.com=mst@srs-se1.protection.inumbo.net>)
 id 1prDN2-0003XO-CW
 for xen-devel@lists.xenproject.org; Tue, 25 Apr 2023 07:45:52 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3228640a-e33d-11ed-b223-6b7b168915f2;
 Tue, 25 Apr 2023 09:45:50 +0200 (CEST)
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-589-5FbvCDsMMVucTY83pUDLkw-1; Tue, 25 Apr 2023 03:45:47 -0400
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-3f250e9e090so6441655e9.0
 for <xen-devel@lists.xenproject.org>; Tue, 25 Apr 2023 00:45:47 -0700 (PDT)
Received: from redhat.com ([2.55.61.39]) by smtp.gmail.com with ESMTPSA id
 c21-20020a7bc855000000b003f17300c7dcsm14069408wml.48.2023.04.25.00.45.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Apr 2023 00:45:45 -0700 (PDT)
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
X-Inumbo-ID: 3228640a-e33d-11ed-b223-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1682408749;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=sdqkWiEXuBbe0aMuicHVixExQ0RmC/KmdA8XIHRB1Jw=;
	b=DFpss1RSe5Q3/YBqOYsnaajaQEGoVIfPIwr4u80ZPfnk/SbbxCPTvhR9SDj3Igw2a1WnCT
	Mny3MCBn54YJ2oYz0YRtGXIXMKnXp6DMLi76KI/TvgXHfjs5/7a2mq9MVjNyJuMsuDlh/T
	5tdKoR1zd2QZ0QuMgEvNZx5fY3eIjdk=
X-MC-Unique: 5FbvCDsMMVucTY83pUDLkw-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682408746; x=1685000746;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sdqkWiEXuBbe0aMuicHVixExQ0RmC/KmdA8XIHRB1Jw=;
        b=iSJGD3z+U+0uV4EVgSfI6xvXRP/WbXAvmPkcL7gDfW5RM5Cc3GO+kUgNZV5Pc0fuVF
         Mn+Y104FgnTGRAbbciWBomizKX93GN7CuqiatWLQCtALWNuYEF9mXVckzkEEsDwdYs/Q
         Zi0AirbcdCZn7W027vTK6MX/aYpi3sbV2kjLwZqatC3gyryZKhw8CDlvwbDVU0G69r8h
         8+YJO+ZHqAbhN7EC2U07Q1P7GL/msRxBUtNmgMeBtqOlV0gUxtHhrs5krPFDveIPer3/
         MVGP7kgZq5qtySypUeEnfAammQx2/3PZFZuwoKyEs90XddUl9g8HEFSBq4vqNY25hh+2
         U/zw==
X-Gm-Message-State: AAQBX9e67411ZX0ybk1qH2fdp/Nw+sBTelX4VdXWHFF/ruvVLleVfyZI
	MHvxlwGvUi2EqhHHhyBWqBeMrzRbyZbwn1c+tf2dYFKJ4ALe6BwwcvEKVhbhQYibTNCL0g8mwwc
	qMiyTH1nyWFjKN4zfpsE7oqMEFW0=
X-Received: by 2002:a7b:c393:0:b0:3f1:6458:99a7 with SMTP id s19-20020a7bc393000000b003f1645899a7mr9012014wmj.38.1682408746653;
        Tue, 25 Apr 2023 00:45:46 -0700 (PDT)
X-Google-Smtp-Source: AKy350ad4TCuWCBC+AG461cfDN1Vfgv2g5HSPeZ6e0X8sYuDXur/RoTq2vL2cKfGjWKS10+DKS3e8g==
X-Received: by 2002:a7b:c393:0:b0:3f1:6458:99a7 with SMTP id s19-20020a7bc393000000b003f1645899a7mr9011994wmj.38.1682408746316;
        Tue, 25 Apr 2023 00:45:46 -0700 (PDT)
Date: Tue, 25 Apr 2023 03:45:42 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Chuck Zmudzinski <brchuckz@aol.com>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Artyom Tarasenko <atar4qemu@gmail.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Anthony Perard <anthony.perard@citrix.com>,
	Paul Durrant <paul@xen.org>, xen-devel@lists.xenproject.org
Subject: [PULL 16/31] pci: avoid accessing slot_reserved_mask directly
 outside of pci.c
Message-ID: <b93fe7f2ca9aea5ef74db5881aabecd7b1c234ed.1682408661.git.mst@redhat.com>
References: <cover.1682408661.git.mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <cover.1682408661.git.mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

From: Chuck Zmudzinski <brchuckz@aol.com>

This patch provides accessor functions as replacements for direct
access to slot_reserved_mask according to the comment at the top
of include/hw/pci/pci_bus.h which advises that data structures for
PCIBus should not be directly accessed but instead be accessed using
accessor functions in pci.h.

Three accessor functions can conveniently replace all direct accesses
of slot_reserved_mask. With this patch, the new accessor functions are
used in hw/sparc64/sun4u.c and hw/xen/xen_pt.c and pci_bus.h is removed
from the included header files of the same two files.

No functional change intended.

Signed-off-by: Chuck Zmudzinski <brchuckz@aol.com>
Message-Id: <b1b7f134883cbc83e455abbe5ee225c71aa0e8d0.1678888385.git.brchuckz@aol.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
Reviewed-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Tested-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk> [sun4u]
---
 include/hw/pci/pci.h |  3 +++
 hw/pci/pci.c         | 15 +++++++++++++++
 hw/sparc64/sun4u.c   |  7 +++----
 hw/xen/xen_pt.c      |  7 +++----
 4 files changed, 24 insertions(+), 8 deletions(-)

diff --git a/include/hw/pci/pci.h b/include/hw/pci/pci.h
index d5a40cd058..935b4b91b4 100644
--- a/include/hw/pci/pci.h
+++ b/include/hw/pci/pci.h
@@ -287,6 +287,9 @@ void pci_bus_irqs(PCIBus *bus, pci_set_irq_fn set_irq,
 void pci_bus_map_irqs(PCIBus *bus, pci_map_irq_fn map_irq);
 void pci_bus_irqs_cleanup(PCIBus *bus);
 int pci_bus_get_irq_level(PCIBus *bus, int irq_num);
+uint32_t pci_bus_get_slot_reserved_mask(PCIBus *bus);
+void pci_bus_set_slot_reserved_mask(PCIBus *bus, uint32_t mask);
+void pci_bus_clear_slot_reserved_mask(PCIBus *bus, uint32_t mask);
 /* 0 <= pin <= 3 0 = INTA, 1 = INTB, 2 = INTC, 3 = INTD */
 static inline int pci_swizzle(int slot, int pin)
 {
diff --git a/hw/pci/pci.c b/hw/pci/pci.c
index def5000e7b..8a87ccc8b0 100644
--- a/hw/pci/pci.c
+++ b/hw/pci/pci.c
@@ -1116,6 +1116,21 @@ static bool pci_bus_devfn_reserved(PCIBus *bus, int devfn)
     return bus->slot_reserved_mask & (1UL << PCI_SLOT(devfn));
 }
 
+uint32_t pci_bus_get_slot_reserved_mask(PCIBus *bus)
+{
+    return bus->slot_reserved_mask;
+}
+
+void pci_bus_set_slot_reserved_mask(PCIBus *bus, uint32_t mask)
+{
+    bus->slot_reserved_mask |= mask;
+}
+
+void pci_bus_clear_slot_reserved_mask(PCIBus *bus, uint32_t mask)
+{
+    bus->slot_reserved_mask &= ~mask;
+}
+
 /* -1 for devfn means auto assign */
 static PCIDevice *do_pci_register_device(PCIDevice *pci_dev,
                                          const char *name, int devfn,
diff --git a/hw/sparc64/sun4u.c b/hw/sparc64/sun4u.c
index a25e951f9d..eae7589462 100644
--- a/hw/sparc64/sun4u.c
+++ b/hw/sparc64/sun4u.c
@@ -31,7 +31,6 @@
 #include "hw/irq.h"
 #include "hw/pci/pci.h"
 #include "hw/pci/pci_bridge.h"
-#include "hw/pci/pci_bus.h"
 #include "hw/pci/pci_host.h"
 #include "hw/qdev-properties.h"
 #include "hw/pci-host/sabre.h"
@@ -608,9 +607,9 @@ static void sun4uv_init(MemoryRegion *address_space_mem,
     /* Only in-built Simba APBs can exist on the root bus, slot 0 on busA is
        reserved (leaving no slots free after on-board devices) however slots
        0-3 are free on busB */
-    pci_bus->slot_reserved_mask = 0xfffffffc;
-    pci_busA->slot_reserved_mask = 0xfffffff1;
-    pci_busB->slot_reserved_mask = 0xfffffff0;
+    pci_bus_set_slot_reserved_mask(pci_bus, 0xfffffffc);
+    pci_bus_set_slot_reserved_mask(pci_busA, 0xfffffff1);
+    pci_bus_set_slot_reserved_mask(pci_busB, 0xfffffff0);
 
     ebus = pci_new_multifunction(PCI_DEVFN(1, 0), true, TYPE_EBUS);
     qdev_prop_set_uint64(DEVICE(ebus), "console-serial-base",
diff --git a/hw/xen/xen_pt.c b/hw/xen/xen_pt.c
index 2d33d178ad..a540149639 100644
--- a/hw/xen/xen_pt.c
+++ b/hw/xen/xen_pt.c
@@ -57,7 +57,6 @@
 #include <sys/ioctl.h>
 
 #include "hw/pci/pci.h"
-#include "hw/pci/pci_bus.h"
 #include "hw/qdev-properties.h"
 #include "hw/qdev-properties-system.h"
 #include "xen_pt.h"
@@ -951,7 +950,7 @@ void xen_igd_reserve_slot(PCIBus *pci_bus)
     }
 
     XEN_PT_LOG(0, "Reserving PCI slot 2 for IGD\n");
-    pci_bus->slot_reserved_mask |= XEN_PCI_IGD_SLOT_MASK;
+    pci_bus_set_slot_reserved_mask(pci_bus, XEN_PCI_IGD_SLOT_MASK);
 }
 
 static void xen_igd_clear_slot(DeviceState *qdev, Error **errp)
@@ -971,7 +970,7 @@ static void xen_igd_clear_slot(DeviceState *qdev, Error **errp)
         return;
     }
 
-    if (!(pci_bus->slot_reserved_mask & XEN_PCI_IGD_SLOT_MASK)) {
+    if (!(pci_bus_get_slot_reserved_mask(pci_bus) & XEN_PCI_IGD_SLOT_MASK)) {
         xpdc->pci_qdev_realize(qdev, errp);
         return;
     }
@@ -982,7 +981,7 @@ static void xen_igd_clear_slot(DeviceState *qdev, Error **errp)
         s->real_device.dev == XEN_PCI_IGD_DEV &&
         s->real_device.func == XEN_PCI_IGD_FN &&
         s->real_device.vendor_id == PCI_VENDOR_ID_INTEL) {
-        pci_bus->slot_reserved_mask &= ~XEN_PCI_IGD_SLOT_MASK;
+        pci_bus_clear_slot_reserved_mask(pci_bus, XEN_PCI_IGD_SLOT_MASK);
         XEN_PT_LOG(pci_dev, "Intel IGD found, using slot 2\n");
     }
     xpdc->pci_qdev_realize(qdev, errp);
-- 
MST


