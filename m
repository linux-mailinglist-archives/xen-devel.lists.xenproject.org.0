Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 279BC14DAE8
	for <lists+xen-devel@lfdr.de>; Thu, 30 Jan 2020 13:44:59 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ix99c-0007sN-Vq; Thu, 30 Jan 2020 12:42:40 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=avZM=3T=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1ix99c-0007sI-4F
 for xen-devel@lists.xenproject.org; Thu, 30 Jan 2020 12:42:40 +0000
X-Inumbo-ID: ffb536a0-435d-11ea-8396-bc764e2007e4
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ffb536a0-435d-11ea-8396-bc764e2007e4;
 Thu, 30 Jan 2020 12:42:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1580388160;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=DcmEZwuQq3i/pD+2J8ibtjRgeDw1y2BJAicpO2y5cHw=;
 b=DyPxyCtF+N8ZOKtcMdBda2AlFuGrECl4ViBSkLn2q/8Oycgib6Nq2ayA
 O+OnSBm4b5DdB4GalSZpZJeO3Wg3p4oq/8k/pei2NPW0+q4ySX7iBX7SR
 kIFJLNvTHob2bOyLMCco4nTG47JXE8ZTa/RUabBPirGSPtKIeiu4vgHxp A=;
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
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: N3k6MuO+SPTkpVlEbUGAXn/9477uq6XDS3Mjz2dwwwLsTrTb4wyzErLWVHR+rhP3rXo1uLycNn
 DslZlvd23CqGPZjrWemcHlqN59Gf+rXQd/eQsfmRFV7MnYMuh87Hu/bHm2x2tAtqxW93/4A3UR
 kLbpjn0Ol9mw6Fl5VylcgxzyTNGLx2A1sIT5thiN9yHJJ6M/xNH0DtkSOO+4ypX5cs8adgFPUt
 lWT3DV/x8ujULAnO4IsWIaE+KkcvEIkQYwa5V4z2Mzyk1Aog0PFm/q6WwHa6xOkb8+qECtPxo+
 giA=
X-SBRS: 2.7
X-MesageID: 11850886
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,381,1574139600"; d="scan'208";a="11850886"
Date: Thu, 30 Jan 2020 13:42:29 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Wei Liu <wl@xen.org>
Message-ID: <20200130124229.GN4679@Air-de-Roger>
References: <20200129202034.15052-1-liuwe@microsoft.com>
 <20200129202034.15052-13-liuwe@microsoft.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200129202034.15052-13-liuwe@microsoft.com>
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL01.citrite.net (10.69.22.125)
Subject: Re: [Xen-devel] [PATCH v5 12/12] x86/hyperv: setup VP assist page
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
 Paul Durrant <pdurrant@amazon.com>, Michael Kelley <mikelley@microsoft.com>,
 Xen Development List <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gV2VkLCBKYW4gMjksIDIwMjAgYXQgMDg6MjA6MzRQTSArMDAwMCwgV2VpIExpdSB3cm90ZToK
