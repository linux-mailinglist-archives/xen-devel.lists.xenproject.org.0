Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BBE7DCB6F0E
	for <lists+xen-devel@lfdr.de>; Thu, 11 Dec 2025 19:46:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1184552.1507026 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vTlfs-00054T-Ns; Thu, 11 Dec 2025 18:46:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1184552.1507026; Thu, 11 Dec 2025 18:46:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vTlfs-00052Y-G5; Thu, 11 Dec 2025 18:46:00 +0000
Received: by outflank-mailman (input) for mailman id 1184552;
 Thu, 11 Dec 2025 18:45:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QWGN=6R=gmail.com=xakep.amatop@srs-se1.protection.inumbo.net>)
 id 1vTlfq-0003I8-OZ
 for xen-devel@lists.xenproject.org; Thu, 11 Dec 2025 18:45:58 +0000
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [2a00:1450:4864:20::632])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a1a96d36-d6c1-11f0-b15b-2bf370ae4941;
 Thu, 11 Dec 2025 19:45:57 +0100 (CET)
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-b734fcbf1e3so90814766b.3
 for <xen-devel@lists.xenproject.org>; Thu, 11 Dec 2025 10:45:58 -0800 (PST)
Received: from EPUAKYIW02F7.. (pool185-5-253-4.as6723.net. [185.5.253.4])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b7cfa5d0b0dsm345870466b.67.2025.12.11.10.45.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Dec 2025 10:45:56 -0800 (PST)
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
X-Inumbo-ID: a1a96d36-d6c1-11f0-b15b-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765478757; x=1766083557; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YyX+DKhss3Tir9n7VoBzOtKgYwwNvTr5WMzP0cAUYTo=;
        b=SeqabM84oMlxwqvC9qGw216lkj/k6KV2LnAvS0TPSvHsyRLEN/t2xMUrxPRl8qqYnK
         o1hzMP15Q2yDfptcZKqlFrqVPiSNnyShUcryIaKEmqEsQZTImE3HgfQWMh4FbIuADwlK
         VynWznj/G9dqfOWi9DTiAVM76ItI21u1+dDa64zmEd/mGIuMg+X/HPppdNJWs8yaQctx
         OAoy69Hq+kEp87Ub/0kqNQQKm3TBk5sm3yNm0QFaisBE2sleRBSbNhmEySnP6fgKQaxB
         hq4CtStARO8ACsbW27XHsbkku3zm0O/71jywK6WT0hWkUBuWoEpLusFnt7yRlktkVIZ2
         1lGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765478757; x=1766083557;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=YyX+DKhss3Tir9n7VoBzOtKgYwwNvTr5WMzP0cAUYTo=;
        b=bb3ayGURspc+VaQNkBWEp5NQbkBdElX37swNx56XOe41UMlVoBWwl3KmagthXQtqRc
         zxvVewya7kspU/ly2blIoHACz61CHQqkxv/SmZH/bk/Yg5PNEc/uHMyDB5g5bixUCN3+
         4ODA0KqkQ8sPJdlSAryzNNVGvjH59D/jAYTvbGGUbryrBY3oOR4PhOJexpY3I6XeKQkR
         VFHT5qKCZOPwcgQzlHz0LrRuLBIMF9G44kojDrV3eIIqJAj+I9pK1GoWl27601E3OdN6
         T15FepqEPxp0pV0KBTYFnUS5YC9yg2CyXNJYQVPufM2FBvr9rhFT30wITEpFyrqDo3iZ
         9wDQ==
X-Gm-Message-State: AOJu0Yw9FNZwarjCXykUs1z4rZla+CjgaSezchPNPpP5xxM1Ocw70/uj
	pWtNBMjZnSjtTaSbGAPKTkqsSij+Y7FJriaX8vhIqfZMqJeaoPkGRxMCp0cmF5P4
