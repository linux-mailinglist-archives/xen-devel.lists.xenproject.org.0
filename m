Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2650B4126F2
	for <lists+xen-devel@lfdr.de>; Mon, 20 Sep 2021 21:33:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.191158.341087 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mSP21-0001jB-UL; Mon, 20 Sep 2021 19:32:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 191158.341087; Mon, 20 Sep 2021 19:32:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mSP21-0001fo-RC; Mon, 20 Sep 2021 19:32:49 +0000
Received: by outflank-mailman (input) for mailman id 191158;
 Mon, 20 Sep 2021 19:32:49 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=F8X/=OK=citrix.com=Andrew.Cooper3@srs-us1.protection.inumbo.net>)
 id 1mSP20-0001fg-Td
 for xen-devel@lists.xenproject.org; Mon, 20 Sep 2021 19:32:48 +0000
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 87813f0c-1a49-11ec-b881-12813bfff9fa;
 Mon, 20 Sep 2021 19:32:45 +0000 (UTC)
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
X-Inumbo-ID: 87813f0c-1a49-11ec-b881-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1632166365;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version;
  bh=KHngWxU5NGMuCF7kJ9kXOWLSo5HfGZpL7wbVlWdiHGs=;
  b=HhmC59QoWoS+0IrCTn0l+OufQSvdRKRjrr+7n3hjqPF8ECsrZRS5QXbT
   yerPnhIJJl30oc+dVJZ7oQyRftD7qzeDFJZb4C4EyeBImhsMiZCjDZJud
   +nDRaa2p0U0W73LN4lI1WbGqxonbANqYEX16meks6x3EvKC1YrbxmQIIk
   w=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: pi1s2iXKKe6xDaf4/X8woomz9od6Bo+reevhKRa8KloSU62lyelURCQEOxNRez0SrqnxNnyfOO
 EWuDLbaVVcsmdEOv4cUmVsAMSLM6Vipx9E+T6OL48+1mmCz9VZzw2poWxgDRhwukluQDcR2WC9
 U+29uH840FAGd8GmTPjEiyPlv8aJ2UHblcUVvWO0aLN43T/wGeqI/r7e7gH8L7hSnqLY8IfrUP
 hCtxZZBWJ7CQ7P6LQvqGu4su4ErOFL+V10k2l5kAKhT3sduKv3hwadz6NcK3kjw7vt9PcgxRms
 hqPHXJsBTtz5uhjm6hS6ilae
X-SBRS: 5.1
X-MesageID: 54949765
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:KFRwu6jDGXmH/etxcr1NOqxKX161vBcKZh0ujC45NGQN5FlHY01je
 htvWWCDMviNMWf2f9sna4SyoEsF757QyYJrTwturH9mRHgb9cadCdqndUqhZCn6wu8v7a5EA
 2fyTvGacajYm1eF/k/F3oAMKRCQ7InQLlbGILes1htZGEk0FU/NtTo5w7Rg2t8y2YDia++wk
 YiaT/P3aQfNNwFcagr424rbwP+4lK2v0N+wlgVWicFj5DcypVFMZH4sDfjZw0/DaptVBoaHq
 9Prl9lVyI97EyAFUbtJmp6jGqEDryW70QKm0hK6UID66vROS7BbPg/W+5PwZG8O4whlkeydx
 /1vuoS0SB0YA5TDo/sPeQRnSCN5Za1ZreqvzXiX6aR/zmXDenrohf5vEFs3LcsT/eMf7WNmr
 KJCbmpXN1ba2rzwkOnTpupE36zPKOHCOo8Ft24m5jbeFfs8GrjIQrnQ5M8e1zA17ixLNauCN
 pZINmQyBPjGSxNmP0YyLpcUp+KXn0vPImRR8l+Oh5NitgA/yyQuieOwYbI5YOeiXt5Jl0yVo
 mbH+WXRARwAMtGbjz2f/RqEmevnjS79HoUIG9WQ9ONugVCV7nweDlsRT1TTiem0jAuyVsxSL
 2QQ+zEytu4i+UqzVN7/Uhak5nmesXY0WsVSO/037hmXzajZ6BrfAXILJhZjQtE7sM49RRQxy
 0SE2djuAFRSXKa9ECzHsO3O9HXrZHZTfTRqiTI4oRUtwdb7pIApvy/2Qe18AoSosYb3Hmnw3
 GXfxMQhvIn/nfLnxo3iowue02n998CTJuImzl6IBTP+t2uVcKbgPtbxuAaBtZ6sOa7EFgHpg
 ZQSpySJAAni57m2nSqRSa0mGLiz7p5p2xWN3AYyQ/HNG9mrkkNPnLy8Ahklfy+F0e5eIFcFh
 XM/XisLv/du0IOCN/MfXm5II51CIVLc+THZuhf8NYAmX3SMXFXfoHEGibC4hjiw+KTTrU3PE
 cjCKpv9ZZrrIY9m0CC3V48gPUwDn3tlrV4/savTlkz9uZLHPSb9Ye5cbDOmM7BohIvZ8V692
 4sOaKO3J+B3DbSWjt//qtVIczjn7BETWPjLliCgXrTSelY5QD5xVaC5LHFIU9UNopm5X9zgp
 hmVMnK0AnKm7ZEeAQnVOH1ldp31WpNz8SAyMSA2ZA760Hk/e4e/qqwYcsJvL7Ug8eViy99yT
 uUEJJrcUqgeFGyf9mRPd4T5oaxjaA+v2VCEMR26bWVtZJVnXQHIpIPpJ1O96CkUAyOrnsIiu
 Ln8hBjDSJ8OSl06XsbbYf6i1X2run0ZlL4gVkfEOIALKk7t7JJrO2r6ifpue5MALhDKxz270
 QeKAEhH+bmR8tFtqNSQ3PKKtYakFed6D3F2JWiD4ObkLzTe80qi3ZREDLSCcwfCWT6m466lf
 +hUka3xaaVVgFZQvoNgOL931qZitcD3rrpXwwk4TnXGa1OnVuFpLnWchJQds6RMwvlSuBesW
 1LJ8d5fYO3bNMTgGV8XBQwkcuXciq1ExmiMtaw4cBfg+St63LubSkEDbRCDhRtUIKZxLI54k
 /wqv9Qb6lDnhxcnWjpcYvu4K4hYwqQ8bpga
IronPort-HdrOrdr: A9a23:fEdAEa01z0WvkSNGVUST+AqjBLAkLtp133Aq2lEZdPRUGvb3qy
 nOpoVj6faaslYssR0b9exofZPwJE80lqQFh7X5X43SPzUO0VHAROoJgLcKgQeQfxEWntQtsp
 uIGJIeNDSfNzdHZL7BkWuFL+o=
X-IronPort-AV: E=Sophos;i="5.85,309,1624334400"; 
   d="scan'208";a="54949765"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	<George.Dunlap@eu.citrix.com>, Ian Jackson <iwj@xenproject.org>, Jan Beulich
	<JBeulich@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu
	<wl@xen.org>, Julien Grall <julien@xen.org>
