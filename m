Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F7FACB6F05
	for <lists+xen-devel@lfdr.de>; Thu, 11 Dec 2025 19:46:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1184547.1506968 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vTlfk-0003Wd-Kx; Thu, 11 Dec 2025 18:45:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1184547.1506968; Thu, 11 Dec 2025 18:45:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vTlfk-0003QY-HW; Thu, 11 Dec 2025 18:45:52 +0000
Received: by outflank-mailman (input) for mailman id 1184547;
 Thu, 11 Dec 2025 18:45:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QWGN=6R=gmail.com=xakep.amatop@srs-se1.protection.inumbo.net>)
 id 1vTlfj-0003I8-9j
 for xen-devel@lists.xenproject.org; Thu, 11 Dec 2025 18:45:51 +0000
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [2a00:1450:4864:20::62c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9d4f3a67-d6c1-11f0-b15b-2bf370ae4941;
 Thu, 11 Dec 2025 19:45:50 +0100 (CET)
Received: by mail-ej1-x62c.google.com with SMTP id
 a640c23a62f3a-b727f452fffso71489766b.1
 for <xen-devel@lists.xenproject.org>; Thu, 11 Dec 2025 10:45:50 -0800 (PST)
Received: from EPUAKYIW02F7.. (pool185-5-253-4.as6723.net. [185.5.253.4])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b7cfa5d0b0dsm345870466b.67.2025.12.11.10.45.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Dec 2025 10:45:48 -0800 (PST)
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
X-Inumbo-ID: 9d4f3a67-d6c1-11f0-b15b-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765478750; x=1766083550; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MRsGxV9gXG/ZC0I4AbwNbd/2+lrn7b0mKg3wOgq8N30=;
        b=dixB5wl8ej22SEtNyazYU6wLrQaeyrDU9pmwBv8+s2mMJn3zCFWSkBL955w7JWR8R+
         rlUyN5RuxzEqoeyxL2PztYgl03jTFX/RG0ldrBQJ3xoWKAlNT8zg1C4cxfckLBF123CQ
         wldsMInItTSgpv9F9ocDZOl5rBhSz1poZaS6XieZ7OGOVQUWOAFv2owEEmQvOnPL6r64
         XsrMP0o0LrXXqUFNsrDB+2O1854iwSM/dtUmvvoAoNHsV5VLyypoUQdpdHQe6/FJal3m
         V3MhktAPWSAX/bFSK/+zZI3O+MCyo+P5bYLZYmy6IQPjtjCsePT0YEXOgz3C/pSGH09u
         cwDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765478750; x=1766083550;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=MRsGxV9gXG/ZC0I4AbwNbd/2+lrn7b0mKg3wOgq8N30=;
        b=LIkIyKn5D/1TLxcP80nmN0lzQ24DHvdtKaizuxofkYEJGoQD1zsthTZym1olzMBVMD
         sEscO4+p3AsgqoRwM/E1ED1WjI2zV1ZMKfj6pfVqUmEhgFd1wJD67ucpG6ogMOOTGvYt
         Q0AacwTL4+AkDILQcA1O9fDB2EvrjDgNPYmKn+yeEhBxBfLHQuyn7JbwqCT0z3hMUEdX
         npvxJCX0tWFZw0LF42S/t8ohDE6GaETbaRBLxkr5mGhT59N4XSPAuoBDLcLKWRtILTyX
         2TQMcm++VyaAGWzP4Wnpb3pDNGGGBPABoxRaYUuTIBhgLEJ5WdX47BVuW2s1isRjNm9S
         FC+g==
X-Gm-Message-State: AOJu0YwiUoMxaB2MtLzabWCFgcU1BnlFCeQObcpbFHQOXkDYKXJZmq9p
	TF+rVER4Yt7WfWb/ijtiSaYP+abqXq5HzDhkiYJyAQa3+yNXyqasu/HIH5n/8IfP
X-Gm-Gg: AY/fxX5GFBNYeoSEZgHcIzkVwTlQ+Xb6JHOpoTeofgnUSrPdsTF9NcgLCsTxe0WhAXH
	VH26eO46JJbQtRw6yR1TERGeI6VVK69pTj4auY6+Y23cIPdvbrSLFapHhyjjgO6qzdLbcgB5fSs
	kCDP0ZcDKXzDa1fZq9KTZXezwevnpNIephvImt7EtKGI604Suh1u1hJoefia9xJGQID7coB7C8Q
	k0G38eYwUeOdZD/1ggc1/HGRHz4MO2jmQyju0qjDEpebaOWJhnAyX5g7mfJ7KPZIoT1hlQtLc/1
	6vWuudZrj6iaUAcgZ+fIZ30b2x9CKKhpc0OdQlKC4hLhNiAy0N3Y7V5QFXWFOi4tRedWXxDV5of
	BTF9mFniKEp8igGqzYegYVoNG2nXl+CLqaMTEiBH+BWBSUCbCnJOxAypjBkLCVdhyMq3sMQJj5e
	fuwHhc5i5DBLClOoI0kKg19/hxIviwZt8hBEwdl6OZ
X-Google-Smtp-Source: AGHT+IEAHYkNBQOlPEi8KqOjFKwI0oh4hz5zxz+lP2CuRzm2gBo3f1ff4xjR6uEUqdSIRULlHee29Q==
X-Received: by 2002:a17:907:1c91:b0:b7a:71b7:2409 with SMTP id a640c23a62f3a-b7d02ae0bb0mr393064966b.15.1765478749417;
        Thu, 11 Dec 2025 10:45:49 -0800 (PST)
From: Mykola Kvach <xakep.amatop@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Mykola Kvach <mykola_kvach@epam.com>,
	Mykola Kvach <xakep.amatop@gmail.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Saeed Nowshadi <saeed.nowshadi@xilinx.com>,
	Mykyta Poturai <mykyta_poturai@epam.com>
Subject: [PATCH v7 02/12] xen/arm: gic-v2: Implement GIC suspend/resume functions
Date: Thu, 11 Dec 2025 20:43:26 +0200
Message-ID: <fe8b4d92a8dfd7b4c40429d10233637a339ae8e6.1765472890.git.mykola_kvach@epam.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1765472890.git.mykola_kvach@epam.com>
References: <cover.1765472890.git.mykola_kvach@epam.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Mirela Simonovic <mirela.simonovic@aggios.com>

System suspend may lead to a state where GIC would be powered down.
Therefore, Xen should save/restore the context of GIC on suspend/resume.

Note that the context consists of states of registers which are
controlled by the hypervisor. Other GIC registers which are accessible
by guests are saved/restored on context switch.

Signed-off-by: Mirela Simonovic <mirela.simonovic@aggios.com>
Signed-off-by: Saeed Nowshadi <saeed.nowshadi@xilinx.com>
Signed-off-by: Mykyta Poturai <mykyta_poturai@epam.com>
Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
---
Changes in V7:
- Allocate one contiguous memory block for the GICv2 dist suspend context.
- gicv2_resume() no longer unconditionally re-enables the distributor/CPU interface;
  it now writes back the saved CTLR values as-is.
- gicv2_alloc_context() now returns 0 on success and panics on failure, since
  suspend context allocation is not recoverable.
---
 xen/arch/arm/gic-v2.c          | 126 +++++++++++++++++++++++++++++++++
 xen/arch/arm/gic.c             |  29 ++++++++
 xen/arch/arm/include/asm/gic.h |  12 ++++
 3 files changed, 167 insertions(+)

diff --git a/xen/arch/arm/gic-v2.c b/xen/arch/arm/gic-v2.c
index b23e72a3d0..0b2f7b3862 100644
--- a/xen/arch/arm/gic-v2.c
+++ b/xen/arch/arm/gic-v2.c
@@ -1098,6 +1098,123 @@ static int gicv2_iomem_deny_access(struct domain *d)
     return iomem_deny_access(d, mfn, mfn + nr);
 }
 
