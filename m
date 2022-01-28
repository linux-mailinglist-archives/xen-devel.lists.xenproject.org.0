Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 06D7D49FAAD
	for <lists+xen-devel@lfdr.de>; Fri, 28 Jan 2022 14:30:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.261996.453971 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nDRK7-0003e0-Bk; Fri, 28 Jan 2022 13:29:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 261996.453971; Fri, 28 Jan 2022 13:29:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nDRK7-0003ag-7z; Fri, 28 Jan 2022 13:29:55 +0000
Received: by outflank-mailman (input) for mailman id 261996;
 Fri, 28 Jan 2022 13:29:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5Vxm=SM=citrix.com=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1nDRK5-0003aP-69
 for xen-devel@lists.xenproject.org; Fri, 28 Jan 2022 13:29:53 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5d225354-803e-11ec-8f75-fffcc8bd4f1a;
 Fri, 28 Jan 2022 14:29:49 +0100 (CET)
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
X-Inumbo-ID: 5d225354-803e-11ec-8f75-fffcc8bd4f1a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1643376589;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=1M4Vs3hW9Vi1gMrvvAtCAVzuVssJwllF6xsNbufR8lA=;
  b=a2ueQnQGDAenJHwjZfr2P/PeKoztuCYStPTMkY3SBboZkGinKTnv89Ef
   jlmz99dvTY2S5pYJa7p3JW/an5qy3c31Gm7Fnx0rinNwB/o1A1bJbqhRo
   KAZp2a7VzPQN+JTQSkcHyAL+GZ0jtAnbJqPlFCB+uyEhC/T+of8cj4Hz1
   8=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: SPPmJcLovjZDcJyCVO+NcGfbD4l7jXxKk+deKFReQce1ZqEVGZMihLxhmskFZHOsq/ZL8q5Ull
 CqRFt7uCFikgYnCBEfNNH3v3kghY664GY3Oa30vRgZDCSGW+eNiztFoRk+he7IAttkRUsc/vHK
 ljENliwGyYNqUVHvSGYrWz9B+mpVQ8XlYta+p/GsG8ebuWC9o60xvY0zx980QlICmV521fxVC4
 ls/lnkrDlls3TIMuktKcO9tpmIZQ/WZ452bwRpv4KF7UDCMPuQ5Ulhz06B1jzt0OqtvOfQfiyg
 muS1jhjx45fJG7FVciFDrxA/
