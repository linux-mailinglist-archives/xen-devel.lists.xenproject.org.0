Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A220530C68
	for <lists+xen-devel@lfdr.de>; Mon, 23 May 2022 11:53:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.335659.559868 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nt4k7-0003dn-5E; Mon, 23 May 2022 09:52:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 335659.559868; Mon, 23 May 2022 09:52:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nt4k6-0003Vx-Re; Mon, 23 May 2022 09:52:50 +0000
Received: by outflank-mailman (input) for mailman id 335659;
 Mon, 23 May 2022 09:52:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HaIF=V7=citrix.com=prvs=1359a750d=lin.liu@srs-se1.protection.inumbo.net>)
 id 1nt4k4-0002dp-ON
 for xen-devel@lists.xenproject.org; Mon, 23 May 2022 09:52:48 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 18e08260-da7e-11ec-837e-e5687231ffcc;
 Mon, 23 May 2022 11:52:46 +0200 (CEST)
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
X-Inumbo-ID: 18e08260-da7e-11ec-837e-e5687231ffcc
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1653299566;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=YEOHu0aPYMpRRwah1nehuHESqF4dTCOGh65pg9RBCsU=;
  b=ag+m0g+QVMleGGMofc0dvnl/T+RVQW6LQuPsfTMXIHcSLU0+L+pN9b88
   fXl7OrGEMBcKEbyV4EbNy305zTEnwL2IpBD+JmyqqYopEyaCk8F7L2aYX
   CpSRV2oAQYMU3tx05uvwdt/VrKnxEpIt6P9E5uwXxq8gjs/jFZUs4y1k2
   s=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 5.1
X-MesageID: 74445150
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:rLCqU6jgwGWJxIN78pwa5VTYX161dBAKZh0ujC45NGQN5FlHY01je
 htvWjuAaf6KY2Kkeoh+aYSw8xlTvZ+ExtM1SgtpryljQXwb9cadCdqndUqhZCn6wu8v7a5EA
 2fyTvGacajYm1eF/k/F3oDJ9CU6jefSLlbFILas1hpZHGeIcw98z0M68wIFqtQw24LhXlnW4
 YqaT/D3YzdJ5RYlagr41IrbwP9flKyaVOQw5wFWiVhj5TcyplFNZH4tDfjZw0jQG+G4KtWSV
 efbpIxVy0uCl/sb5nFJpZ6gGqECaua60QFjERO6UYD66vRJjnRaPqrWqJPwwKqY4tmEt4kZ9
 TlDiXC/YTcrI/Pdk7QQaDd/GgFvDINGv4D9HkHq5KR/z2WeG5ft6/BnDUVwNowE4OdnR2pJ8
 JT0KhhUMErF3bjvhuvmFK883azPL+GyVG8bknVhy3fdDOsOSpHfWaTao9Rf2V/cg+gRQaqCO
 pNEMVKDajzJahEVFH0VOKsEo970qyfnUg1kkhW88P9fD2/7k1UqjemF3MDuUtaHX9lPl0CU4
 GfP5X3kAwoyPcaajzGC9xqEuOjLmi/qXZMII5ex/PVqnV67y3QaDVsdUl7Tifukjk+zXfpPJ
 kpS/TAhxYAi+UruQtTjUhmQpH+fogVaS9dWC/c96gyG1uzT+QnxLnMfUjdLZdgitck3bT8nz
 FmEm5XuHzMHjVGOYSvDrPHO92r0YHVLaz9ZDcMZcecby+nhvd8ihULCdfhEGY6kv/P1Xg7K/
 Anf+UDSmI4vYd43O7STpA6a2Gj39siSFGbZ9S2MADv7s1oRiJqNItXxtAOFtasowJOxFAHpg
 ZQSpySJAAni57mpnTfFfugCFarBCx2tYGyF2g4H83XMGl2QF5+fkWN4umgWyL9BaJpsRNMQS
 Ba7VfltzJFSJmC2SqR8fpi8Dc8npYC5S4m+DKyIMoMUOsEhHONiwM2JTRfNt10BbWB2yf1vU
 XtlWZjE4Ykm5VRPk2PtGrZ1PU4DzSEi32LDLa0XPDz+uYdykEW9EO9fWHPXN7hRxPrd8G39r
 ocEX+PXmko3bQELSnSOmWLlBQtSfSZT6FGfg5E/S9Nv1SI9SDB9UKWImOxJlk4Mt/09q9okN
 0qVAidwoGcTT1WeQelWQhiPsI/SYKs=
IronPort-HdrOrdr: A9a23:igdNq69rBSGM+tJcG0xuk+DgI+orL9Y04lQ7vn2YSXRuHPBw8P
 re+sjztCWE8Ar5N0tBpTntAsW9qDbnhPtICOoqTNCftWvdyQiVxehZhOOIqVDd8m/Fh4pgPM
 9bAtFD4bbLbGSS4/yU3ODBKadD/OW6
