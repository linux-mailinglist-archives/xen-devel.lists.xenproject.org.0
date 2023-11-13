Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EBD327E9FFA
	for <lists+xen-devel@lfdr.de>; Mon, 13 Nov 2023 16:30:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.631729.985374 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r2Yti-0008A2-Jg; Mon, 13 Nov 2023 15:30:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 631729.985374; Mon, 13 Nov 2023 15:30:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r2Yti-00088E-Gy; Mon, 13 Nov 2023 15:30:46 +0000
Received: by outflank-mailman (input) for mailman id 631729;
 Mon, 13 Nov 2023 15:30:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=DPbO=G2=linaro.org=philmd@srs-se1.protection.inumbo.net>)
 id 1r2YlS-0005il-Oj
 for xen-devel@lists.xenproject.org; Mon, 13 Nov 2023 15:22:14 +0000
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [2a00:1450:4864:20::52c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6c2103a2-8238-11ee-98da-6d05b1d4d9a1;
 Mon, 13 Nov 2023 16:22:14 +0100 (CET)
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-54394328f65so7044526a12.3
 for <xen-devel@lists.xenproject.org>; Mon, 13 Nov 2023 07:22:14 -0800 (PST)
Received: from m1x-phil.lan ([176.164.221.204])
 by smtp.gmail.com with ESMTPSA id
 lu16-20020a170906fad000b0098884f86e41sm4167855ejb.123.2023.11.13.07.22.11
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 13 Nov 2023 07:22:13 -0800 (PST)
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
X-Inumbo-ID: 6c2103a2-8238-11ee-98da-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1699888933; x=1700493733; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M4sm9DG4Z80HufhtnK5i8zUn8uDgyk6yGboQ8Gp5Uh8=;
        b=Hx4/J/M5boRN9Gt+jVpVZh1c+Q5YfL3KxrUENgke6Q4ER6+tRewrPNTpOHkgorHTpz
         SBoLumDHlWMxYqN/X4QG7mvetq8HBD7qp4VsQ3axz9zMER0APrbhfjwBQ3QspuxiwZ4X
         aSX97eIQlM6lqV4yIijLMR2hmys7hi84Cwbm5RA3ossss9SdsmawhgxUuSzbZRWz0sTW
         LE098Bn6dV6+a0X4rEofEXb2HefWNnjQOMp1EWQB4qka+pG3bRYG/TxkatXx2ycFCYXH
         gNJjB9fBZa7kQgQZssgipNMoMt3mcHi2Brd4ukJhwFaXtj2reFdcTn8Ez7Qt2f1Dtrju
         MM1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699888933; x=1700493733;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=M4sm9DG4Z80HufhtnK5i8zUn8uDgyk6yGboQ8Gp5Uh8=;
        b=rSsxXf1N3LkgAp/YTZdkUkqMrwF9QRrqqsGZYFhhCQ90x92kwLGXAhpdk3Cx9SPrjW
         CFU2W7nvwGuEWlTbYS5kEgBPIrTFKXHarjrwdAf6+z8yT/TFdAPmFpnbKamwxN8zPFyZ
         jkEtJmvMybV36575Czj7wXC6cSwamPWdd8DpbVrxUv5GohRBtKxnsh2ZG3syLqLE8NqU
         L1vUO/lZqsDfeL/7u2tBkyLEqAm1DBYStEh7bkjqgY2tgLc1uN/YvUjkb9WU7Zx87hm1
         dnjADkJHbF4+fy33yMiswzYxof1Lh96gia5knJAlvqAVoS5rO2R/BgwWfr/iry6jErM+
         3a9g==
X-Gm-Message-State: AOJu0YxWCW8gtzlgmmuWUWwPfk1HhSkJZd/iWRn1KaxaECZ6ewXizBX5
	sw6/GAuz+pJ6uYZjy8AmLoP7CA==
X-Google-Smtp-Source: AGHT+IHGfNKy17vE6nE5Sw7Yg/bCgxdoxzzgRWsVuH1JW/c7ZnqbwtyNJGeirXmng2B4mnP0CKSxhg==
X-Received: by 2002:a17:906:b092:b0:9de:2b93:cab9 with SMTP id x18-20020a170906b09200b009de2b93cab9mr5146163ejy.8.1699888933620;
        Mon, 13 Nov 2023 07:22:13 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: David Woodhouse <dwmw@amazon.co.uk>,
	qemu-devel@nongnu.org
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Anthony Perard <anthony.perard@citrix.com>,
	xen-devel@lists.xenproject.org,
	Stefano Stabellini <sstabellini@kernel.org>,
	qemu-block@nongnu.org,
	Thomas Huth <thuth@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	qemu-arm@nongnu.org,
	Paul Durrant <paul@xen.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	Eduardo Habkost <eduardo@habkost.net>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Subject: [PATCH-for-9.0 09/10] hw/xen: Extract 'xen_igd.h' from 'xen_pt.h'
Date: Mon, 13 Nov 2023 16:21:12 +0100
Message-ID: <20231113152114.47916-10-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231113152114.47916-1-philmd@linaro.org>
References: <20231113152114.47916-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

"hw/xen/xen_pt.h" requires "hw/xen/xen_native.h" which is target
specific. It also declares IGD methods, which are not target
specific.

Target-agnostic code can use IGD methods. To allow that, extract
these methos into a new "hw/xen/xen_igd.h" header.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
What license for the new "hw/xen/xen_igd.h" header?
---
 hw/xen/xen_pt.h             | 14 --------------
 include/hw/xen/xen_igd.h    | 23 +++++++++++++++++++++++
 accel/xen/xen-all.c         |  1 +
 hw/i386/pc_piix.c           |  1 +
 hw/xen/xen_pt.c             |  3 ++-
 hw/xen/xen_pt_config_init.c |  3 ++-
 hw/xen/xen_pt_graphics.c    |  3 ++-
 hw/xen/xen_pt_stub.c        |  2 +-
 8 files changed, 32 insertions(+), 18 deletions(-)
 create mode 100644 include/hw/xen/xen_igd.h

diff --git a/hw/xen/xen_pt.h b/hw/xen/xen_pt.h
index 31bcfdf705..da5af67638 100644
--- a/hw/xen/xen_pt.h
+++ b/hw/xen/xen_pt.h
@@ -5,9 +5,6 @@
 #include "xen-host-pci-device.h"
 #include "qom/object.h"
 
-bool xen_igd_gfx_pt_enabled(void);
-void xen_igd_gfx_pt_set(bool value, Error **errp);
-
 void xen_pt_log(const PCIDevice *d, const char *f, ...) G_GNUC_PRINTF(2, 3);
 
 #define XEN_PT_ERR(d, _f, _a...) xen_pt_log(d, "%s: Error: "_f, __func__, ##_a)
@@ -52,12 +49,6 @@ typedef struct XenPTDeviceClass {
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
@@ -343,11 +334,6 @@ static inline bool xen_pt_has_msix_mapping(XenPCIPassthroughState *s, int bar)
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
index 0000000000..52f1f8244c
--- /dev/null
+++ b/include/hw/xen/xen_igd.h
@@ -0,0 +1,23 @@
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


