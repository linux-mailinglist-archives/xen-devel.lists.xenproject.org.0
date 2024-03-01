Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 335BE86E3F7
	for <lists+xen-devel@lfdr.de>; Fri,  1 Mar 2024 16:04:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.687720.1071478 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rg4Qy-0008Gq-QI; Fri, 01 Mar 2024 15:04:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 687720.1071478; Fri, 01 Mar 2024 15:04:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rg4Qy-0008EQ-Nl; Fri, 01 Mar 2024 15:04:24 +0000
Received: by outflank-mailman (input) for mailman id 687720;
 Fri, 01 Mar 2024 15:04:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=W3Zh=KH=bugseng.com=federico.serafini@srs-se1.protection.inumbo.net>)
 id 1rg4Qx-0008EK-OS
 for xen-devel@lists.xenproject.org; Fri, 01 Mar 2024 15:04:23 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fbe8bbf0-d7dc-11ee-a1ee-f123f15fe8a2;
 Fri, 01 Mar 2024 16:04:21 +0100 (CET)
Received: from Dell.bugseng.com (unknown [78.208.221.10])
 by support.bugseng.com (Postfix) with ESMTPSA id 153D14EE0737;
 Fri,  1 Mar 2024 16:04:20 +0100 (CET)
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
X-Inumbo-ID: fbe8bbf0-d7dc-11ee-a1ee-f123f15fe8a2
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
Subject: [XEN PATCH] automation/eclair: add deviation for MISRA C:2012 Rule 16.6
Date: Fri,  1 Mar 2024 16:04:12 +0100
Message-Id: <a9027b582d7866a31d7438d083499c53a3245989.1709305397.git.federico.serafini@bugseng.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Update ECLAIR configuration to take into account the deviations
agreed during MISRA meetings.

Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
---
 automation/eclair_analysis/ECLAIR/deviations.ecl | 4 ++++
 docs/misra/deviations.rst                        | 6 ++++++
 2 files changed, 10 insertions(+)

diff --git a/automation/eclair_analysis/ECLAIR/deviations.ecl b/automation/eclair_analysis/ECLAIR/deviations.ecl
index 02eae39786..0e62a7029f 100644
--- a/automation/eclair_analysis/ECLAIR/deviations.ecl
+++ b/automation/eclair_analysis/ECLAIR/deviations.ecl
@@ -378,6 +378,10 @@ explicit comment indicating the fallthrough intention is present."
 -config=MC3R1.R16.3,reports+={safe, "any_area(end_loc(any_exp(text(^(?s).*/\\* [fF]all ?through.? \\*/.*$,0..1))))"}
 -doc_end
 
+-doc_begin="A switch statement with a single switch clause and no default label is deliberate and improves readability with respect to an equivalent if statement."
+-config=MC3R1.R16.6,switch_clauses+={deliberate, "default(0)"}
+-doc_end
+
 #
 # Series 18.
 #
diff --git a/docs/misra/deviations.rst b/docs/misra/deviations.rst
index 123c78e20a..041f8db4ee 100644
--- a/docs/misra/deviations.rst
+++ b/docs/misra/deviations.rst
@@ -322,6 +322,12 @@ Deviations related to MISRA C:2012 Rules:
          - /\* Fallthrough \*/
          - /\* Fallthrough. \*/
 
+   * - R16.6
+     - A switch statement with a single switch clause and no default label is
+       deliberate and improves readability with respect to an equivalent if
+       statement.
+     - Tagged as `deliberate` for ECLAIR.
+
    * - R20.7
      - Code violating Rule 20.7 is safe when macro parameters are used:
        (1) as function arguments;
-- 
2.34.1


