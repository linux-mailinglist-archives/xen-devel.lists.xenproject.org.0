Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 02E5D32B9B2
	for <lists+xen-devel@lfdr.de>; Wed,  3 Mar 2021 19:09:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.92929.175287 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lHVQf-0008Hv-Fb; Wed, 03 Mar 2021 17:36:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 92929.175287; Wed, 03 Mar 2021 17:36:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lHVQf-0008HI-B3; Wed, 03 Mar 2021 17:36:57 +0000
Received: by outflank-mailman (input) for mailman id 92929;
 Wed, 03 Mar 2021 17:36:55 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Voz6=IB=linaro.org=alex.bennee@srs-us1.protection.inumbo.net>)
 id 1lHVQd-0008CL-SG
 for xen-devel@lists.xenproject.org; Wed, 03 Mar 2021 17:36:55 +0000
Received: from mail-wr1-x432.google.com (unknown [2a00:1450:4864:20::432])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 595badfa-9111-40ec-b0f7-625827251f94;
 Wed, 03 Mar 2021 17:36:48 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id d15so9372500wrv.5
 for <xen-devel@lists.xenproject.org>; Wed, 03 Mar 2021 09:36:48 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id u20sm6484722wru.6.2021.03.03.09.36.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Mar 2021 09:36:43 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 630801FF87;
 Wed,  3 Mar 2021 17:36:42 +0000 (GMT)
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
X-Inumbo-ID: 595badfa-9111-40ec-b0f7-625827251f94
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=0OYLtffMHjoeULYxORVSwyMDS5IixWGI4yHOSzBjN8g=;
        b=CTxEFHao09x0mVNR15UBaQCNm95KAPCvyFCYc+2S3Pq52/Z33meUC253V0H5aXnPqC
         DlKpOr6iqWDbyGG+u1Nn3Tlb8vlX/u8x/AhY54VoUORa2GoBW43L3Y+JCu1+CRweUZ0M
         7yU8ZdxmLepUI+l1flReLVKkGUPIeNwuCXSMwfuqJSJmMIx8B8tUyc0tlxRwkOTVfOjf
         0SdcIXyavBI6WPoHvyiqMsyJ+IEecn7/Jq8Izdka9rlw5oWpl4mhGvD8Nf5x7gW3w6DD
         hG2swfB7pB6EWSKo0QM/Dhhd7pEtG6icfoiOo1C/hVO4jjW+4vVK9ZXYkGLvXSmuiHfp
         CztQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=0OYLtffMHjoeULYxORVSwyMDS5IixWGI4yHOSzBjN8g=;
        b=hVKl+y0rAhnm9gCWLxZRXf+lcQI2boZwQmVQH5fsEOeMFuyxiKV0DuxKeg+J52SkP+
         hmgbn2UCvrYfh9XKmbHFgAzDg9hRPKBd8vOQjweD6oYGSNiZubzmdpA/4DIdPRTYgdHr
         mMW9+wvCHD+Bfwk3OZ2VUuuQTzIbFNWMBR7oAe2aq67J2mknV7oaDGqMV50dwfowY6y/
         BwwkHxkwVDCMFwZTm850i6BemOFuI2s4Bt6xHJRSzCERXpVlzoa9gwN880ffr7jP5AKr
         eRxUa6lAuz6akoV+5MOVoLCCHp0yJViuvEknvc6oBuADCcz6FT7F102EEaU2brB0/MhG
         YjlA==
X-Gm-Message-State: AOAM531x8veNtr1xSfZXvF21aexq5A+hEfwTLMGhIw5Olpnpn4/tjJQE
	O4v4EukQu1rEBnHtileFFF1S1A==
