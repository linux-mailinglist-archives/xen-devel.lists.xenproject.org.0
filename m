Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9298A7F16C0
	for <lists+xen-devel@lfdr.de>; Mon, 20 Nov 2023 16:10:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.637039.992733 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r55un-0006gx-OC; Mon, 20 Nov 2023 15:10:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 637039.992733; Mon, 20 Nov 2023 15:10:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r55un-0006eo-K3; Mon, 20 Nov 2023 15:10:21 +0000
Received: by outflank-mailman (input) for mailman id 637039;
 Mon, 20 Nov 2023 15:10:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Uh/B=HB=citrix.com=prvs=681f0548f=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1r55um-0006ei-98
 for xen-devel@lists.xenproject.org; Mon, 20 Nov 2023 15:10:20 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e949a97e-87b6-11ee-9b0e-b553b5be7939;
 Mon, 20 Nov 2023 16:10:17 +0100 (CET)
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
X-Inumbo-ID: e949a97e-87b6-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1700493017;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=kC7RdHcgu6U8n1RbkgbqsUC2zwXH5BRBvYDFx3KLDeA=;
  b=Vq6PY11yNxLyDbBk1QS7akt48wIeOcZHtmDCilEstY8zffKUF1OoUEPV
   8DCstNiRkSveu684XXndyBGvvOjZxqZtprzTzkhdBUDY0knS/ntF7cTHw
   VIj3CaR+UKOoNZG1lV0sVI13HA+P9FVEyCjja+09CvnGngnIIh/BPuUip
   M=;
X-CSE-ConnectionGUID: WSSa2cKdS7GG7jOciW9hCg==
X-CSE-MsgGUID: Cs/Z1UAWQSmA9ZEYytm8gg==
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 128209282
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.159.70
X-Policy: $RELAYED
X-ThreatScanner-Verdict: Negative
IronPort-Data: A9a23:Y3rw7Kmj+VNngUwd8IyI4QTo5gzCJkRdPkR7XQ2eYbSJt1+Wr1Gzt
 xJMXTuFbvqLZ2SmL49+YI22oxwPscDcxoRqSwo5qy03EyMWpZLJC+rCIxarNUt+DCFhoGFPt
 JxCN4aafKjYaleG+39B55C49SEUOZmgH+e6UKicfHkpGWeIcQ954Tp7gek1n4V0ttawBgKJq
 LvartbWfVSowFaYCEpNg064gE0p5KiaVA8w5ARkPqkS5geGzRH5MbpETU2PByqgKmVrNrbSq
 9brlNmR4m7f9hExPdKp+p6TnpoiG+O60aCm0xK6aoD66vRwjnVaPpUTbZLwXXx/mTSR9+2d/
 f0W3XCGpaXFCYWX8AgVe0Ew/yiTpsSq8pefSZS0mZT7I0Er7xIAahihZa07FdRwxwp5PY1B3
 cMjEzlXZTOPvL2Z7+25beJtuZUjB8a+aevzulk4pd3YJfMvQJSFSKTW/95Imjw3g6iiH96HO
 ZBfM2A2Kk2dMlsQYj/7C7pn9AusrlD5fydVtxS+oq0v7nKI5AdwzKLsIJzefdniqcB9xxzI/
 DqXpTSjav0cHPeEjgjcz1uTv9TKtHLJdbMDCLjo+fE/1TV/wURMUUZLBDNXu8KRmkO4Ht5SN
 UEQ0i4vtrQpslymSMHnWB+1q2LCuQQTM/JyOeAn7ACGyoLP/h2UQGMDS1Zpd9gOpMIwAzsw2
 Te0c8jBXGI19ufPEDTEq+bS8mva1TUpwXEqWhQ/RFEOwNXY/64c0RDoRddcQa6egYigcd3v+
 AxmvBTSlp1K0pZTi/3qowCX6w9AsKQlWeLc2+k2Yo5GxlkgDGJdT9b0gWU3FN4ZRGpjcnGPv
 WIfh++V5/0UAJeGmUSlGbpVRO3wt6fYbmGG2jaD+qXNEBz3oxaekX14umkidC+FzO5ZEdMWX
 KMjkVwIv8ICVJdbRaR2f5iwG6wXIVvITLzYugTvRoMWOPBZLVbXlByCkGbMhwgBZmBwy/BgU
 XpaGO7wZUsn5VNPlmvrHbxFi+RymkjTBwr7HPjG8vhu6pLGDFb9dFvPGALmgjwRhE9cnDjoz
 g==
IronPort-HdrOrdr: A9a23:kdga36vwahorckdNqtHhhGj77skDctV00zEX/kB9WHVpm5qj5q
 STdZUgtSMc5wx7ZJhNo7q90cq7IE80l6Qb3WBLB8bGYOCOggLBEGgF1+bfKlbbdREWmNQw6U
 /OGZIOb+EZoTJB/KXHCKjTKadD/OW6
X-Talos-CUID: =?us-ascii?q?9a23=3AtkR1BWnb+zRn2rN5yi0PQ5jUpsHXOULm936KKGy?=
 =?us-ascii?q?0MjlGZ+KXblSRx/JkuMU7zg=3D=3D?=
X-Talos-MUID: =?us-ascii?q?9a23=3AOpGYwA6tAxNoc3TDGE8vSUF4xoxD+OOcUX0krqw?=
 =?us-ascii?q?9vuDVBwFBKiuY3Du4F9o=3D?=
X-IronPort-AV: E=Sophos;i="6.04,214,1695700800"; 
   d="scan'208";a="128209282"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, Wei Liu <wl@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH] x86/ioapic: Check 1k alignment for IO-APIC physical addresses
Date: Mon, 20 Nov 2023 15:10:06 +0000
Message-ID: <20231120151006.168773-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

The MP spec requires a minimum of 1k alignment.  So too does Xen's use of a
single fixmap page to map the IO-APIC.

Reject out-of-spec values so we don't end up in a position where a bad
firmware value causes Xen to use the wrong mapping.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Wei Liu <wl@xen.org>
CC: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/arch/x86/io_apic.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/xen/arch/x86/io_apic.c b/xen/arch/x86/io_apic.c
index 0ef61fb2f167..db1ea6e2f2ca 100644
--- a/xen/arch/x86/io_apic.c
+++ b/xen/arch/x86/io_apic.c
@@ -2589,10 +2589,11 @@ static void __init ioapic_init_mappings(void)
         union IO_APIC_reg_01 reg_01;
         paddr_t ioapic_phys = mp_ioapics[i].mpc_apicaddr;
 
-        if ( !ioapic_phys )
+        if ( !ioapic_phys || (ioapic_phys & (KB(1) - 1)) )
         {
             printk(KERN_ERR
-                   "WARNING: bogus zero IO-APIC address found in MPTABLE, disabling IO/APIC support!\n");
+                   "WARNING: bogus IO-APIC address %08lx found in MPTABLE, disabling IO/APIC support!\n",
+                   ioapic_phys);
             smp_found_config = false;
             skip_ioapic_setup = true;
             break;
-- 
2.30.2


