Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CA17EA9EB5
	for <lists+xen-devel@lfdr.de>; Thu,  5 Sep 2019 11:44:24 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i5oFe-00071G-5L; Thu, 05 Sep 2019 09:40:26 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=4qbh=XA=citrix.com=paul.durrant@srs-us1.protection.inumbo.net>)
 id 1i5oFd-00071B-5b
 for xen-devel@lists.xenproject.org; Thu, 05 Sep 2019 09:40:25 +0000
X-Inumbo-ID: 2f2c4e70-cfc1-11e9-abc3-12813bfff9fa
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 2f2c4e70-cfc1-11e9-abc3-12813bfff9fa;
 Thu, 05 Sep 2019 09:40:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1567676424;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=R7R1PsPU8SL9+cA6ieAglIhrgyL05o4pM+jkz0+Xrvo=;
 b=G1zie0aY0v7S2HACi8shAUn1ixOGIMRBWMOdJ58nWB4/H8d7B7fZ8zX7
 eMC6OnHYNs6iveS+CbyfL+zlat7zeJ7DdPactnqaz2RH/zdHq99oztNfv
 qfAvM3cq6C8XXAnJfsN7nUCP7UacroO+bgsk6PMnHxPAY1BaBxTmJkWhn I=;
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=Paul.Durrant@citrix.com;
 spf=Pass smtp.mailfrom=Paul.Durrant@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 Paul.Durrant@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="Paul.Durrant@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa5.hc3370-68.iphmx.com: domain of
 Paul.Durrant@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="Paul.Durrant@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: woaVwhq1h/T+4/3eIZYhUGerFQdV6Fdml9ithcRqbx4W1ubyeGnOAiuZ5R6MYbytV2XyKLYgbp
 ROZK0k9iLOmO6HbPsKcXDdDptrOWhik5+owsqfyL2VrsEUuUH0GTBEYE6zy4JP0n9kIKQMyqbP
 yWUo7uHW20MioPrYUxU+e9+vNOxETD34EGankmzbFZxDt11zt35u71kABYy0fte24LUA9k0FqR
 TgV+GjdPMvTX1EMvP3L8yPbnWNm9W4Hsum9qIpJ1EpNNFX+V9Xi8iS3503g+ej1UyERn2F/PN4
 x4g=
X-SBRS: 2.7
X-MesageID: 5353658
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,470,1559534400"; 
   d="scan'208";a="5353658"
From: Paul Durrant <Paul.Durrant@citrix.com>
To: Roger Pau Monne <roger.pau@citrix.com>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>
Thread-Topic: [PATCH] x86/libxl: choose a sane default for HAP
Thread-Index: AQHVY80awa/y1k3J6Uur67EkwDCYCqcc06qw
Date: Thu, 5 Sep 2019 09:40:19 +0000
Message-ID: <6ecdb5d809b04ad195e644c49a559f55@AMSPEX02CL03.citrite.net>
References: <20190905093416.2955-1-roger.pau@citrix.com>
In-Reply-To: <20190905093416.2955-1-roger.pau@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH] x86/libxl: choose a sane default for HAP
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Andrew Cooper <Andrew.Cooper3@citrix.com>, "Tim
 \(Xen.org\)" <tim@xen.org>, George Dunlap <George.Dunlap@citrix.com>,
 Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>,
 Anthony Perard <anthony.perard@citrix.com>,
 Ian Jackson <Ian.Jackson@citrix.com>, Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KW3NuaXBdDQo+IC12b2lkIGxpYnhsX19hcmNo
