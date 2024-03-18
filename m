Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E1FF87EDAA
	for <lists+xen-devel@lfdr.de>; Mon, 18 Mar 2024 17:36:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.694895.1084157 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rmFy2-0006f1-Uq; Mon, 18 Mar 2024 16:36:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 694895.1084157; Mon, 18 Mar 2024 16:36:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rmFy2-0006bW-LZ; Mon, 18 Mar 2024 16:36:06 +0000
Received: by outflank-mailman (input) for mailman id 694895;
 Mon, 18 Mar 2024 16:36:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=we9v=KY=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1rmFy1-0005JN-Cj
 for xen-devel@lists.xenproject.org; Mon, 18 Mar 2024 16:36:05 +0000
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [2a00:1450:4864:20::52a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9c4651e1-e545-11ee-a1ee-f123f15fe8a2;
 Mon, 18 Mar 2024 17:36:03 +0100 (CET)
Received: by mail-ed1-x52a.google.com with SMTP id
 4fb4d7f45d1cf-5649c25369aso6221037a12.2
 for <xen-devel@lists.xenproject.org>; Mon, 18 Mar 2024 09:36:03 -0700 (PDT)
Received: from andrewcoop.citrite.net (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 j22-20020a170906051600b00a441a7a75b5sm4988894eja.209.2024.03.18.09.36.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Mar 2024 09:36:00 -0700 (PDT)
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
X-Inumbo-ID: 9c4651e1-e545-11ee-a1ee-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1710779762; x=1711384562; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+Es/OAet7dNZ7FixRa/pu3b/1ceG+5ckl7uGOXfyyFU=;
        b=cpw6tsuEofu9xDWc6cQD/xmfmw3CK0zDnMp87RnAHbSC7LaYSOAEJrrqS99FCbQoLS
         rOwQDMBGH2HvIeHs8Rz8R7VwDLgXbsPSnmYZ1zqBWhZPDqQalLwMdVJTZEqF7GNK4vkC
         sUY41omIzhSSj/q91PYkqGsORwfWPoKbu1Brc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710779762; x=1711384562;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+Es/OAet7dNZ7FixRa/pu3b/1ceG+5ckl7uGOXfyyFU=;
        b=A5UghqaPUvaEqYnitYlVU2Y5nCFS97CM8ojlHIBvRMDbJZphiY2x/XoXRGnKW2giRp
         J7wdTw54o2DuHJU1jXypMBfJJKiDodKX8k13rY4tihMwahNTs0oxug8G2cSGEioVae2K
         lchmIF2AhYggesxHLt3XgZN9zxTQxPNnCI9Mvpom7Rw4RvDlYL322SD7IGd9lUBzmDtH
         Wh3lsWtK6bWC6E/TNzz7jyJXzf4DAzczAe1MXU1kR8X+gTphmsCHVWZyiCr3bslsp5nd
         Fb+oihKW+PkQVejkyg1ef/RInTAm+IQ/NeGnbyCgGjG//jJruGvvRGxUZ0FZR2gfHGf4
         cWtg==
X-Gm-Message-State: AOJu0Yzw4X9hisdMiI4fCsDJgv8JwkBymLV9t1XKdh3+GqoN5U9Cwj+m
	FVZuZLd3aCwhQVHVy/b5iuYxgM0qytOEDYOuo0FW+/45YwMyS6bng6Fmj/JE3Dn7iXfMriBdwe1
	x
X-Google-Smtp-Source: AGHT+IGuGed2OIpdg8mf45PQ90xsx+u1p/YYwxpG5q13Of4+Z8/utQniX7dc+gofmdEtnZVi2HXaug==
X-Received: by 2002:a17:906:a18c:b0:a46:a17b:c44e with SMTP id s12-20020a170906a18c00b00a46a17bc44emr4306442ejy.30.1710779762049;
        Mon, 18 Mar 2024 09:36:02 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	George Dunlap <George.Dunlap@eu.citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Nicola Vetrini <nicola.vetrini@bugseng.com>,
	"consulting @ bugseng . com" <consulting@bugseng.com>
Subject: [PATCH 5/7] xen: Switch to new TRACE() API
Date: Mon, 18 Mar 2024 16:35:50 +0000
Message-Id: <20240318163552.3808695-6-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20240318163552.3808695-1-andrew.cooper3@citrix.com>
References: <20240318163552.3808695-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

(Almost) no functional change.

irq_move_cleanup_interrupt() changes two smp_processor_id() calls to the 'me'
local variable which manifests as a minor code improvement.  All other
differences in the compiled binary are to do with line numbers changing.

Some conversion notes:
 * HVMTRACE_LONG_[234]D() and TRACE_2_LONG_[234]D() were latently buggy.  They
   blindly discard extra parameters, but luckily no users are impacted.  They
   are also obfuscated wrappers, depending on exactly one or two parameters
   being TRC_PAR_LONG() to compile successfully.
 * HVMTRACE_LONG_1D() behaves unlike its named companions, and takes exactly
   one 64bit parameter which it splits manually.  It's one user,
   vmx_cr_access()'s LMSW path, is gets adjusted.
 * TRACE_?D() and TRACE_2_LONG_*() change to TRACE_TIME() as cycles is always
   enabled.
 * HVMTRACE_ND() is opencoded for VMENTRY/VMEXIT records to include cycles.
   These are converted to TRACE_TIME(), with the old modifier parameter
   expressed as an OR at the callsite.  One callsite, svm_vmenter_helper() had
   a nested tb_init_done check, which is dropped.  (The optimiser also spotted
   this, which is why it doesn't manifest as a binary difference.)
 * All uses of *LONG() are either opencoded or swapped to using a struct, to
   avoid MISRA issues.
 * All HVMTRACE_?D() change to TRACE() as cycles is explicitly skipped.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: George Dunlap <George.Dunlap@eu.citrix.com>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Julien Grall <julien@xen.org>
CC: Nicola Vetrini <nicola.vetrini@bugseng.com>
CC: consulting@bugseng.com <consulting@bugseng.com>

v2.1:
 * New
v3:
 * Remove TRACE_PARAM64() for MISRA reasons.
---
 xen/arch/x86/acpi/cpu_idle.c  | 12 ++++----
 xen/arch/x86/compat.c         |  4 +--
 xen/arch/x86/cpu/mwait-idle.c |  6 ++--
 xen/arch/x86/emul-i8254.c     | 14 ++++-----
 xen/arch/x86/hvm/emulate.c    |  8 +++---
 xen/arch/x86/hvm/hpet.c       |  6 ++--
 xen/arch/x86/hvm/hvm.c        | 16 +++++------
 xen/arch/x86/hvm/rtc.c        | 12 ++++----
 xen/arch/x86/hvm/svm/intr.c   |  6 ++--
 xen/arch/x86/hvm/svm/svm.c    | 40 ++++++++++++--------------
 xen/arch/x86/hvm/vlapic.c     | 51 +++++++++++++++++++++++----------
 xen/arch/x86/hvm/vmx/intr.c   |  6 ++--
 xen/arch/x86/hvm/vmx/vmx.c    | 54 +++++++++++++++++------------------
 xen/arch/x86/hvm/vpic.c       | 13 ++++-----
 xen/arch/x86/irq.c            | 14 ++++-----
 xen/arch/x86/traps.c          |  2 +-
 xen/common/domain.c           |  4 +--
 xen/common/grant_table.c      |  6 ++--
 xen/drivers/cpufreq/utility.c |  2 +-
 19 files changed, 144 insertions(+), 132 deletions(-)

diff --git a/xen/arch/x86/acpi/cpu_idle.c b/xen/arch/x86/acpi/cpu_idle.c
index cfce4cc0408f..30094ff485b4 100644
--- a/xen/arch/x86/acpi/cpu_idle.c
+++ b/xen/arch/x86/acpi/cpu_idle.c
@@ -767,7 +767,7 @@ static void cf_check acpi_processor_idle(void)
             /* Get start time (ticks) */
             t1 = alternative_call(cpuidle_get_tick);
             /* Trace cpu idle entry */
-            TRACE_4D(TRC_PM_IDLE_ENTRY, cx->idx, t1, exp, pred);
+            TRACE_TIME(TRC_PM_IDLE_ENTRY, cx->idx, t1, exp, pred);
 
             update_last_cx_stat(power, cx, t1);
 
@@ -777,8 +777,8 @@ static void cf_check acpi_processor_idle(void)
             t2 = alternative_call(cpuidle_get_tick);
             trace_exit_reason(irq_traced);
             /* Trace cpu idle exit */
-            TRACE_6D(TRC_PM_IDLE_EXIT, cx->idx, t2,
-                     irq_traced[0], irq_traced[1], irq_traced[2], irq_traced[3]);
+            TRACE_TIME(TRC_PM_IDLE_EXIT, cx->idx, t2,
+                       irq_traced[0], irq_traced[1], irq_traced[2], irq_traced[3]);
             /* Update statistics */
             update_idle_stats(power, cx, t1, t2);
             /* Re-enable interrupts */
@@ -798,7 +798,7 @@ static void cf_check acpi_processor_idle(void)
         /* Get start time (ticks) */
         t1 = alternative_call(cpuidle_get_tick);
         /* Trace cpu idle entry */
-        TRACE_4D(TRC_PM_IDLE_ENTRY, cx->idx, t1, exp, pred);
+        TRACE_TIME(TRC_PM_IDLE_ENTRY, cx->idx, t1, exp, pred);
 
         update_last_cx_stat(power, cx, t1);
 
@@ -853,8 +853,8 @@ static void cf_check acpi_processor_idle(void)
         cstate_restore_tsc();
         trace_exit_reason(irq_traced);
         /* Trace cpu idle exit */
-        TRACE_6D(TRC_PM_IDLE_EXIT, cx->idx, t2,
-                 irq_traced[0], irq_traced[1], irq_traced[2], irq_traced[3]);
+        TRACE_TIME(TRC_PM_IDLE_EXIT, cx->idx, t2,
+                   irq_traced[0], irq_traced[1], irq_traced[2], irq_traced[3]);
 
         /* Update statistics */
         update_idle_stats(power, cx, t1, t2);
diff --git a/xen/arch/x86/compat.c b/xen/arch/x86/compat.c
index a03106283028..217b5b1fcc41 100644
--- a/xen/arch/x86/compat.c
+++ b/xen/arch/x86/compat.c
@@ -37,8 +37,8 @@ long do_sched_op_compat(int cmd, unsigned long arg)
         return do_sched_op(cmd, guest_handle_from_ptr(NULL, void));
 
     case SCHEDOP_shutdown:
-        TRACE_3D(TRC_SCHED_SHUTDOWN,
-                 current->domain->domain_id, current->vcpu_id, arg);
+        TRACE_TIME(TRC_SCHED_SHUTDOWN,
+                   current->domain->domain_id, current->vcpu_id, arg);
         domain_shutdown(current->domain, (u8)arg);
         break;
 
diff --git a/xen/arch/x86/cpu/mwait-idle.c b/xen/arch/x86/cpu/mwait-idle.c
index ff5c808bc952..ae6987117169 100644
--- a/xen/arch/x86/cpu/mwait-idle.c
+++ b/xen/arch/x86/cpu/mwait-idle.c
@@ -962,7 +962,7 @@ static void cf_check mwait_idle(void)
 		lapic_timer_off();
 
 	before = alternative_call(cpuidle_get_tick);
-	TRACE_4D(TRC_PM_IDLE_ENTRY, cx->type, before, exp, pred);
+	TRACE_TIME(TRC_PM_IDLE_ENTRY, cx->type, before, exp, pred);
 
 	update_last_cx_stat(power, cx, before);
 
@@ -986,8 +986,8 @@ static void cf_check mwait_idle(void)
 
 	local_irq_enable();
 
-	TRACE_6D(TRC_PM_IDLE_EXIT, cx->type, after,
-		irq_traced[0], irq_traced[1], irq_traced[2], irq_traced[3]);
+	TRACE_TIME(TRC_PM_IDLE_EXIT, cx->type, after,
+		   irq_traced[0], irq_traced[1], irq_traced[2], irq_traced[3]);
 
 	if (!(lapic_timer_reliable_states & (1 << cx->type)))
 		lapic_timer_on();
diff --git a/xen/arch/x86/emul-i8254.c b/xen/arch/x86/emul-i8254.c
index 0191f80ba251..144aa168a3f0 100644
--- a/xen/arch/x86/emul-i8254.c
+++ b/xen/arch/x86/emul-i8254.c
@@ -94,7 +94,7 @@ static void cf_check pit_time_fired(struct vcpu *v, void *priv)
 {
     uint64_t *count_load_time = priv;
 
-    TRACE_0D(TRC_HVM_EMUL_PIT_TIMER_CB);
+    TRACE_TIME(TRC_HVM_EMUL_PIT_TIMER_CB);
     *count_load_time = get_guest_time(v);
 }
 
@@ -128,19 +128,19 @@ static void pit_load_count(PITState *pit, int channel, int val)
     case 2:
     case 3:
         /* Periodic timer. */
-        TRACE_2D(TRC_HVM_EMUL_PIT_START_TIMER, period, period);
+        TRACE_TIME(TRC_HVM_EMUL_PIT_START_TIMER, period, period);
         create_periodic_time(v, &pit->pt0, period, period, 0, pit_time_fired,
                              &pit->count_load_time[channel], false);
         break;
     case 1:
     case 4:
         /* One-shot timer. */
-        TRACE_2D(TRC_HVM_EMUL_PIT_START_TIMER, period, 0);
+        TRACE_TIME(TRC_HVM_EMUL_PIT_START_TIMER, period, 0);
         create_periodic_time(v, &pit->pt0, period, 0, 0, pit_time_fired,
                              &pit->count_load_time[channel], false);
         break;
     default:
-        TRACE_0D(TRC_HVM_EMUL_PIT_STOP_TIMER);
+        TRACE_TIME(TRC_HVM_EMUL_PIT_STOP_TIMER);
         destroy_periodic_time(&pit->pt0);
         break;
     }
@@ -404,7 +404,7 @@ void pit_stop_channel0_irq(PITState *pit)
     if ( !has_vpit(current->domain) )
         return;
 
-    TRACE_0D(TRC_HVM_EMUL_PIT_STOP_TIMER);
+    TRACE_TIME(TRC_HVM_EMUL_PIT_STOP_TIMER);
     spin_lock(&pit->lock);
     destroy_periodic_time(&pit->pt0);
     spin_unlock(&pit->lock);
@@ -615,7 +615,7 @@ void pit_reset(struct domain *d)
 
     if ( is_hvm_domain(d) )
     {
-        TRACE_0D(TRC_HVM_EMUL_PIT_STOP_TIMER);
+        TRACE_TIME(TRC_HVM_EMUL_PIT_STOP_TIMER);
         destroy_periodic_time(&pit->pt0);
         pit->pt0.source = PTSRC_isa;
     }
@@ -660,7 +660,7 @@ void pit_deinit(struct domain *d)
 
     if ( is_hvm_domain(d) )
     {
-        TRACE_0D(TRC_HVM_EMUL_PIT_STOP_TIMER);
+        TRACE_TIME(TRC_HVM_EMUL_PIT_STOP_TIMER);
         destroy_periodic_time(&pit->pt0);
     }
 }
diff --git a/xen/arch/x86/hvm/emulate.c b/xen/arch/x86/hvm/emulate.c
index ab1bc516839a..d8f36206a712 100644
--- a/xen/arch/x86/hvm/emulate.c
+++ b/xen/arch/x86/hvm/emulate.c
@@ -2181,7 +2181,7 @@ static int cf_check hvmemul_read_cr(
     case 3:
     case 4:
         *val = current->arch.hvm.guest_cr[reg];
-        HVMTRACE_LONG_2D(CR_READ, reg, TRC_PAR_LONG(*val));
+        TRACE(TRC_HVM_CR_READ64, reg, *val, *val >> 32);
         return X86EMUL_OKAY;
     default:
         break;
@@ -2197,7 +2197,7 @@ static int cf_check hvmemul_write_cr(
 {
     int rc;
 
-    HVMTRACE_LONG_2D(CR_WRITE, reg, TRC_PAR_LONG(val));
+    TRACE(TRC_HVM_CR_WRITE64, reg, val, val >> 32);
     switch ( reg )
     {
     case 0:
@@ -2242,7 +2242,7 @@ static int cf_check hvmemul_read_xcr(
     int rc = x86emul_read_xcr(reg, val, ctxt);
 
     if ( rc == X86EMUL_OKAY )
-        HVMTRACE_LONG_2D(XCR_READ, reg, TRC_PAR_LONG(*val));
+        TRACE(TRC_HVM_XCR_READ64, reg, *val, *val >> 32);
 
     return rc;
 }
@@ -2252,7 +2252,7 @@ static int cf_check hvmemul_write_xcr(
     uint64_t val,
     struct x86_emulate_ctxt *ctxt)
 {
-    HVMTRACE_LONG_2D(XCR_WRITE, reg, TRC_PAR_LONG(val));
+    TRACE(TRC_HVM_XCR_WRITE64, reg, val, val >> 32);
 
     return x86emul_write_xcr(reg, val, ctxt);
 }
diff --git a/xen/arch/x86/hvm/hpet.c b/xen/arch/x86/hvm/hpet.c
index 1db9c0b60ee0..0356ade5957b 100644
--- a/xen/arch/x86/hvm/hpet.c
+++ b/xen/arch/x86/hvm/hpet.c
@@ -201,7 +201,7 @@ static void hpet_stop_timer(HPETState *h, unsigned int tn,
 {
     ASSERT(tn < HPET_TIMER_NUM);
     ASSERT(rw_is_write_locked(&h->lock));
-    TRACE_1D(TRC_HVM_EMUL_HPET_STOP_TIMER, tn);
+    TRACE_TIME(TRC_HVM_EMUL_HPET_STOP_TIMER, tn);
     destroy_periodic_time(&h->pt[tn]);
     /* read the comparator to get it updated so a read while stopped will
      * return the expected value. */
@@ -305,8 +305,8 @@ static void hpet_set_timer(HPETState *h, unsigned int tn,
     if ( !oneshot )
         period_ns = hpet_tick_to_ns(h, h->hpet.period[tn]);
 
-    TRACE_2_LONG_4D(TRC_HVM_EMUL_HPET_START_TIMER, tn, irq,
-                    TRC_PAR_LONG(diff_ns), TRC_PAR_LONG(period_ns));
+    TRACE_TIME(TRC_HVM_EMUL_HPET_START_TIMER, tn, irq,
+               diff_ns, diff_ns >> 32, period_ns, period_ns >> 32);
 
     create_periodic_time(vhpet_vcpu(h), &h->pt[tn], diff_ns, period_ns,
                          irq, timer_level(h, tn) ? hpet_timer_fired : NULL,
diff --git a/xen/arch/x86/hvm/hvm.c b/xen/arch/x86/hvm/hvm.c
index c75959588c0e..e8af42eb499d 100644
--- a/xen/arch/x86/hvm/hvm.c
+++ b/xen/arch/x86/hvm/hvm.c
@@ -1699,7 +1699,7 @@ void hvm_hlt(unsigned int eflags)
 
     do_sched_op(SCHEDOP_block, guest_handle_from_ptr(NULL, void));
 
-    HVMTRACE_1D(HLT, /* pending = */ vcpu_runnable(curr));
+    TRACE(TRC_HVM_HLT, /* pending = */ vcpu_runnable(curr));
 }
 
 void hvm_triple_fault(void)
@@ -2153,7 +2153,7 @@ int hvm_mov_to_cr(unsigned int cr, unsigned int gpr)
     unsigned long val = *decode_gpr(guest_cpu_user_regs(), gpr);
     int rc;
 
-    HVMTRACE_LONG_2D(CR_WRITE, cr, TRC_PAR_LONG(val));
+    TRACE(TRC_HVM_CR_WRITE64, cr, val, val >> 32);
     HVM_DBG_LOG(DBG_LEVEL_1, "CR%u, value = %lx", cr, val);
 
     switch ( cr )
@@ -2218,7 +2218,7 @@ int hvm_mov_from_cr(unsigned int cr, unsigned int gpr)
     }
 
     *reg = val;
-    HVMTRACE_LONG_2D(CR_READ, cr, TRC_PAR_LONG(val));
+    TRACE(TRC_HVM_CR_READ64, cr, val, val >> 32);
     HVM_DBG_LOG(DBG_LEVEL_VMMU, "CR%u, value = %lx", cr, val);
 
     return X86EMUL_OKAY;
@@ -3508,7 +3508,7 @@ int hvm_vmexit_cpuid(struct cpu_user_regs *regs, unsigned int inst_len)
     }
 
     guest_cpuid(curr, leaf, subleaf, &res);
-    HVMTRACE_6D(CPUID, leaf, subleaf, res.a, res.b, res.c, res.d);
+    TRACE(TRC_HVM_CPUID, leaf, subleaf, res.a, res.b, res.c, res.d);
 
     regs->rax = res.a;
     regs->rbx = res.b;
@@ -3522,7 +3522,7 @@ void hvm_rdtsc_intercept(struct cpu_user_regs *regs)
 {
     msr_split(regs, hvm_get_guest_tsc(current));
 
-    HVMTRACE_2D(RDTSC, regs->eax, regs->edx);
+    TRACE(TRC_HVM_RDTSC, regs->eax, regs->edx);
 }
 
 int hvm_msr_read_intercept(unsigned int msr, uint64_t *msr_content)
@@ -3629,8 +3629,7 @@ int hvm_msr_read_intercept(unsigned int msr, uint64_t *msr_content)
     }
 
  out:
-    HVMTRACE_3D(MSR_READ, msr,
-                (uint32_t)*msr_content, (uint32_t)(*msr_content >> 32));
+    TRACE(TRC_HVM_MSR_READ, msr, *msr_content, *msr_content >> 32);
     return ret;
 
  gp_fault:
@@ -3646,8 +3645,7 @@ int hvm_msr_write_intercept(unsigned int msr, uint64_t msr_content,
     struct domain *d = v->domain;
     int ret;
 
-    HVMTRACE_3D(MSR_WRITE, msr,
-               (uint32_t)msr_content, (uint32_t)(msr_content >> 32));
+    TRACE(TRC_HVM_MSR_WRITE, msr, msr_content, msr_content >> 32);
 
     if ( may_defer && unlikely(monitored_msr(v->domain, msr)) )
     {
diff --git a/xen/arch/x86/hvm/rtc.c b/xen/arch/x86/hvm/rtc.c
index 4b31382619f4..3ad5e4faba76 100644
--- a/xen/arch/x86/hvm/rtc.c
+++ b/xen/arch/x86/hvm/rtc.c
@@ -91,7 +91,7 @@ static void cf_check rtc_pf_callback(struct vcpu *v, void *opaque)
          && ++(s->pt_dead_ticks) >= 10 )
     {
         /* VM is ignoring its RTC; no point in running the timer */
-        TRACE_0D(TRC_HVM_EMUL_RTC_STOP_TIMER);
+        TRACE_TIME(TRC_HVM_EMUL_RTC_STOP_TIMER);
         destroy_periodic_time(&s->pt);
         s->period = 0;
     }
@@ -154,7 +154,7 @@ static void rtc_timer_update(RTCState *s)
                     delta = period - ((now - s->start_time) % period);
                 if ( s->hw.cmos_data[RTC_REG_B] & RTC_PIE )
                 {
-                    TRACE_2D(TRC_HVM_EMUL_RTC_START_TIMER, delta, period);
+                    TRACE_TIME(TRC_HVM_EMUL_RTC_START_TIMER, delta, period);
                     create_periodic_time(v, &s->pt, delta, period,
                                          RTC_IRQ, rtc_pf_callback, s, false);
                 }
@@ -165,7 +165,7 @@ static void rtc_timer_update(RTCState *s)
         }
         /* fall through */
     default:
-        TRACE_0D(TRC_HVM_EMUL_RTC_STOP_TIMER);
+        TRACE_TIME(TRC_HVM_EMUL_RTC_STOP_TIMER);
         destroy_periodic_time(&s->pt);
         s->period = 0;
         break;
@@ -552,7 +552,7 @@ static int rtc_ioport_write(void *opaque, uint32_t addr, uint32_t data)
         rtc_update_irq(s);
         if ( (data ^ orig) & RTC_PIE )
         {
-            TRACE_0D(TRC_HVM_EMUL_RTC_STOP_TIMER);
+            TRACE_TIME(TRC_HVM_EMUL_RTC_STOP_TIMER);
             destroy_periodic_time(&s->pt);
             s->period = 0;
             rtc_timer_update(s);
@@ -806,7 +806,7 @@ void rtc_reset(struct domain *d)
     if ( !has_vrtc(d) )
         return;
 
-    TRACE_0D(TRC_HVM_EMUL_RTC_STOP_TIMER);
+    TRACE_TIME(TRC_HVM_EMUL_RTC_STOP_TIMER);
     destroy_periodic_time(&s->pt);
     s->period = 0;
     s->pt.source = PTSRC_isa;
@@ -891,7 +891,7 @@ void rtc_deinit(struct domain *d)
 
     spin_barrier(&s->lock);
 
-    TRACE_0D(TRC_HVM_EMUL_RTC_STOP_TIMER);
+    TRACE_TIME(TRC_HVM_EMUL_RTC_STOP_TIMER);
     destroy_periodic_time(&s->pt);
     kill_timer(&s->update_timer);
     kill_timer(&s->update_timer2);
diff --git a/xen/arch/x86/hvm/svm/intr.c b/xen/arch/x86/hvm/svm/intr.c
index 4805c5567213..dc684fdc843e 100644
--- a/xen/arch/x86/hvm/svm/intr.c
+++ b/xen/arch/x86/hvm/svm/intr.c
@@ -90,8 +90,8 @@ static void svm_enable_intr_window(struct vcpu *v, struct hvm_intack intack)
         }
     }
 
-    HVMTRACE_3D(INTR_WINDOW, intack.vector, intack.source,
-                vmcb->event_inj.v ? vmcb->event_inj.vector : -1);
+    TRACE(TRC_HVM_INTR_WINDOW, intack.vector, intack.source,
+          vmcb->event_inj.v ? vmcb->event_inj.vector : -1);
 
     /*
      * Create a dummy virtual interrupt to intercept as soon as the
@@ -206,7 +206,7 @@ void asmlinkage svm_intr_assist(void)
     }
     else
     {
-        HVMTRACE_2D(INJ_VIRQ, intack.vector, /*fake=*/ 0);
+        TRACE(TRC_HVM_INJ_VIRQ, intack.vector, /*fake=*/ 0);
         svm_inject_extint(v, intack.vector);
         pt_intr_post(v, intack);
     }
diff --git a/xen/arch/x86/hvm/svm/svm.c b/xen/arch/x86/hvm/svm/svm.c
index b1ab0b568b85..09a79d761163 100644
--- a/xen/arch/x86/hvm/svm/svm.c
+++ b/xen/arch/x86/hvm/svm/svm.c
@@ -1066,10 +1066,8 @@ void asmlinkage svm_vmenter_helper(void)
 
     svm_asid_handle_vmrun();
 
-    if ( unlikely(tb_init_done) )
-        HVMTRACE_ND(VMENTRY,
-                    nestedhvm_vcpu_in_guestmode(curr) ? TRC_HVM_NESTEDFLAG : 0,
-                    1/*cycles*/);
+    TRACE_TIME(TRC_HVM_VMENTRY |
+               (nestedhvm_vcpu_in_guestmode(curr) ? TRC_HVM_NESTEDFLAG : 0));
 
     svm_sync_vmcb(curr, vmcb_needs_vmsave);
 
@@ -1441,10 +1439,10 @@ static void cf_check svm_inject_event(const struct x86_event *event)
 
     if ( _event.vector == X86_EXC_PF &&
          _event.type == X86_EVENTTYPE_HW_EXCEPTION )
-        HVMTRACE_LONG_2D(PF_INJECT, _event.error_code,
-                         TRC_PAR_LONG(_event.cr2));
+        TRACE(TRC_HVM_PF_INJECT64, _event.error_code,
+              _event.cr2, _event.cr2 >> 32);
     else
-        HVMTRACE_2D(INJ_EXC, _event.vector, _event.error_code);
+        TRACE(TRC_HVM_INJ_EXC, _event.vector, _event.error_code);
 }
 
 static bool cf_check svm_event_pending(const struct vcpu *v)
@@ -1751,7 +1749,7 @@ static void svm_dr_access(struct vcpu *v, struct cpu_user_regs *regs)
 {
     struct vmcb_struct *vmcb = vcpu_nestedhvm(v).nv_n1vmcx;
 
-    HVMTRACE_0D(DR_WRITE);
+    TRACE(TRC_HVM_DR_WRITE);
     __restore_debug_registers(vmcb, v);
 }
 
@@ -2402,7 +2400,7 @@ static void svm_invlpga_intercept(
 
 static void svm_invlpg_intercept(unsigned long linear)
 {
-    HVMTRACE_LONG_2D(INVLPG, 0, TRC_PAR_LONG(linear));
+    TRACE(TRC_HVM_INVLPG64, 0, linear, linear >> 32);
     paging_invlpg(current, linear);
 }
 
@@ -2629,11 +2627,11 @@ void asmlinkage svm_vmexit_handler(void)
     exit_reason = vmcb->exitcode;
 
     if ( hvm_long_mode_active(v) )
-        HVMTRACE_ND(VMEXIT64, vcpu_guestmode ? TRC_HVM_NESTEDFLAG : 0,
-                    1/*cycles*/, exit_reason, TRC_PAR_LONG(regs->rip));
+        TRACE_TIME(TRC_HVM_VMEXIT64 | (vcpu_guestmode ? TRC_HVM_NESTEDFLAG : 0),
+                   exit_reason, regs->rip, regs->rip >> 32);
     else
-        HVMTRACE_ND(VMEXIT, vcpu_guestmode ? TRC_HVM_NESTEDFLAG : 0,
-                    1/*cycles*/, exit_reason, regs->eip);
+        TRACE_TIME(TRC_HVM_VMEXIT | (vcpu_guestmode ? TRC_HVM_NESTEDFLAG : 0),
+                   exit_reason, regs->eip);
 
     if ( vcpu_guestmode )
     {
@@ -2728,17 +2726,17 @@ void asmlinkage svm_vmexit_handler(void)
     {
     case VMEXIT_INTR:
         /* Asynchronous event, handled when we STGI'd after the VMEXIT. */
-        HVMTRACE_0D(INTR);
+        TRACE(TRC_HVM_INTR);
         break;
 
     case VMEXIT_NMI:
         /* Asynchronous event, handled when we STGI'd after the VMEXIT. */
-        HVMTRACE_0D(NMI);
+        TRACE(TRC_HVM_NMI);
         break;
 
     case VMEXIT_SMI:
         /* Asynchronous event, handled when we STGI'd after the VMEXIT. */
-        HVMTRACE_0D(SMI);
+        TRACE(TRC_HVM_SMI);
         break;
 
     case VMEXIT_ICEBP:
@@ -2826,9 +2824,9 @@ void asmlinkage svm_vmexit_handler(void)
             if ( trace_will_trace_event(TRC_SHADOW) )
                 break;
             if ( hvm_long_mode_active(v) )
-                HVMTRACE_LONG_2D(PF_XEN, regs->error_code, TRC_PAR_LONG(va));
+                TRACE(TRC_HVM_PF_XEN64, regs->error_code, va, va >> 32);
             else
-                HVMTRACE_2D(PF_XEN, regs->error_code, va);
+                TRACE(TRC_HVM_PF_XEN, regs->error_code, va);
             break;
         }
 
@@ -2837,7 +2835,7 @@ void asmlinkage svm_vmexit_handler(void)
     }
 
     case VMEXIT_EXCEPTION_AC:
-        HVMTRACE_1D(TRAP, X86_EXC_AC);
+        TRACE(TRC_HVM_TRAP, X86_EXC_AC);
         hvm_inject_hw_exception(X86_EXC_AC, vmcb->ei.exc.ec);
         break;
 
@@ -2847,7 +2845,7 @@ void asmlinkage svm_vmexit_handler(void)
 
     /* Asynchronous event, handled when we STGI'd after the VMEXIT. */
     case VMEXIT_EXCEPTION_MC:
-        HVMTRACE_0D(MCE);
+        TRACE(TRC_HVM_MCE);
         svm_vmexit_mce_intercept(v, regs);
         break;
 
@@ -2993,7 +2991,7 @@ void asmlinkage svm_vmexit_handler(void)
         if ( (insn_len = svm_get_insn_len(v, INSTR_VMCALL)) == 0 )
             break;
         BUG_ON(vcpu_guestmode);
-        HVMTRACE_1D(VMMCALL, regs->eax);
+        TRACE(TRC_HVM_VMMCALL, regs->eax);
 
         if ( hvm_hypercall(regs) == HVM_HCALL_completed )
             __update_guest_eip(regs, insn_len);
diff --git a/xen/arch/x86/hvm/vlapic.c b/xen/arch/x86/hvm/vlapic.c
index dcbcf4a1feb5..65e171d4751f 100644
--- a/xen/arch/x86/hvm/vlapic.c
+++ b/xen/arch/x86/hvm/vlapic.c
@@ -682,7 +682,7 @@ int guest_rdmsr_x2apic(const struct vcpu *v, uint32_t msr, uint64_t *val)
 
 static void cf_check vlapic_pt_cb(struct vcpu *v, void *data)
 {
-    TRACE_0D(TRC_HVM_EMUL_LAPIC_TIMER_CB);
+    TRACE_TIME(TRC_HVM_EMUL_LAPIC_TIMER_CB);
     *(s_time_t *)data = hvm_get_guest_time(v);
 }
 
@@ -736,9 +736,19 @@ static void vlapic_update_timer(struct vlapic *vlapic, uint32_t lvtt,
             delta = delta * vlapic->hw.timer_divisor / old_divisor;
         }
 
-        TRACE_2_LONG_3D(TRC_HVM_EMUL_LAPIC_START_TIMER, TRC_PAR_LONG(delta),
-                        TRC_PAR_LONG(is_periodic ? period : 0),
-                        vlapic->pt.irq);
+        if ( unlikely(tb_init_done) )
+        {
+            struct {
+                uint64_t delta, period;
+                uint32_t irq;
+            } __packed d = {
+                .delta = delta,
+                .period = is_periodic ? period : 0,
+                .irq = vlapic->pt.irq,
+            };
+
+            trace_time(TRC_HVM_EMUL_LAPIC_START_TIMER, sizeof(d), &d);
+        }
 
         create_periodic_time(current, &vlapic->pt, delta,
                              is_periodic ? period : 0, vlapic->pt.irq,
@@ -758,7 +768,7 @@ static void vlapic_update_timer(struct vlapic *vlapic, uint32_t lvtt,
     }
     else
     {
-        TRACE_0D(TRC_HVM_EMUL_LAPIC_STOP_TIMER);
+        TRACE_TIME(TRC_HVM_EMUL_LAPIC_STOP_TIMER);
         destroy_periodic_time(&vlapic->pt);
         /*
          * From now, TMCCT should return 0 until TMICT is set again.
@@ -1208,8 +1218,8 @@ void vlapic_tdt_msr_set(struct vlapic *vlapic, uint64_t value)
 
         vlapic->hw.tdt_msr = value;
         /* .... reprogram tdt timer */
-        TRACE_2_LONG_3D(TRC_HVM_EMUL_LAPIC_START_TIMER, TRC_PAR_LONG(delta),
-                        TRC_PAR_LONG(0LL), vlapic->pt.irq);
+        TRACE_TIME(TRC_HVM_EMUL_LAPIC_START_TIMER, delta, delta >> 32,
+                   0, 0, vlapic->pt.irq);
         create_periodic_time(v, &vlapic->pt, delta, 0,
                              vlapic->pt.irq, vlapic_tdt_pt_cb,
                              &vlapic->timer_last_update, false);
@@ -1222,8 +1232,8 @@ void vlapic_tdt_msr_set(struct vlapic *vlapic, uint64_t value)
         /* trigger a timer event if needed */
         if ( value > 0 )
         {
-            TRACE_2_LONG_3D(TRC_HVM_EMUL_LAPIC_START_TIMER, TRC_PAR_LONG(0LL),
-                            TRC_PAR_LONG(0LL), vlapic->pt.irq);
+            TRACE_TIME(TRC_HVM_EMUL_LAPIC_START_TIMER, 0, 0,
+                       0, 0, vlapic->pt.irq);
             create_periodic_time(v, &vlapic->pt, 0, 0,
                                  vlapic->pt.irq, vlapic_tdt_pt_cb,
                                  &vlapic->timer_last_update, false);
@@ -1232,7 +1242,7 @@ void vlapic_tdt_msr_set(struct vlapic *vlapic, uint64_t value)
         else
         {
             /* .... stop tdt timer */
-            TRACE_0D(TRC_HVM_EMUL_LAPIC_STOP_TIMER);
+            TRACE_TIME(TRC_HVM_EMUL_LAPIC_STOP_TIMER);
             destroy_periodic_time(&vlapic->pt);
         }
 
@@ -1282,7 +1292,7 @@ int vlapic_accept_pic_intr(struct vcpu *v)
     if ( target )
         accept = __vlapic_accept_pic_intr(v);
 
-    TRACE_2D(TRC_HVM_EMUL_LAPIC_PIC_INTR, target, accept);
+    TRACE_TIME(TRC_HVM_EMUL_LAPIC_PIC_INTR, target, accept);
 
     return target && accept;
 }
@@ -1433,7 +1443,7 @@ static void vlapic_do_init(struct vlapic *vlapic)
     vlapic_set_reg(vlapic, APIC_SPIV, 0xff);
     vlapic->hw.disabled |= VLAPIC_SW_DISABLED;
 
-    TRACE_0D(TRC_HVM_EMUL_LAPIC_STOP_TIMER);
+    TRACE_TIME(TRC_HVM_EMUL_LAPIC_STOP_TIMER);
     destroy_periodic_time(&vlapic->pt);
 }
 
@@ -1476,8 +1486,19 @@ static void lapic_rearm(struct vlapic *s)
               (uint32_t)tmict * s->hw.timer_divisor);
     is_periodic = vlapic_lvtt_period(s);
 
-    TRACE_2_LONG_3D(TRC_HVM_EMUL_LAPIC_START_TIMER, TRC_PAR_LONG(period),
-             TRC_PAR_LONG(is_periodic ? period : 0LL), s->pt.irq);
+    if ( unlikely(tb_init_done) )
+    {
+         struct {
+             uint64_t delta, period;
+             uint32_t irq;
+        } __packed d = {
+             .delta = period,
+             .period = is_periodic ? period : 0,
+             .irq = s->pt.irq,
+        };
+
+        trace_time(TRC_HVM_EMUL_LAPIC_START_TIMER, sizeof(d), &d);
+    }
 
     create_periodic_time(vlapic_vcpu(s), &s->pt, period,
                          is_periodic ? period : 0,
@@ -1669,7 +1690,7 @@ void vlapic_destroy(struct vcpu *v)
         return;
 
     tasklet_kill(&vlapic->init_sipi.tasklet);
-    TRACE_0D(TRC_HVM_EMUL_LAPIC_STOP_TIMER);
+    TRACE_TIME(TRC_HVM_EMUL_LAPIC_STOP_TIMER);
     destroy_periodic_time(&vlapic->pt);
     unmap_domain_page_global(vlapic->regs);
     free_domheap_page(vlapic->regs_page);
diff --git a/xen/arch/x86/hvm/vmx/intr.c b/xen/arch/x86/hvm/vmx/intr.c
index 8beeaab1517b..d36498d83104 100644
--- a/xen/arch/x86/hvm/vmx/intr.c
+++ b/xen/arch/x86/hvm/vmx/intr.c
@@ -67,8 +67,8 @@ static void vmx_enable_intr_window(struct vcpu *v, struct hvm_intack intack)
         unsigned long intr;
 
         __vmread(VM_ENTRY_INTR_INFO, &intr);
-        HVMTRACE_3D(INTR_WINDOW, intack.vector, intack.source,
-                    (intr & INTR_INFO_VALID_MASK) ? intr & 0xff : -1);
+        TRACE(TRC_HVM_INTR_WINDOW, intack.vector, intack.source,
+              (intr & INTR_INFO_VALID_MASK) ? intr & 0xff : -1);
     }
 
     if ( (intack.source == hvm_intsrc_nmi) && cpu_has_vmx_vnmi )
@@ -390,7 +390,7 @@ void asmlinkage vmx_intr_assist(void)
     }
     else
     {
-        HVMTRACE_2D(INJ_VIRQ, intack.vector, /*fake=*/ 0);
+        TRACE(TRC_HVM_INJ_VIRQ, intack.vector, /*fake=*/ 0);
         vmx_inject_extint(intack.vector, intack.source);
         pt_intr_post(v, intack);
     }
diff --git a/xen/arch/x86/hvm/vmx/vmx.c b/xen/arch/x86/hvm/vmx/vmx.c
index 23bdf0d1957f..ac73f58798ed 100644
--- a/xen/arch/x86/hvm/vmx/vmx.c
+++ b/xen/arch/x86/hvm/vmx/vmx.c
@@ -2090,10 +2090,10 @@ static void cf_check vmx_inject_event(const struct x86_event *event)
 
     if ( (_event.vector == X86_EXC_PF) &&
          (_event.type == X86_EVENTTYPE_HW_EXCEPTION) )
-        HVMTRACE_LONG_2D(PF_INJECT, _event.error_code,
-                         TRC_PAR_LONG(curr->arch.hvm.guest_cr[2]));
+        TRACE(TRC_HVM_PF_INJECT64, _event.error_code,
+              curr->arch.hvm.guest_cr[2], curr->arch.hvm.guest_cr[2] >> 32);
     else
-        HVMTRACE_2D(INJ_EXC, _event.vector, _event.error_code);
+        TRACE(TRC_HVM_INJ_EXC, _event.vector, _event.error_code);
 }
 
 static bool cf_check vmx_event_pending(const struct vcpu *v)
