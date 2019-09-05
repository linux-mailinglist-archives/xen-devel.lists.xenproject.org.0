Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A545AA335
	for <lists+xen-devel@lfdr.de>; Thu,  5 Sep 2019 14:30:03 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i5qrY-00085Q-Fq; Thu, 05 Sep 2019 12:27:44 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=K5dO=XA=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1i5qrW-00084s-VD
 for xen-devel@lists.xenproject.org; Thu, 05 Sep 2019 12:27:42 +0000
X-Inumbo-ID: 8e4906a2-cfd8-11e9-b299-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8e4906a2-cfd8-11e9-b299-bc764e2007e4;
 Thu, 05 Sep 2019 12:27:42 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 87F10AFB0;
 Thu,  5 Sep 2019 12:27:41 +0000 (UTC)
To: Jan Beulich <jbeulich@suse.com>
References: <20190905113955.24870-1-jgross@suse.com>
 <20190905113955.24870-4-jgross@suse.com>
 <efd9f3e4-d2d3-8bf7-ba9a-6337f598191a@suse.com>
 <129b35af-da91-5811-ec3c-b37caeb1451e@suse.com>
 <8565aa67-9ef2-49cb-3a9b-06c14eda7d82@suse.com>
From: Juergen Gross <jgross@suse.com>
Message-ID: <fcfecb6b-ca9d-5382-1b0d-1b587cef36d6@suse.com>
Date: Thu, 5 Sep 2019 14:27:40 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <8565aa67-9ef2-49cb-3a9b-06c14eda7d82@suse.com>
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

T24gMDUuMDkuMTkgMTQ6MjIsIEphbiBCZXVsaWNoIHdyb3RlOgo+IE9uIDA1LjA5LjIwMTkgMTQ6
MTIsIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6Cj4+IE9uIDA1LjA5LjE5IDE0OjAxLCBKYW4gQmV1bGlj
aCB3cm90ZToKPj4+IE9uIDA1LjA5LjIwMTkgMTM6MzksIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6Cj4+
Pj4gQXMgYSBwcmVwYXJhdGlvbiBmb3IgcGVyLWNwdSBidWZmZXJzIGRvIGEgbGl0dGxlIHJlZmFj
dG9yaW5nIG9mIHRoZQo+Pj4+IGRlYnVndHJhY2UgZGF0YTogcHV0IHRoZSBuZWVkZWQgYnVmZmVy
IGFkbWluIGRhdGEgaW50byB0aGUgYnVmZmVyIGFzCj4+Pj4gaXQgd2lsbCBiZSBuZWVkZWQgZm9y
IGVhY2ggYnVmZmVyLiBJbiBvcmRlciBub3QgdG8gbGltaXQgYnVmZmVyIHNpemUKPj4+PiBzd2l0
Y2ggdGhlIHJlbGF0ZWQgZmllbGRzIGZyb20gdW5zaWduZWQgaW50IHRvIHVuc2lnbmVkIGxvbmcs
IGFzIG9uCj4+Pj4gaHVnZSBtYWNoaW5lcyB3aXRoIFJBTSBpbiB0aGUgVEIgcmFuZ2UgaXQgbWln
aHQgYmUgaW50ZXJlc3RpbmcgdG8KPj4+PiBzdXBwb3J0IGJ1ZmZlcnMgPjRHQi4KPj4+Cj4+PiBK
dXN0IGFzIGEgZnVydGhlciByZW1hcmsgaW4gdGhpcyByZWdhcmQ6Cj4+Pgo+Pj4+ICAgIHZvaWQg
ZGVidWd0cmFjZV9wcmludGsoY29uc3QgY2hhciAqZm10LCAuLi4pCj4+Pj4gICAgewo+Pj4+ICAg
ICAgICBzdGF0aWMgY2hhciBidWZbREVCVUdfVFJBQ0VfRU5UUllfU0laRV07Cj4+Pj4gLSAgICBz
dGF0aWMgdW5zaWduZWQgaW50IGNvdW50LCBsYXN0X2NvdW50LCBsYXN0X3ByZDsKPj4+PiArICAg
IHN0YXRpYyB1bnNpZ25lZCBpbnQgY291bnQsIGxhc3RfY291bnQ7Cj4+Pgo+Pj4gSG93IGxvbmcg
ZG8gd2UgdGhpbmsgd2lsbCBpdCB0YWtlIHVudGlsIHRoZWlyIHdyYXBwaW5nIHdpbGwgYmVjb21l
Cj4+PiBhbiBpc3N1ZSB3aXRoIHN1Y2ggaHVnZSBidWZmZXJzPwo+Pgo+PiBDb3VudCB3cmFwcGlu
ZyB3aWxsIG5vdCByZXN1bHQgaW4gYW55IG1pc2JlaGF2aW9yIG9mIHRyYWNpbmcuIFdpdGgKPj4g
cGVyLWNwdSBidWZmZXJzIGl0IG1pZ2h0IHJlc3VsdCBpbiBhbWJpZ3VpdHkgcmVnYXJkaW5nIHNv
cnRpbmcgdGhlCj4+IGVudHJpZXMsIGJ1dCBJIGd1ZXNzIGNoYW5jZXMgYXJlIHJhdGhlciBsb3cg
dGhpcyBiZWluZyBhIHJlYWwgaXNzdWUuCj4+Cj4+IEJUVzogd3JhcHBpbmcgb2YgY291bnQgaXMg
bm90IHJlbGF0ZWQgdG8gYnVmZmVyIHNpemUsIGJ1dCB0byB0aGUKPj4gYW1vdW50IG9mIHRyYWNl
IGRhdGEgd3JpdHRlbi4KPiAKPiBTdXJlLCBidXQgdGhlIGNoYW5jZSBvZiBhbWJpZ3VpdHkgaW5j
cmVhc2VzIHdpdGggbGFyZ2VyIGJ1ZmZlciBzaXplcy4KCldlbGwsIGJldHRlciBzYWZlIHRoYW4g
c29ycnkuIFN3aXRjaGluZyB0byB1bnNpZ25lZCBsb25nIHdpbGwgcmFyZWx5Cmh1cnQsIHNvIEkn
bSBnb2luZyB0byBkbyBqdXN0IHRoYXQuIFRoZSBvbmx5IGRvd25zaWRlIHdpbGwgYmUgc29tZSB3
YXN0ZQpvZiBidWZmZXIgc3BhY2UgZm9yIHZlcnkgbG9uZyBydW5uaW5nIHRyYWNlcyB3aXRoIGh1
Z2UgYW1vdW50cyBvZgplbnRyaWVzLgoKCkp1ZXJnZW4KCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVs
QGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1h
bi9saXN0aW5mby94ZW4tZGV2ZWw=