X-Google-Smtp-Source: ABdhPJxbdxTK2JI4/kLmBhz91HUyT64aL1xs811lS97/wMHiyIFtAX2Zh6XpYs1z94zYG+0LEVGSnQ==
X-Received: by 2002:a5d:5047:: with SMTP id h7mr17732275wrt.111.1614793007061;
        Wed, 03 Mar 2021 09:36:47 -0800 (PST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: julien@xen.org,
	stefano.stabellini@linaro.org,
	stefano.stabellini@xilinx.com,
	andre.przywara@arm.com,
	stratos-dev@op-lists.linaro.org,
	xen-devel@lists.xenproject.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Eduardo Habkost <ehabkost@redhat.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	qemu-arm@nongnu.org (open list:Virt)
Subject: [PATCH  v3 1/7] hw/board: promote fdt from ARM VirtMachineState to MachineState
Date: Wed,  3 Mar 2021 17:36:36 +0000
Message-Id: <20210303173642.3805-2-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210303173642.3805-1-alex.bennee@linaro.org>
References: <20210303173642.3805-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The use of FDT's is quite common across our various platforms. To
allow the guest loader to tweak it we need to make it available in
the generic state. This creates the field and migrates the initial
user to use the generic field. Other boards will be updated in later
patches.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Message-Id: <20210211171945.18313-2-alex.bennee@linaro.org>
---
 include/hw/arm/virt.h |   1 -
 include/hw/boards.h   |   1 +
 hw/arm/virt.c         | 356 ++++++++++++++++++++++--------------------
 3 files changed, 186 insertions(+), 172 deletions(-)

diff --git a/include/hw/arm/virt.h b/include/hw/arm/virt.h
index ee9a93101e..921416f918 100644
--- a/include/hw/arm/virt.h
+++ b/include/hw/arm/virt.h
@@ -153,7 +153,6 @@ struct VirtMachineState {
     MemMapEntry *memmap;
     char *pciehb_nodename;
     const int *irqmap;
-    void *fdt;
     int fdt_size;
     uint32_t clock_phandle;
     uint32_t gic_phandle;
diff --git a/include/hw/boards.h b/include/hw/boards.h
index a46dfe5d1a..5fda5fd128 100644
--- a/include/hw/boards.h
+++ b/include/hw/boards.h
@@ -258,6 +258,7 @@ struct MachineState {
 
     /*< public >*/
 
+    void *fdt;
     char *dtb;
     char *dumpdtb;
     int phandle_start;
diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 371147f3ae..c08bf11297 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -218,14 +218,14 @@ static bool cpu_type_valid(const char *cpu)
     return false;
 }
 
-static void create_kaslr_seed(VirtMachineState *vms, const char *node)
+static void create_kaslr_seed(MachineState *ms, const char *node)
 {
     uint64_t seed;
 
     if (qemu_guest_getrandom(&seed, sizeof(seed), NULL)) {
         return;
     }
-    qemu_fdt_setprop_u64(vms->fdt, node, "kaslr-seed", seed);
+    qemu_fdt_setprop_u64(ms->fdt, node, "kaslr-seed", seed);
 }
 
 static void create_fdt(VirtMachineState *vms)
@@ -239,7 +239,7 @@ static void create_fdt(VirtMachineState *vms)
         exit(1);
     }
 
-    vms->fdt = fdt;
+    ms->fdt = fdt;
 
     /* Header */
     qemu_fdt_setprop_string(fdt, "/", "compatible", "linux,dummy-virt");
@@ -248,11 +248,11 @@ static void create_fdt(VirtMachineState *vms)
 
     /* /chosen must exist for load_dtb to fill in necessary properties later */
     qemu_fdt_add_subnode(fdt, "/chosen");
-    create_kaslr_seed(vms, "/chosen");
+    create_kaslr_seed(ms, "/chosen");
 
     if (vms->secure) {
         qemu_fdt_add_subnode(fdt, "/secure-chosen");
-        create_kaslr_seed(vms, "/secure-chosen");
+        create_kaslr_seed(ms, "/secure-chosen");
     }
 
     /* Clock node, for the benefit of the UART. The kernel device tree
@@ -316,6 +316,7 @@ static void fdt_add_timer_nodes(const VirtMachineState *vms)
     ARMCPU *armcpu;
     VirtMachineClass *vmc = VIRT_MACHINE_GET_CLASS(vms);
     uint32_t irqflags = GIC_FDT_IRQ_FLAGS_LEVEL_HI;
+    MachineState *ms = MACHINE(vms);
 
     if (vmc->claim_edge_triggered_timers) {
         irqflags = GIC_FDT_IRQ_FLAGS_EDGE_LO_HI;
@@ -327,19 +328,19 @@ static void fdt_add_timer_nodes(const VirtMachineState *vms)
                              (1 << MACHINE(vms)->smp.cpus) - 1);
     }
 
-    qemu_fdt_add_subnode(vms->fdt, "/timer");
+    qemu_fdt_add_subnode(ms->fdt, "/timer");
 
     armcpu = ARM_CPU(qemu_get_cpu(0));
     if (arm_feature(&armcpu->env, ARM_FEATURE_V8)) {
         const char compat[] = "arm,armv8-timer\0arm,armv7-timer";
-        qemu_fdt_setprop(vms->fdt, "/timer", "compatible",
+        qemu_fdt_setprop(ms->fdt, "/timer", "compatible",
                          compat, sizeof(compat));
     } else {
-        qemu_fdt_setprop_string(vms->fdt, "/timer", "compatible",
+        qemu_fdt_setprop_string(ms->fdt, "/timer", "compatible",
                                 "arm,armv7-timer");
     }
-    qemu_fdt_setprop(vms->fdt, "/timer", "always-on", NULL, 0);
-    qemu_fdt_setprop_cells(vms->fdt, "/timer", "interrupts",
+    qemu_fdt_setprop(ms->fdt, "/timer", "always-on", NULL, 0);
+    qemu_fdt_setprop_cells(ms->fdt, "/timer", "interrupts",
                        GIC_FDT_IRQ_TYPE_PPI, ARCH_TIMER_S_EL1_IRQ, irqflags,
                        GIC_FDT_IRQ_TYPE_PPI, ARCH_TIMER_NS_EL1_IRQ, irqflags,
                        GIC_FDT_IRQ_TYPE_PPI, ARCH_TIMER_VIRT_IRQ, irqflags,
@@ -375,35 +376,35 @@ static void fdt_add_cpu_nodes(const VirtMachineState *vms)
         }
     }
 
-    qemu_fdt_add_subnode(vms->fdt, "/cpus");
-    qemu_fdt_setprop_cell(vms->fdt, "/cpus", "#address-cells", addr_cells);
-    qemu_fdt_setprop_cell(vms->fdt, "/cpus", "#size-cells", 0x0);
+    qemu_fdt_add_subnode(ms->fdt, "/cpus");
+    qemu_fdt_setprop_cell(ms->fdt, "/cpus", "#address-cells", addr_cells);
+    qemu_fdt_setprop_cell(ms->fdt, "/cpus", "#size-cells", 0x0);
 
     for (cpu = smp_cpus - 1; cpu >= 0; cpu--) {
         char *nodename = g_strdup_printf("/cpus/cpu@%d", cpu);
         ARMCPU *armcpu = ARM_CPU(qemu_get_cpu(cpu));
         CPUState *cs = CPU(armcpu);
 
-        qemu_fdt_add_subnode(vms->fdt, nodename);
-        qemu_fdt_setprop_string(vms->fdt, nodename, "device_type", "cpu");
-        qemu_fdt_setprop_string(vms->fdt, nodename, "compatible",
+        qemu_fdt_add_subnode(ms->fdt, nodename);
+        qemu_fdt_setprop_string(ms->fdt, nodename, "device_type", "cpu");
+        qemu_fdt_setprop_string(ms->fdt, nodename, "compatible",
                                     armcpu->dtb_compatible);
 
         if (vms->psci_conduit != QEMU_PSCI_CONDUIT_DISABLED && smp_cpus > 1) {
-            qemu_fdt_setprop_string(vms->fdt, nodename,
+            qemu_fdt_setprop_string(ms->fdt, nodename,
                                         "enable-method", "psci");
         }
 
         if (addr_cells == 2) {
-            qemu_fdt_setprop_u64(vms->fdt, nodename, "reg",
+            qemu_fdt_setprop_u64(ms->fdt, nodename, "reg",
                                  armcpu->mp_affinity);
         } else {
-            qemu_fdt_setprop_cell(vms->fdt, nodename, "reg",
+            qemu_fdt_setprop_cell(ms->fdt, nodename, "reg",
                                   armcpu->mp_affinity);
         }
 
         if (ms->possible_cpus->cpus[cs->cpu_index].props.has_node_id) {
-            qemu_fdt_setprop_cell(vms->fdt, nodename, "numa-node-id",
+            qemu_fdt_setprop_cell(ms->fdt, nodename, "numa-node-id",
                 ms->possible_cpus->cpus[cs->cpu_index].props.node_id);
         }
 
@@ -414,71 +415,74 @@ static void fdt_add_cpu_nodes(const VirtMachineState *vms)
 static void fdt_add_its_gic_node(VirtMachineState *vms)
 {
     char *nodename;
+    MachineState *ms = MACHINE(vms);
 
-    vms->msi_phandle = qemu_fdt_alloc_phandle(vms->fdt);
+    vms->msi_phandle = qemu_fdt_alloc_phandle(ms->fdt);
     nodename = g_strdup_printf("/intc/its@%" PRIx64,
                                vms->memmap[VIRT_GIC_ITS].base);
-    qemu_fdt_add_subnode(vms->fdt, nodename);
-    qemu_fdt_setprop_string(vms->fdt, nodename, "compatible",
+    qemu_fdt_add_subnode(ms->fdt, nodename);
+    qemu_fdt_setprop_string(ms->fdt, nodename, "compatible",
                             "arm,gic-v3-its");
-    qemu_fdt_setprop(vms->fdt, nodename, "msi-controller", NULL, 0);
-    qemu_fdt_setprop_sized_cells(vms->fdt, nodename, "reg",
+    qemu_fdt_setprop(ms->fdt, nodename, "msi-controller", NULL, 0);
+    qemu_fdt_setprop_sized_cells(ms->fdt, nodename, "reg",
                                  2, vms->memmap[VIRT_GIC_ITS].base,
                                  2, vms->memmap[VIRT_GIC_ITS].size);
-    qemu_fdt_setprop_cell(vms->fdt, nodename, "phandle", vms->msi_phandle);
+    qemu_fdt_setprop_cell(ms->fdt, nodename, "phandle", vms->msi_phandle);
     g_free(nodename);
 }
 
 static void fdt_add_v2m_gic_node(VirtMachineState *vms)
 {
+    MachineState *ms = MACHINE(vms);
     char *nodename;
 
     nodename = g_strdup_printf("/intc/v2m@%" PRIx64,
                                vms->memmap[VIRT_GIC_V2M].base);
-    vms->msi_phandle = qemu_fdt_alloc_phandle(vms->fdt);
-    qemu_fdt_add_subnode(vms->fdt, nodename);
-    qemu_fdt_setprop_string(vms->fdt, nodename, "compatible",
+    vms->msi_phandle = qemu_fdt_alloc_phandle(ms->fdt);
+    qemu_fdt_add_subnode(ms->fdt, nodename);
+    qemu_fdt_setprop_string(ms->fdt, nodename, "compatible",
                             "arm,gic-v2m-frame");
-    qemu_fdt_setprop(vms->fdt, nodename, "msi-controller", NULL, 0);
-    qemu_fdt_setprop_sized_cells(vms->fdt, nodename, "reg",
+    qemu_fdt_setprop(ms->fdt, nodename, "msi-controller", NULL, 0);
+    qemu_fdt_setprop_sized_cells(ms->fdt, nodename, "reg",
                                  2, vms->memmap[VIRT_GIC_V2M].base,
                                  2, vms->memmap[VIRT_GIC_V2M].size);
-    qemu_fdt_setprop_cell(vms->fdt, nodename, "phandle", vms->msi_phandle);
+    qemu_fdt_setprop_cell(ms->fdt, nodename, "phandle", vms->msi_phandle);
     g_free(nodename);
 }
 
 static void fdt_add_gic_node(VirtMachineState *vms)
 {
+    MachineState *ms = MACHINE(vms);
     char *nodename;
 
-    vms->gic_phandle = qemu_fdt_alloc_phandle(vms->fdt);
-    qemu_fdt_setprop_cell(vms->fdt, "/", "interrupt-parent", vms->gic_phandle);
+    vms->gic_phandle = qemu_fdt_alloc_phandle(ms->fdt);
+    qemu_fdt_setprop_cell(ms->fdt, "/", "interrupt-parent", vms->gic_phandle);
 
     nodename = g_strdup_printf("/intc@%" PRIx64,
                                vms->memmap[VIRT_GIC_DIST].base);
-    qemu_fdt_add_subnode(vms->fdt, nodename);
-    qemu_fdt_setprop_cell(vms->fdt, nodename, "#interrupt-cells", 3);
-    qemu_fdt_setprop(vms->fdt, nodename, "interrupt-controller", NULL, 0);
-    qemu_fdt_setprop_cell(vms->fdt, nodename, "#address-cells", 0x2);
-    qemu_fdt_setprop_cell(vms->fdt, nodename, "#size-cells", 0x2);
-    qemu_fdt_setprop(vms->fdt, nodename, "ranges", NULL, 0);
+    qemu_fdt_add_subnode(ms->fdt, nodename);
+    qemu_fdt_setprop_cell(ms->fdt, nodename, "#interrupt-cells", 3);
+    qemu_fdt_setprop(ms->fdt, nodename, "interrupt-controller", NULL, 0);
+    qemu_fdt_setprop_cell(ms->fdt, nodename, "#address-cells", 0x2);
+    qemu_fdt_setprop_cell(ms->fdt, nodename, "#size-cells", 0x2);
+    qemu_fdt_setprop(ms->fdt, nodename, "ranges", NULL, 0);
     if (vms->gic_version == VIRT_GIC_VERSION_3) {
         int nb_redist_regions = virt_gicv3_redist_region_count(vms);
 
-        qemu_fdt_setprop_string(vms->fdt, nodename, "compatible",
+        qemu_fdt_setprop_string(ms->fdt, nodename, "compatible",
                                 "arm,gic-v3");
 
-        qemu_fdt_setprop_cell(vms->fdt, nodename,
+        qemu_fdt_setprop_cell(ms->fdt, nodename,
                               "#redistributor-regions", nb_redist_regions);
 
         if (nb_redist_regions == 1) {
-            qemu_fdt_setprop_sized_cells(vms->fdt, nodename, "reg",
+            qemu_fdt_setprop_sized_cells(ms->fdt, nodename, "reg",
                                          2, vms->memmap[VIRT_GIC_DIST].base,
                                          2, vms->memmap[VIRT_GIC_DIST].size,
                                          2, vms->memmap[VIRT_GIC_REDIST].base,
                                          2, vms->memmap[VIRT_GIC_REDIST].size);
         } else {
-            qemu_fdt_setprop_sized_cells(vms->fdt, nodename, "reg",
+            qemu_fdt_setprop_sized_cells(ms->fdt, nodename, "reg",
                                  2, vms->memmap[VIRT_GIC_DIST].base,
                                  2, vms->memmap[VIRT_GIC_DIST].size,
                                  2, vms->memmap[VIRT_GIC_REDIST].base,
@@ -488,22 +492,22 @@ static void fdt_add_gic_node(VirtMachineState *vms)
         }
 
         if (vms->virt) {
-            qemu_fdt_setprop_cells(vms->fdt, nodename, "interrupts",
+            qemu_fdt_setprop_cells(ms->fdt, nodename, "interrupts",
                                    GIC_FDT_IRQ_TYPE_PPI, ARCH_GIC_MAINT_IRQ,
                                    GIC_FDT_IRQ_FLAGS_LEVEL_HI);
         }
     } else {
         /* 'cortex-a15-gic' means 'GIC v2' */
-        qemu_fdt_setprop_string(vms->fdt, nodename, "compatible",
+        qemu_fdt_setprop_string(ms->fdt, nodename, "compatible",
                                 "arm,cortex-a15-gic");
         if (!vms->virt) {
-            qemu_fdt_setprop_sized_cells(vms->fdt, nodename, "reg",
+            qemu_fdt_setprop_sized_cells(ms->fdt, nodename, "reg",
                                          2, vms->memmap[VIRT_GIC_DIST].base,
                                          2, vms->memmap[VIRT_GIC_DIST].size,
                                          2, vms->memmap[VIRT_GIC_CPU].base,
                                          2, vms->memmap[VIRT_GIC_CPU].size);
         } else {
-            qemu_fdt_setprop_sized_cells(vms->fdt, nodename, "reg",
+            qemu_fdt_setprop_sized_cells(ms->fdt, nodename, "reg",
                                          2, vms->memmap[VIRT_GIC_DIST].base,
                                          2, vms->memmap[VIRT_GIC_DIST].size,
                                          2, vms->memmap[VIRT_GIC_CPU].base,
@@ -512,13 +516,13 @@ static void fdt_add_gic_node(VirtMachineState *vms)
                                          2, vms->memmap[VIRT_GIC_HYP].size,
                                          2, vms->memmap[VIRT_GIC_VCPU].base,
                                          2, vms->memmap[VIRT_GIC_VCPU].size);
-            qemu_fdt_setprop_cells(vms->fdt, nodename, "interrupts",
+            qemu_fdt_setprop_cells(ms->fdt, nodename, "interrupts",
                                    GIC_FDT_IRQ_TYPE_PPI, ARCH_GIC_MAINT_IRQ,
                                    GIC_FDT_IRQ_FLAGS_LEVEL_HI);
         }
     }
 
-    qemu_fdt_setprop_cell(vms->fdt, nodename, "phandle", vms->gic_phandle);
+    qemu_fdt_setprop_cell(ms->fdt, nodename, "phandle", vms->gic_phandle);
     g_free(nodename);
 }
 
@@ -526,6 +530,7 @@ static void fdt_add_pmu_nodes(const VirtMachineState *vms)
 {
     ARMCPU *armcpu = ARM_CPU(first_cpu);
     uint32_t irqflags = GIC_FDT_IRQ_FLAGS_LEVEL_HI;
+    MachineState *ms = MACHINE(vms);
 
     if (!arm_feature(&armcpu->env, ARM_FEATURE_PMU)) {
         assert(!object_property_get_bool(OBJECT(armcpu), "pmu", NULL));
@@ -538,12 +543,12 @@ static void fdt_add_pmu_nodes(const VirtMachineState *vms)
                              (1 << MACHINE(vms)->smp.cpus) - 1);
     }
 
-    qemu_fdt_add_subnode(vms->fdt, "/pmu");
+    qemu_fdt_add_subnode(ms->fdt, "/pmu");
     if (arm_feature(&armcpu->env, ARM_FEATURE_V8)) {
         const char compat[] = "arm,armv8-pmuv3";
-        qemu_fdt_setprop(vms->fdt, "/pmu", "compatible",
+        qemu_fdt_setprop(ms->fdt, "/pmu", "compatible",
                          compat, sizeof(compat));
-        qemu_fdt_setprop_cells(vms->fdt, "/pmu", "interrupts",
+        qemu_fdt_setprop_cells(ms->fdt, "/pmu", "interrupts",
                                GIC_FDT_IRQ_TYPE_PPI, VIRTUAL_PMU_IRQ, irqflags);
     }
 }
@@ -749,6 +754,7 @@ static void create_uart(const VirtMachineState *vms, int uart,
     const char clocknames[] = "uartclk\0apb_pclk";
     DeviceState *dev = qdev_new(TYPE_PL011);
     SysBusDevice *s = SYS_BUS_DEVICE(dev);
+    MachineState *ms = MACHINE(vms);
 
     qdev_prop_set_chr(dev, "chardev", chr);
     sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
@@ -757,28 +763,28 @@ static void create_uart(const VirtMachineState *vms, int uart,
     sysbus_connect_irq(s, 0, qdev_get_gpio_in(vms->gic, irq));
 
     nodename = g_strdup_printf("/pl011@%" PRIx64, base);
-    qemu_fdt_add_subnode(vms->fdt, nodename);
+    qemu_fdt_add_subnode(ms->fdt, nodename);
     /* Note that we can't use setprop_string because of the embedded NUL */
-    qemu_fdt_setprop(vms->fdt, nodename, "compatible",
+    qemu_fdt_setprop(ms->fdt, nodename, "compatible",
                          compat, sizeof(compat));
-    qemu_fdt_setprop_sized_cells(vms->fdt, nodename, "reg",
+    qemu_fdt_setprop_sized_cells(ms->fdt, nodename, "reg",
                                      2, base, 2, size);
-    qemu_fdt_setprop_cells(vms->fdt, nodename, "interrupts",
+    qemu_fdt_setprop_cells(ms->fdt, nodename, "interrupts",
                                GIC_FDT_IRQ_TYPE_SPI, irq,
                                GIC_FDT_IRQ_FLAGS_LEVEL_HI);
-    qemu_fdt_setprop_cells(vms->fdt, nodename, "clocks",
+    qemu_fdt_setprop_cells(ms->fdt, nodename, "clocks",
                                vms->clock_phandle, vms->clock_phandle);
-    qemu_fdt_setprop(vms->fdt, nodename, "clock-names",
+    qemu_fdt_setprop(ms->fdt, nodename, "clock-names",
                          clocknames, sizeof(clocknames));
 
     if (uart == VIRT_UART) {
-        qemu_fdt_setprop_string(vms->fdt, "/chosen", "stdout-path", nodename);
+        qemu_fdt_setprop_string(ms->fdt, "/chosen", "stdout-path", nodename);
     } else {
         /* Mark as not usable by the normal world */
-        qemu_fdt_setprop_string(vms->fdt, nodename, "status", "disabled");
-        qemu_fdt_setprop_string(vms->fdt, nodename, "secure-status", "okay");
+        qemu_fdt_setprop_string(ms->fdt, nodename, "status", "disabled");
+        qemu_fdt_setprop_string(ms->fdt, nodename, "secure-status", "okay");
 
-        qemu_fdt_setprop_string(vms->fdt, "/secure-chosen", "stdout-path",
+        qemu_fdt_setprop_string(ms->fdt, "/secure-chosen", "stdout-path",
                                 nodename);
     }
 
@@ -792,19 +798,20 @@ static void create_rtc(const VirtMachineState *vms)
     hwaddr size = vms->memmap[VIRT_RTC].size;
     int irq = vms->irqmap[VIRT_RTC];
     const char compat[] = "arm,pl031\0arm,primecell";
+    MachineState *ms = MACHINE(vms);
 
     sysbus_create_simple("pl031", base, qdev_get_gpio_in(vms->gic, irq));
 
     nodename = g_strdup_printf("/pl031@%" PRIx64, base);
-    qemu_fdt_add_subnode(vms->fdt, nodename);
-    qemu_fdt_setprop(vms->fdt, nodename, "compatible", compat, sizeof(compat));
-    qemu_fdt_setprop_sized_cells(vms->fdt, nodename, "reg",
+    qemu_fdt_add_subnode(ms->fdt, nodename);
+    qemu_fdt_setprop(ms->fdt, nodename, "compatible", compat, sizeof(compat));
+    qemu_fdt_setprop_sized_cells(ms->fdt, nodename, "reg",
                                  2, base, 2, size);
-    qemu_fdt_setprop_cells(vms->fdt, nodename, "interrupts",
+    qemu_fdt_setprop_cells(ms->fdt, nodename, "interrupts",
                            GIC_FDT_IRQ_TYPE_SPI, irq,
                            GIC_FDT_IRQ_FLAGS_LEVEL_HI);
-    qemu_fdt_setprop_cell(vms->fdt, nodename, "clocks", vms->clock_phandle);
-    qemu_fdt_setprop_string(vms->fdt, nodename, "clock-names", "apb_pclk");
+    qemu_fdt_setprop_cell(ms->fdt, nodename, "clocks", vms->clock_phandle);
+    qemu_fdt_setprop_string(ms->fdt, nodename, "clock-names", "apb_pclk");
     g_free(nodename);
 }
 
@@ -821,32 +828,30 @@ static void virt_powerdown_req(Notifier *n, void *opaque)
     }
 }
 
-static void create_gpio_keys(const VirtMachineState *vms,
-                             DeviceState *pl061_dev,
+static void create_gpio_keys(char *fdt, DeviceState *pl061_dev,
                              uint32_t phandle)
 {
     gpio_key_dev = sysbus_create_simple("gpio-key", -1,
                                         qdev_get_gpio_in(pl061_dev, 3));
 
-    qemu_fdt_add_subnode(vms->fdt, "/gpio-keys");
-    qemu_fdt_setprop_string(vms->fdt, "/gpio-keys", "compatible", "gpio-keys");
-    qemu_fdt_setprop_cell(vms->fdt, "/gpio-keys", "#size-cells", 0);
-    qemu_fdt_setprop_cell(vms->fdt, "/gpio-keys", "#address-cells", 1);
+    qemu_fdt_add_subnode(fdt, "/gpio-keys");
+    qemu_fdt_setprop_string(fdt, "/gpio-keys", "compatible", "gpio-keys");
+    qemu_fdt_setprop_cell(fdt, "/gpio-keys", "#size-cells", 0);
+    qemu_fdt_setprop_cell(fdt, "/gpio-keys", "#address-cells", 1);
 
-    qemu_fdt_add_subnode(vms->fdt, "/gpio-keys/poweroff");
-    qemu_fdt_setprop_string(vms->fdt, "/gpio-keys/poweroff",
+    qemu_fdt_add_subnode(fdt, "/gpio-keys/poweroff");
+    qemu_fdt_setprop_string(fdt, "/gpio-keys/poweroff",
                             "label", "GPIO Key Poweroff");
-    qemu_fdt_setprop_cell(vms->fdt, "/gpio-keys/poweroff", "linux,code",
+    qemu_fdt_setprop_cell(fdt, "/gpio-keys/poweroff", "linux,code",
                           KEY_POWER);
-    qemu_fdt_setprop_cells(vms->fdt, "/gpio-keys/poweroff",
+    qemu_fdt_setprop_cells(fdt, "/gpio-keys/poweroff",
                            "gpios", phandle, 3, 0);
 }
 
 #define SECURE_GPIO_POWEROFF 0
 #define SECURE_GPIO_RESET    1
 
-static void create_secure_gpio_pwr(const VirtMachineState *vms,
-                                   DeviceState *pl061_dev,
+static void create_secure_gpio_pwr(char *fdt, DeviceState *pl061_dev,
                                    uint32_t phandle)
 {
     DeviceState *gpio_pwr_dev;
@@ -860,22 +865,22 @@ static void create_secure_gpio_pwr(const VirtMachineState *vms,
     qdev_connect_gpio_out(pl061_dev, SECURE_GPIO_POWEROFF,
                           qdev_get_gpio_in_named(gpio_pwr_dev, "shutdown", 0));
 
-    qemu_fdt_add_subnode(vms->fdt, "/gpio-poweroff");
-    qemu_fdt_setprop_string(vms->fdt, "/gpio-poweroff", "compatible",
+    qemu_fdt_add_subnode(fdt, "/gpio-poweroff");
+    qemu_fdt_setprop_string(fdt, "/gpio-poweroff", "compatible",
                             "gpio-poweroff");
-    qemu_fdt_setprop_cells(vms->fdt, "/gpio-poweroff",
+    qemu_fdt_setprop_cells(fdt, "/gpio-poweroff",
                            "gpios", phandle, SECURE_GPIO_POWEROFF, 0);
-    qemu_fdt_setprop_string(vms->fdt, "/gpio-poweroff", "status", "disabled");
-    qemu_fdt_setprop_string(vms->fdt, "/gpio-poweroff", "secure-status",
+    qemu_fdt_setprop_string(fdt, "/gpio-poweroff", "status", "disabled");
+    qemu_fdt_setprop_string(fdt, "/gpio-poweroff", "secure-status",
                             "okay");
 
-    qemu_fdt_add_subnode(vms->fdt, "/gpio-restart");
-    qemu_fdt_setprop_string(vms->fdt, "/gpio-restart", "compatible",
+    qemu_fdt_add_subnode(fdt, "/gpio-restart");
+    qemu_fdt_setprop_string(fdt, "/gpio-restart", "compatible",
                             "gpio-restart");
-    qemu_fdt_setprop_cells(vms->fdt, "/gpio-restart",
+    qemu_fdt_setprop_cells(fdt, "/gpio-restart",
                            "gpios", phandle, SECURE_GPIO_RESET, 0);
-    qemu_fdt_setprop_string(vms->fdt, "/gpio-restart", "status", "disabled");
-    qemu_fdt_setprop_string(vms->fdt, "/gpio-restart", "secure-status",
+    qemu_fdt_setprop_string(fdt, "/gpio-restart", "status", "disabled");
+    qemu_fdt_setprop_string(fdt, "/gpio-restart", "secure-status",
                             "okay");
 }
 
@@ -889,6 +894,7 @@ static void create_gpio_devices(const VirtMachineState *vms, int gpio,
     int irq = vms->irqmap[gpio];
     const char compat[] = "arm,pl061\0arm,primecell";
     SysBusDevice *s;
+    MachineState *ms = MACHINE(vms);
 
     pl061_dev = qdev_new("pl061");
     s = SYS_BUS_DEVICE(pl061_dev);
@@ -896,33 +902,33 @@ static void create_gpio_devices(const VirtMachineState *vms, int gpio,
     memory_region_add_subregion(mem, base, sysbus_mmio_get_region(s, 0));
     sysbus_connect_irq(s, 0, qdev_get_gpio_in(vms->gic, irq));
 
-    uint32_t phandle = qemu_fdt_alloc_phandle(vms->fdt);
+    uint32_t phandle = qemu_fdt_alloc_phandle(ms->fdt);
     nodename = g_strdup_printf("/pl061@%" PRIx64, base);
-    qemu_fdt_add_subnode(vms->fdt, nodename);
-    qemu_fdt_setprop_sized_cells(vms->fdt, nodename, "reg",
+    qemu_fdt_add_subnode(ms->fdt, nodename);
+    qemu_fdt_setprop_sized_cells(ms->fdt, nodename, "reg",
                                  2, base, 2, size);
-    qemu_fdt_setprop(vms->fdt, nodename, "compatible", compat, sizeof(compat));
-    qemu_fdt_setprop_cell(vms->fdt, nodename, "#gpio-cells", 2);
-    qemu_fdt_setprop(vms->fdt, nodename, "gpio-controller", NULL, 0);
-    qemu_fdt_setprop_cells(vms->fdt, nodename, "interrupts",
+    qemu_fdt_setprop(ms->fdt, nodename, "compatible", compat, sizeof(compat));
+    qemu_fdt_setprop_cell(ms->fdt, nodename, "#gpio-cells", 2);
+    qemu_fdt_setprop(ms->fdt, nodename, "gpio-controller", NULL, 0);
+    qemu_fdt_setprop_cells(ms->fdt, nodename, "interrupts",
                            GIC_FDT_IRQ_TYPE_SPI, irq,
                            GIC_FDT_IRQ_FLAGS_LEVEL_HI);
-    qemu_fdt_setprop_cell(vms->fdt, nodename, "clocks", vms->clock_phandle);
-    qemu_fdt_setprop_string(vms->fdt, nodename, "clock-names", "apb_pclk");
-    qemu_fdt_setprop_cell(vms->fdt, nodename, "phandle", phandle);
+    qemu_fdt_setprop_cell(ms->fdt, nodename, "clocks", vms->clock_phandle);
+    qemu_fdt_setprop_string(ms->fdt, nodename, "clock-names", "apb_pclk");
+    qemu_fdt_setprop_cell(ms->fdt, nodename, "phandle", phandle);
 
     if (gpio != VIRT_GPIO) {
         /* Mark as not usable by the normal world */
-        qemu_fdt_setprop_string(vms->fdt, nodename, "status", "disabled");
-        qemu_fdt_setprop_string(vms->fdt, nodename, "secure-status", "okay");
+        qemu_fdt_setprop_string(ms->fdt, nodename, "status", "disabled");
+        qemu_fdt_setprop_string(ms->fdt, nodename, "secure-status", "okay");
     }
     g_free(nodename);
 
     /* Child gpio devices */
     if (gpio == VIRT_GPIO) {
-        create_gpio_keys(vms, pl061_dev, phandle);
+        create_gpio_keys(ms->fdt, pl061_dev, phandle);
     } else {
-        create_secure_gpio_pwr(vms, pl061_dev, phandle);
+        create_secure_gpio_pwr(ms->fdt, pl061_dev, phandle);
     }
 }
 
@@ -930,6 +936,7 @@ static void create_virtio_devices(const VirtMachineState *vms)
 {
     int i;
     hwaddr size = vms->memmap[VIRT_MMIO].size;
+    MachineState *ms = MACHINE(vms);
 
     /* We create the transports in forwards order. Since qbus_realize()
      * prepends (not appends) new child buses, the incrementing loop below will
@@ -979,15 +986,15 @@ static void create_virtio_devices(const VirtMachineState *vms)
         hwaddr base = vms->memmap[VIRT_MMIO].base + i * size;
 
         nodename = g_strdup_printf("/virtio_mmio@%" PRIx64, base);
-        qemu_fdt_add_subnode(vms->fdt, nodename);
-        qemu_fdt_setprop_string(vms->fdt, nodename,
+        qemu_fdt_add_subnode(ms->fdt, nodename);
+        qemu_fdt_setprop_string(ms->fdt, nodename,
                                 "compatible", "virtio,mmio");
-        qemu_fdt_setprop_sized_cells(vms->fdt, nodename, "reg",
+        qemu_fdt_setprop_sized_cells(ms->fdt, nodename, "reg",
                                      2, base, 2, size);
-        qemu_fdt_setprop_cells(vms->fdt, nodename, "interrupts",
+        qemu_fdt_setprop_cells(ms->fdt, nodename, "interrupts",
                                GIC_FDT_IRQ_TYPE_SPI, irq,
                                GIC_FDT_IRQ_FLAGS_EDGE_LO_HI);
-        qemu_fdt_setprop(vms->fdt, nodename, "dma-coherent", NULL, 0);
+        qemu_fdt_setprop(ms->fdt, nodename, "dma-coherent", NULL, 0);
         g_free(nodename);
     }
 }
@@ -1068,17 +1075,18 @@ static void virt_flash_fdt(VirtMachineState *vms,
 {
     hwaddr flashsize = vms->memmap[VIRT_FLASH].size / 2;
     hwaddr flashbase = vms->memmap[VIRT_FLASH].base;
+    MachineState *ms = MACHINE(vms);
     char *nodename;
 
     if (sysmem == secure_sysmem) {
         /* Report both flash devices as a single node in the DT */
         nodename = g_strdup_printf("/flash@%" PRIx64, flashbase);
-        qemu_fdt_add_subnode(vms->fdt, nodename);
-        qemu_fdt_setprop_string(vms->fdt, nodename, "compatible", "cfi-flash");
-        qemu_fdt_setprop_sized_cells(vms->fdt, nodename, "reg",
+        qemu_fdt_add_subnode(ms->fdt, nodename);
+        qemu_fdt_setprop_string(ms->fdt, nodename, "compatible", "cfi-flash");
+        qemu_fdt_setprop_sized_cells(ms->fdt, nodename, "reg",
                                      2, flashbase, 2, flashsize,
                                      2, flashbase + flashsize, 2, flashsize);
-        qemu_fdt_setprop_cell(vms->fdt, nodename, "bank-width", 4);
+        qemu_fdt_setprop_cell(ms->fdt, nodename, "bank-width", 4);
         g_free(nodename);
     } else {
         /*
@@ -1086,21 +1094,21 @@ static void virt_flash_fdt(VirtMachineState *vms,
          * only visible to the secure world.
          */
         nodename = g_strdup_printf("/secflash@%" PRIx64, flashbase);
-        qemu_fdt_add_subnode(vms->fdt, nodename);
-        qemu_fdt_setprop_string(vms->fdt, nodename, "compatible", "cfi-flash");
-        qemu_fdt_setprop_sized_cells(vms->fdt, nodename, "reg",
+        qemu_fdt_add_subnode(ms->fdt, nodename);
+        qemu_fdt_setprop_string(ms->fdt, nodename, "compatible", "cfi-flash");
+        qemu_fdt_setprop_sized_cells(ms->fdt, nodename, "reg",
                                      2, flashbase, 2, flashsize);
-        qemu_fdt_setprop_cell(vms->fdt, nodename, "bank-width", 4);
-        qemu_fdt_setprop_string(vms->fdt, nodename, "status", "disabled");
-        qemu_fdt_setprop_string(vms->fdt, nodename, "secure-status", "okay");
+        qemu_fdt_setprop_cell(ms->fdt, nodename, "bank-width", 4);
+        qemu_fdt_setprop_string(ms->fdt, nodename, "status", "disabled");
+        qemu_fdt_setprop_string(ms->fdt, nodename, "secure-status", "okay");
         g_free(nodename);
 
         nodename = g_strdup_printf("/flash@%" PRIx64, flashbase);
-        qemu_fdt_add_subnode(vms->fdt, nodename);
-        qemu_fdt_setprop_string(vms->fdt, nodename, "compatible", "cfi-flash");
-        qemu_fdt_setprop_sized_cells(vms->fdt, nodename, "reg",
+        qemu_fdt_add_subnode(ms->fdt, nodename);
+        qemu_fdt_setprop_string(ms->fdt, nodename, "compatible", "cfi-flash");
+        qemu_fdt_setprop_sized_cells(ms->fdt, nodename, "reg",
                                      2, flashbase + flashsize, 2, flashsize);
-        qemu_fdt_setprop_cell(vms->fdt, nodename, "bank-width", 4);
+        qemu_fdt_setprop_cell(ms->fdt, nodename, "bank-width", 4);
         g_free(nodename);
     }
 }
@@ -1167,17 +1175,17 @@ static FWCfgState *create_fw_cfg(const VirtMachineState *vms, AddressSpace *as)
     fw_cfg_add_i16(fw_cfg, FW_CFG_NB_CPUS, (uint16_t)ms->smp.cpus);
 
     nodename = g_strdup_printf("/fw-cfg@%" PRIx64, base);
-    qemu_fdt_add_subnode(vms->fdt, nodename);
-    qemu_fdt_setprop_string(vms->fdt, nodename,
+    qemu_fdt_add_subnode(ms->fdt, nodename);
+    qemu_fdt_setprop_string(ms->fdt, nodename,
                             "compatible", "qemu,fw-cfg-mmio");
-    qemu_fdt_setprop_sized_cells(vms->fdt, nodename, "reg",
+    qemu_fdt_setprop_sized_cells(ms->fdt, nodename, "reg",
                                  2, base, 2, size);
-    qemu_fdt_setprop(vms->fdt, nodename, "dma-coherent", NULL, 0);
+    qemu_fdt_setprop(ms->fdt, nodename, "dma-coherent", NULL, 0);
     g_free(nodename);
     return fw_cfg;
 }
 
-static void create_pcie_irq_map(const VirtMachineState *vms,
+static void create_pcie_irq_map(const MachineState *ms,
                                 uint32_t gic_phandle,
                                 int first_irq, const char *nodename)
 {
@@ -1205,10 +1213,10 @@ static void create_pcie_irq_map(const VirtMachineState *vms,
         }
     }
 
-    qemu_fdt_setprop(vms->fdt, nodename, "interrupt-map",
+    qemu_fdt_setprop(ms->fdt, nodename, "interrupt-map",
                      full_irq_map, sizeof(full_irq_map));
 
-    qemu_fdt_setprop_cells(vms->fdt, nodename, "interrupt-map-mask",
+    qemu_fdt_setprop_cells(ms->fdt, nodename, "interrupt-map-mask",
                            cpu_to_be16(PCI_DEVFN(3, 0)), /* Slot 3 */
                            0, 0,
                            0x7           /* PCI irq */);
@@ -1225,6 +1233,7 @@ static void create_smmu(const VirtMachineState *vms,
     hwaddr size = vms->memmap[VIRT_SMMU].size;
     const char irq_names[] = "eventq\0priq\0cmdq-sync\0gerror";
     DeviceState *dev;
+    MachineState *ms = MACHINE(vms);
 
     if (vms->iommu != VIRT_IOMMU_SMMUV3 || !vms->iommu_phandle) {
         return;
@@ -1242,26 +1251,26 @@ static void create_smmu(const VirtMachineState *vms,
     }
 
     node = g_strdup_printf("/smmuv3@%" PRIx64, base);
-    qemu_fdt_add_subnode(vms->fdt, node);
-    qemu_fdt_setprop(vms->fdt, node, "compatible", compat, sizeof(compat));
-    qemu_fdt_setprop_sized_cells(vms->fdt, node, "reg", 2, base, 2, size);
+    qemu_fdt_add_subnode(ms->fdt, node);
+    qemu_fdt_setprop(ms->fdt, node, "compatible", compat, sizeof(compat));
+    qemu_fdt_setprop_sized_cells(ms->fdt, node, "reg", 2, base, 2, size);
 
-    qemu_fdt_setprop_cells(vms->fdt, node, "interrupts",
+    qemu_fdt_setprop_cells(ms->fdt, node, "interrupts",
             GIC_FDT_IRQ_TYPE_SPI, irq    , GIC_FDT_IRQ_FLAGS_EDGE_LO_HI,
             GIC_FDT_IRQ_TYPE_SPI, irq + 1, GIC_FDT_IRQ_FLAGS_EDGE_LO_HI,
             GIC_FDT_IRQ_TYPE_SPI, irq + 2, GIC_FDT_IRQ_FLAGS_EDGE_LO_HI,
             GIC_FDT_IRQ_TYPE_SPI, irq + 3, GIC_FDT_IRQ_FLAGS_EDGE_LO_HI);
 
-    qemu_fdt_setprop(vms->fdt, node, "interrupt-names", irq_names,
+    qemu_fdt_setprop(ms->fdt, node, "interrupt-names", irq_names,
                      sizeof(irq_names));
 
-    qemu_fdt_setprop_cell(vms->fdt, node, "clocks", vms->clock_phandle);
-    qemu_fdt_setprop_string(vms->fdt, node, "clock-names", "apb_pclk");
-    qemu_fdt_setprop(vms->fdt, node, "dma-coherent", NULL, 0);
+    qemu_fdt_setprop_cell(ms->fdt, node, "clocks", vms->clock_phandle);
+    qemu_fdt_setprop_string(ms->fdt, node, "clock-names", "apb_pclk");
+    qemu_fdt_setprop(ms->fdt, node, "dma-coherent", NULL, 0);
 
-    qemu_fdt_setprop_cell(vms->fdt, node, "#iommu-cells", 1);
+    qemu_fdt_setprop_cell(ms->fdt, node, "#iommu-cells", 1);
 
-    qemu_fdt_setprop_cell(vms->fdt, node, "phandle", vms->iommu_phandle);
+    qemu_fdt_setprop_cell(ms->fdt, node, "phandle", vms->iommu_phandle);
     g_free(node);
 }
 
@@ -1269,22 +1278,23 @@ static void create_virtio_iommu_dt_bindings(VirtMachineState *vms)
 {
     const char compat[] = "virtio,pci-iommu";
     uint16_t bdf = vms->virtio_iommu_bdf;
+    MachineState *ms = MACHINE(vms);
     char *node;
 
-    vms->iommu_phandle = qemu_fdt_alloc_phandle(vms->fdt);
+    vms->iommu_phandle = qemu_fdt_alloc_phandle(ms->fdt);
 
     node = g_strdup_printf("%s/virtio_iommu@%d", vms->pciehb_nodename, bdf);
-    qemu_fdt_add_subnode(vms->fdt, node);
-    qemu_fdt_setprop(vms->fdt, node, "compatible", compat, sizeof(compat));
-    qemu_fdt_setprop_sized_cells(vms->fdt, node, "reg",
+    qemu_fdt_add_subnode(ms->fdt, node);
+    qemu_fdt_setprop(ms->fdt, node, "compatible", compat, sizeof(compat));
+    qemu_fdt_setprop_sized_cells(ms->fdt, node, "reg",
                                  1, bdf << 8, 1, 0, 1, 0,
                                  1, 0, 1, 0);
 
-    qemu_fdt_setprop_cell(vms->fdt, node, "#iommu-cells", 1);
-    qemu_fdt_setprop_cell(vms->fdt, node, "phandle", vms->iommu_phandle);
+    qemu_fdt_setprop_cell(ms->fdt, node, "#iommu-cells", 1);
+    qemu_fdt_setprop_cell(ms->fdt, node, "phandle", vms->iommu_phandle);
     g_free(node);
 
-    qemu_fdt_setprop_cells(vms->fdt, vms->pciehb_nodename, "iommu-map",
+    qemu_fdt_setprop_cells(ms->fdt, vms->pciehb_nodename, "iommu-map",
                            0x0, vms->iommu_phandle, 0x0, bdf,
                            bdf + 1, vms->iommu_phandle, bdf + 1, 0xffff - bdf);
 }
@@ -1309,6 +1319,7 @@ static void create_pcie(VirtMachineState *vms)
     char *nodename;
     int i, ecam_id;
     PCIHostState *pci;
+    MachineState *ms = MACHINE(vms);
 
     dev = qdev_new(TYPE_GPEX_HOST);
     sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
@@ -1369,27 +1380,27 @@ static void create_pcie(VirtMachineState *vms)
     }
 
     nodename = vms->pciehb_nodename = g_strdup_printf("/pcie@%" PRIx64, base);
-    qemu_fdt_add_subnode(vms->fdt, nodename);
-    qemu_fdt_setprop_string(vms->fdt, nodename,
+    qemu_fdt_add_subnode(ms->fdt, nodename);
+    qemu_fdt_setprop_string(ms->fdt, nodename,
                             "compatible", "pci-host-ecam-generic");
-    qemu_fdt_setprop_string(vms->fdt, nodename, "device_type", "pci");
-    qemu_fdt_setprop_cell(vms->fdt, nodename, "#address-cells", 3);
-    qemu_fdt_setprop_cell(vms->fdt, nodename, "#size-cells", 2);
-    qemu_fdt_setprop_cell(vms->fdt, nodename, "linux,pci-domain", 0);
-    qemu_fdt_setprop_cells(vms->fdt, nodename, "bus-range", 0,
+    qemu_fdt_setprop_string(ms->fdt, nodename, "device_type", "pci");
+    qemu_fdt_setprop_cell(ms->fdt, nodename, "#address-cells", 3);
+    qemu_fdt_setprop_cell(ms->fdt, nodename, "#size-cells", 2);
+    qemu_fdt_setprop_cell(ms->fdt, nodename, "linux,pci-domain", 0);
+    qemu_fdt_setprop_cells(ms->fdt, nodename, "bus-range", 0,
                            nr_pcie_buses - 1);
-    qemu_fdt_setprop(vms->fdt, nodename, "dma-coherent", NULL, 0);
+    qemu_fdt_setprop(ms->fdt, nodename, "dma-coherent", NULL, 0);
 
     if (vms->msi_phandle) {
-        qemu_fdt_setprop_cells(vms->fdt, nodename, "msi-parent",
+        qemu_fdt_setprop_cells(ms->fdt, nodename, "msi-parent",
                                vms->msi_phandle);
     }
 
-    qemu_fdt_setprop_sized_cells(vms->fdt, nodename, "reg",
+    qemu_fdt_setprop_sized_cells(ms->fdt, nodename, "reg",
                                  2, base_ecam, 2, size_ecam);
 
     if (vms->highmem) {
-        qemu_fdt_setprop_sized_cells(vms->fdt, nodename, "ranges",
+        qemu_fdt_setprop_sized_cells(ms->fdt, nodename, "ranges",
                                      1, FDT_PCI_RANGE_IOPORT, 2, 0,
                                      2, base_pio, 2, size_pio,
                                      1, FDT_PCI_RANGE_MMIO, 2, base_mmio,
@@ -1398,23 +1409,23 @@ static void create_pcie(VirtMachineState *vms)
                                      2, base_mmio_high,
                                      2, base_mmio_high, 2, size_mmio_high);
     } else {
-        qemu_fdt_setprop_sized_cells(vms->fdt, nodename, "ranges",
+        qemu_fdt_setprop_sized_cells(ms->fdt, nodename, "ranges",
                                      1, FDT_PCI_RANGE_IOPORT, 2, 0,
                                      2, base_pio, 2, size_pio,
                                      1, FDT_PCI_RANGE_MMIO, 2, base_mmio,
                                      2, base_mmio, 2, size_mmio);
     }
 
-    qemu_fdt_setprop_cell(vms->fdt, nodename, "#interrupt-cells", 1);
-    create_pcie_irq_map(vms, vms->gic_phandle, irq, nodename);
+    qemu_fdt_setprop_cell(ms->fdt, nodename, "#interrupt-cells", 1);
+    create_pcie_irq_map(ms, vms->gic_phandle, irq, nodename);
 
     if (vms->iommu) {
-        vms->iommu_phandle = qemu_fdt_alloc_phandle(vms->fdt);
+        vms->iommu_phandle = qemu_fdt_alloc_phandle(ms->fdt);
 
         switch (vms->iommu) {
         case VIRT_IOMMU_SMMUV3:
             create_smmu(vms, vms->bus);
-            qemu_fdt_setprop_cells(vms->fdt, nodename, "iommu-map",
+            qemu_fdt_setprop_cells(ms->fdt, nodename, "iommu-map",
                                    0x0, vms->iommu_phandle, 0x0, 0x10000);
             break;
         default:
@@ -1466,17 +1477,18 @@ static void create_secure_ram(VirtMachineState *vms,
     char *nodename;
     hwaddr base = vms->memmap[VIRT_SECURE_MEM].base;
     hwaddr size = vms->memmap[VIRT_SECURE_MEM].size;
+    MachineState *ms = MACHINE(vms);
 
     memory_region_init_ram(secram, NULL, "virt.secure-ram", size,
                            &error_fatal);
     memory_region_add_subregion(secure_sysmem, base, secram);
 
     nodename = g_strdup_printf("/secram@%" PRIx64, base);
-    qemu_fdt_add_subnode(vms->fdt, nodename);
-    qemu_fdt_setprop_string(vms->fdt, nodename, "device_type", "memory");
-    qemu_fdt_setprop_sized_cells(vms->fdt, nodename, "reg", 2, base, 2, size);
-    qemu_fdt_setprop_string(vms->fdt, nodename, "status", "disabled");
-    qemu_fdt_setprop_string(vms->fdt, nodename, "secure-status", "okay");
+    qemu_fdt_add_subnode(ms->fdt, nodename);
+    qemu_fdt_setprop_string(ms->fdt, nodename, "device_type", "memory");
+    qemu_fdt_setprop_sized_cells(ms->fdt, nodename, "reg", 2, base, 2, size);
+    qemu_fdt_setprop_string(ms->fdt, nodename, "status", "disabled");
+    qemu_fdt_setprop_string(ms->fdt, nodename, "secure-status", "okay");
 
     if (secure_tag_sysmem) {
         create_tag_ram(secure_tag_sysmem, base, size, "mach-virt.secure-tag");
@@ -1489,9 +1501,11 @@ static void *machvirt_dtb(const struct arm_boot_info *binfo, int *fdt_size)
 {
     const VirtMachineState *board = container_of(binfo, VirtMachineState,
                                                  bootinfo);
+    MachineState *ms = MACHINE(board);
+
 
     *fdt_size = board->fdt_size;
-    return board->fdt;
+    return ms->fdt;
 }
 
 static void virt_build_smbios(VirtMachineState *vms)
@@ -1539,7 +1553,7 @@ void virt_machine_done(Notifier *notifier, void *data)
      * while qemu takes charge of the qom stuff.
      */
     if (info->dtb_filename == NULL) {
-        platform_bus_add_all_fdt_nodes(vms->fdt, "/intc",
+        platform_bus_add_all_fdt_nodes(ms->fdt, "/intc",
                                        vms->memmap[VIRT_PLATFORM_BUS].base,
                                        vms->memmap[VIRT_PLATFORM_BUS].size,
                                        vms->irqmap[VIRT_PLATFORM_BUS]);
-- 
2.20.1


