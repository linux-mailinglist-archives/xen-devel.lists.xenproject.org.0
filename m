Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +Av0L19JzmlRmgYAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 02 Apr 2026 12:47:59 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 77EA0387DCE
	for <lists+xen-devel@lfdr.de>; Thu, 02 Apr 2026 12:47:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1271531.1559712 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w8FaN-0006Aa-A4; Thu, 02 Apr 2026 10:47:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1271531.1559712; Thu, 02 Apr 2026 10:47:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w8FaM-00068W-TW; Thu, 02 Apr 2026 10:47:38 +0000
Received: by outflank-mailman (input) for mailman id 1271531;
 Thu, 02 Apr 2026 10:47:37 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <xakep.amatop@gmail.com>) id 1w8FaK-0005kv-QR
 for xen-devel@lists.xenproject.org; Thu, 02 Apr 2026 10:47:36 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w8FaK-004haJ-6K
 for xen-devel@lists.xenproject.org; Thu, 02 Apr 2026 12:47:36 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <xakep.amatop@gmail.com>)
 id 69ce4943-5cb7-0a2a0a5109dd-0a2a4502ebd6-10
 for <xen-devel@lists.xenproject.org>; Thu, 02 Apr 2026 12:47:36 +0200
Received: from [209.85.218.44] (helo=mail-ej1-f44.google.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from <xakep.amatop@gmail.com>)
 id 69ce4948-42fa-0a2a45020019-d155da2cf1bf-3
 for <xen-devel@lists.xenproject.org>; Thu, 02 Apr 2026 12:47:36 +0200
Received: by mail-ej1-f44.google.com with SMTP id
 a640c23a62f3a-b9825ba7e8dso100467666b.3
 for <xen-devel@lists.xenproject.org>; Thu, 02 Apr 2026 03:47:36 -0700 (PDT)
