Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A59A10AF1E
	for <lists+xen-devel@lfdr.de>; Wed, 27 Nov 2019 12:57:17 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iZvt7-0005uc-W9; Wed, 27 Nov 2019 11:53:41 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=eB6N=ZT=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1iZvt6-0005uX-LS
 for xen-devel@lists.xenproject.org; Wed, 27 Nov 2019 11:53:40 +0000
X-Inumbo-ID: 8cf46056-110c-11ea-9db0-bc764e2007e4
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8cf46056-110c-11ea-9db0-bc764e2007e4;
 Wed, 27 Nov 2019 11:53:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1574855620;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=1m9kTa6sh2EnC05K78NC1lRxIRVA/11+trYpQ1iVOUs=;
 b=In1Y5+eC4CVc5u9ans7O6+GC/VTPtwIknbqvfPsuCdgwase8DeRdKkCW
 9bcF/m1Ssca3/Me7uj7/vmRX93d8cUs2leYjlCEDR4EThzAKehVNEVYNJ
 MiZMy1XGi0Z9JxJQ7CFnQd3V+TbvwqbZlEiaDHpI6hgzYJrRFjbL9zKuu k=;
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
IronPort-SDR: h7qO0mgttP/G86iq7kDQTzzwDMH1ZoJeH7CSB1lux1L8OHlbjUVUHLmDqWlttlMrxtltd+r2lL
 RpY14JI43vIlZ5RASf0tKL1oZqRgIvIxLBU5NqCUkEM9+vSV65i0JMLc2yyVr4xgvHZK0hm/Dr
 uOMVnK22pCthUWhKdXtXPAvbRnmL7pHuxq5hLWZg0LJLwx+lO8jneAoMfvT70apNNwSM9Vd/Hh
 6KKW6Fia4g0r1S8ceol27vuDSHamR6smNSqjInfn70VbIiGDhur4sTekocZGFOx6/SDEzj9Kxt
 3Xg=
X-SBRS: 2.7
X-MesageID: 8894445
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,249,1571716800"; 
   d="scan'208";a="8894445"
Date: Wed, 27 Nov 2019 12:53:31 +0100
From: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Message-ID: <20191127115331.GR980@Air-de-Roger>
References: <20191118101600.94645-1-roger.pau@citrix.com>
 <14ccf9a0-ecb4-6e09-6461-99f989353f34@suse.com>
 <20191118140302.GL72134@Air-de-Roger>
 <3e543cfd-d81a-1a4b-0268-7b121ae23c23@suse.com>
 <20191118145554.GN72134@Air-de-Roger>
 <AADFC41AFE54684AB9EE6CBC0274A5D19D611FB5@SHSMSX104.ccr.corp.intel.com>
 <20191127110332.GN980@Air-de-Roger>
 <8b5eebe0-0f72-7dee-37a7-1b2b94e85e5d@suse.com>
 <20191127112927.GQ980@Air-de-Roger>
 <dad60c23-5b3f-d93a-a512-80705ccd7e32@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <dad60c23-5b3f-d93a-a512-80705ccd7e32@suse.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH for-4.13] x86/vmx: always sync PIR to IRR
 before vmentry
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
Cc: Kevin Tian <kevin.tian@intel.com>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Joe Jin <joe.jin@oracle.com>,
 Jun Nakajima <jun.nakajima@intel.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gV2VkLCBOb3YgMjcsIDIwMTkgYXQgMTI6MzQ6MDlQTSArMDEwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gT24gMjcuMTEuMjAxOSAxMjoyOSwgUm9nZXIgUGF1IE1vbm7DqSAgd3JvdGU6Cj4gPiBP
