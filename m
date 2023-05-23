Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2197D70E1F6
	for <lists+xen-devel@lfdr.de>; Tue, 23 May 2023 18:38:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.538556.838614 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q1V1y-0007UD-QU; Tue, 23 May 2023 16:38:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 538556.838614; Tue, 23 May 2023 16:38:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q1V1y-0007PQ-MD; Tue, 23 May 2023 16:38:38 +0000
Received: by outflank-mailman (input) for mailman id 538556;
 Tue, 23 May 2023 16:38:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UuGZ=BM=citrix.com=prvs=5000a0748=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1q1V1x-0006Dq-Jl
 for xen-devel@lists.xenproject.org; Tue, 23 May 2023 16:38:37 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 42cb2ca4-f988-11ed-b22d-6b7b168915f2;
 Tue, 23 May 2023 18:38:36 +0200 (CEST)
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
X-Inumbo-ID: 42cb2ca4-f988-11ed-b22d-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1684859916;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=oXOI7IkQMJP7o4IIkYu8XpZs5Gw1LndgpIXVIuwSGWc=;
  b=dcSCdl1DFMRYwiNWU9AoKyUN1Zz1KocQVbmVceRRGVDsRwEyOzuz7K24
   vrdrLUMAEiz6DgXMQJykwgMlskB3fte9isnp8k816utr3mLy8JcKLDQUZ
   fF3PlXwGbn5dxcJJatsMUfwhAaxBiU27oXiOzbEoIZ0dkKtxqa9Y1jI42
   0=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 108859051
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:MSn1xa06NhDT0h62v/bD5eBxkn2cJEfYwER7XKvMYLTBsI5bpzYOz
 DQdDTjVOP+Pa2qnL4t0b9+z8UlT6J+BmIVhTgRopC1hF35El5HIVI+TRqvS04F+DeWYFR46s
 J9OAjXkBJppJpMJjk71atANlVEliefTAOK6ULWeUsxIbVcMYD87jh5+kPIOjIdtgNyoayuAo
 tq3qMDEULOf82cc3lk8teTb8HuDgNyo4GlD5gFkPqgR1LPjvyJ94Kw3dPnZw0TQGuG4LsbiL
 87fwbew+H/u/htFIrtJRZ6iLyXm6paLVeS/oiI+t5qK23CulQRrukoPD9IOaF8/ttm8t4sZJ
 OOhF3CHYVxB0qXkwIzxWvTDes10FfUuFLTveRBTvSEPpqFvnrSFL/hGVSkL0YMkFulfX14fq
 qYfdTYxcgGGrciUzLumZ+VXr5F2RCXrFNt3VnBIyDjYCbAtQIzZQrWM7thdtNsyrpkQR7CEP
 ZNfMGcxKk2aOHWjOX9OYH46tO6umnn4dSwesF+PrLA7y2PS0BZwwP7mN9+9ltmiHJ0FzhvJ/
 j+fl4j/KgAiDO60lzvayFfylPWRp3zpXbw3ObLto5aGh3XMnzdOWXX6T2CTsfS/z0KzRd9bA
 0gV4TY167g/8lSxSdvwVAH+p2SL1jYeUddNF+wx6CmW17HZpQ2eAwAsTCNFadEgnN87Q3otz
 FDht8jyGTVlvbmRSHSc3rSZtzW/PW4SN2BqTTAAZRsI5Z/kuo5bs/7UZo89Sujv1ISzQGyuh
 WnQ90DSmon/k+ZV6PTkp1eahQ6wt53jZCw57xj6UlmMu1YRiJGeW6Sk7l3S7PBlJYmfT0Wcs
 HVsp/Vy/NziHrnWynXTHbxl8KWBoq/cbWaC2QIH84wJrWzFxpK1QWxHDNiSzm9NO91MRzLma
 VS7Veh5tM4KZyvCgUOajuuM5yUWIUrIT4yNuhP8NIAmjn1NmOivoklTiba4hTyFraTVufhX1
 W2nWcitF20GLq9s0SC7QewQuZdymHBimjOLGcuqlkz7uVZ7WJJyYe5fWGZik8hjtP/UyOkr2
 4032zS2J+V3D7SlP3i/HX87JlEWN3krba3LRzhsXrfbeGJOQThxY8I9NJt9I+SJaYwJzLaXl
 px8M2cEoGfCaYrvcl3QOy88MOO+Af6SbxsTZEQRALph4FB7Ca7H0UvVX8BfkWUPnAC78cNJc
 g==
IronPort-HdrOrdr: A9a23:8s1hvaPswhe31MBcTjGjsMiBIKoaSvp037BK7S1MoH1uA6ilfq
 WV9sjzuiWatN98Yh8dcLO7Scy9qBHnhP1ICOAqVN/PYOCBggqVxelZhrcKqAeQeREWmNQ86U
 4aSdkYNDXxZ2IK8foT4mODYqkdKA/sytHXuQ/cpU0dPD2Dc8tbnmFE4p7wKDwNeOFBb6BJba
 a01458iBeLX28YVci/DmltZZm/mzWa/KiWGSLvHnQcmXKzsQ8=
X-Talos-CUID: =?us-ascii?q?9a23=3AZ/4+8mqaoIlVBmf42RefWZ7mUZ4aIyKHyyrWH1O?=
 =?us-ascii?q?pDExDarGcVHKcw4oxxg=3D=3D?=
X-Talos-MUID: 9a23:XrUydwUSV5H+wBDq/C7UvANJasY32YHwGlpTq8oUvvehGCMlbg==
X-IronPort-AV: E=Sophos;i="6.00,186,1681185600"; 
   d="scan'208";a="108859051"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Anthony PERARD <anthony.perard@citrix.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, "Jan
 Beulich" <jbeulich@suse.com>, Julien Grall <julien@xen.org>, "Stefano
 Stabellini" <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Subject: [XEN PATCH 06/15] build: quiet for .allconfig.tmp target
Date: Tue, 23 May 2023 17:38:02 +0100
Message-ID: <20230523163811.30792-7-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230523163811.30792-1-anthony.perard@citrix.com>
References: <20230523163811.30792-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
---
 xen/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/Makefile b/xen/Makefile
index e89fc461fc..27f70d2200 100644
--- a/xen/Makefile
+++ b/xen/Makefile
@@ -339,7 +339,7 @@ filechk_kconfig_allconfig = \
     :
 
 .allconfig.tmp: FORCE
-	set -e; { $(call filechk_kconfig_allconfig); } > $@
+	$(Q)set -e; { $(call filechk_kconfig_allconfig); } > $@
 
 config: tools_fixdep outputmakefile FORCE
 	$(Q)$(MAKE) $(build)=tools/kconfig $@
-- 
Anthony PERARD


