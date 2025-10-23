Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 748C8C023F2
	for <lists+xen-devel@lfdr.de>; Thu, 23 Oct 2025 17:51:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1149398.1481058 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vBxap-0005bS-Rl; Thu, 23 Oct 2025 15:51:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1149398.1481058; Thu, 23 Oct 2025 15:51:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vBxap-0005Yy-P0; Thu, 23 Oct 2025 15:51:11 +0000
Received: by outflank-mailman (input) for mailman id 1149398;
 Thu, 23 Oct 2025 15:51:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=U0PU=5A=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vBxao-0003ZG-7e
 for xen-devel@lists.xenproject.org; Thu, 23 Oct 2025 15:51:10 +0000
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [2a00:1450:4864:20::334])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 172fb32a-b028-11f0-980a-7dc792cee155;
 Thu, 23 Oct 2025 17:51:08 +0200 (CEST)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-47100eae3e5so9893755e9.1
 for <xen-devel@lists.xenproject.org>; Thu, 23 Oct 2025 08:51:08 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-475caf2eb9csm43491125e9.14.2025.10.23.08.51.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 Oct 2025 08:51:07 -0700 (PDT)
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
X-Inumbo-ID: 172fb32a-b028-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1761234668; x=1761839468; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=9TMhIC/Uy9aMDm9ORaG98m2uAOJkSyvYUFdpB79e4bk=;
        b=AIE/uE9fCfg2VPocl9Kpgm7YtQt+UB2V+mlfladaF2AuzRFVlRUH6uq6AlLfM1F59q
         XbL4r9rRsB0ELrBohL6LlgZPuDmcQ6jjz4KIF/jAjcemG6rbU8EnAw/U51J/L3cOqBZI
         3bqWISgirE0UOZunGqxHqNvC8CTsPM0I3KiVP6DmWMZ06EJNrgV/05RPBdhm/ul1eKhP
         qQKXbfaqpTkEqAr/ziuk1ERMy2jQ+WfGGKqhMJhHOxGG5YKM55kNnSsTAm9WfGR0sUS7
         5q1DIcDuxx65zLd6I+zS5KXS37k82t3T3fotYbaECOQuG/FcwlpxTMCdOTn7Ijjits3j
         /KGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761234668; x=1761839468;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9TMhIC/Uy9aMDm9ORaG98m2uAOJkSyvYUFdpB79e4bk=;
        b=SuMSAA+v43b9c1eiT+xv2UqOMSEAVdW1SROgk0iEx6034hc9lm9D6xwdgDNeED+4L6
         AcA2MQtJunPpjvL5E5gkQeLckBUD7Moh5S4xGZzckxkuTZD6+vg7B3APqy0PfZ3CTiMr
         WD3sA/2ztpQIJWRuAiTfsQVe9XPN4ptv+GginyVrFBq5iFBTfjgGpZFZJ8/KNqsPv27e
         tpr/lko9/Lt1ORrANR1LSg72apxpLbdIuhVrkI1fDqPNPubfOqwC0oHS8xRu9bv6LYQ9
         lPAaG27yPfS73x3fBiR/+ZP/n0CymeWZL3MEfVRnY08CfMG8UPJiW2lrQFbiU16M6vs1
         +U3w==
X-Gm-Message-State: AOJu0YwQSBU0YCfnjdNTcPc81ag2PfRniZ+Yz7lFmefNeY/i5U/4U9ET
	ELslbIkD8XgZeo9bGn3++BAgiFz6QvQYfMoC7OR6aCprQsMKKS5gkUEC1R/Rc85mfCRU9LaNJCV
	W4U4=
X-Gm-Gg: ASbGncvv+/BqJrkSadwgJAaE7Y7wIPlkT+vGogSyuAqE9z18rD7T4yA2kqLU/YzGMd7
	mdk7ujRMv/C+xIbnVeU1Uo/rjeIuQZi2TfKEq7v45k0Hp/7S9PqAmbwYG3osOo6xHZFC4VBtTDF
	a9pkSDOnq0s5FtDnUZtvu9mkN1SU4W2pOPpvrkB6bTHVM39X3bPa1STxwK29IZx962nL5cgwhsZ
	u7MH+f7oL6QrQfvFFlrGRgrO3vGD+1gt5PwFUKdQdNsqwZ055Hs4/+6/+QF7qAMkRnIuasmSdpm
	VE0UPUheqIJusYWfGXvgDqT4+RjsnVeIeO/0dFG0xzU+3ZjJYHSCTms9iu5k9tC7RcpRZIGrgJn
	hkhIE4WRLhE4whMuxI1kvkKW2IyKnh0r5Wz5jyWmd4JrmsoT6SlPNP9fzbF3Y3M5xp0XmWrjZ6w
	qmdOeR2hyaR1PRZbPLIlt4D8o3Hya0JIWjM0c/Lqc3MBvmdPF0xsVJsHhs5CQvdlsTdNc++iiLQ
	qb90mr3OA==
X-Google-Smtp-Source: AGHT+IGyXxh3f8geRhvyG8xnAOPitOOxj1G0PMMfhzwHd81bO351pZ/QkUzH9EzUUi5m7cTKG+k7CQ==
X-Received: by 2002:a05:600c:34d5:b0:46f:b42e:e39e with SMTP id 5b1f17b1804b1-4711791da0amr191684615e9.39.1761234667806;
        Thu, 23 Oct 2025 08:51:07 -0700 (PDT)
Message-ID: <dcea0975-8642-46b6-ad79-ec76cb8a76f1@suse.com>
Date: Thu, 23 Oct 2025 17:51:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v3 for-4.21 3/9] x86/HPET: replace handle_hpet_broadcast()'s
 on-stack cpumask_t
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>
References: <6a8a912c-7276-42bd-af2b-b94fc6ce4291@suse.com>
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
In-Reply-To: <6a8a912c-7276-42bd-af2b-b94fc6ce4291@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

With large NR_CPUS on-stack cpumask_t variables are problematic. Now that
the IRQ handler can't be invoked in a nested manner anymore, we can
instead use a per-CPU variable. While we can't use scratch_cpumask in code
invoked from IRQ handlers, simply amend that one with a HPET-special form.
(Note that only one of the two IRQ handling functions can come into play
at any one time.)

Fixes: 996576b965cc ("xen: allow up to 16383 cpus")
Signed-off-by: Jan Beulich <jbeulich@suse.com>
Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>
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
 


