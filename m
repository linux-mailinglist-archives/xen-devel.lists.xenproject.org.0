Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CEDC98C19C
	for <lists+xen-devel@lfdr.de>; Tue,  1 Oct 2024 17:28:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.808287.1220179 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1svenj-0004x3-DD; Tue, 01 Oct 2024 15:28:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 808287.1220179; Tue, 01 Oct 2024 15:28:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1svenj-0004up-AR; Tue, 01 Oct 2024 15:28:35 +0000
Received: by outflank-mailman (input) for mailman id 808287;
 Tue, 01 Oct 2024 15:28:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jjk+=Q5=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sved6-0006cV-1a
 for xen-devel@lists.xenproject.org; Tue, 01 Oct 2024 15:17:36 +0000
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [2a00:1450:4864:20::631])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 49877fcf-8008-11ef-a0ba-8be0dac302b0;
 Tue, 01 Oct 2024 17:17:35 +0200 (CEST)
Received: by mail-ej1-x631.google.com with SMTP id
 a640c23a62f3a-a8d3cde1103so787445166b.2
 for <xen-devel@lists.xenproject.org>; Tue, 01 Oct 2024 08:17:35 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a93d4bd51f3sm597889266b.92.2024.10.01.08.17.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Oct 2024 08:17:34 -0700 (PDT)
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
X-Inumbo-ID: 49877fcf-8008-11ef-a0ba-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1727795855; x=1728400655; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:cc:content-language
         :references:to:from:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Igjx5Ygf4iYuyInfSXDjG9RY29JPrQg7L1HnVgD7deI=;
        b=dBI7iHPNDsztPyOvK3J2YMEo87VbKPTH/HgSWexiycU0pHuqZxnJzSLZ0o+Hq1nss5
         nWMfFZCSkfYzGVo2kG5NvTHUwS9NTL+NYAyW9ledGh0c8AdA42lndZIZfmM2pEME+E4r
         shpWbvfJVQqYmhaWDrGm9w2/NpvlnW2TU2befRhoK1RyX8WGlqTCw9UvIJvD7VJEfKZs
         d9SyRCzVVjy999nkyWFwQNoiW1nTRtKLXdwi39ZiVPusdTn+ui6tcIOom6xb6zpzlWeT
         0IWEMpHpW+jJXmne08teCyJqm6bCDStJHEDmD8cP1vam8Smz4INStmPOGg/fePhUFf9D
         oEzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727795855; x=1728400655;
        h=content-transfer-encoding:in-reply-to:autocrypt:cc:content-language
         :references:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Igjx5Ygf4iYuyInfSXDjG9RY29JPrQg7L1HnVgD7deI=;
        b=v6/sksA1KB9ZotLe9fVmS22VIJ4uTNW/cQ2LhK3scJbnyPVAt6DdbSL8RzFjYBQaLV
         uHJq6nllw9LX/59XeaYQWUCX0WnkbAV4JqV+RW4JgXmI9nn7jVBTLfudUZ2QbmzvExxS
         hoaFNJTwVUxe3U9TUoT5MaNGtq9bYMPj88pwxBgt6o12EFS88tQA3SfZ5uU7Vt/cdk/g
         hj/rLDJt+cce5Sl8WZFXoFz4zy1NcHCcpqJcDmNUkxDffBV40IRQML7luLuwNyXCw2qD
         AtG4DuMVlaPM2Q7DnEJLmx6k1qODjJOgi6XX8HTql18HvBBloHCjPd8dePsQAsW299FU
         Rpvw==
X-Gm-Message-State: AOJu0YzyyiqaoE9dHMEapXshL7AFcCoMD5WS9W8qHFlzClwNvjQJOI1m
	mK5JR6IxXs/ktH9c48+o+3a0dI+y+jRCj5ULJGFkAegrLfek7bVCEdVWPca7yn9gkpxp4Cvj0y0
	=
