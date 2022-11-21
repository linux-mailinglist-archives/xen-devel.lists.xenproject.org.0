Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 82FF6632631
	for <lists+xen-devel@lfdr.de>; Mon, 21 Nov 2022 15:38:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.446650.702335 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ox7vZ-0004iE-P2; Mon, 21 Nov 2022 14:37:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 446650.702335; Mon, 21 Nov 2022 14:37:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ox7vZ-0004fa-Kf; Mon, 21 Nov 2022 14:37:41 +0000
Received: by outflank-mailman (input) for mailman id 446650;
 Mon, 21 Nov 2022 14:37:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=W5PF=3V=citrix.com=prvs=31798088b=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1ox7vY-0004fJ-0G
 for xen-devel@lists.xenproject.org; Mon, 21 Nov 2022 14:37:40 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0a9e9316-69aa-11ed-8fd2-01056ac49cbb;
 Mon, 21 Nov 2022 15:37:38 +0100 (CET)
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
X-Inumbo-ID: 0a9e9316-69aa-11ed-8fd2-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1669041458;
  h=from:to:cc:subject:date:message-id:mime-version;
  bh=/mQb6IKbpG71pb7gDLB0PeGeWHy9p1e+43GdXuFxaE4=;
  b=QBc3YjD3YMOCPjV/K1QnSvxArNfldy+cWMdifQUKkcfBO8mZghcVYndU
   lwJHhZkPOpM1kdT5Ad43BYCNfhZBYvXjXnYNEXdSgXHyveYPO1MZ4tEjG
   XelXGXTDmrUQIKcVlOdHOBagpxpQ/QbgPFsCvyOIp1XnV7tlVzDtyDtpQ
   s=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: None
X-MesageID: 85675813
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:Lb+iOqp0eN8arSpVsc36443ce5heBmIvZRIvgKrLsJaIsI4StFCzt
 garIBmBaPzcZWuheIoja42y8EwOuJDTmIQ1Hgc+rCA0HigS95uZCYyVIHmrMnLJJKUvbq7FA
 +Y2MYCccZ9uHhcwgj/3b9ANeFEljfngqoLUUbKCYWYpAFc+E0/NsDo788YhmIlknNOlNA2Ev
 NL2sqX3NUSsnjV5KQr40YrawP9UlKm06W1wUmAWP6gR5gaHzSBNVfrzGInqR5fGatgMdgKFb
 76rIIGRpgvx4xorA9W5pbf3GmVirmn6ZFXmZtJ+AsBOszAazsAA+v9T2Mk0MC+7vw6hjdFpo
 OihgLTrIesf0g8gr8xGO/VQO3kW0aSrY9YrK1Dn2SCY5xWun3cBX5yCpaz5VGEV0r8fPI1Ay
 RAXACkgbjGH1suk+piYe9tToM0nIsfBDapK7xmMzRmBZRonaZXKQqGM7t5ExjYgwMtJGJ4yZ
 eJAN2ApNk6ZJUQSZBFHU/rSn8/x7pX7WxRepEiYuuwc5G/LwRYq+LPsLMDUapqBQsA9ckOw9
 j+YoDmpW0py2Nq39RmP+Cr1hdXztz71d4UiLZei9t16qQjGroAUIEJPDgbqyRWjsWayVN5SJ
 FYd0jY/pqg1skqwR5/yWAPQiHKcpRsdR9p4GvU38h2Q0bHT5xuFB28CVXhKb9lOnM0/QzAwx
 0KKt9zsDD1r9raSTBq11rqStyL0BiETIkcLfypCRgwAi/HzrYd2gh/RQ9JLFK+uksazCTz22
 yqNriU1m/MUl8Fj6kmg1QmZ2XT2/MGPF1NroFWMNo640u9nTJeIZ62suHHJ19xjHbSmaFCFs
 nYuquHLuYjiEqqxvCCKRewMGpSg6PCELCDQjDZTInUxy9i+0yX9JN4NuVmSMG8sa59ZImGxP
 Cc/rCsLvPdu0G2Wgbibim5bI+Aj1uDeGNvsTZg4hfIeM8EqJGdrEMyDDHN8PlwBc2B2y8nT3
 Kt3lu7yZUv28Yw9kFKLqx41iNfGBkkWnAs/v6zTwRW9yqa5b3WIU7oDO1bmRrlnsvPV/lSPq
 IoBb5fiJ/BjvArWO3i/zGLuBQpScShT6W7e9qS7idJv0iI5QTp8Wpc9MJsqepB/nrQ9qws71
 ijVZ6KZoXKh7UD6xfKiMC44N+K3Acoh8BrW/0UEZD6V5pTqWq73hI93Snf9VeBPGDBLpRKsc
 8Q4Rg==
IronPort-HdrOrdr: A9a23:/ia8v6HjHiy0okX7pLqE/MeALOsnbusQ8zAXP0AYc3Nom62j5q
 STdZsgtCMc5Ax9ZJhCo6HkBEDjexPhHPdOiOF7V4tKNDOW2ldAR7sN0WKN+VHd8lXFh41g6Z
 s=
X-IronPort-AV: E=Sophos;i="5.96,181,1665460800"; 
   d="scan'208";a="85675813"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Anthony PERARD
	<anthony.perard@citrix.com>, Henry Wang <Henry.Wang@arm.com>, Daniel De Graaf
	<dgdegra@tycho.nsa.gov>, Daniel Smith <dpsmith@apertussolutions.com>, Jason
 Andryuk <jandryuk@gmail.com>
Subject: [PATCH for-4.17 0/2] Even more XSA-409 fixes
Date: Mon, 21 Nov 2022 14:37:29 +0000
Message-ID: <20221121143731.27545-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Content-Type: text/plain

Once more, with feeling...

Patch 1 has been posted previously, but has accumulated another bugfix.

Patch 2 has been discussed on list, but this is the first posting.  I've
confirmed that it fixes the issue reported by OSSTest.

Andrew Cooper (2):
  tools/libxl: Fixes to libxl__domain_set_paging_mempool_size()
  xen/flask: Wire up XEN_DOMCTL_{get,set}_paging_mempool_size

 tools/flask/policy/modules/dom0.te  |  3 ++-
 tools/flask/policy/modules/xen.if   |  2 +-
 tools/libs/light/libxl_dom.c        | 10 +++++++++-
 xen/xsm/flask/hooks.c               |  6 ++++++
 xen/xsm/flask/policy/access_vectors |  4 ++++
 5 files changed, 22 insertions(+), 3 deletions(-)

-- 
2.11.0


