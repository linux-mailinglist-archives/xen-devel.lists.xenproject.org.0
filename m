Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 22B9D82DB5C
	for <lists+xen-devel@lfdr.de>; Mon, 15 Jan 2024 15:35:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.667409.1038632 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rPO3I-0007uv-GH; Mon, 15 Jan 2024 14:35:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 667409.1038632; Mon, 15 Jan 2024 14:35:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rPO3I-0007sx-Dh; Mon, 15 Jan 2024 14:35:00 +0000
Received: by outflank-mailman (input) for mailman id 667409;
 Mon, 15 Jan 2024 14:34:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jLm1=IZ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rPO3G-0007gY-LG
 for xen-devel@lists.xenproject.org; Mon, 15 Jan 2024 14:34:58 +0000
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [2a00:1450:4864:20::330])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 418a30d1-b3b3-11ee-98f1-6d05b1d4d9a1;
 Mon, 15 Jan 2024 15:34:57 +0100 (CET)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-40e7fb927a3so4172055e9.3
 for <xen-devel@lists.xenproject.org>; Mon, 15 Jan 2024 06:34:57 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 j27-20020adfb31b000000b00336e32338f3sm12166221wrd.70.2024.01.15.06.34.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 Jan 2024 06:34:56 -0800 (PST)
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
X-Inumbo-ID: 418a30d1-b3b3-11ee-98f1-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1705329297; x=1705934097; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:references:cc:to
         :from:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=kdcFdpBiOv5Ief4bXCoTgvxcM2tE3ReF1qPR03/fxTY=;
        b=ZHWVWgLb+RTLiEt6Yap+F3IHerhJO8mTsyV6kHKv86UZrLDZ7ljktWDgk6P6Evxm24
         LlhFVSbgJ8oDsseWNQFcY912a5mLVSyhxt/eUsjcDiC9rQneASJLLsl0Vg0HC9L9OjMd
         CJ5b7rpmQQnQoUZQOQm4hkGEkFL4F3wV5/WHAkff47o6bH3M296qKkLF547Q5383UZfM
         KRu6Qy7WnwfWTVlD6izFfhiFwMht3IdWPi6BzmK668SWEw1r9TGKDmM3OWba7C2P1+mp
         AKvij5EczG7aiWhYYXnbxbToRoksXXG/8XV7v2kIJMzw5q0pVd8037+nSr5af7d7zvKN
         9Gxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705329297; x=1705934097;
        h=content-transfer-encoding:in-reply-to:autocrypt:references:cc:to
         :from:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kdcFdpBiOv5Ief4bXCoTgvxcM2tE3ReF1qPR03/fxTY=;
        b=TeMQQDE9K+ftjLGqvrMfygTJMS9r//iHPqWilq0+/x+cx772EiiJc3uUJXlYGcIIeE
         sQSbQ2HI3ew/HYOUju0J3KpH/z2Nihef4N/y9PiHeqH9Pw5vanfUcE85TSxQzNcufDOr
         +wObGwmlmOiqlr3NxxepSpixz0Y1VThZLqgrJlcbNshxnErYdkYws/A02sQjofXZm2J0
         f36VnpGa4drllbnlNfrEANVYZfCQdidtm9N5oP9IAn3+dGhD0A41kFl8i6dOssEHvAQ1
         7CfgclKxIDgrlRUSsjteiqxSdBTsuj7TJ5NfSFxL6HB17ye4U91e81kzQ2D0IbIa81lO
         3XDg==
X-Gm-Message-State: AOJu0YxIxP4hMzEjuBJj8AYxdtY3bYU1YbclTprgv9MtpWnRWOjQKv4v
	TXwLlNWjcdZX3q+NCclO4Ltr2MiDbjjSAYSqJodHPitYvw==
