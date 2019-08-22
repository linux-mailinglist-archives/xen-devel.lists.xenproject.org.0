Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1423499102
	for <lists+xen-devel@lfdr.de>; Thu, 22 Aug 2019 12:38:47 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i0kSM-00018D-Qb; Thu, 22 Aug 2019 10:36:38 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=1g6i=WS=citrix.com=paul.durrant@srs-us1.protection.inumbo.net>)
 id 1i0kSL-000188-Ip
 for xen-devel@lists.xenproject.org; Thu, 22 Aug 2019 10:36:37 +0000
X-Inumbo-ID: b75ea76a-c4c8-11e9-8980-bc764e2007e4
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b75ea76a-c4c8-11e9-8980-bc764e2007e4;
 Thu, 22 Aug 2019 10:36:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1566470196;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=/FBm/NcT3AZytSJTpvMcO9mfGZB13QdkUyU9NQAsv2Y=;
 b=ZLzcVbABPqq29bEgEmMc3/UDML41QVhu6C1w9Ez98tXn1V88TVD2MzjS
 7UoJ1kJDq8RQMxb591xCVML9awn/rGVfGn6PZ8U3p/OuFlP+JyVNwSrl0
 Ra54Zbj7vpa0R2HZ9qPwCi+SjUHMtIxw4IZ7/AlJHhGOrIhWmpEYfl6lP Y=;
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
IronPort-SDR: /JXPxTaox28WTZlliNf6bjaxVVWydsKUaY9xYj+bFH0L9kzR2Bod3L+48fh9Ng9cSJJfSViSUW
 td7slS+pKX1ev0Kh6Kl0gJgSIbEaSE7JzYFETrySu0t43z3wMt1urADecLs7MDR7UJBDVCeuKS
 FHmk1jH7V+omGSg4vp1WAKFc2cooi2n1uZnIzvvqOPieth37GEAUaSOMCXBQ+E8TxKBYkkjv8a
 Lj3qQ4mP4T+ApcplS+Ztvv1a6Fz4B+Ts3UoOhPxrHsBWSeWvzqbvaqcVk+7GG7pMhYmQFlXACj
 4Rk=
X-SBRS: 2.7
X-MesageID: 4792964
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,416,1559534400"; 
   d="scan'208";a="4792964"
From: Paul Durrant <Paul.Durrant@citrix.com>
To: Anthony Perard <anthony.perard@citrix.com>
Thread-Topic: [PATCH 2/2] xen-bus: Avoid rewriting identical values to xenstore
Thread-Index: AQHVWAGpK6THQS4Lrk6EcsKhvd7AqqcFuu6QgAEaRACAACIz8A==
Date: Thu, 22 Aug 2019 10:36:32 +0000
Message-ID: <b63f378211d8451d8267f83f0922138e@AMSPEX02CL03.citrite.net>
References: <20190821092020.17952-1-anthony.perard@citrix.com>
 <20190821092020.17952-3-anthony.perard@citrix.com>
 <703d5a46d4c74eb4afd93d76b7341efc@AMSPEX02CL03.citrite.net>
 <20190822102132.GJ1289@perard.uk.xensource.com>
