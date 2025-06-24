Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3818FAE5AA0
	for <lists+xen-devel@lfdr.de>; Tue, 24 Jun 2025 05:55:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1022910.1398788 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uTukk-0006eB-Uq; Tue, 24 Jun 2025 03:55:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1022910.1398788; Tue, 24 Jun 2025 03:55:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uTukk-0006al-PP; Tue, 24 Jun 2025 03:55:22 +0000
Received: by outflank-mailman (input) for mailman id 1022910;
 Tue, 24 Jun 2025 03:55:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=1A0Y=ZH=proton.me=dmkhn@srs-se1.protection.inumbo.net>)
 id 1uTukj-000639-9F
 for xen-devel@lists.xenproject.org; Tue, 24 Jun 2025 03:55:21 +0000
Received: from mail-10630.protonmail.ch (mail-10630.protonmail.ch
 [79.135.106.30]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0bab80d8-50af-11f0-b894-0df219b8e170;
 Tue, 24 Jun 2025 05:55:19 +0200 (CEST)
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
X-Inumbo-ID: 0bab80d8-50af-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1750737317; x=1750996517;
	bh=fU+A+CPMQ76T5nM/3fv4rEH7OqjnjtaOzr8CFYG64PM=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=a7w3v6wpxPr5LAgXe7c9kHpVKcAvzPEezqByuvtPqrQtTcVfV8JH/y+a3PmDOyKY2
	 /IGKgkhq6C+hdTiTb6ti4n92Soa/iw7uzkT3rNQv2VZ9UEwBFbjnzAbpNqKQcNhvzJ
	 GnWOgLpNrCeGWMPU50UbkUsePQYKCCJmwi/LDPWFwsN+AoLTDUOxo5/ziIQI3I2C0S
	 fR86bYc7leg2w9/zIDhqE3oF/7IghHcCsak0zPWgzuX2vUXKms0t/Ut5xy1iou8dFB
	 ap7OCeeUdLRI/JRRz0hd5qnz98v/waBJk3uSAwjhPUHAnmRqHz9+Nj/xfo/sN5RGG5
	 G5pKkHlZSg8Pw==
Date: Tue, 24 Jun 2025 03:55:12 +0000
To: xen-devel@lists.xenproject.org
From: dmkhn@proton.me
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, jbeulich@suse.com, julien@xen.org, michal.orzel@amd.com, oleksii.kurochko@gmail.com, roger.pau@citrix.com, sstabellini@kernel.org, dmukhin@ford.com
Subject: [PATCH v1 02/16] arm/vpl011: move DT node parsing to PL011 emulator code
Message-ID: <20250624035443.344099-3-dmukhin@ford.com>
In-Reply-To: <20250624035443.344099-1-dmukhin@ford.com>
References: <20250624035443.344099-1-dmukhin@ford.com>
Feedback-ID: 123220910:user:proton
X-Pm-Message-ID: 0cd9e5aac8ded32fc4e555ba40515db5f5c24244
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

From: Denis Mukhin <dmukhin@ford.com>=20

Move vpl011 DT node parsing from common Arm code to PL011 emulator code.

While doing it pick the generic name vuart_add_fwnode() for DT parser funct=
ion
and place the declaration in the common header in include/xen/vuart.h.

No functional change.

Signed-off-by: Denis Mukhin <dmukhin@ford.com>
---
 xen/arch/arm/dom0less-build.c | 52 ++---------------------------------
 xen/arch/arm/vpl011.c         | 52 +++++++++++++++++++++++++++++++++++
 xen/include/xen/vuart.h       | 23 ++++++++++++++++
 3 files changed, 77 insertions(+), 50 deletions(-)
 create mode 100644 xen/include/xen/vuart.h

diff --git a/xen/arch/arm/dom0less-build.c b/xen/arch/arm/dom0less-build.c
index 2a5531a2b892..7c1b59750fb5 100644
--- a/xen/arch/arm/dom0less-build.c
+++ b/xen/arch/arm/dom0less-build.c
@@ -15,6 +15,7 @@
 #include <xen/static-memory.h>
 #include <xen/static-shmem.h>
 #include <xen/vmap.h>
+#include <xen/vuart.h>
=20
 #include <public/bootfdt.h>
 #include <public/io/xs_wire.h>
@@ -167,55 +168,6 @@ int __init make_intc_domU_node(struct kernel_info *kin=
fo)
     }
 }
