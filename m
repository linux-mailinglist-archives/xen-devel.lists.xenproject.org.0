Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FACE7A21AA
	for <lists+xen-devel@lfdr.de>; Fri, 15 Sep 2023 17:01:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.603207.940136 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qhAJO-0004l5-Ky; Fri, 15 Sep 2023 15:00:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 603207.940136; Fri, 15 Sep 2023 15:00:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qhAJO-0004dm-HO; Fri, 15 Sep 2023 15:00:50 +0000
Received: by outflank-mailman (input) for mailman id 603207;
 Fri, 15 Sep 2023 15:00:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Zf2R=E7=citrix.com=prvs=615989724=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1qhAJN-0004UV-01
 for xen-devel@lists.xenproject.org; Fri, 15 Sep 2023 15:00:49 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a741277f-53d8-11ee-8788-cb3800f73035;
 Fri, 15 Sep 2023 17:00:48 +0200 (CEST)
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
X-Inumbo-ID: a741277f-53d8-11ee-8788-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1694790048;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=TtLZP+3qIQQSlR+qOYXKHN3/07wVBW9kau99ogGnBZk=;
  b=Mkex/qgXmBpIT9rvDQGxQ4NzAr/1lcl5kg5XXxGrZsX6RuawAXJG5ZmJ
   +GLiYXN/VtzkcwTyL1HqSsAc0Ws3h0QiJyy3+kwLCqaFxGJw4dhYZ48LJ
   R5UfibZvlUbH/bdqkdH2XthWxAzAyH9V8S/S5Wt7CWgUZb51t49o4KtWg
   o=;
X-CSE-ConnectionGUID: X/kd13lbTuuvW1qLdo0dGQ==
X-CSE-MsgGUID: eyR7kQ8bR6y6ixMxkAXS4w==
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 123201211
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
X-ThreatScanner-Verdict: Negative
IronPort-Data: A9a23:hVEh0a96e4iFdMqnzRk6DrUDn36TJUtcMsCJ2f8bNWPcYEJGY0x3x
 jRKWz+Ha6zcNGD1L98kbI6x8x5Q6p7XzNcwSVQ+rno8E34SpcT7XtnIdU2Y0wF+jCHgZBk+s
 5hBMImowOQcFCK0SsKFa+C5xZVE/fjVAOK6UKidYnwZqTZMEE8JkQhkl/MynrlmiN24BxLlk
 d7pqojUNUTNNwRcawr40Ird7ks11BjOkGlA5AdmNKkW5AW2e0Q9V/rzG4ngdxMUfaEMdgKKb
 76r5K20+Grf4yAsBruN+losWhRXKlJ6FVHmZkt+A8BOsDAbzsAB+v9T2M4nQVVWk120c+VZk
 72hg3ASpTABZcUgkMxFO/VR/roX0aduoNcrKlDn2SCfItGvn9IBDJyCAWlvVbD09NqbDkl+s
 v8UcWsJZCyemvyJmaufRu40iusaeZyD0IM34hmMzBncBPciB5vCX7/L9ZlT2zJYasJmRKiEI
 ZBDMHw2MUqGOkcUUrsUIMtWcOOAr3/zaTBH7nmSorI6+TP7xw1tyrn9dtHSf7RmQO0MxB3C/
 jucpj2R7hcyOc2lljm8oniW2P6RnDPeSIE7JIbk6as/6LGU7jNKU0BHPbehmtGph0j7V99BJ
 kg8/is1sbN05EGtVsP6XRCzvDiDpBF0c/h6HvA+6QqN4rHJ+AvfDW8BJhZebPQ2uclwQiYlv
 mJlhPuwW2Yp6ufMDyvAqPHN92ja1TUpwXEqVWgHQVJe59PfvZwtsUvWatpkSKKat4igcd3v+
 AyioC87jrQVqMcE0aSn4FzK6w6RSoj1oh0dvVuOAD/8hu9tTMv8PtHztwCHhRpVBNzBJmRtq
 kTojCR3AAomKZiW3BKAT+wWdF1Cz6bUaWaM6bKD8nRIythMx5JBVdoAiN2dDB0zWirhRdMOS
 BaJ0T69HLcJYBOXgVZfOupd8fgCw6n6DsjCXfvJdNdIaZUZXFbZrX0xPBDLhDGyyRhEfUQD1
 XGzK57E4ZEyU/8P8dZLb71Fje9DKt4Wmws/uqwXPzz4iOHDNRZ5uJ8OMUeUb/BR0U93iFy9z
 jqrDOPTk083eLSnMkHqHXs7cQhiwY4TWcqn9KS6t4erfmJbJY3WI6SNmel7It0/zvQ9eyWh1
 ijVZ3K0AWHX3RXvQThmoFg6AF8zdf6TdU4GABE=
IronPort-HdrOrdr: A9a23:vbMVKqrjiZtVGwPSTliQoVMaV5rveYIsimQD101hICG9Evb0qy
 nOpoV/6faQslwssR4b9uxoVJPvfZq+z+8W3WByB9eftWDd0QPFEGgL1+DfKlbbak7DH4BmtJ
 uJc8JFeafN5VoRt7eG3OFveexQvOVu88qT9JjjJ28Gd3APV0n5hT0JcjpyFCdNNW57LKt8Lr
 WwzOxdqQGtfHwGB/7LfUXsD4D41rv2fIuNW29+OyIa
