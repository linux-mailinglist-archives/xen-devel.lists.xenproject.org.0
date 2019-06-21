Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 446424EA91
	for <lists+xen-devel@lfdr.de>; Fri, 21 Jun 2019 16:28:21 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1heKU9-0000NG-Bh; Fri, 21 Jun 2019 14:25:49 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=7rzm=UU=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1heKU7-0000MW-Oq
 for xen-devel@lists.xenproject.org; Fri, 21 Jun 2019 14:25:47 +0000
X-Inumbo-ID: 758cb6de-9430-11e9-8980-bc764e045a96
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 758cb6de-9430-11e9-8980-bc764e045a96;
 Fri, 21 Jun 2019 14:25:46 +0000 (UTC)
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=ian.jackson@eu.citrix.com;
 spf=Pass smtp.mailfrom=Ian.Jackson@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 ian.jackson@eu.citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="ian.jackson@eu.citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa6.hc3370-68.iphmx.com: domain of
 Ian.Jackson@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="Ian.Jackson@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: FkNg6XtL4HvSxbAGmXuvA4DC7v+wE+++HKlle42pEGSxDnwtEAj2Hc7X7yeiXpTBCS0WNlRtWG
 NuRWYkA++gUlSACuHSPYs4myI9S4ZsVt6LizGcOpkFm9rUA0DVVL4qpGsH8gFy+4eo3MMcY9RI
 kDqDThAQDu8r065r2iyqmCjWel02MpOK/Z+xHVNRpkWyzzfCkLVmETzm9Wb5sw1AQr5DbOW+mK
 cs1Hh1I9gRzpRmZ9SNZ5PZ9exJIe9mzMzdp1I767I2sazxNzezP888R4sgqLEL/3rxeWptaeLv
 I6Q=
X-SBRS: 2.7
X-MesageID: 2062321
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.63,400,1557201600"; 
   d="scan'208";a="2062321"
From: Ian Jackson <ian.jackson@eu.citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Fri, 21 Jun 2019 15:22:58 +0100
Message-ID: <20190621142258.1543-9-ian.jackson@eu.citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190621142258.1543-1-ian.jackson@eu.citrix.com>
References: <20190621142258.1543-1-ian.jackson@eu.citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [OSSTEST PATCH v2 8/8] mg-repro-setup: Do not wrongly
 reject multiple --rebuild
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Ian Jackson <ian.jackson@eu.citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

LS1yZWJ1aWxkIGVuZHMgdGhlIGN1cnJlbnQgLS1yZWJ1aWxkIHNwZWNpZmljYXRpb24uCgpTaWdu
ZWQtb2ZmLWJ5OiBJYW4gSmFja3NvbiA8aWFuLmphY2tzb25AZXUuY2l0cml4LmNvbT4KLS0tCnYy
OiBOZXcgcGF0Y2gKLS0tCiBtZy1yZXByby1zZXR1cCB8IDEgKwogMSBmaWxlIGNoYW5nZWQsIDEg
aW5zZXJ0aW9uKCspCgpkaWZmIC0tZ2l0IGEvbWctcmVwcm8tc2V0dXAgYi9tZy1yZXByby1zZXR1
cAppbmRleCAzY2ViNzAzMi4uMzc0MTc2ZjAgMTAwNzU1Ci0tLSBhL21nLXJlcHJvLXNldHVwCisr
KyBiL21nLXJlcHJvLXNldHVwCkBAIC0xODksNiArMTg5LDcgQEAgd2hpbGUgWyAkIyAtbmUgMCBd
OyBkbwogCQkJY2FzZSAiJDEiIGluCiAJCQlbLj0rXSp8LXIqKSByZWJ1aWxkX3NwZWNzKz0oIiQx
Iik7ICAgICAgc2hpZnQgOzsKIAkJICAgICAgICAtQj8qKQlyZWJ1aWxkc19ibGVzc2luZz0kezEj
LUJ9OyAgICAgIHNoaWZ0IDs7CisJCQktLXJlYnVpbGQpIGJyZWFrICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgOzsKIAkJCS0qKQliYWR1c2FnZSAnOiBiYWQgLS1yZWJ1aWxkIG9wdGlvbicg
ICAgIDs7CiAgICAgICAgICAgICAgICAgICAgICAgICAqKSAgICAgIGJyZWFrICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgOzsKIAkJCWVzYWMKLS0gCjIuMTEuMAoKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxp
c3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVj
dC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