X-Gm-Gg: AY/fxX5S3XQ9XxJ6wT/ztpgsEdWea2B38IJ/7aUdQkpYicv3disAl2aZLuHOna4e4by
	Fl5sWNHDLPVJnSlfp7WeMH1unMrE2NX1DmNnwac34criY3HeAQ/l6nU7yikr6qIXKen5rXeiW+b
	4pY2thGg7BUTZufzav042/m+OUn+7H1JgwafvbCaJXjDhEMnsKZUnvwJbdvGgCcSZyH+7lEA8Kj
	xLAQBvPVaSMUFBFJc8GYnAG5slwyZm7ULz/UOZfqVyPYf95rCpJMJgOJcOroM0KGjkzqZZeJpsO
	T1B1+82rgCpsTyIt5f5QzIfFGNcnIKu0pV+hrFsUSn2HFXVucCbqgjxax9psyTH4ES4uSe1Kj6o
	RR03HnDoTnUGeN/1xd5hUZ24OE7yhGE1q9+EbEwQIBkrJNCJKwco+XmbWHZvpoSifXfOgcM2H55
	16QuQVox02Z1uAQ31kBDKEVy0jXBqgk5679Prc1DVE
X-Google-Smtp-Source: AGHT+IHqZwnZeJZ9SiPy9sMGvjH5yQTECZVUy2zQSTwn/fCCIricEV1JkHIoYJqUXa8UozBVjbaDgw==
X-Received: by 2002:a17:907:6ea7:b0:b73:5c12:3f8a with SMTP id a640c23a62f3a-b7ce826e8b7mr710504466b.18.1765478756907;
        Thu, 11 Dec 2025 10:45:56 -0800 (PST)
From: Mykola Kvach <xakep.amatop@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Mykola Kvach <mykola_kvach@epam.com>,
	Mykola Kvach <xakep.amatop@gmail.com>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Rahul Singh <rahul.singh@arm.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Pranjal Shrivastava <praan@google.com>
Subject: [PATCH v7 08/12] arm/smmu-v3: add suspend/resume handlers
Date: Thu, 11 Dec 2025 20:43:32 +0200
Message-ID: <58c1873d355f5ea9b5182349895905d25cb57256.1765472890.git.mykola_kvach@epam.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1765472890.git.mykola_kvach@epam.com>
References: <cover.1765472890.git.mykola_kvach@epam.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Mykola Kvach <mykola_kvach@epam.com>

Before we suspend SMMU, we want to ensure that all commands (especially
ATC_INV) have been flushed by the CMDQ, i.e. the CMDQs are empty.

The suspend callback configures the SMMU to abort new transactions,
disables the main translation unit and then drains the command queue
to ensure completion of any in-flight commands.

The resume callback performs a full device reset via 'arm_smmu_device_reset'
to bring the SMMU back to an operational state.

Link: https://lore.kernel.org/linux-iommu/20251117191433.3360130-1-praan@google.com	/
Based-on-patch-by: Pranjal Shrivastava <praan@google.com>
Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
---
 xen/drivers/passthrough/arm/smmu-v3.c | 170 ++++++++++++++++++++------
 1 file changed, 134 insertions(+), 36 deletions(-)

diff --git a/xen/drivers/passthrough/arm/smmu-v3.c b/xen/drivers/passthrough/arm/smmu-v3.c
index bf153227db..10c4c5dee0 100644
--- a/xen/drivers/passthrough/arm/smmu-v3.c
+++ b/xen/drivers/passthrough/arm/smmu-v3.c
@@ -1814,8 +1814,7 @@ static int arm_smmu_write_reg_sync(struct arm_smmu_device *smmu, u32 val,
 }
 
 /* GBPA is "special" */
-static int __init arm_smmu_update_gbpa(struct arm_smmu_device *smmu,
-                                       u32 set, u32 clr)
+static int arm_smmu_update_gbpa(struct arm_smmu_device *smmu, u32 set, u32 clr)
 {
 	int ret;
 	u32 reg, __iomem *gbpa = smmu->base + ARM_SMMU_GBPA;
@@ -1995,10 +1994,29 @@ err_free_evtq_irq:
 	return ret;
 }
 
+static int arm_smmu_enable_irqs(struct arm_smmu_device *smmu)
+{
+	int ret;
+	u32 irqen_flags = IRQ_CTRL_EVTQ_IRQEN | IRQ_CTRL_GERROR_IRQEN;
+
+	if ( smmu->features & ARM_SMMU_FEAT_PRI )
+		irqen_flags |= IRQ_CTRL_PRIQ_IRQEN;
+
+	/* Enable interrupt generation on the SMMU */
+	ret = arm_smmu_write_reg_sync(smmu, irqen_flags,
+				      ARM_SMMU_IRQ_CTRL, ARM_SMMU_IRQ_CTRLACK);
+	if ( ret )
+	{
+		dev_warn(smmu->dev, "failed to enable irqs\n");
+		return ret;
+	}
+
+	return 0;
+}
+
 static int __init arm_smmu_setup_irqs(struct arm_smmu_device *smmu)
 {
 	int ret, irq;
-	u32 irqen_flags = IRQ_CTRL_EVTQ_IRQEN | IRQ_CTRL_GERROR_IRQEN;
 
 	/* Disable IRQs first */
 	ret = arm_smmu_write_reg_sync(smmu, 0, ARM_SMMU_IRQ_CTRL,
@@ -2028,22 +2046,7 @@ static int __init arm_smmu_setup_irqs(struct arm_smmu_device *smmu)
 		}
 	}
 
