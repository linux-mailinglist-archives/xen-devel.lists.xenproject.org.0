Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E6316A465DA
	for <lists+xen-devel@lfdr.de>; Wed, 26 Feb 2025 17:01:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.896913.1305667 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tnJqE-0003Cb-Lr; Wed, 26 Feb 2025 16:00:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 896913.1305667; Wed, 26 Feb 2025 16:00:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tnJqE-00039B-I4; Wed, 26 Feb 2025 16:00:58 +0000
Received: by outflank-mailman (input) for mailman id 896913;
 Wed, 26 Feb 2025 16:00:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=J4Ti=VR=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tnJqD-0002Py-E2
 for xen-devel@lists.xenproject.org; Wed, 26 Feb 2025 16:00:57 +0000
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [2a00:1450:4864:20::42b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id dc9a5414-f45a-11ef-9897-31a8f345e629;
 Wed, 26 Feb 2025 17:00:55 +0100 (CET)
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-390d98ae34dso610871f8f.3
 for <xen-devel@lists.xenproject.org>; Wed, 26 Feb 2025 08:00:55 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-390cd86d1d5sm6076827f8f.39.2025.02.26.08.00.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 Feb 2025 08:00:54 -0800 (PST)
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
X-Inumbo-ID: dc9a5414-f45a-11ef-9897-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1740585655; x=1741190455; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=kDmhaPLV1KBtugpOb/drJdwa74rwyXxXKWWSRWQJz04=;
        b=DDTqVegLxqZnzP+QLjArFTMx1EMe8MNC0//MnJuBRUmg0bNrOxplldSpwJw55v0E8E
         dM0PCfkG35fIjz+i4OvIx/ymyRACEi/YCTHFMmpJnU+/TTbuVDLicARMHP2bRifc9PuK
         aXrZTBhnWyId1MEjSLh5JO1IeTHrEeG8DWFD2MMq1i5RATjbb+wzXw71rH0hmldNfl0f
         mf0dQjsqgR+U9HUYY62Fg3714bHx/pApGUjkJShCxQzWITzW8l6/9ohELad5N+fH4JXB
         Rd2VJosdvTJ99X4vXOLM1wZBCjxA6Rq3jwMJi0VK8zdJn89dYf2yqsKvgQQsrnfzEdxK
         qbcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740585655; x=1741190455;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kDmhaPLV1KBtugpOb/drJdwa74rwyXxXKWWSRWQJz04=;
        b=EkFzNW92e3zF4vZDoFXSTDZWXFcq46xjfj1T0DMRKbxVP80Rx6SCzeErDZi6YyGNln
         s5yZXnCOR3ISoTEdZe+ac4bBtbQvh0Q5MM+3om5AWRLDvXaLdw/VcI6ClCjDqwTymykD
         2bL/BTsEZ895MlqdZviRCatW4Vii7N5iFNHVfV8hl0ZqNfsIA1FEl5YtysGc2MVQyCro
         mC7q5KkTnnS2VsWUH+viH2L8S5D/+s3g10uoN8mZjIFvDXQX7k20kjguksWZByOrnFjl
         Dxr7MDcFw+bUFSVz74S/OVOczjwgEIDh/n3CVZJgBJUALuWiR509YnmRmiQgxTog6jPJ
         7lfA==
X-Gm-Message-State: AOJu0YzdfTxp+eECTQf7qqVxwhIAoRtbcC/ARsl4oRTZDNYa/7mHBaIm
	eEcB9toAH8ELtxklS+EJ1MaQhUTAlXWnhKI4RKKk3O5YdrjwP9JW+uTRDPba/Wl3rf2/rL2u6ds
	=
X-Gm-Gg: ASbGnctTUFwC7MsAg/1uU4UzP8Dujc3V0CO/bwXfU+aVq11sHjpULcDsj1P0ZtACtmE
	hh7hA4wVRDAEGJDCtj+UGNj3RgHFzX6NA+/lvHzEa1NkPVvEU+AbgZxscoLZVA0ziFTo96uDIYk
	foSnuy5OOdlw7ppYa2hHL6r2ayEQuVFKgt7oSu4tGHxdtBtEnW31SiQG3VrL7WqRL1yJWdss4Mb
	pVuCcpIUoI7YpUyGpz3g6AtEwAp6ctEc8H3xnUOlscJWXoUbi+e6hfON6+ngLjhpLFaaFrmzPVj
	6K3hgqDXmhbw/1/MKcFhRNHJTXQ+fjE7h9oaELhoyt5yu39aS67XnhGupfIp707DmfRzItiLWLM
	PYr2G3sAdJ4Y=
X-Google-Smtp-Source: AGHT+IFnsx4TlG4dHxyfvLPFUcljCNO4KtfdDkMrje5f4eEs7aFcpYESLENqqwuT7V1IFAnojOhaZg==
X-Received: by 2002:a05:6000:1866:b0:38a:8ec6:f46f with SMTP id ffacd0b85a97d-390d4fa3de0mr3339337f8f.53.1740585655024;
        Wed, 26 Feb 2025 08:00:55 -0800 (PST)
Message-ID: <99cfb9f4-6350-4515-99f8-b17b87157a07@suse.com>
Date: Wed, 26 Feb 2025 17:00:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v8 2/6] Arm32: use new-style entry annotations for MMU code
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Julien Grall <julien@xen.org>, Stefano Stabellini
 <sstabellini@kernel.org>, Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>
References: <e4bf47ca-2ae6-1fd4-56a6-e4e777150b64@suse.com>
 <e09dacac-b673-43fa-9a1c-3a3a5b5d802a@suse.com>
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
In-Reply-To: <e09dacac-b673-43fa-9a1c-3a3a5b5d802a@suse.com>
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


