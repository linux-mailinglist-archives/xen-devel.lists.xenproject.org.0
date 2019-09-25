Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CEAD1BE1EA
	for <lists+xen-devel@lfdr.de>; Wed, 25 Sep 2019 18:05:58 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iD9la-00050G-B4; Wed, 25 Sep 2019 16:03:46 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=6irf=XU=citrix.com=paul.durrant@srs-us1.protection.inumbo.net>)
 id 1iD9lZ-00050B-CJ
 for xen-devel@lists.xenproject.org; Wed, 25 Sep 2019 16:03:45 +0000
X-Inumbo-ID: 0a1410bc-dfae-11e9-9637-12813bfff9fa
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by localhost (Halon) with ESMTPS
 id 0a1410bc-dfae-11e9-9637-12813bfff9fa;
 Wed, 25 Sep 2019 16:03:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1569427420;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=nankLBAY5W6nzeF8BHY8FDviITD30+nPRSRtymtjWbg=;
 b=EmVCAjd5u8jyvXKYbZsP/cyIdy31W+Jm1Oas/HpFGBe4VG8jSYtYMyTX
 1b410izTWEhN50ezkz9dh+/6zem7kMJNBZ30tEoG5Rwl0RvfCyQ4J3OQ7
 g7nrmcFhmyV1sLkscohR8qHjiCdHGZjQ+Op2nsTSm72deKIVyElxYDy9P o=;
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
IronPort-SDR: DH/X+0ZE1jS2qUtluBDf/K13SMy2qgxQaT2wQIqa98iLxFfnYPuGgzQkozDczfmsaGiRT7QDpq
 ZyXnHCeKCKoIROIa3FLfiwfr7Yl0zevlRz8ZZY41v/EBKIolFkmjHiSKl346lkiBHPqqFXXIen
 me+9cs8BPZXriHrDPBPIHBt1d9K6ad0Pkk/Voba9R6BGIWnaAqF7KL2MJQFK9WJliRQ0TzJkpJ
 3W/fZ6CtjN3rZyUutMzkJXTYI1cE3SD2gYcKcWckdHkAxbopRYKIekB1EmFJKDTJmchHI5FXkB
 wsA=
X-SBRS: 2.7
X-MesageID: 6058521
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,548,1559534400"; 
   d="scan'208";a="6058521"
From: Paul Durrant <Paul.Durrant@citrix.com>
To: 'Oleksandr' <olekstysh@gmail.com>, 'Jan Beulich' <jbeulich@suse.com>
Thread-Topic: [Xen-devel] [PATCH v13 0/4] add per-domain IOMMU control
Thread-Index: AQHVbg2Z91+gZvcE2UG2jzrPcpRppKc8HWgw///hpgCAACJVgIAAUp0AgAAlHRA=
Date: Wed, 25 Sep 2019 16:03:34 +0000
Message-ID: <89a30cb9c1374a5e884804196498400d@AMSPEX02CL03.citrite.net>
References: <20190918104113.3294-1-paul.durrant@citrix.com>
 <013c45a9490e413cb97abb02cef960bc@AMSPEX02CL03.citrite.net>
 <dcfdf2ab-8c64-ee63-637f-b0517087e8b5@suse.com>
 <23dec58404634921a595653f8a5ea504@AMSPEX02CL03.citrite.net>
 <7d50ae35-2642-7fe5-89c7-c4ee09f263d0@gmail.com>
In-Reply-To: <7d50ae35-2642-7fe5-89c7-c4ee09f263d0@gmail.com>
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
Cc: Petre Pircalabu <ppircalabu@bitdefender.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Wei Liu <wl@xen.org>, KonradRzeszutek Wilk <konrad.wilk@oracle.com>,
 Andrew Cooper <Andrew.Cooper3@citrix.com>, "Tim \(Xen.org\)" <tim@xen.org>,
 George Dunlap <George.Dunlap@citrix.com>, Julien
 Grall <julien.grall@arm.com>, Tamas K Lengyel <tamas@tklengyel.com>, David
 Scott <dave@recoil.org>, Anthony Perard <anthony.perard@citrix.com>, Ian
 Jackson <Ian.Jackson@citrix.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBPbGVrc2FuZHIgPG9sZWtzdHlz
