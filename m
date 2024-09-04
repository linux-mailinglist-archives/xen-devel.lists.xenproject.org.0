Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0359896C3BE
	for <lists+xen-devel@lfdr.de>; Wed,  4 Sep 2024 18:16:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.790556.1200435 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1slsfp-0003RZ-8h; Wed, 04 Sep 2024 16:16:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 790556.1200435; Wed, 04 Sep 2024 16:16:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1slsfp-0003OZ-1L; Wed, 04 Sep 2024 16:16:01 +0000
Received: by outflank-mailman (input) for mailman id 790556;
 Wed, 04 Sep 2024 16:15:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Ufny=QC=gmail.com=edgar.iglesias@srs-se1.protection.inumbo.net>)
 id 1slsfn-0000I6-Fu
 for xen-devel@lists.xenproject.org; Wed, 04 Sep 2024 16:15:59 +0000
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [2a00:1450:4864:20::131])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f87def00-6ad8-11ef-a0b3-8be0dac302b0;
 Wed, 04 Sep 2024 18:15:58 +0200 (CEST)
Received: by mail-lf1-x131.google.com with SMTP id
 2adb3069b0e04-533463f6b16so1384139e87.1
 for <xen-devel@lists.xenproject.org>; Wed, 04 Sep 2024 09:15:58 -0700 (PDT)
Received: from gmail.com (213-67-3-247-no600.tbcn.telia.com. [213.67.3.247])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-53540841326sm2387308e87.197.2024.09.04.09.15.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Sep 2024 09:15:56 -0700 (PDT)
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
X-Inumbo-ID: f87def00-6ad8-11ef-a0b3-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725466558; x=1726071358; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AhHuSPxpBNKwAgr3pqcWE8F4qfu6xeqGgbqjKgqrTwo=;
        b=PZo2ZVQtyAJzZPCroq0czgVOh6Sf9InaY0/Dq94KvWD7L3ONtu57hA4Vka5wVsea2h
         0PKDaP80gBTGfTpMr8ilReU2AZnQur/mJ9O1ALFZGNViwCjmmMQ8PLdko+JMw8Q2hbU0
         ZuL34OCQt9Zik6pC7k0Hpby4x/MYguBi+mK3ywABfzeuOMvIX+h7rMAMHzUW7gH4RZYc
         1wLe5EywNh/nVHjNl9AT+Q2lW50G0+VF0UT343UfE3x4umQobQ80mN+rHFPE3LX63Zby
         JSwNUA5lhQ+qHoxLBKpJokJ3gRLU2GAKV7XTnFy30bKP+dZer1AVjv094myFAIp07nIW
         +4lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725466558; x=1726071358;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AhHuSPxpBNKwAgr3pqcWE8F4qfu6xeqGgbqjKgqrTwo=;
        b=nI3sd5XvWgF4ja09sLxz9n0xrVOds939tY/LcVFr1SO4Vi2J2YS66ZIuOrbydG8DPz
         SMmIRW6AWNFheKswRN1gq+BtiEnsUtmjG/hIpmEEH3WcSRdLEcI3Vo5am8AMxcT3gdKh
         /GiMTFw1zNzyr7TaRbUX3Hjzol4kZcCoXwGWsjTDRdpw9xtxNuGhT78Heotr8YZ0SMal
         Mwp8Zyn8uqjyJ6G6srWAXrPHuefje/qX2W+tiVc5r5eB6nUNeA4kcxP13Gww2jsaj8zM
         1CDkw03vQHFSHD774shEeGVXmKQDWva08W7Oa+6ER4c6AdJ8gN8n2HSCk1CsaWaF1z4k
         Sbbw==
X-Forwarded-Encrypted: i=1; AJvYcCU25D+AykhEAFFfuqpxcBqO9bbg4s3tWy7nljISzFZVpyGm2CVScpnfnBR461VtdPm2FhPrqgOsYQ8=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yxf0CRWczIWTSYo1PfP0tNmgbJuSO2VQ4A+x0n16b8iaTVpa+3L
	nFUPTL1hADIfdlywtBtQpdUh+jyZ8bnWUj1cpOJmhNAJoII/S5jg
