Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7996B962855
	for <lists+xen-devel@lfdr.de>; Wed, 28 Aug 2024 15:13:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.784814.1194210 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sjITn-00042t-Lg; Wed, 28 Aug 2024 13:12:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 784814.1194210; Wed, 28 Aug 2024 13:12:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sjITn-00041O-Iu; Wed, 28 Aug 2024 13:12:55 +0000
Received: by outflank-mailman (input) for mailman id 784814;
 Wed, 28 Aug 2024 13:12:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=J5xK=P3=bugseng.com=federico.serafini@srs-se1.protection.inumbo.net>)
 id 1sjITl-00041G-L3
 for xen-devel@lists.xenproject.org; Wed, 28 Aug 2024 13:12:54 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3aa867a4-653f-11ef-99a0-01e77a169b0f;
 Wed, 28 Aug 2024 15:12:51 +0200 (CEST)
Received: from truciolo.homenet.telecomitalia.it
 (host-79-46-33-59.retail.telecomitalia.it [79.46.33.59])
 by support.bugseng.com (Postfix) with ESMTPSA id 4DD374EE0745;
 Wed, 28 Aug 2024 15:12:50 +0200 (CEST)
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
X-Inumbo-ID: 3aa867a4-653f-11ef-99a0-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=bugseng.com; s=mail;
	t=1724850770; bh=YgUHtBUkddA4AevUOiJ9qiyDHF9U+GGJWoIylf0IYnM=;
	h=From:To:Cc:Subject:Date:From;
	b=UjIUas4yOUEIP7DACSCEa0ZB/VA65j1wrrnMY343Nxp8R4LAwT0Pmkwg5sEDlSmRE
	 R9yJFfuvXVDFmT3SUujGWKfH/BubaP/nbOf2PKwFlERTyeWKY+WbuZFUUsWeoQ8RNA
	 4W6PAqCMeISUDrwy6T1F39BW6PPnGC4IhJddlRrMFSsksAAQI9ALXdVA5F2o+KBI0E
	 hOGPdUbfcMqhaC5RCkC+tINaiSTqNh555FsqANa7Obyr8yPg70NoHFfwu86pKn3Pmt
	 gJr1GWPGzE5h54YBDp5zQYkqvQE121XURYyGaIr7YJzgTtGlr3G6kqAYTrcFo5gwPC
	 L6spIwiiUjarA==
From: Federico Serafini <federico.serafini@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com,
	Federico Serafini <federico.serafini@bugseng.com>,
	Simone Ballarin <simone.ballarin@bugseng.com>,
	Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>
Subject: [XEN PATCH] xen/bitmap: remove comment-based deviations
Date: Wed, 28 Aug 2024 15:12:44 +0200
Message-Id: <4aa692a50a5d08d24560f02fdc36911965fc860b.1724850701.git.federico.serafini@bugseng.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Update ECLAIR configuration of MISRA C:2012 Rule 20.7 ("Expressions
resulting from the expansion of macro parameters shall be enclosed in
parentheses") to tag as 'safe' the expansions of arguments surrounded
by the following tokens: '{', '}' and ';'.

Remove redundant comment-based deviations.

Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
---
 automation/eclair_analysis/ECLAIR/deviations.ecl | 4 ++++
 docs/misra/deviations.rst                        | 5 +++++
 xen/include/xen/bitmap.h                         | 3 ---
 3 files changed, 9 insertions(+), 3 deletions(-)

diff --git a/automation/eclair_analysis/ECLAIR/deviations.ecl b/automation/eclair_analysis/ECLAIR/deviations.ecl
index 1aa8277066..f37329973f 100644
--- a/automation/eclair_analysis/ECLAIR/deviations.ecl
+++ b/automation/eclair_analysis/ECLAIR/deviations.ecl
@@ -565,6 +565,10 @@ of this macro do not lead to developer confusion, and can thus be deviated."
 -config=MC3R1.R20.7,reports+={safe, "any_area(any_loc(any_exp(macro(^count_args_$))))"}
 -doc_end
 
+-doc_begin="The expansion of an argument surrounded by tokens '{', '}' and ';' is safe."
+-config=MC3R1.R20.7,expansion_context+={safe, "left_right(^[\\{;]$,^[;\\}]$)"}
+-doc_end
+
 -doc_begin="Uses of variadic macros that have one of their arguments defined as
 a macro and used within the body for both ordinary parameter expansion and as an
 operand to the # or ## operators have a behavior that is well-understood and
diff --git a/docs/misra/deviations.rst b/docs/misra/deviations.rst
index d51aa422b5..d529726464 100644
--- a/docs/misra/deviations.rst
+++ b/docs/misra/deviations.rst
@@ -512,6 +512,11 @@ Deviations related to MISRA C:2012 Rules:
        refactoring it to add parentheses breaks its functionality.
      - Tagged as `safe` for ECLAIR.
 
+   * - R20.7
+     - The expansion of an argument surrounded by tokens '{', '}' and ';' is
+       safe.
+     - Tagged as `safe` for ECLAIR.
+
    * - R20.12
      - Variadic macros that use token pasting often employ the gcc extension
        `ext_paste_comma`, as detailed in `C-language-toolchain.rst`, which is
diff --git a/xen/include/xen/bitmap.h b/xen/include/xen/bitmap.h
index 5d668053b0..4b642cd420 100644
--- a/xen/include/xen/bitmap.h
+++ b/xen/include/xen/bitmap.h
@@ -103,13 +103,10 @@ extern int bitmap_allocate_region(unsigned long *bitmap, int pos, int order);
 #define bitmap_switch(nbits, zero, small, large)			  \
 	unsigned int n__ = (nbits);					  \
 	if (__builtin_constant_p(nbits) && !n__) {			  \
-		/* SAF-7-safe Rule 20.7 non-parenthesized macro argument */ \
 		zero;							  \
 	} else if (__builtin_constant_p(nbits) && n__ <= BITS_PER_LONG) { \
-		/* SAF-7-safe Rule 20.7 non-parenthesized macro argument */ \
 		small;							  \
 	} else {							  \
-		/* SAF-7-safe Rule 20.7 non-parenthesized macro argument */ \
 		large;							  \
 	}
 
-- 
2.34.1


