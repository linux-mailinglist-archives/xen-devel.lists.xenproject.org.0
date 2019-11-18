Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C2E7E100A50
	for <lists+xen-devel@lfdr.de>; Mon, 18 Nov 2019 18:33:15 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iWkrJ-0000Ah-Ne; Mon, 18 Nov 2019 17:30:41 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=AWEU=ZK=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1iWkrI-0000Ab-Gx
 for xen-devel@lists.xenproject.org; Mon, 18 Nov 2019 17:30:40 +0000
X-Inumbo-ID: 2378ac3e-0a29-11ea-9631-bc764e2007e4
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2378ac3e-0a29-11ea-9631-bc764e2007e4;
 Mon, 18 Nov 2019 17:30:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1574098240;
 h=from:mime-version:content-transfer-encoding:message-id:
 date:to:cc:subject:in-reply-to:references;
 bh=JWfo7M7SL+9h8LJKafsig+cjtuvqzpWQ9Te8BpandrQ=;
 b=A5a8yMEIx6nFUfPuu7U57avLbMK+MDkaBNUAz99rSHkliLEEKw9hAZkJ
 W1SoqIqzzTMAga0lyJ6OYa7E8dqBTLjaqKqfGvWYSFRoZLi5FOKNNF8dS
 Jy8SQTVaR0dBLLdf2rtAragfjIO28KbbEHOCPBe0inig01MSa1/eznM7Z A=;
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=ian.jackson@citrix.com;
 spf=Pass smtp.mailfrom=Ian.Jackson@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 ian.jackson@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="ian.jackson@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa2.hc3370-68.iphmx.com: domain of
 Ian.Jackson@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="Ian.Jackson@citrix.com";
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
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: IQVI9ndgl/CG4m3kqUYjmQFeHp9odzKZznVc61aIoBJb76BAckO97243yvO/uX1rdMuxQf8NP4
 TnjG7rSc2HEObcZVCs1UbLpaEGS3lfVjIiHfVRaG61c6O4qUBpX8jzwanc4wkZnw/ohcUFEvQ9
 Nc2CsZoCEqpE/0XweaJsbNPHVzkRrz33uUWxnp8pwTJVjIeDmGQSrQkRGyPi6er9SuS1W85x+e
 u4ecTV7T4AfvLK2DkDQX2sFU5uoSsocrHPcO7KjgVPdtSSJNPxT/2x+h6ElSnU5nLbNRjhQBsw
 DlY=
X-SBRS: 2.7
X-MesageID: 8484842
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.68,320,1569297600"; 
   d="scan'208";a="8484842"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Message-ID: <24018.54588.480226.416701@mariner.uk.xensource.com>
Date: Mon, 18 Nov 2019 17:30:36 +0000
To: Anthony PERARD <anthony.perard@citrix.com>
In-Reply-To: <20191118171309.1459302-8-anthony.perard@citrix.com>
References: <20191118171309.1459302-1-anthony.perard@citrix.com>
 <20191118171309.1459302-8-anthony.perard@citrix.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
Subject: Re: [Xen-devel] [XEN PATCH for-4.13 v3 7/7] libxl_qmp: Have a lock
 for QMP socket access
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
 Wei Liu <wl@xen.org>, Sander Eikelenboom <linux@eikelenboom.it>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

QW50aG9ueSBQRVJBUkQgd3JpdGVzICgiW1hFTiBQQVRDSCBmb3ItNC4xMyB2MyA3LzddIGxpYnhs
X3FtcDogSGF2ZSBhIGxvY2sgZm9yIFFNUCBzb2NrZXQgYWNjZXNzIik6Cj4gVGhpcyBwYXRjaCB3
b3JrYXJvdW5kIHRoZSBmYWN0IHRoYXQgaXQncyBub3QgcG9zc2libGUgdG8gY29ubmVjdAo+IG11
bHRpcGxlIHRpbWUgdG8gYSBzaW5nbGUgUU1QIHNvY2tldC4gUUVNVSBsaXN0ZW4gb24gdGhlIHNv
Y2tldCB3aXRoCj4gYSBiYWNrbG9nIHZhbHVlIG9mIDEsIHdoaWNoIG1lYW4gdGhhdCBvbiBMaW51
eCB3aGVuIGNvbmN1cnJlbnQgdGhyZWFkCj4gY2FsbCBjb25uZWN0KCkgb24gdGhlIHNvY2tldCwg
dGhleSBnZXQgRUFHQUlOLgouLi4KPiArICAgIGlmIChldi0+c3RhdGUgPT0gcW1wX3N0YXRlX3dh
aXRpbmdfbG9jaykKPiArICAgICAgICAvKiBXZSBjYW4ndCBtb2RpZmllIHRoZSBlZmQgeWV0LCBh
cyBpdCBpc24ndCByZWdpc3RlcmVkLiAqLwogICAgICAgICAgICAgICAgICAgICAgIF4KICAgICAg
ICAgICAgICAgICAgICAgICBtb2RpZnkKCk5ldmVydGhlbGVzcywKCkFja2VkLWJ5OiBJYW4gSmFj
a3NvbiA8aWFuLmphY2tzb25AZXUuY2l0cml4LmNvbT4KCjotKS4KCklhbi4KCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxp
c3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVj
dC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
