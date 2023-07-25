Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A58E776213E
	for <lists+xen-devel@lfdr.de>; Tue, 25 Jul 2023 20:21:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.569884.891022 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qOMea-0002Pn-Bv; Tue, 25 Jul 2023 18:21:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 569884.891022; Tue, 25 Jul 2023 18:21:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qOMea-0002NQ-8S; Tue, 25 Jul 2023 18:21:00 +0000
Received: by outflank-mailman (input) for mailman id 569884;
 Tue, 25 Jul 2023 18:20:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+x6f=DL=citrix.com=prvs=56398a583=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1qOMeZ-0002NK-7g
 for xen-devel@lists.xenproject.org; Tue, 25 Jul 2023 18:20:59 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fedf9100-2b17-11ee-b23f-6b7b168915f2;
 Tue, 25 Jul 2023 20:20:57 +0200 (CEST)
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
X-Inumbo-ID: fedf9100-2b17-11ee-b23f-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1690309256;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=vNaY0Gb4fEnPxscuh5gMxGc4bfOXcYQXGexKJPchBZ8=;
  b=dkQ6bM699+EizaEfFVubIIAdE3auMF7tV0MwBfpOTEf2aVzWrGqOK7fu
   S/UKA2F4DkycwPczsuBmjtcvZpaMdiJg93r8kyPVC2giwwu9xzMk284Hg
   G02JTHGAffIGxijzJGaXQ0sJL5NcutMQ5oOt/IgRTM1m+36YGIYYuDbIL
   4=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 117426735
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:Bt6SvK2VLc5x3DUUNvbD5bB2kn2cJEfYwER7XKvMYLTBsI5bp2BTx
 2IcCm6HOanbYGGmfNh2OYvl/E8AsZGGy4BqQQJopC1hF35El5HIVI+TRqvS04F+DeWYFR46s
 J9OAjXkBJppJpMJjk71atANlVEliefTAOK6ULWeUsxIbVcMYD87jh5+kPIOjIdtgNyoayuAo
 tq3qMDEULOf82cc3lk8teTb8XuDgNyo4GlD5gNkOKgS1LPjvyJ94Kw3dPnZw0TQGuG4LsbiL
 87fwbew+H/u/htFIrtJRZ6iLyXm6paLVeS/oiI+t5qK23CulQRrukoPD9IOaF8/ttm8t4sZJ
 OOhF3CHYVxB0qXkwIzxWvTDes10FfUuFLTveRBTvSEPpqFvnrSFL/hGVSkL0YMkFulfEz4N5
 NYnLho3cgHTv9u66ZaXavg0mZF2RCXrFNt3VnBIyDjYCbAtQIzZQrWM7thdtNsyrpkQR7CEP
 ZNfMGcxKk2aOHWjOX9OYH46tM6uimPybHtzr1WNqLBsy2PS0BZwwP7mN9+9ltmiHJwKwhzG+
 Tmbl4j/KjsfHdiS9hScySOXqebBpDP2QIgLGoTto5aGh3XMnzdOWXX6T2CTsfS/z0KzRd9bA
 0gV4TY167g/8lSxSdvwVAH+p2SL1jY+cddNF+wx6CmW17HZpQ2eAwAsVSVdYdYrsMs3Qz0C1
 VKTmd7tQzt1v9W9Vna15rqS6zSoNkA9L3IGZCICZRsI5Z/kuo5bpizIStFvAauklOrfEDv7w
 y2JhCUmjrBVhskOv42x8ErbmTuqqt7MRxQs+wTMdmu/60VyY4vNT4Ws6EPH5PdaaoiDR1+Kv
 WMshMSVqusJCPmlniuHSvQAB7Gt6vOMNhXThFduG98q8DHF03Wke4ZX4j13OkZyGskBcD7tJ
 kTUvGt545teP2CrbOl0fpi2AMQpyoDvEN3kUrbfad8mSoJ2fgKd4CYob0ef2Wn3mWAmjK4kN
 JGUN82rCB4n5b9PlWTsAb1HiPlym354nDmILXzm8/i5+ajBJ2+/drEvCkefPtgA4IqgjCXEq
 8kKYqNm1C5jvP3Cjjj/qNBCdQtSciNlVPgauOQMKLfdf1MO9HUJTqaInOh/I9ENc7F9zL+gw
 52rZqNPJLMTb1XjIB7CVH1sYaiHsX1X/SNiZnxE0bpFNhEejWeTAEQ3LcFfkUEPrrAL8BKNZ
 6Btlz+8KvpOUC/b3D8WcIPwqodvHDzy21PWZXD+PGhgI8U8L+AsxjMCVlG0nMXpJnPp3fbSX
 pX6jl+LKXb9b1kK4DnqhAKHkArq4Cl1dBNaVErUONhDEHgAA6AzQxEdesQfeplWQT2an2vy6
 upjKUtAzQU7i9NvoYahaGHth9vBLtaS6WIBTzKGvenmanmyE6jK6dYobdtktAv1DAvckJhOr
 80Pl5kQ7NVvcI52jrdB
