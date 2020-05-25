Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 723701E1087
	for <lists+xen-devel@lfdr.de>; Mon, 25 May 2020 16:30:00 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jdE6v-00005W-Oj; Mon, 25 May 2020 14:29:49 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=MLe6=7H=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jdE6u-00005J-9u
 for xen-devel@lists.xenproject.org; Mon, 25 May 2020 14:29:48 +0000
X-Inumbo-ID: 2f008aa4-9e94-11ea-ae69-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2f008aa4-9e94-11ea-ae69-bc764e2007e4;
 Mon, 25 May 2020 14:29:47 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 3A330ABEC;
 Mon, 25 May 2020 14:29:49 +0000 (UTC)
Subject: [PATCH v10 8/9] x86emul: support FLDENV and FRSTOR
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <d2375ecb-f662-99d8-84c2-e9f9c5cf7b9e@suse.com>
Message-ID: <6dc6eb46-c7cb-ca88-2f92-04b99be1b9ef@suse.com>
Date: Mon, 25 May 2020 16:29:45 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <d2375ecb-f662-99d8-84c2-e9f9c5cf7b9e@suse.com>
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

While the Intel SDM claims that FRSTOR itself may raise #MF upon
completion, this was confirmed by Intel to be a doc error which will be
corrected in due course; behavior is like FLDENV, and like old hard copy
manuals describe it.

Re-arrange a switch() statement's case label order to allow for
fall-through from FLDENV handling to FNSTENV's.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
v9: Refine description. Re-base over changes to earlier patch. Add
    comments.
v7: New.

--- a/tools/tests/x86_emulator/test_x86_emulator.c
+++ b/tools/tests/x86_emulator/test_x86_emulator.c
@@ -2442,6 +2442,27 @@ int main(int argc, char **argv)
     else
         printf("skipped\n");
 
+    printf("%-40s", "Testing fldenv 8(%edx)...");
+    if ( stack_exec && cpu_has_fpu )
+    {
+        asm volatile ( "fnstenv %0\n\t"
+                       "fninit"
+                       : "=m" (res[2]) :: "memory" );
+        zap_fpsel(&res[2], true);
+        instr[0] = 0xd9; instr[1] = 0x62; instr[2] = 0x08;
+        regs.eip = (unsigned long)&instr[0];
+        regs.edx = (unsigned long)res;
+        rc = x86_emulate(&ctxt, &emulops);
+        asm volatile ( "fnstenv %0" : "=m" (res[9]) :: "memory" );
+        if ( (rc != X86EMUL_OKAY) ||
+             memcmp(res + 2, res + 9, 28) ||
+             (regs.eip != (unsigned long)&instr[3]) )
+            goto fail;
+        printf("okay\n");
+    }
+    else
+        printf("skipped\n");
+
     printf("%-40s", "Testing 16-bit fnsave (%ecx)...");
     if ( stack_exec && cpu_has_fpu )
     {
@@ -2468,6 +2489,31 @@ int main(int argc, char **argv)
             goto fail;
         printf("okay\n");
     }
+    else
+        printf("skipped\n");
+
+    printf("%-40s", "Testing frstor (%edx)...");
+    if ( stack_exec && cpu_has_fpu )
+    {
+        const uint16_t seven = 7;
+
+        asm volatile ( "fninit\n\t"
+                       "fld1\n\t"
+                       "fidivs %1\n\t"
+                       "fnsave %0\n\t"
+                       : "=&m" (res[0]) : "m" (seven) : "memory" );
+        zap_fpsel(&res[0], true);
+        instr[0] = 0xdd; instr[1] = 0x22;
+        regs.eip = (unsigned long)&instr[0];
+        regs.edx = (unsigned long)res;
+        rc = x86_emulate(&ctxt, &emulops);
+        asm volatile ( "fnsave %0" : "=m" (res[27]) :: "memory" );
+        if ( (rc != X86EMUL_OKAY) ||
+             memcmp(res, res + 27, 108) ||
+             (regs.eip != (unsigned long)&instr[2]) )
+            goto fail;
+        printf("okay\n");
+    }
     else
         printf("skipped\n");
 
