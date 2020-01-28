Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D4DB14BDAA
	for <lists+xen-devel@lfdr.de>; Tue, 28 Jan 2020 17:26:52 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iwTfE-0006rN-1I; Tue, 28 Jan 2020 16:24:32 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=pdAI=3R=xen.org=wl@srs-us1.protection.inumbo.net>)
 id 1iwTfC-0006r0-D7
 for xen-devel@lists.xenproject.org; Tue, 28 Jan 2020 16:24:30 +0000
X-Inumbo-ID: a7b0a5bc-41ea-11ea-872c-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a7b0a5bc-41ea-11ea-872c-12813bfff9fa;
 Tue, 28 Jan 2020 16:24:28 +0000 (UTC)
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <wl@xen.org>)
 id 1iwTf9-0004YN-M8; Tue, 28 Jan 2020 16:24:27 +0000
Received: from 41.142.6.51.dyn.plus.net ([51.6.142.41] helo=debian)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <wl@xen.org>)
 id 1iwTf9-00082F-Cm; Tue, 28 Jan 2020 16:24:27 +0000
Date: Tue, 28 Jan 2020 16:24:24 +0000
From: Wei Liu <wl@xen.org>
To: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Message-ID: <20200128162424.2typsfo76l7655sc@debian>
References: <20200127181115.82709-1-roger.pau@citrix.com>
 <20200127181115.82709-8-roger.pau@citrix.com>
 <20200128141736.223qryuo3p2ss4ma@debian>
 <20200128145704.GQ57924@desktop-tdan49n.eng.citrite.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200128145704.GQ57924@desktop-tdan49n.eng.citrite.net>
