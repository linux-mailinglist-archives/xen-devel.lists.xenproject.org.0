Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EE9519E72
	for <lists+xen-devel@lfdr.de>; Fri, 10 May 2019 15:48:10 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hP5pl-0006E5-7x; Fri, 10 May 2019 13:45:09 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=5pb9=TK=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hP5pj-0006E0-3u
 for xen-devel@lists.xenproject.org; Fri, 10 May 2019 13:45:07 +0000
X-Inumbo-ID: d0fd54d2-7329-11e9-80ac-4beb4fc0f055
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d0fd54d2-7329-11e9-80ac-4beb4fc0f055;
 Fri, 10 May 2019 13:45:05 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Fri, 10 May 2019 07:45:04 -0600
Message-Id: <5CD5805F020000780022D939@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.0 
Date: Fri, 10 May 2019 07:45:03 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "Julien Grall" <julien.grall@arm.com>
References: <20190507151458.29350-1-julien.grall@arm.com>
 <20190507151458.29350-10-julien.grall@arm.com>
 <5CD56F04020000780022D80B@prv1-mh.provo.novell.com>
 <4f29c1a6-308b-eacf-002a-83a402d570b9@arm.com>
 <5CD57D71020000780022D8ED@prv1-mh.provo.novell.com>
 <3a359c40-ec6e-db96-b86e-17829c8ccf88@arm.com>
In-Reply-To: <3a359c40-ec6e-db96-b86e-17829c8ccf88@arm.com>
Mime-Version: 1.0
Content-Disposition: inline
Subject: Re: [Xen-devel] [PATCH 09/14] xen: Introduce HAS_M2P config and use
 to protect mfn_to_gmfn call
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 oleksandr_tyshchenko@epam.com, xen-devel <xen-devel@lists.xenproject.org>,
 "andrii_anisov@epam.com" <andrii_anisov@epam.com>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Pj4+IE9uIDEwLjA1LjE5IGF0IDE1OjQxLCA8anVsaWVuLmdyYWxsQGFybS5jb20+IHdyb3RlOgo+
