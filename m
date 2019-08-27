Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DD189E4B9
	for <lists+xen-devel@lfdr.de>; Tue, 27 Aug 2019 11:47:11 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i2Y22-0001wX-S6; Tue, 27 Aug 2019 09:44:54 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=deUM=WX=citrix.com=paul.durrant@srs-us1.protection.inumbo.net>)
 id 1i2Y21-0001wS-K6
 for xen-devel@lists.xenproject.org; Tue, 27 Aug 2019 09:44:53 +0000
X-Inumbo-ID: 51365b46-c8af-11e9-8980-bc764e2007e4
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 51365b46-c8af-11e9-8980-bc764e2007e4;
 Tue, 27 Aug 2019 09:44:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1566899092;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=DX4oOpDsY33vAk0aDmO5lJ3NCIk2/NjTQmYB4BMZtUc=;
 b=Wc265XU5zrd3PR/pBWZtYLMoefnRH+ziV1QqrJMBPn0cPHL7VQGrQxQN
 UnIkKrih0RyFAWjDIG8OApYa+9VlFM5hTDSaXUYDel9lNc/It84d5Bq8g
 H89Am+ZqhACOnIJvBvx2YTMI2PktxjY3JA+BUs/5VL9bH0AnSS1f5IwWo 8=;
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
IronPort-SDR: woavd0/T7knpnaegmG6zQXiLI51w2HzGAZ/NdfYfT3dMn5+ipMkpFA+bhzKh3tu2n2rtLvWWBb
 QTtfrNkuesaBpRfOfJYOOuuIa61AJ+bX5rvU9YtYG7Axo8SnV/yRj5xWbxvTi8Uz/WrHnOIHXb
 IOHr/b/9pLu1kQ++HQ5qzVt72zLa+slP0LixGAbTY1bhVzLgckS1H7Vac6GsqlS7vr5v0Uj1w/
 niKle4yUkoFg3LxHrfZDJfDdxRW4Pgsn0KWDEXm5wB0zJy9llHbFG+VC3cBRvqBv5eiuV2Atl2
 iX0=
X-SBRS: 2.7
X-MesageID: 4978399
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,436,1559534400"; 
   d="scan'208";a="4978399"
From: Paul Durrant <Paul.Durrant@citrix.com>
To: Anthony Perard <anthony.perard@citrix.com>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>
Thread-Topic: [PATCH v2 1/2] xen-bus: Fix backend state transition on device
 reset
Thread-Index: AQHVWZu40FkCyruIxkOY4hQyauVsBKcOxNHg
Date: Tue, 27 Aug 2019 09:44:48 +0000
Message-ID: <fae714e07fce4694b9555da6bc986663@AMSPEX02CL03.citrite.net>
References: <20190823101534.465-1-anthony.perard@citrix.com>
 <20190823101534.465-2-anthony.perard@citrix.com>
