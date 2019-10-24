Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E176AE33BD
	for <lists+xen-devel@lfdr.de>; Thu, 24 Oct 2019 15:15:07 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iNctk-0002n7-Tm; Thu, 24 Oct 2019 13:11:28 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=SStA=YR=amazon.com=prvs=1935ee3ec=hongyax@srs-us1.protection.inumbo.net>)
 id 1iNctj-0002n2-9E
 for xen-devel@lists.xenproject.org; Thu, 24 Oct 2019 13:11:27 +0000
X-Inumbo-ID: c931382c-f65f-11e9-bbab-bc764e2007e4
Received: from smtp-fw-2101.amazon.com (unknown [72.21.196.25])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c931382c-f65f-11e9-bbab-bc764e2007e4;
 Thu, 24 Oct 2019 13:11:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1571922686; x=1603458686;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=rH4R2WRrxj428EWs5ztab4PHVucIMqmDpbgxVH8fCC4=;
 b=syX/cBbV8iGSzNYlmC3v4RRlNhshxZ7YmvH/XrBdBPcCF6p2JdjHzA7B
 lMzxYaGN6lIfGYU0s4WN02NLt86Fp0qhHaeqQRrb5mZVVjbYaEqtL/TrL
 OHXc+RfcWt7Gmma54gaokxKbun8mMvSxhGesoqENLLGrv+t5F+/SNGvTO A=;
X-IronPort-AV: E=Sophos;i="5.68,224,1569283200"; d="scan'208";a="762780585"
Received: from iad6-co-svc-p1-lb1-vlan2.amazon.com (HELO
 email-inbound-relay-2b-8cc5d68b.us-west-2.amazon.com) ([10.124.125.2])
 by smtp-border-fw-out-2101.iad2.amazon.com with ESMTP;
 24 Oct 2019 13:11:24 +0000
Received: from EX13MTAUEA001.ant.amazon.com
 (pdx4-ws-svc-p6-lb7-vlan3.pdx.amazon.com [10.170.41.166])
 by email-inbound-relay-2b-8cc5d68b.us-west-2.amazon.com (Postfix) with ESMTPS
 id 03968A229E; Thu, 24 Oct 2019 13:11:23 +0000 (UTC)
Received: from EX13D28EUB004.ant.amazon.com (10.43.166.176) by
 EX13MTAUEA001.ant.amazon.com (10.43.61.82) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Thu, 24 Oct 2019 13:11:23 +0000
Received: from EX13D28EUB003.ant.amazon.com (10.43.166.124) by
 EX13D28EUB004.ant.amazon.com (10.43.166.176) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Thu, 24 Oct 2019 13:11:22 +0000
Received: from EX13D28EUB003.ant.amazon.com ([10.43.166.124]) by
 EX13D28EUB003.ant.amazon.com ([10.43.166.124]) with mapi id 15.00.1367.000;
 Thu, 24 Oct 2019 13:11:22 +0000
From: "Xia, Hongyan" <hongyax@amazon.com>
To: "marmarek@invisiblethingslab.com" <marmarek@invisiblethingslab.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Thread-Topic: [Xen-devel] [PATCH v4 3/3] xen/efi: use directmap to access
 runtime services table
Thread-Index: AQHVih3niImiewno/U+zFAH52T5sOadpxNQA
Date: Thu, 24 Oct 2019 13:11:22 +0000
Message-ID: <6d17d3de019b6d283178696fdbdee02c63e4fa49.camel@amazon.com>
References: <cover.d9b2d7d69cc351a30963d653b1d459c878356e4e.1571888583.git-series.marmarek@invisiblethingslab.com>
 <d9e965c0e19759f7be398044945b7be9eff41f3d.1571888583.git-series.marmarek@invisiblethingslab.com>
