Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EA168989EB
	for <lists+xen-devel@lfdr.de>; Thu,  4 Apr 2024 16:21:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.700921.1094744 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rsNy5-00053g-3c; Thu, 04 Apr 2024 14:21:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 700921.1094744; Thu, 04 Apr 2024 14:21:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rsNy5-00051R-0s; Thu, 04 Apr 2024 14:21:29 +0000
Received: by outflank-mailman (input) for mailman id 700921;
 Thu, 04 Apr 2024 14:21:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WQJu=LJ=bugseng.com=federico.serafini@srs-se1.protection.inumbo.net>)
 id 1rsNy3-00051I-E4
 for xen-devel@lists.xenproject.org; Thu, 04 Apr 2024 14:21:27 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9e8cd25d-f28e-11ee-afe5-a90da7624cb6;
 Thu, 04 Apr 2024 16:21:25 +0200 (CEST)
Received: from truciolo.homenet.telecomitalia.it
 (host-82-59-164-46.retail.telecomitalia.it [82.59.164.46])
 by support.bugseng.com (Postfix) with ESMTPSA id B447A4EE073C;
 Thu,  4 Apr 2024 16:21:24 +0200 (CEST)
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
X-Inumbo-ID: 9e8cd25d-f28e-11ee-afe5-a90da7624cb6
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
Subject: [XEN PATCH] automaton/eclair: add deviations for MISRA C:2012 Rule 13.6
Date: Thu,  4 Apr 2024 16:21:10 +0200
Message-Id: <cca71f954bec4efc14b98e3ad991581441d593d7.1712238975.git.federico.serafini@bugseng.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Update ECLAIR configuration to deviate uses of chk_fld and
alternative_vcall[0-9] macros.

Suggested-by: Stefano Stabellini <sstabellini@kernel.org>
Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
---
 automation/eclair_analysis/ECLAIR/deviations.ecl |  8 ++++++++
 docs/misra/deviations.rst                        | 12 ++++++++++++
 2 files changed, 20 insertions(+)

diff --git a/automation/eclair_analysis/ECLAIR/deviations.ecl b/automation/eclair_analysis/ECLAIR/deviations.ecl
index de9ba723fb..eebe779000 100644
--- a/automation/eclair_analysis/ECLAIR/deviations.ecl
+++ b/automation/eclair_analysis/ECLAIR/deviations.ecl
@@ -333,6 +333,14 @@ of the short-circuit evaluation strategy of such logical operators."
 -config=MC3R1.R13.5,reports+={disapplied,"any()"}
 -doc_end
 
+-doc_begin="Macros alternative_vcall[0-9] use sizeof to type-check \"func\" and the func parameters without evaluating them."
+-config=MC3R1.R13.6,reports+={deliberate,"any_area(any_loc(any_exp(macro(^alternative_vcall[0-9]$))))"}
+-doc_end
+
+-doc_begin="Macro chk_fld is only used to introduce BUILD_BUG_ON checks in very specific cases where by code inspection you can see that its usage is correct. The BUILD_BUG_ON checks check that EFI_TIME and struct xenpf_efi_time fields match."
+-config=MC3R1.R13.6,reports+={deliberate,"any_area(any_loc(any_exp(macro(^chk_fld$))))"}
+-doc_end
+
 #
 # Series 14
 #
diff --git a/docs/misra/deviations.rst b/docs/misra/deviations.rst
index eb5ef2bd9d..a97c31d18f 100644
--- a/docs/misra/deviations.rst
+++ b/docs/misra/deviations.rst
@@ -279,6 +279,18 @@ Deviations related to MISRA C:2012 Rules:
        the short-circuit evaluation strategy for logical operators.
      - Project-wide deviation; tagged as `disapplied` for ECLAIR.
 
+   * - R13.6
+     - Macros alternative_vcall[0-9] use sizeof to type-check \"func\" and the
+       func parameters without evaluating them.
+     - Tagged as `deliberate` for ECLAIR.
+
+   * - R13.6
+     - Macro chk_fld is only used to introduce BUILD_BUG_ON checks in very
+       specific cases where by code inspection you can see that its usage is
+       correct. The BUILD_BUG_ON checks check that EFI_TIME and
+       struct xenpf_efi_time fields match.
+     - Tagged as `deliberate` for ECLAIR.
+
    * - R14.2
      - The severe restrictions imposed by this rule on the use of 'for'
        statements are not counterbalanced by the presumed facilitation of the
-- 
2.34.1


