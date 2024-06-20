Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D426991048D
	for <lists+xen-devel@lfdr.de>; Thu, 20 Jun 2024 14:51:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.744460.1151500 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sKHFW-0007q1-8W; Thu, 20 Jun 2024 12:50:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 744460.1151500; Thu, 20 Jun 2024 12:50:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sKHFW-0007nt-5x; Thu, 20 Jun 2024 12:50:46 +0000
Received: by outflank-mailman (input) for mailman id 744460;
 Thu, 20 Jun 2024 12:50:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fPla=NW=bugseng.com=federico.serafini@srs-se1.protection.inumbo.net>)
 id 1sKHFV-0007nn-LP
 for xen-devel@lists.xenproject.org; Thu, 20 Jun 2024 12:50:45 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b489d3e1-2f03-11ef-b4bb-af5377834399;
 Thu, 20 Jun 2024 14:50:43 +0200 (CEST)
Received: from truciolo.bugseng.com (unknown [78.208.165.219])
 by support.bugseng.com (Postfix) with ESMTPSA id 724A54EE0738;
 Thu, 20 Jun 2024 14:50:41 +0200 (CEST)
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
X-Inumbo-ID: b489d3e1-2f03-11ef-b4bb-af5377834399
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
Subject: [XEN PATCH] automation/eclair: add deviations of MISRA C Rule 5.5
Date: Thu, 20 Jun 2024 14:50:34 +0200
Message-Id: <dbd34e37b5d757ff7ae2a7318ad12b159970604c.1718887298.git.federico.serafini@bugseng.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

MISRA C Rule 5.5 states that "Identifiers shall be distinct from macro
names".

Update ECLAIR configuration to deviate:
- macros expanding to their own name;
- clashes between macros and non-callable entities;
- clashes related to the selection of specific implementations of string
  handling functions.

Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
---
 .../eclair_analysis/ECLAIR/deviations.ecl     | 16 ++++++++++++++
 docs/misra/deviations.rst                     | 21 +++++++++++++++++++
 2 files changed, 37 insertions(+)

diff --git a/automation/eclair_analysis/ECLAIR/deviations.ecl b/automation/eclair_analysis/ECLAIR/deviations.ecl
index e2653f77eb..9ad0e1f90a 100644
--- a/automation/eclair_analysis/ECLAIR/deviations.ecl
+++ b/automation/eclair_analysis/ECLAIR/deviations.ecl
@@ -90,6 +90,22 @@ conform to the directive."
 -config=MC3R1.R5.3,reports+={safe, "any_area(any_loc(any_exp(macro(^read_debugreg$))&&any_exp(macro(^write_debugreg$))))"}
 -doc_end
 
+-doc_begin="Macros expanding to their own identifier (e.g., \"#define x x\") are deliberate."
+-config=MC3R1.R5.5,reports+={deliberate, "all_area(macro(same_id_body())||!macro(!same_id_body()))"}
+-doc_end
+
+-doc_begin="There is no clash between function like macros and not callable objects."
+-config=MC3R1.R5.5,reports+={deliberate, "all_area(macro(function_like())||decl(any()))&&all_area(macro(any())||!decl(kind(function))&&!decl(__function_pointer_decls))"}
+-doc_end
+
+-doc_begin="Clashes between function names and macros are deliberate for string handling functions since some architectures may want to use their own arch-specific implementation."
+-config=MC3R1.R5.5,reports+={deliberate, "all_area(all_loc(file(^xen/arch/x86/string\\.c|xen/include/xen/string\\.h|xen/lib/.*$)))"}
+-doc_end
+
+-doc_begin="In libelf, clashes between macros and function names are deliberate and needed to prevent the use of undecorated versions of memcpy, memset and memmove."
+-config=MC3R1.R5.5,reports+={deliberate, "any_area(decl(kind(function))||any_loc(macro(name(memcpy||memset||memmove))))&&any_area(any_loc(file(^xen/common/libelf/libelf-private\\.h$)))"}
+-doc_end
+
 -doc_begin="The type \"ret_t\" is deliberately defined multiple times,
 depending on the guest."
 -config=MC3R1.R5.6,reports+={deliberate,"any_area(any_loc(text(^.*ret_t.*$)))"}
diff --git a/docs/misra/deviations.rst b/docs/misra/deviations.rst
index 36959aa44a..446c758c11 100644
--- a/docs/misra/deviations.rst
+++ b/docs/misra/deviations.rst
@@ -98,6 +98,27 @@ Deviations related to MISRA C:2012 Rules:
          - __emulate_2op and __emulate_2op_nobyte
          - read_debugreg and write_debugreg
 
+   * - R5.5
+     - Macros expanding to their own name are allowed.
+     - Tagged as `deliberate` for ECLAIR.
+
+   * - R5.5
+     - Clashes between names of function-like macros and identifiers of
+       non-callable entities are allowed.
+     - Tagged as `deliberate` for ECLAIR.
+
+   * - R5.5
+     - Clashes between function names and macros are deliberate for string
+       handling functions since some architectures may want to use their own
+       arch-specific implementation.
+     - Tagged as `deliberate` for ECLAIR.
+
+   * - R5.5
+     - In libelf, clashes between macros and function names are deliberate and
+       needed to prevent the use of undecorated versions of memcpy, memset and
+       memmove.
+     - Tagged as `deliberate` for ECLAIR.
+
    * - R5.6
      - The type ret_t is deliberately defined multiple times depending on the
        type of guest to service.
-- 
2.34.1