Received: from EPUAKYIW02F7.. ([45.12.26.38]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b9c3d028955sm76392366b.61.2026.04.02.03.47.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Apr 2026 03:47:34 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20251104 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775126855; x=1775731655; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DKnYT2Yc1d3B8QvA2ZhD3FJdUHpvRkUQIwPnTMgKX5Y=;
        b=bCrEUNUJ0ujzdDmlWh/za3go8C0Ea+LBzhUnSFUJ38jS8kUWk0cLniOqlZpbUSLSq+
         FBjtALoMRQVzsuUdV1Lh60j+u7vS7cKDlZi2Xa4MRPe4ggIa0xjMC7IsGWwV3oLvB64w
         FPt0qtj6kP1VT3lKi3qxap/eD72vYNys+ETk75Rvf4tNMvyUILf468bjdb/ZmyayfyyT
         o3xjXlTUpkfDutf5Y5yDQ4qJ7AVuPtqptoqys+vC8nUzAgBDTslTv1JIumjOn7pCU89B
         gTuDwug4LpegVWWoxigP+w9/xgWVSQivVYJMpanebh8OzPDPZU9o+MBJobfqiev+Yzsr
         YnpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775126855; x=1775731655;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=DKnYT2Yc1d3B8QvA2ZhD3FJdUHpvRkUQIwPnTMgKX5Y=;
        b=GHkDA51O2lmTEW6QDZXWNZeSpNh0mGWB7O4wPFwK+WwK/Hx7W9apYYTmVGF0Q9VP9r
         DRr4XBkadXfNk1p3iO5v3nggkVl6sB8tOm2VbO0yDdtue28kifGKHJKbjDaKFYPC3o7c
         R7pFXWFn7QDmberRqY8VuqgFkHLBsRVlqVbyCaE1Om1VVhz8Xd4Zkqv7XrYEnULflPgC
         g9mmnr8/muXOKP0yKv5H9FJjMb0S6ddGC0A/lTEWnk2f/LENmr0s8cU6VyKz/d8PA0Ug
         FA4d8d4TM6ZmQISacB1UbwNGxzhAOnYMdFWa+UbeLZHWIJ7kuC52EAuOhjAHu2SLUbH4
         RJFw==
X-Gm-Message-State: AOJu0YxXbb82FalwVJV9nZ3hLvbK8K6IUzuAebn0zgE0zDQG/xP1Aey1
	J6PogFycwjQdQ27Kqiiu7qVQhi6q5e4tcx7jaQ6RfD3EFQ9IL9xNH2n68gXm/9JV
X-Gm-Gg: ATEYQzxdXI4uWAb226DU5VzAbYXHxZQKFV0p6O0gwnUL6dJweqNXMjlZ+RWdyZuAAIo
	ArMVgIwlRkb/491TiyNjyq79lOJ45GBESSX3ObFpLAg9m/IWv4eY1ezcrt0U84akApJOA5BWDQE
	Yi7CsKcg72kkd8xAUpFDFhbG8pj64siLGBAVuSu3HVTILj7OLmwmWFyxVs6qy5yzKAXrKEXVCcK
	Ao1tanTuXJK0puLg+hSFaWUck8h7Fue06dc7xV4wouL6MQBpMR2V00g6locnFdaMeWFsO3Ynh8A
	yjlv3e0OnZiY0eXSHyXoN2xSCoY6/VtAzl8BA6qfI0RDw155iUYqvolp0o3Izc1CeYwONxc3h+n
	F/pMAsYXS/Dt1pjMZfVKKmqq71esN/vb5hmpVQJvghick1WiaqZLkiv4LN9IjFlw02Ke2viNLH+
	gZILTm6iaSn4sTBSyFX+p9ezIS3Q==
X-Received: by 2002:a17:906:5789:b0:b93:ff4d:8e38 with SMTP id a640c23a62f3a-b9c138f657dmr370628066b.20.1775126855136;
        Thu, 02 Apr 2026 03:47:35 -0700 (PDT)
From: Mykola Kvach <xakep.amatop@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Mykola Kvach <mykola_kvach@epam.com>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Rahul Singh <rahul.singh@arm.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v8 09/13] arm/smmu-v3: add suspend/resume handlers
Date: Thu,  2 Apr 2026 13:45:10 +0300
Message-ID: <038337ec0e3f1474c6cc6a92090e28c6972e4dc6.1775125380.git.mykola_kvach@epam.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1775125380.git.mykola_kvach@epam.com>
References: <cover.1775125380.git.mykola_kvach@epam.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-720697/1775126856-AEB27CD1-92ABB1C3/0/0
X-purgate-type: clean
X-purgate-size: 8574
X-Spamd-Result: default: False [-0.69 / 15.00];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:mykola_kvach@epam.com,m:bertrand.marquis@arm.com,m:rahul.singh@arm.com,m:sstabellini@kernel.org,m:julien@xen.org,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[xakepamatop@gmail.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[epam.com:email,epam.com:mid,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	FROM_NEQ_ENVFROM(0.00)[xakepamatop@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 77EA0387DCE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Before we suspend SMMU, we want to ensure that all commands (especially
ATC_INV) have been flushed by the CMDQ, i.e. the CMDQs are empty.

The suspend callback configures the SMMU to abort new transactions,
disables the main translation unit and then drains the command queue
to ensure completion of any in-flight commands.

The resume callback performs a full device reset via 'arm_smmu_device_reset'
to bring the SMMU back to an operational state.

Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
---
Changes in V8:
- Honor ARM_SMMU_FEAT_SEV when draining the CMDQ during suspend, matching
  the existing runtime CMD_SYNC path.
- Fold the suspend rollback reset path into a helper and rename the error
  reporting to describe suspend rollback rather than resume.
- Treat SMMU reset failure during resume as fatal instead of logging and
  continuing with a potentially unusable IOMMU.
- cosmetic changes
---
 xen/drivers/passthrough/arm/smmu-v3.c | 172 ++++++++++++++++++++------
 1 file changed, 136 insertions(+), 36 deletions(-)

diff --git a/xen/drivers/passthrough/arm/smmu-v3.c b/xen/drivers/passthrough/arm/smmu-v3.c
index bf153227db..7607ffc9ca 100644
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
@@ -2855,6 +2861,96 @@ static void arm_smmu_iommu_xen_domain_teardown(struct domain *d)
 	xfree(xen_domain);
 }
 
+#ifdef CONFIG_SYSTEM_SUSPEND
+
+static void arm_smmu_reset_for_suspend_rollback(struct arm_smmu_device *smmu)
+{
+	int ret = arm_smmu_device_reset(smmu);
+
+	if ( ret )
+		dev_err(smmu->dev, "Failed to reset during suspend rollback: %d\n",
+				ret);
+}
+
+static int arm_smmu_suspend(void)
+{
+	struct arm_smmu_device *smmu;
+	int ret = 0;
+
+	list_for_each_entry(smmu, &arm_smmu_devices, devices)
+	{
+		bool wfe = !!(smmu->features & ARM_SMMU_FEAT_SEV);
+
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
+		ret = queue_poll_cons(&smmu->cmdq.q, true, wfe);
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
+	/* Reset the device that failed as well as any already-suspended ones. */
+	arm_smmu_reset_for_suspend_rollback(smmu);
+
+	list_for_each_entry_continue_reverse(smmu, &arm_smmu_devices, devices)
+		arm_smmu_reset_for_suspend_rollback(smmu);
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
+		 * The reset will re-initialize all the base addresses, queues,
+		 * prod and cons maintained within struct arm_smmu_device as well as
+		 * re-enable the interrupts.
+		 */
+		ret = arm_smmu_device_reset(smmu);
+		if ( ret )
+			panic("SMMUv3: %s: Failed to reset during resume: %d\n",
+			      dev_name(smmu->dev), ret);
+	}
+}
+#endif
+
 static const struct iommu_ops arm_smmu_iommu_ops = {
 	.page_sizes		= PAGE_SIZE_4K,
 	.init			= arm_smmu_iommu_xen_domain_init,
@@ -2867,6 +2963,10 @@ static const struct iommu_ops arm_smmu_iommu_ops = {
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


