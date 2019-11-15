Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CF01FDE18
	for <lists+xen-devel@lfdr.de>; Fri, 15 Nov 2019 13:41:53 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iVasp-0008U1-14; Fri, 15 Nov 2019 12:39:27 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=j9+j=ZH=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iVasn-0008Tw-H4
 for xen-devel@lists.xenproject.org; Fri, 15 Nov 2019 12:39:25 +0000
X-Inumbo-ID: f3a5cee6-07a4-11ea-b678-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f3a5cee6-07a4-11ea-b678-bc764e2007e4;
 Fri, 15 Nov 2019 12:39:23 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id A7379AC4D;
 Fri, 15 Nov 2019 12:39:22 +0000 (UTC)
To: George Dunlap <george.dunlap@citrix.com>
References: <20191115105739.20333-1-george.dunlap@citrix.com>
 <ec3be412-f0a1-6e04-ba62-5f27a06ab8ad@suse.com>
 <5751f0af-610b-a21d-9a6a-8c64e38140ac@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <c1b1424f-382d-ffb3-6123-131312b2851c@suse.com>
Date: Fri, 15 Nov 2019 13:39:39 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <5751f0af-610b-a21d-9a6a-8c64e38140ac@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH RFC] x86: Add hack to disable "Fake HT" mode
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
Cc: Steven Haigh <netwiz@crc.id.au>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Andreas Kinzler <hfp@posteo.de>, IanJackson <ian.jackson@citrix.com>,
 Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTUuMTEuMjAxOSAxMjo1OCwgR2VvcmdlIER1bmxhcCB3cm90ZToKPiBPbiAxMS8xNS8xOSAx
MToxMiBBTSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+IE9uIDE1LjExLjIwMTkgMTE6NTcsIEdlb3Jn
ZSBEdW5sYXAgd3JvdGU6Cj4+PiAtLS0gYS90b29scy9saWJ4Yy94Y19jcHVpZF94ODYuYwo+Pj4g
KysrIGIvdG9vbHMvbGlieGMveGNfY3B1aWRfeDg2LmMKPj4+IEBAIC01NzksNTIgKzU3OSw2OCBA
QCBpbnQgeGNfY3B1aWRfYXBwbHlfcG9saWN5KHhjX2ludGVyZmFjZSAqeGNoLCB1aW50MzJfdCBk
b21pZCwKPj4+ICAgICAgfQo+Pj4gICAgICBlbHNlCj4+PiAgICAgIHsKPj4+IC0gICAgICAgIC8q
Cj4+PiAtICAgICAgICAgKiBUb3BvbG9neSBmb3IgSFZNIGd1ZXN0cyBpcyBlbnRpcmVseSBjb250
cm9sbGVkIGJ5IFhlbi4gIEZvciBub3csIHdlCj4+PiAtICAgICAgICAgKiBoYXJkY29kZSBBUElD
X0lEID0gdmNwdV9pZCAqIDIgdG8gZ2l2ZSB0aGUgaWxsdXNpb24gb2Ygbm8gU01ULgo+Pj4gLSAg
ICAgICAgICovCj4+PiAtICAgICAgICBwLT5iYXNpYy5odHQgPSB0cnVlOwo+Pj4gKyAgICAgICAg
cC0+YmFzaWMuaHR0ID0gZmFsc2U7Cj4+PiAgICAgICAgICBwLT5leHRkLmNtcF9sZWdhY3kgPSBm
YWxzZTsKPj4+ICAKPj4+IC0gICAgICAgIC8qCj4+PiAtICAgICAgICAgKiBMZWFmIDEgRUJYWzIz
OjE2XSBpcyBNYXhpbXVtIExvZ2ljYWwgUHJvY2Vzc29ycyBQZXIgUGFja2FnZS4KPj4+IC0gICAg
ICAgICAqIFVwZGF0ZSB0byByZWZsZWN0IHZMQVBJQ19JRCA9IHZDUFVfSUQgKiAyLCBidXQgbWFr
ZSBzdXJlIHRvIGF2b2lkCj4+PiAtICAgICAgICAgKiBvdmVyZmxvdy4KPj4+IC0gICAgICAgICAq
Lwo+Pj4gLSAgICAgICAgaWYgKCAhKHAtPmJhc2ljLmxwcHAgJiAweDgwKSApCj4+PiAtICAgICAg
ICAgICAgcC0+YmFzaWMubHBwcCAqPSAyOwo+Pj4gLQo+Pgo+PiBJIGFwcHJlY2lhdGUgeW91IHdh
bnRpbmcgdG8gcHV0IGFsbCBhZGp1c3RtZW50cyBpbiBhIGNlbnRyYWwgcGxhY2UsIGJ1dAo+PiBh
dCBsZWFzdCBpdCBtYWtlcyBwYXRjaCByZXZpZXcgbW9yZSBkaWZmaWN1bHQuIEhvdyBhYm91dCB5
b3UgbGF0Y2gKPj4gIWdldGVudigiWEVOX0xJQlhDX0RJU0FCTEVfRkFLRUhUIikgaW50byBhIGxv
Y2FsIGJvb2xlYW4gYXQgdGhlIHRvcCBvZgo+PiB0aGUgZnVuY3Rpb24gYW5kIHRoZW4gdGhlIGFi
b3ZlIHdvdWxkIGJlY29tZQo+Pgo+PiAgICAgICAgIGlmICggIShwLT5iYXNpYy5scHBwICYgMHg4
MCkgKQo+PiAgICAgICAgICAgICBwLT5iYXNpYy5scHBwIDw8PSBmYWtlaHQ7Cj4+Cj4+IGFuZCBl
LmcuIC4uLgo+Pgo+Pj4gICAgICAgICAgc3dpdGNoICggcC0+eDg2X3ZlbmRvciApCj4+PiAgICAg
ICAgICB7Cj4+PiAgICAgICAgICBjYXNlIFg4Nl9WRU5ET1JfSU5URUw6Cj4+PiAgICAgICAgICAg
ICAgZm9yICggaSA9IDA7IChwLT5jYWNoZS5zdWJsZWFmW2ldLnR5cGUgJiYKPj4+ICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIGkgPCBBUlJBWV9TSVpFKHAtPmNhY2hlLnJhdykpOyArK2kgKQo+
Pj4gICAgICAgICAgICAgIHsKPj4+IC0gICAgICAgICAgICAgICAgcC0+Y2FjaGUuc3VibGVhZltp
XS5jb3Jlc19wZXJfcGFja2FnZSA9Cj4+PiAtICAgICAgICAgICAgICAgICAgICAocC0+Y2FjaGUu
c3VibGVhZltpXS5jb3Jlc19wZXJfcGFja2FnZSA8PCAxKSB8IDE7Cj4+Cj4+IC4uLiB0aGlzCj4+
Cj4+ICAgICAgICAgICAgICAgICBwLT5jYWNoZS5zdWJsZWFmW2ldLmNvcmVzX3Blcl9wYWNrYWdl
ID0KPj4gICAgICAgICAgICAgICAgICAgICAocC0+Y2FjaGUuc3VibGVhZltpXS5jb3Jlc19wZXJf
cGFja2FnZSA8PCBmYWtlaHQpIHwgZmFrZWh0Owo+IAo+IEknbSBhZnJhaWQgSSB0aGluayB0aGUg
Y29kZSBpdHNlbGYgd291bGQgdGhlbiBiZWNvbWUgbW9yZSBkaWZmaWN1bHQgdG8KPiByZWFkOwoK
U2xpZ2h0bHksIGJ1dCB5ZXMuCgo+IGFuZCBpdCBzZWVtcyBhIGJpdCBzdHJhbmdlIHRvIGJlIGFy
Y2hpdGVjdGluZyBvdXIgY29kZSBiYXNlZCBvbgo+IGxpbWl0YXRpb25zIG9mIHRoZSBkaWZmIGFs
Z29yaXRobSBhbmQvb3IgZGlmZiB2aWV3ZXIgdXNlZC4KCkl0J3Mgbm90IGVudGlyZWx5IHVuY29t
bW9uIHRvIChhbHNvKSBjb25zaWRlciBob3cgdGhlIHJlc3VsdGluZwpkaWZmIHdvdWxkIGxvb2sg
bGlrZSB3aGVuIHB1dHRpbmcgdG9nZXRoZXIgYSBjaGFuZ2UuIEFuZCBiZXNpZGVzCnRoZSByZXZp
ZXcgYXNwZWN0LCB0aGVyZSdzIGFsc28gdGhlIGFyY2hlb2xvZ3kgb25lIC0gImdpdCBibGFtZSIK
eWllbGRzIG11Y2ggbW9yZSBoZWxwZnVsIHJlc3VsdHMgd2hlbiBjb2RlIGRvZXNuJ3QgZ2V0IG1v
dmVkCmFyb3VuZCBtb3JlIHRoYW4gbmVjZXNzYXJ5LiBCdXQgeWVzLCB0aGVyZSdzIG5vIHZlcnkg
Y2xlYXIgInRoaXMKaXMgdGhlIGJldHRlciBvcHRpb24iIGhlcmUuIEkndmUgdGFrZW4gYW5vdGhl
ciBsb29rIGF0IHRoZSBjb2RlCmJlZm9yZSB5b3VyIGNoYW5nZSB0aG91Z2ggLSBldmVyeXRoaW5n
IGlzIGFscmVhZHkgbmljZWx5IGluIG9uZQpwbGFjZSB3aXRoIEFuZHJldydzIG1vc3QgcmVjZW50
IGNvZGUgcmVvcmcuIFNvIEknbSBub3cgaGF2aW5nIGFuCmV2ZW4gaGFyZGVyIHRpbWUgc2VlaW5n
IHdoeSB5b3Ugd2FudCB0byBtb3ZlIHRoaW5ncyBhcm91bmQgYWdhaW4uCgpKYW4KCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5n
IGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJv
amVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
