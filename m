Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 583591B4C90
	for <lists+xen-devel@lfdr.de>; Wed, 22 Apr 2020 20:19:20 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jRJxZ-0007JW-7k; Wed, 22 Apr 2020 18:18:57 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nI87=6G=citrix.com=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1jRJxX-0007JR-Rt
 for xen-devel@lists.xenproject.org; Wed, 22 Apr 2020 18:18:55 +0000
X-Inumbo-ID: b932068d-84c5-11ea-92c3-12813bfff9fa
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b932068d-84c5-11ea-92c3-12813bfff9fa;
 Wed, 22 Apr 2020 18:18:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1587579534;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=cpDDr/FE9EF9GRbwzefTicYxITzzrMu8MMn8tsGt7RI=;
 b=hqlUbikW4uXAfKBj1DtWhEB27kxHny0uaO3CkWOFOQ8qXiplk+dUUdpD
 zRKiyhb8dyVRLxeJ9++jedW9wCS4m0cqyNMK8ASwgGdPw6EpdQUoU7KNe
 fOsSxLsYAvUlzXw9sI65uI7DjPhQ0EVldGF/CD+Dk/nkfCqQdj6BjDQDC s=;
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=George.Dunlap@citrix.com;
 spf=Pass smtp.mailfrom=George.Dunlap@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 George.Dunlap@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="George.Dunlap@citrix.com";
 x-sender="George.Dunlap@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa6.hc3370-68.iphmx.com: domain of
 George.Dunlap@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="George.Dunlap@citrix.com";
 x-sender="George.Dunlap@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="George.Dunlap@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: fIVwoBWs+roMvmT/HyCk6mTpUgVvs7AZoKZWWpidOqVlIGWaB/L9uvHu2XRJi28NfzeKkZ3U0P
 TFa3hzZ3PFoG73ehyFlb14NmPSUCGFFn32QwGtmY0doyDsI74RWNEDJ0TwxttsSB+zV+KYuGah
 mIPCoLdJgOqN8t+0nRkVZUEopnrKwRi/Agtei7vVnzRnmfxPEqh2uxAp18Hgw7bO2TiymBKPpg
 z8/ekc2xSxF82/+VAbT4r4I685GnnVrI0xWufVKvgqZfvFOiwzj9f19oieUq09jUQGjD7HNCYU
 QAk=
X-SBRS: 2.7
X-MesageID: 16488111
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,304,1583211600"; d="scan'208";a="16488111"
From: George Dunlap <George.Dunlap@citrix.com>
To: Nick Rosbrook <rosbrookn@gmail.com>
Subject: Re: [PATCH 2/4] golang/xenlight: add DeviceNicAdd/Remove wrappers
Thread-Topic: [PATCH 2/4] golang/xenlight: add DeviceNicAdd/Remove wrappers
Thread-Index: AQHWERYbVTK8PO5Z/kOuRmMVsD4Gv6iFYT+A
Date: Wed, 22 Apr 2020 18:18:51 +0000
Message-ID: <0A603CD8-2054-413C-9096-F03CEE7B2D5E@citrix.com>
References: <cover.1586727061.git.rosbrookn@ainfosec.com>
 <87323a6eb60fd908ea2f792c9754cb88b283c5a6.1586727061.git.rosbrookn@ainfosec.com>
In-Reply-To: <87323a6eb60fd908ea2f792c9754cb88b283c5a6.1586727061.git.rosbrookn@ainfosec.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3608.60.0.2.5)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
Content-Type: text/plain; charset="utf-8"
Content-ID: <A9BBFED4986DC94B9C429BA623F63B38@citrix.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
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
Cc: Nick Rosbrook <rosbrookn@ainfosec.com>,
 xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>,
 Ian Jackson <Ian.Jackson@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

