Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BAA7F72CF73
	for <lists+xen-devel@lfdr.de>; Mon, 12 Jun 2023 21:28:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.547432.854818 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q8nD7-0002Oi-HP; Mon, 12 Jun 2023 19:28:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 547432.854818; Mon, 12 Jun 2023 19:28:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q8nD7-0002La-E9; Mon, 12 Jun 2023 19:28:17 +0000
Received: by outflank-mailman (input) for mailman id 547432;
 Mon, 12 Jun 2023 19:28:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=abQ6=CA=citrix.com=prvs=520cb9a4c=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1q8nD5-0002LU-DA
 for xen-devel@lists.xenproject.org; Mon, 12 Jun 2023 19:28:15 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4384a7a6-0957-11ee-8611-37d641c3527e;
 Mon, 12 Jun 2023 21:28:11 +0200 (CEST)
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
X-Inumbo-ID: 4384a7a6-0957-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1686598091;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=CjDa00JyUB3y6d9rXT65oqYEJu+SU2T9jQFj4rNQcYU=;
  b=ULCRH5NjhmzIqTqBwDg+ZghomNCUU4+Ey6u42LH3Ol0h99iGtNUUL7KI
   U7UXPxhnlmAQoPa4UHNME0d+absYlv7Ome0ZfR70MGFfJkepv9MKlhyyN
   PLZXwDxNOSJYbpgatTOb9AEYCVVhBJko4K9BcrESTs6RKpkwplN17dBxT
   0=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 112397782
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:8PUAq6nEfIvaGmnrcTOERHTo5gyHJkRdPkR7XQ2eYbSJt1+Wr1Gzt
 xIeUT2FPq6LMzDweYx3b97io0IH75aDxtViSVQ9+X0zESMWpZLJC+rCIxarNUt+DCFhoGFPt
 JxCN4aafKjYaleG+39B55C49SEUOZmgH+a6U6icfHgqH2eIcQ954Tp7gek1n4V0ttawBgKJq
 LvartbWfVSowFaYCEpNg064gE0p5KyaVA8w5ARkPqgV5QWGzRH5MbpETU2PByqgKmVrNrbSq
 9brlNmR4m7f9hExPdKp+p6TnpoiG+O60aCm0xK6aoD66vRwjnVaPpUTbZLwXXx/mTSR9+2d/
 f0W3XCGpaXFCYWX8AgVe0Ew/yiTpsSq8pefSZS0mZT7I0Er7xIAahihZa07FdRwxwp5PY1B3
 cVFdmEdMR+Hu/mNmaq5Dcg0jdV+I/C+aevzulk4pd3YJfMvQJSFSKTW/95Imjw3g6iiH96HO
 ZBfM2A2Kk2dPVsWYAx/5JEWxY9EglHWdTFCpU3Tjq0w+2XJlyR60aT3McqTcduPLSlQth/B/
 DmXoDupWHn2MvSwyj6Oziixl9bRvgn2c44WHYS7+t9D1Qj7Kms7V0RNCArTTeOCol6zXZdTJ
 lIZ/gIqrLMu7wq7Q9/lRRq6rXWY+BkGVLJ4Mcc39QWMwar8+BuCCy4PSTspQMMinN87Q3otz
 FDhoj/yLWUx6vvPEyvbr+rK62roYkD5MFPuewc9EFVU84bspL0otUvXTJFCSKWk09LMTGSYL
 y+xkMQuu1kCpZdVh/vhrQuc0m/ESovhFVBsuFiONo6xxkYgPdP+OdT1gbTOxawYRLt1WGVtq
 5TtdyK2yOkVRa+AmyWWKAnmNOH4vq3VWNEwbLMGInXAy9hO0yT5FWyoyGsiTHqFy+5dEdMTX
 GfduBlK+LhYN2awYKl8buqZUpp6k/WxSYu+B6yEN7Kih6SdkifdpEmCgmbKhgjQfLUEy/lja
 f93j+7xZZrlNUiX5GXvHLpMuVPa7is/2XnSVfjGI+ePiNKjiIquYe5dajOmN7lphJ5oVS2Jq
 76zwePWkUQAOAA/CwGLmbMuwacifCViWsqq+5E/myzqClMOJVzNwsT5mdsJE7GJVYwM/gsU1
 hlRgnNl9Wc=
IronPort-HdrOrdr: A9a23:SP9xSah7bgJ8SYx2OLrUd+7YIXBQXtYji2hC6mlwRA09TySZ//
 rBoB19726StN9xYgBFpTnuAsm9qB/nmaKdgrNhWItKPjOW21dARbsKheCJrgEIcxeOkNK1vp
 0AT0ERMrLN5CBB/KTH3DU=
