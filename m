Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A2395AF740
	for <lists+xen-devel@lfdr.de>; Tue,  6 Sep 2022 23:49:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.400295.641992 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oVgRT-0004t4-8Z; Tue, 06 Sep 2022 21:49:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 400295.641992; Tue, 06 Sep 2022 21:49:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oVgRT-0004qc-4x; Tue, 06 Sep 2022 21:49:11 +0000
Received: by outflank-mailman (input) for mailman id 400295;
 Tue, 06 Sep 2022 21:49:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lcW6=ZJ=arm.com=rahul.singh@srs-se1.protection.inumbo.net>)
 id 1oVgI5-0000Cs-ER
 for xen-devel@lists.xenproject.org; Tue, 06 Sep 2022 21:39:29 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id da70436f-2dca-11ed-af93-0125da4c0113;
 Tue, 06 Sep 2022 12:01:19 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A07BD1756;
 Tue,  6 Sep 2022 03:01:26 -0700 (PDT)
Received: from e109506.cambridge.arm.com (e109506.cambridge.arm.com
 [10.1.199.62])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 617C93F534;
 Tue,  6 Sep 2022 03:01:19 -0700 (PDT)
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
X-Inumbo-ID: da70436f-2dca-11ed-af93-0125da4c0113
From: Rahul Singh <rahul.singh@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Zhen Lei <thunder.leizhen@huawei.com>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Will Deacon <will@kernel.org>
Subject: [PATCH v4 08/10] xen/arm: smmuv3: Remove unnecessary oom message
Date: Tue,  6 Sep 2022 10:55:55 +0100
Message-Id: <fde9e72ef371a011d03d82ce09da7a1d310da5d8.1662455798.git.rahul.singh@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1662455798.git.rahul.singh@arm.com>
References: <cover.1662455798.git.rahul.singh@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Zhen Lei <thunder.leizhen@huawei.com>

Backport Linux commit affa909571b0. This is the clean backport without
any changes.

Fixes scripts/checkpatch.pl warning:
WARNING: Possible unnecessary 'out of memory' message

Remove it can help us save a bit of memory.

Signed-off-by: Zhen Lei <thunder.leizhen@huawei.com>
Link: https://lore.kernel.org/r/20210609125438.14369-1-thunder.leizhen@huawei.com
Signed-off-by: Will Deacon <will@kernel.org>
Origin: git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git affa909571b0
Signed-off-by: Rahul Singh <rahul.singh@arm.com>
Acked-by: Stefano Stabellini <sstabellini@kernel.org>
---
Changes in v4:
- Move Stefano Acked-by after Signed-off
Changes in v3:
 - Added Stefano Acked-by
Changes in v2:
 - fix commit msg
---
 xen/drivers/passthrough/arm/smmu-v3.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/xen/drivers/passthrough/arm/smmu-v3.c b/xen/drivers/passthrough/arm/smmu-v3.c
index c53d4c96a4..c47e7dea04 100644
--- a/xen/drivers/passthrough/arm/smmu-v3.c
+++ b/xen/drivers/passthrough/arm/smmu-v3.c
@@ -1647,10 +1647,8 @@ static int arm_smmu_init_l1_strtab(struct arm_smmu_device *smmu)
 	void *strtab = smmu->strtab_cfg.strtab;
 
 	cfg->l1_desc = _xzalloc(size, sizeof(void *));
-	if (!cfg->l1_desc) {
-		dev_err(smmu->dev, "failed to allocate l1 stream table desc\n");
+	if (!cfg->l1_desc)
 		return -ENOMEM;
-	}
 
 	for (i = 0; i < cfg->num_l1_ents; ++i) {
 		arm_smmu_write_strtab_l1_desc(strtab, &cfg->l1_desc[i]);
@@ -2435,10 +2433,8 @@ static int arm_smmu_device_probe(struct platform_device *pdev)
 	struct arm_smmu_device *smmu;
 
 	smmu = xzalloc(struct arm_smmu_device);
-	if (!smmu) {
-		dev_err(pdev, "failed to allocate arm_smmu_device\n");
+	if (!smmu)
 		return -ENOMEM;
-	}
 	smmu->dev = pdev;
 
 	if (pdev->of_node) {
-- 
2.25.1


