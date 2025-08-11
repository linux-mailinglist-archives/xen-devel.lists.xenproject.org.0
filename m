Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DFACB216C4
	for <lists+xen-devel@lfdr.de>; Mon, 11 Aug 2025 22:49:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1077946.1438978 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ulZRv-0006Mb-OG; Mon, 11 Aug 2025 20:48:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1077946.1438978; Mon, 11 Aug 2025 20:48:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ulZRv-0006K0-Kv; Mon, 11 Aug 2025 20:48:55 +0000
Received: by outflank-mailman (input) for mailman id 1077946;
 Mon, 11 Aug 2025 20:48:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=21ui=2X=gmail.com=xakep.amatop@srs-se1.protection.inumbo.net>)
 id 1ulZRu-00063z-Mh
 for xen-devel@lists.xenproject.org; Mon, 11 Aug 2025 20:48:54 +0000
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [2a00:1450:4864:20::636])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9725a984-76f4-11f0-b898-0df219b8e170;
 Mon, 11 Aug 2025 22:48:53 +0200 (CEST)
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-af9611d8ff7so848816366b.1
 for <xen-devel@lists.xenproject.org>; Mon, 11 Aug 2025 13:48:53 -0700 (PDT)
Received: from yp-VivoBook-ASUSLaptop-M1503QA-M1503QA.Dlink ([77.52.179.38])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-af91a0a3bd2sm2065710466b.54.2025.08.11.13.48.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Aug 2025 13:48:50 -0700 (PDT)
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
X-Inumbo-ID: 9725a984-76f4-11f0-b898-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754945332; x=1755550132; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=D2plmqjz1DgU+9gEpcztVWyZmRTrqXcD635KTVAFbqc=;
        b=b4e03BYvNz0GSvEHkNtxhAhwhKHTgZNlnGygFoDqwrNdcRUME8jyDl5OXg+W108l5Z
         S21DgqtZC/6iZQbQ3Fzph3N4c3kSNkSVF8/WQANxGxfHl11SXs4isiHLDNTvJReBKKN0
         VCXWOfo0alXm1yeU/tiIiIRUweSg7p7ubEGC2mETDemZKh6q0cXWbj+I9tTlBgWXT1Dx
         VgL9X31AHHFn+9P8Iqv55h225yZ4omvcWZRkDHXZlMavSfbdbskX+P8+1ARumwquyOQx
         tBrWtgnu90N4OP5Oxa6zP3PTutMzIqDoGkLoCj+ewuNZszcEEQDRJoS/JcwPYsq7/4EJ
         IDhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754945332; x=1755550132;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=D2plmqjz1DgU+9gEpcztVWyZmRTrqXcD635KTVAFbqc=;
        b=Cqc/y2Cq6qs+9FE37W6xkyTC0PCaEZtnLHRu9yhZowvfpz/VhBihTQeuROS+2dQd4T
         FwakowQ+nbcZldVPcaXeDr79xyTTe+z3Vjis+ZMn+D+LuUayUszhUOe6/sRvv2Fciq0y
         /sYk/Ctpb6ptb5yx4Hc2h4l3JhzKFWnqGZ2rEyVzXR1xMSoq0ghe9BwPIsPgWaYyIKxr
         3wMeByS1Plzd23FqPNJiFszKIBk9EOSb/n8IQExuUV9aZzfdjFAT6yBntmXn4zh4Ff9T
         CL7hFsKLiq7Wz5drt4KulD1ewuxc+/AUQs0p2d2/itaR78RMuaebpi6cRwpZnsCvVnec
         /8Dw==
X-Gm-Message-State: AOJu0YwMZsaYet7gS1rlqP3/NnFJGM5RUxabWL8D7hOcQHbF7BwMV7Jo
	g1jJ1KgoEZ8YPM8P8DjBOuTqhVE9H81vZMDPSlmjJ58IUwUM6SwRu4Lb0ddf7A==
X-Gm-Gg: ASbGncuUtIVWyfDaO0/cmgfjgUtj81J9GN9nd1cpoSSa6d3WeR7JDxKDUWNRvPKB5Ir
	mce9uMRcuO4Izqac7EOsEvH7zihJ4PNNUHH3p8D1HC2N5y9Y0lfRv3eoXw9Y0DrkwZdt/kCgYao
	1QK3Aq0TqeVpg4tAb7cC/YY2oA+8ZwLJ3MoPXrMf/b1ziMoBZVvUiycyYFrESDzLKAqG1N0k3Sc
	Ma+TdAPoaEy3RCpl2C29NL07u2FD107ls4vI/MOc45ysTg6cIkZt7/+Pz7E1xrIsqUrvhqaP1cD
	H+SneS3fAxV07KB4EypGsxIaXQHX0Ylftu3XMESnClqdcK4frg0+1kQztiu2lPFwjGz7o/Nc8ho
	yiW+7kEDqxJiG2AhZ/S2fvFqLWnf2RjRc61yuFHUB0Fe1j6+bZHgZ1bZzFW7ZZqODw+4=
