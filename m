Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 177571442B6
	for <lists+xen-devel@lfdr.de>; Tue, 21 Jan 2020 18:01:58 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1itwr2-0007n7-4f; Tue, 21 Jan 2020 16:58:16 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=jgZb=3K=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1itwr0-0007n2-Te
 for xen-devel@lists.xenproject.org; Tue, 21 Jan 2020 16:58:14 +0000
X-Inumbo-ID: 31615274-3c6f-11ea-9fd7-bc764e2007e4
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 31615274-3c6f-11ea-9fd7-bc764e2007e4;
 Tue, 21 Jan 2020 16:58:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1579625886;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=+KZ46+GLd6hudRXkPRZNE0HyLWWc2Uu9mOqQ5NElE3g=;
 b=h8N3ZwRYGghmqXlJuW5MRwvTbUV0wjE94csNwLa8qx5CkE4dWNADNi3I
 j/VFyNTf4i4eIZBbFpJSFhs/jxXReLsAtAINuwdLP/cI+9NN7KC1Q58h/
 XOVUyr0WDgnDpBDWpBFpu3zBz8ozh79ZQwdXAQvENRbv0gQiWApcfcU4c Y=;
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
IronPort-SDR: uGWg/srQFC8FkxmdBf8TV2YpM9LKHuvrzNtwaE3aJ/Lr6yVnAM9vc+QxSaekeg4YI9lg9sv8ep
 vgi17tsbpGlFxoyqS5T2pxcpLMdRBmJhlIQvSvoSlBWr+GEsS7zK5X0/uHMkreTrUswTCmu4vr
 28kIC7CllFbODs6Ylu76hb9MBMMtI4g94DbmYQONBfE3Bsy9ryOnFVYwB0vV6nN8dAVydpPu1W
 tl8EEO+SC7FayCmFQVhqpZ34zrzbQ9dASb/6fQSW8xZ5klsAnDOw6HjBLKyYCPP5we+k4DYKg3
 /s8=
