Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CF7310B292
	for <lists+xen-devel@lfdr.de>; Wed, 27 Nov 2019 16:41:54 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iZzPO-0000uG-Kz; Wed, 27 Nov 2019 15:39:14 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=zCzl=ZT=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iZzPM-0000uB-Uk
 for xen-devel@lists.xenproject.org; Wed, 27 Nov 2019 15:39:12 +0000
X-Inumbo-ID: 0f272f80-112c-11ea-a3b8-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 0f272f80-112c-11ea-a3b8-12813bfff9fa;
 Wed, 27 Nov 2019 15:39:12 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 43B71B34A;
 Wed, 27 Nov 2019 15:39:11 +0000 (UTC)
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <20191126132648.6917-1-roger.pau@citrix.com>
 <20191126132648.6917-3-roger.pau@citrix.com>
 <a6193850-7f1c-64c9-46b9-2319701e914b@suse.com>
 <20191127112236.GP980@Air-de-Roger>
 <f2a51992-e507-dd32-12c9-2fda3d5431fc@suse.com>
 <20191127115629.GS980@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <c8916065-186b-b64b-5415-c532543e5ffa@suse.com>
Date: Wed, 27 Nov 2019 16:39:17 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <20191127115629.GS980@Air-de-Roger>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH for-4.13 v3 2/2] x86/vmx: always sync PIR to
 IRR before vmentry
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
Cc: Juergen Gross <jgross@suse.com>, KevinTian <kevin.tian@intel.com>,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Joe Jin <joe.jin@oracle.com>, Jun Nakajima <jun.nakajima@intel.com>,
 xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjcuMTEuMjAxOSAxMjo1NiwgUm9nZXIgUGF1IE1vbm7DqSAgd3JvdGU6Cj4gT24gV2VkLCBO
