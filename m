Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DBA5887CBAF
	for <lists+xen-devel@lfdr.de>; Fri, 15 Mar 2024 11:56:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.693743.1082184 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rl5EA-0007al-UP; Fri, 15 Mar 2024 10:55:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 693743.1082184; Fri, 15 Mar 2024 10:55:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rl5EA-0007Yi-Qz; Fri, 15 Mar 2024 10:55:54 +0000
Received: by outflank-mailman (input) for mailman id 693743;
 Fri, 15 Mar 2024 10:55:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1mWO=KV=bugseng.com=federico.serafini@srs-se1.protection.inumbo.net>)
 id 1rl5E9-0007Yc-Ku
 for xen-devel@lists.xenproject.org; Fri, 15 Mar 2024 10:55:53 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 970bf92a-e2ba-11ee-afdd-a90da7624cb6;
 Fri, 15 Mar 2024 11:55:52 +0100 (CET)
Received: from truciolo.bugseng.com (unknown [78.211.227.3])
 by support.bugseng.com (Postfix) with ESMTPSA id CFEA14EE073C;
 Fri, 15 Mar 2024 11:55:49 +0100 (CET)
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
X-Inumbo-ID: 970bf92a-e2ba-11ee-afdd-a90da7624cb6
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
	Julien Grall <julien@xen.org>,
	Wei Liu <wl@xen.org>
Subject: [XEN PATCH v2] automation/eclair: allow parameter name "unused"
Date: Fri, 15 Mar 2024 11:55:41 +0100
Message-Id: <de0938a9f68c21dfd9b31606329b1937dd263ab5.1710499973.git.federico.serafini@bugseng.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Update ECLAIR configuration of MISRA C:2012 Rule 8.3 to deviate
violations involving parameter name "unused" (with an optional
numeric suffix): it makes explicit the intention of not using such
parameter within the function.

Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
---
Changes in v2:
- optional numeric suffix.
---
 automation/eclair_analysis/ECLAIR/deviations.ecl | 4 ++++
 docs/misra/deviations.rst                        | 6 ++++++
 2 files changed, 10 insertions(+)

diff --git a/automation/eclair_analysis/ECLAIR/deviations.ecl b/automation/eclair_analysis/ECLAIR/deviations.ecl
index 53f7623454..de9ba723fb 100644
--- a/automation/eclair_analysis/ECLAIR/deviations.ecl
+++ b/automation/eclair_analysis/ECLAIR/deviations.ecl
@@ -167,6 +167,10 @@ const-qualified."
 -config=MC3R1.R8.3,reports+={deliberate,"any_area(any_loc(file(adopted_decompress_r8_3)))&&any_area(any_loc(file(^xen/include/xen/decompress\\.h$)))"}
 -doc_end
 
+-doc_begin="Parameter name \"unused\" (with an optional numeric suffix) is deliberate and makes explicit the intention of not using such parameter within the function."
+-config=MC3R1.R8.3,reports+={deliberate, "any_area(^.*parameter `unused[0-9]*'.*$)"}
+-doc_end
+
 -doc_begin="The following file is imported from Linux: ignore for now."
 -file_tag+={adopted_time_r8_3,"^xen/arch/x86/time\\.c$"}
 -config=MC3R1.R8.3,reports+={deliberate,"any_area(any_loc(file(adopted_time_r8_3)))&&(any_area(any_loc(file(^xen/include/xen/time\\.h$)))||any_area(any_loc(file(^xen/arch/x86/include/asm/setup\\.h$))))"}
diff --git a/docs/misra/deviations.rst b/docs/misra/deviations.rst
index 41fa5b31b0..eb5ef2bd9d 100644
--- a/docs/misra/deviations.rst
+++ b/docs/misra/deviations.rst
@@ -157,6 +157,12 @@ Deviations related to MISRA C:2012 Rules:
          - xen/common/unxz.c
          - xen/common/unzstd.c
 
+   * - R8.3
+     - Parameter name "unused" (with an optional numeric suffix) is deliberate
+       and makes explicit the intention of not using such parameter within the
+       function.
+     - Tagged as `deliberate` for ECLAIR.
+
    * - R8.4
      - The definitions present in the files 'asm-offsets.c' for any architecture
        are used to generate definitions for asm modules, and are not called by
-- 
2.34.1


