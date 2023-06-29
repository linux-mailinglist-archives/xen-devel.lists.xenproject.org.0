Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2637C742A09
	for <lists+xen-devel@lfdr.de>; Thu, 29 Jun 2023 17:56:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.556959.869924 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qEtzu-00025T-RG; Thu, 29 Jun 2023 15:55:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 556959.869924; Thu, 29 Jun 2023 15:55:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qEtzu-00022m-NH; Thu, 29 Jun 2023 15:55:54 +0000
Received: by outflank-mailman (input) for mailman id 556959;
 Thu, 29 Jun 2023 15:55:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=T6tI=CR=bugseng.com=federico.serafini@srs-se1.protection.inumbo.net>)
 id 1qEtzt-0000zX-29
 for xen-devel@lists.xenproject.org; Thu, 29 Jun 2023 15:55:53 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6bd187ee-1695-11ee-8611-37d641c3527e;
 Thu, 29 Jun 2023 17:55:51 +0200 (CEST)
Received: from Dell.bugseng.com (unknown [37.160.192.186])
 by support.bugseng.com (Postfix) with ESMTPSA id 753F44EE073F;
 Thu, 29 Jun 2023 17:55:49 +0200 (CEST)
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
X-Inumbo-ID: 6bd187ee-1695-11ee-8611-37d641c3527e
From: Federico Serafini <federico.serafini@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com,
	Federico Serafini <federico.serafini@bugseng.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Michal Orzel <michal.orzel@amd.com>,
	Xenia Ragiadakou <xenia.ragiadakou@amd.com>,
	Ayan Kumar Halder <ayan.kumar.halder@amd.com>
Subject: [XEN PATCH 4/5] x86/x86_emulate: change parameter name from 's' to 'state'
Date: Thu, 29 Jun 2023 17:55:32 +0200
Message-Id: <8c8bc96b96a1111a4651f970f506d304809ea40d.1688049495.git.federico.serafini@bugseng.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1688049494.git.federico.serafini@bugseng.com>
References: <cover.1688049494.git.federico.serafini@bugseng.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Change parameter name from 's' to 'state' in function definitions in
order to:
1) keep consistency with the parameter names used in the corresponding
   declarations;
2) keep consistency with parameter names used within x86_emulate.h;
3) fix violations of MISRA C:2012 Rule 8.3.

Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
---
 xen/arch/x86/x86_emulate/blk.c      | 38 ++++++++++----------
 xen/arch/x86/x86_emulate/util-xen.c | 46 ++++++++++++------------
 xen/arch/x86/x86_emulate/util.c     | 54 ++++++++++++++---------------
 3 files changed, 69 insertions(+), 69 deletions(-)

