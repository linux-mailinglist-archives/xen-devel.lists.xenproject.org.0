Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 751C776860
	for <lists+xen-devel@lfdr.de>; Fri, 26 Jul 2019 15:44:19 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hr0S0-0006zD-FT; Fri, 26 Jul 2019 13:40:00 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=PDV5=VX=citrix.com=paul.durrant@srs-us1.protection.inumbo.net>)
 id 1hr0Ry-0006z4-UD
 for xen-devel@lists.xenproject.org; Fri, 26 Jul 2019 13:39:58 +0000
X-Inumbo-ID: db774491-afaa-11e9-8980-bc764e045a96
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id db774491-afaa-11e9-8980-bc764e045a96;
 Fri, 26 Jul 2019 13:39:57 +0000 (UTC)
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
IronPort-SDR: zPpVIhPRpD3h8lsbWYWRxFERR9wWbjv8R0ZbfqSqljHEWfU5WAWVr+ayqJQ70b/aLIpfUF8rId
 gPHJzWHpgMjNNUJVgv/RmPrXfdB9nj5SmHXS3PaN/qMipv0eKRtkxq4Wp2KWO9VfA21pyMpPR4
 ySfwHY6POvira/IRAm4Wio2YEAm3Y/QXqi13sXo6Afb+yF/q/wOWgKIYVCrovOYS8ZeMpzUqWh
 5YsR0skNtGFtW60bIJEIqAfUDMVcpzdhPXzI4TYMkqMw8oVqeNCNBRuZEUv9yTfwWN0Wh1lpHS
 GI0=
X-SBRS: 2.7
X-MesageID: 3473746
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,311,1559534400"; 
   d="scan'208";a="3473746"
From: Paul Durrant <Paul.Durrant@citrix.com>
To: 'Jan Beulich' <JBeulich@suse.com>
Thread-Topic: [Xen-devel] per-domain passthrough/iommu options
Thread-Index: AdVDqy2gdS3slVvQRuCN/iB10JmJ2gABnjsAAAD6vMA=
Date: Fri, 26 Jul 2019 13:39:53 +0000
Message-ID: <3cd2057e69bc4bdbb87f53c97ffe765c@AMSPEX02CL03.citrite.net>
References: <a65d176f8912458c8576367597613de9@AMSPEX02CL03.citrite.net>
 <8fff2485-bf0a-5b98-dfbc-4679c39b9ed0@suse.com>
