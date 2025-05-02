Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BBFD0AA7727
	for <lists+xen-devel@lfdr.de>; Fri,  2 May 2025 18:23:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.974786.1362569 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uAtA0-0006JL-98; Fri, 02 May 2025 16:22:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 974786.1362569; Fri, 02 May 2025 16:22:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uAtA0-0006Cs-40; Fri, 02 May 2025 16:22:48 +0000
Received: by outflank-mailman (input) for mailman id 974786;
 Fri, 02 May 2025 16:22:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=EvHp=XS=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1uAt9y-0005rZ-ET
 for xen-devel@lists.xenproject.org; Fri, 02 May 2025 16:22:46 +0000
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [2a00:1450:4864:20::635])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id adf38485-2771-11f0-9eb4-5ba50f476ded;
 Fri, 02 May 2025 18:22:45 +0200 (CEST)
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-acb5ec407b1so350766266b.1
 for <xen-devel@lists.xenproject.org>; Fri, 02 May 2025 09:22:45 -0700 (PDT)
Received: from fedora.. (user-109-243-69-225.play-internet.pl.
 [109.243.69.225]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ad1894c01f2sm68158766b.119.2025.05.02.09.22.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 May 2025 09:22:43 -0700 (PDT)
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
X-Inumbo-ID: adf38485-2771-11f0-9eb4-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746202964; x=1746807764; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EFAs5QpEMZiGVQnaEa+bU01BSHSsYQBC71P0gj1yZJI=;
        b=IVqd0Cb5NtPyuEXPh+Sv4UQZCA+naZDqWajGaAeDxfplL2fNIAIWf+aeuv5wSIi9bK
         wXRBQ6zuqnXJYt6TD41mijoNcrw6kJWPeNgyMSBafeXkqbP7y1mc2WKit9kCiTlYOrIm
         2fpuER+Eu7Ynl8XE6m4SRZrRsIVWi/oNwbiZ3iRXgv+Lc81XTRX4O4GL7apai1vV4Js3
         WbIWq7UFR/SXnxg7My9TuDM4LFBzWiTf6MKv84L5dG3ezcS1c2r+J7vVfdE6PACjETdg
         e35uVeQqz04nyiBk1xVYdDL4LB98JdYTcx2Vr6Q3zL9IwwNwEq6ymeyuiooQZdzbQa9v
         sTpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746202964; x=1746807764;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EFAs5QpEMZiGVQnaEa+bU01BSHSsYQBC71P0gj1yZJI=;
        b=PxqxpJeQf0X1eAFvG98aJuSWCWEYPXtNZRL3zkCUHWI3A3vxtzx9tSaG1qbMRZRpJc
         wYXs2iUxfPbAnYeZhOO7suJH2gwKHM5MofWKSjALramI2McNN1nOESDjlIIWiLnikB2w
         Hp+69kP8+HG071JPQxHy6IXE5Z89Ojp11pjeuL6+FFiKq4A444ooYQOo23fkaZIMSv7g
         5qLiEXfnpIvcN3dtDsYisVok4WuU6QoAN2D8WiacDLWquY/Md9TGElFOw4tRLqteKlF5
         mwbm4oai5NoAxn8BWuAVNKMSzOneMRFVxL6h9dxYsxVxUXCpiBh/gRm4LGtCz2bUYxAl
         hflA==
X-Gm-Message-State: AOJu0Yy6TLcUD+kcn8ihxT10YHsADUU/ivL0WOoddFOHu6k4evl1ZVEF
	HfP/pTiv4sj7b6NkBvGey18YeMz10CchNuVUehjmSUhIaX0yJXI8pCzNXg==
X-Gm-Gg: ASbGncvK+LaaH8LWuUCySPtYr1TZorLfz1BcmIRY4qh/7FhMzpHf1qpCoxaRg5fhnkw
	GKKXMy9eakRqy8AowrZXQcZYyTRJo1wGYZ8BUlDZwDMGjy5PDG0q2Vt/EtOnqyLSKf5QW02Cl0K
	+DuQ/c8HBQgorhXfBAXb4EsH7XhXJZ9p527EwFnskoCLhmaGJcyqqoJ/EilRZCqVWnwQoVVWmgF
	Uwo7/bn/do9YFtf0BDJ5jgiR7LSTOJhCrnb3uBsZNa/cesQGWoy0mrgJNvfQ5ev/0bkiAADxSJB
	APkHMxK2XoDx1lLLE7T6PNuo6Me1tcy/QUyRUe0OHnhqyWTgMZrzXzV+cElegybikrJiq/bQkzw
	J3RmnK6gHRg==
X-Google-Smtp-Source: AGHT+IG41K40YYS4kZTEzP/j/FNULhrVewtRhe65Dr55/B8N+pjqrBt0RnFpsySUUXw8H+l8zwZLPw==
X-Received: by 2002:a17:907:94d0:b0:ac7:95ae:747f with SMTP id a640c23a62f3a-ad17af8f52cmr311730866b.45.1746202964218;
        Fri, 02 May 2025 09:22:44 -0700 (PDT)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Jan Beulich <jbeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v3 3/8] asm-generic: move parts of Arm's asm/kernel.h to common code
