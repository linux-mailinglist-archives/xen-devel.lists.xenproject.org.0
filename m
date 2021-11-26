Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 71A3A45EEB7
	for <lists+xen-devel@lfdr.de>; Fri, 26 Nov 2021 14:08:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.232856.404027 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mqaxD-00072p-Ok; Fri, 26 Nov 2021 13:07:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 232856.404027; Fri, 26 Nov 2021 13:07:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mqaxD-0006zA-I8; Fri, 26 Nov 2021 13:07:51 +0000
Received: by outflank-mailman (input) for mailman id 232856;
 Fri, 26 Nov 2021 13:07:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=k+gV=QN=citrix.com=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1mqav5-0002zD-FG
 for xen-devel@lists.xenproject.org; Fri, 26 Nov 2021 13:05:39 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8c37c52e-4eb9-11ec-9787-a32c541c8605;
 Fri, 26 Nov 2021 14:05:38 +0100 (CET)
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
X-Inumbo-ID: 8c37c52e-4eb9-11ec-9787-a32c541c8605
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1637931938;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=KUsZ4Kl0u4zBXJbtydzwrtf6/N87hO+1FCFpIszujeQ=;
  b=VGmH7D7Ci2nS980UzLcHAFSFqXs3P1qbzwaPxMnloIDJb73E9y72moPQ
   Sbx72gA7rlUCqsfM5pIZFyOS/We96kL2J7Cz6Fl47ZV74xIHOhMyJwTLK
   INQSFqEi2Yyxu48CrPjAjtL6toRsuBFqZZKgJatfS6yIwYVnbNikl2cyq
   U=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: xSwBivzb9jPB7vbbjV2BtbjkjML9dS2pq04YAfs1EiIODJSctJUiDYQkoZwatdcvAfYUmgxCKC
 R+7Uw68J4In7FpSPqzqTpuVxC1PJvNU0lNXRyKwv9aZ4wBTfPLayXKOZpRVjhazVL//b+b7zkd
 VlV+A0v2m9JZf1Mjh3X4IL3qL7f+pRRLOdqxGUKCdub3wOefUh2FLNBlHjR7190TyViFAiRor6
 rZYXaSnS4DhYo7yHwCjylgZOM1VHADTXBoIjEX3mKUq9IlRaFMocr6oKXjC0F/avT9ZCWiSD2A
 cdq1uPeeHoKhwgyP4iaBiFPY
