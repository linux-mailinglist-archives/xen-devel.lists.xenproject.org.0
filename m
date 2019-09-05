Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C0A2AAA60D
	for <lists+xen-devel@lfdr.de>; Thu,  5 Sep 2019 16:40:03 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i5ssT-0003lH-Rh; Thu, 05 Sep 2019 14:36:49 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=K5dO=XA=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1i5ssS-0003lA-3x
 for xen-devel@lists.xenproject.org; Thu, 05 Sep 2019 14:36:48 +0000
X-Inumbo-ID: 96693e8a-cfea-11e9-978d-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 96693e8a-cfea-11e9-978d-bc764e2007e4;
 Thu, 05 Sep 2019 14:36:46 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id EC75EB638;
 Thu,  5 Sep 2019 14:36:45 +0000 (UTC)
To: Jan Beulich <jbeulich@suse.com>, xen-devel@lists.xenproject.org
References: <20190905113955.24870-1-jgross@suse.com>
 <20190905113955.24870-4-jgross@suse.com>
 <efd9f3e4-d2d3-8bf7-ba9a-6337f598191a@suse.com>
 <129b35af-da91-5811-ec3c-b37caeb1451e@suse.com>
 <8565aa67-9ef2-49cb-3a9b-06c14eda7d82@suse.com>
 <fcfecb6b-ca9d-5382-1b0d-1b587cef36d6@suse.com>
 <5fff41d3-286d-66b3-43e4-80bf29ee4db3@suse.com>
 <c5e744c2-73e7-3a6c-6404-b7596c1c24e3@suse.com>
From: Juergen Gross <jgross@suse.com>
Message-ID: <c417375c-b216-8160-e4aa-bc61e0a7a901@suse.com>
Date: Thu, 5 Sep 2019 16:36:44 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <c5e744c2-73e7-3a6c-6404-b7596c1c24e3@suse.com>
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
 Julien Grall <julien.grall@arm.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDUuMDkuMTkgMTQ6NDYsIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6Cj4gT24gMDUuMDkuMTkgMTQ6
