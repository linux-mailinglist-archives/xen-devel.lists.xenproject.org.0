Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B1DC173A55
	for <lists+xen-devel@lfdr.de>; Fri, 28 Feb 2020 15:52:14 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j7gy9-00069T-MF; Fri, 28 Feb 2020 14:50:25 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=F9pE=4Q=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1j7gy8-00069N-DS
 for xen-devel@lists.xenproject.org; Fri, 28 Feb 2020 14:50:24 +0000
X-Inumbo-ID: a6042eca-5a39-11ea-8e51-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a6042eca-5a39-11ea-8e51-bc764e2007e4;
 Fri, 28 Feb 2020 14:50:23 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id D8D8BB0B7;
 Fri, 28 Feb 2020 14:50:22 +0000 (UTC)
To: Roger Pau Monne <roger.pau@citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>
References: <20200219174354.84726-1-roger.pau@citrix.com>
 <20200219174354.84726-3-roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <b58bdc3e-f051-0cd8-ed93-ff88c1387229@suse.com>
Date: Fri, 28 Feb 2020 15:50:31 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200219174354.84726-3-roger.pau@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v5 2/7] x86/paging: add TLB flush hooks
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
Cc: George Dunlap <george.dunlap@eu.citrix.com>, xen-devel@lists.xenproject.org,
 Tim Deegan <tim@xen.org>, Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTkuMDIuMjAyMCAxODo0MywgUm9nZXIgUGF1IE1vbm5lIHdyb3RlOgo+IEFkZCBzaGFkb3cg
