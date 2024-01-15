Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C8D5382DB64
	for <lists+xen-devel@lfdr.de>; Mon, 15 Jan 2024 15:37:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.667424.1038663 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rPO5b-0001Ah-EZ; Mon, 15 Jan 2024 14:37:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 667424.1038663; Mon, 15 Jan 2024 14:37:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rPO5b-00018R-BW; Mon, 15 Jan 2024 14:37:23 +0000
Received: by outflank-mailman (input) for mailman id 667424;
 Mon, 15 Jan 2024 14:37:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jLm1=IZ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rPO5a-0000sg-5y
 for xen-devel@lists.xenproject.org; Mon, 15 Jan 2024 14:37:22 +0000
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [2a00:1450:4864:20::42e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 974d4fb2-b3b3-11ee-98f1-6d05b1d4d9a1;
 Mon, 15 Jan 2024 15:37:21 +0100 (CET)
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-33770772136so5054904f8f.3
 for <xen-devel@lists.xenproject.org>; Mon, 15 Jan 2024 06:37:21 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 j27-20020adfb31b000000b00336e32338f3sm12166221wrd.70.2024.01.15.06.37.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 Jan 2024 06:37:20 -0800 (PST)
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
X-Inumbo-ID: 974d4fb2-b3b3-11ee-98f1-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1705329441; x=1705934241; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:references:cc:to
         :from:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=FFQ31FcmOb6PAY2U3EoJvJoyLBbzkzu/MkKrJKkl6xs=;
        b=gUDLSaag2yjMcNlpcT7ujnoN98o9SgOFqw4x0A5uNgrvgLnKOgzU+jS2JNHwREHvFT
         HvyChURhQFj8FdWfhAFQ/qPR1is+E+6zUnYIslaaNr42Dj4v7jl1+KTqnAu19xGWndK8
         BVXlZlM8wWoEtmqxwhkB/MgcdeN0vtWKo2E1gZWGdehd2jOhay1VpSTp+LysMdI5sLiJ
         7ViwreYoWzoFfStCzE721AVPtgtBsoXHrV+ucdE5GgmYEOIU+pXWQc0RpTFN/Akvx5FC
         sVRmShGQfAwNVPmcAFB3hKzjAghNqShdqtG50MXXmqz+tGXaF1RYtrFMZnmrEZ9O71l0
         zslQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705329441; x=1705934241;
        h=content-transfer-encoding:in-reply-to:autocrypt:references:cc:to
         :from:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FFQ31FcmOb6PAY2U3EoJvJoyLBbzkzu/MkKrJKkl6xs=;
        b=KmzKh9Uug8vF5oPCuxLuEMiOV+b3Bbt+wF8GKzi4Ew3VGJud5qcWeTESetufrF90H5
         //1N5mzwtrXUZN/bfyrm2uPcd9OzgJzMNSewh2oayA5nGnMrEOhNX0VS8Zk2X9vtsa3W
         Q10jR8/hNWZGmlWeWTDxuqRPVe5BTzyFhAJq8KC6jEJWdmy8nCofcpMQG1z+JagVytNB
         usSgDPjZKbw1NwbGeuURo51gWdVcztbwJ5+KDhkFMVw+Mv2yidZb0FhusT4ZF6XIVuHl
         V2ihokB5M1vFmS2mXZ0DiT+uv6gSHU8xNN1SbmN201lr0DqvfEgIZiTobraHSVBSjiSJ
         lLCA==
X-Gm-Message-State: AOJu0Yx7GdwdFQdqSMO2aQ2IVtMRy3lmla2xc/pGa7mmc49P5uVnn6nz
	P4aEMP6XtMX5UkqQEUbma/E/2iVDxgnPfQCYaioERUhozQ==
X-Google-Smtp-Source: AGHT+IERDl4S4Scd5eoSzdNvMNWD5vn3MbERcQ8c/IaSWBucKJnm0nZAW3cOOuUCfsgX0k4veeAOeA==
X-Received: by 2002:adf:f684:0:b0:336:7a01:98da with SMTP id v4-20020adff684000000b003367a0198damr2812334wrp.55.1705329441074;
        Mon, 15 Jan 2024 06:37:21 -0800 (PST)
Message-ID: <7c57d285-c81d-43d4-93fe-2152ea6ad7f8@suse.com>
Date: Mon, 15 Jan 2024 15:37:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v5 5/8] RISC-V: annotate entry points with type and size
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Bobby Eshleman <bobbyeshleman@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>
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
except of course the converted symbols change to be hidden ones and gain
a valid size.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
Probably count_args_exp() should move to macros.h, but I first wanted to
see whether anyone can suggest any better approach for checking whether
a defined macro expands to nothing.
---
v5: Re-base.
v4: Also drop #undef-s from linker script.
v3: New.

--- a/xen/arch/riscv/entry.S
+++ b/xen/arch/riscv/entry.S
@@ -5,7 +5,7 @@
 #include <asm/traps.h>
 
 /* WIP: only works while interrupting Xen context */
