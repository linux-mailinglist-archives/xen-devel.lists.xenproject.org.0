Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A8F6F11E79C
	for <lists+xen-devel@lfdr.de>; Fri, 13 Dec 2019 17:05:40 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ifnP3-0007EL-0e; Fri, 13 Dec 2019 16:02:53 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=RhJP=2D=amazon.com=prvs=2436cd82a=hongyxia@srs-us1.protection.inumbo.net>)
 id 1ifnP1-0007EF-Gb
 for xen-devel@lists.xenproject.org; Fri, 13 Dec 2019 16:02:51 +0000
X-Inumbo-ID: 03a47d32-1dc2-11ea-b6f1-bc764e2007e4
Received: from smtp-fw-2101.amazon.com (unknown [72.21.196.25])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 03a47d32-1dc2-11ea-b6f1-bc764e2007e4;
 Fri, 13 Dec 2019 16:02:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1576252971; x=1607788971;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=yq1/4lrHoBBrBAnxmVnnwtQZ72NFH1oXJNDm9Ku5YOs=;
 b=rguTyNraESHSDzyhyitTUm4VyHAeAIRgKznhOx+1pEGKwRFY2qaWA15P
 I7Fk430koPjbsUmycGnzVSG6+7kCkfqh5WlDFCzl3o3eH0rJaqdv3ml10
 ej3a2VnrXxNOewKvu1f9gauH1j4FwjFXD5of9Lmn8wfxqww0u43dT4POq w=;
IronPort-SDR: 5vz0ktUh93DbtkELCL/9T64obVHFxulIHq1aSVgPxNumKsKvYmqFzPxLHT7hBg6EAilTd7CmOC
 wy9tgHeEJ5bQ==
X-IronPort-AV: E=Sophos;i="5.69,309,1571702400"; 
   d="scan'208";a="8451621"
Received: from iad6-co-svc-p1-lb1-vlan2.amazon.com (HELO
 email-inbound-relay-2b-859fe132.us-west-2.amazon.com) ([10.124.125.2])
 by smtp-border-fw-out-2101.iad2.amazon.com with ESMTP;
 13 Dec 2019 16:02:49 +0000
Received: from EX13MTAUEA001.ant.amazon.com
 (pdx4-ws-svc-p6-lb7-vlan2.pdx.amazon.com [10.170.41.162])
 by email-inbound-relay-2b-859fe132.us-west-2.amazon.com (Postfix) with ESMTPS
 id 5829C2218B9; Fri, 13 Dec 2019 16:02:48 +0000 (UTC)
Received: from EX13D37EUA003.ant.amazon.com (10.43.165.7) by
 EX13MTAUEA001.ant.amazon.com (10.43.61.82) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Fri, 13 Dec 2019 16:02:47 +0000
Received: from EX13D37EUA003.ant.amazon.com (10.43.165.7) by
 EX13D37EUA003.ant.amazon.com (10.43.165.7) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Fri, 13 Dec 2019 16:02:46 +0000
Received: from EX13D37EUA003.ant.amazon.com ([10.43.165.7]) by
 EX13D37EUA003.ant.amazon.com ([10.43.165.7]) with mapi id 15.00.1367.000;
 Fri, 13 Dec 2019 16:02:46 +0000
From: "Xia, Hongyan" <hongyxia@amazon.com>
To: "jbeulich@suse.com" <jbeulich@suse.com>, "andrew.cooper3@citrix.com"
 <andrew.cooper3@citrix.com>
Thread-Topic: [PATCH v4 1/2] x86/mm: factor out the code for shattering an l3
 PTE
Thread-Index: AQHVscBm1RkMKh7+EEeoRcWu0gs6Aae4IeiAgAAGE4CAABIIAA==
Date: Fri, 13 Dec 2019 16:02:46 +0000
Message-ID: <8cd0bee164f6e41b233635c9adf3435aa9a9315c.camel@amazon.com>
References: <cover.1576154413.git.hongyxia@amazon.com>
 <77acf62cab293ae99bd1fc079e1b0853faaf1242.1576154413.git.hongyxia@amazon.com>
 <2717096f-21d7-f184-b606-a3defffad847@citrix.com>
 <345f27f4-c2d3-0501-6d48-e1b757c0154d@suse.com>
 <374283a7-bc45-9f74-55f2-501f854d55c6@citrix.com>
In-Reply-To: <374283a7-bc45-9f74-55f2-501f854d55c6@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.43.166.122]
Content-ID: <0EC2742C325A074583DD79FD9CCF32F8@amazon.com>
MIME-Version: 1.0
Precedence: Bulk
Subject: Re: [Xen-devel] [PATCH v4 1/2] x86/mm: factor out the code for
 shattering an l3 PTE
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Grall, 
 Julien" <jgrall@amazon.com>, "wl@xen.org" <wl@xen.org>,
 "roger.pau@citrix.com" <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gRnJpLCAyMDE5LTEyLTEzIGF0IDE0OjU4ICswMDAwLCBBbmRyZXcgQ29vcGVyIHdyb3RlOg0K
