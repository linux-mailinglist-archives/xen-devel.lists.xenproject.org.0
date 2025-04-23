Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E115AA97BEE
	for <lists+xen-devel@lfdr.de>; Wed, 23 Apr 2025 03:03:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.963780.1354746 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u7OVp-0001mf-FG; Wed, 23 Apr 2025 01:02:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 963780.1354746; Wed, 23 Apr 2025 01:02:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u7OVp-0001k2-AW; Wed, 23 Apr 2025 01:02:53 +0000
Received: by outflank-mailman (input) for mailman id 963780;
 Wed, 23 Apr 2025 01:02:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dLR5=XJ=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1u7OVn-0000oH-2p
 for xen-devel@lists.xenproject.org; Wed, 23 Apr 2025 01:02:51 +0000
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [2a00:1450:4864:20::432])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id aa88e0c7-1fde-11f0-9eb0-5ba50f476ded;
 Wed, 23 Apr 2025 03:02:45 +0200 (CEST)
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-39c266c1389so4317299f8f.1
 for <xen-devel@lists.xenproject.org>; Tue, 22 Apr 2025 18:02:45 -0700 (PDT)
Received: from localhost.localdomain ([83.104.178.215])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-44092d2326dsm6707635e9.15.2025.04.22.18.02.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Apr 2025 18:02:43 -0700 (PDT)
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
X-Inumbo-ID: aa88e0c7-1fde-11f0-9eb0-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1745370165; x=1745974965; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4YZT122JRc5fL7nppkrV93A7BiGANzdSfpXbbRGCgmE=;
        b=nWczUQqGxDdDNCCmYnk9bryi/tXnXU6PjKOGgZhD5YohoeqKpt7WFAAn6h4xZJzqcB
         +r0Gco0nmxfctyp2WAq5ibHI+oACc977sfNWU+0/mZIRbRW1Ij0PC2wSS79MuWh4nuqN
         AFbsjKhFCDine4OA+Y+h7Kqea8Z1Wv5j8BsEE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745370165; x=1745974965;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4YZT122JRc5fL7nppkrV93A7BiGANzdSfpXbbRGCgmE=;
        b=gIMBh5euoWy5jDKiGsRJeuAocPK8dlCmXWXv3h2f4xqSJ1DoOBCuCdC+adz86Ebzih
         n4xPDQrT7ndJYdElRBCZhzAfyARu8jFbnJCXl86jbOCQPeQmO8bBlIuET2EGRIC6CPi/
         ZZyj//NNSf+NH40SneQPI5+tRGeNcZvgbQyZw/n1ID9pkjFf5K9l0FSDgiV0Duny2NoU
         IHhSwSENoskJKxwj4qaAkgP+BlCr0xsPmeo+n2fVTY1aByH6Amc9700giMJDCwzYRtbp
         yYw23SLaFQBQs+aUOGEyqfvPxBx7cY0kKGtGqtSR0IqAywMkjJKvW97uc7M9wq6AGFrv
         zpGA==
X-Gm-Message-State: AOJu0YxBVI06aH+Mv3wh1dNXQNTzy4PN09bjMuwpUHluBsYxORMPO/UN
	Bcku2o8XyVlRWuydQ2u0QPtySVv4PJQz8USJJnSsm8e6kzLfjPtdqhuJdoMasd7riOO5mCdBNFE
	9
X-Gm-Gg: ASbGncvW5ANDwyGRszGZfKp22qUArTq4veSmeSvCrAaFY/UnTT1rRheFXTYaP34ZaFS
	vMks9CEhjKjYtlxR23JuSKjRrV0/AcupE3piSmxCaeaVUcjeKoMkKDhyhUr/hH6UqXQx5rhOtSE
	rb5TgNBiv6bsrLPwlzfEYu3toRn38srb7HKj5Mj2DJTDH9P/1YqO8cUrDhdG5hsH+gmDxNqRLT/
	S+wQtqjj9DVQVioswFf/F1CiYD+ycThQjiiFl6YzAqa+GbjfWmaKPeTvUo1c/3m7dpJMc0gzD3w
	Wz9/QQz6bhtO+KkJROxY4yGreUR3Wj7e2AA0YJ3YalmLCi8YRoEN2a72oJGLRQ==
