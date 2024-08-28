Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EE0C9963462
	for <lists+xen-devel@lfdr.de>; Thu, 29 Aug 2024 00:04:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.785174.1194673 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sjQlz-0000hz-Tw; Wed, 28 Aug 2024 22:04:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 785174.1194673; Wed, 28 Aug 2024 22:04:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sjQlz-0000dx-Gi; Wed, 28 Aug 2024 22:04:15 +0000
Received: by outflank-mailman (input) for mailman id 785174;
 Wed, 28 Aug 2024 22:04:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mQTD=P3=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1sjQlw-0006E0-Ub
 for xen-devel@lists.xenproject.org; Wed, 28 Aug 2024 22:04:12 +0000
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [2a00:1450:4864:20::535])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7505a605-6589-11ef-a0b0-8be0dac302b0;
 Thu, 29 Aug 2024 00:04:12 +0200 (CEST)
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-5c210e23573so1833151a12.0
 for <xen-devel@lists.xenproject.org>; Wed, 28 Aug 2024 15:04:12 -0700 (PDT)
Received: from andrewcoop.eng.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5c0bb1c2d2esm2695898a12.16.2024.08.28.15.04.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Aug 2024 15:04:10 -0700 (PDT)
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
X-Inumbo-ID: 7505a605-6589-11ef-a0b0-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1724882651; x=1725487451; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Sb7srVii8m7D5bOp7Td/YLt3PcEfAn83ipVBC8MF2p4=;
        b=CHV7GAiOq4okjKbi0Rb2cYBHQMAiXHFQzvejNaWJrcZ2pwRnodad6wjrwPTaVxOeui
         GqTpyUeVKoPjQ4LYDZp8l6Fejdg0NceeWEowYdTbAZ5X0JFV+xW7IbZ8yB2imj9vtK2T
         wT4wY+Fw0IhkMqriJSbT+COm/GmYM4+ymyW7k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724882651; x=1725487451;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Sb7srVii8m7D5bOp7Td/YLt3PcEfAn83ipVBC8MF2p4=;
        b=ACu1DtvWIdsVUd28HBx3S/HL8FOLk7ETO54iqr7twuirZh1wmcimFTkox9gRy9YLea
         CTk3BN7l1B4PcvFNmfagmY3TlVDArqCOFKVdFccUV74vzic5Qnw5cWeGI47ktym8oZhE
         MGuH43f05YWxOhyEiVa7mSS2vcTN0V4BEyucfD+YawMYZaJkb/4hzv36+Lw/yMTEmTq9
         WMRQdNU95O9+2APAMRb00qfYOz9LrtgEPFrfcqcDtVLN9Yj0SAmedEV7kmHmWUBP+UMX
         C/VT5oLagu+Wvs+iKW8SPTh4XTShA+pZdtzS8emMpMnZXA7JBaBc4PAIoGJYZQ3MVe1O
         fLbg==
X-Gm-Message-State: AOJu0YxbwWqF+aMTFhyZrruV/uiQ/a++sHmpkCNnxFUUfn/au9LHP2xl
	HYIGe0fluUVHdgzt1RlxOG1r9oWygZttoqjGIgUNU9m5K+w6nEIWnQnvDb+IfkblsdY77lEvNgZ
	O
X-Google-Smtp-Source: AGHT+IGKW3SvmGx+8Qmh8o8prGpaIiHhPr6Oq+77bbpVyS4CCBGopTL/2h4wnYqadHJpcMBYRKfyqw==
X-Received: by 2002:a05:6402:2554:b0:5be:ef1f:c679 with SMTP id 4fb4d7f45d1cf-5c21ed8e6c7mr686193a12.23.1724882650506;
        Wed, 28 Aug 2024 15:04:10 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v2 11/11] x86/bitops: Use the POPCNT instruction when available
Date: Wed, 28 Aug 2024 23:03:51 +0100
Message-Id: <20240828220351.2686408-12-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240828220351.2686408-1-andrew.cooper3@citrix.com>
References: <20240828220351.2686408-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

It has existed in x86 CPUs since 2008, so we're only 16 years late adding
support.  With all the other scafolding in place, implement arch_hweightl()
for x86.

The only complication is that the call to arch_generic_hweightl() is behind
the compilers back.  Address this by writing it in ASM and ensure that it
preserves all registers.

Copy the code generation from generic_hweightl().  It's not a complicated
algorithm, and is easy to regenerate if needs be, but cover it with the same
unit tests as test_generic_hweightl() just for piece of mind.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>

v2:
 * Fix MISRA 8.2 (parameter name) and 8.5 (single declaration) regressions.
 * Rename {arch->x86}-generic-hweightl.{S->c}
 * Adjust ASM formating

The __constructor trick to cause any reference to $foo() to pull in
test_$foo() only works when both are in the same TU.  i.e. what I did in
v1 (putting test_arch_generic_hweightl() in the regular generic-hweightl.c)
didn't work.

This in turn means that arch_generic_hweightl() needs writing in a global asm
block, and also that we can't use FUNC()/END().  While we could adjust it to
work for GCC/binutils, we can't have CPP macros in Clang-IAS strings.

I don't particularly like opencoding FUNC()/END(), but I can't think of
anything better.
---
 xen/arch/x86/include/asm/bitops.h | 23 +++++++++++
 xen/lib/Makefile                  |  1 +
 xen/lib/x86-generic-hweightl.c    | 69 +++++++++++++++++++++++++++++++
 3 files changed, 93 insertions(+)
 create mode 100644 xen/lib/x86-generic-hweightl.c

