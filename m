Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 55F177A5FBA
	for <lists+xen-devel@lfdr.de>; Tue, 19 Sep 2023 12:35:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.604575.942032 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qiY4h-0002jn-HQ; Tue, 19 Sep 2023 10:35:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 604575.942032; Tue, 19 Sep 2023 10:35:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qiY4h-0002hJ-En; Tue, 19 Sep 2023 10:35:23 +0000
Received: by outflank-mailman (input) for mailman id 604575;
 Tue, 19 Sep 2023 10:35:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+GSz=FD=citrix.com=prvs=61920ccf8=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1qiY4f-0002hD-HJ
 for xen-devel@lists.xenproject.org; Tue, 19 Sep 2023 10:35:21 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3a59dfc3-56d8-11ee-8789-cb3800f73035;
 Tue, 19 Sep 2023 12:35:20 +0200 (CEST)
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
X-Inumbo-ID: 3a59dfc3-56d8-11ee-8789-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1695119720;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=zKZCH9nJHrXn1p8XYZtvRYn8I1OYqaz+OOrt3ynG/W8=;
  b=O4zxLHIMNgLIl0WcH1MoRfrNDL5AvgmVkyY9njGnIUA0euWTwom2xEY6
   FgIG3lu/uTDI2HmDxykTBnIcywQalCjGCUI+mnU1UEBNFO8c6D+dGhA0M
   zFSq/0JnClOb+2ES0K31rnqCl/fxT6N6y8QCVunSr8F6X8cF2M8nQzUwJ
   8=;
X-CSE-ConnectionGUID: CLO9MMtsSBqiBvKCKx9uZQ==
X-CSE-MsgGUID: MY3B9KXPRSuXwiQfbJiiKw==
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 122938254
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
X-ThreatScanner-Verdict: Negative
IronPort-Data: A9a23:S8N6h61tAdU/laFkEvbD5cVxkn2cJEfYwER7XKvMYLTBsI5bpz0Oy
 2YZCzvSbP2NYWT3eY9/bI3i8RwB75HcnINqSVFopC1hF35El5HIVI+TRqvS04F+DeWYFR46s
 J9OAjXkBJppJpMJjk71atANlVEliOfQAOK6UbaYUsxIbVcMYD87jh5+kPIOjIdtgNyoayuAo
 tq3qMDEULOf82cc3lk8teTb8nuDgNyo4GlD5g1nNKgR1LPjvyJ94Kw3dPnZw0TQGuG4LsbiL
 87fwbew+H/u/htFIrtJRZ6iLyXm6paLVeS/oiI+t5qK23CulQRrukoPD9IOaF8/ttm8t4sZJ
 OOhF3CHYVxB0qXkwIzxWvTDes10FfUuFLTveRBTvSEPpqFvnrSFL/hGVSkL0YMkFulfKkVpp
 Nk9NCs2RAmCrfyV65GrG/Rev5F2RCXrFNt3VnBIyDjYCbAtQIzZQrWM7thdtNsyrpkQR7CEP
 ZNfMGcxKk2aOHWjOX9OYH46tM6uimPybHtzr1WNqLBsy2PS0BZwwP7mN9+9ltmiHJ8Pzx3I/
 D+al4j/KjQrb/bO6gq9yEmxtvDOpC3xeoMTN6Lto5aGh3XMnzdOWXX6T2CTsfS/z0KzRd9bA
 0gV4TY167g/8lSxSdvwVAH+p2SL1jY+cddNF+wx6CmW17HZpQ2eAwAsUTppeNEg8sgsSlQXO
 kShxo2zQ2Y16fvMFCzbr+3Pxd+vBcQLBUQmQn4haBce2PP6oastrTnsXod+Ipfg27UZBgrM6
 zyNqSE/gZAagsgKy7i38Dj7vt68mnTaZlVrv1uKBwpJ+is8Pdf4PNLwtTA3+N4adO6kok+9U
 G/ociR0xMQHFtmzmSOEW43h95n5tq/eYFUwbbOCdqTNFghBGVb5LOi8Axkkfi+F1/ronhe3C
 HI/QSsLuPdu0IKCNMebmb6ZBcUw1rTHHt/4TP3SZdcmSsEvJVLfons2OBbAjjCFfK0QfUYXY
 83zTCpRJSxCVfQPIMSeF4/xLoPHNghhnDiOFPgXPjys0KaEZW79dFv2GALmUwzN14vd+F+92
 48GZ6O3J+B3DLWWjt//rdRCcjjn7BETWfjLliCgXrXfeVo4RT19U6K5LHFIU9UNopm5X9zgp
 hmVMnK0AnKm7ZEbAW1mskxeVY4=