X-Google-Smtp-Source: AGHT+IEeZpTt1UmspNBku1CKlp8q4FyAU25r/v9pESJP2ptVpg/buA3gtThD0Ucrbd2+mu4iWWbp9w==
X-Received: by 2002:a5d:5f87:0:b0:391:29f:4f87 with SMTP id ffacd0b85a97d-39efbaee69fmr12718487f8f.49.1745370164518;
        Tue, 22 Apr 2025 18:02:44 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	"consulting @ bugseng . com" <consulting@bugseng.com>,
	Nicola Vetrini <nicola.vetrini@bugseng.com>
Subject: [PATCH 1/8] x86/altcall: Split alternative-call.h out of alternative.h
Date: Wed, 23 Apr 2025 02:02:30 +0100
Message-Id: <20250423010237.1528582-2-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250423010237.1528582-1-andrew.cooper3@citrix.com>
References: <20250423010237.1528582-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

... in preparation for changing how they're implemented.

Update the MISRA deviations with the new path.

No functional change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Anthony PERARD <anthony.perard@vates.tech>
CC: Michal Orzel <michal.orzel@amd.com>
CC: Jan Beulich <jbeulich@suse.com>
CC: Julien Grall <julien@xen.org>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: consulting@bugseng.com <consulting@bugseng.com>
CC: Nicola Vetrini <nicola.vetrini@bugseng.com>

In terms of naming, while tailcalls can technically be jumps, they're still
usually reasoned about as being calls.

It appears that everywhere else which needs alternative_{v,}call() gets it
transitively through hvm.h
---
 .../eclair_analysis/ECLAIR/deviations.ecl     |   4 +-
 .../asm/{alternative.h => alternative-call.h} | 171 +-----------
 xen/arch/x86/include/asm/alternative.h        | 262 ------------------
 xen/arch/x86/include/asm/hvm/hvm.h            |   2 +-
 xen/common/core_parking.c                     |   4 +-
 xen/include/xen/alternative-call.h            |  10 +-
 6 files changed, 16 insertions(+), 437 deletions(-)
 copy xen/arch/x86/include/asm/{alternative.h => alternative-call.h} (64%)

diff --git a/automation/eclair_analysis/ECLAIR/deviations.ecl b/automation/eclair_analysis/ECLAIR/deviations.ecl
index 2c8fb9271391..9c67358d4663 100644
--- a/automation/eclair_analysis/ECLAIR/deviations.ecl
+++ b/automation/eclair_analysis/ECLAIR/deviations.ecl
@@ -414,8 +414,8 @@ of the short-circuit evaluation strategy of such logical operators."
 -doc_end
 
 -doc_begin="Macros alternative_v?call[0-9] use sizeof and typeof to check that the argument types match the corresponding parameter ones."
--config=MC3A2.R13.6,reports+={deliberate,"any_area(any_loc(any_exp(macro(^alternative_vcall[0-9]$))&&file(^xen/arch/x86/include/asm/alternative\\.h*$)))"}
--config=B.UNEVALEFF,reports+={deliberate,"any_area(any_loc(any_exp(macro(^alternative_v?call[0-9]$))&&file(^xen/arch/x86/include/asm/alterantive\\.h*$)))"}
+-config=MC3A2.R13.6,reports+={deliberate,"any_area(any_loc(any_exp(macro(^alternative_vcall[0-9]$))&&file(^xen/arch/x86/include/asm/alternative-call\\.h*$)))"}
+-config=B.UNEVALEFF,reports+={deliberate,"any_area(any_loc(any_exp(macro(^alternative_v?call[0-9]$))&&file(^xen/arch/x86/include/asm/alterantive-call\\.h*$)))"}
 -doc_end
 
 -doc_begin="Anything, no matter how complicated, inside the BUILD_BUG_ON macro is subject to a compile-time evaluation without relevant side effects."
diff --git a/xen/arch/x86/include/asm/alternative.h b/xen/arch/x86/include/asm/alternative-call.h
similarity index 64%
copy from xen/arch/x86/include/asm/alternative.h
copy to xen/arch/x86/include/asm/alternative-call.h
index 7326ad942836..828ea32a9625 100644
--- a/xen/arch/x86/include/asm/alternative.h
+++ b/xen/arch/x86/include/asm/alternative-call.h
@@ -1,165 +1,8 @@
-#ifndef __X86_ALTERNATIVE_H__
-#define __X86_ALTERNATIVE_H__
+/* SPDX-License-Identifier: GPL-2.0-only */
+#ifndef X86_ALTERNATIVE_CALL_H
+#define X86_ALTERNATIVE_CALL_H
 
