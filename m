Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E33198C159
	for <lists+xen-devel@lfdr.de>; Tue,  1 Oct 2024 17:15:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.808236.1220094 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sveai-0006Gz-HS; Tue, 01 Oct 2024 15:15:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 808236.1220094; Tue, 01 Oct 2024 15:15:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sveai-0006EV-Dn; Tue, 01 Oct 2024 15:15:08 +0000
Received: by outflank-mailman (input) for mailman id 808236;
 Tue, 01 Oct 2024 15:15:07 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jjk+=Q5=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sveah-000652-Fi
 for xen-devel@lists.xenproject.org; Tue, 01 Oct 2024 15:15:07 +0000
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [2a00:1450:4864:20::630])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f06c1a44-8007-11ef-99a2-01e77a169b0f;
 Tue, 01 Oct 2024 17:15:06 +0200 (CEST)
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-a8a789c4fc5so1141308466b.0
 for <xen-devel@lists.xenproject.org>; Tue, 01 Oct 2024 08:15:06 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a93c29481edsm723426566b.131.2024.10.01.08.15.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Oct 2024 08:15:05 -0700 (PDT)
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
X-Inumbo-ID: f06c1a44-8007-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1727795705; x=1728400505; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:cc:content-language
         :references:to:from:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rufSU9IFyOi2Hu7y05gtjyGOO2lB8zNytXCa+p88a/8=;
        b=eArXq2/ZvPLJZ9BmLXPKk7I/Pllh8f3sG99FBFNGu0GDIGRv10lH+oc/8V24nBXCZk
         0KDYK0+JVTe48P1DpEfeRpCK2gxVZAorDWCbOJyql8XlN6ySjbeGcX9GMA4Bflj/vaPf
         Z+XsBN6jQH4rzezGbUMhuQWJPDHqzqYBwmn5ktibKcfNpcvaCY1v1EaPGRS1Y6nm4Hpv
         gaVgesvfNdBlZKdP1jcJaw66E0+pehMUQcbmRgEsOr7n10CkvSty3gTzaHxD5PFdCn7j
         sxgg8QIPQ3pnJGAxC+az+UfFR49Usa3bt+B1/bBsvF9MLz7RtCUWqXRo7R9SLsMWZJNZ
         jO2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727795705; x=1728400505;
        h=content-transfer-encoding:in-reply-to:autocrypt:cc:content-language
         :references:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rufSU9IFyOi2Hu7y05gtjyGOO2lB8zNytXCa+p88a/8=;
        b=nIpHxcZLu0JY+Wr/HcUl+5Dh/FUNw36/UzWbTIyB4fH4ryaqusepC16O7mhle8WQ0b
         Nj3liu0aB47z65i3cUaq5oZVAyTMSXGb3/ZSHIQjIH5YhNCk66CIwybmADg/OOxl6pRM
         VFYY9cqbWT9SAoUmtCcXkUkgpQyy/xg+ClW2XcSj5GX6DG+CKII0wDe9RK08WwQehVhA
         AAd6873T2qMxuMZDMt4/Umj4lssLZhhGOZ/BD6071AIj4GFEHlOsjpjQFkPSKlw2UXlk
         Rd4XvwcCPi4YZQBBDY2Br+qljvhAN8nuEzDhdC0j1cOI9NqkDdUOSazaccyfRZstYeF8
         dHQw==
X-Gm-Message-State: AOJu0Yw/KHZnlClM2La/ewWSbVDmuzXuDdOskYW+Vox1UFObBTrEOk8N
	LEwxjLBrcrvPXdkzc+UXz3c46101/2wOGORrc+qM+rXlNUQmByLOTzLNAjQmFwxk8nakmIE4+Vw
	=
X-Google-Smtp-Source: AGHT+IHd/zr4PPoUeuPQMUipHdxm8EYs/MIwjHh9EhCFeRC1P/5NbxohnSK5+Dl64gnvHUT0/tp/3w==
X-Received: by 2002:a17:907:3e85:b0:a8d:505a:5458 with SMTP id a640c23a62f3a-a967bf10f20mr463446266b.10.1727795705438;
        Tue, 01 Oct 2024 08:15:05 -0700 (PDT)