@@ -3085,7 +3085,7 @@ static void vmx_dr_access(unsigned long exit_qualification,
 {
     struct vcpu *v = current;
 
-    HVMTRACE_0D(DR_WRITE);
+    TRACE(TRC_HVM_DR_WRITE);
 
     if ( !v->arch.hvm.flag_dr_dirty )
         __restore_debug_registers(v);
@@ -3097,7 +3097,7 @@ static void vmx_dr_access(unsigned long exit_qualification,
 
 static void vmx_invlpg_intercept(unsigned long linear)
 {
-    HVMTRACE_LONG_2D(INVLPG, /*invlpga=*/ 0, TRC_PAR_LONG(linear));
+    TRACE(TRC_HVM_INVLPG64, /*invlpga=*/ 0, linear, linear >> 32);
     paging_invlpg(current, linear);
 }
 
@@ -3145,7 +3145,7 @@ static int vmx_cr_access(cr_access_qual_t qual)
         hvm_monitor_crX(CR0, value, old);
         curr->arch.hvm.guest_cr[0] = value;
         vmx_update_guest_cr(curr, 0, 0);
-        HVMTRACE_0D(CLTS);
+        TRACE(TRC_HVM_CLTS);
         break;
     }
 
@@ -3158,7 +3158,7 @@ static int vmx_cr_access(cr_access_qual_t qual)
         value = (value & ~(X86_CR0_MP|X86_CR0_EM|X86_CR0_TS)) |
                 (qual.lmsw_data &
                  (X86_CR0_PE|X86_CR0_MP|X86_CR0_EM|X86_CR0_TS));
-        HVMTRACE_LONG_1D(LMSW, value);
+        TRACE(TRC_HVM_LMSW64, value, value >> 32);
 
         if ( (rc = hvm_set_cr0(value, true)) == X86EMUL_EXCEPTION )
             hvm_inject_hw_exception(X86_EXC_GP, 0);
@@ -3711,7 +3711,7 @@ static void vmx_do_extint(struct cpu_user_regs *regs)
     BUG_ON(!(vector & INTR_INFO_VALID_MASK));
 
     vector &= INTR_INFO_VECTOR_MASK;
-    HVMTRACE_1D(INTR, vector);
+    TRACE(TRC_HVM_INTR, vector);
 
     regs->entry_vector = vector;
     do_IRQ(regs);
@@ -3851,7 +3851,7 @@ static void vmx_failed_vmentry(unsigned int exit_reason,
 
     case EXIT_REASON_MCE_DURING_VMENTRY:
         printk("MCE\n");
-        HVMTRACE_0D(MCE);
+        TRACE(TRC_HVM_MCE);
         /* Already handled. */
         break;
 
@@ -3892,7 +3892,7 @@ static int vmx_handle_eoi_write(void)
     {
         update_guest_eip(); /* Safe: APIC data write */
         vlapic_EOI_set(vcpu_vlapic(current));
-        HVMTRACE_0D(VLAPIC);
+        TRACE(TRC_HVM_VLAPIC);
         return 1;
     }
 
@@ -4062,10 +4062,9 @@ void asmlinkage vmx_vmexit_handler(struct cpu_user_regs *regs)
     __vmread(VM_EXIT_REASON, &exit_reason);
 
     if ( hvm_long_mode_active(v) )
-        HVMTRACE_ND(VMEXIT64, 0, 1/*cycles*/, exit_reason,
-                    TRC_PAR_LONG(regs->rip));
+        TRACE_TIME(TRC_HVM_VMEXIT64, exit_reason, regs->rip, regs->rip >> 32);
     else
-        HVMTRACE_ND(VMEXIT, 0, 1/*cycles*/, exit_reason, regs->eip);
+        TRACE_TIME(TRC_HVM_VMEXIT, exit_reason, regs->eip);
 
     perfc_incra(vmexits, (uint16_t)exit_reason);
 
@@ -4182,7 +4181,7 @@ void asmlinkage vmx_vmexit_handler(struct cpu_user_regs *regs)
         default:
                 perfc_incr(realmode_exits);
                 v->arch.hvm.vmx.vmx_emulate = 1;
-                HVMTRACE_0D(REALMODE_EMULATE);
+                TRACE(TRC_HVM_REALMODE_EMULATE);
                 return;
             }
         case EXIT_REASON_EXTERNAL_INTERRUPT:
@@ -4239,7 +4238,7 @@ void asmlinkage vmx_vmexit_handler(struct cpu_user_regs *regs)
              * Table 23-1, "Exit Qualification for Debug Exceptions").
              */
             __vmread(EXIT_QUALIFICATION, &exit_qualification);
-            HVMTRACE_1D(TRAP_DEBUG, exit_qualification);
+            TRACE(TRC_HVM_TRAP_DEBUG, exit_qualification);
             __restore_debug_registers(v);
             write_debugreg(6, exit_qualification | DR_STATUS_RESERVED_ONE);
 
@@ -4301,7 +4300,7 @@ void asmlinkage vmx_vmexit_handler(struct cpu_user_regs *regs)
                 domain_pause_for_debugger();
             break;
         case X86_EXC_BP:
-            HVMTRACE_1D(TRAP, vector);
+            TRACE(TRC_HVM_TRAP, vector);
             if ( !v->domain->debugger_attached )
             {
                 unsigned long insn_len;
@@ -4326,7 +4325,7 @@ void asmlinkage vmx_vmexit_handler(struct cpu_user_regs *regs)
             }
             break;
         case X86_EXC_NM:
-            HVMTRACE_1D(TRAP, vector);
+            TRACE(TRC_HVM_TRAP, vector);
             vmx_fpu_dirty_intercept();
             break;
         case X86_EXC_PF:
@@ -4344,37 +4343,36 @@ void asmlinkage vmx_vmexit_handler(struct cpu_user_regs *regs)
                 if ( trace_will_trace_event(TRC_SHADOW) )
                     break;
                 if ( hvm_long_mode_active(v) )
-                    HVMTRACE_LONG_2D(PF_XEN, regs->error_code,
-                                     TRC_PAR_LONG(exit_qualification) );
+                    TRACE(TRC_HVM_PF_XEN64, regs->error_code,
+                          exit_qualification, exit_qualification >> 32);
                 else
-                    HVMTRACE_2D(PF_XEN,
-                                regs->error_code, exit_qualification );
+                    TRACE(TRC_HVM_PF_XEN, regs->error_code, exit_qualification);
                 break;
             }
 
             hvm_inject_page_fault(regs->error_code, exit_qualification);
             break;
         case X86_EXC_AC:
-            HVMTRACE_1D(TRAP, vector);
+            TRACE(TRC_HVM_TRAP, vector);
             vmx_propagate_intr(intr_info);
             break;
         case X86_EXC_NMI:
             if ( MASK_EXTR(intr_info, INTR_INFO_INTR_TYPE_MASK) !=
                  X86_EVENTTYPE_NMI )
                 goto exit_and_crash;
-            HVMTRACE_0D(NMI);
+            TRACE(TRC_HVM_NMI);
             /* Already handled above. */
             break;
         case X86_EXC_MC:
-            HVMTRACE_0D(MCE);
+            TRACE(TRC_HVM_MCE);
             /* Already handled above. */
             break;
         case X86_EXC_UD:
-            HVMTRACE_1D(TRAP, vector);
+            TRACE(TRC_HVM_TRAP, vector);
             hvm_ud_intercept(regs);
             break;
         default:
-            HVMTRACE_1D(TRAP, vector);
+            TRACE(TRC_HVM_TRAP, vector);
             goto exit_and_crash;
         }
         break;
@@ -4460,7 +4458,7 @@ void asmlinkage vmx_vmexit_handler(struct cpu_user_regs *regs)
         break;
 
     case EXIT_REASON_VMCALL:
-        HVMTRACE_1D(VMMCALL, regs->eax);
+        TRACE(TRC_HVM_VMMCALL, regs->eax);
 
         if ( hvm_hypercall(regs) == HVM_HCALL_completed )
             update_guest_eip(); /* Safe: VMCALL */