aEBnbWFpbC5jb20+DQo+IFNlbnQ6IDI1IFNlcHRlbWJlciAyMDE5IDE2OjUwDQo+IFRvOiBQYXVs
IER1cnJhbnQgPFBhdWwuRHVycmFudEBjaXRyaXguY29tPjsgJ0phbiBCZXVsaWNoJyA8amJldWxp
Y2hAc3VzZS5jb20+DQo+IENjOiBQZXRyZSBQaXJjYWxhYnUgPHBwaXJjYWxhYnVAYml0ZGVmZW5k
ZXIuY29tPjsgU3RlZmFubyBTdGFiZWxsaW5pIDxzc3RhYmVsbGluaUBrZXJuZWwub3JnPjsgV2Vp
IExpdQ0KPiA8d2xAeGVuLm9yZz47IEtvbnJhZFJ6ZXN6dXRlayBXaWxrIDxrb25yYWQud2lsa0Bv
cmFjbGUuY29tPjsgQW5kcmV3IENvb3Blcg0KPiA8QW5kcmV3LkNvb3BlcjNAY2l0cml4LmNvbT47
IERhdmlkIFNjb3R0IDxkYXZlQHJlY29pbC5vcmc+OyBUaW0gKFhlbi5vcmcpIDx0aW1AeGVuLm9y
Zz47IEdlb3JnZSBEdW5sYXANCj4gPEdlb3JnZS5EdW5sYXBAY2l0cml4LmNvbT47IFRhbWFzIEsg
TGVuZ3llbCA8dGFtYXNAdGtsZW5neWVsLmNvbT47IElhbiBKYWNrc29uDQo+IDxJYW4uSmFja3Nv
bkBjaXRyaXguY29tPjsgQW50aG9ueSBQZXJhcmQgPGFudGhvbnkucGVyYXJkQGNpdHJpeC5jb20+
OyB4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmc7DQo+IFZvbG9keW15ciBCYWJjaHVrIDxW
b2xvZHlteXJfQmFiY2h1a0BlcGFtLmNvbT47IFJvZ2VyIFBhdSBNb25uZSA8cm9nZXIucGF1QGNp
dHJpeC5jb20+OyBKdWxpZW4gR3JhbGwNCj4gPGp1bGllbi5ncmFsbEBhcm0uY29tPg0KPiBTdWJq
ZWN0OiBSZTogW1hlbi1kZXZlbF0gW1BBVENIIHYxMyAwLzRdIGFkZCBwZXItZG9tYWluIElPTU1V
IGNvbnRyb2wNCj4gDQo+IA0KPiBbQ0MgSnVsaWVuXQ0KPiANCj4gDQo+IEhpIFBhdWwNCj4gDQo+
IEkgbWF5IG1pc3Rha2UsIGJ1dCBsb29rcyBsaWtlDQo+IA0KPiA4MGZmM2QzMzhkYzkzMjYwYjQx
ZmZlZWViYjBmODUyYzJlZGVmOWNlIGlvbW11OiB0aWR5IHVwDQo+IGlvbW11X3VzZV9oYXBfcHQo
KSBhbmQgbmVlZF9pb21tdV9wdF9zeW5jKCkgbWFjcm9zDQo+IA0KPiB0cmlnZ2VycyBBU1NFUlRf
VU5SRUFDSEFCTEUgb24gQXJtIGlmIG5vIElPTU1VIGhhcyBiZWVuIGZvdW5kIChJIGJ1aWx0DQo+
IHdpdGggbXkgcGxhdGZvcm0ncyBJT01NVSBkcml2ZXIgZGlzYWJsZWQ6ICMgQ09ORklHX0lQTU1V
X1ZNU0EgaXMgbm90IHNldCkgLg0KPiANCj4gU28sIGlvbW11X3NldHVwKCkgY2FsbHMgY2xlYXJf
aW9tbXVfaGFwX3B0X3NoYXJlKCkgd2l0aA0KPiBpb21tdV9oYXBfcHRfc2hhcmUgYmVpbmcgc2V0
IChDT05GSUdfSU9NTVVfRk9SQ0VfUFRfU0hBUkU9eSkgd2hpY2gsDQo+IGFjdHVhbGx5LCB0cmln
Z2VycyBBU1NFUlQuDQoNCkJUVywgSSBhc3N1bWUgZGlzYWJsaW5nIHRoZSBpb21tdSBvbiB0aGUg
eGVuIGNvbW1hbmQgbGlrZSB3aWxsIHdvcmsgcm91bmQgdGhlIGlzc3VlPw0KDQogIFBhdWwNCg0K
PiANCj4gLi4uDQo+IA0KPiANCj4gKFhFTikgQXNzZXJ0aW9uICd1bnJlYWNoYWJsZScgZmFpbGVk
IGF0DQo+IC4uLmlsZC13b3Jrc3BhY2UvYnVpbGQveGVuL3hlbi9pbmNsdWRlL3hlbi9pb21tdS5o
OjcyDQo+IChYRU4pIC0tLS1bIFhlbi00LjEzLXVuc3RhYmxlwqAgYXJtNjTCoCBkZWJ1Zz15wqDC
oCBOb3QgdGFpbnRlZCBdLS0tLQ0KPiAoWEVOKSBDUFU6wqDCoMKgIDANCj4gKFhFTikgUEM6wqDC
oMKgwqAgMDAwMDAwMDAwMDJiM2FlMCBpb21tdV9zZXR1cCsweGEwLzB4MThjDQo+IChYRU4pIExS
OsKgwqDCoMKgIDAwMDAwMDAwMDAyYjNhOGMNCj4gKFhFTikgU1A6wqDCoMKgwqAgMDAwMDAwMDAw
MDJmN2RjMA0KPiAoWEVOKSBDUFNSOsKgwqAgYTAwMDAyNDkgTU9ERTo2NC1iaXQgRUwyaCAoSHlw
ZXJ2aXNvciwgaGFuZGxlcikNCj4gKFhFTinCoMKgwqDCoMKgIFgwOiAwMDAwMDAwMDAwMmE3MDAw
wqAgWDE6IDAwMDAwMDAwMDAwMDAwMDDCoCBYMjogMmM3MzYxNzM2NTZlNjU3Mg0KPiAoWEVOKcKg
wqDCoMKgwqAgWDM6IDAwMDAwMDAwMDAwMDAwMDLCoCBYNDogMDAwMDAwMDAwMDAwMDAwMcKgIFg1
OiAwMDAwMDAwMDAwMDAwMDAwDQo+IChYRU4pwqDCoMKgwqDCoCBYNjogMDAwMDAwMDAwMDAwMDA4
MMKgIFg3OiAyYjcyNjA3MjY0NmQ2NDcxwqAgWDg6IDdmN2Y3ZjdmN2Y3ZjdmN2YNCj4gKFhFTinC
oMKgwqDCoMKgIFg5OiBmZjY1Njg1ZTZjNmY3Mjc1IFgxMDogN2Y3ZjdmN2Y3ZjdmN2Y3ZiBYMTE6
IDAxMDEwMTAxMDEwMTAxMDENCj4gKFhFTinCoMKgwqDCoCBYMTI6IDAwMDAwMDAwMDAwMDAwMzgg
WDEzOiAwMDAwMDAwMDAwMjgwOTEwIFgxNDogMDAwMDAwMDAwMDAwMDAyMA0KPiAoWEVOKcKgwqDC
oMKgIFgxNTogMDAwMDAwMDAwMDAwMDAwMCBYMTY6IDAwMDAwMDAwMDAyYTcwMDAgWDE3OiAwMDAw
MDAwMDAwMmE3MDAwDQo+IChYRU4pwqDCoMKgwqAgWDE4OiAwMDAwMDAwMDAwMmE3MDAwIFgxOTog
MDAwMDAwMDAwMDAwMDAwMCBYMjA6IDAwMDAwMDAwZmZmZmZmZWQNCj4gKFhFTinCoMKgwqDCoCBY
MjE6IDAwMDAwMDAwMDAyYTYzODAgWDIyOiAwMDAwMDAwMDAwMzM1NDMwIFgyMzogMDAwMDAwMDAw
MDAwMDAwMg0KPiAoWEVOKcKgwqDCoMKgIFgyNDogMDAwMDAwMDAwMDI5YjFmMCBYMjU6IDAwMDAw
MDAwMDAyZDgzZDAgWDI2OiAwMDAwMDAwMDQ4MDAwMDAwDQo+IChYRU4pwqDCoMKgwqAgWDI3OiAw
MDAwMDAwMGMwMDAwMDAwIFgyODogMDAwMDAwMDAwMDAwMDAwMcKgIEZQOiAwMDAwMDAwMDAwMmY3
ZGMwDQo+IChYRU4pDQo+IChYRU4pwqDCoCBWVENSX0VMMjogODAwMDAwMDANCj4gKFhFTinCoCBW
VFRCUl9FTDI6IDAwMDAwMDAwMDAwMDAwMDANCj4gKFhFTikNCj4gKFhFTinCoCBTQ1RMUl9FTDI6
IDMwY2QxODNkDQo+IChYRU4pwqDCoMKgIEhDUl9FTDI6IDAwMDAwMDAwMDAwMDAwMzgNCj4gKFhF
TinCoCBUVEJSMF9FTDI6IDAwMDAwMDAwNzgxYjQwMDANCj4gKFhFTikNCj4gKFhFTinCoMKgwqAg
RVNSX0VMMjogZjIwMDAwMDENCj4gKFhFTinCoCBIUEZBUl9FTDI6IDAwMDAwMDAwMDAwMDAwMDAN
Cj4gKFhFTinCoMKgwqAgRkFSX0VMMjogMDAwMDAwMDAwMDAwMDAwMA0KPiAoWEVOKQ0KPiAoWEVO
KSBYZW4gc3RhY2sgdHJhY2UgZnJvbSBzcD0wMDAwMDAwMDAwMmY3ZGMwOg0KPiAoWEVOKcKgwqDC
oCAwMDAwMDAwMDAwMmY3ZGUwIDAwMDAwMDAwMDAyYmRkOTQgMDAwMDAwMDAwMDAwMDAwMiAwMDAw
MDAwMDAwMDAwMDAyDQo+IChYRU4pwqDCoMKgIDAwMDAwMDAwYmZlMGI2NjAgMDAwMDAwMDAwMDIw
MDFiNCAwMDAwMDAwMDc4MDgwMDAwIDAwMDAwMDAwNzdlODAwMDANCj4gKFhFTinCoMKgwqAgMDAw
MDAwMDA0ODAwMDAwMCAwMDAwMDAwMDAwMDAwMDAwIDAwMDAwMDAwMDA0MDAwMDAgMDAwMDAwMDAw
MDAwMDAwMw0KPiAoWEVOKcKgwqDCoCAwMDAwMDAwMDAwMDAwMDAxIDAwMDAwMDAwMDAwMDAwMDAg
MDAwMDAwMDA3ODA4MDAwMCAwMDAwMDAwMDQ4MDgwMDQwDQo+IChYRU4pwqDCoMKgIDAwMDAwMDAw
MDAwMDAwMDAgMDAwMDAwMDAwMDAwZjA4MCAwMDAwMDAwMDQ4MDAwMDAwIDAwMDAwMDAwNzgwMDAw
MDANCj4gKFhFTinCoMKgwqAgMDAwMDAwMDAwMDJkODNjMCAwMDAwMDAwMDAwMmFhNDQwIDAwMDAw
MDAwMDAwMDAwMDAgMDAwMDAwMDAwMDAwMDAwMA0KPiAoWEVOKcKgwqDCoCAwMDAwMDAwMDAwMDAw
MDAwIDAwMDAwMDAzMDAwMDAwMDAgMDAwMDAwMDAwMDAwMDAwMCAwMDAwMDA0MGZmZmZmZmZmDQo+
IChYRU4pwqDCoMKgIDAwMDAwMDAwMDAwMDA0MDAgMDAwMDAwMDAwMDAwMDAwMCAwMDAwMDAwMDAw
MDAwMDAwIDAwMDAwMDAwMDAwMDAwMDANCj4gKFhFTinCoMKgwqAgMDAwMDAwMDAwMDAwMDAwMCAw
MDAwMDAwMDAwMDAwMDAwIDAwMDAwMDAwMDAwMDAwMDAgMDAwMDAwMDAwMDAwMDAwMA0KPiAoWEVO
KcKgwqDCoCAwMDAwMDAwMDAwMDAwMDAwIDAwMDAwMDAwMDAwMDAwMDAgMDAwMDAwMDAwMDAwMDAw
MCAwMDAwMDAwMDAwMDAwMDAwDQo+IChYRU4pwqDCoMKgIDAwMDAwMDAwMDAwMDAwMDAgMDAwMDAw
MDAwMDAwMDAwMCAwMDAwMDAwMDAwMDAwMDAwIDAwMDAwMDAwMDAwMDAwMDANCj4gKFhFTinCoMKg
wqAgMDAwMDAwMDAwMDAwMDAwMCAwMDAwMDAwMDAwMDAwMDAwIDAwMDAwMDAwMDAwMDAwMDAgMDAw
MDAwMDAwMDAwMDAwMA0KPiAoWEVOKcKgwqDCoCAwMDAwMDAwMDAwMDAwMDAwIDAwMDAwMDAwMDAw
MDAwMDAgMDAwMDAwMDAwMDAwMDAwMCAwMDAwMDAwMDAwMDAwMDAwDQo+IChYRU4pwqDCoMKgIDAw
MDAwMDAwMDAwMDAwMDAgMDAwMDAwMDAwMDAwMDAwMCAwMDAwMDAwMDAwMDAwMDAwIDAwMDAwMDAw
MDAwMDAwMDANCj4gKFhFTinCoMKgwqAgMDAwMDAwMDAwMDAwMDAwMCAwMDAwMDAwMDAwMDAwMDAw
IDAwMDAwMDAwMDAwMDAwMDAgMDAwMDAwMDAwMDAwMDAwMA0KPiAoWEVOKcKgwqDCoCAwMDAwMDAw
MDAwMDAwMDAwIDAwMDAwMDAwMDAwMDAwMDAgMDAwMDAwMDAwMDAwMDAwMCAwMDAwMDAwMDAwMDAw
MDAwDQo+IChYRU4pwqDCoMKgIDAwMDAwMDAwMDAwMDAwMDAgMDAwMDAwMDAwMDAwMDAwMCAwMDAw
MDAwMDAwMDAwMDAwIDAwMDAwMDAwMDAwMDAwMDANCj4gKFhFTinCoMKgwqAgMDAwMDAwMDAwMDAw
MDAwMCAwMDAwMDAwMDAwMDAwMDAwIDAwMDAwMDAwMDAwMDAwMDAgMDAwMDAwMDAwMDAwMDAwMA0K
PiAoWEVOKSBYZW4gY2FsbCB0cmFjZToNCj4gKFhFTinCoMKgwqAgWzwwMDAwMDAwMDAwMmIzYWUw
Pl0gaW9tbXVfc2V0dXArMHhhMC8weDE4YyAoUEMpDQo+IChYRU4pwqDCoMKgIFs8MDAwMDAwMDAw
MDJiM2E4Yz5dIGlvbW11X3NldHVwKzB4NGMvMHgxOGMgKExSKQ0KPiAoWEVOKcKgwqDCoCBbPDAw
MDAwMDAwMDAyYmRkOTQ+XSBzdGFydF94ZW4rMHhhYTAvMHhjN2MNCj4gKFhFTinCoMKgwqAgWzww
MDAwMDAwMDAwMjAwMWI0Pl0gYXJtNjQvaGVhZC5vI3ByaW1hcnlfc3dpdGNoZWQrMHhjLzB4MmMN
Cj4gKFhFTikNCj4gKFhFTikNCj4gKFhFTikgKioqKioqKioqKioqKioqKioqKioqKioqKioqKioq
KioqKioqKioqKg0KPiAoWEVOKSBQYW5pYyBvbiBDUFUgMDoNCj4gKFhFTikgQXNzZXJ0aW9uICd1
bnJlYWNoYWJsZScgZmFpbGVkIGF0DQo+IC4uLmlsZC13b3Jrc3BhY2UvYnVpbGQveGVuL3hlbi9p
bmNsdWRlL3hlbi9pb21tdS5oOjcyDQo+IChYRU4pICoqKioqKioqKioqKioqKioqKioqKioqKioq
KioqKioqKioqKioqKioNCj4gKFhFTikNCj4gDQo+IA0KPiAtLQ0KPiBSZWdhcmRzLA0KPiANCj4g
T2xla3NhbmRyIFR5c2hjaGVua28NCg0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVu
cHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L3hlbi1kZXZlbA==
