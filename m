Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C321283ADBE
	for <lists+xen-devel@lfdr.de>; Wed, 24 Jan 2024 16:49:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.671131.1044311 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rSfVT-0007EQ-MC; Wed, 24 Jan 2024 15:49:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 671131.1044311; Wed, 24 Jan 2024 15:49:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rSfVT-0007Bi-JV; Wed, 24 Jan 2024 15:49:39 +0000
Received: by outflank-mailman (input) for mailman id 671131;
 Wed, 24 Jan 2024 15:49:37 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=A7cU=JC=citrix.com=prvs=74624b4f2=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1rSfVR-0007Bc-FS
 for xen-devel@lists.xenproject.org; Wed, 24 Jan 2024 15:49:37 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2a8741b2-bad0-11ee-9b0f-b553b5be7939;
 Wed, 24 Jan 2024 16:49:34 +0100 (CET)
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
X-Inumbo-ID: 2a8741b2-bad0-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1706111372;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=/Ks0Tz6y1kJHaOSNrHjkYGWTxSUYLTBOLahsv0s7EdI=;
  b=BPCW0Gb3c5Rk+Cn50Eev6KZHKdCJMLISeRsC0M4v/56/PVgA8oq0k+Oy
   JUyQDgNIqMRj1NM/WHjWz6sogV9oRW3+0jCtw7BMb1P8bPBljRQRYbnnF
   WUSAwa19i/KrBWzVEBMp4g/Okxktm0nAD6inniTigi/Je93kBZkOpdpj4
   A=;
X-CSE-ConnectionGUID: ucEQqUatSFKl2NPySWASpw==
X-CSE-MsgGUID: X4c0d06oSxqT0Ma6LMJJxg==
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 129634936
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.159.70
X-Policy: $RELAYED
X-ThreatScanner-Verdict: Negative
IronPort-Data: A9a23:q/xzEKyVI0hgSPl4vZN6t+dzxirEfRIJ4+MujC+fZmUNrF6WrkUPz
 WtNXm2FM/mCajSkctF/aNjioxkD65eGzYNlTgo4rCAxQypGp/SeCIXCJC8cHc8wwu7rFxs7s
 ppEOrEsCOhuExcwcz/0auCJQUFUjPzOHvykTrecZkidfCc8IA85kxVvhuUltYBhhNm9Emult
 Mj75sbSIzdJ4RYtWo4vw/zF8E4HUMja4mtC4gRnP6wT5TcyqlFOZH4hDfDpR5fHatE88t6SH
 47r0Ly/92XFyBYhYvvNfmHTKxBirhb6ZGBiu1IOM0SQqkEqSh8ai87XAME0e0ZP4whlqvgqo
 Dl7WT5cfi9yVkHEsLx1vxC1iEiSN4UekFPMCSDXXcB+UyQq2pYjqhljJBheAGEWxgp4KXxF2
 MUBFTkRVT6gg7iQ+KOAdcBXntt2eaEHPKtH0p1h5TTQDPJgSpHfWaTao9Rf2V/chOgXQ6yYP
 ZBAL2MyPVKfO3WjOX9OYH46tM6uimPybHtzr1WNqLBsy2PS0BZwwP7mN9+9ltmiHJ8EwB3E9
 zmYl4j/KiFGP4STkWSCyWK1urfqlH3ffaAwBLLto5aGh3XMnzdOWXX6T2CTsfS/z0KzRd9bA
 0gV4TY167g/8lSxSdvwVAH+p2SL1jY+cddNF+wx6CmW17HZpQ2eAwAsUTppeNEg8sgsSlQXO
 kShxo2zQ2Y16fvMFCPbqe/8QS6O1TY9MGQvXDY5RBc+zfrn+qcLnynwZ+17D/vg5jHqIg0c0
 wxmvQBn2O1N1JZSiv/klW0rlQ5AsXQgc+LU2uk0djj8hu+BTNT5D7FEEHCChRq6EK6XT0Oao
 F8PkNWE4eYFAPmlzXPVHr1WQevwvqrbaFUwZGKD+LF4qVyQF4OLJ9gMsFmS2m83Wir7RdMZS
 BCK4l4AjHOiFHCrcbV2c+qMNije9oC5TY6NfqmNPrJzjm1ZKFfvENdGORTBgAgAUSEEzckCB
 HtsWZzyVyhCV/g7nWHeqiV0+eZD+x3SDFj7HfjTpylLG5LHDJJJYd/p6GezU90=
IronPort-HdrOrdr: A9a23:+cmPZKu47Aatkd7d6esc9kh67skDetV00zEX/kB9WHVpmszxra
 6TdZMgpHjJYVcqKRUdcL+7WJVoLUmxyXcX2/h1AV7BZniEhILAFugLhuGO/9SJIVyZygc378
 ZdmsZFZ+EYdWIK7/rH3A==
X-Talos-CUID: 9a23:URkREG2nw4ya8kZJnW/ik7xfB8sIS2TgxWvrDWy8U0BRWYaqYGSI5/Yx
X-Talos-MUID: =?us-ascii?q?9a23=3A4t3lOA7lrRnegwBJMVuQLjWXxoxYv6/2BBhTlq4?=
 =?us-ascii?q?WovXcECUuHxK/riS4F9o=3D?=
