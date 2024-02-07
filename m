Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 89B5784CBB4
	for <lists+xen-devel@lfdr.de>; Wed,  7 Feb 2024 14:36:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.677560.1054227 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rXi6Y-0008EB-8d; Wed, 07 Feb 2024 13:36:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 677560.1054227; Wed, 07 Feb 2024 13:36:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rXi6Y-0008B6-5T; Wed, 07 Feb 2024 13:36:46 +0000
Received: by outflank-mailman (input) for mailman id 677560;
 Wed, 07 Feb 2024 13:36:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=EHwQ=JQ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rXi6W-0007fa-W5
 for xen-devel@lists.xenproject.org; Wed, 07 Feb 2024 13:36:44 +0000
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [2a00:1450:4864:20::42a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ede63ab8-c5bd-11ee-98f5-efadbce2ee36;
 Wed, 07 Feb 2024 14:36:42 +0100 (CET)
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-33b189ae5e8so419539f8f.2
 for <xen-devel@lists.xenproject.org>; Wed, 07 Feb 2024 05:36:42 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 z12-20020a056000110c00b0033b4ebc3c8fsm1328999wrw.2.2024.02.07.05.36.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 07 Feb 2024 05:36:41 -0800 (PST)
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
X-Inumbo-ID: ede63ab8-c5bd-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1707313002; x=1707917802; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:references:cc:to
         :from:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=XBbuaqP2Yx3a79KtXTeTOOaIP4tI4ggPxVsGqod4xkQ=;
        b=ZVNu3O41pUetosxip8Wp5bxVP7uETem9CWyYInQNeAyeshWY7otDXTEOvQwsp7RNfX
         nHRxuDiJK1laFyurwXq3baPc/+r6R6CnYL5LcfNjWMGMcfFEMaqX+RhnIBWNrYIxzGjb
         5ZxX5JValVIYZmbS3oyczofzX5rDMiIV2xHngqbTPsjDbYyAHBfsbfNZnMuBWVKhSqdX
         2Ki9cft4Bm9p1f+k3nufz+1Ff8u7Td1+c4q6KBvc2evs2tXRvQPE1QZcVDprgN5DJ5l0
         phs76cPy/Fzr3fgTcEmvSJDSpMFRJzozNwCkSTQsFI5NSSQyhGkoN1g+AmbVdP3IF/3J
         8MJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707313002; x=1707917802;
        h=content-transfer-encoding:in-reply-to:autocrypt:references:cc:to
         :from:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XBbuaqP2Yx3a79KtXTeTOOaIP4tI4ggPxVsGqod4xkQ=;
        b=Dr9FjIEJ3NPQcqQZ53EyDt0WgHmv8AKYqXk4ikvMnMlXc6MAnZGzksQHQ68t3ft7aT
         4vRGqnlAYT8QS74t72xFLUEC1tYoNWQL7k4Jnj6wBH/nalxNO1KEWX6TbACjjL3QqDT2
         DscrzjU3B16sLGgFkPhKjSPXu6DhHN90Rg7JL/v/ONjkv/mCvlny2TRlJpdX5Civ7olW
         SBUPQxbJIOtEdjM3pViWP3uVKtAtCnDZqPjAYuML5lV3lxrPQ7UT7ZK7FWEKTY5PPj6I
         G+tDN+QBi4Syt4ipGUBmtzjx0R9pwADfOpLWwz5bgr5WKcUARZ8mW47NsHwjc8q5+ghC
         v0vg==
X-Gm-Message-State: AOJu0Yy/gsW7w7sPYjTohME0eYl2jzr2+wyNPH+qx/iWY69OC1YIglj9
	2VA8z/cLyaCN+R6UJLnlBd6GidI4qipBXaZvRbBRvW4D47Wb3SlYnn+z+UzOpyzO4MGcEOS5zp0
	=
X-Google-Smtp-Source: AGHT+IH1eErRkcqc/6EFZPgTTvBp8bktJo4gueEGOvOTR+LjDzxR9mUOdCImQ6XCeqPVisG8EIrdRQ==
X-Received: by 2002:adf:e4cd:0:b0:33b:5192:53d0 with SMTP id v13-20020adfe4cd000000b0033b519253d0mr691003wrm.46.1707313002218;
        Wed, 07 Feb 2024 05:36:42 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCW4dYHoFA87bhX0+CGTEUDvc+ruSx2ZcmhS90KX/uh3b/3xj7c3BjV5uttYUYAS5RMWLObvZEAoDhUYG6oFmaM1yfFtJ2vHZhoh0kNuKeSnsObb2iVQAIuMRps6P3s5kjFq7rLnLYJPIZCEUuQP1s64mDMhnajZNHCu4TeG9pgkZgevHIbklLsjoviVOoGKusX3rcUeI6IYA7ZGq5rO8TaGP5h61OHOtxF35Bt8BdejVJAaOHq+dcOJpUzBHeA5LMtVenrgpmAJcvQ2CO3fLB+bhYyLhjXv6Npky5QArSEl8Nsx6dE6S1l7nno9xWECDx9zXg4PLw+i5mONhB4rQggbDQD9dldfMDHrmc9S3TorMtg1T5vNlUst4cufz9OpjRY7IKCTlpufutOIVDneZIgdO/LvIXDXdmUQfT3DU6ynQAzlYHbAX7JR6ek=
Message-ID: <782b911e-c40e-4e9c-b259-af287d968b3b@suse.com>
Date: Wed, 7 Feb 2024 14:36:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v6 1/7] common: honor CONFIG_CC_SPLIT_SECTIONS also for
 assembly functions
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Shawn Anastasio <sanastasio@raptorengineering.com>,
 Bobby Eshleman <bobbyeshleman@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>
