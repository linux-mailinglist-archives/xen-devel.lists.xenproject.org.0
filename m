Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B6BE316118F
	for <lists+xen-devel@lfdr.de>; Mon, 17 Feb 2020 13:03:33 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j3f5E-0003Qg-SE; Mon, 17 Feb 2020 12:01:04 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=sxmF=4F=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1j3f5C-0003QZ-OM
 for xen-devel@lists.xenproject.org; Mon, 17 Feb 2020 12:01:02 +0000
X-Inumbo-ID: 2a84d1b0-517d-11ea-b0fd-bc764e2007e4
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2a84d1b0-517d-11ea-b0fd-bc764e2007e4;
 Mon, 17 Feb 2020 12:01:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1581940861;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=PFDiwdcHQEpIP2VmicuwfYjbTGj1dmBcoF9ORwnAdPE=;
 b=LH49sE9tmWydwyaqRiYI4EACdkl+zRVsci36N2g1jZRb6P4lJXlKHPmo
 pI28FSWMciylwQh/f3/+Lw0AL0ECQGNd3btwOYDENkNYVdWIxP9KzfaEF
 8XzgyPJQG6m3EcSSm9qt65Jf/v3AQ9SAyxNK/1QylNIlXloy4etT4+/DV 0=;
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
IronPort-SDR: UmhuXdnX53W+H7bDiTT9+uy/yKHQazWUvtQzn2HdaOp5FJgr53CnYyjNRiiVUq1f535kqThGsW
 NfXeXqfb4zIFhj2DMMT89wUwhmtJdxd1DCZhyU3DE/+U//QQuq+/mmOw93pY1iP16AI6JfWESt
 q9uPPJyXo1UdMQbSQeUu5dQwF9RcwKw8hcz86gJ5Coy6zBROR+fkTuu3qTDA3BWiT12MdfaUQZ
 bIlAQhLp+jKEJqMkBNKo9YE7NILICFOMx3Lqg90G8xqUU3wepR5vIouV0PN834mXKV0BmWsWVH
 dU8=
X-SBRS: 2.7
X-MesageID: 13183200
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,452,1574139600"; d="scan'208";a="13183200"
Date: Mon, 17 Feb 2020 13:00:54 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Wei Liu <wl@xen.org>
Message-ID: <20200217120054.GG4679@Air-de-Roger>
References: <20200214123430.4942-1-liuwe@microsoft.com>
 <20200214123430.4942-3-liuwe@microsoft.com>
 <b27c6b19151b412aaa2dc33366e71ae7@EX13D32EUC003.ant.amazon.com>
 <20200217113441.c7q2uclargvrleyo@debian>
 <20200217114031.GF4679@Air-de-Roger>
 <20200217114538.s34hqiaq35kfv2sf@debian>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200217114538.s34hqiaq35kfv2sf@debian>
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL01.citrite.net (10.69.22.125)
Subject: Re: [Xen-devel] [PATCH v2 2/3] x86/hyperv: skeleton for L0 assisted
 TLB flush
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
Cc: Wei Liu <liuwe@microsoft.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Michael Kelley <mikelley@microsoft.com>, Jan Beulich <jbeulich@suse.com>,
 Xen Development List <xen-devel@lists.xenproject.org>, "Durrant,
 Paul" <pdurrant@amazon.co.uk>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gTW9uLCBGZWIgMTcsIDIwMjAgYXQgMTE6NDU6MzhBTSArMDAwMCwgV2VpIExpdSB3cm90ZToK
