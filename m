Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B2BE6CA3A09
	for <lists+xen-devel@lfdr.de>; Thu, 04 Dec 2025 13:37:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1177629.1501878 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vR8aL-0007aS-QB; Thu, 04 Dec 2025 12:37:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1177629.1501878; Thu, 04 Dec 2025 12:37:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vR8aL-0007Ys-NJ; Thu, 04 Dec 2025 12:37:25 +0000
Received: by outflank-mailman (input) for mailman id 1177629;
 Thu, 04 Dec 2025 12:37:24 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dmukhin@xen.org>) id 1vR8aK-000783-4c
 for xen-devel@lists.xenproject.org; Thu, 04 Dec 2025 12:37:24 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <dmukhin@xen.org>) id 1vR8aJ-006XHq-1j;
 Thu, 04 Dec 2025 12:37:23 +0000
Received: from [19.12.91.86] (helo=localhost)
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <dmukhin@xen.org>) id 1vR8aI-003f92-2k;
 Thu, 04 Dec 2025 12:37:23 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:MIME-Version:References:
	In-Reply-To:Message-ID:Date:Subject:Cc:To:From;
	bh=s/LQz+Ny8Hleos9w4vzzFVh/9qQd0WL7V/RtNKKknKA=; b=fPEBJ0apMHurlkOfAHd/kxfgTN
	KAPqU7njjzofZ3m9pO7ZJ8t1IlGIa1cBba/vXz65VOUQQ0J4U2s/AqqCnnaIdisji7FrQ3b4WhDWk
	cxJakLlETBlTv2dfG2mZ6m1dIKbzGk5eLDP3CDXNOCDgWarqgoseV6v6xcaYFpt+T43I=;
From: dmukhin@xen.org
To: xen-devel@lists.xenproject.org
Cc: andrew.cooper3@citrix.com,
	anthony.perard@vates.tech,
	jbeulich@suse.com,
	julien@xen.org,
	michal.orzel@amd.com,
	roger.pau@citrix.com,
	sstabellini@kernel.org,
	dmukhin@ford.com
Subject: [PATCH v1 2/2] tests: introduce Tests.mk fragment
Date: Thu,  4 Dec 2025 04:37:12 -0800
Message-ID: <20251204123712.721443-3-dmukhin@ford.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251204123712.721443-1-dmukhin@ford.com>
References: <20251204123712.721443-1-dmukhin@ford.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Denis Mukhin <dmukhin@ford.com> 

Add new make fragment for unit tests with auto-generated test harness
dependencies.

Signed-off-by: Denis Mukhin <dmukhin@ford.com>
---
 tools/Tests.mk             | 34 ++++++++++++++++++++++++++++++++++
 tools/tests/domid/Makefile | 30 +-----------------------------
 2 files changed, 35 insertions(+), 29 deletions(-)
 create mode 100644 tools/Tests.mk

diff --git a/tools/Tests.mk b/tools/Tests.mk
new file mode 100644
index 000000000000..fe941209db0f
--- /dev/null
+++ b/tools/Tests.mk
@@ -0,0 +1,34 @@
+# SPDX-License-Identifier: GPL-2.0-only
+#
+# Unit test fragment.
+#
+# Copyright 2025 Ford Motor Company
+
+define list-c-headers
+$(shell sed -n \
+    's/^[ \t]*# *include[ \t]*[<"]\([^">]*\)[">].*/\1/p' $(1) 2>/dev/null)
+endef
+
+# $1 target
+# $2 list of test harnesses
+define emit-harness-nested-rule
+$(1): $(2)
+	mkdir -p $$(@D); \
+	for i in $$<; do ln -sf $$$$i $$@; done
+
+endef
+
+define emit-harness-rules
+$(foreach x,$(2),$(call \
+    emit-harness-nested-rule,$(CURDIR)/generated/$(x),$(CURDIR)/harness.h))
+$(1:.c=.o): $(addprefix $(CURDIR)/generated/,$(2))
+endef
+
+define emit-harness-deps
+$(if $(strip $(2)),$(call emit-harness-rules,$1,$2),)
+endef
+
+define vpath-with-harness-deps
+vpath $(1) $(2)
+$(call emit-harness-deps,$(1),$(call list-c-headers,$(2)$(1)))
+endef
diff --git a/tools/tests/domid/Makefile b/tools/tests/domid/Makefile
index 1a2129d20655..51a465ce6318 100644
--- a/tools/tests/domid/Makefile
+++ b/tools/tests/domid/Makefile
@@ -6,38 +6,10 @@
 
 XEN_ROOT=$(CURDIR)/../../..
 include $(XEN_ROOT)/tools/Rules.mk
+include $(XEN_ROOT)/tools/Tests.mk
 
 TESTS := test-domid
 
-define list-c-headers
-$(shell sed -n \
-    's/^[ \t]*# *include[ \t]*[<"]\([^">]*\)[">].*/\1/p' $(1) 2>/dev/null)
-endef
-
-# $1 target
-# $2 list of test harnesses
-define emit-harness-nested-rule
-$(1): $(2)
-	mkdir -p $$(@D); \
-	for i in $$<; do ln -sf $$$$i $$@; done
-
-endef
-
-define emit-harness-rules
-$(foreach x,$(2),$(call \
-    emit-harness-nested-rule,$(CURDIR)/generated/$(x),$(CURDIR)/harness.h))
-$(1:.c=.o): $(addprefix $(CURDIR)/generated/,$(2))
-endef
-
-define emit-harness-deps
-$(if $(strip $(2)),$(call emit-harness-rules,$1,$2),)
-endef
-
-define vpath-with-harness-deps
-vpath $(1) $(2)
-$(call emit-harness-deps,$(1),$(call list-c-headers,$(2)$(1)))
-endef
-
 .PHONY: all
 all: $(TESTS)
 
-- 
2.52.0


