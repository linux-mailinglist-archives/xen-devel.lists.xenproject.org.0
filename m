Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B545767683
	for <lists+xen-devel@lfdr.de>; Fri, 28 Jul 2023 21:43:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.571545.895654 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qPTNE-0006VR-Df; Fri, 28 Jul 2023 19:43:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 571545.895654; Fri, 28 Jul 2023 19:43:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qPTNE-0006Tf-Ak; Fri, 28 Jul 2023 19:43:40 +0000
Received: by outflank-mailman (input) for mailman id 571545;
 Fri, 28 Jul 2023 19:43:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7hHC=DO=citrix.com=prvs=56653927b=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1qPTNC-0006TZ-Dp
 for xen-devel@lists.xenproject.org; Fri, 28 Jul 2023 19:43:38 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 093ba57b-2d7f-11ee-8613-37d641c3527e;
 Fri, 28 Jul 2023 21:43:35 +0200 (CEST)
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
X-Inumbo-ID: 093ba57b-2d7f-11ee-8613-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1690573415;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=3ddjg+XfGc/QaOKsJe4sn1glZqZfHIByHulKf8yGLgQ=;
  b=fEszIOXj8J6YC3RVFU39yDJTj68jpiUMe94hs7v7xiHrwOMp/LOdZxol
   rawv/kWmXGr0ZUX6EvFS1c8+Ns+5WqTTdRQNr3QFlfpbZLQvcBB2RTcJG
   sbmDsAYTvgarRj5pyej6wpFkrbjwvEQ2fqVU1xxxE2J3MLHJcXFmWDzcu
   A=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 118251366
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:02IUGaAgOSdnRhVW/xLjw5YqxClBgxIJ4kV8jS/XYbTApDsg1WcOz
 GEbC2DVaaqLZmahftp2bN6woBgFuMOAnYU3QQY4rX1jcSlH+JHPbTi7wuUcHAvJd5GeExg3h
 yk6QoOdRCzhZiaE/n9BCpC48T8nk/nOHuGmYAL9EngZbRd+Tys8gg5Ulec8g4p56fC0GArIs
 t7pyyHlEAbNNwVcbCRMsspvlDs15K6p4GxC7gRkDRx2lAS2e0c9Xcp3yZ6ZdxMUcqEMdsamS
 uDKyq2O/2+x13/B3fv8z94X2mVTKlLjFVDmZkh+AsBOsTAbzsAG6Y4pNeJ0VKtio27hc+ada
 jl6ncfYpQ8BZsUgkQmGOvVSO3kW0aZuoNcrLZUj2CA6IoKvn3bEmp1T4E8K0YIw48gpL0ESy
 /4jOm4/VhDcheHu+7aaRbw57igjBJGD0II3v3hhyXfSDOo8QICFSKLPjTNa9G5u3IYUR6+YP
 pdHL2M1N3wsYDUWUrsTILs4kP2lmT/UdDpApUjOjaE2/3LS3Ep6172F3N/9I4XaH5gMxRjGz
 o7A1z35JDFAFYaF8H2E0nipq/CUrH+4H51HQdVU8dY12QbOlwT/EiY+RVa95PW0lEO6c9ZeM
 FAPvDojq7Ao806mRcW7WAe3yFamlBMBX9tbE8Uh9RqAjKHT5m6xGWwsXjNHLts8u6ceXzsg2
 0WVmJXjDDNpuaecYXiA+ayZqzz0Mi8QRUcEZCQDSQJD/dT/uoA1jzrFU9l4Hai6yNbyHFnNL
 yui9XZkwe9J1IhSivv9pAqc696xmnTXZhcbuCv3Alyn1REnVralOI6rsWPfzPkVee51UWK9U
 Gg4d9m2tb5fVczTynLTEI3hD5nyua/bbWS0bUpHWsB4qm/zoyPLkZV4umkWGat/DioTldYFi
 mf3sBgZ2pJcNWDCgURfM9PoUJRCIUQN+L3YuhHogjlmOMIZmPevpn0GWKJp9zmFfLIQua8+I
 4yHVs2nEGwXD69qpBLvGbZFjOF6nnBlnjuNLXwe8/hB+eDFDJJyYe5VWGZik8hjtP/UyOkr2
 4g32zS2J+V3D7SlP3i/HX87JlEWN3krba0aWOQOHtNv1jFOQTl7Y9eImONJRmCQt/gN/gs+1
 i3nCxAwJZuWrSGvFDhmnVg6Oei2BMYn/ShrVcHuVH7xs0UejU+UxP93X/MKkXMPrYSPEdYco
 yE5Rvi9
IronPort-HdrOrdr: A9a23:ejj6T651R4TNc7jtxQPXwY2BI+orL9Y04lQ7vn2ZKCYlB/Bw8v
 rE8sjzuiWVtN9vYgBdpTntAsi9qBDnhO1ICPcqTNWftWDd0QPDEGgI1/qA/9SPIVyaygZXvZ
 0QDJSXYLfLYWST5qzBjzVR3LwbreWvweSQoaP78l8odAdtbshbnnVE4sTwKDwJeOGDb6BJZK
 Z1I6B81kudkA8sH6CGL0hAZfHHu9rI0Lr+eHc9dmcawTjLtyqs9Ln5VzOF3hISOgk/vIsKwC
 z+ignk4afmlPm+xnbnpgjuxqUTosLl1txAQOqTjcQPQw+c7DqAVcBaQrifuzJwmsGDgWxa6O
 XkklMbJsFu7HGURG2vvhf3/AHl3F8VmgTf4G7du2Lnvcv6AA03ENBAg4UxSGqi13Yd
X-Talos-CUID: 9a23:yhVhVW+hDNFKEA21+j6Vv1c6RO4FLkPf92WOEXe4VmRqEIaRaFDFrQ==
X-Talos-MUID: 9a23:+KBe/AuMhThoeKmOTc2n3TFEFJ1Jub6XT0Etm5ArpJK1aW83JGLI
X-IronPort-AV: E=Sophos;i="6.01,238,1684814400"; 
   d="scan'208";a="118251366"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>, Roberto Bagnara
	<roberto.bagnara@bugseng.com>, Nicola Vetrini <nicola.vetrini@bugseng.com>
Subject: [PATCH 1/3] x86/traps: Move do_general_protection() earlier
Date: Fri, 28 Jul 2023 20:43:18 +0100
Message-ID: <20230728194320.3082120-2-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230728194320.3082120-1-andrew.cooper3@citrix.com>
References: <20230728194320.3082120-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

... in order to clean up the declarations without needing to forward declare
it for handle_gdt_ldt_mapping_fault()

No functional change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>
CC: Roberto Bagnara <roberto.bagnara@bugseng.com>
CC: Nicola Vetrini <nicola.vetrini@bugseng.com>
---
 xen/arch/x86/traps.c | 157 +++++++++++++++++++++----------------------
 1 file changed, 78 insertions(+), 79 deletions(-)

diff --git a/xen/arch/x86/traps.c b/xen/arch/x86/traps.c
index 4229bda159ce..e05e8964482e 100644
--- a/xen/arch/x86/traps.c
+++ b/xen/arch/x86/traps.c
@@ -1224,6 +1224,84 @@ void do_int3(struct cpu_user_regs *regs)
     pv_inject_hw_exception(X86_EXC_BP, X86_EVENT_NO_EC);
 }
 
+void do_general_protection(struct cpu_user_regs *regs)
+{
+#ifdef CONFIG_PV
+    struct vcpu *v = current;
+#endif
+
+    if ( regs->error_code & X86_XEC_EXT )
+        goto hardware_gp;
+
+    if ( !guest_mode(regs) )
+        goto gp_in_kernel;
+
+#ifdef CONFIG_PV
+    /*
+     * Cunning trick to allow arbitrary "INT n" handling.
+     *
+     * We set DPL == 0 on all vectors in the IDT. This prevents any INT <n>
+     * instruction from trapping to the appropriate vector, when that might not
+     * be expected by Xen or the guest OS. For example, that entry might be for
+     * a fault handler (unlike traps, faults don't increment EIP), or might
+     * expect an error code on the stack (which a software trap never
+     * provides), or might be a hardware interrupt handler that doesn't like
+     * being called spuriously.
+     *
+     * Instead, a GPF occurs with the faulting IDT vector in the error code.
+     * Bit 1 is set to indicate that an IDT entry caused the fault. Bit 0 is
+     * clear (which got already checked above) to indicate that it's a software
+     * fault, not a hardware one.
+     *
+     * NOTE: Vectors 3 and 4 are dealt with from their own handler. This is
+     * okay because they can only be triggered by an explicit DPL-checked
+     * instruction. The DPL specified by the guest OS for these vectors is NOT
+     * CHECKED!!
+     */
+    if ( regs->error_code & X86_XEC_IDT )
+    {
+        /* This fault must be due to <INT n> instruction. */
+        uint8_t vector = regs->error_code >> 3;
+        const struct trap_info *ti = &v->arch.pv.trap_ctxt[vector];
+
+        if ( permit_softint(TI_GET_DPL(ti), v, regs) )
+        {
+            regs->rip += 2;
+            pv_inject_sw_interrupt(vector);
+            return;
+        }
+    }
+    else if ( is_pv_32bit_vcpu(v) && regs->error_code )
+    {
+        pv_emulate_gate_op(regs);
+        return;
+    }
+
+    /* Emulate some simple privileged and I/O instructions. */
+    if ( (regs->error_code == 0) &&
+         pv_emulate_privileged_op(regs) )
+    {
+        trace_trap_one_addr(TRC_PV_EMULATE_PRIVOP, regs->rip);
+        return;
+    }
+
+    /* Pass on GPF as is. */
+    pv_inject_hw_exception(X86_EXC_GP, regs->error_code);
+    return;
+#endif
+
+ gp_in_kernel:
+    if ( likely(extable_fixup(regs, true)) )
+        return;
+
+ hardware_gp:
+    if ( debugger_trap_fatal(X86_EXC_GP, regs) )
+        return;
+
+    show_execution_state(regs);
+    panic("GENERAL PROTECTION FAULT\n[error_code=%04x]\n", regs->error_code);
+}
+
 #ifdef CONFIG_PV
 static int handle_ldt_mapping_fault(unsigned int offset,
                                     struct cpu_user_regs *regs)
@@ -1589,85 +1667,6 @@ void __init do_early_page_fault(struct cpu_user_regs *regs)
     }
 }
 
-void do_general_protection(struct cpu_user_regs *regs)
-{
-#ifdef CONFIG_PV
-    struct vcpu *v = current;
-#endif
-
-    if ( regs->error_code & X86_XEC_EXT )
-        goto hardware_gp;
-
-    if ( !guest_mode(regs) )
-        goto gp_in_kernel;
-
-#ifdef CONFIG_PV
-    /*
-     * Cunning trick to allow arbitrary "INT n" handling.
-     *
-     * We set DPL == 0 on all vectors in the IDT. This prevents any INT <n>
-     * instruction from trapping to the appropriate vector, when that might not
-     * be expected by Xen or the guest OS. For example, that entry might be for
-     * a fault handler (unlike traps, faults don't increment EIP), or might
-     * expect an error code on the stack (which a software trap never
-     * provides), or might be a hardware interrupt handler that doesn't like
-     * being called spuriously.
-     *
-     * Instead, a GPF occurs with the faulting IDT vector in the error code.
-     * Bit 1 is set to indicate that an IDT entry caused the fault. Bit 0 is
-     * clear (which got already checked above) to indicate that it's a software
-     * fault, not a hardware one.
-     *
-     * NOTE: Vectors 3 and 4 are dealt with from their own handler. This is
-     * okay because they can only be triggered by an explicit DPL-checked
-     * instruction. The DPL specified by the guest OS for these vectors is NOT
-     * CHECKED!!
-     */
-    if ( regs->error_code & X86_XEC_IDT )
-    {
-        /* This fault must be due to <INT n> instruction. */
-        uint8_t vector = regs->error_code >> 3;
-        const struct trap_info *ti = &v->arch.pv.trap_ctxt[vector];
-
-        if ( permit_softint(TI_GET_DPL(ti), v, regs) )
-        {
-            regs->rip += 2;
-            pv_inject_sw_interrupt(vector);
-            return;
-        }
-    }
-    else if ( is_pv_32bit_vcpu(v) && regs->error_code )
-    {
-        pv_emulate_gate_op(regs);
-        return;
-    }
-
-    /* Emulate some simple privileged and I/O instructions. */
-    if ( (regs->error_code == 0) &&
-         pv_emulate_privileged_op(regs) )
-    {
-        trace_trap_one_addr(TRC_PV_EMULATE_PRIVOP, regs->rip);
-        return;
-    }
-
-    /* Pass on GPF as is. */
-    pv_inject_hw_exception(X86_EXC_GP, regs->error_code);
-    return;
-#endif
-
- gp_in_kernel:
-
-    if ( likely(extable_fixup(regs, true)) )
-        return;
-
- hardware_gp:
-    if ( debugger_trap_fatal(X86_EXC_GP, regs) )
-        return;
-
-    show_execution_state(regs);
-    panic("GENERAL PROTECTION FAULT\n[error_code=%04x]\n", regs->error_code);
-}
-
 static bool pci_serr_cont;
 
 static bool pci_serr_nmicont(void)
-- 
2.30.2


