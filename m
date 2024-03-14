Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 405DE87C159
	for <lists+xen-devel@lfdr.de>; Thu, 14 Mar 2024 17:35:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.693384.1081397 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rko3K-0003ZE-BV; Thu, 14 Mar 2024 16:35:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 693384.1081397; Thu, 14 Mar 2024 16:35:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rko3K-0003Xf-8a; Thu, 14 Mar 2024 16:35:34 +0000
Received: by outflank-mailman (input) for mailman id 693384;
 Thu, 14 Mar 2024 16:35:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ujj0=KU=bugseng.com=federico.serafini@srs-se1.protection.inumbo.net>)
 id 1rko3J-0003WM-E5
 for xen-devel@lists.xenproject.org; Thu, 14 Mar 2024 16:35:33 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id df84be04-e220-11ee-a1ee-f123f15fe8a2;
 Thu, 14 Mar 2024 17:35:31 +0100 (CET)
Received: from truciolo.bugseng.com (unknown [37.161.186.27])
 by support.bugseng.com (Postfix) with ESMTPSA id EDD644EE0739;
 Thu, 14 Mar 2024 17:35:29 +0100 (CET)
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
X-Inumbo-ID: df84be04-e220-11ee-a1ee-f123f15fe8a2
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
Subject: [XEN PATCH] automation/eclair: allow parameter name "unused"
Date: Thu, 14 Mar 2024 17:35:21 +0100
Message-Id: <f2666bff183d5497b4993fdc27f6a66141ec8d85.1710433895.git.federico.serafini@bugseng.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Update ECLAIR configuration of MISRA C:2012 Rule 8.3 to deviate
violations involving parameter name "unused":
it makes explicit the intention of not using the parameter within
the function.

Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
---
 automation/eclair_analysis/ECLAIR/deviations.ecl | 4 ++++
 docs/misra/deviations.rst                        | 5 +++++
 2 files changed, 9 insertions(+)

diff --git a/automation/eclair_analysis/ECLAIR/deviations.ecl b/automation/eclair_analysis/ECLAIR/deviations.ecl
index 9ac3ee4dfd..7e913050d2 100644
--- a/automation/eclair_analysis/ECLAIR/deviations.ecl
+++ b/automation/eclair_analysis/ECLAIR/deviations.ecl
@@ -167,6 +167,10 @@ const-qualified."
 -config=MC3R1.R8.3,reports+={deliberate,"any_area(any_loc(file(adopted_decompress_r8_3)))&&any_area(any_loc(file(^xen/include/xen/decompress\\.h$)))"}
 -doc_end
 
+-doc_begin="Parameter name \"unused\" is deliberate and makes explicit the intention of not using the parameter within the function."
+-config=MC3R1.R8.3,reports+={deliberate, "any_area(^.*parameter `unused'.*$)"}
+-doc_end
+
 -doc_begin="The following file is imported from Linux: ignore for now."
 -file_tag+={adopted_time_r8_3,"^xen/arch/x86/time\\.c$"}
 -config=MC3R1.R8.3,reports+={deliberate,"any_area(any_loc(file(adopted_time_r8_3)))&&(any_area(any_loc(file(^xen/include/xen/time\\.h$)))||any_area(any_loc(file(^xen/arch/x86/include/asm/setup\\.h$))))"}
diff --git a/docs/misra/deviations.rst b/docs/misra/deviations.rst
index ce855ddae6..941da4c40b 100644
--- a/docs/misra/deviations.rst
+++ b/docs/misra/deviations.rst
@@ -157,6 +157,11 @@ Deviations related to MISRA C:2012 Rules:
          - xen/common/unxz.c
          - xen/common/unzstd.c
 
+   * - R8.3
+     - Parameter name "unused" is deliberate and makes explicit the intention
+       of not using the parameter within the function.
+     - Tagged as `deliberate` for ECLAIR.
+
    * - R8.4
      - The definitions present in the files 'asm-offsets.c' for any architecture
        are used to generate definitions for asm modules, and are not called by
-- 
2.34.1


