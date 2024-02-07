Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AFBDF84CBBD
	for <lists+xen-devel@lfdr.de>; Wed,  7 Feb 2024 14:38:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.677577.1054268 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rXi8G-0002Tv-DO; Wed, 07 Feb 2024 13:38:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 677577.1054268; Wed, 07 Feb 2024 13:38:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rXi8G-0002SQ-93; Wed, 07 Feb 2024 13:38:32 +0000
Received: by outflank-mailman (input) for mailman id 677577;
 Wed, 07 Feb 2024 13:38:31 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=EHwQ=JQ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rXi8F-0002S8-Ku
 for xen-devel@lists.xenproject.org; Wed, 07 Feb 2024 13:38:31 +0000
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [2a00:1450:4864:20::430])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2d9b36f8-c5be-11ee-98f5-efadbce2ee36;
 Wed, 07 Feb 2024 14:38:29 +0100 (CET)
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-33929364bdaso429933f8f.2
 for <xen-devel@lists.xenproject.org>; Wed, 07 Feb 2024 05:38:29 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 z12-20020a056000110c00b0033b4ebc3c8fsm1328999wrw.2.2024.02.07.05.38.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 07 Feb 2024 05:38:28 -0800 (PST)
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
X-Inumbo-ID: 2d9b36f8-c5be-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1707313109; x=1707917909; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:references:cc:to
         :from:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=XZ8E4NCSVP15aCKtBvXW1WrLdgMyh/zRv3UNW3vt5Qc=;
        b=ejMoMTrlgFVyOskBb4n2ZZg2Gc0mJvo83SEoqeVY6SldeZx/eCDYkOppXuhkBDQ3QI
         pv/nOdVSvXlWmLWH1cw+7nPXDYMR7EaT5E0p+uzeAOyhK2jzo+7KhAy2UAjYw1LF+ofd
         rRIcbAS4XaVbahmtf6VfErYxM7YyOYvZbGL0DQY2v7IW554sp+ehuAS9MBsPaF+eX7Er
         SRqdYWXvdRdG7vv60QXnXLfOuapKMtrzOSWFo4Vf6lzwKTp36XfkWNXeXjPkYLga6K9u
         3ngDXeWF1C2aZtyP6ehovVcpOBoO1nq2TFP2LLqf3W5ng4w/FrE4s4yoNhBt9slFnU9V
         FBCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707313109; x=1707917909;
        h=content-transfer-encoding:in-reply-to:autocrypt:references:cc:to
         :from:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XZ8E4NCSVP15aCKtBvXW1WrLdgMyh/zRv3UNW3vt5Qc=;
        b=TBCQN1c/oI4PMzSLfxfYhJRCUEOgxNaswNPzwkRLRN3hknj10VS+/oiTdVDpkxCmJm
         3B0ykFs1XMyhfAMTS92bwMjZ0CBk/b4oookzxkgUGvH2Mhco/XsPmI2x/em6HhoUb7/G
         7T9ExA1C+wBadnZjTddMCP2xU8OREklX7oWeunKYIFVoQNCMhWYv3/SFF1DlrkMgpSJ2
         inHgQ6wrNh+Y+Cr8hIogY/NrnIK9+4ze6RT8PDNzXueii2ySkOhSwyDcDR1A+Tk2FNb/
         /Hh7SoIO1fPpUWTmbv7XM2m3U4HBtzuqvkZzyIMTZWHCixoVonQowLtSGcCDWzaeJmsz
         0HOQ==
X-Gm-Message-State: AOJu0YzmyjdfWZL6TBCxlBgmTVNu85bbfxXI2wsyh6iqdbtBXxAgUsqL
	FmtaoHTOgQyMGh5apZxr1GNJ21O3Ltlxf+CoFaYySeto4uZOOD0F/PVF1YlBPe7s22MkjBllX5Y
	=
X-Google-Smtp-Source: AGHT+IGR06n/2V+cnjT9rh5AURC/vp9SxGx6kbg+I20kRXd6mNNxweTRBk0aiO1Os0kvTevB74O8fA==
X-Received: by 2002:adf:ec84:0:b0:33a:e526:3a49 with SMTP id z4-20020adfec84000000b0033ae5263a49mr3451729wrn.23.1707313109062;
        Wed, 07 Feb 2024 05:38:29 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWAdXI5+RWS6xEYY7Cc2hdkIRfrrGk9gWx6/LEAc7GOqeFlyonCbnqtaapIcpNz61nL5szCdCqgqT0XgqtWnWG4wuDXyMo5e3brj26mBcIsMC+syEvtHPnxVot976HjBBmf8RcZ6By7MRL7
Message-ID: <50c0bcbb-e46e-4777-a7e8-20ee4b979b05@suse.com>
Date: Wed, 7 Feb 2024 14:38:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v6 5/7] x86/kexec: convert entry point annotations
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
Using the linker script like this feels fragile. Maybe it's better to
suppress (#undef) CONFIG_CC_SPLIT_SECTIONS for this one file?
---
v6: New.

--- a/xen/arch/x86/x86_64/kexec_reloc.S
+++ b/xen/arch/x86/x86_64/kexec_reloc.S
@@ -21,10 +21,9 @@
 #include <asm/machine_kexec.h>
 
         .section .text.kexec, "ax", @progbits
-        .align PAGE_SIZE
         .code64
 
-ENTRY(kexec_reloc)
+FUNC(kexec_reloc, PAGE_SIZE)
         /* %rdi - code page maddr */
         /* %rsi - page table maddr */
         /* %rdx - indirection page maddr */
@@ -91,8 +90,9 @@ ENTRY(kexec_reloc)
         push    $0x10
         push    %rax
         lretq
+END(kexec_reloc)
 
-relocate_pages:
+FUNC_LOCAL(relocate_pages)
         /* %rdi - indirection page maddr */
         pushq   %rbx
 
@@ -138,10 +138,11 @@ relocate_pages:
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
@@ -168,39 +169,29 @@ compatibility_mode:
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
--- a/xen/arch/x86/xen.lds.S
+++ b/xen/arch/x86/xen.lds.S
@@ -92,7 +92,10 @@ SECTIONS
        . = ALIGN(PAGE_SIZE);
        _etextentry = .;
 
-       *(.text.kexec)          /* Page aligned in the object file. */
+       /* Page aligned in the object file. */
+       *(.text.kexec.kexec_reloc)
+       *(.text.kexec.*)
+       *(.text.kexec)
        kexec_reloc_end = .;
 
        *(.text.cold)