X-Google-Smtp-Source: AGHT+IHUFohKlSuI+zxUu88VfpkhFnhONkrYvQLcLjxd1JMRQR50w3ULY7OkI2Th4nvtVFFNC2377w==
X-Received: by 2002:a17:907:9349:b0:a7a:3928:3529 with SMTP id a640c23a62f3a-a93c48e80b2mr1975647566b.13.1727795854922;
        Tue, 01 Oct 2024 08:17:34 -0700 (PDT)
Message-ID: <01eb936e-71f4-43b3-b753-5b8a6ecf5d66@suse.com>
Date: Tue, 1 Oct 2024 17:17:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v7 10/11] Arm32: use new-style entry annotations in head.S
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <e4bf47ca-2ae6-1fd4-56a6-e4e777150b64@suse.com>
 <98590a41-cee7-4ba3-a723-4e3ee3b55357@suse.com>
Content-Language: en-US
Cc: Julien Grall <julien@xen.org>, Stefano Stabellini
 <sstabellini@kernel.org>, Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>
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

Locally override SYM_PUSH_SECTION() to retain the intended section
association.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
v7: New.

--- a/xen/arch/arm/arm32/head.S
+++ b/xen/arch/arm/arm32/head.S
@@ -48,13 +48,20 @@
 
         .section .text.header, "ax", %progbits
         .arm
+/*
+ * Code below wants to all live in the section established above.  Annotations
+ * from xen/linkage.h therefore may not switch sections (honoring
+ * CONFIG_CC_SPLIT_SECTIONS).  Override the respective macro.
+ */
+#undef SYM_PUSH_SECTION
+#define SYM_PUSH_SECTION(name, attr)
 
         /*
          * This must be the very first address in the loaded image.
          * It should be linked at XEN_VIRT_START, and loaded at any
          * 4K-aligned address.
          */
-GLOBAL(start)
+FUNC(start)
         /*
          * zImage magic header, see:
          * http://www.simtec.co.uk/products/SWLINUX/files/booting_article.html#d0e309
@@ -104,9 +111,9 @@ primary_switched:
         mov   r0, r8                 /* r0 := paddr(FDT) */
         mov_w r1, start_xen
         b     launch
-ENDPROC(start)
+END(start)
 
-GLOBAL(init_secondary)
+FUNC(init_secondary)
         cpsid aif                    /* Disable all interrupts */
 
         /* Find out where we are */
@@ -142,7 +149,7 @@ secondary_switched:
         /* Jump to C world */
         mov_w r1, start_secondary
         b     launch
-ENDPROC(init_secondary)
+END(init_secondary)
 
 /*
  * Check if the CPU supports virtualization extensions and has been booted
@@ -154,7 +161,7 @@ ENDPROC(init_secondary)
  *
  * Clobbers r0 - r3
  */
-check_cpu_mode:
+FUNC_LOCAL(check_cpu_mode)
         /* Check that this CPU has Hyp mode */
         mrc   CP32(r0, ID_PFR1)
         and   r0, r0, #0xf000        /* Bits 12-15 define virt extensions */
@@ -174,14 +181,14 @@ check_cpu_mode:
         PRINT("- Xen must be entered in NS Hyp mode -\r\n")
         PRINT("- Please update the bootloader -\r\n")
         b     fail
-ENDPROC(check_cpu_mode)
+END(check_cpu_mode)
 
 /*
  * Zero BSS
  *
  * Clobbers r0 - r3
  */
-zero_bss:
+FUNC_LOCAL(zero_bss)
         PRINT("- Zero BSS -\r\n")
         mov_w r0, __bss_start        /* r0 := vaddr(__bss_start) */
         mov_w r1, __bss_end          /* r1 := vaddr(__bss_end)   */
@@ -192,9 +199,9 @@ zero_bss:
         blo   1b
 
         mov   pc, lr
-ENDPROC(zero_bss)
+END(zero_bss)
 
-cpu_init:
+FUNC_LOCAL(cpu_init)
         PRINT("- Setting up control registers -\r\n")
 
         mov   r5, lr                       /* r5 := return address */
