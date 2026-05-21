Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8A/WAYZFD2ptIgYAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 21 May 2026 19:48:54 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B7FA5AA90B
	for <lists+xen-devel@lfdr.de>; Thu, 21 May 2026 19:48:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1315658.1585435 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wQ7VT-00033j-J2; Thu, 21 May 2026 17:48:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1315658.1585435; Thu, 21 May 2026 17:48:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wQ7VT-0002xp-5r; Thu, 21 May 2026 17:48:27 +0000
Received: by outflank-mailman (input) for mailman id 1315658;
 Thu, 21 May 2026 17:48:25 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <xakep.amatop@gmail.com>) id 1wQ7VR-0002Zw-5J
 for xen-devel@lists.xenproject.org; Thu, 21 May 2026 17:48:25 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wQ7VQ-003Sgm-I0
 for xen-devel@lists.xenproject.org; Thu, 21 May 2026 19:48:24 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <xakep.amatop@gmail.com>)
 id 6a0f4544-2eae-0a2a0a5409dd-0a2a450a9b7a-46
 for <xen-devel@lists.xenproject.org>; Thu, 21 May 2026 19:48:24 +0200
Received: from [209.85.128.41] (helo=mail-wm1-f41.google.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <xakep.amatop@gmail.com>)
 id 6a0f4568-56b3-0a2a450a0019-d1558029c9f6-3
 for <xen-devel@lists.xenproject.org>; Thu, 21 May 2026 19:48:24 +0200
Received: by mail-wm1-f41.google.com with SMTP id
 5b1f17b1804b1-4903974854dso9346175e9.3
 for <xen-devel@lists.xenproject.org>; Thu, 21 May 2026 10:48:24 -0700 (PDT)
