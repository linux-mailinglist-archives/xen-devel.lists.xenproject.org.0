Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 02661A05965
	for <lists+xen-devel@lfdr.de>; Wed,  8 Jan 2025 12:14:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.867134.1278573 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tVTzz-0001TF-At; Wed, 08 Jan 2025 11:13:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 867134.1278573; Wed, 08 Jan 2025 11:13:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tVTzz-0001Mv-46; Wed, 08 Jan 2025 11:13:19 +0000
Received: by outflank-mailman (input) for mailman id 867134;
 Wed, 08 Jan 2025 11:13:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WoWX=UA=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1tVTzx-0001BZ-SM
 for xen-devel@lists.xenproject.org; Wed, 08 Jan 2025 11:13:17 +0000
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com
 [2a00:1450:4864:20::22a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8ee60536-cdb1-11ef-a0df-8be0dac302b0;
 Wed, 08 Jan 2025 12:13:16 +0100 (CET)
Received: by mail-lj1-x22a.google.com with SMTP id
 38308e7fff4ca-304d760f0dfso50250541fa.2
 for <xen-devel@lists.xenproject.org>; Wed, 08 Jan 2025 03:13:16 -0800 (PST)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-3045ad99d11sm67292171fa.33.2025.01.08.03.13.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Jan 2025 03:13:14 -0800 (PST)
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
X-Inumbo-ID: 8ee60536-cdb1-11ef-a0df-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736334796; x=1736939596; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GR2a/0jnuvbrYQt6CCllwzwGe4JakRFRLxGKEovkNEQ=;
        b=a9OS8uP9V30NUmR7MKpmh3whzHv36zAtbxa5q/6yCD2Ow+3XrfHvchNBkjHRjobKI9
         f8GJmwGs9cvZurgFFnDggsprXpW/9mdONBGLI8NZCHdBpmyNZBuS5EUvP/EjdyQZaI00
         sFMKyezmcdkZtxqsWI+to3N43EJTPB95MqnHuYFpPimtK2sY4zxmDWWrNUsZItJcudNY
         BeKFSYZegI/yrcKG+7LKqslejlzdqjSCG9SPX3uftvFB0fifCBKgUZHN85lAIxt9gtyJ
         gHjKYBxVx/OOvX8GS5QjzhRDE3GygVw4KdKZeD1083mO8Yk1h8h5BFhWNzE5LJs81foG
         hmmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736334796; x=1736939596;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GR2a/0jnuvbrYQt6CCllwzwGe4JakRFRLxGKEovkNEQ=;
        b=Uv00/BseS/srHlaVLT5v72Uut+MLmFWBteFks0Agn9k823OEILjsRM78OuNZOLiwoj
         6m+HGiBeSHHLYanwb1PD7yhjoKgieE2PzYvj2hU5Ihri42LGtwtDqEkxYECtOX+by3OE
         UOx7SNv/m1U4RZguPQx5kAUDAFc9xfHb/6R7vX3GU3pG2ypvxXg7+WEfDkOU+CL5PgUi
         UDR3dsH1JxMicRg5EqsrwfkWohM+01nebA3+SC4sO1vkSv7yAkUyRhNncpNC1O1z+2XU
         i9AGE1Ipj5XCnpAz39yLtaTLE8Okp+8UJ41sK1fTYnHbrzwg6sh+8hf4dV/ypYvh9Wiw
         tNlw==
X-Gm-Message-State: AOJu0Yxx+nTTKTPLmPQ9Q4z1aWf+JEHAZied5jkq1YmhW6fiA65LPXa0
	fu8N+sV4odw0F31iZR85vCNLRqxrz2gZ7vlDtgssJb34oqX3eTnqxwx0jh/x
X-Gm-Gg: ASbGncsvxliWtIMOPCMtQUKFhCt/ZcEaEQw8+/eMM2v7TV7vy5qdQc0ilxoUAZg8OWq
	b0Nl+f6+BEOCiGOyK6kg3QscNWG7bTe38vYdDRnH9oqfHhxpdQHJEMXxOeSFdLomGwM1onW4Rej
	SDCkHOFlOsYAFwMgyrOM/Nx8Dk73ccIDYZ1MRf4ChQIqKRxzNrWSIAIAyMcRq8l2yaKytUCC/Sb
	rEQ4GhWUaiq/Ox5UHoX2rtBsXiR5Vr9WeR3FxNOfjsd/L6zcVJSQB2WJQ==
X-Google-Smtp-Source: AGHT+IFsh3iV6x24r1z6bgjQYA4fIvXoEcEueWsf8uvmzjQHvcik8vtonyJEo3Zs4ajaJbZhPgKwEA==
X-Received: by 2002:a2e:b887:0:b0:302:1c90:58d9 with SMTP id 38308e7fff4ca-305f458a829mr6956111fa.16.1736334795263;
        Wed, 08 Jan 2025 03:13:15 -0800 (PST)
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
Subject: [PATCH v1 2/9] asm-generic: move parts of Arm's asm/kernel.h to asm-generic
Date: Wed,  8 Jan 2025 12:13:04 +0100
Message-ID: <6404cb5ae077909cbfdf3860d38c701c65547b56.1736334615.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <cover.1736334615.git.oleksii.kurochko@gmail.com>
References: <cover.1736334615.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Move the following parts to asm-generic with the following changes:
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
- All other parts are left as is from Arm's asm/kernel.h

Because of the changes in struct kernel_info the correspondent parts of Arm's
code are updated.

As part of this patch the following clean up happens:
- Drop asm/setup.h from asm/kernel.h as nothing depends from it.
  Add inclusion of asm/setup.h for a code which uses device_tree_get_reg() to
  avoid compilation issues for CONFIG_STATIC_MEMORY and CONFIG_STATIC_SHM.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
 xen/arch/arm/dom0less-build.c     |  28 +++---
 xen/arch/arm/domain_build.c       |  10 +-
 xen/arch/arm/include/asm/kernel.h | 115 +----------------------
 xen/arch/arm/kernel.c             |  10 +-
 xen/arch/arm/static-memory.c      |   1 +
 xen/arch/arm/static-shmem.c       |   1 +
 xen/include/asm-generic/kernel.h  | 146 ++++++++++++++++++++++++++++++
 7 files changed, 175 insertions(+), 136 deletions(-)
 create mode 100644 xen/include/asm-generic/kernel.h

diff --git a/xen/arch/arm/dom0less-build.c b/xen/arch/arm/dom0less-build.c
index b27747c05c..c4badb4ade 100644
--- a/xen/arch/arm/dom0less-build.c
+++ b/xen/arch/arm/dom0less-build.c
@@ -57,11 +57,11 @@ static int __init make_gicv2_domU_node(struct kernel_info *kinfo)
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
 
@@ -128,11 +128,11 @@ static int __init make_gicv3_domU_node(struct kernel_info *kinfo)
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
 
@@ -193,7 +193,7 @@ static int __init make_vpl011_uart_node(struct kernel_info *kinfo)
         return res;
 
     res = fdt_property_cell(fdt, "interrupt-parent",
-                            kinfo->phandle_gic);
+                            kinfo->phandle_intc);
     if ( res )
         return res;
 
