Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 567941329A4
	for <lists+xen-devel@lfdr.de>; Tue,  7 Jan 2020 16:08:56 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ioqRi-0006M5-FC; Tue, 07 Jan 2020 15:07:02 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=a7vm=24=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1ioqRg-0006Lz-DE
 for xen-devel@lists.xenproject.org; Tue, 07 Jan 2020 15:07:00 +0000
X-Inumbo-ID: 557607c4-315f-11ea-b56d-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 557607c4-315f-11ea-b56d-bc764e2007e4;
 Tue, 07 Jan 2020 15:06:51 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id D9DFDAAD0;
 Tue,  7 Jan 2020 15:06:50 +0000 (UTC)
To: Alexandru Stefan ISAILA <aisaila@bitdefender.com>
References: <20191223140409.32449-1-aisaila@bitdefender.com>
 <39338776-edcd-0b5d-5c39-7d3ef7706525@suse.com>
 <f82b7198-e7c3-df69-f53a-06c436e3ecd6@bitdefender.com>
 <afa5a448-5b82-f2c6-e1b0-11085373699c@suse.com>
 <266b2acd-00d8-8ab5-70ce-f273587dd332@bitdefender.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <b0fa1000-5b0f-8927-2710-f9b505737dc2@suse.com>
Date: Tue, 7 Jan 2020 16:06:49 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <266b2acd-00d8-8ab5-70ce-f273587dd332@bitdefender.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH V6 1/4] x86/mm: Add array_index_nospec to
 guest provided index values
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
Cc: Petre Ovidiu PIRCALABU <ppircalabu@bitdefender.com>,
 Kevin Tian <kevin.tian@intel.com>, Tamas K Lengyel <tamas@tklengyel.com>,
 Wei Liu <wl@xen.org>, Razvan COJOCARU <rcojocaru@bitdefender.com>,
 George Dunlap <george.dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Jun Nakajima <jun.nakajima@intel.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDcuMDEuMjAyMCAxNTozMSwgQWxleGFuZHJ1IFN0ZWZhbiBJU0FJTEEgd3JvdGU6Cj4gCj4g
