Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DE257F1D9D
	for <lists+xen-devel@lfdr.de>; Mon, 20 Nov 2023 20:58:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.637178.992972 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r5AP6-0005gW-Ct; Mon, 20 Nov 2023 19:57:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 637178.992972; Mon, 20 Nov 2023 19:57:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r5AP6-0005dL-9e; Mon, 20 Nov 2023 19:57:56 +0000
Received: by outflank-mailman (input) for mailman id 637178;
 Mon, 20 Nov 2023 19:57:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Uh/B=HB=citrix.com=prvs=681f0548f=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1r5AP4-0005dF-N5
 for xen-devel@lists.xenproject.org; Mon, 20 Nov 2023 19:57:54 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 15dc2a2f-87df-11ee-98e0-6d05b1d4d9a1;
 Mon, 20 Nov 2023 20:57:52 +0100 (CET)
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
X-Inumbo-ID: 15dc2a2f-87df-11ee-98e0-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1700510273;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=F6BE6DaO5RCJ4Mf3DMA5G4hQDI/leLhW7ZDBWzAUaRk=;
  b=XDpoA+DSbS2qDl3dIY64Izjb1C6YTpejZXZxlnMVLhYr4aVZk4eC00jK
   sKk2BHUVt4F1GGiTIRB3FcwWSDxeEDY3WXYYTbtd9a+tqJP5d+mAg25zC
   j7wBKY9JrF+6TS2sRM+TLxgYH9F4JCAHSH0GFYvI6EPUCLIx/O/9l+JEW
   c=;
X-CSE-ConnectionGUID: kjzKOmX4SNKP/2gCI6xsCQ==
X-CSE-MsgGUID: 3lbetMM1Sey0UmOSQKOILA==
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 126789176
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.159.70
X-Policy: $RELAYED
X-ThreatScanner-Verdict: Negative
IronPort-Data: A9a23:YyIhh6wLh8tITZtt4tR6t+d+xirEfRIJ4+MujC+fZmUNrF6WrkVRx
 mQaCGvVb/uINjemKN9wbo3l/BwF7cTcy9dhTFFrrSAxQypGp/SeCIXCJC8cHc8wwu7rFxs7s
 ppEOrEsCOhuExcwcz/0auCJQUFUjPzOHvykTrecZkidfCc8IA85kxVvhuUltYBhhNm9Emult
 Mj75sbSIzdJ4RYtWo4vw/zF8E8HUMja4mtC5QVnP6gT5jcyqlFOZH4hDfDpR5fHatE88t6SH
 47r0Ly/92XFyBYhYvvNfmHTKxBirhb6ZGBiu1IOM0SQqkEqSh8ai87XAME0e0ZP4whlqvgqo
 Dl7WT5cfi9yVkHEsLx1vxC1iEiSN4UekFPMCSDXXcB+UyQq2pYjqhljJBheAGEWxgp4KWJM5
 98/LQBRVTagv6Xsz5maFPl3rf12eaEHPKtH0p1h5TTQDPJgSpHfWaTao9Rf2V/chOgXQ6yYP
 ZBAL2MyPVKfO3WjOX9OYH46tM6uimPybHtzr1WNqLBsy2PS0BZwwP7mN9+9ltmiHJ8LwRbJ/
 z2Yl4j/KkoePtGD7B/cyX+93tLKuhjCe6UzMJTto5aGh3XMnzdOWXX6T2CTsfS/z0KzRd9bA
 0gV4TY167g/8lSxSdvwVAH+p2SL1jY+cddNF+wx6CmW17HZpQ2eAwAsUTppeNEg8sgsSlQXO
 kShxo2zQ2Y16fvMFCPbqe/8QS6O1TY9Lm0QRggBfVc+xfrb59s8pTORXs1IKfvg5jHqIg0c0
 wxmvQBn2O1L0Z9VjfzllW0rlQ5AsXQgc+LU2uk0djj8hu+BTNT5D7FEEHCChRq6EK6XT0Oao
 F8PkNWE4eYFAPmlzXPVGLhVQev1vq/ablUwZGKD+bF7r1xBHFb5JehtDMxWfh81Yq7ohxe1C
 KMshe+hzMAKZyb7BUOGS4mwF94r3cDd+SfND5jpgi51SsEpLmevpXg+DXN8KkixyCDAZ4ljY
 8bEGSttZF5GYZlaIM2eHr9Gjed7mXhhlAs+h/nTlnya7FZXX1bNIZ9tDbdERrlRAH+syOkNz
 +tiCg==
IronPort-HdrOrdr: A9a23:nGXQp6tZk8o6ZyIaTLggQj/E7skDetV00zEX/kB9WHVpmszxra
 6TdZMgpHjJYVcqKRUdcL+7WJVoLUmxyXcX2/h1AV7BZniEhILAFugLhuGO/9SJIVyZygc378
 ZdmsZFZ+EYdWIK7/rH3A==
X-Talos-CUID: 9a23:hKlj/mDFF/5GJG36Eypl5m0zH/B5SVv+9DCKLGSZV3ZyY4TAHA==
X-Talos-MUID: 9a23:MhvKPgt56eeduGd6a82n3zVoOdtNxv2VBVFVrJAhgPCnEg1UEmLI
X-IronPort-AV: E=Sophos;i="6.04,214,1695700800"; 
   d="scan'208";a="126789176"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH] x86/entry: Use 32bit XOR in handle_ist_exception
Date: Mon, 20 Nov 2023 19:57:42 +0000
Message-ID: <20231120195742.1343677-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

This is a micro-optimsiation for Silvermont microarchitectures, which don't
recognise the 64bit form as a zeroing idiom.

No functional change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>
---
 xen/arch/x86/x86_64/entry.S | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/arch/x86/x86_64/entry.S b/xen/arch/x86/x86_64/entry.S
index b53d862089d7..cb794167c127 100644
--- a/xen/arch/x86/x86_64/entry.S
+++ b/xen/arch/x86/x86_64/entry.S
@@ -1027,7 +1027,7 @@ handle_ist_exception:
          * Interrupted guest context. Clear the restore value for xen_cr3
          * and copy the context to stack bottom.
          */
-        xor   %r15, %r15
+        xor   %r15d, %r15d
         xor   %ebx, %ebx
         GET_CPUINFO_FIELD(guest_cpu_user_regs,di)
         movq  %rsp,%rsi

base-commit: fa2da5bce90b3777aa7a323e1cf201c97b56d278
prerequisite-patch-id: a9e4e1e34d08e876d1fcb3299c6d563086768722
prerequisite-patch-id: 703590f2c99382f6509c94bb5955f47ab2d7c57d
-- 
2.30.2


