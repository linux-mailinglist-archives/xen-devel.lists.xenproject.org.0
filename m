Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 966981E4E02
	for <lists+xen-devel@lfdr.de>; Wed, 27 May 2020 21:19:39 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1je1aC-00040U-7h; Wed, 27 May 2020 19:19:20 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/dLv=7J=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1je1aB-00040F-2C
 for xen-devel@lists.xenproject.org; Wed, 27 May 2020 19:19:19 +0000
X-Inumbo-ID: f27751dd-a04e-11ea-a777-12813bfff9fa
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f27751dd-a04e-11ea-a777-12813bfff9fa;
 Wed, 27 May 2020 19:19:14 +0000 (UTC)
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: pWuwntnoMuy1EWQAtQPoeE0QeTGmXZH8kVIvZIS1A0pYGGSDK0Iaqz1Wu/VZdWrDd2uD9kdgDp
 hXxKMHV/BedfVZ5aqPmMWJrOhAWvWRxeGpuIgBZSir7iyKh8oeMf2f0WaF/cGfrcAd7N/3glxy
 tHJ2omm/L1ade4G2eT5t3rvxHGzFaH7jl3Yvgkytrz4GdSqn3vxARB6zJz5kLjF+ySOcvcH6PH
 8JlASs/wj6vHj7T0vaC/H2ehG67bvrm00Wlm2aFUQix7eZDi5IJggYT/mX8/I6Ed5a+f1YDXP+
 KNs=
X-SBRS: 2.7
X-MesageID: 18591104
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,442,1583211600"; d="scan'208";a="18591104"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Subject: [PATCH v2 01/14] x86/traps: Clean up printing in {do_reserved,
 fatal}_trap()
Date: Wed, 27 May 2020 20:18:34 +0100
Message-ID: <20200527191847.17207-2-andrew.cooper3@citrix.com>
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

For one, they render the vector in a different base.

Introduce X86_EXC_* constants and vec_name() to refer to exceptions by their
mnemonic, which starts bringing the code/diagnostics in line with the Intel
and AMD manuals.

Provide constants for every archtiecturally defined exception, even those not
implemented by Xen yet, as do_reserved_trap() is a catch-all handler.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Wei Liu <wl@xen.org>
CC: Roger Pau Monné <roger.pau@citrix.com>

v2:
 * Move "#" into vec_name() to skip it for the 3-character vectors
---
 xen/arch/x86/traps.c            | 26 +++++++++++++++++++++-----
 xen/include/asm-x86/processor.h |  6 +-----
 xen/include/asm-x86/x86-defns.h | 34 ++++++++++++++++++++++++++++++++++
 3 files changed, 56 insertions(+), 10 deletions(-)

diff --git a/xen/arch/x86/traps.c b/xen/arch/x86/traps.c
index a8300c214d..427178e649 100644
--- a/xen/arch/x86/traps.c
+++ b/xen/arch/x86/traps.c
@@ -682,6 +682,22 @@ const char *trapstr(unsigned int trapnr)
     return trapnr < ARRAY_SIZE(strings) ? strings[trapnr] : "???";
 }
 
