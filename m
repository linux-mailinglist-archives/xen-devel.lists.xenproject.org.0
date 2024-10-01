Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AEEA98C14C
	for <lists+xen-devel@lfdr.de>; Tue,  1 Oct 2024 17:13:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.808222.1220064 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sveZA-0004fn-Mq; Tue, 01 Oct 2024 15:13:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 808222.1220064; Tue, 01 Oct 2024 15:13:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sveZA-0004du-Je; Tue, 01 Oct 2024 15:13:32 +0000
Received: by outflank-mailman (input) for mailman id 808222;
 Tue, 01 Oct 2024 15:13:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jjk+=Q5=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sveZ8-0004dm-Vz
 for xen-devel@lists.xenproject.org; Tue, 01 Oct 2024 15:13:30 +0000
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [2a00:1450:4864:20::533])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b70f189b-8007-11ef-a0ba-8be0dac302b0;
 Tue, 01 Oct 2024 17:13:29 +0200 (CEST)
Received: by mail-ed1-x533.google.com with SMTP id
 4fb4d7f45d1cf-5c8a2579d94so1558032a12.0
 for <xen-devel@lists.xenproject.org>; Tue, 01 Oct 2024 08:13:29 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5c88248ac03sm6322625a12.70.2024.10.01.08.13.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Oct 2024 08:13:28 -0700 (PDT)
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
X-Inumbo-ID: b70f189b-8007-11ef-a0ba-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1727795609; x=1728400409; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:cc:content-language
         :references:to:from:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MFMsW/wRbAntN1ywNrqdWfg/vYh1ksc4dUgSKs8Nz/g=;
        b=C74fy+M5qWT+Wp/qu5uwiw/PAgn9EtntkNjQ/1PX/7TlAMlCjAKhXRThztwqceHbAl
         Hox+/JFdytGw8bqpo6lnD/mQKgvIjO98jAnoQXrUDTTmLTPc24j4930zbpae3AYBh+x7
         0GlHJNr9YF1+NLFE1DoZgAxVn797PFw8qGVcWkdM1j8Zz9kVmR2BS5vMqGKOCIOoKM9A
         qrMkQ5PVxNI5SujjolkU3XJeyd1rHbHuzbwjxvacLgOyWdSGkYuaWzCBjWjkVgv+FDJM
         VS2JczWauQ2WhLuChRydkL4zh0UyXftrQRfM1qQ9je7X9nNWJL3ake5zWqe8WyQdBWJP
         OVFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727795609; x=1728400409;
        h=content-transfer-encoding:in-reply-to:autocrypt:cc:content-language
         :references:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MFMsW/wRbAntN1ywNrqdWfg/vYh1ksc4dUgSKs8Nz/g=;
        b=cwWr1/XO+zj2zBuTHnsj6DzgwjlrI6F5mZF+bdl41GcqbGAoH5p+NaxYfsN8j4IrdB
         f8nDtGv1XWaMe8VLGGUDwELelQ3RZtYRyEoY8wImb/reBn4zaVS2TDRoenLNyUFwedbx
         TjNxEOBgrimhb7+JoijLS7XW+yD+lgdJaoa3rThQAtn9gzW4ePQOAAv6IwxYBjfJrqR1
         iGWKw7Vwcucv9G/iTCCP1l6qNgZbscKQ58p9vQvz855O5mbZkxLfY4JMJQQmb+zTpAe/
         /VjrKl+5yqf1a2UhAsBclwp8nJErBqNvg22tnIiDSfxVq6FCcJvF3jx/7iTxERq+agNe
         lpuA==
X-Gm-Message-State: AOJu0YxUgKdi6YKfKgkKwQiQUWDltiUGTBsJUvkwnRYjgCGaM9jUADzq
	TFJf1NjV84HqDV43W5JTLJ+TFgMUQUE8rhJDfJl9Z+ya3xKiFKkyKEdAv2eI77yyugZOVMuTdzs
	=
X-Google-Smtp-Source: AGHT+IF06nAhQG8jhYQjzfuEodRaIskf0J+EBXEzZkU3KoNpcmp++Qo7IYv2rGM1Zl99zwK+tnYlJw==
X-Received: by 2002:a05:6402:3605:b0:5c8:75e1:da28 with SMTP id 4fb4d7f45d1cf-5c882602bfdmr12488368a12.22.1727795609002;
        Tue, 01 Oct 2024 08:13:29 -0700 (PDT)
Message-ID: <f06462e8-1a2a-4f2e-b728-c2bc42f73f7d@suse.com>
Date: Tue, 1 Oct 2024 17:13:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v7 01/11] common: honor CONFIG_CC_SPLIT_SECTIONS also for
 assembly functions
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <e4bf47ca-2ae6-1fd4-56a6-e4e777150b64@suse.com>
 <98590a41-cee7-4ba3-a723-4e3ee3b55357@suse.com>
