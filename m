Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D78746D3E38
	for <lists+xen-devel@lfdr.de>; Mon,  3 Apr 2023 09:42:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.517312.802486 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pjEox-0001UB-Ft; Mon, 03 Apr 2023 07:41:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 517312.802486; Mon, 03 Apr 2023 07:41:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pjEox-0001Qp-6a; Mon, 03 Apr 2023 07:41:43 +0000
Received: by outflank-mailman (input) for mailman id 517312;
 Mon, 03 Apr 2023 07:41:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=qzQh=72=gmail.com=shentey@srs-se1.protection.inumbo.net>)
 id 1pjEov-0000Sg-Cv
 for xen-devel@lists.xenproject.org; Mon, 03 Apr 2023 07:41:41 +0000
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [2a00:1450:4864:20::42c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f8582e01-d1f2-11ed-b464-930f4c7d94ae;
 Mon, 03 Apr 2023 09:41:39 +0200 (CEST)
Received: by mail-wr1-x42c.google.com with SMTP id m2so28256907wrh.6
 for <xen-devel@lists.xenproject.org>; Mon, 03 Apr 2023 00:41:39 -0700 (PDT)
Received: from Provence.localdomain
 (dynamic-078-055-162-106.78.55.pool.telefonica.de. [78.55.162.106])
 by smtp.gmail.com with ESMTPSA id
 s11-20020a5d424b000000b002e5f6f8fc4fsm8414960wrr.100.2023.04.03.00.41.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Apr 2023 00:41:38 -0700 (PDT)
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
X-Inumbo-ID: f8582e01-d1f2-11ed-b464-930f4c7d94ae
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680507699;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MUDyOxROyX57/HeZfnPOMpR49OmyPgdDYS4l8CKR3oE=;
        b=R0zQZHS1SVM2nbqIZon4bg3J/Tgs443HdjKKqxyVKw/W6M8PKg6fF5HqP9chCuyiBZ
         HJkytr0cpW/VhAlTB3rKHnd519d/mvwUbFIWVLXIvNSr48AXF6vTFq6fJUcOUmUH1iyB
         ueVnC/xQZaZZHpFPSVhx5W9HBRQbsjok895nYAKptZCyOKoD4Ib82ypomuw9roljaWLe
         IbWXzVNtIq89BY8uwqhgoY21w0gcpO0L4vbRyFCz5FSL/pxc3tWZ8/gLXOuRE9RPqc0/
         6HjlOpoi2+VFwd5ZeD8MBrf7WTl2dA38nm35BVoLZzH5VWDCu+75pIfnCT84gtQ11hI1
         Ozwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680507699;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MUDyOxROyX57/HeZfnPOMpR49OmyPgdDYS4l8CKR3oE=;
        b=pyFym8FJryc37DMfPoMm0BNvathFLweFfvcs7lUdvXHbcLej+Up5li25tFq49LECuA
         uUGCy7pWwV6hcVyf3XUrrQ/6l7G0CUMbM1d1XTvSCU52V1JFUSLC7jKbnBOVJtEM0dRY
         +cBnrSrtMMEahxFK13XwSwgsqgQmqSsyebogy1u89YeLn2HphjQz4Fy226sctWfmtMY8
         oxUMUUcVZPcwgJLBz0VzCMXpXpDmvokx22Vd1lyQZMNLevA8E5cs0takLFX7jomlwP8s
         tsXZJt1MwPoIdrL1556IPL6kPd5wO8U+LDxscuRBjR+0ud9bbi+3w6pPPEPr0TVI12P8
         Qb7g==
X-Gm-Message-State: AAQBX9fzzLab9MPnFqvnemnaAMGARgIZLqHd5wciCDkYm3V2mHvvDaiC
	stjTS8S4H8yRwtsreAnqTRo=
X-Google-Smtp-Source: AKy350Z1aIPseQR+1yV2swwLLDz0AEwlN4YYIJAKAq+O5S9egcGZLOBJfv2d/bu2tqMGfhvjE7XU2g==
X-Received: by 2002:adf:ed0e:0:b0:2d1:86e6:bd6 with SMTP id a14-20020adfed0e000000b002d186e60bd6mr26015599wro.22.1680507699461;
        Mon, 03 Apr 2023 00:41:39 -0700 (PDT)
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
Subject: [PATCH v4 4/7] hw/isa/piix3: Wire up Xen PCI IRQ handling outside of PIIX3
Date: Mon,  3 Apr 2023 09:41:21 +0200
Message-Id: <20230403074124.3925-5-shentey@gmail.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230403074124.3925-1-shentey@gmail.com>
References: <20230403074124.3925-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

xen_intx_set_irq() doesn't depend on PIIX3State. In order to resolve
TYPE_PIIX3_XEN_DEVICE and in order to make Xen agnostic about the
precise south bridge being used, set up Xen's PCI IRQ handling of PIIX3
in the board.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Reviewed-by: Anthony PERARD <anthony.perard@citrix.com>
Tested-by: Chuck Zmudzinski <brchuckz@aol.com>
Message-Id: <20230312120221.99183-4-shentey@gmail.com>
---
 hw/i386/pc_piix.c | 13 +++++++++++++
 hw/isa/piix3.c    | 24 +-----------------------
 2 files changed, 14 insertions(+), 23 deletions(-)

diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
index 30eedd62a3..99232701b1 100644
--- a/hw/i386/pc_piix.c
+++ b/hw/i386/pc_piix.c
@@ -69,6 +69,7 @@
 #include "kvm/kvm-cpu.h"
 
 #define MAX_IDE_BUS 2
+#define XEN_IOAPIC_NUM_PIRQS 128ULL
 
 #ifdef CONFIG_IDE_ISA
 static const int ide_iobase[MAX_IDE_BUS] = { 0x1f0, 0x170 };
@@ -236,6 +237,18 @@ static void pc_init1(MachineState *machine,
         pcms->bus = pci_bus;
 
         pci_dev = pci_create_simple_multifunction(pci_bus, -1, true, type);
+
+        if (xen_enabled()) {
+            /*
+             * Xen supports additional interrupt routes from the PCI devices to
+             * the IOAPIC: the four pins of each PCI device on the bus are also
+             * connected to the IOAPIC directly.
+             * These additional routes can be discovered through ACPI.
+             */
+            pci_bus_irqs(pci_bus, xen_intx_set_irq, pci_dev,
+                         XEN_IOAPIC_NUM_PIRQS);
+        }
+
         piix3 = PIIX3_PCI_DEVICE(pci_dev);
         piix3->pic = x86ms->gsi;
         piix3_devfn = piix3->dev.devfn;
diff --git a/hw/isa/piix3.c b/hw/isa/piix3.c
index a86cd23ef4..7a31caf2b6 100644
--- a/hw/isa/piix3.c
+++ b/hw/isa/piix3.c
@@ -34,8 +34,6 @@
 #include "migration/vmstate.h"
 #include "hw/acpi/acpi_aml_interface.h"
 
-#define XEN_IOAPIC_NUM_PIRQS    128ULL
-
 static void piix3_set_irq_pic(PIIX3State *piix3, int pic_irq)
 {
     qemu_set_irq(piix3->pic[pic_irq],
@@ -388,32 +386,12 @@ static const TypeInfo piix3_info = {
     .class_init    = piix3_class_init,
 };
 
-static void piix3_xen_realize(PCIDevice *dev, Error **errp)
-{
-    ERRP_GUARD();
-    PIIX3State *piix3 = PIIX3_PCI_DEVICE(dev);
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
-    pci_bus_irqs(pci_bus, xen_intx_set_irq, piix3, XEN_IOAPIC_NUM_PIRQS);
-}
-
 static void piix3_xen_class_init(ObjectClass *klass, void *data)
 {
     PCIDeviceClass *k = PCI_DEVICE_CLASS(klass);
 
     k->config_write = piix3_write_config_xen;
-    k->realize = piix3_xen_realize;
+    k->realize = piix3_realize;
 }
 
 static const TypeInfo piix3_xen_info = {
-- 
2.40.0


