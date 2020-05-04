Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C5DA11C39D0
	for <lists+xen-devel@lfdr.de>; Mon,  4 May 2020 14:48:35 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jVaW5-0001AC-0I; Mon, 04 May 2020 12:48:13 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SbWK=6S=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1jVaW3-0001A6-Tl
 for xen-devel@lists.xenproject.org; Mon, 04 May 2020 12:48:11 +0000
X-Inumbo-ID: 82b78106-8e05-11ea-b07b-bc764e2007e4
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 82b78106-8e05-11ea-b07b-bc764e2007e4;
 Mon, 04 May 2020 12:48:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1588596491;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=of9Bp0YG2XahqOQbz/YM+020tm4DXyqwFSBcCWLgl3c=;
 b=dBkNoXJqBBieRPVdbDHj6Q5wGktmf3bl+P8rhiHMM1U7wK+BVGfWsG52
 dYbZozwnYJxbSMgppgMJtDf10zGhV35q24pgsdF0X7kDhornycstMQMeC
 sNtOr4/HXiJImT1GBlEnBsaQOiQFDchzgGl1b+5WQTxXG9VTWLWxyODLw k=;
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa3.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: /JSZgeJBN8B6+g9eVWrT5wUa6A+V6EHzivDdQuAznTamy7nFtOybPIWxZwXuys64fD2bDZvocH
 9o/I61CwuckcEWz7H7RCus3C1LldQQc7VuYarJIAEWC/yjK/KHfjOK+Vjao6iBKumxm/U7orYX
 RuAV1R81YcTUFrO1twgNZkPJKhzdn9TtAkjSRTHJ7WygbZue5GgnBOlNoviWSqNIgfJdD2xjrf
 5WE9O+O1NgcMJsuOgBX1cAX6cKIPaeaoOGphoBylOROnnrIoPLTpXhWt1ulDuAEcNz3zT1OMMu
 kQM=
X-SBRS: 2.7
X-MesageID: 16651872
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,352,1583211600"; d="scan'208";a="16651872"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Subject: [PATCH] x86/ucode/intel: Writeback and invalidate caches before
 updating microcode
Date: Mon, 4 May 2020 13:47:52 +0100
Message-ID: <20200504124752.29806-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Wei Liu <wl@xen.org>, Jan Beulich <JBeulich@suse.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

From: Ashok Raj <ashok.raj@intel.com>

Updating microcode is less error prone when caches have been flushed and
depending on what exactly the microcode is updating. For example, some of the
issues around certain Broadwell parts can be addressed by doing a full cache
flush.

Signed-off-by: Ashok Raj <ashok.raj@intel.com>
Signed-off-by: Borislav Petkov <bp@suse.de>
Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
[Linux commit 91df9fdf51492aec9fed6b4cbd33160886740f47, ported to Xen]
Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Wei Liu <wl@xen.org>
CC: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/arch/x86/cpu/microcode/intel.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/xen/arch/x86/cpu/microcode/intel.c b/xen/arch/x86/cpu/microcode/intel.c
index a9f4d6e829..d031196d4c 100644
--- a/xen/arch/x86/cpu/microcode/intel.c
+++ b/xen/arch/x86/cpu/microcode/intel.c
@@ -25,6 +25,7 @@
 #include <xen/init.h>
 
 #include <asm/msr.h>
+#include <asm/system.h>
 
 #include "private.h"
 
@@ -267,6 +268,8 @@ static int apply_microcode(const struct microcode_patch *patch)
     if ( microcode_update_match(patch) != NEW_UCODE )
         return -EINVAL;
 
+    wbinvd();
+
     /* write microcode via MSR 0x79 */
     wrmsrl(MSR_IA32_UCODE_WRITE, (unsigned long)patch->data);
     wrmsrl(MSR_IA32_UCODE_REV, 0x0ULL);
-- 
2.11.0