PiBWUCBhc3Npc3QgcGFnZSBpcyByYXRoZXIgaW1wb3J0YW50IGFzIHdlIG5lZWQgdG8gdG9nZ2xl
IHNvbWUgYml0cyBpbiBpdAo+IGZvciBlZmZpY2llbnQgbmVzdGVkIHZpcnR1YWxpc2F0aW9uLgo+
IAo+IFNpZ25lZC1vZmYtYnk6IFdlaSBMaXUgPGxpdXdlQG1pY3Jvc29mdC5jb20+Cj4gLS0tCj4g
djU6Cj4gMS4gRGVhbCB3aXRoIGVycm9yIHByb3Blcmx5IGluc3RlYWQgb2YgYWx3YXlzIHBhbmlj
a2luZwo+IDIuIFN3YXAgcGVyY3B1IHZhcmlhYmxlcyBkZWNsYXJhdGlvbnMnIGxvY2F0aW9uCj4g
Cj4gdjQ6Cj4gMS4gVXNlIHByaXZhdGUuaAo+IDIuIFByZXZlbnQgbGVhawo+IAo+IHYzOgo+IDEu
IFVzZSB4ZW5oZWFwIHBhZ2UKPiAyLiBEcm9wIHNldF92cF9hc3Npc3QKPiAKPiB2MjoKPiAxLiBV
c2UgSFZfSFlQX1BBR0VfU0hJRlQgaW5zdGVhZAo+IC0tLQo+ICB4ZW4vYXJjaC94ODYvZ3Vlc3Qv
aHlwZXJ2L2h5cGVydi5jICB8IDQ0ICsrKysrKysrKysrKysrKysrKysrKysrKysrKystCj4gIHhl
bi9hcmNoL3g4Ni9ndWVzdC9oeXBlcnYvcHJpdmF0ZS5oIHwgIDEgKwo+ICAyIGZpbGVzIGNoYW5n
ZWQsIDQ0IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKPiAKPiBkaWZmIC0tZ2l0IGEveGVu
L2FyY2gveDg2L2d1ZXN0L2h5cGVydi9oeXBlcnYuYyBiL3hlbi9hcmNoL3g4Ni9ndWVzdC9oeXBl
cnYvaHlwZXJ2LmMKPiBpbmRleCBhZjBkNmVkNjkyLi5iYzQwYTNkMzM4IDEwMDY0NAo+IC0tLSBh
L3hlbi9hcmNoL3g4Ni9ndWVzdC9oeXBlcnYvaHlwZXJ2LmMKPiArKysgYi94ZW4vYXJjaC94ODYv
Z3Vlc3QvaHlwZXJ2L2h5cGVydi5jCj4gQEAgLTMxLDYgKzMxLDcgQEAKPiAgCj4gIHN0cnVjdCBt
c19oeXBlcnZfaW5mbyBfX3JlYWRfbW9zdGx5IG1zX2h5cGVydjsKPiAgREVGSU5FX1BFUl9DUFVf
UkVBRF9NT1NUTFkodm9pZCAqLCBodl9wY3B1X2lucHV0X3BhZ2UpOwo+ICtERUZJTkVfUEVSX0NQ
VV9SRUFEX01PU1RMWSh2b2lkICosIGh2X3ZwX2Fzc2lzdCk7Cj4gIERFRklORV9QRVJfQ1BVX1JF
QURfTU9TVExZKHVuc2lnbmVkIGludCwgaHZfdnBfaW5kZXgpOwo+ICAKPiAgc3RhdGljIHVpbnQ2
NF90IGdlbmVyYXRlX2d1ZXN0X2lkKHZvaWQpCj4gQEAgLTE1NSwxNiArMTU2LDU3IEBAIHN0YXRp
YyBpbnQgc2V0dXBfaHlwZXJjYWxsX3BjcHVfYXJnKHZvaWQpCj4gICAgICByZXR1cm4gMDsKPiAg
fQo+ICAKPiArc3RhdGljIGludCBzZXR1cF92cF9hc3Npc3Qodm9pZCkKPiArewo+ICsgICAgdm9p
ZCAqbWFwcGluZzsKPiArICAgIHVpbnQ2NF90IHZhbDsKPiArCj4gKyAgICBtYXBwaW5nID0gdGhp
c19jcHUoaHZfdnBfYXNzaXN0KTsKCllvdSBjb3VsZCBhbHNvIGF2b2lkIHRoZSB1c2FnZSBvZiB0
aGUgbG9jYWwgbWFwcGluZyB2YXJpYWJsZSBoZXJlLgoKPiArCj4gKyAgICBpZiAoICFtYXBwaW5n
ICkKPiArICAgIHsKPiArICAgICAgICBtYXBwaW5nID0gYWxsb2NfeGVuaGVhcF9wYWdlKCk7Cj4g
KyAgICAgICAgaWYgKCAhbWFwcGluZyApCj4gKyAgICAgICAgewo+ICsgICAgICAgICAgICBwcmlu
dGsoIkZhaWxlZCB0byBhbGxvY2F0ZSB2cF9hc3Npc3QgcGFnZSBmb3IgQ1BVJXVcbiIsCj4gKyAg
ICAgICAgICAgICAgICAgICBzbXBfcHJvY2Vzc29yX2lkKCkpOwo+ICsgICAgICAgICAgICByZXR1
cm4gLUVOT01FTTsKPiArICAgICAgICB9Cj4gKwo+ICsgICAgICAgIGNsZWFyX3BhZ2UobWFwcGlu
Zyk7Cj4gKyAgICAgICAgdGhpc19jcHUoaHZfdnBfYXNzaXN0KSA9IG1hcHBpbmc7Cj4gKyAgICB9
Cj4gKwo+ICsgICAgdmFsID0gKHZpcnRfdG9fbWZuKG1hcHBpbmcpIDw8IEhWX0hZUF9QQUdFX1NI
SUZUKQoKVGhlcmUncyB2aXJ0X3RvX21hZGRyIHdoaWNoIHdvdWxkIGF2b2lkIHRoZSBzaGlmdC4K
Cj4gKyAgICAgICAgfCBIVl9YNjRfTVNSX1ZQX0FTU0lTVF9QQUdFX0VOQUJMRTsKPiArICAgIHdy
bXNybChIVl9YNjRfTVNSX1ZQX0FTU0lTVF9QQUdFLCB2YWwpOwo+ICsKPiArICAgIHJldHVybiAw
Owo+ICt9Cj4gKwo+ICBzdGF0aWMgdm9pZCBfX2luaXQgc2V0dXAodm9pZCkKPiAgewo+ICAgICAg
c2V0dXBfaHlwZXJjYWxsX3BhZ2UoKTsKPiArCj4gICAgICBpZiAoIHNldHVwX2h5cGVyY2FsbF9w
Y3B1X2FyZygpICkKPiAgICAgICAgICBwYW5pYygiSHlwZXJjYWxsIHBlcmNwdSBhcmcgc2V0dXAg
ZmFpbGVkXG4iKTsKPiArCj4gKyAgICBpZiAoIHNldHVwX3ZwX2Fzc2lzdCgpICkKPiArICAgICAg
ICBwYW5pYygiVlAgYXNzaXN0IHBhZ2Ugc2V0dXAgZmFpbGVkXG4iKTsKPiAgfQo+ICAKPiAgc3Rh
dGljIGludCBhcF9zZXR1cCh2b2lkKQo+ICB7Cj4gLSAgICByZXR1cm4gc2V0dXBfaHlwZXJjYWxs
X3BjcHVfYXJnKCk7Cj4gKyAgICBpbnQgcmM7Cj4gKwo+ICsgICAgcmMgPSBzZXR1cF9oeXBlcmNh
bGxfcGNwdV9hcmcoKTsKPiArICAgIGlmICggcmMgKQo+ICsgICAgICAgIGdvdG8gb3V0OwoKTm8g
bmVlZCBmb3IgYSBsYWJlbCwgYXMganVzdCByZXR1cm5pbmcgaGVyZSB3b3VsZCBtYWtlIHRoZSBm
dW5jdGlvbgpzaG9ydGVyOgoKcmMgPSBzZXR1cF9oeXBlcmNhbGxfcGNwdV9hcmcoKTsKaWYgKCBy
YyApCiAgICByZXR1cm4gcmM7CgpyZXR1cm4gc2V0dXBfdnBfYXNzaXN0KCk7CgpUaGFua3MsIFJv
Z2VyLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVu
LWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6
Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
