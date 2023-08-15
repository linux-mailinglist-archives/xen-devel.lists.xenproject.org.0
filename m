Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 30D5F77D4D5
	for <lists+xen-devel@lfdr.de>; Tue, 15 Aug 2023 23:07:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.584057.914523 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qW1Fx-0006Vy-Qw; Tue, 15 Aug 2023 21:07:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 584057.914523; Tue, 15 Aug 2023 21:07:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qW1Fx-0006MY-I4; Tue, 15 Aug 2023 21:07:13 +0000
Received: by outflank-mailman (input) for mailman id 584057;
 Tue, 15 Aug 2023 21:07:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nTNg=EA=citrix.com=prvs=584bb2eab=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1qW1Fv-0004ge-FK
 for xen-devel@lists.xenproject.org; Tue, 15 Aug 2023 21:07:11 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b19ffeec-3baf-11ee-9b0c-b553b5be7939;
 Tue, 15 Aug 2023 23:07:09 +0200 (CEST)
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
X-Inumbo-ID: b19ffeec-3baf-11ee-9b0c-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1692133629;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=t9pwPtJaxOY2AoSDfaabseyGopwlTK4SCWzM4uvG2Xw=;
  b=OUBYpU7tW0Dr92jGcMvG3AFGUlYufGLAb0AfINwVp8CCHA0rnYifqfMM
   Ki2sj62I1ChtXWMp0kyXqAyRgJGHze86qGkMZbyp5KFyF/CQ8Crm/cm6p
   abGazJxqdtd1mlRsIv/cEGpP3pRoJmJdlxtsLGeW/LJ4yAnWd9M6WYCOw
   8=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 118253077
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:zbibmqwLDi3/72PY/wZ6t+cdwSrEfRIJ4+MujC+fZmUNrF6WrkVSx
 2ceWT+FPKmDNmD0fd11atu38xsCvJPXyt41HFA9/iAxQypGp/SeCIXCJC8cHc8wwu7rFxs7s
 ppEOrEsCOhuExcwcz/0auCJQUFUjP3OHfykTrafYEidfCc8IA85kxVvhuUltYBhhNm9Emult
 Mj75sbSIzdJ4RYtWo4vw/zF8EoHUMja4mtC5QRuPK0T5jcyqlFOZH4hDfDpR5fHatE88t6SH
 47r0Ly/92XFyBYhYvvNfmHTKxBirhb6ZGBiu1IOM0SQqkEqSh8ai87XAME0e0ZP4whlqvgqo
 Dl7WT5cfi9yVkHEsLx1vxC1iEiSN4UekFPMCSDXXcB+UyQq2pYjqhljJBheAGEWxgp4KWtJ1
 b8cFjlKVFOGjPqr/by8EbJQo+12eaEHPKtH0p1h5TTQDPJgSpHfWaTao9Rf2V/chOgXQ6yYP
 ZBAL2MyMlKZOUYn1lQ/UfrSmM+BgHXlfiIeg1WSvactuEDYzRBr0airO93QEjCPbZwMzhzF/
 TqZoAwVBDkTENi+4CSJ8E6wl9CRlAzUWr0DOuaRo6sCbFq7mTVIVUx+uUGAiem0jAuyVsxSL
 2QQ+zEytu4i+UqzVN7/Uhak5nmesXY0QMFMGuc37AWMzKv84AuDAGUACDlbZ7QOq8seVTEsk
 FiTkLvBByFrsbCTYWKQ8PGTtzzaERYSKWgOdCoVVzwv6tPooJwwph/XR9MlG6mw5vXuEDf52
 CyDtyk5r68aldIMzai98lHBjj+2p57GCAUy423/VG+/8hlwYoLjYoWy8EXa9t5JNoPfRV6E1
 FAkls6E/aYxBJeCvCWXRaMGG7TBz/qKPDDTm1dHA4gq9zPr/WWqO49X/llWKF9yN8cYeRfge
 ELJpR5K/5hXIWeraqlsJYm2DqwCyqztFs/kV7bXc8BJaZhycyeI+ShvYQib2GWFuEoll60lK
 IqYWcmpBHceT69gyVKeZc0QzLsqzSAW3n7ISNbwyBHP+biRfnmOUp8eLUCDKOs+6cusrAzL/
 v5FOsCNyhEZV/fxChQ76qZKcwpMdyJiQ8mr9YoOLLXrzhda9H8JAfjxgrcfcstf3KFejvr18
 HbmAXN94Q+q7ZHYEjmiZndmYbLpeJ9wq3MnICAhVWqVN2gfjZWHt/lGKcZuFVUz3Kk6lKMvE
 aFZEymVKq4XIgkr7QjxenUUQGZKUB2wzTyDMCO+CNTUV84xHleZkjMIk+aGycXvMsZVnZFjy
 1FD/lmBKXbme+iFJJ+PAM9DN3vr4RAgdBtaBiMk2OV7dkT265RNICfslPIxKMxkAUydl2HDj
 VrKUEhI/LmlT2oJHD7h3/zskmtUO7EmQhoy85fzvN5ayhU2DkL8mNQdAY5kjBjWVX/u+bXKW
 Amm56iUDRHzp34T69AUO+8yncoDCy7H++cyIvJMQC+aMDxGy9pIfhG74CW4nvYQm+IF4VHoB
 RrnFxszEezhBf4J2WU5fGINBtlvH9lO8tUOxZzZ+HnH2RI=
