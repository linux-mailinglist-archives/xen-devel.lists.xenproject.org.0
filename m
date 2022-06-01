Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 02BCA53AB72
	for <lists+xen-devel@lfdr.de>; Wed,  1 Jun 2022 18:59:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.340581.565647 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nwRgq-0008Px-6N; Wed, 01 Jun 2022 16:59:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 340581.565647; Wed, 01 Jun 2022 16:59:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nwRgq-0008OI-34; Wed, 01 Jun 2022 16:59:24 +0000
Received: by outflank-mailman (input) for mailman id 340581;
 Wed, 01 Jun 2022 16:59:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CPHY=WI=citrix.com=prvs=144c139f6=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1nwRgo-0008OC-OF
 for xen-devel@lists.xenproject.org; Wed, 01 Jun 2022 16:59:22 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2d384560-e1cc-11ec-bd2c-47488cf2e6aa;
 Wed, 01 Jun 2022 18:59:20 +0200 (CEST)
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
X-Inumbo-ID: 2d384560-e1cc-11ec-bd2c-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1654102760;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=l6wUEv/HeH0FfQAgRb9dzcQpJAYhvYgm8+/ckh3K7VA=;
  b=F43tD4yzQ/a49hBifYYg+Or2/Zb/0F/OujhRnwb/eMk2X4L2+c1Dfdgb
   IIqzfoMlzQAJNQeX1MltPhIJaed2qHwZi98v+yamVIwPinJCV5VmBXVUU
   IkiR+UUu1N48yU1qIDWhzA3eBOBmPG+PSwcTy0H0T/BCAfGCvcCRfg6nx
   U=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 5.1
X-MesageID: 73044229
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:89LSrajRliWYkrd5hcrHrmbSX161GBAKZh0ujC45NGQN5FlHY01je
 htvCD/VbPiKa2X0eYxwPo2zoE9V6JOBn4JlT1RvqS48ESkb9cadCdqndUqhZCn6wu8v7a5EA
 2fyTvGacajYm1eF/k/F3oDJ9CU6jefSLlbFILas1hpZHGeIcw98z0M68wIFqtQw24LhXVvU4
 YiaT/D3YzdJ5RYlagr41IrbwP9flKyaVOQw5wFWiVhj5TcyplFNZH4tDfjZw0jQG+G4KtWSV
 efbpIxVy0uCl/sb5nFJpZ6gGqECaua60QFjERO6UYD66vRJjnRaPqrWqJPwwKqY4tmEt4kZ9
 TlDiXC/YV0HG4+PgNotah5zIxNjZIl6wJ3GG1Hq5KR/z2WeG5ft6/BnDUVwNowE4OdnR2pJ8
 JT0KhhUMErF3bjvhuvmFK883azPL+GyVG8bknhm0THeC+dgWZ3ZSr/GzdRZwC0xloZFGvO2i
 88xNmE3MEiaOUwn1lE/Oq41kf71mXvFTTRetkq5r4MuxHDt5VkkuFTqGIWMIYHbLSlPpW6Ho
 krW8mK/BQsVXPSE0iaM+H+ogu7JnAv4VZgUGbn+8eRl6HWRzGEODBwdVXOgvOK0zEW5Xrp3O
 0ESvyYjs6U23EiqVcXmGQ21pmaeuRwRUMYWFPc1gCmP167V7gCxFmUCCDlbZ7QbWNQeHGJwk
 AXTxpWwWGIp4Ob9pW+hGqm89x2XG2sNE187YgQ0fxZcx+XbgoAJp0eaJjp8K5JZnuEZCBmpn
 W3W9HRh2e5D5SIY//7lpA6a2lpAsrCMF1dovVuPAwpJ+ysjPOaYi5qUBU83BBqqBKKQVRG/s
 XcNgKByB8heXMjWxERhrAjgdYxFBspp0xWG2DaD57F7q1yQF4eLJOi8Gg1WKkZzKdojcjT0e
 kLVsg45zMYNYSfyN/UvPNzuUp1CIU3c+TPND6m8UzazSsIpKF/vEN9GPiZ8IFwBYGBzyPpia
 P93gO6nDGoACLQP8Qdas9w1iOdxrghnnDu7bcmik3yPjOvFDFbIGOhtDbd7Rr1ghE9yiF6No
 4g32grj40g3bdASlQGNrtBDdgBRdydlbX00wuQOHtO+zsNdMDlJI5fsLXkJIuSJQ4w9ej/0w
 0yA
IronPort-HdrOrdr: A9a23:QNCkiqk0HP0LKEhjh6DBJXByyP/pDfIm3DAbv31ZSRFFG/Fxl6
 iV88jzsiWE7Qr5OUtQ/uxoV5PgfZqxz/NICOoqTNWftWvd2FdARbsKheCJ/9SJIVybygc378
 ldmsZFZOEYdWIK7vrH3A==
X-IronPort-AV: E=Sophos;i="5.91,269,1647316800"; 
   d="scan'208";a="73044229"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Anthony PERARD <anthony.perard@citrix.com>, Julien Grall <julien@xen.org>,
	Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	Wei Liu <wl@xen.org>, George Dunlap <george.dunlap@citrix.com>, "Stefano
 Stabellini" <sstabellini@kernel.org>
Subject: [XEN PATCH 0/4] xen: rework compat headers generation
Date: Wed, 1 Jun 2022 17:59:05 +0100
Message-ID: <20220601165909.46588-1-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Patch series available in this git branch:
https://xenbits.xen.org/git-http/people/aperard/xen-unstable.git br.build-system-xen-include-rework-v1

Hi,

This patch series is about 2 improvement. First one is to use $(if_changed, )
in "include/Makefile" to make the generation of the compat headers less verbose
and to have the command line part of the decision to rebuild the headers.
Second one is to replace one slow script by a much faster one, and save time
when generating the headers.

Thanks.

Anthony PERARD (4):
  build: xen/include: use if_changed
  build: set PERL
  build: replace get-fields.sh by a perl script
  build: remove auto.conf prerequisite from compat/xlat.h target

 xen/Makefile                 |   1 +
 xen/include/Makefile         | 106 ++++---
 xen/tools/compat-xlat-header | 539 +++++++++++++++++++++++++++++++++++
 xen/tools/get-fields.sh      | 528 ----------------------------------
 4 files changed, 614 insertions(+), 560 deletions(-)
 create mode 100755 xen/tools/compat-xlat-header
 delete mode 100644 xen/tools/get-fields.sh

-- 
Anthony PERARD


