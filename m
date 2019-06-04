Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8413534D0E
	for <lists+xen-devel@lfdr.de>; Tue,  4 Jun 2019 18:17:29 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hYC5A-0008LG-UN; Tue, 04 Jun 2019 16:14:40 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=8ILU=UD=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hYC59-0008L3-FB
 for xen-devel@lists.xenproject.org; Tue, 04 Jun 2019 16:14:39 +0000
X-Inumbo-ID: d98dfca3-86e3-11e9-8980-bc764e045a96
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id d98dfca3-86e3-11e9-8980-bc764e045a96;
 Tue, 04 Jun 2019 16:14:38 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Tue, 04 Jun 2019 10:14:37 -0600
Message-Id: <5CF698EB0200007800235319@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.1 
Date: Tue, 04 Jun 2019 10:14:35 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "Julien Grall" <julien.grall@arm.com>
References: <20190603160350.29806-1-julien.grall@arm.com>
 <20190603160350.29806-8-julien.grall@arm.com>
In-Reply-To: <20190603160350.29806-8-julien.grall@arm.com>
Mime-Version: 1.0
Content-Disposition: inline
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Pj4+IE9uIDAzLjA2LjE5IGF0IDE4OjAzLCA8anVsaWVuLmdyYWxsQGFybS5jb20+IHdyb3RlOgo+
IFdoaWxlIEFybSBuZXZlciBoYWQgYSBNMlAsIHRoZSBpbXBsZW1lbnRhdGlvbiBvZiBtZm5fdG9f
Z21mbiBpcyBwcmV0dHkKPiBib2d1cyBhcyB3ZSBkaXJlY3RseSByZXR1cm4gdGhlIE1GTiBwYXNz
ZWQgaW4gcGFyYW1ldGVyLgo+IAo+IFRoYW5rZnVsbHksIHRoZSB1c2Ugb2YgbWZuX3RvX2dtZm4g
aXMgcHJldHR5IGxpbWl0ZWQgb24gQXJtIHRvZGF5LiBUaGVyZQo+IGFyZSBvbmx5IDMgY2FsbGVy
czoKPiAgICAgLSBpb21tdV9od2RvbV9pbml0OiBtZm5fdG9fZ21mbiBpcyB1c2VkIGZvciBjcmVh
dGluZyBJT01NVQo+ICAgICBwYWdlLXRhYmxlcyB3aGVuIHRoZSBQMk0gaXMgbm90IHNoYXJlZCB3
aXRoIHRoZSBJT01NVS4gTm8gaXNzdWVzIHNvCj4gICAgIGZhciBhcyBBcm0gZG9lcyBub3QgeWV0
IHN1cHBvcnQgbm9uLXNoYXJlZCBQMk0gY2FzZS4KPiAgICAgLSBtZW1vcnlfZXhjaGFuZ2U6IEFy
bSBjYW5ub3Qgbm90IHVzZSBpdCBiZWNhdXNlIHN0ZWFsX3BhZ2UgaXMgbm90Cj4gICAgIGltcGxl
bWVudGVkLgo+ICAgICAtIGdldGRvbWFpbmluZm86IFRvb2xzdGFjayBtYXkgbWFwIHRoZSBzaGFy
ZWQgcGFnZS4gSXQgbG9va3MgbGlrZQo+ICAgICB0aGlzIGlzIG1vc3RseSB1c2VkIGZvciBtYXBw
aW5nIHRoZSBQMk0gb2YgUFYgZ3Vlc3QuIFRoZXJlZm9yZSB0aGUKPiAgICAgaXNzdWUgbWlnaHQg
YmUgbWlub3IuCj4gCj4gSW1wbGVtZW50aW5nIHRoZSBNMlAgb24gQXJtIGlzIG5vdCBwbGFubmVk
LiBUaGUgTTJQIHdvdWxkIHJlcXVpcmUgCj4gc2lnbmlmaWNhbnQKPiBhbW91bnQgb2YgVkEgYWRk
cmVzcyAodmVyeSB0b3VnaCBvbiAzMi1iaXQpIHRoYXQgY2FuIGhhcmRseSBiZSBqdXN0aWZpZWQg
d2l0aAo+IHRoZSBjdXJyZW50IHVzZSBvZiBtZm5fdG9fZ21mbi4KPiAgICAgLSBpb21tdV9od2Rv
bV9pbml0OiBtZm5fdG9fZ21mbiBpcyB1c2VkIGJlY2F1c2UgdGhlIGNyZWF0aW5nIG9mIHRoZQo+
ICAgICBJT01NVSBwYWdlLXRhYmxlcyBpcyBkZWxheWVkIHVudGlsIHRoZSBmaXJzdCBkZXZpY2Ug
aXMgYXNzaWduZWQuCj4gICAgIEluIHRoZSBlbWJlZGRlZCBjYXNlLCB3ZSB3aWxsIGtub3duIGlu
IG1vc3Qgb2YgdGhlIHRpbWVzIHdoYXQKPiAgICAgZGV2aWNlcyBhcmUgYXNzaWduZWQgZHVyaW5n
IHRoZSBkb21haW4gY3JlYXRpb24uIFNvIGl0IGlzIHBvc3NpYmxlCj4gICAgIHRvIHRha2UgdG8g
ZW5hYmxlIHRoZSBJT01NVSBmcm9tIHN0YXJ0LiBTZWUgWzFdIGZvciB0aGUgcGF0Y2guCj4gICAg
IC0gbWVtb3J5X2V4Y2hhbmdlOiBUaGlzIGRvZXMgbm90IHdvcmsgYW5kIEkgaGF2ZW4ndCBzZWVu
IGFueQo+ICAgICByZXF1ZXN0IGZvciBpdCBzbyBmYXIuCj4gICAgIC0gZ2V0ZG9tYWluaW5mbzog
VGhlIHN0cnVjdHVyZSBvbiBBcm0gZG9lcyBub3Qgc2VlbSB0byBjb250YWluIGEgbG90Cj4gICAg
IG9mIHVzZWZ1bCBpbmZvcm1hdGlvbiBvbiBBcm0uIEl0IGlzIHVuY2xlYXIgd2hldGhlciB3ZSB3
YW50IHRvCj4gICAgIGFsbG93IHRoZSB0b29sc3RhY2sgbWFwcGluZyBpdCBvbiBBcm0uCj4gCj4g
VGhpcyBwYXRjaCBpbnRyb2R1Y2VzIGEgY29uZmlnIG9wdGlvbiBIQVNfTTJQIHRvIHRlbGwgd2hl
dGhlciBhbgo+IGFyY2hpdGVjdHVyZSBpbXBsZW1lbnRzIHRoZSBNMlAuCj4gICAgIC0gaW9tbXVf
aHdkb21faW5pdDogRm9yIG5vdywgd2UgcmVxdWlyZSB0aGUgTTJQIHN1cHBvcnQgd2hlbiB0aGUg
SU9NTVUKPiAgICAgaXMgbm90IHNoYXJpbmcgdGhlIFAyTS4KPiAgICAgLSBtZW1vcnlfZXhjaGFu
Z2U6IFRoZSBoeXBlcmNhbGwgaXMgbWFya2VkIGFzIG5vdCBzdXBwb3J0ZWQgd2hlbiB0aGUKPiAg
ICAgTTJQIGRvZXMgbm90IGV4aXN0LgoKQnV0IHdoZXJlJ3MgdGhlIGNvbm5lY3Rpb24gYmV0d2Vl
biB0aGVyZSBiZWluZyBNMlAgYW5kIHRoZQphdmFpbGFiaWxpdHkgb2YgdGhpcyBvcGVyYXRpb24/
IEkgdGhpbmsgSSd2ZSBzdWdnZXN0ZWQgc28gYmVmb3JlOgpXaHkgZG9uJ3Qgd2Ugc2ltcGx5IGRp
c2FibGUgdGhpcyBvcGVyYXRpb24gZm9yIHRyYW5zbGF0ZWQKZ3Vlc3RzIChpbiBhbiBpbmRlcGVu
ZGVudCBwYXRjaCk/Cgo+ICAgICAtIGdldGRvbWFpbmluZm86IEEgbmV3IGhlbHBlciBpcyBpbnRy
b2R1Y2VkIHRvIHdyYXAgdGhlIGNhbGwgdG8KPiAgICAgbWZuX3RvX2dmbi9tZm5fdG9fZ21mbi4g
Rm9yIEFybSwgYSBmaXhlZCB2YWx1ZSB3aWxsIGJlIHByb3ZpZGVkIHRoYXQgd2lsbAo+ICAgICBm
YWlsIG9uIG1hcHBpbmcgaWYgdXNlZC4KClRoaXMgcmVhZHMgc2xpZ2h0bHkgc3RhbGUgbm93LgoK
PiAtLS0gYS94ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC9pb21tdS5jCj4gKysrIGIveGVuL2RyaXZl
cnMvcGFzc3Rocm91Z2gvaW9tbXUuYwo+IEBAIC0xODgsOSArMTg4LDEwIEBAIHZvaWQgX19od2Rv
bV9pbml0IGlvbW11X2h3ZG9tX2luaXQoc3RydWN0IGRvbWFpbiAqZCkKPiAgICAgIGhkLT5uZWVk
X3N5bmMgPSBpb21tdV9od2RvbV9zdHJpY3QgJiYgIWlvbW11X3VzZV9oYXBfcHQoZCk7Cj4gICAg
ICBpZiAoIG5lZWRfaW9tbXVfcHRfc3luYyhkKSApCj4gICAgICB7Cj4gKyAgICAgICAgaW50IHJj
ID0gMDsKPiArI2lmZGVmIENPTkZJR19IQVNfTTJQCj4gICAgICAgICAgc3RydWN0IHBhZ2VfaW5m
byAqcGFnZTsKPiAgICAgICAgICB1bnNpZ25lZCBpbnQgaSA9IDAsIGZsdXNoX2ZsYWdzID0gMDsK
PiAtICAgICAgICBpbnQgcmMgPSAwOwo+ICAKPiAgICAgICAgICBwYWdlX2xpc3RfZm9yX2VhY2gg
KCBwYWdlLCAmZC0+cGFnZV9saXN0ICkKPiAgICAgICAgICB7Cj4gQEAgLTIyMSw2ICsyMjIsMTEg
QEAgdm9pZCBfX2h3ZG9tX2luaXQgaW9tbXVfaHdkb21faW5pdChzdHJ1Y3QgZG9tYWluICpkKQo+
ICAgICAgICAgIGlmICggcmMgKQo+ICAgICAgICAgICAgICBwcmludGsoWEVOTE9HX1dBUk5JTkcg
ImQlZDogSU9NTVUgbWFwcGluZyBmYWlsZWQ6ICVkXG4iLAo+ICAgICAgICAgICAgICAgICAgICAg
ZC0+ZG9tYWluX2lkLCByYyk7Cj4gKyNlbHNlCj4gKyAgICAgICAgQVNTRVJUX1VOUkVBQ0hBQkxF
KCk7Cj4gKyAgICAgICAgcmMgPSAtRU9QTk9UU1VQUDsKPiArI2VuZGlmCj4gKwo+ICAgICAgfQoK
UGxlYXNlIGRvbid0IGFkZCBhIGJsYW5rIGxpbmUgYWhlYWQgb2YgYSBjbG9zaW5nIGJyYWNlLgoK
SmFuCgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhl
bi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBz
Oi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
