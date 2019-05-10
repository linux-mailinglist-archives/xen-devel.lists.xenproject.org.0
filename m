Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BC65B19EAD
	for <lists+xen-devel@lfdr.de>; Fri, 10 May 2019 16:06:52 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hP68A-0008Ea-4E; Fri, 10 May 2019 14:04:10 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=thpN=TK=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hP688-0008EV-UP
 for xen-devel@lists.xenproject.org; Fri, 10 May 2019 14:04:08 +0000
X-Inumbo-ID: 7a197c24-732c-11e9-862c-0b69d9686444
Received: from foss.arm.com (unknown [217.140.101.70])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 7a197c24-732c-11e9-862c-0b69d9686444;
 Fri, 10 May 2019 14:04:07 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4FDC4A78;
 Fri, 10 May 2019 07:04:07 -0700 (PDT)
Received: from [10.1.196.50] (e108454-lin.cambridge.arm.com [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5C25B3F73C;
 Fri, 10 May 2019 07:04:05 -0700 (PDT)
To: Jan Beulich <JBeulich@suse.com>
References: <20190507151458.29350-1-julien.grall@arm.com>
 <20190507151458.29350-10-julien.grall@arm.com>
 <5CD56F04020000780022D80B@prv1-mh.provo.novell.com>
 <4f29c1a6-308b-eacf-002a-83a402d570b9@arm.com>
 <5CD57D71020000780022D8ED@prv1-mh.provo.novell.com>
 <3a359c40-ec6e-db96-b86e-17829c8ccf88@arm.com>
 <5CD5805F020000780022D939@prv1-mh.provo.novell.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <9e696d26-0d3b-da9e-7427-f29da07dde7c@arm.com>
Date: Fri, 10 May 2019 15:04:03 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <5CD5805F020000780022D939@prv1-mh.provo.novell.com>
Content-Language: en-US
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgSmFuLAoKT24gMTAvMDUvMjAxOSAxNDo0NSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4gT24g
MTAuMDUuMTkgYXQgMTU6NDEsIDxqdWxpZW4uZ3JhbGxAYXJtLmNvbT4gd3JvdGU6Cj4+IE9uIDEw
LzA1LzIwMTkgMTQ6MzIsIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+Pj4gT24gMTAuMDUuMTkgYXQg
MTU6MjIsIDxqdWxpZW4uZ3JhbGxAYXJtLmNvbT4gd3JvdGU6Cj4+Pj4gT24gMTAvMDUvMjAxOSAx
MzozMSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4+Pj4+IE9uIDA3LjA1LjE5IGF0IDE3OjE0LCA8
anVsaWVuLmdyYWxsQGFybS5jb20+IHdyb3RlOgo+Pj4+Pj4gLS0tIGEveGVuL2NvbW1vbi9kb21j
dGwuYwo+Pj4+Pj4gKysrIGIveGVuL2NvbW1vbi9kb21jdGwuYwo+Pj4+Pj4gQEAgLTIwNSw3ICsy
MDUsNyBAQCB2b2lkIGdldGRvbWFpbmluZm8oc3RydWN0IGRvbWFpbiAqZCwgc3RydWN0Cj4+Pj4+
PiB4ZW5fZG9tY3RsX2dldGRvbWFpbmluZm8gKmluZm8pCj4+Pj4+PiAgICAgICAgIGluZm8tPm91
dHN0YW5kaW5nX3BhZ2VzID0gZC0+b3V0c3RhbmRpbmdfcGFnZXM7Cj4+Pj4+PiAgICAgICAgIGlu
Zm8tPnNocl9wYWdlcyAgICAgICAgID0gYXRvbWljX3JlYWQoJmQtPnNocl9wYWdlcyk7Cj4+Pj4+
PiAgICAgICAgIGluZm8tPnBhZ2VkX3BhZ2VzICAgICAgID0gYXRvbWljX3JlYWQoJmQtPnBhZ2Vk
X3BhZ2VzKTsKPj4+Pj4+IC0gICAgaW5mby0+c2hhcmVkX2luZm9fZnJhbWUgPSBtZm5fdG9fZ21m
bihkLCB2aXJ0X3RvX21mbihkLT5zaGFyZWRfaW5mbykpOwo+Pj4+Pj4gKyAgICBpbmZvLT5zaGFy
ZWRfaW5mb19mcmFtZSA9IGdmbl94KGRvbWFpbl9zaGFyZWRfaW5mb19nZm4oZCkpOwo+Pj4+Pgo+
Pj4+PiBXaGF0IGlzIHRoZSBpbnRlbmRlZCBiZWhhdmlvciBvbiAzMi1iaXQgQXJtIGhlcmU/IERv
IHlvdSByZWFsbHkKPj4+Pj4gbWVhbiB0byByZXR1cm4gYSB2YWx1ZSB3aXRoIDMyIGJpdHMgb2Yg
b25lcyAoaW5zdGVhZCBvZiA2NCBiaXRzIG9mCj4+Pj4+IHRoZW0pIGluIHRoaXMgNjQtYml0IGZp
ZWxkPwo+Pj4+IEl0IGRvZXMgbm90IG1hdHRlciBhcyBsb25nIGFzIHRoZSBHRk4gaXMgaW52YWxp
ZCBzbyBpdCBjYW4ndCBiZSBtYXBwZWQKPj4+PiBhZnRlcndhcmRzLiBUaGUgZXhhY3QgdmFsdWUg
aXMgbm90IGRvY3VtZW50ZWQgaW4gdGhlIGhlYWRlciB0byBhdm9pZCBhbnkKPj4+PiBhc3N1bXB0
aW9uLgo+Pj4KPj4+IFRoYXQncyBub3QgaGVscGZ1bCAtIGhvdyB3b3VsZCBhIGNvbnN1bWVyIGtu
b3cgdG8gYXZvaWQgdGhlIG1hcHBpbmcKPj4+IGF0dGVtcHQgaW4gdGhlIGZpcnN0IHBsYWNlPwo+
Pgo+PiBJIGNhbid0IHNlZSBhbnkgaXNzdWUgd2l0aCB0aGUgY29uc3VtZXIgdG8gdHJ5IHRvIG1h
cCBpdC4gT2ssIHlvdSB3aWxsIHdhc3RlIGEKPj4gY291cGxlIG9mIGN5Y2xlcywgYnV0IHRoYXQg
c2hvdWxkIGJlIHByZXR0eSByYXJlLgo+IAo+IFRoZSBhdHRlbXB0IG1heSByZXN1bHQgaW4gYSBs
b2cgbWVzc2FnZSBzcGl0IG91dC4KCkkgc3RpbGwgY2FuJ3Qgc2VlIHRoZSBpc3N1ZSBoZXJlLiBU
aGlzIGlzIG5vdGhpbmcgZGlmZmVyZW50IHRoYW4gdGhlIGZyYW1lIHdlcmUgCm5vdCBzZXR1cCBi
ZWZvcmVoYW5kLgoKPiAKPj4gVGhlIHBvaW50IGhlcmUsIHdlIGtlZXAgd2l0aGluIHRoZSBoeXBl
cnZpc29yIHRoZSBpZGVhIG9mIHdoYXQncyB2YWxpZCBvcgo+PiBpbnZhbGlkLiBUaGlzIGFsbG93
cyB1cyBtb3JlIGZsZXhpYmlsaXR5IG9uIHRoZSB2YWx1ZSBoZXJlIChpbWFnaW5lIHdlIGRlY2lk
ZSB0bwo+PiBjaGFuZ2UgdGhlIHZhbHVlIG9mIEdGTl9JTlZBTElEIGluIHRoZSBmdXR1cmUuLi4p
Lgo+IAo+IEV4YWN0bHksIGFuZCBoZW5jZSBJTlZBTElEX0dGTiBzaG91bGQgbm90IGJlY29tZSB2
aXNpYmxlIHRvIHRoZQo+IG91dHNpZGUuIEhlbmNlIG15IHJlcXVlc3QgdG8gdXNlIGFuIGFsbC1v
bmVzIHZhbHVlIGhlcmUuCkl0IGlzIG9ubHkgdmlzaWJsZSBpZiB5b3UgcHV0IGFuIGV4YWN0IHZh
bHVlIGluIHRoZSBkb2N1bWVudGF0aW9uLiBZb3VyIApzdWdnZXN0aW9uIGlzIHRvIHB1dCBhIGV4
YWN0bHkgdmFsdWUgYW5kIEkgd291bGQgcmF0aGVyIG5vdCBzZWUgdGhhdC4KCj4+Pj4+PiAtLS0g
YS94ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC9pb21tdS5jCj4+Pj4+PiArKysgYi94ZW4vZHJpdmVy
cy9wYXNzdGhyb3VnaC9pb21tdS5jCj4+Pj4+PiBAQCAtMTg4LDkgKzE4OCwxMCBAQCB2b2lkIF9f
aHdkb21faW5pdCBpb21tdV9od2RvbV9pbml0KHN0cnVjdCBkb21haW4gKmQpCj4+Pj4+PiAgICAg
ICAgIGhkLT5uZWVkX3N5bmMgPSBpb21tdV9od2RvbV9zdHJpY3QgJiYgIWlvbW11X3VzZV9oYXBf
cHQoZCk7Cj4+Pj4+PiAgICAgICAgIGlmICggbmVlZF9pb21tdV9wdF9zeW5jKGQpICkKPj4+Pj4+
ICAgICAgICAgewo+Pj4+Pj4gKyAgICAgICAgaW50IHJjID0gMDsKPj4+Pj4+ICsjaWZkZWYgQ09O
RklHX0hBU19NMlAKPj4+Pj4+ICAgICAgICAgICAgIHN0cnVjdCBwYWdlX2luZm8gKnBhZ2U7Cj4+
Pj4+PiAgICAgICAgICAgICB1bnNpZ25lZCBpbnQgaSA9IDAsIGZsdXNoX2ZsYWdzID0gMDsKPj4+
Pj4+IC0gICAgICAgIGludCByYyA9IDA7Cj4+Pj4+PiAgICAgCj4+Pj4+PiAgICAgICAgICAgICBw
YWdlX2xpc3RfZm9yX2VhY2ggKCBwYWdlLCAmZC0+cGFnZV9saXN0ICkKPj4+Pj4+ICAgICAgICAg
ICAgIHsKPj4+Pj4+IEBAIC0yMTcsNiArMjE4LDkgQEAgdm9pZCBfX2h3ZG9tX2luaXQgaW9tbXVf
aHdkb21faW5pdChzdHJ1Y3QgZG9tYWluICpkKQo+Pj4+Pj4gICAgICAgICAgICAgLyogVXNlIHdo
aWxlLWJyZWFrIHRvIGF2b2lkIGNvbXBpbGVyIHdhcm5pbmcgKi8KPj4+Pj4+ICAgICAgICAgICAg
IHdoaWxlICggaW9tbXVfaW90bGJfZmx1c2hfYWxsKGQsIGZsdXNoX2ZsYWdzKSApCj4+Pj4+PiAg
ICAgICAgICAgICAgICAgYnJlYWs7Cj4+Pj4+PiArI2Vsc2UKPj4+Pj4+ICsgICAgICAgIHJjID0g
LUVPUE5PVFNVUFA7Cj4+Pj4+PiArI2VuZGlmCj4+Pj4+PiAgICAgCj4+Pj4+PiAgICAgICAgICAg
ICBpZiAoIHJjICkKPj4+Pj4+ICAgICAgICAgICAgICAgICBwcmludGsoWEVOTE9HX1dBUk5JTkcg
ImQlZDogSU9NTVUgbWFwcGluZyBmYWlsZWQ6ICVkXG4iLAo+Pj4+Pgo+Pj4+PiBXb3VsZCB5b3Ug
bWluZCBleHRlbmRpbmcgdGhlIHNjb3BlIG9mIHRoZSAjaWZkZWYgYmV5b25kIHRoaXMgcHJpbnRr
KCk/Cj4+Pj4+IEl0IHNlZW1zIHByZXR0eSBwb2ludGxlc3MgdG8gbWUgdG8gdW5jb25kaXRpb25h
bGx5IGVtaXQgYSBsb2cgbWVzc2FnZQo+Pj4+PiBoZXJlLgo+Pj4+Cj4+Pj4gV2VsbCwgaXQgYXQg
bGVhc3QgdGVsbCB5b3UgdGhlIGZ1bmN0aW9uIGNhbid0IHdvcmsuIFNvIEkgdGhpbmsgaXQgaXMg
c3RpbGwgbWFrZXMKPj4+PiBzZW5zZSB0byBoYXZlIGl0Lgo+Pj4KPj4+IEkgZGlzYWdyZWUuCj4+
IFlvdSBkaXNhZ3JlZSBiZWNhdXNlLi4uPwo+IAo+IEJlY2F1c2Ugb2Ygd2hhdCBJJ3ZlIHNhaWQg
aW4gbXkgaW5pdGlhbCByZXBseSAoc3RpbGwgcXVvdGVkIGFib3ZlKS4KCkkgc3RpbGwgZG9uJ3Qg
c2VlIHRoZSBwcm9ibGVtIG9mIHVuY29uZGl0aW9uYWwgbG9nIG1lc3NhZ2UuIEl0IGlzIG5vdCBy
ZWFsbHkgdGhlIApmaXJzdCBwbGFjZSB3ZSBoYXZlIHRoYXQuCgo+IAo+PiBJIGhvcGUgeW91IGFy
ZSBhd2FyZSwgdGhpcyBpcyB1bmxpa2VseSBnb2luZyB0byBiZSBwcmludGVkIGFzIHRoZSBjb2Rl
IHNob3VsZAo+PiBub3QgYmUgY2FsbGVkLgo+IAo+IEFTU0VSVF9VTlJFQUNIQUJMRSgpIHRoZW4/
CgpBbmQgc3RpbGwgYXZvaWRpbmcgdGhlIHByaW50az8KCkNoZWVycywKCi0tIApKdWxpZW4gR3Jh
bGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1k
ZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8v
bGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
