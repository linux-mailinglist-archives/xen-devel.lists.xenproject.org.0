Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 56CBF82A872
	for <lists+xen-devel@lfdr.de>; Thu, 11 Jan 2024 08:37:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.665968.1036335 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rNpcV-0002ES-1g; Thu, 11 Jan 2024 07:36:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 665968.1036335; Thu, 11 Jan 2024 07:36:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rNpcU-0002BZ-V2; Thu, 11 Jan 2024 07:36:54 +0000
Received: by outflank-mailman (input) for mailman id 665968;
 Thu, 11 Jan 2024 07:36:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=YFj+=IV=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rNpcT-000203-Df
 for xen-devel@lists.xenproject.org; Thu, 11 Jan 2024 07:36:53 +0000
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [2a00:1450:4864:20::32d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2f7f94bc-b054-11ee-9b0f-b553b5be7939;
 Thu, 11 Jan 2024 08:36:51 +0100 (CET)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-40e5bfa260bso6194715e9.3
 for <xen-devel@lists.xenproject.org>; Wed, 10 Jan 2024 23:36:51 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d6-20020a056000114600b003366a9cb0d1sm444087wrx.92.2024.01.10.23.36.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 10 Jan 2024 23:36:51 -0800 (PST)
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
X-Inumbo-ID: 2f7f94bc-b054-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1704958611; x=1705563411; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:references:cc:to
         :from:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=GfRv3gongelxjdY816blQolB01Qj493E2xtw5+iJNEY=;
        b=ZZURtIiCjV5cM4DLpCWgATUShi9sa+8B0p199ITGP4lDFvamkDetwn2o/8Y/z4KB5b
         WQglwyX6smtoAtbrhV/L7R3wpdk5mZwoaS25SEAtw6OPQZwJ4/8QoEqIRvZG700RXpls
         mno1bql8Zekf1H5bPg5lluViLIY4hktp23U57/9BpKsEa9bhJNKrDImeJyT41tzycUeN
         z3TUaNLMxmpqGXcXAPkuXhTrp+Bgf4YI/rDJZXQXhxAS/PFfFwP/iapyFEkvKDF2WFSR
         OCwVC9d8hn2mcsKEZtxsgIJVGpwMFAyNB+ny/YgjSTLFjBgCTDsUxbx3sswJ/mjQEEal
         DjHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704958611; x=1705563411;
        h=content-transfer-encoding:in-reply-to:autocrypt:references:cc:to
         :from:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GfRv3gongelxjdY816blQolB01Qj493E2xtw5+iJNEY=;
        b=MhGBp0Is1iegFQ/Q/7Z2BkdI0B9PlHBbN9zT+2ByIclhrOg3UePOzt30iSBiNWjRtj
         jb4CxxhJYvzjbX6tn3jJAGkDexrlMv4dDIIxfcHjAgt1Ffm4vt6ni35bXtq2i1mBJKYG
         QoGqY/YA7ssSjO8271W5MMfZkz8BRZd8C8lX3mzS1tfJaYcExTy1XToer3u5dcLtLxuB
         vmL4uSfG9E31odJIf2TDIRJS4oeBI9Juwi2qn/ilE/KclFHolJnXvxmgRMn7LiClbk06
         CfGLQjrXS3TaSpu39X2vnMklYBprMHjN60f5ut7n4CoXjM+Ru7DPZKwenluR8C5yoYSP
         OdVA==
X-Gm-Message-State: AOJu0YyJumr+hqB5XPFwqhbwSY69y+U/Q13hlJEshLIMZDYdDbl2ZRwU
	eN/diDYkndyHTqTW+77LueLT8GzUJUFjmQFImQzJnbADmQ==
X-Google-Smtp-Source: AGHT+IG3tnoyxIZ9O3Bq7VsN87C/tYpYyQ1jZygtip84+LEZW3cYmflTHGa0hbvjQW32umKq7BSsLg==
X-Received: by 2002:a7b:c44d:0:b0:40d:9534:d214 with SMTP id l13-20020a7bc44d000000b0040d9534d214mr66929wmi.223.1704958611319;
        Wed, 10 Jan 2024 23:36:51 -0800 (PST)
Message-ID: <0afca177-4dce-4d73-8790-82256a620ec3@suse.com>
Date: Thu, 11 Jan 2024 08:36:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH 8/8] x86/APIC: drop regs parameter from direct vector handler
 functions
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Kevin Tian <kevin.tian@intel.com>, Jun Nakajima <jun.nakajima@intel.com>
References: <1ab231ec-5e3c-4662-8530-2213bc52bb7c@suse.com>
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
In-Reply-To: <1ab231ec-5e3c-4662-8530-2213bc52bb7c@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

The only place it was needed is in the spurious handler, and there we
can use get_irq_regs() instead.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/apic.c
+++ b/xen/arch/x86/apic.c
@@ -1324,7 +1324,7 @@ int reprogram_timer(s_time_t timeout)
     return apic_tmict || !timeout;
 }
 
-static void cf_check apic_timer_interrupt(struct cpu_user_regs *regs)
+static void cf_check apic_timer_interrupt(void)
 {
     ack_APIC_irq();
     perfc_incr(apic_timer);
@@ -1343,7 +1343,7 @@ void smp_send_state_dump(unsigned int cp
 /*
  * Spurious interrupts should _never_ happen with our APIC/SMP architecture.
  */
-static void cf_check spurious_interrupt(struct cpu_user_regs *regs)
+static void cf_check spurious_interrupt(void)
 {
     /*
      * Check if this is a vectored interrupt (most likely, as this is probably
@@ -1357,7 +1357,7 @@ static void cf_check spurious_interrupt(
         is_spurious = !nmi_check_continuation();
         if (this_cpu(state_dump_pending)) {
             this_cpu(state_dump_pending) = false;
-            dump_execstate(regs);
+            dump_execstate(get_irq_regs());
             is_spurious = false;
         }
 
@@ -1374,7 +1374,7 @@ static void cf_check spurious_interrupt(
  * This interrupt should never happen with our APIC/SMP architecture
  */
 
-static void cf_check error_interrupt(struct cpu_user_regs *regs)
+static void cf_check error_interrupt(void)
 {
     static const char *const esr_fields[] = {
         ", Send CS error",
@@ -1409,7 +1409,7 @@ static void cf_check error_interrupt(str
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
@@ -2773,7 +2773,7 @@ static struct hvm_function_table __initd
 };
 
 /* Handle VT-d posted-interrupt when VCPU is blocked. */
-static void cf_check pi_wakeup_interrupt(struct cpu_user_regs *regs)
+static void cf_check pi_wakeup_interrupt(void)
 {
     struct vmx_vcpu *vmx, *tmp;
     spinlock_t *lock = &per_cpu(vmx_pi_blocking, smp_processor_id()).lock;
@@ -2805,7 +2805,7 @@ static void cf_check pi_wakeup_interrupt
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


