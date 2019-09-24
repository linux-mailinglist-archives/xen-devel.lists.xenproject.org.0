Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FEE7BC489
	for <lists+xen-devel@lfdr.de>; Tue, 24 Sep 2019 11:11:44 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iCgoa-0001zq-SQ; Tue, 24 Sep 2019 09:08:56 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=d2pe=XT=citrix.com=paul.durrant@srs-us1.protection.inumbo.net>)
 id 1iCgoZ-0001zk-3d
 for xen-devel@lists.xenproject.org; Tue, 24 Sep 2019 09:08:55 +0000
X-Inumbo-ID: ee576c1a-deaa-11e9-9610-12813bfff9fa
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by localhost (Halon) with ESMTPS
 id ee576c1a-deaa-11e9-9610-12813bfff9fa;
 Tue, 24 Sep 2019 09:08:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1569316135;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=7vBmFSmTPMO7LWXDl1qTS8x33R/LjgrTcYxzYXbtlgk=;
 b=SlKAUGP+oOZjvSvkmg4QXUMBQQLW6vuD/Gzb1wccly2B8qZsQn6HN80N
 UoTy8YzMCVlq7JFYSm4ml96DDpeYO9OJdHQOyncP3RYR7z5Hf+JJ8Lh2k
 Lv9CLIC3jnC1A3Mhuxdm5ircPLWfGIE5dpS/4OO9tKxTi43SjTKNX1tuf k=;
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=Paul.Durrant@citrix.com;
 spf=Pass smtp.mailfrom=Paul.Durrant@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 Paul.Durrant@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="Paul.Durrant@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa1.hc3370-68.iphmx.com: domain of
 Paul.Durrant@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="Paul.Durrant@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: uF/pypIRi3RpByx/RuiInuaKQrSGDVqhg025xrSgRHOqCrB6iuMzmoAWwnV+5bJ6LkEFpBg0rc
 fTYvf3fQN88qUqflY2onzqwvyW9iuRqmEt6VxcJvuJgf6f4t5bejUqCVEXN3MJRnRaZ6osmjiK
 X2wPg1onKaDw1nw8g34BwuLqZTZFFJ5iknP0XHT+5qFecAR7k1M+PbUUNymXR3vZaPu59KvDXn
 4jX4kLE82JPDrIunY4wPiOIXYY36O4u5pnRIFh+3lfb4TA/Vr9Pe6zLReUpRrCQX0ePDTikhvM
 SPI=
X-SBRS: 2.7
X-MesageID: 6038589
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,543,1559534400"; 
   d="scan'208";a="6038589"
From: Paul Durrant <Paul.Durrant@citrix.com>
To: 'Jan Beulich' <jbeulich@suse.com>
Thread-Topic: [Xen-devel] [PATCH v6 6/8] AMD/IOMMU: tidy struct ivrs_mappings
Thread-Index: AQHVbu3E2x13CiTrgkyIxcLuJ2Ba16c5eODggAD1DYCAACHJcA==
Date: Tue, 24 Sep 2019 09:08:46 +0000
Message-ID: <10bdff68f43d48829437404735bb383e@AMSPEX02CL03.citrite.net>
References: <aa62726c-5aa4-8bcd-dc35-61eb8dfeaee3@suse.com>
 <6de11867-b872-a2a1-7c26-af004164bfea@suse.com>
 <6b8b0d5e09c24b068ede852c4eab50dc@AMSPEX02CL03.citrite.net>
 <6d5b8ac4-6787-0f01-fa6a-8301cbb9d5e3@suse.com>
In-Reply-To: <6d5b8ac4-6787-0f01-fa6a-8301cbb9d5e3@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH v6 6/8] AMD/IOMMU: tidy struct ivrs_mappings
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
 Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>,
 Andrew Cooper <Andrew.Cooper3@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogSmFuIEJldWxpY2ggPGpi
ZXVsaWNoQHN1c2UuY29tPg0KPiBTZW50OiAyNCBTZXB0ZW1iZXIgMjAxOSAxMDowMg0KPiBUbzog
UGF1bCBEdXJyYW50IDxQYXVsLkR1cnJhbnRAY2l0cml4LmNvbT4NCj4gQ2M6IHhlbi1kZXZlbEBs
aXN0cy54ZW5wcm9qZWN0Lm9yZzsgU3VyYXZlZSBTdXRoaWt1bHBhbml0IDxzdXJhdmVlLnN1dGhp
a3VscGFuaXRAYW1kLmNvbT47IEFuZHJldw0KPiBDb29wZXIgPEFuZHJldy5Db29wZXIzQGNpdHJp
eC5jb20+DQo+IFN1YmplY3Q6IFJlOiBbWGVuLWRldmVsXSBbUEFUQ0ggdjYgNi84XSBBTUQvSU9N
TVU6IHRpZHkgc3RydWN0IGl2cnNfbWFwcGluZ3MNCj4gDQo+IE9uIDIzLjA5LjIwMTkgMTg6MjUs
IFBhdWwgRHVycmFudCB3cm90ZToNCj4gPj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4g
Pj4gRnJvbTogWGVuLWRldmVsIDx4ZW4tZGV2ZWwtYm91bmNlc0BsaXN0cy54ZW5wcm9qZWN0Lm9y
Zz4gT24gQmVoYWxmIE9mIEphbiBCZXVsaWNoDQo+ID4+IFNlbnQ6IDE5IFNlcHRlbWJlciAyMDE5
IDE0OjI0DQo+ID4+IFRvOiB4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcNCj4gPj4gQ2M6
IEFuZHJldyBDb29wZXIgPEFuZHJldy5Db29wZXIzQGNpdHJpeC5jb20+OyBTdXJhdmVlIFN1dGhp
a3VscGFuaXQNCj4gPHN1cmF2ZWUuc3V0aGlrdWxwYW5pdEBhbWQuY29tPg0KPiA+PiBTdWJqZWN0
OiBbWGVuLWRldmVsXSBbUEFUQ0ggdjYgNi84XSBBTUQvSU9NTVU6IHRpZHkgc3RydWN0IGl2cnNf
bWFwcGluZ3MNCj4gPj4NCj4gPj4gTW92ZSB0aGUgZGV2aWNlIGZsYWdzIGZpZWxkIHVwIGludG8g
YW4gdW51c2VkIGhvbGUsIHRodXMgc2hyaW5raW5nDQo+ID4+IG92ZXJhbGwgc3RydWN0dXJlIHNp
emUgYnkgOCBieXRlcy4gVXNlIGJvb2wgYW5kIHVpbnQ8Tj5fdCBhcw0KPiA+PiBhcHByb3ByaWF0
ZS4gRHJvcCBwb2ludGxlc3MgKHJlZHVuZGFudCkgaW5pdGlhbGl6YXRpb25zLg0KPiA+Pg0KPiA+
PiBTaWduZWQtb2ZmLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+DQo+ID4NCj4g
PiBSZXZpZXdlZC1ieTogUGF1bCBEdXJyYW50IDxwYXVsLmR1cnJhbnRAY2l0cml4LmNvbT4NCj4g
DQo+IFRoYW5rcy4NCj4gDQo+ID4gLi4uYWx0aG91Z2ggSSB3b25kZXIuLi4NCj4gPg0KPiA+PiAt
LS0gYS94ZW4vaW5jbHVkZS9hc20teDg2L2FtZC1pb21tdS5oDQo+ID4+ICsrKyBiL3hlbi9pbmNs
dWRlL2FzbS14ODYvYW1kLWlvbW11LmgNCj4gPj4gQEAgLTEwNiwxMiArMTA2LDE2IEBAIHN0cnVj
dCBhbWRfaW9tbXUgew0KPiA+PiAgfTsNCj4gPj4NCj4gPj4gIHN0cnVjdCBpdnJzX21hcHBpbmdz
IHsNCj4gPj4gLSAgICB1MTYgZHRlX3JlcXVlc3Rvcl9pZDsNCj4gPj4gLSAgICB1OCBkdGVfYWxs
b3dfZXhjbHVzaW9uOw0KPiA+PiAtICAgIHU4IHVuaXR5X21hcF9lbmFibGU7DQo+ID4+IC0gICAg
dTggd3JpdGVfcGVybWlzc2lvbjsNCj4gPj4gLSAgICB1OCByZWFkX3Blcm1pc3Npb247DQo+ID4+
ICsgICAgdWludDE2X3QgZHRlX3JlcXVlc3Rvcl9pZDsNCj4gPj4gICAgICBib29sIHZhbGlkOw0K
PiA+PiArICAgIGJvb2wgZHRlX2FsbG93X2V4Y2x1c2lvbjsNCj4gPj4gKyAgICBib29sIHVuaXR5
X21hcF9lbmFibGU7DQo+ID4+ICsgICAgYm9vbCB3cml0ZV9wZXJtaXNzaW9uOw0KPiA+PiArICAg
IGJvb2wgcmVhZF9wZXJtaXNzaW9uOw0KPiA+DQo+ID4gQ291bGQgeW91IHNocmluayB0aGlzIGV2
ZW4gbW9yZSBieSB1c2luZyBhIGJpdC1maWVsZCBpbnN0ZWFkIG9mIHRoaXMgc2VxdWVuY2Ugb2Yg
Ym9vbHM/DQo+IA0KPiBJbmRlZWQgSSBoYWQgYmVlbiBjb25zaWRlcmluZyB0aGlzLiBCZXNpZGVz
IHRoZSBmYWN0IHRoYXQgbWFraW5nDQo+IHN1Y2ggYSBtb3ZlIHNpbXBseSBkaWRuJ3QgbG9vayB0
byBmaXQgb3RoZXIgdGhpbmdzIGhlcmUgdmVyeSB3ZWxsDQo+IHdoZW4gaW50cm9kdWNpbmcgdGhl
ICJ2YWxpZCIgZmxhZyBpbiBhbiBlYXJsaWVyIHBhdGgsIGFuZCB0aGVuDQo+IGFsc28gbm90IGhl
cmUsIGRvIHlvdSByZWFsaXplIHRob3VnaCB0aGF0IHRoaXMgd291bGRuJ3Qgc2hyaW5rDQo+IHRo
ZSBzdHJ1Y3R1cmUncyBzaXplIHJpZ2h0IG5vdyAoaS5lLiBpdCB3b3VsZCBvbmx5IGJlIHBvdGVu
dGlhbGx5DQo+IHJlZHVjaW5nIGZ1dHVyZSBncm93dGgpPw0KDQpZZXMsIEknZCBmYWlsZWQgdG8g
bm90ZSB0aGUgJ3Vuc2lnbmVkIGxvbmcnIGFmdGVyd2FyZHMsIGJ1dC4uLg0KDQo+IFRoaXMgd2Fz
IG15IG1haW4gYXJndW1lbnQgYWdhaW5zdCBnb2luZw0KPiB0aGlzIGZ1cnRoZXIgc3RlcDsgbGV0
IG1lIGtub3cgd2hhdCB5b3UgdGhpbmsuDQo+IA0KDQpJIHN0aWxsIHRoaW5rIGEgcHJlLWVtcHRp
dmUgc3F1YXNoIGludG8gYSB1aW50OF90IGJpdC1maWVsZCBmb2xsb3dlZCBieSB0aGUgZGV2aWNl
X2ZsYWdzIGZpZWxkIHdvdWxkIGdpdmUgdGhlIHN0cnVjdCBhIG5pY2UgMzItYml0IGhvbGUgZm9y
IHBvdGVudGlhbCBmdXR1cmUgdXNlLg0KDQogIFBhdWwNCg0KPiBKYW4NCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QK
WGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5v
cmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