Date: Fri,  2 May 2025 18:22:33 +0200
Message-ID: <0c16f8fb2702db5fd6751c7da347a97caa431002.1746199009.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <cover.1746199009.git.oleksii.kurochko@gmail.com>
References: <cover.1746199009.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Move the following parts to common with the following changes:
- struct kernel_info:
  - Create arch_kernel_info for arch specific kernel information.
    At the moment, it contains domain_type for Arm.
  - Rename vpl011 to vuart to have more generic name suitable for other archs.
  - s/phandle_gic/phandle_intc to have more generic name suitable for other
    archs.
  - Make text_offset of zimage structure available for RISCV_64.
- Wrap by `#ifdef KERNEL_INFO_SHM_MEM_INIT` definition of KERNEL_SHM_MEM_INIT
  and wrap by `#ifndef KERNEL_INFO_INIT` definition of KERNEL_INFO_INIT to have
  ability to override KERNEL_INFO_SHM_MEM_INIT for arch in case it doesn't
  want to use generic one.
- Move DOM0LESS_* macros to dom0less-build.h.
- Move all others parts of Arm's kernel.h to xen/fdt-kernel.h.

Because of the changes in struct kernel_info the correspondent parts of Arm's
code are updated.

As part of this patch the following clean up happens:
- Drop asm/setup.h from asm/kernel.h as nothing depends from it.
  Add inclusion of asm/setup.h for a code which uses device_tree_get_reg() to
  avoid compilation issues for CONFIG_STATIC_MEMORY and CONFIG_STATIC_SHM.
- Drop inclusion of asm/kernel.h everywhere except xen/fdt-kernel.h.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Changes in v3:
 - Only resolving of merge conflicts.
---
Changes in v2:
 - Introduce xen/fdt-kernel.h.
 - Move DOM0LESS_* macros to dom0less-build.h.
 - Move the rest in asm-generic/kernel.h to xen/fdt-kernel.h.
 - Drop inclusion of asm/kernel.h everywhere except xen/fdt-kernel.h.
 - Wrap by #if __has_include(....) the member of kernel_info structure:
     struct arch_kernel_info arch.
 - Update the commit message.
---
 xen/arch/arm/acpi/domain_build.c         |   2 +-
 xen/arch/arm/dom0less-build.c            |  31 +++---
 xen/arch/arm/domain_build.c              |  12 +-
 xen/arch/arm/include/asm/domain_build.h  |   2 +-
 xen/arch/arm/include/asm/kernel.h        | 126 +--------------------
 xen/arch/arm/include/asm/static-memory.h |   2 +-
 xen/arch/arm/include/asm/static-shmem.h  |   2 +-
 xen/arch/arm/kernel.c                    |  12 +-
 xen/arch/arm/static-memory.c             |   1 +
 xen/arch/arm/static-shmem.c              |   1 +
 xen/common/device-tree/dt-overlay.c      |   2 +-
 xen/include/asm-generic/dom0less-build.h |  28 +++++
 xen/include/xen/fdt-kernel.h             | 133 +++++++++++++++++++++++
 13 files changed, 199 insertions(+), 155 deletions(-)
 create mode 100644 xen/include/xen/fdt-kernel.h

diff --git a/xen/arch/arm/acpi/domain_build.c b/xen/arch/arm/acpi/domain_build.c
index 2ce75543d0..f9ca8b47e5 100644
--- a/xen/arch/arm/acpi/domain_build.c
+++ b/xen/arch/arm/acpi/domain_build.c
@@ -10,6 +10,7 @@
  */
 
 #include <xen/compile.h>
+#include <xen/fdt-kernel.h>
 #include <xen/mm.h>
 #include <xen/sched.h>
 #include <xen/acpi.h>
