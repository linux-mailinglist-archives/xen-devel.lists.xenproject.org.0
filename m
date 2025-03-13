Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AF0EA5EDA1
	for <lists+xen-devel@lfdr.de>; Thu, 13 Mar 2025 09:08:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.911364.1317815 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tsdbn-0003vh-9E; Thu, 13 Mar 2025 08:08:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 911364.1317815; Thu, 13 Mar 2025 08:08:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tsdbn-0003ta-5i; Thu, 13 Mar 2025 08:08:03 +0000
Received: by outflank-mailman (input) for mailman id 911364;
 Thu, 13 Mar 2025 08:08:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=7Xn0=WA=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tsdbm-0002PI-JH
 for xen-devel@lists.xenproject.org; Thu, 13 Mar 2025 08:08:02 +0000
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [2a00:1450:4864:20::336])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4898289d-ffe2-11ef-9ab9-95dc52dad729;
 Thu, 13 Mar 2025 09:08:01 +0100 (CET)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-43948021a45so5238405e9.1
 for <xen-devel@lists.xenproject.org>; Thu, 13 Mar 2025 01:08:01 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43d188b7185sm11831465e9.12.2025.03.13.01.08.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 Mar 2025 01:08:00 -0700 (PDT)
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
X-Inumbo-ID: 4898289d-ffe2-11ef-9ab9-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1741853281; x=1742458081; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=1pF3zG1Lu286gm/rHp2c7FaZjiC0YCZORJZgvDubhLo=;
        b=Gi2NfSOuf0/gLnszN8av9HOq6IMXH1Rn7D0yO2OV1VrDfLyUshuzSext20G+GiqWkS
         f7g8c0zQsnyOwvBsOnVZkKOz6QuEbyvUsiEYOk35xMry0Mv2udt66dhP9CVXzlpk6TRx
         jRlVVFr0ay/Ll9/djPGUpan7Q6/gwkVMJBWU/fMhafFes0QpGGEYbzUVbfxWGBe8cby4
         xxR+hINvHhUFYTRyYBcIYM09SuLqQu+DVy2X9+kJ2g4ucHhLfb9TyQ7KKxpqGXce/ZG/
         zaE/LTPR+Eqq+VXk+NZqCIAoVxPtF9B9S0CVkeRlMLtm0bi4Kyz8GdzyDF51zlOEcqDC
         45pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741853281; x=1742458081;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1pF3zG1Lu286gm/rHp2c7FaZjiC0YCZORJZgvDubhLo=;
        b=byvtU1CoUYIaZAhcxoly+gtGyHPadAJlwjqY2Ku81YBEKPwUEWhEy8QSDPrmKG1J3Y
         qunPsZoxuJQLulRdnPsaZAWYZUWM855FOvpfg+vWvCdqpjqWwIoXC1YX9bzzmqdBP9lC
         9ApNxLhXACYXMnMjNf3bgwG6/hSuYe87O8GM7lChrS+GJp5OZ8cbP/RSE0Ueqr7hqImu
         CIkJwon/lZP5eL1ygeXJjy3gGHcDbwBVOQ0nzzuDBDtloO2aGRiUuBXzHm231JEW6b2/
         O4rB4eiuF1RUbDPv8R+/V9T0oNu1meg58C3jDmxOgdoEEVETNuOhbDZ4fZmOet2KoUY8
         71lQ==
X-Gm-Message-State: AOJu0YyG9Wi2yC3vMbK+ern8JUwXi7EdCNcwW/tbMiF4NK3p4t5or6/R
	iGQre2d8AhWC6xxJHOywqsBPxuPr5O2EGEE1Txci/94q/UKpBelV9H5DMZKHCqgiqiWgtnoUGpE
	=
