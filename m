Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FA26C31A2
	for <lists+xen-devel@lfdr.de>; Tue,  1 Oct 2019 12:40:16 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iFFWl-0004eS-K8; Tue, 01 Oct 2019 10:37:07 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=rvNq=X2=citrix.com=paul.durrant@srs-us1.protection.inumbo.net>)
 id 1iFFWk-0004eJ-EL
 for xen-devel@lists.xenproject.org; Tue, 01 Oct 2019 10:37:06 +0000
X-Inumbo-ID: 69299fa8-e437-11e9-96f7-12813bfff9fa
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by localhost (Halon) with ESMTPS
 id 69299fa8-e437-11e9-96f7-12813bfff9fa;
 Tue, 01 Oct 2019 10:37:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1569926225;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=XIC0j10n9ESBcEFd6Yiboq7/13YMn1U1Vt8+rvD2Bd8=;
 b=WFCZsoLUxyOhe1JCIwbAlCk94+9YyoGTqXSpLN2eRMM8VRH/NyfmS4cL
 o0H4xkoi7SLSWE6evntJNaZqVFdjxZ74J2rleKs5ylWlPQfjxLuQGCED6
 mKl6yQcIdMXiI6dkXTCfCg4yD8A8zezWG3LmyR6t8YB0kWACl1pwu+Ki4 Y=;
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
IronPort-SDR: MFMXMWJOeus8dc43uyrW3UpFmwbNwtzio1AbPiIuRX/5Qa/6bx8qFh3HYJpgGQfwNHSCHF8/04
 a8mq2cCeU89mbkTqoOxPaLrXF4AyTn0ePPr31sDcQT1tMOUGGSrUKKeOSkpZsCaPKpXQWDosA7
 hm7iFi4MV3C5woL6I1Giy4pZVxrSPgwMQ5cX1YFk7/DUbHulHddbxinpVwmAIa07caqcP9p+4m
 jUuXvO/FLF2jiyPU+GmGVyYOT8d9HEtv8pVKN/yJ6Ze98Qx4T25Rnq/1J2BfM8bvZt7Cno3r4p
 OkA=
X-SBRS: 2.7
X-MesageID: 6540311
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,570,1559534400"; 
   d="scan'208";a="6540311"
From: Paul Durrant <Paul.Durrant@citrix.com>
To: Roger Pau Monne <roger.pau@citrix.com>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>
Thread-Topic: [Xen-devel] [PATCH v3 07/10] ioreq: allow decoding accesses to
 MMCFG regions
Thread-Index: AQHVd5PGmrUVxmb2jkmTFs5kWDm9UqdFl8ug
Date: Tue, 1 Oct 2019 10:37:01 +0000
Message-ID: <3bcad8c0413a481e92b6ccdc70564a1e@AMSPEX02CL03.citrite.net>
References: <20190930133238.49868-1-roger.pau@citrix.com>
 <20190930133238.49868-8-roger.pau@citrix.com>
In-Reply-To: <20190930133238.49868-8-roger.pau@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH v3 07/10] ioreq: allow decoding accesses to
 MMCFG regions
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
 Roger Pau Monne <roger.pau@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Wei Liu <wl@xen.org>, Paul Durrant <paul@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBYZW4tZGV2ZWwgPHhlbi1kZXZl