@@ -18,7 +19,6 @@
 #include <xen/device_tree.h>
 #include <xen/libfdt/libfdt.h>
 #include <acpi/actables.h>
-#include <asm/kernel.h>
 #include <asm/domain_build.h>
 
 /* Override macros from asm/page.h to make them work with mfn_t */
diff --git a/xen/arch/arm/dom0less-build.c b/xen/arch/arm/dom0less-build.c
index ef49495d4f..c0634dd61e 100644
--- a/xen/arch/arm/dom0less-build.c
+++ b/xen/arch/arm/dom0less-build.c
@@ -1,6 +1,7 @@
 /* SPDX-License-Identifier: GPL-2.0-only */
 #include <xen/device_tree.h>
 #include <xen/domain_page.h>
+#include <xen/fdt-kernel.h>
 #include <xen/err.h>
 #include <xen/event.h>
 #include <xen/grant_table.h>
@@ -64,11 +65,11 @@ static int __init make_gicv2_domU_node(struct kernel_info *kinfo)
     if (res)
         return res;
 
-    res = fdt_property_cell(fdt, "linux,phandle", kinfo->phandle_gic);
+    res = fdt_property_cell(fdt, "linux,phandle", kinfo->phandle_intc);
     if (res)
         return res;
 
-    res = fdt_property_cell(fdt, "phandle", kinfo->phandle_gic);
+    res = fdt_property_cell(fdt, "phandle", kinfo->phandle_intc);
     if (res)
         return res;
 
@@ -135,11 +136,11 @@ static int __init make_gicv3_domU_node(struct kernel_info *kinfo)
     if (res)
         return res;
 
-    res = fdt_property_cell(fdt, "linux,phandle", kinfo->phandle_gic);
+    res = fdt_property_cell(fdt, "linux,phandle", kinfo->phandle_intc);
     if (res)
         return res;
 
-    res = fdt_property_cell(fdt, "phandle", kinfo->phandle_gic);
+    res = fdt_property_cell(fdt, "phandle", kinfo->phandle_intc);
     if (res)
         return res;
 
@@ -200,7 +201,7 @@ static int __init make_vpl011_uart_node(struct kernel_info *kinfo)
         return res;
 
     res = fdt_property_cell(fdt, "interrupt-parent",
-                            kinfo->phandle_gic);
+                            kinfo->phandle_intc);
     if ( res )
         return res;
 
