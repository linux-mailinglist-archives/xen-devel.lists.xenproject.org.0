Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C98A36E4754
	for <lists+xen-devel@lfdr.de>; Mon, 17 Apr 2023 14:14:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.522031.811158 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1poNkT-0000i7-Ec; Mon, 17 Apr 2023 12:14:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 522031.811158; Mon, 17 Apr 2023 12:14:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1poNkT-0000fY-Bh; Mon, 17 Apr 2023 12:14:21 +0000
Received: by outflank-mailman (input) for mailman id 522031;
 Mon, 17 Apr 2023 12:14:20 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=696H=AI=citrix.com=prvs=464f2b76b=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1poNkS-0000QE-6g
 for xen-devel@lists.xenproject.org; Mon, 17 Apr 2023 12:14:20 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 610ac168-dd19-11ed-b21e-6b7b168915f2;
 Mon, 17 Apr 2023 14:14:19 +0200 (CEST)
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
X-Inumbo-ID: 610ac168-dd19-11ed-b21e-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1681733659;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=8IBGG1wJgH6bC2c5Y+Xq+OFacgbZ53MLTBgxfZw6AyY=;
  b=AjLGgLt7LmSkbnbsurRrkXmWCpUNbAEJb0SIg3SDn2eyBoeLyHzlRldd
   csAc/cO9kceba/ZDLeGO1HyV/leyjGWZDyWIQLlpddkNDCu0d/ykg89JZ
   Bkha2jykulQeIoz3SZeDlTk33N8HE4vNE6tevZU0wJ7tDFMd6vJY+acHX
   8=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 108238672
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:Tu8qLaDQ8b91dBVW/9zjw5YqxClBgxIJ4kV8jS/XYbTApDsigzUBm
 2UdXm7TOamIN2LwKdBzPdmw8k9V78fXm4JhQQY4rX1jcSlH+JHPbTi7wuUcHAvJd5GeExg3h
 yk6QoOdRCzhZiaE/n9BCpC48T8nk/nOHuGmYAL9EngZbRd+Tys8gg5Ulec8g4p56fC0GArIs
 t7pyyHlEAbNNwVcbyRFuspvlDs15K6p4G9B4QRnDRx2lAS2e0c9Xcp3yZ6ZdxMUcqEMdsamS
 uDKyq2O/2+x13/B3fv8z94X2mVTKlLjFVDmZkh+AsBOsTAbzsAG6Y4pNeJ0VKtio27hc+ada
 jl6ncfYpQ8BZsUgkQmGOvVSO3kW0aZuoNcrLZUj2CA6IoKvn3bEmp1T4E8K0YIw8dxKAUdL0
 aEhNGoJUSi+irnmxI60Y7w57igjBJGD0II3v3hhyXfSDOo8QICFSKLPjTNa9G5u3IYUR6+YP
 pdHL2M1N3wsYDUWUrsTILs4kP2lmT/UdDpApUjOjaE2/3LS3Ep6172F3N/9I4TaH54FwBnCz
 o7A137cAhgQPdqU8DGMzVSXrfflnn37WatHQdVU8dY12QbOlwT/EiY+RVa95PW0lEO6c9ZeM
 FAPvDojq7Ao806mRcW7WAe3yFafpQIVUddUF+w86SmOx7DS7gLfAXILJhZ/b9ghuN4zVCYd/
 FaDlNP0BhRiqLSQD3ma89+8pz6oJTIcK2NEYCYeVBYE+PHquoR1hRXKJv5gF6ivh9GzBjD0w
 BiNtiE1g7hVhskOv42Z113ahzOnprDSUxU4oA7QWwqN7B59ZYOjT5yl7x7c9/koBJmdZkmMu
 j4Dgcf20QwVJcjTzmrXGrxLRez3oa/fa1UwnGKDAbEqzQmt3XuHILlMujVBHHpkaZYARTDAN
 Rq7VRxq2HNDAJe7RfYpM9vtUJV3nPSI+cfNDa6NMIcXCnRlXErepXw1OxbNt4z4uBJ0+ZzTL
 6t3ZipF4ZwyLa18hAS7SO4GuVPA7nBvnDiDLXwXIvnO7FZ/WJJ2Ye1fWLd2RrplhJ5oWS2Mm
 zqlC+OEyg9ETMr1aTTN/IgYIDgidCZrXM6p85QKK7HbfmKK/V3N7NeImNscl3FNxfwJxo8kA
 FnmMqOn9LYPrSKecljbApySQLjuQYx+vRoGAMDYBn7xgyJLSd/2vM8im24fIeFPGBpLkaQlE
 JHouqyoXpxyd9gw025FNcOi99QyKk3DaMDnF3PNXQXTtqVIH2ThkuIItCOznMXSJkJbbfcDn
 oA=
IronPort-HdrOrdr: A9a23:ocIKU6ueutdXp8i6MNBC7iyY7skDstV00zEX/kB9WHVpm6yj+v
 xG/c5rsCMc7Qx6ZJhOo7+90cW7L080lqQFg7X5X43DYOCOggLBQL2KhbGI/9SKIVycygcy78
 Zdm6gVMqyLMbB55/yKnTVRxbwbsaW6GKPDv5ag8590JzsaD52Jd21Ce36m+ksdfnggObMJUK
 Cyy+BgvDSadXEefq2AdwI4t7iqnaysqHr+CyR2fiIa1A==
