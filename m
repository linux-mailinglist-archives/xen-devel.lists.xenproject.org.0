Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 11E184224BE
	for <lists+xen-devel@lfdr.de>; Tue,  5 Oct 2021 13:13:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.202150.356845 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mXiMc-0007Vq-4f; Tue, 05 Oct 2021 11:12:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 202150.356845; Tue, 05 Oct 2021 11:12:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mXiMc-0007U1-1C; Tue, 05 Oct 2021 11:12:02 +0000
Received: by outflank-mailman (input) for mailman id 202150;
 Tue, 05 Oct 2021 11:12:01 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vm5x=OZ=citrix.com=Andrew.Cooper3@srs-us1.protection.inumbo.net>)
 id 1mXiMa-0007Tv-UG
 for xen-devel@lists.xenproject.org; Tue, 05 Oct 2021 11:12:00 +0000
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id df4361e4-6b74-4007-8e6a-5e68683aa515;
 Tue, 05 Oct 2021 11:11:59 +0000 (UTC)
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
X-Inumbo-ID: df4361e4-6b74-4007-8e6a-5e68683aa515
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1633432319;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=1ordPe992Mc+PkRdN/4HpjM69JM23Rxqyx9enqhnBlc=;
  b=OQfxePaZxtJ2Kv5lrCUX9kQLv7nEknPqDwXUGqAIAJv+vfcn/9nNt4Bp
   I6G3OFcmdy4gj52Mj3G+pPJn7KqeY8zmbOUpDVNUB3VloF1yXHToStmj4
   aW8HgTK13T+dVRIGGZ8KHCRPS0MiJATA7T5RHnOJeJbjWBEcwuRTx8F7c
   s=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: k8WlLhmY8iWb48otd3aq/rQFEVuHkTnHMe/u+H/HBwAClrnvgmjzs4YN6jsaoHg4kS8TgdSi4v
 P3baCd8JHYPDTOrnuONaou9yNs1nQ8+QYRhFsb9dilvl8z5Qm1MAyLHXWDUCux26FCMjx8V5EJ
 wqzKul50eINfr6AFRrV8PTQJIMgt/hXVewtom0kKW+Iv9i79G98nDLuo+JfIc0rGyl8yxJoO9e
 xwuOFrX546Up+/bUZR/z0mKjEaOlFh6yHoyy7mCzvqMO4lFtaBYxV3o6bmeo1McNsiST8Gwbx6
 lp/ceUZErrd887sW/upqG7Q4