X-Talos-CUID: 9a23:EPTn62//DxziW1Pke3qVv3dJRJE1LXLZ8Gzrele6TkcxQ6zIRmbFrQ==
X-Talos-MUID: =?us-ascii?q?9a23=3AnhYzWw9AHjkWQ9uIW6BMwHSQf+hr56+SUl0cqIs?=
 =?us-ascii?q?lkcSvOSh5AjSRrR3iFw=3D=3D?=
X-IronPort-AV: E=Sophos;i="6.00,236,1681185600"; 
   d="scan'208";a="112397782"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH] x86/spec-ctrl: Fix the rendering of FB_CLEAR
Date: Mon, 12 Jun 2023 20:28:05 +0100
Message-ID: <20230612192805.2904128-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

FB_CLEAR is a read-only status bit, not a read-write control.  Move it from
"Hardware features" into "Hardware hints".

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>
---
 xen/arch/x86/spec_ctrl.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/xen/arch/x86/spec_ctrl.c b/xen/arch/x86/spec_ctrl.c
index cd5ea6aa52d9..ec4bcdd97e04 100644
--- a/xen/arch/x86/spec_ctrl.c
+++ b/xen/arch/x86/spec_ctrl.c
@@ -409,7 +409,7 @@ static void __init print_details(enum ind_thunk thunk)
      * Hardware read-only information, stating immunity to certain issues, or
      * suggestions of which mitigation to use.
      */
-    printk("  Hardware hints:%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s\n",
+    printk("  Hardware hints:%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s\n",
            (caps & ARCH_CAPS_RDCL_NO)                        ? " RDCL_NO"        : "",
            (caps & ARCH_CAPS_EIBRS)                          ? " EIBRS"          : "",
            (caps & ARCH_CAPS_RSBA)                           ? " RSBA"           : "",
@@ -422,6 +422,7 @@ static void __init print_details(enum ind_thunk thunk)
            (caps & ARCH_CAPS_SBDR_SSDP_NO)                   ? " SBDR_SSDP_NO"   : "",
            (caps & ARCH_CAPS_FBSDP_NO)                       ? " FBSDP_NO"       : "",
            (caps & ARCH_CAPS_PSDP_NO)                        ? " PSDP_NO"        : "",
+           (caps & ARCH_CAPS_FB_CLEAR)                       ? " FB_CLEAR"       : "",
            (caps & ARCH_CAPS_PBRSB_NO)                       ? " PBRSB_NO"       : "",
            (e8b  & cpufeat_mask(X86_FEATURE_IBRS_ALWAYS))    ? " IBRS_ALWAYS"    : "",
            (e8b  & cpufeat_mask(X86_FEATURE_STIBP_ALWAYS))   ? " STIBP_ALWAYS"   : "",
@@ -431,7 +432,7 @@ static void __init print_details(enum ind_thunk thunk)
            (e8b  & cpufeat_mask(X86_FEATURE_IBPB_RET))       ? " IBPB_RET"       : "");
 
     /* Hardware features which need driving to mitigate issues. */
-    printk("  Hardware features:%s%s%s%s%s%s%s%s%s%s%s%s\n",
+    printk("  Hardware features:%s%s%s%s%s%s%s%s%s%s%s\n",
            (e8b  & cpufeat_mask(X86_FEATURE_IBPB)) ||
            (_7d0 & cpufeat_mask(X86_FEATURE_IBRSB))          ? " IBPB"           : "",
            (e8b  & cpufeat_mask(X86_FEATURE_IBRS)) ||
@@ -447,7 +448,6 @@ static void __init print_details(enum ind_thunk thunk)
            (_7d0 & cpufeat_mask(X86_FEATURE_SRBDS_CTRL))     ? " SRBDS_CTRL"     : "",
            (e8b  & cpufeat_mask(X86_FEATURE_VIRT_SSBD))      ? " VIRT_SSBD"      : "",
            (caps & ARCH_CAPS_TSX_CTRL)                       ? " TSX_CTRL"       : "",
-           (caps & ARCH_CAPS_FB_CLEAR)                       ? " FB_CLEAR"       : "",
            (caps & ARCH_CAPS_FB_CLEAR_CTRL)                  ? " FB_CLEAR_CTRL"  : "");
 
     /* Compiled-in support which pertains to mitigations. */
-- 
2.30.2