X-Gm-Gg: ASbGncvuglGLBoFMbIx45bbp3v6qD9VJTv+onVgNplDN1hjaJqaxMrRrusvoAETDOE+
	7eUgP910ipBUa7bQxgeL7hCJyNDm/x9v79ywAfTARHaudEANb5pzLRIHJ6lhtjJTVF1fo5MUN8x
	46EG6EnUv+YEPFE+ZtntkVB9phlMhsWCkv69A6Yo7ULFrKzoPUIw2ATqEMgSnTo05ACyJwCRldv
	AgJFKVNU0eKKa7FX3hTU5QqIxVmrtFADix0h6BUcZdMxcEDlYhtPt+4QkYcx/hWgZ9Vd019l1kT
	tbnalKJDWTrTdugCU2FAX331nHBgN8QBzc6oxzAGiwq90wHGQkZKuMEkF2czpkZFHyp+DgZ+1m2
	oxGwPsYcqEoQq+lt7TlCJoWS8oMvLCA==
X-Google-Smtp-Source: AGHT+IF6WHDW7hwE+z2543czQSgp/Nft/ARqReljA80uKWlCAa5BrOcutZtNgMkH2l4iHal9SdE3xg==
X-Received: by 2002:a05:600c:3b0e:b0:43c:f513:9585 with SMTP id 5b1f17b1804b1-43cf5139ae7mr145751395e9.13.1741853281275;
        Thu, 13 Mar 2025 01:08:01 -0700 (PDT)
Message-ID: <cffeb50d-5d99-4fa9-871c-f710da8bd028@suse.com>
Date: Thu, 13 Mar 2025 09:08:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v8 RESEND 4/6] Arm32: use new-style entry annotations in
 head.S
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Julien Grall <julien@xen.org>, Stefano Stabellini
 <sstabellini@kernel.org>, Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>
References: <e4bf47ca-2ae6-1fd4-56a6-e4e777150b64@suse.com>
 <ebc98ba6-4ced-4e74-baa6-089240465eca@suse.com>
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
In-Reply-To: <ebc98ba6-4ced-4e74-baa6-089240465eca@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Locally override SYM_PUSH_SECTION() to retain the intended section
association.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
Tested-by: Luca Fancellu <luca.fancellu@arm.com> # arm
---
v8: Re-base.
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
@@ -195,9 +202,9 @@ zero_bss:
 
 skip_bss:
         mov   pc, lr
-ENDPROC(zero_bss)
+END(zero_bss)
 
-cpu_init:
+FUNC_LOCAL(cpu_init)
         PRINT("- Setting up control registers -\r\n")
 
         mov   r5, lr                       /* r5 := return address */
@@ -238,7 +245,7 @@ cpu_init_done:
         isb
 
         mov   pc, r5                        /* Return address is in r5 */
-ENDPROC(cpu_init)
+END(cpu_init)
 
 /*
  * Setup the initial stack and jump to the C world
@@ -249,7 +256,7 @@ ENDPROC(cpu_init)
  *
  * Clobbers r3
  */
-launch:
+FUNC_LOCAL(launch)
         mov_w r3, init_data
         add   r3, #INITINFO_stack    /* Find the boot-time stack */
         ldr   sp, [r3]
@@ -258,13 +265,14 @@ launch:
 
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
@@ -275,14 +283,14 @@ ENDPROC(fail)
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
@@ -291,14 +299,14 @@ ENDPROC(init_uart)
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
@@ -307,7 +315,7 @@ ENDPROC(asm_puts)
  * r11: Early UART base address
  * Clobbers r0-r3
  */
-ENTRY(asm_putn)
+FUNC(asm_putn)
         adr_l r1, hex
         mov   r3, #8
 1:
@@ -319,18 +327,19 @@ ENTRY(asm_putn)
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
@@ -341,7 +350,7 @@ ENTRY(lookup_processor_type)
  * r1: proc_info pointer
  * Clobbers r2-r4
  */
-__lookup_processor_type:
+FUNC_LOCAL(__lookup_processor_type)
         mrc   CP32(r0, MIDR)                /* r0 := our cpu id */
         adr_l r1, __proc_info_start
         adr_l r2, __proc_info_end
@@ -357,7 +366,7 @@ __lookup_processor_type:
         mov   r1, #0
 2:
         mov   pc, lr
-ENDPROC(__lookup_processor_type)
+END(__lookup_processor_type)
 
 /*
  * Local variables:


