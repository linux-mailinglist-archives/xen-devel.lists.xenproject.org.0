Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E2576E2E5
	for <lists+xen-devel@lfdr.de>; Fri, 19 Jul 2019 10:51:45 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hoOY1-0003UY-Ty; Fri, 19 Jul 2019 08:47:25 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=9kIP=VQ=citrix.com=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1hoOY0-0003US-6M
 for xen-devel@lists.xenproject.org; Fri, 19 Jul 2019 08:47:24 +0000
X-Inumbo-ID: d3392fe8-aa01-11e9-8980-bc764e045a96
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id d3392fe8-aa01-11e9-8980-bc764e045a96;
 Fri, 19 Jul 2019 08:47:22 +0000 (UTC)
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
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="George.Dunlap@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: Sltrcjt+yooRhk/CrHOjzP3476Dt26zBdZWHrfAwMgYpCHhsXgQvz53oG7OIrjevaBb7Me7KZ4
 RxvzNLJujAEkEnwx8DzLawTCw03qi2I+h38gyquj/WA1YRFLHWBBZLyRUkKgFG7LkQhJUSjP+a
 fUO49TDtlnHsM6ZyZlJcGIXp/eelbXebjPAbDffUqWC6nPVPGS/vWg04oGI27USeYRKOnMWJtD
 lXmahLTXEru/ro1QbkFp7pqFqBNk821cZ5fkK8TH9HqmiyjZI0rrSgu7T3X3RZ3XDXcWJf4+13
 E44=
X-SBRS: 2.7
X-MesageID: 3246206
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,281,1559534400"; 
   d="scan'208";a="3246206"
From: George Dunlap <George.Dunlap@citrix.com>
To: Nicolas Belouin <nicolas.belouin@gandi.net>
Thread-Topic: [PATCH] golang/xenlight: Add libxl_utils support
Thread-Index: AQHVPbNjc95pGkfIQkWl7AokKBvwWKbRa8uAgAAUawA=
Date: Fri, 19 Jul 2019 08:47:19 +0000
Message-ID: <643C0338-ACDB-4581-A16C-0DFCC22C7C07@citrix.com>
References: <20190718215428.6727-1-george.dunlap@citrix.com>
 <854f62f4-000c-d090-320e-5097887e02b4@gandi.net>
In-Reply-To: <854f62f4-000c-d090-320e-5097887e02b4@gandi.net>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3445.104.11)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
Content-ID: <9B9DF0ED9E83514DA6156E59EC24D8EA@citrix.com>
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH] golang/xenlight: Add libxl_utils support
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
Cc: xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>,
 Ian Jackson <Ian.Jackson@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

