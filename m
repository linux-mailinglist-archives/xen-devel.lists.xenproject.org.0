Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 42F4E1244FB
	for <lists+xen-devel@lfdr.de>; Wed, 18 Dec 2019 11:48:03 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ihWpH-0005G5-MS; Wed, 18 Dec 2019 10:45:07 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=nDAh=2I=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1ihWpG-0005Fm-F8
 for xen-devel@lists.xenproject.org; Wed, 18 Dec 2019 10:45:06 +0000
X-Inumbo-ID: 6e9bf6b4-2183-11ea-88e7-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 6e9bf6b4-2183-11ea-88e7-bc764e2007e4;
 Wed, 18 Dec 2019 10:44:57 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 40DADAC67;
 Wed, 18 Dec 2019 10:44:56 +0000 (UTC)
To: Alexandru Stefan ISAILA <aisaila@bitdefender.com>
References: <20191217151144.9781-1-aisaila@bitdefender.com>
 <20191217151144.9781-4-aisaila@bitdefender.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <81907d55-2e36-96f7-95cf-990f062a273c@suse.com>
Date: Wed, 18 Dec 2019 11:45:23 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <20191217151144.9781-4-aisaila@bitdefender.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH V4 4/4] x86/mm: Make use of the default
 access param from xc_altp2m_create_view
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
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Razvan COJOCARU <rcojocaru@bitdefender.com>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Tamas K Lengyel <tamas@tklengyel.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTcuMTIuMjAxOSAxNjoxMiwgQWxleGFuZHJ1IFN0ZWZhbiBJU0FJTEEgd3JvdGU6Cj4gLS0t
IGEveGVuL2FyY2gveDg2L21tL21lbV9hY2Nlc3MuYwo+ICsrKyBiL3hlbi9hcmNoL3g4Ni9tbS9t
ZW1fYWNjZXNzLmMKPiBAQCAtMzE0LDkgKzMxNCw5IEBAIHN0YXRpYyBpbnQgc2V0X21lbV9hY2Nl
c3Moc3RydWN0IGRvbWFpbiAqZCwgc3RydWN0IHAybV9kb21haW4gKnAybSwKPiAgICAgIHJldHVy
biByYzsKPiAgfQo+ICAKPiAtc3RhdGljIGJvb2wgeGVubWVtX2FjY2Vzc190b19wMm1fYWNjZXNz
KHN0cnVjdCBwMm1fZG9tYWluICpwMm0sCj4gLSAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICB4ZW5tZW1fYWNjZXNzX3QgeGFjY2VzcywKPiAtICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIHAybV9hY2Nlc3NfdCAqcGFjY2VzcykKPiArYm9vbCB4ZW5t
ZW1fYWNjZXNzX3RvX3AybV9hY2Nlc3Moc3RydWN0IHAybV9kb21haW4gKnAybSwKPiArICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgeGVubWVtX2FjY2Vzc190IHhhY2Nlc3MsCj4gKyAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHAybV9hY2Nlc3NfdCAqcGFjY2VzcykKCldv
dWxkIHlvdSBtaW5kIHRha2luZyB0aGUgb3Bwb3J0dW5pdHkgYW5kIGFkZCBjb25zdCB0byB0aGUg
Zmlyc3QKcGFyYW1ldGVyPwoKPiBAQCAtMjYwMSw3ICsyNjEwLDE1IEBAIGludCBwMm1faW5pdF9u
ZXh0X2FsdHAybShzdHJ1Y3QgZG9tYWluICpkLCB1aW50MTZfdCAqaWR4KQo+ICAgICAgICAgIGlm
ICggZC0+YXJjaC5hbHRwMm1fZXB0cFtpXSAhPSBtZm5feChJTlZBTElEX01GTikgKQo+ICAgICAg
ICAgICAgICBjb250aW51ZTsKPiAgCj4gLSAgICAgICAgcmMgPSBwMm1fYWN0aXZhdGVfYWx0cDJt
KGQsIGkpOwo+ICsgICAgICAgIHAybSA9IGQtPmFyY2guYWx0cDJtX3AybVtpXTsKPiArCj4gKyAg
ICAgICAgaWYgKCAheGVubWVtX2FjY2Vzc190b19wMm1fYWNjZXNzKHAybSwgaHZtbWVtX2RlZmF1
bHRfYWNjZXNzLCAmYSkgKQo+ICsgICAgICAgIHsKPiArICAgICAgICAgICAgYWx0cDJtX2xpc3Rf
dW5sb2NrKGQpOwo+ICsgICAgICAgICAgICByZXR1cm4gLUVJTlZBTDsKPiArICAgICAgICB9CgpD
YW4gdGhpcyBiZSBwdWxsZWQgb3V0IG9mIHRoZSBsb2NrZWQgcmVnaW9uLCBhaGVhZCBvZiB0aGUg
bG9vcD8KVGhlIHAybSBnZXR0aW5nIHBhc3NlZCBpbiBoZXJlICh3aGljaCBpcyB3aHkgaXQncyBp
biB0aGUgbG9vcCkKc2hvdWxkbid0IGhhdmUgYmVlbiBpbiB1c2UgeWV0LCBpLmUuIGl0cyAtPmRl
ZmF1bHRfYWNjZXNzIHNob3VsZApoYXZlIGEga25vd24gdmFsdWUuIEhlbmNlIHRoaXMgY2FzZSBj
b3VsZCBiZSB0YWtlbiBjYXJlIG9mCmluZGVwZW5kZW50bHksIGUuZy4gYnkgYWRqdXN0aW5nIHhl
bm1lbV9hY2Nlc3NfdG9fcDJtX2FjY2VzcygpCnRvIGNvcGUgd2l0aCBhIE5VTEwgcDJtIGNvbWlu
ZyBpbiAocHJvZHVjaW5nIHdoYXRldmVyIHRoZSBkZWZhdWx0Cm9mIHRoZSBkZWZhdWx0IGlzKS4K
CkphbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVu
LWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6
Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