Message-ID: <6b66c48e-241e-4a8f-9221-4693e92f50ba@suse.com>
Date: Tue, 1 Oct 2024 17:15:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v7 04/11] x86/kexec: convert entry point annotations
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <e4bf47ca-2ae6-1fd4-56a6-e4e777150b64@suse.com>
 <98590a41-cee7-4ba3-a723-4e3ee3b55357@suse.com>
Content-Language: en-US
Cc: Andrew Cooper <andrew.cooper3@citrix.com>
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

Use the generic framework from xen/linkage.h.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
v7: Use alternative approach, un-defining CONFIG_CC_SPLIT_SECTIONS.
v6: New.

--- a/xen/arch/x86/x86_64/kexec_reloc.S
+++ b/xen/arch/x86/x86_64/kexec_reloc.S
@@ -13,6 +13,9 @@
 
         .file __FILE__
 
+/* All contents of .text.kexec wants to be kept together. */
+#undef CONFIG_CC_SPLIT_SECTIONS
+
 #include <xen/kimage.h>
 
 #include <asm/asm_defns.h>
@@ -21,10 +24,9 @@
 #include <asm/machine_kexec.h>
 
         .section .text.kexec, "ax", @progbits
-        .align PAGE_SIZE
         .code64
 
-ENTRY(kexec_reloc)
+FUNC(kexec_reloc, PAGE_SIZE)
         /* %rdi - code page maddr */
         /* %rsi - page table maddr */
         /* %rdx - indirection page maddr */
@@ -91,8 +93,9 @@ ENTRY(kexec_reloc)
         push    $0x10
         push    %rax
         lretq
+END(kexec_reloc)
 
-relocate_pages:
+FUNC_LOCAL(relocate_pages)
         /* %rdi - indirection page maddr */
         pushq   %rbx
 
@@ -138,10 +141,11 @@ relocate_pages:
 .L_done:
         popq    %rbx
         ret
+END(relocate_pages)
 
         .code32
 
-compatibility_mode:
+FUNC_LOCAL(compatibility_mode)
         /* Setup some sane segments. */
         movl    $0x0008, %eax
         movl    %eax, %ds
@@ -168,39 +172,29 @@ compatibility_mode:
         /* Call the image entry point.  This should never return. */
         call    *%ebp
         ud2
+END(compatibility_mode)
 
-        .align 4
-compat_mode_gdt_desc:
+DATA_LOCAL(compat_mode_gdt_desc, 4)
         .word .Lcompat_mode_gdt_end - compat_mode_gdt -1
         .quad 0x0000000000000000     /* set in call_32_bit above */
+END(compat_mode_gdt_desc)
 
-        .type compat_mode_gdt_desc, @object
-        .size compat_mode_gdt_desc, . - compat_mode_gdt_desc
-
-        .align 8
-compat_mode_gdt:
+DATA_LOCAL(compat_mode_gdt, 8)
         .quad 0x0000000000000000     /* null                              */
         .quad 0x00cf93000000ffff     /* 0x0008 ring 0 data                */
         .quad 0x00cf9b000000ffff     /* 0x0010 ring 0 code, compatibility */
 .Lcompat_mode_gdt_end:
+END(compat_mode_gdt)
 
-        .type compat_mode_gdt, @object
-        .size compat_mode_gdt, . - compat_mode_gdt
-
-compat_mode_idt:
+DATA_LOCAL(compat_mode_idt)
         .word 0                      /* limit */
         .long 0                      /* base */
-
-        .type compat_mode_idt, @object
-        .size compat_mode_idt, . - compat_mode_idt
+END(compat_mode_idt)
 
         /*
          * 16 words of stack are more than enough.
          */
-        .align 8
-reloc_stack:
+DATA_LOCAL(reloc_stack, 8)
         .fill 16,8,0
 .Lreloc_stack_base:
-
-        .type reloc_stack, @object
-        .size reloc_stack, . - reloc_stack
+END(reloc_stack)


