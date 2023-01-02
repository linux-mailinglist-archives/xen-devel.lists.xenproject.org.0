Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 08C7765B761
	for <lists+xen-devel@lfdr.de>; Mon,  2 Jan 2023 22:36:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.470402.729931 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pCSTB-0004Pf-Lw; Mon, 02 Jan 2023 21:35:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 470402.729931; Mon, 02 Jan 2023 21:35:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pCSTB-0004JT-Gs; Mon, 02 Jan 2023 21:35:45 +0000
Received: by outflank-mailman (input) for mailman id 470402;
 Mon, 02 Jan 2023 21:35:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jV8v=47=gmail.com=shentey@srs-se1.protection.inumbo.net>)
 id 1pCST9-0003Wk-Lw
 for xen-devel@lists.xenproject.org; Mon, 02 Jan 2023 21:35:43 +0000
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [2a00:1450:4864:20::633])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6823eacd-8ae5-11ed-b8d0-410ff93cb8f0;
 Mon, 02 Jan 2023 22:35:41 +0100 (CET)
Received: by mail-ej1-x633.google.com with SMTP id qk9so69227516ejc.3
 for <xen-devel@lists.xenproject.org>; Mon, 02 Jan 2023 13:35:41 -0800 (PST)
Received: from osoxes.fritz.box
 (p200300faaf0bb2009c4947838afc41b6.dip0.t-ipconnect.de.
 [2003:fa:af0b:b200:9c49:4783:8afc:41b6])
 by smtp.gmail.com with ESMTPSA id
 f11-20020a17090631cb00b0084c465709b7sm10583826ejf.74.2023.01.02.13.35.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Jan 2023 13:35:41 -0800 (PST)
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
X-Inumbo-ID: 6823eacd-8ae5-11ed-b8d0-410ff93cb8f0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=D3N14otcWIL0n4lyXnEKPR8qnN0/LRmM4qVkpIj4xR0=;
        b=o/cROMVNdjgczrnzaHlIWJEYXmIcrhVEkY1chtTByVFgw8LTNs+VtgtFtEZgCY5yoO
         nzOSynWwIDOUxRcnk9SUCJGzI20lfjgufMnCsY3qKkrbVKMBuWhX5TfEhfasZkfISq3w
         UUBnbDggVxAN214v2MFTNHh1dDpNtR39S8/3tlxvw36a2E8mKGLvwXUdhgefdiWugr2Q
         /JRT9RMXrxyUOTVNhO906P9DpV3HnLmQXEbcusyKm+dfxznocAkcd176q8u6n1jPlKMw
         RuGYas0dxRTf9TF7zr00vUMGJtTGMRb1AQ7dyW7UTX3Cu2OxXUh1shUHoWE61xetRae1
         jQiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=D3N14otcWIL0n4lyXnEKPR8qnN0/LRmM4qVkpIj4xR0=;
        b=12C9he5Yw+mNQUKLlQ/Sg/I21kIO8cWuyM6u5dL1lhOkjmbqffQxY02quCSoG3H/GQ
         54gNXO8ioU6yB+8pjn99HwGkIONlAyruzA+rvfhs0ziS/xrCU1NQjAW05rDEIpZKEHY6
         RIOk2SluH9doZwZ+Vd3blxbv43JnICfdTRYc/QwEBUf5hDPRSgCeXLZW3h9jIX7uhHHE
         wRf89QriXv7FxNv5TBeCjeJMx+M/7asvAVU8SFAhDqeAeS8Ggc2/Lnom372dAc/eGSb2
         kGTWYvqdFAksjIzQo6l30PetMySpNaaxDs5I6tP5eV+by7S0zWQ2agE+dqe/10m6tcDt
         cI/Q==
X-Gm-Message-State: AFqh2kp9eWLGHFRUQKRmRjz6K5KnsF9p8ULVJQp4eu30OAZdSPbUSjiQ
	asnFgr02jffAxX8DrtNWRS4=
