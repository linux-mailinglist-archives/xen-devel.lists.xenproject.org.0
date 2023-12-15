Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C98D281444D
	for <lists+xen-devel@lfdr.de>; Fri, 15 Dec 2023 10:13:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.654971.1022563 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rE4Fp-0003EV-F4; Fri, 15 Dec 2023 09:13:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 654971.1022563; Fri, 15 Dec 2023 09:13:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rE4Fp-0003Bb-Bf; Fri, 15 Dec 2023 09:13:09 +0000
Received: by outflank-mailman (input) for mailman id 654971;
 Fri, 15 Dec 2023 09:13:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cTjp=H2=bugseng.com=federico.serafini@srs-se1.protection.inumbo.net>)
 id 1rE4Fn-0003BV-Cu
 for xen-devel@lists.xenproject.org; Fri, 15 Dec 2023 09:13:07 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 276848ab-9b2a-11ee-98ea-6d05b1d4d9a1;
 Fri, 15 Dec 2023 10:13:05 +0100 (CET)
Received: from Dell.bugseng.com (unknown [37.160.44.52])
 by support.bugseng.com (Postfix) with ESMTPSA id 554084EE073C;
 Fri, 15 Dec 2023 10:13:03 +0100 (CET)
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
X-Inumbo-ID: 276848ab-9b2a-11ee-98ea-6d05b1d4d9a1
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
Subject: [XEN PATCH] automation/eclair: update configuration of MISRA C:2012 Rule 5.6
Date: Fri, 15 Dec 2023 10:12:55 +0100
Message-Id: <ea8f782e7695b3ee235a89a8575a0af018bc85e4.1702629422.git.federico.serafini@bugseng.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Deviate typedef names that are delberately defined multiple times.

Update docs/misra/deviations.rst accordingly.

Tag Rule 5.6 as clean.

Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
---
 automation/eclair_analysis/ECLAIR/deviations.ecl | 6 ++++++
 automation/eclair_analysis/ECLAIR/tagging.ecl    | 2 +-
 docs/misra/deviations.rst                        | 7 +++++++
 3 files changed, 14 insertions(+), 1 deletion(-)

diff --git a/automation/eclair_analysis/ECLAIR/deviations.ecl b/automation/eclair_analysis/ECLAIR/deviations.ecl
index 683f2bbfe8..195ddddde8 100644
--- a/automation/eclair_analysis/ECLAIR/deviations.ecl
+++ b/automation/eclair_analysis/ECLAIR/deviations.ecl
@@ -90,6 +90,12 @@ depending on the guest."
 -config=MC3R1.R5.6,reports+={deliberate,"any_area(any_loc(text(^.*ret_t.*$)))"}
 -doc_end
 
+-doc_begin="On X86, the types \"guest_intpte_t\", \"guest_l1e_t\" and
+\"guest_l2e_t\" are deliberately defined multiple times, depending on the
+number of guest paging levels."
+-config=MC3R1.R5.6,reports+={deliberate,"any_area(any_loc(file(^xen/arch/x86/include/asm/guest_pt\\.h$)))&&any_area(any_loc(text(^.*(guest_intpte_t|guest_l[12]e_t).*$)))"}
+-doc_end
+
 -doc_begin="The following files are imported from the gnu-efi package."
 -file_tag+={adopted_r5_6,"^xen/include/efi/.*$"}
 -file_tag+={adopted_r5_6,"^xen/arch/.*/include/asm/.*/efibind\\.h$"}
diff --git a/automation/eclair_analysis/ECLAIR/tagging.ecl b/automation/eclair_analysis/ECLAIR/tagging.ecl
index d5d3bff396..900c532196 100644
--- a/automation/eclair_analysis/ECLAIR/tagging.ecl
+++ b/automation/eclair_analysis/ECLAIR/tagging.ecl
@@ -30,7 +30,7 @@
 
 -doc_begin="Clean guidelines: new violations for these guidelines are not accepted."
 
--service_selector={clean_guidelines_common,"MC3R1.D1.1||MC3R1.D2.1||MC3R1.D4.11||MC3R1.D4.14||MC3R1.R1.1||MC3R1.R1.3||MC3R1.R1.4||MC3R1.R2.2||MC3R1.R3.1||MC3R1.R3.2||MC3R1.R4.1||MC3R1.R4.2||MC3R1.R5.1||MC3R1.R5.2||MC3R1.R5.4||MC3R1.R6.1||MC3R1.R6.2||MC3R1.R7.1||MC3R1.R8.1||MC3R1.R8.5||MC3R1.R8.6||MC3R1.R8.8||MC3R1.R8.10||MC3R1.R8.12||MC3R1.R8.14||MC3R1.R9.2||MC3R1.R9.4||MC3R1.R9.5||MC3R1.R12.5||MC3R1.R17.3||MC3R1.R17.4||MC3R1.R17.6||MC3R1.R20.13||MC3R1.R20.14||MC3R1.R21.13||MC3R1.R21.19||MC3R1.R21.21||MC3R1.R22.2||MC3R1.R22.4||MC3R1.R22.5||MC3R1.R22.6"
+-service_selector={clean_guidelines_common,"MC3R1.D1.1||MC3R1.D2.1||MC3R1.D4.11||MC3R1.D4.14||MC3R1.R1.1||MC3R1.R1.3||MC3R1.R1.4||MC3R1.R2.2||MC3R1.R3.1||MC3R1.R3.2||MC3R1.R4.1||MC3R1.R4.2||MC3R1.R5.1||MC3R1.R5.2||MC3R1.R5.4||MC3R1.R5.6||MC3R1.R6.1||MC3R1.R6.2||MC3R1.R7.1||MC3R1.R8.1||MC3R1.R8.5||MC3R1.R8.6||MC3R1.R8.8||MC3R1.R8.10||MC3R1.R8.12||MC3R1.R8.14||MC3R1.R9.2||MC3R1.R9.4||MC3R1.R9.5||MC3R1.R12.5||MC3R1.R17.3||MC3R1.R17.4||MC3R1.R17.6||MC3R1.R20.13||MC3R1.R20.14||MC3R1.R21.13||MC3R1.R21.19||MC3R1.R21.21||MC3R1.R22.2||MC3R1.R22.4||MC3R1.R22.5||MC3R1.R22.6"
 }
 
 -setq=target,getenv("XEN_TARGET_ARCH")
diff --git a/docs/misra/deviations.rst b/docs/misra/deviations.rst
index eda3c8100c..5632685190 100644
--- a/docs/misra/deviations.rst
+++ b/docs/misra/deviations.rst
@@ -103,6 +103,13 @@ Deviations related to MISRA C:2012 Rules:
        type of guest to service.
      - Tagged as `deliberate` for ECLAIR.
 
+   * - R5.6
+     - On X86, some types are deliberately defined multiple times, depending on
+       the number of guest paging levels.
+     - Tagged as `deliberate` for ECLAIR. Such types are:
+         - guest_intpte
+         - guest_l[12]e_t
+
    * - R5.6
      - Some files are not subject to respect MISRA rules at
        the moment, but, among these out-of-scope files, there are definitions
-- 
2.34.1