IronPort-HdrOrdr: A9a23:ukDdjKB73R6kbZ7lHejpsceALOsnbusQ8zAXPiFKOGlom6mj/K
 6TdZsgtSMc9wxhJE3I9ergBEDiewKuyXcK2/hyAV7KZmCP0ldAR7sSjrcKrQeQfhEX/YZmpN
 hdm8AVMrHN5TMRt6nHCMbTKbsd6ejCyYTtodr3i05qSwQCUdAT0++6YDzrbHGfgGN9dOoE/F
 /33Ls3m9PaQwVyUu2LQkMdWvTFpZnijYuOW29+OzcXrDOWiC+u6vrQDxic034lIk5y6IZny3
 HBjwv6ooKqt/3T8G6660bjq65OncfnyJ9kGsuBkaEuW1PRozftXp1lR7qB+AoUjYiUmS4Xue
 iJmQ4kI8Nwr0ncZX64ujzk3wWI6kdU11bSjWWAhGflo4jHSCkhC8xH7LgpCCfk1w==
X-Talos-CUID: =?us-ascii?q?9a23=3AUAsBimmbbBX2bYRhAfzsMOR9snnXOVb56yb1BlO?=
 =?us-ascii?q?jMkxwSZeLanSz6PJ5ofM7zg=3D=3D?=
X-Talos-MUID: 9a23:ElNzCwSMPPf+qnydRXTJtWpIZeRY256VFXASkKwIseuFNA9vbmI=
X-IronPort-AV: E=Sophos;i="6.02,159,1688443200"; 
   d="scan'208";a="122938254"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH] x86: Fix check_ist_exit() assertions
Date: Tue, 19 Sep 2023 11:35:14 +0100
Message-ID: <20230919103514.1076888-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

The patch adding check_ist_exit() neglected to consider reset_stack_and_jump()
leaving C and entering one of the Xen exit paths.  The value in %r12 is stale,
and depending on compiler decisions may not be 0.

This shows up in Gitlab CI for the Clang build:

  https://gitlab.com/xen-project/people/andyhhp/xen/-/jobs/5112783827

and in OSSTest for GCC 8:

  http://logs.test-lab.xenproject.org/osstest/logs/183045/test-amd64-amd64-xl-qemuu-debianhvm-amd64/serial-pinot0.log

The justification for ensuring ist_exit is accurate in the exit paths still
stands, so zero %r12 in reset_stack_and_jump() to indicate a non-IST exit.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>
---
 xen/arch/x86/include/asm/current.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/xen/arch/x86/include/asm/current.h b/xen/arch/x86/include/asm/current.h
index da5e152a10cc..2ce43e275784 100644
--- a/xen/arch/x86/include/asm/current.h
+++ b/xen/arch/x86/include/asm/current.h
@@ -178,6 +178,7 @@ unsigned long get_stack_dump_bottom (unsigned long sp);
             SHADOW_STACK_WORK                                           \
             "mov %[stk], %%rsp;"                                        \
             CHECK_FOR_LIVEPATCH_WORK                                    \
+            "xor %%r12d, %%r12d;" /* non-IST exit */                    \
             instr "[fun]"                                               \
             : [val] "=&r" (tmp),                                        \
               [ssp] "=&r" (tmp)                                         \

base-commit: ea36ac0de27c2a7c847a2a52c3e0f97a45864d81
-- 
2.30.2


