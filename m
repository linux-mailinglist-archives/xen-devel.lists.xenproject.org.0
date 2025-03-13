Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 43316A5ED9F
	for <lists+xen-devel@lfdr.de>; Thu, 13 Mar 2025 09:08:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.911352.1317805 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tsdbS-0003O5-Uo; Thu, 13 Mar 2025 08:07:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 911352.1317805; Thu, 13 Mar 2025 08:07:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tsdbS-0003MM-R9; Thu, 13 Mar 2025 08:07:42 +0000
Received: by outflank-mailman (input) for mailman id 911352;
 Thu, 13 Mar 2025 08:07:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=7Xn0=WA=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tsdbR-0002fh-92
 for xen-devel@lists.xenproject.org; Thu, 13 Mar 2025 08:07:41 +0000
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [2a00:1450:4864:20::42e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3b579f7f-ffe2-11ef-9898-31a8f345e629;
 Thu, 13 Mar 2025 09:07:39 +0100 (CET)
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-390e3b3d3f4so350797f8f.2
 for <xen-devel@lists.xenproject.org>; Thu, 13 Mar 2025 01:07:39 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-395c83b6a27sm1260836f8f.31.2025.03.13.01.07.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 Mar 2025 01:07:38 -0700 (PDT)
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
X-Inumbo-ID: 3b579f7f-ffe2-11ef-9898-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1741853259; x=1742458059; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=XKljBacIPM6MhfkERp0GTy5k2MofG0GpSZ3K3Fzb1sA=;
        b=OrghxjR0FUV0qmWPUM8uA96f4+o38isfCyq+OLIj+yrqxrywIgpkVzgJKeSc1z98dR
         EBkI4ud73Z4LdCugXyZv3Asp/zP9T208rm2M+Wq/tCfV4ZaTs2ccKt+jO0zQussPu+W1
         uZEGQebG8zugSK2gFXtJZM2y7OoQ7nOPypfkD73ETGwO0JCYUdzXALM6fKBYf6btSxfw
         EjnWxp8q0L33gzHab1Q+MF+JLRK4JvQK8VBBXVQ+Auw0VgxPGZU4WSg/ETCDe05ttcHH
         1gsRQzIc7JwiCmvAxQboG9LpRQAgtDJn5WePwBCwpAsFS738WLlwTsSv9i/zLJ7HQ7vD
         SVsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741853259; x=1742458059;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XKljBacIPM6MhfkERp0GTy5k2MofG0GpSZ3K3Fzb1sA=;
        b=TZSbl01e4c4xDoHJvqV9IWb6s+nGlDtJLSrnoRxl2EBtk3cDvIcoxsH6Zj7g9m4Wet
         PtuyzHLWil+eEycn8mZQg//TK3/7VjfLxbksEsLm/BNPGmDx+mKqO/MMgjh4/FZ0fpX2
         e0WnHiub9N5rPE9pGNSxJv4E6+BGttuzGazQOG94sAoBZM+4MZHTbfPN1rpfKXNQu+Yl
         H2+rdvrPzLAPEOHfKEwwoSDwhChMIXfKaVn0RdG97Vuv6deVGy0ijOxqmzH4lygIRdQn
         tSZdOyiygi2lZehqmulyyxm1+gZUsXpEL0hT44QfeMQQfdOpbMapwjPoXzmdt6ofDfgu
         9a/g==
X-Gm-Message-State: AOJu0Yxb1MI2wv6zbbo7akU2cLxUqGUxKleGGfimwRrEIbCp+UgXGVnz
	9OuWVPiIOx+pjATzqmbHCnwQ/XIWFGK0wWFFUEMPaOOPH8r09a8+M3/2H7wCYsSEUmva8JcUNCk
	=
X-Gm-Gg: ASbGnctfwp19jFLLb/6wrUwDfKcIKXMqWb+9h8OyhCuN4+Qv59kNLvhpW71W3fjc+Ij
	i3Mh8+M8NfrusaK0DQsNn4d0ODDo51OrDuFKtcarzVqwda0f2+vUMupW50No48hS6Vqf2q2oww5
	S9OR/rHB5KfffEYKfnDiwBGCQo1mHClJ6D0nx8gWUog2rZ9amvXLgMzFGs3EnsZl8pDdWLCUgE3
	THl8fUAaskn4XXLvyE2sTRKINKo8Yx1IqB9xEJGAN6JYLHHFQFSF+MW6G25Ehm4qCwFH4768sFr
	JCbGWV6YlnicUbid4FiYDQn9CPu7GygUofYyh2HHqcIQlnRRhDpHNNpEskbwtkwN8jdXgeLBSGo
	jGk1FCswevSaXQO3yZeuQw0dpNdxMDw==
X-Google-Smtp-Source: AGHT+IFNjs9EtZR3jdS2HP7+IJGkzdIAwAMYmDJ5lsx4B1od1jm2hZCT5zOuMLeP/65L63JlwkEXcg==
X-Received: by 2002:a5d:64e4:0:b0:391:48f7:bd8a with SMTP id ffacd0b85a97d-39148f7be31mr13713225f8f.30.1741853259131;
        Thu, 13 Mar 2025 01:07:39 -0700 (PDT)
Message-ID: <149aff98-bccb-4671-9961-484e5651bf1f@suse.com>
Date: Thu, 13 Mar 2025 09:07:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v8 RESEND 3/6] Arm32: use new-style entry annotations for
 entry code
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

