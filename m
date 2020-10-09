Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C3DAF288816
	for <lists+xen-devel@lfdr.de>; Fri,  9 Oct 2020 13:54:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.4748.12505 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kQqxe-0003c1-Us; Fri, 09 Oct 2020 11:53:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 4748.12505; Fri, 09 Oct 2020 11:53:22 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kQqxe-0003bc-Rf; Fri, 09 Oct 2020 11:53:22 +0000
Received: by outflank-mailman (input) for mailman id 4748;
 Fri, 09 Oct 2020 11:53:21 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=n4y9=DQ=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1kQqxd-0003bX-TI
 for xen-devel@lists.xenproject.org; Fri, 09 Oct 2020 11:53:21 +0000
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 90eee37d-9c55-40c3-98cc-237243b2ef52;
 Fri, 09 Oct 2020 11:53:19 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=n4y9=DQ=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
	id 1kQqxd-0003bX-TI
	for xen-devel@lists.xenproject.org; Fri, 09 Oct 2020 11:53:21 +0000
X-Inumbo-ID: 90eee37d-9c55-40c3-98cc-237243b2ef52
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 90eee37d-9c55-40c3-98cc-237243b2ef52;
	Fri, 09 Oct 2020 11:53:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1602244399;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=EUFUGG6ye4lWDbsiaxpUUwbssNRy7ER5uCtlxpcnJ2U=;
  b=WJIogR5OUFWIP0AW7i3PfxIFwt7x9xPOx2NKMKAp7ioXHyqjk6W55ZBg
   pFbZ5eQ+iqLpRbXa9rmUKmuEAnZWm8ulb0czQ2v3uHEdHsyseMjrGQFju
   tWtyOGAb2MCNpzTAfdMPfbnTdZ1Lca114nlUsgnLnZ6A+amz8xUImB8Cz
   c=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: X8EsZJ07r3jUjvM5t0W4Xg/s0lWwHFcSHZDUvpOsRT6XsMvDQyP5hKx0JL8mL/YG1ufvaKKAt3
 +/FO7V1aTSGlih4unrD/t/8L2AeTgu22DxB7uu9tIV9/LaZzzbpIXEurzbZ+G/O9QVlXSfNxaA
 NuigFk/CPlWQjLeervIWP1UU8fOdZfQf0CIz0UtLWBKtScIURZWPD652LkZ53fZEi9+qmVlV/U
 i7vlAk9h4zlVhOJfC+Vjbc8cL/eEHV6bghDmNV21436V5uBiD+bfyhN7KyEZwVLTZX2CVB9bA5
 0PA=
X-SBRS: 2.5
X-MesageID: 28918937
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.77,355,1596513600"; 
   d="scan'208";a="28918937"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>, Andy Lutomirski
	<luto@kernel.org>, Manuel Bouyer <bouyer@antioche.eu.org>
Subject: [PATCH v2] x86/pv: Inject #UD for missing SYSCALL callbacks
Date: Fri, 9 Oct 2020 12:53:01 +0100
Message-ID: <20201009115301.19516-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20200923101848.29049-4-andrew.cooper3@citrix.com>
References: <20200923101848.29049-4-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Despite appearing to be a deliberate design choice of early PV64, the
resulting behaviour for unregistered SYSCALL callbacks creates an untenable
testability problem for Xen.  Furthermore, the behaviour is undocumented,
bizarre, and inconsistent with related behaviour in Xen, and very liable
introduce a security vulnerability into a PV guest if the author hasn't
studied Xen's assembly code in detail.

There are two different bugs here.

1) The current logic confuses the registered entrypoints, and may deliver a
   SYSCALL from 32bit userspace to the 64bit entry, when only a 64bit
   entrypoint is registered.

   This has been the case ever since 2007 (c/s cd75d47348b) but up until
   2018 (c/s dba899de14) the wrong selectors would be handed to the guest for
   a 32bit SYSCALL entry, making it appear as if it a 64bit entry all along.

   Xen would malfunction under these circumstances, if it were a PV guest.
   Linux would as well, but PVOps has always registered both entrypoints and
   discarded the Xen-provided selectors.  NetBSD really does malfunction as a
   consequence (benignly now, but a VM DoS before the 2018 Xen selector fix).