X-SBRS: 5.1
X-MesageID: 53961045
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:Uo+tp6CloQr2SBVW/+fkw5YqxClBgxIJ4kV8jS/XYbTApG4l0WAGx
 mYfDGHXOaqCZmCnfNFyPt/k9ElU65bXnN41QQY4rX1jcSlH+JHPbTi7wuYcHM8wwunrFh8PA
 xA2M4GYRCwMo/u1Si6FatANl1ElvU2zbue6WLOs1hxZH1c+EX550U87wobVv6Yz6TSHK1LV0
 T/Ni5W31G+Ng1aY5UpNtspvADs21BjDkGtwUm4WPJinj3eH/5UhN7oNJLnZEpfNatI88thW5
 Qr05OrREmvxp3/BAz4++1rxWhVirrX6ZWBihpfKMkQLb9crSiEai84G2PQghUh/mQmNw9ZYz
 u5xv7eAEyU3EfLUvOkXekwNe81+FfUuFL7vJHG+tYqYzlHccmuqyPJrZK00FdRGoKAtWzgIr
 KFGbmBWBvyAr7veLLaTY+9gnMk8auLsO5sSoCpIxjDFF/c2B5vERs0m4PcFh2Zu35gSQJ4yY
 eJDSSh2czjuQSF1AX03BsgyjMmUmHDgJmgwRFW9+vNsvjm7IBZK+KfpGMrYfJqNX8o9tmSyq
 3/C/m/5KgoHL9HZwj2Amlq8i+mKkS7lVYY6ELyj6uUskFCV3nYUChAdSR28u/bRt6Klc4sBc
 QpOoHNo9PVsshzwJjXgY/GmiGy4ukIactxrL+cR2Fuv1IWL+yKUDEFRG1atd+canMMxQDUr0
 HqAkNXoGSFjvdWpdJ6NyluHhWnsYHdEdAfucQdBHVNcvIWzyG0mpkiXJuuPBpJZmTEc9dvY7
 TeQsGAajqgfgNQH3qG2lbwsq2n3/cCYJuLZCx++Y45E0u+bTNL7D2BLwQKChRqlEGp/ZgLd1
 JTjs5LBhN3i9bnXyESwrBwlRdlFHcqtPjzGmkJIFJI87Tmr8HPLVdkOu2olexwxaZxaIGKBj
 KrvVeV5v8M70JyCN/8fXm5MI55ykfiI+SrNDJg4keaikrAuLVTarUmClGab3nz3kVhErE3ME
 czzTCpYNl5DUf4P5GPvH481iOZ3rghjlTK7bc2qlHyPjOvBDEN5vJ9YaTNimMhit/jayOgUm
 v4CX/a3J+J3CrajPXWHrdBJfTjn7xETXPjLliCeTcbbSiIOJY3rI6O5LWoJd9M3kqJLuP3P+
 33hCEZUxECm3S/MKBmQa2AlY7TqBM4toXU+NC0qHFCpx3l8Ptr/sPZBL8M6Les96ehu7f9oV
 P1ZKc+ONetCF2bc8DMHYJij8IE7LEa3hRiDNjaOaSQke8IyXBTA/9LpJ1O99CQHAietm9E5p
 rmsilHSTZYZHlwwB8fKcvO/iVi2uCFFyu51WkLJJPhVeVntr9c2e3Cg0KdvLphVexvZxzac2
 wKHOjsipLHA890v7d3EpaGYtIP1QeFwKVVXQjvA5rGsOCiEomf6md1cUPyFdCz2XX/v/Pnwf
 v1cyvzxPaFVnFtOtIYgQb9nwbhnuonqrr5eiA9lAG/KfxKgDbY5eiuK2sxGt6tswL5FuFTpB
 hLTq4cCYbjZatn4FFMxJRY+arXR3P4ZrTDe8PApLRio/yRw5reGDR1fMhTkZPax91ep3FfJG
 dschfM=
IronPort-HdrOrdr: A9a23:3rTZT6g+SCKf2fWInxCzpgVEWHBQXtYji2hC6mlwRA09TySZ//
 rBoB19726StN9xYgBFpTnuAsm9qB/nmaKdgrNhWItKPjOW21dARbsKheCJrgEIcxeOkNK1vp
 0AT0ERMrLN5CBB/KTH3DU=
X-IronPort-AV: E=Sophos;i="5.85,348,1624334400"; 
   d="scan'208";a="53961045"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH] x86/spec-ctrl: Build with BRANCH_HARDEN lfences by default
Date: Tue, 5 Oct 2021 12:11:46 +0100
Message-ID: <20211005111146.3694-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Branch Harden is enabled by default at compile and boot time.  Invert the code
to compile with lfence by default and nop out in the non-default case.

This has several advantages.  It removes 3829 patch points (in the random
build of Xen I have to hand) by default on boot, 70% (!) of the
.altinstr_replacement section.  For builds of Xen with a non-nops capable tool
chain, the code after `spec-ctrl=no-branch-harden` is better because Xen can
write long nops.

Most importantly however, it means the disassembly actually matches what runs
in the common case, with the ability to distinguish the lfences from other
uses of nops.

Finally, make opt_branch_harden local to spec_ctrl.c and __initdata.  It has
never been used externally, even at it's introduction in c/s 3860d5534df4
"spec: add l1tf-barrier".

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>
---
 xen/arch/x86/spec_ctrl.c          | 7 ++++---
 xen/include/asm-x86/cpufeatures.h | 2 +-
 xen/include/asm-x86/nospec.h      | 2 +-
 xen/include/asm-x86/spec_ctrl.h   | 1 -
 4 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/xen/arch/x86/spec_ctrl.c b/xen/arch/x86/spec_ctrl.c