User-Agent: NeoMutt/20180716
Subject: Re: [Xen-devel] [PATCH v3 7/7] x86/tlb: use Xen L0 assisted TLB
 flush when available
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
Cc: xen-devel@lists.xenproject.org, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVHVlLCBKYW4gMjgsIDIwMjAgYXQgMDM6NTc6MDRQTSArMDEwMCwgUm9nZXIgUGF1IE1vbm7D
qSB3cm90ZToKPiBPbiBUdWUsIEphbiAyOCwgMjAyMCBhdCAwMjoxNzozNlBNICswMDAwLCBXZWkg
TGl1IHdyb3RlOgo+ID4gT24gTW9uLCBKYW4gMjcsIDIwMjAgYXQgMDc6MTE6MTVQTSArMDEwMCwg
Um9nZXIgUGF1IE1vbm5lIHdyb3RlOgo+ID4gWy4uLl0KPiA+ID4gIAo+ID4gPiAgY29uc3Qgc3Ry
dWN0IGh5cGVydmlzb3Jfb3BzICpfX2luaXQgeGdfcHJvYmUodm9pZCkKPiA+ID4gZGlmZiAtLWdp
dCBhL3hlbi9hcmNoL3g4Ni9zbXAuYyBiL3hlbi9hcmNoL3g4Ni9zbXAuYwo+ID4gPiBpbmRleCA2
NWViN2NiZGE4Li45YmM5MjU2MTZhIDEwMDY0NAo+ID4gPiAtLS0gYS94ZW4vYXJjaC94ODYvc21w
LmMKPiA+ID4gKysrIGIveGVuL2FyY2gveDg2L3NtcC5jCj4gPiA+IEBAIC0xNSw2ICsxNSw3IEBA
Cj4gPiA+ICAjaW5jbHVkZSA8eGVuL3BlcmZjLmg+Cj4gPiA+ICAjaW5jbHVkZSA8eGVuL3NwaW5s
b2NrLmg+Cj4gPiA+ICAjaW5jbHVkZSA8YXNtL2N1cnJlbnQuaD4KPiA+ID4gKyNpbmNsdWRlIDxh
c20vZ3Vlc3QuaD4KPiA+ID4gICNpbmNsdWRlIDxhc20vc21wLmg+Cj4gPiA+ICAjaW5jbHVkZSA8
YXNtL21jMTQ2ODE4cnRjLmg+Cj4gPiA+ICAjaW5jbHVkZSA8YXNtL2ZsdXNodGxiLmg+Cj4gPiA+
IEBAIC0yNTYsNiArMjU3LDE2IEBAIHZvaWQgZmx1c2hfYXJlYV9tYXNrKGNvbnN0IGNwdW1hc2tf
dCAqbWFzaywgY29uc3Qgdm9pZCAqdmEsIHVuc2lnbmVkIGludCBmbGFncykKPiA+ID4gICAgICBp
ZiAoIChmbGFncyAmIH5GTFVTSF9PUkRFUl9NQVNLKSAmJgo+ID4gPiAgICAgICAgICAgIWNwdW1h
c2tfc3Vic2V0KG1hc2ssIGNwdW1hc2tfb2YoY3B1KSkgKQo+ID4gPiAgICAgIHsKPiA+ID4gKyAg
ICAgICAgaWYgKCBjcHVfaGFzX2h5cGVydmlzb3IgJiYKPiA+ID4gKyAgICAgICAgICAgICAhKGZs
YWdzICYgfihGTFVTSF9UTEIgfCBGTFVTSF9UTEJfR0xPQkFMIHwgRkxVU0hfVkFfVkFMSUQgfAo+
ID4gPiArICAgICAgICAgICAgICAgICAgICAgICAgIEZMVVNIX09SREVSX01BU0spKSAmJgo+ID4g
PiArICAgICAgICAgICAgICFoeXBlcnZpc29yX2ZsdXNoX3RsYihtYXNrLCB2YSwgZmxhZ3MgJiBG
TFVTSF9PUkRFUl9NQVNLKSApCj4gPiA+ICsgICAgICAgIHsKPiA+ID4gKyAgICAgICAgICAgIGlm
ICggdGxiX2Nsa19lbmFibGVkICkKPiA+ID4gKyAgICAgICAgICAgICAgICB0bGJfY2xrX2VuYWJs
ZWQgPSBmYWxzZTsKPiA+IAo+ID4gWW91IG1heSBkZWxldGUgdGhlIGlmIGhlcmUgdG8gbWFrZSB0
aGUgZ2VuZXJhdGVkIG1hY2hpbmUgY29kZSBzaG9ydGVyLgo+IAo+IEhtLCBidXQgdGxiX2Nsa19l
bmFibGVkIGlzIG1hcmtlZCBhcyByZWFkX21vc3RseSwgd2hpY2ggd29uJ3QgYmUgdHJ1ZQo+IHRo
ZW4sIGFuZCB3b3VsZCBsaWtlbHkgaGF2ZSBhIHBlcmZvcm1hbmNlIGltcGFjdC4KCk9LLiBGYWly
IGVub3VnaC4KCj4gCj4gPiBPT0kgd2h5IGlzbid0IHRsYl9jbGtfZW5hYmxlZCBzZXQgdG8gZmFs
c2Ugd2hlbiBYZW4gZGV0ZXJtaW5lcyB0byB1c2UgTDAKPiA+IGFzc2lzdGVkIGZsdXNoPwo+IAo+
IEwwIGFzc2lzdGVkIGZsdXNoIGNhbiBmYWlsIChpZTogcmV0dXJuIGFuIGVycm9yKSwgYW5kIGlu
IHRoYXQgY2FzZSBYZW4KPiB3b3VsZCBiZSBiZXR0ZXIgdG8gY29udGludWUgdXNpbmcgdGhlIHRp
bWVzdGFtcGVkIHRsYiwgYXMgaXQgY291bGQKPiBhdm9pZCBzb21lIGZsdXNoZXMuCgpEbyB5b3Ug
bmVlZCB0byBzZXQgdGxiX2Nsa19lbmFibGVkIGluIHRoYXQgY2FzZT8KCldlaS4KCj4gCj4gVGhh
bmtzLCBSb2dlci4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3Jn
Cmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