IronPort-HdrOrdr: A9a23:Dkl8FK9Adq1LnB97H3huk+DnI+orL9Y04lQ7vn2ZhyYlC/Bw9v
 re5MjzsCWftN9/YgBEpTntAtjjfZqYz+8X3WBzB9aftWvdyQ+VxehZhOOI/9SjIU3DH4VmpM
 BdmsZFebvN5JtB4foSIjPULz/t+ra6GWmT69vj8w==
X-Talos-CUID: 9a23:EkOlXmw3bMqXCbXW7UaRBgUGRYM0WELb5k3MMh+AMGpAbJG1WAePrfY=
X-Talos-MUID: 9a23:FTTxjATlD8vpafNzRXTGgRhmOfhG+p//M28En6wWttGOLCJJbmI=
X-IronPort-AV: E=Sophos;i="6.01,230,1684814400"; 
   d="scan'208";a="117426735"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Bertrand Marquis <bertrand.marquis@arm.com>,
	Bob Eshleman <bobbyeshleman@gmail.com>, Alistair Francis
	<alistair.francis@wdc.com>, Connor Davis <connojdavis@gmail.com>, "Oleksii
 Kurochko" <oleksii.kurochko@gmail.com>, Roberto Bagnara
	<roberto.bagnara@bugseng.com>
Subject: [PATCH] xen: Drop the (almost) unused extern start[]
Date: Tue, 25 Jul 2023 19:20:49 +0100
Message-ID: <20230725182049.2384427-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

This global variable is shadowed by plenty local variables, violating MISRA
rule 5.3.  Some architectures happen to have a symbol by the name of start in
their head.S's, but it's not a useful symbol to reference from C.

In fact, the single use of the global start[] in RISC-V is wrong and means to
use _start[] as the linker symbol at the beginning of the .text section, not
the function which happens to be in the same location.

Fix RISC-V to use the right symbol for it's calculation, and drop the extern.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Julien Grall <julien@xen.org>
CC: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
CC: Bertrand Marquis <bertrand.marquis@arm.com>
CC: Bob Eshleman <bobbyeshleman@gmail.com>
CC: Alistair Francis <alistair.francis@wdc.com>
CC: Connor Davis <connojdavis@gmail.com>
CC: Oleksii Kurochko <oleksii.kurochko@gmail.com>
CC: Roberto Bagnara <roberto.bagnara@bugseng.com>

I'm expecting:

  https://gitlab.com/xen-project/people/andyhhp/xen/-/pipelines/945105609

to come back and show green, but Gitlab is very backed up right now.  I've
compiled each architecture locally.
---
 xen/arch/riscv/mm.c      | 2 +-
 xen/include/xen/kernel.h | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/xen/arch/riscv/mm.c b/xen/arch/riscv/mm.c
index fddb3cd0bdeb..99ed5e9623cc 100644
--- a/xen/arch/riscv/mm.c
+++ b/xen/arch/riscv/mm.c
@@ -148,7 +148,7 @@ static bool __init check_pgtbl_mode_support(struct mmu_desc *mmu_desc,
 
     unsigned long aligned_load_start = load_start & level_map_mask;
     unsigned long aligned_page_size = XEN_PT_LEVEL_SIZE(page_table_level);
-    unsigned long xen_size = (unsigned long)(_end - start);
+    unsigned long xen_size = (unsigned long)(_end - _start);
 
     if ( (load_start + xen_size) > (aligned_load_start + aligned_page_size) )
     {
diff --git a/xen/include/xen/kernel.h b/xen/include/xen/kernel.h
index 9ac2694dc7b1..46b3c9c02625 100644
--- a/xen/include/xen/kernel.h
+++ b/xen/include/xen/kernel.h
@@ -66,7 +66,7 @@
 })
 
 /* SAF-0-safe */
-extern char _start[], _end[], start[];
+extern char _start[], _end[];
 #define is_kernel(p) ({                         \
     char *__p = (char *)(unsigned long)(p);     \
     (__p >= _start) && (__p < _end);            \

base-commit: 0b1171be87698bc7d14760383c0770aeb6e41dd4
-- 
2.30.2