In-Reply-To: <20190822102132.GJ1289@perard.uk.xensource.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH 2/2] xen-bus: Avoid rewriting identical
 values to xenstore
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQo+IEZyb206IEFudGhvbnkgUEVSQVJEIDxhbnRo
b255LnBlcmFyZEBjaXRyaXguY29tPgo+IFNlbnQ6IDIyIEF1Z3VzdCAyMDE5IDExOjIyCj4gVG86
IFBhdWwgRHVycmFudCA8UGF1bC5EdXJyYW50QGNpdHJpeC5jb20+Cj4gQ2M6IHFlbXUtZGV2ZWxA
bm9uZ251Lm9yZzsgU3RlZmFubyBTdGFiZWxsaW5pIDxzc3RhYmVsbGluaUBrZXJuZWwub3JnPjsg
eGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCj4gU3ViamVjdDogUmU6IFtQQVRDSCAyLzJd
IHhlbi1idXM6IEF2b2lkIHJld3JpdGluZyBpZGVudGljYWwgdmFsdWVzIHRvIHhlbnN0b3JlCj4g
Cj4gT24gV2VkLCBBdWcgMjEsIDIwMTkgYXQgMDQ6NDA6MDVQTSArMDEwMCwgUGF1bCBEdXJyYW50
IHdyb3RlOgo+ID4gPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQo+ID4gPiBGcm9tOiBBbnRo
b255IFBFUkFSRCA8YW50aG9ueS5wZXJhcmRAY2l0cml4LmNvbT4KPiA+ID4gU2VudDogMjEgQXVn
dXN0IDIwMTkgMTA6MjAKPiA+ID4gVG86IHFlbXUtZGV2ZWxAbm9uZ251Lm9yZwo+ID4gPiBDYzog
QW50aG9ueSBQZXJhcmQgPGFudGhvbnkucGVyYXJkQGNpdHJpeC5jb20+OyBTdGVmYW5vIFN0YWJl
bGxpbmkgPHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc+OyBQYXVsCj4gPiA+IER1cnJhbnQgPFBhdWwu
RHVycmFudEBjaXRyaXguY29tPjsgeGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCj4gPiA+
IFN1YmplY3Q6IFtQQVRDSCAyLzJdIHhlbi1idXM6IEF2b2lkIHJld3JpdGluZyBpZGVudGljYWwg
dmFsdWVzIHRvIHhlbnN0b3JlCj4gPiA+Cj4gPiA+IFdoZW4gUUVNVSByZWNlaXZlIGEgeGVuc3Rv
cmUgd2F0Y2ggZXZlbnQgc3VnZ2VzdGluZyB0aGF0IHRoZSAic3RhdGUiIG9yCj4gPiA+ICJvbmxp
bmUiIHN0YXR1cyBvZiB0aGUgZnJvbnRlbmQgb3IgdGhlIGJhY2tlbmQgY2hhbmdlZCwgaXQgcmVj
b3JkIHRoaXMKPiA+ID4gaW4gaXRzIG93biBzdGF0ZSBidXQgaXQgYWxzbyByZS13cml0ZSB0aGUg
dmFsdWUgYmFjayBpbnRvIHhlbnN0b3JlIGV2ZW4KPiA+ID4gc28gdGhlcmUgd2VyZSBubyBjaGFu
Z2VkLiBUaGlzIHRyaWdnZXIgYW4gdW5uZWNlc3NhcnkgeGVuc3RvcmUgd2F0Y2gKPiA+ID4gZXZl
bnQgd2hpY2ggUUVNVSB3aWxsIHByb2Nlc3MgYWdhaW4gKGFuZCBtYXliZSB0aGUgZnJvbnRlbmQg
YXMgd2VsbCkuCj4gPiA+Cj4gPiA+IFNpZ25lZC1vZmYtYnk6IEFudGhvbnkgUEVSQVJEIDxhbnRo
b255LnBlcmFyZEBjaXRyaXguY29tPgo+ID4gPiAtLS0KPiA+ID4gIGh3L3hlbi94ZW4tYnVzLmMg
fCAzNyArKysrKysrKysrKysrKysrKysrKysrKystLS0tLS0tLS0tLS0tCj4gPiA+ICAxIGZpbGUg
Y2hhbmdlZCwgMjQgaW5zZXJ0aW9ucygrKSwgMTMgZGVsZXRpb25zKC0pCj4gPiA+Cj4gPiA+IGRp
ZmYgLS1naXQgYS9ody94ZW4veGVuLWJ1cy5jIGIvaHcveGVuL3hlbi1idXMuYwo+ID4gPiBpbmRl
eCA5ODJlY2E0NTMzLi5jODNmMDc0MjRhIDEwMDY0NAo+ID4gPiAtLS0gYS9ody94ZW4veGVuLWJ1
cy5jCj4gPiA+ICsrKyBiL2h3L3hlbi94ZW4tYnVzLmMKPiA+ID4gQEAgLTQ4MSwyMCArNDgxLDI3
IEBAIHN0YXRpYyBpbnQgeGVuX2RldmljZV9iYWNrZW5kX3NjYW5mKFhlbkRldmljZSAqeGVuZGV2
LCBjb25zdCBjaGFyICprZXksCj4gPiA+ICAgICAgcmV0dXJuIHJjOwo+ID4gPiAgfQo+ID4gPgo+
ID4gPiAtdm9pZCB4ZW5fZGV2aWNlX2JhY2tlbmRfc2V0X3N0YXRlKFhlbkRldmljZSAqeGVuZGV2
LAo+ID4gPiAtICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGVudW0geGVuYnVzX3N0
YXRlIHN0YXRlKQo+ID4gPiArc3RhdGljIGJvb2wgeGVuX2RldmljZV9iYWNrZW5kX3JlY29yZF9z
dGF0ZShYZW5EZXZpY2UgKnhlbmRldiwKPiA+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgZW51bSB4ZW5idXNfc3RhdGUgc3RhdGUpCj4gPiA+ICB7Cj4gPiA+
ICAgICAgY29uc3QgY2hhciAqdHlwZSA9IG9iamVjdF9nZXRfdHlwZW5hbWUoT0JKRUNUKHhlbmRl
dikpOwo+ID4gPgo+ID4gPiAgICAgIGlmICh4ZW5kZXYtPmJhY2tlbmRfc3RhdGUgPT0gc3RhdGUp
IHsKPiA+ID4gLSAgICAgICAgcmV0dXJuOwo+ID4gPiArICAgICAgICByZXR1cm4gZmFsc2U7Cj4g
PiA+ICAgICAgfQo+ID4gPgo+ID4gPiAgICAgIHRyYWNlX3hlbl9kZXZpY2VfYmFja2VuZF9zdGF0
ZSh0eXBlLCB4ZW5kZXYtPm5hbWUsCj4gPiA+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIHhzX3N0cnN0YXRlKHN0YXRlKSk7Cj4gPiA+Cj4gPiA+ICAgICAgeGVuZGV2LT5iYWNr
ZW5kX3N0YXRlID0gc3RhdGU7Cj4gPiA+IC0gICAgeGVuX2RldmljZV9iYWNrZW5kX3ByaW50Zih4
ZW5kZXYsICJzdGF0ZSIsICIldSIsIHN0YXRlKTsKPiA+ID4gKyAgICByZXR1cm4gdHJ1ZTsKPiA+
ID4gK30KPiA+ID4gKwo+ID4gPiArdm9pZCB4ZW5fZGV2aWNlX2JhY2tlbmRfc2V0X3N0YXRlKFhl
bkRldmljZSAqeGVuZGV2LAo+ID4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IGVudW0geGVuYnVzX3N0YXRlIHN0YXRlKQo+ID4gPiArewo+ID4gPiArICAgIGlmICh4ZW5fZGV2
aWNlX2JhY2tlbmRfcmVjb3JkX3N0YXRlKHhlbmRldiwgc3RhdGUpKQo+ID4gPiArICAgICAgICB4
ZW5fZGV2aWNlX2JhY2tlbmRfcHJpbnRmKHhlbmRldiwgInN0YXRlIiwgIiV1Iiwgc3RhdGUpOwo+
ID4gPiAgfQo+ID4gPgo+ID4gPiAgZW51bSB4ZW5idXNfc3RhdGUgeGVuX2RldmljZV9iYWNrZW5k
X2dldF9zdGF0ZShYZW5EZXZpY2UgKnhlbmRldikKPiA+ID4gQEAgLTUwMiw3ICs1MDksOCBAQCBl
bnVtIHhlbmJ1c19zdGF0ZSB4ZW5fZGV2aWNlX2JhY2tlbmRfZ2V0X3N0YXRlKFhlbkRldmljZSAq
eGVuZGV2KQo+ID4gPiAgICAgIHJldHVybiB4ZW5kZXYtPmJhY2tlbmRfc3RhdGU7Cj4gPiA+ICB9
Cj4gPiA+Cj4gPiA+IC1zdGF0aWMgdm9pZCB4ZW5fZGV2aWNlX2JhY2tlbmRfc2V0X29ubGluZShY
ZW5EZXZpY2UgKnhlbmRldiwgYm9vbCBvbmxpbmUpCj4gPiA+ICtzdGF0aWMgdm9pZCB4ZW5fZGV2
aWNlX2JhY2tlbmRfc2V0X29ubGluZShYZW5EZXZpY2UgKnhlbmRldiwgYm9vbCBvbmxpbmUsCj4g
PiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBib29sIGV4cG9y
dCkKPiA+ID4gIHsKPiA+ID4gICAgICBjb25zdCBjaGFyICp0eXBlID0gb2JqZWN0X2dldF90eXBl
bmFtZShPQkpFQ1QoeGVuZGV2KSk7Cj4gPiA+Cj4gPiA+IEBAIC01MTMsNyArNTIxLDggQEAgc3Rh
dGljIHZvaWQgeGVuX2RldmljZV9iYWNrZW5kX3NldF9vbmxpbmUoWGVuRGV2aWNlICp4ZW5kZXYs
IGJvb2wgb25saW5lKQo+ID4gPiAgICAgIHRyYWNlX3hlbl9kZXZpY2VfYmFja2VuZF9vbmxpbmUo
dHlwZSwgeGVuZGV2LT5uYW1lLCBvbmxpbmUpOwo+ID4gPgo+ID4gPiAgICAgIHhlbmRldi0+YmFj
a2VuZF9vbmxpbmUgPSBvbmxpbmU7Cj4gPiA+IC0gICAgeGVuX2RldmljZV9iYWNrZW5kX3ByaW50
Zih4ZW5kZXYsICJvbmxpbmUiLCAiJXUiLCBvbmxpbmUpOwo+ID4gPiArICAgIGlmIChleHBvcnQp
Cj4gPiA+ICsgICAgICAgIHhlbl9kZXZpY2VfYmFja2VuZF9wcmludGYoeGVuZGV2LCAib25saW5l
IiwgIiV1Iiwgb25saW5lKTsKPiA+ID4gIH0KPiA+ID4KPiA+Cj4gPiBQZXJoYXBzIHRoZSBiZWhh
dmlvdXIgb2YgYmFja2VuZF9zZXRfc3RhdGUoKSBhbmQgYmFja2VuZF9zZXRfb25saW5lKCkgY291
bGQgYmUgdGhlIHNhbWU/IEkuZS4gdGhleQo+IGJvdGggdGFrZSBhbiAnZXhwb3J0JyAob3IgcGVy
aGFwcyAncHVibGlzaCc/KSBwYXJhbWV0ZXIgYW5kIG9ubHkgd3JpdGUgeGVuc3RvcmUgaWYgdGhh
dCBpcyB0cnVlLiAoSQo+IHJlYWxpc2UgdGhhdCB3b3VsZCBpbnZvbHZlIG1vZGlmeWluZyB4ZW4t
YmxvY2sgdG8gcGFzcyAndHJ1ZScgYXMgdGhlIGV4dHJhIGV4cG9ydC9wdWJsaXNoIHBhcmFtLCBi
dXQgSQo+IHRoaW5rIGl0IHdvdWxkIGJlIG5lYXRlciBvdmVyYWxsKS4KPiAKPiBJJ3ZlIGFjdHVh
bGx5IGRpZCBpdCB0aGlzIHdheSBmb3IgYmFja2VuZF9zZXRfc3RhdGUoKSBiZWNhdXNlIHRoZSBv
bmx5Cj4gcmVhc29uIHRvIHVwZGF0ZSBpbnRlcm5hbCBzdGF0ZXMgd2l0aG91dCB3cml0aW5nIHRo
YXQgc3RhdGUgaW50bwo+IHhlbnN0b3JlIGlzIGJlY2F1c2UgdGhlIHhlbnN0b3JlIHN0YXRlIGNo
YW5nZWQsIHNvCj4ge2Zyb250LGJhY2t9ZW5kX2NoYW5nZWQoKSBhcmUgdGhlIG9ubHkgZnVuY3Rp
b24gdGhhdCBkb24ndCB3YW50L25lZWQgdG8KPiB3cml0ZSB0aGUgbmV3IHN0YXRlIGludG8geGVu
c3RvcmUuIEkgd2FudGVkIHRvIGF2b2lkIG1pc3VzZSBvZiB0aGUKPiBleHRyYSBleHBvcnQvcHVi
bGlzaCBwYXJhbSBpbiBmdXR1cmUgYmFja2VuZCBkcml2ZXJzLgo+IAo+IEFzIGZvciBmcm9udGVu
ZF9zZXRfc3RhdGUoKSBhbmQgYmFja2VuZF9zZXRfb25saW5lKCksIHRoZXkgYXJlIG9ubHkgdXNl
ZAo+IGluIHhlbi1idXMuYywgY3JlYXRpbmcgYSBuZXcgZnVuY3Rpb24gZGlkbid0IHNlZW1zIGFz
IG5lZWRlZC4KPiAKPiBJIGtpbmQgb2YgdGhpbmsgdGhhdCBtYXliZSBJIHNob3VsZCBnbyBmdXJ0
aGVyIGFuZCBhbHNvIGhhdmUKPiBmcm9udGVuZF9yZWNvcmRfc3RhdGUoKSBpcyBpdCBjb3VsZCBi
ZSBwb3NzaWJsZSB0byBoYXZlIGZyb250ZW5kIGRyaXZlcnMKPiBpbiBRRU1VLiAoYW5kIG1heWJl
IHJlY29yZF9vbmxpbmUgc28gdGhleSBhbGwgbG9va3MgdGhlIHNhbWUuKQo+IAoKSSBndWVzcyBJ
IGRvbid0IGxpa2UgdGhlIHRlcm0gJ3JlY29yZCcuLi4gSSdkIHJlYWxseSBsaWtlIHRvIHN0aWNr
IHdpdGggJ3NldCcuLi4KCj4gU28sIHdvdWxkIHlvdSBwcmVmZXIgdG8gaGF2ZSB0aGUgZXh0cmEg
cGFyYW0gdG8gKl9zZXRfKigpIHRoYXQgc2hvdWxkIGJlCj4gInRydWUiIG91dHNpZGUgb2YgKl9j
aGFuZ2VkKCksIG9yIHRoZSBleHRyYSBmdW5jdGlvbnMgbGlrZSBJIGRpZCB3aXRoCj4gYmFja2Vu
ZF97c2V0LHJlY29yZH1fc3RhdGUoKSA/Cj4gCgouLi5zbyBJIHByZWZlciB0aGUgZXh0cmEgcGFy
YW0uCgpCdXQsIG5vdyBJIGxvb2sgYXQgdGhlIGNvZGUgYWdhaW4gd2l0aG91dCB5b3VyIHBhdGNo
IGFwcGxpZWQgSSBkb24ndCBhY3R1YWxseSBzZWUgdGhlIHByb2JsZW0gaXQgaXMgdHJ5aW5nIHRv
IGZpeC4gVGhlIGZ1bmN0aW9ucyB4ZW5fZGV2aWNlX1tiYWNrfGZyb250XWVuZF9zZXRfc3RhdGUg
cmV0dXJuIGVhcmx5IGlmIHRoZSBzdGF0ZSBiZWluZyBzZXQgbWF0Y2hlcyB0aGUgZXhpc3Rpbmcg
c3RhdGUgYW5kIGhlbmNlIG5ldmVyIGdldCB0byB0aGUgbGluZSB3aGVyZSB0aGUgc3RhdGUgaXMg
d3JpdHRlbiB0byB4ZW5zdG9yZS4KCiAgUGF1bAoKPiBUaGFua3MsCj4gCj4gLS0KPiBBbnRob255
IFBFUkFSRAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
WGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0
cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
