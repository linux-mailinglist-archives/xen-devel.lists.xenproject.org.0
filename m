Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B3889168354
	for <lists+xen-devel@lfdr.de>; Fri, 21 Feb 2020 17:28:52 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j5B7X-00081U-Eh; Fri, 21 Feb 2020 16:25:43 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=nwZw=4J=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1j5B7W-00081K-6a
 for xen-devel@lists.xenproject.org; Fri, 21 Feb 2020 16:25:42 +0000
X-Inumbo-ID: 6fddb67c-54c6-11ea-bc8e-bc764e2007e4
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 6fddb67c-54c6-11ea-bc8e-bc764e2007e4;
 Fri, 21 Feb 2020 16:23:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1582302184;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=CQvBANNIlEOmw632iCj12r/vDjiSPwGbYzjWBr9YK0c=;
 b=ZpoVrZ5/lJBSJM7e/QJjysduqRGp/EvZ+b47RAw1yNcvv9+Sttd4cHEc
 olruploKBirNyglT4qUbKmo//PUnLJYdG4gXGZqEMjopXPs/gAl7DIc0P
 MT+S0qsyKSW2uIqyp4zmwf3Hk1AZrwJLBuZZx48MUNWgbJIm3J4KQqAMs o=;
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa4.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: tEp8qfvZ9Jzit9Iu9haXnOJSro2DgFQu6CWVGyx0om22t+IbSNnpi7OC/wiNsQg2YaICM9dwzR
 fAgXv23lQuOREISQQZWOY7yQim17O/Itv3gklE+StaEQ0ez5zUk19YCQexxMMxQLlzQBHEZ8Uf
 qpah1v2fR0+rN7G5ml4PCyhKxB/w1Yb/z9HJA+cBejEtIGD+opPbHMTMBKQHvM86dZZmlWymPB
 5Xm81R69RrODdeR87txnzlFTNB++r2MIVoBZLgPWS09Qw+MqAwo5ndN/PmnGchSRe1jI2jHD3O
 gPc=
X-SBRS: 2.7
X-MesageID: 13451302
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,468,1574139600"; d="scan'208";a="13451302"
Date: Fri, 21 Feb 2020 17:22:56 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Message-ID: <20200221162256.GF4679@Air-de-Roger>
References: <20200220173116.88915-1-roger.pau@citrix.com>
 <83d48223-21eb-be54-985c-085449661892@xen.org>
 <20200221091005.GT4679@Air-de-Roger>
 <ac7ffe8b-06b0-655e-e842-cbc5d47ea85f@suse.com>
 <20200221142635.GA4679@Air-de-Roger>
 <41526075-cab4-064b-dbd5-3d4667bb6309@suse.com>
 <20200221144924.GC4679@Air-de-Roger>
 <0e0dd272-5303-08c6-7aae-23cc796ce563@suse.com>
 <20200221145807.GD4679@Air-de-Roger>
 <75084582-2c96-8b76-43b8-1e1330bbcd22@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <75084582-2c96-8b76-43b8-1e1330bbcd22@suse.com>
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
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

