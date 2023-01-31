Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E09756838AF
	for <lists+xen-devel@lfdr.de>; Tue, 31 Jan 2023 22:30:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.487846.755573 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pMyC5-0000dv-0G; Tue, 31 Jan 2023 21:29:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 487846.755573; Tue, 31 Jan 2023 21:29:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pMyC4-0000VT-RP; Tue, 31 Jan 2023 21:29:32 +0000
Received: by outflank-mailman (input) for mailman id 487846;
 Tue, 31 Jan 2023 21:29:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qwjI=54=citrix.com=prvs=3886215e8=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pMyC3-0000Nb-Kh
 for xen-devel@lists.xenproject.org; Tue, 31 Jan 2023 21:29:31 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 58507d6a-a1ae-11ed-933c-83870f6b2ba8;
 Tue, 31 Jan 2023 22:29:29 +0100 (CET)
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
X-Inumbo-ID: 58507d6a-a1ae-11ed-933c-83870f6b2ba8
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1675200569;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=9v262fZBQ7E8UCWSJDzUn+RbfirFU1mUCzn0CR2PL+s=;
  b=FZU6LUFluLsEPZGYeWsR0ve0BwgE7Md93X3quPkb9QRpWdqmn+ORviJQ
   rkyq61/amgAV9TGgWYpTI1tPI+tFpCoLc9ABZ4zPzITKzrQ15SS/Gvf8l
   d+MlYYytf2U4pTb3bowI5FjJR5SPl4oGMwc8TyHbPge3tK7y2poF8Cd5x
   s=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 95499177
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:GnY/TaO4PKcnpcDvrR2kl8FynXyQoLVcMsEvi/4bfWQNrUp03jQEm
 mZOWWmHbv7eMzOkfY9xaoWxoBhQ65HQzdMwGwto+SlhQUwRpJueD7x1DKtS0wC6dZSfER09v
 63yTvGacajYm1eF/k/F3oDJ9CU6jufQA+KmU4YoAwgpLSd8UiAtlBl/rOAwh49skLCRDhiE/
 Nj/uKUzAnf8s9JPGj9Suv3rRC9H5qyo42tB5QVmPpingXeF/5UrJMNHTU2OByOQrrl8RoaSW
 +vFxbelyWLVlz9F5gSNy+uTnuUiG9Y+DCDW4pZkc/HKbitq/0Te5p0TJvsEAXq7vh3S9zxHJ
 HehgrTrIeshFvWkdO3wyHC0GQkmVUFN0OevzXRSLaV/ZqAJGpfh66wGMa04AWEX0s9vJDl8s
 t4GESkEYxyn3L6f8oCqc8A506zPLOGzVG8eknRpzDWfBvc6W5HTBa7N4Le03h9p2JoIR6yHI
 ZNEN3w2Nk+ojx5nYz/7DLoXmuuyi2a5WDpfsF+P/oI84nTJzRw327/oWDbQUo3XGZQExxnHz
 o7A10CnBiEfDfGk9SGI3Sy0rf7+kBOlVJ1HQdVU8dY12QbOlwT/EiY+RVa95PW0lEO6c9ZeM
 FAPvDojq7Ao806mRcW7WAe3yFaItwARc8BdGOo77EeK0KW83uqCLjFaFHgbMoVg7ZJoA2Vwj
 Tdlgu8FGxRGqJjNezW/6I6NpD6+HXNJBF0wdBYtGF5tD8bYnKk/iRfGT9BGGaGzj8HoFTyY/
 w1mvBTSlJ1I05dVivzTEUTvxmv1+8OXFlJdChD/BDrN0+9vWGKyi2VEA3D/5O0IEouWR0LpU
 JMsy5nHt7Bm4X1geUWwrAQx8FOBva7t3N702wQH83wdG9OFpRaekXh4um0WGauQGp9slcXVS
 EHSoxhNw5RYIWGna6R6C6roVZt3lPm4TYy4DKqLBjarXnSWXFbXlByCmGbKhzy9+KTSuf5X1
 WinnTaEUi9BVPUPIMueTOYBy747rh3SNkuKLa0XOy+PiOLEDFbMEOdtDbd7RrxhhE9yiFmPo
 ok32grj40k3bdASlQGMqNJNdg9XcSJrbX00wuQOHtO+zsNdMDlJI5fsLXkJIuSJQ4w9ej/0w
 0yA
