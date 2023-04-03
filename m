Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E3976D3E40
	for <lists+xen-devel@lfdr.de>; Mon,  3 Apr 2023 09:42:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.517315.802515 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pjEp2-0002KV-1P; Mon, 03 Apr 2023 07:41:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 517315.802515; Mon, 03 Apr 2023 07:41:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pjEp1-0002FC-Qc; Mon, 03 Apr 2023 07:41:47 +0000
Received: by outflank-mailman (input) for mailman id 517315;
 Mon, 03 Apr 2023 07:41:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=qzQh=72=gmail.com=shentey@srs-se1.protection.inumbo.net>)
 id 1pjEoz-0000Sg-4z
 for xen-devel@lists.xenproject.org; Mon, 03 Apr 2023 07:41:45 +0000
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [2a00:1450:4864:20::429])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fa87ecf0-d1f2-11ed-b464-930f4c7d94ae;
 Mon, 03 Apr 2023 09:41:43 +0200 (CEST)
Received: by mail-wr1-x429.google.com with SMTP id d17so28232998wrb.11
 for <xen-devel@lists.xenproject.org>; Mon, 03 Apr 2023 00:41:43 -0700 (PDT)
Received: from Provence.localdomain
 (dynamic-078-055-162-106.78.55.pool.telefonica.de. [78.55.162.106])
 by smtp.gmail.com with ESMTPSA id
 s11-20020a5d424b000000b002e5f6f8fc4fsm8414960wrr.100.2023.04.03.00.41.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Apr 2023 00:41:42 -0700 (PDT)
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
X-Inumbo-ID: fa87ecf0-d1f2-11ed-b464-930f4c7d94ae
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680507703;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bFBFz6LEBXPSgQcOvP8yki+MQL0SlRe8vWuNcy1ofyc=;
        b=JnS3k4VnUoa2yBgFGDVDqacBd2DdaZDlI+9R3AWOFhe3KjznQtcT72nyHz3M0NNxPI
         BHk7+yVafEuJZsDmpI86KxWZdZSFBDFQejFdT++2yketIkY99aI1HrLv2dP9MnPjHQBs
         epvt+PyDpEF8mjOGr9ueoeGBlgS296BEv6sUEJ1Plv/gcSrfBpTUUOoN369ZxcDeBnJJ
         fC5SM5o/FYODXJeS0jB6XOoeGVOgSkOpHdlRV5MgT+SPRphnIdELNl11dGfm/A0PKLPN
         PjSXjmBBRUqR2fA/eTLELJx/ttMNy1M7gpFYGMCRRK1Cbtc4/GQjStDehV6+jgrR63Ry
         NCWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680507703;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bFBFz6LEBXPSgQcOvP8yki+MQL0SlRe8vWuNcy1ofyc=;
        b=UR1KvIKcPOl6dT4+2vN9pqbgNlDFTic4ZAxUwuA3FGCvBiPiBvmevhg1RfaVWlkJ+x
         8/DA8+1pGHG7AHdsTg5haT0GB9l0zaVkML0NksXGpwJECNWEM/56FuVNc3tAYZY+aJi6
         trc0TFIw3JNoOM4O0pQ2ME4JQJw+jgo226wR3LUlldYcP5fPPJaRtJYgMA0Lx+U+EeGd
         4nG8JiXLhXYomHd2wJ68GLlStQHroCgWmryKKi7LL7iTLe4kP+KvTEySaOW6rpRrO0YC
         ekIvMGz3nFFogtYeHP4IAdBbG/IRJXhrRVIdFiFAi3+ZBZT3v1TLypWiaTJ+ToadNm2m
         zP6A==
X-Gm-Message-State: AAQBX9caf9M+lsw9VWm9dKozHB/Zikroy5ktDGtOvN6muE2M3EXavdfp
	17S66CJH6ZIX6tn9BBc65fs=
X-Google-Smtp-Source: AKy350YQYzXtoXYV33vsug2IkHk8dVMjKWMW4Vgyul9fIIKt/0YfXdy2ovrIHW0LfhNXns7sxctNuA==
X-Received: by 2002:adf:fd51:0:b0:2ce:adda:f45a with SMTP id h17-20020adffd51000000b002ceaddaf45amr25195402wrs.62.1680507703148;
        Mon, 03 Apr 2023 00:41:43 -0700 (PDT)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	David Woodhouse <dwmw@amazon.co.uk>,
	Eduardo Habkost <eduardo@habkost.net>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Chuck Zmudzinski <brchuckz@aol.com>,
	Aurelien Jarno <aurelien@aurel32.net>,
	=?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
	Paul Durrant <paul@xen.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Anthony Perard <anthony.perard@citrix.com>,
	xen-devel@lists.xenproject.org,
	Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH v4 7/7] hw/isa/piix3: Resolve redundant TYPE_PIIX3_XEN_DEVICE