X-SBRS: 5.1
X-MesageID: 58676411
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:KQ1kY6iuAw77EZCm6P8bdSNNX161rRcKZh0ujC45NGQN5FlHY01je
 htvDGGOOfqJazDyLtkkaYu3o04OvJHUzINrSFFrrCk8QSgb9cadCdqndUqhZCn6wu8v7a5EA
 2fyTvGacajYm1eF/k/F3oAMKRCQ7InQLlbGILes1htZGEk0F0/NtTo5w7Rg29cy34Dja++wk
 YiaT/P3aQfNNwFcagr424rbwP+4lK2v0N+wlgVWicFj5DcypVFMZH4sDfjZw0/DaptVBoaHq
 9Prl9lVyI97EyAFUbtJmp6jGqEDryW70QKm0hK6UID66vROS7BbPg/W+5PwZG8O4whlkeydx
 /1Mkr6hZVYnPJbRv7VAVjR0PihRNrxZreqvzXiX6aR/zmXDenrohf5vEFs3LcsT/eMf7WNmr
 KJCbmpXN1ba2rzwkOnTpupE36zPKOHCOo8Ft24m5jbeFfs8GrjIQrnQ5M8e1zA17ixLNauOO
 ZVHNWM2BPjGS0dVGHdPGdE/pdrynSDybw938E2IhoNitgA/yyQuieOwYbI5YOeiWsF9jkue4
 GXc8AzRIDsXKdiewjqt6W+3i6nEmiaTcJIfEvi0++BnhHWXx3cPE1sGWF2ju/67h0WiHdVFJ
 CQpFjEG9PZoshbxF5+kAkP+8CXsUgMgt8R4EsoY+S3cxKjv/iHIW20pYhNIR9c3q5pjLdA17
 WOhk9TsDD1plbSaT3OB67uZxQ+P1TgpwXwqPnFdE1ZcizX3iMRq10+UEI4/eEKgpoStQWmY/
 tyckMQpa1z/Z+Yv3r7zw13IiinESnPhHl9svVW/so5IA2pEiG+Zi26AtQezARVodt/xory9U
 J4swJP2AAcmV8zlqcB1aL9RdIxFHt7cWNEmvXZhHoM66xOm8GO5cIZb7VlWfRkybZZaJGC4P
 BGP4mu9AaO/2lPxNsebhKrrVqwXIVXIT4y5Bpg4kPISCnSOSON31H43PhPBt4wcuEMtjbs+K
 f+mnTWEVh4n5VBc5GPuHY81iOZzrghnnD+7bc2rnnyPjOvFDFbIGOhtDbd7Rr1ghE9yiF6Oq
 Ig32grj40g3bdASlQGLq9NOdg5TciBgbX00wuQOHtO+zsNdMDlJI5fsLXkJIuSJRoxZybXF+
 G+TQEhdxAatjHHLM1zSOHtidKnuTdB0qndiZX4gOlOh2n4CZ4ez7fhAK8trLOd/rOEzn+RpS
 /QletmbBqgdQDrw5DlAP4L2q5ZvdUr3iFvWbTalejU2Y7VpWxfNpo3/ZgLq+SRXVni3uMIyr
 qeOzATeRZZfFQ1uANyPMKCkzk+rvGhbk+V3BhOaLt5WcUTq0Y5rNy2u0aNnf5BScU3On2LI2
 RyXDBEUofj2j7U0qNSZ17qZq4qJEvdlGhYIFWfs8rvrZzLR+XCuwNEcXb/QLyzdTm795I6re
 f5Rk6PnKPQCkVtH79h8HrJswf5s7tfjveYHnAFtHXGNZFW3ELJwZHKB2JAX5KFKw7ZYvyqwW
 16OpYYGaenYZpu9HQ5DPhchY8SCyeoQy2vb4vkCKUnn4DN6oeicWkJIMhjQ0CFQIdOZ6m/+L
 TvNbCLO1zGCtw==
IronPort-HdrOrdr: A9a23:Cv0ix66lSWRrpdSCEwPXwPDXdLJyesId70hD6qhwISY6TiX+rb
 HWoB17726TtN9/YhEdcLy7VJVoBEmskKKdgrNhWotKPjOW21dARbsKheCJrgEIWReOktK1vZ
 0QC5SWY+eQMbEVt6nHCXGDYrQd/OU=
X-IronPort-AV: E=Sophos;i="5.87,266,1631592000"; 
   d="scan'208";a="58676411"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH 61/65] x86/entry: Make syscall/sysenter entrypoints CET-IBT compatible
Date: Fri, 26 Nov 2021 12:34:42 +0000
Message-ID: <20211126123446.32324-62-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20211126123446.32324-1-andrew.cooper3@citrix.com>
References: <20211126123446.32324-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Each of MSR_{L,C}STAR and MSR_SYSENTER_EIP need to land on an endbr64
instruction.  For sysenter, this is easy.

Unfortunately for syscall, the stubs are already 29 byte long with a limit of
32.  endbr64 is 4 bytes.  Luckily, there is a 1 byte instruction which can
move from the stubs into the main handlers.

Move the push %rax out of the stub and into {l,c}star_entry(), allowing room
for the endbr64 instruction when appropriate.  Update the comment describing
the entry state.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>
---
 xen/arch/x86/x86_64/entry.S | 18 +++++++++---------
 xen/arch/x86/x86_64/traps.c | 13 +++++++++----
 2 files changed, 18 insertions(+), 13 deletions(-)