index 16d2a1d172b5..a5569c7f2b3f 100644
--- a/xen/arch/x86/spec_ctrl.c
+++ b/xen/arch/x86/spec_ctrl.c
@@ -52,7 +52,7 @@ bool __read_mostly opt_ibpb = true;
 bool __read_mostly opt_ssbd = false;
 int8_t __read_mostly opt_eager_fpu = -1;
 int8_t __read_mostly opt_l1d_flush = -1;
-bool __read_mostly opt_branch_harden = true;
+static bool __initdata opt_branch_harden = true;
 
 bool __initdata bsp_delay_spec_ctrl;
 uint8_t __read_mostly default_xen_spec_ctrl;
@@ -1121,8 +1121,9 @@ void __init init_speculation_mitigations(void)
     else if ( opt_l1d_flush == -1 )
         opt_l1d_flush = cpu_has_bug_l1tf && !(caps & ARCH_CAPS_SKIP_L1DFL);
 
-    if ( opt_branch_harden )
-        setup_force_cpu_cap(X86_FEATURE_SC_BRANCH_HARDEN);
+    /* We compile lfence's in by default, and nop them out if requested. */
+    if ( !opt_branch_harden )
+        setup_force_cpu_cap(X86_FEATURE_SC_NO_BRANCH_HARDEN);
 
     /*
      * We do not disable HT by default on affected hardware.
diff --git a/xen/include/asm-x86/cpufeatures.h b/xen/include/asm-x86/cpufeatures.h
index 72beb7babcce..b10154fc44bb 100644
--- a/xen/include/asm-x86/cpufeatures.h
+++ b/xen/include/asm-x86/cpufeatures.h
@@ -27,7 +27,7 @@ XEN_CPUFEATURE(XEN_SMAP,          X86_SYNTH(11)) /* SMAP gets used by Xen itself
 /* Bit 12 - unused. */
 XEN_CPUFEATURE(IND_THUNK_LFENCE,  X86_SYNTH(13)) /* Use IND_THUNK_LFENCE */
 XEN_CPUFEATURE(IND_THUNK_JMP,     X86_SYNTH(14)) /* Use IND_THUNK_JMP */
-XEN_CPUFEATURE(SC_BRANCH_HARDEN,  X86_SYNTH(15)) /* Conditional Branch Hardening */
+XEN_CPUFEATURE(SC_NO_BRANCH_HARDEN, X86_SYNTH(15)) /* (Disable) Conditional branch hardening */
 XEN_CPUFEATURE(SC_MSR_PV,         X86_SYNTH(16)) /* MSR_SPEC_CTRL used by Xen for PV */
 XEN_CPUFEATURE(SC_MSR_HVM,        X86_SYNTH(17)) /* MSR_SPEC_CTRL used by Xen for HVM */
 XEN_CPUFEATURE(SC_RSB_PV,         X86_SYNTH(18)) /* RSB overwrite needed for PV */
diff --git a/xen/include/asm-x86/nospec.h b/xen/include/asm-x86/nospec.h
index f6eb84eee554..5312ae4c6f31 100644
--- a/xen/include/asm-x86/nospec.h
+++ b/xen/include/asm-x86/nospec.h
@@ -10,7 +10,7 @@
 static always_inline bool barrier_nospec_true(void)
 {
 #ifdef CONFIG_SPECULATIVE_HARDEN_BRANCH
-    alternative("", "lfence", X86_FEATURE_SC_BRANCH_HARDEN);
+    alternative("lfence", "", X86_FEATURE_SC_NO_BRANCH_HARDEN);
 #endif
     return true;
 }
diff --git a/xen/include/asm-x86/spec_ctrl.h b/xen/include/asm-x86/spec_ctrl.h
index e671b6fd8d57..a803d16f9065 100644
--- a/xen/include/asm-x86/spec_ctrl.h
+++ b/xen/include/asm-x86/spec_ctrl.h
@@ -37,7 +37,6 @@ extern bool opt_ibpb;
 extern bool opt_ssbd;
 extern int8_t opt_eager_fpu;
 extern int8_t opt_l1d_flush;
-extern bool opt_branch_harden;
 
 extern bool bsp_delay_spec_ctrl;
 extern uint8_t default_xen_spec_ctrl;
-- 
2.11.0


