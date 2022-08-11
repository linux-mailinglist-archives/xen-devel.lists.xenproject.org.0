Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 32B2159072C
	for <lists+xen-devel@lfdr.de>; Thu, 11 Aug 2022 22:00:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.385156.620701 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oMELF-0002Mi-4W; Thu, 11 Aug 2022 19:59:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 385156.620701; Thu, 11 Aug 2022 19:59:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oMELF-0002Jp-1D; Thu, 11 Aug 2022 19:59:41 +0000
Received: by outflank-mailman (input) for mailman id 385156;
 Thu, 11 Aug 2022 19:59:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3/DV=YP=citrix.com=prvs=21511e084=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1oMELD-00024H-HD
 for xen-devel@lists.xenproject.org; Thu, 11 Aug 2022 19:59:39 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 203b5a88-19b0-11ed-bd2e-47488cf2e6aa;
 Thu, 11 Aug 2022 21:59:38 +0200 (CEST)
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
X-Inumbo-ID: 203b5a88-19b0-11ed-bd2e-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1660247978;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=S+Ld7c+dRiGE87K3GbtMdBGXMnjEkY04FCI3h90/+zM=;
  b=SM/YKZRhlcoBzU4/cBY6ghhU6qBIeliDFmF1Y9CLc8bd+vMXEc4mk+FJ
   KOBhQsDymh5FgxStXwcveqtJmhS4FJRvrqycjQmh9Qc8zMh9rBCMINstU
   BF0nBPD+OA4XE7K9PsX6qsnDQ9oJ/4oQeU9aXqPbi2YvuWo5VB4W5KMJX
   w=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 2.7
X-MesageID: 77664067
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:9eRJ26qyzFAvQcwhfiU2OyeLqi9eBmJ2ZRIvgKrLsJaIsI4StFCzt
 garIBnUMv+Pa2WmfYx1YIzipE8Cv5CHydNlTVds+yhjF35Ap5uZCYyVIHmrMnLJJKUvbq7GA
 +byyDXkBJppJpMJjk71atANlVEliefSAOKU5NfsYkhZXRVjRDoqlSVtkus4hp8AqdWiCkaGt
 MiaT/f3YTdJ4BYpdDNPg06/gEk35q6q6GpB5gZWic1j5zcyqVFEVPrzGonpR5fIatE8NvK3Q
 e/F0Ia48gvxl/v6Ior4+lpTWhRiro/6ZWBiuFIPM0SRqkEqShgJ+rQ6LJIhhXJ/0F1lqTzTJ
 OJl7vRcQS9xVkHFdX90vxNwS0mSNoUekFPLzOTWXWV+ACQqflO1q8iCAn3aMqUi+P5wIkB21
 sADE20SST2RqL6Zx7+CH7wEasQLdKEHPasas3BkizrYEewnUdbIRKCiCd1whWlqwJoURLCHO
 pRfOWEHgBfoOnWjPn8+Dp4kkfjurX74azBC83qepLYt4niVxwt0uFToGIWKJILWHZsK9qqej
 kDn0liiKUoKDfyexwah4nicn8nWgQquDer+E5Xnr6U30TV/3Fc7Fxk+RVa95/6jhSaWefhSN
 kgV8SoGtrUp+QqgSdyVdw21pjuIswARX/JUEvYm80edx6zM+QGbC2MYCDlbZ7QbWNQeHGJwk
 AXTxpWwWGIp4Ob9pW+hGqm8lzGqPgs0FUw+fhRZUiwo8fa/j4Y+t0eaJjp8K5JZnuEZCBmpn
 W7S9Hlh3uxN5SIY//7lpA6a2lpAsrCMF1dovVuPAwpJ+ysjPOaYi5qUBU83BBqqBKKQVRG/s
 XcNgKByB8heXMjWxERhrAjgdYxFBspp0xWG2DaD57F7q1yQF4eLJOi8Gg1WKkZzKdojcjT0e
 kLVsg45zMYNYiPzMPEqM9juW51CIU3c+TPNCJjpgidmOMAtJGdrAgk3DaJv44wduBd1yvxuU
 XtqWc2tEWwbGcxa8dZCfM9EiOdD7n1vmgvuqWXTlUvPPUy2OCHIEt/o8TKmMogE0U9ziF+Fr
 o8AbZvVkEg3vS+XSnC/zLP/5GsidRATba0aYeQNHgJfCmKKwF0cNsI=
IronPort-HdrOrdr: A9a23:rBmlYKigC92mcrvkZ9POMzXn2HBQXuIji2hC6mlwRA09TySZ//
 rBoB19726MtN9xYgBHpTnuAsm9qB/nmaKdpLNhWItKPzOW31dATrsSjrcKqgeIc0aVm9K1l5
 0QF5SWYOeAdWSS5vya3ODXKbkdKaG8gcKVuds=
X-IronPort-AV: E=Sophos;i="5.93,230,1654574400"; 
   d="scan'208";a="77664067"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH 2/2] x86/svm: Keep the RAS balanced for guests
Date: Thu, 11 Aug 2022 20:59:05 +0100
Message-ID: <20220811195905.7780-3-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20220811195905.7780-1-andrew.cooper3@citrix.com>
References: <20220811195905.7780-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

One source of lost performance was that fact that to protect Xen from a
malicious guests, we had to flush the RAS.

It turns out that CET Shadow Stacks give us enough architectural guarantees to
construct a lower overhead mitigation, which keeps the RAS balanced for the
guest so their return performance is still good.

