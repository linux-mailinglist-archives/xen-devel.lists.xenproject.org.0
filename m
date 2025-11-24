Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BE88DC81376
	for <lists+xen-devel@lfdr.de>; Mon, 24 Nov 2025 16:01:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1171331.1496369 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vNY4T-00021a-Gp; Mon, 24 Nov 2025 15:01:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1171331.1496369; Mon, 24 Nov 2025 15:01:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vNY4T-0001yJ-Dv; Mon, 24 Nov 2025 15:01:41 +0000
Received: by outflank-mailman (input) for mailman id 1171331;
 Mon, 24 Nov 2025 15:01:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=CeM5=6A=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vNY4R-0001E9-BY
 for xen-devel@lists.xenproject.org; Mon, 24 Nov 2025 15:01:39 +0000
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [2a00:1450:4864:20::332])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7a46f5ca-c946-11f0-9d18-b5c5bf9af7f9;
 Mon, 24 Nov 2025 16:01:38 +0100 (CET)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-47774d3536dso34206685e9.0
 for <xen-devel@lists.xenproject.org>; Mon, 24 Nov 2025 07:01:38 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-477bf22dfcesm203037055e9.13.2025.11.24.07.01.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 Nov 2025 07:01:36 -0800 (PST)
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
X-Inumbo-ID: 7a46f5ca-c946-11f0-9d18-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1763996498; x=1764601298; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=RP9LNtOsLGFUFpLZ6YuwHIzAHL2ieAcKHDRT49uhRHg=;
        b=RM+k/PUcIvsMbVUz/34Bi0wy96FEFu7qpTY3lKjjD/IAbeyLsA2EqGZJD/7Pgur8Ai
         oE81+s2zqNcY/q+WIl5FtexhyZDxfYTWmqzIh9noTWJk0zU9yCYdUcIYDG8yHhHtSYWG
         s/tAkpn051l77dBjEcJVtT/wMK3kZ/W6IMoReujp0wcCsNBl2uQuxtfSTo1C2xsDXKir
         ed5hHORvMPMSB5jUh7OV4NBWeym6Ixyh3Zt0aRdi4nBab1eY++vFJMAhBgMZIFEc/Aep
         sYxs+zp4p0+PH4Vm8+s94Ihs50YFCSRMEx4620/F34a6uIrvRcuakegu9iUrrMnRUkYM
         Nabg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763996498; x=1764601298;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RP9LNtOsLGFUFpLZ6YuwHIzAHL2ieAcKHDRT49uhRHg=;
        b=DRhB9d9n/TsJLLp8M+6g2M52yiD/40y6iQ781jwUmVSXqrWNtBGY18QkeIl/bA/LW/
         RP8P35xeCANEDYVy2yPhJNyMukfu0tKBrwcZmR2LpIVCzU/NdaAeRBYTDzDiBLi70YB3
         4ePrymgTw64szA6srhhPTwjOQ7XCStlXQNbxBGe4K7J+m5PS+equlaSNouHoVDl9jU1N
         HNy0TiWV1zwHwzvKQu7gK/C8CWcBGpykR0g+PldXEyGndsuolm/bzpOGE338Me0owDEw
         nlG29SkkZMr1WLHKRMAbxYv+11Y/lF3C42wohDQirO+qQPrWEseGjGAhboqIXBFwvvhU
         R6QQ==
X-Gm-Message-State: AOJu0Yxfk8gQltGyfCg/gENPGwDznmkK9Jfw/TaZAiBy2I1D7m+FawnJ
	1d5Mmx2XLoZDdzVxxUlJyXwRNWn24rM2ekHAXyMrjSz48c0I/aVxeqk7zGHD+lEK5Wug8IQ1a99
	lQOE=
X-Gm-Gg: ASbGnct/hG0enzd/aiK4xs8lFdrBfwLiKQxXMOYPlsnD2+Ov25O9epVivcLR72Zl7o5
	EwNxb6LKADnmEuJETI5z2PbsPU2+szZJ90fltN4SVyrXqsxvD6RzrSsTFdDNCI7vi6YCkXACoDo
	0nAslIttdic4ImdWn+RJTq8cbDy7I/QZuX5Her/wDiy6I7fwrw9eAPgg1odO9gOR6IbKIWGFAnT
	3+rsSB3K+AQ4VF5rM21wJyLUsWw1U1/u15+zE5tE2M5D7iagcueuEuNx7/Lto/fUotHBLcXksKn
	vLcqZ4FnflkmFvtFWirYP+8sJQzCYOEduE59dP2EnebSUIn5bEBGTz4QZKDw0eq7+ahA1DrlRlL
	fQeg0DiITryQw3/SoEWTenLiATgFiFsnrZAmcPdM9sjthmzjjBXIVbccwQHXvWQlwZPosSVNoQE
	+7YUYGPr9ElIjyuiwu4rPuBBkeBGa4bDCy9quzmN46fc8oSbKr3ziRTsRKNwcuh4WyjjMT+OYE2
	fk=
