Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C3E5513DF90
	for <lists+xen-devel@lfdr.de>; Thu, 16 Jan 2020 17:06:45 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1is7c8-0008NB-1j; Thu, 16 Jan 2020 16:03:20 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=J9Dq=3F=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1is7c6-0008N4-JY
 for xen-devel@lists.xenproject.org; Thu, 16 Jan 2020 16:03:18 +0000
X-Inumbo-ID: b0c62f20-3879-11ea-ac27-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b0c62f20-3879-11ea-ac27-bc764e2007e4;
 Thu, 16 Jan 2020 16:03:10 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 59903B2601;
 Thu, 16 Jan 2020 16:03:09 +0000 (UTC)
To: Tamas K Lengyel <tamas.k.lengyel@gmail.com>
References: <cover.1578503483.git.tamas.lengyel@intel.com>
 <199ba3c6fbe8f3de3b1513f70c5ea77f67aa2b42.1578503483.git.tamas.lengyel@intel.com>
 <845a06c6-478d-fe76-1954-2ddb7333bd89@suse.com>
 <CABfawh=+JigDvOYi19eDHx+1o4jeBtcXkH-sE1AqO29j9AChDQ@mail.gmail.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <c3df7d7e-a196-70b0-d186-87ee22fcdf4a@suse.com>
Date: Thu, 16 Jan 2020 17:03:10 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <CABfawh=+JigDvOYi19eDHx+1o4jeBtcXkH-sE1AqO29j9AChDQ@mail.gmail.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v4 05/18] x86/mem_sharing: don't try to
 unshare twice during page fault
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Tamas K Lengyel <tamas.lengyel@intel.com>,
 Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTYuMDEuMjAyMCAxNjo1OSwgVGFtYXMgSyBMZW5neWVsIHdyb3RlOgo+IE9uIFRodSwgSmFu
IDE2LCAyMDIwIGF0IDc6NTUgQU0gSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPiB3cm90
ZToKPj4KPj4gT24gMDguMDEuMjAyMCAxODoxNCwgVGFtYXMgSyBMZW5neWVsIHdyb3RlOgo+Pj4g
QEAgLTE3MDIsMTEgKzE3MDMsMTQgQEAgaW50IGh2bV9oYXBfbmVzdGVkX3BhZ2VfZmF1bHQocGFk
ZHJfdCBncGEsIHVuc2lnbmVkIGxvbmcgZ2xhLAo+Pj4gICAgICBzdHJ1Y3QgZG9tYWluICpjdXJy
ZCA9IGN1cnItPmRvbWFpbjsKPj4+ICAgICAgc3RydWN0IHAybV9kb21haW4gKnAybSwgKmhvc3Rw
Mm07Cj4+PiAgICAgIGludCByYywgZmFsbF90aHJvdWdoID0gMCwgcGFnZWQgPSAwOwo+Pj4gLSAg
ICBpbnQgc2hhcmluZ19lbm9tZW0gPSAwOwo+Pj4gICAgICB2bV9ldmVudF9yZXF1ZXN0X3QgKnJl
cV9wdHIgPSBOVUxMOwo+Pj4gICAgICBib29sIHN5bmMgPSBmYWxzZTsKPj4+ICAgICAgdW5zaWdu
ZWQgaW50IHBhZ2Vfb3JkZXI7Cj4+Pgo+Pj4gKyNpZmRlZiBDT05GSUdfTUVNX1NIQVJJTkcKPj4+
ICsgICAgYm9vbCBzaGFyaW5nX2Vub21lbSA9IGZhbHNlOwo+Pj4gKyNlbmRpZgo+Pgo+PiBUbyBy
ZWR1Y2UgI2lmZGVmLWFyeSwgY291bGQgeW91IGxlYXZlIHRoaXMgYWxvbmUgKG9yIGNvbnZlcnQg
dG8KPj4gYm9vbCBpbiBwbGFjZSwgd2l0aG91dCAjaWZkZWYpIGFuZCAuLi4KPj4KPj4+IEBAIC0x
OTU1LDE5ICsxOTYxLDIxIEBAIGludCBodm1faGFwX25lc3RlZF9wYWdlX2ZhdWx0KHBhZGRyX3Qg
Z3BhLCB1bnNpZ25lZCBsb25nIGdsYSwKPj4+ICAgICAgICovCj4+PiAgICAgIGlmICggcGFnZWQg
KQo+Pj4gICAgICAgICAgcDJtX21lbV9wYWdpbmdfcG9wdWxhdGUoY3VycmQsIGdmbik7Cj4+PiAr
Cj4+PiArI2lmZGVmIENPTkZJR19NRU1fU0hBUklORwo+Pj4gICAgICBpZiAoIHNoYXJpbmdfZW5v
bWVtICkKPj4+ICAgICAgewo+Pj4gLSAgICAgICAgaW50IHJ2Owo+Pj4gLQo+Pj4gLSAgICAgICAg
aWYgKCAocnYgPSBtZW1fc2hhcmluZ19ub3RpZnlfZW5vbWVtKGN1cnJkLCBnZm4sIHRydWUpKSA8
IDAgKQo+Pj4gKyAgICAgICAgaWYgKCAhdm1fZXZlbnRfY2hlY2tfcmluZyhjdXJyZC0+dm1fZXZl
bnRfc2hhcmUpICkKPj4+ICAgICAgICAgIHsKPj4+IC0gICAgICAgICAgICBnZHByaW50ayhYRU5M
T0dfRVJSLCAiRG9tYWluICVodSBhdHRlbXB0IHRvIHVuc2hhcmUgIgo+Pj4gLSAgICAgICAgICAg
ICAgICAgICAgICJnZm4gJWx4LCBFTk9NRU0gYW5kIG5vIGhlbHBlciAocmMgJWQpXG4iLAo+Pj4g
LSAgICAgICAgICAgICAgICAgICAgIGN1cnJkLT5kb21haW5faWQsIGdmbiwgcnYpOwo+Pj4gKyAg
ICAgICAgICAgIGdwcmludGsoWEVOTE9HX0VSUiwgIkRvbWFpbiAlcGQgYXR0ZW1wdCB0byB1bnNo
YXJlICIKPj4+ICsgICAgICAgICAgICAgICAgICAgICJnZm4gJWx4LCBFTk9NRU0gYW5kIG5vIGhl
bHBlclxuIiwKPj4+ICsgICAgICAgICAgICAgICAgICAgIGN1cnJkLCBnZm4pOwo+Pj4gICAgICAg
ICAgICAgIC8qIENyYXNoIHRoZSBkb21haW4gKi8KPj4+ICAgICAgICAgICAgICByYyA9IDA7Cj4+
PiAgICAgICAgICB9Cj4+PiAgICAgIH0KPj4+ICsjZW5kaWYKPj4KPj4gLi4uIG1vdmUgdGhlICNp
ZmRlZiBpbnNpZGUgdGhlIGJyYWNlcyBoZXJlPyBXaXRoIHRoaXMKPj4gQWNrZWQtYnk6IEphbiBC
ZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KPiAKPiBTR1RNLCBJIGFzc3VtZSB5b3UgYXJlIGNv
dW50aW5nIG9uIHRoZSBjb21waWxlciB0byBqdXN0IGdldCByaWQgb2YgdGhlCj4gdmFyaWFibGUg
d2hlbiBpdCBzZWVzIGl0cyBuZXZlciB1c2VkPwoKWWVzIChhbmQgZm9yIHVuLW9wdGltaXplZCBj
b2RlIGl0IGRvZXNuJ3QgbWF0dGVyKS4KCkphbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlz
dHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL3hlbi1kZXZlbA==