YW5kIGhhcCBpbXBsZW1lbnRhdGlvbiBzcGVjaWZpYyBoZWxwZXJzIHRvIHBlcmZvcm0gZ3Vlc3QK
PiBUTEIgZmx1c2hlcy4gTm90ZSB0aGF0IHRoZSBjb2RlIGZvciBib3RoIGlzIGV4YWN0bHkgdGhl
IHNhbWUgYXQgdGhlCj4gbW9tZW50LCBhbmQgaXMgY29waWVkIGZyb20gaHZtX2ZsdXNoX3ZjcHVf
dGxiLiBUaGlzIHdpbGwgYmUgY2hhbmdlZCBieQo+IGZ1cnRoZXIgcGF0Y2hlcyB0aGF0IHdpbGwg
YWRkIGltcGxlbWVudGF0aW9uIHNwZWNpZmljIG9wdGltaXphdGlvbnMgdG8KPiB0aGVtLgo+IAo+
IE5vIGZ1bmN0aW9uYWwgY2hhbmdlIGludGVuZGVkLgo+IAo+IFNpZ25lZC1vZmYtYnk6IFJvZ2Vy
IFBhdSBNb25uw6kgPHJvZ2VyLnBhdUBjaXRyaXguY29tPgo+IFJldmlld2VkLWJ5OiBXZWkgTGl1
IDx3bEB4ZW4ub3JnPgo+IEFja2VkLWJ5OiBUaW0gRGVlZ2FuIDx0aW1AeGVuLm9yZz4KClRoaXMg
bG9va3MgZ29vZCBpbiBwcmluY2lwbGUsIHdpdGggb25lIHBvc3NpYmxlIGFub21hbHk6Cgo+IC0t
LSBhL3hlbi9hcmNoL3g4Ni9odm0vaHZtLmMKPiArKysgYi94ZW4vYXJjaC94ODYvaHZtL2h2bS5j
Cj4gQEAgLTM5OTAsNTUgKzM5OTAsMTAgQEAgc3RhdGljIHZvaWQgaHZtX3MzX3Jlc3VtZShzdHJ1
Y3QgZG9tYWluICpkKQo+ICBib29sIGh2bV9mbHVzaF92Y3B1X3RsYihib29sICgqZmx1c2hfdmNw
dSkodm9pZCAqY3R4dCwgc3RydWN0IHZjcHUgKnYpLAo+ICAgICAgICAgICAgICAgICAgICAgICAg
ICB2b2lkICpjdHh0KQo+ICB7Cj4gLSAgICBzdGF0aWMgREVGSU5FX1BFUl9DUFUoY3B1bWFza190
LCBmbHVzaF9jcHVtYXNrKTsKPiAtICAgIGNwdW1hc2tfdCAqbWFzayA9ICZ0aGlzX2NwdShmbHVz
aF9jcHVtYXNrKTsKPiAtICAgIHN0cnVjdCBkb21haW4gKmQgPSBjdXJyZW50LT5kb21haW47Cj4g
LSAgICBzdHJ1Y3QgdmNwdSAqdjsKPiAtCj4gLSAgICAvKiBBdm9pZCBkZWFkbG9jayBpZiBtb3Jl
IHRoYW4gb25lIHZjcHUgdHJpZXMgdGhpcyBhdCB0aGUgc2FtZSB0aW1lLiAqLwo+IC0gICAgaWYg
KCAhc3Bpbl90cnlsb2NrKCZkLT5oeXBlcmNhbGxfZGVhZGxvY2tfbXV0ZXgpICkKPiAtICAgICAg
ICByZXR1cm4gZmFsc2U7Cj4gLQo+IC0gICAgLyogUGF1c2UgYWxsIG90aGVyIHZjcHVzLiAqLwo+
IC0gICAgZm9yX2VhY2hfdmNwdSAoIGQsIHYgKQo+IC0gICAgICAgIGlmICggdiAhPSBjdXJyZW50
ICYmIGZsdXNoX3ZjcHUoY3R4dCwgdikgKQo+IC0gICAgICAgICAgICB2Y3B1X3BhdXNlX25vc3lu
Yyh2KTsKPiAtCj4gLSAgICAvKiBOb3cgdGhhdCBhbGwgVkNQVXMgYXJlIHNpZ25hbGxlZCB0byBk
ZXNjaGVkdWxlLCB3ZSB3YWl0Li4uICovCj4gLSAgICBmb3JfZWFjaF92Y3B1ICggZCwgdiApCj4g
LSAgICAgICAgaWYgKCB2ICE9IGN1cnJlbnQgJiYgZmx1c2hfdmNwdShjdHh0LCB2KSApCj4gLSAg
ICAgICAgICAgIHdoaWxlICggIXZjcHVfcnVubmFibGUodikgJiYgdi0+aXNfcnVubmluZyApCj4g
LSAgICAgICAgICAgICAgICBjcHVfcmVsYXgoKTsKPiAtCj4gLSAgICAvKiBBbGwgb3RoZXIgdmNw
dXMgYXJlIHBhdXNlZCwgc2FmZSB0byB1bmxvY2sgbm93LiAqLwo+IC0gICAgc3Bpbl91bmxvY2so
JmQtPmh5cGVyY2FsbF9kZWFkbG9ja19tdXRleCk7Cj4gLQo+IC0gICAgY3B1bWFza19jbGVhciht
YXNrKTsKPiAtCj4gLSAgICAvKiBGbHVzaCBwYWdpbmctbW9kZSBzb2Z0IHN0YXRlIChlLmcuLCB2
YS0+Z2ZuIGNhY2hlOyBQQUUgUERQRSBjYWNoZSkuICovCj4gLSAgICBmb3JfZWFjaF92Y3B1ICgg
ZCwgdiApCj4gLSAgICB7Cj4gLSAgICAgICAgdW5zaWduZWQgaW50IGNwdTsKPiAtCj4gLSAgICAg
ICAgaWYgKCAhZmx1c2hfdmNwdShjdHh0LCB2KSApCj4gLSAgICAgICAgICAgIGNvbnRpbnVlOwo+
IC0KPiAtICAgICAgICBwYWdpbmdfdXBkYXRlX2NyMyh2LCBmYWxzZSk7Cj4gKyAgICBzdHJ1Y3Qg
ZG9tYWluICpjdXJyZCA9IGN1cnJlbnQtPmRvbWFpbjsKPiAgCj4gLSAgICAgICAgY3B1ID0gcmVh
ZF9hdG9taWMoJnYtPmRpcnR5X2NwdSk7Cj4gLSAgICAgICAgaWYgKCBpc192Y3B1X2RpcnR5X2Nw
dShjcHUpICkKPiAtICAgICAgICAgICAgX19jcHVtYXNrX3NldF9jcHUoY3B1LCBtYXNrKTsKPiAt
ICAgIH0KPiAtCj4gLSAgICAvKiBGbHVzaCBUTEJzIG9uIGFsbCBDUFVzIHdpdGggZGlydHkgdmNw
dSBzdGF0ZS4gKi8KPiAtICAgIGZsdXNoX3RsYl9tYXNrKG1hc2spOwo+IC0KPiAtICAgIC8qIERv
bmUuICovCj4gLSAgICBmb3JfZWFjaF92Y3B1ICggZCwgdiApCj4gLSAgICAgICAgaWYgKCB2ICE9
IGN1cnJlbnQgJiYgZmx1c2hfdmNwdShjdHh0LCB2KSApCj4gLSAgICAgICAgICAgIHZjcHVfdW5w
YXVzZSh2KTsKPiAtCj4gLSAgICByZXR1cm4gdHJ1ZTsKPiArICAgIHJldHVybiBzaGFkb3dfbW9k
ZV9lbmFibGVkKGN1cnJkKSA/IHNoYWRvd19mbHVzaF90bGIoZmx1c2hfdmNwdSwgY3R4dCkKPiAr
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICA6IGhhcF9mbHVzaF90bGIoZmx1
c2hfdmNwdSwgY3R4dCk7Cj4gIH0KCkZvbGxvd2luZyBvdXIgY3VycmVudCBtb2RlbCBJIHRoaW5r
IHRoaXMgc2hvdWxkIGJlIGEgbmV3IHBvaW50ZXIKaW4gc3RydWN0IHBhZ2luZ19tb2RlICh0aGVu
IHRydWx5IGZpdHRpbmcgImhvb2tzIiBpbiB0aGUgdGl0bGUpLgpJIGNhbiBzZWUgdGhlIGRlc2ly
ZSB0byBhdm9pZCB0aGUgaW5kaXJlY3QgY2FsbCB0aG91Z2gsIGJ1dCBJCmFsc28gdGhpbmsgdGhh
dCBpZiB3ZSB3ZXJlIHRvIGdvIHRoYXQgcm91dGUsIHdlIHNob3VsZCBzZXR0bGUgb24Kc3dpdGNo
aW5nIGFyb3VuZCBvdGhlcnMgYXMgd2VsbCB3aGljaCBhcmUgcGFnaW5nIG1vZGUgZGVwZW5kZW50
LgooRkFPRCB0aGlzIGlzIG5vdGhpbmcgSSBhc2sgeW91IHRvIGRvIGhlcmUuKSBBbmRyZXcsIHRo
b3VnaHRzPwoKSmFuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9y
ZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
