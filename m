Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 262A07D12AA
	for <lists+xen-devel@lfdr.de>; Fri, 20 Oct 2023 17:29:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.619833.965563 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qtrQe-00060x-5B; Fri, 20 Oct 2023 15:28:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 619833.965563; Fri, 20 Oct 2023 15:28:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qtrQe-0005z9-0t; Fri, 20 Oct 2023 15:28:48 +0000
Received: by outflank-mailman (input) for mailman id 619833;
 Fri, 20 Oct 2023 15:28:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SYNS=GC=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1qtrQc-0005jz-93
 for xen-devel@lists.xenproject.org; Fri, 20 Oct 2023 15:28:46 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5ba8a4d1-6f5d-11ee-98d5-6d05b1d4d9a1;
 Fri, 20 Oct 2023 17:28:45 +0200 (CEST)
Received: from nico.bugseng.com (unknown [147.123.100.131])
 by support.bugseng.com (Postfix) with ESMTPSA id B5E1D4EE0741;
 Fri, 20 Oct 2023 17:28:43 +0200 (CEST)
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
X-Inumbo-ID: 5ba8a4d1-6f5d-11ee-98d5-6d05b1d4d9a1
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
Subject: [XEN PATCH][for-4.19 v3 1/8] xen/include: add macro LOWEST_BIT
Date: Fri, 20 Oct 2023 17:28:30 +0200
Message-Id: <546cf30aa43d6d0687a9a6c6d23b11128e5783e8.1697815135.git.nicola.vetrini@bugseng.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1697815135.git.nicola.vetrini@bugseng.com>
References: <cover.1697815135.git.nicola.vetrini@bugseng.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The purpose of this macro is to encapsulate the well-known expression
'x & -x', that in 2's complement architectures on unsigned integers will
give 2^ffs(x), where ffs(x) is the position of the lowest set bit in x.

A deviation for ECLAIR is also introduced.

Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
---
Changes in v2:
- rename to LOWEST_BIT
Changes in v3:
- entry for deviations.rst
- comment on the macro defn
---
 automation/eclair_analysis/ECLAIR/deviations.ecl |  6 ++++++
 docs/misra/deviations.rst                        |  7 +++++++
 xen/include/xen/macros.h                         |  7 +++++--
 xen/include/xen/types.h                          | 10 +++++-----
 4 files changed, 23 insertions(+), 7 deletions(-)

diff --git a/automation/eclair_analysis/ECLAIR/deviations.ecl b/automation/eclair_analysis/ECLAIR/deviations.ecl
index fa56e5c00a27..9390f6d839ff 100644
--- a/automation/eclair_analysis/ECLAIR/deviations.ecl
+++ b/automation/eclair_analysis/ECLAIR/deviations.ecl
@@ -246,6 +246,12 @@ constant expressions are required.\""
   "any()"}
 -doc_end
 
+-doc_begin="The macro LOWEST_BIT encapsulates a well-known pattern to obtain the value
+2^ffs(x) for unsigned integers on two's complement architectures
+(all the architectures supported by Xen satisfy this requirement)."
+-config=MC3R1.R10.1,reports+={safe, "any_area(any_loc(any_exp(macro(^LOWEST_BIT$))))"}
+-doc_end
+
 #
 # Series 13
 #
diff --git a/docs/misra/deviations.rst b/docs/misra/deviations.rst
index 8511a189253b..c3c65f4a9454 100644
--- a/docs/misra/deviations.rst
+++ b/docs/misra/deviations.rst
@@ -192,6 +192,13 @@ Deviations related to MISRA C:2012 Rules:
        See automation/eclair_analysis/deviations.ecl for the full explanation.
      - Tagged as `safe` for ECLAIR.
 
+   * - R10.1
+     - The well-known pattern (x & -x) applied to unsigned integer values on 2's
+       complement architectures (i.e., all architectures supported by Xen), used
+       to obtain the value 2^ffs(x), where ffs(x) is the position of the first
+       bit set. If no bits are set, zero is returned.
+     - Tagged as `safe` for ECLAIR.
+
    * - R13.5
      - All developers and reviewers can be safely assumed to be well aware of
        the short-circuit evaluation strategy for logical operators.
diff --git a/xen/include/xen/macros.h b/xen/include/xen/macros.h
index d0caae7db298..49f3ebf848e9 100644
--- a/xen/include/xen/macros.h
+++ b/xen/include/xen/macros.h
@@ -8,8 +8,11 @@
 #define DIV_ROUND(n, d) (((n) + (d) / 2) / (d))
 #define DIV_ROUND_UP(n, d) (((n) + (d) - 1) / (d))
 
-#define MASK_EXTR(v, m) (((v) & (m)) / ((m) & -(m)))
-#define MASK_INSR(v, m) (((v) * ((m) & -(m))) & (m))
+/* Returns the 2^ffs(x) or 0, where ffs(x) is the index of the lowest set bit */
+#define LOWEST_BIT(x) ((x) & -(x))
+
+#define MASK_EXTR(v, m) (((v) & (m)) / LOWEST_BIT(m))
+#define MASK_INSR(v, m) (((v) * LOWEST_BIT(m)) & (m))
 
 #define count_args_(dot, a1, a2, a3, a4, a5, a6, a7, a8, x, ...) x
 #define count_args(args...) \
diff --git a/xen/include/xen/types.h b/xen/include/xen/types.h
index aea259db1ef2..23cad71c8a47 100644
--- a/xen/include/xen/types.h
+++ b/xen/include/xen/types.h
@@ -31,9 +31,9 @@ typedef __PTRDIFF_TYPE__ ptrdiff_t;
 #define NULL ((void*)0)
 #endif
 
-#define INT8_MIN        (-127-1)
-#define INT16_MIN       (-32767-1)
-#define INT32_MIN       (-2147483647-1)
+#define INT8_MIN        (-127 - 1)
+#define INT16_MIN       (-32767 - 1)
+#define INT32_MIN       (-2147483647 - 1)
 
 #define INT8_MAX        (127)
 #define INT16_MAX       (32767)
@@ -43,10 +43,10 @@ typedef __PTRDIFF_TYPE__ ptrdiff_t;
 #define UINT16_MAX      (65535)
 #define UINT32_MAX      (4294967295U)
 
-#define INT_MAX         ((int)(~0U>>1))
+#define INT_MAX         ((int)(~0U >> 1))
 #define INT_MIN         (-INT_MAX - 1)
 #define UINT_MAX        (~0U)
-#define LONG_MAX        ((long)(~0UL>>1))
+#define LONG_MAX        ((long)(~0UL >> 1))
 #define LONG_MIN        (-LONG_MAX - 1)
 #define ULONG_MAX       (~0UL)
 
-- 
2.34.1


