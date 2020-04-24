Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EC7BD1B7855
	for <lists+xen-devel@lfdr.de>; Fri, 24 Apr 2020 16:31:52 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jRzMZ-0006ha-Po; Fri, 24 Apr 2020 14:31:31 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Spwv=6I=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1jRzMY-0006hV-PT
 for xen-devel@lists.xenproject.org; Fri, 24 Apr 2020 14:31:30 +0000
X-Inumbo-ID: 4965f088-8638-11ea-b58d-bc764e2007e4
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4965f088-8638-11ea-b58d-bc764e2007e4;
 Fri, 24 Apr 2020 14:31:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1587738690;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=SKi75dnMpwCQEh3oDCg9wrmo7By5yGSUxRs6ZezakMo=;
 b=PQ+/3eJX7GwYWFv0tVfFtsrf/MxGmSpxZCHAk8lrSA1+gK0W6Yp56da9
 Eszz54lmpWLfTC8yaiIxdv/BzZ/sv346Ygzfu5Zus8i618FQwKQVrp0Bu
 R/YexstDTtea1/45Ac5z+zcIuCJf50JP4BwMOadiUogxouWS80Mlz34ft g=;
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=anthony.perard@citrix.com;
 spf=Pass smtp.mailfrom=anthony.perard@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 anthony.perard@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa2.hc3370-68.iphmx.com: domain of
 anthony.perard@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: G2Ozm2MhS2omF6iXzdT0oYkkMkp6KOE5krMPkvgCyeFIComFO65N6/XWByhZvq0qXqKkq2ljXW
 cvsx5yiJ7BGujvT0yAf9J1ltIEHZUNsMUFxAXiAEbK6y6P313wf3PvD2D3iXoB+FykZ4/2gmpN
 b3mKr4PygJc2MyfeTL8b5ONRH7kjMuZDEzd6IIVuTUh21SjYV1Y8w+u292jG5urdfQzpn8n/8m
 +oGsasjBocvPz4llveVxS5FTrXngqwZIroECOjy9nQlOKTbE3Ne9OJcfnCeEO7rHs6qPFy3YGp
 jJo=
X-SBRS: 2.7
X-MesageID: 16222492
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,311,1583211600"; d="scan'208";a="16222492"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
Subject: [XEN PATCH] xen/build: silence make warnings about missing auto.conf*
Date: Fri, 24 Apr 2020 15:30:58 +0100
Message-ID: <20200424143058.2546905-1-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.26.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian
 Jackson <ian.jackson@eu.citrix.com>, George Dunlap <george.dunlap@citrix.com>,
 Jan Beulich <jbeulich@suse.com>, Anthony PERARD <anthony.perard@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

In a clean tree, both files include/config/auto.conf{,.cmd} are
missing and older version of GNU Make complain about it:
    Makefile:103: include/config/auto.conf: No such file or directory
    Makefile:106: include/config/auto.conf.cmd: No such file or directory

Those warnings are harmless, make will create the files and start over. But
to avoid confusion, we'll use "-include" to silence the warning.

Those warning started to appear with commit 6c122d3984a5 ("xen/build:
include include/config/auto.conf in main Makefile").

Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
---
 xen/Makefile | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/xen/Makefile b/xen/Makefile
index fc8eef6a2817..eedfef26b245 100644
--- a/xen/Makefile
+++ b/xen/Makefile
@@ -154,10 +154,10 @@ config: FORCE
 else # !config-build
 
 ifeq ($(need-config),y)
-include include/config/auto.conf
+-include include/config/auto.conf
 # Read in dependencies to all Kconfig* files, make sure to run syncconfig if
 # changes are detected.
-include include/config/auto.conf.cmd
+-include include/config/auto.conf.cmd
 
 # Allow people to just run `make` as before and not force them to configure
 $(KCONFIG_CONFIG):
-- 
Anthony PERARD


