Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CB93597651
	for <lists+xen-devel@lfdr.de>; Wed, 21 Aug 2019 11:41:15 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i0N2t-0003Wy-RF; Wed, 21 Aug 2019 09:36:47 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=5qki=WR=citrix.com=paul.durrant@srs-us1.protection.inumbo.net>)
 id 1i0N2s-0003Wt-C1
 for xen-devel@lists.xenproject.org; Wed, 21 Aug 2019 09:36:46 +0000
X-Inumbo-ID: 2fdef9e2-c3f7-11e9-b95f-bc764e2007e4
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2fdef9e2-c3f7-11e9-b95f-bc764e2007e4;
 Wed, 21 Aug 2019 09:36:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1566380204;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=3Za6ueqMEMQTxZh0sc8rkXJ3d1mePjvqKfEBaHh/BYI=;
 b=hXKlsYLg7KsP4alHSLV/OrLn6ReeWdXscOstQPYR8QPDkMPgIPp51unk
 1nw5PwP6M4PVT5fnQxFHtUZNSwhYY2tBX5v2TJn+9IX1yxqZ2xujELCfP
 NpXlRmKqbhDc930X4XDCrXLrInstTeUZPumi8MQmBHPZCH+Nw1GpcLguE E=;
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
IronPort-SDR: H4woLz1aaVwkUFz3ySjTVybCT/MF1ugMwBpbyhDR8GWccbm3UjbGVa6vw2aU22bP0l8ORL29wC
 imKHNnqwblbsG1WTbopwGBhv94Kh9OjjjAcU2BC+nXUCTvXQnlcfTXLfSEOZJfB24Zcxmio6OB
 WP3dZP5p9m27xgjIlfeBgXLtruLt/JdM2DkYu1lmkY0aXrSCYoPnOjzU0c9EDICAZkAKpZtBqG
 vxxRQ25800iTQpB5vUZr/l8FXzE/Jr0SgwMlDiqP/HE2ZHTLTk0LNu2cr8Gcb2kx6TyLq9+hVG
 52k=
X-SBRS: 2.7
X-MesageID: 4765255
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,412,1559534400"; 
   d="scan'208";a="4765255"
From: Paul Durrant <Paul.Durrant@citrix.com>
To: Anthony Perard <anthony.perard@citrix.com>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>
Thread-Topic: [PATCH 1/2] xen-bus: Fix backend state transition on device reset
Thread-Index: AQHVWAGpRkr1DBFa80ag1hnV7DDUQKcFVfWw
Date: Wed, 21 Aug 2019 09:36:40 +0000
Message-ID: <b3a6a2e0022c4785a4a04a809d948cef@AMSPEX02CL03.citrite.net>
References: <20190821092020.17952-1-anthony.perard@citrix.com>
 <20190821092020.17952-2-anthony.perard@citrix.com>
