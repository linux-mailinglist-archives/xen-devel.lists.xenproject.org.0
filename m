Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 90D21887033
	for <lists+xen-devel@lfdr.de>; Fri, 22 Mar 2024 17:02:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.696961.1088285 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rnhLW-00030M-5z; Fri, 22 Mar 2024 16:02:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 696961.1088285; Fri, 22 Mar 2024 16:02:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rnhLV-0002uW-UZ; Fri, 22 Mar 2024 16:02:17 +0000
Received: by outflank-mailman (input) for mailman id 696961;
 Fri, 22 Mar 2024 16:02:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kYs8=K4=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1rnhLT-0000W5-W7
 for xen-devel@lists.xenproject.org; Fri, 22 Mar 2024 16:02:15 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8c10b010-e865-11ee-a1ee-f123f15fe8a2;
 Fri, 22 Mar 2024 17:02:13 +0100 (CET)
Received: from nico.bugseng.com (unknown [46.228.253.194])
 by support.bugseng.com (Postfix) with ESMTPSA id D0A7D4EE0C93;
 Fri, 22 Mar 2024 17:02:12 +0100 (CET)
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
X-Inumbo-ID: 8c10b010-e865-11ee-a1ee-f123f15fe8a2
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: nicola.vetrini@bugseng.com,
	xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org,
	michal.orzel@amd.com,
	xenia.ragiadakou@amd.com,
	ayan.kumar.halder@amd.com,
	consulting@bugseng.com,
	jbeulich@suse.com,
	andrew.cooper3@citrix.com,
	roger.pau@citrix.com,
	bertrand.marquis@arm.com,
	julien@xen.org
Subject: [XEN PATCH 10/11] x86/hvm: address violations of Rule 20.7
Date: Fri, 22 Mar 2024 17:01:59 +0100
Message-Id: <ba509584faf3e8c95bc39e0a68a52380330412f3.1711118582.git.nicola.vetrini@bugseng.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1711118582.git.nicola.vetrini@bugseng.com>
References: <cover.1711118582.git.nicola.vetrini@bugseng.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

MISRA C Rule 20.7 states: "Expressions resulting from the expansion
of macro parameters shall be enclosed in parentheses". Therefore, some
macro definitions should gain additional parentheses to ensure that all
current and future users will be safe with respect to expansions that
can possibly alter the semantics of the passed-in macro parameter.

No functional change.

Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
---
 xen/arch/x86/hvm/hvm.c              | 6 +++---
 xen/arch/x86/include/asm/hvm/save.h | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/xen/arch/x86/hvm/hvm.c b/xen/arch/x86/hvm/hvm.c
index c75959588c0e..0ce45b177cf4 100644
--- a/xen/arch/x86/hvm/hvm.c
+++ b/xen/arch/x86/hvm/hvm.c
@@ -1066,9 +1066,9 @@ static int cf_check hvm_load_cpu_ctxt(struct domain *d, hvm_domain_context_t *h)
     /* Older Xen versions used to save the segment arbytes directly 
      * from the VMCS on Intel hosts.  Detect this and rearrange them
      * into the struct segment_register format. */
-#define UNFOLD_ARBYTES(_r)                          \
-    if ( (_r & 0xf000) && !(_r & 0x0f00) )          \
-        _r = ((_r & 0xff) | ((_r >> 4) & 0xf00))
+#define UNFOLD_ARBYTES(_r)                              \
+    if ( ((_r) & 0xf000) && !((_r) & 0x0f00) )          \
+        (_r) = (((_r) & 0xff) | (((_r) >> 4) & 0xf00))
     UNFOLD_ARBYTES(ctxt.cs_arbytes);
     UNFOLD_ARBYTES(ctxt.ds_arbytes);
     UNFOLD_ARBYTES(ctxt.es_arbytes);
diff --git a/xen/arch/x86/include/asm/hvm/save.h b/xen/arch/x86/include/asm/hvm/save.h
index 04a47ffcc40a..2d4b591aa3e2 100644
--- a/xen/arch/x86/include/asm/hvm/save.h
+++ b/xen/arch/x86/include/asm/hvm/save.h
@@ -128,9 +128,9 @@ static int __init cf_check __hvm_register_##_x##_save_and_restore(void)   \
 {                                                                         \
     hvm_register_savevm(HVM_SAVE_CODE(_x),                                \
                         #_x,                                              \
-                        &_save,                                           \
+                        &(_save),                                         \
                         check,                                            \
-                        &_load,                                           \
+                        &(_load),                                         \
                         (_num) * (HVM_SAVE_LENGTH(_x)                     \
                                   + sizeof (struct hvm_save_descriptor)), \
                         _k);                                              \
-- 
2.34.1


