Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C881D5AD795
	for <lists+xen-devel@lfdr.de>; Mon,  5 Sep 2022 18:33:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.398978.639992 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oVF2d-0001Mm-EH; Mon, 05 Sep 2022 16:33:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 398978.639992; Mon, 05 Sep 2022 16:33:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oVF2d-0001Jw-BR; Mon, 05 Sep 2022 16:33:43 +0000
Received: by outflank-mailman (input) for mailman id 398978;
 Mon, 05 Sep 2022 16:33:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fkdn=ZI=arm.com=rahul.singh@srs-se1.protection.inumbo.net>)
 id 1oVF2c-0001Jo-9y
 for xen-devel@lists.xenproject.org; Mon, 05 Sep 2022 16:33:42 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id 8038e1f3-2d38-11ed-af93-0125da4c0113;
 Mon, 05 Sep 2022 18:33:41 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id F1AEB139F;
 Mon,  5 Sep 2022 09:33:46 -0700 (PDT)
Received: from e109506.cambridge.arm.com (e109506.cambridge.arm.com
 [10.1.199.62])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B68D03F534;
 Mon,  5 Sep 2022 09:33:39 -0700 (PDT)
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
X-Inumbo-ID: 8038e1f3-2d38-11ed-af93-0125da4c0113
From: Rahul Singh <rahul.singh@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Bixuan Cui <cuibixuan@huawei.com>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Will Deacon <will@kernel.org>
Subject: [PATCH v3 07/10] xen/arm: smmuv3: Change *array into *const array
Date: Mon,  5 Sep 2022 17:30:42 +0100
Message-Id: <e153041ea15d7c6c5f5c1c5fdd8eddb6f3d8d68c.1662394710.git.rahul.singh@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1662394710.git.rahul.singh@arm.com>
References: <cover.1662394710.git.rahul.singh@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bixuan Cui <cuibixuan@huawei.com>

Backport Linux commit d56d5162e317. This is the clean backport without
any changes.

Fix checkpatch warning in arm-smmu-v3.c:
static const char * array should probably be static const char
* const

Signed-off-by: Bixuan Cui <cuibixuan@huawei.com>
Signed-off-by: Will Deacon <will@kernel.org>
Origin: git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git d56d5162e317
Acked-by: Stefano Stabellini <sstabellini@kernel.org>
Signed-off-by: Rahul Singh <rahul.singh@arm.com>
---
Changes in v3:
 - Added Stefano Acked-by
Changes in v2:
 - fix commit msg
---
 xen/drivers/passthrough/arm/smmu-v3.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/drivers/passthrough/arm/smmu-v3.c b/xen/drivers/passthrough/arm/smmu-v3.c
index 512a3617a2..ef1604d863 100644
--- a/xen/drivers/passthrough/arm/smmu-v3.c
+++ b/xen/drivers/passthrough/arm/smmu-v3.c
@@ -470,7 +470,7 @@ static int arm_smmu_cmdq_build_cmd(u64 *cmd, struct arm_smmu_cmdq_ent *ent)
 
 static void arm_smmu_cmdq_skip_err(struct arm_smmu_device *smmu)
 {
-	static const char *cerror_str[] = {
+	static const char * const cerror_str[] = {
 		[CMDQ_ERR_CERROR_NONE_IDX]	= "No error",
 		[CMDQ_ERR_CERROR_ILL_IDX]	= "Illegal command",
 		[CMDQ_ERR_CERROR_ABT_IDX]	= "Abort on command fetch",
-- 
2.25.1


