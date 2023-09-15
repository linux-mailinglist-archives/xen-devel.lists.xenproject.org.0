Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 973507A21AF
	for <lists+xen-devel@lfdr.de>; Fri, 15 Sep 2023 17:01:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.603206.940131 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qhAJO-0004eD-Cs; Fri, 15 Sep 2023 15:00:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 603206.940131; Fri, 15 Sep 2023 15:00:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qhAJO-0004Xp-8z; Fri, 15 Sep 2023 15:00:50 +0000
Received: by outflank-mailman (input) for mailman id 603206;
 Fri, 15 Sep 2023 15:00:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Zf2R=E7=citrix.com=prvs=615989724=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1qhAJM-0004UV-Mu
 for xen-devel@lists.xenproject.org; Fri, 15 Sep 2023 15:00:48 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a67cbca2-53d8-11ee-8788-cb3800f73035;
 Fri, 15 Sep 2023 17:00:46 +0200 (CEST)
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
X-Inumbo-ID: a67cbca2-53d8-11ee-8788-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1694790046;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=izsyaKGJeUnhPk6j2osd2bXLpPVhEb5F2wtxQKRG81U=;
  b=WHixYv+Xe4E8hpMIAIMP7O1QjxRjIKCQdzOmaSd7YmbIlKAMeew5xnjB
   +cQNF8u1ZfOyBsnUUbwvXm4Kt3ofiIdASb773OsPIw3sy8cuSLH1e7LdW
   cFv32Gz658fyygle7FWwGEMmTeTBYeVuQ02aICkbvZ9giZlbGR1G84pzm
   c=;
X-CSE-ConnectionGUID: X/kd13lbTuuvW1qLdo0dGQ==
X-CSE-MsgGUID: EbxX6fuzQ8a5rCXSy6+RKw==
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 123201210
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
X-ThreatScanner-Verdict: Negative
IronPort-Data: A9a23:8OAk86NtW1zWR3fvrR26l8FynXyQoLVcMsEvi/4bfWQNrUohhTQAm
 DdLC22CMq3fajGmLtoibI++8EhT6pTTz4BgQQto+SlhQUwRpJueD7x1DKtS0wC6dZSfER09v
 63yTvGacajYm1eF/k/F3oDJ9CQ6jefQAOOkVIYoAwgpLSd8UiAtlBl/rOAwh49skLCRDhiE/
 Nj/uKUzAnf8s9JPGjxSs/jrRC9H5qyo42tJ5wFmP5ingXeF/5UrJMNHTU2OByOQrrl8RoaSW
 +vFxbelyWLVlz9F5gSNy+uTnuUiG9Y+DCDW4pZkc/HKbitq/0Te5p0TJvsEAXq7vh3S9zxHJ
 HehgrTrIeshFvWkdO3wyHC0GQkmVUFN0OevzXRSLaV/ZqAJGpfh66wGMa04AWEX0tYwAm0Xr
 vgSFC0QcC/ansa6x+q3ZdA506zPLOGzVG8eknRpzDWfBvc6W5HTBa7N4Le03h9p2JoIR6yHI
 ZNEN3w2Nk+ojx5nYz/7DLoXmuuyi2a5WDpfsF+P/oI84nTJzRw327/oWDbQUoXQHp8NxxzB/
 goq+UzUCAEqatKC2wPV+y+2rd/0jH24YqENQejQGvlC3wTImz175ActfUu2p7y1h1CzX/pbK
 lcI4Ww+oK4q7kupQ9LhGRqirxasnDQRRt5RGO0S8xyWx+zf5APxLncAZi5MbpohrsBeeNAx/
 gbXxZWzX2Up6eDLDyvHrd94sA9eJwAlamwOPHQARzcY/sfc+ZgXghWXQvlaRfvdYsLOJRn8x
 DWDrS4bjroVjNIW26jTwW0rkw5AtbCSEFdru1y/snaNq1ogOdX7P9DABU3zt64oEWqPcrWWU
 JHoceC65ftGM5yCnTflrA4lTODwvKbt3NExbDdS83gdG9aFoS7LkWN4umsWyKJV3iEsIGWBX
 aMrkVkNjKK/xVPzBUONX6q/Ct4x0Y/rHsn/W/bfY7JmO8YgKFDeono1NBHJjwgBdXTAd4llY
 f93lu72Vh4n5VlPlmLqF4/xL5d1rszB+Y8jbc+ilEn2uVZvTHWUVa0EIDOzghMRtcu5TPHu2
 48HbaOikkwPONASlwGLqeb/23hWdylkbX03wuQLHtO+zv1OQz15UaWIkOlwK+SIXc19z4/1w
 510YWcAoHKXuJENAVzihqxLAF83YatCkA==
IronPort-HdrOrdr: A9a23:UCQYH6k018Pm5S6EpkOjOzXFnSLpDfLo3DAbv31ZSRFFG/Fw9/
 rCoB17726QtN91YhsdcL+7V5VoLUmzyXcX2/hyAV7BZmnbUQKTRekP0WKL+Vbd8kbFh41gPM
 lbEpSXCLfLfCJHZcSR2njELz73quP3jJxBho3lvghQpRkBUdAF0+/gYDzranGfQmN9dP0EPa
 vZ3OVrjRy6d08aa8yqb0N1JNQq97Xw5fTbiQdtPW9f1DWz
