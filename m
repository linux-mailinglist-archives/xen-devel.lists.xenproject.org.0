Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DC19423BD6
	for <lists+xen-devel@lfdr.de>; Mon, 20 May 2019 17:17:50 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hSk0I-0003iE-Q7; Mon, 20 May 2019 15:15:06 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=DuAc=TU=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hSk0H-0003i1-CA
 for xen-devel@lists.xenproject.org; Mon, 20 May 2019 15:15:05 +0000
X-Inumbo-ID: 0b1d8f82-7b12-11e9-8980-bc764e045a96
Received: from foss.arm.com (unknown [217.140.101.70])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTP
 id 0b1d8f82-7b12-11e9-8980-bc764e045a96;
 Mon, 20 May 2019 15:15:03 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 747E480D;
 Mon, 20 May 2019 08:15:03 -0700 (PDT)
Received: from [10.1.196.50] (e108454-lin.cambridge.arm.com [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id AA6FF3F575;
 Mon, 20 May 2019 08:15:02 -0700 (PDT)
To: Stefano Stabellini <sstabellini@kernel.org>
References: <20190128155909.14289-1-julien.grall@arm.com>
 <alpine.DEB.2.10.1904161444520.1370@sstabellini-ThinkPad-X260>
 <1ba05c55-5449-98a9-713b-d932a1f21b4c@arm.com>
 <alpine.DEB.2.10.1904171006020.1370@sstabellini-ThinkPad-X260>
 <d36567cd-7c3e-3921-0355-77c55559d61b@arm.com>
 <alpine.DEB.2.10.1904171027290.1370@sstabellini-ThinkPad-X260>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <8b742d07-d64c-54b1-4cb0-3ae6641c3c2f@arm.com>
Date: Mon, 20 May 2019 16:15:01 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.10.1904171027290.1370@sstabellini-ThinkPad-X260>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH for-next] xen/arm: irq: Don't use
 _IRQ_PENDING when handling host interrupt
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
Cc: xen-devel@lists.xenproject.org, andre.przywara@arm.com,
 andrii.anisov@gmail.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgU3RlZmFubywKCk9uIDE3LzA0LzIwMTkgMTg6MjcsIFN0ZWZhbm8gU3RhYmVsbGluaSB3cm90
ZToKPiBPbiBXZWQsIDE3IEFwciAyMDE5LCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4+IEhpLAo+Pgo+
PiBPbiAxNy8wNC8yMDE5IDE4OjEyLCBTdGVmYW5vIFN0YWJlbGxpbmkgd3JvdGU6Cj4+PiBPbiBU
dWUsIDE2IEFwciAyMDE5LCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4+Pj4gSGkgU3RlZmFubywKPj4+
Pgo+Pj4+IE9uIDQvMTYvMTkgMTA6NTEgUE0sIFN0ZWZhbm8gU3RhYmVsbGluaSB3cm90ZToKPj4+
Pj4gT24gTW9uLCAyOCBKYW4gMjAxOSwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+Pj4+Pj4gV2hpbGUg
U1BJcyBhcmUgc2hhcmVkIGJldHdlZW4gQ1BVLCBpdCBpcyBub3QgcG9zc2libGUgdG8gcmVjZWl2
ZSB0aGUKPj4+Pj4+IHNhbWUgaW50ZXJydXB0cyBvbiBhIGRpZmZlcmVudCBDUFUgd2hpbGUgdGhl
IGludGVycnVwdCBpcyBpbiBhY3RpdmUKPj4+Pj4+IHN0YXRlLiBUaGUgZGVhY3RpdmF0aW9uIG9m
IHRoZSBpbnRlcnJ1cHQgaXMgZG9uZSBhdCB0aGUgZW5kIG9mIHRoZQo+Pj4+Pj4gaGFuZGxpbmcu
Cj4+Pj4+Pgo+Pj4+Pj4gVGhpcyBtZWFucyB0aGUgX0lSUV9QRU5ESU5HIGxvZ2ljIGlzIHVuZWNl
c3Nhcnkgb24gQXJtIGFzIGEgc2FtZQo+Pj4+Pj4gaW50ZXJydXB0IGNhbiBuZXZlciBjb21lIHVw
IHdoaWxlIGluIHRoZSBsb29wLiBTbyByZW1vdmUgaXQgdG8KPj4+Pj4+IHNpbXBsaWZ5IHRoZSBp
bnRlcnJ1cHQgaGFuZGxlIGNvZGUuCj4+Pj4+Pgo+Pj4+Pj4gU2lnbmVkLW9mZi1ieTogSnVsaWVu
IEdyYWxsIDxqdWxpZW4uZ3JhbGxAYXJtLmNvbT4KPj4+Pj4+IC0tLQo+Pj4+Pj4gICAgIHhlbi9h
cmNoL2FybS9pcnEuYyB8IDMyICsrKysrKysrKystLS0tLS0tLS0tLS0tLS0tLS0tLS0tCj4+Pj4+
PiAgICAgMSBmaWxlIGNoYW5nZWQsIDEwIGluc2VydGlvbnMoKyksIDIyIGRlbGV0aW9ucygtKQo+
Pj4+Pj4KPj4+Pj4+IGRpZmYgLS1naXQgYS94ZW4vYXJjaC9hcm0vaXJxLmMgYi94ZW4vYXJjaC9h
cm0vaXJxLmMKPj4+Pj4+IGluZGV4IGM1MWNmMzMzY2UuLjM4Nzc2NTdhNTIgMTAwNjQ0Cj4+Pj4+
PiAtLS0gYS94ZW4vYXJjaC9hcm0vaXJxLmMKPj4+Pj4+ICsrKyBiL3hlbi9hcmNoL2FybS9pcnEu
Ywo+Pj4+Pj4gQEAgLTE5OSw2ICsxOTksNyBAQCBpbnQgcmVxdWVzdF9pcnEodW5zaWduZWQgaW50
IGlycSwgdW5zaWduZWQgaW50Cj4+Pj4+PiBpcnFmbGFncywKPj4+Pj4+ICAgICB2b2lkIGRvX0lS
UShzdHJ1Y3QgY3B1X3VzZXJfcmVncyAqcmVncywgdW5zaWduZWQgaW50IGlycSwgaW50Cj4+Pj4+
PiBpc19maXEpCj4+Pj4+PiAgICAgewo+Pj4+Pj4gICAgICAgICBzdHJ1Y3QgaXJxX2Rlc2MgKmRl
c2MgPSBpcnFfdG9fZGVzYyhpcnEpOwo+Pj4+Pj4gKyAgICBzdHJ1Y3QgaXJxYWN0aW9uICphY3Rp
b247Cj4+Pj4+PiAgICAgICAgICAgcGVyZmNfaW5jcihpcnFzKTsKPj4+Pj4+ICAgICBAQCAtMjQy
LDM1ICsyNDMsMjIgQEAgdm9pZCBkb19JUlEoc3RydWN0IGNwdV91c2VyX3JlZ3MgKnJlZ3MsCj4+
Pj4+PiB1bnNpZ25lZAo+Pj4+Pj4gaW50IGlycSwgaW50IGlzX2ZpcSkKPj4+Pj4+ICAgICAgICAg
ICAgIGdvdG8gb3V0X25vX2VuZDsKPj4+Pj4+ICAgICAgICAgfQo+Pj4+Pj4gICAgIC0gICAgc2V0
X2JpdChfSVJRX1BFTkRJTkcsICZkZXNjLT5zdGF0dXMpOwo+Pj4+Pj4gLQo+Pj4+Pj4gLSAgICAv
Kgo+Pj4+Pj4gLSAgICAgKiBTaW5jZSB3ZSBzZXQgUEVORElORywgaWYgYW5vdGhlciBwcm9jZXNz
b3IgaXMgaGFuZGxpbmcgYQo+Pj4+Pj4gZGlmZmVyZW50Cj4+Pj4+PiAtICAgICAqIGluc3RhbmNl
IG9mIHRoaXMgc2FtZSBpcnEsIHRoZSBvdGhlciBwcm9jZXNzb3Igd2lsbCB0YWtlIGNhcmUKPj4+
Pj4+IG9mCj4+Pj4+PiBpdC4KPj4+Pj4+IC0gICAgICovCj4+Pj4+PiAtICAgIGlmICggdGVzdF9i
aXQoX0lSUV9ESVNBQkxFRCwgJmRlc2MtPnN0YXR1cykgfHwKPj4+Pj4+IC0gICAgICAgICB0ZXN0
X2JpdChfSVJRX0lOUFJPR1JFU1MsICZkZXNjLT5zdGF0dXMpICkKPj4+Pj4+ICsgICAgaWYgKCB0
ZXN0X2JpdChfSVJRX0RJU0FCTEVELCAmZGVzYy0+c3RhdHVzKSApCj4+Pj4+PiAgICAgICAgICAg
ICBnb3RvIG91dDsKPj4+Pj4KPj4+Pj4gSXQgaXMgYSBnb29kIGlkZWEgdG8gcmVtb3ZlIHRoZSBJ
UlFfUEVORElORyBsb2dpYywgdGhhdCBpcyBPSy4KPj4+Pj4KPj4+Pj4KPj4+Pj4gSG93ZXZlciwg
YXJlIHdlIHN1cmUgdGhhdCB3ZSB3YW50IHRvIHJlbW92ZSB0aGUgX0lSUV9JTlBST0dSRVNTIGNo
ZWNrCj4+Pj4+IHRvbz8gSVJRIGhhbmRsZXJzIHNob3VsZG4ndCBiZSBjYWxsZWQgdHdpY2UgaW4g
YSByb3cuIEdpdmVuIHRoYXQKPj4+Pj4gX0lSUV9JTlBST0dSRVNTIGNhbiBiZSBzZXQgbWFudWFs
bHkgKGdpY3YyX3NldF9hY3RpdmVfc3RhdGUpIGl0IHNlZW1zIGl0Cj4+Pj4+IHdvdWxkIGJlIGEg
Z29vZCBpZGVhIHRvIGtlZXAgdGhlIGNoZWNrIGFueXdheT8KPj4+Pgo+Pj4+IHNldF9hY3RpdmVf
c3RhdGUgaXMgb25seSB1c2VkIGJ5IHRoZSB2R0lDIHRvIHJlcGxpY2F0ZSBzdGF0ZSBmcm9tIG9m
IHRoZQo+Pj4+IHZpcnR1YWwgaW50ZXJydXB0IHRvIHRoZSBwaHlzaWNhbCBpbnRlcnJ1cHQuIFdl
IGRvbid0IGhhdmUgdGhlIHZpcnR1YWwKPj4+PiBpbnRlcnJ1cHQgaW4gdGhpcyBwYXRoIChzZWUg
YWJvdmUpLgo+Pj4+Cj4+Pj4gQW55IG90aGVyIHVzZXIgKGUuZyBpbnRlcnJ1cHRzIHJvdXRlZCB0
byBYZW4pIHdvdWxkIGJlIHByZXR0eSBicm9rZW4uIEF0Cj4+Pj4gYmVzdAo+Pj4+IHlvdSB3b3Vs
ZCBicmVhayB0aGUgaW50ZXJydXB0IGZsb3cuIEF0IHdvcnN0LCB5b3UgbWF5IG5ldmVyIHJlY2Vp
dmUgdGhlCj4+Pj4gaW50ZXJydXB0IGFnYWluLgo+Pj4+Cj4+Pj4gU28gSSB0aGluayB3ZSBjYW4g
ZHJvcCBfSVJRX1BST0dSRVNTIGhlcmUuCj4+Pgo+Pj4gSSBnYXZlIGl0IGEgY2xvc2UgbG9vay4g
WW91IGFyZSByaWdodCwgaXQgaXMgc2FmZSB0byByZW1vdmUgdGhlCj4+PiBfSVJRX1BST0dSRVNT
IGNoZWNrIGhlcmUuCj4+Pgo+Pj4gUmV2aWV3ZWQtYnk6IFN0ZWZhbm8gU3RhYmVsbGluaSA8c3N0
YWJlbGxpbmlAa2VybmVsLm9yZz4KPj4+Cj4+Pgo+Pj4gVGhlIHRoaW5nIHRoYXQgd29ycmllcyBt
ZSBhIGJpdCBpcyB0aGF0IHRlY2huaWNhbGx5IHNldF9hY3RpdmVfc3RhdGUgaXMKPj4+IHBhcnQg
b2YgdGhlIGdpY19od19vcGVyYXRpb25zIGZ1bmN0aW9ucyB3aGljaCBhcmUgbm90IG5lY2Vzc2Fy
aWx5IGd1ZXN0Cj4+PiBzcGVjaWZpYzogd2UgaGF2ZW4ndCB3cml0dGVuIGRvd24gYW55d2hlcmUg
dGhhdCBzZXRfYWN0aXZlX3N0YXRlIGNhbm5vdAo+Pj4gYmUgY2FsbGVkIHBhc3Npbmcgb25lIG9m
IHRoZSB4ZW4gaXJxcyBhcyBwYXJhbWV0ZXIuIEkgYWdyZWUgaXQgd291bGQgYmUKPj4+IGJyb2tl
biB0byBkbyBzbywgYnV0IHN0aWxsLi4uIE1heWJlIHdlIHNob3VsZCBhZGQgYSBjb21tZW50Pwo+
Pgo+PiBIb3cgYWJvdXQgYWRkaW5nIGFuIEFTU0VSVCh0ZXN0X2JpdChfSVJRX0dVRVNULCAmZGVz
Yy0+c3RhdHVzKSkgPwo+IAo+IGV2ZW4gYmV0dGVyCgpEbyB5b3Ugd2FudCB0aGUgY2hhbmdlIHRv
IGJlIGluIHRoaXMgcGF0Y2ggb3Igc2VwYXJhdGVseT8KCkNoZWVycywKCi0tIApKdWxpZW4gR3Jh
bGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1k
ZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8v
bGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
