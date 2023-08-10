Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5774C777324
	for <lists+xen-devel@lfdr.de>; Thu, 10 Aug 2023 10:40:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.581927.911436 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qU1DL-0006Vd-Ou; Thu, 10 Aug 2023 08:40:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 581927.911436; Thu, 10 Aug 2023 08:40:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qU1DL-0006Pr-IL; Thu, 10 Aug 2023 08:40:15 +0000
Received: by outflank-mailman (input) for mailman id 581927;
 Thu, 10 Aug 2023 08:40:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MZIv=D3=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1qU1DJ-0005MW-Ap
 for xen-devel@lists.xenproject.org; Thu, 10 Aug 2023 08:40:13 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8582d30c-3759-11ee-b283-6b7b168915f2;
 Thu, 10 Aug 2023 10:40:12 +0200 (CEST)
Received: from nico.bugseng.com (unknown [147.123.100.131])
 by support.bugseng.com (Postfix) with ESMTPSA id 004BE4EE0746;
 Thu, 10 Aug 2023 10:40:11 +0200 (CEST)
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
X-Inumbo-ID: 8582d30c-3759-11ee-b283-6b7b168915f2
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org,
	michal.orzel@amd.com,
	xenia.ragiadakou@amd.com,
	ayan.kumar.halder@amd.com,
	consulting@bugseng.com,
	Nicola Vetrini <nicola.vetrini@bugseng.com>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Luca Fancellu <luca.fancellu@arm.com>
Subject: [XEN PATCH v2 6/7] xen/arm: mm: add missing extern variable declaration
Date: Thu, 10 Aug 2023 10:39:46 +0200
Message-Id: <228fc4768f50ea14c38b77f9e2169b76f365617d.1691655814.git.nicola.vetrini@bugseng.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1691655814.git.nicola.vetrini@bugseng.com>
References: <cover.1691655814.git.nicola.vetrini@bugseng.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a declaration for the variable 'init_ttbr' to resolve
the violation of Rule 8.4 present the relative source file 'mm.c'.

No functional changes.

Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
Fixes: 4557c2292854 ("xen: arm: rewrite start of day page table and cpu bring up")
Reviewed-by: Luca Fancellu <luca.fancellu@arm.com>
Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
---
Changes in v2:
- Revised commit message
---
 xen/arch/arm/include/asm/mm.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/xen/arch/arm/include/asm/mm.h b/xen/arch/arm/include/asm/mm.h
index 2db8535a4ca8..aaacba3f044b 100644
--- a/xen/arch/arm/include/asm/mm.h
+++ b/xen/arch/arm/include/asm/mm.h
@@ -165,6 +165,9 @@ struct page_info
 #define _PGC_need_scrub   _PGC_allocated
 #define PGC_need_scrub    PGC_allocated
 
+/* Non-boot CPUs use this to find the correct pagetables. */
+extern uint64_t init_ttbr;
+
 extern mfn_t directmap_mfn_start, directmap_mfn_end;
 extern vaddr_t directmap_virt_end;
 #ifdef CONFIG_ARM_64
-- 
2.34.1


