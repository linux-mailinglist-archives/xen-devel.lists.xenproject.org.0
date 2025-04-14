Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D4609A887D9
	for <lists+xen-devel@lfdr.de>; Mon, 14 Apr 2025 17:57:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.950712.1346957 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4MB0-0000H4-IW; Mon, 14 Apr 2025 15:56:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 950712.1346957; Mon, 14 Apr 2025 15:56:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4MB0-0000AW-BM; Mon, 14 Apr 2025 15:56:50 +0000
Received: by outflank-mailman (input) for mailman id 950712;
 Mon, 14 Apr 2025 15:56:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YdIb=XA=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1u4MAy-0008KQ-OJ
 for xen-devel@lists.xenproject.org; Mon, 14 Apr 2025 15:56:48 +0000
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [2a00:1450:4864:20::532])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1217939f-1949-11f0-9eae-5ba50f476ded;
 Mon, 14 Apr 2025 17:56:47 +0200 (CEST)
Received: by mail-ed1-x532.google.com with SMTP id
 4fb4d7f45d1cf-5e5c7d6b96fso8327622a12.3
 for <xen-devel@lists.xenproject.org>; Mon, 14 Apr 2025 08:56:47 -0700 (PDT)
Received: from fedora.. (user-109-243-64-225.play-internet.pl.
 [109.243.64.225]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-acaa1cb4288sm951760866b.96.2025.04.14.08.56.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Apr 2025 08:56:46 -0700 (PDT)
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
X-Inumbo-ID: 1217939f-1949-11f0-9eae-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744646207; x=1745251007; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7xXk8n5tiuPiaJ2LAGcxcApCGF2bFVEp873eW1/6Bqs=;
        b=Cnpdu2GucD+Gxs61H7bNWvwsoA91HiQUXcsj8ZDxte8IVuykDnU+EhN+NdVYO1sPAY
         kbg48pwsP+W3vCoI0YFMa1MB66gbnhN89hmaciNqCSvU72FaKHZnYKHk5OsPreHb3Dm4
         dsZwWGGiBnAJHkqQxZbxyB7uF7jGz4gSjoExGb9a15pEthPivN8r9CbeiXeh0Z4AYvBa
         U5t/RvR8Wc0o2z38ydJfFyc30M6PXjyUdot+EcFTAe8bOaIMZ7fH+o9S54LkDfixp2BM
         9XfLJ1ol4StHzXzUmccl7AsLH4r4vEQmTse1+jcw2USEwavIPvUFqTsNcnL/0Q9VeTFx
         qb+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744646207; x=1745251007;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7xXk8n5tiuPiaJ2LAGcxcApCGF2bFVEp873eW1/6Bqs=;
        b=bfcCUp0rkQOutAxg34B5VRZo3+mHwRWl008uOSeE4Be9giaX8K9IOzSUKkJgPdAwgO
         CNc7F282/rnLcdktjmlfFdsHpDcd9EcIQdF4xSsX0fRHsyrY5fbQ/6MZ0WA8sh2xqg9I
         ESCLAmV99jDgl3lqJcaskvzqXXHDpEMN8miFlBOxO0fsdMzFHof7XwJGMizAPeWT/NGq
         BHS4TDbcSz6TLsGKMyQxcMGatGYU7y0XILtY4mQbxpGBPCe+O7XAjN7GtKkCHBP0oUH6
         lfhCfLM8nL9c9Ug87MNwdFhXQaCG6DFKs9Jy7YHBTiw/EQsFOaWs6pZUEOcAeC6/8BIo
         qN2g==
X-Gm-Message-State: AOJu0YwFDEMGkXFl5uebhoPOsbLl2VdYkWHYGpM/dlzXAmp4qGbTyqen
	aLFWTt68bhJPypvFT/nKFtK1Pe3J6KqgXepKMMxcl5trnukRAgcTPASKcg==
X-Gm-Gg: ASbGnct1EdXc1i08NvmNY3JElmIgcuBCWO2KROeCWpLEbQBeUuVlzH637kwKlBnc0Wx
	XiYEJ2nY2lflveB+AHsqLdr0HSSHrqdsxJMlPAFv3piUUiGilLx01x95rY4Hwo5PtWsZSuugwn0
	d/4OM/L6fLwRwmICiuRdfhRmTrI6wiRin2NC1kMN/RB8LgP7pnUPPvspVuA+PV2NNWKNaNO2zGn
	9MOalfRhySz7spLggS0bgG7jth7A/Us7u2ZmRf25KrKuETSOIGBBXNh/vi3/NZOeuQx78fxLG9k
	G5igxbPyN5eW2ipbfy8pi/24WjxWpEkrxrbOvyAgxzuSqYAppICf2JZmHJJ6jgdqkKQTOD86opm
	SuKHThvb8mngMGjYpITpK
X-Google-Smtp-Source: AGHT+IFouBH0yq3agxvOsTISd3+AK5jSrx3hH9W+fwnU0fTwrzZR3ITlBYr5zXc9VWJoi9nJ5X6fPA==
X-Received: by 2002:a17:906:dc94:b0:ac7:3a23:569c with SMTP id a640c23a62f3a-acad34468e4mr1329138866b.1.1744646206456;
        Mon, 14 Apr 2025 08:56:46 -0700 (PDT)
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
Subject: [PATCH v2 2/8] xen/common: dom0less: make some parts of Arm's CONFIG_DOM0LESS common
Date: Mon, 14 Apr 2025 17:56:35 +0200
Message-ID: <c31977cb20be408ac695ec44edaa6e058e6ec10f.1744626032.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <cover.1744626032.git.oleksii.kurochko@gmail.com>
References: <cover.1744626032.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Move some parts of Arm's Dom0Less code to be reused by other architectures.
At the moment, RISC-V is going to reuse these parts.

Move dom0less-build.h from the Arm-specific directory to asm-generic
as these header is expected to be the same across acrhictectures with
some updates: add the following declaration of construct_domU(),
arch_xen_domctl_createdomain() and arch_create_domus() as there are
some parts which are still architecture-specific.

Introduce HAS_DOM0LESS to provide ability to enable generic Dom0less
code for an architecture.

Relocate the CONFIG_DOM0LESS configuration to the common with adding
"depends on HAS_DOM0LESS" to not break builds for architectures which
don't support CONFIG_DOM0LESS config, especically it would be useful
to not provide stubs for  construct_domU(), arch_xen_domctl_createdomain()
and arch_create_domus() in case of *-randconfig which may set
CONFIG_DOM0LESS=y.

Move is_dom0less_mode() function to the common code, as it depends on
boot modules that are already part of the common code.

Move create_domUs() function to the common code with some updates:
- Add function arch_xen_domctl_createdomain() as structure
  xen_domctl_createdomain may have some arch-spicific information and
  initialization.
- Add arch_create_domus() to cover parsing of arch-specific features,
  for example, SVE (Scalar Vector Extension ) exists only in Arm.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
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
 xen/arch/arm/dom0less-build.c             | 270 ++++++----------------
 xen/arch/arm/include/asm/Makefile         |   1 +
 xen/arch/arm/include/asm/dom0less-build.h |  32 ---
 xen/common/Kconfig                        |  12 +
 xen/common/device-tree/Makefile           |   1 +
 xen/common/device-tree/dom0less-build.c   | 161 +++++++++++++
 xen/include/asm-generic/dom0less-build.h  |  40 ++++
 8 files changed, 287 insertions(+), 239 deletions(-)
 delete mode 100644 xen/arch/arm/include/asm/dom0less-build.h
 create mode 100644 xen/common/device-tree/dom0less-build.c
 create mode 100644 xen/include/asm-generic/dom0less-build.h

diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
index 565f288331..060389c3c8 100644
--- a/xen/arch/arm/Kconfig
+++ b/xen/arch/arm/Kconfig
@@ -15,6 +15,7 @@ config ARM
 	select GENERIC_UART_INIT
 	select HAS_ALTERNATIVE if HAS_VMAP
 	select HAS_DEVICE_TREE
+	select HAS_DOM0LESS
 	select HAS_UBSAN
 
 config ARCH_DEFCONFIG
@@ -119,14 +120,6 @@ config GICV2
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
index bd15563750..7ec3f85795 100644
--- a/xen/arch/arm/dom0less-build.c
+++ b/xen/arch/arm/dom0less-build.c
@@ -20,38 +20,6 @@
 #include <asm/static-memory.h>
 #include <asm/static-shmem.h>
 
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
-
 #ifdef CONFIG_VGICV2
 static int __init make_gicv2_domU_node(struct kernel_info *kinfo)
 {
@@ -869,8 +837,8 @@ static inline int domain_p2m_set_allocation(struct domain *d, uint64_t mem,
 }
 #endif /* CONFIG_ARCH_PAGING_MEMPOOL */
 
-static int __init construct_domU(struct domain *d,
-                                 const struct dt_device_node *node)
+int __init construct_domU(struct domain *d,
+                          const struct dt_device_node *node)
 {
     struct kernel_info kinfo = KERNEL_INFO_INIT;
     const char *dom0less_enhanced;
@@ -965,188 +933,92 @@ static int __init construct_domU(struct domain *d,
     return alloc_xenstore_params(&kinfo);
 }
 
-void __init create_domUs(void)
-{
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
-        uint32_t val;
-        int rc;
-
-        if ( !dt_device_is_compatible(node, "xen,domain") )
-            continue;
-
-        if ( (max_init_domid + 1) >= DOMID_FIRST_RESERVED )
-            panic("No more domain IDs available\n");
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
 
-        if ( !dt_property_read_u32(node, "cpus", &d_cfg.max_vcpus) )
-            panic("Missing property 'cpus' for domain %s\n",
-                  dt_node_name(node));
-
-        if ( !dt_property_read_string(node, "passthrough", &dom0less_iommu) &&
-             !strcmp(dom0less_iommu, "enabled") )
-            iommu = true;
+struct xen_domctl_createdomain __init arch_xen_domctl_createdomain(void)
+{
+    struct xen_domctl_createdomain d_cfg = {
+        .arch.gic_version = XEN_DOMCTL_CONFIG_GIC_NATIVE,
+        .flags = XEN_DOMCTL_CDF_hvm | XEN_DOMCTL_CDF_hap,
+        /*
+            * The default of 1023 should be sufficient for guests because
+            * on ARM we don't bind physical interrupts to event channels.
+            * The only use of the evtchn port is inter-domain communications.
+            * 1023 is also the default value used in libxl.
+            */
+        .max_evtchn_port = 1023,
+        .max_grant_frames = -1,
+        .max_maptrack_frames = -1,
+        .grant_opts = XEN_DOMCTL_GRANT_version(opt_gnttab_max_version),
+    };
+
+    return d_cfg;
+}
 
-        if ( iommu_enabled &&
-             (iommu || dt_find_compatible_node(node, NULL,
-                                               "multiboot,device-tree")) )
-            d_cfg.flags |= XEN_DOMCTL_CDF_iommu;
+void __init arch_create_domus(struct dt_device_node *node,
+                       struct xen_domctl_createdomain *d_cfg,
+                       unsigned int flags)
+{
+    uint32_t val;
 
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
+         * vpl011 uses one emulated SPI. If vpl011 is requested, make
+         * sure that we allocate enough SPIs for it.
+         */
+        if ( dt_property_read_bool(node, "vpl011") )
+            d_cfg->arch.nr_spis = MAX(d_cfg->arch.nr_spis,
+                                      vpl011_virq - 32 + 1);
+    }
 
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
     }
 }
 
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
index 5864944bda..0000000000
--- a/xen/arch/arm/include/asm/dom0less-build.h
+++ /dev/null
@@ -1,32 +0,0 @@
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
-
-#else /* !CONFIG_DOM0LESS_BOOT */
-
-static inline void create_domUs(void) {}
-static inline bool is_dom0less_mode(void)
-{
-    return false;
-}
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
index 06ae9751aa..2fd79aea5b 100644
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
@@ -73,6 +82,9 @@ config HAS_COMPAT
 config HAS_DEVICE_TREE
 	bool
 
+config HAS_DOM0LESS
+	bool
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
index 0000000000..19bfa5e005
--- /dev/null
+++ b/xen/common/device-tree/dom0less-build.c
@@ -0,0 +1,161 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+#include <xen/bootfdt.h>
+#include <xen/device_tree.h>
+#include <xen/domain.h>
+#include <xen/err.h>
+#include <xen/init.h>
+#include <xen/iommu.h>
+#include <xen/llc-coloring.h>
+#include <xen/sched.h>
+#include <xen/stdbool.h>
+#include <xen/types.h>
+
+#include <public/domctl.h>
+
+#include <asm/dom0less-build.h>
+#include <asm/setup.h>
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
+        struct xen_domctl_createdomain d_cfg = arch_xen_domctl_createdomain();
+        unsigned int flags = 0U;
+        uint32_t val;
+        int rc;
+
+        if ( !dt_device_is_compatible(node, "xen,domain") )
+            continue;
+
+        if ( (max_init_domid + 1) >= DOMID_FIRST_RESERVED )
+            panic("No more domain IDs available\n");
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
+        if ( !dt_property_read_string(node, "passthrough", &dom0less_iommu) &&
+             !strcmp(dom0less_iommu, "enabled") )
+            iommu = true;
+
+        if ( iommu_enabled &&
+             (iommu || dt_find_compatible_node(node, NULL,
+                                               "multiboot,device-tree")) )
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
+        arch_create_domus(node, &d_cfg, flags);
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
+    }
+}
diff --git a/xen/include/asm-generic/dom0less-build.h b/xen/include/asm-generic/dom0less-build.h
new file mode 100644
index 0000000000..a6985bc20a
--- /dev/null
+++ b/xen/include/asm-generic/dom0less-build.h
@@ -0,0 +1,40 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+#ifndef __ASM_GENERIC_DOM0LESS_BUILD_H__
+#define __ASM_GENERIC_DOM0LESS_BUILD_H__
+
+#include <xen/stdbool.h>
+
+#ifdef CONFIG_DOM0LESS_BOOT
+
+#include <public/domctl.h>
+
+void create_domUs(void);
+bool is_dom0less_mode(void);
+
+int construct_domU(struct domain *d, const struct dt_device_node *node);
+
+struct xen_domctl_createdomain arch_xen_domctl_createdomain(void);
+void arch_create_domus(struct dt_device_node *node,
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


