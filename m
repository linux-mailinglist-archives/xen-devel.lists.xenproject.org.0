Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 64E854B5163
	for <lists+xen-devel@lfdr.de>; Mon, 14 Feb 2022 14:16:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.271946.466711 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nJbDm-0004O3-DZ; Mon, 14 Feb 2022 13:16:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 271946.466711; Mon, 14 Feb 2022 13:16:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nJbDm-0004Kv-9h; Mon, 14 Feb 2022 13:16:50 +0000
Received: by outflank-mailman (input) for mailman id 271946;
 Mon, 14 Feb 2022 13:16:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HcNt=S5=citrix.com=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1nJb4Y-0008IH-5d
 for xen-devel@lists.xenproject.org; Mon, 14 Feb 2022 13:07:18 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 07a6f83c-8d97-11ec-8eb8-a37418f5ba1a;
 Mon, 14 Feb 2022 14:07:16 +0100 (CET)
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
X-Inumbo-ID: 07a6f83c-8d97-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1644844036;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=k8U/gxV+rj8X4mP8GQMoApxTfQmXJsHdNzSIbDiqWyI=;
  b=AuwxoD3Wf/wJWz+/9VAN+EUQc86BWO44hzhGsqyYjxLKI0NMcgDpj6f3
   VmKLT+C2+R99F9OKY3RYsIfGlh3Bl67dxM/uf5A/FPE0MYHSqIN9VLtV/
   RJd4RoN+I/BTsLmMtANgO3ycOo28j3KLzFEKU2zLOW3FEsuyW/NugIkiu
   I=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: h7a1MSeXC3XEmwgZ4ZAxmHOIfpWElDoESvzTEb5rO0ehdcGjxnQX1xouB/k5GmGjcJ2aN1gGSY
 pq42uQ9LcVOW6eUdpU/wN92HJqDb+3rD9sv/IgPIgtlEll7+4dc8qGv6lNw9RD9N1tke2cOO5d
 1mmF1T3Bqr04MCzFAZnyFhCT4Uy2f3daSV8spMgFgjbZKs/ql4Zp+ZMocfkt/QqC8ze4zK8T/+
 V59Asfpy2b57KzGWwnIWVEdl0mccn+WHAPmCUOOszRgR/LXLSjqauA2M3r7z3Bts4pcjVKHjJS
 YPV72dFa6E4S3rdr6t2FGpR7
