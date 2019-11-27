Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 21B5F10AEB9
	for <lists+xen-devel@lfdr.de>; Wed, 27 Nov 2019 12:32:26 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iZvWI-0003pJ-U7; Wed, 27 Nov 2019 11:30:06 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=zCzl=ZT=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iZvWG-0003al-L2
 for xen-devel@lists.xenproject.org; Wed, 27 Nov 2019 11:30:04 +0000
X-Inumbo-ID: 3f47c4f4-1109-11ea-a55d-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3f47c4f4-1109-11ea-a55d-bc764e2007e4;
 Wed, 27 Nov 2019 11:30:00 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id D3D55B239;
 Wed, 27 Nov 2019 11:29:59 +0000 (UTC)
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <20191126132648.6917-1-roger.pau@citrix.com>
 <20191126132648.6917-3-roger.pau@citrix.com>
 <a6193850-7f1c-64c9-46b9-2319701e914b@suse.com>
 <20191127112236.GP980@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <f2a51992-e507-dd32-12c9-2fda3d5431fc@suse.com>
Date: Wed, 27 Nov 2019 12:30:06 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <20191127112236.GP980@Air-de-Roger>
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

T24gMjcuMTEuMjAxOSAxMjoyMiwgUm9nZXIgUGF1IE1vbm7DqSAgd3JvdGU6Cj4gT24gVHVlLCBO
b3YgMjYsIDIwMTkgYXQgMDU6NTA6MzJQTSArMDEwMCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+IE9u
IDI2LjExLjIwMTkgMTQ6MjYsIFJvZ2VyIFBhdSBNb25uZSB3cm90ZToKPj4+IC0tLSBhL3hlbi9h
cmNoL3g4Ni9odm0vaXJxLmMKPj4+ICsrKyBiL3hlbi9hcmNoL3g4Ni9odm0vaXJxLmMKPj4+IEBA
IC01MTUsNyArNTE1LDExIEBAIHZvaWQgaHZtX3NldF9jYWxsYmFja192aWEoc3RydWN0IGRvbWFp
biAqZCwgdWludDY0X3QgdmlhKQo+Pj4gIHN0cnVjdCBodm1faW50YWNrIGh2bV92Y3B1X2hhc19w
ZW5kaW5nX2lycShzdHJ1Y3QgdmNwdSAqdikKPj4+ICB7Cj4+PiAgICAgIHN0cnVjdCBodm1fZG9t
YWluICpwbGF0ID0gJnYtPmRvbWFpbi0+YXJjaC5odm07Cj4+PiAtICAgIGludCB2ZWN0b3I7Cj4+
PiArICAgIC8qCj4+PiArICAgICAqIEFsd2F5cyBjYWxsIHZsYXBpY19oYXNfcGVuZGluZ19pcnEg
c28gdGhhdCBQSVIgaXMgc3luY2VkIGludG8gSVJSIHdoZW4KPj4+ICsgICAgICogdXNpbmcgcG9z
dGVkIGludGVycnVwdHMuCj4+PiArICAgICAqLwo+Pj4gKyAgICBpbnQgdmVjdG9yID0gdmxhcGlj
X2hhc19wZW5kaW5nX2lycSh2KTsKPj4KPj4gRGlkIHlvdSBjb25zaWRlciBkb2luZyB0aGlzIGNv
bmRpdGlvbmFsbHkgZWl0aGVyIGhlcmUgLi4uCj4+Cj4+PiBAQCAtNTMwLDcgKzUzNCw2IEBAIHN0
cnVjdCBodm1faW50YWNrIGh2bV92Y3B1X2hhc19wZW5kaW5nX2lycShzdHJ1Y3QgdmNwdSAqdikK
Pj4+ICAgICAgaWYgKCB2bGFwaWNfYWNjZXB0X3BpY19pbnRyKHYpICYmIHBsYXQtPnZwaWNbMF0u
aW50X291dHB1dCApCj4+PiAgICAgICAgICByZXR1cm4gaHZtX2ludGFja19waWMoMCk7Cj4+PiAg
Cj4+PiAtICAgIHZlY3RvciA9IHZsYXBpY19oYXNfcGVuZGluZ19pcnEodik7Cj4+PiAgICAgIGlm
ICggdmVjdG9yICE9IC0xICkKPj4+ICAgICAgICAgIHJldHVybiBodm1faW50YWNrX2xhcGljKHZl
Y3Rvcik7Cj4+Cj4+IC4uLiBvciBoZXJlPwo+IAo+IEknbSBhZnJhaWQgSSBkb24ndCBmb2xsb3cu
IFRoZSB3aG9sZSBwb2ludCBvZiB0aGlzIGNoYW5nZSBpcyB0byBlbnN1cmUKPiB2bGFwaWNfaGFz
X3BlbmRpbmdfaXJxIGlzIHVuY29uZGl0aW9uYWxseSBjYWxsZWQgaW4KPiBodm1fdmNwdV9oYXNf
cGVuZGluZ19pcnEsIHNvIEknbSBub3Qgc3VyZSB3aGF0IHlvdSBtZWFuIGJ5ICJkb2luZyB0aGlz
Cj4gY29uZGl0aW9uYWxseS4uLiIuCgpEbyBpdCBlYXJseSB3aGVuIHVzaW5nIGludGVycnVwdCBw
b3N0aW5nLCBhbmQga2VlcCBpdCBpbiBpdHMKY3VycmVudCBwbGFjZSBvdGhlcndpc2UuCgo+PiBJ
IGFzayBub3Qgb25seSBiZWNhdXNlIHRoZSBmdW5jdGlvbiBpc24ndCBleGFjdGx5Cj4+IGNoZWFw
IHRvIGNhbGwgKGFzIGlpcmMgeW91IGRpZCBhbHNvIG1lbnRpb24gZHVyaW5nIHRoZSB2Mgo+PiBk
aXNjdXNzaW9uKSwgYnV0IGFsc28gYmVjYXVzZSBvZiBpdHMgaW50ZXJhY3Rpb24gd2l0aCBWaXJp
ZGlhbgo+PiBhbmQgbmVzdGVkIG1vZGUuIEluIGNhc2Ugb2YgcHJvYmxlbXMgdGhlcmUsIGF2b2lk
aW5nIHRoZSB1c2UKPj4gb2YgaW50ZXJydXB0IHBvc3Rpbmcgd291bGQgYmUgYSB3b3JrYXJvdW5k
IGluIHN1Y2ggY2FzZXMgdGhlbi4KPiAKPiBXb3VsZCB5b3UgbGlrZSBtZSB0byBleHBvcnQgc29t
ZXRoaW5nIGxpa2UgdmxhcGljX3N5bmNfcGlyX3RvX2lyciBhbmQKPiBjYWxsIGl0IHVuY29uZGl0
aW9uYWxseSBpbnN0ZWFkIG9mIGNhbGxpbmcgdmxhcGljX2hhc19wZW5kaW5nX2lycT8KClRoaXMg
bG9va3MgdG8gYmUgYW5vdGhlciBvcHRpb24sIHllcy4gQWxiZWl0IGluc3RlYWQgb2YgbWFraW5n
Cm5vbi1zdGF0aWMgKHdoaWNoIEkgYXNzdW1lIGlzIHdoYXQgeW91IG1lYW4gYnkgImV4cG9ydCIp
LCBtYXliZQpzaW1wbHkgbWFrZSB0aGlzIGEgc3RhdGljIGlubGluZSBpbiB2bGFwaWMuaCB0aGVu
LgoKSmFuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpY
ZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRw
czovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
