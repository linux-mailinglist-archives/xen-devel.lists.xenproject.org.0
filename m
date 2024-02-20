Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 11EF785B62D
	for <lists+xen-devel@lfdr.de>; Tue, 20 Feb 2024 09:56:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.683305.1062770 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rcLvS-000660-3N; Tue, 20 Feb 2024 08:56:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 683305.1062770; Tue, 20 Feb 2024 08:56:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rcLvS-00064S-0e; Tue, 20 Feb 2024 08:56:30 +0000
Received: by outflank-mailman (input) for mailman id 683305;
 Tue, 20 Feb 2024 08:56:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=YSgb=J5=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rcLvR-0005pz-97
 for xen-devel@lists.xenproject.org; Tue, 20 Feb 2024 08:56:29 +0000
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com
 [2a00:1450:4864:20::229])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ef22c0a5-cfcd-11ee-8a52-1f161083a0e0;
 Tue, 20 Feb 2024 09:56:28 +0100 (CET)
Received: by mail-lj1-x229.google.com with SMTP id
 38308e7fff4ca-2d247c31e1aso5044261fa.1
 for <xen-devel@lists.xenproject.org>; Tue, 20 Feb 2024 00:56:28 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 w14-20020adfcd0e000000b0033d14c96ec1sm12607957wrm.45.2024.02.20.00.56.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 20 Feb 2024 00:56:27 -0800 (PST)
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
X-Inumbo-ID: ef22c0a5-cfcd-11ee-8a52-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1708419388; x=1709024188; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:references:cc:to
         :from:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=UDhUrA6tM7xm4y+MMtOUTP3hYExqNaG8GAdW+v0Ujq4=;
        b=bqbyqfPzkmlEAMEMfFq7iuZMpyQVhgIkQz2bT2TbguG9hCjXBC/BIrXFrUCYLiMYjZ
         KQE0MxieGFyVxZVianpSNDqhA7KFK98d7OUcH7t5eEIC+tnxL0MRccthFQcwedDyHNz7
         vW5fG/QTRIFTgnjU4XdrXrdH8TLjNHCODFLrH/ITyg1ECk7fMdE3lbaCsCdg7kFWzMfD
         c+Q+2I3UZ4Z9zgvc9x5SfROb0weIQ/PB63yLziHZ4iD60FJT0hw6dnbDdMt4c4M5ed3m
         eltGbuhVGdBekDipxih3dyWzgb1l2mXJ4nSwY9Y4xr9520jo7x2MYXqIF/Y/r1oRkLpK
         PFeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708419388; x=1709024188;
        h=content-transfer-encoding:in-reply-to:autocrypt:references:cc:to
         :from:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UDhUrA6tM7xm4y+MMtOUTP3hYExqNaG8GAdW+v0Ujq4=;
        b=oWAlPuU8ujHHBImbaCzUlTXYJ2vm+GS0uYI4DH9kTab+UZ/eBD430kE6Ibr9WC6FVD
         0fT9ygmvEwy6O7XUKMlmyncFyvolYgJmK7NI2zO4ISxF38BWZovJ5eXZ66X6vOjMbBjH
         65V3kE3VQtX6tQ7xqVjvvmSArnOj6fe4er2oE3J2VRGn95bhDZhSrM9x4nqmyr2t6Eju
         1mCY8u+q7nPAxdROsd+2oZbDjJVZ2MHhNf9eEFhK7kD39jFgDtDIaPw7mGOjYkm4jTNe
         NpQQ9FK5KDbLJSXJxkObGpr9aiTpJYnKvlfHGMfzPgrsf1gGihKKNEUrddnPtRD+F3OJ
         3UfA==
X-Gm-Message-State: AOJu0Yxm/OquBhVDCRLVV8olqcnEAV650vITpQypFJJ1GEJxJq2DD8/D
	+5UNmMpLZVmRHcXBu23s8aM/pmRCxvYb7byt42lDaea9u1YRqSRmtHZwinCUwdG0SAE+xtPrYfE
	=
X-Google-Smtp-Source: AGHT+IHuJs0sbdMFsDfsnlWZQ85DshqCj5umcoFkvdkaMWTKP5kDN7x4qkZSjrcF5Eipjhvdn4z/0w==
X-Received: by 2002:a05:651c:118d:b0:2d2:34d5:63f5 with SMTP id w13-20020a05651c118d00b002d234d563f5mr3365975ljo.52.1708419387794;
        Tue, 20 Feb 2024 00:56:27 -0800 (PST)
