Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B5A31E1072
	for <lists+xen-devel@lfdr.de>; Mon, 25 May 2020 16:26:25 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jdE3Q-0007o5-Fx; Mon, 25 May 2020 14:26:12 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=MLe6=7H=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jdE3P-0007nz-1R
 for xen-devel@lists.xenproject.org; Mon, 25 May 2020 14:26:11 +0000
X-Inumbo-ID: ad078142-9e93-11ea-b9cf-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ad078142-9e93-11ea-b9cf-bc764e2007e4;
 Mon, 25 May 2020 14:26:09 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 2FC91ABEC;
 Mon, 25 May 2020 14:26:11 +0000 (UTC)
Subject: [PATCH v10 1/9] x86emul: address x86_insn_is_mem_{access,write}()
 omissions
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <d2375ecb-f662-99d8-84c2-e9f9c5cf7b9e@suse.com>
Message-ID: <f41a4f27-bbe2-6450-38c1-6c4e23f2b07b@suse.com>
Date: Mon, 25 May 2020 16:26:07 +0200
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

First of all explain in comments what the functions' purposes are. Then
make them actually match their comments.

Note that fc6fa977be54 ("x86emul: extend x86_insn_is_mem_write()
coverage") didn't actually fix the function's behavior for {,V}STMXCSR:
Both are covered by generic code higher up in the function, due to
x86_decode_twobyte() already doing suitable adjustments. And VSTMXCSR
wouldn't have been covered anyway without a further X86EMUL_OPC_VEX()
case label. Keep the inner case label in a comment for reference.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
v10: Move ARPL case to earlier switch() x86_insn_is_mem_write(). Make
     group 5 handling actually work there. Drop VMPTRST case. Also
     handle CLFLUSH*, CLWB, UDn, and remaining PREFETCH* in
     x86_insn_is_mem_access().
v9: New.

--- a/xen/arch/x86/x86_emulate/x86_emulate.c
+++ b/xen/arch/x86/x86_emulate/x86_emulate.c
@@ -11474,25 +11474,87 @@ x86_insn_operand_ea(const struct x86_emu
     return state->ea.mem.off;
 }
 
+/*
+ * This function means to return 'true' for all supported insns with explicit
+ * accesses to memory.  This means also insns which don't have an explicit
+ * memory operand (like POP), but it does not mean e.g. segment selector
+ * loads, where the descriptor table access is considered an implicit one.
+ */
 bool
 x86_insn_is_mem_access(const struct x86_emulate_state *state,
                        const struct x86_emulate_ctxt *ctxt)
 {
+    if ( mode_64bit() && state->not_64bit )
+        return false;
+
     if ( state->ea.type == OP_MEM )
-        return ctxt->opcode != 0x8d /* LEA */ &&
-               (ctxt->opcode != X86EMUL_OPC(0x0f, 0x01) ||
-                (state->modrm_reg & 7) != 7) /* INVLPG */;
+    {
+        switch ( ctxt->opcode )
+        {
+        case 0x8d: /* LEA */
+        case X86EMUL_OPC(0x0f, 0x0d): /* PREFETCH */
+        case X86EMUL_OPC(0x0f, 0x18)
+         ... X86EMUL_OPC(0x0f, 0x1f): /* NOP space */
+        case X86EMUL_OPC_66(0x0f, 0x18)
+         ... X86EMUL_OPC_66(0x0f, 0x1f): /* NOP space */
+        case X86EMUL_OPC_F3(0x0f, 0x18)
+         ... X86EMUL_OPC_F3(0x0f, 0x1f): /* NOP space */
+        case X86EMUL_OPC_F2(0x0f, 0x18)
+         ... X86EMUL_OPC_F2(0x0f, 0x1f): /* NOP space */
+        case X86EMUL_OPC(0x0f, 0xb9): /* UD1 */
+        case X86EMUL_OPC(0x0f, 0xff): /* UD0 */
+            return false;
+
+        case X86EMUL_OPC(0x0f, 0x01):
+            return (state->modrm_reg & 7) != 7; /* INVLPG */
+
+        case X86EMUL_OPC(0x0f, 0xae):
+            return (state->modrm_reg & 7) != 7; /* CLFLUSH */
+
+        case X86EMUL_OPC_66(0x0f, 0xae):
+            return (state->modrm_reg & 7) < 6; /* CLWB, CLFLUSHOPT */
+        }
+
+        return true;
+    }
 
     switch ( ctxt->opcode )
     {
+    case 0x06 ... 0x07: /* PUSH / POP %es */
+    case 0x0e:          /* PUSH %cs */
+    case 0x16 ... 0x17: /* PUSH / POP %ss */
+    case 0x1e ... 0x1f: /* PUSH / POP %ds */
+    case 0x50 ... 0x5f: /* PUSH / POP reg */
+    case 0x60 ... 0x61: /* PUSHA / POPA */
+    case 0x68: case 0x6a: /* PUSH imm */
     case 0x6c ... 0x6f: /* INS / OUTS */
+    case 0x8f:          /* POP r/m */
+    case 0x9a:          /* CALL (far, direct) */
+    case 0x9c ... 0x9d: /* PUSHF / POPF */
     case 0xa4 ... 0xa7: /* MOVS / CMPS */
     case 0xaa ... 0xaf: /* STOS / LODS / SCAS */
+    case 0xc2 ... 0xc3: /* RET (near) */
+    case 0xc8 ... 0xc9: /* ENTER / LEAVE */
+    case 0xca ... 0xcb: /* RET (far) */
     case 0xd7:          /* XLAT */
+    case 0xe8:          /* CALL (near, direct) */
+    case X86EMUL_OPC(0x0f, 0xa0):         /* PUSH %fs */
+    case X86EMUL_OPC(0x0f, 0xa1):         /* POP %fs */
+    case X86EMUL_OPC(0x0f, 0xa8):         /* PUSH %gs */
+    case X86EMUL_OPC(0x0f, 0xa9):         /* POP %gs */
     CASE_SIMD_PACKED_INT_VEX(0x0f, 0xf7): /* MASKMOV{Q,DQU} */
                                           /* VMASKMOVDQU */
         return true;
 
+    case 0xff:
+        switch ( state->modrm_reg & 7 )
+        {
+        case 2: /* CALL (near, indirect) */
+        case 6: /* PUSH r/m */
+            return true;
+        }
+        break;
+
     case X86EMUL_OPC(0x0f, 0x01):
         /* Cover CLZERO. */
         return (state->modrm_rm & 7) == 4 && (state->modrm_reg & 7) == 7;
@@ -11501,10 +11563,20 @@ x86_insn_is_mem_access(const struct x86_
     return false;
 }
 
+/*
+ * This function means to return 'true' for all supported insns with explicit
+ * writes to memory.  This means also insns which don't have an explicit
+ * memory operand (like PUSH), but it does not mean e.g. segment selector
+ * loads, where the (possible) descriptor table write is considered an
+ * implicit access.
+ */
 bool
 x86_insn_is_mem_write(const struct x86_emulate_state *state,
                       const struct x86_emulate_ctxt *ctxt)
 {
+    if ( mode_64bit() && state->not_64bit )
+        return false;
+
     switch ( state->desc & DstMask )
     {
     case DstMem:
@@ -11516,19 +11588,48 @@ x86_insn_is_mem_write(const struct x86_e
         break;
 
     default:
+        switch ( ctxt->opcode )
+        {
+        case 0x63:                         /* ARPL */
+            return !mode_64bit();
+        }
+
         return false;
     }
 
     if ( state->modrm_mod == 3 )
-        /* CLZERO is the odd one. */
-        return ctxt->opcode == X86EMUL_OPC(0x0f, 0x01) &&
-               (state->modrm_rm & 7) == 4 && (state->modrm_reg & 7) == 7;
+    {
+        switch ( ctxt->opcode )
+        {
+        case 0xff: /* Grp5 */
+            break;
+
+        case X86EMUL_OPC(0x0f, 0x01): /* CLZERO is the odd one. */
+            return (state->modrm_rm & 7) == 4 && (state->modrm_reg & 7) == 7;
+
+        default:
+            return false;
+        }
+    }
 
     switch ( ctxt->opcode )
     {
+    case 0x06:                           /* PUSH %es */
+    case 0x0e:                           /* PUSH %cs */
+    case 0x16:                           /* PUSH %ss */
+    case 0x1e:                           /* PUSH %ds */
+    case 0x50 ... 0x57:                  /* PUSH reg */
+    case 0x60:                           /* PUSHA */
+    case 0x68: case 0x6a:                /* PUSH imm */
     case 0x6c: case 0x6d:                /* INS */
+    case 0x9a:                           /* CALL (far, direct) */
+    case 0x9c:                           /* PUSHF */
     case 0xa4: case 0xa5:                /* MOVS */
     case 0xaa: case 0xab:                /* STOS */
+    case 0xc8:                           /* ENTER */
+    case 0xe8:                           /* CALL (near, direct) */
+    case X86EMUL_OPC(0x0f, 0xa0):        /* PUSH %fs */
+    case X86EMUL_OPC(0x0f, 0xa8):        /* PUSH %gs */
     case X86EMUL_OPC(0x0f, 0xab):        /* BTS */
     case X86EMUL_OPC(0x0f, 0xb3):        /* BTR */
     case X86EMUL_OPC(0x0f, 0xbb):        /* BTC */
@@ -11586,6 +11687,16 @@ x86_insn_is_mem_write(const struct x86_e
         }
         break;
 
+    case 0xff:
+        switch ( state->modrm_reg & 7 )
+        {
+        case 2: /* CALL (near, indirect) */
+        case 3: /* CALL (far, indirect) */
+        case 6: /* PUSH r/m */
+            return true;
+        }
+        break;
+
     case X86EMUL_OPC(0x0f, 0x01):
         switch ( state->modrm_reg & 7 )
         {
@@ -11600,7 +11711,7 @@ x86_insn_is_mem_write(const struct x86_e
         switch ( state->modrm_reg & 7 )
         {
         case 0: /* FXSAVE */
-        case 3: /* {,V}STMXCSR */
+        /* case 3: STMXCSR - handled above */
         case 4: /* XSAVE */
         case 6: /* XSAVEOPT */
             return true;
@@ -11616,7 +11727,6 @@ x86_insn_is_mem_write(const struct x86_e
         case 1: /* CMPXCHG{8,16}B */
         case 4: /* XSAVEC */
         case 5: /* XSAVES */
-        case 7: /* VMPTRST */
             return true;
         }
         break;


