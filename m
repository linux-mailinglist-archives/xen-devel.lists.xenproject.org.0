Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A17932A12
	for <lists+xen-devel@lfdr.de>; Mon,  3 Jun 2019 09:53:27 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hXhjy-0000ra-Fh; Mon, 03 Jun 2019 07:50:46 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=TYzS=UC=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hXhjx-0000rV-56
 for xen-devel@lists.xenproject.org; Mon, 03 Jun 2019 07:50:45 +0000
X-Inumbo-ID: 4a04f2c3-85d4-11e9-8980-bc764e045a96
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 4a04f2c3-85d4-11e9-8980-bc764e045a96;
 Mon, 03 Jun 2019 07:50:43 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Mon, 03 Jun 2019 01:50:42 -0600
Message-Id: <5CF4D14E0200007800234689@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.1 
Date: Mon, 03 Jun 2019 01:50:38 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "Andrew Cooper" <andrew.cooper3@citrix.com>
References: <5CF0F8530200007800233DE0@prv1-mh.provo.novell.com>
 <5CF0F9360200007800233E01@prv1-mh.provo.novell.com>
 <6c267398-fd65-1351-e100-8fdebd9986e4@citrix.com>
In-Reply-To: <6c267398-fd65-1351-e100-8fdebd9986e4@citrix.com>
Mime-Version: 1.0
Content-Disposition: inline
Subject: Re: [Xen-devel] [PATCH 1/4] bitops: speed up hweight<N>()
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, WeiLiu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Ian Jackson <Ian.Jackson@eu.citrix.com>, Julien Grall <julien.grall@arm.com>,
 xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Pj4+IE9uIDMxLjA1LjE5IGF0IDIxOjQwLCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gT24gMzEvMDUvMjAxOSAwMjo1MSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+IEFsZ29yaXRo
