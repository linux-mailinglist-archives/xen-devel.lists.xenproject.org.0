Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E29895EC0CC
	for <lists+xen-devel@lfdr.de>; Tue, 27 Sep 2022 13:16:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.412489.655828 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1od8Ym-0007cx-3c; Tue, 27 Sep 2022 11:15:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 412489.655828; Tue, 27 Sep 2022 11:15:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1od8Ym-0007ab-0M; Tue, 27 Sep 2022 11:15:32 +0000
Received: by outflank-mailman (input) for mailman id 412489;
 Tue, 27 Sep 2022 11:15:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wYJ1=Z6=citrix.com=prvs=262b5a957=edvin.torok@srs-se1.protection.inumbo.net>)
 id 1od8Yj-0007aQ-PX
 for xen-devel@lists.xenproject.org; Tue, 27 Sep 2022 11:15:29 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id aeff83d9-3e55-11ed-9648-05401a9f4f97;
 Tue, 27 Sep 2022 13:15:26 +0200 (CEST)
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
X-Inumbo-ID: aeff83d9-3e55-11ed-9648-05401a9f4f97
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1664277327;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=eZ7SrsaIyeoFLsZJrY7oMN8LSSpDsPO9Cf8rssILgDI=;
  b=Txo65V2A3D+7Y2Xo2XHgKfR+fEoCtqs3mQklECOfCqFpfp1YQOdB6YQK
   d9yshQHAjM4Q4JM4JaPIfmvj/dA7PvWGcirC2Zz/vjroq7Gq9HsPh7hD9
   OnCWZaXPrca0fmUjrXwk+PVIL+DdPURoQ7tNuqiCMqMkW/PWlJ0rIvl5O
   k=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 2.7
X-MesageID: 81413301
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:d9we8q1riDJlIyTXlfbD5axxkn2cJEfYwER7XKvMYLTBsI5bpzUOy
 zEZXT2EPfeKZmD9f9hxOdnl8xgCvZ7TyNZqTgU+pC1hF35El5HIVI+TRqvS04F+DeWYFR46s
 J9OAjXkBJppJpMJjk71atANlVEliefSAOKU5NfsYkhZXRVjRDoqlSVtkus4hp8AqdWiCkaGt
 MiaT/f3YTdJ4BYpdDNPg06/gEk35q6q6WlH5gZWic1j5zcyqVFEVPrzGonpR5fIatE8NvK3Q
 e/F0Ia48gvxl/v6Ior4+lpTWhRiro/6ZWBiuFIPM0SRqkEqShgJ+rQ6LJIhhXJ/0F1lqTzTJ
 OJl7vRcQS9xVkHFdX90vxNwS0mSNoUekFPLzOTWXWV+ACQqflO1q8iCAn3aMqVEy8BqMU4N7
 MY2FypKUSKapPuUzYCSH7wEasQLdKEHPasas3BkizrYEewnUdbIRKCiCd1whWlqwJoURLCHO
 pRfOWEHgBfoOnWjPn8aBIw/mqG0gWP4cBVTqU6PpLpx6G/WpOB0+Oi0bIOOIYTTLSlTtlyIg
 kTj+mb3OQ81M4bB1xie1C6pu+CayEsXX6pNTeblp5aGmma72Wg7GBAQE1yhrpGRhkegVvpFJ
 kcT+y5oqrI9nGS7Q9+4UxCmrXqsuh8HR8EWA+A88BuKyKff/0CeHGdsc9JaQIV47olsH2Vsj
 wLX2YOybdByjFGLYS6s0KqkgnCrAwYqNyg9VzYnVCkI0fC29enfkSnzZtpkFae0iPj8Fjfx3
 y2GoUACulkDsSIY//7lpA6a2lpAsrCMF1dovVuPAgpJ+ysjPOaYi5qUBU83BBqqBKKQVRG/s
 XcNgKByB8heXMjWxERhrAjgdYxFBspp0hWG2TaD/LF7rVxBHkJPmqgPiAyS3G8zbq45lcbBO
 Sc/Qz956p5JJ2eNZqRqeY+3AMlC5fG+S4i/D6+JP4ofOskZmOq7EMZGOiatM53FyhBwwcnTx
 7/CGSpTMZrqIfs+l2fnLwvs+bQq2jo/1QvueHwP9Dz+iOL2WZJgYe1aWLd4RrxmsfjsTcS82
 4o3CvZmPD0ECbWiP3WKreb+7zkidBAGOHw/kOQPHsbrH+asMD1J5yP5qV/5R7FYog==
IronPort-HdrOrdr: A9a23:BF3GSqq63cgtHVHkoJU4qU4aV5oneYIsimQD101hICG8cqSj+f
 xG+85rsiMc6QxhPE3I9urhBEDtex/hHP1OkOws1NWZLWrbUQKTRekIh+bfKlXbakvDH4VmtJ
 uIHZIQNDSJNykZsfrH
X-IronPort-AV: E=Sophos;i="5.93,349,1654574400"; 
   d="scan'208";a="81413301"
From: =?UTF-8?q?Edwin=20T=C3=B6r=C3=B6k?= <edvin.torok@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: =?UTF-8?q?Edwin=20T=C3=B6r=C3=B6k?= <edvin.torok@citrix.com>, "Christian
 Lindig" <christian.lindig@citrix.com>, David Scott <dave@recoil.org>, Wei Liu
	<wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH v2 0/5] tools/ocaml: build/compatibility fixes with OCaml 5.0 for Xen 4.17
Date: Tue, 27 Sep 2022 12:14:56 +0100
Message-ID: <cover.1664276827.git.edvin.torok@citrix.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Changes to previous series:
* removed Dune patches from this series for now (that requires more work to work with osstest on Debian oldstable that won't be ready in time for 4.17)
* also updated xenctrl to work with no naked pointers mode (the only mode in OCaml 5.0)
* changed alloc_custom to use '0' and '1' instead of '1' and '128' for values that are singletons anyway

This can be tested with OCaml <5.0 (e.g. 4.13 or 4.14) with --enable-naked-pointer-checker
to find instances where naked pointers are used or by code review.
(Note that OCaml 5.0 won't have support for naked pointers at all, and thus
it doesn't have the checker either)

It would be good to get this included in Xen 4.17, especially that it
changes the internal ABI of xenctrl bindings.

Edwin Török (5):
  tools/ocaml/Makefile.rules: do not run ocamldep on distclean
  tools/ocaml/Makefile.rules: hide -include on *clean
  tools/ocaml/libs/eventchn: do not leak event channels and OCaml 5.0
    compat
  tools/ocaml/libs/xc: OCaml 5.0 compatibility
  tools/ocaml/libs/{xb, mmap}: use Data_abstract_val wrapper

 tools/ocaml/Makefile.rules                    |  4 +--
 tools/ocaml/libs/eventchn/xeneventchn_stubs.c | 29 +++++++++++++++++--
 tools/ocaml/libs/mmap/xenmmap_stubs.c         |  2 +-
 tools/ocaml/libs/xb/xs_ring_stubs.c           |  2 +-
 tools/ocaml/libs/xc/xenctrl_stubs.c           | 11 +++----
 5 files changed, 37 insertions(+), 11 deletions(-)

-- 
2.34.1


