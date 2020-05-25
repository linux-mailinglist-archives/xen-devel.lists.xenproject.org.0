Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 274A21E1077
	for <lists+xen-devel@lfdr.de>; Mon, 25 May 2020 16:27:17 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jdE41-0007ro-Sr; Mon, 25 May 2020 14:26:49 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=MLe6=7H=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jdE40-0007rg-O2
 for xen-devel@lists.xenproject.org; Mon, 25 May 2020 14:26:48 +0000
X-Inumbo-ID: c38e4676-9e93-11ea-aee4-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c38e4676-9e93-11ea-aee4-12813bfff9fa;
 Mon, 25 May 2020 14:26:47 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id EDF8EAC9F;
 Mon, 25 May 2020 14:26:48 +0000 (UTC)
Subject: [PATCH v10 2/9] x86emul: rework CMP and TEST emulation
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <d2375ecb-f662-99d8-84c2-e9f9c5cf7b9e@suse.com>
Message-ID: <5843dca9-1a1a-a32e-3cb0-95cd93533723@suse.com>
Date: Mon, 25 May 2020 16:26:45 +0200
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

Unlike similarly encoded insns these don't write their memory operands,
and hence x86_is_mem_write() should return false for them. However,
rather than adding special logic there, rework how their emulation gets
done, by making decoding attributes properly describe the r/o nature of
their memory operands.

Note how this also allows dropping custom LOCK prefix checks.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
v10: New.

--- a/xen/arch/x86/x86_emulate/x86_emulate.c
+++ b/xen/arch/x86/x86_emulate/x86_emulate.c
@@ -84,7 +84,7 @@ static const opcode_desc_t opcode_table[
     ByteOp|DstReg|SrcMem|ModRM, DstReg|SrcMem|ModRM,
     ByteOp|DstEax|SrcImm, DstEax|SrcImm, 0, ImplicitOps,
     /* 0x38 - 0x3F */
-    ByteOp|DstMem|SrcReg|ModRM, DstMem|SrcReg|ModRM,
+    ByteOp|DstReg|SrcMem|ModRM, DstReg|SrcMem|ModRM,
     ByteOp|DstReg|SrcMem|ModRM, DstReg|SrcMem|ModRM,
     ByteOp|DstEax|SrcImm, DstEax|SrcImm, 0, ImplicitOps,
     /* 0x40 - 0x4F */
@@ -2481,7 +2481,6 @@ x86_decode_onebyte(
     case 0x60: /* pusha */
     case 0x61: /* popa */
     case 0x62: /* bound */
-    case 0x82: /* Grp1 (x86/32 only) */
     case 0xc4: /* les */
     case 0xc5: /* lds */
     case 0xce: /* into */
@@ -2491,6 +2490,14 @@ x86_decode_onebyte(
         state->not_64bit = true;
         break;
 
+    case 0x82: /* Grp1 (x86/32 only) */
+        state->not_64bit = true;
+        /* fall through */
+    case 0x80: case 0x81: case 0x83: /* Grp1 */
+        if ( (modrm_reg & 7) == 7 ) /* cmp */
+            state->desc = (state->desc & ByteOp) | DstNone | SrcMem;
+        break;
+
     case 0x90: /* nop / pause */
         if ( repe_prefix() )
             ctxt->opcode |= X86EMUL_OPC_F3(0, 0);
@@ -2521,6 +2528,11 @@ x86_decode_onebyte(
         imm2 = insn_fetch_type(uint8_t);
         break;
 
+    case 0xf6: case 0xf7: /* Grp3 */
+        if ( !(modrm_reg & 6) ) /* test */
+            state->desc = (state->desc & ByteOp) | DstNone | SrcMem;
+        break;
+
     case 0xff: /* Grp5 */
         switch ( modrm_reg & 7 )
         {
@@ -3928,13 +3940,11 @@ x86_emulate(
         break;
 
     case 0x38: case 0x39: cmp: /* cmp reg,mem */
-        if ( ops->rmw && dst.type == OP_MEM &&
-             (rc = read_ulong(dst.mem.seg, dst.mem.off, &dst.val,
-                              dst.bytes, ctxt, ops)) != X86EMUL_OKAY )
-            goto done;
-        /* fall through */
+        emulate_2op_SrcV("cmp", dst, src, _regs.eflags);
+        dst.type = OP_NONE;
+        break;
+
     case 0x3a ... 0x3d: /* cmp */
-        generate_exception_if(lock_prefix, EXC_UD);
         emulate_2op_SrcV("cmp", src, dst, _regs.eflags);
         dst.type = OP_NONE;
         break;
@@ -4239,7 +4249,9 @@ x86_emulate(
         case 4: goto and;
         case 5: goto sub;
         case 6: goto xor;
-        case 7: goto cmp;
+        case 7:
+            dst.val = imm1;
+            goto cmp;
         }
         break;
 
@@ -5233,11 +5245,8 @@ x86_emulate(
             unsigned long u[2], v;
 
         case 0 ... 1: /* test */
-            generate_exception_if(lock_prefix, EXC_UD);
-            if ( ops->rmw && dst.type == OP_MEM &&
-                 (rc = read_ulong(dst.mem.seg, dst.mem.off, &dst.val,
-                                  dst.bytes, ctxt, ops)) != X86EMUL_OKAY )
-                goto done;
+            dst.val = imm1;
+            dst.bytes = src.bytes;
             goto test;
         case 2: /* not */
             if ( ops->rmw && dst.type == OP_MEM )


