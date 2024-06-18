Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 28B3490C5A7
	for <lists+xen-devel@lfdr.de>; Tue, 18 Jun 2024 11:56:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.742935.1149819 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sJVYp-00065C-9v; Tue, 18 Jun 2024 09:55:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 742935.1149819; Tue, 18 Jun 2024 09:55:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sJVYp-00062a-7B; Tue, 18 Jun 2024 09:55:31 +0000
Received: by outflank-mailman (input) for mailman id 742935;
 Tue, 18 Jun 2024 09:55:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=veLi=NU=bugseng.com=alessandro.zucchelli@srs-se1.protection.inumbo.net>)
 id 1sJVYn-00062U-LB
 for xen-devel@lists.xenproject.org; Tue, 18 Jun 2024 09:55:29 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e3a454af-2d58-11ef-b4bb-af5377834399;
 Tue, 18 Jun 2024 11:55:27 +0200 (CEST)
Received: from delta.bugseng.com.homenet.telecomitalia.it
 (host-87-17-171-46.retail.telecomitalia.it [87.17.171.46])
 by support.bugseng.com (Postfix) with ESMTPSA id 711AA4EE0738;
 Tue, 18 Jun 2024 11:55:25 +0200 (CEST)
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
X-Inumbo-ID: e3a454af-2d58-11ef-b4bb-af5377834399
From: Alessandro Zucchelli <alessandro.zucchelli@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com,
	Alessandro Zucchelli <alessandro.zucchelli@bugseng.com>,
	Simone Ballarin <simone.ballarin@bugseng.com>,
	Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH] automation/eclair_analysis: deviate common/unlzo.c for MISRA Rule 7.3
Date: Tue, 18 Jun 2024 11:54:49 +0200
Message-Id: <20342a68627d5fe7c85c50f64e9300e9a587974b.1718704260.git.alessandro.zucchelli@bugseng.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The file contains violations of Rule 7.3 which states as following: The
lowercase character `l' shall not be used in a literal suffix.

This file defines a non-compliant constant used in a macro expanded in a
non-excluded file, so this deviation is needed in order to avoid
a spurious violation involving both files.

No functional change.

Signed-off-by: Alessandro Zucchelli <alessandro.zucchelli@bugseng.com>
---
 automation/eclair_analysis/ECLAIR/deviations.ecl | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/automation/eclair_analysis/ECLAIR/deviations.ecl b/automation/eclair_analysis/ECLAIR/deviations.ecl
index 447c1e6661..90413c5458 100644
--- a/automation/eclair_analysis/ECLAIR/deviations.ecl
+++ b/automation/eclair_analysis/ECLAIR/deviations.ecl
@@ -139,6 +139,12 @@ particular use of it done in xen_mk_ulong."
 -config=MC3R1.R7.2,reports+={deliberate,"any_area(any_loc(macro(name(BUILD_BUG_ON))))"}
 -doc_end
 
+-doc_begin="Violations in files that maintainers have asked to not modify in the
+context of R7.3."
+-file_tag+={adopted_r7_3,"^xen/common/unlzo\\.c$"}
+-config=MC3R1.R7.3,reports+={deliberate,"any_area(any_loc(file(adopted_r7_3)))"}
+-doc_end
+
 -doc_begin="Allow pointers of non-character type as long as the pointee is
 const-qualified."
 -config=MC3R1.R7.4,same_pointee=false
-- 
2.34.1


