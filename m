Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BBC752C4A8
	for <lists+xen-devel@lfdr.de>; Tue, 28 May 2019 12:41:33 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hVZUy-0002EA-Rq; Tue, 28 May 2019 10:38:28 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=RBlk=T4=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hVZUw-0002Dw-Tk
 for xen-devel@lists.xenproject.org; Tue, 28 May 2019 10:38:26 +0000
X-Inumbo-ID: b84302ac-8134-11e9-9e59-87aaf8463000
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b84302ac-8134-11e9-9e59-87aaf8463000;
 Tue, 28 May 2019 10:38:24 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Tue, 28 May 2019 04:38:23 -0600
Message-Id: <5CED0F9B0200007800232FEF@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.1 
Date: Tue, 28 May 2019 04:38:19 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "Roger Pau Monne" <roger.pau@citrix.com>
References: <20190510161056.48648-1-roger.pau@citrix.com>
 <20190510161056.48648-4-roger.pau@citrix.com>
 <5CE7C0F30200007800231EEB@prv1-mh.provo.novell.com>
 <20190527164419.oc75p6kmegiv3m7v@Air-de-Roger>
 <5CECF68A0200007800232E9B@prv1-mh.provo.novell.com>
 <20190528100529.apc7rlpdzvgr3vzf@Air-de-Roger>
In-Reply-To: <20190528100529.apc7rlpdzvgr3vzf@Air-de-Roger>
Mime-Version: 1.0
Content-Disposition: inline
Subject: Re: [Xen-devel] [PATCH 3/5] pci: switch pci_conf_{read/write} to
 use pci_sbdf_t
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
Cc: Kevin Tian <kevin.tian@intel.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>,
 Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>,
 xen-devel <xen-devel@lists.xenproject.org>, Brian Woods <brian.woods@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Pj4+IE9uIDI4LjA1LjE5IGF0IDEyOjA1LCA8cm9nZXIucGF1QGNpdHJpeC5jb20+IHdyb3RlOgo+
