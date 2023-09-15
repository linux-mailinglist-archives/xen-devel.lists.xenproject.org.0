Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 11DF37A21AE
	for <lists+xen-devel@lfdr.de>; Fri, 15 Sep 2023 17:01:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.603210.940174 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qhAJa-0005uA-JA; Fri, 15 Sep 2023 15:01:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 603210.940174; Fri, 15 Sep 2023 15:01:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qhAJa-0005sB-Ek; Fri, 15 Sep 2023 15:01:02 +0000
Received: by outflank-mailman (input) for mailman id 603210;
 Fri, 15 Sep 2023 15:01:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Zf2R=E7=citrix.com=prvs=615989724=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1qhAJY-0004UV-S2
 for xen-devel@lists.xenproject.org; Fri, 15 Sep 2023 15:01:00 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ae4d3cbc-53d8-11ee-8788-cb3800f73035;
 Fri, 15 Sep 2023 17:01:00 +0200 (CEST)
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
X-Inumbo-ID: ae4d3cbc-53d8-11ee-8788-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1694790059;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=/u8QeVsYfOmIrdRheduf3X7k6ZQUSH9FsIiCo9BxkLA=;
  b=CfPY0ppBplhvOvn7O3J2038gUwCE4xWlYCNw9VpjcInUavq+VLrj2ryk
   8qQId048x1w22aFZHteyy3Jp74luL9+fytw++zBXRW7T5D/w3Gnrc633X
   D5GLVGl31/VqRHgpUIV02Pjrf0wOW/ye+5mNbNdLU5yMKdtGfBmJfPhyI
   4=;
X-CSE-ConnectionGUID: T6/GhXioRSe6SFi4s144KQ==
X-CSE-MsgGUID: XGE2t4/OQE6ysVOHiFaVsg==
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 125509277
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
X-ThreatScanner-Verdict: Negative
IronPort-Data: A9a23:gtXlvas+kuKMG4dtr5Z9gtnTD+fnVEleMUV32f8akzHdYApBsoF/q
 tZmKT3TOKuPY2vxKt4iPY22oUlXvJHRn4UwSgFoqX9jFiNE+JbJXdiXEBz9bniYRiHhoOCLz
 O1FM4Wdc5pkJpP4jk3wWlQ0hSAkjclkfpKlVaicfHg3HFc4IMsYoUoLs/YjhYJ1isSODQqIu
 Nfjy+XSI1bg0DNvWo4uw/vrRChH4rKq4lv0gnRkPaoQ5A6HyiFPZH4iDfrZw0XQE9E88tGSH
 44v/JnhlkvF8hEkDM+Sk7qTWiXmlZaLYGBiIlIPM0STqkAqSh4ai87XB9JFAatjsB2bnsgZ9
 Tl4ncfYpTHFnEH7sL91vxFwS0mSNEDdkVPNCSDXXce7lyUqf5ZwqhnH4Y5f0YAwo45K7W9yG
 fMwFG5KQRCzhuWM+7/lccdt2t96cJXIBdZK0p1g5Wmx4fcORJnCR+PB5MNC3Sd2jcdLdRrcT
 5NHM3w1Nk2GOkARfA5NU/rSn8/x7pX7WxRepEiYuuwc5G/LwRYq+LPsLMDUapqBQsA9ckOw/
 zibojyoWE5FXDCZ4Qqq3yiw2qjopA6lSZksM5252PdUm1LGkwT/DzVJDADm8JFVkHWWS99Zb
 kAZ5Ccqhawz71CwCMnwWQWip3yJtQJaXMBfe8U44gyQzqvf4y6CG3MJCDVGbbQOq8seVTEsk
 FiTkLvU6SdH6ePPDyjHr/HN8G30YHJORYMfWcMaZTdbpPbjkIA0tCnCEO1NEfKu14GpOgill
 lhmsxMCr7kUiMcK0YCy8lbGny+gq/D1c+Il2unEdjn7t10kPeZJc6TtsAGGtqgYcO51W3Hb5
 BA5d96iAPfi5H1nvAiEW60zEb6g/J5p2xWM0Ac0T/HNG9lAkkNPnLy8AhkkdC+F0e5eI1cFh
 XM/XisIv/du0IOCN/MfXm5II51CIVLcPdrkTOvISdFFf4J8cgSKlAk3Ox/Mhjm0zBh0yv1nU
 Xt+TSpKJSxKYUiA5GDqL9rxLJdxnnxurY8tbc+TI+ubPUq2OyfOFOZt3KqmZeEl9qKUyDg5A
 P4GX/ZmPy53CbWkCgGOqN57ELz/BSRjbXwAg5ANJ7Hrz8sPMD1JNsI9Npt6J9Q/xf0EzLaYl
 px/M2cBoGfCabT8AV3iQhhehHnHAP6TcVpT0fQQAGuV