Received: from EPUAKYIW02F7.. ([45.12.24.36]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49033d8e24bsm74565925e9.10.2026.05.21.10.48.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 May 2026 10:48:23 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1779385704; x=1779990504; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ytebWOt5OB4GGJdMVsvf3hk0k5wEJ8sVdBtQUHUMk1U=;
        b=Fo79PzYYgj5zBoTpN7VjyOeu3Jnn2deK1GwKoksbXdV0Vrf/502pDJBP3CcnUUSGnv
         MYAcfwr/PfPZ5UeqBpqUT+X+IoFNjrQ3Qyy6a3IBpiXoCAaQjNt+QuJwNt7U/sLMp4+2
         2yZ+NLGfenneGsmX0LlZ4TZ+vbil7ZqmtooOCsDsSkPEgx9Jlkwz8sv9ikBBDeJ7lkCy
         aE1QLRHAPsDMOt1go6/+1khzp8ft6AaowKa4dfuOlMcquFynxJCwmD0sBGdGIM84Y03S
         +J2caZ4JH5D2VEu1Bj5Nh9IgEDR9udyAzyt3UbEkQg6e2ng/1XFx53IPImi19JgMmIy0
         SupA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779385704; x=1779990504;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ytebWOt5OB4GGJdMVsvf3hk0k5wEJ8sVdBtQUHUMk1U=;
        b=oo01R4mXhKVQVulu111Y0rRRJbq38Bj0T7MIflhAsKxrPGPcfX6B2oV2l0y2r+Whkf
         iZsAiBbI2oigc2Gd550uBT6c75M0EENQtkAIdFZM0T6EOw6dq52Ns6BchbkGwVkW/NQg
         ie5Kse1HecrCRpWMBTrV4IAT36bOPgom6jqV8fDxxnX/c4xbVH28JmoBj4fywr30H5ZP
         qjPSsm0R9qFkDO49VVAM/B0UDp9gLrK+VPrXXciEsvDkVjDTjsWVYGUjBH6FgciQXpri
         9M0+PZCGlyzzUoEt6qbQKT7EewAjePcytYDLGCHiiVoM6sopGqRWGT+T6KNXQW5KX/Uk
         d47A==
X-Gm-Message-State: AOJu0Yzn/Af4WPffG9zMqBnTjYIjrFyUFxVLutQfPgZ2lGAMWOjZ6h07
	ouEzNaN0Qfz6z7FljgiZRnfK57YfE15RYVjGO53plOm3F1KxbK5U7tnGxPsroRiV
X-Gm-Gg: Acq92OEawk4eWI2ffum6lDva3MhCOgR3IRS02rJoxoQ3zbDHrq/UGnw6L6NMU6hdlmd
	xmYg2tI7lHvRB3oXv5izQUC8qfdYc1jgY8X9NezARTRDZXNVJ2PHCZjGfMI+0/BnFJT+9L0iDpr
	a7kCYZgS4O12VFdPYQ/FZuuv2Jds47Ro9ipJpgqt6FBHwQK/faG44HdjoIgUztfBVnNfXNw1NXz
	JihFS0teafajck6KzxoONZ/wDp8IROhRgzA8WKPkBFxr5xy+USxh/mX12r0eACY+bRuLUemU7Eh
	BE1vFIi5JS2kn+U1CmFT0lVq+tiWY2alzydHW8CP/4Y37/1lmXnQwJg5/HvvKDbmvQuZGVbKdSp
	/s7eDxEZ9ikax1Ubbrq5gBwZ/qzZlS12GKyGrip7bnUUV6XUlO5Nujc83tVUeMhGow/D8GaluK4
	1ndwNkqWPH6FxDqSnQrBC7pZMFFg==
X-Received: by 2002:a05:600d:849c:10b0:488:a797:f0ac with SMTP id 5b1f17b1804b1-490360baf6cmr44349475e9.28.1779385703780;
        Thu, 21 May 2026 10:48:23 -0700 (PDT)
From: Mykola Kvach <xakep.amatop@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Mykola Kvach <mykola_kvach@epam.com>,
	Luca Fancellu <luca.fancellu@arm.com>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Rahul Singh <rahul.singh@arm.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Pranjal Shrivastava <praan@google.com>
Subject: [PATCH v10 09/13] xen/arm: smmu-v3: add suspend/resume handlers
Date: Thu, 21 May 2026 20:45:27 +0300
Message-ID: <279cd20f49be956fc8493aace906a1adfaf473ee.1779385072.git.mykola_kvach@epam.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1779385072.git.mykola_kvach@epam.com>
References: <cover.1779385072.git.mykola_kvach@epam.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-4011c0/1779385704-7F1948B7-5F822F34/0/0
X-purgate-type: clean
X-purgate-size: 10603
X-Spamd-Result: default: False [-0.69 / 15.00];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:mykola_kvach@epam.com,m:luca.fancellu@arm.com,m:bertrand.marquis@arm.com,m:rahul.singh@arm.com,m:sstabellini@kernel.org,m:julien@xen.org,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,m:praan@google.com,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	ARC_NA(0.00)[];
	TAGGED_FROM(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER(0.00)[xakepamatop@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[xakepamatop@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 8B7FA5AA90B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Mykola Kvach <mykola_kvach@epam.com>

Add system suspend/resume callbacks for the Arm SMMUv3 driver.

During suspend, configure GBPA to abort incoming transactions, disable the
translation interface while keeping CMDQ enabled, issue CMD_SYNC to ensure
all previously issued commands have completed, then disable the SMMU IRQs
and SMMU.

Resume uses arm_smmu_device_reset() to reprogram the SMMU and re-enable
translation and interrupt generation.

The IRQ setup split follows the approach from Pranjal Shrivastava's Linux
arm-smmu-v3 runtime/system sleep series: IRQ handlers are requested once
during probe, while reset/resume only restores SMMU hardware state and
re-enables IRQ_CTRL.

Only the pieces relevant to Xen's currently supported SMMUv3 path are
ported here. Xen documents SMMUv3 MSI and PCI ATS as unsupported and not
compiled/tested, so this patch does not restore SMMU MSI IRQ_CFGn registers
nor reinitialize ATS/PRI endpoints. If those paths become usable,
suspend/resume will need corresponding MSI restore and ATS/PRI
quiesce/reinit steps.

Link: https://lore.kernel.org/r/20260414194702.1229094-1-praan@google.com/
Based-on-patch-by: Pranjal Shrivastava <praan@google.com>
Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
---
Changes in V10:
- Disable SMMU interrupt generation during suspend before disabling the
  SMMU interface, matching the resume/reset path which re-enables IRQ_CTRL.

Changes in V9:
- Use CMD_SYNC in suspend instead of polling CMDQ_CONS, so the suspend
  path waits for command completion rather than only command consumption.
- Document that arm_smmu_setup_irqs() is probe-only and that future Xen
  SMMUv3 MSI support will need to restore SMMU IRQ_CFGn registers on
  resume.
- Restore the reference to Pranjal's Linux runtime/system sleep series and
  clarify that MSI/ATS/PRI resume handling is outside the supported Xen
  path.
- Prefix the subject with xen/arm for consistency with the rest of the
  Arm suspend/resume series.

Changes in V8:
- Honor ARM_SMMU_FEAT_SEV when draining the CMDQ during suspend, matching
  the existing runtime CMD_SYNC path.
- Fold the suspend rollback reset path into a helper and rename the error
  reporting to describe suspend rollback rather than resume.
- Treat SMMU reset failure during resume as fatal instead of logging and
  continuing with a potentially unusable IOMMU.
- cosmetic changes
---
 xen/drivers/passthrough/arm/smmu-v3.c | 186 +++++++++++++++++++++-----
 1 file changed, 150 insertions(+), 36 deletions(-)

diff --git a/xen/drivers/passthrough/arm/smmu-v3.c b/xen/drivers/passthrough/arm/smmu-v3.c
index bf153227db..be8028c036 100644
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
@@ -1995,10 +1994,35 @@ err_free_evtq_irq:
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
+/*
+ * Probe-time only: request host IRQs and, when available, program the SMMU's
+ * MSI doorbells. Resume does not restore the SMMU *_IRQ_CFGn MSI registers,
+ * so any host suspend support must treat the active MSI IRQ path as
+ * unsupported until that restore path exists.
+ */
 static int __init arm_smmu_setup_irqs(struct arm_smmu_device *smmu)
 {
 	int ret, irq;
-	u32 irqen_flags = IRQ_CTRL_EVTQ_IRQEN | IRQ_CTRL_GERROR_IRQEN;
 
 	/* Disable IRQs first */
 	ret = arm_smmu_write_reg_sync(smmu, 0, ARM_SMMU_IRQ_CTRL,
@@ -2028,22 +2052,7 @@ static int __init arm_smmu_setup_irqs(struct arm_smmu_device *smmu)
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
@@ -2057,7 +2066,7 @@ static int arm_smmu_device_disable(struct arm_smmu_device *smmu)
 	return ret;
 }
 
-static int __init arm_smmu_device_reset(struct arm_smmu_device *smmu)
+static int arm_smmu_device_reset(struct arm_smmu_device *smmu)
 {
 	int ret;
 	u32 reg, enables;
@@ -2163,17 +2172,9 @@ static int __init arm_smmu_device_reset(struct arm_smmu_device *smmu)
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
@@ -2181,20 +2182,16 @@ static int __init arm_smmu_device_reset(struct arm_smmu_device *smmu)
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
@@ -2558,10 +2555,23 @@ static int __init arm_smmu_device_probe(struct platform_device *pdev)
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
@@ -2575,6 +2585,8 @@ static int __init arm_smmu_device_probe(struct platform_device *pdev)
 
 	return 0;
 
+out_free_irqs:
+	arm_smmu_free_irqs(smmu);
 
 out_free:
 	arm_smmu_free_structures(smmu);
@@ -2855,6 +2867,104 @@ static void arm_smmu_iommu_xen_domain_teardown(struct domain *d)
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
+		/* Abort all transactions before disable to avoid spurious bypass */
+		ret = arm_smmu_update_gbpa(smmu, GBPA_ABORT, 0);
+		if ( ret )
+			goto fail;
+
+		ret = arm_smmu_write_reg_sync(smmu, 0, ARM_SMMU_IRQ_CTRL,
+					ARM_SMMU_IRQ_CTRLACK);
+		if ( ret )
+		{
+			dev_err(smmu->dev, "Timed-out while disabling SMMU irqs\n");
+			goto fail;
+		}
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
+		 * At this point the translation interface is disabled and the
+		 * SMMU won't access translation/config structures, even
+		 * speculatively, as per the IHI0070 spec (section 6.3.9.6).
+		 * CMDQ is still enabled so that a CMD_SYNC can complete any
+		 * previously issued commands.
+		 */
+
+		/* Ensure all previously issued commands have completed. */
+		ret = arm_smmu_cmdq_issue_sync(smmu);
+		if ( ret )
+		{
+			dev_err(smmu->dev, "Timed-out waiting for pending commands\n");
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
@@ -2867,6 +2977,10 @@ static const struct iommu_ops arm_smmu_iommu_ops = {
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