Date: Mon,  3 Apr 2023 09:41:24 +0200
Message-Id: <20230403074124.3925-8-shentey@gmail.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230403074124.3925-1-shentey@gmail.com>
References: <20230403074124.3925-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

During the last patches, TYPE_PIIX3_XEN_DEVICE turned into a clone of
TYPE_PIIX3_DEVICE. Remove this redundancy.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Reviewed-by: Anthony PERARD <anthony.perard@citrix.com>
Tested-by: Chuck Zmudzinski <brchuckz@aol.com>
Message-Id: <20230312120221.99183-7-shentey@gmail.com>
---
 include/hw/southbridge/piix.h |  1 -
 hw/i386/pc_piix.c             |  5 ++---
 hw/isa/piix3.c                | 15 ---------------
 3 files changed, 2 insertions(+), 19 deletions(-)

diff --git a/include/hw/southbridge/piix.h b/include/hw/southbridge/piix.h
index 0bf48e936d..51be04e984 100644
--- a/include/hw/southbridge/piix.h
+++ b/include/hw/southbridge/piix.h
@@ -64,7 +64,6 @@ DECLARE_INSTANCE_CHECKER(PIIX3State, PIIX3_PCI_DEVICE,
                          TYPE_PIIX3_PCI_DEVICE)
 
 #define TYPE_PIIX3_DEVICE "PIIX3"
-#define TYPE_PIIX3_XEN_DEVICE "PIIX3-xen"
 #define TYPE_PIIX4_PCI_DEVICE "piix4-isa"
 
 #endif
diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
index 1b70470dcd..7ca0d6d14e 100644
--- a/hw/i386/pc_piix.c
+++ b/hw/i386/pc_piix.c
@@ -237,8 +237,6 @@ static void pc_init1(MachineState *machine,
     if (pcmc->pci_enabled) {
         PIIX3State *piix3;
         PCIDevice *pci_dev;
-        const char *type = xen_enabled() ? TYPE_PIIX3_XEN_DEVICE
-                                         : TYPE_PIIX3_DEVICE;
 
         pci_bus = i440fx_init(pci_type,
                               i440fx_host,
@@ -251,7 +249,8 @@ static void pc_init1(MachineState *machine,
                                        : pc_pci_slot_get_pirq);
         pcms->bus = pci_bus;
 
-        pci_dev = pci_create_simple_multifunction(pci_bus, -1, true, type);
+        pci_dev = pci_create_simple_multifunction(pci_bus, -1, true,
+                                                  TYPE_PIIX3_DEVICE);
 
         if (xen_enabled()) {
             pci_device_set_intx_routing_notifier(
diff --git a/hw/isa/piix3.c b/hw/isa/piix3.c
index 418940139d..0d6992af67 100644
--- a/hw/isa/piix3.c
+++ b/hw/isa/piix3.c
@@ -29,7 +29,6 @@
 #include "hw/southbridge/piix.h"
 #include "hw/irq.h"
 #include "hw/isa/isa.h"
-#include "hw/xen/xen.h"
 #include "sysemu/runstate.h"
 #include "migration/vmstate.h"
 #include "hw/acpi/acpi_aml_interface.h"
@@ -366,24 +365,10 @@ static const TypeInfo piix3_info = {
     .class_init    = piix3_class_init,
 };
 
-static void piix3_xen_class_init(ObjectClass *klass, void *data)
-{
-    PCIDeviceClass *k = PCI_DEVICE_CLASS(klass);
-
-    k->realize = piix3_realize;
-}
-
-static const TypeInfo piix3_xen_info = {
-    .name          = TYPE_PIIX3_XEN_DEVICE,
-    .parent        = TYPE_PIIX3_PCI_DEVICE,
-    .class_init    = piix3_xen_class_init,
-};
-
 static void piix3_register_types(void)
 {
     type_register_static(&piix3_pci_type_info);
     type_register_static(&piix3_info);
-    type_register_static(&piix3_xen_info);
 }
 
 type_init(piix3_register_types)
-- 
2.40.0


