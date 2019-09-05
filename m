Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 73D49AA35D
	for <lists+xen-devel@lfdr.de>; Thu,  5 Sep 2019 14:39:51 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i5r0b-0000eH-QZ; Thu, 05 Sep 2019 12:37:05 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=ezPI=XA=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1i5r0a-0000e7-FB
 for xen-devel@lists.xenproject.org; Thu, 05 Sep 2019 12:37:04 +0000
X-Inumbo-ID: dcfdf144-cfd9-11e9-abc9-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id dcfdf144-cfd9-11e9-abc9-12813bfff9fa;
 Thu, 05 Sep 2019 12:37:03 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 11993B5EC;
 Thu,  5 Sep 2019 12:37:03 +0000 (UTC)
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
References: <20190905113955.24870-1-jgross@suse.com>
 <20190905113955.24870-4-jgross@suse.com>
 <efd9f3e4-d2d3-8bf7-ba9a-6337f598191a@suse.com>
 <129b35af-da91-5811-ec3c-b37caeb1451e@suse.com>
 <8565aa67-9ef2-49cb-3a9b-06c14eda7d82@suse.com>
 <fcfecb6b-ca9d-5382-1b0d-1b587cef36d6@suse.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <5fff41d3-286d-66b3-43e4-80bf29ee4db3@suse.com>
Date: Thu, 5 Sep 2019 14:37:10 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <fcfecb6b-ca9d-5382-1b0d-1b587cef36d6@suse.com>
Content-Language: en-US
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
 Julien Grall <julien.grall@arm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDUuMDkuMjAxOSAxNDoyNywgSnVlcmdlbiBHcm9zcyB3cm90ZToKPiBPbiAwNS4wOS4xOSAx
NDoyMiwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+IE9uIDA1LjA5LjIwMTkgMTQ6MTIsIEp1ZXJnZW4g
R3Jvc3Mgd3JvdGU6Cj4+PiBPbiAwNS4wOS4xOSAxNDowMSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+
Pj4gT24gMDUuMDkuMjAxOSAxMzozOSwgSnVlcmdlbiBHcm9zcyB3cm90ZToKPj4+Pj4gQXMgYSBw
cmVwYXJhdGlvbiBmb3IgcGVyLWNwdSBidWZmZXJzIGRvIGEgbGl0dGxlIHJlZmFjdG9yaW5nIG9m
IHRoZQo+Pj4+PiBkZWJ1Z3RyYWNlIGRhdGE6IHB1dCB0aGUgbmVlZGVkIGJ1ZmZlciBhZG1pbiBk
YXRhIGludG8gdGhlIGJ1ZmZlciBhcwo+Pj4+PiBpdCB3aWxsIGJlIG5lZWRlZCBmb3IgZWFjaCBi
dWZmZXIuIEluIG9yZGVyIG5vdCB0byBsaW1pdCBidWZmZXIgc2l6ZQo+Pj4+PiBzd2l0Y2ggdGhl
IHJlbGF0ZWQgZmllbGRzIGZyb20gdW5zaWduZWQgaW50IHRvIHVuc2lnbmVkIGxvbmcsIGFzIG9u
Cj4+Pj4+IGh1Z2UgbWFjaGluZXMgd2l0aCBSQU0gaW4gdGhlIFRCIHJhbmdlIGl0IG1pZ2h0IGJl
IGludGVyZXN0aW5nIHRvCj4+Pj4+IHN1cHBvcnQgYnVmZmVycyA+NEdCLgo+Pj4+Cj4+Pj4gSnVz
dCBhcyBhIGZ1cnRoZXIgcmVtYXJrIGluIHRoaXMgcmVnYXJkOgo+Pj4+Cj4+Pj4+ICAgIHZvaWQg
ZGVidWd0cmFjZV9wcmludGsoY29uc3QgY2hhciAqZm10LCAuLi4pCj4+Pj4+ICAgIHsKPj4+Pj4g
ICAgICAgIHN0YXRpYyBjaGFyIGJ1ZltERUJVR19UUkFDRV9FTlRSWV9TSVpFXTsKPj4+Pj4gLSAg
ICBzdGF0aWMgdW5zaWduZWQgaW50IGNvdW50LCBsYXN0X2NvdW50LCBsYXN0X3ByZDsKPj4+Pj4g
KyAgICBzdGF0aWMgdW5zaWduZWQgaW50IGNvdW50LCBsYXN0X2NvdW50Owo+Pj4+Cj4+Pj4gSG93
IGxvbmcgZG8gd2UgdGhpbmsgd2lsbCBpdCB0YWtlIHVudGlsIHRoZWlyIHdyYXBwaW5nIHdpbGwg
YmVjb21lCj4+Pj4gYW4gaXNzdWUgd2l0aCBzdWNoIGh1Z2UgYnVmZmVycz8KPj4+Cj4+PiBDb3Vu
dCB3cmFwcGluZyB3aWxsIG5vdCByZXN1bHQgaW4gYW55IG1pc2JlaGF2aW9yIG9mIHRyYWNpbmcu
IFdpdGgKPj4+IHBlci1jcHUgYnVmZmVycyBpdCBtaWdodCByZXN1bHQgaW4gYW1iaWd1aXR5IHJl
Z2FyZGluZyBzb3J0aW5nIHRoZQo+Pj4gZW50cmllcywgYnV0IEkgZ3Vlc3MgY2hhbmNlcyBhcmUg
cmF0aGVyIGxvdyB0aGlzIGJlaW5nIGEgcmVhbCBpc3N1ZS4KPj4+Cj4+PiBCVFc6IHdyYXBwaW5n
IG9mIGNvdW50IGlzIG5vdCByZWxhdGVkIHRvIGJ1ZmZlciBzaXplLCBidXQgdG8gdGhlCj4+PiBh
bW91bnQgb2YgdHJhY2UgZGF0YSB3cml0dGVuLgo+Pgo+PiBTdXJlLCBidXQgdGhlIGNoYW5jZSBv
ZiBhbWJpZ3VpdHkgaW5jcmVhc2VzIHdpdGggbGFyZ2VyIGJ1ZmZlciBzaXplcy4KPiAKPiBXZWxs
LCBiZXR0ZXIgc2FmZSB0aGFuIHNvcnJ5LiBTd2l0Y2hpbmcgdG8gdW5zaWduZWQgbG9uZyB3aWxs
IHJhcmVseQo+IGh1cnQsIHNvIEknbSBnb2luZyB0byBkbyBqdXN0IHRoYXQuIFRoZSBvbmx5IGRv
d25zaWRlIHdpbGwgYmUgc29tZSB3YXN0ZQo+IG9mIGJ1ZmZlciBzcGFjZSBmb3IgdmVyeSBsb25n
IHJ1bm5pbmcgdHJhY2VzIHdpdGggaHVnZSBhbW91bnRzIG9mCj4gZW50cmllcy4KCkhtbSwgdHJ1
ZS4gTWF5YmUgd2UgY291bGQgZ2V0IHNvbWVvbmUgZWxzZSdzIG9waW5pb24gb24gdGhpcyAtIGFu
eW9uZT8KCkphbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcK
aHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