@@ -4868,7 +4866,7 @@ bool asmlinkage vmx_vmenter_helper(const struct cpu_user_regs *regs)
     if ( unlikely(curr->arch.hvm.vmx.lbr_flags & LBR_FIXUP_MASK) )
         lbr_fixup();
 
-    HVMTRACE_ND(VMENTRY, 0, 1/*cycles*/);
+    TRACE_TIME(TRC_HVM_VMENTRY);
 
     __vmwrite(GUEST_RIP,    regs->rip);
     __vmwrite(GUEST_RSP,    regs->rsp);
diff --git a/xen/arch/x86/hvm/vpic.c b/xen/arch/x86/hvm/vpic.c
index 4e23247a464a..7c3b5c7254a8 100644
--- a/xen/arch/x86/hvm/vpic.c
+++ b/xen/arch/x86/hvm/vpic.c
@@ -99,8 +99,7 @@ static void vpic_update_int_output(struct hvm_hw_vpic *vpic)
     ASSERT(vpic_is_locked(vpic));
 
     irq = vpic_get_highest_priority_irq(vpic);
-    TRACE_3D(TRC_HVM_EMUL_PIC_INT_OUTPUT, vpic->int_output, vpic->is_master,
-             irq);
+    TRACE_TIME(TRC_HVM_EMUL_PIC_INT_OUTPUT, vpic->int_output, vpic->is_master, irq);
     if ( vpic->int_output == (!vpic->init_state && irq >= 0) )
         return;
 
