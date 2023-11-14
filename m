Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 832F87EB514
	for <lists+xen-devel@lfdr.de>; Tue, 14 Nov 2023 17:42:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.633006.987535 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r2wUt-00069i-GM; Tue, 14 Nov 2023 16:42:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 633006.987535; Tue, 14 Nov 2023 16:42:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r2wUt-00066q-Cp; Tue, 14 Nov 2023 16:42:43 +0000
Received: by outflank-mailman (input) for mailman id 633006;
 Tue, 14 Nov 2023 16:42:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WRED=G3=bugseng.com=federico.serafini@srs-se1.protection.inumbo.net>)
 id 1r2wUs-00062s-Nr
 for xen-devel@lists.xenproject.org; Tue, 14 Nov 2023 16:42:42 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d38a24e8-830c-11ee-9b0e-b553b5be7939;
 Tue, 14 Nov 2023 17:42:40 +0100 (CET)
Received: from Dell.bugseng.com (unknown [37.163.92.152])
 by support.bugseng.com (Postfix) with ESMTPSA id 0ADA84EE0738;
 Tue, 14 Nov 2023 17:42:38 +0100 (CET)
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
X-Inumbo-ID: d38a24e8-830c-11ee-9b0e-b553b5be7939
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
Subject: [XEN PATCH v2] automation/eclair: add a deviation for MISRA C:2012 Rule 8.6
Date: Tue, 14 Nov 2023 17:42:31 +0100
Message-Id: <b9eee04bb7c6436f4951a8737eee60c68cda9df7.1699893554.git.federico.serafini@bugseng.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Update ECLAIR configuration to take into account the search
procedure adopted by Unix linkers.
Update deviations.rst accordingly and tag Rule 8.6 as "clean".

Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
---
Changes is v2:
  - deviation is based on xen/lib/*;
  - justification improved;
  - reflected changes to deviations.ecl;
  - tagged rule as "clean".
---
 automation/eclair_analysis/ECLAIR/deviations.ecl | 11 +++++++++++
 automation/eclair_analysis/ECLAIR/tagging.ecl    |  2 +-
 docs/misra/deviations.rst                        | 12 ++++++++++++
 3 files changed, 24 insertions(+), 1 deletion(-)

diff --git a/automation/eclair_analysis/ECLAIR/deviations.ecl b/automation/eclair_analysis/ECLAIR/deviations.ecl
index d8170106b4..d12ac2e28e 100644
--- a/automation/eclair_analysis/ECLAIR/deviations.ecl
+++ b/automation/eclair_analysis/ECLAIR/deviations.ecl
@@ -214,6 +214,17 @@ definition is compiled-out or optimized-out by the compiler)"
 -config=MC3R1.R8.6,reports+={deliberate, "first_area(^.*has no definition$)"}
 -doc_end
 
+-doc_begin="The search procedure for Unix linkers is well defined, see ld(1)
+manual: \"The linker will search an archive only once, at the location where it
+is specified on the command line. If the archive defines a symbol which was
+undefined in some object which appeared before the archive on the command line,
+the linker will include the appropriate file(s) from the archive\".
+In Xen, thanks to the order in which file names appear in the build commands,
+if arch-specific definitions are present, they get always linked in before
+searching in the lib.a archive resulting from xen/lib."
+-config=MC3R1.R8.6,declarations+={deliberate, "loc(file(^xen/lib/.*$))"}
+-doc_end
+
 -doc_begin="The gnu_inline attribute without static is deliberately allowed."
 -config=MC3R1.R8.10,declarations+={deliberate,"property(gnu_inline)"}
 -doc_end
diff --git a/automation/eclair_analysis/ECLAIR/tagging.ecl b/automation/eclair_analysis/ECLAIR/tagging.ecl
index 78a0bc948b..d0824830d7 100644
--- a/automation/eclair_analysis/ECLAIR/tagging.ecl
+++ b/automation/eclair_analysis/ECLAIR/tagging.ecl
@@ -30,7 +30,7 @@
 
 -doc_begin="Clean guidelines: new violations for these guidelines are not accepted."
 
--service_selector={clean_guidelines_common,"MC3R1.D1.1||MC3R1.D2.1||MC3R1.D4.11||MC3R1.D4.14||MC3R1.R1.1||MC3R1.R1.3||MC3R1.R1.4||MC3R1.R2.2||MC3R1.R3.1||MC3R1.R3.2||MC3R1.R4.1||MC3R1.R5.1||MC3R1.R5.2||MC3R1.R5.4||MC3R1.R6.1||MC3R1.R6.2||MC3R1.R7.1||MC3R1.R8.1||MC3R1.R8.5||MC3R1.R8.8||MC3R1.R8.10||MC3R1.R8.12||MC3R1.R8.14||MC3R1.R9.2||MC3R1.R9.4||MC3R1.R9.5||MC3R1.R12.5||MC3R1.R17.3||MC3R1.R17.4||MC3R1.R17.6||MC3R1.R21.13||MC3R1.R21.19||MC3R1.R21.21||MC3R1.R22.2||MC3R1.R22.4||MC3R1.R22.5||MC3R1.R22.6"
+-service_selector={clean_guidelines_common,"MC3R1.D1.1||MC3R1.D2.1||MC3R1.D4.11||MC3R1.D4.14||MC3R1.R1.1||MC3R1.R1.3||MC3R1.R1.4||MC3R1.R2.2||MC3R1.R3.1||MC3R1.R3.2||MC3R1.R4.1||MC3R1.R5.1||MC3R1.R5.2||MC3R1.R5.4||MC3R1.R6.1||MC3R1.R6.2||MC3R1.R7.1||MC3R1.R8.1||MC3R1.R8.5||MC3R1.R8.6||MC3R1.R8.8||MC3R1.R8.10||MC3R1.R8.12||MC3R1.R8.14||MC3R1.R9.2||MC3R1.R9.4||MC3R1.R9.5||MC3R1.R12.5||MC3R1.R17.3||MC3R1.R17.4||MC3R1.R17.6||MC3R1.R21.13||MC3R1.R21.19||MC3R1.R21.21||MC3R1.R22.2||MC3R1.R22.4||MC3R1.R22.5||MC3R1.R22.6"
 }
 
 -setq=target,getenv("XEN_TARGET_ARCH")
diff --git a/docs/misra/deviations.rst b/docs/misra/deviations.rst
index 8511a18925..0d18e33780 100644
--- a/docs/misra/deviations.rst
+++ b/docs/misra/deviations.rst
@@ -147,6 +147,18 @@ Deviations related to MISRA C:2012 Rules:
        definition is compiled-out or optimized-out by the compiler).
      - Tagged as `deliberate` in ECLAIR.
 
+   * - R8.6
+     - The search procedure for Unix linkers is well defined, see ld(1) manual:
+       "The linker will search an archive only once, at the location where it
+       is specified on the command line. If the archive defines a symbol which
+       was undefined in some object which appeared before the archive on the
+       command line, the linker will include the appropriate file(s) from the
+       archive".
+       In Xen, thanks to the order in which file names appear in the build
+       commands, if arch-specific definitions are present, they get always
+       linked in before searching in the lib.a archive resulting from xen/lib.
+     - Tagged as `deliberate` for ECLAIR.
+
    * - R8.10
      - The gnu_inline attribute without static is deliberately allowed.
      - Tagged as `deliberate` for ECLAIR.
-- 
2.34.1


