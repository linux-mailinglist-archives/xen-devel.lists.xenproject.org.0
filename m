Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A9CD4B5372
	for <lists+xen-devel@lfdr.de>; Tue, 17 Sep 2019 18:55:23 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iAGiN-0000Z0-U5; Tue, 17 Sep 2019 16:52:31 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=T7El=XM=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1iAGiL-0000Yl-Vq
 for xen-devel@lists.xenproject.org; Tue, 17 Sep 2019 16:52:30 +0000
X-Inumbo-ID: 889f73d4-d96b-11e9-978d-bc764e2007e4
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 889f73d4-d96b-11e9-978d-bc764e2007e4;
 Tue, 17 Sep 2019 16:52:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1568739149;
 h=from:mime-version:content-transfer-encoding:message-id:
 date:to:cc:subject:in-reply-to:references;
 bh=GONdMMRqCh5TzqQDwLXaus1vXN/5MMM9F/FDmz3zS0U=;
 b=DoF1JGOwwDGQLg2SJLHFb/XI4LIkDJxEADDrT/OaM8U9MPG87iMIfyWr
 GYV5Dyoj2oeWya+pOQ1uiEFtNu8eaATztnO+FuY0FuNDoHeQfWCx1GUll
 pCgCBFUpltGdnS3qZankuOPfKxG85IRk96hWOzKnxGVnLAz7V1OzyVHsx w=;
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=ian.jackson@citrix.com;
 spf=Pass smtp.mailfrom=Ian.Jackson@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 ian.jackson@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="ian.jackson@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa5.hc3370-68.iphmx.com: domain of
 Ian.Jackson@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="Ian.Jackson@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: Ab6ujSk7745WZcEBR1v7Qw8JvhKzBSD+ZQBAtXHdzjT2SbWX85rJY7OZUILxAukpQlmP7Ohszq
 1ziIcbYGaybmNcmF77r4q74SA1TelmAFvBK0npsD2iaWmpw2xLagHFROXevftu1ZFdJXFUv9ON
 N3Bztbbvj+KNlaczcvGRf49No5Kz073kpYJs9ldOfx7EX9HQIs+6DWC5B1ncKtwggZY5WVmo6w
 qNzv4vqwC10eaf0a0gHB1dNxT/15i2MeUH2ZI3GZcO+JD4lzYpT7+mEs+dJDA0C6AGMtRwMt/T
 /AM=
X-SBRS: 2.7
X-MesageID: 5885561
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,517,1559534400"; 
   d="scan'208";a="5885561"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Message-ID: <23937.3912.874830.653579@mariner.uk.xensource.com>
Date: Tue, 17 Sep 2019 17:52:24 +0100
To: Anthony PERARD <anthony.perard@citrix.com>
In-Reply-To: <20190802153606.32061-7-anthony.perard@citrix.com>
References: <20190802153606.32061-1-anthony.perard@citrix.com>
 <20190802153606.32061-7-anthony.perard@citrix.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
Subject: Re: [Xen-devel] [PATCH 06/35] libxl: Use ev_qmp for
 switch_qemu_xen_logdirty
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

QW50aG9ueSBQRVJBUkQgd3JpdGVzICgiW1BBVENIIDA2LzM1XSBsaWJ4bDogVXNlIGV2X3FtcCBm
b3Igc3dpdGNoX3FlbXVfeGVuX2xvZ2RpcnR5Iik6Cj4gU2lnbmVkLW9mZi1ieTogQW50aG9ueSBQ
RVJBUkQgPGFudGhvbnkucGVyYXJkQGNpdHJpeC5jb20+Ci4uLgo+ICsgICAgcmMgPSBsaWJ4bF9f
ZXZfdGltZV9yZWdpc3Rlcl9yZWwoYW8sICZsZHMtPnRpbWVvdXQsCj4gKyAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICBzd2l0Y2hfbG9nZGlydHlfdGltZW91dCwgMTAgKiAxMDAw
KTsKPiArICAgIGlmIChyYykgZ290byBvdXQ7Cj4gKwo+ICsgICAgcW1wLT5hbyA9IGFvOwo+ICsg
ICAgcW1wLT5kb21pZCA9IGRvbWlkOwo+ICsgICAgcW1wLT5wYXlsb2FkX2ZkID0gLTE7Cj4gKyAg
ICBxbXAtPmNhbGxiYWNrID0gc3dpdGNoX3FlbXVfeGVuX2xvZ2RpcnR5X2RvbmU7Cj4gKyAgICBs
aWJ4bF9fcW1wX3BhcmFtX2FkZF9ib29sKGdjLCAmYXJncywgImVuYWJsZSIsIGVuYWJsZSk7Cj4g
KyAgICByYyA9IGxpYnhsX19ldl9xbXBfc2VuZChnYywgcW1wLCAieGVuLXNldC1nbG9iYWwtZGly
dHktbG9nIiwgYXJncyk7CgpJIGhhdGUgdG8gc3VnZ2VzdCB0aGlzIGF0IHRoaXMgc3RhZ2UsIGJ1
dDogbWF5YmUgdGhlIHRpbWVvdXQgY291bGQgYmUKaW5jb3Jwb3JhdGVkIGludG8gbGlieGxfX2V2
X3FtcCA/CgpJIHRoaW5rIGV2ZXJ5IGxpYnhsX19xbXAgY2FsbGVyIGlzIGdvaW5nIHRvIG5lZWQg
YSB0aW1lb3V0ID8KCklhbi4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2pl
Y3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4t
ZGV2ZWw=
