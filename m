Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AFF8219E4A
	for <lists+xen-devel@lfdr.de>; Fri, 10 May 2019 15:35:38 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hP5dc-0004dL-Ui; Fri, 10 May 2019 13:32:36 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=5pb9=TK=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hP5db-0004dG-8g
 for xen-devel@lists.xenproject.org; Fri, 10 May 2019 13:32:35 +0000
X-Inumbo-ID: 110987a4-7328-11e9-8980-bc764e045a96
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 110987a4-7328-11e9-8980-bc764e045a96;
 Fri, 10 May 2019 13:32:33 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Fri, 10 May 2019 07:32:32 -0600
Message-Id: <5CD57D71020000780022D8ED@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.0 
Date: Fri, 10 May 2019 07:32:33 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "Julien Grall" <julien.grall@arm.com>
References: <20190507151458.29350-1-julien.grall@arm.com>
 <20190507151458.29350-10-julien.grall@arm.com>
 <5CD56F04020000780022D80B@prv1-mh.provo.novell.com>
 <4f29c1a6-308b-eacf-002a-83a402d570b9@arm.com>
In-Reply-To: <4f29c1a6-308b-eacf-002a-83a402d570b9@arm.com>
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

Pj4+IE9uIDEwLjA1LjE5IGF0IDE1OjIyLCA8anVsaWVuLmdyYWxsQGFybS5jb20+IHdyb3RlOgo+
IE9uIDEwLzA1LzIwMTkgMTM6MzEsIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+PiBPbiAwNy4wNS4x
OSBhdCAxNzoxNCwgPGp1bGllbi5ncmFsbEBhcm0uY29tPiB3cm90ZToKPj4+IC0tLSBhL3hlbi9j
b21tb24vZG9tY3RsLmMKPj4+ICsrKyBiL3hlbi9jb21tb24vZG9tY3RsLmMKPj4+IEBAIC0yMDUs
NyArMjA1LDcgQEAgdm9pZCBnZXRkb21haW5pbmZvKHN0cnVjdCBkb21haW4gKmQsIHN0cnVjdAo+
Pj4geGVuX2RvbWN0bF9nZXRkb21haW5pbmZvICppbmZvKQo+Pj4gICAgICAgaW5mby0+b3V0c3Rh
bmRpbmdfcGFnZXMgPSBkLT5vdXRzdGFuZGluZ19wYWdlczsKPj4+ICAgICAgIGluZm8tPnNocl9w
YWdlcyAgICAgICAgID0gYXRvbWljX3JlYWQoJmQtPnNocl9wYWdlcyk7Cj4+PiAgICAgICBpbmZv
LT5wYWdlZF9wYWdlcyAgICAgICA9IGF0b21pY19yZWFkKCZkLT5wYWdlZF9wYWdlcyk7Cj4+PiAt
ICAgIGluZm8tPnNoYXJlZF9pbmZvX2ZyYW1lID0gbWZuX3RvX2dtZm4oZCwgdmlydF90b19tZm4o
ZC0+c2hhcmVkX2luZm8pKTsKPj4+ICsgICAgaW5mby0+c2hhcmVkX2luZm9fZnJhbWUgPSBnZm5f
eChkb21haW5fc2hhcmVkX2luZm9fZ2ZuKGQpKTsKPj4gCj4+IFdoYXQgaXMgdGhlIGludGVuZGVk
IGJlaGF2aW9yIG9uIDMyLWJpdCBBcm0gaGVyZT8gRG8geW91IHJlYWxseQo+PiBtZWFuIHRvIHJl
dHVybiBhIHZhbHVlIHdpdGggMzIgYml0cyBvZiBvbmVzIChpbnN0ZWFkIG9mIDY0IGJpdHMgb2YK
Pj4gdGhlbSkgaW4gdGhpcyA2NC1iaXQgZmllbGQ/Cj4gSXQgZG9lcyBub3QgbWF0dGVyIGFzIGxv
bmcgYXMgdGhlIEdGTiBpcyBpbnZhbGlkIHNvIGl0IGNhbid0IGJlIG1hcHBlZCAKPiBhZnRlcndh
cmRzLiBUaGUgZXhhY3QgdmFsdWUgaXMgbm90IGRvY3VtZW50ZWQgaW4gdGhlIGhlYWRlciB0byBh
dm9pZCBhbnkgCj4gYXNzdW1wdGlvbi4KClRoYXQncyBub3QgaGVscGZ1bCAtIGhvdyB3b3VsZCBh
IGNvbnN1bWVyIGtub3cgdG8gYXZvaWQgdGhlIG1hcHBpbmcKYXR0ZW1wdCBpbiB0aGUgZmlyc3Qg
cGxhY2U/Cgo+Pj4gLS0tIGEveGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvaW9tbXUuYwo+Pj4gKysr
IGIveGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvaW9tbXUuYwo+Pj4gQEAgLTE4OCw5ICsxODgsMTAg
QEAgdm9pZCBfX2h3ZG9tX2luaXQgaW9tbXVfaHdkb21faW5pdChzdHJ1Y3QgZG9tYWluICpkKQo+
Pj4gICAgICAgaGQtPm5lZWRfc3luYyA9IGlvbW11X2h3ZG9tX3N0cmljdCAmJiAhaW9tbXVfdXNl
X2hhcF9wdChkKTsKPj4+ICAgICAgIGlmICggbmVlZF9pb21tdV9wdF9zeW5jKGQpICkKPj4+ICAg
ICAgIHsKPj4+ICsgICAgICAgIGludCByYyA9IDA7Cj4+PiArI2lmZGVmIENPTkZJR19IQVNfTTJQ
Cj4+PiAgICAgICAgICAgc3RydWN0IHBhZ2VfaW5mbyAqcGFnZTsKPj4+ICAgICAgICAgICB1bnNp
Z25lZCBpbnQgaSA9IDAsIGZsdXNoX2ZsYWdzID0gMDsKPj4+IC0gICAgICAgIGludCByYyA9IDA7
Cj4+PiAgIAo+Pj4gICAgICAgICAgIHBhZ2VfbGlzdF9mb3JfZWFjaCAoIHBhZ2UsICZkLT5wYWdl
X2xpc3QgKQo+Pj4gICAgICAgICAgIHsKPj4+IEBAIC0yMTcsNiArMjE4LDkgQEAgdm9pZCBfX2h3
ZG9tX2luaXQgaW9tbXVfaHdkb21faW5pdChzdHJ1Y3QgZG9tYWluICpkKQo+Pj4gICAgICAgICAg
IC8qIFVzZSB3aGlsZS1icmVhayB0byBhdm9pZCBjb21waWxlciB3YXJuaW5nICovCj4+PiAgICAg
ICAgICAgd2hpbGUgKCBpb21tdV9pb3RsYl9mbHVzaF9hbGwoZCwgZmx1c2hfZmxhZ3MpICkKPj4+
ICAgICAgICAgICAgICAgYnJlYWs7Cj4+PiArI2Vsc2UKPj4+ICsgICAgICAgIHJjID0gLUVPUE5P
VFNVUFA7Cj4+PiArI2VuZGlmCj4+PiAgIAo+Pj4gICAgICAgICAgIGlmICggcmMgKQo+Pj4gICAg
ICAgICAgICAgICBwcmludGsoWEVOTE9HX1dBUk5JTkcgImQlZDogSU9NTVUgbWFwcGluZyBmYWls
ZWQ6ICVkXG4iLAo+PiAKPj4gV291bGQgeW91IG1pbmQgZXh0ZW5kaW5nIHRoZSBzY29wZSBvZiB0
aGUgI2lmZGVmIGJleW9uZCB0aGlzIHByaW50aygpPwo+PiBJdCBzZWVtcyBwcmV0dHkgcG9pbnRs
ZXNzIHRvIG1lIHRvIHVuY29uZGl0aW9uYWxseSBlbWl0IGEgbG9nIG1lc3NhZ2UKPj4gaGVyZS4K
PiAKPiBXZWxsLCBpdCBhdCBsZWFzdCB0ZWxsIHlvdSB0aGUgZnVuY3Rpb24gY2FuJ3Qgd29yay4g
U28gSSB0aGluayBpdCBpcyBzdGlsbCBtYWtlcyAKPiBzZW5zZSB0byBoYXZlIGl0LgoKSSBkaXNh
Z3JlZS4KCkphbgoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9y
ZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
