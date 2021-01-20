Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 592E42FD34F
	for <lists+xen-devel@lfdr.de>; Wed, 20 Jan 2021 15:59:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.71521.128150 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l2Ewk-0001um-Sm; Wed, 20 Jan 2021 14:58:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 71521.128150; Wed, 20 Jan 2021 14:58:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l2Ewk-0001uJ-OA; Wed, 20 Jan 2021 14:58:58 +0000
Received: by outflank-mailman (input) for mailman id 71521;
 Wed, 20 Jan 2021 14:58:57 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kOez=GX=arm.com=rahul.singh@srs-us1.protection.inumbo.net>)
 id 1l2Ewj-0001tq-6R
 for xen-devel@lists.xenproject.org; Wed, 20 Jan 2021 14:58:57 +0000
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 3e2d16c2-84d8-49d0-96d7-1d1e5b1fe577;
 Wed, 20 Jan 2021 14:58:56 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1DCD431B;
 Wed, 20 Jan 2021 06:58:56 -0800 (PST)
Received: from scm-wfh-server-rahsin01.stack04.eu02.mi.arm.com (unknown
 [10.58.246.76])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3ACD13F68F;
 Wed, 20 Jan 2021 06:58:55 -0800 (PST)
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
X-Inumbo-ID: 3e2d16c2-84d8-49d0-96d7-1d1e5b1fe577
From: Rahul Singh <rahul.singh@arm.com>
To: xen-devel@lists.xenproject.org
Cc: bertrand.marquis@arm.com,
	rahul.singh@arm.com,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v5 09/10] xen/arm: smmuv3: Replace linux functions with xen functions.
Date: Wed, 20 Jan 2021 14:52:43 +0000
Message-Id: <34cfa2ef5237d4db62ada65983f4596843eb2d30.1611153615.git.rahul.singh@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1611153615.git.rahul.singh@arm.com>
References: <cover.1611153615.git.rahul.singh@arm.com>
In-Reply-To: <cover.1611153615.git.rahul.singh@arm.com>
References: <cover.1611153615.git.rahul.singh@arm.com>

Replace all Linux device tree handling function with the XEN
functions.

Replace all Linux ktime function with the XEN time functions.

Signed-off-by: Rahul Singh <rahul.singh@arm.com>
Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>
---
Changes since v2:
 - This patch is introduce in this version.
Changes since v3:
 - Move this patch one patch earlier so that there is no need to remove
   the code.
Changes since v4: No changes
---
---
 xen/drivers/passthrough/arm/smmu-v3.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/xen/drivers/passthrough/arm/smmu-v3.c b/xen/drivers/passthrough/arm/smmu-v3.c
index f5f8b4c981..2dfadc6a65 100644
--- a/xen/drivers/passthrough/arm/smmu-v3.c
+++ b/xen/drivers/passthrough/arm/smmu-v3.c
@@ -682,7 +682,7 @@ static void parse_driver_options(struct arm_smmu_device *smmu)
 	int i = 0;
 
 	do {
-		if (of_property_read_bool(smmu->dev->of_node,
+		if (dt_property_read_bool(smmu->dev->of_node,
 						arm_smmu_options[i].prop)) {
 			smmu->options |= arm_smmu_options[i].opt;
 			dev_notice(smmu->dev, "option %s\n",
@@ -754,17 +754,17 @@ static void queue_inc_prod(struct arm_smmu_ll_queue *q)
  */
 static int queue_poll_cons(struct arm_smmu_queue *q, bool sync, bool wfe)
 {
-	ktime_t timeout;
+	s_time_t timeout;
 	unsigned int delay = 1, spin_cnt = 0;
 
 	/* Wait longer if it's a CMD_SYNC */
-	timeout = ktime_add_us(ktime_get(), sync ?
+	timeout = NOW() + MICROSECS(sync ?
 					    ARM_SMMU_CMDQ_SYNC_TIMEOUT_US :
 					    ARM_SMMU_POLL_TIMEOUT_US);
 
 	while (queue_sync_cons_in(q),
 	      (sync ? !queue_empty(&q->llq) : queue_full(&q->llq))) {
-		if (ktime_compare(ktime_get(), timeout) > 0)
+		if ((NOW() > timeout) > 0)
 			return -ETIMEDOUT;
 
 		if (wfe) {
@@ -990,13 +990,13 @@ static void arm_smmu_cmdq_issue_cmd(struct arm_smmu_device *smmu,
  */
 static int __arm_smmu_sync_poll_msi(struct arm_smmu_device *smmu, u32 sync_idx)
 {
-	ktime_t timeout;
+	s_time_t timeout;
 	u32 val;
 
-	timeout = ktime_add_us(ktime_get(), ARM_SMMU_CMDQ_SYNC_TIMEOUT_US);
+	timeout = NOW() + MICROSECS(ARM_SMMU_CMDQ_SYNC_TIMEOUT_US);
 	val = smp_cond_load_acquire(&smmu->sync_count,
 				    (int)(VAL - sync_idx) >= 0 ||
-				    !ktime_before(ktime_get(), timeout));
+				    !(NOW() < timeout));
 
 	return (int)(val - sync_idx) < 0 ? -ETIMEDOUT : 0;
 }
@@ -2649,7 +2649,7 @@ static int arm_smmu_device_dt_probe(struct platform_device *pdev,
 	u32 cells;
 	int ret = -EINVAL;
 
-	if (of_property_read_u32(dev->of_node, "#iommu-cells", &cells))
+	if (!dt_property_read_u32(dev->of_node, "#iommu-cells", &cells))
 		dev_err(dev, "missing #iommu-cells property\n");
 	else if (cells != 1)
 		dev_err(dev, "invalid #iommu-cells value (%d)\n", cells);
-- 
2.17.1


