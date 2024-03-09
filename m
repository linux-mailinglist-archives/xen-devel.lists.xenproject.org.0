Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B184877383
	for <lists+xen-devel@lfdr.de>; Sat,  9 Mar 2024 20:23:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.690974.1076717 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rj2Ht-0002fW-K8; Sat, 09 Mar 2024 19:23:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 690974.1076717; Sat, 09 Mar 2024 19:23:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rj2Ht-0002dV-GH; Sat, 09 Mar 2024 19:23:17 +0000
Received: by outflank-mailman (input) for mailman id 690974;
 Sat, 09 Mar 2024 19:23:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=MmSm=KP=linaro.org=philmd@srs-se1.protection.inumbo.net>)
 id 1rj2Hs-0001PG-9Y
 for xen-devel@lists.xenproject.org; Sat, 09 Mar 2024 19:23:16 +0000
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [2a00:1450:4864:20::131])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7a608a61-de4a-11ee-afdb-a90da7624cb6;
 Sat, 09 Mar 2024 20:23:15 +0100 (CET)
Received: by mail-lf1-x131.google.com with SMTP id
 2adb3069b0e04-5131316693cso4162562e87.0
 for <xen-devel@lists.xenproject.org>; Sat, 09 Mar 2024 11:23:15 -0800 (PST)
Received: from m1x-phil.lan ([176.176.181.237])
 by smtp.gmail.com with ESMTPSA id
 p16-20020a17090653d000b00a45464679b1sm1162257ejo.127.2024.03.09.11.23.13
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Sat, 09 Mar 2024 11:23:15 -0800 (PST)
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
X-Inumbo-ID: 7a608a61-de4a-11ee-afdb-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1710012195; x=1710616995; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0dapH6sMmnV9ZamVJJtysMb9yL4xw8w3bAoh22EL4Vo=;
        b=fHCxpYTJrujOGvx39nMCUL0k5oKD5+rHFeT5I+lFFnN4j068UFbLSG/WOLeEM1/ZZH
         VQ+ShR+2TCfQHNsG5C8vMloNdd7NFyttFp1ENyqj1z0/jdFnGrL3h3Dgn+0NSbPBoccV
         PQv6+jix2ZrszySLNw6mU7Rbq5QKs201e0NS79WHEwviKTOJaP7vtjQjnph8/wnli1/B
         WuaGqE72Blhnul0+66zjBxSNh98Dro0+qPVvZAgDTkcyOqDOLHVA++yzDe+vS+2Dw+gp
         eF5u8qTBQNFvjGUNXRdXCENCR3in48YGY2ykg6YsYgLQit8ZKshUk0cCyuX9WegJZ4qO
         o2Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710012195; x=1710616995;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0dapH6sMmnV9ZamVJJtysMb9yL4xw8w3bAoh22EL4Vo=;
        b=Ppo5TI/Yyvp2rjXG1SynzSn1AYJViCYlku2aGhAB6UX1pLYrBgzVybofkcRqf4/5uN
         WpOt8EHH+CEzl6rmdjkaoDFTNRIWVhy9PnDD3q01W/CScowecRN2vQF3uZHnU/4PZnva
         xIOrsBrcxNo0M4L7q/od0kO0lnm+mdxkMsOGcJWFqB4un2K+dg0OfNAvwIJLuNEA5khX
         nsSurh7ed8juKI/DgoTjlY5nKelLD8f7ZKalz3rDyT2iy2RhwmFIlPEWS5jz1basghkU
         rH4L62tyDK6l5o5wL7bbAVGDCbusrjF944qHJ3Z80wb1VJXKsMnIvvx/SWzSHSpRLrFw
         +Lmg==
X-Forwarded-Encrypted: i=1; AJvYcCWcUz2V1bll2BET1Rj/LjW8uJ27NopxQpovkVD7E/p2kEoYDS5UvBoZqclmNwvjDx47Yb2E/QX47aNhlaQqFItoTDLSs9a4E+je83/cAe4=
X-Gm-Message-State: AOJu0Yym+YItdot1fU8kRrHveAnrtxOaDYbRUgcFwMCqzc0Q1MyBUl6V
	vDqAu78YEB485kwzUy89+LHq1SzIiLFuKjbAXrwIC/2MCjGexb0w3JUMbxWPlu0=
X-Google-Smtp-Source: AGHT+IFZ9Fs+PsF2jnfTNVld6iD1aF/yC/++Clb+ISz5eMReGA6KlLI+TlLWLbqJFmWdTAeuAL2cvw==
X-Received: by 2002:a19:f709:0:b0:513:54c6:9f68 with SMTP id z9-20020a19f709000000b0051354c69f68mr1301272lfe.18.1710012195436;
        Sat, 09 Mar 2024 11:23:15 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org,
	qemu-arm@nongnu.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	David Woodhouse <dwmw@amazon.co.uk>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Anthony Perard <anthony.perard@citrix.com>,
	Paul Durrant <paul@xen.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Eduardo Habkost <eduardo@habkost.net>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	xen-devel@lists.xenproject.org
Subject: [PULL 10/43] hw/xen: Extract 'xen_igd.h' from 'xen_pt.h'
Date: Sat,  9 Mar 2024 20:21:37 +0100
Message-ID: <20240309192213.23420-11-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240309192213.23420-1-philmd@linaro.org>
References: <20240309192213.23420-1-philmd@linaro.org>
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
Message-Id: <20231114143816.71079-18-philmd@linaro.org>
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
index ce6aad758d..e123458bbc 100644
--- a/hw/i386/pc_piix.c
+++ b/hw/i386/pc_piix.c
@@ -55,6 +55,7 @@
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


