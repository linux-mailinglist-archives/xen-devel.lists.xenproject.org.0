Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AE8A091074E
	for <lists+xen-devel@lfdr.de>; Thu, 20 Jun 2024 16:02:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.744609.1151686 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sKIN3-00086S-1Y; Thu, 20 Jun 2024 14:02:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 744609.1151686; Thu, 20 Jun 2024 14:02:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sKIN2-00083n-U6; Thu, 20 Jun 2024 14:02:36 +0000
Received: by outflank-mailman (input) for mailman id 744609;
 Thu, 20 Jun 2024 14:02:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fPla=NW=bugseng.com=federico.serafini@srs-se1.protection.inumbo.net>)
 id 1sKIN1-0007p2-2p
 for xen-devel@lists.xenproject.org; Thu, 20 Jun 2024 14:02:35 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bda636d8-2f0d-11ef-90a3-e314d9c70b13;
 Thu, 20 Jun 2024 16:02:33 +0200 (CEST)
Received: from truciolo.bugseng.com (unknown [78.208.165.219])
 by support.bugseng.com (Postfix) with ESMTPSA id 7F0E14EE0755;
 Thu, 20 Jun 2024 16:02:32 +0200 (CEST)
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
X-Inumbo-ID: bda636d8-2f0d-11ef-90a3-e314d9c70b13
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
Subject: [XEN PATCH 01/13] automation/eclair: consider also hypened fall-through
Date: Thu, 20 Jun 2024 16:02:12 +0200
Message-Id: <10af9145252a2f5c31ea0f13cbb67cbe76a8ba3a.1718892030.git.federico.serafini@bugseng.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1718892030.git.federico.serafini@bugseng.com>
References: <cover.1718892030.git.federico.serafini@bugseng.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Update ECLAIR configuration to deviate MISRA C Rule 16.3
using different version of hypened fall-through and search for
the comment for 2 lines after the last statement.

Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
---
 automation/eclair_analysis/ECLAIR/deviations.ecl | 2 +-
 docs/misra/deviations.rst                        | 4 ++++
 2 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/automation/eclair_analysis/ECLAIR/deviations.ecl b/automation/eclair_analysis/ECLAIR/deviations.ecl
index b8f9155267..b99a6b8a92 100644
--- a/automation/eclair_analysis/ECLAIR/deviations.ecl
+++ b/automation/eclair_analysis/ECLAIR/deviations.ecl
@@ -400,7 +400,7 @@ safe."
 -doc_end
 
 -doc_begin="Switch clauses ending with an explicit comment indicating the fallthrough intention are safe."
--config=MC3R1.R16.3,reports+={safe, "any_area(end_loc(any_exp(text(^(?s).*/\\* [fF]all ?through.? \\*/.*$,0..1))))"}
+-config=MC3R1.R16.3,reports+={safe, "any_area(end_loc(any_exp(text(^(?s).*/\\* [fF]all[ -]?through.? \\*/.*$,0..2))))"}
 -doc_end
 
 -doc_begin="Switch statements having a controlling expression of enum type deliberately do not have a default case: gcc -Wall enables -Wswitch which warns (and breaks the build as we use -Werror) if one of the enum labels is missing from the switch."
diff --git a/docs/misra/deviations.rst b/docs/misra/deviations.rst
index 41cdfbe5f5..411e1fed3d 100644
--- a/docs/misra/deviations.rst
+++ b/docs/misra/deviations.rst
@@ -353,6 +353,10 @@ Deviations related to MISRA C:2012 Rules:
        However, the use of such comments in new code is deprecated:
        the pseudo-keyword "fallthrough" shall be used.
      - Tagged as `safe` for ECLAIR. The accepted comments are:
+         - /\* fall-through \*/
+         - /\* Fall-through. \*/
+         - /\* Fall-through \*/
+         - /\* fall-through. \*/
          - /\* fall through \*/
          - /\* fall through. \*/
          - /\* fallthrough \*/
-- 
2.34.1