=20
-#ifdef CONFIG_HAS_VUART_PL011
-static int __init make_vpl011_uart_node(struct kernel_info *kinfo)
-{
-    void *fdt =3D kinfo->fdt;
-    int res;
-    gic_interrupt_t intr;
-    __be32 reg[GUEST_ROOT_ADDRESS_CELLS + GUEST_ROOT_SIZE_CELLS];
-    __be32 *cells;
-    struct domain *d =3D kinfo->d;
-
-    res =3D domain_fdt_begin_node(fdt, "sbsa-uart", d->arch.vpl011.base_ad=
dr);
-    if ( res )
-        return res;
-
-    res =3D fdt_property_string(fdt, "compatible", "arm,sbsa-uart");
-    if ( res )
-        return res;
-
-    cells =3D &reg[0];
-    dt_child_set_range(&cells, GUEST_ROOT_ADDRESS_CELLS,
-                       GUEST_ROOT_SIZE_CELLS, d->arch.vpl011.base_addr,
-                       GUEST_PL011_SIZE);
-
-    res =3D fdt_property(fdt, "reg", reg, sizeof(reg));
-    if ( res )
-        return res;
-
-    set_interrupt(intr, d->arch.vpl011.virq, 0xf, DT_IRQ_TYPE_LEVEL_HIGH);
-
-    res =3D fdt_property(fdt, "interrupts", intr, sizeof (intr));
-    if ( res )
-        return res;
-
-    res =3D fdt_property_cell(fdt, "interrupt-parent",
-                            kinfo->phandle_intc);
-    if ( res )
-        return res;
-
-    /* Use a default baud rate of 115200. */
-    fdt_property_u32(fdt, "current-speed", 115200);
-
-    res =3D fdt_end_node(fdt);
-    if ( res )
-        return res;
-
-    return 0;
-}
-#endif
-
 int __init make_arch_nodes(struct kernel_info *kinfo)
 {
     int ret;
@@ -227,7 +179,7 @@ int __init make_arch_nodes(struct kernel_info *kinfo)
     if ( kinfo->arch.vpl011 )
     {
 #ifdef CONFIG_HAS_VUART_PL011
-        ret =3D make_vpl011_uart_node(kinfo);
+        ret =3D vuart_add_fwnode(kinfo->d, kinfo);
 #endif
         if ( ret )
             return -EINVAL;
diff --git a/xen/arch/arm/vpl011.c b/xen/arch/arm/vpl011.c
index 480fc664fc62..cafc532cf028 100644
--- a/xen/arch/arm/vpl011.c
+++ b/xen/arch/arm/vpl011.c
@@ -12,15 +12,20 @@
=20
 #include <xen/errno.h>
 #include <xen/event.h>
+#include <xen/device_tree.h>
 #include <xen/guest_access.h>
 #include <xen/init.h>
 #include <xen/lib.h>
+#include <xen/libfdt/libfdt.h>
 #include <xen/mm.h>
 #include <xen/sched.h>
 #include <xen/console.h>
 #include <xen/serial.h>
+#include <xen/vuart.h>
 #include <public/domctl.h>
 #include <public/io/console.h>
+#include <asm/domain_build.h>
+#include <asm/kernel.h>
 #include <asm/pl011-uart.h>
 #include <asm/vgic-emul.h>
 #include <asm/vpl011.h>
@@ -784,6 +789,53 @@ void domain_vpl011_deinit(struct domain *d)
         XFREE(vpl011->backend.xen);
 }
=20
+int __init vuart_add_fwnode(struct domain *d, void *node)
+{
+    struct kernel_info *kinfo =3D node;
+    void *fdt =3D kinfo->fdt;
+    int res;
+    gic_interrupt_t intr;
+    __be32 reg[GUEST_ROOT_ADDRESS_CELLS + GUEST_ROOT_SIZE_CELLS];
+    __be32 *cells;
+
+    res =3D domain_fdt_begin_node(fdt, "sbsa-uart", d->arch.vpl011.base_ad=
dr);
+    if ( res )
+        return res;
+
+    res =3D fdt_property_string(fdt, "compatible", "arm,sbsa-uart");
+    if ( res )
+        return res;
+
+    cells =3D &reg[0];
+    dt_child_set_range(&cells, GUEST_ROOT_ADDRESS_CELLS,
+                       GUEST_ROOT_SIZE_CELLS, d->arch.vpl011.base_addr,
+                       GUEST_PL011_SIZE);
+
+    res =3D fdt_property(fdt, "reg", reg, sizeof(reg));
+    if ( res )
+        return res;
+
+    set_interrupt(intr, d->arch.vpl011.virq, 0xf, DT_IRQ_TYPE_LEVEL_HIGH);
+
+    res =3D fdt_property(fdt, "interrupts", intr, sizeof (intr));
+    if ( res )
+        return res;
+
+    res =3D fdt_property_cell(fdt, "interrupt-parent",
+                            kinfo->phandle_intc);
+    if ( res )
+        return res;
+
+    /* Use a default baud rate of 115200. */
+    fdt_property_u32(fdt, "current-speed", 115200);
+
+    res =3D fdt_end_node(fdt);
+    if ( res )
+        return res;
+
+    return 0;
+}
+
 /*
  * Local variables:
  * mode: C
diff --git a/xen/include/xen/vuart.h b/xen/include/xen/vuart.h
new file mode 100644
index 000000000000..bb883823ea31
--- /dev/null
+++ b/xen/include/xen/vuart.h
@@ -0,0 +1,23 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+#ifndef XEN_VUART_H
+#define XEN_VUART_H
+
+#ifdef CONFIG_HAS_VUART_PL011
+int __init vuart_add_fwnode(struct domain *d, void *node);
+#else
+static inline int __init vuart_add_fwnode(struct domain *d, void *node)
+{
+    return 0;
+}
+#endif
+
+#endif /* XEN_VUART_H */
+
+/*
+ * Local variables:
+ * mode: C
+ * c-file-style: "BSD"
+ * c-basic-offset: 4
+ * indent-tabs-mode: nil
+ * End:
+ */
--=20
2.34.1



