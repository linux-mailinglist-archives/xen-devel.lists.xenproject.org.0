Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EDB6D7A21AC
	for <lists+xen-devel@lfdr.de>; Fri, 15 Sep 2023 17:01:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.603208.940156 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qhAJY-0005OD-28; Fri, 15 Sep 2023 15:01:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 603208.940156; Fri, 15 Sep 2023 15:01:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qhAJX-0005Kn-Uc; Fri, 15 Sep 2023 15:00:59 +0000
Received: by outflank-mailman (input) for mailman id 603208;
 Fri, 15 Sep 2023 15:00:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Zf2R=E7=citrix.com=prvs=615989724=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1qhAJW-0004UV-80
 for xen-devel@lists.xenproject.org; Fri, 15 Sep 2023 15:00:58 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id abef32b7-53d8-11ee-8788-cb3800f73035;
 Fri, 15 Sep 2023 17:00:57 +0200 (CEST)
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
X-Inumbo-ID: abef32b7-53d8-11ee-8788-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1694790057;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=mCnqiLXy0cb8cqZh1FcVLN8e9wmVJ7m7NThYBUa7SXs=;
  b=fyXZJFbzx9/XLIDBIyb+yYkoSkKrgptY3/qKpciLjutuD5pSEg5T45sv
   9+JM07j7D1UBPY2nhwM69CqLxWnMfl9qxzg63lWEIBShmjwjINBCyfUG4
   ogaiI1cQ6YCegVWO26mSSRDexHq6T/gvJ4UcQOKxUUm32elq/59wUQjNR
   w=;
X-CSE-ConnectionGUID: T6/GhXioRSe6SFi4s144KQ==
X-CSE-MsgGUID: 7qOK/haVQ8qBVL4Lvh+2eA==
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 125509273
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
X-ThreatScanner-Verdict: Negative
IronPort-Data: A9a23:9VNr0qsNzeTluX89C7THC199p+fnVEleMUV32f8akzHdYApBsoF/q
 tZmKT2HOavca2SkfYolb4u2oRxUuZLcndNmTgI9rXw1RC1A+JbJXdiXEBz9bniYRiHhoOCLz
 O1FM4Wdc5pkJpP4jk3wWlQ0hSAkjclkfpKlVaicfHg3HFc4IMsYoUoLs/YjhYJ1isSODQqIu
 Nfjy+XSI1bg0DNvWo4uw/vrRChH4rKq4lv0gnRkPaoQ5A6HyiFPZH4iDfrZw0XQE9E88tGSH
 44v/JnhlkvF8hEkDM+Sk7qTWiXmlZaLYGBiIlIPM0STqkAqSh4ai87XB9JFAatjsB2bnsgZ9
 Tl4ncfYpTHFnEH7sL91vxFwS0mSNEDdkVPNCSDXXce7lyUqf5ZwqhnH4Y5f0YAwo45K7W9yG
 fMwFG5KQRCzhuWM+7/lccdt2t96cJXIBdZK0p1g5Wmx4fcORJnCR+PB5MNC3Sd2jcdLdRrcT
 5NHM3w1Nk2GOkARfA5NU/rSn8/x7pX7WxRepEiYuuwc5G/LwRYq+LPsLMDUapqBQsA9ckOw/
 zibojyoWE5BXDCZ4WWc1VHrhubxpHPicrw2SJmm9r0wjXTGkwT/DzVJDADm8JFVkHWWS99Zb
 kAZ5Ccqhawz71CwCMnwWQWip3yJtQJaXMBfe8U44gyQzqvf4y6CG3MJCDVGbbQOq8seVTEsk
 FiTkLvU6SdH6ePPDyjHr/HN8G30YHJORYMfWcMaZTdbpPbjkIA0tCnCEO1NEfKu14GpOgill
 lhmsxMCr7kUiMcK0YCy8lbGny+gq/D1c+Il2unEdjn7t10kPeZJc6TtsAGGtqgYcO51W3Hb5
 BA5d96iAPfi5H1nvAiEW60zEb6g/J5p2xWM0Ac0T/HNG9lAkkNPnLy8AhkkdC+F0e5eI1cFh
 XM/XisIv/du0IOCN/MfXm5II51CIVLcPdrkTOvISdFFf4J8cgSKlAk3Ox/Mhjm0zBh0yv1nU
 Xt+TSpKJSxKYUiA5GDqL9rxLJdxnnxurY8tbc+TI+ubPUq2OyfOFOZt3KqmZeEl9qKUyDg5A
 P4GX/ZmPy53CbWkCgGOqN57ELz/BSRjbXwAg5ANJ7Hrz8sPMD1JNsI9Npt6J9Q/xf0EzLaYl
 px/M2cBoGfCabT8AV3iQhhehHnHB/6TcVpT0fQQAGuV
