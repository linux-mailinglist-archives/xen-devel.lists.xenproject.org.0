Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 654437CEFA
	for <lists+xen-devel@lfdr.de>; Wed, 31 Jul 2019 22:44:33 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hsvQQ-0004eM-4p; Wed, 31 Jul 2019 20:42:18 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=8Zog=V4=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hsvQO-0004eE-5M
 for xen-devel@lists.xenproject.org; Wed, 31 Jul 2019 20:42:16 +0000
X-Inumbo-ID: addce9b4-b3d3-11e9-8980-bc764e045a96
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTP
 id addce9b4-b3d3-11e9-8980-bc764e045a96;
 Wed, 31 Jul 2019 20:42:14 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 66EBD344;
 Wed, 31 Jul 2019 13:42:14 -0700 (PDT)
Received: from [10.37.9.90] (unknown [10.37.9.90])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C50D83F694;
 Wed, 31 Jul 2019 13:42:13 -0700 (PDT)
To: Stefano Stabellini <sstabellini@kernel.org>
References: <20190722213958.5761-1-julien.grall@arm.com>
 <20190722213958.5761-33-julien.grall@arm.com>
 <alpine.DEB.2.21.1907301414070.28600@sstabellini-ThinkPad-T480s>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <3271663c-c209-dea0-824f-ac68c412a7c1@arm.com>
