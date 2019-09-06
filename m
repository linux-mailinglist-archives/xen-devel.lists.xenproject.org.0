Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B7802AB4D8
	for <lists+xen-devel@lfdr.de>; Fri,  6 Sep 2019 11:24:18 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i6AQr-0005eA-EH; Fri, 06 Sep 2019 09:21:29 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=pN+4=XB=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1i6AQp-0005e0-T4
 for xen-devel@lists.xenproject.org; Fri, 06 Sep 2019 09:21:27 +0000
X-Inumbo-ID: b38023a6-d087-11e9-b299-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b38023a6-d087-11e9-b299-bc764e2007e4;
 Fri, 06 Sep 2019 09:21:26 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id C4069B65B;
 Fri,  6 Sep 2019 09:21:25 +0000 (UTC)
To: Jan Beulich <jbeulich@suse.com>
References: <20190905113955.24870-1-jgross@suse.com>
 <20190905113955.24870-4-jgross@suse.com>
 <efd9f3e4-d2d3-8bf7-ba9a-6337f598191a@suse.com>
 <129b35af-da91-5811-ec3c-b37caeb1451e@suse.com>
 <8565aa67-9ef2-49cb-3a9b-06c14eda7d82@suse.com>
 <fcfecb6b-ca9d-5382-1b0d-1b587cef36d6@suse.com>
 <5fff41d3-286d-66b3-43e4-80bf29ee4db3@suse.com>
 <c5e744c2-73e7-3a6c-6404-b7596c1c24e3@suse.com>
 <c417375c-b216-8160-e4aa-bc61e0a7a901@suse.com>
 <88dca7fb-c1f5-d7e8-b59f-0169490cc9bf@suse.com>
 <65545e29-c6c2-ba2a-0626-e3c4f9867217@suse.com>
 <a0fcc4f9-4f76-6e4b-5743-3f5481a3e5cd@suse.com>
From: Juergen Gross <jgross@suse.com>
Message-ID: <e338abc3-5af6-7b0d-f8b6-d0f14ba48b2e@suse.com>
Date: Fri, 6 Sep 2019 11:21:24 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <a0fcc4f9-4f76-6e4b-5743-3f5481a3e5cd@suse.com>
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

