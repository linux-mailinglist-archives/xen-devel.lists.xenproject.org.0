Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E90A198C19A
	for <lists+xen-devel@lfdr.de>; Tue,  1 Oct 2024 17:28:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.808279.1220168 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1svenE-0004Eu-1t; Tue, 01 Oct 2024 15:28:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 808279.1220168; Tue, 01 Oct 2024 15:28:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1svenD-0004Cf-V1; Tue, 01 Oct 2024 15:28:03 +0000
Received: by outflank-mailman (input) for mailman id 808279;
 Tue, 01 Oct 2024 15:28:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jjk+=Q5=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1svecd-0006cV-Oe
 for xen-devel@lists.xenproject.org; Tue, 01 Oct 2024 15:17:07 +0000
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [2a00:1450:4864:20::136])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 38ca8408-8008-11ef-a0ba-8be0dac302b0;
 Tue, 01 Oct 2024 17:17:07 +0200 (CEST)
Received: by mail-lf1-x136.google.com with SMTP id
 2adb3069b0e04-53991d05416so3255659e87.2
 for <xen-devel@lists.xenproject.org>; Tue, 01 Oct 2024 08:17:07 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a93c27c7237sm726038666b.81.2024.10.01.08.17.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Oct 2024 08:17:06 -0700 (PDT)
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
X-Inumbo-ID: 38ca8408-8008-11ef-a0ba-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1727795827; x=1728400627; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:cc:content-language
         :references:to:from:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lu1GiGzAFS51pwrdfGOQ2MVzi5IX7VZ3x23jbu0DltE=;
        b=J84oErtiXB4nCwPxvON+mIK9PjO7NimHfm37YV2u7LSFhCKentiYDRD5mWk7T7F2wS
         vSekOxFkLjJiZn0KtKm8CKNk/sKqmujs+MhX1OLb+/3SYlHcR/bq5zplmFydZpgRk9Q8
         W40BSWFLlTSB4LG2NRMH+nyJjZofVTXZgqfpvdZW0MDKbruHTW/SdsiToiE9gXnbZnUX
         ACKKfBk4Xx36us24uoFaXxzRNLr6qLyUF+jrSuf+x8cOh1hPrfzD7hIZKyLM3vfD8T+t
         WHhQQHnkFzWpZE358Q4AsZmEAh7uCtaJukr1a4WuvviX6bo6Bgi8dT52WQXpk/W1Y50e
         HyLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727795827; x=1728400627;
        h=content-transfer-encoding:in-reply-to:autocrypt:cc:content-language
         :references:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lu1GiGzAFS51pwrdfGOQ2MVzi5IX7VZ3x23jbu0DltE=;
        b=VlRjZqZ8fHtE6HxVgOhh4IuADdcWHWZLkgseIHHJK87DanOxXcmqHCGvXn3t4JdfVs
         iriR7O9DC6XEcMz+c4G0zRTiYyuBtbo9htfuWFO8g/a41SdpuuvDQ/OKULW8NgKnS6Z7
         yqpvGwq5zPJG8/OL7+knfrejbMwRxK+K114iuDEGhAcjFMsg4DUgSKPRKzWe/OH/7n2H
         b0BEBHQAxVwEGWa7NLWAgLj7/JC8ihgIOu0fFdnIu3mfq4ScCn6jP34mcgmsucK7vAqx
         K4BmDu1ffkgzjFKa4nt+lUvjl6ZGq1KoNUc6ZFQ4+5aFay97UrD5wlQFgzZkL3I2xXli
         UvUQ==
X-Gm-Message-State: AOJu0Yy/3WiT25dYQ7jAgnWqUqDf1LgEohCPoqjYyEpKhUrQUQafNJPF
	HJoBlqfHGxz4YlASMMktgeicet1JBcK3Iu/eNl0bKoqxm5W1SnmhRXf4WhnXGVSXB9kV0G6cGpw
	=
X-Google-Smtp-Source: AGHT+IH1yhA3GKtrE6RLkZbejkuaUwppYDkJvGUPZMdydy8S+YzLIM08SNZmB+jcjU3iU8V428hzSA==
X-Received: by 2002:a05:6512:ba3:b0:539:8fcd:520 with SMTP id 2adb3069b0e04-5398fcd0637mr7453767e87.36.1727795826770;
        Tue, 01 Oct 2024 08:17:06 -0700 (PDT)
Message-ID: <74c761c9-41b1-4397-aec2-95558d53a7cc@suse.com>
Date: Tue, 1 Oct 2024 17:17:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v7 09/11] Arm32: use new-style entry annotations for entry
 code
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

Signed-off-by: Jan Beulich <jbeulich@suse.com>
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


