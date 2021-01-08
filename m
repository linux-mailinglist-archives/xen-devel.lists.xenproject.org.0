Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BEF4C2EF433
	for <lists+xen-devel@lfdr.de>; Fri,  8 Jan 2021 15:52:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.63567.112848 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kxt7K-0000OF-57; Fri, 08 Jan 2021 14:51:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 63567.112848; Fri, 08 Jan 2021 14:51:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kxt7K-0000Nq-23; Fri, 08 Jan 2021 14:51:54 +0000
Received: by outflank-mailman (input) for mailman id 63567;
 Fri, 08 Jan 2021 14:51:52 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=h0bx=GL=arm.com=rahul.singh@srs-us1.protection.inumbo.net>)
 id 1kxt7I-0000Ng-Sm
 for xen-devel@lists.xenproject.org; Fri, 08 Jan 2021 14:51:52 +0000
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 34d2859a-31ef-4faf-b06c-b8fbc7a1fc78;
 Fri, 08 Jan 2021 14:51:51 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 825C1ED1;
 Fri,  8 Jan 2021 06:51:51 -0800 (PST)
Received: from scm-wfh-server-rahsin01.stack04.eu02.mi.arm.com (unknown
 [10.58.246.76])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9F80D3F70D;
 Fri,  8 Jan 2021 06:51:50 -0800 (PST)
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
X-Inumbo-ID: 34d2859a-31ef-4faf-b06c-b8fbc7a1fc78
From: Rahul Singh <rahul.singh@arm.com>
To: xen-devel@lists.xenproject.org
Cc: bertrand.marquis@arm.com,
	rahul.singh@arm.com,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v4 09/11] xen/arm: smmuv3: Use fallthrough pseudo-keyword
Date: Fri,  8 Jan 2021 14:46:29 +0000
Message-Id: <36f9a1e88eea2f2c4cc413688c7210583a3433fe.1610115608.git.rahul.singh@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1610115608.git.rahul.singh@arm.com>
References: <cover.1610115608.git.rahul.singh@arm.com>
In-Reply-To: <cover.1610115608.git.rahul.singh@arm.com>
References: <cover.1610115608.git.rahul.singh@arm.com>

Merge the patch from linux to use fallthrough pseudo-keyword.

Replace the existing /* fall through */ comments and its variants with
the new pseudo-keyword macro fallthrough[1]. Also, remove unnecessary
fall-through markings when it is the case.

Signed-off-by: Rahul Singh <rahul.singh@arm.com>
---
Changes in V4:
 - This patch is introduce in this verison.
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