biBXZWQsIE5vdiAyNywgMjAxOSBhdCAxMjoxNjozN1BNICswMTAwLCBKYW4gQmV1bGljaCB3cm90
ZToKPiA+PiBPbiAyNy4xMS4yMDE5IDEyOjAzLCBSb2dlciBQYXUgTW9ubsOpICB3cm90ZToKPiA+
Pj4gT24gV2VkLCBOb3YgMjcsIDIwMTkgYXQgMDI6MDc6MTZBTSArMDAwMCwgVGlhbiwgS2V2aW4g
d3JvdGU6Cj4gPj4+PiBUaGVuIHdoYXQncyB0aGUgZGlmZmVyZW5jZSBmcm9tIG9yaWdpbmFsIGxv
Z2ljPwo+ID4+Pgo+ID4+PiBUaGUgb3JpZ2luYWwgbG9naWMgaXM6Cj4gPj4+Cj4gPj4+IGlmICgg
cnVubmluZyAmJiAoaW5faXJxKCkgfHwgKHYgIT0gY3VycmVudCkpICkKPiA+Pj4gewo+ID4+PiAg
ICAgICAgIHVuc2lnbmVkIGludCBjcHUgPSB2LT5wcm9jZXNzb3I7Cj4gPj4+Cj4gPj4+ICAgICAg
ICAgaWYgKCBjcHUgIT0gc21wX3Byb2Nlc3Nvcl9pZCgpICkKPiA+Pj4gICAgICAgICAgICAgc2Vu
ZF9JUElfbWFzayhjcHVtYXNrX29mKGNwdSksIHBvc3RlZF9pbnRyX3ZlY3Rvcik7Cj4gPj4+ICAg
ICAgICAgZWxzZSBpZiAoICFzb2Z0aXJxX3BlbmRpbmcoY3B1KSApCj4gPj4+ICAgICAgICAgICAg
IHJhaXNlX3NvZnRpcnEoVkNQVV9LSUNLX1NPRlRJUlEpOwo+ID4+PiB9Cj4gPj4+Cj4gPj4+IFdo
aWNoIEkgZmluZCBtdWNoIGhhcmRlciB0byB1bmRlcnN0YW5kLiBGb3IgZXhhbXBsZSBJJ20gbm90
IHN1cmUgb2YKPiA+Pj4gd2hhdCdzIHRoZSBiZW5lZml0IG9mIGRvaW5nIHRoZSBjcHUgIT0gc21w
X3Byb2Nlc3Nvcl9pZCgpIGNoZWNrCj4gPj4+IGluc3RlYWQgb2Ygc2ltcGx5IGRvaW5nIHYgIT0g
Y3VycmVudCAobGlrZSBpbiB0aGUgb3V0ZXIgaWYgY29uZGl0aW9uKS4KPiA+Pgo+ID4+IFRoZXJl
IGFyZSB0d28gYXNwZWN0cyB0byBjb25zaWRlcjogT25lIGlzIHRoYXQgdi0+cHJvY2Vzc29yCj4g
Pj4gbWF5IGVxdWFsIHNtcF9wcm9jZXNzb3JfaWQoKSBhbHNvIGZvciB2ICE9IGN1cnJlbnQuIFRo
ZSBvdGhlcgo+ID4+IGlzIHRoYXQgd2l0aG91dCB0aGlzIGNoZWNrIGluIHRoZSBpZigpIGl0IHdv
dWxkIG5lZWQgYWRkaW5nCj4gPj4gdG8gdGhlIGVsc2UtaWYoKS4gSSdtIG5vdCBzdXJlIHRvIHdo
YXQgZGVncmVlIHdoaWNoIG9mIHRoZQo+ID4+IHR3byBtYXR0ZXJzIGZ1bmN0aW9uYWxpdHkgd2lz
ZS4KPiA+IAo+ID4gU2luY2UgdGhlIHZDUFUgaXMgcnVubmluZyB2LT5wcm9jZXNzb3IgY2FuIG9u
bHkgZXF1YWwgc21wX3Byb2Nlc3Nvcl9pZAo+ID4gaWYgdiA9PSBjdXJyZW50LAo+IAo+IFdoYXQg
dGVsbHMgeW91IHRoYXQgaXQgaXMgcnVubmluZz8gSXQgaGFkIGJlZW4gcnVubmluZyBhdCB0aGUK
PiB0aW1lIHRoZSBmbGFnIHdhcyBsYXRjaGVkIChiZWZvcmUgdmNwdV91bmJsb2NrKCkpLCBidXQg
bWF5Cj4gaGF2ZSBnb3QgZGUtc2NoZWR1bGVkIGluIHRoZSBtZWFudGltZS4KClJpZ2h0LCBidXQg
aWYgaXQncyBub3QgcnVubmluZyB0aGVuIGl0IGRvZXNuJ3QgcmVhbGx5IG1hdHRlciB0aGF0IHdl
CnNlbmQgYW4gSVBJIG9yIHJhaXNlIGEgc29mdGlycSwgdGhlIFBJUiB0byBJUlIgc3luYyB3aWxs
IGhhcHBlbiBhbnl3YXkKYmVmb3JlIHRoZSB2Q1BVIGlzIHJlc3VtZWQuCgpUaGFua3MsIFJvZ2Vy
LgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRl
dmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9s
aXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
