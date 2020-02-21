Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D245B1680CC
	for <lists+xen-devel@lfdr.de>; Fri, 21 Feb 2020 15:51:43 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j59cX-0003YH-CD; Fri, 21 Feb 2020 14:49:37 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=nwZw=4J=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1j59cV-0003YC-1o
 for xen-devel@lists.xenproject.org; Fri, 21 Feb 2020 14:49:35 +0000
X-Inumbo-ID: 5f3ebbd4-54b9-11ea-868e-12813bfff9fa
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 5f3ebbd4-54b9-11ea-868e-12813bfff9fa;
 Fri, 21 Feb 2020 14:49:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1582296574;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=GVIZgwyIscz2gpgMZCYvdj84KaB4tY4cLeRkCFZpNYk=;
 b=CfT5cFnfsOEhWOwUPDIlW7+xXLsED/cB8JA3A1GquidaWC2RczrlgBRG
 Vmnqo6uEk4vOexFsRi4I1Vb9QB1TpyiTX1jb5BUK+BM73Cz9oJE8uPcZn
 k8BL/rkeu1mO9OzfDPIycK12OWKjzfIrCMx7OUYkO7KpSkTUonljPD6Xf g=;
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
IronPort-SDR: 9DKvRt20OUnaZCJ2tD0L0EY0Cmyo19Adq6Vkz13dHuFf4QDznTlhAIDeWAleP8MB6Jm6uJ6mMr
 1agkR7U1ZS3/5v98YDXY5P5R97AX83uBIzZqb4yc7OZIE0P/7WZvgXbLnsiS9IAvWpP4e85dsh
 nti6UVul46xAMsBcyKiAygBbUfdgfSlZpkjja6IdK6JX9QmJj6YLFiDQUzQNI6sojU1lkCk5R1
 K3jg1gLa/ZN1I7Z2s2cV5euwXH0ElNKHHRM3m1+rxQ1oodM9W2chH55L/oRzvX0R6C3BebcKIb
 8J4=
X-SBRS: 2.7
X-MesageID: 12803433
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,468,1574139600"; d="scan'208";a="12803433"
Date: Fri, 21 Feb 2020 15:49:24 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Message-ID: <20200221144924.GC4679@Air-de-Roger>
References: <20200220173116.88915-1-roger.pau@citrix.com>
 <83d48223-21eb-be54-985c-085449661892@xen.org>
 <20200221091005.GT4679@Air-de-Roger>
 <ac7ffe8b-06b0-655e-e842-cbc5d47ea85f@suse.com>
 <20200221142635.GA4679@Air-de-Roger>
 <41526075-cab4-064b-dbd5-3d4667bb6309@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <41526075-cab4-064b-dbd5-3d4667bb6309@suse.com>
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL01.citrite.net (10.69.22.125)
Subject: Re: [Xen-devel] [PATCH v2] rwlock: allow recursive read locking
 when already locked in write mode
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
Cc: =?utf-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>,
 xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gRnJpLCBGZWIgMjEsIDIwMjAgYXQgMDM6NDE6NTlQTSArMDEwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gT24gMjEuMDIuMjAyMCAxNToyNiwgUm9nZXIgUGF1IE1vbm7DqSB3cm90ZToKPiA+IE9u
