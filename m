Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FF20AA7724
	for <lists+xen-devel@lfdr.de>; Fri,  2 May 2025 18:23:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.974785.1362564 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uAtA0-0006DG-10; Fri, 02 May 2025 16:22:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 974785.1362564; Fri, 02 May 2025 16:22:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uAt9z-000692-OF; Fri, 02 May 2025 16:22:47 +0000
Received: by outflank-mailman (input) for mailman id 974785;
 Fri, 02 May 2025 16:22:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=EvHp=XS=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1uAt9y-0005rY-Ey
 for xen-devel@lists.xenproject.org; Fri, 02 May 2025 16:22:46 +0000
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [2a00:1450:4864:20::636])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ad7f56c8-2771-11f0-9ffb-bf95429c2676;
 Fri, 02 May 2025 18:22:44 +0200 (CEST)
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-ac2a81e41e3so394102966b.1
 for <xen-devel@lists.xenproject.org>; Fri, 02 May 2025 09:22:44 -0700 (PDT)
Received: from fedora.. (user-109-243-69-225.play-internet.pl.
 [109.243.69.225]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ad1894c01f2sm68158766b.119.2025.05.02.09.22.42
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
X-Inumbo-ID: ad7f56c8-2771-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746202964; x=1746807764; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=u8nlrE1xOfFR3x/zATZSfmk84RnKUZVsA7gy/a2VH80=;
        b=mdLPNWCI2Xn9lyjJT5bGSTkcJ7PDAHcVRWtHmRs6EJgHyd8NwqJm23C0nB/pku4OAM
         umF/2BqHhUIhl6Q20sr5jCfQ0NgyG3porEwm/GMgLxXcY0bbBaL4z7en143rEyuio+bL
         o04KMC14I5EsLf5KGvAWYjkx1O9iTIYiemJikdeeI9BJWkgHvu1rcs+hFZ/204B2okIL
         WDITby62BtBqaGbqw5ta6HpbGXp5MmXvfDCwuGHxfg7v3yN24ggxKA3ZDgXnI359W1uS
         c7BxHvLgNDbsUCEButyLLD1/JgAXdhvAB6U+VZ5mTxyfz1KlXMTcv1YsF+KqtiOV9+xJ
         G4AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746202964; x=1746807764;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=u8nlrE1xOfFR3x/zATZSfmk84RnKUZVsA7gy/a2VH80=;
        b=OGkqIkBkh0V6BQ0z4z1x2Ip6SYFssPQ7BlUsoZmUh+VwUMTXnEZAL+D+pEzsWdNNL0
         gUfWjsMjj9XdiTVrzDynK/wWcnHlOqBhN8ZWGZBINQAdWcPvw7ZDwfawdD7hliuVWoHC
         KdjacLHVHjP01SrMIdLgCT2WLblC2uVJ27BYBqJSglk//uA03OkYzK6JEu4OnMiJcHbr
         jXOtz931tg9KqYVT11iH+QTYzrN/fKUQkJiaUlt6fguwAx0aZg91eGgVG6iGJ/JK16FF
         VjzLdo2tGlpSxOhLauzbLeXp8ETeCgPtZ8JyVtouXB7Y1liv2tcAltRfoZHKcfQdDTAH
         dDsA==
X-Gm-Message-State: AOJu0YzZk/VbX31Okv7NqbK0Z1VLVSRWc1kbt9GVrKK4HHATnxHWE78S
	2vtMkrIdNTQAzYSkZ8KsELVvFzh1Agzjs3BFd07Y66f+RYlZU/DaE9mTXw==
X-Gm-Gg: ASbGncsljhXWem6a2bWV/8YtzBO4liiWslSWtZhEHSkFLJzblUkstXYqvRLVeziT/Hy
	MvriqvknlshfB4mQxMKZvbSKsVJeEKoPfcOYwPUSmby3uRP0Fcx2EPYLwDv+t1cbP+vDhtcBqFT
	6IW0of67lt8apkO2DbOdhxw1XAPYNkHhI7pO4svMQMZE8UUPCGlhJXP4B7lwwfXTM2BcCaB86eW
	1vLvJMTSx+To8KBo6GYOE6SfucYvRwbZTEAfxi+7hFWqDBo8GC7RrhVfKpYmIYZZnh5QkgMe3mc
	RSTHPeNOgH1En55CsggODtTfJX+OHfQJW7jpTONIsIuLXMNLFNOu6JHfe8xdeyI63gMIt0sNmYN
	4xyKtibkYLw==
X-Google-Smtp-Source: AGHT+IEJ7hvV5q+nkxkUGh611s55rUyl6E9LU57qUyEPjnLtQ4i6XHxWf1qoYOBdtkLf1bqZLmib7g==
X-Received: by 2002:a17:907:97d6:b0:ace:9d90:c49c with SMTP id a640c23a62f3a-ad17ad1a4famr335823766b.8.1746202963300;
        Fri, 02 May 2025 09:22:43 -0700 (PDT)
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
Subject: [PATCH v3 2/8] xen/common: dom0less: make some parts of Arm's CONFIG_DOM0LESS common
Date: Fri,  2 May 2025 18:22:32 +0200
Message-ID: <82f0c1d4fe25b4a52d76f3c8004e107b183af56c.1746199009.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <cover.1746199009.git.oleksii.kurochko@gmail.com>
References: <cover.1746199009.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Move some parts of Arm's Dom0Less code to be reused by other architectures.
At the moment, RISC-V is going to reuse these parts.

Move dom0less-build.h from the Arm-specific directory to asm-generic
as these header is expected to be the same across acrhictectures with
some updates: add the following declaration of construct_domU(),
and arch_create_domUs() as there are some parts which are still
architecture-specific.

Introduce HAS_DOM0LESS to provide ability to enable generic Dom0less
code for an architecture.

Relocate the CONFIG_DOM0LESS configuration to the common with adding
"depends on HAS_DOM0LESS" to not break builds for architectures which
don't support CONFIG_DOM0LESS config, especically it would be useful
to not provide stubs for  construct_domU(), arch_create_domUs()
in case of *-randconfig which may set CONFIG_DOM0LESS=y.

Move is_dom0less_mode() function to the common code, as it depends on
boot modules that are already part of the common code.

Move create_domUs() function to the common code with some updates:
- Add arch_create_domUs() to cover parsing of arch-specific features,
  for example, SVE (Scalar Vector Extension ) exists only in Arm.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
It was suggested to change dom0less to predefined domus or similar
(https://lore.kernel.org/xen-devel/cd2a3644-c9c6-4e77-9491-2988703906c0@gmail.com/T/#m1d5e81e5f1faca98a3c51efe4f35af25010edbf0):

I decided to go with dom0less name for now as it will require a lot of places to change,
including CI's test, and IMO we could do in a separate patch.
If it is necessry to do now, I'll be happy to do that in next version of the current
patch series.
---
Changes in v3:
 - Move changes connected to the patch "xen/arm: dom0less delay xenstore initialization"
   to common.
   Also, some necessary parts for the mentioned patches were moved
   to common (such as alloc_xenstore_evtchn(), ... ).
   Not all changes are moved, changes connected to alloc_xenstore_params() and
   construct_domu() will be moved in the following patches of this patch series.
 - Move parsing of capabilities property to common code.
 - Align parsing of "passthrough", "multiboot,device-tree" properties with staging.
 - Drop arch_xen_domctl_createdomain().
 - Add 'select HAS_DEVICE_TREE' for config HAS_DOM0LESS.
 - Add empty lines after license in the top of newly added files.
 - s/arch_create_domus/arch_create_domUs.
 - Add footer below commit message regarding the naming of dom0less.
---
Changes in v2:
 - Convert 'depends on Arm' to 'depends on HAS_DOM0LESS' for
   CONFIG_DOM0LESS_BOOT.
 - Change 'default Arm' to 'default y' for CONFIG_DOM0LESS_BOOT as there is
   dependency on HAS_DOM0LESS.
 - Introduce HAS_DOM0LESS and enable it for Arm.
 - Update the commit message.
---
 xen/arch/arm/Kconfig                      |   9 +-
 xen/arch/arm/dom0less-build.c             | 371 ++++------------------
 xen/arch/arm/include/asm/Makefile         |   1 +
 xen/arch/arm/include/asm/dom0less-build.h |  34 --
 xen/common/Kconfig                        |  13 +
 xen/common/device-tree/Makefile           |   1 +
 xen/common/device-tree/dom0less-build.c   | 283 +++++++++++++++++
 xen/include/asm-generic/dom0less-build.h  |  49 +++
 8 files changed, 404 insertions(+), 357 deletions(-)
 delete mode 100644 xen/arch/arm/include/asm/dom0less-build.h
 create mode 100644 xen/common/device-tree/dom0less-build.c
 create mode 100644 xen/include/asm-generic/dom0less-build.h

diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
index da8a406f5a..d0e0a7753c 100644
--- a/xen/arch/arm/Kconfig
+++ b/xen/arch/arm/Kconfig
@@ -15,6 +15,7 @@ config ARM
 	select GENERIC_UART_INIT
 	select HAS_ALTERNATIVE if HAS_VMAP
 	select HAS_DEVICE_TREE
+	select HAS_DOM0LESS
 	select HAS_STACK_PROTECTOR
 	select HAS_UBSAN
 
@@ -120,14 +121,6 @@ config GICV2
 	  Driver for the ARM Generic Interrupt Controller v2.
 	  If unsure, say Y
 
-config DOM0LESS_BOOT
-	bool "Dom0less boot support" if EXPERT
-	default y
-	help
-	  Dom0less boot support enables Xen to create and start domU guests during
-	  Xen boot without the need of a control domain (Dom0), which could be
-	  present anyway.
-
 config GICV3
 	bool "GICv3 driver"
 	depends on !NEW_VGIC
diff --git a/xen/arch/arm/dom0less-build.c b/xen/arch/arm/dom0less-build.c
index a356fc94fc..ef49495d4f 100644
--- a/xen/arch/arm/dom0less-build.c
+++ b/xen/arch/arm/dom0less-build.c
@@ -22,48 +22,7 @@
 #include <asm/static-memory.h>
 #include <asm/static-shmem.h>
 
-#define XENSTORE_PFN_LATE_ALLOC UINT64_MAX
-
-static domid_t __initdata xs_domid = DOMID_INVALID;
-static bool __initdata need_xenstore;
-
-void __init set_xs_domain(struct domain *d)
-{
-    xs_domid = d->domain_id;
-    set_global_virq_handler(d, VIRQ_DOM_EXC);
-}
-
-bool __init is_dom0less_mode(void)
-{
-    struct bootmodules *mods = &bootinfo.modules;
-    struct bootmodule *mod;
-    unsigned int i;
-    bool dom0found = false;
-    bool domUfound = false;
-
-    /* Look into the bootmodules */
-    for ( i = 0 ; i < mods->nr_mods ; i++ )
-    {
-        mod = &mods->module[i];
-        /* Find if dom0 and domU kernels are present */
-        if ( mod->kind == BOOTMOD_KERNEL )
-        {
-            if ( mod->domU == false )
-            {
-                dom0found = true;
-                break;
-            }
-            else
-                domUfound = true;
-        }
-    }
-
-    /*
-     * If there is no dom0 kernel but at least one domU, then we are in
-     * dom0less mode
-     */
-    return ( !dom0found && domUfound );
-}
+bool __initdata need_xenstore;
 
 #ifdef CONFIG_VGICV2
 static int __init make_gicv2_domU_node(struct kernel_info *kinfo)
@@ -686,25 +645,6 @@ static int __init prepare_dtb_domU(struct domain *d, struct kernel_info *kinfo)
     return -EINVAL;
 }
 
-static int __init alloc_xenstore_evtchn(struct domain *d)
-{
-    evtchn_alloc_unbound_t alloc;
-    int rc;
-
-    alloc.dom = d->domain_id;
-    alloc.remote_dom = xs_domid;
-    rc = evtchn_alloc_unbound(&alloc, 0);
-    if ( rc )
-    {
-        printk("Failed allocating event channel for domain\n");
-        return rc;
-    }
-
-    d->arch.hvm.params[HVM_PARAM_STORE_EVTCHN] = alloc.port;
-
-    return 0;
-}
-
 #define XENSTORE_PFN_OFFSET 1
 static int __init alloc_xenstore_page(struct domain *d)
 {
@@ -771,36 +711,6 @@ static int __init alloc_xenstore_params(struct kernel_info *kinfo)
     return rc;
 }
 
-static void __init initialize_domU_xenstore(void)
-{
-    struct domain *d;
-
-    if ( xs_domid == DOMID_INVALID )
-        return;
-
-    for_each_domain( d )
-    {
-        uint64_t gfn = d->arch.hvm.params[HVM_PARAM_STORE_PFN];
-        int rc;
-
-        if ( gfn == 0 )
-            continue;
-
-        if ( is_xenstore_domain(d) )
-            continue;
-
-        rc = alloc_xenstore_evtchn(d);
-        if ( rc < 0 )
-            panic("%pd: Failed to allocate xenstore_evtchn\n", d);
-
-        if ( gfn != XENSTORE_PFN_LATE_ALLOC && IS_ENABLED(CONFIG_GRANT_TABLE) )
-        {
-            ASSERT(gfn < UINT32_MAX);
-            gnttab_seed_entry(d, GNTTAB_RESERVED_XENSTORE, xs_domid, gfn);
-        }
-    }
-}
-
 static void __init domain_vcpu_affinity(struct domain *d,
                                         const struct dt_device_node *node)
 {
@@ -906,8 +816,8 @@ static inline int domain_p2m_set_allocation(struct domain *d, uint64_t mem,
 }
 #endif /* CONFIG_ARCH_PAGING_MEMPOOL */
 
-static int __init construct_domU(struct domain *d,
-                                 const struct dt_device_node *node)
+int __init construct_domU(struct domain *d,
+                          const struct dt_device_node *node)
 {
     struct kernel_info kinfo = KERNEL_INFO_INIT;
     const char *dom0less_enhanced;
@@ -1009,246 +919,77 @@ static int __init construct_domU(struct domain *d,
     return alloc_xenstore_params(&kinfo);
 }
 
-void __init create_domUs(void)
+void __init arch_create_domUs(struct dt_device_node *node,
+                       struct xen_domctl_createdomain *d_cfg,
+                       unsigned int flags)
 {
-    struct dt_device_node *node;
-    const char *dom0less_iommu;
-    bool iommu = false;
-    const struct dt_device_node *cpupool_node,
-                                *chosen = dt_find_node_by_path("/chosen");
-    const char *llc_colors_str = NULL;
-
-    BUG_ON(chosen == NULL);
-    dt_for_each_child_node(chosen, node)
-    {
-        struct domain *d;
-        struct xen_domctl_createdomain d_cfg = {
-            .arch.gic_version = XEN_DOMCTL_CONFIG_GIC_NATIVE,
-            .flags = XEN_DOMCTL_CDF_hvm | XEN_DOMCTL_CDF_hap,
-            /*
-             * The default of 1023 should be sufficient for guests because
-             * on ARM we don't bind physical interrupts to event channels.
-             * The only use of the evtchn port is inter-domain communications.
-             * 1023 is also the default value used in libxl.
-             */
-            .max_evtchn_port = 1023,
-            .max_grant_frames = -1,
-            .max_maptrack_frames = -1,
-            .grant_opts = XEN_DOMCTL_GRANT_version(opt_gnttab_max_version),
-        };
-        unsigned int flags = 0U;
-        bool has_dtb = false;
-        uint32_t val;
-        int rc;
-
-        if ( !dt_device_is_compatible(node, "xen,domain") )
-            continue;
-
-        if ( (max_init_domid + 1) >= DOMID_FIRST_RESERVED )
-            panic("No more domain IDs available\n");
+    uint32_t val;
 
-        if ( dt_property_read_u32(node, "capabilities", &val) )
-        {
-            if ( val & ~DOMAIN_CAPS_MASK )
-                panic("Invalid capabilities (%"PRIx32")\n", val);
-
-            if ( val & DOMAIN_CAPS_CONTROL )
-                flags |= CDF_privileged;
-
-            if ( val & DOMAIN_CAPS_HARDWARE )
-            {
-                if ( hardware_domain )
-                    panic("Only 1 hardware domain can be specified! (%pd)\n",
-                           hardware_domain);
-
-                d_cfg.max_grant_frames = gnttab_dom0_frames();
-                d_cfg.max_evtchn_port = -1;
-                flags |= CDF_hardware;
-                iommu = true;
-            }
-
-            if ( val & DOMAIN_CAPS_XENSTORE )
-            {
-                if ( xs_domid != DOMID_INVALID )
-                    panic("Only 1 xenstore domain can be specified! (%u)\n",
-                          xs_domid);
+    d_cfg->arch.gic_version = XEN_DOMCTL_CONFIG_GIC_NATIVE;
+    d_cfg->flags = XEN_DOMCTL_CDF_hvm | XEN_DOMCTL_CDF_hap;
 
-                d_cfg.flags |= XEN_DOMCTL_CDF_xs_domain;
-                d_cfg.max_evtchn_port = -1;
-            }
-        }
-
-        if ( dt_find_property(node, "xen,static-mem", NULL) )
-        {
-            if ( llc_coloring_enabled )
-                panic("LLC coloring and static memory are incompatible\n");
-
-            flags |= CDF_staticmem;
-        }
-
-        if ( dt_property_read_bool(node, "direct-map") )
-        {
-            if ( !(flags & CDF_staticmem) )
-                panic("direct-map is not valid for domain %s without static allocation.\n",
-                      dt_node_name(node));
-
-            flags |= CDF_directmap;
-        }
-
-        if ( !dt_property_read_u32(node, "cpus", &d_cfg.max_vcpus) )
-            panic("Missing property 'cpus' for domain %s\n",
-                  dt_node_name(node));
-
-        if ( !dt_property_read_string(node, "passthrough", &dom0less_iommu) )
-        {
-            if ( flags & CDF_hardware )
-                panic("Don't specify passthrough for hardware domain\n");
-
-            if ( !strcmp(dom0less_iommu, "enabled") )
-                iommu = true;
-        }
-
-        if ( (flags & CDF_hardware) && !(flags & CDF_directmap) &&
-             !iommu_enabled )
-            panic("non-direct mapped hardware domain requires iommu\n");
-
-        if ( dt_find_compatible_node(node, NULL, "multiboot,device-tree") )
-        {
-            if ( flags & CDF_hardware )
-                panic("\"multiboot,device-tree\" incompatible with hardware domain\n");
-
-            has_dtb = true;
-        }
-
-        if ( iommu_enabled && (iommu || has_dtb) )
-            d_cfg.flags |= XEN_DOMCTL_CDF_iommu;
-
-        if ( !dt_property_read_u32(node, "nr_spis", &d_cfg.arch.nr_spis) )
-        {
-            int vpl011_virq = GUEST_VPL011_SPI;
-
-            d_cfg.arch.nr_spis = VGIC_DEF_NR_SPIS;
-
-            /*
-             * The VPL011 virq is GUEST_VPL011_SPI, unless direct-map is
-             * set, in which case it'll match the hardware.
-             *
-             * Since the domain is not yet created, we can't use
-             * d->arch.vpl011.irq. So the logic to find the vIRQ has to
-             * be hardcoded.
-             * The logic here shall be consistent with the one in
-             * domain_vpl011_init().
-             */
-            if ( flags & CDF_directmap )
-            {
-                vpl011_virq = serial_irq(SERHND_DTUART);
-                if ( vpl011_virq < 0 )
-                    panic("Error getting IRQ number for this serial port %d\n",
-                          SERHND_DTUART);
-            }
+    if ( !dt_property_read_u32(node, "nr_spis", &d_cfg->arch.nr_spis) )
+    {
+        int vpl011_virq = GUEST_VPL011_SPI;
 
-            /*
-             * vpl011 uses one emulated SPI. If vpl011 is requested, make
-             * sure that we allocate enough SPIs for it.
-             */
-            if ( dt_property_read_bool(node, "vpl011") )
-                d_cfg.arch.nr_spis = MAX(d_cfg.arch.nr_spis,
-                                         vpl011_virq - 32 + 1);
-        }
-        else if ( flags & CDF_hardware )
-            panic("nr_spis cannot be specified for hardware domain\n");
+        d_cfg->arch.nr_spis = VGIC_DEF_NR_SPIS;
 
-        /* Get the optional property domain-cpupool */
-        cpupool_node = dt_parse_phandle(node, "domain-cpupool", 0);
-        if ( cpupool_node )
+        /*
+         * The VPL011 virq is GUEST_VPL011_SPI, unless direct-map is
+         * set, in which case it'll match the hardware.
+         *
+         * Since the domain is not yet created, we can't use
+         * d->arch.vpl011.irq. So the logic to find the vIRQ has to
+         * be hardcoded.
+         * The logic here shall be consistent with the one in
+         * domain_vpl011_init().
+         */
+        if ( flags & CDF_directmap )
         {
-            int pool_id = btcpupools_get_domain_pool_id(cpupool_node);
-            if ( pool_id < 0 )
-                panic("Error getting cpupool id from domain-cpupool (%d)\n",
-                      pool_id);
-            d_cfg.cpupool_id = pool_id;
+            vpl011_virq = serial_irq(SERHND_DTUART);
+            if ( vpl011_virq < 0 )
+                panic("Error getting IRQ number for this serial port %d\n",
+                        SERHND_DTUART);
         }
 
-        if ( dt_property_read_u32(node, "max_grant_version", &val) )
-            d_cfg.grant_opts = XEN_DOMCTL_GRANT_version(val);
+        /*
+            * vpl011 uses one emulated SPI. If vpl011 is requested, make
+            * sure that we allocate enough SPIs for it.
+            */
+        if ( dt_property_read_bool(node, "vpl011") )
+            d_cfg->arch.nr_spis = MAX(d_cfg->arch.nr_spis,
+                                      vpl011_virq - 32 + 1);
+    }
+    else if ( flags & CDF_hardware )
+        panic("nr_spis cannot be specified for hardware domain\n");
 
-        if ( dt_property_read_u32(node, "max_grant_frames", &val) )
-        {
-            if ( val > INT32_MAX )
-                panic("max_grant_frames (%"PRIu32") overflow\n", val);
-            d_cfg.max_grant_frames = val;
-        }
+    if ( dt_get_property(node, "sve", &val) )
+    {
+#ifdef CONFIG_ARM64_SVE
+        unsigned int sve_vl_bits;
+        bool ret = false;
 
-        if ( dt_property_read_u32(node, "max_maptrack_frames", &val) )
+        if ( !val )
         {
-            if ( val > INT32_MAX )
-                panic("max_maptrack_frames (%"PRIu32") overflow\n", val);
-            d_cfg.max_maptrack_frames = val;
+            /* Property found with no value, means max HW VL supported */
+            ret = sve_domctl_vl_param(-1, &sve_vl_bits);
         }
-
-        if ( dt_get_property(node, "sve", &val) )
+        else
         {
-#ifdef CONFIG_ARM64_SVE
-            unsigned int sve_vl_bits;
-            bool ret = false;
-
-            if ( !val )
-            {
-                /* Property found with no value, means max HW VL supported */
-                ret = sve_domctl_vl_param(-1, &sve_vl_bits);
-            }
+            if ( dt_property_read_u32(node, "sve", &val) )
+                ret = sve_domctl_vl_param(val, &sve_vl_bits);
             else
-            {
-                if ( dt_property_read_u32(node, "sve", &val) )
-                    ret = sve_domctl_vl_param(val, &sve_vl_bits);
-                else
-                    panic("Error reading 'sve' property\n");
-            }
+                panic("Error reading 'sve' property\n");
+        }
 
-            if ( ret )
-                d_cfg.arch.sve_vl = sve_encode_vl(sve_vl_bits);
-            else
-                panic("SVE vector length error\n");
+        if ( ret )
+            d_cfg->arch.sve_vl = sve_encode_vl(sve_vl_bits);
+        else
+            panic("SVE vector length error\n");
 #else
-            panic("'sve' property found, but CONFIG_ARM64_SVE not selected\n");
+        panic("'sve' property found, but CONFIG_ARM64_SVE not selected\n");
 #endif
-        }
-
-        dt_property_read_string(node, "llc-colors", &llc_colors_str);
-        if ( !llc_coloring_enabled && llc_colors_str )
-            panic("'llc-colors' found, but LLC coloring is disabled\n");
-
-        /*
-         * The variable max_init_domid is initialized with zero, so here it's
-         * very important to use the pre-increment operator to call
-         * domain_create() with a domid > 0. (domid == 0 is reserved for Dom0)
-         */
-        d = domain_create(++max_init_domid, &d_cfg, flags);
-        if ( IS_ERR(d) )
-            panic("Error creating domain %s (rc = %ld)\n",
-                  dt_node_name(node), PTR_ERR(d));
-
-        if ( llc_coloring_enabled &&
-             (rc = domain_set_llc_colors_from_str(d, llc_colors_str)) )
-            panic("Error initializing LLC coloring for domain %s (rc = %d)\n",
-                  dt_node_name(node), rc);
-
-        d->is_console = true;
-        dt_device_set_used_by(node, d->domain_id);
-
-        rc = construct_domU(d, node);
-        if ( rc )
-            panic("Could not set up domain %s (rc = %d)\n",
-                  dt_node_name(node), rc);
-
-        if ( d_cfg.flags & XEN_DOMCTL_CDF_xs_domain )
-            set_xs_domain(d);
     }
-
-    if ( need_xenstore && xs_domid == DOMID_INVALID )
-        panic("xenstore requested, but xenstore domain not present\n");
-
-    initialize_domU_xenstore();
 }
 
 /*
diff --git a/xen/arch/arm/include/asm/Makefile b/xen/arch/arm/include/asm/Makefile
index 4a4036c951..831c914cce 100644
--- a/xen/arch/arm/include/asm/Makefile
+++ b/xen/arch/arm/include/asm/Makefile
@@ -1,6 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0-only
 generic-y += altp2m.h
 generic-y += device.h
+generic-y += dom0less-build.h
 generic-y += hardirq.h
 generic-y += iocap.h
 generic-y += paging.h
diff --git a/xen/arch/arm/include/asm/dom0less-build.h b/xen/arch/arm/include/asm/dom0less-build.h
deleted file mode 100644
index b0e41a1954..0000000000
--- a/xen/arch/arm/include/asm/dom0less-build.h
+++ /dev/null
@@ -1,34 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0-only */
-
-#ifndef __ASM_DOM0LESS_BUILD_H_
-#define __ASM_DOM0LESS_BUILD_H_
-
-#include <xen/stdbool.h>
-
-#ifdef CONFIG_DOM0LESS_BOOT
-
-void create_domUs(void);
-bool is_dom0less_mode(void);
-void set_xs_domain(struct domain *d);
-
-#else /* !CONFIG_DOM0LESS_BOOT */
-
-static inline void create_domUs(void) {}
-static inline bool is_dom0less_mode(void)
-{
-    return false;
-}
-static inline void set_xs_domain(struct domain *d) {}
-
-#endif /* CONFIG_DOM0LESS_BOOT */
-
-#endif /* __ASM_DOM0LESS_BUILD_H_ */
-
-/*
- * Local variables:
- * mode: C
- * c-file-style: "BSD"
- * c-basic-offset: 4
- * indent-tabs-mode: nil
- * End:
- */
diff --git a/xen/common/Kconfig b/xen/common/Kconfig
index be28060716..be38abf9e1 100644
--- a/xen/common/Kconfig
+++ b/xen/common/Kconfig
@@ -12,6 +12,15 @@ config CORE_PARKING
 	bool
 	depends on NR_CPUS > 1
 
+config DOM0LESS_BOOT
+	bool "Dom0less boot support" if EXPERT
+	depends on HAS_DOM0LESS
+	default y
+	help
+	  Dom0less boot support enables Xen to create and start domU guests during
+	  Xen boot without the need of a control domain (Dom0), which could be
+	  present anyway.
+
 config GRANT_TABLE
 	bool "Grant table support" if EXPERT
 	default y
@@ -74,6 +83,10 @@ config HAS_DEVICE_TREE
 	bool
 	select LIBFDT
 
+config HAS_DOM0LESS
+	bool
+	select HAS_DEVICE_TREE
+
 config HAS_DIT # Data Independent Timing
 	bool
 
diff --git a/xen/common/device-tree/Makefile b/xen/common/device-tree/Makefile
index 7c549be38a..f3dafc9b81 100644
--- a/xen/common/device-tree/Makefile
+++ b/xen/common/device-tree/Makefile
@@ -1,5 +1,6 @@
 obj-y += bootfdt.init.o
 obj-y += bootinfo.init.o
 obj-y += device-tree.o
+obj-$(CONFIG_DOM0LESS_BOOT) += dom0less-build.o
 obj-$(CONFIG_OVERLAY_DTB) += dt-overlay.o
 obj-y += intc.o
diff --git a/xen/common/device-tree/dom0less-build.c b/xen/common/device-tree/dom0less-build.c
new file mode 100644
index 0000000000..a01a8b6b1a
--- /dev/null
+++ b/xen/common/device-tree/dom0less-build.c
@@ -0,0 +1,283 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+
+#include <xen/bootfdt.h>
+#include <xen/device_tree.h>
+#include <xen/domain.h>
+#include <xen/err.h>
+#include <xen/event.h>
+#include <xen/grant_table.h>
+#include <xen/init.h>
+#include <xen/iommu.h>
+#include <xen/llc-coloring.h>
+#include <xen/sched.h>
+#include <xen/stdbool.h>
+#include <xen/types.h>
+
+#include <public/bootfdt.h>
+#include <public/domctl.h>
+#include <public/event_channel.h>
+
+#include <asm/dom0less-build.h>
+#include <asm/setup.h>
+
+static domid_t __initdata xs_domid = DOMID_INVALID;
+
+void __init set_xs_domain(struct domain *d)
+{
+    xs_domid = d->domain_id;
+    set_global_virq_handler(d, VIRQ_DOM_EXC);
+}
+
+bool __init is_dom0less_mode(void)
+{
+    struct bootmodules *mods = &bootinfo.modules;
+    struct bootmodule *mod;
+    unsigned int i;
+    bool dom0found = false;
+    bool domUfound = false;
+
+    /* Look into the bootmodules */
+    for ( i = 0 ; i < mods->nr_mods ; i++ )
+    {
+        mod = &mods->module[i];
+        /* Find if dom0 and domU kernels are present */
+        if ( mod->kind == BOOTMOD_KERNEL )
+        {
+            if ( mod->domU == false )
+            {
+                dom0found = true;
+                break;
+            }
+            else
+                domUfound = true;
+        }
+    }
+
+    /*
+     * If there is no dom0 kernel but at least one domU, then we are in
+     * dom0less mode
+     */
+    return ( !dom0found && domUfound );
+}
+
+static int __init alloc_xenstore_evtchn(struct domain *d)
+{
+    evtchn_alloc_unbound_t alloc;
+    int rc;
+
+    alloc.dom = d->domain_id;
+    alloc.remote_dom = xs_domid;
+    rc = evtchn_alloc_unbound(&alloc, 0);
+    if ( rc )
+    {
+        printk("Failed allocating event channel for domain\n");
+        return rc;
+    }
+
+    d->arch.hvm.params[HVM_PARAM_STORE_EVTCHN] = alloc.port;
+
+    return 0;
+}
+
+static void __init initialize_domU_xenstore(void)
+{
+    struct domain *d;
+
+    if ( xs_domid == DOMID_INVALID )
+        return;
+
+    for_each_domain( d )
+    {
+        uint64_t gfn = d->arch.hvm.params[HVM_PARAM_STORE_PFN];
+        int rc;
+
+        if ( gfn == 0 )
+            continue;
+
+        if ( is_xenstore_domain(d) )
+            continue;
+
+        rc = alloc_xenstore_evtchn(d);
+        if ( rc < 0 )
+            panic("%pd: Failed to allocate xenstore_evtchn\n", d);
+
+        if ( gfn != XENSTORE_PFN_LATE_ALLOC && IS_ENABLED(CONFIG_GRANT_TABLE) )
+        {
+            ASSERT(gfn < UINT32_MAX);
+            gnttab_seed_entry(d, GNTTAB_RESERVED_XENSTORE, xs_domid, gfn);
+        }
+    }
+}
+
+void __init create_domUs(void)
+{
+    struct dt_device_node *node;
+    const char *dom0less_iommu;
+    bool iommu = false;
+    const struct dt_device_node *cpupool_node,
+                                *chosen = dt_find_node_by_path("/chosen");
+    const char *llc_colors_str = NULL;
+
+    BUG_ON(chosen == NULL);
+    dt_for_each_child_node(chosen, node)
+    {
+        struct domain *d;
+        struct xen_domctl_createdomain d_cfg = {0};
+        unsigned int flags = 0U;
+        bool has_dtb = false;
+        uint32_t val;
+        int rc;
+
+        if ( !dt_device_is_compatible(node, "xen,domain") )
+            continue;
+
+        if ( (max_init_domid + 1) >= DOMID_FIRST_RESERVED )
+            panic("No more domain IDs available\n");
+
+        d_cfg.max_evtchn_port = 1023;
+        d_cfg.max_grant_frames = -1;
+        d_cfg.max_maptrack_frames = -1;
+        d_cfg.grant_opts = XEN_DOMCTL_GRANT_version(opt_gnttab_max_version);
+
+        if ( dt_property_read_u32(node, "capabilities", &val) )
+        {
+            if ( val & ~DOMAIN_CAPS_MASK )
+                panic("Invalid capabilities (%"PRIx32")\n", val);
+
+            if ( val & DOMAIN_CAPS_CONTROL )
+                flags |= CDF_privileged;
+
+            if ( val & DOMAIN_CAPS_HARDWARE )
+            {
+                if ( hardware_domain )
+                    panic("Only 1 hardware domain can be specified! (%pd)\n",
+                            hardware_domain);
+
+                d_cfg.max_grant_frames = gnttab_dom0_frames();
+                d_cfg.max_evtchn_port = -1;
+                flags |= CDF_hardware;
+                iommu = true;
+            }
+
+            if ( val & DOMAIN_CAPS_XENSTORE )
+            {
+                if ( xs_domid != DOMID_INVALID )
+                    panic("Only 1 xenstore domain can be specified! (%u)\n",
+                            xs_domid);
+
+                d_cfg.flags |= XEN_DOMCTL_CDF_xs_domain;
+                d_cfg.max_evtchn_port = -1;
+            }
+        }
+
+        if ( dt_find_property(node, "xen,static-mem", NULL) )
+        {
+            if ( llc_coloring_enabled )
+                panic("LLC coloring and static memory are incompatible\n");
+
+            flags |= CDF_staticmem;
+        }
+
+        if ( dt_property_read_bool(node, "direct-map") )
+        {
+            if ( !(flags & CDF_staticmem) )
+                panic("direct-map is not valid for domain %s without static allocation.\n",
+                      dt_node_name(node));
+
+            flags |= CDF_directmap;
+        }
+
+        if ( !dt_property_read_u32(node, "cpus", &d_cfg.max_vcpus) )
+            panic("Missing property 'cpus' for domain %s\n",
+                  dt_node_name(node));
+
+        if ( !dt_property_read_string(node, "passthrough", &dom0less_iommu) )
+        {
+            if ( flags & CDF_hardware )
+                panic("Don't specify passthrough for hardware domain\n");
+
+            if ( !strcmp(dom0less_iommu, "enabled") )
+                iommu = true;
+        }
+
+        if ( (flags & CDF_hardware) && !(flags & CDF_directmap) &&
+             !iommu_enabled )
+            panic("non-direct mapped hardware domain requires iommu\n");
+
+        if ( dt_find_compatible_node(node, NULL, "multiboot,device-tree") )
+        {
+            if ( flags & CDF_hardware )
+                panic("\"multiboot,device-tree\" incompatible with hardware domain\n");
+
+            has_dtb = true;
+        }
+
+        if ( iommu_enabled && (iommu || has_dtb) )
+            d_cfg.flags |= XEN_DOMCTL_CDF_iommu;
+
+        /* Get the optional property domain-cpupool */
+        cpupool_node = dt_parse_phandle(node, "domain-cpupool", 0);
+        if ( cpupool_node )
+        {
+            int pool_id = btcpupools_get_domain_pool_id(cpupool_node);
+            if ( pool_id < 0 )
+                panic("Error getting cpupool id from domain-cpupool (%d)\n",
+                      pool_id);
+            d_cfg.cpupool_id = pool_id;
+        }
+
+        if ( dt_property_read_u32(node, "max_grant_version", &val) )
+            d_cfg.grant_opts = XEN_DOMCTL_GRANT_version(val);
+
+        if ( dt_property_read_u32(node, "max_grant_frames", &val) )
+        {
+            if ( val > INT32_MAX )
+                panic("max_grant_frames (%"PRIu32") overflow\n", val);
+            d_cfg.max_grant_frames = val;
+        }
+
+        if ( dt_property_read_u32(node, "max_maptrack_frames", &val) )
+        {
+            if ( val > INT32_MAX )
+                panic("max_maptrack_frames (%"PRIu32") overflow\n", val);
+            d_cfg.max_maptrack_frames = val;
+        }
+
+        dt_property_read_string(node, "llc-colors", &llc_colors_str);
+        if ( !llc_coloring_enabled && llc_colors_str )
+            panic("'llc-colors' found, but LLC coloring is disabled\n");
+
+        arch_create_domUs(node, &d_cfg, flags);
+
+        /*
+         * The variable max_init_domid is initialized with zero, so here it's
+         * very important to use the pre-increment operator to call
+         * domain_create() with a domid > 0. (domid == 0 is reserved for Dom0)
+         */
+        d = domain_create(++max_init_domid, &d_cfg, flags);
+        if ( IS_ERR(d) )
+            panic("Error creating domain %s (rc = %ld)\n",
+                  dt_node_name(node), PTR_ERR(d));
+
+        if ( llc_coloring_enabled &&
+             (rc = domain_set_llc_colors_from_str(d, llc_colors_str)) )
+            panic("Error initializing LLC coloring for domain %s (rc = %d)\n",
+                  dt_node_name(node), rc);
+
+        d->is_console = true;
+        dt_device_set_used_by(node, d->domain_id);
+
+        rc = construct_domU(d, node);
+        if ( rc )
+            panic("Could not set up domain %s (rc = %d)\n",
+                  dt_node_name(node), rc);
+
+        if ( d_cfg.flags & XEN_DOMCTL_CDF_xs_domain )
+            set_xs_domain(d);
+    }
+
+    if ( need_xenstore && xs_domid == DOMID_INVALID )
+        panic("xenstore requested, but xenstore domain not present\n");
+
+    initialize_domU_xenstore();
+}
diff --git a/xen/include/asm-generic/dom0less-build.h b/xen/include/asm-generic/dom0less-build.h
new file mode 100644
index 0000000000..5655571a66
--- /dev/null
+++ b/xen/include/asm-generic/dom0less-build.h
@@ -0,0 +1,49 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+
+#ifndef __ASM_GENERIC_DOM0LESS_BUILD_H__
+#define __ASM_GENERIC_DOM0LESS_BUILD_H__
+
+#include <xen/stdbool.h>
+
+#ifdef CONFIG_DOM0LESS_BOOT
+
+#include <public/domctl.h>
+
+struct domain;
+struct dt_device_node;
+
+/* TODO: remove both when construct_domU() will be moved to common. */
+#define XENSTORE_PFN_LATE_ALLOC UINT64_MAX
+extern bool need_xenstore;
+
+void create_domUs(void);
+bool is_dom0less_mode(void);
+void set_xs_domain(struct domain *d);
+
+int construct_domU(struct domain *d, const struct dt_device_node *node);
+
+void arch_create_domUs(struct dt_device_node *node,
+                       struct xen_domctl_createdomain *d_cfg,
+                       unsigned int flags);
+
+#else /* !CONFIG_DOM0LESS_BOOT */
+
+static inline void create_domUs(void) {}
+static inline bool is_dom0less_mode(void)
+{
+    return false;
+}
+static inline void set_xs_domain(struct domain *d) {}
+
+#endif /* CONFIG_DOM0LESS_BOOT */
+
+#endif /* __ASM_GENERIC_DOM0LESS_BUILD_H__ */
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


