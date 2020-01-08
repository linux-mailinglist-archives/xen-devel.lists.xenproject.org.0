Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BC1C61340B6
	for <lists+xen-devel@lfdr.de>; Wed,  8 Jan 2020 12:41:42 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ip9fa-0005oa-SN; Wed, 08 Jan 2020 11:38:38 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=jtyv=25=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1ip9fZ-0005oV-Fm
 for xen-devel@lists.xenproject.org; Wed, 08 Jan 2020 11:38:37 +0000
X-Inumbo-ID: 681f4c4e-320b-11ea-b7b3-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 681f4c4e-320b-11ea-b7b3-12813bfff9fa;
 Wed, 08 Jan 2020 11:38:36 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id A4B3DABED;
 Wed,  8 Jan 2020 11:38:35 +0000 (UTC)
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <20200106155423.9508-1-andrew.cooper3@citrix.com>
 <20200106155423.9508-5-andrew.cooper3@citrix.com>
 <3601fa20-ba6a-78d6-62a2-a204ee49021e@suse.com>
 <cfee6317-36dc-05d6-1887-da0a5ce9428f@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <38cdc276-d41a-9e79-3f0a-8836ebe9a125@suse.com>
Date: Wed, 8 Jan 2020 12:38:34 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <cfee6317-36dc-05d6-1887-da0a5ce9428f@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 4/6] x86/boot: Clean up l?_bootmap[]
 construction
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
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDcuMDEuMjAyMCAxOTowMCwgQW5kcmV3IENvb3BlciB3cm90ZToKPiBPbiAwNy8wMS8yMDIw
IDE2OjE2LCBKYW4gQmV1bGljaCB3cm90ZToKPj4gT24gMDYuMDEuMjAyMCAxNjo1NCwgQW5kcmV3
IENvb3BlciB3cm90ZToKPj4+ICAgICAgZm9yICggaSA9IDA7IGkgPCA4OyArK2kgKQo+Pj4gICAg
ICB7Cj4+PiAgICAgICAgICB1bnNpZ25lZCBpbnQgc2xvdCA9ICh4ZW5fcGh5c19zdGFydCA+PiBM
Ml9QQUdFVEFCTEVfU0hJRlQpICsgaTsKPj4+ICAgICAgICAgIHBhZGRyX3QgYWRkciA9IHNsb3Qg
PDwgTDJfUEFHRVRBQkxFX1NISUZUOwo+Pj4gIAo+Pj4gICAgICAgICAgbDJfaWRlbnRtYXBbc2xv
dF0gPSBsMmVfZnJvbV9wYWRkcihhZGRyLCBQQUdFX0hZUEVSVklTT1J8X1BBR0VfUFNFKTsKPj4+
IC0gICAgICAgIHNsb3QgJj0gTDJfUEFHRVRBQkxFX0VOVFJJRVMgLSAxOwo+Pj4gICAgICAgICAg
bDJfYm9vdG1hcFtzbG90XSA9IGwyZV9mcm9tX3BhZGRyKGFkZHIsIF9fUEFHRV9IWVBFUlZJU09S
fF9QQUdFX1BTRSk7Cj4+PiAgICAgIH0KPj4+IC0gICAgLyogSW5pdGlhbGlzZSBMMyBib290LW1h
cCBwYWdlIGRpcmVjdG9yeSBlbnRyaWVzLiAqLwo+Pj4gLSAgICBsM19ib290bWFwW2wzX3RhYmxl
X29mZnNldCh4ZW5fcGh5c19zdGFydCldID0KPj4+IC0gICAgICAgIGwzZV9mcm9tX3BhZGRyKChV
SU5UTilsMl9ib290bWFwLCBfX1BBR0VfSFlQRVJWSVNPUik7Cj4+PiAtICAgIGwzX2Jvb3RtYXBb
bDNfdGFibGVfb2Zmc2V0KHhlbl9waHlzX3N0YXJ0ICsgKDggPDwgTDJfUEFHRVRBQkxFX1NISUZU
KSAtIDEpXSA9Cj4+PiAtICAgICAgICBsM2VfZnJvbV9wYWRkcigoVUlOVE4pbDJfYm9vdG1hcCwg
X19QQUdFX0hZUEVSVklTT1IpOwo+Pj4gKwo+Pj4gKyAgICAvKiBJbml0aWFsaXplIEwzIGJvb3Qt
bWFwIHBhZ2UgZGlyZWN0b3J5IGVudHJpZXMuICovCj4+PiArICAgIGZvciAoIGkgPSAwOyBpIDwg
NDsgKytpICkKPj4+ICsgICAgICAgIGwzX2Jvb3RtYXBbaV0gPSBsM2VfZnJvbV9wYWRkcigoVUlO
VE4pbDJfYm9vdG1hcCArIGkgKiBQQUdFX1NJWkUsCj4+PiArICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgX19QQUdFX0hZUEVSVklTT1IpOwo+PiBUaGUgaWRlYSBiZWhpbmQg
dGhlIG9yaWdpbmFsIGNvZGUgd2FzIHRvIGJlIGltbXVuZSB0byB0aGUgbnVtYmVyCj4+IG9mIHBh
Z2VzIGwyX2Jvb3RtYXBbXSBjb3ZlcnMsIGFzIGxvbmcgYXMgaXQncyBhdCBsZWFzdCBvbmUgKHdo
aWNoCj4+IGl0J2xsIGFsd2F5cyBiZSwgSSB3b3VsZCBzYXkpLiBUaGUgbWluaW11bSByZXF1aXJl
bWVudCB0byBhbnkKPj4gY2hhbmdlIHRvIHRoaXMgSSBoYXZlIGlzIHRoYXQgdGhlIGJ1aWxkIG11
c3QgYnJlYWsgaWYgdGhlIHNpemUKPj4gYXNzdW1wdGlvbiBoZXJlIGlzIHZpb2xhdGVkLiBJLmUu
IHRoZXJlIG1heSBub3QgYmUgYSBsaXRlcmFsIDQgYXMKPj4gdGhlIHVwcGVyIGxvb3AgYm91bmQg
aGVyZSwgb3IgdGhlcmUgd291bGQgbmVlZCB0byBiZSBhCj4+IEJVSUxEX0JVR19PTigpIHJpZ2h0
IG5leHQgdG8gaXQuIEJ1dCBJJ2QgcmVhbGx5IHByZWZlciBpZiB0aGUKPj4gY29kZSB3YXMgbGVm
dCBhcyBpcyAocGVyaGFwcyB3aXRoIGEgY29tbWVudCBhZGRlZCksIHVubGVzcyB5b3UKPj4gY2Fu
IHBvaW50IG91dCBhY3R1YWwgaXNzdWVzIHdpdGggaXQgKHdoaWNoIEkgY2FuJ3Qgc2VlIGluIHRo
ZQo+PiBkZXNjcmlwdGlvbiksIG9yIHlvdSBjYW4gb3RoZXJ3aXNlIGp1c3RpZnkgdGhlIGNoYW5n
ZSB3aXRoIGJldHRlcgo+PiB0aGFuICJ0aGUgRUZJIHNpZGUgaXMgZnVydGhlciBjb21wbGljYXRl
ZCBieSBzcHJheWluZyBub24taWRlbnRpdHkKPj4gYWxpYXNlcyBpbnRvIHRoZSBtaXguIgo+IAo+
IEdpdmVuIHRoYXQgd2hhdCB5b3UgZGVzY3JpYmUgaGVyZSBpcyB0b3RhbGx5IHVuZG9jdW1lbnRl
ZCwgYW5kIEFGQUlDVCwKPiB0b3RhbGx5IHVuZGVzY3JpYmVkIGV2ZW4gaW4gY29tbWl0IG1lc3Nh
Z2VzLCBpdCBoYXMgY29zdCBtZSBwcm9iYWJseSBhCj4gd2Vla3Mgd29ydGggb2YgdGltZSB0byBy
ZXZlcnNlIHRvIHRoZSBwb2ludCBhdCB3aGljaCBJIHdhcyBjb25maWRlbnQKPiB0aGF0IEkga25l
dyBhbGwgb2Ygd2hhdCBpdCB3YXMgYXR0ZW1wdGluZyB0byBkby4KClRoaXMgaXMgbm90IG1lYW50
IGFzIGFuIGV4Y3VzZSAoSSByZWFsbHkgc2hvdWxkIGhhdmUgZG9uZSBiZXR0ZXIgYmFjawp0aGVu
KSwgYnV0IHlvdSBjb3VsZCBoYXZlIGFza2VkLgoKPiBUaGUgcHVycG9zZSBvZiB0aGlzIHdhcyB0
byBtYWtlIHRoZSBoYW5kbGluZyBvZiBsP19ib290bWFwW10gYXMKPiBjb25zaXN0ZW50IGFzIHBv
c3NpYmxlIGJldHdlZW4gdGhlIHZhcmlvdXMgZW52aXJvbm1lbnRzLsKgIFRoZSBwYWdldGFibGVz
Cj4gdGhlbXNlbHZlcyBhcmUgY29tbW9uLCBhbmQgc2hvdWxkIGJlIHVzZWQgY29uc2lzdGVudGx5
LgoKSSBkb24ndCB0aGluayBJIGNhbiB3aG9sZWhlYXJ0ZWRseSBhZ3JlZSBoZXJlOiBsP19ib290
bWFwW10gYXJlCnRocm93LWF3YXkgcGFnZSB0YWJsZXMgKGxpdmluZyBpbiAuaW5pdCksIGFuZCB3
aXRoIHRoZSBub24tRUZJIGFuZApFRkkgYm9vdCBwYXRocyBiZWluZyBzbyBkaWZmZXJlbnQgYW55
d2F5LCB0aGVtIHVzaW5nIHRoZSBhdmFpbGFibGUKdGFibGVzIGRpZmZlcmVudGx5IGlzIG5vdCBh
IGJpZyBpc3N1ZSBpbW8uIFRoaXMgaGVhdnkgZGlmZmVyZW5jZSBvZgpvdGhlciBhc3BlY3RzIHdh
cyBhbHNvIHdoeSBiYWNrIHRoZW4gSSBkZWNpZGVkIHRvIGJlIGFzIGRlZmVuc2l2ZQp0b3dhcmRz
IGwyX2Jvb3RtYXBbXSBzaXplIGNoYW5nZXMgYXMgcG9zc2libGUgaW4gY29kZSB3aGljaCBkb2Vz
bid0CnJlYWxseSBuZWVkIGl0IHRvIGJlIG11bHRpcGxlIHBhZ2VzLgoKQXMgc2FpZCAtIEknbSBn
b2luZyB0byB0cnkgdG8gbm90IHN0YW5kIGluIHRoZSB3YXkgb2YgeW91IHJlLQphcnJhbmdpbmcg
dGhpcywgYnV0Ci0gdGhlIG5ldyBjb2RlIHNob3VsZCBub3QgYnJlYWsgc2lsZW50bHkgd2hlbiAo
aW4gcGFydGljdWxhcikKICBsMl9ib290bWFwW10gY2hhbmdlcwotIHRoZSBkZXNjcmlwdGlvbiBz
aG91bGQgYmUgbW9yZSBleHBsaWNpdCBhYm91dCB0aGUgbW90aXZhdGlvbiBvZgogIHRoZSBjaGFu
Z2UgKHdoaWNoIGluY2x1ZGVzIGRpc3Rpbmd1aXNoaW5nIGJldHdlZW4gaW50ZW50aW9uYWwKICBt
YXBwaW5ncyBhbmQgb25lcyBzaW1wbHkgYXBwZWFyaW5nIGFzIGEgc2lkZSBlZmZlY3QsIHdpdGhv
dXQKICBnZXR0aW5nIGluIHRoZSB3YXkpCgpKYW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxp
c3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby94ZW4tZGV2ZWw=
