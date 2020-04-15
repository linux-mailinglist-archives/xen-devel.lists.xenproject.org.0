Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 94A951AAFEB
	for <lists+xen-devel@lfdr.de>; Wed, 15 Apr 2020 19:39:53 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jOm0O-0003F1-EN; Wed, 15 Apr 2020 17:39:20 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=c95o=57=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1jOm0N-0003Ew-2Q
 for xen-devel@lists.xenproject.org; Wed, 15 Apr 2020 17:39:19 +0000
X-Inumbo-ID: 07cf02ee-7f40-11ea-83d8-bc764e2007e4
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 07cf02ee-7f40-11ea-83d8-bc764e2007e4;
 Wed, 15 Apr 2020 17:39:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1586972358;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=KT25FAHq2BmfGlcvKEr4mXsRrbSMMRPlnJpg+2+Quf0=;
 b=YaLsDyX1Y72KHdGtHWFRlfDtn0O7wrupwC8emrTkgk0mAumrNl//CLcU
 omDNYmNqMyi5QSuMuWzaHbk8DodEOxPja82D7ZcZRqXfNNimomKNfW/25
 6gLJcPBCVbGTnDTW9Upm39viL048HgCbYmMNTkNLRcc9BbWWSz89+ONdP 8=;
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa2.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: gUaA31CQCxiClz/lI3IeMQFARiETpsiNaP4x3659Q/wcJVtVNl8Jo+TQrMgYKJMnfVcxqZDTPE
 sj8yK0oUC6C79TbQ5ESmuACSMKxXh0YGhHaqikK8rU9P3jaGwGtPkWAEF/LkXTqLB3kdnZpQXK
 +nC++WXm/Dekmg1u2wBlaVMxdM69nJTsGmOz0fIIAj4Z80cfKzsJ8niJpEh8ZUsvTM5jOuRnjN
 cg7l6KJFzFttZmjhesjbrFdO8gvTacKDkdIufSIp3QWII3HFvuUu1gA6G8f+Vr2TXLWkqAoV3t
 FuY=
X-SBRS: 2.7
X-MesageID: 15746409
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.72,387,1580792400"; d="scan'208";a="15746409"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Subject: [PATCH] x86/boot: Fix early exception handling with
 CONFIG_PERF_COUNTERS
Date: Wed, 15 Apr 2020 18:39:11 +0100
Message-ID: <20200415173911.13286-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <jgrall@amazon.com>,
 Wei Liu <wl@xen.org>, Jan Beulich <JBeulich@suse.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

The PERFC_INCR() macro uses current->processor, but current is not valid
during early boot.  This causes the following crash to occur if
e.g. rdmsr_safe() has to recover from a #GP fault.

  (XEN) Early fatal page fault at e008:ffff82d0803b1a39 (cr2=0000000000000004, ec=0000)
  (XEN) ----[ Xen-4.14-unstable  x86_64  debug=y   Not tainted ]----
  (XEN) CPU:    0
  (XEN) RIP:    e008:[<ffff82d0803b1a39>] x86_64/entry.S#handle_exception_saved+0x64/0xb8
  ...
  (XEN) Xen call trace:
  (XEN)    [<ffff82d0803b1a39>] R x86_64/entry.S#handle_exception_saved+0x64/0xb8
  (XEN)    [<ffff82d0806394fe>] F __start_xen+0x2cd/0x2980
  (XEN)    [<ffff82d0802000ec>] F __high_start+0x4c/0x4e

Furthermore, the PERFC_INCR() macro is wildly inefficient.  There has been a
single caller for many releases now, so inline it and delete the macro
completely.

For the assembly, move entry_vector from %eax into %ecx.  There is no encoding
benefit for movzbl, and it frees up %eax to be used inside the
CONFIG_PERF_COUNTERS block where there is an encoding benefit.

There is no need to reference current at all.  What is actually needed is the
per_cpu_offset which can be obtained directly from the top-of-stack block.
This simplifies the counter handling to 3 instructions and no spilling to the
stack at all.

The same breakage from above is now handled properly:

  (XEN) traps.c:1591: GPF (0000): ffff82d0806394fe [__start_xen+0x2cd/0x2980] -> ffff82d0803b3bfb

