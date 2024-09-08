Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 767A49707C7
	for <lists+xen-devel@lfdr.de>; Sun,  8 Sep 2024 15:29:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.792569.1202469 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1snHxX-0008H5-W4; Sun, 08 Sep 2024 13:28:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 792569.1202469; Sun, 08 Sep 2024 13:28:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1snHxX-0008EW-Sx; Sun, 08 Sep 2024 13:28:07 +0000
Received: by outflank-mailman (input) for mailman id 792569;
 Sun, 08 Sep 2024 13:28:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QfMe=QG=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1snHxW-0008EQ-Ut
 for xen-devel@lists.xenproject.org; Sun, 08 Sep 2024 13:28:07 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2cfca11b-6de6-11ef-a0b4-8be0dac302b0;
 Sun, 08 Sep 2024 15:28:05 +0200 (CEST)
Received: from nico.bugseng.com (unknown [46.228.253.214])
 by support.bugseng.com (Postfix) with ESMTPSA id 4F3644EE074D;
 Sun,  8 Sep 2024 15:28:01 +0200 (CEST)
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
X-Inumbo-ID: 2cfca11b-6de6-11ef-a0b4-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=bugseng.com; s=mail;
	t=1725802083; bh=5Gr9rdc3F6zX9bETFlIzyDdhSTLrhJwc5aFWP/EIt3E=;
	h=From:To:Cc:Subject:Date:From;
	b=cnoGPBv57xv6BOxqypqJdFc5GHE8MySvumu4MXI07xhAm+mciAdGmkJTCZbPJlasD
	 EqeUbUl8d1dUrI6LjZrhuxs1Ku/a4ywioemdqnGsmZ/CPtcQYDF+lKK1+5oB6YeWbe
	 SZpRbdt05AnEBwPC335oGJ/ko2FSNEfuvKzDIXjaX2Q0Of5N46nHdMxcKsIK3pmr+Q
	 rTy2NCHdMSYGEs/GP+1HGuXRjz0CiI8IQR8WQF1mUaDeXSKRb8Dvjrg5zYW8I6h98P
	 nOm6ZEAN+MyDRF5ZbMYl2ibvZidQ+89852GXEeQIp97yv7ea6FuSNeGyCu5oxGcHVP
	 BUEMFDRzcXjLg==
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org,
	michal.orzel@amd.com,
	xenia.ragiadakou@amd.com,
	ayan.kumar.halder@amd.com,
	consulting@bugseng.com,
	Nicola Vetrini <nicola.vetrini@bugseng.com>,
	Simone Ballarin <simone.ballarin@bugseng.com>,
	Doug Goldstein <cardoe@cardoe.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>
Subject: [XEN PATCH] automation/eclair_analysis: fix MISRA Rule 20.7 regression in self-tests.h
Date: Sun,  8 Sep 2024 15:27:57 +0200
Message-ID: <4e59a8b7d97f34a824922013ffe5e44f70e6abaf.1725801931.git.nicola.vetrini@bugseng.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Prior to bd1664db7b7d ("xen/bitops: Introduce a multiple_bits_set() helper")
the definition of {COMPILE,RUNTIME}_CHECK was fully compliant with respect
to MISRA C Rule 20.7:

"Expressions resulting from the expansion of macro parameters shall be
enclosed in parentheses."

However, to allow testing function-like macros, parentheses on the "fn"
parameter were removed and thus new violations of the rule have been
introduced. Given the usefulness of this functionality,
it is deemed ok to deviate these two macros for this rule, because
their scope of (direct) usage is limited to just the file where they
are defined, and the possibility of misuses is unlikely.

No functional change.

Fixes: bd1664db7b7d ("xen/bitops: Introduce a multiple_bits_set() helper")
Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
---
 automation/eclair_analysis/ECLAIR/deviations.ecl | 6 ++++++
 docs/misra/deviations.rst                        | 8 ++++++++
 2 files changed, 14 insertions(+)

diff --git a/automation/eclair_analysis/ECLAIR/deviations.ecl b/automation/eclair_analysis/ECLAIR/deviations.ecl
index 9051f4160282..ed80ac795851 100644
--- a/automation/eclair_analysis/ECLAIR/deviations.ecl
+++ b/automation/eclair_analysis/ECLAIR/deviations.ecl
@@ -581,6 +581,12 @@ of this macro do not lead to developer confusion, and can thus be deviated."
 -config=MC3R1.R20.7,reports+={safe, "any_area(any_loc(any_exp(macro(^count_args_$))))"}
 -doc_end

+-doc_begin="The argument \"fn\" in macros {COMPILE,RUNTIME}_CHECK is not parenthesized
+on purpose, to be able to test function-like macros. Given the specialized and limited
+use of this macro, it is deemed ok to deviate them."
+-config=MC3R1.R20.7,reports+={deliberate, "any_area(any_loc(any_exp(macro(^(COMPILE_CHECK|RUNTIME_CHECK)$))))"}
+-doc_end
+
 -doc_begin="Uses of variadic macros that have one of their arguments defined as
 a macro and used within the body for both ordinary parameter expansion and as an
 operand to the # or ## operators have a behavior that is well-understood and
diff --git a/docs/misra/deviations.rst b/docs/misra/deviations.rst
index b66c271c4e7c..b020144a3254 100644
--- a/docs/misra/deviations.rst
+++ b/docs/misra/deviations.rst
@@ -533,6 +533,14 @@ Deviations related to MISRA C:2012 Rules:
        to incur in the risk of being misused or lead to developer confusion, and
        refactoring it to add parentheses breaks its functionality.
      - Tagged as `safe` for ECLAIR.
+
+   * - R20.7
+     - The macros `{COMPILE,RUNTIME}_CHECK` defined in
+       `xen/include/xen/self-tests.h` are allowed not to parenthesize their
+       arguments, to allow function-like macros to be tested as well as
+       functions. Given the specialized use of these macros and their limited
+       usage scope, omitting parentheses is deemed unlikely to cause issues.
+     - Tagged as `deliberate` for ECLAIR.

    * - R20.12
      - Variadic macros that use token pasting often employ the gcc extension
--
2.43.0