@@ -119,7 +118,7 @@ static void vpic_update_int_output(struct hvm_hw_vpic *vpic)
 
             if ( v != NULL )
             {
-                TRACE_1D(TRC_HVM_EMUL_PIC_KICK, irq);
+                TRACE_TIME(TRC_HVM_EMUL_PIC_KICK, irq);
                 vcpu_kick(v);
             }
         }
@@ -144,7 +143,7 @@ static void __vpic_intack(struct hvm_hw_vpic *vpic, int irq)
 
     ASSERT(vpic_is_locked(vpic));
 
-    TRACE_2D(TRC_HVM_EMUL_PIC_INTACK, vpic->is_master, irq);
+    TRACE_TIME(TRC_HVM_EMUL_PIC_INTACK, vpic->is_master, irq);
     /* Edge-triggered: clear the IRR (forget the edge). */
     if ( !(vpic->elcr & mask) )
         vpic->irr &= ~mask;
@@ -526,7 +525,7 @@ void vpic_irq_positive_edge(struct domain *d, int irq)
     ASSERT(irq <= 15);
     ASSERT(vpic_is_locked(vpic));
 
-    TRACE_1D(TRC_HVM_EMUL_PIC_POSEDGE, irq);
+    TRACE_TIME(TRC_HVM_EMUL_PIC_POSEDGE, irq);
     if ( irq == 2 )
         return;
 