2) In the case that neither SYSCALL callbacks are registered, the guest will
   be crashed when userspace executes a SYSCALL instruction, which is a
   userspace => kernel DoS.

   This has been the case ever since the introduction of 64bit PV support, but
   behaves unlike all other SYSCALL/SYSENTER callbacks in Xen, which yield
   #GP/#UD in userspace before the callback is registered, and are therefore
   safe by default.

This change does constitute a change in the PV ABI, for corner cases of a PV
guest kernel registering neither callback, or not registering the 32bit
callback when running on AMD/Hygon hardware.

It brings the behaviour in line with PV32 SYSCALL/SYSENTER, and PV64
SYSENTER (safe by default, until explicitly enabled), as well as native
hardware (always delivered to the single applicable callback).

Most importantly however, and the primary reason for the change, is that it
lets us sensibly test the fast system call entrypoints under all states a PV
guest can construct, to prove correct behaviour.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>
CC: Andy Lutomirski <luto@kernel.org>
CC: Manuel Bouyer <bouyer@antioche.eu.org>

v2:
 * Drop unnecessary instruction suffixes
 * Don't truncate #UD entrypoint to 32 bits

Manuel: This will result in a corner case change for NetBSD.

At the moment on native, 32bit userspace on 64bit NetBSD will get #UD (Intel,
etc), or an explicit -ENOSYS (AMD, etc) when trying to execute a 32bit SYSCALL
instruction.

After this change, a 64bit PV VM will consistently see #UD (like on Intel, etc
hardware) even when running on AMD/Hygon hardware (as Xsyscall32 isn't
registered with Xen), rather than following Xsyscall into the proper system
call path.
---
 xen/arch/x86/x86_64/entry.S | 26 +++++++++++++++++++-------
 1 file changed, 19 insertions(+), 7 deletions(-)

diff --git a/xen/arch/x86/x86_64/entry.S b/xen/arch/x86/x86_64/entry.S
index 000eb9722b..aaf8402f93 100644
--- a/xen/arch/x86/x86_64/entry.S
+++ b/xen/arch/x86/x86_64/entry.S
@@ -26,18 +26,30 @@
 /* %rbx: struct vcpu */
 ENTRY(switch_to_kernel)
         leaq  VCPU_trap_bounce(%rbx),%rdx
-        /* TB_eip = (32-bit syscall && syscall32_addr) ?
-         *          syscall32_addr : syscall_addr */
-        xor   %eax,%eax
+
+        /* TB_eip = 32-bit syscall ? syscall32_addr : syscall_addr */
+        mov   VCPU_syscall32_addr(%rbx), %ecx
+        mov   VCPU_syscall_addr(%rbx), %rax
         cmpw  $FLAT_USER_CS32,UREGS_cs(%rsp)
-        cmoveq VCPU_syscall32_addr(%rbx),%rax
-        testq %rax,%rax
-        cmovzq VCPU_syscall_addr(%rbx),%rax
-        movq  %rax,TRAPBOUNCE_eip(%rdx)
+        cmove %rcx, %rax
+
         /* TB_flags = VGCF_syscall_disables_events ? TBF_INTERRUPT : 0 */
         btl   $_VGCF_syscall_disables_events,VCPU_guest_context_flags(%rbx)
         setc  %cl
         leal  (,%rcx,TBF_INTERRUPT),%ecx
+
+        test  %rax, %rax
+UNLIKELY_START(z, syscall_no_callback) /* TB_eip == 0 => #UD */
+        mov   VCPU_trap_ctxt(%rbx), %rdi
+        movl  $X86_EXC_UD, UREGS_entry_vector(%rsp)
+        subl  $2, UREGS_rip(%rsp)
+        mov   X86_EXC_UD * TRAPINFO_sizeof + TRAPINFO_eip(%rdi), %rax
+        testb $4, X86_EXC_UD * TRAPINFO_sizeof + TRAPINFO_flags(%rdi)
+        setnz %cl
+        lea   TBF_EXCEPTION(, %rcx, TBF_INTERRUPT), %ecx
+UNLIKELY_END(syscall_no_callback)
+
+        movq  %rax,TRAPBOUNCE_eip(%rdx)
         movb  %cl,TRAPBOUNCE_flags(%rdx)
         call  create_bounce_frame
         andl  $~X86_EFLAGS_DF,UREGS_eflags(%rsp)
-- 
2.11.0


