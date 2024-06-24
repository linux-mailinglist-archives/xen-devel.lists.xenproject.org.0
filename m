Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D70F9145B9
	for <lists+xen-devel@lfdr.de>; Mon, 24 Jun 2024 11:05:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.746321.1153348 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sLfd4-0003H8-OD; Mon, 24 Jun 2024 09:04:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 746321.1153348; Mon, 24 Jun 2024 09:04:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sLfd4-0003Eh-Io; Mon, 24 Jun 2024 09:04:50 +0000
Received: by outflank-mailman (input) for mailman id 746321;
 Mon, 24 Jun 2024 09:04:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=H9EP=N2=bugseng.com=federico.serafini@srs-se1.protection.inumbo.net>)
 id 1sLfd3-0002x1-2d
 for xen-devel@lists.xenproject.org; Mon, 24 Jun 2024 09:04:49 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ce134d4e-3208-11ef-b4bb-af5377834399;
 Mon, 24 Jun 2024 11:04:47 +0200 (CEST)
Received: from truciolo.bugseng.com (unknown [37.160.55.204])
 by support.bugseng.com (Postfix) with ESMTPSA id 4D5F64EE0754;
 Mon, 24 Jun 2024 11:04:46 +0200 (CEST)
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
X-Inumbo-ID: ce134d4e-3208-11ef-b4bb-af5377834399
From: Federico Serafini <federico.serafini@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com,
	Federico Serafini <federico.serafini@bugseng.com>,
	Simone Ballarin <simone.ballarin@bugseng.com>,
	Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Jan Beulich <jbeulich@suse.com>
Subject: [XEN PATCH v2 01/13] automation/eclair: fix deviation of MISRA C Rule 16.3
Date: Mon, 24 Jun 2024 11:04:25 +0200
Message-Id: <c43a32405cc949ef5bf26a2ca1d1cc7ee7f5e664.1719218291.git.federico.serafini@bugseng.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1719218291.git.federico.serafini@bugseng.com>
References: <cover.1719218291.git.federico.serafini@bugseng.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Escape the final dot of the comment and extend the search of a
fallthrough comment up to 2 lines after the last statement.

Fixes: a128d8da913b21eff6c6d2e2a7d4c54c054b78db "automation/eclair: add deviations for MISRA C:2012 Rule 16.3"
Reported-by: Jan Beulich <jbeulich@suse.com>
Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
---
Changes in v2:
- instead of introducing the hypened fallthrough, insert the missing escape.
---
 automation/eclair_analysis/ECLAIR/deviations.ecl | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/automation/eclair_analysis/ECLAIR/deviations.ecl b/automation/eclair_analysis/ECLAIR/deviations.ecl
index b8f9155267..9df3e0f0c4 100644
--- a/automation/eclair_analysis/ECLAIR/deviations.ecl
+++ b/automation/eclair_analysis/ECLAIR/deviations.ecl
@@ -400,7 +400,7 @@ safe."
 -doc_end
 
 -doc_begin="Switch clauses ending with an explicit comment indicating the fallthrough intention are safe."
--config=MC3R1.R16.3,reports+={safe, "any_area(end_loc(any_exp(text(^(?s).*/\\* [fF]all ?through.? \\*/.*$,0..1))))"}
+-config=MC3R1.R16.3,reports+={safe, "any_area(end_loc(any_exp(text(^(?s).*/\\* [fF]all ?through\\.? \\*/.*$,0..2))))"}
 -doc_end
 
 -doc_begin="Switch statements having a controlling expression of enum type deliberately do not have a default case: gcc -Wall enables -Wswitch which warns (and breaks the build as we use -Werror) if one of the enum labels is missing from the switch."
-- 
2.34.1