MzcsIEphbiBCZXVsaWNoIHdyb3RlOgo+PiBPbiAwNS4wOS4yMDE5IDE0OjI3LCBKdWVyZ2VuIEdy
b3NzIHdyb3RlOgo+Pj4gT24gMDUuMDkuMTkgMTQ6MjIsIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+
IE9uIDA1LjA5LjIwMTkgMTQ6MTIsIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6Cj4+Pj4+IE9uIDA1LjA5
LjE5IDE0OjAxLCBKYW4gQmV1bGljaCB3cm90ZToKPj4+Pj4+IE9uIDA1LjA5LjIwMTkgMTM6Mzks
IEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6Cj4+Pj4+Pj4gQXMgYSBwcmVwYXJhdGlvbiBmb3IgcGVyLWNw
dSBidWZmZXJzIGRvIGEgbGl0dGxlIHJlZmFjdG9yaW5nIG9mIHRoZQo+Pj4+Pj4+IGRlYnVndHJh
Y2UgZGF0YTogcHV0IHRoZSBuZWVkZWQgYnVmZmVyIGFkbWluIGRhdGEgaW50byB0aGUgYnVmZmVy
IGFzCj4+Pj4+Pj4gaXQgd2lsbCBiZSBuZWVkZWQgZm9yIGVhY2ggYnVmZmVyLiBJbiBvcmRlciBu
b3QgdG8gbGltaXQgYnVmZmVyIHNpemUKPj4+Pj4+PiBzd2l0Y2ggdGhlIHJlbGF0ZWQgZmllbGRz
IGZyb20gdW5zaWduZWQgaW50IHRvIHVuc2lnbmVkIGxvbmcsIGFzIG9uCj4+Pj4+Pj4gaHVnZSBt
YWNoaW5lcyB3aXRoIFJBTSBpbiB0aGUgVEIgcmFuZ2UgaXQgbWlnaHQgYmUgaW50ZXJlc3Rpbmcg
dG8KPj4+Pj4+PiBzdXBwb3J0IGJ1ZmZlcnMgPjRHQi4KPj4+Pj4+Cj4+Pj4+PiBKdXN0IGFzIGEg
ZnVydGhlciByZW1hcmsgaW4gdGhpcyByZWdhcmQ6Cj4+Pj4+Pgo+Pj4+Pj4+IMKgwqDCoCB2b2lk
IGRlYnVndHJhY2VfcHJpbnRrKGNvbnN0IGNoYXIgKmZtdCwgLi4uKQo+Pj4+Pj4+IMKgwqDCoCB7
Cj4+Pj4+Pj4gwqDCoMKgwqDCoMKgwqAgc3RhdGljIGNoYXIgYnVmW0RFQlVHX1RSQUNFX0VOVFJZ
X1NJWkVdOwo+Pj4+Pj4+IC3CoMKgwqAgc3RhdGljIHVuc2lnbmVkIGludCBjb3VudCwgbGFzdF9j
b3VudCwgbGFzdF9wcmQ7Cj4+Pj4+Pj4gK8KgwqDCoCBzdGF0aWMgdW5zaWduZWQgaW50IGNvdW50
LCBsYXN0X2NvdW50Owo+Pj4+Pj4KPj4+Pj4+IEhvdyBsb25nIGRvIHdlIHRoaW5rIHdpbGwgaXQg
dGFrZSB1bnRpbCB0aGVpciB3cmFwcGluZyB3aWxsIGJlY29tZQo+Pj4+Pj4gYW4gaXNzdWUgd2l0
aCBzdWNoIGh1Z2UgYnVmZmVycz8KPj4+Pj4KPj4+Pj4gQ291bnQgd3JhcHBpbmcgd2lsbCBub3Qg
cmVzdWx0IGluIGFueSBtaXNiZWhhdmlvciBvZiB0cmFjaW5nLiBXaXRoCj4+Pj4+IHBlci1jcHUg
YnVmZmVycyBpdCBtaWdodCByZXN1bHQgaW4gYW1iaWd1aXR5IHJlZ2FyZGluZyBzb3J0aW5nIHRo
ZQo+Pj4+PiBlbnRyaWVzLCBidXQgSSBndWVzcyBjaGFuY2VzIGFyZSByYXRoZXIgbG93IHRoaXMg
YmVpbmcgYSByZWFsIGlzc3VlLgo+Pj4+Pgo+Pj4+PiBCVFc6IHdyYXBwaW5nIG9mIGNvdW50IGlz
IG5vdCByZWxhdGVkIHRvIGJ1ZmZlciBzaXplLCBidXQgdG8gdGhlCj4+Pj4+IGFtb3VudCBvZiB0
cmFjZSBkYXRhIHdyaXR0ZW4uCj4+Pj4KPj4+PiBTdXJlLCBidXQgdGhlIGNoYW5jZSBvZiBhbWJp
Z3VpdHkgaW5jcmVhc2VzIHdpdGggbGFyZ2VyIGJ1ZmZlciBzaXplcy4KPj4+Cj4+PiBXZWxsLCBi
ZXR0ZXIgc2FmZSB0aGFuIHNvcnJ5LiBTd2l0Y2hpbmcgdG8gdW5zaWduZWQgbG9uZyB3aWxsIHJh
cmVseQo+Pj4gaHVydCwgc28gSSdtIGdvaW5nIHRvIGRvIGp1c3QgdGhhdC4gVGhlIG9ubHkgZG93
bnNpZGUgd2lsbCBiZSBzb21lIHdhc3RlCj4+PiBvZiBidWZmZXIgc3BhY2UgZm9yIHZlcnkgbG9u
ZyBydW5uaW5nIHRyYWNlcyB3aXRoIGh1Z2UgYW1vdW50cyBvZgo+Pj4gZW50cmllcy4KPj4KPj4g
SG1tLCB0cnVlLiBNYXliZSB3ZSBjb3VsZCBnZXQgc29tZW9uZSBlbHNlJ3Mgb3BpbmlvbiBvbiB0
aGlzIC0gYW55b25lPwo+IAo+IFRCSCwgSSB3b3VsZG4ndCBiZSBjb25jZXJuZWQgYWJvdXQgdGhl
IGJ1ZmZlciBzcGFjZS4gSW4gY2FzZSB0aGVyZSBhcmUKPiByZWFsbHkgYmlsbGlvbnMgb2YgZW50
cmllcywgdGhlIGRpZmZlcmVuY2UgYmV0d2VlbiBhIDEwLWRpZ2l0IGNvdW50Cj4gdmFsdWUgYW5k
IG1heWJlIGEgMTUgZGlnaXQgb25lIChhbmQgdGhhdCBpcyBhbHJlYWR5IGEgbWFzc2l2ZSBhbW91
bnQpCj4gaXNuJ3QgdGhhdCBsYXJnZS4gVGhlIGF2ZXJhZ2UgcHJpbnRlZCBzaXplIG9mIGNvdW50
IHdpdGggYWJvdXQKPiA0IGJpbGxpb24gZW50cmllcyBpcyA5Ljc1IGRpZ2l0cyAoYW5kIG5vdCBq
dXN0IDUgOi0pICkuCgpBbm90aGVyIG9wdGlvbiB3b3VsZCBiZSB0byBsZXQgY291bnQgd3JhcCBh
dCBlLmcuIDQgYmlsbGlvbiAob3IgZXZlbiAxCm1pbGxpb24pIGFuZCBhZGQgYSB3cmFwIGNvdW50
LiBFYWNoIGJ1ZmZlciBzdHJ1Y3Qgd291bGQgY29udGFpbiB0aGUKd3JhcCBjb3VudCBvZiB0aGUg
bGFzdCBlbnRyeSwgYW5kIHdoZW4gaGl0dGluZyBhIGhpZ2hlciB3cmFwIGNvdW50IGEKbmV3IGVu
dHJ5IGxpa2UgKCJ3cmFwICV1LT4ldSIsIG9sZF93cmFwLCBuZXdfd3JhcCkgd291bGQgYmUgcHJp
bnRlZC4KVGhpcyBzYXZlcyBidWZmZXIgc3BhY2Ugd2l0aG91dCBsb29zaW5nIGluZm9ybWF0aW9u
LgoKCkp1ZXJnZW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3Jn
Cmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
