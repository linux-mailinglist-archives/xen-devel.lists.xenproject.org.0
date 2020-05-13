Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AD7921D1275
	for <lists+xen-devel@lfdr.de>; Wed, 13 May 2020 14:16:22 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jYqJ6-0006nI-JJ; Wed, 13 May 2020 12:16:16 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cxQB=63=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1jYqJ4-0006nA-PE
 for xen-devel@lists.xenproject.org; Wed, 13 May 2020 12:16:14 +0000
X-Inumbo-ID: 899c59aa-9513-11ea-b9cf-bc764e2007e4
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 899c59aa-9513-11ea-b9cf-bc764e2007e4;
 Wed, 13 May 2020 12:16:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1589372174;
 h=from:to:cc:subject:date:message-id:mime-version;
 bh=BOnEEEyVJ3vq0TiTT8o5PI3JhI1X5+lNHauBuJWe2dY=;
 b=hAuSUAkGhBCVMas7fbhqlgWX8DfPeuIn48fWwdWaGOONLbvwiBuR42j8
 vQxoANPH7oK4hwT1C4g0xhttB8woD7UJlUVwPm0Ce+BHeQI7HnE0LljsT
 5Ch2irs9/1UFMjpihrQSs5tr0BOIR9EBCf/v+mszFc/gLx59A+8G2N7wI s=;
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa1.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com;
 dmarc=pass (p=none dis=none) d=citrix.com
IronPort-SDR: LL8J8BvYCVxKKQi6T+UAvew6GjLoIY5biqHFTcgf8U4hHdiddOx/EWQzueNSUKDYYheqwqj3gF
 csyiOGl/Eb4zg+87kRJ3Av6Uquj1sMgVFK/3sdZwId7nOlI1hOwhOZuDni7zUPr4EEEV+eY2w/
 kmHzqobMBvn7fFxZV5cm5+D3QM5qgBVva/lEXEM6fuFr3c8dgEaoaV6z3Ygnes7CldLah1KRRr
 +e5QMwJRGqB35dvim6PmQK9EBqdZKwvCREcz6UIkGrZ0gSNQGxF6UnW66AdMb+xVId4SA8YmI3
 ZQo=
X-SBRS: 2.7
X-MesageID: 17677973
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,387,1583211600"; d="scan'208";a="17677973"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Subject: [PATCH] stubdom: Use matching quotes in error message
Date: Wed, 13 May 2020 13:15:54 +0100
Message-ID: <20200513121554.15239-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
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
 Wei Liu <wl@xen.org>, George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Jan
 Beulich <JBeulich@suse.com>, Ian Jackson <ian.jackson@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

This prevents syntax highlighting from believing the rest of the file is a
string.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: George Dunlap <George.Dunlap@eu.citrix.com>
CC: Ian Jackson <ian.jackson@citrix.com>
CC: Jan Beulich <JBeulich@suse.com>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Wei Liu <wl@xen.org>
CC: Julien Grall <julien@xen.org>
---
 stubdom/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/stubdom/Makefile b/stubdom/Makefile
index 8cf7131c6a..12aa211ac3 100644
--- a/stubdom/Makefile
+++ b/stubdom/Makefile
@@ -16,7 +16,7 @@ CFLAGS += -O1 -fno-omit-frame-pointer
 
 ifeq (,$(findstring clean,$(MAKECMDGOALS)))
   ifeq ($(wildcard $(MINI_OS)/Config.mk),)
-    $(error Please run `make mini-os-dir' in top-level directory)
+    $(error Please run 'make mini-os-dir' in top-level directory)
   endif
   include $(XEN_ROOT)/Config.mk
 endif
-- 
2.11.0