@@ -544,7 +543,7 @@ void vpic_irq_negative_edge(struct domain *d, int irq)
     ASSERT(irq <= 15);
     ASSERT(vpic_is_locked(vpic));
 
-    TRACE_1D(TRC_HVM_EMUL_PIC_NEGEDGE, irq);
+    TRACE_TIME(TRC_HVM_EMUL_PIC_NEGEDGE, irq);
     if ( irq == 2 )
         return;
 
@@ -562,7 +561,7 @@ int vpic_ack_pending_irq(struct vcpu *v)
 
     accept = vlapic_accept_pic_intr(v);
 
-    TRACE_2D(TRC_HVM_EMUL_PIC_PEND_IRQ_CALL, accept, vpic->int_output);
+    TRACE_TIME(TRC_HVM_EMUL_PIC_PEND_IRQ_CALL, accept, vpic->int_output);
     if ( !accept || !vpic->int_output )
         return -1;
 
diff --git a/xen/arch/x86/irq.c b/xen/arch/x86/irq.c
index 0487f734a5d2..2c1f858d3e64 100644
--- a/xen/arch/x86/irq.c
+++ b/xen/arch/x86/irq.c
@@ -229,7 +229,7 @@ static void _clear_irq_vector(struct irq_desc *desc)
         for_each_cpu(cpu, tmp_mask)
         {
             ASSERT(per_cpu(vector_irq, cpu)[old_vector] == irq);
-            TRACE_3D(TRC_HW_IRQ_MOVE_FINISH, irq, old_vector, cpu);
+            TRACE_TIME(TRC_HW_IRQ_MOVE_FINISH, irq, old_vector, cpu);
             per_cpu(vector_irq, cpu)[old_vector] = ~irq;
         }
 
