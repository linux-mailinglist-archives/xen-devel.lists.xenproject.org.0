Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 589C05B821
	for <lists+xen-devel@lfdr.de>; Mon,  1 Jul 2019 11:36:54 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hhsea-0008Cj-CL; Mon, 01 Jul 2019 09:31:16 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=vScv=U6=citrix.com=paul.durrant@srs-us1.protection.inumbo.net>)
 id 1hhseZ-0008Ce-Au
 for xen-devel@lists.xenproject.org; Mon, 01 Jul 2019 09:31:15 +0000
X-Inumbo-ID: f7d787ae-9be2-11e9-8980-bc764e045a96
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id f7d787ae-9be2-11e9-8980-bc764e045a96;
 Mon, 01 Jul 2019 09:31:13 +0000 (UTC)
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
IronPort-SDR: d5x1TyZFI8sB+UPqE2IbLajZk7tWQ40FaOxGBfvrtd+5b7sk9CsLEMH+2bfLnfXrftcTEP915H
 5jw7urpv4VCfPUyEVyLohp7W1XovrJgdQC/L0VhoHEJmKDP//0bZb2zvCUIxWzuWkDDZDVrAZz
 mGWRReAVoHbMp8P9DKUxG5IccCMaJnh0N7b9Xtb9aj+b1vdUnhPu3s8VacLUlW9/jSiAtGl/yN
 XBYw8K9INYgcf+/3ayPLYKZUvOIPgrRzHoRwR4TL6dn8csNMNiRHWHoql+2vHOKx7K0Iwu30CC
 WAo=
X-SBRS: 2.7
X-MesageID: 2453875
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.63,438,1557201600"; 
   d="scan'208";a="2453875"
From: Paul Durrant <Paul.Durrant@citrix.com>
To: 'Petre Ovidiu PIRCALABU' <ppircalabu@bitdefender.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Andrew
 Cooper" <Andrew.Cooper3@citrix.com>
Thread-Topic: vfree crash
Thread-Index: AQHVLdtKR3tMnDvHzU6ntSjZrlUsUaa1cLWAgAAGYACAAAF2gIAACeQAgAAAOkA=
Date: Mon, 1 Jul 2019 09:31:10 +0000
Message-ID: <e2de6a8377874c2ab8a7ba4895af3061@AMSPEX02CL03.citrite.net>
References: <19d3bbfa82ffe542367c676d83db65e37d013544.camel@bitdefender.com>
 <e277e40ad1c54b209a6f6107cbfaf5a0@AMSPEX02CL03.citrite.net>
 <527abac0d7a9a25bb69c7af30afa8ab209c90737.camel@bitdefender.com>
 <e131d31b93504843a72b72e22afb41ff@AMSPEX02CL03.citrite.net>
 <8b12e9a15bed0121a885a2004266350d007db31b.camel@bitdefender.com>
In-Reply-To: <8b12e9a15bed0121a885a2004266350d007db31b.camel@bitdefender.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
MIME-Version: 1.0
Subject: Re: [Xen-devel] vfree crash
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
Cc: Alexandru Stefan ISAILA <aisaila@bitdefender.com>,
 "rcojocaru@bitdefender.com" <rcojocaru@bitdefender.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBQZXRyZSBPdmlkaXUgUElSQ0FM
