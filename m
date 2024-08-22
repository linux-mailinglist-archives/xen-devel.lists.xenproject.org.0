Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E9E2795C13F
	for <lists+xen-devel@lfdr.de>; Fri, 23 Aug 2024 01:07:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.782010.1191552 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1shGtJ-0007BB-J9; Thu, 22 Aug 2024 23:06:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 782010.1191552; Thu, 22 Aug 2024 23:06:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1shGtJ-00077T-De; Thu, 22 Aug 2024 23:06:53 +0000
Received: by outflank-mailman (input) for mailman id 782010;
 Thu, 22 Aug 2024 23:06:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gAWf=PV=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1shGtH-0005x0-Pg
 for xen-devel@lists.xenproject.org; Thu, 22 Aug 2024 23:06:51 +0000
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [2a00:1450:4864:20::52f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 371f1151-60db-11ef-a50a-bb4a2ccca743;
 Fri, 23 Aug 2024 01:06:51 +0200 (CEST)
Received: by mail-ed1-x52f.google.com with SMTP id
 4fb4d7f45d1cf-5beb6ea9ed6so1825947a12.1
 for <xen-devel@lists.xenproject.org>; Thu, 22 Aug 2024 16:06:51 -0700 (PDT)
Received: from andrewcoop.eng.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a868f21ff19sm174676866b.39.2024.08.22.16.06.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Aug 2024 16:06:49 -0700 (PDT)
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
X-Inumbo-ID: 371f1151-60db-11ef-a50a-bb4a2ccca743
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1724368010; x=1724972810; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZhC0dDRFULppQVdbhtuL/Lf0g47WWxeU1SaqkI74Lp0=;
        b=XtvJAfOfBDSJuh0Kg5UoQx152wKatFwvNXiKWmjHWiWbatr+6rNuPIAHQlh9OmWy+S
         Pqyq/ClHwb8/DLQNWJCd+h79cUNOdLHhHTQBDgLUf9NYTpi5ew2UGjvQo5uahPDaCRtu
         RvRE46zQd6XkDi+zGVeOhCoAK5nSDiFXbMgGk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724368010; x=1724972810;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZhC0dDRFULppQVdbhtuL/Lf0g47WWxeU1SaqkI74Lp0=;
        b=QuT1nJvQgPIHP7u+tmFAiTCgefxIsQpYsN6t2zKMZn59wmisQ90eKc4fM86WaRXF6d
         gsDgOFh212bTkdH6+MN1/yEGzU78HLnu6iHrlYim5joGojZRJZNgqB0bNnrS3dfozhmn
         r3+6pCZlSnB+NdOrJRZKP1DXrHVzd4L1nqMb6YzLUUnuD+dNZssWnQc4yGn5y9CNHitQ
         C6Tc/WT5XA38JNmpHJIMKIq2HzVXjselzm5M+okNwgfPfp/inSmEXhkDSqGbdKaWY5Mv
         g1iT1ozXA3XQ5iEtG9oiJzKTb3ZY49XvE6I09yHUqnjzekrW/7jis69XeXUUW6B9GUbH
         ALKA==
X-Gm-Message-State: AOJu0YzL1122s+cnDldBiI+ThnUinfGk7uOQ90Ta8PR5GET+SbH6xtCS
	1nETXfkOwO0hJvf+4J7oUjdsiCP2j4em4p1FsfNtm2AUfhDi83977JLKCq16kNOxjdSzgPdEQud
	C
X-Google-Smtp-Source: AGHT+IHNUm/EcdxtV5dBXZ8zfI7oCAB0QZqAzhTQlqiAQ9Y/DTgEq1db+kf1Yi4Q4Xa0ZVfQM72mnA==
X-Received: by 2002:a17:907:6092:b0:a86:83c3:d5d0 with SMTP id a640c23a62f3a-a86a54b6ff9mr20615766b.59.1724368009670;
        Thu, 22 Aug 2024 16:06:49 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH 9/9] x86/bitops: Use the POPCNT instruction when available
Date: Fri, 23 Aug 2024 00:06:35 +0100
Message-Id: <20240822230635.954557-10-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240822230635.954557-1-andrew.cooper3@citrix.com>
References: <20240822230635.954557-1-andrew.cooper3@citrix.com>
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