X-SBRS: 2.7
X-MesageID: 11234517
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,346,1574139600"; d="scan'208";a="11234517"
Date: Tue, 21 Jan 2020 16:57:58 +0000
From: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Message-ID: <20200121165758.GK11756@Air-de-Roger>
References: <20200117110811.43321-1-roger.pau@citrix.com>
 <538864f7-f537-be0d-e37b-8f29baf82ee0@suse.com>
 <20200120171840.GF11756@Air-de-Roger>
 <96edb88c-5ae3-22a1-913d-83f76c925270@suse.com>
 <20200121102941.GH11756@Air-de-Roger>
 <624c69b6-9a9d-7719-fdec-1c6e939a9f65@suse.com>
 <20200121155708.GI11756@Air-de-Roger>
 <ddac90c5-2fe5-ba92-d7ab-f258f483521d@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ddac90c5-2fe5-ba92-d7ab-f258f483521d@suse.com>
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL01.citrite.net (10.69.22.125)
Subject: Re: [Xen-devel] [PATCH v2] x86/hvmloader: round up memory BAR size
 to 4K
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
Cc: xen-devel@lists.xenproject.org, Jason Andryuk <jandryuk@gmail.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVHVlLCBKYW4gMjEsIDIwMjAgYXQgMDU6MTU6MjBQTSArMDEwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gT24gMjEuMDEuMjAyMCAxNjo1NywgUm9nZXIgUGF1IE1vbm7DqSB3cm90ZToKPiA+IE9u
IFR1ZSwgSmFuIDIxLCAyMDIwIGF0IDExOjQzOjU4QU0gKzAxMDAsIEphbiBCZXVsaWNoIHdyb3Rl
Ogo+ID4+IE9uIDIxLjAxLjIwMjAgMTE6MjksIFJvZ2VyIFBhdSBNb25uw6kgd3JvdGU6Cj4gPj4+
IFNvIEknbSBub3Qgc3VyZSBob3cgdG8gcHJvZ3Jlc3Mgd2l0aCB0aGlzIHBhdGNoLCBhcmUgd2Ug
ZmluZSB3aXRoCj4gPj4+IHRob3NlIGxpbWl0YXRpb25zPwo+ID4+Cj4gPj4gSSdtIGFmcmFpZCB0
aGlzIGRlcGVuZHMgb24gLi4uCj4gPj4KPiA+Pj4gQXMgSSBzYWlkLCBYZW4gaGFzbid0IGdvdCBl
bm91Z2gga25vd2xlZGdlIHRvIGNvcnJlY3RseSBpc29sYXRlIHRoZQo+ID4+PiBCQVJzLCBhbmQg
aGVuY2Ugd2UgaGF2ZSB0byByZWx5IG9uIGRvbTAgRFRSVC4gV2UgY291bGQgYWRkIGNoZWNrcyBp
bgo+ID4+PiBYZW4gdG8gbWFrZSBzdXJlIG5vIEJBUnMgc2hhcmUgYSBwYWdlLCBidXQgaXQncyBh
IG5vbi10cml2aWFsIGFtb3VudAo+ID4+PiBvZiBzY2FubmluZyBhbmQgc2l6aW5nIGVhY2ggcG9z
c2libGUgQkFSIG9uIHRoZSBzeXN0ZW0uCj4gPj4KPiA+PiAuLi4gd2hldGhlciBEb20wIGFjdHVh
bGx5ICJEVFJUIiwgd2hpY2ggaW4gdHVybiBpcyBjb21wbGljYXRlZCBieSB0aGVyZQo+ID4+IG5v
dCBiZWluZyBhIHNwZWNpZmljIERvbTAga2VybmVsIGluY2FybmF0aW9uIHRvIGNoZWNrIGFnYWlu
c3QuIFBlcmhhcHMKPiA+PiByYXRoZXIgdGhhbiBoYXZpbmcgWGVuIGNoZWNrIF9hbGxfIEJBUnMs
IFhlbiBvciB0aGUgdG9vbCBzdGFjayBjb3VsZAo+ID4+IGNoZWNrIEJBUnMgb2YgZGV2aWNlcyBh
Ym91dCB0byBiZSBoYW5kZWQgdG8gYSBndWVzdD8gUGVyaGFwcyB3ZSBuZWVkIHRvCj4gPj4gcGFz
cyBhdXhpbGlhcnkgaW5mb3JtYXRpb24gdG8gaHZtbG9hZGVyIHRvIGJlIGFibGUgdG8ganVkZ2Ug
d2hldGhlciBhCj4gPj4gQkFSIHNoYXJlcyBhIHBhZ2Ugd2l0aCBhbm90aGVyIG9uZT8gUGVyaGFw
cyB0aGVyZSBhbHNvIG5lZWRzIHRvIGJlIGEKPiA+PiB3YXkgZm9yIGh2bWxvYWRlciB0byBrbm93
IHdoYXQgb2Zmc2V0IGludG8gYSBwYWdlIGhhcyB0byBiZSBtYWludGFpbmVkCj4gPj4gZm9yIGFu
eSBwYXJ0aWN1bGFyIEJBUiwgYXMgZm9sbG93cyBmcm9tIEphc29uJ3MgcmVjZW50IHJlcGx5Pwo+
ID4gCj4gPiBMaW51eCBoYXMgYW4gb3B0aW9uIHRvIGZvcmNlIHJlc291cmNlIGFsaWdubWVudCAo
YXMgcmVwb3J0ZWQgYnkKPiA+IEphc29uKSwgbWF5YmUgd2UgY291bGQgZm9yY2UgYWxsIEJBUnMg
dG8gYmUgYWxpZ25lZCB0byBwYWdlIHNpemUgaW4KPiA+IG9yZGVyIHRvIGJlIHBhc3NlZCB0aHJv
dWdoPwo+ID4gCj4gPiBUaGF0IHdvdWxkIG1ha2UgaXQgZWFzaWVyIHRvIGNoZWNrIChhcyBYZW4v
UWVtdSB3b3VsZCBvbmx5IG5lZWQgdG8KPiA+IGFzc2VydCB0aGF0IHRoZSBCQVIgYWRkcmVzcyBp
cyBhbGlnbmVkKSwgYW5kIHdvbid0IHJlcXVpcmUgbXVjaCBleHRyYQo+ID4gd29yayBpbiBYZW4g
YXBhcnQgZnJvbSB0aGUgY2hlY2sgaXRzZWxmLgo+ID4gCj4gPiBEbyB5b3UgdGhpbmsgdGhpcyB3
b3VsZCBiZSBhbiBhY2NlcHRhYmxlIHNvbHV0aW9uPwo+IAo+IEluIHByaW5jaXBsZSB5ZXMsIGJ1
dCB0aGVyZSBhcmUgbG9vc2UgZW5kczoKPiAtIFdoYXQgZG8geW91IG1lYW4gYnkgIndlIGNvdWxk
IGZvcmNlIj8gV2UgaGF2ZSBubyBjb250cm9sIG92ZXIgdGhlCj4gICBEb20wIGtlcm5lbC4KCkkg
c2hvdWxkIHJlcGhyYXNlOgoKLi4uIG1heWJlIHdlIHNob3VsZCByZXF1aXJlIGRvbTAgdG8gYWxp
Z24gYWxsIG1lbW9yeSBCQVJzIHRvIHBhZ2Ugc2l6ZQppbiBvcmRlciB0byBiZSBwYXNzZWQgdGhy
b3VnaD8KCkllOiBYZW4gc2hvdWxkIHJlZnVzZSB0byBwYXNzIHRocm91Z2ggYW55IG1lbW9yeSBC
QVIgdGhhdCdzIG5vdCBwYWdlCmFsaWduZWQuIEhvdyB0aGUgYWxpZ25tZW50IGlzIGFjY29tcGxp
c2hlZCBpcyBvdXQgb2YgdGhlIHNjb3BlIHRvIFhlbiwKYXMgbG9uZyBhcyBtZW1vcnkgQkFScyBh
cmUgYWxpZ25lZC4KCj4gLSBXaGF0IGFib3V0IG5vbi1MaW51eCBEb20wPwoKT3RoZXIgT1NlcyB3
b3VsZCBoYXZlIHRvIHByb3ZpZGUgc2ltaWxhciBmdW5jdGlvbmFsaXR5IGluIG9yZGVyIHRvCmFs
aWduIHRoZSBtZW1vcnkgQkFScy4gUmlnaHQgbm93IExpbnV4IGlzIHRoZSBvbmx5IGRvbTAgdGhh
dCBzdXBwb3J0cwpQQ0kgcGFzc3Rocm91Z2ggQUZBSUsuCgo+IEFsc28sIGFwYXJ0IGZyb20gZXh0
cmEgcmVzb3VyY2UgKGFkZHJlc3Mgc3BhY2UpIGNvbnN1bXB0aW9uLAoKVGhlIFBDSSBzcGVjIGFj
dHVhbGx5IHJlY29tbWVuZHMgbWVtb3J5IEJBUnMgdG8gYmUgYXQgbGVhc3Qgb2YgcGFnZQpzaXpl
LCBidXQgdGhhdCdzIG5vdCBhIHN0cmljdCByZXF1aXJlbWVudC4gSSB3b3VsZCBob3BlIHRoZXJl
IGFyZW4ndAp0aGF0IG1hbnkgZGV2aWNlcyB3aXRoIG1lbW9yeSBCQVJzIHNtYWxsZXIgdGhhbiBh
IHBhZ2UuCgo+IHdoYXQncwo+IHRoZSBwb2ludCBvZiBmb3JjaW5nIGEgc2luZ2xlIGRldmljZSdz
IEJBUnMgdG8gc2VwYXJhdGUgcGFnZXM/CgpNYWtlcyB0aGUgcGxhY2VtZW50IGxvZ2ljIGluIGh2
bWxvYWRlciBlYXNpZXIgSU1PLCBhbmQgSSBkb24ndCB0aGluawp0aGF0IHdvdWxkIGJlIHN1Y2gg
YSB3YXN0ZSBvZiBzcGFjZSBzaW5jZSBJIGV4cGVjdCBtb3N0IGRldmljZXMgd2lsbApmb2xsb3cg
dGhlIFBDSSBzcGVjIHJlY29tbWVuZGF0aW9uIGFuZCByb3VuZCB1cCBtZW1vcnkgQkFSIHNpemVz
IHRvIGEKcGFnZSBzaXplLgoKPiAoSSdtCj4gYXNzdW1pbmcgaGVyZSB0aGF0IGh2bWxvYWRlciB3
b3VsZCBoYXZlIGEgd2F5IHRvIGtub3cgb2YgdGhlCj4gcG90ZW50aWFsbHkgcmVzdWx0aW5nIG5v
bi16ZXJvIG9mZnNldHMgaW50byBhIHBhZ2UuIEFuZCBJJ20gc3RpbGwKPiBwdXp6bGVkIHRoYXQg
dGhlIGxhY2sgdGhlcmVvZiBoYXNuJ3QgYmVlbiByZXBvcnRlZCBhcyBhIGJ1ZyBieQo+IGFueW9u
ZSwgYWZhaWsuKQoKQXMgc2FpZCBhYm92ZSBJIHdvdWxkIGxpa2UgdG8gdGhpbmsgdGhhdCBtb3N0
IGRldmljZXMgaGF2ZSBtZW1vcnkgQkFScwphdCBsZWFzdCBvZiBwYWdlIHNpemUsIGFzIHJlY29t
bWVuZGVkIGJ5IHRoZSBQQ0kgc3BlYywgYW5kIGhlbmNlCnRoYXQncyB3aHkgd2UgaGF2ZW4ndCBn
b3QgYW55IHJlcG9ydHMgc28gZmFyLgoKVGhhbmtzLCBSb2dlci4KCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVu
LWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcv
bWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
