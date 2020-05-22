Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A422D1DE44F
	for <lists+xen-devel@lfdr.de>; Fri, 22 May 2020 12:25:12 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jc4rJ-0003Oj-43; Fri, 22 May 2020 10:24:57 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=owPK=7E=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1jc4rH-0003Ob-OA
 for xen-devel@lists.xenproject.org; Fri, 22 May 2020 10:24:55 +0000
X-Inumbo-ID: 7a2bb4ac-9c16-11ea-b9cf-bc764e2007e4
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7a2bb4ac-9c16-11ea-b9cf-bc764e2007e4;
 Fri, 22 May 2020 10:24:54 +0000 (UTC)
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: tgrRlMpCO0BybmgfjOhfOL32RnJz6f5bXzxP33D5/jL1e1EpQYCtLmxkvk3gOlYagw/plfz5Hq
 TBk/BAlqY3CiRze1LPmXZ6SQOVZOJjWfi7pSFz/VnadKH+HSJ4XjgI9JUZCYRD8pT1atRWyt/Y
 hq+9d0AJiWPVV+szftI4GF3bpzInsFNncpE3M9qLEmZ1D1YhDelpRAbrJEwkF8C2phO/FAmTSa
 Fr85v7TCgVDRfSYhmiXkgVQ1eeipDypSROjl8CAb3wWtQXfyuPVgmmNsZ5UIhvxwkYgpzRGIOE
 BJ8=
X-SBRS: 2.7
X-MesageID: 18427591
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,421,1583211600"; d="scan'208";a="18427591"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Subject: [PATCH v2] x86/ioemul: Rewrite stub generation to be shadow stack
 compatible
Date: Fri, 22 May 2020 11:24:35 +0100
Message-ID: <20200522102435.14329-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
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

Introduce a new nocall annotation using __attribute__((error)) to prohibit
calls being made.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
--
CC: Jan Beulich <JBeulich@suse.com>
CC: Wei Liu <wl@xen.org>
CC: Roger Pau Monné <roger.pau@citrix.com>

v2:
 * Add ELF metadata for {load,save}_guest_gprs()
 * Make ioemul_handle_quirk() __read_mostly
 * Add new nocall tag
---
 xen/arch/x86/ioport_emulate.c  | 11 ++---
 xen/arch/x86/pv/emul-priv-op.c | 92 +++++++++++++++++++++++++++++++-----------
 xen/arch/x86/pv/gpr_switch.S   | 44 ++++++++------------
 xen/arch/x86/traps.c           |  3 --
 xen/include/asm-x86/io.h       |  3 +-
 xen/include/xen/compiler.h     |  2 +
 6 files changed, 95 insertions(+), 60 deletions(-)

diff --git a/xen/arch/x86/ioport_emulate.c b/xen/arch/x86/ioport_emulate.c
index 499c1f6056..b9d5d27188 100644
--- a/xen/arch/x86/ioport_emulate.c
+++ b/xen/arch/x86/ioport_emulate.c
@@ -8,7 +8,10 @@
 #include <xen/sched.h>
 #include <xen/dmi.h>
 
-static bool ioemul_handle_proliant_quirk(
+unsigned int __read_mostly (*ioemul_handle_quirk)(
+    uint8_t opcode, char *io_emul_stub, struct cpu_user_regs *regs);
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
index 3b705299cf..3fb36a3e19 100644
--- a/xen/arch/x86/pv/emul-priv-op.c
+++ b/xen/arch/x86/pv/emul-priv-op.c
@@ -47,51 +47,97 @@ struct priv_op_ctxt {
     unsigned int bpmatch;
 };
 
-/* I/O emulation support. Helper routines for, and type of, the stack stub. */
-void host_to_guest_gpr_switch(struct cpu_user_regs *);
-unsigned long guest_to_host_gpr_switch(unsigned long);
+/* I/O emulation helpers.  Use non-standard calling conventions. */
+void nocall load_guest_gprs(struct cpu_user_regs *);
+void nocall save_guest_gprs(void);
 
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
+     * helpers (non-standard ABI), and one of several possible stubs
+     * performing the real I/O.
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
index 6d26192c2c..e7f5bfcd2d 100644
--- a/xen/arch/x86/pv/gpr_switch.S
+++ b/xen/arch/x86/pv/gpr_switch.S
@@ -9,59 +9,49 @@
 
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
+        .size load_guest_gprs, . - load_guest_gprs
+        .type load_guest_gprs, STT_FUNC
+
+
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
+
+        .size save_guest_gprs, . - save_guest_gprs
+        .type save_guest_gprs, STT_FUNC
diff --git a/xen/arch/x86/traps.c b/xen/arch/x86/traps.c
index 3f93ec285e..f383b07f6e 100644
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
diff --git a/xen/include/xen/compiler.h b/xen/include/xen/compiler.h
index 8c846261d2..c22439b7a4 100644
--- a/xen/include/xen/compiler.h
+++ b/xen/include/xen/compiler.h
@@ -20,6 +20,8 @@
 
 #define __weak        __attribute__((__weak__))
 
+#define nocall        __attribute__((error("Nonstandard ABI")))
+
 #if (!defined(__clang__) && (__GNUC__ == 4) && (__GNUC_MINOR__ < 5))
 #define unreachable() do {} while (1)
 #else
-- 
2.11.0


