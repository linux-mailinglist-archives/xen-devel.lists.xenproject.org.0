Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E78BA6D3E3C
	for <lists+xen-devel@lfdr.de>; Mon,  3 Apr 2023 09:42:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.517313.802493 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pjEoy-0001d4-5i; Mon, 03 Apr 2023 07:41:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 517313.802493; Mon, 03 Apr 2023 07:41:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pjEox-0001Uw-UD; Mon, 03 Apr 2023 07:41:43 +0000
Received: by outflank-mailman (input) for mailman id 517313;
 Mon, 03 Apr 2023 07:41:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=qzQh=72=gmail.com=shentey@srs-se1.protection.inumbo.net>)
 id 1pjEow-0000Sg-LN
 for xen-devel@lists.xenproject.org; Mon, 03 Apr 2023 07:41:42 +0000
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [2a00:1450:4864:20::434])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f900dbb0-d1f2-11ed-b464-930f4c7d94ae;
 Mon, 03 Apr 2023 09:41:41 +0200 (CEST)
Received: by mail-wr1-x434.google.com with SMTP id q19so25188101wrc.5
 for <xen-devel@lists.xenproject.org>; Mon, 03 Apr 2023 00:41:41 -0700 (PDT)
Received: from Provence.localdomain
 (dynamic-078-055-162-106.78.55.pool.telefonica.de. [78.55.162.106])
 by smtp.gmail.com with ESMTPSA id
 s11-20020a5d424b000000b002e5f6f8fc4fsm8414960wrr.100.2023.04.03.00.41.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Apr 2023 00:41:40 -0700 (PDT)
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
X-Inumbo-ID: f900dbb0-d1f2-11ed-b464-930f4c7d94ae
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680507700;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/EuJujhhzp9QT+Va/F4M2q8YBrUEweb2g4rehnqe99A=;
        b=hcViKZ3qPuwgtA4SsDAiRVSOd64zBPnpHxw+0VBLBeB50VFc/rKXi7fhu7V71wdQ1h
         FxpfO/RXYDuxhNYh2ttxusHsPNk+t2vE9+H9K9bhKMFQmuSkwffp5fkmeD16xMkbxQQ3
         LXpNEKoDVtB45+OBM29Ey1FV8APapXHq6pMgasM66BMhL7Waih4O+UCiJoBRyIbd16zz
         253w1Lis8Qh0rRlo2FH1+2zh1X8aqANyAQo//WYFAC4MkQPKgVheB4UURa3XhtGzyOrn
         Ar8I+OmZhfK340m5fuvAT+mWzcInzHAYzg7cJgstXkUtstVizW6nuDwjuLuv0636VIOC
         vMaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680507700;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/EuJujhhzp9QT+Va/F4M2q8YBrUEweb2g4rehnqe99A=;
        b=6plzb2sA43gsEP/CVhZbUjoeZvud1nFOfz1DbYNc95xZQOw+BubRGk+v5Ou4sDwStb
         FAqIhkMt3BxAtbcybU4854I6+kHTDmBGWL0HcQtopakmt4f1b0n8DA5VF/MjOTzvTL8k
         YM5pX35klguz1oKeujsBaxwE9UkoOBOiNVLgwFlOQSdrc6qt7dppZq5tuSyMvXW48Vyd
         QsajlBU66Quqi2/ZvHLSVyq0j5kSnnz6oIcb0vsbkvpUsa3+mma0kPJ+pFvVyzBCtUE7
         9w2pUwFjrpY6QxoUtUgsaBxrL0LuRUY0/aIyHj2fEdmusQVieCqLxC7e0XIjpCcvDpCw
         P/UQ==
X-Gm-Message-State: AAQBX9fLrG0UrKej9kIIo9Yd4CJFt3RFLJVpHiqRmrKJ8cp24I75pwbw
	UxoFljOlS5XR9wKflhbVRoA=
X-Google-Smtp-Source: AKy350ZZP0vLfS334AXJ1QOOCUu1Iz6IfelFWZ0j6MBXF/9ON1OR+oP0rMSuxPQc4qp6H8kpAFlguw==
X-Received: by 2002:a5d:68cb:0:b0:2cf:fd6:b83f with SMTP id p11-20020a5d68cb000000b002cf0fd6b83fmr12153147wrw.8.1680507700653;
        Mon, 03 Apr 2023 00:41:40 -0700 (PDT)
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
Subject: [PATCH v4 5/7] hw/isa/piix3: Avoid Xen-specific variant of piix3_write_config()
Date: Mon,  3 Apr 2023 09:41:22 +0200
Message-Id: <20230403074124.3925-6-shentey@gmail.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230403074124.3925-1-shentey@gmail.com>
References: <20230403074124.3925-1-shentey@gmail.com>
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
Reviewed-by: Anthony PERARD <anthony.perard@citrix.com>
Tested-by: Chuck Zmudzinski <brchuckz@aol.com>
Message-Id: <20230312120221.99183-5-shentey@gmail.com>
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
2.40.0