X-Google-Smtp-Source: AMrXdXsbnk+1fmyTa+aN0jvfrb8pZSWUpibMyiM6zr4b2AEMWkyILO87oUs0wXcIHRi65FlXo993VQ==
X-Received: by 2002:a17:906:2349:b0:837:3ddb:7e97 with SMTP id m9-20020a170906234900b008373ddb7e97mr43321304eja.61.1672695341405;
        Mon, 02 Jan 2023 13:35:41 -0800 (PST)
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
Subject: [PATCH 3/6] hw/isa/piix: Wire up Xen PCI IRQ handling outside of PIIX3
Date: Mon,  2 Jan 2023 22:35:01 +0100
Message-Id: <20230102213504.14646-4-shentey@gmail.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230102213504.14646-1-shentey@gmail.com>
References: <20230102213504.14646-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

xen_intx_set_irq() doesn't depend on PIIX state. In order to resolve
TYPE_PIIX3_XEN_DEVICE and in order to make Xen agnostic about the
precise south bridge being used, set up Xen's PCI IRQ handling of PIIX3
in the board.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
---
 hw/i386/pc_piix.c | 12 ++++++++++++
 hw/isa/piix.c     | 24 +-----------------------
 2 files changed, 13 insertions(+), 23 deletions(-)

diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
index aacdb72b7c..c02f68010d 100644
--- a/hw/i386/pc_piix.c
+++ b/hw/i386/pc_piix.c
@@ -67,6 +67,7 @@
 #include "kvm/kvm-cpu.h"
 
 #define MAX_IDE_BUS 2
+#define XEN_PIIX_NUM_PIRQS 128ULL
 
 #ifdef CONFIG_IDE_ISA
 static const int ide_iobase[MAX_IDE_BUS] = { 0x1f0, 0x170 };
@@ -246,6 +247,17 @@ static void pc_init1(MachineState *machine,
                                  &error_abort);
         pci_realize_and_unref(pci_dev, pci_bus, &error_fatal);
 
+        if (xen_enabled()) {
+            /*
+             * Xen supports additional interrupt routes from the PCI devices to
+             * the IOAPIC: the four pins of each PCI device on the bus are also
+             * connected to the IOAPIC directly.
+             * These additional routes can be discovered through ACPI.
+             */
+            pci_bus_irqs(pci_bus, xen_intx_set_irq, pci_dev,
+                         XEN_PIIX_NUM_PIRQS);
+        }
+
         dev = DEVICE(object_resolve_path_component(OBJECT(pci_dev), "pic"));
         for (i = 0; i < ISA_NUM_IRQS; i++) {
             qdev_connect_gpio_out(dev, i, x86ms->gsi[i]);
diff --git a/hw/isa/piix.c b/hw/isa/piix.c
index a1281c2d77..ac04781f46 100644
--- a/hw/isa/piix.c
+++ b/hw/isa/piix.c
@@ -38,8 +38,6 @@
 #include "migration/vmstate.h"
 #include "hw/acpi/acpi_aml_interface.h"
 
-#define XEN_PIIX_NUM_PIRQS      128ULL
-
 static void piix_set_irq_pic(PIIXState *piix, int pic_irq)
 {
     qemu_set_irq(piix->pic.in_irqs[pic_irq],
@@ -487,33 +485,13 @@ static const TypeInfo piix3_info = {
     .class_init    = piix3_class_init,
 };
 
-static void piix3_xen_realize(PCIDevice *dev, Error **errp)
-{
-    ERRP_GUARD();
-    PIIXState *piix3 = PIIX_PCI_DEVICE(dev);
-    PCIBus *pci_bus = pci_get_bus(dev);
-
-    piix3_realize(dev, errp);
-    if (*errp) {
-        return;
-    }
-
-    /*
-     * Xen supports additional interrupt routes from the PCI devices to
-     * the IOAPIC: the four pins of each PCI device on the bus are also
-     * connected to the IOAPIC directly.
-     * These additional routes can be discovered through ACPI.
-     */
-    pci_bus_irqs(pci_bus, xen_intx_set_irq, piix3, XEN_PIIX_NUM_PIRQS);
-}
-
 static void piix3_xen_class_init(ObjectClass *klass, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(klass);
     PCIDeviceClass *k = PCI_DEVICE_CLASS(klass);
 
     k->config_write = piix3_write_config_xen;
-    k->realize = piix3_xen_realize;
+    k->realize = piix3_realize;
     /* 82371SB PIIX3 PCI-to-ISA bridge (Step A1) */
     k->device_id = PCI_DEVICE_ID_INTEL_82371SB_0;
     dc->vmsd = &vmstate_piix3;
-- 
2.39.0


