Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A62110ACF5
	for <lists+xen-devel@lfdr.de>; Wed, 27 Nov 2019 10:55:14 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iZtzx-00028D-Oo; Wed, 27 Nov 2019 09:52:37 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=zCzl=ZT=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iZtzv-000288-JG
 for xen-devel@lists.xenproject.org; Wed, 27 Nov 2019 09:52:35 +0000
X-Inumbo-ID: a2c647de-10fb-11ea-a3af-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a2c647de-10fb-11ea-a3af-12813bfff9fa;
 Wed, 27 Nov 2019 09:52:34 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id B8E93B121;
 Wed, 27 Nov 2019 09:52:33 +0000 (UTC)
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <20191126132648.6917-1-roger.pau@citrix.com>
 <20191126132648.6917-3-roger.pau@citrix.com>
 <a6193850-7f1c-64c9-46b9-2319701e914b@suse.com>
 <20191126180225.GI980@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <25498dd7-308d-f4f4-2ea9-212d7d3defa4@suse.com>
Date: Wed, 27 Nov 2019 10:52:40 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <20191126180225.GI980@Air-de-Roger>
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

T24gMjYuMTEuMjAxOSAxOTowMiwgUm9nZXIgUGF1IE1vbm7DqSAgd3JvdGU6Cj4gT24gVHVlLCBO
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
Y3Rvcik7Cj4+Cj4+IC4uLiBvciBoZXJlPyBJIGFzayBub3Qgb25seSBiZWNhdXNlIHRoZSBmdW5j
dGlvbiBpc24ndCBleGFjdGx5Cj4+IGNoZWFwIHRvIGNhbGwgKGFzIGlpcmMgeW91IGRpZCBhbHNv
IG1lbnRpb24gZHVyaW5nIHRoZSB2Mgo+PiBkaXNjdXNzaW9uKSwgYnV0IGFsc28gYmVjYXVzZSBv
ZiBpdHMgaW50ZXJhY3Rpb24gd2l0aCBWaXJpZGlhbgo+PiBhbmQgbmVzdGVkIG1vZGUuIEluIGNh
c2Ugb2YgcHJvYmxlbXMgdGhlcmUsIGF2b2lkaW5nIHRoZSB1c2UKPj4gb2YgaW50ZXJydXB0IHBv
c3Rpbmcgd291bGQgYmUgYSB3b3JrYXJvdW5kIGluIHN1Y2ggY2FzZXMgdGhlbi4KPiAKPiBUQkgg
bXkgcHJlZmVyZW5jZSB3YXMgdG8gZG8gdGhlIFBJUiB0byBJUlIgc3luYyBpbiB2bXhfaW50cl9h
c3Npc3QgYnkKPiBkaXJlY3RseSBjYWxsaW5nIHZteF9zeW5jX3Bpcl90b19pcnIgYmVjYXVzZSBp
dCB3YXMgSU1PIGxlc3MgaW50cnVzaXZlCj4gYW5kIGNvbmZpbmVkIHRvIFZNWCBjb2RlLiBJIHRo
aW5rIHRoaXMgYXBwcm9hY2ggaXMgbW9yZSByaXNreSBhcwo+IHZsYXBpY19oYXNfcGVuZGluZ19p
cnEgZG9lcyB3YXkgbW9yZSB0aGFuIHNpbXBseSBzeW5jaW5nIFBJUiB0byBJUlIuCgpDb25maW5p
bmcgdG8gVk1YIGNvZGUgbWF5IGluZGVlZCBtYWtlIHNlbnNlIGFzIGxvbmcgYXMgd2UgZG9uJ3QK
c3VwcG9ydCB0aGUgU1ZNIGVxdWl2YWxlbnQsIGJ1dCBmcm9tIGFuIGFic3RyYWN0IHBvdiBzdWNo
IHN5bmNpbmcKd2lsbCBsaWtlbHkgbmVlZCB0byBoYXBwZW4gaW4gYSB2ZW5kb3IgbmV1dHJhbCB3
YXkuIEluIGFueSBldmVudCwKaWYgdGhlIFZNWCBtYWludGFpbmVycyBwcmVmZXIgdGhlIG90aGVy
IHBsYWNlbWVudCwgc28gYmUgaXQuCgpKYW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3Rz
LnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0
aW5mby94ZW4tZGV2ZWw=