PiBPbiBNb24sIEZlYiAxNywgMjAyMCBhdCAxMjo0MDozMVBNICswMTAwLCBSb2dlciBQYXUgTW9u
bsOpIHdyb3RlOgo+ID4gT24gTW9uLCBGZWIgMTcsIDIwMjAgYXQgMTE6MzQ6NDFBTSArMDAwMCwg
V2VpIExpdSB3cm90ZToKPiA+ID4gT24gRnJpLCBGZWIgMTQsIDIwMjAgYXQgMDQ6NTU6NDRQTSAr
MDAwMCwgRHVycmFudCwgUGF1bCB3cm90ZToKPiA+ID4gPiA+IC0tLS0tT3JpZ2luYWwgTWVzc2Fn
ZS0tLS0tCj4gPiA+ID4gPiBGcm9tOiBXZWkgTGl1IDx3ZWkubGl1LnhlbkBnbWFpbC5jb20+IE9u
IEJlaGFsZiBPZiBXZWkgTGl1Cj4gPiA+ID4gPiBTZW50OiAxNCBGZWJydWFyeSAyMDIwIDEzOjM0
Cj4gPiA+ID4gPiBUbzogWGVuIERldmVsb3BtZW50IExpc3QgPHhlbi1kZXZlbEBsaXN0cy54ZW5w
cm9qZWN0Lm9yZz4KPiA+ID4gPiA+IENjOiBNaWNoYWVsIEtlbGxleSA8bWlrZWxsZXlAbWljcm9z
b2Z0LmNvbT47IER1cnJhbnQsIFBhdWwKPiA+ID4gPiA+IDxwZHVycmFudEBhbWF6b24uY28udWs+
OyBXZWkgTGl1IDxsaXV3ZUBtaWNyb3NvZnQuY29tPjsgV2VpIExpdQo+ID4gPiA+ID4gPHdsQHhl
bi5vcmc+OyBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+OyBBbmRyZXcgQ29vcGVyCj4g
PiA+ID4gPiA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT47IFJvZ2VyIFBhdSBNb25uw6kgPHJv
Z2VyLnBhdUBjaXRyaXguY29tPgo+ID4gPiA+ID4gU3ViamVjdDogW1BBVENIIHYyIDIvM10geDg2
L2h5cGVydjogc2tlbGV0b24gZm9yIEwwIGFzc2lzdGVkIFRMQiBmbHVzaAo+ID4gPiA+ID4gCj4g
PiA+ID4gPiBJbXBsZW1lbnQgYSBiYXNpYyBob29rIGZvciBMMCBhc3Npc3RlZCBUTEIgZmx1c2gu
IFRoZSBob29rIG5lZWRzIHRvCj4gPiA+ID4gPiBjaGVjayBpZiBwcmVyZXF1aXNpdGVzIGFyZSBt
ZXQuIElmIHRoZXkgYXJlIG5vdCBtZXQsIGl0IHJldHVybnMgYW4gZXJyb3IKPiA+ID4gPiA+IG51
bWJlciB0byBmYWxsIGJhY2sgdG8gbmF0aXZlIGZsdXNoZXMuCj4gPiA+ID4gPiAKPiA+ID4gPiA+
IEludHJvZHVjZSBhIG5ldyB2YXJpYWJsZSB0byBpbmRpY2F0ZSBpZiBoeXBlcmNhbGwgcGFnZSBp
cyByZWFkeS4KPiA+ID4gPiA+IAo+ID4gPiA+ID4gU2lnbmVkLW9mZi1ieTogV2VpIExpdSA8bGl1
d2VAbWljcm9zb2Z0LmNvbT4KPiA+ID4gPiA+IC0tLQo+ID4gPiA+ID4gIHhlbi9hcmNoL3g4Ni9n
dWVzdC9oeXBlcnYvTWFrZWZpbGUgIHwgIDEgKwo+ID4gPiA+ID4gIHhlbi9hcmNoL3g4Ni9ndWVz
dC9oeXBlcnYvaHlwZXJ2LmMgIHwgMTcgKysrKysrKysrKysrCj4gPiA+ID4gPiAgeGVuL2FyY2gv
eDg2L2d1ZXN0L2h5cGVydi9wcml2YXRlLmggfCAgNCArKysKPiA+ID4gPiA+ICB4ZW4vYXJjaC94
ODYvZ3Vlc3QvaHlwZXJ2L3RsYi5jICAgICB8IDQxICsrKysrKysrKysrKysrKysrKysrKysrKysr
KysrCj4gPiA+ID4gPiAgNCBmaWxlcyBjaGFuZ2VkLCA2MyBpbnNlcnRpb25zKCspCj4gPiA+ID4g
PiAgY3JlYXRlIG1vZGUgMTAwNjQ0IHhlbi9hcmNoL3g4Ni9ndWVzdC9oeXBlcnYvdGxiLmMKPiA+
ID4gPiA+IAo+ID4gPiA+ID4gZGlmZiAtLWdpdCBhL3hlbi9hcmNoL3g4Ni9ndWVzdC9oeXBlcnYv
TWFrZWZpbGUKPiA+ID4gPiA+IGIveGVuL2FyY2gveDg2L2d1ZXN0L2h5cGVydi9NYWtlZmlsZQo+
ID4gPiA+ID4gaW5kZXggNjgxNzAxMDlhOS4uMTg5MDJjMzNlOSAxMDA2NDQKPiA+ID4gPiA+IC0t
LSBhL3hlbi9hcmNoL3g4Ni9ndWVzdC9oeXBlcnYvTWFrZWZpbGUKPiA+ID4gPiA+ICsrKyBiL3hl
bi9hcmNoL3g4Ni9ndWVzdC9oeXBlcnYvTWFrZWZpbGUKPiA+ID4gPiA+IEBAIC0xICsxLDIgQEAK
PiA+ID4gPiA+ICBvYmoteSArPSBoeXBlcnYubwo+ID4gPiA+ID4gK29iai15ICs9IHRsYi5vCj4g
PiA+ID4gPiBkaWZmIC0tZ2l0IGEveGVuL2FyY2gveDg2L2d1ZXN0L2h5cGVydi9oeXBlcnYuYwo+
ID4gPiA+ID4gYi94ZW4vYXJjaC94ODYvZ3Vlc3QvaHlwZXJ2L2h5cGVydi5jCj4gPiA+ID4gPiBp
bmRleCA3MGY0Y2Q1YWUwLi5mOWQxZjExYWUzIDEwMDY0NAo+ID4gPiA+ID4gLS0tIGEveGVuL2Fy
Y2gveDg2L2d1ZXN0L2h5cGVydi9oeXBlcnYuYwo+ID4gPiA+ID4gKysrIGIveGVuL2FyY2gveDg2
L2d1ZXN0L2h5cGVydi9oeXBlcnYuYwo+ID4gPiA+ID4gQEAgLTMzLDYgKzMzLDggQEAgREVGSU5F
X1BFUl9DUFVfUkVBRF9NT1NUTFkodm9pZCAqLCBodl9pbnB1dF9wYWdlKTsKPiA+ID4gPiA+ICBE
RUZJTkVfUEVSX0NQVV9SRUFEX01PU1RMWSh2b2lkICosIGh2X3ZwX2Fzc2lzdCk7Cj4gPiA+ID4g
PiAgREVGSU5FX1BFUl9DUFVfUkVBRF9NT1NUTFkodW5zaWduZWQgaW50LCBodl92cF9pbmRleCk7
Cj4gPiA+ID4gPiAKPiA+ID4gPiA+ICtzdGF0aWMgYm9vbCBfX3JlYWRfbW9zdGx5IGh2X2hjYWxs
X3BhZ2VfcmVhZHk7Cj4gPiA+ID4gPiArCj4gPiA+ID4gPiAgc3RhdGljIHVpbnQ2NF90IGdlbmVy
YXRlX2d1ZXN0X2lkKHZvaWQpCj4gPiA+ID4gPiAgewo+ID4gPiA+ID4gICAgICB1bmlvbiBodl9n
dWVzdF9vc19pZCBpZCA9IHt9Owo+ID4gPiA+ID4gQEAgLTExOSw2ICsxMjEsOCBAQCBzdGF0aWMg
dm9pZCBfX2luaXQgc2V0dXBfaHlwZXJjYWxsX3BhZ2Uodm9pZCkKPiA+ID4gPiA+ICAgICAgQlVH
X09OKCFoeXBlcmNhbGxfbXNyLmVuYWJsZSk7Cj4gPiA+ID4gPiAKPiA+ID4gPiA+ICAgICAgc2V0
X2ZpeG1hcF94KEZJWF9YX0hZUEVSVl9IQ0FMTCwgbWZuIDw8IFBBR0VfU0hJRlQpOwo+ID4gPiA+
IAo+ID4gPiA+IFNob3VsZG4ndCB0aGlzIGhhdmUgYXQgbGVhc3QgYSBjb21waWxlciBiYXJyaWVy
IGhlcmU/Cj4gPiA+ID4gCj4gPiA+IAo+ID4gPiBPSy4gSSB3aWxsIGFkZCBhIHdyaXRlIGJhcnJp
ZXIgaGVyZS4KPiA+IAo+ID4gSG0sIHNob3VsZG4ndCBzdWNoIGJhcnJpZXIgYmUgcGFydCBvZiBz
ZXRfZml4bWFwX3ggaXRzZWxmPwo+ID4gCj4gPiBOb3RlIHRoYXQgbWFwX3BhZ2VzX3RvX3hlbiBh
bHJlYWR5IHBlcmZvcm1zIGF0b21pYyB3cml0ZXMuCj4gCj4gSSBkb24ndCBtaW5kIG1ha2luZyB0
aGluZ3MgbW9yZSBleHBsaWNpdCB0aG91Z2guIEhvd2V2ZXIgdW5saWtlbHksIEkKPiBtYXkgZW5k
IHVwIHB1dHRpbmcgc29tZXRoaW5nIGluIGJldHdlZW4gc2V0X2ZpeG1hcF94IGFuZCBzZXR0aW5n
Cj4gaGNhbGxfcGFnZV9yZWFkeSwgSSB3aWxsIG5lZWQgdGhlIGJhcnJpZXIgYnkgdGhlbiwgSSBt
YXkgYXMgd2VsbCBwdXQgaXQKPiBpbiBub3cuCgpJTU8gc2V0X2ZpeG1hcF94IHNob3VsZCBoYXZl
IHRoZSBuZWNlc3NhcnkgYmFycmllcnMgKG9yIG90aGVyCnN5bmNocm9uaXphdGlvbiBtZXRob2Rz
KSBzbyB0aGF0IG9uIHJldHVybiB0aGUgYWRkcmVzcyBpcyBjb3JyZWN0bHkKbWFwcGVkIGFjcm9z
cyBhbGwgcHJvY2Vzc29ycywgYW5kIHRoYXQgaXQgcHJldmVudHMgdGhlIGNvbXBpbGVyIGZyb20K
bW92aW5nIGFjY2Vzc2VzIHBhc3QgaXQuIEkgd291bGQgY29uc2lkZXIgYSBidWcgb2Ygc2V0X2Zp
eG1hcF94Cm5vdCBoYXZpbmcgdGhpcyBiZWhhdmlvciBhbmQgcmVxdWlyaW5nIGNhbGxlcnMgdG8g
ZG8gZXh0cmEgd29yayBpbgpvcmRlciB0byBlbnN1cmUgdGhpcy4KCkllOiBzb21ldGhpbmcgbGlr
ZSB0aGUgc25pcHBlZCBiZWxvdyBzaG91bGQgbm90IHJlcXVpcmUgYW4gZXh0cmEKYmFycmllciBJ
TU86CgpzZXRfZml4bWFwX3goRklYX1hfSFlQRVJWX0hDQUxMLCBtZm4gPDwgUEFHRV9TSElGVCk7
CiooKHVuc2lnbmVkIGludCAqKWZpeF94X3RvX3ZpcnQoRklYX1hfSFlQRVJWX0hDQUxMKSkgPSAw
OwoKUm9nZXIuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpo
dHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