Subject: [PATCH v2.1 14/12] xen: Switch to new TRACE() API
Date: Mon, 20 Sep 2021 20:32:34 +0100
Message-ID: <20210920193234.19409-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20210920172529.24932-1-andrew.cooper3@citrix.com>
References: <20210920172529.24932-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain

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
   vmx_cr_access()'s LMSW path, is gets adjusted to use TRACE_PARAM64().
 * TRACE_?D() and TRACE_2_LONG_*() change to TRACE_TIME() as cycles is always.
 * HVMTRACE_ND() is opencoded for VMENTRY/VMEXIT records to include cycles.
   These are converted to TRACE_TIME(), with the old modifier parameter
   expressed as an OR at the callsite.  One callsite, svm_vmenter_helper() had
   a nested tb_init_done check, which is dropped.  (The optimiser also spotted
   this, which is why it doesn't manifest as a binary difference.)
 * All HVMTRACE_?D() change to TRACE() as cycles is explicitly skipped.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: George Dunlap <George.Dunlap@eu.citrix.com>
CC: Ian Jackson <iwj@xenproject.org>
CC: Jan Beulich <JBeulich@suse.com>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Wei Liu <wl@xen.org>
CC: Julien Grall <julien@xen.org>

v2.1:
 * New

I'm in two minds as to whether to split this up by subsystem or not.  It is
95% x86, and isn't a massive patch.
---
 xen/arch/x86/acpi/cpu_idle.c  | 12 +++++-----
 xen/arch/x86/compat.c         |  4 ++--
 xen/arch/x86/cpu/mwait-idle.c |  6 ++---
 xen/arch/x86/emul-i8254.c     | 14 +++++------
 xen/arch/x86/hvm/emulate.c    |  8 +++----
 xen/arch/x86/hvm/hpet.c       |  6 ++---
 xen/arch/x86/hvm/hvm.c        | 16 ++++++-------
 xen/arch/x86/hvm/rtc.c        | 12 +++++-----
 xen/arch/x86/hvm/svm/intr.c   |  6 ++---
 xen/arch/x86/hvm/svm/svm.c    | 40 +++++++++++++++-----------------
 xen/arch/x86/hvm/vlapic.c     | 29 +++++++++++------------
 xen/arch/x86/hvm/vmx/intr.c   |  6 ++---
 xen/arch/x86/hvm/vmx/vmx.c    | 54 +++++++++++++++++++++----------------------
 xen/arch/x86/hvm/vpic.c       | 13 +++++------
 xen/arch/x86/irq.c            | 14 +++++------
 xen/arch/x86/traps.c          |  2 +-
 xen/common/domain.c           |  4 ++--
 xen/common/grant_table.c      |  6 ++---
 xen/common/sched/core.c       | 48 ++++++++++++++++++--------------------
 xen/common/sched/credit.c     | 30 +++++++++++-------------
 xen/drivers/cpufreq/utility.c |  2 +-
 21 files changed, 159 insertions(+), 173 deletions(-)

diff --git a/xen/arch/x86/acpi/cpu_idle.c b/xen/arch/x86/acpi/cpu_idle.c
index d788c8bffc84..98cbb8dd8316 100644
--- a/xen/arch/x86/acpi/cpu_idle.c
+++ b/xen/arch/x86/acpi/cpu_idle.c
@@ -752,7 +752,7 @@ static void acpi_processor_idle(void)
             /* Get start time (ticks) */
             t1 = alternative_call(cpuidle_get_tick);
             /* Trace cpu idle entry */
-            TRACE_4D(TRC_PM_IDLE_ENTRY, cx->idx, t1, exp, pred);
+            TRACE_TIME(TRC_PM_IDLE_ENTRY, cx->idx, t1, exp, pred);
 
             update_last_cx_stat(power, cx, t1);
 
@@ -762,8 +762,8 @@ static void acpi_processor_idle(void)
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
@@ -783,7 +783,7 @@ static void acpi_processor_idle(void)
         /* Get start time (ticks) */
         t1 = alternative_call(cpuidle_get_tick);
         /* Trace cpu idle entry */
-        TRACE_4D(TRC_PM_IDLE_ENTRY, cx->idx, t1, exp, pred);
+        TRACE_TIME(TRC_PM_IDLE_ENTRY, cx->idx, t1, exp, pred);
 
         update_last_cx_stat(power, cx, t1);
 
@@ -838,8 +838,8 @@ static void acpi_processor_idle(void)
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
index 58b202f701d5..e4e09f34b87e 100644
--- a/xen/arch/x86/compat.c
+++ b/xen/arch/x86/compat.c
@@ -42,8 +42,8 @@ long do_sched_op_compat(int cmd, unsigned long arg)
         return fn(cmd, guest_handle_from_ptr(NULL, void));
 
     case SCHEDOP_shutdown:
-        TRACE_3D(TRC_SCHED_SHUTDOWN,
-                 current->domain->domain_id, current->vcpu_id, arg);
+        TRACE_TIME(TRC_SCHED_SHUTDOWN,
+                   current->domain->domain_id, current->vcpu_id, arg);
         domain_shutdown(current->domain, (u8)arg);
         break;
 
diff --git a/xen/arch/x86/cpu/mwait-idle.c b/xen/arch/x86/cpu/mwait-idle.c
index f0c6ff9d5229..43567865764b 100644
--- a/xen/arch/x86/cpu/mwait-idle.c
+++ b/xen/arch/x86/cpu/mwait-idle.c
@@ -808,7 +808,7 @@ static void mwait_idle(void)
 		lapic_timer_off();
 
 	before = alternative_call(cpuidle_get_tick);
-	TRACE_4D(TRC_PM_IDLE_ENTRY, cx->type, before, exp, pred);
+	TRACE_TIME(TRC_PM_IDLE_ENTRY, cx->type, before, exp, pred);
 
 	update_last_cx_stat(power, cx, before);
 
@@ -819,8 +819,8 @@ static void mwait_idle(void)
 
 	cstate_restore_tsc();
 	trace_exit_reason(irq_traced);
-	TRACE_6D(TRC_PM_IDLE_EXIT, cx->type, after,
-		irq_traced[0], irq_traced[1], irq_traced[2], irq_traced[3]);
+	TRACE_TIME(TRC_PM_IDLE_EXIT, cx->type, after,
+		   irq_traced[0], irq_traced[1], irq_traced[2], irq_traced[3]);
 
 	/* Now back in C0. */
 	update_idle_stats(power, cx, before, after);
diff --git a/xen/arch/x86/emul-i8254.c b/xen/arch/x86/emul-i8254.c
index 050c784702af..19b5c95af216 100644
--- a/xen/arch/x86/emul-i8254.c
+++ b/xen/arch/x86/emul-i8254.c
@@ -159,7 +159,7 @@ static int pit_get_gate(PITState *pit, int channel)
 static void pit_time_fired(struct vcpu *v, void *priv)
 {
     uint64_t *count_load_time = priv;
-    TRACE_0D(TRC_HVM_EMUL_PIT_TIMER_CB);
+    TRACE_TIME(TRC_HVM_EMUL_PIT_TIMER_CB);
     *count_load_time = get_guest_time(v);
 }
 
@@ -189,19 +189,19 @@ static void pit_load_count(PITState *pit, int channel, int val)
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
@@ -385,7 +385,7 @@ void pit_stop_channel0_irq(PITState *pit)
     if ( !has_vpit(current->domain) )
         return;
 
-    TRACE_0D(TRC_HVM_EMUL_PIT_STOP_TIMER);
+    TRACE_TIME(TRC_HVM_EMUL_PIT_STOP_TIMER);
     spin_lock(&pit->lock);
     destroy_periodic_time(&pit->pt0);
     spin_unlock(&pit->lock);
@@ -454,7 +454,7 @@ void pit_reset(struct domain *d)
 
     if ( is_hvm_domain(d) )
     {
-        TRACE_0D(TRC_HVM_EMUL_PIT_STOP_TIMER);
+        TRACE_TIME(TRC_HVM_EMUL_PIT_STOP_TIMER);
         destroy_periodic_time(&pit->pt0);
         pit->pt0.source = PTSRC_isa;
     }
@@ -499,7 +499,7 @@ void pit_deinit(struct domain *d)
 
     if ( is_hvm_domain(d) )
     {
-        TRACE_0D(TRC_HVM_EMUL_PIT_STOP_TIMER);
+        TRACE_TIME(TRC_HVM_EMUL_PIT_STOP_TIMER);
         destroy_periodic_time(&pit->pt0);
     }
 }
