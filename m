Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BFE9012463D
	for <lists+xen-devel@lfdr.de>; Wed, 18 Dec 2019 12:55:14 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ihXt6-0003Vk-DH; Wed, 18 Dec 2019 11:53:08 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=nDAh=2I=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1ihXt5-0003Vb-1f
 for xen-devel@lists.xenproject.org; Wed, 18 Dec 2019 11:53:07 +0000
X-Inumbo-ID: f0ff34be-218c-11ea-9066-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f0ff34be-218c-11ea-9066-12813bfff9fa;
 Wed, 18 Dec 2019 11:53:01 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id B23BFB2D8;
 Wed, 18 Dec 2019 11:53:00 +0000 (UTC)
To: Sergey Kovalev <valor@list.ru>
References: <a7ab0db0-9c2f-9ba7-75dc-d0741a6c53ca@list.ru>
 <b9686b82-0e33-1b1f-3de6-0a61b1e2f186@suse.com>
 <46baecae-0a10-c74a-f44d-e5935588b277@list.ru>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <49912800-6dd4-b812-8580-d228fd733a22@suse.com>
Date: Wed, 18 Dec 2019 12:53:28 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <46baecae-0a10-c74a-f44d-e5935588b277@list.ru>
Content-Language: en-US
Subject: Re: [Xen-devel] [XEN PATCH v2] x86/vm_event: add short-circuit for
 breakpoints (aka, "fast single step")
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
Cc: Petre Pircalabu <ppircalabu@bitdefender.com>,
 Tamas K Lengyel <tamas@tklengyel.com>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Alexandru Isaila <aisaila@bitdefender.com>, xen-devel@lists.xenproject.org,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTguMTIuMjAxOSAxMjozNCwgU2VyZ2V5IEtvdmFsZXYgd3JvdGU6Cj4gT24gMTguMTIuMjAx
OSAxMzo1NSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+IE9uIDE4LjEyLjIwMTkgMDY6NTMsIFNlcmdl
eSBLb3ZhbGV2IHdyb3RlOgo+Pj4gLS0tIGEveGVuL2FyY2gveDg2L2h2bS9odm0uYwo+Pj4gKysr
IGIveGVuL2FyY2gveDg2L2h2bS9odm0uYwo+Pj4gQEAgLTUxMjYsNiArNTEyNiwxOCBAQCB2b2lk
IGh2bV90b2dnbGVfc2luZ2xlc3RlcChzdHJ1Y3QgdmNwdSAqdikKPj4+ICAgICAgICB2LT5hcmNo
Lmh2bS5zaW5nbGVfc3RlcCA9ICF2LT5hcmNoLmh2bS5zaW5nbGVfc3RlcDsKPj4+ICAgIH0KPj4+
Cj4+PiArdm9pZCBodm1fZmFzdF9zaW5nbGVzdGVwKHN0cnVjdCB2Y3B1ICp2LCB1aW50MTZfdCBw
Mm1pZHgpCj4+PiArewo+Pj4gKyAgICBBU1NFUlQoYXRvbWljX3JlYWQoJnYtPnBhdXNlX2NvdW50
KSk7Cj4+PiArCj4+PiArICAgIGlmICggIWh2bV9pc19zaW5nbGVzdGVwX3N1cHBvcnRlZCgpICkK
Pj4+ICsgICAgICAgIHJldHVybjsKPj4+ICsKPj4+ICsgICAgdi0+YXJjaC5odm0uc2luZ2xlX3N0
ZXAgPSB0cnVlOwo+Pj4gKyAgICB2LT5hcmNoLmh2bS5mYXN0X3NpbmdsZV9zdGVwLmVuYWJsZWQg
PSB0cnVlOwo+Pj4gKyAgICB2LT5hcmNoLmh2bS5mYXN0X3NpbmdsZV9zdGVwLnAybWlkeCA9IHAy
bWlkeDsKPj4KPj4gUGVyaGFwcyBiZXR0ZXIgYXQgbGVhc3QgcmFuZ2UgY2hlY2sgcDJtaWR4IGJl
Zm9yZSBzdG9yaW5nPwo+IFdoYXQgaXMgdGhlIHZhbGlkIHJhbmdlPwoKVGhlIHNpemUgb2YgdGhl
IGFycmF5IHlvdSB1c2UgaXQgdG8gaW5kZXggaW50by4KCj4+IEFsc28geW91ciBwYXRjaCBoYXMg
Y29tZSB0aHJvdWdoIG1hbmdsZWQsIHJlbWluZGluZyBtZSBvZiBhIHByb2JsZW0KPj4gSSBoYWQg
d2l0aCBUaHVuZGVyYmlyZCBhZnRlciBpbml0aWFsbHkgaGF2aW5nIHN3aXRjaGVkIHRvIGl0LiBU
aGVyZQo+PiBhcmUgbGluZSBsZW5ndGggLyB3cmFwcGluZyBzZXR0aW5ncyB5b3UgbWF5IG5lZWQg
dG8gcGxheSB3aXRoIHRvCj4+IGF2b2lkIGl0IGluc2VydGluZyBleHRyYSBibGFua3MgKEknbSBz
b3JyeSwgSSBkb24ndCByZWFsbHkgcmVjYWxsCj4+IHdoaWNoIG9uZShzKSBpdCB3YXMuKS4KPiBU
aGFuayBZb3UhIEkgdXNlZCBUaHVuZGVyYmlyZCB0b28gOikgSSB3aWxsIHJlLWNoZWNrIGl0Lgo+
IFRob3VnaCBJIGhhdmUgc2V0dXAgbGluZSB3cmFwIGF0IDMwMC4KCkkgdGhpbmsgeW91IHdhbnQg
aXQgc2V0IHRvIHplcm8uCgpKYW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnBy
b2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94
ZW4tZGV2ZWw=