-	if (smmu->features & ARM_SMMU_FEAT_PRI)
-		irqen_flags |= IRQ_CTRL_PRIQ_IRQEN;
-
-	/* Enable interrupt generation on the SMMU */
-	ret = arm_smmu_write_reg_sync(smmu, irqen_flags,
-				      ARM_SMMU_IRQ_CTRL, ARM_SMMU_IRQ_CTRLACK);
-	if (ret) {
-		dev_warn(smmu->dev, "failed to enable irqs\n");
-		goto err_free_irqs;
-	}
-
 	return 0;
-
-err_free_irqs:
-	arm_smmu_free_irqs(smmu);
-	return ret;
 }
 
 static int arm_smmu_device_disable(struct arm_smmu_device *smmu)
@@ -2057,7 +2060,7 @@ static int arm_smmu_device_disable(struct arm_smmu_device *smmu)
 	return ret;
 }
 
-static int __init arm_smmu_device_reset(struct arm_smmu_device *smmu)
+static int arm_smmu_device_reset(struct arm_smmu_device *smmu)
 {
 	int ret;
 	u32 reg, enables;
@@ -2163,17 +2166,9 @@ static int __init arm_smmu_device_reset(struct arm_smmu_device *smmu)
 		}
 	}
 
-	ret = arm_smmu_setup_irqs(smmu);
-	if (ret) {
-		dev_err(smmu->dev, "failed to setup irqs\n");
+	ret = arm_smmu_enable_irqs(smmu);
+	if ( ret )
 		return ret;
-	}
-
-	/* Initialize tasklets for threaded IRQs*/
-	tasklet_init(&smmu->evtq_irq_tasklet, arm_smmu_evtq_tasklet, smmu);
-	tasklet_init(&smmu->priq_irq_tasklet, arm_smmu_priq_tasklet, smmu);
-	tasklet_init(&smmu->combined_irq_tasklet, arm_smmu_combined_irq_tasklet,
-				 smmu);
 
 	/* Enable the SMMU interface, or ensure bypass */
 	if (disable_bypass) {
@@ -2181,20 +2176,16 @@ static int __init arm_smmu_device_reset(struct arm_smmu_device *smmu)
 	} else {
 		ret = arm_smmu_update_gbpa(smmu, 0, GBPA_ABORT);
 		if (ret)
-			goto err_free_irqs;
+			return ret;
 	}
 	ret = arm_smmu_write_reg_sync(smmu, enables, ARM_SMMU_CR0,
 				      ARM_SMMU_CR0ACK);
 	if (ret) {
 		dev_err(smmu->dev, "failed to enable SMMU interface\n");
-		goto err_free_irqs;
+		return ret;
 	}
 
 	return 0;
-
-err_free_irqs:
-	arm_smmu_free_irqs(smmu);
-	return ret;
 }
 
 static int arm_smmu_device_hw_probe(struct arm_smmu_device *smmu)
@@ -2558,10 +2549,23 @@ static int __init arm_smmu_device_probe(struct platform_device *pdev)
 	if (ret)
 		goto out_free;
 
+	ret = arm_smmu_setup_irqs(smmu);
+	if ( ret )
+	{
+		dev_err(smmu->dev, "failed to setup irqs\n");
+		goto out_free;
+	}
+
+	/* Initialize tasklets for threaded IRQs*/
+	tasklet_init(&smmu->evtq_irq_tasklet, arm_smmu_evtq_tasklet, smmu);
+	tasklet_init(&smmu->priq_irq_tasklet, arm_smmu_priq_tasklet, smmu);
+	tasklet_init(&smmu->combined_irq_tasklet, arm_smmu_combined_irq_tasklet,
+				smmu);
+
 	/* Reset the device */
 	ret = arm_smmu_device_reset(smmu);
 	if (ret)