Cj4gT24gMDcuMDEuMjAyMCAxNTo1NSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+IE9uIDA3LjAxLjIw
MjAgMTQ6MjUsIEFsZXhhbmRydSBTdGVmYW4gSVNBSUxBIHdyb3RlOgo+Pj4gT24gMjcuMTIuMjAx
OSAxMDowMSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4gT24gMjMuMTIuMjAxOSAxNTowNCwgQWxl
eGFuZHJ1IFN0ZWZhbiBJU0FJTEEgd3JvdGU6Cj4+Pj4+IC0tLSBhL3hlbi9hcmNoL3g4Ni9tbS9t
ZW1fYWNjZXNzLmMKPj4+Pj4gKysrIGIveGVuL2FyY2gveDg2L21tL21lbV9hY2Nlc3MuYwo+Pj4+
PiBAQCAtMzY2LDExICszNjYsMTIgQEAgbG9uZyBwMm1fc2V0X21lbV9hY2Nlc3Moc3RydWN0IGRv
bWFpbiAqZCwgZ2ZuX3QgZ2ZuLCB1aW50MzJfdCBuciwKPj4+Pj4gICAgI2lmZGVmIENPTkZJR19I
Vk0KPj4+Pj4gICAgICAgIGlmICggYWx0cDJtX2lkeCApCj4+Pj4+ICAgICAgICB7Cj4+Pj4+IC0g
ICAgICAgIGlmICggYWx0cDJtX2lkeCA+PSBNQVhfQUxUUDJNIHx8Cj4+Pj4+IC0gICAgICAgICAg
ICAgZC0+YXJjaC5hbHRwMm1fZXB0cFthbHRwMm1faWR4XSA9PSBtZm5feChJTlZBTElEX01GTikg
KQo+Pj4+PiArICAgICAgICBpZiAoIGFsdHAybV9pZHggPj0gIG1pbihBUlJBWV9TSVpFKGQtPmFy
Y2guYWx0cDJtX3AybSksIE1BWF9FUFRQKSB8fAo+Pj4+Cj4+Pj4gU3RyYXkgYmxhbmsgYWZ0ZXIg
Pj0gLgo+Pj4+Cj4+Pj4+ICsgICAgICAgICAgICAgZC0+YXJjaC5hbHRwMm1fZXB0cFthcnJheV9p
bmRleF9ub3NwZWMoYWx0cDJtX2lkeCwgTUFYX0VQVFApXSA9PQo+Pj4+Cj4+Pj4gSSBhY2NlcHQg
eW91IGNhbid0IChjdXJyZW50bHkpIHVzZSBhcnJheV9hY2Nlc3Nfbm9zcGVjKCkgaGVyZSwKPj4+
PiBidXQgLi4uCj4+Pj4KPj4+Pj4gKyAgICAgICAgICAgICBtZm5feChJTlZBTElEX01GTikgKQo+
Pj4+PiAgICAgICAgICAgICAgICByZXR1cm4gLUVJTlZBTDsKPj4+Pj4gICAgCj4+Pj4+IC0gICAg
ICAgIGFwMm0gPSBkLT5hcmNoLmFsdHAybV9wMm1bYWx0cDJtX2lkeF07Cj4+Pj4+ICsgICAgICAg
IGFwMm0gPSBkLT5hcmNoLmFsdHAybV9wMm1bYXJyYXlfaW5kZXhfbm9zcGVjKGFsdHAybV9pZHgs
IE1BWF9BTFRQMk0pXTsKPj4+Pgo+Pj4+IC4uLiBJIGRvbid0IHNlZSB3aHkgeW91IHN0aWxsIGVm
ZmVjdGl2ZWx5IG9wZW4tY29kZSBpdCBoZXJlLgo+Pj4KPj4+IEkgYW0gbm90IHN1cmUgSSBmb2xs
b3cgeW91IGhlcmUsIHRoYXQgaXMgd2hhdCB3ZSBhZ3JlZWQgaW4gdjUKPj4+IChodHRwczovL2xp
c3RzLnhlbnByb2plY3Qub3JnL2FyY2hpdmVzL2h0bWwveGVuLWRldmVsLzIwMTktMTIvbXNnMDE3
MDQuaHRtbCkuCj4+PiBEaWQgSSBtaXNzIHNvbWV0aGluZz8KPj4KPj4gSW4gY29udGV4dCB0aGVy
ZSAoZnJvbSBhbiBlYXJsaWVyIHJlcGx5IG9mIG1pbmUpIHlvdSB3aWxsIGZpbmQgbWUKPj4gaGF2
aW5nIG1lbnRpb25lZCBhcnJheV9hY2Nlc3Nfbm9zcGVjKCkuIFRoaXMgd2Fzbid0IGludmFsaWRh
dGVkIG9yCj4+IG92ZXJyaWRkZW4gYnkgbXkgIlllcywgdGhhdCdzIGhvdyBJIHRoaW5rIGl0IG91
Z2h0IHRvIGJlLiIgSSBkaWRuJ3QKPj4gc2F5IHNvIGV4cGxpY2l0bHkgKGFnYWluKSBiZWNhdXNl
IHRvIG1lIGl0IGdvZXMgd2l0aG91dCBzYXlpbmcgdGhhdAo+PiBvcGVuLWNvZGluZyBfYW55dGhp
bmdfIGlzLCBpbiB0aGUgY29tbW9uIGNhc2UsIGJhZCBwcmFjdGljZS4KPj4KPiAKPiBTbyB0aGUg
d2F5IHRvIGdvIGlzIHRvIGhhdmU6Cj4gCj4gYWx0cDJtX2lkeCA9IGFycmF5X2luZGV4X25vc3Bl
YyhhbHRwMm1faWR4LCBNQVhfQUxUUDJNKTsKPiBhcDJtID0gZC0+YXJjaC5hbHRwMm1fcDJtW2Fs
dHAybV9pZHhdOwoKTm8uIFRoZSB3YXkgdG8gZ28gaXMgdG8gdXNlIGFycmF5X2FjY2Vzc19ub3Nw
ZWMoKSB3aGVyZXZlciBwb3NzaWJsZS4KQmVzaWRlcyAoYXMgc2FpZCkgYXZvaWRpbmcgaXRzIG9w
ZW4tY29kaW5nLCB0aGlzIGlzIHRoZSBjb25zdHJ1Y3QKY29ycmVjdGx5IG1hdGNoaW5nIHlvdXIg
dXNlcyBvZiBBUlJBWV9TSVpFKCksIGF2b2lkaW5nIHRoZSBleHBsaWNpdApzcGVjaWZpY2F0aW9u
IG9mIHRoZSB1cHBlciBhcnJheSBib3VuZCAoTUFYX0FMVFAyTSkuIChJIHJlYWxseSBkb24ndApz
ZWUgaG93IG15IHByZXZpb3VzIHJlcGx5IHdhcyBub3QgY3J5c3RhbCBjbGVhciBpbiB0aGlzIHJl
Z2FyZC4pCgpKYW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3Jn
Cmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
