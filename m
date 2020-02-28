Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EBD15173CC1
	for <lists+xen-devel@lfdr.de>; Fri, 28 Feb 2020 17:22:12 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j7iML-0005ni-Et; Fri, 28 Feb 2020 16:19:29 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=HvEU=4Q=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1j7iMJ-0005nd-JI
 for xen-devel@lists.xenproject.org; Fri, 28 Feb 2020 16:19:27 +0000
X-Inumbo-ID: 16a7752c-5a46-11ea-b472-bc764e2007e4
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 16a7752c-5a46-11ea-b472-bc764e2007e4;
 Fri, 28 Feb 2020 16:19:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1582906766;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=fQRPLxGo75J3Svs3b1jPC92CI/Vg7870eyEl9oFrQys=;
 b=hHGhuRvOQruQjAGROstaoTrmdsHxin0Ft8xibkVSUsfWRaE9x/I/kIsX
 i+pVOE+LNDYx+dw8Q2cN220F1piiGODNovojTwXI8LFbMZOKKfmPk3xH6
 nE5K4C1ON+xxyWnKHxMyvnjv4/2xfqNOZH+91N+AVaRELcGEx40AcZtRG 0=;
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa3.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: Y8/Hh+gk6Y7HyxJoLhEiwVhhUQnu3K/UzB+jnDX4Jw4yjCh3cFmrCfrJhHPFaeqmLiteYbch3+
 lkHh/4BGL5qiP4svMGR6X0l6CsLYYz4KGzY5vSiRvXegG4Yj1bvxKABd8Xid2E7XVxpJkBSGyr
 er/nhOsnlSvvBPb97D7LsR2ZKvINvcndxcTnG2Iqw3ueREXWHDfATqdQRSTBtQci+lvKS+8am9
 txH4hV13Y8Xjz2NPiY4hvBXwQkRVFelL+V6R78uJdGoAKk/3vRrKTYIOeQjcvQXILNhrc5D19/
 HTA=
X-SBRS: 2.7
X-MesageID: 13160309
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,496,1574139600"; d="scan'208";a="13160309"
Date: Fri, 28 Feb 2020 17:19:19 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Message-ID: <20200228161919.GB24458@Air-de-Roger.citrite.net>
References: <20200219174354.84726-1-roger.pau@citrix.com>
 <20200219174354.84726-3-roger.pau@citrix.com>
 <b58bdc3e-f051-0cd8-ed93-ff88c1387229@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <b58bdc3e-f051-0cd8-ed93-ff88c1387229@suse.com>
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL01.citrite.net (10.69.22.125)
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
Cc: George Dunlap <george.dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Tim Deegan <tim@xen.org>,
 Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gRnJpLCBGZWIgMjgsIDIwMjAgYXQgMDM6NTA6MzFQTSArMDEwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gT24gMTkuMDIuMjAyMCAxODo0MywgUm9nZXIgUGF1IE1vbm5lIHdyb3RlOgo+ID4gQWRk