@@ -235,7 +242,7 @@ cpu_init_done:
         isb
 
         mov   pc, r5                        /* Return address is in r5 */
-ENDPROC(cpu_init)
+END(cpu_init)
 
 /*
  * Setup the initial stack and jump to the C world
@@ -246,7 +253,7 @@ ENDPROC(cpu_init)
  *
  * Clobbers r3
  */
-launch:
+FUNC_LOCAL(launch)
         mov_w r3, init_data
         add   r3, #INITINFO_stack    /* Find the boot-time stack */
         ldr   sp, [r3]
@@ -255,13 +262,14 @@ launch:
 
         /* Jump to C world */
        bx    r1
-ENDPROC(launch)
+END(launch)
 
 /* Fail-stop */
-fail:   PRINT("- Boot failed -\r\n")
+FUNC_LOCAL(fail)
+        PRINT("- Boot failed -\r\n")
 1:      wfe
         b     1b
-ENDPROC(fail)
+END(fail)
 
 #ifdef CONFIG_EARLY_PRINTK
 /*
@@ -272,14 +280,14 @@ ENDPROC(fail)
  *
  * Clobbers r0 - r3
  */
-init_uart:
+FUNC_LOCAL(init_uart)
         mov_w r11, CONFIG_EARLY_UART_BASE_ADDRESS
 #ifdef CONFIG_EARLY_UART_INIT
         early_uart_init r11, r1, r2
 #endif
         PRINT("- UART enabled -\r\n")
         mov   pc, lr
-ENDPROC(init_uart)
+END(init_uart)
 
 /*
  * Print early debug messages.
@@ -288,14 +296,14 @@ ENDPROC(init_uart)
  * r11: Early UART base address
  * Clobbers r0-r1
  */
-ENTRY(asm_puts)
+FUNC(asm_puts)
         early_uart_ready r11, r1
         ldrb  r1, [r0], #1           /* Load next char */
         teq   r1, #0                 /* Exit on nul */
         moveq pc, lr
         early_uart_transmit r11, r1
         b asm_puts
-ENDPROC(asm_puts)
+END(asm_puts)
 
 /*
  * Print a 32-bit number in hex.
@@ -304,7 +312,7 @@ ENDPROC(asm_puts)
  * r11: Early UART base address
  * Clobbers r0-r3
  */
-ENTRY(asm_putn)
+FUNC(asm_putn)
         adr_l r1, hex
         mov   r3, #8
 1:
@@ -316,18 +324,19 @@ ENTRY(asm_putn)
         subs  r3, r3, #1
         bne   1b
         mov   pc, lr
-ENDPROC(asm_putn)
+END(asm_putn)
 
 RODATA_SECT(.rodata.idmap, hex, "0123456789abcdef")
 
 #endif /* CONFIG_EARLY_PRINTK */
 
 /* This provides a C-API version of __lookup_processor_type */
-ENTRY(lookup_processor_type)
+FUNC(lookup_processor_type)
         stmfd sp!, {r4, lr}
         bl    __lookup_processor_type
         mov r0, r1
         ldmfd sp!, {r4, pc}
+END(lookup_processor_type)
 
 /*
  * Read processor ID register (CP#15, CR0), and Look up in the linker-built
@@ -338,7 +347,7 @@ ENTRY(lookup_processor_type)
  * r1: proc_info pointer
  * Clobbers r2-r4
  */
-__lookup_processor_type:
+FUNC_LOCAL(__lookup_processor_type)
         mrc   CP32(r0, MIDR)                /* r0 := our cpu id */
         adr_l r1, __proc_info_start
         adr_l r2, __proc_info_end
@@ -354,7 +363,7 @@ __lookup_processor_type:
         mov   r1, #0
 2:
         mov   pc, lr
-ENDPROC(__lookup_processor_type)
+END(__lookup_processor_type)
 
 /*
  * Local variables:


