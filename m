Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 117932427C
	for <lists+xen-devel@lfdr.de>; Mon, 20 May 2019 23:06:27 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hSpSQ-0003TH-BB; Mon, 20 May 2019 21:04:30 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=rume=TU=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1hSpSN-0003T7-Su
 for xen-devel@lists.xenproject.org; Mon, 20 May 2019 21:04:27 +0000
X-Inumbo-ID: d99be40b-7b42-11e9-8980-bc764e045a96
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id d99be40b-7b42-11e9-8980-bc764e045a96;
 Mon, 20 May 2019 21:04:26 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 9E80B2171F;
 Mon, 20 May 2019 21:04:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1558386265;
 bh=zxAiyadRWLvbiXgs8EcyXTBqyfYqqKEWDpqjfnGCXQs=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=mQDURanN3JW320UrvR0HdE5Z3PSKZ+5e4V3rvABnT2RPgZYfJgFdOnDpdHLuOwzOj
 3wdL53Rbp03X23+HXUXLHGwdf3FO4HRx+cY3zJ9bidHj745gQnq2ymyIVfkrh5sWUT
 f3omUBBFJfpc2K05ig9Qo4pm90wXlRauohNoEvf8=
Date: Mon, 20 May 2019 14:04:25 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Julien Grall <julien.grall@arm.com>
In-Reply-To: <8b742d07-d64c-54b1-4cb0-3ae6641c3c2f@arm.com>
Message-ID: <alpine.DEB.2.21.1905201404060.16404@sstabellini-ThinkPad-T480s>
References: <20190128155909.14289-1-julien.grall@arm.com>
 <alpine.DEB.2.10.1904161444520.1370@sstabellini-ThinkPad-X260>
 <1ba05c55-5449-98a9-713b-d932a1f21b4c@arm.com>
 <alpine.DEB.2.10.1904171006020.1370@sstabellini-ThinkPad-X260>
 <d36567cd-7c3e-3921-0355-77c55559d61b@arm.com>
 <alpine.DEB.2.10.1904171027290.1370@sstabellini-ThinkPad-X260>
 <8b742d07-d64c-54b1-4cb0-3ae6641c3c2f@arm.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
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
 Stefano Stabellini <sstabellini@kernel.org>, andrii.anisov@gmail.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gTW9uLCAyMCBNYXkgMjAxOSwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+IE9uIDE3LzA0LzIwMTkg
