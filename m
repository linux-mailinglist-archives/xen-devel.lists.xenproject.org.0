Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F3E177B62DC
	for <lists+xen-devel@lfdr.de>; Tue,  3 Oct 2023 09:54:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.612134.951973 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qnaEV-0007sP-7W; Tue, 03 Oct 2023 07:54:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 612134.951973; Tue, 03 Oct 2023 07:54:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qnaEV-0007op-4S; Tue, 03 Oct 2023 07:54:19 +0000
Received: by outflank-mailman (input) for mailman id 612134;
 Tue, 03 Oct 2023 07:54:17 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=eQkC=FR=bugseng.com=federico.serafini@srs-se1.protection.inumbo.net>)
 id 1qnaET-0007oj-Hj
 for xen-devel@lists.xenproject.org; Tue, 03 Oct 2023 07:54:17 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0cce8d55-61c2-11ee-98d2-6d05b1d4d9a1;
 Tue, 03 Oct 2023 09:54:16 +0200 (CEST)
Received: from Dell.homenet.telecomitalia.it
 (host-87-11-204-216.retail.telecomitalia.it [87.11.204.216])
 by support.bugseng.com (Postfix) with ESMTPSA id B162F4EE0737;
 Tue,  3 Oct 2023 09:54:15 +0200 (CEST)
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
X-Inumbo-ID: 0cce8d55-61c2-11ee-98d2-6d05b1d4d9a1
From: Federico Serafini <federico.serafini@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com,
	Federico Serafini <federico.serafini@bugseng.com>,
	Simone Ballarin <simone.ballarin@bugseng.com>,
	Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Henry Wang <henry.wang@arm.com>
Subject: [XEN PATCH] automation/eclair: add deviations for MISRA C:2012 Rule 10.1
Date: Tue,  3 Oct 2023 09:54:09 +0200
Message-Id: <83f4f9df2459f22690e6df98a43b3602c22bf27b.1696319475.git.federico.serafini@bugseng.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Update the configuration of ECLAIR to deviate some violations of Rule
10.1 in accordance with docs/misra/rules.rst.

Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
---
 automation/eclair_analysis/ECLAIR/deviations.ecl | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/automation/eclair_analysis/ECLAIR/deviations.ecl b/automation/eclair_analysis/ECLAIR/deviations.ecl
index d8170106b4..241aad6393 100644
--- a/automation/eclair_analysis/ECLAIR/deviations.ecl
+++ b/automation/eclair_analysis/ECLAIR/deviations.ecl
@@ -274,6 +274,18 @@ still non-negative."
 -config=MC3R1.R10.1,etypes+={safe, "stmt(operator(logical)||node(conditional_operator||binary_conditional_operator))", "dst_type(ebool||boolean)"}
 -doc_end
 
+-doc_begin="XEN only supports architectures where signed integers are representend using two's complement and all the XEN developers are aware of this."
+-config=MC3R1.R10.1,etypes+={safe,
+  "stmt(operator(and||or||xor||not||and_assign||or_assign||xor_assign))",
+  "any()"}
+-doc_end
+
+-doc_begin="See Section \"4.5 Integers\" of \"GCC_MANUAL\", where it says that \"Signed `>>' acts on negative numbers by sign extension. As an extension to the C language, GCC does not use the latitude given in C99 and C11 only to treat certain aspects of signed `<<' as undefined. However, -fsanitize=shift (and -fsanitize=undefined) will diagnose such cases. They are also diagnosed where constant expressions are required.\""
+-config=MC3R1.R10.1,etypes+={safe,
+  "stmt(operator(shl||shr||shl_assign||shr_assign))",
+  "any()"}
+-doc_end
+
 ### Set 3 ###
 
 #
-- 
2.34.1


