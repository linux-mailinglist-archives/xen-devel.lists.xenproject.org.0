Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B80B185B635
	for <lists+xen-devel@lfdr.de>; Tue, 20 Feb 2024 09:57:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.683310.1062780 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rcLwJ-0006eX-Cw; Tue, 20 Feb 2024 08:57:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 683310.1062780; Tue, 20 Feb 2024 08:57:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rcLwJ-0006cC-9M; Tue, 20 Feb 2024 08:57:23 +0000
Received: by outflank-mailman (input) for mailman id 683310;
 Tue, 20 Feb 2024 08:57:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=YSgb=J5=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rcLwI-0006c0-Hh
 for xen-devel@lists.xenproject.org; Tue, 20 Feb 2024 08:57:22 +0000
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [2a00:1450:4864:20::434])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0e1759d4-cfce-11ee-98f5-efadbce2ee36;
 Tue, 20 Feb 2024 09:57:20 +0100 (CET)
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-33aeb088324so2737124f8f.2
 for <xen-devel@lists.xenproject.org>; Tue, 20 Feb 2024 00:57:20 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 w14-20020adfcd0e000000b0033d14c96ec1sm12607957wrm.45.2024.02.20.00.57.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 20 Feb 2024 00:57:19 -0800 (PST)
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
X-Inumbo-ID: 0e1759d4-cfce-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1708419440; x=1709024240; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:references:cc:to
         :from:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=jWqlogxB928KUsvmRqerAeKEQfMENuclb4BguYyVDTk=;
        b=SF4ohpnW9D7Fm8wjP4cqrFRtqujcxVdbqmbJMquRcWyW5AWDFuV7UQuDdLITV/X3gM
         WaKTpjZqkZTbK0VqmXIniVFYzTk0Gto5X5pPk21WaDEH3fUdlIU2U2J3xqDYwL1WQRLS
         8xts3rTU4P4pszUvofiFJGnwrIArfiDD0SRQ5+Uq/YF42I7d225xM0hya+CyA+c41ciu
         01vLMEvCVIcZFEe0Tp8FH90xeg9JbOaiXx3wdd/ddbV81sen35miUNfhgN4C69ytGN1w
         921LKuQPrPo801kxHxMhETLeZ/pKDQiJ40Q/JAuDE2jOM0oZu/SpyOckVZ/YgEtiA3kd
         0zKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708419440; x=1709024240;
        h=content-transfer-encoding:in-reply-to:autocrypt:references:cc:to
         :from:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jWqlogxB928KUsvmRqerAeKEQfMENuclb4BguYyVDTk=;
        b=uBavmlinFU38OUmEH3VxxHOTG9mVMwPWhTRTCh/IKD9zmWuVcIOGXARl2o8evvvMRu
         SSzx7zq14qvhtbiUneIoy1oZX+YFvKLqF06RzVeAe+eyh0HdvXo8hgBLYl+co75xDG1j
         6oT9HJWhWb/REW73fz5gmLTN7hnsLTJGQ0Hpv0w8mUoWSce048gXXOMtPs1koTWMzCNy
         lzHKgJDl3C8O0jCY/pWhFAdQRvqYCmATCOur089p9ejbMywAzHEASgghu8l3bT7EPRpm
         Yr13KnLbwenYk5hN8eBHTnmfAA4aLvI815clDEqlKXQdLSDs5ieP3Jtq6JTWj9C700Hc
         B9Wg==
X-Gm-Message-State: AOJu0Yw07t83kOI6Pl7MNLrb4uDTVgcuNh1cIkkrH4q72GrBmQPGTjpk
	3umwezMEe3wpFlWzGzcewFMoSnLjsL+0zAiRpWmc3Zow6iVRTcTVKytUyL7CHqoGTPygpq/8lgI
	=
X-Google-Smtp-Source: AGHT+IGimlpP3q+zJai3qTgVg7wBX5QVYnZUsKu23U7JIy9kYANwGKOm8T5rfmhwGcF89Jp2y2Ei3A==
X-Received: by 2002:a5d:47ac:0:b0:33d:38cf:aa73 with SMTP id 12-20020a5d47ac000000b0033d38cfaa73mr5898159wrb.47.1708419439684;
        Tue, 20 Feb 2024 00:57:19 -0800 (PST)
Message-ID: <aab24f1f-ed29-4098-b430-152c16965e90@suse.com>
Date: Tue, 20 Feb 2024 09:57:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v4 8/8] consolidate do_bug_frame() / bug_fn_t
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Michal Orzel <michal.orzel@amd.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Volodymyr Babchuk <volodymyr_babchuk@epam.com>
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

The type not being used in do_bug_frame() is suspicious. Apparently
that's solely because the type uses a pointer-to-const parameter,
when so far run_in_exception_handler() wanted functions taking pointer-
to-non-const. Expand use of const, in turn requiring common code's
do_bug_frame() as well as [gs]et_irq_regs() to also gain const. This
then brings the former function also closer to the common one, with
Arm's use of vaddr_t remaining as a difference.