Date: Wed, 31 Jul 2019 21:42:12 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.21.1907301414070.28600@sstabellini-ThinkPad-T480s>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v2 32/35] xen/arm32: head: Rework and
 document setup_fixmap()
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
Cc: xen-devel@lists.xenproject.org,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgU3RlZmFubywKCk9uIDcvMzAvMTkgMTA6MTQgUE0sIFN0ZWZhbm8gU3RhYmVsbGluaSB3cm90
ZToKPiBPbiBNb24sIDIyIEp1bCAyMDE5LCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4+IEF0IHRoZSBt
b21lbnQsIHRoZSBmaXhtYXAgdGFibGUgaXMgb25seSBob29rZWQgd2hlbiBlYXJseXByaW50ayBp
cyB1c2VkLgo+PiBUaGlzIGlzIGZpbmUgdG9kYXkgYmVjYXVzZSBpbiBDIGxhbmQsIHRoZSBmaXht
YXAgaXMgbm90IHVzZWQgYnkgYW55b25lCj4+IHVudGlsIHRoZSB0aGUgYm9vdCBDUFUgaXMgc3dp
dGNoaW5nIHRvIHRoZSBydW50aW1lIHBhZ2UtdGFibGVzLgo+Pgo+PiBJbiB0aGUgZnV0dXJlLCB0
aGUgYm9vdCBDUFUgd2lsbCBub3Qgc3dpdGNoIGJldHdlZW4gcGFnZS10YWJsZXMgdG8KPj4gYXZv
aWQgVExCIGluY29oZXJlbmN5LiBUaHVzLCB0aGUgZml4bWFwIHRhYmxlIHdpbGwgbmVlZCB0byBi
ZSBhbHdheXMKPj4gaG9va2VkIGJlb2ZyZSBhbnkgdXNlLiBMZXQncyBzdGFydCBkb2luZyBpdCBu
b3cgaW4gc2V0dXBfZml4bWFwKCkuCj4+Cj4+IExhc3RseSwgZG9jdW1lbnQgdGhlIGJlaGF2aW9y
IGFuZCB0aGUgbWFpbiByZWdpc3RlcnMgdXNhZ2Ugd2l0aGluIHRoZQo+PiBmdW5jdGlvbi4KPj4K
Pj4gU2lnbmVkLW9mZi1ieTogSnVsaWVuIEdyYWxsIDxqdWxpZW4uZ3JhbGxAYXJtLmNvbT4KPj4K
Pj4gLS0tCj4+ICAgICAgQ2hhbmdlcyBpbiB2MjoKPj4gICAgICAgICAgLSBQYXRjaCBhZGRlZAo+
PiAtLS0KPj4gICB4ZW4vYXJjaC9hcm0vYXJtMzIvaGVhZC5TIHwgMTkgKysrKysrKysrKysrKysr
Ky0tLQo+PiAgIDEgZmlsZSBjaGFuZ2VkLCAxNiBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygt
KQo+Pgo+PiBkaWZmIC0tZ2l0IGEveGVuL2FyY2gvYXJtL2FybTMyL2hlYWQuUyBiL3hlbi9hcmNo
L2FybS9hcm0zMi9oZWFkLlMKPj4gaW5kZXggNTZlMmQwOWVkNC4uZTBmOGMyZTBjYiAxMDA2NDQK
Pj4gLS0tIGEveGVuL2FyY2gvYXJtL2FybTMyL2hlYWQuUwo+PiArKysgYi94ZW4vYXJjaC9hcm0v
YXJtMzIvaGVhZC5TCj4+IEBAIC01MzYsOCArNTM2LDIxIEBAIGlkZW50aXR5X21hcHBpbmdfcmVt
b3ZlZDoKPj4gICAgICAgICAgIG1vdiAgIHBjLCBscgo+PiAgIEVORFBST0MocmVtb3ZlX2lkZW50
aXR5X21hcHBpbmcpCj4+ICAgCj4+ICsvKgo+PiArICogTWFwIHRoZSBVQVJUIGluIHRoZSBmaXht
YXAgKHdoZW4gZWFybHlwcmludGsgaXMgdXNlZCkgYW5kIGhvb2sgdGhlCj4+ICsgKiBmaXhtYXAg
dGFibGUgaW4gdGhlIHBhZ2UgdGFibGVzLgo+PiArICoKPj4gKyAqIFRoZSBmaXhtYXAgY2Fubm90
IGJlIG1hcHBlZCBpbiBjcmVhdGVfcGFnZV90YWJsZXMgYmVjYXVzZSBpdCBtYXkKPj4gKyAqIGNs
YXNoIHdpdGggdGhlIDE6MSBtYXBwaW5nLgo+PiArICoKPj4gKyAqIElucHV0czoKPj4gKyAqICAg
cjEwOiBQaHlzaWNhbCBvZmZzZXQKPj4gKyAqICAgcjExOiBFYXJseSBVQVJUIGJhc2UgcGh5c2lj
YWwgYWRkcmVzcwo+PiArICoKPj4gKyAqIENsb2JiZXJzIHIxIC0gcjQKPj4gKyAqLwo+PiAgIHNl
dHVwX2ZpeG1hcDoKPj4gLSNpZiBkZWZpbmVkKENPTkZJR19FQVJMWV9QUklOVEspIC8qIEZpeG1h
cCBpcyBvbmx5IHVzZWQgYnkgZWFybHkgcHJpbnRrICovCj4+ICsjaWYgZGVmaW5lZChDT05GSUdf
RUFSTFlfUFJJTlRLKQo+PiAgICAgICAgICAgLyogQWRkIFVBUlQgdG8gdGhlIGZpeG1hcCB0YWJs
ZSAqLwo+PiAgICAgICAgICAgbGRyICAgcjEsID14ZW5fZml4bWFwICAgICAgICAvKiByMSA6PSB2
YWRkciAoeGVuX2ZpeG1hcCkgKi8KPj4gICAgICAgICAgIGxzciAgIHIyLCByMTEsICNUSElSRF9T
SElGVAo+PiBAQCAtNTQ2LDcgKzU1OSw3IEBAIHNldHVwX2ZpeG1hcDoKPj4gICAgICAgICAgIG9y
ciAgIHIyLCByMiwgI1BUX0xPV0VSKERFVl9MMykgLyogcjI6cjMgOj0gNEsgZGV2IG1hcCBpbmNs
dWRpbmcgVUFSVCAqLwo+PiAgICAgICAgICAgbW92ICAgcjMsICMweDAKPj4gICAgICAgICAgIHN0
cmQgIHIyLCByMywgW3IxLCAjKEZJWE1BUF9DT05TT0xFKjgpXSAvKiBNYXAgaXQgaW4gdGhlIGZp
cnN0IGZpeG1hcCdzIHNsb3QgKi8KPj4gLTE6Cj4+ICsjZW5kaWYKPiAKPiBQYXRjaCBpcyBPSy4g
SG93ZXZlciwgdGhlIDE6IHNob3VsZCBiZSByZW1vdmVkIGluIHRoZSBwcmV2aW91cyBwYXRjaAo+
ICJ4ZW4vYXJtMzI6IGhlYWQ6IERvbid0IHNldHVwIHRoZSBmaXhtYXAgb24gc2Vjb25kYXJ5IENQ
VXMiLCB3aGVyZSB3ZQo+IHRvb2sgYXdheSB0aGUgYmVxLgoKR29vZCBwb2ludC4gSSBoYXZlIG5v
dyBtb3ZlZCB0aGlzIHRvIHRoZSBwcmV2aW91cyBwYXRjaC4KCj4gCj4gUmV2aWV3ZWQtYnk6IFN0
ZWZhbm8gU3RhYmVsbGluaSA8c3N0YWJlbGxpbmlAa2VybmVsLm9yZz4KClRoYW5rIHlvdSEKCkNo
ZWVycywKCi0tIApKdWxpZW4gR3JhbGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhl
bnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5m
by94ZW4tZGV2ZWw=
