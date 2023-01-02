Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1434565B764
	for <lists+xen-devel@lfdr.de>; Mon,  2 Jan 2023 22:36:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.470404.729957 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pCSTE-000574-BT; Mon, 02 Jan 2023 21:35:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 470404.729957; Mon, 02 Jan 2023 21:35:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pCSTE-00053C-6V; Mon, 02 Jan 2023 21:35:48 +0000
Received: by outflank-mailman (input) for mailman id 470404;
 Mon, 02 Jan 2023 21:35:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jV8v=47=gmail.com=shentey@srs-se1.protection.inumbo.net>)
 id 1pCSTC-0003Wk-Qk
 for xen-devel@lists.xenproject.org; Mon, 02 Jan 2023 21:35:46 +0000
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [2a00:1450:4864:20::62f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6a0576a9-8ae5-11ed-b8d0-410ff93cb8f0;
 Mon, 02 Jan 2023 22:35:45 +0100 (CET)
Received: by mail-ej1-x62f.google.com with SMTP id u19so69210598ejm.8
 for <xen-devel@lists.xenproject.org>; Mon, 02 Jan 2023 13:35:45 -0800 (PST)
Received: from osoxes.fritz.box
 (p200300faaf0bb2009c4947838afc41b6.dip0.t-ipconnect.de.
 [2003:fa:af0b:b200:9c49:4783:8afc:41b6])
 by smtp.gmail.com with ESMTPSA id
 f11-20020a17090631cb00b0084c465709b7sm10583826ejf.74.2023.01.02.13.35.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Jan 2023 13:35:44 -0800 (PST)
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
X-Inumbo-ID: 6a0576a9-8ae5-11ed-b8d0-410ff93cb8f0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Di8D1ZLAqNG4YBVeY21LWd3M3jwmUnOPUPIRfWvH74o=;
        b=oKrx+5YbmTLqbEyB0IFlqqHxQljKl/Fp1de0CQdBSfdKl10T7XcJA8XTNLwawbTkeh
         j5cv6e8K3sfV/6QNn70B21D7ZKgQZTo6P0tzupn4POy+aqrOfkP+od97KKCbHnOo6Fpj
         sPkN9L6tV5zGaOfBboViBOI31hupccc6I1zTDQGrZnwnnQcNQ7H1IESNC/LCsbAvfHAZ
         tHza0+AzW+kC0P4eZuGrQfVFLSnww6j6TKQuz3rfwRxSJJBD6CJQdyvobGr3WA3BHfc3
         pRH+0ycpzvBgWh/4lVAbvjxJL97sgxaxg9vbiPlGIZI0NsS7h9yctI5oRHM+0gDXCPgf
         wI3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Di8D1ZLAqNG4YBVeY21LWd3M3jwmUnOPUPIRfWvH74o=;
        b=Y2yRrYs/cCAa2wY9z2Qk/jLy7yiywOKBrIzz4j0QDTToJaY1MeMRlj1isdRryTrVjT
         SteVF1MYNY5LCkyhJ1Lx98emwDOVlUwbJlMQQ9uhXfg6zNYFrEJGI7jDU4sjahSaXKf9
         zpxOAkTktxvOz5VDuff7xlvh63zY+dQCOaxqXKX0zWHUeShGiphVK79TrgQV3yb/nN0z
         ujE/aHjl5ggeMWycAV3K94djwkUDScVD5XE8c/RGI9JKxHA8o6aKW8Q69QLkhqhYbGP9
         5mjnBdw8TClOWLUKqnsrI+twtWG5JRhfE4nATOpHf73v/JZ7CpKoEoJMTXZS6m2hvKK8
         rtQw==
X-Gm-Message-State: AFqh2krWy2NAhUHG3p9G0Wyunap00h0CIFiQ7PfMk00RYXrLfv4r1XLH
	4Lab/GaN+oZIab2gXV/L68Wyb9YLU8M=
X-Google-Smtp-Source: AMrXdXuZ+eoqe1BE27lbsYyf/6auDgeXSZ1ibYoD7I6UMu7gzvCwnSHmEmW7pvlF2BvjpLremBPADA==
X-Received: by 2002:a17:907:a407:b0:84c:7974:8a73 with SMTP id sg7-20020a170907a40700b0084c79748a73mr22076362ejc.57.1672695344686;
        Mon, 02 Jan 2023 13:35:44 -0800 (PST)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: Paul Durrant <paul@xen.org>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Anthony Perard <anthony.perard@citrix.com>,
	Aurelien Jarno <aurelien@aurel32.net>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Eduardo Habkost <eduardo@habkost.net>,
	xen-devel@lists.xenproject.org,
	=?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH 6/6] hw/isa/piix: Resolve redundant TYPE_PIIX3_XEN_DEVICE