X-Google-Smtp-Source: AGHT+IEfEKJYD9M3gJWf+20en40xDaPHCADL22orakBaGISswdWEmQXSl3jT0ikHDz+HYSPYdX9Vgg==
X-Received: by 2002:a17:906:6b93:b0:acb:37ae:619c with SMTP id a640c23a62f3a-afa1d6d2c48mr79546266b.15.1754945331921;
        Mon, 11 Aug 2025 13:48:51 -0700 (PDT)
From: Mykola Kvach <xakep.amatop@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Mykola Kvach <mykola_kvach@epam.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v5 03/12] xen/arm: gic-v3: Implement GICv3 suspend/resume functions
Date: Mon, 11 Aug 2025 23:47:59 +0300
Message-ID: <451b8a0527a6193b6687e1c85bd254b4dfda142d.1754943874.git.mykola_kvach@epam.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <cover.1754943874.git.mykola_kvach@epam.com>
References: <cover.1754943874.git.mykola_kvach@epam.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Mykola Kvach <mykola_kvach@epam.com>

System suspend may lead to a state where GIC would be powered down.
Therefore, Xen should save/restore the context of GIC on suspend/resume.

Note that the context consists of states of registers which are
controlled by the hypervisor. Other GIC registers which are accessible
by guests are saved/restored on context switch.

Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
---
 xen/arch/arm/gic-v3.c | 233 ++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 233 insertions(+)

diff --git a/xen/arch/arm/gic-v3.c b/xen/arch/arm/gic-v3.c
index cd3e1acf79..a9b65ff5d4 100644
--- a/xen/arch/arm/gic-v3.c
+++ b/xen/arch/arm/gic-v3.c
@@ -1776,6 +1776,231 @@ static bool gic_dist_supports_lpis(void)
     return (readl_relaxed(GICD + GICD_TYPER) & GICD_TYPE_LPIS);
 }
 
