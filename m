Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E81778AB8
	for <lists+xen-devel@lfdr.de>; Mon, 29 Jul 2019 13:40:53 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hs3yN-0003Od-8D; Mon, 29 Jul 2019 11:37:47 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=0i5a=V2=citrix.com=paul.durrant@srs-us1.protection.inumbo.net>)
 id 1hs3yL-0003OW-IP
 for xen-devel@lists.xenproject.org; Mon, 29 Jul 2019 11:37:45 +0000
X-Inumbo-ID: 4514a492-b1f5-11e9-9330-238b4d0fd1f6
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 4514a492-b1f5-11e9-9330-238b4d0fd1f6;
 Mon, 29 Jul 2019 11:37:40 +0000 (UTC)
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
IronPort-SDR: whsgYqG0qDNrYz4LxhimaLOqhEatogs2GBRhLOrRzBOxleeNWT6e1EEvgRHP1hmX4VNKrE5Yup
 GFaat0oR2afnUlzbIPvWiYbnu5hqksSXq1i8PrpoYkEvo0f4ogRUkgbH70DKpZ++e1uB6kSKiN
 v9yeU8lznr+coMvHE8QS4fdhUD7ucqchi3Nf6cFtLzZzKlYAm3EWtK2q/048DbUlI+f+bb175k
 6XBX0mvsuIgL2IPoj1TSn5BHE1RBYK4YQ8nAfZB4zCNSqryaFiaw5SReHLz7iUwE4Rn8o90qaM
 vrk=
X-SBRS: 2.7
X-MesageID: 3653017
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,322,1559534400"; 
   d="scan'208";a="3653017"
From: Paul Durrant <Paul.Durrant@citrix.com>
To: 'Jan Beulich' <JBeulich@suse.com>
Thread-Topic: [Xen-devel] per-domain passthrough/iommu options
Thread-Index: AdVDqy2gdS3slVvQRuCN/iB10JmJ2gABnjsAAAD6vMAAAUXLgAAASpcAAADXF4AAAKXGUACPHNGAAADt3eA=
Date: Mon, 29 Jul 2019 11:37:36 +0000
Message-ID: <822c2382faf5498eb563a2c29d9b8f5a@AMSPEX02CL03.citrite.net>
References: <a65d176f8912458c8576367597613de9@AMSPEX02CL03.citrite.net>
 <8fff2485-bf0a-5b98-dfbc-4679c39b9ed0@suse.com>
 <3cd2057e69bc4bdbb87f53c97ffe765c@AMSPEX02CL03.citrite.net>
 <82fc3e28-353a-44fb-0d6b-ec2913610c2f@suse.com>
 <fa7e8a34bedc43de8a62d8a8480d171e@AMSPEX02CL03.citrite.net>
 <73c71fa0-9eb9-c126-726d-114ff9f464af@suse.com>
 <067b1b1b41bb4fcbba0c353f4be0dc7d@AMSPEX02CL03.citrite.net>
 <9f3ac2e7-9542-dcf0-9e57-bb95928dd947@suse.com>
In-Reply-To: <9f3ac2e7-9542-dcf0-9e57-bb95928dd947@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
MIME-Version: 1.0
Subject: Re: [Xen-devel] per-domain passthrough/iommu options
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
Cc: "xen-devel \(xen-devel@lists.xenproject.org\)"
 <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBKYW4gQmV1bGljaCA8SkJldWxp