Date: Mon,  2 Jan 2023 22:35:04 +0100
Message-Id: <20230102213504.14646-7-shentey@gmail.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230102213504.14646-1-shentey@gmail.com>
References: <20230102213504.14646-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

During the last patches, TYPE_PIIX3_XEN_DEVICE turned into a clone of
TYPE_PIIX3_DEVICE. Remove this redundancy.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
---
 hw/i386/pc_piix.c             |  4 +---
 hw/isa/piix.c                 | 20 --------------------
 include/hw/southbridge/piix.h |  1 -
 3 files changed, 1 insertion(+), 24 deletions(-)

diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
index 7ef0054b3a..76d98183ac 100644
--- a/hw/i386/pc_piix.c
+++ b/hw/i386/pc_piix.c
@@ -235,8 +235,6 @@ static void pc_init1(MachineState *machine,
     if (pcmc->pci_enabled) {
         DeviceState *dev;
         PCIDevice *pci_dev;
-        const char *type = xen_enabled() ? TYPE_PIIX3_XEN_DEVICE
-                                         : TYPE_PIIX3_DEVICE;
         int i;
 
         pci_bus = i440fx_init(pci_type,
@@ -250,7 +248,7 @@ static void pc_init1(MachineState *machine,
                                        : pci_slot_get_pirq);
         pcms->bus = pci_bus;
 
-        pci_dev = pci_new_multifunction(-1, true, type);
+        pci_dev = pci_new_multifunction(-1, true, TYPE_PIIX3_DEVICE);
         object_property_set_bool(OBJECT(pci_dev), "has-usb",
                                  machine_usb(machine), &error_abort);
         object_property_set_bool(OBJECT(pci_dev), "has-acpi",
diff --git a/hw/isa/piix.c b/hw/isa/piix.c
index 98e9b12661..e4587352c9 100644
--- a/hw/isa/piix.c
+++ b/hw/isa/piix.c
@@ -33,7 +33,6 @@
 #include "hw/qdev-properties.h"
 #include "hw/ide/piix.h"
 #include "hw/isa/isa.h"
-#include "hw/xen/xen.h"
 #include "sysemu/runstate.h"
 #include "migration/vmstate.h"
 #include "hw/acpi/acpi_aml_interface.h"
@@ -465,24 +464,6 @@ static const TypeInfo piix3_info = {
     .class_init    = piix3_class_init,
 };
 
-static void piix3_xen_class_init(ObjectClass *klass, void *data)
-{
-    DeviceClass *dc = DEVICE_CLASS(klass);
-    PCIDeviceClass *k = PCI_DEVICE_CLASS(klass);
-
-    k->realize = piix3_realize;
-    /* 82371SB PIIX3 PCI-to-ISA bridge (Step A1) */
-    k->device_id = PCI_DEVICE_ID_INTEL_82371SB_0;
-    dc->vmsd = &vmstate_piix3;
-}
-
-static const TypeInfo piix3_xen_info = {
-    .name          = TYPE_PIIX3_XEN_DEVICE,
-    .parent        = TYPE_PIIX_PCI_DEVICE,
-    .instance_init = piix3_init,
-    .class_init    = piix3_xen_class_init,
-};
-
 static void piix4_realize(PCIDevice *dev, Error **errp)
 {
     ERRP_GUARD();
@@ -534,7 +515,6 @@ static void piix3_register_types(void)
 {
     type_register_static(&piix_pci_type_info);
     type_register_static(&piix3_info);
-    type_register_static(&piix3_xen_info);
     type_register_static(&piix4_info);
 }
 
diff --git a/include/hw/southbridge/piix.h b/include/hw/southbridge/piix.h
index 65ad8569da..b1fc94a742 100644
--- a/include/hw/southbridge/piix.h
+++ b/include/hw/southbridge/piix.h
@@ -77,7 +77,6 @@ struct PIIXState {
 OBJECT_DECLARE_SIMPLE_TYPE(PIIXState, PIIX_PCI_DEVICE)
 
 #define TYPE_PIIX3_DEVICE "PIIX3"
-#define TYPE_PIIX3_XEN_DEVICE "PIIX3-xen"
 #define TYPE_PIIX4_PCI_DEVICE "piix4-isa"
 
 #endif
-- 
2.39.0


