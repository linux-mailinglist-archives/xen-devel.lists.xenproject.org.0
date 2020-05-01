Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B0801C2118
	for <lists+xen-devel@lfdr.de>; Sat,  2 May 2020 01:04:54 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jUei4-0001KJ-O0; Fri, 01 May 2020 23:04:44 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=T3Df=6P=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1jUei2-0001JE-Ud
 for xen-devel@lists.xenproject.org; Fri, 01 May 2020 23:04:42 +0000
X-Inumbo-ID: 23f6d6f0-8c00-11ea-9b70-12813bfff9fa
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 23f6d6f0-8c00-11ea-9b70-12813bfff9fa;
 Fri, 01 May 2020 23:04:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1588374282;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=VTFDnoal8uf23mjLhPOcZyRMpnFsT5lsnYXHVwdqsjQ=;
 b=iXGR5INgY6IsJTqgU5U0m96sGcM65YqJFlHDsJVfUDQEQT2bTBefk84h
 CgPr1SEbpwYsd/iSCDfjIhcLtSWDd5//0XyvXSr6RLLS7H/nrwyqQZLCS
 S3Va8RIJ3JHnhKYnk5nXULzc7YC3ux3hOMSjBSL2DdK8olR+Q/Gl9DUQf s=;
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa6.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: tcUAXi3qqq2QFegR7Dr5w7LqqzPZbEH3INzJFOcZ7ggbdbyDPEu2JiVPCJu7W+lB8aSaYbcjp3
 ghu7Kun0k2rPVCAmuCXw/nGsEbp0MadK4aIZVUYC5cuKpbXAjmjaC+yXHXLkGMmhqwFWJkRy3W
 sNDSLLPX6aS5bFQevEC+M/20+8Mi/8ihFzxrB0H2f4cdL0IOzU3q70XtFxk3/bb99q7y3UbSwL
 nSeSenWENhksll65mhdlmACEFbjKcslcREi7707oGG37RL8HJ3bn+LPCCG/YXlSBtfvyWPewJc
 8s4=
X-SBRS: 2.7
X-MesageID: 16995031
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,341,1583211600"; d="scan'208";a="16995031"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Subject: [PATCH 13/16] x86/ioemul: Rewrite stub generation to be shadow stack
 compatible
Date: Fri, 1 May 2020 23:58:35 +0100
Message-ID: <20200501225838.9866-14-andrew.cooper3@citrix.com>
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

The logic is completely undocumented and almost impossible to follow.  It
actually uses return oriented programming.  Rewrite it to conform to more
normal call mechanics, and leave a big comment explaining thing.  As well as
the code being easier to follow, it will execute faster as it isn't fighting
the branch predictor.

Move the ioemul_handle_quirk() function pointer from traps.c to
ioport_emulate.c.  There is no reason for it to be in neither of the two
translation units which use it.  Alter the behaviour to return the number of
bytes written into the stub.

Access the addresses of the host/guest helpers with extern const char arrays.
Nothing good will come of C thinking they are regular functions.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
--
CC: Jan Beulich <JBeulich@suse.com>
CC: Wei Liu <wl@xen.org>
CC: Roger Pau Monné <roger.pau@citrix.com>

Posted previously on its perf benefits alone, but here is the real reason
behind the change.
---
 xen/arch/x86/ioport_emulate.c  | 11 ++---
 xen/arch/x86/pv/emul-priv-op.c | 91 +++++++++++++++++++++++++++++++-----------
 xen/arch/x86/pv/gpr_switch.S   | 37 +++++------------
 xen/arch/x86/traps.c           |  3 --
 xen/include/asm-x86/io.h       |  3 +-
 5 files changed, 85 insertions(+), 60 deletions(-)

diff --git a/xen/arch/x86/ioport_emulate.c b/xen/arch/x86/ioport_emulate.c
index 499c1f6056..f7511a9c49 100644
--- a/xen/arch/x86/ioport_emulate.c
+++ b/xen/arch/x86/ioport_emulate.c
@@ -8,7 +8,10 @@
 #include <xen/sched.h>
 #include <xen/dmi.h>
 
