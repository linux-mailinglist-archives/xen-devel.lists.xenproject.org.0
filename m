Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F243B65D668
	for <lists+xen-devel@lfdr.de>; Wed,  4 Jan 2023 15:45:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.471208.731019 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pD51J-0000Qe-Ik; Wed, 04 Jan 2023 14:45:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 471208.731019; Wed, 04 Jan 2023 14:45:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pD51J-0000NJ-EL; Wed, 04 Jan 2023 14:45:33 +0000
Received: by outflank-mailman (input) for mailman id 471208;
 Wed, 04 Jan 2023 14:45:31 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=bCSi=5B=gmail.com=shentey@srs-se1.protection.inumbo.net>)
 id 1pD51H-00079V-HU
 for xen-devel@lists.xenproject.org; Wed, 04 Jan 2023 14:45:31 +0000
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [2a00:1450:4864:20::335])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6ede4b6e-8c3e-11ed-b8d0-410ff93cb8f0;
 Wed, 04 Jan 2023 15:45:29 +0100 (CET)
Received: by mail-wm1-x335.google.com with SMTP id m3so16838999wmq.0
 for <xen-devel@lists.xenproject.org>; Wed, 04 Jan 2023 06:45:29 -0800 (PST)
Received: from osoxes.fritz.box
 (p200300faaf0bb2009c4947838afc41b6.dip0.t-ipconnect.de.
 [2003:fa:af0b:b200:9c49:4783:8afc:41b6])
 by smtp.gmail.com with ESMTPSA id
 e10-20020a5d594a000000b0028663fc8f4csm21168241wri.30.2023.01.04.06.45.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Jan 2023 06:45:28 -0800 (PST)
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
X-Inumbo-ID: 6ede4b6e-8c3e-11ed-b8d0-410ff93cb8f0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E4FebSrd6qw4EtXuaelySJNjsiB1Oj70YbVnrwvN8/I=;
        b=lMKvYCGOWYmnaT84GaMb23/VAi195oDQudE1wLzcerQEkKvvtsHLGjOSg3Wp4GFafE
         XEtBgvv3xHIUWKKXmH1Ae9427VzyfEBA7cUKnYZSZvXPXSBefmryW+xa2Iv6VyKgWZfs
         r85U50UOY19i1THGPSpmLtkLrbogJ7ind85Uxcyqly4kLwW+iIYVU0SFYWcvUyE/B88b
         LnK2tJgHA8CffJ4VpAQZujNkJQGRaVtif+jOh2hKIW0Htmy+z0Ns9XHX5CwsqjO/ECtm
         2O5VciXS7zNEcI+bZMOyLKHtdkcj+Ej/CLxWUUVLE1r7h5cOkCZL6K1xhBFqGNEijOdc
         pK5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=E4FebSrd6qw4EtXuaelySJNjsiB1Oj70YbVnrwvN8/I=;
        b=VubhW56+2sC0a3puKqULFdv9Gkm+LnINfZRaYDMOi0Xf36oRRGzZ5oxbP5vOFaIKPz
         K5VZMTTvKUMw/UjLrT/dzw9ezOfiiF7BsE+7YbRxtzgrb4kZdxcf2Ep8w2LLae++qCb2
         mAzA3tXm6WPI4uhfFDnLwlG9gOb2RK9QueK0+n3Zh+8t707IuA08cZZpWwRC1uz7fOqz
         MlRocXKzkaYepwoZOWA8Ea2jgIU1dXQSDZGPeG0zBDvyyO1JnP6ctzXs1sAtOqZ+HakC
         AQPbFW9yItVag7P6D7x1rHyTn29FflavWIgAtahJ6jB6Z8alHwXZSqttBrVjajR0D8TQ
         RonA==
X-Gm-Message-State: AFqh2koIjQC6wfGpSqX8+uTIVeEI+t/aMYT0VvHWpPVWkBg1AVxapUcD
	zGS8z2ua3K/2ATz1s7DXO/Y=
X-Google-Smtp-Source: AMrXdXsYGgxoZWnwVZ7yR7arNry46fXICAla5+IdicOq5hbJrnHe2MpsGju5mZBACJ42RwflZH2L8w==
X-Received: by 2002:a05:600c:54cb:b0:3cf:d0be:1231 with SMTP id iw11-20020a05600c54cb00b003cfd0be1231mr41547624wmb.13.1672843529178;
        Wed, 04 Jan 2023 06:45:29 -0800 (PST)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	xen-devel@lists.xenproject.org,
	=?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
	Aurelien Jarno <aurelien@aurel32.net>,
	Paul Durrant <paul@xen.org>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Anthony Perard <anthony.perard@citrix.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Eduardo Habkost <eduardo@habkost.net>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Chuck Zmudzinski <brchuckz@aol.com>,
	Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH v2 6/6] hw/isa/piix: Resolve redundant TYPE_PIIX3_XEN_DEVICE
Date: Wed,  4 Jan 2023 15:44:37 +0100
Message-Id: <20230104144437.27479-7-shentey@gmail.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230104144437.27479-1-shentey@gmail.com>
References: <20230104144437.27479-1-shentey@gmail.com>
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
index 5738d9cdca..6b8de3d59d 100644
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