-#ifdef __ASSEMBLY__
-#include <asm/alternative-asm.h>
-#else
-
-#include <xen/macros.h>
-#include <xen/types.h>
-
-#include <asm/asm-macros.h>
-#include <asm/cpufeatureset.h>
-
-struct __packed alt_instr {
-    int32_t  orig_offset;   /* original instruction */
-    int32_t  repl_offset;   /* offset to replacement instruction */
-    uint16_t cpuid;         /* cpuid bit set for replacement */
-    uint8_t  orig_len;      /* length of original instruction */
-    uint8_t  repl_len;      /* length of new instruction */
-    uint8_t  pad_len;       /* length of build-time padding */
-    uint8_t  priv;          /* Private, for use by apply_alternatives() */
-};
-
-#define __ALT_PTR(a,f)      ((uint8_t *)((void *)&(a)->f + (a)->f))
-#define ALT_ORIG_PTR(a)     __ALT_PTR(a, orig_offset)
-#define ALT_REPL_PTR(a)     __ALT_PTR(a, repl_offset)
-
-extern void add_nops(void *insns, unsigned int len);
-/* Similar to alternative_instructions except it can be run with IRQs enabled. */
-extern int apply_alternatives(struct alt_instr *start, struct alt_instr *end);
-extern void alternative_instructions(void);
-extern void alternative_branches(void);
-
-#define alt_orig_len       "(.LXEN%=_orig_e - .LXEN%=_orig_s)"
-#define alt_pad_len        "(.LXEN%=_orig_p - .LXEN%=_orig_e)"
-#define alt_total_len      "(.LXEN%=_orig_p - .LXEN%=_orig_s)"
-#define alt_repl_s(num)    ".LXEN%=_repl_s"#num
-#define alt_repl_e(num)    ".LXEN%=_repl_e"#num
-#define alt_repl_len(num)  "(" alt_repl_e(num) " - " alt_repl_s(num) ")"
-
-/*
- * GAS's idea of true is sometimes 1 and sometimes -1, while Clang's idea
- * was consistently 1 up to 6.x (it matches GAS's now).  Transform it to
- * uniformly 1.
- */
-#define AS_TRUE(x) "((" x ") & 1)"
-
-#define as_max(a, b) "(("a") ^ ((("a") ^ ("b")) & -("AS_TRUE("("a") < ("b")")")))"
-
-#define OLDINSTR(oldinstr, padding)                              \
-    ".LXEN%=_orig_s:\n\t" oldinstr "\n .LXEN%=_orig_e:\n\t"      \
-    ".LXEN%=_diff = " padding "\n\t"                             \
-    "mknops ("AS_TRUE(".LXEN%=_diff > 0")" * .LXEN%=_diff)\n\t"  \
-    ".LXEN%=_orig_p:\n\t"
-
-#define OLDINSTR_1(oldinstr, n1)                                 \
-    OLDINSTR(oldinstr, alt_repl_len(n1) "-" alt_orig_len)
-
-#define OLDINSTR_2(oldinstr, n1, n2)                             \
-    OLDINSTR(oldinstr,                                           \
-             as_max(alt_repl_len(n1),                            \
-                    alt_repl_len(n2)) "-" alt_orig_len)
-
-#define ALTINSTR_ENTRY(feature, num)                                    \
-        " .if " STR(feature) " >= " STR(NCAPINTS * 32) "\n"             \
-        " .error \"alternative feature outside of featureset range\"\n" \
-        " .endif\n"                                                     \
-        " .long .LXEN%=_orig_s - .\n"             /* label           */ \
-        " .long " alt_repl_s(num)" - .\n"         /* new instruction */ \
-        " .word " STR(feature) "\n"               /* feature bit     */ \
-        " .byte " alt_orig_len "\n"               /* source len      */ \
-        " .byte " alt_repl_len(num) "\n"          /* replacement len */ \
-        " .byte " alt_pad_len "\n"                /* padding len     */ \
-        " .byte 0\n"                              /* priv            */
-
-#define DISCARD_ENTRY(num)                        /* repl <= total */   \
-        " .byte 0xff + (" alt_repl_len(num) ") - (" alt_total_len ")\n"
-
-#define ALTINSTR_REPLACEMENT(newinstr, num)       /* replacement */     \
-        alt_repl_s(num)":\n\t" newinstr "\n" alt_repl_e(num) ":\n\t"
-
-/* alternative assembly primitive: */
-#define ALTERNATIVE(oldinstr, newinstr, feature)                        \
-        OLDINSTR_1(oldinstr, 1)                                         \
-        ".pushsection .altinstructions, \"a\", @progbits\n"             \
-        ALTINSTR_ENTRY(feature, 1)                                      \
-        ".section .discard, \"a\", @progbits\n"                         \
-        ".byte " alt_total_len "\n" /* total_len <= 255 */              \
-        DISCARD_ENTRY(1)                                                \
-        ".section .altinstr_replacement, \"ax\", @progbits\n"           \
-        ALTINSTR_REPLACEMENT(newinstr, 1)                               \
-        ".popsection\n"
-
-#define ALTERNATIVE_2(oldinstr, newinstr1, feature1, newinstr2, feature2) \
-        OLDINSTR_2(oldinstr, 1, 2)                                      \
-        ".pushsection .altinstructions, \"a\", @progbits\n"             \
-        ALTINSTR_ENTRY(feature1, 1)                                     \
-        ALTINSTR_ENTRY(feature2, 2)                                     \
-        ".section .discard, \"a\", @progbits\n"                         \
-        ".byte " alt_total_len "\n" /* total_len <= 255 */              \
-        DISCARD_ENTRY(1)                                                \
-        DISCARD_ENTRY(2)                                                \
-        ".section .altinstr_replacement, \"ax\", @progbits\n"           \
-        ALTINSTR_REPLACEMENT(newinstr1, 1)                              \
-        ALTINSTR_REPLACEMENT(newinstr2, 2)                              \
-        ".popsection\n"
-
-/*
- * Alternative instructions for different CPU types or capabilities.
- *
- * This allows to use optimized instructions even on generic binary
- * kernels.
- *
- * length of oldinstr must be longer or equal the length of newinstr
- * It can be padded with nops as needed.
- *
- * For non barrier like inlines please define new variants
- * without volatile and memory clobber.
- */
-#define alternative(oldinstr, newinstr, feature)                        \
-        asm volatile (ALTERNATIVE(oldinstr, newinstr, feature) : : : "memory")
-
-#define alternative_2(oldinstr, newinstr1, feature1, newinstr2, feature2) \
-	asm volatile (ALTERNATIVE_2(oldinstr, newinstr1, feature1,	\
-				    newinstr2, feature2)		\
-		      : : : "memory")
-
-/*
- * Alternative inline assembly with input.
- *
- * Pecularities:
- * No memory clobber here.
- * Argument numbers start with 1.
- * Best is to use constraints that are fixed size (like (%1) ... "r")
- * If you use variable sized constraints like "m" or "g" in the
- * replacement make sure to pad to the worst case length.
- */
-#define alternative_input(oldinstr, newinstr, feature, input...)	\
-	asm volatile (ALTERNATIVE(oldinstr, newinstr, feature)		\
-		      : : input)
-
-/* Like alternative_input, but with a single output argument */
-#define alternative_io(oldinstr, newinstr, feature, output, input...)	\
-	asm volatile (ALTERNATIVE(oldinstr, newinstr, feature)		\
-		      : output : input)
-
-/*
- * This is similar to alternative_io. But it has two features and
- * respective instructions.
- *
- * If CPU has feature2, newinstr2 is used.
- * Otherwise, if CPU has feature1, newinstr1 is used.
- * Otherwise, oldinstr is used.
- */
-#define alternative_io_2(oldinstr, newinstr1, feature1, newinstr2,	\
-			 feature2, output, input...)			\
-	asm volatile(ALTERNATIVE_2(oldinstr, newinstr1, feature1,	\
-				   newinstr2, feature2)			\
-		     : output : input)
-
-/* Use this macro(s) if you need more than one output parameter. */
-#define ASM_OUTPUT2(a...) a
+#include <asm/alternative.h>
 
 /*
  * Machinery to allow converting indirect to direct calls, when the called
@@ -303,7 +146,7 @@ extern void alternative_branches(void);
 })
 
 #define alternative_call3(func, arg1, arg2, arg3) ({     \
-    typeof(arg1) v1_ = (arg1);                            \
+    typeof(arg1) v1_ = (arg1);                           \
     typeof(arg2) v2_ = (arg2);                           \
     typeof(arg3) v3_ = (arg3);                           \
     ALT_CALL_ARG(v1_, 1);                                \
@@ -423,6 +266,4 @@ extern void alternative_branches(void);
 #define alternative_call(func, args...) \
     alternative_call_(count_args(args))(func, ## args)
 
-#endif /*  !__ASSEMBLY__  */
-
-#endif /* __X86_ALTERNATIVE_H__ */
+#endif /* X86_ALTERNATIVE_CALL_H */
diff --git a/xen/arch/x86/include/asm/alternative.h b/xen/arch/x86/include/asm/alternative.h
index 7326ad942836..2d2ace97f794 100644
--- a/xen/arch/x86/include/asm/alternative.h
+++ b/xen/arch/x86/include/asm/alternative.h
@@ -161,268 +161,6 @@ extern void alternative_branches(void);
 /* Use this macro(s) if you need more than one output parameter. */
 #define ASM_OUTPUT2(a...) a
 
