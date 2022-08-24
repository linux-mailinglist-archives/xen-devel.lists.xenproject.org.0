Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E992959FC5F
	for <lists+xen-devel@lfdr.de>; Wed, 24 Aug 2022 15:56:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.392671.631213 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oQqrr-0007GQ-Gp; Wed, 24 Aug 2022 13:56:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 392671.631213; Wed, 24 Aug 2022 13:56:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oQqrr-0007Df-BS; Wed, 24 Aug 2022 13:56:27 +0000
Received: by outflank-mailman (input) for mailman id 392671;
 Wed, 24 Aug 2022 13:56:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=EISj=Y4=arm.com=rahul.singh@srs-se1.protection.inumbo.net>)
 id 1oQqrp-0005xm-2T
 for xen-devel@lists.xenproject.org; Wed, 24 Aug 2022 13:56:25 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id 7ba3b258-23b4-11ed-9250-1f966e50362f;
 Wed, 24 Aug 2022 15:55:59 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C4BEB1F02;
 Wed, 24 Aug 2022 06:56:27 -0700 (PDT)
Received: from e109506.cambridge.arm.com (e109506.cambridge.arm.com
 [10.1.199.62])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DE7413FAF5;
 Wed, 24 Aug 2022 06:56:22 -0700 (PDT)
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
X-Inumbo-ID: 7ba3b258-23b4-11ed-9250-1f966e50362f
From: Rahul Singh <rahul.singh@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Bertrand Marquis <bertrand.marquis@arm.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH 09/10] xen/arm: smmuv3: Fix fall-through warning for Clang
Date: Wed, 24 Aug 2022 14:53:13 +0100
Message-Id: <40b97fa321d1b9689aaf92f12c50a8fe8330ef48.1661331102.git.rahul.singh@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1661331102.git.rahul.singh@arm.com>
References: <cover.1661331102.git.rahul.singh@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Backport Linux commit 5a1ab5c0299a7b3b9e7ec52c327f44d98b8e001d
"iommu/arm-smmu-v3: Fix fall-through warning for Clang"

Original commit message:
    iommu/arm-smmu-v3: Fix fall-through warning for Clang
    Fix the following fallthrough warning (arm64-randconfig with Clang):

    drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c:382:2: warning: unannotated fall-through between switch labels [-Wimplicit-fallthrough]

    Reported-by: kernel test robot <lkp@intel.com>
    Link: https://lore.kernel.org/lkml/60edca25.k00ut905IFBjPyt5%25lkp@intel.com/
    Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>

Signed-off-by: Rahul Singh <rahul.singh@arm.com>
---
 xen/drivers/passthrough/arm/smmu-v3.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/xen/drivers/passthrough/arm/smmu-v3.c b/xen/drivers/passthrough/arm/smmu-v3.c
index df39b8ae37..900149d0fa 100644
--- a/xen/drivers/passthrough/arm/smmu-v3.c
+++ b/xen/drivers/passthrough/arm/smmu-v3.c
@@ -777,6 +777,7 @@ static void arm_smmu_cmdq_skip_err(struct arm_smmu_device *smmu)
 	switch (idx) {
 	case CMDQ_ERR_CERROR_ABT_IDX:
 		dev_err(smmu->dev, "retrying command fetch\n");
+		return;
 	case CMDQ_ERR_CERROR_NONE_IDX:
 		return;
 	case CMDQ_ERR_CERROR_ATC_INV_IDX:
-- 
2.25.1