In-Reply-To: <20190823101534.465-2-anthony.perard@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH v2 1/2] xen-bus: Fix backend state
 transition on device reset
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
b255LnBlcmFyZEBjaXRyaXguY29tPgo+IFNlbnQ6IDIzIEF1Z3VzdCAyMDE5IDExOjE2Cj4gVG86
IHFlbXUtZGV2ZWxAbm9uZ251Lm9yZwo+IENjOiBBbnRob255IFBlcmFyZCA8YW50aG9ueS5wZXJh
cmRAY2l0cml4LmNvbT47IHFlbXUtc3RhYmxlQG5vbmdudS5vcmc7IFN0ZWZhbm8gU3RhYmVsbGlu
aQo+IDxzc3RhYmVsbGluaUBrZXJuZWwub3JnPjsgUGF1bCBEdXJyYW50IDxQYXVsLkR1cnJhbnRA
Y2l0cml4LmNvbT47IHhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwo+IFN1YmplY3Q6IFtQ
QVRDSCB2MiAxLzJdIHhlbi1idXM6IEZpeCBiYWNrZW5kIHN0YXRlIHRyYW5zaXRpb24gb24gZGV2
aWNlIHJlc2V0Cj4gCj4gV2hlbiBhIGZyb250ZW5kIHdhbnRzIHRvIHJlc2V0IGl0cyBzdGF0ZSBh
bmQgdGhlIGJhY2tlbmQgb25lLCBpdAo+IHN0YXJ0cyB3aXRoIHNldHRpbmcgIkNsb3NpbmciLCB0
aGVuIHdhaXRzIGZvciB0aGUgYmFja2VuZCAoUUVNVSkgdG8gZG8KPiB0aGUgc2FtZS4KPiAKPiBC
dXQgd2hlbiBRRU1VIGlzIHNldHRpbmcgIkNsb3NpbmciIHRvIGl0cyBzdGF0ZSwgaXQgdHJpZ2dl
cnMgYW4gZXZlbnQKPiAoeGVuc3RvcmUgd2F0Y2gpIHRoYXQgcmUtZXhlY3V0ZSB4ZW5fZGV2aWNl
X2JhY2tlbmRfY2hhbmdlZCgpIGFuZCBzZXQKPiB0aGUgYmFja2VuZCBzdGF0ZSB0byAiQ2xvc2Vk
Ii4gUUVNVSBzaG91bGQgd2FpdCBmb3IgdGhlIGZyb250ZW5kIHRvCj4gc2V0ICJDbG9zZWQiIGJl
Zm9yZSBkb2luZyB0aGUgc2FtZS4KPiAKPiBCZWZvcmUgc2V0dGluZyAiQ2xvc2VkIiB0byB0aGUg
YmFja2VuZF9zdGF0ZSwgd2UgYXJlIGFsc28gZ29pbmcgdG8KPiBjaGVjayBpZiB0aGVyZSBpcyBh
IGZyb250ZW5kLiBJZiB0aGF0IHRoZSBjYXNlLCB3aGVuIHRoZSBiYWNrZW5kIHN0YXRlCj4gaXMg
c2V0IHRvICJDbG9zaW5nIiB0aGUgZnJvbnRlbmQgc2hvdWxkIHJlYWN0IGFuZCBzZXRzIGl0cyBz
dGF0ZSB0bwo+ICJDbG9zaW5nIiB0aGVuICJDbG9zZWQiLiBUaGUgYmFja2VuZCBzaG91bGQgd2Fp
dCBmb3IgdGhhdCB0byBoYXBwZW4uCj4gCj4gRml4ZXM6IGI2YWY4OTI2ZmI4NThjNGYxNDI2ZTVh
Y2IyY2ZjMWYwNTgwZWM5OGEKPiBTaWduZWQtb2ZmLWJ5OiBBbnRob255IFBFUkFSRCA8YW50aG9u
eS5wZXJhcmRAY2l0cml4LmNvbT4KClJldmlld2VkLWJ5OiBQYXVsIER1cnJhbnQgPHBhdWwuZHVy
cmFudEBjaXRyaXguY29tPgoKPiAtLS0KPiBDYzogcWVtdS1zdGFibGVAbm9uZ251Lm9yZwo+IC0t
LQo+IAo+IE5vdGVzOgo+ICAgICB2MjoKPiAgICAgLSB1c2UgYSBoZWxwZXIKPiAgICAgLSBBZGQg
SW5pdFdhaXQgYW5kIEluaXRpYWxpc2VkIHRvIHRoZSBsaXN0IG9mIGFjdGl2ZSBzdGF0ZQo+IAo+
ICBody94ZW4veGVuLWJ1cy5jIHwgMjMgKysrKysrKysrKysrKysrKysrKystLS0KPiAgMSBmaWxl
IGNoYW5nZWQsIDIwIGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdp
dCBhL2h3L3hlbi94ZW4tYnVzLmMgYi9ody94ZW4veGVuLWJ1cy5jCj4gaW5kZXggZTQwNTAwMjQy
ZC4uNjJjMTI3YjkyNiAxMDA2NDQKPiAtLS0gYS9ody94ZW4veGVuLWJ1cy5jCj4gKysrIGIvaHcv
eGVuL3hlbi1idXMuYwo+IEBAIC01MTYsNiArNTE2LDIzIEBAIHN0YXRpYyB2b2lkIHhlbl9kZXZp
Y2VfYmFja2VuZF9zZXRfb25saW5lKFhlbkRldmljZSAqeGVuZGV2LCBib29sIG9ubGluZSkKPiAg
ICAgIHhlbl9kZXZpY2VfYmFja2VuZF9wcmludGYoeGVuZGV2LCAib25saW5lIiwgIiV1Iiwgb25s
aW5lKTsKPiAgfQo+IAo+ICsvKgo+ICsgKiBUZWxsIGZyb20gdGhlIHN0YXRlIHdoZXRoZXIgdGhl
IGZyb250ZW5kIGlzIGxpa2VseSBhbGl2ZSwKPiArICogaS5lLiBpdCB3aWxsIHJlYWN0IHRvIGEg
Y2hhbmdlIG9mIHN0YXRlIG9mIHRoZSBiYWNrZW5kLgo+ICsgKi8KPiArc3RhdGljIGJvb2wgeGVu
X2RldmljZV9zdGF0ZV9pc19hY3RpdmUoZW51bSB4ZW5idXNfc3RhdGUgc3RhdGUpCj4gK3sKPiAr
ICAgIHN3aXRjaCAoc3RhdGUpIHsKPiArICAgIGNhc2UgWGVuYnVzU3RhdGVJbml0V2FpdDoKPiAr
ICAgIGNhc2UgWGVuYnVzU3RhdGVJbml0aWFsaXNlZDoKPiArICAgIGNhc2UgWGVuYnVzU3RhdGVD
b25uZWN0ZWQ6Cj4gKyAgICBjYXNlIFhlbmJ1c1N0YXRlQ2xvc2luZzoKPiArICAgICAgICByZXR1
cm4gdHJ1ZTsKPiArICAgIGRlZmF1bHQ6Cj4gKyAgICAgICAgcmV0dXJuIGZhbHNlOwo+ICsgICAg
fQo+ICt9Cj4gKwo+ICBzdGF0aWMgdm9pZCB4ZW5fZGV2aWNlX2JhY2tlbmRfY2hhbmdlZCh2b2lk
ICpvcGFxdWUpCj4gIHsKPiAgICAgIFhlbkRldmljZSAqeGVuZGV2ID0gb3BhcXVlOwo+IEBAIC01
MzksMTEgKzU1NiwxMSBAQCBzdGF0aWMgdm9pZCB4ZW5fZGV2aWNlX2JhY2tlbmRfY2hhbmdlZCh2
b2lkICpvcGFxdWUpCj4gCj4gICAgICAvKgo+ICAgICAgICogSWYgdGhlIHRvb2xzdGFjayAob3Ig
dW5wbHVnIHJlcXVlc3QgY2FsbGJhY2spIGhhcyBzZXQgdGhlIGJhY2tlbmQKPiAtICAgICAqIHN0
YXRlIHRvIENsb3NpbmcsIGJ1dCB0aGVyZSBpcyBubyBhY3RpdmUgZnJvbnRlbmQgKGkuZS4gdGhl
Cj4gLSAgICAgKiBzdGF0ZSBpcyBub3QgQ29ubmVjdGVkKSB0aGVuIHNldCB0aGUgYmFja2VuZCBz
dGF0ZSB0byBDbG9zZWQuCj4gKyAgICAgKiBzdGF0ZSB0byBDbG9zaW5nLCBidXQgdGhlcmUgaXMg
bm8gYWN0aXZlIGZyb250ZW5kIHRoZW4gc2V0IHRoZQo+ICsgICAgICogYmFja2VuZCBzdGF0ZSB0
byBDbG9zZWQuCj4gICAgICAgKi8KPiAgICAgIGlmICh4ZW5kZXYtPmJhY2tlbmRfc3RhdGUgPT0g
WGVuYnVzU3RhdGVDbG9zaW5nICYmCj4gLSAgICAgICAgeGVuZGV2LT5mcm9udGVuZF9zdGF0ZSAh
PSBYZW5idXNTdGF0ZUNvbm5lY3RlZCkgewo+ICsgICAgICAgICF4ZW5fZGV2aWNlX3N0YXRlX2lz
X2FjdGl2ZShzdGF0ZSkpIHsKPiAgICAgICAgICB4ZW5fZGV2aWNlX2JhY2tlbmRfc2V0X3N0YXRl
KHhlbmRldiwgWGVuYnVzU3RhdGVDbG9zZWQpOwo+ICAgICAgfQo+IAo+IC0tCj4gQW50aG9ueSBQ
RVJBUkQKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpY
ZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRw
czovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
