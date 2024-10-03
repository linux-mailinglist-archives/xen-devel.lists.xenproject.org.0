Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B10898F4C9
	for <lists+xen-devel@lfdr.de>; Thu,  3 Oct 2024 19:04:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.809656.1222091 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1swPFX-0005bf-8O; Thu, 03 Oct 2024 17:04:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 809656.1222091; Thu, 03 Oct 2024 17:04:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1swPFX-0005a0-4I; Thu, 03 Oct 2024 17:04:23 +0000
Received: by outflank-mailman (input) for mailman id 809656;
 Thu, 03 Oct 2024 17:04:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CNe7=Q7=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1swPFV-0005Zu-Ou
 for xen-devel@lists.xenproject.org; Thu, 03 Oct 2024 17:04:22 +0000
Received: from mail-ej1-x643.google.com (mail-ej1-x643.google.com
 [2a00:1450:4864:20::643])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 86e89377-81a9-11ef-99a2-01e77a169b0f;
 Thu, 03 Oct 2024 19:04:18 +0200 (CEST)
Received: by mail-ej1-x643.google.com with SMTP id
 a640c23a62f3a-a8d3cde1103so159275566b.2
 for <xen-devel@lists.xenproject.org>; Thu, 03 Oct 2024 10:04:18 -0700 (PDT)
Received: from andrewcoop.eng.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a99104cee89sm107443066b.218.2024.10.03.10.04.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Oct 2024 10:04:16 -0700 (PDT)
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
X-Inumbo-ID: 86e89377-81a9-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1727975057; x=1728579857; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=FE8YOhBv8goFF7bpPedX4p8q4pOjzJo9mDN8lc3gdJc=;
        b=XzbeaFo0iwqdFkcZ+ZxwUgscivbHyFaO08Of0NIn9k+5DDiRkc6y4ZVwSNe0+jL1ar
         ++ZOa76Ztmwkqks3Iq/zZ77LOgtAIjDcsxsUTYr7h+ch/+OV0rvYtMFKXRfYwHZQRFeq
         rpUNoo6n7o44xkSqFXCFjfJeoLAqA3lOCKAvo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727975057; x=1728579857;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FE8YOhBv8goFF7bpPedX4p8q4pOjzJo9mDN8lc3gdJc=;
        b=NlaAMvadCgcZ8WJA+kWU4UemJILWNbIGrtyc9mbt73sDZCh6YRzelBFNAXYd3jOjwF
         OnuxYECJRdLh3ZLdBVEWGHdV5YW5OCLjfUCkDXfUpHh52KIb2jBzVbtnD7ruZlWW7MWL
         efLW3dtX6QHqTEG2cwSTwHT7McAodU5bF8iZuZja4AQyjWwKoPztqM241XTT/XkOMUyY
         uWuIB3xWSehHK6ERwgBh60MY6opiLd1zuZH5lgowgEJrAoC+rAjLbK83lhQJ7ICW5oZf
         50VPkJbaz48bVmPGjnBZ0OhY1g+p6gvZFPIDbHosGQ6loGWOrr15Vk1sm6AKM+URecHI
         BAIA==
X-Gm-Message-State: AOJu0YyrJKXWkzBkztSLu09W3K6BM+aI395rpVtG0tuM/7AXYGM3JGDq
	0t9Qx0joJtclN46XB22fBxsF3LVVJqc4izXmDU1KmF8Aoe0zFrQNUbPsRkZREZ0TwBtKJA1Aln5
	J6VaZZA==
X-Google-Smtp-Source: AGHT+IEV0kzbGJKfftUnBvC7pBqsmnkgcXYYFDY9zhDkfK7KAJ7wseZ1TWm3V3SFhJurUtzDUQ89Cw==
X-Received: by 2002:a17:907:9404:b0:a8d:e4b:d7fe with SMTP id a640c23a62f3a-a991bab46e5mr10957866b.0.1727975057158;
        Thu, 03 Oct 2024 10:04:17 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH] x86: Introduce X86_ET_* constants in x86-defns.h
Date: Thu,  3 Oct 2024 18:04:13 +0100
Message-Id: <20241003170413.2227753-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The FRED spec architecturalises the Event Type encoding, previously exposed
only in VMCB/VMCS fields.

Introduce the constants in x86-defns.h, making them a bit more consice, and
retire enum x86_event_type.

Take the opportunity to introduce X86_ET_OTHER.  It's absence appears to be a
bug in Introspection's Monitor Trap Flag support, when considering VECTORING
events during another VMExit.

No functional change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
---
 tools/include/xendevicemodel.h         |  2 +-
 xen/arch/x86/hvm/hvm.c                 |  8 ++---
 xen/arch/x86/hvm/svm/intr.c            |  4 +--
 xen/arch/x86/hvm/svm/svm.c             | 47 +++++++++++++-------------
 xen/arch/x86/hvm/vmx/vmx.c             | 42 +++++++++++------------
 xen/arch/x86/hvm/vmx/vvmx.c            | 12 +++----
 xen/arch/x86/include/asm/domain.h      |  8 ++---
 xen/arch/x86/include/asm/hvm/hvm.h     |  4 +--
 xen/arch/x86/include/asm/x86-defns.h   |  9 +++++
 xen/arch/x86/mm/shadow/multi.c         |  2 +-
 xen/arch/x86/pv/ro-page-fault.c        |  2 +-
 xen/arch/x86/pv/traps.c                |  6 ++--
 xen/arch/x86/x86_emulate/x86_emulate.c | 26 +++++++-------
 xen/arch/x86/x86_emulate/x86_emulate.h | 19 ++---------
 xen/include/public/hvm/dm_op.h         |  2 +-
 15 files changed, 91 insertions(+), 102 deletions(-)

