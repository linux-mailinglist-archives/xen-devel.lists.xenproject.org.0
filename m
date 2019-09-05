Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B2549AA609
	for <lists+xen-devel@lfdr.de>; Thu,  5 Sep 2019 16:38:10 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i5sqU-0003dl-E1; Thu, 05 Sep 2019 14:34:46 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=4qbh=XA=citrix.com=paul.durrant@srs-us1.protection.inumbo.net>)
 id 1i5sqS-0003df-WE
 for xen-devel@lists.xenproject.org; Thu, 05 Sep 2019 14:34:45 +0000
X-Inumbo-ID: 4d3c6282-cfea-11e9-978d-bc764e2007e4
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4d3c6282-cfea-11e9-978d-bc764e2007e4;
 Thu, 05 Sep 2019 14:34:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1567694085;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=2mAUqnrlOWLpO8jX+abeGxUKERLtRQIOmVZ6HJ11qxU=;
 b=BhJU14Jj/ueeIWEbBkMsz80EqsfFWexcapIgrbmhIyB4Y3+g8CRH84r2
 xPl2SDAF/eiiL8dJccRjMd5ejraBwbAqSY9HO34GFf0n6I4B2fXPKFDfi
 TiuVIIIC0udJnAZLkqCvCx9rGvFO4hHPUETIFnU3+bD1MXgyfDSGqGDm/ E=;
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=Paul.Durrant@citrix.com;
 spf=Pass smtp.mailfrom=Paul.Durrant@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 Paul.Durrant@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="Paul.Durrant@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa3.hc3370-68.iphmx.com: domain of
 Paul.Durrant@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="Paul.Durrant@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: ag8RUFx5HyTq4OJZqlZY7ZXK14yD4uswVPywtjR7XCIwqiT6+nsPOjfa0invUa4dVbIk5hA5uJ
 wWLJG9FzvAdj8ilWq+MzuiFfo0KrOhwtVamvqavAc11bdIiODYNbtLbY4OjFWW6cku/1xrz9Cf
 k8jt9Bd7ywedKxQ9ctpIAx9yYjkb8vcUNzzX5/+SliqTHbY3QEIK0jMvS/IkNmhdFoSucuISeg
 IdrdsHV59KJ10Ilt9+cu3cUNZTWRw8Sbbm9cn58B1UrrTL4lX1LNedi0jzL+tBWhgAV0dLhfPG
 pag=
X-SBRS: 2.7
X-MesageID: 5188563
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,470,1559534400"; 
   d="scan'208";a="5188563"
From: Paul Durrant <Paul.Durrant@citrix.com>
To: 'Jan Beulich' <jbeulich@suse.com>
Thread-Topic: [PATCH v8 4/6] remove late (on-demand) construction of IOMMU
 page tables
Thread-Index: AQHVYZ3BGu1OepJycUe/93XGh9kA46cdCAyAgAAijpA=
Date: Thu, 5 Sep 2019 14:34:38 +0000
Message-ID: <5331218cf2eb452dbae18c7a70f6fb58@AMSPEX02CL03.citrite.net>
References: <20190902145014.36442-1-paul.durrant@citrix.com>
 <20190902145014.36442-5-paul.durrant@citrix.com>
 <a0c639e8-4e59-395a-d2cf-5cfc386b0396@suse.com>
In-Reply-To: <a0c639e8-4e59-395a-d2cf-5cfc386b0396@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH v8 4/6] remove late (on-demand) construction
 of IOMMU page tables
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
Cc: PetrePircalabu <ppircalabu@bitdefender.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Razvan Cojocaru <rcojocaru@bitdefender.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Andrew Cooper <Andrew.Cooper3@citrix.com>, "Tim \(Xen.org\)" <tim@xen.org>,
 George Dunlap <George.Dunlap@citrix.com>, Julien
 Grall <julien.grall@arm.com>, Tamas K Lengyel <tamas@tklengyel.com>, Ian
 Jackson <Ian.Jackson@citrix.com>, Alexandru Isaila <aisaila@bitdefender.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBKYW4gQmV1bGljaCA8amJldWxp