-static bool ioemul_handle_proliant_quirk(
+unsigned int (*ioemul_handle_quirk)(
+    u8 opcode, char *io_emul_stub, struct cpu_user_regs *regs);
+
+static unsigned int ioemul_handle_proliant_quirk(
     u8 opcode, char *io_emul_stub, struct cpu_user_regs *regs)
 {
     static const char stub[] = {
@@ -19,18 +22,16 @@ static bool ioemul_handle_proliant_quirk(
         0xa8, 0x80, /*    test $0x80, %al */
         0x75, 0xfb, /*    jnz 1b          */
         0x9d,       /*    popf            */
-        0xc3,       /*    ret             */
     };
     uint16_t port = regs->dx;
     uint8_t value = regs->al;
 
     if ( (opcode != 0xee) || (port != 0xcd4) || !(value & 0x80) )
-        return false;
+        return 0;
 
     memcpy(io_emul_stub, stub, sizeof(stub));
-    BUILD_BUG_ON(IOEMUL_QUIRK_STUB_BYTES < sizeof(stub));
 
-    return true;
+    return sizeof(stub);
 }
 
 /* This table is the set of system-specific I/O emulation hooks. */
diff --git a/xen/arch/x86/pv/emul-priv-op.c b/xen/arch/x86/pv/emul-priv-op.c
index e24b84f46a..f150886711 100644
--- a/xen/arch/x86/pv/emul-priv-op.c
+++ b/xen/arch/x86/pv/emul-priv-op.c
@@ -54,51 +54,96 @@ struct priv_op_ctxt {
     unsigned int bpmatch;
 };
 
-/* I/O emulation support. Helper routines for, and type of, the stack stub. */
-void host_to_guest_gpr_switch(struct cpu_user_regs *);
-unsigned long guest_to_host_gpr_switch(unsigned long);
+/* I/O emulation helpers.  Use non-standard calling conventions. */
+extern const char load_guest_gprs[], save_guest_gprs[];
 
 typedef void io_emul_stub_t(struct cpu_user_regs *);
 
 static io_emul_stub_t *io_emul_stub_setup(struct priv_op_ctxt *ctxt, u8 opcode,
                                           unsigned int port, unsigned int bytes)
 {
+    /*
+     * Construct a stub for IN/OUT emulation.
+     *
+     * Some platform drivers communicate with the SMM handler using GPRs as a
+     * mailbox.  Therefore, we must perform the emulation with the hardware
+     * domain's registers in view.
+     *
+     * We write a stub of the following form, using the guest load/save
+     * helpers (abnormal calling conventions), and one of several possible
+     * stubs performing the real I/O.
+     */
+    static const char prologue[] = {
+        0x53,       /* push %rbx */
+        0x55,       /* push %rbp */
+        0x41, 0x54, /* push %r12 */
+        0x41, 0x55, /* push %r13 */
+        0x41, 0x56, /* push %r14 */
+        0x41, 0x57, /* push %r15 */
+        0x57,       /* push %rdi (param for save_guest_gprs) */
+    };              /* call load_guest_gprs */
+                    /* <I/O stub> */
+                    /* call save_guest_gprs */
+    static const char epilogue[] = {
+        0x5f,       /* pop %rdi  */
+        0x41, 0x5f, /* pop %r15  */
+        0x41, 0x5e, /* pop %r14  */
+        0x41, 0x5d, /* pop %r13  */
+        0x41, 0x5c, /* pop %r12  */
+        0x5d,       /* pop %rbp  */
+        0x5b,       /* pop %rbx  */
+        0xc3,       /* ret       */
+    };
+
     struct stubs *this_stubs = &this_cpu(stubs);
     unsigned long stub_va = this_stubs->addr + STUB_BUF_SIZE / 2;
-    long disp;
-    bool use_quirk_stub = false;
+    unsigned int quirk_bytes = 0;
+    char *p;
+
+    /* Helpers - Read outer scope but only modify p. */
+#define APPEND_BUFF(b) ({ memcpy(p, b, sizeof(b)); p += sizeof(b); })
+#define APPEND_CALL(f)                                                  \
+    ({                                                                  \
+        long disp = (long)(f) - (stub_va + p - ctxt->io_emul_stub + 5); \
+        BUG_ON((int32_t)disp != disp);                                  \
+        *p++ = 0xe8;                                                    \
+        *(int32_t *)p = disp; p += 4;                                   \
+    })
 
     if ( !ctxt->io_emul_stub )
         ctxt->io_emul_stub =
             map_domain_page(_mfn(this_stubs->mfn)) + (stub_va & ~PAGE_MASK);
 
-    /* call host_to_guest_gpr_switch */
-    ctxt->io_emul_stub[0] = 0xe8;
-    disp = (long)host_to_guest_gpr_switch - (stub_va + 5);
-    BUG_ON((int32_t)disp != disp);
-    *(int32_t *)&ctxt->io_emul_stub[1] = disp;
+    p = ctxt->io_emul_stub;
+
+    APPEND_BUFF(prologue);
+    APPEND_CALL(load_guest_gprs);
 
+    /* Some platforms might need to quirk the stub for specific inputs. */
     if ( unlikely(ioemul_handle_quirk) )
-        use_quirk_stub = ioemul_handle_quirk(opcode, &ctxt->io_emul_stub[5],
-                                             ctxt->ctxt.regs);
+    {
+        quirk_bytes = ioemul_handle_quirk(opcode, p, ctxt->ctxt.regs);
+        p += quirk_bytes;
+    }
 
-    if ( !use_quirk_stub )
+    /* Default I/O stub. */
+    if ( likely(!quirk_bytes) )
     {
-        /* data16 or nop */
-        ctxt->io_emul_stub[5] = (bytes != 2) ? 0x90 : 0x66;
-        /* <io-access opcode> */
-        ctxt->io_emul_stub[6] = opcode;
-        /* imm8 or nop */
-        ctxt->io_emul_stub[7] = !(opcode & 8) ? port : 0x90;
-        /* ret (jumps to guest_to_host_gpr_switch) */
-        ctxt->io_emul_stub[8] = 0xc3;
+        *p++ = (bytes != 2) ? 0x90 : 0x66;  /* data16 or nop */
+        *p++ = opcode;                      /* <opcode>      */
+        *p++ = !(opcode & 8) ? port : 0x90; /* imm8 or nop   */
     }
 
-    BUILD_BUG_ON(STUB_BUF_SIZE / 2 < MAX(9, /* Default emul stub */
-                                         5 + IOEMUL_QUIRK_STUB_BYTES));
+    APPEND_CALL(save_guest_gprs);
+    APPEND_BUFF(epilogue);
+
+    BUG_ON(STUB_BUF_SIZE / 2 < (p - ctxt->io_emul_stub));
 
     /* Handy function-typed pointer to the stub. */
     return (void *)stub_va;
+
+#undef APPEND_CALL
+#undef APPEND_BUFF
 }
 
 
diff --git a/xen/arch/x86/pv/gpr_switch.S b/xen/arch/x86/pv/gpr_switch.S
index 6d26192c2c..e3f8037b69 100644
--- a/xen/arch/x86/pv/gpr_switch.S
+++ b/xen/arch/x86/pv/gpr_switch.S
@@ -9,59 +9,42 @@
 
 #include <asm/asm_defns.h>
 
-ENTRY(host_to_guest_gpr_switch)
-        movq  (%rsp), %rcx
-        movq  %rdi, (%rsp)
+/* Load guest GPRs.  Parameter in %rdi, clobbers all registers. */
+ENTRY(load_guest_gprs)
         movq  UREGS_rdx(%rdi), %rdx
-        pushq %rbx
         movq  UREGS_rax(%rdi), %rax
         movq  UREGS_rbx(%rdi), %rbx
-        pushq %rbp
         movq  UREGS_rsi(%rdi), %rsi
         movq  UREGS_rbp(%rdi), %rbp
-        pushq %r12
-        movq  UREGS_r8(%rdi), %r8
+        movq  UREGS_r8 (%rdi), %r8
         movq  UREGS_r12(%rdi), %r12
-        pushq %r13
-        movq  UREGS_r9(%rdi), %r9
+        movq  UREGS_r9 (%rdi), %r9
         movq  UREGS_r13(%rdi), %r13
-        pushq %r14
         movq  UREGS_r10(%rdi), %r10
         movq  UREGS_r14(%rdi), %r14
-        pushq %r15
         movq  UREGS_r11(%rdi), %r11
         movq  UREGS_r15(%rdi), %r15
-        pushq %rcx /* dummy push, filled by guest_to_host_gpr_switch pointer */
-        pushq %rcx
-        leaq  guest_to_host_gpr_switch(%rip),%rcx
-        movq  %rcx,8(%rsp)
         movq  UREGS_rcx(%rdi), %rcx
         movq  UREGS_rdi(%rdi), %rdi
         ret
 
-ENTRY(guest_to_host_gpr_switch)
+/* Save guest GPRs.  Parameter on the stack above the return address. */
+ENTRY(save_guest_gprs)
         pushq %rdi
-        movq  7*8(%rsp), %rdi
+        movq  2*8(%rsp), %rdi
         movq  %rax, UREGS_rax(%rdi)
-        popq  UREGS_rdi(%rdi)
+        popq        UREGS_rdi(%rdi)
         movq  %r15, UREGS_r15(%rdi)
         movq  %r11, UREGS_r11(%rdi)
-        popq  %r15
         movq  %r14, UREGS_r14(%rdi)
         movq  %r10, UREGS_r10(%rdi)
-        popq  %r14
         movq  %r13, UREGS_r13(%rdi)
-        movq  %r9, UREGS_r9(%rdi)
-        popq  %r13
+        movq  %r9,  UREGS_r9 (%rdi)
         movq  %r12, UREGS_r12(%rdi)
-        movq  %r8, UREGS_r8(%rdi)
-        popq  %r12
+        movq  %r8,  UREGS_r8 (%rdi)
         movq  %rbp, UREGS_rbp(%rdi)
         movq  %rsi, UREGS_rsi(%rdi)
-        popq  %rbp
         movq  %rbx, UREGS_rbx(%rdi)
         movq  %rdx, UREGS_rdx(%rdi)
-        popq  %rbx
         movq  %rcx, UREGS_rcx(%rdi)
-        popq  %rcx
         ret
diff --git a/xen/arch/x86/traps.c b/xen/arch/x86/traps.c
index 2354357cc1..3923950df7 100644
--- a/xen/arch/x86/traps.c
+++ b/xen/arch/x86/traps.c
@@ -117,9 +117,6 @@ idt_entry_t *idt_tables[NR_CPUS] __read_mostly;
  */
 DEFINE_PER_CPU_PAGE_ALIGNED(struct tss_page, tss_page);
 
-bool (*ioemul_handle_quirk)(
-    u8 opcode, char *io_emul_stub, struct cpu_user_regs *regs);
-
 static int debug_stack_lines = 20;
 integer_param("debug_stack_lines", debug_stack_lines);
 
diff --git a/xen/include/asm-x86/io.h b/xen/include/asm-x86/io.h
index 8708b79b99..c4ec52cba7 100644
--- a/xen/include/asm-x86/io.h
+++ b/xen/include/asm-x86/io.h
@@ -49,8 +49,7 @@ __OUT(w,"w",short)
 __OUT(l,,int)
 
 /* Function pointer used to handle platform specific I/O port emulation. */
-#define IOEMUL_QUIRK_STUB_BYTES 10
-extern bool (*ioemul_handle_quirk)(
+extern unsigned int (*ioemul_handle_quirk)(
     u8 opcode, char *io_emul_stub, struct cpu_user_regs *regs);
 
 #endif
-- 
2.11.0