In-Reply-To: <d9e965c0e19759f7be398044945b7be9eff41f3d.1571888583.git-series.marmarek@invisiblethingslab.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.43.165.141]
Content-ID: <A7B6C9AAB84E65458DEA6FAC4CF53314@amazon.com>
MIME-Version: 1.0
Precedence: Bulk
Subject: Re: [Xen-devel] [PATCH v4 3/3] xen/efi: use directmap to access
 runtime services table
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: "jgross@suse.com" <jgross@suse.com>,
 "jbeulich@suse.com" <jbeulich@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SXQgaXMgY2VydGFpbmx5IG5pY2UgdG8gaGF2ZSBsZXNzIHVzZXJzIG9mIHRoZSBkaXJlY3QgbWFw
LiBNeSBub24tRUZJDQpidWlsZHMgYWxyZWFkeSB3b3JrIHdpdGhvdXQgdGhlIGRpcmVjdCBtYXAg
bm93IGJ1dCBvbmNlIEkgc3RhcnQgdGVzdGluZw0KRUZJLCBpdCBpcyBuaWNlIHRvIGhhdmUgb25l
IGxlc3MgdGhpbmcgdG8gd29ycnkgYWJvdXQuDQoNCkhvdyBpbXBvcnRhbnQgYW5kIHBlcmZvcm1h
bmNlLWNyaXRpY2FsIGlzIHRoaXM/IElmIHdlIHJlYWxseSB3YW50IHRvDQphdm9pZCBzd2l0Y2hp
bmcgdGhlIHBhZ2UgdGFibGUsIHdlIGNvdWxkIHJlc2VydmUgYSB2aXJ0dWFsIHJhbmdlIGFuZA0K
bWFwIGl0IHRvIHJ1bnRpbWUgc2VydmljZXMgaW4gWGVuLg0KDQpIb25neWFuDQoNCk9uIFRodSwg
MjAxOS0xMC0yNCBhdCAwNTo0NSArMDIwMCwgTWFyZWsgTWFyY3p5a293c2tpLUfDs3JlY2tpIHdy
b3RlOg0KPiBEbyBub3QgcmVxdWlyZSBzd2l0Y2hpbmcgcGFnZSB0YWJsZXMgdG8gYWNjZXNzIChz
dGF0aWMpIGluZm9ybWF0aW9uDQo+IGluDQo+IHRoZSBydW50aW1lIHNlcnZpY2VzIHRhYmxlIGl0
c2VsZiwgdXNlIGRpcmVjdG1hcCBmb3IgdGhpcy4gVGhpcw0KPiBhbGxvd3MNCj4gZXhpdGluZyBl
YXJseSBmcm9tIFhFTl9FRklfcXVlcnlfY2Fwc3VsZV9jYXBhYmlsaXRpZXMsDQo+IFhFTl9FRklf
dXBkYXRlX2NhcHN1bGUgYW5kIFhFTl9FRklfcXVlcnlfdmFyaWFibGVfaW5mbyAoaW4gY2FzZSBv
Zg0KPiBub3QNCj4gc3VwcG9ydGVkIGNhbGwpIHdpdGhvdXQgYWxsIHRoZSBpbXBhY3Qgb2YgcGFn
ZSB0YWJsZSBzd2l0Y2guDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBNYXJlayBNYXJjenlrb3dza2kt
R8OzcmVja2kgPA0KPiBtYXJtYXJla0BpbnZpc2libGV0aGluZ3NsYWIuY29tPg0KPiAtLS0NCj4g
TmV3IHBhdGNoIGluIHY0LiBDYW4gYmUgYXBwbGllZCBpbmRlcGVuZGVudGx5IG9mIHRoZSBvdGhl
ciB0d28uDQo+IFNwZWNpZmljYWxseSBjYW4gYmUgZGVmZXJlZCBiZXlvbmQgNC4xMy4NCj4gSSdt
IGFsc28gZmluZSB3aXRoIGRyb3BwaW5nIGl0LCBpZiBhZGRpbmcgZGlyZWN0bWFwIHVzZXJzIGlz
DQo+IHVuZGVzaXJlZC4NCj4gDQo+IENjOiBKdWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+
DQo+IC0tLQ0KPiAgeGVuL2NvbW1vbi9lZmkvYm9vdC5jICAgIHwgIDEgKw0KPiAgeGVuL2NvbW1v
bi9lZmkvcnVudGltZS5jIHwgMTkgKysrKy0tLS0tLS0tLS0tLS0tLQ0KPiAgMiBmaWxlcyBjaGFu
Z2VkLCA1IGluc2VydGlvbnMoKyksIDE1IGRlbGV0aW9ucygtKQ0KPiANCj4gZGlmZiAtLWdpdCBh
L3hlbi9jb21tb24vZWZpL2Jvb3QuYyBiL3hlbi9jb21tb24vZWZpL2Jvb3QuYw0KPiBpbmRleCA5
ZGViYzViLi44OWIxYzhhIDEwMDY0NA0KPiAtLS0gYS94ZW4vY29tbW9uL2VmaS9ib290LmMNCj4g
KysrIGIveGVuL2NvbW1vbi9lZmkvYm9vdC5jDQo+IEBAIC0xMTIyLDYgKzExMjIsNyBAQCBzdGF0
aWMgdm9pZCBfX2luaXQgZWZpX2V4aXRfYm9vdChFRklfSEFORExFDQo+IEltYWdlSGFuZGxlLCBF
RklfU1lTVEVNX1RBQkxFICpTeXN0ZQ0KPiAgDQo+ICAgICAgLyogQWRqdXN0IHBvaW50ZXJzIGlu
dG8gRUZJLiAqLw0KPiAgICAgIGVmaV9jdCA9ICh2b2lkICopZWZpX2N0ICsgRElSRUNUTUFQX1ZJ
UlRfU1RBUlQ7DQo+ICsgICAgZWZpX3JzID0gKHZvaWQgKillZmlfcnMgKyBESVJFQ1RNQVBfVklS
VF9TVEFSVDsNCj4gICAgICBlZmlfbWVtbWFwID0gKHZvaWQgKillZmlfbWVtbWFwICsgRElSRUNU
TUFQX1ZJUlRfU1RBUlQ7DQo+ICAgICAgZWZpX2Z3X3ZlbmRvciA9ICh2b2lkICopZWZpX2Z3X3Zl
bmRvciArIERJUkVDVE1BUF9WSVJUX1NUQVJUOw0KPiAgfQ0KPiBkaWZmIC0tZ2l0IGEveGVuL2Nv
bW1vbi9lZmkvcnVudGltZS5jIGIveGVuL2NvbW1vbi9lZmkvcnVudGltZS5jDQo+IGluZGV4IGFi
NTNlYmMuLjIyZmQ2YzkgMTAwNjQ0DQo+IC0tLSBhL3hlbi9jb21tb24vZWZpL3J1bnRpbWUuYw0K
PiArKysgYi94ZW4vY29tbW9uL2VmaS9ydW50aW1lLmMNCj4gQEAgLTIxMSwxMiArMjExLDcgQEAg
aW50IGVmaV9nZXRfaW5mbyh1aW50MzJfdCBpZHgsIHVuaW9uDQo+IHhlbnBmX2VmaV9pbmZvICpp
bmZvKQ0KPiAgICAgICAgICBicmVhazsNCj4gICAgICBjYXNlIFhFTl9GV19FRklfUlRfVkVSU0lP
TjoNCj4gICAgICB7DQo+IC0gICAgICAgIHN0cnVjdCBlZmlfcnNfc3RhdGUgc3RhdGUgPSBlZmlf
cnNfZW50ZXIoKTsNCj4gLQ0KPiAtICAgICAgICBpZiAoICFzdGF0ZS5jcjMgKQ0KPiAtICAgICAg
ICAgICAgcmV0dXJuIC1FT1BOT1RTVVBQOw0KPiAgICAgICAgICBpbmZvLT52ZXJzaW9uID0gZWZp
X3JzLT5IZHIuUmV2aXNpb247DQo+IC0gICAgICAgIGVmaV9yc19sZWF2ZSgmc3RhdGUpOw0KPiAg
ICAgICAgICBicmVhazsNCj4gICAgICB9DQo+ICAgICAgY2FzZSBYRU5fRldfRUZJX0NPTkZJR19U
QUJMRToNCj4gQEAgLTYxOCwxMiArNjEzLDExIEBAIGludCBlZmlfcnVudGltZV9jYWxsKHN0cnVj
dA0KPiB4ZW5wZl9lZmlfcnVudGltZV9jYWxsICpvcCkNCj4gICAgICAgICAgICAgIGJyZWFrOw0K
PiAgICAgICAgICB9DQo+ICANCj4gKyAgICAgICAgaWYgKCAoZWZpX3JzLT5IZHIuUmV2aXNpb24g
Pj4gMTYpIDwgMiApDQo+ICsgICAgICAgICAgICByZXR1cm4gLUVPUE5PVFNVUFA7DQo+ICAgICAg
ICAgIHN0YXRlID0gZWZpX3JzX2VudGVyKCk7DQo+IC0gICAgICAgIGlmICggIXN0YXRlLmNyMyB8
fCAoZWZpX3JzLT5IZHIuUmV2aXNpb24gPj4gMTYpIDwgMiApDQo+IC0gICAgICAgIHsNCj4gLSAg
ICAgICAgICAgIGVmaV9yc19sZWF2ZSgmc3RhdGUpOw0KPiArICAgICAgICBpZiAoICFzdGF0ZS5j
cjMgKQ0KPiAgICAgICAgICAgICAgcmV0dXJuIC1FT1BOT1RTVVBQOw0KPiAtICAgICAgICB9DQo+
ICAgICAgICAgIHN0YXR1cyA9IGVmaV9ycy0+UXVlcnlWYXJpYWJsZUluZm8oDQo+ICAgICAgICAg
ICAgICBvcC0+dS5xdWVyeV92YXJpYWJsZV9pbmZvLmF0dHIsDQo+ICAgICAgICAgICAgICAmb3At
PnUucXVlcnlfdmFyaWFibGVfaW5mby5tYXhfc3RvcmVfc2l6ZSwNCj4gQEAgLTYzNywxMyArNjMx
LDggQEAgaW50IGVmaV9ydW50aW1lX2NhbGwoc3RydWN0DQo+IHhlbnBmX2VmaV9ydW50aW1lX2Nh
bGwgKm9wKQ0KPiAgICAgICAgICBpZiAoIG9wLT5taXNjICkNCj4gICAgICAgICAgICAgIHJldHVy
biAtRUlOVkFMOw0KPiAgDQo+IC0gICAgICAgIHN0YXRlID0gZWZpX3JzX2VudGVyKCk7DQo+IC0g
ICAgICAgIGlmICggIXN0YXRlLmNyMyB8fCAoZWZpX3JzLT5IZHIuUmV2aXNpb24gPj4gMTYpIDwg
MiApDQo+IC0gICAgICAgIHsNCj4gLSAgICAgICAgICAgIGVmaV9yc19sZWF2ZSgmc3RhdGUpOw0K
PiArICAgICAgICBpZiAoIChlZmlfcnMtPkhkci5SZXZpc2lvbiA+PiAxNikgPCAyICkNCj4gICAg
ICAgICAgICAgIHJldHVybiAtRU9QTk9UU1VQUDsNCj4gLSAgICAgICAgfQ0KPiAtICAgICAgICBl
ZmlfcnNfbGVhdmUoJnN0YXRlKTsNCj4gICAgICAgICAgLyogWFhYIGZhbGwgdGhyb3VnaCBmb3Ig
bm93ICovDQo+ICAgICAgZGVmYXVsdDoNCj4gICAgICAgICAgcmV0dXJuIC1FTk9TWVM7DQpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFp
bGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhl
bnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