diff --git a/tools/include/xendevicemodel.h b/tools/include/xendevicemodel.h
index 797e0c6b2961..227e7fd8109e 100644
--- a/tools/include/xendevicemodel.h
+++ b/tools/include/xendevicemodel.h
@@ -308,7 +308,7 @@ int xendevicemodel_set_mem_type(
  * @parm domid the domain id to be serviced
  * @parm vcpu the vcpu id
  * @parm vector the interrupt vector
- * @parm type the event type (see the definition of enum x86_event_type)
+ * @parm type the event type (see x86-defns.h:X86_ET_*)
  * @parm error_code the error code or ~0 to skip
  * @parm insn_len the instruction length
  * @parm extra type-specific extra data (%cr2 for #PF, pending_dbg for #DB)
diff --git a/xen/arch/x86/hvm/hvm.c b/xen/arch/x86/hvm/hvm.c
index b2e782d596f7..7b2e1c9813d6 100644
--- a/xen/arch/x86/hvm/hvm.c
+++ b/xen/arch/x86/hvm/hvm.c
@@ -219,10 +219,10 @@ int hvm_event_needs_reinjection(uint8_t type, uint8_t vector)
 {
     switch ( type )
     {
-    case X86_EVENTTYPE_EXT_INTR:
-    case X86_EVENTTYPE_NMI:
+    case X86_ET_EXT_INTR:
+    case X86_ET_NMI:
         return 1;
-    case X86_EVENTTYPE_HW_EXCEPTION:
+    case X86_ET_HW_EXC:
         /*
          * SVM uses type 3 ("HW Exception") for #OF and #BP. We explicitly
          * check for these vectors, as they are really SW Exceptions. SVM has
@@ -1738,7 +1738,7 @@ void hvm_inject_event(const struct x86_event *event)
 {
     struct vcpu *curr = current;
     const uint8_t vector = event->vector;
-    const bool has_ec = ((event->type == X86_EVENTTYPE_HW_EXCEPTION) &&
+    const bool has_ec = ((event->type == X86_ET_HW_EXC) &&
                          (vector < 32) && ((X86_EXC_HAVE_EC & (1u << vector))));
 
     ASSERT(vector == event->vector); /* Confirm no truncation. */
diff --git a/xen/arch/x86/hvm/svm/intr.c b/xen/arch/x86/hvm/svm/intr.c
index 780c7e178a52..46186a110261 100644
--- a/xen/arch/x86/hvm/svm/intr.c
+++ b/xen/arch/x86/hvm/svm/intr.c
@@ -35,7 +35,7 @@ static void svm_inject_nmi(struct vcpu *v)
 
     event.raw = 0;
     event.v = true;
-    event.type = X86_EVENTTYPE_NMI;
+    event.type = X86_ET_NMI;
     event.vector = X86_EXC_NMI;
 
     ASSERT(!vmcb->event_inj.v);
@@ -56,7 +56,7 @@ static void svm_inject_extint(struct vcpu *v, int vector)
 
     event.raw = 0;
     event.v = true;
-    event.type = X86_EVENTTYPE_EXT_INTR;
+    event.type = X86_ET_EXT_INTR;
     event.vector = vector;
 
     ASSERT(!vmcb->event_inj.v);
diff --git a/xen/arch/x86/hvm/svm/svm.c b/xen/arch/x86/hvm/svm/svm.c
index e0793b26db63..b8f87aa1ed08 100644
--- a/xen/arch/x86/hvm/svm/svm.c
+++ b/xen/arch/x86/hvm/svm/svm.c
@@ -1185,7 +1185,7 @@ static void svm_emul_swint_injection(struct x86_event *event)
 
     /* ICEBP sets the External Event bit despite being an instruction. */
     ec = (trap << 3) | X86_XEC_IDT |
-        (type == X86_EVENTTYPE_PRI_SW_EXCEPTION ? X86_XEC_EXT : 0);
+         (type == X86_ET_PRIV_SW_EXC ? X86_XEC_EXT : 0);
 
     /*
      * TODO: This does not cover the v8086 mode with CR4.VME case
@@ -1243,7 +1243,7 @@ static void svm_emul_swint_injection(struct x86_event *event)
         goto raise_exception;
 
     /* ICEBP counts as a hardware event, and bypasses the dpl check. */
-    if ( type != X86_EVENTTYPE_PRI_SW_EXCEPTION &&
+    if ( type != X86_ET_PRIV_SW_EXC &&
          vmcb_get_cpl(vmcb) > ((idte.b >> 13) & 3) )
         goto raise_exception;
 
@@ -1264,7 +1264,7 @@ static void svm_emul_swint_injection(struct x86_event *event)
 
  raise_exception:
     event->vector = fault;
-    event->type = X86_EVENTTYPE_HW_EXCEPTION;
+    event->type = X86_ET_HW_EXC;
     event->insn_len = 0;
     event->error_code = ec;
 }
@@ -1285,11 +1285,11 @@ static void cf_check svm_inject_event(const struct x86_event *event)
      * further fault shouldn't occur during delivery.  This covers the fact
      * that hardware doesn't perform DPL checking on injection.
      */
-    if ( event->type == X86_EVENTTYPE_PRI_SW_EXCEPTION ||
-         (!cpu_has_svm_nrips && (event->type >= X86_EVENTTYPE_SW_INTERRUPT)) )
+    if ( event->type == X86_ET_PRIV_SW_EXC ||
+         (!cpu_has_svm_nrips && (event->type >= X86_ET_SW_INT)) )
         svm_emul_swint_injection(&_event);
 
-    switch ( _event.vector | -(_event.type == X86_EVENTTYPE_SW_INTERRUPT) )
+    switch ( _event.vector | -(_event.type == X86_ET_SW_INT) )
     {
     case X86_EXC_DB:
         if ( regs->eflags & X86_EFLAGS_TF )
@@ -1308,13 +1308,13 @@ static void cf_check svm_inject_event(const struct x86_event *event)
         break;
 
     case X86_EXC_PF:
-        ASSERT(_event.type == X86_EVENTTYPE_HW_EXCEPTION);
+        ASSERT(_event.type == X86_ET_HW_EXC);
         curr->arch.hvm.guest_cr[2] = _event.cr2;
         vmcb_set_cr2(vmcb, _event.cr2);
         break;
     }
 
-    if ( eventinj.v && (eventinj.type == X86_EVENTTYPE_HW_EXCEPTION) )
+    if ( eventinj.v && (eventinj.type == X86_ET_HW_EXC) )
     {
         _event.vector = hvm_combine_hw_exceptions(
             eventinj.vector, _event.vector);
@@ -1339,15 +1339,15 @@ static void cf_check svm_inject_event(const struct x86_event *event)
      */
     switch ( _event.type )
     {
-    case X86_EVENTTYPE_SW_INTERRUPT: /* int $n */
+    case X86_ET_SW_INT: /* int $n */
         if ( cpu_has_svm_nrips )
             vmcb->nextrip = regs->rip + _event.insn_len;
         else
             regs->rip += _event.insn_len;
-        eventinj.type = X86_EVENTTYPE_SW_INTERRUPT;
+        eventinj.type = X86_ET_SW_INT;
         break;
 
-    case X86_EVENTTYPE_PRI_SW_EXCEPTION: /* icebp */
+    case X86_ET_PRIV_SW_EXC: /* icebp */
         /*
          * icebp's injection must always be emulated, as hardware does not
          * special case HW_EXCEPTION with vector 1 (#DB) as having trap
@@ -1356,10 +1356,10 @@ static void cf_check svm_inject_event(const struct x86_event *event)
         regs->rip += _event.insn_len;
         if ( cpu_has_svm_nrips )
             vmcb->nextrip = regs->rip;
-        eventinj.type = X86_EVENTTYPE_HW_EXCEPTION;
+        eventinj.type = X86_ET_HW_EXC;
         break;
 
-    case X86_EVENTTYPE_SW_EXCEPTION: /* int3, into */
+    case X86_ET_SW_EXC: /* int3, into */
         /*
          * Hardware special cases HW_EXCEPTION with vectors 3 and 4 as having
          * trap semantics, and will perform DPL checks.
@@ -1368,11 +1368,11 @@ static void cf_check svm_inject_event(const struct x86_event *event)
             vmcb->nextrip = regs->rip + _event.insn_len;
         else
             regs->rip += _event.insn_len;
-        eventinj.type = X86_EVENTTYPE_HW_EXCEPTION;
+        eventinj.type = X86_ET_HW_EXC;
         break;
 
     default:
-        eventinj.type = X86_EVENTTYPE_HW_EXCEPTION;
+        eventinj.type = X86_ET_HW_EXC;
         eventinj.ev = (_event.error_code != X86_EVENT_NO_EC);
         eventinj.ec = _event.error_code;
         break;
@@ -1391,8 +1391,7 @@ static void cf_check svm_inject_event(const struct x86_event *event)
     ASSERT(!eventinj.ev || eventinj.ec == (uint16_t)eventinj.ec);
     vmcb->event_inj = eventinj;
 
-    if ( _event.vector == X86_EXC_PF &&
-         _event.type == X86_EVENTTYPE_HW_EXCEPTION )
+    if ( _event.vector == X86_EXC_PF && _event.type == X86_ET_HW_EXC )
         TRACE(TRC_HVM_PF_INJECT64, _event.error_code,
               _event.cr2, _event.cr2 >> 32);
     else
@@ -2694,12 +2693,12 @@ void asmlinkage svm_vmexit_handler(void)
 
             if ( likely(exit_reason != VMEXIT_ICEBP) )
             {
-                trap_type = X86_EVENTTYPE_HW_EXCEPTION;
+                trap_type = X86_ET_HW_EXC;
                 insn_len = 0;
             }
             else
             {
-                trap_type = X86_EVENTTYPE_PRI_SW_EXCEPTION;
+                trap_type = X86_ET_PRIV_SW_EXC;
                 insn_len = svm_get_insn_len(v, INSTR_ICEBP);
 
                 if ( !insn_len )
@@ -2736,13 +2735,13 @@ void asmlinkage svm_vmexit_handler(void)
         {
            rc = hvm_monitor_debug(regs->rip,
                                   HVM_MONITOR_SOFTWARE_BREAKPOINT,
-                                  X86_EVENTTYPE_SW_EXCEPTION,
+                                  X86_ET_SW_EXC,
                                   insn_len, 0);
            if ( rc < 0 )
                goto unexpected_exit_type;
            if ( !rc )
                hvm_inject_exception(X86_EXC_BP,
-                                    X86_EVENTTYPE_SW_EXCEPTION,
+                                    X86_ET_SW_EXC,
                                     insn_len, X86_EVENT_NO_EC);
         }
         break;
@@ -2835,13 +2834,13 @@ void asmlinkage svm_vmexit_handler(void)
                  * ICEBP is handled specially, and already has fault
                  * semantics.
                  */
-            case X86_EVENTTYPE_HW_EXCEPTION:
+            case X86_ET_HW_EXC:
                 if ( vmcb->exit_int_info.vector == X86_EXC_BP ||
                      vmcb->exit_int_info.vector == X86_EXC_OF )
                     break;
                 /* Fallthrough */
-            case X86_EVENTTYPE_EXT_INTR:
-            case X86_EVENTTYPE_NMI:
+            case X86_ET_EXT_INTR:
+            case X86_ET_NMI:
                 insn_len = 0;
                 break;
             }
diff --git a/xen/arch/x86/hvm/vmx/vmx.c b/xen/arch/x86/hvm/vmx/vmx.c
index 12f8a66458db..b6885d0e2764 100644
--- a/xen/arch/x86/hvm/vmx/vmx.c
+++ b/xen/arch/x86/hvm/vmx/vmx.c
@@ -1994,14 +1994,13 @@ void vmx_inject_extint(int trap, uint8_t source)
         if ( pin_based_cntrl & PIN_BASED_EXT_INTR_MASK ) {
             nvmx_enqueue_n2_exceptions (v, 
                INTR_INFO_VALID_MASK |
-               MASK_INSR(X86_EVENTTYPE_EXT_INTR, INTR_INFO_INTR_TYPE_MASK) |
+               MASK_INSR(X86_ET_EXT_INTR, INTR_INFO_INTR_TYPE_MASK) |
                MASK_INSR(trap, INTR_INFO_VECTOR_MASK),
                X86_EVENT_NO_EC, source);
             return;
         }
     }
-    __vmx_inject_exception(trap, X86_EVENTTYPE_EXT_INTR,
-                           X86_EVENT_NO_EC);
+    __vmx_inject_exception(trap, X86_ET_EXT_INTR, X86_EVENT_NO_EC);
 }
 
 void vmx_inject_nmi(void)
@@ -2014,23 +2013,22 @@ void vmx_inject_nmi(void)
         if ( pin_based_cntrl & PIN_BASED_NMI_EXITING ) {
             nvmx_enqueue_n2_exceptions (v, 
                INTR_INFO_VALID_MASK |
-               MASK_INSR(X86_EVENTTYPE_NMI, INTR_INFO_INTR_TYPE_MASK) |
+               MASK_INSR(X86_ET_NMI, INTR_INFO_INTR_TYPE_MASK) |
                MASK_INSR(X86_EXC_NMI, INTR_INFO_VECTOR_MASK),
                X86_EVENT_NO_EC, hvm_intsrc_nmi);
             return;
         }
     }
-    __vmx_inject_exception(2, X86_EVENTTYPE_NMI,
-                           X86_EVENT_NO_EC);
+    __vmx_inject_exception(2, X86_ET_NMI, X86_EVENT_NO_EC);
 }
 
 /*
  * Generate a virtual event in the guest.
  * NOTES:
- *  - INT 3 (CC) and INTO (CE) are X86_EVENTTYPE_SW_EXCEPTION;
- *  - INT nn (CD nn) is X86_EVENTTYPE_SW_INTERRUPT;
- *  - #DB is X86_EVENTTYPE_HW_EXCEPTION, except when generated by
- *    opcode 0xf1 (which is X86_EVENTTYPE_PRI_SW_EXCEPTION)
+ *  - INT3 (CC) and INTO (CE) are X86_ET_SW_EXC;
+ *  - INT $n (CD nn) is X86_ET_SW_INT;
+ *  - #DB is X86_ET_HW_EXC, except when generated by
+ *    ICEBP/INT1 (which is X86_ET_PRIV_SW_EXC)
  */
 static void cf_check vmx_inject_event(const struct x86_event *event)
 {
@@ -2038,7 +2036,7 @@ static void cf_check vmx_inject_event(const struct x86_event *event)
     struct vcpu *curr = current;
     struct x86_event _event = *event;
 
-    switch ( _event.vector | -(_event.type == X86_EVENTTYPE_SW_INTERRUPT) )
+    switch ( _event.vector | -(_event.type == X86_ET_SW_INT) )
     {
     case X86_EXC_DB:
         if ( guest_cpu_user_regs()->eflags & X86_EFLAGS_TF )
@@ -2069,7 +2067,7 @@ static void cf_check vmx_inject_event(const struct x86_event *event)
         break;
 
     case X86_EXC_PF:
-        ASSERT(_event.type == X86_EVENTTYPE_HW_EXCEPTION);
+        ASSERT(_event.type == X86_ET_HW_EXC);
         curr->arch.hvm.guest_cr[2] = _event.cr2;
         break;
     }
@@ -2080,8 +2078,7 @@ static void cf_check vmx_inject_event(const struct x86_event *event)
         __vmread(VM_ENTRY_INTR_INFO, &intr_info);
 
     if ( unlikely(intr_info & INTR_INFO_VALID_MASK) &&
-         (MASK_EXTR(intr_info, INTR_INFO_INTR_TYPE_MASK) ==
-          X86_EVENTTYPE_HW_EXCEPTION) )
+         (MASK_EXTR(intr_info, INTR_INFO_INTR_TYPE_MASK) == X86_ET_HW_EXC) )
     {
         _event.vector = hvm_combine_hw_exceptions(
             (uint8_t)intr_info, _event.vector);
@@ -2089,7 +2086,7 @@ static void cf_check vmx_inject_event(const struct x86_event *event)
             _event.error_code = 0;
     }
 
-    if ( _event.type >= X86_EVENTTYPE_SW_INTERRUPT )
+    if ( _event.type >= X86_ET_SW_INT )
         __vmwrite(VM_ENTRY_INSTRUCTION_LEN, _event.insn_len);
 
     if ( nestedhvm_vcpu_in_guestmode(curr) &&
@@ -2105,8 +2102,7 @@ static void cf_check vmx_inject_event(const struct x86_event *event)
     else
         __vmx_inject_exception(_event.vector, _event.type, _event.error_code);
 
-    if ( (_event.vector == X86_EXC_PF) &&
-         (_event.type == X86_EVENTTYPE_HW_EXCEPTION) )
+    if ( (_event.vector == X86_EXC_PF) && (_event.type == X86_ET_HW_EXC) )
         TRACE(TRC_HVM_PF_INJECT64, _event.error_code,
               curr->arch.hvm.guest_cr[2], curr->arch.hvm.guest_cr[2] >> 32);
     else
@@ -3951,7 +3947,7 @@ static void vmx_propagate_intr(unsigned long intr)
     else
         event.error_code = X86_EVENT_NO_EC;
 
-    if ( event.type >= X86_EVENTTYPE_SW_INTERRUPT )
+    if ( event.type >= X86_ET_SW_INT )
     {
         __vmread(VM_EXIT_INSTRUCTION_LEN, &tmp);
         event.insn_len = tmp;
@@ -3990,7 +3986,7 @@ static void vmx_idtv_reinject(unsigned long idtv_info)
          */
         if ( cpu_has_vmx_vnmi &&
              ((idtv_info & INTR_INFO_INTR_TYPE_MASK) ==
-              MASK_INSR(X86_EVENTTYPE_NMI, INTR_INFO_INTR_TYPE_MASK)) )
+              MASK_INSR(X86_ET_NMI, INTR_INFO_INTR_TYPE_MASK)) )
         {
             unsigned long intr_info;
 
@@ -4115,7 +4111,7 @@ void asmlinkage vmx_vmexit_handler(struct cpu_user_regs *regs)
             do_machine_check(regs);
         if ( (vector == X86_EXC_NMI) &&
              ((intr_info & INTR_INFO_INTR_TYPE_MASK) ==
-              MASK_INSR(X86_EVENTTYPE_NMI, INTR_INFO_INTR_TYPE_MASK)) )
+              MASK_INSR(X86_ET_NMI, INTR_INFO_INTR_TYPE_MASK)) )
         {
             do_nmi(regs);
             enable_nmis();
@@ -4317,7 +4313,7 @@ void asmlinkage vmx_vmexit_handler(struct cpu_user_regs *regs)
                 unsigned long trap_type = MASK_EXTR(intr_info,
                                                     INTR_INFO_INTR_TYPE_MASK);
 
-                if ( trap_type >= X86_EVENTTYPE_SW_INTERRUPT )
+                if ( trap_type >= X86_ET_SW_INT )
                     __vmread(VM_EXIT_INSTRUCTION_LEN, &insn_len);
 
                 rc = hvm_monitor_debug(regs->rip,
@@ -4342,7 +4338,7 @@ void asmlinkage vmx_vmexit_handler(struct cpu_user_regs *regs)
                 __vmread(VM_EXIT_INSTRUCTION_LEN, &insn_len);
                 rc = hvm_monitor_debug(regs->rip,
                                        HVM_MONITOR_SOFTWARE_BREAKPOINT,
-                                       X86_EVENTTYPE_SW_EXCEPTION,
+                                       X86_ET_SW_EXC,
                                        insn_len, 0);
 
                 if ( rc < 0 )
@@ -4391,7 +4387,7 @@ void asmlinkage vmx_vmexit_handler(struct cpu_user_regs *regs)
             break;
         case X86_EXC_NMI:
             if ( MASK_EXTR(intr_info, INTR_INFO_INTR_TYPE_MASK) !=
-                 X86_EVENTTYPE_NMI )
+                 X86_ET_NMI )
                 goto exit_and_crash;
             TRACE(TRC_HVM_NMI);
             /* Already handled above. */
diff --git a/xen/arch/x86/hvm/vmx/vvmx.c b/xen/arch/x86/hvm/vmx/vvmx.c
index c05e0e9326b9..78135ca23be8 100644
--- a/xen/arch/x86/hvm/vmx/vvmx.c
+++ b/xen/arch/x86/hvm/vmx/vvmx.c
@@ -1346,7 +1346,7 @@ static void sync_exception_state(struct vcpu *v)
 
     switch ( MASK_EXTR(nvmx->intr.intr_info, INTR_INFO_INTR_TYPE_MASK) )
     {
-    case X86_EVENTTYPE_EXT_INTR:
+    case X86_ET_EXT_INTR:
         /* rename exit_reason to EXTERNAL_INTERRUPT */
         set_vvmcs(v, VM_EXIT_REASON, EXIT_REASON_EXTERNAL_INTERRUPT);
         set_vvmcs(v, EXIT_QUALIFICATION, 0);
@@ -1355,14 +1355,14 @@ static void sync_exception_state(struct vcpu *v)
                                                          : 0);
         break;
 
-    case X86_EVENTTYPE_HW_EXCEPTION:
-    case X86_EVENTTYPE_SW_INTERRUPT:
-    case X86_EVENTTYPE_SW_EXCEPTION:
+    case X86_ET_HW_EXC:
+    case X86_ET_SW_INT:
+    case X86_ET_SW_EXC:
         /* throw to L1 */
         set_vvmcs(v, VM_EXIT_INTR_INFO, nvmx->intr.intr_info);
         set_vvmcs(v, VM_EXIT_INTR_ERROR_CODE, nvmx->intr.error_code);
         break;
-    case X86_EVENTTYPE_NMI:
+    case X86_ET_NMI:
         set_vvmcs(v, VM_EXIT_REASON, EXIT_REASON_EXCEPTION_NMI);
         set_vvmcs(v, EXIT_QUALIFICATION, 0);
         set_vvmcs(v, VM_EXIT_INTR_INFO, nvmx->intr.intr_info);
@@ -2445,7 +2445,7 @@ int nvmx_n2_vmexit_handler(struct cpu_user_regs *regs,
     case EXIT_REASON_EXCEPTION_NMI:
     {
         unsigned long intr_info;
-        u32 valid_mask = MASK_INSR(X86_EVENTTYPE_HW_EXCEPTION,
+        u32 valid_mask = MASK_INSR(X86_ET_HW_EXC,
                                   INTR_INFO_INTR_TYPE_MASK) |
                          INTR_INFO_VALID_MASK;
         u64 exec_bitmap;
diff --git a/xen/arch/x86/include/asm/domain.h b/xen/arch/x86/include/asm/domain.h
index bdcdb8de09f1..5219c4fb0f69 100644
--- a/xen/arch/x86/include/asm/domain.h
+++ b/xen/arch/x86/include/asm/domain.h
@@ -724,7 +724,7 @@ static inline void pv_inject_hw_exception(unsigned int vector, int errcode)
 {
     const struct x86_event event = {
         .vector = vector,
-        .type = X86_EVENTTYPE_HW_EXCEPTION,
+        .type = X86_ET_HW_EXC,
         .error_code = errcode,
     };
 
@@ -735,7 +735,7 @@ static inline void pv_inject_DB(unsigned long pending_dbg)
 {
     struct x86_event event = {
         .vector      = X86_EXC_DB,
-        .type        = X86_EVENTTYPE_HW_EXCEPTION,
+        .type        = X86_ET_HW_EXC,
         .error_code  = X86_EVENT_NO_EC,
     };
 
@@ -748,7 +748,7 @@ static inline void pv_inject_page_fault(int errcode, unsigned long cr2)
 {
     struct x86_event event = {
         .vector = X86_EXC_PF,
-        .type = X86_EVENTTYPE_HW_EXCEPTION,
+        .type = X86_ET_HW_EXC,
         .error_code = errcode,
     };
 
@@ -761,7 +761,7 @@ static inline void pv_inject_sw_interrupt(unsigned int vector)
 {
     const struct x86_event event = {
         .vector = vector,
-        .type = X86_EVENTTYPE_SW_INTERRUPT,
+        .type = X86_ET_SW_INT,
         .error_code = X86_EVENT_NO_EC,
     };
 
diff --git a/xen/arch/x86/include/asm/hvm/hvm.h b/xen/arch/x86/include/asm/hvm/hvm.h
index dd7d4872b58e..02de18c7d4a8 100644
--- a/xen/arch/x86/include/asm/hvm/hvm.h
+++ b/xen/arch/x86/include/asm/hvm/hvm.h
@@ -522,7 +522,7 @@ static inline void hvm_inject_hw_exception(unsigned int vector, int errcode)
 {
     struct x86_event event = {
         .vector = vector,
-        .type = X86_EVENTTYPE_HW_EXCEPTION,
+        .type = X86_ET_HW_EXC,
         .error_code = errcode,
     };
 
@@ -533,7 +533,7 @@ static inline void hvm_inject_page_fault(int errcode, unsigned long cr2)
 {
     struct x86_event event = {
         .vector = X86_EXC_PF,
-        .type = X86_EVENTTYPE_HW_EXCEPTION,
+        .type = X86_ET_HW_EXC,
         .error_code = errcode,
     };
 
diff --git a/xen/arch/x86/include/asm/x86-defns.h b/xen/arch/x86/include/asm/x86-defns.h
index 7abc5bcd4262..67b22e095434 100644
--- a/xen/arch/x86/include/asm/x86-defns.h
+++ b/xen/arch/x86/include/asm/x86-defns.h
@@ -204,4 +204,13 @@
 #define X86_MT_UCM    0x07 /* UC- */
 #define X86_NUM_MT    0x08
 
+/* Event Types. */
+#define X86_ET_EXT_INTR    0 /* External Interrupt */
+#define X86_ET_NMI         2 /* NMI */
+#define X86_ET_HW_EXC      3 /* Hardware Exception (#PF/#GP/etc) */
+#define X86_ET_SW_INT      4 /* Software Interrupt (INT $n) */
+#define X86_ET_PRIV_SW_EXC 5 /* Privileged Software Exception (ICEBP/INT1) */
+#define X86_ET_SW_EXC      6 /* Software Exception (INT3, INTO) */
+#define X86_ET_OTHER       7 /* Misc event: MTF=0, SYSCALL=1, SYSENTER=2 */
+
 #endif	/* __XEN_X86_DEFNS_H__ */
diff --git a/xen/arch/x86/mm/shadow/multi.c b/xen/arch/x86/mm/shadow/multi.c
index 376f6823cd44..10ddc408ff73 100644
--- a/xen/arch/x86/mm/shadow/multi.c
+++ b/xen/arch/x86/mm/shadow/multi.c
@@ -2701,7 +2701,7 @@ static int cf_check sh_page_fault(
          * else is an emulation bug, or a guest playing with the instruction
          * stream under Xen's feet.
          */
-        if ( emul_ctxt.ctxt.event.type == X86_EVENTTYPE_HW_EXCEPTION &&
+        if ( emul_ctxt.ctxt.event.type == X86_ET_HW_EXC &&
              ((emul_ctxt.ctxt.event.vector == X86_EXC_PF) ||
               (((emul_ctxt.ctxt.event.vector == X86_EXC_GP) ||
                 (emul_ctxt.ctxt.event.vector == X86_EXC_SS)) &&
diff --git a/xen/arch/x86/pv/ro-page-fault.c b/xen/arch/x86/pv/ro-page-fault.c
index d0fe07e3a109..6a739f9e9a96 100644
--- a/xen/arch/x86/pv/ro-page-fault.c
+++ b/xen/arch/x86/pv/ro-page-fault.c
@@ -379,7 +379,7 @@ int pv_ro_page_fault(unsigned long addr, struct cpu_user_regs *regs)
          * concurrent pagetable update).  Anything else is an emulation bug,
          * or a guest playing with the instruction stream under Xen's feet.
          */
-        if ( ctxt.event.type == X86_EVENTTYPE_HW_EXCEPTION &&
+        if ( ctxt.event.type == X86_ET_HW_EXC &&
              ctxt.event.vector == X86_EXC_PF )
             pv_inject_event(&ctxt.event);
         else
diff --git a/xen/arch/x86/pv/traps.c b/xen/arch/x86/pv/traps.c
index 5a7341abf068..ed8aa97382b7 100644
--- a/xen/arch/x86/pv/traps.c
+++ b/xen/arch/x86/pv/traps.c
@@ -29,14 +29,14 @@ void pv_inject_event(const struct x86_event *event)
     bool use_error_code;
 
     ASSERT(vector == event->vector); /* Confirm no truncation. */
-    if ( event->type == X86_EVENTTYPE_HW_EXCEPTION )
+    if ( event->type == X86_ET_HW_EXC )
     {
         ASSERT(vector < 32);
         use_error_code = X86_EXC_HAVE_EC & (1u << vector);
     }
     else
     {
-        ASSERT(event->type == X86_EVENTTYPE_SW_INTERRUPT);
+        ASSERT(event->type == X86_ET_SW_INT);
         use_error_code = false;
     }
     if ( use_error_code )
@@ -51,7 +51,7 @@ void pv_inject_event(const struct x86_event *event)
     tb->cs    = ti->cs;
     tb->eip   = ti->address;
 
-    switch ( vector | -(event->type == X86_EVENTTYPE_SW_INTERRUPT) )
+    switch ( vector | -(event->type == X86_ET_SW_INT) )
     {
     case X86_EXC_PF:
         curr->arch.pv.ctrlreg[2] = event->cr2;
diff --git a/xen/arch/x86/x86_emulate/x86_emulate.c b/xen/arch/x86/x86_emulate/x86_emulate.c
index bbda0ffc2fb1..0ea0d5e67e53 100644
--- a/xen/arch/x86/x86_emulate/x86_emulate.c
+++ b/xen/arch/x86/x86_emulate/x86_emulate.c
@@ -2372,19 +2372,19 @@ x86_emulate(
         {
         case 0xcc: /* int3 */
             ctxt->event.vector = X86_EXC_BP;
-            ctxt->event.type = X86_EVENTTYPE_SW_EXCEPTION;
+            ctxt->event.type = X86_ET_SW_EXC;
             break;
         case 0xcd: /* int imm8 */
             ctxt->event.vector = imm1;
-            ctxt->event.type = X86_EVENTTYPE_SW_INTERRUPT;
+            ctxt->event.type = X86_ET_SW_INT;
             break;
         case 0xce: /* into */
             ctxt->event.vector = X86_EXC_OF;
-            ctxt->event.type = X86_EVENTTYPE_SW_EXCEPTION;
+            ctxt->event.type = X86_ET_SW_EXC;
             break;
         case 0xf1: /* icebp */
             ctxt->event.vector = X86_EXC_DB;
-            ctxt->event.type = X86_EVENTTYPE_PRI_SW_EXCEPTION;
+            ctxt->event.type = X86_ET_PRIV_SW_EXC;
             break;
         }
         ctxt->event.error_code = X86_EVENT_NO_EC;
@@ -8597,16 +8597,14 @@ static void __init __maybe_unused build_assertions(void)
     BUILD_BUG_ON(x86_seg_fs != 4);
     BUILD_BUG_ON(x86_seg_gs != 5);
 
-    /*
-     * Check X86_EVENTTYPE_* against VMCB EVENTINJ and VMCS INTR_INFO type
-     * fields.
-     */
-    BUILD_BUG_ON(X86_EVENTTYPE_EXT_INTR != 0);
-    BUILD_BUG_ON(X86_EVENTTYPE_NMI != 2);
-    BUILD_BUG_ON(X86_EVENTTYPE_HW_EXCEPTION != 3);
-    BUILD_BUG_ON(X86_EVENTTYPE_SW_INTERRUPT != 4);
-    BUILD_BUG_ON(X86_EVENTTYPE_PRI_SW_EXCEPTION != 5);
-    BUILD_BUG_ON(X86_EVENTTYPE_SW_EXCEPTION != 6);
+    /* Check X86_ET_* against VMCB EVENTINJ and VMCS INTR_INFO type fields. */
+    BUILD_BUG_ON(X86_ET_EXT_INTR    != 0);
+    BUILD_BUG_ON(X86_ET_NMI         != 2);
+    BUILD_BUG_ON(X86_ET_HW_EXC      != 3);
+    BUILD_BUG_ON(X86_ET_SW_INT      != 4);
+    BUILD_BUG_ON(X86_ET_PRIV_SW_EXC != 5);
+    BUILD_BUG_ON(X86_ET_SW_EXC      != 6);
+    BUILD_BUG_ON(X86_ET_OTHER       != 7);
 }
 
 #ifndef NDEBUG
diff --git a/xen/arch/x86/x86_emulate/x86_emulate.h b/xen/arch/x86/x86_emulate/x86_emulate.h
index 3e819d41746e..d75658eba02a 100644
--- a/xen/arch/x86/x86_emulate/x86_emulate.h
+++ b/xen/arch/x86/x86_emulate/x86_emulate.h
@@ -59,24 +59,11 @@ static inline bool is_x86_system_segment(enum x86_segment seg)
     return seg >= x86_seg_tr && seg < x86_seg_none;
 }
 
-/*
- * x86 event types. This enumeration is valid for:
- *  Intel VMX: {VM_ENTRY,VM_EXIT,IDT_VECTORING}_INTR_INFO[10:8]
- *  AMD SVM: eventinj[10:8] and exitintinfo[10:8] (types 0-4 only)
- */
-enum x86_event_type {
-    X86_EVENTTYPE_EXT_INTR,         /* External interrupt */
-    X86_EVENTTYPE_NMI = 2,          /* NMI */
-    X86_EVENTTYPE_HW_EXCEPTION,     /* Hardware exception */
-    X86_EVENTTYPE_SW_INTERRUPT,     /* Software interrupt (CD nn) */
-    X86_EVENTTYPE_PRI_SW_EXCEPTION, /* ICEBP (F1) */
-    X86_EVENTTYPE_SW_EXCEPTION,     /* INT3 (CC), INTO (CE) */
-};
 #define X86_EVENT_NO_EC (-1)        /* No error code. */
 
 struct x86_event {
     int16_t       vector;
-    uint8_t       type;         /* X86_EVENTTYPE_* */
+    uint8_t       type;         /* X86_ET_* */
     uint8_t       insn_len;     /* Instruction length */
     int32_t       error_code;   /* X86_EVENT_NO_EC if n/a */
     union {
@@ -821,7 +808,7 @@ static inline void x86_emul_hw_exception(
     ASSERT(!ctxt->event_pending);
 
     ctxt->event.vector = vector;
-    ctxt->event.type = X86_EVENTTYPE_HW_EXCEPTION;
+    ctxt->event.type = X86_ET_HW_EXC;
     ctxt->event.error_code = error_code;
 
     ctxt->event_pending = true;
@@ -833,7 +820,7 @@ static inline void x86_emul_pagefault(
     ASSERT(!ctxt->event_pending);
 
     ctxt->event.vector = X86_EXC_PF;
-    ctxt->event.type = X86_EVENTTYPE_HW_EXCEPTION;
+    ctxt->event.type = X86_ET_HW_EXC;
     ctxt->event.error_code = error_code;
     ctxt->event.cr2 = cr2;
 
diff --git a/xen/include/public/hvm/dm_op.h b/xen/include/public/hvm/dm_op.h
index fa98551914f2..2bf0fdc1ae1c 100644
--- a/xen/include/public/hvm/dm_op.h
+++ b/xen/include/public/hvm/dm_op.h
@@ -302,7 +302,7 @@ struct xen_dm_op_inject_event {
     uint8_t vector;
     /* IN - event type (DMOP_EVENT_* ) */
     uint8_t type;
-/* NB. This enumeration precisely matches hvm.h:X86_EVENTTYPE_* */
+/* NB. This enumeration precisely matches x86-defns.h:X86_ET_* */
 # define XEN_DMOP_EVENT_ext_int    0 /* external interrupt */
 # define XEN_DMOP_EVENT_nmi        2 /* nmi */
 # define XEN_DMOP_EVENT_hw_exc     3 /* hardware exception */
-- 
2.39.5


