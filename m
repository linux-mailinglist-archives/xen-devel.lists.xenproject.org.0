Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 588A196CA9D
	for <lists+xen-devel@lfdr.de>; Thu,  5 Sep 2024 00:55:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.790823.1200639 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1slyuf-0002hk-6D; Wed, 04 Sep 2024 22:55:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 790823.1200639; Wed, 04 Sep 2024 22:55:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1slyuf-0002WU-1F; Wed, 04 Sep 2024 22:55:45 +0000
Received: by outflank-mailman (input) for mailman id 790823;
 Wed, 04 Sep 2024 22:55:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=EFI/=QC=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1slyud-0001Vf-7h
 for xen-devel@lists.xenproject.org; Wed, 04 Sep 2024 22:55:43 +0000
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [2a00:1450:4864:20::62a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id cf5cbdc3-6b10-11ef-99a1-01e77a169b0f;
 Thu, 05 Sep 2024 00:55:41 +0200 (CEST)
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-a8a1acb51a7so23032366b.2
 for <xen-devel@lists.xenproject.org>; Wed, 04 Sep 2024 15:55:41 -0700 (PDT)
Received: from andrewcoop.eng.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a8a679755b3sm21546166b.146.2024.09.04.15.55.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Sep 2024 15:55:39 -0700 (PDT)
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
X-Inumbo-ID: cf5cbdc3-6b10-11ef-99a1-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1725490540; x=1726095340; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E3n388Uhg0XQDTfV4nLYdZiik4UbyUOd65XJSN8jK54=;
        b=OEhup2o3C7aTUhghggzLRqHF5Low3JUbap/QTqnXzB+8+okIH+x0fwwOyi3vEv38LW
         KKr69nKaPvcPqLLq22wHC9oBU2yLINTG6JVkV/0vE4wYYVy0MidxD2QMCaXvD2JiOV+0
         8SxmwhxRuMwUZxhMkDGg7XpztY3FNc5AgBIgg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725490540; x=1726095340;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=E3n388Uhg0XQDTfV4nLYdZiik4UbyUOd65XJSN8jK54=;
        b=eCdLcoSC3TCpnl6btTnNW/zBxM1tepHf+vDJaN+tNCMHrJFd2h3BwHcQqf/qGqPtlh
         +GDpfWNaRxpvXH3m+FLh9ZtmwYxIJMrwN8u/AfHRdanWYBHlTLMI1B4faKhkMQayh0Do
         W0rTjXDSaIYzcKxaXKS9NnmX1nvxWdV56gahXbhSJuFwc7lxhWAzUEGChPl9+SejPyXP
         cHIsdv51V5NBkC6NQttVd5sd24GOeI96dt66ET5BBKwcbVkA6vsaB5mH12lKaXoonyUq
         mJ08tMBawukRNxMi1wn3S0FJFzaC9hg79AHudiSjPdjLdBdAPk6+9N3TA3+CG6yrDoDO
         RUhw==
X-Gm-Message-State: AOJu0Yzvwv9EfYlF3Q6lCANBiD2RZ6K31Umhxv+37SNNHHAd+vbXz3es
	VJ/AyBokOM6jPJf0Ns81JBwtyg1qwxDrJGMqVDr10qzfZVXn+7RQyQOXm69zC9vXdXZBooEa5DP
	9
X-Google-Smtp-Source: AGHT+IFsy1512+ns/JGyojizKQVIyhHUss1SNREsuGlaOrNEgxRK8dU2eNOoRebKvEYupzzFvK+7KQ==
X-Received: by 2002:a17:907:944c:b0:a7a:bcbc:f7e1 with SMTP id a640c23a62f3a-a8a1d2c28afmr806550066b.15.1725490540492;
        Wed, 04 Sep 2024 15:55:40 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v3 5/5] x86/bitops: Use the POPCNT instruction when available
Date: Wed,  4 Sep 2024 23:55:30 +0100
Message-Id: <20240904225530.3888315-6-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240904225530.3888315-1-andrew.cooper3@citrix.com>
References: <20240904225530.3888315-1-andrew.cooper3@citrix.com>
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

v3:
 * Reinstate dropped CONFIG_SELF_TESTS
 * Leave grep fodder for CODE_FILL until we can find a nicer way of doing this.

v2:
 * Fix MISRA 8.2 (parameter name) and 8.5 (single declaration) regressions.
 * Rename {arch->x86}-generic-hweightl.{S->c}
 * Adjust ASM formating
---
 xen/arch/x86/include/asm/bitops.h | 23 ++++++++++
 xen/lib/Makefile                  |  1 +
 xen/lib/x86-generic-hweightl.c    | 71 +++++++++++++++++++++++++++++++
 3 files changed, 95 insertions(+)
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
index 000000000000..123a5b43928d
--- /dev/null
+++ b/xen/lib/x86-generic-hweightl.c
@@ -0,0 +1,71 @@
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
+    ".balign " STR(CONFIG_FUNCTION_ALIGNMENT) ", 0x90\n" /* CODE_FILL */
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
+#ifdef CONFIG_SELF_TESTS
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
+#endif
-- 
2.39.2


