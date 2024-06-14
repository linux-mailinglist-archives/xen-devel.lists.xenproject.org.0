Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4120E9083A7
	for <lists+xen-devel@lfdr.de>; Fri, 14 Jun 2024 08:31:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.740400.1147484 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sI0Sz-0001dx-8s; Fri, 14 Jun 2024 06:31:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 740400.1147484; Fri, 14 Jun 2024 06:31:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sI0Sz-0001b2-5t; Fri, 14 Jun 2024 06:31:17 +0000
Received: by outflank-mailman (input) for mailman id 740400;
 Fri, 14 Jun 2024 06:31:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=V6dE=NQ=bugseng.com=federico.serafini@srs-se1.protection.inumbo.net>)
 id 1sI0Sy-0001aw-9L
 for xen-devel@lists.xenproject.org; Fri, 14 Jun 2024 06:31:16 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b2641d6d-2a17-11ef-b4bb-af5377834399;
 Fri, 14 Jun 2024 08:31:14 +0200 (CEST)
Received: from truciolo.homenet.telecomitalia.it
 (host-82-58-35-96.retail.telecomitalia.it [82.58.35.96])
 by support.bugseng.com (Postfix) with ESMTPSA id 097F64EE0756;
 Fri, 14 Jun 2024 08:31:12 +0200 (CEST)
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
X-Inumbo-ID: b2641d6d-2a17-11ef-b4bb-af5377834399
From: Federico Serafini <federico.serafini@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com,
	Federico Serafini <federico.serafini@bugseng.com>,
	Simone Ballarin <simone.ballarin@bugseng.com>,
	Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>
Subject: [XEN PATCH v2] automation/eclair: add deviation for MISRA C Rule 17.7
Date: Fri, 14 Jun 2024 08:31:05 +0200
Message-Id: <5d4294f9a33cd647b6365614d88665b19a89d62b.1718346542.git.federico.serafini@bugseng.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Update ECLAIR configuration to deviate some cases where not using
the return value of a function is not dangerous.

Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
---
Changes in v2:
- do not deviate strlcpy and strlcat.
---
 automation/eclair_analysis/ECLAIR/deviations.ecl | 4 ++++
 docs/misra/deviations.rst                        | 9 +++++++++
 2 files changed, 13 insertions(+)

diff --git a/automation/eclair_analysis/ECLAIR/deviations.ecl b/automation/eclair_analysis/ECLAIR/deviations.ecl
index 447c1e6661..97281082a8 100644
--- a/automation/eclair_analysis/ECLAIR/deviations.ecl
+++ b/automation/eclair_analysis/ECLAIR/deviations.ecl
@@ -413,6 +413,10 @@ explicit comment indicating the fallthrough intention is present."
 -config=MC3R1.R17.1,macros+={hide , "^va_(arg|start|copy|end)$"}
 -doc_end
 
+-doc_begin="Not using the return value of a function do not endanger safety if it coincides with the first actual argument."
+-config=MC3R1.R17.7,calls+={safe, "any()", "decl(name(__builtin_memcpy||__builtin_memmove||__builtin_memset||cpumask_check))"}
+-doc_end
+
 #
 # Series 18.
 #
diff --git a/docs/misra/deviations.rst b/docs/misra/deviations.rst
index 36959aa44a..2a10de5a66 100644
--- a/docs/misra/deviations.rst
+++ b/docs/misra/deviations.rst
@@ -364,6 +364,15 @@ Deviations related to MISRA C:2012 Rules:
        by `stdarg.h`.
      - Tagged as `deliberate` for ECLAIR.
 
+   * - R17.7
+     - Not using the return value of a function do not endanger safety if it
+       coincides with the first actual argument.
+     - Tagged as `safe` for ECLAIR. Such functions are:
+         - __builtin_memcpy()
+         - __builtin_memmove()
+         - __builtin_memset()
+         - __cpumask_check()
+
    * - R20.4
      - The override of the keyword \"inline\" in xen/compiler.h is present so
        that section contents checks pass when the compiler chooses not to
-- 
2.34.1


