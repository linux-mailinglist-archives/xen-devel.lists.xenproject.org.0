Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B4ACFBE1F0
	for <lists+xen-devel@lfdr.de>; Wed, 25 Sep 2019 18:07:26 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iD9mp-00058W-1m; Wed, 25 Sep 2019 16:05:03 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=6irf=XU=citrix.com=paul.durrant@srs-us1.protection.inumbo.net>)
 id 1iD9mm-00058O-W1
 for xen-devel@lists.xenproject.org; Wed, 25 Sep 2019 16:05:01 +0000
X-Inumbo-ID: 397692f8-dfae-11e9-bf31-bc764e2007e4
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by localhost (Halon) with ESMTPS
 id 397692f8-dfae-11e9-bf31-bc764e2007e4;
 Wed, 25 Sep 2019 16:04:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1569427499;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=BmwrIB377t1t9+GZYgC6TCkdX6r0sa50MQXJth4tLds=;
 b=c1LRaQRNAZNtY3XcjmMuN/OhD35Nckntqvq9jydsiMOTbjYSo+ogrwd2
 Ogejmz4qNXjcsB0qsfUImgyrWdHJYhLRYPHzE2ASjGOXh8ZNZvjfK0uIu
 To5lisQa40pioGqbbwqhs/AEjVrmcZ0BKDQl3etK+/bowYNTjx5eqcWmU s=;
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
IronPort-SDR: gDAKgbnzVJVde/hb+rLU3vFBZMEdTzuhMnc1uoV4Dj9E3L5+q0IuoLlGyhrydMUWXUYyQVRSif
 CklXsw2yKwF19XiyJVAuRPlhtbVOQt6zLirUscJ+qSGXpWu/Z+mX7xhFEs4ESfBVYzZC4u86ch
 lSfcfZ9ggUj0+3Tj9NsQp/iGOwL1b8ZnGpYgRIp/uDGBCibgQK1vhgq3VvrcNnOw3seckXHbcr
 7vBcESlIKFMImfIMNU+PKxfXh/YB8pxjA4QHH5ipxAJKrJWeVy7vULX47pjqBKusqjJWdko55O
 HWc=
X-SBRS: 2.7
X-MesageID: 6331532
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,548,1559534400"; 
   d="scan'208";a="6331532"
From: Paul Durrant <Paul.Durrant@citrix.com>
To: 'Oleksandr' <olekstysh@gmail.com>, 'Jan Beulich' <jbeulich@suse.com>
Thread-Topic: [Xen-devel] [PATCH v13 0/4] add per-domain IOMMU control
Thread-Index: AQHVbg2Z91+gZvcE2UG2jzrPcpRppKc8HWgw///hpgCAACJVgIAAUp0AgAAlHRCAAACbkA==
Date: Wed, 25 Sep 2019 16:04:54 +0000
Message-ID: <82680bb6ca8e431aa41eb70591a37a4f@AMSPEX02CL03.citrite.net>
References: <20190918104113.3294-1-paul.durrant@citrix.com>
 <013c45a9490e413cb97abb02cef960bc@AMSPEX02CL03.citrite.net>
 <dcfdf2ab-8c64-ee63-637f-b0517087e8b5@suse.com>
 <23dec58404634921a595653f8a5ea504@AMSPEX02CL03.citrite.net>
 <7d50ae35-2642-7fe5-89c7-c4ee09f263d0@gmail.com>
 <89a30cb9c1374a5e884804196498400d@AMSPEX02CL03.citrite.net>
In-Reply-To: <89a30cb9c1374a5e884804196498400d@AMSPEX02CL03.citrite.net>
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
Cc: 'Petre Pircalabu' <ppircalabu@bitdefender.com>,
 'Stefano Stabellini' <sstabellini@kernel.org>,
 "'xen-devel@lists.xenproject.org'" <xen-devel@lists.xenproject.org>,
 'Wei Liu' <wl@xen.org>, 'KonradRzeszutek Wilk' <konrad.wilk@oracle.com>,
 Andrew Cooper <Andrew.Cooper3@citrix.com>, "Tim \(Xen.org\)" <tim@xen.org>,
 George Dunlap <George.Dunlap@citrix.com>,
 'Julien Grall' <julien.grall@arm.com>, 'Tamas K Lengyel' <tamas@tklengyel.com>,
 'David
 Scott' <dave@recoil.org>, Anthony Perard <anthony.perard@citrix.com>, Ian
 Jackson <Ian.Jackson@citrix.com>,
 'Volodymyr Babchuk' <Volodymyr_Babchuk@epam.com>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBQYXVsIER1cnJhbnQNCj4gU2Vu
