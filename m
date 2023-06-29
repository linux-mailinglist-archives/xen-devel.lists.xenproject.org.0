Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 652DE7423B8
	for <lists+xen-devel@lfdr.de>; Thu, 29 Jun 2023 12:07:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.556720.869453 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qEoYL-0000qV-Ju; Thu, 29 Jun 2023 10:07:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 556720.869453; Thu, 29 Jun 2023 10:07:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qEoYL-0000nP-Gk; Thu, 29 Jun 2023 10:07:05 +0000
Received: by outflank-mailman (input) for mailman id 556720;
 Thu, 29 Jun 2023 10:07:04 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cHn5=CR=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1qEoYK-0000mz-CU
 for xen-devel@lists.xenproject.org; Thu, 29 Jun 2023 10:07:04 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b1690b83-1664-11ee-b237-6b7b168915f2;
 Thu, 29 Jun 2023 12:07:02 +0200 (CEST)
Received: from nico.bugseng.com (unknown [151.43.188.44])
 by support.bugseng.com (Postfix) with ESMTPSA id C30534EE0739;
 Thu, 29 Jun 2023 12:06:59 +0200 (CEST)
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
X-Inumbo-ID: b1690b83-1664-11ee-b237-6b7b168915f2
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
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [XEN PATCH v3 1/3] xen/arch/arm: fix violations of MISRA C:2012 Rule 3.1
Date: Thu, 29 Jun 2023 12:06:15 +0200
Message-Id: <7996a8bb62e62076d48bdf289e37352bb5e43b52.1688032865.git.nicola.vetrini@bugseng.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1688032865.git.nicola.vetrini@bugseng.com>
References: <cover.1688032865.git.nicola.vetrini@bugseng.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In the files `xen/arch/arm/include/asm/arm(32|64)/flushtlb.h' there are a
few occurrences of nested '//' character sequences inside C-style comment
blocks, which violate Rule 3.1. The patch aims to resolve those by changing
the inner comments to arm asm comments, delimited by ';' instead.

Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
---
Changes:
- Resending the patch with the right maintainers in CC.
Changes in V2:
- Split the patch into a series and reworked the fix.
- Apply the fix to the arm32 `flushtlb.h' file, for consistency
Changes in V3:
- Switched to arm asm comment in `arm(32|64)/flushtlb.h'
---
 xen/arch/arm/include/asm/arm32/flushtlb.h | 8 ++++----
 xen/arch/arm/include/asm/arm64/flushtlb.h | 8 ++++----
 2 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/xen/arch/arm/include/asm/arm32/flushtlb.h b/xen/arch/arm/include/asm/arm32/flushtlb.h
index 22ee3b317b..61c25a3189 100644
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
+ * DSB ISHST        ; Ensure prior page-tables updates have completed
+ * TLBI...          ; Invalidate the TLB
+ * DSB ISH          ; Ensure the TLB invalidation has completed
+ * ISB              ; See explanation below
  *
  * For Xen page-tables the ISB will discard any instructions fetched
  * from the old mappings.
diff --git a/xen/arch/arm/include/asm/arm64/flushtlb.h b/xen/arch/arm/include/asm/arm64/flushtlb.h
index 56c6fc763b..45642201d1 100644
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
+ * DSB ISHST        ; Ensure prior page-tables updates have completed
+ * TLBI...          ; Invalidate the TLB
+ * DSB ISH          ; Ensure the TLB invalidation has completed
+ * ISB              ; See explanation below
  *
  * ARM64_WORKAROUND_REPEAT_TLBI:
  * Modification of the translation table for a virtual address might lead to
-- 
2.34.1


