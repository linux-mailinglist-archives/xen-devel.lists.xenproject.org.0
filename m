Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D0187222E9
	for <lists+xen-devel@lfdr.de>; Mon,  5 Jun 2023 12:06:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.543606.848717 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q675X-0007VO-IL; Mon, 05 Jun 2023 10:05:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 543606.848717; Mon, 05 Jun 2023 10:05:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q675X-0007T7-FX; Mon, 05 Jun 2023 10:05:23 +0000
Received: by outflank-mailman (input) for mailman id 543606;
 Mon, 05 Jun 2023 10:05:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wlJc=BZ=citrix.com=prvs=5133c6164=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1q675W-0007T1-3D
 for xen-devel@lists.xenproject.org; Mon, 05 Jun 2023 10:05:22 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7965f96b-0388-11ee-b232-6b7b168915f2;
 Mon, 05 Jun 2023 12:05:19 +0200 (CEST)
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
X-Inumbo-ID: 7965f96b-0388-11ee-b232-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1685959519;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=sHZmzy52mODk8RP/4wDnQfPRlg7zMepu5gP+7ALWel4=;
  b=QmiEs1oUgRDbjuJKq+7ZuFkCepGbD+vHuk+WjU0ugEY05spg1Q0VbVhS
   wmyN7ZTrqsNPpu2F82XTeKpr88l91zDJhoqHq41p5u+ZOWsmIQr3+moSf
   67xcexZbYxETXPIdQ8O7fE/4VLzpRbNTobVdFu6y4IV2aY20ByS/3D/ku
   8=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 110926877
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:XmXfyqgPbCtBb7jTbK/L7OM6X161lBAKZh0ujC45NGQN5FlHY01je
 htvWD+OM/veZ2Pwft11aY+yoxsDuZbWndQ2GgI4pXhhFX8b9cadCdqndUqhZCn6wu8v7q5Ex
 55HNoSfdpBcolv0/ErF3m3J9CEkvU2wbuOgTrWCYmYpHlUMpB4J0XpLg/Q+jpNjne+3CgaMv
 cKai8DEMRqu1iUc3lg8sspvkzsx+qyq0N8klgZmP6sT4geCzyB94K83fsldEVOpGuG4IcbiL
 wrz5OnR1n/U+R4rFuSknt7TGqHdauePVeQmoiM+t5mK2nCulARrukoIHKN0hXNsoyeIh7hMJ
 OBl7vRcf+uL0prkw4zxWzEAe8130DYvFLXveRBTuuTLp6HKnueFL1yDwyjaMKVBktubD12i+
 tQ7ATwnNRbEgdmn+4yJEsc8oZkGIfv0adZ3VnFIlVk1DN4jSJHHBa7L+cVZzHE7gcUm8fT2P
 pRDL2A1NVKZPkMJYw1MYH49tL7Aan3XWjtUsl+K44Ew5HDe1ldZ27nxKtvFPNeNQK25m27B/
 zqXpTqpXU5y2Nq3wmOUznmXo9P1uHnKYJI4BrmR+9lOnwjGroAUIEJPDgbqyRWjsWauVtQaJ
 0EK9y4Gqakp6FftXtT7Rwe/onOPolgbQdU4O88Q5RyJy6HUyx2EHWVCRTlEAPQ9r9M/TzEu0
 l6PnvvqCCZpvbnTTmiSnp+LqRuiNC5TKnUNDQcGUA8E7t/LsIw1yBXVQb5LLqmxidHkHCDq9
 BqDpiM+mrY7gNYC0uOw+lWvqzihvITTRwg5oADeRHu47xhRbZSgIYev7DDmAe1oddjDCAPb5
 T5dxpbYtbpVZX2QqMCTaMYkEJvy4bGDCyznv2w3MckGqhGgyWH2KOi8/wpCDEtuN88Ffxrgb
 0nSpR5d6fdvAZe6UUNkS9nvUpp3lMAMAfygD6mJNYQWPvCdYSfdpElTiVisM3cBeaTGuYU2I
 t+lfMmlFh724ow3nWPtF4/xPVLGrx3SJF8/p7ihlHxLMpLEPhZ5rIvp13PQBt3VFIve/G3oH
 y93bqNmMSl3XuzkeTXw+oUON10MJnVTLcmo+5EGLrXeclY4Rz9J5xrtLVQJIdUNokiovr2Qo
 iHVtrFwljITekEr2S3VMys+OdsDrL50rG4hPDxEALpb8yFLXGpb149GL8FfVeB+pIReIQtcE
 6FtlzOoXq4eFVwqOl01MfHAkWCVXEjz213SZnX5OGNXklwJb1Whx+IItzDHrEEmZhdbf+Nky
 1F8/ms3maY+ejk=
