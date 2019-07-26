Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DDCAA76C28
	for <lists+xen-devel@lfdr.de>; Fri, 26 Jul 2019 16:56:46 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hr1cB-0007ME-Rx; Fri, 26 Jul 2019 14:54:35 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=PDV5=VX=citrix.com=paul.durrant@srs-us1.protection.inumbo.net>)
 id 1hr1c9-0007M9-Oz
 for xen-devel@lists.xenproject.org; Fri, 26 Jul 2019 14:54:33 +0000
X-Inumbo-ID: 46b15873-afb5-11e9-8980-bc764e045a96
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 46b15873-afb5-11e9-8980-bc764e045a96;
 Fri, 26 Jul 2019 14:54:32 +0000 (UTC)
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
IronPort-SDR: fLiTLvFvtOAsLhoTmP7VAbDaLXghH9oTgyBLRNGj0zSbP3NMd1hUABUdGYeDpZ1ciXmQRrjY8k
 ne4CDVP4PQcJkyb/td0Rc19o1kyKpT8whDm2ZSfex84jL2H94VOW7Y93zIV82vX9xK9p0IX622
 ajtq3pxZHBXGHYs+u7vgV1DyS3E/N95XeM5CcfAAYdERtp1bM/ZqwKMS9scwnTJwOA5Oe9PYak
 QTo0dVfdASLserhXR2w+b47wjsx9Txi2asPNVTGavZ7Je/nwsD2dYfhktNH310I1JRrSPYX9bC
 hqs=
X-SBRS: 2.7
X-MesageID: 3578642
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,311,1559534400"; 
   d="scan'208";a="3578642"
From: Paul Durrant <Paul.Durrant@citrix.com>
To: 'Jan Beulich' <JBeulich@suse.com>
Thread-Topic: [Xen-devel] per-domain passthrough/iommu options
Thread-Index: AdVDqy2gdS3slVvQRuCN/iB10JmJ2gABnjsAAAD6vMAAAUXLgAAASpcAAADXF4AAAKXGUA==
Date: Fri, 26 Jul 2019 14:54:29 +0000
Message-ID: <067b1b1b41bb4fcbba0c353f4be0dc7d@AMSPEX02CL03.citrite.net>
References: <a65d176f8912458c8576367597613de9@AMSPEX02CL03.citrite.net>
 <8fff2485-bf0a-5b98-dfbc-4679c39b9ed0@suse.com>
 <3cd2057e69bc4bdbb87f53c97ffe765c@AMSPEX02CL03.citrite.net>
 <82fc3e28-353a-44fb-0d6b-ec2913610c2f@suse.com>
 <fa7e8a34bedc43de8a62d8a8480d171e@AMSPEX02CL03.citrite.net>
 <73c71fa0-9eb9-c126-726d-114ff9f464af@suse.com>
