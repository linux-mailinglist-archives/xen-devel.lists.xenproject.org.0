Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 115D185C9B
	for <lists+xen-devel@lfdr.de>; Thu,  8 Aug 2019 10:16:42 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hvdYQ-0007Ar-QW; Thu, 08 Aug 2019 08:13:46 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=YRw2=WE=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1hvdYP-0007Am-Jp
 for xen-devel@lists.xenproject.org; Thu, 08 Aug 2019 08:13:45 +0000
X-Inumbo-ID: 6fdb2bd8-b9b4-11e9-8980-bc764e045a96
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 6fdb2bd8-b9b4-11e9-8980-bc764e045a96;
 Thu, 08 Aug 2019 08:13:44 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id B55BDAF56;
 Thu,  8 Aug 2019 08:13:42 +0000 (UTC)
To: Jan Beulich <JBeulich@suse.com>
References: <20190807143119.8360-1-jgross@suse.com>
 <20190807143119.8360-5-jgross@suse.com>
 <5c73f39c-a8a3-2554-d66e-6b71df02f02c@suse.com>
From: Juergen Gross <jgross@suse.com>
Message-ID: <acb4f06d-f24c-3f1b-624a-db2ecfc890dc@suse.com>
Date: Thu, 8 Aug 2019 10:13:41 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <5c73f39c-a8a3-2554-d66e-6b71df02f02c@suse.com>
Content-Language: de-DE
Subject: Re: [Xen-devel] [PATCH 4/4] xen: modify lock profiling interface
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDguMDguMTkgMDk6MzIsIEphbiBCZXVsaWNoIHdyb3RlOgo+IE9uIDA3LjA4LjIwMTkgMTY6
MzEsIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6Cj4+IEBAIC00NjMsMzEgKzQ2NCw2NyBAQCBpbnQgc3Bp
bmxvY2tfcHJvZmlsZV9jb250cm9sKHN0cnVjdCB4ZW5fc3lzY3RsX2xvY2twcm9mX29wICpwYykK
Pj4gICAgICAgIHJldHVybiByYzsKPj4gICAgfQo+PiAgICAKPj4gLXZvaWQgX2xvY2tfcHJvZmls
ZV9yZWdpc3Rlcl9zdHJ1Y3QoCj4+IC0gICAgaW50MzJfdCB0eXBlLCBzdHJ1Y3QgbG9ja19wcm9m
aWxlX3FoZWFkICpxaGVhZCwgaW50MzJfdCBpZHgsIGNoYXIgKm5hbWUpCj4+ICtzdGF0aWMgc3Ry
dWN0IGxvY2tfcHJvZmlsZV9hbmMgKmZpbmRfcHJvZl9hbmMoY29uc3QgY2hhciAqbmFtZSkKPj4g
ICAgewo+PiAtICAgIHFoZWFkLT5pZHggPSBpZHg7Cj4+ICsgICAgc3RydWN0IGxvY2tfcHJvZmls
ZV9hbmMgKmFuYzsKPj4gKwo+PiArICAgIGZvciAoIGFuYyA9IGxvY2tfcHJvZmlsZV9hbmNzOyBh
bmM7IGFuYyA9IGFuYy0+bmV4dCApCj4+ICsgICAgICAgIGlmICggIXN0cmNtcChhbmMtPm5hbWUs
IG5hbWUpICkKPj4gKyAgICAgICAgICAgIHJldHVybiBhbmM7Cj4+ICsgICAgcmV0dXJuIE5VTEw7
Cj4+ICt9Cj4+ICsKPj4gK3ZvaWQgX2xvY2tfcHJvZmlsZV9yZWdpc3Rlcl9zdHJ1Y3Qoc3RydWN0
IGxvY2tfcHJvZmlsZV9xaGVhZCAqcWhlYWQsCj4+ICsgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIGludDMyX3QgaWR4LCBjb25zdCBjaGFyICpuYW1lKQo+PiArewo+PiArICAgIHN0
cnVjdCBsb2NrX3Byb2ZpbGVfYW5jICphbmM7Cj4+ICsKPj4gICAgICAgIHNwaW5fbG9jaygmbG9j
a19wcm9maWxlX2xvY2spOwo+PiAtICAgIHFoZWFkLT5oZWFkX3EgPSBsb2NrX3Byb2ZpbGVfYW5j
c1t0eXBlXS5oZWFkX3E7Cj4+IC0gICAgbG9ja19wcm9maWxlX2FuY3NbdHlwZV0uaGVhZF9xID0g
cWhlYWQ7Cj4+IC0gICAgbG9ja19wcm9maWxlX2FuY3NbdHlwZV0ubmFtZSA9IG5hbWU7Cj4+ICsK
Pj4gKyAgICBhbmMgPSBmaW5kX3Byb2ZfYW5jKG5hbWUpOwo+PiArICAgIGlmICggIWFuYyApCj4+
ICsgICAgewo+PiArICAgICAgICBhbmMgPSB4emFsbG9jKHN0cnVjdCBsb2NrX3Byb2ZpbGVfYW5j
KTsKPj4gKyAgICAgICAgYW5jLT5uYW1lID0gbmFtZTsKPj4gKyAgICAgICAgYW5jLT5uZXh0ID0g
bG9ja19wcm9maWxlX2FuY3M7Cj4+ICsgICAgICAgIGxvY2tfcHJvZmlsZV9hbmNzID0gYW5jOwo+
PiArICAgIH0KPiAKPiBUaGlzIGlzIGFuIGltbyBmdW5kYW1lbnRhbCB3ZWFrbmVzcyBvZiB0aGUg
bmV3IG1vZGVsOiBZb3Ugbm93Cj4gcmVxdWlyZSBhIGR5bmFtaWMgbWVtb3J5IGFsbG9jYXRpb24g
KG9mIHdoaWNoIHlvdSBkb24ndCBldmVuCj4gY2hlY2sgdGhhdCBpdCB3YXMgc3VjY2Vzc2Z1bCku
IFJpZ2h0IG5vdyB0aGUgcGF0aCBhYm92ZSB3aWxsCj4gb25seSBiZSB0YWtlbiBhdCBib290IHRp
bWUsIGJ1dCB0aGF0J3Mgbm90IHN0YXRlZCBhbnl3aGVyZSBhcwo+IGEgcmVzdHJpY3Rpb24gKGFm
YWljcyksIGFuZCBoZW5jZSBkb2Vzbid0IG5lZWQgdG8gcmVtYWluIHRoaXMKPiB3YXkuCgpZZXMs
IGFsbG9jYXRpb24gc3VjY2VzcyBtdXN0IGJlIGNoZWNrZWQsIG9mIGNvdXJzZS4KCkFkZGluZyBh
IG1lbW9yeSBhbGxvY2F0aW9uIGluIHRoZSBwYXRoIHNob3VsZCBiZSBubyByZWFsIHByb2JsZW0s
CmFzIG5vcm1hbGx5IHJlZ2lzdGVyaW5nIGEgc3RydWN0IGlzIGFjY29tcGFuaWVkIGJ5IHJlZ2lz
dGVyaW5nCnRoZSBsb2NrcyBpbiB0aGF0IHN0cnVjdCwgd2hpY2ggaXMgYWxyZWFkeSBkb2luZyBz
b21lIG1lbW9yeQphbGxvY2F0aW9uLiBJIHNob3VsZCBtZW50aW9uIHRoYXQgaW4gdGhlIGNvbW1l
bnQgc2VjdGlvbiBmb3IgdGhlCnVzYWdlIG9mIGxvY2sgcHJvZmlsaW5nLgoKPiBGdXJ0aGVybW9y
ZSAibmFtZSIgbm93IHNlcnZlcyB0d28gcHVycG9zZXMgd2hlbiBwcmV2aW91c2x5IGl0Cj4gc2Vy
dmVkIGp1c3Qgb25lLiBUaGlzIGlzIGJlc3Qgbm90aWNlYWJsZSB3aXRoIHRoZSBmdW5jdGlvbidz
Cj4gdXNlIGluIGRvbWFpbl9jcmVhdGUoKTogUHJldmlvdXNseSB0aGF0IHNldCB1cCB0aGUgY2xh
c3MKPiAicGVyLWRvbWFpbiIgd2l0aCBhbiBpbml0aWFsIGluc3RhbmNlICJzdHJ1Y3QgZG9tYWlu
Ii4gVGhpcwo+IGRpZCBwcm92aWRlIGZvciBzb21lb25lIGxhdGVyIGdvaW5nIGFuZCBhbHNvIHJl
Z2lzdGVyaW5nCj4gYW5vdGhlciBwZXItZG9tYWluIHN0cnVjdHVyZSAoZS5nLiBzdHJ1Y3QgcDJt
X2RvbWFpbikgYXMKPiBhbm90aGVyICJwZXItZG9tYWluIiBjbGFzcyBpbnN0YW5jZS4gVGhlbiBh
Z2FpbiBtYXliZSBJJ20gbm90Cj4gY29ycmVjdGx5IHVuZGVyc3RhbmRpbmcgdGhlIG9yaWdpbmFs
IGludGVudGlvbnMgLi4uCgpXaGlsZSB0aGUgcHJpbnRvdXQgbWlnaHQgYmUgbm90IGFzIGNsZWFy
IGFzIGRlc2lyZWQsIGl0IHdpbGwgc3RpbGwKYmUgY29ycmVjdC4gSW4gYm90aCBjYXNlcyB0aGUg
InByaW50IiB2YWx1ZSB3aWxsIGJlIHVzZWQuIFRoZSBub3cKb21pdHRlZCAidHlwZSIgcGFyYW1l
dGVyIHdhcyBvbmx5IHVzZWQgdG8gZGVjaWRlIHdoZXRoZXIgdG8gcHJpbnQKdGhlIGluZGV4IGFu
ZCBmb3Iga25vd2luZyB3aGF0IHRvIHByaW50IGluIHRoZSB4ZW5sb2NrcHJvZiB0b29sLgoKCkp1
ZXJnZW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhl
bi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBz
Oi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
