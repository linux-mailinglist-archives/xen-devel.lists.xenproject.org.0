Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 84690A05F1D
	for <lists+xen-devel@lfdr.de>; Wed,  8 Jan 2025 15:43:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.867406.1278940 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tVXHI-00077E-CA; Wed, 08 Jan 2025 14:43:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 867406.1278940; Wed, 08 Jan 2025 14:43:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tVXHI-00074m-9D; Wed, 08 Jan 2025 14:43:24 +0000
Received: by outflank-mailman (input) for mailman id 867406;
 Wed, 08 Jan 2025 14:43:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2h7L=UA=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1tVX57-0005q4-CO
 for xen-devel@lists.xenproject.org; Wed, 08 Jan 2025 14:30:49 +0000
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [2a00:1450:4864:20::531])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 25e61f95-cdcd-11ef-99a4-01e77a169b0f;
 Wed, 08 Jan 2025 15:30:46 +0100 (CET)
Received: by mail-ed1-x531.google.com with SMTP id
 4fb4d7f45d1cf-5d3f57582a2so1798773a12.1
 for <xen-devel@lists.xenproject.org>; Wed, 08 Jan 2025 06:30:46 -0800 (PST)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aac0e8953c1sm2481149366b.49.2025.01.08.06.30.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Jan 2025 06:30:44 -0800 (PST)
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
X-Inumbo-ID: 25e61f95-cdcd-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1736346645; x=1736951445; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5Dahf1Hb4Q67tI5YmT94pkmM93oygaKDXzYWEQbTe0s=;
        b=g+tYZTqen8oeW5OOEBIz3+GqmNxTfiUFlct9kOvMBIbUQoZHAQg/T1TC3Ofz7ftVJI
         mtLPks4LcQWGxOWNyUk20q+cCJ6j+gtCNrSLKW3OnMxDHZJWj5ww+6GisZ6mashPLhKg
         yrky0UPi/KTRO9SfLrGisPv1HULCTC6LBdGdQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736346645; x=1736951445;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5Dahf1Hb4Q67tI5YmT94pkmM93oygaKDXzYWEQbTe0s=;
        b=B2vMb8lpSmE2VVjAl/VpS8JdV55VSbVEdSAeB0hrWdIVvj2kbSPhZ0QTWCtnYTSGGp
         9rYeRPDXzQZEk8ubF1Ziu3D8e3n/Uy1rC73IW3Jltqt83I1i2/p2kUvD84GeHKaN49IW
         8dBWOddOx9ow2ihJHWh6H26dt78ETpqfwEoO72n4Jy3YuXu4hNslYYY/IU4B64hLDHrN
         /qYAsMWYOURUAEyDlum87wj4KB8kRKuIRujHqItvQWKxF5X1CwcxIOxbvblCy9Q9ZTb5
         ux5Op3o7SxZQCSq06bdtjZgL5F/qRyclnPEbD38rtrSq5HG+64rf/H/Bvc5zgdRlBrqO
         SNFg==
X-Gm-Message-State: AOJu0YwWB+x/1A+SMjxRfiM9ytXnQSDGXmZWrXKn6dSmYluSNbHQHzGS
	5t/c9umHsJ8Kz+h84NA5347XF6owQLsCIi4krw9Omt6RHd7OLR99Juz8sqzjwRrxdXHgohhmANt
	r
X-Gm-Gg: ASbGncspWT+C6B6YOaX3K+kj3MJ+S455X6ONNZBySkpMKDAEKOnIMTHv98/UWuiyUw9
	lvYyNl6FqoqN51C941Lo+glA/caN5JAoF6IIws7ii+ETYKreF4xlprpsBM9VxY48AT6rknCHML/
	yvrXXcss46JzOq3xj3sr8O6YtcKpvRWj2y80LBQXn4UOpLe8ZmN9UUCNV0WbEguG4dyJ+bmpsqP
	4Dt021RArNog2ND7HY0rSqUxIksyAuXsPrH2czaf2pLi6ijbp1gcNvGeCXbYHkxDB8=
