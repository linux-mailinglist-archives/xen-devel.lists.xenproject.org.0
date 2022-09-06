Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 86BE35AF752
	for <lists+xen-devel@lfdr.de>; Tue,  6 Sep 2022 23:50:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.400403.642145 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oVgSn-00043R-T2; Tue, 06 Sep 2022 21:50:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 400403.642145; Tue, 06 Sep 2022 21:50:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oVgSn-0003zk-In; Tue, 06 Sep 2022 21:50:33 +0000
Received: by outflank-mailman (input) for mailman id 400403;
 Tue, 06 Sep 2022 21:50:31 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lcW6=ZJ=arm.com=rahul.singh@srs-se1.protection.inumbo.net>)
 id 1oVgI7-0000Cs-Ec
 for xen-devel@lists.xenproject.org; Tue, 06 Sep 2022 21:39:31 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id dd83d0cd-2dca-11ed-af93-0125da4c0113;
 Tue, 06 Sep 2022 12:01:24 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A1963D6E;
 Tue,  6 Sep 2022 03:01:31 -0700 (PDT)
Received: from e109506.cambridge.arm.com (e109506.cambridge.arm.com
 [10.1.199.62])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 482E73F534;
 Tue,  6 Sep 2022 03:01:24 -0700 (PDT)
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
X-Inumbo-ID: dd83d0cd-2dca-11ed-af93-0125da4c0113
From: Rahul Singh <rahul.singh@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Robin Murphy <robin.murphy@arm.com>,
	Will Deacon <will@kernel.org>
Subject: [PATCH v4 10/10] xen/arm: smmuv3: Avoid open coded arithmetic in memory allocation
Date: Tue,  6 Sep 2022 10:55:57 +0100
Message-Id: <ebbfb61417f73bbfca341a9f0b97c6c372ac5865.1662455798.git.rahul.singh@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1662455798.git.rahul.singh@arm.com>
References: <cover.1662455798.git.rahul.singh@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Backport Linux commit 98b64741d611. This is the clean backport without
any changes

kmalloc_array()/kcalloc() should be used to avoid potential overflow
when a multiplication is needed to compute the size of the requested
memory.

So turn a devm_kzalloc()+explicit size computation into an
equivalent devm_kcalloc().

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Acked-by: Robin Murphy <robin.murphy@arm.com>
Link: https://lore.kernel.org/r/3f7b9b202c6b6f5edc234ab7af5f208fbf8bc944.1644274051.git.christophe.jaillet@wanadoo.fr
Signed-off-by: Will Deacon <will@kernel.org>
Origin: git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git 98b64741d611
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
 xen/drivers/passthrough/arm/smmu-v3.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/xen/drivers/passthrough/arm/smmu-v3.c b/xen/drivers/passthrough/arm/smmu-v3.c
index b8ca4b0a24..9c9f463009 100644
--- a/xen/drivers/passthrough/arm/smmu-v3.c
+++ b/xen/drivers/passthrough/arm/smmu-v3.c
@@ -1644,10 +1644,10 @@ static int arm_smmu_init_l1_strtab(struct arm_smmu_device *smmu)
 {
 	unsigned int i;
 	struct arm_smmu_strtab_cfg *cfg = &smmu->strtab_cfg;
-	size_t size = sizeof(*cfg->l1_desc) * cfg->num_l1_ents;
 	void *strtab = smmu->strtab_cfg.strtab;
 
-	cfg->l1_desc = _xzalloc(size, sizeof(void *));
+	cfg->l1_desc = _xzalloc_array(sizeof(*cfg->l1_desc), sizeof(void *),
+								  cfg->num_l1_ents);
 	if (!cfg->l1_desc)
 		return -ENOMEM;
 
-- 
2.25.1


