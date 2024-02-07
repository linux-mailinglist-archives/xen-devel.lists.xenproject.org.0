Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2518284CBBE
	for <lists+xen-devel@lfdr.de>; Wed,  7 Feb 2024 14:39:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.677581.1054278 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rXi8b-0002zW-OT; Wed, 07 Feb 2024 13:38:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 677581.1054278; Wed, 07 Feb 2024 13:38:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rXi8b-0002xw-LF; Wed, 07 Feb 2024 13:38:53 +0000
Received: by outflank-mailman (input) for mailman id 677581;
 Wed, 07 Feb 2024 13:38:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=EHwQ=JQ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rXi8a-0002S8-1A
 for xen-devel@lists.xenproject.org; Wed, 07 Feb 2024 13:38:52 +0000
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [2a00:1450:4864:20::42d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 39f6b48d-c5be-11ee-98f5-efadbce2ee36;
 Wed, 07 Feb 2024 14:38:50 +0100 (CET)
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-33b1d7f736bso526476f8f.3
 for <xen-devel@lists.xenproject.org>; Wed, 07 Feb 2024 05:38:50 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 z12-20020a056000110c00b0033b4ebc3c8fsm1328999wrw.2.2024.02.07.05.38.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 07 Feb 2024 05:38:49 -0800 (PST)
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
X-Inumbo-ID: 39f6b48d-c5be-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1707313130; x=1707917930; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:references:cc:to
         :from:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=aBpoZSGBreowDhO2VF/qZrHAAevqhsPVyooMAssUAG4=;
        b=cCNK7Vm59Z9mYsC6ky0LYdvDjldX1QdIXbCpcodAtt3mZ6TiKqUBMXlQAQDAeo6y2s
         K/wXi6CTUr0u0DlZ2ZekFrzQG+0SsVh7uVfclDZBMy3L7ZyA6O2I2vBcW5hG2X5xbRKX
         IaaZBrnJvN7JMt1xZpKzzrLBFUmWgPdAINpfnXn7dSAmzKXpWr2GyvVNtXUEwN4CoUWZ
         bjKepR6sxN1dbz0CmA4YuFe9iDPfljExY6ySvxzs5ks9hyupgMFfvLnOJPgE5HMzsoEi
         t/3W98V7JRz2DNk+kfzZ3raIiujOf1dO0Rlc7hZb5Hn+Vfc/qMTVDuMCWZaCClSs0f0T
         WphQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707313130; x=1707917930;
        h=content-transfer-encoding:in-reply-to:autocrypt:references:cc:to
         :from:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aBpoZSGBreowDhO2VF/qZrHAAevqhsPVyooMAssUAG4=;
        b=PowgE0pHl8BgdZCKtPZq9HUqFQ58J/anIOUozXS0HkTfidNt+76wRLgR2sL3qp0dkL
         Y/jokecZWwiG1eArsh4h1Ew6AECB90ubGjZQ1epw64nikhG9DvgZiG+wl686HG/CUIjx
         SLEgJh8NaqAV45L96M48gL0+yNqmLfvleToluELQ4ZhDRDeaMKOhH/IJfwJRSn9oTwGR
         0u5Ya+Eiszjd2JEpzdPJAm8JeKdoc4fuiFf8wFfjc2Gc8HP4wND3THWZReGBV21JDcsx
         o+wMpW7i9P8qx0JKgwngSjO7wTnSnkk/ckcbBzGEP6gmZHRThHZXG1BtM6YiOxHmYw16
         403A==
X-Gm-Message-State: AOJu0Ywr7xDswFqBW0/rEd+C6gSOf+m9l1Qne9epxWcELe4MnUlyvpfi
	ihwnM+m2RtBwJjiOVRT5Hfn/AaK6+Skv0SkkpvPb/GnT0jJkqixcDKnVUcCxT7bsUqugiA47TIo
	=
X-Google-Smtp-Source: AGHT+IGSFfXYOZS+6DKecgfnZokmK4eRCNKXhnba6Cmtvw/CVLUogCftvpuW1Dwd4a5QpImfyVFPZA==
X-Received: by 2002:a5d:468a:0:b0:33b:4382:c54 with SMTP id u10-20020a5d468a000000b0033b43820c54mr2970345wrq.62.1707313129835;
        Wed, 07 Feb 2024 05:38:49 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUxK+RGJLlk2fIeOCc43MT2CekBJEHPKSMDl3gENroZYzOzyMUa0IIWTboi+ObE+9JEuEB6PcJlIOzgRAK0W75rzR3tAQTAfspOzqfChrJlVA3f0t8iwHEpyqcy7JJgyPlY2VeufF5k4mjm
Message-ID: <4b0a581d-be2b-444d-a044-668b5e2e2279@suse.com>
Date: Wed, 7 Feb 2024 14:38:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v6 6/7] x86: convert misc assembly function annotations
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>
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

Use the generic framework from xen/linkage.h.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
v6: New.

--- a/xen/arch/x86/clear_page.S
+++ b/xen/arch/x86/clear_page.S
@@ -1,8 +1,9 @@
         .file __FILE__
 
+#include <xen/linkage.h>
 #include <asm/page.h>
 
