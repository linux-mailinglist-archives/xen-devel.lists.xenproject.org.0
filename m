Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 75F4D5211FC
	for <lists+xen-devel@lfdr.de>; Tue, 10 May 2022 12:16:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.325338.547901 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1noMuP-0006F9-An; Tue, 10 May 2022 10:16:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 325338.547901; Tue, 10 May 2022 10:16:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1noMuP-0006Bu-6T; Tue, 10 May 2022 10:16:01 +0000
Received: by outflank-mailman (input) for mailman id 325338;
 Tue, 10 May 2022 10:15:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JkLT=VS=citrix.com=prvs=122513738=lin.liu@srs-se1.protection.inumbo.net>)
 id 1noMuN-000561-Cd
 for xen-devel@lists.xenproject.org; Tue, 10 May 2022 10:15:59 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2f292f68-d04a-11ec-a406-831a346695d4;
 Tue, 10 May 2022 12:15:58 +0200 (CEST)
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
X-Inumbo-ID: 2f292f68-d04a-11ec-a406-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1652177758;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=tSkw06p+M7uP7rlqOhJWwx1pKczcdXCgiRbYRyRDoo0=;
  b=YITwRWslsgDcRp/wyUTVR+IdD1LIxVUSgmx6s5C/nfy/ODUz9SnQuhQg
   WkwyV1ecEZAv9jntZfi//147gwBM2gBE41nY7Yq5wd3cxGlNFKmz662ZJ
   cLt+46ozJ5Rc/wrhecirW14R0Eykvyq2idsQ7yW5miXOOt9uw9rpt8XdE
   s=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 5.1
X-MesageID: 73450899
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:tPyCraw07xLtcff5x7V6t+cUxirEfRIJ4+MujC+fZmUNrF6WrkUFx
 2QWD2qGP/3eYWX3e9EjbY7k/BtU65HRnYBlQAo5pCAxQypGp/SeCIXCJC8cHc8zwu4v7q5Dx
 59DAjUVBJlsFhcwnj/0bv656yMUOZigHtIQMsadUsxKbVIiGX5JZS5LwbZj2NY12IDhWWthh
 PupyyHhEA79s9JLGjp8B5Kr8HuDa9yr5Vv0FnRnDRx6lAe2e0s9VfrzFonoR5fMeaFGH/bSe
 gr25OrRElU1XfsaIojNfr7TKiXmS1NJVOSEoiI+t6OK2nCuqsGuu0qS2TV1hUp/0l20c95NJ
 Nplv7fuGSN0IfD3vuUMCAVSAisvA6hcweqSSZS/mZT7I0zudnLtx7NlDV0sPJ1e8eFyaY1M3
 aVGcnZXNEnF3r/ohuLgIgVvrp1LwM3DOIIZ/HVh0BnSDOo8QICFSKLPjTNd9Ghr2p0WTaePD
 yYfQWI/UhODaUZIAGZJVZEzsqSzgVLVcCIN/Tp5ooJoujOOnWSdyoPFOtfPZsaDQ8kTm0+Cv
 3/H5EzwGBRcP9uaoRK79Xariv7KjDnMcosYH72l9dZnmFSWgGcUDXU+V0a/oPS/ol6zXZRYM
 UN80jojq+0++VKmSvH5XgakuziUsxgEQd1SHuYmrgaXxcL8+B2FD2IJSjpAbt0Ot8IsQzEuk
 FiTkLvU6SdH6ePPDyjHr/HN8G30aXN9wXI+iTEsRyBbs/2+v9wIqBPeFcppAaTksNjvIGSlq
 9yVlxQWi7IWhM8N8qy0+1Hbnj6hzqT0oh4JChb/BTz8sF4gDGKxT8nxsAWAs64cRGqMZgPZ1
 EXojfRy+wzn4XulsCWWCNsAE7iyjxpuGG2N2AU/d3XNGtnExpJCQWyyyGwnTKuKGpxdEdMMX
 KM0kVkIjKK/xFPwMcdKj3uZUqzGN5TIG9X/TezzZdFTeJV3fwLv1HgwOBTJhTmywBhwyfxX1
 XKnnSGEVy1yNEia5GDuG7d1PUEDmEjSOl8/tbiklk/6gNJylVaeSKsfMUvmUwzKxPjsnekhy
 P4Gb5Hi40wGCIXWO3CLmaZOfAtiBSVqWvjLRzl/K7frzvxOQzlxVZc8ANoJJuRYokiivr2Wo
 SvhChQImDISRxTvcG23V5yqU5u3Nb4XkJ7xFXVE0YqAs5T7XbuS0Q==
IronPort-HdrOrdr: A9a23:tzgFw6P4s74yIMBcTvujsMiBIKoaSvp037Eqv3oRdfUzSL3gqy
 nOpoVh6faaskdzZJhNo7+90ey7MBfhHP1OkO8s1NWZLWvbUQKTRekIh+aP/9SjIVyYygc079
 YZT0EUMr3N5DZB4/oSmDPIduod/A==
X-IronPort-AV: E=Sophos;i="5.91,214,1647316800"; 
   d="scan'208";a="73450899"
From: Lin Liu <lin.liu@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Lin Liu <lin.liu@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v3 3/6] arm64/find_next_bit: Remove ext2_swab()
Date: Tue, 10 May 2022 06:15:21 -0400
Message-ID: <48bdc1be03a77bcc405e327b8022fcd937186e9e.1652170719.git.lin.liu@citrix.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <cover.1652170719.git.lin.liu@citrix.com>
References: <cover.1652170719.git.lin.liu@citrix.com>
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
This patche is not well tested without running environment for arm
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