DQoNCj4gT24gQXByIDEyLCAyMDIwLCBhdCAxMTowMiBQTSwgTmljayBSb3Nicm9vayA8cm9zYnJv
b2tuQGdtYWlsLmNvbT4gd3JvdGU6DQo+IA0KPiBBZGQgRGV2aWNlTmljQWRkIGFuZCBEZXZpY2VO
aWNSZW1vdmUgYXMgd3JhcHBlcnMgZm9yDQo+IGxpYnhsX2RldmljZV9uaWNfYWRkIGFuZCBsaWJ4
bF9kZXZpY2VfbmljX3JlbW92ZS4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IE5pY2sgUm9zYnJvb2sg
PHJvc2Jyb29rbkBhaW5mb3NlYy5jb20+DQo+IC0tLQ0KPiB0b29scy9nb2xhbmcveGVubGlnaHQv
eGVubGlnaHQuZ28gfCAzNCArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrDQo+IDEgZmls
ZSBjaGFuZ2VkLCAzNCBpbnNlcnRpb25zKCspDQo+IA0KPiBkaWZmIC0tZ2l0IGEvdG9vbHMvZ29s
YW5nL3hlbmxpZ2h0L3hlbmxpZ2h0LmdvIGIvdG9vbHMvZ29sYW5nL3hlbmxpZ2h0L3hlbmxpZ2h0
LmdvDQo+IGluZGV4IDg0OTJiY2VjNGUuLmE1NmY5MTNiODEgMTAwNjQ0DQo+IC0tLSBhL3Rvb2xz
L2dvbGFuZy94ZW5saWdodC94ZW5saWdodC5nbw0KPiArKysgYi90b29scy9nb2xhbmcveGVubGln
aHQveGVubGlnaHQuZ28NCj4gQEAgLTEwNjgsMyArMTA2OCwzNyBAQCBmdW5jIChDdHggKkNvbnRl
eHQpIFByaW1hcnlDb25zb2xlR2V0VHR5KGRvbWlkIHVpbnQzMikgKHBhdGggc3RyaW5nLCBlcnIg
ZXJyb3IpDQo+IAlwYXRoID0gQy5Hb1N0cmluZyhjcGF0aCkNCj4gCXJldHVybg0KPiB9DQo+ICsN
Cj4gKy8vIERldmljZU5pY0FkZCBhZGRzIGEgbmljIHRvIGEgZG9tYWluLg0KPiArZnVuYyAoQ3R4
ICpDb250ZXh0KSBEZXZpY2VOaWNBZGQoZG9taWQgRG9taWQsIG5pYyAqRGV2aWNlTmljKSBlcnJv
ciB7DQo+ICsJdmFyIGNuaWMgQy5saWJ4bF9kZXZpY2VfbmljDQo+ICsNCj4gKwlpZiBlcnIgOj0g
bmljLnRvQygmY25pYyk7IGVyciAhPSBuaWwgew0KPiArCQlyZXR1cm4gZXJyDQo+ICsJfQ0KPiAr
CWRlZmVyIEMubGlieGxfZGV2aWNlX25pY19kaXNwb3NlKCZjbmljKQ0KPiArDQo+ICsJcmV0IDo9
IEMubGlieGxfZGV2aWNlX25pY19hZGQoQ3R4LmN0eCwgQy51aW50MzJfdChkb21pZCksICZjbmlj
LCBuaWwpDQo+ICsJaWYgcmV0ICE9IDAgew0KPiArCQlyZXR1cm4gRXJyb3IocmV0KQ0KPiArCX0N
Cj4gKw0KPiArCXJldHVybiBuaWwNCj4gK30NCj4gKw0KPiArLy8gRGV2aWNlTmljUmVtb3ZlIHJl
bW92ZXMgYSBuaWMgZnJvbSBhIGRvbWFpbi4NCg0KSSBmZWVsIGxpa2UgSSB3YW50IHRvIHNheSBo
ZXJlIHdoYXQgaXQgaXMgeW91IGFjdHVhbGx5IGhhdmUgdG8gZmlsbCBpbiB0byByZW1vdmUgdGhl
IG5pYzsgYnV0IGFmdGVyIDEwIG1pbnV0ZXMgb2YgcG9raW5nIGFyb3VuZCB0aGUgY29kZSwgSeKA
mW0gbm90IGFjdHVhbGx5IHN1cmUgbXlzZWxmLiA6LSkgIChJIHRoaW5rIGl0ICptaWdodCogYmUg
anVzdCBEZXZpZCBhbmQgQmFja2VuZERvbWlkLikNCg0KU28gSeKAmWxsIGdpdmUgdGhpcyBmb3Ig
bm93Og0KDQpSZXZpZXdlZC1ieTogR2VvcmdlIER1bmxhcCA8Z2VvcmdlLmR1bmxhcEBjaXRyaXgu
Y29tPg0KDQpBbmQgaWYgSSBmaW5kIGl0IGJlZm9yZSBJIGZpbmlzaCByZXZpZXdpbmcgdGhlIGVu
ZCBvZiB0aGUgc2VyaWVzLCB3ZSBjYW4gY2hlY2sgaXQgaW4gYW5kIGxvb2sgYXQgaW1wcm92aW5n
IHRoZSBkb2N1bWVudGF0aW9uIGxhdGVyLg0KDQogLUdlb3JnZQ==