@@ -486,10 +487,10 @@ static int __init domain_handle_dtb_bootmodule(struct domain *d,
          */
         if ( dt_node_cmp(name, "gic") == 0 )
         {
-            uint32_t phandle_gic = fdt_get_phandle(pfdt, node_next);
+            uint32_t phandle_intc = fdt_get_phandle(pfdt, node_next);
 
-            if ( phandle_gic != 0 )
-                kinfo->phandle_gic = phandle_gic;
+            if ( phandle_intc != 0 )
+                kinfo->phandle_intc = phandle_intc;
             continue;
         }
 
@@ -532,7 +533,7 @@ static int __init prepare_dtb_domU(struct domain *d, struct kernel_info *kinfo)
     int addrcells, sizecells;
     int ret, fdt_size = DOMU_DTB_SIZE;
 
-    kinfo->phandle_gic = GUEST_PHANDLE_GIC;
+    kinfo->phandle_intc = GUEST_PHANDLE_GIC;
     kinfo->gnttab_start = GUEST_GNTTAB_BASE;
     kinfo->gnttab_size = GUEST_GNTTAB_SIZE;
 
@@ -594,7 +595,7 @@ static int __init prepare_dtb_domU(struct domain *d, struct kernel_info *kinfo)
     /*
      * domain_handle_dtb_bootmodule has to be called before the rest of
      * the device tree is generated because it depends on the value of
-     * the field phandle_gic.
+     * the field phandle_intc.
      */
     if ( kinfo->dtb_bootmodule )
     {
@@ -611,7 +612,7 @@ static int __init prepare_dtb_domU(struct domain *d, struct kernel_info *kinfo)
     if ( ret )
         goto err;
 
-    if ( kinfo->vpl011 )
+    if ( kinfo->vuart )
     {
         ret = -EINVAL;
 #ifdef CONFIG_SBSA_VUART_CONSOLE
@@ -839,8 +840,8 @@ int __init construct_domU(struct domain *d,
     printk("*** LOADING DOMU cpus=%u memory=%#"PRIx64"KB ***\n",
            d->max_vcpus, mem);
 
-    kinfo.vpl011 = dt_property_read_bool(node, "vpl011");
-    if ( kinfo.vpl011 && is_hardware_domain(d) )
+    kinfo.vuart = dt_property_read_bool(node, "vpl011");
+    if ( kinfo.vuart && is_hardware_domain(d) )
         panic("hardware domain cannot specify vpl011\n");
 
     rc = dt_property_read_string(node, "xen,enhanced", &dom0less_enhanced);
@@ -872,7 +873,7 @@ int __init construct_domU(struct domain *d,
 
 #ifdef CONFIG_ARM_64
     /* type must be set before allocate memory */
-    d->arch.type = kinfo.type;
+    d->arch.type = kinfo.arch.type;
 #endif
     if ( is_hardware_domain(d) )
     {
@@ -898,7 +899,7 @@ int __init construct_domU(struct domain *d,
          * tree node in prepare_dtb_domU, so initialization on related variables
          * shall be done first.
          */
-        if ( kinfo.vpl011 )
+        if ( kinfo.vuart )
         {
             rc = domain_vpl011_init(d, NULL);
             if ( rc < 0 )
diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
index 270a6b97e4..8c7a054718 100644
--- a/xen/arch/arm/domain_build.c
+++ b/xen/arch/arm/domain_build.c
@@ -1,6 +1,7 @@
 /* SPDX-License-Identifier: GPL-2.0-only */
 #include <xen/init.h>
 #include <xen/compile.h>
+#include <xen/fdt-kernel.h>
 #include <xen/lib.h>
 #include <xen/llc-coloring.h>
 #include <xen/mm.h>
@@ -20,7 +21,6 @@
 #include <xen/vmap.h>
 #include <xen/warning.h>
 #include <asm/device.h>
-#include <asm/kernel.h>
 #include <asm/setup.h>
 #include <asm/tee/tee.h>
 #include <asm/pci.h>
@@ -747,7 +747,7 @@ static int __init fdt_property_interrupts(const struct kernel_info *kinfo,
         return res;
 
     res = fdt_property_cell(kinfo->fdt, "interrupt-parent",
-                            kinfo->phandle_gic);
+                            kinfo->phandle_intc);
 
     return res;
 }
@@ -2026,7 +2026,7 @@ static int __init prepare_dtb_hwdom(struct domain *d, struct kernel_info *kinfo)
 
     ASSERT(dt_host && (dt_host->sibling == NULL));
 
-    kinfo->phandle_gic = dt_interrupt_controller->phandle;
+    kinfo->phandle_intc = dt_interrupt_controller->phandle;
     fdt = device_tree_flattened;
 
     new_size = fdt_totalsize(fdt) + DOM0_FDT_EXTRA_SIZE;
@@ -2196,13 +2196,13 @@ int __init construct_domain(struct domain *d, struct kernel_info *kinfo)
 
 #ifdef CONFIG_ARM_64
     /* if aarch32 mode is not supported at EL1 do not allow 32-bit domain */
-    if ( !(cpu_has_el1_32) && kinfo->type == DOMAIN_32BIT )
+    if ( !(cpu_has_el1_32) && kinfo->arch.type == DOMAIN_32BIT )
     {
         printk("Platform does not support 32-bit domain\n");
         return -EINVAL;
     }
 
-    if ( is_sve_domain(d) && (kinfo->type == DOMAIN_32BIT) )
+    if ( is_sve_domain(d) && (kinfo->arch.type == DOMAIN_32BIT) )
     {
         printk("SVE is not available for 32-bit domain\n");
         return -EINVAL;
@@ -2318,7 +2318,7 @@ int __init construct_hwdom(struct kernel_info *kinfo,
 
 #ifdef CONFIG_ARM_64
     /* type must be set before allocate_memory */
-    d->arch.type = kinfo->type;
+    d->arch.type = kinfo->arch.type;
 #endif
     find_gnttab_region(d, kinfo);
     if ( is_domain_direct_mapped(d) )
diff --git a/xen/arch/arm/include/asm/domain_build.h b/xen/arch/arm/include/asm/domain_build.h
index 378c10cc98..df1c0fe301 100644
--- a/xen/arch/arm/include/asm/domain_build.h
+++ b/xen/arch/arm/include/asm/domain_build.h
@@ -1,8 +1,8 @@
 #ifndef __ASM_DOMAIN_BUILD_H__
 #define __ASM_DOMAIN_BUILD_H__
 
+#include <xen/fdt-kernel.h>
 #include <xen/sched.h>
-#include <asm/kernel.h>
 
 typedef __be32 gic_interrupt_t[3];
 typedef bool (*alloc_domheap_mem_cb)(struct domain *d, struct page_info *pg,
diff --git a/xen/arch/arm/include/asm/kernel.h b/xen/arch/arm/include/asm/kernel.h
index bdc96f4c18..cfeab792c7 100644
--- a/xen/arch/arm/include/asm/kernel.h
+++ b/xen/arch/arm/include/asm/kernel.h
@@ -6,137 +6,15 @@
 #ifndef __ARCH_ARM_KERNEL_H__
 #define __ARCH_ARM_KERNEL_H__
 
-#include <xen/device_tree.h>
 #include <asm/domain.h>
-#include <asm/setup.h>
 
-/*
- * List of possible features for dom0less domUs
- *
- * DOM0LESS_ENHANCED_NO_XS:  Notify the OS it is running on top of Xen. All the
- *                           default features (excluding Xenstore) will be
- *                           available. Note that an OS *must* not rely on the
- *                           availability of Xen features if this is not set.
- * DOM0LESS_XENSTORE:        Xenstore will be enabled for the VM. The
- *                           xenstore page allocation is done by Xen at
- *                           domain creation. This feature can't be
- *                           enabled without the DOM0LESS_ENHANCED_NO_XS.
- * DOM0LESS_XS_LEGACY        Xenstore will be enabled for the VM, the
- *                           xenstore page allocation will happen in
- *                           init-dom0less. This feature can't be enabled
- *                           without the DOM0LESS_ENHANCED_NO_XS.
- * DOM0LESS_ENHANCED:        Notify the OS it is running on top of Xen. All the
- *                           default features (including Xenstore) will be
- *                           available. Note that an OS *must* not rely on the
- *                           availability of Xen features if this is not set.
- * DOM0LESS_ENHANCED_LEGACY: Same as before, but using DOM0LESS_XS_LEGACY.
- */
-#define DOM0LESS_ENHANCED_NO_XS  BIT(0, U)
-#define DOM0LESS_XENSTORE        BIT(1, U)
-#define DOM0LESS_XS_LEGACY       BIT(2, U)
-#define DOM0LESS_ENHANCED_LEGACY (DOM0LESS_ENHANCED_NO_XS | DOM0LESS_XS_LEGACY)
-#define DOM0LESS_ENHANCED        (DOM0LESS_ENHANCED_NO_XS | DOM0LESS_XENSTORE)
-
-struct kernel_info {
+struct arch_kernel_info
+{
 #ifdef CONFIG_ARM_64
     enum domain_type type;
 #endif
-
-    struct domain *d;
-
-    void *fdt; /* flat device tree */
-    paddr_t unassigned_mem; /* RAM not (yet) assigned to a bank */
-    struct meminfo mem;
-#ifdef CONFIG_STATIC_SHM
-    struct shared_meminfo shm_mem;
-#endif
-
-    /* kernel entry point */
-    paddr_t entry;
-
-    /* grant table region */
-    paddr_t gnttab_start;
-    paddr_t gnttab_size;
-
-    /* boot blob load addresses */
-    const struct bootmodule *kernel_bootmodule, *initrd_bootmodule, *dtb_bootmodule;
-    const char* cmdline;
-    paddr_t dtb_paddr;
-    paddr_t initrd_paddr;
-
-    /* Enable pl011 emulation */
-    bool vpl011;
-
-    /* Enable/Disable PV drivers interfaces */
-    uint16_t dom0less_feature;
-
-    /* GIC phandle */
-    uint32_t phandle_gic;
-
-    /* loader to use for this kernel */
-    void (*load)(struct kernel_info *info);
-    /* loader specific state */
-    union {
-        struct {
-            paddr_t kernel_addr;
-            paddr_t len;
-#ifdef CONFIG_ARM_64
-            paddr_t text_offset; /* 64-bit Image only */
-#endif
-            paddr_t start; /* Must be 0 for 64-bit Image */
-        } zimage;
-    };
 };
 
-static inline struct membanks *kernel_info_get_mem(struct kernel_info *kinfo)
-{
-    return container_of(&kinfo->mem.common, struct membanks, common);
-}
-
-static inline const struct membanks *
-kernel_info_get_mem_const(const struct kernel_info *kinfo)
-{
-    return container_of(&kinfo->mem.common, const struct membanks, common);
-}
-
-#ifdef CONFIG_STATIC_SHM
-#define KERNEL_INFO_SHM_MEM_INIT                \
-    .shm_mem.common.max_banks = NR_SHMEM_BANKS, \
-    .shm_mem.common.type = STATIC_SHARED_MEMORY,
-#else
-#define KERNEL_INFO_SHM_MEM_INIT
-#endif
-
-#define KERNEL_INFO_INIT                        \
-{                                               \
-    .mem.common.max_banks = NR_MEM_BANKS,       \
-    .mem.common.type = MEMORY,                  \
-    KERNEL_INFO_SHM_MEM_INIT                    \
-}
-
-/*
- * Probe the kernel to detemine its type and select a loader.
- *
- * Sets in info:
- *  ->type
- *  ->load hook, and sets loader specific variables ->zimage
- */
-int kernel_probe(struct kernel_info *info, const struct dt_device_node *domain);
-
-/*
- * Loads the kernel into guest RAM.
- *
- * Expects to be set in info when called:
- *  ->mem
- *  ->fdt
- *
- * Sets in info:
- *  ->entry
- *  ->dtb_paddr
- *  ->initrd_paddr
- */
-void kernel_load(struct kernel_info *info);
-
 #endif /* #ifdef __ARCH_ARM_KERNEL_H__ */
 
 /*
diff --git a/xen/arch/arm/include/asm/static-memory.h b/xen/arch/arm/include/asm/static-memory.h
index 804166e541..a32a3c6553 100644
--- a/xen/arch/arm/include/asm/static-memory.h
+++ b/xen/arch/arm/include/asm/static-memory.h
@@ -3,8 +3,8 @@
 #ifndef __ASM_STATIC_MEMORY_H_
 #define __ASM_STATIC_MEMORY_H_
 
+#include <xen/fdt-kernel.h>
 #include <xen/pfn.h>
-#include <asm/kernel.h>
 
 #ifdef CONFIG_STATIC_MEMORY
 
diff --git a/xen/arch/arm/include/asm/static-shmem.h b/xen/arch/arm/include/asm/static-shmem.h
index 94eaa9d500..a4f853805a 100644
--- a/xen/arch/arm/include/asm/static-shmem.h
+++ b/xen/arch/arm/include/asm/static-shmem.h
@@ -3,8 +3,8 @@
 #ifndef __ASM_STATIC_SHMEM_H_
 #define __ASM_STATIC_SHMEM_H_
 
+#include <xen/fdt-kernel.h>
 #include <xen/types.h>
-#include <asm/kernel.h>
 #include <asm/setup.h>
 
 #ifdef CONFIG_STATIC_SHM
diff --git a/xen/arch/arm/kernel.c b/xen/arch/arm/kernel.c
index 2647812e8e..f00fc388db 100644
--- a/xen/arch/arm/kernel.c
+++ b/xen/arch/arm/kernel.c
@@ -7,6 +7,7 @@
 #include <xen/byteorder.h>
 #include <xen/domain_page.h>
 #include <xen/errno.h>
+#include <xen/fdt-kernel.h>
 #include <xen/guest_access.h>
 #include <xen/gunzip.h>
 #include <xen/init.h>
@@ -16,6 +17,7 @@
 #include <xen/sched.h>
 #include <xen/vmap.h>
 
+#include <asm/domain_build.h>
 #include <asm/kernel.h>
 #include <asm/setup.h>
 
@@ -101,7 +103,7 @@ static paddr_t __init kernel_zimage_place(struct kernel_info *info)
     paddr_t load_addr;
 
 #ifdef CONFIG_ARM_64
-    if ( (info->type == DOMAIN_64BIT) && (info->zimage.start == 0) )
+    if ( (info->arch.type == DOMAIN_64BIT) && (info->zimage.start == 0) )
         return mem->bank[0].start + info->zimage.text_offset;
 #endif
 
@@ -371,10 +373,10 @@ static int __init kernel_uimage_probe(struct kernel_info *info,
     switch ( uimage.arch )
     {
     case IH_ARCH_ARM:
-        info->type = DOMAIN_32BIT;
+        info->arch.type = DOMAIN_32BIT;
         break;
     case IH_ARCH_ARM64:
-        info->type = DOMAIN_64BIT;
+        info->arch.type = DOMAIN_64BIT;
         break;
     default:
         printk(XENLOG_ERR "Unsupported uImage arch type %d\n", uimage.arch);
@@ -444,7 +446,7 @@ static int __init kernel_zimage64_probe(struct kernel_info *info,
 
     info->load = kernel_zimage_load;
 
-    info->type = DOMAIN_64BIT;
+    info->arch.type = DOMAIN_64BIT;
 
     return 0;
 }
@@ -496,7 +498,7 @@ static int __init kernel_zimage32_probe(struct kernel_info *info,
     info->load = kernel_zimage_load;
 
 #ifdef CONFIG_ARM_64
-    info->type = DOMAIN_32BIT;
+    info->arch.type = DOMAIN_32BIT;
 #endif
 
     return 0;
diff --git a/xen/arch/arm/static-memory.c b/xen/arch/arm/static-memory.c
index d4585c5a06..e0f76afcd8 100644
--- a/xen/arch/arm/static-memory.c
+++ b/xen/arch/arm/static-memory.c
@@ -2,6 +2,7 @@
 
 #include <xen/sched.h>
 
+#include <asm/setup.h>
 #include <asm/static-memory.h>
 
 static bool __init append_static_memory_to_bank(struct domain *d,
diff --git a/xen/arch/arm/static-shmem.c b/xen/arch/arm/static-shmem.c
index e8d4ca3ba3..14ae48fb1e 100644
--- a/xen/arch/arm/static-shmem.c
+++ b/xen/arch/arm/static-shmem.c
@@ -6,6 +6,7 @@
 #include <xen/sched.h>
 
 #include <asm/domain_build.h>
+#include <asm/setup.h>
 #include <asm/static-memory.h>
 #include <asm/static-shmem.h>
 
diff --git a/xen/common/device-tree/dt-overlay.c b/xen/common/device-tree/dt-overlay.c
index 97fb99eaaa..81107cb48d 100644
--- a/xen/common/device-tree/dt-overlay.c
+++ b/xen/common/device-tree/dt-overlay.c
@@ -6,8 +6,8 @@
  * Written by Vikram Garhwal <vikram.garhwal@amd.com>
  *
  */
-#include <asm/domain_build.h>
 #include <xen/dt-overlay.h>
+#include <xen/fdt-kernel.h>
 #include <xen/guest_access.h>
 #include <xen/iocap.h>
 #include <xen/libfdt/libfdt.h>
diff --git a/xen/include/asm-generic/dom0less-build.h b/xen/include/asm-generic/dom0less-build.h
index 5655571a66..f095135caa 100644
--- a/xen/include/asm-generic/dom0less-build.h
+++ b/xen/include/asm-generic/dom0less-build.h
@@ -16,6 +16,34 @@ struct dt_device_node;
 #define XENSTORE_PFN_LATE_ALLOC UINT64_MAX
 extern bool need_xenstore;
 
+/*
+ * List of possible features for dom0less domUs
+ *
+ * DOM0LESS_ENHANCED_NO_XS:  Notify the OS it is running on top of Xen. All the
+ *                           default features (excluding Xenstore) will be
+ *                           available. Note that an OS *must* not rely on the
+ *                           availability of Xen features if this is not set.
+ * DOM0LESS_XENSTORE:        Xenstore will be enabled for the VM. The
+ *                           xenstore page allocation is done by Xen at
+ *                           domain creation. This feature can't be
+ *                           enabled without the DOM0LESS_ENHANCED_NO_XS.
+ * DOM0LESS_XS_LEGACY        Xenstore will be enabled for the VM, the
+ *                           xenstore page allocation will happen in
+ *                           init-dom0less. This feature can't be enabled
+ *                           without the DOM0LESS_ENHANCED_NO_XS.
+ * DOM0LESS_ENHANCED:        Notify the OS it is running on top of Xen. All the
+ *                           default features (including Xenstore) will be
+ *                           available. Note that an OS *must* not rely on the
+ *                           availability of Xen features if this is not set.
+ * DOM0LESS_ENHANCED_LEGACY: Same as before, but using DOM0LESS_XS_LEGACY.
+
+ */
+#define DOM0LESS_ENHANCED_NO_XS  BIT(0, U)
+#define DOM0LESS_XENSTORE        BIT(1, U)
+#define DOM0LESS_XS_LEGACY       BIT(2, U)
+#define DOM0LESS_ENHANCED_LEGACY (DOM0LESS_ENHANCED_NO_XS | DOM0LESS_XS_LEGACY)
+#define DOM0LESS_ENHANCED        (DOM0LESS_ENHANCED_NO_XS | DOM0LESS_XENSTORE)
+
 void create_domUs(void);
 bool is_dom0less_mode(void);
 void set_xs_domain(struct domain *d);
diff --git a/xen/include/xen/fdt-kernel.h b/xen/include/xen/fdt-kernel.h
new file mode 100644
index 0000000000..c81e759423
--- /dev/null
+++ b/xen/include/xen/fdt-kernel.h
@@ -0,0 +1,133 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * For Kernel image loading.
+ *
+ * Copyright (C) 2011 Citrix Systems, Inc.
+ */
+#ifndef __XEN_FDT_KERNEL_H__
+#define __XEN_FDT_KERNEL_H__
+
+#include <xen/bootfdt.h>
+#include <xen/device_tree.h>
+#include <xen/types.h>
+
+#if __has_include(<asm/kernel.h>)
+#   include <asm/kernel.h>
+#endif
+
+struct kernel_info {
+    struct domain *d;
+
+    void *fdt; /* flat device tree */
+    paddr_t unassigned_mem; /* RAM not (yet) assigned to a bank */
+    struct meminfo mem;
+#ifdef CONFIG_STATIC_SHM
+    struct shared_meminfo shm_mem;
+#endif
+
+    /* kernel entry point */
+    paddr_t entry;
+
+    /* grant table region */
+    paddr_t gnttab_start;
+    paddr_t gnttab_size;
+
+    /* boot blob load addresses */
+    const struct bootmodule *kernel_bootmodule, *initrd_bootmodule, *dtb_bootmodule;
+    const char* cmdline;
+    paddr_t dtb_paddr;
+    paddr_t initrd_paddr;
+
+    /* Enable uart emulation */
+    bool vuart;
+
+    /* Enable/Disable PV drivers interfaces */
+    uint16_t dom0less_feature;
+
+    /* Interrupt controller phandle */
+    uint32_t phandle_intc;
+
+    /* loader to use for this kernel */
+    void (*load)(struct kernel_info *info);
+
+    /* loader specific state */
+    union {
+        struct {
+            paddr_t kernel_addr;
+            paddr_t len;
+#if defined(CONFIG_ARM_64) || defined(CONFIG_RISCV_64)
+            paddr_t text_offset; /* 64-bit Image only */
+#endif
+            paddr_t start; /* Must be 0 for 64-bit Image */
+        } zimage;
+    };
+
+#if __has_include(<asm/kernel.h>)
+    struct arch_kernel_info arch;
+#endif
+};
+
+static inline struct membanks *kernel_info_get_mem(struct kernel_info *kinfo)
+{
+    return container_of(&kinfo->mem.common, struct membanks, common);
+}
+
+static inline const struct membanks *
+kernel_info_get_mem_const(const struct kernel_info *kinfo)
+{
+    return container_of(&kinfo->mem.common, const struct membanks, common);
+}
+
+#ifndef KERNEL_INFO_SHM_MEM_INIT
+
+#ifdef CONFIG_STATIC_SHM
+#define KERNEL_INFO_SHM_MEM_INIT .shm_mem.common.max_banks = NR_SHMEM_BANKS,
+#else
+#define KERNEL_INFO_SHM_MEM_INIT
+#endif
+
+#endif /* KERNEL_INFO_SHM_MEM_INIT */
+
+#ifndef KERNEL_INFO_INIT
+
+#define KERNEL_INFO_INIT                        \
+{                                               \
+    .mem.common.max_banks = NR_MEM_BANKS,       \
+    KERNEL_INFO_SHM_MEM_INIT                    \
+}
+
+#endif /* KERNEL_INFO_INIT */
+
+/*
+ * Probe the kernel to detemine its type and select a loader.
+ *
+ * Sets in info:
+ *  ->type
+ *  ->load hook, and sets loader specific variables ->zimage
+ */
+int kernel_probe(struct kernel_info *info, const struct dt_device_node *domain);
+
+/*
+ * Loads the kernel into guest RAM.
+ *
+ * Expects to be set in info when called:
+ *  ->mem
+ *  ->fdt
+ *
+ * Sets in info:
+ *  ->entry
+ *  ->dtb_paddr
+ *  ->initrd_paddr
+ */
+void kernel_load(struct kernel_info *info);
+
+#endif /* __XEN_FDT_KERNEL_H__ */
+
+/*
+ * Local variables:
+ * mode: C
+ * c-file-style: "BSD"
+ * c-basic-offset: 4
+ * indent-tabs-mode: nil
+ * End:
+ */
-- 
2.49.0


