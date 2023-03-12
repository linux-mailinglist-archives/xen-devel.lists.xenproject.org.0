Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 35BD26B65BD
	for <lists+xen-devel@lfdr.de>; Sun, 12 Mar 2023 13:02:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.508989.784112 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pbKPS-0004ug-NU; Sun, 12 Mar 2023 12:02:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 508989.784112; Sun, 12 Mar 2023 12:02:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pbKPS-0004oH-Gd; Sun, 12 Mar 2023 12:02:42 +0000
Received: by outflank-mailman (input) for mailman id 508989;
 Sun, 12 Mar 2023 12:02:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=y+T3=7E=gmail.com=shentey@srs-se1.protection.inumbo.net>)
 id 1pbKPQ-0003B1-22
 for xen-devel@lists.xenproject.org; Sun, 12 Mar 2023 12:02:40 +0000
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [2a00:1450:4864:20::52a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c88ca41b-c0cd-11ed-956e-85ef70e17bfa;
 Sun, 12 Mar 2023 13:02:38 +0100 (CET)
Received: by mail-ed1-x52a.google.com with SMTP id y4so8668860edo.2
 for <xen-devel@lists.xenproject.org>; Sun, 12 Mar 2023 05:02:38 -0700 (PDT)
Received: from Provence.localdomain
 (dynamic-078-054-022-093.78.54.pool.telefonica.de. [78.54.22.93])
 by smtp.gmail.com with ESMTPSA id
 xj9-20020a170906db0900b009231714b3d4sm1293745ejb.151.2023.03.12.05.02.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 Mar 2023 05:02:37 -0700 (PDT)
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
X-Inumbo-ID: c88ca41b-c0cd-11ed-956e-85ef70e17bfa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678622558;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RBFe6isXemizys2ZScF1519YX/IBVf8Fe2lCN47Nhmw=;
        b=jEeVgDffRRyW968Swa7lqu7lroeT8xJYKJInXZP3t6A13twsb+EHBk2J/YoNSVQnPV
         gg0XRFr/CfWbHpZTNgw5YtoTRdtgeS4SAk4DskE8FHZbIJ+zzPwtuxyD7IyZBEjNPL36
         g1kKmeSdT//9n4PhSFkymflDWigo/cvVUB5TnAmGZJoyP5QN5fre57djW8JEyZjhQR14
         35nDcsxUL7/nYfKcgjpLPNatKtUyrz5hN3uPdVXbwuRSx6iZamt9RH0CTFTYzxZusmn2
         IJf1k1Z91KCDjwtqecPITM6uD2u6UXMlE4hk1+lnizOEOuR9KnzyOwy/gfliqCG8oQBn
         BreA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678622558;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RBFe6isXemizys2ZScF1519YX/IBVf8Fe2lCN47Nhmw=;
        b=6a54FXXYF01A7N3KqoBRF7L56+qdWiBkX0GIOiKrOSx7QAgMkn+SrPW1z/Sr5wnLd4
         lNCdoPepWltTz4zUXcp40kcEf/XT/IN5CMKDbiaGVkgf2ikzQoq/UZsgijbMd/WnckZR
         o8IyPTRAALlHb0YZ3bP1cWz4Y52TXNjYZOrFBIxw7tFzuzPvjij0WkGKCRt22U8xXuSI
         hGOwONwUOVh2qPF6Cq5lM2ZR4ljhqeXCl0mOKj8RvXfMebL09VXws7NGkDxAdl+Gk31N
         rQ6lrlUyTf08f1KHgC8N31YDf03/5vp5nwLmVX7sbx7UajH9FPJnlGFfDJr9BjpHoA3H
         MrFA==
X-Gm-Message-State: AO0yUKWsw7ZoWOQT6EGuV/1+buWEPCzq6DASIAFPwBj3NHvV4sDiyx/L
	YXggM2kyPdHv8u9TqIFXvHs=
X-Google-Smtp-Source: AK7set8Wx7bgBz0LKNNdj30Zp9yG/FUuWGPNpNmPLTPHiXWpvjIuclL65Zb7jvEMxOZ/8BLXTnb6uA==
X-Received: by 2002:aa7:c1c4:0:b0:4af:62af:460a with SMTP id d4-20020aa7c1c4000000b004af62af460amr32491333edp.8.1678622557959;
        Sun, 12 Mar 2023 05:02:37 -0700 (PDT)
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
Subject: [PATCH v3 4/6] hw/isa/piix3: Avoid Xen-specific variant of piix3_write_config()
Date: Sun, 12 Mar 2023 13:02:19 +0100
Message-Id: <20230312120221.99183-5-shentey@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230312120221.99183-1-shentey@gmail.com>
References: <20230312120221.99183-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Subscribe to pci_bus_fire_intx_routing_notifier() instead which allows for
having a common piix3_write_config() for the PIIX3 device models.

While at it, move the subscription into machine code to facilitate resolving
TYPE_PIIX3_XEN_DEVICE.

In a possible future followup, pci_bus_fire_intx_routing_notifier() could
be adjusted in such a way that subscribing to it doesn't require
knowledge of the device firing it.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/i386/pc_piix.c | 18 ++++++++++++++++++
 hw/isa/piix3.c    | 22 +---------------------
 2 files changed, 19 insertions(+), 21 deletions(-)

diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
index 99232701b1..1b70470dcd 100644
--- a/hw/i386/pc_piix.c
+++ b/hw/i386/pc_piix.c
@@ -88,6 +88,21 @@ static int pc_pci_slot_get_pirq(PCIDevice *pci_dev, int pci_intx)
     return (pci_intx + slot_addend) & 3;
 }
 