PiBPbiAxMy8xMi8yMDE5IDE0OjM2LCBKYW4gQmV1bGljaCB3cm90ZToNCj4gPiBPbiAxMy4xMi4y
MDE5IDE1OjE5LCBBbmRyZXcgQ29vcGVyIHdyb3RlOg0KPiA+ID4gT24gMTIvMTIvMjAxOSAxMjo0
NiwgSG9uZ3lhbiBYaWEgd3JvdGU6DQo+ID4gPiA+IGRpZmYgLS1naXQgYS94ZW4vYXJjaC94ODYv
bW0uYyBiL3hlbi9hcmNoL3g4Ni9tbS5jDQo+ID4gPiA+IGluZGV4IDdkNGRkODBhODUuLjhkZWY0
ZmI4ZDggMTAwNjQ0DQo+ID4gPiA+IC0tLSBhL3hlbi9hcmNoL3g4Ni9tbS5jDQo+ID4gPiA+ICsr
KyBiL3hlbi9hcmNoL3g4Ni9tbS5jDQo+ID4gPiA+IEBAIC01MTUxLDYgKzUxNTEsNTIgQEAgbDFf
cGdlbnRyeV90ICp2aXJ0X3RvX3hlbl9sMWUodW5zaWduZWQNCj4gPiA+ID4gbG9uZyB2KQ0KPiA+
ID4gPiAgICAgICAgICAgICAgICAgICAgICAgICAgIGZsdXNoX2FyZWFfbG9jYWwoKGNvbnN0IHZv
aWQgKil2LCBmKQ0KPiA+ID4gPiA6IFwNCj4gPiA+ID4gICAgICAgICAgICAgICAgICAgICAgICAg
ICBmbHVzaF9hcmVhX2FsbCgoY29uc3Qgdm9pZCAqKXYsIGYpKQ0KPiA+ID4gPiAgDQo+ID4gPiA+
ICsvKiBTaGF0dGVyIGFuIGwzIGVudHJ5IGFuZCBwb3B1bGF0ZSBsMi4gSWYgdmlydCBpcyBwYXNz
ZWQgaW4sDQo+ID4gPiA+IGFsc28gZG8gZmx1c2guICovDQo+ID4gPiA+ICtzdGF0aWMgYm9vbCBz
aGF0dGVyX2wzZShsM19wZ2VudHJ5X3QgKnBsM2UsIHVuc2lnbmVkIGxvbmcNCj4gPiA+ID4gdmly
dCwgYm9vbCBsb2NraW5nKQ0KPiA+ID4gPiArew0KPiA+ID4gPiArICAgIHVuc2lnbmVkIGludCBp
Ow0KPiA+ID4gPiArICAgIGwzX3BnZW50cnlfdCBvbDNlID0gKnBsM2U7DQo+ID4gPiA+ICsgICAg
bDJfcGdlbnRyeV90IGwyZSA9IGwyZV9mcm9tX2ludHB0ZShsM2VfZ2V0X2ludHB0ZShvbDNlKSk7
DQo+ID4gPiA+ICsgICAgbDJfcGdlbnRyeV90ICpsMnQgPSBhbGxvY194ZW5fcGFnZXRhYmxlKCk7
DQo+ID4gPiA+ICsNCj4gPiA+ID4gKyAgICBpZiAoICFsMnQgKQ0KPiA+ID4gPiArICAgICAgICBy
ZXR1cm4gZmFsc2U7DQo+ID4gPiA+ICsNCj4gPiA+ID4gKyAgICBmb3IgKCBpID0gMDsgaSA8IEwy
X1BBR0VUQUJMRV9FTlRSSUVTOyBpKysgKQ0KPiA+ID4gPiArICAgIHsNCj4gPiA+ID4gKyAgICAg
ICAgbDJlX3dyaXRlKGwydCArIGksIGwyZSk7DQo+ID4gPiA+ICsgICAgICAgIGwyZSA9IGwyZV9m
cm9tX2ludHB0ZSgNCj4gPiA+ID4gKyAgICAgICAgICAgICAgICAgIGwyZV9nZXRfaW50cHRlKGwy
ZSkgKyAoUEFHRV9TSVpFIDw8DQo+ID4gPiA+IFBBR0VUQUJMRV9PUkRFUikpOw0KPiA+ID4gPiAr
ICAgIH0NCj4gPiA+ID4gKw0KPiA+ID4gPiArICAgIGlmICggbG9ja2luZyApDQo+ID4gPiA+ICsg
ICAgICAgIHNwaW5fbG9jaygmbWFwX3BnZGlyX2xvY2spOw0KPiA+ID4gPiArICAgIGlmICggKGwz
ZV9nZXRfZmxhZ3MoKnBsM2UpICYgX1BBR0VfUFJFU0VOVCkgJiYNCj4gPiA+ID4gKyAgICAgICAg
IChsM2VfZ2V0X2ZsYWdzKCpwbDNlKSAmIF9QQUdFX1BTRSkgKQ0KPiA+ID4gPiArICAgIHsNCj4g
PiA+ID4gKyAgICAgICAgbDNlX3dyaXRlX2F0b21pYyhwbDNlLA0KPiA+ID4gPiArICAgICAgICAg
ICAgbDNlX2Zyb21fcGFkZHIodmlydF90b19tYWRkcihsMnQpLA0KPiA+ID4gPiBfX1BBR0VfSFlQ
RVJWSVNPUikpOw0KPiA+ID4gPiArICAgICAgICBsMnQgPSBOVUxMOw0KPiA+ID4gPiArICAgIH0N
Cj4gPiA+ID4gKyAgICBpZiAoIGxvY2tpbmcgKQ0KPiA+ID4gPiArICAgICAgICBzcGluX3VubG9j
aygmbWFwX3BnZGlyX2xvY2spOw0KPiA+ID4gPiArDQo+ID4gPiA+ICsgICAgaWYgKCB2aXJ0ICkN
Cj4gPiA+ID4gKyAgICB7DQo+ID4gPiA+ICsgICAgICAgIHVuc2lnbmVkIGludCBmbHVzaF9mbGFn
cyA9DQo+ID4gPiA+ICsgICAgICAgICAgICBGTFVTSF9UTEIgfCBGTFVTSF9PUkRFUigyICogUEFH
RVRBQkxFX09SREVSKTsNCj4gPiA+ID4gKw0KPiA+ID4gPiArICAgICAgICBpZiAoIGwzZV9nZXRf
ZmxhZ3Mob2wzZSkgJiBfUEFHRV9HTE9CQUwgKQ0KPiA+ID4gPiArICAgICAgICAgICAgZmx1c2hf
ZmxhZ3MgfD0gRkxVU0hfVExCX0dMT0JBTDsNCj4gPiA+IA0KPiA+ID4gQW5vdGhlciBwcm9ibGVt
YXRpYyB1c2Ugb2Ygb2wzZSB3aGljaCBpcyByYWN5IG9uIGNvbmZsaWN0LiAgWW91DQo+ID4gPiBu
ZWVkIHRvDQo+ID4gPiBzdHJpY3RseSB1c2UgdGhlIGNvbnRlbnQgb2YgKnBsM2UgZnJvbSB3aXRo
aW4gdGhlIGxvY2tlZCByZWdpb24uDQo+ID4gDQo+ID4gQnV0IHRoaXMgaXNuJ3QgYSBwcm9ibGVt
IGludHJvZHVjZWQgaGVyZSwgaS5lLiBmaXhpbmcgb2YgaXQgZG9lc24ndA0KPiA+IHN0cmljdGx5
IGZhbGwgdW5kZXIgInJlLWZhY3RvciIuIChJJ20gY2VydGFpbmx5IG5vdCBvcHBvc2VkIHRvDQo+
ID4gZ2V0dGluZyB0aGlzIHJpZ2h0IGF0IHRoZSBzYW1lIHRpbWUuKQ0KPiANCj4gSXQgaXMgYnJh
bmQgbmV3IGNvZGUgd2hpY2ggaXMgcmFjeS4gIEl0cyBlaXRoZXIgbm90IG5lY2Vzc2FyeSwgb3Ig
YW4NCj4gWFNBLWluLXdhaXRpbmcuICAoQW5kIG5vdCBuZWNlc3NhcnksIEFGQUlDVCkuDQo+IA0K
DQpJIGFtIHJlYWxseSBjb25mdXNlZC4gVGhlIG9yaWdpbmFsIGNvZGUgYWxyZWFkeSBkb2VzIHN1
Yi1yZWdpb24NCmZsdXNoZXMsIGFuZCBpdCB1c2VzIGEgZmx1c2ggZmxhZyBmcm9tIG9sM2UgdGhh
dCBpcyBldmVuIG1vcmUgb3V0ZGF0ZWQNCnRoYW4gdGhlIHJlZmFjdG9yZWQgdmVyc2lvbiwgc28g
SSBhbSBub3QgcXVpdGUgZ2V0dGluZyB5b3VyIHBvaW50LiBJDQpob3BlIEkgYW0gbm90IG1pc3Np
bmcgc29tZXRoaW5nIG9idmlvdXMuDQoNCkhvbmd5YW4NCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVs
QGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1h
bi9saXN0aW5mby94ZW4tZGV2ZWw=
