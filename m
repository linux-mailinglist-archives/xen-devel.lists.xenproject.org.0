Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AB738B0447
	for <lists+xen-devel@lfdr.de>; Wed, 24 Apr 2024 10:26:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.711259.1111093 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rzXwp-00064R-5Y; Wed, 24 Apr 2024 08:25:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 711259.1111093; Wed, 24 Apr 2024 08:25:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rzXwp-00062s-2p; Wed, 24 Apr 2024 08:25:47 +0000
Received: by outflank-mailman (input) for mailman id 711259;
 Wed, 24 Apr 2024 08:25:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=S7Hn=L5=bugseng.com=federico.serafini@srs-se1.protection.inumbo.net>)
 id 1rzXwn-00062m-Gl
 for xen-devel@lists.xenproject.org; Wed, 24 Apr 2024 08:25:45 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3dcfaf63-0214-11ef-b4bb-af5377834399;
 Wed, 24 Apr 2024 10:25:43 +0200 (CEST)
Received: from truciolo.homenet.telecomitalia.it
 (host-79-60-221-62.business.telecomitalia.it [79.60.221.62])
 by support.bugseng.com (Postfix) with ESMTPSA id 9FC4B4EE0739;
 Wed, 24 Apr 2024 10:25:42 +0200 (CEST)
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
X-Inumbo-ID: 3dcfaf63-0214-11ef-b4bb-af5377834399
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
Subject: [XEN PATCH v2] automation/eclair: add deviations for MISRA C:2012 Rule 16.4
Date: Wed, 24 Apr 2024 10:25:36 +0200
Message-Id: <310e1dac8ecf2a85f1c552dbdad9093b1cfdcb98.1713946892.git.federico.serafini@bugseng.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Update ECLAIR configuration to take into account the deviations
agreed during MISRA meetings for Rule 16.4.

Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
---
 automation/eclair_analysis/ECLAIR/deviations.ecl |  8 ++++++++
 docs/misra/deviations.rst                        | 13 +++++++++++++
 2 files changed, 21 insertions(+)

diff --git a/automation/eclair_analysis/ECLAIR/deviations.ecl b/automation/eclair_analysis/ECLAIR/deviations.ecl
index d21f112a9b..f09ad71acf 100644
--- a/automation/eclair_analysis/ECLAIR/deviations.ecl
+++ b/automation/eclair_analysis/ECLAIR/deviations.ecl
@@ -384,6 +384,14 @@ explicit comment indicating the fallthrough intention is present."
 -config=MC3R1.R16.3,reports+={safe, "any_area(end_loc(any_exp(text(^(?s).*/\\* [fF]all ?through.? \\*/.*$,0..1))))"}
 -doc_end
 
+-doc_begin="Switch statements having a controlling expression of enum type deliberately do not have a default case: gcc -Wall enables -Wswitch which warns (and breaks the build as we use -Werror) if one of the enum labels is missing from the switch."
+-config=MC3R1.R16.4,reports+={deliberate,'any_area(kind(context)&&^.* has no `default.*$&&stmt(node(switch_stmt)&&child(cond,skip(__non_syntactic_paren_stmts,type(canonical(enum_underlying_type(any())))))))'}
+-doc_end
+
+-doc_begin="A switch statement with a single switch clause and no default label may be used in place of an equivalent if statement if it is considered to improve readability."
+-config=MC3R1.R16.4,switch_clauses+={deliberate,"switch(1)&&default(0)"}
+-doc_end
+
 -doc_begin="A switch statement with a single switch clause and no default label may be used in place of an equivalent if statement if it is considered to improve readability."
 -config=MC3R1.R16.6,switch_clauses+={deliberate, "default(0)"}
 -doc_end
diff --git a/docs/misra/deviations.rst b/docs/misra/deviations.rst
index ed0c1e8ed0..39cc321a27 100644
--- a/docs/misra/deviations.rst
+++ b/docs/misra/deviations.rst
@@ -334,6 +334,19 @@ Deviations related to MISRA C:2012 Rules:
          - /\* Fallthrough \*/
          - /\* Fallthrough. \*/
 
+   * - R16.4
+     - Switch statements having a controlling expression of enum type
+       deliberately do not have a default case: gcc -Wall enables -Wswitch
+       which warns (and breaks the build as we use -Werror) if one of the enum
+       labels is missing from the switch.
+     - Tagged as `deliberate` for ECLAIR.
+
+   * - R16.4
+     - A switch statement with a single switch clause and no default label may
+       be used in place of an equivalent if statement if it is considered to
+       improve readability.
+     - Tagged as `deliberate` for ECLAIR.
+
    * - R16.6
      - A switch statement with a single switch clause and no default label may
        be used in place of an equivalent if statement if it is considered to
-- 
2.34.1


