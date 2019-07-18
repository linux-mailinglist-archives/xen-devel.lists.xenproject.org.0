Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4343F6CBAE
	for <lists+xen-devel@lfdr.de>; Thu, 18 Jul 2019 11:19:09 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ho2Wq-0005Hy-LL; Thu, 18 Jul 2019 09:16:44 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=04i1=VP=citrix.com=paul.durrant@srs-us1.protection.inumbo.net>)
 id 1ho2Wp-0005Hp-0k
 for xen-devel@lists.xenproject.org; Thu, 18 Jul 2019 09:16:43 +0000
X-Inumbo-ID: beddec0a-a93c-11e9-87ae-9f8edcfc4e02
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id beddec0a-a93c-11e9-87ae-9f8edcfc4e02;
 Thu, 18 Jul 2019 09:16:38 +0000 (UTC)
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
IronPort-SDR: DxrZ9Ok9Yp1qpBYswGmSMh5TtnECy0vPTYCyQzeG963vXkg2DVv2gfq1Mk8ZQHgrwnD69yxbRH
 pM8QGQZzel+59733RWiXT8Ko1ZrOd3+0WPsH6atu3vXeD2CzChAZfsBDeh9aSrMGTqwp115074
 vbrXP0dUzpFI5wafpWVsGu2bkmyTLocXBwxliB0jI8D5ouQLCnas6P4nX0KP03aMjS37ArGDCL
 A/E0r3OZ4Mzu3pVfd4mlnrmFzE/DcRFHh4uHG7h5CfbLDguhRY6Ozm/gUnGX5He1iHrvN1TIQa
 WvQ=
X-SBRS: 2.7
X-MesageID: 3186299
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,276,1559534400"; 
   d="scan'208";a="3186299"
From: Paul Durrant <Paul.Durrant@citrix.com>
To: 'Juergen Gross' <jgross@suse.com>, Andrew Cooper
 <Andrew.Cooper3@citrix.com>, Sarah Newman <srn@prgmr.com>, "Foerster,
 Leonard" <foersleo@amazon.com>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>
Thread-Topic: [Xen-devel] Design session report: Live-Updating Xen
Thread-Index: AQHVOz84rrbZg3jr7UWo9Co44cwhi6bL78oAgACK1oCAAAkLgIABL7QAgAJDEoCAACXQ8A==
Date: Thu, 18 Jul 2019 09:16:32 +0000
Message-ID: <645b46391ce54922b18ff62f49006604@AMSPEX02CL03.citrite.net>
References: <1563217075.6815.14.camel@amazon.com>
 <86e560c4-5a14-75fd-8b06-a77e66a8f0a5@prgmr.com>
 <35baad47-f22c-2378-a7a5-f0c48c3eafb8@suse.com>
 <aca2e606-17fa-6266-1e9c-1989d4da6217@prgmr.com>
 <9d6fc9d6-f63a-ae65-bbfa-5e489fda9acf@citrix.com>
 <5274084e-ea01-8c61-5ca5-75bbe7ea987a@suse.com>
