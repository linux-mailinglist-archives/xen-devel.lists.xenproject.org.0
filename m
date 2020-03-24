Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 94D0819166D
	for <lists+xen-devel@lfdr.de>; Tue, 24 Mar 2020 17:30:23 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jGmOY-0003BD-N8; Tue, 24 Mar 2020 16:27:14 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Lmgi=5J=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jGmOW-0003Ax-IC
 for xen-devel@lists.xenproject.org; Tue, 24 Mar 2020 16:27:12 +0000
X-Inumbo-ID: 5028661c-6dec-11ea-8475-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 5028661c-6dec-11ea-8475-12813bfff9fa;
 Tue, 24 Mar 2020 16:27:11 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id D0BC6ABF4;
 Tue, 24 Mar 2020 16:27:10 +0000 (UTC)
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <cfeb8fcf-3ba6-674c-17a9-93be9e746930@suse.com>
Message-ID: <5fbb2e32-ad0f-af25-35de-720baff3351e@suse.com>
Date: Tue, 24 Mar 2020 17:27:08 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <cfeb8fcf-3ba6-674c-17a9-93be9e746930@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Subject: [Xen-devel] [PATCH 3/7] x86emul: vendor specific direct branch
 behavior in 64-bit mode
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Intel CPUs ignore operand size overrides here, while AMD ones don't.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/tools/tests/x86_emulator/test_x86_emulator.c
+++ b/tools/tests/x86_emulator/test_x86_emulator.c
@@ -757,6 +757,62 @@ static const struct {
         .opc_len = { 4, 4 },
         .stkoff = { 2 + 16, 8 + 16 },
         .disp = { STKVAL_DISP - MMAP_ADDR, STKVAL_DISP },
+    }, {
+        .descr = "jmpw .+16",
+        .opcode = { 0x66, 0xeb, 0x10 },
+        .opc_len = { 3, 3 },
+        .disp = { 3 + 16 - MMAP_ADDR, 3 + 16 },
+    }, {
+        .descr = "jmpw .+128",
+        .opcode = { 0x66, 0xe9, 0x80, 0x00, 0x00, 0x00 },
+        .opc_len = { 4, 6 },
+        .disp = { 4 + 128 - MMAP_ADDR, 6 + 128 },
+    }, {
+        .descr = "callw .+16",
+        .opcode = { 0x66, 0xe8, 0x10, 0x00, 0x00, 0x00 },
+        .opc_len = { 4, 6 },
+        .stkoff = { -2, -8 },
+        .disp = { 4 + 16 - MMAP_ADDR, 6 + 16 },
+    }, {
+        .descr = "jzw .+16",
+        .opcode = { 0x66, 0x74, 0x10 },
+        .opc_len = { 3, 3 },
+        .disp = { 3, 3 },
+    }, {
+        .descr = "jzw .+128",
+        .opcode = { 0x66, 0x0f, 0x84, 0x80, 0x00, 0x00, 0x00 },
+        .opc_len = { 5, 7 },
+        .disp = { 5, 7 },
+    }, {
+        .descr = "jnzw .+16",
+        .opcode = { 0x66, 0x75, 0x10 },
+        .opc_len = { 3, 3 },
+        .disp = { 3 + 16 - MMAP_ADDR, 3 + 16 },
+    }, {
+        .descr = "jnzw .+128",
+        .opcode = { 0x66, 0x0f, 0x85, 0x80, 0x00, 0x00, 0x00 },
+        .opc_len = { 5, 7 },
+        .disp = { 5 + 128 - MMAP_ADDR, 7 + 128 },
+    }, {
+        .descr = "loopqw .+16 (RCX>1)",
+        .opcode = { 0x66, 0xe0, 0x10 },
+        .opc_len = { 3, 3 },
+        .disp = { 3 + 16 - MMAP_ADDR, 3 + 16 },
+    }, {
+        .descr = "looplw .+16 (ECX=1)",
+        .opcode = { 0x66, 0x67, 0xe0, 0x10 },
+        .opc_len = { 4, 4 },
+        .disp = { 4, 4 },
+    }, {
+        .descr = "jrcxzw .+16 (RCX>0)",
+        .opcode = { 0x66, 0xe3, 0x10 },
+        .opc_len = { 3, 3 },
+        .disp = { 3, 3 },
+    }, {
+        .descr = "jecxzw .+16 (ECX=0)",
+        .opcode = { 0x66, 0x67, 0xe3, 0x10 },
+        .opc_len = { 4, 4 },
+        .disp = { 4 + 16 - MMAP_ADDR, 4 + 16 },
     },
 };
 #endif
@@ -1361,6 +1417,7 @@ int main(int argc, char **argv)
         const char *vendor = cp.x86_vendor == X86_VENDOR_INTEL ? "Intel" : "AMD";
         uint64_t *stk = (void *)res + MMAP_SZ - 16;
 
+        regs.rcx = 2;
         for ( i = 0; i < ARRAY_SIZE(vendor_tests); ++i )
         {
             printf("%-*s",
@@ -1370,6 +1427,7 @@ int main(int argc, char **argv)
             regs.eflags = EFLAGS_ALWAYS_SET;
             regs.rip    = (unsigned long)instr;
             regs.rsp    = (unsigned long)stk;
+            regs.rcx   |= 0x8765432100000000UL;
             stk[0]      = regs.rip + STKVAL_DISP;
             rc = x86_emulate(&ctxt, &emulops);
             if ( (rc != X86EMUL_OKAY) ||
@@ -1379,6 +1437,16 @@ int main(int argc, char **argv)
                                ?: vendor_tests[i].opc_len[v])) ||
                  (regs.rsp != (unsigned long)stk + vendor_tests[i].stkoff[v]) )
                 goto fail;
+            /* For now only call insns push something onto the stack. */
+            if ( regs.rsp < (unsigned long)stk )
+            {
+                unsigned long opc_end = (unsigned long)instr +
+                                        vendor_tests[i].opc_len[v];
+
+                if ( memcmp(&opc_end, (void *)regs.rsp,
+                            min((unsigned long)stk - regs.rsp, 8UL)) )
+                    goto fail;
+            }
             printf("okay\n");
         }
 
--- a/xen/arch/x86/x86_emulate/x86_emulate.c
+++ b/xen/arch/x86/x86_emulate/x86_emulate.c
@@ -1273,7 +1273,7 @@ do {
 #define jmp_rel(rel)                                                    \
 do {                                                                    \
     unsigned long ip = _regs.r(ip) + (int)(rel);                        \
-    if ( op_bytes == 2 )                                                \
+    if ( op_bytes == 2 && (amd_like(ctxt) || !mode_64bit()) )           \
         ip = (uint16_t)ip;                                              \
     else if ( !mode_64bit() )                                           \
         ip = (uint32_t)ip;                                              \
@@ -3392,7 +3392,13 @@ x86_decode(
 
     case SrcImm:
         if ( !(d & ByteOp) )
+        {
+            if ( mode_64bit() && !amd_like(ctxt) &&
+                 ((ext == ext_none && (b | 1) == 0xe9) /* call / jmp */ ||
+                  (ext == ext_0f && (b | 0xf) == 0x8f) /* jcc */ ) )
+                op_bytes = 4;
             bytes = op_bytes != 8 ? op_bytes : 4;
+        }
         else
         {
     case SrcImmByte:

