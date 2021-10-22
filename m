Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0751C4375AC
	for <lists+xen-devel@lfdr.de>; Fri, 22 Oct 2021 12:48:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.214952.373868 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mds5y-0007JG-6B; Fri, 22 Oct 2021 10:48:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 214952.373868; Fri, 22 Oct 2021 10:48:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mds5y-0007Fh-2G; Fri, 22 Oct 2021 10:48:18 +0000
Received: by outflank-mailman (input) for mailman id 214952;
 Fri, 22 Oct 2021 10:48:16 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=h+2b=PK=citrix.com=lin.liu@srs-us1.protection.inumbo.net>)
 id 1mds5w-00063m-SN
 for xen-devel@lists.xenproject.org; Fri, 22 Oct 2021 10:48:16 +0000
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f06f55d9-7516-4143-8db2-48f17f8c1914;
 Fri, 22 Oct 2021 10:48:07 +0000 (UTC)
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
X-Inumbo-ID: f06f55d9-7516-4143-8db2-48f17f8c1914
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1634899687;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=arMkqO0Q4MIEtmu8VJig4sN6edJ7nb/bgiFiX5lqa8c=;
  b=eTJv55e3Lp+uU2aC716fPVPYRjVGdtIWgf4iSwrf/a/5IjBbkEa4wsik
   U3R6csVQorfoMOpi+JUJldRqRojW28Xx5rvfavEAqestOQyFy1Dz5kwQx
   rIzZdAbeldEYLnYxAScMzJg0AFB9x9rtLCVxzpgtMrAsscuAX0R1rG2UX
   0=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: gzgD0Aqt+8NJtKdFIeJMXLFKKycQr/Rx0IQcq1ZbxHWWR+jiKWE3ua5xfsK6L25JhTLomjrqig
 JRJJ0niuWCQYwy30tlVbiETg0H8vgG8BpmN6GIF9BKs+c5fw73K6Q2PVfgHCxl4oGJcCMaTmlN
 l9vrVLQBN8wIq4OsWIA3Iwz7IJSzkmRKYLyp7zAWsveEaJHUpl+cPcmt8ZJgQEuHkiv7kNZ6IN
 96cY7gCrGao64wenrjjVTLZLInkfkfkYmm3Q7UHfSziKGKlqY16CgKRX7UtOiij7CdOk8Ol3yV
 X53l6uT4DECkXO/8qdRdwGvZ
