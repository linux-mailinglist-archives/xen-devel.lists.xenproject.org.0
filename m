Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E71CD581511
	for <lists+xen-devel@lfdr.de>; Tue, 26 Jul 2022 16:24:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.375351.607684 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oGLTi-0006Tc-4y; Tue, 26 Jul 2022 14:24:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 375351.607684; Tue, 26 Jul 2022 14:24:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oGLTi-0006R4-1Z; Tue, 26 Jul 2022 14:24:06 +0000
Received: by outflank-mailman (input) for mailman id 375351;
 Tue, 26 Jul 2022 14:24:04 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=DB1L=X7=citrix.com=prvs=199b7977f=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1oGLTg-0006Qm-8O
 for xen-devel@lists.xenproject.org; Tue, 26 Jul 2022 14:24:04 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 97432ca5-0cee-11ed-924f-1f966e50362f;
 Tue, 26 Jul 2022 16:24:02 +0200 (CEST)
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
X-Inumbo-ID: 97432ca5-0cee-11ed-924f-1f966e50362f
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1658845441;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=HxHygnpvgc7Ss4bF6OSZ6XL9TwL7xK96HAGSXOTqMLI=;
  b=f00ORTTUSGoq52UWPu/6CDpFf34k3E7Zej6/mlbFqt9Ly6pPn6T2RTHr
   bS2nRuGOz+d/g/ftQM8ldq1wZLvjjGpsDyiHB35a4n51UbVJEvFi/zTQE
   eO+HcC4J6JNP/Sh2MObWhmc/5xIt/Qjnj3fuNPj74aoezldYSKF51Uy3L
   s=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 2.7
X-MesageID: 76451401
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:GVHju6xD61E8W3nbwU56t+dexirEfRIJ4+MujC+fZmUNrF6WrkUPm
 DBKDzqFPPjZYTGjKIhwbY3k8BsBuZXWzYNnTAFq/CAxQypGp/SeCIXCJC8cHc8zwu4v7q5Dx
 59DAjUVBJlsFhcwnj/0bv676yEUOZigHtLUEPTDNj16WThqQSIgjQMLs+Mii8tjjMPR7zml4
 LsemOWCfg7+s9JIGjhMsfjb90ky5K6aVA4w5TTSW9ga5DcyqFFNZH4vDfnZB2f1RIBSAtm7S
 47rpF1u1jqEl/uFIorNfofTKiXmcJaLVeS9oiM+t5yZqgpDvkQPPpMTb5LwX6v1ZwKhxLidw
 P0V3XC5pJxA0qfkwIzxWDEAe81y0DEvFBYq7hFTvOTKp3AqfUcAzN1CS3ARDYM2/d9TOllLz
 dMgORICciic0rfeLLKTEoGAh+wmJcjveogepmth3XfSCvNOrZLrGvuQo4UChXFp254ITa22i
 8kxMFKDaDzpZRFVN0hRI5U5hOqy3VH0ciFCqULTrq0yi4TW5FMvjOW0bIKMEjCMbd1qmVvHv
 k38xlu6DQhKBYOjijW6z1v504cjmgukAdlPRdVU7MVCn1m71mEVThoMWjOTg9O0l0q/UNJ3M
 FEP92wlqq1a3FymSJzxUgO1pFaAvwUAQJxAHusi8gaPx6HIpQGDCQA5oiVpMYJ88pVsHHpzi
 wHPz4iB6SFTXKO9ZTWs0YeagzSLHRMtKFctXT4mQhc9/Iy2yG0stS4jXuqPAYbs0IClSWmom
 WvTxMQtr+5N1JBWjs1X6XiC2mvx/caRE2bZ8y2NBgqYAhVFiJlJjmBCwXzS9r5+IYmQVTFtV
 1BUypHFvIji4Xxg/RFhodnh/5nzvp5pyBWG3TZS82AJrlxBAUKLc4FK+y1ZL0x0KMsCcjKBS
 BaN5FMOu8MKbCv1MPEfj2eN5yMClPOIKDgYfqqMMoomjmZZL2drAx2ClWbPhjuwwSDAYIk0O
 IuBcNbEMEv2/Z9PlWPuL89AgOBD+8zL7TmMLXwN50j4jOH2ib/8YettDWZimchitPna+lqEr
 ocAXyZIoj0GONDDjuDs2dZ7BTg3wbITX/gad+Q/mja/Hzdb
IronPort-HdrOrdr: A9a23:ogktEqoFsoa/Q4IKFEz9jUcaV5oneYIsimQD101hICG8cqSj+f
 xG+85rsiMc6QxhPE3I9urhBEDtex/hHP1OkOws1NWZLWrbUQKTRekIh+bfKlXbakvDH4VmtJ
 uIHZIQNDSJNykZsfrH
X-IronPort-AV: E=Sophos;i="5.93,193,1654574400"; 
   d="scan'208";a="76451401"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH] xen/check-endbr.sh: Explain the purpose of the script
Date: Tue, 26 Jul 2022 15:23:28 +0100
Message-ID: <20220726142328.12246-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>
---
 xen/tools/check-endbr.sh | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/xen/tools/check-endbr.sh b/xen/tools/check-endbr.sh
index b97684ac25e9..bf153a570db4 100755
--- a/xen/tools/check-endbr.sh
+++ b/xen/tools/check-endbr.sh
@@ -2,6 +2,15 @@
 #
 # Usage ./$0 xen-syms
 #
+# When CET-IBT (Control-flow Enforcement Technology, Indirect Branch Tracking)
+# is active, ENDBR instructions mark legal indirect branch targets in the
+# .text section.
+#
+# However x86 is a variable length instruction set so the same byte pattern
+# can exist embedded in other instructions, or crossing multiple instructions.
+# This script searches .text for any problematic byte patterns which aren't
+# legitimate ENDBR instructions.
+#
 set -e
 
 # Pretty-print parameters a little for message
-- 
2.11.0


