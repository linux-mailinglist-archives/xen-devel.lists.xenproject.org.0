Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C91C1C2106
	for <lists+xen-devel@lfdr.de>; Sat,  2 May 2020 00:59:48 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jUech-0007wj-FA; Fri, 01 May 2020 22:59:11 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=T3Df=6P=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1jUecg-0007wT-18
 for xen-devel@lists.xenproject.org; Fri, 01 May 2020 22:59:10 +0000
X-Inumbo-ID: 5cf8f43e-8bff-11ea-9b6f-12813bfff9fa
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 5cf8f43e-8bff-11ea-9b6f-12813bfff9fa;
 Fri, 01 May 2020 22:59:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1588373949;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=vfDg0gLirp3wqWcYHVf6YMOyxLiUvrLksiHPpLTiioo=;
 b=CWTRh3jMoBdgTb8l5JZHkZrzWJ2i0vSdsuBe5XBN8ZgsOo63lF313NXC
 jcrMgm4JJKaBTeMwUeVoA6dDaITrVacXQchFXaHEJeyNLRGmAFy70EYJM
 ReZyH0y3kedaALnaXzJwEBoVOhmM2WzXdWtUC4TuN20BTnPgajOGU/hSd s=;
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa3.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: kIYvcEtKJuBgW1dMx7Ua+jevmpknfZwyDEOZbchuAhJfHUXQJf87Ye5sg9yPemW/8UqWX4hLus
 St19uT9t+tWzu0d55eT5RBQKAJxbdBzfeHAW6pOK/P81MbGa14YVdTnu4e7mi0Cmk3kNQzuEzx
 SlaZso0FMEoWSNc5fA5n1mhN2agYO9cEcTFH5WYR8JGX8bCbIZdYciuvQoRfTxC/qQFUAi88VU
 +hm++7OuEAR1TbbVXSFEMtG66NL0jubThZ0LPvqy/3f0dbqp3mkKaOzHfvlBVeaovzxEm1pQ/a
 5Jo=
X-SBRS: 2.7
X-MesageID: 16584680
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,341,1583211600"; d="scan'208";a="16584680"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Subject: [PATCH 02/16] x86/traps: Clean up printing in
 do_reserved_trap()/fatal_trap()
Date: Fri, 1 May 2020 23:58:24 +0100
Message-ID: <20200501225838.9866-3-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20200501225838.9866-1-andrew.cooper3@citrix.com>
References: <20200501225838.9866-1-andrew.cooper3@citrix.com>
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
---
 xen/arch/x86/traps.c            | 24 +++++++++++++++++++-----
 xen/include/asm-x86/processor.h |  6 +-----
 xen/include/asm-x86/x86-defns.h | 35 +++++++++++++++++++++++++++++++++++
 3 files changed, 55 insertions(+), 10 deletions(-)

diff --git a/xen/arch/x86/traps.c b/xen/arch/x86/traps.c
index fe9457cdb6..e73f07f28a 100644
--- a/xen/arch/x86/traps.c
+++ b/xen/arch/x86/traps.c
@@ -686,6 +686,20 @@ const char *trapstr(unsigned int trapnr)
     return trapnr < ARRAY_SIZE(strings) ? strings[trapnr] : "???";
 }
 
+static const char *vec_name(unsigned int vec)
+{
+    static const char names[][4] = {
+#define N(x) [X86_EXC_ ## x] = #x
+        N(DE),  N(DB),  N(NMI), N(BP),  N(OF),  N(BR),  N(UD),  N(NM),
+        N(DF),  N(CSO), N(TS),  N(NP),  N(SS),  N(GP),  N(PF),  N(SPV),
+        N(MF),  N(AC),  N(MC),  N(XM),  N(VE),  N(CP),
+                                        N(HV),  N(VC),  N(SX),
+#undef N
+    };
+
+    return (vec < ARRAY_SIZE(names) && names[vec][0]) ? names[vec] : "??";
+}
+
 /*
  * This is called for faults at very unexpected times (e.g., when interrupts
  * are disabled). In such situations we can't do much that is safe. We try to
@@ -743,10 +757,9 @@ void fatal_trap(const struct cpu_user_regs *regs, bool show_remote)
         }
     }
 
-    panic("FATAL TRAP: vector = %d (%s)\n"
-          "[error_code=%04x] %s\n",
-          trapnr, trapstr(trapnr), regs->error_code,
-          (regs->eflags & X86_EFLAGS_IF) ? "" : ", IN INTERRUPT CONTEXT");
+    panic("FATAL TRAP: vec %u, #%s[%04x]%s\n",
+          trapnr, vec_name(trapnr), regs->error_code,
+          (regs->eflags & X86_EFLAGS_IF) ? "" : " IN INTERRUPT CONTEXT");
 }
 
 static void do_reserved_trap(struct cpu_user_regs *regs)
@@ -757,7 +770,8 @@ static void do_reserved_trap(struct cpu_user_regs *regs)
         return;
 
     show_execution_state(regs);
-    panic("FATAL RESERVED TRAP %#x: %s\n", trapnr, trapstr(trapnr));
+    panic("FATAL RESERVED TRAP: vec %u, #%s[%04x]\n",
+          trapnr, vec_name(trapnr), regs->error_code);
 }
 
 static void do_trap(struct cpu_user_regs *regs)
diff --git a/xen/include/asm-x86/processor.h b/xen/include/asm-x86/processor.h
index 8f6f5a97dd..12b55e1022 100644
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
index 8bf503220a..84e15b15be 100644
--- a/xen/include/asm-x86/x86-defns.h
+++ b/xen/include/asm-x86/x86-defns.h
@@ -118,4 +118,39 @@
 
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
+
 #endif	/* __XEN_X86_DEFNS_H__ */
-- 
2.11.0