In-Reply-To: <8fff2485-bf0a-5b98-dfbc-4679c39b9ed0@suse.com>
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
Y2hAc3VzZS5jb20+DQo+IFNlbnQ6IDI2IEp1bHkgMjAxOSAxMzo1Nw0KPiBUbzogUGF1bCBEdXJy
YW50IDxQYXVsLkR1cnJhbnRAY2l0cml4LmNvbT4NCj4gQ2M6IHhlbi1kZXZlbCAoeGVuLWRldmVs
QGxpc3RzLnhlbnByb2plY3Qub3JnKSA8eGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnPg0K
PiBTdWJqZWN0OiBSZTogW1hlbi1kZXZlbF0gcGVyLWRvbWFpbiBwYXNzdGhyb3VnaC9pb21tdSBv
cHRpb25zDQo+IA0KPiBPbiAyNi4wNy4yMDE5IDE0OjI5LCBQYXVsIER1cnJhbnQgd3JvdGU6DQo+
ID4gICAgSSBzZW50IGEgcHJldmlvdXMgZW1haWwgWzFdIGFib3V0IGVuYWJsaW5nIHVzZSBvZiB0
aGUgSU9NTVUgb24gYSBwZXItZG9tYWluIGJhc2lzIGFuZCBhbSBub3cgYQ0KPiByZWFzb25hYmxl
IHdheSBpbnRvIG15IHBhdGNoIHNlcmllcywgd2hpY2ggYWxzbyBhbGxvd3MgZm9yIElPTU1VIG9w
dGlvbi1zZXR0aW5nIChzcGVjaWZpY2FsbHkgc2hhcmVkDQo+IEVQVCB1c2UpIG9uIGEgcGVyLWRv
bWFpbiBiYXNpcyB0b28uIEJlZm9yZSBJIHBvc3QgdjEgSSdkIGxpa2UgdG8gZ2V0IHNvbWUgb3Bp
bmlvbiBvbiB0aGUgd2hhdCB0aGUNCj4geGwuY2ZnIG9wdGlvbnMgc2hvdWxkIGxvb2sgbGlrZS4N
Cj4gPiAgICBUaGUgc2ltcGxlc3Qgd2F5IGZvciBtZSB0byBkbyB0aGluZ3Mgd291bGQgYmUgdG8g
aGF2ZSB0d28gbmV3IGJvb2xlYW4gb3B0aW9uczsgc29tZXRoaW5nIGxpa2U6DQo+ID4NCj4gPiAn
cGFzc3Rocm91Z2gnIC0gZW5hYmxlL2Rpc2FibGUgcGFzcy10aHJvdWdoIHN1cHBvcnQgKGkuZS4g
dXNlIG9mIHRoZSBJT01NVSkuLi4gY2FuIGJlIGltcGxpY2l0bHkNCj4gZW5hYmxlZCBpZiB0aGVy
ZSBhcmUgcGNpIG9yIGR0IGRldmljZXMgc3BlY2lmaWVkIGluIHRoZSB4bC5jZmcuDQo+ID4gJ25v
LXNoYXJlcHQnIC0gbmFtZWQgdG8gbWF0Y2ggdGhlIHhlbi1jbWRsaW5lIG9wdGlvbiBmb3IgdHVy
bmluZyBvZmYgc2hhcmVkIEVQVC4gKEVQVCBzaGFyaW5nDQo+IGN1cnJlbnRseSBkZWZhdWx0cyBv
biBnbG9iYWxseSkuDQo+ID4NCj4gPiAgICBJIHRoaW5rIHRoZSBmb3JtZXIgaXMgcHJvYmFibHkg
b2ssIGJ1dCB0aGlua2luZyBmb3J3YXJkIHRvIGEgdGltZSB3aGVyZSB3ZSBtaWdodCBoYXZlIHZJ
T01NVSAoUFYNCj4gb3IgZW11bGF0ZWQpIHRoZSBsYXR0ZXIgaXMgcHJvYmFibHkgbm90IHRoZSBy
aWdodCB0aGluZyB0byB1c2UuIFNvLCBhbm90aGVyIHdheSBtaWdodCBiZSB0byBoYXZlIGFuDQo+
IElPTU1VIHBhZ2UtdGFibGUgb3B0aW9uLi4uIHNvbWV0aGluZyBsaWtlOg0KPiA+DQo+ID4gJ2lv
bW11LXB0ID0gc2hhcmVkfHN5bmMnDQo+ID4NCj4gPiAgICB3aGVyZSAnc2hhcmVkJyBtZWFucyB1
c2UgRVBUIG1hcHBpbmdzLCBhbmQgJ3N5bmMnIG1lYW5zIGtlZXAgdGhlIFAyTSBpbiBzeW5jLiBU
aGlzIGNvdWxkIHRoZW4gYmUNCj4gZXh0ZW5kZWQgd2l0aCAndmlvbW11JyBsYXRlciwgbWVhbmlu
ZyB0aGF0IHRoZXJlIHdvdWxkIGJlIHNvbWUgZm9ybSBvZiB2SU9NTVUgZXhwb3NlZCB0byB0aGUg
Z3Vlc3QsIGJlDQo+IGl0IGVtdWxhdGVkLCBQViBvciBib3RoLiBPbmUgZHJhd2JhY2sgd2l0aCB0
aGlzIG1lY2hhbmlzbSBpcyB0aGF0ICdzaGFyZWQnIGlzIG5vdCBhbHdheXMgcG9zc2libGUNCj4g
KGUuZy4gb24gQU1EIGgvdykgc28gd2hhdCBzaG91bGQgYmUgZG9uZSBpbiB0aGF0IGNhc2U/IFNo
b3VsZCBzZWxlY3RpbmcgdGhhdCBvcHRpb24gYmUgY29uc2lkZXJlZCBhbg0KPiBlcnJvciwgb3Ig
c2hvdWxkIHRoZXJlIGJlIGEgZmFsbC1iYWNrIHRvICdzeW5jJz8gVGhlIGZhbGwtYmFjayB3b3Vs
ZCBiZSBlYXNpZXIgdG8gZGVhbCB3aXRoIGFzIHRoZW4NCj4gdGhlIG9wdGlvbiBjb3VsZCBqdXN0
IGRlZmF1bHQgdG8gJ3N5bmMnIGlmIGl0IHdhcyBub3Qgc3BlY2lmaWVkLg0KPiANCj4gVGhlIGZh
bGwtYmFjayBzb3VuZHMgcmVhc29uYWJsZSB0byBtZSAoYXMgbG9uZyBhcyB0aGF0J3MgcHJvcGVy
bHkNCj4gZGVzY3JpYmVkIGluIGRvY3VtZW50YXRpb24pLiBXaGF0IEknbSBsZXNzIGhhcHB5IHdp
dGggaXMgdGhlIGlkZWENCj4gb2YgaGF2aW5nIHR3byBvcHRpb25zIGluc3RlYWQgb2YganVzdCBv
bmUuIEJ1dCBvZiBjb3Vyc2UgdGhpcyBtYXkNCj4gYmUgYSByZXN1bHQgb2YgaG93IGxpYnhsIHdh
bnRzIHRvIG9yZ2FuaXplIG9wdGlvbnMuIElmIHRoZXJlJ3Mgbm8NCj4gcmVzdHJpY3Rpb24gYXQg
dGhhdCBlbmQsIHRoZW4gaG93IGFib3V0DQo+IA0KPiBwYXNzdGhyb3VnaCA9IG9mZnxzeW5jfHNo
YXJlLXB0fHZpb21tdQ0KPiANCj4gPyBJdCB3b3VsZCBkZWZhdWx0IHRvIG9mZiB3aGVuIHRoZXJl
IGFyZSBubyBkZXZpY2VzIGxpc3RlZCBpbiB0aGUNCj4gY29uZmlnLCBhbmQgdG8gc2hhcmUtcHQg
KHdpdGggdGhlIGZhbGwtYmFjayB0byBzeW5jKSB3aGVuIHRoZXJlIGlzDQo+IGF0IGxlYXN0IG9u
ZS4NCg0KWWVzLCB0aGF0IHNvdW5kcyBsaWtlIGl0IHdvdWxkIHdvcmsuDQoNCj4gDQo+IEFzIHRv
ICJzeW5jIiAtIGhvdyBkaWQgeW91IGNvbWUgdG8gdXNlIHRoaXMgYXMgdGhlICJvcHBvc2l0ZSIg
b2YNCj4gInNoYXJlLXB0Ij8NCg0KT2gsIHRoYXQncyBqdXN0IGFkb3B0aW5nIHRoZSBnZW5lcmFs
IG5hbWluZyB1c2VkIGluIFhlbi4gRm9yIGEgZG9tVSBpdCBpcyBlaXRoZXIgZ29pbmcgdG8gaGF2
ZSAnbmVlZF9zeW5jJyBzZXQgaW4gaXRzIGRvbWFpbl9pb21tdSBzdHJ1Y3R1cmUsIG9yIEVQVCBz
aGFyaW5nIHdpbGwgYmUgYWN0aXZlLg0KIA0KPiBUaGVyZSdzIG5vdGhpbmcgYXN5bmNocm9ub3Vz
IHdpdGggc2hhcmVkIHBhZ2UgdGFibGVzLA0KPiBpcyB0aGVyZT8gTWF5YmUgInByaXZhdGUtcHQi
IG9yICJzZXBhcmF0ZS1wdCI/IFRoZSBvcHRpb24gd291bGRuJ3QNCj4gYmUgdXNlZCB0eXBpY2Fs
bHkgYW55d2F5LCBlc3BlY2lhbGx5IGlmIGFsb25nc2lkZSAib2ZmIiB0aGVyZSB3YXMNCj4gYWxz
byBhbiAib24iIHZhcmlhbnQsIG1lYW5pbmcgdGhlIHNhbWUgYXMgInNoYXJlLXB0Ii4NCg0KTm90
IHN1cmUgaG93ICdvbicgd291bGQgY28tZXhpc3Qgd2l0aCAndmlvbW11Jy4uLiB0aGUgY3J1Y2lh
bCBkaWZmZXJlbmNlIGlzIHdoZXRoZXIgdGhlIHAybSBpcyBzaGFyZWQgb3Igbm90IGFuZCB0aGUg
Y3VycmVudGx5IHRoZSBvbmx5IG9wdGlvbiBpbiB0aGUgbm9uLXNoYXJlZCBjYXNlLCBiZWNhdXNl
IHdlIGxhY2sgYSB2aW9tbXUsIGlzIHRvIGtlZXAgdGhlIElPTU1VIG1hcHBpbmdzIGluIHN5bmMg
d2l0aCB0aGUgUDJNIHdoZW5ldmVyIHRoZSBsYXR0ZXIgaXMgdXBkYXRlZC4gU28sIGhvdyBhYm91
dDoNCg0KcGFzc3Rocm91Z2ggPSBvZmZ8c3luYy1wdHxzaGFyZS1wdHx2aW9tbXUNCg0KPyBJIGRv
bid0IHRoaW5rICdwcml2YXRlLXB0JyBvciAnc2VwYXJhdGUtcHQnIHJlYWxseSBjYXB0dXJlIHRo
ZSBmYWN0IHRoYXQgdGhlIHBhZ2UgdGFibGVzIG1hdGNoIHRoZSBQMk0uIFRoZXkgY291bGQganVz
dCBhcyBlYXNpbHkgYmUgdGFrZW4gdG8gbWVhbiB0aGF0IHRoZXkgYXJlIHBvcHVsYXRlZCB1c2lu
ZyBzb21lIG90aGVyIHBvbGljeS4NCg0KICBQYXVsDQoNCj4gDQo+IEphbg0KX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlz
dApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
