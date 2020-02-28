Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E1309173CFD
	for <lists+xen-devel@lfdr.de>; Fri, 28 Feb 2020 17:33:57 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j7iYD-0007co-EX; Fri, 28 Feb 2020 16:31:45 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=HvEU=4Q=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1j7iYC-0007ci-0p
 for xen-devel@lists.xenproject.org; Fri, 28 Feb 2020 16:31:44 +0000
X-Inumbo-ID: cdc483e8-5a47-11ea-ad76-bc764e2007e4
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id cdc483e8-5a47-11ea-ad76-bc764e2007e4;
 Fri, 28 Feb 2020 16:31:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1582907503;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=ASuWnMxjmWELp41VCB0+vvTODlQczhDksU5QVwcwqdY=;
 b=MbLLvfKQYhtKPaV0KyhSVKSvmUgkVFVUKIoPKF8W5y+6ODdez6kpfGhi
 kK52kl3bTsYYKrfNDczSgMLTbDn79w7E1FGBBkGN/xfG0Ro+pTFkeLVHx
 5gcG3T13lc2wB077zl++fLJ5LgPFIcU2dW9pufNBSlAqGcycVGDUP8QHl U=;
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa6.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: BnG3nMv7PSMjL+UJ3mHlXypexgkkR++9py1ideTOzdmjlM26b1PQbS8HSBe8VzqCZtGKfTjkfr
 MddXU9Gh/17zGRLJuojkO4LcN43xlleiw3Qg/zQ7gtAi6MX0LXM3hhsWZ+hPT5E0kv/ShlJqK9
 p7URzI9olJ9WZrW+pAryZ88BwIJ2OSPmh8pTACWwUOsHwTTuYgB/583tzFsK2T0OQtuwdwutCK
 fQkuuaZKWWJfQS6P6aeoPJAPuox3KHmnQz/zhsO0g8GTix+aazCS45G6fcuChojFD0PEjU61Db
 RLI=
