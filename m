Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DC8B57D99F9
	for <lists+xen-devel@lfdr.de>; Fri, 27 Oct 2023 15:34:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.624383.972941 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qwMyn-0001L8-0o; Fri, 27 Oct 2023 13:34:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 624383.972941; Fri, 27 Oct 2023 13:34:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qwMym-0001Hn-RW; Fri, 27 Oct 2023 13:34:24 +0000
Received: by outflank-mailman (input) for mailman id 624383;
 Fri, 27 Oct 2023 13:34:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bjPi=GJ=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1qwMyk-0000bA-Lr
 for xen-devel@lists.xenproject.org; Fri, 27 Oct 2023 13:34:22 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 883c68a9-74cd-11ee-9b0e-b553b5be7939;
 Fri, 27 Oct 2023 15:34:19 +0200 (CEST)
Received: from nico.bugseng.com (unknown [147.123.100.131])
 by support.bugseng.com (Postfix) with ESMTPSA id E4EE44EE074E;
 Fri, 27 Oct 2023 15:34:18 +0200 (CEST)
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
X-Inumbo-ID: 883c68a9-74cd-11ee-9b0e-b553b5be7939
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org,
	michal.orzel@amd.com,
	xenia.ragiadakou@amd.com,
	ayan.kumar.halder@amd.com,
	consulting@bugseng.com,
	jbeulich@suse.com,
	andrew.cooper3@citrix.com,
	roger.pau@citrix.com,
	Nicola Vetrini <nicola.vetrini@bugseng.com>,
	Simone Ballarin <simone.ballarin@bugseng.com>,
	Doug Goldstein <cardoe@cardoe.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>,
	Wei Liu <wl@xen.org>
Subject: [XEN PATCH][for-4.19 v4 1/8] xen/include: add macro ISOLATE_LOW_BIT
Date: Fri, 27 Oct 2023 15:34:08 +0200
Message-Id: <dca236bf9199f596bafb35eb48d81adc280d8cca.1698410970.git.nicola.vetrini@bugseng.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1698410970.git.nicola.vetrini@bugseng.com>
References: <cover.1698410970.git.nicola.vetrini@bugseng.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The purpose of this macro is to encapsulate the well-known expression
'x & -x' that in 2's complement architectures on unsigned integers will
give a mask where only the least significant nonzero bit of 'x' is set,
or 0 if none are set.

A deviation for ECLAIR is also introduced.

Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
---
Changes in v2:
- rename to LOWEST_BIT
Changes in v3:
- entry for deviations.rst
- comment on the macro defn
Changes in v4:
- Change the macro's name to ISOLATE_LOW_BIT
---
 automation/eclair_analysis/ECLAIR/deviations.ecl |  7 +++++++
 docs/misra/deviations.rst                        |  8 ++++++++
 xen/include/xen/macros.h                         | 10 ++++++++--
 3 files changed, 23 insertions(+), 2 deletions(-)

diff --git a/automation/eclair_analysis/ECLAIR/deviations.ecl b/automation/eclair_analysis/ECLAIR/deviations.ecl
index fa56e5c00a27..139dabc8477f 100644
--- a/automation/eclair_analysis/ECLAIR/deviations.ecl
+++ b/automation/eclair_analysis/ECLAIR/deviations.ecl
@@ -246,6 +246,13 @@ constant expressions are required.\""
   "any()"}
 -doc_end
 
+-doc_begin="The macro ISOLATE_LOW_BIT encapsulates a well-known pattern to obtain
+a mask where only the lowest bit set in the argument is set, if any, for unsigned
+integers arguments on two's complement architectures
+(all the architectures supported by Xen satisfy this requirement)."
+-config=MC3R1.R10.1,reports+={safe, "any_area(any_loc(any_exp(macro(^ISOLATE_LOW_BIT$))))"}
+-doc_end
+
 #
 # Series 13
 #
diff --git a/docs/misra/deviations.rst b/docs/misra/deviations.rst
index 8511a189253b..d76b28279e59 100644
--- a/docs/misra/deviations.rst
+++ b/docs/misra/deviations.rst
@@ -192,6 +192,14 @@ Deviations related to MISRA C:2012 Rules:
        See automation/eclair_analysis/deviations.ecl for the full explanation.
      - Tagged as `safe` for ECLAIR.
 
+   * - R10.1
+     - The macro ISOLATE_LOW_BIT encapsulates the well-known pattern (x & -x)
+       applied to unsigned integer values on 2's complement architectures
+       (i.e., all architectures supported by Xen), used to obtain a mask where
+       just the least significant nonzero bit of x is set.
+       If no bits are set, 0 is returned.
+     - Tagged as `safe` for ECLAIR.
+
    * - R13.5
      - All developers and reviewers can be safely assumed to be well aware of
        the short-circuit evaluation strategy for logical operators.
diff --git a/xen/include/xen/macros.h b/xen/include/xen/macros.h
index d0caae7db298..4e1b1f4e4b56 100644
--- a/xen/include/xen/macros.h
+++ b/xen/include/xen/macros.h
@@ -8,8 +8,14 @@
 #define DIV_ROUND(n, d) (((n) + (d) / 2) / (d))
 #define DIV_ROUND_UP(n, d) (((n) + (d) - 1) / (d))
 
-#define MASK_EXTR(v, m) (((v) & (m)) / ((m) & -(m)))
-#define MASK_INSR(v, m) (((v) * ((m) & -(m))) & (m))
+/*
+ * Given an unsigned integer argument, expands to a mask where just the least
+ * significant nonzero bit of the argument is set, or 0 if no bits are set.
+ */
+#define ISOLATE_LOW_BIT(x) ((x) & -(x))
+
+#define MASK_EXTR(v, m) (((v) & (m)) / ISOLATE_LOW_BIT(m))
+#define MASK_INSR(v, m) (((v) * ISOLATE_LOW_BIT(m)) & (m))
 
 #define count_args_(dot, a1, a2, a3, a4, a5, a6, a7, a8, x, ...) x
 #define count_args(args...) \
-- 
2.34.1