IronPort-HdrOrdr: A9a23:Gg2VgautOE79EJcYeB9HoSuS7skCb4Aji2hC6mlwRA09TyXGra
 2TdaUgvyMc1gx7ZJh5o6H5BEGBKUm9yXcH2/hrAV7CZniuhILGFvAH0WKP+VPd8mjFh5dgPM
 RbAuBD4b/LfD9HZK/BiWHVfOrIguP3lpxA7t2urEuFODsaDp2ImD0JaDpzfHcWeCB2Qb4CUL
 aM7MtOoDStPVwRc8SAH3EAG8TTutHRk5riQBgeQzoq8hOHgz+E4KPzV0Hw5GZVbxp/hZMZtU
 TVmQ3w4auu99m91x/nzmfWq7hGhdf7zdNHJcqUzuwYMC/lhAqEbJloH5eCoDc2iuey70tCqq
 iGnz4Qe+BIr1/BdGC8phXgnyP61iw11nPkwViExVP+vM3QXlsBeoZ8rLMcViGcx1srvdl63q
 4O9XmerYBrARTJmzm4z8TUVittilG/rRMZ4KEuZj1kIMUjgY1q3MwiFXBuYdQ99eXBmcIa+d
 xVfYDhDTBtABanhj7izy1SKZeXLw4O91+9MzU/U4quonVrdTlCvjcl7d1akXEa+J0nTZ5Yo+
 zCL6RzjblLCtQbdKRnGY46ML+K40H2MGDx2VipUCHaPbBCP2iIp4/84b0z6u3vcJsUzIEqkJ
 CEVF9Dr2Y9d0/nFMXLhfRwg2bwaXT4WS6oxtBV5pB/tLG5TL33MTebQFRrl8e7uf0QDsDSRv
 72MpNLBP3oK3foBO9yrnrDcogXLWNbXNweu949VV7LqsXXKpfyvuiea/rXLKqFK0dWZoo+OA
 pyYNHeHrQw0qnwYA6GvPH4YQKSRnDC
X-IronPort-AV: E=Sophos;i="5.97,261,1669093200"; 
   d="scan'208";a="95499177"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Christian Lindig
	<christian.lindig@citrix.com>, David Scott <dave@recoil.org>,
	=?UTF-8?q?Edwin=20T=C3=B6r=C3=B6k?= <edwin.torok@cloud.com>, Rob Hoes
	<Rob.Hoes@citrix.com>
Subject: [PATCH 0/7] tools/ocaml: Memory corruption fixes in bindings
Date: Tue, 31 Jan 2023 21:29:06 +0000
Message-ID: <20230131212913.6199-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

It turns out there have been some latent memory corruption bugs and other
errors in the bindings since they were first introduced.

These were discovered after realising that we'd introduced other memory
corruption bugs as part of the Ocaml 5 fixes, and in the case of the evtchn
bindings, backported this as part of the oxenstored-lu fixes.

This series addresses all the memory corrupution issues we're aware of that
can occur in an entirely well-formed program.

Deferred for now are the (hopefully latent) memory corruption errors which
happen due to bad parameter passing, and a substantial pile of related cleanup.

Andrew Cooper (3):
  tools/ocaml/libs: Allocate the correct amount of memory for Abstract_tag
  tools/ocaml/evtchn: Misc cleanup
  tools/ocaml/xc: Don't reference Abstract_Tag objects with the GC lock released

Edwin Török (4):
  tools/ocaml/libs: Don't declare stubs as taking void
  tools/ocaml/evtchn: Don't reference Custom objects with the GC lock released
  tools/ocaml/xc: Fix binding for xc_domain_assign_device()
  tools/ocaml/xc: Don't reference Custom objects with the GC lock released

 tools/ocaml/libs/eventchn/xeneventchn_stubs.c |  89 ++---
 tools/ocaml/libs/mmap/Makefile                |   2 +
 tools/ocaml/libs/mmap/xenmmap_stubs.c         |   6 +-
 tools/ocaml/libs/xb/xenbus_stubs.c            |   5 +-
 tools/ocaml/libs/xc/xenctrl_stubs.c           | 494 ++++++++++++++------------
 5 files changed, 323 insertions(+), 273 deletions(-)

-- 
2.11.0