X-IronPort-AV: E=Sophos;i="6.05,216,1701147600"; 
   d="scan'208";a="129634936"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH] x86/entry: Avoid register spilling in cr4_pv32_restore()
Date: Wed, 24 Jan 2024 15:49:28 +0000
Message-ID: <20240124154928.2147423-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

cr4_pv32_restore() needs two registers.  Right now, it spills %rdx and
clobbers %rax.

However, %rcx is free to use at all callsites.  Annotate CR4_PV32_RESTORE with
our usual clobber comments, and swap %rdx for %rcx in the non-fatal paths

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>

I suspect we can further improve this by using %r14 rather than
GET_CPUINFO_FIELD(), but I'll leave that to a future change.
---
 xen/arch/x86/x86_64/compat/entry.S | 17 +++++++----------
 xen/arch/x86/x86_64/entry.S        |  8 ++++----
 2 files changed, 11 insertions(+), 14 deletions(-)

diff --git a/xen/arch/x86/x86_64/compat/entry.S b/xen/arch/x86/x86_64/compat/entry.S
index 49811a56e965..d4f0e4804090 100644
--- a/xen/arch/x86/x86_64/compat/entry.S
+++ b/xen/arch/x86/x86_64/compat/entry.S
@@ -23,7 +23,7 @@ FUNC(entry_int82)
 
         sti
 
-        CR4_PV32_RESTORE
+        CR4_PV32_RESTORE /* Clob: ac */
 
         GET_CURRENT(bx)
 
@@ -163,17 +163,15 @@ FUNC(compat_restore_all_guest)
         _ASM_PRE_EXTABLE(.Lft0, handle_exception)
 END(compat_restore_all_guest)
 
-/* This mustn't modify registers other than %rax. */
+/* Callers can cope with both %rax and %rcx being clobbered. */
 FUNC(cr4_pv32_restore)
-        push  %rdx
-        GET_CPUINFO_FIELD(cr4, dx)
-        mov   (%rdx), %rax
+        GET_CPUINFO_FIELD(cr4, cx)
+        mov   (%rcx), %rax
         test  $XEN_CR4_PV32_BITS, %eax
         jnz   0f
         or    cr4_pv32_mask(%rip), %rax
         mov   %rax, %cr4
-        mov   %rax, (%rdx)
-        pop   %rdx
+        mov   %rax, (%rcx)
         ret
 0:
 #ifndef NDEBUG
@@ -191,7 +189,6 @@ FUNC(cr4_pv32_restore)
         BUG
 1:
 #endif
-        pop   %rdx
         xor   %eax, %eax
         ret
 END(cr4_pv32_restore)
@@ -227,7 +224,7 @@ UNLIKELY_END(compat_syscall_gpf)
 END(compat_syscall)
 
 FUNC(compat_sysenter)
-        CR4_PV32_RESTORE
+        CR4_PV32_RESTORE /* Clob: ac */
         movq  VCPU_trap_ctxt(%rbx),%rcx
         cmpb  $X86_EXC_GP, UREGS_entry_vector(%rsp)
         movzwl VCPU_sysenter_sel(%rbx),%eax
@@ -242,7 +239,7 @@ FUNC(compat_sysenter)
 END(compat_sysenter)
 
 FUNC(compat_int80_direct_trap)
-        CR4_PV32_RESTORE
+        CR4_PV32_RESTORE /* Clob: ac */
         call  compat_create_bounce_frame
         jmp   compat_test_all_events
 END(compat_int80_direct_trap)
diff --git a/xen/arch/x86/x86_64/entry.S b/xen/arch/x86/x86_64/entry.S
index c3f6b667a72a..6c53c0091168 100644
--- a/xen/arch/x86/x86_64/entry.S
+++ b/xen/arch/x86/x86_64/entry.S
@@ -309,7 +309,7 @@ FUNC(cstar_enter)
 .Lcstar_cr3_okay:
         sti
 
-        CR4_PV32_RESTORE
+        CR4_PV32_RESTORE /* Clob: ac */
 
         movq  STACK_CPUINFO_FIELD(current_vcpu)(%rbx), %rbx
 
@@ -712,7 +712,7 @@ FUNC(common_interrupt)
         cmovnz %r12d, %ebx
 .Lintr_cr3_okay:
 
-        CR4_PV32_RESTORE
+        CR4_PV32_RESTORE /* Clob: ac */
         movq %rsp,%rdi
         callq do_IRQ
         mov   %r15, STACK_CPUINFO_FIELD(xen_cr3)(%r14)
@@ -762,7 +762,7 @@ handle_exception_saved:
         jz    .Lcr4_pv32_done
         cmpb  $0,DOMAIN_is_32bit_pv(%rax)
         je    .Lcr4_pv32_done
-        call  cr4_pv32_restore
+        call  cr4_pv32_restore /* Clob: ac */
         /*
          * An NMI or #MC may occur between clearing CR4.SMEP / CR4.SMAP in
          * compat_restore_all_guest and it actually returning to guest
@@ -1046,7 +1046,7 @@ FUNC(handle_ist_exception)
 .List_cr3_okay:
 
 #ifdef CONFIG_PV
-        CR4_PV32_RESTORE
+        CR4_PV32_RESTORE /* Clob: ac */
         testb $3,UREGS_cs(%rsp)
         jz    1f
         /*

base-commit: 98ae35cab0e40e59963f9f58345bf378b9522d74
-- 
2.30.2


