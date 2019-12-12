Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 614FE11CF64
	for <lists+xen-devel@lfdr.de>; Thu, 12 Dec 2019 15:09:38 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ifP6g-000819-C1; Thu, 12 Dec 2019 14:06:18 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=R5lD=2C=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1ifP6f-000814-Dq
 for xen-devel@lists.xenproject.org; Thu, 12 Dec 2019 14:06:17 +0000
X-Inumbo-ID: 8a7bc32c-1ce8-11ea-88e7-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8a7bc32c-1ce8-11ea-88e7-bc764e2007e4;
 Thu, 12 Dec 2019 14:06:07 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 2CEC4ADF1;
 Thu, 12 Dec 2019 14:06:06 +0000 (UTC)
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <e43e17ea-6ad0-d125-216f-4798853e3116@suse.com>
 <20191211155436.GQ980@Air-de-Roger>
 <4316933a-b824-6544-8287-9f492b6543f4@suse.com>
 <20191212131558.GD11756@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <d543179e-72fa-8db0-3c4b-2a28a04370b9@suse.com>
Date: Thu, 12 Dec 2019 15:06:26 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <20191212131558.GD11756@Air-de-Roger>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] IOMMU: make DMA containment of quarantined
 devices optional
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
Cc: Juergen Gross <jgross@suse.com>, Kevin Tian <kevin.tian@intel.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <paul@xen.org>,
 Ian Jackson <ian.jackson@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTIuMTIuMjAxOSAxNDoxNSwgUm9nZXIgUGF1IE1vbm7DqSB3cm90ZToKPiBPbiBUaHUsIERl