-ENTRY(clear_page_sse2)
+FUNC(clear_page_sse2)
         mov     $PAGE_SIZE/32, %ecx
         xor     %eax,%eax
 
@@ -16,6 +17,4 @@ ENTRY(clear_page_sse2)
 
         sfence
         ret
-
-        .type clear_page_sse2, @function
-        .size clear_page_sse2, . - clear_page_sse2
+END(clear_page_sse2)
--- a/xen/arch/x86/copy_page.S
+++ b/xen/arch/x86/copy_page.S
@@ -1,5 +1,6 @@
         .file __FILE__
 
+#include <xen/linkage.h>
 #include <asm/page.h>
 
 #define src_reg %rsi
@@ -10,7 +11,7 @@
 #define tmp3_reg %r10
 #define tmp4_reg %r11
 
-ENTRY(copy_page_sse2)
+FUNC(copy_page_sse2)
         mov     $PAGE_SIZE/(4*WORD_SIZE)-3, %ecx
 
         prefetchnta 2*4*WORD_SIZE(src_reg)
@@ -41,6 +42,4 @@ ENTRY(copy_page_sse2)
 
         sfence
         ret
-
-        .type copy_page_sse2, @function
-        .size copy_page_sse2, . - copy_page_sse2
+END(copy_page_sse2)
--- a/xen/arch/x86/guest/xen/hypercall_page.S
+++ b/xen/arch/x86/guest/xen/hypercall_page.S
@@ -3,13 +3,11 @@
 #include <public/xen.h>
 
         .section ".text.page_aligned", "ax", @progbits
-        .p2align PAGE_SHIFT
 
-GLOBAL(hypercall_page)
+DATA(hypercall_page, PAGE_SIZE)
          /* Poisoned with `ret` for safety before hypercalls are set up. */
         .fill PAGE_SIZE, 1, 0xc3
-        .type hypercall_page, STT_OBJECT
-        .size hypercall_page, PAGE_SIZE
+END(hypercall_page)
 
 /*
  * Identify a specific hypercall in the hypercall page
--- a/xen/arch/x86/indirect-thunk.S
+++ b/xen/arch/x86/indirect-thunk.S
@@ -35,15 +35,13 @@
 .macro GEN_INDIRECT_THUNK reg:req
         .section .text.__x86_indirect_thunk_\reg, "ax", @progbits
 
-ENTRY(__x86_indirect_thunk_\reg)
+FUNC(__x86_indirect_thunk_\reg)
         ALTERNATIVE_2 __stringify(IND_THUNK_RETPOLINE \reg),              \
         __stringify(IND_THUNK_LFENCE \reg), X86_FEATURE_IND_THUNK_LFENCE, \
         __stringify(IND_THUNK_JMP \reg),    X86_FEATURE_IND_THUNK_JMP
 
         int3 /* Halt straight-line speculation */
-
-        .size __x86_indirect_thunk_\reg, . - __x86_indirect_thunk_\reg
-        .type __x86_indirect_thunk_\reg, @function
+END(__x86_indirect_thunk_\reg)
 .endm
 
 /* Instantiate GEN_INDIRECT_THUNK for each register except %rsp. */
--- a/xen/arch/x86/pv/gpr_switch.S
+++ b/xen/arch/x86/pv/gpr_switch.S
@@ -10,7 +10,7 @@
 #include <asm/asm_defns.h>
 
 /* Load guest GPRs.  Parameter in %rdi, clobbers all registers. */
-ENTRY(load_guest_gprs)
+FUNC(load_guest_gprs)
         movq  UREGS_rdx(%rdi), %rdx
         movq  UREGS_rax(%rdi), %rax
         movq  UREGS_rbx(%rdi), %rbx
@@ -27,13 +27,10 @@ ENTRY(load_guest_gprs)
         movq  UREGS_rcx(%rdi), %rcx
         movq  UREGS_rdi(%rdi), %rdi
         ret
-
-        .size load_guest_gprs, . - load_guest_gprs
-        .type load_guest_gprs, STT_FUNC
-
+END(load_guest_gprs)
 
 /* Save guest GPRs.  Parameter on the stack above the return address. */
-ENTRY(save_guest_gprs)
+FUNC(save_guest_gprs)
         pushq %rdi
         movq  2*8(%rsp), %rdi
         movq  %rax, UREGS_rax(%rdi)
@@ -52,6 +49,4 @@ ENTRY(save_guest_gprs)
         movq  %rdx, UREGS_rdx(%rdi)
         movq  %rcx, UREGS_rcx(%rdi)
         ret
-
-        .size save_guest_gprs, . - save_guest_gprs
-        .type save_guest_gprs, STT_FUNC
+END(save_guest_gprs)
--- a/xen/arch/x86/x86_64/entry.S
+++ b/xen/arch/x86/x86_64/entry.S
@@ -599,7 +599,7 @@ domain_crash_page_fault_0x8:
         ALTERNATIVE "", clac, X86_FEATURE_XEN_SMAP
         movq  %rsi,%rdi
         call  show_page_walk
-ENTRY(dom_crash_sync_extable)
+LABEL(dom_crash_sync_extable, 0)
         ALTERNATIVE "", clac, X86_FEATURE_XEN_SMAP
         # Get out of the guest-save area of the stack.
         GET_STACK_END(ax)


