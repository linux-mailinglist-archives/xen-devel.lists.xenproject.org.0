Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2262D5AE4F3
	for <lists+xen-devel@lfdr.de>; Tue,  6 Sep 2022 12:01:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.399751.641066 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oVVOT-00076V-8E; Tue, 06 Sep 2022 10:01:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 399751.641066; Tue, 06 Sep 2022 10:01:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oVVOT-00073u-4d; Tue, 06 Sep 2022 10:01:21 +0000
Received: by outflank-mailman (input) for mailman id 399751;
 Tue, 06 Sep 2022 10:01:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lcW6=ZJ=arm.com=rahul.singh@srs-se1.protection.inumbo.net>)
 id 1oVVOR-0006Tk-My
 for xen-devel@lists.xenproject.org; Tue, 06 Sep 2022 10:01:19 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id da4c68ef-2dca-11ed-a016-b9edf5238543;
 Tue, 06 Sep 2022 12:01:19 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 93B66D6E;
 Tue,  6 Sep 2022 03:01:24 -0700 (PDT)
Received: from e109506.cambridge.arm.com (e109506.cambridge.arm.com
 [10.1.199.62])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 551413F534;
 Tue,  6 Sep 2022 03:01:17 -0700 (PDT)
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
X-Inumbo-ID: da4c68ef-2dca-11ed-a016-b9edf5238543
From: Rahul Singh <rahul.singh@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Bixuan Cui <cuibixuan@huawei.com>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Will Deacon <will@kernel.org>
Subject: [PATCH v4 07/10] xen/arm: smmuv3: Change *array into *const array
Date: Tue,  6 Sep 2022 10:55:54 +0100
Message-Id: <2693ef69907c51c351c1ab7f25ba1f4df4625b71.1662455798.git.rahul.singh@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1662455798.git.rahul.singh@arm.com>
References: <cover.1662455798.git.rahul.singh@arm.com>
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
 xen/drivers/passthrough/arm/smmu-v3.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/drivers/passthrough/arm/smmu-v3.c b/xen/drivers/passthrough/arm/smmu-v3.c
index 28fcb01757..c53d4c96a4 100644
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


