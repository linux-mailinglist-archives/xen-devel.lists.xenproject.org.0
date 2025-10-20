Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 71565BF0CAE
	for <lists+xen-devel@lfdr.de>; Mon, 20 Oct 2025 13:19:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1146150.1478616 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vAnv9-0003Zj-F0; Mon, 20 Oct 2025 11:19:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1146150.1478616; Mon, 20 Oct 2025 11:19:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vAnv9-0003YK-Bz; Mon, 20 Oct 2025 11:19:23 +0000
Received: by outflank-mailman (input) for mailman id 1146150;
 Mon, 20 Oct 2025 11:19:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=7iz2=45=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vAnv8-0003Y5-9L
 for xen-devel@lists.xenproject.org; Mon, 20 Oct 2025 11:19:22 +0000
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [2a00:1450:4864:20::42f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9f9a3ed0-ada6-11f0-980a-7dc792cee155;
 Mon, 20 Oct 2025 13:19:20 +0200 (CEST)
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-4283be7df63so1014106f8f.1
 for <xen-devel@lists.xenproject.org>; Mon, 20 Oct 2025 04:19:20 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-427ea5b3acfsm14781399f8f.14.2025.10.20.04.19.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Oct 2025 04:19:19 -0700 (PDT)
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
X-Inumbo-ID: 9f9a3ed0-ada6-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1760959160; x=1761563960; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=AI0XfI34h1Zl5StAh9WFtTOYxg7ZUNHMx3r652w6/xg=;
        b=W+/4+05DNcG+00bPdjuUWXuROpZ3FqlT41iNBgHt6vawcicItb8l7tsQGJyDvUpwJR
         zJxD0fPLdWootS0mrlCLf9OBDQ37M4zEV4fGim45rf6MXTLmanf0IiQ6C5t9qAWw+uT1
         9mBh458RtyBjytlXxhGnOx4oKcUyGEgNKwfReTrj0rmKKdickxzgNmEdFqtWBFlpUWbA
         T1qLIzmIsUYKJyXQFqXQeRpu6SuwXt3QvpeOifbCXahQR1DgI5dk8uJm9tAjFLUZTTQ2
         Lcx+Be+gYYPbAKm/rQbzEeHikj9Vu6rDXaycbsZ2dY8fNQujHqDyN5kk/tUljJOvHaX9
         qrWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760959160; x=1761563960;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AI0XfI34h1Zl5StAh9WFtTOYxg7ZUNHMx3r652w6/xg=;
        b=NY+9pUAPDYtj+OvrEbN7IfFYrMOtATLKi726ctO5E358fIdQhRPJBRWTkE+gjAzn9j
         +byqIEyTebapcnPKGyLP8mSNkYfG+akCm+LJailiYyCGHCYTFEz0p0JFzpYhYrdi6QgE
         s2AbY8EjJMMxbhk7THFRvLlerZqHkwh6pffSeZa/oLVVCXwubMTO1O8LBoCJtsVwXQsa
         uu20e/H9F36X02fomFPMUF6ZyLmIFC52YJinJO/4hHnBzt8uDDfVtvXdHYuJd/pzpxaW
         nJg4J6w62u0qjTSxvR10NewWD+LnYM6H142L832A810i3dey4+QFk8ncGca/CF5IVjQE
         UvgA==
X-Gm-Message-State: AOJu0YwOPCJHccCmNEqrpgccWOMJa4To2vGqSr1EQl68/e8uq34Bn8Cs
	JEZCHbwZSl8w+aJeK67NNXxCkoJhNKDVAueLeBTiZy0XDIY3X7VF4eACGCIPZVVPacUlMeUiVbo
	XWkk=
X-Gm-Gg: ASbGnct69Ft2seR7yvFEup1LGFB25IJyd8iwUqfclLLU2I3/O1aqTjKWK+MFm9vvOLV
	nDELtc1/UNYpB8JoKlW097//wdBnDd7jc6IgZgBrf0w5/HZ4CM6b8IlpMlgsUbTasNflfod7EVw
	E/YCKatKlRTUa0Oo3CUSbJ66+vxC3wwi8BeQWbCCAweN89odL8xIXUO8pq40QVTLRBQc9kF+VkC
	x0g56CB3y+6UaqeL/R/YoS0ZEJa8JsnT+5GkSC0eVXAAImCPzNdfqMxIMv5KHM6Gh6dlo03mDMX
	+3ji7ec8T3C8ST0DGdViJLQ47SvNdqAAuPscyMqgpMKsuGUlpIG1qZwnj7ATzLeojRinuCLPGPx
	gFsy9HZ21LMCEa1jy94OMXYgUhph2DgSa0YYtnpbn/2bwUssys9kLzHWBXK1YY5cWXaSDMguuii
	dNl2WfMOix2VxgHUcI0/cprsqirGx3dCMYjnFCKPXaK4QDhfyHJZyumOISCZuN
X-Google-Smtp-Source: AGHT+IHCXE0dJDtsjlPTRwNty5pqiwlUd1ly4yT/a6uQB5hIdfdbppAaqSjA3JntMNUWWYupbhdqPA==
X-Received: by 2002:a05:6000:2301:b0:428:3e62:3225 with SMTP id ffacd0b85a97d-4283e6236f6mr5165411f8f.60.1760959159759;
        Mon, 20 Oct 2025 04:19:19 -0700 (PDT)
Message-ID: <c357cb79-a10d-4d81-9695-9d16a4080595@suse.com>
Date: Mon, 20 Oct 2025 13:19:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v2 for-4.21 3/9] x86/HPET: replace handle_hpet_broadcast()'s
 on-stack cpumask_t
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>
References: <b66ea488-2d47-472c-9520-8590fdf89e0e@suse.com>
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
In-Reply-To: <b66ea488-2d47-472c-9520-8590fdf89e0e@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