+#ifdef CONFIG_SYSTEM_SUSPEND
+
+/* GICv3 registers to be saved/restored on system suspend/resume */
+struct gicv3_ctx {
+    struct dist_ctx {
+        uint32_t ctlr;
+        /*
+         * This struct represent block of 32 IRQs
+         * TODO: store extended SPI configuration (GICv3.1+)
+         */
+        struct irq_regs {
+            uint32_t icfgr[2];
+            uint32_t ipriorityr[8];
+            uint64_t irouter[32];
+            uint32_t isactiver;
+            uint32_t isenabler;
+        } *irqs;
+    } dist;
+
+    /* have only one rdist structure for last running CPU during suspend */
+    struct redist_ctx {
+        uint32_t ctlr;
+        /* TODO: handle case when we have more than 16 PPIs (GICv3.1+) */
+        uint32_t icfgr[2];
+        uint32_t igroupr;
+        uint32_t ipriorityr[8];
+        uint32_t isactiver;
+        uint32_t isenabler;
+    } rdist;
+
+    struct cpu_ctx {
+        uint32_t ctlr;
+        uint32_t pmr;
+        uint32_t bpr;
+        uint32_t sre_el2;
+        uint32_t grpen;
+    } cpu;
+};
+
+static struct gicv3_ctx gicv3_ctx;
+
+static void __init gicv3_alloc_context(void)
+{
+    uint32_t blocks = DIV_ROUND_UP(gicv3_info.nr_lines, 32);
+
+    if ( gicv3_its_host_has_its() )
+        return;
+
+    /* according to spec it is possible don't have SPIs */
+    if ( blocks == 1 )
+        return;
+
+    gicv3_ctx.dist.irqs = xzalloc_array(typeof(*gicv3_ctx.dist.irqs), blocks - 1);
+    if ( !gicv3_ctx.dist.irqs )
+        dprintk(XENLOG_ERR,
+                "%s:%d: failed to allocate memory for GICv3 suspend context\n",
+                __func__, __LINE__);
+}
+
+static void gicv3_disable_redist(void)
+{
+    void __iomem* waker = GICD_RDIST_BASE + GICR_WAKER;
+
+    writel_relaxed(readl_relaxed(waker) | GICR_WAKER_ProcessorSleep, waker);
+    while ( (readl_relaxed(waker) & GICR_WAKER_ChildrenAsleep) == 0 );
+}
+
+static int gicv3_suspend(void)
+{
+    unsigned int i;
+    void __iomem *base;
+    typeof(gicv3_ctx.rdist)* rdist = &gicv3_ctx.rdist;
+
+    /* TODO: implement support for ITS */
+    if ( gicv3_its_host_has_its() )
+        return -EOPNOTSUPP;
+
+    if ( !gicv3_ctx.dist.irqs && gicv3_info.nr_lines > NR_GIC_LOCAL_IRQS )
+    {
+        dprintk(XENLOG_WARNING,
+                "%s:%d: GICv3 suspend context is not allocated!\n",
+                __func__, __LINE__);
+        return -ENOMEM;
+    }
+
+    gicv3_save_state(current);
+
+    /* Save GICC configuration */
+    gicv3_ctx.cpu.ctlr     = READ_SYSREG(ICC_CTLR_EL1);
+    gicv3_ctx.cpu.pmr      = READ_SYSREG(ICC_PMR_EL1);
+    gicv3_ctx.cpu.bpr      = READ_SYSREG(ICC_BPR1_EL1);
+    gicv3_ctx.cpu.sre_el2  = READ_SYSREG(ICC_SRE_EL2);
+    gicv3_ctx.cpu.grpen    = READ_SYSREG(ICC_IGRPEN1_EL1);
+
+    gicv3_disable_interface();
+    gicv3_disable_redist();
+
+    /* Save GICR configuration */
+    gicv3_redist_wait_for_rwp();
+
+    base = GICD_RDIST_SGI_BASE;
+
+    rdist->ctlr = readl_relaxed(base + GICR_CTLR);
+
+    /* Set priority on PPI and SGI interrupts */
+    for (i = 0; i < NR_GIC_LOCAL_IRQS / 4; i += 4)
+        rdist->ipriorityr[i] = readl_relaxed(base + GICR_IPRIORITYR0 + 4 * i);
+
+    rdist->isactiver = readl_relaxed(base + GICR_ISACTIVER0);
+    rdist->isenabler = readl_relaxed(base + GICR_ISENABLER0);
+    rdist->igroupr   = readl_relaxed(base + GICR_IGROUPR0);
+    rdist->icfgr[0]  = readl_relaxed(base + GICR_ICFGR0);
+    rdist->icfgr[1]  = readl_relaxed(base + GICR_ICFGR1);
+
+    /* Save GICD configuration */
+    gicv3_dist_wait_for_rwp();
+    gicv3_ctx.dist.ctlr = readl_relaxed(GICD + GICD_CTLR);
+
+    for ( i = 1; i < DIV_ROUND_UP(gicv3_info.nr_lines, 32); i++ )
+    {
+        typeof(gicv3_ctx.dist.irqs) irqs = gicv3_ctx.dist.irqs + i - 1;
+        unsigned int irq;
+
+        base = GICD + GICD_ICFGR + 8 * i;
+        irqs->icfgr[0] = readl_relaxed(base);
+        irqs->icfgr[1] = readl_relaxed(base + 4);
+
+        base = GICD + GICD_IPRIORITYR + 32 * i;
+        for ( irq = 0; irq < 8; irq++ )
+            irqs->ipriorityr[irq] = readl_relaxed(base + 4 * irq);
+
+        base = GICD + GICD_IROUTER + 32 * i;
+        for ( irq = 0; irq < 32; irq++ )
+            irqs->irouter[irq] = readq_relaxed_non_atomic(base + 8 * irq);
+
+        irqs->isactiver = readl_relaxed(GICD + GICD_ISACTIVER + 4 * i);
+        irqs->isenabler = readl_relaxed(GICD + GICD_ISENABLER + 4 * i);
+    }
+
+    return 0;
+}
+
+static void gicv3_resume(void)
+{
+    unsigned int i;
+    void __iomem *base;
+    typeof(gicv3_ctx.rdist)* rdist = &gicv3_ctx.rdist;
+
+    if ( !gicv3_ctx.dist.irqs && gicv3_info.nr_lines > NR_GIC_LOCAL_IRQS )
+    {
+        dprintk(XENLOG_WARNING, "%s:%d: GICv3 suspend context not allocated!\n",
+            __func__, __LINE__);
+        return;
+    }
+
+    writel_relaxed(0, GICD + GICD_CTLR);
+
+    for ( i = NR_GIC_LOCAL_IRQS; i < gicv3_info.nr_lines; i += 32 )
+        writel_relaxed(GENMASK(31, 0), GICD + GICD_IGROUPR + (i / 32) * 4);
+
+    for ( i = 1; i < DIV_ROUND_UP(gicv3_info.nr_lines, 32); i++ )
+    {
+        typeof(gicv3_ctx.dist.irqs) irqs = gicv3_ctx.dist.irqs + i - 1;
+        unsigned int irq;
+
+        base = GICD + GICD_ICFGR + 8 * i;
+        writel_relaxed(irqs->icfgr[0], base);
+        writel_relaxed(irqs->icfgr[1], base + 4);
+
+        base = GICD + GICD_IPRIORITYR + 32 * i;
+        for ( irq = 0; irq < 8; irq++ )
+            writel_relaxed(irqs->ipriorityr[irq], base + 4 * irq );
+
+        base = GICD + GICD_IROUTER + 32 * i;
+        for ( irq = 0; irq < 32; irq++ )
+            writeq_relaxed_non_atomic(irqs->irouter[irq], base + 8 * irq);
+
+        writel_relaxed(irqs->isenabler, GICD + GICD_ISENABLER + i * 4);
+        writel_relaxed(irqs->isactiver, GICD + GICD_ISACTIVER + i * 4);
+    }
+
+    writel_relaxed(gicv3_ctx.dist.ctlr, GICD + GICD_CTLR);
+    gicv3_dist_wait_for_rwp();
+
+    /* Restore GICR (Redistributor) configuration */
+    gicv3_enable_redist();
+
+    base = GICD_RDIST_SGI_BASE;
+
+    writel_relaxed(0xffffffff, base + GICR_ICENABLER0);
+    gicv3_redist_wait_for_rwp();
+
+    for (i = 0; i < NR_GIC_LOCAL_IRQS / 4; i += 4)
+        writel_relaxed(rdist->ipriorityr[i], base + GICR_IPRIORITYR0 + i * 4);
+
+    writel_relaxed(rdist->isactiver, base + GICR_ISACTIVER0);
+
+    writel_relaxed(rdist->igroupr,  base + GICR_IGROUPR0);
+    writel_relaxed(rdist->icfgr[0], base + GICR_ICFGR0);
+    writel_relaxed(rdist->icfgr[1], base + GICR_ICFGR1);
+
+    gicv3_redist_wait_for_rwp();
+
+    writel_relaxed(rdist->isenabler, base + GICR_ISENABLER0);
+    writel_relaxed(rdist->ctlr, GICD_RDIST_BASE + GICR_CTLR);
+
+    gicv3_redist_wait_for_rwp();
+
+    WRITE_SYSREG(gicv3_ctx.cpu.sre_el2, ICC_SRE_EL2);
+    isb();
+
+    /* Restore CPU interface (System registers) */
+    WRITE_SYSREG(gicv3_ctx.cpu.pmr,   ICC_PMR_EL1);
+    WRITE_SYSREG(gicv3_ctx.cpu.bpr,   ICC_BPR1_EL1);
+    WRITE_SYSREG(gicv3_ctx.cpu.ctlr,  ICC_CTLR_EL1);
+    WRITE_SYSREG(gicv3_ctx.cpu.grpen, ICC_IGRPEN1_EL1);
+    isb();
+
+    gicv3_hyp_init();
+
+    gicv3_restore_state(current);
+}
+
+#endif /* CONFIG_SYSTEM_SUSPEND */
+
 /* Set up the GIC */
 static int __init gicv3_init(void)
 {
@@ -1850,6 +2075,10 @@ static int __init gicv3_init(void)
 
     gicv3_hyp_init();
 
+#ifdef CONFIG_SYSTEM_SUSPEND
+    gicv3_alloc_context();
+#endif
+
 out:
     spin_unlock(&gicv3.lock);
 
@@ -1889,6 +2118,10 @@ static const struct gic_hw_operations gicv3_ops = {
 #endif
     .iomem_deny_access   = gicv3_iomem_deny_access,
     .do_LPI              = gicv3_do_LPI,
+#ifdef CONFIG_SYSTEM_SUSPEND
+    .suspend             = gicv3_suspend,
+    .resume              = gicv3_resume,
+#endif
 };
 
 static int __init gicv3_dt_preinit(struct dt_device_node *node, const void *data)
-- 
2.48.1


