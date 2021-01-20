Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 788F92FD34D
	for <lists+xen-devel@lfdr.de>; Wed, 20 Jan 2021 15:59:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.71518.128138 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l2EwZ-0001pe-Ew; Wed, 20 Jan 2021 14:58:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 71518.128138; Wed, 20 Jan 2021 14:58:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l2EwZ-0001pC-AU; Wed, 20 Jan 2021 14:58:47 +0000
Received: by outflank-mailman (input) for mailman id 71518;
 Wed, 20 Jan 2021 14:58:45 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kOez=GX=arm.com=rahul.singh@srs-us1.protection.inumbo.net>)
 id 1l2EwX-0001p3-Rc
 for xen-devel@lists.xenproject.org; Wed, 20 Jan 2021 14:58:45 +0000
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id 85a92550-7e85-4de2-b28a-2594e296e986;
 Wed, 20 Jan 2021 14:58:44 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A4D4C31B;
 Wed, 20 Jan 2021 06:58:44 -0800 (PST)
Received: from scm-wfh-server-rahsin01.stack04.eu02.mi.arm.com (unknown
 [10.58.246.76])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C194D3F68F;
 Wed, 20 Jan 2021 06:58:43 -0800 (PST)
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
X-Inumbo-ID: 85a92550-7e85-4de2-b28a-2594e296e986
From: Rahul Singh <rahul.singh@arm.com>
To: xen-devel@lists.xenproject.org
Cc: bertrand.marquis@arm.com,
	rahul.singh@arm.com,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v5 08/10] xen/arm: smmuv3: Use fallthrough pseudo-keyword
Date: Wed, 20 Jan 2021 14:52:42 +0000
Message-Id: <c392bcf9f3a4d22b0e67240d52498c719ff3a3a6.1611153615.git.rahul.singh@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1611153615.git.rahul.singh@arm.com>
References: <cover.1611153615.git.rahul.singh@arm.com>
In-Reply-To: <cover.1611153615.git.rahul.singh@arm.com>
References: <cover.1611153615.git.rahul.singh@arm.com>

Backport commit df561f6688fef775baa341a0f5d960becd248b11
"treewide: Use fallthrough pseudo-keyword" from Linux kernel.

Replace the existing /* fall through */ comments and its variants with
the new pseudo-keyword macro fallthrough[1]. Also, remove unnecessary
fall-through markings when it is the case.

Signed-off-by: Rahul Singh <rahul.singh@arm.com>
---
Changes since v3:
 - This patch is introduce in this version.
Changes since v4:
 - Add more information about the merged patch in commit message.
---
---
 xen/drivers/passthrough/arm/smmu-v3.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/xen/drivers/passthrough/arm/smmu-v3.c b/xen/drivers/passthrough/arm/smmu-v3.c
index 5ce14850b4..f5f8b4c981 100644
--- a/xen/drivers/passthrough/arm/smmu-v3.c
+++ b/xen/drivers/passthrough/arm/smmu-v3.c
@@ -932,7 +932,6 @@ static void arm_smmu_cmdq_skip_err(struct arm_smmu_device *smmu)
 		 */
 		return;
 	case CMDQ_ERR_CERROR_ILL_IDX:
-		/* Fallthrough */
 	default:
 		break;
 	}
@@ -2488,7 +2487,7 @@ static int arm_smmu_device_hw_probe(struct arm_smmu_device *smmu)
 	switch (FIELD_GET(IDR0_STALL_MODEL, reg)) {
 	case IDR0_STALL_MODEL_FORCE:
 		smmu->features |= ARM_SMMU_FEAT_STALL_FORCE;
-		/* Fallthrough */
+		fallthrough;
 	case IDR0_STALL_MODEL_STALL:
 		smmu->features |= ARM_SMMU_FEAT_STALLS;
 	}
@@ -2505,7 +2504,7 @@ static int arm_smmu_device_hw_probe(struct arm_smmu_device *smmu)
 	switch (FIELD_GET(IDR0_TTF, reg)) {
 	case IDR0_TTF_AARCH32_64:
 		smmu->ias = 40;
-		/* Fallthrough */
+		fallthrough;
 	case IDR0_TTF_AARCH64:
 		break;
 	default:
@@ -2589,7 +2588,7 @@ static int arm_smmu_device_hw_probe(struct arm_smmu_device *smmu)
 	default:
 		dev_info(smmu->dev,
 			"unknown output address size. Truncating to 48-bit\n");
-		/* Fallthrough */
+		fallthrough;
 	case IDR5_OAS_48_BIT:
 		smmu->oas = 48;
 	}
-- 
2.17.1