IronPort-HdrOrdr: A9a23:I5YfkaB7wNnMRxflHemW55DYdb4zR+YMi2TDgXoBLiC9Ffbo9P
 xG/c566faasl0ssR0b8+xoW5PgfZq/z/FICNIqTNOftWDd0QOVxedZgLcKqAePJ8SRzIJgPQ
 gLSdkZNDVdZ2IK7/oTQWODYrMd/OU=
X-Talos-CUID: =?us-ascii?q?9a23=3AnMSP/Wl0Ss/lLHOtALZFCWPi+zHXOUGDi1jQE06?=
 =?us-ascii?q?/M11kFoa7SAOLof84sPM7zg=3D=3D?=
X-Talos-MUID: =?us-ascii?q?9a23=3A7h0LEg6NdKM0iDV68lCoC3T4xow3+oONT0AEr6x?=
 =?us-ascii?q?WouO6EXBUJTfe1jmeF9o=3D?=
X-IronPort-AV: E=Sophos;i="6.02,149,1688443200"; 
   d="scan'208";a="125509273"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<jbeulich@suse.com>, Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, Wei Liu
	<wl@xen.org>
Subject: [PATCH 1/9] x86/spec-ctrl: Fix confusion between SPEC_CTRL_EXIT_TO_XEN{,_IST}
Date: Fri, 15 Sep 2023 16:00:30 +0100
Message-ID: <20230915150038.602577-2-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230915150038.602577-1-andrew.cooper3@citrix.com>
References: <20230915150038.602577-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

c/s 3fffaf9c13e9 ("x86/entry: Avoid using alternatives in NMI/#MC paths")
dropped the only user, leaving behind the (incorrect) implication that Xen had
split exit paths.

Delete the unused SPEC_CTRL_EXIT_TO_XEN and rename SPEC_CTRL_EXIT_TO_XEN_IST
to SPEC_CTRL_EXIT_TO_XEN for consistency.

No functional change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
Reviewed-by: Jan Beulich <jbeulich@suse.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>

v2:
 * Tweak comment.
---
 xen/arch/x86/include/asm/spec_ctrl_asm.h | 10 ++--------
 xen/arch/x86/x86_64/entry.S              |  2 +-
 2 files changed, 3 insertions(+), 9 deletions(-)

diff --git a/xen/arch/x86/include/asm/spec_ctrl_asm.h b/xen/arch/x86/include/asm/spec_ctrl_asm.h
index f48f9e75e8dc..cfba35560333 100644
--- a/xen/arch/x86/include/asm/spec_ctrl_asm.h
+++ b/xen/arch/x86/include/asm/spec_ctrl_asm.h
@@ -67,7 +67,6 @@
  *  - SPEC_CTRL_ENTRY_FROM_PV
  *  - SPEC_CTRL_ENTRY_FROM_INTR
  *  - SPEC_CTRL_ENTRY_FROM_INTR_IST
- *  - SPEC_CTRL_EXIT_TO_XEN_IST
  *  - SPEC_CTRL_EXIT_TO_XEN
  *  - SPEC_CTRL_EXIT_TO_PV
  *
@@ -256,11 +255,6 @@
     ALTERNATIVE "", __stringify(DO_SPEC_CTRL_ENTRY maybexen=1),         \
         X86_FEATURE_SC_MSR_PV
 
-/* Use when exiting to Xen context. */
-#define SPEC_CTRL_EXIT_TO_XEN                                           \
-    ALTERNATIVE "",                                                     \
-        DO_SPEC_CTRL_EXIT_TO_XEN, X86_FEATURE_SC_MSR_PV
-
 /* Use when exiting to PV guest context. */
 #define SPEC_CTRL_EXIT_TO_PV                                            \
     ALTERNATIVE "",                                                     \
@@ -327,8 +321,8 @@ UNLIKELY_DISPATCH_LABEL(\@_serialise):
     UNLIKELY_END(\@_serialise)
 .endm
 
-/* Use when exiting to Xen in IST context. */
-.macro SPEC_CTRL_EXIT_TO_XEN_IST
+/* Use when exiting to Xen context. */
+.macro SPEC_CTRL_EXIT_TO_XEN
 /*
  * Requires %rbx=stack_end
  * Clobbers %rax, %rcx, %rdx
diff --git a/xen/arch/x86/x86_64/entry.S b/xen/arch/x86/x86_64/entry.S
index 81dd2c74b876..a1c860f56949 100644
--- a/xen/arch/x86/x86_64/entry.S
+++ b/xen/arch/x86/x86_64/entry.S
@@ -673,7 +673,7 @@ UNLIKELY_START(ne, exit_cr3)
 UNLIKELY_END(exit_cr3)
 
         /* WARNING! `ret`, `call *`, `jmp *` not safe beyond this point. */
-        SPEC_CTRL_EXIT_TO_XEN_IST /* Req: %rbx=end, Clob: acd */
+        SPEC_CTRL_EXIT_TO_XEN     /* Req: %rbx=end, Clob: acd */
 
         RESTORE_ALL adj=8
         iretq
-- 
2.30.2


