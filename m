Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E5DC589E28
	for <lists+xen-devel@lfdr.de>; Thu,  4 Aug 2022 17:05:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.380519.614725 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oJcPO-0002LS-6A; Thu, 04 Aug 2022 15:05:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 380519.614725; Thu, 04 Aug 2022 15:05:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oJcPO-0002Ka-2p; Thu, 04 Aug 2022 15:05:10 +0000
Received: by outflank-mailman (input) for mailman id 380519;
 Thu, 04 Aug 2022 15:05:08 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QMPZ=YI=citrix.com=prvs=2084bc4d8=Jane.Malalane@srs-se1.protection.inumbo.net>)
 id 1oJcPM-0001pR-Ds
 for xen-devel@lists.xenproject.org; Thu, 04 Aug 2022 15:05:08 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d2ed1192-1406-11ed-bd2d-47488cf2e6aa;
 Thu, 04 Aug 2022 17:05:06 +0200 (CEST)
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
X-Inumbo-ID: d2ed1192-1406-11ed-bd2d-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1659625506;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=rbJPwE6pO1Pfkj8tz43SWX+jW02vPu3YzO8jU4aC0vk=;
  b=EHYW9NA7DEHiuZ3i9Ccz+vU87QPCyndLt+hkkXGPYPr19+hr/paAZ/d4
   VtklaLbvSxHGtL0JssYjztWetGNiufqIaE74xNSY0/BtJyAJfjj943c+e
   n4jFF6SL8pJz7hRtMmaMlh3F7W2kTTR7qYblKRbfpXVm9GKYx9wtIj+MQ
   I=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 2.7
