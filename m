Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 33707880DCD
	for <lists+xen-devel@lfdr.de>; Wed, 20 Mar 2024 09:52:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.695799.1085912 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rmrgC-0002Pc-Hk; Wed, 20 Mar 2024 08:52:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 695799.1085912; Wed, 20 Mar 2024 08:52:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rmrgC-0002NV-De; Wed, 20 Mar 2024 08:52:12 +0000
Received: by outflank-mailman (input) for mailman id 695799;
 Wed, 20 Mar 2024 08:52:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=eqSt=K2=bugseng.com=simone.ballarin@srs-se1.protection.inumbo.net>)
 id 1rmrgA-000214-CK
 for xen-devel@lists.xenproject.org; Wed, 20 Mar 2024 08:52:10 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 22590b3f-e697-11ee-a1ee-f123f15fe8a2;
 Wed, 20 Mar 2024 09:52:08 +0100 (CET)
Received: from beta.station (net-93-144-106-196.cust.dsl.teletu.it
 [93.144.106.196])
 by support.bugseng.com (Postfix) with ESMTPSA id 0EC5A4EE073F;
 Wed, 20 Mar 2024 09:52:08 +0100 (CET)
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
X-Inumbo-ID: 22590b3f-e697-11ee-a1ee-f123f15fe8a2
From: Simone Ballarin <simone.ballarin@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com,
	sstabellini@kernel.com,
	Simone Ballarin <simone.ballarin@bugseng.com>,
	Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Wei Liu <wl@xen.org>
Subject: [XEN PATCH 1/2] automation/eclair: add deviation for MISRA C:2012 Rule 17.1
Date: Wed, 20 Mar 2024 09:50:59 +0100
Message-Id: <882b442c8c1f73f8116676ab9351defe5c9609ac.1710923235.git.simone.ballarin@bugseng.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1710923235.git.simone.ballarin@bugseng.com>
References: <cover.1710923235.git.simone.ballarin@bugseng.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

MISRA C:2012 Rule 17.1 states:
The features of `<stdarg.h>' shall not be used

The Xen community wants to avoid using variadic functions except for
specific circumstances where it feels appropriate by strict code review.

Add deviation for functions related to console output (printk and similar).

Signed-off-by: Simone Ballarin <simone.ballarin@bugseng.com>
---
 .../eclair_analysis/ECLAIR/deviations.ecl     | 26 +++++++++++++++++++
 docs/misra/deviations.rst                     |  5 ++++
 2 files changed, 31 insertions(+)

diff --git a/automation/eclair_analysis/ECLAIR/deviations.ecl b/automation/eclair_analysis/ECLAIR/deviations.ecl
index 9ac3ee4dfd..7c3559a3a0 100644
--- a/automation/eclair_analysis/ECLAIR/deviations.ecl
+++ b/automation/eclair_analysis/ECLAIR/deviations.ecl
@@ -382,6 +382,32 @@ explicit comment indicating the fallthrough intention is present."
 -config=MC3R1.R16.6,switch_clauses+={deliberate, "default(0)"}
 -doc_end
 
+#
+# Series 17.
+#
+
+-doc_begin="Functions related to console output are allowed to use the variadic features provided by stdarg.h."
+-config=MC3R1.R17.1,reports+={deliberate,"any_area(^.*va_list.*$&&context(ancestor_or_self(name(debugtrace_printk)&&kind(function))))"}
+-config=MC3R1.R17.1,reports+={deliberate,"any_area(^.*va_list.*$&&context(ancestor_or_self(name(dt_dprintk)&&kind(function))))"}
+-config=MC3R1.R17.1,reports+={deliberate,"any_area(^.*va_list.*$&&context(ancestor_or_self(name(printk)&&kind(function))))"}
+-config=MC3R1.R17.1,reports+={deliberate,"any_area(^.*va_list.*$&&context(ancestor_or_self(name(guest_printk)&&kind(function))))"}
+-config=MC3R1.R17.1,reports+={deliberate,"any_area(^.*va_list.*$&&context(ancestor_or_self(name(panic)&&kind(function))))"}
+-config=MC3R1.R17.1,reports+={deliberate,"any_area(^.*va_list.*$&&context(ancestor_or_self(name(dprintk)&&kind(function))))"}
+-config=MC3R1.R17.1,reports+={deliberate,"any_area(^.*va_list.*$&&context(ancestor_or_self(name(gdprintk)&&kind(function))))"}
+-config=MC3R1.R17.1,reports+={deliberate,"any_area(^.*va_list.*$&&context(ancestor_or_self(name(snprintf)&&kind(function))))"}
+-config=MC3R1.R17.1,reports+={deliberate,"any_area(^.*va_list.*$&&context(ancestor_or_self(name(scnprintf)&&kind(function))))"}
+-config=MC3R1.R17.1,reports+={deliberate,"any_area(^.*va_list.*$&&context(ancestor_or_self(name(xasprintf)&&kind(function))))"}
+-config=MC3R1.R17.1,reports+={deliberate,"any_area(^.*va_list.*$&&context(ancestor_or_self(name(mm_printk)&&kind(function))))"}
+-config=MC3R1.R17.1,reports+={deliberate,"any_area(^.*va_list.*$&&context(ancestor_or_self(name(dbgp_printk)&&kind(function))))"}
+-config=MC3R1.R17.1,reports+={deliberate,"any_area(^.*va_list.*$&&context(ancestor_or_self(name(elf_call_log_callback)&&kind(function))))"}
+-config=MC3R1.R17.1,reports+={deliberate,"any_area(^.*va_list.*$&&context(ancestor_or_self(name(vsnprintf)&&kind(function))))"}
+-config=MC3R1.R17.1,reports+={deliberate,"any_area(^.*va_list.*$&&context(ancestor_or_self(name(vscnprintf)&&kind(function))))"}
+-config=MC3R1.R17.1,reports+={deliberate,"any_area(^.*va_list.*$&&context(ancestor_or_self(name(xvasprintf)&&kind(function))))"}
+-config=MC3R1.R17.1,reports+={deliberate,"any_area(^.*va_list.*$&&context(ancestor_or_self(name(vprintk_common)&&kind(function))))"}
+-config=MC3R1.R17.1,reports+={deliberate,"any_area(^.*va_list.*$&&context(ancestor_or_self(name(guest_printk)&&kind(function))))"}
+-config=MC3R1.R17.1,macros+={hide , "^va_(arg|start|copy|end)$"}
+-doc_end
+
 #
 # Series 18.
 #
diff --git a/docs/misra/deviations.rst b/docs/misra/deviations.rst
index ce855ddae6..fa649a2024 100644
--- a/docs/misra/deviations.rst
+++ b/docs/misra/deviations.rst
@@ -328,6 +328,11 @@ Deviations related to MISRA C:2012 Rules:
        improve readability.
      - Tagged as `deliberate` for ECLAIR.
 
+   * - R17.1
+     - Functions related to console output are allowed to use the variadic
+       features provided by `stdarg.h`.
+     - Tagged as `deliberate` for ECLAIR.
+
    * - R20.7
      - Code violating Rule 20.7 is safe when macro parameters are used:
        (1) as function arguments;
-- 
2.34.1