@@ -479,10 +479,10 @@ static int __init domain_handle_dtb_bootmodule(struct domain *d,
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
 
@@ -525,7 +525,7 @@ static int __init prepare_dtb_domU(struct domain *d, struct kernel_info *kinfo)
     int addrcells, sizecells;
     int ret, fdt_size = DOMU_DTB_SIZE;
 
-    kinfo->phandle_gic = GUEST_PHANDLE_GIC;
+    kinfo->phandle_intc = GUEST_PHANDLE_GIC;
     kinfo->gnttab_start = GUEST_GNTTAB_BASE;
     kinfo->gnttab_size = GUEST_GNTTAB_SIZE;
 
@@ -587,7 +587,7 @@ static int __init prepare_dtb_domU(struct domain *d, struct kernel_info *kinfo)
     /*
      * domain_handle_dtb_bootmodule has to be called before the rest of
      * the device tree is generated because it depends on the value of
-     * the field phandle_gic.
+     * the field phandle_intc.
      */
     if ( kinfo->dtb_bootmodule )
     {
@@ -604,7 +604,7 @@ static int __init prepare_dtb_domU(struct domain *d, struct kernel_info *kinfo)
     if ( ret )
         goto err;
 
-    if ( kinfo->vpl011 )
+    if ( kinfo->vuart )
     {
         ret = -EINVAL;
 #ifdef CONFIG_SBSA_VUART_CONSOLE
@@ -705,7 +705,7 @@ int __init construct_domU(struct domain *d,
     printk("*** LOADING DOMU cpus=%u memory=%#"PRIx64"KB ***\n",
            d->max_vcpus, mem);
 
-    kinfo.vpl011 = dt_property_read_bool(node, "vpl011");
+    kinfo.vuart = dt_property_read_bool(node, "vpl011");
 
     rc = dt_property_read_string(node, "xen,enhanced", &dom0less_enhanced);
     if ( rc == -EILSEQ ||
@@ -733,7 +733,7 @@ int __init construct_domU(struct domain *d,
 
 #ifdef CONFIG_ARM_64
     /* type must be set before allocate memory */
-    d->arch.type = kinfo.type;
+    d->arch.type = kinfo.arch.type;
 #endif
     if ( !dt_find_property(node, "xen,static-mem", NULL) )
         allocate_memory(d, &kinfo);
@@ -751,7 +751,7 @@ int __init construct_domU(struct domain *d,
      * tree node in prepare_dtb_domU, so initialization on related variables
      * shall be done first.
      */
-    if ( kinfo.vpl011 )
+    if ( kinfo.vuart )
     {
         rc = domain_vpl011_init(d, NULL);
         if ( rc < 0 )
diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
index b072a16249..976b03a5df 100644
--- a/xen/arch/arm/domain_build.c
+++ b/xen/arch/arm/domain_build.c
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
@@ -2194,13 +2194,13 @@ int __init construct_domain(struct domain *d, struct kernel_info *kinfo)
 
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
@@ -2307,7 +2307,7 @@ static int __init construct_dom0(struct domain *d)
 
 #ifdef CONFIG_ARM_64
     /* type must be set before allocate_memory */
-    d->arch.type = kinfo.type;
+    d->arch.type = kinfo.arch.type;
 #endif
     find_gnttab_region(d, &kinfo);
     if ( is_domain_direct_mapped(d) )
diff --git a/xen/arch/arm/include/asm/kernel.h b/xen/arch/arm/include/asm/kernel.h
index 7e6e3c82a4..4d74f0bcb2 100644
--- a/xen/arch/arm/include/asm/kernel.h
+++ b/xen/arch/arm/include/asm/kernel.h
@@ -6,125 +6,16 @@
 #ifndef __ARCH_ARM_KERNEL_H__
 #define __ARCH_ARM_KERNEL_H__
 
-#include <xen/device_tree.h>
 #include <asm/domain.h>
-#include <asm/setup.h>
 
-/*
- * List of possible features for dom0less domUs
- *
- * DOM0LESS_ENHANCED_NO_XS: Notify the OS it is running on top of Xen. All the
- *                          default features (excluding Xenstore) will be
- *                          available. Note that an OS *must* not rely on the
- *                          availability of Xen features if this is not set.
- * DOM0LESS_XENSTORE:       Xenstore will be enabled for the VM. This feature
- *                          can't be enabled without the
- *                          DOM0LESS_ENHANCED_NO_XS.
- * DOM0LESS_ENHANCED:       Notify the OS it is running on top of Xen. All the
- *                          default features (including Xenstore) will be
- *                          available. Note that an OS *must* not rely on the
- *                          availability of Xen features if this is not set.
- */
-#define DOM0LESS_ENHANCED_NO_XS  BIT(0, U)
-#define DOM0LESS_XENSTORE        BIT(1, U)
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
-#define KERNEL_INFO_SHM_MEM_INIT .shm_mem.common.max_banks = NR_SHMEM_BANKS,
-#else
-#define KERNEL_INFO_SHM_MEM_INIT
-#endif
-
-#define KERNEL_INFO_INIT                        \
-{                                               \
-    .mem.common.max_banks = NR_MEM_BANKS,       \
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
+#include <asm-generic/kernel.h>
 
 #endif /* #ifdef __ARCH_ARM_KERNEL_H__ */
 
diff --git a/xen/arch/arm/kernel.c b/xen/arch/arm/kernel.c
index 80fad8b336..b75bd6a887 100644
--- a/xen/arch/arm/kernel.c
+++ b/xen/arch/arm/kernel.c
@@ -101,7 +101,7 @@ static paddr_t __init kernel_zimage_place(struct kernel_info *info)
     paddr_t load_addr;
 
 #ifdef CONFIG_ARM_64
-    if ( (info->type == DOMAIN_64BIT) && (info->zimage.start == 0) )
+    if ( (info->arch.type == DOMAIN_64BIT) && (info->zimage.start == 0) )
         return mem->bank[0].start + info->zimage.text_offset;
 #endif
 
@@ -371,10 +371,10 @@ static int __init kernel_uimage_probe(struct kernel_info *info,
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
@@ -444,7 +444,7 @@ static int __init kernel_zimage64_probe(struct kernel_info *info,
 
     info->load = kernel_zimage_load;
 
-    info->type = DOMAIN_64BIT;
+    info->arch.type = DOMAIN_64BIT;
 
     return 0;
 }
@@ -496,7 +496,7 @@ static int __init kernel_zimage32_probe(struct kernel_info *info,
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
index 66088a4267..aff05d24d1 100644
--- a/xen/arch/arm/static-shmem.c
+++ b/xen/arch/arm/static-shmem.c
@@ -6,6 +6,7 @@
 #include <xen/sched.h>
 
 #include <asm/domain_build.h>
+#include <asm/setup.h>
 #include <asm/static-memory.h>
 #include <asm/static-shmem.h>
 
diff --git a/xen/include/asm-generic/kernel.h b/xen/include/asm-generic/kernel.h
new file mode 100644
index 0000000000..b2bd04a185
--- /dev/null
+++ b/xen/include/asm-generic/kernel.h
@@ -0,0 +1,146 @@
+/*
+ * Kernel image loading.
+ *
+ * Copyright (C) 2011 Citrix Systems, Inc.
+ */
+#ifndef __ASM_GENERIC_KERNEL_H__
+#define __ASM_GENERIC_KERNEL_H__
+
+#include <xen/bootfdt.h>
+#include <xen/device_tree.h>
+#include <xen/sched.h>
+#include <xen/types.h>
+
+/*
+ * List of possible features for dom0less domUs
+ *
+ * DOM0LESS_ENHANCED_NO_XS: Notify the OS it is running on top of Xen. All the
+ *                          default features (excluding Xenstore) will be
+ *                          available. Note that an OS *must* not rely on the
+ *                          availability of Xen features if this is not set.
+ * DOM0LESS_XENSTORE:       Xenstore will be enabled for the VM. This feature
+ *                          can't be enabled without the
+ *                          DOM0LESS_ENHANCED_NO_XS.
+ * DOM0LESS_ENHANCED:       Notify the OS it is running on top of Xen. All the
+ *                          default features (including Xenstore) will be
+ *                          available. Note that an OS *must* not rely on the
+ *                          availability of Xen features if this is not set.
+ */
+#define DOM0LESS_ENHANCED_NO_XS  BIT(0, U)
+#define DOM0LESS_XENSTORE        BIT(1, U)
+#define DOM0LESS_ENHANCED        (DOM0LESS_ENHANCED_NO_XS | DOM0LESS_XENSTORE)
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
+    struct arch_kernel_info arch;
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
+#endif /*__ASM_GENERIC_KERNEL_H__ */
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
2.47.1