diff --git a/xen/arch/x86/hvm/emulate.c b/xen/arch/x86/hvm/emulate.c
index 425c8ddd9779..f863a19df311 100644
--- a/xen/arch/x86/hvm/emulate.c
+++ b/xen/arch/x86/hvm/emulate.c
@@ -2183,7 +2183,7 @@ static int hvmemul_read_cr(
     case 3:
     case 4:
         *val = current->arch.hvm.guest_cr[reg];
-        HVMTRACE_LONG_2D(CR_READ, reg, TRC_PAR_LONG(*val));
+        TRACE(TRC_HVM_CR_READ64, reg, TRACE_PARAM64(*val));
         return X86EMUL_OKAY;
     default:
         break;
@@ -2199,7 +2199,7 @@ static int hvmemul_write_cr(
 {
     int rc;
 
-    HVMTRACE_LONG_2D(CR_WRITE, reg, TRC_PAR_LONG(val));
+    TRACE(TRC_HVM_CR_WRITE64, reg, TRACE_PARAM64(val));
     switch ( reg )
     {
     case 0:
@@ -2244,7 +2244,7 @@ static int hvmemul_read_xcr(
     int rc = x86emul_read_xcr(reg, val, ctxt);
 
     if ( rc == X86EMUL_OKAY )
-        HVMTRACE_LONG_2D(XCR_READ, reg, TRC_PAR_LONG(*val));
+        TRACE(TRC_HVM_XCR_READ64, reg, TRACE_PARAM64(*val));
 
     return rc;
 }
@@ -2254,7 +2254,7 @@ static int hvmemul_write_xcr(
     uint64_t val,
     struct x86_emulate_ctxt *ctxt)
 {
-    HVMTRACE_LONG_2D(XCR_WRITE, reg, TRC_PAR_LONG(val));
+    TRACE(TRC_HVM_XCR_WRITE64, reg, TRACE_PARAM64(val));
 
     return x86emul_write_xcr(reg, val, ctxt);
 }
diff --git a/xen/arch/x86/hvm/hpet.c b/xen/arch/x86/hvm/hpet.c
index 8267f0b8a278..5873bb8a506d 100644
--- a/xen/arch/x86/hvm/hpet.c
+++ b/xen/arch/x86/hvm/hpet.c
@@ -212,7 +212,7 @@ static void hpet_stop_timer(HPETState *h, unsigned int tn,
 {
     ASSERT(tn < HPET_TIMER_NUM);
     ASSERT(rw_is_write_locked(&h->lock));
-    TRACE_1D(TRC_HVM_EMUL_HPET_STOP_TIMER, tn);
+    TRACE_TIME(TRC_HVM_EMUL_HPET_STOP_TIMER, tn);
     destroy_periodic_time(&h->pt[tn]);
     /* read the comparator to get it updated so a read while stopped will
      * return the expected value. */
@@ -316,8 +316,8 @@ static void hpet_set_timer(HPETState *h, unsigned int tn,
     if ( !oneshot )
         period_ns = hpet_tick_to_ns(h, h->hpet.period[tn]);
 
-    TRACE_2_LONG_4D(TRC_HVM_EMUL_HPET_START_TIMER, tn, irq,
-                    TRC_PAR_LONG(diff_ns), TRC_PAR_LONG(period_ns));
+    TRACE_TIME(TRC_HVM_EMUL_HPET_START_TIMER, tn, irq,
+               TRACE_PARAM64(diff_ns), TRACE_PARAM64(period_ns));
 
     create_periodic_time(vhpet_vcpu(h), &h->pt[tn], diff_ns, period_ns,
                          irq, timer_level(h, tn) ? hpet_timer_fired : NULL,
diff --git a/xen/arch/x86/hvm/hvm.c b/xen/arch/x86/hvm/hvm.c
index 09cf6330ad26..fa211d14afd8 100644
--- a/xen/arch/x86/hvm/hvm.c
+++ b/xen/arch/x86/hvm/hvm.c
@@ -1679,7 +1679,7 @@ void hvm_hlt(unsigned int eflags)
 
     do_sched_op(SCHEDOP_block, guest_handle_from_ptr(NULL, void));
 
-    HVMTRACE_1D(HLT, /* pending = */ vcpu_runnable(curr));
+    TRACE(TRC_HVM_HLT, /* pending = */ vcpu_runnable(curr));
 }
 
 void hvm_triple_fault(void)
@@ -2136,7 +2136,7 @@ int hvm_mov_to_cr(unsigned int cr, unsigned int gpr)
     unsigned long val = *decode_gpr(guest_cpu_user_regs(), gpr);
     int rc;
 
-    HVMTRACE_LONG_2D(CR_WRITE, cr, TRC_PAR_LONG(val));
+    TRACE(TRC_HVM_CR_WRITE64, cr, TRACE_PARAM64(val));
     HVM_DBG_LOG(DBG_LEVEL_1, "CR%u, value = %lx", cr, val);
 
     switch ( cr )
@@ -2201,7 +2201,7 @@ int hvm_mov_from_cr(unsigned int cr, unsigned int gpr)
     }
 
     *reg = val;
-    HVMTRACE_LONG_2D(CR_READ, cr, TRC_PAR_LONG(val));
+    TRACE(TRC_HVM_CR_READ64, cr, TRACE_PARAM64(val));
     HVM_DBG_LOG(DBG_LEVEL_VMMU, "CR%u, value = %lx", cr, val);
 
     return X86EMUL_OKAY;
@@ -3463,7 +3463,7 @@ int hvm_vmexit_cpuid(struct cpu_user_regs *regs, unsigned int inst_len)
     }
 
     guest_cpuid(curr, leaf, subleaf, &res);
-    HVMTRACE_6D(CPUID, leaf, subleaf, res.a, res.b, res.c, res.d);
+    TRACE(TRC_HVM_CPUID, leaf, subleaf, res.a, res.b, res.c, res.d);
 
     regs->rax = res.a;
     regs->rbx = res.b;
@@ -3477,7 +3477,7 @@ void hvm_rdtsc_intercept(struct cpu_user_regs *regs)
 {
     msr_split(regs, hvm_get_guest_tsc(current));
 
-    HVMTRACE_2D(RDTSC, regs->eax, regs->edx);
+    TRACE(TRC_HVM_RDTSC, regs->eax, regs->edx);
 }
 
 int hvm_msr_read_intercept(unsigned int msr, uint64_t *msr_content)
@@ -3584,8 +3584,7 @@ int hvm_msr_read_intercept(unsigned int msr, uint64_t *msr_content)
     }
 
  out:
-    HVMTRACE_3D(MSR_READ, msr,
-                (uint32_t)*msr_content, (uint32_t)(*msr_content >> 32));
+    TRACE(TRC_HVM_MSR_READ, msr, TRACE_PARAM64(*msr_content));
     return ret;
 
  gp_fault:
@@ -3601,8 +3600,7 @@ int hvm_msr_write_intercept(unsigned int msr, uint64_t msr_content,
     struct domain *d = v->domain;
     int ret;
 
-    HVMTRACE_3D(MSR_WRITE, msr,
-               (uint32_t)msr_content, (uint32_t)(msr_content >> 32));
+    TRACE(TRC_HVM_MSR_WRITE, msr, TRACE_PARAM64(msr_content));
 
     if ( may_defer && unlikely(monitored_msr(v->domain, msr)) )
     {
diff --git a/xen/arch/x86/hvm/rtc.c b/xen/arch/x86/hvm/rtc.c
index 3150f5f1479b..6c133eabf5d4 100644
--- a/xen/arch/x86/hvm/rtc.c
+++ b/xen/arch/x86/hvm/rtc.c
@@ -92,7 +92,7 @@ static void rtc_pf_callback(struct vcpu *v, void *opaque)
          && ++(s->pt_dead_ticks) >= 10 )
     {
         /* VM is ignoring its RTC; no point in running the timer */
-        TRACE_0D(TRC_HVM_EMUL_RTC_STOP_TIMER);
+        TRACE_TIME(TRC_HVM_EMUL_RTC_STOP_TIMER);
         destroy_periodic_time(&s->pt);
         s->period = 0;
     }
@@ -155,7 +155,7 @@ static void rtc_timer_update(RTCState *s)
                     delta = period - ((now - s->start_time) % period);
                 if ( s->hw.cmos_data[RTC_REG_B] & RTC_PIE )
                 {
-                    TRACE_2D(TRC_HVM_EMUL_RTC_START_TIMER, delta, period);
+                    TRACE_TIME(TRC_HVM_EMUL_RTC_START_TIMER, delta, period);
                     create_periodic_time(v, &s->pt, delta, period,
                                          RTC_IRQ, rtc_pf_callback, s, false);
                 }
@@ -166,7 +166,7 @@ static void rtc_timer_update(RTCState *s)
         }
         /* fall through */
     default:
-        TRACE_0D(TRC_HVM_EMUL_RTC_STOP_TIMER);
+        TRACE_TIME(TRC_HVM_EMUL_RTC_STOP_TIMER);
         destroy_periodic_time(&s->pt);
         s->period = 0;
         break;
@@ -519,7 +519,7 @@ static int rtc_ioport_write(void *opaque, uint32_t addr, uint32_t data)
         rtc_update_irq(s);
         if ( (data ^ orig) & RTC_PIE )
         {
-            TRACE_0D(TRC_HVM_EMUL_RTC_STOP_TIMER);
+            TRACE_TIME(TRC_HVM_EMUL_RTC_STOP_TIMER);
             destroy_periodic_time(&s->pt);
             s->period = 0;
             rtc_timer_update(s);
@@ -802,7 +802,7 @@ void rtc_reset(struct domain *d)
     if ( !has_vrtc(d) )
         return;
 
-    TRACE_0D(TRC_HVM_EMUL_RTC_STOP_TIMER);
+    TRACE_TIME(TRC_HVM_EMUL_RTC_STOP_TIMER);
     destroy_periodic_time(&s->pt);
     s->period = 0;
     s->pt.source = PTSRC_isa;
@@ -877,7 +877,7 @@ void rtc_deinit(struct domain *d)
 
     spin_barrier(&s->lock);
 
-    TRACE_0D(TRC_HVM_EMUL_RTC_STOP_TIMER);
+    TRACE_TIME(TRC_HVM_EMUL_RTC_STOP_TIMER);
     destroy_periodic_time(&s->pt);
     kill_timer(&s->update_timer);
     kill_timer(&s->update_timer2);
diff --git a/xen/arch/x86/hvm/svm/intr.c b/xen/arch/x86/hvm/svm/intr.c
index 7f815d230785..122c9d7fbf14 100644
--- a/xen/arch/x86/hvm/svm/intr.c
+++ b/xen/arch/x86/hvm/svm/intr.c
@@ -101,8 +101,8 @@ static void svm_enable_intr_window(struct vcpu *v, struct hvm_intack intack)
         }
     }
 
-    HVMTRACE_3D(INTR_WINDOW, intack.vector, intack.source,
-                vmcb->event_inj.v ? vmcb->event_inj.vector : -1);
+    TRACE(TRC_HVM_INTR_WINDOW, intack.vector, intack.source,
+          vmcb->event_inj.v ? vmcb->event_inj.vector : -1);
 
     /*
      * Create a dummy virtual interrupt to intercept as soon as the
@@ -217,7 +217,7 @@ void svm_intr_assist(void)
     }
     else
     {
-        HVMTRACE_2D(INJ_VIRQ, intack.vector, /*fake=*/ 0);
+        TRACE(TRC_HVM_INJ_VIRQ, intack.vector, /*fake=*/ 0);
         svm_inject_extint(v, intack.vector);
         pt_intr_post(v, intack);
     }
diff --git a/xen/arch/x86/hvm/svm/svm.c b/xen/arch/x86/hvm/svm/svm.c
index f0e10dec046e..b98a2dd71d1e 100644
--- a/xen/arch/x86/hvm/svm/svm.c
+++ b/xen/arch/x86/hvm/svm/svm.c
@@ -1049,10 +1049,8 @@ void svm_vmenter_helper(const struct cpu_user_regs *regs)
 
     svm_asid_handle_vmrun();
 
-    if ( unlikely(tb_init_done) )
-        HVMTRACE_ND(VMENTRY,
-                    nestedhvm_vcpu_in_guestmode(curr) ? TRC_HVM_NESTEDFLAG : 0,
-                    1/*cycles*/);
+    TRACE_TIME(TRC_HVM_VMENTRY |
+               (nestedhvm_vcpu_in_guestmode(curr) ? TRC_HVM_NESTEDFLAG : 0));
 
     svm_sync_vmcb(curr, vmcb_needs_vmsave);
 
@@ -1424,10 +1422,10 @@ static void svm_inject_event(const struct x86_event *event)
 
     if ( _event.vector == TRAP_page_fault &&
          _event.type == X86_EVENTTYPE_HW_EXCEPTION )
-        HVMTRACE_LONG_2D(PF_INJECT, _event.error_code,
-                         TRC_PAR_LONG(_event.cr2));
+        TRACE(TRC_HVM_PF_INJECT64, _event.error_code,
+              TRACE_PARAM64(_event.cr2));
     else
-        HVMTRACE_2D(INJ_EXC, _event.vector, _event.error_code);
+        TRACE(TRC_HVM_INJ_EXC, _event.vector, _event.error_code);
 }
 
 static bool svm_event_pending(const struct vcpu *v)
