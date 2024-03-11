Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 90328877C19
	for <lists+xen-devel@lfdr.de>; Mon, 11 Mar 2024 10:00:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.691270.1077128 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rjbWA-0000Te-I5; Mon, 11 Mar 2024 09:00:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 691270.1077128; Mon, 11 Mar 2024 09:00:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rjbW9-0000Ek-Tz; Mon, 11 Mar 2024 09:00:21 +0000
Received: by outflank-mailman (input) for mailman id 691270;
 Mon, 11 Mar 2024 09:00:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xWeI=KR=bugseng.com=simone.ballarin@srs-se1.protection.inumbo.net>)
 id 1rjbW6-0006iu-1H
 for xen-devel@lists.xenproject.org; Mon, 11 Mar 2024 09:00:18 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c7f9c963-df85-11ee-afdc-a90da7624cb6;
 Mon, 11 Mar 2024 10:00:17 +0100 (CET)
Received: from beta.station (net-93-144-106-196.cust.vodafonedsl.it
 [93.144.106.196])
 by support.bugseng.com (Postfix) with ESMTPSA id D11F94EE0C95;
 Mon, 11 Mar 2024 10:00:16 +0100 (CET)
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
X-Inumbo-ID: c7f9c963-df85-11ee-afdc-a90da7624cb6
From: Simone Ballarin <simone.ballarin@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com,
	sstabellini@kernel.org,
	Maria Celeste Cesario <maria.celeste.cesario@bugseng.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Wei Liu <wl@xen.org>,
	Simone Ballarin <simone.ballarin@bugseng.com>
Subject: [XEN PATCH v3 12/16] xen: address violations of MISRA C:2012 Directive 4.10
Date: Mon, 11 Mar 2024 09:59:21 +0100
Message-Id: <ab967347ae22d662c82962b1fdd6e6449bdd8c5e.1710145041.git.simone.ballarin@bugseng.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1710145041.git.simone.ballarin@bugseng.com>
References: <cover.1710145041.git.simone.ballarin@bugseng.com>
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
Commit introduced in v3

Signed-off-by: Maria Celeste Cesario  <maria.celeste.cesario@bugseng.com>
Signed-off-by: Simone Ballarin  <simone.ballarin@bugseng.com>
---
 xen/build.mk                     |  6 ++++--
 xen/scripts/Makefile.asm-generic | 16 +++++++++++++++-
 2 files changed, 19 insertions(+), 3 deletions(-)

diff --git a/xen/build.mk b/xen/build.mk
index 0f490ca71b..bd8b93e2ae 100644
--- a/xen/build.mk
+++ b/xen/build.mk
@@ -45,6 +45,8 @@ asm-offsets.s: arch/$(SRCARCH)/$(ARCH)/asm-offsets.c
 	$(CC) $(call cpp_flags,$(c_flags)) -S -g0 -o $@.new -MQ $@ $<
 	$(call move-if-changed,$@.new,$@)
 
+ARCHDIR = $(shell echo $(SRCARCH) | tr a-z A-Z)
+
 arch/$(SRCARCH)/include/asm/asm-offsets.h: asm-offsets.s
 	@(set -e; \
 	  echo "/*"; \
@@ -54,8 +56,8 @@ arch/$(SRCARCH)/include/asm/asm-offsets.h: asm-offsets.s
 	  echo " *"; \
 	  echo " */"; \
 	  echo ""; \
-	  echo "#ifndef __ASM_OFFSETS_H__"; \
-	  echo "#define __ASM_OFFSETS_H__"; \
+	  echo "#ifndef ASM_$(ARCHDIR)_ASM_OFFSETS_H"; \
+	  echo "#define ASM_$(ARCHDIR)_ASM_OFFSETS_H"; \
 	  echo ""; \
 	  sed -rne "/^[^#].*==>/{s:.*==>(.*)<==.*:\1:; s: [\$$#]: :; p;}"; \
 	  echo ""; \
diff --git a/xen/scripts/Makefile.asm-generic b/xen/scripts/Makefile.asm-generic
index b0d356bfa3..3b538bc7a4 100644
--- a/xen/scripts/Makefile.asm-generic
+++ b/xen/scripts/Makefile.asm-generic
@@ -31,8 +31,22 @@ generated-y := $(addprefix $(obj)/, $(generated-y))
 old-headers := $(wildcard $(obj)/*.h)
 unwanted    := $(filter-out $(generic-y) $(generated-y),$(old-headers))
 
+define header_stub
+#ifndef ASM_GENERIC_$(3)_$(2)_H
+#define ASM_GENERIC_$(3)_$(2)_H
+
+#include <asm-generic/$(1).h>
+
+#endif /* ASM_GENERIC_$(3)_$(2)_H */
+endef
+
+arch = $(shell echo $(SRCARCH) | tr a-z A-Z)
+
+header_body = $(call header_stub,$*,$(shell echo "$*" | tr a-z A-Z),$(arch))
+export header_body
+
 quiet_cmd_wrap = WRAP    $@
-      cmd_wrap = echo "\#include <asm-generic/$*.h>" > $@
+      cmd_wrap = echo "$$header_body" > $@
 
 quiet_cmd_remove = REMOVE  $(unwanted)
       cmd_remove = rm -f $(unwanted)
-- 
2.34.1