In-Reply-To: <73c71fa0-9eb9-c126-726d-114ff9f464af@suse.com>
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
Y2hAc3VzZS5jb20+DQo+IFNlbnQ6IDI2IEp1bHkgMjAxOSAxNTozNA0KPiBUbzogUGF1bCBEdXJy
YW50IDxQYXVsLkR1cnJhbnRAY2l0cml4LmNvbT4NCj4gQ2M6IHhlbi1kZXZlbCAoeGVuLWRldmVs
QGxpc3RzLnhlbnByb2plY3Qub3JnKSA8eGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnPg0K
PiBTdWJqZWN0OiBSZTogW1hlbi1kZXZlbF0gcGVyLWRvbWFpbiBwYXNzdGhyb3VnaC9pb21tdSBv
cHRpb25zDQo+IA0KPiBPbiAyNi4wNy4yMDE5IDE2OjI2LCBQYXVsIER1cnJhbnQgd3JvdGU6DQo+
ID4+IEZyb206IEphbiBCZXVsaWNoIDxKQmV1bGljaEBzdXNlLmNvbT4NCj4gPj4gU2VudDogMjYg
SnVseSAyMDE5IDE1OjAyDQo+ID4+DQo+ID4+IE9uIDI2LjA3LjIwMTkgMTU6MzksIFBhdWwgRHVy
cmFudCB3cm90ZToNCj4gPj4+ID8gSSBkb24ndCB0aGluayAncHJpdmF0ZS1wdCcgb3IgJ3NlcGFy
YXRlLXB0JyByZWFsbHkgY2FwdHVyZSB0aGUgZmFjdCB0aGF0IHRoZSBwYWdlIHRhYmxlcyBtYXRj
aA0KPiB0aGUNCj4gPj4gUDJNLiBUaGV5IGNvdWxkIGp1c3QgYXMgZWFzaWx5IGJlIHRha2VuIHRv
IG1lYW4gdGhhdCB0aGV5IGFyZSBwb3B1bGF0ZWQgdXNpbmcgc29tZSBvdGhlciBwb2xpY3kuDQo+
ID4+DQo+ID4+IEJ1dCBoYXZlbid0IHdlIHJlY2VudGx5IHNlZW4gdGhhdCB0aGlzIGZ1bGx5IGxv
Y2stc3RlcCBwb3B1bGF0aW9uDQo+ID4+IG9mIHBhZ2UgdGFibGVzIGlzbid0IGFsd2F5cyBjb3Jy
ZWN0IChvciBhdCBsZWFzdCBkZXNpcmFibGUpPyBJDQo+ID4+IHZhZ3VlbHkgcmVjYWxsIG90aGVy
IGNvbW1lbnRzIHRvIHRoYXQgZWZmZWN0IHRvbywgZnJvbSBsb25nIGFnby4NCj4gPj4gSSdkIHNw
ZWNpZmljYWxseSB3YW50IHRvIGF2b2lkIGVuY29kaW5nIGludG8gdGhlIGludGVyZmFjZSBoZXJl
DQo+ID4+IHRoYXQgdGhlIHR3byBhcmUgZXhhY3QgbWlycm9ycyBvZiBvbmUgYW5vdGhlciwgbm93
IGFuZCBmb3JldmVyLg0KPiA+DQo+ID4gSG93IGRvIHlvdSB0aGluayB3ZSBzaG91bGQgZXhwcmVz
cyBpdC4gSSBhZ3JlZSB0aGF0IGl0J3MgYSBiaXQgYXdrd2FyZCBiZWNhdXNlIG9mIHRoZSBkaWZm
ZXJlbmNlDQo+IGJldHdlZW4gSFZNIGFuZCBQViBkb21haW5zLCBidXQgYWxsIHdlIGNhbiBkbyB0
aGVyZSByZWFsbHkgaXMgZG9jdW1lbnQgaXQgSSB0aGluaywgc28gcGVyaGFwcyB0aGUNCj4gbWFu
cGFnZSBjb3VsZCBoYXZlIHNvbWV0aGluZyBsaWtlOg0KPiANCj4gU291bmRzIHJlYXNvbmFibGUg
LSBpdCBhdCBsZWFzdCBhdm9pZHMgbWFraW5nIHRoZSBiZWhhdmlvciB0b28NCj4gbXVjaCBzcGVs
bGVkIG91dCB3aXRoIHJlZ2FyZCB0byB0aGUgc2ltaWxhcml0eSBvZiBtYXBwaW5ncyBiZXR3ZWVu
DQo+IElPTU1VIHBhZ2UgdGFibGVzIGFuZCBQMk0uIFRoZXJlJ3Mgb25lIGlzc3VlIHRob3VnaDoN
Cj4gDQo+ID4gJ29mZicNCj4gPg0KPiA+IElPTU1VIG1hcHBpbmdzIGFyZSBkaXNhYmxlZCBmb3Ig
dGhlIGRvbWFpbiBhbmQgc28gaGFyZHdhcmUgbWF5IG5vdCBiZSBwYXNzZWQgdGhyb3VnaC4NCj4g
Pg0KPiA+ICdzeW5jLXB0Jw0KPiA+DQo+ID4gRm9yIGEgUFYgZG9tYWluLCBhbGwgd3JpdGFibGUg
cGFnZXMgYXNzaWduZWQgdG8gdGhlIGRvbWFpbiBhcmUgaWRlbnRpdHkgbWFwcGVkIGJ5IE1GTiBp
biB0aGUgSU9NTVUNCj4gcGFnZSB0YWJsZXMuIFRodXMgYSBkZXZpY2UgZHJpdmVyIHJ1bm5pbmcg
aW4gdGhlIGRvbWFpbiBtYXkgcHJvZ3JhbSBwYXNzdGhyb3VnaCBoYXJkd2FyZSBmb3IgRE1BIHVz
aW5nDQo+IE1GTiB2YWx1ZXMgKGkuZS4gaG9zdC9tYWNoaW5lIGZyYW1lIG51bWJlcnMpIGxvb2tl
ZCB1cCBpbiBpdHMgUDJNLg0KPiA+IEZvciBhbiBIVk0gZG9tYWluLCBhbGwgbm9uLWZvcmVpZ24g
UkFNIHBhZ2VzIHByZXNlbnQgaW4gdGhlIFAyTSB3aWxsIGJlIGlkZW50aXR5IG1hcHBlZCBieSBH
Rk4NCj4gDQo+IFdoeSAiaWRlbnRpdHkgbWFwcGVkIiBoZXJlPyBJdCdzIGEgR0ZOIC0+IE1GTiBt
YXBwaW5nbSwgaXNuJ3QgaXQ/DQoNClllcy4uLiBpdCdzIGhhcmQgdG8gZXhwcmVzcy4gV2hhdCBJ
IHdhbnQgdG8gc2F5LCBvZiBjb3Vyc2UsIGlzIHRoYXQgZGV2aWNlIGRyaXZlcnMgY2FuIHVzZSBH
Rk5zLiBDYW4geW91IHRoaW5rIG9mIGFueSBvdGhlciBmb3JtIG9mIHdvcmRzIHRoYXQgbWlnaHQg
YmUgYmV0dGVyPw0KDQogIFBhdWwNCg0KPiANCj4gSmFuDQo+IA0KPiA+IGluIHRoZSBJT01NVSBw
YWdlIHRhYmxlcy4gVGh1cyBhIGRldmljZSBkcml2ZXIgcnVubmluZyBpbiB0aGUgZG9tYWluIG1h
eSBwcm9ncmFtIHBhc3N0aHJvdWdoDQo+IGhhcmR3YXJlIHVzaW5nIEdGTiB2YWx1ZXMgKGkuZS4g
Z3Vlc3QgcGh5c2ljYWwgZnJhbWUgbnVtYmVycykgd2l0aG91dCBhbnkgZnVydGhlciB0cmFuc2xh
dGlvbi4NCj4gPg0KPiA+ICdzaGFyZS1wdCcNCj4gPg0KPiA+IFRoaXMgaXMgdW5hdmFpbGFibGUg
Zm9yIGEgUFYgZG9tYWluLiBGb3IgYW4gSFZNIGRvbWFpbiwgdGhpcyBvcHRpb24gbWVhbnMgdGhh
dCB0aGUgSU9NTVUgd2lsbCBiZQ0KPiBwcm9ncmFtbWVkIHRvIGRpcmVjdGx5IHJlZmVyZW5jZSB0
aGUgUDJNIGFzIGl0cyBwYWdlIHRhYmxlcy4gVGhpcyBhdmFpbGFiaWxpdHkgb2YgdGhpcyBvcHRp
b24gaXMNCj4gaGFyZHdhcmUgc3BlY2lmaWMgYW5kIHRodXMsIGlmIGl0IGlzIHNwZWNpZmllZCBm
b3IgYSBkb21haW4gcnVubmluZyBvbiBoYXJkd2FyZSB0aGF0IGRvZXMgbm90IGFsbG93DQo+IGl0
LCAnc3luYy1wdCcgd2lsbCBiZSB1c2VkIGluc3RlYWQuDQo+ID4NCj4gPiA/DQo+ID4NCj4gPiAg
ICBQYXVsDQo+ID4NCj4gPj4NCj4gPj4gSmFuDQoNCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxp
c3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby94ZW4tZGV2ZWw=