@@ -796,13 +796,11 @@ void cf_check irq_move_cleanup_interrupt(void)
                 goto unlock;
             }
             send_IPI_self(IRQ_MOVE_CLEANUP_VECTOR);
-            TRACE_3D(TRC_HW_IRQ_MOVE_CLEANUP_DELAY,
-                     irq, vector, smp_processor_id());
+            TRACE_TIME(TRC_HW_IRQ_MOVE_CLEANUP_DELAY, irq, vector, me);
             goto unlock;
         }
 
-        TRACE_3D(TRC_HW_IRQ_MOVE_CLEANUP,
-                 irq, vector, smp_processor_id());
+        TRACE_TIME(TRC_HW_IRQ_MOVE_CLEANUP, irq, vector, me);
 
         per_cpu(vector_irq, me)[vector] = ~irq;
         desc->arch.move_cleanup_count--;
@@ -1943,7 +1941,7 @@ void do_IRQ(struct cpu_user_regs *regs)
                     spin_unlock(&desc->lock);
                 }
             }
-            TRACE_1D(TRC_HW_IRQ_UNMAPPED_VECTOR, vector);
+            TRACE_TIME(TRC_HW_IRQ_UNMAPPED_VECTOR, vector);
         }
         goto out_no_unlock;
     }
@@ -1984,7 +1982,7 @@ void do_IRQ(struct cpu_user_regs *regs)
 
         tsc_in = tb_init_done ? get_cycles() : 0;
         do_IRQ_guest(desc, vector);