X-SBRS: 5.1
X-MesageID: 55376143
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:8FGM6K58AzjVO4ztE7kwegxRtNfAchMFZxGqfqrLsTDasY5as4F+v
 mUcWGCDafbZZ2L0c9kgbNni9hsOvpXcyd43TAZt/ithHi5G8cbLO4+Ufxz6V8+wwmwvb67FA
 +E2MISowBUcFyeEzvuV3zyIQUBUjclkfJKlYAL/En03FVAMpBsJ00o5wrdh2NQw27BVPivW0
 T/Mi5yHULOa82Yc3lI8s8pvfzs24ZweEBtB1rAPTagjUG32zhH5P7pGTU2FFFPqQ5E8IwKPb
 72rIIdVXI/u10xF5tuNyt4Xe6CRK1LYFVDmZnF+A8BOjvXez8CbP2lS2Pc0MC9qZzu1c99Zz
 PxGkYyRRyQQGYL+qe5NSwhKIX9+IvgTkFPHCSDXXc27ykTHdz3nwul0DVFwNoodkgp1KTgQr
 7pCcmlLN03dwbLtqF64YrAEasALKMjteocep1lrzC3DDOZgSpfGK0nPzYIFh2hu35wVdRrYT
 +4Dcj5mTTXMWT0VAmUMMp0Rs/+xnHaqJlW0r3rK/PFqsgA/1jdZ0qXpMdfTUsyHQ4NShEnwj
 lzB+2P1ExQLLuu1wDCO8m+vruLXlCa9U4UXfJWo+/gvjFCNy2g7DBwNSUD9sfS/klS5Wd9UN
 woT4CVGhbMp6EWhQ935Xhu5iH2JpBgRX5xXCeJS1e2W4vOKuUDDXDFCF2MfLox93CMredA0/
 luglPf5JDJMiZq6e0OXpq+FvwHsOTdAeAfuehQ4ZQcC5tDipqQ6gRTOUstvHcaJszHlJd3j6
 2vV9HZm1t3/meZOjv/hpQmW3FpAs7CQFlZtjjg7SF5J+e+QiGSNXIev9UTApchJKIKUXzFtV
 1BVxpDAsoji4XyL/RFhodnh/pn1uJ5p0xWG2DaD+qXNERz3pxZPmqgLuFlDyL9BaJpsRNMQS
 Ba7VfltzJFSJmC2SqR8fpi8Dc8npYC5S4+5BqyNMYoWOcUgHONiwM2ITRTMt4wKuBN0+ZzTx
 L/BKZr8ZZrkIfQPIMWKqxc1juZwm3FWKZL7TpHn1RW3uYdyl1bOIYrpxGCmN7hjhIvd+V292
 48Ga6OilkUOOMWjM3K/2dNCcjg3wY0TWMmeRzp/LbXYfGKL2QgJVpfs/F/WU9U0xvoPzr6Vp
 i3Vt40x4AOXuEAr4D6iMhhLAI4Dl74mxZ7iFSBzb1uuxVY5ZoOjsPUWe5ctJOF1/+1/1/9kC
 fICfpzYUPhITz3G/RUbbIX889M+JEj621rWMnr3eiU7cr5hWxfNpo3ucDzw+XRcFSGwr8Y//
 eGtj1uJXZoZSg1+J8/Kc/bznUiptH0QlbsqDUvFK9VeYmv2941uJ3Cjh/M7OZhUex7C2iGbx
 0CdBhJB/bvBpIo88d/og6GYrtj2T7siTxQCR2SCtOS4LyjX+Gan0LRsaufQcGCPTn7w9YWje
 f5Rk6P2PsoYkQsYqIF7Cbtqk/4zvoO9u79Aww14N3zXdFD3WKh4K3yL0MQT5K1AwrhV5Vm/V
 k6Vo4QIPLyIPIXuEUILJRpjZeOGjKlGlj7X5PUzAUP7+C4oo+bXDRQMZ0GB2H5HMb94EII52
 uNw6scZ5ju2hgcuLtvb3Dtf8H6BLyBYXqgq3n3A7FQHVub/Jol+XKHh
IronPort-HdrOrdr: A9a23:+CjiXa7kuJroxuP+VwPXwPDXdLJyesId70hD6qhwISY6TiX+rb
 HJoB17726NtN9/YhEdcLy7VJVoBEmskKKdgrNhWotKPjOW21dARbsKheCJrgEIWReOktK1vZ
 0QCpSWY+eQMbEVt6nHCXGDYrQd/OU=
X-IronPort-AV: E=Sophos;i="5.87,172,1631592000"; 
   d="scan'208";a="55376143"
From: Lin Liu <lin.liu@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Lin Liu <lin.liu@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v2 3/7] arm64/find_next_bit: Remove ext2_swab()
Date: Fri, 22 Oct 2021 10:47:24 +0000
Message-ID: <ad5aba3410913496254975e1ad531708329246aa.1634897942.git.lin.liu@citrix.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <cover.1634897942.git.lin.liu@citrix.com>
References: <cover.1634897942.git.lin.liu@citrix.com>
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
Cc: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
The patches are not well tested without running environment
---
 xen/arch/arm/arm64/lib/find_next_bit.c | 40 ++++++--------------------
 1 file changed, 8 insertions(+), 32 deletions(-)

diff --git a/xen/arch/arm/arm64/lib/find_next_bit.c b/xen/arch/arm/arm64/lib/find_next_bit.c
index 8ebf8bfe97..8a7cfc0949 100644
--- a/xen/arch/arm/arm64/lib/find_next_bit.c
+++ b/xen/arch/arm/arm64/lib/find_next_bit.c
@@ -8,9 +8,9 @@
  * as published by the Free Software Foundation; either version
  * 2 of the License, or (at your option) any later version.
  */
-#include <xen/bitops.h>
 #include <asm/types.h>
-#include <asm/byteorder.h>
+#include <xen/bitops.h>
+#include <xen/byteswap.h>
 
 #ifndef find_next_bit
 /*
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


