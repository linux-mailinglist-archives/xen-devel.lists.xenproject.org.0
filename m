Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E5E0F5FCA9F
	for <lists+xen-devel@lfdr.de>; Wed, 12 Oct 2022 20:27:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.421343.666588 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oigQq-00023k-Id; Wed, 12 Oct 2022 18:26:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 421343.666588; Wed, 12 Oct 2022 18:26:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oigQq-00020o-Ea; Wed, 12 Oct 2022 18:26:16 +0000
Received: by outflank-mailman (input) for mailman id 421343;
 Wed, 12 Oct 2022 18:26:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7nFe=2N=citrix.com=prvs=277557e37=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1oigQp-00020d-K4
 for xen-devel@lists.xenproject.org; Wed, 12 Oct 2022 18:26:15 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 58d09f9a-4a5b-11ed-8fd0-01056ac49cbb;
 Wed, 12 Oct 2022 20:26:13 +0200 (CEST)
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
X-Inumbo-ID: 58d09f9a-4a5b-11ed-8fd0-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1665599173;
  h=from:to:cc:subject:date:message-id:mime-version;
  bh=7gcIJHv4jTLn96F6AZo74LCpJ+cpgBI5tr82v/YixPU=;
  b=Gup7k1PJWrpjjyq95oPyIv/3btHyqoD4M/ZbwPwWB4TyfbYYTuqgik2k
   tziK4J3Du8BZ4USsSphJfZuU0EjGr6faWRri/V5UXc4ygi3e8mgpKIz7i
   Fr4poWpyKbBdoqhiuzU2VHNsklGsGsWesACf4H/Kyj6CAAfIdFQrEauHh
   s=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 2.7
X-MesageID: 82575650
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:Az9EOaxApbVR83qm+I96t+cnxirEfRIJ4+MujC+fZmUNrF6WrkUAy
 WFLCjqGMqzZY2b8fd8ib9+wp0gFvsKBxtM3Hgs//CAxQypGp/SeCIXCJC8cHc8wwu7rFxs7s
 ppEOrEsCOhuExcwcz/0auCJQUFUjP3OHPykYAL9EngZbRd+Tys8gg5Ulec8g4p56fC0GArIs
 t7pyyHlEAbNNwVcbyRFtspvlDs15K6o4WtB5ARlDRx2lAS2e0c9Xcp3yZ6ZdxMUcqEMdsamS
 uDKyq2O/2+x13/B3fv8z94X2mVTKlLjFVDmZkh+AsBOsTAbzsAG6Y4pNeJ0VKtio27hc+ada
 jl6ncfYpQ8BZsUgkQmGOvVSO3kW0aZuoNcrLZUj2CA6IoKvn3bEmp1T4E8K0YIw5NRbGlpkx
 8wkMh8KNSKYntyS/IyYVbw57igjBJGD0II3v3hhyXfSDOo8QICFSKLPjTNa9G5u3IYUR6+YP
 pdHL2o0BPjDS0Qn1lM/IZQyhuq3wFL4dCVVsgm9rqsr+WnDigd21dABNfKFIIHVGJsIxi50o
 Er8+2ulLw4nH+aDyCWkzlaWgvbQnn30Ddd6+LqQqacx3Qz7KnYoID0bU0Gq58awjEGWUshab
 UcT/0IGoaEs+WSxQ9L6Xhn+p2SL1jYMVtwVH+Ak5QWlzqvP/x3fFmUCViRGatEtqIkxXzNC6
 7OSt4q3X3o16uTTEC/DsOfPxd+vBcQLBXEwSTQ/Zzk138PMp9oBlQvxaupdM7Hg27UZBgrM6
 zyNqSE/gZAagsgKy7i38Dj7vt68mnTaZlVrv1uKBwpJ+is8Pdf4PNLwtTA3+N4adO6kok+9U
 G/ociR0xMQHFtmzmSOEW43h95n5tq/eYFUwbbOCdqTNFghBGVb5Iei8Axkkfi+F1/ronxezO
 Sc/XisIvPdu0IOCN/MfXm5II51CIVLcPdrkTOvISdFFf4J8cgSKlAk3OxDNgjm2yRd9wfBmU
 Xt+TSpKJSxDYUiA5GPvL9rxLJdxnnxurY8tbcqTI+ubPUq2OyfOFOZt3KqmZeEl9qKUyDjoH
 yJkH5LTk31ivBjWOHa/HXg7cQ9XdhDWxPne96RqSwJ0ClY+RD95Vq+OmO1Jlk4Mt/09q9okN
 0qVAidwoGcTT1WeQelWQhiPsI/SYKs=
IronPort-HdrOrdr: A9a23:1q7i56o+COkqduVb15RlxtsaV5ojeYIsimQD101hICG8cqSj9v
 xG/c5rsyMc5wxhO03I9eruBEDiewK6yXcW2/hyAV7KZmCP0wHEQL2KhbGSpwEIcBefygcy78
 ldmtBFebjNMWQ=
X-IronPort-AV: E=Sophos;i="5.95,180,1661832000"; 
   d="scan'208";a="82575650"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Christian Lindig
	<christian.lindig@citrix.com>, David Scott <dave@recoil.org>, Edwin Torok
	<edvin.torok@citrix.com>, Rob Hoes <Rob.Hoes@citrix.com>, Henry Wang
	<Henry.Wang@arm.com>
Subject: [PATCH for-4.17 0/2] Ocaml stub fixes
Date: Wed, 12 Oct 2022 19:25:50 +0100
Message-ID: <20221012182552.26866-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Content-Type: text/plain

Patch 1 is purely some a tweak to improve legibility.  It's not necessary for
4.17 but it's also 0 risk to take as well.

Patch 2 is a change to an ABI which was newly introduced in 4.17.  It is
suboptimal for two reasons and specifically does want changing before 4.17
ships.  See patch for details.

Andrew Cooper (2):
  tools/ocaml/xc: Fix code legibility in stub_xc_domain_create()
  tools/ocaml/xc: Address ABI issues with physinfo arch flags

 tools/ocaml/libs/xc/xenctrl.ml      | 10 ++++++----
 tools/ocaml/libs/xc/xenctrl.mli     | 11 +++++++----
 tools/ocaml/libs/xc/xenctrl_stubs.c | 28 ++++++++++++++--------------
 3 files changed, 27 insertions(+), 22 deletions(-)

-- 
2.11.0


