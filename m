Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1654E917C74
	for <lists+xen-devel@lfdr.de>; Wed, 26 Jun 2024 11:28:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.748583.1156340 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sMOwp-0004o1-QU; Wed, 26 Jun 2024 09:28:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 748583.1156340; Wed, 26 Jun 2024 09:28:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sMOwp-0004lH-LB; Wed, 26 Jun 2024 09:28:15 +0000
Received: by outflank-mailman (input) for mailman id 748583;
 Wed, 26 Jun 2024 09:28:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=P08s=N4=bugseng.com=federico.serafini@srs-se1.protection.inumbo.net>)
 id 1sMOwo-0004l0-0u
 for xen-devel@lists.xenproject.org; Wed, 26 Jun 2024 09:28:14 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 68f45ac6-339e-11ef-90a3-e314d9c70b13;
 Wed, 26 Jun 2024 11:28:13 +0200 (CEST)
Received: from truciolo.bugseng.com (unknown [78.209.199.41])
 by support.bugseng.com (Postfix) with ESMTPSA id 5D0344EE0755;
 Wed, 26 Jun 2024 11:28:12 +0200 (CEST)
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
X-Inumbo-ID: 68f45ac6-339e-11ef-90a3-e314d9c70b13
From: Federico Serafini <federico.serafini@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com,
	Federico Serafini <federico.serafini@bugseng.com>,
	Simone Ballarin <simone.ballarin@bugseng.com>,
	Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Jan Beulich <jbeulich@suse.com>
Subject: [XEN PATCH v3 01/12] automation/eclair: fix deviation of MISRA C Rule 16.3
Date: Wed, 26 Jun 2024 11:27:54 +0200
Message-Id: <bcbd654ad6a241f2d98b59fb9a879f75d436276c.1719383180.git.federico.serafini@bugseng.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1719383180.git.federico.serafini@bugseng.com>
References: <cover.1719383180.git.federico.serafini@bugseng.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Escape the final dot of the comment and extend the search of a
fallthrough comment up to 2 lines after the last statement.

Fixes: a128d8da913b ("automation/eclair: add deviations for MISRA C:2012 Rule 16.3")
Reported-by: Jan Beulich <jbeulich@suse.com>
Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
Acked-by: Stefano Stabellini <sstabellini@kernel.org>
---
Changes in v3:
- truncate to 12 digits.

Changes in v2:
- instead of introducing the hypened fallthrough, insert the missing escape.
---
 automation/eclair_analysis/ECLAIR/deviations.ecl | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/automation/eclair_analysis/ECLAIR/deviations.ecl b/automation/eclair_analysis/ECLAIR/deviations.ecl
index c8bff0e057..9b994be63d 100644
--- a/automation/eclair_analysis/ECLAIR/deviations.ecl
+++ b/automation/eclair_analysis/ECLAIR/deviations.ecl
@@ -416,7 +416,7 @@ safe."
 -doc_end
 
 -doc_begin="Switch clauses ending with an explicit comment indicating the fallthrough intention are safe."
--config=MC3R1.R16.3,reports+={safe, "any_area(end_loc(any_exp(text(^(?s).*/\\* [fF]all ?through.? \\*/.*$,0..1))))"}
+-config=MC3R1.R16.3,reports+={safe, "any_area(end_loc(any_exp(text(^(?s).*/\\* [fF]all ?through\\.? \\*/.*$,0..2))))"}
 -doc_end
 
 -doc_begin="Switch statements having a controlling expression of enum type deliberately do not have a default case: gcc -Wall enables -Wswitch which warns (and breaks the build as we use -Werror) if one of the enum labels is missing from the switch."
-- 
2.34.1