X-IronPort-AV: E=Sophos;i="5.91,246,1647316800"; 
   d="scan'208";a="74445150"
From: Lin Liu <lin.liu@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Lin Liu <lin.liu@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v4 3/6] arm64/find_next_bit: Remove ext2_swab()
Date: Mon, 23 May 2022 05:52:19 -0400
Message-ID: <906b399ee86969fb86304c60c3b725326620d50f.1653295437.git.lin.liu@citrix.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <cover.1653295437.git.lin.liu@citrix.com>
References: <cover.1653295437.git.lin.liu@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

ext2 has nothing to do with this logic.  Clean up the code with
xen/byteswap.h which now has an unsigned long helper.

No functional change.

Signed-off-by: Lin Liu <lin.liu@citrix.com>
---
Cc: Stefano Stabellini <sstabellini@kernel.org>
Cc: Julien Grall <julien@xen.org>
Cc: Bertrand Marquis <bertrand.marquis@arm.com>
Cc: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
---
 xen/arch/arm/arm64/lib/find_next_bit.c | 36 +++++---------------------
 1 file changed, 6 insertions(+), 30 deletions(-)

diff --git a/xen/arch/arm/arm64/lib/find_next_bit.c b/xen/arch/arm/arm64/lib/find_next_bit.c
index 8ebf8bfe97..e3b3720ff4 100644
--- a/xen/arch/arm/arm64/lib/find_next_bit.c
+++ b/xen/arch/arm/arm64/lib/find_next_bit.c
@@ -161,30 +161,6 @@ EXPORT_SYMBOL(find_first_zero_bit);
 
 #ifdef __BIG_ENDIAN
 
-/* include/linux/byteorder does not support "unsigned long" type */
-static inline unsigned long ext2_swabp(const unsigned long * x)
-{
-#if BITS_PER_LONG == 64
-	return (unsigned long) __swab64p((u64 *) x);
-#elif BITS_PER_LONG == 32
-	return (unsigned long) __swab32p((u32 *) x);
-#else
-#error BITS_PER_LONG not defined
-#endif
-}
-
-/* include/linux/byteorder doesn't support "unsigned long" type */
-static inline unsigned long ext2_swab(const unsigned long y)
-{
-#if BITS_PER_LONG == 64
-	return (unsigned long) __swab64((u64) y);
-#elif BITS_PER_LONG == 32
-	return (unsigned long) __swab32((u32) y);
-#else
-#error BITS_PER_LONG not defined
-#endif
-}
-
 #ifndef find_next_zero_bit_le
 unsigned long find_next_zero_bit_le(const void *addr, unsigned
 		long size, unsigned long offset)
@@ -199,7 +175,7 @@ unsigned long find_next_zero_bit_le(const void *addr, unsigned
 	size -= result;
 	offset &= (BITS_PER_LONG - 1UL);
 	if (offset) {
-		tmp = ext2_swabp(p++);
+		tmp = bswap_ul(*p++);
 		tmp |= (~0UL >> (BITS_PER_LONG - offset));
 		if (size < BITS_PER_LONG)
 			goto found_first;
@@ -217,7 +193,7 @@ unsigned long find_next_zero_bit_le(const void *addr, unsigned
 	}
 	if (!size)
 		return result;
-	tmp = ext2_swabp(p);
+	tmp = bswap_ul(*p);
 found_first:
 	tmp |= ~0UL << size;
 	if (tmp == ~0UL)	/* Are any bits zero? */
@@ -226,7 +202,7 @@ found_middle:
 	return result + ffz(tmp);
 
 found_middle_swap:
-	return result + ffz(ext2_swab(tmp));
+	return result + ffz(bswap_ul(tmp));
 }
 EXPORT_SYMBOL(find_next_zero_bit_le);
 #endif
@@ -245,7 +221,7 @@ unsigned long find_next_bit_le(const void *addr, unsigned
 	size -= result;
 	offset &= (BITS_PER_LONG - 1UL);
 	if (offset) {
-		tmp = ext2_swabp(p++);
+		tmp = bswap_ul(*p++);
 		tmp &= (~0UL << offset);
 		if (size < BITS_PER_LONG)
 			goto found_first;
@@ -264,7 +240,7 @@ unsigned long find_next_bit_le(const void *addr, unsigned
 	}
 	if (!size)
 		return result;
-	tmp = ext2_swabp(p);
+	tmp = bswap_ul(*p);
 found_first:
 	tmp &= (~0UL >> (BITS_PER_LONG - size));
 	if (tmp == 0UL)		/* Are any bits set? */
@@ -273,7 +249,7 @@ found_middle:
 	return result + __ffs(tmp);
 
 found_middle_swap:
-	return result + __ffs(ext2_swab(tmp));
+	return result + __ffs(bswap_ul(tmp));
 }
 EXPORT_SYMBOL(find_next_bit_le);
 #endif
-- 
2.27.0