X-MesageID: 77380021
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: =?us-ascii?q?A9a23=3AF3uhQ6JiYW6qZF04FE//H55y250vRxNeGxJCi?=
 =?us-ascii?q?3AjJ82iE/EPTyDwt742D5P94fufO2Mly1YiPPZe5+jT09A7gBsgnHK1UfR4o?=
 =?us-ascii?q?TNGZHdDtA9arrtjBpDu2jUjUTckrYCczJuZyqIPmd8mQVzrEbEyFDn2krfYO?=
 =?us-ascii?q?PA0ArqimpAOqFj9+MsE6/VHefdJZF7HtuKO7xWrLPOsBwuuj32maZXGTKYi2?=
 =?us-ascii?q?LP/UgOkvayD2xE++K672sJ7H33HjbEjXNu/r1oRqm5wcBaRxG2Um2FVNt9Tk?=
 =?us-ascii?q?Ijm+YekHUxEHdcHvG7U9FxsHzNpwSAElCeU8pl0u5abKD5KGd8feXBLCEpHU?=
 =?us-ascii?q?oJVgtz8hNX0bzSf+IBpgqnNH3+GTgRzeRNkyVxYibP/4auGtZlBMXU/Hnmoe?=
 =?us-ascii?q?GPj/NKC7s+joT9qMh86VENs3UcyYjtsO4HyYcGlSZmQn+eXyehglK874Nwx1?=
 =?us-ascii?q?8YVj+OOuhex7GMx47KKlrm/M7bJoi6o9Z+9lyYwteYDIsrE7axinwlKZ5Fwz?=
 =?us-ascii?q?emQ9UYwjEI9e22qSgmgV9wZmnOFE5FsMsq3i4+Kmab76XgF5+F+l9FQ8V4Yn?=
 =?us-ascii?q?Pk7WHSKc33PjvakskUDB8C+H/SEHVUj50kMBy1q3x8OdFF7337nJd0HJ+kcB?=
 =?us-ascii?q?HptNPr4qgZAuD20LDShdSuqUZ4jkiZFLODb3zhoYogiVUPptKYWtxKWfDJlv?=
 =?us-ascii?q?FvpoeqWf8qyB4Mei6YFXUIeLEhgS/kft7Lbabjl4xjTUrAy31wVjhgnkQum+?=
 =?us-ascii?q?AfvE5/KoBYc+fVAqtCllWXCzrP1QJxM2xoZaAHTw7TDhtPCXCh0t0p+znYnJ?=
 =?us-ascii?q?fDDojcX0xD1nipWCzN3HvLpY0K/X+NpoFhfQW/pPYdB2dN2obKQSJOBDCgIY?=
 =?us-ascii?q?wsKEicTg4vdS6s+ynlVbgmNpamYb/yXMdng6Ra51DaQqwX3pjYD0k1jXoh4/?=
 =?us-ascii?q?PIP0EilUJkSbYaQezFCvHvIpR6qu4N/i2dxht1pALBcDKvfMjt5DEuE8J06O?=
 =?us-ascii?q?Ij90jU5d5i4ICnJSgOAM3/jBJEcVEW3aIk9DAK8ahlLnQwyww/oDzdgYSmUc?=
 =?us-ascii?q?ZbMIxQElayeZhZpnyrPl5Ezz7jabquZ9XdapBp6U3VL3WVWgAR9f7+ONNx8z?=
 =?us-ascii?q?nKH8TTGh/qa92MZ6O8GcYGb43y87ikphBYmSaPKX6y9nq2NaKguRGMxsxn6E?=
 =?us-ascii?q?EmE6wQP05oq57jcoNKjOiTLBpWZX5WcHMHtVu1P+nBayyD/Al2OJA+5ye7X2?=
 =?us-ascii?q?RcDYqA0kVerWudfqVnEpzyP+Xf4JYgBhlA4wF0qXn0Ua8CoKw0oPsuQqZw5T?=
 =?us-ascii?q?3mwPGhFAIl0xwKN4qvPMm2S/ORRB/5632zvJPCBoGT77ykNWbNYVdcYxgNlz?=
 =?us-ascii?q?055eX9CaqlUBMgZogtY3diwCfm1W68Jx61Nkqdybfl3gxssjvwYSKW4XmZcX?=
 =?us-ascii?q?1vz8tjHIaavga2gorbVr6eTiHYcmKaGIJB10BaFjwbLswNdG8FGj/TjJgTu+?=
 =?us-ascii?q?nel8ZDpfJqHg7crqcGDEcgyDq4Vb+5hDGURmN2HSPBoFDvi8a4GxqMrsUcKm?=
 =?us-ascii?q?7MrT7dE08VWacqmHwc3OE3WV5WSW4C3eNnmjLAY30S6ld9FfOWsoAr70owET?=
 =?us-ascii?q?RivYhqxrSR/Ry/16FEb6T/oXTagyXezsprU6ePO58XDD6ltMIPOLVhUwY14m?=
 =?us-ascii?q?/16RZ4zE57RT8DY9Ji49t9ugEZlI+RtUAYE4PKgwDPAvJuU9ZellO0wKDvuw?=
 =?us-ascii?q?jSQai31OXzmTESyvPEG+8qBdUNQY2wnab6u59LVzc+Mgzkk7MkaA94F5FYKy?=
 =?us-ascii?q?ncEx/K+09JqW/al6Ex7DTvyXiXWHiOR+reWZ/SWlwOe8NIO+R+YluHHD1Wqv?=
 =?us-ascii?q?6UsJiwhRdADluCO1eBk4m72FiNT5pOZ6v7dRajPYjp3xIMfZlT1lwkjG3S7l?=
 =?us-ascii?q?Pp57s4hyvvZlcY7dyj5wiysx1Q6nlPBnzyoQS4nRH+6GrhAMKhvts/CyuqYo?=
 =?us-ascii?q?ZxFPPMOY/3Aqfy4B47SqGywlfn3L3bHURaD9WKmM5rlAXVRn28hXrQXB71JW?=
 =?us-ascii?q?8j086zdqhuXtW8iDfbxJ0qljqYOLDjIbMEnIf5HWxvX472bd8+Oo5D9YIVSU?=
 =?us-ascii?q?l3XZGkMVVXs2izbPYAIpgYz833V1k4KsJJcIDBNajsjx7V57fNhTntl9O1SW?=
 =?us-ascii?q?odk88ffMKNwLRCZPMsP2LPPLoUEoF8D1u7B/UQCyLZkW35TCayl0Z/ujDF/n?=
 =?us-ascii?q?KuC2Z9CotUMCi+cYuzdZz6gnZzMLnu7iPYdHzn34PglQ3h0v7cKe7jpLhNVb?=
 =?us-ascii?q?/Fn/a7vUEZ+7lHJ5YaOHmgEgH/UWLqe4rxarvr+n59OYehsGcZ5hnZWx8DYt?=
 =?us-ascii?q?erWjWi4UT9pm07qoF2r0cfQOqb9AMc45NVzwirKYD4i2Bf9qgQJ8VA3xnIJq?=
 =?us-ascii?q?BVxB5gz3+dDVpkMTmKrtRpomS2SDv3yjmF1MTyCJCut+oxAmKILLP3R6zCi3?=
 =?us-ascii?q?grp3jRRiNB59qjO6WUTd3xuUI0ItIfIqJcDZnLKouq882miSk4UQ7Zu27nV2?=
 =?us-ascii?q?+Jh8GNsdyGU04zPsn5g0AWogGOQYiKrPuj6lZpuF2d6tFsq1RqslGoCLAAHW?=
 =?us-ascii?q?xi7yQ7TmOO3HiS6yRO8KRT600dz96c5ank8tH78I4enToqjv5mvTOs6Er/z/?=
 =?us-ascii?q?V0T2N4s/SWxbkDxg3QK5CkGVu6719we2H7HDYYMP8CQZmLDdUhj/tg+ptiM2?=
 =?us-ascii?q?98n5tCsNI6+C86arY6nQob98NohhNZKYyabEjW4/lE=3D?=
