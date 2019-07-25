Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C7CCB74B5F
	for <lists+xen-devel@lfdr.de>; Thu, 25 Jul 2019 12:18:53 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hqanI-0000AU-BJ; Thu, 25 Jul 2019 10:16:16 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=owr5=VW=citrix.com=paul.durrant@srs-us1.protection.inumbo.net>)
 id 1hqanG-0000AP-KB
 for xen-devel@lists.xenproject.org; Thu, 25 Jul 2019 10:16:14 +0000
X-Inumbo-ID: 3abcd6db-aec5-11e9-8980-bc764e045a96
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 3abcd6db-aec5-11e9-8980-bc764e045a96;
 Thu, 25 Jul 2019 10:16:13 +0000 (UTC)
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=Paul.Durrant@citrix.com;
 spf=Pass smtp.mailfrom=Paul.Durrant@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 Paul.Durrant@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="Paul.Durrant@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa4.hc3370-68.iphmx.com: domain of
 Paul.Durrant@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="Paul.Durrant@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: PpTnWxVl/SCedGZpF7insrpmadZdQpsNq/Wmf8Yqigmt81w65KpxXN0pNBDEShWY2lj4bOUO5T
 vdIp8BjitVsxf7T0Kq8wljBdSGzB8ogvx5CcDfmRYxAeNlAZKcZ1cL4KAX7qviwS8tncGN6OE9
 xioTCKEhLtTIr1rBGWmh7/BNWxhPjcQ71Jhn0RgkyJYXQdiymyoCnXM2LSe67U86WyYswcYART
 pHUHs1jVyfzvR5c76nRJbTg6Ggn2X7KjeMI1vpmAO/GPlWeYVvmx4vZI/Dyu/g2UXhU8JqklpP
 dVY=
X-SBRS: 2.7
X-MesageID: 3543912
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,306,1559534400"; 
   d="scan'208";a="3543912"
From: Paul Durrant <Paul.Durrant@citrix.com>
To: "Tim (Xen.org)" <tim@xen.org>
Thread-Topic: [PATCH 4/6] x86/domain: remove the 'oos_off' flag
Thread-Index: AQHVQXCOZqsnlrSTkUKT72u8n1QZZqbZ6oIAgAE1kpA=
Date: Thu, 25 Jul 2019 10:16:09 +0000
Message-ID: <d3d663d6f68649ce835098e6c1b38f63@AMSPEX02CL03.citrite.net>
References: <20190723160609.2177-1-paul.durrant@citrix.com>
 <20190723160609.2177-5-paul.durrant@citrix.com>
 <20190724174436.GA54604@deinos.phlegethon.org>
In-Reply-To: <20190724174436.GA54604@deinos.phlegethon.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH 4/6] x86/domain: remove the 'oos_off' flag
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
Cc: Wei Liu <wl@xen.org>, Andrew Cooper <Andrew.Cooper3@citrix.com>, George
 Dunlap <George.Dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQo+IEZyb206IFRpbSBEZWVnYW4gPHRpbUB4ZW4u