+static const char *vec_name(unsigned int vec)
+{
+    static const char names[][4] = {
+#define P(x) [X86_EXC_ ## x] = "#" #x
+#define N(x) [X86_EXC_ ## x] = #x
+        P(DE),  P(DB),  N(NMI), P(BP),  P(OF),  P(BR),  P(UD),  P(NM),
+        P(DF),  N(CSO), P(TS),  P(NP),  P(SS),  P(GP),  P(PF),  N(SPV),
+        P(MF),  P(AC),  P(MC),  P(XM),  P(VE),  P(CP),
+                                        P(HV),  P(VC),  P(SX),
+#undef N
+#undef P
+    };
+
+    return (vec < ARRAY_SIZE(names) && names[vec][0]) ? names[vec] : "???";
+}
+
 /*
  * This is called for faults at very unexpected times (e.g., when interrupts
  * are disabled). In such situations we can't do much that is safe. We try to
@@ -739,10 +755,9 @@ void fatal_trap(const struct cpu_user_regs *regs, bool show_remote)
         }
     }
 
-    panic("FATAL TRAP: vector = %d (%s)\n"
-          "[error_code=%04x] %s\n",
-          trapnr, trapstr(trapnr), regs->error_code,
-          (regs->eflags & X86_EFLAGS_IF) ? "" : ", IN INTERRUPT CONTEXT");
+    panic("FATAL TRAP: vec %u, %s[%04x]%s\n",
+          trapnr, vec_name(trapnr), regs->error_code,
+          (regs->eflags & X86_EFLAGS_IF) ? "" : " IN INTERRUPT CONTEXT");
 }
 
 static void do_reserved_trap(struct cpu_user_regs *regs)
@@ -753,7 +768,8 @@ static void do_reserved_trap(struct cpu_user_regs *regs)
         return;
 
     show_execution_state(regs);
-    panic("FATAL RESERVED TRAP %#x: %s\n", trapnr, trapstr(trapnr));
+    panic("FATAL RESERVED TRAP: vec %u, %s[%04x]\n",
+          trapnr, vec_name(trapnr), regs->error_code);
 }
 
 static void do_trap(struct cpu_user_regs *regs)
diff --git a/xen/include/asm-x86/processor.h b/xen/include/asm-x86/processor.h
index 070691882b..96deac73ed 100644
--- a/xen/include/asm-x86/processor.h
+++ b/xen/include/asm-x86/processor.h
@@ -43,11 +43,7 @@
 #define TRAP_virtualisation   20
 #define TRAP_nr               32
 
-#define TRAP_HAVE_EC                                                    \
-    ((1u << TRAP_double_fault) | (1u << TRAP_invalid_tss) |             \
-     (1u << TRAP_no_segment) | (1u << TRAP_stack_error) |               \
-     (1u << TRAP_gp_fault) | (1u << TRAP_page_fault) |                  \
-     (1u << TRAP_alignment_check))
+#define TRAP_HAVE_EC X86_EXC_HAVE_EC
 
 /* Set for entry via SYSCALL. Informs return code to use SYSRETQ not IRETQ. */
 /* NB. Same as VGCF_in_syscall. No bits in common with any other TRAP_ defn. */
diff --git a/xen/include/asm-x86/x86-defns.h b/xen/include/asm-x86/x86-defns.h
index 8bf503220a..5366e2d018 100644
--- a/xen/include/asm-x86/x86-defns.h
+++ b/xen/include/asm-x86/x86-defns.h
@@ -118,4 +118,38 @@
 
 #define X86_NR_VECTORS 256
 
+/* Exception Vectors */
+#define X86_EXC_DE             0 /* Divide Error. */
+#define X86_EXC_DB             1 /* Debug Exception. */
+#define X86_EXC_NMI            2 /* NMI. */
+#define X86_EXC_BP             3 /* Breakpoint. */
+#define X86_EXC_OF             4 /* Overflow. */
+#define X86_EXC_BR             5 /* BOUND Range. */
+#define X86_EXC_UD             6 /* Invalid Opcode. */
+#define X86_EXC_NM             7 /* Device Not Available. */
+#define X86_EXC_DF             8 /* Double Fault. */
+#define X86_EXC_CSO            9 /* Coprocessor Segment Overrun. */
+#define X86_EXC_TS            10 /* Invalid TSS. */
+#define X86_EXC_NP            11 /* Segment Not Present. */
+#define X86_EXC_SS            12 /* Stack-Segment Fault. */
+#define X86_EXC_GP            13 /* General Porection Fault. */
+#define X86_EXC_PF            14 /* Page Fault. */
+#define X86_EXC_SPV           15 /* PIC Spurious Interrupt Vector. */
+#define X86_EXC_MF            16 /* Maths fault (x87 FPU). */
+#define X86_EXC_AC            17 /* Alignment Check. */
+#define X86_EXC_MC            18 /* Machine Check. */
+#define X86_EXC_XM            19 /* SIMD Exception. */
+#define X86_EXC_VE            20 /* Virtualisation Exception. */
+#define X86_EXC_CP            21 /* Control-flow Protection. */
+#define X86_EXC_HV            28 /* Hypervisor Injection. */
+#define X86_EXC_VC            29 /* VMM Communication. */
+#define X86_EXC_SX            30 /* Security Exception. */
+
+/* Bitmap of exceptions which have error codes. */
+#define X86_EXC_HAVE_EC                                             \
+    ((1u << X86_EXC_DF) | (1u << X86_EXC_TS) | (1u << X86_EXC_NP) | \
+     (1u << X86_EXC_SS) | (1u << X86_EXC_GP) | (1u << X86_EXC_PF) | \
+     (1u << X86_EXC_AC) | (1u << X86_EXC_CP) |                      \
+     (1u << X86_EXC_VC) | (1u << X86_EXC_SX))
+
 #endif	/* __XEN_X86_DEFNS_H__ */
-- 
2.11.0


