Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EE50ABDC5C
	for <lists+xen-devel@lfdr.de>; Wed, 25 Sep 2019 12:43:23 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iD4hg-0002UY-OM; Wed, 25 Sep 2019 10:39:24 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=8ACI=XU=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1iD4he-0002UT-Oa
 for xen-devel@lists.xenproject.org; Wed, 25 Sep 2019 10:39:22 +0000
X-Inumbo-ID: bbc34518-df80-11e9-962f-12813bfff9fa
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by localhost (Halon) with ESMTPS
 id bbc34518-df80-11e9-962f-12813bfff9fa;
 Wed, 25 Sep 2019 10:39:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1569407961;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=5BRLdPe5UV0uobvQVIBuuK4ORxJLHqsNgaXCaR8ENDk=;
 b=PKp4XY16CQLBiFPaK6zhaD7grqIz9tgvxWhe6YUiyrM3AHP3N0s1B7kU
 yOlnPUPpxDk2BCxstUlhz+Qx1LE18tgMWKw+Q7doq7vhURZj03aSsXpBj
 PMaWQwTntQYgtihDk3XIMz5i2KpBilbBpr03txpc1OONMfil4cAiXekXY 8=;
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa1.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: c4R494LDVIqaeYiaL2osmZoqjV/DpRoyDE/OhLuUzWO6EhZuUsvvONYCzE01H8rr+lpcRsbay+
 A+J+kJ5D7n5XMl+sk0qNvsjmQjUtcq+68qo/oNRcR0RhyEqu/kWzAfQrWxPNCWL58QapoYSYBO
 sELvVaazF9+gM8Lp8x3JWT2wR4+nPb77xXjPaCCBUGXlOT6sjGjLQjD6yNUQAdX1wYANxtK5Gd
 L+CpzLWDu3KOEul6y0DCXmh53KCPokfittHdFASvTyqQ4hGhIVmg4bMGxDuAIy9VlM1riIsoub
 ae8=
X-SBRS: 2.7
X-MesageID: 6105573
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,547,1559534400"; 
   d="scan'208";a="6105573"
Date: Wed, 25 Sep 2019 12:39:11 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Wei Liu <wl@xen.org>
Message-ID: <20190925103911.x4ema5oupi55izah@Air-de-Roger>
References: <20190923100931.29670-1-liuwe@microsoft.com>
 <20190923100931.29670-6-liuwe@microsoft.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190923100931.29670-6-liuwe@microsoft.com>
User-Agent: NeoMutt/20180716
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL01.citrite.net (10.69.22.125)
Subject: Re: [Xen-devel] [PATCH for-next RFC 5/8] x86: factor out hypervisor
 agnostic code
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
Cc: Xen Development List <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <liuwe@microsoft.com>,
 Jan Beulich <jbeulich@suse.com>, Michael Kelley <mikelley@microsoft.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gTW9uLCBTZXAgMjMsIDIwMTkgYXQgMTE6MDk6MjhBTSArMDEwMCwgV2VpIExpdSB3cm90ZToK
