Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A34F194EDB1
	for <lists+xen-devel@lfdr.de>; Mon, 12 Aug 2024 15:06:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.775497.1185776 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sdUkr-0001FR-Sf; Mon, 12 Aug 2024 13:06:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 775497.1185776; Mon, 12 Aug 2024 13:06:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sdUkr-0001Bl-N3; Mon, 12 Aug 2024 13:06:33 +0000
Received: by outflank-mailman (input) for mailman id 775497;
 Mon, 12 Aug 2024 13:06:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FAji=PL=gmail.com=edgar.iglesias@srs-se1.protection.inumbo.net>)
 id 1sdUkq-0007ep-1s
 for xen-devel@lists.xenproject.org; Mon, 12 Aug 2024 13:06:32 +0000
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [2a00:1450:4864:20::129])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b1013ab9-58ab-11ef-8776-851b0ebba9a2;
 Mon, 12 Aug 2024 15:06:30 +0200 (CEST)
Received: by mail-lf1-x129.google.com with SMTP id
 2adb3069b0e04-52f025bc147so4940625e87.3
 for <xen-devel@lists.xenproject.org>; Mon, 12 Aug 2024 06:06:30 -0700 (PDT)
Received: from gmail.com (213-67-3-247-no600.tbcn.telia.com. [213.67.3.247])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-53200f42667sm739978e87.294.2024.08.12.06.06.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Aug 2024 06:06:28 -0700 (PDT)
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
X-Inumbo-ID: b1013ab9-58ab-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723467990; x=1724072790; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fsU79nmQ1AQVXUbNSxYwoeBBAkcfnxSMEvBp2lKDwWA=;
        b=B/xI+8KavbWBZZglNfWEf48hc0q0hZvTzA5TQwWKGyYhhR4NdslF57hJg4NKekTcb/
         0Q+uZumL7LBhYxSfjRb5GOeIGAZK4Z1vXMNRzL4WDlQ0AXEN7TNqQaPBXXrMfOuflvss
         WTKz4WhJjylmQnLc2VjrbXjkO3d+6FW1SrodK5owAjieVaGHPKAK+IYsWgOOKRMxaGDu
         z6JS5ur5pJz1sekEdkfddLOFTZkW+Z8ir0hMQPmoKRqGxsq89HrjpmZCVDdSSMjTVgwo
         9QKVXcn9NuQK43h0nX7MttEIRW/fKjgxdyDYq7t1FM3ELOtxoUUmYj5rvtjVtIfPfdPo
         iaBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723467990; x=1724072790;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fsU79nmQ1AQVXUbNSxYwoeBBAkcfnxSMEvBp2lKDwWA=;
        b=OJbjLmsFzk9yyekvzpcv3LoMEPJIVnkiKnEvxoI1TgRQMqUU/d6r/8ogR8l5gPzZ6U
         XusGrRF9/Nf2AollqusmQt4S6fmIFt9NyHfDY9mQ4uM2Z4scM2pN4uvxRNWKJai+HxVP
         hoQee1upt1Kk9oVB5CR/aESJGx7r+bCAnOn51OjxWk/anKojVUTiVlM29TSKun9ibiF6
         LWIgV3MNon2N1J+tSxAf1hbaaB3Gl+SOxM8pj6avYE8V3tpcJYFV+9ueoWmQGiydbn6b
         71nIfIc9dGjzqQq8YQHjmaFzC/gsAAyi9yfLHAlBngA5qdztA1F5SjvWFbihBGirrBtN
         BTUA==
X-Forwarded-Encrypted: i=1; AJvYcCU9jI7HVqVHMq5yg3RqGYBbAN1wvBey+lOuZWVWZMUBuNvIMyw4l3cThY0x8JNi5YAUWhhLwoxJQN+bKjMluTbtEpoj/+PFvhb7YaQnDjI=
X-Gm-Message-State: AOJu0Yx8nsIrn0UZqTyub3QTn0B+aW7/OS1ay0HoNFBffJQCgYEI/fwQ
	YtbFpdLP5XBwFAGtjm/LlNyL0yO1zdO87f24DYeGy6vxehf+4pwEH6BaVAD5
X-Google-Smtp-Source: AGHT+IExi6OAtMSH2lj/PgBrg+LlxDZERUpkwQQHEWkaEtSD3XJV0ILUPZ6rtXYIo0sScSOwNbS7/Q==
X-Received: by 2002:a05:6512:6d1:b0:52e:941d:7039 with SMTP id 2adb3069b0e04-532136a4e69mr29594e87.59.1723467989238;
        Mon, 12 Aug 2024 06:06:29 -0700 (PDT)
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
Subject: [PATCH v1 08/10] hw/xen: pvh-common: Add support for creating PCIe/GPEX
Date: Mon, 12 Aug 2024 15:06:03 +0200
Message-ID: <20240812130606.90410-9-edgar.iglesias@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240812130606.90410-1-edgar.iglesias@gmail.com>
References: <20240812130606.90410-1-edgar.iglesias@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Edgar E. Iglesias" <edgar.iglesias@amd.com>

Add support for optionally creating a PCIe/GPEX controller.

Signed-off-by: Edgar E. Iglesias <edgar.iglesias@amd.com>
---
 hw/xen/xen-pvh-common.c         | 66 +++++++++++++++++++++++++++++++++
 include/hw/xen/xen-pvh-common.h | 10 ++++-
 2 files changed, 75 insertions(+), 1 deletion(-)

