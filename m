Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D005559FC5B
	for <lists+xen-devel@lfdr.de>; Wed, 24 Aug 2022 15:56:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.392667.631180 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oQqrl-0006Je-Dm; Wed, 24 Aug 2022 13:56:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 392667.631180; Wed, 24 Aug 2022 13:56:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oQqrl-0006Ga-Am; Wed, 24 Aug 2022 13:56:21 +0000
Received: by outflank-mailman (input) for mailman id 392667;
 Wed, 24 Aug 2022 13:56:20 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=EISj=Y4=arm.com=rahul.singh@srs-se1.protection.inumbo.net>)
 id 1oQqrk-0006Fu-FX
 for xen-devel@lists.xenproject.org; Wed, 24 Aug 2022 13:56:20 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id 8776f6da-23b4-11ed-bd2e-47488cf2e6aa;
 Wed, 24 Aug 2022 15:56:19 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id F41521042;
 Wed, 24 Aug 2022 06:56:22 -0700 (PDT)
Received: from e109506.cambridge.arm.com (e109506.cambridge.arm.com
 [10.1.199.62])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 19DA43FAF5;
 Wed, 24 Aug 2022 06:56:17 -0700 (PDT)
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
X-Inumbo-ID: 8776f6da-23b4-11ed-bd2e-47488cf2e6aa
From: Rahul Singh <rahul.singh@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Bertrand Marquis <bertrand.marquis@arm.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH 06/10] xen/arm: smmuv3: Remove the unused fields for PREFETCH_CONFIG command
Date: Wed, 24 Aug 2022 14:53:10 +0100
Message-Id: <4b6d7c257f7138d6055e76b2023e6eb1f5423c7b.1661331102.git.rahul.singh@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1661331102.git.rahul.singh@arm.com>
References: <cover.1661331102.git.rahul.singh@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Backport Linux commit e0bb4b73540495111ff2723e41cf5add2f031021

Original commit message:
    iommu/arm-smmu-v3: Remove the unused fields for PREFETCH_CONFIG
    command

    Per SMMUv3 spec, there is no Size and Addr field in the
    PREFETCH_CONFIG command and they're not used by the driver.
    Remove them.

    We can add them back if we're going to use PREFETCH_ADDR in the
    future.

    Signed-off-by: Zenghui Yu <yuzenghui@huawei.com>
    Link: https://lore.kernel.org/r/20210407084448.1838-1-yuzenghui@huawei.com
    Signed-off-by: Will Deacon <will@kernel.org>

Signed-off-by: Rahul Singh <rahul.singh@arm.com>
---
 xen/drivers/passthrough/arm/smmu-v3.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/xen/drivers/passthrough/arm/smmu-v3.c b/xen/drivers/passthrough/arm/smmu-v3.c
index 86f4cb7514..c0ec5f1525 100644
--- a/xen/drivers/passthrough/arm/smmu-v3.c
+++ b/xen/drivers/passthrough/arm/smmu-v3.c
@@ -299,8 +299,6 @@ struct arm_smmu_cmdq_ent {
 		#define CMDQ_OP_PREFETCH_CFG	0x1
 		struct {
 			u32			sid;
-			u8			size;
-			u64			addr;
 		} prefetch;
 
 		#define CMDQ_OP_CFGI_STE	0x3
@@ -692,8 +690,6 @@ static int arm_smmu_cmdq_build_cmd(u64 *cmd, struct arm_smmu_cmdq_ent *ent)
 		break;
 	case CMDQ_OP_PREFETCH_CFG:
 		cmd[0] |= FIELD_PREP(CMDQ_PREFETCH_0_SID, ent->prefetch.sid);
-		cmd[1] |= FIELD_PREP(CMDQ_PREFETCH_1_SIZE, ent->prefetch.size);
-		cmd[1] |= ent->prefetch.addr & CMDQ_PREFETCH_1_ADDR_MASK;
 		break;
 	case CMDQ_OP_CFGI_STE:
 		cmd[0] |= FIELD_PREP(CMDQ_CFGI_0_SID, ent->cfgi.sid);
-- 
2.25.1


