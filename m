Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EE20265B765
	for <lists+xen-devel@lfdr.de>; Mon,  2 Jan 2023 22:36:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.470401.729925 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pCSTB-0004Jb-C2; Mon, 02 Jan 2023 21:35:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 470401.729925; Mon, 02 Jan 2023 21:35:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pCSTB-0004He-6q; Mon, 02 Jan 2023 21:35:45 +0000
Received: by outflank-mailman (input) for mailman id 470401;
 Mon, 02 Jan 2023 21:35:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jV8v=47=gmail.com=shentey@srs-se1.protection.inumbo.net>)
 id 1pCST9-0003Wl-HS
 for xen-devel@lists.xenproject.org; Mon, 02 Jan 2023 21:35:43 +0000
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [2a00:1450:4864:20::631])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 68b2b11a-8ae5-11ed-91b6-6bf2151ebd3b;
 Mon, 02 Jan 2023 22:35:42 +0100 (CET)
Received: by mail-ej1-x631.google.com with SMTP id tz12so69253234ejc.9
 for <xen-devel@lists.xenproject.org>; Mon, 02 Jan 2023 13:35:42 -0800 (PST)
Received: from osoxes.fritz.box
 (p200300faaf0bb2009c4947838afc41b6.dip0.t-ipconnect.de.
 [2003:fa:af0b:b200:9c49:4783:8afc:41b6])
 by smtp.gmail.com with ESMTPSA id
 f11-20020a17090631cb00b0084c465709b7sm10583826ejf.74.2023.01.02.13.35.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Jan 2023 13:35:42 -0800 (PST)
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
X-Inumbo-ID: 68b2b11a-8ae5-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7hyvY3JWBoATeou/9rB1bwHPuTVRUibflv0giDEMRFI=;
        b=FFEt7jlJJ+TZncL9s1i0SklCgyxtm7oXcgRQkgj1jE/dUm5xg4LuIlrUbaq8eTpWQk
         lusWPMYsPPe89MlCOjXfmbss+PluOmAxo6TNTCn9VkwqzVNEZ3pVIGV+6zPOo/B7hbEh
         FmoABY83bkE7ljMZ/86Ed1q7lLc0TapiAISU8cMWHLoCo4wI4jM8GQazvPxntgfkxhiz
         2ZSA4IZW5Si/6jksdfwVNRNxrFq3EWZxMZttbBJnMHMVsowEnu9KUUccK7YbD9iPZamu
         DParMymbvqglGiQez25zSFsN1UKJDDtUYdY3QfXN5LHP3fVI24Qal2+w+ixfoMNzXLhj
         V9dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7hyvY3JWBoATeou/9rB1bwHPuTVRUibflv0giDEMRFI=;
        b=3UUAPrDBn6aryWVtNxiLS7asCOMcMAjUJbU4CUbVqxKh8a4iYJ6CE6SK10ch4/ndJt
         B5LtgvQvD7dKPaAmR8Z9FCy9/lHtB+XMeFhuaiwPcJyfyFG8xmuZTQbEagqvW9ZblUli
         /YswbHBHfRuYk4uuB3o2C+Lenpe6UAWpYcgX452CpeDPgMEzu3+zEggkzO2FZYg8hF+B
         +wKITtukVVqr8iMZojEt0s9QzFewVBP/WZRUt0XrQCb25cDB6E247slJkOD6c56d/hfP
         CJUsv6B2bSuhy0AJOoVZoWxPy065WeyN195sBf0HzGvz97Kjv9wbvEJTlFEB2PX4qFZj
         WzRg==
X-Gm-Message-State: AFqh2kqguy8j4HZBlynSxeobZVM6EacLLp4+vz9PW3RJzZ+LVTLq+fUo
	ba0Tl7mpNIx/zK/YrXFFH/g=
X-Google-Smtp-Source: AMrXdXvIXbwA5JGbCDQQQ/3trRrkBQ1pENW/JDFoCpw2RIHuU1jqIwyoQaXoQv83ATNGp2NKk0iVhw==
X-Received: by 2002:a17:906:1410:b0:7c0:eba3:e2e with SMTP id p16-20020a170906141000b007c0eba30e2emr32660029ejc.31.1672695342501;
        Mon, 02 Jan 2023 13:35:42 -0800 (PST)
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
Subject: [PATCH 4/6] hw/isa/piix: Avoid Xen-specific variant of piix_write_config()
Date: Mon,  2 Jan 2023 22:35:02 +0100
Message-Id: <20230102213504.14646-5-shentey@gmail.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230102213504.14646-1-shentey@gmail.com>
References: <20230102213504.14646-1-shentey@gmail.com>
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
index c02f68010d..7ef0054b3a 100644
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


