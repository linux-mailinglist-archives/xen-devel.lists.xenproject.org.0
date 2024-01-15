Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 683C082DB62
	for <lists+xen-devel@lfdr.de>; Mon, 15 Jan 2024 15:36:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.667414.1038654 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rPO4s-0000Wj-3D; Mon, 15 Jan 2024 14:36:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 667414.1038654; Mon, 15 Jan 2024 14:36:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rPO4r-0000Tc-Ug; Mon, 15 Jan 2024 14:36:37 +0000
Received: by outflank-mailman (input) for mailman id 667414;
 Mon, 15 Jan 2024 14:36:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jLm1=IZ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rPO4q-0000TM-Hb
 for xen-devel@lists.xenproject.org; Mon, 15 Jan 2024 14:36:36 +0000
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [2a00:1450:4864:20::334])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7b66d45b-b3b3-11ee-9b0f-b553b5be7939;
 Mon, 15 Jan 2024 15:36:34 +0100 (CET)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-40e80046246so2658585e9.1
 for <xen-devel@lists.xenproject.org>; Mon, 15 Jan 2024 06:36:34 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 j27-20020adfb31b000000b00336e32338f3sm12166221wrd.70.2024.01.15.06.36.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 Jan 2024 06:36:34 -0800 (PST)
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
X-Inumbo-ID: 7b66d45b-b3b3-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1705329394; x=1705934194; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:references:cc:to
         :from:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=e/vLrJhMfgT6/QpkaKU7E9tT/DlCGICDK2Ql9bfvWrE=;
        b=B4jHIn2+ICkwlOBSeeuEUqDsX0YoRUY//rXeksUgyxxCnvqHx567MCFHzgjWSntwUp
         /9CW7hXo/tlZr9YEjLqHw3j5UKwcb9AaemrN8pvJvZUwhbP8YaalgDMvglkWRDGoP6Ad
         VV3wmE++D0Pqi+8kRB27UQHEunAG9z1YD9jCEItEuvShAX2uM6zN8okcJ6UNg56a829j
         Zftx6wFfQyNJqVDwV3t5XLeJSzHjBjg1CmwsdoGggv/MQX/et4FeozHh6Hh6i6xfqq2g
         CH2Q5VdB4LW+VdDrhbs4TVdsa8Os0NbGZI5BTNTWqkKwbhF00nwgZxwOcKfVbee488Q5
         AIFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705329394; x=1705934194;
        h=content-transfer-encoding:in-reply-to:autocrypt:references:cc:to
         :from:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=e/vLrJhMfgT6/QpkaKU7E9tT/DlCGICDK2Ql9bfvWrE=;
        b=MbwG3E+0VAqpPmcDDqHrjuCmB6JT5EVVFuSuSUL3WBCfBOcl/fuUaKbDm5rlMyZ/gc
         El7y57NmNOc/MKyFarKICERq61mJu0yf8KmaBrkyISF6BqtP9nJdPN1HvVz1cOHP5fVJ
         zZqXWIfHW+5eBtX55ecPOT7fsqB4Xs5fD0SgUWAEJ0ZIGPyFx236yjHkMc10wLnlyq9B
         uRaiy3GrpTHL94VGjNJAUZXcOOpld+BACpwCEyCHu/qR/HcodK4OL3CVrbMSrjPeobRV
         xvhzuRGqqWAgj4VnCSgLu3KIsw2XI6e/R8/tYDKUKrGOF/IA75+Sndzk/3fBJaqXNXnE
         a+yA==
X-Gm-Message-State: AOJu0YwmO1yRtmT1GXf0dyWH13tB0ELYg3UoNQzOVpT+iKoTQa/qGYk/
	fbRvdAE5vd8RJ1i2sIeuMXG+1MrlxjVKBBdhtQJY51eh8A==