YyAxMiwgMjAxOSBhdCAxMDoyODoyNkFNICswMTAwLCBKYW4gQmV1bGljaCB3cm90ZToKPj4gT24g
MTEuMTIuMjAxOSAxNjo1NCwgUm9nZXIgUGF1IE1vbm7DqSB3cm90ZToKPj4+IE9uIFdlZCwgRGVj
IDExLCAyMDE5IGF0IDAxOjUzOjAwUE0gKzAxMDAsIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+IC0t
LSBhL3hlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL2FtZC9wY2lfYW1kX2lvbW11LmMKPj4+PiArKysg
Yi94ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC9hbWQvcGNpX2FtZF9pb21tdS5jCj4+Pj4gQEAgLTg1
LDE4ICs4NSwzNiBAQCBpbnQgZ2V0X2RtYV9yZXF1ZXN0b3JfaWQodWludDE2X3Qgc2VnLCB1Cj4+
Pj4gICAgICByZXR1cm4gcmVxX2lkOwo+Pj4+ICB9Cj4+Pj4gIAo+Pj4+IC1zdGF0aWMgdm9pZCBh
bWRfaW9tbXVfc2V0dXBfZG9tYWluX2RldmljZSgKPj4+PiArc3RhdGljIGludCBfX211c3RfY2hl
Y2sgYWxsb2NhdGVfZG9tYWluX3Jlc291cmNlcyhzdHJ1Y3QgZG9tYWluX2lvbW11ICpoZCkKPj4+
PiArewo+Pj4+ICsgICAgaW50IHJjOwo+Pj4+ICsKPj4+PiArICAgIHNwaW5fbG9jaygmaGQtPmFy
Y2gubWFwcGluZ19sb2NrKTsKPj4+PiArICAgIHJjID0gYW1kX2lvbW11X2FsbG9jX3Jvb3QoaGQp
Owo+Pj4+ICsgICAgc3Bpbl91bmxvY2soJmhkLT5hcmNoLm1hcHBpbmdfbG9jayk7Cj4+Pj4gKwo+
Pj4+ICsgICAgcmV0dXJuIHJjOwo+Pj4+ICt9Cj4+Pj4gKwo+Pj4+ICtzdGF0aWMgaW50IF9fbXVz
dF9jaGVjayBhbWRfaW9tbXVfc2V0dXBfZG9tYWluX2RldmljZSgKPj4+PiAgICAgIHN0cnVjdCBk
b21haW4gKmRvbWFpbiwgc3RydWN0IGFtZF9pb21tdSAqaW9tbXUsCj4+Pj4gICAgICB1aW50OF90
IGRldmZuLCBzdHJ1Y3QgcGNpX2RldiAqcGRldikKPj4+PiAgewo+Pj4+ICAgICAgc3RydWN0IGFt
ZF9pb21tdV9kdGUgKnRhYmxlLCAqZHRlOwo+Pj4+ICAgICAgdW5zaWduZWQgbG9uZyBmbGFnczsK
Pj4+PiAtICAgIGludCByZXFfaWQsIHZhbGlkID0gMTsKPj4+PiArICAgIGludCByZXFfaWQsIHZh
bGlkID0gMSwgcmM7Cj4+Pj4gICAgICB1OCBidXMgPSBwZGV2LT5idXM7Cj4+Pj4gLSAgICBjb25z
dCBzdHJ1Y3QgZG9tYWluX2lvbW11ICpoZCA9IGRvbV9pb21tdShkb21haW4pOwo+Pj4+ICsgICAg
c3RydWN0IGRvbWFpbl9pb21tdSAqaGQgPSBkb21faW9tbXUoZG9tYWluKTsKPj4+PiArCj4+Pj4g
KyAgICAvKiBkb21faW8gaXMgdXNlZCBhcyBhIHNlbnRpbmVsIGZvciBxdWFyYW50aW5lZCBkZXZp
Y2VzICovCj4+Pj4gKyAgICBpZiAoIGRvbWFpbiA9PSBkb21faW8gJiYgIWhkLT5hcmNoLnJvb3Rf
dGFibGUgKQo+Pj4KPj4+IFRoaXMgY29uZGl0aW9uIChhbmQgaXQncyBJbnRlbCBjb3VudGVycGFy
dCkgd291bGQgYmUgYmV0dGVyIGluIGEgbWFjcm8KPj4+IElNTywgc28gdGhhdCB2ZW5kb3IgY29k
ZSByZWdhcmRsZXNzIG9mIHRoZSBpbXBsZW1lbnRhdGlvbiBjYW4gdXNlIHRoZQo+Pj4gc2FtZSBt
YWNybyAoYW5kIHRvIGF2b2lkIGhhdmluZyB0byBhZGQgdGhlIHNhbWUgY29tbWVudCBpbiBhbGwK
Pj4+IGluc3RhbmNlcyksIGllOiBJU19ERVZJQ0VfUVVBUkFOVElORUQgb3Igc29tZSBzdWNoIHdv
dWxkIGJlIGZpbmUgSU1PLgo+Pgo+PiBUaGUgImRldmljZSIgaW4gdGhlIG5hbWUgc3VnZ2VzdGVk
IGlzIGluYXBwbGljYWJsZSwgYXMgdGhlcmUncyBubwo+PiBkZXZpY2UgaW52b2x2ZWQgaGVyZS4g
VGhlIGNvbmRpdGlvbmFsIGFsc28gaXNuJ3QgYWJvdXQKPj4gInF1YXJhbnRpbmVkIiwgYnV0IGFi
b3V0IHRoZSBleHRlbmRlZCBmb3IgdGhlcmVvZi4KPiAKPiBNYXliZSBJU19RVUFSQU5USU5FX0ZV
TEwgb3IgSVNfRlVMTFlfUVVBUkFOVElORUQgb3Igc29tZXRoaW5nIHNpbWlsYXIKPiBpbiBvcmRl
ciB0byBtYXRjaCB0aGUgY29tbWFuZCBsaW5lIG9wdGlvbiB0aGVuPwoKQW5kIElTXyooKSBvciBp
c18qKCkgb3VnaHQgdG8gaGF2ZSBhbiBvYmplY3QgdG8gcGFzcyB0by4gV2hhdCB3b3VsZAp0aGUg
b2JqZWN0IGJlIGhlcmU/IFRoZSBkb21haW4gaXNuJ3QgYXBwbGljYWJsZS4gTWF5YmUgc29tZXRo
aW5nCmxpa2UgRlVMTF9RVUFSQU5USU5FX01PREUoKSAod2l0aG91dCBhbnkgcGFyYW1ldGVycykg
Li4uCgo+PiBJIGZ1cnRoZXIgZG9uJ3QKPj4gdW5kZXJzdGFuZCAidmVuZG9yIGNvZGUiIGluIHlv
dXIgcmVtYXJrOiBEaWZmZXJlbnQgbWFjcm9zIHdvdWxkIGJlCj4+IG5lZWRlZCBmb3IgZWl0aGVy
IHZlbmRvciBhbnl3YXkuCj4gCj4gWWVzLCBidXQgYm90aCBtYWNyb3Mgd291bGQgaGF2ZSB0aGUg
c2FtZSBuYW1lLCBoZW5jZSB5b3Ugd291bGRuJ3QgbmVlZAo+IHRvIHRoaW5rIHdoZXRoZXIgeW91
IGFyZSBpbiBBTUQgb3IgSW50ZWwgY29kZSBhcyB0aGUgbWFjcm8gd291bGQKPiBhbHdheXMgaGF2
ZSB0aGUgc2FtZSBuYW1lLgo+IAo+PiAoSSBkaWQgYWN0dWFsbHkgY29uc2lkZXIgaGF2aW5nCj4+
IHNvbWUga2luZCBvZiBwcmVkaWNhdGUgaGVscGVyLCBidXQgSSBjb3VsZG4ndCBjb21lIHVwIHdp
dGggYQo+PiBzdWZmaWNpZW50bHkgZ29vZCBuYW1lLiBJIGFsc28gdGhpbmsgc3VjaCBhbiBhYnN0
cmFjdGlvbiBzaG91bGQKPj4gdGhlbiBoYXZlIGJlZW4gaW50cm9kdWNlZCB3aGVuIHRoZXNlIGNv
bmRpdGlvbmFscyB3ZXJlIGZpcnN0IGFkZGVkCj4+IGluIHRoZWlyIHRoZW4gc3RpbGwgdmVuZG9y
IGluZGVwZW5kZW50IGZvcm0uKQo+IAo+IEkgd291bGQgcHJlZmVyIHNvbWUga2luZCBvZiBtYWNy
bywgYXMgSSB0aGluayB0aGVyZSdzIHF1aXRlIGEgbG90IG9mCj4gcmVwbGljYXRpb24gb2YgdGhv
c2UgdHdvIGNoZWNrcywgYW5kIElNTyBpdCdzIGVhc3kgdG8gYnkgbWlzdGFrZSB1c2UKPiB0aGUg
d3Jvbmcgb25lIHdoZW4gbW92aW5nIGJldHdlZW4gSW50ZWwgYW5kIEFNRCBjb2RlICh0aGUgbW9y
ZSB0aGF0Cj4gaXQgd291bGQgYnVpbGQgZmluZSBidXQgbGVhZCB0byBydW50aW1lIGlzc3Vlcyku
CgpNYWtlcyBzZW5zZSwgYXMgbG9uZyBhcyB3ZSBjYW4gZmluZCBhIGhhbGYgd2F5IHN1aXRhYmxl
IG5hbWUuCgo+Pj4+IC0tLSBhL3hlbi9pbmNsdWRlL3hlbi9pb21tdS5oCj4+Pj4gKysrIGIveGVu
L2luY2x1ZGUveGVuL2lvbW11LmgKPj4+PiBAQCAtNTMsOCArNTMsOSBAQCBzdGF0aWMgaW5saW5l
IGJvb2xfdCBkZm5fZXEoZGZuX3QgeCwgZGZuCj4+Pj4gIH0KPj4+PiAgCj4+Pj4gIGV4dGVybiBi
b29sX3QgaW9tbXVfZW5hYmxlLCBpb21tdV9lbmFibGVkOwo+Pj4+IC1leHRlcm4gYm9vbCBmb3Jj
ZV9pb21tdSwgaW9tbXVfcXVhcmFudGluZSwgaW9tbXVfdmVyYm9zZSwgaW9tbXVfaWdmeDsKPj4+
PiArZXh0ZXJuIGJvb2wgZm9yY2VfaW9tbXUsIGlvbW11X3ZlcmJvc2UsIGlvbW11X2lnZng7Cj4+
Pj4gIGV4dGVybiBib29sX3QgaW9tbXVfc25vb3AsIGlvbW11X3FpbnZhbCwgaW9tbXVfaW50cmVt
YXAsIGlvbW11X2ludHBvc3Q7Cj4+Pj4gK2V4dGVybiB1aW50OF90IGlvbW11X3F1YXJhbnRpbmU7
Cj4+Pgo+Pj4gRXhwb3J0aW5nIHRoaXMgdmFyaWFibGUgd2l0aG91dCB0aGUgcGFpcmVkIGRlZmlu
ZXMgc2VlbXMgcG9pbnRsZXNzLAo+Pj4gaG93IGFyZSBleHRlcm5hbCBjYWxsZXJzIHN1cHBvc2Vk
IHRvIGZpZ3VyZSBvdXQgdGhlIHF1YXJhbnRpbmUgbW9kZQo+Pj4gd2l0aG91dCB0aGUgSU9NTVVf
cXVhcmFudGluZV8qIGRlZmluZXM/Cj4+Cj4+IFdoeSBwb2ludGxlc3M/IE91dHNpZGUgb2YgdGhl
IGZpbGUga25vd2luZyB0aGUgSU9NTVVfcXVhcmFudGluZV8qCj4+IGRlZmluZXMgdGhlIHZhcmlh
YmxlIGNvbnRpbnVlcyB0byBoYXZlIGJvb2xlYW4gbWVhbmluZy4KPiAKPiBEbyB5b3UgdGhpbmsg
eW91IGNvdWxkIGFkZCBhIGNvbW1lbnQgdG8gdGhhdCBlZmZlY3Q/CgpXaWxsIGRvLgoKSmFuCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwg
bWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3Rz
LnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