X-SBRS: 5.2
X-MesageID: 62450234
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:2pdZ/K3CtyCFIp8LaPbD5Qd2kn2cJEfYwER7XKvMYLTBsI5bpzVUm
 mYbDGDXPvjcamKkLt12bYqzph9TucTRxoRhHFBtpC1hF35El5HIVI+TRqvS04J+DSFhoGZPt
 Zh2hgzodZhsJpPkS5PE3oHJ9RGQ74nRLlbHILOCanAZqTNMEn9700o6wb5h3uaEvPDia++zk
 YKqyyHgEAfNNw5cagr4PIra9XuDFNyr0N8plgRWicJj5TcypFFMZH4rHomjLmOQf2VhNrXSq
 9Avbl2O1jixEx8FUrtJm1tgG6EAaua60QOm0hK6V0U+6/TrS+NbPqsTbZIhhUlrZzqhhPcy1
 IUK6qyJT1kXboHwo6MfUTJZHHQrVUFG0OevzXmXtMWSywvNcmf2wuUoB0YzVWEa0r8pWycUr
 6VecW1TKEDY7w616OvTpu1Er8IvNsT0eqgYvWlt12rxBvc6W5HTBa7N4Le02R9u3JwTRayFO
 6L1bxJhQCT6WxlVCGw2BZcBkbeO3lzRaSJH/Qf9Sa0fvDGIkV0ZPKLWGMXRUsyHQ4NShEnwj
 kDs8nn9AxoaHMeC0jfD+XWp7sffkCW+VI8MGbmQ8v9xnEbV1mEVEAcRV1awvb++kEHWZj5EA
 xVKoGx09/F0rRH1CImmN/GlnJKalgU7GMYAVLIK0QfT9Pr43z3eBGovTzEUPbTKq/QKbTAt0
 1aImfbgCjpurKCZRBqhy1uEkd+hEXNLdDFfPEfoWSNAuoC++99r0nojW/4+SPbdszHjJd3nL
 9lmRgAajq5bs8ME3r7TEbvv02P1/cihouLYC2zqsoOZAuFROdbNi2+AswGzARN8wGCxFATpU
 J8swJD20Qz2JcvR/BFhuc1UdF1T296LMSfHnXlkFIQ7+jKm9haLJN4Mu2slfBw3b55ZKFcFh
 XM/XysLuve/21PxNcdKj3+ZUZx2ncAM6/y7PhwrUja+SscoL1LWlM2fTUWRw3rsgCARfVIXY
 v+mnTKXJS9CU8xPlWPuL89EiOND7n1gmQv7GM6qpzz6gev2TCPEEt8tbQrRBt3VGYvZ+m05B
 f4FaZvTo/ieOcWjChTqHXk7dABTciNjVMmo8qS6tIere2JbJY3oMNeJqZtJRmCvt/49ej7g8
 i7vV0lG5kD4gHGbewyGZmo6MOHkXIplrGJ9NispZA76138maIepzaEea5poIuV3qL09laZ5H
 6sfZsGNIvVTUTCbqT4TWobw8d55fxOxiAPQYyf8OGojf4RtThDi88P/ele97zEHCye67JNso
 7Cp2g7Bb4AEQgBuUJTfZP61lgvjtnkBguNiGUDPJ4ALKknr9YFrLQ33j+M2fJ5QeUmSmGPC2
 l/PUxkCpOTLr4sky/XzhPiJ/9WzDu9zPktGBG2Hv7y4AjbXozi4yohaXefWIT2EDDHo+L+vb
 Pl+xu3nNKFVh05DtodxHuo5za864Nez9bZWwh49QSfOZlWvTLhhPmOHzY9EsagUnu1Vvg6/W
 0Su/NhGOOrWZJO5QQBJfAd1PP6e0fw0myXJ6aVnKUr30yZ74b6bXBgAJBKLkiFccON4PY5NL
 T3NYyLKB9hTUiYXD+s=
IronPort-HdrOrdr: A9a23:w/Nat6+LrB+eLhKykcZuk+GVdr1zdoMgy1knxilNoENuHfBwxv
 rDoB1E73LJYW4qKQsdcKO7SdS9qBLnhNRICOwqU4tKMzOW3ldAQLsSjrcKhgeQYBEWldQtmJ
 uIEZIOceEYZGIS5a2RgWmF+pQbsaG6GcuT9ILjJgJWPGZXgtZbnmNE42igYy9LbTgDIaB8OI
 uX58JBqTblU28QdN6HCn4MWPWGj8HXlbr9CCR2SCIP2U2rt3eF+bT6Gx+X0lM1SDVU24ov9m
 DDjkjQ+rijifem0RXRvlWjoai+2eGRi+erNvb8yfT9GQ+cyDpAo74RHoFqiQpF4N1HLmxa1O
 Uk7S1QePiboEmhAl1d6SGdpDUIlgxep0PK+Bugmn3krtX+RDUmT+R8pa8xSGqe12MQ+Ohm1q
 RFxmSYsIcSKyjhsmDS2/jkPisaz3ZdhxIZ4LUuZrhkINMjQa4UoooF8ExPFpAcWCr89YA8Ce
 FrSNrR/fBMbDqhHjnkV0RUsauRt04Ib2G7q4k5y7+o+ikTmGo8w1oTxcQZkHtF/JUhS4Nc7+
 CBNqhzjrlBQsIfcKo4XY46MICKI32IRQiJPHOZIFzhGq1CM3XRq4Tv6LFw4O2xYpQHwJY7hZ
 yEWlJFsmw5fV7oFKS1rdV22wGIRH/4USXmy8lY6ZQ8srrgRKDzOSnGU1wqm9vImYRqPiQaYY
 fHBHt7OY6TEYLeI/c64+SlYegtFZA3arxkhuoG