Reported-by: Julien Grall <jgrall@amazon.com>
Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Wei Liu <wl@xen.org>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Julien Grall <jgrall@amazon.com>
---
 xen/arch/x86/x86_64/asm-offsets.c |  1 +
 xen/arch/x86/x86_64/entry.S       | 10 +++++++---
 xen/include/asm-x86/asm_defns.h   | 16 ----------------
 3 files changed, 8 insertions(+), 19 deletions(-)

diff --git a/xen/arch/x86/x86_64/asm-offsets.c b/xen/arch/x86/x86_64/asm-offsets.c
index b8e8510439..500df7a3e7 100644
--- a/xen/arch/x86/x86_64/asm-offsets.c
+++ b/xen/arch/x86/x86_64/asm-offsets.c
@@ -112,6 +112,7 @@ void __dummy__(void)
     OFFSET(CPUINFO_guest_cpu_user_regs, struct cpu_info, guest_cpu_user_regs);
     OFFSET(CPUINFO_verw_sel, struct cpu_info, verw_sel);
     OFFSET(CPUINFO_current_vcpu, struct cpu_info, current_vcpu);
+    OFFSET(CPUINFO_per_cpu_offset, struct cpu_info, per_cpu_offset);
     OFFSET(CPUINFO_cr4, struct cpu_info, cr4);
     OFFSET(CPUINFO_xen_cr3, struct cpu_info, xen_cr3);
     OFFSET(CPUINFO_pv_cr3, struct cpu_info, pv_cr3);
diff --git a/xen/arch/x86/x86_64/entry.S b/xen/arch/x86/x86_64/entry.S
index 997c481ecb..52bd41d9f6 100644
--- a/xen/arch/x86/x86_64/entry.S
+++ b/xen/arch/x86/x86_64/entry.S
@@ -677,10 +677,14 @@ handle_exception_saved:
 #endif /* CONFIG_PV */
         sti
 1:      movq  %rsp,%rdi
-        movzbl UREGS_entry_vector(%rsp),%eax
+        movzbl UREGS_entry_vector(%rsp), %ecx
         leaq  exception_table(%rip),%rdx
-        PERFC_INCR(exceptions, %rax, %rbx)
-        mov   (%rdx, %rax, 8), %rdx
+#ifdef CONFIG_PERF_COUNTERS
+        lea   per_cpu__perfcounters(%rip), %rax
+        add   STACK_CPUINFO_FIELD(per_cpu_offset)(%r14), %rax
+        incl  ASM_PERFC_exceptions * 4(%rax, %rcx, 4)
+#endif
+        mov   (%rdx, %rcx, 8), %rdx
         INDIRECT_CALL %rdx
         mov   %r15, STACK_CPUINFO_FIELD(xen_cr3)(%r14)
         mov   %r13b, STACK_CPUINFO_FIELD(use_pv_cr3)(%r14)
diff --git a/xen/include/asm-x86/asm_defns.h b/xen/include/asm-x86/asm_defns.h
index bc9d9fcdb2..b42a19b654 100644
--- a/xen/include/asm-x86/asm_defns.h
+++ b/xen/include/asm-x86/asm_defns.h
@@ -346,22 +346,6 @@ static always_inline void stac(void)
 
 #endif
 
-#ifdef CONFIG_PERF_COUNTERS
-#define PERFC_INCR(_name,_idx,_cur)             \
-        pushq _cur;                             \
-        movslq VCPU_processor(_cur),_cur;       \
-        pushq %rdx;                             \
-        leaq __per_cpu_offset(%rip),%rdx;       \
-        movq (%rdx,_cur,8),_cur;                \
-        leaq per_cpu__perfcounters(%rip),%rdx;  \
-        addq %rdx,_cur;                         \
-        popq %rdx;                              \
-        incl ASM_PERFC_##_name*4(_cur,_idx,4);  \
-        popq _cur
-#else
-#define PERFC_INCR(_name,_idx,_cur)
-#endif
-
 /* Work around AMD erratum #88 */
 #define safe_swapgs                             \
         "mfence; swapgs;"
-- 
2.11.0


