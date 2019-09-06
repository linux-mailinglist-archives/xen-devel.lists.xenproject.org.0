Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AF84AB4B5
	for <lists+xen-devel@lfdr.de>; Fri,  6 Sep 2019 11:14:40 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i6AGa-0004cH-OS; Fri, 06 Sep 2019 09:10:52 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=ai1O=XB=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1i6AGZ-0004cC-5X
 for xen-devel@lists.xenproject.org; Fri, 06 Sep 2019 09:10:51 +0000
X-Inumbo-ID: 379f6752-d086-11e9-a337-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 379f6752-d086-11e9-a337-bc764e2007e4;
 Fri, 06 Sep 2019 09:10:49 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 414D1B6B0;
 Fri,  6 Sep 2019 09:10:48 +0000 (UTC)
To: Juergen Gross <jgross@suse.com>
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
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <a0fcc4f9-4f76-6e4b-5743-3f5481a3e5cd@suse.com>
Date: Fri, 6 Sep 2019 11:10:56 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <65545e29-c6c2-ba2a-0626-e3c4f9867217@suse.com>
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
 Julien Grall <julien.grall@arm.com>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDYuMDkuMjAxOSAxMDo0OSwgSnVlcmdlbiBHcm9zcyB3cm90ZToKPiBPbiAwNS4wOS4xOSAx
