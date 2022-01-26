Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 278C549C578
	for <lists+xen-devel@lfdr.de>; Wed, 26 Jan 2022 09:45:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.260720.450717 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nCdva-0001Qm-FM; Wed, 26 Jan 2022 08:45:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 260720.450717; Wed, 26 Jan 2022 08:45:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nCdva-0001Ig-26; Wed, 26 Jan 2022 08:45:18 +0000
Received: by outflank-mailman (input) for mailman id 260720;
 Wed, 26 Jan 2022 08:45:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=DU/T=SK=citrix.com=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1nCdvY-000088-BB
 for xen-devel@lists.xenproject.org; Wed, 26 Jan 2022 08:45:16 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 46ddab12-7e84-11ec-8eb8-a37418f5ba1a;
 Wed, 26 Jan 2022 09:45:15 +0100 (CET)
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
X-Inumbo-ID: 46ddab12-7e84-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1643186714;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=xYPDOEJsWTv8UVjw+JmeU6EN0dJyp6kBoyRZZnSKQ+A=;
  b=TwsqN/5uCwxSs9ooiGRJuuXUPMmiVtNhbJ5kPIoGdKkrzcqbQlSeLrd4
   O2Ox76EuY7Q3oe4EEoVzQomf1dQgx+VQQQLlH1draA5IIrl6dsRVEgpjv
   6lUktfFvz3OrDPyTi8kUc2F22ZcqZCW7m+Jvo1h7pWRmlFUTvykL+4cIW
   M=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: ROLri6rS4OJJYbNdG941fccXfNQe2DtBOYU3AND835mylKMW2gcV18w6N/ctDnKHIj2gS1Q0nK
 iiG93WVMrR2rwnctb+LEN0ypDAtGWySf1QSN415qDvmng30KluBUSpZyMewH4bPKoJ9PHH8Y8/
 kWnTnWLnWI+NnrDRduVoHTbK24dCL96mYh10xffl/e6FB6sBUTHzGsyQRA+sfjffUj5vb9zTFD
 4+WbPBi/nCl+vKTqwaGZdLvqyGwxDOAm/gYqNp7WosSdB5cQ6JaS5poGmwwR7eTsR4xrQtdh8R
 G5QsxgduEL0Iruw2Kt2t3HEC
X-SBRS: 5.2
X-MesageID: 62781563
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:aYfH8qhg8bt8pbxg9gtxNFMyX161tBcKZh0ujC45NGQN5FlHY01je
 htvWT+AaP3cMGSmcttxao/n901Xv5TRndNjT1Q4pS9hHnkb9cadCdqndUqhZCn6wu8v7a5EA
 2fyTvGacajYm1eF/k/F3oAMKRCQ7InQLlbGILes1htZGEk0GE/NtTo5w7Rj2tcy34Dga++wk
 YiaT/P3aQfNNwFcagr424rbwP+4lK2v0N+wlgVWicFj5DcypVFMZH4sDfjZw0/DaptVBoaHq
 9Prl9lVyI97EyAFUbtJmp6jGqEDryW70QKm0hK6UID66vROS7BbPg/W+5PwZG8O4whlkeydx
 /0VsseraBw2YZGcmb8tQjUFLAxRBo1JreqvzXiX6aR/zmXDenrohf5vEFs3LcsT/eMf7WNmr
 KJCbmpXN1ba2rzwkOnTpupE36zPKOHCOo8Ft24m5jbeFfs8GrjIQrnQ5M8e1zA17ixLNaiEO
 JpANGQ0BPjGSwBKY2syCIhkoOPyiVD1dy0E+VGbhrVitgA/yyQuieOwYbI5YOeiWsF9jkue4
 GXc8AzRIDsXKdiewjqt6W+3i6nEmiaTcJIfEvi0++BnhHWXx3cPE1sGWF2ju/67h0WiHdVFJ
 CQpFjEG9PZoshbxF5+kAkP+8CXsUgMgt8R4S+ph8yCW1fXoswfCNnkoEwFsR+cGu5pjLdA17
 WOhk9TsDD1plbSaT3OB67uZxQ+P1TgpwXwqPnFdE1ZcizX3iMRq10+UEI4/eEKgpoCtQVnNL
 ya2QD/Sbln5peoCzO2F8F/OmFpATbCZH1dutm07so9Ihz6VhbJJhaT0uDA3Dt4ade51q2VtW
 lBeyqByC8hVVfmweNSlGrllIV1Qz6/t3MfgqVBuBYI90D+m5mSue4tdiBknehsya51ZJ2O1P
 R+M0e+02HO1FCH7BUOQS9npY/nGMIC6TYi1PhwqRocmjmdNmP+vo3g1OB/4M5HFm0kwi6AvU
 ap3gu73ZUv2/Z9PlWLsL89EiOdD7nlnmQv7GM6npzz6j+v2TCPFGN8tbQrVBshkvfzsnekg2
 4sFXyd8408BALSWj+i+2dN7EG3m2lBiVcmp8JQGL7DaSuekcUl4Y8LsLXoaU9QNt8xoei3gp
 xlRg2dUlwjyg2PpMwKPZiwxYb/jR88n/3k6ITYtLRCj3H16OdSj66IWdp0We7g79bM8ka4oH
 qddI8jQUO5STjnn+igGacWvpoJVaxn21xmFODCoYWZjcsc4FRDJ4NLtYiDm6DIKUnisrcI7r
 rD5jlHbTJMPSh5MFsHTbP7znVq9sWJEwLB5XlfSI8kVc0LpqdA4Jyv0h/4xAscNNRScmWfKi
 1fIWU8V/LCfrZU0/d/FgbG/g72oS+YuTFBHG2T77KqtMXWI9GSU3oIdAv2DeirQVT2o9fz6N
 /lV1fz1LNYOgE1O79hnC79uwK8zu4nvqrtdwlg2FXnHdQ32WLZpI33A1shTrKxdgLRevFLuC
 E6I/9BbP5SPOd/kTwFNdFZ0MLzb2KFGgCTW4NQ0PF7+tX1+87ewWElPOwWB1X5GJ7xvPYJ5m
 eostab6MeBkZsbG5jpesh1pyg==
IronPort-HdrOrdr: A9a23:y+ISKKwc5/SRmzyTrtiWKrPwFL1zdoMgy1knxilNoRw8SKKlfq
 eV7Y0mPH7P+VAssR4b+exoVJPtfZqYz+8R3WBzB8bEYOCFghrKEGgK1+KLqFeMJ8S9zJ846U
 4JSdkHNDSaNzlHZKjBjzVQa+xQouW6zA==
X-IronPort-AV: E=Sophos;i="5.88,317,1635220800"; 
   d="scan'208";a="62781563"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH 3/8] x86/svm: VMEntry/Exit logic for MSR_SPEC_CTRL
Date: Wed, 26 Jan 2022 08:44:47 +0000
Message-ID: <20220126084452.28975-4-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20220126084452.28975-1-andrew.cooper3@citrix.com>
References: <20220126084452.28975-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Hardware maintains both host and guest versions of MSR_SPEC_CTRL, but guests
run with the logical OR of both values.  Therefore, in principle we want to
clear Xen's value before entering the guest.  However, for migration
compatibiltiy, and for performance reasons with SEV-SNP guests, we want the
ability to use a nonzero value behind the guest's back.  Use vcpu_msrs to hold
this value, with the guest value in the VMCB.

On the VMEntry path, adjusting MSR_SPEC_CTRL must be done after CLGI so as to
be atomic with respect to NMIs/etc.  The loading of spec_ctrl_raw into %eax
was also stale from the unused old code, so can be dropped too.

Implement both pieces of logic as small pieces of C, and alternative the call
to get there based on X86_FEATURE_SC_MSR_HVM.  While adjusting the clobber
lists, drop the stale requirements on the VMExit side.

The common case is that host and "guest-protection" values are both 0, so
maintain a per-cpu last_spec_ctrl value to allow us to skip redundant WRMSRs.
The value needs to live in the cpu_info block for subsequent use with PV
guests, and compatibility with XPTI.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>

Several points:

1) It would be slightly more efficient to pass curr and cpu_info into
   vm{entry,exit}_spec_ctrl(), but setup of such state can't be in the
   ALTERNATIVE block because then the call displacement won't get fixed up.
   All the additional accesses are hot off the stack, so almost certainly
   negligible compared to the WRMSR.

2) The RAS[:32] flushing side effect is under reconsideration.  It is actually
   a very awkward side effect in practice, and not applicable to any
   implementations (that I'm aware of), but for now, it's the documented safe
   action to take.  Furthermore, it avoids complicating the logic with an
   lfence in the else case for Spectre v1 safety.
---
 xen/arch/x86/hvm/svm/entry.S             | 10 +++++-----
 xen/arch/x86/hvm/svm/svm.c               | 30 ++++++++++++++++++++++++++++++
 xen/arch/x86/include/asm/current.h       |  2 +-
 xen/arch/x86/include/asm/msr.h           |  9 +++++++++
 xen/arch/x86/include/asm/spec_ctrl_asm.h |  7 +++++++
 5 files changed, 52 insertions(+), 6 deletions(-)

diff --git a/xen/arch/x86/hvm/svm/entry.S b/xen/arch/x86/hvm/svm/entry.S
index 276215d36aff..c718328ac4cf 100644
--- a/xen/arch/x86/hvm/svm/entry.S
+++ b/xen/arch/x86/hvm/svm/entry.S
@@ -55,11 +55,11 @@ __UNLIKELY_END(nsvm_hap)
         mov  %rsp, %rdi
         call svm_vmenter_helper
 
-        mov VCPU_arch_msrs(%rbx), %rax
-        mov VCPUMSR_spec_ctrl_raw(%rax), %eax
+        clgi
 
         /* WARNING! `ret`, `call *`, `jmp *` not safe beyond this point. */
-        /* SPEC_CTRL_EXIT_TO_SVM   (nothing currently) */
+        /* SPEC_CTRL_EXIT_TO_SVM       Req:                           Clob: C   */
+        ALTERNATIVE "", __stringify(call vmentry_spec_ctrl), X86_FEATURE_SC_MSR_HVM
 
         pop  %r15
         pop  %r14
@@ -78,7 +78,6 @@ __UNLIKELY_END(nsvm_hap)
         pop  %rsi
         pop  %rdi
 
-        clgi
         sti
         vmrun
 
@@ -86,8 +85,9 @@ __UNLIKELY_END(nsvm_hap)
 
         GET_CURRENT(bx)
 
-        /* SPEC_CTRL_ENTRY_FROM_SVM    Req: b=curr %rsp=regs/cpuinfo, Clob: ac  */
+        /* SPEC_CTRL_ENTRY_FROM_SVM    Req:                           Clob: ac,C */
         ALTERNATIVE "", DO_OVERWRITE_RSB, X86_FEATURE_SC_RSB_HVM
+        ALTERNATIVE "", __stringify(call vmexit_spec_ctrl), X86_FEATURE_SC_MSR_HVM
         /* WARNING! `ret`, `call *`, `jmp *` not safe before this point. */
 
         stgi
diff --git a/xen/arch/x86/hvm/svm/svm.c b/xen/arch/x86/hvm/svm/svm.c
index bb6b8e560a9f..8fdb530b4004 100644
--- a/xen/arch/x86/hvm/svm/svm.c
+++ b/xen/arch/x86/hvm/svm/svm.c
@@ -3086,6 +3086,36 @@ void svm_vmexit_handler(struct cpu_user_regs *regs)
     vmcb_set_vintr(vmcb, intr);
 }
 
+/* Called with GIF=0. */
+void vmexit_spec_ctrl(void)
+{
+    struct cpu_info *info = get_cpu_info();
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
+void vmentry_spec_ctrl(void)
+{
+    struct cpu_info *info = get_cpu_info();
+    const struct vcpu *curr = current;
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
diff --git a/xen/arch/x86/include/asm/current.h b/xen/arch/x86/include/asm/current.h
index cfbedc31983f..dc0edd9ed07d 100644
--- a/xen/arch/x86/include/asm/current.h
+++ b/xen/arch/x86/include/asm/current.h
@@ -56,6 +56,7 @@ struct cpu_info {
     /* See asm/spec_ctrl_asm.h for usage. */
     unsigned int shadow_spec_ctrl;
     uint8_t      xen_spec_ctrl;
+    uint8_t      last_spec_ctrl;
     uint8_t      spec_ctrl_flags;
 
     /*
@@ -73,7 +74,6 @@ struct cpu_info {
      */
     bool         use_pv_cr3;
 
-    unsigned long __pad;
     /* get_stack_bottom() must be 16-byte aligned */
 };
 
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
index bf82528a12ae..02b3b18ce69f 100644
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
@@ -67,6 +70,10 @@
  * steps 2 and 6 will restore the shadow value rather than leaving Xen's value
  * loaded and corrupting the value used in guest context.
  *
+ * Additionally, in some cases it is safe to skip writes to MSR_SPEC_CTRL when
+ * we don't require any of the side effects of an identical write.  Maintain a
+ * per-cpu last_spec_ctrl value for this purpose.
+ *
  * The following ASM fragments implement this algorithm.  See their local
  * comments for further details.
  *  - SPEC_CTRL_ENTRY_FROM_PV
-- 
2.11.0


