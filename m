Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5424C975D4
	for <lists+xen-devel@lfdr.de>; Wed, 21 Aug 2019 11:17:18 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i0MgW-0001EL-5M; Wed, 21 Aug 2019 09:13:40 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=5qki=WR=citrix.com=paul.durrant@srs-us1.protection.inumbo.net>)
 id 1i0MgU-0001EG-DL
 for xen-devel@lists.xenproject.org; Wed, 21 Aug 2019 09:13:38 +0000
X-Inumbo-ID: f0f85438-c3f3-11e9-adc2-12813bfff9fa
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f0f85438-c3f3-11e9-adc2-12813bfff9fa;
 Wed, 21 Aug 2019 09:13:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1566378810;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=czwFKGcLnJoHLowOx9glXsIHilFAh4h8MbZdyVNYAQA=;
 b=IzjWHtgPjVH8rAPipzTGeWJWapSNzxdCetCX9g2KalQiHy0hmb761rmV
 Vcb8ENLb6Y/m7cgyCJSOWXBsI2iUK9FuiWr6LGbxMi6Dymp3FB032pMga
 MGQVaSkzOkzIRkdJ3kwjwHwlEAKJ7PLWQ+jPg+I7LzQAcI1zQbY/jjUnQ c=;
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
IronPort-SDR: l8alASlorfuFb1pO1/hGtdMAUYRnKYRN1nGFRfEA5WIxLBdhooxYbh5AIi9RtOKTvlNrqRW1wk
 QaAppczybw6I0ExOMoCReJlq1o1lAYvG6bvRQd0aUtDM60IWI4c634TGT6UTvEGVNEYDfB0Fqa
 NkrOU+Fdm93NyMKej1rQg9l5RZRrQco49HhuwfT5AFN7wSBrTjbqzU84szxqhVsQsI9Jz+bdqZ
 E1HR+TlDfRHBli6aup33GdrvfFpXknzp4ZZqt8pyevTzx+l9w1Q78yZ7QKsLg7slKm6v8opGY0
 POg=
X-SBRS: 2.7
X-MesageID: 4731622
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,412,1559534400"; 
   d="scan'208";a="4731622"
From: Paul Durrant <Paul.Durrant@citrix.com>
To: Roger Pau Monne <roger.pau@citrix.com>
Thread-Topic: [PATCH] viridian: make viridian_time_domain_freeze() safe to
 call...
Thread-Index: AQHVV/mnQtTUqvu9F0OLKikMMiALR6cFKfUAgAAnLoA=
Date: Wed, 21 Aug 2019 09:13:26 +0000
Message-ID: <40b248ea31a84e39be5cf521d6acec69@AMSPEX02CL03.citrite.net>
References: <20190821082258.36549-1-paul.durrant@citrix.com>
 <20190821085210.kjx53rseieu2uc5k@Air-de-Roger>
In-Reply-To: <20190821085210.kjx53rseieu2uc5k@Air-de-Roger>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH] viridian: make
 viridian_time_domain_freeze() safe to call...
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Wei
 Liu <wl@xen.org>, Jan
 Beulich <jbeulich@suse.com>, Andrew Cooper <Andrew.Cooper3@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQo+IEZyb206IFJvZ2VyIFBhdSBNb25uZSA8cm9n
