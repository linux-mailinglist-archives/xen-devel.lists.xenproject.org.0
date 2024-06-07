Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CE4C900CBC
	for <lists+xen-devel@lfdr.de>; Fri,  7 Jun 2024 22:13:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.736621.1142745 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sFfxq-0001pj-Uh; Fri, 07 Jun 2024 20:13:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 736621.1142745; Fri, 07 Jun 2024 20:13:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sFfxq-0001kO-Q2; Fri, 07 Jun 2024 20:13:30 +0000
Received: by outflank-mailman (input) for mailman id 736621;
 Fri, 07 Jun 2024 20:13:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ppZm=NJ=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1sFfxp-0001UP-Du
 for xen-devel@lists.xenproject.org; Fri, 07 Jun 2024 20:13:29 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 65bb4055-250a-11ef-b4bb-af5377834399;
 Fri, 07 Jun 2024 22:13:26 +0200 (CEST)
Received: from nico.bugseng.com (unknown [46.228.253.194])
 by support.bugseng.com (Postfix) with ESMTPSA id 59D804EE0743;
 Fri,  7 Jun 2024 22:13:24 +0200 (CEST)
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
X-Inumbo-ID: 65bb4055-250a-11ef-b4bb-af5377834399
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: nicola.vetrini@bugseng.com,
	xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org,
	michal.orzel@amd.com,
	xenia.ragiadakou@amd.com,
	ayan.kumar.halder@amd.com,
	consulting@bugseng.com,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: [XEN PATCH for-4.19 v2 1/3] x86/domain: deviate violation of MISRA C Rule 20.12
Date: Fri,  7 Jun 2024 22:13:16 +0200
Message-Id: <73f582e7b42e44980a79022d2f2937a33e7b37b7.1717790683.git.nicola.vetrini@bugseng.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1717790683.git.nicola.vetrini@bugseng.com>
References: <cover.1717790683.git.nicola.vetrini@bugseng.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

MISRA C Rule 20.12 states: "A macro parameter used as an operand to
the # or ## operators, which is itself subject to further macro replacement,
shall only be used as an operand to these operators".

In this case, builds where CONFIG_COMPAT=y the fpu_ctxt
macro is used both as a regular macro argument and as an operand for
stringification in the expansion of CHECK_FIELD_.
This is deviated using a SAF-x-safe comment.

No functional change.

Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
Acked-by: Jan Beulich <jbeulich@suse.com>
---
 docs/misra/safe.json  | 8 ++++++++
 xen/arch/x86/domain.c | 1 +
 xen/arch/x86/domctl.c | 1 +
 3 files changed, 10 insertions(+)

diff --git a/docs/misra/safe.json b/docs/misra/safe.json
index 9b13bcf71706..c213e0a0be3b 100644
--- a/docs/misra/safe.json
+++ b/docs/misra/safe.json
@@ -52,6 +52,14 @@
         },
         {
             "id": "SAF-6-safe",
+            "analyser": {
+                "eclair": "MC3R1.R20.12"
+            },
+            "name": "MC3R1.R20.12: use of a macro argument that deliberately violates the Rule",
+            "text": "A macro parameter that is itself a macro is intentionally used within the macro both as a regular parameter and for text replacement."
+        },
+        {
+            "id": "SAF-7-safe",
             "analyser": {},
             "name": "Sentinel",
             "text": "Next ID to be used"
diff --git a/xen/arch/x86/domain.c b/xen/arch/x86/domain.c
index 536542841ef5..ccadfe0c9e70 100644
--- a/xen/arch/x86/domain.c
+++ b/xen/arch/x86/domain.c
@@ -1084,6 +1084,7 @@ void arch_domain_creation_finished(struct domain *d)
 #ifdef CONFIG_COMPAT
 #define xen_vcpu_guest_context vcpu_guest_context
 #define fpu_ctxt fpu_ctxt.x
+/* SAF-6-safe Rule 20.12 expansion of macro fpu_ctxt with CONFIG_COMPAT */
 CHECK_FIELD_(struct, vcpu_guest_context, fpu_ctxt);
 #undef fpu_ctxt
 #undef xen_vcpu_guest_context
diff --git a/xen/arch/x86/domctl.c b/xen/arch/x86/domctl.c
index 9a72d57333e9..335aedf46d03 100644
--- a/xen/arch/x86/domctl.c
+++ b/xen/arch/x86/domctl.c
@@ -1326,6 +1326,7 @@ long arch_do_domctl(
 #ifdef CONFIG_COMPAT
 #define xen_vcpu_guest_context vcpu_guest_context
 #define fpu_ctxt fpu_ctxt.x
+/* SAF-6-safe Rule 20.12 expansion of macro fpu_ctxt with CONFIG_COMPAT */
 CHECK_FIELD_(struct, vcpu_guest_context, fpu_ctxt);
 #undef fpu_ctxt
 #undef xen_vcpu_guest_context
--
2.34.1