+#ifdef CONFIG_SYSTEM_SUSPEND
+
+/* This struct represent block of 32 IRQs */
+struct irq_block {
+    uint32_t icfgr[2]; /* 2 registers of 16 IRQs each */
+    uint32_t ipriorityr[8];
+    uint32_t isenabler;
+    uint32_t isactiver;
+    uint32_t itargetsr[8];
+};
+
+/* GICv2 registers to be saved/restored on system suspend/resume */
+struct gicv2_context {
+    /* GICC context */
+    struct cpu_ctx {
+        uint32_t ctlr;
+        uint32_t pmr;
+        uint32_t bpr;
+    } cpu;
+
+    /* GICD context */
+    struct dist_ctx {
+        uint32_t ctlr;
+        struct irq_block *irqs;
+    } dist;
+};
+
+static struct gicv2_context gic_ctx;
+
+static int gicv2_suspend(void)
+{
+    unsigned int i, blocks = DIV_ROUND_UP(gicv2_info.nr_lines, 32);
+
+    /* Save GICC configuration */
+    gic_ctx.cpu.ctlr = readl_gicc(GICC_CTLR);
+    gic_ctx.cpu.pmr = readl_gicc(GICC_PMR);
+    gic_ctx.cpu.bpr = readl_gicc(GICC_BPR);
+
+    /* Save GICD configuration */
+    gic_ctx.dist.ctlr = readl_gicd(GICD_CTLR);
+
+    for ( i = 0; i < blocks; i++ )
+    {
+        struct irq_block *irqs = gic_ctx.dist.irqs + i;
+        size_t j, off = i * sizeof(irqs->isenabler);
+
+        irqs->isenabler = readl_gicd(GICD_ISENABLER + off);
+        irqs->isactiver = readl_gicd(GICD_ISACTIVER + off);
+
+        off = i * sizeof(irqs->ipriorityr);
+        for ( j = 0; j < ARRAY_SIZE(irqs->ipriorityr); j++ )
+        {
+            irqs->ipriorityr[j] = readl_gicd(GICD_IPRIORITYR + off + j * 4);
+            irqs->itargetsr[j] = readl_gicd(GICD_ITARGETSR + off + j * 4);
+        }
+
+        off = i * sizeof(irqs->icfgr);
+        for ( j = 0; j < ARRAY_SIZE(irqs->icfgr); j++ )
+            irqs->icfgr[j] = readl_gicd(GICD_ICFGR + off + j * 4);
+    }
+
+    return 0;
+}
+
+static void gicv2_resume(void)
+{
+    unsigned int i, blocks = DIV_ROUND_UP(gicv2_info.nr_lines, 32);
+
+    gicv2_cpu_disable();
+    /* Disable distributor */
+    writel_gicd(0, GICD_CTLR);
+
+    for ( i = 0; i < blocks; i++ )
+    {
+        struct irq_block *irqs = gic_ctx.dist.irqs + i;
+        size_t j, off = i * sizeof(irqs->isenabler);
+
+        writel_gicd(0xffffffffU, GICD_ICENABLER + off);
+        writel_gicd(irqs->isenabler, GICD_ISENABLER + off);
+
+        writel_gicd(0xffffffffU, GICD_ICACTIVER + off);
+        writel_gicd(irqs->isactiver, GICD_ISACTIVER + off);
+
+        off = i * sizeof(irqs->ipriorityr);
+        for ( j = 0; j < ARRAY_SIZE(irqs->ipriorityr); j++ )
+        {
+            writel_gicd(irqs->ipriorityr[j], GICD_IPRIORITYR + off + j * 4);
+            writel_gicd(irqs->itargetsr[j], GICD_ITARGETSR + off + j * 4);
+        }
+
+        off = i * sizeof(irqs->icfgr);
+        for ( j = 0; j < ARRAY_SIZE(irqs->icfgr); j++ )
+            writel_gicd(irqs->icfgr[j], GICD_ICFGR + off + j * 4);
+    }
+
+    /* Make sure all registers are restored and enable distributor */
+    writel_gicd(gic_ctx.dist.ctlr, GICD_CTLR);
+
+    /* Restore GIC CPU interface configuration */
+    writel_gicc(gic_ctx.cpu.pmr, GICC_PMR);
+    writel_gicc(gic_ctx.cpu.bpr, GICC_BPR);
+
+    /* Enable GIC CPU interface */
+    writel_gicc(gic_ctx.cpu.ctlr, GICC_CTLR);
+}
+
+static void __init gicv2_alloc_context(void)
+{
+    uint32_t blocks = DIV_ROUND_UP(gicv2_info.nr_lines, 32);
+
+    gic_ctx.dist.irqs = xzalloc_array(struct irq_block, blocks);
+    if ( !gic_ctx.dist.irqs )
+        panic("Failed to allocate memory for GICv2 suspend context\n");
+}
+
+#endif /* CONFIG_SYSTEM_SUSPEND */
+
 #ifdef CONFIG_ACPI
 static unsigned long gicv2_get_hwdom_extra_madt_size(const struct domain *d)
 {
@@ -1302,6 +1419,11 @@ static int __init gicv2_init(void)
 
     spin_unlock(&gicv2.lock);
 
+#ifdef CONFIG_SYSTEM_SUSPEND
+    /* Allocate memory to be used for saving GIC context during the suspend */
+    gicv2_alloc_context();
+#endif /* CONFIG_SYSTEM_SUSPEND */
+
     return 0;
 }
 
