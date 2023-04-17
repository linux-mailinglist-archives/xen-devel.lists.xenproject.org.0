Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0293E6E4755
	for <lists+xen-devel@lfdr.de>; Mon, 17 Apr 2023 14:14:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.522032.811169 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1poNkY-00012G-PP; Mon, 17 Apr 2023 12:14:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 522032.811169; Mon, 17 Apr 2023 12:14:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1poNkY-0000yi-LG; Mon, 17 Apr 2023 12:14:26 +0000
Received: by outflank-mailman (input) for mailman id 522032;
 Mon, 17 Apr 2023 12:14:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=696H=AI=citrix.com=prvs=464f2b76b=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1poNkX-0000xC-0t
 for xen-devel@lists.xenproject.org; Mon, 17 Apr 2023 12:14:25 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 61fdfbb7-dd19-11ed-8611-37d641c3527e;
 Mon, 17 Apr 2023 14:14:22 +0200 (CEST)
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
X-Inumbo-ID: 61fdfbb7-dd19-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1681733662;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=WOSwA4Gw3YJcS+3VeWA2TjaLAqOkde+i62MNsG9fL/4=;
  b=R56YTCNKt/8X7mO8MwYZL5CSyLl56X8pPaY7Txx1ycW/atagL8MBX+xd
   3O36ulpXs3ZD7V13JBdNBwrlWTS8xZKJ3Tfnjdsnkgd9p90jvIuO0d6s2
   IDXyAHLF13YKcYytSXLtQ+qVdZDBgAkNC1c1fX2fahCZvHuhyOV2K9a30
   A=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 105144451
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:IeHEXaxETLSf45916HR6t+fDxirEfRIJ4+MujC+fZmUNrF6WrkUBn
 GQdUG6CP/jYMWGgcopxaY+18ElUuZ+Ey95lSlBo+SAxQypGp/SeCIXCJC8cHc8wwu7rFxs7s
 ppEOrEsCOhuExcwcz/0auCJQUFUjP3OHfykTrafYEidfCc8IA85kxVvhuUltYBhhNm9Emult
 Mj75sbSIzdJ4RYtWo4vw//F+UIHUMja4mtC5QRiPK8T5TcyqlFOZH4hDfDpR5fHatE88t6SH
 47r0Ly/92XFyBYhYvvNfmHTKxBirhb6ZGBiu1IOM0SQqkEqSh8ai87XAME0e0ZP4whlqvgqo
 Dl7WT5cfi9yVkHEsLx1vxC1iEiSN4UekFPMCSDXXcB+UyQq2pYjqhljJBheAGEWxgp4KVMJ1
 fkSBRFTV1PZrLrszYOJe7lQoe12eaEHPKtH0p1h5TTQDPJgSpHfWaTao9Rf2V/chOgXQ6yYP
 ZBAL2MyMlKZOUYn1lQ/UfrSmM+BgHXlfiIeg1WSvactuEDYzRBr0airO93QEjCPbZwNwx/E+
 j6bpgwVBDkXOYe6yTm760ugqdXRkQjlVpgLT4eno6sCbFq7mTVIVUx+uUGAiem0jAuyVsxSL
 2QQ+zEytu4i+UqzVN7/Uhak5nmesXY0WN1WCeQ2rh6Mzqn85ByQDWwJCDVGbbQOr9QqTDYn0
 luImdLBBjF1trCRD3WH+d+8kzS2PiQEKH4YUgUNRwAF/trLrZk6i1TESdMLOKS4lMHvEDf8h
 TWDtjEjhq47hNQOka68+DjvoRihu5zIRQ4d/RjMUySu6QYRTIy4Y42l73DL4PAGK5yWJnGeu
 FAUls7Y6/oBZaxhjwTUHr9LRuvwoa/YbnuF2wUH84QdGyqFyTmDeIp9wW9HZx1CapwJSA3YM
 HP0kFYEjHNMB0dGfZObcqroVZRzkfOxSIW5PhzHRoEQO8YsLWdr6AkrPBfNhD61zSDAhIllY
 f+mndCQ4WH24EiN5B6/XK8j3LAi3UjSLkuDFMmgn3xLPVdzDUN5qIvp03PUNIjVFIve/G3oH
 y93bqNmMSl3XuzkeTXw+oUON10MJnVTLcmo+5UJKbbbf1c5QD1J5xrtLVQJItUNokiovr2Qo
 iHVtrFwkzITekEr2S3VMys+OdsDrL50rG4hPDxEAGtEL0MLON71hI9GLstfQFXS3LA7pRKCZ
 6VfKpro7zUmYmivxgnxmrGn9NQ4K0/z1VzXV8dnCRBmF6Ndq8Xy0oeMVmPSGOMmVHPfWRcWy
 1F46j7mfA==