X-Google-Smtp-Source: AGHT+IF1GFmSMfUcd/mUHwagfqt5mpNvfaEt+oYlqwsbk12notXPjCro2OfzhCpiGNq2eIcwaUFOhQ==
X-Received: by 2002:a05:6512:1192:b0:52f:eb:aaca with SMTP id 2adb3069b0e04-53565f22906mr2195749e87.32.1725466557827;
        Wed, 04 Sep 2024 09:15:57 -0700 (PDT)
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: qemu-devel@nongnu.org
Cc: sstabellini@kernel.org,
	anthony@xenproject.org,
	paul@xen.org,
	peter.maydell@linaro.org,
	alex.bennee@linaro.org,
	xenia.ragiadakou@amd.com,
	jason.andryuk@amd.com,
	edgar.iglesias@amd.com,
	xen-devel@lists.xenproject.org,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Subject: [PULL v1 10/12] hw/xen: pvh-common: Add support for creating PCIe/GPEX
Date: Wed,  4 Sep 2024 18:15:34 +0200
Message-ID: <20240904161537.664189-11-edgar.iglesias@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240904161537.664189-1-edgar.iglesias@gmail.com>
References: <20240904161537.664189-1-edgar.iglesias@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Edgar E. Iglesias" <edgar.iglesias@amd.com>

Add support for optionally creating a PCIe/GPEX controller.

Signed-off-by: Edgar E. Iglesias <edgar.iglesias@amd.com>
Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
---
 hw/xen/xen-pvh-common.c         | 76 +++++++++++++++++++++++++++++++++
 include/hw/xen/xen-pvh-common.h | 29 +++++++++++++
 2 files changed, 105 insertions(+)

diff --git a/hw/xen/xen-pvh-common.c b/hw/xen/xen-pvh-common.c
index 295f920442..28d7168446 100644
--- a/hw/xen/xen-pvh-common.c
+++ b/hw/xen/xen-pvh-common.c
@@ -122,6 +122,64 @@ static void xen_enable_tpm(XenPVHMachineState *s)
 }
 #endif
 
+/*
+ * We use the GPEX PCIe controller with its internal INTX PCI interrupt
+ * swizzling. This swizzling is emulated in QEMU and routes all INTX
+ * interrupts from endpoints down to only 4 INTX interrupts.
+ * See include/hw/pci/pci.h : pci_swizzle()
+ */
+static inline void xenpvh_gpex_init(XenPVHMachineState *s,
+                                    XenPVHMachineClass *xpc,
+                                    MemoryRegion *sysmem)
+{
+    MemoryRegion *ecam_reg;
+    MemoryRegion *mmio_reg;
+    DeviceState *dev;
+    int i;
+
+    object_initialize_child(OBJECT(s), "gpex", &s->pci.gpex,
+                            TYPE_GPEX_HOST);
+    dev = DEVICE(&s->pci.gpex);
+    sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
+
+    ecam_reg = sysbus_mmio_get_region(SYS_BUS_DEVICE(dev), 0);
+    memory_region_add_subregion(sysmem, s->cfg.pci_ecam.base, ecam_reg);
+
+    mmio_reg = sysbus_mmio_get_region(SYS_BUS_DEVICE(dev), 1);
+
+    if (s->cfg.pci_mmio.size) {
+        memory_region_init_alias(&s->pci.mmio_alias, OBJECT(dev), "pcie-mmio",
+                                 mmio_reg,
+                                 s->cfg.pci_mmio.base, s->cfg.pci_mmio.size);
+        memory_region_add_subregion(sysmem, s->cfg.pci_mmio.base,
+                                    &s->pci.mmio_alias);
+    }
+
+    if (s->cfg.pci_mmio_high.size) {
+        memory_region_init_alias(&s->pci.mmio_high_alias, OBJECT(dev),
+                "pcie-mmio-high",
+                mmio_reg, s->cfg.pci_mmio_high.base, s->cfg.pci_mmio_high.size);
+        memory_region_add_subregion(sysmem, s->cfg.pci_mmio_high.base,
+                &s->pci.mmio_high_alias);
+    }
+
+    /*
+     * PVH implementations with PCI enabled must provide set_pci_intx_irq()
+     * and optionally an implementation of set_pci_link_route().
+     */
+    assert(xpc->set_pci_intx_irq);
+
+    for (i = 0; i < GPEX_NUM_IRQS; i++) {
+        qemu_irq irq = qemu_allocate_irq(xpc->set_pci_intx_irq, s, i);
+
+        sysbus_connect_irq(SYS_BUS_DEVICE(dev), i, irq);
+        gpex_set_irq_num(GPEX_HOST(dev), i, s->cfg.pci_intx_irq_base + i);
+        if (xpc->set_pci_link_route) {
+            xpc->set_pci_link_route(i, s->cfg.pci_intx_irq_base + i);
+        }
+    }
+}
+
 static void xen_pvh_init(MachineState *ms)
 {
     XenPVHMachineState *s = XEN_PVH_MACHINE(ms);
@@ -152,6 +210,15 @@ static void xen_pvh_init(MachineState *ms)
     }
 #endif
 
