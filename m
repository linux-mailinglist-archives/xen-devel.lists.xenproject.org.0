Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 50B75BB274
	for <lists+xen-devel@lfdr.de>; Mon, 23 Sep 2019 12:51:46 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iCLtk-0002xj-B4; Mon, 23 Sep 2019 10:48:52 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=cYas=XS=citrix.com=paul.durrant@srs-us1.protection.inumbo.net>)
 id 1iCLti-0002xb-Ro
 for xen-devel@lists.xenproject.org; Mon, 23 Sep 2019 10:48:50 +0000
X-Inumbo-ID: b9b69258-ddef-11e9-95fc-12813bfff9fa
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b9b69258-ddef-11e9-95fc-12813bfff9fa;
 Mon, 23 Sep 2019 10:48:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1569235729;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=+w8iTwU5WYEeR14fo7kH0KkfYJp59wYamvkhM51VK7g=;
 b=TjYLt6cFXOcCPCof0QJvC87l+70Oz6GPFuRmEvVnmwotLetwbe3Q9IgJ
 8nhYzURUJZ8BxT0UQWwsDB/mbFkAy3ialVCZO6nZ1heS01wNKCJNycPLt
 y1k/or2So6MWJCvm1J2TmzVGGJSPa/BtbsNeqkaMvpqx3ePfd9tResN7O g=;
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=Paul.Durrant@citrix.com;
 spf=Pass smtp.mailfrom=Paul.Durrant@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 Paul.Durrant@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="Paul.Durrant@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa6.hc3370-68.iphmx.com: domain of
 Paul.Durrant@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="Paul.Durrant@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: 6Qla76t/4x2BBBI0Qjg+R1dgJ8IGCF+dpcGbQbJdSf31ggiJchf28G51GEFEfiS3iAQU2s1oKX
 4sKYPpy0ZZY5SWajx+PGgQ3NG/Y+KsTGQrLTLZ4OBigChNyszpvJTRW5hjhX04HQOlQpDm7yXo
 b2fD+gGkOsMivqRR06rXPqW0vFzFsTX80KYGy/wH48Maf6IGikti+OZNdpTZl9euVfurMVfDyu
 BEWGBZK2XNHWGXrhmrzliNVdSqdzp7NmOOyki2TYqPQOY+OSUUj9+wLX0ZkewPCKfaYQKH99qW
 HqY=
X-SBRS: 2.7
X-MesageID: 6189561
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,539,1559534400"; 
   d="scan'208";a="6189561"
From: Paul Durrant <Paul.Durrant@citrix.com>
To: 'Wei Liu' <wl@xen.org>, Xen Development List
 <xen-devel@lists.xenproject.org>
Thread-Topic: [Xen-devel] [PATCH for-next RFC 0/8] Port Xen to Hyper-V
Thread-Index: AQHVcfc0mf3MiCY5wEmvlk07Intk2qc5FCDA
Date: Mon, 23 Sep 2019 10:48:45 +0000
Message-ID: <40ef09a747534931bf594f945f0048f1@AMSPEX02CL03.citrite.net>
References: <20190923100931.29670-1-liuwe@microsoft.com>
In-Reply-To: <20190923100931.29670-1-liuwe@microsoft.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH for-next RFC 0/8] Port Xen to Hyper-V
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
Cc: Andrew Cooper <Andrew.Cooper3@citrix.com>,
 Roger Pau Monne <roger.pau@citrix.com>, Wei Liu <liuwe@microsoft.com>,
 Jan Beulich <jbeulich@suse.com>, Michael Kelley <mikelley@microsoft.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBYZW4tZGV2ZWwgPHhlbi1kZXZl
bC1ib3VuY2VzQGxpc3RzLnhlbnByb2plY3Qub3JnPiBPbiBCZWhhbGYgT2YgV2VpIExpdQ0KPiBT
ZW50OiAyMyBTZXB0ZW1iZXIgMjAxOSAxMTowOQ0KPiBUbzogWGVuIERldmVsb3BtZW50IExpc3Qg
PHhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZz4NCj4gQ2M6IFdlaSBMaXUgPGxpdXdlQG1p
Y3Jvc29mdC5jb20+OyBXZWkgTGl1IDx3bEB4ZW4ub3JnPjsgQW5kcmV3IENvb3BlciA8QW5kcmV3
LkNvb3BlcjNAY2l0cml4LmNvbT47DQo+IE1pY2hhZWwgS2VsbGV5IDxtaWtlbGxleUBtaWNyb3Nv
ZnQuY29tPjsgSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPjsgUm9nZXIgUGF1IE1vbm5l
DQo+IDxyb2dlci5wYXVAY2l0cml4LmNvbT4NCj4gU3ViamVjdDogW1hlbi1kZXZlbF0gW1BBVENI
IGZvci1uZXh0IFJGQyAwLzhdIFBvcnQgWGVuIHRvIEh5cGVyLVYNCj4gDQo+IEhpIGFsbA0KPiAN
Cj4gSW4gY2FzZSB5b3UncmUgd29uZGVyaW5nLCBJIGNhbiBhbHJlYWR5IHJ1biBhIGZ1bGx5IGZs
ZWRnZWQgWGVuIHN5c3RlbSBvbg0KPiBIeXBlci1WIHdpdGggZW11bGF0ZWQgZGlzayBhbmQgbmV0
d29yay4NCj4gDQo+IFRoaXMgaXMgdGhlIHZlcnkgZmlyc3Qgc3RhZ2UgZm9yIHBvcnRpbmcgWGVu
IHRvIHJ1biBvbiBIeXBlci1WIHdpdGggYWxsIHRoZQ0KPiBnb29kaWVzIEh5cGVyLVYgaGFzIHRv
IG9mZmVyLiAgV2l0aCB0aGlzIHNlcmllcywgWGVuIGNhbiBzdWNjZXNzZnVsbHkgZGV0ZWN0DQo+
IEh5cGVyLVYgYW5kIHByaW50cyBvdXQgYSBtZXNzYWdlLiAgSSB3b3VsZCBsaWtlIHRvIGZpcnN0
IGdldCB0aGUgZGlyZWN0b3J5DQo+IHN0cnVjdHVyZSBhbmQga2NvbmZpZyBvcHRpb25zIGFncmVl
ZCB1cG9uLg0KPiANCj4gVGhlcmUgYXJlIHR3byBtYWpvciBhcmVhcyB0byBiZSB3b3JrZWQgb246
DQo+ICAgKiBNYWtlIERvbTAgYWJsZSB0byB1c2UgSHlwZXItVidzIHN5bnRoZXRpYyBkZXZpY2Vz
Lg0KPiAgICogTWFrZSBYZW4gdXNlIG9mIHRoZSBzeW50aGV0aWMgdGltZXIsIHJlZmVyZW5jZSBU
U0MgYW5kIGVubGlnaHRlbm1lbnQgVk1DUw0KPiAgICAgYW5kIG90aGVyIGludGVyZmFjZXMuDQo+
IA0KPiBUaGV5IGFyZW4ndCB0cml2aWFsLCBhbmQgdGltZSBjYW4gYmUgc2NhcmNlIG9uIG15IHNp
ZGUsIHNvIEkgaW50ZW5kIHRvIHBvc3QNCj4gcGF0Y2hlcyBwaWVjZSBtZWFsIHdoZW4gdGhleSBh
cmUgcmVhZHkuDQo+IA0KPiBRdWVzdGlvbnMgYW5kIGNvbW1lbnRzIGFyZSB3ZWxjb21lLg0KDQpZ
YXkhIEdsYWQgeW91IGZvdW5kIHRoZSB0aW1lIHRvIGRvIHRoaXMgOi0pIE1ha2luZyB1c2Ugb2Yg
dGhlIHN5bmljLCBzdGltZXIsIHdpbGwgYmUgdXNlZnVsLiBUbyBnZXQgdGhlIGJlbmVmaXQgZm9y
IG5lc3RlZCBndWVzdHMgdGhvdWdoLCBJIGFzc3VtZSB3ZSdsbCBuZWVkIHRvIGV4cG9zZWQgZW5s
aWdodGVuZWQgVk1DUywgRVBUIGZsdXNoLCBldGMuIHRocm91Z2g/DQoNCiAgQ2hlZXJzLA0KDQog
ICAgUGF1bA0KDQo+IA0KPiBUaGFua3MsDQo+IFdlaS4NCj4gDQo+IENjOiBKYW4gQmV1bGljaCA8
amJldWxpY2hAc3VzZS5jb20+DQo+IENjOiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0Bj
aXRyaXguY29tPg0KPiBDYzogV2VpIExpdSA8d2xAeGVuLm9yZz4NCj4gQ2M6IFJvZ2VyIFBhdSBN
b25uw6kgPHJvZ2VyLnBhdUBjaXRyaXguY29tPg0KPiANCj4gV2VpIExpdSAoOCk6DQo+ICAgeDg2
OiBpbnRyb2R1Y2UgQ09ORklHX0dVRVNUIGFuZCBtb3ZlIGNvZGUNCj4gICB4ODY6IGluY2x1ZGUg
YXNtX2RlZm5zLmggZGlyZWN0bHkgaW4gaHlwZXJjYWxsLmgNCj4gICB4ODY6IGRyb3AgaHlwZXJ2
aXNvcl9jcHVpZF9iYXNlDQo+ICAgeDg2OiBmYWN0b3Igb3V0IHhlbiB2YXJpYW50cyBmb3IgaHlw
ZXJ2aXNvciBzZXR1cCBjb2RlDQo+ICAgeDg2OiBmYWN0b3Igb3V0IGh5cGVydmlzb3IgYWdub3N0
aWMgY29kZQ0KPiAgIHg4NjogbWFrZSBwcm9iZV94ZW4gcmV0dXJuIGJvb2xlYW4gdmFsdWUNCj4g
ICB4ODY6IGludHJvZHVjZSBDT05GSUdfSFlQRVJWIGFuZCBoeXBlcnYgZGlyZWN0b3J5DQo+ICAg
eDg2OiBiZSBtb3JlIHZlcmJvc2Ugd2hlbiBydW5uaW5nIG5lc3RlZA0KPiANCj4gIHhlbi9hcmNo
L3g4Ni9LY29uZmlnICAgICAgICAgICAgICAgICAgICAgICAgICB8ICAxMyArKw0KPiAgeGVuL2Fy
Y2gveDg2L01ha2VmaWxlICAgICAgICAgICAgICAgICAgICAgICAgIHwgICAyICstDQo+ICB4ZW4v
YXJjaC94ODYvZ3Vlc3QvTWFrZWZpbGUgICAgICAgICAgICAgICAgICAgfCAgIDYgKy0NCj4gIHhl
bi9hcmNoL3g4Ni9ndWVzdC9oeXBlcnYvTWFrZWZpbGUgICAgICAgICAgICB8ICAgMSArDQo+ICB4
ZW4vYXJjaC94ODYvZ3Vlc3QvaHlwZXJ2L2h5cGVydi5jICAgICAgICAgICAgfCAgNjMgKysrKysr
KysrKw0KPiAgeGVuL2FyY2gveDg2L2d1ZXN0L2h5cGVydmlzb3IuYyAgICAgICAgICAgICAgIHwg
MTE2ICsrKysrKysrKysrKysrKysrKw0KPiAgeGVuL2FyY2gveDg2L2d1ZXN0L3hlbi9NYWtlZmls
ZSAgICAgICAgICAgICAgIHwgICA0ICsNCj4gIHhlbi9hcmNoL3g4Ni9ndWVzdC97ID0+IHhlbn0v
aHlwZXJjYWxsX3BhZ2UuUyB8ICAgMA0KPiAgeGVuL2FyY2gveDg2L2d1ZXN0L3sgPT4geGVufS9w
dmgtYm9vdC5jICAgICAgIHwgICAwDQo+ICB4ZW4vYXJjaC94ODYvZ3Vlc3QveyA9PiB4ZW59L3hl
bi5jICAgICAgICAgICAgfCAgNzMgKystLS0tLS0tLS0NCj4gIHhlbi9hcmNoL3g4Ni9wdi9zaGlt
LmMgICAgICAgICAgICAgICAgICAgICAgICB8ICAgMiArLQ0KPiAgeGVuL2FyY2gveDg2L3NldHVw
LmMgICAgICAgICAgICAgICAgICAgICAgICAgIHwgIDExICsrDQo+ICB4ZW4vaW5jbHVkZS9hc20t
eDg2L2d1ZXN0LmggICAgICAgICAgICAgICAgICAgfCAgIDIgKw0KPiAgeGVuL2luY2x1ZGUvYXNt
LXg4Ni9ndWVzdC9oeXBlcmNhbGwuaCAgICAgICAgIHwgICAyICsNCj4gIHhlbi9pbmNsdWRlL2Fz
bS14ODYvZ3Vlc3QvaHlwZXJ2LmggICAgICAgICAgICB8ICA0OCArKysrKysrKw0KPiAgeGVuL2lu
Y2x1ZGUvYXNtLXg4Ni9ndWVzdC9oeXBlcnZpc29yLmggICAgICAgIHwgIDU4ICsrKysrKysrKw0K
PiAgeGVuL2luY2x1ZGUvYXNtLXg4Ni9ndWVzdC94ZW4uaCAgICAgICAgICAgICAgIHwgIDIzICst
LS0NCj4gIDE3IGZpbGVzIGNoYW5nZWQsIDMzNyBpbnNlcnRpb25zKCspLCA4NyBkZWxldGlvbnMo
LSkNCj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCB4ZW4vYXJjaC94ODYvZ3Vlc3QvaHlwZXJ2L01ha2Vm
aWxlDQo+ICBjcmVhdGUgbW9kZSAxMDA2NDQgeGVuL2FyY2gveDg2L2d1ZXN0L2h5cGVydi9oeXBl
cnYuYw0KPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IHhlbi9hcmNoL3g4Ni9ndWVzdC9oeXBlcnZpc29y
LmMNCj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCB4ZW4vYXJjaC94ODYvZ3Vlc3QveGVuL01ha2VmaWxl
DQo+ICByZW5hbWUgeGVuL2FyY2gveDg2L2d1ZXN0L3sgPT4geGVufS9oeXBlcmNhbGxfcGFnZS5T
ICgxMDAlKQ0KPiAgcmVuYW1lIHhlbi9hcmNoL3g4Ni9ndWVzdC97ID0+IHhlbn0vcHZoLWJvb3Qu
YyAoMTAwJSkNCj4gIHJlbmFtZSB4ZW4vYXJjaC94ODYvZ3Vlc3QveyA9PiB4ZW59L3hlbi5jICg4
MCUpDQo+ICBjcmVhdGUgbW9kZSAxMDA2NDQgeGVuL2luY2x1ZGUvYXNtLXg4Ni9ndWVzdC9oeXBl
cnYuaA0KPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IHhlbi9pbmNsdWRlL2FzbS14ODYvZ3Vlc3QvaHlw
ZXJ2aXNvci5oDQo+IA0KPiAtLQ0KPiAyLjIwLjENCj4gDQo+IA0KPiBfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXw0KPiBYZW4tZGV2ZWwgbWFpbGluZyBsaXN0
DQo+IFhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZw0KPiBodHRwczovL2xpc3RzLnhlbnBy
b2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVsDQpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1k
ZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21h
aWxtYW4vbGlzdGluZm8veGVuLWRldmVs
