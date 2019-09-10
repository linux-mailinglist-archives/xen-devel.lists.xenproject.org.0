Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CC04DAEA8F
	for <lists+xen-devel@lfdr.de>; Tue, 10 Sep 2019 14:37:33 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i7fLn-00032O-Kk; Tue, 10 Sep 2019 12:34:27 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=M1KC=XF=citrix.com=paul.durrant@srs-us1.protection.inumbo.net>)
 id 1i7fLn-00032J-2q
 for xen-devel@lists.xenproject.org; Tue, 10 Sep 2019 12:34:27 +0000
X-Inumbo-ID: 5309a299-d3c7-11e9-ac1d-12813bfff9fa
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 5309a299-d3c7-11e9-ac1d-12813bfff9fa;
 Tue, 10 Sep 2019 12:34:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1568118867;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=zCoeT2jI8TgOAhNXJ9ezEY9GxFJcyK3h+9Q4XBDg7qQ=;
 b=ImUlpU7YYFn+7qq0ZEvONxffHPSso5lfD5sYOFLVCmeIWDO1ydK+2w16
 3GcxaOBW3QChQBmW9fYsB6NCnJUgSjW2tdiea7i9C/YqxwHeo+0l13jCW
 VNurjAc81d32HVihY5MF/681zNLYyBpqHQcF5YvA/ymsFXIdzwQFAt4dR U=;
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=Paul.Durrant@citrix.com;
 spf=Pass smtp.mailfrom=Paul.Durrant@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 Paul.Durrant@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="Paul.Durrant@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa2.hc3370-68.iphmx.com: domain of
 Paul.Durrant@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="Paul.Durrant@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: /Dl7BoirJ4gns4LTUT/hzMBNnI7/KxxGJDaUUAPgWpCjrY4v2vUayHFlPnYcts6fe4PLPxeHLD
 xiHRyrgtqzCRbAB5DSKMP3on2+1Ab2Mc1YSvIFIQjOQ5yJMBOGiAmt+RfeBv0Ov+0MQGnuKA1q
 gsXWCoc6xzwn6pMzn7gdBPYCLT5C6WJ0kuPjWtpI3wsxusmwaArAfhjeIzwEYjsbOniEooO9rA
 AuLKwYHnFLC4bbguMGZydg3ucA1Nxq/NoxZi70C8eNGMgh9BG2GW7i0c6l7UY8A8veRnCOf+aM
 Aeg=
X-SBRS: 2.7
X-MesageID: 5366776
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,489,1559534400"; 
   d="scan'208";a="5366776"
From: Paul Durrant <Paul.Durrant@citrix.com>
To: Roger Pau Monne <roger.pau@citrix.com>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>
Thread-Topic: [Xen-devel] [PATCH v2 04/11] ioreq: add fields to allow internal
 ioreq servers
Thread-Index: AQHVYnLmQHjVkQZHN0K1IeubR0Mv5ack4wfg
Date: Tue, 10 Sep 2019 12:34:21 +0000
Message-ID: <551af74570174eff89b0bcba33e73c51@AMSPEX02CL03.citrite.net>
References: <20190903161428.7159-1-roger.pau@citrix.com>
 <20190903161428.7159-5-roger.pau@citrix.com>
In-Reply-To: <20190903161428.7159-5-roger.pau@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH v2 04/11] ioreq: add fields to allow
 internal ioreq servers
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
Cc: Andrew Cooper <Andrew.Cooper3@citrix.com>, Jan
 Beulich <jbeulich@suse.com>, Wei Liu <wl@xen.org>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBYZW4tZGV2ZWwgPHhlbi1kZXZl
