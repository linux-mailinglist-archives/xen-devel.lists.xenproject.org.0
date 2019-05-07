Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 585161636A
	for <lists+xen-devel@lfdr.de>; Tue,  7 May 2019 14:05:16 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hNyoU-0005ta-0U; Tue, 07 May 2019 12:03:14 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=VLhp=TH=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hNyoR-0005tS-S2
 for xen-devel@lists.xenproject.org; Tue, 07 May 2019 12:03:11 +0000
X-Inumbo-ID: 14e26918-70c0-11e9-843c-bc764e045a96
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 14e26918-70c0-11e9-843c-bc764e045a96;
 Tue, 07 May 2019 12:03:10 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Tue, 07 May 2019 06:03:09 -0600
Message-Id: <5CD173F6020000780022C7E0@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.0 
Date: Tue, 07 May 2019 06:03:02 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: <aisaila@bitdefender.com>
References: <20190206125314.10869-1-aisaila@bitdefender.com>
 <20190206125314.10869-2-aisaila@bitdefender.com>
 <5CAB69AB0200007800225785@prv1-mh.provo.novell.com>
 <2cf1aac9-5ddf-f1c1-9520-ed5f14544b53@bitdefender.com>
In-Reply-To: <2cf1aac9-5ddf-f1c1-9520-ed5f14544b53@bitdefender.com>
Mime-Version: 1.0
Content-Disposition: inline
Subject: Re: [Xen-devel] [PATCH RFC v3 2/2] x86/emulate: Send vm_event from
 emulate
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
Cc: Tamas K Lengyel <tamas@tklengyel.com>, Wei Liu <wei.liu2@citrix.com>,
 Razvan Cojocaru <rcojocaru@bitdefender.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Paul Durrant <paul.durrant@citrix.com>,
 xen-devel <xen-devel@lists.xenproject.org>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Pj4+IE9uIDA3LjA1LjE5IGF0IDEzOjQ1LCA8YWlzYWlsYUBiaXRkZWZlbmRlci5jb20+IHdyb3Rl
