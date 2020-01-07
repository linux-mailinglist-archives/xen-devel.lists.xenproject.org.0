Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A0380132836
	for <lists+xen-devel@lfdr.de>; Tue,  7 Jan 2020 14:57:31 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iopKO-00082f-Ax; Tue, 07 Jan 2020 13:55:24 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=a7vm=24=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iopKM-00082a-OS
 for xen-devel@lists.xenproject.org; Tue, 07 Jan 2020 13:55:22 +0000
X-Inumbo-ID: 53468a82-3155-11ea-b836-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 53468a82-3155-11ea-b836-bc764e2007e4;
 Tue, 07 Jan 2020 13:55:13 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 1AD7DAC50;
 Tue,  7 Jan 2020 13:55:12 +0000 (UTC)
To: Alexandru Stefan ISAILA <aisaila@bitdefender.com>
References: <20191223140409.32449-1-aisaila@bitdefender.com>
 <39338776-edcd-0b5d-5c39-7d3ef7706525@suse.com>
 <f82b7198-e7c3-df69-f53a-06c436e3ecd6@bitdefender.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <afa5a448-5b82-f2c6-e1b0-11085373699c@suse.com>
Date: Tue, 7 Jan 2020 14:55:10 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <f82b7198-e7c3-df69-f53a-06c436e3ecd6@bitdefender.com>
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

T24gMDcuMDEuMjAyMCAxNDoyNSwgQWxleGFuZHJ1IFN0ZWZhbiBJU0FJTEEgd3JvdGU6Cj4gT24g
MjcuMTIuMjAxOSAxMDowMSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+IE9uIDIzLjEyLjIwMTkgMTU6
MDQsIEFsZXhhbmRydSBTdGVmYW4gSVNBSUxBIHdyb3RlOgo+Pj4gLS0tIGEveGVuL2FyY2gveDg2
L21tL21lbV9hY2Nlc3MuYwo+Pj4gKysrIGIveGVuL2FyY2gveDg2L21tL21lbV9hY2Nlc3MuYwo+
Pj4gQEAgLTM2NiwxMSArMzY2LDEyIEBAIGxvbmcgcDJtX3NldF9tZW1fYWNjZXNzKHN0cnVjdCBk
b21haW4gKmQsIGdmbl90IGdmbiwgdWludDMyX3QgbnIsCj4+PiAgICNpZmRlZiBDT05GSUdfSFZN
Cj4+PiAgICAgICBpZiAoIGFsdHAybV9pZHggKQo+Pj4gICAgICAgewo+Pj4gLSAgICAgICAgaWYg
KCBhbHRwMm1faWR4ID49IE1BWF9BTFRQMk0gfHwKPj4+IC0gICAgICAgICAgICAgZC0+YXJjaC5h
bHRwMm1fZXB0cFthbHRwMm1faWR4XSA9PSBtZm5feChJTlZBTElEX01GTikgKQo+Pj4gKyAgICAg
ICAgaWYgKCBhbHRwMm1faWR4ID49ICBtaW4oQVJSQVlfU0laRShkLT5hcmNoLmFsdHAybV9wMm0p
LCBNQVhfRVBUUCkgfHwKPj4KPj4gU3RyYXkgYmxhbmsgYWZ0ZXIgPj0gLgo+Pgo+Pj4gKyAgICAg
ICAgICAgICBkLT5hcmNoLmFsdHAybV9lcHRwW2FycmF5X2luZGV4X25vc3BlYyhhbHRwMm1faWR4
LCBNQVhfRVBUUCldID09Cj4+Cj4+IEkgYWNjZXB0IHlvdSBjYW4ndCAoY3VycmVudGx5KSB1c2Ug
YXJyYXlfYWNjZXNzX25vc3BlYygpIGhlcmUsCj4+IGJ1dCAuLi4KPj4KPj4+ICsgICAgICAgICAg
ICAgbWZuX3goSU5WQUxJRF9NRk4pICkKPj4+ICAgICAgICAgICAgICAgcmV0dXJuIC1FSU5WQUw7
Cj4+PiAgIAo+Pj4gLSAgICAgICAgYXAybSA9IGQtPmFyY2guYWx0cDJtX3AybVthbHRwMm1faWR4
XTsKPj4+ICsgICAgICAgIGFwMm0gPSBkLT5hcmNoLmFsdHAybV9wMm1bYXJyYXlfaW5kZXhfbm9z
cGVjKGFsdHAybV9pZHgsIE1BWF9BTFRQMk0pXTsKPj4KPj4gLi4uIEkgZG9uJ3Qgc2VlIHdoeSB5
b3Ugc3RpbGwgZWZmZWN0aXZlbHkgb3Blbi1jb2RlIGl0IGhlcmUuCj4gCj4gSSBhbSBub3Qgc3Vy
ZSBJIGZvbGxvdyB5b3UgaGVyZSwgdGhhdCBpcyB3aGF0IHdlIGFncmVlZCBpbiB2NSAKPiAoaHR0
cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9hcmNoaXZlcy9odG1sL3hlbi1kZXZlbC8yMDE5LTEy
L21zZzAxNzA0Lmh0bWwpLiAKPiBEaWQgSSBtaXNzIHNvbWV0aGluZz8KCkluIGNvbnRleHQgdGhl
cmUgKGZyb20gYW4gZWFybGllciByZXBseSBvZiBtaW5lKSB5b3Ugd2lsbCBmaW5kIG1lCmhhdmlu
ZyBtZW50aW9uZWQgYXJyYXlfYWNjZXNzX25vc3BlYygpLiBUaGlzIHdhc24ndCBpbnZhbGlkYXRl
ZCBvcgpvdmVycmlkZGVuIGJ5IG15ICJZZXMsIHRoYXQncyBob3cgSSB0aGluayBpdCBvdWdodCB0
byBiZS4iIEkgZGlkbid0CnNheSBzbyBleHBsaWNpdGx5IChhZ2FpbikgYmVjYXVzZSB0byBtZSBp
dCBnb2VzIHdpdGhvdXQgc2F5aW5nIHRoYXQKb3Blbi1jb2RpbmcgX2FueXRoaW5nXyBpcywgaW4g
dGhlIGNvbW1vbiBjYXNlLCBiYWQgcHJhY3RpY2UuCgpKYW4KCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRl
dmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFp
bG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
