Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EF5555762BB
	for <lists+xen-devel@lfdr.de>; Fri, 15 Jul 2022 15:27:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.368228.599414 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oCLLk-0000AP-47; Fri, 15 Jul 2022 13:27:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 368228.599414; Fri, 15 Jul 2022 13:27:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oCLLk-00007y-1L; Fri, 15 Jul 2022 13:27:20 +0000
Received: by outflank-mailman (input) for mailman id 368228;
 Fri, 15 Jul 2022 13:27:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xid4=XU=citrix.com=prvs=188d5c0a5=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1oCLLj-00007s-9O
 for xen-devel@lists.xenproject.org; Fri, 15 Jul 2022 13:27:19 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d7bab69d-0441-11ed-924f-1f966e50362f;
 Fri, 15 Jul 2022 15:27:17 +0200 (CEST)
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
X-Inumbo-ID: d7bab69d-0441-11ed-924f-1f966e50362f
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1657891637;
  h=from:to:cc:subject:date:message-id:mime-version;
  bh=rFsX1mk7Lb89Tw58crT1ZMj/2nbs2lEVYgiqDjeDrYU=;
  b=TuF75kvBJZDVJ6ygev/3mfMwKKsY9babql9dlOM1z9osO81SGHrr6MpL
   lZVSO4qK87ppWmIUmcNntcJAFqlbHeWUcj1/aVDIFlO5Qx3hAc+uipv8A
   a8yruqwQWCI2E5+JKO7n9otFUsXvavTLv/MDIPPL7V7s0jd+wEeIrb0pI
   0=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 5.1
X-MesageID: 75187321
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:AaBsdK29vA1bms+pWvbD5SVxkn2cJEfYwER7XKvMYLTBsI5bp2MOn
 WVJX2+GM/2KZmD8Kopyb9m09U1Vvp+BxtdnGQVrpC1hF35El5HIVI+TRqvS04J+DSFhoGZPt
 Zh2hgzodZhsJpPkjk7xdOKn9RGQ7InQLpLkEunIJyttcgFtTSYlmHpLlvUwx4VlmrBVOSvU0
 T/Ji5CZaQXNNwJcaDpOsfrc8U4355wehRtD1rAATaET1LPhvyF94KI3fcmZM3b+S49IKe+2L
 86rIGaRpz6xE78FU7tJo56jGqE4aue60Tum0xK6b5OKkBlazhHe545gXBYqheW7vB3S9zx54
 I0lWZVd0m7FNIWU8AgWe0Ew/y2TocSqUVIISJSymZX78qHIT5fj6/5oDmMOMIIdwbtuOl5Wr
 v0iCjVOMDnW0opawJrjIgVtrsEqLc2tN4IDoHBwizreCJ7KQ7iaHf+Mv4UBmm5t2IYeRp4yZ
 OJAAdZrRD3GbwdCJRE8D5Umkf3zrnL+bydZuBSeoq9fD237k1EogOe2aoO9ltqia8JMnFech
 j/6+3nAXz9HOMO95yG3yyf57gPItXyiA99DfFGizdZviUGTx2EOTgEfT0GypdGhkEmiXNRaI
 k0QvCEpqMAa9lGvT9T7dw21pjiDpBF0c/BdCfEg4QeBjI/d+R+EB3MsRyRELtchsaceYSEh3
 xmnltXiCDhrrZWcU3fb/bCRxRuQEyUIKW4JZQcfUBAIpdLkpekbnh/JC9puDqOxptn0Ai3rh
 SCHqjAkgLcehtJN0L+0lXjYhxq8q56PSRQ6ji3MRX6s5A59YI+jZqSr5ELd4PIGK5yWJmRtp
 1BdxZLYtrpXS8jQymrdG43hAY1F+d6ONj/+uVNgGqJ87g+S4yWiR6JVo29XcRIB3tk/RdP5X
 KPCkVoPucADYCr1NPQfj5GZUJpzk/W5fTjxfrWNN4cVPMAsHOOS1Hs2DXN8yVwBh6TFfUsXH
 Z6AOfihAn8BYUiM5GrnHrxNuVPHK81X+I8yeXwY507+uVZmTCTJIYrpyXPXBgzD0IuKoR/O7
 /FUPNaQxhNUXYXWO3eKrt5JdgBRfSJkXvgaTvC7kcbaeGJb9JwJUaeNkdvNhaQ/90iqqgs41
 i7kARIJoLYOrXbGNR+LehheVV8bZr4m9ShTFXV1ZT6AgiFzCa7yvfx3X8ZmItEaGBlLkKcco
 w8tIJ7bXJyii13vplwgUHUKhNczJU/72FjXYXvNjfpWV8cIejElM+TMJmPHnBTixALr3Sfii
 9VMDj/mfKc=
IronPort-HdrOrdr: A9a23:O5riIaFEyGEU/gwzpLqE4MeALOsnbusQ8zAXP0AYc31om62j5q
 aTdZsgpHzJYVoqN03I+urwX5VoI0msl6KdiLN5VdzJMWXbUQOTXeVfBODZowEIdReRygck79
 YET5RD
X-IronPort-AV: E=Sophos;i="5.92,274,1650945600"; 
   d="scan'208";a="75187321"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	<George.Dunlap@eu.citrix.com>, Jan Beulich <JBeulich@suse.com>, "Stefano
 Stabellini" <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, Julien Grall
	<julien@xen.org>, Anthony PERARD <anthony.perard@citrix.com>, Luca Fancellu
	<Luca.Fancellu@arm.com>, Mathieu Tarral <mathieu.tarral@protonmail.com>,
	Bertrand Marquis <Bertrand.Marquis@arm.com>
Subject: [PATCH v2 0/2] xen: Fixes to check-endbr.sh
Date: Fri, 15 Jul 2022 14:26:49 +0100
Message-ID: <20220715132651.1093-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Content-Type: text/plain

I committed the two trivial patches, which leaves the main MAWK fix from
Anthony, and the fix for the portability issue spotted by Jan.

Andrew Cooper (1):
  xen: Fix latent check-endbr.sh bug with 32bit build environments

Anthony PERARD (1):
  xen: Fix check-endbr.sh with mawk

 xen/tools/check-endbr.sh | 30 ++++++++++++++++++++++++++----
 1 file changed, 26 insertions(+), 4 deletions(-)

-- 
2.11.0