X-IronPort-AV: E=Sophos;i="5.88,324,1635220800"; 
   d="scan'208";a="62450234"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH v2 7/9] x86/svm: VMEntry/Exit logic for MSR_SPEC_CTRL
Date: Fri, 28 Jan 2022 13:29:25 +0000
Message-ID: <20220128132927.14997-8-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20220128132927.14997-1-andrew.cooper3@citrix.com>
References: <20220128132927.14997-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Hardware maintains both host and guest versions of MSR_SPEC_CTRL, but guests
run with the logical OR of both values.  Therefore, in principle we want to
clear Xen's value before entering the guest.  However, for migration
compatibility, and for performance reasons with SEV-SNP guests, we want the
ability to use a nonzero value behind the guest's back.  Use vcpu_msrs to hold
this value, with the guest value in the VMCB.

On the VMEntry path, adjusting MSR_SPEC_CTRL must be done after CLGI so as to
be atomic with respect to NMIs/etc.  The loading of spec_ctrl_raw into %eax
was also stale from the unused old code, so can be dropped too.

Implement both pieces of logic as small pieces of C, and alternative the call
to get there based on X86_FEATURE_SC_MSR_HVM.  The use of double alternative
blocks is due to a quirk of the current infrastructure, where call
displacements only get fixed up for the first replacement instruction.  While
adjusting the clobber lists, drop the stale requirements on the VMExit side.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>

The RAS[:32] flushing side effect is under reconsideration.  It is actually a
very awkward side effect in practice, and not applicable to any
implementations (that I'm aware of), but for now, it's the documented safe
action to take.  Furthermore, it avoids complicating the logic with an lfence
in the else case for Spectre v1 safety.

v2:
 * Split last_spec_ctrl introduction into earlier patch.
 * Use STR() rather than __stringify() for brevity.
 * Use double alt blocks in order to pass function parameters.
---
 xen/arch/x86/hvm/svm/entry.S             | 12 +++++++-----
 xen/arch/x86/hvm/svm/svm.c               | 27 +++++++++++++++++++++++++++
 xen/arch/x86/include/asm/msr.h           |  9 +++++++++
 xen/arch/x86/include/asm/spec_ctrl_asm.h |  3 +++
 4 files changed, 46 insertions(+), 5 deletions(-)

diff --git a/xen/arch/x86/hvm/svm/entry.S b/xen/arch/x86/hvm/svm/entry.S
index 276215d36aff..190f7095c65c 100644
--- a/xen/arch/x86/hvm/svm/entry.S
+++ b/xen/arch/x86/hvm/svm/entry.S
@@ -55,11 +55,12 @@ __UNLIKELY_END(nsvm_hap)
         mov  %rsp, %rdi
         call svm_vmenter_helper
 
-        mov VCPU_arch_msrs(%rbx), %rax
-        mov VCPUMSR_spec_ctrl_raw(%rax), %eax
+        clgi
 
         /* WARNING! `ret`, `call *`, `jmp *` not safe beyond this point. */
-        /* SPEC_CTRL_EXIT_TO_SVM   (nothing currently) */
+        /* SPEC_CTRL_EXIT_TO_SVM       Req:                           Clob: C   */
+        ALTERNATIVE "", STR(mov %rbx, %rdi; mov %rsp, %rsi), X86_FEATURE_SC_MSR_HVM
+        ALTERNATIVE "", STR(call vmentry_spec_ctrl), X86_FEATURE_SC_MSR_HVM
 
         pop  %r15
         pop  %r14
@@ -78,7 +79,6 @@ __UNLIKELY_END(nsvm_hap)
         pop  %rsi
         pop  %rdi
 
-        clgi
         sti
         vmrun
 
@@ -86,8 +86,10 @@ __UNLIKELY_END(nsvm_hap)
 
         GET_CURRENT(bx)
 
-        /* SPEC_CTRL_ENTRY_FROM_SVM    Req: b=curr %rsp=regs/cpuinfo, Clob: ac  */
+        /* SPEC_CTRL_ENTRY_FROM_SVM    Req:                           Clob: C   */
         ALTERNATIVE "", DO_OVERWRITE_RSB, X86_FEATURE_SC_RSB_HVM
+        ALTERNATIVE "", STR(mov %rsp, %rdi), X86_FEATURE_SC_MSR_HVM
+        ALTERNATIVE "", STR(call vmexit_spec_ctrl), X86_FEATURE_SC_MSR_HVM
         /* WARNING! `ret`, `call *`, `jmp *` not safe before this point. */
 
         stgi
diff --git a/xen/arch/x86/hvm/svm/svm.c b/xen/arch/x86/hvm/svm/svm.c
index bb6b8e560a9f..f753bf48c252 100644
--- a/xen/arch/x86/hvm/svm/svm.c
+++ b/xen/arch/x86/hvm/svm/svm.c
@@ -3086,6 +3086,33 @@ void svm_vmexit_handler(struct cpu_user_regs *regs)
     vmcb_set_vintr(vmcb, intr);
 }
 