diff --git a/xen/arch/x86/include/asm/bitops.h b/xen/arch/x86/include/asm/bitops.h
index 642d8e58b288..39e37f1cbe55 100644
--- a/xen/arch/x86/include/asm/bitops.h
+++ b/xen/arch/x86/include/asm/bitops.h
@@ -6,6 +6,7 @@
  */
 
 #include <asm/alternative.h>
+#include <asm/asm_defns.h>
 #include <asm/cpufeatureset.h>
 
 /*
@@ -475,4 +476,26 @@ static always_inline unsigned int arch_flsl(unsigned long x)
 }
 #define arch_flsl arch_flsl
 
+unsigned int arch_generic_hweightl(unsigned long x);
+
+static always_inline unsigned int arch_hweightl(unsigned long x)
+{
+    unsigned int r;
+
+    /*
+     * arch_generic_hweightl() is written in ASM in order to preserve all
+     * registers, as the compiler can't see the call.
+     *
+     * This limits the POPCNT instruction to using the same ABI as a function
+     * call (input in %rdi, output in %eax) but that's fine.
+     */
+    alternative_io("call arch_generic_hweightl",
+                   "popcnt %[val], %q[res]", X86_FEATURE_POPCNT,
+                   ASM_OUTPUT2([res] "=a" (r) ASM_CALL_CONSTRAINT),
+                   [val] "D" (x));
+
+    return r;
+}
+#define arch_hweightl arch_hweightl
+
 #endif /* _X86_BITOPS_H */
diff --git a/xen/lib/Makefile b/xen/lib/Makefile
index b6558e108bd9..54440f628aae 100644
--- a/xen/lib/Makefile
+++ b/xen/lib/Makefile
@@ -36,6 +36,7 @@ lib-y += strtol.o
 lib-y += strtoll.o
 lib-y += strtoul.o
 lib-y += strtoull.o
+lib-$(CONFIG_X86) += x86-generic-hweightl.o
 lib-$(CONFIG_X86) += xxhash32.o
 lib-$(CONFIG_X86) += xxhash64.o
 
diff --git a/xen/lib/x86-generic-hweightl.c b/xen/lib/x86-generic-hweightl.c
new file mode 100644
index 000000000000..e0be25a01c1d
--- /dev/null
+++ b/xen/lib/x86-generic-hweightl.c
@@ -0,0 +1,69 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+
+#include <xen/bitops.h>
+#include <xen/init.h>
+#include <xen/self-tests.h>
+
+/*
+ * An implementation of generic_hweightl() used on hardware without the POPCNT
+ * instruction.
+ *
+ * This function is called from within an ALTERNATIVE in arch_hweightl().
+ * i.e. behind the back of the compiler.  Therefore all registers are callee
+ * preserved.
+ *
+ * The ASM is what GCC-12 emits for generic_hweightl() in a release build of
+ * Xen, with spilling of %rdi/%rdx to preserve the callers registers.
+ *
+ * Note: When we can use __attribute__((no_caller_saved_registers))
+ *       unconditionally (GCC 7, Clang 5), we can implement this in plain C.
+ */
+asm (
+    ".type arch_generic_hweightl, STT_FUNC\n\t"
+    ".globl arch_generic_hweightl\n\t"
+    ".hidden arch_generic_hweightl\n\t"
+    ".balign " STR(CONFIG_FUNCTION_ALIGNMENT) ", 0x90\n\t"
+    "arch_generic_hweightl:\n\t"
+
+    "push   %rdi\n\t"
+    "push   %rdx\n\t"
+
+    "movabs $0x5555555555555555, %rdx\n\t"
+    "mov    %rdi, %rax\n\t"
+    "shr    $1, %rax\n\t"
+    "and    %rdx, %rax\n\t"
+    "sub    %rax, %rdi\n\t"
+    "movabs $0x3333333333333333, %rax\n\t"
+    "mov    %rdi, %rdx\n\t"
+    "shr    $2, %rdi\n\t"
+    "and    %rax, %rdx\n\t"
+    "and    %rax, %rdi\n\t"
+    "add    %rdi, %rdx\n\t"
+    "mov    %rdx, %rax\n\t"
+    "shr    $4, %rax\n\t"
+    "add    %rdx, %rax\n\t"
+    "movabs $0x0f0f0f0f0f0f0f0f, %rdx\n\t"
+    "and    %rdx, %rax\n\t"
+    "movabs $0x0101010101010101, %rdx\n\t"
+    "imul   %rdx, %rax\n\t"
+    "shr    $" STR(BITS_PER_LONG) "- 8, %rax\n\t"
+
+    "pop    %rdx\n\t"
+    "pop    %rdi\n\t"
+
+    "ret\n\t"
+
+    ".size arch_generic_hweightl, . - arch_generic_hweightl\n\t"
+);
+
+static void __init __constructor test_arch_generic_hweightl(void)
+{
+    RUNTIME_CHECK(arch_generic_hweightl, 0, 0);
+    RUNTIME_CHECK(arch_generic_hweightl, 1, 1);
+    RUNTIME_CHECK(arch_generic_hweightl, 3, 2);
+    RUNTIME_CHECK(arch_generic_hweightl, 7, 3);
+    RUNTIME_CHECK(arch_generic_hweightl, 0xff, 8);
+
+    RUNTIME_CHECK(arch_generic_hweightl, 1 | (1UL << (BITS_PER_LONG - 1)), 2);
+    RUNTIME_CHECK(arch_generic_hweightl, -1UL, BITS_PER_LONG);
+}
-- 
2.39.2