Y2hAc3VzZS5jb20+DQo+IFNlbnQ6IDA1IFNlcHRlbWJlciAyMDE5IDE1OjMwDQo+IFRvOiBQYXVs
IER1cnJhbnQgPFBhdWwuRHVycmFudEBjaXRyaXguY29tPg0KPiBDYzogeGVuLWRldmVsQGxpc3Rz
LnhlbnByb2plY3Qub3JnOyBKdWxpZW4gR3JhbGwgPGp1bGllbi5ncmFsbEBhcm0uY29tPjsgQWxl
eGFuZHJ1IElzYWlsYQ0KPiA8YWlzYWlsYUBiaXRkZWZlbmRlci5jb20+OyBQZXRyZVBpcmNhbGFi
dSA8cHBpcmNhbGFidUBiaXRkZWZlbmRlci5jb20+OyBSYXp2YW4gQ29qb2NhcnUNCj4gPHJjb2pv
Y2FydUBiaXRkZWZlbmRlci5jb20+OyBBbmRyZXcgQ29vcGVyIDxBbmRyZXcuQ29vcGVyM0BjaXRy
aXguY29tPjsgUm9nZXIgUGF1IE1vbm5lDQo+IDxyb2dlci5wYXVAY2l0cml4LmNvbT47IFZvbG9k
eW15ciBCYWJjaHVrIDxWb2xvZHlteXJfQmFiY2h1a0BlcGFtLmNvbT47IEdlb3JnZSBEdW5sYXAN
Cj4gPEdlb3JnZS5EdW5sYXBAY2l0cml4LmNvbT47IElhbiBKYWNrc29uIDxJYW4uSmFja3NvbkBj
aXRyaXguY29tPjsgU3RlZmFubyBTdGFiZWxsaW5pDQo+IDxzc3RhYmVsbGluaUBrZXJuZWwub3Jn
PjsgS29ucmFkIFJ6ZXN6dXRlayBXaWxrIDxrb25yYWQud2lsa0BvcmFjbGUuY29tPjsgVGFtYXMg
SyBMZW5neWVsDQo+IDx0YW1hc0B0a2xlbmd5ZWwuY29tPjsgVGltIChYZW4ub3JnKSA8dGltQHhl
bi5vcmc+OyBXZWkgTGl1IDx3bEB4ZW4ub3JnPg0KPiBTdWJqZWN0OiBSZTogW1BBVENIIHY4IDQv
Nl0gcmVtb3ZlIGxhdGUgKG9uLWRlbWFuZCkgY29uc3RydWN0aW9uIG9mIElPTU1VIHBhZ2UgdGFi
bGVzDQo+IA0KPiBPbiAwMi4wOS4yMDE5IDE2OjUwLCBQYXVsIER1cnJhbnQgd3JvdGU6DQo+ID4g
Tm93IHRoYXQgdGhlcmUgaXMgYSBwZXItZG9tYWluIElPTU1VLWVuYWJsZSBmbGFnLCB3aGljaCBz
aG91bGQgYmUgc2V0IGlmDQo+ID4gYW55IGRldmljZSBpcyBnb2luZyB0byBiZSBwYXNzZWQgdGhy
b3VnaCwgc3RvcCBkZWZlcnJpbmcgcGFnZSB0YWJsZQ0KPiA+IGNvbnN0cnVjdGlvbiB1bnRpbCB0
aGUgYXNzaWdubWVudCBpcyBkb25lLiBBbHNvIGRvbid0IHRlYXIgZG93biB0aGUgdGFibGVzDQo+
ID4gYWdhaW4gd2hlbiB0aGUgbGFzdCBkZXZpY2UgaXMgZGUtYXNzaWduZWQ7IGRlZmVyIHRoYXQg
dGFzayB1bnRpbCBkb21haW4NCj4gPiBkZXN0cnVjdGlvbi4NCj4gPg0KPiA+IFRoaXMgYWxsb3dz
IHRoZSBoYXNfaW9tbXVfcHQoKSBoZWxwZXIgYW5kIGlvbW11X3N0YXR1cyBlbnVtZXJhdGlvbiB0
byBiZQ0KPiA+IHJlbW92ZWQuIENhbGxzIHRvIGhhc19pb21tdV9wdCgpIGFyZSBzaW1wbHkgcmVw
bGFjZWQgYnkgY2FsbHMgdG8NCj4gPiBpc19pb21tdV9lbmFibGVkKCkuIFJlbWFpbmluZyBvcGVu
LWNvZGVkIHRlc3RzIG9mIGlvbW11X2hhcF9wdF9zaGFyZSBjYW4NCj4gPiBhbHNvIGJlIHJlcGxh
Y2VkIGJ5IGNhbGxzIHRvIGlvbW11X3VzZV9oYXBfcHQoKS4NCj4gPiBUaGUgYXJjaF9pb21tdV9w
b3B1bGF0ZV9wYWdlX3RhYmxlKCkgYW5kIGlvbW11X2NvbnN0cnVjdCgpIGZ1bmN0aW9ucyBiZWNv
bWUNCj4gPiByZWR1bmRhbnQsIGFzIGRvZXMgdGhlICdzdHJpY3QgbW9kZScgZG9tMCBwYWdlX2xp
c3QgbWFwcGluZyBjb2RlIGluDQo+ID4gaW9tbXVfaHdkb21faW5pdCgpLCBhbmQgaW9tbXVfdGVh
cmRvd24oKSBjYW4gYmUgbWFkZSBzdGF0aWMgaXMgaXRzIG9ubHkNCj4gPiByZW1haW5pbmcgY2Fs
bGVyLCBpb21tdV9kb21haW5fZGVzdHJveSgpLCBpcyB3aXRoaW4gdGhlIHNhbWUgc291cmNlDQo+
ID4gbW9kdWxlLg0KPiA+DQo+ID4gQWxsIGluIGFsbCwgYWJvdXQgMjIwIGxpbmVzIG9mIGNvZGUg
YXJlIHJlbW92ZWQgZnJvbSB0aGUgaHlwZXJ2aXNvci4NCj4gPg0KPiA+IE5PVEU6IFRoaXMgcGF0
Y2ggd2lsbCBjYXVzZSBhIHNtYWxsIGFtb3VudCBvZiBleHRyYSByZXNvdXJjZSB0byBiZSB1c2Vk
DQo+ID4gICAgICAgdG8gYWNjb21tb2RhdGUgSU9NTVUgcGFnZSB0YWJsZXMgdGhhdCBtYXkgbmV2
ZXIgYmUgdXNlZCwgc2luY2UgdGhlDQo+ID4gICAgICAgcGVyLWRvbWFpbiBJT01NVS1lbmFibGUg
ZmxhZyBpcyBjdXJyZW50bHkgc2V0IHRvIHRoZSB2YWx1ZSBvZiB0aGUNCj4gPiAgICAgICBnbG9i
YWwgaW9tbXVfZW5hYmxlIGZsYWcuIEEgc3Vic2VxdWVudCBwYXRjaCB3aWxsIGFkZCBhbiBvcHRp
b24gdG8NCj4gPiAgICAgICB0aGUgdG9vbHN0YWNrIHRvIGFsbG93IGl0IHRvIGJlIHR1cm5lZCBv
ZmYgaWYgdGhlcmUgaXMgbm8gaW50ZW50aW9uDQo+ID4gICAgICAgdG8gYXNzaWduIHBhc3N0aHJv
dWdoIGhhcmR3YXJlIHRvIHRoZSBkb21haW4uDQo+ID4gICAgICAgVG8gYWNjb3VudCBmb3IgdGhl
IGV4dHJhIHJlc291cmNlLCAnaW9tbXVfbWVta2InIGhhcyBiZWVuIGFkZGVkIHRvDQo+ID4gICAg
ICAgZG9tYWluX2J1aWxkX2luZm8uIFRoaXMgcGF0Y2ggc2V0cyBpdCB1bmNvbmRpdGlvbmFsbHkg
dG8gYSB2YWx1ZQ0KPiA+ICAgICAgIGNhbGN1bGF0ZWQgYmFzZWQgb24gdGhlIGRvbWFpbidzIG1h
eGltdW0gbWVtb3J5IGJ1dCwgd2hlbiB0aGUNCj4gPiAgICAgICB0b29sc3RhY2sgb3B0aW9uIG1l
bnRpb25lZCBhYm92ZSBpcyBhZGRlZCwgaXQgY2FuIGJlIHNldCB0byB6ZXJvDQo+ID4gICAgICAg
aWYgdGhlIHBlci1kb21haW4gSU9NTVUtZW5hYmxlIGZsYWcgaXMgdHVybmVkIG9mZi4NCj4gPg0K
PiA+IFNpZ25lZC1vZmYtYnk6IFBhdWwgRHVycmFudCA8cGF1bC5kdXJyYW50QGNpdHJpeC5jb20+
DQo+IA0KPiBJJ3ZlIGp1c3Qgc3R1bWJsZWQgYWNyb3NzIG91ciBlYXJsaWVyIGRpc2N1c3Npb24g
b24gdGhlIHN0aWxsIG5vdA0KPiBzdWZmaWNpZW50bHkgIng4Ni9IVk06IHAybV9yYW1fcm8gaXMg
aW5jb21wYXRpYmxlIHdpdGggZGV2aWNlDQo+IHBhc3MtdGhyb3VnaCIgb2YgbWluZSwgYW5kIEkg
d29uZGVyIHdoZXRoZXIgdGhlIGltcGxpY2F0aW9uIGZyb20NCj4gdGhlIGNoYW5nZSBoZXJlIGlz
IHRoYXQgcGVvcGxlIHdhbnRpbmcgcDJtX3JhbV9ybyB1c2VkIG9uIGEgZ3Vlc3QNCj4gd291bGQg
dGhlbiBuZWVkIHRvIGZvcmNlIHRoZSBJT01NVSBvZmYgZm9yIHRoYXQgZ3Vlc3QgKHdoaWNoIGFp
dWkNCj4gaXNuJ3QgcG9zc2libGUgdW50aWwgcGF0Y2ggNikuDQoNCllvdSB3b3VsZG4ndCBiZSBh
YmxlIHRvIGZvcmNlIElPTU1VIG9mZiBvbiBhIHBlci1kb21haW4gYmFzaXMgdW50aWwgcGF0Y2gg
IzYgYnV0IGl0IGNvdWxkIHN0aWxsIGJlIGRvbmUgZ2xvYmFsbHkuDQoNCiAgUGF1bA0KDQo+IA0K
PiBKYW4NCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhl
bi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBz
Oi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