X-Google-Smtp-Source: AGHT+IGP0vEQMmGyG5hs0irconu+soKU5qBQE3llgM2KKNLjJr/T1WL+zjMdi3anWl9Peh/g+hQixQ==
X-Received: by 2002:a17:907:6d1e:b0:aa6:bedc:2e4c with SMTP id a640c23a62f3a-ab28fd1c12amr726461466b.3.1736346645132;
        Wed, 08 Jan 2025 06:30:45 -0800 (PST)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v2 18/18] x86/mm: zero stack on context switch
Date: Wed,  8 Jan 2025 15:26:58 +0100
Message-ID: <20250108142659.99490-19-roger.pau@citrix.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20250108142659.99490-1-roger.pau@citrix.com>
References: <20250108142659.99490-1-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

With the stack mapped on a per-CPU basis there's no risk of other CPUs being
able to read the stack contents, but vCPUs running on the current pCPU could
read stack rubble from operations of previous vCPUs.

The #DF stack is not zeroed because handling of #DF results in a panic.

The contents of the shadow stack are not cleared as part of this change.  It's
arguable that leaking internal Xen return addresses is not guest confidential
data.  At most those could be used by an attacker to figure out the paths
inside of Xen previous execution flows have used.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
Is it required to zero the stack when doing a non-lazy context switch from the
idle vPCU to the previously running vCPU?

d0v0 -> IDLE -> sync_execstate -> zero stack? -> d0v0

This is currently done in this proposal, as when running in the idle vCPU
context (iow: not lazy switched) stacks from remote pCPUs can be mapped or
tasklets executed.
---
Changes since v1:
 - Zero the stack forward to use ERMS.
 - Only zero the IST stacks if they have been used.
 - Only zero the primary stack for full context switches.
---
 docs/misc/xen-command-line.pandoc    |  4 +-
 xen/arch/x86/cpu/mcheck/mce.c        |  4 ++
 xen/arch/x86/domain.c                | 13 ++++++-
 xen/arch/x86/include/asm/current.h   | 53 +++++++++++++++++++++++---
 xen/arch/x86/include/asm/domain.h    |  3 ++
 xen/arch/x86/include/asm/spec_ctrl.h |  1 +
 xen/arch/x86/spec_ctrl.c             | 57 ++++++++++++++++++++++++----
 xen/arch/x86/traps.c                 |  5 +++
 8 files changed, 124 insertions(+), 16 deletions(-)