To keep the RAS balanced, Xen must execute the same number of CALLs as RETs
across one VMexit->VMEntry.  Without CET-SS, we could achieve this fairly
easily with a `call; add $8, %rsp` and `push; ret` pair, but this is not legal
under CET-SS.  In fact, CALL is the only shadow stack "push" operation we
have, and we can't use it a second time if we intend to keep the RAS balanced.

Instead, we keep a real return address on the stack.  This means that for some
of entry.S, %rsp conditionally doesn't reference CPUINFO.

This necessitates swapping the current order of DO_OVERWRITE_RSB and
svm_vmexit_spec_ctrl; while they don't have any specific ordering
requirements, push_one_ras needs to come after svm_vmexit_spec_ctrl or else we
need some very invasive changes to fix up the %rsp changes.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>

RFC for a couple of reasons.  This does function correctly, but I still want
to do more perf testing.

Secondly, X86_FEATURE_ALWAYS is clearly not ok for committing.  I'm still
debating whether to make this construct available in !CET-SS cases.
Mechanically, its fine, but the safety arguments depend on CET-SS being
active.

In principle, on CPUs which do not suffer Branch Type Confusion, you might be
able to reason a defence-in-depth argument that if an attacker can't control
indirect speculation, then they can't bypass the 1-stuff safety either, but
the only AMD CPUs not vulnerable to BTC have CET-SS anyway.

Third, I'd like some early feedback on how clear it the logic is given the
conditional nature of %rsp not referencing CPUINFO.

Fourth, the alternatives logic (I think) needs improving to not fix up a
direct CALL/JMP displacement if the destination is within the replacement
length.  I did the functional testing before wrapping things in alternatives.
---
 xen/arch/x86/hvm/svm/entry.S | 55 ++++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 53 insertions(+), 2 deletions(-)

diff --git a/xen/arch/x86/hvm/svm/entry.S b/xen/arch/x86/hvm/svm/entry.S
index be4ce52bd81d..98934db41fec 100644
--- a/xen/arch/x86/hvm/svm/entry.S
+++ b/xen/arch/x86/hvm/svm/entry.S
@@ -22,8 +22,41 @@
 #include <asm/asm_defns.h>
 #include <asm/page.h>
 
+.macro push_one_ras
+        /*
+         * Pushes one entry into the RAS, then updates the return address(es)
+         * to point at svm_ras_speculation_trap.
+         *
+         * Rogue RAS-speculation will hit the INT3 and stop.  Architectural
+         * execution will go to svm_ras_speculation_trap.
+         *
+         * This deliberately leaves the (modified) return address on the
+         * stack(s).
+         */
+        call 1f
+        int3
+1:
+        lea     svm_ras_speculation_trap(%rip), %rax
+
+#ifdef CONFIG_XEN_SHSTK
+        rdsspq  %rcx
+        wrssq   %rax, (%rcx)
+#endif
+        mov     %rax, (%rsp)
+.endm
+
 ENTRY(svm_asm_do_resume)
         GET_CURRENT(bx)
+
+        /*
+         * We've just been schedule()'d.  There's no speculation safety needed
+         * here, but we do need to set the stack up in the manner expected by
+         * later logic.
+         */
+        ALTERNATIVE "", push_one_ras, X86_FEATURE_ALWAYS
+
+        /* WARNING!  After this point, %rsp /may/ not reference cpu_info. */
+
 .Lsvm_do_resume:
         call svm_intr_assist
         call nsvm_vcpu_switch
@@ -56,6 +89,20 @@ __UNLIKELY_END(nsvm_hap)
         clgi
 
         /* WARNING! `ret`, `call *`, `jmp *` not safe beyond this point. */
+        /* WARNING!  Before this point, %rsp /may/ not reference cpu_info. */
+
+        /*
+         * If we're trying to balance the RAS for guests, push_one_ras in the
+         * VMExit path was necessary for speculative safety, but the on-stack
+         * return address was deliberately updated to point here.
+         *
+         * We execute one RET to re-balance the RAS.  It will mispredict (to
+         * the INT3 in push_one_ras in the general case), but won't
+         * architecturally change the instruction flow.
+         */
+        ALTERNATIVE "", ret, X86_FEATURE_ALWAYS
+svm_ras_speculation_trap:
+
         /* SPEC_CTRL_EXIT_TO_SVM       Req: b=curr %rsp=regs/cpuinfo, Clob: acd */
         .macro svm_vmentry_spec_ctrl
             mov    VCPU_arch_msrs(%rbx), %rax
@@ -108,8 +155,6 @@ __UNLIKELY_END(nsvm_hap)
 	.endm
         ALTERNATIVE "", svm_vmexit_cond_ibpb, X86_FEATURE_IBPB_ENTRY_HVM
 
-        ALTERNATIVE "", DO_OVERWRITE_RSB, X86_FEATURE_SC_RSB_HVM
-
         .macro svm_vmexit_spec_ctrl
             movzbl CPUINFO_xen_spec_ctrl(%rsp), %eax
             movzbl CPUINFO_last_spec_ctrl(%rsp), %edx
@@ -122,6 +167,12 @@ __UNLIKELY_END(nsvm_hap)
 1:
         .endm
         ALTERNATIVE "", svm_vmexit_spec_ctrl, X86_FEATURE_SC_MSR_HVM
+
+        ALTERNATIVE_2 "", \
+             DO_OVERWRITE_RSB, X86_FEATURE_SC_RSB_HVM,  \
+             push_one_ras, X86_FEATURE_ALWAYS
+
+        /* WARNING!  After this point, %rsp /may/ not reference cpu_info. */
         /* WARNING! `ret`, `call *`, `jmp *` not safe before this point. */
 
         /*
-- 
2.11.0


