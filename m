Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1595B34D2A
	for <lists+xen-devel@lfdr.de>; Tue,  4 Jun 2019 18:24:30 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hYCCq-00014O-Gj; Tue, 04 Jun 2019 16:22:36 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=0KbE=UD=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hYCCp-00014F-F4
 for xen-devel@lists.xenproject.org; Tue, 04 Jun 2019 16:22:35 +0000
X-Inumbo-ID: f561078f-86e4-11e9-8980-bc764e045a96
Received: from foss.arm.com (unknown [217.140.101.70])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTP
 id f561078f-86e4-11e9-8980-bc764e045a96;
 Tue, 04 Jun 2019 16:22:33 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AFC97A78;
 Tue,  4 Jun 2019 09:22:33 -0700 (PDT)
Received: from [10.37.8.2] (unknown [10.37.8.2])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id EA6473F5AF;
 Tue,  4 Jun 2019 09:22:30 -0700 (PDT)
To: Jan Beulich <JBeulich@suse.com>
References: <20190603160350.29806-1-julien.grall@arm.com>
 <20190603160350.29806-8-julien.grall@arm.com>
 <5CF698EB0200007800235319@prv1-mh.provo.novell.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <b85178eb-05ad-da33-3f97-9fdcdf65727b@arm.com>
Date: Tue, 4 Jun 2019 17:22:29 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <5CF698EB0200007800235319@prv1-mh.provo.novell.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v3 07/14] xen: Introduce HAS_M2P config and
 use to protect mfn_to_gmfn call
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
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 "andrii_anisov@epam.com" <andrii_anisov@epam.com>, WeiLiu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 oleksandr_tyshchenko@epam.com, xen-devel <xen-devel@lists.xenproject.org>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgSmFuLAoKT24gNi80LzE5IDU6MTQgUE0sIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+IE9uIDAz
LjA2LjE5IGF0IDE4OjAzLCA8anVsaWVuLmdyYWxsQGFybS5jb20+IHdyb3RlOgo+PiBXaGlsZSBB
cm0gbmV2ZXIgaGFkIGEgTTJQLCB0aGUgaW1wbGVtZW50YXRpb24gb2YgbWZuX3RvX2dtZm4gaXMg
cHJldHR5Cj4+IGJvZ3VzIGFzIHdlIGRpcmVjdGx5IHJldHVybiB0aGUgTUZOIHBhc3NlZCBpbiBw
YXJhbWV0ZXIuCj4+Cj4+IFRoYW5rZnVsbHksIHRoZSB1c2Ugb2YgbWZuX3RvX2dtZm4gaXMgcHJl
dHR5IGxpbWl0ZWQgb24gQXJtIHRvZGF5LiBUaGVyZQo+PiBhcmUgb25seSAzIGNhbGxlcnM6Cj4+
ICAgICAgLSBpb21tdV9od2RvbV9pbml0OiBtZm5fdG9fZ21mbiBpcyB1c2VkIGZvciBjcmVhdGlu
ZyBJT01NVQo+PiAgICAgIHBhZ2UtdGFibGVzIHdoZW4gdGhlIFAyTSBpcyBub3Qgc2hhcmVkIHdp
dGggdGhlIElPTU1VLiBObyBpc3N1ZXMgc28KPj4gICAgICBmYXIgYXMgQXJtIGRvZXMgbm90IHll
dCBzdXBwb3J0IG5vbi1zaGFyZWQgUDJNIGNhc2UuCj4+ICAgICAgLSBtZW1vcnlfZXhjaGFuZ2U6
IEFybSBjYW5ub3Qgbm90IHVzZSBpdCBiZWNhdXNlIHN0ZWFsX3BhZ2UgaXMgbm90Cj4+ICAgICAg
aW1wbGVtZW50ZWQuCj4+ICAgICAgLSBnZXRkb21haW5pbmZvOiBUb29sc3RhY2sgbWF5IG1hcCB0
aGUgc2hhcmVkIHBhZ2UuIEl0IGxvb2tzIGxpa2UKPj4gICAgICB0aGlzIGlzIG1vc3RseSB1c2Vk
IGZvciBtYXBwaW5nIHRoZSBQMk0gb2YgUFYgZ3Vlc3QuIFRoZXJlZm9yZSB0aGUKPj4gICAgICBp
c3N1ZSBtaWdodCBiZSBtaW5vci4KPj4KPj4gSW1wbGVtZW50aW5nIHRoZSBNMlAgb24gQXJtIGlz
IG5vdCBwbGFubmVkLiBUaGUgTTJQIHdvdWxkIHJlcXVpcmUKPj4gc2lnbmlmaWNhbnQKPj4gYW1v
dW50IG9mIFZBIGFkZHJlc3MgKHZlcnkgdG91Z2ggb24gMzItYml0KSB0aGF0IGNhbiBoYXJkbHkg
YmUganVzdGlmaWVkIHdpdGgKPj4gdGhlIGN1cnJlbnQgdXNlIG9mIG1mbl90b19nbWZuLgo+PiAg
ICAgIC0gaW9tbXVfaHdkb21faW5pdDogbWZuX3RvX2dtZm4gaXMgdXNlZCBiZWNhdXNlIHRoZSBj
cmVhdGluZyBvZiB0aGUKPj4gICAgICBJT01NVSBwYWdlLXRhYmxlcyBpcyBkZWxheWVkIHVudGls
IHRoZSBmaXJzdCBkZXZpY2UgaXMgYXNzaWduZWQuCj4+ICAgICAgSW4gdGhlIGVtYmVkZGVkIGNh
c2UsIHdlIHdpbGwga25vd24gaW4gbW9zdCBvZiB0aGUgdGltZXMgd2hhdAo+PiAgICAgIGRldmlj
ZXMgYXJlIGFzc2lnbmVkIGR1cmluZyB0aGUgZG9tYWluIGNyZWF0aW9uLiBTbyBpdCBpcyBwb3Nz
aWJsZQo+PiAgICAgIHRvIHRha2UgdG8gZW5hYmxlIHRoZSBJT01NVSBmcm9tIHN0YXJ0LiBTZWUg
WzFdIGZvciB0aGUgcGF0Y2guCj4+ICAgICAgLSBtZW1vcnlfZXhjaGFuZ2U6IFRoaXMgZG9lcyBu
b3Qgd29yayBhbmQgSSBoYXZlbid0IHNlZW4gYW55Cj4+ICAgICAgcmVxdWVzdCBmb3IgaXQgc28g
ZmFyLgo+PiAgICAgIC0gZ2V0ZG9tYWluaW5mbzogVGhlIHN0cnVjdHVyZSBvbiBBcm0gZG9lcyBu
b3Qgc2VlbSB0byBjb250YWluIGEgbG90Cj4+ICAgICAgb2YgdXNlZnVsIGluZm9ybWF0aW9uIG9u
IEFybS4gSXQgaXMgdW5jbGVhciB3aGV0aGVyIHdlIHdhbnQgdG8KPj4gICAgICBhbGxvdyB0aGUg
dG9vbHN0YWNrIG1hcHBpbmcgaXQgb24gQXJtLgo+Pgo+PiBUaGlzIHBhdGNoIGludHJvZHVjZXMg
YSBjb25maWcgb3B0aW9uIEhBU19NMlAgdG8gdGVsbCB3aGV0aGVyIGFuCj4+IGFyY2hpdGVjdHVy
ZSBpbXBsZW1lbnRzIHRoZSBNMlAuCj4+ICAgICAgLSBpb21tdV9od2RvbV9pbml0OiBGb3Igbm93
LCB3ZSByZXF1aXJlIHRoZSBNMlAgc3VwcG9ydCB3aGVuIHRoZSBJT01NVQo+PiAgICAgIGlzIG5v
dCBzaGFyaW5nIHRoZSBQMk0uCj4+ICAgICAgLSBtZW1vcnlfZXhjaGFuZ2U6IFRoZSBoeXBlcmNh
bGwgaXMgbWFya2VkIGFzIG5vdCBzdXBwb3J0ZWQgd2hlbiB0aGUKPj4gICAgICBNMlAgZG9lcyBu
b3QgZXhpc3QuCj4gCj4gQnV0IHdoZXJlJ3MgdGhlIGNvbm5lY3Rpb24gYmV0d2VlbiB0aGVyZSBi
ZWluZyBNMlAgYW5kIHRoZQo+IGF2YWlsYWJpbGl0eSBvZiB0aGlzIG9wZXJhdGlvbj8gSSB0aGlu
ayBJJ3ZlIHN1Z2dlc3RlZCBzbyBiZWZvcmU6Cj4gV2h5IGRvbid0IHdlIHNpbXBseSBkaXNhYmxl
IHRoaXMgb3BlcmF0aW9uIGZvciB0cmFuc2xhdGVkCj4gZ3Vlc3RzIChpbiBhbiBpbmRlcGVuZGVu
dCBwYXRjaCk/CgpBbmQgSSBhbnN3ZXJlZCB0aGF0IG1mbl90b19nbWZuKCkgaXMgdXNlZCBpbiB0
aGUgZnVuY3Rpb24uIEkgcmVhbGx5IApkb24ndCB3YW50IHRvIGltcGxlbWVudCB0aGUgbWFjcm8g
b24gQXJtIChldmVuIGlmIGl0IGlzIGR1bW15KS4KCllvdSBoYXZlbid0IGFuc3dlcmVkIGJhY2sg
dG8gdGhhdCBjb21tZW50IGFuZCBJIGFzc3VtZWQgdGhpcyB3YXMgZmluZSAKd2l0aCB5b3UuLi4K
Cj4gCj4+ICAgICAgLSBnZXRkb21haW5pbmZvOiBBIG5ldyBoZWxwZXIgaXMgaW50cm9kdWNlZCB0
byB3cmFwIHRoZSBjYWxsIHRvCj4+ICAgICAgbWZuX3RvX2dmbi9tZm5fdG9fZ21mbi4gRm9yIEFy
bSwgYSBmaXhlZCB2YWx1ZSB3aWxsIGJlIHByb3ZpZGVkIHRoYXQgd2lsbAo+PiAgICAgIGZhaWwg
b24gbWFwcGluZyBpZiB1c2VkLgo+IAo+IFRoaXMgcmVhZHMgc2xpZ2h0bHkgc3RhbGUgbm93LgoK
b2suCgo+IAo+PiAtLS0gYS94ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC9pb21tdS5jCj4+ICsrKyBi
L3hlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL2lvbW11LmMKPj4gQEAgLTE4OCw5ICsxODgsMTAgQEAg
dm9pZCBfX2h3ZG9tX2luaXQgaW9tbXVfaHdkb21faW5pdChzdHJ1Y3QgZG9tYWluICpkKQo+PiAg
ICAgICBoZC0+bmVlZF9zeW5jID0gaW9tbXVfaHdkb21fc3RyaWN0ICYmICFpb21tdV91c2VfaGFw
X3B0KGQpOwo+PiAgICAgICBpZiAoIG5lZWRfaW9tbXVfcHRfc3luYyhkKSApCj4+ICAgICAgIHsK
Pj4gKyAgICAgICAgaW50IHJjID0gMDsKPj4gKyNpZmRlZiBDT05GSUdfSEFTX00yUAo+PiAgICAg
ICAgICAgc3RydWN0IHBhZ2VfaW5mbyAqcGFnZTsKPj4gICAgICAgICAgIHVuc2lnbmVkIGludCBp
ID0gMCwgZmx1c2hfZmxhZ3MgPSAwOwo+PiAtICAgICAgICBpbnQgcmMgPSAwOwo+PiAgIAo+PiAg
ICAgICAgICAgcGFnZV9saXN0X2Zvcl9lYWNoICggcGFnZSwgJmQtPnBhZ2VfbGlzdCApCj4+ICAg
ICAgICAgICB7Cj4+IEBAIC0yMjEsNiArMjIyLDExIEBAIHZvaWQgX19od2RvbV9pbml0IGlvbW11
X2h3ZG9tX2luaXQoc3RydWN0IGRvbWFpbiAqZCkKPj4gICAgICAgICAgIGlmICggcmMgKQo+PiAg
ICAgICAgICAgICAgIHByaW50ayhYRU5MT0dfV0FSTklORyAiZCVkOiBJT01NVSBtYXBwaW5nIGZh
aWxlZDogJWRcbiIsCj4+ICAgICAgICAgICAgICAgICAgICAgIGQtPmRvbWFpbl9pZCwgcmMpOwo+
PiArI2Vsc2UKPj4gKyAgICAgICAgQVNTRVJUX1VOUkVBQ0hBQkxFKCk7Cj4+ICsgICAgICAgIHJj
ID0gLUVPUE5PVFNVUFA7Cj4+ICsjZW5kaWYKPj4gKwo+PiAgICAgICB9Cj4gCj4gUGxlYXNlIGRv
bid0IGFkZCBhIGJsYW5rIGxpbmUgYWhlYWQgb2YgYSBjbG9zaW5nIGJyYWNlLgoKb2suCgpDaGVl
cnMsCgotLSAKSnVsaWVuIEdyYWxsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5w
cm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8v
eGVuLWRldmVs