-		goto out_free;
+		goto out_free_irqs;
 
 	/*
 	 * Keep a list of all probed devices. This will be used to query
@@ -2575,6 +2579,8 @@ static int __init arm_smmu_device_probe(struct platform_device *pdev)
 
 	return 0;
 
+out_free_irqs:
+	arm_smmu_free_irqs(smmu);
 
 out_free:
 	arm_smmu_free_structures(smmu);
@@ -2855,6 +2861,94 @@ static void arm_smmu_iommu_xen_domain_teardown(struct domain *d)
 	xfree(xen_domain);
 }
 
+#ifdef CONFIG_SYSTEM_SUSPEND
+
+static int arm_smmu_suspend(void)
+{
+	struct arm_smmu_device *smmu;
+	int ret = 0;
+
+	list_for_each_entry(smmu, &arm_smmu_devices, devices)
+	{
+		/* Abort all transactions before disable to avoid spurious bypass */
+		ret = arm_smmu_update_gbpa(smmu, GBPA_ABORT, 0);
+		if ( ret )
+			goto fail;
+
+		/* Disable the SMMU via CR0.EN and all queues except CMDQ */
+		ret = arm_smmu_write_reg_sync(smmu, CR0_CMDQEN, ARM_SMMU_CR0,
+					ARM_SMMU_CR0ACK);
+		if ( ret )
+		{
+			dev_err(smmu->dev, "Timed-out while disabling smmu\n");
+			goto fail;
+		}
+
+		/*
+		 * At this point the SMMU is completely disabled and won't access
+		 * any translation/config structures, even speculative accesses
+		 * aren't performed as per the IHI0070 spec (section 6.3.9.6).
+		 */
+
+		/* Wait for the CMDQs to be drained to flush any pending commands */
+		ret = queue_poll_cons(&smmu->cmdq.q, true, 0);
+		if ( ret )
+		{
+			dev_err(smmu->dev, "Draining queues timed-out\n");
+			goto fail;
+		}
+
+		/* Disable everything */
+		ret = arm_smmu_device_disable(smmu);
+		if ( ret )
+			goto fail;
+
+		dev_dbg(smmu->dev, "Suspended smmu\n");
+	}
+
+	return 0;
+
+ fail:
+	{
+		int rc;
+
+		/* Reset the device that failed as well as any already-suspended ones. */
+		rc = arm_smmu_device_reset(smmu);
+		if ( rc )
+			dev_err(smmu->dev, "Failed to reset during resume operation: %d\n", rc);
+
+		list_for_each_entry_continue_reverse(smmu, &arm_smmu_devices, devices)
+		{
+			rc = arm_smmu_device_reset(smmu);
+			if ( rc )
+				dev_err(smmu->dev, "Failed to reset during resume operation: %d\n", rc);
+		}
+	}
+
+	return ret;
+}
+
+static void arm_smmu_resume(void)
+{
+	int ret;
+	struct arm_smmu_device *smmu;
+
+	list_for_each_entry(smmu, &arm_smmu_devices, devices)
+	{
+		dev_dbg(smmu->dev, "Resuming device\n");
+
+		/*
+		* The reset will re-initialize all the base addresses, queues,
+		* prod and cons maintained within struct arm_smmu_device as well as
+		* re-enable the interrupts.
+		*/
+		ret = arm_smmu_device_reset(smmu);
+		if ( ret )
+			dev_err(smmu->dev, "Failed to reset during resume operation: %d\n", ret);
+	}
+}
+#endif
+
 static const struct iommu_ops arm_smmu_iommu_ops = {
 	.page_sizes		= PAGE_SIZE_4K,
 	.init			= arm_smmu_iommu_xen_domain_init,
@@ -2867,6 +2961,10 @@ static const struct iommu_ops arm_smmu_iommu_ops = {
 	.unmap_page		= arm_iommu_unmap_page,
 	.dt_xlate		= arm_smmu_dt_xlate,
 	.add_device		= arm_smmu_add_device,
+#ifdef CONFIG_SYSTEM_SUSPEND
+	.suspend		= arm_smmu_suspend,
+	.resume			= arm_smmu_resume,
+#endif
 };
 
 static __init int arm_smmu_dt_init(struct dt_device_node *dev,
-- 
2.43.0