X-Google-Smtp-Source: AGHT+IGrsj0xJ4e0gDl9Sz4s4z6/wx2xCk9zLB/ZHUfLznZbREKYpOWbIwogkDaNTmf8Zx9qvM1jXA==
X-Received: by 2002:a05:600c:1f85:b0:471:793:e795 with SMTP id 5b1f17b1804b1-477b9e61f7cmr140878925e9.0.1763996496386;
        Mon, 24 Nov 2025 07:01:36 -0800 (PST)
Message-ID: <78b7c8a0-16ae-49c3-8c7b-5b10f5b0d688@suse.com>
Date: Mon, 24 Nov 2025 16:01:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v9 09/10] x86: use / "support" UDB
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <926a2315-a2b7-4aad-87e6-d686c9da9e3a@suse.com>
Content-Language: en-US
Autocrypt: addr=jbeulich@suse.com; keydata=
 xsDiBFk3nEQRBADAEaSw6zC/EJkiwGPXbWtPxl2xCdSoeepS07jW8UgcHNurfHvUzogEq5xk
 hu507c3BarVjyWCJOylMNR98Yd8VqD9UfmX0Hb8/BrA+Hl6/DB/eqGptrf4BSRwcZQM32aZK
 7Pj2XbGWIUrZrd70x1eAP9QE3P79Y2oLrsCgbZJfEwCgvz9JjGmQqQkRiTVzlZVCJYcyGGsD
 /0tbFCzD2h20ahe8rC1gbb3K3qk+LpBtvjBu1RY9drYk0NymiGbJWZgab6t1jM7sk2vuf0Py
 O9Hf9XBmK0uE9IgMaiCpc32XV9oASz6UJebwkX+zF2jG5I1BfnO9g7KlotcA/v5ClMjgo6Gl
 MDY4HxoSRu3i1cqqSDtVlt+AOVBJBACrZcnHAUSuCXBPy0jOlBhxPqRWv6ND4c9PH1xjQ3NP
 nxJuMBS8rnNg22uyfAgmBKNLpLgAGVRMZGaGoJObGf72s6TeIqKJo/LtggAS9qAUiuKVnygo
 3wjfkS9A3DRO+SpU7JqWdsveeIQyeyEJ/8PTowmSQLakF+3fote9ybzd880fSmFuIEJldWxp
 Y2ggPGpiZXVsaWNoQHN1c2UuY29tPsJgBBMRAgAgBQJZN5xEAhsDBgsJCAcDAgQVAggDBBYC
 AwECHgECF4AACgkQoDSui/t3IH4J+wCfQ5jHdEjCRHj23O/5ttg9r9OIruwAn3103WUITZee
 e7Sbg12UgcQ5lv7SzsFNBFk3nEQQCACCuTjCjFOUdi5Nm244F+78kLghRcin/awv+IrTcIWF
 hUpSs1Y91iQQ7KItirz5uwCPlwejSJDQJLIS+QtJHaXDXeV6NI0Uef1hP20+y8qydDiVkv6l
 IreXjTb7DvksRgJNvCkWtYnlS3mYvQ9NzS9PhyALWbXnH6sIJd2O9lKS1Mrfq+y0IXCP10eS
 FFGg+Av3IQeFatkJAyju0PPthyTqxSI4lZYuJVPknzgaeuJv/2NccrPvmeDg6Coe7ZIeQ8Yj
 t0ARxu2xytAkkLCel1Lz1WLmwLstV30g80nkgZf/wr+/BXJW/oIvRlonUkxv+IbBM3dX2OV8
 AmRv1ySWPTP7AAMFB/9PQK/VtlNUJvg8GXj9ootzrteGfVZVVT4XBJkfwBcpC/XcPzldjv+3
 HYudvpdNK3lLujXeA5fLOH+Z/G9WBc5pFVSMocI71I8bT8lIAzreg0WvkWg5V2WZsUMlnDL9
 mpwIGFhlbM3gfDMs7MPMu8YQRFVdUvtSpaAs8OFfGQ0ia3LGZcjA6Ik2+xcqscEJzNH+qh8V
 m5jjp28yZgaqTaRbg3M/+MTbMpicpZuqF4rnB0AQD12/3BNWDR6bmh+EkYSMcEIpQmBM51qM
 EKYTQGybRCjpnKHGOxG0rfFY1085mBDZCH5Kx0cl0HVJuQKC+dV2ZY5AqjcKwAxpE75MLFkr
 wkkEGBECAAkFAlk3nEQCGwwACgkQoDSui/t3IH7nnwCfcJWUDUFKdCsBH/E5d+0ZnMQi+G0A
 nAuWpQkjM1ASeQwSHEeAWPgskBQL