@@ -1787,7 +1785,7 @@ static void svm_dr_access(struct vcpu *v, struct cpu_user_regs *regs)
 {
     struct vmcb_struct *vmcb = vcpu_nestedhvm(v).nv_n1vmcx;
 
-    HVMTRACE_0D(DR_WRITE);
+    TRACE(TRC_HVM_DR_WRITE);
     __restore_debug_registers(vmcb, v);
 }
 
@@ -2436,7 +2434,7 @@ static void svm_invlpga_intercept(
 
 static void svm_invlpg_intercept(unsigned long linear)
 {
-    HVMTRACE_LONG_2D(INVLPG, 0, TRC_PAR_LONG(linear));
+    TRACE(TRC_HVM_INVLPG64, 0, TRACE_PARAM64(linear));
     paging_invlpg(current, linear);
 }
 
@@ -2564,11 +2562,11 @@ void svm_vmexit_handler(struct cpu_user_regs *regs)
     exit_reason = vmcb->exitcode;
 
     if ( hvm_long_mode_active(v) )
-        HVMTRACE_ND(VMEXIT64, vcpu_guestmode ? TRC_HVM_NESTEDFLAG : 0,
-                    1/*cycles*/, exit_reason, TRC_PAR_LONG(regs->rip));
+        TRACE_TIME(TRC_HVM_VMEXIT64 | (vcpu_guestmode ? TRC_HVM_NESTEDFLAG : 0),
+                   exit_reason, TRACE_PARAM64(regs->rip));
     else
-        HVMTRACE_ND(VMEXIT, vcpu_guestmode ? TRC_HVM_NESTEDFLAG : 0,
-                    1/*cycles*/, exit_reason, regs->eip);
+        TRACE_TIME(TRC_HVM_VMEXIT | (vcpu_guestmode ? TRC_HVM_NESTEDFLAG : 0),
+                   exit_reason, regs->eip);
 
     if ( vcpu_guestmode )
     {
@@ -2660,17 +2658,17 @@ void svm_vmexit_handler(struct cpu_user_regs *regs)
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
@@ -2758,9 +2756,9 @@ void svm_vmexit_handler(struct cpu_user_regs *regs)
             if ( trace_will_trace_event(TRC_SHADOW) )
                 break;
             if ( hvm_long_mode_active(v) )
-                HVMTRACE_LONG_2D(PF_XEN, regs->error_code, TRC_PAR_LONG(va));
+                TRACE(TRC_HVM_PF_XEN64, regs->error_code, TRACE_PARAM64(va));
             else
-                HVMTRACE_2D(PF_XEN, regs->error_code, va);
+                TRACE(TRC_HVM_PF_XEN, regs->error_code, va);
             break;
         }
 
@@ -2769,7 +2767,7 @@ void svm_vmexit_handler(struct cpu_user_regs *regs)
     }
 
     case VMEXIT_EXCEPTION_AC:
-        HVMTRACE_1D(TRAP, TRAP_alignment_check);
+        TRACE(TRC_HVM_TRAP, TRAP_alignment_check);
         hvm_inject_hw_exception(TRAP_alignment_check, vmcb->exitinfo1);
         break;
 
@@ -2779,7 +2777,7 @@ void svm_vmexit_handler(struct cpu_user_regs *regs)
 
     /* Asynchronous event, handled when we STGI'd after the VMEXIT. */
     case VMEXIT_EXCEPTION_MC:
-        HVMTRACE_0D(MCE);
+        TRACE(TRC_HVM_MCE);
         svm_vmexit_mce_intercept(v, regs);
         break;
 
@@ -2917,7 +2915,7 @@ void svm_vmexit_handler(struct cpu_user_regs *regs)
         if ( (insn_len = svm_get_insn_len(v, INSTR_VMCALL)) == 0 )
             break;
         BUG_ON(vcpu_guestmode);
-        HVMTRACE_1D(VMMCALL, regs->eax);
+        TRACE(TRC_HVM_VMMCALL, regs->eax);
 
         if ( hvm_hypercall(regs) == HVM_HCALL_completed )
             __update_guest_eip(regs, insn_len);
diff --git a/xen/arch/x86/hvm/vlapic.c b/xen/arch/x86/hvm/vlapic.c
index b8c84458ffdc..30fd3b46ec4d 100644
--- a/xen/arch/x86/hvm/vlapic.c
+++ b/xen/arch/x86/hvm/vlapic.c
@@ -692,7 +692,7 @@ int guest_rdmsr_x2apic(const struct vcpu *v, uint32_t msr, uint64_t *val)
 
 static void vlapic_pt_cb(struct vcpu *v, void *data)
 {
-    TRACE_0D(TRC_HVM_EMUL_LAPIC_TIMER_CB);
+    TRACE_TIME(TRC_HVM_EMUL_LAPIC_TIMER_CB);
     *(s_time_t *)data = hvm_get_guest_time(v);
 }
 
@@ -746,9 +746,8 @@ static void vlapic_update_timer(struct vlapic *vlapic, uint32_t lvtt,
             delta = delta * vlapic->hw.timer_divisor / old_divisor;
         }
 
