Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E2D6EBE1D3
	for <lists+xen-devel@lfdr.de>; Wed, 25 Sep 2019 17:58:28 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iD9dQ-0003PX-ED; Wed, 25 Sep 2019 15:55:20 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=6irf=XU=citrix.com=paul.durrant@srs-us1.protection.inumbo.net>)
 id 1iD9dP-0003PS-8w
 for xen-devel@lists.xenproject.org; Wed, 25 Sep 2019 15:55:19 +0000
X-Inumbo-ID: def4960a-dfac-11e9-97fb-bc764e2007e4
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by localhost (Halon) with ESMTPS
 id def4960a-dfac-11e9-97fb-bc764e2007e4;
 Wed, 25 Sep 2019 15:55:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1569426918;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=SOY/08M3D/ZGhRy8zGwWgM1g3bC7TP/CplxS85IEVJs=;
 b=TJQNfstZkxItANz2XEZUbuK7ZgSKcr4y369EPCiaYkUM7DH+pPtwioKg
 8lB8YbHf2HJOtFZR5NZ08xoTZ8MdTB4khKdVbIViFck2Ec6LyqAPJKXz9
 2C1DSRlp/bJNE0r9kWXPL7Gj17+SywJVQ7Td54fBJ18SHBLOSQUvJTNi+ 4=;
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
IronPort-SDR: a1IX+jHauVYt8nTRhtr565KKRoG8ILtnFT5mtbjYMxpyDhuCxkxGg7CYiTeS+t8CajYJxKJt3A
 ZTOeqKgQEjhtbBppjPqT1rRz/5dFhW3LaMvSVFCJk7tpDbwEkHaa8HOOmJhKit/6NsmGS23NYX
 mu629rq42PfoYyWXmE+ai5R8twmfzWoL9NoezVwbbCTsLlooRKkzvL5jTtHZCeUnVntmlPeW0C
 v3npsF/Q7RcUyfIr8XZS22rkOBU9B0A1fmBEhcduJCaHHRb+cnzjjm9n3cMNCkUg2Pm7EtxfxD
 YYY=
X-SBRS: 2.7
X-MesageID: 6057591
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,548,1559534400"; 
   d="scan'208";a="6057591"