+static void piix_intx_routing_notifier_xen(PCIDevice *dev)
+{
+    int i;
+
+    /* Scan for updates to PCI link routes (0x60-0x63). */
+    for (i = 0; i < PIIX_NUM_PIRQS; i++) {
+        uint8_t v = dev->config_read(dev, PIIX_PIRQCA + i, 1);
+        if (v & 0x80) {
+            v = 0;
+        }
+        v &= 0xf;
+        xen_set_pci_link_route(i, v);
+    }
+}
+
 /* PC hardware initialisation */
 static void pc_init1(MachineState *machine,
                      const char *host_type, const char *pci_type)
@@ -239,6 +254,9 @@ static void pc_init1(MachineState *machine,
         pci_dev = pci_create_simple_multifunction(pci_bus, -1, true, type);
 
         if (xen_enabled()) {
+            pci_device_set_intx_routing_notifier(
+                        pci_dev, piix_intx_routing_notifier_xen);
+
             /*
              * Xen supports additional interrupt routes from the PCI devices to
              * the IOAPIC: the four pins of each PCI device on the bus are also
diff --git a/hw/isa/piix3.c b/hw/isa/piix3.c
index 7a31caf2b6..737f5c6a5d 100644
--- a/hw/isa/piix3.c
+++ b/hw/isa/piix3.c
@@ -121,26 +121,6 @@ static void piix3_write_config(PCIDevice *dev,
     }
 }
 
-static void piix3_write_config_xen(PCIDevice *dev,
-                                   uint32_t address, uint32_t val, int len)
-{
-    int i;
-
-    /* Scan for updates to PCI link routes (0x60-0x63). */
-    for (i = 0; i < len; i++) {
-        uint8_t v = (val >> (8 * i)) & 0xff;
-        if (v & 0x80) {
-            v = 0;
-        }
-        v &= 0xf;
-        if (((address + i) >= PIIX_PIRQCA) && ((address + i) <= PIIX_PIRQCD)) {
-            xen_set_pci_link_route(address + i - PIIX_PIRQCA, v);
-        }
-    }
-
-    piix3_write_config(dev, address, val, len);
-}
-
 static void piix3_reset(DeviceState *dev)
 {
     PIIX3State *d = PIIX3_PCI_DEVICE(dev);
@@ -390,7 +370,7 @@ static void piix3_xen_class_init(ObjectClass *klass, void *data)
 {
     PCIDeviceClass *k = PCI_DEVICE_CLASS(klass);
 
-    k->config_write = piix3_write_config_xen;
+    k->config_write = piix3_write_config;
     k->realize = piix3_realize;
 }
 
-- 
2.39.2