Content-Language: en-US
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Shawn Anastasio <sanastasio@raptorengineering.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>
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
In-Reply-To: <98590a41-cee7-4ba3-a723-4e3ee3b55357@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Leverage the new infrastructure in xen/linkage.h to also switch to per-
function sections (when configured), deriving the specific name from the
"base" section in use at the time FUNC() is invoked.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
TBD: Since we use .subsection in UNLIKELY_START(), a perhaps not really
     wanted side effect of this change is that respective out-of-line
     code now moves much closer to its original (invoking) code.

TBD: Of course something with the same overall effect, but less
     impactful might do in Config.mk. E.g. $(filter-out -D%,$(3))
     instead of $(firstword (3)). In fact Roger wants the detection to
     be in Kconfig, for LIVEPATCH to depend on it. Yet the whole
     underlying discussion there imo would first need settling (and
     therefore reviving).

Note that we'd need to split DATA() in order to separate r/w and r/o
contributions. Further splitting might be needed to also support more
advanced attributes (e.g. merge), hence why this isn't done right here.
Sadly while a new section's name can be derived from the presently in
use, its attributes cannot be. Perhaps the only thing we can do is give
DATA() a 2nd mandatory parameter. Then again I guess most data
definitions could be moved to C anyway.
---
v7: Override SYM_PUSH_SECTION() in arch/x86/indirect-thunk.S. Re-base,
    notably to deal with fallout from fba250ae604e ("xen/arm64: head:
    Add missing code symbol annotations").
v6: Deal with x86'es entry_PF() and entry_int82() falling through to the
    next "function". Re-base.
v5: Re-base over changes earlier in the series.
v4: Re-base.
v2: Make detection properly fail on old gas (by adjusting
    cc-option-add-closure).

--- a/Config.mk
+++ b/Config.mk
@@ -102,7 +102,7 @@ cc-option = $(shell if $(1) $(2:-Wno-%=-
 # Usage: $(call cc-option-add CFLAGS,CC,-march=winchip-c6)
 cc-option-add = $(eval $(call cc-option-add-closure,$(1),$(2),$(3)))
 define cc-option-add-closure
-    ifneq ($$(call cc-option,$$($(2)),$(3),n),n)
+    ifneq ($$(call cc-option,$$($(2)),$(firstword $(3)),n),n)
         $(1) += $(3)
     endif
 endef
--- a/xen/Makefile
+++ b/xen/Makefile
@@ -412,6 +412,9 @@ AFLAGS += -D__ASSEMBLY__
 
 $(call cc-option-add,AFLAGS,CC,-Wa$$(comma)--noexecstack)
 
+# Check to see whether the assembler supports the --sectname-subst option.
+$(call cc-option-add,AFLAGS,CC,-Wa$$(comma)--sectname-subst -DHAVE_AS_SECTNAME_SUBST)
+
 LDFLAGS-$(call ld-option,--warn-rwx-segments) += --no-warn-rwx-segments
 
 CFLAGS += $(CFLAGS-y)
--- a/xen/arch/arm/arm64/head.S
+++ b/xen/arch/arm/arm64/head.S
@@ -90,7 +90,7 @@
  * 4K-aligned address.
  */
 
-FUNC(start)
+LABEL(start)
         /*
          * DO NOT MODIFY. Image header expected by Linux boot-loaders.
          */
@@ -224,7 +224,7 @@ section_table:
         .align  5
 #endif /* CONFIG_ARM_EFI */
 
-FUNC_LOCAL(real_start)
+LABEL_LOCAL(real_start)
         /* BSS should be zeroed when booting without EFI */
         mov   x26, #0                /* x26 := skip_zero_bss */
 
--- a/xen/arch/arm/xen.lds.S
+++ b/xen/arch/arm/xen.lds.S
@@ -152,6 +152,9 @@ SECTIONS
   .init.text : {
        _sinittext = .;
        *(.init.text)
+#ifdef CONFIG_CC_SPLIT_SECTIONS
+       *(.init.text.*)
+#endif
        _einittext = .;
        . = ALIGN(PAGE_SIZE);        /* Avoid mapping alt insns executable */
        *(.altinstr_replacement)
--- a/xen/arch/ppc/xen.lds.S
+++ b/xen/arch/ppc/xen.lds.S
@@ -99,6 +99,9 @@ SECTIONS
     DECL_SECTION(.init.text) {
         _sinittext = .;
         *(.init.text)
+#ifdef CONFIG_CC_SPLIT_SECTIONS
+        *(.init.text.*)
+#endif
         _einittext = .;
         . = ALIGN(PAGE_SIZE);        /* Avoid mapping alt insns executable */
     } :text
--- a/xen/arch/riscv/xen.lds.S
+++ b/xen/arch/riscv/xen.lds.S
@@ -96,6 +96,9 @@ SECTIONS
     .init.text : {
         _sinittext = .;
         *(.init.text)
+#ifdef CONFIG_CC_SPLIT_SECTIONS
+        *(.init.text.*)
+#endif
         _einittext = .;
         . = ALIGN(PAGE_SIZE);        /* Avoid mapping alt insns executable */
     } :text
--- a/xen/arch/x86/indirect-thunk.S
+++ b/xen/arch/x86/indirect-thunk.S
@@ -11,6 +11,10 @@
 
 #include <asm/asm_defns.h>
 
+/* Section placement is done explicitly here; override the respective macro. */
+#undef SYM_PUSH_SECTION
+#define SYM_PUSH_SECTION(name, attr)
+
 .macro IND_THUNK_RETPOLINE reg:req
         call 1f
         int3
--- a/xen/arch/x86/x86_64/compat/entry.S
+++ b/xen/arch/x86/x86_64/compat/entry.S
@@ -31,6 +31,9 @@ FUNC(entry_int82)
 
         mov   %rsp, %rdi
         call  do_entry_int82
+#ifdef CONFIG_CC_SPLIT_SECTIONS
+        jmp   compat_test_all_events
+#endif
 END(entry_int82)
 
 /* %rbx: struct vcpu */
--- a/xen/arch/x86/x86_64/entry.S
+++ b/xen/arch/x86/x86_64/entry.S
@@ -771,6 +771,9 @@ END(common_interrupt)
 FUNC(entry_PF)
         ENDBR64
         movb  $X86_EXC_PF, EFRAME_entry_vector(%rsp)
+#ifdef CONFIG_CC_SPLIT_SECTIONS
+        jmp   handle_exception
+#endif
 END(entry_PF)
 /* No special register assumptions. */
 FUNC(handle_exception, 0)
@@ -1084,8 +1087,11 @@ FUNC(entry_NMI)
         ENDBR64
         pushq $0
         movb  $X86_EXC_NMI, EFRAME_entry_vector(%rsp)
+#ifdef CONFIG_CC_SPLIT_SECTIONS
+        jmp   handle_ist_exception
+#endif
 END(entry_NMI)
-
+/* No special register assumptions. */
 FUNC(handle_ist_exception)
         ALTERNATIVE "", clac, X86_FEATURE_XEN_SMAP
         SAVE_ALL
--- a/xen/arch/x86/xen.lds.S
+++ b/xen/arch/x86/xen.lds.S
@@ -82,6 +82,9 @@ SECTIONS
        . = ALIGN(PAGE_SIZE);
        _stextentry = .;
        *(.text.entry)
+#ifdef CONFIG_CC_SPLIT_SECTIONS
+       *(.text.entry.*)
+#endif
        . = ALIGN(PAGE_SIZE);
        _etextentry = .;
 
@@ -201,6 +204,9 @@ SECTIONS
 #endif
        _sinittext = .;
        *(.init.text)
+#ifdef CONFIG_CC_SPLIT_SECTIONS
+       *(.init.text.*)
+#endif
        *(.text.startup)
        _einittext = .;
        /*
--- a/xen/include/xen/linkage.h
+++ b/xen/include/xen/linkage.h
@@ -18,6 +18,14 @@
 
 #define SYM_ALIGN(align...) .balign align
 
+#if defined(HAVE_AS_SECTNAME_SUBST) && defined(CONFIG_CC_SPLIT_SECTIONS)
+# define SYM_PUSH_SECTION(name, attr) \
+         .pushsection %S.name, attr, %progbits; \
+         .equ .Lsplit_section, 1
+#else
+# define SYM_PUSH_SECTION(name, attr)
+#endif
+
 #define SYM_L_GLOBAL(name) .globl name; .hidden name
 #define SYM_L_WEAK(name)   .weak name
 #define SYM_L_LOCAL(name)  /* nothing */
@@ -32,7 +40,14 @@
         SYM_ALIGN(align);                         \
         name:
 
-#define END(name) .size name, . - name
+#define END(name) \
+        .size name, . - name; \
+        .ifdef .Lsplit_section; \
+            .if .Lsplit_section; \
+                .popsection; \
+                .equ .Lsplit_section, 0; \
+            .endif; \
+        .endif
 
 /*
  * CODE_FILL in particular may need to expand to nothing (e.g. for RISC-V), in
@@ -47,6 +62,7 @@
 #endif
 
 #define FUNC(name, align...) \
+        SYM_PUSH_SECTION(name, "ax"); \
         SYM(name, FUNC, GLOBAL, DO_CODE_ALIGN(align))
 #define LABEL(name, align...) \
         SYM(name, NONE, GLOBAL, DO_CODE_ALIGN(align))
@@ -54,6 +70,7 @@
         SYM(name, DATA, GLOBAL, LASTARG(DATA_ALIGN, ## align), DATA_FILL)
 
 #define FUNC_LOCAL(name, align...) \
+        SYM_PUSH_SECTION(name, "ax"); \
         SYM(name, FUNC, LOCAL, DO_CODE_ALIGN(align))
 #define LABEL_LOCAL(name, align...) \
         SYM(name, NONE, LOCAL, DO_CODE_ALIGN(align))