-        TRACE_2_LONG_3D(TRC_HVM_EMUL_LAPIC_START_TIMER, TRC_PAR_LONG(delta),
-                        TRC_PAR_LONG(is_periodic ? period : 0),
-                        vlapic->pt.irq);
+        TRACE_TIME(TRC_HVM_EMUL_LAPIC_START_TIMER, TRACE_PARAM64(delta),
+                   TRACE_PARAM64(is_periodic ? period : 0), vlapic->pt.irq);
 
         create_periodic_time(current, &vlapic->pt, delta,
                              is_periodic ? period : 0, vlapic->pt.irq,
@@ -768,7 +767,7 @@ static void vlapic_update_timer(struct vlapic *vlapic, uint32_t lvtt,
     }
     else
     {
-        TRACE_0D(TRC_HVM_EMUL_LAPIC_STOP_TIMER);
+        TRACE_TIME(TRC_HVM_EMUL_LAPIC_STOP_TIMER);
         destroy_periodic_time(&vlapic->pt);
         /*
          * From now, TMCCT should return 0 until TMICT is set again.
@@ -1202,8 +1201,8 @@ void vlapic_tdt_msr_set(struct vlapic *vlapic, uint64_t value)
 
         vlapic->hw.tdt_msr = value;
         /* .... reprogram tdt timer */
-        TRACE_2_LONG_3D(TRC_HVM_EMUL_LAPIC_START_TIMER, TRC_PAR_LONG(delta),
-                        TRC_PAR_LONG(0LL), vlapic->pt.irq);
+        TRACE_TIME(TRC_HVM_EMUL_LAPIC_START_TIMER, TRACE_PARAM64(delta),
+                   TRACE_PARAM64(0LL), vlapic->pt.irq);
         create_periodic_time(v, &vlapic->pt, delta, 0,
                              vlapic->pt.irq, vlapic_tdt_pt_cb,
                              &vlapic->timer_last_update, false);
@@ -1216,8 +1215,8 @@ void vlapic_tdt_msr_set(struct vlapic *vlapic, uint64_t value)
         /* trigger a timer event if needed */
         if ( value > 0 )
         {
-            TRACE_2_LONG_3D(TRC_HVM_EMUL_LAPIC_START_TIMER, TRC_PAR_LONG(0LL),
-                            TRC_PAR_LONG(0LL), vlapic->pt.irq);
+            TRACE_TIME(TRC_HVM_EMUL_LAPIC_START_TIMER, TRACE_PARAM64(0LL),
+                       TRACE_PARAM64(0LL), vlapic->pt.irq);
             create_periodic_time(v, &vlapic->pt, 0, 0,
                                  vlapic->pt.irq, vlapic_tdt_pt_cb,
                                  &vlapic->timer_last_update, false);
@@ -1226,7 +1225,7 @@ void vlapic_tdt_msr_set(struct vlapic *vlapic, uint64_t value)
         else
         {
             /* .... stop tdt timer */
-            TRACE_0D(TRC_HVM_EMUL_LAPIC_STOP_TIMER);
+            TRACE_TIME(TRC_HVM_EMUL_LAPIC_STOP_TIMER);
             destroy_periodic_time(&vlapic->pt);
         }
 
@@ -1276,7 +1275,7 @@ int vlapic_accept_pic_intr(struct vcpu *v)
     if ( target )
         accept = __vlapic_accept_pic_intr(v);
 
-    TRACE_2D(TRC_HVM_EMUL_LAPIC_PIC_INTR, target, accept);
+    TRACE_TIME(TRC_HVM_EMUL_LAPIC_PIC_INTR, target, accept);
 
     return target && accept;
 }
@@ -1427,7 +1426,7 @@ static void vlapic_do_init(struct vlapic *vlapic)
     vlapic_set_reg(vlapic, APIC_SPIV, 0xff);
     vlapic->hw.disabled |= VLAPIC_SW_DISABLED;
 
-    TRACE_0D(TRC_HVM_EMUL_LAPIC_STOP_TIMER);
+    TRACE_TIME(TRC_HVM_EMUL_LAPIC_STOP_TIMER);
     destroy_periodic_time(&vlapic->pt);
 }
 
@@ -1470,8 +1469,8 @@ static void lapic_rearm(struct vlapic *s)
               (uint32_t)tmict * s->hw.timer_divisor);
     is_periodic = vlapic_lvtt_period(s);
 
-    TRACE_2_LONG_3D(TRC_HVM_EMUL_LAPIC_START_TIMER, TRC_PAR_LONG(period),
-             TRC_PAR_LONG(is_periodic ? period : 0LL), s->pt.irq);
+    TRACE_TIME(TRC_HVM_EMUL_LAPIC_START_TIMER, TRACE_PARAM64(period),
+               TRACE_PARAM64(is_periodic ? period : 0LL), s->pt.irq);
 
     create_periodic_time(vlapic_vcpu(s), &s->pt, period,
                          is_periodic ? period : 0,
@@ -1650,7 +1649,7 @@ void vlapic_destroy(struct vcpu *v)
         return;
 
     tasklet_kill(&vlapic->init_sipi.tasklet);
-    TRACE_0D(TRC_HVM_EMUL_LAPIC_STOP_TIMER);
+    TRACE_TIME(TRC_HVM_EMUL_LAPIC_STOP_TIMER);
     destroy_periodic_time(&vlapic->pt);
     unmap_domain_page_global(vlapic->regs);
     free_domheap_page(vlapic->regs_page);
diff --git a/xen/arch/x86/hvm/vmx/intr.c b/xen/arch/x86/hvm/vmx/intr.c
index 80bfbb478782..303d07dc0a3a 100644
--- a/xen/arch/x86/hvm/vmx/intr.c
+++ b/xen/arch/x86/hvm/vmx/intr.c
@@ -79,8 +79,8 @@ static void vmx_enable_intr_window(struct vcpu *v, struct hvm_intack intack)
         unsigned long intr;
 
         __vmread(VM_ENTRY_INTR_INFO, &intr);
-        HVMTRACE_3D(INTR_WINDOW, intack.vector, intack.source,
-                    (intr & INTR_INFO_VALID_MASK) ? intr & 0xff : -1);
+        TRACE(TRC_HVM_INTR_WINDOW, intack.vector, intack.source,
+              (intr & INTR_INFO_VALID_MASK) ? intr & 0xff : -1);
     }
 
     if ( (intack.source == hvm_intsrc_nmi) && cpu_has_vmx_vnmi )
@@ -402,7 +402,7 @@ void vmx_intr_assist(void)
     }
     else
     {
-        HVMTRACE_2D(INJ_VIRQ, intack.vector, /*fake=*/ 0);
+        TRACE(TRC_HVM_INJ_VIRQ, intack.vector, /*fake=*/ 0);
         vmx_inject_extint(intack.vector, intack.source);
         pt_intr_post(v, intack);
     }
diff --git a/xen/arch/x86/hvm/vmx/vmx.c b/xen/arch/x86/hvm/vmx/vmx.c
index 974a25b34c41..47a5df20ebc1 100644
--- a/xen/arch/x86/hvm/vmx/vmx.c
+++ b/xen/arch/x86/hvm/vmx/vmx.c
@@ -1875,10 +1875,10 @@ static void vmx_inject_event(const struct x86_event *event)
 
     if ( (_event.vector == TRAP_page_fault) &&
          (_event.type == X86_EVENTTYPE_HW_EXCEPTION) )
-        HVMTRACE_LONG_2D(PF_INJECT, _event.error_code,
-                         TRC_PAR_LONG(curr->arch.hvm.guest_cr[2]));
+        TRACE(TRC_HVM_PF_INJECT64, _event.error_code,
+              TRACE_PARAM64(curr->arch.hvm.guest_cr[2]));
     else
-        HVMTRACE_2D(INJ_EXC, _event.vector, _event.error_code);
+        TRACE(TRC_HVM_INJ_EXC, _event.vector, _event.error_code);
 }
 
 static bool vmx_event_pending(const struct vcpu *v)
