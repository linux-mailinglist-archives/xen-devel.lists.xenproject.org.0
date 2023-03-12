Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FD3F6B65BC
	for <lists+xen-devel@lfdr.de>; Sun, 12 Mar 2023 13:02:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.508988.784101 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pbKPR-0004b6-7U; Sun, 12 Mar 2023 12:02:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 508988.784101; Sun, 12 Mar 2023 12:02:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pbKPR-0004Xw-2I; Sun, 12 Mar 2023 12:02:41 +0000
Received: by outflank-mailman (input) for mailman id 508988;
 Sun, 12 Mar 2023 12:02:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=y+T3=7E=gmail.com=shentey@srs-se1.protection.inumbo.net>)
 id 1pbKPO-0003B1-Kz
 for xen-devel@lists.xenproject.org; Sun, 12 Mar 2023 12:02:38 +0000
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [2a00:1450:4864:20::536])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c7a5edbb-c0cd-11ed-956e-85ef70e17bfa;
 Sun, 12 Mar 2023 13:02:37 +0100 (CET)
Received: by mail-ed1-x536.google.com with SMTP id cy23so38018895edb.12
 for <xen-devel@lists.xenproject.org>; Sun, 12 Mar 2023 05:02:37 -0700 (PDT)
Received: from Provence.localdomain
 (dynamic-078-054-022-093.78.54.pool.telefonica.de. [78.54.22.93])
 by smtp.gmail.com with ESMTPSA id
 xj9-20020a170906db0900b009231714b3d4sm1293745ejb.151.2023.03.12.05.02.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 Mar 2023 05:02:36 -0700 (PDT)
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
X-Inumbo-ID: c7a5edbb-c0cd-11ed-956e-85ef70e17bfa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678622556;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XntQLcfKBZ4bUALJ2KcKbFlzPaRdUkUn5f75iO8ImkQ=;
        b=IA1JYJLJIDXDZUXlU+gf06wttIV49eC8CDEPbQoPMi6TiveH2bC5JG+Q6UJenXeBlH
         OuqyVa2LJ8fbgwsD618aaUbMFhMSMFgpv6Yk3wUdJ3Iuz+vHUAPFqvXiz6XO3inbN+e3
         PdiHw6HTaXQDTKmin5QqC1M1AX4HbZjPhrO2xmpgVPMNrsZNKuLaD8594qaIknpFQc/0
         0r9ocRPyNvM+Cj15SU5hmeBYKtZ5MR/vsaLSsR3edIKqT2DjowYwrk0jq/5Ae26kjVPk
         0V1izQDgiS7e3CT/UILMHQt9YLh+blcAvCXAcQb+d3iI4mZ1DJ1K9EfHARqbPOml5JjV
         rvRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678622556;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XntQLcfKBZ4bUALJ2KcKbFlzPaRdUkUn5f75iO8ImkQ=;
        b=ZxjfPc+xXHG0AW5ice1+JtyxPpb2haXU2iIev9Bzth6TuyQfo7Fcqtk1I5f35AE1GG
         QTkn2BMK216ZE9RwtVAvo8N4vQo9g3SrjOb+AB4gpvABm/QDYdPvHvBudkTi07+wsFkZ
         SCwYYUaOxCa6EsY5DfmDH/fnD9mEtznYoBTE7qZ1F6Ryg9NmzAE/rrkq2iFWj5QzdrPs
         uvgwVAh7xQhS/KVx4OcCs1ZkhrDKx/fSL2s1BG2WS5HBUxlV7sff4qKvwN0vS0HRVNoG
         R86cU+rzNyQ10OUhWbqfh9p4adusomb08GOfFyE4viC/jAn5vY4bxOEOyiAkEAL3n1UR
         tI0A==
X-Gm-Message-State: AO0yUKX3znzq1cA95bXUdpXXa2g+6an0Ih2ZdxWBPvlgxxDI/FGDFXU4
	XE6i6e33Dulf+DL6guUBtMk=
X-Google-Smtp-Source: AK7set+m7cWOv1RHybMAfOCzPRvQaV62dLX58iGhA9SZT8R7OwbyLmc241NiKS/XtNsdB4vzT9A0oA==
X-Received: by 2002:a05:6402:1256:b0:4fb:1fa8:da25 with SMTP id l22-20020a056402125600b004fb1fa8da25mr2725543edw.36.1678622556599;
        Sun, 12 Mar 2023 05:02:36 -0700 (PDT)
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
Subject: [PATCH v3 3/6] hw/isa/piix3: Wire up Xen PCI IRQ handling outside of PIIX3
Date: Sun, 12 Mar 2023 13:02:18 +0100
Message-Id: <20230312120221.99183-4-shentey@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230312120221.99183-1-shentey@gmail.com>
References: <20230312120221.99183-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

xen_intx_set_irq() doesn't depend on PIIX3State. In order to resolve
TYPE_PIIX3_XEN_DEVICE and in order to make Xen agnostic about the
precise south bridge being used, set up Xen's PCI IRQ handling of PIIX3
in the board.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
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
2.39.2