IE9uIDEwLzA1LzIwMTkgMTQ6MzIsIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+PiBPbiAxMC4wNS4x
OSBhdCAxNToyMiwgPGp1bGllbi5ncmFsbEBhcm0uY29tPiB3cm90ZToKPj4+IE9uIDEwLzA1LzIw
MTkgMTM6MzEsIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+Pj4+IE9uIDA3LjA1LjE5IGF0IDE3OjE0
LCA8anVsaWVuLmdyYWxsQGFybS5jb20+IHdyb3RlOgo+Pj4+PiAtLS0gYS94ZW4vY29tbW9uL2Rv
bWN0bC5jCj4+Pj4+ICsrKyBiL3hlbi9jb21tb24vZG9tY3RsLmMKPj4+Pj4gQEAgLTIwNSw3ICsy
MDUsNyBAQCB2b2lkIGdldGRvbWFpbmluZm8oc3RydWN0IGRvbWFpbiAqZCwgc3RydWN0Cj4+Pj4+
IHhlbl9kb21jdGxfZ2V0ZG9tYWluaW5mbyAqaW5mbykKPj4+Pj4gICAgICAgIGluZm8tPm91dHN0
YW5kaW5nX3BhZ2VzID0gZC0+b3V0c3RhbmRpbmdfcGFnZXM7Cj4+Pj4+ICAgICAgICBpbmZvLT5z
aHJfcGFnZXMgICAgICAgICA9IGF0b21pY19yZWFkKCZkLT5zaHJfcGFnZXMpOwo+Pj4+PiAgICAg
ICAgaW5mby0+cGFnZWRfcGFnZXMgICAgICAgPSBhdG9taWNfcmVhZCgmZC0+cGFnZWRfcGFnZXMp
Owo+Pj4+PiAtICAgIGluZm8tPnNoYXJlZF9pbmZvX2ZyYW1lID0gbWZuX3RvX2dtZm4oZCwgdmly
dF90b19tZm4oZC0+c2hhcmVkX2luZm8pKTsKPj4+Pj4gKyAgICBpbmZvLT5zaGFyZWRfaW5mb19m
cmFtZSA9IGdmbl94KGRvbWFpbl9zaGFyZWRfaW5mb19nZm4oZCkpOwo+Pj4+Cj4+Pj4gV2hhdCBp
cyB0aGUgaW50ZW5kZWQgYmVoYXZpb3Igb24gMzItYml0IEFybSBoZXJlPyBEbyB5b3UgcmVhbGx5
Cj4+Pj4gbWVhbiB0byByZXR1cm4gYSB2YWx1ZSB3aXRoIDMyIGJpdHMgb2Ygb25lcyAoaW5zdGVh
ZCBvZiA2NCBiaXRzIG9mCj4+Pj4gdGhlbSkgaW4gdGhpcyA2NC1iaXQgZmllbGQ/Cj4+PiBJdCBk
b2VzIG5vdCBtYXR0ZXIgYXMgbG9uZyBhcyB0aGUgR0ZOIGlzIGludmFsaWQgc28gaXQgY2FuJ3Qg
YmUgbWFwcGVkCj4+PiBhZnRlcndhcmRzLiBUaGUgZXhhY3QgdmFsdWUgaXMgbm90IGRvY3VtZW50
ZWQgaW4gdGhlIGhlYWRlciB0byBhdm9pZCBhbnkKPj4+IGFzc3VtcHRpb24uCj4+IAo+PiBUaGF0
J3Mgbm90IGhlbHBmdWwgLSBob3cgd291bGQgYSBjb25zdW1lciBrbm93IHRvIGF2b2lkIHRoZSBt
YXBwaW5nCj4+IGF0dGVtcHQgaW4gdGhlIGZpcnN0IHBsYWNlPwo+IAo+IEkgY2FuJ3Qgc2VlIGFu
eSBpc3N1ZSB3aXRoIHRoZSBjb25zdW1lciB0byB0cnkgdG8gbWFwIGl0LiBPaywgeW91IHdpbGwg
d2FzdGUgYSAKPiBjb3VwbGUgb2YgY3ljbGVzLCBidXQgdGhhdCBzaG91bGQgYmUgcHJldHR5IHJh
cmUuCgpUaGUgYXR0ZW1wdCBtYXkgcmVzdWx0IGluIGEgbG9nIG1lc3NhZ2Ugc3BpdCBvdXQuCgo+
IFRoZSBwb2ludCBoZXJlLCB3ZSBrZWVwIHdpdGhpbiB0aGUgaHlwZXJ2aXNvciB0aGUgaWRlYSBv
ZiB3aGF0J3MgdmFsaWQgb3IgCj4gaW52YWxpZC4gVGhpcyBhbGxvd3MgdXMgbW9yZSBmbGV4aWJp
bGl0eSBvbiB0aGUgdmFsdWUgaGVyZSAoaW1hZ2luZSB3ZSBkZWNpZGUgdG8gCj4gY2hhbmdlIHRo
ZSB2YWx1ZSBvZiBHRk5fSU5WQUxJRCBpbiB0aGUgZnV0dXJlLi4uKS4KCkV4YWN0bHksIGFuZCBo
ZW5jZSBJTlZBTElEX0dGTiBzaG91bGQgbm90IGJlY29tZSB2aXNpYmxlIHRvIHRoZQpvdXRzaWRl
LiBIZW5jZSBteSByZXF1ZXN0IHRvIHVzZSBhbiBhbGwtb25lcyB2YWx1ZSBoZXJlLgoKPj4+Pj4g
LS0tIGEveGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvaW9tbXUuYwo+Pj4+PiArKysgYi94ZW4vZHJp
dmVycy9wYXNzdGhyb3VnaC9pb21tdS5jCj4+Pj4+IEBAIC0xODgsOSArMTg4LDEwIEBAIHZvaWQg
X19od2RvbV9pbml0IGlvbW11X2h3ZG9tX2luaXQoc3RydWN0IGRvbWFpbiAqZCkKPj4+Pj4gICAg
ICAgIGhkLT5uZWVkX3N5bmMgPSBpb21tdV9od2RvbV9zdHJpY3QgJiYgIWlvbW11X3VzZV9oYXBf
cHQoZCk7Cj4+Pj4+ICAgICAgICBpZiAoIG5lZWRfaW9tbXVfcHRfc3luYyhkKSApCj4+Pj4+ICAg
ICAgICB7Cj4+Pj4+ICsgICAgICAgIGludCByYyA9IDA7Cj4+Pj4+ICsjaWZkZWYgQ09ORklHX0hB
U19NMlAKPj4+Pj4gICAgICAgICAgICBzdHJ1Y3QgcGFnZV9pbmZvICpwYWdlOwo+Pj4+PiAgICAg
ICAgICAgIHVuc2lnbmVkIGludCBpID0gMCwgZmx1c2hfZmxhZ3MgPSAwOwo+Pj4+PiAtICAgICAg
ICBpbnQgcmMgPSAwOwo+Pj4+PiAgICAKPj4+Pj4gICAgICAgICAgICBwYWdlX2xpc3RfZm9yX2Vh
Y2ggKCBwYWdlLCAmZC0+cGFnZV9saXN0ICkKPj4+Pj4gICAgICAgICAgICB7Cj4+Pj4+IEBAIC0y
MTcsNiArMjE4LDkgQEAgdm9pZCBfX2h3ZG9tX2luaXQgaW9tbXVfaHdkb21faW5pdChzdHJ1Y3Qg
ZG9tYWluICpkKQo+Pj4+PiAgICAgICAgICAgIC8qIFVzZSB3aGlsZS1icmVhayB0byBhdm9pZCBj
b21waWxlciB3YXJuaW5nICovCj4+Pj4+ICAgICAgICAgICAgd2hpbGUgKCBpb21tdV9pb3RsYl9m
bHVzaF9hbGwoZCwgZmx1c2hfZmxhZ3MpICkKPj4+Pj4gICAgICAgICAgICAgICAgYnJlYWs7Cj4+
Pj4+ICsjZWxzZQo+Pj4+PiArICAgICAgICByYyA9IC1FT1BOT1RTVVBQOwo+Pj4+PiArI2VuZGlm
Cj4+Pj4+ICAgIAo+Pj4+PiAgICAgICAgICAgIGlmICggcmMgKQo+Pj4+PiAgICAgICAgICAgICAg
ICBwcmludGsoWEVOTE9HX1dBUk5JTkcgImQlZDogSU9NTVUgbWFwcGluZyBmYWlsZWQ6ICVkXG4i
LAo+Pj4+Cj4+Pj4gV291bGQgeW91IG1pbmQgZXh0ZW5kaW5nIHRoZSBzY29wZSBvZiB0aGUgI2lm
ZGVmIGJleW9uZCB0aGlzIHByaW50aygpPwo+Pj4+IEl0IHNlZW1zIHByZXR0eSBwb2ludGxlc3Mg
dG8gbWUgdG8gdW5jb25kaXRpb25hbGx5IGVtaXQgYSBsb2cgbWVzc2FnZQo+Pj4+IGhlcmUuCj4+
Pgo+Pj4gV2VsbCwgaXQgYXQgbGVhc3QgdGVsbCB5b3UgdGhlIGZ1bmN0aW9uIGNhbid0IHdvcmsu
IFNvIEkgdGhpbmsgaXQgaXMgc3RpbGwgbWFrZXMKPj4+IHNlbnNlIHRvIGhhdmUgaXQuCj4+IAo+
PiBJIGRpc2FncmVlLgo+IFlvdSBkaXNhZ3JlZSBiZWNhdXNlLi4uPwoKQmVjYXVzZSBvZiB3aGF0
IEkndmUgc2FpZCBpbiBteSBpbml0aWFsIHJlcGx5IChzdGlsbCBxdW90ZWQgYWJvdmUpLgoKPiBJ
IGhvcGUgeW91IGFyZSBhd2FyZSwgdGhpcyBpcyB1bmxpa2VseSBnb2luZyB0byBiZSBwcmludGVk
IGFzIHRoZSBjb2RlIHNob3VsZCAKPiBub3QgYmUgY2FsbGVkLgoKQVNTRVJUX1VOUkVBQ0hBQkxF
KCkgdGhlbj8KCkphbgoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0
Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRl
dmVs
