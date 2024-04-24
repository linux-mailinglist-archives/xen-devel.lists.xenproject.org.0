Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 850B08B094B
	for <lists+xen-devel@lfdr.de>; Wed, 24 Apr 2024 14:24:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.711390.1111304 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rzbfE-0002tu-Pg; Wed, 24 Apr 2024 12:23:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 711390.1111304; Wed, 24 Apr 2024 12:23:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rzbfE-0002rm-N5; Wed, 24 Apr 2024 12:23:52 +0000
Received: by outflank-mailman (input) for mailman id 711390;
 Wed, 24 Apr 2024 12:23:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=S7Hn=L5=bugseng.com=federico.serafini@srs-se1.protection.inumbo.net>)
 id 1rzbfC-0002oV-Qw
 for xen-devel@lists.xenproject.org; Wed, 24 Apr 2024 12:23:50 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 81398c7e-0235-11ef-909a-e314d9c70b13;
 Wed, 24 Apr 2024 14:23:49 +0200 (CEST)
Received: from truciolo.homenet.telecomitalia.it
 (host-79-60-221-62.business.telecomitalia.it [79.60.221.62])
 by support.bugseng.com (Postfix) with ESMTPSA id 84E704EE0739;
 Wed, 24 Apr 2024 14:23:48 +0200 (CEST)
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
X-Inumbo-ID: 81398c7e-0235-11ef-909a-e314d9c70b13
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
	Julien Grall <julien@xen.org>
Subject: [XEN PATCH] automation/eclair: add deviation of MISRA C:2012 Rule 14.4
Date: Wed, 24 Apr 2024 14:23:41 +0200
Message-Id: <899a456dc9fcd9ceb55efdfb95e71d0abd997700.1713961291.git.federico.serafini@bugseng.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Update ECLAIR configuration to take into account the deviations
agreed during MISRA meetings.

Amend an existing entry of Rule 14.4 in deviations.rst:
it is not a project-wide deviation.

Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
---
 automation/eclair_analysis/ECLAIR/deviations.ecl | 4 ++++
 docs/misra/deviations.rst                        | 8 +++++++-
 2 files changed, 11 insertions(+), 1 deletion(-)

diff --git a/automation/eclair_analysis/ECLAIR/deviations.ecl b/automation/eclair_analysis/ECLAIR/deviations.ecl
index d21f112a9b..f1a29389fd 100644
--- a/automation/eclair_analysis/ECLAIR/deviations.ecl
+++ b/automation/eclair_analysis/ECLAIR/deviations.ecl
@@ -349,6 +349,10 @@ therefore have the same behavior of a boolean"
 -config=MC3R1.R14.4,etypes+={deliberate, "stmt(child(cond,child(expr,ref(^<?domain>?::is_dying$))))","src_type(enum)"}
 -doc_end
 
+-doc_begin="A controlling expression of 'if' and iteration statements having integer, character or pointer type has a semantics that is well-known to all Xen developers."
+-config=MC3R1.R14.4,etypes+={deliberate, "any()", "src_type(integer||character)||src_expr(type(desugar(pointer(any()))))"}
+-doc_end
+
 #
 # Series 16.
 #
diff --git a/docs/misra/deviations.rst b/docs/misra/deviations.rst
index ed0c1e8ed0..a9d9cca04d 100644
--- a/docs/misra/deviations.rst
+++ b/docs/misra/deviations.rst
@@ -294,7 +294,13 @@ Deviations related to MISRA C:2012 Rules:
      - The XEN team relies on the fact that the enum is_dying has the
        constant with assigned value 0 act as false and the other ones as true,
        therefore have the same behavior of a boolean.
-     - Project-wide deviation; tagged as `deliberate` for ECLAIR.
+     - Tagged as `deliberate` for ECLAIR.
+
+   * - R14.4
+     - A controlling expression of 'if' and iteration statements having
+       integer, character or pointer type has a semantics that is well-known to
+       all Xen developers.
+     - Tagged as `deliberate` for ECLAIR.
 
    * - R16.2
      - Complying with the Rule would entail a lot of code duplication in the
-- 
2.34.1


