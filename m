Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E0F05AF753
	for <lists+xen-devel@lfdr.de>; Tue,  6 Sep 2022 23:50:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.400411.642157 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oVgSq-0004X5-A8; Tue, 06 Sep 2022 21:50:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 400411.642157; Tue, 06 Sep 2022 21:50:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oVgSq-0004Qe-2i; Tue, 06 Sep 2022 21:50:36 +0000
Received: by outflank-mailman (input) for mailman id 400411;
 Tue, 06 Sep 2022 21:50:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lcW6=ZJ=arm.com=rahul.singh@srs-se1.protection.inumbo.net>)
 id 1oVgIP-0000Cs-HA
 for xen-devel@lists.xenproject.org; Tue, 06 Sep 2022 21:39:49 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id dc1713fa-2dca-11ed-af93-0125da4c0113;
 Tue, 06 Sep 2022 12:01:22 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5F8D8176C;
 Tue,  6 Sep 2022 03:01:29 -0700 (PDT)
Received: from e109506.cambridge.arm.com (e109506.cambridge.arm.com
 [10.1.199.62])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1F1DA3F534;
 Tue,  6 Sep 2022 03:01:22 -0700 (PDT)
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
X-Inumbo-ID: dc1713fa-2dca-11ed-af93-0125da4c0113
From: Rahul Singh <rahul.singh@arm.com>
To: xen-devel@lists.xenproject.org
Cc: "Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	kernel test robot <lkp@intel.com>
Subject: [PATCH v4 09/10] xen/arm: smmuv3: Fix fall-through warning for Clang
Date: Tue,  6 Sep 2022 10:55:56 +0100
Message-Id: <8ac83afdb6be598dc9965f86041f5a515486a7c4.1662455798.git.rahul.singh@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1662455798.git.rahul.singh@arm.com>
References: <cover.1662455798.git.rahul.singh@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Gustavo A. R. Silva" <gustavoars@kernel.org>

Backport Linux commit 5a1ab5c0299a. This is the clean backport without
any changes.

Fix the following fallthrough warning (arm64-randconfig with Clang):

drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c:382:2: warning: unannotated fall-through between switch labels [-Wimplicit-fallthrough]

Reported-by: kernel test robot <lkp@intel.com>
Link: https://lore.kernel.org/lkml/60edca25.k00ut905IFBjPyt5%25lkp@intel.com/
Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>
Origin: git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git 5a1ab5c0299a
Signed-off-by: Rahul Singh <rahul.singh@arm.com>
Acked-by: Stefano Stabellini <sstabellini@kernel.org>
---
Changes in v4:
- Move Stefano Acked-by after Signed-off
Changes in v3:
 - Added Stefano Acked-by.
Changes in v2:
 - fix commit msg.
---
 xen/drivers/passthrough/arm/smmu-v3.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/xen/drivers/passthrough/arm/smmu-v3.c b/xen/drivers/passthrough/arm/smmu-v3.c
index c47e7dea04..b8ca4b0a24 100644
--- a/xen/drivers/passthrough/arm/smmu-v3.c
+++ b/xen/drivers/passthrough/arm/smmu-v3.c
@@ -492,6 +492,7 @@ static void arm_smmu_cmdq_skip_err(struct arm_smmu_device *smmu)
 	switch (idx) {
 	case CMDQ_ERR_CERROR_ABT_IDX:
 		dev_err(smmu->dev, "retrying command fetch\n");
+		return;
 	case CMDQ_ERR_CERROR_NONE_IDX:
 		return;
 	case CMDQ_ERR_CERROR_ATC_INV_IDX:
-- 
2.25.1


