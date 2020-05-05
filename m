Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FC721C5007
	for <lists+xen-devel@lfdr.de>; Tue,  5 May 2020 10:16:14 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jVskD-0004Ne-MQ; Tue, 05 May 2020 08:16:01 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=5wz9=6T=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jVskC-0004NM-1e
 for xen-devel@lists.xenproject.org; Tue, 05 May 2020 08:16:00 +0000
X-Inumbo-ID: a6685f00-8ea8-11ea-ae69-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a6685f00-8ea8-11ea-ae69-bc764e2007e4;
 Tue, 05 May 2020 08:15:59 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 63F98AFF0;
 Tue,  5 May 2020 08:16:00 +0000 (UTC)
Subject: [PATCH v8 07/12] x86emul: support FNSTENV and FNSAVE
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <60cc730f-2a1c-d7a6-74fe-64f3c9308831@suse.com>
Message-ID: <9a2afbb1-af92-2c7d-9fde-d8d8e4563a2a@suse.com>
Date: Tue, 5 May 2020 10:15:56 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <60cc730f-2a1c-d7a6-74fe-64f3c9308831@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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
 Roger Pau Monne <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

To avoid introducing another boolean into emulator state, the
rex_prefix field gets (ab)used to convey the real/VM86 vs protected mode
info (affecting structure layout, albeit not size) to x86_emul_blk().

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
TBD: The full 16-bit padding fields in the 32-bit structures get filled
     with all ones by modern CPUs (i.e. other than the comment says for
     FIP and FDP). We may want to mirror this as well (for the real mode
     variant), even if those fields' contents are unspecified.
---
v7: New.

--- a/tools/tests/x86_emulator/x86-emulate.h
+++ b/tools/tests/x86_emulator/x86-emulate.h
@@ -120,6 +120,7 @@ static inline bool xcr0_mask(uint64_t ma
 }
 
 #define cache_line_size() (cp.basic.clflush_size * 8)
+#define cpu_has_fpu        cp.basic.fpu
 #define cpu_has_mmx        cp.basic.mmx
 #define cpu_has_fxsr       cp.basic.fxsr
 #define cpu_has_sse        cp.basic.sse
--- a/tools/tests/x86_emulator/test_x86_emulator.c
+++ b/tools/tests/x86_emulator/test_x86_emulator.c
@@ -748,6 +748,25 @@ static struct x86_emulate_ops emulops =
 
 #define MMAP_ADDR 0x100000
 
+/*
+ * 64-bit OSes may not (be able to) properly restore the two selectors in
+ * the FPU environment. Zap them so that memcmp() on two saved images will
+ * work regardless of whether a context switch occurred in the middle.
+ */
+static void zap_fpsel(unsigned int *env, bool is_32bit)
+{
+    if ( is_32bit )
+    {
+        env[4] &= ~0xffff;
+        env[6] &= ~0xffff;
+    }
+    else
+    {
+        env[2] &= ~0xffff;
+        env[3] &= ~0xffff;
+    }
+}
+
 #ifdef __x86_64__
 # define STKVAL_DISP 64
 static const struct {
@@ -2394,6 +2413,62 @@ int main(int argc, char **argv)
         printf("okay\n");
     }
     else
+        printf("skipped\n");
+
+    printf("%-40s", "Testing fnstenv 4(%ecx)...");
+    if ( stack_exec && cpu_has_fpu )
+    {
+        const uint16_t three = 3;
+
+        asm volatile ( "fninit\n\t"
+                       "fld1\n\t"
+                       "fidivs %1\n\t"
+                       "fstenv %0"
+                       : "=m" (res[9]) : "m" (three) : "memory" );
+        zap_fpsel(&res[9], true);
+        instr[0] = 0xd9; instr[1] = 0x71; instr[2] = 0x04;
+        regs.eip = (unsigned long)&instr[0];
+        regs.ecx = (unsigned long)res;
+        res[8] = 0xaa55aa55;
+        rc = x86_emulate(&ctxt, &emulops);
+        zap_fpsel(&res[1], true);
+        if ( (rc != X86EMUL_OKAY) ||
+             memcmp(res + 1, res + 9, 28) ||
+             res[8] != 0xaa55aa55 ||
+             (regs.eip != (unsigned long)&instr[3]) )
+            goto fail;
+        printf("okay\n");
+    }
+    else
+        printf("skipped\n");
+
+    printf("%-40s", "Testing 16-bit fnsave (%ecx)...");
+    if ( stack_exec && cpu_has_fpu )
+    {
+        const uint16_t five = 5;
+
+        asm volatile ( "fninit\n\t"
+                       "fld1\n\t"
+                       "fidivs %1\n\t"
+                       "fsaves %0"
+                       : "=m" (res[25]) : "m" (five) : "memory" );
+        zap_fpsel(&res[25], false);
+        asm volatile ( "frstors %0" :: "m" (res[25]) : "memory" );
+        instr[0] = 0x66; instr[1] = 0xdd; instr[2] = 0x31;
+        regs.eip = (unsigned long)&instr[0];
+        regs.ecx = (unsigned long)res;
+        res[23] = 0xaa55aa55;
+        res[24] = 0xaa55aa55;
+        rc = x86_emulate(&ctxt, &emulops);
+        if ( (rc != X86EMUL_OKAY) ||
+             memcmp(res, res + 25, 94) ||
+             (res[23] >> 16) != 0xaa55 ||
+             res[24] != 0xaa55aa55 ||
+             (regs.eip != (unsigned long)&instr[3]) )
+            goto fail;
+        printf("okay\n");
+    }
+    else
         printf("skipped\n");
 
     printf("%-40s", "Testing movq %mm3,(%ecx)...");