X-IronPort-AV: E=Sophos;i="5.93,216,1654574400"; 
   d="scan'208";a="77380021"
From: Jane Malalane <jane.malalane@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Jane Malalane <jane.malalane@citrix.com>, Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, Wei Liu
	<wl@xen.org>
Subject: [RFC PATCH 4/4] x86: Use linkage.h helpers to add tags to symbols
Date: Thu, 4 Aug 2022 16:04:24 +0100
Message-ID: <20220804150424.17584-5-jane.malalane@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20220804150424.17584-1-jane.malalane@citrix.com>
References: <20220804150424.17584-1-jane.malalane@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Clean up x86_64/kexec_reloc.S and x86_64/entry.S.

This fixes the livepatching contents of entry.S.

RFC: I'm unsure on where the page_fault symbol should end, i.e. if
unlike current code handle_exception_saved should be within page_fault
like handle_exception is or not.

Suggested-by: Andrew Cooper <andrew.cooper3@citrix.com>
Signed-off-by: Jane Malalane <jane.malalane@citrix.com>
---
CC: Jan Beulich <jbeulich@suse.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>
CC: "Roger Pau Monné" <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>
---
 xen/arch/x86/x86_64/entry.S       | 105 +++++++++++++++++++++++++-------------
 xen/arch/x86/x86_64/kexec_reloc.S |  43 ++++++----------
 2 files changed, 86 insertions(+), 62 deletions(-)

diff --git a/xen/arch/x86/x86_64/entry.S b/xen/arch/x86/x86_64/entry.S
index 4ad25d9c90..7dc280aafa 100644
--- a/xen/arch/x86/x86_64/entry.S
+++ b/xen/arch/x86/x86_64/entry.S
@@ -11,6 +11,7 @@
 #include <asm/processor.h>
 #include <public/xen.h>
 #include <irq_vectors.h>
+#include <xen/linkage.h>
 
 /* %rsp: struct cpu_user_regs */
 .macro ASSERT_CONTEXT_IS_XEN
@@ -152,7 +153,7 @@ process_trap:
         .section .text.entry, "ax", @progbits
 
 /* %rbx: struct vcpu, interrupts disabled */
-restore_all_guest:
+SYM_CODE_START_LOCAL(restore_all_guest)
         ASSERT_INTERRUPTS_DISABLED
 
         /* Stash guest SPEC_CTRL value while we can read struct vcpu. */
@@ -239,6 +240,7 @@ iret_exit_to_guest:
         addq  $8,%rsp
 .Lft0:  iretq
         _ASM_PRE_EXTABLE(.Lft0, handle_exception)