X2RvbWFpbl9jcmVhdGVfaW5mb19zZXRkZWZhdWx0KGxpYnhsX19nYyAqZ2MsDQo+IC0gICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGxpYnhsX2RvbWFpbl9jcmVh
dGVfaW5mbyAqY19pbmZvKQ0KPiAraW50IGxpYnhsX19hcmNoX2RvbWFpbl9jcmVhdGVfaW5mb19z
ZXRkZWZhdWx0KGxpYnhsX19nYyAqZ2MsDQo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgbGlieGxfZG9tYWluX2NyZWF0ZV9pbmZvICpjX2luZm8pDQo+ICB7
DQo+ICsgICAgbGlieGxfcGh5c2luZm8gcGk7DQo+ICsgICAgaW50IHJjID0gbGlieGxfZ2V0X3Bo
eXNpbmZvKENUWCwgJnBpKTsNCj4gKw0KPiArICAgIGlmIChyYykgew0KPiArICAgICAgICBMT0co
RVJST1IsICJ1bmFibGUgdG8gZ2V0IHBoeXNpbmZvIik7DQo+ICsgICAgICAgIHJldHVybiByYzsN
Cj4gKyAgICB9DQo+ICsNCj4gKyAgICBsaWJ4bF9kZWZib29sX3NldGRlZmF1bHQoJmNfaW5mby0+
aGFwLCBwaS5jYXBfaGFwKTsNCg0KSXMgdGhpcyBnb2luZyB0byB3b3JrIG9uIEFSTSAod2hlcmUg
Q0RGX2hhcCBpcyByZXF1aXJlZCk/IEJlY2F1c2UuLi4NCg0KPiArDQo+ICsgICAgcmV0dXJuIDA7
DQo+ICB9DQo+IA0KPiAgdm9pZCBsaWJ4bF9fYXJjaF9kb21haW5fYnVpbGRfaW5mb19zZXRkZWZh
dWx0KGxpYnhsX19nYyAqZ2MsDQo+IGRpZmYgLS1naXQgYS94ZW4vYXJjaC94ODYvc3lzY3RsLmMg
Yi94ZW4vYXJjaC94ODYvc3lzY3RsLmMNCj4gaW5kZXggYzUwZDkxMGExYy4uNzRlYTE4NDA4NyAx
MDA2NDQNCj4gLS0tIGEveGVuL2FyY2gveDg2L3N5c2N0bC5jDQo+ICsrKyBiL3hlbi9hcmNoL3g4
Ni9zeXNjdGwuYw0KPiBAQCAtMTY1LDYgKzE2NSw4IEBAIHZvaWQgYXJjaF9kb19waHlzaW5mbyhz
dHJ1Y3QgeGVuX3N5c2N0bF9waHlzaW5mbyAqcGkpDQo+ICAgICAgICAgIHBpLT5jYXBhYmlsaXRp
ZXMgfD0gWEVOX1NZU0NUTF9QSFlTQ0FQX3B2Ow0KPiAgICAgIGlmICggaW9tbXVfZW5hYmxlZCAp
DQo+ICAgICAgICAgIHBpLT5jYXBhYmlsaXRpZXMgfD0gWEVOX1NZU0NUTF9QSFlTQ0FQX2RpcmVj
dGlvOw0KPiArICAgIGlmICggaHZtX2hhcF9zdXBwb3J0ZWQoKSApDQo+ICsgICAgICAgIHBpLT5j
YXBhYmlsaXRpZXMgfD0gWEVOX1NZU0NUTF9QSFlTQ0FQX2hhcDsNCg0KLi4udGhpcyBpcyB4ODYt
b25seSBjb2RlLCBhbmQgSSBkb24ndCBzZWUgYW4gZXF1aXZhbGVudCBodW5rIGZvciBBUk0uDQoN
CiAgUGF1bA0KDQo+ICB9DQo+IA0KPiAgbG9uZyBhcmNoX2RvX3N5c2N0bCgNCj4gZGlmZiAtLWdp
dCBhL3hlbi9pbmNsdWRlL3B1YmxpYy9zeXNjdGwuaCBiL3hlbi9pbmNsdWRlL3B1YmxpYy9zeXNj
dGwuaA0KPiBpbmRleCA5MWM0OGRjYWUwLi42YzQ1NzYyNWU5IDEwMDY0NA0KPiAtLS0gYS94ZW4v
aW5jbHVkZS9wdWJsaWMvc3lzY3RsLmgNCj4gKysrIGIveGVuL2luY2x1ZGUvcHVibGljL3N5c2N0
bC5oDQo+IEBAIC05MCw2ICs5MCwxMCBAQCBzdHJ1Y3QgeGVuX3N5c2N0bF90YnVmX29wIHsNCj4g
ICAvKiAoeDg2KSBUaGUgcGxhdGZvcm0gc3VwcG9ydHMgZGlyZWN0IGFjY2VzcyB0byBJL08gZGV2
aWNlcyB3aXRoIElPTU1VLiAqLw0KPiAgI2RlZmluZSBfWEVOX1NZU0NUTF9QSFlTQ0FQX2RpcmVj
dGlvICAgICAyDQo+ICAjZGVmaW5lIFhFTl9TWVNDVExfUEhZU0NBUF9kaXJlY3RpbyAgKDF1PDxf
WEVOX1NZU0NUTF9QSFlTQ0FQX2RpcmVjdGlvKQ0KPiArLyogKHg4NikgVGhlIHBsYXRmb3JtIHN1
cHBvcnRzIEhhcmR3YXJlIEFzc2lzdGVkIFBhZ2luZy4gKi8NCj4gKyNkZWZpbmUgX1hFTl9TWVND
VExfUEhZU0NBUF9oYXAgICAgICAgICAgMw0KPiArI2RlZmluZSBYRU5fU1lTQ1RMX1BIWVNDQVBf
aGFwICAgICAgICAgICAoMXU8PF9YRU5fU1lTQ1RMX1BIWVNDQVBfaGFwKQ0KPiArDQo+ICBzdHJ1
Y3QgeGVuX3N5c2N0bF9waHlzaW5mbyB7DQo+ICAgICAgdWludDMyX3QgdGhyZWFkc19wZXJfY29y
ZTsNCj4gICAgICB1aW50MzJfdCBjb3Jlc19wZXJfc29ja2V0Ow0KPiAtLQ0KPiAyLjIyLjANCg0K
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