IronPort-HdrOrdr: A9a23:7VgBSaiZwza4JWTwWCan3Gf5x3BQXiUji2hC6mlwRA09TyX4rb
 HWoB11726QtN98YgBDpTniAtjifZq/z+8Q3WB5B97LN2OKhILCFvAE0WKN+UyHJ8Q8zIFgPG
 VbH5SWxOeQMXFKyf/Axi+WKvAB5+TvytHRuc7ui053Swdkcqdh6Bo8JDq6PyRNNXJ7LKt8LY
 Gb4MVfoTqmZDAwVeSUQlc4f8WrnaywqHrBCSR2eyLPLDP+8A9AIYSVcySl4g==
X-Talos-CUID: =?us-ascii?q?9a23=3A0tIXV2j2HNmrEu3yvd0dKEr+WTJuTiOa43fgIki?=
 =?us-ascii?q?CMms3c5OUFUTJpP9Hqp87?=
X-Talos-MUID: 9a23:jhIdBwoixFhryifEX3cezwFNGZ10v+OJMW1TgI44nOmFGyVOIDjI2Q==
X-IronPort-AV: E=Sophos;i="6.02,149,1688443200"; 
   d="scan'208";a="125509277"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<jbeulich@suse.com>, Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, Wei Liu
	<wl@xen.org>
Subject: [PATCH 3/9] x86/spec-ctrl: Turn the remaining SPEC_CTRL_{ENTRY,EXIT}_* into asm macros
Date: Fri, 15 Sep 2023 16:00:32 +0100
Message-ID: <20230915150038.602577-4-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230915150038.602577-1-andrew.cooper3@citrix.com>
References: <20230915150038.602577-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

These have grown more complex over time, with some already having been
converted.

Provide full Requires/Clobbers comments, otherwise missing at this level of
indirection.

No functional change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
Reviewed-by: Jan Beulich <jbeulich@suse.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>
---
 xen/arch/x86/include/asm/spec_ctrl_asm.h | 37 ++++++++++++++++++------
 1 file changed, 28 insertions(+), 9 deletions(-)

diff --git a/xen/arch/x86/include/asm/spec_ctrl_asm.h b/xen/arch/x86/include/asm/spec_ctrl_asm.h
index 72e7046f70d6..f768b0f48a0b 100644
--- a/xen/arch/x86/include/asm/spec_ctrl_asm.h
+++ b/xen/arch/x86/include/asm/spec_ctrl_asm.h
@@ -219,26 +219,45 @@
 .endm
 
 /* Use after an entry from PV context (syscall/sysenter/int80/int82/etc). */
-#define SPEC_CTRL_ENTRY_FROM_PV                                         \
+.macro SPEC_CTRL_ENTRY_FROM_PV
+/*
+ * Requires %rsp=regs/cpuinfo, %rdx=0
+ * Clobbers %rax, %rcx, %rdx
+ */
     ALTERNATIVE "", __stringify(DO_SPEC_CTRL_COND_IBPB maybexen=0),     \
-        X86_FEATURE_IBPB_ENTRY_PV;                                      \
-    ALTERNATIVE "", DO_OVERWRITE_RSB, X86_FEATURE_SC_RSB_PV;            \
+        X86_FEATURE_IBPB_ENTRY_PV
+
+    ALTERNATIVE "", DO_OVERWRITE_RSB, X86_FEATURE_SC_RSB_PV
+
     ALTERNATIVE "", __stringify(DO_SPEC_CTRL_ENTRY maybexen=0),         \
         X86_FEATURE_SC_MSR_PV
+.endm
 
 /* Use in interrupt/exception context.  May interrupt Xen or PV context. */
-#define SPEC_CTRL_ENTRY_FROM_INTR                                       \
+.macro SPEC_CTRL_ENTRY_FROM_INTR
+/*
+ * Requires %rsp=regs, %r14=stack_end, %rdx=0
+ * Clobbers %rax, %rcx, %rdx
+ */
     ALTERNATIVE "", __stringify(DO_SPEC_CTRL_COND_IBPB maybexen=1),     \
-        X86_FEATURE_IBPB_ENTRY_PV;                                      \
-    ALTERNATIVE "", DO_OVERWRITE_RSB, X86_FEATURE_SC_RSB_PV;            \
+        X86_FEATURE_IBPB_ENTRY_PV
+
+    ALTERNATIVE "", DO_OVERWRITE_RSB, X86_FEATURE_SC_RSB_PV
+
     ALTERNATIVE "", __stringify(DO_SPEC_CTRL_ENTRY maybexen=1),         \
         X86_FEATURE_SC_MSR_PV
+.endm
 
 /* Use when exiting to PV guest context. */
-#define SPEC_CTRL_EXIT_TO_PV                                            \
-    ALTERNATIVE "",                                                     \
-        DO_SPEC_CTRL_EXIT_TO_GUEST, X86_FEATURE_SC_MSR_PV;              \
+.macro SPEC_CTRL_EXIT_TO_PV
+/*
+ * Requires %rax=spec_ctrl, %rsp=regs/info
+ * Clobbers %rcx, %rdx
+ */
+    ALTERNATIVE "", DO_SPEC_CTRL_EXIT_TO_GUEST, X86_FEATURE_SC_MSR_PV
+
     DO_SPEC_CTRL_COND_VERW
+.endm
 
 /*
  * Use in IST interrupt/exception context.  May interrupt Xen or PV context.
-- 
2.30.2


