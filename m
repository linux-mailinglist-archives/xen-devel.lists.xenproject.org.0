Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 73B76AA2ED
	for <lists+xen-devel@lfdr.de>; Thu,  5 Sep 2019 14:21:53 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i5qjp-0006bO-0D; Thu, 05 Sep 2019 12:19:45 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=K5dO=XA=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1i5qjn-0006bG-UF
 for xen-devel@lists.xenproject.org; Thu, 05 Sep 2019 12:19:43 +0000
X-Inumbo-ID: 70ba3d0a-cfd7-11e9-978d-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 70ba3d0a-cfd7-11e9-978d-bc764e2007e4;
 Thu, 05 Sep 2019 12:19:43 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 731FDAF87;
 Thu,  5 Sep 2019 12:19:42 +0000 (UTC)
To: Jan Beulich <jbeulich@suse.com>
References: <20190905113955.24870-1-jgross@suse.com>
 <20190905113955.24870-4-jgross@suse.com>
 <9d29cef7-752c-2805-2f83-174e47c27516@suse.com>
From: Juergen Gross <jgross@suse.com>
Message-ID: <9459eba3-3da0-3229-94ae-94e2d2f0061e@suse.com>
Date: Thu, 5 Sep 2019 14:19:41 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <9d29cef7-752c-2805-2f83-174e47c27516@suse.com>
Content-Language: de-DE
Subject: Re: [Xen-devel] [PATCH v5 3/4] xen: refactor debugtrace data
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
 Julien Grall <julien.grall@arm.com>, xen-devel@lists.xenproject.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDUuMDkuMTkgMTQ6MTMsIEphbiBCZXVsaWNoIHdyb3RlOgo+IE9uIDA1LjA5LjIwMTkgMTM6
MzksIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6Cj4+IC0tLSBhL3hlbi9jb21tb24vZGVidWd0cmFjZS5j
Cj4+ICsrKyBiL3hlbi9jb21tb24vZGVidWd0cmFjZS5jCj4+IEBAIC0xNywzNCArMTcsNDAgQEAK
Pj4gICAjZGVmaW5lIERFQlVHX1RSQUNFX0VOVFJZX1NJWkUgICAxMDI0Cj4+ICAgCj4+ICAgLyog
U2VuZCBvdXRwdXQgZGlyZWN0IHRvIGNvbnNvbGUsIG9yIGJ1ZmZlciBpdD8gKi8KPj4gLXN0YXRp
YyB2b2xhdGlsZSBpbnQgZGVidWd0cmFjZV9zZW5kX3RvX2NvbnNvbGU7Cj4+ICtzdGF0aWMgdm9s
YXRpbGUgYm9vbCBkZWJ1Z3RyYWNlX3NlbmRfdG9fY29uc29sZTsKPj4gICAKPj4gLXN0YXRpYyBj
aGFyICAgICAgICAqZGVidWd0cmFjZV9idWY7IC8qIERlYnVnLXRyYWNlIGJ1ZmZlciAqLwo+PiAt
c3RhdGljIHVuc2lnbmVkIGludCBkZWJ1Z3RyYWNlX3ByZDsgLyogUHJvZHVjZXIgaW5kZXggICAg
ICovCj4+IC1zdGF0aWMgdW5zaWduZWQgaW50IGRlYnVndHJhY2Vfa2lsb2J5dGVzID0gMTI4LCBk
ZWJ1Z3RyYWNlX2J5dGVzOwo+PiAtc3RhdGljIHVuc2lnbmVkIGludCBkZWJ1Z3RyYWNlX3VzZWQ7
Cj4+ICtzdHJ1Y3QgZGVidWd0cmFjZV9kYXRhIHsKPj4gKyAgICB1bnNpZ25lZCBsb25nIGJ5dGVz
OyAvKiBTaXplIG9mIGJ1ZmZlci4gKi8KPiAKPiBIbW0sIEknbSBzb3JyeSBmb3IgcmVjb2duaXpp
bmcgdGhpcyBvbmx5IG5vdywgYnV0IHdoeSBkb2VzIHRoaXMKPiBmaWVsZCBuZWVkIHJlcGxpY2F0
aW5nPyBJdCdzIHRoZSBzYW1lIGluIGFsbCBpbnN0YW5jZXMgb2YgdGhlCj4gc3RydWN0dXJlIGFm
YWljdC4KCk9oLCByaWdodC4gSW4gdGhlIGJlZ2lubmluZyBJIGhhZCBwbGFucyB0byBzdXBwb3J0
IG1vZGlmeWluZyB0aGUgYnVmZmVyCnNpemUgYXQgcnVudGltZS4KCk9rYXksIEknbGwgY2hhbmdl
IGl0LgoKCkp1ZXJnZW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qu
b3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2
ZWw=