IE9uIFR1ZSwgTWF5IDI4LCAyMDE5IGF0IDAyOjUxOjIyQU0gLTA2MDAsIEphbiBCZXVsaWNoIHdy
b3RlOgo+PiA+Pj4gT24gMjcuMDUuMTkgYXQgMTg6NDQsIDxyb2dlci5wYXVAY2l0cml4LmNvbT4g
d3JvdGU6Cj4+ID4gT24gRnJpLCBNYXkgMjQsIDIwMTkgYXQgMDQ6MDE6MjNBTSAtMDYwMCwgSmFu
IEJldWxpY2ggd3JvdGU6Cj4+ID4+ID4+PiBPbiAxMC4wNS4xOSBhdCAxODoxMCwgPHJvZ2VyLnBh
dUBjaXRyaXguY29tPiB3cm90ZToKPj4gPj4gPiAtLS0gYS94ZW4vaW5jbHVkZS94ZW4vcGNpLmgK
Pj4gPj4gPiArKysgYi94ZW4vaW5jbHVkZS94ZW4vcGNpLmgKPj4gPj4gPiBAQCAtNTgsNiArNTgs
MTEgQEAgdHlwZWRlZiB1bmlvbiB7Cj4+ID4+ID4gICAgICB9Owo+PiA+PiA+ICB9IHBjaV9zYmRm
X3Q7Cj4+ID4+ID4gIAo+PiA+PiA+ICsjZGVmaW5lIFBDSV9TQkRGX1QocywgYiwgZCwgZikgXAo+
PiA+PiA+ICsgICAgKChwY2lfc2JkZl90KSB7IC5zZWcgPSAocyksIC5idXMgPSAoYiksIC5kZXYg
PSAoZCksIC5mdW5jID0gKGYpIH0pCj4+ID4+IAo+PiA+PiBJJ2QgcHJlZmVyIGlmIHRoZSBfVCBz
dWZmaXggY291bGQgYmUgb21pdHRlZC4gQWZhaWNzIHRoZXJlJ3Mgbm8gdXNlIG9mIHRoZQo+PiA+
PiBleGlzdGluZyBQQ0lfU0JERigpIGFueXdoZXJlIGluIHRoZSB0cmVlLCBzbyB0aGlzIHNob3Vs
ZCBiZSBmaW5lLiBGb3IKPj4gPj4gdGhlIDJuZCBtYWNybyBiZWxvdyBJIGNhbid0IGVhc2lseSB0
ZWxsIHdoZXRoZXIgdGhlIGZldyBleGlzdGluZyB1c2VkCj4+ID4+IGhhdmUgYWxsIGRpc2FwcGVh
cmVkIGJ5IG5vdywgYnV0IGl0IHNlZW1zIGxpa2VseS4KPj4gPiAKPj4gPiBJIGNhbiBzZWUgYWJv
dXQgZHJvcHBpbmcgdGhlIF9UIHN1ZmZpeCwgYnV0IEkgdGhpbmsgdGhlcmUncyBsaWtlbHkKPj4g
PiBzb21lIG92ZXJsYXAgYmV0d2VlbiB0aGUgaW50cm9kdWN0aW9uIG9mIFBDSV9TQkRGX1QgYW5k
IHRoZSBsYXN0IHVzZXIKPj4gPiBvZiB0aGUgY3VycmVudCBQQ0lfU0JERiBoZWxwZXJzLCBzbyBt
YXliZSBpdCdzIGZpbmUgdG8gdXNlIHRoZSBfVAo+PiA+IHN1ZmZpeCBhdCBmaXJzdCBhbmQgaGF2
ZSBvbmUgZmluYWwgcGF0Y2ggdGhhdCByZW1vdmVzIGl0Pwo+PiAKPj4gVGhhdCB3b3VsZCBiZSBh
biBvcHRpb24gaWYgaXQgY2FuJ3QgYmUgZG9uZSBpbiBvbmUgZ28sIHN1cmUuCj4+IAo+PiA+PiBB
bHNvIEknbSBhZnJhaWQgaW5pdGlhbGl6ZXJzIG9mIHRoaXMga2luZCB3aWxsIGJyZWFrIHRoZSBi
dWlsZCB3aXRoIG9sZCAKPiBnY2MuCj4+ID4gCj4+ID4gSSB0aG91Z2h0IHdlIGRyb3BwZWQgc3Vw
cG9ydCBmb3Igc3VjaCBvbGQgdmVyc2lvbnMgb2YgZ2NjLCBpcyB0aGF0IG5vdAo+PiA+IHRoZSBj
YXNlPwo+PiAKPj4gTm8geWV0LCBhcyBwZXIgLi9SRUFETUUuCj4gCj4gUmlnaHQsIHNvIHRoZW4g
SSBndWVzcyB0aGUgb25seSBzb2x1dGlvbiB3b3VsZCBiZSB0byB1c2Ugc29tZXRoaW5nCj4gbGlr
ZToKPiAKPiAjZGVmaW5lIFBDSV9TQkRGX1QocywgYiwgZCwgZikgXAo+ICAgICAoKHBjaV9zYmRm
X3QpIHsgLnNiZGYgPSBQQ0lfU0JERihzLGIsZCxmKSB9KQoKSSB0aGluayBzbywgeWVzLgoKPiBB
bmQgc2ltaWxhcmx5IGZvciB0aGUgb3RoZXIgaW5pdGlhbGl6ZXJzLiBJIGd1ZXNzIHRoZW4geW91
IHdvdWxkIGJlCj4gZmluZSB3aXRoIHVzaW5nIHRoZSBfVCBzdWZmaXggZm9yIHRob3NlIGhlbHBl
cnMgYW5kIGtlZXBpbmcgdGhlCj4gY3VycmVudCBvbmVzIGFzLWlzPwoKTm90IHJlYWxseSwgbm8g
LSBJIHdvdWxkIGhvcGUgZm9yIHRoaXMgdG8gYmUgdGhlIG9ubHkgdXNlIG9mClBDSV9TQkRGKCks
IGFuZCBoZW5jZSBJJ2Qgc3RpbGwgbGlrZSB0aGUgX1QgdG8gYmUgZHJvcHBlZCBhbmQgdGhlCmN1
cnJlbnQgbWFjcm8gdG8gYmUgZXhwYW5kZWQgZXhwbGljaXRseS4KCkphbgoKCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBs
aXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2pl
Y3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
