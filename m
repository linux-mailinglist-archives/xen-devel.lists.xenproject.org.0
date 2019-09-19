Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 43E31B8157
	for <lists+xen-devel@lfdr.de>; Thu, 19 Sep 2019 21:21:57 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iB1y3-0006oN-TL; Thu, 19 Sep 2019 19:19:51 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=dP6a=XO=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1iB1y1-0006oA-NC
 for xen-devel@lists.xenproject.org; Thu, 19 Sep 2019 19:19:49 +0000
X-Inumbo-ID: 724df3be-db12-11e9-b299-bc764e2007e4
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 724df3be-db12-11e9-b299-bc764e2007e4;
 Thu, 19 Sep 2019 19:19:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1568920790;
 h=from:mime-version:content-transfer-encoding:message-id:
 date:to:cc:subject:in-reply-to:references;
 bh=SXVLmUGF9BLE4tLj4I0WsSbmh/192DOvTBhyjCqzqM4=;
 b=NHfuG0w9iquTtDrl/iBFCAEtJIH+3RghhoXfXijezrBmHtLsBp1jJ0df
 p5NR8mP0l6QNw39NiYbna8gKfQKxAfIw3L9QfWBnXrK9CDrspiQLlcv4W
 Y/AykwTeGwezFgr/QrgIvtNOpYV2vrJvfecI1tPOEfVPCnq8NGTf5iW3f g=;
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=ian.jackson@citrix.com;
 spf=Pass smtp.mailfrom=Ian.Jackson@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 ian.jackson@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="ian.jackson@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa1.hc3370-68.iphmx.com: domain of
 Ian.Jackson@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="Ian.Jackson@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: rOR37mFOlBeNcLy2fcKmVJpONFZlt3yDbKEonYe/5/efKjK8Ic4pDhysZFgQe9yY21jPfI9zUn
 khCuTLRS6MmH3X/0VbGiFKzumroLCoUBXSjNAKq5L2pBoHV9vRbK3d1QYYqAbKSEdjiWCOg/EL
 p3toK8bLODZVDUKMHQDGby/g3/wWW7sVrE9WcrHMxT91B6GuYz3H44TfZw9gpfF+SGGS/8jszH
 JUJHzt74+hAfAr4ZhslOwRP4YcoRWMDz6SILYY+2BkRQAbalSOOj6TLpP9ElVpe9QmMl3YO9ny
 pfM=
X-SBRS: 2.7
X-MesageID: 5870715
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,524,1559534400"; 
   d="scan'208";a="5870715"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Message-ID: <23939.54481.763486.668137@mariner.uk.xensource.com>
Date: Thu, 19 Sep 2019 20:19:45 +0100
To: Anthony PERARD <anthony.perard@citrix.com>
In-Reply-To: <20190919171656.899649-1-anthony.perard@citrix.com>
References: <20190919171656.899649-1-anthony.perard@citrix.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
Subject: Re: [Xen-devel] [PATCH v2 00/35] libxl refactoring to use ev_qmp
 (with API changes)
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

QW50aG9ueSBQRVJBUkQgd3JpdGVzICgiW1BBVENIIHYyIDAwLzM1XSBsaWJ4bCByZWZhY3Rvcmlu
ZyB0byB1c2UgZXZfcW1wICh3aXRoIEFQSSBjaGFuZ2VzKSIpOgo+IFBhdGNoZXMgd2l0aCBtaXNz
aW5nIGFja2VzOgo+ICAgICBsaWJ4bDogVXNlIGV2X3FtcCBmb3Igc3dpdGNoX3FlbXVfeGVuX2xv
Z2RpcnR5Cj4gICAgIGxpYnhsOiBVc2UgZXZfcW1wIGluIGxpYnhsX3NldF92Y3B1b25saW5lCj4g
ICAgIGxpYnhsX3BjaTogRXh0cmFjdCBjb21tb24gcGFydCBvZiAqcWVtdV90cmFkX3dhdGNoX3N0
YXRlX2NiCj4gCj4gVGhlIHNlcmllcyBkZXBlbmRzIG9uICJTb21lIGNsZWFudXAgb2YgbGlieGwi
IHNlcmllcy4KPiBQYXRjaCBzZXJpZXMgYXZhaWxhYmxlIGluIHRoaXMgZ2l0IGJyYW5jaCAod2hp
Y2ggaXMgb24gdG9wIG9mIHRoZSBicmFuY2gKPiBici5saWJ4bC1jbGVhbnVwLXYyKToKPiBodHRw
czovL3hlbmJpdHMueGVuLm9yZy9naXQtaHR0cC9wZW9wbGUvYXBlcmFyZC94ZW4tdW5zdGFibGUu
Z2l0IGJyLmxpYnhsLWV2X3FtcC1yZWZhY3RvcmluZy12MgoKU28sIEkgdGhpbmsgdGhpcyBpcyBh
bGwgZ29vZCBub3cgYW5kIEkgd2lsbCBjb21taXQgYm90aCB0aGVzZQpyZW1haW5pbmcgc2VyaWVz
IHdoZW4gSSBnZXQgaW50byB0aGUgb2ZmaWNlIHRvbW9ycm93LgoKSWFuLgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlz
dApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
