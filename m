Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 09679173B51
	for <lists+xen-devel@lfdr.de>; Fri, 28 Feb 2020 16:24:40 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j7hSf-0000Yk-8i; Fri, 28 Feb 2020 15:21:57 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=HvEU=4Q=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1j7hSd-0000Yf-7B
 for xen-devel@lists.xenproject.org; Fri, 28 Feb 2020 15:21:55 +0000
X-Inumbo-ID: 0cd8ae9c-5a3e-11ea-ad76-bc764e2007e4
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0cd8ae9c-5a3e-11ea-ad76-bc764e2007e4;
 Fri, 28 Feb 2020 15:21:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1582903314;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=HMGkuVIMn/cZ1PVJnQ4lXnKf3bt9H+v9tts9eBu4SnU=;
 b=Z0dNaWy8PWEOynuytgWp5a4E8U8iI1/QTOyJOnNmRZ+c0qGHpVmIqD6V
 WOF5SXGx9KO2my+nvDqS++1vIa7tGhzSAORxgLuE4Ah6fKgl+AyQyEFo2
 V65PnX/eQBfstWiLp/kH7yxy+z8Kvw6tMKE0wndn6YKYvg1rVZfGLKDa3 4=;
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa2.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: C21enuLVorYiDpqR0KOQmuW+x9exE/n1/hvuNxCFnSFAJMqJkgr8Vk+Ln6kA2lV4ZnN7TIQGXx
 DnrqP38ocpTkKfpyoAW8JmOc5tfYijf0g14nIXG3y5V/mHdY9kvYKAQiQ8wKCK+V9ds1JgBHdG
 Akg79r1of0jY2W8RsSR8clpCm2dktWEBoXscxInrFP5N60/w6YCBTKPf9vv3nLllTvx47e6dtQ
 2l2YUHDihYtizaBF9I0dg8sSasoQOXA+b/cKsRUQeo7w0sNVHzAYE+u9IIA3JwIUz2BQKRkPiZ
 /rM=
X-SBRS: 2.7
X-MesageID: 13182233
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,496,1574139600"; d="scan'208";a="13182233"
Date: Fri, 28 Feb 2020 16:21:46 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Message-ID: <20200228152146.GZ24458@Air-de-Roger.citrite.net>
References: <2d3ced57-7d53-bb90-ccf6-e521e6eeb556@suse.com>
 <d2833654-fc51-555e-1c38-bda283baf27f@suse.com>
 <20200228123116.GW24458@Air-de-Roger.citrite.net>
 <25579374-ab95-9ab8-f4b5-3c12dee43865@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <25579374-ab95-9ab8-f4b5-3c12dee43865@suse.com>
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL01.citrite.net (10.69.22.125)
Subject: Re: [Xen-devel] [PATCH v2 2/2] AMD/IOMMU: without XT,
 x2APIC needs to be forced into physical mode
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Kevin Tian <kevin.tian@intel.com>, Wei Liu <wl@xen.org>, Andrew
 Cooper <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gRnJpLCBGZWIgMjgsIDIwMjAgYXQgMDE6Mzk6NTlQTSArMDEwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gT24gMjguMDIuMjAyMCAxMzozMSwgUm9nZXIgUGF1IE1vbm7DqSB3cm90ZToKPiA+IE9u