bWljYWxseSB0aGlzIGdldHMgdXMgaW4gbGluZSB3aXRoIGN1cnJlbnQgTGludXgsIHdoZXJlIHRo
ZSBzYW1lCj4+IGNoYW5nZSBkaWQgaGFwcGVuIGFib3V0IDEzIHllYXJzIGFnby4gU2VlIGluIHBh
cnRpY3VsYXIgTGludXggY29tbWl0cwo+PiBmOWI0MTkyOTIzICgiYml0b3BzOiBod2VpZ2h0KCkg
c3BlZWR1cCIpIGFuZCAwMTM2NjExYzYyICgib3B0aW1pemUKPj4gaHdlaWdodDY0IGZvciB4ODZf
NjQiKS4KPj4KPj4gS2NvbmZpZyBjaGFuZ2VzIGZvciBhY3R1YWxseSBzZXR0aW5nIEhBVkVfRkFT
VF9NVUxUSVBMWSB3aWxsIGZvbGxvdy4KPj4KPj4gVGFrZSB0aGUgb3Bwb3J0dW5pdHkgYW5kIGNo
YW5nZSBnZW5lcmljX2h3ZWlnaHQ2NCgpJ3MgcmV0dXJuIHR5cGUgdG8KPj4gdW5zaWduZWQgaW50
Lgo+Pgo+PiBTdWdnZXN0ZWQtYnk6IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJp
eC5jb20+Cj4+IFNpZ25lZC1vZmYtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4K
PiAKPiBSZXZpZXdlZC1ieTogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNv
bT4KPiAKPiBUaGUgY29kZSBpbiBMaW51eCBjb3VsZCBkbyB3aXRoIGEgYml0IG9mIGNsZWFudXAu
ICBEbyB5b3UgaGF2ZSBwYXRjaGVzCj4gcHJlcGFyZWQ/CgpOb3QgeWV0LCBuby4gSSdsbCB0cnkg
dG8gZG8gdGhpcyBldmVudHVhbGx5LCBidXQgaXQgZG9lc24ndCBoYXZlIGEgcHJpb3JpdHkKZm9y
IG1lLgoKPj4gLS0tIGEveGVuL2luY2x1ZGUveGVuL2JpdG9wcy5oCj4+ICsrKyBiL3hlbi9pbmNs
dWRlL3hlbi9iaXRvcHMuaAo+PiBAQCAtMTUzLDQxICsxNTMsNTQgQEAgc3RhdGljIF9faW5saW5l
X18gaW50IGdldF9jb3VudF9vcmRlcih1bgo+PiAgCj4+ICBzdGF0aWMgaW5saW5lIHVuc2lnbmVk
IGludCBnZW5lcmljX2h3ZWlnaHQzMih1bnNpZ25lZCBpbnQgdykKPj4gIHsKPj4gLSAgICB1bnNp
Z25lZCBpbnQgcmVzID0gKHcgJiAweDU1NTU1NTU1KSArICgodyA+PiAxKSAmIDB4NTU1NTU1NTUp
Owo+PiAtICAgIHJlcyA9IChyZXMgJiAweDMzMzMzMzMzKSArICgocmVzID4+IDIpICYgMHgzMzMz
MzMzMyk7Cj4+IC0gICAgcmVzID0gKHJlcyAmIDB4MEYwRjBGMEYpICsgKChyZXMgPj4gNCkgJiAw
eDBGMEYwRjBGKTsKPj4gLSAgICByZXMgPSAocmVzICYgMHgwMEZGMDBGRikgKyAoKHJlcyA+PiA4
KSAmIDB4MDBGRjAwRkYpOwo+PiAtICAgIHJldHVybiAocmVzICYgMHgwMDAwRkZGRikgKyAoKHJl
cyA+PiAxNikgJiAweDAwMDBGRkZGKTsKPj4gKyAgICB3IC09ICh3ID4+IDEpICYgMHg1NTU1NTU1
NTsKPj4gKyAgICB3ID0gICh3ICYgMHgzMzMzMzMzMykgKyAoKHcgPj4gMikgJiAweDMzMzMzMzMz
KTsKPj4gKyAgICB3ID0gICh3ICsgKHcgPj4gNCkpICYgMHgwZjBmMGYwZjsKPj4gKwo+PiArI2lm
ZGVmIENPTkZJR19IQVNfRkFTVF9NVUxUSVBMWQo+PiArICAgIHJldHVybiAodyAqIDB4MDEwMTAx
MDEpID4+IDI0Owo+PiArI2Vsc2UKPj4gKyAgICB3ICs9IHcgPj4gODsKPj4gKwo+PiArICAgIHJl
dHVybiAodyArICh3ID4+IDE2KSkgJiAweGZmOwo+PiArI2VuZGlmCj4gCj4gVGhpcyB3b3VsZCBi
ZSBzbGlnaHRseSBzaG9ydGVyLCBsZXNzIGxpYWJsZSB0byBiaXRyb3QsIGFuZCBJTU8gY2xlYW5l
ciwKPiB0byBkbwo+IAo+IGlmICggSVNfRU5BQkxFRChDT05GSUdfSEFTX0ZBU1RfTVVMVElQTFkp
ICkKPiAgICAgdyA9IHcgKiAweDAxMDEwMTAxKSA+PiAyNDsKPiBlbHNlCj4gICAgIHcgKz0gdyA+
PiA4Owo+IAo+IHJldHVybiB3Owo+IAo+IHdoaWNoIHJlbW92ZXMgdGhlICNpZmRlZi1hcnkgZnVs
bHksIGFuZCBpbiBwYXJ0aWN1bGFyLCBhdm9pZHMgaGF2aW5nCj4gZGlmZmVyZW50IHJldHVybiBs
b2dpYy4KCkhtbSwgeWVzLCBJIGNhbiBzd2l0Y2ggdG8gc3VjaCBhIG1vZGVsLCBhbGJlaXQgSSB0
aGluayB0aGlzIHdpbGwgbWFrZQpDb3Zlcml0eSBwb2ludCBvdXQgdW5yZWFjaGFibGUgY29kZS4K
CkphbgoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpY
ZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRw
czovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