diff --git a/hw/xen/xen-pvh-common.c b/hw/xen/xen-pvh-common.c
index 69a2dbdb6d..b1432e4bd9 100644
--- a/hw/xen/xen-pvh-common.c
+++ b/hw/xen/xen-pvh-common.c
@@ -120,6 +120,59 @@ static void xen_enable_tpm(XenPVHCommonState *s)
 }
 #endif
 
+static void xen_set_pci_intx_irq(void *opaque, int irq, int level)
+{
+    if (xen_set_pci_intx_level(xen_domid, 0, 0, 0, irq, level)) {
+        error_report("xendevicemodel_set_pci_intx_level failed");
+    }
+}
+
+static inline void xenpvh_gpex_init(XenPVHCommonState *s,
+                                    MemoryRegion *sysmem,
+                                    hwaddr ecam_base, hwaddr ecam_size,
+                                    hwaddr mmio_base, hwaddr mmio_size,
+                                    hwaddr mmio_high_base,
+                                    hwaddr mmio_high_size,
+                                    int intx_irq_base)
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
+    memory_region_add_subregion(sysmem, ecam_base, ecam_reg);
+
+    mmio_reg = sysbus_mmio_get_region(SYS_BUS_DEVICE(dev), 1);
+
+    if (mmio_size) {
+        memory_region_init_alias(&s->pci.mmio_alias, OBJECT(dev), "pcie-mmio",
+                                 mmio_reg, mmio_base, mmio_size);
+        memory_region_add_subregion(sysmem, mmio_base, &s->pci.mmio_alias);
+    }
+
+    if (mmio_high_size) {
+        memory_region_init_alias(&s->pci.mmio_high_alias, OBJECT(dev),
+                "pcie-mmio-high",
+                mmio_reg, mmio_high_base, mmio_high_size);
+        memory_region_add_subregion(sysmem, mmio_high_base,
+                &s->pci.mmio_high_alias);
+    }
+
+    for (i = 0; i < GPEX_NUM_IRQS; i++) {
+        qemu_irq irq = qemu_allocate_irq(xen_set_pci_intx_irq, s, i);
+
+        sysbus_connect_irq(SYS_BUS_DEVICE(dev), i, irq);
+        gpex_set_irq_num(GPEX_HOST(dev), i, intx_irq_base + i);
+        xen_set_pci_link_route(i, intx_irq_base + i);
+    }
+}
+
 static void xen_pvh_realize(DeviceState *dev, Error **errp)
 {
     XenPVHCommonState *s = XEN_PVH_COMMON(dev);
@@ -152,6 +205,14 @@ static void xen_pvh_realize(DeviceState *dev, Error **errp)
         warn_report("tpm-base-addr is not provided. TPM will not be enabled");
     }
 #endif
+
+    if (s->cfg.ecam.size) {
+        xenpvh_gpex_init(s, sysmem,
+                         s->cfg.ecam.base, s->cfg.ecam.size,
+                         s->cfg.mmio.base, s->cfg.mmio.size,
+                         s->cfg.mmio_high.base, s->cfg.mmio_high.size,
+                         s->cfg.pci_intx_irq_base);
+    }
 }
 
 #define DEFINE_PROP_MEMMAP(n, f) \
@@ -165,10 +226,15 @@ static Property xen_pvh_properties[] = {
     DEFINE_PROP_MEMMAP("ram-high", ram_high),
     DEFINE_PROP_MEMMAP("virtio-mmio", virtio_mmio),
     DEFINE_PROP_MEMMAP("tpm", tpm),
+    DEFINE_PROP_MEMMAP("pci-ecam", ecam),
+    DEFINE_PROP_MEMMAP("pci-mmio", mmio),
+    DEFINE_PROP_MEMMAP("pci-mmio-high", mmio_high),
     DEFINE_PROP_UINT32("virtio-mmio-num", XenPVHCommonState,
                        cfg.virtio_mmio_num, 0),
     DEFINE_PROP_UINT32("virtio-mmio-irq-base", XenPVHCommonState,
                        cfg.virtio_mmio_irq_base, 0),
+    DEFINE_PROP_UINT32("pci-intx-irq-base", XenPVHCommonState,
+                       cfg.pci_intx_irq_base, 0),
     DEFINE_PROP_END_OF_LIST()
 };
 
diff --git a/include/hw/xen/xen-pvh-common.h b/include/hw/xen/xen-pvh-common.h
index e958b441fd..faacfca70e 100644
--- a/include/hw/xen/xen-pvh-common.h
+++ b/include/hw/xen/xen-pvh-common.h
@@ -29,17 +29,25 @@ typedef struct XenPVHCommonState {
         MemoryRegion high;
     } ram;
 
+    struct {
+        GPEXHost gpex;
+        MemoryRegion mmio_alias;
+        MemoryRegion mmio_high_alias;
+    } pci;
+
     struct {
         uint64_t ram_size;
         uint32_t max_cpus;
         uint32_t virtio_mmio_num;
         uint32_t virtio_mmio_irq_base;
+        uint32_t pci_intx_irq_base;
         struct {
             uint64_t base;
             uint64_t size;
         } ram_low, ram_high,
           virtio_mmio,
-          tpm;
+          tpm,
+          ecam, mmio, mmio_high;
     } cfg;
 } XenPVHCommonState;
 #endif
-- 
2.43.0