IronPort-HdrOrdr: A9a23:lknfQKPhoAAYE8BcTgWjsMiBIKoaSvp037BK7S1MoH1uA6mlfq
 WV9sjzuiWatN98Yh8dcLO7Scu9qBHnlaKdiLN5VduftWHd01dAR7sSjrcKrQeAJ8X/nNQtr5
 uJccJFeaDN5Y4Rt7eH3OG6eexQv+Vu6MqT9IPjJ+8Gd3ATV0lnhT0JbTqzIwlNayRtI4E2L5
 aY7tovnUvaRZxGBv7LYEXsRoL41qT2qK4=
X-Talos-CUID: 9a23:hHYlyWP/5TCIwu5Dam5H8UQ5O54cMSf2lC3dEn2JWVpOYejA
X-Talos-MUID: 9a23:pQoADQZkwAsF0+BTujK3oTFhCt5R74uUFkwmj5scopK+Knkl
X-IronPort-AV: E=Sophos;i="5.99,204,1677560400"; 
   d="scan'208";a="105144451"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Konrad Rzeszutek Wilk
	<konrad.wilk@oracle.com>, Ross Lagerwall <ross.lagerwall@citrix.com>,
	"Stefano Stabellini" <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
	"Volodymyr Babchuk" <Volodymyr_Babchuk@epam.com>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, Wei Liu
	<wl@xen.org>
Subject: [PATCH v2 1/3] xen/ELF: Fix ELF32 PRI formatters
Date: Mon, 17 Apr 2023 13:13:55 +0100
Message-ID: <20230417121357.3738919-2-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230417121357.3738919-1-andrew.cooper3@citrix.com>
References: <20230417121357.3738919-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

It is rude to hide width formatting inside a PRI* macro, doubly so when it's
only in one bitness of the macro.

However its fully buggy when all the users use %#"PRI because then it expands
to the common trap of %#08x which does not do what the author intends.

Switch the ELF PRI formatters to use plain integer PRI's, and move the width
formatting to those callers where it matters.

No practical change.

Fixes: 7597fabca76e ("livepatch: Include sizes when an mismatch occurs")
Fixes: 380b229634f8 ("xsplice: Implement payload loading")
Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
CC: Ross Lagerwall <ross.lagerwall@citrix.com>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Julien Grall <julien@xen.org>
CC: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
CC: Bertrand Marquis <bertrand.marquis@arm.com>
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>
---
 xen/common/livepatch_elf.c   | 6 +++---
 xen/include/xen/elfstructs.h | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/xen/common/livepatch_elf.c b/xen/common/livepatch_elf.c
index 45d73912a3cd..d37a7af84be6 100644
--- a/xen/common/livepatch_elf.c
+++ b/xen/common/livepatch_elf.c
@@ -310,12 +310,12 @@ int livepatch_elf_resolve_symbols(struct livepatch_elf *elf)
                     break;
                 }
             }
-            dprintk(XENLOG_DEBUG, LIVEPATCH "%s: Undefined symbol resolved: %s => %#"PRIxElfAddr"\n",
+            dprintk(XENLOG_DEBUG, LIVEPATCH "%s: Undefined symbol resolved: %s => 0x%08"PRIxElfAddr"\n",
                     elf->name, elf->sym[i].name, st_value);
             break;
 
         case SHN_ABS:
-            dprintk(XENLOG_DEBUG, LIVEPATCH "%s: Absolute symbol: %s => %#"PRIxElfAddr"\n",
+            dprintk(XENLOG_DEBUG, LIVEPATCH "%s: Absolute symbol: %s => 0x%08"PRIxElfAddr"\n",
                     elf->name, elf->sym[i].name, sym->st_value);
             break;
 
@@ -344,7 +344,7 @@ int livepatch_elf_resolve_symbols(struct livepatch_elf *elf)
 
             st_value += (unsigned long)elf->sec[idx].load_addr;
             if ( elf->sym[i].name )
-                dprintk(XENLOG_DEBUG, LIVEPATCH "%s: Symbol resolved: %s => %#"PRIxElfAddr" (%s)\n",
+                dprintk(XENLOG_DEBUG, LIVEPATCH "%s: Symbol resolved: %s => 0x%08"PRIxElfAddr" (%s)\n",
                        elf->name, elf->sym[i].name,
                        st_value, elf->sec[idx].name);
         }
diff --git a/xen/include/xen/elfstructs.h b/xen/include/xen/elfstructs.h
index 06e6f87c3d80..3124469faeb4 100644
--- a/xen/include/xen/elfstructs.h
+++ b/xen/include/xen/elfstructs.h
@@ -561,8 +561,8 @@ typedef struct {
 #endif
 
 #if defined(ELFSIZE) && (ELFSIZE == 32)
-#define PRIxElfAddr	"08x"
-#define PRIuElfWord	"8u"
+#define PRIxElfAddr 	PRIx32
+#define PRIuElfWord 	PRIu32
 
 #define Elf_Ehdr	Elf32_Ehdr
 #define Elf_Phdr	Elf32_Phdr
-- 
2.30.2


