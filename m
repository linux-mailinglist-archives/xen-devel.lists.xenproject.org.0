Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DDDB814C842
	for <lists+xen-devel@lfdr.de>; Wed, 29 Jan 2020 10:42:30 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iwjoG-0008NI-TH; Wed, 29 Jan 2020 09:38:56 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=yA0q=3S=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1iwjoF-0008ND-7b
 for xen-devel@lists.xenproject.org; Wed, 29 Jan 2020 09:38:55 +0000
X-Inumbo-ID: 29bcbf4c-427b-11ea-8396-bc764e2007e4
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 29bcbf4c-427b-11ea-8396-bc764e2007e4;
 Wed, 29 Jan 2020 09:38:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1580290735;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=16vliraU7Mg+phn8jva/P55Bx/uSH/uerNeE6WnUMrc=;
 b=a4bO5sx/NOtzMpRbXVZL7gZhpAhtKwjuuwHmSmngtnvVGJY1TrgCg6ys
 OsKRbOH61yELV/4luJqrx3631agsAsq+B6qEzZEalDnOysNI/K0As0Jsw
 qHH2QKIk+i14bxq15fxfHc9ZZLylwb0ri9gDtYSDHRZAlPbUmpvQsnABa I=;
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
IronPort-SDR: 3NUp84wDc1R5oQNISt2AsC01BZNGkoE9WYTUDLiUIpWYylCt6k+e/bBJZnvN6YXRT/urFlYtln
 aj2dSK38GjczClCYcKZNwubRqeuXH4lWQpLjzWQEuHHhjSba7AI8bYPZpm0uWmzPjzA19wkhVN
 RuHDIgype+AYqjG1ZfjoHWCh+zHAQRxSClTPnbn52QAoasawLaTGS1tWFi/+usth6L6dBFqqaD
 OBbme0P6PAya0x7eyLncQJwskNmwrDixpYyA2JOX5E8vgFevlEKKtq+Mb7PmXXvC7KymTMZEA4
 /Ss=
X-SBRS: 2.7
X-MesageID: 11619649
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,377,1574139600"; d="scan'208";a="11619649"
Date: Wed, 29 Jan 2020 10:38:38 +0100
From: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Message-ID: <20200129093838.GU57924@desktop-tdan49n.eng.citrite.net>
References: <93b4ae81-6bfb-f7bd-06be-62032fd9a445@suse.com>
 <20200128145422.GP57924@desktop-tdan49n.eng.citrite.net>
 <682a8462-ded7-3f73-d8fe-ffa42738a61e@suse.com>
 <20200128172521.GS57924@desktop-tdan49n.eng.citrite.net>
 <5b54a96e-a579-3442-71ef-b8904cbe7897@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <5b54a96e-a579-3442-71ef-b8904cbe7897@suse.com>
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL01.citrite.net (10.69.22.125)
Subject: Re: [Xen-devel] [PATCH] x86/HVM: relinquish resources also from
 hvm_domain_destroy()
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
 Paul Durrant <paul@xen.org>, Wei Liu <wl@xen.org>, Andrew
 Cooper <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gV2VkLCBKYW4gMjksIDIwMjAgYXQgMDk6MDE6MzRBTSArMDEwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gT24gMjguMDEuMjAyMCAxODoyNSwgUm9nZXIgUGF1IE1vbm7DqSB3cm90ZToKPiA+IE9u