X-Talos-CUID: 9a23:UkT1qmxcmbw+V2ZRQ/pEBgUfIP0lVHj5kU7MeUuHMVtkE+2RdVC5rfY=
X-Talos-MUID: 9a23:Sik0uAoJ1dOjWQ3NcDEezytHNM5i6qKlMUsErrM9kNGuNnJwOh7I2Q==
X-IronPort-AV: E=Sophos;i="5.99,204,1677560400"; 
   d="scan'208";a="108238672"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Bertrand Marquis <bertrand.marquis@arm.com>,
	Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, Ross Lagerwall
	<ross.lagerwall@citrix.com>, Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, Wei Liu
	<wl@xen.org>
Subject: [PATCH v2 2/3] arm/alternatives: Rename alt_instr fields which are used in common code
Date: Mon, 17 Apr 2023 13:13:56 +0100
Message-ID: <20230417121357.3738919-3-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230417121357.3738919-1-andrew.cooper3@citrix.com>
References: <20230417121357.3738919-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Alternatives auditing for livepatches is currently broken.  To fix it, the
livepatch code needs to inspect more fields of alt_instr.

Rename ARM's fields to match x86's, because:

 * ARM already exposes alt_offset under the repl name via ALT_REPL_PTR()
 * "alt" is somewhat ambiguous in a structure entirely about alternatives
   already.
 * "repl", being the same number of character as orig leads to slightly neater
   code.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Julien Grall <julien@xen.org>
CC: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
CC: Bertrand Marquis <bertrand.marquis@arm.com>
CC: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
CC: Ross Lagerwall <ross.lagerwall@citrix.com>
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>

The other option is to make alt_instr an entirely common structure, but it's
already different between ARM and x86 and I'm not sure the result of doing
this would result in nicer code.
---
 xen/arch/arm/alternative.c             |  6 +++---
 xen/arch/arm/include/asm/alternative.h | 12 ++++++------
 2 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/xen/arch/arm/alternative.c b/xen/arch/arm/alternative.c
index f00e3b9b3c11..7366af4ea646 100644
--- a/xen/arch/arm/alternative.c
+++ b/xen/arch/arm/alternative.c
@@ -44,7 +44,7 @@ static bool branch_insn_requires_update(const struct alt_instr *alt,
         return true;
 
     replptr = (unsigned long)ALT_REPL_PTR(alt);
-    if ( pc >= replptr && pc <= (replptr + alt->alt_len) )
+    if ( pc >= replptr && pc <= (replptr + alt->repl_len) )
         return false;
 
     /*
@@ -128,9 +128,9 @@ static int __apply_alternatives(const struct alt_region *region,
             continue;
 
         if ( alt->cpufeature == ARM_CB_PATCH )
-            BUG_ON(alt->alt_len != 0);
+            BUG_ON(alt->repl_len != 0);
         else
-            BUG_ON(alt->alt_len != alt->orig_len);
+            BUG_ON(alt->repl_len != alt->orig_len);
 
         origptr = ALT_ORIG_PTR(alt);
         updptr = (void *)origptr + update_offset;
diff --git a/xen/arch/arm/include/asm/alternative.h b/xen/arch/arm/include/asm/alternative.h
index 1eb4b60fbb3e..d3210e82f9e5 100644
--- a/xen/arch/arm/include/asm/alternative.h
+++ b/xen/arch/arm/include/asm/alternative.h
@@ -13,16 +13,16 @@
 
 struct alt_instr {
 	s32 orig_offset;	/* offset to original instruction */
-	s32 alt_offset;		/* offset to replacement instruction */
+	s32 repl_offset;	/* offset to replacement instruction */
 	u16 cpufeature;		/* cpufeature bit set for replacement */
 	u8  orig_len;		/* size of original instruction(s) */
-	u8  alt_len;		/* size of new instruction(s), <= orig_len */
+	u8  repl_len;		/* size of new instruction(s), <= orig_len */
 };
 
 /* Xen: helpers used by common code. */
 #define __ALT_PTR(a,f)		((void *)&(a)->f + (a)->f)
 #define ALT_ORIG_PTR(a)		__ALT_PTR(a, orig_offset)
-#define ALT_REPL_PTR(a)		__ALT_PTR(a, alt_offset)
+#define ALT_REPL_PTR(a)		__ALT_PTR(a, repl_offset)
 
 typedef void (*alternative_cb_t)(const struct alt_instr *alt,
 				 const uint32_t *origptr, uint32_t *updptr,
@@ -90,12 +90,12 @@ int apply_alternatives(const struct alt_instr *start, const struct alt_instr *en
 #include <asm/asm_defns.h>
 #include <asm/macros.h>
 
-.macro altinstruction_entry orig_offset alt_offset feature orig_len alt_len
+.macro altinstruction_entry orig_offset repl_offset feature orig_len repl_len
 	.word \orig_offset - .
-	.word \alt_offset - .
+	.word \repl_offset - .
 	.hword \feature
 	.byte \orig_len
-	.byte \alt_len
+	.byte \repl_len
 .endm
 
 .macro alternative_insn insn1, insn2, cap, enable = 1
-- 
2.30.2


