Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CF347F48EB
	for <lists+xen-devel@lfdr.de>; Wed, 22 Nov 2023 15:28:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.638782.995687 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r5oCf-0000jp-Ep; Wed, 22 Nov 2023 14:27:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 638782.995687; Wed, 22 Nov 2023 14:27:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r5oCf-0000i3-Bi; Wed, 22 Nov 2023 14:27:45 +0000
Received: by outflank-mailman (input) for mailman id 638782;
 Wed, 22 Nov 2023 14:27:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Dm5i=HD=citrix.com=prvs=683e23acf=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1r5oCd-0000hs-NG
 for xen-devel@lists.xenproject.org; Wed, 22 Nov 2023 14:27:43 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 48edbeb6-8943-11ee-9b0e-b553b5be7939;
 Wed, 22 Nov 2023 15:27:41 +0100 (CET)
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
X-Inumbo-ID: 48edbeb6-8943-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1700663261;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ywvep0L7wFEFiubA9y2BEnjTlV89Gf8x0DSPJfdKTgM=;
  b=NI2dATF/OIJSNZoNf1Jubuz77lGEulhMrOQmcyqxn+fhspvRtL4e3jDa
   DsU5SZz+vxQRT5HBE5nlnIYbQd4/g4VzkOYL+TgxX8PmmTEolmm7cl6wn
   NDTQw0BbuSqpd7oaqrPR4+2hCM2mfGYZjI4kZUD/nyL3LCIz6cUw04V0D
   I=;
X-CSE-ConnectionGUID: FUgGcfvZQFCj8jqu50I/5A==
X-CSE-MsgGUID: So+pkNaeR22uRJ7GcsGH5A==
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 128715170
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.159.70
X-Policy: $RELAYED
X-ThreatScanner-Verdict: Negative
IronPort-Data: A9a23:dWJi1a3azst0+oJrE/bD5Z1xkn2cJEfYwER7XKvMYLTBsI5bp2dRy
 2dOXmjVb/feYmP3Ko8lOYXkpBwH6JKDnYAxSwFrpC1hF35El5HIVI+TRqvS04F+DeWYFR46s
 J9OAjXkBJppJpMJjk71atANlVEliOfQAOK6UbaYUsxIbVcMYD87jh5+kPIOjIdtgNyoayuAo
 tq3qMDEULOf82cc3lk8teTb9HuDgNyo4GlD5wVkP6gR1LPjvyJ94Kw3dPnZw0TQGuG4LsbiL
 87fwbew+H/u/htFIrtJRZ6iLyXm6paLVeS/oiI+t5qK23CulQRrukoPD9IOaF8/ttm8t4sZJ
 OOhF3CHYVxB0qXkwIzxWvTDes10FfUuFLTveRBTvSEPpqFvnrSFL/hGVSkL0YMkFulfL1xB2
 vcWNgI0QDuB1+Cv3e/ja64xr5F2RCXrFNt3VnBIyDjYCbAtQIzZQrWM7thdtNsyrpkQR7CEP
 ZNfMGc+KkuYC/FMEg5/5JYWteGknHTgNRZfr0qYv/Ef6GnP1g1hlrPqNbI5f/TTH5UKxxvB+
 TquE2LRORZZLN+5wDe/qCixvM2Qsijgd6JPPejtnhJtqALKnTFCYPEMbnOrrP/8hkOgVtZ3L
 00P5jFovaU07FasTNT2Q1u/unHsljw2VsdUEuY6wBqQ0aeS6AGcbkAbShZRZdpgs9U5LQHGz
 XfQwYmvX2Y29uTIGDTCrt94sA9eJwA7EGAtbiEafzIryNuzopgu00ruCYtKRfvdYsLOJd3g/
 9ybhHFh3+1O3ZRWiPXTwLzRv967SnH0ou8JCub/BDvNAvtRPtLNWmBRwQGzAQx8BIiYVEKdm
 3MPhtKT6usDZbnUy3TVHbRUQuz5vq/ZWNE5vbKJN8N5n9hK0yfzFb28HRkkfBs5Wir6UWOBj
 LDvVfN5u8YIYSrCgV5faIOtEcU6pZUM5vy8Ps04muFmO8ArHCfepXEGWKJl9zy1+KTauf1la
 MjznAfFJSpyNJmLOxLsHblHieRwlntWKKG6bcmT8ilLGIG2PBa9IYrp+nPXBgzlxMtoeDnoz
 us=
IronPort-HdrOrdr: A9a23:cseX0auhqx3XIcHa8AxtN5RO7skDTtV00zEX/kB9WHVpmszxra
 6TdZMgpGbJYVcqKRcdcL+7WJVoLUmxyXcx2/h1AV7AZniAhILLFvAA0WKK+VSJcEeSygce79
 YFT0EXMqyJMbEQt6fHCWeDfOrIuOP3kpyVuQ==
X-Talos-CUID: =?us-ascii?q?9a23=3AfaLF8mmgz0ru7bxjCyTjKQNgpQnXOVPgw1jbLVG?=
 =?us-ascii?q?KMEhCSu2XUELNoIIjzuM7zg=3D=3D?=
X-Talos-MUID: =?us-ascii?q?9a23=3ApLZs0Q1+3WwvlCVPfCXW4kWWSzUj2KPtEEMrmJg?=
 =?us-ascii?q?84ZOZDw4vFDyGoxTqa9py?=
X-IronPort-AV: E=Sophos;i="6.04,219,1695700800"; 
   d="scan'208";a="128715170"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH 1/3] x86/apic: Drop atomic accessors
Date: Wed, 22 Nov 2023 14:27:31 +0000
Message-ID: <20231122142733.1818331-2-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20231122142733.1818331-1-andrew.cooper3@citrix.com>
References: <20231122142733.1818331-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

The last users were dropped in commit 413e92e9bf13 ("x86/apic: Drop
workarounds for Pentium/82489DX erratum").

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>
---
 xen/arch/x86/include/asm/apic.h | 13 -------------
 1 file changed, 13 deletions(-)

diff --git a/xen/arch/x86/include/asm/apic.h b/xen/arch/x86/include/asm/apic.h
index f7ad7b20dd80..288b4933eb38 100644
--- a/xen/arch/x86/include/asm/apic.h
+++ b/xen/arch/x86/include/asm/apic.h
@@ -54,11 +54,6 @@ static __inline void apic_mem_write(unsigned long reg, u32 v)
 	*((volatile u32 *)(APIC_BASE+reg)) = v;
 }
 
-static __inline void apic_mem_write_atomic(unsigned long reg, u32 v)
-{
-	(void)xchg((volatile u32 *)(APIC_BASE+reg), v);
-}
-
 static __inline u32 apic_mem_read(unsigned long reg)
 {
 	return *((volatile u32 *)(APIC_BASE+reg));
@@ -97,14 +92,6 @@ static __inline void apic_write(unsigned long reg, u32 v)
         apic_mem_write(reg, v);
 }
 
-static __inline void apic_write_atomic(unsigned long reg, u32 v)
-{
-    if ( x2apic_enabled )
-        apic_wrmsr(reg, v);
-    else
-        apic_mem_write_atomic(reg, v);
-}
-
 static __inline u32 apic_read(unsigned long reg)
 {
     if ( x2apic_enabled )
-- 
2.30.2


