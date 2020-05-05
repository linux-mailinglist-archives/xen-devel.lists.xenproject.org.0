Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E06051C51E0
	for <lists+xen-devel@lfdr.de>; Tue,  5 May 2020 11:26:03 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jVtpG-0002P3-UC; Tue, 05 May 2020 09:25:18 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XWWA=6T=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1jVtpF-0002Ow-1H
 for xen-devel@lists.xenproject.org; Tue, 05 May 2020 09:25:17 +0000
X-Inumbo-ID: 522c3eca-8eb2-11ea-ae69-bc764e2007e4
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 522c3eca-8eb2-11ea-ae69-bc764e2007e4;
 Tue, 05 May 2020 09:25:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1588670712;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ydy5pb6EJChjFoO7PsuBYhKfJuc95DxbV5NMzU75wZ0=;
 b=S25wKUGHlcOBIx6NOiqjQF82P4ywu847wecibu8LirNzZA0mtwO5n7Z1
 W4dm/q1h+vB0At6bM/0XYF4Ki6aY7yT9Ug94ENBEZDaE//c92EtOk2HwX
 kqCt/1cCkIlQJCsy34MCdG6gL7dmZrrt2B+HHs9U4zeQnMq/AZ/BAftT3 8=;
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa1.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
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
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: WUkgJErIGddDuuFXn2no1XKVtYl4d3Eonfkieg4QrPopOTyBSesy6VvaFZBWAXa5dZJDA4IzCa
 FRePTwMQXg8M5MeW2O++iXskDIURn31oQvuaC7fyzyYVZveKgK4j5s4RxQDw73nEG8rzzliKyl
 RksCYZR6nmbaSxAGoUosu6ixcS9/ezeoEjetQEwkQTioNU/CNzhFF66J8MwO7HdMYLJY8DC8ND
 yILIILzysPfGaa4ERQwmS5+ynMMebNN0gG6HBDwB04IfJI25WXNhnu7jjClYPixjQLUkHk3Uhi
 jKM=
X-SBRS: 2.7
X-MesageID: 17012789
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,354,1583211600"; d="scan'208";a="17012789"
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
Subject: [PATCH 2/3] configure: also add EXTRA_PREFIX to {CPP/LD}FLAGS
Date: Tue, 5 May 2020 11:24:53 +0200
Message-ID: <20200505092454.9161-3-roger.pau@citrix.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200505092454.9161-1-roger.pau@citrix.com>
References: <20200505092454.9161-1-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
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
Cc: Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wl@xen.org>,
 Roger Pau Monne <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

The path provided by EXTRA_PREFIX should be added to the search path
of the configure script, like it's done in Config.mk. Not doing so
makes the search path for configure differ from the search path used
by the build.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
Please re-run autoconf.sh after applying.
---
 m4/set_cflags_ldflags.m4 | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/m4/set_cflags_ldflags.m4 b/m4/set_cflags_ldflags.m4
index cbad3c10b0..08f5c983cc 100644
--- a/m4/set_cflags_ldflags.m4
+++ b/m4/set_cflags_ldflags.m4
@@ -15,6 +15,10 @@ for ldflag in $APPEND_LIB
 do
     APPEND_LDFLAGS="$APPEND_LDFLAGS -L$ldflag"
 done
+if [ ! -z $EXTRA_PREFIX ]; then
+    CPPFLAGS="$CPPFLAGS -I$EXTRA_PREFIX/include"
+    LDFLAGS="$LDFLAGS -L$EXTRA_PREFIX/lib"
+fi
 CPPFLAGS="$PREPEND_CPPFLAGS $CPPFLAGS $APPEND_CPPFLAGS"
 LDFLAGS="$PREPEND_LDFLAGS $LDFLAGS $APPEND_LDFLAGS"])
 
-- 
2.26.2


