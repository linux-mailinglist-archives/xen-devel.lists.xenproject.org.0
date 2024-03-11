Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 42B6E877C28
	for <lists+xen-devel@lfdr.de>; Mon, 11 Mar 2024 10:00:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.691271.1077119 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rjbW9-0000HG-Ld; Mon, 11 Mar 2024 09:00:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 691271.1077119; Mon, 11 Mar 2024 09:00:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rjbW9-0008U8-3T; Mon, 11 Mar 2024 09:00:21 +0000
Received: by outflank-mailman (input) for mailman id 691271;
 Mon, 11 Mar 2024 09:00:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xWeI=KR=bugseng.com=simone.ballarin@srs-se1.protection.inumbo.net>)
 id 1rjbW6-0006j9-0j
 for xen-devel@lists.xenproject.org; Mon, 11 Mar 2024 09:00:18 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c7593b5a-df85-11ee-a1ee-f123f15fe8a2;
 Mon, 11 Mar 2024 10:00:16 +0100 (CET)
Received: from beta.station (net-93-144-106-196.cust.vodafonedsl.it
 [93.144.106.196])
 by support.bugseng.com (Postfix) with ESMTPSA id B42534EE0C90;
 Mon, 11 Mar 2024 10:00:15 +0100 (CET)
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
X-Inumbo-ID: c7593b5a-df85-11ee-a1ee-f123f15fe8a2
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
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Maria Celeste Cesario <maria.celeste.cesario@bugseng.com>
Subject: [XEN PATCH v3 10/16] x86/asm: address violations of MISRA C:2012 Directive 4.10
Date: Mon, 11 Mar 2024 09:59:19 +0100
Message-Id: <1e44047e767431c32621ae44d3121bc2152b3cb5.1710145041.git.simone.ballarin@bugseng.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1710145041.git.simone.ballarin@bugseng.com>
References: <cover.1710145041.git.simone.ballarin@bugseng.com>
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
Signed-off-by: Maria Celeste Cesario  <maria.celeste.cesario@bugseng.com>

---
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
 xen/include/Makefile                   | 10 ++++++++--
 5 files changed, 27 insertions(+), 6 deletions(-)

diff --git a/docs/misra/safe.json b/docs/misra/safe.json
index 363c9e21b0..13208d18ec 100644
--- a/docs/misra/safe.json
+++ b/docs/misra/safe.json
@@ -52,6 +52,14 @@
         },
         {
             "id": "SAF-6-safe",
+            "analyser": {
+                "eclair": "MC3R1.D4.10"
+            },
+            "name": "Dir 4.10: file intended for multiple inclusion",
+            "text": "Files intended for multiple inclusion are not supposed to comply with D4.10."
+        },
+        {
+            "id": "SAF-7-safe",
             "analyser": {},
             "name": "Sentinel",
             "text": "Next ID to be used"
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
index c3aad21c3b..a65754d553 100644
--- a/xen/arch/x86/include/asm/cpufeatures.h
+++ b/xen/arch/x86/include/asm/cpufeatures.h
@@ -1,7 +1,4 @@
-/*
- * Explicitly intended for multiple inclusion.
- */
-
+/* SAF-6-safe file intended for multiple inclusion */
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
index a77c9ffb7e..e777921eb1 100644
--- a/xen/include/Makefile
+++ b/xen/include/Makefile
@@ -104,10 +104,16 @@ $(obj)/compat/.xlat/%.lst: $(srcdir)/xlat.lst FORCE
 xlat-y := $(shell sed -ne 's,@arch@,$(compat-arch-y),g' -re 's,^[?!][[:blank:]]+[^[:blank:]]+[[:blank:]]+,,p' $(srcdir)/xlat.lst | uniq)
 xlat-y := $(filter $(patsubst compat/%,%,$(headers-y)),$(xlat-y))
 
+ARCHDIR = $(shell echo $(SRCARCH) | tr a-z A-Z)
+
 quiet_cmd_xlat_h = GEN     $@
-cmd_xlat_h = \
-	cat $(filter %.h,$^) >$@.new; \
+define cmd_xlat_h
+	echo "#ifndef ASM_$(ARCHDIR)_COMPAT_XLAT_H" > $@.new; \
+	echo "#define ASM_$(ARCHDIR)_COMPAT_XLAT_H" >> $@.new; \
+	cat $(filter %.h,$^) >> $@.new; \
+	echo "#endif /* ASM_$(ARCHDIR)_COMPAT_XLAT_H */" >> $@.new; \
 	mv -f $@.new $@
+endef
 
 $(obj)/compat/xlat.h: $(addprefix $(obj)/compat/.xlat/,$(xlat-y)) FORCE
 	$(call if_changed,xlat_h)
-- 
2.34.1