--- a/xen/arch/x86/x86_emulate/x86_emulate.c
+++ b/xen/arch/x86/x86_emulate/x86_emulate.c
@@ -857,6 +857,7 @@ struct x86_emulate_state {
         blk_NONE,
         blk_enqcmd,
 #ifndef X86EMUL_NO_FPU
+        blk_fld, /* FLDENV, FRSTOR */
         blk_fst, /* FNSTENV, FNSAVE */
 #endif
         blk_movdir,
@@ -4960,22 +4961,15 @@ x86_emulate(
                 dst.bytes = 4;
                 emulate_fpu_insn_memdst(b, modrm_reg & 7, dst.val);
                 break;
-            case 4: /* fldenv - TODO */
-                state->fpu_ctrl = true;
-                goto unimplemented_insn;
-            case 5: /* fldcw m2byte */
-                state->fpu_ctrl = true;
-            fpu_memsrc16:
-                if ( (rc = ops->read(ea.mem.seg, ea.mem.off, &src.val,
-                                     2, ctxt)) != X86EMUL_OKAY )
-                    goto done;
-                emulate_fpu_insn_memsrc(b, modrm_reg & 7, src.val);
-                break;
+            case 4: /* fldenv */
+                /* Raise #MF now if there are pending unmasked exceptions. */
+                emulate_fpu_insn_stub(0xd9, 0xd0 /* fnop */);
+                /* fall through */
             case 6: /* fnstenv */
                 fail_if(!ops->blk);
-                state->blk = blk_fst;
+                state->blk = modrm_reg & 2 ? blk_fst : blk_fld;
                 /*
-                 * REX is meaningless for this insn by this point - (ab)use
+                 * REX is meaningless for these insns by this point - (ab)use
                  * the field to communicate real vs protected mode to ->blk().
                  */
                 /*state->*/rex_prefix = in_protmode(ctxt, ops);
@@ -4987,6 +4981,14 @@ x86_emulate(
                     goto done;
                 state->fpu_ctrl = true;
                 break;
+            case 5: /* fldcw m2byte */
+                state->fpu_ctrl = true;
+            fpu_memsrc16:
+                if ( (rc = ops->read(ea.mem.seg, ea.mem.off, &src.val,
+                                     2, ctxt)) != X86EMUL_OKAY )
+                    goto done;
+                emulate_fpu_insn_memsrc(b, modrm_reg & 7, src.val);
+                break;
             case 7: /* fnstcw m2byte */
                 state->fpu_ctrl = true;
             fpu_memdst16:
@@ -5139,14 +5141,15 @@ x86_emulate(
                 dst.bytes = 8;
                 emulate_fpu_insn_memdst(b, modrm_reg & 7, dst.val);
                 break;
-            case 4: /* frstor - TODO */
-                state->fpu_ctrl = true;
-                goto unimplemented_insn;
+            case 4: /* frstor */
+                /* Raise #MF now if there are pending unmasked exceptions. */
+                emulate_fpu_insn_stub(0xd9, 0xd0 /* fnop */);
+                /* fall through */
             case 6: /* fnsave */
                 fail_if(!ops->blk);
-                state->blk = blk_fst;
+                state->blk = modrm_reg & 2 ? blk_fst : blk_fld;
                 /*
-                 * REX is meaningless for this insn by this point - (ab)use
+                 * REX is meaningless for these insns by this point - (ab)use
                  * the field to communicate real vs protected mode to ->blk().
                  */
                 /*state->*/rex_prefix = in_protmode(ctxt, ops);
@@ -11673,6 +11676,92 @@ int x86_emul_blk(
 
 #ifndef X86EMUL_NO_FPU
 
+    case blk_fld:
+        ASSERT(!data);
+
+        /* state->rex_prefix carries CR0.PE && !EFLAGS.VM setting */
+        switch ( bytes )
+        {
+        case sizeof(fpstate.env): /* 32-bit FLDENV */
+        case sizeof(fpstate):     /* 32-bit FRSTOR */
+            memcpy(&fpstate.env, ptr, sizeof(fpstate.env));
+            if ( !state->rex_prefix )
+            {
+                /* Convert 32-bit real/vm86 to 32-bit prot format. */
+                unsigned int fip = fpstate.env.mode.real.fip_lo +
+                                   (fpstate.env.mode.real.fip_hi << 16);
+                unsigned int fdp = fpstate.env.mode.real.fdp_lo +
+                                   (fpstate.env.mode.real.fdp_hi << 16);
+                unsigned int fop = fpstate.env.mode.real.fop;
+
+                fpstate.env.mode.prot.fip = fip & 0xf;
+                fpstate.env.mode.prot.fcs = fip >> 4;
+                fpstate.env.mode.prot.fop = fop;
+                fpstate.env.mode.prot.fdp = fdp & 0xf;
+                fpstate.env.mode.prot.fds = fdp >> 4;
+            }
+
+            if ( bytes == sizeof(fpstate.env) )
+                ptr = NULL;
+            else
+                ptr += sizeof(fpstate.env);
+            break;
+
+        case sizeof(struct x87_env16):                        /* 16-bit FLDENV */
+        case sizeof(struct x87_env16) + sizeof(fpstate.freg): /* 16-bit FRSTOR */
+        {
+            const struct x87_env16 *env = ptr;
+
+            fpstate.env.fcw = env->fcw;
+            fpstate.env.fsw = env->fsw;
+            fpstate.env.ftw = env->ftw;
+
+            if ( state->rex_prefix )
+            {
+                /* Convert 16-bit prot to 32-bit prot format. */
+                fpstate.env.mode.prot.fip = env->mode.prot.fip;
+                fpstate.env.mode.prot.fcs = env->mode.prot.fcs;
+                fpstate.env.mode.prot.fdp = env->mode.prot.fdp;
+                fpstate.env.mode.prot.fds = env->mode.prot.fds;
+                fpstate.env.mode.prot.fop = 0; /* unknown */
+            }
+            else
+            {
+                /* Convert 16-bit real/vm86 to 32-bit prot format. */
+                unsigned int fip = env->mode.real.fip_lo +
+                                   (env->mode.real.fip_hi << 16);
+                unsigned int fdp = env->mode.real.fdp_lo +
+                                   (env->mode.real.fdp_hi << 16);
+                unsigned int fop = env->mode.real.fop;
+
+                fpstate.env.mode.prot.fip = fip & 0xf;
+                fpstate.env.mode.prot.fcs = fip >> 4;
+                fpstate.env.mode.prot.fop = fop;
+                fpstate.env.mode.prot.fdp = fdp & 0xf;
+                fpstate.env.mode.prot.fds = fdp >> 4;
+            }
+
+            if ( bytes == sizeof(*env) )
+                ptr = NULL;
+            else
+                ptr += sizeof(*env);
+            break;
+        }
+
+        default:
+            ASSERT_UNREACHABLE();
+            return X86EMUL_UNHANDLEABLE;
+        }
+
+        if ( ptr )
+        {
+            memcpy(fpstate.freg, ptr, sizeof(fpstate.freg));
+            asm volatile ( "frstor %0" :: "m" (fpstate) );
+        }
+        else
+            asm volatile ( "fldenv %0" :: "m" (fpstate.env) );
+        break;
+
     case blk_fst:
         ASSERT(!data);
 