X-Google-Smtp-Source: AGHT+IG6HDtHXNVAxNe3LNwf/lfwnlq/riqmAt11HlHUKGz4GjGi63Byw/qUV1MnEYYwxA9N3RMc/w==
X-Received: by 2002:a05:600c:1d26:b0:40e:61f1:ba3 with SMTP id l38-20020a05600c1d2600b0040e61f10ba3mr2820851wms.36.1705329296994;
        Mon, 15 Jan 2024 06:34:56 -0800 (PST)
Message-ID: <9096ad1a-5d86-4dd1-a7c3-6ad2f7e5a623@suse.com>
Date: Mon, 15 Jan 2024 15:34:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v5 2/8] x86: annotate entry points with type and size
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>
References: <e4bf47ca-2ae6-1fd4-56a6-e4e777150b64@suse.com>
 <7a133ed9-9d13-4e2c-893a-00c083c8a35d@suse.com>
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
In-Reply-To: <7a133ed9-9d13-4e2c-893a-00c083c8a35d@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Use the generic framework in xen/linkage.h.

For switch_to_kernel() and restore_all_guest() so far implicit alignment
(from being first in their respective sections) is being made explicit
(as in: using FUNC() without 2nd argument). Whereas for
{,compat}create_bounce_frame() and autogen_entrypoints[] alignment is
newly arranged for.

Except for the added/adjusted alignment padding (including their
knock-on effects) no change in generated code/data. Note that the basis
for support of weak definitions is added despite them not having any use
right now.

Note that ASM_INT() is switched to DATA(), not DATA_LOCAL(), as the only
use site wants the symbol global anyway.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
v5: Re-base.
v4: Correct simd_coprocessor_error's (now entry_XM) END(). Re-base.
v3: !PV variant of ret_from_intr is local. Introduction of macros split
    off to separate patch. Also adjust ASM_INT(). Re-base.
v2: Full rework.
---
Only two of the assembly files are being converted for now. More could
be done right here or as follow-on in separate patches.

Note that the FB-label in autogen_stubs() cannot be converted just yet:
Such labels cannot be used with .type. We could further diverge from
Linux'es model and avoid setting STT_NOTYPE explicitly (that's the type
labels get by default anyway).

The ASM_INT() redundancy of .global will be eliminated by a subsequent
patch.

I didn't think that I should make CODE_FILL evaluate to 0xCC right here;
IMO that wants to be a separate patch.

--- a/xen/arch/x86/include/asm/asm_defns.h
+++ b/xen/arch/x86/include/asm/asm_defns.h
@@ -13,6 +13,7 @@
 #include <asm/alternative.h>
 
 #ifdef __ASSEMBLY__
+#include <xen/linkage.h>
 #include <asm/asm-defns.h>
 #ifndef CONFIG_INDIRECT_THUNK
 .equ CONFIG_INDIRECT_THUNK, 0
@@ -343,10 +344,7 @@ static always_inline void stac(void)
     .popsection
 
 #define ASM_INT(label, val)                 \
