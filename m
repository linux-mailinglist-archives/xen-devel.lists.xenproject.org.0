Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 976DA7EB2DE
	for <lists+xen-devel@lfdr.de>; Tue, 14 Nov 2023 15:56:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.632693.987049 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r2upi-0003XX-4B; Tue, 14 Nov 2023 14:56:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 632693.987049; Tue, 14 Nov 2023 14:56:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r2upi-0003Vf-10; Tue, 14 Nov 2023 14:56:06 +0000
Received: by outflank-mailman (input) for mailman id 632693;
 Tue, 14 Nov 2023 14:56:03 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=6V1E=G3=linaro.org=philmd@srs-se1.protection.inumbo.net>)
 id 1r2uaO-0003vI-Id
 for xen-devel@lists.xenproject.org; Tue, 14 Nov 2023 14:40:16 +0000
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [2a00:1450:4864:20::62b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b9a20dbc-82fb-11ee-98db-6d05b1d4d9a1;
 Tue, 14 Nov 2023 15:40:15 +0100 (CET)
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-9d0b4dfd60dso855708766b.1
 for <xen-devel@lists.xenproject.org>; Tue, 14 Nov 2023 06:40:15 -0800 (PST)
Received: from m1x-phil.lan (cac94-h02-176-184-25-155.dsl.sta.abo.bbox.fr.
 [176.184.25.155]) by smtp.gmail.com with ESMTPSA id
 le5-20020a170907170500b00988f168811bsm5631076ejc.135.2023.11.14.06.40.13
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 14 Nov 2023 06:40:15 -0800 (PST)
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
X-Inumbo-ID: b9a20dbc-82fb-11ee-98db-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1699972815; x=1700577615; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cJTBhe5AIq+piFF54yNuiwKWHopSqD7by2+9eio+MdU=;
        b=s3YqYle69AuGuZZktfwL85Hlz8R2eFClsv4c7v6JzfgsiGDQ1qQ/R9ch41BszS3Wrw
         C57bZK6V8urpUWL0j6xqoJI/Tb+jcGjwnfvHWj0zOLHrOQxsKrQKUwG0AW17QVxzjlLR
         EoMmaVMJa4ll13qxbbUXtqk5/eWQSWP3fxkX/0Tt/hn2LrYcAErTeUFyWeR0jC8DkgbT
         ciSWskNgm9aOKjxO07iYq9mgXoxPNYeWjqW3R5/maqBw3yom6eoNmjac6vJ400DDm+uH
         wy9T9wTwAILwerha+Y+EJ+JnpZn8wQlCqr49yar+FmzwGtPAGexmL4ywL+T07HZ/f+A1
         lw1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699972815; x=1700577615;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cJTBhe5AIq+piFF54yNuiwKWHopSqD7by2+9eio+MdU=;
        b=Uh8bHahNUM63TTNjpe2p5TbfAUTyc0T5cIoPNFtzl+E+slC9S4IQE6ihTIVaMCGR8k
         c5Rn/ycxnhjW0ZrWsPLK9Glx7z1ksvJsirz+zVowAAkql92hf0apraNfBikZOmxMKH+0
         HZAUozV1Lu6utZhhGW89dPoPLSuvQZyWkwzmiAocL1V5g40zrKdA5kyu202IZL/o96r7
         N282yTBh4zr07+n87pXSd7CZwedqkK+QkMFgt0zXkkeEIxU41ebHqG/dckjotRKnB0hY
         Pz95EAFMrSm6ciR4JS2enoTrZxKlnn9/YG72OyVfSxXvU7Q/aM2707NtCBdTyu4811Ai
         xHXg==
X-Gm-Message-State: AOJu0YzzHq/CLBADElAkEbyQVH20i1x6OrLpR41xC8z2Aba3H1d7nmtZ
	PGD7Jt28ez+Qv8hVXNA6Tj3e6A==
X-Google-Smtp-Source: AGHT+IE8dPcoX4Dac2Uu05H6YcGwd8wvx56/VSesXpaOIpMKV8Ekj9QVQKSryNOPBDH4ia71GkoHQw==
X-Received: by 2002:a17:906:6a1f:b0:9b2:df16:851d with SMTP id qw31-20020a1709066a1f00b009b2df16851dmr9925246ejc.57.1699972815506;
        Tue, 14 Nov 2023 06:40:15 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: David Woodhouse <dwmw@amazon.co.uk>,
	qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Paul Durrant <paul@xen.org>,
	qemu-arm@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	David Woodhouse <dwmw2@infradead.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	xen-devel@lists.xenproject.org,
	qemu-block@nongnu.org,
	Anthony Perard <anthony.perard@citrix.com>,
	kvm@vger.kernel.org,
	Thomas Huth <thuth@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Eduardo Habkost <eduardo@habkost.net>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Subject: [PATCH-for-9.0 v2 17/19] hw/xen: Extract 'xen_igd.h' from 'xen_pt.h'
Date: Tue, 14 Nov 2023 15:38:13 +0100
Message-ID: <20231114143816.71079-18-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231114143816.71079-1-philmd@linaro.org>
References: <20231114143816.71079-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

"hw/xen/xen_pt.h" requires "hw/xen/xen_native.h" which is target
specific. It also declares IGD methods, which are not target
specific.

Target-agnostic code can use IGD methods. To allow that, extract
these methos into a new "hw/xen/xen_igd.h" header.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: David Woodhouse <dwmw@amazon.co.uk>
---
 hw/xen/xen_pt.h             | 14 --------------
 include/hw/xen/xen_igd.h    | 33 +++++++++++++++++++++++++++++++++
 accel/xen/xen-all.c         |  1 +
 hw/i386/pc_piix.c           |  1 +
 hw/xen/xen_pt.c             |  3 ++-
 hw/xen/xen_pt_config_init.c |  3 ++-
 hw/xen/xen_pt_graphics.c    |  3 ++-
 hw/xen/xen_pt_stub.c        |  2 +-
 8 files changed, 42 insertions(+), 18 deletions(-)
 create mode 100644 include/hw/xen/xen_igd.h

diff --git a/hw/xen/xen_pt.h b/hw/xen/xen_pt.h
index d3180bb134..095a0f0365 100644
--- a/hw/xen/xen_pt.h
+++ b/hw/xen/xen_pt.h
@@ -15,9 +15,6 @@
 #include "xen-host-pci-device.h"
 #include "qom/object.h"
 
-bool xen_igd_gfx_pt_enabled(void);
-void xen_igd_gfx_pt_set(bool value, Error **errp);
-
 void xen_pt_log(const PCIDevice *d, const char *f, ...) G_GNUC_PRINTF(2, 3);
 
 #define XEN_PT_ERR(d, _f, _a...) xen_pt_log(d, "%s: Error: "_f, __func__, ##_a)
@@ -62,12 +59,6 @@ typedef struct XenPTDeviceClass {
     XenPTQdevRealize pci_qdev_realize;
 } XenPTDeviceClass;
 
-uint32_t igd_read_opregion(XenPCIPassthroughState *s);
-void xen_igd_reserve_slot(PCIBus *pci_bus);
-void igd_write_opregion(XenPCIPassthroughState *s, uint32_t val);
-void xen_igd_passthrough_isa_bridge_create(XenPCIPassthroughState *s,
-                                           XenHostPCIDevice *dev);
-
 /* function type for config reg */
 typedef int (*xen_pt_conf_reg_init)
     (XenPCIPassthroughState *, XenPTRegInfo *, uint32_t real_offset,
@@ -353,11 +344,6 @@ static inline bool xen_pt_has_msix_mapping(XenPCIPassthroughState *s, int bar)
 void *pci_assign_dev_load_option_rom(PCIDevice *dev, int *size,
                                      unsigned int domain, unsigned int bus,
                                      unsigned int slot, unsigned int function);
-static inline bool is_igd_vga_passthrough(XenHostPCIDevice *dev)
-{
-    return (xen_igd_gfx_pt_enabled()
-            && ((dev->class_code >> 0x8) == PCI_CLASS_DISPLAY_VGA));
-}
 int xen_pt_register_vga_regions(XenHostPCIDevice *dev);
 int xen_pt_unregister_vga_regions(XenHostPCIDevice *dev);
 void xen_pt_setup_vga(XenPCIPassthroughState *s, XenHostPCIDevice *dev,
diff --git a/include/hw/xen/xen_igd.h b/include/hw/xen/xen_igd.h
new file mode 100644
index 0000000000..7ffca06c10
--- /dev/null
+++ b/include/hw/xen/xen_igd.h
@@ -0,0 +1,33 @@
+/*
+ * Copyright (c) 2007, Neocleus Corporation.
+ * Copyright (c) 2007, Intel Corporation.
+ *
+ * SPDX-License-Identifier: GPL-2.0-only
+ *
+ * Alex Novik <alex@neocleus.com>
+ * Allen Kay <allen.m.kay@intel.com>
+ * Guy Zana <guy@neocleus.com>
+ */
+#ifndef XEN_IGD_H
+#define XEN_IGD_H
+
+#include "hw/xen/xen-host-pci-device.h"
+
+typedef struct XenPCIPassthroughState XenPCIPassthroughState;
+
+bool xen_igd_gfx_pt_enabled(void);
+void xen_igd_gfx_pt_set(bool value, Error **errp);
+
+uint32_t igd_read_opregion(XenPCIPassthroughState *s);
+void xen_igd_reserve_slot(PCIBus *pci_bus);
+void igd_write_opregion(XenPCIPassthroughState *s, uint32_t val);
+void xen_igd_passthrough_isa_bridge_create(XenPCIPassthroughState *s,
+                                           XenHostPCIDevice *dev);
+
+static inline bool is_igd_vga_passthrough(XenHostPCIDevice *dev)
+{
+    return (xen_igd_gfx_pt_enabled()
+            && ((dev->class_code >> 0x8) == PCI_CLASS_DISPLAY_VGA));
+}
+
+#endif
diff --git a/accel/xen/xen-all.c b/accel/xen/xen-all.c
index 5ff0cb8bd9..0bdefce537 100644
--- a/accel/xen/xen-all.c
+++ b/accel/xen/xen-all.c
@@ -15,6 +15,7 @@
 #include "hw/xen/xen_native.h"
 #include "hw/xen/xen-legacy-backend.h"
 #include "hw/xen/xen_pt.h"
+#include "hw/xen/xen_igd.h"
 #include "chardev/char.h"
 #include "qemu/accel.h"
 #include "sysemu/cpus.h"
diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
index eace854335..a607dcb56c 100644
--- a/hw/i386/pc_piix.c
+++ b/hw/i386/pc_piix.c
@@ -56,6 +56,7 @@
 #ifdef CONFIG_XEN
 #include <xen/hvm/hvm_info_table.h>
 #include "hw/xen/xen_pt.h"
+#include "hw/xen/xen_igd.h"
 #endif
 #include "hw/xen/xen-x86.h"
 #include "hw/xen/xen.h"
diff --git a/hw/xen/xen_pt.c b/hw/xen/xen_pt.c
index 36e6f93c37..a8edabdabc 100644
--- a/hw/xen/xen_pt.c
+++ b/hw/xen/xen_pt.c
@@ -59,7 +59,8 @@
 #include "hw/pci/pci.h"
 #include "hw/qdev-properties.h"
 #include "hw/qdev-properties-system.h"
-#include "xen_pt.h"
+#include "hw/xen/xen_pt.h"
+#include "hw/xen/xen_igd.h"
 #include "hw/xen/xen.h"
 #include "hw/xen/xen-legacy-backend.h"
 #include "qemu/range.h"
diff --git a/hw/xen/xen_pt_config_init.c b/hw/xen/xen_pt_config_init.c
index 2b8680b112..ba4cd78238 100644
--- a/hw/xen/xen_pt_config_init.c
+++ b/hw/xen/xen_pt_config_init.c
@@ -15,7 +15,8 @@
 #include "qemu/osdep.h"
 #include "qapi/error.h"
 #include "qemu/timer.h"
-#include "xen_pt.h"
+#include "hw/xen/xen_pt.h"
+#include "hw/xen/xen_igd.h"
 #include "hw/xen/xen-legacy-backend.h"
 
 #define XEN_PT_MERGE_VALUE(value, data, val_mask) \
diff --git a/hw/xen/xen_pt_graphics.c b/hw/xen/xen_pt_graphics.c
index 0aed3bb6fd..6c2e3f4840 100644
--- a/hw/xen/xen_pt_graphics.c
+++ b/hw/xen/xen_pt_graphics.c
@@ -3,7 +3,8 @@
  */
 #include "qemu/osdep.h"
 #include "qapi/error.h"
-#include "xen_pt.h"
+#include "hw/xen/xen_pt.h"
+#include "hw/xen/xen_igd.h"
 #include "xen-host-pci-device.h"
 
 static unsigned long igd_guest_opregion;
diff --git a/hw/xen/xen_pt_stub.c b/hw/xen/xen_pt_stub.c
index 5c108446a8..72feebeb20 100644
--- a/hw/xen/xen_pt_stub.c
+++ b/hw/xen/xen_pt_stub.c
@@ -6,7 +6,7 @@
  */
 
 #include "qemu/osdep.h"
-#include "hw/xen/xen_pt.h"
+#include "hw/xen/xen_igd.h"
 #include "qapi/error.h"
 
 bool xen_igd_gfx_pt_enabled(void)
-- 
2.41.0