+    /* Non-zero pci-ecam-size enables PCI.  */
+    if (s->cfg.pci_ecam.size) {
+        if (s->cfg.pci_ecam.size != 256 * MiB) {
+            error_report("pci-ecam-size only supports values 0 or 0x10000000");
+            exit(EXIT_FAILURE);
+        }
+        xenpvh_gpex_init(s, xpc, sysmem);
+    }
+
     /* Call the implementation specific init.  */
     if (xpc->init) {
         xpc->init(ms);
@@ -200,6 +267,9 @@ XEN_PVH_PROP_MEMMAP(ram_high)
 /* TPM only has a base-addr option.  */
 XEN_PVH_PROP_MEMMAP_BASE(tpm)
 XEN_PVH_PROP_MEMMAP(virtio_mmio)
+XEN_PVH_PROP_MEMMAP(pci_ecam)
+XEN_PVH_PROP_MEMMAP(pci_mmio)
+XEN_PVH_PROP_MEMMAP(pci_mmio_high)
 
 void xen_pvh_class_setup_common_props(XenPVHMachineClass *xpc)
 {
@@ -242,6 +312,12 @@ do {                                                                      \
         OC_MEMMAP_PROP(oc, "virtio-mmio", virtio_mmio);
     }
 
+    if (xpc->has_pci) {
+        OC_MEMMAP_PROP(oc, "pci-ecam", pci_ecam);
+        OC_MEMMAP_PROP(oc, "pci-mmio", pci_mmio);
+        OC_MEMMAP_PROP(oc, "pci-mmio-high", pci_mmio_high);
+    }
+
 #ifdef CONFIG_TPM
     if (xpc->has_tpm) {
         object_class_property_add(oc, "tpm-base-addr", "uint64_t",
diff --git a/include/hw/xen/xen-pvh-common.h b/include/hw/xen/xen-pvh-common.h
index 77fd98b9fe..bc09eea936 100644
--- a/include/hw/xen/xen-pvh-common.h
+++ b/include/hw/xen/xen-pvh-common.h
@@ -25,10 +25,29 @@ struct XenPVHMachineClass {
     /* PVH implementation specific init.  */
     void (*init)(MachineState *state);
 
+    /*
+     * set_pci_intx_irq - Deliver INTX irqs to the guest.
+     *
+     * @opaque: pointer to XenPVHMachineState.
+     * @irq: IRQ after swizzling, between 0-3.
+     * @level: IRQ level.
+     */
+    void (*set_pci_intx_irq)(void *opaque, int irq, int level);
+
+    /*
+     * set_pci_link_route: - optional implementation call to setup
+     * routing between INTX IRQ (0 - 3) and GSI's.
+     *
+     * @line: line the INTx line (0 => A .. 3 => B)
+     * @irq: GSI
+     */
+    int (*set_pci_link_route)(uint8_t line, uint8_t irq);
+
     /*
      * Each implementation can optionally enable features that it
      * supports and are known to work.
      */
+    bool has_pci;
     bool has_tpm;
     bool has_virtio_mmio;
 };
@@ -44,6 +63,12 @@ struct XenPVHMachineState {
         MemoryRegion high;
     } ram;
 
+    struct {
+        GPEXHost gpex;
+        MemoryRegion mmio_alias;
+        MemoryRegion mmio_high_alias;
+    } pci;
+
     struct {
         MemMapEntry ram_low, ram_high;
         MemMapEntry tpm;
@@ -52,6 +77,10 @@ struct XenPVHMachineState {
         MemMapEntry virtio_mmio;
         uint32_t virtio_mmio_num;
         uint32_t virtio_mmio_irq_base;
+
+        /* PCI */
+        MemMapEntry pci_ecam, pci_mmio, pci_mmio_high;
+        uint32_t pci_intx_irq_base;
     } cfg;
 };
 
-- 
2.43.0