T24gRnJpLCBGZWIgMjEsIDIwMjAgYXQgMDQ6MTU6MzlQTSArMDEwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gT24gMjEuMDIuMjAyMCAxNTo1OCwgUm9nZXIgUGF1IE1vbm7DqSB3cm90ZToKPiA+IE9u
IEZyaSwgRmViIDIxLCAyMDIwIGF0IDAzOjUyOjI4UE0gKzAxMDAsIEphbiBCZXVsaWNoIHdyb3Rl
Ogo+ID4+IE9uIDIxLjAyLjIwMjAgMTU6NDksIFJvZ2VyIFBhdSBNb25uw6kgd3JvdGU6Cj4gPj4+
IE9uIEZyaSwgRmViIDIxLCAyMDIwIGF0IDAzOjQxOjU5UE0gKzAxMDAsIEphbiBCZXVsaWNoIHdy
b3RlOgo+ID4+Pj4gT24gMjEuMDIuMjAyMCAxNToyNiwgUm9nZXIgUGF1IE1vbm7DqSB3cm90ZToK
PiA+Pj4+PiBPbiBGcmksIEZlYiAyMSwgMjAyMCBhdCAwMjozNjo1MlBNICswMTAwLCBKYW4gQmV1
bGljaCB3cm90ZToKPiA+Pj4+Pj4gT24gMjEuMDIuMjAyMCAxMDoxMCwgUm9nZXIgUGF1IE1vbm7D
qSB3cm90ZToKPiA+Pj4+Pj4+IE9uIFRodSwgRmViIDIwLCAyMDIwIGF0IDA3OjIwOjA2UE0gKzAw
MDAsIEp1bGllbiBHcmFsbCB3cm90ZToKPiA+Pj4+Pj4+PiBIaSwKPiA+Pj4+Pj4+Pgo+ID4+Pj4+
Pj4+IE9uIDIwLzAyLzIwMjAgMTc6MzEsIFJvZ2VyIFBhdSBNb25uZSB3cm90ZToKPiA+Pj4+Pj4+
Pj4gQWxsb3cgYSBDUFUgYWxyZWFkeSBob2xkaW5nIHRoZSBsb2NrIGluIHdyaXRlIG1vZGUgdG8g
YWxzbyBsb2NrIGl0IGluCj4gPj4+Pj4+Pj4+IHJlYWQgbW9kZS4gVGhlcmUncyBubyBoYXJtIGlu
IGFsbG93aW5nIHJlYWQgbG9ja2luZyBhIHJ3bG9jayB0aGF0J3MKPiA+Pj4+Pj4+Pj4gYWxyZWFk
eSBvd25lZCBieSB0aGUgY2FsbGVyIChpZTogQ1BVKSBpbiB3cml0ZSBtb2RlLiBBbGxvd2luZyBz
dWNoCj4gPj4+Pj4+Pj4+IGFjY2Vzc2VzIGlzIHJlcXVpcmVkIGF0IGxlYXN0IGZvciB0aGUgQ1BV
IG1hcHMgdXNlLWNhc2UuCj4gPj4+Pj4+Pj4+Cj4gPj4+Pj4+Pj4+IEluIG9yZGVyIHRvIGRvIHRo
aXMgcmVzZXJ2ZSAxNGJpdHMgb2YgdGhlIGxvY2ssIHRoaXMgYWxsb3dzIHRvIHN1cHBvcnQKPiA+
Pj4+Pj4+Pj4gdXAgdG8gMTYzODQgQ1BVcy4gQWxzbyByZWR1Y2UgdGhlIHdyaXRlIGxvY2sgbWFz
ayB0byAyIGJpdHM6IG9uZSB0bwo+ID4+Pj4+Pj4+PiBzaWduYWwgdGhlcmUgYXJlIHBlbmRpbmcg
d3JpdGVycyB3YWl0aW5nIG9uIHRoZSBsb2NrIGFuZCB0aGUgb3RoZXIgdG8KPiA+Pj4+Pj4+Pj4g
c2lnbmFsIHRoZSBsb2NrIGlzIG93bmVkIGluIHdyaXRlIG1vZGUuIE5vdGUgdGhlIHdyaXRlIHJl
bGF0ZWQgZGF0YQo+ID4+Pj4+Pj4+PiBpcyB1c2luZyAxNmJpdHMsIHRoaXMgaXMgZG9uZSBpbiBv
cmRlciB0byBiZSBhYmxlIHRvIGNsZWFyIGl0IChhbmQKPiA+Pj4+Pj4+Pj4gdGh1cyByZWxlYXNl
IHRoZSBsb2NrKSB1c2luZyBhIDE2Yml0IGF0b21pYyB3cml0ZS4KPiA+Pj4+Pj4+Pj4KPiA+Pj4+
Pj4+Pj4gVGhpcyByZWR1Y2VzIHRoZSBtYXhpbXVtIG51bWJlciBvZiBjb25jdXJyZW50IHJlYWRl
cnMgZnJvbSAxNjc3NzIxNiB0bwo+ID4+Pj4+Pj4+PiA2NTUzNiwgSSB0aGluayB0aGlzIHNob3Vs
ZCBzdGlsbCBiZSBlbm91Z2gsIG9yIGVsc2UgdGhlIGxvY2sgZmllbGQKPiA+Pj4+Pj4+Pj4gY2Fu
IGJlIGV4cGFuZGVkIGZyb20gMzIgdG8gNjRiaXRzIGlmIGFsbCBhcmNoaXRlY3R1cmVzIHN1cHBv
cnQgYXRvbWljCj4gPj4+Pj4+Pj4+IG9wZXJhdGlvbnMgb24gNjRiaXQgaW50ZWdlcnMuCj4gPj4+
Pj4+Pj4KPiA+Pj4+Pj4+PiBGV0lXLCBhcm0zMiBpcyBhYmxlIHRvIHN1cHBvcnQgYXRvbWljIG9w
ZXJhdGlvbnMgb24gNjQtYml0IGludGVnZXJzLgo+ID4+Pj4+Pj4+Cj4gPj4+Pj4+Pj4+ICAgc3Rh
dGljIGlubGluZSB2b2lkIF93cml0ZV91bmxvY2socndsb2NrX3QgKmxvY2spCj4gPj4+Pj4+Pj4+
ICAgewo+ID4+Pj4+Pj4+PiAtICAgIC8qCj4gPj4+Pj4+Pj4+IC0gICAgICogSWYgdGhlIHdyaXRl
ciBmaWVsZCBpcyBhdG9taWMsIGl0IGNhbiBiZSBjbGVhcmVkIGRpcmVjdGx5Lgo+ID4+Pj4+Pj4+
PiAtICAgICAqIE90aGVyd2lzZSwgYW4gYXRvbWljIHN1YnRyYWN0aW9uIHdpbGwgYmUgdXNlZCB0
byBjbGVhciBpdC4KPiA+Pj4+Pj4+Pj4gLSAgICAgKi8KPiA+Pj4+Pj4+Pj4gLSAgICBhdG9taWNf
c3ViKF9RV19MT0NLRUQsICZsb2NrLT5jbnRzKTsKPiA+Pj4+Pj4+Pj4gKyAgICAvKiBTaW5jZSB0
aGUgd3JpdGVyIGZpZWxkIGlzIGF0b21pYywgaXQgY2FuIGJlIGNsZWFyZWQgZGlyZWN0bHkuICov
Cj4gPj4+Pj4+Pj4+ICsgICAgQVNTRVJUKF9pc193cml0ZV9sb2NrZWRfYnlfbWUoYXRvbWljX3Jl
YWQoJmxvY2stPmNudHMpKSk7Cj4gPj4+Pj4+Pj4+ICsgICAgQlVJTERfQlVHX09OKF9RUl9TSElG
VCAhPSAxNik7Cj4gPj4+Pj4+Pj4+ICsgICAgd3JpdGVfYXRvbWljKCh1aW50MTZfdCAqKSZsb2Nr
LT5jbnRzLCAwKTsKPiA+Pj4+Pj4+Pgo+ID4+Pj4+Pj4+IEkgdGhpbmsgdGhpcyBpcyBhbiBhYnVz
ZSB0byBjYXN0IGFuIGF0b21pY190KCkgZGlyZWN0bHkgaW50byBhIHVpbnQxNl90LiBZb3UKPiA+
Pj4+Pj4+PiB3b3VsZCBhdCBsZWFzdCB3YW50IHRvIHVzZSAmbG9jay0+Y250cy5jb3VudGVyIGhl
cmUuCj4gPj4+Pj4+Pgo+ID4+Pj4+Pj4gU3VyZSwgSSB3YXMgd29uZGVyaW5nIGFib3V0IHRoaXMg
bXlzZWxmLgo+ID4+Pj4+Pj4KPiA+Pj4+Pj4+IFdpbGwgd2FpdCBmb3IgbW9yZSBjb21tZW50cywg
bm90IHN1cmUgd2hldGhlciB0aGlzIGNhbiBiZSBmaXhlZCB1cG9uCj4gPj4+Pj4+PiBjb21taXQg
aWYgdGhlcmUgYXJlIG5vIG90aGVyIGlzc3Vlcy4KPiA+Pj4+Pj4KPiA+Pj4+Pj4gSXQncyBtb3Jl
IHRoYW4ganVzdCBhZGRpbmcgYW5vdGhlciBmaWVsZCBzcGVjaWZpZXIgaGVyZS4gQSBjYXN0IGxp
a2UKPiA+Pj4+Pj4gdGhpcyBvbmUgaXMgZW5kaWFubmVzcy11bnNhZmUsIGFuZCBoZW5jZSBhIHRy
YXAgd2FpdGluZyBmb3IgYSBiaWcKPiA+Pj4+Pj4gZW5kaWFuIHBvcnQgYXR0ZW1wdCB0byBmYWxs
IGludG8uIEF0IHRoZSB2ZXJ5IGxlYXN0IHRoaXMgc2hvdWxkIGNhdXNlCj4gPj4+Pj4+IGEgYnVp
bGQgZmFpbHVyZSBvbiBiaWcgZW5kaWFuIHN5c3RlbXMsIGV2ZW4gYmV0dGVyIHdvdWxkIGJlIGlm
IGl0IHdhcwo+ID4+Pj4+PiBlbmRpYW5uZXNzLXNhZmUuCj4gPj4+Pj4KPiA+Pj4+PiBXaHkgZG9u
J3Qgd2UgbGVhdmUgdGhlIGF0b21pY19kZWMgdGhlbj8KPiA+Pj4+Cj4gPj4+PiBCZWNhdXNlIHlv
dSBuZWVkIHRvIGludm9rZSBzbXBfcHJvY2Vzc29yX2lkKCkgdG8gY2FsY3VsYXRlIHRoZSB2YWx1
ZQo+ID4+Pj4gdG8gdXNlIGluIHRoZSBzdWJ0cmFjdGlvbi4gSSdtIG5vdCBtZWFuaW5nIHRvIHNh
eSBJJ20gZW50aXJlbHkKPiA+Pj4+IG9wcG9zZWQgKHNlZWluZyBob3cgbXVjaCBvZiBhIGRpc2N1
c3Npb24gd2UncmUgaGF2aW5nKSwgYnV0IHRoZQo+ID4+Pj4gInNpbXBsZSB3cml0ZSBvZiB6ZXJv
IiBhcHByb2FjaCBpcyBjZXJ0YWlubHkgYXBwZWFsaW5nLgo+ID4+Pgo+ID4+PiBXZWxsLCB3ZSBj
b3VsZCBhdm9pZCB0aGUgc21wX3Byb2Nlc3Nvcl9pZCgpIGNhbGwgYW5kIGluc3RlYWQgdXNlOgo+
ID4+Pgo+ID4+PiBhdG9taWNfc3ViKGF0b21pY19yZWFkKCZsb2NrLT5jbnRzKSAmIDB4ZmZmZiwg
JmxvY2stPmNudHMpOwo+ID4+Cj4gPj4gV2hpY2ggd291bGQgbWFrZSBtZSBzdWdnZXN0IGF0b21p
Y19hbmQoKSBhZ2Fpbi4KPiA+IAo+ID4gSSdtIGNlcnRhaW5seSBub3Qgb3Bwb3NlZCB0byB0aGF0
LCBidXQgaW4gb3JkZXIgdG8gZ2V0IHRoaXMgcmVncmVzc2lvbgo+ID4gZml4ZWQgSSB3b3VsZCBh
cmd1ZSB0aGF0IHN1Y2ggYXRvbWljX3N1YiBpcyBubyB3b3JzZSB0aGFuIHdoYXQncwo+ID4gY3Vy
cmVudGx5IGRvbmUuCj4gCj4gSXQncyBvbmUgbW9yZSByZWFkIG9mIGEgcG90ZW50aWFsbHkgaGVh
dmlseSBjb250ZW5kZWQgbWVtb3J5IGxvY2F0aW9uLgo+IAo+ID4gSSBjYW4gbG9vayBpbnRvIGFk
ZGluZyBhbiBhdG9taWNfYW5kIG9wZXJhdGlvbiB0byBhbGwgYXJjaGVzLCBidXQgdGhpcwo+ID4g
aXMgbGlrZWx5IHRvIHRha2UgdGltZSBhbmQgSSB3b3VsZCBsaWtlIHRvIGdldCB0aGlzIHNvcnRl
ZCBzb29uZXIKPiA+IHJhdGhlciB0aGFuIGxhdGVyLgo+IAo+IEJlY2F1c2Ugb2YgaXQgcHJlc3Vt
YWJseSB0YWtpbmcgdGltZSBpdCB3YXMgdGhhdCBJIGFsc28gYnJvdWdodCB1cCB0bwo+IGNvbnNp
ZGVyIHJldmVydGluZy4gVGhlbiBhZ2FpbiwgdGhlIEFybSBhdG9taWNfYW5kKCkgY2FuLCBhZmFp
Y3QsIGJlCj4gdHJpdmlhbGx5IGNsb25lZCBmcm9tIHRoZWlyICJhZGQiIGNvdW50ZXJwYXJ0cywg
YnkgcmVwbGFjaW5nIHRoZQo+IG1pZGRsZSAnZCcgYm90aCBpbiB0aGUgZnVuY3Rpb24gbmFtZXMg
YW5kIGluIHRoZSBpbnNuIG1uZW1vbmljcy4gSXQncwo+IGp1c3QgdGhhdCB0aGVyZSBzaG91bGRu
J3QgYmUgYXRvbWljX2FuZF9yZXR1cm4oKSAoZm9yIG5vdCBiZWluZwo+IHVzZWZ1bCwgYXMgaXQg
ZG9lc24ndCBhbGxvdyByZWNvbnN0cnVjdGluZyB0aGUgb3JpZ2luYWwgdmFsdWUpLgoKSSd2ZSBh
ZGRlZCBhdG9taWNfYW5kIGluIGEgcHJlLXBhdGNoIGFuZCBJJ20gY3VycmVudGx5IHdhaXRpbmcg
Zm9yCmdpdGxhYiB0byBmaW5pc2ggdGVzdGluZyB0byBhc3NlcnQgdGhhdCBJJ20gbm90IGJyZWFr
aW5nIHRoZSBidWlsZC4KV2lsbCBwb3N0IG9uY2UgdGhhdCdzIGZpbmlzaGVkIGlmIHN1Y2Nlc3Nm
dWwuCgpGV0lXLCB0aGUgYnJhbmNoIGlzIGF0OgoKaHR0cDovL3hlbmJpdHMueGVuLm9yZy9naXR3
ZWIvP3A9cGVvcGxlL3JveWdlci94ZW4uZ2l0O2E9c2hvcnRsb2c7aD1yZWZzL2hlYWRzL3J3bG9j
azMKClRoYW5rcywgUm9nZXIuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9q
ZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVu
LWRldmVs