@@ -2783,7 +2783,7 @@ static void noinline vmx_dr_access(unsigned long exit_qualification,
 {
     struct vcpu *v = current;
 
-    HVMTRACE_0D(DR_WRITE);
+    TRACE(TRC_HVM_DR_WRITE);
 
     if ( !v->arch.hvm.flag_dr_dirty )
         __restore_debug_registers(v);
@@ -2795,7 +2795,7 @@ static void noinline vmx_dr_access(unsigned long exit_qualification,
 
 static void noinline vmx_invlpg_intercept(unsigned long linear)
 {
-    HVMTRACE_LONG_2D(INVLPG, /*invlpga=*/ 0, TRC_PAR_LONG(linear));
+    TRACE(TRC_HVM_INVLPG64, /*invlpga=*/ 0, TRACE_PARAM64(linear));
     paging_invlpg(current, linear);
 }
 
@@ -2843,7 +2843,7 @@ static int vmx_cr_access(cr_access_qual_t qual)
         hvm_monitor_crX(CR0, value, old);
         curr->arch.hvm.guest_cr[0] = value;
         vmx_update_guest_cr(curr, 0, 0);
-        HVMTRACE_0D(CLTS);
+        TRACE(TRC_HVM_CLTS);
         break;
     }
 
@@ -2856,7 +2856,7 @@ static int vmx_cr_access(cr_access_qual_t qual)
         value = (value & ~(X86_CR0_MP|X86_CR0_EM|X86_CR0_TS)) |
                 (qual.lmsw_data &
                  (X86_CR0_PE|X86_CR0_MP|X86_CR0_EM|X86_CR0_TS));
-        HVMTRACE_LONG_1D(LMSW, value);
+        TRACE(TRC_HVM_LMSW64, TRACE_PARAM64(value));
 
         if ( (rc = hvm_set_cr0(value, true)) == X86EMUL_EXCEPTION )
             hvm_inject_hw_exception(TRAP_gp_fault, 0);
@@ -3522,7 +3522,7 @@ static void vmx_do_extint(struct cpu_user_regs *regs)
     BUG_ON(!(vector & INTR_INFO_VALID_MASK));
 
     vector &= INTR_INFO_VECTOR_MASK;
-    HVMTRACE_1D(INTR, vector);
+    TRACE(TRC_HVM_INTR, vector);
 
     regs->entry_vector = vector;
     do_IRQ(regs);
@@ -3662,7 +3662,7 @@ static void vmx_failed_vmentry(unsigned int exit_reason,
 
     case EXIT_REASON_MCE_DURING_VMENTRY:
         printk("MCE\n");
-        HVMTRACE_0D(MCE);
+        TRACE(TRC_HVM_MCE);
         /* Already handled. */
         break;
 
@@ -3703,7 +3703,7 @@ static int vmx_handle_eoi_write(void)
     {
         update_guest_eip(); /* Safe: APIC data write */
         vlapic_EOI_set(vcpu_vlapic(current));
-        HVMTRACE_0D(VLAPIC);
+        TRACE(TRC_HVM_VLAPIC);
         return 1;
     }
 
@@ -3864,10 +3864,9 @@ void vmx_vmexit_handler(struct cpu_user_regs *regs)
     __vmread(VM_EXIT_REASON, &exit_reason);
 
     if ( hvm_long_mode_active(v) )
-        HVMTRACE_ND(VMEXIT64, 0, 1/*cycles*/, exit_reason,
-                    TRC_PAR_LONG(regs->rip));
+        TRACE_TIME(TRC_HVM_VMEXIT64, exit_reason, TRACE_PARAM64(regs->rip));
     else
-        HVMTRACE_ND(VMEXIT, 0, 1/*cycles*/, exit_reason, regs->eip);
+        TRACE_TIME(TRC_HVM_VMEXIT, exit_reason, regs->eip);
 
     perfc_incra(vmexits, exit_reason);
 
@@ -3969,7 +3968,7 @@ void vmx_vmexit_handler(struct cpu_user_regs *regs)
         default:
                 perfc_incr(realmode_exits);
                 v->arch.hvm.vmx.vmx_emulate = 1;
-                HVMTRACE_0D(REALMODE_EMULATE);
+                TRACE(TRC_HVM_REALMODE_EMULATE);
                 return;
             }
         case EXIT_REASON_EXTERNAL_INTERRUPT:
@@ -4032,7 +4031,7 @@ void vmx_vmexit_handler(struct cpu_user_regs *regs)
              * Table 23-1, "Exit Qualification for Debug Exceptions").
              */
             __vmread(EXIT_QUALIFICATION, &exit_qualification);
-            HVMTRACE_1D(TRAP_DEBUG, exit_qualification);
+            TRACE(TRC_HVM_TRAP_DEBUG, exit_qualification);
             __restore_debug_registers(v);
             write_debugreg(6, exit_qualification | DR_STATUS_RESERVED_ONE);
 
@@ -4094,7 +4093,7 @@ void vmx_vmexit_handler(struct cpu_user_regs *regs)
                 domain_pause_for_debugger();
             break;
         case TRAP_int3:
-            HVMTRACE_1D(TRAP, vector);
+            TRACE(TRC_HVM_TRAP, vector);
             if ( !v->domain->debugger_attached )
             {
                 unsigned long insn_len;
@@ -4119,7 +4118,7 @@ void vmx_vmexit_handler(struct cpu_user_regs *regs)
             }
             break;
         case TRAP_no_device:
-            HVMTRACE_1D(TRAP, vector);
+            TRACE(TRC_HVM_TRAP, vector);
             vmx_fpu_dirty_intercept();
             break;
         case TRAP_page_fault:
@@ -4137,37 +4136,36 @@ void vmx_vmexit_handler(struct cpu_user_regs *regs)
                 if ( trace_will_trace_event(TRC_SHADOW) )
                     break;
                 if ( hvm_long_mode_active(v) )
-                    HVMTRACE_LONG_2D(PF_XEN, regs->error_code,
-                                     TRC_PAR_LONG(exit_qualification) );
+                    TRACE(TRC_HVM_PF_XEN64, regs->error_code,
+                          TRACE_PARAM64(exit_qualification));
                 else
-                    HVMTRACE_2D(PF_XEN,
-                                regs->error_code, exit_qualification );
+                    TRACE(TRC_HVM_PF_XEN, regs->error_code, exit_qualification);
                 break;
             }
 
             hvm_inject_page_fault(regs->error_code, exit_qualification);
             break;
         case TRAP_alignment_check:
-            HVMTRACE_1D(TRAP, vector);
+            TRACE(TRC_HVM_TRAP, vector);
             vmx_propagate_intr(intr_info);
             break;
         case TRAP_nmi:
             if ( MASK_EXTR(intr_info, INTR_INFO_INTR_TYPE_MASK) !=
                  X86_EVENTTYPE_NMI )
                 goto exit_and_crash;
-            HVMTRACE_0D(NMI);
+            TRACE(TRC_HVM_NMI);
             /* Already handled above. */
             break;
         case TRAP_machine_check:
-            HVMTRACE_0D(MCE);
+            TRACE(TRC_HVM_MCE);
             /* Already handled above. */
             break;
         case TRAP_invalid_op:
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
@@ -4255,7 +4253,7 @@ void vmx_vmexit_handler(struct cpu_user_regs *regs)
         break;
 
     case EXIT_REASON_VMCALL:
-        HVMTRACE_1D(VMMCALL, regs->eax);
+        TRACE(TRC_HVM_VMMCALL, regs->eax);
 
         if ( hvm_hypercall(regs) == HVM_HCALL_completed )
             update_guest_eip(); /* Safe: VMCALL */
@@ -4644,7 +4642,7 @@ bool vmx_vmenter_helper(const struct cpu_user_regs *regs)
     if ( unlikely(curr->arch.hvm.vmx.lbr_flags & LBR_FIXUP_MASK) )
         lbr_fixup();
 
-    HVMTRACE_ND(VMENTRY, 0, 1/*cycles*/);
+    TRACE_TIME(TRC_HVM_VMENTRY);
 
     __vmwrite(GUEST_RIP,    regs->rip);
     __vmwrite(GUEST_RSP,    regs->rsp);
diff --git a/xen/arch/x86/hvm/vpic.c b/xen/arch/x86/hvm/vpic.c
index 91c2c6983393..1360f40b1044 100644
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
@@ -483,7 +482,7 @@ void vpic_irq_positive_edge(struct domain *d, int irq)
     ASSERT(irq <= 15);
     ASSERT(vpic_is_locked(vpic));
 
-    TRACE_1D(TRC_HVM_EMUL_PIC_POSEDGE, irq);
+    TRACE_TIME(TRC_HVM_EMUL_PIC_POSEDGE, irq);
     if ( irq == 2 )
         return;
 
@@ -501,7 +500,7 @@ void vpic_irq_negative_edge(struct domain *d, int irq)
     ASSERT(irq <= 15);
     ASSERT(vpic_is_locked(vpic));
 
-    TRACE_1D(TRC_HVM_EMUL_PIC_NEGEDGE, irq);
+    TRACE_TIME(TRC_HVM_EMUL_PIC_NEGEDGE, irq);
     if ( irq == 2 )
         return;
 
@@ -519,7 +518,7 @@ int vpic_ack_pending_irq(struct vcpu *v)
 
     accept = vlapic_accept_pic_intr(v);
 
-    TRACE_2D(TRC_HVM_EMUL_PIC_PEND_IRQ_CALL, accept, vpic->int_output);
+    TRACE_TIME(TRC_HVM_EMUL_PIC_PEND_IRQ_CALL, accept, vpic->int_output);
     if ( !accept || !vpic->int_output )
         return -1;
 
diff --git a/xen/arch/x86/irq.c b/xen/arch/x86/irq.c
index 67cbf6b979dc..df85932f44b4 100644
--- a/xen/arch/x86/irq.c
+++ b/xen/arch/x86/irq.c
@@ -236,7 +236,7 @@ static void _clear_irq_vector(struct irq_desc *desc)
     for_each_cpu(cpu, tmp_mask)
     {
         ASSERT(per_cpu(vector_irq, cpu)[old_vector] == irq);
-        TRACE_3D(TRC_HW_IRQ_MOVE_FINISH, irq, old_vector, cpu);
+        TRACE_TIME(TRC_HW_IRQ_MOVE_FINISH, irq, old_vector, cpu);
         per_cpu(vector_irq, cpu)[old_vector] = ~irq;
     }
 
@@ -799,13 +799,11 @@ void irq_move_cleanup_interrupt(struct cpu_user_regs *regs)
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
@@ -1939,7 +1937,7 @@ void do_IRQ(struct cpu_user_regs *regs)
                     spin_unlock(&desc->lock);
                 }
             }
-            TRACE_1D(TRC_HW_IRQ_UNMAPPED_VECTOR, vector);
+            TRACE_TIME(TRC_HW_IRQ_UNMAPPED_VECTOR, vector);
         }
         goto out_no_unlock;
     }
