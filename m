Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CB46BED98
	for <lists+xen-devel@lfdr.de>; Thu, 26 Sep 2019 10:42:03 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iDPJ6-0004x7-Cn; Thu, 26 Sep 2019 08:39:24 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=8zHT=XV=citrix.com=paul.durrant@srs-us1.protection.inumbo.net>)
 id 1iDPJ5-0004x2-5g
 for xen-devel@lists.xenproject.org; Thu, 26 Sep 2019 08:39:23 +0000
X-Inumbo-ID: 231c9a62-e039-11e9-bf31-bc764e2007e4
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by localhost (Halon) with ESMTPS
 id 231c9a62-e039-11e9-bf31-bc764e2007e4;
 Thu, 26 Sep 2019 08:39:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1569487161;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=mfxktgEmzjKC4WHg7+E1g2e9qG+6tGsFaVGHiMb+k4E=;
 b=cScXAiThayXCyWZezbosz0nBwq9cyWfVE/KJb532D3P86dp/GsMnfXVV
 Qdr4bAwSXBFRsYOWMqGuG+Q3trHhuMmnVneYjopRugkXrPUYMyufS+bjM
 tZcF955pqaktIGK/GxDeVRHHCt7v/hevaVAkmO1rnOpv0klEagPTyy1S7 w=;
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
IronPort-SDR: Bj+VDNLfH7P1vP8VrUZeinGLQNGn4oDGbCScv77qvSRg5FHWcVxs0rEr9ZjHCsYxKM+6RaZ+dN
 vhOhZuq1I6ZgS+IVm6H0Ps4EqrMPrwNdZ8oFVzypxGC3EwhtHaUy7Slhfl+RZE3LGjjV6mb4Bs
 xoz0/fiVwqYgYyMF3dNjFwjtdyo+kx3OycVc/uE0iz2KKoauN3IzHuQ036bOYtmzyiC4ldtWg3
 QiYbBobcsg04YCY27Mj0KcQ1HFwnOjY9xaSO7rdF0p7NGOBMiBx0TTfNQ3A6dmWt5i/Zfm13I+
 vXE=
X-SBRS: 2.7
X-MesageID: 6329746
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,551,1559534400"; 
   d="scan'208";a="6329746"
From: Paul Durrant <Paul.Durrant@citrix.com>
To: 'Julien Grall' <Julien.Grall@arm.com>, 'Oleksandr' <olekstysh@gmail.com>, 
 'Jan Beulich' <jbeulich@suse.com>
Thread-Topic: [Xen-devel] [PATCH v13 0/4] add per-domain IOMMU control
Thread-Index: AQHVbg2Z91+gZvcE2UG2jzrPcpRppKc8HWgw///hpgCAACJVgIAAUp0AgAAmyFCAADmZgIAA2Ukw
Date: Thu, 26 Sep 2019 08:39:17 +0000
Message-ID: <3c719420dabd4cc1860f0d687cdc3f78@AMSPEX02CL03.citrite.net>
References: <20190918104113.3294-1-paul.durrant@citrix.com>
 <013c45a9490e413cb97abb02cef960bc@AMSPEX02CL03.citrite.net>
 <dcfdf2ab-8c64-ee63-637f-b0517087e8b5@suse.com>
 <23dec58404634921a595653f8a5ea504@AMSPEX02CL03.citrite.net>
 <7d50ae35-2642-7fe5-89c7-c4ee09f263d0@gmail.com>
 <94de3adfac564f8e920bd04b3cf54734@AMSPEX02CL03.citrite.net>
 <7f18c7f3-1d25-6d24-b44b-27cf77163eec@arm.com>
