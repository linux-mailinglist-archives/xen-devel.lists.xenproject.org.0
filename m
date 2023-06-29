Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AB0A07423BA
	for <lists+xen-devel@lfdr.de>; Thu, 29 Jun 2023 12:07:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.556722.869464 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qEoYQ-00017W-SF; Thu, 29 Jun 2023 10:07:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 556722.869464; Thu, 29 Jun 2023 10:07:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qEoYQ-00014n-OA; Thu, 29 Jun 2023 10:07:10 +0000
Received: by outflank-mailman (input) for mailman id 556722;
 Thu, 29 Jun 2023 10:07:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cHn5=CR=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1qEoYP-0000mz-HI
 for xen-devel@lists.xenproject.org; Thu, 29 Jun 2023 10:07:09 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b501fc14-1664-11ee-b237-6b7b168915f2;
 Thu, 29 Jun 2023 12:07:08 +0200 (CEST)
Received: from nico.bugseng.com (unknown [151.43.188.44])
 by support.bugseng.com (Postfix) with ESMTPSA id 829344EE0738;
 Thu, 29 Jun 2023 12:07:05 +0200 (CEST)
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
X-Inumbo-ID: b501fc14-1664-11ee-b237-6b7b168915f2
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org,
	michal.orzel@amd.com,
	xenia.ragiadakou@amd.com,
	ayan.kumar.halder@amd.com,
	consulting@bugseng.com,
	jbeulich@suse.com,
	andrew.cooper3@citrix.com,
	roger.pau@citrix.com,
	bertrand.marquis@arm.com,
	julien@xen.org,
	Nicola Vetrini <nicola.vetrini@bugseng.com>,
	Rahul Singh <rahul.singh@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [XEN PATCH v3 2/3] xen/drivers/passthrough/arm/smmu-v3.c: fix violations of MISRA C:2012 Rule 3.1
Date: Thu, 29 Jun 2023 12:06:16 +0200
Message-Id: <8a8d5ed47f24791d3927345fafed07023a8b0b76.1688032865.git.nicola.vetrini@bugseng.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1688032865.git.nicola.vetrini@bugseng.com>
References: <cover.1688032865.git.nicola.vetrini@bugseng.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In the file `xen/drivers/passthrough/arm/smmu-v3.c' there are a few occurrences
of nested '//' character sequences inside C-style comment blocks, which violate
Rule 3.1.

The patch aims to resolve those by replacing the nested comments with
equivalent constructs that do not violate the rule.

Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
Changes:
- Resending the patch with the right maintainers in CC.
Changes in V2:
- Split the patch into a series and reworked the fix.
- Apply the fix to the arm32 `flushtlb.h' file, for consistency
Changes in V3:
- Revised the comment to make it clear the function the parallel control
flows in the comment belong to.
---
 xen/drivers/passthrough/arm/smmu-v3.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/xen/drivers/passthrough/arm/smmu-v3.c b/xen/drivers/passthrough/arm/smmu-v3.c
index 720aa69ff2..cdbb505134 100644
--- a/xen/drivers/passthrough/arm/smmu-v3.c
+++ b/xen/drivers/passthrough/arm/smmu-v3.c
@@ -1047,10 +1047,10 @@ static int arm_smmu_atc_inv_domain(struct arm_smmu_domain *smmu_domain,
 	 * before we read 'nr_ats_masters' in case of a concurrent call to
 	 * arm_smmu_enable_ats():
 	 *
-	 *	// unmap()			// arm_smmu_enable_ats()
-	 *	TLBI+SYNC			atomic_inc(&nr_ats_masters);
-	 *	smp_mb();			[...]
-	 *	atomic_read(&nr_ats_masters);	pci_enable_ats() // writel()
+	 *	--- unmap() ---                 --- arm_smmu_enable_ats() ---
+	 *	TLBI+SYNC                       atomic_inc(&nr_ats_masters);
+	 *	smp_mb();                       [...]
+	 *	atomic_read(&nr_ats_masters);   pci_enable_ats() (see writel())
 	 *
 	 * Ensures that we always see the incremented 'nr_ats_masters' count if
 	 * ATS was enabled at the PCI device before completion of the TLBI.
-- 
2.34.1