Y2hAc3VzZS5jb20+DQo+IFNlbnQ6IDI5IEp1bHkgMjAxOSAxMjoxMQ0KPiBUbzogUGF1bCBEdXJy
YW50IDxQYXVsLkR1cnJhbnRAY2l0cml4LmNvbT4NCj4gQ2M6IHhlbi1kZXZlbCAoeGVuLWRldmVs
QGxpc3RzLnhlbnByb2plY3Qub3JnKSA8eGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnPg0K
PiBTdWJqZWN0OiBSZTogW1hlbi1kZXZlbF0gcGVyLWRvbWFpbiBwYXNzdGhyb3VnaC9pb21tdSBv
cHRpb25zDQo+IA0KPiBPbiAyNi4wNy4yMDE5IDE2OjU0LCBQYXVsIER1cnJhbnQgd3JvdGU6DQo+
ID4+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+ID4+IEZyb206IEphbiBCZXVsaWNoIDxK
QmV1bGljaEBzdXNlLmNvbT4NCj4gPj4gU2VudDogMjYgSnVseSAyMDE5IDE1OjM0DQo+ID4+IFRv
OiBQYXVsIER1cnJhbnQgPFBhdWwuRHVycmFudEBjaXRyaXguY29tPg0KPiA+PiBDYzogeGVuLWRl
dmVsICh4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcpIDx4ZW4tZGV2ZWxAbGlzdHMueGVu
cHJvamVjdC5vcmc+DQo+ID4+IFN1YmplY3Q6IFJlOiBbWGVuLWRldmVsXSBwZXItZG9tYWluIHBh
c3N0aHJvdWdoL2lvbW11IG9wdGlvbnMNCj4gPj4NCj4gPj4gT24gMjYuMDcuMjAxOSAxNjoyNiwg
UGF1bCBEdXJyYW50IHdyb3RlOg0KPiA+Pj4+IEZyb206IEphbiBCZXVsaWNoIDxKQmV1bGljaEBz
dXNlLmNvbT4NCj4gPj4+PiBTZW50OiAyNiBKdWx5IDIwMTkgMTU6MDINCj4gPj4+Pg0KPiA+Pj4+
IE9uIDI2LjA3LjIwMTkgMTU6MzksIFBhdWwgRHVycmFudCB3cm90ZToNCj4gPj4+Pj4gPyBJIGRv
bid0IHRoaW5rICdwcml2YXRlLXB0JyBvciAnc2VwYXJhdGUtcHQnIHJlYWxseSBjYXB0dXJlIHRo
ZSBmYWN0IHRoYXQgdGhlIHBhZ2UgdGFibGVzIG1hdGNoDQo+ID4+IHRoZQ0KPiA+Pj4+IFAyTS4g
VGhleSBjb3VsZCBqdXN0IGFzIGVhc2lseSBiZSB0YWtlbiB0byBtZWFuIHRoYXQgdGhleSBhcmUg
cG9wdWxhdGVkIHVzaW5nIHNvbWUgb3RoZXIgcG9saWN5Lg0KPiA+Pj4+DQo+ID4+Pj4gQnV0IGhh
dmVuJ3Qgd2UgcmVjZW50bHkgc2VlbiB0aGF0IHRoaXMgZnVsbHkgbG9jay1zdGVwIHBvcHVsYXRp
b24NCj4gPj4+PiBvZiBwYWdlIHRhYmxlcyBpc24ndCBhbHdheXMgY29ycmVjdCAob3IgYXQgbGVh
c3QgZGVzaXJhYmxlKT8gSQ0KPiA+Pj4+IHZhZ3VlbHkgcmVjYWxsIG90aGVyIGNvbW1lbnRzIHRv
IHRoYXQgZWZmZWN0IHRvbywgZnJvbSBsb25nIGFnby4NCj4gPj4+PiBJJ2Qgc3BlY2lmaWNhbGx5
IHdhbnQgdG8gYXZvaWQgZW5jb2RpbmcgaW50byB0aGUgaW50ZXJmYWNlIGhlcmUNCj4gPj4+PiB0
aGF0IHRoZSB0d28gYXJlIGV4YWN0IG1pcnJvcnMgb2Ygb25lIGFub3RoZXIsIG5vdyBhbmQgZm9y
ZXZlci4NCj4gPj4+DQo+ID4+PiBIb3cgZG8geW91IHRoaW5rIHdlIHNob3VsZCBleHByZXNzIGl0
LiBJIGFncmVlIHRoYXQgaXQncyBhIGJpdCBhd2t3YXJkIGJlY2F1c2Ugb2YgdGhlIGRpZmZlcmVu
Y2UNCj4gPj4gYmV0d2VlbiBIVk0gYW5kIFBWIGRvbWFpbnMsIGJ1dCBhbGwgd2UgY2FuIGRvIHRo
ZXJlIHJlYWxseSBpcyBkb2N1bWVudCBpdCBJIHRoaW5rLCBzbyBwZXJoYXBzIHRoZQ0KPiA+PiBt
YW5wYWdlIGNvdWxkIGhhdmUgc29tZXRoaW5nIGxpa2U6DQo+ID4+DQo+ID4+IFNvdW5kcyByZWFz
b25hYmxlIC0gaXQgYXQgbGVhc3QgYXZvaWRzIG1ha2luZyB0aGUgYmVoYXZpb3IgdG9vDQo+ID4+
IG11Y2ggc3BlbGxlZCBvdXQgd2l0aCByZWdhcmQgdG8gdGhlIHNpbWlsYXJpdHkgb2YgbWFwcGlu
Z3MgYmV0d2Vlbg0KPiA+PiBJT01NVSBwYWdlIHRhYmxlcyBhbmQgUDJNLiBUaGVyZSdzIG9uZSBp
c3N1ZSB0aG91Z2g6DQo+ID4+DQo+ID4+PiAnb2ZmJw0KPiA+Pj4NCj4gPj4+IElPTU1VIG1hcHBp
bmdzIGFyZSBkaXNhYmxlZCBmb3IgdGhlIGRvbWFpbiBhbmQgc28gaGFyZHdhcmUgbWF5IG5vdCBi
ZSBwYXNzZWQgdGhyb3VnaC4NCj4gPj4+DQo+ID4+PiAnc3luYy1wdCcNCj4gPj4+DQo+ID4+PiBG
b3IgYSBQViBkb21haW4sIGFsbCB3cml0YWJsZSBwYWdlcyBhc3NpZ25lZCB0byB0aGUgZG9tYWlu
IGFyZSBpZGVudGl0eSBtYXBwZWQgYnkgTUZOIGluIHRoZSBJT01NVQ0KPiA+PiBwYWdlIHRhYmxl
cy4gVGh1cyBhIGRldmljZSBkcml2ZXIgcnVubmluZyBpbiB0aGUgZG9tYWluIG1heSBwcm9ncmFt
IHBhc3N0aHJvdWdoIGhhcmR3YXJlIGZvciBETUENCj4gdXNpbmcNCj4gPj4gTUZOIHZhbHVlcyAo
aS5lLiBob3N0L21hY2hpbmUgZnJhbWUgbnVtYmVycykgbG9va2VkIHVwIGluIGl0cyBQMk0uDQo+
ID4+PiBGb3IgYW4gSFZNIGRvbWFpbiwgYWxsIG5vbi1mb3JlaWduIFJBTSBwYWdlcyBwcmVzZW50
IGluIHRoZSBQMk0gd2lsbCBiZSBpZGVudGl0eSBtYXBwZWQgYnkgR0ZODQo+ID4+DQo+ID4+IFdo
eSAiaWRlbnRpdHkgbWFwcGVkIiBoZXJlPyBJdCdzIGEgR0ZOIC0+IE1GTiBtYXBwaW5nbSwgaXNu
J3QgaXQ/DQo+ID4NCj4gPiBZZXMuLi4gaXQncyBoYXJkIHRvIGV4cHJlc3MuIFdoYXQgSSB3YW50
IHRvIHNheSwgb2YgY291cnNlLCBpcyB0aGF0IGRldmljZSBkcml2ZXJzIGNhbiB1c2UgR0ZOcy4g
Q2FuDQo+IHlvdSB0aGluayBvZiBhbnkgb3RoZXIgZm9ybSBvZiB3b3JkcyB0aGF0IG1pZ2h0IGJl
IGJldHRlcj8NCj4gDQo+IEp1c3Qgb21pdCAiaWRlbnRpdHkiIGluIHRoZSBIVk0gcmVsYXRlZCBz
ZW50ZW5jZT8NCg0KT2ssIEkgZ3Vlc3MgdGhhdCBzb3VuZHMgb2suIEknbGwgZG8gdGhhdC4NCg0K
ICBQYXVsDQoNCj4gDQo+IEphbg0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJv
amVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hl
bi1kZXZlbA==