Njo0MywgSmFuIEJldWxpY2ggd3JvdGU6Cj4+IE9uIDA1LjA5LjIwMTkgMTY6MzYsIEp1ZXJnZW4g
R3Jvc3Mgd3JvdGU6Cj4+PiBPbiAwNS4wOS4xOSAxNDo0NiwgSnVlcmdlbiBHcm9zcyB3cm90ZToK
Pj4+PiBPbiAwNS4wOS4xOSAxNDozNywgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4+IE9uIDA1LjA5
LjIwMTkgMTQ6MjcsIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6Cj4+Pj4+PiBPbiAwNS4wOS4xOSAxNDoy
MiwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4+Pj4gT24gMDUuMDkuMjAxOSAxNDoxMiwgSnVlcmdl
biBHcm9zcyB3cm90ZToKPj4+Pj4+Pj4gT24gMDUuMDkuMTkgMTQ6MDEsIEphbiBCZXVsaWNoIHdy
b3RlOgo+Pj4+Pj4+Pj4gT24gMDUuMDkuMjAxOSAxMzozOSwgSnVlcmdlbiBHcm9zcyB3cm90ZToK
Pj4+Pj4+Pj4+PiBBcyBhIHByZXBhcmF0aW9uIGZvciBwZXItY3B1IGJ1ZmZlcnMgZG8gYSBsaXR0
bGUgcmVmYWN0b3Jpbmcgb2YgdGhlCj4+Pj4+Pj4+Pj4gZGVidWd0cmFjZSBkYXRhOiBwdXQgdGhl
IG5lZWRlZCBidWZmZXIgYWRtaW4gZGF0YSBpbnRvIHRoZSBidWZmZXIgYXMKPj4+Pj4+Pj4+PiBp
dCB3aWxsIGJlIG5lZWRlZCBmb3IgZWFjaCBidWZmZXIuIEluIG9yZGVyIG5vdCB0byBsaW1pdCBi
dWZmZXIgc2l6ZQo+Pj4+Pj4+Pj4+IHN3aXRjaCB0aGUgcmVsYXRlZCBmaWVsZHMgZnJvbSB1bnNp
Z25lZCBpbnQgdG8gdW5zaWduZWQgbG9uZywgYXMgb24KPj4+Pj4+Pj4+PiBodWdlIG1hY2hpbmVz
IHdpdGggUkFNIGluIHRoZSBUQiByYW5nZSBpdCBtaWdodCBiZSBpbnRlcmVzdGluZyB0bwo+Pj4+
Pj4+Pj4+IHN1cHBvcnQgYnVmZmVycyA+NEdCLgo+Pj4+Pj4+Pj4KPj4+Pj4+Pj4+IEp1c3QgYXMg
YSBmdXJ0aGVyIHJlbWFyayBpbiB0aGlzIHJlZ2FyZDoKPj4+Pj4+Pj4+Cj4+Pj4+Pj4+Pj4gIMKg
wqDCoCB2b2lkIGRlYnVndHJhY2VfcHJpbnRrKGNvbnN0IGNoYXIgKmZtdCwgLi4uKQo+Pj4+Pj4+
Pj4+ICDCoMKgwqAgewo+Pj4+Pj4+Pj4+ICDCoMKgwqDCoMKgwqDCoCBzdGF0aWMgY2hhciBidWZb
REVCVUdfVFJBQ0VfRU5UUllfU0laRV07Cj4+Pj4+Pj4+Pj4gLcKgwqDCoCBzdGF0aWMgdW5zaWdu
ZWQgaW50IGNvdW50LCBsYXN0X2NvdW50LCBsYXN0X3ByZDsKPj4+Pj4+Pj4+PiArwqDCoMKgIHN0
YXRpYyB1bnNpZ25lZCBpbnQgY291bnQsIGxhc3RfY291bnQ7Cj4+Pj4+Pj4+Pgo+Pj4+Pj4+Pj4g
SG93IGxvbmcgZG8gd2UgdGhpbmsgd2lsbCBpdCB0YWtlIHVudGlsIHRoZWlyIHdyYXBwaW5nIHdp
bGwgYmVjb21lCj4+Pj4+Pj4+PiBhbiBpc3N1ZSB3aXRoIHN1Y2ggaHVnZSBidWZmZXJzPwo+Pj4+
Pj4+Pgo+Pj4+Pj4+PiBDb3VudCB3cmFwcGluZyB3aWxsIG5vdCByZXN1bHQgaW4gYW55IG1pc2Jl
aGF2aW9yIG9mIHRyYWNpbmcuIFdpdGgKPj4+Pj4+Pj4gcGVyLWNwdSBidWZmZXJzIGl0IG1pZ2h0
IHJlc3VsdCBpbiBhbWJpZ3VpdHkgcmVnYXJkaW5nIHNvcnRpbmcgdGhlCj4+Pj4+Pj4+IGVudHJp
ZXMsIGJ1dCBJIGd1ZXNzIGNoYW5jZXMgYXJlIHJhdGhlciBsb3cgdGhpcyBiZWluZyBhIHJlYWwg
aXNzdWUuCj4+Pj4+Pj4+Cj4+Pj4+Pj4+IEJUVzogd3JhcHBpbmcgb2YgY291bnQgaXMgbm90IHJl
bGF0ZWQgdG8gYnVmZmVyIHNpemUsIGJ1dCB0byB0aGUKPj4+Pj4+Pj4gYW1vdW50IG9mIHRyYWNl
IGRhdGEgd3JpdHRlbi4KPj4+Pj4+Pgo+Pj4+Pj4+IFN1cmUsIGJ1dCB0aGUgY2hhbmNlIG9mIGFt
YmlndWl0eSBpbmNyZWFzZXMgd2l0aCBsYXJnZXIgYnVmZmVyIHNpemVzLgo+Pj4+Pj4KPj4+Pj4+
IFdlbGwsIGJldHRlciBzYWZlIHRoYW4gc29ycnkuIFN3aXRjaGluZyB0byB1bnNpZ25lZCBsb25n
IHdpbGwgcmFyZWx5Cj4+Pj4+PiBodXJ0LCBzbyBJJ20gZ29pbmcgdG8gZG8ganVzdCB0aGF0LiBU
aGUgb25seSBkb3duc2lkZSB3aWxsIGJlIHNvbWUgd2FzdGUKPj4+Pj4+IG9mIGJ1ZmZlciBzcGFj
ZSBmb3IgdmVyeSBsb25nIHJ1bm5pbmcgdHJhY2VzIHdpdGggaHVnZSBhbW91bnRzIG9mCj4+Pj4+
PiBlbnRyaWVzLgo+Pj4+Pgo+Pj4+PiBIbW0sIHRydWUuIE1heWJlIHdlIGNvdWxkIGdldCBzb21l
b25lIGVsc2UncyBvcGluaW9uIG9uIHRoaXMgLSBhbnlvbmU/Cj4+Pj4KPj4+PiBUQkgsIEkgd291
bGRuJ3QgYmUgY29uY2VybmVkIGFib3V0IHRoZSBidWZmZXIgc3BhY2UuIEluIGNhc2UgdGhlcmUg
YXJlCj4+Pj4gcmVhbGx5IGJpbGxpb25zIG9mIGVudHJpZXMsIHRoZSBkaWZmZXJlbmNlIGJldHdl
ZW4gYSAxMC1kaWdpdCBjb3VudAo+Pj4+IHZhbHVlIGFuZCBtYXliZSBhIDE1IGRpZ2l0IG9uZSAo
YW5kIHRoYXQgaXMgYWxyZWFkeSBhIG1hc3NpdmUgYW1vdW50KQo+Pj4+IGlzbid0IHRoYXQgbGFy
Z2UuIFRoZSBhdmVyYWdlIHByaW50ZWQgc2l6ZSBvZiBjb3VudCB3aXRoIGFib3V0Cj4+Pj4gNCBi
aWxsaW9uIGVudHJpZXMgaXMgOS43NSBkaWdpdHMgKGFuZCBub3QganVzdCA1IDotKSApLgo+Pj4K
Pj4+IEFub3RoZXIgb3B0aW9uIHdvdWxkIGJlIHRvIGxldCBjb3VudCB3cmFwIGF0IGUuZy4gNCBi
aWxsaW9uIChvciBldmVuIDEKPj4+IG1pbGxpb24pIGFuZCBhZGQgYSB3cmFwIGNvdW50LiBFYWNo
IGJ1ZmZlciBzdHJ1Y3Qgd291bGQgY29udGFpbiB0aGUKPj4+IHdyYXAgY291bnQgb2YgdGhlIGxh
c3QgZW50cnksIGFuZCB3aGVuIGhpdHRpbmcgYSBoaWdoZXIgd3JhcCBjb3VudCBhCj4+PiBuZXcg
ZW50cnkgbGlrZSAoIndyYXAgJXUtPiV1Iiwgb2xkX3dyYXAsIG5ld193cmFwKSB3b3VsZCBiZSBw
cmludGVkLgo+Pj4gVGhpcyBzYXZlcyBidWZmZXIgc3BhY2Ugd2l0aG91dCBsb29zaW5nIGluZm9y
bWF0aW9uLgo+Pgo+PiBUaGlzIHNvdW5kcyBxdWl0ZSBuZWF0Lgo+IAo+IEknbSBhZGRpbmcgYSBu
ZXcgcGF0Y2ggZm9yIHRoYXQgcHVycG9zZSwgYXMgaXQgaXMgYWRkaW5nIGEgbmV3IGZlYXR1cmUu
Cj4gCj4gQW55IHByZWZlcmVuY2VzIGZvciB0aGUgbWF4IHZhbHVlIG9mIGNvdW50PyBJJ20gaW4g
ZmF2b3Igb2YgbGltaXRpbmcgaXQKPiB0byA2LWRpZ2l0IG51bWJlcnMgYXMgdGhvc2UgYXJlIG11
Y2ggZWFzaWVyIHRvIGNvbXBhcmUgYnkganVzdCBsb29raW5nCj4gYXQgdGhlbS4KCkknbSBub3Qg
b3Zlcmx5IGZ1c3NlZDsgcGVyc29uYWxseSBJJ2QgcHJvYmFibHkgd3JhcCBhdCAzMCBiaXRzLCBt
YWtpbmcgaXQKZ2VuZXJhbGx5IHVwIHRvIDggZGlnaXRzLCBqdXN0IHZlcnkgc2xpZ2h0bHkgZ29p
bmcgaW50byB0aGUgOS1kaWdpdCByYW5nZS4KCkphbgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxA
bGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL3hlbi1kZXZlbA==
