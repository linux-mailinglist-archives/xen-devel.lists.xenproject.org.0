Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EE6957D51A9
	for <lists+xen-devel@lfdr.de>; Tue, 24 Oct 2023 15:23:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.621953.968940 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qvHNE-0000ke-EP; Tue, 24 Oct 2023 13:23:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 621953.968940; Tue, 24 Oct 2023 13:23:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qvHNE-0000iI-Bl; Tue, 24 Oct 2023 13:23:08 +0000
Received: by outflank-mailman (input) for mailman id 621953;
 Tue, 24 Oct 2023 13:23:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=urDo=GG=bugseng.com=federico.serafini@srs-se1.protection.inumbo.net>)
 id 1qvHNC-0000iB-Ck
 for xen-devel@lists.xenproject.org; Tue, 24 Oct 2023 13:23:06 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 76286e3a-7270-11ee-9b0e-b553b5be7939;
 Tue, 24 Oct 2023 15:23:04 +0200 (CEST)
Received: from Dell.homenet.telecomitalia.it
 (host-95-247-204-25.retail.telecomitalia.it [95.247.204.25])
 by support.bugseng.com (Postfix) with ESMTPSA id 358704EE0739;
 Tue, 24 Oct 2023 15:23:03 +0200 (CEST)
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
X-Inumbo-ID: 76286e3a-7270-11ee-9b0e-b553b5be7939
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
Subject: [XEN RFC] xen/automation: add deviations for MISRA C:2012 Rule 8.3
Date: Tue, 24 Oct 2023 15:22:31 +0200
Message-Id: <565552f9e7cfff56fb1d1037cfa9662a1818c5d3.1698153310.git.federico.serafini@bugseng.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Update ECLAIR configuration to deviate Rule 8.3 ("All declarations of
an object or function shall use the same names and type qualifiers")
for the following functions:
- set_px_pminfo();
- guest_walk_tables_[0-9]+_levels().

Update file docs/misra/deviations.rst accordingly.
No functional change.

Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
---
I had a discussion with Jan about the reasons behind the choice of parameter
name 'walk' for the definitions of functions guest_walk_tables_[0-9]+_levels()
and the parameter name 'pfec' for the corresponding declarations.
Also for the function set_px_pminfo(), it seems that the parameter names are
different on purpose.
Can I submit a patch with these deviations? Do you have any comments?
---
 automation/eclair_analysis/ECLAIR/deviations.ecl | 4 ++++
 docs/misra/deviations.rst                        | 7 +++++++
 2 files changed, 11 insertions(+)

diff --git a/automation/eclair_analysis/ECLAIR/deviations.ecl b/automation/eclair_analysis/ECLAIR/deviations.ecl
index d8170106b4..9485d66928 100644
--- a/automation/eclair_analysis/ECLAIR/deviations.ecl
+++ b/automation/eclair_analysis/ECLAIR/deviations.ecl
@@ -204,6 +204,10 @@ const-qualified."
 -config=MC3R1.R8.3,reports+={deliberate,"any_area(any_loc(file(adopted_mpparse_r8_3)))&&any_area(any_loc(file(^xen/arch/x86/include/asm/mpspec\\.h$)))"}
 -doc_end
 
+-doc_begin="For functions set_px_pminfo() and guest_walk_tables_[0-9]+_levels(), parameter names of definitions deliberately differ from the ones used in the corresponding declarations."
+-config=MC3R1.R8.3,declarations={deliberate,"^set_px_pminfo\\(uint32_t, struct xen_processor_performance\\*\\)|guest_walk_tables_[0-9]+_levels\\(const struct vcpu\\*, struct p2m_domain\\*, unsigned long, walk_t\\*, uint32_t, gfn_t, mfn_t, void\\*\\)$"}
+-doc_end
+
 -doc_begin="The following variables are compiled in multiple translation units
 belonging to different executables and therefore are safe."
 -config=MC3R1.R8.6,declarations+={safe, "name(current_stack_pointer||bsearch||sort)"}
diff --git a/docs/misra/deviations.rst b/docs/misra/deviations.rst
index 8511a18925..b5016412f6 100644
--- a/docs/misra/deviations.rst
+++ b/docs/misra/deviations.rst
@@ -121,6 +121,13 @@ Deviations related to MISRA C:2012 Rules:
          - xen/common/unxz.c
          - xen/common/unzstd.c
 
+   * - R8.3
+     - In some cases, parameter names used in the function definition
+       deliberately differ from the ones used in the corresponding declaration.
+     - Tagged as `deliberate` for ECLAIR. Such functions are:
+         - set_px_pminfo()
+         - guest_walk_tables_[0-9]+_levels()
+
    * - R8.4
      - The definitions present in the files 'asm-offsets.c' for any architecture
        are used to generate definitions for asm modules, and are not called by
-- 
2.34.1


