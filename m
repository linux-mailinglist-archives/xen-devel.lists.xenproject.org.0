Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A49E52AC21
	for <lists+xen-devel@lfdr.de>; Tue, 17 May 2022 21:42:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.331458.554984 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nr34h-0001zA-IQ; Tue, 17 May 2022 19:41:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 331458.554984; Tue, 17 May 2022 19:41:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nr34h-0001wo-EF; Tue, 17 May 2022 19:41:43 +0000
Received: by outflank-mailman (input) for mailman id 331458;
 Tue, 17 May 2022 19:41:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=juf1=VZ=citrix.com=prvs=1294c2b73=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1nr34g-0001wE-D0
 for xen-devel@lists.xenproject.org; Tue, 17 May 2022 19:41:42 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5e4c22c5-d619-11ec-bd2c-47488cf2e6aa;
 Tue, 17 May 2022 21:41:40 +0200 (CEST)
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
X-Inumbo-ID: 5e4c22c5-d619-11ec-bd2c-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1652816500;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version;
  bh=vnkTDze3G4oFOaHVWufMPnc4Xim+l6INdmwqKwzAzBc=;
  b=IopsoZYcgWM3VmNXwNExevkOpDvh6dVLO+j8hs72glae7McHlF/Hd0WA
   UeoVDyLZswu4K1PYr2O2xc5pPfj2nfJtn/7D7q5Y/fp8EXsom2z/j29Wh
   NRWsvM6rVMKvZ773Jam6DyXE96BQ0PNyApsj8jf34/SCnbSfSiVN3RR6p
   k=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 5.1
X-MesageID: 71530633
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:QB/tyajVZOaFHuG4PLaS3DGYX161aRAKZh0ujC45NGQN5FlHY01je
 htvXmzSa/iNZDb8eNFxO46//BsCsZ/TyNU1HlA9qS03Fnkb9cadCdqndUqhZCn6wu8v7a5EA
 2fyTvGacajYm1eF/k/F3oDJ9CU6jefSLlbFILas1hpZHGeIcw98z0M68wIFqtQw24LhXlrS4
 YmaT/D3YzdJ5RYlagr41IrbwP9flKyaVOQw5wFWiVhj5TcyplFNZH4tDfjZw0jQG+G4KtWSV
 efbpIxVy0uCl/sb5nFJpZ6gGqECaua60QFjERO6UYD66vRJjnRaPqrWqJPwwKqY4tmEt4kZ9
 TlDiXC/YUAyP/L9v89AaUJFNihsZZ8Y34LGBXfq5KR/z2WeG5ft6/BnDUVwNowE4OdnR2pJ8
 JT0KhhUMErF3bjvhuvmFK883azPL+GyVG8bklhmwSvUErANRpfbTr+RzdRZwC0xloZFGvO2i
 88xNmMyN0yeOEYn1lE/LpQ8l8ywjGvEcWdosgKE+u0nxmjew1kkuFTqGIWMIYHbLSlPpW6Uq
 GvJ8GX+BhAyL8GExHyO9XfEruvSliq9VosUH7C88uNCiUeWgGcUDXU+RVa95PW0lEO6c9ZeM
 FAPvDojq7Ao806mRcW7WAe3yFaGsQQbQMF4CPAh5UeGza+83uqCLjFaFHgbMoVg7ZJoA2xxv
 rOUoz/3LXt0seKkblnAzOyJiDqgYRpLClIDQSBRGGPp/OLfiI00ixvOSPNqH6i0ksD5FFnM/
 tyakMQtr+5N1JBWjs1X6XiC2mvx/caREmbZ8y2NBgqYAhVFiJlJjmBCwXzS9r5+IYmQVTFtV
 1BUypHFvIji4Xxg/RFhodnh/pn0vp5p0xWG2DaD+qXNEBz0ohaekXh4um0WGauQGp9slcXVS
 EHSoxhNw5RYIWGna6R6C6roVZlwnfG6SYm8CKuMBjarXnSWXFbXlByCmGbKhzy9+KTSuf9X1
 WinnTaEUi9BVPUPIMueTOYBy747rh3SNkuILa0XOy+PiOLEDFbMEO9tGALXMogRsfLfyC2Io
 ok3Cid/40gGOAEISnKPodB7wJFjBSVTOK0aXOQMKLLSelc8STh4YxITqJt4E7FYc21uvr+g1
 hmAtoVwkTITWVWvxd22V01e
IronPort-HdrOrdr: A9a23:d5IKDqrWHMe8to6ujUaAKlgaV5rReYIsimQD101hICG9Evb0qy
 lhppQmPH7P+VIssRQb8+xoV5PufZqxz/BICOoqTNKftWvdyQiVxehZhOOP/9SJIUbDH4VmpM
 VdmsZFaeEZDTJB/LvHCAvTKadd/DFQmprY+ts3zB1WPH9Xg7kL1XYfNu4CeHcGPzWvA/ACZf
 yhz/sCnRWMU1INYP+2A3EUNtKz3eEixPrdEGc77wdM0nj3sQ+V
X-IronPort-AV: E=Sophos;i="5.91,233,1647316800"; 
   d="scan'208";a="71530633"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Juergen Gross
	<jgross@suse.com>, Dario Faggioli <dfaggioli@suse.com>, Luca Fancellu
	<luca.fancellu@arm.com>
Subject: [PATCH 1/2] xen/cpupool: Reject attempts to add a domain to CPUPOOLID_NONE
Date: Tue, 17 May 2022 20:41:12 +0100
Message-ID: <20220517194113.2574-2-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20220517194113.2574-1-andrew.cooper3@citrix.com>
References: <20220517194113.2574-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain

c/s cfc52148444f ("xen/domain: Reduce the quantity of initialisation for
system domains") removed the path in domain_create() which called
sched_init_domain() with CPUPOOLID_NONE for system domains.

Arguably, that changeset should have cleaned up this path too.

However, c/s 92ea9c54fc81 ("arm/dom0less: assign dom0less guests to cpupools")
changed domain_create() from using a hardcoded poolid of 0, to using a value
passed by the toolstack.

While CPUPOOLID_NONE is an internal constant, userspace can pass -1 for the
cpupool_id parameter and attempt to construct a real domain using default ops,
which at a minimum will fail the assertion in dom_scheduler().

Fixes: 92ea9c54fc81 ("arm/dom0less: assign dom0less guests to cpupools")
Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Juergen Gross <jgross@suse.com>
CC: Dario Faggioli <dfaggioli@suse.com>
CC: Luca Fancellu <luca.fancellu@arm.com>
---
 xen/common/sched/cpupool.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/xen/common/sched/cpupool.c b/xen/common/sched/cpupool.c
index f6e3d97e5288..f1aa2db5f463 100644
--- a/xen/common/sched/cpupool.c
+++ b/xen/common/sched/cpupool.c
@@ -619,8 +619,6 @@ int cpupool_add_domain(struct domain *d, unsigned int poolid)
     int rc;
     int n_dom = 0;
 
-    if ( poolid == CPUPOOLID_NONE )
-        return 0;
     spin_lock(&cpupool_lock);
     c = cpupool_find_by_id(poolid);
     if ( c == NULL )
-- 
2.11.0


