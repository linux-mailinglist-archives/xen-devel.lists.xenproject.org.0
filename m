Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D71E82DB6F
	for <lists+xen-devel@lfdr.de>; Mon, 15 Jan 2024 15:39:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.667428.1038674 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rPO76-0002pU-PT; Mon, 15 Jan 2024 14:38:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 667428.1038674; Mon, 15 Jan 2024 14:38:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rPO76-0002mJ-Lb; Mon, 15 Jan 2024 14:38:56 +0000
Received: by outflank-mailman (input) for mailman id 667428;
 Mon, 15 Jan 2024 14:38:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jLm1=IZ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rPO75-0002mB-RD
 for xen-devel@lists.xenproject.org; Mon, 15 Jan 2024 14:38:55 +0000
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [2a00:1450:4864:20::432])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cea3a8e5-b3b3-11ee-98f1-6d05b1d4d9a1;
 Mon, 15 Jan 2024 15:38:54 +0100 (CET)
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-3373bc6d625so7500272f8f.3
 for <xen-devel@lists.xenproject.org>; Mon, 15 Jan 2024 06:38:54 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 j27-20020adfb31b000000b00336e32338f3sm12166221wrd.70.2024.01.15.06.38.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 Jan 2024 06:38:53 -0800 (PST)
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
X-Inumbo-ID: cea3a8e5-b3b3-11ee-98f1-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1705329534; x=1705934334; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:references:cc:to
         :from:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=US14xhGKhc0Smw4Hw8UT6NWF96l1rVjI7L9dESkaVts=;
        b=gb1xk321YQfY80pHySJfj73l6J5ohQgUpfQweSWOy/AwhtcyEaJrZQK591qfQKgB8E
         bo/E8bLbph6Ff7EFlQo1ki44FKpSfAiGh5s0LhMv3DZjbfKbihtci9rvUGQxYliS5/su
         roLL07+klcRBrWpYsR/6p/QaM9tUYLrSdm+eZELdXh5fwy4LqGvdC6ltGaMTlZXIsdGA
         VrvAbuK+6eI4aokT83dm6/Mmn+b60K2kpfL3ZQqcumV/eofFtNwbQF0zz0SMiZpXfBNW
         xRACktZPJzSAbAnC+9XSpZpi1hHH8LKTkz/gSgR0yAEB9O+541gOI6DJJDe+AfJzbpTk
         8iYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705329534; x=1705934334;
        h=content-transfer-encoding:in-reply-to:autocrypt:references:cc:to
         :from:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=US14xhGKhc0Smw4Hw8UT6NWF96l1rVjI7L9dESkaVts=;
        b=ga+DD2roTNyajCz/JC4lBgGrOjeHIwHdVcZsg/9fCsvY6pALDUuiZHB/rIaThIaMN6
         U9LsEoGzSw8ukYN+zUoPbOhrL2q7hr6iWDghrxS2XFPzanABfemAZYiroLEXpaRX87cb
         lkKqIK0awzCxIf7jWYuOqyW63pHDFSezJAEd1PJVNXRHpP31+2fgZRC38eQ7Bwkz58IP
         sR4OZ6ZUTQvfTleEzCInYhTCeqnrFuJ/vSHq7krumBKxFUPrjTdgMn+zcr54djfAU1ZB
         7kCLgqvlt5M9m+k47BeZ4wBelP8Ri6QamLkAcqIBWVashpQJUJYE0s4bKmmPHTosmPFL
         v+xQ==
X-Gm-Message-State: AOJu0YzXI2T3dIK5NUTfZP4evaStH+eCpdaNVhJZZfUbZVUY7ojJHwpN
	DvtMVNZOaIdB2a8aPJYQyWK5cXTN4Bz2d2/LIrJ0tKDHZw==
X-Google-Smtp-Source: AGHT+IGy8MgsnT9vNDEznqHeZ4+w9/iz74rLCoQt+dXDDTs1PHrLhr+0E/XP3VP4XREU/hftW3z2Uw==
X-Received: by 2002:a05:6000:10d:b0:336:6388:1092 with SMTP id o13-20020a056000010d00b0033663881092mr2486344wrx.126.1705329533845;
        Mon, 15 Jan 2024 06:38:53 -0800 (PST)
Message-ID: <36004375-1398-4f94-b455-8bfdafe0c9d7@suse.com>
Date: Mon, 15 Jan 2024 15:38:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v5 6/8] PPC: switch entry point annotations to common model
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: George Dunlap <george.dunlap@citrix.com>,
 Shawn Anastasio <sanastasio@raptorengineering.com>
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