In-Reply-To: <926a2315-a2b7-4aad-87e6-d686c9da9e3a@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

With opcode D6h now firmly reserved as another #UD-raising one in 64-bit
mode, use that instead of the two-byte UD2 for bug frame marking.

While there also make the respective adjustment to the emulator.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
Should we also switch {svm,vmx}_init_hypercall_page()?

Furthermore x86_64/kexec_reloc.S also has two uses. Question is whether
"tailcall" is being open-coded there, or whether that's deliberately not
using the macro we have.

One of the table entries in stub_selftest() uses UD1, yet not in quite
an appropriate way: The 0x90 following it (presumably meant to be a NOP)
really is a ModR/M byte, requiring a displacement to follow. Wouldn't we
better adjust that (e.g. using 0xcc instead)?
---
v9: New.

--- a/xen/arch/x86/include/asm/bug.h
+++ b/xen/arch/x86/include/asm/bug.h
@@ -21,7 +21,7 @@
 
 #ifndef __ASSEMBLY__
 
-#define BUG_INSTR       "ud2"
+#define BUG_INSTR       ".byte 0xd6" /* UDB */
 #define BUG_ASM_CONST   "c"
 
 #else  /* !__ASSEMBLY__ */
@@ -37,7 +37,7 @@
         .error "Invalid BUGFRAME index"
     .endif
 
-    .L\@ud: ud2a
+    .L\@ud: .byte 0xd6 /* UDB */
 
     .pushsection .rodata.str1, "aMS", @progbits, 1
          .L\@s1: .asciz "\file_str"
--- a/xen/arch/x86/traps.c
+++ b/xen/arch/x86/traps.c
@@ -1256,7 +1256,7 @@ void asmlinkage do_trap(struct cpu_user_
 
 void asmlinkage do_invalid_op(struct cpu_user_regs *regs)
 {
-    u8 bug_insn[2];
+    uint8_t bug_insn;
     const void *eip = (const void *)regs->rip;
     int id;
 
@@ -1268,8 +1268,8 @@ void asmlinkage do_invalid_op(struct cpu
     }
 
     if ( !is_active_kernel_text(regs->rip) ||
-         copy_from_unsafe(bug_insn, eip, sizeof(bug_insn)) ||
-         memcmp(bug_insn, "\xf\xb", sizeof(bug_insn)) )
+         copy_from_unsafe(&bug_insn, eip, sizeof(bug_insn)) ||
+         bug_insn != 0xd6 /* UDB */ )
         goto die;
 
     id = do_bug_frame(regs, regs->rip);
--- a/xen/arch/x86/x86_emulate/decode.c
+++ b/xen/arch/x86/x86_emulate/decode.c
@@ -651,7 +651,7 @@ decode_onebyte(struct x86_emulate_state
     case 0xce: /* into */
     case 0xd4: /* aam */
     case 0xd5: /* aad */
-    case 0xd6: /* salc */
+        /* 0xd6 (salc) omitted here, for #UD to be raised in 64-bit mode. */
         s->not_64bit = true;
         break;
 
--- a/xen/arch/x86/x86_emulate/x86_emulate.c
+++ b/xen/arch/x86/x86_emulate/x86_emulate.c
@@ -2470,9 +2470,17 @@ x86_emulate(
         _regs.eflags |= even_parity(_regs.al) ? X86_EFLAGS_PF : 0;
         break;
 
-    case 0xd6: /* salc */
-        _regs.al = (_regs.eflags & X86_EFLAGS_CF) ? 0xff : 0x00;
-        break;
+    case 0xd6: /* salc / udb */
+        if ( !mode_64bit() )
+        {
+            _regs.al = (_regs.eflags & X86_EFLAGS_CF) ? 0xff : 0x00;
+            break;
+        }
+        fallthrough;
+    case X86EMUL_OPC(0x0f, 0x0b): /* ud2 */
+    case X86EMUL_OPC(0x0f, 0xb9): /* ud1 */
+    case X86EMUL_OPC(0x0f, 0xff): /* ud0 */
+        generate_exception(X86_EXC_UD);
 
     case 0xd7: /* xlat */ {
         unsigned long al;
@@ -3204,11 +3212,6 @@ x86_emulate(
             goto done;
         break;
 
-    case X86EMUL_OPC(0x0f, 0x0b): /* ud2 */
-    case X86EMUL_OPC(0x0f, 0xb9): /* ud1 */
-    case X86EMUL_OPC(0x0f, 0xff): /* ud0 */
-        generate_exception(X86_EXC_UD);
-
     case X86EMUL_OPC(0x0f, 0x0d): /* GrpP (prefetch) */
     case X86EMUL_OPC(0x0f, 0x18): /* Grp16 (prefetch/nop) */
     case X86EMUL_OPC(0x0f, 0x19) ... X86EMUL_OPC(0x0f, 0x1f): /* nop */