In-Reply-To: <5274084e-ea01-8c61-5ca5-75bbe7ea987a@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
MIME-Version: 1.0
Subject: Re: [Xen-devel] Design session report: Live-Updating Xen
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBYZW4tZGV2ZWwgPHhlbi1kZXZl
bC1ib3VuY2VzQGxpc3RzLnhlbnByb2plY3Qub3JnPiBPbiBCZWhhbGYgT2YgSnVlcmdlbiBHcm9z
cw0KPiBTZW50OiAxOCBKdWx5IDIwMTkgMTA6MDANCj4gVG86IEFuZHJldyBDb29wZXIgPEFuZHJl
dy5Db29wZXIzQGNpdHJpeC5jb20+OyBTYXJhaCBOZXdtYW4gPHNybkBwcmdtci5jb20+OyBGb2Vy
c3RlciwgTGVvbmFyZA0KPiA8Zm9lcnNsZW9AYW1hem9uLmNvbT47IHhlbi1kZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZw0KPiBTdWJqZWN0OiBSZTogW1hlbi1kZXZlbF0gRGVzaWduIHNlc3Npb24g
cmVwb3J0OiBMaXZlLVVwZGF0aW5nIFhlbg0KPiANCj4gT24gMTcuMDcuMTkgMDA6MjcsIEFuZHJl
dyBDb29wZXIgd3JvdGU6DQo+ID4gT24gMTYvMDcvMjAxOSAwNToyMCwgU2FyYWggTmV3bWFuIHdy
b3RlOg0KPiA+PiBPbiA3LzE1LzE5IDg6NDggUE0sIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6DQo+ID4+
PiBPbiAxNS4wNy4xOSAyMTozMSwgU2FyYWggTmV3bWFuIHdyb3RlOg0KPiA+Pj4+IE9uIDcvMTUv
MTkgMTE6NTcgQU0sIEZvZXJzdGVyLCBMZW9uYXJkIHdyb3RlOg0KPiA+Pj4+IC4uLg0KPiA+Pj4+
PiBBIGtleSBjb3JuZXJzdG9uZSBmb3IgTGl2ZS11cGRhdGUgaXMgZ3Vlc3QgdHJhbnNwYXJlbnQg
bGl2ZSBtaWdyYXRpb24NCj4gPj4+PiAuLi4NCj4gPj4+Pj4gIMKgwqDCoMKgLT4gZm9yIGxpdmUg
bWlncmF0aW9uOiBkb21pZCBpcyBhIHByb2JsZW0gaW4gdGhpcyBjYXNlDQo+ID4+Pj4+ICDCoMKg
wqDCoMKgwqDCoCAtPiByYW5kb21pemUgYW5kIHByYXkgZG9lcyBub3Qgd29yayBvbiBzbWFsbGVy
IGZsZWV0cw0KPiA+Pj4+PiAgwqDCoMKgwqDCoMKgwqAgLT4gdGhpcyBpcyBub3QgYSBwcm9ibGVt
IGZvciBsaXZlLXVwZGF0ZQ0KPiA+Pj4+PiAgwqDCoMKgwqDCoMKgwqAgLT4gQlVUOiBhcyBhIGNv
bW11bml0eSB3ZSBzaG91ZGwgbWFrZSB0aGlzIHJlc3RyaWN0aW9uIGdvIGF3YXkNCj4gPj4+Pg0K
PiA+Pj4+IEFuZHJldyBDb29wZXIgcG9pbnRlZCBvdXQgdG8gbWUgdGhhdCBtYW51YWxseSBhc3Np
Z25pbmcgZG9tYWluIElEcw0KPiA+Pj4+IGlzIHN1cHBvcnRlZCBpbiBtdWNoIG9mIHRoZSBjb2Rl
IGFscmVhZHkuIElmIGd1ZXN0IHRyYW5zcGFyZW50IGxpdmUNCj4gPj4+PiBtaWdyYXRpb24gZ2V0
cyBtZXJnZWQsIHdlJ2xsIGxvb2sgYXQgcGFzc2luZyBpbiBhIGRvbWFpbiBJRCB0byB4bCwNCj4g
Pj4+PiB3aGljaCB3b3VsZCBiZSBnb29kIGVub3VnaCBmb3IgdXMuIEkgZG9uJ3Qga25vdyBhYm91
dCB0aGUgb3RoZXINCj4gPj4+PiB0b29sc3RhY2tzLg0KPiA+Pj4NCj4gPj4+IFRoZSBtYWluIHBy
b2JsZW0gaXMgdGhlIGNhc2Ugd2hlcmUgb24gdGhlIHRhcmdldCBob3N0IHRoZSBkb21pZCBvZiB0
aGUNCj4gPj4+IG1pZ3JhdGVkIGRvbWFpbiBpcyBhbHJlYWR5IGluIHVzZSBieSBhbm90aGVyIGRv
bWFpbi4gU28geW91IGVpdGhlciBuZWVkDQo+ID4+PiBhIGRvbWlkIGFsbG9jYXRvciBzcGFubmlu
ZyBhbGwgaG9zdHMgb3IgdGhlIGNoYW5nZSBvZiBkb21pZCBkdXJpbmcNCj4gPj4+IG1pZ3JhdGlv
biBtdXN0IGJlIGhpZGRlbiBmcm9tIHRoZSBndWVzdCBmb3IgZ3Vlc3QgdHJhbnNwYXJlbnQgbWln
cmF0aW9uLg0KPiA+Pg0KPiA+PiBZZXMuIFRoZXJlIGFyZSBzb21lIGNsdXN0ZXIgbWFuYWdlbWVu
dCBzeXN0ZW1zIHdoaWNoIHVzZSB4bCByYXRoZXINCj4gPj4gdGhhbiB4YXBpLg0KPiA+PiBUaGV5
IGNvdWxkIGJlIGV4dGVuZGVkIHRvIG1hbmFnZSBkb21haW4gSURzIGlmIGl0J3MgdG9vIGRpZmZp
Y3VsdCB0bw0KPiA+PiBhbGxvdw0KPiA+PiB0aGUgZG9tYWluIElEIHRvIGNoYW5nZSBkdXJpbmcg
bWlncmF0aW9uLg0KPiA+DQo+ID4gRm9yIGEgdjEgZmVhdHVyZSwgaGF2aW5nIGEgcmVzdHJpY3Rp
b24gb2YgInlvdSBtdXN0IG1hbmFnZSBkb21pZHMgYWNyb3NzDQo+ID4gdGhlIGNsdXN0ZXIiIGlz
IGEgZmluZS7CoCBHdWVzdC10cmFuc3BhcmVudCBtaWdyYXRpb24gaXMgYSB2ZXJ5IGltcG9ydGFu
dA0KPiA+IGZlYXR1cmUsIGFuZCBvbmUgd2hlcmUgd2UgYXJlIGxhY2tpbmcgaW4gcmVsYXRpb24g
dG8gb3RoZXIgaHlwZXJ2aXNvcnMuDQo+ID4NCj4gPiBMb25nZXIgdGVybSwgd2UgYXMgdGhlIFhl
biBjb21tdW5pdHkgbmVlZCB0byBmaWd1cmUgb3V0IGEgd2F5IHRvIHJlbW92ZQ0KPiA+IHRoZSBk
ZXBlbmRlbmN5IG9uIGRvbWlkcywgYXQgd2hpY2ggcG9pbnQgdGhlIGNsdXN0ZXItd2lkZSBtYW5h
Z2VtZW50DQo+ID4gcmVzdHJpY3Rpb24gY2FuIGJlIGRyb3BwZWQuwqAgVGhpcyBpc24ndCBnb2lu
ZyB0byBiZSBhIHRyaXZpYWwgdGFzaywgYnV0DQo+ID4gaXQgd2lsbCBiZSBhIHdvcnRod2hpbGUg
b25lLg0KPiANCj4gQW5vdGhlciBwcm9ibGVtIGFyZSBYZW5zdG9yZSB3YXRjaGVzLiBXaXRoIGd1
ZXN0IHRyYW5zcGFyZW50IExNIHRoZXkgYXJlDQo+IGxvc3QgdG9kYXkgYXMgdGhlcmUgaXMgY3Vy
cmVudGx5IG5vIHdheSB0byBtaWdyYXRlIHRoZW0gdG8gdGhlIHRhcmdldA0KPiBYZW5zdG9yZS4N
Cj4gDQo+IExpdmUtVXBkYXRlIGNvdWxkIHdvcmsgYXJvdW5kIHRoaXMgaXNzdWUgdmlhIFhlbnN0
b3JlLXN0dWJkb20uDQoNCldhdGNoZXMgYXJlIG9uZSBwcm9ibGVtLiBUaGVyZSdzIGFsc28gdGhl
IHByb2JsZW0gb2YgcGVuZGluZyB0cmFuc2FjdGlvbnMuDQoNCiAgUGF1bA0KDQo+IA0KPiANCj4g
SnVlcmdlbg0KPiANCj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18NCj4gWGVuLWRldmVsIG1haWxpbmcgbGlzdA0KPiBYZW4tZGV2ZWxAbGlzdHMueGVucHJv
amVjdC5vcmcNCj4gaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L3hlbi1kZXZlbA0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcK
aHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
