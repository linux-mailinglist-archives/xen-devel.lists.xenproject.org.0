Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EE1021A79D2
	for <lists+xen-devel@lfdr.de>; Tue, 14 Apr 2020 13:44:13 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jOJz5-0004qB-95; Tue, 14 Apr 2020 11:44:07 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=t7Uy=56=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jOJz3-0004py-93
 for xen-devel@lists.xenproject.org; Tue, 14 Apr 2020 11:44:05 +0000
X-Inumbo-ID: 3d9a9204-7e45-11ea-b58d-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3d9a9204-7e45-11ea-b58d-bc764e2007e4;
 Tue, 14 Apr 2020 11:44:04 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id CBF4BAC61;
 Tue, 14 Apr 2020 11:44:02 +0000 (UTC)
Subject: [PATCH v6 02/10] x86: move back clang no integrated assembler tests
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <d9a53b50-472d-477a-6275-ada0cb6e87e6@suse.com>
Message-ID: <8759f341-3677-84bb-a393-e1b82c0c76ff@suse.com>
Date: Tue, 14 Apr 2020 13:44:03 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <d9a53b50-472d-477a-6275-ada0cb6e87e6@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 Roger Pau Monne <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

This largely reverts f19af2f1138e ("x86: re-order clang no integrated
assembler tests"): Other CFLAGS setup would better happen first, in case
any of it affects the behavior of the integrated assembler. The comment
addition of course doesn't get undone. The only remaining as-option-add
invocation gets moved down in addition.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>
---
v5: Re-base.
v4: New.

--- a/xen/arch/x86/Rules.mk
+++ b/xen/arch/x86/Rules.mk
@@ -12,35 +12,8 @@ CFLAGS += '-D__OBJECT_LABEL__=$(subst /,
 # Prevent floating-point variables from creeping into Xen.
 CFLAGS += -msoft-float
 
-ifeq ($(CONFIG_CC_IS_CLANG),y)
-# Note: Any test which adds -no-integrated-as will cause subsequent tests to
-# succeed, and not trigger further additions.
-#
-# The tests to select whether the integrated assembler is usable need to happen
-# before testing any assembler features, or else the result of the tests would
-# be stale if the integrated assembler is not used.
-
-# Older clang's built-in assembler doesn't understand .skip with labels:
-# https://bugs.llvm.org/show_bug.cgi?id=27369
-$(call as-option-add,CFLAGS,CC,".L0: .L1: .skip (.L1 - .L0)",,\
-                     -no-integrated-as)
-
-# Check whether clang asm()-s support .include.
-$(call as-option-add,CFLAGS,CC,".include \"asm-x86/indirect_thunk_asm.h\"",,\
-                     -no-integrated-as)
-
-# Check whether clang keeps .macro-s between asm()-s:
-# https://bugs.llvm.org/show_bug.cgi?id=36110
-$(call as-option-add,CFLAGS,CC,\
-                     ".macro FOO;.endm"$$(close); asm volatile $$(open)".macro FOO;.endm",\
-                     -no-integrated-as)
-endif
-
 $(call cc-options-add,CFLAGS,CC,$(EMBEDDED_EXTRA_CFLAGS))
 $(call cc-option-add,CFLAGS,CC,-Wnested-externs)
-$(call as-option-add,CFLAGS,CC,".equ \"x\"$$(comma)1", \
-                     -U__OBJECT_LABEL__ -DHAVE_AS_QUOTED_SYM \
-                     '-D__OBJECT_LABEL__=$(subst $(BASEDIR)/,,$(CURDIR))/$$@')
 
 CFLAGS += -mno-red-zone -fpic -fno-asynchronous-unwind-tables
 
@@ -70,3 +43,30 @@ endif
 # Set up the assembler include path properly for older toolchains.
 CFLAGS += -Wa,-I$(BASEDIR)/include
 
+ifeq ($(CONFIG_CC_IS_CLANG),y)
+# Note: Any test which adds -no-integrated-as will cause subsequent tests to
+# succeed, and not trigger further additions.
+#
+# The tests to select whether the integrated assembler is usable need to happen
+# before testing any assembler features, or else the result of the tests would
+# be stale if the integrated assembler is not used.
+
+# Older clang's built-in assembler doesn't understand .skip with labels:
+# https://bugs.llvm.org/show_bug.cgi?id=27369
+$(call as-option-add,CFLAGS,CC,".L0: .L1: .skip (.L1 - .L0)",,\
+                     -no-integrated-as)
+
+# Check whether clang asm()-s support .include.
+$(call as-option-add,CFLAGS,CC,".include \"asm-x86/indirect_thunk_asm.h\"",,\
+                     -no-integrated-as)
+
+# Check whether clang keeps .macro-s between asm()-s:
+# https://bugs.llvm.org/show_bug.cgi?id=36110
+$(call as-option-add,CFLAGS,CC,\
+                     ".macro FOO;.endm"$$(close); asm volatile $$(open)".macro FOO;.endm",\
+                     -no-integrated-as)
+endif
+
+$(call as-option-add,CFLAGS,CC,".equ \"x\"$$(comma)1", \
+                     -U__OBJECT_LABEL__ -DHAVE_AS_QUOTED_SYM \
+                     '-D__OBJECT_LABEL__=$(subst $(BASEDIR)/,,$(CURDIR))/$$@')


