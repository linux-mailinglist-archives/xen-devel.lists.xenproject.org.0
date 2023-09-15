Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 150A37A283B
	for <lists+xen-devel@lfdr.de>; Fri, 15 Sep 2023 22:37:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.603359.940325 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qhFYO-000113-Sj; Fri, 15 Sep 2023 20:36:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 603359.940325; Fri, 15 Sep 2023 20:36:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qhFYO-0000xp-PL; Fri, 15 Sep 2023 20:36:40 +0000
Received: by outflank-mailman (input) for mailman id 603359;
 Fri, 15 Sep 2023 20:36:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Zf2R=E7=citrix.com=prvs=615989724=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1qhFYN-0000xj-6k
 for xen-devel@lists.xenproject.org; Fri, 15 Sep 2023 20:36:39 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8eb97a50-5407-11ee-9b0d-b553b5be7939;
 Fri, 15 Sep 2023 22:36:35 +0200 (CEST)
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
X-Inumbo-ID: 8eb97a50-5407-11ee-9b0d-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1694810195;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=iVvBxcmH9/frdKV3USiWYWpvNhtBBf3353lMt0BYDpE=;
  b=Y3n1u3phZdSG7QQuZ+fKxnD+ejHHv38oRp1AZcE1VMxwZWDeSUEiL9CU
   0xqqGlNnisJnHsdXew5yokEzmidktkBvNNMVYZL/2zMG7+lAqW3DswWwd
   FMR4v4iaNnyc49GTITnYz0iiJ/g/yhcgWnwjD0jj3zQs3UjjT9U0YN3Uu
   A=;
X-CSE-ConnectionGUID: 40xdC7HJRICoFGlJfSNwcw==
X-CSE-MsgGUID: cCkTKcjLTiaOoIrGwy9qpw==
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 122825024
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
X-ThreatScanner-Verdict: Negative
IronPort-Data: A9a23:b+Mhb61bLWR7HYCtVvbD5eVxkn2cJEfYwER7XKvMYLTBsI5bpzZWn
 2QYX2jSaKrcYmH0ctx1PNzn9k1UsZ+Dx4dlQAM5pC1hF35El5HIVI+TRqvS04F+DeWYFR46s
 J9OAjXkBJppJpMJjk71atANlVEliOfQAOK6UbaYUsxIbVcMYD87jh5+kPIOjIdtgNyoayuAo
 tq3qMDEULOf82cc3lk8teTb8nuDgNyo4GlD5g1nOKgQ1LPjvyJ94Kw3dPnZw0TQGuG4LsbiL
 87fwbew+H/u/htFIrtJRZ6iLyXm6paLVeS/oiI+t5qK23CulQRrukoPD9IOaF8/ttm8t4sZJ
 OOhF3CHYVxB0qXkwIzxWvTDes10FfUuFLTveRBTvSEPpqFvnrSFL/hGVSkL0YMkFulfXTle+
 ddHCBI3TzuEqc2y4ryAbPZnmZF2RCXrFNt3VnBIyDjYCbAtQIzZQrWM7thdtNsyrpkQR7CEP
 ZNfMGcxKk2aOHWjOX9OYH46tM6uimPybHtzr1WNqLBsy2PS0BZwwP7mN9+9ltmiHJ8PzhzF/
 jial4j/KhoxN+C8wjihznOloejuhwzkSdMLDKLto5aGh3XMnzdOWXX6T2CTsfS/z0KzRd9bA
 0gV4TY167g/8lSxSdvwVAH+p2SL1jY+cddNF+wx6CmW17HZpQ2eAwAsUTppeNEg8sgsSlQC1
 F6PmNOvBjVpv/uWU1qS876VqXW5Pi19EIMZTXZaF01fuYCl+dxtyEuVFb6PDZJZkPWpQSH86
 G+qjhIfrLI9osop2Z6d4lvY1mfESofyciY54QDeX2SA5wx/ZZK4a4HA1WU3/cqsP67CEADf4
 SFsd9y2qblXUMrTzHDlrPAlRunB2hqTDNHLbbeD9bEF/i/lxXOsdJs4DNpWdBYwaZZsldMEj
 SbuVeJtCH17ZivCgUxfOdjZ5yEWIU/ITI6NaxwsRoASCqWdjSfelM2UWWae3nr2jG8nmrwlN
 JGQfK6EVChLVfQ/lmXmGrdAiNfHIxzSI0uJHfgXKDz9itKjiIO9E+9ZYDNikMhmhE97nOkl2
 4kGbJbbo/mueOb/fjPW4eYuwaMidBAG6WTNg5UPLIare1M2cFzN/teNmdvNjaQ5xfUK/goJl
 1nhMnJlJK3X3iSec13XOyE/MNsCn/9X9BoGAMDlBn7ws1BLXGplxP53m0cfFVX/yNFe8A==
IronPort-HdrOrdr: A9a23:j5UfjK3YOid3pkFeCKv7ZwqjBIokLtp133Aq2lEZdPRUGvb3qy
 nIpoVj6faUskd2ZJhOo7C90cW7LU80sKQFhLX5Xo3SOzUO2lHYT72KhLGKq1aLdhEWtNQtsZ
 uIG5IOcOEYZmIasS+V2maF+q4bsbu6zJw=
X-Talos-CUID: =?us-ascii?q?9a23=3ALlzQHGu/hD9h44L5WVnVX3Ge6It5Km3R5yjwAXW?=
 =?us-ascii?q?ZImFHZ7m3R2S256h7xp8=3D?=
X-Talos-MUID: =?us-ascii?q?9a23=3ATaxKyw58tRk5AM7E+Ux2NeaxxoxjyKeSK0sPtak?=
 =?us-ascii?q?Hsu6DFDZfJCbMlSyoF9o=3D?=
X-IronPort-AV: E=Sophos;i="6.02,150,1688443200"; 
   d="scan'208";a="122825024"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>, Jinoh Kang
	<jinoh.kang.kr@gmail.com>
Subject: [PATCH 1/7] x86/emul: ASSERT that X86EMUL_DONE doesn't escape to callers
Date: Fri, 15 Sep 2023 21:36:22 +0100
Message-ID: <20230915203628.837732-2-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230915203628.837732-1-andrew.cooper3@citrix.com>
References: <20230915203628.837732-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

This property is far from clear.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>
CC: Jinoh Kang <jinoh.kang.kr@gmail.com>

v2:
 * New
---
 xen/arch/x86/x86_emulate/x86_emulate.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/xen/arch/x86/x86_emulate/x86_emulate.c b/xen/arch/x86/x86_emulate/x86_emulate.c
index e88245eae9fb..94caec1d142c 100644
--- a/xen/arch/x86/x86_emulate/x86_emulate.c
+++ b/xen/arch/x86/x86_emulate/x86_emulate.c
@@ -8651,6 +8651,12 @@ int x86_emulate_wrapper(
 
     rc = x86_emulate(ctxt, ops);
 
+    /*
+     * X86EMUL_DONE is an internal signal in the emulator, and is not expected
+     * to ever escape out to callers.
+     */
+    ASSERT(rc != X86EMUL_DONE);
+
     /*
      * Most retire flags should only be set for successful instruction
      * emulation.
-- 
2.30.2


