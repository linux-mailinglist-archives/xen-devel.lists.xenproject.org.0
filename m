Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FA852E281B
	for <lists+xen-devel@lfdr.de>; Thu, 24 Dec 2020 17:50:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.58757.103526 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ksToM-0003uA-MH; Thu, 24 Dec 2020 16:49:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 58757.103526; Thu, 24 Dec 2020 16:49:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ksToM-0003tl-Ik; Thu, 24 Dec 2020 16:49:58 +0000
Received: by outflank-mailman (input) for mailman id 58757;
 Thu, 24 Dec 2020 16:49:57 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1ksToK-0003tg-VM
 for xen-devel@lists.xenproject.org; Thu, 24 Dec 2020 16:49:56 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1ksToK-0001WK-CA; Thu, 24 Dec 2020 16:49:56 +0000
Received: from 54-240-197-235.amazon.com ([54.240.197.235]
 helo=ufe34d9ed68d054.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1ksToJ-0000p5-W2; Thu, 24 Dec 2020 16:49:56 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Message-Id:Date:Subject:Cc:To:From;
	bh=0Gwe/uH290dVrTI4AHMKTVEIDPSN+P/JGMKSEXHISQI=; b=40zIj8FINXzlpLKDBLWkZfXXqj
	oOdjLtspiSLDlGW2FTUoaEQ0ZQHGzVMruRNnYA/K3T31wnpuVRBIxhvxLs6IsJgNc6hotiakHnQmZ
	RDPq149gfqbjQJg221dfk70y5XIjwrIzdWfOmfck4tIXp0/qnkeWAjawNXuSVl+R+tM4=;
From: Julien Grall <julien@xen.org>
To: xen-devel@lists.xenproject.org
Cc: bertrand.marquis@arm.com,
	Rahul.Singh@arm.com,
	Julien Grall <jgrall@amazon.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH] xen/iommu: smmu: Rework how the SMMU version is detected
Date: Thu, 24 Dec 2020 16:49:53 +0000
Message-Id: <20201224164953.32357-1-julien@xen.org>
X-Mailer: git-send-email 2.17.1

From: Julien Grall <jgrall@amazon.com>

Clang 11 will throw the following error:

smmu.c:2284:18: error: cast to smaller integer type 'enum arm_smmu_arch_version' from 'const void *' [-Werror,-Wvoid-pointer-to-enum-cast]
        smmu->version = (enum arm_smmu_arch_version)of_id->data;
                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

The error can be prevented by introduce static variable for each SMMU
version and store a pointer for each of them.

Signed-off-by: Julien Grall <jgrall@amazon.com>

---

Only build tested
---
 xen/drivers/passthrough/arm/smmu.c | 15 +++++++++------
 1 file changed, 9 insertions(+), 6 deletions(-)

diff --git a/xen/drivers/passthrough/arm/smmu.c b/xen/drivers/passthrough/arm/smmu.c
index ed04d85e05e9..4a507d7aff64 100644
--- a/xen/drivers/passthrough/arm/smmu.c
+++ b/xen/drivers/passthrough/arm/smmu.c
@@ -2249,12 +2249,15 @@ static int arm_smmu_device_cfg_probe(struct arm_smmu_device *smmu)
 	return 0;
 }
 
+static const enum arm_smmu_arch_version smmu_v1_version = ARM_SMMU_V1;
+static const enum arm_smmu_arch_version smmu_v2_version = ARM_SMMU_V2;
+
 static const struct of_device_id arm_smmu_of_match[] = {
-	{ .compatible = "arm,smmu-v1", .data = (void *)ARM_SMMU_V1 },
-	{ .compatible = "arm,smmu-v2", .data = (void *)ARM_SMMU_V2 },
-	{ .compatible = "arm,mmu-400", .data = (void *)ARM_SMMU_V1 },
-	{ .compatible = "arm,mmu-401", .data = (void *)ARM_SMMU_V1 },
-	{ .compatible = "arm,mmu-500", .data = (void *)ARM_SMMU_V2 },
+	{ .compatible = "arm,smmu-v1", .data = &smmu_v1_version },
+	{ .compatible = "arm,smmu-v2", .data = &smmu_v2_version },
+	{ .compatible = "arm,mmu-400", .data = &smmu_v1_version },
+	{ .compatible = "arm,mmu-401", .data = &smmu_v1_version },
+	{ .compatible = "arm,mmu-500", .data = &smmu_v2_version },
 	{ },
 };
 MODULE_DEVICE_TABLE(of, arm_smmu_of_match);
@@ -2281,7 +2284,7 @@ static int arm_smmu_device_dt_probe(struct platform_device *pdev)
 	smmu->dev = dev;
 
 	of_id = of_match_node(arm_smmu_of_match, dev->of_node);
-	smmu->version = (enum arm_smmu_arch_version)of_id->data;
+	smmu->version = *(enum arm_smmu_arch_version *)of_id->data;
 
 	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
 	smmu->base = devm_ioremap_resource(dev, res);
-- 
2.17.1