-/*
- * Machinery to allow converting indirect to direct calls, when the called
- * function is determined once at boot and later never changed.
- */
-
-#define ALT_CALL_arg1 "rdi"
-#define ALT_CALL_arg2 "rsi"
-#define ALT_CALL_arg3 "rdx"
-#define ALT_CALL_arg4 "rcx"
-#define ALT_CALL_arg5 "r8"
-#define ALT_CALL_arg6 "r9"
-
-#ifdef CONFIG_CC_IS_CLANG
-/*
- * Clang doesn't follow the psABI and doesn't truncate parameter values at the
- * callee.  This can lead to bad code being generated when using alternative
- * calls.
- *
- * Workaround it by using a temporary intermediate variable that's zeroed
- * before being assigned the parameter value, as that forces clang to zero the
- * register at the caller.
- *
- * This has been reported upstream:
- * https://github.com/llvm/llvm-project/issues/12579
- * https://github.com/llvm/llvm-project/issues/82598
- */
-#define ALT_CALL_ARG(arg, n)                                            \
-    register unsigned long a ## n ## _ asm ( ALT_CALL_arg ## n ) = ({   \
-        unsigned long tmp = 0;                                          \
-        BUILD_BUG_ON(sizeof(arg) > sizeof(unsigned long));              \
-        *(typeof(arg) *)&tmp = (arg);                                   \
-        tmp;                                                            \
-    })
-#else
-#define ALT_CALL_ARG(arg, n) \
-    register typeof(arg) a ## n ## _ asm ( ALT_CALL_arg ## n ) = \
-        ({ BUILD_BUG_ON(sizeof(arg) > sizeof(void *)); (arg); })
-#endif
-#define ALT_CALL_NO_ARG(n) \
-    register unsigned long a ## n ## _ asm ( ALT_CALL_arg ## n )
-
-#define ALT_CALL_NO_ARG6 ALT_CALL_NO_ARG(6)
-#define ALT_CALL_NO_ARG5 ALT_CALL_NO_ARG(5); ALT_CALL_NO_ARG6
-#define ALT_CALL_NO_ARG4 ALT_CALL_NO_ARG(4); ALT_CALL_NO_ARG5
-#define ALT_CALL_NO_ARG3 ALT_CALL_NO_ARG(3); ALT_CALL_NO_ARG4
-#define ALT_CALL_NO_ARG2 ALT_CALL_NO_ARG(2); ALT_CALL_NO_ARG3
-#define ALT_CALL_NO_ARG1 ALT_CALL_NO_ARG(1); ALT_CALL_NO_ARG2
-
-/*
- * Unfortunately ALT_CALL_NO_ARG() above can't use a fake initializer (to
- * suppress "uninitialized variable" warnings), as various versions of gcc
- * older than 8.1 fall on the nose in various ways with that (always because
- * of some other construct elsewhere in the same function needing to use the
- * same hard register). Otherwise the asm() below could uniformly use "+r"
- * output constraints, making unnecessary all these ALT_CALL<n>_OUT macros.
- */
-#define ALT_CALL0_OUT "=r" (a1_), "=r" (a2_), "=r" (a3_), \
-                      "=r" (a4_), "=r" (a5_), "=r" (a6_)
-#define ALT_CALL1_OUT "+r" (a1_), "=r" (a2_), "=r" (a3_), \
-                      "=r" (a4_), "=r" (a5_), "=r" (a6_)
-#define ALT_CALL2_OUT "+r" (a1_), "+r" (a2_), "=r" (a3_), \
-                      "=r" (a4_), "=r" (a5_), "=r" (a6_)
-#define ALT_CALL3_OUT "+r" (a1_), "+r" (a2_), "+r" (a3_), \
-                      "=r" (a4_), "=r" (a5_), "=r" (a6_)
-#define ALT_CALL4_OUT "+r" (a1_), "+r" (a2_), "+r" (a3_), \
-                      "+r" (a4_), "=r" (a5_), "=r" (a6_)
-#define ALT_CALL5_OUT "+r" (a1_), "+r" (a2_), "+r" (a3_), \
-                      "+r" (a4_), "+r" (a5_), "=r" (a6_)
-#define ALT_CALL6_OUT "+r" (a1_), "+r" (a2_), "+r" (a3_), \
-                      "+r" (a4_), "+r" (a5_), "+r" (a6_)
-
-#define alternative_callN(n, rettype, func) ({                     \
-    rettype ret_;                                                  \
-    register unsigned long r10_ asm("r10");                        \
-    register unsigned long r11_ asm("r11");                        \
-    asm volatile (ALTERNATIVE("call *%c[addr](%%rip)", "call .",   \
-                              X86_FEATURE_ALWAYS)                  \
-                  : ALT_CALL ## n ## _OUT, "=a" (ret_),            \
-                    "=r" (r10_), "=r" (r11_) ASM_CALL_CONSTRAINT   \
-                  : [addr] "i" (&(func)), "g" (func)               \
-                  : "memory" );                                    \
-    ret_;                                                          \
-})
-
-#define alternative_vcall0(func) ({             \
-    ALT_CALL_NO_ARG1;                           \
-    (void)sizeof(func());                       \
-    (void)alternative_callN(0, int, func);      \
-})
-
-#define alternative_call0(func) ({              \
-    ALT_CALL_NO_ARG1;                           \
-    alternative_callN(0, typeof(func()), func); \
-})
-
-#define alternative_vcall1(func, arg) ({           \
-    typeof(arg) v1_ = (arg);                       \
-    ALT_CALL_ARG(v1_, 1);                          \
-    ALT_CALL_NO_ARG2;                              \
-    (void)sizeof(func(arg));                       \
-    (void)alternative_callN(1, int, func);         \
-})
-
-#define alternative_call1(func, arg) ({            \
-    typeof(arg) v1_ = (arg);                       \
-    ALT_CALL_ARG(v1_, 1);                          \
-    ALT_CALL_NO_ARG2;                              \
-    alternative_callN(1, typeof(func(arg)), func); \
-})
-
-#define alternative_vcall2(func, arg1, arg2) ({           \
-    typeof(arg1) v1_ = (arg1);                            \
-    typeof(arg2) v2_ = (arg2);                            \
-    ALT_CALL_ARG(v1_, 1);                                 \
-    ALT_CALL_ARG(v2_, 2);                                 \
-    ALT_CALL_NO_ARG3;                                     \
-    (void)sizeof(func(arg1, arg2));                       \
-    (void)alternative_callN(2, int, func);                \
-})
-
-#define alternative_call2(func, arg1, arg2) ({            \
-    typeof(arg1) v1_ = (arg1);                            \
-    typeof(arg2) v2_ = (arg2);                            \
-    ALT_CALL_ARG(v1_, 1);                                 \
-    ALT_CALL_ARG(v2_, 2);                                 \
-    ALT_CALL_NO_ARG3;                                     \
-    alternative_callN(2, typeof(func(arg1, arg2)), func); \
-})
-
-#define alternative_vcall3(func, arg1, arg2, arg3) ({    \
-    typeof(arg1) v1_ = (arg1);                           \
-    typeof(arg2) v2_ = (arg2);                           \
-    typeof(arg3) v3_ = (arg3);                           \
-    ALT_CALL_ARG(v1_, 1);                                \
-    ALT_CALL_ARG(v2_, 2);                                \
-    ALT_CALL_ARG(v3_, 3);                                \
-    ALT_CALL_NO_ARG4;                                    \
-    (void)sizeof(func(arg1, arg2, arg3));                \
-    (void)alternative_callN(3, int, func);               \
-})
-
-#define alternative_call3(func, arg1, arg2, arg3) ({     \
-    typeof(arg1) v1_ = (arg1);                            \
-    typeof(arg2) v2_ = (arg2);                           \
-    typeof(arg3) v3_ = (arg3);                           \
-    ALT_CALL_ARG(v1_, 1);                                \
-    ALT_CALL_ARG(v2_, 2);                                \
-    ALT_CALL_ARG(v3_, 3);                                \
-    ALT_CALL_NO_ARG4;                                    \
-    alternative_callN(3, typeof(func(arg1, arg2, arg3)), \
-                      func);                             \
-})
-
-#define alternative_vcall4(func, arg1, arg2, arg3, arg4) ({ \
-    typeof(arg1) v1_ = (arg1);                              \
-    typeof(arg2) v2_ = (arg2);                              \
-    typeof(arg3) v3_ = (arg3);                              \
-    typeof(arg4) v4_ = (arg4);                              \
-    ALT_CALL_ARG(v1_, 1);                                   \
-    ALT_CALL_ARG(v2_, 2);                                   \
-    ALT_CALL_ARG(v3_, 3);                                   \
-    ALT_CALL_ARG(v4_, 4);                                   \
-    ALT_CALL_NO_ARG5;                                       \
-    (void)sizeof(func(arg1, arg2, arg3, arg4));             \
-    (void)alternative_callN(4, int, func);                  \
-})
-
-#define alternative_call4(func, arg1, arg2, arg3, arg4) ({  \
-    typeof(arg1) v1_ = (arg1);                              \
-    typeof(arg2) v2_ = (arg2);                              \
-    typeof(arg3) v3_ = (arg3);                              \
-    typeof(arg4) v4_ = (arg4);                              \
-    ALT_CALL_ARG(v1_, 1);                                   \
-    ALT_CALL_ARG(v2_, 2);                                   \
-    ALT_CALL_ARG(v3_, 3);                                   \
-    ALT_CALL_ARG(v4_, 4);                                   \
-    ALT_CALL_NO_ARG5;                                       \
-    alternative_callN(4, typeof(func(arg1, arg2,            \
-                                     arg3, arg4)),          \
-                      func);                                \
-})
-
-#define alternative_vcall5(func, arg1, arg2, arg3, arg4, arg5) ({ \
-    typeof(arg1) v1_ = (arg1);                                    \
-    typeof(arg2) v2_ = (arg2);                                    \
-    typeof(arg3) v3_ = (arg3);                                    \
-    typeof(arg4) v4_ = (arg4);                                    \
-    typeof(arg5) v5_ = (arg5);                                    \
-    ALT_CALL_ARG(v1_, 1);                                         \
-    ALT_CALL_ARG(v2_, 2);                                         \
-    ALT_CALL_ARG(v3_, 3);                                         \
-    ALT_CALL_ARG(v4_, 4);                                         \
-    ALT_CALL_ARG(v5_, 5);                                         \
-    ALT_CALL_NO_ARG6;                                             \
-    (void)sizeof(func(arg1, arg2, arg3, arg4, arg5));             \
-    (void)alternative_callN(5, int, func);                        \
-})
-
-#define alternative_call5(func, arg1, arg2, arg3, arg4, arg5) ({  \
-    typeof(arg1) v1_ = (arg1);                                    \
-    typeof(arg2) v2_ = (arg2);                                    \
-    typeof(arg3) v3_ = (arg3);                                    \
-    typeof(arg4) v4_ = (arg4);                                    \
-    typeof(arg5) v5_ = (arg5);                                    \
-    ALT_CALL_ARG(v1_, 1);                                         \
-    ALT_CALL_ARG(v2_, 2);                                         \
-    ALT_CALL_ARG(v3_, 3);                                         \
-    ALT_CALL_ARG(v4_, 4);                                         \
-    ALT_CALL_ARG(v5_, 5);                                         \
-    ALT_CALL_NO_ARG6;                                             \
-    alternative_callN(5, typeof(func(arg1, arg2, arg3,            \
-                                     arg4, arg5)),                \
-                      func);                                      \
-})
-
-#define alternative_vcall6(func, arg1, arg2, arg3, arg4, arg5, arg6) ({ \
-    typeof(arg1) v1_ = (arg1);                                          \
-    typeof(arg2) v2_ = (arg2);                                          \
-    typeof(arg3) v3_ = (arg3);                                          \
-    typeof(arg4) v4_ = (arg4);                                          \
-    typeof(arg5) v5_ = (arg5);                                          \
-    typeof(arg6) v6_ = (arg6);                                          \
-    ALT_CALL_ARG(v1_, 1);                                               \
-    ALT_CALL_ARG(v2_, 2);                                               \
-    ALT_CALL_ARG(v3_, 3);                                               \
-    ALT_CALL_ARG(v4_, 4);                                               \
-    ALT_CALL_ARG(v5_, 5);                                               \
-    ALT_CALL_ARG(v6_, 6);                                               \
-    (void)sizeof(func(arg1, arg2, arg3, arg4, arg5, arg6));             \
-    (void)alternative_callN(6, int, func);                              \
-})
-
-#define alternative_call6(func, arg1, arg2, arg3, arg4, arg5, arg6) ({  \
-    typeof(arg1) v1_ = (arg1);                                          \
-    typeof(arg2) v2_ = (arg2);                                          \
-    typeof(arg3) v3_ = (arg3);                                          \
-    typeof(arg4) v4_ = (arg4);                                          \
-    typeof(arg5) v5_ = (arg5);                                          \
-    typeof(arg6) v6_ = (arg6);                                          \
-    ALT_CALL_ARG(v1_, 1);                                               \
-    ALT_CALL_ARG(v2_, 2);                                               \
-    ALT_CALL_ARG(v3_, 3);                                               \
-    ALT_CALL_ARG(v4_, 4);                                               \
-    ALT_CALL_ARG(v5_, 5);                                               \
-    ALT_CALL_ARG(v6_, 6);                                               \
-    alternative_callN(6, typeof(func(arg1, arg2, arg3,                  \
-                                     arg4, arg5, arg6)),                \
-                      func);                                            \
-})
-
-#define alternative_vcall__(nr) alternative_vcall ## nr
-#define alternative_call__(nr)  alternative_call ## nr
-
-#define alternative_vcall_(nr) alternative_vcall__(nr)
-#define alternative_call_(nr)  alternative_call__(nr)
-
-#define alternative_vcall(func, args...) \
-    alternative_vcall_(count_args(args))(func, ## args)
-
-#define alternative_call(func, args...) \
-    alternative_call_(count_args(args))(func, ## args)
-
 #endif /*  !__ASSEMBLY__  */
 
 #endif /* __X86_ALTERNATIVE_H__ */
diff --git a/xen/arch/x86/include/asm/hvm/hvm.h b/xen/arch/x86/include/asm/hvm/hvm.h
index 963e8201130a..bf8bc2e100bd 100644
--- a/xen/arch/x86/include/asm/hvm/hvm.h
+++ b/xen/arch/x86/include/asm/hvm/hvm.h
@@ -9,9 +9,9 @@
 #ifndef __ASM_X86_HVM_HVM_H__
 #define __ASM_X86_HVM_HVM_H__
 
+#include <xen/alternative-call.h>
 #include <xen/mm.h>
 
-#include <asm/alternative.h>
 #include <asm/asm_defns.h>
 #include <asm/current.h>
 #include <asm/x86_emulate.h>
diff --git a/xen/common/core_parking.c b/xen/common/core_parking.c
index a970ffeab8c3..7d6a18cdcf4c 100644
--- a/xen/common/core_parking.c
+++ b/xen/common/core_parking.c
@@ -15,10 +15,10 @@
  *  General Public License for more details.
  */
 
-#include <xen/types.h>
+#include <xen/alternative-call.h>
 #include <xen/cpu.h>
-#include <xen/init.h>
 #include <xen/cpumask.h>
+#include <xen/init.h>
 #include <xen/param.h>
 
 #include <asm/smp.h>
diff --git a/xen/include/xen/alternative-call.h b/xen/include/xen/alternative-call.h
index 62672b732431..39339c3f0f76 100644
--- a/xen/include/xen/alternative-call.h
+++ b/xen/include/xen/alternative-call.h
@@ -13,10 +13,10 @@
  *
  * For architectures to support:
  *
- * - Implement alternative_{,v}call() in asm/alternative.h.  Code generation
- *   requirements are to emit a function pointer call at build time, and stash
- *   enough metadata to simplify the call at boot once the implementation has
- *   been resolved.
+ * - Implement alternative_{,v}call() in asm/alternative-call.h.  Code
+ *   generation requirements are to emit a function pointer call at build
+ *   time, and stash enough metadata to simplify the call at boot once the
+ *   implementation has been resolved.
  * - Select ALTERNATIVE_CALL in Kconfig.
  *
  * To use:
@@ -48,7 +48,7 @@
 
 #ifdef CONFIG_ALTERNATIVE_CALL
 
-#include <asm/alternative.h>
+#include <asm/alternative-call.h>
 
 #ifdef CONFIG_LIVEPATCH
 /* Must keep for livepatches to resolve alternative calls. */
-- 
2.39.5