Use the generic framework in xen/linkage.h. No change in generated code
except of course the converted symbols change to be hidden ones.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
v5: Re-base.
v4: Also drop #undef-s from linker script. Re-base.
v3: New.

--- a/xen/arch/ppc/include/asm/asm-defns.h
+++ b/xen/arch/ppc/include/asm/asm-defns.h
@@ -3,6 +3,7 @@
 #define _ASM_PPC_ASM_DEFNS_H
 
 #include <asm/asm-offsets.h>
+#include <xen/linkage.h>
 
 /*
  * Load a 64-bit immediate value into the specified GPR.
--- a/xen/arch/ppc/include/asm/config.h
+++ b/xen/arch/ppc/include/asm/config.h
@@ -32,12 +32,7 @@
 
 /* Linkage for PPC */
 #ifdef __ASSEMBLY__
-#define ALIGN .p2align 2
-
-#define ENTRY(name)                                                            \
-    .globl name;                                                               \
-    ALIGN;                                                                     \
-    name:
+#define CODE_ALIGN 4
 #endif
 
 #define XEN_VIRT_START _AC(0xc000000000000000, UL)
--- a/xen/arch/ppc/ppc64/exceptions-asm.S
+++ b/xen/arch/ppc/ppc64/exceptions-asm.S
@@ -6,7 +6,7 @@
     .section .text.exceptions, "ax", %progbits
 
     /* Helper to dump CPU state to struct cpu_user_regs pointed to by r1. */
-ENTRY(exception_common)
+FUNC(exception_common)
     /*
      * Save GPRs 1-31. TODO: The value of %r1 has already been modified by the
      * ISR, so the value we save isn't the exact value we had on entry.
@@ -45,11 +45,10 @@ ENTRY(exception_common)
     stdu    %r0, -STACK_FRAME_OVERHEAD(%r1)
     bl      exception_handler
 
-    .size exception_common, . - exception_common
-    .type exception_common, %function
+    END(exception_common)
 
     /* Same as exception_common, but for exceptions that set HSRR{0,1} */
-ENTRY(h_exception_common)
+FUNC(h_exception_common)
     /*
      * Save GPRs 1-31. TODO: The value of %r1 has already been modified by the
      * ISR, so the value we save isn't the exact value we had on entry.
@@ -89,15 +88,14 @@ ENTRY(h_exception_common)
     stdu    %r0, -STACK_FRAME_OVERHEAD(%r1)
     bl      exception_handler
 
-    .size h_exception_common, . - h_exception_common
-    .type h_exception_common, %function
+    END(h_exception_common)
 
 /*
  * Declare an ISR for the provided exception that jumps to the specified handler
  */
 .macro ISR name, exc, handler
     . = (AIL_VECTOR_BASE - EXCEPTION_VECTORS_START) + \exc
-    ENTRY(\name)
+    FUNC(\name)
     /* TODO: switch stack */
 
     /* Reserve space for struct cpu_user_regs */
@@ -113,8 +111,7 @@ ENTRY(h_exception_common)
     /* Branch to common code */
     b       \handler
 
-    .size \name, . - \name
-    .type \name, %function
+    END(\name)
 .endm
 
 /*
--- a/xen/arch/ppc/ppc64/head.S
+++ b/xen/arch/ppc/ppc64/head.S
@@ -6,7 +6,7 @@
 
     .section .text.header, "ax", %progbits
 
-ENTRY(start)
+FUNC(start)
     /*
      * NOTE: argument registers (r3-r9) must be preserved until the C entrypoint
      */
@@ -64,11 +64,9 @@ ENTRY(start)
 
     /* should never return */
     trap
+END(start)
 
-    .size start, . - start
-    .type start, %function
-
-ENTRY(enable_mmu)
+FUNC(enable_mmu)
     mflr %r3
     mfmsr %r4
 
@@ -78,6 +76,4 @@ ENTRY(enable_mmu)
     mtsrr0 %r3 /* return to caller after MMU enable */
     mtsrr1 %r4
     rfid
-
-    .size enable_mmu, . - enable_mmu
-    .type enable_mmu, %function
+END(enable_mmu)
--- a/xen/arch/ppc/xen.lds.S
+++ b/xen/arch/ppc/xen.lds.S
@@ -1,9 +1,6 @@
 #include <xen/lib.h>
 #include <xen/xen.lds.h>
 
-#undef ENTRY
-#undef ALIGN
-
 OUTPUT_ARCH(powerpc:common64)
 ENTRY(start)
 