IronPort-HdrOrdr: A9a23:tvTdDqzCsY2jS9Cp5H+OKrPxaeskLtp133Aq2lEZdPU1SL3sqy
 nKpp906faaslYssQ4b6Ky90cW7IE80lqQFkrX5Q43SPjUO0VHAROtfBODZsl7d8kPFh4tgPa
 wJSdkANDWZZ2IXsS6QijPWLz7uquPrzImYwd77i1NRZUVSbadkhj0JeDpy0CdNNXd77V5SLu
 vt2iKDzQDQCEj/Ff7LYkUtbqz4vtjWk5CjSQcebiRXkTWmvHeT8bvnFBrd9QsfVj4n+8ZezU
 H11zbh47mlsbWdwhvRvlWjiKh+qZ/a095eA87JrNYTJi6EsHfPWK1RH4eauSwzoqWUyHtCqq
 i1nz4Qe/5r7m/XfCWOrQDz1xLG2DIjgkWSsmOwsD/YuMnkQzB/NMZbn4JedXLimjAdgO0=
X-Talos-CUID: 9a23:ktlbiG2PrzOnP4l0sFAFsLxfEMcFMXnjxTDqYEqzEXtURrrOEmO10fYx
X-Talos-MUID: =?us-ascii?q?9a23=3AZsr5ZAxs3poDoR7asFzGXr9RmY+aqK2KDGEkj5k?=
 =?us-ascii?q?Eh9WVCnJ5FBifsyWZGaZyfw=3D=3D?=
X-IronPort-AV: E=Sophos;i="6.01,175,1684814400"; 
   d="scan'208";a="118253077"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Bertrand Marquis <bertrand.marquis@arm.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>, Shawn Anastasio
	<sanastasio@raptorengineering.com>, Henry Wang <Henry.Wang@arm.com>, "Daniel
 De Graaf" <dgdegra@tycho.nsa.gov>, Daniel Smith
	<dpsmith@apertussolutions.com>, Jason Andryuk <jandryuk@gmail.com>, "Anthony
 PERARD" <anthony.perard@citrix.com>, Juergen Gross <jgross@suse.com>,
	Christian Lindig <christian.lindig@citrix.com>, David Scott
	<dave@recoil.org>, Edwin Torok <edvin.torok@citrix.com>, Rob Hoes
	<Rob.Hoes@citrix.com>
Subject: [PATCH v3 for-4.18 00/10] Non-truncating XENVER_* subops
Date: Tue, 15 Aug 2023 22:06:40 +0100
Message-ID: <20230815210650.2735671-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

https://gitlab.com/xen-project/people/andyhhp/xen/-/pipelines/968728976
https://cirrus-ci.com/build/6741556116324352

Posting both parts, as there has been minor rebasing in all of them.

Andrew Cooper (10):
  xen/version: Calculate xen_capabilities_info once at boot
  xen/version: Introduce non-truncating deterministically-signed XENVER_* subops
  xen/version: Fold build_id handling into xenver_varbuf_op()
  xen/version: Misc style fixes
  tools/libxc: Move xc_version() out of xc_private.c into its own file
  tools: Introduce a non-truncating xc_xenver_extraversion()
  tools: Introduce a non-truncating xc_xenver_capabilities()
  tools: Introduce a non-truncating xc_xenver_changeset()
  tools: Introduce a non-truncating xc_xenver_cmdline()
  tools: Introduce a xc_xenver_buildid() wrapper

 tools/include/xenctrl.h             |  10 ++
 tools/libs/ctrl/Makefile.common     |   1 +
 tools/libs/ctrl/xc_private.c        |  66 ---------
 tools/libs/ctrl/xc_private.h        |   7 -
 tools/libs/ctrl/xc_version.c        | 206 ++++++++++++++++++++++++++++
 tools/libs/light/libxl.c            |  61 +-------
 tools/ocaml/libs/xc/xenctrl_stubs.c |  46 ++++---
 xen/arch/arm/setup.c                |  20 +--
 xen/arch/x86/setup.c                |  31 ++---
 xen/common/kernel.c                 | 119 ++++++++++------
 xen/common/version.c                |   4 +-
 xen/include/public/version.h        |  68 ++++++++-
 xen/include/xen/hypercall.h         |   2 -
 xen/include/xen/version.h           |   2 +
 xen/include/xlat.lst                |   1 +
 xen/include/xsm/dummy.h             |   3 +
 xen/xsm/flask/hooks.c               |   4 +
 17 files changed, 425 insertions(+), 226 deletions(-)
 create mode 100644 tools/libs/ctrl/xc_version.c

-- 
2.30.2


