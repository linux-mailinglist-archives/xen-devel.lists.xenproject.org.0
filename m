Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 20D6298C161
	for <lists+xen-devel@lfdr.de>; Tue,  1 Oct 2024 17:16:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.808250.1220134 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1svecG-0008TQ-L8; Tue, 01 Oct 2024 15:16:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 808250.1220134; Tue, 01 Oct 2024 15:16:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1svecG-0008Q3-Hw; Tue, 01 Oct 2024 15:16:44 +0000
Received: by outflank-mailman (input) for mailman id 808250;
 Tue, 01 Oct 2024 15:16:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jjk+=Q5=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1svecF-0006cV-0f
 for xen-devel@lists.xenproject.org; Tue, 01 Oct 2024 15:16:43 +0000
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [2a00:1450:4864:20::62a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 29de12a4-8008-11ef-a0ba-8be0dac302b0;
 Tue, 01 Oct 2024 17:16:42 +0200 (CEST)
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-a910860e4dcso64690766b.3
 for <xen-devel@lists.xenproject.org>; Tue, 01 Oct 2024 08:16:42 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a93c27773c0sm736022166b.1.2024.10.01.08.16.41
 for <xen-devel@lists.xenproject.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Oct 2024 08:16:41 -0700 (PDT)
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
X-Inumbo-ID: 29de12a4-8008-11ef-a0ba-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1727795802; x=1728400602; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:to:from:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kDmhaPLV1KBtugpOb/drJdwa74rwyXxXKWWSRWQJz04=;
        b=gF6krIrkP04Jda1lqW/drHBWTGFao1i/PTzNje2T5bOgta03uVvNVlqmhpYoYD/PyY
         zSxmRYU6KfWJYoTvHRwSOK3O36jcH3Je5UtXAOZS/bNxR74zjeVHOml2coPMolirkr1D
         fPrKx3ihExfS5gH1UjFKjUTkzWSgNLnmfFxsb4GC5IACbcclLSTzJqgaUP+l8gmwaYup
         v8U7wXG58Nl5QFO2M2KSDw6K5FEKwsyLK/KHyfjTtrSAq84gEF88l7kACnRGld8QZHB0
         aeFB+mWpKSGc1XPpPdMLiD8yWcbNmTUu1VRzFzZnVreTAknkydt+reWes4nSnckwt8JF
         XTIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727795802; x=1728400602;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kDmhaPLV1KBtugpOb/drJdwa74rwyXxXKWWSRWQJz04=;
        b=jySsXXIG5N00sZzCMdCHvDFjZpIhWsNqd/Q0HQM0QZqhtmboStw857lspcxcX+bHjW
         giiZ6Yz1NI8SWd6K97LsV5K1YZm0FdhesTU8gPpMHutCiSWSE9YT4Dw4ceYcI6Vi3jOA
         h0RM6LW0Pn8ZlKsi74Qu9OhtwIBvSJLxAZQZgPQfTmY7fqIvq4c3tVz5GR0UrK0wkMbQ
         NvoPwh62kc+GAeWw4Wi2ZOkSa2IQIB4Gwv4JynY1yW6DhAwcCdLV3/lk1I8ly/gGwFwW
         cI+3ZWvmPIZLPeaiVXgwOpCjS1DDAX+zOcGlb3kXQmOzq3QQ4lCVp5bf7HU7LJr0CmPP
         YptA==
X-Gm-Message-State: AOJu0Yy75Fa3nWLD7MRcTczyp38odbCCUiSowdA97uP3ooM2cFGpmnIx
	q6y/8i596y+CsdQ9a4pkFHavlPEr1AjIb0NDi/1yf7yjtk2p4rRldejopTnjWs6Idisr5RmdHcw
	=
X-Google-Smtp-Source: AGHT+IHOnm+9ZIJSbtd230MU90VUrqhjUsU9nVNxewRyh0vxzPstKQDAAw2vZdHSfRUktn4qz3+ZIg==
X-Received: by 2002:a17:906:f59b:b0:a83:94bd:d913 with SMTP id a640c23a62f3a-a93c48e80d3mr1803406266b.10.1727795801661;
        Tue, 01 Oct 2024 08:16:41 -0700 (PDT)
Message-ID: <7edbc094-6b3a-47f0-92b7-879ca1d76548@suse.com>
Date: Tue, 1 Oct 2024 17:16:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v7 08/11] Arm32: use new-style entry annotations for MMU code
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <e4bf47ca-2ae6-1fd4-56a6-e4e777150b64@suse.com>
 <98590a41-cee7-4ba3-a723-4e3ee3b55357@suse.com>
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
In-Reply-To: <98590a41-cee7-4ba3-a723-4e3ee3b55357@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Locally override SYM_PUSH_SECTION() to retain the intended section
association.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
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


