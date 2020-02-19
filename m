Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BDA716474E
	for <lists+xen-devel@lfdr.de>; Wed, 19 Feb 2020 15:42:10 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j4QVH-0005i3-VQ; Wed, 19 Feb 2020 14:39:07 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=jH6y=4H=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1j4QVH-0005hy-5R
 for xen-devel@lists.xenproject.org; Wed, 19 Feb 2020 14:39:07 +0000
X-Inumbo-ID: 94669e02-5325-11ea-ade5-bc764e2007e4
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 94669e02-5325-11ea-ade5-bc764e2007e4;
 Wed, 19 Feb 2020 14:39:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1582123145;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=2XpTS9l75+EG4aWvjsitLfatfJwzpf9mKfs4YsbJ20M=;
 b=fa8U0dIzws3t1YjEFf2BffiATDEa23FYY8Gu0MLppmvhoYg7N+5wa61h
 dBMFG1fSiIuaMUi03vE6z8BTbQH/1fCD2kF5vn3MElBEgmbS7aMhdTPGP
 XaFIA6cWE582ZjlcgLp4QZMNE2wdRkiGIrfo3czcCqjNGXMXGlEEqOjvK A=;
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
IronPort-SDR: EpWkaBN0UtthFZBxVlmnPeGe4Ojl2vcQis5CmiOrfsajfeTe8jfzJgeXTc2H1TMZEkSdRTGm6U
 jC0hOdvlfk7f4OFepnq1G2i0IO5h+DctiRH6a8lbnhKRe9SAErggXCbXlRhSn1qMKgeji9Z/vL
 oajKkO0yCrBjo3FmLolMlRYf8C4OIWKBK0fPu27nPbDjPIjSSf8yGJQCscPZoMP1tGXpbPLAVR
 irCWuE+cPUqUH6rjeFYcj1c0bDwsP92oEeK4j4FeivMFqnU6NOS8OQpq0UOjDqyXMypjgny6RN
 +ms=
X-SBRS: 2.7
X-MesageID: 13123892
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,459,1574139600"; d="scan'208";a="13123892"
Date: Wed, 19 Feb 2020 15:38:59 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Message-ID: <20200219143859.GC4679@Air-de-Roger>
References: <20200213113237.58795-1-roger.pau@citrix.com>
 <20200213113237.58795-2-roger.pau@citrix.com>
 <d1ab3bc4-5b9e-25c7-130d-c64e91f7705c@suse.com>
 <20200219131908.GA4679@Air-de-Roger>
 <80960f9e-790d-cd3e-aa99-b45c585a6f8a@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <80960f9e-790d-cd3e-aa99-b45c585a6f8a@suse.com>
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL01.citrite.net (10.69.22.125)
Subject: Re: [Xen-devel] [PATCH 1/2] smp: convert the cpu maps lock into a
 rw lock
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gV2VkLCBGZWIgMTksIDIwMjAgYXQgMDI6NDI6NThQTSArMDEwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gT24gMTkuMDIuMjAyMCAxNDoxOSwgUm9nZXIgUGF1IE1vbm7DqSB3cm90ZToKPiA+IE9u
IFdlZCwgRmViIDE5LCAyMDIwIGF0IDAxOjU2OjAyUE0gKzAxMDAsIEphbiBCZXVsaWNoIHdyb3Rl
Ogo+ID4+IE9uIDEzLjAyLjIwMjAgMTI6MzIsIFJvZ2VyIFBhdSBNb25uZSB3cm90ZToKPiA+Pj4g
IHZvaWQgX19pbml0IHJlZ2lzdGVyX2NwdV9ub3RpZmllcihzdHJ1Y3Qgbm90aWZpZXJfYmxvY2sg
Km5iKQo+ID4+PiAgewo+ID4+PiAtICAgIGlmICggIXNwaW5fdHJ5bG9jaygmY3B1X2FkZF9yZW1v
dmVfbG9jaykgKQo+ID4+PiArICAgIGlmICggIXdyaXRlX3RyeWxvY2soJmNwdV9hZGRfcmVtb3Zl
X2xvY2spICkKPiA+Pj4gICAgICAgICAgQlVHKCk7IC8qIFNob3VsZCBuZXZlciBmYWlsIGFzIHdl
IGFyZSBjYWxsZWQgb25seSBkdXJpbmcgYm9vdC4gKi8KPiA+Pj4gICAgICBub3RpZmllcl9jaGFp
bl9yZWdpc3RlcigmY3B1X2NoYWluLCBuYik7Cj4gPj4+IC0gICAgc3Bpbl91bmxvY2soJmNwdV9h
ZGRfcmVtb3ZlX2xvY2spOwo+ID4+PiArICAgIHdyaXRlX3VubG9jaygmY3B1X2FkZF9yZW1vdmVf
bG9jayk7Cj4gPj4+ICB9Cj4gPj4KPiA+PiBTbyB3aHkgYSB3cml0ZSBsb2NrIGhlcmU/Cj4gPiAK
PiA+IG5vdGlmaWVyX2NoYWluX3JlZ2lzdGVyIGNhbGxzIGNhbm5vdCBiZSBtYWRlIGluIHBhcmFs
bGVsLCBhcyB0aGV5Cj4gPiBtb2RpZnkgdGhlIHVuZGVybHlpbmcgbm90aWZpZXIgbGlzdCB3aXRo
b3V0IHRha2luZyBhbnkgYWRkaXRpb25hbAo+ID4gbG9ja3MuCj4gCj4gSS5lLiB0aGUgbG9jayBp
cyBiZWluZyAoYWIpdXNlZCB0byBhbHNvIHByb3RlY3QgdGhlIG5vdGlmaWVyIGxpc3QsCj4gd2hp
Y2ggaXMgY2VydGFpbmx5IG5vdCBpdHMgcHVycG9zZS4gKFRoZSBsb2NraW5nIHNlZW1zIHF1aXRl
Cj4gcG9pbnRsZXNzIGhlcmUgYW55d2F5IGNvbnNpZGVyaW5nIHRoZSBfX2luaXQgdG9nZXRoZXIg
d2l0aCB0aGUKPiBuYXR1cmUgb2YgdGhlIGZ1bmN0aW9uLikKClJpZ2h0LCBpdCdzIHF1aXRlIGxp
a2VseSB0aGF0IHRoZSBsb2NrIGlzIHBvaW50bGVzcywgSSBoYXZlbid0IGxvb2tlZAphdCBhbGwg
dGhlIGNhbGxlcnMgdG8gYXNzdXJlIHRoaXMuIEFueXdheSwgaWZmIHRoZSBsb2NrIGNhbiBiZSBz
YWZlbHkKcmVtb3ZlZCB0aGF0IHNob3VsZCBiZSBkb25lIGluIGEgZGlmZmVyZW50IHBhdGNoLCBh
bmQgbm90IHRoaXMgb25lCklNTy4gVGhpcyBtZXJlbHkgc3dpdGNoaW5nIGV4aXN0aW5nIHVzZXJz
IHRvIHVzZSBhIHJ3IGxvY2suCgpUaGFua3MsIFJvZ2VyLgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2
ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
