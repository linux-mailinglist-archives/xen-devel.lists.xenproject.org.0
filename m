Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F09690A8DB
	for <lists+xen-devel@lfdr.de>; Mon, 17 Jun 2024 10:57:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.741918.1148608 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sJ8B9-0005di-0k; Mon, 17 Jun 2024 08:57:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 741918.1148608; Mon, 17 Jun 2024 08:57:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sJ8B8-0005WY-Q7; Mon, 17 Jun 2024 08:57:30 +0000
Received: by outflank-mailman (input) for mailman id 741918;
 Mon, 17 Jun 2024 08:57:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UpZp=NT=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1sJ8B6-0005Fp-HW
 for xen-devel@lists.xenproject.org; Mon, 17 Jun 2024 08:57:28 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9e0686b7-2c87-11ef-90a3-e314d9c70b13;
 Mon, 17 Jun 2024 10:57:25 +0200 (CEST)
Received: from nico.bugseng.com (unknown [46.228.253.194])
 by support.bugseng.com (Postfix) with ESMTPSA id 08EF34EE0757;
 Mon, 17 Jun 2024 10:57:24 +0200 (CEST)
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
X-Inumbo-ID: 9e0686b7-2c87-11ef-90a3-e314d9c70b13
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org,
	michal.orzel@amd.com,
	xenia.ragiadakou@amd.com,
	ayan.kumar.halder@amd.com,
	consulting@bugseng.com,
	Nicola Vetrini <nicola.vetrini@bugseng.com>,
	Simone Ballarin <simone.ballarin@bugseng.com>,
	Doug Goldstein <cardoe@cardoe.com>
Subject: [XEN PATCH v2 1/6][RESEND] automation/eclair: address violations of MISRA C Rule 20.7
Date: Mon, 17 Jun 2024 10:57:13 +0200
Message-Id: <af4b0512eb52be99e37c9c670f98967ca15c68ac.1718378539.git.nicola.vetrini@bugseng.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1718378539.git.nicola.vetrini@bugseng.com>
References: <cover.1718378539.git.nicola.vetrini@bugseng.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

MISRA C Rule 20.7 states: "Expressions resulting from the expansion
of macro parameters shall be enclosed in parentheses".

The helper macro bitmap_switch has parameters that cannot be parenthesized
in order to comply with the rule, as that would break its functionality.
Moreover, the risk of misuse due developer confusion is deemed not
substantial enough to warrant a more involved refactor, thus the macro
is deviated for this rule.

No functional change.

Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
---
 automation/eclair_analysis/ECLAIR/deviations.ecl | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/automation/eclair_analysis/ECLAIR/deviations.ecl b/automation/eclair_analysis/ECLAIR/deviations.ecl
index 447c1e6661d1..c2698e7074aa 100644
--- a/automation/eclair_analysis/ECLAIR/deviations.ecl
+++ b/automation/eclair_analysis/ECLAIR/deviations.ecl
@@ -463,6 +463,14 @@ of this macro do not lead to developer confusion, and can thus be deviated."
 -config=MC3R1.R20.7,reports+={safe, "any_area(any_loc(any_exp(macro(^count_args_$))))"}
 -doc_end
 
+-doc_begin="The arguments of macro bitmap_switch macro can't be parenthesized as
+the rule would require, without breaking the functionality of the macro. This is
+a specialized local helper macro only used within the bitmap.h header, so it is
+less likely to lead to developer confusion and it is deemed better to deviate it."
+-file_tag+={xen_bitmap_h, "^xen/include/xen/bitmap\\.h$"}
+-config=MC3R1.R20.7,reports+={safe, "any_area(any_loc(any_exp(macro(loc(file(xen_bitmap_h))&&^bitmap_switch$))))"}
+-doc_end
+
 -doc_begin="Uses of variadic macros that have one of their arguments defined as
 a macro and used within the body for both ordinary parameter expansion and as an
 operand to the # or ## operators have a behavior that is well-understood and
-- 
2.34.1