MTg6MjcsIFN0ZWZhbm8gU3RhYmVsbGluaSB3cm90ZToKPiA+IE9uIFdlZCwgMTcgQXByIDIwMTks
IEp1bGllbiBHcmFsbCB3cm90ZToKPiA+ID4gSGksCj4gPiA+IAo+ID4gPiBPbiAxNy8wNC8yMDE5
IDE4OjEyLCBTdGVmYW5vIFN0YWJlbGxpbmkgd3JvdGU6Cj4gPiA+ID4gT24gVHVlLCAxNiBBcHIg
MjAxOSwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+ID4gPiA+ID4gSGkgU3RlZmFubywKPiA+ID4gPiA+
IAo+ID4gPiA+ID4gT24gNC8xNi8xOSAxMDo1MSBQTSwgU3RlZmFubyBTdGFiZWxsaW5pIHdyb3Rl
Ogo+ID4gPiA+ID4gPiBPbiBNb24sIDI4IEphbiAyMDE5LCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4g
PiA+ID4gPiA+ID4gV2hpbGUgU1BJcyBhcmUgc2hhcmVkIGJldHdlZW4gQ1BVLCBpdCBpcyBub3Qg
cG9zc2libGUgdG8gcmVjZWl2ZQo+ID4gPiA+ID4gPiA+IHRoZQo+ID4gPiA+ID4gPiA+IHNhbWUg
aW50ZXJydXB0cyBvbiBhIGRpZmZlcmVudCBDUFUgd2hpbGUgdGhlIGludGVycnVwdCBpcyBpbgo+
ID4gPiA+ID4gPiA+IGFjdGl2ZQo+ID4gPiA+ID4gPiA+IHN0YXRlLiBUaGUgZGVhY3RpdmF0aW9u
IG9mIHRoZSBpbnRlcnJ1cHQgaXMgZG9uZSBhdCB0aGUgZW5kIG9mIHRoZQo+ID4gPiA+ID4gPiA+
IGhhbmRsaW5nLgo+ID4gPiA+ID4gPiA+IAo+ID4gPiA+ID4gPiA+IFRoaXMgbWVhbnMgdGhlIF9J
UlFfUEVORElORyBsb2dpYyBpcyB1bmVjZXNzYXJ5IG9uIEFybSBhcyBhIHNhbWUKPiA+ID4gPiA+
ID4gPiBpbnRlcnJ1cHQgY2FuIG5ldmVyIGNvbWUgdXAgd2hpbGUgaW4gdGhlIGxvb3AuIFNvIHJl
bW92ZSBpdCB0bwo+ID4gPiA+ID4gPiA+IHNpbXBsaWZ5IHRoZSBpbnRlcnJ1cHQgaGFuZGxlIGNv
ZGUuCj4gPiA+ID4gPiA+ID4gCj4gPiA+ID4gPiA+ID4gU2lnbmVkLW9mZi1ieTogSnVsaWVuIEdy
YWxsIDxqdWxpZW4uZ3JhbGxAYXJtLmNvbT4KPiA+ID4gPiA+ID4gPiAtLS0KPiA+ID4gPiA+ID4g
PiAgICAgeGVuL2FyY2gvYXJtL2lycS5jIHwgMzIgKysrKysrKysrKy0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0KPiA+ID4gPiA+ID4gPiAgICAgMSBmaWxlIGNoYW5nZWQsIDEwIGluc2VydGlvbnMoKyks
IDIyIGRlbGV0aW9ucygtKQo+ID4gPiA+ID4gPiA+IAo+ID4gPiA+ID4gPiA+IGRpZmYgLS1naXQg
YS94ZW4vYXJjaC9hcm0vaXJxLmMgYi94ZW4vYXJjaC9hcm0vaXJxLmMKPiA+ID4gPiA+ID4gPiBp
bmRleCBjNTFjZjMzM2NlLi4zODc3NjU3YTUyIDEwMDY0NAo+ID4gPiA+ID4gPiA+IC0tLSBhL3hl
bi9hcmNoL2FybS9pcnEuYwo+ID4gPiA+ID4gPiA+ICsrKyBiL3hlbi9hcmNoL2FybS9pcnEuYwo+
ID4gPiA+ID4gPiA+IEBAIC0xOTksNiArMTk5LDcgQEAgaW50IHJlcXVlc3RfaXJxKHVuc2lnbmVk
IGludCBpcnEsIHVuc2lnbmVkIGludAo+ID4gPiA+ID4gPiA+IGlycWZsYWdzLAo+ID4gPiA+ID4g
PiA+ICAgICB2b2lkIGRvX0lSUShzdHJ1Y3QgY3B1X3VzZXJfcmVncyAqcmVncywgdW5zaWduZWQg
aW50IGlycSwgaW50Cj4gPiA+ID4gPiA+ID4gaXNfZmlxKQo+ID4gPiA+ID4gPiA+ICAgICB7Cj4g
PiA+ID4gPiA+ID4gICAgICAgICBzdHJ1Y3QgaXJxX2Rlc2MgKmRlc2MgPSBpcnFfdG9fZGVzYyhp
cnEpOwo+ID4gPiA+ID4gPiA+ICsgICAgc3RydWN0IGlycWFjdGlvbiAqYWN0aW9uOwo+ID4gPiA+
ID4gPiA+ICAgICAgICAgICBwZXJmY19pbmNyKGlycXMpOwo+ID4gPiA+ID4gPiA+ICAgICBAQCAt
MjQyLDM1ICsyNDMsMjIgQEAgdm9pZCBkb19JUlEoc3RydWN0IGNwdV91c2VyX3JlZ3MgKnJlZ3Ms
Cj4gPiA+ID4gPiA+ID4gdW5zaWduZWQKPiA+ID4gPiA+ID4gPiBpbnQgaXJxLCBpbnQgaXNfZmlx
KQo+ID4gPiA+ID4gPiA+ICAgICAgICAgICAgIGdvdG8gb3V0X25vX2VuZDsKPiA+ID4gPiA+ID4g
PiAgICAgICAgIH0KPiA+ID4gPiA+ID4gPiAgICAgLSAgICBzZXRfYml0KF9JUlFfUEVORElORywg
JmRlc2MtPnN0YXR1cyk7Cj4gPiA+ID4gPiA+ID4gLQo+ID4gPiA+ID4gPiA+IC0gICAgLyoKPiA+
ID4gPiA+ID4gPiAtICAgICAqIFNpbmNlIHdlIHNldCBQRU5ESU5HLCBpZiBhbm90aGVyIHByb2Nl
c3NvciBpcyBoYW5kbGluZyBhCj4gPiA+ID4gPiA+ID4gZGlmZmVyZW50Cj4gPiA+ID4gPiA+ID4g
LSAgICAgKiBpbnN0YW5jZSBvZiB0aGlzIHNhbWUgaXJxLCB0aGUgb3RoZXIgcHJvY2Vzc29yIHdp
bGwgdGFrZQo+ID4gPiA+ID4gPiA+IGNhcmUKPiA+ID4gPiA+ID4gPiBvZgo+ID4gPiA+ID4gPiA+
IGl0Lgo+ID4gPiA+ID4gPiA+IC0gICAgICovCj4gPiA+ID4gPiA+ID4gLSAgICBpZiAoIHRlc3Rf
Yml0KF9JUlFfRElTQUJMRUQsICZkZXNjLT5zdGF0dXMpIHx8Cj4gPiA+ID4gPiA+ID4gLSAgICAg
ICAgIHRlc3RfYml0KF9JUlFfSU5QUk9HUkVTUywgJmRlc2MtPnN0YXR1cykgKQo+ID4gPiA+ID4g
PiA+ICsgICAgaWYgKCB0ZXN0X2JpdChfSVJRX0RJU0FCTEVELCAmZGVzYy0+c3RhdHVzKSApCj4g
PiA+ID4gPiA+ID4gICAgICAgICAgICAgZ290byBvdXQ7Cj4gPiA+ID4gPiA+IAo+ID4gPiA+ID4g
PiBJdCBpcyBhIGdvb2QgaWRlYSB0byByZW1vdmUgdGhlIElSUV9QRU5ESU5HIGxvZ2ljLCB0aGF0
IGlzIE9LLgo+ID4gPiA+ID4gPiAKPiA+ID4gPiA+ID4gCj4gPiA+ID4gPiA+IEhvd2V2ZXIsIGFy
ZSB3ZSBzdXJlIHRoYXQgd2Ugd2FudCB0byByZW1vdmUgdGhlIF9JUlFfSU5QUk9HUkVTUwo+ID4g
PiA+ID4gPiBjaGVjawo+ID4gPiA+ID4gPiB0b28/IElSUSBoYW5kbGVycyBzaG91bGRuJ3QgYmUg
Y2FsbGVkIHR3aWNlIGluIGEgcm93LiBHaXZlbiB0aGF0Cj4gPiA+ID4gPiA+IF9JUlFfSU5QUk9H
UkVTUyBjYW4gYmUgc2V0IG1hbnVhbGx5IChnaWN2Ml9zZXRfYWN0aXZlX3N0YXRlKSBpdAo+ID4g
PiA+ID4gPiBzZWVtcyBpdAo+ID4gPiA+ID4gPiB3b3VsZCBiZSBhIGdvb2QgaWRlYSB0byBrZWVw
IHRoZSBjaGVjayBhbnl3YXk/Cj4gPiA+ID4gPiAKPiA+ID4gPiA+IHNldF9hY3RpdmVfc3RhdGUg
aXMgb25seSB1c2VkIGJ5IHRoZSB2R0lDIHRvIHJlcGxpY2F0ZSBzdGF0ZSBmcm9tIG9mCj4gPiA+
ID4gPiB0aGUKPiA+ID4gPiA+IHZpcnR1YWwgaW50ZXJydXB0IHRvIHRoZSBwaHlzaWNhbCBpbnRl
cnJ1cHQuIFdlIGRvbid0IGhhdmUgdGhlIHZpcnR1YWwKPiA+ID4gPiA+IGludGVycnVwdCBpbiB0
aGlzIHBhdGggKHNlZSBhYm92ZSkuCj4gPiA+ID4gPiAKPiA+ID4gPiA+IEFueSBvdGhlciB1c2Vy
IChlLmcgaW50ZXJydXB0cyByb3V0ZWQgdG8gWGVuKSB3b3VsZCBiZSBwcmV0dHkgYnJva2VuLgo+
ID4gPiA+ID4gQXQKPiA+ID4gPiA+IGJlc3QKPiA+ID4gPiA+IHlvdSB3b3VsZCBicmVhayB0aGUg
aW50ZXJydXB0IGZsb3cuIEF0IHdvcnN0LCB5b3UgbWF5IG5ldmVyIHJlY2VpdmUKPiA+ID4gPiA+
IHRoZQo+ID4gPiA+ID4gaW50ZXJydXB0IGFnYWluLgo+ID4gPiA+ID4gCj4gPiA+ID4gPiBTbyBJ
IHRoaW5rIHdlIGNhbiBkcm9wIF9JUlFfUFJPR1JFU1MgaGVyZS4KPiA+ID4gPiAKPiA+ID4gPiBJ
IGdhdmUgaXQgYSBjbG9zZSBsb29rLiBZb3UgYXJlIHJpZ2h0LCBpdCBpcyBzYWZlIHRvIHJlbW92
ZSB0aGUKPiA+ID4gPiBfSVJRX1BST0dSRVNTIGNoZWNrIGhlcmUuCj4gPiA+ID4gCj4gPiA+ID4g
UmV2aWV3ZWQtYnk6IFN0ZWZhbm8gU3RhYmVsbGluaSA8c3N0YWJlbGxpbmlAa2VybmVsLm9yZz4K
PiA+ID4gPiAKPiA+ID4gPiAKPiA+ID4gPiBUaGUgdGhpbmcgdGhhdCB3b3JyaWVzIG1lIGEgYml0
IGlzIHRoYXQgdGVjaG5pY2FsbHkgc2V0X2FjdGl2ZV9zdGF0ZSBpcwo+ID4gPiA+IHBhcnQgb2Yg
dGhlIGdpY19od19vcGVyYXRpb25zIGZ1bmN0aW9ucyB3aGljaCBhcmUgbm90IG5lY2Vzc2FyaWx5
IGd1ZXN0Cj4gPiA+ID4gc3BlY2lmaWM6IHdlIGhhdmVuJ3Qgd3JpdHRlbiBkb3duIGFueXdoZXJl
IHRoYXQgc2V0X2FjdGl2ZV9zdGF0ZSBjYW5ub3QKPiA+ID4gPiBiZSBjYWxsZWQgcGFzc2luZyBv
bmUgb2YgdGhlIHhlbiBpcnFzIGFzIHBhcmFtZXRlci4gSSBhZ3JlZSBpdCB3b3VsZCBiZQo+ID4g
PiA+IGJyb2tlbiB0byBkbyBzbywgYnV0IHN0aWxsLi4uIE1heWJlIHdlIHNob3VsZCBhZGQgYSBj
b21tZW50Pwo+ID4gPiAKPiA+ID4gSG93IGFib3V0IGFkZGluZyBhbiBBU1NFUlQodGVzdF9iaXQo
X0lSUV9HVUVTVCwgJmRlc2MtPnN0YXR1cykpID8KPiA+IAo+ID4gZXZlbiBiZXR0ZXIKPiAKPiBE
byB5b3Ugd2FudCB0aGUgY2hhbmdlIHRvIGJlIGluIHRoaXMgcGF0Y2ggb3Igc2VwYXJhdGVseT8K
CkluIHRoaXMgcGF0Y2ggcGxlYXNlCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5w
cm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8v
eGVuLWRldmVs
