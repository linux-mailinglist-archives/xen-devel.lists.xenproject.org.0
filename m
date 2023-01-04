Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2729465D66A
	for <lists+xen-devel@lfdr.de>; Wed,  4 Jan 2023 15:45:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.471205.730975 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pD51F-0007bh-1r; Wed, 04 Jan 2023 14:45:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 471205.730975; Wed, 04 Jan 2023 14:45:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pD51E-0007Ur-Qs; Wed, 04 Jan 2023 14:45:28 +0000
Received: by outflank-mailman (input) for mailman id 471205;
 Wed, 04 Jan 2023 14:45:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=bCSi=5B=gmail.com=shentey@srs-se1.protection.inumbo.net>)
 id 1pD51D-00079V-SS
 for xen-devel@lists.xenproject.org; Wed, 04 Jan 2023 14:45:27 +0000
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [2a00:1450:4864:20::433])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6cc26dac-8c3e-11ed-b8d0-410ff93cb8f0;
 Wed, 04 Jan 2023 15:45:26 +0100 (CET)
Received: by mail-wr1-x433.google.com with SMTP id bk16so19994157wrb.11
 for <xen-devel@lists.xenproject.org>; Wed, 04 Jan 2023 06:45:26 -0800 (PST)
Received: from osoxes.fritz.box
 (p200300faaf0bb2009c4947838afc41b6.dip0.t-ipconnect.de.
 [2003:fa:af0b:b200:9c49:4783:8afc:41b6])
 by smtp.gmail.com with ESMTPSA id
 e10-20020a5d594a000000b0028663fc8f4csm21168241wri.30.2023.01.04.06.45.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Jan 2023 06:45:25 -0800 (PST)
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
X-Inumbo-ID: 6cc26dac-8c3e-11ed-b8d0-410ff93cb8f0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jWsSUpGWnwKoxzlBa2RTErBbFhPwkbaywyVJwsOJ9Nk=;
        b=YlPrLritShhHTaeSGbLlb++n9XqS9VBhEgsy2PwwgydtFFm8UrBGDJ7iUMy8EaMHeH
         9SBO1n2DyEa7U5jCTGTOQDdlOVkvnVOt1hp8JY3uNc4BSSwglDnmGx2Ero35GpcLb5UZ
         lxDNlGzSW/OY/+wh4qjm3mF5gciV5251nu62u5qkggcU3PaBu3OtH7lvV3LzAIHUHPpY
         i/fR6+7MuwJBxH89wLn/4BkSrlZxnPIIZCNrMfecj4xhrjBhXyY2bE6HPVdgtcf6jPaJ
         iN/TGG+HuHA766ERLaC5giouVQ+KfyHIHRbdPCXS9JqqjfVfCA6wQA2G70I6E8iUvn/6
         2/8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jWsSUpGWnwKoxzlBa2RTErBbFhPwkbaywyVJwsOJ9Nk=;
        b=7qubFAMSt0fgnIvn0DjngdK/c1YJK3nunCjBytT/lxypyWA2pIpWEv4Fgw7FaHgtL3
         hGFuPLIJHGeES8zA0VYyUsGEE5JU/hOUxuKeLh25Zt/96MHVEbmXj/8Tcsi4M/nrDMkH
         fg2X8bU2ro69SvUUUNv/gVvWniIBppFycOwAIjyI7gom+L+dKLb8GQSC+iB7a0ThkXlA
         HikQfR8zytqpXEXh4lc97n54B0YkbMuF+1L+1TcYwoZNli8jYyenYayZJn9GamHU+YN0
         ZqRoaMbhYwsJyGeD3Uwo6EFVnjVpWuZ5cTJqJFi5VeobGLTTB093jOroWCuKHnEzY6B8
         xa5Q==
X-Gm-Message-State: AFqh2ko0JyJW1tJrzpeJBaM5z/YbJf9LNMrxatT+TxPR58ULo2CD7c13
	uiTha4ScvyKUiHT0dgnVq1w=
X-Google-Smtp-Source: AMrXdXtdVz6/t/nUcG3XroMW/zOMXTIelUM5J1RHwOTKB+xhi7kJEMzBdrFkmDsmcHHUWZlTsIodDw==
X-Received: by 2002:adf:f4c5:0:b0:291:3f93:b7d1 with SMTP id h5-20020adff4c5000000b002913f93b7d1mr11327512wrp.64.1672843525599;
        Wed, 04 Jan 2023 06:45:25 -0800 (PST)
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
Subject: [PATCH v2 3/6] hw/isa/piix: Wire up Xen PCI IRQ handling outside of PIIX3
Date: Wed,  4 Jan 2023 15:44:34 +0100
Message-Id: <20230104144437.27479-4-shentey@gmail.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230104144437.27479-1-shentey@gmail.com>
References: <20230104144437.27479-1-shentey@gmail.com>
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
index aacdb72b7c..792dcd3ce8 100644
--- a/hw/i386/pc_piix.c
+++ b/hw/i386/pc_piix.c
@@ -67,6 +67,7 @@
 #include "kvm/kvm-cpu.h"
 
 #define MAX_IDE_BUS 2
+#define XEN_IOAPIC_NUM_PIRQS 128ULL
 
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
+                         XEN_IOAPIC_NUM_PIRQS);
+        }
+
         dev = DEVICE(object_resolve_path_component(OBJECT(pci_dev), "pic"));
         for (i = 0; i < ISA_NUM_IRQS; i++) {
             qdev_connect_gpio_out(dev, i, x86ms->gsi[i]);
diff --git a/hw/isa/piix.c b/hw/isa/piix.c
index 25707479eb..ac04781f46 100644
--- a/hw/isa/piix.c
+++ b/hw/isa/piix.c
@@ -38,8 +38,6 @@
 #include "migration/vmstate.h"
 #include "hw/acpi/acpi_aml_interface.h"
 
-#define XEN_IOAPIC_NUM_PIRQS    128ULL
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
-    pci_bus_irqs(pci_bus, xen_intx_set_irq, piix3, XEN_IOAPIC_NUM_PIRQS);
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