IronPort-HdrOrdr: A9a23:CWvjZaoUEaIldNK+kPKXRioaV5ryeYIsimQD101hICG9E/b1qy
 nKpp8mPHDP5wr5J0tPpTntAsi9qFnnlaKdmLNhXotKBTOW2ldAT7sSiLcKvQeQfxEWrdQtsp
 uIGpIWYOEYa2IK6/oSizPULz9P+rO6GFTDv5am854Ud3ATV0nqhD0JcTpymCZNNXN77SNTLu
 vg2vZ6
X-Talos-CUID: =?us-ascii?q?9a23=3AgEU9Aml+eVr7ShnindVultqNWJ7XOV70wF2LJQi?=
 =?us-ascii?q?+MndSdo/NZw+3pYZpodU7zg=3D=3D?=
X-Talos-MUID: =?us-ascii?q?9a23=3AM/qcPAyRK4imMk98n98+zais7iCaqK/3GXwGqrA?=
 =?us-ascii?q?6gezeBBRgESWZpTmQZpByfw=3D=3D?=
X-IronPort-AV: E=Sophos;i="6.00,217,1681185600"; 
   d="scan'208";a="110926877"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Bertrand Marquis <bertrand.marquis@arm.com>
Subject: [PATCH] xen: Fix incorrect taint constant
Date: Mon, 5 Jun 2023 11:05:12 +0100
Message-ID: <20230605100512.1748007-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Insecure the word being looked for here.  Especially given the nature of the
sole caller, and the (correct) comment next to it.

I've left the taint constant as 'U' as it's a rather more user-visible.

Fixes: 82c0d3d491cc ("xen: Add an unsecure Taint type")
Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Julien Grall <julien@xen.org>
CC: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
CC: Bertrand Marquis <bertrand.marquis@arm.com>

I'm happy to change 'U' to 'I' if we think that no-one is going to be impacted
by it.  I just wasn't sure.
---
 xen/arch/arm/cpuerrata.c | 2 +-
 xen/common/kernel.c      | 2 +-
 xen/include/xen/lib.h    | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/xen/arch/arm/cpuerrata.c b/xen/arch/arm/cpuerrata.c
index 1abacfe5bb67..d0658aedb6aa 100644
--- a/xen/arch/arm/cpuerrata.c
+++ b/xen/arch/arm/cpuerrata.c
@@ -695,7 +695,7 @@ void __init enable_errata_workarounds(void)
                     "**** Only trusted guests should be used.                             ****\n");
 
         /* Taint the machine has being insecure */
-        add_taint(TAINT_MACHINE_UNSECURE);
+        add_taint(TAINT_MACHINE_INSECURE);
     }
 #endif
 }
diff --git a/xen/common/kernel.c b/xen/common/kernel.c
index f7b1f65f373c..14ce6b40ce06 100644
--- a/xen/common/kernel.c
+++ b/xen/common/kernel.c
@@ -354,7 +354,7 @@ char *print_tainted(char *str)
     if ( tainted )
     {
         snprintf(str, TAINT_STRING_MAX_LEN, "Tainted: %c%c%c%c%c%c",
-                 tainted & TAINT_MACHINE_UNSECURE ? 'U' : ' ',
+                 tainted & TAINT_MACHINE_INSECURE ? 'U' : ' ',
                  tainted & TAINT_MACHINE_CHECK ? 'M' : ' ',
                  tainted & TAINT_SYNC_CONSOLE ? 'C' : ' ',
                  tainted & TAINT_ERROR_INJECT ? 'E' : ' ',
diff --git a/xen/include/xen/lib.h b/xen/include/xen/lib.h
index e914ccade095..75ae7489b9f0 100644
--- a/xen/include/xen/lib.h
+++ b/xen/include/xen/lib.h
@@ -201,7 +201,7 @@ uint64_t muldiv64(uint64_t a, uint32_t b, uint32_t c);
 #define TAINT_MACHINE_CHECK             (1u << 1)
 #define TAINT_ERROR_INJECT              (1u << 2)
 #define TAINT_HVM_FEP                   (1u << 3)
-#define TAINT_MACHINE_UNSECURE          (1u << 4)
+#define TAINT_MACHINE_INSECURE          (1u << 4)
 #define TAINT_CPU_OUT_OF_SPEC           (1u << 5)
 extern unsigned int tainted;
 #define TAINT_STRING_MAX_LEN            20

base-commit: 67fdffef9246c82cecd8db28838ed09e79e2528a
-- 
2.30.2