While there also replace the bogus use of hard tabs in [gs]et_irq_regs()
(I clearly didn't mean to put it in like this).

Signed-off-by: Jan Beulich <jbeulich@suse.com>
Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>
Acked-by: Julien Grall <jgrall@amazon.com>
---
This is an alternative proposal to
https://lists.xen.org/archives/html/xen-devel/2023-12/msg01385.html.
---
v4: Re-base over changes earlier in the series (drop xhci-dbc.c change).
v3: Retain / extend use of const. Make part of series.
v2: [skipped]

--- a/xen/arch/arm/irq.c
+++ b/xen/arch/arm/irq.c
@@ -220,7 +220,7 @@ void do_IRQ(struct cpu_user_regs *regs,
 {
     struct irq_desc *desc = irq_to_desc(irq);
     struct irqaction *action;
-    struct cpu_user_regs *old_regs = set_irq_regs(regs);
+    const struct cpu_user_regs *old_regs = set_irq_regs(regs);
 
     perfc_incr(irqs);
 
--- a/xen/arch/x86/include/asm/processor.h
+++ b/xen/arch/x86/include/asm/processor.h
@@ -409,8 +409,7 @@ static always_inline void rep_nop(void)
 void show_code(const struct cpu_user_regs *regs);
 void show_stack_overflow(unsigned int cpu, const struct cpu_user_regs *regs);
 void show_registers(const struct cpu_user_regs *regs);
-#define dump_execution_state() \
-    run_in_exception_handler(show_execution_state_nonconst)
+#define dump_execution_state() run_in_exception_handler(show_execution_state)
 void show_page_walk(unsigned long addr);
 void noreturn fatal_trap(const struct cpu_user_regs *regs, bool show_remote);
 
--- a/xen/arch/x86/irq.c
+++ b/xen/arch/x86/irq.c
@@ -1896,7 +1896,7 @@ void do_IRQ(struct cpu_user_regs *regs)
     struct irq_desc  *desc;
     unsigned int      vector = (uint8_t)regs->entry_vector;
     int               irq = this_cpu(vector_irq)[vector];
-    struct cpu_user_regs *old_regs = set_irq_regs(regs);
+    const struct cpu_user_regs *old_regs = set_irq_regs(regs);
 
     perfc_incr(irqs);
     this_cpu(irq_count)++;
--- a/xen/arch/x86/traps.c
+++ b/xen/arch/x86/traps.c
@@ -643,7 +643,7 @@ void show_stack_overflow(unsigned int cp
     printk("\n");
 }
 
-void show_execution_state(const struct cpu_user_regs *regs)
+void cf_check show_execution_state(const struct cpu_user_regs *regs)
 {
     /* Prevent interleaving of output. */
     unsigned long flags = console_lock_recursive_irqsave();
@@ -655,11 +655,6 @@ void show_execution_state(const struct c
     console_unlock_recursive_irqrestore(flags);
 }
 
-void cf_check show_execution_state_nonconst(struct cpu_user_regs *regs)
-{
-    show_execution_state(regs);
-}
-
 void vcpu_show_execution_state(struct vcpu *v)
 {
     unsigned long flags = 0;
--- a/xen/common/bug.c
+++ b/xen/common/bug.c
@@ -10,7 +10,7 @@
  * Returns a negative value in case of an error otherwise
  * BUGFRAME_{run_fn, warn, bug, assert}
  */
-int do_bug_frame(struct cpu_user_regs *regs, unsigned long pc)
+int do_bug_frame(const struct cpu_user_regs *regs, unsigned long pc)
 {
     const struct bug_frame *bug = NULL;
     const struct virtual_region *region;
@@ -44,14 +44,10 @@ int do_bug_frame(struct cpu_user_regs *r
 
     if ( id == BUGFRAME_run_fn )
     {
-        void (*fn)(struct cpu_user_regs *) = bug_ptr(bug);
+        bug_fn_t *fn = bug_ptr(bug);
 
         fn(regs);
 
-        /* Re-enforce consistent types, because of the casts involved. */
-        if ( false )
-            run_in_exception_handler(fn);
-
         return id;
     }
 
--- a/xen/common/irq.c
+++ b/xen/common/irq.c
@@ -1,7 +1,7 @@
 #include <xen/irq.h>
 #include <xen/errno.h>
 
-DEFINE_PER_CPU(struct cpu_user_regs *, irq_regs);
+DEFINE_PER_CPU(const struct cpu_user_regs *, irq_regs);
 
 int init_one_irq_desc(struct irq_desc *desc)
 {
--- a/xen/common/keyhandler.c
+++ b/xen/common/keyhandler.c
@@ -135,7 +135,7 @@ static void cf_check show_handlers(unsig
 
 static cpumask_t dump_execstate_mask;
 
-void cf_check dump_execstate(struct cpu_user_regs *regs)
+void cf_check dump_execstate(const struct cpu_user_regs *regs)
 {
     unsigned int cpu = smp_processor_id();
 
--- a/xen/drivers/char/ehci-dbgp.c
+++ b/xen/drivers/char/ehci-dbgp.c
@@ -1246,14 +1246,14 @@ static int cf_check ehci_dbgp_getc(struc
 /* Safe: ehci_dbgp_poll() runs as timer handler, so not reentrant. */
 static struct serial_port *poll_port;
 
-static void cf_check _ehci_dbgp_poll(struct cpu_user_regs *regs)
+static void cf_check _ehci_dbgp_poll(const struct cpu_user_regs *regs)
 {
     struct serial_port *port = poll_port;
     struct ehci_dbgp *dbgp = port->uart;
     unsigned long flags;
     unsigned int timeout = MICROSECS(DBGP_CHECK_INTERVAL);
     bool empty = false;
-    struct cpu_user_regs *old_regs;
+    const struct cpu_user_regs *old_regs;
 
     if ( !dbgp->ehci_debug )
         return;
--- a/xen/drivers/char/ns16550.c
+++ b/xen/drivers/char/ns16550.c
@@ -206,11 +206,11 @@ static void cf_check ns16550_interrupt(i
 /* Safe: ns16550_poll() runs as softirq so not reentrant on a given CPU. */
 static DEFINE_PER_CPU(struct serial_port *, poll_port);
 
-static void cf_check __ns16550_poll(struct cpu_user_regs *regs)
+static void cf_check __ns16550_poll(const struct cpu_user_regs *regs)
 {
     struct serial_port *port = this_cpu(poll_port);
     struct ns16550 *uart = port->uart;
-    struct cpu_user_regs *old_regs;
+    const struct cpu_user_regs *old_regs;
 
     if ( uart->intr_works )
         return; /* Interrupts work - no more polling */
--- a/xen/include/xen/bug.h
+++ b/xen/include/xen/bug.h
@@ -101,8 +101,7 @@ typedef void bug_fn_t(const struct cpu_u
 
 #ifndef run_in_exception_handler
 
-static void always_inline run_in_exception_handler(
-    void (*fn)(struct cpu_user_regs *regs))
+static void always_inline run_in_exception_handler(bug_fn_t *fn)
 {
     BUG_FRAME(BUGFRAME_run_fn, 0, fn, 0, NULL);
 }
@@ -133,7 +132,7 @@ static void always_inline run_in_excepti
  * Returns a negative value in case of an error otherwise
  * BUGFRAME_{run_fn, warn, bug, assert}
  */
-int do_bug_frame(struct cpu_user_regs *regs, unsigned long pc);
+int do_bug_frame(const struct cpu_user_regs *regs, unsigned long pc);
 
 #endif /* CONFIG_GENERIC_BUG_FRAME */
 
--- a/xen/include/xen/irq.h
+++ b/xen/include/xen/irq.h
@@ -134,21 +134,22 @@ void cf_check irq_actor_none(struct irq_
  * Per-cpu interrupted context register state - the inner-most interrupt frame
  * on the stack.
  */
-DECLARE_PER_CPU(struct cpu_user_regs *, irq_regs);
+DECLARE_PER_CPU(const struct cpu_user_regs *, irq_regs);
 
-static inline struct cpu_user_regs *get_irq_regs(void)
+static inline const struct cpu_user_regs *get_irq_regs(void)
 {
-	return this_cpu(irq_regs);
+    return this_cpu(irq_regs);
 }
 
-static inline struct cpu_user_regs *set_irq_regs(struct cpu_user_regs *new_regs)
+static inline const struct cpu_user_regs *set_irq_regs(
+    const struct cpu_user_regs *new_regs)
 {
-	struct cpu_user_regs *old_regs, **pp_regs = &this_cpu(irq_regs);
+    const struct cpu_user_regs *old_regs, **pp_regs = &this_cpu(irq_regs);
 
-	old_regs = *pp_regs;
-	*pp_regs = new_regs;
+    old_regs = *pp_regs;
+    *pp_regs = new_regs;
 
-	return old_regs;
+    return old_regs;
 }
 
 struct domain;
--- a/xen/include/xen/kernel.h
+++ b/xen/include/xen/kernel.h
@@ -110,8 +110,7 @@ extern const unsigned int xen_config_dat
 struct cpu_user_regs;
 struct vcpu;
 
-void show_execution_state(const struct cpu_user_regs *regs);
-void cf_check show_execution_state_nonconst(struct cpu_user_regs *regs);
+void cf_check show_execution_state(const struct cpu_user_regs *regs);
 void vcpu_show_execution_state(struct vcpu *v);
 
 #endif /* _LINUX_KERNEL_H */
--- a/xen/include/xen/lib.h
+++ b/xen/include/xen/lib.h
@@ -173,7 +173,7 @@ extern char *print_tainted(char *str);
 extern void add_taint(unsigned int taint);
 
 struct cpu_user_regs;
-void cf_check dump_execstate(struct cpu_user_regs *regs);
+void cf_check dump_execstate(const struct cpu_user_regs *regs);
 
 void init_constructors(void);
 


