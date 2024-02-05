Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 500B4849BD2
	for <lists+xen-devel@lfdr.de>; Mon,  5 Feb 2024 14:32:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.676060.1051857 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rWz4g-0006VQ-BP; Mon, 05 Feb 2024 13:31:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 676060.1051857; Mon, 05 Feb 2024 13:31:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rWz4g-0006SV-7l; Mon, 05 Feb 2024 13:31:50 +0000
Received: by outflank-mailman (input) for mailman id 676060;
 Mon, 05 Feb 2024 13:31:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=8/S5=JO=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rWz4e-0004HJ-O2
 for xen-devel@lists.xenproject.org; Mon, 05 Feb 2024 13:31:48 +0000
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [2a00:1450:4864:20::132])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e984baf9-c42a-11ee-8a45-1f161083a0e0;
 Mon, 05 Feb 2024 14:31:48 +0100 (CET)
Received: by mail-lf1-x132.google.com with SMTP id
 2adb3069b0e04-5100cb238bcso7942285e87.3
 for <xen-devel@lists.xenproject.org>; Mon, 05 Feb 2024 05:31:48 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 n10-20020a5d67ca000000b0033b3cf1ff09sm2278382wrw.29.2024.02.05.05.31.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 05 Feb 2024 05:31:47 -0800 (PST)
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
X-Inumbo-ID: e984baf9-c42a-11ee-8a45-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1707139907; x=1707744707; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:references:cc:to
         :from:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=gEqRJt64VcumCTtnR8WkrhpV/gUr3OF3qVsMsouyC7A=;
        b=VawSKcJgQXK21l1YXTA5hk0LH8xnlRqfvMRRoNjFPkc37gYrkRUACWLaweYpNhSh16
         DctfDcsLwpu4360lWSYwwSLgjxXxYoMMJbvMK6Aydx1GeavKjBjota3gGeRbRMurDFTa
         Kv7kUcK6m4lfiP0TDx3nRusxd9RmvII1sKf/135+EJAnhcN1i8fldSakpPpXPsXQ4aQm
         MTtl0AwPfh1XQzHXyJK50KDXLW12y6wuLIa4cUZqiG7D/GPq1jvOEYiu1Z9H3430RL0F
         9V1TMvD9AJf6sh3GAO+EGhkfsyNnyCOX/cwlnG7hqwkypPSgNFTvfFwfweV2QgwItlR/
         6/pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707139907; x=1707744707;
        h=content-transfer-encoding:in-reply-to:autocrypt:references:cc:to
         :from:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gEqRJt64VcumCTtnR8WkrhpV/gUr3OF3qVsMsouyC7A=;
        b=otNwWGLSvS+lmX9dB4UFbS6B+Xcyg67x82K2yrtTszyNj7T9KDmWnKi9eGPpntUoQA
         RrsG9HpWO7Px4Yj/E0JTjI1WYJeVWoThpHGLzDa67o/kd7mHzQeNQ85KHk8A+Lw+z0Nk
         YqzAAL0gdQ/Xio+caSvz83ZajfHOb391+/9Y5bijw2Glrzhyopj2Xye4A6VdWEEya36L
         m3T39kLz7yJmWoeiIHD6WJmXt1yuANcloUSHUZSu4DiPAQ87GJ6wxWLWbG1IWi2A/Gl5
         vrjLy/8TslSxXA1WzrStLHpltEZG5KmzXTEDo8+mqeSgorOYcLMKx99NjBHO51/2UIbe
         T2uA==
X-Gm-Message-State: AOJu0YyJl1Gjn2kKTza8fTyOrHxFU6lHBlXUp9nfXVpWfwiJoREMD4Jc
	Urm94eB1AGRvmGV8ySAAvpCwbsQnZ/AdhyyY1x81Rt6/cE9bRKR3G+i1wDAq1DKr2KXjmuvsIQM
	=
X-Google-Smtp-Source: AGHT+IFrFVP3TfIbgIMT87bMnfEeRRPkJ7aKkrdXuEKYf5lnr2tL3R7tzhfm5/tp2tedPXGNUgc8ag==
X-Received: by 2002:a05:6512:1289:b0:511:5385:595d with SMTP id u9-20020a056512128900b005115385595dmr1473621lfs.41.1707139907575;
        Mon, 05 Feb 2024 05:31:47 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCWdxlNgwzzOZXU8TNg2tyMXtWd0Pidw4BilmsICRarkIGrec4jvn4gCavIxalaAY7DXQkQqhAIJtNvRpnlcahl7akcDyRxq1caEIGnk1CbKimOnm4IHCvN0jzO/oobMf26WvepPfI6hCPQC5GgK6GUcZXVV2YEttFh24XHg+CzZrcjbWrmMZCNhqBjk0kpn12ocIPpGg39JNw==
Message-ID: <a815fcd8-1790-40c9-9fed-d5986f20d2a1@suse.com>
Date: Mon, 5 Feb 2024 14:31:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v3 7/8] x86/APIC: drop regs parameter from direct vector
 handler functions
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Kevin Tian <kevin.tian@intel.com>, Jun Nakajima <jun.nakajima@intel.com>
References: <ebc330a9-eafa-4858-b5cf-5694c4da911d@suse.com>
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
In-Reply-To: <ebc330a9-eafa-4858-b5cf-5694c4da911d@suse.com>
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
@@ -2776,7 +2776,7 @@ static struct hvm_function_table __initd
 };
 
 /* Handle VT-d posted-interrupt when VCPU is blocked. */
-static void cf_check pi_wakeup_interrupt(struct cpu_user_regs *regs)
+static void cf_check pi_wakeup_interrupt(void)
 {
     struct vmx_vcpu *vmx, *tmp;
     spinlock_t *lock = &per_cpu(vmx_pi_blocking, smp_processor_id()).lock;
@@ -2808,7 +2808,7 @@ static void cf_check pi_wakeup_interrupt
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