Message-ID: <8c9abefd-2871-42e6-b857-6a450f5b833a@suse.com>
Date: Tue, 20 Feb 2024 09:56:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v4 7/8] x86/APIC: drop regs parameter from direct vector
 handler functions
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <e5f62a45-5b68-404d-908e-909f84f87b44@suse.com>
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
In-Reply-To: <e5f62a45-5b68-404d-908e-909f84f87b44@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

The only place it was needed is in the spurious handler, and there we
can use get_irq_regs() instead.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>

--- a/xen/arch/x86/apic.c
+++ b/xen/arch/x86/apic.c
@@ -1322,7 +1322,7 @@ int reprogram_timer(s_time_t timeout)
     return apic_tmict || !timeout;
 }
 
-static void cf_check apic_timer_interrupt(struct cpu_user_regs *regs)
+static void cf_check apic_timer_interrupt(void)
 {
     ack_APIC_irq();
     perfc_incr(apic_timer);
@@ -1341,7 +1341,7 @@ void smp_send_state_dump(unsigned int cp
 /*
  * Spurious interrupts should _never_ happen with our APIC/SMP architecture.
  */
-static void cf_check spurious_interrupt(struct cpu_user_regs *regs)
+static void cf_check spurious_interrupt(void)
 {
     /*
      * Check if this is a vectored interrupt (most likely, as this is probably
@@ -1355,7 +1355,7 @@ static void cf_check spurious_interrupt(
         is_spurious = !nmi_check_continuation();
         if (this_cpu(state_dump_pending)) {
             this_cpu(state_dump_pending) = false;
-            dump_execstate(regs);
+            dump_execstate(get_irq_regs());
             is_spurious = false;
         }
 
@@ -1372,7 +1372,7 @@ static void cf_check spurious_interrupt(
  * This interrupt should never happen with our APIC/SMP architecture
  */
 
-static void cf_check error_interrupt(struct cpu_user_regs *regs)
+static void cf_check error_interrupt(void)
 {
     static const char *const esr_fields[] = {
         ", Send CS error",
@@ -1407,7 +1407,7 @@ static void cf_check error_interrupt(str
  * This interrupt handles performance counters interrupt
  */
 
-static void cf_check pmu_interrupt(struct cpu_user_regs *regs)
+static void cf_check pmu_interrupt(void)
 {
     ack_APIC_irq();
     vpmu_do_interrupt();
--- a/xen/arch/x86/cpu/mcheck/mce_intel.c
+++ b/xen/arch/x86/cpu/mcheck/mce_intel.c
@@ -58,7 +58,7 @@ bool __read_mostly lmce_support;
 #define MCE_RING                0x1
 static DEFINE_PER_CPU(int, last_state);
 
-static void cf_check intel_thermal_interrupt(struct cpu_user_regs *regs)
+static void cf_check intel_thermal_interrupt(void)
 {
     uint64_t msr_content;
     unsigned int cpu = smp_processor_id();
@@ -642,7 +642,7 @@ static void cpu_mcheck_disable(void)
         clear_cmci();
 }
 
-static void cf_check cmci_interrupt(struct cpu_user_regs *regs)
+static void cf_check cmci_interrupt(void)
 {
     mctelem_cookie_t mctc;
     struct mca_summary bs;
--- a/xen/arch/x86/guest/xen/xen.c
+++ b/xen/arch/x86/guest/xen/xen.c
@@ -158,7 +158,7 @@ static void __init init_memmap(void)
     }
 }
 
-static void cf_check xen_evtchn_upcall(struct cpu_user_regs *regs)
+static void cf_check xen_evtchn_upcall(void)
 {
     struct vcpu_info *vcpu_info = this_cpu(vcpu_info);
     unsigned long pending;
--- a/xen/arch/x86/hvm/vmx/vmx.c
+++ b/xen/arch/x86/hvm/vmx/vmx.c
@@ -2782,7 +2782,7 @@ static struct hvm_function_table __initd
 };
 
 /* Handle VT-d posted-interrupt when VCPU is blocked. */
-static void cf_check pi_wakeup_interrupt(struct cpu_user_regs *regs)
+static void cf_check pi_wakeup_interrupt(void)
 {
     struct vmx_vcpu *vmx, *tmp;
     spinlock_t *lock = &per_cpu(vmx_pi_blocking, smp_processor_id()).lock;
@@ -2814,7 +2814,7 @@ static void cf_check pi_wakeup_interrupt
 }
 
 /* Handle VT-d posted-interrupt when VCPU is running. */
-static void cf_check pi_notification_interrupt(struct cpu_user_regs *regs)
+static void cf_check pi_notification_interrupt(void)
 {
     ack_APIC_irq();
     this_cpu(irq_count)++;
--- a/xen/arch/x86/include/asm/irq.h
+++ b/xen/arch/x86/include/asm/irq.h
@@ -72,17 +72,15 @@ extern int opt_irq_vector_map;
 
 #define platform_legacy_irq(irq)	((irq) < 16)
 
-void cf_check event_check_interrupt(struct cpu_user_regs *regs);
-void cf_check invalidate_interrupt(struct cpu_user_regs *regs);
-void cf_check call_function_interrupt(struct cpu_user_regs *regs);
-void cf_check irq_move_cleanup_interrupt(struct cpu_user_regs *regs);
+void cf_check event_check_interrupt(void);
+void cf_check invalidate_interrupt(void);
+void cf_check call_function_interrupt(void);
+void cf_check irq_move_cleanup_interrupt(void);
 
 uint8_t alloc_hipriority_vector(void);
 
-void set_direct_apic_vector(
-    uint8_t vector, void (*handler)(struct cpu_user_regs *regs));
-void alloc_direct_apic_vector(
-    uint8_t *vector, void (*handler)(struct cpu_user_regs *regs));
+void set_direct_apic_vector(uint8_t vector, void (*handler)(void));
+void alloc_direct_apic_vector(uint8_t *vector, void (*handler)(void));
 
 void do_IRQ(struct cpu_user_regs *regs);
 
--- a/xen/arch/x86/irq.c
+++ b/xen/arch/x86/irq.c
@@ -743,7 +743,7 @@ void move_native_irq(struct irq_desc *de
     desc->handler->enable(desc);
 }
 
-void cf_check irq_move_cleanup_interrupt(struct cpu_user_regs *regs)
+void cf_check irq_move_cleanup_interrupt(void)
 {
     unsigned vector, me;
 
@@ -913,16 +913,14 @@ uint8_t alloc_hipriority_vector(void)
     return next++;
 }
 
-static void (*direct_apic_vector[X86_NR_VECTORS])(struct cpu_user_regs *regs);
-void set_direct_apic_vector(
-    uint8_t vector, void (*handler)(struct cpu_user_regs *regs))
+static void (*direct_apic_vector[X86_NR_VECTORS])(void);
+void set_direct_apic_vector(uint8_t vector, void (*handler)(void))
 {
     BUG_ON(direct_apic_vector[vector] != NULL);
     direct_apic_vector[vector] = handler;
 }
 
-void alloc_direct_apic_vector(
-    uint8_t *vector, void (*handler)(struct cpu_user_regs *regs))
+void alloc_direct_apic_vector(uint8_t *vector, void (*handler)(void))
 {
     static DEFINE_SPINLOCK(lock);
 
@@ -1907,7 +1905,7 @@ void do_IRQ(struct cpu_user_regs *regs)
     if ( irq < 0 )
     {
         if ( direct_apic_vector[vector] )
-            direct_apic_vector[vector](regs);
+            direct_apic_vector[vector]();
         else
         {
             const char *kind = ", LAPIC";
--- a/xen/arch/x86/smp.c
+++ b/xen/arch/x86/smp.c
@@ -245,7 +245,7 @@ static cpumask_t flush_cpumask;
 static const void *flush_va;
 static unsigned int flush_flags;
 
-void cf_check invalidate_interrupt(struct cpu_user_regs *regs)
+void cf_check invalidate_interrupt(void)
 {
     unsigned int flags = flush_flags;
     ack_APIC_irq();
@@ -387,14 +387,14 @@ void smp_send_nmi_allbutself(void)
     send_IPI_mask(&cpu_online_map, APIC_DM_NMI);
 }
 
-void cf_check event_check_interrupt(struct cpu_user_regs *regs)
+void cf_check event_check_interrupt(void)
 {
     ack_APIC_irq();
     perfc_incr(ipis);
     this_cpu(irq_count)++;
 }
 
-void cf_check call_function_interrupt(struct cpu_user_regs *regs)
+void cf_check call_function_interrupt(void)
 {
     ack_APIC_irq();
     perfc_incr(ipis);