-ENTRY(handle_trap)
+FUNC(handle_trap)
 
     /* Exceptions from xen */
 save_to_stack:
@@ -92,3 +92,4 @@ restore_registers:
         REG_L   sp, CPU_USER_REGS_SP(sp)
 
         sret
+END(handle_trap)
--- a/xen/arch/riscv/include/asm/asm.h
+++ b/xen/arch/riscv/include/asm/asm.h
@@ -7,6 +7,7 @@
 #define _ASM_RISCV_ASM_H
 
 #ifdef __ASSEMBLY__
+#include <xen/linkage.h>
 #define __ASM_STR(x)	x
 #else
 #define __ASM_STR(x)	#x
--- a/xen/arch/riscv/include/asm/config.h
+++ b/xen/arch/riscv/include/asm/config.h
@@ -69,12 +69,8 @@
 
 /* Linkage for RISCV */
 #ifdef __ASSEMBLY__
-#define ALIGN .align 4
-
-#define ENTRY(name)                                \
-  .globl name;                                     \
-  ALIGN;                                           \
-  name:
+#define CODE_ALIGN 16
+#define CODE_FILL /* empty */
 #endif
 
 #ifdef CONFIG_RISCV_64
--- a/xen/arch/riscv/riscv64/head.S
+++ b/xen/arch/riscv/riscv64/head.S
@@ -8,7 +8,7 @@
          *   a0 -> hart_id ( bootcpu_id )
          *   a1 -> dtb_base 
          */
-ENTRY(start)
+FUNC(start)
         /* Mask all interrupts */
         csrw    CSR_SIE, zero
 
@@ -60,19 +60,21 @@ ENTRY(start)
         mv      a1, s1
 
         tail    start_xen
+END(start)
 
         .section .text, "ax", %progbits
 
-ENTRY(reset_stack)
+FUNC(reset_stack)
         la      sp, cpu0_boot_stack
         li      t0, STACK_SIZE
         add     sp, sp, t0
 
         ret
+END(reset_stack)
 
         .section .text.ident, "ax", %progbits
 
-ENTRY(turn_on_mmu)
+FUNC(turn_on_mmu)
         sfence.vma
 
         li      t0, RV_STAGE1_MODE
@@ -84,3 +86,4 @@ ENTRY(turn_on_mmu)
         csrw    CSR_SATP, t1
 
         jr      a0
+END(turn_on_mmu)
--- a/xen/arch/riscv/xen.lds.S
+++ b/xen/arch/riscv/xen.lds.S
@@ -1,9 +1,6 @@
 #include <xen/lib.h>
 #include <xen/xen.lds.h>
 
-#undef ENTRY
-#undef ALIGN
-
 OUTPUT_ARCH(riscv)
 ENTRY(start)
 
--- a/xen/include/xen/linkage.h
+++ b/xen/include/xen/linkage.h
@@ -35,17 +35,28 @@
 
 #define END(name) .size name, . - name
 
+/*
+ * CODE_FILL in particular may need to expand to nothing (e.g. for RISC-V), in
+ * which case we also need to get rid of the comma in the .balign directive.
+ */
+#define count_args_exp(args...) count_args(args)
+#if count_args_exp(CODE_FILL)
+# define DO_CODE_ALIGN(align...) LASTARG(CODE_ALIGN, ## align), CODE_FILL
+#else
+# define DO_CODE_ALIGN(align...) LASTARG(CODE_ALIGN, ## align)
+#endif
+
 #define FUNC(name, align...) \
-        SYM(name, FUNC, GLOBAL, LASTARG(CODE_ALIGN, ## align), CODE_FILL)
+        SYM(name, FUNC, GLOBAL, DO_CODE_ALIGN(align))
 #define LABEL(name, align...) \
-        SYM(name, NONE, GLOBAL, LASTARG(CODE_ALIGN, ## align), CODE_FILL)
+        SYM(name, NONE, GLOBAL, DO_CODE_ALIGN(align))
 #define DATA(name, align...) \
         SYM(name, DATA, GLOBAL, LASTARG(DATA_ALIGN, ## align), DATA_FILL)
 
 #define FUNC_LOCAL(name, align...) \
-        SYM(name, FUNC, LOCAL, LASTARG(CODE_ALIGN, ## align), CODE_FILL)
+        SYM(name, FUNC, LOCAL, DO_CODE_ALIGN(align))
 #define LABEL_LOCAL(name, align...) \
-        SYM(name, NONE, LOCAL, LASTARG(CODE_ALIGN, ## align), CODE_FILL)
+        SYM(name, NONE, LOCAL, DO_CODE_ALIGN(align))
 #define DATA_LOCAL(name, align...) \
         SYM(name, DATA, LOCAL, LASTARG(DATA_ALIGN, ## align), DATA_FILL)
 