bC1ib3VuY2VzQGxpc3RzLnhlbnByb2plY3Qub3JnPiBPbiBCZWhhbGYgT2YgUm9nZXIgUGF1IE1v
bm5lDQo+IFNlbnQ6IDMwIFNlcHRlbWJlciAyMDE5IDE0OjMzDQo+IFRvOiB4ZW4tZGV2ZWxAbGlz
dHMueGVucHJvamVjdC5vcmcNCj4gQ2M6IEFuZHJldyBDb29wZXIgPEFuZHJldy5Db29wZXIzQGNp
dHJpeC5jb20+OyBQYXVsIER1cnJhbnQgPHBhdWxAeGVuLm9yZz47IFdlaSBMaXUgPHdsQHhlbi5v
cmc+OyBKYW4NCj4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+OyBSb2dlciBQYXUgTW9ubmUg
PHJvZ2VyLnBhdUBjaXRyaXguY29tPg0KPiBTdWJqZWN0OiBbWGVuLWRldmVsXSBbUEFUQ0ggdjMg
MDcvMTBdIGlvcmVxOiBhbGxvdyBkZWNvZGluZyBhY2Nlc3NlcyB0byBNTUNGRyByZWdpb25zDQo+
IA0KPiBQaWNrIHVwIG9uIHRoZSBpbmZyYXN0cnVjdHVyZSBhbHJlYWR5IGFkZGVkIGZvciB2UENJ
IGFuZCBhbGxvdyBpb3JlcQ0KPiB0byBkZWNvZGUgYWNjZXNzZXMgdG8gTU1DRkcgcmVnaW9ucyBy
ZWdpc3RlcmVkIGZvciBhIGRvbWFpbi4gVGhpcw0KPiBpbmZyYXN0cnVjdHVyZSBpcyBzdGlsbCBv
bmx5IGFjY2Vzc2libGUgZnJvbSBpbnRlcm5hbCBjYWxsZXJzLCBzbw0KPiBNTUNGRyByZWdpb25z
IGNhbiBvbmx5IGJlIHJlZ2lzdGVyZWQgZnJvbSB0aGUgaW50ZXJuYWwgZG9tYWluIGJ1aWxkZXIN
Cj4gdXNlZCBieSBQVkggZG9tMC4NCj4gDQo+IE5vdGUgdGhhdCB0aGUgdlBDSSBpbmZyYXN0cnVj
dHVyZSB0byBkZWNvZGUgYW5kIGhhbmRsZSBhY2Nlc3NlcyB0bw0KPiBNTUNGRyByZWdpb25zIHdp
bGwgYmUgcmVtb3ZlZCBpbiBmb2xsb3dpbmcgcGF0Y2hlcyB3aGVuIHZQQ0kgaXMNCj4gc3dpdGNo
ZWQgdG8gYmVjb21lIGFuIGludGVybmFsIGlvcmVxIHNlcnZlci4NCj4gDQo+IFNpZ25lZC1vZmYt
Ynk6IFJvZ2VyIFBhdSBNb25uw6kgPHJvZ2VyLnBhdUBjaXRyaXguY29tPg0KDQpSZXZpZXdlZC1i
eTogUGF1bCBEdXJyYW50IDxwYXVsQHhlbi5vcmc+DQoNCi4uLndpdGggb25lIG5pdCBiZWxvdy4u
Lg0KDQo+IC0tLQ0KPiBDaGFuZ2VzIHNpbmNlIHYyOg0KPiAgLSBEb24ndCBwcmV2ZW50IG1hcHBp
bmcgTUNGRyByYW5nZXMgYnkgaW9yZXEgc2VydmVycy4NCj4gDQo+IENoYW5nZXMgc2luY2UgdjE6
DQo+ICAtIFJlbW92ZSBwcm90b3R5cGUgZm9yIGRlc3Ryb3lfdnBjaV9tbWNmZy4NCj4gIC0gS2Vl
cCB0aGUgY29kZSBpbiBpby5jIHNvIFBDSSBhY2Nlc3NlcyB0byBNTUNGRyByZWdpb25zIGNhbiBi
ZQ0KPiAgICBkZWNvZGVkIGJlZm9yZSBpb3JlcSBwcm9jZXNzaW5nLg0KPiAtLS0NCj4gIHhlbi9h
cmNoL3g4Ni9odm0vZG9tMF9idWlsZC5jICAgICAgIHwgIDggKy0tDQo+ICB4ZW4vYXJjaC94ODYv
aHZtL2h2bS5jICAgICAgICAgICAgICB8ICAyICstDQo+ICB4ZW4vYXJjaC94ODYvaHZtL2lvLmMg
ICAgICAgICAgICAgICB8IDc5ICsrKysrKysrKysrKy0tLS0tLS0tLS0tLS0tLS0tDQo+ICB4ZW4v
YXJjaC94ODYvaHZtL2lvcmVxLmMgICAgICAgICAgICB8IDE4ICsrKysrLS0NCj4gIHhlbi9hcmNo
L3g4Ni9waHlzZGV2LmMgICAgICAgICAgICAgIHwgIDUgKy0NCj4gIHhlbi9kcml2ZXJzL3Bhc3N0
aHJvdWdoL3g4Ni9pb21tdS5jIHwgIDIgKy0NCj4gIHhlbi9pbmNsdWRlL2FzbS14ODYvaHZtL2lv
LmggICAgICAgIHwgMjkgKysrKysrKystLS0NCj4gIDcgZmlsZXMgY2hhbmdlZCwgNzUgaW5zZXJ0
aW9ucygrKSwgNjggZGVsZXRpb25zKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEveGVuL2FyY2gveDg2
L2h2bS9kb20wX2J1aWxkLmMgYi94ZW4vYXJjaC94ODYvaHZtL2RvbTBfYnVpbGQuYw0KPiBpbmRl
eCA4MzEzMjUxNTBiLi5iMzAwNDJkOGYzIDEwMDY0NA0KPiAtLS0gYS94ZW4vYXJjaC94ODYvaHZt
L2RvbTBfYnVpbGQuYw0KPiArKysgYi94ZW4vYXJjaC94ODYvaHZtL2RvbTBfYnVpbGQuYw0KPiBA
QCAtMTEwOCwxMCArMTEwOCwxMCBAQCBzdGF0aWMgdm9pZCBfX2h3ZG9tX2luaXQgcHZoX3NldHVw
X21tY2ZnKHN0cnVjdCBkb21haW4gKmQpDQo+IA0KPiAgICAgIGZvciAoIGkgPSAwOyBpIDwgcGNp
X21tY2ZnX2NvbmZpZ19udW07IGkrKyApDQo+ICAgICAgew0KPiAtICAgICAgICByYyA9IHJlZ2lz
dGVyX3ZwY2lfbW1jZmdfaGFuZGxlcihkLCBwY2lfbW1jZmdfY29uZmlnW2ldLmFkZHJlc3MsDQo+
IC0gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHBjaV9tbWNmZ19jb25m
aWdbaV0uc3RhcnRfYnVzX251bWJlciwNCj4gLSAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgcGNpX21tY2ZnX2NvbmZpZ1tpXS5lbmRfYnVzX251bWJlciwNCj4gLSAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgcGNpX21tY2ZnX2NvbmZpZ1tpXS5w
Y2lfc2VnbWVudCk7DQo+ICsgICAgICAgIHJjID0gaHZtX3JlZ2lzdGVyX21tY2ZnKGQsIHBjaV9t
bWNmZ19jb25maWdbaV0uYWRkcmVzcywNCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgcGNpX21tY2ZnX2NvbmZpZ1tpXS5zdGFydF9idXNfbnVtYmVyLA0KPiArICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICBwY2lfbW1jZmdfY29uZmlnW2ldLmVuZF9idXNfbnVtYmVyLA0K
PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBwY2lfbW1jZmdfY29uZmlnW2ldLnBj
aV9zZWdtZW50KTsNCj4gICAgICAgICAgaWYgKCByYyApDQo+ICAgICAgICAgICAgICBwcmludGso
IlVuYWJsZSB0byBzZXR1cCBNTUNGRyBoYW5kbGVyIGF0ICUjbHggZm9yIHNlZ21lbnQgJXVcbiIs
DQo+ICAgICAgICAgICAgICAgICAgICAgcGNpX21tY2ZnX2NvbmZpZ1tpXS5hZGRyZXNzLA0KPiBk
aWZmIC0tZ2l0IGEveGVuL2FyY2gveDg2L2h2bS9odm0uYyBiL3hlbi9hcmNoL3g4Ni9odm0vaHZt
LmMNCj4gaW5kZXggYzIyY2IzOWNmMy4uNTM0ODE4NmMwYyAxMDA2NDQNCj4gLS0tIGEveGVuL2Fy
Y2gveDg2L2h2bS9odm0uYw0KPiArKysgYi94ZW4vYXJjaC94ODYvaHZtL2h2bS5jDQo+IEBAIC03
NTMsNyArNzUzLDcgQEAgdm9pZCBodm1fZG9tYWluX2Rlc3Ryb3koc3RydWN0IGRvbWFpbiAqZCkN
Cj4gICAgICAgICAgeGZyZWUoaW9wb3J0KTsNCj4gICAgICB9DQo+IA0KPiAtICAgIGRlc3Ryb3lf
dnBjaV9tbWNmZyhkKTsNCj4gKyAgICBodm1fZnJlZV9tbWNmZyhkKTsNCj4gIH0NCj4gDQo+ICBz
dGF0aWMgaW50IGh2bV9zYXZlX3RzY19hZGp1c3Qoc3RydWN0IHZjcHUgKnYsIGh2bV9kb21haW5f
Y29udGV4dF90ICpoKQ0KPiBkaWZmIC0tZ2l0IGEveGVuL2FyY2gveDg2L2h2bS9pby5jIGIveGVu
L2FyY2gveDg2L2h2bS9pby5jDQo+IGluZGV4IGE1YjBhMjNmMDYuLjMzMzQ4ODgxMzYgMTAwNjQ0
DQo+IC0tLSBhL3hlbi9hcmNoL3g4Ni9odm0vaW8uYw0KPiArKysgYi94ZW4vYXJjaC94ODYvaHZt
L2lvLmMNCj4gQEAgLTI3OSw2ICsyNzksMTggQEAgdW5zaWduZWQgaW50IGh2bV9wY2lfZGVjb2Rl
X2FkZHIodW5zaWduZWQgaW50IGNmOCwgdW5zaWduZWQgaW50IGFkZHIsDQo+ICAgICAgcmV0dXJu
IENGOF9BRERSX0xPKGNmOCkgfCAoYWRkciAmIDMpOw0KPiAgfQ0KPiANCj4gK3Vuc2lnbmVkIGlu
dCBodm1fbW1jZmdfZGVjb2RlX2FkZHIoY29uc3Qgc3RydWN0IGh2bV9tbWNmZyAqbW1jZmcsDQo+
ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHBhZGRyX3QgYWRkciwgcGNpX3Ni
ZGZfdCAqc2JkZikNCj4gK3sNCj4gKyAgICBhZGRyIC09IG1tY2ZnLT5hZGRyOw0KPiArICAgIHNi
ZGYtPmJkZiA9IE1NQ0ZHX0JERihhZGRyKTsNCj4gKyAgICBzYmRmLT5idXMgKz0gbW1jZmctPnN0
YXJ0X2J1czsNCj4gKyAgICBzYmRmLT5zZWcgPSBtbWNmZy0+c2VnbWVudDsNCj4gKw0KPiArICAg
IHJldHVybiBhZGRyICYgKFBDSV9DRkdfU1BBQ0VfRVhQX1NJWkUgLSAxKTsNCj4gK30NCj4gKw0K
PiArDQoNCkV4dHJhbmVvdXMgYmxhbmsgbGluZSBoZXJlLg0KDQogIFBhdWwNCg0KX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcg
bGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9q
ZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
