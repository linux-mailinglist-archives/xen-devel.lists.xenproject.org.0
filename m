Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C2B6C1B5908
	for <lists+xen-devel@lfdr.de>; Thu, 23 Apr 2020 12:21:27 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jRYyr-0000b4-GL; Thu, 23 Apr 2020 10:21:17 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wmme=6H=citrix.com=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1jRYyq-0000aR-50
 for xen-devel@lists.xenproject.org; Thu, 23 Apr 2020 10:21:16 +0000
X-Inumbo-ID: 25e3e648-854c-11ea-9e09-bc764e2007e4
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 25e3e648-854c-11ea-9e09-bc764e2007e4;
 Thu, 23 Apr 2020 10:21:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1587637269;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=Qdrl+m80ROoxK7XC/bSwEIx/8r9Om1BCnSG37SUyoqE=;
 b=aTgQrQ8RRcQmWDlHEJNm9dcc+gVsKAR0S/7nbdAR6FT7fapWOcr/idXg
 a6+tMBS0UFku1ingiX8MNGqXMy+vM5ZQMt9nGk3FCLEZnYQ11Ta9hxAeN
 kH4TZz5swHCPVxnsU8lmqNDoYBWfHnKCRdYWk+XL7tFIX2G2Y1CAKQYCH U=;
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=George.Dunlap@citrix.com;
 spf=Pass smtp.mailfrom=George.Dunlap@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 George.Dunlap@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="George.Dunlap@citrix.com";
 x-sender="George.Dunlap@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa5.hc3370-68.iphmx.com: domain of
 George.Dunlap@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="George.Dunlap@citrix.com";
 x-sender="George.Dunlap@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="George.Dunlap@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: P4ReK/0z2/dmlBVctSBcoBjuqdgwkuyGughgFn629lBWAV6pAYQdZI4j5rk1arYqoNuUyXxVcu
 8TUi1VG3YMq9uX9eP2lH7ZQ5UE28ecSdIIynw2GNE37g5b3MllfLU3rpB9Q+HUe1QFihVHZUIb
 BysRo1ot3YoElvRecOhywT0ZpRRgEzhLgUbfmUTUWIYz8/1M7+74ZQ5M/OuZhhMkNlGHP5xOGK
 E1u+I9UeBQKpNNWlaWrINaDQHW0ekU8NXrekH5DszVDWV7sDIgvlOpXMhBZHZB7OpbMP2X3Z3R
 BCA=
X-SBRS: 2.7
X-MesageID: 16434517
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,306,1583211600"; d="scan'208";a="16434517"
From: George Dunlap <George.Dunlap@citrix.com>
To: Nick Rosbrook <rosbrookn@gmail.com>
Subject: Re: [PATCH 1/4] golang/xenlight: add NameToDomid and DomidToName util
 functions
Thread-Topic: [PATCH 1/4] golang/xenlight: add NameToDomid and DomidToName
 util functions
Thread-Index: AQHWERYbx3dgi/1zV0KyTdtBFGxU1KiFXiqAgAAbqgCAAPRDgA==
Date: Thu, 23 Apr 2020 10:21:05 +0000
Message-ID: <ACBE3271-80FD-405A-A1A2-A07A3597A47D@citrix.com>
References: <cover.1586727061.git.rosbrookn@ainfosec.com>
 <e2d8d6c1293c8251be881cd471265aa8188ae2ae.1586727061.git.rosbrookn@ainfosec.com>
 <65721F76-319A-47E4-8184-116F02B2BCE3@citrix.com>
 <CAEBZRSckvUqCikFhtHECzmybwC_d8ojCfvBznvF90A7pS1A_1Q@mail.gmail.com>
In-Reply-To: <CAEBZRSckvUqCikFhtHECzmybwC_d8ojCfvBznvF90A7pS1A_1Q@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3608.60.0.2.5)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
Content-Type: text/plain; charset="utf-8"
Content-ID: <C62B93E4BF4DC04BBEB176E85B751182@citrix.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Nick Rosbrook <rosbrookn@ainfosec.com>,
 xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>,
 Ian Jackson <Ian.Jackson@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