diff --git a/xen/arch/x86/x86_64/entry.S b/xen/arch/x86/x86_64/entry.S
index 8494b97a54a2..9abcf95bd010 100644
--- a/xen/arch/x86/x86_64/entry.S
+++ b/xen/arch/x86/x86_64/entry.S
@@ -241,18 +241,17 @@ iret_exit_to_guest:
  * When entering SYSCALL from user mode:
  *  Vector directly to the registered arch.syscall_addr.
  *
- * Initial work is done by per-CPU trampolines. At this point %rsp has been
- * initialised to point at the correct Xen stack, %rsp has been saved, and
- * %rax needs to be restored from the %ss save slot. All other registers are
- * still to be saved onto the stack, starting with RFLAGS, and an appropriate
- * %ss must be saved into the space left by the trampoline.
+ * Initial work is done by per-CPU trampolines.
+ *  - Guest %rax stored in the %ss slot
+ *  - Guest %rsp stored in %rax
+ *  - Xen stack loaded, pointing at the %ss slot
  */
 ENTRY(lstar_enter)
 #ifdef CONFIG_XEN_SHSTK
         ALTERNATIVE "", "setssbsy", X86_FEATURE_XEN_SHSTK
 #endif
-        /* sti could live here when we don't switch page tables below. */
-        movq  8(%rsp),%rax /* Restore %rax. */
+        push  %rax          /* Guest %rsp */
+        movq  8(%rsp), %rax /* Restore guest %rax */
         movq  $FLAT_KERNEL_SS,8(%rsp)
         pushq %r11
         pushq $FLAT_KERNEL_CS64
@@ -288,9 +287,9 @@ ENTRY(cstar_enter)
 #ifdef CONFIG_XEN_SHSTK
         ALTERNATIVE "", "setssbsy", X86_FEATURE_XEN_SHSTK
 #endif
-        /* sti could live here when we don't switch page tables below. */
+        push  %rax          /* Guest %rsp */
         CR4_PV32_RESTORE
-        movq  8(%rsp), %rax /* Restore %rax. */
+        movq  8(%rsp), %rax /* Restore guest %rax. */
         movq  $FLAT_USER_SS32, 8(%rsp) /* Assume a 64bit domain.  Compat handled lower. */
         pushq %r11
         pushq $FLAT_USER_CS32
@@ -323,6 +322,7 @@ ENTRY(cstar_enter)
         jmp   switch_to_kernel
 
 ENTRY(sysenter_entry)
+        ENDBR64
 #ifdef CONFIG_XEN_SHSTK
         ALTERNATIVE "", "setssbsy", X86_FEATURE_XEN_SHSTK
 #endif
diff --git a/xen/arch/x86/x86_64/traps.c b/xen/arch/x86/x86_64/traps.c
index 6f3c65bedc7a..3b9a332efb99 100644
--- a/xen/arch/x86/x86_64/traps.c
+++ b/xen/arch/x86/x86_64/traps.c
@@ -295,6 +295,15 @@ static unsigned int write_stub_trampoline(
 {
     unsigned char *p = stub;
 
+    if ( cpu_has_xen_ibt )
+    {
+        /* endbr64 */
+        *p++ = 0xf3;
+        *p++ = 0x0f;
+        *p++ = 0x1e;
+        *p++ = 0xfa;
+    }
+
     /* Store guest %rax into %ss slot */
     /* movabsq %rax, stack_bottom - 8 */
     *p++ = 0x48;
@@ -315,10 +324,6 @@ static unsigned int write_stub_trampoline(
     *(uint64_t *)p = stack_bottom - 8;
     p += 8;
 
-    /* Store guest %rsp into %rsp slot */
-    /* pushq %rax */
-    *p++ = 0x50;
-
     /* jmp target_va */
     *p++ = 0xe9;
     *(int32_t *)p = target_va - (stub_va + (p - stub) + 4);
-- 
2.11.0


