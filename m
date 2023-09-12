Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 68F9979CC3A
	for <lists+xen-devel@lfdr.de>; Tue, 12 Sep 2023 11:46:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.600171.935814 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qfzyT-0005J2-8Y; Tue, 12 Sep 2023 09:46:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 600171.935814; Tue, 12 Sep 2023 09:46:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qfzyT-0005Ge-5l; Tue, 12 Sep 2023 09:46:25 +0000
Received: by outflank-mailman (input) for mailman id 600171;
 Tue, 12 Sep 2023 09:46:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=V3Pz=E4=bugseng.com=simone.ballarin@srs-se1.protection.inumbo.net>)
 id 1qfzrm-0008Jk-3v
 for xen-devel@lists.xenproject.org; Tue, 12 Sep 2023 09:39:30 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 42c29484-5150-11ee-9b0d-b553b5be7939;
 Tue, 12 Sep 2023 11:39:25 +0200 (CEST)
Received: from beta.station (net-93-66-137-131.cust.vodafonedsl.it
 [93.66.137.131])
 by support.bugseng.com (Postfix) with ESMTPSA id EA7B24EE0745;
 Tue, 12 Sep 2023 11:39:24 +0200 (CEST)
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
X-Inumbo-ID: 42c29484-5150-11ee-9b0d-b553b5be7939
From: Simone Ballarin <simone.ballarin@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com,
	sstabellini@kernel.org,
	Simone Ballarin <simone.ballarin@bugseng.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Wei Liu <wl@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [XEN PATCH v2 10/10] x86/asm: address violations of MISRA C:2012 Directive 4.10
Date: Tue, 12 Sep 2023 11:36:56 +0200
Message-Id: <1bab3ee9632be879244a405ee248f03392c58731.1694510856.git.simone.ballarin@bugseng.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1694510856.git.simone.ballarin@bugseng.com>
References: <cover.1694510856.git.simone.ballarin@bugseng.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Amend generation script, add inclusion guards to address violations
of MISRA C:2012 Directive 4.10 ("Precautions shall be taken in order
to prevent the contents of a header file being included more than
once").

This patch amends the Makefile adding the required inclusion guards
for xlat.h.

Add deviation comment for files intended for multiple inclusion.

Signed-off-by: Simone Ballarin <simone.ballarin@bugseng.com>

---
Changes in v2:
- merge patches 7/13 and 13/13 of v1 as they had the same
  commit message
- amend the Makefile to produce the required inclusion guard
- use the format introduced with doc/misra/safe.json instead of
  a generic text-based deviation
---
 docs/misra/safe.json                   | 8 ++++++++
 xen/arch/x86/include/asm/compat.h      | 5 +++++
 xen/arch/x86/include/asm/cpufeatures.h | 5 +----
 xen/arch/x86/include/asm/efibind.h     | 5 +++++
 xen/include/Makefile                   | 8 ++++++--
 5 files changed, 25 insertions(+), 6 deletions(-)

diff --git a/docs/misra/safe.json b/docs/misra/safe.json
index 0ec594f6bf..82c636ee94 100644
--- a/docs/misra/safe.json
+++ b/docs/misra/safe.json
@@ -44,6 +44,14 @@
         },
         {
             "id": "SAF-5-safe",
+            "analyser": {
+                "eclair": "MC3R1.D4.10"
+            },
+            "name": "Dir 4.10: file intended for multiple inclusion",
+            "text": "Files intended for multiple inclusion are not supposed to comply with D4.10."
+        },
+        {
+            "id": "SAF-6-safe",
             "analyser": {},
             "name": "Sentinel",
             "text": "Next ID to be used"
diff --git a/xen/arch/x86/include/asm/compat.h b/xen/arch/x86/include/asm/compat.h
index 818cad87db..3d3891d061 100644
--- a/xen/arch/x86/include/asm/compat.h
+++ b/xen/arch/x86/include/asm/compat.h
@@ -2,6 +2,9 @@
  * compat.h
  */
 
+#ifndef __ASM_X86_COMPAT_H__
+#define __ASM_X86_COMPAT_H__
+
 #ifdef CONFIG_COMPAT
 
 #define COMPAT_BITS_PER_LONG 32
@@ -18,3 +21,5 @@ int switch_compat(struct domain *);
 #include <xen/errno.h>
 static inline int switch_compat(struct domain *d) { return -EOPNOTSUPP; }
 #endif
+
+#endif /* __ASM_X86_COMPAT_H__ */
diff --git a/xen/arch/x86/include/asm/cpufeatures.h b/xen/arch/x86/include/asm/cpufeatures.h
index da0593de85..39b15e463a 100644
--- a/xen/arch/x86/include/asm/cpufeatures.h
+++ b/xen/arch/x86/include/asm/cpufeatures.h
@@ -1,7 +1,4 @@
-/*
- * Explicitly intended for multiple inclusion.
- */
-
+/* SAF-4-safe file intended for multiple inclusion */
 #include <xen/lib/x86/cpuid-autogen.h>
 
 /* Number of capability words covered by the featureset words. */
diff --git a/xen/arch/x86/include/asm/efibind.h b/xen/arch/x86/include/asm/efibind.h
index bce02f3707..f2eb8b5496 100644
--- a/xen/arch/x86/include/asm/efibind.h
+++ b/xen/arch/x86/include/asm/efibind.h
@@ -1,2 +1,7 @@
+#ifndef __ASM_X86_EFIBIND_H__
+#define __ASM_X86_EFIBIND_H__
+
 #include <xen/types.h>
 #include <asm/x86_64/efibind.h>
+
+#endif /* __ASM_X86_EFIBIND_H__ */
diff --git a/xen/include/Makefile b/xen/include/Makefile
index 31782fb177..b2f9576362 100644
--- a/xen/include/Makefile
+++ b/xen/include/Makefile
@@ -105,9 +105,13 @@ xlat-y := $(shell sed -ne 's,@arch@,$(compat-arch-y),g' -re 's,^[?!][[:blank:]]+
 xlat-y := $(filter $(patsubst compat/%,%,$(headers-y)),$(xlat-y))
 
 quiet_cmd_xlat_h = GEN     $@
-cmd_xlat_h = \
-	cat $(filter %.h,$^) >$@.new; \
+define cmd_xlat_h
+	echo "#ifndef _COMPAT_XLAT_H" > $@.new; \
+	echo "#define _COMPAT_XLAT_H" >> $@.new; \
+	cat $(filter %.h,$^) >> $@.new; \
+	echo "#endif /* _COMPAT_XLAT_H */" >> $@.new; \
 	mv -f $@.new $@
+endef
 
 $(obj)/compat/xlat.h: $(addprefix $(obj)/compat/.xlat/,$(xlat-y)) FORCE
 	$(call if_changed,xlat_h)
-- 
2.34.1