T24gMDYuMDkuMTkgMTE6MTAsIEphbiBCZXVsaWNoIHdyb3RlOgo+IE9uIDA2LjA5LjIwMTkgMTA6
NDksIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6Cj4+IE9uIDA1LjA5LjE5IDE2OjQzLCBKYW4gQmV1bGlj
aCB3cm90ZToKPj4+IE9uIDA1LjA5LjIwMTkgMTY6MzYsIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6Cj4+
Pj4gT24gMDUuMDkuMTkgMTQ6NDYsIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6Cj4+Pj4+IE9uIDA1LjA5
LjE5IDE0OjM3LCBKYW4gQmV1bGljaCB3cm90ZToKPj4+Pj4+IE9uIDA1LjA5LjIwMTkgMTQ6Mjcs
IEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6Cj4+Pj4+Pj4gT24gMDUuMDkuMTkgMTQ6MjIsIEphbiBCZXVs
aWNoIHdyb3RlOgo+Pj4+Pj4+PiBPbiAwNS4wOS4yMDE5IDE0OjEyLCBKdWVyZ2VuIEdyb3NzIHdy
b3RlOgo+Pj4+Pj4+Pj4gT24gMDUuMDkuMTkgMTQ6MDEsIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+
Pj4+Pj4+IE9uIDA1LjA5LjIwMTkgMTM6MzksIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6Cj4+Pj4+Pj4+
Pj4+IEFzIGEgcHJlcGFyYXRpb24gZm9yIHBlci1jcHUgYnVmZmVycyBkbyBhIGxpdHRsZSByZWZh
Y3RvcmluZyBvZiB0aGUKPj4+Pj4+Pj4+Pj4gZGVidWd0cmFjZSBkYXRhOiBwdXQgdGhlIG5lZWRl
ZCBidWZmZXIgYWRtaW4gZGF0YSBpbnRvIHRoZSBidWZmZXIgYXMKPj4+Pj4+Pj4+Pj4gaXQgd2ls
bCBiZSBuZWVkZWQgZm9yIGVhY2ggYnVmZmVyLiBJbiBvcmRlciBub3QgdG8gbGltaXQgYnVmZmVy
IHNpemUKPj4+Pj4+Pj4+Pj4gc3dpdGNoIHRoZSByZWxhdGVkIGZpZWxkcyBmcm9tIHVuc2lnbmVk
IGludCB0byB1bnNpZ25lZCBsb25nLCBhcyBvbgo+Pj4+Pj4+Pj4+PiBodWdlIG1hY2hpbmVzIHdp
dGggUkFNIGluIHRoZSBUQiByYW5nZSBpdCBtaWdodCBiZSBpbnRlcmVzdGluZyB0bwo+Pj4+Pj4+
Pj4+PiBzdXBwb3J0IGJ1ZmZlcnMgPjRHQi4KPj4+Pj4+Pj4+Pgo+Pj4+Pj4+Pj4+IEp1c3QgYXMg
YSBmdXJ0aGVyIHJlbWFyayBpbiB0aGlzIHJlZ2FyZDoKPj4+Pj4+Pj4+Pgo+Pj4+Pj4+Pj4+PiAg
IMKgwqDCoCB2b2lkIGRlYnVndHJhY2VfcHJpbnRrKGNvbnN0IGNoYXIgKmZtdCwgLi4uKQo+Pj4+
Pj4+Pj4+PiAgIMKgwqDCoCB7Cj4+Pj4+Pj4+Pj4+ICAgwqDCoMKgwqDCoMKgwqAgc3RhdGljIGNo
YXIgYnVmW0RFQlVHX1RSQUNFX0VOVFJZX1NJWkVdOwo+Pj4+Pj4+Pj4+PiAtwqDCoMKgIHN0YXRp
YyB1bnNpZ25lZCBpbnQgY291bnQsIGxhc3RfY291bnQsIGxhc3RfcHJkOwo+Pj4+Pj4+Pj4+PiAr
wqDCoMKgIHN0YXRpYyB1bnNpZ25lZCBpbnQgY291bnQsIGxhc3RfY291bnQ7Cj4+Pj4+Pj4+Pj4K
Pj4+Pj4+Pj4+PiBIb3cgbG9uZyBkbyB3ZSB0aGluayB3aWxsIGl0IHRha2UgdW50aWwgdGhlaXIg
d3JhcHBpbmcgd2lsbCBiZWNvbWUKPj4+Pj4+Pj4+PiBhbiBpc3N1ZSB3aXRoIHN1Y2ggaHVnZSBi
dWZmZXJzPwo+Pj4+Pj4+Pj4KPj4+Pj4+Pj4+IENvdW50IHdyYXBwaW5nIHdpbGwgbm90IHJlc3Vs
dCBpbiBhbnkgbWlzYmVoYXZpb3Igb2YgdHJhY2luZy4gV2l0aAo+Pj4+Pj4+Pj4gcGVyLWNwdSBi
dWZmZXJzIGl0IG1pZ2h0IHJlc3VsdCBpbiBhbWJpZ3VpdHkgcmVnYXJkaW5nIHNvcnRpbmcgdGhl
Cj4+Pj4+Pj4+PiBlbnRyaWVzLCBidXQgSSBndWVzcyBjaGFuY2VzIGFyZSByYXRoZXIgbG93IHRo
aXMgYmVpbmcgYSByZWFsIGlzc3VlLgo+Pj4+Pj4+Pj4KPj4+Pj4+Pj4+IEJUVzogd3JhcHBpbmcg
b2YgY291bnQgaXMgbm90IHJlbGF0ZWQgdG8gYnVmZmVyIHNpemUsIGJ1dCB0byB0aGUKPj4+Pj4+
Pj4+IGFtb3VudCBvZiB0cmFjZSBkYXRhIHdyaXR0ZW4uCj4+Pj4+Pj4+Cj4+Pj4+Pj4+IFN1cmUs
IGJ1dCB0aGUgY2hhbmNlIG9mIGFtYmlndWl0eSBpbmNyZWFzZXMgd2l0aCBsYXJnZXIgYnVmZmVy
IHNpemVzLgo+Pj4+Pj4+Cj4+Pj4+Pj4gV2VsbCwgYmV0dGVyIHNhZmUgdGhhbiBzb3JyeS4gU3dp
dGNoaW5nIHRvIHVuc2lnbmVkIGxvbmcgd2lsbCByYXJlbHkKPj4+Pj4+PiBodXJ0LCBzbyBJJ20g
Z29pbmcgdG8gZG8ganVzdCB0aGF0LiBUaGUgb25seSBkb3duc2lkZSB3aWxsIGJlIHNvbWUgd2Fz
dGUKPj4+Pj4+PiBvZiBidWZmZXIgc3BhY2UgZm9yIHZlcnkgbG9uZyBydW5uaW5nIHRyYWNlcyB3
aXRoIGh1Z2UgYW1vdW50cyBvZgo+Pj4+Pj4+IGVudHJpZXMuCj4+Pj4+Pgo+Pj4+Pj4gSG1tLCB0
cnVlLiBNYXliZSB3ZSBjb3VsZCBnZXQgc29tZW9uZSBlbHNlJ3Mgb3BpbmlvbiBvbiB0aGlzIC0g
YW55b25lPwo+Pj4+Pgo+Pj4+PiBUQkgsIEkgd291bGRuJ3QgYmUgY29uY2VybmVkIGFib3V0IHRo
ZSBidWZmZXIgc3BhY2UuIEluIGNhc2UgdGhlcmUgYXJlCj4+Pj4+IHJlYWxseSBiaWxsaW9ucyBv
ZiBlbnRyaWVzLCB0aGUgZGlmZmVyZW5jZSBiZXR3ZWVuIGEgMTAtZGlnaXQgY291bnQKPj4+Pj4g
dmFsdWUgYW5kIG1heWJlIGEgMTUgZGlnaXQgb25lIChhbmQgdGhhdCBpcyBhbHJlYWR5IGEgbWFz
c2l2ZSBhbW91bnQpCj4+Pj4+IGlzbid0IHRoYXQgbGFyZ2UuIFRoZSBhdmVyYWdlIHByaW50ZWQg
c2l6ZSBvZiBjb3VudCB3aXRoIGFib3V0Cj4+Pj4+IDQgYmlsbGlvbiBlbnRyaWVzIGlzIDkuNzUg
ZGlnaXRzIChhbmQgbm90IGp1c3QgNSA6LSkgKS4KPj4+Pgo+Pj4+IEFub3RoZXIgb3B0aW9uIHdv
dWxkIGJlIHRvIGxldCBjb3VudCB3cmFwIGF0IGUuZy4gNCBiaWxsaW9uIChvciBldmVuIDEKPj4+
PiBtaWxsaW9uKSBhbmQgYWRkIGEgd3JhcCBjb3VudC4gRWFjaCBidWZmZXIgc3RydWN0IHdvdWxk
IGNvbnRhaW4gdGhlCj4+Pj4gd3JhcCBjb3VudCBvZiB0aGUgbGFzdCBlbnRyeSwgYW5kIHdoZW4g
aGl0dGluZyBhIGhpZ2hlciB3cmFwIGNvdW50IGEKPj4+PiBuZXcgZW50cnkgbGlrZSAoIndyYXAg
JXUtPiV1Iiwgb2xkX3dyYXAsIG5ld193cmFwKSB3b3VsZCBiZSBwcmludGVkLgo+Pj4+IFRoaXMg
c2F2ZXMgYnVmZmVyIHNwYWNlIHdpdGhvdXQgbG9vc2luZyBpbmZvcm1hdGlvbi4KPj4+Cj4+PiBU
aGlzIHNvdW5kcyBxdWl0ZSBuZWF0Lgo+Pgo+PiBJJ20gYWRkaW5nIGEgbmV3IHBhdGNoIGZvciB0
aGF0IHB1cnBvc2UsIGFzIGl0IGlzIGFkZGluZyBhIG5ldyBmZWF0dXJlLgo+Pgo+PiBBbnkgcHJl
ZmVyZW5jZXMgZm9yIHRoZSBtYXggdmFsdWUgb2YgY291bnQ/IEknbSBpbiBmYXZvciBvZiBsaW1p
dGluZyBpdAo+PiB0byA2LWRpZ2l0IG51bWJlcnMgYXMgdGhvc2UgYXJlIG11Y2ggZWFzaWVyIHRv
IGNvbXBhcmUgYnkganVzdCBsb29raW5nCj4+IGF0IHRoZW0uCj4gCj4gSSdtIG5vdCBvdmVybHkg
ZnVzc2VkOyBwZXJzb25hbGx5IEknZCBwcm9iYWJseSB3cmFwIGF0IDMwIGJpdHMsIG1ha2luZyBp
dAo+IGdlbmVyYWxseSB1cCB0byA4IGRpZ2l0cywganVzdCB2ZXJ5IHNsaWdodGx5IGdvaW5nIGlu
dG8gdGhlIDktZGlnaXQgcmFuZ2UuCgoyXjMwIGlzIGEgMTAtZGlnaXQgbnVtYmVyLiA6LSkKCkJ1
dCB3cmFwcGluZyBhdCAxMDAuMDAwLjAwMCBpcyBmaW5lLCB0b28sIGFzIGl0IGlzIGp1c3QKCiAg
IGlmICggY291bnQgPT0gMTAwMDAwMDAwICkKCmFuZCB0aGF0IGlzIG5vdCByZXF1aXJlZCB0byBi
ZSBhIG5pY2UgYmluYXJ5IG51bWJlci4KCgpKdWVyZ2VuCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZl
bEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxt
YW4vbGlzdGluZm8veGVuLWRldmVs