IEZyaSwgRmViIDI4LCAyMDIwIGF0IDAxOjEyOjAzUE0gKzAxMDAsIEphbiBCZXVsaWNoIHdyb3Rl
Ogo+ID4+IC0tLSBhL3hlbi9hcmNoL3g4Ni9nZW5hcGljL3gyYXBpYy5jCj4gPj4gKysrIGIveGVu
L2FyY2gveDg2L2dlbmFwaWMveDJhcGljLmMKPiA+PiBAQCAtMjM2LDEyICsyMzYsMjEgQEAgY29u
c3Qgc3RydWN0IGdlbmFwaWMgKl9faW5pdCBhcGljX3gyYXBpYwo+ID4+ICAgICAgICAgIHgyYXBp
Y19waHlzID0gIWlvbW11X2ludHJlbWFwIHx8Cj4gPj4gICAgICAgICAgICAgICAgICAgICAgICAo
YWNwaV9nYmxfRkFEVC5mbGFncyAmIEFDUElfRkFEVF9BUElDX1BIWVNJQ0FMKTsKPiA+PiAgICAg
IH0KPiA+PiAtICAgIGVsc2UgaWYgKCAheDJhcGljX3BoeXMgJiYgIWlvbW11X2ludHJlbWFwICkK
PiA+PiAtICAgIHsKPiA+PiAtICAgICAgICBwcmludGsoIldBUk5JTkc6IHgyQVBJQyBjbHVzdGVy
IG1vZGUgaXMgbm90IHN1cHBvcnRlZCB3aXRob3V0IGludGVycnVwdCByZW1hcHBpbmdcbiIKPiA+
PiAtICAgICAgICAgICAgICAgIngyQVBJQzogZm9yY2luZyBwaHlzIG1vZGVcbiIpOwo+ID4+IC0g
ICAgICAgIHgyYXBpY19waHlzID0gdHJ1ZTsKPiA+PiAtICAgIH0KPiA+PiArICAgIGVsc2UgaWYg
KCAheDJhcGljX3BoeXMgKQo+ID4+ICsgICAgICAgIHN3aXRjaCAoIGlvbW11X2ludHJlbWFwICkK
PiA+PiArICAgICAgICB7Cj4gPj4gKyAgICAgICAgY2FzZSBpb21tdV9pbnRyZW1hcF9vZmY6Cj4g
Pj4gKyAgICAgICAgY2FzZSBpb21tdV9pbnRyZW1hcF9yZXN0cmljdGVkOgo+ID4+ICsgICAgICAg
ICAgICBwcmludGsoIldBUk5JTkc6IHgyQVBJQyBjbHVzdGVyIG1vZGUgaXMgbm90IHN1cHBvcnRl
ZCAlcyBpbnRlcnJ1cHQgcmVtYXBwaW5nXG4iCj4gPj4gKyAgICAgICAgICAgICAgICAgICAieDJB
UElDOiBmb3JjaW5nIHBoeXMgbW9kZVxuIiwKPiA+PiArICAgICAgICAgICAgICAgICAgIGlvbW11
X2ludHJlbWFwID09IGlvbW11X2ludHJlbWFwX29mZiA/ICJ3aXRob3V0Igo+ID4+ICsgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIDogIndpdGgg
cmVzdHJpY3RlZCIpOwo+ID4+ICsgICAgICAgICAgICB4MmFwaWNfcGh5cyA9IHRydWU7Cj4gPiAK
PiA+IEkgdGhpbmsgeW91IGFsc28gbmVlZCB0byBmaXh1cCB0aGUgdXNhZ2Ugb2YgaW9tbXVfaW50
cmVtYXAgaW4gX19jcHVfdXAKPiA+IHNvIHRoYXQgQ1BVcyB3aXRoIEFQSUMgSURzID4gMjU1IGFy
ZSBub3QgYnJvdWdodCB1cCB3aGVuIGluCj4gPiBpb21tdV9pbnRyZW1hcF9yZXN0cmljdGVkIG1v
ZGUuCj4gCj4gVGhhdCBjZXJ0YWlubHkgd2FudHMgY2hhbmdpbmcsIHllcywgYnV0IEkgdmlldyB0
aGlzIGFzIGFuIG9ydGhvZ29uYWwKPiBhZGp1c3RtZW50LCB3aGljaCBJJ2QgbGlrZSB0byBtYWtl
IG9ubHkgb25jZSBJIHVuZGVyc3RhbmQgd2hhdCB0aGUKPiBiZWhhdmlvciBmb3IgQVBJQyBJRCAw
eGZmIHNob3VsZCBiZSBpbiB0aGlzIHNldHVwLgoKSSB3b3VsZCBzYXkgQVBJQyBJRCAweGZmIHNo
b3VsZCBiZSB0aGUgYnJvYWRjYXN0IElELCBvciBlbHNlIHJlbWFwcGVkCmludGVycnVwdHMgd29u
J3QgYmUgYWJsZSB0byB1c2UgYSBicm9hZGNhc3QgZGVzdGluYXRpb24/IEknbSBob3dldmVyCm5v
dCBhYmxlIHRvIGZpbmQgYW55IG1lbnRpb24gdG8gdGhpcyBpbiB0aGUgQU1ELVZpIHNwZWMuCgpT
byB0aGUgY2hlY2sgaW4gX19jcHVfdXAgc2hvdWxkIGJlIGFkanVzdGVkIHRvIGlvbW11X2ludHJl
bWFwICE9CmlvbW11X2ludHJlbWFwX2Z1bGwgSSB0aGluaywgb3IgZWxzZSB5b3Ugd29uJ3QgYmUg
YWJsZSB0byBhZGRyZXNzIHRoZQpDUFVzIGJyb3VnaHQgdXAgZnJvbSB0aGUgaW50ZXJydXB0IHJl
bWFwcGluZyB0YWJsZXMuCgpBbnl3YXksIHRoZSBjaGFuZ2UgbG9va3MgZmluZSwgc286CgpSZXZp
ZXdlZC1ieTogUm9nZXIgUGF1IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJpeC5jb20+CgpUaGFua3Ms
IFJvZ2VyLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
WGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0
cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
