Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D5F788FD0C
	for <lists+xen-devel@lfdr.de>; Thu, 28 Mar 2024 11:30:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.698871.1091067 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rpn0x-0006na-UK; Thu, 28 Mar 2024 10:29:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 698871.1091067; Thu, 28 Mar 2024 10:29:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rpn0x-0006m2-RC; Thu, 28 Mar 2024 10:29:43 +0000
Received: by outflank-mailman (input) for mailman id 698871;
 Thu, 28 Mar 2024 10:29:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cj01=LC=bugseng.com=simone.ballarin@srs-se1.protection.inumbo.net>)
 id 1rpn0w-0006lq-5M
 for xen-devel@lists.xenproject.org; Thu, 28 Mar 2024 10:29:42 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 15acc906-ecee-11ee-afe3-a90da7624cb6;
 Thu, 28 Mar 2024 11:29:40 +0100 (CET)
Received: from beta.bugseng.com (unknown [176.206.12.122])
 by support.bugseng.com (Postfix) with ESMTPSA id 26E5B4EE073C;
 Thu, 28 Mar 2024 11:29:40 +0100 (CET)
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
X-Inumbo-ID: 15acc906-ecee-11ee-afe3-a90da7624cb6
From: Simone Ballarin <simone.ballarin@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com,
	Simone Ballarin <simone.ballarin@bugseng.com>,
	Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>
Subject: [XEN PATCH v3 1/2] MISRA C:2012 Rule 17.1 states: The features of `<stdarg.h>' shall not be used
Date: Thu, 28 Mar 2024 11:29:34 +0100
Message-Id: <b55dae384907d60d4524ab17a8135859ec0f5270.1711621080.git.simone.ballarin@bugseng.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1711621080.git.simone.ballarin@bugseng.com>
References: <cover.1711621080.git.simone.ballarin@bugseng.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Xen community wants to avoid using variadic functions except for
specific circumstances where it feels appropriate by strict code review.

Add deviation for printf()-like functions.

Signed-off-by: Simone Ballarin <simone.ballarin@bugseng.com>

---
Changes in v3:
- use regex to exempt all .*printk and .*printf functions, instead
  of manually listing them one by one.
Changes in v2:
- replace "console output related" with "printf()-like".
---
 automation/eclair_analysis/ECLAIR/deviations.ecl | 13 +++++++++++++
 docs/misra/deviations.rst                        |  5 +++++
 2 files changed, 18 insertions(+)

diff --git a/automation/eclair_analysis/ECLAIR/deviations.ecl b/automation/eclair_analysis/ECLAIR/deviations.ecl
index de9ba723fb..936c738caf 100644
--- a/automation/eclair_analysis/ECLAIR/deviations.ecl
+++ b/automation/eclair_analysis/ECLAIR/deviations.ecl
@@ -386,6 +386,19 @@ explicit comment indicating the fallthrough intention is present."
 -config=MC3R1.R16.6,switch_clauses+={deliberate, "default(0)"}
 -doc_end
 
+#
+# Series 17.
+#
+
+-doc_begin="printf()-like functions are allowed to use the variadic features provided by stdarg.h."
+-config=MC3R1.R17.1,reports+={deliberate,"any_area(^.*va_list.*$&&context(ancestor_or_self(^.*printk\(.*\)$)))"}
+-config=MC3R1.R17.1,reports+={deliberate,"any_area(^.*va_list.*$&&context(ancestor_or_self(^.*printf\(.*\)$)))"}
+-config=MC3R1.R17.1,reports+={deliberate,"any_area(^.*va_list.*$&&context(ancestor_or_self(name(panic)&&kind(function))))"}
+-config=MC3R1.R17.1,reports+={deliberate,"any_area(^.*va_list.*$&&context(ancestor_or_self(name(elf_call_log_callback)&&kind(function))))"}
+-config=MC3R1.R17.1,reports+={deliberate,"any_area(^.*va_list.*$&&context(ancestor_or_self(name(vprintk_common)&&kind(function))))"}
+-config=MC3R1.R17.1,macros+={hide , "^va_(arg|start|copy|end)$"}
+-doc_end
+
 #
 # Series 18.
 #
diff --git a/docs/misra/deviations.rst b/docs/misra/deviations.rst
index eb5ef2bd9d..dd254a9640 100644
--- a/docs/misra/deviations.rst
+++ b/docs/misra/deviations.rst
@@ -334,6 +334,11 @@ Deviations related to MISRA C:2012 Rules:
        improve readability.
      - Tagged as `deliberate` for ECLAIR.
 
+   * - R17.1
+     - printf()-like functions  are allowed to use the variadic features provided
+       by `stdarg.h`.
+     - Tagged as `deliberate` for ECLAIR.
+
    * - R20.4
      - The override of the keyword \"inline\" in xen/compiler.h is present so
        that section contents checks pass when the compiler chooses not to
-- 
2.34.1


