Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 42F2E735109
	for <lists+xen-devel@lfdr.de>; Mon, 19 Jun 2023 11:56:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.550923.860164 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qBBct-00078Z-69; Mon, 19 Jun 2023 09:56:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 550923.860164; Mon, 19 Jun 2023 09:56:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qBBct-00075C-1w; Mon, 19 Jun 2023 09:56:47 +0000
Received: by outflank-mailman (input) for mailman id 550923;
 Mon, 19 Jun 2023 09:56:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4BTp=CH=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1qBBcr-0006ke-Hp
 for xen-devel@lists.xenproject.org; Mon, 19 Jun 2023 09:56:45 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 98516d38-0e87-11ee-8611-37d641c3527e;
 Mon, 19 Jun 2023 11:56:43 +0200 (CEST)
Received: from nico.bugseng.com (unknown [151.44.138.43])
 by support.bugseng.com (Postfix) with ESMTPSA id 8CE034EE0741;
 Mon, 19 Jun 2023 11:56:41 +0200 (CEST)
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
X-Inumbo-ID: 98516d38-0e87-11ee-8611-37d641c3527e
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: michal.orzel@amd.com,
	xenia.ragiadakou@amd.com,
	ayan.kumar.halder@amd.com,
	consulting@bugseng.com,
	Nicola Vetrini <nicola.vetrini@bugseng.com>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Rahul Singh <rahul.singh@arm.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [XEN PATCH v2 2/3] xen/drivers/passthrough/arm/smmu-v3.c: fix violations of MISRA C:2012 Rule 3.1
Date: Mon, 19 Jun 2023 11:56:12 +0200
Message-Id: <3f8d720c09d603edcc608b1b73423c35ea8f6e3f.1687167502.git.nicola.vetrini@bugseng.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1687167502.git.nicola.vetrini@bugseng.com>
References: <cover.1687167502.git.nicola.vetrini@bugseng.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In the file `xen/drivers/passthrough/arm/smmu-v3.c' there are a few occurrences
of nested '//' character sequences inside C-style comment blocks, which violate
Rule 3.1. The patch aims to resolve those by removing the nested comments.

Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com
Changes:
- Resending the patch with the right maintainers in CC.
Changes in V2:
- Split the patch into a series and reworked the fix.
- Apply the fix to the arm32 `flushtlb.h' file, for consistency
Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
---
 xen/drivers/passthrough/arm/smmu-v3.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/xen/drivers/passthrough/arm/smmu-v3.c b/xen/drivers/passthrough/arm/smmu-v3.c
index 720aa69ff2..f410863e10 100644
--- a/xen/drivers/passthrough/arm/smmu-v3.c
+++ b/xen/drivers/passthrough/arm/smmu-v3.c
@@ -1047,10 +1047,10 @@ static int arm_smmu_atc_inv_domain(struct arm_smmu_domain *smmu_domain,
 	 * before we read 'nr_ats_masters' in case of a concurrent call to
 	 * arm_smmu_enable_ats():
 	 *
-	 *	// unmap()			// arm_smmu_enable_ats()
+	 *	unmap()				arm_smmu_enable_ats()
 	 *	TLBI+SYNC			atomic_inc(&nr_ats_masters);
 	 *	smp_mb();			[...]
-	 *	atomic_read(&nr_ats_masters);	pci_enable_ats() // writel()
+	 *	atomic_read(&nr_ats_masters);	pci_enable_ats() (i.e. writel())
 	 *
 	 * Ensures that we always see the incremented 'nr_ats_masters' count if
 	 * ATS was enabled at the PCI device before completion of the TLBI.
-- 
2.34.1


