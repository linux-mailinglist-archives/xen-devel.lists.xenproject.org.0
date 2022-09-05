Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C5EBD5AD776
	for <lists+xen-devel@lfdr.de>; Mon,  5 Sep 2022 18:31:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.398954.639960 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oVF0K-0007le-Gl; Mon, 05 Sep 2022 16:31:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 398954.639960; Mon, 05 Sep 2022 16:31:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oVF0K-0007je-BC; Mon, 05 Sep 2022 16:31:20 +0000
Received: by outflank-mailman (input) for mailman id 398954;
 Mon, 05 Sep 2022 16:31:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fkdn=ZI=arm.com=rahul.singh@srs-se1.protection.inumbo.net>)
 id 1oVF0I-0007PM-HE
 for xen-devel@lists.xenproject.org; Mon, 05 Sep 2022 16:31:18 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id 2a56833c-2d38-11ed-a016-b9edf5238543;
 Mon, 05 Sep 2022 18:31:17 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D8A1F1756;
 Mon,  5 Sep 2022 09:31:22 -0700 (PDT)
Received: from e109506.cambridge.arm.com (e109506.cambridge.arm.com
 [10.1.199.62])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9BB933F534;
 Mon,  5 Sep 2022 09:31:15 -0700 (PDT)
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
X-Inumbo-ID: 2a56833c-2d38-11ed-a016-b9edf5238543
From: Rahul Singh <rahul.singh@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Zenghui Yu <yuzenghui@huawei.com>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Will Deacon <will@kernel.org>
Subject: [PATCH v3 01/10] xen/arm: smmuv3: Fix l1 stream table size in the error message
Date: Mon,  5 Sep 2022 17:30:36 +0100
Message-Id: <0356dc541c86e7b7003df6ac941a673cec6f129d.1662394710.git.rahul.singh@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1662394710.git.rahul.singh@arm.com>
References: <cover.1662394710.git.rahul.singh@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Zenghui Yu <yuzenghui@huawei.com>

Backport Linux commit dc898eb84b25. This is the clean backport without
any changes.

The actual size of level-1 stream table is l1size. This looks like an
oversight on commit d2e88e7c081ef ("iommu/arm-smmu: Fix LOG2SIZE setting
for 2-level stream tables") which forgot to update the @size in error
message as well.

As memory allocation failure is already bad enough, nothing worse would
happen. But let's be careful.

Signed-off-by: Zenghui Yu <yuzenghui@huawei.com>
Link: https://lore.kernel.org/r/20200826141758.341-1-yuzenghui@huawei.com
Signed-off-by: Will Deacon <will@kernel.org>
Origin: git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git dc898eb84b25
Acked-by: Stefano Stabellini <sstabellini@kernel.org>
Signed-off-by: Rahul Singh <rahul.singh@arm.com>
---
Changes in v3:
 - Added Stefano Acked-by
Changes in v2:
 - fix commit msg
---
---
 xen/drivers/passthrough/arm/smmu-v3.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/drivers/passthrough/arm/smmu-v3.c b/xen/drivers/passthrough/arm/smmu-v3.c
index f2562acc38..340609264d 100644
--- a/xen/drivers/passthrough/arm/smmu-v3.c
+++ b/xen/drivers/passthrough/arm/smmu-v3.c
@@ -2348,7 +2348,7 @@ static int arm_smmu_init_strtab_2lvl(struct arm_smmu_device *smmu)
 	if (!strtab) {
 		dev_err(smmu->dev,
 			"failed to allocate l1 stream table (%u bytes)\n",
-			size);
+			l1size);
 		return -ENOMEM;
 	}
 	cfg->strtab = strtab;
-- 
2.25.1


