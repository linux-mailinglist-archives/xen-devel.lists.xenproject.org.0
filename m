Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F003C7F1D81
	for <lists+xen-devel@lfdr.de>; Mon, 20 Nov 2023 20:46:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.637172.992961 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r5ADT-000355-BG; Mon, 20 Nov 2023 19:45:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 637172.992961; Mon, 20 Nov 2023 19:45:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r5ADT-00033F-8j; Mon, 20 Nov 2023 19:45:55 +0000
Received: by outflank-mailman (input) for mailman id 637172;
 Mon, 20 Nov 2023 19:45:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Uh/B=HB=citrix.com=prvs=681f0548f=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1r5ADR-000339-P7
 for xen-devel@lists.xenproject.org; Mon, 20 Nov 2023 19:45:53 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6805024e-87dd-11ee-98e0-6d05b1d4d9a1;
 Mon, 20 Nov 2023 20:45:52 +0100 (CET)
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
X-Inumbo-ID: 6805024e-87dd-11ee-98e0-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1700509551;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=yFQc26gzfmbTcEDNNjFjExz5m4AzfV92VeuGdWTrzkI=;
  b=JMrHxTZn7X9IU3hRs6lImOgZBtzHA6L4y5lLxuJtxLo47LYz543bsNrs
   IcO9SHcpOzBxDeyAYvLMT7Fqc0YMGIQ0FwCig23kvA+zB+vpF5cKqgdL1
   B7y50ujcJoKNGkTaeakPA6WmjY60mN4NpnXe0ZXY7AJuXn9EAIWt7SQLe
   I=;
X-CSE-ConnectionGUID: cE82oZdhRC+sT6LMA5oU+g==
X-CSE-MsgGUID: PgqF9hgsSeKtaT0uG+tFVA==
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 127433654
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.159.70
X-Policy: $RELAYED
X-ThreatScanner-Verdict: Negative
IronPort-Data: A9a23:iAn1fq2j4aap34FIOPbD5Zpxkn2cJEfYwER7XKvMYLTBsI5bpzYDm
 2UcWW3VM/+IM2f8LohwPouwphlUu5fXmIUxHABlpC1hF35El5HIVI+TRqvS04F+DeWYFR46s
 J9OAjXkBJppJpMJjk71atANlVEliOfQAOK6UbaYUsxIbVcMYD87jh5+kPIOjIdtgNyoayuAo
 tq3qMDEULOf82cc3lk8teTb9HuDgNyo4GlD5wVkPagR1LPjvyJ94Kw3dPnZw0TQGuG4LsbiL
 87fwbew+H/u/htFIrtJRZ6iLyXm6paLVeS/oiI+t5qK23CulQRrukoPD9IOaF8/ttm8t4sZJ
 OOhF3CHYVxB0qXkwIzxWvTDes10FfUuFLTveRBTvSEPpqFvnrSFL/hGVSkL0YMkFulfCkwer
 /sqJDA3RVOYu7yS5ZvmTdQviZF2RCXrFNt3VnBIyDjYCbAtQIzZQrWM7thdtNsyrpkQR7CEP
 ZNfMGc+KkuYC/FMEg5/5JYWteGknHTgNRZfr0qYv/Ef6GnP1g1hlrPqNbI5f/TTH5oJxR3G+
 z6uE2LROh4DGo2fxiG+/1Gwj9OXgAy4RKwsPejtnhJtqALKnTFCYPEMbnOrrP/8hkOgVtZ3L
 00P5jFovaU07FasTNT2Q1u/unHsljw2VsdUEuY6wBqQ0aeS6AGcbkAbShZRZdpgs9U5LQHGz
 XfQwYmvX2Y29uTIGDTCrt94sA9eJwAeAD9YYh0ITTEuoMLf/qUWp0/Ic5VsRfvdYsLOJd3g/
 9ybhHFh3+1P3JBRjvvTwLzRv967SnH0ou8JCub/BDvNAvtRPtLNWmBRwQGzAQx8BIiYVEKdm
 3MPhtKT6usDZbnUy3TVHb1QRu3wvqnbWNE5vbKJN8N5n9hK0yT7Fb28HRkkfBs5Wir6UWOBj
 LDvVfN5u8YIYSrCgV5faIOtEcU6pZUM5vy8Ps04muFmO8ArHCfepXEGWKJl9zy1+KTauf1la
 MjznAfFJSpyNJmLOxLvH7xBie90nn9vrY4RLLiipymaPXOlTCb9Yd843JGmN4jVMIvsTN3pz
 uti
