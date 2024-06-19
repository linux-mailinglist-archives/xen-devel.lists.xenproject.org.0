Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 003A090F4D8
	for <lists+xen-devel@lfdr.de>; Wed, 19 Jun 2024 19:09:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.743952.1150966 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sJyoM-00056r-Ij; Wed, 19 Jun 2024 17:09:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 743952.1150966; Wed, 19 Jun 2024 17:09:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sJyoM-00054k-FQ; Wed, 19 Jun 2024 17:09:30 +0000
Received: by outflank-mailman (input) for mailman id 743952;
 Wed, 19 Jun 2024 17:09:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vpHL=NV=bugseng.com=alessandro.zucchelli@srs-se1.protection.inumbo.net>)
 id 1sJyoL-0004ov-BR
 for xen-devel@lists.xenproject.org; Wed, 19 Jun 2024 17:09:29 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id af83f3af-2e5e-11ef-b4bb-af5377834399;
 Wed, 19 Jun 2024 19:09:28 +0200 (CEST)
Received: from delta.bugseng.com.homenet.telecomitalia.it
 (host-87-17-171-46.retail.telecomitalia.it [87.17.171.46])
 by support.bugseng.com (Postfix) with ESMTPSA id 715DF4EE0739;
 Wed, 19 Jun 2024 19:09:27 +0200 (CEST)
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
X-Inumbo-ID: af83f3af-2e5e-11ef-b4bb-af5377834399
From: Alessandro Zucchelli <alessandro.zucchelli@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com,
	Alessandro Zucchelli <alessandro.zucchelli@bugseng.com>,
	Simone Ballarin <simone.ballarin@bugseng.com>,
	Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH 1/2] automation/eclair_analysis: deviate MISRA C Rule 21.2
Date: Wed, 19 Jun 2024 19:09:09 +0200
Message-Id: <5b8364528a9ece8fec9f0e70bee81c2ea94c1820.1718816397.git.alessandro.zucchelli@bugseng.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1718816397.git.alessandro.zucchelli@bugseng.com>
References: <cover.1718816397.git.alessandro.zucchelli@bugseng.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rule 21.2 reports identifiers reserved for the C and POSIX standard
libraries: all xen's translation units are compiled with option
-nostdinc, this guarantees that these libraries are not used, therefore
a justification is provided for allowing uses of such identifiers in
the project.
Builtins starting with "__builtin_" still remain available.

No functional change.

Signed-off-by: Alessandro Zucchelli <alessandro.zucchelli@bugseng.com>
---
 automation/eclair_analysis/ECLAIR/deviations.ecl | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/automation/eclair_analysis/ECLAIR/deviations.ecl b/automation/eclair_analysis/ECLAIR/deviations.ecl
index 447c1e6661..9fa9a7f01c 100644
--- a/automation/eclair_analysis/ECLAIR/deviations.ecl
+++ b/automation/eclair_analysis/ECLAIR/deviations.ecl
@@ -487,6 +487,17 @@ leads to a violation of the Rule are deviated."
 # Series 21.
 #
 
+-doc_begin="Rules 21.1 and 21.2 report identifiers reserved for the C and POSIX
+standard libraries: if these libraries are not used there is no reason to avoid such
+identifiers. All xen's translation units are compiled with option -nostdinc,
+this guarantees that these libraries are not used. Some compilers could perform
+optimization using built-in functions: this risk is partially addressed by
+using the compilation option -fno-builtin. Builtins starting with \"__builtin_\"
+still remain available."
+-config=MC3R1.R21.1,macros={safe , "!^__builtin_$" }
+-config=MC3R1.R21.2,declarations+={safe, "!^__builtin_.*$"}
+-doc_end
+
 -doc_begin="Xen does not use the functions provided by the Standard Library, but
 implements a set of functions that share the same names as their Standard Library equivalent.
 The implementation of these functions is available in source form, so the undefined, unspecified
-- 
2.34.1


