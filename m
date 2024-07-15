Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A8BE29318C4
	for <lists+xen-devel@lfdr.de>; Mon, 15 Jul 2024 18:47:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.759062.1168620 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sTOrR-0007CV-20; Mon, 15 Jul 2024 16:47:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 759062.1168620; Mon, 15 Jul 2024 16:47:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sTOrQ-00079m-UK; Mon, 15 Jul 2024 16:47:36 +0000
Received: by outflank-mailman (input) for mailman id 759062;
 Mon, 15 Jul 2024 16:47:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=f3wo=OP=bugseng.com=federico.serafini@srs-se1.protection.inumbo.net>)
 id 1sTOrP-000798-WD
 for xen-devel@lists.xenproject.org; Mon, 15 Jul 2024 16:47:36 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id eead601a-42c9-11ef-bbfb-fd08da9f4363;
 Mon, 15 Jul 2024 18:47:33 +0200 (CEST)
Received: from truciolo.bugseng.com (unknown [37.163.111.28])
 by support.bugseng.com (Postfix) with ESMTPSA id 9E7074EE073E;
 Mon, 15 Jul 2024 18:47:31 +0200 (CEST)
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
X-Inumbo-ID: eead601a-42c9-11ef-bbfb-fd08da9f4363
From: Federico Serafini <federico.serafini@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com,
	Federico Serafini <federico.serafini@bugseng.com>,
	Jan Beulich <jbeulich@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [XEN PATCH v4 1/9] automation/eclair: fix deviation of MISRA C Rule 16.3
Date: Mon, 15 Jul 2024 18:47:14 +0200
Message-Id: <490e1a84b1b4b8d983dc41af147191f79506cdbd.1721050709.git.federico.serafini@bugseng.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1721050709.git.federico.serafini@bugseng.com>
References: <cover.1721050709.git.federico.serafini@bugseng.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Escape the final dot of the comment and extend the search of a
fallthrough comment up to 2 lines after the last statement.

Fixes: Fixes: a128d8da91 ("automation/eclair: add deviations for MISRA C:2012 Rule 16.3")
Reported-by: Jan Beulich <jbeulich@suse.com>
Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
Acked-by: Stefano Stabellini <sstabellini@kernel.org>
---
 automation/eclair_analysis/ECLAIR/deviations.ecl | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/automation/eclair_analysis/ECLAIR/deviations.ecl b/automation/eclair_analysis/ECLAIR/deviations.ecl
index 0d94635275..e95554acae 100644
--- a/automation/eclair_analysis/ECLAIR/deviations.ecl
+++ b/automation/eclair_analysis/ECLAIR/deviations.ecl
@@ -499,7 +499,7 @@ safe."
 -doc_end
 
 -doc_begin="Switch clauses ending with an explicit comment indicating the fallthrough intention are safe."
--config=MC3R1.R16.3,reports+={safe, "any_area(end_loc(any_exp(text(^(?s).*/\\* [fF]all ?through.? \\*/.*$,0..1))))"}
+-config=MC3R1.R16.3,reports+={safe, "any_area(end_loc(any_exp(text(^(?s).*/\\* [fF]all ?through\\.? \\*/.*$,0..2))))"}
 -doc_end
 
 -doc_begin="Switch statements having a controlling expression of enum type deliberately do not have a default case: gcc -Wall enables -Wswitch which warns (and breaks the build as we use -Werror) if one of the enum labels is missing from the switch."
-- 
2.34.1


