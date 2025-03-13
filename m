Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 74C0FA5ED99
	for <lists+xen-devel@lfdr.de>; Thu, 13 Mar 2025 09:07:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.911341.1317794 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tsdb7-0002rh-NM; Thu, 13 Mar 2025 08:07:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 911341.1317794; Thu, 13 Mar 2025 08:07:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tsdb7-0002pJ-Jr; Thu, 13 Mar 2025 08:07:21 +0000
Received: by outflank-mailman (input) for mailman id 911341;
 Thu, 13 Mar 2025 08:07:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=7Xn0=WA=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tsdb6-0002fh-FE
 for xen-devel@lists.xenproject.org; Thu, 13 Mar 2025 08:07:20 +0000
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [2a00:1450:4864:20::32d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2ed36e0f-ffe2-11ef-9898-31a8f345e629;
 Thu, 13 Mar 2025 09:07:18 +0100 (CET)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-43cf628cb14so10528775e9.1
 for <xen-devel@lists.xenproject.org>; Thu, 13 Mar 2025 01:07:18 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-395c83b6e87sm1272056f8f.32.2025.03.13.01.07.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 Mar 2025 01:07:17 -0700 (PDT)
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
X-Inumbo-ID: 2ed36e0f-ffe2-11ef-9898-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1741853238; x=1742458038; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=JZSRw1yeJ0fgmNmD4NFPkk5QxMfczbYCBB42jjWa7ro=;
        b=dbNenuFxlb21MPiLDaqkXptFxlFStdi3Jef9jtunGkg1RcnQZi6HFzMaBpmPbcUaN6
         GFYL1roUANTGRhVY2a7Bl+F4v6qiDjHZhh5rr2giYZmSGBJuimIveVKq9dtWnd3l/FMq
         x2iWryHhsaigXUGYKXZkjQ76WTIQXJEnO84ucSG8iplzlG+zzeRAABlOJ2S+asLAfhYL
         fQ60u3MTtfr4QOv3JfyNPycANdYHG9h6J58U8y8V8lWJd+KMR1TPqEntFwprgVwfLz2q
         0ltJ4bBN50SBGsJQXoJWuHdkKU7YCVdwu4/lw0gRJGpKUTqxx1Vae0y9UybIT49ButVa
         7mqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741853238; x=1742458038;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JZSRw1yeJ0fgmNmD4NFPkk5QxMfczbYCBB42jjWa7ro=;
        b=i/S2Xb4bBRBG+0cunhybKEu/gd8oIiX/vHeihoCKZcBgnmmySckHlxiDHFqWEb73qJ
         AVGdeBH5bpdtQOwJx+Z7oadIdlO29o6NXuFg5v5Ud3HrhErQqNCIJOjsj86GTr05DO41
         1ar5Z66hERcH+M5MEmvpjgk90DOGq1dxK4khdmjU6a0vTUk91Zo5cIe4euOGZKQsXX2D
         BgCmfJHCbcu83kzk+b4m8AgoNgR4JEVEfpgYF2j9GsZyocWqLpLM435k0Fepytif6knu
         ibk5bgxAjxwcbOVn4p5YQw+mqUKZXsuY8pCARVCPGiqjkdB2ts7NSgLcKIwm2sEoaqVf
         vnXQ==
X-Gm-Message-State: AOJu0YyvnnmrCaGI/OblqjvQIpErPw/BDo/Z8IWrwHnXta3uNGOpOPYD
	qh9DGQbfesJAqfNuzb6TpcQhk2cfFKczwDET8JG0kapGJ56y45EZ9coodAy4GqDlY318IS9v6DI
	=
X-Gm-Gg: ASbGncvNRxGNcEfST2t59lXmoc74Z7kuCneX6f7pWG4nxc6sKrkn4ER54LL1zyfO9NU
	5yu6V2GUJM9dtLR4p0rH1DfxS78zuNAXcSv4HufELVyZCkxk0JODAStalctMHJkR9vXAt7AT27r
	FzKxt7D6+g1ous3tuo02Qwi2xyAylsMwQSLLvVEU9N8+4Go/PwmuVG+l8pGM6eccdU7EZR1gJKc
	yKceACt/zfGKV8NN5gVlryxXJvl2LFWg+m1sbnLdJWeoHfSe5GUg6X+RUpood7OEZxfTYoaEe7G
	C3aStphZD/dQ5yfr6h0P6sb+HrG+ygO4YTwjRVesqrCxaFtnLGr4Xr46zRtx3ptKY9Wtd2Dvmr0
	jJbaXm8qafhcBMYaJ+xHgEvTiICOFag==
X-Google-Smtp-Source: AGHT+IFUQAYgdwylcRt17N6aDzg8lVuRZinZ/67XT/+6aKMIt6u3gbVMpzUPLXDGMc3NmVZOw/29Ug==
X-Received: by 2002:a05:6000:18a3:b0:38d:ae1e:2f3c with SMTP id ffacd0b85a97d-395b86ea83amr1129332f8f.25.1741853238105;
        Thu, 13 Mar 2025 01:07:18 -0700 (PDT)
Message-ID: <1287edd8-188f-4b1a-b087-0beb3eea5ed4@suse.com>
Date: Thu, 13 Mar 2025 09:07:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v8 RESEND 2/6] Arm32: use new-style entry annotations for MMU
 code
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
v7: New.

--- a/xen/arch/arm/arm32/mmu/head.S
+++ b/xen/arch/arm/arm32/mmu/head.S
@@ -160,6 +160,13 @@
 .endm
 
 .section .text.idmap, "ax", %progbits