IEZyaSwgRmViIDIxLCAyMDIwIGF0IDAyOjM2OjUyUE0gKzAxMDAsIEphbiBCZXVsaWNoIHdyb3Rl
Ogo+ID4+IE9uIDIxLjAyLjIwMjAgMTA6MTAsIFJvZ2VyIFBhdSBNb25uw6kgd3JvdGU6Cj4gPj4+
IE9uIFRodSwgRmViIDIwLCAyMDIwIGF0IDA3OjIwOjA2UE0gKzAwMDAsIEp1bGllbiBHcmFsbCB3
cm90ZToKPiA+Pj4+IEhpLAo+ID4+Pj4KPiA+Pj4+IE9uIDIwLzAyLzIwMjAgMTc6MzEsIFJvZ2Vy
IFBhdSBNb25uZSB3cm90ZToKPiA+Pj4+PiBBbGxvdyBhIENQVSBhbHJlYWR5IGhvbGRpbmcgdGhl
IGxvY2sgaW4gd3JpdGUgbW9kZSB0byBhbHNvIGxvY2sgaXQgaW4KPiA+Pj4+PiByZWFkIG1vZGUu
IFRoZXJlJ3Mgbm8gaGFybSBpbiBhbGxvd2luZyByZWFkIGxvY2tpbmcgYSByd2xvY2sgdGhhdCdz
Cj4gPj4+Pj4gYWxyZWFkeSBvd25lZCBieSB0aGUgY2FsbGVyIChpZTogQ1BVKSBpbiB3cml0ZSBt
b2RlLiBBbGxvd2luZyBzdWNoCj4gPj4+Pj4gYWNjZXNzZXMgaXMgcmVxdWlyZWQgYXQgbGVhc3Qg
Zm9yIHRoZSBDUFUgbWFwcyB1c2UtY2FzZS4KPiA+Pj4+Pgo+ID4+Pj4+IEluIG9yZGVyIHRvIGRv
IHRoaXMgcmVzZXJ2ZSAxNGJpdHMgb2YgdGhlIGxvY2ssIHRoaXMgYWxsb3dzIHRvIHN1cHBvcnQK
PiA+Pj4+PiB1cCB0byAxNjM4NCBDUFVzLiBBbHNvIHJlZHVjZSB0aGUgd3JpdGUgbG9jayBtYXNr
IHRvIDIgYml0czogb25lIHRvCj4gPj4+Pj4gc2lnbmFsIHRoZXJlIGFyZSBwZW5kaW5nIHdyaXRl
cnMgd2FpdGluZyBvbiB0aGUgbG9jayBhbmQgdGhlIG90aGVyIHRvCj4gPj4+Pj4gc2lnbmFsIHRo
ZSBsb2NrIGlzIG93bmVkIGluIHdyaXRlIG1vZGUuIE5vdGUgdGhlIHdyaXRlIHJlbGF0ZWQgZGF0
YQo+ID4+Pj4+IGlzIHVzaW5nIDE2Yml0cywgdGhpcyBpcyBkb25lIGluIG9yZGVyIHRvIGJlIGFi
bGUgdG8gY2xlYXIgaXQgKGFuZAo+ID4+Pj4+IHRodXMgcmVsZWFzZSB0aGUgbG9jaykgdXNpbmcg
YSAxNmJpdCBhdG9taWMgd3JpdGUuCj4gPj4+Pj4KPiA+Pj4+PiBUaGlzIHJlZHVjZXMgdGhlIG1h
eGltdW0gbnVtYmVyIG9mIGNvbmN1cnJlbnQgcmVhZGVycyBmcm9tIDE2Nzc3MjE2IHRvCj4gPj4+
Pj4gNjU1MzYsIEkgdGhpbmsgdGhpcyBzaG91bGQgc3RpbGwgYmUgZW5vdWdoLCBvciBlbHNlIHRo
ZSBsb2NrIGZpZWxkCj4gPj4+Pj4gY2FuIGJlIGV4cGFuZGVkIGZyb20gMzIgdG8gNjRiaXRzIGlm
IGFsbCBhcmNoaXRlY3R1cmVzIHN1cHBvcnQgYXRvbWljCj4gPj4+Pj4gb3BlcmF0aW9ucyBvbiA2
NGJpdCBpbnRlZ2Vycy4KPiA+Pj4+Cj4gPj4+PiBGV0lXLCBhcm0zMiBpcyBhYmxlIHRvIHN1cHBv
cnQgYXRvbWljIG9wZXJhdGlvbnMgb24gNjQtYml0IGludGVnZXJzLgo+ID4+Pj4KPiA+Pj4+PiAg
IHN0YXRpYyBpbmxpbmUgdm9pZCBfd3JpdGVfdW5sb2NrKHJ3bG9ja190ICpsb2NrKQo+ID4+Pj4+
ICAgewo+ID4+Pj4+IC0gICAgLyoKPiA+Pj4+PiAtICAgICAqIElmIHRoZSB3cml0ZXIgZmllbGQg
aXMgYXRvbWljLCBpdCBjYW4gYmUgY2xlYXJlZCBkaXJlY3RseS4KPiA+Pj4+PiAtICAgICAqIE90
aGVyd2lzZSwgYW4gYXRvbWljIHN1YnRyYWN0aW9uIHdpbGwgYmUgdXNlZCB0byBjbGVhciBpdC4K
PiA+Pj4+PiAtICAgICAqLwo+ID4+Pj4+IC0gICAgYXRvbWljX3N1YihfUVdfTE9DS0VELCAmbG9j
ay0+Y250cyk7Cj4gPj4+Pj4gKyAgICAvKiBTaW5jZSB0aGUgd3JpdGVyIGZpZWxkIGlzIGF0b21p
YywgaXQgY2FuIGJlIGNsZWFyZWQgZGlyZWN0bHkuICovCj4gPj4+Pj4gKyAgICBBU1NFUlQoX2lz
X3dyaXRlX2xvY2tlZF9ieV9tZShhdG9taWNfcmVhZCgmbG9jay0+Y250cykpKTsKPiA+Pj4+PiAr
ICAgIEJVSUxEX0JVR19PTihfUVJfU0hJRlQgIT0gMTYpOwo+ID4+Pj4+ICsgICAgd3JpdGVfYXRv
bWljKCh1aW50MTZfdCAqKSZsb2NrLT5jbnRzLCAwKTsKPiA+Pj4+Cj4gPj4+PiBJIHRoaW5rIHRo
aXMgaXMgYW4gYWJ1c2UgdG8gY2FzdCBhbiBhdG9taWNfdCgpIGRpcmVjdGx5IGludG8gYSB1aW50
MTZfdC4gWW91Cj4gPj4+PiB3b3VsZCBhdCBsZWFzdCB3YW50IHRvIHVzZSAmbG9jay0+Y250cy5j
b3VudGVyIGhlcmUuCj4gPj4+Cj4gPj4+IFN1cmUsIEkgd2FzIHdvbmRlcmluZyBhYm91dCB0aGlz
IG15c2VsZi4KPiA+Pj4KPiA+Pj4gV2lsbCB3YWl0IGZvciBtb3JlIGNvbW1lbnRzLCBub3Qgc3Vy
ZSB3aGV0aGVyIHRoaXMgY2FuIGJlIGZpeGVkIHVwb24KPiA+Pj4gY29tbWl0IGlmIHRoZXJlIGFy
ZSBubyBvdGhlciBpc3N1ZXMuCj4gPj4KPiA+PiBJdCdzIG1vcmUgdGhhbiBqdXN0IGFkZGluZyBh
bm90aGVyIGZpZWxkIHNwZWNpZmllciBoZXJlLiBBIGNhc3QgbGlrZQo+ID4+IHRoaXMgb25lIGlz
IGVuZGlhbm5lc3MtdW5zYWZlLCBhbmQgaGVuY2UgYSB0cmFwIHdhaXRpbmcgZm9yIGEgYmlnCj4g
Pj4gZW5kaWFuIHBvcnQgYXR0ZW1wdCB0byBmYWxsIGludG8uIEF0IHRoZSB2ZXJ5IGxlYXN0IHRo
aXMgc2hvdWxkIGNhdXNlCj4gPj4gYSBidWlsZCBmYWlsdXJlIG9uIGJpZyBlbmRpYW4gc3lzdGVt
cywgZXZlbiBiZXR0ZXIgd291bGQgYmUgaWYgaXQgd2FzCj4gPj4gZW5kaWFubmVzcy1zYWZlLgo+
ID4gCj4gPiBXaHkgZG9uJ3Qgd2UgbGVhdmUgdGhlIGF0b21pY19kZWMgdGhlbj8KPiAKPiBCZWNh
dXNlIHlvdSBuZWVkIHRvIGludm9rZSBzbXBfcHJvY2Vzc29yX2lkKCkgdG8gY2FsY3VsYXRlIHRo
ZSB2YWx1ZQo+IHRvIHVzZSBpbiB0aGUgc3VidHJhY3Rpb24uIEknbSBub3QgbWVhbmluZyB0byBz
YXkgSSdtIGVudGlyZWx5Cj4gb3Bwb3NlZCAoc2VlaW5nIGhvdyBtdWNoIG9mIGEgZGlzY3Vzc2lv
biB3ZSdyZSBoYXZpbmcpLCBidXQgdGhlCj4gInNpbXBsZSB3cml0ZSBvZiB6ZXJvIiBhcHByb2Fj
aCBpcyBjZXJ0YWlubHkgYXBwZWFsaW5nLgoKV2VsbCwgd2UgY291bGQgYXZvaWQgdGhlIHNtcF9w
cm9jZXNzb3JfaWQoKSBjYWxsIGFuZCBpbnN0ZWFkIHVzZToKCmF0b21pY19zdWIoYXRvbWljX3Jl
YWQoJmxvY2stPmNudHMpICYgMHhmZmZmLCAmbG9jay0+Y250cyk7CgpOb3RlIG1hc2sgaXMgdXNp
bmcgdGhlIGxvdyAxNmJpdHMgbm93LCBidXQgaWYgd2UgZ28gdGhlIGF0b21pY19zdWIKcm91dGUg
d2UgY291bGQgY2hhbmdlIHRoZSBDUFUgSUQgZmllbGRzIHRvIGJlIDEyIGJpdHMgYWdhaW4gYW5k
IHRodXMKaGF2ZSBzb21lIG1vcmUgcm9vbSBmb3IgdGhlIHJlYWRlcnMgY291bnQuCgpUaGFua3Ms
IFJvZ2VyLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
WGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0
cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
