Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DF1DE7FC006
	for <lists+xen-devel@lfdr.de>; Tue, 28 Nov 2023 18:10:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.643344.1003442 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r81ba-00061K-6o; Tue, 28 Nov 2023 17:10:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 643344.1003442; Tue, 28 Nov 2023 17:10:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r81ba-0005yI-44; Tue, 28 Nov 2023 17:10:38 +0000
Received: by outflank-mailman (input) for mailman id 643344;
 Tue, 28 Nov 2023 17:10:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XwP9=HJ=bugseng.com=federico.serafini@srs-se1.protection.inumbo.net>)
 id 1r81bY-0005wh-9n
 for xen-devel@lists.xenproject.org; Tue, 28 Nov 2023 17:10:36 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 09d87c3f-8e11-11ee-9b0e-b553b5be7939;
 Tue, 28 Nov 2023 18:10:32 +0100 (CET)
Received: from Dell.homenet.telecomitalia.it
 (host-82-59-158-146.retail.telecomitalia.it [82.59.158.146])
 by support.bugseng.com (Postfix) with ESMTPSA id ECE574EE0737;
 Tue, 28 Nov 2023 18:10:31 +0100 (CET)
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
X-Inumbo-ID: 09d87c3f-8e11-11ee-9b0e-b553b5be7939
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
Subject: [XEN PATCH] automation/eclair: add deviations for MISRA C:2012 Rule 5.6
Date: Tue, 28 Nov 2023 18:09:46 +0100
Message-Id: <5826d25aeb31ebd29b0f2aebf3f78e676deb50b9.1701191295.git.federico.serafini@bugseng.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Update ECLAIR configuration to take into account the adopted files
and type "ret_t".
Update docs/misra/deviations.rst accordingly.

Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
---
 automation/eclair_analysis/ECLAIR/deviations.ecl | 12 ++++++++++++
 docs/misra/deviations.rst                        | 16 ++++++++++++++++
 2 files changed, 28 insertions(+)

diff --git a/automation/eclair_analysis/ECLAIR/deviations.ecl b/automation/eclair_analysis/ECLAIR/deviations.ecl
index c9e3a90801..3c6c7ce4a3 100644
--- a/automation/eclair_analysis/ECLAIR/deviations.ecl
+++ b/automation/eclair_analysis/ECLAIR/deviations.ecl
@@ -81,6 +81,18 @@ conform to the directive."
 -config=MC3R1.R5.3,reports+={safe, "any_area(any_loc(any_exp(macro(^read_debugreg$))&&any_exp(macro(^write_debugreg$))))"}
 -doc_end
 
+-doc_begin="The type \"ret_t\" is deliberately defined multiple times,
+depending on the guest."
+-config=MC3R1.R5.6,reports+={deliberate,"any_area(any_loc(text(^.*ret_t.*$)))"}
+-doc_end
+
+-doc_begin="The following files are imported from the gnu-efi package."
+-file_tag+={adopted_r5_6,"^xen/include/efi/.*$"}
+-file_tag+={adopted_r5_6,"^xen/arch/x86/include/asm/x86_64/efibind\\.h$"}
+-file_tag+={adopted_r5_6,"^xen/arch/arm/include/asm/arm64/efibind\\.h$"}
+-config=MC3R1.R5.6,reports+={deliberate,"any_area(any_loc(file(adopted_r5_6)))"}
+-doc_end
+
 #
 # Series 7.
 #
diff --git a/docs/misra/deviations.rst b/docs/misra/deviations.rst
index 160513b997..8cec2c556c 100644
--- a/docs/misra/deviations.rst
+++ b/docs/misra/deviations.rst
@@ -90,6 +90,22 @@ Deviations related to MISRA C:2012 Rules:
          - __emulate_2op and __emulate_2op_nobyte
          - read_debugreg and write_debugreg
 
+   * - R5.6
+     - The type ret_t is deliberately defined multiple times depending on the
+       type of guest to service.
+     - Tagged as `deliberate` for ECLAIR.
+
+   * - R5.6
+     - Some files are not subject to respect MISRA rules at
+       the moment, but, among these out-of-scope files, there are definitions
+       of typedef names that are already defined within in-scope files and
+       therefore, ECLAIR does report a violation since not all the files
+       involved in the violation are excluded from the analysis.
+     - Tagged as `deliberate` for ECLAIR. Such excluded files are:
+         - xen/include/efi/.*
+         - xen/arch/x86/include/asm/x86_64/efibind.h
+         - xen/arch/arm/include/asm/arm64/efibind.h
+
    * - R7.1
      - It is safe to use certain octal constants the way they are defined
        in specifications, manuals, and algorithm descriptions. Such places
-- 
2.34.1


