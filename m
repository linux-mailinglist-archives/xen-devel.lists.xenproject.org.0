Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B6B1D7C7174
	for <lists+xen-devel@lfdr.de>; Thu, 12 Oct 2023 17:29:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.615839.957333 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qqxcU-0006Ye-7h; Thu, 12 Oct 2023 15:29:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 615839.957333; Thu, 12 Oct 2023 15:29:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qqxcU-0006TY-3G; Thu, 12 Oct 2023 15:29:02 +0000
Received: by outflank-mailman (input) for mailman id 615839;
 Thu, 12 Oct 2023 15:29:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=oWZW=F2=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1qqxcT-0006QI-1J
 for xen-devel@lists.xenproject.org; Thu, 12 Oct 2023 15:29:01 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 109d92c0-6914-11ee-98d4-6d05b1d4d9a1;
 Thu, 12 Oct 2023 17:28:59 +0200 (CEST)
Received: from nico.bugseng.com (unknown [147.123.100.131])
 by support.bugseng.com (Postfix) with ESMTPSA id E020B4EE0744;
 Thu, 12 Oct 2023 17:28:57 +0200 (CEST)
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
X-Inumbo-ID: 109d92c0-6914-11ee-98d4-6d05b1d4d9a1
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
Subject: [XEN PATCH][for-next][for-4.19 v2 1/8] xen/include: add macro LOWEST_BIT
Date: Thu, 12 Oct 2023 17:28:45 +0200
Message-Id: <bb0ba44f8a3944c22a1c7cf19196c7060e8adb4b.1697123806.git.nicola.vetrini@bugseng.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1697123806.git.nicola.vetrini@bugseng.com>
References: <cover.1697123806.git.nicola.vetrini@bugseng.com>
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
---
 automation/eclair_analysis/ECLAIR/deviations.ecl | 6 ++++++
 xen/include/xen/macros.h                         | 6 ++++--
 2 files changed, 10 insertions(+), 2 deletions(-)

diff --git a/automation/eclair_analysis/ECLAIR/deviations.ecl b/automation/eclair_analysis/ECLAIR/deviations.ecl
index d8170106b449..b8e1155ee49d 100644
--- a/automation/eclair_analysis/ECLAIR/deviations.ecl
+++ b/automation/eclair_analysis/ECLAIR/deviations.ecl
@@ -274,6 +274,12 @@ still non-negative."
 -config=MC3R1.R10.1,etypes+={safe, "stmt(operator(logical)||node(conditional_operator||binary_conditional_operator))", "dst_type(ebool||boolean)"}
 -doc_end

+-doc_begin="The macro LOWEST_BIT encapsulates a well-known pattern to obtain the value
+2^ffs(x) for unsigned integers on two's complement architectures
+(all the architectures supported by Xen satisfy this requirement)."
+-config=MC3R1.R10.1,reports+={safe, "any_area(any_loc(any_exp(macro(^LOWEST_BIT$))))"}
+-doc_end
+
 ### Set 3 ###

 #
diff --git a/xen/include/xen/macros.h b/xen/include/xen/macros.h
index d0caae7db298..af47179d1056 100644
--- a/xen/include/xen/macros.h
+++ b/xen/include/xen/macros.h
@@ -8,8 +8,10 @@
 #define DIV_ROUND(n, d) (((n) + (d) / 2) / (d))
 #define DIV_ROUND_UP(n, d) (((n) + (d) - 1) / (d))

-#define MASK_EXTR(v, m) (((v) & (m)) / ((m) & -(m)))
-#define MASK_INSR(v, m) (((v) * ((m) & -(m))) & (m))
+#define LOWEST_BIT(x) ((x) & -(x))
+
+#define MASK_EXTR(v, m) (((v) & (m)) / LOWEST_BIT(m))
+#define MASK_INSR(v, m) (((v) * LOWEST_BIT(m)) & (m))

 #define count_args_(dot, a1, a2, a3, a4, a5, a6, a7, a8, x, ...) x
 #define count_args(args...) \
--
2.34.1

