Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 81C0F91E109
	for <lists+xen-devel@lfdr.de>; Mon,  1 Jul 2024 15:44:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.751642.1159664 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sOHKC-00079O-Ob; Mon, 01 Jul 2024 13:44:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 751642.1159664; Mon, 01 Jul 2024 13:44:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sOHKC-00076t-Le; Mon, 01 Jul 2024 13:44:08 +0000
Received: by outflank-mailman (input) for mailman id 751642;
 Mon, 01 Jul 2024 13:44:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FOPt=OB=bugseng.com=alessandro.zucchelli@srs-se1.protection.inumbo.net>)
 id 1sOHKA-0006bT-OL
 for xen-devel@lists.xenproject.org; Mon, 01 Jul 2024 13:44:06 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fb967457-37af-11ef-b4bb-af5377834399;
 Mon, 01 Jul 2024 15:44:05 +0200 (CEST)
Received: from delta.bugseng.com.homenet.telecomitalia.it
 (host-79-60-221-62.business.telecomitalia.it [79.60.221.62])
 by support.bugseng.com (Postfix) with ESMTPSA id 6CDC44EE0738;
 Mon,  1 Jul 2024 15:44:03 +0200 (CEST)
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
X-Inumbo-ID: fb967457-37af-11ef-b4bb-af5377834399
From: Alessandro Zucchelli <alessandro.zucchelli@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: nicola.vetrini@bugseng.com,
	consulting@bugseng.com,
	Maria Celeste Cesario <maria.celeste.cesario@bugseng.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH 12/17] xen: address violations of MISRA C:2012 Directive 4.10
Date: Mon,  1 Jul 2024 15:43:59 +0200
Message-Id: <8305a914d1f1ee01d1b0b83cb86c2a48a2a2be0b.1719829101.git.alessandro.zucchelli@bugseng.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1719829101.git.alessandro.zucchelli@bugseng.com>
References: <cover.1719829101.git.alessandro.zucchelli@bugseng.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Maria Celeste Cesario <maria.celeste.cesario@bugseng.com>

Modify creation rule for asm-offsets.h to conform to
the new standard and to not generate conflicting guards
between architectures (which is a violation of the directive).
Modify generic-y creation rule to generate code without violations
and to conform to the new standard.

Mechanical change.
---
Changes in v4:
- improve inclusion guard generation

Signed-off-by: Maria Celeste Cesario  <maria.celeste.cesario@bugseng.com>
Signed-off-by: Simone Ballarin  <simone.ballarin@bugseng.com>
Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
Signed-off-by: Alessandro Zucchelli <alessandro.zucchelli@bugseng.com>

---
 xen/build.mk                     | 7 ++++---
 xen/scripts/Makefile.asm-generic | 8 +++++++-
 2 files changed, 11 insertions(+), 4 deletions(-)

diff --git a/xen/build.mk b/xen/build.mk
index 0f490ca71b..bbd4c2970f 100644
--- a/xen/build.mk
+++ b/xen/build.mk
@@ -47,6 +47,7 @@ asm-offsets.s: arch/$(SRCARCH)/$(ARCH)/asm-offsets.c
 
 arch/$(SRCARCH)/include/asm/asm-offsets.h: asm-offsets.s
 	@(set -e; \
+	  guard=$$(echo ASM_${SRCARCH}_ASM_OFFSETS_H | tr a-z A-Z); \
 	  echo "/*"; \
 	  echo " * DO NOT MODIFY."; \
 	  echo " *"; \
@@ -54,12 +55,12 @@ arch/$(SRCARCH)/include/asm/asm-offsets.h: asm-offsets.s
 	  echo " *"; \
 	  echo " */"; \
 	  echo ""; \
-	  echo "#ifndef __ASM_OFFSETS_H__"; \
-	  echo "#define __ASM_OFFSETS_H__"; \
+	  echo "#ifndef $$guard"; \
+	  echo "#define $$guard"; \
 	  echo ""; \
 	  sed -rne "/^[^#].*==>/{s:.*==>(.*)<==.*:\1:; s: [\$$#]: :; p;}"; \
 	  echo ""; \
-	  echo "#endif") <$< >$@
+	  echo "#endif /* $$guard */") <$< >$@
 
 build-dirs := $(patsubst %/built_in.o,%,$(filter %/built_in.o,$(ALL_OBJS) $(ALL_LIBS)))
 
diff --git a/xen/scripts/Makefile.asm-generic b/xen/scripts/Makefile.asm-generic
index b0d356bfa3..5775acf44b 100644
--- a/xen/scripts/Makefile.asm-generic
+++ b/xen/scripts/Makefile.asm-generic
@@ -32,7 +32,13 @@ old-headers := $(wildcard $(obj)/*.h)
 unwanted    := $(filter-out $(generic-y) $(generated-y),$(old-headers))
 
 quiet_cmd_wrap = WRAP    $@
-      cmd_wrap = echo "\#include <asm-generic/$*.h>" > $@
+cmd_wrap = \
+    guard=$$(echo ASM_GENERIC_${SRCARCH}_$*_H | tr a-z A-Z); \
+    echo "\#ifndef $$guard" >$@.new; \
+    echo "\#define $$guard" >>$@.new; \
+    echo "\#include <asm-generic/$*.h>" >>$@.new; \
+    echo "\#endif /* $$guard */" >>$@.new; \
+    mv -f $@.new $@
 
 quiet_cmd_remove = REMOVE  $(unwanted)
       cmd_remove = rm -f $(unwanted)
-- 
2.34.1


