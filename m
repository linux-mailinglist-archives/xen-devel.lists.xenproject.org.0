Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AB440143B0E
	for <lists+xen-devel@lfdr.de>; Tue, 21 Jan 2020 11:33:32 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1itqnH-0005wA-1O; Tue, 21 Jan 2020 10:29:59 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=jgZb=3K=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1itqnF-0005w1-BO
 for xen-devel@lists.xenproject.org; Tue, 21 Jan 2020 10:29:57 +0000
X-Inumbo-ID: f2e2b438-3c38-11ea-b833-bc764e2007e4
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f2e2b438-3c38-11ea-b833-bc764e2007e4;
 Tue, 21 Jan 2020 10:29:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1579602588;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=XAz8dG1yiHAsH2vrc628ZUk6A1SGtf1bBIrCL1ARVPY=;
 b=dvKpRrvJVM7odi3dCE/BR/sXodbCoSeROgzSqzQ1bolUpGqPESzHt/LG
 PvHGTX5SvgsKCfecHY5fq6ta+qGT1sb9olj5aPI1VV4YixxYCoFSK8qkO
 tYDf1tNgcD4pI/nwLjPshitm6RH5z7WC4v4+jQfi5l07bUKmMubPa+VpA k=;
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa5.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: Q5B2FjUX/s7qEdp7iFaZF/tbn7ZPZPjudWjMxbXJHkQUAQffh4Utfv9PRC7ER4bBehEDj1w9+c
 mLTXO86HapOCUIWYsjiXW+ByuiORdWABgxi3k7k6t/o7kVko0QcI1K2Bn11tR6jfWUUT2nyi8h
 0wnWBhCLZj96GDg/myVSCC1BDWKxKFg1LKdjevec6Jjkm4uXEihyJ1AFQfTHmcVd8V8HYOTIQj
 4Sa/tc81wwzFhCivf1oKAuo7QeAAbnrIzoGQ9dsbhtIn5OC4+wqxstXXPyuOFmmWNG4heOdM62
 V3c=