dDogMjUgU2VwdGVtYmVyIDIwMTkgMTc6MDQNCj4gVG86ICdPbGVrc2FuZHInIDxvbGVrc3R5c2hA
Z21haWwuY29tPjsgJ0phbiBCZXVsaWNoJyA8amJldWxpY2hAc3VzZS5jb20+DQo+IENjOiBQZXRy
ZSBQaXJjYWxhYnUgPHBwaXJjYWxhYnVAYml0ZGVmZW5kZXIuY29tPjsgU3RlZmFubyBTdGFiZWxs
aW5pIDxzc3RhYmVsbGluaUBrZXJuZWwub3JnPjsgV2VpIExpdQ0KPiA8d2xAeGVuLm9yZz47IEtv
bnJhZFJ6ZXN6dXRlayBXaWxrIDxrb25yYWQud2lsa0BvcmFjbGUuY29tPjsgQW5kcmV3IENvb3Bl
cg0KPiA8QW5kcmV3LkNvb3BlcjNAY2l0cml4LmNvbT47IERhdmlkIFNjb3R0IDxkYXZlQHJlY29p
bC5vcmc+OyBUaW0gKFhlbi5vcmcpIDx0aW1AeGVuLm9yZz47IEdlb3JnZSBEdW5sYXANCj4gPEdl
b3JnZS5EdW5sYXBAY2l0cml4LmNvbT47IFRhbWFzIEsgTGVuZ3llbCA8dGFtYXNAdGtsZW5neWVs
LmNvbT47IElhbiBKYWNrc29uDQo+IDxJYW4uSmFja3NvbkBjaXRyaXguY29tPjsgQW50aG9ueSBQ
ZXJhcmQgPGFudGhvbnkucGVyYXJkQGNpdHJpeC5jb20+OyB4ZW4tZGV2ZWxAbGlzdHMueGVucHJv
amVjdC5vcmc7DQo+IFZvbG9keW15ciBCYWJjaHVrIDxWb2xvZHlteXJfQmFiY2h1a0BlcGFtLmNv
bT47IFJvZ2VyIFBhdSBNb25uZSA8cm9nZXIucGF1QGNpdHJpeC5jb20+OyBKdWxpZW4gR3JhbGwN
Cj4gPGp1bGllbi5ncmFsbEBhcm0uY29tPg0KPiBTdWJqZWN0OiBSRTogW1hlbi1kZXZlbF0gW1BB
VENIIHYxMyAwLzRdIGFkZCBwZXItZG9tYWluIElPTU1VIGNvbnRyb2wNCj4gDQo+ID4gLS0tLS1P
cmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gPiBGcm9tOiBPbGVrc2FuZHIgPG9sZWtzdHlzaEBnbWFp
bC5jb20+DQo+ID4gU2VudDogMjUgU2VwdGVtYmVyIDIwMTkgMTY6NTANCj4gPiBUbzogUGF1bCBE
dXJyYW50IDxQYXVsLkR1cnJhbnRAY2l0cml4LmNvbT47ICdKYW4gQmV1bGljaCcgPGpiZXVsaWNo
QHN1c2UuY29tPg0KPiA+IENjOiBQZXRyZSBQaXJjYWxhYnUgPHBwaXJjYWxhYnVAYml0ZGVmZW5k
ZXIuY29tPjsgU3RlZmFubyBTdGFiZWxsaW5pIDxzc3RhYmVsbGluaUBrZXJuZWwub3JnPjsgV2Vp
DQo+IExpdQ0KPiA+IDx3bEB4ZW4ub3JnPjsgS29ucmFkUnplc3p1dGVrIFdpbGsgPGtvbnJhZC53
aWxrQG9yYWNsZS5jb20+OyBBbmRyZXcgQ29vcGVyDQo+ID4gPEFuZHJldy5Db29wZXIzQGNpdHJp
eC5jb20+OyBEYXZpZCBTY290dCA8ZGF2ZUByZWNvaWwub3JnPjsgVGltIChYZW4ub3JnKSA8dGlt
QHhlbi5vcmc+OyBHZW9yZ2UNCj4gRHVubGFwDQo+ID4gPEdlb3JnZS5EdW5sYXBAY2l0cml4LmNv
bT47IFRhbWFzIEsgTGVuZ3llbCA8dGFtYXNAdGtsZW5neWVsLmNvbT47IElhbiBKYWNrc29uDQo+
ID4gPElhbi5KYWNrc29uQGNpdHJpeC5jb20+OyBBbnRob255IFBlcmFyZCA8YW50aG9ueS5wZXJh
cmRAY2l0cml4LmNvbT47IHhlbi0NCj4gZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmc7DQo+ID4g
Vm9sb2R5bXlyIEJhYmNodWsgPFZvbG9keW15cl9CYWJjaHVrQGVwYW0uY29tPjsgUm9nZXIgUGF1
IE1vbm5lIDxyb2dlci5wYXVAY2l0cml4LmNvbT47IEp1bGllbiBHcmFsbA0KPiA+IDxqdWxpZW4u
Z3JhbGxAYXJtLmNvbT4NCj4gPiBTdWJqZWN0OiBSZTogW1hlbi1kZXZlbF0gW1BBVENIIHYxMyAw
LzRdIGFkZCBwZXItZG9tYWluIElPTU1VIGNvbnRyb2wNCj4gPg0KPiA+DQo+ID4gW0NDIEp1bGll
bl0NCj4gPg0KPiA+DQo+ID4gSGkgUGF1bA0KPiA+DQo+ID4gSSBtYXkgbWlzdGFrZSwgYnV0IGxv
b2tzIGxpa2UNCj4gPg0KPiA+IDgwZmYzZDMzOGRjOTMyNjBiNDFmZmVlZWJiMGY4NTJjMmVkZWY5
Y2UgaW9tbXU6IHRpZHkgdXANCj4gPiBpb21tdV91c2VfaGFwX3B0KCkgYW5kIG5lZWRfaW9tbXVf
cHRfc3luYygpIG1hY3Jvcw0KPiA+DQo+ID4gdHJpZ2dlcnMgQVNTRVJUX1VOUkVBQ0hBQkxFIG9u
IEFybSBpZiBubyBJT01NVSBoYXMgYmVlbiBmb3VuZCAoSSBidWlsdA0KPiA+IHdpdGggbXkgcGxh
dGZvcm0ncyBJT01NVSBkcml2ZXIgZGlzYWJsZWQ6ICMgQ09ORklHX0lQTU1VX1ZNU0EgaXMgbm90
IHNldCkgLg0KPiA+DQo+ID4gU28sIGlvbW11X3NldHVwKCkgY2FsbHMgY2xlYXJfaW9tbXVfaGFw
X3B0X3NoYXJlKCkgd2l0aA0KPiA+IGlvbW11X2hhcF9wdF9zaGFyZSBiZWluZyBzZXQgKENPTkZJ
R19JT01NVV9GT1JDRV9QVF9TSEFSRT15KSB3aGljaCwNCj4gPiBhY3R1YWxseSwgdHJpZ2dlcnMg
QVNTRVJULg0KPiANCj4gQlRXLCBJIGFzc3VtZSBkaXNhYmxpbmcgdGhlIGlvbW11IG9uIHRoZSB4
ZW4gY29tbWFuZCBsaWtlIHdpbGwgd29yayByb3VuZCB0aGUgaXNzdWU/DQoNCkFjdHVhbGx5LCBu
bywgdGhhdCB3b3VsZCBiZSBubyBnb29kIGVpdGhlci4NCg0KICBQYXVsDQoNCj4gDQo+ICAgUGF1
bA0KPiANCj4gPg0KPiA+IC4uLg0KPiA+DQo+ID4NCj4gPiAoWEVOKSBBc3NlcnRpb24gJ3VucmVh
Y2hhYmxlJyBmYWlsZWQgYXQNCj4gPiAuLi5pbGQtd29ya3NwYWNlL2J1aWxkL3hlbi94ZW4vaW5j
bHVkZS94ZW4vaW9tbXUuaDo3Mg0KPiA+IChYRU4pIC0tLS1bIFhlbi00LjEzLXVuc3RhYmxlwqAg
YXJtNjTCoCBkZWJ1Zz15wqDCoCBOb3QgdGFpbnRlZCBdLS0tLQ0KPiA+IChYRU4pIENQVTrCoMKg
wqAgMA0KPiA+IChYRU4pIFBDOsKgwqDCoMKgIDAwMDAwMDAwMDAyYjNhZTAgaW9tbXVfc2V0dXAr
MHhhMC8weDE4Yw0KPiA+IChYRU4pIExSOsKgwqDCoMKgIDAwMDAwMDAwMDAyYjNhOGMNCj4gPiAo
WEVOKSBTUDrCoMKgwqDCoCAwMDAwMDAwMDAwMmY3ZGMwDQo+ID4gKFhFTikgQ1BTUjrCoMKgIGEw
MDAwMjQ5IE1PREU6NjQtYml0IEVMMmggKEh5cGVydmlzb3IsIGhhbmRsZXIpDQo+ID4gKFhFTinC
oMKgwqDCoMKgIFgwOiAwMDAwMDAwMDAwMmE3MDAwwqAgWDE6IDAwMDAwMDAwMDAwMDAwMDDCoCBY
MjogMmM3MzYxNzM2NTZlNjU3Mg0KPiA+IChYRU4pwqDCoMKgwqDCoCBYMzogMDAwMDAwMDAwMDAw
MDAwMsKgIFg0OiAwMDAwMDAwMDAwMDAwMDAxwqAgWDU6IDAwMDAwMDAwMDAwMDAwMDANCj4gPiAo
WEVOKcKgwqDCoMKgwqAgWDY6IDAwMDAwMDAwMDAwMDAwODDCoCBYNzogMmI3MjYwNzI2NDZkNjQ3
McKgIFg4OiA3ZjdmN2Y3ZjdmN2Y3ZjdmDQo+ID4gKFhFTinCoMKgwqDCoMKgIFg5OiBmZjY1Njg1
ZTZjNmY3Mjc1IFgxMDogN2Y3ZjdmN2Y3ZjdmN2Y3ZiBYMTE6IDAxMDEwMTAxMDEwMTAxMDENCj4g
PiAoWEVOKcKgwqDCoMKgIFgxMjogMDAwMDAwMDAwMDAwMDAzOCBYMTM6IDAwMDAwMDAwMDAyODA5
MTAgWDE0OiAwMDAwMDAwMDAwMDAwMDIwDQo+ID4gKFhFTinCoMKgwqDCoCBYMTU6IDAwMDAwMDAw
MDAwMDAwMDAgWDE2OiAwMDAwMDAwMDAwMmE3MDAwIFgxNzogMDAwMDAwMDAwMDJhNzAwMA0KPiA+
IChYRU4pwqDCoMKgwqAgWDE4OiAwMDAwMDAwMDAwMmE3MDAwIFgxOTogMDAwMDAwMDAwMDAwMDAw
MCBYMjA6IDAwMDAwMDAwZmZmZmZmZWQNCj4gPiAoWEVOKcKgwqDCoMKgIFgyMTogMDAwMDAwMDAw
MDJhNjM4MCBYMjI6IDAwMDAwMDAwMDAzMzU0MzAgWDIzOiAwMDAwMDAwMDAwMDAwMDAyDQo+ID4g
KFhFTinCoMKgwqDCoCBYMjQ6IDAwMDAwMDAwMDAyOWIxZjAgWDI1OiAwMDAwMDAwMDAwMmQ4M2Qw
IFgyNjogMDAwMDAwMDA0ODAwMDAwMA0KPiA+IChYRU4pwqDCoMKgwqAgWDI3OiAwMDAwMDAwMGMw
MDAwMDAwIFgyODogMDAwMDAwMDAwMDAwMDAwMcKgIEZQOiAwMDAwMDAwMDAwMmY3ZGMwDQo+ID4g
KFhFTikNCj4gPiAoWEVOKcKgwqAgVlRDUl9FTDI6IDgwMDAwMDAwDQo+ID4gKFhFTinCoCBWVFRC
Ul9FTDI6IDAwMDAwMDAwMDAwMDAwMDANCj4gPiAoWEVOKQ0KPiA+IChYRU4pwqAgU0NUTFJfRUwy
OiAzMGNkMTgzZA0KPiA+IChYRU4pwqDCoMKgIEhDUl9FTDI6IDAwMDAwMDAwMDAwMDAwMzgNCj4g
PiAoWEVOKcKgIFRUQlIwX0VMMjogMDAwMDAwMDA3ODFiNDAwMA0KPiA+IChYRU4pDQo+ID4gKFhF
TinCoMKgwqAgRVNSX0VMMjogZjIwMDAwMDENCj4gPiAoWEVOKcKgIEhQRkFSX0VMMjogMDAwMDAw
MDAwMDAwMDAwMA0KPiA+IChYRU4pwqDCoMKgIEZBUl9FTDI6IDAwMDAwMDAwMDAwMDAwMDANCj4g
PiAoWEVOKQ0KPiA+IChYRU4pIFhlbiBzdGFjayB0cmFjZSBmcm9tIHNwPTAwMDAwMDAwMDAyZjdk
YzA6DQo+ID4gKFhFTinCoMKgwqAgMDAwMDAwMDAwMDJmN2RlMCAwMDAwMDAwMDAwMmJkZDk0IDAw
MDAwMDAwMDAwMDAwMDIgMDAwMDAwMDAwMDAwMDAwMg0KPiA+IChYRU4pwqDCoMKgIDAwMDAwMDAw
YmZlMGI2NjAgMDAwMDAwMDAwMDIwMDFiNCAwMDAwMDAwMDc4MDgwMDAwIDAwMDAwMDAwNzdlODAw
MDANCj4gPiAoWEVOKcKgwqDCoCAwMDAwMDAwMDQ4MDAwMDAwIDAwMDAwMDAwMDAwMDAwMDAgMDAw
MDAwMDAwMDQwMDAwMCAwMDAwMDAwMDAwMDAwMDAzDQo+ID4gKFhFTinCoMKgwqAgMDAwMDAwMDAw
MDAwMDAwMSAwMDAwMDAwMDAwMDAwMDAwIDAwMDAwMDAwNzgwODAwMDAgMDAwMDAwMDA0ODA4MDA0
MA0KPiA+IChYRU4pwqDCoMKgIDAwMDAwMDAwMDAwMDAwMDAgMDAwMDAwMDAwMDAwZjA4MCAwMDAw
MDAwMDQ4MDAwMDAwIDAwMDAwMDAwNzgwMDAwMDANCj4gPiAoWEVOKcKgwqDCoCAwMDAwMDAwMDAw
MmQ4M2MwIDAwMDAwMDAwMDAyYWE0NDAgMDAwMDAwMDAwMDAwMDAwMCAwMDAwMDAwMDAwMDAwMDAw
DQo+ID4gKFhFTinCoMKgwqAgMDAwMDAwMDAwMDAwMDAwMCAwMDAwMDAwMzAwMDAwMDAwIDAwMDAw
MDAwMDAwMDAwMDAgMDAwMDAwNDBmZmZmZmZmZg0KPiA+IChYRU4pwqDCoMKgIDAwMDAwMDAwMDAw
MDA0MDAgMDAwMDAwMDAwMDAwMDAwMCAwMDAwMDAwMDAwMDAwMDAwIDAwMDAwMDAwMDAwMDAwMDAN
Cj4gPiAoWEVOKcKgwqDCoCAwMDAwMDAwMDAwMDAwMDAwIDAwMDAwMDAwMDAwMDAwMDAgMDAwMDAw
MDAwMDAwMDAwMCAwMDAwMDAwMDAwMDAwMDAwDQo+ID4gKFhFTinCoMKgwqAgMDAwMDAwMDAwMDAw
MDAwMCAwMDAwMDAwMDAwMDAwMDAwIDAwMDAwMDAwMDAwMDAwMDAgMDAwMDAwMDAwMDAwMDAwMA0K
PiA+IChYRU4pwqDCoMKgIDAwMDAwMDAwMDAwMDAwMDAgMDAwMDAwMDAwMDAwMDAwMCAwMDAwMDAw
MDAwMDAwMDAwIDAwMDAwMDAwMDAwMDAwMDANCj4gPiAoWEVOKcKgwqDCoCAwMDAwMDAwMDAwMDAw
MDAwIDAwMDAwMDAwMDAwMDAwMDAgMDAwMDAwMDAwMDAwMDAwMCAwMDAwMDAwMDAwMDAwMDAwDQo+
ID4gKFhFTinCoMKgwqAgMDAwMDAwMDAwMDAwMDAwMCAwMDAwMDAwMDAwMDAwMDAwIDAwMDAwMDAw
MDAwMDAwMDAgMDAwMDAwMDAwMDAwMDAwMA0KPiA+IChYRU4pwqDCoMKgIDAwMDAwMDAwMDAwMDAw
MDAgMDAwMDAwMDAwMDAwMDAwMCAwMDAwMDAwMDAwMDAwMDAwIDAwMDAwMDAwMDAwMDAwMDANCj4g
PiAoWEVOKcKgwqDCoCAwMDAwMDAwMDAwMDAwMDAwIDAwMDAwMDAwMDAwMDAwMDAgMDAwMDAwMDAw
MDAwMDAwMCAwMDAwMDAwMDAwMDAwMDAwDQo+ID4gKFhFTinCoMKgwqAgMDAwMDAwMDAwMDAwMDAw
MCAwMDAwMDAwMDAwMDAwMDAwIDAwMDAwMDAwMDAwMDAwMDAgMDAwMDAwMDAwMDAwMDAwMA0KPiA+
IChYRU4pwqDCoMKgIDAwMDAwMDAwMDAwMDAwMDAgMDAwMDAwMDAwMDAwMDAwMCAwMDAwMDAwMDAw
MDAwMDAwIDAwMDAwMDAwMDAwMDAwMDANCj4gPiAoWEVOKcKgwqDCoCAwMDAwMDAwMDAwMDAwMDAw
IDAwMDAwMDAwMDAwMDAwMDAgMDAwMDAwMDAwMDAwMDAwMCAwMDAwMDAwMDAwMDAwMDAwDQo+ID4g
KFhFTikgWGVuIGNhbGwgdHJhY2U6DQo+ID4gKFhFTinCoMKgwqAgWzwwMDAwMDAwMDAwMmIzYWUw
Pl0gaW9tbXVfc2V0dXArMHhhMC8weDE4YyAoUEMpDQo+ID4gKFhFTinCoMKgwqAgWzwwMDAwMDAw
MDAwMmIzYThjPl0gaW9tbXVfc2V0dXArMHg0Yy8weDE4YyAoTFIpDQo+ID4gKFhFTinCoMKgwqAg
WzwwMDAwMDAwMDAwMmJkZDk0Pl0gc3RhcnRfeGVuKzB4YWEwLzB4YzdjDQo+ID4gKFhFTinCoMKg
wqAgWzwwMDAwMDAwMDAwMjAwMWI0Pl0gYXJtNjQvaGVhZC5vI3ByaW1hcnlfc3dpdGNoZWQrMHhj
LzB4MmMNCj4gPiAoWEVOKQ0KPiA+IChYRU4pDQo+ID4gKFhFTikgKioqKioqKioqKioqKioqKioq
KioqKioqKioqKioqKioqKioqKioqKg0KPiA+IChYRU4pIFBhbmljIG9uIENQVSAwOg0KPiA+IChY
RU4pIEFzc2VydGlvbiAndW5yZWFjaGFibGUnIGZhaWxlZCBhdA0KPiA+IC4uLmlsZC13b3Jrc3Bh
Y2UvYnVpbGQveGVuL3hlbi9pbmNsdWRlL3hlbi9pb21tdS5oOjcyDQo+ID4gKFhFTikgKioqKioq
KioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKg0KPiA+IChYRU4pDQo+ID4NCj4gPg0K
PiA+IC0tDQo+ID4gUmVnYXJkcywNCj4gPg0KPiA+IE9sZWtzYW5kciBUeXNoY2hlbmtvDQoNCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBt
YWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMu
eGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