Ogo+IE9uIDA4LjA0LjIwMTkgMTg6MzIsIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+PiBPbiAwNi4w
Mi4xOSBhdCAxMzo1MywgPGFpc2FpbGFAYml0ZGVmZW5kZXIuY29tPiB3cm90ZToKPj4+IEZpcnN0
IHdlIHRyeSB0byBzZW5kIGEgdm0gZXZlbnQgYW5kIGlmIHRoZSBldmVudCBpcyBzZW50IHRoZW4g
ZW11bGF0aW9uCj4+PiByZXR1cm5zIFg4NkVNVUxfQUNDRVNTX0VYQ0VQVElPTi4gSWYgdGhlIGV2
ZW50IGlzIG5vdCBzZW50IHRoZW4gdGhlCj4+PiBlbXVsYXRpb24gZ29lcyBvbiBhcyBleHBlY3Rl
ZC4KPj4gCj4+IFRoZSBtZWFuaW5nIG9mIHRoaXMgbmV3IGVtdWxhdG9yIHJldHVybiB2YWx1ZSBu
ZWVkcyBleHBsYW5hdGlvbi4KPj4gSSBub3RpY2UgaXRzICNkZWZpbmUgaXMgYWxzbyBub3QgYWNj
b21wYW5pZWQgYnkgYW55IGNvbW1lbnQuIEFuZAo+PiBhbnkgYWRkaXRpb24gb2YgYSBuZXcgZW11
bGF0b3IgcmV0dXJuIGNvZGUgc2hvdWxkIGNvbWUgd2l0aCBhCj4+IGRpc2N1c3Npb24gb2YgaG93
IGV4aXN0aW5nIHVzZXJzIGFyZSBhZmZlY3RlZC4gSSdtIG5vdCBnb2luZyB0bwo+PiBleGNsdWRl
IHRoYXQgaW5kZWVkIG5vIG90aGVyIGFkanVzdG1lbnRzIGFyZSBuZWNlc3NhcnksIGJ1dCB0aGF0
J3MKPj4gZmFyIGZyb20gb2J2aW91cy4gWW91IG1heSByZWNhbGwgdGhhdCBpdCBoYWQgdGFrZW4g
c2V2ZXJhbCBpdGVyYXRpb25zCj4+IHRvIGdldCB0aGUgYWRkaXRpb24gb2YgWDg2RU1VTF9VTklN
UExFTUVOVEVEIHJpZ2h0IHRocm91Z2hvdXQKPj4gdGhlIGNvZGUgYmFzZS4KPiAKPiBUaGlzIG5l
dyBmZWF0dXJlIGlzIGFjdGl2YXRlZCBieSAiYm9vbCBzZW5kX2V2ZW50IiB3aGVuIGNhbGxpbmcg
Cj4gaHZtX2VtdWxhdGVfb25lX3ZtX2V2ZW50KCkuIEV2ZW50cyB3aWxsIGJlIHNlbnQgaW4gc3Bl
Y2lmaWMgbW9tZW50cyBhbmQgCj4gb25seSBpZiBpdCdzIGFuIGludGVudGlvbiBmb3IgdGhhdC4K
ClRoYXQncyB1bmRlcnN0b29kLiBCdXQgdGhlIHZhcmlvdXMgZW11bGF0aW9uIGNvZGUgcGF0aHMg
X2FsbF8KbmVlZCB0byBiZSBhd2FyZSBvZiB0aGlzIHBvdGVudGlhbCBuZXcgcmV0dXJuIHZhbHVl
IG5ldmVydGhlbGVzcy4KRXZlbiBpZiBzb21lIG1heSBub3QgYmUgcmVhY2hhYmxlIHRvZGF5IGlu
IHRoZSBzcGVjaWZpYyBjYXNlIG9mCnRoZSBuZXcgZmVhdHVyZSBiZWluZyBhY3RpdmUsIHRoZXkg
bWF5IGJlY29tZSByZWFjaGFibGUgZXZlbnR1YWxseSwKYW5kIG5vLW9uZSB3b3VsZCBub3RpY2Ug
dGhlIG9taXNzaW9uIGF0IHRoYXQgcG9pbnQuCgo+Pj4gQEAgLTUzMCw2ICs1MzIsNTUgQEAgc3Rh
dGljIGludCBodm1lbXVsX2RvX21taW9fYWRkcihwYWRkcl90IG1taW9fZ3BhLAo+Pj4gICAgICAg
cmV0dXJuIGh2bWVtdWxfZG9faW9fYWRkcigxLCBtbWlvX2dwYSwgcmVwcywgc2l6ZSwgZGlyLCBk
ZiwgcmFtX2dwYSk7Cj4+PiAgIH0KPj4+ICAgCj4+PiArc3RhdGljIGJvb2wgaHZtZW11bF9zZW5k
X3ZtX2V2ZW50KHBhZGRyX3QgZ3BhLCB1bnNpZ25lZCBsb25nIGdsYSwgZ2ZuX3QgZ2ZuLAo+Pj4g
KyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB1aW50MzJfdCBwZmVjLCBzdHJ1Y3Qg
aHZtX2VtdWxhdGVfY3R4dCAqY3R4dCkKPj4gCj4+IFdoeSBib3RoIGdwYSBhbmQgZ2ZuPwo+IAo+
IElmIHRoZSBncGEgY2FuIGJlIGNhbGN1bGF0ZWQgZnJvbSBnZm4gdGhlbiB0aGUgY29kZSB3aWxs
IGJlIHNpbXBsaWZpZWQuCj4gSXMgdGhpcyB3aGF0IHlvdSBoYWQgaW4gbWluZD8KPiAKPiBncGEg
PSBnZm5fdG9fZ2FkZHIoZ2ZuKTsKClRoZSBvdGhlciB3YXkgYXJvdW5kIGFjdHVhbGx5LCBhcyB0
aGUgY2FsY3VsYXRpb24geW91IHN1Z2dlc3QKZGlzY2FyZHMgYml0cyAodGhlIGxvdyAxMiBvbmVz
KS4KCkphbgoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpo
dHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