X-SBRS: 5.1
X-MesageID: 64554396
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:xpfeua5lPQ20LX0YavtzrQxRtAHAchMFZxGqfqrLsTDasY5as4F+v
 mobWj2Ga//eZGH3fdAkOouypkgD6pPUn9U1SAY+qygxHi5G8cbLO4+Ufxz6V8+wwmwvb67FA
 +E2MISowBUcFyeEzvuV3zyIQUBUjclkfJKlYAL/En03FV8MpBsJ00o5wbZj29Iw2LBVPivW0
 T/Mi5yHULOa82Yc3lI8s8pvfzs24ZweEBtB1rAPTagjUG32zhH5P7pGTU2FFFPqQ5E8IwKPb
 72rIIdVXI/u10xF5tuNyt4Xe6CRK1LYFVDmZnF+A8BOjvXez8CbP2lS2Pc0MC9qZzu1c99Z5
 NNfmbm2UV8TY4LHiuISfzR5TSZTIvgTkFPHCSDXXc27ykTHdz3nwul0DVFwNoodkgp1KTgQr
 7pCcmlLN03dwbLtqF64YrAEasALBc/nJo4A/FpnyinUF60OSpHfWaTao9Rf2V/cg+gQQauDO
 5FIN1KDajzjMz5LZVVGNKs+nbeWoGPnVCF9rm+K8P9fD2/7k1UqjemF3MDuUsOObdVYmACfv
 G2u10bTDwweNdef4SGY6X/qjejK9QvrVYRXGLCm+/pChFyI2ndVGBAQTUG8o/Sylgi5Qd03F
 qAP0nNw9+5orhXtF4SjGU3jyJKZgvICc/ZWAcEf7hnV8Pf76BSfCUQpb2BGRcNz4afaWgcW/
 lOOmtroAxlmv7uUVW+R+9+okN+iBcQGBTRcPHFZFGPp9/Gm+dhu1UyXEr6PBYbo1oWdJN3m/
 9ydQMHSbZ03hNVD6ai09Euvb9mE9smQFV5dCuk6swuYAuJFiGyNOtbABbvzt68owGOlor6p5
 iZspiRmxLpSZaxhbQTUKAn3IJmn5uyeLBrXikN1Ep8q+lyFoiD/Id8AsGwjfB4yaK7onAMFh
 2eJ52tsCGJ7ZiP2PcebnartYyjV8UQQPYu8Da2FBja/SpNwaBWG7ElTib24hAjQfLwXufhnY
 /+zKJ/0ZV5DUPgP5GfmFo81jO5wrghjlDy7eHwO50n+uVZoTCXOEult3ZrnRr1R0Z5oVy2Lr
 4cBZ5PSkU03vS+XSnC/zLP/5GsidRATba0aYeQOKL/rztNOFD5zBvnP76kmfoA5za1Zmv2Rp
 iO2W1NCyUq5jnrCcF3YZndmYbLpfJB+sXNkYnB8YQf2gyAuMdS18aMSV5orZr17puZt+uF5E
 qsecMKaD/URFjmeo2YBbYPwpZBJfQiwgV7cJDKsZTUyJsYyRwHA9tL+UBHo8S0CUni+ucck+
 uXy3QLHW5sTAQ9lCZ+OOv6oylqwu1kbmf5zABSUcoUCJh20/dEzeSLrj/IxL8UdEjn5x2OXh
 1SMHBMVhejRuItpotPHsr+J8tWyGOxkE0sEQ2SCteSqNTPX93aIyJNbVLraZijUUW759fnwZ
 ehRyP2gYvQLkEwT7th5Grdvi6k/+8Hut/lRyQE9RCfHaFGiC7VBJHia3JYQ6v0Rl+EB4QbmC
 FiS/tR6OKmSPJK3GVEcEwMpc+Cf2KxGgTLV9/k0fB336SIfEGBriqmO081gUBBgEYY=
IronPort-HdrOrdr: A9a23:PNCfPaysgKPtZIQE1C9cKrPwLr1zdoMgy1knxilNoRw8SKKlfq
 GV7Y0mPHDP6Ar5NEtNpTnEAtjkfZq+z+8S3WByB8bAYOCOggLBR+sO0WKh+UyFJ8SXzJ876U
 4KSclD4bPLYmSS9fyKgjWFLw==
X-IronPort-AV: E=Sophos;i="5.88,367,1635220800"; 
   d="scan'208";a="64554396"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH v2 66/70] x86/entry: Make syscall/sysenter entrypoints CET-IBT compatible
Date: Mon, 14 Feb 2022 12:51:23 +0000
Message-ID: <20220214125127.17985-67-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20220214125127.17985-1-andrew.cooper3@citrix.com>
References: <20220214125127.17985-1-andrew.cooper3@citrix.com>
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
Reviewed-by: Jan Beulich <jbeulich@suse.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>

v1.1:
 * Update to use endbr helpers.
---
 xen/arch/x86/x86_64/entry.S | 18 +++++++++---------
 xen/arch/x86/x86_64/traps.c | 11 +++++++----
 2 files changed, 16 insertions(+), 13 deletions(-)

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
index edc6820b85c7..fccfb7c17283 100644
--- a/xen/arch/x86/x86_64/traps.c
+++ b/xen/arch/x86/x86_64/traps.c
@@ -16,6 +16,7 @@
 #include <asm/current.h>
 #include <asm/flushtlb.h>
 #include <asm/traps.h>
+#include <asm/endbr.h>
 #include <asm/event.h>
 #include <asm/nmi.h>
 #include <asm/msr.h>
@@ -295,6 +296,12 @@ static unsigned int write_stub_trampoline(
 {
     unsigned char *p = stub;
 
+    if ( cpu_has_xen_ibt )
+    {
+        place_endbr64(p);
+        p += 4;
+    }
+
     /* Store guest %rax into %ss slot */
     /* movabsq %rax, stack_bottom - 8 */
     *p++ = 0x48;
@@ -315,10 +322,6 @@ static unsigned int write_stub_trampoline(
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