From: Paul Durrant <Paul.Durrant@citrix.com>
To: 'Oleksandr' <olekstysh@gmail.com>, 'Jan Beulich' <jbeulich@suse.com>
Thread-Topic: [Xen-devel] [PATCH v13 0/4] add per-domain IOMMU control
Thread-Index: AQHVbg2Z91+gZvcE2UG2jzrPcpRppKc8HWgw///hpgCAACJVgIAAUp0AgAAipnA=
Date: Wed, 25 Sep 2019 15:55:13 +0000
Message-ID: <ee30ffd69f98423380063853a822a2e4@AMSPEX02CL03.citrite.net>
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
X1ZNU0EgaXMgbm90IHNldCkgLg0KDQpPaCwgSSdtIHN1cmUgSSB3YXMgdG9sZCB0aGlzIHdhcyBu
b3QgYSBwb3NzaWJpbGl0eSBmb3IgQVJNLCB3aGljaCBpcyB3aHkgaW9tbXVfaGFwX3B0X3NoYXJl
IGVuZGVkIHVwIGJlaW5nICNkZWZpbmVkLiBTZWVtcyBJIHdhcyBtaXNsZWQsIGluIHdoaWNoIGNh
c2UgQVJNIG91Z2h0IHRvIGJlIGhhdmUgYSBtb3JlIGR5bmFtaWMgY29uZmlnLiBhcyB3aXRoIHg4
Ni4NCg0KICBQYXVsDQoNCj4gDQo+IFNvLCBpb21tdV9zZXR1cCgpIGNhbGxzIGNsZWFyX2lvbW11
X2hhcF9wdF9zaGFyZSgpIHdpdGgNCj4gaW9tbXVfaGFwX3B0X3NoYXJlIGJlaW5nIHNldCAoQ09O
RklHX0lPTU1VX0ZPUkNFX1BUX1NIQVJFPXkpIHdoaWNoLA0KPiBhY3R1YWxseSwgdHJpZ2dlcnMg
QVNTRVJULg0KPiANCj4gLi4uDQo+IA0KPiANCj4gKFhFTikgQXNzZXJ0aW9uICd1bnJlYWNoYWJs
ZScgZmFpbGVkIGF0DQo+IC4uLmlsZC13b3Jrc3BhY2UvYnVpbGQveGVuL3hlbi9pbmNsdWRlL3hl
bi9pb21tdS5oOjcyDQo+IChYRU4pIC0tLS1bIFhlbi00LjEzLXVuc3RhYmxlwqAgYXJtNjTCoCBk
ZWJ1Zz15wqDCoCBOb3QgdGFpbnRlZCBdLS0tLQ0KPiAoWEVOKSBDUFU6wqDCoMKgIDANCj4gKFhF
TikgUEM6wqDCoMKgwqAgMDAwMDAwMDAwMDJiM2FlMCBpb21tdV9zZXR1cCsweGEwLzB4MThjDQo+
IChYRU4pIExSOsKgwqDCoMKgIDAwMDAwMDAwMDAyYjNhOGMNCj4gKFhFTikgU1A6wqDCoMKgwqAg
MDAwMDAwMDAwMDJmN2RjMA0KPiAoWEVOKSBDUFNSOsKgwqAgYTAwMDAyNDkgTU9ERTo2NC1iaXQg
RUwyaCAoSHlwZXJ2aXNvciwgaGFuZGxlcikNCj4gKFhFTinCoMKgwqDCoMKgIFgwOiAwMDAwMDAw
MDAwMmE3MDAwwqAgWDE6IDAwMDAwMDAwMDAwMDAwMDDCoCBYMjogMmM3MzYxNzM2NTZlNjU3Mg0K
PiAoWEVOKcKgwqDCoMKgwqAgWDM6IDAwMDAwMDAwMDAwMDAwMDLCoCBYNDogMDAwMDAwMDAwMDAw
MDAwMcKgIFg1OiAwMDAwMDAwMDAwMDAwMDAwDQo+IChYRU4pwqDCoMKgwqDCoCBYNjogMDAwMDAw
MDAwMDAwMDA4MMKgIFg3OiAyYjcyNjA3MjY0NmQ2NDcxwqAgWDg6IDdmN2Y3ZjdmN2Y3ZjdmN2YN
Cj4gKFhFTinCoMKgwqDCoMKgIFg5OiBmZjY1Njg1ZTZjNmY3Mjc1IFgxMDogN2Y3ZjdmN2Y3Zjdm
N2Y3ZiBYMTE6IDAxMDEwMTAxMDEwMTAxMDENCj4gKFhFTinCoMKgwqDCoCBYMTI6IDAwMDAwMDAw
MDAwMDAwMzggWDEzOiAwMDAwMDAwMDAwMjgwOTEwIFgxNDogMDAwMDAwMDAwMDAwMDAyMA0KPiAo
WEVOKcKgwqDCoMKgIFgxNTogMDAwMDAwMDAwMDAwMDAwMCBYMTY6IDAwMDAwMDAwMDAyYTcwMDAg
WDE3OiAwMDAwMDAwMDAwMmE3MDAwDQo+IChYRU4pwqDCoMKgwqAgWDE4OiAwMDAwMDAwMDAwMmE3
MDAwIFgxOTogMDAwMDAwMDAwMDAwMDAwMCBYMjA6IDAwMDAwMDAwZmZmZmZmZWQNCj4gKFhFTinC
oMKgwqDCoCBYMjE6IDAwMDAwMDAwMDAyYTYzODAgWDIyOiAwMDAwMDAwMDAwMzM1NDMwIFgyMzog
MDAwMDAwMDAwMDAwMDAwMg0KPiAoWEVOKcKgwqDCoMKgIFgyNDogMDAwMDAwMDAwMDI5YjFmMCBY
MjU6IDAwMDAwMDAwMDAyZDgzZDAgWDI2OiAwMDAwMDAwMDQ4MDAwMDAwDQo+IChYRU4pwqDCoMKg
wqAgWDI3OiAwMDAwMDAwMGMwMDAwMDAwIFgyODogMDAwMDAwMDAwMDAwMDAwMcKgIEZQOiAwMDAw
MDAwMDAwMmY3ZGMwDQo+IChYRU4pDQo+IChYRU4pwqDCoCBWVENSX0VMMjogODAwMDAwMDANCj4g
KFhFTinCoCBWVFRCUl9FTDI6IDAwMDAwMDAwMDAwMDAwMDANCj4gKFhFTikNCj4gKFhFTinCoCBT
Q1RMUl9FTDI6IDMwY2QxODNkDQo+IChYRU4pwqDCoMKgIEhDUl9FTDI6IDAwMDAwMDAwMDAwMDAw
MzgNCj4gKFhFTinCoCBUVEJSMF9FTDI6IDAwMDAwMDAwNzgxYjQwMDANCj4gKFhFTikNCj4gKFhF
TinCoMKgwqAgRVNSX0VMMjogZjIwMDAwMDENCj4gKFhFTinCoCBIUEZBUl9FTDI6IDAwMDAwMDAw
MDAwMDAwMDANCj4gKFhFTinCoMKgwqAgRkFSX0VMMjogMDAwMDAwMDAwMDAwMDAwMA0KPiAoWEVO
KQ0KPiAoWEVOKSBYZW4gc3RhY2sgdHJhY2UgZnJvbSBzcD0wMDAwMDAwMDAwMmY3ZGMwOg0KPiAo
WEVOKcKgwqDCoCAwMDAwMDAwMDAwMmY3ZGUwIDAwMDAwMDAwMDAyYmRkOTQgMDAwMDAwMDAwMDAw
MDAwMiAwMDAwMDAwMDAwMDAwMDAyDQo+IChYRU4pwqDCoMKgIDAwMDAwMDAwYmZlMGI2NjAgMDAw
MDAwMDAwMDIwMDFiNCAwMDAwMDAwMDc4MDgwMDAwIDAwMDAwMDAwNzdlODAwMDANCj4gKFhFTinC
oMKgwqAgMDAwMDAwMDA0ODAwMDAwMCAwMDAwMDAwMDAwMDAwMDAwIDAwMDAwMDAwMDA0MDAwMDAg
MDAwMDAwMDAwMDAwMDAwMw0KPiAoWEVOKcKgwqDCoCAwMDAwMDAwMDAwMDAwMDAxIDAwMDAwMDAw
MDAwMDAwMDAgMDAwMDAwMDA3ODA4MDAwMCAwMDAwMDAwMDQ4MDgwMDQwDQo+IChYRU4pwqDCoMKg
IDAwMDAwMDAwMDAwMDAwMDAgMDAwMDAwMDAwMDAwZjA4MCAwMDAwMDAwMDQ4MDAwMDAwIDAwMDAw
MDAwNzgwMDAwMDANCj4gKFhFTinCoMKgwqAgMDAwMDAwMDAwMDJkODNjMCAwMDAwMDAwMDAwMmFh
NDQwIDAwMDAwMDAwMDAwMDAwMDAgMDAwMDAwMDAwMDAwMDAwMA0KPiAoWEVOKcKgwqDCoCAwMDAw
MDAwMDAwMDAwMDAwIDAwMDAwMDAzMDAwMDAwMDAgMDAwMDAwMDAwMDAwMDAwMCAwMDAwMDA0MGZm
ZmZmZmZmDQo+IChYRU4pwqDCoMKgIDAwMDAwMDAwMDAwMDA0MDAgMDAwMDAwMDAwMDAwMDAwMCAw
MDAwMDAwMDAwMDAwMDAwIDAwMDAwMDAwMDAwMDAwMDANCj4gKFhFTinCoMKgwqAgMDAwMDAwMDAw
MDAwMDAwMCAwMDAwMDAwMDAwMDAwMDAwIDAwMDAwMDAwMDAwMDAwMDAgMDAwMDAwMDAwMDAwMDAw
MA0KPiAoWEVOKcKgwqDCoCAwMDAwMDAwMDAwMDAwMDAwIDAwMDAwMDAwMDAwMDAwMDAgMDAwMDAw
MDAwMDAwMDAwMCAwMDAwMDAwMDAwMDAwMDAwDQo+IChYRU4pwqDCoMKgIDAwMDAwMDAwMDAwMDAw
MDAgMDAwMDAwMDAwMDAwMDAwMCAwMDAwMDAwMDAwMDAwMDAwIDAwMDAwMDAwMDAwMDAwMDANCj4g
KFhFTinCoMKgwqAgMDAwMDAwMDAwMDAwMDAwMCAwMDAwMDAwMDAwMDAwMDAwIDAwMDAwMDAwMDAw
MDAwMDAgMDAwMDAwMDAwMDAwMDAwMA0KPiAoWEVOKcKgwqDCoCAwMDAwMDAwMDAwMDAwMDAwIDAw
MDAwMDAwMDAwMDAwMDAgMDAwMDAwMDAwMDAwMDAwMCAwMDAwMDAwMDAwMDAwMDAwDQo+IChYRU4p
wqDCoMKgIDAwMDAwMDAwMDAwMDAwMDAgMDAwMDAwMDAwMDAwMDAwMCAwMDAwMDAwMDAwMDAwMDAw
IDAwMDAwMDAwMDAwMDAwMDANCj4gKFhFTinCoMKgwqAgMDAwMDAwMDAwMDAwMDAwMCAwMDAwMDAw
MDAwMDAwMDAwIDAwMDAwMDAwMDAwMDAwMDAgMDAwMDAwMDAwMDAwMDAwMA0KPiAoWEVOKcKgwqDC
oCAwMDAwMDAwMDAwMDAwMDAwIDAwMDAwMDAwMDAwMDAwMDAgMDAwMDAwMDAwMDAwMDAwMCAwMDAw
MDAwMDAwMDAwMDAwDQo+IChYRU4pwqDCoMKgIDAwMDAwMDAwMDAwMDAwMDAgMDAwMDAwMDAwMDAw
MDAwMCAwMDAwMDAwMDAwMDAwMDAwIDAwMDAwMDAwMDAwMDAwMDANCj4gKFhFTinCoMKgwqAgMDAw
MDAwMDAwMDAwMDAwMCAwMDAwMDAwMDAwMDAwMDAwIDAwMDAwMDAwMDAwMDAwMDAgMDAwMDAwMDAw
MDAwMDAwMA0KPiAoWEVOKSBYZW4gY2FsbCB0cmFjZToNCj4gKFhFTinCoMKgwqAgWzwwMDAwMDAw
MDAwMmIzYWUwPl0gaW9tbXVfc2V0dXArMHhhMC8weDE4YyAoUEMpDQo+IChYRU4pwqDCoMKgIFs8
MDAwMDAwMDAwMDJiM2E4Yz5dIGlvbW11X3NldHVwKzB4NGMvMHgxOGMgKExSKQ0KPiAoWEVOKcKg
wqDCoCBbPDAwMDAwMDAwMDAyYmRkOTQ+XSBzdGFydF94ZW4rMHhhYTAvMHhjN2MNCj4gKFhFTinC
oMKgwqAgWzwwMDAwMDAwMDAwMjAwMWI0Pl0gYXJtNjQvaGVhZC5vI3ByaW1hcnlfc3dpdGNoZWQr
MHhjLzB4MmMNCj4gKFhFTikNCj4gKFhFTikNCj4gKFhFTikgKioqKioqKioqKioqKioqKioqKioq
KioqKioqKioqKioqKioqKioqKg0KPiAoWEVOKSBQYW5pYyBvbiBDUFUgMDoNCj4gKFhFTikgQXNz
ZXJ0aW9uICd1bnJlYWNoYWJsZScgZmFpbGVkIGF0DQo+IC4uLmlsZC13b3Jrc3BhY2UvYnVpbGQv
eGVuL3hlbi9pbmNsdWRlL3hlbi9pb21tdS5oOjcyDQo+IChYRU4pICoqKioqKioqKioqKioqKioq
KioqKioqKioqKioqKioqKioqKioqKioNCj4gKFhFTikNCj4gDQo+IA0KPiAtLQ0KPiBSZWdhcmRz
LA0KPiANCj4gT2xla3NhbmRyIFR5c2hjaGVua28NCg0KX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxA
bGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL3hlbi1kZXZlbA==
