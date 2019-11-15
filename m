Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F1A4FDC10
	for <lists+xen-devel@lfdr.de>; Fri, 15 Nov 2019 12:15:19 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iVZWu-0007GE-DU; Fri, 15 Nov 2019 11:12:44 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=j9+j=ZH=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iVZWs-0007G9-58
 for xen-devel@lists.xenproject.org; Fri, 15 Nov 2019 11:12:42 +0000
X-Inumbo-ID: d69fc632-0798-11ea-a265-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d69fc632-0798-11ea-a265-12813bfff9fa;
 Fri, 15 Nov 2019 11:12:41 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 1DBF1B2A6;
 Fri, 15 Nov 2019 11:12:40 +0000 (UTC)
To: George Dunlap <george.dunlap@citrix.com>
References: <20191115105739.20333-1-george.dunlap@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <ec3be412-f0a1-6e04-ba62-5f27a06ab8ad@suse.com>
Date: Fri, 15 Nov 2019 12:12:56 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <20191115105739.20333-1-george.dunlap@citrix.com>
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
 Andreas Kinzler <hfp@posteo.de>, Ian Jackson <ian.jackson@citrix.com>,
 Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTUuMTEuMjAxOSAxMTo1NywgR2VvcmdlIER1bmxhcCB3cm90ZToKPiBPcGVuIHF1ZXN0aW9u
