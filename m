Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E3F5860D8D
	for <lists+xen-devel@lfdr.de>; Fri, 23 Feb 2024 10:07:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.684684.1064691 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rdRWY-0008Ae-2z; Fri, 23 Feb 2024 09:07:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 684684.1064691; Fri, 23 Feb 2024 09:07:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rdRWX-00086c-U3; Fri, 23 Feb 2024 09:07:17 +0000
Received: by outflank-mailman (input) for mailman id 684684;
 Fri, 23 Feb 2024 09:07:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hXte=KA=bugseng.com=federico.serafini@srs-se1.protection.inumbo.net>)
 id 1rdRWW-00083u-In
 for xen-devel@lists.xenproject.org; Fri, 23 Feb 2024 09:07:16 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ef75a4a9-d22a-11ee-98f5-efadbce2ee36;
 Fri, 23 Feb 2024 10:07:14 +0100 (CET)
Received: from Dell.bugsneg.com (unknown [37.161.242.66])
 by support.bugseng.com (Postfix) with ESMTPSA id 9416F4EE0741;
 Fri, 23 Feb 2024 10:07:13 +0100 (CET)
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
X-Inumbo-ID: ef75a4a9-d22a-11ee-98f5-efadbce2ee36
From: Federico Serafini <federico.serafini@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com,
	Federico Serafini <federico.serafini@bugseng.com>,
	Simone Ballarin <simone.ballarin@bugseng.com>,
	Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [XEN PATCH 1/2] automation/eclair: fully deviate MISRA C:2012 Rules 5.7 and 18.7
Date: Fri, 23 Feb 2024 10:06:59 +0100
Message-Id: <1fee04ad07b03c13c44f66a20c4ee70737069650.1708677243.git.federico.serafini@bugseng.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1708677243.git.federico.serafini@bugseng.com>
References: <cover.1708677243.git.federico.serafini@bugseng.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Update ECLAIR configuration to fully deviate Rules 5.7 and 18.7
as agreed during MISRA meeetings.

Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
---
 automation/eclair_analysis/ECLAIR/deviations.ecl | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/automation/eclair_analysis/ECLAIR/deviations.ecl b/automation/eclair_analysis/ECLAIR/deviations.ecl
index fd32ff8a9c..02eae39786 100644
--- a/automation/eclair_analysis/ECLAIR/deviations.ecl
+++ b/automation/eclair_analysis/ECLAIR/deviations.ecl
@@ -107,6 +107,11 @@ number of guest paging levels."
 -config=MC3R1.R5.6,reports+={deliberate,"any_area(any_loc(file(adopted_r5_6)))"}
 -doc_end
 
+-doc_begin="The project intentionally reuses tag names in order to have identifiers matching the applicable external specifications as well as established internal conventions.
+As there is little possibility for developer confusion not resulting into compilation errors, the risk of renaming outweighs the potential advantages of compliance."
+-config=MC3R1.R5.7,reports+={deliberate,"any()"}
+-doc_end
+
 #
 # Series 7.
 #
@@ -373,6 +378,15 @@ explicit comment indicating the fallthrough intention is present."
 -config=MC3R1.R16.3,reports+={safe, "any_area(end_loc(any_exp(text(^(?s).*/\\* [fF]all ?through.? \\*/.*$,0..1))))"}
 -doc_end
 
+#
+# Series 18.
+#
+
+-doc_begin="Flexible array members are deliberately used and XEN developers are aware of the dangers related to them:
+unexpected result when the structure is given as argument to a sizeof() operator and the truncation in assignment between structures."
+-config=MC3R1.R18.7,reports+={deliberate, "any()"}
+-doc_end
+
 #
 # Series 20.
 #
-- 
2.34.1


