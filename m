Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9236D145327
	for <lists+xen-devel@lfdr.de>; Wed, 22 Jan 2020 11:55:32 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iuDcQ-0004Rg-EH; Wed, 22 Jan 2020 10:52:18 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=e0WY=3L=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1iuDcO-0004Rb-Mh
 for xen-devel@lists.xenproject.org; Wed, 22 Jan 2020 10:52:16 +0000
X-Inumbo-ID: 3f819f13-3d05-11ea-bc1c-12813bfff9fa
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 3f819f13-3d05-11ea-bc1c-12813bfff9fa;
 Wed, 22 Jan 2020 10:52:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1579690336;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=3K0AOz1/zIXbnEnMxO7ZXzxvM3H8DJTPKD8xCRwn1CI=;
 b=U7eIpV6IXptl/8bOaanjfFZgJ/8t84QQgAtXLHWWzIVmRx8xf7gp3m90
 MLqk5c5vf81i4auVfePp0wUnppO+Q6FJCOiadW9uUCxMI2WYob28LeP8w
 SUbZ4id+BCpk+TY1jX3bGUIlrLayyH+EC+pzEBXD/WCbwmwa32kaSuVI0 Y=;
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
IronPort-SDR: 74wF540AAKGXK5AcGumeQboSQPIVtDc8zySGAi03UDBZ8W4MSidSoPedo+/NlJ/d+Wv+Q3dyI4
 sDk4rPhi+ch1SHjzUG9dMKrMBrnhMeYKq+kygjzYqFk3JmLG9SCpsaQC9+oCcEKiteVd6NOl7Q
 vQustX12I00MiqDseHjsqAGkDmep39lRMwloUfmF064NO1LsQc57JtNWWrYH/MFBzvW/vtypuY
 mEKBwVqNM0RtSm6msI0HlAn3+d9mxia8RXixli36tgAQ3MHXdMDE2Eo6QB2sMQmJ+J3I+62xeY
 GWs=
