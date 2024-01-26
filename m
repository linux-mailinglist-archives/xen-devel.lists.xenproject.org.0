Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CC68C83D767
	for <lists+xen-devel@lfdr.de>; Fri, 26 Jan 2024 11:09:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.671915.1045473 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rTJ8j-0000CC-Me; Fri, 26 Jan 2024 10:08:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 671915.1045473; Fri, 26 Jan 2024 10:08:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rTJ8j-00008E-I4; Fri, 26 Jan 2024 10:08:49 +0000
Received: by outflank-mailman (input) for mailman id 671915;
 Fri, 26 Jan 2024 10:08:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rljN=JE=bugseng.com=federico.serafini@srs-se1.protection.inumbo.net>)
 id 1rTJ8h-0007rm-EP
 for xen-devel@lists.xenproject.org; Fri, 26 Jan 2024 10:08:47 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e3a8a3eb-bc32-11ee-8a43-1f161083a0e0;
 Fri, 26 Jan 2024 11:08:45 +0100 (CET)
Received: from Dell.homenet.telecomitalia.it
 (host-87-16-84-78.retail.telecomitalia.it [87.16.84.78])
 by support.bugseng.com (Postfix) with ESMTPSA id 613824EE074C;
 Fri, 26 Jan 2024 11:08:44 +0100 (CET)
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
X-Inumbo-ID: e3a8a3eb-bc32-11ee-8a43-1f161083a0e0
From: Federico Serafini <federico.serafini@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com,
	Federico Serafini <federico.serafini@bugseng.com>,
	Simone Ballarin <simone.ballarin@bugseng.com>,
	Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Wei Liu <wl@xen.org>
Subject: [XEN PATCH v2 3/3] automation/eclair: add deviation for MISRA C:2012 Rule 16.3
Date: Fri, 26 Jan 2024 11:05:43 +0100
Message-Id: <5a9ac027852dc661faac65de2caee6a7260c204c.1706259490.git.federico.serafini@bugseng.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1706259490.git.federico.serafini@bugseng.com>
References: <cover.1706259490.git.federico.serafini@bugseng.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Update ECLAIR configuration to consider safe switch clauses ending
with STATIC_ASSERT_UNREACHABLE().

Update docs/misra/deviations.rst accordingly.

Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
---
 automation/eclair_analysis/ECLAIR/deviations.ecl | 4 ++++
 docs/misra/deviations.rst                        | 5 +++++
 2 files changed, 9 insertions(+)

diff --git a/automation/eclair_analysis/ECLAIR/deviations.ecl b/automation/eclair_analysis/ECLAIR/deviations.ecl
index fd32ff8a9c..539efd7b30 100644
--- a/automation/eclair_analysis/ECLAIR/deviations.ecl
+++ b/automation/eclair_analysis/ECLAIR/deviations.ecl
@@ -368,6 +368,10 @@ safe."
 -config=MC3R1.R16.3,reports+={safe, "any_area(end_loc(any_exp(text(/BUG\\(\\);/))))"}
 -doc_end
 
+-doc_begin="Switch clauses ending with unreachability assertion \"STATIC_ASSERT_UNREACHABLE()\" are safe."
+-config=MC3R1.R16.3,reports+={safe, "any_area(end_loc(any_exp(text(/STATIC_ASSERT_UNREACHABLE\\(\\);/))))"}
+-doc_end
+
 -doc_begin="Switch clauses not ending with the break statement are safe if an
 explicit comment indicating the fallthrough intention is present."
 -config=MC3R1.R16.3,reports+={safe, "any_area(end_loc(any_exp(text(^(?s).*/\\* [fF]all ?through.? \\*/.*$,0..1))))"}
diff --git a/docs/misra/deviations.rst b/docs/misra/deviations.rst
index 123c78e20a..c96efdd292 100644
--- a/docs/misra/deviations.rst
+++ b/docs/misra/deviations.rst
@@ -307,6 +307,11 @@ Deviations related to MISRA C:2012 Rules:
      - Switch clauses ending with failure method \"BUG()\" are safe.
      - Tagged as `safe` for ECLAIR.
 
+   * - R16.3
+     - Switch clauses ending with unreachability assertion
+       \"STATIC_ASSERT_UNREACHABLE()\" are safe.
+     - Tagged as `safe` for ECLAIR.
+
    * - R16.3
      - Existing switch clauses not ending with the break statement are safe if
        an explicit comment indicating the fallthrough intention is present.
-- 
2.34.1