@@ -1980,7 +1978,7 @@ void do_IRQ(struct cpu_user_regs *regs)
 
         tsc_in = tb_init_done ? get_cycles() : 0;
         do_IRQ_guest(desc, vector);
-        TRACE_3D(TRC_HW_IRQ_HANDLED, irq, tsc_in, get_cycles());
+        TRACE_TIME(TRC_HW_IRQ_HANDLED, irq, tsc_in, get_cycles());
         goto out_no_end;
     }
 
@@ -2004,7 +2002,7 @@ void do_IRQ(struct cpu_user_regs *regs)
 
         tsc_in = tb_init_done ? get_cycles() : 0;
         action->handler(irq, action->dev_id, regs);
-        TRACE_3D(TRC_HW_IRQ_HANDLED, irq, tsc_in, get_cycles());
+        TRACE_TIME(TRC_HW_IRQ_HANDLED, irq, tsc_in, get_cycles());
 
         spin_lock_irq(&desc->lock);
     }
diff --git a/xen/arch/x86/traps.c b/xen/arch/x86/traps.c
index 0cc1ee95cb5b..ca8374eadf9e 100644
--- a/xen/arch/x86/traps.c
+++ b/xen/arch/x86/traps.c
@@ -1881,7 +1881,7 @@ void do_device_not_available(struct cpu_user_regs *regs)
         curr->arch.pv.ctrlreg[0] &= ~X86_CR0_TS;
     }
     else
-        TRACE_0D(TRC_PV_MATH_STATE_RESTORE);
+        TRACE_TIME(TRC_PV_MATH_STATE_RESTORE);
 #else
     ASSERT_UNREACHABLE();
 #endif
diff --git a/xen/common/domain.c b/xen/common/domain.c
index 6ee5d033b0c2..e8672f86cc82 100644
--- a/xen/common/domain.c
+++ b/xen/common/domain.c
@@ -575,7 +575,7 @@ struct domain *domain_create(domid_t domid,
         hardware_domain = d;
     }
 
-    TRACE_1D(TRC_DOM0_DOM_ADD, d->domain_id);
+    TRACE_TIME(TRC_DOM0_DOM_ADD, d->domain_id);
 
     lock_profile_register_struct(LOCKPROF_TYPE_PERDOM, d, domid);
 
@@ -1141,7 +1141,7 @@ void domain_destroy(struct domain *d)
     if ( atomic_cmpxchg(&d->refcnt, 0, DOMAIN_DESTROYED) != 0 )
         return;
 
-    TRACE_1D(TRC_DOM0_DOM_REM, d->domain_id);
+    TRACE_TIME(TRC_DOM0_DOM_REM, d->domain_id);
 
     /* Delete from task list and task hashtable. */
     spin_lock(&domlist_update_lock);
diff --git a/xen/common/grant_table.c b/xen/common/grant_table.c
index fe1fc11b228e..7f1b2b010bc1 100644
--- a/xen/common/grant_table.c
+++ b/xen/common/grant_table.c
@@ -1271,7 +1271,7 @@ map_grant_ref(
             goto undo_out;
     }
 
-    TRACE_1D(TRC_MEM_PAGE_GRANT_MAP, op->dom);
+    TRACE_TIME(TRC_MEM_PAGE_GRANT_MAP, op->dom);
 
     /*
      * All maptrack entry users check mt->flags first before using the
@@ -1398,7 +1398,7 @@ unmap_common(
         return;
     }
 
-    TRACE_1D(TRC_MEM_PAGE_GRANT_UNMAP, dom);
+    TRACE_TIME(TRC_MEM_PAGE_GRANT_UNMAP, dom);
 
     rgt = rd->grant_table;
 
@@ -2384,7 +2384,7 @@ gnttab_transfer(
         put_gfn(d, gop.mfn);
 #endif
 
-        TRACE_1D(TRC_MEM_PAGE_GRANT_TRANSFER, e->domain_id);
+        TRACE_TIME(TRC_MEM_PAGE_GRANT_TRANSFER, e->domain_id);
 
         /* Tell the guest about its new page frame. */
         grant_read_lock(e->grant_table);
diff --git a/xen/common/sched/core.c b/xen/common/sched/core.c
index fe133cbf117c..37e1a17a888b 100644
--- a/xen/common/sched/core.c
+++ b/xen/common/sched/core.c
@@ -827,7 +827,7 @@ int sched_init_domain(struct domain *d, unsigned int poolid)
         return ret;
 
     SCHED_STAT_CRANK(dom_init);
-    TRACE_1D(TRC_SCHED_DOM_ADD, d->domain_id);
+    TRACE_TIME(TRC_SCHED_DOM_ADD, d->domain_id);
 
     rcu_read_lock(&sched_res_rculock);
 
@@ -850,7 +850,7 @@ void sched_destroy_domain(struct domain *d)
     if ( d->cpupool )
     {
         SCHED_STAT_CRANK(dom_destroy);
-        TRACE_1D(TRC_SCHED_DOM_REM, d->domain_id);
+        TRACE_TIME(TRC_SCHED_DOM_REM, d->domain_id);
 
         rcu_read_lock(&sched_res_rculock);
 
@@ -891,7 +891,7 @@ void vcpu_sleep_nosync(struct vcpu *v)
     unsigned long flags;
     spinlock_t *lock;
 
-    TRACE_2D(TRC_SCHED_SLEEP, v->domain->domain_id, v->vcpu_id);
+    TRACE_TIME(TRC_SCHED_SLEEP, v->domain->domain_id, v->vcpu_id);
 
     rcu_read_lock(&sched_res_rculock);
 
@@ -920,7 +920,7 @@ void vcpu_wake(struct vcpu *v)
     spinlock_t *lock;
     struct sched_unit *unit = v->sched_unit;
 
-    TRACE_2D(TRC_SCHED_WAKE, v->domain->domain_id, v->vcpu_id);
+    TRACE_TIME(TRC_SCHED_WAKE, v->domain->domain_id, v->vcpu_id);
 
     rcu_read_lock(&sched_res_rculock);
 
@@ -1429,7 +1429,7 @@ void vcpu_block(void)
     }
     else
     {
-        TRACE_2D(TRC_SCHED_BLOCK, v->domain->domain_id, v->vcpu_id);
+        TRACE_TIME(TRC_SCHED_BLOCK, v->domain->domain_id, v->vcpu_id);
         raise_softirq(SCHEDULE_SOFTIRQ);
     }
 }
@@ -1502,7 +1502,7 @@ static long do_poll(struct sched_poll *sched_poll)
     if ( sched_poll->timeout != 0 )
         set_timer(&v->poll_timer, sched_poll->timeout);
 
-    TRACE_2D(TRC_SCHED_BLOCK, d->domain_id, v->vcpu_id);
+    TRACE_TIME(TRC_SCHED_BLOCK, d->domain_id, v->vcpu_id);
     raise_softirq(SCHEDULE_SOFTIRQ);
 
     return 0;
@@ -1530,7 +1530,7 @@ long vcpu_yield(void)
 
     SCHED_STAT_CRANK(vcpu_yield);
 
-    TRACE_2D(TRC_SCHED_YIELD, current->domain->domain_id, current->vcpu_id);
+    TRACE_TIME(TRC_SCHED_YIELD, current->domain->domain_id, current->vcpu_id);
     raise_softirq(SCHEDULE_SOFTIRQ);
     return 0;
 }