Signed-off-by: Jan Beulich <jbeulich@suse.com>
Tested-by: Luca Fancellu <luca.fancellu@arm.com> # arm
---
Should the GLOBAL()s also be replaced?
---
v7: New.

--- a/xen/arch/arm/arm32/entry.S
+++ b/xen/arch/arm/arm32/entry.S
@@ -31,7 +31,7 @@
  *  r4: Set to a non-zero value if a pending Abort exception took place.
  *      Otherwise, it will be set to zero.
  */
-prepare_context_from_guest:
+FUNC_LOCAL(prepare_context_from_guest)
 #ifdef CONFIG_ARM32_HARDEN_BRANCH_PREDICTOR
         /*
          * Restore vectors table to the default as it may have been
@@ -140,7 +140,7 @@ abort_guest_exit_end:
 
 skip_check:
         b   enter_hypervisor_from_guest_preirq
-ENDPROC(prepare_context_from_guest)
+END(prepare_context_from_guest)
 
         /*
          * Macro to define a trap entry.
@@ -362,13 +362,13 @@ trap_irq:
 trap_fiq:
         vector fiq
 
-return_from_trap:
+LABEL_LOCAL(return_from_trap)
         /*
          * Restore the stack pointer from r11. It was saved on exception
          * entry (see __DEFINE_TRAP_ENTRY).
          */
         mov sp, r11
-ENTRY(return_to_new_vcpu32)
+LABEL(return_to_new_vcpu32)
         ldr r11, [sp, #UREGS_cpsr]
         and r11, #PSR_MODE_MASK
         cmp r11, #PSR_MODE_HYP
@@ -426,6 +426,7 @@ return_to_hypervisor:
         clrex
         eret
         sb
+END(return_from_trap)
 
 /*
  * struct vcpu *__context_switch(struct vcpu *prev, struct vcpu *next)
@@ -435,12 +436,13 @@ return_to_hypervisor:
  *
  * Returns prev in r0
  */
-ENTRY(__context_switch)
+FUNC(__context_switch)
         add     ip, r0, #VCPU_arch_saved_context
         stmia   ip!, {r4 - sl, fp, sp, lr}      /* Save register state */
 
         add     r4, r1, #VCPU_arch_saved_context
         ldmia   r4, {r4 - sl, fp, sp, pc}       /* Load registers and return */
+END(__context_switch)
 
 /*
  * Local variables:


