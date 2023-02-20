Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C836A69CA63
	for <lists+xen-devel@lfdr.de>; Mon, 20 Feb 2023 13:00:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.498065.768888 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pU4qY-00074Q-L4; Mon, 20 Feb 2023 12:00:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 498065.768888; Mon, 20 Feb 2023 12:00:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pU4qY-0006yA-G7; Mon, 20 Feb 2023 12:00:42 +0000
Received: by outflank-mailman (input) for mailman id 498065;
 Mon, 20 Feb 2023 12:00:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CT8u=6Q=citrix.com=prvs=408b4b2b9=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pU4qX-0006Ge-Hq
 for xen-devel@lists.xenproject.org; Mon, 20 Feb 2023 12:00:41 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2d6bc0d5-b116-11ed-933d-83870f6b2ba8;
 Mon, 20 Feb 2023 13:00:40 +0100 (CET)
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
X-Inumbo-ID: 2d6bc0d5-b116-11ed-933d-83870f6b2ba8
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1676894440;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=1KephbvI42w6sMGYmeXsDxkv8u+mNIwoxSbywXjjdiA=;
  b=eq97NWmOoK411XLkeGqBS1n8drJaukjcGHb8EpE1LyyZuG+6r1ZVLHBl
   IW4kr4RSaIks94JBQGSJGEH5o34Qprhz0tRv3jHTCz3F+G/z7ba37oAlb
   Xqje9cVXYc+hq0QpJ+hjZIoGygERSm4zg87pUME1Ryepy1qpT7SJG4ETO
   s=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 97740141
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:NJtP2Ks6zMHbJa3uk/Y09WNwxOfnVEdeMUV32f8akzHdYApBsoF/q
 tZmKW2BPauKZmL0eN4lOYni9R8Hu8XUmt4xHQU6/iwwQX4Q+JbJXdiXEBz9bniYRiHhoOCLz
 O1FM4Wdc5pkJpP4jk3wWlQ0hSAkjclkfpKlVKiffHg3HVQ+IMsYoUoLs/YjhYJ1isSODQqIu
 Nfjy+XSI1bg0DNvWo4uw/vrRChH4bKj51v0gnRkPaoQ5AWEzyFMZH4iDfrZw0XQE9E88tGSH
 44v/JnhlkvF8hEkDM+Sk7qTWiXmlZaLYGBiIlIPM0STqkAqSh4ai87XB9JFAatjsB2bnsgZ9
 Tl4ncfYpTHFnEH7sL91vxFwS0mSNEDdkVPNCSDXXce7lyUqf5ZwqhnH4Y5f0YAwo45K7W9yG
 fMwEzBKdivElviNzLeAYcdD3O4nJ5XZFdZK0p1g5Wmx4fcORJnCR+PB5MNC3Sd2jcdLdRrcT
 5NHM3w1Nk2GOkARfA5NU/rSn8/x7pX7WxRepEiYuuwc5G/LwRYq+LPsLMDUapqBQsA9ckOw9
 z2ZozygXkhy2Nq32WCv3163nrf1nn2mUds1H5SXzaFlnwjGroAUIEJPDgbqyRWjsWahX/pPJ
 kpS/TAhxYAi+UruQtTjUhmQpH+fogVaS9dWC/c96gyG1uzT+QnxLkouQyNFadcmnNQrXjFs3
 ViM9+4FHhQ27ufTEyjEsO7J83XrY3N9wXI+iTEsdgtC++KksZsIghf0ZfhMSoSxhYHHMGSlq
 9yVlxQWi7IWhM8N8qy0+1Hbnj6hzqT0oh4JChb/BTz8sF4gDGKxT8nxsAWAs64cRGqMZgPZ1
 EXojfRy+wzn4XulsCWWCNsAE7iyjxpuGG2N2AU/d3XNGtnExpJCQWyyyGshTKuKGpxeEdMMX
 KM0kVoIjKK/xFPwMcdKj3uZUqzGN5TIG9X/TezzZdFTeJV3fwLv1HgwOhDAhDmzyxVzyfpX1
 XKnnSGEVytyNEia5GDuG7d1PUEDm0jSOl8/tbiklk/6gNJylVaeSKsfMUvmUwzKxPrsnekhy
 P4Gb5Hi40wGAIXDjtz/rdZ7waYicSJqWvgbaqV/Koa+H+aRMDt/Uq+Mkex9KtUNcmY8vr6gw
 0xRk3RwkDLX7UAr4y3QOhiPtJuHsU5DkE8G
IronPort-HdrOrdr: A9a23:swJ7baC/749xoQTlHemi55DYdb4zR+YMi2TDtnocdfUxSKelfq
 +V88jzuSWbtN9yYhEdcKG7WZVoKEm0nfQZ3WB7B8bAYOCJghrMEKhSqafk3j38C2nf24dmpM
 NdmnFFeb/NMWQ=
X-IronPort-AV: E=Sophos;i="5.97,312,1669093200"; 
   d="scan'208";a="97740141"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH 1/3] x86/traps: Move do_general_protection() earlier
Date: Mon, 20 Feb 2023 11:59:54 +0000
Message-ID: <20230220115956.1522728-2-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230220115956.1522728-1-andrew.cooper3@citrix.com>
References: <20230220115956.1522728-1-andrew.cooper3@citrix.com>
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
---
 xen/arch/x86/traps.c | 157 +++++++++++++++++++++----------------------
 1 file changed, 78 insertions(+), 79 deletions(-)

diff --git a/xen/arch/x86/traps.c b/xen/arch/x86/traps.c
index cade9e12f8fa..7fb0c54f884e 100644
--- a/xen/arch/x86/traps.c
+++ b/xen/arch/x86/traps.c
@@ -1301,6 +1301,84 @@ void do_int3(struct cpu_user_regs *regs)
     pv_inject_hw_exception(TRAP_int3, X86_EVENT_NO_EC);
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
+    pv_inject_hw_exception(TRAP_gp_fault, regs->error_code);
+    return;
+#endif
+
+ gp_in_kernel:
+    if ( likely(extable_fixup(regs, true)) )
+        return;
+
+ hardware_gp:
+    if ( debugger_trap_fatal(TRAP_gp_fault, regs) )
+        return;
+
+    show_execution_state(regs);
+    panic("GENERAL PROTECTION FAULT\n[error_code=%04x]\n", regs->error_code);
+}
+
 #ifdef CONFIG_PV
 static int handle_ldt_mapping_fault(unsigned int offset,
                                     struct cpu_user_regs *regs)
@@ -1666,85 +1744,6 @@ void __init do_early_page_fault(struct cpu_user_regs *regs)
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
-    pv_inject_hw_exception(TRAP_gp_fault, regs->error_code);
-    return;
-#endif
-
- gp_in_kernel:
-
-    if ( likely(extable_fixup(regs, true)) )
-        return;
-
- hardware_gp:
-    if ( debugger_trap_fatal(TRAP_gp_fault, regs) )
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