czoKPiAKPiAtIElzIHRoaXMgdGhlIHJpZ2h0IHBsYWNlIHRvIHB1dCB0aGUgYGdldGVudmAgY2hl
Y2s/Cj4gCj4gLSBJcyB0aGVyZSBhbnkgd2F5IHdlIGNhbiBtYWtlIG1pZ3JhdGlvbiB3b3JrLCBh
dCBsZWFzdCBpbiBzb21lIGNhc2VzPwo+IAo+IC0gQ2FuIHdlIGNoZWNrIGZvciBrbm93bi1wcm9i
bGVtYXRpYyBtb2RlbHMsIGFuZCBhdCBsZWFzdCByZXBvcnQgYQo+ICAgbW9yZSB1c2VmdWwgZXJy
b3I/CgpDaGVja2luZyBmb3Igc3BlY2lmaWMgbW9kZWxzIHNob3VsZCBiZSBzdHJhaWdodGZvcndh
cmQsIGJ1dCBJIHdvbmRlcgpob3cgc2Vuc2libGUgaXQgaXMgdG8gY29tcGlsZSBhIGxpa2VseSBl
dmVyIGdyb3dpbmcgbGlzdCBpbnRvIGhlcmUuCgpBcyB0byB0aGUgcmVwb3J0aW5nIG9mIGFuIGVy
cm9yIC0geW91IHNheWluZyAibW9yZSB1c2VmdWwiIHN1Z2dlc3RzCnRoZXJlIGlzIHNvbWUgZXJy
b3IgYWxyZWFkeSBiZWluZyByZXBvcnRlZC4gQnV0IEkgZG9uJ3Qgc2VlIGFueSBoZXJlLApub3Ig
ZG9lcyBhbnkgY29tZSB0byBtaW5kLgoKPiAtLS0gYS90b29scy9saWJ4Yy94Y19jcHVpZF94ODYu
Ywo+ICsrKyBiL3Rvb2xzL2xpYnhjL3hjX2NwdWlkX3g4Ni5jCj4gQEAgLTU3OSw1MiArNTc5LDY4
IEBAIGludCB4Y19jcHVpZF9hcHBseV9wb2xpY3koeGNfaW50ZXJmYWNlICp4Y2gsIHVpbnQzMl90
IGRvbWlkLAo+ICAgICAgfQo+ICAgICAgZWxzZQo+ICAgICAgewo+IC0gICAgICAgIC8qCj4gLSAg
ICAgICAgICogVG9wb2xvZ3kgZm9yIEhWTSBndWVzdHMgaXMgZW50aXJlbHkgY29udHJvbGxlZCBi
eSBYZW4uICBGb3Igbm93LCB3ZQo+IC0gICAgICAgICAqIGhhcmRjb2RlIEFQSUNfSUQgPSB2Y3B1
X2lkICogMiB0byBnaXZlIHRoZSBpbGx1c2lvbiBvZiBubyBTTVQuCj4gLSAgICAgICAgICovCj4g
LSAgICAgICAgcC0+YmFzaWMuaHR0ID0gdHJ1ZTsKPiArICAgICAgICBwLT5iYXNpYy5odHQgPSBm
YWxzZTsKPiAgICAgICAgICBwLT5leHRkLmNtcF9sZWdhY3kgPSBmYWxzZTsKPiAgCj4gLSAgICAg
ICAgLyoKPiAtICAgICAgICAgKiBMZWFmIDEgRUJYWzIzOjE2XSBpcyBNYXhpbXVtIExvZ2ljYWwg
UHJvY2Vzc29ycyBQZXIgUGFja2FnZS4KPiAtICAgICAgICAgKiBVcGRhdGUgdG8gcmVmbGVjdCB2
TEFQSUNfSUQgPSB2Q1BVX0lEICogMiwgYnV0IG1ha2Ugc3VyZSB0byBhdm9pZAo+IC0gICAgICAg
ICAqIG92ZXJmbG93Lgo+IC0gICAgICAgICAqLwo+IC0gICAgICAgIGlmICggIShwLT5iYXNpYy5s
cHBwICYgMHg4MCkgKQo+IC0gICAgICAgICAgICBwLT5iYXNpYy5scHBwICo9IDI7Cj4gLQoKSSBh
cHByZWNpYXRlIHlvdSB3YW50aW5nIHRvIHB1dCBhbGwgYWRqdXN0bWVudHMgaW4gYSBjZW50cmFs
IHBsYWNlLCBidXQKYXQgbGVhc3QgaXQgbWFrZXMgcGF0Y2ggcmV2aWV3IG1vcmUgZGlmZmljdWx0
LiBIb3cgYWJvdXQgeW91IGxhdGNoCiFnZXRlbnYoIlhFTl9MSUJYQ19ESVNBQkxFX0ZBS0VIVCIp
IGludG8gYSBsb2NhbCBib29sZWFuIGF0IHRoZSB0b3Agb2YKdGhlIGZ1bmN0aW9uIGFuZCB0aGVu
IHRoZSBhYm92ZSB3b3VsZCBiZWNvbWUKCiAgICAgICAgaWYgKCAhKHAtPmJhc2ljLmxwcHAgJiAw
eDgwKSApCiAgICAgICAgICAgIHAtPmJhc2ljLmxwcHAgPDw9IGZha2VodDsKCmFuZCBlLmcuIC4u
LgoKPiAgICAgICAgICBzd2l0Y2ggKCBwLT54ODZfdmVuZG9yICkKPiAgICAgICAgICB7Cj4gICAg
ICAgICAgY2FzZSBYODZfVkVORE9SX0lOVEVMOgo+ICAgICAgICAgICAgICBmb3IgKCBpID0gMDsg
KHAtPmNhY2hlLnN1YmxlYWZbaV0udHlwZSAmJgo+ICAgICAgICAgICAgICAgICAgICAgICAgICAg
IGkgPCBBUlJBWV9TSVpFKHAtPmNhY2hlLnJhdykpOyArK2kgKQo+ICAgICAgICAgICAgICB7Cj4g
LSAgICAgICAgICAgICAgICBwLT5jYWNoZS5zdWJsZWFmW2ldLmNvcmVzX3Blcl9wYWNrYWdlID0K
PiAtICAgICAgICAgICAgICAgICAgICAocC0+Y2FjaGUuc3VibGVhZltpXS5jb3Jlc19wZXJfcGFj
a2FnZSA8PCAxKSB8IDE7CgouLi4gdGhpcwoKICAgICAgICAgICAgICAgIHAtPmNhY2hlLnN1Ymxl
YWZbaV0uY29yZXNfcGVyX3BhY2thZ2UgPQogICAgICAgICAgICAgICAgICAgIChwLT5jYWNoZS5z
dWJsZWFmW2ldLmNvcmVzX3Blcl9wYWNrYWdlIDw8IGZha2VodCkgfCBmYWtlaHQ7Cgo+ICsgICAg
ICAgICAgICAgICAgcC0+Y2FjaGUuc3VibGVhZltpXS5jb3Jlc19wZXJfcGFja2FnZSA9IDA7CgpU
aGlzIGRvZXNuJ3QgbG9vayBjb3JyZWN0IC0geW91IG5lZWQgdG8gbGVhdmUgYWxvbmUgdGhlIGZp
ZWxkIGlmCnRoZSBhZGp1c3RtZW50IG1vdmVkIGRvd24gaXMgc3VwcG9zZWQgdG8gaGF2ZSBhbnkg
ZWZmZWN0LiBUaGlzCmlzIGFuIGV4YW1wbGUgb2Ygd2h5IHRoZSBiaWdnZXIgY29kZSBtb3ZlbWVu
dCB5b3UgZG8gaXMgcmlza3kuCgpKYW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhl
bnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5m
by94ZW4tZGV2ZWw=