QUJVIDxwcGlyY2FsYWJ1QGJpdGRlZmVuZGVyLmNvbT4NCj4gU2VudDogMDEgSnVseSAyMDE5IDEw
OjI3DQo+IFRvOiBQYXVsIER1cnJhbnQgPFBhdWwuRHVycmFudEBjaXRyaXguY29tPjsgeGVuLWRl
dmVsQGxpc3RzLnhlbnByb2plY3Qub3JnOyBBbmRyZXcgQ29vcGVyDQo+IDxBbmRyZXcuQ29vcGVy
M0BjaXRyaXguY29tPg0KPiBDYzogQWxleGFuZHJ1IFN0ZWZhbiBJU0FJTEEgPGFpc2FpbGFAYml0
ZGVmZW5kZXIuY29tPjsgcmNvam9jYXJ1QGJpdGRlZmVuZGVyLmNvbQ0KPiBTdWJqZWN0OiBSZTog
dmZyZWUgY3Jhc2gNCj4gDQo+IE9uIE1vbiwgMjAxOS0wNy0wMSBhdCAwODo1NSArMDAwMCwgUGF1
bCBEdXJyYW50IHdyb3RlOg0KPiA+ID4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gPiA+
IEZyb206IFBldHJlIE92aWRpdSBQSVJDQUxBQlUgPHBwaXJjYWxhYnVAYml0ZGVmZW5kZXIuY29t
Pg0KPiA+ID4gU2VudDogMDEgSnVseSAyMDE5IDA5OjQ2DQo+ID4gPiBUbzogUGF1bCBEdXJyYW50
IDxQYXVsLkR1cnJhbnRAY2l0cml4LmNvbT47DQo+ID4gPiB4ZW4tZGV2ZWxAbGlzdHMueGVucHJv
amVjdC5vcmc7IEFuZHJldyBDb29wZXINCj4gPiA+IDxBbmRyZXcuQ29vcGVyM0BjaXRyaXguY29t
Pg0KPiA+ID4gQ2M6IEFsZXhhbmRydSBTdGVmYW4gSVNBSUxBIDxhaXNhaWxhQGJpdGRlZmVuZGVy
LmNvbT47DQo+ID4gPiByY29qb2NhcnVAYml0ZGVmZW5kZXIuY29tDQo+ID4gPiBTdWJqZWN0OiBS
ZTogdmZyZWUgY3Jhc2gNCj4gPiA+DQo+ID4gPiBPbiBNb24sIDIwMTktMDctMDEgYXQgMDg6Mjkg
KzAwMDAsIFBhdWwgRHVycmFudCB3cm90ZToNCj4gPiA+ID4gPiAtLS0tLU9yaWdpbmFsIE1lc3Nh
Z2UtLS0tLQ0KPiA+ID4gPiA+IEZyb206IFhlbi1kZXZlbCA8eGVuLWRldmVsLWJvdW5jZXNAbGlz
dHMueGVucHJvamVjdC5vcmc+IE9uDQo+ID4gPiA+ID4gQmVoYWxmDQo+ID4gPiA+ID4gT2YgUGV0
cmUgT3ZpZGl1IFBJUkNBTEFCVQ0KPiA+ID4gPiA+IFNlbnQ6IDI4IEp1bmUgMjAxOSAxOTowMA0K
PiA+ID4gPiA+IFRvOiB4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmc7IEFuZHJldyBDb29w
ZXIgPA0KPiA+ID4gPiA+IEFuZHJldy5Db29wZXIzQGNpdHJpeC5jb20+DQo+ID4gPiA+ID4gQ2M6
IEFsZXhhbmRydSBTdGVmYW4gSVNBSUxBIDxhaXNhaWxhQGJpdGRlZmVuZGVyLmNvbT47DQo+ID4g
PiA+ID4gcmNvam9jYXJ1QGJpdGRlZmVuZGVyLmNvbQ0KPiA+ID4gPiA+IFN1YmplY3Q6IFtYZW4t
ZGV2ZWxdIHZmcmVlIGNyYXNoDQo+ID4gPiA+ID4NCj4gPiA+ID4gPiBIZWxsbywNCj4gPiA+ID4g
Pg0KPiA+ID4gPiA+IEkgbmVlZCB5b3VyIGhlbHAgdG8gcGlucG9pbnQgdGhlIHJvb3QgY2F1c2Ug
b2YgYSBwcm9ibGVtLiBUbyBteQ0KPiA+ID4gPiA+IHVuZGVyc3RhbmRpbmcgdmZyZWUgc2hvdWxk
IGJlIHVzZWQgd2hlbiBhbGxvY2F0aW5nIG1lbW9yeSB3aXRoDQo+ID4gPiA+ID4gdm1hbGxvYy4N
Cj4gPiA+ID4gPg0KPiA+ID4gPiA+IEJ1dCwgSSBoYXZlIHRoZSBmb2xsb3dpbmcgc2NlbmFyaW8g
d2hpY2ggcmVzdWx0cyBpbiBhIFhFTg0KPiA+ID4gPiA+IGNyYXNoOg0KPiA+ID4gPiA+IC0gYWxs
b2NhdGUgYSBudW1iZXIgb2YgZnJhbWVzIHVzaW5nIHZtYWxsb2MgKHZ6YWxsb2MpIChlLmcuDQo+
ID4gPiA+ID4gdXNpbmcgYQ0KPiA+ID4gPiA+IGRvbWN0bCkgYW5kIGFzc2lnbiB0aGVtIHRvIHRo
ZSBjYWxsaW5nIGRvbWFpbg0KPiA+ID4gPiA+IC0gbWFwIHRoZSBmcmFtZXMgdXNpbmcgeGVuZm9y
ZWlnbm1lbW9yeV9tYXBfcmVzb3VyY2UNCj4gPiA+ID4NCj4gPiA+ID4gRG8geW91IHJlYWxseSBt
ZWFuIHhlbmZvcmVpZ25tZW1vcnlfbWFwX3Jlc291cmNlKCk/IElmIHRoZSBtZW1vcnkNCj4gPiA+
ID4gaXMNCj4gPiA+ID4gYXNzaWduZWQgdG8gdGhlIGNhbGxpbmcgZG9tYWluIHRoZW4gdGhpcyBp
cyBxdWl0ZSBsaWtlbHkgbm90IHRvDQo+ID4gPiA+IHdvcmsuDQo+ID4gPiA+IFRoZXJlIHdlcmUg
cmVmZXJlbmNlIGNvdW50aW5nIHByb2JsZW1zIHdpdGggdGhhdCBjb2RlLCB3aGljaCBpcw0KPiA+
ID4gPiB3aHkNCj4gPiA+ID4gY2FsbGVyIGFzc2lnbmVkIHJlc291cmNlcyB3ZXJlIGRyb3BwZWQu
DQo+ID4gPiA+DQo+ID4gPiA+ICAgUGF1bA0KPiA+ID4gPg0KPiA+ID4NCj4gPiA+IFRoZSBwcm9i
bGVtIGxpZXMgd2l0aCB2ZnJlZSBiZWNhdXNlIGl0IGNyZWF0ZXMgYSBuZXcgbGlzdCB3aXRoIHRo
ZQ0KPiA+ID4gcGFnZXMsIHVubWFwcyB0aGUgdmEgcG9pbnRlciBhbmQgdGhlbiBmcmVlcyB0aGUg
cGFnZXMuIElmIEkgZG8NCj4gPiA+IHRoZXNlDQo+ID4gPiBzdGVwcyBtYW51YWxseSAod2l0aG91
dCBhZGRpbmcgdGhlbSB0byBhIG5ldyBsaXN0KSBpdCB3b3Jrcy4NCj4gPg0KPiA+IFNvLCBsb29r
aW5nIGF0IHRoZSBjb2RlLCBJIGRvbid0IHRoaW5rIGl0IGlzIGludGVuZGVkIHRoYXQNCj4gPiB2
W218el1hbGxvY2VkIHBhZ2VzIGdldCBhc3NpZ25lZCB0byBhIGRvbWFpbi4gQ291bGQgeW91IHBv
aW50IGF0DQo+ID4gd2hlcmUgdGhlIGFzc2lnbm1lbnQgaXMgaGFwcGVuaW5nPw0KPiA+DQo+ID4g
ICBQYXVsDQo+ID4NCj4gPiA+DQo+ID4gPiBNYW55IHRoYW5rcywNCj4gPiA+IFBldHJlDQo+ID4g
Pg0KPiANCj4gSSdtIGRvaW5nIGl0IGxvY2FsbHkgaW4gbXkgdGVzdCAobW9ja19lbmFibGUgZG9t
Y3RsKSBieSBjYWxsaW5nDQo+IGFzc2lnbl9wYWdlcyBmb3IgZWFjaCBvbmUgYWxsb2NhdGVkIGJ5
IHZ6YWxsb2MuDQo+IA0KPiBodHRwczovL2dpdGxhYi5jb20veGVuLXByb2plY3QvcGVvcGxlL2Jp
dGRlZmVuZGVyL3hlbi9ibG9iL3ZmcmVlX2NyYXNoL3hlbi9jb21tb24vbW9jay5jDQo+IChsaW5l
IDU1KQ0KDQpJJ20gZ2V0dGluZyBhIDQwNCBmb3IgdGhhdCBVUkwuIEJ1dCwgYXMgQW5keSBzYXlz
LCB0aGUgcHJvYmxlbSBpcyB0aGF0IGFzc2lnbmluZyB0byBhIGRvbWFpbiB3aWxsIHBsYWNlIHRo
ZSBwYWdlIG9uIGEgbGlzdCBhbmQgdGhhdCB3aWxsIHRoZW4gbWVhbiB5b3UncmUgZ29ubmEgaGF2
ZSBwcm9ibGVtcyBjYWxsaW5nIHZmcmVlKCkuDQoNCiAgUGF1bA0KDQo+IA0KPiBNYW55IHRoYW5r
cywNCj4gUGV0cmUNCg0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5v
cmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZl
bA==
