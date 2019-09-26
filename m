Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E9655BF4F7
	for <lists+xen-devel@lfdr.de>; Thu, 26 Sep 2019 16:23:10 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iDUcj-0006u6-Lv; Thu, 26 Sep 2019 14:20:01 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=breC=XV=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iDUci-0006u0-8x
 for xen-devel@lists.xenproject.org; Thu, 26 Sep 2019 14:20:00 +0000
X-Inumbo-ID: b83a58da-e068-11e9-97fb-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by localhost (Halon) with ESMTPS
 id b83a58da-e068-11e9-97fb-bc764e2007e4;
 Thu, 26 Sep 2019 14:19:59 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id D2958AF19;
 Thu, 26 Sep 2019 14:19:57 +0000 (UTC)
To: Tamas K Lengyel <tamas@tklengyel.com>
References: <cover.1569425745.git.tamas.lengyel@intel.com>
 <e1fec257377046cf442842e27dff9bafc1f2bb27.1569425745.git.tamas.lengyel@intel.com>
 <2e648f3c-e5d3-c3eb-93d7-cde0a0058cb6@suse.com>
 <CABfawhmkT61ADXJkodO064-5aNFpUY4ZLSGPKmHVWhxxDay1Yw@mail.gmail.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <6b1f5ed0-95e8-9aad-beb0-2399d667ba56@suse.com>
Date: Thu, 26 Sep 2019 16:19:58 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <CABfawhmkT61ADXJkodO064-5aNFpUY4ZLSGPKmHVWhxxDay1Yw@mail.gmail.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [RFC PATCH for-next 04/18] x86/mem_sharing: cleanup
 code in various locations
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
Cc: Tamas K Lengyel <tamas.lengyel@intel.com>, Wei Liu <wl@xen.org>,
 George Dunlap <george.dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjYuMDkuMjAxOSAxNjowOSwgVGFtYXMgSyBMZW5neWVsIHdyb3RlOgo+IE9uIFdlZCwgU2Vw
IDI1LCAyMDE5IGF0IDEwOjE1IEFNIEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4gd3Jv
dGU6Cj4+IE9uIDI1LjA5LjIwMTkgMTc6NDgsIFRhbWFzIEsgTGVuZ3llbCB3cm90ZToKPj4+IC0t
LSBhL3hlbi9hcmNoL3g4Ni9odm0vaHZtLmMKPj4+ICsrKyBiL3hlbi9hcmNoL3g4Ni9odm0vaHZt
LmMKPj4+IEBAIC0xODc5LDEyICsxODc5LDExIEBAIGludCBodm1faGFwX25lc3RlZF9wYWdlX2Zh
dWx0KHBhZGRyX3QgZ3BhLCB1bnNpZ25lZCBsb25nIGdsYSwKPj4+ICAgICAgaWYgKCBucGZlYy53
cml0ZV9hY2Nlc3MgJiYgKHAybXQgPT0gcDJtX3JhbV9zaGFyZWQpICkKPj4+ICAgICAgewo+Pj4g
ICAgICAgICAgQVNTRVJUKHAybV9pc19ob3N0cDJtKHAybSkpOwo+Pj4gLSAgICAgICAgc2hhcmlu
Z19lbm9tZW0gPQo+Pj4gLSAgICAgICAgICAgIChtZW1fc2hhcmluZ191bnNoYXJlX3BhZ2UoY3Vy
cmQsIGdmbiwgMCkgPCAwKTsKPj4+ICsgICAgICAgIHNoYXJpbmdfZW5vbWVtID0gbWVtX3NoYXJp
bmdfdW5zaGFyZV9wYWdlKGN1cnJkLCBnZm4sIDApOwo+Pgo+PiBJIGd1ZXNzIHRoZSBpbXBsaWNh
dGlvbiBoZXJlIGlzIHRoYXQgdGhlIGZ1bmN0aW9uIGNhbiBvbmx5IHJldHVybgo+PiAtRU5PTUVN
PyBOb3QgdmVyeSBmb3J3YXJkIGNvbXBhdGlibGUsIGJ1dCB3ZWxsLiBIb3dldmVyLCBpZiB5b3UK
Pj4gdG91Y2ggdGhpcyBhbHJlYWR5LCBzaG91bGRuJ3QgeW91IGF0IGxlYXN0IG1ha2UgInNoYXJp
bmdfZW5vbWVtIgo+PiBib29sPwo+IAo+IENvcnJlY3QsIHRoZXJlIGlzIGEgQlVHX09OIGZvciBl
dmVyeSBvdGhlciByYyB2YWx1ZSBidXQgRU5PTUVNLiBXZQo+IGNvdWxkIHR1cm4gaXQgaW50byBh
IGJvb2wgYnV0IEkgZG9uJ3Qgc2VlIGEgcmVhc29uIGZvciBpdCwgcGVyaGFwcwo+IHRoZXJlIHdp
bGwgYmUgYW5vdGhlciByYyB2YWx1ZSBpbiB0aGUgZnV0dXJlIHRoYXQgd2Ugd2FudCB0byBoYW5k
bGUKPiBncmFjZWZ1bGx5LgoKQXQgd2hpY2ggcG9pbnQgdGhlIHZhcmlhYmxlJ3MgbmFtZSB3aWxs
IG5vIGxvbmdlciBiZSBhcHByb3ByaWF0ZS4KSGVuY2UgbXkgcmVxdWVzdCB0byBtYWtlIGl0IGJv
b2w7IGF0IHN1Y2ggYSBmdXR1cmUgcG9pbnQgdGhlIGNvZGUKd291bGQgbmVlZCB0b3VjaGluZyBh
Z2FpbiBhbnl3YXkgaWYgeW91ICh1bmRlcnN0YW5kYWJseSkgZG9uJ3QKd2FudCB0byBtYWtlIG1v
cmUgdGhhbiBwdXJlbHkgY29zbWV0aWMgY2hhbmdlcyBub3cuCgpKYW4KCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QK
WGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5v
cmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