+SYM_CODE_END(restore_all_guest)
 
 /*
  * When entering SYSCALL from kernel mode:
@@ -255,7 +257,7 @@ iret_exit_to_guest:
  *  - Guest %rsp stored in %rax
  *  - Xen stack loaded, pointing at the %ss slot
  */
-ENTRY(lstar_enter)
+SYM_CODE_START(lstar_enter)
 #ifdef CONFIG_XEN_SHSTK
         ALTERNATIVE "", "setssbsy", X86_FEATURE_XEN_SHSTK
 #endif
@@ -290,9 +292,10 @@ ENTRY(lstar_enter)
         mov   %rsp, %rdi
         call  pv_hypercall
         jmp   test_all_events
+SYM_CODE_END(lstar_enter)
 
 /* See lstar_enter for entry register state. */
-ENTRY(cstar_enter)
+SYM_CODE_START(cstar_enter)
 #ifdef CONFIG_XEN_SHSTK
         ALTERNATIVE "", "setssbsy", X86_FEATURE_XEN_SHSTK
 #endif
@@ -329,8 +332,9 @@ ENTRY(cstar_enter)
         jne   compat_syscall
 #endif
         jmp   switch_to_kernel
+SYM_CODE_END(cstar_enter)
 
-ENTRY(sysenter_entry)
+SYM_CODE_START(sysenter_entry)
         ENDBR64
 #ifdef CONFIG_XEN_SHSTK
         ALTERNATIVE "", "setssbsy", X86_FEATURE_XEN_SHSTK
@@ -339,7 +343,7 @@ ENTRY(sysenter_entry)
         pushq $FLAT_USER_SS
         pushq $0
         pushfq
-GLOBAL(sysenter_eflags_saved)
+SYM_INNER_LABEL_GLOBAL(sysenter_eflags_saved)
         ALTERNATIVE "", clac, X86_FEATURE_XEN_SMAP
         pushq $3 /* ring 3 null cs */
         pushq $0 /* null rip */
@@ -393,8 +397,9 @@ UNLIKELY_END(sysenter_gpf)
         jne   compat_sysenter
 #endif
         jmp   .Lbounce_exception
+SYM_CODE_END(sysenter_entry)
 
-ENTRY(int80_direct_trap)
+SYM_CODE_START(int80_direct_trap)
         ENDBR64
         ALTERNATIVE "", clac, X86_FEATURE_XEN_SMAP
         pushq $0
@@ -465,8 +470,9 @@ UNLIKELY_END(msi_check)
 
         call  create_bounce_frame
         jmp   test_all_events
+SYM_CODE_END(int80_direct_trap)
 
-int80_slow_path:
+SYM_CODE_START_LOCAL(int80_slow_path)
         /* 
          * Setup entry vector and error code as if this was a GPF caused by an
          * IDT entry with DPL==0.
@@ -482,6 +488,7 @@ int80_slow_path:
          */
         GET_STACK_END(14)
         jmp   handle_exception_saved
+SYM_CODE_END(int80_slow_path)
 
         /* create_bounce_frame & helpers don't need to be in .text.entry */
         .text
@@ -657,9 +664,8 @@ ret_from_intr:
 
         .section .text.entry, "ax", @progbits
 
-        ALIGN
 /* No special register assumptions. */
-restore_all_xen:
+SYM_CODE_START_LOCAL(restore_all_xen)
         /*
          * Check whether we need to switch to the per-CPU page tables, in
          * case we return to late PV exit code (from an NMI or #MC).
@@ -676,8 +682,9 @@ UNLIKELY_END(exit_cr3)
 
         RESTORE_ALL adj=8
         iretq
+SYM_CODE_END(restore_all_xen)
 
-ENTRY(common_interrupt)
+SYM_CODE_START(common_interrupt)
         ALTERNATIVE "", clac, X86_FEATURE_XEN_SMAP
         SAVE_ALL
 
@@ -706,12 +713,14 @@ ENTRY(common_interrupt)
         mov   %r15, STACK_CPUINFO_FIELD(xen_cr3)(%r14)
         mov   %bl, STACK_CPUINFO_FIELD(use_pv_cr3)(%r14)
         jmp ret_from_intr
+SYM_CODE_END(common_interrupt)
 
-ENTRY(page_fault)
+SYM_CODE_START(page_fault)
         ENDBR64
         movl  $TRAP_page_fault,4(%rsp)
+
 /* No special register assumptions. */
