Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B73291E0EA
	for <lists+xen-devel@lfdr.de>; Mon,  1 Jul 2024 15:37:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.751605.1159643 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sOHD9-0003c9-Qf; Mon, 01 Jul 2024 13:36:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 751605.1159643; Mon, 01 Jul 2024 13:36:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sOHD9-0003Yu-NX; Mon, 01 Jul 2024 13:36:51 +0000
Received: by outflank-mailman (input) for mailman id 751605;
 Mon, 01 Jul 2024 13:36:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FOPt=OB=bugseng.com=alessandro.zucchelli@srs-se1.protection.inumbo.net>)
 id 1sOHD8-0001bF-L7
 for xen-devel@lists.xenproject.org; Mon, 01 Jul 2024 13:36:50 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f78958ec-37ae-11ef-b4bb-af5377834399;
 Mon, 01 Jul 2024 15:36:49 +0200 (CEST)
Received: from delta.bugseng.com.homenet.telecomitalia.it
 (host-79-60-221-62.business.telecomitalia.it [79.60.221.62])
 by support.bugseng.com (Postfix) with ESMTPSA id 5B9064EE0749;
 Mon,  1 Jul 2024 15:36:45 +0200 (CEST)
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
X-Inumbo-ID: f78958ec-37ae-11ef-b4bb-af5377834399
From: Alessandro Zucchelli <alessandro.zucchelli@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: nicola.vetrini@bugseng.com,
	consulting@bugseng.com,
	Simone Ballarin <simone.ballarin@bugseng.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Alessandro Zucchelli <alessandro.zucchelli@bugseng.com>
Subject: [PATCH 10/17] x86/asm: address violations of MISRA C:2012 Directive 4.10
Date: Mon,  1 Jul 2024 15:36:05 +0200
Message-Id: <efb272c9eaad24875f34b396a75fed9577dedbda.1719829101.git.alessandro.zucchelli@bugseng.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1719829101.git.alessandro.zucchelli@bugseng.com>
References: <cover.1719829101.git.alessandro.zucchelli@bugseng.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Simone Ballarin <simone.ballarin@bugseng.com>

Amend generation script, add inclusion guards to address violations
of MISRA C:2012 Directive 4.10 ("Precautions shall be taken in order
to prevent the contents of a header file being included more than
once").

This patch amends the Makefile adding the required inclusion guards
for xlat.h.

Add deviation comment for files intended for multiple inclusion.

Signed-off-by: Simone Ballarin <simone.ballarin@bugseng.com>
Signed-off-by: Maria Celeste Cesario <maria.celeste.cesario@bugseng.com>
Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
Signed-off-by: Alessandro Zucchelli <alessandro.zucchelli@bugseng.com>

---
Changes in v4:
- changed guard creation for autogenerated headers in Makefile
Changes in v3:
- fix inconsistent deviation ID
- remove trailing underscores
Changes in v2:
- merge patches 7/13 and 13/13 of v1 as they had the same
  commit message
- amend the Makefile to produce the required inclusion guard
- use the format introduced with doc/misra/safe.json instead of
  a generic text-based deviation
---
 docs/misra/safe.json                   |  8 ++++++++
 xen/arch/x86/include/asm/compat.h      |  5 +++++
 xen/arch/x86/include/asm/cpufeatures.h |  5 +----
 xen/arch/x86/include/asm/efibind.h     |  5 +++++
 xen/include/Makefile                   | 11 +++++++++--
 5 files changed, 28 insertions(+), 6 deletions(-)

diff --git a/docs/misra/safe.json b/docs/misra/safe.json
index 3e9ebff8fe..0739eac806 100644
--- a/docs/misra/safe.json
+++ b/docs/misra/safe.json
@@ -90,6 +90,14 @@
             "name": "Dir 4.10: direct inclusion guard before",
             "text": "Headers with just the direct inclusion guard before the inclusion guard are safe."
         },