X-Talos-CUID: 9a23:cC+Yq27vzzBFUhJF79ssxAkXFpl+dnfh0WrOHBahLWpuELG6cArF
X-Talos-MUID: 9a23:q9Z/AgowkSQu2mPbEvcezzxzDphr2vSkMh4cz5QWntmHHBxLZyjI2Q==
X-IronPort-AV: E=Sophos;i="6.02,149,1688443200"; 
   d="scan'208";a="123201211"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH 6/9] x86/entry: Track the IST-ness of an entry for the exit paths
Date: Fri, 15 Sep 2023 16:00:35 +0100
Message-ID: <20230915150038.602577-7-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230915150038.602577-1-andrew.cooper3@citrix.com>
References: <20230915150038.602577-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Use %r12 to hold an ist_exit boolean.  This register is zero elsewhere in the
entry/exit asm, so it only needs setting in the IST path.

As this is subtle and fragile, add check_ist_exit() to be used in debugging
builds to cross-check that the ist_exit boolean matches the entry vector.

Write check_ist_exit() it in C, because it's debug only and the logic more
complicated than I care to maintain in asm.

For now, we only need to use this signal in the exit-to-Xen path, but some
exit-to-guest paths happen in IST context too.  Check the correctness in all
exit paths to avoid the logic bitrotting.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>

v2:
 * %r12 -> %r12d
 * Extend commit message
 * Tweak surrounding context
---
 xen/arch/x86/traps.c               | 13 +++++++++++++
 xen/arch/x86/x86_64/compat/entry.S |  9 ++++++++-
 xen/arch/x86/x86_64/entry.S        | 22 ++++++++++++++++++++--
 3 files changed, 41 insertions(+), 3 deletions(-)

diff --git a/xen/arch/x86/traps.c b/xen/arch/x86/traps.c
index dead728ce329..0a005f088bca 100644
--- a/xen/arch/x86/traps.c
+++ b/xen/arch/x86/traps.c
@@ -2259,6 +2259,19 @@ void asm_domain_crash_synchronous(unsigned long addr)
         do_softirq();
 }
 
+#ifdef CONFIG_DEBUG
+void check_ist_exit(const struct cpu_user_regs *regs, bool ist_exit)
+{
+    const unsigned int ist_mask =
+        (1U << X86_EXC_NMI) | (1U << X86_EXC_DB) |
+        (1U << X86_EXC_DF)  | (1U << X86_EXC_MC);
+    uint8_t ev = regs->entry_vector;
+    bool is_ist = (ev < X86_EXC_NUM) && ((1U << ev) & ist_mask);
+
+    ASSERT(is_ist == ist_exit);
+}
+#endif
+
 /*
  * Local variables:
  * mode: C
diff --git a/xen/arch/x86/x86_64/compat/entry.S b/xen/arch/x86/x86_64/compat/entry.S
index bd5abd8040bd..7504bfb4f326 100644
--- a/xen/arch/x86/x86_64/compat/entry.S
+++ b/xen/arch/x86/x86_64/compat/entry.S
@@ -117,8 +117,15 @@ compat_process_trap:
         call  compat_create_bounce_frame
         jmp   compat_test_all_events
 
-/* %rbx: struct vcpu, interrupts disabled */
+/* %rbx: struct vcpu, %r12: ist_exit, interrupts disabled */
 ENTRY(compat_restore_all_guest)
+
+#ifdef CONFIG_DEBUG
+        mov   %rsp, %rdi
+        mov   %r12, %rsi
+        call  check_ist_exit
+#endif
+
         ASSERT_INTERRUPTS_DISABLED
         mov   $~(X86_EFLAGS_IOPL | X86_EFLAGS_VM), %r11d
         and   UREGS_eflags(%rsp),%r11d
diff --git a/xen/arch/x86/x86_64/entry.S b/xen/arch/x86/x86_64/entry.S
index 525877e97330..e5055e5bbf9f 100644
--- a/xen/arch/x86/x86_64/entry.S
+++ b/xen/arch/x86/x86_64/entry.S
@@ -142,8 +142,15 @@ process_trap:
 
         .section .text.entry, "ax", @progbits
 
-/* %rbx: struct vcpu, interrupts disabled */
+/* %rbx: struct vcpu, %r12: ist_exit, interrupts disabled */
 restore_all_guest:
+
+#ifdef CONFIG_DEBUG
+        mov   %rsp, %rdi
+        mov   %r12, %rsi
+        call  check_ist_exit
+#endif
+
         ASSERT_INTERRUPTS_DISABLED
 
         /* Stash guest SPEC_CTRL value while we can read struct vcpu. */
@@ -659,8 +666,15 @@ ENTRY(early_page_fault)
         .section .text.entry, "ax", @progbits
 
         ALIGN
-/* No special register assumptions. */
+/* %r12=ist_exit */
 restore_all_xen:
+
+#ifdef CONFIG_DEBUG
+        mov   %rsp, %rdi
+        mov   %r12, %rsi
+        call  check_ist_exit
+#endif
+
         /*
          * Check whether we need to switch to the per-CPU page tables, in
          * case we return to late PV exit code (from an NMI or #MC).
@@ -1087,6 +1101,10 @@ handle_ist_exception:
 .L_ist_dispatch_done:
         mov   %r15, STACK_CPUINFO_FIELD(xen_cr3)(%r14)
         mov   %bl, STACK_CPUINFO_FIELD(use_pv_cr3)(%r14)
+
+        /* This is an IST exit */
+        mov   $1, %r12d
+
         cmpb  $X86_EXC_NMI, UREGS_entry_vector(%rsp)
         jne   ret_from_intr
 
-- 
2.30.2


