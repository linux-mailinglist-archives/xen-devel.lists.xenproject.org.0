Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1100F53117C
	for <lists+xen-devel@lfdr.de>; Mon, 23 May 2022 17:09:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.335996.560218 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nt9g3-0002cg-LL; Mon, 23 May 2022 15:08:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 335996.560218; Mon, 23 May 2022 15:08:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nt9g3-0002Zn-Ha; Mon, 23 May 2022 15:08:59 +0000
Received: by outflank-mailman (input) for mailman id 335996;
 Mon, 23 May 2022 15:08:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HaIF=V7=citrix.com=prvs=1359a750d=lin.liu@srs-se1.protection.inumbo.net>)
 id 1nt9PU-0004UK-4w
 for xen-devel@lists.xenproject.org; Mon, 23 May 2022 14:51:52 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id dfcb9243-daa7-11ec-bd2c-47488cf2e6aa;
 Mon, 23 May 2022 16:51:50 +0200 (CEST)
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
X-Inumbo-ID: dfcb9243-daa7-11ec-bd2c-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1653317511;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=52aGEXz6/L0mi8JKOaEZHZV/EuUs/IK0pCYUytUMr38=;
  b=XvdNwfClTCQTj+z12XyHP3lB7BbPFHrQ9ywhGRSz8hUaacYcRR3b6bEg
   AS3sujEK6x33oKkcI9V5H6AsueoLAp7a0Uy8HXUZhZQORGFc0556qflbt
   VGFWKmiF4QPSLJiShm9LVtBTjGlmw36lY9sTIVdWhpOPNNO5NbWNYamKR
   g=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 5.1
X-MesageID: 71325017
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:FNmRQKN3Yb9CelXvrR2Gl8FynXyQoLVcMsEvi/4bfWQNrUoh1z0Bm
 zdLUT2PPPneZmT9Kt4ibd6ypE0F7JPVn9UxTgto+SlhQUwRpJueD7x1DKtR0wB+jCHnZBg6h
 ynLQoCYdKjYdleF+lH1dOKJQUBUjclkfJKlYAL/En03FFYMpBsJ00o5wbZk2NUw2LBVPivW0
 T/Mi5yHULOa82Yc3lI8s8pvfzs24ZweEBtB1rAPTagjUG32zhH5P7pGTU2FFFPqQ5E8IwKPb
 72rIIdVXI/u10xF5tuNyt4Xe6CRK1LYFVDmZnF+A8BOjvXez8CbP2lS2Pc0MC9qZzu1c99Z0
 +Qd67/pEVsTJ+7CiPQ5agNpGRpAFPgTkFPHCSDXXc27ykTHdz3nwul0DVFwNoodkgp1KTgQr
 7pCcmlLN03dwbLtqF64YrAEasALKMjteocep1lrzC3DDOZgSpfGK0nPzYABh21t3pkRdRrYT
 5JGYxxhRirfXy10Jw4lK55npPitlmaqJlW0r3rK/PFqsgA/1jdZ0qXpMdfTUsyHQ4NShEnwj
 mjL5XjjCxcWctmW0yOY82mEj/XK2yj8Xeo6Krq88fJ7hUyJ8UYaAhYWSFiTrOGwjwi1XNc3A
 1wZ/G8ioLY/8GSvT8LhRFuorXicpBkeVtFMVeog52mlyKXO6gKdLmEBRyxGbpots8pebScxy
 laDktftBDpumL6YU3SQ8vGTtzzaBMQOBTZcP2leF1JDuoS95tFo5v7Scjp9OLWE3oPWQGms+
 SnJojguo4wJvMQw6YzuqDgrnAmQSoj1oh8dv1uKBTj+vlMiPuZJdKTztwGFsK8owJKxCwDY4
 SNaw5X2APUmV8nlqcCbfAka8FhFDd6hOSaUv1NgFoJJG9+Fqy/6JtA4DN2TyS5U3ic4ldzBO
 ha7Vft5vsM7AZdTRfYfj3iNI8or17P8Mt/uS+rZaNFDCrAoKlLcpn0yORfKhzm9+KTJrU3YE
 c7GGftA8F5AUfg3pNZIb7l1PUAXKtAWmjqIGMGTI+WP2ruCfn+FIYrpw3PXBt3VGJis+V2Pm
 /4GbpPi40wGAIXWP3iMmaZOfA9iEJTOLc2vwyChXrXbclQO9aBII6K5/I7NjKQ8wP0Fx7+Vo
 yjnMqKaoXKm7UD6xcyxQigLQNvSsVxX9ChT0fAEVbpw50UeXA==
IronPort-HdrOrdr: A9a23:ForCf66yyJ9tLQO/ZgPXwPDXdLJyesId70hD6qhwISY6TiX+rb
 HJoB17726NtN9/YhEdcLy7VJVoBEmskKKdgrNhWotKPjOW21dARbsKheCJrgEIWReOktK1vZ
 0QCpSWY+eQMbEVt6nHCXGDYrQd/OU=
X-IronPort-AV: E=Sophos;i="5.91,246,1647316800"; 
   d="scan'208";a="71325017"
From: Lin Liu <lin.liu@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Lin Liu <lin.liu@citrix.com>, Julien Grall <jgrall@amazon.com>, "Andrew
 Cooper" <andrew.cooper3@citrix.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v5 3/6] arm64/find_next_bit: Remove ext2_swab()
Date: Mon, 23 May 2022 10:50:48 -0400
Message-ID: <fd7137e91aa6132e2b6a19c53ecce2cac0295b55.1653314499.git.lin.liu@citrix.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <cover.1653314499.git.lin.liu@citrix.com>
References: <cover.1653314499.git.lin.liu@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

ext2 has nothing to do with this logic.  Clean up the code with
xen/byteswap.h which now has an unsigned long helper.

No functional change.

Signed-off-by: Lin Liu <lin.liu@citrix.com>
Acked-by: Julien Grall <jgrall@amazon.com>
Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>
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


