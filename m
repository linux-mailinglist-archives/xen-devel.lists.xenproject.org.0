Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D5D9E6C884D
	for <lists+xen-devel@lfdr.de>; Fri, 24 Mar 2023 23:25:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.514474.796761 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pfpqT-0007tG-IG; Fri, 24 Mar 2023 22:25:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 514474.796761; Fri, 24 Mar 2023 22:25:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pfpqT-0007sT-D9; Fri, 24 Mar 2023 22:25:13 +0000
Received: by outflank-mailman (input) for mailman id 514474;
 Fri, 24 Mar 2023 22:25:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GJ5Y=7Q=citrix.com=prvs=4404309fd=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pfpqS-0007rc-8F
 for xen-devel@lists.xenproject.org; Fri, 24 Mar 2023 22:25:12 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bb724ea8-ca92-11ed-85db-49a42c6b2330;
 Fri, 24 Mar 2023 23:25:09 +0100 (CET)
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
X-Inumbo-ID: bb724ea8-ca92-11ed-85db-49a42c6b2330
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1679696709;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=JdsUPRyO9hKi+dT989li7QC+or0gXW+UxwEHUyBJBYs=;
  b=GApi9uc8r2+Kc1FKvMwX74lrhmje+qQQBWB2csYEqT2CQNUZRT2OXkvc
   Vtg353Ynt4jpsQWIaRhusj6LEr9Et6uZAugTCcCLg9hjiKHCd651BEjWC
   6xkkOCr8XWsxiXLO3jRK7FNXntOa6Pl9gct1YAWPnJ4mslUtvcOqoPsMo
   8=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 101652470
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:B12k5qxgCWmP91sgGLR6t+esxirEfRIJ4+MujC+fZmUNrF6WrkVRz
 DNLCGiDOPyJZTT1edgjbIy1oxsFu5OHnIIxTAY9/CAxQypGp/SeCIXCJC8cHc8wwu7rFxs7s
 ppEOrEsCOhuExcwcz/0auCJQUFUjP3OHfykTrafYEidfCc8IA85kxVvhuUltYBhhNm9Emult
 Mj75sbSIzdJ4RYtWo4vw//F+UMHUMja4mtC5QRlP6wT5zcyqlFOZH4hDfDpR5fHatE88t6SH
 47r0Ly/92XFyBYhYvvNfmHTKxBirhb6ZGBiu1IOM0SQqkEqSh8ai87XAME0e0ZP4whlqvgqo
 Dl7WT5cfi9yVkHEsLx1vxC1iEiSN4UekFPMCSDXXcB+UyQq2pYjqhljJBheAGEWxgp4KUNh8
 Pw3cSpVUhqe2rq92rueSsV128t2eaEHPKtH0p1h5TTQDPJgSpHfWaTao9Rf2V/chOgXQ6yYP
 ZBAL2MyMlKZOUYn1lQ/UfrSmM+BgHXlfiIeg1WSvactuEDYzRBr0airO93QEjCPbZwNxxjF/
 D6ZpwwVBDknH+Caij2drU6P2N3MoxvpUa0XJp6Bo6sCbFq7mTVIVUx+uUGAiem0jAuyVsxSL
 2QQ+zEytu4i+UqzVN7/Uhak5nmesXY0QMFMGuc37AWMzKv84AuDAGUACDlbZ7QOttIyRDEs/
 k+EmZXuHzMHmIOSTXWR57KFtwSYMCIeLXIBTSIcRA5D6N7myKk5gwjTVN9lHOiwh8fsBDDr6
 zmQqW41gLB7pccP1r6n9FHdxTy2r57CTxUd+QncGGmi62tRbomvbZ2l8ljf4PNJKq6WS1CAu
 D4PnM32xOsJC5eKliCEXuQWNL6s7veBdjbbhDZHGJ0s9C+s+jigYJpX6zF9I29mN88FfXniZ
 0q7hO9KzMYNZj3wN/YxOt/vTZ1wlsAMCOgJSNj2Qd9OTcFrLDON4Xw2blSZ+mDBiRUjxPRX1
 YigTSq8MZoLIf05k2voGbpHiudDKjMWnj2KG82ip/iz+f/HPSPOF+9YWLebRrphhJ5otjk55
 Dq22yGi7xxEGNPzbSDMmWL4BQBbdCNrbXwaRiE+SwJiHuaFMDt7YxMp6el9E7GJZowM/gsyw
 lmzW1VD1H30jmDdJAOBZxhLMe2wDMgv9ipibHd1YD5EPkTPhq7xhJrzirNtJeV3nACd5acco
 wY5lzWoXa0UF2WvF8U1Zpjhto1yHCmWafa1F3P9OlAXJscwLzElD/e4JmMDAgFSVHvo3Sb/y
 pX8vj7mrW0rHV4zV5eNMa/3kjtcfxE1wYpPYqcBGfELEG2EzWSgA3WZYiMfSy3UFSj++w==