X-Talos-CUID: 9a23:bIgqRGMU0z1ZMu5DaG5k+BdPHsoZb2DD8y7JB0O/UWpGcejA
X-Talos-MUID: 9a23:6kwvBgS7jObFTYURRXTBjiFSasl18Z3+AR0XuqU9qpfHDw9vbmI=
X-IronPort-AV: E=Sophos;i="6.02,149,1688443200"; 
   d="scan'208";a="123201210"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH 4/9] x86/spec-ctrl: Improve all SPEC_CTRL_{ENTER,EXIT}_* comments
Date: Fri, 15 Sep 2023 16:00:33 +0100
Message-ID: <20230915150038.602577-5-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230915150038.602577-1-andrew.cooper3@citrix.com>
References: <20230915150038.602577-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

... to better explain how they're used.

Doing so highlights that SPEC_CTRL_EXIT_TO_XEN is missing a VERW flush for the
corner case when e.g. an NMI hits late in an exit-to-guest path.

Leave a TODO, which will be addressed in subsequent patches which arrange for
DO_COND_VERW to be safe within SPEC_CTRL_EXIT_TO_XEN.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>

This was decided not to be XSA-worthy, as guests can't usefully control when
IST events occur.

v2:
 * Rewrite.
---
 xen/arch/x86/include/asm/spec_ctrl_asm.h | 36 ++++++++++++++++++++----
 1 file changed, 31 insertions(+), 5 deletions(-)

diff --git a/xen/arch/x86/include/asm/spec_ctrl_asm.h b/xen/arch/x86/include/asm/spec_ctrl_asm.h
index f768b0f48a0b..8996fe3fc0ef 100644
--- a/xen/arch/x86/include/asm/spec_ctrl_asm.h
+++ b/xen/arch/x86/include/asm/spec_ctrl_asm.h
@@ -218,7 +218,10 @@
     wrmsr
 .endm
 
-/* Use after an entry from PV context (syscall/sysenter/int80/int82/etc). */
+/*
+ * Used after an entry from PV context: SYSCALL, SYSENTER, INT,
+ * etc.  There is always a guest speculation state in context.
+ */
 .macro SPEC_CTRL_ENTRY_FROM_PV
 /*
  * Requires %rsp=regs/cpuinfo, %rdx=0
@@ -233,7 +236,11 @@
         X86_FEATURE_SC_MSR_PV
 .endm
 
-/* Use in interrupt/exception context.  May interrupt Xen or PV context. */
+/*
+ * Used after an exception or maskable interrupt, hitting Xen or PV context.
+ * There will either be a guest speculation context, or (baring fatal
+ * exceptions) a well-formed Xen speculation context.
+ */
 .macro SPEC_CTRL_ENTRY_FROM_INTR
 /*
  * Requires %rsp=regs, %r14=stack_end, %rdx=0
@@ -248,7 +255,10 @@
         X86_FEATURE_SC_MSR_PV
 .endm
 
-/* Use when exiting to PV guest context. */
+/*
+ * Used when exiting from any entry context, back to PV context.  This
+ * includes from an IST entry which moved onto the primary stack.
+ */
 .macro SPEC_CTRL_EXIT_TO_PV
 /*
  * Requires %rax=spec_ctrl, %rsp=regs/info
@@ -260,7 +270,13 @@
 .endm
 
 /*
- * Use in IST interrupt/exception context.  May interrupt Xen or PV context.
+ * Used after an IST entry hitting Xen or PV context.  Special care is needed,
+ * because when hitting Xen context, there may not a well-formed speculation
+ * context.  (i.e. it can hit in the middle of SPEC_CTRL_{ENTRY,EXIT}_*
+ * regions.)
+ *
+ * An IST entry which hits PV context moves onto the primary stack and leaves
+ * via SPEC_CTRL_EXIT_TO_PV, *not* SPEC_CTRL_EXIT_TO_XEN.
  */
 .macro SPEC_CTRL_ENTRY_FROM_INTR_IST
 /*
@@ -319,7 +335,14 @@ UNLIKELY_DISPATCH_LABEL(\@_serialise):
     UNLIKELY_END(\@_serialise)
 .endm
 
-/* Use when exiting to Xen context. */
+/*
+ * Use when exiting from any entry context, back to Xen context.  This
+ * includes returning to other SPEC_CTRL_{ENTRY,EXIT}_* regions with an
+ * incomplete speculation context.
+ *
+ * Because we might have interrupted Xen beyond SPEC_CTRL_EXIT_TO_$GUEST, we
+ * need to treat this as if it were an EXIT_TO_$GUEST case too.
+ */
 .macro SPEC_CTRL_EXIT_TO_XEN
 /*
  * Requires %rbx=stack_end
@@ -344,6 +367,9 @@ UNLIKELY_DISPATCH_LABEL(\@_serialise):
     wrmsr
 
 .L\@_skip_sc_msr:
+
+    /* TODO VERW */
+
 .endm
 
 #endif /* __ASSEMBLY__ */
-- 
2.30.2