+/* Called with GIF=0. */
+void vmexit_spec_ctrl(struct cpu_info *info)
+{
+    unsigned int val = info->xen_spec_ctrl;
+
+    /*
+     * Write to MSR_SPEC_CTRL unconditionally, for the RAS[:32] flushing side
+     * effect.
+     */
+    wrmsr(MSR_SPEC_CTRL, val, 0);
+    info->last_spec_ctrl = val;
+}
+
+/* Called with GIF=0. */
+void vmentry_spec_ctrl(const struct vcpu *curr, struct cpu_info *info)
+{
+    unsigned int val = curr->arch.msrs->spec_ctrl.raw;
+
+    if ( val != info->last_spec_ctrl )
+    {
+        wrmsr(MSR_SPEC_CTRL, val, 0);
+        info->last_spec_ctrl = val;
+    }
+
+    /* No Spectre v1 concerns.  Execution is going to hit VMRUN imminently. */
+}
+
 /*
  * Local variables:
  * mode: C
diff --git a/xen/arch/x86/include/asm/msr.h b/xen/arch/x86/include/asm/msr.h
index 657a3295613d..ce4fe51afe54 100644
--- a/xen/arch/x86/include/asm/msr.h
+++ b/xen/arch/x86/include/asm/msr.h
@@ -297,6 +297,15 @@ struct vcpu_msrs
      *
      * For VT-x guests, the guest value is held in the MSR guest load/save
      * list.
+     *
+     * For SVM, the guest value lives in the VMCB, and hardware saves/restores
+     * the host value automatically.  However, guests run with the OR of the
+     * host and guest value, which allows Xen to set protections behind the
+     * guest's back.
+     *
+     * We must clear/restore Xen's value before/after VMRUN to avoid unduly
+     * influencing the guest.  In order to support "behind the guest's back"
+     * protections, we load this value (commonly 0) before VMRUN.
      */
     struct {
         uint32_t raw;
diff --git a/xen/arch/x86/include/asm/spec_ctrl_asm.h b/xen/arch/x86/include/asm/spec_ctrl_asm.h
index 9c0c7622c41f..02b3b18ce69f 100644
--- a/xen/arch/x86/include/asm/spec_ctrl_asm.h
+++ b/xen/arch/x86/include/asm/spec_ctrl_asm.h
@@ -46,6 +46,9 @@
  *   - On VMX by using MSR load/save lists to have vmentry/exit atomically
  *     load/save the guest value.  Xen's value is loaded in regular code, and
  *     there is no need to use the shadow logic (below).
+ *   - On SVM by altering MSR_SPEC_CTRL inside the CLGI/STGI region.  This
+ *     makes the changes atomic with respect to NMIs/etc, so no need for
+ *     shadowing logic.
  *
  * Factor 2 is harder.  We maintain a shadow_spec_ctrl value, and a use_shadow
  * boolean in the per cpu spec_ctrl_flags.  The synchronous use is:
-- 
2.11.0