b3JnPgo+IFNlbnQ6IDI0IEp1bHkgMjAxOSAxODo0NQo+IFRvOiBQYXVsIER1cnJhbnQgPFBhdWwu
RHVycmFudEBjaXRyaXguY29tPgo+IENjOiB4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmc7
IEdlb3JnZSBEdW5sYXAgPEdlb3JnZS5EdW5sYXBAY2l0cml4LmNvbT47IEphbiBCZXVsaWNoCj4g
PGpiZXVsaWNoQHN1c2UuY29tPjsgQW5kcmV3IENvb3BlciA8QW5kcmV3LkNvb3BlcjNAY2l0cml4
LmNvbT47IFdlaSBMaXUgPHdsQHhlbi5vcmc+OyBSb2dlciBQYXUgTW9ubmUKPiA8cm9nZXIucGF1
QGNpdHJpeC5jb20+Cj4gU3ViamVjdDogUmU6IFtQQVRDSCA0LzZdIHg4Ni9kb21haW46IHJlbW92
ZSB0aGUgJ29vc19vZmYnIGZsYWcKPiAKPiBBdCAxNzowNiArMDEwMCBvbiAyMyBKdWwgKDE1NjM5
MDE1NjcpLCBQYXVsIER1cnJhbnQgd3JvdGU6Cj4gPiBUaGUgZmxhZyBpcyBub3QgbmVlZGVkIHNp
bmNlIHRoZSBkb21haW4gJ2NyZWF0ZWZsYWdzJyBjYW4gbm93IGJlIHRlc3RlZAo+ID4gZGlyZWN0
bHkuCj4gPgo+ID4gU2lnbmVkLW9mZi1ieTogUGF1bCBEdXJyYW50IDxwYXVsLmR1cnJhbnRAY2l0
cml4LmNvbT4KPiAKPiBBY2tlZC1ieTogVGltIERlZWdhbiA8dGltQHhlbi5vcmc+Cj4gCj4gdGhv
dWdoIHNvbWUgb2YgdGhpcyBjaGFuZ2Ugc2VlbXMgdG8gaGF2ZSBnb3QgaW50byBwYXRjaCAzLCBt
YXliZSB0aGV5Cj4gd2VyZSByZW9yZGVyZWQgYXQgc29tZSBwb2ludD8KPgoKT2gsIHllcywgdGhl
eSB3ZXJlIGFjdHVhbGx5IGNvbWJpbmVkIHdoZW4gSSBvcmlnaW5hbGx5IG1hZGUgdGhlIGNoYW5n
ZS4gVGhlIHJlbW92YWwgb2YgZG9tY3JfZmxhZ3MgZm9yIHNoYWRvd19kb21haW5faW5pdCgpIHdv
dWxkIGluZGVlZCBiZSBtb3JlIGxvZ2ljYWxseSBwbGFjZWQgaW4gdGhpcyBwYXRjaC4gSXQncyBh
IHByZXR0eSB0cml2aWFsIGNoYW5nZSBzbyBJJ2xsIG1vdmUgaXQgaW4gdjIgYW5kIGFzc3VtZSB5
b3VyIEEtYiBzdGlsbCBzdGFuZHMuCgogIFBhdWwKIAoKPiBDaGVlcnMsCj4gCj4gVGltLgo+IAo+
IAo+ID4gLS0tCj4gPiBDYzogR2VvcmdlIER1bmxhcCA8Z2VvcmdlLmR1bmxhcEBldS5jaXRyaXgu
Y29tPgo+ID4gQ2M6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KPiA+IENjOiBBbmRy
ZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPgo+ID4gQ2M6IFdlaSBMaXUgPHds
QHhlbi5vcmc+Cj4gPiBDYzogIlJvZ2VyIFBhdSBNb25uw6kiIDxyb2dlci5wYXVAY2l0cml4LmNv
bT4KPiA+IC0tLQo+ID4gIHhlbi9hcmNoL3g4Ni9tbS9zaGFkb3cvY29tbW9uLmMgfCAzICstLQo+
ID4gIHhlbi9pbmNsdWRlL2FzbS14ODYvZG9tYWluLmggICAgfCAxIC0KPiA+ICAyIGZpbGVzIGNo
YW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAzIGRlbGV0aW9ucygtKQo+ID4KPiA+IGRpZmYgLS1naXQg
YS94ZW4vYXJjaC94ODYvbW0vc2hhZG93L2NvbW1vbi5jIGIveGVuL2FyY2gveDg2L21tL3NoYWRv
dy9jb21tb24uYwo+ID4gaW5kZXggMzIwZWEwZGIyMS4uMmM3ZmFmYTRmYiAxMDA2NDQKPiA+IC0t
LSBhL3hlbi9hcmNoL3g4Ni9tbS9zaGFkb3cvY29tbW9uLmMKPiA+ICsrKyBiL3hlbi9hcmNoL3g4
Ni9tbS9zaGFkb3cvY29tbW9uLmMKPiA+IEBAIC02Miw3ICs2Miw2IEBAIGludCBzaGFkb3dfZG9t
YWluX2luaXQoc3RydWN0IGRvbWFpbiAqZCkKPiA+Cj4gPiAgI2lmIChTSEFET1dfT1BUSU1JWkFU
SU9OUyAmIFNIT1BUX09VVF9PRl9TWU5DKQo+ID4gICAgICBkLT5hcmNoLnBhZ2luZy5zaGFkb3cu
b29zX2FjdGl2ZSA9IDA7Cj4gPiAtICAgIGQtPmFyY2gucGFnaW5nLnNoYWRvdy5vb3Nfb2ZmID0g
ZC0+Y3JlYXRlZmxhZ3MgJiBYRU5fRE9NQ1RMX0NERl9vb3Nfb2ZmOwo+ID4gICNlbmRpZgo+ID4g
ICAgICBkLT5hcmNoLnBhZ2luZy5zaGFkb3cucGFnZXRhYmxlX2R5aW5nX29wID0gMDsKPiA+Cj4g
PiBAQCAtMjUyMyw3ICsyNTIyLDcgQEAgc3RhdGljIHZvaWQgc2hfdXBkYXRlX3BhZ2luZ19tb2Rl
cyhzdHJ1Y3QgdmNwdSAqdikKPiA+ICAjaWYgKFNIQURPV19PUFRJTUlaQVRJT05TICYgU0hPUFRf
T1VUX09GX1NZTkMpCj4gPiAgICAgIC8qIFdlIG5lZWQgdG8gY2hlY2sgdGhhdCBhbGwgdGhlIHZj
cHVzIGhhdmUgcGFnaW5nIGVuYWJsZWQgdG8KPiA+ICAgICAgICogdW5zeW5jIFBUcy4gKi8KPiA+
IC0gICAgaWYgKCBpc19odm1fZG9tYWluKGQpICYmICFkLT5hcmNoLnBhZ2luZy5zaGFkb3cub29z
X29mZiApCj4gPiArICAgIGlmICggaXNfaHZtX2RvbWFpbihkKSAmJiAhKGQtPmNyZWF0ZWZsYWdz
ICYgWEVOX0RPTUNUTF9DREZfb29zX29mZikgKQo+ID4gICAgICB7Cj4gPiAgICAgICAgICBpbnQg
cGUgPSAxOwo+ID4gICAgICAgICAgc3RydWN0IHZjcHUgKnZwdHI7Cj4gPiBkaWZmIC0tZ2l0IGEv
eGVuL2luY2x1ZGUvYXNtLXg4Ni9kb21haW4uaCBiL3hlbi9pbmNsdWRlL2FzbS14ODYvZG9tYWlu
LmgKPiA+IGluZGV4IDkzM2I4NTkwMWYuLjVmOTg5OTQ2OWMgMTAwNjQ0Cj4gPiAtLS0gYS94ZW4v
aW5jbHVkZS9hc20teDg2L2RvbWFpbi5oCj4gPiArKysgYi94ZW4vaW5jbHVkZS9hc20teDg2L2Rv
bWFpbi5oCj4gPiBAQCAtMTE1LDcgKzExNSw2IEBAIHN0cnVjdCBzaGFkb3dfZG9tYWluIHsKPiA+
Cj4gPiAgICAgIC8qIE9PUyAqLwo+ID4gICAgICBib29sX3Qgb29zX2FjdGl2ZTsKPiA+IC0gICAg
Ym9vbF90IG9vc19vZmY7Cj4gPgo+ID4gICAgICAvKiBIYXMgdGhpcyBkb21haW4gZXZlciB1c2Vk
IEhWTU9QX3BhZ2V0YWJsZV9keWluZz8gKi8KPiA+ICAgICAgYm9vbF90IHBhZ2V0YWJsZV9keWlu
Z19vcDsKPiA+IC0tCj4gPiAyLjIwLjEuMi5nYjIxZWJiNjcxCj4gPgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApY
ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