bC1ib3VuY2VzQGxpc3RzLnhlbnByb2plY3Qub3JnPiBPbiBCZWhhbGYgT2YgUm9nZXIgUGF1IE1v
bm5lDQo+IFNlbnQ6IDAzIFNlcHRlbWJlciAyMDE5IDE3OjE0DQo+IFRvOiB4ZW4tZGV2ZWxAbGlz
dHMueGVucHJvamVjdC5vcmcNCj4gQ2M6IEFuZHJldyBDb29wZXIgPEFuZHJldy5Db29wZXIzQGNp
dHJpeC5jb20+OyBXZWkgTGl1IDx3bEB4ZW4ub3JnPjsgSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1
c2UuY29tPjsNCj4gUm9nZXIgUGF1IE1vbm5lIDxyb2dlci5wYXVAY2l0cml4LmNvbT4NCj4gU3Vi
amVjdDogW1hlbi1kZXZlbF0gW1BBVENIIHYyIDA0LzExXSBpb3JlcTogYWRkIGZpZWxkcyB0byBh
bGxvdyBpbnRlcm5hbCBpb3JlcSBzZXJ2ZXJzDQo+IA0KPiBJbnRlcm5hbCBpb3JlcSBzZXJ2ZXJz
IGFyZSBwbGFpbiBmdW5jdGlvbiBoYW5kbGVycyBpbXBsZW1lbnRlZCBpbnNpZGUNCj4gb2YgdGhl
IGh5cGVydmlzb3IuIE5vdGUgdGhhdCBtb3N0IGZpZWxkcyB1c2VkIGJ5IGN1cnJlbnQgKGV4dGVy
bmFsKQ0KPiBpb3JlcSBzZXJ2ZXJzIGFyZSBub3QgbmVlZGVkIGZvciBpbnRlcm5hbCBvbmVzLCBh
bmQgaGVuY2UgaGF2ZSBiZWVuDQo+IHBsYWNlZCBpbnNpZGUgb2YgYSBzdHJ1Y3QgYW5kIHBhY2tl
ZCBpbiBhbiB1bmlvbiB0b2dldGhlciB3aXRoIHRoZQ0KPiBvbmx5IGludGVybmFsIHNwZWNpZmlj
IGZpZWxkLCBhIGZ1bmN0aW9uIHBvaW50ZXIgdG8gYSBoYW5kbGVyLg0KPiANCj4gVGhpcyBpcyBy
ZXF1aXJlZCBpbiBvcmRlciB0byBoYXZlIFBDSSBjb25maWcgYWNjZXNzZXMgZm9yd2FyZGVkIHRv
DQo+IGV4dGVybmFsIGlvcmVxIHNlcnZlcnMgb3IgdG8gaW50ZXJuYWwgb25lcyAoaWU6IFFFTVUg
ZW11bGF0ZWQgZGV2aWNlcw0KPiB2cyB2UENJIHBhc3N0aHJvdWdoKSwgYW5kIGlzIHRoZSBmaXJz
dCBzdGVwIGluIG9yZGVyIHRvIGFsbG93DQo+IHVucHJpdmlsZWdlZCBkb21haW5zIHRvIHVzZSB2
UENJLg0KPiANCj4gU2lnbmVkLW9mZi1ieTogUm9nZXIgUGF1IE1vbm7DqSA8cm9nZXIucGF1QGNp
dHJpeC5jb20+DQoNClJldmlld2VkLWJ5OiBQYXVsIER1cnJhbnQgPHBhdWwuZHVycmFudEBjaXRy
aXguY29tPg0KDQo+IC0tLQ0KPiBDaGFuZ2VzIHNpbmNlIHYxOg0KPiAgLSBEbyBub3QgYWRkIGFu
IGludGVybmFsIGZpZWxkIHRvIHRoZSBpb3JlcSBzZXJ2ZXIgc3RydWN0LCB3aGV0aGVyIGENCj4g
ICAgc2VydmVyIGlzIGludGVybmFsIG9yIGV4dGVybmFsIGNhbiBhbHJlYWR5IGJlIGluZmVycmVk
IGZyb20gdGhlIGlkLg0KPiAgLSBBZGQgYW4gZXh0cmEgcGFyYW1ldGVyIHRvIHRoZSBpbnRlcm5h
bCBoYW5kbGVyIGluIG9yZGVyIHRvIHBhc3MNCj4gICAgdXNlci1wcm92aWRlZCBvcGFxdWUgZGF0
YSB0byB0aGUgaGFuZGxlci4NCj4gLS0tDQo+ICB4ZW4vaW5jbHVkZS9hc20teDg2L2h2bS9kb21h
aW4uaCB8IDMwICsrKysrKysrKysrKysrKysrKystLS0tLS0tLS0tLQ0KPiAgMSBmaWxlIGNoYW5n
ZWQsIDE5IGluc2VydGlvbnMoKyksIDExIGRlbGV0aW9ucygtKQ0KPiANCj4gZGlmZiAtLWdpdCBh
L3hlbi9pbmNsdWRlL2FzbS14ODYvaHZtL2RvbWFpbi5oIGIveGVuL2luY2x1ZGUvYXNtLXg4Ni9o
dm0vZG9tYWluLmgNCj4gaW5kZXggYmNjNTYyMTc5Ny4uOWZiZTgzZjQ1YSAxMDA2NDQNCj4gLS0t
IGEveGVuL2luY2x1ZGUvYXNtLXg4Ni9odm0vZG9tYWluLmgNCj4gKysrIGIveGVuL2luY2x1ZGUv
YXNtLXg4Ni9odm0vZG9tYWluLmgNCj4gQEAgLTUyLDIxICs1MiwyOSBAQCBzdHJ1Y3QgaHZtX2lv
cmVxX3ZjcHUgew0KPiAgI2RlZmluZSBNQVhfTlJfSU9fUkFOR0VTICAyNTYNCj4gDQo+ICBzdHJ1
Y3QgaHZtX2lvcmVxX3NlcnZlciB7DQo+IC0gICAgc3RydWN0IGRvbWFpbiAgICAgICAgICAqdGFy
Z2V0LCAqZW11bGF0b3I7DQo+IC0NCj4gKyAgICBzdHJ1Y3QgZG9tYWluICAgICAgICAgICp0YXJn
ZXQ7DQo+ICAgICAgLyogTG9jayB0byBzZXJpYWxpemUgdG9vbHN0YWNrIG1vZGlmaWNhdGlvbnMg
Ki8NCj4gICAgICBzcGlubG9ja190ICAgICAgICAgICAgIGxvY2s7DQo+IC0NCj4gLSAgICBzdHJ1
Y3QgaHZtX2lvcmVxX3BhZ2UgIGlvcmVxOw0KPiAtICAgIHN0cnVjdCBsaXN0X2hlYWQgICAgICAg
aW9yZXFfdmNwdV9saXN0Ow0KPiAtICAgIHN0cnVjdCBodm1faW9yZXFfcGFnZSAgYnVmaW9yZXE7
DQo+IC0NCj4gLSAgICAvKiBMb2NrIHRvIHNlcmlhbGl6ZSBhY2Nlc3MgdG8gYnVmZmVyZWQgaW9y
ZXEgcmluZyAqLw0KPiAtICAgIHNwaW5sb2NrX3QgICAgICAgICAgICAgYnVmaW9yZXFfbG9jazsN
Cj4gLSAgICBldnRjaG5fcG9ydF90ICAgICAgICAgIGJ1ZmlvcmVxX2V2dGNobjsNCj4gICAgICBz
dHJ1Y3QgcmFuZ2VzZXQgICAgICAgICpyYW5nZVtOUl9JT19SQU5HRV9UWVBFU107DQo+ICAgICAg
Ym9vbCAgICAgICAgICAgICAgICAgICBlbmFibGVkOw0KPiAtICAgIHVpbnQ4X3QgICAgICAgICAg
ICAgICAgYnVmaW9yZXFfaGFuZGxpbmc7DQo+ICsNCj4gKyAgICB1bmlvbiB7DQo+ICsgICAgICAg
IHN0cnVjdCB7DQo+ICsgICAgICAgICAgICBzdHJ1Y3QgZG9tYWluICAgICAgICAgICplbXVsYXRv
cjsNCj4gKyAgICAgICAgICAgIHN0cnVjdCBodm1faW9yZXFfcGFnZSAgaW9yZXE7DQo+ICsgICAg
ICAgICAgICBzdHJ1Y3QgbGlzdF9oZWFkICAgICAgIGlvcmVxX3ZjcHVfbGlzdDsNCj4gKyAgICAg
ICAgICAgIHN0cnVjdCBodm1faW9yZXFfcGFnZSAgYnVmaW9yZXE7DQo+ICsNCj4gKyAgICAgICAg
ICAgIC8qIExvY2sgdG8gc2VyaWFsaXplIGFjY2VzcyB0byBidWZmZXJlZCBpb3JlcSByaW5nICov
DQo+ICsgICAgICAgICAgICBzcGlubG9ja190ICAgICAgICAgICAgIGJ1ZmlvcmVxX2xvY2s7DQo+
ICsgICAgICAgICAgICBldnRjaG5fcG9ydF90ICAgICAgICAgIGJ1ZmlvcmVxX2V2dGNobjsNCj4g
KyAgICAgICAgICAgIHVpbnQ4X3QgICAgICAgICAgICAgICAgYnVmaW9yZXFfaGFuZGxpbmc7DQo+
ICsgICAgICAgIH07DQo+ICsgICAgICAgIHN0cnVjdCB7DQo+ICsgICAgICAgICAgICB2b2lkICAg
ICAgICAgICAgICAgICAgICpkYXRhOw0KPiArICAgICAgICAgICAgaW50ICgqaGFuZGxlcikoc3Ry
dWN0IHZjcHUgKnYsIGlvcmVxX3QgKiwgdm9pZCAqKTsNCj4gKyAgICAgICAgfTsNCj4gKyAgICB9
Ow0KPiAgfTsNCj4gDQo+ICAvKg0KPiAtLQ0KPiAyLjIyLjANCj4gDQo+IA0KPiBfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXw0KPiBYZW4tZGV2ZWwgbWFpbGlu
ZyBsaXN0DQo+IFhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZw0KPiBodHRwczovL2xpc3Rz
LnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVsDQpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0
Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qu
b3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
