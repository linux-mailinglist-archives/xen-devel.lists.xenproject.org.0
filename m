Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 22AC98CD932
	for <lists+xen-devel@lfdr.de>; Thu, 23 May 2024 19:37:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.728781.1133829 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sACMi-0006fp-Fk; Thu, 23 May 2024 17:36:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 728781.1133829; Thu, 23 May 2024 17:36:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sACMi-0006dV-Cg; Thu, 23 May 2024 17:36:32 +0000
Received: by outflank-mailman (input) for mailman id 728781;
 Thu, 23 May 2024 17:36:31 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VxBl=M2=gmail.com=edgar.iglesias@srs-se1.protection.inumbo.net>)
 id 1sACMh-0006ST-Ib
 for xen-devel@lists.xenproject.org; Thu, 23 May 2024 17:36:31 +0000
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [2a00:1450:4864:20::12e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fcf53a47-192a-11ef-b4bb-af5377834399;
 Thu, 23 May 2024 19:36:29 +0200 (CEST)
Received: by mail-lf1-x12e.google.com with SMTP id
 2adb3069b0e04-51ffff16400so12882838e87.2
 for <xen-devel@lists.xenproject.org>; Thu, 23 May 2024 10:36:29 -0700 (PDT)
Received: from gmail.com (213-67-3-247-no600.tbcn.telia.com. [213.67.3.247])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-521f38d8c38sm5409244e87.211.2024.05.23.10.36.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 May 2024 10:36:27 -0700 (PDT)
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
X-Inumbo-ID: fcf53a47-192a-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716485788; x=1717090588; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d5HekHGljObQIi5oqspdisbrUbBneLRK1/u/IomN9bI=;
        b=Gh2Bdur/vMgZR0CySPWdhpj350U6Q1ghAIRsSNnip+whDFGxwqe+mxd1KDzjNs9WQ1
         Vrlnz/Nza03uRXTZRq9pfypsbSg6eyNsrdcfq4px9Zx28jZeoFmg3z0P/3MasF5V4R5O
         pVcE9oWa70V8IOuit5xr/ZAVX4uVoSdW/JxKej74w9DbXUE5Mk2hFrIFC+dgOW9le4cY
         J9x6beFvc6RXmRLRyBfskJpIjDynegKONujdWwghL+n8bSOtiD8oEgzP1UUR4ngnu1zy
         4yl01/c0TXxIn28RB/T+bp0A+jnAMC569V1EGgDlJ7gwJF5nj91OhEfxx+a90+x2AuUt
         x3fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716485788; x=1717090588;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=d5HekHGljObQIi5oqspdisbrUbBneLRK1/u/IomN9bI=;
        b=rhKCYwjqWYFUQIdzCs+oNJPbsA+yEwydSh957Y1X3Bw+xG6V3KtRzByNiKL8FPoaTr
         YEXIeZsZrTl8bBRyFaEhJFzJRfETwm0i8qJKpBpkTAjzBNUxPsHTAmimQ4+0Nks2rpal
         4IBgd/i9481w+MeRT1H/24tohCW1bFpasTrr8xpuNZ8BYHPOboyfLJU2wVlRn4kduwIR
         0rC5gdLKHjyVQQMut0qfuf0rRnV7WBdwVGq/YItB9K3Gk/4o7QRxuZyPWfwmAErAGNId
         gddRIbbWOQ2u/O89vM1sKwIxoIX53kfEFBo/tcW0F+Ygg3fjT9dFeQSdf1MijeQgRI2f
         wyJw==
X-Gm-Message-State: AOJu0YyMDq6AZsxUY6T8GmbVa9Hiv55APFCGIIie/2Mg909TJRDm5DUT
	WcXM1D/y8y4JwBjPgO7l+U0L+a98THA3mT1srnWrV+HYc+eVWB4xv3g1PyPA
X-Google-Smtp-Source: AGHT+IEUq0+9wFqxKhc/lmLmCmUAHY/bXm30RVFWAx+aYve5caIrf4gFhTCtMm+zHduPKC9v5clgvQ==
X-Received: by 2002:ac2:554b:0:b0:51d:9e17:29f0 with SMTP id 2adb3069b0e04-526bf07e6b3mr4368830e87.24.1716485788095;
        Thu, 23 May 2024 10:36:28 -0700 (PDT)
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org,
	julien@xen.org,
	bertrand.marquis@arm.com,
	rahul.singh@arm.com,
	michal.orzel@amd.com,
	Volodymyr_Babchuk@epam.com,
	edgar.iglesias@amd.com
Subject: [PATCH v1 1/1] xen/arm: smmuv3: Mark more init-only functions with __init
Date: Wed, 22 May 2024 15:28:29 +0200
Message-Id: <20240522132829.1278625-2-edgar.iglesias@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240522132829.1278625-1-edgar.iglesias@gmail.com>
References: <20240522132829.1278625-1-edgar.iglesias@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Edgar E. Iglesias" <edgar.iglesias@amd.com>

Move more functions that are only called at init to
the .init.text section.

Signed-off-by: Edgar E. Iglesias <edgar.iglesias@amd.com>
---
 xen/drivers/passthrough/arm/smmu-v3.c | 17 +++++++++--------
 1 file changed, 9 insertions(+), 8 deletions(-)

diff --git a/xen/drivers/passthrough/arm/smmu-v3.c b/xen/drivers/passthrough/arm/smmu-v3.c
index 6904962467..cee5724022 100644
--- a/xen/drivers/passthrough/arm/smmu-v3.c
+++ b/xen/drivers/passthrough/arm/smmu-v3.c
@@ -1545,7 +1545,7 @@ static int arm_smmu_dt_xlate(struct device *dev,
 }
 
 /* Probing and initialisation functions */
-static int arm_smmu_init_one_queue(struct arm_smmu_device *smmu,
+static int __init arm_smmu_init_one_queue(struct arm_smmu_device *smmu,
 				   struct arm_smmu_queue *q,
 				   void __iomem *page,
 				   unsigned long prod_off,
@@ -1588,7 +1588,7 @@ static int arm_smmu_init_one_queue(struct arm_smmu_device *smmu,
 	return 0;
 }
 
-static int arm_smmu_init_queues(struct arm_smmu_device *smmu)
+static int __init arm_smmu_init_queues(struct arm_smmu_device *smmu)
 {
 	int ret;
 
@@ -1724,7 +1724,7 @@ static int arm_smmu_init_strtab(struct arm_smmu_device *smmu)
 	return 0;
 }
 
-static int arm_smmu_init_structures(struct arm_smmu_device *smmu)
+static int __init arm_smmu_init_structures(struct arm_smmu_device *smmu)
 {
 	int ret;
 
@@ -1746,7 +1746,8 @@ static int arm_smmu_write_reg_sync(struct arm_smmu_device *smmu, u32 val,
 }
 
 /* GBPA is "special" */
-static int arm_smmu_update_gbpa(struct arm_smmu_device *smmu, u32 set, u32 clr)
+static int __init arm_smmu_update_gbpa(struct arm_smmu_device *smmu,
+                                       u32 set, u32 clr)
 {
 	int ret;
 	u32 reg, __iomem *gbpa = smmu->base + ARM_SMMU_GBPA;
@@ -1842,7 +1843,7 @@ static void arm_smmu_setup_msis(struct arm_smmu_device *smmu)
 static inline void arm_smmu_setup_msis(struct arm_smmu_device *smmu) { }
 #endif /* CONFIG_MSI */
 
-static void arm_smmu_free_irqs(struct arm_smmu_device *smmu)
+static void __init arm_smmu_free_irqs(struct arm_smmu_device *smmu)
 {
 	int irq;
 
@@ -1926,7 +1927,7 @@ err_free_evtq_irq:
 	return ret;
 }
 
-static int arm_smmu_setup_irqs(struct arm_smmu_device *smmu)
+static int __init arm_smmu_setup_irqs(struct arm_smmu_device *smmu)
 {
 	int ret, irq;
 	u32 irqen_flags = IRQ_CTRL_EVTQ_IRQEN | IRQ_CTRL_GERROR_IRQEN;
@@ -1988,7 +1989,7 @@ static int arm_smmu_device_disable(struct arm_smmu_device *smmu)
 	return ret;
 }
 
-static int arm_smmu_device_reset(struct arm_smmu_device *smmu)
+static int __init arm_smmu_device_reset(struct arm_smmu_device *smmu)
 {
 	int ret;
 	u32 reg, enables;
@@ -2405,7 +2406,7 @@ static void arm_smmu_free_structures(struct arm_smmu_device *smmu)
 		xfree(smmu->strtab_cfg.l1_desc);
 }
 
-static int arm_smmu_device_probe(struct platform_device *pdev)
+static int __init arm_smmu_device_probe(struct platform_device *pdev)
 {
 	int irq, ret;
 	paddr_t ioaddr, iosize;
-- 
2.40.1