DQoNCj4gT24gQXByIDIyLCAyMDIwLCBhdCA4OjQ2IFBNLCBOaWNrIFJvc2Jyb29rIDxyb3Nicm9v
a25AZ21haWwuY29tPiB3cm90ZToNCj4gDQo+PiBsaWJ4bC5oIGRlZmluZXMgSU5WQUxJRF9ET01J
RCDigJQgZG8gd2Ugd2FudCB0byBkZWZpbmUgYW4gZXhwb3J0ZWQgY29uc3RhbnQgd2l0aCB0aGUg
c2FtZSBuYW1lIGFuZCB1c2UgdGhhdCBoZXJlPyAgKEFsdGhvdWdoIHBhcnQgb2YgbWUgd29uZGVy
cyBpZiBET01JRF9JTlZBTElEIHdvdWxkIGJlIGEgYmV0dGVyIG9wdGlvbi4pDQo+IA0KPiBZZWFo
LCB0aGF0IG1ha2VzIHNlbnNlLiBJJ2xsIGFkZCB0aGF0Lg0KPiANCj4+PiArICAgICB9DQo+Pj4g
Kw0KPj4+ICsgICAgIHJldHVybiBEb21pZChkb21pZCksIG5pbA0KPj4+ICt9DQo+Pj4gKw0KPj4+
ICsvLyBEb21pZFRvTmFtZSByZXR1cm5zIHRoZSBuYW1lIGZvciBhIGRvbWFpbiwgZ2l2ZW4gaXRz
IGRvbWlkLg0KPj4+ICtmdW5jIChDdHggKkNvbnRleHQpIERvbWlkVG9OYW1lKGRvbWlkIERvbWlk
KSBzdHJpbmcgew0KPj4+ICsgICAgIGNuYW1lIDo9IEMubGlieGxfZG9taWRfdG9fbmFtZShDdHgu
Y3R4LCBDLnVpbnQzMl90KGRvbWlkKSkNCj4+PiArICAgICBkZWZlciBDLmZyZWUodW5zYWZlLlBv
aW50ZXIoY25hbWUpKQ0KPj4+ICsNCj4+PiArICAgICByZXR1cm4gQy5Hb1N0cmluZyhjbmFtZSkN
Cj4+PiArfQ0KPj4gDQo+PiBJdCBsb29rcyB0byBtZSBsaWtlIGlmIHRoZSBkb21pZCBkb2VzbuKA
mXQgZXhpc3QsIGxpYnhsX2RvbWlkX3RvX25hbWUoKSB3aWxsIHJldHVybiBOVUxMOyBhbmQgdGhl
biBEb21pZFRvTmFtZSB3aWxsIHJldHVybiDigJzigJ0uICBJcyB0aGF0IHdoYXQgd2Ugd2FudD8N
Cj4+IA0KPj4gSWYgc28sIGl0IHNob3VsZCBwcm9iYWJseSBiZSBkb2N1bWVudGVkLg0KPiANCj4g
SSBjb25zaWRlcmVkIHJldHVybmluZyBhbiBlcnJvciBpZiBDLkdvU3RyaW5nKGNuYW1lKSA9PSAi
Ii4gQnV0LCB3aXRoDQo+IHRoZXNlIGZ1bmN0aW9ucyAoYXMgd2VsbCBhcyB0aGUgb3RoZXJzIGlu
IHRoZXNlIHNlcmllcyksIEkgb3B0ZWQgdG8NCj4ga2VlcCB0aGUgc2lnbmF0dXJlcyBhbGlnbmVk
IHdpdGggdGhlaXIgbGlieGwgY291bnRlcnBhcnRzIHNpbmNlIHdlJ3JlDQo+IGtlZXBpbmcgdGhl
IHBhY2thZ2UgQVBJIG1vc3RseSBvbmUtdG8tb25lIHdpdGggbGlieGwuIEkgY2FuIGFkZCBhDQo+
IHNlY29uZCByZXR1cm4gdmFsdWUgaWYgeW91IHByZWZlciwgb3RoZXJ3aXNlIEknbGwganVzdCBh
ZGQgYSBub3RlIGluDQo+IHRoZSBjb21tZW50Lg0KDQpPSyDigJQgYWRkaW5nIGEgbm90ZSBpbiB0
aGUgY29tbWVudCBpcyBmaW5lLiAgSSBtYWlubHkgd2FudGVkIHRvIG1ha2Ugc3VyZSB0aGUgcXVl
c3Rpb24gaGFkIGFjdHVhbGx5IGJlZW4gY29uc2lkZXJlZCAoYWx0aG91Z2ggb2YgY291cnNlIGRv
Y3VtZW50aW5nIHRoYXQgYmVoYXZpb3IgaXMgYWxzbyBpbXBvcnRhbnQpLg0KDQpUaGFua3MsDQog
LUdlb3JnZQ0KDQo=