diff --git a/xen/arch/x86/x86_emulate/blk.c b/xen/arch/x86/x86_emulate/blk.c
index e790f4f900..23eeb00db2 100644
--- a/xen/arch/x86/x86_emulate/blk.c
+++ b/xen/arch/x86/x86_emulate/blk.c
@@ -22,12 +22,12 @@ int x86_emul_blk(
     void *data,
     unsigned int bytes,
     uint32_t *eflags,
-    struct x86_emulate_state *s,
+    struct x86_emulate_state *state,
     struct x86_emulate_ctxt *ctxt)
 {
     int rc = X86EMUL_OKAY;
 
-    switch ( s->blk )
+    switch ( state->blk )
     {
         bool zf;
 #ifndef X86EMUL_NO_FPU
@@ -72,13 +72,13 @@ int x86_emul_blk(
     case blk_fld:
         ASSERT(!data);
 
-        /* s->rex_prefix carries CR0.PE && !EFLAGS.VM setting */
+        /* state->rex_prefix carries CR0.PE && !EFLAGS.VM setting */
         switch ( bytes )
         {
         case sizeof(fpstate.env): /* 32-bit FLDENV */
         case sizeof(fpstate):     /* 32-bit FRSTOR */
             memcpy(&fpstate.env, ptr, sizeof(fpstate.env));
-            if ( !s->rex_prefix )
+            if ( !state->rex_prefix )
             {
                 /* Convert 32-bit real/vm86 to 32-bit prot format. */
                 unsigned int fip = fpstate.env.mode.real.fip_lo +
@@ -109,7 +109,7 @@ int x86_emul_blk(
             fpstate.env.fsw = env->fsw;
             fpstate.env.ftw = env->ftw;
 
-            if ( s->rex_prefix )
+            if ( state->rex_prefix )
             {
                 /* Convert 16-bit prot to 32-bit prot format. */
                 fpstate.env.mode.prot.fip = env->mode.prot.fip;
@@ -165,12 +165,12 @@ int x86_emul_blk(
         else
             asm ( "fnstenv %0" : "+m" (fpstate.env) );
 
-        /* s->rex_prefix carries CR0.PE && !EFLAGS.VM setting */
+        /* state->rex_prefix carries CR0.PE && !EFLAGS.VM setting */
         switch ( bytes )
         {
         case sizeof(fpstate.env): /* 32-bit FNSTENV */
         case sizeof(fpstate):     /* 32-bit FNSAVE */
-            if ( !s->rex_prefix )
+            if ( !state->rex_prefix )
             {
                 /* Convert 32-bit prot to 32-bit real/vm86 format. */
                 unsigned int fip = fpstate.env.mode.prot.fip +
@@ -195,7 +195,7 @@ int x86_emul_blk(
 
         case sizeof(struct x87_env16):                        /* 16-bit FNSTENV */
         case sizeof(struct x87_env16) + sizeof(fpstate.freg): /* 16-bit FNSAVE */
-            if ( s->rex_prefix )
+            if ( state->rex_prefix )
             {
                 /* Convert 32-bit prot to 16-bit prot format. */
                 struct x87_env16 *env = ptr;
@@ -254,11 +254,11 @@ int x86_emul_blk(
 
         ASSERT(!data);
         ASSERT(bytes == sizeof(*fxsr));
-        ASSERT(s->op_bytes <= bytes);
+        ASSERT(state->op_bytes <= bytes);
 
-        if ( s->op_bytes < sizeof(*fxsr) )
+        if ( state->op_bytes < sizeof(*fxsr) )
         {
-            if ( s->rex_prefix & REX_W )
+            if ( state->rex_prefix & REX_W )
             {
                 /*
                  * The only way to force fxsaveq on a wide range of gas
@@ -278,13 +278,13 @@ int x86_emul_blk(
          * data FXRSTOR may actually consume in some way: Copy only the
          * defined portion, and zero the rest.
          */
-        memcpy(fxsr, ptr, min(s->op_bytes,
+        memcpy(fxsr, ptr, min(state->op_bytes,
                               (unsigned int)offsetof(struct x86_fxsr, rsvd)));
         memset(fxsr->rsvd, 0, sizeof(*fxsr) - offsetof(struct x86_fxsr, rsvd));
 
         generate_exception_if(fxsr->mxcsr & ~mxcsr_mask, X86_EXC_GP, 0);
 
-        if ( s->rex_prefix & REX_W )
+        if ( state->rex_prefix & REX_W )
         {
             /* See above for why operand/constraints are this way. */
             asm volatile ( ".byte 0x48; fxrstor (%1)"
@@ -301,15 +301,15 @@ int x86_emul_blk(
 
         ASSERT(!data);
         ASSERT(bytes == sizeof(*fxsr));
-        ASSERT(s->op_bytes <= bytes);
+        ASSERT(state->op_bytes <= bytes);
 
-        if ( s->op_bytes < sizeof(*fxsr) )
+        if ( state->op_bytes < sizeof(*fxsr) )
             /* Don't chance consuming uninitialized data. */
-            memset(fxsr, 0, s->op_bytes);
+            memset(fxsr, 0, state->op_bytes);
         else
             fxsr = ptr;
 
-        if ( s->rex_prefix & REX_W )
+        if ( state->rex_prefix & REX_W )
         {
             /* See above for why operand/constraints are this way. */
             asm volatile ( ".byte 0x48; fxsave (%1)"
@@ -318,8 +318,8 @@ int x86_emul_blk(
         else
             asm volatile ( "fxsave %0" : "=m" (*fxsr) );
 
-        if ( fxsr != ptr ) /* i.e. s->op_bytes < sizeof(*fxsr) */
-            memcpy(ptr, fxsr, s->op_bytes);
+        if ( fxsr != ptr ) /* i.e. state->op_bytes < sizeof(*fxsr) */
+            memcpy(ptr, fxsr, state->op_bytes);
         break;
     }
 
diff --git a/xen/arch/x86/x86_emulate/util-xen.c b/xen/arch/x86/x86_emulate/util-xen.c
index 5e90818010..b36acbe1b0 100644
--- a/xen/arch/x86/x86_emulate/util-xen.c
+++ b/xen/arch/x86/x86_emulate/util-xen.c
@@ -14,26 +14,26 @@
 #include <asm/xstate.h>
 
 #ifndef NDEBUG
-void x86_emulate_free_state(struct x86_emulate_state *s)
+void x86_emulate_free_state(struct x86_emulate_state *state)
 {
-    check_state(s);
-    s->caller = NULL;
+    check_state(state);
+    state->caller = NULL;
 }
 #endif
 
-unsigned int x86_insn_opsize(const struct x86_emulate_state *s)
+unsigned int x86_insn_opsize(const struct x86_emulate_state *state)
 {
-    check_state(s);
+    check_state(state);
 
-    return s->op_bytes << 3;
+    return state->op_bytes << 3;
 }
 
-int x86_insn_modrm(const struct x86_emulate_state *s,
+int x86_insn_modrm(const struct x86_emulate_state *state,
                    unsigned int *rm, unsigned int *reg)
 {
-    check_state(s);
+    check_state(state);
 
-    if ( unlikely(s->modrm_mod > 3) )
+    if ( unlikely(state->modrm_mod > 3) )
     {
         if ( rm )
             *rm = ~0U;
@@ -43,24 +43,24 @@ int x86_insn_modrm(const struct x86_emulate_state *s,
     }
 
     if ( rm )
-        *rm = s->modrm_rm;
+        *rm = state->modrm_rm;
     if ( reg )
-        *reg = s->modrm_reg;
+        *reg = state->modrm_reg;
 
-    return s->modrm_mod;
+    return state->modrm_mod;
 }
 
-unsigned long x86_insn_operand_ea(const struct x86_emulate_state *s,
+unsigned long x86_insn_operand_ea(const struct x86_emulate_state *state,
                                   enum x86_segment *seg)
 {
-    *seg = s->ea.type == OP_MEM ? s->ea.mem.seg : x86_seg_none;
+    *seg = state->ea.type == OP_MEM ? state->ea.mem.seg : x86_seg_none;
 
-    check_state(s);
+    check_state(state);
 
-    return s->ea.mem.off;
+    return state->ea.mem.off;
 }
 
-bool cf_check x86_insn_is_portio(const struct x86_emulate_state *s,
+bool cf_check x86_insn_is_portio(const struct x86_emulate_state *state,
                                  const struct x86_emulate_ctxt *ctxt)
 {
     switch ( ctxt->opcode )
@@ -74,7 +74,7 @@ bool cf_check x86_insn_is_portio(const struct x86_emulate_state *s,
     return false;
 }
 
-bool cf_check x86_insn_is_cr_access(const struct x86_emulate_state *s,
+bool cf_check x86_insn_is_cr_access(const struct x86_emulate_state *state,
                                     const struct x86_emulate_ctxt *ctxt)
 {
     switch ( ctxt->opcode )
@@ -82,7 +82,7 @@ bool cf_check x86_insn_is_cr_access(const struct x86_emulate_state *s,
         unsigned int ext;
 
     case X86EMUL_OPC(0x0f, 0x01):
-        if ( x86_insn_modrm(s, NULL, &ext) >= 0
+        if ( x86_insn_modrm(state, NULL, &ext) >= 0
              && (ext & 5) == 4 ) /* SMSW / LMSW */
             return true;
         break;
@@ -96,17 +96,17 @@ bool cf_check x86_insn_is_cr_access(const struct x86_emulate_state *s,
     return false;
 }
 
-unsigned long x86_insn_immediate(const struct x86_emulate_state *s,
+unsigned long x86_insn_immediate(const struct x86_emulate_state *state,
                                  unsigned int nr)
 {
-    check_state(s);
+    check_state(state);
 
     switch ( nr )
     {
     case 0:
-        return s->imm1;
+        return state->imm1;
     case 1:
-        return s->imm2;
+        return state->imm2;
     }
 
     return 0;
diff --git a/xen/arch/x86/x86_emulate/util.c b/xen/arch/x86/x86_emulate/util.c
index 4becd054c2..34daa8467f 100644
--- a/xen/arch/x86/x86_emulate/util.c
+++ b/xen/arch/x86/x86_emulate/util.c
@@ -8,12 +8,12 @@
 
 #include "private.h"
 
-unsigned int x86_insn_length(const struct x86_emulate_state *s,
+unsigned int x86_insn_length(const struct x86_emulate_state *state,
                              const struct x86_emulate_ctxt *ctxt)
 {
-    check_state(s);
+    check_state(state);
 
-    return s->ip - ctxt->regs->r(ip);
+    return state->ip - ctxt->regs->r(ip);
 }
 
 /*
@@ -22,13 +22,13 @@ unsigned int x86_insn_length(const struct x86_emulate_state *s,
  * memory operand (like POP), but it does not mean e.g. segment selector
  * loads, where the descriptor table access is considered an implicit one.
  */
-bool cf_check x86_insn_is_mem_access(const struct x86_emulate_state *s,
+bool cf_check x86_insn_is_mem_access(const struct x86_emulate_state *state,
                                      const struct x86_emulate_ctxt *ctxt)
 {
-    if ( mode_64bit() && s->not_64bit )
+    if ( mode_64bit() && state->not_64bit )
         return false;
 
-    if ( s->ea.type == OP_MEM )
+    if ( state->ea.type == OP_MEM )
     {
         switch ( ctxt->opcode )
         {
@@ -49,13 +49,13 @@ bool cf_check x86_insn_is_mem_access(const struct x86_emulate_state *s,
             return false;
 
         case X86EMUL_OPC(0x0f, 0x01):
-            return (s->modrm_reg & 7) != 7; /* INVLPG */
+            return (state->modrm_reg & 7) != 7; /* INVLPG */
 
         case X86EMUL_OPC(0x0f, 0xae):
-            return (s->modrm_reg & 7) != 7; /* CLFLUSH */
+            return (state->modrm_reg & 7) != 7; /* CLFLUSH */
 
         case X86EMUL_OPC_66(0x0f, 0xae):
-            return (s->modrm_reg & 7) < 6; /* CLWB, CLFLUSHOPT */
+            return (state->modrm_reg & 7) < 6; /* CLWB, CLFLUSHOPT */
         }
 
         return true;
@@ -91,7 +91,7 @@ bool cf_check x86_insn_is_mem_access(const struct x86_emulate_state *s,
         return true;
 
     case 0xff:
-        switch ( s->modrm_reg & 7 )
+        switch ( state->modrm_reg & 7 )
         {
         case 2: /* CALL (near, indirect) */
         case 6: /* PUSH r/m */
@@ -101,7 +101,7 @@ bool cf_check x86_insn_is_mem_access(const struct x86_emulate_state *s,
 
     case X86EMUL_OPC(0x0f, 0x01):
         /* Cover CLZERO. */
-        return (s->modrm_rm & 7) == 4 && (s->modrm_reg & 7) == 7;
+        return (state->modrm_rm & 7) == 4 && (state->modrm_reg & 7) == 7;
     }
 
     return false;
@@ -114,17 +114,17 @@ bool cf_check x86_insn_is_mem_access(const struct x86_emulate_state *s,
  * loads, where the (possible) descriptor table write is considered an
  * implicit access.
  */
-bool cf_check x86_insn_is_mem_write(const struct x86_emulate_state *s,
+bool cf_check x86_insn_is_mem_write(const struct x86_emulate_state *state,
                                     const struct x86_emulate_ctxt *ctxt)
 {
-    if ( mode_64bit() && s->not_64bit )
+    if ( mode_64bit() && state->not_64bit )
         return false;
 
-    switch ( s->desc & DstMask )
+    switch ( state->desc & DstMask )
     {
     case DstMem:
         /* The SrcMem check is to cover {,V}MASKMOV{Q,DQU}. */
-        return s->modrm_mod != 3 || (s->desc & SrcMask) == SrcMem;
+        return state->modrm_mod != 3 || (state->desc & SrcMask) == SrcMem;
 
     case DstBitBase:
     case DstImplicit:
@@ -147,13 +147,13 @@ bool cf_check x86_insn_is_mem_write(const struct x86_emulate_state *s,
              X86EMUL_OPC_EVEX_F3(0x0f38, 0x25): /* VPMOVS* */
         case X86EMUL_OPC_EVEX_F3(0x0f38, 0x30) ...
              X86EMUL_OPC_EVEX_F3(0x0f38, 0x35): /* VPMOV{D,Q,W}* */
-            return s->modrm_mod != 3;
+            return state->modrm_mod != 3;
         }
 
         return false;
     }
 
-    if ( s->modrm_mod == 3 )
+    if ( state->modrm_mod == 3 )
     {
         switch ( ctxt->opcode )
         {
@@ -161,7 +161,7 @@ bool cf_check x86_insn_is_mem_write(const struct x86_emulate_state *s,
             break;
 
         case X86EMUL_OPC(0x0f, 0x01): /* CLZERO is the odd one. */
-            return (s->modrm_rm & 7) == 4 && (s->modrm_reg & 7) == 7;
+            return (state->modrm_rm & 7) == 4 && (state->modrm_reg & 7) == 7;
 
         default:
             return false;
@@ -192,7 +192,7 @@ bool cf_check x86_insn_is_mem_write(const struct x86_emulate_state *s,
         return true;
 
     case 0xd9:
-        switch ( s->modrm_reg & 7 )
+        switch ( state->modrm_reg & 7 )
         {
         case 2: /* FST m32fp */
         case 3: /* FSTP m32fp */
@@ -203,7 +203,7 @@ bool cf_check x86_insn_is_mem_write(const struct x86_emulate_state *s,
         break;
 
     case 0xdb:
-        switch ( s->modrm_reg & 7 )
+        switch ( state->modrm_reg & 7 )
         {
         case 1: /* FISTTP m32i */
         case 2: /* FIST m32i */
@@ -214,7 +214,7 @@ bool cf_check x86_insn_is_mem_write(const struct x86_emulate_state *s,
         break;
 
     case 0xdd:
-        switch ( s->modrm_reg & 7 )
+        switch ( state->modrm_reg & 7 )
         {
         case 1: /* FISTTP m64i */
         case 2: /* FST m64fp */
@@ -226,7 +226,7 @@ bool cf_check x86_insn_is_mem_write(const struct x86_emulate_state *s,
         break;
 
     case 0xdf:
-        switch ( s->modrm_reg & 7 )
+        switch ( state->modrm_reg & 7 )
         {
         case 1: /* FISTTP m16i */
         case 2: /* FIST m16i */
@@ -238,7 +238,7 @@ bool cf_check x86_insn_is_mem_write(const struct x86_emulate_state *s,
         break;
 
     case 0xff:
-        switch ( s->modrm_reg & 7 )
+        switch ( state->modrm_reg & 7 )
         {
         case 2: /* CALL (near, indirect) */
         case 3: /* CALL (far, indirect) */
@@ -248,7 +248,7 @@ bool cf_check x86_insn_is_mem_write(const struct x86_emulate_state *s,
         break;
 
     case X86EMUL_OPC(0x0f, 0x01):
-        switch ( s->modrm_reg & 7 )
+        switch ( state->modrm_reg & 7 )
         {
         case 0: /* SGDT */
         case 1: /* SIDT */
@@ -258,7 +258,7 @@ bool cf_check x86_insn_is_mem_write(const struct x86_emulate_state *s,
         break;
 
     case X86EMUL_OPC(0x0f, 0xae):
-        switch ( s->modrm_reg & 7 )
+        switch ( state->modrm_reg & 7 )
         {
         case 0: /* FXSAVE */
         /* case 3: STMXCSR - handled above */
@@ -269,10 +269,10 @@ bool cf_check x86_insn_is_mem_write(const struct x86_emulate_state *s,
         break;
 
     case X86EMUL_OPC(0x0f, 0xba):
-        return (s->modrm_reg & 7) > 4; /* BTS / BTR / BTC */
+        return (state->modrm_reg & 7) > 4; /* BTS / BTR / BTC */
 
     case X86EMUL_OPC(0x0f, 0xc7):
-        switch ( s->modrm_reg & 7 )
+        switch ( state->modrm_reg & 7 )
         {
         case 1: /* CMPXCHG{8,16}B */
         case 4: /* XSAVEC */
-- 
2.34.1