PiBUaGUgb25seSBpbXBsZW1lbnRhdGlvbiB0aGVyZSBpcyBYZW4uCj4gCj4gTm8gZnVuY3Rpb25h
bCBjaGFuZ2UuCj4gCj4gU2lnbmVkLW9mZi1ieTogV2VpIExpdSA8bGl1d2VAbWljcm9zb2Z0LmNv
bT4KPiAtLS0KPiAgeGVuL2FyY2gveDg2L2d1ZXN0L01ha2VmaWxlICAgICAgICAgICAgfCAgIDIg
Kwo+ICB4ZW4vYXJjaC94ODYvZ3Vlc3QvaHlwZXJ2aXNvci5jICAgICAgICB8IDExMiArKysrKysr
KysrKysrKysrKysrKysrKysrCj4gIHhlbi9hcmNoL3g4Ni9ndWVzdC94ZW4veGVuLmMgICAgICAg
ICAgIHwgIDgxICstLS0tLS0tLS0tLS0tLS0tLQo+ICB4ZW4vaW5jbHVkZS9hc20teDg2L2d1ZXN0
LmggICAgICAgICAgICB8ICAgMSArCj4gIHhlbi9pbmNsdWRlL2FzbS14ODYvZ3Vlc3QvaHlwZXJ2
aXNvci5oIHwgIDU4ICsrKysrKysrKysrKysKPiAgeGVuL2luY2x1ZGUvYXNtLXg4Ni9ndWVzdC94
ZW4uaCAgICAgICAgfCAgMjEgKystLS0KPiAgNiBmaWxlcyBjaGFuZ2VkLCAxODIgaW5zZXJ0aW9u
cygrKSwgOTMgZGVsZXRpb25zKC0pCj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCB4ZW4vYXJjaC94ODYv
Z3Vlc3QvaHlwZXJ2aXNvci5jCj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCB4ZW4vaW5jbHVkZS9hc20t
eDg2L2d1ZXN0L2h5cGVydmlzb3IuaAo+IAo+IGRpZmYgLS1naXQgYS94ZW4vYXJjaC94ODYvZ3Vl
c3QvTWFrZWZpbGUgYi94ZW4vYXJjaC94ODYvZ3Vlc3QvTWFrZWZpbGUKPiBpbmRleCA2ODA2ZjA0
OTQ3Li5mNjNkNjRiYmVlIDEwMDY0NAo+IC0tLSBhL3hlbi9hcmNoL3g4Ni9ndWVzdC9NYWtlZmls
ZQo+ICsrKyBiL3hlbi9hcmNoL3g4Ni9ndWVzdC9NYWtlZmlsZQo+IEBAIC0xICsxLDMgQEAKPiAr
b2JqLXkgKz0gaHlwZXJ2aXNvci5vCj4gKwo+ICBzdWJkaXItJChDT05GSUdfWEVOX0dVRVNUKSAr
PSB4ZW4KPiBkaWZmIC0tZ2l0IGEveGVuL2FyY2gveDg2L2d1ZXN0L2h5cGVydmlzb3IuYyBiL3hl
bi9hcmNoL3g4Ni9ndWVzdC9oeXBlcnZpc29yLmMKPiBuZXcgZmlsZSBtb2RlIDEwMDY0NAo+IGlu
ZGV4IDAwMDAwMDAwMDAuLmIwYTcyNGJmMTMKPiAtLS0gL2Rldi9udWxsCj4gKysrIGIveGVuL2Fy
Y2gveDg2L2d1ZXN0L2h5cGVydmlzb3IuYwo+IEBAIC0wLDAgKzEsMTEyIEBACj4gKy8qKioqKioq
KioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioq
KioqKioqKioqKioqKioKPiArICogYXJjaC94ODYvZ3Vlc3QvaHlwZXJ2aXNvci5jCj4gKyAqCj4g
KyAqIFN1cHBvcnQgZm9yIGRldGVjdGluZyBhbmQgcnVubmluZyB1bmRlciBhIGh5cGVydmlzb3Iu
Cj4gKyAqCj4gKyAqIFRoaXMgcHJvZ3JhbSBpcyBmcmVlIHNvZnR3YXJlOyB5b3UgY2FuIHJlZGlz
dHJpYnV0ZSBpdCBhbmQvb3IgbW9kaWZ5Cj4gKyAqIGl0IHVuZGVyIHRoZSB0ZXJtcyBvZiB0aGUg
R05VIEdlbmVyYWwgUHVibGljIExpY2Vuc2UgYXMgcHVibGlzaGVkIGJ5Cj4gKyAqIHRoZSBGcmVl
IFNvZnR3YXJlIEZvdW5kYXRpb247IGVpdGhlciB2ZXJzaW9uIDIgb2YgdGhlIExpY2Vuc2UsIG9y
Cj4gKyAqIChhdCB5b3VyIG9wdGlvbikgYW55IGxhdGVyIHZlcnNpb24uCj4gKyAqCj4gKyAqIFRo
aXMgcHJvZ3JhbSBpcyBkaXN0cmlidXRlZCBpbiB0aGUgaG9wZSB0aGF0IGl0IHdpbGwgYmUgdXNl
ZnVsLAo+ICsgKiBidXQgV0lUSE9VVCBBTlkgV0FSUkFOVFk7IHdpdGhvdXQgZXZlbiB0aGUgaW1w
bGllZCB3YXJyYW50eSBvZgo+ICsgKiBNRVJDSEFOVEFCSUxJVFkgb3IgRklUTkVTUyBGT1IgQSBQ
QVJUSUNVTEFSIFBVUlBPU0UuICBTZWUgdGhlCj4gKyAqIEdOVSBHZW5lcmFsIFB1YmxpYyBMaWNl
bnNlIGZvciBtb3JlIGRldGFpbHMuCj4gKyAqCj4gKyAqIFlvdSBzaG91bGQgaGF2ZSByZWNlaXZl
ZCBhIGNvcHkgb2YgdGhlIEdOVSBHZW5lcmFsIFB1YmxpYyBMaWNlbnNlCj4gKyAqIGFsb25nIHdp
dGggdGhpcyBwcm9ncmFtOyBJZiBub3QsIHNlZSA8aHR0cDovL3d3dy5nbnUub3JnL2xpY2Vuc2Vz
Lz4uCj4gKyAqCj4gKyAqIENvcHlyaWdodCAoYykgMjAxNyBDaXRyaXggU3lzdGVtcyBMdGQuCj4g
KyAqLwo+ICsKPiArI2luY2x1ZGUgPHhlbi9pbml0Lmg+Cj4gKyNpbmNsdWRlIDx4ZW4vbW0uaD4K
PiArI2luY2x1ZGUgPHhlbi9yYW5nZXNldC5oPgo+ICsKPiArI2luY2x1ZGUgPGFzbS9ndWVzdC5o
Pgo+ICsjaW5jbHVkZSA8YXNtL3Byb2Nlc3Nvci5oPgo+ICsKPiArc3RhdGljIHN0cnVjdCByYW5n
ZXNldCAqbWVtOwo+ICsKPiArdm9pZCBfX2luaXQgcHJvYmVfaHlwZXJ2aXNvcih2b2lkKQoKSU1P
IHdvdWxkIGJlIG5pY2UgdG8gdGFrZSB0aGUgb3Bwb3J0dW5pdHkgdG8gcmVuYW1lIHRoaXMgdG8K
aHlwZXJ2aXNvcl9wcm9iZSwgdG8gbWF0Y2ggd2l0aCB0aGUgcmVzdCBvZiB0aGUgaHlwZXJ2aXNv
cl8gZnVuY3Rpb25zLgoKPiBkaWZmIC0tZ2l0IGEveGVuL2luY2x1ZGUvYXNtLXg4Ni9ndWVzdC94
ZW4uaCBiL3hlbi9pbmNsdWRlL2FzbS14ODYvZ3Vlc3QveGVuLmgKPiBpbmRleCBiMDE1ZWQxODgz
Li5kMDMxZjFmNzBkIDEwMDY0NAo+IC0tLSBhL3hlbi9pbmNsdWRlL2FzbS14ODYvZ3Vlc3QveGVu
LmgKPiArKysgYi94ZW4vaW5jbHVkZS9hc20teDg2L2d1ZXN0L3hlbi5oCj4gQEAgLTMyLDEyICsz
MiwxMCBAQCBleHRlcm4gYm9vbCB4ZW5fZ3Vlc3Q7Cj4gIGV4dGVybiBib29sIHB2X2NvbnNvbGU7
Cj4gIGV4dGVybiB1aW50MzJfdCB4ZW5fY3B1aWRfYmFzZTsKPiAgCj4gLXZvaWQgcHJvYmVfaHlw
ZXJ2aXNvcih2b2lkKTsKPiAtdm9pZCBoeXBlcnZpc29yX3NldHVwKHZvaWQpOwo+IC12b2lkIGh5
cGVydmlzb3JfYXBfc2V0dXAodm9pZCk7Cj4gLWludCBoeXBlcnZpc29yX2FsbG9jX3VudXNlZF9w
YWdlKG1mbl90ICptZm4pOwo+IC1pbnQgaHlwZXJ2aXNvcl9mcmVlX3VudXNlZF9wYWdlKG1mbl90
IG1mbik7Cj4gLXZvaWQgaHlwZXJ2aXNvcl9yZXN1bWUodm9pZCk7Cj4gK3ZvaWQgcHJvYmVfeGVu
KHZvaWQpOwo+ICt2b2lkIHhlbl9zZXR1cCh2b2lkKTsKPiArdm9pZCB4ZW5fYXBfc2V0dXAodm9p
ZCk7Cj4gK3ZvaWQgeGVuX3Jlc3VtZSh2b2lkKTsKPiAgCj4gIERFQ0xBUkVfUEVSX0NQVSh1bnNp
Z25lZCBpbnQsIHZjcHVfaWQpOwo+ICBERUNMQVJFX1BFUl9DUFUoc3RydWN0IHZjcHVfaW5mbyAq
LCB2Y3B1X2luZm8pOwo+IEBAIC00NywxNiArNDUsNyBAQCBERUNMQVJFX1BFUl9DUFUoc3RydWN0
IHZjcHVfaW5mbyAqLCB2Y3B1X2luZm8pOwo+ICAjZGVmaW5lIHhlbl9ndWVzdCAwCj4gICNkZWZp
bmUgcHZfY29uc29sZSAwCj4gIAo+IC1zdGF0aWMgaW5saW5lIHZvaWQgcHJvYmVfaHlwZXJ2aXNv
cih2b2lkKSB7fQo+IC0KPiAtc3RhdGljIGlubGluZSB2b2lkIGh5cGVydmlzb3Jfc2V0dXAodm9p
ZCkKPiAtewo+IC0gICAgQVNTRVJUX1VOUkVBQ0hBQkxFKCk7Cj4gLX0KPiAtc3RhdGljIGlubGlu
ZSB2b2lkIGh5cGVydmlzb3JfYXBfc2V0dXAodm9pZCkKPiAtewo+IC0gICAgQVNTRVJUX1VOUkVB
Q0hBQkxFKCk7Cj4gLX0KPiArc3RhdGljIGlubGluZSB2b2lkIHByb2JlX3hlbih2b2lkKSB7fQoK
V2h5IGRvIHlvdSBuZWVkIHRoaXM/CgpBRkFJQ1QgcHJvYmVfeGVuIGlzIHVzZWQgaW4gdGhlIHNh
bWUgd2F5IGFzIHRoZSByZXN0IG9mIHRoZSB4ZW5fKgpmdW5jdGlvbnMsIGFuZCBoZW5jZSBJIHdv
bmRlciB3aHkgeW91IG5lZWQgYSBzdHViIGZvciBpdD8KCkkgZ3Vlc3MgdGhpcyBpcyBhIGZvcndh
cmQtbG9va2luZyBjaGFuZ2UgZm9yIHdoZW4gcHJvYmVfeGVuIHdpbGwgYmUKY2FsbGVkIHVuY29u
ZGl0aW9uYWxseSB0byBjaGVjayBmb3IgWGVuIHN1cHBvcnQ/CgpUaGFua3MsIFJvZ2VyLgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1h
aWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54
ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