X-SBRS: 2.7
X-MesageID: 11250037
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,349,1574139600"; d="scan'208";a="11250037"
Date: Wed, 22 Jan 2020 10:51:55 +0000
From: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>, Jason Andryuk <jandryuk@gmail.com>
Message-ID: <20200122105155.GA57924@desktop-tdan49n.eng.citrite.net>
References: <20200117110811.43321-1-roger.pau@citrix.com>
 <538864f7-f537-be0d-e37b-8f29baf82ee0@suse.com>
 <20200120171840.GF11756@Air-de-Roger>
 <96edb88c-5ae3-22a1-913d-83f76c925270@suse.com>
 <20200121102941.GH11756@Air-de-Roger>
 <624c69b6-9a9d-7719-fdec-1c6e939a9f65@suse.com>
 <20200121155708.GI11756@Air-de-Roger>
 <ddac90c5-2fe5-ba92-d7ab-f258f483521d@suse.com>
 <20200121165758.GK11756@Air-de-Roger>
 <73a7af47-bcf6-50f9-8901-e8c2da2ac908@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <73a7af47-bcf6-50f9-8901-e8c2da2ac908@suse.com>
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
Cc: xen-devel@lists.xenproject.org, Ian Jackson <ian.jackson@eu.citrix.com>,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gV2VkLCBKYW4gMjIsIDIwMjAgYXQgMTE6Mjc6MjRBTSArMDEwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gT24gMjEuMDEuMjAyMCAxNzo1NywgUm9nZXIgUGF1IE1vbm7DqSB3cm90ZToKPiA+IE9u
IFR1ZSwgSmFuIDIxLCAyMDIwIGF0IDA1OjE1OjIwUE0gKzAxMDAsIEphbiBCZXVsaWNoIHdyb3Rl
Ogo+ID4+IE9uIDIxLjAxLjIwMjAgMTY6NTcsIFJvZ2VyIFBhdSBNb25uw6kgd3JvdGU6Cj4gPj4+
IE9uIFR1ZSwgSmFuIDIxLCAyMDIwIGF0IDExOjQzOjU4QU0gKzAxMDAsIEphbiBCZXVsaWNoIHdy
b3RlOgo+ID4+Pj4gT24gMjEuMDEuMjAyMCAxMToyOSwgUm9nZXIgUGF1IE1vbm7DqSB3cm90ZToK
PiA+Pj4+PiBTbyBJJ20gbm90IHN1cmUgaG93IHRvIHByb2dyZXNzIHdpdGggdGhpcyBwYXRjaCwg
YXJlIHdlIGZpbmUgd2l0aAo+ID4+Pj4+IHRob3NlIGxpbWl0YXRpb25zPwo+ID4+Pj4KPiA+Pj4+
IEknbSBhZnJhaWQgdGhpcyBkZXBlbmRzIG9uIC4uLgo+ID4+Pj4KPiA+Pj4+PiBBcyBJIHNhaWQs
IFhlbiBoYXNuJ3QgZ290IGVub3VnaCBrbm93bGVkZ2UgdG8gY29ycmVjdGx5IGlzb2xhdGUgdGhl
Cj4gPj4+Pj4gQkFScywgYW5kIGhlbmNlIHdlIGhhdmUgdG8gcmVseSBvbiBkb20wIERUUlQuIFdl
IGNvdWxkIGFkZCBjaGVja3MgaW4KPiA+Pj4+PiBYZW4gdG8gbWFrZSBzdXJlIG5vIEJBUnMgc2hh
cmUgYSBwYWdlLCBidXQgaXQncyBhIG5vbi10cml2aWFsIGFtb3VudAo+ID4+Pj4+IG9mIHNjYW5u
aW5nIGFuZCBzaXppbmcgZWFjaCBwb3NzaWJsZSBCQVIgb24gdGhlIHN5c3RlbS4KPiA+Pj4+Cj4g
Pj4+PiAuLi4gd2hldGhlciBEb20wIGFjdHVhbGx5ICJEVFJUIiwgd2hpY2ggaW4gdHVybiBpcyBj
b21wbGljYXRlZCBieSB0aGVyZQo+ID4+Pj4gbm90IGJlaW5nIGEgc3BlY2lmaWMgRG9tMCBrZXJu
ZWwgaW5jYXJuYXRpb24gdG8gY2hlY2sgYWdhaW5zdC4gUGVyaGFwcwo+ID4+Pj4gcmF0aGVyIHRo
YW4gaGF2aW5nIFhlbiBjaGVjayBfYWxsXyBCQVJzLCBYZW4gb3IgdGhlIHRvb2wgc3RhY2sgY291
bGQKPiA+Pj4+IGNoZWNrIEJBUnMgb2YgZGV2aWNlcyBhYm91dCB0byBiZSBoYW5kZWQgdG8gYSBn
dWVzdD8gUGVyaGFwcyB3ZSBuZWVkIHRvCj4gPj4+PiBwYXNzIGF1eGlsaWFyeSBpbmZvcm1hdGlv
biB0byBodm1sb2FkZXIgdG8gYmUgYWJsZSB0byBqdWRnZSB3aGV0aGVyIGEKPiA+Pj4+IEJBUiBz
aGFyZXMgYSBwYWdlIHdpdGggYW5vdGhlciBvbmU/IFBlcmhhcHMgdGhlcmUgYWxzbyBuZWVkcyB0
byBiZSBhCj4gPj4+PiB3YXkgZm9yIGh2bWxvYWRlciB0byBrbm93IHdoYXQgb2Zmc2V0IGludG8g
YSBwYWdlIGhhcyB0byBiZSBtYWludGFpbmVkCj4gPj4+PiBmb3IgYW55IHBhcnRpY3VsYXIgQkFS
LCBhcyBmb2xsb3dzIGZyb20gSmFzb24ncyByZWNlbnQgcmVwbHk/Cj4gPj4+Cj4gPj4+IExpbnV4
IGhhcyBhbiBvcHRpb24gdG8gZm9yY2UgcmVzb3VyY2UgYWxpZ25tZW50IChhcyByZXBvcnRlZCBi
eQo+ID4+PiBKYXNvbiksIG1heWJlIHdlIGNvdWxkIGZvcmNlIGFsbCBCQVJzIHRvIGJlIGFsaWdu
ZWQgdG8gcGFnZSBzaXplIGluCj4gPj4+IG9yZGVyIHRvIGJlIHBhc3NlZCB0aHJvdWdoPwo+ID4+
Pgo+ID4+PiBUaGF0IHdvdWxkIG1ha2UgaXQgZWFzaWVyIHRvIGNoZWNrIChhcyBYZW4vUWVtdSB3
b3VsZCBvbmx5IG5lZWQgdG8KPiA+Pj4gYXNzZXJ0IHRoYXQgdGhlIEJBUiBhZGRyZXNzIGlzIGFs
aWduZWQpLCBhbmQgd29uJ3QgcmVxdWlyZSBtdWNoIGV4dHJhCj4gPj4+IHdvcmsgaW4gWGVuIGFw
YXJ0IGZyb20gdGhlIGNoZWNrIGl0c2VsZi4KPiA+Pj4KPiA+Pj4gRG8geW91IHRoaW5rIHRoaXMg
d291bGQgYmUgYW4gYWNjZXB0YWJsZSBzb2x1dGlvbj8KPiA+Pgo+ID4+IEluIHByaW5jaXBsZSB5
ZXMsIGJ1dCB0aGVyZSBhcmUgbG9vc2UgZW5kczoKPiA+PiAtIFdoYXQgZG8geW91IG1lYW4gYnkg
IndlIGNvdWxkIGZvcmNlIj8gV2UgaGF2ZSBubyBjb250cm9sIG92ZXIgdGhlCj4gPj4gICBEb20w
IGtlcm5lbC4KPiA+IAo+ID4gSSBzaG91bGQgcmVwaHJhc2U6Cj4gPiAKPiA+IC4uLiBtYXliZSB3
ZSBzaG91bGQgcmVxdWlyZSBkb20wIHRvIGFsaWduIGFsbCBtZW1vcnkgQkFScyB0byBwYWdlIHNp
emUKPiA+IGluIG9yZGVyIHRvIGJlIHBhc3NlZCB0aHJvdWdoPwo+ID4gCj4gPiBJZTogWGVuIHNo
b3VsZCByZWZ1c2UgdG8gcGFzcyB0aHJvdWdoIGFueSBtZW1vcnkgQkFSIHRoYXQncyBub3QgcGFn
ZQo+ID4gYWxpZ25lZC4gSG93IHRoZSBhbGlnbm1lbnQgaXMgYWNjb21wbGlzaGVkIGlzIG91dCBv
ZiB0aGUgc2NvcGUgdG8gWGVuLAo+ID4gYXMgbG9uZyBhcyBtZW1vcnkgQkFScyBhcmUgYWxpZ25l
ZC4KPiAKPiBUaGF0J3MgYW4gYWNjZXB0YWJsZSBtb2RlbCwgYXMgbG9uZyBhcyBpdCB3b3VsZG4n
dCB0eXBpY2FsbHkgYnJlYWsKPiBleGlzdGluZyBjb25maWd1cmF0aW9ucywgYW5kIGFzIGxvbmcg
YXMgZm9yIHRob3NlIHdobyB3ZSB3b3VsZAo+IGJyZWFrIHRoZXJlIGFyZSBlYXN5IHRvIGZvbGxv
dyBzdGVwcyB0byB1bmJyZWFrIHRoZWlyIHNldHVwcy4KCkphc29uLCBkbyB5b3UgdGhpbmsgeW91
IGNvdWxkIHRha2UgYSBzdGFiIGF0IGFkZGluZyBhIGNoZWNrIGluIG9yZGVyCnRvIG1ha2Ugc3Vy
ZSBtZW1vcnkgQkFSIGFkZHJlc3NlcyBhcmUgNEsgYWxpZ25lZCB3aGVuIGFzc2lnbmluZyBhCmRl
dmljZSB0byBhIGd1ZXN0PwoKPiA+PiAtIFdoYXQgYWJvdXQgbm9uLUxpbnV4IERvbTA/Cj4gPiAK
PiA+IE90aGVyIE9TZXMgd291bGQgaGF2ZSB0byBwcm92aWRlIHNpbWlsYXIgZnVuY3Rpb25hbGl0
eSBpbiBvcmRlciB0bwo+ID4gYWxpZ24gdGhlIG1lbW9yeSBCQVJzLiBSaWdodCBub3cgTGludXgg
aXMgdGhlIG9ubHkgZG9tMCB0aGF0IHN1cHBvcnRzCj4gPiBQQ0kgcGFzc3Rocm91Z2ggQUZBSUsu
Cj4gPiAKPiA+PiBBbHNvLCBhcGFydCBmcm9tIGV4dHJhIHJlc291cmNlIChhZGRyZXNzIHNwYWNl
KSBjb25zdW1wdGlvbiwKPiA+IAo+ID4gVGhlIFBDSSBzcGVjIGFjdHVhbGx5IHJlY29tbWVuZHMg
bWVtb3J5IEJBUnMgdG8gYmUgYXQgbGVhc3Qgb2YgcGFnZQo+ID4gc2l6ZSwgYnV0IHRoYXQncyBu
b3QgYSBzdHJpY3QgcmVxdWlyZW1lbnQuIEkgd291bGQgaG9wZSB0aGVyZSBhcmVuJ3QKPiA+IHRo
YXQgbWFueSBkZXZpY2VzIHdpdGggbWVtb3J5IEJBUnMgc21hbGxlciB0aGFuIGEgcGFnZS4KPiAK
PiBJJ3ZlIHNpbXBseSBnb25lIGFuZCBncmVwLWVkIGFsbCB0aGUgc3RvcmVkIGxzcGNpIG91dHB1
dCBJIGhhdmUKPiBmb3Igc29tZSBvZiB0aGUgdGVzdCBzeXN0ZW1zIEkgaGF2ZSBoZXJlOgo+IAo+
IDAvMTIKPiAzLzMxIChhbGwgNGstYWxpZ25lZCkKPiA2LzEzIChhbGwgNGstYWxpZ25lZCkKPiAz
LzEyCj4gNi8xOSAoYWxsIDRrLWFsaWduZWQpCj4gMy83IChhbGwgNGstYWxpZ25lZCkKCldoYXQg
ZG9lcyBYL1kgYXQgdGhlIGJlZ2lubmluZyBvZiB0aGUgbGluZSBzdGFuZCBmb3I/Cgo+IFRoaXMg
aXMgd2l0aG91dCByZWdhcmQgdG8gd2hhdCBzcGVjaWZpYyBkZXZpY2VzIHRoZXNlIGFyZSwgYW5k
Cj4gaGVuY2Ugd2hldGhlciB0aGVyZSB3b3VsZCBiZSBhbnkgcG9pbnQgaW4gd2FudGluZyB0byBw
YXNzIGl0IHRvCj4gYSBndWVzdCBpbiB0aGUgZmlyc3QgcGxhY2UuIEknZCBsaWtlIHRvIG5vdGUg
dGhvdWdoIHRoYXQgdGhlcmUKPiBhcmUgYSBmYWlyIGFtb3VudCBvZiBVU0IgY29udHJvbGxlcnMg
YW1vbmcgdGhlIG9uZXMgd2l0aCBCQVJzCj4gc21hbGxlciB0aGFuIGEgcGFnZSdzIHdvcnRoLgo+
IAo+ID4+IHdoYXQncwo+ID4+IHRoZSBwb2ludCBvZiBmb3JjaW5nIGEgc2luZ2xlIGRldmljZSdz
IEJBUnMgdG8gc2VwYXJhdGUgcGFnZXM/Cj4gPiAKPiA+IE1ha2VzIHRoZSBwbGFjZW1lbnQgbG9n
aWMgaW4gaHZtbG9hZGVyIGVhc2llciBJTU8sIGFuZCBJIGRvbid0IHRoaW5rCj4gPiB0aGF0IHdv
dWxkIGJlIHN1Y2ggYSB3YXN0ZSBvZiBzcGFjZSBzaW5jZSBJIGV4cGVjdCBtb3N0IGRldmljZXMg
d2lsbAo+ID4gZm9sbG93IHRoZSBQQ0kgc3BlYyByZWNvbW1lbmRhdGlvbiBhbmQgcm91bmQgdXAg
bWVtb3J5IEJBUiBzaXplcyB0byBhCj4gPiBwYWdlIHNpemUuCj4gCj4gRXNwZWNpYWxseSBmb3Ig
ZGV2aWNlcyB3aXRoIHZlcnkgbGl0dGxlIHNwYWNlIG5lZWRlZCAoc2VyaWFsCj4gY2FyZHMgd2l0
aCBvbmUgcG9ydCBwZXIgQkFSLCBmb3IgZXhhbXBsZSkgdGhlIHdhc3RlIG1heSBiZQo+IG5vdGlj
ZWFibGUuCgpCdXQgeW91IGNhbiBvbmx5IGhhdmUgNiBCQVJzIHBlciBkZXZpY2UsIHNvIHVubGVz
cyB5b3UgaGF2ZSBhIGh1Z2UKYW1vdW50IG9mIFVTQiBvciBzZXJpYWwgY2FyZHMgKGFzIHRoZXkg
dGVuZCB0byBiZSB0aGUgb25lcyB3aXRoCm1lbW9yeSBCQVJzIDwgNEspIGl0IHNob3VsZG4ndCBi
ZSB3b3JyeWluZyBJTU8uCgo+ID4+IChJJ20KPiA+PiBhc3N1bWluZyBoZXJlIHRoYXQgaHZtbG9h
ZGVyIHdvdWxkIGhhdmUgYSB3YXkgdG8ga25vdyBvZiB0aGUKPiA+PiBwb3RlbnRpYWxseSByZXN1
bHRpbmcgbm9uLXplcm8gb2Zmc2V0cyBpbnRvIGEgcGFnZS4gQW5kIEknbSBzdGlsbAo+ID4+IHB1
enpsZWQgdGhhdCB0aGUgbGFjayB0aGVyZW9mIGhhc24ndCBiZWVuIHJlcG9ydGVkIGFzIGEgYnVn
IGJ5Cj4gPj4gYW55b25lLCBhZmFpay4pCj4gPiAKPiA+IEFzIHNhaWQgYWJvdmUgSSB3b3VsZCBs
aWtlIHRvIHRoaW5rIHRoYXQgbW9zdCBkZXZpY2VzIGhhdmUgbWVtb3J5IEJBUnMKPiA+IGF0IGxl
YXN0IG9mIHBhZ2Ugc2l6ZSwgYXMgcmVjb21tZW5kZWQgYnkgdGhlIFBDSSBzcGVjLCBhbmQgaGVu
Y2UKPiA+IHRoYXQncyB3aHkgd2UgaGF2ZW4ndCBnb3QgYW55IHJlcG9ydHMgc28gZmFyLgo+IAo+
IEknbSBjdXJpb3VzIGFib3V0IHRoaXMgcmVjb21tZW5kYXRpb24sIGFzIHdoYXQgc2l6ZSBhIHBh
Z2UgaXMKPiB2YXJpZXMgYWNyb3NzIENQVSBhcmNoaXRlY3R1cmVzLCBhbmQgUENJIGRldmljZXMg
c2hvdWxkbid0Cj4gdHlwaWNhbGx5IGJlIHRpZWQgdG8gc3BlY2lmaWMgQ1BVcyAodW5sZXNzIG9m
IGNvdXJzZSB0aGV5IGNvbWUKPiBhcyBwYXJ0IG9mIG9uZXMsIGJ1dCBzdWNoIGRldmljZXMgYXJl
IHJhcmVseSBvbmVzIHlvdSBtYXkgd2FudAo+IHRvIGhhbmQgdG8gYSBndWVzdCkuIElzIHRoZXJl
IHJlYWxseSBhIHJlY29tbWVuZGF0aW9uIHRvd2FyZHMKPiBCQVIgc2l6ZSwgbm90IHRvd2FyZHMg
QkFSIHBsYWNlbWVudD8KClRoaXMgaXMgZnJvbSB0aGUgUENJIGxvY2FsIGJ1cyBzcGVjaWZpY2F0
aW9uIDMuMCwgc2VjdGlvbiA2LjIuNS4xLgoKIlRoaXMgZGVzaWduIGltcGxpZXMgdGhhdCBhbGwg
YWRkcmVzcyBzcGFjZXMgdXNlZCBhcmUgYSBwb3dlciBvZiB0d28KaW4gc2l6ZSBhbmQgYXJlIG5h
dHVyYWxseSBhbGlnbmVkLiBEZXZpY2VzIGFyZSBmcmVlIHRvIGNvbnN1bWUgbW9yZQphZGRyZXNz
IHNwYWNlIHRoYW4gcmVxdWlyZWQsIGJ1dCBkZWNvZGluZyBkb3duIHRvIGEgNCBLQiBzcGFjZSBm
b3IKbWVtb3J5IGlzIHN1Z2dlc3RlZCBmb3IgZGV2aWNlcyB0aGF0IG5lZWQgbGVzcyB0aGFuIHRo
YXQgYW1vdW50LiBGb3IKaW5zdGFuY2UsIGEgZGV2aWNlIHRoYXQgaGFzIDY0IGJ5dGVzIG9mIHJl
Z2lzdGVycyB0byBiZSBtYXBwZWQgaW50bwpNZW1vcnkgU3BhY2UgbWF5IGNvbnN1bWUgdXAgdG8g
NCBLQiBvZiBhZGRyZXNzIHNwYWNlIGluIG9yZGVyIHRvCm1pbmltaXplIHRoZSBudW1iZXIgb2Yg
Yml0cyBpbiB0aGUgYWRkcmVzcyBkZWNvZGVyLiIKClNvIHdoaWxlIHRoZSByZWFzb25pbmcgaXMg
bm90IHJlbGF0ZWQgdG8gaXNvbGF0aW9uLCBpdCdzIGEKcmVjb21tZW5kYXRpb24gb2YgdGhlIHNw
ZWMuIEkgc2hvdWxkIGhhdmUgdXNlZCA0SyBpbnN0ZWFkIG9mIHBhZ2Ugc2l6ZQppbiB0aGUgcHJl
dmlvdXMgcmVwbGllcywgYXMgeW91IHNheSB0aGUgc3BlYyBpcyBub3QgdGllZCB0byBhbgphcmNo
aXRlY3R1cmUsIGFuZCBoZW5jZSB1c2luZyBwYWdlIHNpemUgaW4gbXkgcHJldmlvdXMgcmVwbGll
cyB3YXMKd3JvbmcuCgpUaGFua3MsIFJvZ2VyLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlz
dHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL3hlbi1kZXZlbA==