IHNoYWRvdyBhbmQgaGFwIGltcGxlbWVudGF0aW9uIHNwZWNpZmljIGhlbHBlcnMgdG8gcGVyZm9y
bSBndWVzdAo+ID4gVExCIGZsdXNoZXMuIE5vdGUgdGhhdCB0aGUgY29kZSBmb3IgYm90aCBpcyBl
eGFjdGx5IHRoZSBzYW1lIGF0IHRoZQo+ID4gbW9tZW50LCBhbmQgaXMgY29waWVkIGZyb20gaHZt
X2ZsdXNoX3ZjcHVfdGxiLiBUaGlzIHdpbGwgYmUgY2hhbmdlZCBieQo+ID4gZnVydGhlciBwYXRj
aGVzIHRoYXQgd2lsbCBhZGQgaW1wbGVtZW50YXRpb24gc3BlY2lmaWMgb3B0aW1pemF0aW9ucyB0
bwo+ID4gdGhlbS4KPiA+IAo+ID4gTm8gZnVuY3Rpb25hbCBjaGFuZ2UgaW50ZW5kZWQuCj4gPiAK
PiA+IFNpZ25lZC1vZmYtYnk6IFJvZ2VyIFBhdSBNb25uw6kgPHJvZ2VyLnBhdUBjaXRyaXguY29t
Pgo+ID4gUmV2aWV3ZWQtYnk6IFdlaSBMaXUgPHdsQHhlbi5vcmc+Cj4gPiBBY2tlZC1ieTogVGlt
IERlZWdhbiA8dGltQHhlbi5vcmc+Cj4gCj4gVGhpcyBsb29rcyBnb29kIGluIHByaW5jaXBsZSwg
d2l0aCBvbmUgcG9zc2libGUgYW5vbWFseToKPiAKPiA+IC0tLSBhL3hlbi9hcmNoL3g4Ni9odm0v
aHZtLmMKPiA+ICsrKyBiL3hlbi9hcmNoL3g4Ni9odm0vaHZtLmMKPiA+IEBAIC0zOTkwLDU1ICsz
OTkwLDEwIEBAIHN0YXRpYyB2b2lkIGh2bV9zM19yZXN1bWUoc3RydWN0IGRvbWFpbiAqZCkKPiA+
ICBib29sIGh2bV9mbHVzaF92Y3B1X3RsYihib29sICgqZmx1c2hfdmNwdSkodm9pZCAqY3R4dCwg
c3RydWN0IHZjcHUgKnYpLAo+ID4gICAgICAgICAgICAgICAgICAgICAgICAgIHZvaWQgKmN0eHQp
Cj4gPiAgewo+ID4gLSAgICBzdGF0aWMgREVGSU5FX1BFUl9DUFUoY3B1bWFza190LCBmbHVzaF9j
cHVtYXNrKTsKPiA+IC0gICAgY3B1bWFza190ICptYXNrID0gJnRoaXNfY3B1KGZsdXNoX2NwdW1h
c2spOwo+ID4gLSAgICBzdHJ1Y3QgZG9tYWluICpkID0gY3VycmVudC0+ZG9tYWluOwo+ID4gLSAg
ICBzdHJ1Y3QgdmNwdSAqdjsKPiA+IC0KPiA+IC0gICAgLyogQXZvaWQgZGVhZGxvY2sgaWYgbW9y
ZSB0aGFuIG9uZSB2Y3B1IHRyaWVzIHRoaXMgYXQgdGhlIHNhbWUgdGltZS4gKi8KPiA+IC0gICAg
aWYgKCAhc3Bpbl90cnlsb2NrKCZkLT5oeXBlcmNhbGxfZGVhZGxvY2tfbXV0ZXgpICkKPiA+IC0g
ICAgICAgIHJldHVybiBmYWxzZTsKPiA+IC0KPiA+IC0gICAgLyogUGF1c2UgYWxsIG90aGVyIHZj
cHVzLiAqLwo+ID4gLSAgICBmb3JfZWFjaF92Y3B1ICggZCwgdiApCj4gPiAtICAgICAgICBpZiAo
IHYgIT0gY3VycmVudCAmJiBmbHVzaF92Y3B1KGN0eHQsIHYpICkKPiA+IC0gICAgICAgICAgICB2
Y3B1X3BhdXNlX25vc3luYyh2KTsKPiA+IC0KPiA+IC0gICAgLyogTm93IHRoYXQgYWxsIFZDUFVz
IGFyZSBzaWduYWxsZWQgdG8gZGVzY2hlZHVsZSwgd2Ugd2FpdC4uLiAqLwo+ID4gLSAgICBmb3Jf
ZWFjaF92Y3B1ICggZCwgdiApCj4gPiAtICAgICAgICBpZiAoIHYgIT0gY3VycmVudCAmJiBmbHVz
aF92Y3B1KGN0eHQsIHYpICkKPiA+IC0gICAgICAgICAgICB3aGlsZSAoICF2Y3B1X3J1bm5hYmxl
KHYpICYmIHYtPmlzX3J1bm5pbmcgKQo+ID4gLSAgICAgICAgICAgICAgICBjcHVfcmVsYXgoKTsK
PiA+IC0KPiA+IC0gICAgLyogQWxsIG90aGVyIHZjcHVzIGFyZSBwYXVzZWQsIHNhZmUgdG8gdW5s
b2NrIG5vdy4gKi8KPiA+IC0gICAgc3Bpbl91bmxvY2soJmQtPmh5cGVyY2FsbF9kZWFkbG9ja19t
dXRleCk7Cj4gPiAtCj4gPiAtICAgIGNwdW1hc2tfY2xlYXIobWFzayk7Cj4gPiAtCj4gPiAtICAg
IC8qIEZsdXNoIHBhZ2luZy1tb2RlIHNvZnQgc3RhdGUgKGUuZy4sIHZhLT5nZm4gY2FjaGU7IFBB
RSBQRFBFIGNhY2hlKS4gKi8KPiA+IC0gICAgZm9yX2VhY2hfdmNwdSAoIGQsIHYgKQo+ID4gLSAg
ICB7Cj4gPiAtICAgICAgICB1bnNpZ25lZCBpbnQgY3B1Owo+ID4gLQo+ID4gLSAgICAgICAgaWYg
KCAhZmx1c2hfdmNwdShjdHh0LCB2KSApCj4gPiAtICAgICAgICAgICAgY29udGludWU7Cj4gPiAt
Cj4gPiAtICAgICAgICBwYWdpbmdfdXBkYXRlX2NyMyh2LCBmYWxzZSk7Cj4gPiArICAgIHN0cnVj
dCBkb21haW4gKmN1cnJkID0gY3VycmVudC0+ZG9tYWluOwo+ID4gIAo+ID4gLSAgICAgICAgY3B1
ID0gcmVhZF9hdG9taWMoJnYtPmRpcnR5X2NwdSk7Cj4gPiAtICAgICAgICBpZiAoIGlzX3ZjcHVf
ZGlydHlfY3B1KGNwdSkgKQo+ID4gLSAgICAgICAgICAgIF9fY3B1bWFza19zZXRfY3B1KGNwdSwg
bWFzayk7Cj4gPiAtICAgIH0KPiA+IC0KPiA+IC0gICAgLyogRmx1c2ggVExCcyBvbiBhbGwgQ1BV
cyB3aXRoIGRpcnR5IHZjcHUgc3RhdGUuICovCj4gPiAtICAgIGZsdXNoX3RsYl9tYXNrKG1hc2sp
Owo+ID4gLQo+ID4gLSAgICAvKiBEb25lLiAqLwo+ID4gLSAgICBmb3JfZWFjaF92Y3B1ICggZCwg
diApCj4gPiAtICAgICAgICBpZiAoIHYgIT0gY3VycmVudCAmJiBmbHVzaF92Y3B1KGN0eHQsIHYp
ICkKPiA+IC0gICAgICAgICAgICB2Y3B1X3VucGF1c2Uodik7Cj4gPiAtCj4gPiAtICAgIHJldHVy
biB0cnVlOwo+ID4gKyAgICByZXR1cm4gc2hhZG93X21vZGVfZW5hYmxlZChjdXJyZCkgPyBzaGFk
b3dfZmx1c2hfdGxiKGZsdXNoX3ZjcHUsIGN0eHQpCj4gPiArICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICA6IGhhcF9mbHVzaF90bGIoZmx1c2hfdmNwdSwgY3R4dCk7Cj4gPiAg
fQo+IAo+IEZvbGxvd2luZyBvdXIgY3VycmVudCBtb2RlbCBJIHRoaW5rIHRoaXMgc2hvdWxkIGJl
IGEgbmV3IHBvaW50ZXIKPiBpbiBzdHJ1Y3QgcGFnaW5nX21vZGUgKHRoZW4gdHJ1bHkgZml0dGlu
ZyAiaG9va3MiIGluIHRoZSB0aXRsZSkuCgpJIHRyaWVkIGRvaW5nIGl0IHRoYXQgd2F5LCBidXQg
dGhlcmUgd2FzIHNvbWV0aGluZyB3ZWlyZCBhYm91dCBpdCwgdGhlCnBhZ2luZyBtb2RlIGlzIHBl
ci12Y3B1LCBhbmQgaGVuY2UgSSBuZWVkZWQgdG8gZG8gc29tZXRoaW5nIGxpa2U6CgpwYWdpbmdf
Z2V0X2hvc3Rtb2RlKGN1cnJlbnQpLT5mbHVzaChjdXJyZW50LT5kb21haW4sIC4uLikKCkkgY2Fu
IHRyeSB0byBtb3ZlIGl0IHRvIGJlaW5nIGEgcGFnaW5nX21vZGUgaG9vayBpZiB5b3UgcHJlZmVy
LgoKPiBJIGNhbiBzZWUgdGhlIGRlc2lyZSB0byBhdm9pZCB0aGUgaW5kaXJlY3QgY2FsbCB0aG91
Z2gsIGJ1dCBJCj4gYWxzbyB0aGluayB0aGF0IGlmIHdlIHdlcmUgdG8gZ28gdGhhdCByb3V0ZSwg
d2Ugc2hvdWxkIHNldHRsZSBvbgo+IHN3aXRjaGluZyBhcm91bmQgb3RoZXJzIGFzIHdlbGwgd2hp
Y2ggYXJlIHBhZ2luZyBtb2RlIGRlcGVuZGVudC4KPiAoRkFPRCB0aGlzIGlzIG5vdGhpbmcgSSBh
c2sgeW91IHRvIGRvIGhlcmUuKSBBbmRyZXcsIHRob3VnaHRzPwoKSSB0aGluayBpdCdzIGFscmVh
ZHkgcXVpdGUgb2YgYSBtaXhlZCBiYWcsIHNlZSB0cmFja19kaXJ0eV92cmFtIGZvcgpleGFtcGxl
IHdoaWNoIHVzZXMgYSBzaW1pbGFyIG1vZGVsLgoKVGhhbmtzLCBSb2dlci4KCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxp
c3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVj
dC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
