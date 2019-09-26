Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 83A73BF418
	for <lists+xen-devel@lfdr.de>; Thu, 26 Sep 2019 15:32:07 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iDTpb-0007TP-UL; Thu, 26 Sep 2019 13:29:15 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=breC=XV=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iDTpa-0007Sf-Me
 for xen-devel@lists.xenproject.org; Thu, 26 Sep 2019 13:29:14 +0000
X-Inumbo-ID: a140bdce-e061-11e9-9654-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by localhost (Halon) with ESMTPS
 id a140bdce-e061-11e9-9654-12813bfff9fa;
 Thu, 26 Sep 2019 13:29:13 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id ECEB5AF5D;
 Thu, 26 Sep 2019 13:29:12 +0000 (UTC)
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <aa62726c-5aa4-8bcd-dc35-61eb8dfeaee3@suse.com>
 <c5d2eaf3-77f6-f87e-6898-c4c475f607c1@suse.com>
 <740443e0-bf92-a9b7-df31-004b269ed2ff@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <f306146b-5c90-b1da-7e42-afdbb035a80e@suse.com>
Date: Thu, 26 Sep 2019 15:29:14 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <740443e0-bf92-a9b7-df31-004b269ed2ff@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v6 8/8] AMD/IOMMU: pre-fill all DTEs right
 after table allocation
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjUuMDkuMjAxOSAxNjo1OSwgQW5kcmV3IENvb3BlciB3cm90ZToKPiBPbiAxOS8wOS8yMDE5
IDE0OjI1LCBKYW4gQmV1bGljaCB3cm90ZToKPj4gTWFrZSBzdXJlIHdlIGRvbid0IGxlYXZlIGFu
eSBEVEVzIHVuZXhwZWN0ZWQgcmVxdWVzdHMgdGhyb3VnaCB3aGljaAo+PiB3b3VsZCBiZSBwYXNz
ZWQgdGhyb3VnaCB1bnRyYW5zbGF0ZWQuIFNldCBWIGFuZCBJViByaWdodCBhd2F5ICh3aXRoCj4+
IGFsbCBvdGhlciBmaWVsZHMgbGVmdCBhcyB6ZXJvKSwgcmVseWluZyBvbiB0aGUgViBhbmQvb3Ig
SVYgYml0cwo+PiBnZXR0aW5nIGNsZWFyZWQgb25seSBieSBhbWRfaW9tbXVfc2V0X3Jvb3RfcGFn
ZV90YWJsZSgpIGFuZAo+PiBhbWRfaW9tbXVfc2V0X2ludHJlbWFwX3RhYmxlKCkgdW5kZXIgc3Bl
Y2lhbCBwYXNzLXRocm91Z2ggY2lyY3Vtc3RhbmNlcy4KPj4gU3dpdGNoIGJhY2sgdG8gaW5pdGlh
bCBzZXR0aW5ncyBpbiBhbWRfaW9tbXVfZGlzYWJsZV9kb21haW5fZGV2aWNlKCkuCj4+Cj4+IFRh
a2UgdGhlIGxpYmVydHkgYW5kIGFsc28gbWFrZSB0aGUgbGF0dGVyIGZ1bmN0aW9uIHN0YXRpYywg
Y29uc3RpZnlpbmcKPj4gaXRzIGZpcnN0IHBhcmFtZXRlciBhdCB0aGUgc2FtZSB0aW1lLCBhdCB0
aGlzIG9jY2FzaW9uLgo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hA
c3VzZS5jb20+Cj4+IC0tLQo+PiB2NjogTmV3Lgo+Pgo+PiAtLS0KPj4gIHhlbi9kcml2ZXJzL3Bh
c3N0aHJvdWdoL2FtZC9pb21tdV9pbml0LmMgICAgfCAgIDIyICsrKysrKysrKysrKysrKysrKyst
LS0KPj4gIHhlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL2FtZC9wY2lfYW1kX2lvbW11LmMgfCAgIDIw
ICsrKysrKysrKysrKysrKystLS0tCj4+ICAyIGZpbGVzIGNoYW5nZWQsIDM1IGluc2VydGlvbnMo
KyksIDcgZGVsZXRpb25zKC0pCj4+Cj4+IC0tLSBhL3hlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL2Ft
ZC9pb21tdV9pbml0LmMKPj4gKysrIGIveGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvYW1kL2lvbW11
X2luaXQuYwo+PiBAQCAtMTI1NSwxMiArMTI1NSwyOCBAQCBzdGF0aWMgaW50IF9faW5pdCBhbWRf
aW9tbXVfc2V0dXBfZGV2aWNlCj4+ICAKPj4gICAgICBpZiAoICFkdCApCj4+ICAgICAgewo+PiAr
ICAgICAgICB1bnNpZ25lZCBpbnQgc2l6ZSA9IGR0X2FsbG9jX3NpemUoKTsKPj4gKwo+PiAgICAg
ICAgICAvKiBhbGxvY2F0ZSAnZGV2aWNlIHRhYmxlJyBvbiBhIDRLIGJvdW5kYXJ5ICovCj4+ICAg
ICAgICAgIGR0ID0gSVZSU19NQVBQSU5HU19ERVZUQUIoaXZyc19tYXBwaW5ncykgPQo+PiAtICAg
ICAgICAgICAgYWxsb2NhdGVfYnVmZmVyKGR0X2FsbG9jX3NpemUoKSwgIkRldmljZSBUYWJsZSIp
Owo+PiArICAgICAgICAgICAgYWxsb2NhdGVfYnVmZmVyKHNpemUsICJEZXZpY2UgVGFibGUiKTsK
Pj4gKyAgICAgICAgaWYgKCAhZHQgKQo+PiArICAgICAgICAgICAgcmV0dXJuIC1FTk9NRU07Cj4+
ICsKPj4gKyAgICAgICAgLyoKPj4gKyAgICAgICAgICogUHJlZmlsbCBldmVyeSBEVEUgc3VjaCB0
aGF0IGFsbCBraW5kcyBvZiByZXF1ZXN0cyB3aWxsIGdldCBhYm9ydGVkLgo+PiArICAgICAgICAg
KiBCZXNpZGVzIHRoZSB0d28gYml0cyBzZXQgdG8gdHJ1ZSBiZWxvdyB0aGlzIGJ1aWxkcyB1cG9u
Cj4+ICsgICAgICAgICAqIElPTU1VX0RFVl9UQUJMRV9TWVNfTUdUX0RNQV9BQk9SVEVELAo+PiAr
ICAgICAgICAgKiBJT01NVV9ERVZfVEFCTEVfSU9fQ09OVFJPTF9BQk9SVEVELCBhcyB3ZWxsIGFz
Cj4+ICsgICAgICAgICAqIElPTU1VX0RFVl9UQUJMRV9JTlRfQ09OVFJPTF9BQk9SVEVEIGFsbCBi
ZWluZyB6ZXJvLCBhbmQgdXMgYWxzbwo+PiArICAgICAgICAgKiB3YW50aW5nIGF0IGxlYXN0IFRW
LCBHViwgSSwgYW5kIEVYIHNldCB0byBmYWxzZS4KPj4gKyAgICAgICAgICovCj4+ICsgICAgICAg
IGZvciAoIGJkZiA9IDAsIHNpemUgLz0gc2l6ZW9mKCpkdCk7IGJkZiA8IHNpemU7ICsrYmRmICkK
Pj4gKyAgICAgICAgewo+PiArICAgICAgICAgICAgZHRbYmRmXS52ID0gdHJ1ZTsKPj4gKyAgICAg
ICAgICAgIGR0W2JkZl0uaXYgPSB0cnVlOwo+PiArICAgICAgICB9Cj4gCj4gVGhlIERULUJBUiBp
cyBnZW5lcmFsbHkgMk1CIGluIHNpemUuwqAgSXQgaXMgaW5jb252ZW5pZW50IHRoYXQgd2UgZmly
c3QKPiB6ZXJvIGl0LCB0aGVuIHdhbGsgaXQgYSBzZWNvbmQgdGltZSBzZXR0aW5nIHR3byBiaXRz
Lgo+IAo+IEknbSBub3Qgc3VyZSB0aGF0IGFsbG9jYXRlX2J1ZmZlcigpIG5lZWRzIHRvIHplcm8g
bWVtb3J5IGZvciBhbnkgb2YgaXRzCj4gY2FsbGVycy7CoCBUaGUgY29tbWFuZCByaW5nIHdyaXRl
cyBhIGZ1bGwgZW50cnkgYXQgb25jZSwgYW5kIHRoZSBJT01NVQo+IHdyaXRlcyBmdWxsIGV2ZW50
L3BhZ2UgbG9ncyBhdCBvbmNlLgoKQnV0IGluIHRoZSBsYXR0ZXIgY2FzZSB3ZSBuZWVkIHRoZSB6
ZXJvaW5nIHRvIHdvcmsgYXJvdW5kIGVycmF0YSA3MzIKYW5kIDczMzsgc2VlIHBhcnNlX3tldmVu
dCxwcHJ9X2xvZ19lbnRyeSgpLgoKPiBEcm9wcGluZyB0aGUgbWVtc2V0KCkgYW5kIGNoYW5naW5n
IHRoaXMgdG8gYmUgYSBsb29wIG9mIHN0cnVjdHVyZQo+IGFzc2lnbm1lbnRzIHdvdWxkIGJlIHJh
dGhlciBtb3JlIGVmZmljaWVudC4KCkknbGwgYWRkIGEgYm9vbGVhbiBwYXJhbWV0ZXIgdG8gYWxs
b2NhdGVfYnVmZmVyKCkuCgpKYW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnBy
b2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94
ZW4tZGV2ZWw=