References: <e4bf47ca-2ae6-1fd4-56a6-e4e777150b64@suse.com>
 <3ba82c3a-ff95-43d0-8672-a63b23bc2cdc@suse.com>
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
In-Reply-To: <3ba82c3a-ff95-43d0-8672-a63b23bc2cdc@suse.com>
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

TBD: On top of Roger's respective patch (for livepatch), also respect
     CONFIG_FUNCTION_ALIGNMENT.

Note that we'd need to split DATA() in order to separate r/w and r/o
contributions. Further splitting might be needed to also support more
advanced attributes (e.g. merge), hence why this isn't done right here.
Sadly while a new section's name can be derived from the presently in
use, its attributes cannot be. Perhaps the only thing we can do is give
DATA() a 2nd mandatory parameter. Then again I guess most data
definitions could be moved to C anyway.
---
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
@@ -409,6 +409,9 @@ AFLAGS += -D__ASSEMBLY__
 
 $(call cc-option-add,AFLAGS,CC,-Wa$$(comma)--noexecstack)
 
+# Check to see whether the assembler supports the --sectname-subst option.
+$(call cc-option-add,AFLAGS,CC,-Wa$$(comma)--sectname-subst -DHAVE_AS_SECTNAME_SUBST)
+
 LDFLAGS-$(call ld-option,--warn-rwx-segments) += --no-warn-rwx-segments
 
 CFLAGS += $(CFLAGS-y)
--- a/xen/arch/arm/xen.lds.S
+++ b/xen/arch/arm/xen.lds.S
@@ -157,6 +157,9 @@ SECTIONS
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
@@ -104,6 +104,9 @@ SECTIONS
     .init.text : {
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
@@ -104,6 +104,9 @@ SECTIONS
     .init.text : {
         _sinittext = .;
         *(.init.text)
+#ifdef CONFIG_CC_SPLIT_SECTIONS
+        *(.init.text.*)
+#endif
         _einittext = .;
         . = ALIGN(PAGE_SIZE);        /* Avoid mapping alt insns executable */
     } :text
--- a/xen/arch/x86/x86_64/compat/entry.S
+++ b/xen/arch/x86/x86_64/compat/entry.S
@@ -29,6 +29,9 @@ FUNC(entry_int82)
 
         mov   %rsp, %rdi
         call  do_entry_int82
+#ifdef CONFIG_CC_SPLIT_SECTIONS
+        jmp   compat_test_all_events
+#endif
 END(entry_int82)
 
 /* %rbx: struct vcpu */
--- a/xen/arch/x86/x86_64/entry.S
+++ b/xen/arch/x86/x86_64/entry.S
@@ -723,6 +723,9 @@ END(common_interrupt)
 FUNC(entry_PF)
         ENDBR64
         movl  $X86_EXC_PF, 4(%rsp)
+#ifdef CONFIG_CC_SPLIT_SECTIONS
+        jmp   handle_exception
+#endif
 END(entry_PF)
 /* No special register assumptions. */
 FUNC(handle_exception, 0)
@@ -1023,8 +1026,11 @@ FUNC(entry_NMI)
         ENDBR64
         pushq $0
         movl  $X86_EXC_NMI, 4(%rsp)
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
@@ -86,6 +86,9 @@ SECTIONS
        . = ALIGN(PAGE_SIZE);
        _stextentry = .;
        *(.text.entry)
+#ifdef CONFIG_CC_SPLIT_SECTIONS
+       *(.text.entry.*)
+#endif
        . = ALIGN(PAGE_SIZE);
        _etextentry = .;
 
@@ -214,6 +217,9 @@ SECTIONS
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
@@ -19,6 +19,14 @@
 
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
@@ -33,7 +41,14 @@
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


