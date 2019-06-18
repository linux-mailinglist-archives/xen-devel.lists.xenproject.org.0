Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CCE3E49B86
	for <lists+xen-devel@lfdr.de>; Tue, 18 Jun 2019 09:53:09 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hd8sr-0007Cy-7S; Tue, 18 Jun 2019 07:50:25 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=6zAf=UR=citrix.com=paul.durrant@srs-us1.protection.inumbo.net>)
 id 1hd8sq-0007Ct-5i
 for xen-devel@lists.xenproject.org; Tue, 18 Jun 2019 07:50:24 +0000
X-Inumbo-ID: b9630402-919d-11e9-8980-bc764e045a96
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id b9630402-919d-11e9-8980-bc764e045a96;
 Tue, 18 Jun 2019 07:50:22 +0000 (UTC)
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
IronPort-SDR: CLOLYOUHQvXdoFD7lyTE5v1cDBjE65rBGAV2R9V1rJiVfyGY3/O4dzzrYzr8GAOf1Qcp9nnobq
 hyGwySUsf4b8htXabasNAMG3sCdCmdWGB6jTkyYImCEYNG1DuLwwkOup5JZJivdTwQ2ApJVV8K
 5zKqxmufGeUFTbZGS6gbGJLmIVPezihhuejUVEKM0KhEgj3EkaY4b66l+yBe7AUgExC/o7SLEQ
 rKzItvu+MFq+kqyTfLo2z1T2/zYVK814fJLvunWrkT4G4ZwU44TqSelZ6BvgxC3FgOTKQEA+Rl
 Mrk=
X-SBRS: 2.7
X-MesageID: 1880628
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.63,388,1557201600"; 
   d="scan'208";a="1880628"
From: Paul Durrant <Paul.Durrant@citrix.com>
To: Anthony Perard <anthony.perard@citrix.com>
Thread-Topic: [PATCH 4/4] xen: Avoid VLA
Thread-Index: AQHVJSMYaL9Ko3kp1kKDxJjcc8OjZKagC0EQ///vbYCAAQ/hAA==
Date: Tue, 18 Jun 2019 07:50:18 +0000
Message-ID: <424f82301a824e1fb0a140972268fa8f@AMSPEX02CL03.citrite.net>
References: <20190617154105.32323-1-anthony.perard@citrix.com>
 <20190617154105.32323-5-anthony.perard@citrix.com>
 <a3843cb971bc4fa8886170d0b2461a44@AMSPEX02CL03.citrite.net>
 <20190617173649.GB13449@perard.uk.xensource.com>
In-Reply-To: <20190617173649.GB13449@perard.uk.xensource.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH 4/4] xen: Avoid VLA
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Stefano
 Stabellini <sstabellini@kernel.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQo+IEZyb206IEFudGhvbnkgUEVSQVJEIFttYWls
dG86YW50aG9ueS5wZXJhcmRAY2l0cml4LmNvbV0KPiBTZW50OiAxNyBKdW5lIDIwMTkgMTg6MzcK
PiBUbzogUGF1bCBEdXJyYW50IDxQYXVsLkR1cnJhbnRAY2l0cml4LmNvbT4KPiBDYzogcWVtdS1k
ZXZlbEBub25nbnUub3JnOyB4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmc7IFN0ZWZhbm8g
U3RhYmVsbGluaSA8c3N0YWJlbGxpbmlAa2VybmVsLm9yZz4KPiBTdWJqZWN0OiBSZTogW1BBVENI
IDQvNF0geGVuOiBBdm9pZCBWTEEKPiAKPiBPbiBNb24sIEp1biAxNywgMjAxOSBhdCAwNTozOTow
OVBNICswMTAwLCBQYXVsIER1cnJhbnQgd3JvdGU6Cj4gPiA+IEBAIC02MzIsNiArNjMzLDggQEAg
c3RhdGljIHZvaWQgeGVuX3N5bmNfZGlydHlfYml0bWFwKFhlbklPU3RhdGUgKnN0YXRlLAo+ID4g
PiAgICAgICAgICByZXR1cm47Cj4gPiA+ICAgICAgfQo+ID4gPgo+ID4gPiArICAgIGJpdG1hcCA9
IGdfbmV3MCh1bnNpZ25lZCBsb25nLCBiaXRtYXBfc2l6ZSk7Cj4gPiA+ICsKPiA+Cj4gPiBIb3cg
aG90IGlzIHRoaXMgZnVuY3Rpb24/IEl0IGxvb2tzICh1bnN1cnByaXNpbmdseSkgbGlrZSB0aGUg
c2VjdGlvbgo+ID4gc2l6ZSBkZXRlcm1pbmVzIHRoZSBtYXAgc2l6ZSBzbyBJIHdvbmRlciB3aGV0
aGVyIGl0IGNhbiBpbnN0ZWFkIGJlCj4gPiBhbGxvY2F0ZWQgb25jZSB3aGVuIHRoZSBzZWN0aW9u
IGlzIGFkZGVkPwo+IAo+IEkgdGhpbmsgd2UgY2FuIHN0b3JlIHRoZSBiaXRtYXAgYnVmZmVyIGlu
dG8gdGhlIGBzdGF0ZScgd2hlcmUKPiBgbG9nX2Zvcl9kaXJ0eWJpdCcgaXMgYWxyZWFkeSBwcmVz
ZW50LCBhbmQgZnJlZSB0aGUgYml0bWFwIHdoZW4KPiBgbG9nX2Zvcl9kaXJ0eWJpdCcgaXMgY2xl
YXJlZC4KClRoYXQgc291bmRzIGJldHRlciA6LSkKCkNoZWVycywKCiAgUGF1bAoKPiAKPiBUaGFu
a3MsCj4gCj4gLS0KPiBBbnRob255IFBFUkFSRAoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlz
dHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL3hlbi1kZXZlbA==