A few RFC points.

 * I throught we had an x86 general lib-y but I can't find one, hence why it's
   still in xen/lib/ for now.

 * When we up the minimum toolchain to GCC 7 / Clang 5, we can use a
   __attribute__((no_caller_saved_registers)) and can forgo writing this in asm.

   GCC seems to need extra help, and wants -mgeneral-regs-only too.  It has a
   habit of complaining about incompatible instructions even when it's not
   emitting them.
---
 xen/arch/x86/include/asm/bitops.h | 21 ++++++++++++++
 xen/lib/Makefile                  |  1 +
 xen/lib/arch-generic-hweightl.S   | 46 +++++++++++++++++++++++++++++++
 xen/lib/generic-hweightl.c        | 15 ++++++++++
 4 files changed, 83 insertions(+)
 create mode 100644 xen/lib/arch-generic-hweightl.S

diff --git a/xen/arch/x86/include/asm/bitops.h b/xen/arch/x86/include/asm/bitops.h
index 642d8e58b288..0db698ed3f4c 100644
--- a/xen/arch/x86/include/asm/bitops.h
+++ b/xen/arch/x86/include/asm/bitops.h
@@ -6,6 +6,7 @@
  */
 
 #include <asm/alternative.h>
+#include <asm/asm_defns.h>
 #include <asm/cpufeatureset.h>
 
 /*
@@ -475,4 +476,24 @@ static always_inline unsigned int arch_flsl(unsigned long x)
 }
 #define arch_flsl arch_flsl
 
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
index b6558e108bd9..84d731dc0ac8 100644
--- a/xen/lib/Makefile
+++ b/xen/lib/Makefile
@@ -1,5 +1,6 @@
 obj-$(CONFIG_X86) += x86/
 
+lib-$(CONFIG_X86) += arch-generic-hweightl.o
 lib-y += bsearch.o
 lib-y += ctors.o
 lib-y += ctype.o
diff --git a/xen/lib/arch-generic-hweightl.S b/xen/lib/arch-generic-hweightl.S
new file mode 100644
index 000000000000..15c6e3394845
--- /dev/null
+++ b/xen/lib/arch-generic-hweightl.S
@@ -0,0 +1,46 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+
+        .file __FILE__
+
+#include <xen/linkage.h>
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
+ */
+FUNC(arch_generic_hweightl)
+        push   %rdi
+        push   %rdx
+
+        movabs $0x5555555555555555, %rdx
+        mov    %rdi, %rax
+        shr    $1, %rax
+        and    %rdx, %rax
+        sub    %rax, %rdi
+        movabs $0x3333333333333333, %rax
+        mov    %rdi, %rdx
+        shr    $0x2, %rdi
+        and    %rax, %rdx
+        and    %rax, %rdi
+        add    %rdi, %rdx
+        mov    %rdx, %rax
+        shr    $0x4, %rax
+        add    %rdx, %rax
+        movabs $0xf0f0f0f0f0f0f0f, %rdx
+        and    %rdx, %rax
+        movabs $0x101010101010101, %rdx
+        imul   %rdx, %rax
+        shr    $0x38, %rax
+
+        pop    %rdx
+        pop    %rdi
+
+        ret
+END(arch_generic_hweightl)
diff --git a/xen/lib/generic-hweightl.c b/xen/lib/generic-hweightl.c
index fa4bbec273ab..4b39dd84de5e 100644
--- a/xen/lib/generic-hweightl.c
+++ b/xen/lib/generic-hweightl.c
@@ -43,4 +43,19 @@ static void __init __constructor test_generic_hweightl(void)
     RUNTIME_CHECK(generic_hweightl, 1 | (1UL << (BITS_PER_LONG - 1)), 2);
     RUNTIME_CHECK(generic_hweightl, -1UL, BITS_PER_LONG);
 }
+
+#ifdef CONFIG_X86
+unsigned int arch_generic_hweightl(unsigned long);
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
+#endif /* CONFIG_X86 */
 #endif /* CONFIG_SELF_TESTS */
-- 
2.39.2