b3YgMjcsIDIwMTkgYXQgMTI6MzA6MDZQTSArMDEwMCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+IE9u
IDI3LjExLjIwMTkgMTI6MjIsIFJvZ2VyIFBhdSBNb25uw6kgIHdyb3RlOgo+Pj4gT24gVHVlLCBO
b3YgMjYsIDIwMTkgYXQgMDU6NTA6MzJQTSArMDEwMCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4g
T24gMjYuMTEuMjAxOSAxNDoyNiwgUm9nZXIgUGF1IE1vbm5lIHdyb3RlOgo+Pj4+PiAtLS0gYS94
ZW4vYXJjaC94ODYvaHZtL2lycS5jCj4+Pj4+ICsrKyBiL3hlbi9hcmNoL3g4Ni9odm0vaXJxLmMK
Pj4+Pj4gQEAgLTUxNSw3ICs1MTUsMTEgQEAgdm9pZCBodm1fc2V0X2NhbGxiYWNrX3ZpYShzdHJ1
Y3QgZG9tYWluICpkLCB1aW50NjRfdCB2aWEpCj4+Pj4+ICBzdHJ1Y3QgaHZtX2ludGFjayBodm1f
dmNwdV9oYXNfcGVuZGluZ19pcnEoc3RydWN0IHZjcHUgKnYpCj4+Pj4+ICB7Cj4+Pj4+ICAgICAg
c3RydWN0IGh2bV9kb21haW4gKnBsYXQgPSAmdi0+ZG9tYWluLT5hcmNoLmh2bTsKPj4+Pj4gLSAg
ICBpbnQgdmVjdG9yOwo+Pj4+PiArICAgIC8qCj4+Pj4+ICsgICAgICogQWx3YXlzIGNhbGwgdmxh
cGljX2hhc19wZW5kaW5nX2lycSBzbyB0aGF0IFBJUiBpcyBzeW5jZWQgaW50byBJUlIgd2hlbgo+
Pj4+PiArICAgICAqIHVzaW5nIHBvc3RlZCBpbnRlcnJ1cHRzLgo+Pj4+PiArICAgICAqLwo+Pj4+
PiArICAgIGludCB2ZWN0b3IgPSB2bGFwaWNfaGFzX3BlbmRpbmdfaXJxKHYpOwo+Pj4+Cj4+Pj4g
RGlkIHlvdSBjb25zaWRlciBkb2luZyB0aGlzIGNvbmRpdGlvbmFsbHkgZWl0aGVyIGhlcmUgLi4u
Cj4+Pj4KPj4+Pj4gQEAgLTUzMCw3ICs1MzQsNiBAQCBzdHJ1Y3QgaHZtX2ludGFjayBodm1fdmNw
dV9oYXNfcGVuZGluZ19pcnEoc3RydWN0IHZjcHUgKnYpCj4+Pj4+ICAgICAgaWYgKCB2bGFwaWNf
YWNjZXB0X3BpY19pbnRyKHYpICYmIHBsYXQtPnZwaWNbMF0uaW50X291dHB1dCApCj4+Pj4+ICAg
ICAgICAgIHJldHVybiBodm1faW50YWNrX3BpYygwKTsKPj4+Pj4gIAo+Pj4+PiAtICAgIHZlY3Rv
ciA9IHZsYXBpY19oYXNfcGVuZGluZ19pcnEodik7Cj4+Pj4+ICAgICAgaWYgKCB2ZWN0b3IgIT0g
LTEgKQo+Pj4+PiAgICAgICAgICByZXR1cm4gaHZtX2ludGFja19sYXBpYyh2ZWN0b3IpOwo+Pj4+
Cj4+Pj4gLi4uIG9yIGhlcmU/Cj4+Pgo+Pj4gSSdtIGFmcmFpZCBJIGRvbid0IGZvbGxvdy4gVGhl
IHdob2xlIHBvaW50IG9mIHRoaXMgY2hhbmdlIGlzIHRvIGVuc3VyZQo+Pj4gdmxhcGljX2hhc19w
ZW5kaW5nX2lycSBpcyB1bmNvbmRpdGlvbmFsbHkgY2FsbGVkIGluCj4+PiBodm1fdmNwdV9oYXNf
cGVuZGluZ19pcnEsIHNvIEknbSBub3Qgc3VyZSB3aGF0IHlvdSBtZWFuIGJ5ICJkb2luZyB0aGlz
Cj4+PiBjb25kaXRpb25hbGx5Li4uIi4KPj4KPj4gRG8gaXQgZWFybHkgd2hlbiB1c2luZyBpbnRl
cnJ1cHQgcG9zdGluZywgYW5kIGtlZXAgaXQgaW4gaXRzCj4+IGN1cnJlbnQgcGxhY2Ugb3RoZXJ3
aXNlLgo+Pgo+Pj4+IEkgYXNrIG5vdCBvbmx5IGJlY2F1c2UgdGhlIGZ1bmN0aW9uIGlzbid0IGV4
YWN0bHkKPj4+PiBjaGVhcCB0byBjYWxsIChhcyBpaXJjIHlvdSBkaWQgYWxzbyBtZW50aW9uIGR1
cmluZyB0aGUgdjIKPj4+PiBkaXNjdXNzaW9uKSwgYnV0IGFsc28gYmVjYXVzZSBvZiBpdHMgaW50
ZXJhY3Rpb24gd2l0aCBWaXJpZGlhbgo+Pj4+IGFuZCBuZXN0ZWQgbW9kZS4gSW4gY2FzZSBvZiBw
cm9ibGVtcyB0aGVyZSwgYXZvaWRpbmcgdGhlIHVzZQo+Pj4+IG9mIGludGVycnVwdCBwb3N0aW5n
IHdvdWxkIGJlIGEgd29ya2Fyb3VuZCBpbiBzdWNoIGNhc2VzIHRoZW4uCj4+Pgo+Pj4gV291bGQg
eW91IGxpa2UgbWUgdG8gZXhwb3J0IHNvbWV0aGluZyBsaWtlIHZsYXBpY19zeW5jX3Bpcl90b19p
cnIgYW5kCj4+PiBjYWxsIGl0IHVuY29uZGl0aW9uYWxseSBpbnN0ZWFkIG9mIGNhbGxpbmcgdmxh
cGljX2hhc19wZW5kaW5nX2lycT8KPj4KPj4gVGhpcyBsb29rcyB0byBiZSBhbm90aGVyIG9wdGlv
biwgeWVzLiBBbGJlaXQgaW5zdGVhZCBvZiBtYWtpbmcKPj4gbm9uLXN0YXRpYyAod2hpY2ggSSBh
c3N1bWUgaXMgd2hhdCB5b3UgbWVhbiBieSAiZXhwb3J0IiksIG1heWJlCj4+IHNpbXBseSBtYWtl
IHRoaXMgYSBzdGF0aWMgaW5saW5lIGluIHZsYXBpYy5oIHRoZW4uCj4gCj4gWWVzLCB0aGF0IHdv
dWxkIHdvcmsgYW5kIElNTyBpcyBiZXR0ZXIgdGhhbiBtb3ZpbmcgdGhlIGNhbGwgdG8KPiB2bGFw
aWNfaGFzX3BlbmRpbmdfaXJxIGFyb3VuZC4gQXJlIHlvdSBPSyB3aXRoIHRoaXMgYXBwcm9hY2g/
CgpJIHRoaW5rIHNvLCB5ZXMuCgpKYW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhl
bnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5m
by94ZW4tZGV2ZWw=