DQoNCj4gT24gSnVsIDE5LCAyMDE5LCBhdCA4OjM0IEFNLCBOaWNvbGFzIEJlbG91aW4gPG5pY29s
YXMuYmVsb3VpbkBnYW5kaS5uZXQ+IHdyb3RlOg0KPiANCj4gDQo+IA0KPiBPbiA3LzE4LzE5IDEx
OjU0IFBNLCBHZW9yZ2UgRHVubGFwIHdyb3RlOg0KPj4gVGhlIEdvIGJpbmRpbmdzIGZvciBsaWJ4
bCBtaXNzIGZ1bmN0aW9ucyBmcm9tIGxpYnhsX3V0aWxzLCBsZXQncyBzdGFydA0KPj4gd2l0aCB0
aGUgc2ltcGxlIGxpYnhsX2RvbWlkX3RvX25hbWUgYW5kIGl0cyBjb3VudGVycGFydA0KPj4gbGli
eGxfbmFtZV90b19kb21pZC4NCj4+IA0KPj4gTkIgdGhhdCBDLkdvU3RyaW5nKCkgd2lsbCByZXR1
cm4gIiIgaWYgaXQncyBwYXNzZWQgYSBOVUxMOyBzZWUNCj4+IGh0dHBzOi8vZ2l0aHViLmNvbS9n
b2xhbmcvZ28vaXNzdWVzLzMyNzM0I2lzc3VlY29tbWVudC01MDY4MzU0MzINCj4+IA0KPj4gU2ln
bmVkLW9mZi1ieTogTmljb2xhcyBCZWxvdWluIDxuaWNvbGFzLmJlbG91aW5AZ2FuZGkubmV0Pg0K
Pj4gU2lnbmVkLW9mZi1ieTogR2VvcmdlIER1bmxhcCA8Z2VvcmdlLmR1bmxhcEBjaXRyaXguY29t
Pg0KPj4gLS0tDQo+PiB2MzoNCj4+IC0gV2lyZSBpbnRvIGJ1aWxkIHN5c3RlbQ0KPj4gLSBBZGQg
cmVmZXJlbmNlIHRvIEMuR29TdHJpbmcoKSBoYW5kbGluZyBOVUxMIHRvIGNvbW1pdCBtZXNzYWdl
DQo+PiANCj4+IE5pY29sYXMsIGNvdWxkIHlvdSB0ZXN0IHRvIHNlZSBpZiB0aGlzIGFjdHVhbGx5
IHdvcmtzIGZvciB5b3U/DQo+IFRlc3RlZCBpdCwgaXQgd29ya3MuDQo+IA0KPiBJIG11c3QgY29u
ZmVzcyBJIGRvIG5vdCB1c2UgdGhhdCBpbXBvcnQgcGF0aCBhcyB0aGUgbmV3IG1vZHVsZXMgbWVj
aGFuaXNtDQo+IGludHJvZHVjZWQgaW4gR28xLjExIGRvd25sb2FkcyBhbmQgY29tcGlsZSBhIHZl
cnNpb25lZCBjb3B5IG9mIGV2ZXJ5DQo+IGRlcGVuZGVuY3kgcGVyIHByb2plY3QsIGFuZCB0aGlz
IGJlaGF2aW9yIGlzIGluY29tcGF0aWJsZSB3aXRoIHRoZSBidWlsZA0KPiBzeXN0ZW0gdXNlZCBo
ZXJlLg0KDQpJdOKAmXMgcG9zc2libGUgdGhhdCBzb21ldGhpbmcgZnVuZGFtZW50YWxseSBoYXMg
Y2hhbmdlZCwgYnV0IEkgc3VzcGVjdCB0aGF0IHJhdGhlciB5b3UgZG9u4oCZdCBxdWl0ZSB1bmRl
cnN0YW5kIGhvdyB0aGUgY3VycmVudCBidWlsZCBzeXN0ZW0gaXMgc3VwcG9zZWQgdG8gd29yay4g
IChJbiB3aGljaCBjYXNlIGEgd3JpdGUtdXAgaW4gdGhlIHRyZWUgd291bGQgcHJvYmFibHkgYmUg
dXNlZnVsLikNCg0KR28gaGFzIGFsd2F5cyBpbnNpc3RlZCB0aGF0IHRoZXJlIGJlIG5vIGJpbmFy
eSBjb21wYXRpYmlsaXR5IGJldHdlZW4gdmVyc2lvbnM7IHNvIGl04oCZcyBhbHdheXMgYmVlbiBu
ZWNlc3NhcnkgdG8gcmUtY29tcGlsZSBhbGwgeW91ciBsaWJyYXJpZXMgd2hlbiB1cGdyYWRpbmcg
ZnJvbSAoc2F5KSAxLjggdG8gMS45LiAgV2hpY2ggbWVhbnMgdGhhdCBhbnkgdXNlYWJsZSBkaXN0
cmlidXRpb24gbXVzdCBhbHNvIGluY2x1ZGUgYWxsIHRoZSBzb3VyY2UgZmlsZXMgbmVjZXNzYXJ5
IHRvIHJlY29tcGlsZSB3aGVuIHlvdSBidW1wIHRoZSB2ZXJzaW9uIG51bWJlci4NCg0KU28gdGhl
IGNvcmUgbWVjaGFuaXNtIG9mIHRoZSDigJxpbnN0YWxs4oCdIGlzIGFjdHVhbGx5IHRvIGNvcHkg
YWxsIHRoZSBzb3VyY2UgZmlsZXMgbmVjZXNzYXJ5IGludG8gdGhlIHJpZ2h0IGxvY2FsIGRpcmVj
dG9yeSBzdWNoIHRoYXQgdGhlIGdvIGNvbXBpbGVyIGNhbiBmaW5kIHRoZW07IEFUTSB0aGlzIGlz
IC91c3Ivc2hhcmUvZ29jb2RlL2dvbGFuZy54ZW5wcm9qZWN0Lm9yZy94ZW5saWdodCAoYXMgZG9j
dW1lbnRlZCBoZXJlOiBodHRwczovL2dpdGh1Yi5jb20vZ29sYW5nL2dvL3dpa2kvRmlsZVRyZWVE
b2N1bWVudGF0aW9uKS4gIFRoZSBmaWxlcyB3aGljaCBhcmUgY29waWVkIGFyZSBzcGVjaWZpZWQg
YnkgdGhlIFBHS1NPVVJDRVMgdmFyaWFibGUgaW4gdGhlIG1ha2VmaWxlLg0KDQpUaGUgcHVycG9z
ZSBvZiBidWlsZGluZyBhIGJpbmFyeSBkdXJpbmcgdGhlIG5vcm1hbCDigJxtYWtl4oCdIHByb2Nl
c3MgaXMgbm90IGFjdHVhbGx5IHRvIGhhdmUgYSB1c2VhYmxlIGJpbmFyeTsgaXTigJlzIHRvIGRl
dGVjdCBhbnkgcG90ZW50aWFsIGlzc3VlcyB3aGVuIHlvdSBkbyB0aGUgWGVuIGJ1aWxkLCByYXRo
ZXIgdGhhbiB3aGVuZXZlciB5b3UgYWN0dWFsbHkgYnVpbGQgYSBHbyBwcm9ncmFtIGZvciB0aGUg
Zmlyc3QgdGltZSAocG90ZW50aWFsbHkgb24gc29tZSBlbmQtdXNlcuKAmXMgc3lzdGVtKS4gIEFu
ZCDigJxkZXRlY3QgYW55IGlzc3Vlc+KAnSBhdHRlbXB0cyB0byB1c2Ug4oCcZ28gYnVpbGTigJ0g
aW4gdGhlIHNpdHVhdGlvbiB5b3UgZXhwZWN0IHRvIHVzZSBpdCBhdCBydW4gdGltZSAoaS5lLiwg
aXQgY29waWVzIFBLR1NPVVJDRVMgdG8gYSBsb2NhbCBkaXJlY3RvcnksIHRoZW4gcG9pbnRzIEdP
X1BBVEggYXQgdGhlbSwgcG9pbnRzIHRvIHRoZSBsb2NhbGx5LWJ1aWx0IGxpYnJhcmllcywgYW5k
IHRoZW4gcnVucyBhIHBsYWluIGBnbyBidWlsZGApLiAgSW4gdGhpcyB3YXkgaXQgc2hvdWxkLCB0
aGVvcmV0aWNhbGx5LCBjYXRjaCBhbnkgb2YgdGhlIGZvbGxvd2luZyBlcnJvcnM6DQoNCiogU3lu
dGF4IC8gd2hhdGV2ZXIgZXJyb3JzIGluIHRoZSBHbyBiaW5kaW5ncyB0aGVtc2VsdmVzDQoqIE1p
c21hdGNoZXMgYmV0d2VlbiB0aGUgR28gYmluZGluZ3MgYW5kIGxpYnhsICZjDQoqIE1pc3Npbmcg
c3lzdGVtIGxpYnJhcmllcw0KKiBTb21ldGhpbmcgbm90IHJpZ2h0IGluIHRoZSBpbnN0YWxsYXRp
b24gcGF0aCBzeXN0ZW0NCg0KQWxsIHRoYXQgdG8gc2F5IOKAlCB0aGUg4oCccmVhbOKAnSB3YXkg
dG8gZW5hYmxlIGEgbmV3IGZpbGUgaW4gdGhlIHhlbmxpZ2h0IHBhY2thZ2UgaXMgdG8gYWRkIGl0
IHRvIFBLR1NPVVJDRVMuDQoNCiAtR2VvcmdlDQoNCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxp
c3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby94ZW4tZGV2ZWw=