-GLOBAL(handle_exception)
+SYM_INNER_LABEL_GLOBAL(handle_exception)
         ALTERNATIVE "", clac, X86_FEATURE_XEN_SMAP
         SAVE_ALL
 
@@ -734,7 +743,7 @@ GLOBAL(handle_exception)
         cmovnz %r12d, %r13d
 .Lxcpt_cr3_okay:
 
-handle_exception_saved:
+SYM_INNER_LABEL_LOCAL(handle_exception_saved)
         GET_CURRENT(bx)
         testb $X86_EFLAGS_IF>>8,UREGS_eflags+1(%rsp)
         jz    exception_with_ints_disabled
@@ -842,9 +851,10 @@ handle_exception_saved:
         ASSERT_CONTEXT_IS_XEN
         jmp   restore_all_xen
 #endif
+SYM_CODE_END(page_fault)
 
 /* No special register assumptions. */
-exception_with_ints_disabled:
+SYM_CODE_START_LOCAL(exception_with_ints_disabled)
         testb $3,UREGS_cs(%rsp)         # interrupts disabled outside Xen?
         jnz   FATAL_exception_with_ints_disabled
         movq  %rsp,%rdi
@@ -874,99 +884,116 @@ exception_with_ints_disabled:
         mov   %r15, STACK_CPUINFO_FIELD(xen_cr3)(%r14)
         mov   %r13b, STACK_CPUINFO_FIELD(use_pv_cr3)(%r14)
         jmp   restore_all_xen           # return to fixup code
+SYM_CODE_END(exception_with_ints_disabled)
 
 /* No special register assumptions. */
-FATAL_exception_with_ints_disabled:
+SYM_CODE_START_LOCAL(FATAL_exception_with_ints_disabled)
         xorl  %esi,%esi
         movq  %rsp,%rdi
         call  fatal_trap
         BUG   /* fatal_trap() shouldn't return. */
+SYM_CODE_END(FATAL_exception_with_ints_disabled)
 
-ENTRY(divide_error)
+SYM_CODE_START(divide_error)
         ENDBR64
         pushq $0
         movl  $TRAP_divide_error,4(%rsp)
         jmp   handle_exception
+SYM_CODE_END(divide_error)
 
-ENTRY(coprocessor_error)
+SYM_CODE_START(coprocessor_error)
         ENDBR64
         pushq $0
         movl  $TRAP_copro_error,4(%rsp)
         jmp   handle_exception
+SYM_CODE_END(coprocessor_error)
 
-ENTRY(simd_coprocessor_error)
+SYM_CODE_START(simd_coprocessor_error)
         ENDBR64
         pushq $0
         movl  $TRAP_simd_error,4(%rsp)
         jmp   handle_exception
+SYM_CODE_END(simd_coprocessor_error)
 
-ENTRY(device_not_available)
+SYM_CODE_START(device_not_available)
         ENDBR64
         pushq $0
         movl  $TRAP_no_device,4(%rsp)
         jmp   handle_exception
+SYM_CODE_END(device_not_available)
 
-ENTRY(debug)
+SYM_CODE_START(debug)
         ENDBR64
         pushq $0
         movl  $TRAP_debug,4(%rsp)
         jmp   handle_ist_exception
+SYM_CODE_END(debug)
 
-ENTRY(int3)
+SYM_CODE_START(int3)
         ENDBR64
         pushq $0
         movl  $TRAP_int3,4(%rsp)
         jmp   handle_exception
+SYM_CODE_END(int3)
 
-ENTRY(overflow)
+SYM_CODE_START(overflow)
         ENDBR64
         pushq $0
         movl  $TRAP_overflow,4(%rsp)
         jmp   handle_exception