-        TRACE_3D(TRC_HW_IRQ_HANDLED, irq, tsc_in, get_cycles());
+        TRACE_TIME(TRC_HW_IRQ_HANDLED, irq, tsc_in, get_cycles());
         goto out_no_end;
     }
 
@@ -2008,7 +2006,7 @@ void do_IRQ(struct cpu_user_regs *regs)
 
         tsc_in = tb_init_done ? get_cycles() : 0;
         action->handler(irq, action->dev_id);
-        TRACE_3D(TRC_HW_IRQ_HANDLED, irq, tsc_in, get_cycles());
+        TRACE_TIME(TRC_HW_IRQ_HANDLED, irq, tsc_in, get_cycles());
 
         spin_lock_irq(&desc->lock);
     }
diff --git a/xen/arch/x86/traps.c b/xen/arch/x86/traps.c
index d554c9d41edd..468a03608102 100644
--- a/xen/arch/x86/traps.c
+++ b/xen/arch/x86/traps.c
@@ -1899,7 +1899,7 @@ void asmlinkage do_device_not_available(struct cpu_user_regs *regs)
         curr->arch.pv.ctrlreg[0] &= ~X86_CR0_TS;
     }
     else
-        TRACE_0D(TRC_PV_MATH_STATE_RESTORE);
+        TRACE_TIME(TRC_PV_MATH_STATE_RESTORE);
 #else
     ASSERT_UNREACHABLE();
 #endif
diff --git a/xen/common/domain.c b/xen/common/domain.c
index 1f0d23a1e09b..fe8a216d29b6 100644
--- a/xen/common/domain.c
+++ b/xen/common/domain.c
@@ -625,7 +625,7 @@ struct domain *domain_create(domid_t domid,
         hardware_domain = d;
     }
 
-    TRACE_1D(TRC_DOM0_DOM_ADD, d->domain_id);
+    TRACE_TIME(TRC_DOM0_DOM_ADD, d->domain_id);
 
     lock_profile_register_struct(LOCKPROF_TYPE_PERDOM, d, domid);
 
@@ -1222,7 +1222,7 @@ void domain_destroy(struct domain *d)
     if ( atomic_cmpxchg(&d->refcnt, 0, DOMAIN_DESTROYED) != 0 )
         return;
 
-    TRACE_1D(TRC_DOM0_DOM_REM, d->domain_id);
+    TRACE_TIME(TRC_DOM0_DOM_REM, d->domain_id);
 
     /* Delete from task list and task hashtable. */
     spin_lock(&domlist_update_lock);
diff --git a/xen/common/grant_table.c b/xen/common/grant_table.c
index 77089308829b..8d34c8815f05 100644
--- a/xen/common/grant_table.c
+++ b/xen/common/grant_table.c
@@ -1307,7 +1307,7 @@ map_grant_ref(
             goto undo_out;
     }
 
-    TRACE_1D(TRC_MEM_PAGE_GRANT_MAP, op->dom);
+    TRACE_TIME(TRC_MEM_PAGE_GRANT_MAP, op->dom);
 
     /*
      * All maptrack entry users check mt->flags first before using the
@@ -1434,7 +1434,7 @@ unmap_common(
         return;
     }
 
-    TRACE_1D(TRC_MEM_PAGE_GRANT_UNMAP, dom);
+    TRACE_TIME(TRC_MEM_PAGE_GRANT_UNMAP, dom);
 
     rgt = rd->grant_table;
 
@@ -2445,7 +2445,7 @@ gnttab_transfer(
         put_gfn(d, gop.mfn);
 #endif
 
-        TRACE_1D(TRC_MEM_PAGE_GRANT_TRANSFER, e->domain_id);
+        TRACE_TIME(TRC_MEM_PAGE_GRANT_TRANSFER, e->domain_id);
 
         /* Tell the guest about its new page frame. */
         grant_read_lock(e->grant_table);
diff --git a/xen/drivers/cpufreq/utility.c b/xen/drivers/cpufreq/utility.c
index dbf8985969b2..ede22650a387 100644
--- a/xen/drivers/cpufreq/utility.c
+++ b/xen/drivers/cpufreq/utility.c
@@ -368,7 +368,7 @@ int __cpufreq_driver_target(struct cpufreq_policy *policy,
         retval = alternative_call(cpufreq_driver.target,
                                   policy, target_freq, relation);
         if ( retval == 0 )
-            TRACE_2D(TRC_PM_FREQ_CHANGE, prev_freq/1000, policy->cur/1000);
+            TRACE_TIME(TRC_PM_FREQ_CHANGE, prev_freq / 1000, policy->cur / 1000);
     }
 
     return retval;
-- 
2.30.2


