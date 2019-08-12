Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 501A68B04B
	for <lists+xen-devel@lfdr.de>; Tue, 13 Aug 2019 08:57:11 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hxQhV-0002wK-Na; Tue, 13 Aug 2019 06:54:33 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=8mJ6=WJ=citrix.com=paul.durrant@srs-us1.protection.inumbo.net>)
 id 1hxQhU-0002uv-El
 for xen-devel@lists.xenproject.org; Tue, 13 Aug 2019 06:54:32 +0000
X-Inumbo-ID: f0e620ec-bd1d-11e9-b0c1-d3564b06f7b5
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f0e620ec-bd1d-11e9-b0c1-d3564b06f7b5;
 Mon, 12 Aug 2019 16:26:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1565627192;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Fhz6KlH/qzrGlBjrRjkZNjgfGuBn0QChOPAKEee/oqI=;
 b=GOanfnV9WIkfa3l5H7HQrrqDBFYRXYof6AmzYn1awnqrG9KFGpY+L0ZN
 AJgTNzAdseaIAd2NjPXl7nE8lobkj7zA8U3S7ldNx47x34inTEmk/W+3z
 VNb+p303ZcVI7U0g7Q73+Uatfc7PLQuCSH/4w9Ae85e9iesi1YDjbc4Lt k=;
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
IronPort-SDR: KNtys5TuODnuS0M03/JFfSiRc9GrqC9ik4NFL6tyszEHbalBKWqM3UzQEOqlrzWUUBTfux6FaR
 td5tTezy/77096E1PaubpcfGmp4T71SASRomy7yLXUgiHDliRL+0Xo616ucBQab+JyCbuATcDu
 9Gh8yTrgfVW3+ta8imKAPWh1GkKe94qErvaQE2H621EYnVTbWj7bHHro3FRwwaIGh4nYzJNXEd
 oweUtwSZ+sWmFn+TqqH2JkDe4+cxGc74z3+9lLBBuzxJQ7OfG1C2AODuNsx7h37K2yeSeaPghE
 Ib8=
X-SBRS: 2.7
X-MesageID: 4164721
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,378,1559534400"; 
   d="scan'208";a="4164721"
From: Paul Durrant <Paul.Durrant@citrix.com>
To: 'Jan Beulich' <jbeulich@suse.com>
Thread-Topic: [Xen-devel] [PATCH 3/6] remove late (on-demand) construction of
 IOMMU page tables
Thread-Index: AQHVRuOcaRJ86WB7wUWdfnF755Z/qabvZ0eAgAhNFVCAABIMcA==
Date: Mon, 12 Aug 2019 16:26:25 +0000
Message-ID: <b7ed5929dd864aefa93bb8572a7b5193@AMSPEX02CL03.citrite.net>
References: <20190730134419.2739-1-paul.durrant@citrix.com>
 <20190730134419.2739-4-paul.durrant@citrix.com>
 <1383f85e-bc08-c0be-bb02-f68b76ac1be5@suse.com>
 <0134b70d04b942b4b3ce65fd2340ff0c@AMSPEX02CL03.citrite.net>
In-Reply-To: <0134b70d04b942b4b3ce65fd2340ff0c@AMSPEX02CL03.citrite.net>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH 3/6] remove late (on-demand) construction of
 IOMMU page tables
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
Cc: 'Petre Pircalabu' <ppircalabu@bitdefender.com>, 'Stefano
 Stabellini' <sstabellini@kernel.org>, 'Wei Liu' <wl@xen.org>,
 'Razvan Cojocaru' <rcojocaru@bitdefender.com>,
 'Konrad Rzeszutek Wilk' <konrad.wilk@oracle.com>,
 Andrew Cooper <Andrew.Cooper3@citrix.com>, "Tim
 \(Xen.org\)" <tim@xen.org>, George Dunlap <George.Dunlap@citrix.com>,
 'Julien Grall' <julien.grall@arm.com>, 'Tamas K Lengyel' <tamas@tklengyel.com>,
 Ian Jackson <Ian.Jackson@citrix.com>,
 'Alexandru Isaila' <aisaila@bitdefender.com>,
 "'xen-devel@lists.xenproject.org'" <xen-devel@lists.xenproject.org>,
 'VolodymyrBabchuk' <Volodymyr_Babchuk@epam.com>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KW3NuaXBdDQo+ID4NCj4gPiBPbiAzMC4wNy4y