IronPort-HdrOrdr: A9a23:jX3vsKxVb1I93zI7JhVHKrPwIL1zdoMgy1knxilNoRw8SKKlfq
 eV7ZMmPH7P+VIssR4b+exoVJPtfZq+z+8R3WByB8bAYOCOggLBR+sO0WKL+UyHJ8SUzI9gPM
 lbHJSWcOeAb2RHsQ==
X-Talos-CUID: 9a23:Bv8DKWGCUi5XZuFDqmJs2R5OHfIpckf2j2zsfWudIDtudf6aHAo=
X-Talos-MUID: 9a23:lgCH9gUvx2cNFvzq/AfjnR8zNMhz2KmNFEkxyYgp+NWqCwUlbg==
X-IronPort-AV: E=Sophos;i="6.04,214,1695700800"; 
   d="scan'208";a="127433654"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH] x86/traps: More use of nocall
Date: Mon, 20 Nov 2023 19:45:37 +0000
Message-ID: <20231120194537.1341452-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

sysenter_eflags_saved() and int80_direct_trap() are now only used by a single
translation unit.  Move the declarations into the respective traps.c, renaming
int80_direct_trap() to entry_int80() to match the style elsewhere.

Annotate all 3 with nocall like all other entry paths.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>

Followup from XSA-446
---
 xen/arch/x86/include/asm/processor.h | 4 +---
 xen/arch/x86/pv/traps.c              | 3 ++-
 xen/arch/x86/traps.c                 | 2 ++
 xen/arch/x86/x86_64/entry.S          | 2 +-
 4 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/xen/arch/x86/include/asm/processor.h b/xen/arch/x86/include/asm/processor.h
index b0d2a62c075f..ff62b080afbf 100644
--- a/xen/arch/x86/include/asm/processor.h
+++ b/xen/arch/x86/include/asm/processor.h
@@ -457,9 +457,7 @@ static inline void enable_nmis(void)
                      [cs] "r" (__HYPERVISOR_CS) );
 }
 
-void sysenter_entry(void);
-void sysenter_eflags_saved(void);
-void int80_direct_trap(void);
+void nocall sysenter_entry(void);
 
 struct stubs {
     union {
diff --git a/xen/arch/x86/pv/traps.c b/xen/arch/x86/pv/traps.c
index 240d1a2db7a3..83e84e276233 100644
--- a/xen/arch/x86/pv/traps.c
+++ b/xen/arch/x86/pv/traps.c
@@ -132,6 +132,7 @@ static void cf_check nmi_softirq(void)
     *v_ptr = NULL;
 }
 
+void nocall entry_int80(void);
 void nocall entry_int82(void);
 
 void __init pv_trap_init(void)
@@ -144,7 +145,7 @@ void __init pv_trap_init(void)
 
     /* Fast trap for int80 (faster than taking the #GP-fixup path). */
     _set_gate(idt_table + LEGACY_SYSCALL_VECTOR, SYS_DESC_irq_gate, 3,
-              &int80_direct_trap);
+              &entry_int80);
 
     open_softirq(NMI_SOFTIRQ, nmi_softirq);
 }
diff --git a/xen/arch/x86/traps.c b/xen/arch/x86/traps.c
index e1356f696aba..9a6d29f24ae1 100644
--- a/xen/arch/x86/traps.c
+++ b/xen/arch/x86/traps.c
@@ -1884,6 +1884,8 @@ void do_device_not_available(struct cpu_user_regs *regs)
 #endif
 }
 
+void nocall sysenter_eflags_saved(void);
+
 /* SAF-1-safe */
 void do_debug(struct cpu_user_regs *regs)
 {
diff --git a/xen/arch/x86/x86_64/entry.S b/xen/arch/x86/x86_64/entry.S
index 9a7b129aa7e4..bf654fe27ec3 100644
--- a/xen/arch/x86/x86_64/entry.S
+++ b/xen/arch/x86/x86_64/entry.S
@@ -385,7 +385,7 @@ UNLIKELY_END(sysenter_gpf)
 #endif
         jmp   .Lbounce_exception
 
-ENTRY(int80_direct_trap)
+ENTRY(entry_int80)
         ENDBR64
         ALTERNATIVE "", clac, X86_FEATURE_XEN_SMAP
         pushq $0
-- 
2.30.2