X-SBRS: 2.7
X-MesageID: 11565123
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,345,1574139600"; d="scan'208";a="11565123"
Date: Tue, 21 Jan 2020 10:29:41 +0000
From: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Message-ID: <20200121102941.GH11756@Air-de-Roger>
References: <20200117110811.43321-1-roger.pau@citrix.com>
 <538864f7-f537-be0d-e37b-8f29baf82ee0@suse.com>
 <20200120171840.GF11756@Air-de-Roger>
 <96edb88c-5ae3-22a1-913d-83f76c925270@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <96edb88c-5ae3-22a1-913d-83f76c925270@suse.com>
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL01.citrite.net (10.69.22.125)
Subject: Re: [Xen-devel] [PATCH v2] x86/hvmloader: round up memory BAR size
 to 4K
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
Cc: xen-devel@lists.xenproject.org, Jason Andryuk <jandryuk@gmail.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVHVlLCBKYW4gMjEsIDIwMjAgYXQgMTA6MTg6MTZBTSArMDEwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gT24gMjAuMDEuMjAyMCAxODoxOCwgUm9nZXIgUGF1IE1vbm7DqSB3cm90ZToKPiA+IE9u
IE1vbiwgSmFuIDIwLCAyMDIwIGF0IDA1OjEwOjMzUE0gKzAxMDAsIEphbiBCZXVsaWNoIHdyb3Rl
Ogo+ID4+IE9uIDE3LjAxLjIwMjAgMTI6MDgsIFJvZ2VyIFBhdSBNb25uZSB3cm90ZToKPiA+Pj4g
V2hlbiBwbGFjaW5nIG1lbW9yeSBCQVJzIHdpdGggc2l6ZXMgc21hbGxlciB0aGFuIDRLIG11bHRp
cGxlIG1lbW9yeQo+ID4+PiBCQVJzIGNhbiBlbmQgdXAgbWFwcGVkIHRvIHRoZSBzYW1lIGd1ZXN0
IHBoeXNpY2FsIGFkZHJlc3MsIGFuZCB0aHVzCj4gPj4+IHdvbid0IHdvcmsgY29ycmVjdGx5Lgo+
ID4+Cj4gPj4gVGhpbmtpbmcgYWJvdXQgaXQgYWdhaW4sIGFyZW4ndCB5b3UgZml4aW5nIG9uZSBw
b3NzaWJsZSBjYXNlIGJ5Cj4gPj4gYnJlYWtpbmcgdGhlIG9wcG9zaXRlIG9uZTogV2hhdCB5b3Ug
Zml4IGlzIHdoZW4gdGhlIHR3byBkaXN0aW5jdAo+ID4+IEJBUnMgKG9mIHRoZSBzYW1lIG9yIGRp
ZmZlcmVudCBkZXZpY2VzKSBtYXAgdG8gZGlzdGluY3QgTUZOcwo+ID4+ICh3aGljaCB3b3VsZCBo
YXZlIHJlcXVpcmVkIGEgc2luZ2xlIEdGTiB0byBtYXAgdG8gYm90aCBvZiB0aGVzZQo+ID4+IE1G
TnMpLiBCdXQgZG9uJ3QgeW91LCBhdCB0aGUgc2FtZSB0aW1lLCBicmVhayB0aGUgY2FzZSBvZiB0
d28KPiA+PiBCQVJzIChwZXJoYXBzLCBidXQgbm90IG5lY2Vzc2FyaWx5LCBvZiB0aGUgc2FtZSBw
aHlzaWNhbCBkZXZpY2UpCj4gPj4gbWFwcGluZyBib3RoIHRvIHRoZSBzYW1lIE1GTiwgaS5lLiBy
ZXF1aXJpbmcgdG8gaGF2ZSB0d28gZGlzdGluY3QKPiA+PiBHRk5zIG1hcCB0byBvbmUgTUZOPyAo
QXQgbGVhc3QgZm9yIHRoZSBtb21lbnQgSSBjYW4ndCBzZWUgYSB3YXkKPiA+PiBmb3IgaHZtbG9h
ZGVyIHRvIGRpc3Rpbmd1aXNoIHRoZSB0d28gY2FzZXMuKQo+ID4gCj4gPiBJTU8gd2Ugc2hvdWxk
IGZvcmNlIGFsbCBCQVJzIHRvIGJlIHBhZ2UtaXNvbGF0ZWQgYnkgZG9tMCAoc2luY2UgWGVuCj4g
PiBkb2Vzbid0IGhhdmUgdGhlIGtub3dsZWRnZSBvZiBkb2luZyBzbyksIGJ1dCBJIGRvbid0IHNl
ZSB0aGUgaXNzdWUKPiA+IHdpdGggaGF2aW5nIGRpZmZlcmVudCBnZm5zIHBvaW50aW5nIHRvIHRo
ZSBzYW1lIG1mbi4gSXMgdGhhdCBhCj4gPiBsaW1pdGF0aW9uIG9mIHBhZ2luZz8KPiAKPiBJdCdz
IGEgbGltaXRhdGlvbiBvZiB0aGUgKGdsb2JhbCkgTTJQIHRhYmxlLgoKT2gsIHNvIHRoZSBtYXBw
aW5ncyB3b3VsZCBiZSBjb3JyZWN0IG9uIHRoZSBFUFQvTlBULCBidXQgbm90IG9uIHRoZQpNMlAu
Cgo+IAo+ID4gSSB0aGluayB5b3UgY2FuIG1hcCBhIGdyYW50IG11bHRpcGxlIHRpbWVzIGludG8K
PiA+IGRpZmZlcmVudCBnZm5zLCB3aGljaCBhY2hpZXZlcyB0aGUgc2FtZSBBRkFJQ1QuCj4gCj4g
T25lIG1pZ2h0IHRoaW5rIHRoaXMgd291bGQgYmUgcG9zc2libGUsIGJ1dCBhZmFpY3QKPiBndWVz
dF9waHlzbWFwX2FkZF97cGFnZSxlbnRyeX0oKSB3aWxsIGRlc3Ryb3kgdGhlIHByaW9yIGFzc29j
aWF0aW9uCj4gd2hlbi9iZWZvcmUgaW5zZXJ0aW5nIHRoZSBuZXcgb25lLiBJLmUuIGlmIHN1YnNl
cXVlbnRseSBhbnkgb3BlcmF0aW9uCj4gd2FzIHVzZWQgd2hpY2ggbmVlZHMgdG8gY29uc3VsdCB0
aGUgTTJQLCBvbmx5IHRoZSBtb3N0IHJlY2VudGx5Cj4gcmVjb3JkZWQgR0ZOIHdvdWxkIGJlIHJl
dHVybmVkIGFuZCBoZW5jZSBvcGVyYXRlZCBvbi4gV2hldGhlciB0aGF0J3MKPiBhIHByb2JsZW0g
aW4gcHJhY3RpY2UgKGkuZS4gd2hldGhlciBhbnkgc3VjaCBNMlAgbG9va3VwIG1pZ2h0Cj4gc2Vu
c2libHkgaGFwcGVuKSBpcyBwcmV0dHkgaGFyZCB0byB0ZWxsIHdpdGhvdXQgZ29pbmcgdGhyb3Vn
aCBhIGxvdAo+IG9mIGNvZGUsIEkgZ3Vlc3MuCgpJJ20gYWZyYWlkIEkgZG9uJ3Qga25vdyBlaXRo
ZXIuCgpTbyBJJ20gbm90IHN1cmUgaG93IHRvIHByb2dyZXNzIHdpdGggdGhpcyBwYXRjaCwgYXJl
IHdlIGZpbmUgd2l0aAp0aG9zZSBsaW1pdGF0aW9ucz8KCkFzIEkgc2FpZCwgWGVuIGhhc24ndCBn
b3QgZW5vdWdoIGtub3dsZWRnZSB0byBjb3JyZWN0bHkgaXNvbGF0ZSB0aGUKQkFScywgYW5kIGhl
bmNlIHdlIGhhdmUgdG8gcmVseSBvbiBkb20wIERUUlQuIFdlIGNvdWxkIGFkZCBjaGVja3MgaW4K
WGVuIHRvIG1ha2Ugc3VyZSBubyBCQVJzIHNoYXJlIGEgcGFnZSwgYnV0IGl0J3MgYSBub24tdHJp
dmlhbCBhbW91bnQKb2Ygc2Nhbm5pbmcgYW5kIHNpemluZyBlYWNoIHBvc3NpYmxlIEJBUiBvbiB0
aGUgc3lzdGVtLgoKSU1PIHRoaXMgcGF0Y2ggaXMgYW4gaW1wcm92ZW1lbnQgb3ZlciB0aGUgY3Vy
cmVudCBzdGF0ZSwgYW5kIHdlIGNhbgphbHdheXMgZG8gZnVydGhlciBpbXByb3ZlbWVudHMgYWZ0
ZXJ3YXJkcy4KClRoYW5rcywgUm9nZXIuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8veGVuLWRldmVs