-    .p2align 2;                             \
-label: .long (val);                         \
-    .size label, . - label;                 \
-    .type label, @object
+    DATA(label, 4) .long (val); END(label)
 
 #define ASM_CONSTANT(name, value)                \
     asm ( ".equ " #name ", %P0; .global " #name  \
--- a/xen/arch/x86/include/asm/config.h
+++ b/xen/arch/x86/include/asm/config.h
@@ -43,7 +43,9 @@
 
 /* Linkage for x86 */
 #ifdef __ASSEMBLY__
-#define ALIGN .align 16,0x90
+#define CODE_ALIGN 16
+#define CODE_FILL 0x90
+#define ALIGN .align CODE_ALIGN, CODE_FILL
 #define ENTRY(name)                             \
   .globl name;                                  \
   ALIGN;                                        \
--- a/xen/arch/x86/x86_64/compat/entry.S
+++ b/xen/arch/x86/x86_64/compat/entry.S
@@ -11,7 +11,7 @@
 #include <public/xen.h>
 #include <irq_vectors.h>
 
-ENTRY(entry_int82)
+FUNC(entry_int82)
         ENDBR64
         ALTERNATIVE "", clac, X86_FEATURE_XEN_SMAP
         pushq $0
@@ -29,9 +29,10 @@ ENTRY(entry_int82)
 
         mov   %rsp, %rdi
         call  do_entry_int82
+END(entry_int82)
 
 /* %rbx: struct vcpu */
-ENTRY(compat_test_all_events)
+FUNC(compat_test_all_events)
         ASSERT_NOT_IN_ATOMIC
         cli                             # tests must not race interrupts
 /*compat_test_softirqs:*/
@@ -68,24 +69,21 @@ compat_test_guest_events:
         call  compat_create_bounce_frame
         jmp   compat_test_all_events
 
-        ALIGN
 /* %rbx: struct vcpu */
-compat_process_softirqs:
+LABEL_LOCAL(compat_process_softirqs)
         sti
         call  do_softirq
         jmp   compat_test_all_events
 
-        ALIGN
 /* %rbx: struct vcpu, %rdx: struct trap_bounce */
-.Lcompat_process_trapbounce:
+LABEL_LOCAL(.Lcompat_process_trapbounce)
         sti
 .Lcompat_bounce_exception:
         call  compat_create_bounce_frame
         jmp   compat_test_all_events
 
-	ALIGN
 /* %rbx: struct vcpu */
-compat_process_mce:
+LABEL_LOCAL(compat_process_mce)
         testb $1 << VCPU_TRAP_MCE,VCPU_async_exception_mask(%rbx)
         jnz   .Lcompat_test_guest_nmi
         sti
@@ -99,9 +97,8 @@ compat_process_mce:
         movb %dl,VCPU_async_exception_mask(%rbx)
         jmp   compat_process_trap
 
-	ALIGN
 /* %rbx: struct vcpu */
-compat_process_nmi:
+LABEL_LOCAL(compat_process_nmi)
         testb $1 << VCPU_TRAP_NMI,VCPU_async_exception_mask(%rbx)
         jnz   compat_test_guest_events
         sti
@@ -118,9 +115,10 @@ compat_process_trap:
         leaq  VCPU_trap_bounce(%rbx),%rdx
         call  compat_create_bounce_frame
         jmp   compat_test_all_events
+END(compat_test_all_events)
 
 /* %rbx: struct vcpu, interrupts disabled */
-ENTRY(compat_restore_all_guest)
+FUNC(compat_restore_all_guest)
         ASSERT_INTERRUPTS_DISABLED
         mov   $~(X86_EFLAGS_IOPL | X86_EFLAGS_VM), %r11d
         and   UREGS_eflags(%rsp),%r11d
@@ -163,9 +161,10 @@ ENTRY(compat_restore_all_guest)
         RESTORE_ALL adj=8 compat=1
 .Lft0:  iretq
         _ASM_PRE_EXTABLE(.Lft0, handle_exception)
+END(compat_restore_all_guest)
 
 /* This mustn't modify registers other than %rax. */
-ENTRY(cr4_pv32_restore)
+FUNC(cr4_pv32_restore)
         push  %rdx
         GET_CPUINFO_FIELD(cr4, dx)
         mov   (%rdx), %rax
@@ -195,8 +194,9 @@ ENTRY(cr4_pv32_restore)
         pop   %rdx
         xor   %eax, %eax
         ret
+END(cr4_pv32_restore)
 
-ENTRY(compat_syscall)
+FUNC(compat_syscall)
         /* Fix up reported %cs/%ss for compat domains. */
         movl  $FLAT_COMPAT_USER_SS, UREGS_ss(%rsp)
         movl  $FLAT_COMPAT_USER_CS, UREGS_cs(%rsp)
@@ -224,8 +224,9 @@ UNLIKELY_END(compat_syscall_gpf)
         movw  %si,TRAPBOUNCE_cs(%rdx)
         movb  %cl,TRAPBOUNCE_flags(%rdx)
         jmp   .Lcompat_bounce_exception
+END(compat_syscall)
 
-ENTRY(compat_sysenter)
+FUNC(compat_sysenter)
         CR4_PV32_RESTORE
         movq  VCPU_trap_ctxt(%rbx),%rcx
         cmpb  $X86_EXC_GP, UREGS_entry_vector(%rsp)
@@ -238,17 +239,19 @@ ENTRY(compat_sysenter)
         movw  %ax,TRAPBOUNCE_cs(%rdx)
         call  compat_create_bounce_frame
         jmp   compat_test_all_events
+END(compat_sysenter)
 
-ENTRY(compat_int80_direct_trap)
+FUNC(compat_int80_direct_trap)
         CR4_PV32_RESTORE
         call  compat_create_bounce_frame
         jmp   compat_test_all_events
+END(compat_int80_direct_trap)
 
 /* CREATE A BASIC EXCEPTION FRAME ON GUEST OS (RING-1) STACK:            */
 /*   {[ERRCODE,] EIP, CS, EFLAGS, [ESP, SS]}                             */
 /* %rdx: trap_bounce, %rbx: struct vcpu                                  */
 /* On return only %rbx and %rdx are guaranteed non-clobbered.            */
-compat_create_bounce_frame:
+FUNC_LOCAL(compat_create_bounce_frame)
         ASSERT_INTERRUPTS_ENABLED
         mov   %fs,%edi
         ALTERNATIVE "", stac, X86_FEATURE_XEN_SMAP
@@ -354,3 +357,4 @@ compat_crash_page_fault:
         jmp   .Lft14
 .previous
         _ASM_EXTABLE(.Lft14, .Lfx14)
+END(compat_create_bounce_frame)
--- a/xen/arch/x86/x86_64/entry.S
+++ b/xen/arch/x86/x86_64/entry.S
@@ -24,7 +24,7 @@
 
 #ifdef CONFIG_PV
 /* %rbx: struct vcpu */
-switch_to_kernel:
+FUNC_LOCAL(switch_to_kernel)
         leaq  VCPU_trap_bounce(%rbx),%rdx
 
         /* TB_eip = 32-bit syscall ? syscall32_addr : syscall_addr */
@@ -89,24 +89,21 @@ test_guest_events:
         call  create_bounce_frame
         jmp   test_all_events
 
-        ALIGN
 /* %rbx: struct vcpu */
-process_softirqs:
+LABEL_LOCAL(process_softirqs)
         sti
         call do_softirq
         jmp  test_all_events
 
-        ALIGN
 /* %rbx: struct vcpu, %rdx struct trap_bounce */
-.Lprocess_trapbounce:
+LABEL_LOCAL(.Lprocess_trapbounce)
         sti
 .Lbounce_exception:
         call  create_bounce_frame
         jmp   test_all_events
 
-        ALIGN
 /* %rbx: struct vcpu */
-process_mce:
+LABEL_LOCAL(process_mce)
         testb $1 << VCPU_TRAP_MCE, VCPU_async_exception_mask(%rbx)
         jnz  .Ltest_guest_nmi
         sti
@@ -120,9 +117,8 @@ process_mce:
         movb %dl, VCPU_async_exception_mask(%rbx)
         jmp  process_trap
 
-        ALIGN
 /* %rbx: struct vcpu */
-process_nmi:
+LABEL_LOCAL(process_nmi)
         testb $1 << VCPU_TRAP_NMI, VCPU_async_exception_mask(%rbx)
         jnz  test_guest_events
         sti
@@ -139,11 +135,12 @@ process_trap:
         leaq VCPU_trap_bounce(%rbx), %rdx
         call create_bounce_frame
         jmp  test_all_events
+END(switch_to_kernel)
 
         .section .text.entry, "ax", @progbits
 
 /* %rbx: struct vcpu, interrupts disabled */
-restore_all_guest:
+FUNC_LOCAL(restore_all_guest)
         ASSERT_INTERRUPTS_DISABLED
 
         /* Stash guest SPEC_CTRL value while we can read struct vcpu. */
@@ -220,8 +217,7 @@ restore_all_guest:
         sysretq
 1:      sysretl
 
-        ALIGN
-.Lrestore_rcx_iret_exit_to_guest:
+LABEL_LOCAL(.Lrestore_rcx_iret_exit_to_guest)
         movq  8(%rsp), %rcx           # RIP
 /* No special register assumptions. */
 iret_exit_to_guest:
@@ -230,6 +226,7 @@ iret_exit_to_guest:
         addq  $8,%rsp
 .Lft0:  iretq
         _ASM_PRE_EXTABLE(.Lft0, handle_exception)
+END(restore_all_guest)
 
 /*
  * When entering SYSCALL from kernel mode:
@@ -246,7 +243,7 @@ iret_exit_to_guest:
  *  - Guest %rsp stored in %rax
  *  - Xen stack loaded, pointing at the %ss slot
  */
-ENTRY(lstar_enter)
+FUNC(lstar_enter)
 #ifdef CONFIG_XEN_SHSTK
         ALTERNATIVE "", "setssbsy", X86_FEATURE_XEN_SHSTK
 #endif
@@ -281,9 +278,10 @@ ENTRY(lstar_enter)
         mov   %rsp, %rdi
         call  pv_hypercall
         jmp   test_all_events
+END(lstar_enter)
 
 /* See lstar_enter for entry register state. */
-ENTRY(cstar_enter)
+FUNC(cstar_enter)
 #ifdef CONFIG_XEN_SHSTK
         ALTERNATIVE "", "setssbsy", X86_FEATURE_XEN_SHSTK
 #endif
@@ -321,8 +319,9 @@ ENTRY(cstar_enter)
         jne   compat_syscall
 #endif
         jmp   switch_to_kernel
+END(cstar_enter)
 
-ENTRY(sysenter_entry)
+FUNC(sysenter_entry)
         ENDBR64
 #ifdef CONFIG_XEN_SHSTK
         ALTERNATIVE "", "setssbsy", X86_FEATURE_XEN_SHSTK
@@ -330,7 +329,7 @@ ENTRY(sysenter_entry)
         pushq $FLAT_USER_SS
         pushq $0
         pushfq
-GLOBAL(sysenter_eflags_saved)
+LABEL(sysenter_eflags_saved, 0)
         ALTERNATIVE "", clac, X86_FEATURE_XEN_SMAP
         pushq $3 /* ring 3 null cs */
         pushq $0 /* null rip */
@@ -384,8 +383,9 @@ UNLIKELY_END(sysenter_gpf)
         jne   compat_sysenter
 #endif
         jmp   .Lbounce_exception
+END(sysenter_entry)
 
-ENTRY(entry_int80)
+FUNC(entry_int80)
         ENDBR64
         ALTERNATIVE "", clac, X86_FEATURE_XEN_SMAP
         pushq $0
@@ -473,6 +473,7 @@ int80_slow_path:
          */
         GET_STACK_END(14)
         jmp   handle_exception_saved
+END(entry_int80)
 
         /* create_bounce_frame & helpers don't need to be in .text.entry */
         .text
@@ -481,7 +482,7 @@ int80_slow_path:
 /*   { RCX, R11, [ERRCODE,] RIP, CS, RFLAGS, RSP, SS }                   */
 /* %rdx: trap_bounce, %rbx: struct vcpu                                  */
 /* On return only %rbx and %rdx are guaranteed non-clobbered.            */
-create_bounce_frame:
+FUNC_LOCAL(create_bounce_frame)
         ASSERT_INTERRUPTS_ENABLED
         testb $TF_kernel_mode,VCPU_thread_flags(%rbx)
         jnz   1f
@@ -617,6 +618,7 @@ ENTRY(dom_crash_sync_extable)
         xorl  %edi,%edi
         jmp   asm_domain_crash_synchronous /* Does not return */
         .popsection
+END(create_bounce_frame)
 #endif /* CONFIG_PV */
 
 /* --- CODE BELOW THIS LINE (MOSTLY) NOT GUEST RELATED --- */
@@ -625,7 +627,7 @@ ENTRY(dom_crash_sync_extable)
 
 /* No special register assumptions. */
 #ifdef CONFIG_PV
-ENTRY(continue_pv_domain)
+FUNC(continue_pv_domain)
         ENDBR64
         call  check_wakeup_from_wait
 ret_from_intr:
@@ -640,26 +642,28 @@ ret_from_intr:
 #else
         jmp   test_all_events
 #endif
+END(continue_pv_domain)
 #else
-ret_from_intr:
+FUNC_LOCAL(ret_from_intr, 0)
         ASSERT_CONTEXT_IS_XEN
         jmp   restore_all_xen
+END(ret_from_intr)
 #endif
 
         .section .init.text, "ax", @progbits
-ENTRY(early_page_fault)
+FUNC(early_page_fault)
         ENDBR64
         movl  $X86_EXC_PF, 4(%rsp)
         SAVE_ALL
         movq  %rsp, %rdi
         call  do_early_page_fault
         jmp   restore_all_xen
+END(early_page_fault)
 
         .section .text.entry, "ax", @progbits
 
-        ALIGN
 /* %r12=ist_exit */
-restore_all_xen:
+FUNC_LOCAL(restore_all_xen)
 
 #ifdef CONFIG_DEBUG
         mov   %rsp, %rdi
@@ -683,8 +687,9 @@ UNLIKELY_END(exit_cr3)
 
         RESTORE_ALL adj=8
         iretq
+END(restore_all_xen)
 
-ENTRY(common_interrupt)
+FUNC(common_interrupt)
         ALTERNATIVE "", clac, X86_FEATURE_XEN_SMAP
         SAVE_ALL
 
@@ -713,12 +718,14 @@ ENTRY(common_interrupt)
         mov   %r15, STACK_CPUINFO_FIELD(xen_cr3)(%r14)
         mov   %bl, STACK_CPUINFO_FIELD(use_pv_cr3)(%r14)
         jmp ret_from_intr
+END(common_interrupt)
 
-ENTRY(entry_PF)
+FUNC(entry_PF)
         ENDBR64
         movl  $X86_EXC_PF, 4(%rsp)
+END(entry_PF)
 /* No special register assumptions. */
-GLOBAL(handle_exception)
+FUNC(handle_exception, 0)
         ALTERNATIVE "", clac, X86_FEATURE_XEN_SMAP
         SAVE_ALL
 
@@ -886,92 +893,108 @@ FATAL_exception_with_ints_disabled:
         xorl  %esi,%esi
         movq  %rsp,%rdi
         tailcall fatal_trap
+END(handle_exception)
 
-ENTRY(entry_DE)
+FUNC(entry_DE)
         ENDBR64
         pushq $0
         movl  $X86_EXC_DE, 4(%rsp)
         jmp   handle_exception
+END(entry_DE)
 
-ENTRY(entry_MF)
+FUNC(entry_MF)
         ENDBR64
         pushq $0
         movl  $X86_EXC_MF, 4(%rsp)
         jmp   handle_exception
+END(entry_MF)
 
-ENTRY(entry_XM)
+FUNC(entry_XM)
         ENDBR64
         pushq $0
         movl  $X86_EXC_XM, 4(%rsp)
         jmp   handle_exception
+END(entry_XM)
 
-ENTRY(entry_NM)
+FUNC(entry_NM)
         ENDBR64
         pushq $0
         movl  $X86_EXC_NM, 4(%rsp)
         jmp   handle_exception
+END(entry_NM)
 
-ENTRY(entry_DB)
+FUNC(entry_DB)
         ENDBR64
         pushq $0
         movl  $X86_EXC_DB, 4(%rsp)
         jmp   handle_ist_exception
+END(entry_DB)
 
-ENTRY(entry_BP)
+FUNC(entry_BP)
         ENDBR64
         pushq $0
         movl  $X86_EXC_BP, 4(%rsp)
         jmp   handle_exception
+END(entry_BP)
 
-ENTRY(entry_OF)
+FUNC(entry_OF)
         ENDBR64
         pushq $0
         movl  $X86_EXC_OF, 4(%rsp)
         jmp   handle_exception
+END(entry_OF)
 
-ENTRY(entry_BR)
+FUNC(entry_BR)
         ENDBR64
         pushq $0
         movl  $X86_EXC_BR, 4(%rsp)
         jmp   handle_exception
+END(entry_BR)
 
-ENTRY(entry_UD)
+FUNC(entry_UD)
         ENDBR64
         pushq $0
         movl  $X86_EXC_UD, 4(%rsp)
         jmp   handle_exception
+END(entry_UD)
 
-ENTRY(entry_TS)
+FUNC(entry_TS)
         ENDBR64
         movl  $X86_EXC_TS, 4(%rsp)
         jmp   handle_exception
+END(entry_TS)
 
-ENTRY(entry_NP)
+FUNC(entry_NP)
         ENDBR64
         movl  $X86_EXC_NP, 4(%rsp)
         jmp   handle_exception
+END(entry_NP)
 
-ENTRY(entry_SS)
+FUNC(entry_SS)
         ENDBR64
         movl  $X86_EXC_SS, 4(%rsp)
         jmp   handle_exception
+END(entry_SS)
 
-ENTRY(entry_GP)
+FUNC(entry_GP)
         ENDBR64
         movl  $X86_EXC_GP, 4(%rsp)
         jmp   handle_exception
+END(entry_GP)
 
-ENTRY(entry_AC)
+FUNC(entry_AC)
         ENDBR64
         movl  $X86_EXC_AC, 4(%rsp)
         jmp   handle_exception
+END(entry_AC)
 
-ENTRY(entry_CP)
+FUNC(entry_CP)
         ENDBR64
         movl  $X86_EXC_CP, 4(%rsp)
         jmp   handle_exception
+END(entry_CP)
 
-ENTRY(entry_DF)
+FUNC(entry_DF)
         ENDBR64
         movl  $X86_EXC_DF, 4(%rsp)
         /* Set AC to reduce chance of further SMAP faults */
@@ -994,8 +1017,9 @@ ENTRY(entry_DF)
 
         movq  %rsp,%rdi
         tailcall do_double_fault
+END(entry_DF)
 
-ENTRY(entry_NMI)
+FUNC(entry_NMI)
         ENDBR64
         pushq $0
         movl  $X86_EXC_NMI, 4(%rsp)
@@ -1126,21 +1150,24 @@ handle_ist_exception:
         ASSERT_CONTEXT_IS_XEN
         jmp   restore_all_xen
 #endif
+END(entry_NMI)
 
-ENTRY(entry_MC)
+FUNC(entry_MC)
         ENDBR64
         pushq $0
         movl  $X86_EXC_MC, 4(%rsp)
         jmp   handle_ist_exception
+END(entry_MC)
 
 /* No op trap handler.  Required for kexec crash path. */
-GLOBAL(trap_nop)
+FUNC(trap_nop, 0)
         ENDBR64
         iretq
+END(trap_nop)
 
 /* Table of automatically generated entry points.  One per vector. */
         .pushsection .init.rodata, "a", @progbits
-GLOBAL(autogen_entrypoints)
+DATA(autogen_entrypoints, 8)
         /* pop into the .init.rodata section and record an entry point. */
         .macro entrypoint ent
         .pushsection .init.rodata, "a", @progbits
@@ -1149,7 +1176,7 @@ GLOBAL(autogen_entrypoints)
         .endm
 
         .popsection
-autogen_stubs: /* Automatically generated stubs. */
+FUNC_LOCAL(autogen_stubs, 0) /* Automatically generated stubs. */
 
         vec = 0
         .rept X86_NR_VECTORS
@@ -1193,6 +1220,7 @@ autogen_stubs: /* Automatically generate
 
         vec = vec + 1
         .endr
+END(autogen_stubs)
 
         .section .init.rodata, "a", @progbits
-        .size autogen_entrypoints, . - autogen_entrypoints
+END(autogen_entrypoints)