X-SBRS: 2.7
X-MesageID: 13611836
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,496,1574139600"; d="scan'208";a="13611836"
Date: Fri, 28 Feb 2020 17:31:35 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Message-ID: <20200228163135.GD24458@Air-de-Roger.citrite.net>
References: <20200219174354.84726-1-roger.pau@citrix.com>
 <20200219174354.84726-4-roger.pau@citrix.com>
 <50f937d7-dceb-e7a1-5e0d-9f239d49dd5c@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <50f937d7-dceb-e7a1-5e0d-9f239d49dd5c@suse.com>
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL01.citrite.net (10.69.22.125)
Subject: Re: [Xen-devel] [PATCH v5 3/7] x86/hap: improve hypervisor assisted
 guest TLB flush
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
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gRnJpLCBGZWIgMjgsIDIwMjAgYXQgMDI6NTg6NDJQTSArMDEwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gT24gMTkuMDIuMjAyMCAxODo0MywgUm9nZXIgUGF1IE1vbm5lIHdyb3RlOgo+ID4gLS0t
IGEveGVuL2FyY2gveDg2L21tL2hhcC9oYXAuYwo+ID4gKysrIGIveGVuL2FyY2gveDg2L21tL2hh
cC9oYXAuYwo+ID4gQEAgLTY2OSwzMiArNjY5LDI4IEBAIHN0YXRpYyB2b2lkIGhhcF91cGRhdGVf
Y3IzKHN0cnVjdCB2Y3B1ICp2LCBpbnQgZG9fbG9ja2luZywgYm9vbCBub2ZsdXNoKQo+ID4gICAg
ICBodm1fdXBkYXRlX2d1ZXN0X2NyMyh2LCBub2ZsdXNoKTsKPiA+ICB9Cj4gPiAgCj4gPiArLyoK
PiA+ICsgKiBOQjogZG9lc24ndCBhY3R1YWxseSBwZXJmb3JtIGFueSBmbHVzaCwgdXNlZCBqdXN0
IHRvIGNsZWFyIHRoZSBDUFUgZnJvbSB0aGUKPiA+ICsgKiBtYXNrIGFuZCBoZW5jZSBzaWduYWwg
dGhhdCB0aGUgZ3Vlc3QgVExCIGZsdXNoIGhhcyBiZWVuIGRvbmUuCj4gPiArICovCj4gCj4gImhh
cyBiZWVuIGRvbmUiIGlzbid0IGNvcnJlY3QsIGFzIHRoZSBmbHVzaCBtYXkgaGFwcGVuIG9ubHkg
bGF0ZXIKPiBvbiAodXBvbiBuZXh0IFZNIGVudHJ5KS4gSSB0aGluayB3b3JkaW5nIGhlcmUgbmVl
ZHMgdG8gYmUgYXMKPiBwcmVjaXNlIGFzIHBvc3NpYmxlLCBob3dldmVyIHRoZSBjb21tZW50IG1h
eSB0dXJuIG91dCB1bm5lY2Vzc2FyeQo+IGFsdG9nZXRoZXI6CgpXaGF0IGFib3V0OgoKLyoKICog
TkI6IER1bW15IGZ1bmN0aW9uIGV4Y2x1c2l2ZWx5IHVzZWQgYXMgYSB3YXkgdG8gdHJpZ2dlciBh
IHZtZXhpdCwKICogYW5kIHRodXMgZm9yY2UgYW4gQVNJRC9WUElEIHVwZGF0ZSBvbiB2bWVudHJ5
ICh0aGF0IHdpbGwgZmx1c2ggdGhlCiAqIGNhY2hlKS4KICovCgo+ID4gQEAgLTcwNSwyMCArNzAx
LDIyIEBAIGJvb2wgaGFwX2ZsdXNoX3RsYihib29sICgqZmx1c2hfdmNwdSkodm9pZCAqY3R4dCwg
c3RydWN0IHZjcHUgKnYpLAo+ID4gICAgICAgICAgaWYgKCAhZmx1c2hfdmNwdShjdHh0LCB2KSAp
Cj4gPiAgICAgICAgICAgICAgY29udGludWU7Cj4gPiAgCj4gPiAtICAgICAgICBwYWdpbmdfdXBk
YXRlX2NyMyh2LCBmYWxzZSk7Cj4gPiArICAgICAgICBodm1fYXNpZF9mbHVzaF92Y3B1KHYpOwo+
ID4gIAo+ID4gICAgICAgICAgY3B1ID0gcmVhZF9hdG9taWMoJnYtPmRpcnR5X2NwdSk7Cj4gPiAt
ICAgICAgICBpZiAoIGlzX3ZjcHVfZGlydHlfY3B1KGNwdSkgKQo+ID4gKyAgICAgICAgaWYgKCBj
cHUgIT0gdGhpc19jcHUgJiYgaXNfdmNwdV9kaXJ0eV9jcHUoY3B1KSApCj4gPiAgICAgICAgICAg
ICAgX19jcHVtYXNrX3NldF9jcHUoY3B1LCBtYXNrKTsKPiA+ICAgICAgfQo+ID4gIAo+ID4gLSAg
ICAvKiBGbHVzaCBUTEJzIG9uIGFsbCBDUFVzIHdpdGggZGlydHkgdmNwdSBzdGF0ZS4gKi8KPiA+
IC0gICAgZmx1c2hfdGxiX21hc2sobWFzayk7Cj4gPiAtCj4gPiAtICAgIC8qIERvbmUuICovCj4g
PiAtICAgIGZvcl9lYWNoX3ZjcHUgKCBkLCB2ICkKPiA+IC0gICAgICAgIGlmICggdiAhPSBjdXJy
ZW50ICYmIGZsdXNoX3ZjcHUoY3R4dCwgdikgKQo+ID4gLSAgICAgICAgICAgIHZjcHVfdW5wYXVz
ZSh2KTsKPiA+ICsgICAgLyoKPiA+ICsgICAgICogVHJpZ2dlciBhIHZtZXhpdCBvbiBhbGwgcENQ
VXMgd2l0aCBkaXJ0eSB2Q1BVIHN0YXRlIGluIG9yZGVyIHRvIGZvcmNlIGFuCj4gPiArICAgICAq
IEFTSUQvVlBJRCBjaGFuZ2UgYW5kIGhlbmNlIGFjY29tcGxpc2ggYSBndWVzdCBUTEIgZmx1c2gu
IE5vdGUgdGhhdCB2Q1BVcwo+ID4gKyAgICAgKiBub3QgY3VycmVudGx5IHJ1bm5pbmcgd2lsbCBh
bHJlYWR5IGJlIGZsdXNoZWQgd2hlbiBzY2hlZHVsZWQgYmVjYXVzZSBvZgo+ID4gKyAgICAgKiB0
aGUgQVNJRCB0aWNrbGUgZG9uZSBpbiB0aGUgbG9vcCBhYm92ZS4KPiA+ICsgICAgICovCj4gPiAr
ICAgIG9uX3NlbGVjdGVkX2NwdXMobWFzaywgaGFuZGxlX2ZsdXNoLCBtYXNrLCAwKTsKPiA+ICsg
ICAgd2hpbGUgKCAhY3B1bWFza19lbXB0eShtYXNrKSApCj4gPiArICAgICAgICBjcHVfcmVsYXgo
KTsKPiAKPiBXaHkgZG8geW91IHBhc3MgMCBhcyBsYXN0IGFyZ3VtZW50PyBJZiB5b3UgcGFzc2Vk
IDEsIHlvdSB3b3VsZG4ndAo+IG5lZWQgdGhlIHdoaWxlKCkgaGVyZSwgaGFuZGxlX2ZsdXNoKCkg
Y291bGQgYmUgZW1wdHksIGFuZCB5b3UnZAo+IHNhdmUgYSBwZXJoYXBzIGxhcmdlIGFtb3VudCBv
ZiBDUFVzIHRvIGFsbCB0cnkgdG8gbW9kaWZ5IHR3bwo+IGNhY2hlIGxpbmVzICh0aGUgb25lIHVz
ZWQgYnkgb25fc2VsZWN0ZWRfY3B1cygpIGl0c2VsZiBhbmQgdGhlCj4gb25lIGhlcmUpIGluc3Rl
YWQgb2YganVzdCBvbmUuIFllcywgbGF0ZW5jeSBmcm9tIHRoZSBsYXN0IENQVQo+IGNsZWFyaW5n
IGl0cyBiaXQgdG8geW91IGJlaW5nIGFibGUgdG8gZXhpdCBmcm9tIGhlcmUgbWF5IGJlIGEKPiBs
aXR0bGUgbGFyZ2VyIHRoaXMgd2F5LCBidXQgb3ZlcmFsbCBsYXRlbmN5IG1heSBzaHJpbmsgd2l0
aCB0aGUKPiBjdXQgYnkgaGFsZiBhbW91bnQgb2YgYXRvbWljIG9wcyBpc3N1ZWQgdG8gdGhlIGJ1
cy4KCkluIGZhY3QgSSB0aGluayBwYXNzaW5nIDAgYXMgdGhlIGxhc3QgYXJndW1lbnQgaXMgZmlu
ZSwgYW5kCmhhbmRsZV9mbHVzaCBjYW4gYmUgZW1wdHkgaW4gdGhhdCBjYXNlIGFueXdheS4gV2Ug
ZG9uJ3QgcmVhbGx5IGNhcmUKd2hldGhlciBvbl9zZWxlY3RlZF9jcHVzIHJldHVybnMgYmVmb3Jl
IGFsbCBDUFVzIGhhdmUgZXhlY3V0ZWQgdGhlCmR1bW15IGZ1bmN0aW9uLCBhcyBsb25nIGFzIGFs
bCBvZiB0aGVtIGhhdmUgdGFrZW4gYSB2bWV4aXQuIFVzaW5nIDAKYWxyZWFkeSBndWFyYW50ZWVz
IHRoYXQgQUZBSUNULgoKPiAoRm9yY2luZyBhbiBlbXB0eSBmdW5jdGlvbiB0byBiZSBjYWxsZWQg
bWF5IHNlZW0gb2RkLCBidXQgc2VuZGluZwo+ICBqdXN0IHNvbWUgSVBJIFtsaWtlIHRoZSBldmVu
dCBjaGVjayBvbmVdIHdvdWxkbid0IGJlIGVub3VnaCwgYXMKPiAgeW91IHdhbnQgdG8gYmUgc3Vy
ZSB0aGUgb3RoZXIgc2lkZSBoYXMgYWN0dWFsbHkgcmVjZWl2ZWQgdGhlCj4gIHJlcXVlc3QuKQoK
RXhhY3RseSwgdGhhdCdzIHRoZSByZWFzb24gZm9yIHRoZSBlbXB0eSBmdW5jdGlvbi4KClRoYW5r
cywgUm9nZXIuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpo
dHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