IronPort-HdrOrdr: A9a23:X9OYbqx76WCmu7oB35OLKrPwFL1zdoMgy1knxilNoEpuA6ilfq
 eV/MjztCWUtN9/YhkdcLy7U5VoIkmzyXcW2+Us1OyZLWzbUQKTRb2Ki7GJ/9SKIULDH4BmuJ
 uJ3MJFebrN5fQRt7eY3OEYeexQouW6zA==
X-IronPort-AV: E=Sophos;i="5.98,289,1673931600"; 
   d="scan'208";a="101652470"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Bertrand Marquis <bertrand.marquis@arm.com>,
	Bob Eshleman <bobbyeshleman@gmail.com>, Alistair Francis
	<alistair.francis@wdc.com>, Connor Davis <connojdavis@gmail.com>, "Oleksii
 Kurochko" <oleksii.kurochko@gmail.com>
Subject: [PATCH] ARM+RISC-V: BSS handling improvements
Date: Fri, 24 Mar 2023 22:24:51 +0000
Message-ID: <20230324222451.3295023-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

 * Correct comments in arm{32,64}/head.S
 * Provide Linker assertions to check the safety of the zeroing loops

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Julien Grall <julien@xen.org>
CC: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
CC: Bertrand Marquis <bertrand.marquis@arm.com>
CC: Bob Eshleman <bobbyeshleman@gmail.com>
CC: Alistair Francis <alistair.francis@wdc.com>
CC: Connor Davis <connojdavis@gmail.com>
CC: Oleksii Kurochko <oleksii.kurochko@gmail.com>

Pulled out of the very start of my work to try and unify the handling of
xen_phys_addr across architectures.
---
 xen/arch/arm/arm32/head.S | 2 +-
 xen/arch/arm/arm64/head.S | 2 +-
 xen/arch/arm/xen.lds.S    | 2 ++
 xen/arch/riscv/xen.lds.S  | 4 ++++
 4 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/xen/arch/arm/arm32/head.S b/xen/arch/arm/arm32/head.S
index df51550baa8a..f9f7be9588b1 100644
--- a/xen/arch/arm/arm32/head.S
+++ b/xen/arch/arm/arm32/head.S
@@ -301,7 +301,7 @@ ENDPROC(check_cpu_mode)
 zero_bss:
         PRINT("- Zero BSS -\r\n")
         mov_w r0, __bss_start        /* r0 := vaddr(__bss_start) */
-        mov_w r1, __bss_end          /* r1 := vaddr(__bss_start) */
+        mov_w r1, __bss_end          /* r1 := vaddr(__bss_end)   */
 
         mov   r2, #0
 1:      str   r2, [r0], #4
diff --git a/xen/arch/arm/arm64/head.S b/xen/arch/arm/arm64/head.S
index 4a3f87117c83..8a4dd64c99ad 100644
--- a/xen/arch/arm/arm64/head.S
+++ b/xen/arch/arm/arm64/head.S
@@ -437,7 +437,7 @@ zero_bss:
 
         PRINT("- Zero BSS -\r\n")
         ldr   x0, =__bss_start       /* x0 := vaddr(__bss_start) */
-        ldr   x1, =__bss_end         /* x1 := vaddr(__bss_start) */
+        ldr   x1, =__bss_end         /* x1 := vaddr(__bss_end)   */
 
 1:      str   xzr, [x0], #8
         cmp   x0, x1
diff --git a/xen/arch/arm/xen.lds.S b/xen/arch/arm/xen.lds.S
index 1b392345bc3b..6ca3caefe607 100644
--- a/xen/arch/arm/xen.lds.S
+++ b/xen/arch/arm/xen.lds.S
@@ -240,3 +240,5 @@ ASSERT(_idmap_end - _idmap_start <= PAGE_SIZE, "Identity mapped code is larger t
  */
 ASSERT(IS_ALIGNED(__init_begin,     4), "__init_begin is misaligned")
 ASSERT(IS_ALIGNED(__init_end,       4), "__init_end is misaligned")
+ASSERT(IS_ALIGNED(__bss_start,      POINTER_ALIGN), "__bss_start is misaligned")
+ASSERT(IS_ALIGNED(__bss_end,        POINTER_ALIGN), "__bss_end is misaligned")
diff --git a/xen/arch/riscv/xen.lds.S b/xen/arch/riscv/xen.lds.S
index ca57cce75cba..2ed70eccc62a 100644
--- a/xen/arch/riscv/xen.lds.S
+++ b/xen/arch/riscv/xen.lds.S
@@ -1,3 +1,4 @@
+#include <xen/lib.h>
 #include <xen/xen.lds.h>
 
 #undef ENTRY
@@ -156,3 +157,6 @@ SECTIONS
 
     ELF_DETAILS_SECTIONS
 }
+
+ASSERT(IS_ALIGNED(__bss_start,      POINTER_ALIGN), "__bss_start is misaligned")
+ASSERT(IS_ALIGNED(__bss_end,        POINTER_ALIGN), "__bss_end is misaligned")
-- 
2.30.2


