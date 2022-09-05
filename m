Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BBB6B5AD798
	for <lists+xen-devel@lfdr.de>; Mon,  5 Sep 2022 18:33:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.398981.640027 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oVF2j-0002Dk-9Y; Mon, 05 Sep 2022 16:33:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 398981.640027; Mon, 05 Sep 2022 16:33:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oVF2j-00029h-64; Mon, 05 Sep 2022 16:33:49 +0000
Received: by outflank-mailman (input) for mailman id 398981;
 Mon, 05 Sep 2022 16:33:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fkdn=ZI=arm.com=rahul.singh@srs-se1.protection.inumbo.net>)
 id 1oVF2h-0001Jo-5n
 for xen-devel@lists.xenproject.org; Mon, 05 Sep 2022 16:33:47 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id 83425ef9-2d38-11ed-af93-0125da4c0113;
 Mon, 05 Sep 2022 18:33:46 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 232AA175A;
 Mon,  5 Sep 2022 09:33:52 -0700 (PDT)
Received: from e109506.cambridge.arm.com (e109506.cambridge.arm.com
 [10.1.199.62])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C1DEE3F534;
 Mon,  5 Sep 2022 09:33:44 -0700 (PDT)
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
X-Inumbo-ID: 83425ef9-2d38-11ed-af93-0125da4c0113
From: Rahul Singh <rahul.singh@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Robin Murphy <robin.murphy@arm.com>,
	Will Deacon <will@kernel.org>
Subject: [PATCH v3 10/10] xen/arm: smmuv3: Avoid open coded arithmetic in memory allocation
Date: Mon,  5 Sep 2022 17:30:45 +0100
Message-Id: <9cfdd7090aa113000eb903f3cf521caef23df8e1.1662394710.git.rahul.singh@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1662394710.git.rahul.singh@arm.com>
References: <cover.1662394710.git.rahul.singh@arm.com>
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
Acked-by: Stefano Stabellini <sstabellini@kernel.org>
Signed-off-by: Rahul Singh <rahul.singh@arm.com>
---
Changes in v3:
 - Added Stefano Acked-by
Changes in v2:
 - fix commit msg
---
---
 xen/drivers/passthrough/arm/smmu-v3.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/xen/drivers/passthrough/arm/smmu-v3.c b/xen/drivers/passthrough/arm/smmu-v3.c
index e8f2f2dbe1..a3d5f53137 100644
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