--- a/xen/arch/x86/x86_emulate/x86_emulate.c
+++ b/xen/arch/x86/x86_emulate/x86_emulate.c
@@ -856,6 +856,9 @@ struct x86_emulate_state {
     enum {
         blk_NONE,
         blk_enqcmd,
+#ifndef X86EMUL_NO_FPU
+        blk_fst, /* FNSTENV, FNSAVE */
+#endif
         blk_movdir,
     } blk;
     uint8_t modrm, modrm_mod, modrm_reg, modrm_rm;
@@ -897,6 +900,50 @@ struct x86_emulate_state {
 #define PTR_POISON NULL /* 32-bit builds are for user-space, so NULL is OK. */
 #endif
 
+#ifndef X86EMUL_NO_FPU
+struct x87_env16 {
+    uint16_t fcw;
+    uint16_t fsw;
+    uint16_t ftw;
+    union {
+        struct {
+            uint16_t fip_lo;
+            uint16_t fop:11, :1, fip_hi:4;
+            uint16_t fdp_lo;
+            uint16_t :12, fdp_hi:4;
+        } real;
+        struct {
+            uint16_t fip;
+            uint16_t fcs;
+            uint16_t fdp;
+            uint16_t fds;
+        } prot;
+    } mode;
+};
+
+struct x87_env32 {
+    uint32_t fcw:16, :16;
+    uint32_t fsw:16, :16;
+    uint32_t ftw:16, :16;
+    union {
+        struct {
+            /* some CPUs/FPUs also store the full FIP here */
+            uint32_t fip_lo:16, :16;
+            uint32_t fop:11, :1, fip_hi:16, :4;
+            /* some CPUs/FPUs also store the full FDP here */
+            uint32_t fdp_lo:16, :16;
+            uint32_t :12, fdp_hi:16, :4;
+        } real;
+        struct {
+            uint32_t fip;
+            uint32_t fcs:16, fop:11, :5;
+            uint32_t fdp;
+            uint32_t fds:16, :16;
+        } prot;
+    } mode;
+};
+#endif
+
 typedef union {
     uint64_t mmx;
     uint64_t __attribute__ ((aligned(16))) xmm[2];
@@ -4912,9 +4959,19 @@ x86_emulate(
                     goto done;
                 emulate_fpu_insn_memsrc(b, modrm_reg & 7, src.val);
                 break;
-            case 6: /* fnstenv - TODO */
+            case 6: /* fnstenv */
+                fail_if(!ops->blk);
+                state->blk = blk_fst;
+                /* REX is meaningless for this insn by this point. */
+                rex_prefix = in_protmode(ctxt, ops);
+                if ( (rc = ops->blk(ea.mem.seg, ea.mem.off, NULL,
+                                    op_bytes > 2 ? sizeof(struct x87_env32)
+                                                 : sizeof(struct x87_env16),
+                                    &_regs.eflags,
+                                    state, ctxt)) != X86EMUL_OKAY )
+                    goto done;
                 state->fpu_ctrl = true;
-                goto unimplemented_insn;
+                break;
             case 7: /* fnstcw m2byte */
                 state->fpu_ctrl = true;
             fpu_memdst16:
@@ -5068,9 +5125,21 @@ x86_emulate(
                 emulate_fpu_insn_memdst(b, modrm_reg & 7, dst.val);
                 break;
             case 4: /* frstor - TODO */
-            case 6: /* fnsave - TODO */
                 state->fpu_ctrl = true;
                 goto unimplemented_insn;
+            case 6: /* fnsave */
+                fail_if(!ops->blk);
+                state->blk = blk_fst;
+                /* REX is meaningless for this insn by this point. */
+                rex_prefix = in_protmode(ctxt, ops);
+                if ( (rc = ops->blk(ea.mem.seg, ea.mem.off, NULL,
+                                    op_bytes > 2 ? sizeof(struct x87_env32) + 80
+                                                 : sizeof(struct x87_env16) + 80,
+                                    &_regs.eflags,
+                                    state, ctxt)) != X86EMUL_OKAY )
+                    goto done;
+                state->fpu_ctrl = true;
+                break;
             case 7: /* fnstsw m2byte */
                 state->fpu_ctrl = true;
                 goto fpu_memdst16;
@@ -11542,6 +11611,12 @@ int x86_emul_blk(
     switch ( state->blk )
     {
         bool zf;
+        struct {
+            struct x87_env32 env;
+            struct {
+               uint8_t bytes[10];
+            } freg[8];
+        } fpstate;
 
         /*
          * Throughout this switch(), memory clobbers are used to compensate
@@ -11571,6 +11646,93 @@ int x86_emul_blk(
             *eflags |= X86_EFLAGS_ZF;
         break;
 
+#ifndef X86EMUL_NO_FPU
+
+    case blk_fst:
+        ASSERT(!data);
+
+        if ( bytes > sizeof(fpstate.env) )
+            asm ( "fnsave %0" : "=m" (fpstate) );
+        else
+            asm ( "fnstenv %0" : "=m" (fpstate.env) );
+
+        /* state->rex_prefix carries CR0.PE && !EFLAGS.VM setting */
+        switch ( bytes )
+        {
+        case sizeof(fpstate.env):
+        case sizeof(fpstate):
+            if ( !state->rex_prefix )
+            {
+                unsigned int fip = fpstate.env.mode.prot.fip +
+                                   (fpstate.env.mode.prot.fcs << 4);
+                unsigned int fdp = fpstate.env.mode.prot.fdp +
+                                   (fpstate.env.mode.prot.fds << 4);
+                unsigned int fop = fpstate.env.mode.prot.fop;
+
+                memset(&fpstate.env.mode, 0, sizeof(fpstate.env.mode));
+                fpstate.env.mode.real.fip_lo = fip;
+                fpstate.env.mode.real.fip_hi = fip >> 16;
+                fpstate.env.mode.real.fop = fop;
+                fpstate.env.mode.real.fdp_lo = fdp;
+                fpstate.env.mode.real.fdp_hi = fdp >> 16;
+            }
+            memcpy(ptr, &fpstate.env, sizeof(fpstate.env));
+            if ( bytes == sizeof(fpstate.env) )
+                ptr = NULL;
+            else
+                ptr += sizeof(fpstate.env);
+            break;
+
+        case sizeof(struct x87_env16):
+        case sizeof(struct x87_env16) + sizeof(fpstate.freg):
+            if ( state->rex_prefix )
+            {
+                struct x87_env16 *env = ptr;
+
+                env->fcw = fpstate.env.fcw;
+                env->fsw = fpstate.env.fsw;
+                env->ftw = fpstate.env.ftw;
+                env->mode.prot.fip = fpstate.env.mode.prot.fip;
+                env->mode.prot.fcs = fpstate.env.mode.prot.fcs;
+                env->mode.prot.fdp = fpstate.env.mode.prot.fdp;
+                env->mode.prot.fds = fpstate.env.mode.prot.fds;
+            }
+            else
+            {
+                unsigned int fip = fpstate.env.mode.prot.fip +
+                                   (fpstate.env.mode.prot.fcs << 4);
+                unsigned int fdp = fpstate.env.mode.prot.fdp +
+                                   (fpstate.env.mode.prot.fds << 4);
+                struct x87_env16 env = {
+                    .fcw = fpstate.env.fcw,
+                    .fsw = fpstate.env.fsw,
+                    .ftw = fpstate.env.ftw,
+                    .mode.real.fip_lo = fip,
+                    .mode.real.fip_hi = fip >> 16,
+                    .mode.real.fop = fpstate.env.mode.prot.fop,
+                    .mode.real.fdp_lo = fdp,
+                    .mode.real.fdp_hi = fdp >> 16
+                };
+
+                memcpy(ptr, &env, sizeof(env));
+            }
+            if ( bytes == sizeof(struct x87_env16) )
+                ptr = NULL;
+            else
+                ptr += sizeof(struct x87_env16);
+            break;
+
+        default:
+            ASSERT_UNREACHABLE();
+            return X86EMUL_UNHANDLEABLE;
+        }
+
+        if ( ptr )
+            memcpy(ptr, fpstate.freg, sizeof(fpstate.freg));
+        break;
+
+#endif /* X86EMUL_NO_FPU */
+
     case blk_movdir:
         switch ( bytes )
         {


