Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 946D8191661
	for <lists+xen-devel@lfdr.de>; Tue, 24 Mar 2020 17:28:30 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jGmNy-00035B-DS; Tue, 24 Mar 2020 16:26:38 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Lmgi=5J=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jGmNx-000353-BE
 for xen-devel@lists.xenproject.org; Tue, 24 Mar 2020 16:26:37 +0000
X-Inumbo-ID: 3b157d96-6dec-11ea-bec1-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3b157d96-6dec-11ea-bec1-bc764e2007e4;
 Tue, 24 Mar 2020 16:26:36 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 78D97AC4A;
 Tue, 24 Mar 2020 16:26:35 +0000 (UTC)
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <cfeb8fcf-3ba6-674c-17a9-93be9e746930@suse.com>
Message-ID: <8a51dc9e-851a-4d6d-aa04-aa660ae122a9@suse.com>
Date: Tue, 24 Mar 2020 17:26:34 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <cfeb8fcf-3ba6-674c-17a9-93be9e746930@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Subject: [Xen-devel] [PATCH 2/7] x86emul: vendor specific near RET behavior
 in 64-bit mode
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
@@ -733,6 +733,34 @@ static struct x86_emulate_ops emulops =
 #define EFLAGS_ALWAYS_SET (X86_EFLAGS_IF | X86_EFLAGS_MBS)
 #define EFLAGS_MASK (X86_EFLAGS_ARITH_MASK | EFLAGS_ALWAYS_SET)
 
+#define MMAP_ADDR 0x100000
+
+#ifdef __x86_64__
+# define STKVAL_DISP 64
+static const struct {
+    const char *descr;
+    uint8_t opcode[8];
+    /* Index 0: AMD, index 1: Intel. */
+    uint8_t opc_len[2];
+    int8_t stkoff[2];
+    int32_t disp[2];
+} vendor_tests[] = {
+    {
+        .descr = "retw",
+        .opcode = { 0x66, 0xc3 },
+        .opc_len = { 2, 2 },
+        .stkoff = { 2, 8 },
+        .disp = { STKVAL_DISP - MMAP_ADDR, STKVAL_DISP },
+    }, {
+        .descr = "retw $16",
+        .opcode = { 0x66, 0xc2, 0x10, 0x00 },
+        .opc_len = { 4, 4 },
+        .stkoff = { 2 + 16, 8 + 16 },
+        .disp = { STKVAL_DISP - MMAP_ADDR, STKVAL_DISP },
+    },
+};
+#endif
+
 int main(int argc, char **argv)
 {
     struct x86_emulate_ctxt ctxt;
@@ -741,7 +769,9 @@ int main(int argc, char **argv)
     unsigned int *res, i, j;
     bool stack_exec;
     int rc;
-#ifndef __x86_64__
+#ifdef __x86_64__
+    unsigned int vendor_native;
+#else
     unsigned int bcdres_native, bcdres_emul;
 #endif
 
@@ -755,7 +785,7 @@ int main(int argc, char **argv)
     ctxt.addr_size = 8 * sizeof(void *);
     ctxt.sp_size   = 8 * sizeof(void *);
 
-    res = mmap((void *)0x100000, MMAP_SZ, PROT_READ|PROT_WRITE|PROT_EXEC,
+    res = mmap((void *)MMAP_ADDR, MMAP_SZ, PROT_READ|PROT_WRITE|PROT_EXEC,
                MAP_FIXED|MAP_PRIVATE|MAP_ANONYMOUS, 0, 0);
     if ( res == MAP_FAILED )
     {
@@ -1323,7 +1353,41 @@ int main(int argc, char **argv)
          (regs.eip != (unsigned long)&instr[3]) )
         goto fail;
     printf("okay\n");
-#endif
+
+    vendor_native = cp.x86_vendor;
+    for ( cp.x86_vendor = X86_VENDOR_AMD; ; )
+    {
+        unsigned int v = cp.x86_vendor == X86_VENDOR_INTEL;
+        const char *vendor = cp.x86_vendor == X86_VENDOR_INTEL ? "Intel" : "AMD";
+        uint64_t *stk = (void *)res + MMAP_SZ - 16;
+
+        for ( i = 0; i < ARRAY_SIZE(vendor_tests); ++i )
+        {
+            printf("%-*s",
+                   40 - printf("Testing %s [%s]", vendor_tests[i].descr, vendor),
+                   "...");
+            memcpy(instr, vendor_tests[i].opcode, vendor_tests[i].opc_len[v]);
+            regs.eflags = EFLAGS_ALWAYS_SET;
+            regs.rip    = (unsigned long)instr;
+            regs.rsp    = (unsigned long)stk;
+            stk[0]      = regs.rip + STKVAL_DISP;
+            rc = x86_emulate(&ctxt, &emulops);
+            if ( (rc != X86EMUL_OKAY) ||
+                 (regs.eflags != EFLAGS_ALWAYS_SET) ||
+                 (regs.rip != (unsigned long)instr +
+                              (vendor_tests[i].disp[v]
+                               ?: vendor_tests[i].opc_len[v])) ||
+                 (regs.rsp != (unsigned long)stk + vendor_tests[i].stkoff[v]) )
+                goto fail;
+            printf("okay\n");
+        }
+
+        if ( cp.x86_vendor == X86_VENDOR_INTEL )
+            break;
+        cp.x86_vendor = X86_VENDOR_INTEL;
+    }
+    cp.x86_vendor = vendor_native;
+#endif /* x86-64 */
 
     printf("%-40s", "Testing shld $1,%ecx,(%edx)...");
     res[0]      = 0x12345678;
--- a/xen/arch/x86/x86_emulate/x86_emulate.c
+++ b/xen/arch/x86/x86_emulate/x86_emulate.c
@@ -4611,7 +4611,8 @@ x86_emulate(
 
     case 0xc2: /* ret imm16 (near) */
     case 0xc3: /* ret (near) */
-        op_bytes = ((op_bytes == 4) && mode_64bit()) ? 8 : op_bytes;
+        op_bytes = (op_bytes == 4 || !amd_like(ctxt)) && mode_64bit()
+                   ? 8 : op_bytes;
         if ( (rc = read_ulong(x86_seg_ss, sp_post_inc(op_bytes + src.val),
                               &dst.val, op_bytes, ctxt, ops)) != 0 ||
              (rc = ops->insn_fetch(x86_seg_cs, dst.val, NULL, 0, ctxt)) )


