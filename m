Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 04EC48AEA55
	for <lists+xen-devel@lfdr.de>; Tue, 23 Apr 2024 17:13:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.710791.1110272 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rzHpb-0005pz-3U; Tue, 23 Apr 2024 15:13:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 710791.1110272; Tue, 23 Apr 2024 15:13:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rzHpa-0005mq-U5; Tue, 23 Apr 2024 15:13:14 +0000
Received: by outflank-mailman (input) for mailman id 710791;
 Tue, 23 Apr 2024 15:13:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=r5BF=L4=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1rzHpY-0003wh-IB
 for xen-devel@lists.xenproject.org; Tue, 23 Apr 2024 15:13:12 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ff489b4c-0183-11ef-b4bb-af5377834399;
 Tue, 23 Apr 2024 17:13:10 +0200 (CEST)
Received: from nico.bugseng.com.homenet.telecomitalia.it
 (host-79-60-221-62.business.telecomitalia.it [79.60.221.62])
 by support.bugseng.com (Postfix) with ESMTPSA id 9A8144EE073E;
 Tue, 23 Apr 2024 17:13:07 +0200 (CEST)
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
X-Inumbo-ID: ff489b4c-0183-11ef-b4bb-af5377834399
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: xen-devel@lists.xenproject.org,
	nicola.vetrini@bugseng.com
Cc: sstabellini@kernel.org,
	michal.orzel@amd.com,
	xenia.ragiadakou@amd.com,
	ayan.kumar.halder@amd.com,
	consulting@bugseng.com,
	bertrand.marquis@arm.com,
	julien@xen.org,
	Simone Ballarin <simone.ballarin@bugseng.com>,
	Doug Goldstein <cardoe@cardoe.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>
Subject: [XEN PATCH 03/10] automation/eclair_analysis: deviate macro count_args_ for MISRA Rule 20.7
Date: Tue, 23 Apr 2024 17:12:45 +0200
Message-Id: <7de407c218f0911e28b7c3f609a55636165166a8.1713885065.git.nicola.vetrini@bugseng.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1713885065.git.nicola.vetrini@bugseng.com>
References: <cover.1713885065.git.nicola.vetrini@bugseng.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The count_args_ macro violates Rule 20.7, but it can't be made
compliant with Rule 20.7 without breaking its functionality. Since
it's very unlikely for this macro to be misused, it is deviated.

No functional change.

Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
---
 automation/eclair_analysis/ECLAIR/deviations.ecl | 6 ++++++
 docs/misra/deviations.rst                        | 6 ++++++
 2 files changed, 12 insertions(+)

diff --git a/automation/eclair_analysis/ECLAIR/deviations.ecl b/automation/eclair_analysis/ECLAIR/deviations.ecl
index d21f112a9b94..c17e2f5a0886 100644
--- a/automation/eclair_analysis/ECLAIR/deviations.ecl
+++ b/automation/eclair_analysis/ECLAIR/deviations.ecl
@@ -445,6 +445,12 @@ not to parenthesize their arguments."
 -config=MC3R1.R20.7,reports+={safe, "any_area(any_loc(any_exp(macro(^alternative_(v)?call[0-9]$))))"}
 -doc_end
 
+-doc_begin="The argument 'x' of the count_args_ macro can't be parenthesized as
+the rule would require, without breaking the functionality of the macro. The uses
+of this macro do not lead to developer confusion, and can thus be deviated."
+-config=MC3R1.R20.7,reports+={safe, "any_area(any_loc(any_exp(macro(^count_args_$))))"}
+-doc_end
+
 -doc_begin="Uses of variadic macros that have one of their arguments defined as
 a macro and used within the body for both ordinary parameter expansion and as an
 operand to the # or ## operators have a behavior that is well-understood and
diff --git a/docs/misra/deviations.rst b/docs/misra/deviations.rst
index ed0c1e8ed0bf..e228ae2e715f 100644
--- a/docs/misra/deviations.rst
+++ b/docs/misra/deviations.rst
@@ -371,6 +371,12 @@ Deviations related to MISRA C:2012 Rules:
        sanity checks in place.
      - Tagged as `safe` for ECLAIR.
 
+   * - R20.7
+     - The macro `count_args_` is not compliant with the rule, but is not likely
+       to incur in the risk of being misused or lead to developer confusion, and
+       refactoring it to add parentheses breaks its functionality.
+     - Tagged as `safe` for ECLAIR.
+
    * - R20.12
      - Variadic macros that use token pasting often employ the gcc extension
        `ext_paste_comma`, as detailed in `C-language-toolchain.rst`, which is
-- 
2.34.1