In-Reply-To: <20190821092020.17952-2-anthony.perard@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH 1/2] xen-bus: Fix backend state transition
 on device reset
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
Cc: Anthony Perard <anthony.perard@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 "qemu-stable@nongnu.org" <qemu-stable@nongnu.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQo+IEZyb206IEFudGhvbnkgUEVSQVJEIDxhbnRo
b255LnBlcmFyZEBjaXRyaXguY29tPgo+IFNlbnQ6IDIxIEF1Z3VzdCAyMDE5IDEwOjIwCj4gVG86
IHFlbXUtZGV2ZWxAbm9uZ251Lm9yZwo+IENjOiBBbnRob255IFBlcmFyZCA8YW50aG9ueS5wZXJh
cmRAY2l0cml4LmNvbT47IHFlbXUtc3RhYmxlQG5vbmdudS5vcmc7IFN0ZWZhbm8gU3RhYmVsbGlu
aQo+IDxzc3RhYmVsbGluaUBrZXJuZWwub3JnPjsgUGF1bCBEdXJyYW50IDxQYXVsLkR1cnJhbnRA
Y2l0cml4LmNvbT47IHhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwo+IFN1YmplY3Q6IFtQ
QVRDSCAxLzJdIHhlbi1idXM6IEZpeCBiYWNrZW5kIHN0YXRlIHRyYW5zaXRpb24gb24gZGV2aWNl
IHJlc2V0Cj4gCj4gV2hlbiBhIGZyb250ZW5kIHdhbnQgdG8gcmVzZXQgaXRzIHN0YXRlIGFuZCB0
aGUgYmFja2VuZCBvbmUsIGl0IHN0YXJ0Cj4gd2l0aCBzZXR0aW5nICJDbG9zaW5nIiwgdGhlbiB3
YWl0IGZvciB0aGUgYmFja2VuZCAoUUVNVSkgdG8gZG8gdGhlIHNhbWUuCj4gCj4gQnV0IHdoZW4g
UUVNVSBpcyBzZXR0aW5nICJDbG9zaW5nIiB0byBpdHMgc3RhdGUsIGl0IHRyaWdnZXIgYW4gZXZl
bnQKPiAoeGVuc3RvcmUgd2F0Y2gpIHRoYXQgcmUtZXhlY3V0ZSB4ZW5fZGV2aWNlX2JhY2tlbmRf
Y2hhbmdlZCgpIGFuZCBzZXQKPiB0aGUgYmFja2VuZCBzdGF0ZSB0byAiQ2xvc2VkIi4gUUVNVSBz
aG91bGQgd2FpdCBmb3IgdGhlIGZyb250ZW5kIHRvCj4gc2V0ICJDbG9zZWQiIGJlZm9yZSBkb2lu
ZyB0aGUgc2FtZS4KPiAKPiBCZWZvcmUgc2V0dGluZyAiQ2xvc2VkIiB0byB0aGUgYmFja2VuZF9z
dGF0ZSwgd2UgYXJlIGFsc28gZ29pbmcgdG8KPiBjaGVjayBpZiB0aGUgZnJvbnRlbmQgd2FzIHJl
c3BvbnNpYmxlIGZvciB0aGUgdHJhbnNpdGlvbiB0byAiQ2xvc2luZyIuCj4gCj4gRml4ZXM6IGI2
YWY4OTI2ZmI4NThjNGYxNDI2ZTVhY2IyY2ZjMWYwNTgwZWM5OGEKPiBTaWduZWQtb2ZmLWJ5OiBB
bnRob255IFBFUkFSRCA8YW50aG9ueS5wZXJhcmRAY2l0cml4LmNvbT4KPiAtLS0KPiBDYzogcWVt
dS1zdGFibGVAbm9uZ251Lm9yZwo+IC0tLQo+ICBody94ZW4veGVuLWJ1cy5jIHwgNCArKystCj4g
IDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKPiAKPiBkaWZm
IC0tZ2l0IGEvaHcveGVuL3hlbi1idXMuYyBiL2h3L3hlbi94ZW4tYnVzLmMKPiBpbmRleCBlNDA1
MDAyNDJkLi45ODJlY2E0NTMzIDEwMDY0NAo+IC0tLSBhL2h3L3hlbi94ZW4tYnVzLmMKPiArKysg
Yi9ody94ZW4veGVuLWJ1cy5jCj4gQEAgLTU0MCw5ICs1NDAsMTEgQEAgc3RhdGljIHZvaWQgeGVu
X2RldmljZV9iYWNrZW5kX2NoYW5nZWQodm9pZCAqb3BhcXVlKQo+ICAgICAgLyoKPiAgICAgICAq
IElmIHRoZSB0b29sc3RhY2sgKG9yIHVucGx1ZyByZXF1ZXN0IGNhbGxiYWNrKSBoYXMgc2V0IHRo
ZSBiYWNrZW5kCj4gICAgICAgKiBzdGF0ZSB0byBDbG9zaW5nLCBidXQgdGhlcmUgaXMgbm8gYWN0
aXZlIGZyb250ZW5kIChpLmUuIHRoZQo+IC0gICAgICogc3RhdGUgaXMgbm90IENvbm5lY3RlZCkg
dGhlbiBzZXQgdGhlIGJhY2tlbmQgc3RhdGUgdG8gQ2xvc2VkLgo+ICsgICAgICogc3RhdGUgaXMg
bm90IENvbm5lY3RlZCBvciBDbG9zaW5nKSB0aGVuIHNldCB0aGUgYmFja2VuZCBzdGF0ZQo+ICsg
ICAgICogdG8gQ2xvc2VkLgo+ICAgICAgICovCj4gICAgICBpZiAoeGVuZGV2LT5iYWNrZW5kX3N0
YXRlID09IFhlbmJ1c1N0YXRlQ2xvc2luZyAmJgo+ICsgICAgICAgIHhlbmRldi0+ZnJvbnRlbmRf
c3RhdGUgIT0gWGVuYnVzU3RhdGVDbG9zaW5nICYmCj4gICAgICAgICAgeGVuZGV2LT5mcm9udGVu
ZF9zdGF0ZSAhPSBYZW5idXNTdGF0ZUNvbm5lY3RlZCkgewo+ICAgICAgICAgIHhlbl9kZXZpY2Vf
YmFja2VuZF9zZXRfc3RhdGUoeGVuZGV2LCBYZW5idXNTdGF0ZUNsb3NlZCk7CgpBY3R1YWxseSwg
SSB3b25kZXIgd2hldGhlciBpdCBpcyBiZXR0ZXIgdG8gJ3doaXRlbGlzdCcgaGVyZT8gQUZBSUsg
dGhlIG9ubHkgdmFsaWQgZnJvbnRlbmQgc3RhdGVzIHdoZXRoZXIgdGhlIGJhY2tlbmQgc2hvdWxk
IHNldCBpdHNlbGYgJ2Nsb3NlZCcgYXJlICdjbG9zZWQnIChpLmUuIHRoZSBmcm9udGVuZCBpcyBm
aW5pc2hlZCkgYW5kICdpbml0aWFsaXNpbmcnICh0aGUgZnJvbnRlbmQgd2FzIG5ldmVyIHRoZXJl
KS4KCiAgUGF1bAoKPiAgICAgIH0KPiAtLQo+IEFudGhvbnkgUEVSQVJECgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlz
dApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