+SYM_CODE_END(overflow)
 
-ENTRY(bounds)
+SYM_CODE_START(bounds)
         ENDBR64
         pushq $0
         movl  $TRAP_bounds,4(%rsp)
         jmp   handle_exception
+SYM_CODE_END(bounds)
 
-ENTRY(invalid_op)
+SYM_CODE_START(invalid_op)
         ENDBR64
         pushq $0
         movl  $TRAP_invalid_op,4(%rsp)
         jmp   handle_exception
+SYM_CODE_END(invalid_op)
 
-ENTRY(invalid_TSS)
+SYM_CODE_START(invalid_TSS)
         ENDBR64
         movl  $TRAP_invalid_tss,4(%rsp)
         jmp   handle_exception
+SYM_CODE_END(invalid_TSS)
 
-ENTRY(segment_not_present)
+SYM_CODE_START(segment_not_present)
         ENDBR64
         movl  $TRAP_no_segment,4(%rsp)
         jmp   handle_exception
+SYM_CODE_END(segment_not_present)
 
-ENTRY(stack_segment)
+SYM_CODE_START(stack_segment)
         ENDBR64
         movl  $TRAP_stack_error,4(%rsp)
         jmp   handle_exception
+SYM_CODE_END(stack_segment)
 
-ENTRY(general_protection)
+SYM_CODE_START(general_protection)
         ENDBR64
         movl  $TRAP_gp_fault,4(%rsp)
         jmp   handle_exception
+SYM_CODE_END(general_protection)
 
-ENTRY(alignment_check)
+SYM_CODE_START(alignment_check)
         ENDBR64
         movl  $TRAP_alignment_check,4(%rsp)
         jmp   handle_exception
+SYM_CODE_END(alignment_check)
 
-ENTRY(entry_CP)
+SYM_CODE_START(entry_CP)
         ENDBR64
         movl  $X86_EXC_CP, 4(%rsp)
         jmp   handle_exception
+SYM_CODE_END(entry_CP)
 
-ENTRY(double_fault)
+SYM_CODE_START(double_fault)
         ENDBR64
         movl  $TRAP_double_fault,4(%rsp)
         /* Set AC to reduce chance of further SMAP faults */
@@ -990,12 +1017,13 @@ ENTRY(double_fault)
         movq  %rsp,%rdi
         call  do_double_fault
         BUG   /* do_double_fault() shouldn't return. */
+SYM_CODE_END(double_fault)
 
-ENTRY(nmi)
+SYM_CODE_START(nmi)
         ENDBR64
         pushq $0
         movl  $TRAP_nmi,4(%rsp)
-handle_ist_exception:
+SYM_INNER_LABEL_LOCAL(handle_ist_exception)
         ALTERNATIVE "", clac, X86_FEATURE_XEN_SMAP
         SAVE_ALL
 
@@ -1119,17 +1147,20 @@ handle_ist_exception:
         ASSERT_CONTEXT_IS_XEN
         jmp   restore_all_xen
 #endif
+SYM_CODE_END(nmi)
 
-ENTRY(machine_check)
+SYM_CODE_START(machine_check)
         ENDBR64
         pushq $0
         movl  $TRAP_machine_check,4(%rsp)
         jmp   handle_ist_exception
+SYM_CODE_END(machine_check)
 
 /* No op trap handler.  Required for kexec crash path. */
-GLOBAL(trap_nop)
+SYM_CODE_START_NOALIGN(trap_nop)
         ENDBR64
         iretq
+SYM_CODE_END(trap_nop)
 
 /* Table of automatically generated entry points.  One per vector. */
         .pushsection .init.rodata, "a", @progbits
@@ -1142,7 +1173,8 @@ GLOBAL(autogen_entrypoints)
         .endm
 
         .popsection
-autogen_stubs: /* Automatically generated stubs. */
+/* Automatically generated stubs. */
+SYM_CODE_START_LOCAL(autogen_stubs)
 
         vec = 0
         .rept X86_NR_VECTORS
@@ -1186,6 +1218,7 @@ autogen_stubs: /* Automatically generated stubs. */
 
         vec = vec + 1
         .endr