ZXIucGF1QGNpdHJpeC5jb20+Cj4gU2VudDogMjEgQXVndXN0IDIwMTkgMDk6NTIKPiBUbzogUGF1
bCBEdXJyYW50IDxQYXVsLkR1cnJhbnRAY2l0cml4LmNvbT4KPiBDYzogeGVuLWRldmVsQGxpc3Rz
LnhlbnByb2plY3Qub3JnOyBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+OyBBbmRyZXcg
Q29vcGVyCj4gPEFuZHJldy5Db29wZXIzQGNpdHJpeC5jb20+OyBXZWkgTGl1IDx3bEB4ZW4ub3Jn
Pgo+IFN1YmplY3Q6IFJlOiBbUEFUQ0hdIHZpcmlkaWFuOiBtYWtlIHZpcmlkaWFuX3RpbWVfZG9t
YWluX2ZyZWV6ZSgpIHNhZmUgdG8gY2FsbC4uLgo+IAo+IE9uIFdlZCwgQXVnIDIxLCAyMDE5IGF0
IDA5OjIyOjU4QU0gKzAxMDAsIFBhdWwgRHVycmFudCB3cm90ZToKPiA+IC4uLm9uIGEgcGFydGlh
bGx5IGRlc3Ryb3llZCBkb21haW4uCj4gPgo+ID4gdmlyaWRpYW5fdGltZV9kb21haW5fZnJlZXpl
KCkgYW5kIHZpcmlkaWFuX3RpbWVfdmNwdV9mcmVlemUoKSByZWx5Cj4gPiAocmVzcGVjdGl2ZWx5
KSBvbiB0aGUgZHluYW1pY2FsbHkgYWxsb2NhdGVkIHBlci1kb21haW4gYW5kIHBlci12Y3B1IHZp
cmlkaWFuCj4gPiBhcmVhcyBbMV0sIHdoaWNoIGFyZSBmcmVlZCBkdXJpbmcgZG9tYWluX3JlbGlu
cXVpc2hfcmVzb3VyY2VzKCkuCj4gPiBCZWNhdXNlIGFyY2hfZG9tYWluX3BhdXNlKCkgY2FuIGNh
bGwgdmlyaWRpYW5fZG9tYWluX3RpbWVfZnJlZXplKCkgdGhpcwo+ID4gY2FuIGxlYWQgdG8gaG9z
dCBjcmFzaGVzIGlmIGUuZy4gYSBYRU5fRE9NQ1RMX3BhdXNlZG9tYWluIGlzIGlzc3VlZCBhZnRl
cgo+ID4gZG9tYWluX3JlbGlucXVpc2hfcmVzb3VyY2VzKCkgaGFzIHJ1bi4KPiA+Cj4gPiBUbyBw
cmV2ZW50IHN1Y2ggY3Jhc2hlcywgdGhpcyBwYXRjaCBhZGRzIGEgY2hlY2sgb2YgaXNfZHlpbmcg
aW50bwo+ID4gdmlyaWRpYW5fdGltZV9kb21haW5fZnJlZXplKCksIGFuZCB2aXJpZGlhbl90aW1l
X2RvbWFpbl90aGF3KCkgd2hpY2ggaXMKPiA+IHNpbWlsYXJseSB2dWxuZXJhYmxlIHRvIGluZGly
ZWN0aW9uIGludG8gZnJlZWQgbWVtb3J5Lgo+ID4KPiA+IE5PVEU6IFRoZSBwYXRjaCBhbHNvIG1h
a2VzIHZpcmlkaWFuX3RpbWVfdmNwdV9mcmVlemUvdGhhdygpIHN0YXRpYywgc2luY2UKPiA+ICAg
ICAgIHRoZXkgaGF2ZSBubyBjYWxsZXJzIG91dHNpZGUgb2YgdGhlIHNhbWUgc291cmNlIG1vZHVs
ZS4KPiA+Cj4gPiBbMV0gU2VlIGNvbW1pdCBlN2E5YjVlNzJmMjYgInZpcmlkaWFuOiBzZXBhcmF0
ZWx5IGFsbG9jYXRlIGRvbWFpbiBhbmQgdmNwdQo+ID4gICAgIHN0cnVjdHVyZXMiLgo+ID4KPiA+
IFNpZ25lZC1vZmYtYnk6IFBhdWwgRHVycmFudCA8cGF1bC5kdXJyYW50QGNpdHJpeC5jb20+Cj4g
Cj4gUmV2aWV3ZWQtYnk6IFJvZ2VyIFBhdSBNb25uw6kgPHJvZ2VyLnBhdUBjaXRyaXguY29tPgo+
IAo+IE5vdGUgeW91IGNvdWxkIGFsc28gZHJvcCB0aGUgdmlyaWRpYW5fIHByZWZpeCB0byB0aGUg
bm93IHN0YXRpYwo+IGZ1bmN0aW9ucy4KPiAKClllYWgsIHRoZXkgY291bGQgYmUgZHJvcHBlZC4g
TWF5IGJlIGEgZnJpZW5kbHkgY29tbWl0dGVyIGNvdWxkIGRvIGl0PyA6LSkKCiAgUGF1bAoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1h
aWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54
ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
