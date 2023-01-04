Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 205F465D666
	for <lists+xen-devel@lfdr.de>; Wed,  4 Jan 2023 15:45:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.471206.730993 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pD51G-00084N-FN; Wed, 04 Jan 2023 14:45:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 471206.730993; Wed, 04 Jan 2023 14:45:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pD51G-0007xg-7s; Wed, 04 Jan 2023 14:45:30 +0000
Received: by outflank-mailman (input) for mailman id 471206;
 Wed, 04 Jan 2023 14:45:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=bCSi=5B=gmail.com=shentey@srs-se1.protection.inumbo.net>)
 id 1pD51E-00079V-NI
 for xen-devel@lists.xenproject.org; Wed, 04 Jan 2023 14:45:28 +0000
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [2a00:1450:4864:20::429])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6d631fb3-8c3e-11ed-b8d0-410ff93cb8f0;
 Wed, 04 Jan 2023 15:45:26 +0100 (CET)
Received: by mail-wr1-x429.google.com with SMTP id s9so1188041wru.13
 for <xen-devel@lists.xenproject.org>; Wed, 04 Jan 2023 06:45:26 -0800 (PST)
Received: from osoxes.fritz.box
 (p200300faaf0bb2009c4947838afc41b6.dip0.t-ipconnect.de.
 [2003:fa:af0b:b200:9c49:4783:8afc:41b6])
 by smtp.gmail.com with ESMTPSA id
 e10-20020a5d594a000000b0028663fc8f4csm21168241wri.30.2023.01.04.06.45.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Jan 2023 06:45:26 -0800 (PST)
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
X-Inumbo-ID: 6d631fb3-8c3e-11ed-b8d0-410ff93cb8f0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9kGVFT98W8E67AgEjIgODwyRdBIrAWSrE8+3kXPv+J8=;
        b=ZOgIvlh/yVYKniIe+nDfDmWng8AeG9tivYZ8qAp1ejGNIiF0OlcQxQQawaNqvp5kyI
         db6PpoClsgtQ24vN7b43iAIA4RkZZU2IuOOdMiKpghvD5UHV30I+MHCh5SnMLIlEqhWk
         mR+3nciHSn7my9PZJ/fxT/DQUm5quEOmOzKRJxhQXvCi1Tlkjaffx44yMQmtlg7jafz9
         wOcea1XtCncOTtqIdlZLJeZYVgaPkId9KcpEWYWGMpMofvDc7L/iDozqI0Ael/BQ+wHL
         j+1XDUGTqoI9HCUs5EMZBaZj8RISPwyWc1chvQYyjR/soqxI4/ZON7/PcZZGAwU+arqe
         ymhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9kGVFT98W8E67AgEjIgODwyRdBIrAWSrE8+3kXPv+J8=;
        b=uqCJCt0N6crTncE10JorEj2r3sHJgBtLmnI/+SXmThCLsmNvPszNYblAPLgOJomsep
         g/W0QCD80NZ14/6fjbWuX0Ptqgdkm7CtjtfCXtO2kXcfgP6+AbcPSyjxQiHYwbgD1KTx
         IfvvXOaPYgI5IQ/5CDWcy67MJingWccMM9hEC7AWOBB9TKGk5n9Of11dMlTYZJd4dhx0
         eKKPqiVjF1sCL0dVW3lPWFqlC7nStXFwa7mAn+IMPHEhuIvO/GYxktAd9/rq5DrEZvsl
         EIwcElE32YmhWgkvgIHXmCt3hHin/F4Nkpz3euUFRb6TmqtFWeDwAXabnbsWYnh1DSxA
         OSmA==
X-Gm-Message-State: AFqh2krlW2JxHLCP9cclFtLM2fFwHgJr4scvfnS6uAhgE6Mn41skztBl
	xzDVTSqGFQM42PtzvyJnReo=
X-Google-Smtp-Source: AMrXdXu/V1VAakoVNA901K1DaXhCb0Z6edEmYwIKwkLsKHezEymfRbemWS6Mw7ngG0Tn4FnagiDi+A==
X-Received: by 2002:a5d:5485:0:b0:294:50d6:86ad with SMTP id h5-20020a5d5485000000b0029450d686admr8741280wrv.2.1672843526555;
        Wed, 04 Jan 2023 06:45:26 -0800 (PST)
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
Subject: [PATCH v2 4/6] hw/isa/piix: Avoid Xen-specific variant of piix_write_config()
Date: Wed,  4 Jan 2023 15:44:35 +0100
Message-Id: <20230104144437.27479-5-shentey@gmail.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230104144437.27479-1-shentey@gmail.com>
References: <20230104144437.27479-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Subscribe to pci_bus_fire_intx_routing_notifier() instead which allows for
having a common piix_write_config() for all PIIX device models.

While at it, move the subscription into machine code in order to resolve
TYPE_PIIX3_XEN_DEVICE.

In a possible future followup, pci_bus_fire_intx_routing_notifier() could
be adjusted in such a way that subscribing to it doesn't require
knowledge of the device firing it.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
---
 hw/i386/pc_piix.c | 18 ++++++++++++++++++
 hw/isa/piix.c     | 22 +---------------------
 2 files changed, 19 insertions(+), 21 deletions(-)

diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
index 792dcd3ce8..5738d9cdca 100644
--- a/hw/i386/pc_piix.c
+++ b/hw/i386/pc_piix.c
@@ -86,6 +86,21 @@ static int pci_slot_get_pirq(PCIDevice *pci_dev, int pci_intx)
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
@@ -248,6 +263,9 @@ static void pc_init1(MachineState *machine,
         pci_realize_and_unref(pci_dev, pci_bus, &error_fatal);
 
         if (xen_enabled()) {
+            pci_device_set_intx_routing_notifier(
+                        pci_dev, piix_intx_routing_notifier_xen);
+
             /*
              * Xen supports additional interrupt routes from the PCI devices to
              * the IOAPIC: the four pins of each PCI device on the bus are also
diff --git a/hw/isa/piix.c b/hw/isa/piix.c
index ac04781f46..d4cdb3dadb 100644
--- a/hw/isa/piix.c
+++ b/hw/isa/piix.c
@@ -125,26 +125,6 @@ static void piix_write_config(PCIDevice *dev, uint32_t address, uint32_t val,
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
-    piix_write_config(dev, address, val, len);
-}
-
 static void piix_reset(DeviceState *dev)
 {
     PIIXState *d = PIIX_PCI_DEVICE(dev);
@@ -490,7 +470,7 @@ static void piix3_xen_class_init(ObjectClass *klass, void *data)
     DeviceClass *dc = DEVICE_CLASS(klass);
     PCIDeviceClass *k = PCI_DEVICE_CLASS(klass);
 
-    k->config_write = piix3_write_config_xen;
+    k->config_write = piix_write_config;
     k->realize = piix3_realize;
     /* 82371SB PIIX3 PCI-to-ISA bridge (Step A1) */
     k->device_id = PCI_DEVICE_ID_INTEL_82371SB_0;
-- 
2.39.0