IFR1ZSwgSmFuIDI4LCAyMDIwIGF0IDA0OjQ5OjA5UE0gKzAxMDAsIEphbiBCZXVsaWNoIHdyb3Rl
Ogo+ID4+IE9uIDI4LjAxLjIwMjAgMTU6NTQsIFJvZ2VyIFBhdSBNb25uw6kgd3JvdGU6Cj4gPj4+
IE9uIFR1ZSwgSmFuIDI4LCAyMDIwIGF0IDAyOjE2OjUzUE0gKzAxMDAsIEphbiBCZXVsaWNoIHdy
b3RlOgo+ID4+Pj4gLS0tIGEveGVuL2FyY2gveDg2L2h2bS9ydGMuYwo+ID4+Pj4gKysrIGIveGVu
L2FyY2gveDg2L2h2bS9ydGMuYwo+ID4+Pj4gQEAgLTg0NCw3ICs4NDQsOCBAQCB2b2lkIHJ0Y19k
ZWluaXQoc3RydWN0IGRvbWFpbiAqZCkKPiA+Pj4+ICB7Cj4gPj4+PiAgICAgIFJUQ1N0YXRlICpz
ID0gZG9tYWluX3ZydGMoZCk7Cj4gPj4+PiAgCj4gPj4+PiAtICAgIGlmICggIWhhc192cnRjKGQp
ICkKPiA+Pj4+ICsgICAgaWYgKCAhaGFzX3ZydGMoZCkgfHwgIWQtPmFyY2guaHZtLnBsX3RpbWUg
fHwKPiA+Pj4+ICsgICAgICAgICBzLT51cGRhdGVfdGltZXIuc3RhdHVzID09IFRJTUVSX1NUQVRV
U19pbnZhbGlkICkKPiA+Pj4KPiA+Pj4gWW91IGNvdWxkIGFsc28gY2hlY2sgZm9yIHRoZSBwb3J0
IHJlZ2lzdHJhdGlvbiBBRkFJQ1QsIHdoaWNoIGlzIG1heWJlCj4gPj4+IG1vcmUgb2J2aW91cz8K
PiA+Pgo+ID4+IFlvdSBjYWxsZWQgdGhhdCBhcHByb2FjaCBkaXJ0eSBhYm92ZSAtIEknZCBsaWtl
IHRvIHJlc3RyaWN0IGl0Cj4gPj4gdG8ganVzdCB3aGVyZSBubyBiZXR0ZXIgYWx0ZXJuYXRpdmUg
ZXhpc3RzLgo+ID4gCj4gPiBBY2ssIGl0IGRpZG4ndCBzZWVtIHRoYXQgYmFkIGhlcmUgYmVjYXVz
ZSB0aGlzIGlzIGEgeDg2IGVtdWxhdGVkCj4gPiBkZXZpY2UgdGhhdCByZWxpZXMgb24gSU8gcG9y
dHMsIHdoaWxlIHRoZSBpb3JlcSBjb2RlIChhbGJlaXQgeDg2Cj4gPiBzcGVjaWZpYyBBVE0pIGNv
dWxkIGJlIHVzZWQgYnkgb3RoZXIgYXJjaGVzLCBhbmQgaGVuY2Ugd291bGQgbGlrZWx5Cj4gPiBw
cmVmZXIgdG8gYXZvaWQgdXNpbmcgeDg2IHNwZWNpZmljIGRldGFpbHMgZm9yIGdlbmVyaWMgZnVu
Y3Rpb25zLCBsaWtlCj4gPiB0aGUgaW5pdCBvciBkZWluaXQgb25lcy4KPiAKPiBMaWtlbHksIGJ1
dCB0aGUgcG9ydCBJL08gaGFuZGxlciByZWdpc3RyYXRpb24gaXMgZ29pbmcgdG8gcmVtYWluCj4g
eDg2LXNwZWNpZmljLCBhbmQgaGVuY2UgdGhlcmUgd291bGQgcHJldHR5IGNlcnRhaW5seSBhbHNv
IGJlIGFuCj4gYXJjaC1zcGVjaWZpYyBpbml0IChhbmQgbWF5IGEgZGVpbml0KSBmdW5jdGlvbi4K
PiAKPiA+Pj4gSSBhbHNvIHdvbmRlciB3aGV0aGVyIGFsbCB0aG9zZSB0aW1lLXJlbGF0ZWQgZW11
bGF0aW9ucyBjb3VsZCBiZQo+ID4+PiBncm91cGVkIGludG8gYSBzaW5nbGUgaGVscGVyLCB0aGF0
IGNvdWxkIGhhdmUgYSBkLT5hcmNoLmh2bS5wbF90aW1lCj4gPj4+IGluc3RlYWQgb2YgaGF2aW5n
IHRvIHNwcmlua2xlIHN1Y2ggY2hlY2tzIGZvciBlYWNoIGRldmljZT8KPiA+Pgo+ID4+IFF1aXRl
IHBvc3NpYmxlLCBidXQgbm90IGhlcmUgYW5kIG5vdCBub3cuCj4gPiAKPiA+IFN1cmUuCj4gPiAK
PiA+IFJldmlld2VkLWJ5OiBSb2dlciBQYXUgTW9ubsOpIDxyb2dlci5wYXVAY2l0cml4LmNvbT4K
PiAKPiBUaGFua3MuIFRoZXJlIGFyZSB0d28gc21hbGwgY2hhbmdlcyBJIGludGVuZCB0byBkbywg
b25lIGRpcmVjdGx5Cj4gYW5kIG9uZSBpbmRpcmVjdGx5IHJlc3VsdGluZyBmcm9tIFBhdWwncyBm
ZWVkYmFjazogQWxzbyBkcm9wCj4gcnRjX2RlaW5pdCgpIGZyb20gaHZtX2RvbWFpbl9kZXN0cm95
KCkuIEFsc28gZHJvcCBub3cgcG9pbnRsZXNzCj4gaWYoKSBmcm9tIGh2bV9kb21haW5fcmVsaW5x
dWlzaF9yZXNvdXJjZXMoKS4KCkkgYXNzdW1lIHRoaXMgaXMgdGhlIGlmIGNvbmRpdGlvbiBhcm91
bmQgdGhlIHtwbXRpbWVyL2hwZXR9X2RlaW5pdApjYWxscz8KCj4gSSdkIHRoZXJlZm9yZSBsaWtl
Cj4gdG8gYXNrIHlvdSB0byBjb25maXJtIHRoZSBSLWIgY2FuIGJlIGxlZnQgaW4gcGxhY2UsIG9y
IHdoZXRoZXIKPiBpbnN0ZWFkIHlvdSdkIHJhdGhlciB3YWl0IGZvciB2MiB0byBiZSBwb3N0ZWQu
CgpZZXMsIEkgdGhpbmsgeW91IGNhbiBrZWVwIHRoZSBSLWIuCgpSb2dlci4KCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxp
c3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVj
dC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
