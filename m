Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8359F735108
	for <lists+xen-devel@lfdr.de>; Mon, 19 Jun 2023 11:56:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.550921.860152 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qBBcm-0006nZ-TK; Mon, 19 Jun 2023 09:56:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 550921.860152; Mon, 19 Jun 2023 09:56:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qBBcm-0006lu-QJ; Mon, 19 Jun 2023 09:56:40 +0000
Received: by outflank-mailman (input) for mailman id 550921;
 Mon, 19 Jun 2023 09:56:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4BTp=CH=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1qBBcm-0006ke-6J
 for xen-devel@lists.xenproject.org; Mon, 19 Jun 2023 09:56:40 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9514e56d-0e87-11ee-8611-37d641c3527e;
 Mon, 19 Jun 2023 11:56:38 +0200 (CEST)
Received: from nico.bugseng.com (unknown [151.44.138.43])
 by support.bugseng.com (Postfix) with ESMTPSA id A2DAF4EE0C8D;
 Mon, 19 Jun 2023 11:56:36 +0200 (CEST)
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
X-Inumbo-ID: 9514e56d-0e87-11ee-8611-37d641c3527e
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: michal.orzel@amd.com,
	xenia.ragiadakou@amd.com,
	ayan.kumar.halder@amd.com,
	consulting@bugseng.com,
	Nicola Vetrini <nicola.vetrini@bugseng.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [XEN PATCH v2 1/3] xen/arch/arm: fix violations of MISRA C:2012 Rule 3.1
Date: Mon, 19 Jun 2023 11:56:11 +0200
Message-Id: <e2b7f377d1467833d9ae2cd897c962561e54fb02.1687167502.git.nicola.vetrini@bugseng.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1687167502.git.nicola.vetrini@bugseng.com>
References: <cover.1687167502.git.nicola.vetrini@bugseng.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In the files `xen/arch/arm/include/asm/arm(32|64)/flushtlb.h' there are a
few occurrences of nested '//' character sequences inside C-style comment
blocks, which violate Rule 3.1. The patch aims to resolve those by removing
the nested comments.

Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com
---
Changes:
- Resending the patch with the right maintainers in CC.
Changes in V2:
- Split the patch into a series and reworked the fix.
- Apply the fix to the arm32 `flushtlb.h' file, for consistency
Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
---
 xen/arch/arm/include/asm/arm32/flushtlb.h | 8 ++++----
 xen/arch/arm/include/asm/arm64/flushtlb.h | 8 ++++----
 2 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/xen/arch/arm/include/asm/arm32/flushtlb.h b/xen/arch/arm/include/asm/arm32/flushtlb.h
index 22ee3b317b..bcbeac590b 100644
--- a/xen/arch/arm/include/asm/arm32/flushtlb.h
+++ b/xen/arch/arm/include/asm/arm32/flushtlb.h
@@ -4,10 +4,10 @@
 /*
  * Every invalidation operation use the following patterns:
  *
- * DSB ISHST        // Ensure prior page-tables updates have completed
- * TLBI...          // Invalidate the TLB
- * DSB ISH          // Ensure the TLB invalidation has completed
- * ISB              // See explanation below
+ * DSB ISHST        Ensure prior page-tables updates have completed
+ * TLBI...          Invalidate the TLB
+ * DSB ISH          Ensure the TLB invalidation has completed
+ * ISB              See explanation below
  *
  * For Xen page-tables the ISB will discard any instructions fetched
  * from the old mappings.
diff --git a/xen/arch/arm/include/asm/arm64/flushtlb.h b/xen/arch/arm/include/asm/arm64/flushtlb.h
index 56c6fc763b..6066a2d703 100644
--- a/xen/arch/arm/include/asm/arm64/flushtlb.h
+++ b/xen/arch/arm/include/asm/arm64/flushtlb.h
@@ -4,10 +4,10 @@
 /*
  * Every invalidation operation use the following patterns:
  *
- * DSB ISHST        // Ensure prior page-tables updates have completed
- * TLBI...          // Invalidate the TLB
- * DSB ISH          // Ensure the TLB invalidation has completed
- * ISB              // See explanation below
+ * DSB ISHST        Ensure prior page-tables updates have completed
+ * TLBI...          Invalidate the TLB
+ * DSB ISH          Ensure the TLB invalidation has completed
+ * ISB              See explanation below
  *
  * ARM64_WORKAROUND_REPEAT_TLBI:
  * Modification of the translation table for a virtual address might lead to
-- 
2.34.1


