Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E6F1AB9040
	for <lists+xen-devel@lfdr.de>; Thu, 15 May 2025 21:56:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.985922.1371710 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uFegR-0004ab-QK; Thu, 15 May 2025 19:55:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 985922.1371710; Thu, 15 May 2025 19:55:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uFegR-0004Xv-MT; Thu, 15 May 2025 19:55:59 +0000
Received: by outflank-mailman (input) for mailman id 985922;
 Thu, 15 May 2025 19:55:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=us+D=X7=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1uFegQ-00043V-HR
 for xen-devel@lists.xenproject.org; Thu, 15 May 2025 19:55:58 +0000
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [2a00:1450:4864:20::330])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9da64d0e-31c6-11f0-9ffb-bf95429c2676;
 Thu, 15 May 2025 21:55:56 +0200 (CEST)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-43cf680d351so14712645e9.0
 for <xen-devel@lists.xenproject.org>; Thu, 15 May 2025 12:55:56 -0700 (PDT)
Received: from localhost.localdomain (host-92-26-98-202.as13285.net.
 [92.26.98.202]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-442ebd6fe86sm78320035e9.0.2025.05.15.12.55.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 May 2025 12:55:55 -0700 (PDT)
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
X-Inumbo-ID: 9da64d0e-31c6-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1747338956; x=1747943756; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=78lwAjTVEfFZKXkvQFxXqM7GZdpZLNr3fAkXr5zqCcs=;
        b=DpbHiMQF5fBrdkjr2ZvkkDp6T+3bxf/+9NmbjvUdBO4vDwa3bZx8KI9U0Dowc/6BaM
         2vTU1NLlkJUA1fqjZN2F9iZfSmoK9gTQBUhaH1H/mChsoZVcuvxd1LZXaSp25hESSEtR
         TJCZNIBJe8D0Vwx3B+sOwBiZomwv391HUlsio=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747338956; x=1747943756;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=78lwAjTVEfFZKXkvQFxXqM7GZdpZLNr3fAkXr5zqCcs=;
        b=KFEmyLPcoMsTXuYR6yYwOxLPth5EiR8VaAwYHwQXPnUghHOYcMLHe9C9TvchPxBOvC
         HUK83NfCDfeG7/anFUbYe/H655XZtXWnHX/vn8ZUM7aAM4c4DzlD0h4nz/wDn9FO/8ra
         cdEkRggWtN4vdsfbF7JRJCqcy3+1UyHUH+/T9BZBGOji4PPOq143eiLnX+rNLuPUuEVG
         owsxm+7BKdzVfUrYTpTW0DhT9fCMSnNHwwbXAImcCPg4WdAjVOoiq7kt3ir7IDvK2gku
         AlX2ZCJCZKjA5qMaAXM2ecpFH7CvgFsbtx+Xk0kIdUexcbHFkOi91dT3uiHb8+0rP4Wx
         PcBg==
X-Gm-Message-State: AOJu0YxSKiYjIHgvC+thIqG8F2/pLmr0n9+4meLUaDhkGO/hcjd3Ry0A
	Dg1EC2GGqC1S1NkWd5HQyz+Y2VJ9VuuiXQw3HMxwmihNcxh9JN2nrnWr6/dYeYd59jpTOrs1xU7
	4aefd
X-Gm-Gg: ASbGncs2aVlxjSGhE7vum4yj0DylQpgzIuTosdGuzKssFkBe8TsTkjromnov7lap3NE
	vD9Wjzija4wkaRSrjcXmK8cV2OhaX/M0YNO0FA6BTL41kdDorLsx4PeoUPfIBA+2flsImjXSve8
	1A9eShpwrgQJchmz3CtGzPPzVv1hhvJhu3N8EaKLIfnm8UlxLkAhLOfQaXusbQN5zgSNRqaOVox
	ouYS6+9NHykqgKd0CoSayPd+QNg7eN6NwwbTZPYX/UKGibnh1PUjJC00Beml5NJ+J5HnqdzvFmk
	F5VGZH0+Fgici52n5CP5PfJuZo9+Iyl3GKJ6JgoRLGhKlMA5jAY+sQgva5sJevNEX4hCaCXwB1x
	OZNOfkfey0cA/AVgSlIozuroaNXblzCP5zhs=
X-Google-Smtp-Source: AGHT+IF3How/2DZVnEKz0UT2FxoFJbzP/0XrdjvWYJ0uNhdGqw3ZlmHN9uoKmy9iREMsNxkVxVpMjA==
X-Received: by 2002:a05:600c:46c9:b0:442:f8f6:48e5 with SMTP id 5b1f17b1804b1-442f8f6494fmr43419715e9.8.1747338955876;
        Thu, 15 May 2025 12:55:55 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>
Subject: [PATCH 2/3] x86: Use asm_inline for ALTERNATIVE() and EXTABLE
Date: Thu, 15 May 2025 20:55:48 +0100
Message-Id: <20250515195549.3703017-3-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250515195549.3703017-1-andrew.cooper3@citrix.com>
References: <20250515195549.3703017-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

... when there really are only a few instructions in line.

In some cases, reformat to reduce left-hand margine space.

No functional change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Julien Grall <julien@xen.org>
CC: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
CC: Bertrand Marquis <bertrand.marquis@arm.com>
CC: Michal Orzel <michal.orzel@amd.com>

v2:
 * New, split out of previous single patch
 * Include EXTABLE

There are some uses of _ASM_EXTABLE() which are in blocks with many
instructions which are left unconverted.  There are also a couple for which I
already have pending cleanup, which I've left alone to reduce churn.
---
 xen/arch/x86/cpu/amd.c                      | 52 +++++++++++----------
 xen/arch/x86/domain.c                       | 21 +++++----
 xen/arch/x86/extable.c                      | 21 +++++----
 xen/arch/x86/hvm/vmx/vmcs.c                 | 15 +++---
 xen/arch/x86/i387.c                         |  4 +-
 xen/arch/x86/include/asm/alternative-call.h |  3 +-
 xen/arch/x86/include/asm/alternative.h      | 36 ++++++++------
 xen/arch/x86/include/asm/hvm/vmx/vmx.h      | 15 +++---
 xen/arch/x86/include/asm/uaccess.h          |  4 +-
 xen/arch/x86/pv/misc-hypercalls.c           | 19 ++++----
 xen/arch/x86/traps.c                        | 48 ++++++++++---------
 xen/arch/x86/usercopy.c                     |  6 +--
 12 files changed, 132 insertions(+), 112 deletions(-)

diff --git a/xen/arch/x86/cpu/amd.c b/xen/arch/x86/cpu/amd.c
index 37d67dd15c89..27ae16780857 100644
--- a/xen/arch/x86/cpu/amd.c
+++ b/xen/arch/x86/cpu/amd.c
@@ -60,41 +60,45 @@ static inline int rdmsr_amd_safe(unsigned int msr, unsigned int *lo,
 				 unsigned int *hi)
 {
 #ifdef CONFIG_CC_HAS_ASM_GOTO_OUTPUT
-    asm goto ( "1: rdmsr\n\t"
-               _ASM_EXTABLE(1b, %l[fault])
-               : "=a" (*lo), "=d" (*hi)
-               : "c" (msr), "D" (0x9c5a203a)
-               :
-               : fault );
+    asm_inline goto (
+        "1: rdmsr\n\t"
+        _ASM_EXTABLE(1b, %l[fault])
+        : "=a" (*lo), "=d" (*hi)
+        : "c" (msr), "D" (0x9c5a203a)
+        :
+        : fault );
+
     return 0;
 
  fault:
     return -EFAULT;
 #else
-	int err;
-
-	asm volatile("1: rdmsr\n2:\n"
-		     ".section .fixup,\"ax\"\n"
-		     "3: movl %6,%2\n"
-		     "   jmp 2b\n"
-		     ".previous\n"
-		     _ASM_EXTABLE(1b, 3b)
-		     : "=a" (*lo), "=d" (*hi), "=r" (err)
-		     : "c" (msr), "D" (0x9c5a203a), "2" (0), "i" (-EFAULT));
-
-	return err;
+    int err;
+
+    asm_inline volatile (
+        "1: rdmsr\n2:\n"
+        ".section .fixup,\"ax\"\n"
+        "3: movl %6,%2\n"
+        "   jmp 2b\n"
+        ".previous\n"
+        _ASM_EXTABLE(1b, 3b)
+        : "=a" (*lo), "=d" (*hi), "=r" (err)
+        : "c" (msr), "D" (0x9c5a203a), "2" (0), "i" (-EFAULT) );
+
+    return err;
 #endif
 }
 
 static inline int wrmsr_amd_safe(unsigned int msr, unsigned int lo,
                                  unsigned int hi)
 {
-    asm goto ( "1: wrmsr\n\t"
-               _ASM_EXTABLE(1b, %l[fault])
-               :
-               : "c" (msr), "a" (lo), "d" (hi), "D" (0x9c5a203a)
-               :
-               : fault );
+    asm_inline goto (
+        "1: wrmsr\n\t"
+        _ASM_EXTABLE(1b, %l[fault])
+        :
+        : "c" (msr), "a" (lo), "d" (hi), "D" (0x9c5a203a)
+        :
+        : fault );
 
     return 0;
 
diff --git a/xen/arch/x86/domain.c b/xen/arch/x86/domain.c
index f197dad4c0cd..7536b6c8717e 100644
--- a/xen/arch/x86/domain.c
+++ b/xen/arch/x86/domain.c
@@ -1706,16 +1706,17 @@ static void load_segments(struct vcpu *n)
      * @all_segs_okay in function scope, and load NUL into @sel.
      */
 #define TRY_LOAD_SEG(seg, val)                          \
-    asm volatile ( "1: mov %k[_val], %%" #seg "\n\t"    \
-                   "2:\n\t"                             \
-                   ".section .fixup, \"ax\"\n\t"        \
-                   "3: xor %k[ok], %k[ok]\n\t"          \
-                   "   mov %k[ok], %%" #seg "\n\t"      \
-                   "   jmp 2b\n\t"                      \
-                   ".previous\n\t"                      \
-                   _ASM_EXTABLE(1b, 3b)                 \
-                   : [ok] "+r" (all_segs_okay)          \
-                   : [_val] "rm" (val) )
+    asm_inline volatile (                               \
+        "1: mov %k[_val], %%" #seg "\n\t"               \
+        "2:\n\t"                                        \
+        ".section .fixup, \"ax\"\n\t"                   \
+        "3: xor %k[ok], %k[ok]\n\t"                     \
+        "   mov %k[ok], %%" #seg "\n\t"                 \
+        "   jmp 2b\n\t"                                 \
+        ".previous\n\t"                                 \
+        _ASM_EXTABLE(1b, 3b)                            \
+        : [ok] "+r" (all_segs_okay)                     \
+        : [_val] "rm" (val) )
 
     if ( !compat )
     {
diff --git a/xen/arch/x86/extable.c b/xen/arch/x86/extable.c
index 1572efa69a00..de392024527c 100644
--- a/xen/arch/x86/extable.c
+++ b/xen/arch/x86/extable.c
@@ -186,16 +186,17 @@ int __init cf_check stub_selftest(void)
         place_ret(ptr + ARRAY_SIZE(tests[i].opc));
         unmap_domain_page(ptr);
 
-        asm volatile ( "INDIRECT_CALL %[stb]\n"
-                       ".Lret%=:\n\t"
-                       ".pushsection .fixup,\"ax\"\n"
-                       ".Lfix%=:\n\t"
-                       "pop %[exn]\n\t"
-                       "jmp .Lret%=\n\t"
-                       ".popsection\n\t"
-                       _ASM_EXTABLE(.Lret%=, .Lfix%=)
-                       : [exn] "+m" (res) ASM_CALL_CONSTRAINT
-                       : [stb] "r" (addr), "a" (tests[i].rax));
+        asm_inline volatile (
+            "INDIRECT_CALL %[stb]\n"
+            ".Lret%=:\n\t"
+            ".pushsection .fixup,\"ax\"\n"
+            ".Lfix%=:\n\t"
+            "pop %[exn]\n\t"
+            "jmp .Lret%=\n\t"
+            ".popsection\n\t"
+            _ASM_EXTABLE(.Lret%=, .Lfix%=)
+            : [exn] "+m" (res) ASM_CALL_CONSTRAINT
+            : [stb] "r" (addr), "a" (tests[i].rax) );
 
         if ( res.raw != tests[i].res.raw )
         {
diff --git a/xen/arch/x86/hvm/vmx/vmcs.c b/xen/arch/x86/hvm/vmx/vmcs.c
index a44475ae15bd..59f4d1d86f02 100644
--- a/xen/arch/x86/hvm/vmx/vmcs.c
+++ b/xen/arch/x86/hvm/vmx/vmcs.c
@@ -749,13 +749,14 @@ static int _vmx_cpu_up(bool bsp)
     if ( bsp && (rc = vmx_cpu_up_prepare(cpu)) != 0 )
         return rc;
 
-    asm goto ( "1: vmxon %[addr]\n\t"
-               "   jbe %l[vmxon_fail]\n\t"
-               _ASM_EXTABLE(1b, %l[vmxon_fault])
-               :
-               : [addr] "m" (this_cpu(vmxon_region))
-               : "memory"
-               : vmxon_fail, vmxon_fault );
+    asm_inline goto (
+        "1: vmxon %[addr]\n\t"
+        "   jbe %l[vmxon_fail]\n\t"
+        _ASM_EXTABLE(1b, %l[vmxon_fault])
+        :
+        : [addr] "m" (this_cpu(vmxon_region))
+        : "memory"
+        : vmxon_fail, vmxon_fault );
 
     this_cpu(vmxon) = 1;
 
diff --git a/xen/arch/x86/i387.c b/xen/arch/x86/i387.c
index 5429531ddd5f..b84cd6f7a9e1 100644
--- a/xen/arch/x86/i387.c
+++ b/xen/arch/x86/i387.c
@@ -62,7 +62,7 @@ static inline void fpu_fxrstor(struct vcpu *v)
     switch ( __builtin_expect(fpu_ctxt->x[FPU_WORD_SIZE_OFFSET], 8) )
     {
     default:
-        asm volatile (
+        asm_inline volatile (
             "1: fxrstorq %0\n"
             ".section .fixup,\"ax\"   \n"
             "2: push %%"__OP"ax       \n"
@@ -82,7 +82,7 @@ static inline void fpu_fxrstor(struct vcpu *v)
             : "m" (*fpu_ctxt), "i" (sizeof(*fpu_ctxt) / 4) );
         break;
     case 4: case 2:
-        asm volatile (
+        asm_inline volatile (
             "1: fxrstor %0         \n"
             ".section .fixup,\"ax\"\n"
             "2: push %%"__OP"ax    \n"
diff --git a/xen/arch/x86/include/asm/alternative-call.h b/xen/arch/x86/include/asm/alternative-call.h
index bbc49a5274d9..b22c10c32283 100644
--- a/xen/arch/x86/include/asm/alternative-call.h
+++ b/xen/arch/x86/include/asm/alternative-call.h
@@ -87,7 +87,8 @@ struct alt_call {
     rettype ret_;                                                  \
     register unsigned long r10_ asm("r10");                        \
     register unsigned long r11_ asm("r11");                        \
-    asm volatile ("1: call *%c[addr](%%rip)\n\t"                   \
+    asm_inline volatile (                                          \
+                  "1: call *%c[addr](%%rip)\n\t"                   \
                   ".pushsection .alt_call_sites, \"a\", @progbits\n\t"  \
                   ".long 1b - .\n\t"                               \
                   ".popsection"                                    \
diff --git a/xen/arch/x86/include/asm/alternative.h b/xen/arch/x86/include/asm/alternative.h
index e17be8ddfd82..0482bbf7cbf1 100644
--- a/xen/arch/x86/include/asm/alternative.h
+++ b/xen/arch/x86/include/asm/alternative.h
@@ -126,12 +126,15 @@ extern void alternative_instructions(void);
  * without volatile and memory clobber.
  */
 #define alternative(oldinstr, newinstr, feature)                        \
-        asm volatile (ALTERNATIVE(oldinstr, newinstr, feature) : : : "memory")
+    asm_inline volatile (                                               \
+        ALTERNATIVE(oldinstr, newinstr, feature)                        \
+        ::: "memory" )
 
 #define alternative_2(oldinstr, newinstr1, feature1, newinstr2, feature2) \
-	asm volatile (ALTERNATIVE_2(oldinstr, newinstr1, feature1,	\
-				    newinstr2, feature2)		\
-		      : : : "memory")
+    asm_inline volatile (                                               \
+        ALTERNATIVE_2(oldinstr, newinstr1, feature1,                    \
+                      newinstr2, feature2)                              \
+        ::: "memory" )
 
 /*
  * Alternative inline assembly with input.
@@ -143,14 +146,16 @@ extern void alternative_instructions(void);
  * If you use variable sized constraints like "m" or "g" in the
  * replacement make sure to pad to the worst case length.
  */
-#define alternative_input(oldinstr, newinstr, feature, input...)	\
-	asm volatile (ALTERNATIVE(oldinstr, newinstr, feature)		\
-		      : : input)
+#define alternative_input(oldinstr, newinstr, feature, input...)        \
+    asm_inline volatile (                                               \
+        ALTERNATIVE(oldinstr, newinstr, feature)                        \
+        :: input )
 
 /* Like alternative_input, but with a single output argument */
-#define alternative_io(oldinstr, newinstr, feature, output, input...)	\
-	asm volatile (ALTERNATIVE(oldinstr, newinstr, feature)		\
-		      : output : input)
+#define alternative_io(oldinstr, newinstr, feature, output, input...)   \
+    asm_inline volatile (                                               \
+        ALTERNATIVE(oldinstr, newinstr, feature)                        \
+        : output : input )
 
 /*
  * This is similar to alternative_io. But it has two features and
@@ -160,11 +165,12 @@ extern void alternative_instructions(void);
  * Otherwise, if CPU has feature1, newinstr1 is used.
  * Otherwise, oldinstr is used.
  */
-#define alternative_io_2(oldinstr, newinstr1, feature1, newinstr2,	\
-			 feature2, output, input...)			\
-	asm volatile(ALTERNATIVE_2(oldinstr, newinstr1, feature1,	\
-				   newinstr2, feature2)			\
-		     : output : input)
+#define alternative_io_2(oldinstr, newinstr1, feature1, newinstr2,      \
+                         feature2, output, input...)                    \
+    asm_inline volatile (                                               \
+        ALTERNATIVE_2(oldinstr, newinstr1, feature1,                    \
+                      newinstr2, feature2)                              \
+        : output : input )
 
 /* Use this macro(s) if you need more than one output parameter. */
 #define ASM_OUTPUT2(a...) a
diff --git a/xen/arch/x86/include/asm/hvm/vmx/vmx.h b/xen/arch/x86/include/asm/hvm/vmx/vmx.h
index d85b52b9d522..56bea252cc5a 100644
--- a/xen/arch/x86/include/asm/hvm/vmx/vmx.h
+++ b/xen/arch/x86/include/asm/hvm/vmx/vmx.h
@@ -431,13 +431,14 @@ static always_inline void __invvpid(unsigned long type, u16 vpid, u64 gva)
     }  operand = {vpid, 0, gva};
 
     /* Fix up #UD exceptions which occur when TLBs are flushed before VMXON. */
-    asm goto ( "1: invvpid %[operand], %[type]\n\t"
-               "   jbe %l[vmfail]\n\t"
-               "2:" _ASM_EXTABLE(1b, 2b)
-               :
-               : [operand] "m" (operand), [type] "r" (type)
-               : "memory"
-               : vmfail );
+    asm_inline goto (
+        "1: invvpid %[operand], %[type]\n\t"
+        "   jbe %l[vmfail]\n\t"
+        "2:" _ASM_EXTABLE(1b, 2b)
+        :
+        : [operand] "m" (operand), [type] "r" (type)
+        : "memory"
+        : vmfail );
     return;
 
  vmfail:
diff --git a/xen/arch/x86/include/asm/uaccess.h b/xen/arch/x86/include/asm/uaccess.h
index 2d01669b9610..719d053936b9 100644
--- a/xen/arch/x86/include/asm/uaccess.h
+++ b/xen/arch/x86/include/asm/uaccess.h
@@ -154,7 +154,7 @@ struct __large_struct { unsigned long buf[100]; };
  * aliasing issues.
  */
 #define put_unsafe_asm(x, addr, GUARD, err, itype, rtype, ltype, errret) \
-	__asm__ __volatile__(						\
+	asm_inline volatile (						\
 		GUARD(							\
 		"	guest_access_mask_ptr %[ptr], %[scr1], %[scr2]\n" \
 		)							\
@@ -171,7 +171,7 @@ struct __large_struct { unsigned long buf[100]; };
 		  "[ptr]" (addr), [errno] "i" (errret))
 
 #define get_unsafe_asm(x, addr, GUARD, err, rtype, ltype, errret)	\
-	__asm__ __volatile__(						\
+	asm_inline volatile (						\
 		GUARD(							\
 		"	guest_access_mask_ptr %[ptr], %[scr1], %[scr2]\n" \
 		)							\
diff --git a/xen/arch/x86/pv/misc-hypercalls.c b/xen/arch/x86/pv/misc-hypercalls.c
index b529f00ea127..17030d800d1b 100644
--- a/xen/arch/x86/pv/misc-hypercalls.c
+++ b/xen/arch/x86/pv/misc-hypercalls.c
@@ -230,15 +230,16 @@ long do_set_segment_base(unsigned int which, unsigned long base)
          * Anyone wanting to check for errors from this hypercall should
          * re-read %gs and compare against the input.
          */
-        asm volatile ( "1: mov %[sel], %%gs\n\t"
-                       ".section .fixup, \"ax\", @progbits\n\t"
-                       "2: mov %k[flat], %%gs\n\t"
-                       "   xor %[sel], %[sel]\n\t"
-                       "   jmp 1b\n\t"
-                       ".previous\n\t"
-                       _ASM_EXTABLE(1b, 2b)
-                       : [sel] "+r" (sel)
-                       : [flat] "r" (FLAT_USER_DS32) );
+        asm_inline volatile (
+            "1: mov %[sel], %%gs\n\t"
+            ".section .fixup, \"ax\", @progbits\n\t"
+            "2: mov %k[flat], %%gs\n\t"
+            "   xor %[sel], %[sel]\n\t"
+            "   jmp 1b\n\t"
+            ".previous\n\t"
+            _ASM_EXTABLE(1b, 2b)
+            : [sel] "+r" (sel)
+            : [flat] "r" (FLAT_USER_DS32) );
 
         /* Update the cache of the inactive base, as read from the GDT/LDT. */
         v->arch.pv.gs_base_user = read_gs_base();
diff --git a/xen/arch/x86/traps.c b/xen/arch/x86/traps.c
index 25e0d5777e6e..c94779b4ad4f 100644
--- a/xen/arch/x86/traps.c
+++ b/xen/arch/x86/traps.c
@@ -126,27 +126,29 @@ void show_code(const struct cpu_user_regs *regs)
      * Copy forward from regs->rip.  In the case of a fault, %ecx contains the
      * number of bytes remaining to copy.
      */
-    asm volatile ("1: rep movsb; 2:"
-                  _ASM_EXTABLE(1b, 2b)
-                  : "=&c" (missing_after),
-                    "=&D" (tmp), "=&S" (tmp)
-                  : "0" (ARRAY_SIZE(insns_after)),
-                    "1" (insns_after),
-                    "2" (regs->rip));
+    asm_inline volatile (
+        "1: rep movsb; 2:"
+        _ASM_EXTABLE(1b, 2b)
+        : "=&c" (missing_after),
+          "=&D" (tmp), "=&S" (tmp)
+        : "0" (ARRAY_SIZE(insns_after)),
+          "1" (insns_after),
+          "2" (regs->rip) );
 
     /*
      * Copy backwards from regs->rip - 1.  In the case of a fault, %ecx
      * contains the number of bytes remaining to copy.
      */
-    asm volatile ("std;"
-                  "1: rep movsb;"
-                  "2: cld;"
-                  _ASM_EXTABLE(1b, 2b)
-                  : "=&c" (missing_before),
-                    "=&D" (tmp), "=&S" (tmp)
-                  : "0" (ARRAY_SIZE(insns_before)),
-                    "1" (insns_before + ARRAY_SIZE(insns_before) - 1),
-                    "2" (regs->rip - 1));
+    asm_inline volatile (
+        "std;"
+        "1: rep movsb;"
+        "2: cld;"
+        _ASM_EXTABLE(1b, 2b)
+        : "=&c" (missing_before),
+          "=&D" (tmp), "=&S" (tmp)
+        : "0" (ARRAY_SIZE(insns_before)),
+          "1" (insns_before + ARRAY_SIZE(insns_before) - 1),
+          "2" (regs->rip - 1) );
     clac();
 
     printk("Xen code around <%p> (%ps)%s:\n",
@@ -524,12 +526,14 @@ static void show_trace(const struct cpu_user_regs *regs)
     printk("Xen call trace:\n");
 
     /* Guarded read of the stack top. */
-    asm ( "1: mov %[data], %[tos]; 2:\n"
-          ".pushsection .fixup,\"ax\"\n"
-          "3: movb $1, %[fault]; jmp 2b\n"
-          ".popsection\n"
-          _ASM_EXTABLE(1b, 3b)
-          : [tos] "+r" (tos), [fault] "+qm" (fault) : [data] "m" (*sp) );
+    asm_inline (
+        "1: mov %[data], %[tos]; 2:\n"
+        ".pushsection .fixup,\"ax\"\n"
+        "3: movb $1, %[fault]; jmp 2b\n"
+        ".popsection\n"
+        _ASM_EXTABLE(1b, 3b)
+        : [tos] "+r" (tos), [fault] "+qm" (fault)
+        : [data] "m" (*sp) );
 
     /*
      * If RIP looks sensible, or the top of the stack doesn't, print RIP at
diff --git a/xen/arch/x86/usercopy.c b/xen/arch/x86/usercopy.c
index 7ab2009efe4c..a24b52cc66c1 100644
--- a/xen/arch/x86/usercopy.c
+++ b/xen/arch/x86/usercopy.c
@@ -19,7 +19,7 @@ unsigned int copy_to_guest_ll(void __user *to, const void *from, unsigned int n)
     GUARD(unsigned dummy);
 
     stac();
-    asm volatile (
+    asm_inline volatile (
         GUARD(
         "    guest_access_mask_ptr %[to], %q[scratch1], %q[scratch2]\n"
         )
@@ -39,7 +39,7 @@ unsigned int copy_from_guest_ll(void *to, const void __user *from, unsigned int
     unsigned dummy;
 
     stac();
-    asm volatile (
+    asm_inline volatile (
         GUARD(
         "    guest_access_mask_ptr %[from], %q[scratch1], %q[scratch2]\n"
         )
@@ -101,7 +101,7 @@ unsigned int clear_guest_pv(void __user *to, unsigned int n)
         long dummy;
 
         stac();
-        asm volatile (
+        asm_inline volatile (
             "    guest_access_mask_ptr %[to], %[scratch1], %[scratch2]\n"
             "1:  rep stosb\n"
             "2:\n"
-- 
2.39.5