In-Reply-To: <7f18c7f3-1d25-6d24-b44b-27cf77163eec@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH v13 0/4] add per-domain IOMMU control
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
Cc: Petre Pircalabu <ppircalabu@bitdefender.com>, Stefano
 Stabellini <sstabellini@kernel.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Wei Liu <wl@xen.org>, KonradRzeszutek
 Wilk <konrad.wilk@oracle.com>, Andrew Cooper <Andrew.Cooper3@citrix.com>,
 "Tim \(Xen.org\)" <tim@xen.org>, George Dunlap <George.Dunlap@citrix.com>,
 Tamas K Lengyel <tamas@tklengyel.com>, David Scott <dave@recoil.org>,
 Anthony Perard <anthony.perard@citrix.com>, Ian
 Jackson <Ian.Jackson@citrix.com>, nd <nd@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBKdWxpZW4gR3JhbGwgPEp1bGll
bi5HcmFsbEBhcm0uY29tPg0KPiBTZW50OiAyNSBTZXB0ZW1iZXIgMjAxOSAyMjozNA0KPiBUbzog
UGF1bCBEdXJyYW50IDxQYXVsLkR1cnJhbnRAY2l0cml4LmNvbT47ICdPbGVrc2FuZHInIDxvbGVr
c3R5c2hAZ21haWwuY29tPjsgJ0phbiBCZXVsaWNoJw0KPiA8amJldWxpY2hAc3VzZS5jb20+DQo+
IENjOiBuZCA8bmRAYXJtLmNvbT47IFBldHJlIFBpcmNhbGFidSA8cHBpcmNhbGFidUBiaXRkZWZl
bmRlci5jb20+OyBTdGVmYW5vIFN0YWJlbGxpbmkNCj4gPHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc+
OyBXZWkgTGl1IDx3bEB4ZW4ub3JnPjsgS29ucmFkUnplc3p1dGVrIFdpbGsgPGtvbnJhZC53aWxr
QG9yYWNsZS5jb20+OyBBbmRyZXcNCj4gQ29vcGVyIDxBbmRyZXcuQ29vcGVyM0BjaXRyaXguY29t
PjsgRGF2aWQgU2NvdHQgPGRhdmVAcmVjb2lsLm9yZz47IFRpbSAoWGVuLm9yZykgPHRpbUB4ZW4u
b3JnPjsgR2VvcmdlDQo+IER1bmxhcCA8R2VvcmdlLkR1bmxhcEBjaXRyaXguY29tPjsgVGFtYXMg
SyBMZW5neWVsIDx0YW1hc0B0a2xlbmd5ZWwuY29tPjsgSWFuIEphY2tzb24NCj4gPElhbi5KYWNr
c29uQGNpdHJpeC5jb20+OyBBbnRob255IFBlcmFyZCA8YW50aG9ueS5wZXJhcmRAY2l0cml4LmNv
bT47IHhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZzsNCj4gVm9sb2R5bXlyIEJhYmNodWsg
PFZvbG9keW15cl9CYWJjaHVrQGVwYW0uY29tPjsgUm9nZXIgUGF1IE1vbm5lIDxyb2dlci5wYXVA
Y2l0cml4LmNvbT4NCj4gU3ViamVjdDogUmU6IFtYZW4tZGV2ZWxdIFtQQVRDSCB2MTMgMC80XSBh
ZGQgcGVyLWRvbWFpbiBJT01NVSBjb250cm9sDQo+IA0KPiBIaSwNCj4gDQo+IE9uIDI1LzA5LzIw
MTkgMTc6MTAsIFBhdWwgRHVycmFudCB3cm90ZToNCj4gPj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdl
LS0tLS0NCj4gPj4gRnJvbTogT2xla3NhbmRyIDxvbGVrc3R5c2hAZ21haWwuY29tPg0KPiA+PiBT
ZW50OiAyNSBTZXB0ZW1iZXIgMjAxOSAxNjo1MA0KPiA+PiBUbzogUGF1bCBEdXJyYW50IDxQYXVs
LkR1cnJhbnRAY2l0cml4LmNvbT47ICdKYW4gQmV1bGljaCcgPGpiZXVsaWNoQHN1c2UuY29tPg0K
PiA+PiBDYzogUGV0cmUgUGlyY2FsYWJ1IDxwcGlyY2FsYWJ1QGJpdGRlZmVuZGVyLmNvbT47IFN0
ZWZhbm8gU3RhYmVsbGluaSA8c3N0YWJlbGxpbmlAa2VybmVsLm9yZz47IFdlaQ0KPiBMaXUNCj4g
Pj4gPHdsQHhlbi5vcmc+OyBLb25yYWRSemVzenV0ZWsgV2lsayA8a29ucmFkLndpbGtAb3JhY2xl
LmNvbT47IEFuZHJldyBDb29wZXINCj4gPj4gPEFuZHJldy5Db29wZXIzQGNpdHJpeC5jb20+OyBE
YXZpZCBTY290dCA8ZGF2ZUByZWNvaWwub3JnPjsgVGltIChYZW4ub3JnKSA8dGltQHhlbi5vcmc+
OyBHZW9yZ2UNCj4gRHVubGFwDQo+ID4+IDxHZW9yZ2UuRHVubGFwQGNpdHJpeC5jb20+OyBUYW1h
cyBLIExlbmd5ZWwgPHRhbWFzQHRrbGVuZ3llbC5jb20+OyBJYW4gSmFja3Nvbg0KPiA+PiA8SWFu
LkphY2tzb25AY2l0cml4LmNvbT47IEFudGhvbnkgUGVyYXJkIDxhbnRob255LnBlcmFyZEBjaXRy
aXguY29tPjsgeGVuLQ0KPiBkZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZzsNCj4gPj4gVm9sb2R5
bXlyIEJhYmNodWsgPFZvbG9keW15cl9CYWJjaHVrQGVwYW0uY29tPjsgUm9nZXIgUGF1IE1vbm5l
IDxyb2dlci5wYXVAY2l0cml4LmNvbT47IEp1bGllbg0KPiBHcmFsbA0KPiA+PiA8anVsaWVuLmdy
YWxsQGFybS5jb20+DQo+ID4+IFN1YmplY3Q6IFJlOiBbWGVuLWRldmVsXSBbUEFUQ0ggdjEzIDAv
NF0gYWRkIHBlci1kb21haW4gSU9NTVUgY29udHJvbA0KPiA+Pg0KPiA+Pg0KPiA+PiBbQ0MgSnVs
aWVuXQ0KPiA+Pg0KPiA+Pg0KPiA+PiBIaSBQYXVsDQo+ID4+DQo+ID4+IEkgbWF5IG1pc3Rha2Us
IGJ1dCBsb29rcyBsaWtlDQo+ID4+DQo+ID4+IDgwZmYzZDMzOGRjOTMyNjBiNDFmZmVlZWJiMGY4
NTJjMmVkZWY5Y2UgaW9tbXU6IHRpZHkgdXANCj4gPj4gaW9tbXVfdXNlX2hhcF9wdCgpIGFuZCBu
ZWVkX2lvbW11X3B0X3N5bmMoKSBtYWNyb3MNCj4gPj4NCj4gPj4gdHJpZ2dlcnMgQVNTRVJUX1VO
UkVBQ0hBQkxFIG9uIEFybSBpZiBubyBJT01NVSBoYXMgYmVlbiBmb3VuZCAoSSBidWlsdA0KPiA+
PiB3aXRoIG15IHBsYXRmb3JtJ3MgSU9NTVUgZHJpdmVyIGRpc2FibGVkOiAjIENPTkZJR19JUE1N
VV9WTVNBIGlzIG5vdCBzZXQpIC4NCj4gPj4NCj4gPj4gU28sIGlvbW11X3NldHVwKCkgY2FsbHMg
Y2xlYXJfaW9tbXVfaGFwX3B0X3NoYXJlKCkgd2l0aA0KPiA+PiBpb21tdV9oYXBfcHRfc2hhcmUg
YmVpbmcgc2V0IChDT05GSUdfSU9NTVVfRk9SQ0VfUFRfU0hBUkU9eSkgd2hpY2gsDQo+ID4+IGFj
dHVhbGx5LCB0cmlnZ2VycyBBU1NFUlQuDQo+ID4+DQo+ID4NCj4gPiBIZXJlIGEgbWluaW1hbCBw
YXRjaCwgbGVhdmluZyAnZm9yY2UgcHQgc2hhcmUnIGluIHBsYWNlLiBEb2VzIHRoaXMgYXZvaWQg
dGhlIHByb2JsZW0/DQo+ID4NCj4gPiAtLS04PC0tLQ0KPiA+IGRpZmYgLS1naXQgYS94ZW4vY29t
bW9uL3N5c2N0bC5jIGIveGVuL2NvbW1vbi9zeXNjdGwuYw0KPiA+IGluZGV4IGU4NzYzYzdmZGYu
LmY4OGEyODVlN2YgMTAwNjQ0DQo+ID4gLS0tIGEveGVuL2NvbW1vbi9zeXNjdGwuYw0KPiA+ICsr
KyBiL3hlbi9jb21tb24vc3lzY3RsLmMNCj4gPiBAQCAtMjY4LDkgKzI2OCwxMSBAQCBsb25nIGRv
X3N5c2N0bChYRU5fR1VFU1RfSEFORExFX1BBUkFNKHhlbl9zeXNjdGxfdCkgdV9zeXNjdGwpDQo+
ID4gICAgICAgICAgIHBpLT5tYXhfbWZuID0gZ2V0X3VwcGVyX21mbl9ib3VuZCgpOw0KPiA+ICAg
ICAgICAgICBhcmNoX2RvX3BoeXNpbmZvKHBpKTsNCj4gPiAgICAgICAgICAgaWYgKCBpb21tdV9l
bmFibGVkICkNCj4gPiArICAgICAgICB7DQo+ID4gICAgICAgICAgICAgICBwaS0+Y2FwYWJpbGl0
aWVzIHw9IFhFTl9TWVNDVExfUEhZU0NBUF9kaXJlY3RpbzsNCj4gPiAtICAgICAgICBpZiAoIGlv
bW11X2hhcF9wdF9zaGFyZSApDQo+ID4gLSAgICAgICAgICAgIHBpLT5jYXBhYmlsaXRpZXMgfD0g
WEVOX1NZU0NUTF9QSFlTQ0FQX2lvbW11X2hhcF9wdF9zaGFyZTsNCj4gPiArICAgICAgICAgICAg
aWYgKCBpb21tdV9oYXBfcHRfc2hhcmUgKQ0KPiA+ICsgICAgICAgICAgICAgICAgcGktPmNhcGFi
aWxpdGllcyB8PSBYRU5fU1lTQ1RMX1BIWVNDQVBfaW9tbXVfaGFwX3B0X3NoYXJlOw0KPiA+ICsg
ICAgICAgIH0NCj4gPg0KPiA+ICAgICAgICAgICBpZiAoIGNvcHlfdG9fZ3Vlc3QodV9zeXNjdGws
IG9wLCAxKSApDQo+ID4gICAgICAgICAgICAgICByZXQgPSAtRUZBVUxUOw0KPiA+IGRpZmYgLS1n
aXQgYS94ZW4vaW5jbHVkZS94ZW4vaW9tbXUuaCBiL3hlbi9pbmNsdWRlL3hlbi9pb21tdS5oDQo+
ID4gaW5kZXggN2MzMDAzZjNmMS4uNmExMGEyNDEyOCAxMDA2NDQNCj4gPiAtLS0gYS94ZW4vaW5j
bHVkZS94ZW4vaW9tbXUuaA0KPiA+ICsrKyBiL3hlbi9pbmNsdWRlL3hlbi9pb21tdS5oDQo+ID4g
QEAgLTY4LDggKzY4LDYgQEAgc3RhdGljIGlubGluZSB2b2lkIGNsZWFyX2lvbW11X2hhcF9wdF9z
aGFyZSh2b2lkKQ0KPiA+ICAgew0KPiA+ICAgI2lmbmRlZiBpb21tdV9oYXBfcHRfc2hhcmUNCj4g
PiAgICAgICBpb21tdV9oYXBfcHRfc2hhcmUgPSBmYWxzZTsNCj4gPiAtI2VsaWYgaW9tbXVfaGFw
X3B0X3NoYXJlDQo+ID4gLSAgICBBU1NFUlRfVU5SRUFDSEFCTEUoKTsNCj4gPiAgICNlbmRpZg0K
PiANCj4gSUhNTywgY2FsbGluZyB0aGlzIGZ1bmN0aW9uIGlzIGEgbWlzdGFrZSBvbiBwbGF0Zm9y
bSBvbmx5IHN1cHBvcnRpbmcNCj4gc2hhcmVkIHBhZ2UtdGFibGUgc28gdGhlIEFTU0VSVCgpIHNo
b3VsZCBiZSBrZXB0IGhlcmUuDQo+IA0KPiBUaGlzIHJhaXNlcyB0aGUgcXVlc3Rpb24gd2h5IHRo
ZSBmdW5jdGlvbiBpcyBhY3R1YWxseSBjYWxsZWQgZnJvbSBjb21tb24NCj4gY29kZS4gaW9tbXVf
aGFwX2VuYWJsZWQoKSBzaG91bGQgdGVjaG5pY2FsbHkgbm90IGJlIHVzZWQgaW4gYW55IGNvZGUg
aWYNCj4gdGhlIElPTU1VIGlzIG5vdCBlbmFibGVkL3ByZXNlbnQuIFNvIHdoYXQgYXJlIHlvdSB0
cnlpbmcgdG8gcHJldmVudCBoZXJlPw0KDQpXaGF0IEknbSB0cnlpbmcgdG8gcHJldmVudCwgb24g
eDg2LCBpcyBhIHNpdHVhdGlvbiB3aGVyZSB0aGUgaW9tbXVfZW5hYmxlZCA9PSBmYWxzZSBidXQg
aW9tbXVfaGFwX3B0X3NoYXJlID09IHRydWUuIEkgaGFkLCBtaXN0YWtlbmx5LCBiZWxpZXZlZCB0
aGF0IGlvbW11X2VuYWJsZWQgd291bGQgbmV2ZXIgYmUgZmFsc2UgZm9yIEFSTSBidXQgaXQgc2Vl
bXMgdGhpcyBpcyBub3QgdGhlIGNhc2Ugc28gdGhhdCBzaXR1YXRpb24gaGFzIHRvIGJlIHRvbGVy
YXRlZC4gSSBndWVzcywgZ2l2ZW4gdGhlIG90aGVyIGh1bmsgb2YgbXkgcGF0Y2gsIEkgY2FuIGFj
dHVhbGx5IGxlYXZlIHRoZSBBU1NFUlQgaW4gcGxhY2UgYW5kIGF2b2lkIG1ha2luZyB0aGUgY2Fs
bCBmcm9tIGNvbW1vbiBjb2RlLCBpbiB3aGljaCBjYXNlIHRoZSBmdW5jdGlvbiBvdWdodCB0byBt
b3ZlIGludG8gYW4geDg2IGhlYWRlciBhcyB3ZWxsLg0KDQogIFBhdWwNCg0KPiANCj4gQ2hlZXJz
LA0KPiANCj4gLS0NCj4gSnVsaWVuIEdyYWxsDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0
cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlz
dGluZm8veGVuLWRldmVs