@@ -1345,6 +1467,10 @@ static const struct gic_hw_operations gicv2_ops = {
     .map_hwdom_extra_mappings = gicv2_map_hwdom_extra_mappings,
     .iomem_deny_access   = gicv2_iomem_deny_access,
     .do_LPI              = gicv2_do_LPI,
+#ifdef CONFIG_SYSTEM_SUSPEND
+    .suspend             = gicv2_suspend,
+    .resume              = gicv2_resume,
+#endif /* CONFIG_SYSTEM_SUSPEND */
 };
 
 /* Set up the GIC */
diff --git a/xen/arch/arm/gic.c b/xen/arch/arm/gic.c
index ee75258fc3..7727ffed5a 100644
--- a/xen/arch/arm/gic.c
+++ b/xen/arch/arm/gic.c
@@ -432,6 +432,35 @@ int gic_iomem_deny_access(struct domain *d)
     return gic_hw_ops->iomem_deny_access(d);
 }
 
+#ifdef CONFIG_SYSTEM_SUSPEND
+
+int gic_suspend(void)
+{
+    /* Must be called by boot CPU#0 with interrupts disabled */
+    ASSERT(!local_irq_is_enabled());
+    ASSERT(!smp_processor_id());
+
+    if ( !gic_hw_ops->suspend || !gic_hw_ops->resume )
+        return -ENOSYS;
+
+    return gic_hw_ops->suspend();
+}
+
+void gic_resume(void)
+{
+    /*
+     * Must be called by boot CPU#0 with interrupts disabled after gic_suspend
+     * has returned successfully.
+     */
+    ASSERT(!local_irq_is_enabled());
+    ASSERT(!smp_processor_id());
+    ASSERT(gic_hw_ops->resume);
+
+    gic_hw_ops->resume();
+}
+
+#endif /* CONFIG_SYSTEM_SUSPEND */
+
 static int cpu_gic_callback(struct notifier_block *nfb,
                             unsigned long action,
                             void *hcpu)
