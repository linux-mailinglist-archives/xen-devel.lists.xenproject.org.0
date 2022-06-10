Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 96E98546A0B
	for <lists+xen-devel@lfdr.de>; Fri, 10 Jun 2022 18:01:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.346545.572374 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nzh4q-00024C-Or; Fri, 10 Jun 2022 16:01:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 346545.572374; Fri, 10 Jun 2022 16:01:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nzh4q-00021J-LL; Fri, 10 Jun 2022 16:01:36 +0000
Received: by outflank-mailman (input) for mailman id 346545;
 Fri, 10 Jun 2022 16:01:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kdog=WR=citrix.com=prvs=1535499d8=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1nzh4o-00021D-SU
 for xen-devel@lists.xenproject.org; Fri, 10 Jun 2022 16:01:34 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9832fcbb-e8d6-11ec-8901-93a377f238d6;
 Fri, 10 Jun 2022 18:01:33 +0200 (CEST)
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
X-Inumbo-ID: 9832fcbb-e8d6-11ec-8901-93a377f238d6
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1654876893;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=op65nTiNWEctpESvJ1znCak+8HQylj25GiEsv3WGy1Q=;
  b=eW/j5tFSqU6/iTIIjKBvkP/JiENYlPfQSsyCjb7Qj4Pc3KQoYflcxiPT
   M6rT2W29+WJqjDgTptipum+eGxZDB3zmZxYssuyYeTcWRhEetwn3gg4FV
   +Cbf9WKHAQO++TUb8bimoYLVWlF3IN4B1howkSqvyXBGINeehz4IXMDXa
   g=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 5.1
X-MesageID: 73179186
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:8TnnD61UWZFSHXz/NvbD5YJxkn2cJEfYwER7XKvMYLTBsI5bp2FRx
 mAaXW/XM66PMWf1ftF2YYi38R8Hu5PWm4IwGgtrpC1hF35El5HIVI+TRqvS04J+DSFhoGZPt
 Zh2hgzodZhsJpPkjk7xdOCn9xGQ7InQLlbGILes1htZGEk1EU/NtTo5w7Rj2tAx2YDja++wk
 YiaT/P3aQfNNwFcagr424rbwP+4lK2v0N+wlgVWicFj5DcypVFMZH4sDfjZw0/DaptVBoaHq
 9Prl9lVyI97EyAFUbtJmp6jGqEDryW70QKm0hK6UID66vROS7BbPg/W+5PwZG8O4whlkeydx
 /1HpZ+/DgMPIpTHo8cdWSBhSn8vJf1ZreqvzXiX6aR/zmXDenrohf5vEFs3LcsT/eMf7WNmr
 KJCbmpXN1ba2rzwkOnTpupE36zPKOHCOo8Ft24m5jbeFfs8GrjIQrnQ5M8e1zA17ixLNamFP
 pVIMGoxBPjGSwFQIlsdFrIQoMelmWe8IhsDpgqSjLVitgA/yyQuieOwYbI5YOeiWsF9jkue4
 GXc8AzRIDsXKdiewjqt6W+3i6nEmiaTcJIfEvi0++BnhHWXx3cPE1sGWF2ju/67h0WiHdVFJ
 CQpFjEG9PZoshbxF5+kAkP+8CXsUgMgt8R4Gf0550aJ7Lbt6D26BmI9d2cfOcR2q5pjLdA17
 WNlj+8FFBQ27uDJGSjArevKxd+hEXNLdDFfPEfoWSNAuoC++99r03ojW/45SMaIYsvJ9SYcK
 txghAw3nP0tgMECzM1XFniX0mv39vAlouPYjzg7v15JDSsjPeZJn6TytTDmAQ9ode51tGWps
 nkegNS55+sTF5yLnyHlaLxTQe32tqfbb2eH2wAH83wdG9OFqhaekX14umkidC+FzO5fEdMWX
 KMjkVwIv8ICVJdbRaR2f5iwG6wX8EQULvy8Dqq8RoMXOvBZLVbblAkzNBX49z28zyARfVQXZ
 M7znTCEVi5KV8yKDVOeGo8g7FPc7npnmDuNFMmllk7PPHj3TCf9dIrp+WCmNogRhJ5oai2Om
 zqDH6NmEylibdA=