MDE5IDE1OjQ0LCBQYXVsIER1cnJhbnQgd3JvdGU6DQo+ID4gPiBOT1RFOiBUaGlzIHBhdGNoIHdp
bGwgY2F1c2UgYSBzbWFsbCBhbW91bnQgb2YgZXh0cmEgcmVzb3VyY2UgdG8gYmUgdXNlZA0KPiA+
ID4gICAgICAgIHRvIGFjY29tbW9kYXRlIElPTU1VIHBhZ2UgdGFibGVzIHRoYXQgbWF5IG5ldmVy
IGJlIHVzZWQsIHNpbmNlIHRoZQ0KPiA+ID4gICAgICAgIHBlci1kb21haW4gSU9NTVUgZmxhZyBl
bmFibGUgZmxhZyBpcyBjdXJyZW50bHkgc2V0IHRvIHRoZSB2YWx1ZQ0KPiA+ID4gICAgICAgIG9m
IHRoZSBnbG9iYWwgaW9tbXVfZW5hYmxlIGZsYWcuIEEgc3Vic2VxdWVudCBwYXRjaCB3aWxsIGFk
ZCBhbg0KPiA+ID4gICAgICAgIG9wdGlvbiB0byB0aGUgdG9vbHN0YWNrIHRvIGFsbG93IGl0IHRv
IGJlIHR1cm5lZCBvZmYgaWYgdGhlcmUgaXMNCj4gPiA+ICAgICAgICBubyBpbnRlbnRpb24gdG8g
YXNzaWduIHBhc3N0aHJvdWdoIGhhcmR3YXJlIHRvIHRoZSBkb21haW4uDQo+ID4NCj4gPiBJbiBw
YXJ0aWN1bGFyIGlmIHRoZSBkZWZhdWx0IG9mIHRoaXMgaXMgZ29pbmcgdG8gYmUgInRydWUiIChJ
DQo+ID4gZGlkbid0IGxvb2sgYXQgdGhhdCBwYXRjaCB5ZXQsIGJ1dCB0aGUgd29yZGluZyBhYm92
ZSBtYWtlcyBtZQ0KPiA+IGFzc3VtZSBzbyksIGluIGF1dG8tYmFsbG9vbmluZyBtb2RlIHdpdGhv
dXQgc2hhcmVkIHBhZ2UgdGFibGVzDQo+ID4gbW9yZSBtZW1vcnkgc2hvdWxkIGltbyBiZSBiYWxs
b29uZWQgb3V0IG9mIERvbTAgbm93LiBJdCBoYXMNCj4gPiBhbHdheXMgYmVlbiBhIGJ1ZyB0aGF0
IElPTU1VIHBhZ2UgdGFibGVzIHdlcmVuJ3QgYWNjb3VudGVkIGZvciwNCj4gPiBidXQgaXQgd291
bGQgYmVjb21lIGV2ZW4gbW9yZSBwcm9taW5lbnQgdGhlbi4NCj4gDQo+IFVsdGltYXRlbHksIG9u
Y2UgdGhlIHdob2xlIHNlcmllcyBpcyBhcHBsaWVkLCB0aGVuIG5vdGhpbmcgbXVjaCBzaG91bGQg
Y2hhbmdlIGZvciB0aG9zZSBzcGVjaWZ5aW5nDQo+IHBhc3N0aHJvdWdoIGgvdyBpbiBhbiB4bC5j
ZmcuIFRoZSBtYWluIGRpZmZlcmVuY2Ugd2lsbCBiZSB0aGF0IGgvdyBjYW5ub3QgYmUgcGFzc2Vk
IHRocm91Z2ggdG8gYQ0KPiBkb21haW4gdGhhdCB3YXMgbm90IG9yaWdpbmFsbHkgY3JlYXRlZCB3
aXRoIElPTU1VIHBhZ2V0YWJsZXMuDQo+IFdpdGggcGF0Y2hlcyBhcHBsaWVkIHVwIHRvIHRoaXMg
cG9pbnQgdGhlbiwgeWVzLCBldmVyeSBkb21haW4gd2lsbCBnZXQgSU9NTVUgcGFnZSB0YWJsZXMu
IEkgZ3Vlc3MgSSdsbA0KPiB0YWtlIGEgbG9vayBhdCB0aGUgYXV0by1iYWxsb29uaW5nIGNvZGUg
YW5kIHNlZSB3aGF0IG5lZWRzIHRvIGJlIGRvbmUuDQo+IA0KDQpPaywgSSd2ZSBoYWQgYSBsb29r
Li4uDQoNCkkgY291bGQgbWFrZSBhIHJvdWdoIGNhbGN1bGF0aW9uIGluIGxpYnhsX2RvbWFpbl9u
ZWVkX21lbW9yeSgpIGJhc2VkIG9uIHRoZSBkb21haW4ncyBtYXhfbWVta2IgYW5kIGFuIGFzc3Vt
cHRpb24gb2YgYSA0IGxldmVsIHRyYW5zbGF0aW9uIHdpdGggNTEyIFBURXMgcGVyIGxldmVsLCBv
ciB3b3VsZCBwcmVmZXIgc3VjaCBndWVzdGltYXRpb24gdG8gYmUgb3ZlcnJpZGFibGUgdXNpbmcg
YW4geGwuY2ZnIHBhcmFtZXRlciBpbiBhIGJyb2FkbHkgc2ltaWxhciB3YXkgdG8gc2hhZG93X21l
bWtiPw0KDQogIFBhdWwNCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qu
b3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2
ZWw=
