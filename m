Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B5474892D
	for <lists+xen-devel@lfdr.de>; Mon, 17 Jun 2019 18:41:22 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hcuf6-0006X3-22; Mon, 17 Jun 2019 16:39:16 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=SIu5=UQ=citrix.com=paul.durrant@srs-us1.protection.inumbo.net>)
 id 1hcuf4-0006Wy-FF
 for xen-devel@lists.xenproject.org; Mon, 17 Jun 2019 16:39:14 +0000
X-Inumbo-ID: 7021f9f6-911e-11e9-8980-bc764e045a96
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 7021f9f6-911e-11e9-8980-bc764e045a96;
 Mon, 17 Jun 2019 16:39:13 +0000 (UTC)
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=Paul.Durrant@citrix.com;
 spf=Pass smtp.mailfrom=Paul.Durrant@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 Paul.Durrant@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="Paul.Durrant@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa2.hc3370-68.iphmx.com: domain of
 Paul.Durrant@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="Paul.Durrant@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: 1gwkY5Lv97S4TgN9d1H12WB/0Op1OfIsg4AYQGofvlu8QPJIJy5VWyF2VFyveuyirdnCI/wFoX
 CTqJ/b57X/OEh7J/QParU2M2HB+wCjlLNX1mhZwOJub0wVbOWaro+bHF7ZsSnoKGy0HsalZicJ
 YAJzvZc7EpBYag+8V5hRiZwKUtk1IAmOlLgdl6NczV7MtAAH9Xu0noilRSFMiZF5nSc+wQyIYU
 D3ZYhXRL7LUG3vEyW4A9gNzTrBzBum7iS94eFZYwXJ8BPd++3If/bRLsMsoQofa1qZXlvvTnbG
 6Js=
X-SBRS: 2.7
X-MesageID: 1835173
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.63,385,1557201600"; 
   d="scan'208";a="1835173"
From: Paul Durrant <Paul.Durrant@citrix.com>
To: Anthony Perard <anthony.perard@citrix.com>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>
Thread-Topic: [PATCH 4/4] xen: Avoid VLA
Thread-Index: AQHVJSMYaL9Ko3kp1kKDxJjcc8OjZKagC0EQ
Date: Mon, 17 Jun 2019 16:39:09 +0000
Message-ID: <a3843cb971bc4fa8886170d0b2461a44@AMSPEX02CL03.citrite.net>
References: <20190617154105.32323-1-anthony.perard@citrix.com>
 <20190617154105.32323-5-anthony.perard@citrix.com>
In-Reply-To: <20190617154105.32323-5-anthony.perard@citrix.com>
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
Cc: Anthony Perard <anthony.perard@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQo+IEZyb206IEFudGhvbnkgUEVSQVJEIFttYWls
dG86YW50aG9ueS5wZXJhcmRAY2l0cml4LmNvbV0KPiBTZW50OiAxNyBKdW5lIDIwMTkgMTY6NDEK
PiBUbzogcWVtdS1kZXZlbEBub25nbnUub3JnCj4gQ2M6IHhlbi1kZXZlbEBsaXN0cy54ZW5wcm9q
ZWN0Lm9yZzsgQW50aG9ueSBQZXJhcmQgPGFudGhvbnkucGVyYXJkQGNpdHJpeC5jb20+OyBTdGVm
YW5vIFN0YWJlbGxpbmkKPiA8c3N0YWJlbGxpbmlAa2VybmVsLm9yZz47IFBhdWwgRHVycmFudCA8
UGF1bC5EdXJyYW50QGNpdHJpeC5jb20+Cj4gU3ViamVjdDogW1BBVENIIDQvNF0geGVuOiBBdm9p
ZCBWTEEKPiAKPiBBdm9pZCB1c2luZyBhIHZhcmlhYmxlIGxlbmd0aCBhcnJheS4KPiAKPiBTaWdu
ZWQtb2ZmLWJ5OiBBbnRob255IFBFUkFSRCA8YW50aG9ueS5wZXJhcmRAY2l0cml4LmNvbT4KPiAt
LS0KPiAKPiBOb3RlczoKPiAgICAgV2FzIHN1Z2dlc3RlZCBieSBQZXRlciBoZXJlOgo+ICAgICA8
Q0FGRUFjQTg4K0Eyb0NrUW54S0RFZHBtZkNaU21QeldNQmcwMXdERFY2OGJNWm9ZNUpnQG1haWwu
Z21haWwuY29tPgo+ICAgICAic2hvdWxkIHdlIHRyeSB0byBzdG9wIHVzaW5nIHZhcmlhYmxlIGxl
bmd0aCBhcnJheXM/Igo+IAo+ICBody9pMzg2L3hlbi94ZW4taHZtLmMgfCAxMSArKysrKysrKy0t
LQo+ICAxIGZpbGUgY2hhbmdlZCwgOCBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQo+IAo+
IGRpZmYgLS1naXQgYS9ody9pMzg2L3hlbi94ZW4taHZtLmMgYi9ody9pMzg2L3hlbi94ZW4taHZt
LmMKPiBpbmRleCA3MjVmOWMyMjc4Li4xMGQ3M2I1NWI0IDEwMDY0NAo+IC0tLSBhL2h3L2kzODYv
eGVuL3hlbi1odm0uYwo+ICsrKyBiL2h3L2kzODYveGVuL3hlbi1odm0uYwo+IEBAIC02MTUsNyAr
NjE1LDggQEAgc3RhdGljIHZvaWQgeGVuX3N5bmNfZGlydHlfYml0bWFwKFhlbklPU3RhdGUgKnN0
YXRlLAo+ICB7Cj4gICAgICBod2FkZHIgbnBhZ2VzID0gc2l6ZSA+PiBUQVJHRVRfUEFHRV9CSVRT
Owo+ICAgICAgY29uc3QgaW50IHdpZHRoID0gc2l6ZW9mKHVuc2lnbmVkIGxvbmcpICogODsKPiAt
ICAgIHVuc2lnbmVkIGxvbmcgYml0bWFwW0RJVl9ST1VORF9VUChucGFnZXMsIHdpZHRoKV07Cj4g
KyAgICB1bnNpZ25lZCBsb25nICpiaXRtYXAgPSBOVUxMOwo+ICsgICAgc2l6ZV90IGJpdG1hcF9z
aXplID0gRElWX1JPVU5EX1VQKG5wYWdlcywgd2lkdGgpOwo+ICAgICAgaW50IHJjLCBpLCBqOwo+
ICAgICAgY29uc3QgWGVuUGh5c21hcCAqcGh5c21hcCA9IE5VTEw7Cj4gCj4gQEAgLTYzMiw2ICs2
MzMsOCBAQCBzdGF0aWMgdm9pZCB4ZW5fc3luY19kaXJ0eV9iaXRtYXAoWGVuSU9TdGF0ZSAqc3Rh
dGUsCj4gICAgICAgICAgcmV0dXJuOwo+ICAgICAgfQo+IAo+ICsgICAgYml0bWFwID0gZ19uZXcw
KHVuc2lnbmVkIGxvbmcsIGJpdG1hcF9zaXplKTsKPiArCgpIb3cgaG90IGlzIHRoaXMgZnVuY3Rp
b24/IEl0IGxvb2tzICh1bnN1cnByaXNpbmdseSkgbGlrZSB0aGUgc2VjdGlvbiBzaXplIGRldGVy
bWluZXMgdGhlIG1hcCBzaXplIHNvIEkgd29uZGVyIHdoZXRoZXIgaXQgY2FuIGluc3RlYWQgYmUg
YWxsb2NhdGVkIG9uY2Ugd2hlbiB0aGUgc2VjdGlvbiBpcyBhZGRlZD8KCiAgUGF1bAoKPiAgICAg
IHJjID0geGVuX3RyYWNrX2RpcnR5X3ZyYW0oeGVuX2RvbWlkLCBzdGFydF9hZGRyID4+IFRBUkdF
VF9QQUdFX0JJVFMsCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIG5wYWdlcywgYml0
bWFwKTsKPiAgICAgIGlmIChyYyA8IDApIHsKPiBAQCAtNjQ0LDEwICs2NDcsMTAgQEAgc3RhdGlj
IHZvaWQgeGVuX3N5bmNfZGlydHlfYml0bWFwKFhlbklPU3RhdGUgKnN0YXRlLAo+ICAgICAgICAg
ICAgICAgICAgICAgICIsIDB4IiBUQVJHRVRfRk1UX3BseCAiKTogJXNcbiIsCj4gICAgICAgICAg
ICAgICAgICAgICAgc3RhcnRfYWRkciwgc3RhcnRfYWRkciArIHNpemUsIHN0cmVycm9yKGVycm5v
KSk7Cj4gICAgICAgICAgfQo+IC0gICAgICAgIHJldHVybjsKPiArICAgICAgICBnb3RvIG91dDsK
PiAgICAgIH0KPiAKPiAtICAgIGZvciAoaSA9IDA7IGkgPCBBUlJBWV9TSVpFKGJpdG1hcCk7IGkr
Kykgewo+ICsgICAgZm9yIChpID0gMDsgaSA8IGJpdG1hcF9zaXplOyBpKyspIHsKPiAgICAgICAg
ICB1bnNpZ25lZCBsb25nIG1hcCA9IGJpdG1hcFtpXTsKPiAgICAgICAgICB3aGlsZSAobWFwICE9
IDApIHsKPiAgICAgICAgICAgICAgaiA9IGN0emwobWFwKTsKPiBAQCAtNjU3LDYgKzY2MCw4IEBA
IHN0YXRpYyB2b2lkIHhlbl9zeW5jX2RpcnR5X2JpdG1hcChYZW5JT1N0YXRlICpzdGF0ZSwKPiAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgVEFSR0VUX1BBR0VfU0laRSk7Cj4g
ICAgICAgICAgfTsKPiAgICAgIH0KPiArb3V0Ogo+ICsgICAgZ19mcmVlKGJpdG1hcCk7Cj4gIH0K
PiAKPiAgc3RhdGljIHZvaWQgeGVuX2xvZ19zdGFydChNZW1vcnlMaXN0ZW5lciAqbGlzdGVuZXIs
Cj4gLS0KPiBBbnRob255IFBFUkFSRAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhl
bnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5m
by94ZW4tZGV2ZWw=
