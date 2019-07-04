Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B9C425F662
	for <lists+xen-devel@lfdr.de>; Thu,  4 Jul 2019 12:14:20 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hiyil-0004VY-7W; Thu, 04 Jul 2019 10:12:07 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=suz0=VB=citrix.com=paul.durrant@srs-us1.protection.inumbo.net>)
 id 1hiyik-0004VS-8Y
 for xen-devel@lists.xenproject.org; Thu, 04 Jul 2019 10:12:06 +0000
X-Inumbo-ID: 2b6b954c-9e44-11e9-af89-6ff3b93938d5
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 2b6b954c-9e44-11e9-af89-6ff3b93938d5;
 Thu, 04 Jul 2019 10:12:04 +0000 (UTC)
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
IronPort-SDR: 4s2sSL1LdeirVa39KlqI9ttAvlDxNqtark0I3zL3RsSO0ZFqD6HNcZMZGGs2b8mIyHuN6t1SIX
 KixLlo4Xmw0xsubhzBdz+jo1Blvc4DZDRZcQmj7qb3LPh5rVs4eNG1knhSJjnWJEtu+psIxvOj
 Yt7yZV5m8XhhMNmz/E+Ah2KsyXMyfkNOsomH1T2NREa1fI1jLvRW/eqokHTb8YeLZq1cmj6DTS
 ohn/ymNAFSekHvKEBSm48aBoTcPKYr2QTHVvK5iaL8QqjwNBwbR7CYscWJfiWZYIgLvDXetAyL
 zp0=
X-SBRS: 2.7
X-MesageID: 2594669
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.63,450,1557201600"; 
   d="scan'208";a="2594669"
From: Paul Durrant <Paul.Durrant@citrix.com>
To: 'Jan Beulich' <JBeulich@suse.com>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>
Thread-Topic: [Xen-devel] [PATCH v2] x86/HVM: p2m_ram_ro is incompatible with
 device pass-through
Thread-Index: AQHVMZODenL8esX3CUGEt7b/0uHdFaa5AV1ggAEucACAAAMssIAACuWAgAAAqmA=
Date: Thu, 4 Jul 2019 10:12:00 +0000
Message-ID: <ad58b4fbcc8a4343bafefb1e37d50c51@AMSPEX02CL03.citrite.net>
References: <808bb731-c5a7-86cf-5c5a-25253ea8ff17@suse.com>
 <ee14bec6e2db4064a539f91a78d021f7@AMSPEX02CL03.citrite.net>
 <0f165d9f-6bfc-1ca0-648e-a64d05d204ed@suse.com>
 <ab4d8c58855c45ed855e27d1fa15972e@AMSPEX02CL03.citrite.net>
 <1d749d19-cad9-9d6b-27ef-b4abaa86ec97@suse.com>
In-Reply-To: <1d749d19-cad9-9d6b-27ef-b4abaa86ec97@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH v2] x86/HVM: p2m_ram_ro is incompatible with
 device pass-through
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
Cc: Andrew Cooper <Andrew.Cooper3@citrix.com>,
 George Dunlap <George.Dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBKYW4gQmV1bGljaCA8SkJldWxp