With large NR_CPUS on-stack cpumask_t variables are problematic. Now that
the IRQ handler can't be invoked in a nested manner anymore, we can
instead use a per-CPU variable. While we can't use scratch_cpumask in code
invoked from IRQ handlers, simply amend that one with a HPET-special form.
(Note that only one of the two IRQ handling functions can come into play
at any one time.)

Fixes: 996576b965cc ("xen: allow up to 16383 cpus")
Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
While doing this I noticed that this and all pre-existing uses of
DEFINE_PER_CPU_READ_MOSTLY() aren't quite right: When the type is
cpumask_var_t, the variable is read-mostly only when NR_CPUS <=
2 * BITS_PER_LONG. That'll want sorting separately, though.

It is important for this to not be moved ahead of "x86/HPET: use single,
global, low-priority vector for broadcast IRQ", as the original call here
from set_channel_irq_affinity() may not use the new variable (it would
need to use scratch_cpumask instead).
---
v2: New.

--- a/xen/arch/x86/hpet.c
+++ b/xen/arch/x86/hpet.c
@@ -196,7 +196,7 @@ static void evt_do_broadcast(cpumask_t *
 
 static void cf_check handle_hpet_broadcast(struct hpet_event_channel *ch)
 {
-    cpumask_t mask;
+    cpumask_t *scratch = this_cpu(hpet_scratch_cpumask);
     s_time_t now, next_event;
     unsigned int cpu;
     unsigned long flags;
@@ -209,7 +209,7 @@ again:
     spin_unlock_irqrestore(&ch->lock, flags);
 
     next_event = STIME_MAX;
-    cpumask_clear(&mask);
+    cpumask_clear(scratch);
     now = NOW();
 
     /* find all expired events */
@@ -218,13 +218,13 @@ again:
         s_time_t deadline = ACCESS_ONCE(per_cpu(timer_deadline, cpu));
 
         if ( deadline <= now )
-            __cpumask_set_cpu(cpu, &mask);
+            __cpumask_set_cpu(cpu, scratch);
         else if ( deadline < next_event )
             next_event = deadline;
     }
 
     /* wakeup the cpus which have an expired event. */
-    evt_do_broadcast(&mask);
+    evt_do_broadcast(scratch);
 
     if ( next_event != STIME_MAX )
     {
--- a/xen/arch/x86/include/asm/smp.h
+++ b/xen/arch/x86/include/asm/smp.h
@@ -22,6 +22,7 @@
 DECLARE_PER_CPU(cpumask_var_t, cpu_sibling_mask);
 DECLARE_PER_CPU(cpumask_var_t, cpu_core_mask);
 DECLARE_PER_CPU(cpumask_var_t, scratch_cpumask);
+DECLARE_PER_CPU(cpumask_var_t, hpet_scratch_cpumask);
 DECLARE_PER_CPU(cpumask_var_t, send_ipi_cpumask);
 
 /*
--- a/xen/arch/x86/smpboot.c
+++ b/xen/arch/x86/smpboot.c
@@ -55,6 +55,9 @@ DEFINE_PER_CPU_READ_MOSTLY(cpumask_var_t
 DEFINE_PER_CPU_READ_MOSTLY(cpumask_var_t, scratch_cpumask);
 static cpumask_t scratch_cpu0mask;
 
+DEFINE_PER_CPU_READ_MOSTLY(cpumask_var_t, hpet_scratch_cpumask);
+static cpumask_t hpet_scratch_cpu0mask;
+
 DEFINE_PER_CPU_READ_MOSTLY(cpumask_var_t, send_ipi_cpumask);
 static cpumask_t send_ipi_cpu0mask;
 
@@ -976,6 +979,8 @@ static void cpu_smpboot_free(unsigned in
         FREE_CPUMASK_VAR(per_cpu(cpu_core_mask, cpu));
         if ( per_cpu(scratch_cpumask, cpu) != &scratch_cpu0mask )
             FREE_CPUMASK_VAR(per_cpu(scratch_cpumask, cpu));
+        if ( per_cpu(hpet_scratch_cpumask, cpu) != &hpet_scratch_cpu0mask )
+            FREE_CPUMASK_VAR(per_cpu(hpet_scratch_cpumask, cpu));
         if ( per_cpu(send_ipi_cpumask, cpu) != &send_ipi_cpu0mask )
             FREE_CPUMASK_VAR(per_cpu(send_ipi_cpumask, cpu));
     }
@@ -1112,6 +1117,7 @@ static int cpu_smpboot_alloc(unsigned in
     if ( !(cond_zalloc_cpumask_var(&per_cpu(cpu_sibling_mask, cpu)) &&
            cond_zalloc_cpumask_var(&per_cpu(cpu_core_mask, cpu)) &&
            cond_alloc_cpumask_var(&per_cpu(scratch_cpumask, cpu)) &&
+           cond_alloc_cpumask_var(&per_cpu(hpet_scratch_cpumask, cpu)) &&
            cond_alloc_cpumask_var(&per_cpu(send_ipi_cpumask, cpu))) )
         goto out;
 
@@ -1239,6 +1245,7 @@ void __init smp_prepare_boot_cpu(void)
     cpumask_set_cpu(cpu, &cpu_present_map);
 #if NR_CPUS > 2 * BITS_PER_LONG
     per_cpu(scratch_cpumask, cpu) = &scratch_cpu0mask;
+    per_cpu(hpet_scratch_cpumask, cpu) = &hpet_scratch_cpu0mask;
     per_cpu(send_ipi_cpumask, cpu) = &send_ipi_cpu0mask;
 #endif
 