IronPort-HdrOrdr: A9a23:c0scnar+YKFyfZEeu0JCn/caV5oneYIsimQD101hICG8cqSj+f
 xG+85rsiMc6QxhPE3I9urhBEDtex/hHP1OkOws1NWZLWrbUQKTRekIh+bfKlXbakvDH4VmtJ
 uIHZIQNDSJNykZsfrH
X-IronPort-AV: E=Sophos;i="5.91,290,1647316800"; 
   d="scan'208";a="73179186"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH] x86/spec-ctrl: More MSR_ARCH_CAPS enumerations
Date: Fri, 10 Jun 2022 17:00:50 +0100
Message-ID: <20220610160050.24221-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

https://www.intel.com/content/www/us/en/developer/articles/technical/software-security-guidance/best-practices/data-operand-independent-timing-isa-guidance.html
https://www.intel.com/content/www/us/en/developer/articles/technical/software-security-guidance/advisory-guidance/running-average-power-limit-energy-reporting.html

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>

The SDM also lists

  #define  ARCH_CAPS_OVERCLOCKING_STATUS      (_AC(1, ULL) << 23)

but I've got no idea what this is, nor the index of MSR_OVERCLOCKING_STATUS
which is the thing allegedly enumerated by this.
---
 xen/arch/x86/include/asm/msr-index.h | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/xen/arch/x86/include/asm/msr-index.h b/xen/arch/x86/include/asm/msr-index.h
index 6c250bfcadad..781584953654 100644
--- a/xen/arch/x86/include/asm/msr-index.h
+++ b/xen/arch/x86/include/asm/msr-index.h
@@ -51,6 +51,9 @@
 #define  PPIN_ENABLE                        (_AC(1, ULL) <<  1)
 #define MSR_PPIN                            0x0000004f
 
+#define MSR_MISC_PACKAGE_CTRL               0x000000bc
+#define  PGK_CTRL_ENERGY_FILTER_EN          (_AC(1, ULL) <<  0)
+
 #define MSR_CORE_CAPABILITIES               0x000000cf
 #define  CORE_CAPS_SPLITLOCK_DETECT         (_AC(1, ULL) <<  5)
 
@@ -71,6 +74,9 @@
 #define  ARCH_CAPS_IF_PSCHANGE_MC_NO        (_AC(1, ULL) <<  6)
 #define  ARCH_CAPS_TSX_CTRL                 (_AC(1, ULL) <<  7)
 #define  ARCH_CAPS_TAA_NO                   (_AC(1, ULL) <<  8)
+#define  ARCH_CAPS_MISC_PACKAGE_CTRL        (_AC(1, ULL) << 10)
+#define  ARCH_CAPS_ENERGY_FILTERING         (_AC(1, ULL) << 11)
+#define  ARCH_CAPS_DOITM                    (_AC(1, ULL) << 12)
 #define  ARCH_CAPS_RRSBA                    (_AC(1, ULL) << 19)
 #define  ARCH_CAPS_BHI_NO                   (_AC(1, ULL) << 20)
 
@@ -149,6 +155,9 @@
 #define  PASID_PASID_MASK                   0x000fffff
 #define  PASID_VALID                        (_AC(1, ULL) << 31)
 
+#define MSR_UARCH_MISC_CTRL                 0x00001b01
+#define  UARCH_CTRL_DOITM                   (_AC(1, ULL) <<  0)
+
 #define MSR_EFER                            0xc0000080 /* Extended Feature Enable Register */
 #define  EFER_SCE                           (_AC(1, ULL) <<  0) /* SYSCALL Enable */
 #define  EFER_LME                           (_AC(1, ULL) <<  8) /* Long Mode Enable */
-- 
2.11.0


