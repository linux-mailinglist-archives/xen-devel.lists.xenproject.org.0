Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B9EF71E4E3C
	for <lists+xen-devel@lfdr.de>; Wed, 27 May 2020 21:34:52 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1je1oj-0006Ze-7M; Wed, 27 May 2020 19:34:21 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/dLv=7J=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1je1oh-0006ZZ-NH
 for xen-devel@lists.xenproject.org; Wed, 27 May 2020 19:34:19 +0000
X-Inumbo-ID: 0e5e31e8-a051-11ea-8993-bc764e2007e4
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0e5e31e8-a051-11ea-8993-bc764e2007e4;
 Wed, 27 May 2020 19:34:18 +0000 (UTC)
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: 1Fy0vTmIqdblFkHjLrUVZU3/BmKXzCKiM8pMK5MITBvTnvTgIv0MZhoxUPvTF3MWxpbVwfe6yi
 1gGDaBuP2Bi6nW0jfWOzXb0YE1UD+QTOupodLlegaGD1PVAf7X3YHY1n88wHDOxoAtmerMJCPm
 iEJxzbXvy/KcjtqHr3kOOkspOJTy/m88xlA3kywA/KvGrY3mKVmqihgZcNDjCu9LZ35jc/0Pea
 XqNB90JuXdcgrbb2mjNujuLyhUuc60vtdpYi36yQPh1BhtCVt19cTDBfnIZryDjbGRe5mqJbfi
 Ezc=
X-SBRS: 2.7
X-MesageID: 18947884
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,442,1583211600"; d="scan'208";a="18947884"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Subject: [PATCH v2 12/14] x86/entry: Adjust guest paths to be shadow stack
 compatible
Date: Wed, 27 May 2020 20:18:45 +0100
Message-ID: <20200527191847.17207-13-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20200527191847.17207-1-andrew.cooper3@citrix.com>
References: <20200527191847.17207-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 Jan Beulich <JBeulich@suse.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

The SYSCALL/SYSENTER/SYSRET paths need to use {SET,CLR}SSBSY.  The IRET to
guest paths must not.  In the SYSRET path, re-position the mov which loads rip
into %rcx so we can use %rcx for CLRSSBSY, rather than spilling another
register to the stack.

While we can in principle detect shadow stack corruption and a failure to
clear the supervisor token busy bit in the SYSRET path (by inspecting the
carry flag following CLRSSBSY), we cannot detect similar problems for the IRET
path (IRET is specified not to fault in this case).

We will double fault at some point later, when next trying to enter Xen, due
to an already-set supervisor shadow stack busy bit.  As SYSRET is a uncommon
path anyway, avoid the added complexity for no appreciable gain.

The IST switch onto the primary stack is not great as we have an instruction
boundary with no shadow stack.  This is the least bad option available.

These paths are not used before shadow stacks are properly established, so can
use alternatives to avoid extra runtime CET detection logic.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Wei Liu <wl@xen.org>
CC: Roger Pau Monné <roger.pau@citrix.com>

v2:
 * Break comment deletion out to an earlier patch
 * SETSSBSY on the SYSENTER path as well
 * Don't spill %rax to the stack in the SYSRET path
---
 xen/arch/x86/x86_64/compat/entry.S |  1 +
 xen/arch/x86/x86_64/entry.S        | 32 +++++++++++++++++++++++++++++++-
 2 files changed, 32 insertions(+), 1 deletion(-)

diff --git a/xen/arch/x86/x86_64/compat/entry.S b/xen/arch/x86/x86_64/compat/entry.S
index 3cd375bd48..2ca81341a4 100644
--- a/xen/arch/x86/x86_64/compat/entry.S
+++ b/xen/arch/x86/x86_64/compat/entry.S
@@ -198,6 +198,7 @@ ENTRY(cr4_pv32_restore)
 
 /* See lstar_enter for entry register state. */
 ENTRY(cstar_enter)
+        ALTERNATIVE "", "setssbsy", X86_FEATURE_XEN_SHSTK
         /* sti could live here when we don't switch page tables below. */
         CR4_PV32_RESTORE
         movq  8(%rsp),%rax /* Restore %rax. */
diff --git a/xen/arch/x86/x86_64/entry.S b/xen/arch/x86/x86_64/entry.S
index 78ac0df49f..449ee468e4 100644
--- a/xen/arch/x86/x86_64/entry.S
+++ b/xen/arch/x86/x86_64/entry.S
@@ -191,9 +191,16 @@ restore_all_guest:
         sarq  $47,%rcx
         incl  %ecx
         cmpl  $1,%ecx
-        movq  8(%rsp),%rcx            # RIP
         ja    iret_exit_to_guest
 
+        /* Clear the supervisor shadow stack token busy bit. */
+.macro rag_clrssbsy
+        rdsspq %rcx
+        clrssbsy (%rcx)
+.endm
+        ALTERNATIVE "", rag_clrssbsy, X86_FEATURE_XEN_SHSTK
+
+        movq  8(%rsp), %rcx           # RIP
         cmpw  $FLAT_USER_CS32,16(%rsp)# CS
         movq  32(%rsp),%rsp           # RSP
         je    1f
@@ -226,6 +233,7 @@ iret_exit_to_guest:
  * %ss must be saved into the space left by the trampoline.
  */
 ENTRY(lstar_enter)
+        ALTERNATIVE "", "setssbsy", X86_FEATURE_XEN_SHSTK
         /* sti could live here when we don't switch page tables below. */
         movq  8(%rsp),%rax /* Restore %rax. */
         movq  $FLAT_KERNEL_SS,8(%rsp)
@@ -259,6 +267,7 @@ ENTRY(lstar_enter)
         jmp   test_all_events
 
 ENTRY(sysenter_entry)
+        ALTERNATIVE "", "setssbsy", X86_FEATURE_XEN_SHSTK
         /* sti could live here when we don't switch page tables below. */
         pushq $FLAT_USER_SS
         pushq $0
@@ -877,6 +886,27 @@ handle_ist_exception:
         movl  $UREGS_kernel_sizeof/8,%ecx
         movq  %rdi,%rsp
         rep   movsq
+
+        /* Switch Shadow Stacks */
+.macro ist_switch_shstk
+        rdsspq %rdi
+        clrssbsy (%rdi)
+        /*
+         * Switching supervisor shadow stacks is specially hard, as supervisor
+         * and restore tokens are incompatible.
+         *
+         * For now, we only need to switch on to an unused primary shadow
+         * stack, so use SETSSBSY for the purpose, exactly like the
+         * SYSCALL/SYSENTER entry.
+         *
+         * Ideally, we'd want to CLRSSBSY after switching stacks, but that
+         * will leave SSP zeroed so it not an option.  Instead, we transiently
+         * have a zero SSP on this instruction boundary, and depend on IST for
+         * NMI/#MC protection.
+         */
+        setssbsy
+.endm
+        ALTERNATIVE "", ist_switch_shstk, X86_FEATURE_XEN_SHSTK
 1:
 #else
         ASSERT_CONTEXT_IS_XEN
-- 
2.11.0