diff --git a/docs/misc/xen-command-line.pandoc b/docs/misc/xen-command-line.pandoc
index e7828d092098..9cde9e84aff2 100644
--- a/docs/misc/xen-command-line.pandoc
+++ b/docs/misc/xen-command-line.pandoc
@@ -204,7 +204,7 @@ to appropriate auditing by Xen.  Argo is disabled by default.
 
 ### asi (x86)
 > `= List of [ <bool>, {pv,hvm}=<bool>,
-               {vcpu-pt,cpu-stack}=<bool>|{pv,hvm}=<bool> ]`
+               {vcpu-pt,cpu-stack,zero-stack}=<bool>|{pv,hvm}=<bool> ]`
 
 Offers control over whether the hypervisor will engage in Address Space
 Isolation, by not having potentially sensitive information permanently mapped
@@ -224,6 +224,8 @@ meant to be used for debugging purposes only.**
 * `cpu-stack` prevent CPUs from having permanent mappings of stacks different
   than their own.  Depends on the `vcpu-pt` option.
 
+* `zero-stack` zero CPU stacks when context switching vCPUs.
+
 ### asid (x86)
 > `= <boolean>`
 
diff --git a/xen/arch/x86/cpu/mcheck/mce.c b/xen/arch/x86/cpu/mcheck/mce.c
index 9028ccde5477..eaaaefe7f8ba 100644
--- a/xen/arch/x86/cpu/mcheck/mce.c
+++ b/xen/arch/x86/cpu/mcheck/mce.c
@@ -92,10 +92,14 @@ struct mce_callbacks __ro_after_init mce_callbacks = {
 static const typeof(mce_callbacks.handler) __initconst_cf_clobber __used
     default_handler = unexpected_machine_check;
 
+DEFINE_PER_CPU(unsigned int, slice_mce_count);
+
 /* Call the installed machine check handler for this CPU setup. */
 
 void do_machine_check(const struct cpu_user_regs *regs)
 {
+    this_cpu(slice_mce_count)++;
+
     mce_enter();
     alternative_vcall(mce_callbacks.handler, regs);
     mce_exit();
diff --git a/xen/arch/x86/domain.c b/xen/arch/x86/domain.c
index ac6332266e95..1ff9200eb081 100644
--- a/xen/arch/x86/domain.c
+++ b/xen/arch/x86/domain.c
@@ -2106,6 +2106,7 @@ void context_switch(struct vcpu *prev, struct vcpu *next)
     struct cpu_info *info = get_cpu_info();
     const struct domain *prevd = prev->domain, *nextd = next->domain;
     unsigned int dirty_cpu = read_atomic(&next->dirty_cpu);
+    bool lazy = false;
 
     ASSERT(prev != next);
     ASSERT(local_irq_is_enabled());
@@ -2138,6 +2139,7 @@ void context_switch(struct vcpu *prev, struct vcpu *next)
          */
         set_current(next);
         local_irq_enable();
+        lazy = true;
     }
     else
     {
@@ -2212,12 +2214,19 @@ void context_switch(struct vcpu *prev, struct vcpu *next)
     /* Ensure that the vcpu has an up-to-date time base. */
     update_vcpu_system_time(next);
 
-    reset_stack_and_call_ind(nextd->arch.ctxt_switch->tail);
+    /*
+     * Context switches to the idle vCPU (either lazy or full) will never
+     * trigger zeroing of the stack, because the idle domain doesn't have ASI
+     * enabled.  Switching back to the previously running vCPU after a lazy
+     * switch shouldn't zero the stack either.
+     */
+    reset_stack_and_call_ind(nextd->arch.ctxt_switch->tail,
+                             !lazy && nextd->arch.zero_stack);
 }
 
 void continue_running(struct vcpu *same)
 {
-    reset_stack_and_call_ind(same->domain->arch.ctxt_switch->tail);
+    reset_stack_and_call_ind(same->domain->arch.ctxt_switch->tail, false);
 }
 
 int __sync_local_execstate(void)
diff --git a/xen/arch/x86/include/asm/current.h b/xen/arch/x86/include/asm/current.h
index 4a9776f87a7a..9abb4e55aeea 100644
--- a/xen/arch/x86/include/asm/current.h
+++ b/xen/arch/x86/include/asm/current.h
@@ -170,6 +170,12 @@ unsigned long get_stack_dump_bottom (unsigned long sp);
 # define SHADOW_STACK_WORK ""
 #endif
 
+#define ZERO_STACK                                              \
+    "test %[stk_size], %[stk_size];"                            \
+    "jz .L_skip_zeroing.%=;"                                    \
+    "rep stosb;"                                                \
+    ".L_skip_zeroing.%=:"
+
 #if __GNUC__ >= 9
 # define ssaj_has_attr_noreturn(fn) __builtin_has_attribute(fn, __noreturn__)
 #else
@@ -177,13 +183,43 @@ unsigned long get_stack_dump_bottom (unsigned long sp);
 # define ssaj_has_attr_noreturn(fn) true
 #endif
 
-#define switch_stack_and_jump(fn, instr, constr)                        \
+DECLARE_PER_CPU(unsigned int, slice_mce_count);
+DECLARE_PER_CPU(unsigned int, slice_nmi_count);
+DECLARE_PER_CPU(unsigned int, slice_db_count);
+
+#define switch_stack_and_jump(fn, instr, constr, zero_stk)              \
     ({                                                                  \
         unsigned int tmp;                                               \
+                                                                        \
         BUILD_BUG_ON(!ssaj_has_attr_noreturn(fn));                      \
+        ASSERT(IS_ALIGNED((unsigned long)guest_cpu_user_regs() -        \
+                          PRIMARY_STACK_SIZE +                          \
+                          sizeof(struct cpu_info), PAGE_SIZE));         \
+        if ( zero_stk )                                                 \
+        {                                                               \
+            unsigned long stack_top = get_stack_bottom() &              \
+                                      ~(STACK_SIZE - 1);                \
+                                                                        \
+            if ( this_cpu(slice_mce_count) )                            \
+            {                                                           \
+                this_cpu(slice_mce_count) = 0;                          \
+                clear_page((void *)stack_top + IST_MCE * PAGE_SIZE);    \
+            }                                                           \
+            if ( this_cpu(slice_nmi_count) )                            \
+            {                                                           \
+                this_cpu(slice_nmi_count) = 0;                          \
+                clear_page((void *)stack_top + IST_NMI * PAGE_SIZE);    \
+            }                                                           \
+            if ( this_cpu(slice_db_count) )                             \
+            {                                                           \
+                this_cpu(slice_db_count) = 0;                           \
+                clear_page((void *)stack_top + IST_DB  * PAGE_SIZE);    \
+            }                                                           \
+        }                                                               \
         __asm__ __volatile__ (                                          \
             SHADOW_STACK_WORK                                           \
             "mov %[stk], %%rsp;"                                        \
+            ZERO_STACK                                                  \
             CHECK_FOR_LIVEPATCH_WORK                                    \
             instr "[fun]"                                               \
             : [val] "=&r" (tmp),                                        \
@@ -194,19 +230,26 @@ unsigned long get_stack_dump_bottom (unsigned long sp);
               ((PRIMARY_SHSTK_SLOT + 1) * PAGE_SIZE - 8),               \
               [stack_mask] "i" (STACK_SIZE - 1),                        \
               _ASM_BUGFRAME_INFO(BUGFRAME_bug, __LINE__,                \
-                                 __FILE__, NULL)                        \
+                                 __FILE__, NULL),                       \
+              /* For stack zeroing. */                                  \
+              "D" ((void *)guest_cpu_user_regs() -                      \
+                   PRIMARY_STACK_SIZE + sizeof(struct cpu_info)),       \
+              [stk_size] "c"                                            \
+              ((zero_stk) ? PRIMARY_STACK_SIZE - sizeof(struct cpu_info)\
+                          : 0),                                         \
+              "a" (0)                                                   \
             : "memory" );                                               \
         unreachable();                                                  \
     })
 
 #define reset_stack_and_jump(fn)                                        \
-    switch_stack_and_jump(fn, "jmp %c", "i")
+    switch_stack_and_jump(fn, "jmp %c", "i", false)
 
 /* The constraint may only specify non-call-clobbered registers. */
-#define reset_stack_and_call_ind(fn)                                    \
+#define reset_stack_and_call_ind(fn, zero_stk)                          \
     ({                                                                  \
         (void)((fn) == (void (*)(void))NULL);                           \
-        switch_stack_and_jump(fn, "INDIRECT_CALL %", "b");              \
+        switch_stack_and_jump(fn, "INDIRECT_CALL %", "b", zero_stk);    \
     })
 
 /*
diff --git a/xen/arch/x86/include/asm/domain.h b/xen/arch/x86/include/asm/domain.h
index f83d2860c0b4..c2cbd73a42b4 100644
--- a/xen/arch/x86/include/asm/domain.h
+++ b/xen/arch/x86/include/asm/domain.h
@@ -468,6 +468,9 @@ struct arch_domain
     /* Use per-CPU mapped stacks. */
     bool cpu_stack;
 
+    /* Zero CPU stack on non lazy context switch. */
+    bool zero_stack;
+
     /* Emulated devices enabled bitmap. */
     uint32_t emulation_flags;
 } __cacheline_aligned;
diff --git a/xen/arch/x86/include/asm/spec_ctrl.h b/xen/arch/x86/include/asm/spec_ctrl.h
index c8943e81befa..c335c5eca35d 100644
--- a/xen/arch/x86/include/asm/spec_ctrl.h
+++ b/xen/arch/x86/include/asm/spec_ctrl.h
@@ -90,6 +90,7 @@ extern int8_t opt_xpti_hwdom, opt_xpti_domu;
 
 extern int8_t opt_vcpu_pt_pv, opt_vcpu_pt_hwdom, opt_vcpu_pt_hvm;
 extern int8_t opt_cpu_stack_pv, opt_cpu_stack_hwdom, opt_cpu_stack_hvm;
+extern int8_t opt_zero_stack_pv, opt_zero_stack_hwdom, opt_zero_stack_hvm;
 
 extern bool cpu_has_bug_l1tf;
 extern int8_t opt_pv_l1tf_hwdom, opt_pv_l1tf_domu;
diff --git a/xen/arch/x86/spec_ctrl.c b/xen/arch/x86/spec_ctrl.c
index 4f1e912f8057..edae4b802e67 100644
--- a/xen/arch/x86/spec_ctrl.c
+++ b/xen/arch/x86/spec_ctrl.c
@@ -93,6 +93,10 @@ int8_t __ro_after_init opt_vcpu_pt_pv = -1;
 int8_t __ro_after_init opt_cpu_stack_hvm = -1;
 int8_t __ro_after_init opt_cpu_stack_hwdom = -1;
 int8_t __ro_after_init opt_cpu_stack_pv = -1;
+/* Zero CPU stacks. */
+int8_t __ro_after_init opt_zero_stack_hvm = -1;
+int8_t __ro_after_init opt_zero_stack_hwdom = -1;
+int8_t __ro_after_init opt_zero_stack_pv = -1;
 
 static int __init cf_check parse_spec_ctrl(const char *s)
 {
@@ -515,6 +519,7 @@ static int __init cf_check parse_asi(const char *s)
     {
         opt_vcpu_pt_pv = opt_vcpu_pt_hwdom = opt_vcpu_pt_hvm = 1;
         opt_cpu_stack_pv = opt_cpu_stack_hwdom = opt_cpu_stack_hvm = 1;
+        opt_zero_stack_pv = opt_zero_stack_hvm = opt_zero_stack_hwdom = 1;
     }
 
     do {
@@ -529,13 +534,14 @@ static int __init cf_check parse_asi(const char *s)
         case 1:
             opt_vcpu_pt_pv = opt_vcpu_pt_hwdom = opt_vcpu_pt_hvm = val;
             opt_cpu_stack_pv = opt_cpu_stack_hvm = opt_cpu_stack_hwdom = val;
+            opt_zero_stack_pv = opt_zero_stack_hvm = opt_zero_stack_hwdom = val;
             break;
 
         default:
             if ( (val = parse_boolean("pv", s, ss)) >= 0 )
-                opt_cpu_stack_pv = opt_vcpu_pt_pv = val;
+                opt_zero_stack_pv = opt_cpu_stack_pv = opt_vcpu_pt_pv = val;
             else if ( (val = parse_boolean("hvm", s, ss)) >= 0 )
-                opt_cpu_stack_hvm = opt_vcpu_pt_hvm = val;
+                opt_zero_stack_hvm = opt_cpu_stack_hvm = opt_vcpu_pt_hvm = val;
             else if ( (val = parse_boolean("vcpu-pt", s, ss)) != -1 )
             {
                 switch ( val )
@@ -579,6 +585,28 @@ static int __init cf_check parse_asi(const char *s)
                     break;
                 }
             }
+            else if ( (val = parse_boolean("zero-stack", s, ss)) != -1 )
+            {
+                switch ( val )
+                {
+                case 1:
+                case 0:
+                    opt_zero_stack_pv = opt_zero_stack_hvm =
+                        opt_zero_stack_hwdom = val;
+                    break;
+
+                case -2:
+                    s += strlen("zero-stack=");
+                    if ( (val = parse_boolean("pv", s, ss)) >= 0 )
+                        opt_zero_stack_pv = val;
+                    else if ( (val = parse_boolean("hvm", s, ss)) >= 0 )
+                        opt_zero_stack_hvm = val;
+                    else
+                default:
+                        rc = -EINVAL;
+                    break;
+                }
+            }
             else if ( *s )
                 rc = -EINVAL;
             break;
@@ -791,17 +819,21 @@ static void __init print_details(enum ind_thunk thunk)
 #endif
 
 #ifdef CONFIG_HVM
-    printk("  ASI features for HVM VMs:%s%s%s\n",
-           opt_vcpu_pt_hvm || opt_cpu_stack_hvm      ? ""               : " None",
+    printk("  ASI features for HVM VMs:%s%s%s%s\n",
+           opt_vcpu_pt_hvm || opt_cpu_stack_hvm ||
+           opt_zero_stack_hvm                        ? ""               : " None",
            opt_vcpu_pt_hvm                           ? " vCPU-PT"       : "",
-           opt_cpu_stack_hvm                         ? " CPU-STACK"     : "");
+           opt_cpu_stack_hvm                         ? " CPU-STACK"     : "",
+           opt_zero_stack_hvm                        ? " ZERO-STACK"    : "");
 
 #endif
 #ifdef CONFIG_PV
-    printk("  ASI features for PV VMs:%s%s%s\n",
-           opt_vcpu_pt_pv || opt_cpu_stack_pv        ? ""               : " None",
+    printk("  ASI features for PV VMs:%s%s%s%s\n",
+           opt_vcpu_pt_pv || opt_cpu_stack_pv ||
+           opt_zero_stack_pv                         ? ""               : " None",
            opt_vcpu_pt_pv                            ? " vCPU-PT"       : "",
-           opt_cpu_stack_pv                          ? " CPU-STACK"     : "");
+           opt_cpu_stack_pv                          ? " CPU-STACK"     : "",
+           opt_zero_stack_pv                         ? " ZERO-STACK"    : "");
 #endif
 }
 
@@ -1912,6 +1944,9 @@ void spec_ctrl_init_domain(struct domain *d)
     d->arch.cpu_stack = is_hardware_domain(d) ? opt_cpu_stack_hwdom
                                               : pv ? opt_cpu_stack_pv
                                                    : opt_cpu_stack_hvm;
+    d->arch.zero_stack = is_hardware_domain(d) ? opt_zero_stack_hwdom
+                                               : pv ? opt_zero_stack_pv
+                                                    : opt_zero_stack_hvm;
 }
 
 void __init init_speculation_mitigations(void)
@@ -2221,6 +2256,12 @@ void __init init_speculation_mitigations(void)
         opt_cpu_stack_hwdom = 0;
     if ( opt_cpu_stack_hvm == -1 )
         opt_cpu_stack_hvm = 0;
+    if ( opt_zero_stack_pv == -1 )
+        opt_zero_stack_pv = 0;
+    if ( opt_zero_stack_hwdom == -1 )
+        opt_zero_stack_hwdom = 0;
+    if ( opt_zero_stack_hvm == -1 )
+        opt_zero_stack_hvm = 0;
 
     if ( opt_vcpu_pt_pv || opt_vcpu_pt_hvm )
         warning_add(
diff --git a/xen/arch/x86/traps.c b/xen/arch/x86/traps.c
index c80ef2268e94..2aa53550e8e6 100644
--- a/xen/arch/x86/traps.c
+++ b/xen/arch/x86/traps.c
@@ -1792,6 +1792,7 @@ static void unknown_nmi_error(const struct cpu_user_regs *regs,
 static nmi_callback_t *__read_mostly nmi_callback;
 
 DEFINE_PER_CPU(unsigned int, nmi_count);
+DEFINE_PER_CPU(unsigned int, slice_nmi_count);
 
 void do_nmi(const struct cpu_user_regs *regs)
 {
@@ -1801,6 +1802,7 @@ void do_nmi(const struct cpu_user_regs *regs)
     bool handle_unknown = false;
 
     this_cpu(nmi_count)++;
+    this_cpu(slice_nmi_count)++;
     nmi_enter();
 
     /*
@@ -1919,6 +1921,8 @@ void asmlinkage do_device_not_available(struct cpu_user_regs *regs)
 
 void nocall sysenter_eflags_saved(void);
 
+DEFINE_PER_CPU(unsigned int, slice_db_count);
+
 void asmlinkage do_debug(struct cpu_user_regs *regs)
 {
     unsigned long dr6;
@@ -1927,6 +1931,7 @@ void asmlinkage do_debug(struct cpu_user_regs *regs)
     /* Stash dr6 as early as possible. */
     dr6 = read_debugreg(6);
 
+    this_cpu(slice_db_count)++;
     /*
      * At the time of writing (March 2018), on the subject of %dr6:
      *
-- 
2.46.0


