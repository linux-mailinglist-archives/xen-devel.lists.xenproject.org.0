Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DFB7FBDE37
	for <lists+xen-devel@lfdr.de>; Wed, 25 Sep 2019 14:43:49 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iD6ar-0005Xz-BY; Wed, 25 Sep 2019 12:40:29 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=jAfE=XU=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1iD6ap-0005Xq-QN
 for xen-devel@lists.xenproject.org; Wed, 25 Sep 2019 12:40:27 +0000
X-Inumbo-ID: a67780fa-df91-11e9-b588-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by localhost (Halon) with ESMTPS
 id a67780fa-df91-11e9-b588-bc764e2007e4;
 Wed, 25 Sep 2019 12:40:27 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 6D73CAD6F;
 Wed, 25 Sep 2019 12:40:26 +0000 (UTC)
To: Jan Beulich <jbeulich@suse.com>
References: <20190914085251.18816-1-jgross@suse.com>
 <20190914085251.18816-31-jgross@suse.com>
 <2ad8a8ce-4530-93c7-0161-9b806a38b05d@suse.com>
 <0e4a75eb-61cc-2c9c-0d8a-f854163acd57@suse.com>
 <6288a88b-a5d8-dbd6-15c7-45ed19324510@suse.com>
 <29772d95-7528-2902-890a-1a11235f5b2e@suse.com>
 <e00a1ec0-63ba-d2b6-9bb8-7695cd8bd7fd@suse.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <aecf79bf-029d-6033-aa27-5eb4ef9af650@suse.com>
Date: Wed, 25 Sep 2019 14:40:25 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <e00a1ec0-63ba-d2b6-9bb8-7695cd8bd7fd@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v3 30/47] xen/sched: add support for
 multiple vcpus per sched unit where missing
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>, xen-devel@lists.xenproject.org,
 Dario Faggioli <dfaggioli@suse.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjQuMDkuMTkgMTc6MjIsIEphbiBCZXVsaWNoIHdyb3RlOgo+IE9uIDI0LjA5LjIwMTkgMTc6
MDksIErDvHJnZW4gR3Jvw58gd3JvdGU6Cj4+IE9uIDI0LjA5LjE5IDE3OjAwLCBKYW4gQmV1bGlj
aCB3cm90ZToKPj4+IE9uIDI0LjA5LjIwMTkgMTY6NDEsIErDvHJnZW4gR3Jvw58gd3JvdGU6Cj4+
Pj4gZm9yX2VhY2hfc2NoZWRfdW5pdF92Y3B1KCkgZm9yIGFuIGlkbGUKPj4+PiB1bml0IG1pZ2h0
IGVuZCBwcmVtYXR1cmUgd2hlbiBvbmUgb2YgdGhlIHZjcHVzIGlzIHJ1bm5pbmcgaW4gYW5vdGhl
cgo+Pj4+IHVuaXQgKGlkbGVfdmNwdS0+c2NoZWRfdW5pdCAhPSBpZGxlX3VuaXQpLgo+Pj4KPj4+
IE9oLCB0aGF0ICh2KS0+c2NoZWRfdW5pdCA9PSAoaSkgaW4gdGhlIGNvbnN0cnVjdCBpcyBjbGVh
cmx5IHVuZXhwZWN0ZWQuCj4+PiBJcyB0aGlzIHJlYWxseSBzdGlsbCBuZWVkZWQgYnkgdGhlIGVu
ZCBvZiB0aGUgc2VyaWVzPyBJIHJlYWxpemUgdGhhdAo+Pj4gX3NvbWVfIGNoZWNrIGlzIG5lZWRl
ZCwgYnV0IGNvdWxkIHRoaXMgcGVyaGFwcyBiZSBhcnJhbmdlZCBpbiBhIHdheQo+Pj4gdGhhdCB5
b3UnZCBzdGlsbCBoaXQgYWxsIHZDUFUtcyB3aGVuIHVzaW5nIGl0IG9uIGFuIGlkbGUgdW5pdCwg
bm8KPj4+IG1hdHRlciB3aGV0aGVyIHRoZXkncmUgaW4gdXNlIGFzIGEgc3Vic3RpdHV0ZSBpbiBh
ICJyZWFsIiB1bml0Pwo+Pgo+PiBJIGNvdWxkIGRvIHRoYXQgYnkgaGF2aW5nIGFub3RoZXIgbGlu
a2VkIGxpc3QgaW4gc3RydWN0IHZjcHUuIFRoaXMgd2F5Cj4+IEkgY2FuIGF2b2lkIGl0Lgo+IAo+
IE9oLCBubywgbm90IGFub3RoZXIgbGlzdCBqdXN0IGZvciB0aGlzIHB1cnBvc2UuIEkgd2FzIHJh
dGhlciB0aGlua2luZwo+IG9mIGUuZy4gYSBjb21wYXJpc29uIG9mIElEcy4KClRoYXQgd291bGQg
cmVzdWx0IGVpdGhlciBpbiBzb21ldGhpbmcgbGlrZToKCih2KS0+dmNwdV9pZCA8ICh1KS0+dW5p
dF9pZCArICh1KS0+cmVzLT5jcHVwb29sLT5ncmFudWxhcml0eQoKcmVxdWlyaW5nIHRvIG1ha2Ug
c3RydWN0IHNjaGVkX3Jlc291cmNlIHB1YmxpYyBhcyBrZXloYW5kbGVyLmMgbmVlZHMKZm9yX2Vh
Y2hfc2NoZWRfdW5pdF92Y3B1KCkgcGx1cyBiZWluZyBxdWl0ZSBleHBlbnNpdmUsIG9yOgoKISh1
KS0+bmV4dF9pbl9saXN0IHx8ICh2KS0+dmNwdV9pZCA8ICh1KS0+bmV4dF9pbl9saXN0LT51bml0
X2lkCgp3aGljaCBzZWVtcyB0byBiZSBtb3JlIGV4cGVuc2l2ZSBhcyB0aGUgY3VycmVudCB2YXJp
YW50LCB0b28uCgoKSnVlcmdlbgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnBy
b2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94
ZW4tZGV2ZWw=