+/*
+ * Code below wants to all live in the section established above.  Annotations
+ * from xen/linkage.h therefore may not switch sections (honoring
+ * CONFIG_CC_SPLIT_SECTIONS).  Override the respective macro.
+ */
+#undef SYM_PUSH_SECTION
+#define SYM_PUSH_SECTION(name, attr)
 
 /*
  * Rebuild the boot pagetable's first-level entries. The structure
@@ -174,7 +181,7 @@
  *
  * Clobbers r0 - r5
  */
-create_page_tables:
+FUNC_LOCAL(create_page_tables)
         /* Prepare the page-tables for mapping Xen */
         mov_w r0, XEN_VIRT_START
 
@@ -263,7 +270,7 @@ use_temporary_mapping:
 
         mov   r12, #1                /* r12 := temporary mapping created */
         mov   pc, lr
-ENDPROC(create_page_tables)
+END(create_page_tables)
 
 /*
  * Turn on the Data Cache and the MMU. The function will return
@@ -276,7 +283,7 @@ ENDPROC(create_page_tables)
  *
  * Clobbers r0 - r5
  */
-enable_mmu:
+FUNC_LOCAL(enable_mmu)
         PRINT("- Turning on paging -\r\n")
 
         /*
@@ -346,7 +353,7 @@ enable_mmu:
         teq   r12, #0
         beq   remove_identity_mapping
         b     remove_temporary_mapping
-ENDPROC(enable_mmu)
+END(enable_mmu)
 
 /*
  * Switch to the runtime mapping. The logic depends on whether the
@@ -366,7 +373,7 @@ ENDPROC(enable_mmu)
  *
  * Clobbers r0 - r4
  */
-switch_to_runtime_mapping:
+FUNC_LOCAL(switch_to_runtime_mapping)
         /*
          * Jump to the runtime mapping if the virt and phys are not
          * clashing
@@ -411,7 +418,7 @@ ready_to_switch:
         PRINT_ID("- Jumping to runtime address -\r\n")
 
         mov   pc, lr
-ENDPROC(switch_to_runtime_mapping)
+END(switch_to_runtime_mapping)
 
 /*
  * Enable mm (turn on the data cache and the MMU) for secondary CPUs.
@@ -428,7 +435,7 @@ ENDPROC(switch_to_runtime_mapping)
  *
  * Clobbers r0 - r6
  */
-ENTRY(enable_secondary_cpu_mm)
+FUNC(enable_secondary_cpu_mm)
         mov   r6, lr
 
         bl    create_page_tables
@@ -456,7 +463,7 @@ ENTRY(enable_secondary_cpu_mm)
 
         /* Return to the virtual address requested by the caller. */
         mov   pc, r6
-ENDPROC(enable_secondary_cpu_mm)
+END(enable_secondary_cpu_mm)
 
 /*
  * Enable mm (turn on the data cache and the MMU) for the boot CPU.
@@ -474,7 +481,7 @@ ENDPROC(enable_secondary_cpu_mm)
  *
  * Clobbers r0 - r6
  */
-ENTRY(enable_boot_cpu_mm)
+FUNC(enable_boot_cpu_mm)
         mov   r6, lr
 
 #ifdef CONFIG_EARLY_PRINTK
@@ -491,7 +498,7 @@ ENTRY(enable_boot_cpu_mm)
         /* Address in the runtime mapping to jump to after the MMU is enabled */
         mov   lr, r6
         b     enable_mmu
-ENDPROC(enable_boot_cpu_mm)
+END(enable_boot_cpu_mm)
 
 /*
  * Remove the 1:1 map from the page-tables. It is not easy to keep track
@@ -503,7 +510,7 @@ ENDPROC(enable_boot_cpu_mm)
  *
  * Clobbers r0 - r3
  */
-remove_identity_mapping:
+FUNC_LOCAL(remove_identity_mapping)
         PRINT("- Removing the identity mapping -\r\n")
 
         /* r2:r3 := invalid page-table entry */
@@ -518,14 +525,14 @@ remove_identity_mapping:
 
         flush_xen_tlb_local r0
         mov   pc, lr
-ENDPROC(remove_identity_mapping)
+END(remove_identity_mapping)
 
 /*
  * Remove the temporary mapping of Xen starting at TEMPORARY_XEN_VIRT_START.
  *
  * Clobbers r0 - r3
  */
-remove_temporary_mapping:
+FUNC_LOCAL(remove_temporary_mapping)
         PRINT("- Removing the temporary mapping -\r\n")
 
         /* r2:r3 := invalid page-table entry */
@@ -541,13 +548,14 @@ remove_temporary_mapping:
         flush_xen_tlb_local r0
 
         mov  pc, lr
-ENDPROC(remove_temporary_mapping)
+END(remove_temporary_mapping)
 
 /* Fail-stop */
-fail:   PRINT("- Boot failed -\r\n")
+FUNC_LOCAL(fail)
+        PRINT("- Boot failed -\r\n")
 1:      wfe
         b     1b
-ENDPROC(fail)
+END(fail)
 
 /*
  * Switch TTBR
@@ -555,7 +563,7 @@ ENDPROC(fail)
  *
  * TODO: This code does not comply with break-before-make.
  */
-ENTRY(switch_ttbr)
+FUNC(switch_ttbr)
         dsb                            /* Ensure the flushes happen before
                                         * continuing */
         isb                            /* Ensure synchronization with previous
@@ -579,4 +587,4 @@ ENTRY(switch_ttbr)
         isb
 
         mov pc, lr
-ENDPROC(switch_ttbr)
+END(switch_ttbr)


