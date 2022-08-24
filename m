Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D6F3159FC60
	for <lists+xen-devel@lfdr.de>; Wed, 24 Aug 2022 15:56:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.392672.631224 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oQqrs-0007Ze-RF; Wed, 24 Aug 2022 13:56:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 392672.631224; Wed, 24 Aug 2022 13:56:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oQqrs-0007Vm-Mg; Wed, 24 Aug 2022 13:56:28 +0000
Received: by outflank-mailman (input) for mailman id 392672;
 Wed, 24 Aug 2022 13:56:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=EISj=Y4=arm.com=rahul.singh@srs-se1.protection.inumbo.net>)
 id 1oQqrr-0005xm-9r
 for xen-devel@lists.xenproject.org; Wed, 24 Aug 2022 13:56:27 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id 7cf531a8-23b4-11ed-9250-1f966e50362f;
 Wed, 24 Aug 2022 15:56:01 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0DCA11042;
 Wed, 24 Aug 2022 06:56:30 -0700 (PDT)
Received: from e109506.cambridge.arm.com (e109506.cambridge.arm.com
 [10.1.199.62])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 27DA83FAF5;
 Wed, 24 Aug 2022 06:56:25 -0700 (PDT)
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
X-Inumbo-ID: 7cf531a8-23b4-11ed-9250-1f966e50362f
From: Rahul Singh <rahul.singh@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Bertrand Marquis <bertrand.marquis@arm.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH 10/10] xen/arm: smmuv3: Avoid open coded arithmetic in memory allocation
Date: Wed, 24 Aug 2022 14:53:14 +0100
Message-Id: <077dda72f2e43ae0ea5794f4d403eddd225c87e4.1661331102.git.rahul.singh@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1661331102.git.rahul.singh@arm.com>
References: <cover.1661331102.git.rahul.singh@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Backport Linux commit 98b64741d61124a12fb05a7595acb1fd6c1dc55d
"iommu/arm-smmu-v3: Avoid open coded arithmetic in memory allocation"

Original commit message:
    iommu/arm-smmu-v3: Avoid open coded arithmetic in memory allocation
    kmalloc_array()/kcalloc() should be used to avoid potential overflow
    when a multiplication is needed to compute the size of the requested
    memory.

    So turn a devm_kzalloc()+explicit size computation into an
    equivalent devm_kcalloc().

    Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
    Acked-by: Robin Murphy <robin.murphy@arm.com>
    Link: https://lore.kernel.org/r/3f7b9b202c6b6f5edc234ab7af5f208fbf8bc944.1644274051.git.christophe.jaillet@wanadoo.fr
    Signed-off-by: Will Deacon <will@kernel.org>

Signed-off-by: Rahul Singh <rahul.singh@arm.com>
---
 xen/drivers/passthrough/arm/smmu-v3.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/xen/drivers/passthrough/arm/smmu-v3.c b/xen/drivers/passthrough/arm/smmu-v3.c
index 900149d0fa..e074d7806f 100644
--- a/xen/drivers/passthrough/arm/smmu-v3.c
+++ b/xen/drivers/passthrough/arm/smmu-v3.c
@@ -1929,10 +1929,10 @@ static int arm_smmu_init_l1_strtab(struct arm_smmu_device *smmu)
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