@@ -1888,9 +1888,8 @@ ret_t do_sched_op(int cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
         if ( copy_from_guest(&sched_shutdown, arg, 1) )
             break;
 
-        TRACE_3D(TRC_SCHED_SHUTDOWN,
-                 current->domain->domain_id, current->vcpu_id,
-                 sched_shutdown.reason);
+        TRACE_TIME(TRC_SCHED_SHUTDOWN, current->domain->domain_id,
+                   current->vcpu_id, sched_shutdown.reason);
         ret = domain_shutdown(current->domain, (u8)sched_shutdown.reason);
 
         break;
@@ -1905,8 +1904,8 @@ ret_t do_sched_op(int cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
         if ( copy_from_guest(&sched_shutdown, arg, 1) )
             break;
 
-        TRACE_3D(TRC_SCHED_SHUTDOWN_CODE,
-                 d->domain_id, current->vcpu_id, sched_shutdown.reason);
+        TRACE_TIME(TRC_SCHED_SHUTDOWN_CODE, d->domain_id, current->vcpu_id,
+                   sched_shutdown.reason);
 
         spin_lock(&d->shutdown_lock);
         if ( d->shutdown_code == SHUTDOWN_CODE_INVALID )
@@ -2069,7 +2068,7 @@ long sched_adjust(struct domain *d, struct xen_domctl_scheduler_op *op)
     rcu_read_lock(&sched_res_rculock);
 
     if ( (ret = sched_adjust_dom(dom_scheduler(d), d, op)) == 0 )
-        TRACE_1D(TRC_SCHED_ADJDOM, d->domain_id);
+        TRACE_TIME(TRC_SCHED_ADJDOM, d->domain_id);
 
     rcu_read_unlock(&sched_res_rculock);
 
@@ -2164,14 +2163,13 @@ static void sched_switch_units(struct sched_resource *sr,
         sr->curr = next;
         sr->prev = prev;
 
-        TRACE_3D(TRC_SCHED_SWITCH_INFPREV, prev->domain->domain_id,
-                 prev->unit_id, now - prev->state_entry_time);
-        TRACE_4D(TRC_SCHED_SWITCH_INFNEXT, next->domain->domain_id,
-                 next->unit_id,
-                 (next->vcpu_list->runstate.state == RUNSTATE_runnable) ?
-                 (now - next->state_entry_time) : 0, prev->next_time);
-        TRACE_4D(TRC_SCHED_SWITCH, prev->domain->domain_id, prev->unit_id,
-                 next->domain->domain_id, next->unit_id);
+        TRACE_TIME(TRC_SCHED_SWITCH_INFPREV, prev->domain->domain_id,
+                   prev->unit_id, now - prev->state_entry_time);
+        TRACE_TIME(TRC_SCHED_SWITCH_INFNEXT, next->domain->domain_id, next->unit_id,
+                   (next->vcpu_list->runstate.state == RUNSTATE_runnable) ?
+                   (now - next->state_entry_time) : 0, prev->next_time);
+        TRACE_TIME(TRC_SCHED_SWITCH, prev->domain->domain_id, prev->unit_id,
+                   next->domain->domain_id, next->unit_id);
 
         ASSERT(!unit_running(next));
 
@@ -2363,10 +2361,10 @@ static void sched_context_switch(struct vcpu *vprev, struct vcpu *vnext,
 {
     if ( unlikely(vprev == vnext) )
     {
-        TRACE_4D(TRC_SCHED_SWITCH_INFCONT,
-                 vnext->domain->domain_id, vnext->sched_unit->unit_id,
-                 now - vprev->runstate.state_entry_time,
-                 vprev->sched_unit->next_time);
+        TRACE_TIME(TRC_SCHED_SWITCH_INFCONT,
+                   vnext->domain->domain_id, vnext->sched_unit->unit_id,
+                   now - vprev->runstate.state_entry_time,
+                   vprev->sched_unit->next_time);
         sched_context_switched(vprev, vnext);
 
         /*
diff --git a/xen/common/sched/credit.c b/xen/common/sched/credit.c
index f277fa37a8b1..0ea7145172ee 100644
--- a/xen/common/sched/credit.c
+++ b/xen/common/sched/credit.c
@@ -842,8 +842,7 @@ _csched_cpu_pick(const struct scheduler *ops, const struct sched_unit *unit,
     if ( commit && spc )
        spc->idle_bias = cpu;
 
-    TRACE_3D(TRC_CSCHED_PICKED_CPU, unit->domain->domain_id, unit->unit_id,
-             cpu);
+    TRACE_TIME(TRC_CSCHED_PICKED_CPU, unit->domain->domain_id, unit->unit_id, cpu);
 
     return cpu;
 }
@@ -887,8 +886,8 @@ __csched_unit_acct_start(struct csched_private *prv, struct csched_unit *svc)
         }
     }
 
-    TRACE_3D(TRC_CSCHED_ACCOUNT_START, sdom->dom->domain_id,
-             svc->unit->unit_id, sdom->active_unit_count);
+    TRACE_TIME(TRC_CSCHED_ACCOUNT_START, sdom->dom->domain_id,
+               svc->unit->unit_id, sdom->active_unit_count);
 
     spin_unlock_irqrestore(&prv->lock, flags);
 }
@@ -913,8 +912,8 @@ __csched_unit_acct_stop_locked(struct csched_private *prv,
         list_del_init(&sdom->active_sdom_elem);
     }
 
-    TRACE_3D(TRC_CSCHED_ACCOUNT_STOP, sdom->dom->domain_id,
-             svc->unit->unit_id, sdom->active_unit_count);
+    TRACE_TIME(TRC_CSCHED_ACCOUNT_STOP, sdom->dom->domain_id,
+               svc->unit->unit_id, sdom->active_unit_count);
 }
 
 static void
@@ -937,8 +936,8 @@ csched_unit_acct(struct csched_private *prv, unsigned int cpu)
     if ( svc->pri == CSCHED_PRI_TS_BOOST )
     {
         svc->pri = CSCHED_PRI_TS_UNDER;
-        TRACE_2D(TRC_CSCHED_BOOST_END, svc->sdom->dom->domain_id,
-                 svc->unit->unit_id);
+        TRACE_TIME(TRC_CSCHED_BOOST_END, svc->sdom->dom->domain_id,
+                   svc->unit->unit_id);
     }
 
     /*
@@ -1145,8 +1144,7 @@ csched_unit_wake(const struct scheduler *ops, struct sched_unit *unit)
     if ( !migrating && svc->pri == CSCHED_PRI_TS_UNDER &&
          !test_bit(CSCHED_FLAG_UNIT_PARKED, &svc->flags) )
     {
-        TRACE_2D(TRC_CSCHED_BOOST_START, unit->domain->domain_id,
-                 unit->unit_id);
+        TRACE_TIME(TRC_CSCHED_BOOST_START, unit->domain->domain_id, unit->unit_id);
         SCHED_STAT_CRANK(unit_boost);
         svc->pri = CSCHED_PRI_TS_BOOST;
     }
@@ -1647,8 +1645,8 @@ csched_runq_steal(int peer_cpu, int cpu, int pri, int balance_step)
         if ( __csched_unit_is_migrateable(prv, unit, cpu, cpumask_scratch) )
         {
             /* We got a candidate. Grab it! */
-            TRACE_3D(TRC_CSCHED_STOLEN_UNIT, peer_cpu,
-                     unit->domain->domain_id, unit->unit_id);
+            TRACE_TIME(TRC_CSCHED_STOLEN_UNIT, peer_cpu,
+                       unit->domain->domain_id, unit->unit_id);
             SCHED_UNIT_STAT_CRANK(speer, migrate_q);
             SCHED_STAT_CRANK(migrate_queued);
             runq_remove(speer);
@@ -1751,7 +1749,7 @@ csched_load_balance(struct csched_private *prv, int cpu,
                  */
                 if ( CSCHED_PCPU(peer_cpu)->nr_runnable <= 1 )
                 {
-                    TRACE_2D(TRC_CSCHED_STEAL_CHECK, peer_cpu, /* skipp'n */ 0);
+                    TRACE_TIME(TRC_CSCHED_STEAL_CHECK, peer_cpu, /* skipp'n */ 0);
                     goto next_cpu;
                 }
 
@@ -1767,11 +1765,11 @@ csched_load_balance(struct csched_private *prv, int cpu,
                 if ( !lock )
                 {
                     SCHED_STAT_CRANK(steal_trylock_failed);
-                    TRACE_2D(TRC_CSCHED_STEAL_CHECK, peer_cpu, /* skip */ 0);
+                    TRACE_TIME(TRC_CSCHED_STEAL_CHECK, peer_cpu, /* skip */ 0);
                     goto next_cpu;
                 }
 
-                TRACE_2D(TRC_CSCHED_STEAL_CHECK, peer_cpu, /* checked */ 1);
+                TRACE_TIME(TRC_CSCHED_STEAL_CHECK, peer_cpu, /* checked */ 1);
 
                 /* Any work over there to steal? */
                 speer = cpumask_test_cpu(peer_cpu, online) ?
@@ -1939,7 +1937,7 @@ static void csched_schedule(
         /* Tasklet work (which runs in idle UNIT context) overrides all else. */
         if ( tasklet_work_scheduled )
         {
-            TRACE_0D(TRC_CSCHED_SCHED_TASKLET);
+            TRACE_TIME(TRC_CSCHED_SCHED_TASKLET);
             snext = CSCHED_UNIT(sched_idle_unit(sched_cpu));
             snext->pri = CSCHED_PRI_TS_BOOST;
         }
diff --git a/xen/drivers/cpufreq/utility.c b/xen/drivers/cpufreq/utility.c
index b93895d4dddc..bc3e62bdeadd 100644
--- a/xen/drivers/cpufreq/utility.c
+++ b/xen/drivers/cpufreq/utility.c
@@ -367,7 +367,7 @@ int __cpufreq_driver_target(struct cpufreq_policy *policy,
         retval = alternative_call(cpufreq_driver.target,
                                   policy, target_freq, relation);
         if ( retval == 0 )
-            TRACE_2D(TRC_PM_FREQ_CHANGE, prev_freq/1000, policy->cur/1000);
+            TRACE_TIME(TRC_PM_FREQ_CHANGE, prev_freq / 1000, policy->cur / 1000);
     }
 
     return retval;
-- 
2.11.0


