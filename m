Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CA4FDAA645
	for <lists+xen-devel@lfdr.de>; Thu,  5 Sep 2019 16:46:27 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i5syt-0004lF-Iv; Thu, 05 Sep 2019 14:43:27 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=ezPI=XA=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1i5syr-0004lA-HV
 for xen-devel@lists.xenproject.org; Thu, 05 Sep 2019 14:43:25 +0000
X-Inumbo-ID: 83615934-cfeb-11e9-a337-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 83615934-cfeb-11e9-a337-bc764e2007e4;
 Thu, 05 Sep 2019 14:43:24 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 55D1EB0E6;
 Thu,  5 Sep 2019 14:43:23 +0000 (UTC)
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
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <88dca7fb-c1f5-d7e8-b59f-0169490cc9bf@suse.com>
Date: Thu, 5 Sep 2019 16:43:28 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <c417375c-b216-8160-e4aa-bc61e0a7a901@suse.com>
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

T24gMDUuMDkuMjAxOSAxNjozNiwgSnVlcmdlbiBHcm9zcyB3cm90ZToKPiBPbiAwNS4wOS4xOSAx
NDo0NiwgSnVlcmdlbiBHcm9zcyB3cm90ZToKPj4gT24gMDUuMDkuMTkgMTQ6MzcsIEphbiBCZXVs
aWNoIHdyb3RlOgo+Pj4gT24gMDUuMDkuMjAxOSAxNDoyNywgSnVlcmdlbiBHcm9zcyB3cm90ZToK
Pj4+PiBPbiAwNS4wOS4xOSAxNDoyMiwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4+IE9uIDA1LjA5
LjIwMTkgMTQ6MTIsIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6Cj4+Pj4+PiBPbiAwNS4wOS4xOSAxNDow
MSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4+Pj4gT24gMDUuMDkuMjAxOSAxMzozOSwgSnVlcmdl
biBHcm9zcyB3cm90ZToKPj4+Pj4+Pj4gQXMgYSBwcmVwYXJhdGlvbiBmb3IgcGVyLWNwdSBidWZm
ZXJzIGRvIGEgbGl0dGxlIHJlZmFjdG9yaW5nIG9mIHRoZQo+Pj4+Pj4+PiBkZWJ1Z3RyYWNlIGRh
dGE6IHB1dCB0aGUgbmVlZGVkIGJ1ZmZlciBhZG1pbiBkYXRhIGludG8gdGhlIGJ1ZmZlciBhcwo+
Pj4+Pj4+PiBpdCB3aWxsIGJlIG5lZWRlZCBmb3IgZWFjaCBidWZmZXIuIEluIG9yZGVyIG5vdCB0
byBsaW1pdCBidWZmZXIgc2l6ZQo+Pj4+Pj4+PiBzd2l0Y2ggdGhlIHJlbGF0ZWQgZmllbGRzIGZy
b20gdW5zaWduZWQgaW50IHRvIHVuc2lnbmVkIGxvbmcsIGFzIG9uCj4+Pj4+Pj4+IGh1Z2UgbWFj
aGluZXMgd2l0aCBSQU0gaW4gdGhlIFRCIHJhbmdlIGl0IG1pZ2h0IGJlIGludGVyZXN0aW5nIHRv
Cj4+Pj4+Pj4+IHN1cHBvcnQgYnVmZmVycyA+NEdCLgo+Pj4+Pj4+Cj4+Pj4+Pj4gSnVzdCBhcyBh
IGZ1cnRoZXIgcmVtYXJrIGluIHRoaXMgcmVnYXJkOgo+Pj4+Pj4+Cj4+Pj4+Pj4+IMKgwqDCoCB2
b2lkIGRlYnVndHJhY2VfcHJpbnRrKGNvbnN0IGNoYXIgKmZtdCwgLi4uKQo+Pj4+Pj4+PiDCoMKg
wqAgewo+Pj4+Pj4+PiDCoMKgwqDCoMKgwqDCoCBzdGF0aWMgY2hhciBidWZbREVCVUdfVFJBQ0Vf
RU5UUllfU0laRV07Cj4+Pj4+Pj4+IC3CoMKgwqAgc3RhdGljIHVuc2lnbmVkIGludCBjb3VudCwg
bGFzdF9jb3VudCwgbGFzdF9wcmQ7Cj4+Pj4+Pj4+ICvCoMKgwqAgc3RhdGljIHVuc2lnbmVkIGlu
dCBjb3VudCwgbGFzdF9jb3VudDsKPj4+Pj4+Pgo+Pj4+Pj4+IEhvdyBsb25nIGRvIHdlIHRoaW5r
IHdpbGwgaXQgdGFrZSB1bnRpbCB0aGVpciB3cmFwcGluZyB3aWxsIGJlY29tZQo+Pj4+Pj4+IGFu
IGlzc3VlIHdpdGggc3VjaCBodWdlIGJ1ZmZlcnM/Cj4+Pj4+Pgo+Pj4+Pj4gQ291bnQgd3JhcHBp
bmcgd2lsbCBub3QgcmVzdWx0IGluIGFueSBtaXNiZWhhdmlvciBvZiB0cmFjaW5nLiBXaXRoCj4+
Pj4+PiBwZXItY3B1IGJ1ZmZlcnMgaXQgbWlnaHQgcmVzdWx0IGluIGFtYmlndWl0eSByZWdhcmRp
bmcgc29ydGluZyB0aGUKPj4+Pj4+IGVudHJpZXMsIGJ1dCBJIGd1ZXNzIGNoYW5jZXMgYXJlIHJh
dGhlciBsb3cgdGhpcyBiZWluZyBhIHJlYWwgaXNzdWUuCj4+Pj4+Pgo+Pj4+Pj4gQlRXOiB3cmFw
cGluZyBvZiBjb3VudCBpcyBub3QgcmVsYXRlZCB0byBidWZmZXIgc2l6ZSwgYnV0IHRvIHRoZQo+
Pj4+Pj4gYW1vdW50IG9mIHRyYWNlIGRhdGEgd3JpdHRlbi4KPj4+Pj4KPj4+Pj4gU3VyZSwgYnV0
IHRoZSBjaGFuY2Ugb2YgYW1iaWd1aXR5IGluY3JlYXNlcyB3aXRoIGxhcmdlciBidWZmZXIgc2l6
ZXMuCj4+Pj4KPj4+PiBXZWxsLCBiZXR0ZXIgc2FmZSB0aGFuIHNvcnJ5LiBTd2l0Y2hpbmcgdG8g
dW5zaWduZWQgbG9uZyB3aWxsIHJhcmVseQo+Pj4+IGh1cnQsIHNvIEknbSBnb2luZyB0byBkbyBq
dXN0IHRoYXQuIFRoZSBvbmx5IGRvd25zaWRlIHdpbGwgYmUgc29tZSB3YXN0ZQo+Pj4+IG9mIGJ1
ZmZlciBzcGFjZSBmb3IgdmVyeSBsb25nIHJ1bm5pbmcgdHJhY2VzIHdpdGggaHVnZSBhbW91bnRz
IG9mCj4+Pj4gZW50cmllcy4KPj4+Cj4+PiBIbW0sIHRydWUuIE1heWJlIHdlIGNvdWxkIGdldCBz
b21lb25lIGVsc2UncyBvcGluaW9uIG9uIHRoaXMgLSBhbnlvbmU/Cj4+Cj4+IFRCSCwgSSB3b3Vs
ZG4ndCBiZSBjb25jZXJuZWQgYWJvdXQgdGhlIGJ1ZmZlciBzcGFjZS4gSW4gY2FzZSB0aGVyZSBh
cmUKPj4gcmVhbGx5IGJpbGxpb25zIG9mIGVudHJpZXMsIHRoZSBkaWZmZXJlbmNlIGJldHdlZW4g
YSAxMC1kaWdpdCBjb3VudAo+PiB2YWx1ZSBhbmQgbWF5YmUgYSAxNSBkaWdpdCBvbmUgKGFuZCB0
aGF0IGlzIGFscmVhZHkgYSBtYXNzaXZlIGFtb3VudCkKPj4gaXNuJ3QgdGhhdCBsYXJnZS4gVGhl
IGF2ZXJhZ2UgcHJpbnRlZCBzaXplIG9mIGNvdW50IHdpdGggYWJvdXQKPj4gNCBiaWxsaW9uIGVu
dHJpZXMgaXMgOS43NSBkaWdpdHMgKGFuZCBub3QganVzdCA1IDotKSApLgo+IAo+IEFub3RoZXIg
b3B0aW9uIHdvdWxkIGJlIHRvIGxldCBjb3VudCB3cmFwIGF0IGUuZy4gNCBiaWxsaW9uIChvciBl
dmVuIDEKPiBtaWxsaW9uKSBhbmQgYWRkIGEgd3JhcCBjb3VudC4gRWFjaCBidWZmZXIgc3RydWN0
IHdvdWxkIGNvbnRhaW4gdGhlCj4gd3JhcCBjb3VudCBvZiB0aGUgbGFzdCBlbnRyeSwgYW5kIHdo
ZW4gaGl0dGluZyBhIGhpZ2hlciB3cmFwIGNvdW50IGEKPiBuZXcgZW50cnkgbGlrZSAoIndyYXAg
JXUtPiV1Iiwgb2xkX3dyYXAsIG5ld193cmFwKSB3b3VsZCBiZSBwcmludGVkLgo+IFRoaXMgc2F2
ZXMgYnVmZmVyIHNwYWNlIHdpdGhvdXQgbG9vc2luZyBpbmZvcm1hdGlvbi4KClRoaXMgc291bmRz
IHF1aXRlIG5lYXQuCgpKYW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2pl
Y3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4t
ZGV2ZWw=
