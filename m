Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B7105AB1BE
	for <lists+xen-devel@lfdr.de>; Fri,  2 Sep 2022 15:39:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.397749.638426 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oU6ss-0003zi-Ih; Fri, 02 Sep 2022 13:38:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 397749.638426; Fri, 02 Sep 2022 13:38:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oU6ss-0003xl-FK; Fri, 02 Sep 2022 13:38:58 +0000
Received: by outflank-mailman (input) for mailman id 397749;
 Fri, 02 Sep 2022 13:38:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5Z99=ZF=arm.com=rahul.singh@srs-se1.protection.inumbo.net>)
 id 1oU6sq-0003jF-Mu
 for xen-devel@lists.xenproject.org; Fri, 02 Sep 2022 13:38:56 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id 97253a69-2ac4-11ed-82f2-63bd783d45fa;
 Fri, 02 Sep 2022 15:38:55 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 803BA1515;
 Fri,  2 Sep 2022 06:39:01 -0700 (PDT)
Received: from e109506.cambridge.arm.com (e109506.cambridge.arm.com
 [10.1.199.62])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 373113F766;
 Fri,  2 Sep 2022 06:38:54 -0700 (PDT)
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
X-Inumbo-ID: 97253a69-2ac4-11ed-82f2-63bd783d45fa
From: Rahul Singh <rahul.singh@arm.com>
To: xen-devel@lists.xenproject.org
Cc: bertrand.marquis@arm.com,
	rahul.singh@arm.com,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	kernel test robot <lkp@intel.com>
Subject: [PATCH v2 09/10] xen/arm: smmuv3: Fix fall-through warning for Clang
Date: Fri,  2 Sep 2022 14:35:01 +0100
Message-Id: <1a17c80becb0b2466efadef378d000f45debdc14.1662123432.git.rahul.singh@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1662123432.git.rahul.singh@arm.com>
References: <cover.1662123432.git.rahul.singh@arm.com>
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
---
Changes in v2:
 - fix commit msg.
---
 xen/drivers/passthrough/arm/smmu-v3.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/xen/drivers/passthrough/arm/smmu-v3.c b/xen/drivers/passthrough/arm/smmu-v3.c
index f8f0eeb528..6fb74d864e 100644
--- a/xen/drivers/passthrough/arm/smmu-v3.c
+++ b/xen/drivers/passthrough/arm/smmu-v3.c
@@ -489,6 +489,7 @@ static void arm_smmu_cmdq_skip_err(struct arm_smmu_device *smmu)
 	switch (idx) {
 	case CMDQ_ERR_CERROR_ABT_IDX:
 		dev_err(smmu->dev, "retrying command fetch\n");
+		return;
 	case CMDQ_ERR_CERROR_NONE_IDX:
 		return;
 	case CMDQ_ERR_CERROR_ATC_INV_IDX:
-- 
2.25.1