diff --git a/xen/arch/arm/include/asm/gic.h b/xen/arch/arm/include/asm/gic.h
index 8e713aa477..8e8f4ac4c5 100644
--- a/xen/arch/arm/include/asm/gic.h
+++ b/xen/arch/arm/include/asm/gic.h
@@ -280,6 +280,12 @@ extern int gicv_setup(struct domain *d);
 extern void gic_save_state(struct vcpu *v);
 extern void gic_restore_state(struct vcpu *v);
 
+#ifdef CONFIG_SYSTEM_SUSPEND
+/* Suspend/resume */
+extern int gic_suspend(void);
+extern void gic_resume(void);
+#endif /* CONFIG_SYSTEM_SUSPEND */
+
 /* SGI (AKA IPIs) */
 enum gic_sgi {
     GIC_SGI_EVENT_CHECK,
@@ -423,6 +429,12 @@ struct gic_hw_operations {
     int (*iomem_deny_access)(struct domain *d);
     /* Handle LPIs, which require special handling */
     void (*do_LPI)(unsigned int lpi);
+#ifdef CONFIG_SYSTEM_SUSPEND
+    /* Save GIC configuration due to the system suspend */
+    int (*suspend)(void);
+    /* Restore GIC configuration due to the system resume */
+    void (*resume)(void);
+#endif /* CONFIG_SYSTEM_SUSPEND */
 };
 
 extern const struct gic_hw_operations *gic_hw_ops;
-- 
2.43.0