+        {
+            "id": "SAF-11-safe",
+            "analyser": {
+                "eclair": "MC3R1.D4.10"
+            },
+            "name": "Dir 4.10: file intended for multiple inclusion",
+            "text": "Files intended for multiple inclusion are not supposed to comply with D4.10."
+        },
         {
             "id": "SAF-11-safe",
             "analyser": {},
diff --git a/xen/arch/x86/include/asm/compat.h b/xen/arch/x86/include/asm/compat.h
index 818cad87db..36e7750843 100644
--- a/xen/arch/x86/include/asm/compat.h
+++ b/xen/arch/x86/include/asm/compat.h
@@ -2,6 +2,9 @@
  * compat.h
  */
 
+#ifndef ASM_X86_COMPAT_H
+#define ASM_X86_COMPAT_H
+
 #ifdef CONFIG_COMPAT
 
 #define COMPAT_BITS_PER_LONG 32
@@ -18,3 +21,5 @@ int switch_compat(struct domain *);
 #include <xen/errno.h>
 static inline int switch_compat(struct domain *d) { return -EOPNOTSUPP; }
 #endif
+
+#endif /* ASM_X86_COMPAT_H */
diff --git a/xen/arch/x86/include/asm/cpufeatures.h b/xen/arch/x86/include/asm/cpufeatures.h
index ba3df174b7..d590fe31ea 100644
--- a/xen/arch/x86/include/asm/cpufeatures.h
+++ b/xen/arch/x86/include/asm/cpufeatures.h
@@ -1,7 +1,4 @@
-/*
- * Explicitly intended for multiple inclusion.
- */
-
+/* SAF-11-safe file intended for multiple inclusion */
 #include <xen/lib/x86/cpuid-autogen.h>
 
 /* Number of capability words covered by the featureset words. */
diff --git a/xen/arch/x86/include/asm/efibind.h b/xen/arch/x86/include/asm/efibind.h
index bce02f3707..75684742be 100644
--- a/xen/arch/x86/include/asm/efibind.h
+++ b/xen/arch/x86/include/asm/efibind.h
@@ -1,2 +1,7 @@
+#ifndef ASM_X86_EFIBIND_H
+#define ASM_X86_EFIBIND_H
+
 #include <xen/types.h>
 #include <asm/x86_64/efibind.h>
+
+#endif /* ASM_X86_EFIBIND_H */
diff --git a/xen/include/Makefile b/xen/include/Makefile
index 058b0a566b..eccc2e017a 100644
--- a/xen/include/Makefile
+++ b/xen/include/Makefile
@@ -104,10 +104,17 @@ $(obj)/compat/.xlat/%.lst: $(srcdir)/xlat.lst FORCE
 xlat-y := $(shell sed -ne 's,@arch@,$(compat-arch-y),g' -re 's,^[?!][[:blank:]]+[^[:blank:]]+[[:blank:]]+,,p' $(srcdir)/xlat.lst | uniq)
 xlat-y := $(filter $(patsubst compat/%,%,$(headers-y)),$(xlat-y))
 
+ARCHDIR = $(shell echo $(SRCARCH) | tr a-z A-Z)
+
 quiet_cmd_xlat_h = GEN     $@
-cmd_xlat_h = \
-	cat $(filter %.h,$^) >$@.new; \
+define cmd_xlat_h
+	guard=$$(echo ASM_${SRCARCH}_COMPAT_XLAT_H | tr a-z A-Z); \
+	echo "#ifndef $$guard" > $@.new; \
+	echo "#define $$guard" >> $@.new; \
+	cat $(filter %.h,$^) >> $@.new; \
+	echo "#endif /* $$guard */" >> $@.new; \
 	mv -f $@.new $@
+endef
 
 $(obj)/compat/xlat.h: $(addprefix $(obj)/compat/.xlat/,$(xlat-y)) FORCE
 	$(call if_changed,xlat_h)
-- 
2.34.1