Y2hAc3VzZS5jb20+DQo+IFNlbnQ6IDA0IEp1bHkgMjAxOSAxMTowOQ0KPiBUbzogUGF1bCBEdXJy
YW50IDxQYXVsLkR1cnJhbnRAY2l0cml4LmNvbT47IHhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0
Lm9yZw0KPiBDYzogQW5kcmV3IENvb3BlciA8QW5kcmV3LkNvb3BlcjNAY2l0cml4LmNvbT47IEdl
b3JnZSBEdW5sYXAgPEdlb3JnZS5EdW5sYXBAY2l0cml4LmNvbT47IFJvZ2VyIFBhdQ0KPiBNb25u
ZSA8cm9nZXIucGF1QGNpdHJpeC5jb20+OyBXZWkgTGl1IDx3bEB4ZW4ub3JnPg0KPiBTdWJqZWN0
OiBSZTogW1hlbi1kZXZlbF0gW1BBVENIIHYyXSB4ODYvSFZNOiBwMm1fcmFtX3JvIGlzIGluY29t
cGF0aWJsZSB3aXRoIGRldmljZSBwYXNzLXRocm91Z2gNCj4gDQo+IE9uIDA0LjA3LjIwMTkgMTE6
MzUsIFBhdWwgRHVycmFudCB3cm90ZToNCj4gPj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0N
Cj4gPj4gRnJvbTogSmFuIEJldWxpY2ggPEpCZXVsaWNoQHN1c2UuY29tPg0KPiA+PiBTZW50OiAw
NCBKdWx5IDIwMTkgMTA6MTkNCj4gPj4gVG86IFBhdWwgRHVycmFudCA8UGF1bC5EdXJyYW50QGNp
dHJpeC5jb20+OyB4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcNCj4gPj4gQ2M6IEFuZHJl
dyBDb29wZXIgPEFuZHJldy5Db29wZXIzQGNpdHJpeC5jb20+OyBHZW9yZ2UgRHVubGFwIDxHZW9y
Z2UuRHVubGFwQGNpdHJpeC5jb20+OyBSb2dlciBQYXUNCj4gPj4gTW9ubmUgPHJvZ2VyLnBhdUBj
aXRyaXguY29tPjsgV2VpIExpdSA8d2xAeGVuLm9yZz4NCj4gPj4gU3ViamVjdDogUmU6IFtQQVRD
SCB2Ml0geDg2L0hWTTogcDJtX3JhbV9ybyBpcyBpbmNvbXBhdGlibGUgd2l0aCBkZXZpY2UgcGFz
cy10aHJvdWdoDQo+ID4+DQo+ID4+IE9uIDAzLjA3LjIwMTkgMTc6MjIsIFBhdWwgRHVycmFudCB3
cm90ZToNCj4gPj4+PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiA+Pj4+IEZyb206IEph
biBCZXVsaWNoIDxKQmV1bGljaEBzdXNlLmNvbT4NCj4gPj4+PiBTZW50OiAwMyBKdWx5IDIwMTkg
MTI6MzYNCj4gPj4+PiBUbzogeGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnDQo+ID4+Pj4g
Q2M6IEdlb3JnZSBEdW5sYXAgPEdlb3JnZS5EdW5sYXBAY2l0cml4LmNvbT47IFBhdWwgRHVycmFu
dCA8UGF1bC5EdXJyYW50QGNpdHJpeC5jb20+OyBBbmRyZXcNCj4gQ29vcGVyDQo+ID4+Pj4gPEFu
ZHJldy5Db29wZXIzQGNpdHJpeC5jb20+OyBXZWkgTGl1IDx3bEB4ZW4ub3JnPjsgUm9nZXIgUGF1
IE1vbm5lIDxyb2dlci5wYXVAY2l0cml4LmNvbT4NCj4gPj4+PiBTdWJqZWN0OiBbUEFUQ0ggdjJd
IHg4Ni9IVk06IHAybV9yYW1fcm8gaXMgaW5jb21wYXRpYmxlIHdpdGggZGV2aWNlIHBhc3MtdGhy
b3VnaA0KPiA+Pj4+DQo+ID4+Pj4gVGhlIHdyaXRlLWRpc2NhcmQgcHJvcGVydHkgb2YgdGhlIHR5
cGUgY2FuJ3QgYmUgcmVwcmVzZW50ZWQgaW4gSU9NTVUNCj4gPj4+PiBwYWdlIHRhYmxlIGVudHJp
ZXMuIE1ha2Ugc3VyZSB0aGUgcmVzcGVjdGl2ZSBjaGVja3MgLyB0cmFja2luZyBjYW4ndA0KPiA+
Pj4+IHJhY2UsIGJ5IHV0aWxpemluZyB0aGUgZG9tYWluIGxvY2suIFRoZSBvdGhlciBzaWRlcyBv
ZiB0aGUgc2hhcmluZy8NCj4gPj4+PiBwYWdpbmcvbG9nLWRpcnR5IGV4Y2x1c2lvbiBjaGVja3Mg
c2hvdWxkIHN1YnNlcXVlbnRseSBwZXJoYXBzIGFsc28gYmUNCj4gPj4+PiBwdXQgdW5kZXIgdGhh
dCBsb2NrIHRoZW4uDQo+ID4+Pj4NCj4gPj4+PiBUYWtlIHRoZSBvcHBvcnR1bml0eSBhbmQgYWxz
byBjb252ZXJ0IG5laWdoYm9yaW5nIGJvb2xfdCB0byBib29sIGluDQo+ID4+Pj4gc3RydWN0IGh2
bV9kb21haW4uDQo+ID4+Pj4NCj4gPj4+PiBTaWduZWQtb2ZmLWJ5OiBKYW4gQmV1bGljaCA8amJl
dWxpY2hAc3VzZS5jb20+DQo+ID4+Pj4gLS0tDQo+ID4+Pj4gdjI6IERvbid0IHNldCBwMm1fcmFt
X3JvX3VzZWQgd2hlbiBmYWlsaW5nIHRoZSByZXF1ZXN0Lg0KPiA+Pj4+DQo+ID4+Pj4gLS0tIGEv
eGVuL2FyY2gveDg2L2h2bS9kbS5jDQo+ID4+Pj4gKysrIGIveGVuL2FyY2gveDg2L2h2bS9kbS5j
DQo+ID4+Pj4gQEAgLTI1NSwxNiArMjU1LDMzIEBAIHN0YXRpYyBpbnQgc2V0X21lbV90eXBlKHN0
cnVjdCBkb21haW4gKmQNCj4gPj4+Pg0KPiA+Pj4+ICAgICAgICAgbWVtX3R5cGUgPSBhcnJheV9p
bmRleF9ub3NwZWMoZGF0YS0+bWVtX3R5cGUsIEFSUkFZX1NJWkUobWVtdHlwZSkpOw0KPiA+Pj4+
DQo+ID4+Pj4gLSAgICBpZiAoIG1lbV90eXBlID09IEhWTU1FTV9pb3JlcV9zZXJ2ZXIgKQ0KPiA+
Pj4+ICsgICAgc3dpdGNoICggbWVtX3R5cGUgKQ0KPiA+Pj4+ICAgICAgICAgew0KPiA+Pj4+ICAg
ICAgICAgICAgIHVuc2lnbmVkIGludCBmbGFnczsNCj4gPj4+Pg0KPiA+Pj4+ICsgICAgY2FzZSBI
Vk1NRU1faW9yZXFfc2VydmVyOg0KPiA+Pj4+ICAgICAgICAgICAgIGlmICggIWhhcF9lbmFibGVk
KGQpICkNCj4gPj4+PiAgICAgICAgICAgICAgICAgcmV0dXJuIC1FT1BOT1RTVVBQOw0KPiA+Pj4+
DQo+ID4+Pj4gICAgICAgICAgICAgLyogRG8gbm90IGNoYW5nZSB0byBIVk1NRU1faW9yZXFfc2Vy
dmVyIGlmIG5vIGlvcmVxIHNlcnZlciBtYXBwZWQuICovDQo+ID4+Pj4gICAgICAgICAgICAgaWYg
KCAhcDJtX2dldF9pb3JlcV9zZXJ2ZXIoZCwgJmZsYWdzKSApDQo+ID4+Pj4gICAgICAgICAgICAg
ICAgIHJldHVybiAtRUlOVkFMOw0KPiA+Pj4+ICsNCj4gPj4+PiArICAgICAgICBicmVhazsNCj4g
Pj4+PiArDQo+ID4+Pj4gKyAgICBjYXNlIEhWTU1FTV9yYW1fcm86DQo+ID4+Pj4gKyAgICAgICAg
LyogcDJtX3JhbV9ybyBjYW4ndCBiZSByZXByZXNlbnRlZCBpbiBJT01NVSBtYXBwaW5ncy4gKi8N
Cj4gPj4+PiArICAgICAgICBkb21haW5fbG9jayhkKTsNCj4gPj4+PiArICAgICAgICBpZiAoIGhh
c19pb21tdV9wdChkKSApDQo+ID4+Pj4gKyAgICAgICAgICAgIHJjID0gLUVYREVWOw0KPiA+Pj4+
ICsgICAgICAgIGVsc2UNCj4gPj4+PiArICAgICAgICAgICAgZC0+YXJjaC5odm0ucDJtX3JhbV9y
b191c2VkID0gdHJ1ZTsNCj4gPj4+DQo+ID4+PiBEbyB3ZSByZWFsbHkgd2FudCB0aGlzIHRvIGJl
IGEgb25lLXdheSB0cmlwPyBPbiB0aGUgZmFjZSBvZiBpdCwgaXQNCj4gPj4+IHdvdWxkIHNlZW0g
dGhhdCBrZWVwaW5nIGEgY291bnQgb2YgcDJtX3JhbV9ybyBlbnRyaWVzIHdvdWxkIGJlIG1vcmUN
Cj4gPj4+IGRlc2lyYWJsZSBzdWNoIHRoYXQsIG9uY2UgdGhlIGxhc3Qgb25lIGlzIGdvbmUsIGRl
dmljZXMgY2FuIGJlDQo+ID4+PiBhc3NpZ25lZCBhZ2Fpbj8NCj4gPj4NCj4gPj4gV2VsbCwgYXQg
dGhpcyBwb2ludCBJJ20gbm90IHJlYWxseSB1cCB0byBpbnRyb2R1Y2luZyBhY2NvdW50aW5nIG9m
DQo+ID4+IHRoZSBudW1iZXIgb2YgdXNlcyBvZiBwMm1fcmFtX3JvLiBUaGlzIGNvdWxkIGJlIGEg
ZnVydGhlciBzdGVwIHRvDQo+ID4+IGJlIGRvbmUgaW4gdGhlIGZ1dHVyZSwgaWYgbmVjZXNzYXJ5
Lg0KPiA+Pg0KPiA+Pj4gSWYgbm90IG1heWJlIGl0J3MgdGltZSB0byBnbyBhbGwgdGhlIHdheSBh
bmQgbWFrZSBpb21tdSBwYWdlIHRhYmxlDQo+ID4+PiBjb25zdHJ1Y3Rpb24gcGFydCBvZiBkb21h
aW4gY3JlYXRlIGFuZCB0aGVuIHdlIHNpbXBsaWZ5IGEgbG90IG9mDQo+ID4+PiBjb2RlIGFuZCB3
ZSBkb24ndCBuZWVkIGFueSBmbGFnL3JlZmNvdW50IGxpa2UgdGhpcyBhdCBhbGwuDQo+ID4+DQo+
ID4+IEkndmUgc2FpZCB0aGlzIGJlZm9yZTogSSBkb24ndCB0aGluayBpdCBzaG91bGQgYmUgYSBy
ZXF1aXJlbWVudCB0bw0KPiA+PiBrbm93IGF0IHRoZSB0aW1lIG9mIHRoZSBjcmVhdGlvbiBvZiBh
IFZNIHdoZXRoZXIgaXQnbGwgZXZlbnR1YWxseQ0KPiA+PiBoYXZlIGEgcGFzcy10aHJvdWdoIGRl
dmljZSBhc3NpZ25lZC4gRnVydGhlcm1vcmUgeW91IHJlYWxpemUgdGhhdA0KPiA+PiB0aGlzIHN1
Z2dlc3Rpb24gb2YgeW91cnMgaXMgY29udHJhcnkgdG8gd2hhdCB5b3UndmUgc2FpZCBmdXJ0aGVy
IHVwOg0KPiA+PiBUaGlzIHdheSB5b3UnZCBtYWtlIHRoZSB0d28gdGhpbmdzIGV4Y2x1c2l2ZSBv
ZiBvbmUgYW5vdGhlciB3aXRob3V0DQo+ID4+IGFueSByZWNvdXJzZS4NCj4gPg0KPiA+IFllcywg
SSByZWFsaXplIHRoZSBzdWdnZXN0aW9ucyBhcmUgY29udHJhZGljdG9yeS4gTXkgcG9pbnQgaXMg
dGhhdA0KPiA+IGFkZGluZyBJT01NVSBwYWdlcyB0byBhIHJ1bm5pbmcgZG9tYWluIGlzIHRyaWNr
eSBhbmQgbGVhZHMgdG8gaXNzdWVzDQo+ID4gbGlrZSB0aGUgb25lIHlvdSBhcmUgdHJ5aW5nIHRv
IHNvbHZlIHdpdGggdGhlIHJhbV9yb191c2VkIGZsYWcuDQo+ID4gVGhlIHdob2xlIHN1YnN5c3Rl
bSBpcyBpbiBuZWVkIG9mIGFuIG92ZXJoYXVsIGFueXdheSBzbyBJIGd1ZXNzIHRoaXMNCj4gPiBi
YW5kLWFpZCBpcyBvayBmb3Igbm93Lg0KPiANCj4gVGhhbmtzLiBJIHdvbmRlciB3aGV0aGVyIEkg
bWF5IHRyYW5zbGF0ZSB0aGlzIGludG8gUi1iIG9yIEEtYj8NCj4gDQoNClllcywgeW91IGNhbiBj
b25zaWRlciB0aGlzIGFuIFItYi4NCg0KICBQYXVsDQoNCj4gSmFuDQpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhl
bi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3Jn
L21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
