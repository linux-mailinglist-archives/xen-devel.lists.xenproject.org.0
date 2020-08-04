Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9537123B7DF
	for <lists+xen-devel@lfdr.de>; Tue,  4 Aug 2020 11:37:28 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k2tNP-0002tk-Ak; Tue, 04 Aug 2020 09:36:55 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=xzDE=BO=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1k2tNO-0002tf-4o
 for xen-devel@lists.xenproject.org; Tue, 04 Aug 2020 09:36:54 +0000
X-Inumbo-ID: 78c85921-196b-437d-9fb0-e18aee3bf853
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 78c85921-196b-437d-9fb0-e18aee3bf853;
 Tue, 04 Aug 2020 09:36:52 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id AAF9BAB55;
 Tue,  4 Aug 2020 09:37:07 +0000 (UTC)
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] x86emul: further FPU env testing relaxation for AMD-like CPUs
Message-ID: <b2667393-0196-30de-86e9-b7a6145ed03d@suse.com>
Date: Tue, 4 Aug 2020 11:36:51 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
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
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

See the code comment that's being extended. Additionally a few more
zap_fpsel() invocations are needed - whenever we stored state after
there potentially having been a context switch behind our backs.

Reported-by: Andrew Cooper <andrew.cooper3@citrix.com>
Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/tools/tests/x86_emulator/test_x86_emulator.c
+++ b/tools/tests/x86_emulator/test_x86_emulator.c
@@ -752,6 +752,13 @@ static struct x86_emulate_ops emulops =
  * 64-bit OSes may not (be able to) properly restore the two selectors in
  * the FPU environment. Zap them so that memcmp() on two saved images will
  * work regardless of whether a context switch occurred in the middle.
+ *
+ * Additionally on AMD-like CPUs FDP/FIP/FOP may get lost across context
+ * switches, when there's no unmasked pending FP exception: With
+ * CPUID[80000008].EBX[2] clear, the fields don't get written/read by
+ * {F,}XSAVE / {F,}XRSTOR, which OSes often compensate for by invoking an
+ * insn forcing the fields to gain a deterministic value. Whereas with said
+ * bit set, zeroes will get written (and hence later restored).
  */
 static void zap_fpsel(unsigned int *env, bool is_32bit)
 {
@@ -765,6 +772,21 @@ static void zap_fpsel(unsigned int *env,
         env[2] &= ~0xffff;
         env[3] &= ~0xffff;
     }
+
+    if ( cp.x86_vendor != X86_VENDOR_AMD && cp.x86_vendor != X86_VENDOR_HYGON )
+        return;
+
+    if ( is_32bit )
+    {
+        env[3] = 0;
+        env[4] = 0;
+        env[5] = 0;
+    }
+    else
+    {
+        env[1] &= 0xffff;
+        env[2] = 0;
+    }
 }
 
 static void zap_xfpsel(unsigned int *env)
@@ -2460,6 +2482,7 @@ int main(int argc, char **argv)
         regs.edx = (unsigned long)res;
         rc = x86_emulate(&ctxt, &emulops);
         asm volatile ( "fnstenv %0" : "=m" (res[9]) :: "memory" );
+        zap_fpsel(&res[9], true);
         if ( (rc != X86EMUL_OKAY) ||
              memcmp(res + 2, res + 9, 28) ||
              (regs.eip != (unsigned long)&instr[3]) )
@@ -2487,6 +2510,7 @@ int main(int argc, char **argv)
         res[23] = 0xaa55aa55;
         res[24] = 0xaa55aa55;
         rc = x86_emulate(&ctxt, &emulops);
+        zap_fpsel(&res[0], false);
         if ( (rc != X86EMUL_OKAY) ||
              memcmp(res, res + 25, 94) ||
              (res[23] >> 16) != 0xaa55 ||
@@ -2514,6 +2538,7 @@ int main(int argc, char **argv)
         regs.edx = (unsigned long)res;
         rc = x86_emulate(&ctxt, &emulops);
         asm volatile ( "fnsave %0" : "=m" (res[27]) :: "memory" );
+        zap_fpsel(&res[27], true);
         if ( (rc != X86EMUL_OKAY) ||
              memcmp(res, res + 27, 108) ||
              (regs.eip != (unsigned long)&instr[2]) )