+SYM_CODE_END(autogen_stubs)
 
         .section .init.rodata, "a", @progbits
         .size autogen_entrypoints, . - autogen_entrypoints
diff --git a/xen/arch/x86/x86_64/kexec_reloc.S b/xen/arch/x86/x86_64/kexec_reloc.S
index f4842025eb..5f96c74085 100644
--- a/xen/arch/x86/x86_64/kexec_reloc.S
+++ b/xen/arch/x86/x86_64/kexec_reloc.S
@@ -14,6 +14,7 @@
         .file __FILE__
 
 #include <xen/kimage.h>
+#include <xen/linkage.h>
 
 #include <asm/asm_defns.h>
 #include <asm/msr-index.h>
@@ -24,7 +25,7 @@
         .align PAGE_SIZE
         .code64
 
-ENTRY(kexec_reloc)
+SYM_FUNC_START(kexec_reloc)
         /* %rdi - code page maddr */
         /* %rsi - page table maddr */
         /* %rdx - indirection page maddr */
@@ -92,8 +93,9 @@ ENTRY(kexec_reloc)
 
         /* Enter compatibility mode. */
         ljmp    *compatibility_mode_far(%rip)
+SYM_FUNC_END(kexec_reloc)
 
-relocate_pages:
+SYM_FUNC_START_LOCAL(relocate_pages)
         /* %rdi - indirection page maddr */
         pushq   %rbx
 
@@ -141,8 +143,9 @@ relocate_pages:
         ret
 
         .code32
+SYM_FUNC_END(relocate_pages)
 
-compatibility_mode:
+SYM_FUNC_START_LOCAL(compatibility_mode)
         /* Setup some sane segments. */
         movl    $0x0008, %eax
         movl    %eax, %ds
@@ -169,46 +172,34 @@ compatibility_mode:
         /* Call the image entry point.  This should never return. */
         call    *%ebp
         ud2
+SYM_FUNC_END(compatibility_mode)
 
-        .align 4
-compatibility_mode_far:
+SYM_DATA_START_LOCAL(compatibility_mode_far)
         .long 0x00000000             /* set in call_32_bit above */
         .word 0x0010
+SYM_DATA_END(compatibility_mode_far)
 
-        .type compatibility_mode_far, @object
-        .size compatibility_mode_far, . - compatibility_mode_far
-
-compat_mode_gdt_desc:
+SYM_DATA_START_LOCAL(compat_mode_gdt_desc)
         .word .Lcompat_mode_gdt_end - compat_mode_gdt -1
         .quad 0x0000000000000000     /* set in call_32_bit above */
+SYM_DATA_END(compat_mode_gdt_desc)
 
-        .type compat_mode_gdt_desc, @object
-        .size compat_mode_gdt_desc, . - compat_mode_gdt_desc
-
-        .align 8
-compat_mode_gdt:
+SYM_DATA_START_LOCAL(compat_mode_gdt)
         .quad 0x0000000000000000     /* null                              */
         .quad 0x00cf93000000ffff     /* 0x0008 ring 0 data                */
         .quad 0x00cf9b000000ffff     /* 0x0010 ring 0 code, compatibility */
 .Lcompat_mode_gdt_end:
+SYM_DATA_END(compat_mode_gdt)
 
-        .type compat_mode_gdt, @object
-        .size compat_mode_gdt, . - compat_mode_gdt
-
-compat_mode_idt:
+SYM_DATA_START_LOCAL(compat_mode_idt)
         .word 0                      /* limit */
         .long 0                      /* base */
-
-        .type compat_mode_idt, @object
-        .size compat_mode_idt, . - compat_mode_idt
+SYM_DATA_END(compat_mode_idt)
 
         /*
          * 16 words of stack are more than enough.
          */
-        .align 8
-reloc_stack:
+SYM_DATA_START_LOCAL(reloc_stack)
         .fill 16,8,0
 .Lreloc_stack_base:
-
-        .type reloc_stack, @object
-        .size reloc_stack, . - reloc_stack
+SYM_DATA_END(reloc_stack)
-- 
2.11.0


