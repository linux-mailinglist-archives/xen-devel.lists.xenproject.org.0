Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C99A186AA7B
	for <lists+xen-devel@lfdr.de>; Wed, 28 Feb 2024 09:53:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.686421.1068416 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rfFgu-0002kS-8z; Wed, 28 Feb 2024 08:53:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 686421.1068416; Wed, 28 Feb 2024 08:53:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rfFgu-0002iX-5J; Wed, 28 Feb 2024 08:53:28 +0000
Received: by outflank-mailman (input) for mailman id 686421;
 Wed, 28 Feb 2024 08:53:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QaFI=KF=bugseng.com=federico.serafini@srs-se1.protection.inumbo.net>)
 id 1rfFgs-0002iR-KM
 for xen-devel@lists.xenproject.org; Wed, 28 Feb 2024 08:53:26 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d50fc090-d616-11ee-afd7-a90da7624cb6;
 Wed, 28 Feb 2024 09:53:25 +0100 (CET)
Received: from Dell.bugseng.com (unknown [37.163.36.84])
 by support.bugseng.com (Postfix) with ESMTPSA id 2019A4EE0737;
 Wed, 28 Feb 2024 09:53:23 +0100 (CET)
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
X-Inumbo-ID: d50fc090-d616-11ee-afd7-a90da7624cb6
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
Subject: [XEN PATCH] automation/eclair: extend deviations of MISRA C:2012 Rule 16.3
Date: Wed, 28 Feb 2024 09:53:12 +0100
Message-Id: <6c96f889ae3fbdf516f0edfe4a5fb207540b6862.1709109662.git.federico.serafini@bugseng.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Update ECLAIR configuration to deviate more cases where an
unintentional fallthrough cannot happen.

Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
---
 .../eclair_analysis/ECLAIR/deviations.ecl     | 15 +++++++++++++--
 docs/misra/deviations.rst                     | 19 ++++++++++++++++++-
 2 files changed, 31 insertions(+), 3 deletions(-)

diff --git a/automation/eclair_analysis/ECLAIR/deviations.ecl b/automation/eclair_analysis/ECLAIR/deviations.ecl
index fd32ff8a9c..28ce251dc1 100644
--- a/automation/eclair_analysis/ECLAIR/deviations.ecl
+++ b/automation/eclair_analysis/ECLAIR/deviations.ecl
@@ -349,11 +349,14 @@ therefore have the same behavior of a boolean"
 # Series 16.
 #
 
--doc_begin="Switch clauses ending with continue, goto, return statements are
-safe."
+-doc_begin="Switch clauses ending with an unconditional flow control statement (i.e. continue, goto or return) are safe."
 -config=MC3R1.R16.3,terminals+={safe, "node(continue_stmt||goto_stmt||return_stmt)"}
 -doc_end
 
+-doc_begin="Switch clauses ending with an if-else statement are safe if both branches consist of a flow control statement (i.e., break, continue, goto, return)."
+-config=MC3R1.R16.3,terminals+={safe, "node(if_stmt)&&child(then,node(break_stmt||continue_stmt||goto_stmt||return_stmt))&&child(else,node(break_stmt||continue_stmt||goto_stmt||return_stmt))"}
+-doc_end
+
 -doc_begin="Switch clauses ending with a call to a function that does not give
 the control back (i.e., a function with attribute noreturn) are safe."
 -config=MC3R1.R16.3,terminals+={safe, "call(property(noreturn))"}
@@ -368,6 +371,14 @@ safe."
 -config=MC3R1.R16.3,reports+={safe, "any_area(end_loc(any_exp(text(/BUG\\(\\);/))))"}
 -doc_end
 
+-doc_begin="On X86, switch clauses ending generating an exception through \"generate_exception()\" are safe."
+-config=MC3R1.R16.3,reports+={safe, "any_area(any_loc(file(^xen/arch/x86/.*$)&&any_exp(text(/generate_exception(.*?)/))))"}
+-doc_end
+
+-doc_begin="Switch clauses ending generating a parse error through \"PARSE_ERR_RET()\" are safe."
+-config=MC3R1.R16.3,reports+={safe, "any_area(any_loc(any_exp(text(/PARSE_ERR_RET(.*?)/))))"}
+-doc_end
+
 -doc_begin="Switch clauses not ending with the break statement are safe if an
 explicit comment indicating the fallthrough intention is present."
 -config=MC3R1.R16.3,reports+={safe, "any_area(end_loc(any_exp(text(^(?s).*/\\* [fF]all ?through.? \\*/.*$,0..1))))"}
diff --git a/docs/misra/deviations.rst b/docs/misra/deviations.rst
index 123c78e20a..dbff17f493 100644
--- a/docs/misra/deviations.rst
+++ b/docs/misra/deviations.rst
@@ -291,7 +291,14 @@ Deviations related to MISRA C:2012 Rules:
      - Project-wide deviation; tagged as `deliberate` for ECLAIR.
 
    * - R16.3
-     - Switch clauses ending with continue, goto, return statements are safe.
+     - Switch clauses ending with an unconditional flow control statement
+       (i.e., continue, goto, or return) are safe.
+     - Tagged as `safe` for ECLAIR.
+
+   * - R16.3
+     - Switch clauses ending with an if-else statement are safe if both
+       branches consist of a flow control statement (i.e., continue, break,
+       goto, return).
      - Tagged as `safe` for ECLAIR.
 
    * - R16.3
@@ -307,6 +314,16 @@ Deviations related to MISRA C:2012 Rules:
      - Switch clauses ending with failure method \"BUG()\" are safe.
      - Tagged as `safe` for ECLAIR.
 
+   * - R16.3
+     - On X86, switch clauses ending generating an exception through
+       \"generate_exception()\" are safe.
+     - Tagged as `safe` for ECLAIR.
+
+   * - R16.3
+     - Switch clauses ending generating a parse error through
+       \"PARSE_ERR_RET()\" are safe.
+     - Tagged as `safe` for ECLAIR.
+
    * - R16.3
      - Existing switch clauses not ending with the break statement are safe if
        an explicit comment indicating the fallthrough intention is present.
-- 
2.34.1