X-Google-Smtp-Source: AGHT+IGWxkLJBKgklwKLc6qGoDjPPjv7jwlTgeKRLNLYC1BrohudykjGpxPIL8NGYQHWKTN8/cZLHg==
X-Received: by 2002:a05:600c:379a:b0:40e:4a88:fd6c with SMTP id o26-20020a05600c379a00b0040e4a88fd6cmr3181632wmr.61.1705329394216;
        Mon, 15 Jan 2024 06:36:34 -0800 (PST)
Message-ID: <7871702a-b5ca-4430-b282-148b46fccc71@suse.com>
Date: Mon, 15 Jan 2024 15:36:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v5 4/8] Arm: annotate entry points with type and size
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Julien Grall <julien@xen.org>, Stefano Stabellini
 <sstabellini@kernel.org>, Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 George Dunlap <george.dunlap@citrix.com>, Michal Orzel <michal.orzel@amd.com>
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
except for the changed padding value (noticable when config.gz isn't a
multiple of 4 in size). Plus of course the converted symbols change to
be hidden ones.

Note that ASM_INT() is switched to DATA(), not DATA_LOCAL(), as the only
use site wants the symbol global anyway.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
Reviewed-by: Julien Grall <jgrall@amazon.com>
---
Only one each of the assembly files is being converted for now. More
could be done right here or as follow-on in separate patches.

The ASM_INT() redundancy of .global will be eliminated by a subsequent
patch.
---
v3: New.

--- a/xen/arch/arm/arm32/lib/div64.S
+++ b/xen/arch/arm/arm32/lib/div64.S
@@ -42,7 +42,7 @@
  * Clobbered regs: xl, ip
  */
 
-ENTRY(__do_div64)
+FUNC(__do_div64)
 UNWIND(.fnstart)
 
 	@ Test for easy paths first.
@@ -206,4 +206,4 @@ Ldiv0_64:
 	ldr	pc, [sp], #8
 
 UNWIND(.fnend)
-ENDPROC(__do_div64)
+END(__do_div64)
--- a/xen/arch/arm/arm64/lib/clear_page.S
+++ b/xen/arch/arm/arm64/lib/clear_page.S
@@ -22,7 +22,7 @@
  * Parameters:
  *	x0 - dest
  */
-ENTRY(clear_page)
+FUNC(clear_page)
 	mrs	x1, dczid_el0
 	and	w1, w1, #0xf
 	mov	x2, #4
@@ -33,4 +33,4 @@ ENTRY(clear_page)
 	tst	x0, #(PAGE_SIZE - 1)
 	b.ne	1b
 	ret
-ENDPROC(clear_page)
+END(clear_page)
--- a/xen/arch/arm/include/asm/asm_defns.h
+++ b/xen/arch/arm/include/asm/asm_defns.h
@@ -5,6 +5,7 @@
 /* NB. Auto-generated from arch/.../asm-offsets.c */
 #include <asm/asm-offsets.h>
 #endif
+#include <xen/linkage.h>
 #include <asm/processor.h>
 
 /* Macros for generic assembly code */
@@ -30,10 +31,7 @@ label:  .asciz msg;
 #define RODATA_STR(label, msg) RODATA_SECT(.rodata.str, label, msg)
 
 #define ASM_INT(label, val)                 \
-    .p2align 2;                             \
-label: .long (val);                         \
-    .size label, . - label;                 \
-    .type label, %object
+    DATA(label, 4) .long (val); END(label)
 
 #endif /* __ARM_ASM_DEFNS_H__ */
 /*
--- a/xen/arch/arm/include/asm/config.h
+++ b/xen/arch/arm/include/asm/config.h
@@ -53,7 +53,8 @@
 
 /* Linkage for ARM */
 #ifdef __ASSEMBLY__
-#define ALIGN .align 2
+#define CODE_ALIGN 4
+#define ALIGN .balign CODE_ALIGN
 #define ENTRY(name)                             \
   .globl name;                                  \
   ALIGN;                                        \
@@ -61,8 +62,6 @@
 #define GLOBAL(name)                            \
   .globl name;                                  \
   name:
-#define END(name) \
-  .size name, .-name
 #define ENDPROC(name) \
   .type name, %function; \
   END(name)


