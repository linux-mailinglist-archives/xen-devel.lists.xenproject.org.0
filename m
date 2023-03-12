Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 56D866B65C2
	for <lists+xen-devel@lfdr.de>; Sun, 12 Mar 2023 13:02:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.508992.784132 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pbKPV-0005Od-5u; Sun, 12 Mar 2023 12:02:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 508992.784132; Sun, 12 Mar 2023 12:02:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pbKPU-0005I0-LP; Sun, 12 Mar 2023 12:02:44 +0000
Received: by outflank-mailman (input) for mailman id 508992;
 Sun, 12 Mar 2023 12:02:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=y+T3=7E=gmail.com=shentey@srs-se1.protection.inumbo.net>)
 id 1pbKPR-0002uS-Ha
 for xen-devel@lists.xenproject.org; Sun, 12 Mar 2023 12:02:41 +0000
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [2a00:1450:4864:20::52d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c9ef5d9d-c0cd-11ed-87f5-c1b5be75604c;
 Sun, 12 Mar 2023 13:02:41 +0100 (CET)
Received: by mail-ed1-x52d.google.com with SMTP id r15so10937806edq.11
 for <xen-devel@lists.xenproject.org>; Sun, 12 Mar 2023 05:02:41 -0700 (PDT)
Received: from Provence.localdomain
 (dynamic-078-054-022-093.78.54.pool.telefonica.de. [78.54.22.93])
 by smtp.gmail.com with ESMTPSA id
 xj9-20020a170906db0900b009231714b3d4sm1293745ejb.151.2023.03.12.05.02.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 Mar 2023 05:02:39 -0700 (PDT)
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
X-Inumbo-ID: c9ef5d9d-c0cd-11ed-87f5-c1b5be75604c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678622560;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rI8ZsjBtffxcL2MjNujcgsY63aeYdjHaEBqzmv9u0lo=;
        b=Bb3Kpzk2SxtKUqOKzwTifF1IA803ECM2pISHjBQ2M7dCXP/bjxvszlgJwciRFmpLlf
         wpbLHQ5FK99teDs8LawQjNEa6zlc5rgQg64kL5P0zKn+W+cxBBVTblF/mUJ5ZRb4Qu/j
         n9nPXQ/92Jh9tZN0O9DytfiFLFkJBo3sCHQDMNTgrfnYDShpasisGLrZClJe4jQSCSVG
         1tokue7jyNcDFAhZMyA2O1cOi1h+dJR04uK43hD4hd25u2k4EIbibib2sj0BmmJOFaDn
         F+DM1dCZNoBvTPn9bY4nzRMaVkHh/tdyHv+MJkjSb4Eq+AczXyOLmt/MUH77b1i5Gj79
         aFGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678622560;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rI8ZsjBtffxcL2MjNujcgsY63aeYdjHaEBqzmv9u0lo=;
        b=zJBvmkuvS4ryBBrL6OJoigqpap3AqKhjWMD9fBzEXDxy16dkqqHkOauUwzvBZ7E8nI
         1KHsBYLh6bGqZk1p6KuFjEo/KxQKov9KLlIAp86Gig6uk6XZtAjJkjnB25dSxTTC4kJJ
         spUpRWy1j9bTMsdIb29U2gSv1ouFlA3iA3WMOlWvCIVyVh/M6fmFIfPx77RBfwOsuX2b
         iyDLVUqvQzOivji7TDdZhuSec+Yv6I8Y3dE2jWvp3nVSiPEEV1oZB4A3WY4kpAcn2PUH
         xiczF83hwZRzp6DE5nBjxpflViWAOEk7tMzAIDC+Do299TokPQoTk8f1xTJQ/DBDuXlr
         QUsQ==
X-Gm-Message-State: AO0yUKUmRA11doDR6m8jHyUC/LPIaH0mLAhEdBbLRic+ysOcEK6eGjK2
	N3pATmyqCf3PnPFzGlRXSxU=
X-Google-Smtp-Source: AK7set/AVzddu1+FdWEl/xC+HlzhM5PISCHhkaw6fcOuZgxBkpinOZysAximKBKKHBg8Pp5SPwa/xA==
X-Received: by 2002:a17:906:5a6e:b0:926:e917:133c with SMTP id my46-20020a1709065a6e00b00926e917133cmr1303514ejc.47.1678622560375;
        Sun, 12 Mar 2023 05:02:40 -0700 (PDT)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	David Woodhouse <dwmw@amazon.co.uk>,
	Anthony Perard <anthony.perard@citrix.com>,
	=?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
	Aurelien Jarno <aurelien@aurel32.net>,
	Eduardo Habkost <eduardo@habkost.net>,
	Paul Durrant <paul@xen.org>,
	xen-devel@lists.xenproject.org,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Chuck Zmudzinski <brchuckz@aol.com>,
	Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH v3 6/6] hw/isa/piix3: Resolve redundant TYPE_PIIX3_XEN_DEVICE
Date: Sun, 12 Mar 2023 13:02:21 +0100
Message-Id: <20230312120221.99183-7-shentey@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230312120221.99183-1-shentey@gmail.com>
References: <20230312120221.99183-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

During the last patches, TYPE_PIIX3_XEN_DEVICE turned into a clone of
TYPE_PIIX3_DEVICE. Remove this redundancy.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
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
2.39.2


